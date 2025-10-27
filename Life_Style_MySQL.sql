use assessments;
SELECT * FROM assessments.life_style;

-- 1. Find the total number of male and female participants in the dataset.
select Gender,count(Gender) as Total_count_M_F from life_style group by Gender;

-- 2. Display the average calories burned for each gender.
select Gender, round(avg(Calories_Burned),2) from life_style group by Gender;

-- 3.List all distinct workout types available in the dataset.
select distinct Workout_Type from life_style;

-- 4.Retrieve the top 5 exercises that have the highest average calories burned.

select Name_of_Exercise, round(avg(Calories_Burned),2) from life_style 
group by Name_of_Exercise order by avg(Calories_Burned) desc limit 5;

-- 5.Find the average session duration for each workout type

select Workout_Type, round(avg(Session_Duration_Minutes),2) as Average_Session_Duration 
from life_style group by Workout_Type;

-- INTERMEDIATE LEVEL

-- 6.Identify which workout type burns the most calories per minute on average.

select Workout_type, 
round(avg(Calories_Burned / Session_Duration_Minutes),2) as Avg_CAL_Burned_Per_Min 
from life_style group by Workout_Type 
order by avg(Calories_Burned) desc limit 1;

-- 7.Find the most common target muscle group among “Advanced” difficulty exercises.

select Target_Muscle_Group,count(Target_Muscle_Group) from life_style 
where Difficulty_Level = 'Advanced'
group by Target_Muscle_Group order by Difficulty_Level desc limit 1;

-- 8.Calculate the average water intake and calories burned grouped by experience level.

select Experience_Level,round(avg(Calories_Burned),2) as Average_Calories_Burned, 
round(avg(Water_intake_Liters),2) as Average_Water_intake 
from life_style group by Experience_Level;

-- 9.Determine which diet type results in the highest average calories burned.

select Diet_type, round(avg(Calories_burned),2) as Average_Calories_Burned from life_style 
group by Diet_type order by avg(Calories_Burned) desc limit 1;

-- 10.Group people based on their BMI category (Underweight, Normal, Overweight, Obese) and find the average calories burned for each group.

select case when BMI < 18.5 then 'UNDEREEIGHT'
when BMI between 18.5 and 24.9 then "NORMAL"
else "OBESE"
END AS BMI_CATEGORY,Round(AVG(Calories_Burned), 2) as Avg_Calories_Burned
From life_style
group by  BMI_Category
Order by Avg_Calories_Burned Desc;


-- 11.Find the top 3 exercises that burn the most calories per repetition.

select Name_of_Exercise, round(avg(Calories_Burned / Reps),2) as Avg_Cal_Burned_per_Reps 
from life_style group by Name_of_Exercise 
order by avg(Calories_Burned / Reps) desc limit 3;

-- 12.Show the average protein intake for each combination of gender and workout type.

select Gender,Workout_Type,round(avg(Protein_Intake),2) as Average_Protein_Intake 
from life_style group by Gender,Workout_Type;

-- 13.Retrieve the top 5 most frequently performed exercises by people with “Advanced” experience level.

select Name_of_Exercise, Experience_Level,count(Name_of_Exercise) 
from life_style where Experience_Level='Advanced' 
group by Name_of_Exercise order by count(Name_of_Exercise) desc limit 5;

-- 14.Find which muscle group is most frequently targeted in HIIT workouts.

select Target_Muscle_Group, count(Target_Muscle_Group), Workout_Type 
from life_style where Workout_Type = 'HIIT' 
group by (Target_Muscle_Group)
order by count(Target_Muscle_Group) desc limit 1;

-- 15.Identify the average calories burned and average heart rate (Avg_BPM) for each difficulty level

select Experience_Level, 
round(avg(Calories_Burned),2) as Average_Calories_Burned ,
round(avg(Avg_BPM)) as Average_BPM 
from life_style group by Experience_Level;