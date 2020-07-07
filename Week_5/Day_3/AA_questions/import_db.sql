PRAGMA foreign_keys= ON;

CREATE TABLE  users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
); 

INSERT INTO users (fname, lname)
VALUES
    ("Aatef", "Baransy"),
    ("Rawi", "Baransy"),
    ("Lubna", "Baransy"),
    ("Anan", "Baransy");

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO questions(title, body, author_id)
SELECT "Why are we here?", "Why are we here??", 1
FROM users
WHERE users.fname = "Aatef" AND users.lname = "Baransy";


INSERT INTO questions (title, body, author_id)
SELECT "Another question", "Some random text", 2
FROM users
WHERE users.fname = "Rawi" AND users.lname = "Baransy";



CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL, 
    author_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    BODY TEXT NOT NULL,

    FOREIGN KEY question_id REFERENCES questions(id),
    FOREIGN KEY parent_reply_id REFERENCES replies(id),
    FOREIGN KEY author_id REFERENCES users(id)
);

CREATE TABLE questions_like (
    id INTEGER PRIMARY KEY 
    user_id INTEGER NOT NULL 
    question_id INTEGER NOT NULL 

    FOREIGN KEY(user_id) REFERENCES user(id)
    FOREIGN KEY(question_id) REFERENCES question(id)
);