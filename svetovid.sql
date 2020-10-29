-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 29. okt 2020 ob 18.36
-- Različica strežnika: 10.1.31-MariaDB
-- Različica PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `svetovidprequel`
--

-- --------------------------------------------------------

--
-- Struktura tabele `icons`
--

CREATE TABLE `icons` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `icons`
--

INSERT INTO `icons` (`id`, `name`, `link`) VALUES
(1, 'Splosno', 'default.svg'),
(2, 'Adrenalin', 'adrenaline.svg'),
(3, 'Atrakcija', 'attraction.svg'),
(4, 'Plaza', 'beach.svg'),
(5, 'Most', 'bridge.svg'),
(6, 'Bar', 'caffee.svg'),
(7, 'Grad', 'castle.svg'),
(8, 'Jama', 'cave.svg'),
(9, 'Cerkev', 'church.svg'),
(10, 'Restavracija', 'food.svg'),
(11, 'Utrdba', 'fortification.svg'),
(12, 'Hrib', 'hill.svg'),
(13, 'Sladoled', 'icecream.svg'),
(14, 'Pomembna zgradba', 'important_building.svg'),
(15, 'Jezero', 'lake.svg'),
(16, 'Naravna Znamenitost', 'landscape.svg'),
(17, 'Spomenik', 'monument.svg'),
(18, 'Gora', 'mountain.svg'),
(19, 'Muzej', 'museum.svg'),
(20, 'Stara stavba', 'old_building.svg'),
(21, 'Park', 'park.svg'),
(22, 'Reka', 'river.svg'),
(23, 'Razvaline', 'ruins.svg'),
(24, 'Vojna', 'war.svg'),
(25, 'Slap', 'waterfall.svg'),
(26, 'Vodnjak', 'fountain.svg'),
(27, 'Gorska Koca', 'mountain_hut.svg'),
(28, 'Lokomotiva', 'train.svg'),
(29, 'Stolp', 'tower.svg'),
(30, 'Mestno jedro', 'city_center.svg'),
(31, 'Zoo', 'zoo.svg'),
(32, 'Razgledna točka', 'telescope.svg'),
(33, 'Konji', 'horse.svg');

-- --------------------------------------------------------

--
-- Struktura tabele `imgs`
--

CREATE TABLE `imgs` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `id_location` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `imgs`
--

INSERT INTO `imgs` (`id`, `name`, `link`, `id_location`) VALUES
(9, 'Lovrenški Stolp', 'https://i.imgur.com/vGsN3J2.jpg', 8),
(10, 'Pot med jezeri', 'https://i.imgur.com/LZouW5M.jpg', 8),
(11, 'Veliko Jezero', 'https://i.imgur.com/8g5LkI2.jpg', 8),
(12, 'Pogled s Stolpa', 'https://i.imgur.com/0lqfO3R.jpg', 8),
(13, 'Vlak', 'https://i.imgur.com/1en8Ozs.jpg', 9),
(14, 'Vlak spredaj', 'https://i.imgur.com/ZF6D1Qj.jpg', 9),
(15, 'Notranjost', 'https://i.imgur.com/zT7H828.jpg', 9),
(16, 'Stolp', 'https://i.imgur.com/D4khcrV.jpg', 10),
(17, 'Vrh', 'https://i.imgur.com/RORGwQQ.jpg', 10),
(18, 'Vznožje', 'https://i.imgur.com/cZevS9v.jpg', 10),
(19, 'Zgornja postaja', 'https://i.imgur.com/qRAV80x.jpg', 11),
(20, 'Sedežnica', 'https://i.imgur.com/u7uHQNC.jpg', 11),
(21, 'Poniji', 'https://i.imgur.com/RMjM99s.jpg', 12),
(22, 'Ranč', 'https://i.imgur.com/LNah74M.jpg', 12),
(29, 'Ostanki stebra', 'https://i.imgur.com/IovCP0q.jpg?1', 25),
(30, 'Zgodovinska slika', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Borovnica_viaduct_by_Varoni.jpg/1024px-Borovnica_viaduct_by_Varoni.jpg', 25),
(31, 'Gradnja', 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Borovnica_viaduct_construction-by_Johann_Bosch.jpg', 25),
(32, 'Lipicanec', 'https://www.lipica.org/en/imagelib/magnify/default/slike/fotografiranje-av-studio/lipicanec-pred-boxi.jpg', 20),
(33, 'Lipicanci', 'https://www.lipica.org/si/stable/imagelib/full/default/slike/fotografiranje-av-studio/lipicanci-v-ogradi-2.jpg', 20),
(34, 'Glavni hlev', 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Lipica.jpg', 20),
(36, 'Jezero', 'http://izvirna-vipavska.si/sites/izvirna-vipavska.si/files/styles/780px/public/_dsc0084_izvir_vipave_c.jpg?itok=9887q29I', 19),
(37, 'Izvir', 'https://www.vipavskadolina.si/files/12071/cache/c_prw/marijan-mocivnik-vipava-izvir-13045a156555c4f0e_c_prw.jpg', 19),
(39, 'Glavna dvorana', 'https://www.naravniparkislovenije.si/knjiznica/naravni-parki/regijski-park-skocjanske-jame/velike/skocjanske-jame.jpg', 23),
(40, 'Most', 'https://img.rtvslo.si/_up/upload/2015/12/25/65273842_sj16_fp-xl.jpg', 23),
(45, 'Most', 'https://www.notranjski-park.si/upload/filemanager/content-images/tinymce-galerija-94138012/rakov-skocjan-voda_800x600.jpg', 27),
(46, 'Most', 'https://www.notranjski-park.si/upload/filemanager/content-images/tinymce-galerija-94138012/rakov-skocjan-medvedova-pot_800x600.jpg', 27),
(47, 'Grad', 'https://www.postojnska-jama.eu/assets/Uploads/galleries/_resampled/FillWyIxMjgwIiwiNzIwIl0/PJ-2018-PG-galerija-1.jpg', 28),
(48, 'Notranjost', 'https://www.postojnska-jama.eu/assets/Uploads/galleries/_resampled/FillWyIxMjgwIiwiNzIwIl0/PJ-2018-PG-galerija-17.jpg', 28),
(49, 'Dogodek', 'https://www.postojnska-jama.eu/assets/Uploads/galleries/_resampled/FillWyIxMjgwIiwiNzIwIl0/PJ-2018-PG-galerija-4.jpg', 28),
(50, 'Vhod', 'https://www.postojnska-jama.eu/assets/Uploads/galleries/PJ-2018-Jama-pod-gradom-galerija-pop-1.jpg', 29),
(51, 'Večnameska lokomotiva', 'https://www.zelezniskimuzej.si/wp-content/uploads/sites/2/2018/05/0003__MG_7013-Z%E2%95%A0i%CC%82ICA.jpg', 30),
(52, 'Tovorna lokomotiva', 'https://www.zelezniskimuzej.si/wp-content/uploads/sites/2/2018/06/o_muzeju_g8.jpg', 30),
(54, 'Spodnji slap', 'https://kranjska-gora.si/wp-content/uploads/2020/08/severina.shyamarani.moona-Instagram-3304-ig-17880137686744229.jpg', 31),
(55, 'Zgornji slap', 'https://kranjska-gora.si/wp-content/uploads/2020/08/lanlakota-Instagram-3304-ig-17883996622667731.jpg', 31),
(56, 'Dom', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsiol.net%2Fmedia%2Fimg%2F69%2F56%2Fffce5c839497feb9a151-dom-v-tamarju.jpeg&f=1&nofb=1', 33),
(57, 'Grad', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Castello_di_Miramare_-_panoramio.jpg/1280px-Castello_di_Miramare_-_panoramio.jpg', 34),
(58, 'Vrtovi', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Parco_di_miramare_garden.JPG/1920px-Parco_di_miramare_garden.JPG', 34),
(63, 'Koča', 'https://1.bp.blogspot.com/-SygAcgpdbtU/XuhXiT2H9XI/AAAAAAAAAts/ERWYqm3do1cU2T4CaMnO-D-amajRASivgCLcBGAsYHQ/s1600/alja%25C5%25BEev%2Bdom%2B1.jpg', 35),
(64, 'Koča od daleč', 'https://www.hribi.net/slike1/Vrata%20243497250.jpg', 35),
(65, 'Rinka', 'https://www.hribi.net/slike1/Vrata%20315497250.jpg', 35),
(66, 'Plezalna stena', 'https://www.hribi.net/slike1/Vrata%20240497250.jpg', 35),
(67, 'Koča', 'https://s-ec.bstatic.com/images/hotel/max1024x768/739/73998234.jpg', 36),
(68, 'Vrh', 'https://www.hribi.net/slike1/P614089151408.jpg', 37),
(69, 'Kasarna na Možicu', 'https://www.hribi.net/slike1/P614077751408.jpg', 37),
(71, 'Ovce', 'https://www.hribi.net/slike1/P6140918668304.jpg', 37),
(72, 'Slap', 'https://www.thinkslovenia.com/upload/sights_and_attractions/lakes_bled_bohinj/slapsavica_1.jpg', 38),
(73, 'Koča pri Savici', 'https://www.pzs.si/javno/postojanke/koca_pri_savici-foto_jost_gantar%20(1).jpg', 38),
(74, 'Jezero s cerkvijo', 'https://www.lepote-slovenije.si/wp-content/gallery/bohinjsko-jezero/petra-nastran-bohinjsko-jezero3.jpg', 39),
(75, 'Zlatorog', 'https://static.primorske.si/foto/highres/zanimivosti/706956_175-bohinj.jpg', 39),
(76, 'Zimska', 'https://upload.wikimedia.org/wikipedia/commons/6/61/Bohinjsko_jezero_s_pe%C4%8Di.jpg', 39),
(77, 'Ajdovska deklica', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.hx52SotFAu9Wjrsvte0_FAHaFj%26pid%3DApi&f=1', 40),
(80, 'Izvir izvir', 'https://alpicenter.cz/images/kratke_prochazky/izvir_soce/07_Alpicenter_izvir_soce_hike_slovenia.JPG', 41),
(81, 'Pot do izvira', 'https://siol.net/media/img/da/81/f3c9ea697dec9381308e-izvir-soce.jpeg', 41),
(82, 'Koča pri izviru Soče', 'https://www.pzs.si/javno/galerija/000883/koca-pri-izviru-soce-foto-janko-rabic.jpg', 41),
(83, 'Slap', 'https://www.soca-valley.com/img/2017122712510699/mid/Slap_kozjak_foto_tomo_jesenicnik_SPIRIT.jpg?m=1587632233', 42),
(84, 'Muzej', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.77Uhffq06UDN1KpqT15zBgHaFj%26pid%3DApi&f=1', 43),
(85, 'Vstop', 'https://www.kobariski-muzej.si/img/2019011111173769/mid/5_do__ivetja_4.jpg', 43),
(86, 'Vhod', 'https://upload.wikimedia.org/wikipedia/commons/6/64/JamaPekel.JPG', 44),
(88, 'Nekropola', 'https://uploads.zkst-zalec.si/upload/directoryentry/7/images/p9131047.jpg?preset=content', 45),
(89, 'Sankališče', 'https://www.rogla.eu/si/imagelib/product-listing/zrece_rogla/Aktivnosti/rogla/poleti/zlodejevo_poletje_rogla4.jpg', 46),
(91, 'Pot', 'https://www.avtokampi.si/slika/pot-med-krosnjami-pohorje-1.jpg', 47),
(92, 'Lokomotiva', 'https://izola.si/wp-content/uploads/2015/08/P7250160.jpg', 48),
(93, 'Lokomotiva', 'https://upload.wikimedia.org/wikipedia/commons/c/c3/U37_parenzana_koper.jpg', 49),
(95, 'S parkirišča', 'https://upload.wikimedia.org/wikipedia/sl/thumb/0/0a/KostnicaKobarid_%282%29.jpg/800px-KostnicaKobarid_%282%29.jpg', 50),
(96, 'Areal view', 'https://www.kobariski-muzej.si/img/2018041609142974/min/Italijanska_kostnica_Kobarid.jpg', 50),
(97, 'Muzej', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Koper_%2830%29_%283957507831%29.jpg/1024px-Koper_%2830%29_%283957507831%29.jpg', 51),
(98, 'Lapidarij', 'https://kraji.eu/PICTURES/obalno_notranjska/obala/koper/staro_mestno_jedro/kidriceva_ulica/palaca_belgramoni_tacco/pokrajinski_muzej_koper_lapidarij/IMG_2843_koper_pokrajinski_muzej_koper_lapidarij.jpg', 51),
(99, 'Vlakec', 'http://www.podzemljepece.com/UserFiles/Image/podzemlje2/ogled-z-vlakom/vlak.jpg', 52),
(100, 'Hodnik', 'https://www.geopark-karawanken.at/files/rudnik_z_vlakom.jpg', 52),
(101, 'Vlak od daleč', 'https://www.sv-andraz.si/Files/Gallery/88/157/1086_1_peca.jpg', 52),
(102, 'Most', 'https://upload.wikimedia.org/wikipedia/sl/thumb/4/4b/Napoleonov-Nadi%C5%BEa.jpg/800px-Napoleonov-Nadi%C5%BEa.jpg', 53),
(103, 'Most', 'http://www.travel-slovenia.si/slo/wp-content/uploads/2014/06/travel-slovenia-napoleonov-most-pri-kobaridu.jpg', 54),
(104, 'Slap', 'https://s3.mojalbum.com/9578733_17851269_21803689/planina-ravna-27-6-2014/velicasten-slap-boka.jpg', 55),
(105, 'Gondola', 'https://www.soca-valley.com/img/2017060510421648/mid/Bobo__arhiv_RTVSLO_-_Kanin_poleti.jpg', 56),
(106, 'Ferrata', 'https://bentral.s3.amazonaws.com/web/3254554e/gallery/787a634d/poletja-kanin_3.jpg', 56),
(107, 'Razgled', 'https://www.soca-valley.com/img/2016070415443402/mid/Danijel___agar_-_razgled_s_Kanina__Medium_.jpg?m=', 56),
(108, 'Koča', 'https://i.imgur.com/Cb8aypq.jpg', 57),
(109, 'Vrh', 'https://i.imgur.com/BvrQBfB.jpg', 57),
(110, 'Razgled', 'https://i.imgur.com/YMwNXHI.jpg', 57),
(111, 'Obzidje', 'https://i.imgur.com/p2fiVTE.jpg?1', 13),
(112, 'Vhod', 'https://i.imgur.com/5TSlHrP.jpg?1', 13),
(115, 'Obrambni stolp', 'https://i.imgur.com/Sjt5Fze.jpg?1', 22),
(116, 'Vzpon', 'https://i.imgur.com/2w2H99r.jpg?1', 22),
(117, 'Muzej', 'https://i.imgur.com/xJmyqwW.jpg?1', 26),
(118, 'Tank', 'https://i.imgur.com/JZQGP9M.jpg?1', 26),
(119, 'Nemški Vojaški Vlak', 'https://i.imgur.com/Q5JPLCb.jpg?1', 26),
(120, 'VR simulator MIG', 'https://i.imgur.com/w1hH3Dv.jpg?1', 26),
(121, 'Stolp', 'https://i.imgur.com/ouHRpbQ.jpg?1', 21),
(122, 'Bolnica', 'https://www.lepote-slovenije.si/wp-content/uploads/2018/07/bolnica-franja-750x445.jpg', 58),
(123, 'Vzpon', 'https://i.ytimg.com/vi/hOUbZCU2yWw/maxresdefault.jpg', 58),
(124, 'Barake', 'https://www.silvaprodukt.si/data/image/reference/56_349_big.jpg', 58),
(125, 'Predori', 'http://www.o-4os.ce.edus.si/gradiva/geo/geomorfologija/foto_geomorf/kanjon_dovzanova.jpg', 59),
(126, 'Bencetova pot', 'https://www.visit-trzic.com/pic/product/l/ucna-pot-dovzanova-soteska.1.jpg', 59),
(127, 'Jeklenice', 'https://adeleinslovenia.files.wordpress.com/2020/06/20200623_165017.jpg?w=640&h=480', 59),
(128, 'Jama', 'http://snezna-jama.com/res/images/galerija/image_2.JPG', 60),
(129, 'Notranjost', 'http://snezna-jama.com/res/images/galerija/image_34.JPG', 60),
(130, 'Vhod', 'http://snezna-jama.com/res/images/galerija/image_6.JPG', 60);

-- --------------------------------------------------------

--
-- Struktura tabele `locations`
--

CREATE TABLE `locations` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc_s` varchar(100) NOT NULL,
  `desc_l` text NOT NULL,
  `rating` int(2) NOT NULL,
  `tts` int(4) NOT NULL COMMENT 'time to spend',
  `coord` varchar(50) NOT NULL,
  `mtld` int(2) NOT NULL COMMENT 'Max To Location Difficulty',
  `contact` varchar(100) NOT NULL,
  `timetable` text NOT NULL,
  `fee` int(1) NOT NULL COMMENT 'no, yes, depends',
  `child` int(1) NOT NULL COMMENT 'no, yes, depends',
  `season` int(1) NOT NULL COMMENT 'no, yes',
  `icon` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `locations`
--

INSERT INTO `locations` (`id`, `name`, `desc_s`, `desc_l`, `rating`, `tts`, `coord`, `mtld`, `contact`, `timetable`, `fee`, `child`, `season`, `icon`) VALUES
(8, 'Lovrenška jezera', 'Močvirna jezera na Pohorju', '\"Lovrenška jezera se nahajajo na visokem barju sredi Pohorja med Roglo in Ribniškim Pohorjem. Manjša jezerca, ki dobivajo vodo le s padavinami obdaja rušje. Jezerca si lahko ogledamo po z lesom tlakovani stezici, ki nam omogoča, da hodimo po suhem in ne po močvirju. Hoja po močvirju pa je prepovedana. Na začetku barja pa je razgledni stolp, ki nam omogoča pogled po Lovrenških jezerih.\" - Hribi.net', 4, 200, '46.483348,15.315785', 1, '/', '/', 0, 2, 1, 15),
(9, 'Lokomitiva Slovenske Konjice', 'Lokomitiva stare ozkotirne železnice', '\"Železniška proga Poljčane - Slovenske Konjice - Zreče je bila ozkotirna železniška proga (širine 760 mm) med Poljčanami in Slovenskimi Konjicami, ki je obratovala med letoma 1892 in 1962, do Zreč pa je bila podaljšana leta 1921. \" - Wikipedia', 0, 10, '46.341064,15.424041', 0, '/', '/', 0, 2, 0, 28),
(10, 'Razgledni Stolp Rogla', 'Razgledni stolp in najvišja točka Rogle', 'Razgledni stolp na Rogli je najvišja točka na Rogli. Nahaja se v gozdu, blizu glavne ceste. Višine je 30 metrov, v treh nadstropjih.', 4, 30, '46.456498,15.345899', 1, '/', '/', 0, 2, 1, 29),
(11, 'Panoramska sedežnica Planja', 'Panoramska sedežnica na Rogli', 'Sedežnica Povezuje vrh turističnega naselja Rogla s spodnjim delom smučišča in akumulacijskega jezera Mašinžaga. Je idealna kot dopolnitev sprehoda Rogla-Pesek-Mašinžaga-Rogla, kjer se zadnji del odpeljete s sedežnico med krošnjami nazaj na vrh Rogle.\r\n\r\nCena vožnje znaša 4€ v eno smer.', 2, 20, '46.453601,15.332136', 0, 'https://www.rogla.eu/si/nacrtujte-obisk/dogodki/2019/07/06/1104-Panoramska-sedeznica-Planja', 'Obratuje za vikende od junija do septembra', 2, 2, 1, 3),
(12, 'Ranč na Pesku', 'Jahanje konjev/ponijev', 'Na pesku je možna izposoja konjev/ponijev za jahanje v ogradi. Po dogovoru organizirajo tudi ture po okoliških destinacijah.\r\n\r\n', 1, 40, '46.466567,15.343329', 0, '+386 (0)3 757 71 00', 'Med poletjem. Urniki se znajo spreminjati glede na ponudbo Turističnega centra Rogla.', 2, 2, 1, 33),
(13, 'Obzidje s Cerkevijo Sv. Trojice', 'Cerkev z obzidjem iz 15 stoletja', 'Cerkev z obzidjem iz 15. stoletja, z znano fresko Mrtvaškega plesa.\r\n\r\nCena vstopa v cerkev, kjer se nahaja mrtvaški ples, znaša 3€.\r\n\r\nUrnik ni jasen. Svetuje se poklicati pred izletom.', 1, 20, '45.509723,13.901786', 0, '00386 31 432 231, 00386 5 658 00 50, milan.stepan@rkc.si', '9:00 in 12:00 ter 13:00 in 17:00.', 2, 2, 0, 11),
(14, 'Krkavški kamen', 'Megalit v ob cesti v Krkavčah', 'Kamen je lokalna znamenitost istrske vasi Krkavče. Obiskujejo ga tudi turisti. Ker nekateri radiestezisti menijo, da so ob kamnu dobre energije, ga ljudje obiskujejo tudi iz tega razloga. Rodnoverci Krkavčanski kamen razumejo kot eno od svetih točk stare vere.', 0, 15, '45.468126, 13.708025', 0, '/', '/', 0, 2, 1, 23),
(15, 'Škocjanski Zatok', 'Naravni rezervat, laguna, zatok', 'Naravni rezervat, krožna pot okoli zatoka, ogromno živali, razgledni stolp.', 3, 30, '45.550351, 13.760483', 1, 'www.skocjanski-zatok.org, 05 626 03 70, info@skocjanski-zatok.org', 'Poleti: 6-21, pozimi manj', 0, 2, 1, 15),
(16, 'Grad Socerb', 'Grad na kraškem zidu', 'Pogled na Trst, grad je restavracija, jama v bližini, lep sprehod.', 2, 25, '45.589782, 13.860858', 0, '/', 'Odvisno od gostilne', 1, 2, 1, 7),
(17, 'Sveta jama pri Socerbu', 'Kraška jama s cerkvijo', '\"Sveta jama je kraška jama, ki se nahaja nedaleč od gradu Socerb nad istoimenskim naseljem. Globoka je 44 m in dolga 231 m.[1] V vhodni dvorani se nahaja edina podzemna cerkev v Sloveniji.\" - wiki\r\n\r\nVhod do jame je propsto dostopen, od koder je možen pogled v notranjost. Občasno so vidni tudi netopirji.', 2, 15, '45.589764,13.864736', 0, '00386 41 693 014 ', 'Po dogovoru.', 1, 2, 1, 8),
(18, 'Grad Črni Kal', 'Grad na Črnem Kalu z lepim razgledom', 'Oporišče iz Turških časov, z razgledom na slovensko obalo. Sam grad je zgrajen na skali, dostopni preko mostu.\r\n\r\nDostop do utrdbe je možen po krajši strmi poti.', 3, 20, '45.551627, 13.881531', 1, 'kraji.eu/slovenija/crni_kal_grad/eng', '/', 0, 2, 1, 11),
(19, 'Izvir reke Vipave', 'Izvir reke Vipave, pod skalo', 'Izvir se nahaja v senci, voda priteka izpod skale, voda je pitna. Poleg je restavracija.', 2, 20, '45.845441, 13.963805', 0, 'izvirna-vipavska.si/sl/izviri-reke-vipave', '/', 0, 2, 1, 16),
(20, 'Kobilarna Lipica', 'Širši kompleks s hlevi, dvoranami, muzeji', 'V kobilarni je možno preživeti precej časa. Vodeni ogled traja cca 50 minut, nato pa se lahko obiskovalci prosto prehajajo in imajo dostop do hlevov in ostalih kompleksov.\r\n\r\nVstopnina je 16-22 za odrasle (odvisno od dogodka)', 4, 200, '45.667805,13.882804', 0, 'www.lipica.org, 003865 739 1696, info@lipica.org', '9:00-16 (zimski urnik)', 2, 2, 1, 33),
(21, 'Obrambni stolp Podpeč', 'Obrambni stolp na razgledni točni kraškega roba', 'Razgledni stolp, potrebno nekaj minut hoje po klancu navzgor. Pod stolpom leži utrjena jama. Ogled notranjosti stolpa, in zavetišča pod stolpom, je po predhodni najavi.', 1, 20, '45.522625, 13.908517', 1, '00386 (0)5 659 02 50, ksck@siol.net', 'Ogled jame in notranjost stolpa po dogovoru.', 1, 2, 1, 11),
(22, 'Kubed - Tabor', 'Ostanki starega tabora iz časov Turških vpadov', 'Kubejski grad je skupek ostankov obzidanega tabora na vrhu skale v Kubedu. Trenutno so ostanki obzidja še vidni, poleg stolpa in cerkve.', 0, 15, '45.520901,13.871090', 1, '/', '/', 1, 2, 1, 11),
(23, 'Park Škocjanske jame', 'Park Škocjanske jame ponuja nekaj poti skozi jame,', 'Park Škocjanke jame ponuja urejene poti skozi jame in poljame, po katerih teče reka Reka. V jami je naseljena kolonija netopirjev.\r\n\r\nCena: 16-24€ (odrasli)', 4, 150, '45.663209,13.989395', 1, 'www.park-skocjanske-jame.si, 00386 5 7082 110, psj.info@psj.gov.si', '10-17', 2, 2, 0, 8),
(24, 'Koča na Kokoški', 'Koča na izletni točki na Kokoški', 'Kokoška je popularna izletna točka na obali. Pot je kratka, le 30 minut hoje, večji del je v senci gozda, po \"mulatjeri\". Manjši vzpon, primeren za vse generacije.\r\n\r\nNa vrhu stoji koča z domačo kuhinjo.', 4, 90, '45.644618,13.899877', 0, '/', 'Vikendi', 0, 2, 1, 27),
(25, 'Ostanki viadukta Borovnica', 'Zadnji stoječi steber železniškega viadukta čez do', '\"Borovniški viadukt je bil nekdanji železniški viadukt, ki se je od leta 1856 razprostiral nad borovniško dolino na progi Dunaj - Ljubljana - Trst. Že v času gradnje in še nekaj desetletij kasneje je veljal za največji zidani most v Evropi. Dolg je bil 561 metrov in visok 38 metrov. Dela na objektu, ki ga je načrtoval Carl von Ghega, so se pričela leta 1850, dokončana pa avgusta 1856, ko je prvi vlak poskusno zapeljal čezenj. Zidan je bil v dveh nadstropjih; prvo je sestavljalo 22 obokov, drugo, zgornje pa 25 obokov. Objekt je slonel na 24 stebrih iz klesanega kamna, ki so stali na lesenih pilotih, zabitih v ilovnata barjanska tla. Oboki so bili narejeni iz opeke. Borovniški viadukt je dokončal Giacomo Ceconi, ki je bil na čelu delavcev iz svoje rodne vasi (blizu mesta Pielungo, današnja severna Italija). Zgradil je tudi bohinjski predor in predor Arlberg. Pri gradnji je bilo porabljenih milijon kubičnih čevljev lomljenega kamna, pet milijonov opek in milijon kubičnih čevljev kvadrov. \" - wiki', 2, 10, '45.919260,14.364662', 0, '/', '/', 0, 2, 1, 23),
(26, 'Park Vojaške Zgodovine', 'Največji vojaški muzej v Sloveniji', '\"Park vojaške zgodovine je danes največji muzejski kompleks v Republiki Sloveniji in postaja tudi eden najbolj obiskanih slovenskih muzejev, ki ga je v letu 2019 obiskalo že preko 58.650 obiskovalcev.\r\n\r\nZbirko Parka tako odlikujejo predvsem zelo veliki eksponati, kot so različna vojaška vozila, zlasti tanki in druga oklepna vozila, letala, podmornica in nazadnje še vojaška lokomotiva iz druge svetovne vojne. Ekipa Parka, kljub temu, da le-ta še ni umeščen v nacionalno muzejsko mrežo in se v veliki meri preživlja sam na trgu, aktivno raziskuje in veliko objavlja, predvsem pa skrbi za predstavljanje nacionalne vojaško-zgodovinske dediščine s postavljanjem muzejskih razstav. Kot se za sodobno muzejsko središče spodobi je v Parku urejena tudi bogato založena muzejska trgovina in pa muzejska restavracija Kantina. Park upravlja tudi s kompleksom pohodnih poti in pa podzemno utrdbo na Primožu. Utrdba iz obdobja Rapalske meje predstavlja z več kot 500 m podzemnih rovov in drugo turistično infrastrukturo pomembno turistično atrakcijo.\" - PVZ\r\n\r\nCena: Odrasli 12€. Simulator MiG 21 10€. Podmornica 5€', 3, 200, '45.667892,14.188704', 0, '+386 (0)31 775 002, info@parkvojaskezgodovine.si', 'JULIJ, AVGUST \r\nvsak dan: 9.00-18.00\r\n\r\nSEPTEMBER\r\nponedeljek-petek: 9.30-17.00\r\nsobota, nedelja: 9.30-18.00\r\n\r\nMAJ, JUNIJ, OKTOBER\r\nponedeljek-petek: 10.00-16.00\r\nsobota, nedelja, prazniki: 9.30-18.00\r\n\r\nMAREC, APRIL\r\nponedeljek-petek: 11.00-15.00\r\nsobota, nedelja, prazniki: 10.00-16.00\r\n\r\nJANUAR, FEBRUAR, NOVEMBER, DECEMBER\r\nponedeljek-petek: 10.00-15.00\r\nsobota, nedelja, prazniki, šolske počitnice: 10.00-16.00\r\n\r\nZAPRTO: 25. december in 1. januar.', 2, 2, 0, 24),
(27, 'Rakov Škocjan', 'Rakov Škocjan je kraška dolina z 42 m visokim Mali', '\"Rakov Škocjan je kraška dolina ob severnem vznožju Javornikov, nastala z udiranjem in rušenjem stropa kraške jame. To dokazujeta 42 m visoki Mali naravni most, 37 m visoki Veliki naravni most ter soteski za njima.\r\n\r\nPo dnu ravnega ilovnatega dna vijuga potok Rak, obdan z lazi in poplavnimi travniki. Rak polnijo vode, ki se skozi podzemlje stekajo s Cerkniškega polja in izpod Javornikov. Rečica priteče na površje iz Zelških jam na vzhodni strani doline, ponikne pa v Tkalca jami na zahodnem delu.\r\n\r\nSkupaj s Cerkniškim jezerom in Križno jamo je Rakov Škocjan razglašen za mednarodno pomembno mokrišče - Ramsarsko območje. Dolina je tudi prvi slovenski krajinski park, ustanovljen že leta 1949. Po dolini je, kot se za tako naravno znamenitost spodobi, speljana tudi naravoslovna učna pot.\" - Notranjski park', 4, 60, '45.790377, 14.300937', 1, '/', '/', 0, 2, 1, 16),
(28, 'Predjamski Grad', 'Predjamski Grad je največji jamski grad na svetu.', 'Le nekaj kilometrov od Postojnske jame kraški svet ponuja nepozabno doživetje v pravljičnem svetu vitezov. V 123 m visoki navpični steni je vklesan že več kot 800 let star neosvojljiv srednjeveški čudež. Za največjim jamskim gradom na svetu je preplet skrivnih rovov, od koder je na roparske pohode odhajal vitez Erazem Predjamski. V Jami pod gradom, pa so svoje domovanje našli netopirji. ', 4, 60, '45.815829,14.126996', 0, '(05) 700 01 00, info@postojnska-jama.eu', '9 - 17', 2, 2, 0, 7),
(29, 'Jama pod Predjamskim gradom', 'Jama pod Predjamskim gradom je druga najdaljša slo', '\"Jama pod Predjamskim gradom je druga najdaljša slovenska turistična jama, ki se razširja v štirih nadstropjih - ta so, razen vrhnje Erazmove luknje z Erazmovim rovom, vsa povezana med seboj. Dolžina vseh do sedaj odkritih delov jame obsega 14 kilometrov. Turistični odsek meri 700 metrov in vključuje Konjski hlev, Glavni rov, Imenski rov, Veliko dvorano in Fiženco, kjer je izhod na površje.\r\n\r\nArheološke najdbe v votlini za Predjamskim gradom pričajo, da je človek tu živel že v kameni dobi, v vhodnem rovu jame, imenovanem Konjski hlev, so našli ostanke iz rimskih časov, v Imenskem rovu pa so na ogled podpisi iz 16. stoletja.\" - postonjska-jama.eu', 3, 40, '45.815520,14.126537', 1, '(05) 700 01 00, info@postojnska-jama.eu', 'Julij, Avgust, September\r\n11:00\r\n16:00\r\n\r\nPreveri preden greš', 2, 2, 0, 8),
(30, 'Železniški Muzej', 'Največji muzej vlakov v Sloveniji', '\"Muzej je osredotočen na slovensko železniško zgodovino, tako materialno kot nematerialno. V zbirki je šestdeset historičnih lokomotiv in več kot 50 drugih vozil. Poleg tega je v depojih muzeja shranjenih še kakšnih pet tisoč historičnih železniških artefaktov.\r\n\r\nV osrednjem objektu, rotundi, je na ogled del zbirke parnih lokomotiv in drugih muzejskih vozil. Stalna razstava drugih ključnih strok, potrebnih, da železnica lahko deluje, je v bližnjem pomožnem objektu rotunde.\r\n\r\nNa ogled so na primer mala tirna vozila (drezine), ki so nekoč služile nadzornikom proge in vzdrževalcem, pa tudi vse vrste orodij in komunikacijskih naprav, kot so telegrafi, telefoni, teleprinterji in radijske postaje.\" - železniškimuzej.si\r\n\r\nVstopnina 8€ (odrasli)', 4, 60, '46.062571,14.502245', 0, '+386 1 291 26 41, muzej.sz@slo-zeleznice.si', 'Vsak dan razen ponedeljek:\r\n10:00 do 18:00', 2, 2, 0, 28),
(31, 'Slap Peričnik', 'Dvonadstropni slap v Mojstrani', '\"Peričnik sodi med najbolj znane slapove v Sloveniji. Govorimo lahko o dveh slapovih: 16 m visokem zgornjem Peričniku in 52 m visokem spodnjem Peričniku. Kadar govorimo o slapu Peričnik, imamo v mislih mogočen izrazit curek vode spodnjega slapa, ki buči preko 52 m visoke stene. Če se izpod slapa podamo na nasprotni breg Bistrice ter nekaj deset metrov navzgor po melišču, lahko občudujemo slikovito podobo obeh slapov. Kot dva mogočna stražarja čuvata ledeniško dolino Vrata. \" -wiki\r\n\r\nDo spodnjega slapa je od Kope pri Peričniku 10 minut, do zgornjega pa še nekaj minut več (oba sta vredna). Pri koči je potrebno plačati parkirnino, če pa parkirate malo dlje, se lahko parkirnini izognete. Če se izognete parkirnini, dejte vsaj spiti pivo ali dve v koči.\r\n\r\nMožno je stopiti za slap. Padec je kar hud, vendar je pot širša kot zgleda od daleč.', 4, 30, '46.439116,13.893755', 1, '/', '/', 0, 2, 1, 25),
(32, 'Slap Nadiža', 'Izvir Save Dolinke', 'Slap je izvir Save Dolinke. Pot do slapa ni zahtevna, je pa strma. Edini zavarovani del je do točke izvira slapa, do katere so napeljane zaile, vendar dostop ni zahteven.\r\n\r\nDostop do slapa je 20 minut od Doma v Tamarju. Do doma pa je 60 minut od parkirišča iz Planice.', 3, 40, '46.448780,13.707395', 2, '/', '/', 0, 2, 1, 25),
(33, 'Planinski dom Tamar', 'Planinska koča na koncu doline Tamar', '\"Dom je stalno odprt. V dveh gostinskih prostorih je 67 sedežev, točilni pult; pod napuščem pred domom je 20, zunaj doma pa 30 sedežev; v 12 sobah je 31 postelj, na dveh skupnih ležiščih pa 20 ležišč; WC, umivalnica in prha s toplo in mrzlo vodo; gostinske in spalne prostore ogrevajo s pečmi; tekoča voda, elektrika, telefon. \" - PZS\r\n\r\nDo doma je cca 1h iz Planice. Razgled je edinstven. Borovničev zavitek enkraten.', 0, 200, '46.446161,13.713481', 1, 'bernikmartina@gmail.com, +386 41 378 077', 'Celo leto', 0, 2, 1, 27),
(34, 'Miramar', 'Grad in vrtovi Mirama', 'Miramar - po špansko \"Pogled na morje\", je grad nad Trstom, z idiličnim grajskim parkom.\r\n\r\nGrad je dal zgraditi nadvojvoda Ferdinand Maksimilian I. Habsburško-Lotarinški (1832-1867), mlajši brat cesarja Franca Jožefa.\r\n\r\nVstopnina gradu je cca 6€, zastonj je prvo nedeljo vmesecu. Dostp do vrtov je zastonj, s tem da je parkirnina lahko plačljiva.', 4, 60, '45.702695,13.712629', 0, '/', 'Grad: 9.00-19.00\r\nVrtovi: do zaprtja vhodnih vrat, uro po zaprtju gradu.', 1, 2, 1, 7),
(35, 'Aljažev dom v Vratih', 'Koča s pogledom na severno steno Triglava', 'Koča je primerna za pivo, kosilo ali sladico. Ponuja fantastičen razgled na severno triglavsko steno.\r\n\r\nDostopna je po cesti (na enem mesti ima cesta 22% klanec!) skoraj do koče.', 4, 60, '46.409142,13.843321', 0, '+386 51 665 738, pd.dovje-mojstrana@siol.net', 'April do september', 0, 2, 1, 27),
(36, 'Litostrojska koča', 'Koča na Soriški planini', 'Koča leži ob vznožju smučišča Sorišče planine. Ob poletnih dneh primerna za postanek s palačinkami, lai kot malica in izhodišče za obisk okoliških planin.\r\n\r\nParkirišče je ob cesti, od katere vodi mulatiera do koče.', 0, 30, '46.239890,14.007749', 1, '041 879 267', 'Čez dan, preveri prej.', 0, 2, 0, 27),
(37, 'Možic', 'Vrh z bunkerjem', '\"Možic je 1602 m visok vrh, ki se nahaja zahodno od Soriške planine. Ravno na najvišji točki vrha se nahaja star vojaški bunker na katerem je napisano ime vrha z višino. Z vrha, ki ima tudi vpisno skrinjico in žig, se nam odpre lep pogled na verigo Spodnjih Bohinjskih gora, Triglavu, delu Karavank, Ratitovcu in Poreznu.\" - hribi.net\r\n\r\nOd koče do vrha, mimo kasarne, je cca 1h in 15min. Pot ni zahtevna, po gozdu in mulatjerah. Vrh Možica je bunkerka kupola, do katere je možno pristopiti skozi bunkerje. Okoliški vrhovi so polni bunkerjev. Vredno vzeti s seboj svetilko.', 4, 180, '46.241645,13.994998', 2, '/', '/', 0, 2, 1, 24),
(38, 'Slap Savica', 'Najbolj znan slap v Sloveniji', 'Slap Savica je najbolj znan slap, v osrčju Triglavskega narodnega parka. Do slapa vodi 20 minut stopnic ob reki in po gozdu.\r\n\r\nŠtartna točka, koča pri Savici, je izhodiščna točka za pohode na Triglav.\r\n\r\nParking je plačljiv in drag, je pa pozimi in zvečer zastonj (ko je tudi obisk manjši zaradi očitnih razlogov).', 4, 60, '46.292762,13.796799', 1, '/', 'Po 19 uri je zastonj.', 2, 2, 1, 25),
(39, 'Bohinjsko jezero', 'Največje ledeniško jezero v Sloveniji', 'Bohinjsko jezereo je največje ledeniško jezero v Sloveniji. Leži v osrčju Triglavskega narodnega parka, obdano pa je z najlepšimi gorami.\r\n\r\nDo jezera lahko dostopimo z avtom, ter parkiramo na parkirišču mercatorja (z doplačilom).\r\n\r\nHranjenje rib je strogo prepovedano, čeprav so nore na smokije in sir.', 4, 60, '46.283316,13.866333', 0, '/', '/', 0, 2, 1, 15),
(40, 'Ajdovska deklica', 'Obraz v steni gore', 'Ajdovska deklica je obraz v severni steni Prisojnika. Lepo je vidna iz opisane razgledne točke.\r\n\r\nZa Ajdovsko deklico stoji pripovedka, o kateri si je možno prebrati v sekciji Pripovedke.', 4, 15, '46.439324,13.756459', 0, '/', '/', 0, 2, 0, 32),
(41, 'Izvir Soče', 'Izvir reke Soče', 'Pot do izvira soče je relativno enostavna, po gozdu. Na zadnjem delu je možno splezati tik do skale, izpod katere izvira Soča, vendar je do tam potrebno plezati po klinih, ampak ni hudo.\r\n\r\nPri koči si privoščite pivo in uživajte v naravi.', 4, 50, '46.412096,13.724068', 2, '/', 'Koča je odprta od aprila do septembra', 0, 2, 1, 16),
(42, 'Slap Kozjak', 'Slap znotraj soteske', '\"Do slapa vodi urejena sprehajalna pot, ki jo mestoma dopolnjujejo leseni mostički in končna  terasa, iz katere se odstira mističen pogled proti skalnem amfiteatru z zelenim tolmunom in belim pramenom vode.\" - sočavaley\r\n\r\nAvto pustimo na parkirišču avtokampa in se sprehodimo po urejeni poti do doline slapam, cca 30 minut.\r\n\r\nPArkirno mesto je plačljivo, vendar ni tako hudo.', 4, 80, '46.260572,13.590305', 1, '/', '/', 0, 2, 1, 25),
(43, 'Kobariški muzej', 'Muzej prve svetovne vojne', 'Muzej hrani zbirko prve svetovne vojne, z maketami bojišč etc.\r\n\r\nJe najbolj znan vojaški muzej prve svetovne vojne v sloveniji, vendar je presenetljivo majhen.\r\n\r\nVreden ogleda.\r\n\r\nCena vstopa: 7€ odrasli', 3, 90, '46.246485,13.580913', 0, '041 714 072,  info@kobariski-muzej.si', 'april - september\r\n9:00 - 18:00, vsak dan\r\n\r\njulij - avgust\r\n9:00 - 20:00, vsak dan\r\n\r\noktober - marec\r\n10:00 - 17:00, vsak dan\r\n\r\nMUZEJ JE ODPRT VSE DNI V LETU!', 2, 2, 0, 24),
(44, 'Jama Pekel', 'Jama s slapovi', '\"Jama ima dve etaži, spodnja je prepredena z več vodotoki. Glavni vhodni rov je ozek, z več razširitvami, jezerci in slapovi - najvišji slap ima 5 m vodnega padca in je največji turistom dostopen podzemni slap (urejena peš pot) v jamah v Sloveniji - ter prehodi v zgornjo etažo s kapniki. Po 400 m se jama konča s sifonom. Sifon je bil leta 1975 preplavan in se nadaljuje v odprtem rovu še 500 m, skoraj do ponorov površinskega potoka Ponikovščice. Zgornji suhi rov je lepo zasigan. \" - Wiki\r\n\r\nVstopnina znaša 10€, potrebna je primerna obutev, v jami je 10 stopinj. Predhodno pokličite za informacijo, kje se poravna karto.', 4, 80, '46.289704,15.132975', 1, '031/645-937', 'Ob SOBOTAH in NEDELJAH ob 11.00, 13.00 in 15.00 uri.\r\n\r\nIzjemoma tudi med tednom. Pokliči', 2, 1, 0, 8),
(45, 'Rimska Nekropola', 'Največja rimska nekropola v Sloveniji', '\"Pred skoraj 2000 leti je skozi Šempeter vodila sila pomembna rimska cesta Akvileja–Emona–Celeia–Poetovio (Oglej–Ljubljana–Celje–Ptuj). V okolici so imeli posestva mnogi rimski veljaki in upravniki iz Celeie in nekateri med njimi so svoje grobnice postavili prav v šempeterski rimski nekropoli.\" - TDŠ\r\n\r\nCena vstopnice 5€ (odrasli)', 3, 60, '46.255486,15.121304', 0, '031/645-937', 'Vsako SOBOTO in NEDELJO med 11.00 in 16.00 uro.\r\n\r\nOd ponedeljka do petka se je za vodene oglede potrebno naročiti na 031/645-937', 1, 2, 1, 23),
(46, 'Sankališče Zlodejevo', 'Poletno sankališče na Rogli', 'Sankališče se razteza po stari smučarki progi. Doživetje je precej zabavno, vendar je kratko in cena je 8€ na osebo. Dve osebi lahko gresta v en voziček, tako da v tem primeru je cena enega spusta 16€.', 2, 20, '46.452262,15.334474', 0, '03 757 71 00', 'petek, sobota in nedelja: 11.00 - 17.00\r\n\r\nV primeru slabega vremena ne obratuje.', 2, 2, 1, 2),
(47, 'Pot med Krošnjami', 'Sprehajalna pot med krošnjami dreves', 'Pot je dolga cca 1000m, na višini krošenj, 20m, z najvišjim razglednim stolpom, kateri meri 37m.\r\n\r\nNa vrhu razglednega stolpa je tobogan, kateri je dostopen z doplačilom.\r\n\r\nVstopnina: 10€ + 3€ dodatno za spust po toboganu', 2, 60, '46.452191,15.327385', 1, '+386 3 757 60 60', 'januar, februar 	10:00 – 16:00\r\nmarec, april, maj 	10:00 – 18:00\r\njunij, julij, avgust, september 	09:30 – 19:00\r\noktober 	10:00 – 18:00\r\nnovember, december 	10:00 – 16:00 ', 2, 2, 1, 3),
(48, 'Izolska lokomotiva', 'Parenzanska lokomotiva', 'Ena izmed lokomotiv ozkotirne železnice Parenzane.', 1, 15, '45.538288,13.668784', 0, '/', '/', 0, 2, 1, 28),
(49, 'Lokomotiva Koper', 'Parenzanska lokomotiva', 'Ena izmed lokomotiv ozkotirne železnice Parenzane.', 1, 15, '45.538886,13.738317', 0, '/', '/', 0, 2, 1, 28),
(50, 'Kostnica Kobarid', 'Italijanska kostnica nad Kobaridom', '\"Italijanska kostnica nad Kobaridom je spomenik pri cerkvi sv. Antona v Kobaridu italijanskim vojakom, padlim v prvi svetovni vojni.\r\n\r\nKostnico, ki sta jo oblikovala kipar Giannino Castiglioni in arhitekt Giovanni Greppi, oba tudi avtorja kostnice v Sredipolju, je bila postavljena ob cerkvi sv. Antona na Gradiču nad Kobaridom leta 1938. Kostnico so postavili v spomin padlim italijanskim vojakom v 1. svet. vojni, ki so padli v okolici Kobarida, Bovca, Tolmina in Rombona. \" - wiki', 3, 30, '46.247053,13.584067', 1, '/', '/', 0, 2, 1, 24),
(51, 'Pokrajinski muzej Koper', 'Muzej koprske zgodovine', '\r\n\r\nVstopnica 5€ (odrasli)', 2, 90, '45.548374,13.728127', 0, 'info@PokrajinskiMuzejKoper.si, 041.55.66.44', 'Torek – petek od 8h do 16h\r\nSobota, nedelja in prazniki ob 9h do 17h\r\nPonedeljek, 1.1., 1.5., 1.11. in 25.12. zaprto.', 2, 2, 0, 19),
(52, 'Podzemlje Pece - Vlak', 'Ogled rudnika z vlakom', '\"Opremljeni s čeladami in površniki se boste v osrčje rudnika odpravili kot nekoč rudarji – z originalnim rudarskim vlakom. Po nekaj minutah vožnje se vlak ustavi v revirju Moring, 600 m pod hribom Veliki Vrh. V spremstvu izkušenega vodnika se podate na podzemno avanturo. Koliko rudarjev je kopalo pod zemljo, kakšno orodje so uporabljali, kako dolgo so ustvarjali rove, po katerih se danes lahko sprehajamo? Od začetkov rudarjenja pred več kot 350 leti se je veliko spremenilo. V 90-ih letih prejšnjega stoletja so rudnik zaprli, skrivnosti pa za vedno ostajajo pod goro.\" - koroska.si\r\n\r\nCena 12.00€ (odrasli)', 4, 150, '46.512028,14.857326', 1, 'info@podzemljepece.com, (02) 87 00 180', 'Za vse oglede so obvezne predhodne rezervacije termina.\r\n\r\nod torka do nedelje ob 11:00', 2, 2, 0, 28),
(53, 'Napoleonov most', 'Napoleonov most čez Nadižo', '\"Napoleonov most čez Nadižo je kamnit stopničast ločni most nad koriti reke Nadiže blizu vasic Podbela in Logje na skrajnem zahodu Slovenije. Po mostom je velik, preko 100 m dolg, do 5m globok in zelo lep tolmun, primeren za kopanje, saj je Nadiža poleti precej topla reka. \r\nPo izročilu naj bi bil zgrajen leta 1812 in nosi Napoleonovo ime, saj je bil zgrajen v času njegovih osvajalskih pohodov. Most je bil zgrajen z namenom prečkanja Napoleonovih čet, ki so čezenj prodirale iz Benečije na ozemlje današnje avstrijske zvezne dežele Koroške.\" - wiki', 2, 20, '46.228953,13.439149', 1, '/', '/', 0, 2, 1, 5),
(54, 'Napoleonov most', 'Napoleonov most Tolmin', '\"Napoleonov most pri Kobaridu je kamnit most čez sotesko reke Soče vzhodno od Kobarida. Nastal je na mestu, kjer se Soča še zadnjič stisne v ozko sotesko pred prehodom v ravnino Kobariške kotline. Most je dobil ime, ker so čezenj korakale francoske enote v času Napoleonovega osvajanja. Prvi znani most na tem mestu je bil lesen Beneški most, ki je bil podrt leta 1616. Leta 1750 je bil zgrajen nov, kamnit Napoleonov most. Tega so v prvi svetovni vojni minirale umikajoče avstrijske enote, po vojni pa so Italijani zgradili obstoječi most. V obdobju 2. svetovne vojne je most odigral pomembno vlogo v bitki za obrambo Kobariške republike. \" - wiki', 0, 25, '46.248320,13.586127', 0, '/', '/', 0, 2, 1, 5),
(55, 'Slap Boka', 'Boka je kraški izvir, slap in hudourniški potok', '\"Slap Boka je z višino zgornje stopnje 106 m in širino 18 m nedvomno najveličastnejši slap v Sloveniji in tudi v Evropi. Če prištejemo še 33 m visoko slapišče pod njim, dobimo po višini najbrž najvišji slap v Sloveniji (višina 139 m).\" - wiki', 4, 60, '46.321368,13.481575', 1, '/', '/', 0, 2, 1, 25),
(56, 'Kanin', 'Visokogorski center, dostopen z gondolo', 'Visokogorski center se nahaja nad 2000m, najvišje ležeče slovensko smučišče. Poleti je primerno za hladen oddih, pohodništvo ali samo sprostitev z lepim razgledom.\r\n\r\nNa končni postaji se nahaja tudi bar in menza, kjer lahko za relativno dosti denarja pojeste skromen obrok. Je pa lep razgled iz jedilnice.\r\n\r\nNa vrhu se nahaja lažja, a idilična ferata.\r\n\r\nCena povratne gondole 20€ (odrasli). Vožnja v eno smer traja 30 min.', 4, 200, '46.358889,13.475262', 1, '+386 (0)5 917 9301, info@kanin.si', 'Pon - Petek: od 09:00 do 15:00.\r\nSobota - nedelja: od 08:00 do 15:00 .', 2, 2, 1, 3),
(57, 'Slavnik - Tumova Koča', 'Najvišji hrib na Obali', 'Slavnik je najbolj znan Obalni hrib. Malo pod vrhom stoji koča, kjer je možno spiti pivo in pojesti joto - z fantastičnim razgledom.\r\n\r\nIz parkirišča do vrha je cca 1h hoje, po strmi poti - ostale poti niso vredne.', 3, 140, '45.533848,13.975757', 1, 'opd.koper@gmail.com, +386 31 668 688', 'Sobote, nedelje in prazniki.', 0, 2, 1, 27),
(58, 'Partizanska bolnica Franja', 'Partizanska bolnica iz WW2', '\"Slovenska vojna partizanska bolnica Franja (SVPB-F; 536 m) je bila bolnišnica, ki je med 2. svetovno vojno od decembra 1943 do maja 1945 delovala v Dolenjih Novakih pri Cerknem v težko dostopni soteski Pasice. Zgrajena je bila za zdravljenje ranjencev in težjih bolnikov na območju 9. korpusa slovenske partizanske vojske. Imenuje se po dr. Franji Bojc Bidovec, zdravnici in upravnici te bolnišnice. Poleg glavnega oddelka v soteski Pasice, ki je bil namenjen težjim ranjencem, je bilo v ožji in širši okolici še več manjših oddelkov za lažje ranjence. V času delovanja se je v vseh oddelkih zdravilo okoli 900 borcev različnih narodnosti.\" wiki\r\n\r\nDo bolnice je cca 10 minut po soteski, ob potoku, čez mostičke.\r\n\r\nCena 7€ (odrasli)', 3, 60, '46.153083,14.028390', 1, 'info@muzej-idrija-cerkno.si, +386 (0)5 37 231 80', 'Od 1. 4. do 31. 9. vsak dan: 9:00 - 18:00\r\nOd 1. 10. do 31. 10. vsak dan: 9:00 - 16:00', 2, 2, 1, 24),
(59, 'Razgledna učna pot Dovžanova soteska', 'Pot ob reki in po zajlah', '\"Dovžanova soteska se nahaja v osrednjem delu Karavank, naše najdaljše gorske verige. V njej je edinstveno nahajališče okamnin iz mlajšega paleozoika (stari zemeljski vek).\" - visit-trzic\r\n\r\nPot je dolga cca 2h10m. Del poti je po zajlah, do razgledišča, se pa ga da obiti. Ostala pot vodi po gozdu in ob reki.\r\n\r\nBrošura: https://www.visit-trzic.com/doc/brosure/dovzanova-soteska.pdf', 3, 150, '46.383466,14.328874', 1, '051 627 057, informacije@trzic.si', 'Celo leto.', 0, 2, 1, 32),
(60, 'Snežna jama na Raduhi', 'Najvišje ležeča turistična jama v Sloveniji.', 'Vhod v jamo se nahaja na 1530 m.\r\n\"Snežna jama na Raduhi je najvišje ležeča turistična jama v Sloveniji in ena izmed najvišjih v Evropi. Posebnost te 10 do 12 milijonov let stare jame je večni led v vhodni, Ledeni dvorani in velika količina jamskega mleka – malgonita, ki je odložen po stenah v obliki oblog ali najrazličnejših kapniških tvorbah. Tudi ostalo kapniško bogastvo se lahko brez sramu primerja s kapniki v najlepših turističnih jamah pri nas in v tujini, med drugim mogočni stebri (tudi drugi najvišji v slovenskih jamah, visok 21 m), zavese in ostale aktivne sigaste tvorbe, stalagniti in stalaktiti. Poleg tega je jama bogata z jamsko favno. Odkritih je bilo kar sedem slepih jamskih hroščev. Pri raziskovanju usedlin pa so našli tudi zobe morskega psa.\" - snežna-jama\r\n\r\nZa obisk v zimskem času je priporočena topla obleka in dobra obutev.', 3, 140, '46.398513,14.741909', 1, '+386 41 424 091, info@snezna-jama.com', 'Julij (sobota, nedelja):  9:00, 11:00, 13:00, 15:00, 17:00\r\nAvgust (sobota, nedelja):  9:00, 11:00, 13:00, 15:00, 17:00\r\nSeptember (sobota, nedelja):  9:00, 11:00, 13:00, 15:00', 2, 1, 0, 8);

-- --------------------------------------------------------

--
-- Struktura tabele `loc_tag`
--

CREATE TABLE `loc_tag` (
  `id` int(3) NOT NULL,
  `id_loc` int(4) NOT NULL,
  `id_tag` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `loc_tag`
--

INSERT INTO `loc_tag` (`id`, `id_loc`, `id_tag`) VALUES
(16, 9, 11),
(17, 10, 12),
(18, 12, 13),
(19, 13, 14),
(20, 13, 15),
(21, 15, 16),
(22, 15, 17),
(23, 15, 18),
(24, 16, 19),
(25, 16, 20),
(26, 19, 21),
(27, 19, 20),
(28, 21, 22),
(29, 21, 12),
(30, 20, 13),
(31, 20, 20),
(32, 14, 23),
(33, 23, 16),
(34, 23, 24),
(35, 24, 20),
(36, 24, 25),
(37, 25, 26),
(38, 25, 11),
(39, 26, 27),
(40, 26, 28),
(42, 29, 24),
(43, 31, 29),
(44, 33, 25),
(45, 34, 19),
(46, 34, 30),
(47, 30, 11),
(48, 30, 31),
(49, 35, 25),
(50, 36, 25),
(51, 43, 27),
(52, 43, 28),
(53, 43, 32),
(54, 42, 29),
(55, 41, 21),
(56, 38, 29),
(57, 39, 33),
(58, 32, 29),
(59, 44, 24),
(60, 46, 34),
(61, 47, 12),
(62, 48, 11),
(63, 48, 35),
(64, 49, 11),
(65, 49, 35),
(66, 18, 28),
(67, 18, 22),
(68, 18, 12),
(69, 50, 28),
(70, 50, 12),
(72, 50, 32),
(73, 51, 27),
(74, 52, 11),
(75, 52, 36),
(76, 53, 28),
(77, 56, 12),
(78, 56, 37),
(79, 57, 12),
(80, 57, 25),
(81, 57, 37),
(82, 59, 12),
(83, 59, 37),
(84, 60, 24);

-- --------------------------------------------------------

--
-- Struktura tabele `mtags`
--

CREATE TABLE `mtags` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `mtags`
--

INSERT INTO `mtags` (`id`, `name`) VALUES
(4, 'sfdhgdsf'),
(6, 'hjo'),
(7, 'jama'),
(8, 'Grad');

-- --------------------------------------------------------

--
-- Struktura tabele `myths`
--

CREATE TABLE `myths` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc_s` varchar(100) NOT NULL,
  `desc_l` text NOT NULL,
  `coord` varchar(50) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `myths`
--

INSERT INTO `myths` (`id`, `name`, `desc_s`, `desc_l`, `coord`, `info`) VALUES
(3, 'Zlatorog', 'mali zlatorog', 'veliki zlatorog', 'dsfg', 'dfg'),
(7, 'Sveti Socerb (san Servolo)', 'Sveti Socerb je krščanski svetnik, ki je nekaj časa živel kot puščavnik v Sveti jami na Socerbu', '\"Ko je bil star 12 let je zapustil domačo hišo. Novi dom si je poiskal v jami nad kraškim robom. Ta jama se danes imenuje Sveta jama ali Socerbova jama. V jami je asketsko preživel eno leto in devet mesecev.\r\n\r\nPo tem je dobil posebno moč in je naredil več čudežev - zlasti ozdravljenj bolnikov. Ti čudeži in Socerbovo vztrajno oznanjevanje krščanstva pa niso bili všeč oblastem, saj takrat krščanstvo še ni bilo uradno dovoljeno. Rimski cesarski namestnik Numerian Junil je zato Socerba zaprl in mučil do smrti: najprej so ga bičali, potem so mu izpahnili sklepe na natezalnici, nato so mu trgali meso s telesa z železnimi kavlji, ga oblivali z vrelim oljem in na koncu, 24. maja 284, obglavili.\r\nNjegovo telo počiva v cerkvi svetega Justa v Trstu. Po njem se imenuje tržaška ulica svetega Socerba (italijansko: Via san Servolo) ter eden od otokov v beneški laguni: San Servolo (glej italijanski članek San Servolo). \" - wiki', '45.590248, 13.862464', 'https://sl.wikipedia.org/wiki/Sveti_Socerb'),
(8, 'Metliški krokarji', 'Zlobna grofica je spremenila vojake v krokarje', 'V gradu Pungert je živela zlobna grofica, ki je kmetom vzela žito in vino. Kdor se je upiral, je končal v zaporu. Ko se je grofica razjezila, je prisegla, da je vse otrplo od groze in koga je preklinjala, je okamenel. Takrat so Turke pogosto napadali Metliko. Kmečke hiše so požgali, a gradu ni bilo mogoče vzeti. Neke noči pa so stražarji zaspali. Ko je grofica videla, da so Turki zavzeli grad, je jezno preklinjala: »Prekleti, stražarji, zaspanci! Ali boste postali - gavrani! \" Nesrečni stražarji so se takoj spremenili v krokarje in odleteli do grajskega stolpa. Turki so grad požgali in stolpu le prihranili. In na njem so sedeli krokarji in žalostno plazili do konca svojih dni.', '45,5357384, 15,1956478', '/'),
(9, 'Ajdovska deklica', 'Legenda o velikanu v Alpah', 'Ajdovske deklice so mitološka bitja.\r\n\"Ajdovska deklica je bila dobrega srca. Živela je pod previsnimi stenami Prisanka (ali Prisojnika) in vodila popotnike skozi snežne zamete preko Vršiča v Trento. Ko so se popotniki vračali, so ji pod Prisankom puščali hrano, tako da nikoli ni bila žejna in lačna. Bila pa je tudi sojenica. Obiskovala je mlade matere in prerokovala novorojenčkom njihovo usodo.\r\n\r\nNeke noči je obiskala planšarico v Trenti, ki je pravkar rodila sina. Ker je mati spala, se je ajdovska deklica neslišno približala otroku in mu prerokovala, da bo postal lovec in da bo ustrelil Zlatoroga in z njegovimi rogovi prišel do bajnega bogastva. Ko so za to prerokbo slišale sestre ajdovske deklice, so jo preklele, ker je napovedala smrt Zlatorogu. Tako je okamenela, ko se je vrnila pod Prisojnik. \" - wiki', ' 46.439324, 13.756459', 'https://sl.wikipedia.org/wiki/Ajdovska_deklica'),
(10, 'Ajdovska deklica Crngroba', 'Ajdovska deklica pod Kranjem', 'Ajdovske deklice so mitološka bitja\r\n\r\n\"V hostah Crngroba je živela Ajdovska deklica. Bila je izjemno velika. Njena čreda se je pasla noč in dan na lokah ob Selščici. Bilo je toliko ovac, da ni bila nikoli lačna. Žejo pa si je gasila tako, da je stopila z eno nogo na vrh Šmarne gore, z drugo na Šmarjetno goro, se sklonila in pila iz Save. Nekega dne je loški glavar zapovedal tlačanom, naj zgradijo cerkev. Bolj kot so tlačani delali, večjo cerkev je želel. Nekoč pa jih je obiskala Ajdovska deklica ter jim ponudila pomoč. Zidarjem je v predpasniku prinašala ogromne skale. Iz Save jim je zajemala vodo in jo zlivala v korito, v katerem so mešali malto. Ko je bila cerkev zgrajena, je Ajdovska deklica umrla. Tlačani so jo pokopali v crngrobski hosti. Še prej pa so ji odvzeli eno rebro in ga za spomin obesili v cerkev. Tam je še danes. Iz njega kane vsako leto kapljica krvi.\r\n\r\nDeklica je dobrosrčna, pri ljudeh priljubljena, saj tlačanom pomaga graditi nerealno veliko cerkev, ki bi jo težko zgradili brez njene pomoči. Izkoristila je svojo velikost. Konec je tragičen, deklica umre, razlog za smrt pa ni naveden. Iz spoštovanja obesijo njeno rebro v cerkev. Kot pri deklici s Prisanka je tudi tu omenjena hrana in pijača. Tu si jo deklica sama priskrbi, medtem ko deklica s Prisanka vodi popotnike v zameno za hrano in pijačo. \" - wiki', ' 46.179231, 14.385642', 'https://sl.wikipedia.org/wiki/Ajdovska_deklica'),
(11, 'Ajdovske deklice Krvavca', 'Ajdovske deklice s cerkljanskega hribovlja', 'Ajdovske deklice so mitološka bitja\r\n\r\n\"V cerkljanskih hribih se razprostirata dva griča, med njima pa dolina, ki jo ljudje imenujejo Pri ajdovskih deklicah. Včasih je na enem izmed gričev, imenovanem Na ogradi, stal mogočen grad, v katerem je prebival velikan Ajd s svojima hčerama. Bili sta lepi, imeli pa sta krasne lase, v katerih so bili prepleteni biseri. Za njiju je zvedel pesjanski kralj, ki je živel za devetimi morji. Zarotil se je, da bo dobil deklici. Zato se je z vojsko podal na pot in požigal, plenil in moril vse, kar mu je stopilo na pot. Ko so se bojevali, so spuščali čudne glasove, podobne lajanju. Ko so prišli pod Ajdov grad, so ga takoj napadli, ubili očeta ter ga razsekali na kose. Vsi njegovi deli so okameneli in še danes ležijo okoli Ograde. Deklici sta se uspeli rešiti, zbežali sta visoko v planine, kjer sta živeli dolgo časa. Na gori sta sedeli noč in dan ter bridko jokali krvave solze, da je z vrha Krvavca pritekel krvav potok. Odtod ima gora še danes ime. Ko sta deklici videli, da pesjanov ni več v deželi, sta prišli nazaj v nižave. Narod ju je rad obiskoval, saj sta bili darežljivi in prijazni. V deželo pa so prišli možje, ki so oznanjali novo vero v enega Boga. Tudi do njiju je prišel glas, vendar sta bili tako prevzetni, da nista želeli o tem nič slišati. Zato ju je Bog kaznoval in morali sta umreti. Še danes se v Ajdovi dolinici vidita dva grička, na katerih ne raste nobena trava. Grička sta zakleta, ker pod njima ležita nevernici.\r\n\r\nV tej verziji je več nastopajočih oseb, pomembno vlogo ima pesjan, ki je poleg deklic glavna oseba te legende. Kot v Ajdovski deklici s Prisanka, gre tudi pri tej legendi o lepih in velikih dekletih, ki delata dobro in sta pri ljudeh priljubljeni. Kaže se vpliv Cerkve v tem obdobju, saj se omenja Bog kot edina možnost v koga verjeti. Bog ima pomembno vlogo, saj deklici zaradi neverovanja pošlje v smrt. Tudi pri tej verziji gre za poseg v naravo. \" - wiki', ' 46.299999, 14.529471', 'https://sl.wikipedia.org/wiki/Ajdovska_deklica'),
(12, 'Ajdovska deklica - Igla', 'Ajdovska deklica savinjske doline', 'Ajdovske delike so mitološka bitja.\r\n\r\n\"Legenda pravi, da je nekoč v Savinjski dolini živela Ajdovska deklica. Bila je tako velika, da je z eno nogo stala na Raduhi, z drugo na Veži, v Savinji pa je prala perilo. Nekega dne je z iglo šivala srajco. V grobem platnu se je igla zlomila in v jezi jo je vrgla v dolino, kjer se je zapičila v breg ter tam ostala do danes.\r\n\r\nNi veliko vsebinske podobnosti z Ajdovsko deklico s Prisanka. Edina podobnost je ta, da gre pri obeh legendah za veliki dekleti. V tej verziji deklica ne opravlja nobenega dobrega dela, in ni nobenega opisa o tem, da bi bila pri ljudeh priljubljena. Ne moremo govoriti o tragičnem koncu, ker ne vemo, kaj se z deklico zgodi, pomembno pa vpliva na podobo pokrajine. \" -wiki', ' 46.308612, 14.895376', 'https://sl.wikipedia.org/wiki/Ajdovska_deklica');

-- --------------------------------------------------------

--
-- Struktura tabele `myth_mtag`
--

CREATE TABLE `myth_mtag` (
  `id` int(4) NOT NULL,
  `id_myth` int(4) NOT NULL,
  `id_mtag` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `myth_mtag`
--

INSERT INTO `myth_mtag` (`id`, `id_myth`, `id_mtag`) VALUES
(4, 3, 4),
(6, 3, 6),
(8, 7, 7),
(9, 8, 8);

-- --------------------------------------------------------

--
-- Struktura tabele `parkings`
--

CREATE TABLE `parkings` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cost` int(1) NOT NULL,
  `coord` varchar(50) NOT NULL,
  `id_location` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `parkings`
--

INSERT INTO `parkings` (`id`, `name`, `cost`, `coord`, `id_location`) VALUES
(19, 'Porking na Rogli', 0, '46.452873,15.332211', 8),
(20, 'Mercator parking', 0, '46.341077,15.424419', 9),
(21, 'Parking ob cesti', 0, '46.455671,15.340462', 10),
(22, 'Rogla', 0, '46.452718,15.332005', 11),
(23, 'Pesek', 0, '46.466569,15.344614', 12),
(25, 'Parking', 0, '45.509379,13.900592', 13),
(26, 'Parking', 0, '45.551190,13.759948', 15),
(27, 'Parking', 0, '45.589257,13.861511', 16),
(28, 'Parking', 0, '45.589240,13.861531', 17),
(29, 'Parking', 0, '45.553444,13.879528', 18),
(30, 'Parking Mercator', 0, '45.845748,13.960615', 19),
(31, 'Parking kobilarne', 1, '45.668582,13.883958', 20),
(32, 'Parking', 0, '45.521148,13.908592', 21),
(33, 'Parking', 0, '45.662602,13.988279', 23),
(34, 'Parking', 0, '45.633299,13.923473', 24),
(35, 'Parking', 0, '45.790893,14.304453', 27),
(36, 'Parking', 0, '45.814089,14.128706', 28),
(37, 'Parking', 0, '45.814049,14.128621', 29),
(39, 'Parking muzeja', 1, '46.062701,14.503500', 30),
(40, 'Parking', 0, '46.437782,13.895137', 31),
(41, 'Parking od koče', 2, '46.438207,13.896129', 31),
(42, 'Planica', 1, '46.474734,13.722706', 33),
(43, 'Parking', 1, '45.701245,13.720451', 34),
(44, 'Parking', 2, '46.413168,13.846997', 35),
(45, 'Parking', 0, '46.241886,14.008672', 36),
(46, 'Parking', 0, '46.241125,14.010004', 37),
(47, 'Parking', 2, '46.292762,13.796799', 38),
(48, 'Parking Mercator', 2, '46.276546,13.888016', 39),
(49, 'Parking', 1, '46.249462,13.587856', 42),
(51, 'Poceni/zastonj parking', 1, '46.247355,13.576957', 43),
(52, 'Parking', 0, '46.286286,15.131051', 44),
(53, 'Parking', 0, '46.255208,15.121819', 45),
(54, 'Parking', 0, '46.452140,15.332151', 46),
(55, 'Parking', 0, '46.451500,15.328479', 47),
(56, 'Parking 12 uh', 0, '45.538829,13.665404', 48),
(57, 'Parkirišče stadion', 0, '45.538829,13.665404', 48),
(58, 'Parking ladjedelnica', 1, '45.538829,13.665404', 48),
(59, 'Parking Avtobusna', 1, '45.538386,13.737276', 49),
(60, 'Parking Tržnica', 1, '45.545579,13.725810', 51),
(61, 'Parking', 1, '46.249329,13.587588', 54),
(62, 'Parking', 0, '46.318236,13.494885', 55),
(63, 'Parking', 0, '46.332416,13.538310', 56),
(64, 'Parking Podgorje', 1, '45.531616,13.946778', 57),
(65, 'Parking', 0, '46.150080,14.027306', 58),
(66, 'Štart', 0, '46.379615,14.324704', 59),
(67, 'Sredinski', 0, '46.385421,14.330813', 59),
(68, 'Parking', 0, '46.397947,14.744791', 60);

-- --------------------------------------------------------

--
-- Struktura tabele `tags`
--

CREATE TABLE `tags` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Odloži podatke za tabelo `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(11, 'Vlaki'),
(12, 'Razgledne točke'),
(13, 'Jahanje'),
(14, 'Obzidje'),
(15, 'Cerkev'),
(16, 'Rezervat'),
(17, 'Boškarin'),
(18, 'Zatok'),
(19, 'Grad'),
(20, 'Gostilna'),
(21, 'Izvir'),
(22, 'Utrdba'),
(23, 'Megalit'),
(24, 'Jama'),
(25, 'Koča'),
(26, 'Viadukt'),
(27, 'Muzej'),
(28, 'Vojna'),
(29, 'Slap'),
(30, 'Park'),
(31, 'Muzej'),
(32, 'WW1'),
(33, 'Jezero'),
(34, 'Letno sankališče'),
(35, 'Parenzana'),
(36, 'Rudnik'),
(37, 'Hribi');

-- --------------------------------------------------------

--
-- Struktura tabele `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(192) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Odloži podatke za tabelo `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `status`, `created_date`) VALUES
(1, 'bb', 'b', 'andrej.zubin@email.com', 'pbkdf2:sha256:150000$TlMA8JAJ$3f4934eab7629ed926a73b8aed0def6c001a6d7f97cb1fc1c8bed1350222fe61', 1, '2020-06-21 09:31:10'),
(4, 'm', 'm', 'andrej.zubin@edmail.com', 'pbkdf2:sha256:150000$wHwBTkhk$e7e8513789f29db3f7ff26cf044883492fd506c87e9711ee8f7e5d79f110be37', 1, '2020-06-21 14:23:03');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `imgs`
--
ALTER TABLE `imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `loc_tag`
--
ALTER TABLE `loc_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_location` (`id_loc`),
  ADD KEY `id_cat` (`id_tag`);

--
-- Indeksi tabele `mtags`
--
ALTER TABLE `mtags`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `myths`
--
ALTER TABLE `myths`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `myth_mtag`
--
ALTER TABLE `myth_mtag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myth_restriction` (`id_myth`),
  ADD KEY `mtag_restriction` (`id_mtag`);

--
-- Indeksi tabele `parkings`
--
ALTER TABLE `parkings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_location_restric` (`id_location`);

--
-- Indeksi tabele `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT tabele `imgs`
--
ALTER TABLE `imgs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT tabele `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT tabele `loc_tag`
--
ALTER TABLE `loc_tag`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT tabele `mtags`
--
ALTER TABLE `mtags`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT tabele `myths`
--
ALTER TABLE `myths`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT tabele `myth_mtag`
--
ALTER TABLE `myth_mtag`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT tabele `parkings`
--
ALTER TABLE `parkings`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT tabele `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `loc_tag`
--
ALTER TABLE `loc_tag`
  ADD CONSTRAINT `id_location` FOREIGN KEY (`id_loc`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omejitve za tabelo `myth_mtag`
--
ALTER TABLE `myth_mtag`
  ADD CONSTRAINT `mtag_restriction` FOREIGN KEY (`id_mtag`) REFERENCES `mtags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `myth_restriction` FOREIGN KEY (`id_myth`) REFERENCES `myths` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omejitve za tabelo `parkings`
--
ALTER TABLE `parkings`
  ADD CONSTRAINT `id_location_restric` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
