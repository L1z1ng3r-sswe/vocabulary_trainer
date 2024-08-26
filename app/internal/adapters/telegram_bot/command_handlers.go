package telegram_bot

import (
	"context"

	"github.com/cyberyal/custom_errors"
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func (t *telegramBot) handleStartCommand(msg *tgbotapi.Message) error {
	msgCfg := tgbotapi.NewMessage(msg.Chat.ID, "Welcome, my master!!! 😍🥰😘🥵 What would u like to do today?")
	buttons := tgbotapi.NewInlineKeyboardMarkup(
		tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("quiz", startAction+separator+quizOption),
			// tgbotapi.NewInlineKeyboardButtonData("txt convert", startAction+separator+txtConvertOption),
			tgbotapi.NewInlineKeyboardButtonData("create backup of the db", startAction+separator+createBackUpDBOption),
		),
	)

	msgCfg.ReplyMarkup = buttons

	err := t.sendMsg(msgCfg)
	if err != nil {
		return custom_errors.WrapWithoutCode(err, "Failed to send message.")
	}
	return nil
}

func (t *telegramBot) quiz(chatID int64) {

	msgCfg := tgbotapi.NewMessage(chatID, "Would u like to check your english?")

	buttons := tgbotapi.NewInlineKeyboardMarkup(
		tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("Yeah! ✅", isEnglishAction+separator+yesOption),
			tgbotapi.NewInlineKeyboardButtonData("No! ❌", isEnglishAction+separator+noOption),
		),
	)

	msgCfg.ReplyMarkup = buttons
	t.sendMsg(msgCfg)
}

func (t *telegramBot) txtConvert(chatID int64) {
	err := t.converter.ConvertTXTToPostgres(context.Background())
	if err != nil {
		t.handleGeneralError("TXT converted into postgresql Failed: "+err.Error(), chatID)
		return
	}

	msgCfg := tgbotapi.NewMessage(chatID, "TXT converted into postgresql successfully")
	t.sendMsg(msgCfg)

}

func (t *telegramBot) createBackupDB(chatID int64) {
	msgCfg := tgbotapi.NewMessage(chatID, "Create backup of the db successfully")
	t.sendMsg(msgCfg)
}
