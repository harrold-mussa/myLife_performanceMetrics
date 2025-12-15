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

CREATE TABLE Metrics_table (
    id SERIAL PRIMARY KEY,
    goal_metric_id INT,
    memories_metric_id INT,
    health_metric_id INT,
    finance_metric_id INT,
    happiness_metric_id INT,
    
    FOREIGN KEY (goal_metric_id) REFERENCES Goals_Achieved(Goal_metric)
    FOREIGN KEY (memories_metric_id) REFERENCES Memories_made(Memories_metric),
    FOREIGN KEY (health_metric_id) REFERENCES Health(Health_metric),
    FOREIGN KEY (finance_metric_id) REFERENCES Finance(Finance_metric)
    FOREIGN KEY (happiness_metric_id) REFERENCES Happiness(Happiness_metric)
);

---- Dimensions Tables

CREATE TABLE Health (
    Health_metric SERIAL PRIMARY KEY,
    Weight_loss NUMERIC, 
    Worked_out BOOLEAN,
    Took_vitamins BOOLEAN, 
    Ate_healthy BOOLEAN
)

CREATE TABLE Finance (
    Finance_metric SERIAL PRIMARY KEY,
    Updated_budget BOOLEAN, 
    Saved_money NUMERIC,
    Invested_money NUMERIC
)

CREATE TABLE Happiness (
    Happiness_metric SERIAL PRIMARY KEY, 
    Happy_mood BOOLEAN,
    Productive BOOLEAN
)

CREATE TABLE Goals_Achieved (
    Goal_metric SERIAL PRIMARY KEY,
    Selfcare_improvements_made BOOLEAN,
    Financial_improvement_made BOOLEAN,
    Health_improvements_made BOOLEAN,
    Read BOOLEAN,
    Studied_OU BOOLEAN,
    Studied_DE BOOLEAN,
    Studied_french BOOLEAN
)

CREATE TABLE Memories_made (
    Memories_metric SERIAL PRIMARY KEY,
    Good_day BOOLEAN
)


