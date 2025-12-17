# My Life's Performance Metrics

## Continuous Project
This repository is a fun project for me to use my data engineering skills to track my life metrics which include the following down below:

| Health | Finance | Happiness | Goals Achieved | Memories Made | Water Tracker |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |

### For Health
The idea is the Health column will be divded into two sub-columns:
1. Weight Loss and Tracking
2. Caloric intake Tracking

Data visualization with matplotlib will be made to identify the trend of my weight and caloric intake throughout my life. 

### For Finance
The goal for the Finance column is to divded into three sub-columns:
1. Money saved
2. Money spent
3. Money invested

The idea is to see if there is a trend in an increase in savings, invested, and spent. 

### For Happiness
This metric is quite hard to track, especially with real fluctuations of mood during the day. But the metric will be quantified by the overall mood of the day, pointed at the end of the day. 

Happiness is tracked daily and the idea is to see the trend in happiness or if there are days where the happiness score decreases. 

### Goals Achieved
This column will be broken down into four sub-columns:
1. Self-improvement goals
2. Financial goals
3. Work-related goals
4. Family goals

No graphing will be made to track the goals as each goal is done once and left. 

### Memories Made
This column will not be broken down. In fact, each day will be recorded if a great experience has been made that is considered to be memorable, and if not, the record will be null. 

## Star Schema
Down below is the image of my star schema that details the metrics recorded for each dimension table, and main metrics are then recorded on the fact table to get a grasp on the overall life performance. 

<img src="https://github.com/harrold-mussa/myLife_performanceMetrics/blob/main/data/warehouse/star-schema.png" align="center">

## How Does it Work?
This project uses a containerized data pipeline to track, store, and analyze my life metrics. The entire process is divided into three major stages: 
1. Data Loading
2. Analysis & Transformation
3. Reporting & Visualization

---
<img src="https://github.com/harrold-mussa/myLife_performanceMetrics/blob/main/data/warehouse/ETL-flowchart.png" align="center">

---

### 1. Data Loading: Setting Up the Warehouse (Star Schema)

I used a PostgreSQL database following the **Star Schema** I have designed. 

Down below are the other steps of Step 1:
1.  **Containerization using Docker:** The database is encapsulated in a Docker container using the `postgres:15-alpine` image. 
2.  **Database Launch:** At startup, the server executes the SQL script, creating five Dimension Tables (`Health`, `Finance`, `Happiness`, `Goals_Achieved`, `Memories_Made`) and the Fact Table (`Metrics_Table`).
3.  **Data Ingestion (Manual Entry):** Raw metrics are manually inserted using a SQL client using the VS Code PostgreSQL extensio). Due to Foreign Key constraints, data must always be inserted into the Dimension Tables first, and the resulting primary key IDs are then used to link the event in the central `Metrics_Table`. I will be adding data manually everyday. 

### 2. Analysis & Transformation

This stage uses Python to extract data from the running PostgreSQL server and prepare it for analysis.

1.  **Data Extraction:** I am using a Jupyter Notebook that connects to the PostgreSQL container. It executes **`SELECT`** queries, often involving `JOIN`s, to pull the structured data from the Star Schema into memory.
2.  **Transformation with Pandas:** The extracted data is loaded into a **Pandas DataFrame**. This is where data transformation occurs, such as:
    * Calculating derived metrics, especially how much money I have saved. 
    * Cleaning or reshaping the data as needed for visualization.

### 3. Reporting & Visualization

The final stage presents the insights gained from the stored data.

1.  **Plotting Metrics:** The cleaned and processed DataFrame is passed to the **Matplotlib** library. This generates visualizations, specifically line charts for trends, bar charts for distribution for each major category, such as Weight Loss and Tracking, Money Saved, and Happiness Trends. It will make more sense seeing the data after the metrics are plotted. 
2.  **Insight Generation:** The final charts reveal trends and relationships within the captured metrics, fulfilling the project's goal of using data engineering skills to track and improve personal performance.
