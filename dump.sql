create database finances;

CREATE TABLE "users" (
  "id" serial NOT NULL,
  "name" text NOT NULL,
  "email" varchar(255) NOT NULL,
  "CPF" char(255),
  "password" text NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY ("id"),
  CONSTRAINT "email_unique_constraints" UNIQUE ("email"),
  CONSTRAINT "cpf_unique_constraints" UNIQUE ("CPF")
)
;

CREATE TABLE "financial_transactions" (
  "id" serial NOT NULL,
  "type" char(7) NOT NULL,
  "value" int4 NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "user_id" int4,
  PRIMARY KEY ("id"),
  CONSTRAINT "fk_financial_transactions_users_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
)
;