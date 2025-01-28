# Relational-Database-Certification
Projects and code developed as part of a course on relational databases and essential developer tools. The focus is on building practical skills using Bash &amp; Terminal, PostgreSQL and Git



###############
worldcupdb

-wordcup.sql:

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


+------------+   +------------+
|   teams    |   |   games    |
+------------+   +------------+
| team_id    | ← | winner_id  |
| name       |   | opponent_id|
+------------+   | year       |
                 | round      |
                 | winner_goals  |
                 | opponent_goals |
                 +------------+

-insert_data.sh: a Bash script that inserts data from a games.csv file into the worldcup database
-queries.sh: a Bash script that imports data from a games.csv file into the worldcup database. It ensures that teams are not imported twice and deletes old data before importing new data.
###############

###############
number_guess

CREATE TABLE public.info (
    player_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);

CREATE TABLE public.games_info (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);

-number_guess.sql: 

+------------+    +------------+
|   info     |    | games_info |
+------------+    +------------+
| player_id  |←── | player_id  |
| username   |    | game_id    |
| games_played |  | guesses    |
| best_game  |    +------------+
+------------+

-number_guess.sh:a Bash script that implements a Number Guessing Game using the number_guess database. Searches for the user in the database, If the player is new, adds him to the database, If the player has already played, displays his stats. Creates a random number, the user enters a value and the number is compared to the random number:
If the value is less, it displays "It's higher than that".
If the value is higher, it displays "It's lower than that".
If the value is correct, it displays the message "You guessed it in X tries" and stops the game.

###############

dbPeriodic_Table

-periodic_table.sql:

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(40) NOT NULL
);

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    atomic_mass numeric NOT NULL,
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL,
    type_id integer NOT NULL
);

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying(20) NOT NULL
);

+------------+    +------------+    +------------+
|  elements  |    | properties |    |   types    |
+------------+    +------------+    +------------+
| atomic_number |→ | atomic_number |            |
| symbol        |    | atomic_mass  |            |
| name          |    | melting_point|→| type_id  |
+------------+    | boiling_point |  | type      |
                  | type_id       |  +------------+
                  +------------+

-element.sh: a Bash script that looks up data from the periodic_table database and returns information about it.

###############
###############
salon_appointment

salon.sql:

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(20),
    name character varying(20)
);

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(20)
);

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer,
    service_id integer,
    "time" character varying(20)
);

+------------+    +------------+    +------------+
| customers  |    | appointments |    | services   |
+------------+    +------------+    +------------+
| customer_id |←── | customer_id |  ->| service_id |
| phone       |    | service_id  |-/  | name       |
| name        |    | time        |    +------------+
+------------+    +------------+

salon.sh:a Bash script that manages appointments for the salon, allowing customers to select services and book appointments.

###############
###############

athletic_e-shop

athletic_e_shop.sql:

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying(10),
    last_name character varying(10),
    e_mail character varying(30),
    address character varying(30)
);

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(20),
    description character varying(20),
    price numeric,
    stock integer
);

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric
);

CREATE TABLE public.order_items (
    order_items_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    unit_price numeric
);

+------------+    +------------+    +------------+    +------------+
| customers  |    |   orders   |    | order_items|    |  products  |
+------------+    +------------+    +------------+    +------------+
| customer_id |→  | customer_id |    | order_id  |→  | product_id  |
| first_name  |    | order_date |    | product_id |→ | name        |
| last_name   |    | total_amt  |    | quantity   |   | description |
| e_mail      |    +------------+    | unit_price |   | price       |
| address     |                       +------------+   | stock       |
+------------+                                          +------------+

queries.sh: a Bash script that implements an ordering system for the athletik_e_shop online store via the PostgreSQL database. The user can view the product catalog, select items, pay and complete an order.
