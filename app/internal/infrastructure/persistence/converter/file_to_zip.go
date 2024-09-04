package infrastructure_converter

import (
	"archive/zip"
	"context"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"time"

	"github.com/cyberyal/custom_errors"
)

func (c *converter) ConvertFiletoZIP(ctx context.Context, sqlFilePath string) (string, error) {
	// Create the ZIP file
	currentTime := time.Now()
	formattedTime := currentTime.Format("02.01.2006_15.04")
	zipFilePath := fmt.Sprintf("%sbackup_%s.zip", c.zipFilePath, formattedTime)

	zipFile, err := os.Create(zipFilePath)
	if err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Error creating ZIP file")
	}
	defer zipFile.Close()

	// Create a new ZIP writer
	zipWriter := zip.NewWriter(zipFile)
	defer zipWriter.Close()

	// Open the SQL file to be added to the ZIP archive
	sqlFile, err := os.Open(sqlFilePath)
	if err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Error opening SQL file")
	}
	defer sqlFile.Close()

	// Get the base name of the SQL file (without directory path)
	baseName := filepath.Base(sqlFilePath)

	// Create a writer for the SQL file inside the ZIP archive using the base name
	writer, err := zipWriter.Create(baseName)
	if err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Error creating file in ZIP archive")
	}

	// Copy the contents of the SQL file to the ZIP writer
	if _, err = io.Copy(writer, sqlFile); err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Error writing SQL file to ZIP archive")
	}

	// Return the path to the created ZIP file
	return zipFilePath, nil
}
