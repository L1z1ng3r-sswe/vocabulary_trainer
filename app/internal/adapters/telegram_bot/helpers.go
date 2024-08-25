package telegram_bot

import (
	"fmt"
	"log"

	"github.com/cyberyal/custom_errors"
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func (t *telegramBot) deleteMsg(chatID int64, msgID int) error {
	deleteConfig := tgbotapi.NewDeleteMessage(chatID, msgID)
	_, err := t.bot.Request(deleteConfig)
	if err != nil {
		return custom_errors.WrapWithoutCode(err, "Failed to delete a message")
	}
	return nil
}

func (t *telegramBot) sendMsg(msg tgbotapi.MessageConfig) error {
	_, err := t.bot.Send(msg)
	if err != nil {
		return custom_errors.WrapWithoutCode(err, "Failed to send message")
	}
	return nil
}

func (t *telegramBot) handleGeneralError(msg string, chatID int64) {
	log.Println(msg)
	msgCfg := tgbotapi.NewMessage(chatID, msg)
	t.sendMsg(msgCfg)
}

func (t *telegramBot) handleParamError(msg string, chatID int64, params []string) {
	log.Printf("%s - Params: %v", msg, params)
	msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s\nParams: %v", msg, params))
	t.sendMsg(msgCfg)
}
