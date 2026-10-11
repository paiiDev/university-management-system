-- ===========================================================================
-- Group-I UMS - MySQL schema
--
-- Usage:
--   mysql -u root -p < database/schema.sql
--
-- The application expects a database named `ums` (configurable through
-- db.url in application.properties).
-- ===========================================================================

CREATE DATABASE IF NOT EXISTS ums
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE ums;

-- ---------------------------------------------------------------------------
-- Student login accounts
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS acc (
    username VARCHAR(100) NOT NULL,
    mail     VARCHAR(150) NOT NULL,
    password VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Student registration records
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS newstureg (
    year        VARCHAR(20),
    name        VARCHAR(150),
    fname       VARCHAR(150),
    nrc         VARCHAR(50),
    dob         VARCHAR(20),
    nationality VARCHAR(100),
    religion    VARCHAR(100),
    rno         VARCHAR(50),
    major       VARCHAR(100),
    acyear      VARCHAR(50),
    address     VARCHAR(255),
    ph          VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Assignments & tutorials schedule
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS tuto (
    year    VARCHAR(20),
    subcode VARCHAR(50),
    subject VARCHAR(150),
    time    VARCHAR(50),
    date    VARCHAR(50),
    aort    VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Announcements shown on the student dashboard
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS announcement (
    message TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------------------------
-- Optional sample data
-- ---------------------------------------------------------------------------
-- INSERT INTO announcement (message) VALUES ('Welcome to the UCSPL student portal.');
--
-- INSERT INTO acc (username, mail, password) VALUES
--     ('student01', 'student01@ucspinlon.edu.mm', 'changeme');
