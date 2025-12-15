-- Data Definitions following the quickdb.txt and star-schema.png image

---- Dropping Fact Table if it exists already

DROP TABLE IF EXISTS Metrics_Table CASCADE;

---- Dropping Dimension Tables
DROP TABLE IF EXISTS Health;
DROP TABLE IF EXISTS Finance;
DROP TABLE IF EXISTS Happiness;
DROP TABLE IF EXISTS Goals_Achieved;
DROP TABLE IF EXISTS Memories_Made;

---- Fact Table

CREATE TABLE Metrics_Table (
    metrics_pk_id SERIAL PRIMARY KEY,
    Goal_metric_id INTEGER,
    Memories_metric_id INTEGER,
    Happiness_metric_id INTEGER,
    Health_metric_id INTEGER,
    Finance_metric_id INTEGER,

    FOREIGN KEY (Goal_metric_id) REFERENCES Goals_Achieved(Goal_metric_id),
    FOREIGN KEY (Memories_metric_id) REFERENCES Memories_Made(Memories_metric_id),
    FOREIGN KEY (Happiness_metric_id) REFERENCES Happiness(Happiness_metric_id),
    FOREIGN KEY (Health_metric_id) REFERENCES Health(Health_metric_id),
    FOREIGN K
);

---- Dimensions Tables

CREATE TABLE Health (
    Health_metric_id SERIAL PRIMARY KEY,
    Weight_loss NUMERIC,
    Worked_out BOOLEAN,
    Took_vitamins BOOLEAN,
    Ate_healthy BOOLEAN
);

CREATE TABLE Finance (
    Finance_metric_id SERIAL PRIMARY KEY,
    Updated_budget BOOLEAN,
    Saved_money NUMERIC,
    Invested_money NUMERIC
);

CREATE TABLE Happiness (
    Happiness_metric_id SERIAL PRIMARY KEY,
    Happy_mood BOOLEAN,
    Productive BOOLEAN
);

CREATE TABLE Goals_Achieved (
    Goal_metric_id SERIAL PRIMARY KEY, 
    Selfcare_improvements_made BOOLEAN,
    Financial_improvements_made BOOLEAN,
    Health_improvements_made BOOLEAN,
    Read BOOLEAN,
    Studied_OU BOOLEAN,
    Studied_DE BOOLEAN,
    Studied_french BOOLEAN
);

CREATE TABLE Memories_Made (
    Memories_metric_id SERIAL PRIMARY KEY,
    Good_day BOOLEAN
);