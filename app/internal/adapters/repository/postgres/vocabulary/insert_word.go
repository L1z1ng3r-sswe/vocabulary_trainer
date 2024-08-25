package repository_postgres_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

const (
	insertWordQuery = `
		INSERT INTO words (word_pron_stress, translation, rate)
		VALUES ($1, $2, $3)
		RETURNING id;
	`
)

func (r *repository) InsertWord(ctx context.Context, word domain_vocabulary_entity.Word) (int64, error) {
	var wordID int64
	err := r.exec.QueryRowContext(ctx, insertWordQuery, word.WordPronStress, word.Translation, word.Rate).Scan(&wordID)
	if err != nil {
		return 0, err
	}

	return wordID, nil
}
