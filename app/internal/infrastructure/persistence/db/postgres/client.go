package infrastructure_postgres

import (
	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"
	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
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
	db, err := sqlx.Open(driverName, cfg.PostgresDSN)
	if err != nil {
		return nil, err
	}

	err = db.Ping()
	if err != nil {
		return nil, err
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
