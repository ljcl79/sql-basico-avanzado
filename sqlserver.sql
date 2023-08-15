
DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
  id int NOT NULL IDENTITY,
  name varchar(255) DEFAULT NULL,
  address varchar(max),
  phone varchar(32) DEFAULT NULL,
  email varchar(64) DEFAULT NULL,
  workdays varchar(3) CHECK (workdays IN ('Lun','Mar','Mie','Jue','Vie','Sab','Dom')),
  init_time time(0) DEFAULT NULL,
  end_time time(0) DEFAULT NULL,
  ticket_time time(0) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id varchar(128) NOT NULL,
  fullname varchar(255) DEFAULT NULL,
  password varchar(32) DEFAULT NULL,
  PRIMARY KEY (id)
) ;
/* SQLINES DEMO *** er_set_client = @saved_cs_client */;

--
-- SQLINES DEMO *** table `users`
--

/* SQLINES DEMO ***  `users` DISABLE KEYS */;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO users VALUES ('1','Leonardo Jose','MundosE@2023');
/* SQLINES DEMO ***  `users` ENABLE KEYS */;


CREATE INDEX email_idx ON stores (email);
/* SQLINES DEMO *** er_set_client = @saved_cs_client */;

--
-- SQLINES DEMO *** table `stores`


--
-- SQLINES DEMO *** or table `test`
--

DROP TABLE IF EXISTS test;
CREATE TABLE test (
  name varchar(128) NOT NULL,
  PRIMARY KEY (name)
) ;
/* SQLINES DEMO *** er_set_client = @saved_cs_client */;

--
-- SQLINES DEMO *** table `test`
--


--
-- SQLINES DEMO *** or table `tickets`
--

DROP TABLE IF EXISTS tickets;
/* SQLINES DEMO *** cs_client     = @@character_set_client */;
/* SQLINES DEMO *** er_set_client = utf8mb4 */;
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE tickets (
  id int NOT NULL IDENTITY,
  user_id varchar(128) NOT NULL,
  store_id int DEFAULT NULL,
  date_time datetime2(0) DEFAULT NULL,
  status varchar(64) DEFAULT NULL,
  observation varchar(max),
  PRIMARY KEY (id)
,
  CONSTRAINT tickets_store_FK FOREIGN KEY (store_id) REFERENCES stores (id),
  CONSTRAINT tickets_users_FK FOREIGN KEY (user_id) REFERENCES users (id)
) ;

CREATE INDEX tickets_users_FK ON tickets (user_id);
CREATE INDEX tickets_store_FK ON tickets (store_id);
