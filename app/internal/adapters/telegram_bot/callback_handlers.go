package telegram_bot

import (
	"context"
	"fmt"
	"log"
	"strconv"
	"time"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
)

func (t *telegramBot) handleStartCallbackQuery(option string, chatID int64) {
	switch option {
	case quizOption:
		t.quiz(chatID)
	case txtConvertOption:
		t.txtConvert(chatID)
	case createBackUpDBOption:
		t.createBackupDB(chatID)
	}
}

func (t *telegramBot) handleIsEnglish(option string, chatID int64) {
	switch option {
	case yesOption:
		t.isEnglish = true
	case noOption:
		t.isEnglish = false
	}

	msgCfg := tgbotapi.NewMessage(chatID, "Would u like to change rate?")

	buttons := tgbotapi.NewInlineKeyboardMarkup(
		tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("Yeah! ✅", isMutableAction+separator+yesOption),
			tgbotapi.NewInlineKeyboardButtonData("No! ❌", isMutableAction+separator+noOption),
		),
	)

	msgCfg.ReplyMarkup = buttons
	t.sendMsg(msgCfg)
}

func (t *telegramBot) handleIsMutable(option string, chatID int64) {
	switch option {
	case yesOption:
		t.isMutable = true
	case noOption:
		t.isMutable = false
	}

	// ! if u want to check only words start------------------------------------------------

	// msgCfg := tgbotapi.NewMessage(chatID, "Choose the type of the quiz:")

	// buttons := tgbotapi.NewInlineKeyboardMarkup(
	// 	tgbotapi.NewInlineKeyboardRow(
	// 		tgbotapi.NewInlineKeyboardButtonData("Combined", choseQuizModeAction+separator+combinedOption),
	// 		tgbotapi.NewInlineKeyboardButtonData("Words", choseQuizModeAction+separator+wordsOption),
	// 		tgbotapi.NewInlineKeyboardButtonData("Sentences!", choseQuizModeAction+separator+sentencesOption),
	// 	),
	// )

	// msgCfg.ReplyMarkup = buttons
	// t.sendMsg(msgCfg)

	// ! if u want to check only words end------------------------------------------------

	log.Println("Waiting for docker")
	time.Sleep(5 * time.Second)
	var err error
	t.combinedQuiz, err = t.service.WordsWithSentences(context.Background())
	if err != nil {
		t.handleGeneralError("Failed to load combined quiz"+err.Error(), chatID)
		return
	}

	// Determine the word to display based on the isEnglish flag
	var wordToTranslate string
	if t.isEnglish {
		wordToTranslate = t.combinedQuiz[0].Word.Translation // Word in English
	} else {
		wordToTranslate = t.combinedQuiz[0].Word.WordPronStress // Word in Russian
	}

	msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("Translate this: %s, %d", wordToTranslate, t.currIndex))
	buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(tgbotapi.NewInlineKeyboardButtonData("Translate", quizCombinedAction+separator+"1"+separator+"0")))
	msgCfg.ReplyMarkup = buttons
	t.sendMsg(msgCfg)
}

func (t *telegramBot) handleQuizCombined(params []string, chatID int64) {
	if len(params) < 2 {
		t.handleParamError("Error: Insufficient parameters for quiz combined action", chatID, params)
		return
	}

	indexStr := params[1]
	indexInt, err := strconv.Atoi(indexStr)
	if err != nil {
		t.handleParamError("Error: Unable to convert index to integer", chatID, params)
		return
	}

	switch params[0] {
	case "1":
		// Step 1: Show word translation and first sentence to translate

		if len(t.combinedQuiz[indexInt].SentencesCombined) != 3 {
			t.handleGeneralError("Error: Length of the combined sentences doesn't equal 3", chatID)
			return
		}

		// Determine the word and sentence to display based on the isEnglish flag
		var wordToTranslate, sentenceToTranslate string
		if t.isEnglish {
			wordToTranslate = t.combinedQuiz[indexInt].Word.WordPronStress                  // Word in English
			sentenceToTranslate = t.combinedQuiz[indexInt].SentencesCombined[0].Translation // Sentence in English
		} else {
			wordToTranslate = t.combinedQuiz[indexInt].Word.Translation                  // Word in Russian
			sentenceToTranslate = t.combinedQuiz[indexInt].SentencesCombined[0].Sentence // Sentence in Russian
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s\n\n\n%s", wordToTranslate, sentenceToTranslate))

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(tgbotapi.NewInlineKeyboardButtonData("Translate", quizCombinedAction+separator+"2"+separator+indexStr)))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "2":
		// Step 2: Show translation of the first sentence and ask for a rating (good or bad)

		// Determine the sentence translation to display based on the isEnglish flag
		var sentenceTranslation string
		if t.isEnglish {
			sentenceTranslation = t.combinedQuiz[indexInt].SentencesCombined[0].Sentence // Translation in English
		} else {
			sentenceTranslation = t.combinedQuiz[indexInt].SentencesCombined[0].Translation // Original sentence in Russian
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s", sentenceTranslation))

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("Good ✅", quizCombinedAction+separator+"3"+separator+indexStr+separator+yesOption),
			tgbotapi.NewInlineKeyboardButtonData("Bad ❌", quizCombinedAction+separator+"3"+separator+indexStr+separator+noOption),
		))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "3":
		// Step 3: Update the rating for the first sentence and proceed to the next sentence

		if len(params) != 3 {
			t.handleParamError("Error: Missing parameters for rating update", chatID, params)
			return
		}

		if t.isMutable {
			t.updateSentenceRating(indexInt, 0, params[2], chatID)
		}

		// Determine the next sentence to display based on the isEnglish flag
		var sentenceToTranslate string
		if t.isEnglish {
			sentenceToTranslate = t.combinedQuiz[indexInt].SentencesCombined[1].Translation // Sentence in Russian
		} else {
			sentenceToTranslate = t.combinedQuiz[indexInt].SentencesCombined[1].Sentence // Sentence in English
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s", sentenceToTranslate))

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(tgbotapi.NewInlineKeyboardButtonData("Translate", quizCombinedAction+separator+"4"+separator+indexStr)))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "4":
		// Step 4: Show translation of the second sentence and ask for a rating (good or bad)

		// Determine the sentence translation to display based on the isEnglish flag
		var sentenceTranslation string
		if t.isEnglish {
			sentenceTranslation = t.combinedQuiz[indexInt].SentencesCombined[1].Sentence // Translation in English
		} else {
			sentenceTranslation = t.combinedQuiz[indexInt].SentencesCombined[1].Translation // Original sentence in Russian
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s", sentenceTranslation))

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("Good ✅", quizCombinedAction+separator+"5"+separator+indexStr+separator+yesOption),
			tgbotapi.NewInlineKeyboardButtonData("Bad ❌", quizCombinedAction+separator+"5"+separator+indexStr+separator+noOption),
		))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "5":
		// Step 5: Update the rating for the second sentence and proceed to the third sentence

		if len(params) != 3 {
			t.handleParamError("Error: Missing parameters for rating update", chatID, params)
			return
		}

		if t.isMutable {
			t.updateSentenceRating(indexInt, 1, params[2], chatID)
		}

		// Determine the next sentence to display based on the isEnglish flag
		var sentenceToTranslate string
		if t.isEnglish {
			sentenceToTranslate = t.combinedQuiz[indexInt].SentencesCombined[2].Translation // Sentence in Russian
		} else {
			sentenceToTranslate = t.combinedQuiz[indexInt].SentencesCombined[2].Sentence // Sentence in English
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s", sentenceToTranslate))

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(tgbotapi.NewInlineKeyboardButtonData("Translate", quizCombinedAction+separator+"6"+separator+indexStr)))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "6":
		// Step 6: Show translation of the third sentence and ask for a rating (good or bad)

		// Determine the sentence translation to display based on the isEnglish flag
		var sentenceTranslation string
		if t.isEnglish {
			sentenceTranslation = t.combinedQuiz[indexInt].SentencesCombined[2].Sentence // Translation in English
		} else {
			sentenceTranslation = t.combinedQuiz[indexInt].SentencesCombined[2].Translation // Original sentence in Russian
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("%s\n", sentenceTranslation))

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("Good ✅", quizCombinedAction+separator+"7"+separator+indexStr+separator+yesOption),
			tgbotapi.NewInlineKeyboardButtonData("Bad ❌", quizCombinedAction+separator+"7"+separator+indexStr+separator+noOption),
		))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "7":
		// Step 7: Update the rating for the third sentence and ask for a rating for the word

		if len(params) != 3 {
			t.handleParamError("Error: Missing parameters for final word rating", chatID, params)
			return
		}

		if t.isMutable {
			t.updateSentenceRating(indexInt, 2, params[2], chatID)
		}

		msgCfg := tgbotapi.NewMessage(chatID, "Was the word good or bad?")

		buttons := tgbotapi.NewInlineKeyboardMarkup(tgbotapi.NewInlineKeyboardRow(
			tgbotapi.NewInlineKeyboardButtonData("Good ✅", quizCombinedAction+separator+"8"+separator+indexStr+separator+yesOption),
			tgbotapi.NewInlineKeyboardButtonData("Bad ❌", quizCombinedAction+separator+"8"+separator+indexStr+separator+noOption),
		))

		msgCfg.ReplyMarkup = buttons

		t.sendMsg(msgCfg)

	case "8":
		// Step 8: Update the rating for the word and move to the next word or complete the quiz

		t.updateWordRating(indexInt, params[2], chatID)

		if len(t.combinedQuiz) <= indexInt+1 {
			msgCfg := tgbotapi.NewMessage(chatID, "Quiz completed, well done!")
			t.sendMsg(msgCfg)
			return
		}

		// Determine the next word to display based on the isEnglish flag
		var nextWord string
		if t.isEnglish {
			nextWord = t.combinedQuiz[indexInt+1].Word.Translation // Word in Russian
		} else {
			nextWord = t.combinedQuiz[indexInt+1].Word.WordPronStress // Word in English
		}

		msgCfg := tgbotapi.NewMessage(chatID, fmt.Sprintf("Translate this: %s, %d", nextWord, indexInt+1))
		t.currIndex++

		msgCfg.ReplyMarkup = tgbotapi.NewInlineKeyboardMarkup(
			tgbotapi.NewInlineKeyboardRow(
				tgbotapi.NewInlineKeyboardButtonData("Translate", quizCombinedAction+separator+"1"+separator+strconv.Itoa(indexInt+1)),
			),
		)

		t.sendMsg(msgCfg)

	default:
		t.handleGeneralError("Error: Unknown action in quiz combined", chatID)
	}
}
