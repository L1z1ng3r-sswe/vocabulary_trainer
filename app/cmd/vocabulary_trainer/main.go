package main

import (
	"context"
	"flag"
	"log"
	"os"
	"os/signal"
	"syscall"

	repository_postgres_vocabulary "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/adapters/repository/postgres/vocabulary"
	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/adapters/telegram_bot"
	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"
	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
	infrastructure_converter "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/infrastructure/persistence/converter"
	infrastructure_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/infrastructure/persistence/db/postgres"
	"go.uber.org/fx"
)

var (
	envExecFlag string
)

// init initializes the environment flag for the application.
func init() {
	flag.StringVar(&envExecFlag, "env", "local", "specify the environment (local, dev or prod)")
}

func main() {
	flag.Parse()

	app := fx.New(
		fx.Provide(
			// Load configuration based on the specified environment.
			func() (*config.Config, error) {
				return config.LoadConfig(envExecFlag)
			},

			// Initialize PostgreSQL client.
			infrastructure_postgres.New,

			// Provide the DB executor for database operations.
			func(cl domain_postgres.Client) domain_postgres.Executor {
				return cl.DBExecutor()
			},

			// Provide the transaction manager for database transactions.
			func(cl domain_postgres.Client) domain_postgres.Transactor {
				return cl.DBTx()
			},

			// Provide the transaction manager implementation.
			infrastructure_postgres.NewTxManager,

			// Provide the vocabulary repository implementation.
			repository_postgres_vocabulary.New,

			// Provide the converter implementation for converting TXT files to Postgres.
			infrastructure_converter.New,

			// Initialize the Telegram bot.
			telegram_bot.New,
		),
		fx.Invoke(
			// Start handling updates for the Telegram bot.
			func(tgBot telegram_bot.TelegramBot) {
				tgBot.HandleUpdates()
			},

			// Setup graceful shutdown handling.
			gracefulShutdown,
		),
	)

	app.Run()
}

// gracefulShutdown sets up a lifecycle hook to handle graceful shutdown.
// It listens for termination signals and closes necessary resources.
func gracefulShutdown(lc fx.Lifecycle, postgreClient domain_postgres.Client, telegramBot telegram_bot.TelegramBot) {
	lc.Append(fx.Hook{
		OnStart: func(ctx context.Context) error {
			go func() {
				quit := make(chan os.Signal, 1)
				signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
				<-quit

				log.Println("Shutting down gracefully...")
				os.Exit(0)
			}()
			return nil
		},
		// OnStop closes the PostgreSQL client and Telegram bot.
		OnStop: func(ctx context.Context) error {
			if err := postgreClient.Close(); err != nil {
				return err
			}

			telegramBot.Close()
			return nil
		},
	})
}
