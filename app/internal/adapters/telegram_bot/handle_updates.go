package telegram_bot

import (
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func (t *telegramBot) HandleUpdates() {
	for {
		select {
		case <-t.stopChan:
			return
		case update := <-t.updates:
			if update.Message != nil {
				if update.Message.IsCommand() {
					switch update.Message.Command() {
					case "start":
						t.handleStartCommand(update.Message)
					default:
						t.handleUnknownCommand(update.Message)
					}
				} else {
					t.handleTextMsg(update.Message)
				}
			}
		}
	}

}

func (t *telegramBot) handleTextMsg(msg *tgbotapi.Message) error {
	reply := tgbotapi.NewMessage(msg.Chat.ID, "You said: "+msg.Text)
	if err := t.sendMsg(reply); err != nil {
		return err
	}

	return nil
}

func (t *telegramBot) handleUnknownCommand(msg *tgbotapi.Message) error {
	msgReply := tgbotapi.NewMessage(msg.Chat.ID, "Sorry, I didn't understand that command.")
	if err := t.sendMsg(msgReply); err != nil {
		return err
	}

	return nil
}

func (t *telegramBot) sendMsg(msg tgbotapi.MessageConfig) error {
	if _, err := t.bot.Send(msg); err != nil {
		return err
	}

	return nil
}
