-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS words (
    id BIGSERIAL PRIMARY KEY,
    word_pron_stress TEXT NOT NULL,
    translation TEXT NOT NULL,
    rate INT NOT NULL
);

CREATE TABLE IF NOT EXISTS sentences (
    id BIGSERIAL PRIMARY KEY,
    word_id BIGINT NOT NULL REFERENCES words(id),
    sentence TEXT NOT NULL,
    translation TEXT NOT NULL,
    rate INT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_words_rate ON words(rate);
CREATE INDEX IF NOT EXISTS idx_sentences_rate ON sentences(rate);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS idx_sentences_rate;
DROP INDEX IF EXISTS idx_words_rate;

DROP TABLE IF EXISTS sentences;
DROP TABLE IF EXISTS words;
-- +goose StatementEnd