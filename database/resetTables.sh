#drop old tables
#psql -U fetcher1 -c  "
#    DROP TABLE recipes CASCADE;
#    DROP TABLE customers CASCADE;
#    DROP TABLE meals CASCADE;
#    DROP TABLE mealLine CASCADE;
#    DROP TABLE favorites CASCADE;
#" main;

#create new tables

#TODO: change password field to be proper length of a hash

psql -U fetcher1 -c  "
CREATE TABLE recipes (
    recipeid SERIAL NOT NULL, 
    recipename varchar(100) NOT NULL, 
    ingredients varchar(100000) NOT NULL,
    instructions varchar(100000) NOT NULL, 
    creatorid int NOT NULL,
    creationdate timestamptz NOT NULL, 
    vegetarian boolean DEFAULT FALSE,
    vegan boolean DEFAULT FALSE,
    kosher boolean DEFAULT FALSE,
    nutfree boolean DEFAULT FALSE,
    wheatfree boolean DEFAULT FALSE,
    soyfree boolean DEFAULT FALSE,
    glutenfree boolean DEFAULT FALSE,
    dairyfree boolean DEFAULT FALSE,
    private boolean DEFAULT FALSE,
        PRIMARY KEY (recipeID));


CREATE TABLE customers (
    userID SERIAL NOT NULL,
    username varchar(40) NOT NULL,
    Email varchar(320) NOT NULL,
    Passwd varchar(127) NOT NULL,
        PRIMARY KEY (userID));


CREATE TABLE meals (
    mealid SERIAL NOT NULL,
    mealname varchar(30) NOT NULL,
    customerid int NOT NULL,
    creationdate timestamptz,
        PRIMARY KEY (mealid));


CREATE TABLE mealline (
    meallineid SERIAL NOT NULL,
    mealid int NOT NULL,
    recipeid int NOT NULL,
    day smallint,
        PRIMARY KEY (mealLineid));
        
CREATE TABLE favorites (
    favoriteid SERIAL NOT NULL,
    recipeid int NOT NULL,
    userid int,
        PRIMARY KEY (favoriteid));

" main;
            
#add constraints between tables for foreign key consistency

psql -U fetcher1 -c  "

ALTER TABLE recipes 
ADD CONSTRAINT fk_creator
    FOREIGN KEY(creatorid)
        REFERENCES customers(userid)
            ON DELETE CASCADE;
            
ALTER TABLE meals
ADD CONSTRAINT fk_customer
    FOREIGN KEY(customerid)
        REFERENCES customers(userid)
            ON DELETE CASCADE;
            
ALTER TABLE mealline
ADD CONSTRAINT fk_meal
    FOREIGN KEY(mealid)
        REFERENCES meals(mealid)
            ON DELETE CASCADE;
            
ALTER TABLE favorites
ADD CONSTRAINT fk_fav_rec
    FOREIGN KEY(recipeid)
        REFERENCES recipes(recipeid)
            ON DELETE CASCADE;
            
ALTER TABLE favorites
ADD CONSTRAINT fk_fav_cus
    FOREIGN KEY(userid)
        REFERENCES customers(userid)
            ON DELETE CASCADE;

" main;
