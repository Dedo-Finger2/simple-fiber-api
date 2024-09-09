-- name: GetUser :one
SELECT * FROM users WHERE id = $1;

-- name: GetUserPhoneNumbers :many
SELECT * FROM phone_numbers WHERE user_id = $1;

-- name: DeleteUserPhoneNumbers :exec
DELETE FROM phone_numbers WHERE user_id = $1;

-- name: StoreUser :one
INSERT INTO users (id, name, email, password, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *;
