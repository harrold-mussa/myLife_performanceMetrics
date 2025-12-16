<<<<<<< HEAD
-- DDL for Star Schema based on myLife_performanceMetrics

DROP TABLE IF EXISTS Metrics_Table CASCADE;
DROP TABLE IF EXISTS Health;
DROP TABLE IF EXISTS Finance;
DROP TABLE IF EXISTS Happiness;
DROP TABLE IF EXISTS Goals_Achieved;
DROP TABLE IF EXISTS Memories_Made;

-- DIMENSION TABLES

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

-- FACT TABLE

CREATE TABLE Date (
    date_id DATE PRIMARY KEY,
    day_of_week INTEGER,
    month INTEGER,
    year INTEGER
);

CREATE TABLE Metrics_Table (
    metrics_pk_id SERIAL PRIMARY KEY,
    Goal_metric_id INTEGER,
    Memories_metric_id INTEGER,
    Happiness_metric_id INTEGER,
    Health_metric_id INTEGER,
    Finance_metric_id INTEGER,
    date_id DATE,

    FOREIGN KEY (Goal_metric_id) REFERENCES Goals_Achieved(Goal_metric_id),
    FOREIGN KEY (Memories_metric_id) REFERENCES Memories_Made(Memories_metric_id),
    FOREIGN KEY (Happiness_metric_id) REFERENCES Happiness(Happiness_metric_id),
    FOREIGN KEY (Health_metric_id) REFERENCES Health(Health_metric_id),
    FOREIGN KEY (Finance_metric_id) REFERENCES Finance(Finance_metric_id)
);
=======
-- Database to create databases based on life metrics
>>>>>>> fd93179 ([Update][1.5] : Creation of ddl_schema file . waiting for creation of docker postgresql image)
