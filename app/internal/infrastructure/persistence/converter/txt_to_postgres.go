package infrastructure_converter

import (
	"bufio"
	"context"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"

	domain_vocabulary_entity "github.com/L1z1ng3r-sswe/vocabulary_trainer/app/internal/domain/vocabulary/entity"
)

func (c *converter) ConvertTXTToPostgres(ctx context.Context) error {
	err := c.txManager.ReadCommitted(ctx, func(txCtx context.Context) error {

		file, err := os.Open(c.txtFilePath)
		if err != nil {
			return fmt.Errorf("failed to open file: %w", err)
		}
		defer file.Close()

		scanner := bufio.NewScanner(file)

		for scanner.Scan() {

			wordLine := scanner.Text()
			parts := strings.Split(wordLine, "\\")
			if len(parts) != 3 {
				return fmt.Errorf("invalid word line: %v", wordLine)
			}

			rate, err := strconv.Atoi(strings.TrimSpace(parts[2]))
			if err != nil {
				return fmt.Errorf("invalid rate: %v", parts[2])
			}

			currentWord := domain_vocabulary_entity.Word{
				WordPronStress: strings.TrimSpace(parts[0]),
				Translation:    strings.TrimSpace(parts[1]),
				Rate:           rate,
			}

			wordID, err := c.vocabularyRepository.InsertWord(txCtx, currentWord)
			if err != nil {
				return fmt.Errorf("failed to insert word: %w", err)
			}

			for i := 0; i < 3; i++ {
				if !scanner.Scan() {
					return fmt.Errorf("unexpected end of file when reading sentences for word: %v", currentWord.WordPronStress)
				}
				sentenceLine := scanner.Text()
				sentenceParts := strings.Split(sentenceLine, "\\")
				if len(sentenceParts) != 3 {
					return fmt.Errorf("invalid sentence line: %v", sentenceLine)
				}

				sentenceRate, err := strconv.Atoi(strings.TrimSpace(sentenceParts[2]))
				if err != nil {
					return fmt.Errorf("invalid sentence rate: %v", sentenceParts[2])
				}

				sentence := domain_vocabulary_entity.Sentence{
					WordID:      wordID,
					Sentence:    strings.TrimSpace(sentenceParts[0]),
					Translation: strings.TrimSpace(sentenceParts[1]),
					Rate:        sentenceRate,
				}

				_, err = c.vocabularyRepository.InsertSentence(txCtx, sentence)
				if err != nil {
					return fmt.Errorf("failed to insert sentence: %w", err)
				}
			}
		}

		if err := scanner.Err(); err != nil {
			return fmt.Errorf("error reading file: %w", err)
		}

		log.Println("Data has been successfully inserted into the database.")
		return nil
	})

	if err != nil {
		return err
	}
	return nil
}
