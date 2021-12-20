BEGIN;

CREATE TABLE "arabalar" -------------------------------------
CREATE TABLE "public"."arabalar" ( 
	"arabano" INTEGER NOT NULL,
	"marka" CHARACTER VARYING NOT NULL,
	"model" CHARACTER VARYING NOT NULL,
	"uretimyili" INTEGER NOT NULL,
	"kilometre" INTEGER NOT NULL,
	"renk" CHARACTER VARYING NOT NULL,
	"plaka" CHARACTER VARYING NOT NULL,
	"arabatur_id" INTEGER NOT NULL,
	"konum_id" INTEGER NOT NULL,
	PRIMARY KEY ( "arabano" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_arabatur_id" ----------------------------
CREATE INDEX "index_arabatur_id" ON "public"."arabalar" USING btree( "arabatur_id" );
-------------------------------------------------------------

CREATE INDEX "index_konum_id" -------------------------------
CREATE INDEX "index_konum_id" ON "public"."arabalar" USING btree( "konum_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "arabalar" 
( "arabano", "arabatur_id", "kilometre", "konum_id", "marka","model", "plaka", "renk","uretimyili" )
VALUES
('0001','0001', '100000', '0001', 'reno', '19', '34ab3435', 'mavi', '2000');

INSERT INTO "arabalar" 
( "arabano", "arabatur_id", "kilometre", "konum_id", "marka","model", "plaka", "renk","uretimyili" )
VALUES
('0002','0002', '200000', '0002', 'bmw', 'i5', '34cd4645', 'kırmızı', '2015');

BEGIN;

CREATE TABLE "sigorta" --------------------------------------
CREATE TABLE "public"."sigorta" ( 
	"sigortano" INTEGER NOT NULL,
	"sigortaad" CHARACTER VARYING NOT NULL,
	"sgrtucret" INTEGER NOT NULL,
	"kiralama_id" INTEGER NOT NULL,
	PRIMARY KEY ( "sigortano" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_kiralama_id" ----------------------------
CREATE INDEX "index_kiralama_id" ON "public"."sigorta" USING btree( "kiralama_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "sigorta" 
( "sigortano", "sigortaad", "sgrtucret", "kiralama_id" )
VALUES
('0001','aras', '100', '0001');

INSERT INTO "sigorta" 
( "sigortano", "sigortaad", "sgrtucret", "kiralama_id" )
VALUES
('0002','mng', '200', '0002');

BEGIN;

CREATE TABLE "yakit" ----------------------------------------
CREATE TABLE "public"."yakit" ( 
	"yakitno" INTEGER NOT NULL,
	"yakitistek" CHARACTER VARYING NOT NULL,
	PRIMARY KEY ( "yakitno" ) );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "yakit" 
( "yakitno", "yakitistek" )
VALUES
('0001','evet');

INSERT INTO "yakit" 
( "yakitno", "yakitistek" )
VALUES
('0002','hayır');

BEGIN;

CREATE TABLE "fatura" ---------------------------------------
CREATE TABLE "public"."fatura" ( 
	"faturano" INTEGER NOT NULL,
	"ekpmnucret" INTEGER NOT NULL,
	"arabaucret" INTEGER NOT NULL,
	"sigrtucret" INTEGER NOT NULL,
	"indirim" INTEGER NOT NULL,
	"toplamucret" INTEGER NOT NULL,
	PRIMARY KEY ( "faturano" ) );
 ;

-------------------------------------------------------------

COMMIT;

INSERT INTO "fatura" 
( "faturano", "ekpmnucret", "arabaucret", "sigrtucret", "indirim","toplamucret" )
VALUES
('0001','1000', '100000', '100', '100', '101000');

INSERT INTO "fatura" 
( "faturano", "ekpmnucret", "arabaucret", "sigrtucret", "indirim","toplamucret" )
VALUES
('0002','2000', '200000', '200', '200', '202000');

BEGIN;

CREATE TABLE "kiralama" -------------------------------------
CREATE TABLE "public"."kiralama" ( 
	"kirano" INTEGER NOT NULL,
	"alistarih" CHARACTER VARYING NOT NULL,
	"teslimtarih" CHARACTER VARYING NOT NULL,
	"alisyeri" CHARACTER VARYING NOT NULL,
	"teslimyeri" CHARACTER VARYING NOT NULL,
	"yakit_id" INTEGER NOT NULL,
	"musteri_id" INTEGER NOT NULL,
	"konum_id" INTEGER NOT NULL,
	"arabalar_id" INTEGER NOT NULL,
	"fatura_id" INTEGER NOT NULL,
	PRIMARY KEY ( "kirano" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_yakit_id" -------------------------------
CREATE INDEX "index_yakit_id" ON "public"."kiralama" USING btree( "yakit_id" );
-------------------------------------------------------------

CREATE INDEX "index_musteri_id" -----------------------------
CREATE INDEX "index_musteri_id" ON "public"."kiralama" USING btree( "musteri_id" );
-------------------------------------------------------------

CREATE INDEX "index_konum_id1" ------------------------------
CREATE INDEX "index_konum_id1" ON "public"."kiralama" USING btree( "konum_id" );
-------------------------------------------------------------

CREATE INDEX "index_arabalar_id" ----------------------------
CREATE INDEX "index_arabalar_id" ON "public"."kiralama" USING btree( "arabalar_id" );
-------------------------------------------------------------

CREATE INDEX "index_fatura_id" ----------------------------
CREATE INDEX "index_fatura_id" ON "public"."kiralama" USING btree( "fatura_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "kiralama" 
( "kirano", "alistarih", "teslimtarih", "alisyeri", "teslimyeri","yakit_id","musteri_id","konum_id","arabalar_id","fatura_id" )
VALUES
('0001','2010', '2011', 'ankara', 'istanbul', '0001','0001','0001','0001','0001');

INSERT INTO "kiralama" 
( "kirano", "alistarih", "teslimtarih", "alisyeri", "teslimyeri","yakit_id","musteri_id","konum_id","arabalar_id","fatura_id" )
VALUES
('0002','2011', '2012', 'trabzon', 'izmir', '0002','0002','0002','0002','0002');

BEGIN;

CREATE TABLE "sgrtkira" -------------------------------------
CREATE TABLE "public"."sgrtkira" ( 
	"kiralama_id" INTEGER NOT NULL,
	"sigorta_id" INTEGER NOT NULL,
	PRIMARY KEY ( "kiralama_id", "sigorta_id" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_sigorta_id" -----------------------------
CREATE INDEX "index_sigorta_id" ON "public"."sgrtkira" USING btree( "sigorta_id" );
-------------------------------------------------------------

CREATE INDEX "index_kiralama_id2" ---------------------------
CREATE INDEX "index_kiralama_id2" ON "public"."sgrtkira" USING btree( "kiralama_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "sgrtkira" 
( "kiralama_id", "sigorta_id" )
VALUES
('0001','0001');

INSERT INTO "sgrtkira" 
( "kiralama_id", "sigorta_id" )
VALUES
('0002','0002');

BEGIN;

CREATE TABLE "arabaekpmn" -----------------------------------
CREATE TABLE "public"."arabaekpmn" ( 
	"arbekpmnno" INTEGER NOT NULL,
	"baslamatarih" CHARACTER VARYING NOT NULL,
	"bitistarih" CHARACTER VARYING NOT NULL,
	"ekipman_id" INTEGER NOT NULL,
	"arabalar_id" INTEGER NOT NULL,
	PRIMARY KEY ( "arabalar_id", "ekipman_id" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_ekipman_id" -----------------------------
CREATE INDEX "index_ekipman_id" ON "public"."arabaekpmn" USING btree( "ekipman_id" );
-------------------------------------------------------------

CREATE INDEX "index_arabalar_id1" ---------------------------
CREATE INDEX "index_arabalar_id1" ON "public"."arabaekpmn" USING btree( "arabalar_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "arabaekpmn" 
( "arbekpmnno", "baslamatarih", "bitistarih", "ekipman_id", "arabalar_id" )
VALUES
('0001','2013', '2014', '0001', '0001');

INSERT INTO "arabaekpmn" 
( "arbekpmnno", "baslamatarih", "bitistarih", "ekipman_id", "arabalar_id" )
VALUES
('0002','2014', '2015', '0002', '0002');

BEGIN;

CREATE TABLE "konum" ----------------------------------------
CREATE TABLE "public"."konum" ( 
	"konumno" INTEGER NOT NULL,
	"sehir" CHARACTER VARYING NOT NULL,
	"adres" CHARACTER VARYING NOT NULL,
	"ulke" CHARACTER VARYING NOT NULL,
	PRIMARY KEY ( "konumno" ) );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "konum" 
( "konumno", "sehir", "adres", "ulke" )
VALUES
('0001','istanbul', 'başakşehir', 'turkey');

INSERT INTO "konum" 
( "konumno", "sehir", "adres", "ulke" )
VALUES
('0002','izmir', 'karşıyaka', 'turkey');

BEGIN;

CREATE TABLE "ekipman" --------------------------------------
CREATE TABLE "public"."ekipman" ( 
	"ekipmanno" INTEGER NOT NULL,
	"ekpmnad" CHARACTER VARYING NOT NULL,
	"konum_id" INTEGER NOT NULL,
	"ekpmntur_id" INTEGER NOT NULL,
	PRIMARY KEY ( "ekipmanno" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_konum_id2" ------------------------------
CREATE INDEX "index_konum_id2" ON "public"."ekipman" USING btree( "konum_id" );
-------------------------------------------------------------

CREATE INDEX "index_ekpmntur_id" ----------------------------
CREATE INDEX "index_ekpmntur_id" ON "public"."ekipman" USING btree( "ekpmntur_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "ekipman" 
( "ekipmanno", "ekpmnad", "konum_id", "ekpmntur_id" )
VALUES
('0001','takoz', '0001', '0001');

INSERT INTO "ekipman" 
( "ekipmanno", "ekpmnad", "konum_id", "ekpmntur_id" )
VALUES
('0002','ilk yardım', '0002', '0002');

BEGIN;

CREATE TABLE "ekpmntur" -------------------------------------
CREATE TABLE "public"."ekpmntur" ( 
	"ekpmnturno" INTEGER NOT NULL,
	"ekpmnturad" CHARACTER VARYING NOT NULL,
	"ekpmnucret" INTEGER NOT NULL,
	PRIMARY KEY ( "ekpmnturno" ) );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "ekpmntur" 
( "ekpmnturno", "ekpmnturad", "ekpmnucret" )
VALUES
('0001','sağlık', '1000');

INSERT INTO "ekpmntur" 
( "ekpmnturno", "ekpmnturad", "ekpmnucret" )
VALUES
('0002','hasar', '2000');

BEGIN;

CREATE TABLE "rezervasyon" ----------------------------------
CREATE TABLE "public"."rezervasyon" ( 
	"rezno" INTEGER NOT NULL,
	"rezalistarih" CHARACTER VARYING NOT NULL,
	"rezteslimtarih" CHARACTER VARYING NOT NULL,
	"musteri_id" INTEGER NOT NULL,
	"arabatur_id" INTEGER NOT NULL,
	"konum_id" INTEGER NOT NULL,
	"ucus_id" INTEGER NOT NULL,
	PRIMARY KEY ( "rezno" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_musteri_id1" ----------------------------
CREATE INDEX "index_musteri_id1" ON "public"."rezervasyon" USING btree( "musteri_id" );
-------------------------------------------------------------

CREATE INDEX "index_arabatur_id1" ---------------------------
CREATE INDEX "index_arabatur_id1" ON "public"."rezervasyon" USING btree( "arabatur_id" );
-------------------------------------------------------------

CREATE INDEX "index_konum_id3" ------------------------------
CREATE INDEX "index_konum_id3" ON "public"."rezervasyon" USING btree( "konum_id" );
-------------------------------------------------------------

CREATE INDEX "index_ucus_id" ------------------------------
CREATE INDEX "index_ucus_id" ON "public"."rezervasyon" USING btree( "ucus_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "rezervasyon" 
( "rezno", "rezalistarih", "rezteslimtarih","musteri_id","arabatur_id","konum_id","ucus_id" )
VALUES
('0001','2018', '2019','0001','0001','0001','0001');

INSERT INTO "rezervasyon" 
( "rezno", "rezalistarih", "rezteslimtarih","musteri_id","arabatur_id","konum_id","ucus_id" )
VALUES
('0002','2019', '2020','0002','0002','0002','0002');

BEGIN;

CREATE TABLE "arabatur" -------------------------------------
CREATE TABLE "public"."arabatur" ( 
	"arabaturno" INTEGER NOT NULL,
	"arabaturad" CHARACTER VARYING NOT NULL,
	"arabaturucret" INTEGER NOT NULL,
	PRIMARY KEY ( "arabaturno" ) );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "arabatur" 
( "arabaturno", "arabaturad", "arabaturucret" )
VALUES
('0001','kamyonet', '300000');

INSERT INTO "arabatur" 
( "arabaturno", "arabaturad", "arabaturucret" )
VALUES
('0002','sedan', '100000');

BEGIN;

CREATE TABLE "musteri" --------------------------------------
CREATE TABLE "public"."musteri" ( 
	"musterino" INTEGER NOT NULL,
	"musteriad" CHARACTER VARYING NOT NULL,
	"musterisoyad" CHARACTER VARYING NOT NULL,
	"ehliyetno" INTEGER NOT NULL,
	PRIMARY KEY ( "musterino" ) );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "musteri" 
( "musterino", "musteriad", "musterisoyad","ehliyetno" )
VALUES
('0001','ahmet', 'arı','123');

INSERT INTO "musteri" 
( "musterino", "musteriad", "musterisoyad","ehliyetno" )
VALUES
('0002','mehmet', 'arı','456');

BEGIN;

CREATE TABLE "rezekpmntur" ----------------------------------
CREATE TABLE "public"."rezekpmntur" ( 
	"rezervasyon_id" INTEGER NOT NULL,
	"ekpmntur_id" INTEGER NOT NULL,
	PRIMARY KEY ( "ekpmntur_id", "rezervasyon_id" ) );
 ;
-------------------------------------------------------------

CREATE INDEX "index_rezervasyon_id" -------------------------
CREATE INDEX "index_rezervasyon_id" ON "public"."rezekpmntur" USING btree( "rezervasyon_id" );
-------------------------------------------------------------

CREATE INDEX "index_ekpmntur_id1" ---------------------------
CREATE INDEX "index_ekpmntur_id1" ON "public"."rezekpmntur" USING btree( "ekpmntur_id" );
-------------------------------------------------------------

COMMIT;

INSERT INTO "rezekpmntur" 
( "rezervasyon_id", "ekpmntur_id" )
VALUES
('0001','0001');

INSERT INTO "rezekpmntur" 
( "rezervasyon_id", "ekpmntur_id" )
VALUES
('0002','0002');

BEGIN;

CREATE TABLE "ucus" -----------------------------------------
CREATE TABLE "public"."ucus" ( 
	"ucusno" INTEGER NOT NULL,
	"kalkisulke" CHARACTER VARYING NOT NULL,
	"varisulke" CHARACTER VARYING NOT NULL,
	"varistarih" CHARACTER VARYING NOT NULL,
	PRIMARY KEY ( "ucusno" ) );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "ucus" 
( "ucusno", "kalkisulke", "varisulke","varistarih" )
VALUES
('0001','amerika', 'turkey','2021');

INSERT INTO "ucus" 
( "ucusno", "kalkisulke", "varisulke","varistarih" )
VALUES
('0002','almanya', 'italya','2021');

BEGIN;

CREATE TABLE "toplamaraba" ----------------------------------
CREATE TABLE "public"."toplamaraba" ( 
	"sayi" INTEGER NOT NULL );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "toplamaraba" 
( "sayi")
VALUES
('2');

BEGIN;

CREATE TABLE "toplamekpmn" ----------------------------------
CREATE TABLE "public"."toplamekpmn" ( 
	"sayi" INTEGER NOT NULL );
 ;
-------------------------------------------------------------

COMMIT;

INSERT INTO "toplamekpmn" 
( "sayi")
VALUES
('2');

BEGIN;

CREATE LINK "lnk_arabalar_arabaekpmn" -----------------------
ALTER TABLE "public"."arabaekpmn"
	ADD CONSTRAINT "lnk_arabalar_arabaekpmn" FOREIGN KEY ( "arabalar_id" )
	REFERENCES "public"."arabalar" ( "arabano" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_ekipman_arabaekpmn" ------------------------
ALTER TABLE "public"."arabaekpmn"
	ADD CONSTRAINT "lnk_ekipman_arabaekpmn" FOREIGN KEY ( "ekipman_id" )
	REFERENCES "public"."ekipman" ( "ekipmanno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_arabatur_arabalar" -------------------------
ALTER TABLE "public"."arabalar"
	ADD CONSTRAINT "lnk_arabatur_arabalar" FOREIGN KEY ( "arabatur_id" )
	REFERENCES "public"."arabatur" ( "arabaturno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_konum_arabalar" ----------------------------
ALTER TABLE "public"."arabalar"
	ADD CONSTRAINT "lnk_konum_arabalar" FOREIGN KEY ( "konum_id" )
	REFERENCES "public"."konum" ( "konumno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_ekpmntur_ekipman" --------------------------
ALTER TABLE "public"."ekipman"
	ADD CONSTRAINT "lnk_ekpmntur_ekipman" FOREIGN KEY ( "ekpmntur_id" )
	REFERENCES "public"."ekpmntur" ( "ekpmnturno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_konum_ekipman" -----------------------------
ALTER TABLE "public"."ekipman"
	ADD CONSTRAINT "lnk_konum_ekipman" FOREIGN KEY ( "konum_id" )
	REFERENCES "public"."konum" ( "konumno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "fatura_kiralama" -------------------------------
ALTER TABLE "public"."kiralama"
	ADD CONSTRAINT "fatura_kiralama" FOREIGN KEY ( "kirano" )
	REFERENCES "public"."fatura" ( "faturano" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_arabalar_kiralama" -------------------------
ALTER TABLE "public"."kiralama"
	ADD CONSTRAINT "lnk_arabalar_kiralama" FOREIGN KEY ( "arabalar_id" )
	REFERENCES "public"."arabalar" ( "arabano" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_konum_kiralama" ----------------------------
ALTER TABLE "public"."kiralama"
	ADD CONSTRAINT "lnk_konum_kiralama" FOREIGN KEY ( "konum_id" )
	REFERENCES "public"."konum" ( "konumno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_musteri_kiralama" --------------------------
ALTER TABLE "public"."kiralama"
	ADD CONSTRAINT "lnk_musteri_kiralama" FOREIGN KEY ( "musteri_id" )
	REFERENCES "public"."musteri" ( "musterino" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_yakit_kiralama" ----------------------------
ALTER TABLE "public"."kiralama"
	ADD CONSTRAINT "lnk_yakit_kiralama" FOREIGN KEY ( "yakit_id" )
	REFERENCES "public"."yakit" ( "yakitno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_ekpmntur_rezekpmntur" ----------------------
ALTER TABLE "public"."rezekpmntur"
	ADD CONSTRAINT "lnk_ekpmntur_rezekpmntur" FOREIGN KEY ( "ekpmntur_id" )
	REFERENCES "public"."ekpmntur" ( "ekpmnturno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_rezervasyon_rezekpmntur" -------------------
ALTER TABLE "public"."rezekpmntur"
	ADD CONSTRAINT "lnk_rezervasyon_rezekpmntur" FOREIGN KEY ( "rezervasyon_id" )
	REFERENCES "public"."rezervasyon" ( "rezno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_arabatur_rezervasyon" ----------------------
ALTER TABLE "public"."rezervasyon"
	ADD CONSTRAINT "lnk_arabatur_rezervasyon" FOREIGN KEY ( "arabatur_id" )
	REFERENCES "public"."arabatur" ( "arabaturno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_konum_rezervasyon" -------------------------
ALTER TABLE "public"."rezervasyon"
	ADD CONSTRAINT "lnk_konum_rezervasyon" FOREIGN KEY ( "konum_id" )
	REFERENCES "public"."konum" ( "konumno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_musteri_rezervasyon" -----------------------
ALTER TABLE "public"."rezervasyon"
	ADD CONSTRAINT "lnk_musteri_rezervasyon" FOREIGN KEY ( "musteri_id" )
	REFERENCES "public"."musteri" ( "musterino" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;

BEGIN;

CREATE LINK "lnk_ucus_rezervasyon" --------------------------
ALTER TABLE "public"."rezervasyon"
	ADD CONSTRAINT "lnk_ucus_rezervasyon" FOREIGN KEY ( "ucus_id" )
	REFERENCES "public"."ucus" ( "ucusno" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_kiralama_sgrtkira" -------------------------
ALTER TABLE "public"."sgrtkira"
	ADD CONSTRAINT "lnk_kiralama_sgrtkira" FOREIGN KEY ( "kiralama_id" )
	REFERENCES "public"."kiralama" ( "kirano" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;
BEGIN;

CREATE LINK "lnk_sigorta_sgrtkira" --------------------------
ALTER TABLE "public"."sgrtkira"
	ADD CONSTRAINT "lnk_sigorta_sgrtkira" FOREIGN KEY ( "sigorta_id" )
	REFERENCES "public"."sigorta" ( "sigortano" ) MATCH FULL
	ON DELETE CASCADE
	ON UPDATE CASCADE;
-------------------------------------------------------------

COMMIT;



BEGIN;

CREATE FUNCTION "test()" ------------------------------------
CREATE OR REPLACE FUNCTION public.test()
 RETURNS TRIGGER
 LANGUAGE plpgsql
AS $function$
BEGIN
UPDATE toplamaraba SET sayi=sayi+1;
RETURN NEW;
END;
$function$;
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE TRIGGER "testtrig" -----------------------------------
CREATE TRIGGER testtrig AFTER INSERT ON "public"."arabalar" FOR EACH ROW EXECUTE FUNCTION test();
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE FUNCTION "test1()" -----------------------------------
CREATE OR REPLACE FUNCTION public.test1()
 RETURNS TRIGGER
 LANGUAGE plpgsql
AS $function$
BEGIN
UPDATE toplamaraba SET sayi=sayi-1;
RETURN NEW;
END;
$function$;
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE TRIGGER "testtrig1" ----------------------------------
CREATE TRIGGER testtrig1 AFTER DELETE ON "public"."arabalar" FOR EACH ROW EXECUTE FUNCTION test1();
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE FUNCTION "test2()" -----------------------------------
CREATE OR REPLACE FUNCTION public.test2()
 RETURNS TRIGGER
 LANGUAGE plpgsql
AS $function$
BEGIN
UPDATE toplamekpmn SET sayi=sayi+1;
RETURN NEW;
END;
$function$;
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE TRIGGER "testtrig2" ----------------------------------
CREATE TRIGGER testtrig2 AFTER INSERT ON "public"."ekipman" FOR EACH ROW EXECUTE FUNCTION test2();
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE FUNCTION "test3()" -----------------------------------
CREATE OR REPLACE FUNCTION public.test3()
 RETURNS TRIGGER
 LANGUAGE plpgsql
AS $function$
BEGIN
UPDATE toplamekpmn SET sayi=sayi-1;
RETURN NEW;
END;
$function$;
-----------------------------------------------------------

COMMIT;
BEGIN;

CREATE TRIGGER "testtrig3" ----------------------------------
CREATE TRIGGER testtrig3 AFTER DELETE ON "public"."ekipman" FOR EACH ROW EXECUTE FUNCTION test3();
-----------------------------------------------------------

COMMIT;

CREATE OR REPLACE FUNCTION insert_arabalar(arabanoo INTEGER, arabatur_idd INTEGER, kilometree INTEGER, konum_idd INTEGER, markaa CHARACTER VARYING, modell CHARACTER VARYING, plakaa CHARACTER VARYING, renkk CHARACTER VARYING, uretimyilii INTEGER)
 RETURNS TABLE(arabanosu INTEGER, arabaturidsi INTEGER, kilometresi INTEGER, konum_idsi INTEGER, markası CHARACTER VARYING, modeli CHARACTER VARYING, plakası CHARACTER VARYING, renki CHARACTER VARYING, uretimyilisı INTEGER)
 LANGUAGE plpgsql
AS $function$
BEGIN
INSERT INTO arabalar(arabano, arabatur_id, kilometre,konum_id,marka,model,plaka,renk,uretimyili) VALUES (arabanoo, arabatur_idd, kilometree,konum_idd,markaa,modell,plakaa,renkk,uretimyilii);  
    RETURN QUERY SELECT 
    arabano,
    arabatur_id,
    kilometre,
    konum_id,
    marka,
    model,
    plaka,
    renk,
    uretimyili
   FROM arabalar;        
END;
$function$;
CREATE OR REPLACE FUNCTION update_arabalar(arabanoo INTEGER, arabatur_idd INTEGER, kilometree INTEGER, konum_idd INTEGER, markaa CHARACTER VARYING, modell CHARACTER VARYING, plakaa CHARACTER VARYING, renkk CHARACTER VARYING, uretimyilii INTEGER)
 RETURNS TABLE(arabanosu INTEGER, arabaturidsi INTEGER, kilometresi INTEGER, konum_idsi INTEGER, markası CHARACTER VARYING, modeli CHARACTER VARYING, plakası CHARACTER VARYING, renki CHARACTER VARYING, uretimyilisı INTEGER)
 LANGUAGE plpgsql
AS $function$
BEGIN
UPDATE arabalar SET arabatur_id=arabatur_idd,kilometre=kilometree,konum_id=konum_idd,marka=markaa,model=modell,plaka=plakaa,renk=renkk,uretimyili=uretimyilii WHERE arabano=arabanoo;
    RETURN QUERY SELECT 
    arabano,
    arabatur_id,
    kilometre,
    konum_id,
    marka,
    model,
    plaka,
    renk,
    uretimyili
   FROM arabalar;        
END;
$function$;


CREATE OR REPLACE FUNCTION insert_ekipman(ekipmannoo INTEGER, ekpmnadd CHARACTER VARYING, ekpmntur_idd INTEGER, konum_idd INTEGER)
 RETURNS TABLE(ekipmannosu INTEGER, ekpmnadi CHARACTER VARYING, ekpmnturidsi INTEGER, konum_idsi INTEGER)
 LANGUAGE plpgsql
AS $function$
BEGIN
INSERT INTO ekipman(ekipmanno, ekpmnad, ekpmntur_id,konum_id) VALUES (ekipmannoo, ekpmnadd, ekpmntur_idd,konum_idd);  
    RETURN QUERY SELECT 
    ekipmanno,
    ekpmnad,
    ekpmntur_id,
    konum_id
   FROM ekipman;        
END;
$function$;

CREATE OR REPLACE FUNCTION update_ekipman(ekipmannoo INTEGER, ekpmnadd CHARACTER VARYING, ekpmntur_idd INTEGER, konum_idd INTEGER)
 RETURNS TABLE(ekipmannosu INTEGER, ekpmnadi CHARACTER VARYING, ekpmnturidsi INTEGER, konum_idsi INTEGER)
 LANGUAGE plpgsql
AS $function$
BEGIN
    UPDATE ekipman SET ekpmnad=ekpmnadd,ekpmntur_id=ekpmntur_idd,konum_id=konum_idd WHERE ekipmanno=ekipmannoo;
    RETURN QUERY SELECT 
    ekipmanno,
    ekpmnad,
    ekpmntur_id,
    konum_id
   FROM ekipman;        
END;
$function$;




