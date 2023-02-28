--------------CREATING TABLE-------------------------------
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    movie_title VARCHAR(255),
    release_year INT,
    plot_summary TEXT
);

CREATE TABLE Media (
    media_id INT PRIMARY KEY,
    media_type ENUM('video', 'image'),
    media_url VARCHAR(255),
    movie_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    review_text TEXT,
    rating INT,
    user_id INT,
    movie_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255)
);

CREATE TABLE Artist_Skill (
    artist_id INT,
    skill_name VARCHAR(255),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(255)
);

CREATE TABLE Movie_Cast (
    movie_id INT,
    artist_id INT,
    role_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id)
);



-----------------------INSERT DATA-------------------------------------------


INSERT INTO Movie (movie_id, movie_title, release_year, plot_summary) VALUES (1, 'Kabali', 2016, 'Kabali is a 2016 Indian Tamil-language action crime film.');

INSERT INTO Media (media_id, media_type, media_url, movie_id) VALUES (1, 'video', 'https://www.youtube.com/watch?v=9mdJV5-eias', 1);

INSERT INTO Genre (genre_id, genre_name) VALUES (1, 'Action');
INSERT INTO Genre (genre_id, genre_name) VALUES (2, 'Crime');

INSERT INTO Movie_Genre (movie_id, genre_id) VALUES (1, 1);
INSERT INTO Movie_Genre (movie_id, genre_id) VALUES (1, 2);

INSERT INTO User (user_id, user_name, email) VALUES (1, 'Jeeva', 'jeeva123@gmail.com');

INSERT INTO Review (review_id, review_text, rating, user_id, movie_id) VALUES (1, 'Great movie!', 5, 1, 1);

INSERT INTO Artist (artist_id, artist_name) VALUES (1, 'Rajinikanth');

INSERT INTO Artist_Skill (artist_id, skill_name) VALUES (1, 'Acting');
INSERT INTO Artist_Skill (artist_id, skill_name) VALUES (1, 'Dancing');

INSERT INTO Role (role_id, role_name) VALUES (1, 'Lead Actor');

INSERT INTO Movie_Cast (movie_id, artist_id, role_id) VALUES (1, 1, 1);
