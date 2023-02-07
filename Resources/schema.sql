-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Flights" (
    "id" int   NOT NULL,
    "flight_number" int   NOT NULL,
    "airline_code" varchar   NOT NULL,
    "origin" varchar   NOT NULL,
    "destination" varchar   NOT NULL,
    "date" date   NOT NULL,
    "dept_time" time   NOT NULL,
    "arr_time" time   NOT NULL,
    "on_time" int   NOT NULL,
    "cancelled" int   NOT NULL,
    CONSTRAINT "pk_Flights" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Airlines" (
    "airline_code" varchar   NOT NULL,
    "airline_name" varchar   NOT NULL,
    CONSTRAINT "pk_Airlines" PRIMARY KEY (
        "airline_code"
     )
);

CREATE TABLE "Cancelled_Flights" (
    "id" int   NOT NULL,
    "flight_number" int   NOT NULL,
    "cancellation_code" varchar   NOT NULL,
    CONSTRAINT "pk_Cancelled_Flights" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Delayed_Flights" (
    "id" int   NOT NULL,
    "flight_number" int   NOT NULL,
    "arr_time" time   NOT NULL,
    "arr_delay" time   NOT NULL,
    "dept_time" time   NOT NULL,
    "dept_delay" time   NOT NULL,
    "carrier_delay" interval   NOT NULL,
    "weather_delay" interval   NOT NULL,
    "nas_delay" interval   NOT NULL,
    "security_delay" interval   NOT NULL,
    "late_aircaft_delay" interval   NOT NULL,
    CONSTRAINT "pk_Delayed_Flights" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Airport_Codes" (
    "airport_code" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    CONSTRAINT "pk_Airport_Codes" PRIMARY KEY (
        "airport_code"
     )
);

ALTER TABLE "Flights" ADD CONSTRAINT "fk_Flights_flight_number" FOREIGN KEY("flight_number")
REFERENCES "Delayed_Flights" ("flight_number");

ALTER TABLE "Airlines" ADD CONSTRAINT "fk_Airlines_airline_code" FOREIGN KEY("airline_code")
REFERENCES "Flights" ("airline_code");

ALTER TABLE "Delayed_Flights" ADD CONSTRAINT "fk_Delayed_Flights_id_arr_time_dept_time" FOREIGN KEY("id", "arr_time", "dept_time")
REFERENCES "Flights" ("id", "arr_time", "dept_time");

ALTER TABLE "Delayed_Flights" ADD CONSTRAINT "fk_Delayed_Flights_flight_number" FOREIGN KEY("flight_number")
REFERENCES "Cancelled_Flights" ("flight_number");

ALTER TABLE "Airport_Codes" ADD CONSTRAINT "fk_Airport_Codes_airport_code" FOREIGN KEY("airport_code")
REFERENCES "Flights" ("airline_code");

