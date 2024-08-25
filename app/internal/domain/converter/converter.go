package domain_converter

import "context"

type Converter interface {
	ConvertTXTToPostgres(ctx context.Context) error
}
