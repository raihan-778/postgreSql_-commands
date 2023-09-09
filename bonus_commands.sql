-- Active: 1694014328483@@127.0.0.1@5432@advanced_sql_commands@public
--## Store PROCEDURE method
create PROCEDURE deactivate_unpaid_account()
language sql
as $$
UPDATE accounts set account=false WHERE balande=0
-- inside this ""$$ $$"" syntex we can you multipl sql command.


CALL deactivate_unpaid_account()-- If we need we can use this FUNCTION repetedly


--## Functional method
create Function account_type_count (account_type text) RETURNS int
language plpgsql
as $$
declare account_count integer
    begin
        SELECT count(*) into account_count from accounts WHERE accounts.account_type=$1
        return account_count
    end
$$

--Trigger & function 

create TABLE products(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    base_price float8 NOT NULL,
    final_price float8
);

select * from products

insert into products(title, base_price) values('Black', 105)


create or REPLACE TRIGGER add_tex_trigger
AFTER
INSERT ON products
for each ROW
EXECUTE FUNCTION update_final_price();



CREATE OR REPLACE FUNCTION update_final_price()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
    BEGIN
    NEW.final_price := NEW.base_price * 1.05;
    RETURN NEW;
    END;
$$;