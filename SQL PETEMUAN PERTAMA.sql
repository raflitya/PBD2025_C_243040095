CREATE DATABASE TokoRetailDB;

use TokoRetailDB;


CREATE TABLE Produk (
	ProdukID INT,
	SKU VARCHAR(15),
	NamaProduk VARCHAR (100),
	Harga DECIMAL (10, 2),
	Stok INT
);

EXEC sp_help 'produk';

--table pelanggan
CREATE TABLE Pelanggan (
	PelangganID INT IDENTITY (1,1) PRIMARY KEY,
	NamaDepan VARCHAR(50) NOT NULL,
	NamaBelakang VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	TanggalDaftar DATE DEFAULT GETDATE(), 
);

--membuat table PesananHeader
CREATE TABLE PesananHeader(
	PesananID INT IDENTITY(1,1) PRIMARY KEY,
	TanggalPesanan DATETIME2 NOT NULL,

	--FOREIGN KEY
	PelangganID INT NOT NULL,
	StatusPesanan VARCHAR(10) NOT NULL,

	--definisikan constrain FK
	CONSTRAINT FK_Pesanan_Pelanggan
	FOREIGN Key (PelangganID)
	REFERENCES Pelanggan(PelangganID),

	--definisikan COnstrain CHech
	CONSTRAINT CHK_StatusPesanan
	CHECK (StatusPesanan IN('Baru', 'Proses', 'Selesai'))
);

	--MENAMBAHKAN PRIMARY KEY
	--1. TAMBAHKAN NOT NULL DULU DENGAN ALTER COLUMN
	
	ALTER TABLE PRODUK
	ALTER COLUMN PRODUKid INT NOT NULL;

	--2. MENAMBAH CONTRAINT PK DENGAN ADD CONSTRAINT
	ALTER TABLE Produk
	ADD CONSTRAINT PK_Produk PRIMARY KEY (ProdukI);

	EXEC sp_help 'Produk';

	--MENAMBAHKAN KOLOM NOTELEPON KE TABEL PELANGGAN
	ALTER TABLE Pelanggan
	ADD NoTelpon VARCHAR(20) NULL;

	--MENGUBAH KOLOM HARGA DI PRODUK AGAR WAJIB DIISI
	ALTER TABLE Produk
	ALTER COLUMN Harga DECIMAL(10, 2) NOT NULL;