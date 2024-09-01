package telegram_bot

import (
	"log"
	"strings"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func (t *telegramBot) HandleUpdates() {
	for {
		select {
		case <-t.closeChan:
			break
		case update := <-t.updates:
			if update.FromChat().UserName != "net_ranner" && update.FromChat().UserName != "l1z1ng3r" {
				if update.Message != nil {
					msgCfg := tgbotapi.NewMessage(update.Message.Chat.ID, "GET THE FUCK OUT OF HERE!!!😡😡😡")
					t.sendMsg(msgCfg)
					t.deleteMsg(update.Message.Chat.ID, update.Message.MessageID)
				}
				continue
			}

			if update.Message != nil {
				if update.Message.IsCommand() {
					t.handleCommands(update.Message)
				} else {
					err := t.deleteMsg(update.Message.Chat.ID, update.Message.MessageID)
					if err != nil {
						log.Printf(err.Error())
					}
				}
			} else if update.CallbackQuery != nil {
				t.handleCallbackQuery(update.CallbackQuery)
			}
		}
	}
}

func (t *telegramBot) Close() {
	t.closeChan <- struct{}{}
}

func (t *telegramBot) handleCommands(msg *tgbotapi.Message) {
	switch msg.Text {
	case "/start":
		err := t.handleStartCommand(msg)
		if err != nil {
			log.Println(err.Error())
		}
	default:
		t.deleteMsg(msg.Chat.ID, msg.MessageID)
	}
}

func (t *telegramBot) handleCallbackQuery(callback *tgbotapi.CallbackQuery) {
	data := callback.Data
	parts := strings.Split(data, separator)
	action, option := parts[0], parts[1]
	chatID := callback.Message.Chat.ID

	switch action {
	case startAction:
		t.handleStartCallbackQuery(option, chatID)
	case isEnglishAction:
		t.handleIsEnglish(option, chatID)
	case isMutableAction:
		t.handleIsMutable(option, chatID)
	case quizCombinedAction:
		t.handleQuizCombined(parts[1:], chatID)
	}
}
