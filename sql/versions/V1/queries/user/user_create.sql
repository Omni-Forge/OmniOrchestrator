WITH new_user AS (
    SELECT 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM users 
                WHERE email = ?
            ) 
            THEN RAISE(ROLLBACK, 'Error: Email already exists.')
        END
) 
INSERT INTO users (
    email, 
    name, 
    password, 
    active, 
    last_login_at, 
    created_at, 
    updated_at
) 
VALUES (
    ?, 
    ?, 
    ?, 
    ?, 
    NULL, 
    CURRENT_TIMESTAMP, 
    CURRENT_TIMESTAMP
);