package repository_postgres_vocabulary

import (
	"context"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

const (
	insertWordQuery = `
		INSERT INTO words (word_pron_stress, translation, rate)
		VALUES ($1, $2, $3)
		RETURNING id;
	`

	insertSentenceQuery = `
		INSERT INTO sentences (word_id, sentence, translation, rate)
		VALUES ($1, $2, $3, $4)
		RETURNING id;
	`

	selectSentencesBySentenceRateQuery = `
		SELECT 
			id, word_id, sentence, translation, rate
		FROM 
			sentences
		ORDER BY 
			rate ASC;
	`

	selectWordsByWordRateQuery = `
		SELECT 
			id, word_pron_stress, translation, rate
		FROM 
			words
		ORDER BY 
			rate ASC;
	`

	selectWordsWithSentencesByWordRateQuery = `
		SELECT 
			w.id AS word_id, w.word_pron_stress, w.translation AS word_translation, w.rate AS word_rate,
			s.id AS sentence_id, s.sentence, s.translation AS sentence_translation, s.rate AS sentence_rate
		FROM 
			words w
		LEFT JOIN 
			sentences s ON w.id = s.word_id
		ORDER BY 
			w.rate ASC;
	`
)

func (r *repository) SelectSentencesBySentenceRate(ctx context.Context) ([]domain_vocabulary_entity.Sentence, error) {
	var sentences []domain_vocabulary_entity.Sentence

	err := r.exec.SelectContext(ctx, &sentences, selectSentencesBySentenceRateQuery)
	if err != nil {
		return nil, err
	}

	return sentences, nil
}

func (r *repository) SelectWordsByWordRate(ctx context.Context) ([]domain_vocabulary_entity.Word, error) {
	var words []domain_vocabulary_entity.Word

	err := r.exec.SelectContext(ctx, &words, selectWordsByWordRateQuery)
	if err != nil {
		return nil, err
	}

	return words, nil
}

func (r *repository) SelectWordsWithSentencesByWordRate(ctx context.Context) ([]domain_vocabulary_entity.WordSentences, error) {
	rows, err := r.exec.QueryContext(ctx, selectWordsWithSentencesByWordRateQuery)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var result []domain_vocabulary_entity.WordSentences
	var currentWordID int64 = -1
	var currentWordSentences *domain_vocabulary_entity.WordSentences

	for rows.Next() {
		var wordSentences domain_vocabulary_entity.WordSentences
		var sentence domain_vocabulary_entity.Sentence

		err := rows.Scan(
			&wordSentences.Word.ID, &wordSentences.Word.WordPronStress, &wordSentences.Word.Translation, &wordSentences.Word.Rate,
			&sentence.ID, &sentence.Sentence, &sentence.Translation, &sentence.Rate,
		)
		if err != nil {
			return nil, err
		}

		if wordSentences.Word.ID != currentWordID {
			if currentWordSentences != nil {
				result = append(result, *currentWordSentences)
			}
			currentWordID = wordSentences.Word.ID
			currentWordSentences = &wordSentences
			currentWordSentences.SentencesCombined = []domain_vocabulary_entity.Sentence{}
		}

		if sentence.ID != 0 { // skip adding sentence if no sentence is associated
			currentWordSentences.SentencesCombined = append(currentWordSentences.SentencesCombined, sentence)
		}
	}

	if currentWordSentences != nil {
		result = append(result, *currentWordSentences)
	}

	return result, nil
}

func (r *repository) InsertWord(ctx context.Context, word domain_vocabulary_entity.Word) (int64, error) {
	var wordID int64
	err := r.exec.QueryRowContext(ctx, insertWordQuery, word.WordPronStress, word.Translation, word.Rate).Scan(&wordID)
	if err != nil {
		return 0, err
	}

	return wordID, nil
}

func (r *repository) InsertSentence(ctx context.Context, sentence domain_vocabulary_entity.Sentence) (int64, error) {
	var sentenceID int64
	err := r.exec.QueryRowContext(ctx, insertSentenceQuery, sentence.WordID, sentence.Sentence, sentence.Translation, sentence.Rate).Scan(&sentenceID)
	if err != nil {
		return 0, err
	}

	return sentenceID, nil
}
