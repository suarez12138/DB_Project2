create function min_seat(num character varying, stop1 integer, stop2 integer) returns integer
    language plpgsql
as
$$
begin
    return (select min(spear_seat)
            from (select t.spear_seat
                  from train t
                  where t.train_num = num
                    and t.stop_num >= stop1
                    and t.stop_num < stop2) as tss);
end;
$$;

alter function min_seat(varchar, integer, integer) owner to checker;
