CREATE TABLE "users" (
  "id" uuid PRIMARY KEY NOT NULL,
  "user_name" varchar(255) NOT NULL,
  "password" text NOT NULL,
  "email" email NOT NULL,
  "is_google" boolean,
  "roles" text,
  "created_at" date NOT NULL,
  "update_at" date
);

CREATE TABLE "users_books" (
  "id" uuid PRIMARY KEY NOT NULL,
  "FK user_id" uuid,
  "title" text,
  "author" text,
  "isbn" integer,
  "page_count" integer,
  "genre" text,
  "large_img" URL,
  "language" text,
  "is_favourite" boolean,
  "rating" integer,
  "created_at" date NOT NULL,
  "update_at" date,
  "status" text
);

CREATE TABLE "comments" (
  "id" uuid PRIMARY KEY NOT NULL,
  "FK user_id" uuid NOT NULL,
  "google_book_id" uuid NOT NULL,
  "comment" TEXT,
  "created_at" date NOT NULL,
  "update_at" date
);

CREATE TABLE "friendships" (
  "id" uuid PRIMARY KEY NOT NULL,
  "user_id" uuid NOT NULL,
  "friend_id" uuid NOT NULL,
  "type" varchar,
  "created_at" date NOT NULL,
  "update_at" date
);

ALTER TABLE "users_books" ADD FOREIGN KEY ("FK user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("FK user_id") REFERENCES "users" ("id");

ALTER TABLE "friendships" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "friendships" ADD FOREIGN KEY ("friend_id") REFERENCES "users" ("id");
