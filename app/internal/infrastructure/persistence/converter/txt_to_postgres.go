package infrastructure_converter

import (
	"bufio"
	"context"
	"fmt"
	"os"
	"strconv"
	"strings"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

func (c *converter) ConvertTXTToPostgres(ctx context.Context) error {
	err := c.txManager.ReadCommitted(ctx, func(txCtx context.Context) error {
		lines, err := c.readFileLines(c.txtFilePath)
		if err != nil {
			return err
		}

		for i := 0; i < len(lines); i += 4 {
			word, err := c.parseWordLine(lines[i])
			if err != nil {
				return err
			}

			wordID, err := c.vocabularyRepository.InsertWord(txCtx, word)
			if err != nil {
				return fmt.Errorf("failed to insert word: %w", err)
			}

			for j := 1; j <= 3; j++ {
				sentence, err := c.parseSentenceLine(lines[i+j], wordID)
				if err != nil {
					return err
				}

				_, err = c.vocabularyRepository.InsertSentence(txCtx, sentence)
				if err != nil {
					return fmt.Errorf("failed to insert sentence: %w", err)
				}
			}
		}

		return nil
	})

	if err != nil {
		return err
	}
	return nil
}

func (c *converter) readFileLines(filePath string) ([]string, error) {
	file, err := os.Open(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to open file: %w", err)
	}
	defer file.Close()

	var lines []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		return nil, fmt.Errorf("error reading file: %w", err)
	}

	return lines, nil
}

func (c *converter) parseWordLine(line string) (domain_vocabulary_entity.Word, error) {
	parts := strings.Split(line, "\\")
	if len(parts) != 3 {
		return domain_vocabulary_entity.Word{}, fmt.Errorf("invalid word line: %v", line)
	}

	rate, err := strconv.Atoi(strings.TrimSpace(parts[2]))
	if err != nil {
		return domain_vocabulary_entity.Word{}, fmt.Errorf("invalid rate: %v", parts[2])
	}

	return domain_vocabulary_entity.Word{
		WordPronStress: strings.TrimSpace(parts[0]),
		Translation:    strings.TrimSpace(parts[1]),
		Rate:           rate,
	}, nil
}

func (c *converter) parseSentenceLine(line string, wordID int64) (domain_vocabulary_entity.Sentence, error) {
	parts := strings.Split(line, "\\")
	if len(parts) != 3 {
		return domain_vocabulary_entity.Sentence{}, fmt.Errorf("invalid sentence line: %v", line)
	}

	rate, err := strconv.Atoi(strings.TrimSpace(parts[2]))
	if err != nil {
		return domain_vocabulary_entity.Sentence{}, fmt.Errorf("invalid sentence rate: %v", parts[2])
	}

	return domain_vocabulary_entity.Sentence{
		WordID:      wordID,
		Sentence:    strings.TrimSpace(parts[0]),
		Translation: strings.TrimSpace(parts[1]),
		Rate:        rate,
	}, nil
}
