# Q1) [EN]
# Provide a list of films whose title contains neither the word "kill" nor the word "blood".
# We only want films from the genres horror and thriller.
# Q1) [NL]
# Geef een lijst van de films die in de titel noch het woord "kill" noch het woord "blood" hebben.
# We willen enkel de films van de genres griezel en thriller.

select titel, genre from films
inner join genres on films.genreId = genres.genreId
where (genre = 'griezel' or genre = 'thriller')
and titel not like '%blood%'
and titel not like '%kill%'
order by genre;

# Q2) [EN]
# Create a list of who rents which films. Sort ascending by name and title.
# Q2) [NL]
# Maak een lijst van wie welke films huurt. Sorteer oplopend op naam en titel.

select naam, voornaam, titel from verhuringen
inner join klanten on verhuringen.klantId = klanten.klantId
inner join films on verhuringen.filmId = films.filmId
order by naam, voornaam, titel;

# Q3) [EN]
# What is the total stock per genre?
# Q3) [NL]
# Wat is de totale voorraad per genre?

select genre, sum(voorraad) as tot_voorraad_per_genre from films
inner join genres on films.genreId = genres.genreId
group by genre
order by genre;

# Q4) [EN]
# Provide all data of the most expensive film.
# Q4) [NL]
# Geef alle gegevens van de duurste film.

select * from films
where prijs = (select max(prijs) from films);