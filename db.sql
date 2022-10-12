create database ridsoft default character set utf8mb4 collate utf8mb4_unicode_ci;

create table ridsoft.user
(
    userId varchar(20) primary key not null,
    userPw varchar(64)             not null,
    salt   varchar(8)              not null,
    level  tinyint(1)              not null default 3
);

create table ridsoft.category
(
    catId integer unsigned primary key not null auto_increment,
    title varchar(10)                  not null
);

create table ridsoft.file
(
    fileId   integer unsigned primary key not null auto_increment,
    userId   varchar(20)                  not null,
    fileName varchar(20)                  not null,
    created  timestamp                    not null default now()
);

create table ridsoft.document
(
    docId    integer unsigned primary key not null auto_increment,
    userId   varchar(20)                  not null,
    catId    integer unsigned             not null,
    title    varchar(20)                  not null,
    `desc`   varchar(50)                  not null,
    content  varchar(2000)                not null,
    coverImg integer unsigned             not null,
    tag      varchar(20)                           default null,
    github   varchar(50)                  not null,
    touch    datetime                     not null default now(),
    hidden   boolean                      not null default false,
    foreign key (userId) references ridsoft.user (userId),
    foreign key (catId) references ridsoft.category (catId),
    foreign key (coverImg) references ridsoft.file (fileId)
);

create table ridsoft.skill_group
(
    skillGroupId integer unsigned primary key not null auto_increment,
    name         varchar(20)                  not null
);

create table ridsoft.skill
(
    skillId   integer unsigned primary key not null auto_increment,
    `group`   integer unsigned             not null,
    skillName varchar(20)                  not null,
    icon      integer unsigned             not null,
    `year`    integer unsigned             not null,
    `level`   integer unsigned             not null comment 'min: 0, max: 5',
    `desc`    varchar(20) default null,
    foreign key (`group`) references ridsoft.skill_group (skillGroupId),
    foreign key (icon) references ridsoft.file (fileId)
);

create table ridsoft.activity
(
    activityId   integer unsigned primary key not null auto_increment,
    activityName varchar(20)                  not null,
    outside      boolean                      not null,
    `date`       date                         not null default now(),
    prize        varchar(20),
    touch        datetime                     not null default now()
);