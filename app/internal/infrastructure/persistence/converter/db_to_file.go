package infrastructure_converter

import (
	"context"
	"fmt"
	"os/exec"
	"time"

	"github.com/cyberyal/custom_errors"
)

func (c *converter) ConvertDBtoFile(ctx context.Context) (string, error) {
	currentTime := time.Now()
	formattedTime := currentTime.Format("02.01.2006_15.04")

	sqlFileName := fmt.Sprintf("%sbackup_%s.sql", c.sqlFilePath, formattedTime)

	cmd := exec.Command("pg_dump", "-U", c.dbUser, "-d", c.dbName, "-h", c.dbHost, "-p", c.dbPort, "-F", "p", "-f", sqlFileName)
	cmd.Env = append(cmd.Env, fmt.Sprintf("PGPASSWORD=%s", c.dbPassword))

	if err := cmd.Run(); err != nil {
		return "", custom_errors.WrapWithoutCode(err, "Error creating backup")
	}

	return sqlFileName, nil
}
