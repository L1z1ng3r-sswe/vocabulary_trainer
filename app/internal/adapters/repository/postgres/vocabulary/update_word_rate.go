package repository_postgres_vocabulary

import "context"

const (
	updateWordRateQuery = `
		UPDATE words
		SET rate = $1
		WHERE id = $2;
	`
)

func (r *repository) UpdateWordRate(ctx context.Context, wordID int64, newRate int) error {
	_, err := r.exec.ExecContext(ctx, updateWordRateQuery, newRate, wordID)
	if err != nil {
		return err
	}

	return nil
}
