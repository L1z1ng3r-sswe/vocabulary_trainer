package config

import (
	"github.com/cyberyal/custom_errors"
	"github.com/ilyakaznacheev/cleanenv"
	"github.com/joho/godotenv"
)

const (
	local_env_exec = "local"
	local_env_path = "./deployment/local.env"
)

type Config struct {
	PostgresDSN      string `env:"POSTGRES_DSN" env-required:"true"`
	TelegramBotToken string `env:"TELEGRAM_BOT_TOKEN" env-required:"true"`
	TXTFilePath      string `env:"TXT_FILE_PATH" env-required:"true"`
}

// Load loads configuration based on the environment flag.
// Returns a Config pointer and an error if any.
func Load(envExecFlag string) (*Config, error) {
	var envPath string
	switch envExecFlag {
	case local_env_exec:
		envPath = local_env_path
	default:
		return nil, custom_errors.NewWithoutCode("Invalid environment: choose from local, dev, or prod")
	}

	if err := godotenv.Load(envPath); err != nil {
		return nil, custom_errors.WrapWithoutCode(err, "Failed to load env variables")
	}

	var cfg Config
	if err := cleanenv.ReadEnv(&cfg); err != nil {
		return nil, custom_errors.WrapWithoutCode(err, "Failed to read env variables")
	}

	return &cfg, nil
}
