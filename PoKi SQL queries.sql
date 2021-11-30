--Investigating the Data

--Q1 - What grades are stored in the database?
select * from grade;

--Q2 - What emotions may be associated with a poem?
select * from emotion;

--Q3 - How many poems are in the database?
select COUNT(*) from poem;

--Q4 - Sort authors alphabetically by name. What are the names of the top 76 authors?
select distinct top 76 Name from author 
ORDER BY name ASC;

--Q5 - Starting with the above query, add the grade of each of the authors.
select distinct top 76 a.Name, b.Name
from author a
join grade b on a.GradeId = b.id
ORDER BY a.Name ASC

--Q6 - Starting with the above query, add the recorded gender of each of the authors.
select distinct top 76 a.Name, b.Name, c.Name
from author a
join grade b on a.GradeId = b.id
join gender c on a.GenderId = c.id
ORDER BY a.Name ASC

--Q7 - What is the total number of words in all poems in the database?
select sum(WordCount) as 'Total Word Count' from poem;

--Q8 - Which poem has the fewest characters?
select distinct Title, CharCount
from Poem
where CharCount = (Select Min(CharCount) from Poem);

--Q9 - How many authors are in the third grade?
select a.Name, b.Name
from author a
join grade b on a.GradeId = b.id
where b.id = 3;

--Q10 - How many total authors are in the first through third grades?
SELECT COUNT(b.id) as 'total count'
from author a
join grade b on a.GradeId = b.id
where b.id = 1 OR b.id = 2 OR b.id = 3

--Q11 - What is the total number of poems written by fourth graders?
select count(b.id) as 'total count'
from author a
join grade b on a.GradeId = b.id
where b.id = 4

--Q12 - How many poems are there per grade?
select COUNT(c.Name) as 'Poem Count', c.Name 'Grade'
from poem a
join author b on a.AuthorId = b.id
join grade c on b.GradeId = c.id
group by c.Name

--Q13 - How many authors are in each grade? (Order your results by grade starting with 1st Grade)
select COUNT(b.Name) as 'Author Count', b.Name 'Grade'
from author a
join grade b on a.GradeId = b.id
group by b.Name

--Q14 - What is the title of the poem that has the most words?
select Title, WordCount
from poem
where WordCount = (Select Max(Wordcount) from Poem)

--Q15 - Which author(s) have the most poems? (Remember authors can have the same name.)
select TOP 3 COUNT(*) as 'Number of Poems', a.Name
from Poem
join author a on a.id=AuthorId
group by a.Name, a.id
order by 'Number of Poems' desc

--Q16 - How many poems have an emotion of sadness?
select COUNT(*) as 'Total Count'
from PoemEmotion
where EmotionId = 3

--Q17 - How many poems are not associated with any emotion?
select COUNT(*) as 'Total Count'
from PoemEmotion a
RIGHT JOIN Poem b on a.PoemId = b.id
where EmotionId is null;

--Q18 - Which emotion is associated with the least number of poems?
select count(PoemId) as 'Total Count', EmotionId
from PoemEmotion
group by emotionId
order by 'Total Count' asc

--Q19 - Which grade has the largest number of poems with an emotion of joy?
select g.Name, COUNT(Poem.id) as 'Poem Count'
from Poem
join Author a on Poem.AuthorId = a.id
join Grade g on g.id = a.GradeId
join PoemEmotion pe on pe.PoemId = Poem.id
join Emotion e on pe.EmotionId = e.id
where e.Name = 'Joy'
group by g.Name
order by count(Poem.id) desc

--Q20 - Which gender has the least number of poems with an emotion of fear?
