package domain_postgres

import (
	"context"
	"database/sql"

	"github.com/jmoiron/sqlx"
)

const (
	TxKey = "tx" // TxKey is used for context checking
)

// Handler is a function type used for executing operations within a transaction
type Handler func(ctx context.Context) error

// TxManager provides methods for managing transactions
type TxManager interface {
	ReadCommitted(ctx context.Context, f Handler) error
}

// Executor provides methods for executing SQL queries
type Executor interface {
	QueryContext(ctx context.Context, query string, args ...interface{}) (*sqlx.Rows, error)
	QueryRowContext(ctx context.Context, query string, args ...interface{}) *sqlx.Row
	ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
	GetContext(ctx context.Context, dest interface{}, query string, args ...interface{}) error
	SelectContext(ctx context.Context, dest interface{}, query string, args ...interface{}) error
}

// Transactor provides methods for transaction handling
type Transactor interface {
	BeginTx(ctx context.Context, txOptions *sql.TxOptions) (*sqlx.Tx, error)
}

// DB aggregates the Executor and Transactor interfaces and includes connection methods
type DB interface {
	Executor
	Transactor
	Ping() error
	Close() error
}

// Client provides methods for interacting with a PostgreSQL client
type Client interface {
	DBExecutor() Executor
	DBTx() Transactor
	Ping() error
	Close() error
}
