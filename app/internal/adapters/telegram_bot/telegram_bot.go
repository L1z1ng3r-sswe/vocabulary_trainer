package telegram_bot

import (
	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

type TelegramBot interface {
	HandleUpdates()
	Close()
}

type telegramBot struct {
	updates  tgbotapi.UpdatesChannel
	bot      *tgbotapi.BotAPI
	stopChan chan struct{}
}

// New creates a new instance of the Telegram bot.
func New(cfg *config.Config) (TelegramBot, error) {
	bot, err := tgbotapi.NewBotAPI(cfg.TelegramBotToken)
	if err != nil {
		return nil, err
	}

	u := tgbotapi.NewUpdate(0)
	u.Timeout = 60

	updates := bot.GetUpdatesChan(u)

	return &telegramBot{
		updates: updates,
		bot:     bot,
	}, nil
}

// Close sends a signal to stop the bot gracefully.
func (t *telegramBot) Close() {
	t.stopChan <- struct{}{}
}
