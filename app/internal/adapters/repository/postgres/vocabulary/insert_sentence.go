package repository_postgres_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

const (
	insertSentenceQuery = `
		INSERT INTO sentences (word_id, sentence, translation, rate)
		VALUES ($1, $2, $3, $4)
		RETURNING id;
	`
)

func (r *repository) InsertSentence(ctx context.Context, sentence domain_vocabulary_entity.Sentence) (int64, error) {
	var sentenceID int64
	err := r.exec.QueryRowContext(ctx, insertSentenceQuery, sentence.WordID, sentence.Sentence, sentence.Translation, sentence.Rate).Scan(&sentenceID)
	if err != nil {
		return 0, err
	}

	return sentenceID, nil
}
