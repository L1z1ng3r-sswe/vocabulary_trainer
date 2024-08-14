-- +goose Up
-- +goose StatementBegin
SELECT 'up SQL query';
-- +goose StatementEnd
CREATE TABLE words (
    id BIGSERIAL PRIMARY KEY,
    word_pron_stress TEXT NOT NULL,
    translation TEXT NOT NULL,
    rate INT NOT NULL
);

CREATE TABLE sentences (
    id BIGSERIAL PRIMARY KEY,
    word_id BIGINT NOT NULL REFERENCES words(id),
    sentence TEXT NOT NULL,
    translation TEXT NOT NULL,
    rate INT NOT NULL
);


CREATE INDEX idx_words_rate ON words(rate);
CREATE INDEX idx_words_rate ON sentences(rate);

-- +goose Down
-- +goose StatementBegin
SELECT 'down SQL query';
-- +goose StatementEnd
