package telegram_bot

import tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"

func (t *telegramBot) handleStartCommand(msg *tgbotapi.Message) error {
	welcomeMSG := tgbotapi.NewMessage(msg.Chat.ID, "Welcome to vocabulary trainer")
	err := t.sendMsg(welcomeMSG)
	if err != nil {
		return err
	}
	return nil
}
