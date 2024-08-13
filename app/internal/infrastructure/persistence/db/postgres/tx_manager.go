package infrastructure_postgres

import (
	"context"
	"database/sql"
	"fmt"

	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
)

// txManager struct implements the PgTxManager interface
type txManager struct {
	tx domain_postgres.Transactor
}

// NewTxManager returns a new transaction manager
func NewTxManager(tx domain_postgres.Transactor) domain_postgres.TxManager {
	return &txManager{tx: tx}
}

// ReadCommitted executes the provided function within a transaction with ReadCommitted isolation level
func (t *txManager) ReadCommitted(ctx context.Context, fn domain_postgres.Handler) error {
	tx, err := t.tx.BeginTx(ctx, &sql.TxOptions{Isolation: sql.LevelReadCommitted})
	if err != nil {
		return fmt.Errorf("%s: %s", err.Error(), "can't begin transaction")
	}

	txCtx := context.WithValue(ctx, domain_postgres.TxKey, tx)

	defer func() {
		if p := recover(); p != nil {
			_ = tx.Rollback()
			panic(p)
		} else if err != nil {
			_ = tx.Rollback()
		} else {
			err = tx.Commit()
		}
	}()

	err = fn(txCtx)
	if err != nil {
		return err
	}

	return nil
}
