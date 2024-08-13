package domain_vocabulary_entity

type Word struct {
	ID             int64  `db:"id"`
	WordPronStress string `db:"word"`        // word part, pronunciation and stressed part
	Translation    string `db:"translation"` // translation (Russian verion)
	Rate           int    `db:"rate"`
}

type Sentence struct {
	ID          int64  `db:"id"`
	WordID      int64  `db:"word_id"`
	Sentence    string `db:"sentence"`    // English sentence
	Translation string `db:"translation"` // Russian version of the
	Rate        int    `db:"rate"`
}
