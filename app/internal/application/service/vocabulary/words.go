package service_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

func (s *service) Words(ctx context.Context) ([]domain_vocabulary_entity.Word, error) {
	return s.repository.SelectWordsByWordRate(ctx)
}
