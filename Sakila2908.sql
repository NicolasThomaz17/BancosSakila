select * from actor;
select Concat(first_name,' ',last_name) as Nome
      from actor
      where actor_id = 1;

create function nome_ator(id int)
returns varchar(100)
DETERMINISTIC
begin
declare nome varchar(100);
select Concat(first_name,' ',last_name) into nome
      from actor
      where actor_id = id;
return nome;
end;

select nome_ator(1);
select * from film_actor;
select film_id,nome_ator(actor_id) from film_actor;

select * from customer;
-- QUal o total pago pela Mary
select * from payment;
select * from customer;

select sum(amount) from payment
        where customer_id = 1;

create Function total_pago(id int)
RETURNS decimal(9,2)
DETERMINISTIC
Begin
DECLARE total decimal(9,2);
select sum(amount) into total from payment
        where customer_id = id;
RETURN total;
end;

select total_pago(5);

drop Function total_pago;

create Function total_pago(id int)
RETURNS decimal(9,2)
DETERMINISTIC
Begin
RETURN select sum(amount)  from payment
        where customer_id = id;;
end;

select customer.first_name,sum(payment.amount) from payment
            INNER join customer on payment.customer_id = customer.customer_id
            where payment.customer_id = 1;

select concat(customer.first_name,' ',sum(payment.amount))
            from payment
            INNER join customer on payment.customer_id = customer.customer_id
            where payment.customer_id = 1;

create function total_cliente(codigo int)
RETURNS varchar(100)
DETERMINISTIC
begin
declare mensagem varchar(100);
select concat(customer.first_name,' ',sum(payment.amount)) into mensagem
            from payment
            INNER join customer on payment.customer_id = customer.customer_id
            where payment.customer_id = codigo
            GROUP BY payment.customer_id;
RETURN mensagem;
end;
drop FUNCTION total_cliente;
select total_cliente(1);
select * from customer;
select total_cliente(customer_id) from customer;
select * from payment;
-- Gere o total pago para o staff de codigo 1
create function total_gerente(codigo int)
RETURNS varchar(100)
DETERMINISTIC
begin
declare mensagem varchar(100);
select concat(staff.first_name,' ',sum(payment.amount)) into mensagem
            from payment
            INNER join staff on payment.staff_id = staff.staff_id
            where payment.staff_id = codigo
            GROUP BY payment.staff_id;
RETURN mensagem;
end;
select * from staff;
select total_gerente(staff_id) from staff;
select * from film_category;
select * from category;
-- crie uma funçao para gerar o total de filmes de um genero selecionado
CREATE FUNCTION filmes_genero(id int)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE mensagem VARCHAR(100);
    select CONCAT(COUNT(film_category.film_id),' - ', category.name) into mensagem
    from film_category
    inner join category on film_category.category_id = category.category_id
    where film_category.category_id = id
    GROUP BY film_category.category_id;
return mensagem;

end;



SELECT filmes_genero(category_id) from category;
