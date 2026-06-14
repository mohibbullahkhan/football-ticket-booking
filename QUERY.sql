DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;


-- tables create
CREATE TABLE Users (
    user_id      SERIAL       PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(150) NOT NULL UNIQUE,
    role         VARCHAR(50)  NOT NULL,
    phone_number VARCHAR(20)
);


CREATE TABLE Matches (
    match_id            SERIAL         PRIMARY KEY,
    fixture             VARCHAR(200)   NOT NULL,
    tournament_category VARCHAR(100)   NOT NULL,
    base_ticket_price   NUMERIC(10, 2) NOT NULL,
    match_status        VARCHAR(50)    NOT NULL
);



CREATE TABLE Bookings (
    booking_id     SERIAL         PRIMARY KEY,
    user_id        INT            NOT NULL REFERENCES Users(user_id),
    match_id       INT            NOT NULL REFERENCES Matches(match_id),
    seat_number    VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost     NUMERIC(10, 2) NOT NULL
);