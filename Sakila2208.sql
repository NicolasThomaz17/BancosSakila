select customer.first_name as Nome,
       customer.last_name as Sobrenome,
       address.address as 'Endereço',
       address.district as Bairro,
       address.postal_code as Cep,
       city.city as Cidade,
       country.country as Pais
       from customer
        inner join address on customer.address_id = address.address_id
        inner join city on address.city_id = city.city_id
        inner join country on city.country_id = country.country_id
        order by nome;

create view cliente_endereco AS
    select customer.first_name as Nome,
       customer.last_name as Sobrenome,
       address.address as 'Endereço',
       address.district as Bairro,
       address.postal_code as Cep,
       city.city as Cidade,
       country.country as Pais
       from customer
        inner join address on customer.address_id = address.address_id
        inner join city on address.city_id = city.city_id
        inner join country on city.country_id = country.country_id
        order by nome;

select * from cliente_endereco;
drop view cliente_endereco;
select * from customer;
update customer  set first_name = 'MARIA' where customer_id = 1;

create table copia_cliente as
         Select * from customer;

SELECT * from copia_cliente;
update copia_cliente  set first_name = 'MARIA';
delete from copia_cliente;
-- Crie uma view para listar o nome do cliente com o total gasto em locação.
select * from payment;


select  customer.first_name,
        sum(payment.amount)
        from payment
        inner join customer on payment.customer_id = customer.customer_id
        GROUP BY payment.customer_id;

create view cliente_total AS
        select  customer.first_name,
        sum(payment.amount)
        from payment
        inner join customer on payment.customer_id = customer.customer_id
        GROUP BY payment.customer_id;
select * from cliente_total;

-- Crie uma view para listar os 10 generos mais alugados
select * from rental;
select * from inventory;

select category.name,count(*)
        from rental
        inner join inventory on rental.inventory_id = inventory.inventory_id
        inner join film_category on inventory.film_id = film_category.film_id
        inner join category on film_category.category_id = category.category_id
        GROUP BY category.name
        ORDER BY 2 DESC
        limit 11;

create view list_categoria AS
     select category.name,count(*)
        from rental
        inner join inventory on rental.inventory_id = inventory.inventory_id
        inner join film_category on inventory.film_id = film_category.film_id
        inner join category on film_category.category_id = category.category_id
        GROUP BY category.name
        ORDER BY 2 DESC
        limit 11;

select * from list_categoria;

-- Crie um VIEW com o nome do ator e o titulo do filme que ator participou.
select * from actor;
create view film_ator as
        select film.title,actor.first_name from film
        INNER join film_actor on film.film_id = film_actor.film_id
        INNER join actor on film_actor.actor_id = actor.actor_id;
