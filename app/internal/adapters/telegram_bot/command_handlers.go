package telegram_bot

import (
	"context"
	"os"
	"path/filepath"

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
	err := t.service.ConvertTXTtoDB(context.Background())
	if err != nil {
		t.handleGeneralError("TXT converted into postgresql Failed: "+err.Error(), chatID)
		return
	}

	msgCfg := tgbotapi.NewMessage(chatID, "TXT converted into postgresql successfully")
	t.sendMsg(msgCfg)
}

func (t *telegramBot) createBackupDB(chatID int64) {
	zipFilePath, err := t.service.CreateBackup(context.Background())
	if err != nil {
		t.handleGeneralError("Failed to create backup: "+err.Error(), chatID)
		return
	}

	t.sendBackupFile(chatID, zipFilePath)
	msgCfg := tgbotapi.NewMessage(chatID, "Create backup of the db successfully")
	t.sendMsg(msgCfg)
}

func (t *telegramBot) sendBackupFile(chatID int64, zipFilePath string) {
	zipFile, err := os.Open(zipFilePath)
	if err != nil {
		t.handleGeneralError("Failed to open the backup file: "+err.Error(), chatID)
		return
	}
	defer zipFile.Close()

	document := tgbotapi.NewDocument(chatID, tgbotapi.FileReader{
		Name:   filepath.Base(zipFilePath),
		Reader: zipFile,
	})
	document.Caption = "Here is your database backup"

	if _, err := t.bot.Send(document); err != nil {
		t.handleGeneralError("Failed to send the backup file: "+err.Error(), chatID)
	}
}
