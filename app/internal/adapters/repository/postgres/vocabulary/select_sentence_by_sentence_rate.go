package repository_postgres_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

const (
	selectSentencesBySentenceRateQuery = `
		SELECT 
			id, word_id, sentence, translation, rate
		FROM 
			sentences
		ORDER BY 
			rate ASC;
	`
)

func (r *repository) SelectSentencesBySentenceRate(ctx context.Context) ([]domain_vocabulary_entity.Sentence, error) {
	var sentences []domain_vocabulary_entity.Sentence

	err := r.exec.SelectContext(ctx, &sentences, selectSentencesBySentenceRateQuery)
	if err != nil {
		return nil, err
	}

	return sentences, nil
}
