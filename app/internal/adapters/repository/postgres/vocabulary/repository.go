package repository_postgres_vocabulary

import (
	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
	domain_vocabulary_repository "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/repository"
)

type repository struct {
	exec domain_postgres.Executor
}

// New creates a new instance of the PostgreSQL vocabulary repository.
func New(exec domain_postgres.Executor) domain_vocabulary_repository.Repository {
	return &repository{
		exec: exec,
	}
}
