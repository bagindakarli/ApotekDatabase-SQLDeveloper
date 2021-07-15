CREATE TABLE Apoteker(
    nama VARCHAR(20),
    alamat VARCHAR(70),
    nip CHAR(18) NOT NULL ENABLE,
    jenis_kelamin CHAR(1),
    no_telp CHAR(12),
    tanggal_lahir DATE,
    CONSTRAINT apoteker_pk PRIMARY KEY (nip) ENABLE
);

CREATE TABLE Stock_Keeper(
    nama VARCHAR(20),
    alamat VARCHAR(70),
    nip CHAR(18) NOT NULL ENABLE,
    jenis_kelamin CHAR(1),
    no_telp CHAR(12),
    tanggal_lahir DATE,
    no_resi CHAR(6) NOT NULL,
    CONSTRAINT stock_keeper_pk PRIMARY KEY (nip) ENABLE
);

CREATE TABLE Supplier(
    id CHAR (10) NOT NULL ENABLE,
    nama VARCHAR(30),
    email VARCHAR(40),
    alamat VARCHAR(100),
    no_telp CHAR(12),
    CONSTRAINT supplier_pk PRIMARY KEY (id) ENABLE
);

CREATE TABLE Pembeli(
    nama VARCHAR(20),
    alamat VARCHAR(100),
    nik CHAR(16) NOT NULL ENABLE,
    jenis_kelamin CHAR(1),
    no_telp CHAR(12),
    tanggal_lahir DATE,
    CONSTRAINT pembeli_pk PRIMARY KEY (nik) ENABLE
);

CREATE TABLE Obat(
    id CHAR(6) NOT NULL ENABLE,
    nama VARCHAR(20),
    dosis VARCHAR(255),
    sediaan VARCHAR(120),
    stok NUMBER,
    harga NUMBER,
    CONSTRAINT obat_pk PRIMARY KEY (id) ENABLE
);

CREATE TABLE Membeli(
    nik CHAR(16) NOT NULL,
    id_obat CHAR(6) NOT NULL,
    nip CHAR(18) NOT NULL,
    no_transaksi CHAR(6) NOT NULL,
    banyaknya NUMBER
);

CREATE TABLE Menyuplai(
    id_obat CHAR(6) NOT NULL,
    id_supplier CHAR(10) NOT NULL,
    no_resi CHAR(6) NOT NULL,
    CONSTRAINT menyuplai_pk PRIMARY KEY (no_resi) ENABLE
);

ALTER TABLE Stock_Keeper ADD CONSTRAINT stock_keeper_fk1 FOREIGN KEY (no_resi)
    REFERENCES Menyuplai (no_resi) ON DELETE CASCADE;
ALTER TABLE Membeli ADD CONSTRAINT membeli_fk1 FOREIGN KEY (nik)
    REFERENCES Pembeli (nik) ON DELETE CASCADE;
ALTER TABLE Membeli ADD CONSTRAINT membeli_fk2 FOREIGN KEY (id_obat)
    REFERENCES Obat (id) ON DELETE CASCADE;
ALTER TABLE Membeli ADD CONSTRAINT membeli_fk3 FOREIGN KEY (nip)
    REFERENCES Apoteker (nip) ON DELETE CASCADE;
ALTER TABLE Menyuplai ADD CONSTRAINT menyuplai_fk2 FOREIGN KEY (id_supplier)
    REFERENCES Supplier (id) ON DELETE CASCADE;
ALTER TABLE Menyuplai ADD CONSTRAINT menyuplai_fk1 FOREIGN KEY (id_obat)
    REFERENCES Obat (id) ON DELETE CASCADE;
    
alter session set nls_date_format= 'DD-MM-YYYY';    

INSERT INTO Apoteker VALUES('Antonio','Jl. Buah batu No.1','197001012000031001','L','08123117001','01-01-1970');
INSERT INTO Apoteker VALUES('Budi','Jl. Pelajar Pejuang No. 1','197001282000031002','L','08123117002','28-01-1970');
INSERT INTO Apoteker VALUES('Caca','Jl. Pelajar Pejuang No. 2','197102022000032003','P','08123117003','02-02-1971');
INSERT INTO Apoteker VALUES('Ari','Jl. Dayeuhkolot No. 1','197102272000031004','L','08123117004','27-02-1971');
INSERT INTO Apoteker VALUES('Rahmi','Jl. Baleendah No. 1','197203032000032005','P','08123117005','03-03-1972');
INSERT INTO Apoteker VALUES('Rusli','Jl. Moh Toha No. 1','197203262000031006','L','08123117006','26-03-1972');
INSERT INTO Apoteker VALUES('Fahmi','Jl. Batu Nunggal No. 1','197304042000031007','L','08123117007','04-04-1973');
INSERT INTO Apoteker VALUES('Doni','Jl. Sukapura No. 1','197304252000031008','L','08123117008','25-04-1973');
INSERT INTO Apoteker VALUES('Fajar','Jl. Sukabirus No. 1','197405052000031009','L','08123117009','05-05-1974');
INSERT INTO Apoteker VALUES('Tati','Jl. Dayeuhkolot No. 2','197405242000032010','P','08123117010','24-05-1974');
INSERT INTO Apoteker VALUES('Dono','Jl. Baleendah No. 2','197506062000031011','L','08123117011','06-06-1975');
INSERT INTO Apoteker VALUES('Joko','Jl. Moh Toha No. 2','197506232000031012','L','08123117012','23-06-1975');
INSERT INTO Apoteker VALUES('Dinda','Jl. Batu Nunggal No. 2','197607072000032013','P','08123117013','07-07-1976');
INSERT INTO Apoteker VALUES('Bambang','Jl. Sukabirus No. 2','197607222000031014','L','08123117014','22-07-1976');
INSERT INTO Apoteker VALUES('Surti','Jl. Sukabirus No. 3','197708082000032015','P','08123117015','08-08-1977');
INSERT INTO Apoteker VALUES('Harti','Jl. Moh Toha N0. 3','197708232000032016','P','08123117016','23-08-1977');
INSERT INTO Apoteker VALUES('Putri','Jl. Dayeuhkolot No. 3','197809092000032017','P','08123117017','09-09-1978');
INSERT INTO Apoteker VALUES('Keke','Jl. Buah batu N0. 2','197810222000032018','P','08123117018','22-10-1978');
INSERT INTO Apoteker VALUES('Hendra','Jl. Buah batu No. 3','197911212000031019','L','08123117019','21-11-1979');
INSERT INTO Apoteker VALUES('Ujang','Jl. Pelajar Pejuang N0. 3','198012302000031020','L','08123117020','30-12-1980');    

INSERT INTO Stock_keeper VALUES('Mamat','Jl Perumahan Buah Batu No. 4','197001012000031021','L','087764117865','01-01-1970','000010');
INSERT INTO Stock_keeper VALUES('Junaedi','Jl. Cherry Field No. 4','197001282000031022','L','087764117866','28-01-1970','000002');
INSERT INTO Stock_keeper VALUES('Slamet','Jl. PGA N0. 4','197102022000031023','L','087764117867','02-02-1971','000008');
INSERT INTO Stock_keeper VALUES('Juminten','Jl. Sukabirus N0. 4','197102272000032024','P','087764117868','27-02-1971','000006');
INSERT INTO Stock_keeper VALUES('Euis','Jl. Sukapura No. 4','197203032000032025','P','087764117869','03-03-1972','000006');
INSERT INTO Stock_keeper VALUES('Dadang','Jl. Pesona Bali Residence No. 4','197203262000031026','L','087764117870','26-03-1972','000003');
INSERT INTO Stock_keeper VALUES('Maman','Jl. Gelora Bandung Asri N0. 4','197304042000031027','L','087764117871','04-04-1973','000001');
INSERT INTO Stock_keeper VALUES('Neneng','Jl Perumahan Buah Batu No. 5','197304252000032028','P','087764117872','25-04-1973','000009');
INSERT INTO Stock_keeper VALUES('Ita','Jl. Cherry Field No. 5','197405052000032029','P','087764117873','05-05-1974','000004');
INSERT INTO Stock_keeper VALUES('Susanti','Jl. PGA N0. 5','197405242000032030','P','087764117874','24-05-1974','000009');
INSERT INTO Stock_keeper VALUES('Asih','Jl. Sukabirus N0. 5','197506062000032031','P','087764117875','06-06-1975','000005');
INSERT INTO Stock_keeper VALUES('Susi','Jl. Sukapura No. 5','197506232000032032','P','087764117876','23-06-1975','000007');
INSERT INTO Stock_keeper VALUES('Bambang','Jl. Pesona Bali Residence No. 5','197607072000031033','L','087764117877','07-07-1976','000007');
INSERT INTO Stock_keeper VALUES('Lastri','Jl. Gelora Bandung Asri N0. 5','197607222000032034','P','087764117878','22-07-1976','000002');
INSERT INTO Stock_keeper VALUES('Sri','Jl Perumahan Buah Batu No. 6','197708082000032035','P','087764117879','08-08-1977','000004');
INSERT INTO Stock_keeper VALUES('Mulyani','Jl. Cherry Field No. 6','197708232000032036','P','087764117880','23-08-1977','000003');
INSERT INTO Stock_keeper VALUES('Sulastir','Jl. PGA N0. 6','197809092000032037','P','087764117881','09-09-1978','000011');
INSERT INTO Stock_keeper VALUES('Margono','Jl. Sukabirus N0. 6','197810222000031038','L','087764117882','22-10-1978','000001');
INSERT INTO Stock_keeper VALUES('Mamik','Jl. Sukapura No. 6','197911212000032039','P','087764117883','21-11-1979','000005');
INSERT INTO Stock_keeper VALUES('Suginah','Jl. Pesona Bali Residence No. 6','198012302000032040','P','087764117884','30-12-1980','000008');

INSERT INTO supplier VALUES('sp001','PT Tempo','PtTempo@gmail.com','Jl. Soekarno-Hatta No. 604 Km. 9,5 Bandung','0227562072');
INSERT INTO supplier VALUES('sp002','PT Tiara Kencana','PtTiaraKencana@gmail.com','Jl. Sriwijaya No. 120 Bandung','0225206523');
INSERT INTO supplier VALUES('sp003','PT Tiga A','PtTiga A@gmail.com','Jl. Pungkur No. 41 Rt 05/03 Kel Balonggede - Kec Regol Bandung 40251','0224204117');
INSERT INTO supplier VALUES('sp004','PT Tigaka Distrindo Perkasa','PtTigakaDistrindoPerkasa@gmail.com','Jl. Gegerkalong Hilir No. 153 Bandung ','022214134');
INSERT INTO supplier VALUES('sp005','Tira Wirajaya, PT','PtTiraWirajaya@gmail.com','Jl. MM Mustofa No. 7 A Bandung','022737721');
INSERT INTO supplier VALUES('sp006','Tjatur Dianson Farma, PT','PtTjaturDiansonFarma@gmail.com','Jl. Saturnus Selatan No. 2 Kompl. Margahayu Raya Bandung','022762018');
INSERT INTO supplier VALUES('sp007','Tjipta Niaga, PT','PtTjiptaNiaga@gmail.com','Jl. Jawa No. 12 Bandung','0224204024');
INSERT INTO supplier VALUES('sp008','Tiara Kencana, PT','PtTiaraKencana@gmail.com','Jl. Sriwijaya No. 120 Bandung','0225206523');
INSERT INTO supplier VALUES('sp009','Tiputra Maju Sentosa','TiputraMajuSentosa@gmail.com','Jl. Merkuri Utara Iv No.12 Rt 06/21 Kel Sekejati - Kec Margacinta Bandung','0227502916');
INSERT INTO supplier VALUES('sp010','Tira Wirajaya, PT','PtTiraWirajaya@gmail.com','JL. MM Mustofa No. 7 A Bandung','022737721');
INSERT INTO supplier VALUES('sp011','Tirta Husada Farma, PT','PtTirtaHusadaFarma@gmail.com','Jl. Jendr Gatot Subroto No. 21 Bandung','02256868');
INSERT INTO supplier VALUES('sp012','PT DKSH','PtDKSH@gmail.com','Jl. Sidomukti No.55 Rt 09/02 Kel Sukaluyu - Kec Cibeunying Kaler, Bandung','0222500396');
INSERT INTO supplier VALUES('sp013','UNITED CITO CITAS, PT','PtUnitedCitoCitas@gmail.com','Jl. Cihampelas No.21 Rt 03/03 Kel Pasirkaliki - Kec Cicendo, Bandung','0224236819');
INSERT INTO supplier VALUES('sp014','WAHONO TARUNA SAKTI, PT','PtWahonoTarunaSakti@gmail.com','Jl. Mahmud No. 2 Bandung, Jawa Barat','0221487618');
INSERT INTO supplier VALUES('sp015','WIGO HOSLAB, PT','PtWigoHoslab,@gmail.com','Jl. Pahlawan No. 55 Bandung','0222508530');
INSERT INTO supplier VALUES('sp016','WIHADI WYDIA, PT','PtWihadiWydia@gmail.com','Jl. Sukamaju No.42 Rt 01/11 Kel Pasteur - Kec Sukajadi, Bandung Jawa Barat','0222039090');
INSERT INTO supplier VALUES('sp017','Alida Perintis Jaya, PT','PtAlidaPerintisJaya@gmail.com','Jl. Babakan Tarogong No. 110 Bandung,','0226045602');
INSERT INTO supplier VALUES('sp018','Aniza Burhan Bersaudara, PT','PtAnizaBurhanBersaudara@gmail.com','Jl. Sukahaji No. 125 A Bandung','0226527871');
INSERT INTO supplier VALUES('sp019','Antar Mitra Sembada, PT','PtAntarMitraSembada@gmail.com','Jl. LMU Nurtanio No. 85 Bandung','0226031594');
INSERT INTO supplier VALUES('sp020','Yunia Yoga Farma, PT','PtYuniaYogaFarma@gmail.com','Jl. Pasirluyu V No.15 Rt 01/08 Kel Ancol - Kec Regol Bandung 40254','0225200839');

INSERT INTO Pembeli VALUES('Rakes','Jl Perumahan Buah Batu No. 1','3273220101900001','L','081266778899','01-01-1990');
INSERT INTO Pembeli VALUES('Iben','Jl. Cherry Field No. 1','3273222801900002','L','081266778900','28-01-1990');
INSERT INTO Pembeli VALUES('Lula','Jl. PGA N0. 1','3273224202910003','P','081266778901','02-02-1991');
INSERT INTO Pembeli VALUES('Iday','Jl. Sukabirus N0. 1','3273222702910004','L','081266778902','27-02-1991');
INSERT INTO Pembeli VALUES('Alvinda','Jl. Sukapura No. 1','3273224303920005','P','081266778903','03-03-1992');
INSERT INTO Pembeli VALUES('Dela','Jl. Pesona Bali Residence No. 1','3273226603920006','P','081266778904','26-03-1992');
INSERT INTO Pembeli VALUES('Faris','Jl. Gelora Bandung Asri N0. 1','3273220404930007','L','081266778905','04-04-1993');
INSERT INTO Pembeli VALUES('Fandi','Jl Perumahan Buah Batu No. 2','3273222504930008','L','081266778906','25-04-1993');
INSERT INTO Pembeli VALUES('Fadil','Jl. Cherry Field No. 2','3273220505940009','L','081266778907','05-05-1994');
INSERT INTO Pembeli VALUES('Janu','Jl. PGA N0. 2','3273222405940010','L','081266778908','24-05-1994');
INSERT INTO Pembeli VALUES('Annas','Jl. Sukabirus N0. 2','3273220606950011','L','081266778909','06-06-1995');
INSERT INTO Pembeli VALUES('Wira','Jl. Sukapura No. 2','3273222306950012','L','081266778910','23-06-1995');
INSERT INTO Pembeli VALUES('Gillang','Jl. Pesona Bali Residence No. 2','3273220707960013','L','081266778911','07-07-1996');
INSERT INTO Pembeli VALUES('Vinny','Jl. Gelora Bandung Asri N0. 2','3273222207960014','L','081266778912','22-07-1996');
INSERT INTO Pembeli VALUES('karim','Jl Perumahan Buah Batu No. 3','3273220808970015','L','081266778913','08-08-1997');
INSERT INTO Pembeli VALUES('Ambar','Jl. Cherry Field No. 3','3273222108970016','P','081266778914','21-08-1997');
INSERT INTO Pembeli VALUES('Ryan','Jl. PGA N0. 3','3273220909980017','L','081266778915','09-09-1998');
INSERT INTO Pembeli VALUES('Rafid','Jl. Sukabirus N0. 3','3273222010980018','L','081266778916','20-10-1998');
INSERT INTO Pembeli VALUES('Ilham','Jl. Sukapura No. 3','3273221011990019','L','081266778917','10-11-1999');
INSERT INTO Pembeli VALUES('Veshea','Jl. Pesona Bali Residence No. 3','3273223012000020','P','081266778918','30-12-2000');

INSERT INTO obat VALUES('obt001','Amoxicillin','20-40mg/kgBB/hari (3x)','Caps 250mg, Kaptab500mg, Syr125;250mg/5ml, Inj. 1g/vial',21,4500);
INSERT INTO obat VALUES('obt002','Ampicillin','50-100mg/kgBB/hari (4x)IV: 100-200mg/kgBB/hari (4x)','Caps 250mg, Kaptab500mg, Syr125;250mg/5ml, Inj.0,5;1g/vial',30,18900);
INSERT INTO obat VALUES('obt003','As. Nalidiksat','55mg/kgBB/hari (4x','Tab 500mg',27,20000);
INSERT INTO obat VALUES('obt004','Ceftriaxone','50-80mg/kgBB/hari (1x)','Inj. 500mg;1g/vial (IM/IV)',33,8000);
INSERT INTO obat VALUES('obt005','Cefixime','3-10mg/kgBB/hari (2x)','Caps 50;100mg, Syr100mg/5ml',24,12000);
INSERT INTO obat VALUES('obt006','Cefadroxil','25-30mg/kgBB/hari (2x)Dewasa 500mg/kali (2-4x)','Caps 250;500mg, Syr125;500mg/5ml',26,1500);
INSERT INTO obat VALUES('obt007','Cefuroxime','20mg/kgBB/hari (2x)','Tab 500mg, Kap250;500mg, Inj.750mg;1g/vial',11,10000);
INSERT INTO obat VALUES('obt008','Cefotaxime','Anak: 50-100mg/kgBB/hari(3x)BB <50kg: 100-200mg/kgBB/hari (3-4x)IM/IV BB>50kg: 1-2g (3-4x)Dewasa: 1g/kali (2x)','Inj. 500mg;1g/vial',30,11500);
INSERT INTO obat VALUES('obt009','Cotrimoxazole','T: 6-12mg/kgBB/hari (2x)S: 30-50mg/kgBB/hari (2x)','Pedtab 120mg, Tab480;960mg, Susp.240mg/5ml',17,1600);
INSERT INTO obat VALUES('obt010','Chloramphenicol','Usia >1bln: 50-75mg/kgBB/hari (4x','Caps 250;500mg, Syr125mg/5ml, Inj. 1g/vial',18,4600);
INSERT INTO obat VALUES('obt011','INH','10-15mg/kgBB/hari','Tab 100;300mg, Syr 10mg/ml',29,45000);
INSERT INTO obat VALUES('obt012','Rifampisin','10-20mg/kgBB/hari (1-2x)','Caps-Tab 150;300;450;600mg,Syr 20mg/ml',29,11000);
INSERT INTO obat VALUES('obt013','Dexamethasone','Anak: 0,006-0,4mg/kgBB/hariDewasa: 0,2-0,5mg/kgBB/hari','LD: 0,5-1mg/kgBB bolusMD: 1mg/kgBB/hari (3-4x)IV/IM',15,185000);
INSERT INTO obat VALUES('obt014','Prednison','1-2mg/kgBB/hari (3x)','Tab 5mg',27,12800);
INSERT INTO obat VALUES('obt015','Salbutamol','0,1-0,15mg/kgBB/kali (3-4x)','Tab 2;4mg, Syr2mg/5ml',23,2500);
INSERT INTO obat VALUES('obt016','Prednisolon','1-2mg/kgBB/hari (4x)','Tab 4mg',34,1600);
INSERT INTO obat VALUES('obt017','Mebhidrolin','7,5mg/kgBB/hari (3x)','Tab 50mg, Syr 50mg/5ml',20,10000);
INSERT INTO obat VALUES('obt018','Hemoklorsiklin','0,15mg/kgBB/hari (3x)','Tab 10mg',22,17000);
INSERT INTO obat VALUES('obt019','Misoprostol','200mcg/hari (4x)','Tab 200mcg',28,500000);
INSERT INTO obat VALUES('obt020','Hiasin','1-4gtt (3x)','Drop 1mg/ml',25,13000);

INSERT INTO Membeli VALUES('3273220101900001','obt001','197001012000031001','000001',3);
INSERT INTO Membeli VALUES('3273220101900001','obt002','197001012000031001','000001',2);
INSERT INTO Membeli VALUES('3273220101900001','obt003','197001012000031001','000001',4);
INSERT INTO Membeli VALUES('3273222702910004','obt004','197102272000031004','000002',1);
INSERT INTO Membeli VALUES('3273222702910004','obt001','197102272000031004','000002',5);
INSERT INTO Membeli VALUES('3273222702910004','obt006','197102272000031004','000002',7);
INSERT INTO Membeli VALUES('3273220404930007','obt004','197304042000031007','000003',2);
INSERT INTO Membeli VALUES('3273222504930008','obt005','197304252000031008','000004',3);
INSERT INTO Membeli VALUES('3273220505940009','obt009','197405052000031009','000005',4);
INSERT INTO Membeli VALUES('3273220505940009','obt010','197405052000031009','000005',4);
INSERT INTO Membeli VALUES('3273220606950011','obt006','197506062000031011','000006',1);
INSERT INTO Membeli VALUES('3273220606950011','obt002','197506062000031011','000006',2);
INSERT INTO Membeli VALUES('3273220606950011','obt004','197506062000031011','000006',5);
INSERT INTO Membeli VALUES('3273222207960014','obt014','197607222000031014','000007',3);
INSERT INTO Membeli VALUES('3273222207960014','obt003','197607222000031014','000007',3);
INSERT INTO Membeli VALUES('3273222108970016','obt016','197708232000032016','000008',6);
INSERT INTO Membeli VALUES('3273220909980017','obt009','197809092000032017','000009',5);
INSERT INTO Membeli VALUES('3273220909980017','obt004','197809092000032017','000009',4);
INSERT INTO Membeli VALUES('3273221011990019','obt005','197911212000031019','000010',3);
INSERT INTO Membeli VALUES('3273221011990019','obt020','197911212000031019','000010',1);

INSERT INTO Menyuplai VALUES('obt001','sp001','000001');
INSERT INTO Menyuplai VALUES('obt002','sp001','000002');
INSERT INTO Menyuplai VALUES('obt003','sp001','000003');
INSERT INTO Menyuplai VALUES('obt004','sp002','000004');
INSERT INTO Menyuplai VALUES('obt005','sp003','000005');
INSERT INTO Menyuplai VALUES('obt004','sp004','000006');
INSERT INTO Menyuplai VALUES('obt003','sp004','000007');
INSERT INTO Menyuplai VALUES('obt002','sp004','000008');
INSERT INTO Menyuplai VALUES('obt001','sp004','000009');
INSERT INTO Menyuplai VALUES('obt010','sp011','000010');
INSERT INTO Menyuplai VALUES('obt011','sp011','000011');
INSERT INTO Menyuplai VALUES('obt001','sp012','000012');
INSERT INTO Menyuplai VALUES('obt013','sp013','000013');
INSERT INTO Menyuplai VALUES('obt014','sp013','000014');
INSERT INTO Menyuplai VALUES('obt015','sp015','000015');
INSERT INTO Menyuplai VALUES('obt001','sp016','000016');
INSERT INTO Menyuplai VALUES('obt017','sp019','000017');
INSERT INTO Menyuplai VALUES('obt018','sp019','000018');
INSERT INTO Menyuplai VALUES('obt001','sp019','000019');
INSERT INTO Menyuplai VALUES('obt020','sp020','000020');

select * from apoteker;
select * from stock_keeper;
select * from supplier;
select * from pembeli;
select * from obat;
select * from membeli;
select * from menyuplai;

select nama, alamat, no_telp, floor(months_between(sysdate,tanggal_lahir)/12) as USIA
from pembeli
where jenis_kelamin='L' and alamat like '%Sukabirus%';

SELECT pembeli.nama, SUM(membeli.banyaknya) AS "Total Barang yang Dibeli",
                     SUM (obat.harga * membeli.banyaknya) AS "Total Harga"
FROM pembeli JOIN membeli ON (pembeli.nik = membeli.nik)
             JOIN obat ON (membeli.id_obat = obat.id)
HAVING SUM (obat.harga * membeli.banyaknya) =
    (SELECT MAX (SUM (obat.harga * membeli.banyaknya))
     FROM membeli JOIN obat ON (membeli.id_obat = obat.id)
     GROUP BY membeli.nik)
GROUP BY (pembeli.nama);

select stock_keeper.nama, stock_keeper.nip, supplier.nama, obat.nama,  obat.stok * obat.harga "TOTAL PENGELUARAN APOTEK"
from menyuplai join stock_keeper using (no_resi)
               join supplier on (menyuplai.id_supplier = supplier.id)
               join obat on (menyuplai.id_obat = obat.id)
order by obat.stok * obat.harga;               

                    COTS (Tampilkan nama apoteker yang melayani pembeli dengan total pembelian terbanyak!)

select apoteker.nama "NAMA APOTEKER", pembeli.nama "NAMA PEMBELI", sum(membeli.banyaknya * obat.harga) "TOTAL PEMBELIAN"
from membeli join apoteker using (nip)
             join pembeli using (nik)
             join obat on (membeli.id_obat = obat.id)
having sum(membeli.banyaknya*obat.harga) =
    (select max(sum(membeli.banyaknya*obat.harga))
     from membeli join obat on (membeli.id_obat = obat.id)
     group by membeli.nik)
group by apoteker.nama, pembeli.nama;