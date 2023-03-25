
#2 

select actor_id, count(film_id) as total_films_played from film_actor group by actor_id order by count(film_id) desc;
create or replace view starring_actors as
with cte_actors_in_movies as (
select actor_id, count(film_id) as total_films_played
from film_actor
group by actor_id
order by count(film_id) desc
)
select * from cte_actors_in_movies;
select * from starring_actors;

select fa.film_id, title, concat(first_name, " ", last_name) as actor_name, sa.total_films_played
from starring_actors sa
join film_actor fa
on sa.actor_id = fa.actor_id
join film f
on fa.film_id = f.film_id
join actor a
on sa.actor_id = a.actor_id;