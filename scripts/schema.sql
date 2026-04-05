-- SQL Schema for Project Skebob
-- Target Database: SQLite
-- Database Version: 3
-- Author: Anton Stepanov (An3step)

CREATE TABLE IF NOT EXISTS facts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fact_text TEXT NOT NULL,
    timestamp INTEGER NOT NULL,
    is_favorite INTEGER DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_facts_timestamp ON facts(timestamp);

SELECT COUNT(*), MAX(LENGTH(fact_text)) FROM facts;

SELECT * FROM facts WHERE is_favorite = 1 AND timestamp >= (strftime('%s','now') * 1000 - 86400000);