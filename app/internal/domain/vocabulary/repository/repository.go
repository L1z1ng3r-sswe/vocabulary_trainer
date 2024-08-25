package domain_vocabulary_repository

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

// Repository provides methods for vocabulary operations.
type Repository interface {
	// InsertSentence adds a sentence to the database.
	InsertSentence(ctx context.Context, sentence domain_vocabulary_entity.Sentence) (int64, error)

	// InsertWord adds a word to the database.
	InsertWord(ctx context.Context, word domain_vocabulary_entity.Word) (int64, error)

	// SelectWordsWithSentencesByWordRate retrieves words with their sentences, ordered by word rate.
	SelectWordsWithSentencesByWordRate(ctx context.Context) (domain_vocabulary_entity.WordSentencesQuiz, error)

	// SelectWordsByWordRate retrieves words ordered by rate.
	SelectWordsByWordRate(ctx context.Context) ([]domain_vocabulary_entity.Word, error)

	// SelectSentencesBySentenceRate retrieves sentences ordered by rate.
	SelectSentencesBySentenceRate(ctx context.Context) ([]domain_vocabulary_entity.Sentence, error)

	// UpdateWordRate updates the rate of a word.
	UpdateWordRate(ctx context.Context, wordID int64, newRate int) error

	// UpdateSentenceRate updates the rate of a sentence.
	UpdateSentenceRate(ctx context.Context, sentenceID int64, newRate int) error
}
