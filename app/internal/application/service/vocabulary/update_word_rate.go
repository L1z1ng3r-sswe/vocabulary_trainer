package service_vocabulary

import "context"

func (s *service) UpdateWordRate(ctx context.Context, newRate int, wordID int64) error {
	return s.repository.UpdateWordRate(ctx, wordID, newRate)
}
