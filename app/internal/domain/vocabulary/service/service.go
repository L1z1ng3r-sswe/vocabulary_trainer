package domain_vocabulary_service

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

// Service interface defines the service layer methods for vocabulary operations.
type Service interface {
	// Sentences retrieves all sentences.
	Sentences(ctx context.Context) ([]domain_vocabulary_entity.Sentence, error)

	// Words retrieves all words.
	Words(ctx context.Context) ([]domain_vocabulary_entity.Word, error)

	// UpdateSentenceRate updates the rate of a sentence.
	UpdateSentenceRate(ctx context.Context, newRate int, sentenceID int64) error

	// UpdateWordRate updates the rate of a word.
	UpdateWordRate(ctx context.Context, newRate int, wordID int64) error

	// WordsWithSentences retrieves words with their associated sentences.
	WordsWithSentences(ctx context.Context) ([]domain_vocabulary_entity.WordSentences, error)

	// CreateBackup creates a backup of the entire database and returns the path to the created ZIP file.
	CreateBackup(ctx context.Context) (string, error)

	// ConvertTXTtoDB inserts text-structured data into the database.
	ConvertTXTtoDB(ctx context.Context) error
}
