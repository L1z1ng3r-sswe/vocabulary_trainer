package service_vocabulary

import (
	"context"

	"github.com/cyberyal/custom_errors"
)

func (s *service) ConvertTXTtoDB(ctx context.Context) error {
	err := s.converter.ConvertTXTtoDB(ctx)
	if err != nil {
		return custom_errors.WrapWithoutCode(err, "Failed to create backup")
	}

	return nil
}
