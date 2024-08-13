DSN="user=postgres dbname=postgres host=localhost port=5432 password=asyl12345. sslmode=disable"

run:
	go run app/cmd/vocabulary_trainer/main.go

pg_start:
	docker start some-postgres

cli-db:
	psql -h localhost -U postgres -d postgres
	
	# \dt - for looking existing tables
	# \q - to close connection
	# \d table_name - to see the table

migrate_create:
	goose -s -dir ./migrations create vocabulary sql

migrate_up:
	goose -dir ./migrations postgres ${DSN} up

migrate_down:
	goose -dir ./migrations postgres ${DSN} down
