package infrastructure_postgres

import (
	"fmt"

	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"
	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
	"github.com/cyberyal/custom_errors"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

const (
	driverName = "postgres"
)

// client struct implements the Client interface
type client struct {
	db domain_postgres.DB
}

// New creates a new PostgreSQL client
func New(cfg *config.Config) (domain_postgres.Client, error) {
	dsn := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=%s",
		cfg.PostgresHost, cfg.PostgresPort, cfg.PostgresUser, cfg.PostgresPassword, cfg.PostgresDBName, cfg.PostgresSSLMode)

	db, err := sqlx.Open(driverName, dsn)
	if err != nil {
		return nil, custom_errors.WrapWithoutCode(err, "Failed to open database connection")
	}

	err = db.Ping()
	if err != nil {
		return nil, custom_errors.WrapWithoutCode(err, "Failed to ping database")
	}

	dbExecutor := NewDB(db)

	return &client{db: dbExecutor}, nil
}

// DBExecutor returns the Executor for SQL queries
func (c *client) DBExecutor() domain_postgres.Executor {
	return c.db
}

// DBTx returns the Transactor for handling transactions
func (c *client) DBTx() domain_postgres.Transactor {
	return c.db
}

// Ping verifies the database connection
func (c *client) Ping() error {
	return c.db.Ping()
}

// Close closes the database connection
func (c *client) Close() error {
	return c.db.Close()
}
