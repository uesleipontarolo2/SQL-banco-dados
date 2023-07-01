create table task (
  task_id varchar not null primary key,
  task_name varchar,
  member_id integer,
  tags_name varchar,
  task_status varchar,
  data_created timestamp,
  data_updated timestamp,
  data_closed timestamp,
  due_date timestamp,
  url varchar
);

create table members (
  member_id integer not null primary key,
  member_name varchar
);

create table tempo (
  time_id integer not null primary key,
  task_id varchar,
  member_id integer,
  tags_name varchar,
  start_time timestamp,
  end_time timestamp,
  duration timestamp
);

create table tags (
  tags_name varchar not null primary key
);

alter table task add constraint fk_task_member foreign key (member_id) references members(member_id);
alter table task add constraint fk_taks_tags foreign key (tags_name) references tags(tags_name);
alter table tempo add constraint fk_tempo_task foreign key (task_id) references task(task_id);
alter table tempo add constraint fk_tempo_member foreign key (member_id) references members(member_id);
alter table tempo add constraint fk_tempo_tags foreign key (tags_name) references tags(tags_name);