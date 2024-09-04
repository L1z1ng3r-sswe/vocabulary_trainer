package domain_converter

import "context"

// Converter defines methods for converting data between different formats and storage.
type Converter interface {
	// ConvertTXTtoDB reads data from a text file and stores it in a database.
	ConvertTXTtoDB(ctx context.Context) error

	// ConvertDBtoFile creates an SQL file backup of the database and returns the path to the created .sql file and an error if it occurs.
	ConvertDBtoFile(ctx context.Context) (string, error)

	// ConvertFiletoZIP creates a ZIP file from the provided SQL file and returns the path to the created ZIP file along with an error if it occurs.
	ConvertFiletoZIP(ctx context.Context, sqlFilePath string) (string, error)
}
