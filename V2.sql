select *
  from residents;

select r.first_name,
       r.last_name,
       p.phone
  from residents r
  join phone p
on r.residentid = p.residentid;