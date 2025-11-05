# Q1) [EN]
# Provide a list of customers from Gent or Wetteren with the fields name, first name, postal code, city, and customer status.
# Sort by customer status and name.
# Q1) [NL]
# Geef een lijst van de klanten uit Gent of Wetteren met de velden naam, voornaam, postcode, woonplaats en klantstatus.
# Sorteer op klantstatus en naam.

select naam, voornaam, postcode, woonplaats, klantStatus from klanten
where woonplaats = 'gent' or woonplaats = 'wetteren'
order by klantStatus, naam;

# Q2) [EN]
# Create a list of customers whose postal code is greater than or equal to 9000 and customers whose rental count is greater than 200.
# This list must be sorted by postal code.
# Q2) [NL]
# Maak een lijst van de klanten waarvan de postcode groter of gelijk is aan 9000 en de klanten waarvan het huuraantal groter is dan 200.
# Deze lijst moet gesorteerd worden op postcode.

# Solution 1: one unique list of all costumers with postal code equal to or greater than 9000
# whose rental count is greater than 200, sorted by postal code.
select * from klanten
where postcode >= 9000 and totaalGehuurd > 200
order by postcode;

# Solution 2: one list of all costumers with postal code equal to or greater than 9000 and, separately,
# another list of all costumers whose rental count is greater than 200, sorted by postal code.
select * from klanten
where postcode >= 9000 or totaalGehuurd > 200
order by postcode;

# Q3) [EN]
# Provide a list of customers whose name does not start with a 'd'.
# Q3) [NL]
# Geef een lijst van de klanten wiens naam niet begint met een 'd'.

select * from klanten
where naam not like 'd%'
order by naam;

# Q4) [EN]
# Provide a list of customers where the third character in the city name is an 'n'.
# Q4) [NL]
# Geef een lijst van klanten waar in de naam van de gemeente op de derde plaats een 'n' staat.

select * from klanten
where woonplaats like '__n%'
order by naam;

# Q5) [EN]
# Calculate the price including VAT (21%) for all films.
# Q5) [NL]
# Bereken voor alle films de prijs incl BTW (21%).

select titel, prijs, prijs*1.21 as prijs_inclBTW from films;

# Q6) [EN]
# From which cities do our customers come?
# Q6) [NL]
# Uit welke woonplaatsen komen onze klanten?

select distinct woonplaats from klanten
order by woonplaats;

# Q7) [EN]
# Create a list of the number of customers per city.
# Q7) [NL]
# Maak een lijst van het aantal klanten per gemeente.

select woonplaats, count(*) as aantal_klanten from klanten
group by woonplaats
order by woonplaats;

# Q8) [EN]
# Maak een lijst die het mogelijk maakt een inzicht te krijgen in de verhuringen per gemeente.
# Op deze lijst moet de gemeente/stad met de meeste verhuringen bovenaan staan.
# Indien in een bepaalde gemeente geen 200 verhuringen gebeurd zijn, mag deze gemeente niet op de lijst staan.
# Q8) [NL]
# Create a list that provides insight into rentals per city.
# The city with the most rentals should appear at the top of the list.
# If a city has fewer than 200 rentals, it should not appear on the list.

select woonplaats, sum(totaalGehuurd) as tot_verhuringen from klanten
group by woonplaats
having tot_verhuringen > 200
order by tot_verhuringen desc;