--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.2.4
-- Started on 2013-07-16 19:59:09 EDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 5
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


SET search_path = "public", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 22235)
--

CREATE TABLE "activities" (
    "id" integer NOT NULL,
    "version" integer,
    "event_type" character varying,
    "occurred_at" timestamp with time zone[],
    "author" character varying,
    "project_id" integer,
    "description" "text"
);



--
-- TOC entry 170 (class 1259 OID 22251)
--

CREATE TABLE "activity_stories" (
    "activity_id" integer NOT NULL,
    "story_id" integer NOT NULL
);



--
-- TOC entry 175 (class 1259 OID 22315)
--

CREATE TABLE "iteration_stories" (
    "iteration_id" integer NOT NULL,
    "story_id" integer NOT NULL
);



--
-- TOC entry 173 (class 1259 OID 22299)
--

CREATE TABLE "iterations" (
    "id" integer NOT NULL,
    "number" integer NOT NULL,
    "start" timestamp with time zone,
    "finish" timestamp with time zone,
    "team_strength" numeric
);



--
-- TOC entry 171 (class 1259 OID 22257)
--

CREATE TABLE "memberships" (
    "id" integer NOT NULL,
    "role" character varying NOT NULL,
    "project_id" integer NOT NULL,
    "person_id" integer NOT NULL
);



--
-- TOC entry 172 (class 1259 OID 22265)
--

CREATE TABLE "people" (
    "email" character varying NOT NULL,
    "name" character varying NOT NULL,
    "initials" character varying NOT NULL,
    "id" integer NOT NULL
);



--
-- TOC entry 169 (class 1259 OID 22243)
--

CREATE TABLE "projects" (
    "id" integer NOT NULL,
    "name" character varying NOT NULL,
    "iteration_length" integer NOT NULL,
    "week_start_day" character varying NOT NULL,
    "point_scale" character varying NOT NULL,
    "velocity_scheme" character varying,
    "current_velocity" integer,
    "initial_velocity" integer,
    "number_of_done_iterations_to_show" integer,
    "labels" character varying,
    "allow_attachments" boolean,
    "public" boolean,
    "use_https" boolean,
    "bugs_and_chores_are_estimatable" boolean,
    "commit_mode" boolean,
    "last_activity_at" timestamp with time zone
);



--
-- TOC entry 174 (class 1259 OID 22307)
--

CREATE TABLE "stories" (
    "id" integer NOT NULL,
    "project_id" integer NOT NULL,
    "story_type" character varying,
    "url" character varying NOT NULL,
    "estimate" integer,
    "current_state" character varying NOT NULL,
    "description" "text",
    "name" character varying,
    "requested_by" character varying,
    "owned_by" character varying,
    "created_at" timestamp with time zone,
    "accepted_at" timestamp with time zone,
    "labels" character varying
);



--
-- TOC entry 2226 (class 2606 OID 22297)
--

ALTER TABLE ONLY "people"
    ADD CONSTRAINT "U_person_email" UNIQUE ("email");


--
-- TOC entry 2216 (class 2606 OID 22242)
--

ALTER TABLE ONLY "activities"
    ADD CONSTRAINT "pk_activity_id" PRIMARY KEY ("id");


--
-- TOC entry 2222 (class 2606 OID 22331)
--

ALTER TABLE ONLY "activity_stories"
    ADD CONSTRAINT "pk_activity_story" PRIMARY KEY ("activity_id", "story_id");


--
-- TOC entry 2230 (class 2606 OID 22306)
--

ALTER TABLE ONLY "iterations"
    ADD CONSTRAINT "pk_iteration_id" PRIMARY KEY ("id");


--
-- TOC entry 2237 (class 2606 OID 22319)
--

ALTER TABLE ONLY "iteration_stories"
    ADD CONSTRAINT "pk_iteration_story" PRIMARY KEY ("iteration_id", "story_id");


--
-- TOC entry 2228 (class 2606 OID 22289)
--

ALTER TABLE ONLY "people"
    ADD CONSTRAINT "pk_person_id" PRIMARY KEY ("id");


--
-- TOC entry 2218 (class 2606 OID 22250)
--

ALTER TABLE ONLY "projects"
    ADD CONSTRAINT "pk_project_id" PRIMARY KEY ("id");


--
-- TOC entry 2233 (class 2606 OID 22314)
--

ALTER TABLE ONLY "stories"
    ADD CONSTRAINT "pk_story_id" PRIMARY KEY ("id");


--
-- TOC entry 2214 (class 1259 OID 22348)
--

CREATE INDEX "fki_activities_project_id" ON "activities" USING "btree" ("project_id");


--
-- TOC entry 2219 (class 1259 OID 22349)
--

CREATE INDEX "fki_activity_stories_activity_id" ON "activity_stories" USING "btree" ("activity_id");


--
-- TOC entry 2220 (class 1259 OID 22342)
--

CREATE INDEX "fki_activity_stories_story_id" ON "activity_stories" USING "btree" ("story_id");


--
-- TOC entry 2234 (class 1259 OID 22350)
--

CREATE INDEX "fki_iteration_stories_iteration_id" ON "iteration_stories" USING "btree" ("iteration_id");


--
-- TOC entry 2235 (class 1259 OID 22351)
--

CREATE INDEX "fki_iteration_stories_story_id" ON "iteration_stories" USING "btree" ("story_id");


--
-- TOC entry 2223 (class 1259 OID 22298)
--

CREATE INDEX "fki_membership_project" ON "memberships" USING "btree" ("project_id");


--
-- TOC entry 2224 (class 1259 OID 22295)
--

CREATE INDEX "fki_person_id" ON "memberships" USING "btree" ("person_id");


--
-- TOC entry 2231 (class 1259 OID 22357)
--

CREATE INDEX "fki_stories_project_id" ON "stories" USING "btree" ("project_id");


--
-- TOC entry 2238 (class 2606 OID 22343)
--

ALTER TABLE ONLY "activities"
    ADD CONSTRAINT "fk_activities_project_id" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2239 (class 2606 OID 22332)
--

ALTER TABLE ONLY "activity_stories"
    ADD CONSTRAINT "fk_activity_stories_activity_id" FOREIGN KEY ("activity_id") REFERENCES "activities"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2240 (class 2606 OID 22337)
--

ALTER TABLE ONLY "activity_stories"
    ADD CONSTRAINT "fk_activity_stories_story_id" FOREIGN KEY ("story_id") REFERENCES "stories"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2245 (class 2606 OID 22320)
--

ALTER TABLE ONLY "iteration_stories"
    ADD CONSTRAINT "fk_iteration_stories_iteration_id" FOREIGN KEY ("iteration_id") REFERENCES "iterations"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2244 (class 2606 OID 22325)
--

ALTER TABLE ONLY "iteration_stories"
    ADD CONSTRAINT "fk_iteration_stories_story_id" FOREIGN KEY ("story_id") REFERENCES "stories"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2241 (class 2606 OID 22283)
--

ALTER TABLE ONLY "memberships"
    ADD CONSTRAINT "fk_membership_project" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2242 (class 2606 OID 22290)
--

ALTER TABLE ONLY "memberships"
    ADD CONSTRAINT "fk_person_id" FOREIGN KEY ("person_id") REFERENCES "people"("id") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2243 (class 2606 OID 22352)
--

ALTER TABLE ONLY "stories"
    ADD CONSTRAINT "fk_stories_project_id" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2013-07-16 19:59:09 EDT

--
-- PostgreSQL database dump complete
--

