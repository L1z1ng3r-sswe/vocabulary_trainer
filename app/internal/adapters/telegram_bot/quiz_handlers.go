package telegram_bot

import (
	"context"
	"fmt"
	"log"
)

func (t *telegramBot) updateSentenceRating(index int, sentenceIndex int, rating string, chatID int64) {
	if rating == yesOption {
		t.combinedQuiz[index].SentencesCombined[sentenceIndex].Rate++
	} else if rating == noOption {
		t.combinedQuiz[index].SentencesCombined[sentenceIndex].Rate--
	}
	err := t.service.UpdateSentenceRate(context.Background(), t.combinedQuiz[index].SentencesCombined[sentenceIndex].Rate, t.combinedQuiz[index].SentencesCombined[sentenceIndex].ID)
	if err != nil {
		t.handleGeneralError(fmt.Sprintf("Failed to update sentence rating for sentence ID: %d", t.combinedQuiz[index].SentencesCombined[sentenceIndex].ID), chatID)
	}

	log.Println("Rating Updated Successfuly: ", rating)
}

func (t *telegramBot) updateWordRating(index int, rating string, chatID int64) {
	if rating == yesOption {
		t.combinedQuiz[index].Word.Rate++
	} else if rating == noOption {
		t.combinedQuiz[index].Word.Rate--
	}
	err := t.service.UpdateWordRate(context.Background(), t.combinedQuiz[index].Word.Rate, t.combinedQuiz[index].Word.ID)
	if err != nil {
		t.handleGeneralError(fmt.Sprintf("Failed to update word rating for word ID: %d", t.combinedQuiz[index].Word.ID), chatID)
	}

	log.Println("Rating Updated Successfuly: ", rating)

}
