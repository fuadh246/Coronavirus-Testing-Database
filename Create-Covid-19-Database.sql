drop table phone;
drop table counties;
drop table cities;
drop table zip_codes;
drop table testing_centers;
drop table residents;

create table residents (
	residentid     int not null,
	primary key ( residentid ),
	ssn            number(9) unique not null,
	first_name     varchar(50) not null,
	last_name      varchar(50) not null,
	street_address varchar(500) not null,
	birthdate      date not null
);


create table testing_centers (
	centerid       int not null,
	residentid     int not null,
	foreign key ( residentid )
		references residents ( residentid ),
	primary key ( centerid,
	              residentid ),
	center_name    varchar(50) not null,
	phone          number(11) not null,
	street_address varchar(50) not null
);


create table phone (
	phone      int not null,
	residentid int not null,
	foreign key ( residentid )
		references residents ( residentid ),
	primary key ( phone,
	              residentid )
);

create table zip_codes (
	zipcodeid  int not null,
	primary key ( zipcodeid ),
	zip_code   int unique,
	residentid int,
	centerid   int,
	constraint fk_resident foreign key ( residentid,
	                                     centerid )
		references testing_centers ( residentid,
		                             centerid )
);


create table cities (
	cityid     int not null,
	primary key ( cityid ),
	city_name  varchar(250) not null,
	population int not null,
	zipcodeid  int not null,
	foreign key ( zipcodeid )
		references zip_codes ( zipcodeid )
);

create table counties (
	countyid    int not null,
	primary key ( countyid ),
	county_name varchar(500) unique not null,
	population  int not null,
	cityid      int not null,
	foreign key ( cityid )
		references cities ( cityid )
);


commit;


-- RESIDENTS
insert into residents (
	residentid,
	ssn,
	first_name,
	last_name,
	street_address,
	birthdate
) values (
	1,
	'882500125',
	'Virginia',
	'Le Houx',
	'99 Shasta Center',
	to_date('1982-03-25','YYYY-MM-DD')
);

insert into residents (
	residentid,
	ssn,
	first_name,
	last_name,
	street_address,
	birthdate
) values (
	2,
	'548692423',
	'Augusto',
	'Monteaux',
	'36424 Elgar Pass',
	to_date('1962-02-12','YYYY-MM-DD')
);

insert into residents (
	residentid,
	ssn,
	first_name,
	last_name,
	street_address,
	birthdate
) values (
	3,
	'774348014',
	'Jasmine',
	'Bridgeland',
	'39378 Lakewood Gardens Trail',
	to_date('1963-12-05','YYYY-MM-DD')
);

insert into residents (
	residentid,
	ssn,
	first_name,
	last_name,
	street_address,
	birthdate
) values (
	4,
	'386479089',
	'Burr',
	'I''anson',
	'329 Clove Place',
	to_date('1977-02-22','YYYY-MM-DD')
);

-- TESTING_CENTERS
insert into testing_centers (
	centerid,
	residentid,
	center_name,
	phone,
	street_address
) values (
	1,
	4,
	'Reallinks',
	'8074488144',
	'19865 Waxwing Circle'
);
insert into testing_centers (
	centerid,
	residentid,
	center_name,
	phone,
	street_address
) values (
	2,
	3,
	'Agimba',
	'8762835841',
	'4 Forest Dale Way'
);
insert into testing_centers (
	centerid,
	residentid,
	center_name,
	phone,
	street_address
) values (
	3,
	4,
	'Linkbuzz',
	'4304976094',
	'386 Summit Pass'
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

-- ZIP_CODES
insert into zip_codes (
	zipcodeid,
	zip_code,
	residentid,
	centerid
) values (
	1,
	18966,
	1,
	null
);
insert into zip_codes (
	zipcodeid,
	zip_code,
	residentid,
	centerid
) values (
	2,
	20395,
	4,
	1
);
insert into zip_codes (
	zipcodeid,
	zip_code,
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
	city_name,
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
	city_name,
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
	city_name,
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
	city_name,
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
	county_name,
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
	county_name,
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
	county_name,
	population,
	cityid
) values (
	3,
	'Norfolk',
	125000,
	4
);

commit;


select *
  from phone;