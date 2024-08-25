package repository_postgres_vocabulary

import "context"

const (
	updateSentenceRateQuery = `
		UPDATE sentences
		SET rate = $1
		WHERE id = $2;
	`
)

func (r *repository) UpdateSentenceRate(ctx context.Context, sentenceID int64, newRate int) error {
	_, err := r.exec.ExecContext(ctx, updateSentenceRateQuery, newRate, sentenceID)
	if err != nil {
		return err
	}

	return nil
}
