-- QUESTION 1: Count the total number of students in the dataset.
-- Reason: Provides dataset size and helps understand sample coverage.
SELECT 
    COUNT(*) AS TotalStudents
FROM Students;


-- QUESTION 2: Find the average Exam Score across all students.
-- Reason: Gives a baseline measure of overall student performance.
SELECT 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students;


-- QUESTION 3: Find the average Exam Score grouped by Gender.
-- Reason: Compares performance differences between male and female students.
SELECT 
    Gender, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY Gender;


-- QUESTION 4: Correlation between Hours_Studied and Exam_Score.
-- Reason: Checks if study hours are related to exam performance.
WITH Stats AS (
    SELECT 
        CAST(Hours_Studied AS FLOAT) AS Hours,
        CAST(Exam_Score AS FLOAT) AS Score
    FROM Students
)
SELECT 
    ROUND(
        (AVG(Hours * Score) - (AVG(Hours) * AVG(Score))) 
        / (STDEV(Hours) * STDEV(Score)), 
    3) AS Correlation
FROM Stats;


-- QUESTION 5: Which School_Type has the highest average Exam Score?
-- Reason: Compares Public vs Private schools by performance.
SELECT TOP 1 
    School_Type, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY School_Type
ORDER BY AvgExamScore DESC;


-- QUESTION 6: Attendance effect on Exam Scores.
-- Reason: Groups students into attendance ranges to check performance impact.
SELECT 
    CASE 
        WHEN Attendance < 50 THEN 'Low (0-49%)'
        WHEN Attendance BETWEEN 50 AND 75 THEN 'Medium (50-75%)'
        ELSE 'High (76-100%)'
    END AS AttendanceRange,
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY CASE 
            WHEN Attendance < 50 THEN 'Low (0-49%)'
            WHEN Attendance BETWEEN 50 AND 75 THEN 'Medium (50-75%)'
            ELSE 'High (76-100%)'
         END;


-- QUESTION 7: Compare Exam Scores between students with and without Tutoring.
-- Reason: Evaluates the effectiveness of tutoring sessions.
SELECT 
    CASE WHEN Tutoring_Sessions > 0 THEN 'With Tutoring' ELSE 'No Tutoring' END AS TutoringStatus,
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY CASE WHEN Tutoring_Sessions > 0 THEN 'With Tutoring' ELSE 'No Tutoring' END;


-- QUESTION 8: Distribution of Exam Scores by Parental Education Level.
-- Reason: Analyzes parental influence on student performance.
SELECT 
    Parental_Education_Level, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore, 
    COUNT(*) AS StudentCount
FROM Students
GROUP BY Parental_Education_Level
ORDER BY AvgExamScore DESC;


-- QUESTION 9: Family_Income category vs Exam Scores.
-- Reason: Checks how family income influences exam results.
SELECT 
    Family_Income, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY Family_Income
ORDER BY AvgExamScore DESC;


-- QUESTION 10: Compare Exam Scores of students with and without Extracurricular Activities.
-- Reason: Tests if extracurriculars affect academic outcomes.
SELECT 
    Extracurricular_Activities, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY Extracurricular_Activities;


-- QUESTION 11: Relationship between Internet_Access and Exam Scores.
-- Reason: Measures whether having internet access impacts performance.
SELECT 
    Internet_Access, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY Internet_Access;


-- QUESTION 12: Impact of Motivation_Level on Exam Scores.
-- Reason: Determines how motivation levels influence outcomes.
SELECT 
    Motivation_Level, 
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY Motivation_Level
ORDER BY AvgExamScore DESC;


-- QUESTION 13: Compare Exam Scores of students with Learning Disabilities vs others.
-- Reason: Identifies performance gap for students with disabilities.
SELECT 
    CASE WHEN Learning_Disabilities = 'Yes' THEN 'With Disability' ELSE 'Without Disability' END AS LearningDisability_Status,
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY CASE WHEN Learning_Disabilities = 'Yes' THEN 'With Disability' ELSE 'Without Disability' END;


-- QUESTION 14: Correlation of Hours_Studied, Sleep_Hours, Physical_Activity vs Exam_Score.
-- Reason: Identifies which factor is most strongly linked to exam scores.
SELECT 
    'Hours_Studied' AS Factor,
    ROUND((AVG(CAST(Hours_Studied AS FLOAT) * CAST(Exam_Score AS FLOAT)) 
        - (AVG(CAST(Hours_Studied AS FLOAT)) * AVG(CAST(Exam_Score AS FLOAT))))
    / (STDEV(CAST(Hours_Studied AS FLOAT)) * STDEV(CAST(Exam_Score AS FLOAT))), 3) AS Correlation
FROM Students

UNION ALL
SELECT 
    'Sleep_Hours',
    ROUND((AVG(CAST(Sleep_Hours AS FLOAT) * CAST(Exam_Score AS FLOAT)) 
        - (AVG(CAST(Sleep_Hours AS FLOAT)) * AVG(CAST(Exam_Score AS FLOAT))))
    / (STDEV(CAST(Sleep_Hours AS FLOAT)) * STDEV(CAST(Exam_Score AS FLOAT))), 3)
FROM Students

UNION ALL
SELECT 
    'Physical_Activity',
    ROUND((AVG(CAST(Physical_Activity AS FLOAT) * CAST(Exam_Score AS FLOAT)) 
        - (AVG(CAST(Physical_Activity AS FLOAT)) * AVG(CAST(Exam_Score AS FLOAT))))
    / (STDEV(CAST(Physical_Activity AS FLOAT)) * STDEV(CAST(Exam_Score AS FLOAT))), 3)
FROM Students;


-- QUESTION 15: Top 10 highest scoring students with key attributes.
-- Reason: Highlights top performers and their characteristics.
SELECT TOP 10 
    StudentID, 
    Hours_Studied, 
    Attendance, 
    Motivation_Level, 
	Access_to_resources,
    Gender, 
    School_Type, 
    Family_Income, 
    Exam_Score
FROM Students
ORDER BY Exam_Score DESC;


-- QUESTION 16: Average Exam Score grouped by Sleep_Hours range.
-- Reason: Evaluates the effect of sleep habits on academic results.
SELECT 
    CASE 
        WHEN Sleep_Hours < 5 THEN 'Less than 5 hrs'
        WHEN Sleep_Hours BETWEEN 5 AND 7 THEN '5-7 hrs'
        ELSE '8+ hrs'
    END AS SleepRange,
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY CASE 
            WHEN Sleep_Hours < 5 THEN 'Less than 5 hrs'
            WHEN Sleep_Hours BETWEEN 5 AND 7 THEN '5-7 hrs'
            ELSE '8+ hrs'
         END
ORDER BY AvgExamScore DESC;


-- QUESTION 17: Compare average exam scores across physical activity ranges.
-- Reason: Measures how exercise impacts academic performance.
SELECT 
    CASE 
        WHEN Physical_Activity < 3 THEN 'Low Activity (<3 hrs)'
        WHEN Physical_Activity BETWEEN 3 AND 6 THEN 'Moderate Activity (3-6 hrs)'
        ELSE 'High Activity (7+ hrs)'
    END AS PhysicalActivity_Level,
    ROUND(AVG(Exam_Score), 3) AS AvgExamScore
FROM Students
GROUP BY CASE 
            WHEN Physical_Activity < 3 THEN 'Low Activity (<3 hrs)'
            WHEN Physical_Activity BETWEEN 3 AND 6 THEN 'Moderate Activity (3-6 hrs)'
            ELSE 'High Activity (7+ hrs)'
         END
ORDER BY AvgExamScore DESC;
