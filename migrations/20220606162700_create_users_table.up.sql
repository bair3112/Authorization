create table if not exists users
(
    guid uuid not null
        constraint users_pk
            primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) not null,
    phone varchar(255),
    create_date timestamp with time zone default now() not null
);

create unique index if not exists users_guid_unique
    on users (guid);

create unique index if not exists users_email_unique
    on users (email);

create index if not exists users_phone_unique
    on users (phone);