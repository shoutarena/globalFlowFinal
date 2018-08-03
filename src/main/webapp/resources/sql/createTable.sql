create table member(
    memberidx number(7) primary key,
    id varchar2(20) not null,
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    zipcode varchar2(400) not null,
    addr1 varchar2(400) not null,
    addr2 varchar2(400) not null,
    tel varchar2(20) not null,
    email varchar2(40) not null,
    hiredate date default sysdate,
    birth date not null,
    dept varchar2(50) not null,
    gender varchar2(10) not null,
    grade number(2) default 0,
    profile varchar2(400)
)
create sequence memberidxsq increment by 1 start with 1;

create table project(
    proidx number(7) primary key,
    title varchar2(100) not null,
    description clob not null,
    sdate date default sysdate,
    edate date default sysdate,
    prograde number(2) default 0,
    state number(2) default 0
)
create sequence proidxsq increment by 1 start with 1;

create table groupMember(
    proidx number(7) constraint groupproidx references project(proIdx),
    memberidx number(7) constraint groupmemberidx references member(memberidx),
    grgrade number(2) not null
)

create table board(
    boidx number(7) primary key,
    proidx number(7) constraint boardproidx references project(proidx),
    title varchar2(100) not null,
    content clob not null,
    category number(2) not null,
    sdate date default sysdate,
    edate date default sysdate,
    priority number(2) not null,
    loc varchar2(400) not null,
    alarm number(2) not null
)
create sequence boidxsq increment by 1 start with 1;

create table todo(
    boidx number(7) constraint todoboidx references board(boidx),
    proidx number(7) constraint todoproidx references project(proidx),
    content clob not null,
    tododate date default sysdate,
    memidx number(7) constraint todomemidx references member(memberidx)
)

create table upload(
    fileidx number(7) primary key,
    proidx number(7) constraint uploadproidx references project(proidx),
    boidx number(7) constraint uploadboidx references board(boidx),
    savepath varchar2(400),
    ogpath varchar2(100)
)
create sequence fileidxsq increment by 1 start with 1;

create table reply(
    reidx number(7) primary key,
    proidx number(7) constraint replyproidx references project(proidx),
    boidx number(7) constraint replyboidx references board(boidx),
    memidx number(7) not null,
    content clob not null,
    writedate date default sysdate
)
create sequence reidxsq increment by 1 start with 1;

create table replyfile(
    refileidx number(7) primary key,
    reidx number(7) constraint replyfilereidx references reply(reidx), 
    proidx number(7) constraint replyfileproidx references project(proidx),
    boidx number(7) constraint replyfileboidx references board(boidx),
    savepath varchar2(400),
    ogpath varchar2(100)
)
create sequence refileidxsq increment by 1 start with 1;


