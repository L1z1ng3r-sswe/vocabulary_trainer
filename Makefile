DSN="host=localhost port=5431 user=postgres password=asyl12345. dbname=postgres sslmode=disable"

run: docker_start
	go run app/cmd/vocabulary_trainer/main.go

docker_start:
	docker start vocabulary-trainer

restore:
	PGPASSWORD=asyl12345. psql -U postgres -d postgres -h localhost -p 5431 -f ./storage/sql/.sql

cli_db: docker_start
	PGPASSWORD=asyl12345. pgcli -h localhost -U postgres -d postgres -p 5431
	# \dt - for looking existing tables
	# \q - to close connection
	# \d table_name - to see the table

migrate_create:
	goose -s -dir ./schema/migrations create vocabulary sql

migrate_up:
	goose -dir ./schema/migrations postgres ${DSN} up

migrate_down:
	goose -dir ./schema/migrations postgres ${DSN} down


