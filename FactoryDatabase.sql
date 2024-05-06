create database GazGzoni

use GazGzoni



CREATE TABLE Puntoret (
   ID int primary key identity(1,1) foreign key references makinat(ID),
   Emri VARCHAR(50),
   Mbiemri VARCHAR(50),
   Mosha int check (mosha>=18),
   Qyteti int foreign key references Qytetet(Id),
   Shteti int foreign key references Shtetet(Id),
   Gjinia char,
   NrTel int,
   Statusi bit,
   Paga decimal,
   Departamenti int foreign key references Departmentet(Id),
   Depo int foreign key references Depo(Id),
   Shpenzimet int,
   Viti int default YEAR(GETDATE())
,Muaji varchar(50) default MONTH(GETDATE())
,Dita varchar(50) default DAY(GETDATE())
,InsertionDate  DATETIME DEFAULT GETDATE()
)	

insert into Puntoret (  [Emri], [Mbiemri], [Mosha], [Qyteti], [Shteti], 
[Gjinia], [NrTel], [Statusi], [Paga], [Departamenti], [Depo], [Shpenzimet], [Pushimi])
VALUES ('Gani', 'Rashiti', 53, 1, 1, 'M',0637268772, 1, 1000.00, 1, 1,1,1),
('Arton', 'Rashiti', 44, 2, 1, 'M',06328822, 1, 1320.00, 2, 3,2,4),
('Drtion', 'Rashiti', 39, 1, 1, 'M',063454322, 1, 985.00, 3, 2,5,4),
('Jeton', 'Rashiti', 33, 1, 1, 'M',062778474, 1, 500.00, 4, 5,6,2),
('Egzon', 'Rashiti', 21, 1, 1, 'M',0631976001, 1, 1000.00,5, 4,7,6),
('Gazmend', 'Rashiti', 20, 1, 1, 'M',0628947646, 1, 15000.00, 6, 2,5,1),
('Alban', 'Rashiti', 18, 1, 1, 'M',063728772, 1, 2000.00, 7,1,2,5),
('Albion', 'Rashiti', 18, 1, 1, 'M',06368772, 1, 800.00, 1, 2,3,4),
('Fation', 'Rashiti', 18, 1, 1, 'M',06372682, 1, 400.00, 8, 2,6,5),
('Ardonit', 'Destani', 27, 1, 1, 'M',0634472682, 1, 600.00, 1, 2,6,5),
('Ramadan', 'Jashari', 27, 1, 1, 'M',0637268266, 1, 530.00, 6, 1,6,9),
('Samet', 'Bajrami', 18, 1, 1, 'M',063726822, 1, 400.00, 1, 2,4,5)





CREATE TABLE Qytetet(
Id int primary key identity(1,1),
Emri varchar (50)
)


INSERT INTO QYTETET (Emri)
VALUES
('Ternovc'),
('Bujanovc'),
('Presheva'),
('Prizren'),
('Tirana'),
('Durrës'),
('Gjilan'),
('Prishtina')



CREATE TABLE Shtetet(
Id int primary key identity(1,1),
Emri varchar (50)
)

insert into Shtetet (Emri)
values ('Serbi'),
('Kosove'),
('Shqiperi')




CREATE TABLE Shpenzimet (
   Id int primary key identity(1,1),
   TipiShpenzimit varchar(50),
   DataShpenzimit DATETIME DEFAULT GETDATE() ,
   Shuma decimal
)
INSERT INTO Shpenzimet (TipiShpenzimit, Shuma)
VALUES
('Vizë për punë', 50.00),
('Mirmbajtja Makinave', 75.00),
('Mirmbajtja e makinave te punes', 200.00),
('Pajisje për zyrë', 150.00),
('Derivatet', 100.00),
('Rroba pune', 80.00),
('Kërkesë për reklamim', 300.00)


create table Shpenzimet_Puntoret(
id int primary key identity(1,1),
puntoret_id int foreign key references Puntoret(ID),
expenses_id int foreign key references Shpenzimet(ID)
)
insert into Shpenzimet_Puntoret(puntoret_id,expenses_id)
values(1,1),
(2,3),
(4,4),
(5,6),
(11,1),
(3,3),
(4,1),
(5,2),
(6,3),
(7,4)





 create table Makinat
 (
 Id int primary key identity(1,1),
 Emri varchar(50)
 )

  INSERT INTO Makinat (Emri)
VALUES
('BMW'),
('Audi'),
('Mercedes-Benz'),
('Toyota'),
('Honda'),
('Ford'),
('Chevrolet'),
('Nissan'),
('Hyundai'),
('Kia'),
('Peugeot'),
('Renault')


 CREATE TABLE Depo (
   Id int primary key identity(1,1),
   LokacioniDepos int foreign key references Qytetet(Id),   
)
insert into Depo (LokacioniDepos)
values(1),(2),(3),(4),(6)   --Vendosja e Lokacionit te Depove ne baze te qyteteve qe jane insertu  ne DB ma heret



CREATE TABLE Departmentet(
   Id int primary key identity(1,1),
   DepartmentName VARCHAR(50)
)

INSERT INTO Departmentet (DepartmentName)
VALUES
   ('Operacionet në Magazinë'),
   ('Plotësimi i Porosive'),
   ('Menaxhimi i Inventarit'),
   ('Organizimi i Magazinës'),
   ('Paketimi dhe Transporti'),
   ('Ngarkimi dhe Shkarkimi'),
   ('Dimensionimi i Paneleve'),
   ('Ngjitja e Shiritave zbukurues'),
   ('Ngarkimi dhe Shkarkimi')


create table Materialet (
   Id int primary key identity(1,1),
   Lloji_Materialit varchar(50),
   Depo int foreign key references Depo(Id),
   Furnitori int foreign key references Furnitoret(Id),
   Cmimi decimal
   )

   INSERT INTO Materialet (Lloji_Materialit, Depo, Furnitori, Cmimi) VALUES
('Plywood (dru i shtypur)', 1, 3, 45.00),
('Particle Board (tabela prej copëzave)', 2, 2, 55.00),
('Solid Wood (dru i fortë)', 3, 1, 75.00),
('Melamine Board (tabela me melaminë)', 1, 4, 65.00),
('Veneer (bark druri)', 2, 3, 50.00),
('MDF Board (Mediapan)', 1, 1, 60.00),
('HDF Board (Lesonit)', 3, 1, 70.00),
('HFC Board (Iverice)', 2, 2, 80.00),
('Laminate (laminat)', 4, 3, 55.00),
('Bamboo Board (Tabela Bambusi)', 5, 4, 90.00)

   create table Veglat_Punes(
   Id int primary key identity (1,1) foreign key references Puntoret(Id),
   LlojiMakinerise varchar (50),
   Statusi bit
   )

   INSERT INTO Veglat_Punes (LlojiMakinerise,Statusi)
   values ('Pirunar i Vogel-1Ton',1),
   ('Skanues i Barkodeve',1),
   ('Pirunar i mesem-1.5 Ton',0),
   ('Makineri per etiketim',1),
   ('Kamion Actross',1),
   ('Pirunar Industrial',1),
   ('Sharre CNC-Gomatic',1),
   ('Strech Wrapper',1),
   ('Turanlar-601',1),
   ('Vinc per transportim te Paneleve',1),
   ('Pirunar Industrial +5 Ton',1),
   ('Transporter SCM',1)



   

   create table Furnitoret (
Id int primary key identity(1,1),
EmriFurnitorit varchar (50),
)

insert into Furnitoret (EmriFurnitorit)
values ('Kastamonu Entegre'),
('StarWood Company'),
('Elita Company'),
('Kastor Doo')






   create table Sherbimet(
   Id int primary key identity(1,1),
   Sherbimi  varchar(50),
   Cmimi decimal
   )
  INSERT INTO Sherbimet (Sherbimi, Cmimi)
  VALUES
('Përpunimi i Porosive', 10.00),
('Magazinimi dhe Stokimi', 15.00),
('Menaxhimi i Inventarit', 12.50),
('Paketime dhe Etiketim', 8.00),
('Transporti dhe Dërgesa', 20.00),
('Ngarkimi dhe Shkarkimi', 10.00),
('Pastrimi dhe Rregullimi', 10.00),
('Montimi dhe Instalimi', 15.00),
('Konsultime dhe Asistencë Teknike', 25.00),
('Paketime dhe Përgatitje për Shpërndarje', 12.00)


	create table Puntoret_Sherbimet (
	Id int primary key identity(1,1),
	PuntoriId int foreign key references Puntoret(Id),
	SherbimiId int foreign key references Sherbimet(Id)
	)
	insert into Puntoret_Sherbimet (PuntoriId,SherbimiId)
	values (1,1),
	(2,2),
	(3,3),
	(4,1),
	(5,6),
	(3,2),
	(1,2),
	(1,1),
	(1,1),
	(4,4)
	



   create table Klientet(
   Id int primary key identity (1,1),
   Emri varchar(50),
   Mbiemri varchar(50),
   Qyteti int foreign key references [dbo].[Qytetet](Id),
   NrTel varchar (50),--se kemi edhe kliente jashte shtetit dhe na duhet prefizi i tyre si +381,+383 etj
   Email varchar (50)   
   )
   INSERT INTO Klientet (Emri, Mbiemri, Qyteti, NrTel, Email)
VALUES
   ('Gëzim', 'Krasniqi', 1, '+38349123456', 'gezim.krasniqi@gmail.com'),
   ('Arlind', 'Rexhepi', 2, '+355692345678', 'arlind.rexhepi@yahoo.com'),
   ('Elvana', 'Hoxha', 3, '+38162123456', 'elvana.hoxha@outlook.com'),
   ('Liridon', 'Mustafa', 5, '+38649123456', 'liridon.mustafa@gmail.com'),
   ('Albana', 'Gashi', 4, '+38670123456', 'albana.gashi@outlook.com'),
    ('Valmir', 'Kadriu', 1, '+38349123456', 'valmir.kadriu@yahoo.com'),
   ('Flaka', 'Xhaka', 2, '+355692345678', 'flaka.xhaka@gamil.com'),
   ('Blerina', 'Syla', 1, '+38162123456', 'blerina.syla@outlook.com'),
   ('Rinor', 'Rama', 3, '+38649123456', 'rinor.rama@yahoo.com'),
   ('Dorina', 'Kryeziu', 4, '+38670123456', 'dorina.kryeziu@yahoo.com')


   create table Porosite(
   Id int primary key identity(1,1),
   MaterialiPorositur int foreign key references Materialet(Id),
   KlientiId int foreign key references Klientet(Id),
   DataPorosise DATETIME DEFAULT GETDATE(),
   ShumaTotal decimal,
   MetodaPageses varchar(50)
)
INSERT INTO Porosite (MaterialiPorositur, KlientiId,ShumaTotal, MetodaPageses)
VALUES
   (1, 1, 2500.00, 'Cash'),
   (2, 3,  1500.00, 'Credit Card'),
   (4, 1, 1800.00, 'Bank Transfer'),
   (5, 7, 3200.00, 'Cash'),
   (6, 4, 2000.00, 'Credit Card'),
   (8, 8, 2700.00, 'Cash'),
   (9, 9, 1350.00, 'Credit Card'),
   (10, 10, 2100.00, 'Bank Transfer'),
   (2, 9, 2900.00, 'Cash'),
   (7, 2, 1750.00, 'Credit Card')
create table Pushimet(
Id int primary key identity (1,1),
EmriPushimit varchar (50)
)
INSERT INTO Pushimet (EmriPushimit)
VALUES
   ('Kurban Bajrami'),
   ('Ramazani'),
   ('Fiter Bajrami'),
   ('Dita e Puntorit'),
   ('Dita e Flamurit'),
   ('Dita e Verës'),
   ('Krishtlindjet'),
   ('Pashka'),
   ('Shën Gjergji')

alter table Puntoret
add Pushimi int foreign key references Pushimet(Id)



Backup database Gazgzoni 
To Disk = 'C:\Gazmend_Rashiti_GazGzoniBackup\GazGzoni_Backup.bak'
