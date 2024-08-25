package service_vocabulary

import "context"

func (s *service) UpdateSentenceRate(ctx context.Context, newRate int, sentenceID int64) error {
	return s.repository.UpdateSentenceRate(ctx, sentenceID, newRate)
}
