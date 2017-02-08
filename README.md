information needed to get app running.

database name:
moneycashboard

add tables to database:
psql -d moneycashboard -f db/moneycashboard.sql

seed database with data:
ruby db/seeds.rb