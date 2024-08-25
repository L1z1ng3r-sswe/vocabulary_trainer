package service_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

func (s *service) WordsWithSentences(ctx context.Context) ([]domain_vocabulary_entity.WordSentences, error) {
	return s.repository.SelectWordsWithSentencesByWordRate(ctx)
}
