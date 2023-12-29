/*A) Marketing Analysis:
Loyal User Reward: The marketing team wants to reward the most loyal users, 
i.e., those who have been using the platform for the longest time.
Your Task: Identify the five oldest users on Instagram from the provided database.*/

Select * from users
order by created_at asc
limit 5;

------------------------------------------------------------------------------------------

/*Inactive User Engagement: The team wants to encourage inactive users to start posting
by sending them promotional emails.
Your Task: Identify users who have never posted a single photo on Instagram.*/

SELECT T1.ID, T1.username
FROM users T1
WHERE T1.ID NOT IN
(SELECT user_id
FROM photos);

/*Contest Winner Declaration: The team has organized a contest where the user
with the most likes on a single photo wins.
Your Task: Determine the winner of the contest and provide their details to the team.*/

SELECT users.username, photos.id, COUNT(likes.user_id) AS like_count
FROM users
JOIN photos ON users.id = photos.user_id
JOIN likes ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY like_count DESC
limit 1;

---------------------------------------------------------------------------------------------

/*Hashtag Research: A partner brand wants to know the most popular hashtags to use in their 
posts to reach the most people.
Your Task: Identify and suggest the top five most commonly used hashtags on the platform.*/

select tags.tag_name, count(*) as num_users
from photo_tags
join tags on photo_tags.tag_id = tags.id
group by tags.tag_name
order by num_users desc;

-------------------------------------------------------------------------------------------

/*Ad Campaign Launch: The team wants to know the best day of the week to launch ads.
Your Task: Determine the day of the week when most users register on Instagram. 
Provide insights on when to schedule an ad campaign.*/

SELECT DAYNAME(created_at) AS day, COUNT(*) AS num_users
FROM users
GROUP BY day
ORDER BY num_users DESC;

---------------------------------------------------------------------------------------



