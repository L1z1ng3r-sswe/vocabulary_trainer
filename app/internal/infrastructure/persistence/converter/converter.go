package infrastructure_converter

import "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"

type Converter interface {
}

type converter struct {
	txtFilePath string
}

func New(cfg *config.Config) Converter {
	return &converter{txtFilePath: cfg.TXTFilePath}
}

func (c *converter) ConvertTXTtoPostgres() {
	// open file
}

func (c *converter) ConvertPostgresToSQL() {

}

func (c *converter) ConvertSQLToZip() {

}
