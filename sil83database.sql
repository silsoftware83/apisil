-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-11-2025 a las 06:07:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sil83database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_jefe_area` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '0001_01_01_000000_create_users_table', 1),
(6, '0001_01_01_000001_create_cache_table', 1),
(7, '0001_01_01_000002_create_jobs_table', 1),
(8, '2025_11_19_190542_create_personal_access_tokens_table', 1),
(9, '2025_10_22_051520_modules', 2),
(10, '2025_10_22_051835_sub_modules', 2),
(11, '2025_10_22_053555_user_module_access', 2),
(12, '2025_11_21_005209_personal', 3),
(13, '2025_11_22_044225_departamentos', 4),
(14, '2025_11_22_045238_create_puestos_table', 5),
(15, '2025_11_22_045342_id_puesto_add', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `description`, `icon`, `route`, `order`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Empleados', 'empleados', 'Gestión completa de empleados', 'Users', '/empleados', 1, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(2, 'Tiempo y Asistencia', 'tiempo-asistencia', 'Control de horarios, asistencia y ausencias', 'Clock', '/tiempo', 2, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(3, 'Nómina', 'nomina', 'Gestión de pagos y nómina', 'Wallet', '/nomina', 3, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(4, 'Desempeño', 'desempeno', 'Evaluaciones y gestión del desempeño', 'Target', '/desempeno', 4, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(5, 'Reclutamiento', 'reclutamiento', 'Gestión de vacantes y candidatos', 'UserSearch', '/reclutamiento', 5, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(6, 'Capacitación', 'capacitacion', 'Formación y desarrollo de empleados', 'GraduationCap', '/capacitacion', 6, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(7, 'Beneficios', 'beneficios', 'Gestión de beneficios y prestaciones', 'Gift', '/beneficios', 7, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(8, 'Reportes y Analítica', 'reportes', 'Reportes e indicadores de RRHH', 'ChartBar', '/reportes', 8, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(9, 'Configuración', 'configuracion', 'Configuración del sistema', 'Settings', '/configuracion', 9, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(10, 'Home', 'Dashboard', 'Modulo que contiene los home de administrador y de recursos humanos', 'House', NULL, 0, 1, '2025-11-20 23:45:21', '2025-11-20 23:45:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actualContract` varchar(20) NOT NULL DEFAULT 'Prueba',
  `dateContractFinish` date DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  `id_check` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` varchar(200) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `curp` varchar(20) DEFAULT NULL,
  `nss` varchar(20) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `ine` varchar(50) DEFAULT NULL,
  `alergist` varchar(100) DEFAULT NULL,
  `personalContact` varchar(200) DEFAULT NULL,
  `phoneContact` varchar(30) DEFAULT NULL,
  `empresa` varchar(25) DEFAULT NULL,
  `puesto` varchar(250) DEFAULT NULL,
  `ingreso` date DEFAULT NULL,
  `id_empleado` int(11) DEFAULT 0,
  `id_jefe_inmediato` int(11) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_puesto` bigint(20) UNSIGNED DEFAULT NULL,
  `inmBoss` varchar(250) NOT NULL DEFAULT 'No especificado',
  `wArea` varchar(250) DEFAULT NULL,
  `infonavit` varchar(50) DEFAULT NULL,
  `numCart` varchar(35) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `idLicNum` varchar(50) DEFAULT NULL,
  `documents` varchar(220) DEFAULT NULL,
  `contracts` varchar(500) NOT NULL DEFAULT '[]',
  `documentsCompany` varchar(220) DEFAULT NULL,
  `removeColaborator` varchar(300) DEFAULT NULL,
  `img` varchar(100) NOT NULL DEFAULT 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1',
  `numExt` varchar(50) DEFAULT NULL,
  `utalla` varchar(100) DEFAULT NULL,
  `numCarttwo` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL DEFAULT 'email@email.com',
  `emailCompany` varchar(60) DEFAULT NULL,
  `checkCode` varchar(10) DEFAULT NULL,
  `ext_tel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `actualContract`, `dateContractFinish`, `name`, `lastName`, `activo`, `id_check`, `created_at`, `updated_at`, `direction`, `cp`, `phone`, `birthday`, `rfc`, `curp`, `nss`, `school`, `ine`, `alergist`, `personalContact`, `phoneContact`, `empresa`, `puesto`, `ingreso`, `id_empleado`, `id_jefe_inmediato`, `id_departamento`, `id_puesto`, `inmBoss`, `wArea`, `infonavit`, `numCart`, `company`, `idLicNum`, `documents`, `contracts`, `documentsCompany`, `removeColaborator`, `img`, `numExt`, `utalla`, `numCarttwo`, `email`, `emailCompany`, `checkCode`, `ext_tel`) VALUES
(5, 'Evaluacion', '2024-12-06', 'ALEXIS DAVID', 'DUARTE GARCIA', 1, '2024-03-01', '2023-08-23 08:15:28', '2025-02-20 04:46:07', 'c. leona vicario bonfil', 77560, '9983916095', '1991-12-15', 'DUGA911215UJ8', 'kghhfhjkgjfiy', '85415435454', 'LICENCIATURA', '44854354', 'NA', 'victoria', '34554', 'Avaluosygestoriapdcsc', 'Auxiliar de recursos humanos', '2021-08-07', 3545, NULL, NULL, NULL, '{\"label\":\"GRECIA ARLETTE CANTE HU\",\"value\":153}', 'Recursos Humanos', '6554', 'NA', NULL, '35454', '{\"evalOne\":true,\"evaltree\":true,\"docCert\":true,\"infonavit\":true,\"recDoc\":true,\"marriageDoc\":true}', '[{\"tipo\":\"Prueba\",\"inicio\":\"2024-02-01\",\"termino\":\"2024-02-29\",\"dateContractFinish\":\"2024-02-29\"},{\"tipo\":\"Capacitacion\",\"inicio\":\"2024-09-08\",\"termino\":\"2024-10-07\",\"dateContractFinish\":\"2024-11-16\"},{\"tipo\":\"Evaluacion\",\"inicio\":\"2024-11-07\",\"termino\":\"2024-12-06\"},{\"tipo\":\"Indeterminado\",\"inicio\":\"\",\"termino\":\"\"}]', '\"\"', '\"\"', 'https://apiproduction.sil83.com/uploads/1740026767_custom_filename.jpg', '965', '32', '15121541', 'alexisduarte1512@gmail.com', 'alexisduarte1512@gmail.com', '00000', NULL),
(6, 'Indeterminado', NULL, 'ADAM LEONARDO', 'CHAN GARCIA', 1, NULL, '2023-10-31 01:46:56', '2024-11-13 19:38:57', 'AV 30 POR CALLE 28 NORTE GONZALO GUERRERO', 77720, '9982223151', '1996-04-21', 'CAGX9604212H2', 'CXGA960421HYNHRD08', '54159660767', 'Licenciatura', '0621097676894', 'NA', 'LEONARDO CHAN', '9982404074', 'RHR83SC', 'Abogado Jr', '2022-02-01', NULL, NULL, NULL, NULL, '{\"label\":\"ALEJANDRO REYES CITUK\",\"value\":8}', 'Berlín', 'N/A', '012180015246647256', NULL, 'N/A', NULL, '[{\"tipo\":\"Prueba\",\"inicio\":\"2022-02-01\",\"termino\":\"2022-03-01\"},{\"tipo\":\"Capacitacion\",\"inicio\":\"2022-03-01\",\"termino\":\"2022-04-01\"},{\"tipo\":\"Evaluacion\",\"inicio\":\"2022-04-01\",\"termino\":\"202222-05-01\"},{\"tipo\":\"Indeterminado\",\"inicio\":\"2022-06-01\",\"termino\":\"\"}]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '646698146401463770', 'al.chan.garcia@gmail.com', 'lchan@notaria83qroo.mx', '2453245', NULL),
(7, 'Indeterminado', '2023-11-24', 'ANGEL DAVID', 'XIU CANUL', 0, NULL, '2023-10-31 03:58:09', '2024-11-06 21:47:38', 'mz29 lt1 c, avocetas', 77710, '9847453885', '1990-05-25', 'xica900524TU9', 'XICA900524HQRXNN09', '8212902277-6', 'Preparatoria', NULL, 'NA', NULL, NULL, 'Avaluosygestoriapdcsc', 'Gestor', '2022-11-01', NULL, NULL, NULL, NULL, '{\"label\":\"NADIA OLIVA CANELA REYNA\",\"value\":55}', 'Gestoría', '2317223147', NULL, NULL, NULL, NULL, '[{\"tipo\":\"Prueba\",\"inicio\":\"2022-11-01\",\"termino\":\"2022-12-01\"},{\"tipo\":\"Capacitacion\",\"inicio\":\"2022-12-01\",\"termino\":\"2023-01-01\"},{\"tipo\":\"Evaluacion\",\"inicio\":\"2023-01-01\",\"termino\":\"2023-02-01\"},{\"tipo\":\"Indeterminado\",\"inicio\":\"2022-11-01\",\"termino\":\"2023-11-24\"}]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'david7xiu@gmail.com', NULL, '00000', NULL),
(8, 'Prueba', NULL, 'ALEJANDRO', 'REYES CITUK', 1, NULL, '2023-10-31 22:30:19', '2024-07-09 13:59:18', 'C. 1A MZ 27 LT8 X115 Y 120 AV COL. BELLAVISTA', 77713, '9841581975', '2001-06-09', 'RECA010609HC5', 'RECA010609HQRYTLA5', '0816122761', 'Preparatoria', 'IDMEX1937207643', 'NA', 'Elmer Reyes (Hermano)', '9847454890', 'RHR83SC', 'Abogado Jr.', '2023-09-06', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', 'Atlanta', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1720533558_custom_filename.jpg', NULL, NULL, '646690146402454021', 'ALEJANDROR0906@GMAIL.COM', 'areyes@notaria83qroo.mx', '00000', NULL),
(9, 'Prueba', NULL, 'ALBERTO', 'MAYER GONZALEZ', 0, NULL, '2023-10-31 22:55:10', '2024-11-27 16:08:46', 'coto 2 #316 e. pcn selvanova', 77725, '9841140585', '1988-05-27', 'maga8805277m6', 'maga880527hdfynl07', '07088803106', 'Preparatoria', 'idmex2188262214', 'NA', NULL, NULL, 'RHR83SC', NULL, '2022-11-17', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', '\"\"', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'VITONEMESIS88@GMAIL.COM', NULL, '00000', NULL),
(10, 'Prueba', NULL, 'ALEJANDRA YANETH', 'PEREZ LOPEZ', 0, NULL, '2023-10-31 23:26:32', '2025-03-06 18:48:23', 'C.10 LT 7 MZ 201 AV. 115 Y 120 EJIDO NTE, CP. 77712, SOLIDARIDAD, Q.R', 77712, '9842058262', '1995-11-07', 'PELA951107Q17', 'PELA951107MCSRPL00', '10169597043', 'Licenciatura', 'IDMEX2257237219', 'NA', 'HERIBERTO CRUZ SANCHEZ (esposo)', '9842502897', 'RHRVIVIENDASC', 'Capturista', '2025-03-07', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Estocolmo', NULL, '012180015429217076', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '646690146401613614', 'alejandra7.yaneth@gmail.com', 'capturista2@notaria83qroo.mx', '00000', NULL),
(11, 'Prueba', NULL, 'ANGELINA', 'PALE MOSHAN', 0, NULL, '2023-10-31 23:49:31', '2024-03-20 20:48:58', '15 SUR X 100 Y 105 MZ 30 LT 04 COL. FORJADORES', 77716, '9842539900', '1993-06-24', 'PAMA930624LH3', 'PAMA930624MCSLSN09', '82099310359', 'Primaria', '1149127491780', 'NA', 'Pascuala Mushan Martinez (MAMA)', '9842156174', 'RHRVIVIENDASC', 'Limpieza', '2018-10-24', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Administración', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'email@email.com', NULL, '00000', NULL),
(12, 'Prueba', NULL, 'AGUEDA SELENE', 'CABAÑAS TUYUB', 0, NULL, '2023-11-01 01:53:13', '2024-11-15 14:26:42', 'ISLA MUJERES MZ 6 LT 9 TULUM Y COBA, 28 DE JULIO, NUEVA CREACIÓN', 77714, '9861533241', '1994-01-25', 'CATA9401254K6', 'CATA940125MYNBYG08', '01139453672', 'Licenciatura', 'IDMEX2529510860', 'NA', 'WIGELMY NICELDY CABAÑAS TUYUB (HERMANA)', '9841434181', 'RHR83SC', 'Auxiliar de Capital Humano', '2023-10-19', 139, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Humanos', NULL, '012694015549414546', NULL, NULL, NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1704386500_custom_filename.jpg', NULL, NULL, '646690146402589624', 'CAMILA_SELENE_20@HOTMAIL.COM', 'auxiliar.humano@notaria83qroo.mx', '00000', NULL),
(13, 'Prueba', NULL, 'ANGELA GUADALUPE', 'CASTILLO DZUL', 1, NULL, '2023-11-01 02:09:10', '2024-11-13 19:49:50', 'SM 25 1 M 100 L 3 CALLE ISLA CAPRI EDIFICIO, FRACC. PASEOS DEL MAR', 77519, '9989393221', '1985-03-31', 'CADA850331BC1', 'CADA850331MQRSZN06', '82068522323', 'Preparatoria', '0055077409172', 'NA', 'Raúl Estrada Urbina (esposo)', '9983061537', 'RHR83SC', 'Supervisora de áreas de servicios legales', '2015-08-17', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Archivo', '2315047610', '4152313932312395', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'castillodzul85@gmail.com', 'acastillo@notaria83.mx', '00000', NULL),
(14, 'Prueba', NULL, 'CONNIE STEPHANIA', 'RAMIREZ GARCÍA', 0, NULL, '2023-11-01 02:35:21', '2024-12-31 14:32:20', 'mz 136 lt 16 av. CTM X 20 25 AV. COL. ZACIL ha', 77720, '7226462144', '1992-05-08', 'ragc9205089g3', 'ragc920508mmcmrn08', '16129262297', 'Licenciatura', 'idmex2409444748', 'NA', 'Guillermina garcia (mamá)', '7223676789', 'RHR83SC', NULL, '2023-05-23', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', '\"\"', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402318772', 'CONY_STHEPY@HOTMAIL.COM', NULL, '-', NULL),
(15, 'Prueba', NULL, 'DENISE GUADALUPE', 'ROBLEDO MOZO', 0, NULL, '2023-11-01 02:57:09', '2024-08-02 22:04:03', 'AV 25 NTE DEP  2X4 NTE, ESQ. 4 NTE COL. CENTRO', 77710, '2212063603', '1990-06-12', 'ROMD900612TF1', 'ROMD900612MPLBZN02', '03199067186', 'Licenciatura', 'IDMEX2136632719', 'NA', 'Lucia Mozo (Mamá)', '2225906161', 'RHR83SC', 'Recepcionista', '2022-03-22', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Recepción', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'DENISER_126@HOTMAIL.COM', 'recepcion@notaria83.mx', '00000', NULL),
(16, 'Prueba', NULL, 'ESTEFANY LIZET', 'GAMBOA MUKUL', 1, NULL, '2023-11-01 03:23:10', '2024-04-12 20:30:40', 'fracc. misión villamar ii m 14 l 2', 77710, '9842173616', '2000-04-04', 'game000404866', 'game000404mqrmksa0', '53160061361', 'Licenciatura', 'IDMEX1757063548', 'NA', 'Mirza Mukul (Madre)', '9842804963', 'RHR83SC', 'Auxiliar de Avisos y Sistemas', '2022-09-21', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '38', NULL, NULL, 'GAMBOAESTEFANY06@GMAIL.COM', 'avisos2@notaria83qroo.mx', '00000', NULL),
(17, 'Prueba', NULL, 'DAYANA GUADALUPE', 'SOTO URIAS', 0, NULL, '2023-11-01 03:45:16', '2024-02-22 21:09:31', 'R81 MZ 24 LT 2 # 801 PLA. MOCAMBO, PLAYA AZUL 1 ETAPA', 77724, '6641119197', '1992-08-12', 'SOUD920812S39', 'SOUD920812MSLTRY02', '20169293600', 'Preparatoria', 'IDMEX1471530919', 'NA', 'JOHN MORALES(pareja)', '9841460422', 'RHRVIVIENDASC', NULL, '2023-10-24', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', '\"\"', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'DAYANAGS1@ICLOUD.COM', NULL, '00000', NULL),
(18, 'Prueba', NULL, 'DULCE VIANEY', 'GUZMAN DIAZ', 0, NULL, '2023-11-01 03:57:17', '2024-11-05 21:22:56', 'MZ 42 LT 1 #8 MISIÓN LAS FLORES', 77723, '9361365668', '1996-07-02', 'GUDD9607023S1', 'GUDD960702MCSZZL02', '59149696870', 'Preparatoria', 'IDMEX1776593677', 'NA', 'Luis Pérez (Pareja)', '9844512408', 'RHR83SC', 'Auxiliar legal', '2023-09-01', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'DULCEDIAZ9319@GMAIL.COM', 'dguzman@notaria83qroo.mx', '00000', NULL),
(19, 'Prueba', NULL, 'ERIC LEOPOLDO', 'VELAZQUEZ MARTINEZ', 0, NULL, '2023-11-02 02:20:23', '2025-01-03 15:44:04', 'FRACC. PASEOS XCACEL M 6 L 3 AVENIDA CONSTITUYENTES, CONDOMINIO PLAYA COZUMEL', 77723, '5512107463', '1996-06-22', 'VEME960622LM9', 'VEME960622HMCLRR03', '92119653795', 'Licenciatura', 'IDMEX1711862860', 'NA', 'LUIS  VICTORIA (PAREJA DE ITZEL)', '5535641359', 'RHR83SC', NULL, '2023-03-14', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', '\"\"', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'ERICK_MARTINEZ@ICLOUD.COM', 'emartinez@notaria83qroo.mx', '00000', NULL),
(20, 'Prueba', NULL, 'EDGAR DEL ANGEL', 'MAY ESTRADA', 0, NULL, '2023-11-03 21:05:08', '2024-12-03 22:53:56', 'CENOTE MZ 10 LT 3 CASA 82 GRUTA Y GRUTA, COL. GALAXIA DEL CARMEN', 77723, '9811309717', '1999-08-03', 'MAEE9908037B1', 'MAEE990803HCCYSD00', '17139959757', 'Licenciatura', 'IDMEX2090036385', 'NA', 'Carolina Cruz (Pareja)', '9812046251', 'RHR83SC', 'Auxiliar contable', '2023-04-17', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DEL ROSARIO TELLITUD ORTÍZ\",\"value\":109}', 'Contabilidad', NULL, '1576935934', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'EDGARMAY0308@GMAIL.COM', 'aux.contable@notaria83.mx', '00000', NULL),
(21, 'Prueba', NULL, 'ERIKA ANTONIA', 'ZUÑIGA VAZQUEZ', 0, NULL, '2023-11-04 03:59:33', '2025-01-03 15:44:13', 'FRACC, PESCADORES M 3 L5 CALLE GARZONES', 77710, '9843173297', '1981-10-15', 'zuve11015mc069', 'ZUVE811015MCSXZR09', '82988126247', 'Preparatoria', 'idmex1730064706', 'na', 'Robert Martinez (Pareja)', '9841525747', 'RHR83SC', NULL, '2021-01-20', NULL, NULL, NULL, NULL, '{\"label\":\"ANGELA GUADALUPE CASTILLO DZUL\",\"value\":13}', NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '47', NULL, NULL, 'EZYJC246@GMAIL.COM', 'ezuniga@notaria83qroo.mx', NULL, NULL),
(24, 'Prueba', NULL, 'EDGAR JONATHAN', 'CARRILLO MORAN', 0, '2023-12-13', '2023-11-06 22:23:37', '2025-01-03 15:44:21', 'FLOR DE ACANTO MZ 33 LT 1 # 82, LAS PALMAS II', 77710, '9841385576', '1995-01-26', 'CAME950126DU4', 'CAME950126HVZRRD09', '03189526316', 'Licenciatura', 'IDMEX1743957978', 'NA', 'Veronica moran (mama)', '9848790392', 'RHR83SC', 'Auxiliar de firmas', '2023-06-05', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', 'Atlanta', '2321154259', NULL, NULL, 'SA-9714', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402331720', 'JOCARRILLO213@GMAIL.COM', 'ecarrillo@notaria83qroo.mx', NULL, NULL),
(25, 'Prueba', NULL, 'ERICKA MARGARITA', 'CANTO SANTOYO', 0, NULL, '2023-11-07 03:35:31', '2024-12-02 21:46:50', '5TA X AVENIDA CONSTRUCTORES MZ 49 L15, VICENTE SUAREZ, COL. NICTE HA', 77727, '9844505926', '2000-06-30', 'CASE000630T63', 'CASE000630MQRNNRA0', '53160054697', 'Licenciatura', 'IDMEX1748247373', 'NA', 'Marían del Carmen Canto (mama)', '9831355014', 'RHR83SC', 'Capturista', '2023-03-23', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'ERICKACASAN@HOTMAIL.COM', 'ecanto@notaria83qroo.mx', NULL, NULL),
(26, 'Prueba', NULL, 'EVA ROMINA', 'GUZMAN OLIVAS', 1, NULL, '2023-11-07 22:45:15', '2024-04-11 22:07:08', 'MZ 26 LT 5 EDIF. B #109 S1 MARTINE PRIVADA MARTINET, REAL IBIZA', 77725, '5544448550', '1991-12-16', 'GUOE911216FF3', 'GUOE911216MDFZLV01', '19149176695', 'Licenciatura', 'IDMEX2418709915', 'NA', 'Giovanna Guzman (prima)', '5529024732', 'RHR83SC', 'Abogado Jr', '2023-02-15', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '012180015543041186', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646420146406345461', 'olivas_ev@hotmail.com', 'rguzman@notaria83qroo.mx', NULL, NULL),
(28, 'Prueba', NULL, 'GENNY JUDITH', 'VARGUEZ DZIB', 0, NULL, '2023-11-08 02:21:35', '2025-01-03 15:44:33', 'LAS PALMAS I M 89 L 1 CALLE CASCANUECES', 77710, '9842176464', '1991-05-06', 'VADG910506S25', 'VADG910506MQRRZN02', '82099121756', 'Licenciatura', 'IDMEX1214434810', 'NA', 'Swartzia Varguez (hermana) / Ivan Chay (ex pareja)', '983181250798421', 'RHR83SC', 'Abogado Jr.', '2017-12-07', 0, NULL, NULL, NULL, '{\"label\":\"ANGELA GUADALUPE CASTILLO DZUL\",\"value\":13}', 'Atlanta', NULL, '012694029796681367', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '62', '-', '646690146401477559', 'TAURINA-96@HOTMAIL.COM', 'gvarguez@notaria83qroo.mx', NULL, NULL),
(29, 'Prueba', NULL, 'HUGO', 'CELIS MALDONADO', 0, NULL, '2023-11-08 03:54:38', '2024-02-22 21:10:03', 'MZ 9 LT 1 CALLE  AVOCETAS #16, FRACC. PESCADORES', 77710, '9842104300', '1991-09-05', 'CEMH9109052B8', 'CEMH910905HMCLLG07', '82109135069', 'Licenciatura', 'IDMEX2018708662', 'NA', 'Liliana Jimenez(Concubina)', '9171070072', 'RHR83SC', 'Encargado de Gestoría', '2023-03-06', NULL, NULL, NULL, NULL, '{\"label\":\"ERIKA ANTONIA ZUÑIGA VAZQUEZ\",\"value\":21}', 'Gestoría', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', NULL, 'HUGOCELISTOTALPLAY@OUTLOOK.COM', 'aux.archivo4@notaria83qroo.mx', NULL, NULL),
(30, 'Prueba', NULL, 'IMELDA', 'ACOSTA ROBLES', 1, NULL, '2023-11-08 20:38:18', '2024-08-19 18:31:37', 'CDA STA LUCIA MZ 3 LT 01 75 CERRADA PASEO SANTA LUCIA, LOS OLIVOS', 77725, '4496679714', '1997-08-18', 'AORI970818NA3', 'AORI970818MMCCBM08', '08159760654', 'Licenciatura', 'IDMEX1916631153', 'NA', 'Alejandro Acosta Robles (Hermano)', '9841986278', 'RHR83SC', 'Asistente de Dirección', '2022-09-22', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Legal', NULL, '012010029594240678', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646010146401744817', 'ACOSTA_IMELDA@HOTMAIL.COM', 'imelda@notaria83.mx', NULL, NULL),
(31, 'Prueba', NULL, 'ITZEL', 'RAMIREZ TRINIDAD', 1, NULL, '2023-11-08 20:59:05', '2024-10-11 14:17:04', 'FRACC. PASEOS XCACEL M6 L3 AVENIDA CONSTITUYENTES , DEPTO 18 D, EDIFICIO 9, CONDOMINIO PLAYA COZUMEL', 77723, '5524280753', '1993-02-07', 'RATI930207K6A', 'RATI930207MDFMRT07', '92129351323', 'Licenciatura', 'IDMEX2121085504', 'NA', 'LUIS  VICTORIA (PAREJA)', '5535641359', 'RHR83SC', 'Abogado Jr', '2022-07-04', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', NULL, '4152314028709031', NULL, NULL, NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1728656224_custom_filename.jpg', '-', '-', '646690146401740862', 'ITZELRAMIREZJURIDICO@GMAIL.COM', 'iramirez@notaria83qroo.mx', NULL, NULL),
(32, 'Prueba', NULL, 'JACQUELINE', 'NAFATE ARROYO', 0, NULL, '2023-11-08 22:39:46', '2024-02-22 21:11:12', '30 AV. MZ 29 LT 3 X 24 Y 26 NTE, ORD ANT 203215, GONZALO GUERRERO', 77720, '2226791447', '1983-12-26', 'NAAJ831226729', 'NAAJ831226MPLFRC05', '48038353461', 'Licenciatura', 'IDMEX2429292767', 'NA', 'srael Cristales Castelan (Esposo)', '2225330206', 'RHR83SC', NULL, '2023-06-26', NULL, NULL, NULL, NULL, '{\"label\":\"ERIKA ANTONIA ZUÑIGA VAZQUEZ\",\"value\":21}', NULL, NULL, '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402368968', 'email@email.com', NULL, NULL, NULL),
(33, 'Prueba', NULL, 'JENNIFER ALEXANDRA', 'TUK CHIMAL', 0, NULL, '2023-11-09 01:38:29', '2024-04-16 18:09:55', 'MZ 99 LT1 #63 CALLE PALMA CHIT, LAS PALMAS II', 77710, '9841276784', '2000-09-17', 'TUCJ0009178JA', 'TUCJ000917MQRKHNA4', '50160033697', 'Licenciatura', 'IDMEX1936099159', 'NA', 'Asunciona Chimal (mama)', '98431000652', 'RHR83SC', NULL, '2022-12-05', NULL, NULL, NULL, NULL, '{\"label\":\"GENNY JUDITH VARGUEZ DZIB\",\"value\":28}', NULL, NULL, '012 225 015552730343', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, '-', '646690146402027225', 'ALEXANDRA001TR@GMAIL.COM', 'aux.archivo3@notaria83qroo.mx', NULL, NULL),
(34, 'Prueba', NULL, 'JORDY FRANCISCO', 'CALDERÓN KUMUL', 0, NULL, '2023-11-09 02:27:16', '2024-03-11 14:48:16', 'AV RIO BRAVO MZ 7 LT 1 #1248', 77723, '9841761067', '1999-11-20', 'CAKJ991120MFA', 'CAKJ991120HQRLMR03', '02179948001', NULL, 'IDMEX1684687545', 'NA', 'Maria marlene calderon (tia)', '9842246321', 'Avaluosygestoriapdcsc', 'Gestor', '2023-03-23', NULL, NULL, NULL, NULL, '{\"label\":\"NADIA OLIVA CANELA REYNA\",\"value\":55}', 'Gestoría', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402176464', 'JORDYCALDERON29@GMAIL.COM', 'jordycalderon29@gmail.com', NULL, NULL),
(35, 'Prueba', NULL, 'JESSICA JOHANA', 'RAMIREZ PUC', 0, NULL, '2023-11-10 02:55:49', '2024-02-22 21:11:50', 'PICOPANDOS MZ 1 LT 6 28, VILLAS DEL SOL', 77723, '9843091261', '1999-07-27', 'RAPJ9907272U4', 'RAPJ990727MYNMCS08', '10139903412', 'Licenciatura', 'IDMEX1637413252', 'NA', 'Luis Ramirez (hermano)', '9993542872', 'RHR83SC', NULL, '2022-02-11', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', NULL, NULL, '012180015378139784', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401463725', 'JESSICARAMIREZPUC@GMAIL.COM', NULL, NULL, NULL),
(36, 'Prueba', NULL, 'JONATHAN ALEJANDRO', 'COCOM AVILA', 0, NULL, '2023-11-10 03:48:28', '2024-02-22 21:12:40', 'C. 88 NTE MZ 455 LT 09 X 30 Y 35 MED VEC 235 MDG, COLOSIO', 77728, '9841686149', '1997-06-10', 'COAJ970610SU6', 'COAJ970610HQRCVN01', '23169741636', 'Licenciatura', 'IDMEX1823986207', 'NA', 'Brandon Cocom (Hermano)', '9842302090', 'RHR83SC', NULL, '2023-03-15', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402195678', 'COCOM_AVILA_1997@LIVE.COM', NULL, NULL, NULL),
(37, 'Prueba', NULL, 'JUAN MIGUEL', 'COLIN TELLEZ', 1, '2023-11-30', '2023-11-10 19:42:47', '2024-04-11 20:59:26', 'FRACC. BOSQUE REAL MZ 34 L1 CERRADA LOS SAUCES 2 CASA 37', 77724, '9841858094', '1995-03-30', 'COTJ950330KM9', 'COTJ950330HMCLLN00', '82139534505', 'Licenciatura', 'IDMEX2144443800', 'NA', 'Mariana Ibarra (Concubina)', '9842024368', 'Avaluosygestoriapdcsc', 'Auxiliar Legal', '2023-03-06', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, '012180015174385868', NULL, 'SA-9081', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '34', '-', NULL, 'JMCOLINTELLEZ@OUTLOOK.COM', 'aux.firmas@notaria83qroo.mx', NULL, NULL),
(38, 'Prueba', NULL, 'JULI BERENICE', 'ALVAREZ TORRES', 0, NULL, '2023-11-11 02:11:44', '2024-03-11 14:49:01', 'CALLE 48 AVENIDA 20 Y 25 NORTE, LUIS DONALDO COLOSIO 1 M 255 L 17', 77710, '98422381685', '2001-10-04', 'AATJ011004QT4', 'AATJ011004MQRLRLA1', '56170184008', 'Preparatoria', 'IDMEX1973795683', 'NA', 'Edwin Alvarez (Hermano)', '9841910367', 'RHR83SC', NULL, '2023-01-12', NULL, NULL, NULL, NULL, '{\"label\":\"GENNY JUDITH VARGUEZ DZIB\",\"value\":28}', NULL, '-', '012180015786452613', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401463576', 'BERE564@OUTLOOK.ES', 'jalvarez@notaria83qroo.mx', NULL, NULL),
(39, 'Prueba', NULL, 'JOSE ALEJANDRO', 'ORNELAS JUAREZ', 0, NULL, '2023-11-11 03:33:17', '2024-04-16 13:43:21', 'FRACC. VILLAMAR 1 M 12 L 1 CALLE PLAYA LINDA', 77710, '5514403524', '1997-12-14', 'OEJA971214BQ1', 'OEJA971214HDFRRL09', '42139710596', 'Preparatoria', 'IDMEX2119928165', 'NA', 'Marco Antonio (Hermano)', '5579879719', 'RHR83SC', NULL, '2023-02-23', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '27', '-', '646180146404484965', 'FUTAGUILA7@GMAIL.COM', NULL, NULL, NULL),
(40, 'Prueba', NULL, 'JAVIER', 'PADILLA AGUILAR', 0, '2025-10-21', '2023-11-13 20:51:45', '2024-10-30 14:12:18', 'FILIPINAS MZ 25 LT 1 CASA 25, VILLAMAR I', 77725, '9841542539', '2000-09-09', 'PAAJ0009099EA', 'PAAJ000909HGRDGVA6', '02180015980', 'Licenciatura', 'IDMEX1777519782', 'NA', NULL, NULL, 'Avaluosygestoriapdcsc', NULL, '2023-10-23', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', NULL, '-', NULL, NULL, 'SA-38600', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646910146402789191', 'JAVIERPADILLA09@HOTMAIL.COM', NULL, NULL, NULL),
(41, 'Prueba', NULL, 'JESSIKA FERNANDA', 'POLANCO ROJAS', 0, NULL, '2023-11-14 20:30:59', '2024-08-02 22:04:36', 'FRACC. MISIÓN DEL CARMEN MZ 44 L 1 CALLE MISIÓN DEL REFUGIO', 77710, '9848795936', '2003-03-16', 'PORJ0303168L3', 'PORJ030316MQRLJSA7', '56180354468', 'Preparatoria', 'IDMEX2077925299', 'NA', 'Erik Polanco (Papá)', '9841292626', 'RHR83SC', 'Facturista', '2023-06-29', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Administración', NULL, '012180015420177814', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '410 B', '-', '646690146402382847', 'FERRR.ROJAS@OUTLOOK.COM', 'aux.admon2@notaria83qroo.mx', NULL, NULL),
(42, 'Prueba', NULL, 'KAREN LIZETH', 'ROJAS CHAVEZ', 1, NULL, '2023-11-14 22:46:00', '2024-10-29 17:34:58', 'xpu-ha m6 l6 slt10 b19', 77723, '5566790899', '1992-07-13', 'rock9207139qa', 'rock920713mdfjhr09', '45099210275', NULL, 'idmex1909597169', 'NA', 'Aldo Castro (Pareja)', '5582328381', 'RHR83SC', 'Recepcionista', '2022-11-14', NULL, NULL, NULL, NULL, '{\"label\":\"DANIEL ALFONSO DOMINGUEZ CHAVEZ\",\"value\":149}', 'Recepción', '-', '4152313571311948', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402007669', 'KLIIZETH1392@GMAIL.COM', 'recepcion@notaria83.mx', NULL, NULL),
(43, 'Prueba', NULL, 'KEYREN', 'DOMINGUEZ HERNANDEZ', 0, NULL, '2023-11-15 01:32:47', '2024-07-31 16:28:25', 'FRACC, MISIÓN DEL CARMEN M12 L1, CALLE MISIÓN DEL CARMEN DE LA CONCEPCIÓN', 77710, '9841287593', '2000-06-18', 'DOHK000618GR1', 'DOHK000618MVZMRYA8', '73160043771', NULL, 'IDMEX1659758681', 'NA', NULL, NULL, 'RHR83SC', 'Auxiliar legal', '2023-02-01', NULL, NULL, NULL, NULL, '{\"label\":\"GENNY JUDITH VARGUEZ DZIB\",\"value\":28}', 'Atlanta', NULL, '012180015292118506', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '418 A', '-', '646690146402126948', 'KEYREN_DOM15@HOTMAIL.COM', 'kdominguez@notaria83qroo.mx', NULL, NULL),
(44, 'Prueba', NULL, 'LIZBET GUADALUPE', 'DE JESUS PEREZ', 0, NULL, '2023-11-15 02:21:23', '2024-08-02 22:05:09', 'PASEOS DE XCACEL M6 L3 AVENIDA CONSTITUYENTES DEPTO 18D EDIFICIO 9', 77723, '5553806620', '1994-06-29', 'JEPL9406292J5', 'JEPL940629MDFSRZ02', '16139439034', 'Licenciatura', 'IDMEX2464813730', 'NA', 'rosa perez (tia)', '5553806620', 'RHR83SC', 'Auxiliar legal', '2023-02-27', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'LDEJESUS.IUS.INC@GMAIL.COM', 'gperez@notaria83qroo.mx', NULL, NULL),
(45, 'Prueba', NULL, 'LUIS ALBERTO', 'GARCIA RODRIGUEZ', 0, '2022-01-25', '2023-11-15 03:05:11', '2024-04-16 14:04:30', 'VILLAS DEL SOL V M 2 L 4 CALLE CARPINTEROS', 77710, '9841798400', '1990-10-23', 'GARL901023GE2', 'GARL901023HTCRDS07', '83099005353', 'Preparatoria', 'IDMEX1406492811', 'NA', 'Leticia Martinez (AMIGO)', '9841408277', 'Avaluosygestoriapdcsc', 'Gestor', '2020-11-03', NULL, NULL, NULL, NULL, '{\"label\":\"NADIA OLIVA CANELA REYNA\",\"value\":55}', 'Gestoría', '2314179682', '012691015156209817', NULL, 'LM-042740', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '24', '-', '646690146401463424', 'LUG_CIA90@HOTMAIL.COM', 'lug_cia90@hotmail.com', NULL, NULL),
(46, 'Prueba', NULL, 'LIZZETH NAYELI', 'BALAM COLLI', 1, NULL, '2023-11-15 03:51:40', '2024-04-11 22:06:55', 'MZ 08 L2 135 AV POR C 3 Y 5 SUR', 77712, '9842112011', '1998-11-27', 'BACL9811279T3', 'BACL981127MQRLLZ09', '15169868112', 'Licenciatura', 'IDMEX1590000171', 'NA', 'Flora Colli (mama)', '9841789109', 'RHR83SC', 'Abogado Jr', '2019-04-08', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401484076', 'LIZZETH_NAYELI13@HOTMAIL.COM', 'lbalam@notaria83qroo.mx', '-', NULL),
(47, 'Prueba', NULL, 'MARIA DE LA LUZ', 'MARTINEZ MARTINEZ', 0, NULL, '2023-11-15 21:20:24', '2025-01-03 15:45:08', 'MISIÓN DE LAS FLORES III M 2 L 3, CALLE VILLA CARPINTERO EDIFICIO 12', 77710, '5510151800', '1993-07-26', 'MAML930726PK9', 'MAML930726MMNRRZ03', '94119376880', 'Licenciatura', 'IDMEX2018710298', 'NA', 'Victor Hernandez (Pareja)', '5583424391', 'RHR83SC', 'Coordinador administrativo', '2020-02-07', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Administración', '-', '012180015634813210', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '24 D', '-', '646690146401407176', 'LUXMA9326@GMAIL.COM', 'lmartinez@notaria83qroo.mx', NULL, NULL),
(48, 'Prueba', NULL, 'MARIANA DEL ROSARIO', 'BALAM MARTIN', 0, NULL, '2023-11-15 22:23:48', '2024-12-31 14:50:02', 'ISLAS FILIPINAS 10 MZ 24 LT 10 MISIÓN VILLAMAR II', 77725, '9841798230', '1996-06-29', 'BAMM960629NR6', 'BAMM960629MYNLRR09', '4216962638-1', 'Licenciatura', 'IDMEX13117982131', 'NA', 'Yolanda Martín (Madre)', '9841550321', 'RHR83SC', 'Abogado Jr', '2022-09-07', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, NULL, NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401852417', 'BALAMMTN@GMAIL.COM', 'mbalam@notaria83qroo.mx', NULL, NULL),
(50, 'Prueba', NULL, 'MAYDE JANET', 'VERA GUZMAN', 1, NULL, '2023-11-15 23:26:39', '2024-07-11 14:47:42', 'misión de las flores i m 51 l 3, calle nardos', 77710, '9841450570', '1986-08-18', 'vegm860818gx8', 'vegm860818mqrrzy08', '82048628505', 'Preparatoria', 'idmex1605548360', 'NA', 'Neri Lazaro (esposo)', '9841202421', 'RHR83SC', 'Encargada de archivo', '2023-02-15', NULL, NULL, NULL, NULL, '{\"label\":\"ERIKA ANTONIA ZUÑIGA VAZQUEZ\",\"value\":21}', 'Archivo', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.5', '-', NULL, 'CARNALITA0886@GMAIL.COM', 'ezuniga@notaria83qroo.mx', NULL, NULL),
(51, 'Prueba', NULL, 'MIRNA MERCEDES', 'VELAZQUEZ CONTRERAS', 0, NULL, '2023-11-16 01:36:09', '2024-08-02 22:05:22', 'MZ 7 LT 2 AV. CANCUN V.4543 FRACC. GUADALUPANA', 77724, '9841966094', '2001-01-31', 'VECM010131HA5', 'VECM010131MTCLNRA2', '08160140888', NULL, 'IDMEX1833232411', 'NA', NULL, NULL, 'RHR83SC', 'Capturista', '2023-09-08', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402518844', 'MVELAZQUEZC031@GMAIL.COM', 'mvelazquez@notaria83qroo.mx', NULL, NULL),
(53, 'Prueba', NULL, 'NELI MARBELLA', 'CHAN CHAN', 0, NULL, '2023-11-16 02:39:56', '2024-07-24 13:42:07', 'CALLE 82 AV. 15 Y 20  NTE, luis donaldo colosio ii m 433 l9', 77710, '9843233955', '1998-08-20', 'CACN980820GU6', 'CACN980820MYNHHL04', '20169858022', 'Preparatoria', 'IDMEX1509382442', 'NA', 'ESTELO CHAN CANCHE (Padre)', '9851462592', 'RHRVIVIENDASC', NULL, '2022-02-14', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', NULL, '-', '4152313949675255', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401462975', 'NELI.MARBELLA4@GMAIL.COM', 'nchan@notaria83qroo.mx', NULL, NULL),
(55, 'Prueba', NULL, 'NADIA OLIVA', 'CANELA REYNA', 0, NULL, '2023-11-16 03:41:25', '2024-07-31 16:28:05', 'C. PLAYA CHEMUYIL # 4D MZ 1 L 4, SL 2 PRIVADA PLAYA AKUMAL, MISIÓN LAS FLORES', 77723, NULL, '1989-06-03', 'CARN890603EJ3', 'CARN890603MVZNYD09', '48128927547', 'Licenciatura', 'IDMEX1918713093', 'NA', 'Ilse Canelo Reyna (Hermana)', '2291450502', 'RHR83SC', 'Auxiliar administrativo', '2022-08-24', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Administración', NULL, '012180015296068461', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, '-', '646690146401825172', 'NADIAO.CANELA@GMAIL.COM', 'gestoria@notaria83qroo.mx', NULL, NULL),
(56, 'Prueba', NULL, 'NEIDY IMELDA', 'CASTILLO JIMENEZ', 1, '2022-11-23', '2023-11-16 21:02:49', '2024-04-12 20:30:05', 'SM 2 MZ 03 LT 7 PALOMAS #21, VILLAS DEL SOL II F.', 77710, '9842159409', '1986-12-07', 'CAJN861207HN0', 'CAJN861207MYNSMD07', '82118607363', 'Licenciatura', 'IDMEX1810636599', 'NA', 'Wendy Castillo (Hermana)', '9878006252', 'RHR83SC', 'Titular de Avisos y Sistemas Notariales', '2021-04-21', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Avisos y Sistemas Notariales', '3115131241', '012694015746445460', NULL, 'SA-060493', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646910146401472894', 'NEIDYCASTILLO48@GMAIL.COM', 'ncastillo@notaria83qroo.mx', NULL, NULL),
(57, 'Prueba', NULL, 'OLIVIA', 'PALE MOSHAN', 1, NULL, '2023-11-16 22:12:19', '2024-12-31 18:16:47', '15 SUR X 100 Y 105 MZ 30 LT 04 COLONIA FORJADORES', 77716, '9842533705', '1991-04-26', 'PAMO910426PQ3', 'PAMO910426MCSLSL00', '82099130468', 'Secundaria', 'IDMEX1161180901', 'NA', 'Olivia Pale (mama)', '9842533705', 'RHR83SC', 'Limpieza', '2022-02-16', NULL, NULL, NULL, NULL, '{\"label\":\"FERNANDO ALEXIS MARTÍNEZ AGUILAR\",\"value\":168}', 'Recursos Materiales', NULL, '4152313657559931', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'OLIVIAPALE2@GMAIL.COM', NULL, NULL, NULL),
(58, 'Prueba', NULL, 'OSMAR ZIAMED', 'MORENO CORTEZ', 1, NULL, '2023-11-17 02:26:52', '2024-11-20 22:40:45', 'MISION VILLAMAR I M 35 L 2 AVENIDA 125 PTE', 77710, '9842287691', '2001-02-27', 'MOCX010227UQ2', 'MXCO010227HQRRRSA9', '08160150408', NULL, 'IDMEX1896683490', 'NA', 'Zita Cortez (Madre)', '9996463398', 'RHR83SC', 'Auxiliar contable', '2022-08-22', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Contabilidad', '-', '0125 8001 5167 907882', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.2450', '-', '646100146402336231', 'OSMARZIAMEDM@GMAIL.COM', 'aux.admon@notaria83qroo.mx', NULL, NULL),
(59, 'Prueba', NULL, 'RAMONA DE JESUS', 'PECH GOMEZ', 1, NULL, '2023-11-17 03:53:54', '2024-04-15 17:57:59', 'CALLE 95 SUR MZ 29 LT 3, 9 Y 11 EJIDO, COL. EJIDO SUR', 77712, '9842655893', '1990-04-08', 'PEGR900408PX9', 'PEGR900408MYNCMM03', '84119014110', 'Preparatoria', 'IDMEX1753015804', 'NA', 'Gustavo Alvarado (Pareja)', '9841541011', 'RHR83SC', 'Coordinadora de cierres', '2022-12-06', NULL, NULL, NULL, NULL, '{\"label\":\"GENNY JUDITH VARGUEZ DZIB\",\"value\":28}', 'Cierres', '-', '002694701668564594', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402021069', 'ROMIPECH27@GMAIL.COM', 'rpech@notaria83qroo.mx', '-', NULL),
(60, 'Prueba', NULL, 'REYNA ISABEL', 'KU MORENO', 1, '2023-03-13', '2023-11-17 20:30:35', '2024-04-11 20:40:39', 'SM 66 MZA 4 L 1 N°5, PUERTO RICO, MUNDO HABITAT', 77714, '9981499661', '1980-02-18', 'KUMR800218MG2', 'KUMR800218MQRXRY05', '82968003176', 'Licenciatura', 'IDMEX0694077240695', 'NA', 'Wendy Ku (hermana)', '9831144270', 'RHRVIVIENDASC', 'Administrador Infonavit', '2021-07-15', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Administración', '2310166492', '014320567820138222', NULL, 'SC-036935', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401462933', 'REYNA.IKM@GMAIL.COM', 'infonavit.admon@notaria83.mx', NULL, NULL),
(61, 'Prueba', NULL, 'SEIDY YARELY', 'COLLI BLANCO', 1, NULL, '2023-11-17 22:09:20', '2024-04-11 22:20:32', 'FRACC. MUNDO HABITATT M 10 L 2 CALLE COLOMBIA', 77710, '9841307928', '1997-02-22', 'COBS970222QFA', 'COBS970222MYNLLD12', '23169741701', 'Licenciatura', 'IDMEX1690071558', 'NA', 'Teresa Blanco (Mamá)', '9841516797', 'RHR83SC', 'Abogado Jr', '2019-09-17', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', '-', '4152 3139 3231 2387', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.5', '-', '646690146401484000', 'SEYDI.COLLI@GMAIL.COM', 'scolli@notaria83qroo.mx', NULL, NULL),
(62, 'Prueba', NULL, 'SUEELEN HAYDE', 'VILLAGOMEZ SANTILLAN', 1, NULL, '2023-11-17 22:55:19', '2024-04-11 22:20:48', 'PLAYA HOLBOX  M.2 L. 6 SL. 10 20B, FRACC. PASEOS XCACEL, MISIÓN LAS FLORES', 77723, '5587375156', '1993-01-03', 'VISS9301038QA', 'VISS930103MMCLNL04', '93119322670', 'Licenciatura', 'IDMEX2131719839', 'NA', 'Fernando Robles (Pareja)', '5635961817', 'RHR83SC', 'Abogado Jr.', '2022-08-01', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', '-', '012180015858493254', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401797297', 'SUEELEN.VILLAGOMEZ@GMAIL.COM', 'svillagomez@notaria83qroo.mx', NULL, NULL),
(63, 'Prueba', NULL, 'SARA', 'HERNANDEZ SANCHEZ', 1, NULL, '2023-11-17 23:50:12', '2024-08-19 22:17:54', 'FRACC. BOSQUE REAL  M 35 L 1 CERRADA LOS SAUCES 4', 77710, '9841253843', '1979-08-28', 'HESS7908281J5', 'HESS790828MQRRNR03', '82957710815', 'Licenciatura', 'IDMEX2264022701', 'NA', 'Javier Antonio Parra Alcocer (pareja)', '9841294219', 'RHR83SC', 'Auxiliar de titulación', '2022-06-20', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '2306060794', '014694605742264299', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.23', '-', '646690146401923265', 'SARINGA7908@GMAIL.COM', 'aux.titulacion@notaria83qroo.mx', NULL, NULL),
(64, 'Prueba', NULL, 'SABRINA GUADALUPE', 'AGUILAR TRINIDAD', 1, NULL, '2023-11-23 02:16:02', '2024-08-19 20:22:12', 'AVENIDA 75 DIAG. % 3 Y 5 SUR MZ 231 L1 EJIDO SUR, ORDEN DE REFERENCIA 239966', 77712, '9841060251', '2001-12-12', 'AUTS0112128F5', 'AUTS011212MQRGRBA5', '46160117472', NULL, 'IDMEX2320109218', 'NA', 'Emma Aguilar (Hermana)', '9841436217', 'RHR83SC', 'Auxiliar legal', '2023-09-25', NULL, NULL, NULL, NULL, '{\"label\":\"GENNY JUDITH VARGUEZ DZIB\",\"value\":28}', 'Atlanta', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, '-', '646690146402550873', 'AGUILARSABRINA1201@GMAIL.COM', 'aux.cierres3@notaria83qroo.mx', NULL, NULL),
(66, 'Prueba', NULL, 'SERGIO ELI', 'ROBLERO MIS', 1, '2023-11-09', '2023-11-24 22:28:48', '2024-08-19 22:27:43', 'COL. EJIDAL V M 39A L 15 CALLE 7 SUR 110 Y 115 AV.', 77710, '9842796126', '1997-07-10', 'ROMS9707102D7', 'ROMS970710HQRBSR02', '54159754982', 'Preparatoria', 'IDMEX1320949851', 'NA', 'Francisca Mis Ku (madre)', '9848762991', 'RHRVIVIENDASC', 'Auxiliar legal', '2021-01-10', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '127694013514233995', NULL, 'SM-6356', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '9500509202472114345', 'SERGIO_ROBLERO@OUTLOOK.ES', 'sroblero@notaria83qroo.mx', NULL, NULL),
(67, 'Prueba', NULL, 'SARA', 'JUAREZ RESENDIZ', 1, NULL, '2023-11-25 03:02:01', '2024-12-03 15:15:33', 'sm59 mz 12 l1 av. petempich l 27 pcn  galaxia del carmen', 77723, '7721063519', '1995-10-17', 'jurs951017jm6', 'jurs951017mhgrsr01', '13149505318', 'Licenciatura', 'idmex1647135472752', 'na', 'Diana Juarez (Hermana)', '9841155797', 'RHR83SC', 'Auxiliar legal', '2023-02-07', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '-', '012180015710822280', NULL, NULL, NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1733238933_custom_filename.jpg', '-', '-', '646690146402243056', 'SARA171095@HOTMAIL.COM', 'sjuarez@notaria83qroo.mx', NULL, NULL),
(68, 'Prueba', NULL, 'SANTOS OMAR', 'CARRILLO MORAN', 0, NULL, '2023-11-30 22:25:12', '2024-08-02 22:05:37', 'FLOR DE ACANTO MZ 33 LT 1 # 82 LAS PALMAS II', 77710, '9841370592', '1997-05-20', 'CAMS970520BJ0', 'CAMS970520HVZRRN08', '02189757947', 'Licenciatura', 'IDMEX1563396467', 'NA', 'Veronica moran (mama)', '9848790392', 'RHR83SC', 'Auxiliar de archivo', '2023-02-27', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', '-', NULL, NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', NULL, 'SANTOS_OMAR97@HOTMAIL.COM', 'aux.archivo6@notaria83qroo.mx', NULL, NULL),
(69, 'Prueba', NULL, 'SILVIA ADRIANA', 'QUIROZ JUAREZ', 0, NULL, '2023-11-30 23:51:13', '2024-07-24 13:42:20', 'villas del carmen plus m 4 l 8 calle albatros 1', 77710, '7551398443', '1987-02-20', 'qujs870220f37', 'qujs870220mgrrrl02', '72068729333', 'Preparatoria', 'idmex2321266453', 'N/A', 'Jared Ceballos (Esposo)', '7551426426', 'RHR83SC', 'Auxiliar de Avisos y Sistemas', '2023-06-17', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '10', '-', '646690146402418711', 'ADRIANA _QJ@HOTMAIL.COM', 'squiroz@notaria83qroo.mx', NULL, NULL),
(70, 'Prueba', NULL, 'TAHIMY VLADAMIR', 'POOL KU', 1, NULL, '2023-12-01 18:27:05', '2025-02-05 17:46:15', 'ISLAS DE CABO VERDE MZ 01 LT 02 #57 VILLAMAR I', 77725, '9981908378', '1991-04-28', 'POKT910428P30', 'POKT910428MYNLXH01', '05149134677', 'Licenciatura', 'IDMEX1565573763', 'NA', 'Clara Ku Vega (Madre)', '9865937418', 'RHR83SC', 'Abogada Corporativa', '2018-10-01', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Francia', NULL, '012694015946256734', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401477397', 'TAY_PER_984@HOTMAIL.COM', 'tahimyku@notaria83qroo.mx', NULL, NULL),
(71, 'Prueba', NULL, 'TERESA DE JESÚS', 'RODRIGUEZ CHI', 1, NULL, '2023-12-01 22:06:28', '2024-04-11 21:01:18', 'FRACC. VILLAS LAS PERLAS M1 L 29 CALLE PALOMA 01', 77723, '9838361469', '1998-04-19', 'ROCT980419S98', 'ROCT980419MQRDHR04', '42169811165', 'Licenciatura', 'IDMEX1760884978', 'NA', 'Jonatan Emanuel Herrera Chi (Pareja)', '9838098701', 'RHR83SC', 'Abogado Jr', '2023-05-23', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, '012180015995461068', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '64', '-', '646690146401642915', 'RGUEZ1998@GMAIL.COM', 't.rodriguez@notaria83qroo.mx', NULL, NULL),
(72, 'Prueba', NULL, 'VICTOR ALFONSO', 'CETZ CUERVO', 1, NULL, '2023-12-01 22:52:57', '2024-08-19 22:34:14', 'AV. ISLA ARUBA EDIFICIO H FRACC. PASEOS DEL MAR', 77519, '9982020454', '1988-05-07', 'CECV880507QX3', 'CECV880507HQRTRC09', '-', 'Licenciatura', 'IDMEX1340671231', 'NA', 'Suleyma Guzman (Hermana)', '2281145067', 'RHR83SC', 'Auxiliar de firmas/Cancún', '2022-11-07', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '2316109675', '044694256002592512', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401982293', 'VICETZ880507@GMAIL.COM', 'vcetz@notaria83qroo.mx', '-', NULL),
(73, 'Prueba', NULL, 'YAMILI', 'CHI NAAL', 1, NULL, '2023-12-04 22:30:56', '2024-04-11 22:21:53', 'MZ 272 LT 9 C 50 %  AVENIDA 35 Y 40, COLOSIO', 77728, '9842805260', '2000-11-19', 'CINY001119UE5', 'CINY001119MQRHLMA3', '38160064390', 'Licenciatura', 'IDMEX1792733534', 'NA', 'Mauricio Chi (Papá)', '9843168545', 'RHR83SC', 'Auxiliar legal', '2022-06-16', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', '-', '4152 3138 9020 8734', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401700226', 'YAMILICN120@GMAIL.COM', 'yamili@notaria83qroo.mx', NULL, NULL),
(74, 'Prueba', NULL, 'YAZMIN DEL CARMEN', 'ANCHEYTA HERNANDEZ', 1, NULL, '2023-12-05 18:04:45', '2024-04-12 20:31:16', 'VILLAS DEL SOL II M 7 L 4 AV. DE LAS GARZAS', 77710, '9841969003', '2001-12-12', 'AEHY0112209H2', 'AEHY011220MQRNRZA0', '27170160835', 'Licenciatura', 'IDMEX2159516324', 'NA', 'Mario Luis Ancheyta (Papá)', '9841691699', 'RHR83SC', 'Auxiliar de Avisos y Sistemas', '2023-10-02', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', '-', '012180015389345732', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '44', '-', '646690146401541100', 'ANCHEYTAHERNANDEZYAZMIN@GMAIL.COM', 'yazmin.hernandez@notaria83qroo.mx', NULL, NULL),
(75, 'Prueba', NULL, 'JIMENA', 'GARCIA SANABRIA', 0, NULL, '2023-12-08 16:23:48', '2024-10-25 18:41:06', 'MZ 12 LT6 C 1RA X 65 70 AV NTE DEPTO 402, EJIDO SUR', 77712, '9842169271', '1981-05-12', 'GASJ810512QK8', 'GASJ810512MDFRNM00', '39978145868', 'Licenciatura', 'idmex2109396756', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Recepcionista', '2023-12-11', NULL, NULL, NULL, NULL, '{\"label\":\"DANIEL ALFONSO DOMINGUEZ CHAVEZ\",\"value\":149}', 'Legal', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', NULL, 'JGSANABRIA@GMAIL.COM', 'recepcion@notaria83.mx', NULL, NULL),
(76, 'Prueba', NULL, 'ALAN DAVID', 'POLANCO SANTOS', 1, NULL, '2023-12-12 21:35:53', '2024-08-19 22:34:23', 'CALLE 30 NORTE SM 093 M 119 L 19 COLONIA NORA QUINTANA', 77520, '9983849196', '1994-08-04', 'POSA9408045Q6', 'POSA940804HQRLNL08', '19169403722', 'Preparatoria', 'IDMEX0020131207955', 'NA', 'Marcos Caamal (pareja)', '9982461722', 'Avaluosygestoriapdcsc', 'Abogado Sr', '2018-08-15', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Berlín', NULL, '4152313932312429', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401475302', 'POLANCOSANTOSALAN@GMAIL.COM', 'alanpolanco780@gmail.com', NULL, NULL),
(77, 'Prueba', NULL, 'ANA ISABEL', 'FERADO CALLEROS', 1, NULL, '2023-12-12 21:58:52', '2024-08-19 23:02:23', 'PASEO DE LAS PALMAS 45 PALMA ARECA Y PALMAS KERPIS, COLONIA LAS PALMAS', 28017, '3319183778', '1994-06-24', 'FECA940624EC0', 'FECA940624MCMRLN05', '05219447827', 'Licenciatura', 'IDMEX2125852867', 'NA', 'NANCY ELIZABETH CALLEROS (MAMA)', '3121693450', 'Avaluosygestoriapdcsc', 'Abogado Sr', '2022-04-18', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Chicago', NULL, '012090015120624058', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, '-', '-', 'AFERADOCALLEROS@GMAIL.COM', 'ana.isabel@notaria83.mx', NULL, NULL),
(78, 'Prueba', NULL, 'ARMANDO', 'ALVARADO RUIZ', 0, NULL, '2023-12-12 22:19:32', '2024-03-11 16:02:03', 'AV. 10 MZ 61 LT. 07 C. 28 DEP. 203 FRENTE AL MARIO VILLANUEV. COLONIA CENTRO', 77710, '9981688658', '1988-06-26', 'AARA880626P12', 'AARA880626HQRLZR00', '82108816867', 'Licenciatura', 'IDMEX1909537956', 'NA', 'Armando Alvarado Villagomez', '9981735150', 'RHR83SC', NULL, '2019-11-08', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', NULL, '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', NULL, 'AALVARADO@NOTARIA83.MX', NULL, NULL, NULL),
(79, 'Prueba', NULL, 'DIANA ESMERALDA', 'RAMOS OLVERA', 1, NULL, '2023-12-13 20:56:43', '2024-08-19 23:02:00', 'mz 6 lt 15 #15 c. seybaplaya, colonia villa maya', 77723, '9841356821', '1987-06-05', 'raod870605234', 'raod870605mdfmln07', '11108701910', 'Licenciatura', 'idmex0874105244282', 'na', 'Jonathan Conde', '9841356568', 'RHR83SC', 'Gerente de Administración', '2018-09-05', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Administración', '-', '-', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401463631', 'DIANAERAMOS@ME.COM', 'dramos@notaria83.mx', '-', NULL),
(80, 'Prueba', NULL, 'JENNIFER JAZMIN', 'BASURTO BALDOMERO', 0, NULL, '2023-12-14 15:35:17', '2024-08-02 22:05:52', 'SM18 MZ 31 LT 20 CASA A PTO MORELOS VELERO AV TIMON Y COL. VILLAS MORELOS 1', 77580, '559381760', '1997-11-08', 'BABJ971108GZ4', 'BABJ971108MDFSLN04', '09139709746', 'Licenciatura', 'IDMEX2189238003', 'NA', 'Ren guzman (esposo)', '5583311116', 'Avaluosygestoriapdcsc', 'Abogada Corporativa', '2023-05-15', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Francia', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'JAZB.BALDOMERO@GMAIL.COM', 'jbasurto@notaria83qroo.mx', NULL, NULL),
(81, 'Prueba', NULL, 'KAREN EUNICE', 'TORRES REYES', 1, NULL, '2023-12-18 14:37:07', '2024-08-19 23:02:45', 'MZ 08 LT 01 #1 133 FLAMINGOS, VILLAMAR I', 77725, '9842568837', '1997-03-11', 'TORK970311J78', 'TORK970311MVZRYR08', '26149782174', 'Licenciatura', 'IDMEX1591372754', 'NA', 'Oralia Reyes (madre)', '9841901075', 'Avaluosygestoriapdcsc', 'Abogado Sr', '2017-08-01', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Atlanta', '-', '012694015351832329', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401484050', 'karetorres1114@gmail.com', 'karen@notaria83.mx', NULL, NULL),
(82, 'Prueba', NULL, 'MARIA YESICA', 'HERNANDEZ BUENO', 0, NULL, '2023-12-18 16:10:17', '2024-03-11 14:49:51', 'FRACC. REAL IBIZA II M1 L4 CALLE PASEO PALMARES AV. CIGUEÑAS Y AV. SUR, EDIFICIO B, CONDOMINIO BONELy', 77723, '5611727166', '1976-01-21', 'HEBY760121IZ5', 'HEBY760121MDFRNS03', '92957617654', 'Licenciatura', 'IDMEX1394213148', 'NA', 'Maribel Bueno (Madre)', '5519217515', 'RHR83SC', NULL, '2022-09-05', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', NULL, '915058019', '-', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146401981171', 'YESICA.HERNANDEZ@VIHER.COM.MX', NULL, '-', NULL);
INSERT INTO `personal` (`id`, `actualContract`, `dateContractFinish`, `name`, `lastName`, `activo`, `id_check`, `created_at`, `updated_at`, `direction`, `cp`, `phone`, `birthday`, `rfc`, `curp`, `nss`, `school`, `ine`, `alergist`, `personalContact`, `phoneContact`, `empresa`, `puesto`, `ingreso`, `id_empleado`, `id_jefe_inmediato`, `id_departamento`, `id_puesto`, `inmBoss`, `wArea`, `infonavit`, `numCart`, `company`, `idLicNum`, `documents`, `contracts`, `documentsCompany`, `removeColaborator`, `img`, `numExt`, `utalla`, `numCarttwo`, `email`, `emailCompany`, `checkCode`, `ext_tel`) VALUES
(83, 'Prueba', NULL, 'MIRIAM NINZARINDARI', 'OVILLA CORZO', 1, NULL, '2023-12-18 19:00:27', '2024-09-30 21:26:12', 'FRACC. REAL BILBAO MZ 4  LT 003 PASEO BILBAO NORTE, CONDOMINIO ARETA', 77723, '9671212505', '1993-02-12', 'OICM930212RF7', 'OICM930212MCSVRR07', '68169366447', 'Licenciatura', 'IDMEX1738127379671', 'NA', 'Rogelio Ovilla Aguilera (PADRE)', '9611669782', 'Avaluosygestoriapdcsc', 'Abogado Jr', '2017-08-01', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Estocolmo', '-', '257987900017', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '305-E3', '-', '-', 'MIRIAMCORZO126@GMAIL.COM', 'miriam@notaria83.mx', '-', NULL),
(84, 'Prueba', NULL, 'MERLY RUBI', 'RAMOS CANUL', 1, NULL, '2023-12-18 22:27:20', '2024-08-19 23:03:21', 'LAS PALMAS II M 115 LT 1 CALLE PALMA YAREY 2', 77710, '9999188817', '1987-09-14', 'RACM870914QIA', 'RACM870914MYNMNR01', '82108708239', 'Licenciatura', 'idmex1484881484', 'NA', 'Reina Ramos Canul', '9841799013', 'Avaluosygestoriapdcsc', 'Abogado Sr.', '2018-08-14', NULL, NULL, NULL, NULL, '{\"label\":\"ARMANDO ALVARADO RUIZ\",\"value\":78}', 'Dallas', '-', '072691003145136859', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.33', '-', '-', 'RUBIRAMOS140987@GMAIL.COM', 'merly@notaria83.mx', '-', NULL),
(85, 'Prueba', NULL, 'REBECA AURORA', 'GONZALEZ RUIZ', 1, NULL, '2023-12-19 20:51:41', '2024-08-19 22:39:51', 'sm 313 m 10 l1 01 up 15 alamos  AV. FONATUR, SM 311 ALAMOS I, II', 77533, '9983247849', '1980-07-06', 'GORR800706IT5', 'GORR800706MVZNZB08', '62968065581', 'Licenciatura', 'IDMEX1288665671', 'NA', 'Octavio Alborez (Pareja)', '9841158115', 'RHR83SC', 'Gerente de Capital Humano', '2023-06-01', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Recursos Humanos', '2315007224', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'LICREBECA.RH@GMAIL.COM', 'capital.humano@notaria83.mx', NULL, NULL),
(86, 'Prueba', NULL, 'LILIBET', 'VAZQUEZ RAMIREZ', 1, NULL, '2023-12-20 15:27:04', '2024-04-11 20:39:36', 'R 43 SM 1 M 6 L 6 C. GUACO #26 VILLAS DEL SOL', 77725, '9841081058', '1995-06-28', 'VARL950625371', 'VARL950625MCSZML04', '35149525665', 'Licenciatura', 'IDMEX2205597064', 'NA', '-', '9861533241', 'RHR83SC', 'Cuentas por cobrar', '2024-01-02', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Administración', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402712938', 'VAZQUEZRAMIREZLILI@GMAIL.COM', 'cuentasporcobrar@notaria83qroo.mx', NULL, NULL),
(87, 'Prueba', NULL, 'WILBER ALBERTO', 'ORTIZ RODRIGUEZ', 1, NULL, '2023-12-21 18:17:30', '2024-07-10 23:12:32', 'c.3 sur bis lt 8 x 40 y 45 ave colonia centro, solidaridad, q. r.', 77710, '9935757628', '1993-04-05', 'oirw930405m70', 'oirw930405htcrdl04', '83129323156', 'Preparatoria', 'idmex2540301962', 'N/A', NULL, NULL, 'Avaluosygestoriapdcsc', 'Gestor', '2023-12-26', 15, NULL, NULL, NULL, '{\"label\":\"NADIA OLIVA CANELA REYNA\",\"value\":55}', 'Gestoría', '2720025286', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1720653152_custom_filename.jpg', '-', '-', '646690146402711861', 'MYFORYOU09876@GMAIL.COM', 'myforyou9876@gmail.com', '-', NULL),
(88, 'Prueba', NULL, 'ANGEL EDUARDO', 'LIMÓN REYNOSO', 1, '2025-07-14', '2023-12-21 19:00:40', '2024-02-22 18:32:47', 'LAGO CHALCO 3 A 101 FELIPE CARRILLO PUERTO Y LAGUNA DEL CARMEN, ANAHUAC I SECCIÓN, miguel hidalgo cdmx', 11320, '5584186447', '1992-06-29', 'LIRA920629NF2', 'LIRA920629HDFMYN03', '94099214945', 'Preparatoria', 'IDMEX1339423063', 'NA', 'María Velia Reynoso (Mamá)', '5526634289', 'Avaluosygestoriapdcsc', NULL, '2023-08-15', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', NULL, '-', '012180015242661760', NULL, 'N15557706', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646420146408810567', 'ANGELREYNOSOSO22032906@GMAIL.COM', 'angelreynososo22032906@gmail.com', NULL, NULL),
(89, 'Prueba', NULL, 'RAMÓN ROLANDO', 'HEREDIA RUIZ', 1, NULL, '2023-12-21 22:14:45', '2024-08-19 23:04:14', 'Paseo Xaman Ha Mz 13 Lt 12 Playacar II CP 77710', 77710, '9982382735', '1976-07-13', 'HERR7607133K3', 'HERR760713HYNRZM09', '82067605582', NULL, NULL, NULL, 'ALEXANDRA DEL SOCORRO RUBIO CETZ', '9981169321', 'RHR83SC', 'Notario Titular', '2019-09-01', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Legal', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'NOTARIOHEREDIA@NOTARIA83.MX', 'notarioheredia@notaria83.mx', NULL, NULL),
(90, 'Prueba', NULL, 'MAYRA AZUCENA', 'ROSADO BORGES', 0, NULL, '2024-01-03 20:55:39', '2024-07-24 13:42:45', 'AVE 25 X JUAREZ Y 2 NTE JUAREZ Y 2NTE COLONIA CENTRO', 77710, '9868668217', '2000-04-10', 'ROBM000410LN1', 'ROBM000410MYNSRYA0', '63150002416', 'Licenciatura', 'IDMEX1707137747', '-', 'Abraham Rosado (Papá)', '9842136707', 'RHR83SC', NULL, '2023-01-02', 28, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', NULL, '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'MAYRAROSADOBORGES18@GMAIL.COM', 'pasante7@notaria83qroo.mx', NULL, NULL),
(91, 'Prueba', NULL, 'KEVIN', 'PEDRAZA CAMILO', 1, NULL, '2024-01-05 15:47:39', '2024-10-29 17:33:30', 'zaragoza sur 804 bandera nacional y pv cristobal, el chamizal col 050, texmelucan, puebla', 74088, '2227707973', '1991-05-20', 'peck9105209a9', 'PECK910520HPLDMV05', '76509100012', 'Licenciatura', 'IDMEX1909499137', 'NA', '-', NULL, 'RHR83SC', 'Coordinador administrativo', '2019-05-20', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Administración', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'KPEDRAZACAMILO@GMAIL.COM', 'cuentasporpagar@notaria83.qroo.mx', NULL, NULL),
(92, 'Prueba', NULL, 'XAIDANI ALITZEL', 'PERALTA INFANTE', 0, NULL, '2024-01-15 15:12:55', '2024-02-22 21:14:48', 'CALLE LINOS MZ 17 LT 3 VIV 79 LILI, MISIÓN LAS FLORES, SOLIDARIDAD, Q.R.', 77723, '9841579998', '1999-05-25', 'PEIX990529TB1', 'PEIX990529MDFRND09', '02189905884', 'Preparatoria', 'IDMEX2546742565', 'N/A', 'Ruben Aguilar (pareja)', '9842563114', 'RHR83SC', NULL, '2024-01-10', 150, NULL, NULL, NULL, '{\"label\":\"ERIKA ANTONIA ZUÑIGA VAZQUEZ\",\"value\":21}', NULL, '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '-', 'XADANI990529@GMAIL.COM', NULL, NULL, NULL),
(93, 'Prueba', NULL, 'LUIS MANUEL', 'CASTILLO NÚÑEZ', 0, '2029-01-30', '2024-02-07 20:54:51', '2024-07-24 13:42:49', 'mz 414 lt 20 calle 22 colosio, solidaridad, qroo', 77728, '9844435407', '1995-02-20', 'canl9502203t6', 'canl950220HMSSXS06', '66169519494', 'Licenciatura', 'idmex2405139619', 'N/A', 'Guadalupe Núñez Quesada (mamá)', '7779582799', 'Avaluosygestoriapdcsc', 'Auxiliar de Firmas', '2024-01-25', 151, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '012545015027207845', NULL, '0013791', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646690146402774442', 'LU-IS0070@HOTMAIL.COM', 'lu-is0070@hotmail.com', NULL, NULL),
(94, 'Prueba', NULL, 'ADDY YOLANDA', 'POOT DZIB', 1, NULL, '2024-02-09 17:29:27', '2024-08-19 23:04:42', 'MZ.11 LT. 5 C. 16 X 85 90 AV NTE COLONIA EJIDO, SOLIDARIDAD, Q.R CP. 77712', 77712, '9847456638', '1996-12-18', 'PODA961218ND5', 'PODA961218MQRTZD03', '06169696538', 'Licenciatura', 'IDMEX1304261885', 'N/A', 'Jennifer Dzib (hermana)', '9841634358', 'RHR83SC', 'Auxiliar legal', '2024-02-12', 152, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Dallas', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '-', 'dzibaddy127@gmail.com', 'aux.legal5@notaria83qroo.mx', NULL, NULL),
(95, 'Prueba', NULL, 'DIDIER RUBEN', 'CAUICH MAC', 0, NULL, '2024-02-21 17:11:40', '2025-02-17 15:39:24', '70 AV NTE ENT 6 Y 8 EMILIANO ZAPATA, COZUMEL, Q.ROO', 77620, '9871185687', '2000-01-01', 'CADI000101724', 'CAMD000101HQRCCDA7', '22160030312', 'Licenciatura', 'idmex1649495983', 'NA', 'Manuel Jesus Contreras Mac (Tío)', '9841821505', 'Avaluosygestoriapdcsc', NULL, '2024-02-12', 153, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', NULL, NULL, '012180015659693596', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'l', '646690146402324193', 'DIDIMAC2011@HOTMAIL.COM', '-', NULL, NULL),
(96, 'Prueba', NULL, 'ROSALBA', 'GUTIERREZ EGUIA', 0, NULL, '2024-02-21 19:03:13', '2024-11-22 17:14:21', 'C. 80 MZA 424 X 15 Y 20 LT 9, COLOSIO, SOLIDARIDAD, Q. ROO', 77728, '2281443270', '1987-04-12', 'GUER870412GY1', 'GUER870412MVZTGS09', '65128722819', 'Licenciatura', 'IDMEX2168997026', 'N/A', 'CIndel Aradi Torres Escamilla (amiga)', '9842280336', 'RHR83SC', 'Auxiliar de archivo', '2024-02-21', 154, NULL, NULL, NULL, '{\"label\":\"ERIKA ANTONIA ZUÑIGA VAZQUEZ\",\"value\":21}', 'Archivo', '-', '012840029363081393', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'L', '646690146402809896', 'ROSA.GTZ@LIVE.COM.MX', NULL, NULL, NULL),
(97, 'Prueba', NULL, 'MARTÍN ALBERTO', 'PUC POOT', 1, NULL, '2024-03-11 18:51:11', '2024-04-12 15:44:52', 'MZ 14 LT 1 AV. LAAK # 06 FRACC. PESCADORES, SOLIDARIDAD, QROO.', 77710, '999777997', '1997-12-09', 'PUPM9712097W1', 'PUPM971209HYNCTR04', '54169729537', 'Licenciatura', 'IDMEX1416519126', 'N/A', 'Angelica Puc (Hermana)', '9861040556', 'RHR83SC', 'Auxiliar de cierres', '2024-03-04', 156, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', NULL, NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'CH', '646050146402012197', 'ing.agro.martinpoot@gmail.com', 'cierres.infonavit@notaria83qroo.mx', NULL, NULL),
(98, 'Prueba', NULL, 'ANGELA  IBETH', 'ZAMORA LÓPEZ', 1, NULL, '2024-03-11 20:49:38', '2024-04-15 21:34:05', 'CALLE 70 SUR MZ 14 INT LT 3 EJIDO SUR, SOLIDARIDAD,QROO.', 77712, '9842464519', '1999-02-09', 'ZALA9902093C2', 'ZALA990209MPLMPN03', '92169985915', 'Licenciatura', 'IDMEX2474487664', 'N/A', 'Jorge Armando Hernández Alemán (Concubino)', '9847450248', 'RHR83SC', 'Auxiliar de archivo', '2024-03-04', 155, NULL, NULL, NULL, '{\"label\":\"ERICKA MARGARITA CANTO SANTOYO\",\"value\":25}', 'Archivo', '-', '-', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '646690146402827030', 'angelaIzl614@gmail.com', 'aux.archivo7@notaria83qroo.mx', NULL, NULL),
(99, 'Prueba', NULL, 'RENE', 'CARRILLO PINEDA', 1, NULL, '2024-03-11 22:47:24', '2024-04-11 20:41:40', 'MZ 6 LT 7 307 Q3 PRIV. VADELLA, REAL IBIZA, C.P 77725, SOLIDARIDAD, QROO', 77725, '9614047003', '1998-02-23', 'CAPR980223FK5', 'CAPR980223HCSRNN04', '21169813587', NULL, 'IDMEX2356999434', 'N/A', 'Daniel Elias García Pineda (Primo)', '9611157839', 'RHR83SC', 'Auxiliar administrativo', '2024-03-04', 157, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Administración', '-', '(0)12180015023026647', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '646100146403800944', 'renecarrillo817@gmail.com', 'rcarrillo@notaria83qroo.mx', NULL, NULL),
(100, 'Prueba', NULL, 'KARINA CELESTE', 'AQUINO LÓPEZ', 1, '2026-03-05', '2024-04-08 17:56:40', '2024-08-20 14:51:57', 'FRACC. PASEOS DE XCACEL M 6 L 3, AVENIDA CONSTITUYENTES', 77723, '9811111545', '1997-09-11', 'AULK970911IW1', 'AULK970911MCCQPR07', '01229720758', 'Licenciatura', 'IDMEX2097516745', 'N/A', 'Matilde Aquino (Madre)', '9911081414', 'Avaluosygestoriapdcsc', 'Auxiliar de Firmas', '2024-03-22', 164, NULL, NULL, NULL, '{\"label\":\"KARINA CELESTE AQUINO LÓPEZ\",\"value\":100}', 'Dallas', '-', '-', NULL, 'CV01565', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'DEPTO 29 A', 'M', '646050146402031550', 'KARINAAQUINOLOPEZ@GMAIL.COM', 'firmas.vivienda@notaria83qroo.mx', '-', NULL),
(101, 'Prueba', NULL, 'ANA DEL CARMEN', 'AQUINO ACOSTA', 1, NULL, '2024-04-09 21:30:58', '2024-09-23 17:21:01', 'SM 1 MZ1 LT 7 PICOPANDOS CASA 63, VILLAS DEL SOL II CP.77710, SOLIDARIDAD, QROO', 77710, '9841979582', '2000-08-04', 'AUAA000814MJ6', 'AUAA000814MTCQCNA9', '20160082036', 'Preparatoria', 'IDMEX2448918952', 'N/A', 'Diana Aquino (Hermana)', '9847453039', 'RHR83SC', 'Capturista', '2024-03-13', 158, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', 'Atlanta', '-', NULL, NULL, '-', NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1727112061_custom_filename.jpg', NULL, 'M', '646690146402838252', 'anaaquono@gmail.com', 'capturista5@notaria83qroo.mx', NULL, NULL),
(102, 'Prueba', NULL, 'ADA ROSALBA', 'ARROYO URIBE', 0, NULL, '2024-04-10 19:02:25', '2024-11-22 17:14:39', 'MZ 311 LT 79 C 39 SUR X CARRETERA FEDERAL, COL. EJIDO SUR, CP,77712', 77710, '9841368780', '1989-07-26', 'AOUA8907262R2', 'AOUA890726MDFRRD01', '(0)5178974530', 'Licenciatura', 'IDMEX2323047984', 'Polvo', 'Diego Ponce (Esposo)', '9841518066', 'RHR83SC', 'Auxiliar de cierres', '2024-03-13', 159, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', '012180015440144102', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'G', '646690146402844738', 'adasprduper@gmail.com', 'aux.archivo3@notaria83qroo.mx', NULL, NULL),
(103, 'Prueba', NULL, 'ADRIAN', 'XOOL CAN', 1, '2024-12-02', '2024-04-11 15:56:34', '2024-04-11 18:53:24', 'REG. 220 MZ 3 LT 13, LEONA VICARIO Y NIÑOS HEROES, CP.77517, CANCÚN Q.ROO', 77517, '9982358903', '2000-11-07', 'XOCA001107768', 'XOCA001107HQRLNDA6', '38160054813', 'Licenciatura', 'IDMEX1818017433', 'N/A', 'Delia Verónica Can', '9981379088', 'Avaluosygestoriapdcsc', 'Gestor', '2024-03-13', 161, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', '-', '012180015483523793', NULL, 'CC-1092318', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '646690146402838155', 'axoolcan@gmail.com', '-', NULL, NULL),
(104, 'Prueba', NULL, 'VIVIANA DE MONSERRAT', 'SANCHEZ ARENAS', 1, NULL, '2024-04-11 16:19:51', '2024-08-20 15:00:55', 'LAS PALMAS II MZ. 115 L 1 CALLE PALMA YAREY 2 N° EXT. V. 33 CP. 77710, ZONA URBANA B', 77710, '9841387433', '1990-05-15', 'SAAV900515HQ9', 'SAAV900515MVZNRV03', '82119018859', NULL, 'IDMEX2162637513', 'Ketorolaco, polvo, humedad', 'Merly Ramos (Roomie)', '9999188817', 'Avaluosygestoriapdcsc', 'Cordinador de Gestoría', '2024-03-13', 162, NULL, NULL, NULL, '{\"label\":\"ANGELA GUADALUPE CASTILLO DZUL\",\"value\":13}', 'Gestoría', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.33', 'xl', '646690146402156578', 'monserrat.sanchez.arenas15@gmail.com', 'gestaria@notaria83qroo.mx', NULL, NULL),
(105, 'Prueba', NULL, 'MARIO', 'LINARES VILLATORO', 1, '2024-04-22', '2024-04-11 16:32:23', '2024-08-20 16:18:31', 'REG.79 MZ. 22 LT 03 #32 B MAROMA. FRACC. GUADALUPANA Y TEPENCHIP, CP. 77724', 77724, '9681294570', '1999-08-15', 'LIVM990815957', 'LIVM990815HCSNLR01', '(0)5139963622', NULL, 'IDMEX1919163237', 'N/A', 'Pablo Gordillo ( Primo)', '9612317166', 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2024-03-13', 160, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Estocolmo', '-', '012180015504750416', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '32', '646100146404460684', 'mariolinaresvillatoro144@gmail.com', 'aux.firmas2@notaria83qroo.com', NULL, NULL),
(106, 'Prueba', NULL, 'RICARDO', 'RÍOS CORTÉS', 0, '2026-05-06', '2024-04-11 16:57:20', '2024-08-02 22:06:30', 'MZ. 72 LT.1 CASA 21, C. AGUAMARINA, ALDEA TULUM (CADU)', 77710, '5539939072', '1991-05-11', 'RICR910511QT4', 'RICR910511HDFSRC05', '45149102613', 'Licenciatura', 'IDMEX2378344638', 'Céfalos porinas', 'Alejandro Ríos (Padre)', '5542029990', 'RHRVIVIENDASC', 'Recursos Materiales', '2024-03-20', 163, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Humanos', '-', '012690015833176633', NULL, 'C16015383', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '40', '646690146402863816', 'ricardo_rios_cortes@hotmail.com', '-', NULL, NULL),
(107, 'Prueba', NULL, 'MARIA NOEMÍ ARACELI', 'CANCHÉ ESTRELLA', 0, NULL, '2024-04-11 17:16:35', '2024-07-24 13:43:25', 'VILLAS DEL SOL II MZA 4 L 5, CALLE CHORLOS N° EXT. 56 CP. 77710, ZONA URBANA B', 77710, '9878767566', '1972-03-10', 'CAEN720310JF9', 'CAEN720310MQRNSM08', '82907207359', 'Preparatoria', 'IDMEX1298023573', 'N/A', 'Edmy  Montserrat Chan Canché (Hija)', '9871058488', 'RHRVIVIENDASC', 'Limpieza', '2024-03-19', 165, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Humanos', '-', '137692104260988796', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '56', 'M', '646690146402512662', 'mimicitacanche10@gmail.com', NULL, NULL, NULL),
(108, 'Prueba', NULL, 'ROGELIO', 'SANCHEZ GOMES', 0, '2029-04-10', '2024-04-11 17:45:16', '2024-11-22 17:17:10', 'SM1 MZ 8 LT 7 18 CALLE COLORINES, FRACC. EL ENCUENTROF., C.P. 77724 SOLIDARIDAD,Q.ROO', 77724, '9984910597', '1997-03-20', 'SAGR970320PU7', 'SAGR970320HTCNMG03', '10169726733', 'Licenciatura', 'IDMEX2454365881', 'N/A', 'Maria Lourdes Gomes Salas (Madre)', '9322594599', 'Avaluosygestoriapdcsc', NULL, '2024-04-11', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', NULL, '-', '012691015817544882', NULL, '0059301', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'g', '646790146403105091', 'conta_roy@hotmail.com', NULL, NULL, NULL),
(109, 'Prueba', NULL, 'MARIA DEL ROSARIO', 'TELLITUD ORTÍZ', 0, NULL, '2024-04-17 17:16:52', '2024-10-11 17:59:10', 'SM 521 M. 16 L 18 AV. INSTITUTO POLITECNICO NACI N° EXT A CONJ HAB QROO CP, 77536 ZONA URBANA CANCún', 77536, '9981375416', '1971-09-17', 'TEOR7109174A6', 'TEOR710917MMNLRS07', '82987102595', 'Licenciatura', 'TEOR710917MMNLRS07', 'N/A', NULL, NULL, 'RHR83SC', 'Gerente de Contabilidad', '2024-03-01', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Contabilidad', '-', '-', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'a', '-', '-', 'charytellitud@gmail.com', 'rosario.tellitud@notaria83.Mx', NULL, NULL),
(110, 'Prueba', NULL, 'CARINA', 'MORENO SEGUNDO', 0, NULL, '2024-05-08 20:48:25', '2024-07-24 13:43:35', 'FRACC. MISIÓN VILLAMAR  M15 L1 CALLE PLAYA CARABELI, ZONA URBANA A SOLIDARIDAD', 77710, '9842035046', '1999-07-15', 'MOSC990715JJ2', 'MOSC990715MQRRGR09', '71169985232', 'Preparatoria', NULL, NULL, 'GILBERTO MORENO ESPINOSA', '9843108318', 'RHR83SC', NULL, '2024-04-29', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', NULL, '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.39', '-', '646690146402911331', 'carenmoreno5@gmail.com', 'auxiliar.archivo5@notaria83qroo.mx', NULL, NULL),
(111, 'Prueba', NULL, 'ALMA DELIA', 'JURADO SERRANO', 1, NULL, '2024-05-09 15:21:10', '2024-09-30 19:38:09', '12 x 125 y 130 mz 56 lt 8 cp. 7 125 pcn ejido nte, solidaridad, q.r.', 77712, '9612878195', '1997-08-20', 'jusa970820d47', 'jusa970820mcsrrl03', '86169744231', 'Preparatoria', 'idmex2088644374', 'N/A', 'LUIS EDUARDO MENDOZA VELÁZQUEZ', '9941068460', 'RHR83SC', 'Auxiliar de cierres', '2024-04-08', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', '012045015479769444', NULL, '-', NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1727725089_custom_filename.jpg', '-', '-', '646690146402912796', 'almaserrano_@outlook.com', 'aux.archivo@notaria83qroo.mx', NULL, NULL),
(112, 'Prueba', NULL, 'MICHEL ABIYELI', 'DÁVILA JUÁREZ', 0, NULL, '2024-05-15 17:19:28', '2024-07-24 13:43:40', 'FRACC, JARDINES DE MAYAKOBA M 1 L 2 N° EXT. DEPTO 314-AC3 EDIFICIO B, CONDOMINIO CIRCEO', 77724, '2461502220', '1995-09-13', 'DAJM950913BDA', 'DAJM950913MTLVRC05', '62169598851', 'Licenciatura', 'IDMEX2611061977', '-', 'Blas DÁVILA PINEDA', '2461211163', 'RHR83SC', 'Auxiliar de cierres', '2024-04-29', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', '012180015278291942', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '-', '646830146402457448', 'abiyelidavila@gmail.com', 'sjuarez@notaria83qroo.mx', NULL, NULL),
(113, 'Prueba', NULL, 'GENER HUMBERTO', 'NAH OXTÉ', 1, '2028-09-04', '2024-05-16 14:58:39', '2024-11-21 17:42:51', 'Zazil-Ha M 27 Lote 5, CP 77720, Solidaridad Qroo', 77720, '9841587295', '1992-11-29', 'NAOG9211296UA', 'NAOG921129HQRHXN07', '82119229076', 'Licenciatura', 'idmex22936808877', 'N/A', 'Humberto Nah (Padre)', '9848017584', 'Avaluosygestoriapdcsc', 'Auxiliar de Firmas', '2024-05-06', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '-', '4152313843429411', NULL, 'SC-30779', NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1732210971_custom_filename.jpg', '-', '-', '646690146401463615', 'generaazul@gmail.com', 'firmas2@notaria83qroo.mx', NULL, NULL),
(114, 'Prueba', NULL, 'ADELAIDA', 'VÁZQUEZ MÉNDEZ', 0, NULL, '2024-05-17 16:56:56', '2024-10-30 14:10:16', 'LUIS DONALDO COLOSIO II M 529 L 17 CALLE 108 AV 30 Y 35 NTE ZONA URBANA A, SOLIDARIDAD', 77710, '9616352761', '1998-10-15', 'VAMA9810151QA', 'VAMA981015MCSZND00', '38179852330', 'Secundaria', 'IDMEX1532902664', 'N/A', 'EDUARDO LUIS MENESES ALVARO', '9618700077', 'RHRVIVIENDASC', 'Limpieza', '2024-05-08', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Humanos', '-', '012691015610230270', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'CH', '646100146404606309', 'adelaida9726@gmail.com', NULL, NULL, NULL),
(115, 'Prueba', NULL, 'GUSTAVO', 'MARTÍNEZ CARDOSO', 1, NULL, '2024-05-17 18:46:38', '2024-06-03 20:02:55', 'fracc. galaxia del carmen 1 m 1 l 4 calle gruta pte zona urbana a, solidaridad q. roo', 77710, '9841158711', '2002-12-05', 'macg021205gc0', 'macg021205hqrrrsa5', '38170294490', 'Licenciatura', 'idmex2191238754', 'n/a', 'PATRICIA CARDOSO TORRES', '9843145240', 'RHR83SC', 'Capturista', '2024-05-13', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '012694015630658017', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'v.160', '34', '646180146403443431', 'gustavomtz2002@gmail.com', 'capturista3@notaria83qroo.mx', NULL, NULL),
(116, 'Prueba', NULL, 'FERNANDO IVÁN', 'ROBLES VELÁZQUEZ', 1, NULL, '2024-05-23 20:18:54', '2024-06-03 20:05:42', 'fracc. paseos de xcacel m2 l 6 calle flor de romero depto 20 b condominio playa holbox cp. 77723, zona urbana b', 77723, '5635961817', '1989-04-12', 'ROVF890412NL5', 'ROVF890412HDFBLR03', '20088926058', NULL, 'IDMEX2131719758', 'N/A', 'JAIME ROBLES (PADRE)', '5530148441', 'Avaluosygestoriapdcsc', 'Gestor', '2024-05-22', NULL, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', NULL, '012180015502014565', NULL, 'SM-1254', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '20b', '34', '646690146402279138', 'fernando.roblesv12@gmail.com', NULL, NULL, NULL),
(117, 'Prueba', NULL, 'JOCELYN AYLIN', 'RÍOS GARCIA', 1, NULL, '2024-05-24 17:08:06', '2025-02-05 17:46:40', 'Avenida SolidaRIdad Manzana 5 L. 4 Mision del Carmen CP. 77724', 77724, '98416666685', '2000-06-15', 'RIG000615MYNSRCA6', 'RIG000615MYNSRCA6', '35180070456', 'Licenciatura', 'IDMEX703120378543', 'N/A', 'CORALIA GARCÍA (MADRE)', '9848064777', 'RHR83SC', 'Pasante', '2023-10-13', NULL, NULL, NULL, NULL, '{\"label\":\"JENNIFER JAZMIN BASURTO BALDOMERO\",\"value\":80}', 'Francia', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'CH', '-', 'josslee000@gmail.com', 'jgarcia@notaria83qroo.mx', NULL, NULL),
(118, 'Prueba', NULL, 'KENIA KIMBERLI', 'SORIANO MÁRQUEZ', 1, NULL, '2024-05-24 17:34:59', '2024-08-20 22:43:09', 'Col. Nicte Ha MZ 20 L T5 calle 15 bis CP 77727', 77727, '9841434025', '2002-10-23', 'somk021023mqrrrna2', 'SOMK021023MQRRRNA2', '02180219335', 'Licenciatura', 'IDMEX2380130797', 'N/A', 'Magdalena Marquez (Madre)', '9841767352', 'RHR83SC', 'Pasante', '2023-03-06', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '-', 'keniasoriano2923@gmail.com', 'pasante12@notaria83.mx', NULL, NULL),
(119, 'Prueba', NULL, 'kenia kimberli', 'SORIANO márquez', 0, NULL, '2024-05-24 17:35:15', '2024-07-09 21:28:19', 'Col. Nicte Ha MZ 20 L T5 calle 15 bis CP 77727', 77727, '9841434025', '2002-10-23', 'somk021023mqrrrna2', 'SOMK021023MQRRRNA2', '02180219335', 'Licenciatura', 'IDMEX2380130797', 'N/A', 'Magdalena Marquez (Madre)', '9841767352', 'RHR83SC', NULL, '2023-03-06', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', NULL, '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '-', 'keniasoriano2923@gmail.com', NULL, NULL, NULL),
(120, 'Prueba', NULL, 'EMILY YEZIR', 'SUÁREZ DÍAZ', 0, NULL, '2024-05-24 18:38:50', '2024-07-24 13:43:48', 'Mz 27 Lt 29 Nueva Creación, 28 de julio, CP. 77714 Solidaridad, Qroo.', 77714, '9841579259', '2003-03-30', 'SUDE030330RY0', 'SUDE030330MQRRZMA8', '56180344402', 'Licenciatura', 'IDMEX2077914028', 'N/A', 'Enrique Suarez (Papá)', '9842010883', 'RHR83SC', 'Pasante', '2024-01-10', NULL, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '-', 'suarez.300303@gmail.com', NULL, NULL, NULL),
(121, 'Prueba', NULL, 'DAMIANA LORELY', 'PADILLA PONCE', 0, NULL, '2024-05-24 18:48:02', '2024-08-02 22:08:25', '65 Av. M. 12 LT 02 1ra Sur  y Av. Juárez, Ejido Sur CP. 77712 Solidaridad, Qroo.', 77712, '9984005309', '2023-11-02', 'PAPD031102MQRDNMA5', 'PAPD031102MQRDNMA5', '(0)3210335588', 'Licenciatura', 'IDMEX2218538861', 'N/A', 'Manuel Padilla', '9981552321', 'RHR83SC', 'Pasante', '2024-04-15', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Estocolmo', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '-', 'damianalp11@gmail.com', NULL, NULL, NULL),
(122, 'Prueba', NULL, 'MARIA CONCEPCIÓN', 'BUENFIL LEÓN', 1, NULL, '2024-06-03 22:38:50', '2024-08-20 15:04:34', 'M 23 LT 6 # 34 CALLE NUBE Y PALMA EN TERRAZA, MISIÓN LAS FLORES, SOLIDARIDAD, Q.R.', 77723, '9841282736', '1998-12-16', 'BULC981216II6', 'BULC981216MQRNNN02', '46179862779', 'Licenciatura', 'IDMEX2294569779', 'N/A', 'Yahaira Buenfil (hermana)', '9841799220', 'RHR83SC', 'Abogado Jr.', '2024-05-27', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '012694015687916401', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'xg', '646690146402969862', 'maria.buenfil16@outlook.es', 'abogadojr@notaria83qroo.mx', '-', NULL),
(123, 'Prueba', NULL, 'YEDID ANAHÍ', 'ZAVALETA VELA', 1, NULL, '2024-06-03 22:52:27', '2024-08-20 14:55:09', 'MZ 396 LT 17 C. 76 X 15 Y 20, COLOSIO, SOLIDARIDAD, Q.R.', 77728, '9841587959', '1997-07-29', 'ZAVY970729AM6', 'ZAVY970729MQRVLD04', '(0)5139746845', NULL, 'IDMEX2346535644', 'N/A', 'Maria del Carmen Vela Martín (Madre)', '9845931413', 'RHRVIVIENDASC', 'Atención al Público en General', '2024-05-29', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'm', '646690146402970123', 'yedid.zavaleta@gmail.com', 'servicio.clientes@notaria83.mx', '-', NULL),
(124, 'Prueba', NULL, 'LUCIO', 'PALE MOSHAN', 0, NULL, '2024-06-04 00:21:15', '2024-09-30 16:55:00', 'MZ 55 L 7 C. 15 110 Y 110 A, COLONIA FORJADORES, SOLIDARIDAD', 77716, '9843183769', '1994-01-02', 'PAML040531CV9', 'PAML040531HCSLSCA8', '25220494105', NULL, 'IDMEX2323388342', 'N/A', 'Olivia Pale (Tía)', '9842533705', 'RHRVIVIENDASC', 'LIMPIEZA', '2024-05-31', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Humanos', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 's', '4217470155537869', 'luciopale625@gmail.com', NULL, '-', NULL),
(125, 'Prueba', NULL, 'EDGAR DAVID', 'PALE MOSHAN', 1, NULL, '2024-06-04 00:48:20', '2024-12-03 20:37:19', 'C 15 SUR 90 Y 95 MZ6 LT3 PNC FRACC EL TIGRILLO F.F.P 77717 SOLIDARIDAD Q.R.', 77715, '9843222610', '1999-01-12', 'CATA9401254K6', 'CATA940125MYNBYG08', '50200610777', 'Preparatoria', 'INDEX2657999500', 'NA', 'Olivia Pale (mama)', '29861533241', 'RHRVIVIENDASC', 'Auxiliar de archivo', '2023-02-21', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'edgardavidpale1@gmail.com', NULL, NULL, NULL),
(126, 'Prueba', NULL, 'DULCE IRERI', 'MONDRAGÓN RODRÍGUEZ', 0, NULL, '2024-06-10 14:44:43', '2024-07-24 13:43:55', 'NATURA PLAYA DEL CARMEN M 2 L 3 CERRADA PASEO LA ISLA,ZONA URBANA B, SOLIDARIDAD', 77714, '9841380501', '1980-11-22', 'MORD801122CV5', 'MORD801122MDFNDL06', '92028016969', 'Licenciatura', 'IDMEX1457635250', 'N/A', 'Erendi Esperanza Mondragón Rodríguez(Hermana)', '9841439895', 'RHR83SC', 'Capturista', '2024-06-10', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '2314277833', '012694015171064296', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '51', 'M', '646690146402986599', 'irerimonro@gmail.com', NULL, '-', NULL),
(127, 'Prueba', NULL, 'SAMUEL YAHIR', 'CHAN DZIB', 1, NULL, '2024-06-18 05:39:56', '2024-06-18 21:21:01', 'SM 72 MZ 45 LT 1 #5 3RA ETAPA CALLE MUNT PCN RES CATALUNA, SOLIDARIDAD, Q.R.', 77725, '9838090538', '1994-01-25', 'CADS020528CYA', 'CADS020528HQRHZMA0', '25160221278', 'Licenciatura', 'IDMEX2068615907', 'N/A', 'Lissete Romero Castillo (Pareja)', '9992475506', 'Avaluosygestoriapdcsc', 'GESTOR', '2024-06-12', NULL, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', NULL, '012691015775718417', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 's', '646690146402993197', 'samuelchan338@gmail.com', NULL, '-', NULL),
(128, 'Prueba', NULL, 'MARIA IRENE', 'ORTEGA MOO', 0, NULL, '2024-06-18 06:02:03', '2025-01-31 14:50:24', 'VILLAS DEL SOL II M2 L8, CALLE GRULLAS, N° INT PB, ZONA URBANA, SOLIDARIDAD', 77710, '9841838051', '2001-06-28', 'OEMI010628QQ8', 'OEMI010628MQRRXRA6', '21130143775', 'Licenciatura', 'IDMEX1996675795', 'N/A', 'Joan Alexis Martinez Mendez (Esposo)', '9842394355', 'RHRVIVIENDASC', 'Auxiliar de cierres', '2024-06-13', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', '012180015225910030', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '11', 'g', '646690146402991283', 'ortegamoomariairene15@gmail.com', 'aux.archivo6@notaria83.mx', '-', NULL),
(129, 'Prueba', NULL, 'CELIA DANIELA', 'PAEZ FLORES', 1, NULL, '2024-06-18 06:31:11', '2024-08-20 15:43:48', 'FRACC. PESCADORES PLUS M1 L 17, CALLE PARDILLOS 06, CP., ZONA URBANA B, SOLIDARIDAD', 77710, '9841459501', '2004-07-12', 'PAFC040712JTA', 'PAFC040712MPLZLLA4', '19200444792', 'Preparatoria', 'IDMEX2362884232', 'N/A', 'GlORIA GUADALUPE FLORES CID (MAMÁ)', '9843136414', 'RHRVIVIENDASC', 'Auxiliar de Avisos y Sistemas', '2024-06-13', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', '-', NULL, NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '42', 'g', '646690146402992509', 'paezfloresceliadaniela@gmail.com', 'avisos3@notaria83qroo.mx', '-', NULL),
(130, 'Prueba', NULL, 'PAMELA JORGHET', 'GAMBOA PEREZ', 0, NULL, '2024-06-18 06:58:09', '2024-10-11 17:59:39', 'C.GLADIOLAS M29 LT 6 #87 AV. CONSTITUYENTES, MISIÓN LAS FLORES, SOLIDARIDAD. Q.R', 77723, '9612835432', '1992-06-17', 'GAPP9206178S0', 'GAPP920617MCSMRM03', '75109220527', 'Licenciatura', 'IDMEX2082138776', 'N/A', 'Eulise Gamboa Ruiz (Padre)', '9984005125', 'RHRVIVIENDASC', 'Capturista', '2024-06-18', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'xl', '646100146404171669', 'licpamela.gamboa@gmail.com', NULL, '-', NULL),
(131, 'Prueba', NULL, 'CAMILO G.', 'CANTÓN RODRÍGUEZ', 1, NULL, '2024-06-21 23:19:17', '2024-06-24 22:17:57', 'mz 15 lt 2 casa 26 calle kaan fracc. balan tun, solidaridad, q.roo.', 77727, '9842530805', '2003-10-07', 'garc031007fa0', 'gxrc031007hqrxdma1', '05240378553', NULL, 'idmex2320415070', 'N/A', 'Julia Rodríguez Reyes (Madre)', '9842327530', NULL, 'Pasante', '2024-06-24', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'g', '-', 'camilo.gcrodriguez@yahoo.com.mx', NULL, NULL, NULL),
(132, 'Prueba', NULL, 'KELVIN EDUARDO', 'LÓPEZ LÓPEZ', 1, NULL, '2024-06-25 02:34:57', '2025-01-27 14:16:59', 'MZA 65C LT 7 C. 13 SUR X 140 145 AV REF 624573, COL BELLAVISTA, SOLIDARIDAD, Q.ROO.', 77713, '9842529042', '2002-12-28', 'LOLK021228Q39', 'LOLK021228HQRPPLA9', '49170265976', 'Preparatoria', 'IDMEX2345366478', 'N/A', NULL, NULL, 'RHRVIVIENDASC', 'Capturista', '2024-06-25', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '-', '012180015380532227', NULL, '-', NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1737987419_custom_filename.jpg', '-', 'M', '646690146402021137', 'kelvinlopezlopz@gmail.com', 'capturista6@notaria83qroo.mx', NULL, NULL),
(133, 'Prueba', NULL, 'DIANA YARET', 'HERNÁNDEZ ÁVILA', 0, '2027-07-15', '2024-06-25 04:09:53', '2024-08-02 22:08:44', 'FRACC. CATALUÑA M 42 L 1 AVENIDA HUNABKU, N° EXT V. 2 ZONA URBANA A, SOLIDARIDAD', 77710, '9841430960', '1983-11-11', 'HEAD831111BJ7', 'HEAD831111MDFRVN04', '39128300744', 'Licenciatura', 'IDMEX1121258523', 'N/A', NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2024-06-25', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Estocolmo', '-', '-', NULL, 'SA-18971', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'G', '646690146403013885', 'yaretyasociados99@gmail.com', NULL, NULL, NULL),
(134, 'Prueba', NULL, 'YESENIA ROMINA', 'CORDOVA BARRON', 0, NULL, '2024-06-25 04:19:30', '2024-07-24 13:44:09', 'C. 13 SUR MZ 44 LT 12 X 145 AV. MEDIDOR EXIST 342JJB, COL BELLAVISTA, SOLIDARIDAD, QROO.', 77713, '9984248311', '1998-08-16', 'COBY980816I66', 'COBY980816MQRRRS04', '(0)2229814070', 'Licenciatura', 'IDMEX2166180936', 'N/A', NULL, NULL, 'RHRVIVIENDASC', 'Auxiliar de Avisos y Sistemas', '2024-06-25', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', '-', '012691015180725891', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', NULL, '646690146403013623', 'rominaheba@gmail.com', NULL, NULL, NULL),
(135, 'Prueba', NULL, 'ALINE DE JESÚS', 'SEBA VALENTIN', 0, NULL, '2024-06-25 04:37:11', '2024-09-12 15:08:38', 'SM 1 MZ 6 LT 4 # 22 CALLE GUACO MED VEC 01H09K, VILLAS DEL SOL, SOLIDARIDAD, Q.ROO', 77725, '2949486267', '1989-03-29', 'SEVA890328BS6', 'SEVA890328MVZBLL06', '65078949735', 'Licenciatura', 'IDMEX2026862943', 'N/A', NULL, NULL, 'RHRVIVIENDASC', 'Auxiliar de archivo', '2024-06-25', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', '-', '012180015975588770', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'G', '646840146407926728', 'alinesebavalentin@gmail.com', NULL, NULL, NULL),
(136, 'Prueba', NULL, 'ELISA AZAREEL', 'VERA GUZMAN', 1, NULL, '2024-06-28 01:29:55', '2024-08-20 14:53:20', 'C. LILIS # 92 MZ 24 LT 3 CTO MAGNOLIAS DAR VUELTA, MISIÓN LAS FLORES, SOLIDARIDAD,Q.ROO', 77723, '9844581502', '1995-09-06', 'VEGE9509069M7', 'VEGE950906MQRRZL06', '(0)2169511470', 'Preparatoria', 'IDMEX2396112323', 'N/A', 'Doyla Vera Guzman (Hermana)', '9997069269', 'RHRVIVIENDASC', 'Auxiliar de cierres', '2024-06-27', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', '012690029907998319', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', '2X', '646690146403019782', 'elissavera8@gmail.com', 'elissavera8@gmail.com', NULL, NULL),
(137, 'Prueba', NULL, 'SERGIO', 'DEVEZE SANCHEZ', 0, NULL, '2024-06-28 13:51:41', '2024-10-11 18:00:28', 'FRACC. MUNDO HABITATT 12 LT 5 CALLE MAR DE PLATA, ZONA URBANA A, SOLIDARIDAD, QROO.', 77714, '9841567681', '1995-05-03', 'DESS950503Q5A', 'DESS950503HTCVNR02', '27169551275', 'Preparatoria', 'IDMEX1466331291', 'N/A', 'Martha Alicia Sánchez (Madre)', '9841567681', 'RHRVIVIENDASC', 'Pasante', '2024-06-28', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Administración', '-', '-', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V.14', 'm', '-', 'sergiodeveze030595@hotmail.com', NULL, '-', NULL),
(138, 'Prueba', NULL, 'MARIA PAOLA', 'GARCÍA MEDINA', 0, NULL, '2024-06-28 22:14:02', '2024-07-24 13:44:18', 'CENTRO I M 18 L 3 AVENIDA 20 C. 2 Y 4 NTE, N° INT. 652, ZONA URBANA A, SOLIDARIDAD', 77710, '3315288251', '1998-12-16', 'GAMP981216ADA', 'GAMP981216MJCRDL06', '51169874917', 'Preparatoria', 'N083133029MEX9812161F2904283 (PASAPORTE)', 'N/A', 'María Elena Medina Olguín (Madre)', '3345836050', 'RHRVIVIENDASC', 'Facturista', '2024-07-01', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Administración', '-', '012320015364971017', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'XG', '646320146407644054', 'mpaolagm1612@gmail.com', NULL, '-', NULL),
(139, 'Prueba', NULL, 'ANGEL FRANCISCO', 'ECHEVERRÍA TORRES', 1, '2024-10-24', '2024-07-01 18:01:37', '2024-08-20 14:52:43', 'ÁVILA CAMACHO # 291, M 423 L 7 NARANJAL Y ALFREDO V. BONFIL, COLONIA LÁZARO CÁRDENAS, CHETUMAL, QUINTANA ROO.', 77014, '9832136612', '1999-04-22', 'EETA990422UQ0', 'EETA990422HQRCRN01', '75169975101', NULL, 'IDMEX1598817805', 'N/A', NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2024-07-02', NULL, NULL, NULL, NULL, '{\"label\":\"MERLY RUBI RAMOS CANUL\",\"value\":84}', 'Dallas', NULL, '-', NULL, '2019344611', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', NULL, '646690146403020881', 'echeverriaanfran1@gmail.com', 'aux.firmas4@notaria83qroo.mx', NULL, NULL),
(140, 'Prueba', NULL, 'GUALBERTO ALEXIS', 'CUTZ PÉREZ', 0, NULL, '2024-07-01 22:02:01', '2024-11-20 22:32:27', 'VILLA HALCÓN M5 L2 SL4 #403, COLONIA MISIÓN LAS FLORES, SOLIDARIDAD, Q.ROO', 77723, '9834091530', '1995-03-30', 'CUPG9503309A2', 'CUPG950330HYNTRL03', '44159541224', 'Licenciatura', '(0)739133562796', 'N/A', NULL, NULL, 'RHRVIVIENDASC', 'Auxiliar de archivo', '2024-07-03', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', '-', '012180015555853812', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'alexis25.169@outlook.com', NULL, NULL, NULL),
(141, 'Prueba', NULL, 'ZAYRA TALIA', 'URBINA MARTÍNEZ', 1, NULL, '2024-07-09 21:27:47', '2024-08-20 14:58:42', 'PV. MAZATLÁN ED. 41 D, PLAYA LOS PINOS, FRACCIONAMIENTO PORTO ALTO, SOLIDARIDAD, QUINTANA ROO', 77725, '4424712838', '1986-01-28', 'UIMZ8601281A7', 'UIMZ860128MMNRRY06', '(0)4078648476', 'Licenciatura', 'IDMEX2537516320', 'N/A', 'Sandra Urbina Martínez (Hermana)', '9841302099', 'RHRVIVIENDASC', 'Auditor de calidad', '2024-07-10', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Calidad', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'M', '-', 'zay.urbina@gmail.com', 'calidad@notaria83.mx', NULL, NULL),
(142, 'Prueba', NULL, 'CHARLENE AUDREY', 'REQUENA TOTOSADO', 0, NULL, '2024-07-16 13:39:37', '2024-11-20 22:32:37', 'MZ1 L 23 C. PALOMA 02 # 32, FRACC. PESCADORES, SOLIDARIDAD. QROO.', 77710, '9983155418', '1982-11-10', 'RETC821110GZ2', 'RETC821110MQRQTH08', '(0)3218261042', 'Preparatoria', 'IDMEX2442752989', 'N/A', 'Roberto González (Esposo)', '9848797624', 'RHRVIVIENDASC', 'Auxiliar de cierres', '2024-07-16', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', '-', '012180015496672505', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'XG', '-', 'carequena1@gmail.com', NULL, NULL, NULL),
(143, 'Prueba', NULL, 'ALEJANDRO GERARDO', 'SANTAMARIA VILLANUEVA', 0, NULL, '2024-07-16 13:53:18', '2024-11-20 22:32:44', 'P. LA ISLA COND. 2 M.2 L.3 # 15, PCN NATURA, SOLIDARIDAD, Q.ROO', 77725, '9847458331', '1981-09-08', 'SAVA810908RK4', 'SAVA810908HDFNLL01', '39058110287', 'Licenciatura', 'IDMEX2245928990', 'N/A', 'Antonio Santamaria (Padre)', '5513841273', 'RHRVIVIENDASC', 'Recursos Materiales', '2024-07-16', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Legal', '2308134403', NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'm', NULL, 'alexgzip@hotmail.com', 'recursos@notaria83qroo.mx', NULL, NULL),
(144, 'Prueba', NULL, 'ESTEFANY BLANCA', 'CARRILLO KU', 1, NULL, '2024-07-16 14:04:39', '2024-07-17 17:51:06', 'REG. 43 SM 1 MZ 18 LT 1 # 10 CALLE ZORSAL ROJIZO, PCN VILLAS DEL SOL, SOLIDARIDAD, Q.ROO', 77725, '9841772866', '1998-03-24', 'CAKE980324PH9', 'CAKE980324MQRRXS09', '17159883374', 'Licenciatura', 'IDMEX1513208512', 'N/A', 'Matilde Ku May (Madre)', '9841334927', 'RHRVIVIENDASC', 'Auxiliar de archivo', '2024-07-16', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', '-', '012180015241430918', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'ch', '-', 'estefanycarrilloku24@gmail.com', NULL, NULL, NULL),
(145, 'Prueba', NULL, 'DULCE ESPERANZA', 'ROSADO REYES', 0, NULL, '2024-07-16 14:14:01', '2024-11-22 17:47:20', 'VILLAS DEL SOL PLUS M1 L 11 CALLE FLAMENCOS, ZONA URBANA B, SOLIDARIDAD', 77710, '9933972972', '1998-04-06', 'RORD9804061T6', 'RORD980406MTCSYL04', '64159857404', 'Licenciatura', 'IDMEX1488150425', 'N/A', 'Luis Enrique Juárez (Esposo)', '9931692451', 'RHRVIVIENDASC', 'Auxiliar de archivo', '2024-07-16', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', '-', '012180015138064798', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'v. 63', 'xg', '646790146403287139', 'd.rosadoreyed@gmail.com', 'aux.archivo5@notaria83qroo.mx', NULL, NULL),
(146, 'Prueba', NULL, 'CATHERINE YEMIRETH', 'CASTRO GARCÍA', 0, NULL, '2024-07-22 20:29:05', '2024-12-31 14:52:00', 'FLAMENCOS SM 2 MZA 1 LTE 3 # 1 PCN VILLAS DEL SOL, SOLIDARIDAD, Q.ROO.', 77725, '9842560198', '1999-10-15', 'CAGC991015F28', 'CAGC991015MDFSRT04', '74169915803', 'Licenciatura', 'IDMEX2107872311', 'N/A', 'Braulio Valdez López (Esposo)', '9842476480', 'Avaluosygestoriapdcsc', 'Pasante', '2024-07-23', NULL, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', '-', '002694904385312457', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'm', '646690146403083734', 'yemireth3@gmail.com', NULL, NULL, NULL),
(147, 'Prueba', NULL, 'JUAN DIEGO', 'PEREZ MAR', 1, NULL, '2024-07-22 21:04:43', '2024-08-20 15:09:11', 'C. 15 SUR MZ 256 LT 13 X 80 Y 85 AV PCN EJIDO SUR, SOLIDARIDAD, Q.ROO.', 77712, '9842555671', '2003-11-05', 'PEMJ0311054M5', 'PEMJ031105HQRRRNB4', '46190321458', 'Licenciatura', 'IDMEX2318870089', 'N/A', NULL, NULL, 'RHRVIVIENDASC', 'Pasante', '2024-07-22', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', '-', '-', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'G', '-', 'juandiegoperezmar@gmail.com', 'pasante4@notaria83qroo.mx', NULL, NULL),
(148, 'Prueba', NULL, 'AHYME ARELI', 'SERRATOS DIAZ INFANTE', 0, NULL, '2024-07-22 22:45:47', '2025-01-15 22:47:52', 'PASEO DEL REAL M 16 L 3 DEPTO. J6, OLIVOS II, SOLIDARIDAD, Q.ROO', 77725, '3342975498', '1991-04-12', 'SEDA910412IN9', 'SEDA910412MGTRZH08', '12129132374', 'Preparatoria', 'IDMEX2595423053', 'N/A', 'Lorena Infante (amiga)', '4774139351', 'RHRVIVIENDASC', 'Facturista', '2024-07-23', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Administración', '-', '127180016179738252', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'XL', '646210146402527574', 'areserratos12@gmail.com', 'facturacion@notaria83qroo.mx', NULL, NULL),
(149, 'Prueba', NULL, 'DANIEL ALFONSO', 'DOMINGUEZ CHAVEZ', 1, NULL, '2024-08-05 21:57:15', '2024-08-05 21:58:45', '40 A 210 41 A 41 B FCO DE MONTEJO Y SILVIACHD1 GMAIL.COM, MERIDA, YUCATÁN', 97203, '9992235955', '1991-05-05', 'DOCD910505BA1', 'DOCD910505HDFMHN01', NULL, NULL, 'IDMEX1836336745', NULL, NULL, NULL, 'RHR83SC', 'Notario auxiliar', '2024-08-06', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Legal', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'daniel.dominguez.chavez@gmail.com', NULL, NULL, NULL),
(150, 'Prueba', NULL, 'ERICA ARLEN', 'REYES LOPEZ', 0, NULL, '2024-08-05 22:27:48', '2025-01-23 22:47:54', 'MZ 44 LT 1 # 40 PALMA MORROQUE # 40 PCN LAS PALMAS I, SOLIDARIDAD, QROO', 77723, '9902009829', '1980-02-02', 'CALE800202RJ8', 'CALE800202MMCLPR01', '39008006841', 'Preparatoria', 'IDMEX2577366998', 'si', 'Morga López Díaz (Madre)', '9842707879', 'RHRVIVIENDASC', 'Capturista', '2024-08-07', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Estocolmo', NULL, '012180015366415193', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', 'XG', '646690146403081079', 'ericaarlencalzadalopez019@gmail.com', 'capturista7@notaria83qroo.mx', NULL, NULL),
(151, 'Prueba', NULL, 'LEYDI ENRIQUETA', 'REYES MARTINEZ', 1, NULL, '2024-08-06 15:39:41', '2024-08-20 14:51:17', 'FRACC, PESCADORES M 17 L 9, CALLE BUBO, N° INT. PB, ZONA URBANA B, SOLIDARIDAD.', 77710, '9843202773', '1993-11-28', 'REML931128BT6', 'REML931128MVZYRY03', '20169397716', 'Licenciatura', 'IDMEX2461077854', 'N/A', 'Sergio Antonio Cruz (Esposo)', '9848042651', 'RHRVIVIENDASC', 'Auxiliar administrativo', '2024-08-07', NULL, NULL, NULL, NULL, '{\"label\":\"MARIA DE LA LUZ MARTINEZ MARTINEZ\",\"value\":47}', 'Administración', NULL, '012694015516995661', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '17', '2x', '646690146403081985', 'reyes_martinez93@outlook.es', 'aux.admon3@notaria83qroo.mx', NULL, NULL),
(152, 'Prueba', NULL, 'AIME MONTSERRAT', 'VIVAS ZAPATA', 1, NULL, '2024-08-14 18:28:28', '2024-10-29 17:35:17', 'BALAM TUN M 17 L 1 CALLE HOM, Zona Urbana A, Solidaridad', 77710, '9842176336', '1997-06-10', 'VIZA970610LUA', 'VIZA970610MYNVPM00', '10159705374', 'Licenciatura', 'IDMEX2487078268', 'N/A', 'María Asunción Zapata (Madre)', '9841052025', 'RHR83SC', 'Recepcionista', '2024-08-14', NULL, NULL, NULL, NULL, '{\"label\":\"DANIEL ALFONSO DOMINGUEZ CHAVEZ\",\"value\":149}', 'Recepción', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', 'V-123', 'CH', '646690146403090691', 'aiemont@hotmail.com', 'recepcion@notaria83.mx', NULL, NULL),
(153, 'Prueba', NULL, 'GRECIA ARLETTE', 'CANTE HU', 1, NULL, '2024-08-23 17:17:58', '2025-01-21 18:49:51', 'C.12 NTE MZ 77 ESQ. 135 LT 9 1, EJIDO NTE. C.P. 77712, SOLIDARIDAD, QROO', 77712, '9837002438', '1999-03-15', 'CAHG990315DL2', 'CAHG990315MQRNXR03', '18179965605', 'Licenciatura', 'IDMEX1600321483', NULL, 'Angel Felipe Núñez López (Pareja)', '9831587688', 'RHRVIVIENDASC', 'Auxiliar de Capital Humano', '2024-08-26', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Humanos', '-', '5579100437068487', NULL, '-', NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', '-', NULL, '-', 'greciacante15@gmail.com', NULL, NULL, NULL);
INSERT INTO `personal` (`id`, `actualContract`, `dateContractFinish`, `name`, `lastName`, `activo`, `id_check`, `created_at`, `updated_at`, `direction`, `cp`, `phone`, `birthday`, `rfc`, `curp`, `nss`, `school`, `ine`, `alergist`, `personalContact`, `phoneContact`, `empresa`, `puesto`, `ingreso`, `id_empleado`, `id_jefe_inmediato`, `id_departamento`, `id_puesto`, `inmBoss`, `wArea`, `infonavit`, `numCart`, `company`, `idLicNum`, `documents`, `contracts`, `documentsCompany`, `removeColaborator`, `img`, `numExt`, `utalla`, `numCarttwo`, `email`, `emailCompany`, `checkCode`, `ext_tel`) VALUES
(154, 'Prueba', NULL, 'GLORIA NOEMI', 'COLLI POOL', 1, NULL, '2024-08-23 17:54:24', '2025-01-21 19:01:52', 'MZ 21 LT 5 # 40 C. DOMINICO, VILLAS DEL SOL, C.P. 77725, SOLIDARIDAD, Q.ROO', 77725, '9842807341', '1994-07-08', 'COPG940708V89', 'COPG940708MQRLLL01', '(0)5149416868', 'Preparatoria', 'IDMEX1204061668', NULL, 'Gustavo Ché (Pareja)', '9842411179', 'RHRVIVIENDASC', 'Auxiliar de Avisos y Sistemas', '2024-08-26', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', '-', '127180016255738891', NULL, NULL, NULL, '[]', NULL, NULL, 'https://apiproduction.sil83.com/uploads/1737486112_custom_filename.jpg', '-', '-', '-', 'gloriacolli1994@gmail.com', NULL, NULL, NULL),
(155, 'Prueba', NULL, 'PAMELA ALEXANDRA', 'AGUILAR RUBIO', 1, NULL, '2024-08-27 16:35:25', '2024-08-27 22:56:43', 'CTO PASEO XAMAN-HA M-13 L-12 FRACC. PLAYACAR FII 77717, SOLIDARIDAD Q.ROO', 77717, NULL, '2000-08-31', 'AURP000831LS7', 'AURP000831MQRGBMA5', '05220056823', NULL, 'IDMEX1774151271', NULL, 'RAMON ROLANDO HEREDIA RUIZ', '9982382735', 'Avaluosygestoriapdcsc', 'Auxiliar de cierres', '2024-08-05', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, 'CH', NULL, 'pamelaaguilarrubio@gmail.com', 'pamela@notaria83qroo.mx', NULL, NULL),
(156, 'Prueba', NULL, 'CARMEN ELIZABETH', 'HAM RODRIGUEZ', 1, NULL, '2024-08-28 14:40:48', '2024-08-28 14:42:14', 'GONZALO GUERRERO I M 113 L 5 CALLE 18 AV. 40 Y 45 NTE CP. 77710 ZONA URBANA A, SOLIDARIDAD QUINTANA ROO', 77710, '9842054336', '1991-07-16', '9842054336', 'HARC910716MCSMDR06', '82109114791', NULL, 'INDEX2636087646', NULL, 'Lilia Rodriguez Ballinas (Madre)', '9841341476', 'RHRVIVIENDASC', 'Auxiliar de Avisos y Sistemas', '2024-08-29', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', NULL, '012694015911126462', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '646690146402109376', 'hamelizabeth16@gmail.com', NULL, NULL, NULL),
(157, 'Prueba', NULL, 'MARIA GUADALUPE', 'ZENTELLA LEON', 1, NULL, '2024-08-28 21:36:56', '2024-08-28 22:04:04', 'MZ 14 L4 C GAVILAN PESC #101 PNC PESCADORES F.C.P 77710 SOLIDARIDAD Q.ROO', 77710, '9841337516', '1985-09-05', 'ZELG850905BAA', 'ZELG850905MTCNND03', '83048506964', 'Secundaria', 'INDEX2477150505', NULL, 'LETICIA DEL LEON DE LA CRUZ', '9932597794', 'RHRVIVIENDASC', 'Limpieza', '2024-08-29', NULL, NULL, NULL, NULL, '{\"label\":\"ALEJANDRO GERARDO SANTAMARIA VILLANUEVA\",\"value\":143}', 'Recursos Materiales', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'zentellapita@gmail.com', NULL, NULL, NULL),
(158, 'Prueba', NULL, 'HERLIN', 'NOLASCO PÉREZ', 0, NULL, '2024-09-02 22:07:19', '2025-01-03 15:30:03', 'C.MONTE TANNU MZ36 LT01 #7 C. AV MONTES AZULES Y CDA. LOS SAUCES 3 PNC BOSQUE REAL FC.P. 77724', 77724, '9843190158', '1998-08-02', 'NOPH980802Q21', 'NOPH980802MCSLRR09', '37169890276', 'Licenciatura', 'INDEX2321506641', NULL, 'Enrique Flores Vazquez', '9621512910', 'RHRVIVIENDASC', 'Auxiliar de firmas', '2024-09-04', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Estocolmo', NULL, '012694015473678186', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '646690146403117422', 'herlinnolasco98@gmail.com', NULL, NULL, NULL),
(159, 'Prueba', NULL, 'KARLA BELISSA', 'CASTRO HERNANDEZ', 1, NULL, '2024-09-13 16:04:55', '2024-09-13 16:06:45', 'SM 79 MZ 32 LT 05 NO. 86 BAHIA DEL ESPIRITU SANTO PCN FRACC GUADALUPANA F.C.P 77724 SOLIDARIDAD, Q.R.', 77724, '9843104662', '1988-05-23', 'CAHK880523IPO', 'CAHK880523MDFSRR06', NULL, 'Preparatoria', 'INDEX2146239658', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Capturista', '2024-09-17', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', 'Atlanta', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'kbelissamay88@outlook.com', NULL, NULL, NULL),
(160, 'Prueba', NULL, 'CLAUDIA DANIELA SOLEDAD', 'FERNANDEZ ENRIQUEZ', 0, NULL, '2024-09-13 18:20:42', '2025-01-03 15:29:52', 'CONTOY MZ. 4 L. 1 SL.5 10D  PNC MISION LAS FLORES FC.P 77723 SOLIDARIDAD, Q.R.', 77723, '9841132738', '1980-07-24', 'FEEC800724KH9', 'FEEC800724MDFRNL01', '15998026791', 'Preparatoria', 'IDMEX2420901633', 'NA', 'DIEGO ARTURO RAMON', '9842460249', 'RHRVIVIENDASC', 'Cuentas por pagar', '2024-07-18', NULL, NULL, NULL, NULL, '{\"label\":\"KEVIN PEDRAZA CAMILO\",\"value\":91}', 'Administración', NULL, '012694015228968041', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '646690146403130810', 'dann_80_@hotmail.com', NULL, NULL, NULL),
(161, 'Prueba', NULL, 'LOURDES BEATRIZ', 'COHUO DZIB', 0, NULL, '2024-09-17 21:26:36', '2025-02-26 21:13:08', 'C 80 MZA 31 LT 13 NUEVA CREACION SCN 28 JULIO NVA CREACF C.F. 77714 SOLIDARIDAD Q.ROO.', 77714, '9848066751', '1996-02-03', 'CODL960203V68', 'CODL960203MQRHZR07', NULL, 'Preparatoria', 'INDEX1359186270', 'NA', NULL, NULL, NULL, 'Pasante', '2024-09-18', NULL, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'lourdescohuodzib@gmail.com', NULL, NULL, NULL),
(162, 'Prueba', NULL, 'JOSÉ DE JESÚS', 'CARRILLO MARTÍNEZ', 0, NULL, '2024-09-26 15:20:49', '2025-01-03 15:29:43', 'DIAG 80 AV MZ17 LT2 CP.00000 1A Y 3 PNC EJIDO SUR FC.P.77712', 77712, '9844634500', '1992-05-22', 'CAMJ9205223Z1', 'CAMJ920522HGTRRS05', '14079217692', NULL, NULL, NULL, 'CRISTINA MARTINEZ', '4422325228', 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2024-09-27', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, '014694568980650605', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'josejesuscarrillo22@gmail.com', NULL, NULL, NULL),
(163, 'Prueba', NULL, 'ROSSY DEL CARMEN', 'CAMARA LÓPEZ', 0, NULL, '2024-09-27 18:17:28', '2025-01-21 18:49:30', 'FRACC. PESCADORES M14 L4 CALLE GAVILAN PESCADORES N° EXT 101', 77710, '9984180164', '2005-08-29', 'CALR050829ITA', 'CALR050829MTCMPSA5', '62200595023', NULL, 'INDEX2533752324', NULL, 'DANIEL DOMINGUEZ VILLAREAL', '9931012586', NULL, 'Limpieza', '2024-09-30', NULL, NULL, NULL, NULL, '{\"label\":\"ALEJANDRO GERARDO SANTAMARIA VILLANUEVA\",\"value\":143}', 'Recursos Materiales', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'rossycamara@cecytab.edu.mx', NULL, NULL, NULL),
(164, 'Prueba', NULL, 'ANGEL DE JESUS', 'RIVERA MARTINEZ', 0, NULL, '2024-09-30 21:21:44', '2025-01-15 22:46:40', 'MZ6 LT8 #109 CERRADA QUILLA FTE CDA JAGUAR TLM PTO AVE FPTO-MAYA FC. P. 77734 SOLIDARIDAD. Q.R.', 77734, '9843107641', '1996-04-06', 'RIMA9604063P6', 'RIMA960406HVZVRN09', '42169661248', 'Licenciatura', 'IDMEX2200131287', 'NA', 'VICKI MARTINEZ MORALES', '9843128433', 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2024-10-04', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'juridicorivera96@gmail.com', NULL, NULL, NULL),
(165, 'Prueba', NULL, 'JOSE DE JESUS', 'PATIÑO CHAVEZ', 0, NULL, '2024-10-02 14:37:06', '2025-01-15 22:46:27', 'CALLE ABELARDO RODRIGUEZ 139 CASA 8 FRACC ARANJUEZ COL MODERNA DE LA CRUZ C.P. 50180', 50180, '5631317442', '1971-01-28', 'PACJ710128NK4', 'PACJ710128HDFTHS09', '70877102239', 'Licenciatura', 'IDMEX1877687839', 'NA', NULL, NULL, NULL, 'Gerente de Contabilidad', '2024-10-02', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Contabilidad', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, NULL, 'j.jesus.patino@gmail.com', NULL, NULL, NULL),
(166, 'Prueba', NULL, 'ANETTE YURIDIA', 'VARGAS PECH', 1, NULL, '2024-10-21 16:47:24', '2024-10-22 15:53:23', 'MZ3 LT1 C.52 LAGO SAN MARTIN PNC GALAXIA DEL CARMEN CP. 77713 SOLIDARIDAD, Q.ROO', 77723, '9841312162', '2002-07-30', 'VAPA0207305A4', 'VAPA020730MQRRCNA5', '38170281349', 'Licenciatura', 'INDEX2128550957', 'NA', 'MARIA MERCEDES PECH PUC', '9841760560', 'RHRVIVIENDASC', 'Capturista', '2024-10-24', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '728969000125734470', 'anetteyuridia@gmail.com', NULL, NULL, NULL),
(167, 'Prueba', NULL, 'SHADE DESIDERE', 'RODAS HERNANDEZ', 0, NULL, '2024-10-22 18:20:37', '2025-02-26 21:13:00', 'CERR RUBI MZA 9 LT1 UP 06 CERRADA RUBI PNC RESIDENCIAL LA JOY FC.P 77717 SOLIDARIDAD, Q.R.', 77717, '9841110408', '2001-07-17', 'ROHS010717LC9', 'ROHS010717MMCDRHA1', '22130102258', 'Preparatoria', 'INDEX2613431431', NULL, 'ANTONIO ZARDON (PAREJA)', '9841520895', 'RHRVIVIENDASC', 'Recepcionista', '2024-10-24', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recepción', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '728969000125744787', 'shaderodas2001@gmail.com', NULL, NULL, NULL),
(168, 'Prueba', NULL, 'FERNANDO ALEXIS', 'MARTÍNEZ AGUILAR', 1, NULL, '2024-10-30 15:28:13', '2024-10-30 15:29:52', 'MZ 2 LT10 CALLE IBIS #26 PNC FRACC PESCADORES FC.P. 77710 SOLIDARIDAD, Q.R.', 77710, '9841846691', '1994-03-02', 'MAAF940302TD3', 'MAAF940302HCLRGR06', '82129452072', 'Preparatoria', 'IDMEX1276015237', NULL, 'BRISA LIZEZTH MARIO PEREZ', '9842362897', NULL, 'Encargado de Área', '2024-10-31', NULL, NULL, NULL, NULL, '{\"label\":\"IMELDA ACOSTA ROBLES\",\"value\":30}', 'Recursos Materiales', NULL, '1576955441', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '728969000126321772', 'alexis.martinezpiit@gmail.com', NULL, NULL, NULL),
(169, 'Prueba', NULL, 'EUSEBIO', 'RICALDE TUYU', 0, NULL, '2024-11-07 17:44:49', '2025-01-24 22:49:07', 'C JACANAS 19 PB MZ7 LT08 JACANAS PCN VILLAS DEL SOL FC.P 77724 SOLIDARIDAD, Q.R.', 77724, '9841688790', '1987-01-27', 'RITE86122DG8', 'RITE86122HYNCYS05', '84108607759', 'Licenciatura', 'IDMEX2590053956', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Cuentas por pagar', '2024-11-11', NULL, NULL, NULL, NULL, '{\"label\":\"KEVIN PEDRAZA CAMILO\",\"value\":91}', 'Administración', '2318123414', '1590042371', NULL, NULL, NULL, '[]', NULL, NULL, 'https://placehold.co/600x400?text=sin+foto', NULL, NULL, '728969000126825689', 'e.ricaldetuyu@gmail.com', NULL, NULL, NULL),
(170, 'Prueba', NULL, 'BRILLY MONSERRAT', 'MORENO SANTIAGO', 0, NULL, '2024-11-20 21:54:00', '2025-02-26 21:12:53', 'MZ80 LT1 AV CONST ESQ 75 AV NTE PNC EJIDO NTE FC.P. 77712 SOLIDARIDAD, Q.ROO', 77712, '5545727840', '1997-04-09', 'MOSB970409UE9', 'MOSB970409MDFRNR05', '72169752531', NULL, 'IDMEX1647231370', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Nominista', '2024-11-21', NULL, NULL, NULL, NULL, '{\"label\":\"JOSE DE JESUS PATIÑO CHAVEZ\",\"value\":165}', 'Contabilidad', NULL, '1593771846', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000127868263', 'bril97@hotmail.com', NULL, NULL, NULL),
(171, 'Prueba', NULL, 'MIGUEL DAVID', 'CÁCERES LARA', 1, NULL, '2024-11-25 14:30:43', '2024-11-25 14:31:32', '10A AV MZ518 LT11 X 102 Y 104 CALLES 102 Y 104 PCN COLOSIO FC. P. 77728 SOLIDARIDAD Q.R.', 77728, '9983214005', '1997-06-02', 'CALM970602BD1', 'CALM970602HQRCRG04', '63159764297', 'Preparatoria', 'IDMEX1294151256', 'NA', NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2024-11-26', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', 'Atlanta', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000128018012', 'davidcacereslara@gmail.com', NULL, NULL, NULL),
(172, 'Prueba', NULL, 'LIYAH JOCELYN', 'UC CHAN', 0, NULL, '2024-11-26 17:59:54', '2025-02-17 15:39:04', 'MZ 49 LT1 #3737 C. SAO PABLO CALLE SAO PABLO PNC VILLAS RIVERA FC.P 77725 SOLIDARIDAD, Q.R.', 77725, '9843204871', '2002-01-12', 'UCLI0201122U6', 'UXCL020112MQRCHYA6', '25200292271', 'Preparatoria', 'IDMEX2245911716', 'NA', 'MARIA FELIPA CHAN TAMAY', '9843151743', 'RHRVIVIENDASC', 'Auxiliar de Avisos y Sistemas', '2024-11-27', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', NULL, '1511330952', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000128283685', 'jocelynuc873@gmail.com', NULL, NULL, NULL),
(173, 'Prueba', NULL, 'JHONATTAN', 'SANTIAGO CRUZ', 1, NULL, '2024-11-28 21:10:16', '2024-11-28 21:11:24', 'MZ16 LT1 C12 110 Y 115 AV PNC EJIDO NORTE FC.P. 77712 SOLIDARIDAD Q.R.', 77712, '9531567283', '1996-01-02', 'SACJ960102QU6', 'SACJ960102HOCNRH07', '01219643291', 'Licenciatura', 'IDMEX2663680212', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Auxiliar de cierres', '2024-11-29', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', NULL, '1557959567', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000131186368', 'jhonasan150710@gmail.com', NULL, NULL, NULL),
(174, 'Prueba', NULL, 'ASBANI IRIEL', 'TZUC CHUC', 1, NULL, '2024-12-10 18:27:53', '2024-12-10 20:58:05', 'MISION DE LAS FLORES III M 35 L 1 CALLE TREBOL CP 77710 SOLIDARIDAD Q.ROO', 77710, '9842498244', '2002-09-22', 'TUCA020922G54', 'TUCA020922MQRZHSA0', '46170240678', 'Preparatoria', 'IDMEX2165210636', 'NA', 'ASUNCION DE MARIA CHUC MAY', '9842022085', NULL, 'Pasante', '2024-12-10', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000097564396', 'irieltzuc@gmail.com', NULL, NULL, NULL),
(175, 'Prueba', NULL, 'IVETT', 'RIVERA JUAREZ', 1, NULL, '2025-01-06 21:19:08', '2025-01-08 15:23:40', 'VILLAS DEL SOL III M 18 L 2 CALLE ZORSAL ROJIZO CP 77710 SOLIDARIDAD Q.R', 77710, '9844497966', '1985-08-31', 'RIJI850831VA1', 'RIJI850831MTCVRV06', '83088508318', 'Secundaria', 'IDMEX2441880098', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Limpieza', '2025-01-07', NULL, NULL, NULL, NULL, '{\"label\":\"FERNANDO ALEXIS MARTÍNEZ AGUILAR\",\"value\":168}', 'Recursos Materiales', NULL, '15474583388', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'ivettr292@gmail.com', NULL, NULL, NULL),
(176, 'Prueba', NULL, 'JORDY JAIR', 'PEREZ FLORES', 1, NULL, '2025-01-06 21:25:23', '2025-01-08 15:22:47', 'LUIS DONALDO COLOSIO II M 416 L 4 AVENIDA 10 ESQ C 78 NTE CP 77710 SOLIDARIDAD Q.R', 77710, '9844510753', '1985-08-31', 'PEGJ990814FY1', 'PEFJ990814HCCRLR02', '71169935203', 'Preparatoria', 'IDMEX1643604176', 'N/A', NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2025-01-07', NULL, NULL, NULL, NULL, '{\"label\":\"ANA ISABEL FERADO CALLEROS\",\"value\":77}', 'Chicago', NULL, '012694015687417832', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000133861034', 'jordyjairp@gmail.com', NULL, NULL, NULL),
(177, 'Prueba', NULL, 'BRETZIL GUADALUPE', 'SANDOVAL SEGURA', 1, NULL, '2025-01-14 22:29:54', '2025-01-21 18:30:59', 'PALMA AZUL M1 L5 #V28 PALMANOVA PNC PALMANOVA C.P. 77710 SOLIDARIDAD Q.R.', 77710, NULL, '1998-01-31', 'SASB980131BZ9', 'SASB980131MMNNGR08', '03229831957', 'Licenciatura', 'IDMEX1469663977', 'NA', 'MARIA GUADALUPE SEGURA AXALA', NULL, 'RHR83SC', 'Auxiliar de Avisos y Sistemas', '2025-01-16', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', NULL, '151 628 6679', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'lic.sandoval31@outlook.com', NULL, NULL, NULL),
(178, 'Prueba', NULL, 'DAVID ANTONIO', 'CHAN KU', 1, NULL, '2025-01-20 21:49:05', '2025-01-20 22:23:35', 'SM.66 MZA 4 L1 NO.5 PUERTO RICO PNC MUNDO HABITAD FC.P 77714 SOLIDARIDAD, QR.', 77714, NULL, '2002-05-07', 'CAKD020507R24', 'CAKD020507HQRHXVA5', '01190204766', NULL, 'IDMEX2063446375', 'NA', 'WENDY M. KU MORENO - MADRE', NULL, 'RHRVIVIENDASC', 'Cuentas por pagar', '2025-01-22', NULL, NULL, NULL, NULL, '{\"label\":\"KEVIN PEDRAZA CAMILO\",\"value\":91}', 'Administración', NULL, '012180015481944455', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '72896900039940761', 'davidchku14@gmail.com', NULL, NULL, NULL),
(179, 'Prueba', NULL, 'ADRIAN DE JESUS', 'TAMAYO TORRES', 1, NULL, '2025-01-20 21:53:04', '2025-01-29 15:21:43', 'MZ4 LT3 SUBLT 2#4D VILLA. C GAVILAN PNC MISION DE LAS FLORES FC.P 77723 SOLIDARIDAD, Q.R.', 77723, NULL, '1998-08-24', 'TATA980824C12', 'TATA980824HQRMRD02', '55169896598', 'Licenciatura', 'IDMEX2450175187', 'NA', NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2025-01-27', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, '021695066052386621', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000134810738', 'adriantamayo248@gmail.com', NULL, NULL, NULL),
(180, 'Prueba', NULL, 'JOSHUA NEFTHALI', 'LÓPEZ NAVARRO', 0, NULL, '2025-01-24 16:34:07', '2025-01-29 18:42:09', 'C DZIDZANTUN MZA 23 L4 C72 SUPMZA 50 COSTA DEL MAR 77533 BENITO JUAREZ, Q.ROO.', 77533, NULL, NULL, 'LONJ8904164A9', 'LONJ890416HMCPVS00', '82098921891', 'Preparatoria', 'IDMEX2604398336', NULL, 'MARIA LUISA NAVARRO NIEVES (MADRE)', NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de Firmas', '2025-01-27', NULL, NULL, NULL, NULL, '\"\"', 'Berlín', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'joshua8904@hotmail.com', NULL, NULL, NULL),
(181, 'Prueba', NULL, 'JOSHUA NEFTHALI', 'LÓPEZ NAVARRO', 1, NULL, '2025-01-24 16:37:10', '2025-01-29 17:32:37', 'C DZIDZANTUN MZA 23 L4 C72 SUPMZA 50 COSTA DEL MAR 77533 BENITO JUAREZ, Q.ROO.', 77533, NULL, '1989-04-16', 'LONJ8904164A9', 'LONJ890416HMCPVS00', '82098921891', 'Preparatoria', 'IDMEX2604398336', 'NA', 'MARIA LUISA NAVARRO NIEVES (MADRE)', NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de Firmas', '2025-01-30', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', NULL, '1509772827', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000135368645', 'joshua8904@hotmail.com', NULL, NULL, NULL),
(182, 'Prueba', NULL, 'MARIA FERNANDA', 'GUZMAN OLIVAS', 1, NULL, '2025-02-05 15:43:15', '2025-02-13 14:32:00', 'C CIENEGA 31 FRACC LOMAS DE CAPISTRANO 52987 ATIZAPAN DE ZARAGOZA, MEX.', 77710, '9842498244', '2001-10-12', 'MAEE9908037B1', 'GUOF011012MDFZLRA2', '02180156297', 'Preparatoria', 'IDMEX2379044854', NULL, NULL, NULL, NULL, 'Pasante', '2023-05-23', NULL, NULL, NULL, NULL, '{\"label\":\"NEIDY IMELDA CASTILLO JIMENEZ\",\"value\":56}', 'Avisos y Sistemas Notariales', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'marifergo2001@outlook.com', NULL, NULL, NULL),
(183, 'Prueba', NULL, 'CHRISTIAN ALEXIS', 'GARCIA SILVA', 1, NULL, '2025-02-05 17:36:02', '2025-02-05 17:47:34', 'FRACC JARDINES DE MAYAKOBA M05 L03 AVENIDA BOSQUES DE CRISTO REY DEPTO 106-AJ1 CONDOMINIO RORAIMA CP 77724', 77724, NULL, '1995-09-10', 'GASC950910R62', 'GASC950910HSPRLH08', '(0)2199516770', 'Licenciatura', 'IDMEX2222953375', NULL, NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de firmas', '2025-02-06', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', 'Francia', NULL, '0121800150905173312', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '728969000135535999', 'abg.alexisgarcia@gmail.com', NULL, NULL, NULL),
(184, 'Prueba', NULL, 'ABEL', 'GUARDA NOH', 1, NULL, '2025-02-10 22:30:57', '2025-02-13 14:28:11', 'C23 CON 105 Y 110 MZ35 CP7 105 PNC FORJADORES FCP 77716 SOLIDARIDAD, Q.ROO', 77716, NULL, '2004-06-23', 'HECR040623HBCRSYA3', 'HECR040623HBCRSYA3', '50200606981', 'Preparatoria', 'IDMEX2699928319', 'NA', NULL, NULL, NULL, 'Pasante', '2025-02-11', NULL, NULL, NULL, NULL, '{\"label\":\"VIVIANA DE MONSERRAT SANCHEZ ARENAS\",\"value\":104}', 'Gestoría', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'abelnoh85@gmail.com', NULL, NULL, NULL),
(185, 'Prueba', NULL, 'AIDEE VANESSA', 'CÁCERES ROJAS', 0, NULL, '2025-02-10 22:34:45', '2025-03-11 20:08:00', '55 AV X 24 Y 26 MZA 26 LT1  PNC EJIDO NTE FC77712 SOLIDARIDAD, Q.ROO', 77712, NULL, '1994-09-11', 'CARA940911MQRCJD02', 'CARA940911MQRCJD02', '82129424675', 'Preparatoria', 'IDMEX2726084315', 'NA', NULL, NULL, 'RHRVIVIENDASC', 'Auxiliar de archivo', '2025-02-11', NULL, NULL, NULL, NULL, '{\"label\":\"MAYDE JANET VERA GUZMAN\",\"value\":50}', 'Archivo', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'aidee94caceres@gmail.com', NULL, NULL, NULL),
(186, 'Prueba', NULL, 'RAYMUNDO', 'HERNANDEZ CASTILLO', 1, NULL, '2025-02-11 16:34:00', '2025-02-13 14:27:42', 'C JILGUEROS M3 L9 N52 PA FRACC. VILLAS DEL SOL II 77723 SOLIDARIDAD. Q.ROO', 77723, NULL, '2004-06-23', 'HECR040623HBCRSYA3', 'HECR040623HBCRSYA3', NULL, 'Preparatoria', 'IDMEX2340449877', 'NA', NULL, NULL, NULL, 'Pasante', '2025-02-11', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'raymundohernandezcastillo91@gmail.com', NULL, NULL, NULL),
(187, 'Prueba', NULL, 'SILVIA ANTONIA', 'CABALLERO BASTIDA', 1, NULL, '2025-02-13 17:15:23', '2025-02-13 17:16:11', 'MZ24 LT10 ESPATULA #34 PNC VILLAS DEL SOL FCP 77724 SOLIDARIDAD Q.ROO', 77724, '5511426675', '1972-12-08', 'CABS721208865', 'CABS721208MDFBSL02', '30047201212', NULL, 'IDMEX1320950505', 'NA', 'SANDRA CABALLERO', '9981462024', 'RHR83SC', 'Auxiliar de cierres', '2025-02-14', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'ochosilvia@hotmail.com', NULL, NULL, NULL),
(188, 'Prueba', NULL, 'RODOLFO ANGEL', 'SALAS RAMOS', 1, NULL, '2025-02-13 22:04:56', '2025-02-14 20:14:59', 'MZ1 LT09 #E101 COND P CHIT COND PALMA CHIT PNC PALMANOVA CP 77710 SOLIDARIDAD. Q.ROO', 77710, NULL, '1997-03-27', 'SARR970327GR4', 'SARR970327HTSLMD05', '34169708996', 'Licenciatura', 'IDMEX2672337668', NULL, NULL, NULL, 'RHR83SC', 'Auxiliar Legal', '2025-02-14', NULL, NULL, NULL, NULL, '{\"label\":\"MIRIAM NINZARINDARI OVILLA CORZO\",\"value\":83}', 'Estocolmo', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'angel_salasramo03@outlook.com', NULL, NULL, NULL),
(189, 'Prueba', '2025-03-14', 'JUAN LUIS', 'LÓPEZ BUSTOS', 1, NULL, '2025-02-13 22:07:08', '2025-02-17 17:21:44', 'MISION DEL ANGEL #409A M23 L CDA MISION DEL ANGEL Y MISION DEL CARMEN PNC MISION DEL CARMEN FCP 77724 SOLIDARIDAD, Q.ROO', 77724, NULL, '1986-09-16', 'LOBJ860916IDA', 'LOBJ860916HTCPSN00', '83078606262', NULL, 'IDMEX2534237787', NULL, NULL, NULL, 'RHR83SC', 'AUX SISTEMAS', '2025-02-14', NULL, NULL, NULL, NULL, '{\"label\":\"REBECA AURORA GONZALEZ RUIZ\",\"value\":85}', 'Recursos Materiales', NULL, NULL, NULL, NULL, NULL, '[{\"tipo\":\"Prueba\",\"inicio\":\"2025-02-14\",\"termino\":\"2025-03-14\",\"dateContractFinish\":\"2025-03-14\"},{\"tipo\":\"Capacitacion\",\"inicio\":\"\",\"termino\":\"\"},{\"tipo\":\"Evaluacion\",\"inicio\":\"\",\"termino\":\"\"},{\"tipo\":\"Indeterminado\",\"inicio\":\"\",\"termino\":\"\"}]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'juanluislb86@hotmail.com', NULL, NULL, NULL),
(190, 'Prueba', NULL, 'DILCIA CARMINA', 'LÓPEZ PÉREZ', 1, NULL, '2025-02-19 14:38:55', '2025-02-19 14:43:39', '140 AV MZ66 LT3 X 35 SUR CP MED VEC 2Y72N9 PNC BELLAVISTA FCP 77713 SOLIDARIDAD Q.ROO', 77713, NULL, '2003-08-19', 'LOPD030819MCSPRLA9', 'LOPD030819MCSPRLA9', '17200399131', 'Preparatoria', 'IDMEX2693385853', 'NA', 'NIDIA LOPEZ PEREZ', NULL, NULL, 'Pasante', '2025-02-17', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '72 8969 0001 3648 9293', 'dilciakarmi@gmail.com', NULL, NULL, NULL),
(191, 'Prueba', NULL, 'LUCIO', 'FLORES HERRERA', 1, NULL, '2025-02-21 14:22:55', '2025-02-21 14:36:59', '2DA CDA CAÑADA DE ROSQUIN 2 LA CAÑADA ALVARO OBREGÓN, CIUDAD DE MEXICO CDMX 01260', 1260, NULL, '1970-12-03', 'FOHL701203U77', 'FOHL701203HDFLRC09', '30917030972', 'Licenciatura', 'IDMEX1522013011', NULL, NULL, NULL, 'RHR83SC', 'Gerente de Contabilidad', '2025-02-21', NULL, NULL, NULL, NULL, '{\"label\":\"RAMÓN ROLANDO HEREDIA RUIZ\",\"value\":89}', 'Contabilidad', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'cp.lucioflores.soluciones@gmail.com', NULL, NULL, NULL),
(192, 'Prueba', NULL, 'YARELLY MARIBEL', 'CASTILLO LAVADORES', 1, NULL, '2025-02-21 17:32:15', '2025-02-21 17:33:38', 'FRACC. PORTO ALTO M05 L4 AVENIDA P. SERENA C. P HUATULCO Y P. LOS CABOS DEPTO D EDIFICIO 43 1ER NIVEL CONDOMINIO HUATULCO CUATRO CP', 77710, NULL, '1989-02-07', 'CALY8902079A1', 'CALY890207MYNSVR03', '82138914369', 'Preparatoria', 'IDMEX1643667645', 'NA', 'FRANCISCO JAVIER CADENA SOSA (ESPOSO)', NULL, 'RHRVIVIENDASC', 'Facturista', '2025-02-24', NULL, NULL, NULL, NULL, '{\"label\":\"DIANA ESMERALDA RAMOS OLVERA\",\"value\":79}', 'Administración', NULL, '1279 1601 3654 405727 (BZ)', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '72 8969 0000 0714 3037', 'calyare89@gmail.com', NULL, NULL, NULL),
(193, 'Prueba', NULL, 'JULIO MANUEL', 'DZIB PAREDES', 1, NULL, '2025-02-27 16:43:10', '2025-02-27 16:45:20', 'SM 259 M 102 L34 AV.LEONA VICARIO FRACC VILLAS OTOCH PARAISO CP 77539, ZONA URBANA CANCÚN', 77539, '9987587688', '1998-09-14', 'DIPJ980914RH0', 'DIPJ980914HCCZRL07', '55169814690', 'Preparatoria', 'IDMEX2731592140', NULL, NULL, NULL, 'Avaluosygestoriapdcsc', 'Auxiliar de Firmas', '2025-03-03', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', NULL, '6618282475', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'julioparedes914@gmail.com', NULL, NULL, NULL),
(194, 'Prueba', NULL, 'YOSAHANDI MARYCRUZ', 'HERNANDEZ CORONA', 1, NULL, '2025-02-27 17:03:14', '2025-02-27 17:05:02', 'COL. EJIDAL III M106 L13 CALLE 8/AV 85 Y 90 NTE CP 77710 SOLIDARIDAD Q.ROO', 77710, '9841986018', '1999-05-03', 'HECY990503753', 'HECY990503MQRRRS02', '71169972024', 'Licenciatura', 'IDMEX2267110571', NULL, NULL, NULL, 'RHRVIVIENDASC', 'Abogado Jr', '2025-03-03', NULL, NULL, NULL, NULL, '{\"label\":\"ALAN DAVID POLANCO SANTOS\",\"value\":76}', 'Berlín', NULL, '012 180 015626360315', NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, '72 8969 0001 3771 8277', 'marycruz0599@hotmail.com', NULL, NULL, NULL),
(195, 'Prueba', NULL, 'MARÍA MAGDALENA', 'GONZÁLEZ RODRÍGUEZ', 1, NULL, '2025-03-07 21:36:21', '2025-03-07 21:55:34', 'FRACC PASEOS DE XCACEL M6 L2 AVENIDA CONSTITUYENTES DEPTO 2C CONDOMINIO PLAYA CHETUMAL CP 77723 SOLIDARIDAD', 77723, NULL, '1991-08-22', 'GORM9108228Q7', 'GORM910822MDFNDG02', '11139106469', 'Maestria', 'IDMEX2156902418', 'NA', 'OSCAR TREJO ROJAS', NULL, 'RHRVIVIENDASC', 'Abogado Jr.', '2025-03-10', NULL, NULL, NULL, NULL, '{\"label\":\"KAREN EUNICE TORRES REYES\",\"value\":81}', 'Atlanta', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'mmgr22@hotmail.com', NULL, NULL, NULL),
(196, 'Prueba', NULL, 'VALENTIN', 'VIDAL ANGULO', 1, NULL, '2025-03-07 21:45:58', '2025-03-07 21:56:17', 'SM3 MZ3 LT1 #E 403 CALZADA DEL SOL TLM PTO AVD FPTO-MAYA FC.P 77734 SOLIDARIDAD, Q.R.', 77734, NULL, '2000-02-14', 'VIAV0002146W9', 'VIAV000214HTCDNLA2', '10160061718', 'Licenciatura', 'IDMEX2601299627', 'NA', 'LEONEL PÉREZ GALLEGO', NULL, 'RHR83SC', 'Auxiliar de cierres', '2025-03-10', NULL, NULL, NULL, NULL, '{\"label\":\"RAMONA DE JESUS PECH GOMEZ\",\"value\":59}', 'Cierres', NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'vidalvalentin65@gmail.com', NULL, NULL, NULL),
(197, 'Prueba', NULL, 'CRISTINA', 'LUIS SILVA', 1, NULL, '2025-03-13 22:10:39', '2025-03-13 22:17:22', 'MZ 23 LT6 #38 C NUBE CP 000 PNC MISION DE LAS FLORES FCP 77723 SOLIDARIDAD Q.R.', 77723, NULL, NULL, 'LUSC980711DL3', 'LUSC980711MVZSLR06', '17149812574', 'Licenciatura', 'IDMEX1598803002', NULL, NULL, NULL, 'RHR83SC', NULL, '2025-03-18', NULL, NULL, NULL, NULL, '{\"label\":\"TAHIMY VLADAMIR POOL KU\",\"value\":70}', NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'crissluis98@gmail.com', NULL, NULL, NULL),
(198, 'Prueba', NULL, 'DIANA ROSY', 'BAAK HOMA', 1, NULL, '2025-03-13 22:19:50', '2025-03-13 22:19:50', 'CALLE AVESTRUCES MZA 73 LOTE L PALMAS 1 CP 77723 SOLIDARIDAD Q.R.', 77723, NULL, '1999-07-27', 'BAHD990727LI1', 'BAHD990727MYNKMN06', '20169998646', 'Licenciatura', 'IDMEX1641863074', NULL, NULL, NULL, 'RHRVIVIENDASC', NULL, '2025-03-18', NULL, NULL, NULL, NULL, '{\"label\":\"LUCIO FLORES HERRERA\",\"value\":191}', NULL, NULL, NULL, NULL, NULL, NULL, '[]', NULL, NULL, 'https://th.bing.com/th/id/OIP.4-g8iHzmoxK1nsA0zc0oXwHaHa?pid=ImgDet&rs=1', NULL, NULL, NULL, 'dianabaakhoma@gmail.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(10, 'App\\Models\\User', 1, 'auth_token', '0ecb5cff4d74d7645bc711a9e36e08802e1893ee0909d7809c8be62571da22b7', '[\"*\"]', '2025-11-25 10:03:23', NULL, '2025-11-25 05:52:56', '2025-11-25 10:03:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_departamento` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submodules`
--

CREATE TABLE `submodules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `parent_submodule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `submodules`
--

INSERT INTO `submodules` (`id`, `module_id`, `name`, `slug`, `description`, `icon`, `route`, `order`, `is_active`, `parent_submodule_id`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Directorio', 'empleados-directorio', NULL, 'BookUser', '/empleados/directorio', 1, 1, NULL, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(2, 1, 'Organigrama', 'empleados-organigrama', NULL, 'Network', '/empleados/organigrama', 2, 1, NULL, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(3, 1, 'Expedientes', 'empleados-expedientes', NULL, 'Folder', '/empleados/expedientes', 3, 1, NULL, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(4, 1, 'Datos Personales', 'expedientes-datos-personales', NULL, NULL, '/empleados/expedientes/datos-personales', 1, 1, 3, 2, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(5, 1, 'Documentos', 'expedientes-documentos', NULL, NULL, '/empleados/expedientes/documentos', 2, 1, 3, 2, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(6, 1, 'Historial Laboral', 'expedientes-historial', NULL, NULL, '/empleados/expedientes/historial', 3, 1, 3, 2, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(7, 1, 'Onboarding', 'empleados-onboarding', NULL, 'UserPlus', '/empleados/onboarding', 4, 1, NULL, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(8, 1, 'Offboarding', 'empleados-offboarding', NULL, 'UserMinus', '/empleados/offboarding', 5, 1, NULL, 1, '2025-10-25 15:54:51', '2025-10-25 15:54:51', NULL),
(9, 2, 'Registro de Tiempo', 'tiempo-registro', NULL, 'ClockCheck', '/tiempo/registro', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(10, 2, 'Checadas', 'tiempo-checadas', NULL, NULL, '/tiempo/registro/checadas', 1, 1, 9, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(11, 2, 'Horas Extras', 'tiempo-horas-extras', NULL, NULL, '/tiempo/registro/horas-extras', 2, 1, 9, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(12, 2, 'Ausencias', 'tiempo-ausencias', NULL, 'CalendarX', '/tiempo/ausencias', 2, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(13, 2, 'Solicitudes', 'ausencias-solicitudes', NULL, NULL, '/tiempo/ausencias/solicitudes', 1, 1, 12, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(14, 2, 'Balance de Días', 'ausencias-balance', NULL, NULL, '/tiempo/ausencias/balance', 2, 1, 12, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(15, 2, 'Calendario', 'tiempo-calendario', NULL, 'Calendar', '/tiempo/calendario', 3, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(16, 2, 'Turnos', 'tiempo-turnos', NULL, 'RotateCw', '/tiempo/turnos', 4, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(17, 3, 'Proceso de Nómina', 'nomina-proceso', NULL, 'Calculator', '/nomina/proceso', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(18, 3, 'Cálculo', 'nomina-calculo', NULL, NULL, '/nomina/proceso/calculo', 1, 1, 17, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(19, 3, 'Validación', 'nomina-validacion', NULL, NULL, '/nomina/proceso/validacion', 2, 1, 17, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(20, 3, 'Dispersión', 'nomina-dispersion', NULL, NULL, '/nomina/proceso/dispersion', 3, 1, 17, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(21, 3, 'Recibos de Nómina', 'nomina-recibos', NULL, 'FileText', '/nomina/recibos', 2, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(22, 3, 'Percepciones y Deducciones', 'nomina-percepciones-deducciones', NULL, 'Percent', '/nomina/percepciones-deducciones', 3, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(23, 3, 'Finiquitos', 'nomina-finiquitos', NULL, 'FileCheck', '/nomina/finiquitos', 4, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(24, 4, 'Evaluaciones', 'desempeno-evaluaciones', NULL, 'ClipboardCheck', '/desempeno/evaluaciones', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(25, 4, 'Evaluación 360°', 'evaluaciones-360', NULL, NULL, '/desempeno/evaluaciones/360', 1, 1, 24, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(26, 4, 'Evaluación por Objetivos', 'evaluaciones-objetivos', NULL, NULL, '/desempeno/evaluaciones/objetivos', 2, 1, 24, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(27, 4, 'Evaluación Continua', 'evaluaciones-continua', NULL, NULL, '/desempeno/evaluaciones/continua', 3, 1, 24, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(28, 4, 'Objetivos (OKRs)', 'desempeno-okrs', NULL, 'Target', '/desempeno/okrs', 2, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(29, 4, 'One-on-Ones', 'desempeno-one-on-ones', NULL, 'MessageCircle', '/desempeno/one-on-ones', 3, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(30, 4, 'Feedback', 'desempeno-feedback', NULL, 'MessageSquare', '/desempeno/feedback', 4, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(31, 5, 'Vacantes', 'reclutamiento-vacantes', NULL, 'Briefcase', '/reclutamiento/vacantes', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(32, 5, 'Crear Vacante', 'vacantes-crear', NULL, NULL, '/reclutamiento/vacantes/crear', 1, 1, 31, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(33, 5, 'Publicar Vacante', 'vacantes-publicar', NULL, NULL, '/reclutamiento/vacantes/publicar', 2, 1, 31, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(34, 5, 'Candidatos', 'reclutamiento-candidatos', NULL, 'Users', '/reclutamiento/candidatos', 2, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(35, 5, 'Pipeline', 'reclutamiento-pipeline', NULL, 'GitBranch', '/reclutamiento/pipeline', 3, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(36, 5, 'Entrevistas', 'reclutamiento-entrevistas', NULL, 'CalendarDays', '/reclutamiento/entrevistas', 4, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(37, 6, 'Cursos', 'capacitacion-cursos', NULL, 'Book', '/capacitacion/cursos', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(38, 6, 'Catálogo', 'cursos-catalogo', NULL, NULL, '/capacitacion/cursos/catalogo', 1, 1, 37, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(39, 6, 'Mis Cursos', 'cursos-mis-cursos', NULL, NULL, '/capacitacion/cursos/mis-cursos', 2, 1, 37, 2, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(40, 6, 'Planes de Desarrollo', 'capacitacion-planes', NULL, 'Map', '/capacitacion/planes', 2, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(41, 6, 'Certificaciones', 'capacitacion-certificaciones', NULL, 'Award', '/capacitacion/certificaciones', 3, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(42, 6, 'Proveedores', 'capacitacion-proveedores', NULL, 'Building', '/capacitacion/proveedores', 4, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(43, 7, 'Seguro Médico', 'beneficios-seguro-medico', NULL, 'HeartPulse', '/beneficios/seguro-medico', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(44, 7, 'Vales de Despensa', 'beneficios-vales', NULL, 'ShoppingCart', '/beneficios/vales', 2, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(45, 7, 'Plan de Pensiones', 'beneficios-pensiones', NULL, 'PiggyBank', '/beneficios/pensiones', 3, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(46, 7, 'Otros Beneficios', 'beneficios-otros', NULL, 'Sparkles', '/beneficios/otros', 4, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(47, 8, 'Dashboards', 'reportes-dashboards', NULL, 'LayoutDashboard', '/reportes/dashboards', 1, 1, NULL, 1, '2025-10-25 15:54:52', '2025-10-25 15:54:52', NULL),
(48, 8, 'Dashboard General', 'dashboards-general', NULL, NULL, '/reportes/dashboards/general', 1, 1, 47, 2, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(49, 8, 'Dashboard Ejecutivo', 'dashboards-ejecutivo', NULL, NULL, '/reportes/dashboards/ejecutivo', 2, 1, 47, 2, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(50, 8, 'Rotación de Personal', 'reportes-rotacion', NULL, 'RefreshCw', '/reportes/rotacion', 2, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(51, 8, 'Ausentismo', 'reportes-ausentismo', NULL, 'CalendarX', '/reportes/ausentismo', 3, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(52, 8, 'Costos de Nómina', 'reportes-costos', NULL, 'DollarSign', '/reportes/costos', 4, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(53, 8, 'Exportar Datos', 'reportes-exportar', NULL, 'Download', '/reportes/exportar', 5, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(54, 9, 'Empresa', 'config-empresa', NULL, 'Building', '/configuracion/empresa', 1, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(55, 9, 'Información General', 'empresa-info', NULL, NULL, '/configuracion/empresa/info', 1, 1, 54, 2, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(56, 9, 'Sucursales', 'empresa-sucursales', NULL, NULL, '/configuracion/empresa/sucursales', 2, 1, 54, 2, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(57, 9, 'Departamentos', 'empresa-departamentos', NULL, NULL, '/configuracion/empresa/departamentos', 3, 1, 54, 2, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(58, 9, 'Puestos', 'empresa-puestos', NULL, NULL, '/configuracion/empresa/puestos', 4, 1, 54, 2, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(59, 9, 'Usuarios y Permisos', 'config-usuarios', NULL, 'Shield', '/configuracion/usuarios', 2, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(60, 9, 'Políticas', 'config-politicas', NULL, 'FileText', '/configuracion/politicas', 3, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(61, 9, 'Integraciones', 'config-integraciones', NULL, 'Plug', '/configuracion/integraciones', 4, 1, NULL, 1, '2025-10-25 15:54:53', '2025-10-25 15:54:53', NULL),
(62, 10, 'Adminisrador', 'Home de administrador', 'pantalla home de administrador', 'House', '/home_admin', 0, 1, NULL, 1, '2025-11-20 23:48:32', '2025-11-20 23:48:38', NULL),
(63, 10, 'Colaborador', 'Home de colaborador', 'Pantalla de inicio del colaborador', 'House', '/home_colaborator', 1, 1, NULL, 1, '2025-11-20 23:50:24', '2025-11-20 23:50:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_personal` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `passwordLetter` varchar(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `deviceOffice` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_personal`, `name`, `email`, `email_verified_at`, `password`, `passwordLetter`, `active`, `remember_token`, `device`, `deviceOffice`, `created_at`, `updated_at`) VALUES
(1, 5, 'alexis', 'alexisduarte1512@gmail.com', NULL, '$2y$10$9Yip/fJ5XytxGoRDw8ZS9OqsFxAp67a0BJ01H/KCd8LuYS69.SrW.', 'VSzONcle', 1, NULL, 'ckq9nrl28z7169z7brw9dn', NULL, NULL, '2024-09-27 01:05:47'),
(23, 12, 'AGUEDA SELENE', 'auxiliar.humano@notaria83qroo.mx', NULL, '$2y$10$OgHA04OHAbDpyjlUMAR8JOXB.sWH.eQapfAmDEDs5WeQkybgzkbTm', 'UwnCPSJg', 1, NULL, NULL, NULL, '2023-12-20 19:58:24', '2024-04-23 21:39:25'),
(25, 85, 'REBECA AURORA', 'capital.humano@notaria83.mx', NULL, '$2y$10$Yg5.gPFoG19gn8ombpf0NulD73qWK71iuA8gNIFfoMvbSgOO5OwJO', 'KZAQeHGb', 1, NULL, NULL, NULL, '2023-12-21 03:44:51', '2024-11-12 20:03:16'),
(27, 45, 'LUIS ALBERTO', 'lug_cia90@hotmail.com', NULL, '$2y$10$ivjStdmcCrIjjGOLUJyH7OPOOPDf.CeYEBi7qmcsHmsHaqqDqwBau', 'dzpaCnTI', 1, NULL, NULL, NULL, '2024-01-29 18:47:34', '2024-04-23 21:13:18'),
(28, 87, 'WILBER ALBERTO', 'myforyou09876@gmail.com', NULL, '$2y$10$98Pl.s0I24V8ZI.83655DeJ9Flk.AQ810QFfMgdRXWaVIN6aMWWRu', 'RCIBTsNd', 1, NULL, 's1k2adzyyd9yoylcmn7b6', 's62a5ypsm8ed17nhglwvw', '2024-01-29 18:49:47', '2024-09-27 05:28:44'),
(29, 34, 'JORDY FRANCISCO', 'jordycalderon29@gmail.com', NULL, '$2y$10$SJZpgdWTELq/8L3QQdfxrei6CvYV3LyRL02LSUEqh7YKnNdDiaClC', NULL, 1, NULL, NULL, NULL, '2024-01-29 18:50:20', '2024-02-20 03:18:05'),
(30, 6, 'ADAM LEONARDO', 'al.chan.garcia@gmail.com', NULL, '$2y$10$RZUrzab9UEvTZSE.NxZDX.ZgFlOjEzP4mMsI4/xQs6GBfNYFHIb5u', 'xJBltKdm', 1, NULL, '4fgowshwuybzx343wfkiz', 'mzxfpxhopg9agi0uyx0zvw', '2024-02-21 04:48:42', '2024-09-26 05:01:59'),
(31, 100, 'KARINA CELESTE', 'KARINAAQUINOLOPEZ@GMAIL.COM', NULL, '$2y$10$0U16nCPJYbq4fTw7.t.wouZ0RpPtWqM0Qb/2tTqtOEOYhfUJkeasq', 'MGyvdgoY', 1, NULL, NULL, NULL, '2024-04-09 00:00:38', '2024-10-08 22:32:37'),
(32, 8, 'ALEJANDRO', 'alejandror0906@gmail.com', NULL, '$2y$10$b2eVbomZ9LWfA.NgVb3ue.lLj4MFEkCuDss4TaaL8tcMUc6erii5u', 'TgYkZfxj', 1, NULL, 'dne3ub67xgvbohqgbqexlv', 'uq8ztbt3sscwrv2kp78ix', '2024-04-11 19:30:33', '2024-09-26 19:21:53'),
(33, 13, 'ANGELA GUADALUPE', 'castillodzul85@gmail.com', NULL, '$2y$10$EHwt6scLKGtP7S.wsqGysufcvm4hLRiCEOoDwEYBhwxMeMlz.Xqvi', 'bxNHphuL', 1, NULL, '2n5imvbt1oxlfh37ik1ynl', NULL, '2024-04-11 19:30:34', '2024-09-26 20:46:53'),
(34, 15, 'DENISE GUADALUPE', 'deniser_126@hotmail.com', NULL, '$2y$10$OP/.vNmOew76QV93oc6HNuwctxFHryJb5Gy4mi3uyiDMPLH3N6GWe', 'HfYLFWjM', 1, NULL, NULL, NULL, '2024-04-11 19:30:34', '2024-05-15 20:42:37'),
(35, 16, 'ESTEFANY LIZET', 'gamboaestefany06@gmail.com', NULL, '$2y$10$E26Oxpz47HKldyzqDOIKKuhi8WyX5EyR9FqJKbLPIC/rkTaPxOAKm', 'QBwvmplW', 1, NULL, 'z4yytv9szjpclmzjxq4bei', 'vr7mc28g3imrhiv7tttbdc', '2024-04-11 19:30:35', '2024-09-30 19:50:45'),
(36, 18, 'DULCE VIANEY', 'dulcediaz9319@gmail.com', NULL, '$2y$10$qz9EwrpQY3PKlMtM8TrPF.8VCJENxVTruJnUipjKOU/ydUZ1GwtLO', 'qBHvmkcX', 1, NULL, NULL, NULL, '2024-04-11 19:30:35', '2024-05-15 20:42:50'),
(37, 20, 'EDGAR DEL ANGEL', 'edgarmay0308@gmail.com', NULL, '$2y$10$2XYSdVQTzUI7aSVIHZ7roOleHrVrS6vy5sgZY9/tzimAz77F2sjqu', 'XciQpENg', 1, NULL, 'irfkp3g11bunuq2k6y1n', 'wkxqowt13psjno9ui7hj', '2024-04-11 19:30:35', '2024-09-27 04:51:49'),
(38, 24, 'EDGAR JONATHAN', 'jocarrillo213@gmail.com', NULL, '$2y$10$esiViN7N3cEPs2Zu0DaNju6XWsxt.bNsnCEWejkDkxWC865kuyY62', 'CqetbfLD', 1, NULL, 'ad1uz5ex6qri561kxxd', 'vd7rhyzic4andwxqk62xhc', '2024-04-11 19:30:36', '2024-09-30 19:38:16'),
(39, 25, 'ERICKA MARGARITA', 'erickacasan@hotmail.com', NULL, '$2y$10$H4GJWPsWjjSoqUkaJ9PPW..BM8S5yfHyhZIf2zaXm7JA3T44UtmYi', 'aOpomzLP', 1, NULL, NULL, NULL, '2024-04-11 19:30:36', '2024-04-11 19:30:36'),
(40, 26, 'EVA ROMINA', 'olivas_ev@hotmail.com', NULL, '$2y$10$0UkNpnhsVBzjYkc5tP8QJ.gf80Uo4om87QIIIrFIo4YEv02j8VnTC', 'oBTeaXwp', 1, NULL, 'qf1aillnmnwp06dp5lc3', NULL, '2024-04-11 19:30:37', '2024-09-30 19:55:51'),
(41, 28, 'GENNY JUDITH', 'taurina-96@hotmail.com', NULL, '$2y$10$Pq6sLe53uz4k0BZZO6ZZ3.WyMmDCqc8o/75T3Ualt04Vbta7C4nJ.', 'FshniQuz', 1, NULL, 's8p54xgi00ahyetycrib8k', '28us2hdyfr4gkvi6fp1ed4', '2024-04-11 19:30:37', '2024-09-26 19:41:39'),
(42, 30, 'IMELDA', 'acosta_imelda@hotmail.com', NULL, '$2y$10$XHsAsmdsw3PYJbjE2iHHTeJKw/o7jdtT3ndWWauf4vG3xH6TwxvMi', 'ovPmxjMp', 1, NULL, 'u8k86t80rkgpu6q4ftb4h', NULL, '2024-04-11 19:30:37', '2024-09-26 01:19:16'),
(43, 31, 'ITZEL', 'itzelramirezjuridico@gmail.com', NULL, '$2y$10$8NkiqRYoVWjPD6LQTjgPZ.bvzrJIMSs/PiVzXSkpFsMMdqqVE32Eu', 'JqBObGmK', 1, NULL, 'aydylmd8pmsrgyw0vup5g8', 'lktg2lg4k1ogg09muwc16k', '2024-04-11 19:30:38', '2024-09-26 05:13:02'),
(44, 37, 'JUAN MIGUEL', 'jmcolintellez@outlook.com', NULL, '$2y$10$Wf.6Y6kh4JFufg..DUWnTeq2syHK57HXXP4NGlY7iQp2CUfnWqBpK', 'WHgAXIxF', 1, NULL, 'svfqdwm8wii9c9nq68v3', 'ka1wy9jesy3acw7x0c0ar', '2024-04-11 19:30:38', '2024-09-26 03:09:02'),
(45, 39, 'JOSE ALEJANDRO', 'futaguila7@gmail.com', NULL, '$2y$10$ToagSUyhiuosXVSTCtLRheoKJp2LbcM3ssLRoaXnnMfdyFZYVG4ja', 'aOpomzLP', 1, NULL, NULL, NULL, '2024-04-11 19:30:38', '2024-04-11 19:30:38'),
(46, 41, 'JESSIKA FERNANDA', 'ferrr.rojas@outlook.com', NULL, '$2y$10$72t9ot/hQOs6C.Mf85l1q.qOpkesMkw2QrXXUDxewsPoUMgfZ9cRO', 'fyBeZoJu', 1, NULL, NULL, NULL, '2024-04-11 19:30:39', '2024-05-15 20:44:04'),
(47, 42, 'KAREN LIZETH', 'kliizeth1392@gmail.com', NULL, '$2y$10$xvfLCcxmlNq6FNOFTqH.sO.kwgZ9hNBTSQdfAIU/tgb3KjNfuan4S', 'zFiJXRSU', 1, NULL, NULL, 'cynho7wkcqctwlfbvwxwzp', '2024-04-11 19:30:39', '2024-09-30 20:32:00'),
(48, 43, 'KEYREN', 'keyren_dom15@hotmail.com', NULL, '$2y$10$kFruf.SvGa2.y8mKQ3xJjexwC549OnXCous6ikuY1jWs8bR51GqzW', 'iMTRhUWb', 1, NULL, NULL, NULL, '2024-04-11 19:30:39', '2024-05-15 20:44:11'),
(49, 44, 'LIZBET GUADALUPE', 'ldejesus.ius.inc@gmail.com', NULL, '$2y$10$2YneIWq2ySaOeCkm4AHmfeHUmm49DcnrXGKeG5pU2YteQmMiA9EPy', 'aOclxvLm', 1, NULL, NULL, NULL, '2024-04-11 19:30:40', '2024-05-15 20:44:16'),
(50, 46, 'LIZZETH NAYELI', 'lizzeth_nayeli13@hotmail.com', NULL, '$2y$10$vocWJEb.6JerjhRUF.hhjOK0IEoGRQkpy79UoGDBsZXocL0TmPznS', 'DTJLVRQj', 1, NULL, '45egzp5yrny0vzvqrhrg7ff', 'c5p35lahauo5mdvcxrcsn2', '2024-04-11 19:30:40', '2024-09-26 19:49:44'),
(51, 47, 'MARIA DE LA LUZ', 'luxma9326@gmail.com', NULL, '$2y$10$38O6pNOl/9KBTmfQSzt7Ue8HEvYC6EsmUsmMODY.QhGnIOQw21.6.', 'FhkESbGA', 1, NULL, 'rki29ja3gsz6lx4viw0sj', NULL, '2024-04-11 19:30:40', '2024-09-26 19:59:49'),
(52, 48, 'MARIANA DEL ROSARIO', 'balammtn@gmail.com', NULL, '$2y$10$.p.BhOXwFGe7ald77hvpMeUla2.Qj2ix7BGpgmhUSEJ9MPgbJCxbe', 'STrbywZs', 1, NULL, 'ajpi6lp6brgf2e72vxrzpj', NULL, '2024-04-11 19:30:41', '2024-09-26 05:25:13'),
(53, 50, 'MAYDE JANET', 'carnalita0886@gmail.com', NULL, '$2y$10$8bKysHqWdJW.nx2BSvuJReFP5Wuqx5lWc.Ee5hmMuF3QYUvTrYLZK', 'xcilpXGu', 1, NULL, 'ags6t1qc3yqes3bv10artf', 'nlg1o82k67g5ej9hx2s59t', '2024-04-11 19:30:41', '2024-09-26 18:36:06'),
(54, 51, 'MIRNA MERCEDES', 'mvelazquezc031@gmail.com', NULL, '$2y$10$UzO6WxgdZjAUlGe.io3szeh4zrcM96Cyn6YO5wKYduB6j11MrkC8.', 'aOpomzLP', 1, NULL, NULL, NULL, '2024-04-11 19:30:41', '2024-04-11 19:30:41'),
(55, 55, 'NADIA OLIVA', 'nadiao.canela@gmail.com', NULL, '$2y$10$YG/lw2aTPurixcbl0LQHgO69Y7YFwrv2HajQsTuOOCm0UW3qaJLPe', 'edYBEHRF', 1, NULL, NULL, NULL, '2024-04-11 19:30:42', '2024-05-15 20:45:45'),
(56, 56, 'NEIDY IMELDA', 'neidycastillo48@gmail.com', NULL, '$2y$10$7jRkNT9ugHenwUvhAbPAXeu1VhsrT/gNsCFTqwXFzmJDtWxQg6UKG', 'yQbdKMWl', 1, NULL, 'pbk2e9vi27rxxubp6vthso', 'gftb9zb0qfnuqcxc59zs', '2024-04-11 19:30:42', '2024-09-27 19:39:02'),
(57, 57, 'OLIVIA', 'oliviapale2@gmail.com', NULL, '$2y$10$ffrxYLWcDMX4/nPTTKkWVOxc5zDVDmqazWpalOaQx8sNPzTk2AuUy', 'MHxYROKL', 1, NULL, 'zxym4g22x2voywrzmuyp', NULL, '2024-04-11 19:30:43', '2024-09-26 02:03:54'),
(58, 58, 'OSMAR ZIAMED', 'osmarziamedm@gmail.com', NULL, '$2y$10$h2.nCYTycVSgWU9CB4rxMeWBxL/lEfvG.Q8w5JyKJYgDQk1XeRYmy', 'flGwVUyR', 1, NULL, 'a7ohh4z6emhlx6p76ya1p', 'jswsjwi76c4ztpgs3ztnr', '2024-04-11 19:30:43', '2024-09-27 19:30:33'),
(59, 59, 'RAMONA DE JESUS', 'romipech27@gmail.com', NULL, '$2y$10$o46PD/7L74Ys.95pEV1tYui0Ts8Wr/ol/Qfv24fCm5SqwFpGVRWlC', 'gvfsXAdo', 1, NULL, NULL, NULL, '2024-04-11 19:30:43', '2024-10-23 22:11:04'),
(60, 60, 'REYNA ISABEL', 'reyna.ikm@gmail.com', NULL, '$2y$10$H5oqCayxATO3/OGzbz63reEzOog70p7colY3kpXCGJjLfHJxvoGVG', 'sgKmWDeH', 1, NULL, '7ac6sjw8t9kkpv207gleeh', 'l83p5jx3ydrs4736zwoppd', '2024-04-11 19:30:44', '2024-09-27 01:38:16'),
(61, 61, 'SEIDY YARELY', 'seydi.colli@gmail.com', NULL, '$2y$10$A/r71oG0ZLmAM.SyWCtFxeXrj9IasiKjqQZSnLvpiE4pd83BKxpXG', 'FNPmVRjL', 1, NULL, 'guyenr7oief77fad6kumma', 'f0wost3aazrq2hecdzt2ve', '2024-04-11 19:30:44', '2024-09-27 05:05:23'),
(62, 62, 'SUEELEN HAYDE', 'sueelen.villagomez@gmail.com', NULL, '$2y$10$kg/9Q3lRXzMTdhmqaYXReOybYcrcKod72fpX5rMrcoZ5BNEpvuc9W', 'WXfIkhYD', 1, NULL, 'v0y4vr8rm1k25ul6ovllmo', 'eqhbz6vh447zewdd4cd4o', '2024-04-11 19:30:44', '2024-09-26 05:02:01'),
(63, 63, 'SARA', 'saringa7908@gmail.com', NULL, '$2y$10$OSOILHUnyK2KJDFfT29uhe7w/PZM4OeFlpENvxt4OqOxxANOs/swe', 'rswGBMQT', 1, NULL, 'kzf9vqd2qnglbf5tldrqd', 'mv5sqrock0soewilnnbzg', '2024-04-11 19:30:45', '2024-09-26 05:12:55'),
(64, 64, 'SABRINA GUADALUPE', 'aguilarsabrina1201@gmail.com', NULL, '$2y$10$nqVc6LcankwV2uK8bte6j.1alAw/mGkPgbNAcGv8t.1FdtC5.1kK.', 'WjDFzpQL', 1, NULL, 'rmk3b6ryyfpsbur95ha8n', 'bmtyng2g7u06y74r1v98b7', '2024-04-11 19:30:45', '2024-09-27 19:51:47'),
(65, 66, 'SERGIO ELI', 'sergio_roblero@outlook.es', NULL, '$2y$10$h7DyxptTzzcsTF.qynHiHeO/8lLBgMDA71N6vvCIIlWds2.HkOf86', 'sUGbAWIr', 1, NULL, 't8j8vyi07sajapkp57cxo', '1flfapxihc4nl5rvaskmn', '2024-04-11 19:30:45', '2024-09-27 19:18:31'),
(66, 67, 'SARA', 'sara171095@hotmail.com', NULL, '$2y$10$.hQ8yt0eteGdmmrYAk7BGulT06peoX12NKw7afY4nFkl5bN..8c9W', 'iQmblLva', 1, NULL, NULL, 'z06zxc8u22sg50b1hnw9yw', '2024-04-11 19:30:46', '2024-09-28 04:10:46'),
(67, 68, 'SANTOS OMAR', 'santos_omar97@hotmail.com', NULL, '$2y$10$V12ssoGwT6blC2ECzzwSbOPXmqVXS./yZuo4YL9JVCYrU0gwtlQ/2', 'NOiVaeZu', 1, NULL, NULL, NULL, '2024-04-11 19:30:46', '2024-06-04 20:19:55'),
(68, 69, 'SILVIA ADRIANA', 'adriana _qj@hotmail.com', NULL, '$2y$10$.uF8En/H721dHdiLrisuI.jyMFNOTKIrv39016baQDp4n1sq7B0Pu', 'OYQkepMv', 1, NULL, NULL, NULL, '2024-04-11 19:30:46', '2024-06-04 00:21:19'),
(69, 70, 'TAHIMY VLADAMIR', 'tay_per_984@hotmail.com', NULL, '$2y$10$eA8zTqkXbZE.hWfRNkAC5OglC5i7c/Lp317V4Lnc2s44dCTizhs3y', 'VPWNlgmn', 1, NULL, NULL, '7gig0dhxpll2qqa1zae4c', '2024-04-11 19:30:46', '2024-09-26 19:52:14'),
(70, 71, 'TERESA DE JESÚS', 'rguez1998@gmail.com', NULL, '$2y$10$KNeDhZ9abVj0g8J87ffncONzdiP1Aowb.OmrQCywwcqw04FG0Elw2', 'dcuYsKmx', 1, NULL, NULL, 'w63ejh1lyvraxn1eyytqku', '2024-04-11 19:30:47', '2024-09-26 19:47:55'),
(71, 72, 'VICTOR ALFONSO', 'vicetz880507@gmail.com', NULL, '$2y$10$i3kjiAsRyRaJNkDQP43Ru.ymyLugxLPqoh0U.NQoqztdaIrtjSNCi', 'XfzyuMSA', 1, NULL, NULL, 'q1mukeqnkivahhg75c9ps', '2024-04-11 19:30:47', '2024-09-26 19:51:19'),
(72, 73, 'YAMILI', 'yamilicn120@gmail.com', NULL, '$2y$10$OXz6ruiGWG6WXJAsTa0jOevtmupajqa.zRY3d4gxl3BxuMqoCFTRm', 'yLhaHwkb', 1, NULL, '97npe83rzgu7vlcjzsced8', '782a4lda0me885sskfh2g', '2024-04-11 19:30:47', '2024-09-27 19:51:35'),
(73, 74, 'YAZMIN DEL CARMEN', 'ancheytahernandezyazmin@gmail.com', NULL, '$2y$10$.9LXjDvVKSbarrBGnmgKUeteAASosyrwKXeun7Bcw9SVih0jV6FSW', 'kHivOxyR', 1, NULL, '64dh8juatvb34qc4d4jjns', 'pu7jxbg0lgq0rngp31nm96', '2024-04-11 19:30:48', '2024-09-26 05:00:57'),
(74, 75, 'JIMENA', 'jgsanabria@gmail.com', NULL, '$2y$10$FJ9x8m0.lyw5K/13gq3lHewZpUctxatbsfxuCYweIZ7UU3xQaQJba', 'SArqdBkp', 1, NULL, '1f3usj89fp7uy2ka7c9mqs', NULL, '2024-04-11 19:30:48', '2024-09-26 05:20:00'),
(75, 76, 'ALAN DAVID', 'polancosantosalan@gmail.com', NULL, '$2y$10$o6derKpXPTFMR4SvppNbRuk3o7rZGvgoVeWWdxpFiJBNlcTKtJOq2', 'tFfUhjbL', 1, NULL, 'uth99fgpcsg35nq2hn9zby', NULL, '2024-04-11 19:30:48', '2024-09-26 05:14:00'),
(76, 77, 'ANA ISABEL', 'aferadocalleros@gmail.com', NULL, '$2y$10$SIghDNIlQyAi4L.sb3YtIOjX59cWtRtAO3b71IMrIDMAfFE/lWPUC', 'yefJndQj', 1, NULL, NULL, '1jqhp3w9sy4betekrdz4h', '2024-04-11 19:30:49', '2024-09-27 19:47:33'),
(77, 79, 'DIANA ESMERALDA', 'dianaeramos@me.com', NULL, '$2y$10$zMTPExR.H8JkTpJswwP6U.aJlnCSqlWfh2o1mZWK1tLER3Esw7aMq', 'MgYpDHAk', 1, NULL, NULL, 'j7j2f1pry6ssw84t7u8qqf', '2024-04-11 19:30:49', '2024-09-26 05:03:08'),
(78, 80, 'JENNIFER JAZMIN', 'jazb.baldomero@gmail.com', NULL, '$2y$10$PPUkRtAuNq.LeFurHdv.EeoscnxXuYr78SAoZ7cQIn6NH5XJ96dhW', 'PLSOsiBA', 1, NULL, NULL, NULL, '2024-04-11 19:30:50', '2024-05-15 20:48:13'),
(79, 81, 'KAREN EUNICE', 'karetorres1114@gmail.com', NULL, '$2y$10$qY.vqvaGFl9HmPEnXhM0I.O.NCwSdeNjnrDQIOhUvYeFk.D6FOoBe', 'HUZMNahz', 1, NULL, '2q9pce8trl9pxwzt406oum', 'kvuflh0njdfyyvbwo4gv', '2024-04-11 19:30:50', '2024-09-26 19:08:45'),
(80, 83, 'MIRIAM NINZARINDARI', 'miriamcorzo126@gmail.com', NULL, '$2y$10$1pFruRN60gmJunLu511KKOb9VzZg.UJGACbaDN/bmE3ApKDzd9QTm', 'vCnOyYUL', 1, NULL, NULL, '4quxrpq3o2l7mkvq03gdp3', '2024-04-11 19:30:50', '2024-09-26 20:25:23'),
(81, 84, 'MERLY RUBI', 'rubiramos140987@gmail.com', NULL, '$2y$10$XrOkH8fQrLRK/7AmoIg6cegWOHwL24JX1PzuaZhi364f0tVn97PQC', 'XcOiprqz', 1, NULL, '0hbyy7pj1sa8jui6czzpn78', NULL, '2024-04-11 19:30:50', '2024-09-26 19:30:20'),
(82, 86, 'LILIBET', 'vazquezramirezlili@gmail.com', NULL, '$2y$10$LUY.ntZm4NL/nzwu5YFnTeVaO9DEJilLn9VHmRsXZ5JYPUiYMtOHm', 'twlWqUHk', 1, NULL, '4hqw44awniszq8lvut8g3k', 'qtu7c02klsbv5cd6kea2', '2024-04-11 19:30:51', '2024-09-27 01:06:22'),
(83, 88, 'ANGEL EDUARDO', 'angelreynososo22032906@gmail.com', NULL, '$2y$10$DXfxclbz.a1P0gmZUzWOCuuJI2Dc29LlBCyZ2VVVWlbsnsY3ReIc.', 'ycqahmAG', 1, NULL, NULL, NULL, '2024-04-11 19:30:51', '2024-05-15 20:48:33'),
(84, 89, 'RAMÓN ROLANDO', 'notarioheredia@notaria83.mx', NULL, '$2y$10$hiurvBj0OUvI3VfX1cqQXOvSx9CGLakB5NaLNSfLBVgVNzQb6/oFS', 'QSFCILrG', 1, NULL, NULL, NULL, '2024-04-11 19:30:51', '2024-05-15 20:48:40'),
(85, 90, 'MAYRA AZUCENA', 'mayrarosadoborges18@gmail.com', NULL, '$2y$10$R63AIW.bwL2RLD9yhH4HV.MiLH8fTCasU2Iw2LWLm1gQtzhdCLyAG', 'qCPRUeBO', 1, NULL, NULL, NULL, '2024-04-11 19:30:52', '2024-05-15 20:48:44'),
(86, 91, 'KEVIN', 'kpedrazacamilo@gmail.com', NULL, '$2y$10$SJqUo1RaiaUDFn/oyBKajOpG7FmWmYXuOtylh2i9LGp5dl9knHpnG', 'oczTAGLK', 1, NULL, 'ah7klgacg6cng82y084dh', 't6ji8fa7duj4faut9oqjnu', '2024-04-11 19:30:52', '2024-09-26 05:04:17'),
(87, 93, 'LUIS MANUEL', 'lu-is0070@hotmail.com', NULL, '$2y$10$Sl9TAVPr72wHj0sRta3Dae9tUUmRmQEbVn1JDS/QD8xKhtFTyW4qy', 'UoHJsjfK', 1, NULL, NULL, NULL, '2024-04-11 19:30:52', '2024-05-15 20:48:50'),
(88, 94, 'ADDY YOLANDA', 'dzibaddy127@gmail.com', NULL, '$2y$10$O2g2.2pENJ8yMcC5DBPV5O8naAD2YkZsniHT3MiE9m17wM3LAhK/u', 'zIjptAva', 1, NULL, NULL, NULL, '2024-04-11 19:30:53', '2024-10-04 04:08:55'),
(89, 96, 'ROSALBA', 'rosa.gtz@live.com.mx', NULL, '$2y$10$HC9qAjUja3AYIWktuvFYvuyWaBYrFvSJx4rf6R84hd1kPFgmtyv4y', 'hIqVgRiz', 1, NULL, NULL, NULL, '2024-04-11 19:30:53', '2024-05-15 20:48:58'),
(90, 97, 'MARTÍN ALBERTO', 'ing.agro.martinpoot@gmail.com', NULL, '$2y$10$Cf0GLN8qsRBqddnHjgYu3e9BA4Fe1VWLMwkFAa1bJwlxXL4Jht9Oa', 'oumgqWZG', 1, NULL, '2rf35q1scyy3828l8ih154', 'rnc9b8wb78pqgzlivdtzrj', '2024-04-11 19:30:53', '2024-09-27 04:58:58'),
(91, 98, 'ANGELA  IBETH', 'angelaizl614@gmail.com', NULL, '$2y$10$ZOHFnd1Oj9G8HLAVUjn.KuLCeMkm5ZUbi4.10cx2JBRniU/KjvvP2', 'xmHpXAwd', 1, NULL, 'yusscazunj89h1jcrkmz4b', 'tf2noab7f1qrlaxbc9r', '2024-04-11 19:30:54', '2024-09-26 23:08:43'),
(92, 99, 'RENÉ', 'renecarrillo817@gmail.com', NULL, '$2y$10$d/s9jhTX5Li8UXJVFF123.R4Pocr/AYviQvsY16m.W6N4v4sTD6KO', 'mFISztiJ', 1, NULL, '9l6sfdl9f5s327bq0qkdpt', 'aq52c8pzvh4cldnofcnwmk', '2024-04-11 19:30:54', '2024-09-26 19:39:09'),
(93, 101, 'ANA DEL CARMEN', 'anaaquono@gmail.com', NULL, '$2y$10$woLI0c3PBY9LMBC.M6kW3.ZYxchGqDuJKE/vJLA0LwxzwkAdXwfO.', 'AaNmPWsr', 1, NULL, 'apakoy902c7il1n2qxqdb', 'n6k50oy3d6mgqkibopw4', '2024-04-11 19:30:54', '2024-09-30 19:53:43'),
(94, 102, 'ADA ROSALBA', 'adasprduper@gmail.com', NULL, '$2y$10$ycWt/xzmo.07/VwhePSsO.yg3gR2OrM1EpmYFrkEC5puqf1oytvj.', 'NnZHFXfM', 1, NULL, NULL, NULL, '2024-04-11 19:30:55', '2024-05-15 20:49:24'),
(95, 106, 'RICARDO', 'ricardo_rios_cortes@hotmail.com', NULL, '$2y$10$Ec9Vr93htIqN0hnhVv4Tu.QsHUWc9HuHdZHJ4xUdaL726hudIpmvO', 'CeAVopgf', 1, NULL, NULL, NULL, '2024-04-15 23:21:01', '2024-05-15 20:49:27'),
(96, 105, 'MARIO', 'mariolinaresvillatoro144@gmail.com', NULL, '$2y$10$rFGhd7A8s.WDlLeK552hwufdU0Iloy/NokYXgCq/Yq8TmCpKtCLEy', 'EDkMiZVF', 1, NULL, NULL, 'mjzmtwjkllqfdhsunt6b9', '2024-04-15 23:21:41', '2024-09-28 08:10:51'),
(97, 103, 'ADRIAN', 'axoolcan@gmail.com', NULL, '$2y$10$ZNrdJQp1b/IbVsAqp4x1l.uuaSrfrbOuA4AXd8GBWhJPNMrkqjsa.', 'vhOAdfZn', 1, NULL, 'wo07uo08a8ea93mvenq3g5', 'brpy1rvvzrg03pma6dsq0c5', '2024-04-15 23:22:23', '2024-10-01 05:07:17'),
(98, 101, 'ANA DEL CARMEN', 'anaaquono@gmail.com', NULL, '$2y$10$T343srGntHvpYFZ.vnhUVeDh9KvIAwYjc3sl0iimbdOFqJWCQ226y', 'PVMZkGKr', 1, NULL, NULL, NULL, '2024-04-15 23:22:37', '2024-05-15 20:49:42'),
(100, 104, 'VIVIANA DE MONSERRAT', 'monserrat.sanchez.arenas15@gmail.com', NULL, '$2y$10$w0uc5L4wUGMBcoILzXXbn.jAg2nVSo.R5GBnHnRHb0roAwxl0Ljpu', 'CIzfRSrG', 1, NULL, NULL, '63u9hdq2pqqag6zwpzbcqp', '2024-04-15 23:32:23', '2024-09-26 05:30:09'),
(101, 109, 'MARIA DEL ROSARIO', 'charytellitud@gmail.com', NULL, '$2y$10$OVhusColPX.6gYyZaqlu/OuEOt3SC4UnRoPWT0x95gYg6irvabNny', 'itHQEpyK', 1, NULL, '965qeloylgcyb2tqqyczdk', 'viofk3pobgqee9z9gokqk', '2024-04-25 19:39:17', '2024-09-26 01:06:19'),
(102, 111, 'ALMA DELIA', 'almaserrano_@outlook.com', NULL, '$2y$10$MQjx96p9qWJiEh8S6U5ju.dBmiE3ommSwU0.YzES220WYVufhfiQW', 'yESHZMYT', 1, NULL, '2fpi1lnwh2ndacb8lrf3', NULL, '2024-05-22 23:23:21', '2024-09-26 19:48:18'),
(103, 112, 'MICHEL ABIYELI', 'abiyelidavila@gmail.com', NULL, '$2y$10$J9kj0lxo.gnJ7MZCNmqC..WnX5iGkzTWaojcBjIXFmJR4HbUBcnpS', 'aASHcydz', 1, NULL, NULL, NULL, '2024-05-22 23:23:33', '2024-06-04 00:37:19'),
(104, 113, 'GENER HUMBERTO', 'generaazul@gmail.com', NULL, '$2y$10$lk5/Szsazpa39b/HFh.J4eSKLotIxn0IMXP6323ohCu/eL/QZOmMq', 'tsYyjhOR', 1, NULL, '8mfdxtohg9ehxat91s75c', 'ezmsj9q6yuslncxcex5m3', '2024-05-22 23:23:47', '2024-09-27 20:00:35'),
(105, 115, 'GUSTAVO', 'gustavomtz2002@gmail.com', NULL, '$2y$10$jkWUbvU3GvQHoHYvMUAIQug2u.C/J59bK5TbTdLOJdcyDxJg8jqRm', 'MpDWCmcE', 1, NULL, 'pakp9ln1ll9jv0tq2mvpx', 'kh5xezjykokm0gxtzdb848', '2024-05-22 23:34:45', '2024-09-26 20:12:30'),
(106, 114, 'ADELAIDA', 'adelaida9726@gmail.com', NULL, '$2y$10$avBJuwxyqQ6YUCOs4IpB6u.cDsPw4YpdMFOFnq1wROcmFhFyZXk4y', 'VzjbJcLU', 1, NULL, NULL, NULL, '2024-05-22 23:59:26', '2024-05-22 23:59:26'),
(107, 116, 'FERNANDO IVÁN', 'fernando.roblesv12@gmail.com', NULL, '$2y$10$ya9N3tigWRu8KQccxCnItOYchUVf96m0wXITc5rRt6xaYVQHYmsWC', 'bGtSWexM', 1, NULL, '8a9wq1nsq14m1c56f3yg2', NULL, '2024-05-24 22:36:53', '2024-09-26 05:16:58'),
(108, 10, 'ALEJANDRA YANETH', 'alejandra7.yaneth@gmail.com', NULL, '$2y$10$qc69YbNW3NeM0XpRuBx8buubOJVUBPJmfPIfIPmmRGRcVv.WncpjC', 'kERceQha', 1, NULL, 'gltgi2mvesbaatcxgkzni', 'h3zo7hz9spk3ogua5e1jpg', '2024-05-24 22:37:08', '2024-09-30 20:02:31'),
(109, 117, 'JOCELYN AYLIN', 'josslee000@gmail.com', NULL, '$2y$10$ulb8ifvvUUnc3MsDpCysXejzJfCeaBuyW0by1kHJeIIVf/dob9iUm', 'FTdItBfS', 1, NULL, 'gj1mheizix6shjzabftdv', 'xm2j7ga76ws5rpj18hwedr', '2024-05-24 23:09:27', '2024-09-27 20:40:50'),
(110, 118, 'KENIA KIMBERLI', 'keniasoriano2923@gmail.com', NULL, '$2y$10$ItylK9hVxHZAG4dJZG.1rePb.H.k0ey1aRGj2g5ueMklXaIjRwWzS', 'OpoFyjev', 1, NULL, NULL, 'ggc9xp1o7dwyh3yvc87b7s', '2024-05-24 23:37:37', '2024-09-26 00:28:02'),
(111, 118, 'KENIA KIMBERLI', 'keniasoriano2923@gmail.com', NULL, '$2y$10$edIoR2nS7sDkIP.h.UM...a9o.yDdkn0mgAec3mmEMEy10IgSyZMC', 'WMTlmxXy', 1, NULL, NULL, NULL, '2024-05-24 23:38:02', '2024-05-24 23:38:02'),
(112, 120, 'EMILY YEZIR', 'suarez.300303@gmail.com', NULL, '$2y$10$qtYeX2rQKwjZ3BUDKb5gDev/AFV6b0UzFRPXTnkMHRkFMGmOzkfQy', 'WlpRkhTI', 1, NULL, NULL, NULL, '2024-05-25 00:39:30', '2024-05-25 00:39:30'),
(113, 121, 'DAMIANA LORELY', 'damianalp11@gmail.com', NULL, '$2y$10$f/Fv7EPupVgyCBqN7.6XaeZykj2k1EIqdLp.SzUm/PHTIXg5cQCHG', 'jKkrFsce', 1, NULL, NULL, NULL, '2024-05-25 00:53:12', '2024-05-25 00:53:12'),
(114, 122, 'MARIA CONCEPCIÓN', 'maria.buenfil16@outlook.es', NULL, '$2y$10$LWioYeZD0MyKBSPq32GqjeTzKWbuOvaFlWh7zixxhLLyDuct0Fs3y', 'VObBWdtM', 1, NULL, 'jj354exqitqez7vuyuvvr', NULL, '2024-06-04 04:41:26', '2024-09-26 05:15:56'),
(115, 123, 'YEDID ANAHÍ', 'yedid.zavaleta@gmail.com', NULL, '$2y$10$Mir1eeQVFMD1fw7kk.d3.ODvqR/IZB.WeTWqn6v/mlABE6ADmGmnG', 'cKdmivNk', 1, NULL, 'iy71pn6mvtfiv941y3eoer', '8sp9lbfxrijg1qq81m94zv', '2024-06-04 04:54:55', '2024-09-27 04:58:08'),
(116, 124, 'LUCIO', 'luciopale625@gmail.com', NULL, '$2y$10$GwyZtaF48vthfNWIa8t.o.bttaSoBKMpoWjDaKC0/jxS8aY8VXju2', 'hdXRPtkV', 1, NULL, NULL, NULL, '2024-06-04 06:36:54', '2024-06-04 06:36:54'),
(117, 125, 'EDGAR DAVID', 'edgardavidpale1@gmail.com', NULL, '$2y$10$CLv.cDQbkvQaVGCUkjYFoOAAQIQI/KRjUEaPNkEMruW/Nas.okBfO', 'sxhSVDtR', 1, NULL, 'wf85kqb4gf1k5fiozo5hy', NULL, '2024-06-05 02:44:06', '2024-09-26 19:59:23'),
(118, 126, 'DULCE IRERI', 'irerimonro@gmail.com', NULL, '$2y$10$miT2RNSW5P8qXcscwQtfRukzezrKZX4NGAUPuu7bOciMjLlF4GMJ2', 'gdzFRlCZ', 1, NULL, NULL, NULL, '2024-06-10 20:52:36', '2024-06-10 20:52:36'),
(119, 126, 'DULCE IRERI', 'irerimonro@gmail.com', NULL, '$2y$10$6hw4cgIqu4avEn2z.dzAIOHDtCVDoS0jdOya5vgvRN3FfPAQk7Voe', 'BuKlNopD', 1, NULL, NULL, NULL, '2024-06-14 04:51:46', '2024-06-14 04:51:46'),
(120, 127, 'SAMUEL YAHIR', 'samuelchan338@gmail.com', NULL, '$2y$10$WUFO5VxQS1cvvsXWiS2x3ua4fNUp13g8jhuqnl4tBJbmNuiqVu3oq', 'bEwPFMpJ', 1, NULL, '4xg3cw2mhhjq1wh0mqz8fl', 'nk9bu46w0liqh6hwailwgg', '2024-06-18 11:43:57', '2024-09-26 05:11:51'),
(121, 128, 'MARIA IRENE', 'ortegamoomariairene15@gmail.com', NULL, '$2y$10$Rq5t0S2B8suPrJFLA9S3i.5xXWty2HbBdozJefSmVvdp9s/a4FlDC', 'ZiujFUyG', 1, NULL, NULL, NULL, '2024-06-18 12:04:10', '2024-11-15 05:04:13'),
(122, 129, 'CELIA DANIELA', 'paezfloresceliadaniela@gmail.com', NULL, '$2y$10$oBQrhmm39h7CYzA9G46xpu.ko4b7c30dn5V768SMxZSfA1vgip.5e', 'ujXxrKlc', 1, NULL, 'zmxrmz4rzyof7rjuh89gs', NULL, '2024-06-18 12:34:14', '2024-09-26 02:55:54'),
(123, 130, 'PAMELA JORGHET', 'licpamela.gamboa@gmail.com', NULL, '$2y$10$m3xxXH4xQrCsRRQGv2i7V.01zjuFVKVKc0AJmW3lzXrgn0PabgmIS', 'dNRPjsXh', 1, NULL, NULL, NULL, '2024-06-18 13:01:41', '2024-06-18 13:01:41'),
(124, 131, 'CAMILO G.', 'camilo.gcrodriguez@yahoo.com.mx', NULL, '$2y$10$w1Tsu7CtEXfWN.RmtrpRCeqQeawbMuOSgikMVxyC2/UpgPL4xqWaG', 'DBPLwAkn', 1, NULL, NULL, 'ldtw28osx7thbqnv1p3hns', '2024-06-22 05:24:25', '2024-09-26 20:11:00'),
(125, 132, 'KELVIN EDUARDO', 'kelvinlopezlopz@gmail.com', NULL, '$2y$10$F9fbtHXIKHoDz1U6PgMrrOkQ3evpEAU2Dp6Pn1waW2fAcbD1owHEG', 'OGLEBikb', 1, NULL, '76igpm4y97a799gn5ld3q', '17jhkgbwpjf1skjfp84red', '2024-06-25 10:49:53', '2024-09-26 05:20:14'),
(126, 133, 'DIANA YARET', 'yaretyasociados99@gmail.com', NULL, '$2y$10$Gch3p3vOuMWgC4X4gHypPeYo0ufqF8k0JpMh9wJrdYyucfqmIV7Vm', 'qzMePUyx', 1, NULL, NULL, NULL, '2024-06-25 10:50:14', '2024-06-25 10:50:14'),
(127, 134, 'YESENIA ROMINA', 'rominaheba@gmail.com', NULL, '$2y$10$Y9lWFbKL4ScAkavhJ.QT3.3kLB1J/H2/bCwSXRt4QwxfWoJ41XQKG', 'UeOqSjfn', 1, NULL, NULL, NULL, '2024-06-25 10:50:29', '2024-06-25 10:50:29'),
(128, 135, 'ALINE DE JESÚS', 'alinesebavalentin@gmail.com', NULL, '$2y$10$9bDAmcLIrk9SjdajLDeVCezHKl/zooPzK1TLluk/6VidmV6/.3JKq', 'EKcdfFZx', 1, NULL, NULL, NULL, '2024-06-25 10:50:47', '2024-06-25 10:50:47'),
(129, 136, 'ELISA AZAREEL', 'elissavera8@gmail.com', NULL, '$2y$10$SQ6JL1jnmL/ljxuJBJyWHu1vUbml9Mse5qjTShXSSGxaTufITG9dy', 'KtXfpJGU', 1, NULL, 'h81f4df2sgbka4x0xxd5u', 'ua2l27xm27i8zakezzvjd', '2024-06-28 07:50:34', '2024-10-01 02:43:02'),
(130, 137, 'SERGIO', 'sergiodeveze030595@hotmail.com', NULL, '$2y$10$2KeR.74VP.FEi55FdIBjLODLJTV3DmZlBwDM5WbHyHGCqknYjJmka', 'zCjWfZTv', 1, NULL, NULL, NULL, '2024-06-28 19:56:09', '2024-06-28 19:56:09'),
(131, 138, 'MARIA PAOLA', 'mpaolagm1612@gmail.com', NULL, '$2y$10$SaxC7GdstHa4xP0fTn5OV.JMnRpkrsAfl9DSqzugAlecf9XifSVH.', 'WdGLNaHX', 1, NULL, NULL, NULL, '2024-06-29 04:16:35', '2024-06-29 04:16:35'),
(132, 139, 'ANGEL FRANCISCO', 'echeverriaanfran1@gmail.com', NULL, '$2y$10$Arg.K/hGDIJ2zKZVU3bFSOctNxMB8eShDw8c/w8D9aaA9WzRKedvK', 'YjpFQRib', 1, NULL, 'fmhsg9jcko4hkthxwh1nlq', 'seo35tijoulptc2l1vuyr', '2024-07-02 00:58:27', '2024-09-26 19:43:01'),
(133, 140, 'GUALBERTO ALEXIS', 'alexis25.169@outlook.com', NULL, '$2y$10$IKH3LREmypBjyvXtDJ8d6uZA6mwe7xUsNCd3R6SEkl/UwgxGIsnWe', 'GETJAMac', 1, NULL, NULL, NULL, '2024-07-02 04:07:58', '2024-07-02 04:07:58'),
(134, 141, 'ZAYRA TALIA', 'zay.urbina@gmail.com', NULL, '$2y$10$RGsvlZu.VUfL0Ol.vZDnL.5glMDOAkjaR51RmpTaDnbSHK3TIHNtO', 'JOZSYprb', 1, NULL, 'wdrqgh3htyq46bjikxslp3', 'a7soulqu07izaidfq2sl6', '2024-07-10 03:31:55', '2024-09-27 19:56:01'),
(135, 142, 'CHARLENE AUDREY', 'carequena1@gmail.com', NULL, '$2y$10$3tzCd1oUtG6fWySCa2D0DOB0nvmtghRgFpC7COzx3YBD0r3REKA9i', 'dxBRpuHj', 1, NULL, NULL, NULL, '2024-07-16 19:40:29', '2024-07-16 19:40:29'),
(136, 143, 'ALEJANDRO GERARDO', 'alexgzip@hotmail.com', NULL, '$2y$10$ePenkEUJoUZ/aGFVHyRM6OPF3hAC13Sb5VWBhGmVd1jU3MeP9dbGq', 'fvshJRzH', 1, NULL, NULL, '4840xamvohgx7ccltf9js8', '2024-07-16 19:54:03', '2024-09-26 19:38:43'),
(137, 144, 'ESTEFANY BLANCA', 'estefanycarrilloku24@gmail.com', NULL, '$2y$10$1ig.GQ146tjkxdNADhIZYeL2qm4mWOzERVZuiv.4gLG7rmYmKu1PO', 'klmsepwR', 1, NULL, 'fmelfjjv43cb3i9bq5mtto', 'dvo27qcopiwjxyob8fg1w', '2024-07-16 20:05:08', '2024-09-27 19:27:07'),
(138, 145, 'DULCE ESPERANZA', 'd.rosadoreyed@gmail.com', NULL, '$2y$10$oPFZH6xEvzNhs3vMpdVz5eoReIxIqZ.6fRcTy1Of9FRf6Dl4MWT/O', 'jSYukHyw', 1, NULL, 'ur5ci8fk0m470nmuyo99', 'ft3a70i3xc9hie56glzine', '2024-07-16 20:14:36', '2024-09-26 21:15:40'),
(139, 146, 'CATHERINE YEMIRETH', 'yemireth3@gmail.com', NULL, '$2y$10$whDvWFMrsBQKVFjdvJ87S.EouLk5.uUR/CzE1qtXwjyvRpf7tEgr6', 'tYjafqQF', 1, NULL, '69n8wz1236tp6ocxmtz77p', NULL, '2024-07-23 02:40:13', '2024-09-30 19:45:12'),
(140, 147, 'JUAN DIEGO', 'juandiegoperezmar@gmail.com', NULL, '$2y$10$z/Tsq7R1b5knS7QK3Sa02.ReIniruMYcHAz0HBswNlAnuvBwX2WNa', 'qCOXxgBy', 1, NULL, 'kuftirsypwa0ohnbncf8mne', 'ifz067gjsbbwom8bz7qsc', '2024-07-23 03:12:37', '2024-09-26 01:19:24'),
(141, 148, 'AHYME ARELI', 'areserratos12@gmail.com', NULL, '$2y$10$Zt3vZ9xI8DWxJA1jvF6h6OxCWtiC5YAmertf5GVf9RtIUoXHt4rHi', 'RryYDWcw', 1, NULL, 'jaiotto9ggc3k96eye29yf', 'e25sbta2kqjbjg4tyy7jwo', '2024-07-23 04:46:09', '2024-09-27 00:04:46'),
(142, 149, 'DANIEL ALFONSO', 'daniel.dominguez.chavez@gmail.com', NULL, '$2y$10$jAV83lth9RRX0mgz214.1.b6.1lZR9fF4d/tKwJiAOATJCAw8IFgS', 'QaNBUgsL', 1, NULL, NULL, NULL, '2024-08-06 20:38:58', '2024-08-06 20:38:58'),
(143, 150, 'ERICA ARLEN', 'ericaarlencalzadalopez019@gmail.com', NULL, '$2y$10$UqthJADR8IJAiFEx5uu/ReOkC5vl/gLtIDzFfe7tDCVOHH65r7zOq', 'RJUubwhv', 1, NULL, 'p0w9s0pdavp5b82g685a', 'kf0uqep7h9g38wr8wpsfi9', '2024-08-07 04:16:25', '2024-09-27 19:47:36'),
(144, 151, 'LEYDI ENRIQUETA', 'reyes_martinez93@outlook.es', NULL, '$2y$10$bd0es0s.bPVp4cImjxad9Ox9PifuSbQj1fvk5phr1W.sbJzbPgjAS', 'iNoyPkKE', 1, NULL, '0nr3kbyowcf6f47gfuszt', NULL, '2024-08-07 04:24:03', '2024-09-27 02:55:03'),
(145, 152, 'AIME MONTSERRAT', 'aiemont@hotmail.com', NULL, '$2y$10$l07rykQwZ5UAw3C7tHI/1u7hWjfAii22EPNWQa3T4Jd7LG3Jjvpnq', 'WrgOledB', 1, NULL, NULL, 'mo5iq7radrm6cuqa1afm98', '2024-08-15 02:39:33', '2024-09-26 19:46:41'),
(146, 153, 'GRECIA ARLETTE', 'greciacante15@gmail.com', NULL, '$2y$10$twKOOXqi94zGTbIbl/IUG.oLkmUOFqJ5R0rTZoZBUMIV1VKurmJya', 'PoklIJyt', 1, NULL, NULL, '3hjzeo746j3ur3b7i2vaqb', '2024-08-24 00:39:03', '2024-09-26 00:50:36'),
(147, 154, 'GLORIA NOEMI', 'gloriacolli1994@gmail.com', NULL, '$2y$10$PwDRfcw0G7YwFxQiictvueeMi4Y/fuRjkcPnEquv7g6Vndp/Pvn3K', 'PpzJVOjB', 1, NULL, NULL, '5qfrdxglf24qesd3u00na', '2024-08-24 00:50:53', '2024-09-26 02:20:20'),
(148, 155, 'PAMELA ALEXANDRA', 'pamelaaguilarrubio@gmail.com', NULL, '$2y$10$/9nsoJrw4QQ9QUWqOiIMXe0OnIDuQ1bCZI59CAsoTnlcXucyDLJxu', 'VBPTdELf', 1, NULL, NULL, NULL, '2024-08-28 04:58:11', '2024-08-28 04:58:11'),
(149, 157, 'MARIA GUADALUPE', 'zentellapita@gmail.com', NULL, '$2y$10$HLPtD.8tO0TO8Si5Zy/ureLGrr2rG3ZpqwxAH8Fv.enROy7/vwo.u', 'vRYpqDBJ', 1, NULL, NULL, NULL, '2024-08-29 04:04:33', '2024-08-29 04:04:33'),
(150, 156, 'CARMEN ELIZABETH', 'hamelizabeth16@gmail.com', NULL, '$2y$10$EDv3DH4I2GdJCEbp.lXeTuwvgXytCwWSWgvy7rQAC1eJFZbtdYS3y', 'IoJNmvGL', 1, NULL, NULL, NULL, '2024-08-29 04:12:09', '2024-10-26 02:28:47'),
(151, 158, 'HERLIN', 'herlinnolasco98@gmail.com', NULL, '$2y$10$hAqK2GYdOl/.2RfCJ3zC/uRi.I3T37nP9ZKtbJTFFC4thQV4Dnere', 'AkSyUGRq', 1, NULL, NULL, NULL, '2024-09-03 04:11:21', '2024-09-03 04:11:21'),
(153, 159, 'KARLA BELISSA', 'kbelissamay88@outlook.com', NULL, '$2y$10$uhQt74ZkzB3uuKTE/dRmTOUXF8DFyB2aKNusmv40dJoITfUH/DqDi', 'NvICDEQt', 1, NULL, NULL, NULL, '2024-09-13 22:17:23', '2025-03-14 21:43:25'),
(154, 160, 'CLAUDIA DANIELA SOLEDAD', 'dann_80_@hotmail.com', NULL, '$2y$10$JWyGxjD37OlzSj8UdT08cuylSewMc.39EZ.XcOz0t24T17ytqqsvG', 'ecsxlWqb', 1, NULL, 'livuir8xkje6b9lquyyg', '6cr416t4gwr3lww533gvte', '2024-09-14 00:30:52', '2024-09-26 19:16:51'),
(155, 161, 'LOURDES BEATRIZ', 'lourdescohuodzib@gmail.com', NULL, '$2y$10$M7ThWg5tY0xKpJsL21PSKOBbi1t.KEkz2CQ/TgPAlFxSKdxlFh8Gu', 'KiWvuLtG', 1, NULL, 'sua7pj34584bj9ri5r8z4', NULL, '2024-09-18 03:30:26', '2024-09-26 02:03:33'),
(156, 162, 'JOSÉ DE JESÚS', 'josejesuscarrillo22@gmail.com', NULL, '$2y$10$WSbD23u7hHHOkMGxmD7p0eU9LvzXYgRIx7L1NoWDYhdFmsvTd8tJq', 'mUMBJHvo', 1, NULL, NULL, NULL, '2024-09-26 21:25:02', '2024-09-26 21:25:02'),
(157, 163, 'ROSSY DEL CARMEN', 'rossycamara@cecytab.edu.mx', NULL, '$2y$10$dPNBINBvK.xRtBTKeWXwGemb5tkEuwhShTLkKoPR8fnc3RpRY/74u', 'TPBkqdrN', 1, NULL, NULL, NULL, '2024-09-28 00:25:27', '2024-12-31 23:20:21'),
(158, 164, 'ANGEL DE JESUS', 'juridicorivera96@gmail.com', NULL, '$2y$10$rbx2XZY.ju7EbVVuHxswsedc25rh7Wavfr8p9lkckQLVQbDSAF4z.', 'OHsehYpm', 1, NULL, NULL, NULL, '2024-10-01 04:24:37', '2024-10-01 04:24:37'),
(159, 165, 'JOSE DE JESUS', 'j.jesus.patino@gmail.com', NULL, '$2y$10$3zg4fljycrVew/wa/sZEWuQ9Xp.TAnjP126zq5M75RwPw62J1qI5W', 'rafjQgyq', 1, NULL, NULL, NULL, '2024-10-02 20:42:35', '2024-10-02 20:42:35'),
(160, 166, 'ANETTE YURIDIA', 'anetteyuridia@gmail.com', NULL, '$2y$10$R.x3GqlYKGbC0WK1TqZ7F.ddSBbMBi.DaoDkIO7fEDkc2N8u6IDz2', 'nFDQpOWv', 1, NULL, NULL, NULL, '2024-10-21 22:53:14', '2024-10-21 22:53:14'),
(161, 167, 'SHADE DESIDERE', 'shaderodas2001@gmail.com', NULL, '$2y$10$zCOEBxC3.Umg.pfTIV/eIOhE7VfAVcElGrMdhr8yrHnbJMHu16rSi', 'fiEuBRIQ', 1, NULL, NULL, NULL, '2024-10-23 00:21:20', '2024-10-29 23:30:28'),
(162, 168, 'FERNANDO ALEXIS', 'alexis.martinezpiit@gmail.com', NULL, '$2y$10$OZu6MtiGumBJs4.pNH3Ka.gzIJExpFyV2u36iuamWRXMSWpADwvQG', 'BTJNpSzD', 1, NULL, NULL, NULL, '2024-10-31 20:13:50', '2024-10-31 20:13:50'),
(163, 169, 'EUSEBIO', 'e.ricaldetuyu@gmail.com', NULL, '$2y$10$BIg77cedyamKMZopylTLx.jgptNe7ziqvboLVCWQRfqQulAfacqF2', 'lhwMoFxc', 1, NULL, NULL, NULL, '2024-11-07 23:48:20', '2024-11-07 23:48:20'),
(164, 170, 'BRILLY MONSERRAT', 'bril97@hotmail.com', NULL, '$2y$10$ZcZcxjw3warbKWD2LmKtW.bqEzF85LIcSXVhM6NCTBQc.nmnnFzaa', 'QoGidJWv', 1, NULL, NULL, NULL, '2024-11-21 03:55:07', '2024-11-21 03:55:07'),
(165, 171, 'MIGUEL DAVID', 'davidcacereslara@gmail.com', NULL, '$2y$10$OvwwiJJfdE0GHg55Xa5N3uEotqFQwqucJCPgT2qu6AvqzD/dPOF6G', 'ivhUrXWk', 1, NULL, NULL, NULL, '2024-11-25 20:34:39', '2024-11-25 20:34:39'),
(166, 172, 'LIYAH JOCELYN', 'jocelynuc873@gmail.com', NULL, '$2y$10$FbYx/LQx/GgDOmB6sZ1jROZyeFrzYxEpiW0EUBquGDmexB7W0Av.m', 'xjMiXGqH', 1, NULL, NULL, NULL, '2024-11-27 00:00:59', '2024-11-27 00:00:59'),
(167, 173, 'JHONATTAN', 'jhonasan150710@gmail.com', NULL, '$2y$10$98Pja5mt9lL/lmAu69zzf.TfmvWQryghKl0GQARKpcCy44Q1QdL3a', 'UhbyZldL', 1, NULL, NULL, NULL, '2024-11-29 03:12:44', '2024-11-29 03:12:44'),
(168, 174, 'ASBANI IRIEL', 'irieltzuc@gmail.com', NULL, '$2y$10$K8sR6CeoqCKy8uinDpOyyelW/omjGlwE47hIwXVuxY.jnmL94UCpq', 'CwXqvdVJ', 1, NULL, NULL, NULL, '2024-12-11 00:28:08', '2024-12-11 00:28:08'),
(169, 175, 'IVETT', 'ivettr292@gmail.com', NULL, '$2y$10$7D0d1EJqbJ/G7Mhx8yG1/.pnFKSmbudhmkyIXgFEEClgbfbvdi5uK', 'FKRDLMbe', 1, NULL, NULL, NULL, '2025-01-07 03:25:42', '2025-01-07 03:25:42'),
(170, 176, 'JORDY JAIR', 'jordyjairp@gmail.com', NULL, '$2y$10$DjcKFylFT7Xh9pfZjtJLr.0ElG4U9hIsESF27MvS//LSdmKx6HJxK', 'ICrgfXxP', 1, NULL, NULL, NULL, '2025-01-07 03:25:52', '2025-01-08 05:00:59'),
(171, 177, 'BRETZIL GUADALUPE', 'lic.sandoval31@outlook.com', NULL, '$2y$10$bmjb.5SEirTfvsrRIZ8YLey/TdVlE57cnViTgDzxdJk66zMKkNeOe', 'ZfonejwS', 1, NULL, NULL, NULL, '2025-01-15 22:04:30', '2025-01-15 22:04:30'),
(172, 178, 'DAVID ANTONIO', 'davidchku14@gmail.com', NULL, '$2y$10$786yZCohyq.pp/6ZISwka.Kwpv88CnOF7GS0F1TG.fcXGpBA4xdTm', 'wPcmbDHA', 1, NULL, NULL, NULL, '2025-01-21 22:39:17', '2025-01-21 22:39:17'),
(173, 179, 'ADRIAN DE JESUS', 'adriantamayo248@gmail.com', NULL, '$2y$10$nEVrZimRuHSz6REuL0aP6OxWzISQeBurZAZRAS3l45s7o6VUmsD9y', 'kniBIYpA', 1, NULL, NULL, NULL, '2025-01-24 00:08:33', '2025-01-24 00:08:33'),
(174, 180, 'JOSHUA NEFTHALI', 'joshua8904@hotmail.com', NULL, '$2y$10$SHgmRBxWQC0smCLDa2LwTO8dyz/BhpkxRZml8/SJ4aJxRh7TfynP6', 'TDvsFodL', 1, NULL, NULL, NULL, '2025-01-29 22:21:29', '2025-01-29 22:21:29'),
(175, 182, 'MARIA FERNANDA', 'marifergo2001@outlook.com', NULL, '$2y$10$fi4GXB8fuxlnkpTgKfchU.kk/0c901Z2gdD5MyT7uYzHcl9TT/CBq', 'aKzuXRpT', 1, NULL, NULL, NULL, '2025-02-05 21:45:46', '2025-02-05 21:45:46'),
(176, 183, 'CHRISTIAN ALEXIS', 'abg.alexisgarcia@gmail.com', NULL, '$2y$10$RasxCotUsCIR7gkBzX3nveImjLBTNt6DHyZYqCgHcK4ffX9/GUYSy', 'pRdvJVsT', 1, NULL, NULL, NULL, '2025-02-06 00:11:53', '2025-02-06 00:11:53'),
(177, 185, 'AIDEE VANESSA', 'aidee94caceres@gmail.com', NULL, '$2y$10$5iWtgLDB4jWWalNn30VJm.wnyRyPW4HZVL0azxx586dEcnm/dJika', 'UwCBdmWg', 1, NULL, NULL, NULL, '2025-02-11 04:35:15', '2025-02-11 04:35:15'),
(178, 184, 'ABEL', 'abelnoh85@gmail.com', NULL, '$2y$10$CN8kNNE7/BpmWePj4BM9uOH8lNS24F53QKx6QmgIlJZ.7Cq3V6dIu', 'JgrMdTOo', 1, NULL, NULL, NULL, '2025-02-11 04:35:24', '2025-02-11 04:35:24'),
(179, 186, 'RAYMUNDO', 'raymundohernandezcastillo91@gmail.com', NULL, '$2y$10$VPeBkGG97wOsruuZCsk4c.tNr1bI/I6vvyh11q7jFKahUQHnr/G8S', 'cnYaSirD', 1, NULL, NULL, NULL, '2025-02-11 22:35:03', '2025-02-11 22:35:03'),
(180, 187, 'SILVIA ANTONIA', 'ochosilvia@hotmail.com', NULL, '$2y$10$0kaghDZhgM6A02extFUOz.hOWmkBi.Qo.RBMDDjMcZjM2iHCleG.q', 'oOJqjtAa', 1, NULL, NULL, NULL, '2025-02-13 23:16:28', '2025-02-13 23:16:28'),
(181, 188, 'RODOLFO ANGEL', 'angel_salasramo03@outlook.com', NULL, '$2y$10$D3waNCuK9.xm5Thg2PDCDe.WIL0XeybnenAjJsMiUSR0cq4mEpNxK', 'jztuUFPN', 1, NULL, NULL, NULL, '2025-02-14 04:09:11', '2025-02-14 04:09:11'),
(182, 189, 'JUAN LUIS', 'juanluislb86@hotmail.com', NULL, '$2y$10$QS50XxlIkzGDTza5mqJCh.bBBZaFQDsIQG6CkZTjrtSXQMRmSgXRW', 'SObkoUHg', 1, NULL, NULL, NULL, '2025-02-14 04:09:23', '2025-02-14 04:09:23'),
(183, 190, 'DILCIA CARMINA', 'dilciakarmi@gmail.com', NULL, '$2y$10$Fbfreo.g0OPBxClTiOm6EOYGdQg18qnkOMctsrdjxsqNPvmLca25a', 'pFJSladW', 1, NULL, NULL, NULL, '2025-02-19 21:27:09', '2025-02-19 21:27:09'),
(184, 191, 'LUCIO', 'cp.lucioflores.soluciones@gmail.com', NULL, '$2y$10$xVr3p41MDJynZJ0TZMtQHe16rLXtTtcx0ce5JPss9HTcMVClPwCBm', 'vnoPRsXq', 1, NULL, NULL, NULL, '2025-02-21 20:23:18', '2025-02-21 20:23:18'),
(185, 192, 'YARELLY MARIBEL', 'calyare89@gmail.com', NULL, '$2y$10$ef2F1FmVwd42ghueMLVtheClXaLqUzZcNl4BIgN2Cm4KD/Jjsa.1q', 'LChkQuVx', 1, NULL, NULL, NULL, '2025-02-21 23:32:57', '2025-02-21 23:32:57'),
(186, 194, 'YOSAHANDI MARYCRUZ', 'marycruz0599@hotmail.com', NULL, '$2y$10$LK6zf1OS7B.Mx8TPgcs6qO2JKHYfmnA16L1RBFCAGFmk3CakOaoHu', 'NYnxXZio', 1, NULL, NULL, NULL, '2025-02-28 03:58:11', '2025-02-28 03:58:11'),
(187, 193, 'JULIO MANUEL', 'julioparedes914@gmail.com', NULL, '$2y$10$H65UQmeJG3j04yI8KHEyDOjXb8deuYnxDjGJ4LKPOup6MYEQU.d6i', 'fgQMJGhx', 1, NULL, NULL, NULL, '2025-02-28 03:58:24', '2025-02-28 03:58:24'),
(188, 195, 'MARÍA MAGDALENA', 'mmgr22@hotmail.com', NULL, '$2y$10$a8F1O6cZASFGU3/Fc3lQ9uPB4F/rCQbcZQkf5pAWKd3uXS2ZZvXoy', 'sxDbaJgR', 1, NULL, NULL, NULL, '2025-03-08 03:46:16', '2025-03-08 03:46:16'),
(189, 196, 'VALENTIN', 'vidalvalentin65@gmail.com', NULL, '$2y$10$C5EmnFdjNI/wwACcS1M/T.19peyeCh/HPxofuFYlmedEFMKo8fcR6', 'tEYFqOBP', 1, NULL, NULL, NULL, '2025-03-08 03:46:31', '2025-03-08 03:46:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_module_access`
--

CREATE TABLE `user_module_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `submodule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subsubmodule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `can_view` tinyint(1) NOT NULL DEFAULT 0,
  `can_create` tinyint(1) NOT NULL DEFAULT 0,
  `can_edit` tinyint(1) NOT NULL DEFAULT 0,
  `can_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_module_access`
--

INSERT INTO `user_module_access` (`id`, `user_id`, `module_id`, `submodule_id`, `subsubmodule_id`, `can_view`, `can_create`, `can_edit`, `can_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(2, 1, 2, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(3, 1, 3, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(4, 1, 4, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(5, 1, 5, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(6, 1, 6, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(7, 1, 7, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(8, 1, 8, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(9, 1, 9, NULL, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(16, 1, 1, 1, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(17, 1, 1, 2, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(18, 1, 1, 3, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(19, 1, 1, 7, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(20, 1, 1, 8, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(21, 1, 2, 9, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(22, 1, 2, 12, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(23, 1, 2, 15, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(24, 1, 2, 16, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(25, 1, 3, 17, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(26, 1, 3, 21, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(27, 1, 3, 22, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(28, 1, 3, 23, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(29, 1, 4, 24, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(30, 1, 4, 28, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(31, 1, 4, 29, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(32, 1, 4, 30, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(33, 1, 5, 31, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(34, 1, 5, 34, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(35, 1, 5, 35, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(36, 1, 5, 36, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(37, 1, 6, 37, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(38, 1, 6, 40, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(39, 1, 6, 41, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(40, 1, 6, 42, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(41, 1, 7, 43, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(42, 1, 7, 44, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(43, 1, 7, 45, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(44, 1, 7, 46, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(45, 1, 8, 47, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(46, 1, 8, 50, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(47, 1, 8, 51, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(48, 1, 8, 52, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(49, 1, 8, 53, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(50, 1, 9, 54, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(51, 1, 9, 59, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(52, 1, 9, 60, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(53, 1, 9, 61, NULL, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(79, 1, 1, 3, 4, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(80, 1, 1, 3, 5, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(81, 1, 1, 3, 6, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(82, 1, 2, 9, 10, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(83, 1, 2, 9, 11, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(84, 1, 2, 12, 13, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(85, 1, 2, 12, 14, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(86, 1, 3, 17, 18, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(87, 1, 3, 17, 19, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(88, 1, 3, 17, 20, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(89, 1, 4, 24, 25, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(90, 1, 4, 24, 26, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(91, 1, 4, 24, 27, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(92, 1, 5, 31, 32, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(93, 1, 5, 31, 33, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(94, 1, 6, 37, 38, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(95, 1, 6, 37, 39, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(96, 1, 8, 47, 48, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(97, 1, 8, 47, 49, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(98, 1, 9, 54, 55, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(99, 1, 9, 54, 56, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(100, 1, 9, 54, 57, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(101, 1, 9, 54, 58, 1, 1, 1, 1, '2025-10-25 10:58:51', '2025-10-25 10:58:51'),
(102, 1, 10, 62, NULL, 1, 1, 1, 1, '2025-11-20 23:50:53', '2025-11-20 23:50:53'),
(103, 1, 10, 63, NULL, 1, 1, 1, 1, '2025-11-20 23:53:03', '2025-11-20 23:53:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamentos_id_jefe_area_foreign` (`id_jefe_area`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_slug_unique` (`slug`),
  ADD KEY `modules_order_index` (`order`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_activo_index` (`activo`),
  ADD KEY `personal_id_empleado_index` (`id_empleado`),
  ADD KEY `personal_empresa_index` (`empresa`),
  ADD KEY `personal_ingreso_index` (`ingreso`),
  ADD KEY `personal_id_jefe_inmediato_index` (`id_jefe_inmediato`),
  ADD KEY `personal_id_departamento_index` (`id_departamento`),
  ADD KEY `personal_id_puesto_foreign` (`id_puesto`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puestos_id_departamento_foreign` (`id_departamento`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `submodules`
--
ALTER TABLE `submodules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `submodules_slug_unique` (`slug`),
  ADD KEY `submodules_module_id_index` (`module_id`),
  ADD KEY `submodules_parent_submodule_id_index` (`parent_submodule_id`),
  ADD KEY `submodules_order_index` (`order`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_module_access`
--
ALTER TABLE `user_module_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_module_access` (`user_id`,`module_id`,`submodule_id`,`subsubmodule_id`),
  ADD KEY `user_module_access_module_id_foreign` (`module_id`),
  ADD KEY `user_module_access_submodule_id_foreign` (`submodule_id`),
  ADD KEY `user_module_access_user_id_module_id_index` (`user_id`,`module_id`),
  ADD KEY `user_module_access_user_id_submodule_id_index` (`user_id`,`submodule_id`),
  ADD KEY `user_module_access_user_id_subsubmodule_id_index` (`user_id`,`subsubmodule_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `submodules`
--
ALTER TABLE `submodules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT de la tabla `user_module_access`
--
ALTER TABLE `user_module_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_id_jefe_area_foreign` FOREIGN KEY (`id_jefe_area`) REFERENCES `personal` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_id_puesto_foreign` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD CONSTRAINT `puestos_id_departamento_foreign` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `submodules`
--
ALTER TABLE `submodules`
  ADD CONSTRAINT `submodules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submodules_parent_submodule_id_foreign` FOREIGN KEY (`parent_submodule_id`) REFERENCES `submodules` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_module_access`
--
ALTER TABLE `user_module_access`
  ADD CONSTRAINT `user_module_access_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_module_access_submodule_id_foreign` FOREIGN KEY (`submodule_id`) REFERENCES `submodules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_module_access_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
