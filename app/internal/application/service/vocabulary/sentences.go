package service_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

func (s *service) Sentences(ctx context.Context) ([]domain_vocabulary_entity.Sentence, error) {
	return s.repository.SelectSentencesBySentenceRate(ctx)
}
