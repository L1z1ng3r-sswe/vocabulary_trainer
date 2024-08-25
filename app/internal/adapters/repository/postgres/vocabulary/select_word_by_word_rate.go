package repository_postgres_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

const (
	selectWordsByWordRateQuery = `
		SELECT 
			id, word_pron_stress, translation, rate
		FROM 
			words
		ORDER BY 
			rate ASC;
	`
)

func (r *repository) SelectWordsByWordRate(ctx context.Context) ([]domain_vocabulary_entity.Word, error) {
	var words []domain_vocabulary_entity.Word

	err := r.exec.SelectContext(ctx, &words, selectWordsByWordRateQuery)
	if err != nil {
		return nil, err
	}

	return words, nil
}
