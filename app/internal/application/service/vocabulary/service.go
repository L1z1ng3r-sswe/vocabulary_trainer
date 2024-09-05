package service_vocabulary

import (
	domain_converter "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/converter"
	domain_vocabulary_repository "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/repository"
	domain_vocabulary_service "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/service"
)

type service struct {
	repository domain_vocabulary_repository.Repository
	converter  domain_converter.Converter
}

// New creates a new instance of the vocabulary service.
func New(repository domain_vocabulary_repository.Repository, converter domain_converter.Converter) domain_vocabulary_service.Service {
	return &service{
		repository: repository,
		converter:  converter,
	}
}
