use mydb;
use newdb;
Select distinct Games from athlete_events;
SELECT COUNT(distinct Games) as total_g from athlete_events;

with all_countries as
(select Games, nr.region from athlete_events ae join noc_regions nr on nr.noc=ae.noc group by Games, nr.region)
select Games,count(1) as tot_countries from all_countries group by Games order by games;

with t1 as (Select distinct Games, sport from athlete_events),
t2 as (select sport,count(1) as no_of_games from t1 group by sport)
select t2.*,t1.Games from t2 join t1 on t1.sport=t2.sport where no_of_games=1 order by t1.sport;

with t1 as (Select distinct Games, sport from athlete_events),
t2 as (select Games,count(1) as no_of_sports from t1 group by Games)
select * from t2 order by no_of_sports desc;

with t1 as (select Name, team, count(1) as tot_goldmedals from athlete_events where medal='Gold'
    group by Name, team order by tot_goldmedals desc),
    t2 as (select *, dense_rank() over(order by tot_goldmedals desc) as rnk from t1)
select Name,team,tot_goldmedals from t2 where rnk<=5;

select team, sport, Games, count(1) as total_medals from athlete_events
 where medal <> 'NA' and team='India' and sport='Hockey' group by team,sport,Games
  order by total_medals desc;

