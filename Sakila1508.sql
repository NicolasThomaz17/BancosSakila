use sakila;
select first_name as Nome,
       last_name  as SobreNome
from actor
order by first_name;

select * from customer;
select * from address;
select * from customer
        inner join address on customer.address_id = address.address_id
        inner join city on address.city_id = city.city_id ;
-- Gere uma consulta com o nome do cliente e seu endereço completo
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

-- Quais pagamentos a Mary realizou, liste todos
select  payment.payment_id as Codigo,
        customer.first_name as Nome,
        payment.amount as Valor
        from payment
        inner join customer on payment.customer_id = customer.customer_id
        where customer.customer_id = 1;

-- Qual o total gasto pela Mary

select  customer.first_name as Nome,
        sum(payment.amount) as total
        from payment
        inner join customer on payment.customer_id = customer.customer_id
        where customer.customer_id = 1;

select  customer.first_name as Nome,
        sum(payment.amount) as total
        from payment
        inner join customer on payment.customer_id = customer.customer_id
        GROUP BY  customer.customer_id
        ORDER BY nome;
