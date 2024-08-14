package infrastructure_converter

import (
	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"
	domain_postgres "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/db/postgres"
	domain_vocabulary_repository "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/repository"
)

type Converter interface {
}

type converter struct {
	txtFilePath          string
	vocabularyRepository domain_vocabulary_repository.Repository
	txManager            domain_postgres.TxManager
}

// New creates a new instance of the Converter.
func New(cfg *config.Config, vocabularyRepository domain_vocabulary_repository.Repository, txManager domain_postgres.TxManager) Converter {
	return &converter{txtFilePath: cfg.TXTFilePath, vocabularyRepository: vocabularyRepository, txManager: txManager}
}
