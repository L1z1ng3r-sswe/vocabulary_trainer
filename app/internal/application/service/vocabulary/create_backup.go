package service_vocabulary

import (
	"context"

	"github.com/cyberyal/custom_errors"
)

func (s *service) CreateBackup(ctx context.Context) (string, error) {
	sqlFilePath, err := s.converter.ConvertDBtoFile(ctx)
	if err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Failed to convert postgres to .sql file")
	}

	zipFilePath, err := s.converter.ConvertFiletoZIP(ctx, sqlFilePath)
	if err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Failed to convert .sql file to zip")
	}

	return zipFilePath, nil
}
