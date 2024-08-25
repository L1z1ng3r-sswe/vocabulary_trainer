package telegram_bot

import (
	"github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/config"
	domain_converter "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/converter"
	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
	domain_vocabulary_service "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/service"
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

type TelegramBot interface {
	HandleUpdates() // Method to handle incoming updates from Telegram
	Close()         // Method to gracefully close the bot
}

type telegramBot struct {
	converter    domain_converter.Converter
	service      domain_vocabulary_service.Service
	closeChan    chan struct{}
	bot          *tgbotapi.BotAPI
	updates      tgbotapi.UpdatesChannel
	isEnglish    bool
	isMutable    bool
	combinedQuiz domain_vocabulary_entity.WordSentencesQuiz
}

// New creates and initializes a new Telegram bot instance.
func New(cfg *config.Config, converter domain_converter.Converter, service domain_vocabulary_service.Service) (TelegramBot, error) {
	bot, err := tgbotapi.NewBotAPI(cfg.TelegramBotToken)
	if err != nil {
		return nil, err
	}

	u := tgbotapi.NewUpdate(0)
	u.Timeout = 60
	updates := bot.GetUpdatesChan(u)

	return &telegramBot{
		converter: converter,
		service:   service,
		closeChan: make(chan struct{}),
		bot:       bot,
		updates:   updates,
	}, nil
}
