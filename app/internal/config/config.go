package config

import (
	"github.com/cyberyal/custom_errors"
	"github.com/ilyakaznacheev/cleanenv"
	"github.com/joho/godotenv"
)

const (
	localEnvExec = "local"
	localEnvPath = "./deployment/local.env"
)

type Config struct {
	PostgresHost     string `env:"POSTGRES_HOST" env-required:"true"`
	PostgresPort     string `env:"POSTGRES_PORT" env-required:"true"`
	PostgresUser     string `env:"POSTGRES_USER" env-required:"true"`
	PostgresPassword string `env:"POSTGRES_PASSWORD" env-required:"true"`
	PostgresDBName   string `env:"POSTGRES_DBNAME" env-required:"true"`
	PostgresSSLMode  string `env:"POSTGRES_SSLMODE" env-required:"true"`

	TelegramBotToken string `env:"TELEGRAM_BOT_TOKEN" env-required:"true"`
	TXTFilePath      string `env:"TXT_FILE_PATH" env-required:"true"`
	SQLFilePath      string `env:"SQL_FILE_PATH" env-required:"true"`
	ZIPFilePath      string `env:"ZIP_FILE_PATH" env-required:"true"`
}

// Load loads configuration based on the environment flag.
// Returns a Config pointer and an error if any.
func Load(envExecFlag string) (*Config, error) {
	var envPath string
	switch envExecFlag {
	case localEnvExec:
		envPath = localEnvPath
	default:
		return nil, custom_errors.NewWithoutCode("Invalid environment: choose from local, dev, or prod")
	}

	if err := godotenv.Load(envPath); err != nil {
		return nil, custom_errors.WrapWithoutCode(err, "Failed to load env variables")
	}

	var cfg Config
	if err := cleanenv.ReadEnv(&cfg); err != nil {
		return nil, custom_errors.WrapWithoutCode(err, "Failed to read env variables")
	}

	return &cfg, nil
}
