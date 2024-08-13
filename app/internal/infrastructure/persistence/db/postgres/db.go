package infrastructure_postgres

import (
	"context"
	"database/sql"

	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
	"github.com/jmoiron/sqlx"
)

// db struct implements the DB interface
type DBPostgres struct {
	db *sqlx.DB
}

// NewDB returns a new DB instance
func NewDB(db *sqlx.DB) domain_postgres.DB {
	return &DBPostgres{db: db}
}

// QueryContext executes a query that returns rows, within a transaction if provided
func (i *DBPostgres) QueryContext(ctx context.Context, query string, args ...interface{}) (*sqlx.Rows, error) {
	if tx, ok := ctx.Value(domain_postgres.TxKey).(*sqlx.Tx); ok {
		return tx.QueryxContext(ctx, query, args...)
	}
	return i.db.QueryxContext(ctx, query, args...)
}

// QueryRowContext executes a query that is expected to return at most one row, within a transaction if provided
func (i *DBPostgres) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sqlx.Row {
	if tx, ok := ctx.Value(domain_postgres.TxKey).(*sqlx.Tx); ok {
		return tx.QueryRowxContext(ctx, query, args...)
	}
	return i.db.QueryRowxContext(ctx, query, args...)
}

// ExecContext executes a query without returning any rows, within a transaction if provided
func (i *DBPostgres) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error) {
	if tx, ok := ctx.Value(domain_postgres.TxKey).(*sqlx.Tx); ok {
		return tx.ExecContext(ctx, query, args...)
	}
	return i.db.ExecContext(ctx, query, args...)
}

// GetContext executes a query and scans the result into the destination, within a transaction if provided
func (i *DBPostgres) GetContext(ctx context.Context, dest interface{}, query string, args ...interface{}) error {
	if tx, ok := ctx.Value(domain_postgres.TxKey).(*sqlx.Tx); ok {
		return tx.GetContext(ctx, dest, query, args...)
	}
	return i.db.GetContext(ctx, dest, query, args...)
}

// SelectContext executes a query and loads the result into the destination, within a transaction if provided
func (i *DBPostgres) SelectContext(ctx context.Context, dest interface{}, query string, args ...interface{}) error {
	if tx, ok := ctx.Value(domain_postgres.TxKey).(*sqlx.Tx); ok {
		return tx.SelectContext(ctx, dest, query, args...)
	}
	return i.db.SelectContext(ctx, dest, query, args...)
}

// BeginTx starts a new transaction with the provided options
func (i *DBPostgres) BeginTx(ctx context.Context, txOptions *sql.TxOptions) (*sqlx.Tx, error) {
	return i.db.BeginTxx(ctx, txOptions)
}

// Ping verifies a connection to the database
func (i *DBPostgres) Ping() error {
	return i.db.Ping()
}

// Close closes the database connection
func (i *DBPostgres) Close() error {
	return i.db.Close()
}
