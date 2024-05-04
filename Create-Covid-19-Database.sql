drop table phone;

drop table counties;

drop table cities;

drop table zipcodes;

drop table testing;

drop table testingcenters;

drop table residents;

create table residents (
    residentid    int not null,
    primary key ( residentid ),
    ssn           number(9) unique not null,
    firstname     varchar(50) not null,
    lastname      varchar(50) not null,
    streetaddress varchar(500) not null,
    birthdate     date not null,
    age           int
);

create table testingcenters (
    centerid      int not null,
    residentid    int not null,
    foreign key ( residentid )
        references residents ( residentid ),
    primary key ( centerid,
                  residentid ),
    centername    varchar(50) not null,
    phone         number(11) not null,
    streetaddress varchar(50) not null
);

create table phone (
    phone      int not null,
    residentid int not null,
    foreign key ( residentid )
        references residents ( residentid ),
    primary key ( phone,
                  residentid )
);

create table zipcodes (
    zipcodeid  int not null,
    primary key ( zipcodeid ),
    zipcode    int unique,
    residentid int,
    centerid   int,
    constraint fk_resident foreign key ( residentid,
                                         centerid )
        references testingcenters ( residentid,
                                    centerid )
);

create table cities (
    cityid     int not null,
    primary key ( cityid ),
    cityname   varchar(250) not null,
    population int not null,
    zipcodeid  int not null,
    foreign key ( zipcodeid )
        references zipcodes ( zipcodeid )
);

create table counties (
    countyid   int not null,
    primary key ( countyid ),
    countyname varchar(500) unique not null,
    population int not null,
    cityid     int not null,
    foreign key ( cityid )
        references cities ( cityid )
);

create table testing (
    residentid    int,
    centerid      int,
    testingdate   date,
    testingresult varchar(50),
    primary key ( residentid,
                  centerid,
                  testingdate ),
    foreign key ( residentid )
        references residents ( residentid ),
    foreign key ( centerid,
                  residentid )
        references testingcenters ( centerid,
                                    residentid )
);

commit;

-- RESIDENTS
insert into residents (
    residentid,
    ssn,
    firstname,
    lastname,
    streetaddress,
    birthdate,
    age
) values (
    1,
    '882500125',
    'Virginia',
    'Le Houx',
    '99 Shasta Center',
    to_date('1982-03-25','YYYY-MM-DD'),
    round(months_between(
        sysdate,
        date '1982-03-25'
    ) / 12)
);

insert into residents (
    residentid,
    ssn,
    firstname,
    lastname,
    streetaddress,
    birthdate,
    age
) values (
    2,
    '548692423',
    'Augusto',
    'Monteaux',
    '36424 Elgar Pass',
    to_date('1962-02-12','YYYY-MM-DD'),
    round(months_between(
        sysdate,
        date '1962-02-12'
    ) / 12)
);

insert into residents (
    residentid,
    ssn,
    firstname,
    lastname,
    streetaddress,
    birthdate,
    age
) values (
    3,
    '774348014',
    'Jasmine',
    'Bridgeland',
    '39378 Lakewood Gardens Trail',
    to_date('1963-12-05','YYYY-MM-DD'),
    round(months_between(
        sysdate,
        date '1963-12-05'
    ) / 12)
);

insert into residents (
    residentid,
    ssn,
    firstname,
    lastname,
    streetaddress,
    birthdate,
    age
) values (
    4,
    '386479089',
    'Burr',
    'I''anson',
    '329 Clove Place',
    to_date('1977-02-22','YYYY-MM-DD'),
    round(months_between(
        sysdate,
        date '1990-05-15'
    ) / 12)
);

-- testingcenters
insert into testingcenters (
    centerid,
    residentid,
    centername,
    phone,
    streetaddress
) values (
    1,
    4,
    'Reallinks',
    '8074488144',
    '19865 Waxwing Circle'
);

insert into testingcenters (
    centerid,
    residentid,
    centername,
    phone,
    streetaddress
) values (
    2,
    3,
    'Agimba',
    '8762835841',
    '4 Forest Dale Way'
);

insert into testingcenters (
    centerid,
    residentid,
    centername,
    phone,
    streetaddress
) values (
    3,
    4,
    'Linkbuzz',
    '4304976094',
    '386 Summit Pass'
);
--Testing
insert into testing (
    residentid,
    centerid,
    testingdate,
    testingresult
) values (
    3,
    2,
    to_date('2024-02-12','YYYY-MM-DD'),
    'Negative'
);
--Testing
insert into testing (
    residentid,
    centerid,
    testingdate,
    testingresult
) values (
    3,
    2,
    to_date('2024-04-12','YYYY-MM-DD'),
    'Negative'
);
--Testing
insert into testing (
    residentid,
    centerid,
    testingdate,
    testingresult
) values (
    4,
    3,
    to_date('2024-02-12','YYYY-MM-DD'),
    'Negative'
);

-- Phone
insert into phone (
    phone,
    residentid
) values (
    2134985737,
    1
);

insert into phone (
    phone,
    residentid
) values (
    2948573998,
    1
);

insert into phone (
    phone,
    residentid
) values (
    3098543387,
    2
);

insert into phone (
    phone,
    residentid
) values (
    3098543323,
    3
);

insert into phone (
    phone,
    residentid
) values (
    3098543234,
    4
);

-- zipcodes
insert into zipcodes (
    zipcodeid,
    zipcode,
    residentid,
    centerid
) values (
    1,
    18966,
    1,
    null
);

insert into zipcodes (
    zipcodeid,
    zipcode,
    residentid,
    centerid
) values (
    2,
    20395,
    4,
    1
);

insert into zipcodes (
    zipcodeid,
    zipcode,
    residentid,
    centerid
) values (
    3,
    12893,
    null,
    3
);

-- CITIES
insert into cities (
    cityid,
    cityname,
    population,
    zipcodeid
) values (
    1,
    'Los Angeles',
    10000000,
    1
);

insert into cities (
    cityid,
    cityname,
    population,
    zipcodeid
) values (
    2,
    'Philadelphia',
    7000000,
    2
);

insert into cities (
    cityid,
    cityname,
    population,
    zipcodeid
) values (
    3,
    'Orange County',
    2500000,
    3
);

insert into cities (
    cityid,
    cityname,
    population,
    zipcodeid
) values (
    4,
    'Boston',
    8000000,
    3
);

-- COUNTIES
insert into counties (
    countyid,
    countyname,
    population,
    cityid
) values (
    1,
    'Beverly Hills',
    800000,
    1
);

insert into counties (
    countyid,
    countyname,
    population,
    cityid
) values (
    2,
    'Newport Beach',
    125000,
    3
);

insert into counties (
    countyid,
    countyname,
    population,
    cityid
) values (
    3,
    'Norfolk',
    125000,
    4
);

commit;