package domain_vocabulary_entity

type Word struct {
	ID             int64  `db:"id"`
	WordPronStress string `db:"word"`        // word part, pronunciation and stressed part
	Translation    string `db:"translation"` // russian translation
	Rate           int    `db:"rate"`
}

type Sentence struct {
	ID          int64  `db:"id"`
	WordID      int64  `db:"word_id"`
	Sentence    string `db:"sentence"`    // English sentence
	Translation string `db:"translation"` // Russian sentence
	Rate        int    `db:"rate"`
}

type SentencesCombined []Sentence // sentences with the same word id.

type WordSentences struct {
	Word              Word
	SentencesCombined []Sentence
}

type WordSentencesQuiz []WordSentences // in ascending order by word_id.
