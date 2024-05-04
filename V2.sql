select *
  from residents;

select r.firstname,
       r.lastname,
       p.phone
  from residents r
  join phone p
on r.residentid = p.residentid;