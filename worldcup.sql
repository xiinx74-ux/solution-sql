>     $PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT(name) DO NOTHING"
>     $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT(name) DO NOTHING"
>     
>     # Get IDs and Insert Game...
>   fi
> done
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
camper: /project$ #!/bin/bash
camper: /project$ 
camper: /project$ if [[ $1 == "test" ]]
> then
>   PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
> else
>   PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
> fi
camper: /project$ 
camper: /project$ # Do not change code above this line. Use the PSQL variable above to query your database.
camper: /project$ 
camper: /project$ # Clear existing data to ensure a fresh start if running multiple times
camper: /project$ $PSQL "TRUNCATE teams, games"
TRUNCATE TABLE
camper: /project$ 
camper: /project$ # Read the csv file, skipping the header
camper: /project$ cat games.csv | tail -n +2 | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
> do
>   # Insert winners into teams table
>   $PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT(name) DO NOTHING"
>   
>   # Insert opponents into teams table
>   $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT(name) DO NOTHING"
> done
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 0
INSERT 0 1
camper: /project$ psql --username=freecodecamp --dbname=worldcup -c "SELECT COUNT(*) FROM teams;"
 count 
-------
    24
(1 row)

camper: /project$ TRUNCATE games, teams RESTART IDENTITY;
bash: TRUNCATE: command not found
camper: /project$ psql --username=freecodecamp --dbname=worldcup -c "TRUNCATE games, teams RESTART IDENTITY;"
TRUNCATE TABLE
camper: /project$ ./insert_data.sh
camper: /project$ SELECT COUNT(*) FROM teams;
bash: syntax error near unexpected token `('
camper: /project$ 24
bash: 24: command not found
camper: /project$ SELECT COUNT(*) FROM teams;
bash: syntax error near unexpected token `('
camper: /project$ SELECT * FROM teams ORDER BY team_id;
bash: SELECT: command not found
camper: /project$ #!/bin/bash
camper: /project$ 
camper: /project$ if [[ $1 == "test" ]]
> then
>   PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
> else
>   PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
> fi
camper: /project$ 
camper: /project$ # Clear existing data
camper: /project$ $PSQL "TRUNCATE teams, games"
TRUNCATE TABLE
camper: /project$ 
camper: /project$ # Process the CSV
camper: /project$ cat games.csv | tail -n +2 | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
> do
>   # 1. Insert teams (ensure they exist first)
>   $PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT(name) DO NOTHING"
>   $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT(name) DO NOTHING"
> 
>   # 2. Get the team_ids
>   WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
>   OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
> 
>   # 3. Insert the game
>   $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
>          VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)"
> done
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
camper: /project$ #!/bin/bash
camper: /project$ 
camper: /project$ if [[ $1 == "test" ]]
> then
>   PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
> else
>   PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
> fi
camper: /project$ 
camper: /project$ # Clear existing data
camper: /project$ $PSQL "TRUNCATE teams, games"
TRUNCATE TABLE
camper: /project$ 
camper: /project$ # Process the CSV
camper: /project$ cat games.csv | tail -n +2 | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
> do
>   # 1. Insert teams (ensure they exist first)
>   $PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT(name) DO NOTHING"
>   $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT(name) DO NOTHING"
> 
>   # 2. Get the team_ids
>   WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
>   OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
> 
>   # 3. Insert the game
>   $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
>          VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)"
> done
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]
then
  $PSQL "INSERT INTO games(...)"
fiINSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
INSERT 0 0
INSERT 0 0
INSERT 0 1
INSERT 0 0
INSERT 0 1
INSERT 0 1
camper: /project$ if [[ -n $WINNER_ID && -n $OPPONENT_ID ]]
> then
>   $PSQL "INSERT INTO games(...)"
> fi
camper: /project$ --
bash: --: command not found
camper: /project$ -- PostgreSQL database dump
bash: --: command not found
camper: /project$ --
ublbash: --: command not found
camper: /project$ 
camper: /project$ -- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
bash: syntax error near unexpected token `('
camper: /project$ -- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
bash: syntax error near unexpected token `('
nal', 8, 15, 2, 1)camper: /project$ 
camper: /project$ SET statement_timeout = 0;

INSERT INTO public.games Vbash: SET: command not found
camper: /project$ SET lock_timeout = 0;
bash: SET: command not found
camper: /project$ SET idle_in_transaction_session_timeout = 0;
bash: SET: command not found
camper: /project$ SET client_encoding = 'UTF8';
bash: SET: command not found
camper: /project$ SET standard_conforming_strings = on;
bash: SET: command not found
camper: /project$ SELECT pg_catalog.set_config('search_path', '', false);
bash: syntax error near unexpected token `('
S (18, 2014, 'Third Place', 18, 7, 3, 0);
INSERcamper: /project$ SET check_function_bodies = false;
bash: SET: command not found
camper: /project$ SET xmloption = content;
bash: SET: command not found
camper: /project$ SET client_min_messages = warning;
bash: SET: command not found
camper: /project$ SET row_security = off;
bash: SET: command not found
camper: /project$ 
camper: /project$ DROP DATABASE worldcup;
bash: DROP: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
NSbash: --: command not found
camper: /project$ 
camper: /project$ CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
RT INTO public.games VALUES (22, 2014, 'Quarter-Final', 16, 3, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'bash: CREATE: command not found
camper: /project$ 
camper: /project$ 
ucamper: /project$ ALTER DATABASE worldcup OWNER TO freecodecamp;
bash: ALTER: command not found
camper: /project$ 
camper: /project$ \connect worldcup
VALUES (24, 20bash: connect: command not found
camper: /project$ 
1camper: /project$ SET statement_timeout = 0;
4, 'Quarter-Final', 17, 1, bash: SET: command not found
camper: /project$ SET lock_timeout = 0;
bash: SET: command not found
camper: /project$ SET idle_in_transaction_session_timeout = 0;
bash: SET: command not found
camper: /project$ SET client_encoding = 'UTF8';
bash: SET: command not found
camper: /project$ SET standard_conforming_strings = on;
bash: SET: command not found
camper: /project$ SELECT pg_catalog.set_config('search_path', '', false);
bash: syntax error near unexpected token `('
camper: /project$ SET check_function_bodies = false;
bash: SET: command not found
camper: /project$ SET xmloption = content;
O public.games Vbash: SET: command not found
camper: /project$ SET client_min_messages = warning;
bash: SET: command not found
camper: /project$ SET row_security = off;
bash: SET: command not found
camper: /project$ 
camper: /project$ SET default_tablespace = '';
ublic.games VALUES (29, 2014bash: SET: command not found
camper: /project$ 
,camper: /project$ SET default_table_access_method = heap;
bash: SET: command not found
camper: /project$ 
camper: /project$ --
O bash: --: command not found
camper: /project$ -- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
ES (30, 2014, 'Eighth-Final', 19, 23, 2, 1);
INSbash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
RTbash: --: command not found
camper: /project$ 
camper: /project$ CREATE TABLE public.games (
bash: syntax error near unexpected token `('
camper: /project$     game_id integer NOT NULL,
bash: game_id: command not found
camper: /project$     year integer NOT NULL,
bash: year: command not found
camper: /project$     round character varying(20) NOT NULL,
bash: syntax error near unexpected token `('
camper: /project$     winner_id integer NOT NULL,
bash: winner_id: command not found
camper: /project$     opponent_id integer NOT NULL,
bash: opponent_id: command not found
camper: /project$     winner_goals integer NOT NULL,
bash: winner_goals: command not found
camper: /project$     opponent_goals integer NOT NULL
bash: opponent_goals: command not found
camper: /project$ );
bash: syntax error near unexpected token `)'
camper: /project$ 
acamper: /project$ 
ncamper: /project$ ALTER TABLE public.games OWNER TO freecodecamp;
bash: ALTER: command not found
camper: /project$ 
camper: /project$ --
')bash: --: command not found
camper: /project$ -- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ CREATE SEQUENCE public.games_game_id_seq
NTO public.teams VAbash: CREATE: command not found
camper: /project$     AS integer
bash: AS: command not found
camper: /project$     START WITH 1
bash: START: command not found
camper: /project$     INCREMENT BY 1
bash: INCREMENT: command not found
camper: /project$     NO MINVALUE
bash: NO: command not found
camper: /project$     NO MAXVALUE
bash: NO: command not found
camper: /project$     CACHE 1;
Ubash: CACHE: command not found
camper: /project$ 
camper: /project$ 
camper: /project$ ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;
bash: ALTER: command not found
camper: /project$ 
camper: /project$ --
;
bash: --: command not found
camper: /project$ -- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;
bash: ALTER: command not found
camper: /project$ 
camper: /project$ 
icamper: /project$ --
bash: --: command not found
camper: /project$ -- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
ERT INTO public.teams VALUES (13, bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
'Debash: --: command not found
camper: /project$ 
camper: /project$ CREATE TABLE public.teams (
bash: syntax error near unexpected token `('
camper: /project$     team_id integer NOT NULL,
bash: team_id: command not found
camper: /project$     name character varying(20) NOT NULL
bash: syntax error near unexpected token `('
INTO public.teams VALUES (15, 'Portucamper: /project$ );
bash: syntax error near unexpected token `)'
galcamper: /project$ 
'camper: /project$ 
camper: /project$ ALTER TABLE public.teams OWNER TO freecodecamp;
bash: ALTER: command not found
camper: /project$ 
acamper: /project$ --
');bash: --: command not found
camper: /project$ -- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ CREATE SEQUENCE public.teams_team_id_seq
bash: CREATE: command not found
camper: /project$     AS integer
bash: AS: command not found
camper: /project$     START WITH 1
bash: START: command not found
camper: /project$     INCREMENT BY 1
bash: INCREMENT: command not found
camper: /project$     NO MINVALUE
ams VALUES (20, bash: NO: command not found
camper: /project$     NO MAXVALUE
bash: NO: command not found
camper: /project$     CACHE 1;
bash: CACHE: command not found
camper: /project$ 
tcamper: /project$ 
camper: /project$ ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;
ams VALUES (21, 'Nigeria');
INSERT INTO public.teams VALUES bash: ALTER: command not found
camper: /project$ 
(camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;
bash: ALTER: command not found
camper: /project$ 
camper: /project$ 
Ecamper: /project$ --
bash: --: command not found
camper: /project$ -- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
_camper: /project$ ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);
bash: syntax error near unexpected token `('
camper: /project$ 
acamper: /project$ 
camper: /project$ --
p
-bash: --: command not found
camper: /project$ -- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);
bash: syntax error near unexpected token `('
: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
  camper: /project$ 
camper: /project$ 
 camper: /project$ --
bash: --: command not found
camper: /project$ -- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
Tcamper: /project$ INSERT INTO public.games VALUES (1, 2018, 'Final', 1, 2, 4, 2);
bash: syntax error near unexpected token `('
ype: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER Tcamper: /project$ INSERT INTO public.games VALUES (2, 2018, 'Third Place', 3, 4, 2, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 2, 4, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 1, 3, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 2, 5, 3, 2);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 4, 6, 2, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 3, 7, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 1, 8, 2, 0);
bash: syntax error near unexpected token `('
REIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: camper: /project$ INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 4, 9, 2, 1);
bash: syntax error near unexpected token `('
a: public; Owner:camper: /project$ INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 6, 10, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 3, 11, 3, 2);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 7, 12, 2, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 2, 13, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 5, 14, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 8, 15, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 1, 16, 4, 3);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (17, 2014, 'Final', 17, 16, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (18, 2014, 'Third Place', 18, 7, 3, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 16, 18, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 17, 7, 7, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 18, 19, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 16, 3, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 7, 9, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 17, 1, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 7, 20, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 9, 8, 2, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 1, 21, 2, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 17, 22, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 18, 12, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 19, 23, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 16, 10, 1, 0);
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 3, 24, 2, 1);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ INSERT INTO public.teams VALUES (1, 'France');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (2, 'Croatia');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (3, 'Belgium');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (4, 'England');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (5, 'Russia');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (6, 'Sweden');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (7, 'Brazil');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (8, 'Uruguay');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (9, 'Colombia');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (10, 'Switzerland');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (11, 'Japan');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (12, 'Mexico');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (13, 'Denmark');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (14, 'Spain');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (15, 'Portugal');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (16, 'Argentina');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (17, 'Germany');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (18, 'Netherlands');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (19, 'Costa Rica');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (20, 'Chile');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (21, 'Nigeria');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (22, 'Algeria');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (23, 'Greece');
bash: syntax error near unexpected token `('
camper: /project$ INSERT INTO public.teams VALUES (24, 'United States');
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER TABLE ONLY public.games
bash: ALTER: command not found
camper: /project$     ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER TABLE ONLY public.teams
bash: ALTER: command not found
camper: /project$     ADD CONSTRAINT teams_name_key UNIQUE (name);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER TABLE ONLY public.teams
bash: ALTER: command not found
camper: /project$     ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER TABLE ONLY public.games
bash: ALTER: command not found
camper: /project$     ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
bash: --: command not found
bash: Type:: command not found
bash: Schema:: command not found
bash: Owner:: command not found
camper: /project$ --
bash: --: command not found
camper: /project$ 
camper: /project$ ALTER TABLE ONLY public.games
bash: ALTER: command not found
camper: /project$     ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);
bash: syntax error near unexpected token `('
camper: /project$ 
camper: /project$ 
camper: /project$ --
bash: --: command not found
camper: /project$ -- PostgreSQL database dump complete
bash: --: command not found
camper: /project$ --------------------------------------------------------------
bash: --------------------------------------------------------------: command not found
camper: /project$ 1.Create Database and connect to it
bash: 1.Create: command not found
camper: /project$ ------------------------------------------------------------
bash: ------------------------------------------------------------: command not found
camper: /project$ psql --username=freecodecamp --dbname=postgres;
psql (12.22 (Ubuntu 12.22-0ubuntu0.20.04.4))
Type "help" for help.

postgres=> 
postgres=> CREATE DATABASE worldcup;
ERROR:  database "worldcup" already exists
postgres=> 
postgres=> \c worldcup
You are now connected to database "worldcup" as user "freecodecamp".
worldcup=> 
worldcup=> ------------------------------------------------------------
worldcup=> 2. Create tables as required conditions
worldcup-> ------------------------------------------------------------
worldcup-> 
worldcup-> CREATE TABLE teams (
worldcup(>     team_id SERIAL NOT NULL,
worldcup(>     name VARCHAR(20) UNIQUE NOT NULL
worldcup(> );
ERROR:  syntax error at or near "2."
LINE 1: 2. Create tables as required conditions
        ^
worldcup=> 
worldcup=> CREATE TABLE games (
worldcup(>     game_id SERIAL NOT NULL,
worldcup(>     year INTEGER NOT NULL,
worldcup(>     round VARCHAR(20) NOT NULL,
worldcup(>     winner_id      INTEGER NOT NULL,
worldcup(>     opponent_id    INTEGER NOT NULL,
worldcup(>     winner_goals   INTEGER NOT NULL,
worldcup(>     opponent_goals INTEGER NOT NULL
worldcup(> );
ERROR:  relation "games" already exists
worldcup=> 
worldcup=> ------------------------------------------------------------
worldcup=> 3. Primary Key and Foreign Key assignment
worldcup-> ------------------------------------------------------------
worldcup-> ALTER TABLE teams ADD PRIMARY KEY (team_id)
worldcup-> ALTER TABLE games ADD PRIMARY KEY (game_id)
worldcup-> ALTER TABLE games ADD FOREIGN KEY (winner_id)   REFERENCES teams (team_id)
worldcup-> ALTER TABLE games ADD FOREIGN KEY (opponent_id) REFERENCES teams (team_id)
worldcup-> 
worldcup-> ------------------------------------------------------------
worldcup-> 4.Give executable permission to shell scipt files
worldcup-> ------------------------------------------------------------
worldcup-> chmod +x insert_data.sh
worldcup-> chmod +x queries.sh
worldcup-> 
worldcup-> ------------------------------------------------------------
worldcup-> 5.Copy & Run shell script files (NOTE : insert data first)
worldcup-> ------------------------------------------------------------
worldcup-> ./insert_data.sh
worldcup-> ./queries.sh
worldcup-> 
worldcup-> ------------------------------------------------------------
worldcup-> 6. Compact queries into worldcup.sql file.
worldcup-> 6. Compact sql db queries into worldcup.sql file.
worldcup-> ------------------------------------------------------------
worldcup-> pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
