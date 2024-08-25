package repository_postgres_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

const (
	selectWordsWithSentencesByWordRateQuery = `
		SELECT 
			w.id AS word_id, 
			w.word_pron_stress, 
			w.translation AS word_translation, 
			w.rate AS word_rate,
			s.id AS sentence_id, 
			s.sentence, 
			s.translation AS sentence_translation, 
			s.rate AS sentence_rate
		FROM 
			words w
		LEFT JOIN 
			sentences s ON w.id = s.word_id
		ORDER BY 
			w.rate ASC, 
			w.id ASC, 
			s.rate ASC, 
			s.id ASC;
	`
)

func (r *repository) SelectWordsWithSentencesByWordRate(ctx context.Context) (domain_vocabulary_entity.WordSentencesQuiz, error) {
	// Execute the query
	rows, err := r.exec.QueryContext(ctx, selectWordsWithSentencesByWordRateQuery)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	// Prepare the result
	var wordSentencesQuiz domain_vocabulary_entity.WordSentencesQuiz
	var currentWordID int64 = -1
	var currentWordSentences *domain_vocabulary_entity.WordSentences

	// Iterate over the rows
	for rows.Next() {
		var wordID int64
		var wordPronStress, wordTranslation string
		var wordRate int
		var sentenceID int64
		var sentence, sentenceTranslation string
		var sentenceRate int

		err := rows.Scan(
			&wordID, &wordPronStress, &wordTranslation, &wordRate,
			&sentenceID, &sentence, &sentenceTranslation, &sentenceRate,
		)
		if err != nil {
			return nil, err
		}

		// If the wordID has changed, add the previous word and its sentences to the result
		if wordID != currentWordID {
			if currentWordSentences != nil {
				wordSentencesQuiz = append(wordSentencesQuiz, *currentWordSentences)
			}
			currentWordID = wordID
			currentWordSentences = &domain_vocabulary_entity.WordSentences{
				Word: domain_vocabulary_entity.Word{
					ID:             wordID,
					WordPronStress: wordPronStress,
					Translation:    wordTranslation,
					Rate:           wordRate,
				},
				SentencesCombined: []domain_vocabulary_entity.Sentence{},
			}
		}

		// Add the sentence to the current word's SentencesCombined slice
		if sentenceID != 0 { // skip adding sentence if no sentence is associated
			sentenceStruct := domain_vocabulary_entity.Sentence{
				ID:          sentenceID,
				WordID:      wordID,
				Sentence:    sentence,
				Translation: sentenceTranslation,
				Rate:        sentenceRate,
			}
			currentWordSentences.SentencesCombined = append(currentWordSentences.SentencesCombined, sentenceStruct)
		}
	}

	// Add the last word and its sentences to the result
	if currentWordSentences != nil {
		wordSentencesQuiz = append(wordSentencesQuiz, *currentWordSentences)
	}

	return wordSentencesQuiz, nil
}
