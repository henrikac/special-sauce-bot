CREATE TABLE IF NOT EXISTS "ducky" (
	"id"	INTEGER,
	"username"	TEXT NOT NULL UNIQUE,
	"points"	INTEGER DEFAULT 0,
	"at_me_consent"	INTEGER DEFAULT 0, super_cow_power INTEGER DEFAULT 0, created_at TEXT, next_water TEXT, purse TEXT DEFAULT "",
	PRIMARY KEY("id" AUTOINCREMENT)
);