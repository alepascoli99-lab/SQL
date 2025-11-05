# Q1) [EN]
# Add yourself as a customer.
# Q1) [NL]
# Voeg jezelf toe als klant.

insert into klanten (naam, voornaam, adres, postcode, woonplaats, klantStatus, totaalGehuurd, datumLid, lidgeld)
values
('PASCOLI', 'ALESSIA', 'TIELEMANSLAAN 4', '3000', 'LEUVEN', '1', '81', '2016-02-22 00:00:00', 1);

# Q2) [EN]
# Increase the price of all movies with company code 'VH' by 10%.
# Q2) [NL]
# Geef alle films met maatschappijCode 'VH' een prijsverhoging van 10%.

update films set prijs = ROUND(prijs * 1.1, 2)
where maatschappijId = (select maatschappijId from maatschappijen where maatschappijCode = 'VH');

# Q3) [EN]
# Create a table with only the movies of the genre 'Thriller'.
# Q3) [NL]
# Maak een table met enkel de films van het genre 'Thriller'.

create table thriller
as select * from films
where genreId = (select genreId from genres where genre = 'THRILLER');

select titel, genre from thriller
inner join genres on thriller.genreId = genres.genreid;

# Q4) [EN]
# Add a field 'emailAddress' to the table 'companies'.
# This field may be a maximum of 40 characters long and may not be empty.
# Q4) [NL]
# Voeg aan de table 'maatschappijen' een veld 'mailadres' toe.
# Dit veld mag maximaal 40 tekens lang zijn en mag niet leeg zijn.

alter table maatschappijen
add mailadres varchar(40) not null;

# Q5) [EN]
# Define all necessary keys.
# Q5) [NL]
# Definieer alle nodige keys.

#- PRIMARY KEYS -

alter table films
add constraint pk_films primary key (filmId);

alter table genres
add constraint pk_genres primary key (genreId);

alter table klanten
add constraint pk_klanten primary key (klantId);

alter table maatschappijen
add constraint pk_maatschappijen primary key (maatschappijId);

alter table thriller
add constraint pk_thriller primary key (filmId);

alter table verhuringen
add constraint pk_verhuringen primary key (verhuringId);

# - FOREIGN KEYS -

alter table films
add constraint f_genreId foreign key (genreId) references genres (genreId);

alter table films
add constraint f_maatschappijId foreign key (maatschappijId) references maatschappijen (maatschappijId);

alter table thriller
add constraint f_thriller_maatschappijId foreign key (maatschappijId) references maatschappijen (maatschappijId);

alter table verhuringen
add constraint f_klantId foreign key (klantId) references klanten (klantId);
