# No 1
create database kocipolitel_250;
use kocipolitel_250;

# No 2
create table jenis_simpanan
(
    kd_jns_simpan char(3)     not null
        primary key,
    nm_jns_simpan varchar(25) not null
);

# Add table anggota
create table anggota
(
    no_anggota   char(4)     not null
        primary key,
    nama_anggota varchar(50) not null
);
insert into anggota(no_anggota, nama_anggota)
VALUES ('ID01', 'GALANG AIDIL AKBAR');

# No 3
create table simpanan
(
    no_simpan    char(5) not null
        primary key,
    tgl_simpan   date    not null,
    no_anggota   char(4) not null,
    total_simpan int     null,
    constraint simpanan_anggota_no_anggota_fk
        foreign key (no_anggota) references anggota (no_anggota) on delete cascade
);

# No 4
create table detail_simpanan
(
    no_simpan       char(5) not null,
    kd_jenis_simpan char(3) null,
    subtotal        int     null,
    constraint detail_simpanan_jenis_simpanan_kd_jns_simpan_fk
        foreign key (kd_jenis_simpan) references jenis_simpanan (kd_jns_simpan)
            on delete cascade,
    constraint detail_simpanan_simpanan_no_simpan_fk
        foreign key (no_simpan) references simpanan (no_simpan)
            on delete cascade
);

# No 5
insert into jenis_simpanan(kd_jns_simpan, nm_jns_simpan)
values ('PKK', 'Simpanan Pokok');
insert into jenis_simpanan(kd_jns_simpan, nm_jns_simpan)
values ('WJB', 'Simpanan Wajib');
insert into jenis_simpanan(kd_jns_simpan, nm_jns_simpan)
values ('SKR', 'Simpanan Sukarela');

# No 6
insert into simpanan(no_simpan, tgl_simpan, no_anggota, total_simpan)
VALUES ('TR01', '2013-01-01', 'ID01', 270000);
insert into simpanan(no_simpan, tgl_simpan, no_anggota, total_simpan)
VALUES ('TR21', '2013-03-01', 'ID01', 20000);

# No 7
insert into detail_simpanan(no_simpan, kd_jenis_simpan, subtotal)
VALUES ('TR01', 'PKK', 250000);
insert into detail_simpanan(no_simpan, kd_jenis_simpan, subtotal)
VALUES ('TR01', 'WJB', 20000);
insert into detail_simpanan(no_simpan, kd_jenis_simpan, subtotal)
VALUES ('TR21', 'WJB', 20000);

# No 8
update detail_simpanan
set kd_jenis_simpan = 'SKR'
where no_simpan = 'TR01'
  and subtotal < 50000;

# No 9
delete
from simpanan
where total_simpan >= 250000;

# No 10
select no_simpan, total_simpan
from simpanan;

# No 11
select no_anggota, total_simpan
from simpanan;

# No 12
select nm_jns_simpan
from jenis_simpanan;

# No 13
select *
from detail_simpanan
where kd_jenis_simpan = 'WJB';

# No 14
select *
from simpanan
where total_simpan > 200000;

# No 15
select no_simpan, kd_jenis_simpan
from detail_simpanan
where kd_jenis_simpan = 'WJB';

# No 16
select no_anggota, tgl_simpan, total_simpan
from simpanan
where tgl_simpan = '2013-03-01';
