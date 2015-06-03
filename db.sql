drop table purchase;
drop table availible;
drop table buyer;
drop table shops;
drop table models;
drop table firms;

--create type _modelID 

--delete * from firms;

create table firms (
	companyID int identity(1, 1) not null primary key,
	name varchar(100) not null,
	country varchar(100)
);

create table models (
	modelID int identity(1, 1) not null primary key,
	name varchar(100) not null,
	companyID int not null default(1),
	foreign key(companyID) references firms(companyID),
	yearOfModel int,
	price int not null
);

create table shops (
	shopID int identity(1, 1) not null primary key,
	metro varchar(100) not null
);

create table availible (
	modelID int not null default(1),
	shopID int not null default(1),
	foreign key(modelID) references models(modelID),
	foreign key(shopID) references shops(shopID),
	havingIt int not null default(0)
);

create table buyer (
	buyerID int identity(1, 1) not null primary key,
	firstname varchar(100) not null,
	secondname varchar(100),
	fullname varchar(100),
	e_mail varchar(100) not null
);

create table purchase (
	purchaseID int identity(1, 1) not null primary key,
	buyerID int not null default(1),
	modelID int not null default(1),
	shopID int not null default(1),
	foreign key(buyerID) references buyer(buyerID),
	foreign key(modelID) references models(modelID),
	foreign key(shopID) references shops(shopID),
	cost int not null default(0),
	dateOfPurchase date,
);

insert into firms (name, country) values
	('Nokia', 'Finland'),
	('Samsung', 'South Corea'),
	('Sony', 'Japan'),
	('HTC', 'Taywan'),
	('LG', 'South Korea'),
	('Apple', 'USA'),
	('Huawei', 'China'),
	('Philips', 'The Niderlands'),
	('Yota', 'Russia'),
	('Alcatel', 'France'),
	('Asus', 'Taiwan'),
	('Lenovo', 'China');

insert into models (name, price, yearOfModel) values
	('lumia_520', 300, 2013),
	('lumia_620', 400, 2012), 
	('lumia_720', 450, 2013),
	('lumia_820', 500, 2012),
	('lumia_920', 550, 2012),
	('lumia_930', 650, 2014),
	('asha_101', 50, 2014),
	('asha_302', 100, 2014),
	('x', 120, 2013),
	('x_xl', 150, 2013),
	('galaxy_s6', 1200, 2015),
	('galaxy_s5', 900, 2014),
	('galaxy_note_4', 1000, 2014),
	('galaxy_alpha_7', 400, 2015),
	('galaxy_star', 300, 2014),
	('galaxy_duos', 320, 2013),
	('onmia_i8000', 150, 2010),
	('one', 570, 2014),
	('disire', 200, 2012),
	('hero', 200, 2008),
	('hd2', 250, 2010),
	('g3', 700, 2014),
	('g4', 1300, 2015),
	('d295', 170, 2014),
	('d390', 210, 2013),
	('d450', 280, 2013),
	('iphone_6_plus', 1300, 2014),
	('iphone_6', 1000, 2014),
	('iphone_5s', 800, 2014),
	('iphone_5c', 650, 2014),
	('iphone_5', 500, 2013),
	('iphone', 2000, 2007),
	('apsend_d', 330, 2014),
	('apsecd_s', 350, 2013),
	('honor_6', 500, 2014),
	('honor_5', 300, 2013),
	('xenium_400', 240, 2013),
	('xenium_300', 200, 2012),
	('xenium_s', 300, 2014),
	('yotaphone', 300, 2013),
	('yotaphone_2', 550, 2014),
	('zenphone_5', 250, 2014),
	('zenphone_6', 350, 2014),
	('vibe_x', 340, 2014),
	('vibe_pro', 570, 2015),
	('s820', 220, 2013),
	('p720', 250, 2013);


insert into shops (metro) values
	('Timiryazevskaya'),
	('Savelovskaya'),
	('Sportivnaya'),
	('Kievskaya'),
	('Novoslobodskaya'),
	('Otradnoe'),
	('Krilatskoe'),
	('Novokosino'),
	('Universitet'),
	('Park pobedy'),
	('VDNH'),
	('Bagrationovskaya'),
	('Fili'),
	('Bulvar Dmitriya Donskogo');

update models set
	companyID = 1 where (modelID <= 10);
update models set
	companyID = 2 where (modelID > 10 and modelID <= 17);
update models set
	companyID = 3 where (modelID > 17 and modelID <= 17);
update models set
	companyID = 4 where (modelID > 17 and modelID <= 21);
update models set
	companyID = 5 where (modelID > 21 and modelID <= 26);
update models set
	companyID = 6 where (modelID > 26 and modelID <= 32);
update models set
	companyID = 7 where (modelID > 32 and modelID <= 36);
update models set
	companyID = 8 where (modelID > 36 and modelID <= 39);
update models set
	companyID = 9 where (modelID > 39 and modelID <= 41);
update models set
	companyID = 10 where (modelID > 41 and modelID <= 41);
update models set
	companyID = 11 where (modelID > 41 and modelID <= 43);
update models set
	companyID = 12 where (modelID > 43 and modelID <= 47);

insert into availible(modelID, shopID)
(select models.modelID, shops.shopID from models join shops on 1 = 1);

update availible 
set havingIt = 1 where (((47 - modelID) / 2) + shopID < 25);

insert into buyer(firstname, secondname, e_mail) values
	('Zertsalov', 'Andrey', 'zertsalov96@yandex.ru'),
	('Garkaviy', NULL, 'andrewgark@gamil.com'),
	('Kargaltsev', NULL, 'thefacetakt@yandex.ru'),
	('Iskhakov', 'Timur', 'idontwanttoshowyoumymail@none.net'),
	('Ivanov', 'Petr', 'ivanov@yandex.ru'),
	('Shugaeva', 'Tanya', 'shugaeva@yandex.ru'),
	('Fateeva', 'Tanya', 'fateeva@rambler.ru'),
	('Borovkov', 'Yury', 'borovkov@yandex.ru'),
	('Lagunov', 'Anton', 'laguna@gmail.ru'),
	('Korshunov', 'Anton', 'sokol@yandex.ru'),
	('Petrov', 'Petr', 'petrovhahaha@yandex.ru'),
	('Karpova', 'Maria', 'karpova97@mail.ru');

update buyer
set fullname = (firstname + ' ' + secondname) where secondname <> 'NULL';

insert into purchase(buyerID, shopID, modelID, dateOfPurchase) values
	(6, 2, 37, '13.6.2013'),
	(7, 1, 32, '21.6.2014'),
	(2, 14, 45, '16.8.2014'),
	(4, 5, 9, '17.3.2012'),
	(5, 7, 32, '13.3.2014'),
	(5, 11, 42, '25.3.2012'),
	(3, 10, 25, '7.7.2012'),
	(10, 7, 31, '24.1.2013'),
	(1, 11, 32, '13.12.2013'),
	(1, 2, 46, '12.6.2013'),
	(3, 11, 41, '22.10.2014'),
	(8, 7, 4, '19.10.2014'),
	(6, 1, 40, '18.9.2013'),
	(7, 6, 35, '6.10.2012'),
	(11, 5, 44, '17.12.2014'),
	(4, 7, 37, '13.3.2013'),
	(10, 11, 8, '15.4.2014'),
	(8, 12, 42, '24.10.2012'),
	(6, 6, 15, '15.6.2012'),
	(3, 13, 12, '11.10.2014'),
	(1, 14, 10, '4.11.2014'),
	(1, 14, 23, '16.8.2012'),
	(3, 5, 46, '9.3.2013'),
	(1, 12, 42, '16.1.2013'),
	(2, 3, 7, '12.7.2014'),
	(1, 9, 33, '20.9.2013'),
	(1, 14, 42, '14.7.2014'),
	(2, 9, 22, '1.12.2012'),
	(9, 14, 23, '1.11.2012'),
	(9, 5, 17, '18.2.2014'),
	(4, 4, 39, '8.8.2012'),
	(11, 12, 23, '1.7.2012'),
	(1, 1, 41, '22.6.2014'),
	(2, 12, 28, '19.11.2013'),
	(3, 2, 2, '6.3.2014'),
	(4, 13, 28, '4.3.2012'),
	(9, 8, 25, '23.11.2014'),
	(12, 14, 25, '11.1.2012'),
	(6, 9, 30, '4.2.2014'),
	(6, 1, 22, '2.12.2014'),
	(9, 5, 42, '18.6.2012'),
	(10, 4, 28, '16.11.2013'),
	(3, 10, 17, '11.10.2012'),
	(5, 7, 34, '27.6.2014'),
	(9, 12, 19, '21.6.2013'),
	(3, 2, 16, '21.2.2012'),
	(11, 2, 19, '20.8.2013'),
	(8, 14, 37, '22.7.2013'),
	(2, 12, 8, '5.3.2013'),
	(9, 1, 1, '3.7.2013'),
	(9, 8, 6, '28.6.2013'),
	(10, 6, 20, '1.9.2014'),
	(6, 9, 28, '15.7.2013'),
	(2, 1, 26, '7.2.2013'),
	(4, 11, 35, '23.9.2014'),
	(1, 8, 5, '5.7.2014'),
	(6, 14, 27, '26.11.2014'),
	(9, 5, 35, '22.7.2014'),
	(3, 14, 17, '19.3.2012'),
	(7, 3, 27, '28.2.2014'),
	(12, 4, 46, '2.2.2014'),
	(12, 9, 38, '14.7.2014'),
	(6, 12, 9, '12.12.2012'),
	(8, 7, 26, '13.6.2012'),
	(8, 7, 22, '14.10.2014'),
	(9, 3, 21, '11.9.2013'),
	(12, 3, 42, '7.3.2013'),
	(8, 6, 19, '1.9.2014'),
	(2, 7, 47, '3.8.2012'),
	(12, 12, 22, '23.3.2013'),
	(8, 11, 26, '26.8.2014'),
	(11, 3, 17, '25.5.2012'),
	(5, 9, 34, '26.11.2014'),
	(1, 2, 12, '23.1.2012'),
	(11, 7, 3, '16.10.2014'),
	(10, 8, 37, '9.8.2014'),
	(3, 11, 30, '13.6.2013'),
	(8, 4, 43, '1.11.2013'),
	(3, 13, 13, '28.4.2014'),
	(10, 3, 40, '1.9.2013'),
	(9, 6, 4, '26.1.2013'),
	(11, 9, 47, '16.6.2012'),
	(7, 14, 1, '21.2.2014'),
	(10, 13, 11, '20.2.2014'),
	(1, 1, 22, '1.2.2012'),
	(8, 5, 5, '17.1.2013'),
	(8, 10, 18, '5.7.2012'),
	(7, 2, 10, '4.2.2012'),
	(9, 3, 8, '5.10.2012'),
	(6, 4, 31, '22.2.2014'),
	(8, 1, 19, '8.6.2012'),
	(9, 13, 28, '5.2.2014'),
	(9, 10, 23, '20.12.2013'),
	(12, 1, 23, '3.4.2014'),
	(7, 2, 41, '16.4.2014'),
	(6, 7, 29, '15.2.2013'),
	(7, 11, 2, '22.2.2014'),
	(6, 5, 11, '6.1.2013'),
	(3, 7, 43, '21.2.2012'),
	(8, 6, 30, '11.12.2013'),
	(1, 3, 14, '20.1.2013'),
	(9, 4, 30, '25.3.2013'),
	(10, 9, 7, '8.6.2014'),
	(1, 1, 16, '23.10.2012'),
	(11, 12, 37, '23.4.2013'),
	(1, 3, 7, '24.9.2012'),
	(5, 2, 22, '22.4.2013'),
	(1, 6, 19, '17.2.2013'),
	(12, 2, 45, '21.10.2014'),
	(10, 2, 6, '4.6.2013'),
	(1, 2, 34, '24.7.2013'),
	(8, 11, 18, '27.7.2013'),
	(12, 6, 34, '28.6.2013'),
	(7, 12, 34, '24.10.2012'),
	(9, 7, 6, '26.8.2014'),
	(7, 7, 46, '6.8.2012'),
	(4, 13, 43, '20.1.2013'),
	(8, 1, 25, '16.6.2014'),
	(3, 3, 31, '3.12.2014'),
	(6, 13, 46, '5.2.2014'),
	(11, 11, 14, '16.1.2013'),
	(9, 14, 42, '28.10.2012'),
	(12, 14, 39, '6.12.2012'),
	(5, 12, 15, '17.4.2013'),
	(6, 4, 21, '6.5.2014'),
	(9, 1, 25, '23.3.2014'),
	(11, 5, 7, '20.11.2012'),
	(5, 6, 25, '8.12.2012'),
	(6, 11, 31, '10.5.2013'),
	(4, 14, 16, '15.1.2012'),
	(3, 9, 32, '26.4.2014'),
	(2, 5, 20, '24.1.2014'),
	(12, 8, 22, '5.1.2013'),
	(3, 5, 42, '14.5.2012'),
	(11, 7, 12, '22.6.2013'),
	(1, 8, 30, '3.1.2013'),
	(9, 11, 38, '12.4.2012'),
	(3, 6, 9, '24.10.2013'),
	(11, 13, 23, '19.10.2012'),
	(9, 13, 3, '11.10.2012'),
	(8, 3, 31, '5.5.2012'),
	(6, 14, 38, '5.5.2014'),
	(7, 3, 34, '20.6.2012'),
	(12, 9, 34, '2.11.2012'),
	(2, 1, 14, '18.3.2012'),
	(3, 8, 25, '22.3.2012'),
	(1, 10, 2, '16.10.2013'),
	(9, 3, 21, '2.3.2012'),
	(3, 3, 3, '27.10.2012'),
	(5, 8, 12, '26.4.2012'),
	(2, 2, 12, '1.4.2014'),
	(10, 4, 22, '4.7.2012'),
	(9, 1, 24, '23.6.2013'),
	(5, 9, 15, '24.8.2013'),
	(8, 14, 3, '27.10.2014'),
	(2, 3, 18, '18.2.2012'),
	(6, 13, 32, '28.5.2014'),
	(11, 5, 43, '10.3.2012'),
	(6, 6, 22, '16.9.2014'),
	(5, 6, 28, '23.10.2013'),
	(7, 9, 12, '14.4.2013'),
	(4, 11, 47, '6.7.2012'),
	(5, 7, 44, '24.10.2014'),
	(9, 3, 6, '15.10.2013'),
	(6, 4, 43, '26.1.2013'),
	(10, 11, 36, '8.7.2013'),
	(7, 3, 42, '4.10.2013'),
	(5, 3, 4, '14.5.2012'),
	(3, 14, 11, '5.11.2013'),
	(9, 11, 19, '21.8.2012'),
	(12, 7, 1, '25.12.2014'),
	(10, 4, 3, '20.7.2012'),
	(8, 5, 5, '1.11.2014'),
	(3, 11, 19, '25.6.2013'),
	(4, 3, 23, '8.7.2014'),
	(1, 13, 41, '24.5.2012'),
	(11, 9, 22, '12.3.2012'),
	(5, 2, 23, '18.5.2012'),
	(9, 11, 32, '14.11.2013'),
	(5, 7, 45, '28.11.2014'),
	(12, 9, 37, '3.7.2013'),
	(3, 11, 39, '26.11.2012'),
	(4, 2, 7, '28.4.2014'),
	(11, 13, 13, '1.10.2012'),
	(2, 5, 1, '26.7.2012'),
	(7, 12, 37, '19.10.2013'),
	(2, 5, 33, '21.7.2012'),
	(8, 14, 7, '14.6.2014'),
	(6, 6, 42, '3.1.2013'),
	(10, 2, 35, '6.9.2013'),
	(1, 13, 9, '13.10.2012'),
	(3, 4, 4, '20.10.2012'),
	(8, 8, 46, '26.5.2013'),
	(8, 6, 20, '11.10.2012');

update purchase
set cost = (select models.price from models where models.modelID = purchase.modelID);

drop procedure countModelsInShops;
go
create procedure countModelsInShops
as
    select models.name, numberOfmodels from models join
	(select modelID, count(modelID) as numberOfModels from availible 
	where availible.havingIt = 1
	group by availible.modelID) x
		on x.modelID = models.modelID;
go

drop procedure countModelsInEveryShop;
go
create procedure countModelsInEveryShop
as
    select shops.metro, numberOfModelsInShop from shops join
	(select shopID, count(shopID) as numberOfModelsInShop from availible 
	where availible.havingIt = 1
	group by availible.shopID) x
		on x.shopID = shops.shopID;
go

--Составить список заказов покупателя

drop procedure getBuyerPurchases;
go
create procedure getBuyerPurchases @buyerName as varchar(100)
as
	select buyer.firstname, purchase.modelID, purchase.shopID, purchase.dateOfPurchase, purchase.cost 
	from purchase join buyer on purchase.buyerID = buyer.buyerID
	where buyer.firstname = @buyerName
go

exec getBuyerPurchases 'Zertsalov'
go

--exec getBuyerPurchases @buyerName=NULL

drop procedure whatOthersBuyWuthThisItem;
go
create procedure whatOthersBuyWuthThisItem @modelName as varchar(100)
as
	select distinct models.modelID as name, models.name from models join
	(select purchase.modelID as modelID from purchase join
	(select purchase.buyerID as buyerID from purchase join models on purchase.modelID = models.modelID) x
	on x.buyerID = purchase.buyerID) y
	on y.modelID = models.modelID
	order by models.modelID
go

--****
--CRUD
--****

drop procedure createBuyer
go
create procedure createBuyer
@firstname as varchar(100),
@secondname as varchar(100),
@e_mail as varchar(100)
as
begin
	if exists (select * from buyer where firstname = @firstname and secondname = @secondname and e_mail = @e_mail)
	begin
		throw 51000, 'buyer has already exists', 1;
	end
	insert into buyer(firstname, secondname, e_mail) values
		(@firstname, @secondname, @e_mail);
	select buyerID from buyer where firstname = @firstname and secondname = @secondname and e_mail = @e_mail
end
go

--сделать вывод

drop procedure tryCreateBuyer
go
create procedure tryCreateBuyer
@firstname as varchar(100),
@secondname as varchar(100),
@e_mail as varchar(100)
as
begin
	if exists (select * from buyer where firstname = @firstname and secondname = @secondname and e_mail = @e_mail)
	begin
		return -1
	end
	insert into buyer(firstname, secondname, e_mail) values
		(@firstname, @secondname, @e_mail);
	select buyerID from buyer where firstname = @firstname and secondname = @secondname and e_mail = @e_mail
end
go

drop procedure deleteBuyer
go
create procedure deleteBuyer @buyerID as integer
as
begin
	delete from buyer where buyer.buyerID = @buyerID
end
go

drop procedure updateBuyer
go
create procedure updateBuyer
@buyerID as integer,
@firstname as varchar(100),
@secondname as varchar(100),
@e_mail as varchar(100)
as
begin
	update buyer
	set firstname = @firstname where buyerID = @buyerID
	update buyer
	set secondname = @secondname where buyerID = @buyerID
	update buyer
	set fullname = firstname + ' ' + secondname where buyerID = @buyerID
	update buyer
	set e_mail = @e_mail where buyerID = @buyerID
end
go

drop procedure getBuyer
go
create procedure getBuyer @buyerID as integer
as
begin
	if @buyerID = NULL
	begin
		select * from buyer
	end
	else
	begin
		select * from buyer where buyerID = @buyerID
	end
end
go

--TRIGGERS

create trigger updateBuyers on buyer after insert as
begin
	update buyer
	set fullname = firstname + ' ' + secondname
end
go

create trigger updateCosts on purchase after insert as
begin
	update purchase
	set cost = (select models.price from models where models.modelID = purchase.modelID);
end
go

drop procedure createNewPurchase
go
create procedure createNewPurchase
@modelID as integer,
@buyerID as integer,
@shopID as integer,
@date as date
as
begin
	insert into purchase(modelID, buyerID, shopID, dateOfPurchase) values
		(@modelID, @buyerID, @shopID, @date);
	select purchaseID from purchase where buyerID = @buyerID and modelID = @modelID and shopID = @shopID and dateOfPurchase = @date
end
go

--updatable view

drop view fullPurchase
go

create view fullPurchase as
	select y.purchaseID as purchaseID, y.cost as cost, buyer.buyerID as buyerID, buyer.firstname as buyerName, 
		   y.modelID as modelID, y.name as modelName, y.shopID as shopID, y.metro as shopPlace
	from buyer join
		(select models.modelID as modelID, models.name as name, x.buyerID as buyerID, x.metro as metro, 
				x.purchaseID as purchaseID, x.shopID as shopID, x.cost as cost
		from models join
			(select shops.shopID as shopID, shops.metro as metro, purchase.buyerID as buyerID, 
					purchase.modelID as modelID, purchase.purchaseID as purchaseID, purchase.cost as cost
			from shops join purchase
			on shops.shopID = purchase.shopID) x
		on x.modelID = models.modelID) y
	on y.buyerID = buyer.buyerID
go

create trigger fullPurchaseInsert on fullPurchase instead of insert as
	set nocount on
		insert into purchase (buyerID, modelID, shopID)
		select buyerID, modelID, shopID
		from inserted
go

insert into fullPurchase (buyerID, modelID, shopID) values 
	(1, 1, 2);
go

--Динамическая генерация запросов

drop procedure reportCreator
go

create procedure reportCreator
@beginDate Date,
@endDate Date
as
begin
	declare @select varchar(8000)
	declare @currSelect varchar(8000)
	set @currSelect = '(select purchase.shopID as shopID, count(year(purchase.dateOfPurchase)) as _' + convert(varchar, year(@beginDate), 100) + ' from purchase where year(purchase.dateOfPurchase) = ' + 
					  convert(varchar, year(@beginDate), 100) + ' group by purchase.shopID) '
	set @select = ''
	declare @selected varchar(8000)
	set @selected = 'select _' + convert(varchar, year(@beginDate), 100) + '.shopID as shopID, _' +
					convert(varchar, year(@beginDate), 100) + '._' + convert(varchar, year(@beginDate), 100)
	set @select = @select + + @currSelect +  ' _' + convert(varchar, year(@beginDate), 100) 
	declare @on varchar(8000)
	declare @currDate date
	set @currDate = @beginDate
	while @currDate < @endDate
	begin
		if exists(
			select * from purchase
			where year(@currDate) = year(purchase.dateOfPurchase) 
			)
		begin
			set @currSelect = '(select purchase.shopID as shopID, count(year(purchase.dateOfPurchase)) as _' + 
							  convert(varchar, year(@currDate), 100) + ' from purchase where year(purchase.dateOfPurchase) = ' + 
							  convert(varchar, year(@currDate), 100) + ' group by purchase.shopID) '
			if (year(@currDate) <> year(@beginDate))
			begin
				set @selected = @selected + ', _' + convert(varchar, year(@currDate), 100) + '._' + convert(varchar, year(@currDate), 100)
				set @select = @select + ' join ' + @currSelect +  ' _' + convert(varchar, year(@currDate), 100)
				set @on = ' on _' + convert(varchar, year(@beginDate), 100) + '.shopID = _' + convert(varchar, year(@currDate), 100) + '.shopID'
				set @select = @select + @on
			end
			
		end
		set @currDate = dateadd("year", 1, @currDate)
	end 
	set @select = 'select shops.metro, counts.* from shops join (' + @selected + ' from ' + @select + ') counts on shops.shopID = counts.shopID'
	print @select;
	execute(@select);
end
go

exec reportCreator @beginDate = '01.01.2012', @endDate = '01.01.2015'
go
