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