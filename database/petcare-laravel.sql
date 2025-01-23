-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 25, 2024 lúc 01:34 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petcare-laravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_home` varchar(255) NOT NULL,
  `image_slide` varchar(255) NOT NULL,
  `image_booking` varchar(255) NOT NULL,
  `image_cart` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name_service` varchar(255) NOT NULL,
  `goi` varchar(255) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idCus` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `idCat` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`idCat`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pate', '2024-06-30 20:55:37', '2024-06-30 20:55:37'),
(2, 'Đồ chơi', '2024-06-30 20:55:41', '2024-06-30 20:55:41'),
(3, 'Thực phẩm chức năng', '2024-06-30 20:55:44', '2024-06-30 20:55:44'),
(4, 'Thức ăn hạt', '2024-06-30 20:55:49', '2024-06-30 20:55:49'),
(5, 'Dụng cụ', '2024-06-30 20:55:53', '2024-06-30 20:55:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1024) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idCus` int(10) UNSIGNED NOT NULL,
  `idPro` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'NGUYỄN PHƯƠNG NAM', 'nam@gmail.com', NULL, '$2y$10$Te5.N4DTJW/30OzzR0XZlOahH/9oGBz7jUGOPrb4Kg9y3m3uecaQe', '0913456767', '1719988697.webp', NULL, '2024-07-01 22:10:34', '2024-07-02 16:38:17'),
(3, 'nam', 'namn31020033@gmail.com', NULL, '$2y$10$9FDMEQiqHLYG0wT3LHG7kuRJGCjGmjKmTS8.TEV6Q4oHBNLi7KNf2', '0913439191', NULL, NULL, '2024-07-24 02:27:33', '2024-07-24 06:49:50'),
(4, 'NGUYỄN PHƯƠNG NAM', 'namn3102003@gmail.com', NULL, '$2y$10$AzK02nPprwj1mFS/eQNUF.dqLdlRsfXhXUWLDqs5MX0xwbl4dYaVu', '0913439191', NULL, NULL, '2024-07-24 18:49:20', '2024-07-24 18:49:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `time_start` varchar(255) NOT NULL,
  `time_end` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `idCat` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `discount`, `time_start`, `time_end`, `status`, `idCat`, `created_at`, `updated_at`) VALUES
(4, 'Khuyến mại tháng Sinh Nhật', 20, '2024-07-22', '2024-07-23', 0, 1, '2024-07-21 17:27:02', '2024-07-22 12:22:09'),
(5, 'Khuyến mại sinh nhật Tháng 9', 15, '2024-07-23', '2024-07-31', 1, 2, '2024-07-21 19:16:06', '2024-07-22 12:22:09'),
(6, 'Khuyến mại Tháng 8', 30, '2024-08-01', '2024-08-10', 2, 4, '2024-07-21 19:53:11', '2024-07-21 19:53:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `image_products`
--

CREATE TABLE `image_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idPro` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image_products`
--

INSERT INTO `image_products` (`id`, `image`, `created_at`, `updated_at`, `idPro`) VALUES
(12, '1719846831.jpg', '2024-07-01 01:13:51', '2024-07-01 01:13:51', 1),
(13, '1719846831.webp', '2024-07-01 01:13:51', '2024-07-01 01:13:51', 1),
(14, '1719846863.jpg', '2024-07-01 01:14:23', '2024-07-01 01:14:23', 2),
(15, '1719846863.jpg', '2024-07-01 01:14:23', '2024-07-01 01:14:23', 2),
(16, '1719846863.webp', '2024-07-01 01:14:23', '2024-07-01 01:14:23', 2),
(17, '1720003830.jpg', '2024-07-02 20:50:30', '2024-07-02 20:50:30', 3),
(18, '1720003830.webp', '2024-07-02 20:50:30', '2024-07-02 20:50:30', 3),
(19, '1720004018.jpg', '2024-07-02 20:53:38', '2024-07-02 20:53:38', 4),
(20, '1720004018.jpg', '2024-07-02 20:53:38', '2024-07-02 20:53:38', 4),
(24, '1720004263.webp', '2024-07-02 20:57:43', '2024-07-02 20:57:43', 5),
(25, '1720004263.jpg', '2024-07-02 20:57:43', '2024-07-02 20:57:43', 5),
(26, '1720004263.webp', '2024-07-02 20:57:43', '2024-07-02 20:57:43', 5),
(28, '1720004524.webp', '2024-07-02 21:02:04', '2024-07-02 21:02:04', 6),
(29, '1720004524.webp', '2024-07-02 21:02:04', '2024-07-02 21:02:04', 6),
(30, '1720004598.jpg', '2024-07-02 21:03:18', '2024-07-02 21:03:18', 7),
(31, '1720004598.jpg', '2024-07-02 21:03:18', '2024-07-02 21:03:18', 7),
(32, '1720006341.webp', '2024-07-02 21:32:21', '2024-07-02 21:32:21', 8),
(33, '1720006341.webp', '2024-07-02 21:32:21', '2024-07-02 21:32:21', 8),
(38, '1720006839.jpg', '2024-07-02 21:40:39', '2024-07-02 21:40:39', 11),
(39, '1720006839.webp', '2024-07-02 21:40:39', '2024-07-02 21:40:39', 11),
(44, '1720007241.webp', '2024-07-02 21:47:21', '2024-07-02 21:47:21', 12),
(45, '1720007241.webp', '2024-07-02 21:47:21', '2024-07-02 21:47:21', 12),
(46, '1720007502.jpg', '2024-07-02 21:51:42', '2024-07-02 21:51:42', 13),
(47, '1720007502.webp', '2024-07-02 21:51:42', '2024-07-02 21:51:42', 13),
(48, '1720007866.webp', '2024-07-02 21:57:46', '2024-07-02 21:57:46', 14),
(49, '1720007866.jpg', '2024-07-02 21:57:46', '2024-07-02 21:57:46', 14),
(50, '1720009293.jpg', '2024-07-02 22:21:33', '2024-07-02 22:21:33', 15),
(51, '1720009293.webp', '2024-07-02 22:21:33', '2024-07-02 22:21:33', 15),
(52, '1720009397.jpg', '2024-07-02 22:23:17', '2024-07-02 22:23:17', 16),
(53, '1720009397.webp', '2024-07-02 22:23:17', '2024-07-02 22:23:17', 16),
(54, '1720009477.jpg', '2024-07-02 22:24:37', '2024-07-02 22:24:37', 17),
(55, '1720009477.webp', '2024-07-02 22:24:37', '2024-07-02 22:24:37', 17),
(56, '1720009601.jpg', '2024-07-02 22:26:41', '2024-07-02 22:26:41', 18),
(57, '1720009601.webp', '2024-07-02 22:26:41', '2024-07-02 22:26:41', 18),
(58, '1720009651.webp', '2024-07-02 22:27:31', '2024-07-02 22:27:31', 19),
(62, '1720009827.webp', '2024-07-02 22:30:27', '2024-07-02 22:30:27', 20),
(63, '1720009827.webp', '2024-07-02 22:30:27', '2024-07-02 22:30:27', 20),
(64, '1720009907.webp', '2024-07-02 22:31:47', '2024-07-02 22:31:47', 21),
(65, '1720009907.webp', '2024-07-02 22:31:47', '2024-07-02 22:31:47', 21),
(66, '1720010077.jpg', '2024-07-02 22:34:37', '2024-07-02 22:34:37', 22),
(67, '1720010077.webp', '2024-07-02 22:34:37', '2024-07-02 22:34:37', 22),
(68, '1720010193.webp', '2024-07-02 22:36:33', '2024-07-02 22:36:33', 23),
(69, '1720010193.jpg', '2024-07-02 22:36:33', '2024-07-02 22:36:33', 23),
(70, '1720010304.webp', '2024-07-02 22:38:24', '2024-07-02 22:38:24', 24),
(71, '1720010304.jpg', '2024-07-02 22:38:24', '2024-07-02 22:38:24', 24),
(72, '1720010304.jpg', '2024-07-02 22:38:24', '2024-07-02 22:38:24', 24),
(75, '1720010430.jpg', '2024-07-02 22:40:30', '2024-07-02 22:40:30', 25),
(76, '1720010430.jpg', '2024-07-02 22:40:30', '2024-07-02 22:40:30', 25),
(77, '26.webp', '2024-07-02 22:42:09', '2024-07-02 22:42:09', 26),
(78, '1720010682.webp', '2024-07-02 22:44:42', '2024-07-02 22:44:42', 27),
(79, '1720010682.webp', '2024-07-02 22:44:42', '2024-07-02 22:44:42', 27),
(86, '1720010875.webp', '2024-07-02 22:47:55', '2024-07-02 22:47:55', 28),
(87, '1720010875.webp', '2024-07-02 22:47:55', '2024-07-02 22:47:55', 28),
(88, '1720011300.webp', '2024-07-02 22:55:00', '2024-07-02 22:55:00', 29),
(89, '1720011300.webp', '2024-07-02 22:55:00', '2024-07-02 22:55:00', 29);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_06_22_081024_create_products_table', 1),
(6, '2024_06_28_112055_create_services_table', 1),
(7, '2024_06_30_093432_create_image_products_table', 1),
(8, '2024_06_30_140421_create_comments_table', 1),
(9, '2024_07_01_092208_create_orders_table', 1),
(10, '2024_07_01_154628_create_staff_table', 1),
(11, '2024_07_02_123811_create_banners_table', 1),
(12, '2024_07_02_131928_create_bookings_table', 1),
(13, '2024_07_21_140148_create_discounts_table', 1),
(14, '2024_07_23_024852_create_voucher_users_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `thanhtoan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idCus` int(10) UNSIGNED NOT NULL,
  `idVoucher` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `status`, `address`, `note`, `thanhtoan`, `created_at`, `updated_at`, `idCus`, `idVoucher`) VALUES
(3, 0, 'Thôn Giã Bàng 3, Tề Lỗ, Yên Lạc, Vĩnh Phúc', 'Thôn Giã Bàng 3, Tề Lỗ, Yên Lạc, Vĩnh Phúc', 'Thanh toán bằng phương thức COD', '2024-07-24 02:05:56', '2024-07-23 19:05:56', 2, NULL),
(4, 0, 'Thôn Giã Bàng 3, Tề Lỗ, Yên Lạc, Vĩnh Phúc', 'Thôn Giã Bàng 3, Tề Lỗ, Yên Lạc, Vĩnh Phúc', 'Thanh toán bằng phương thức COD', '2024-07-24 02:07:09', '2024-07-23 19:07:09', 2, 5),
(5, 0, 'a', 'a', 'Thanh toán bằng phương thức COD', '2024-07-24 13:57:02', '2024-07-24 06:57:02', 3, NULL),
(6, 0, 'a', 'a', 'Thanh toán bằng phương thức chuyển khoản', '2024-07-25 11:27:42', '2024-07-25 04:27:42', 2, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idPro` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `idOrder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `number`, `created_at`, `updated_at`, `idPro`, `price`, `idOrder`) VALUES
(3, 1, '2024-07-23 19:05:56', '2024-07-23 19:05:56', 15, '30000', 3),
(4, 1, '2024-07-23 19:07:09', '2024-07-23 19:07:09', 12, '25000', 4),
(5, 1, '2024-07-24 06:57:02', '2024-07-24 06:57:02', 8, '30000', 5),
(6, 24, '2024-07-25 04:27:42', '2024-07-25 04:27:42', 8, '30000', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `idPro` int(10) UNSIGNED NOT NULL,
  `namePro` varchar(255) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `hot` int(11) DEFAULT NULL,
  `cost` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idCat` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`idPro`, `namePro`, `description`, `count`, `hot`, `cost`, `discount`, `created_at`, `updated_at`, `idCat`) VALUES
(1, 'Hạt Cho Mèo Mọi Lứa Tuổi Catsrang', '<ul><li>Với đặc tính dễ tiêu, hạt Catsrang giúp mèo đi phân rắn và giảm thiểu mùi hôi khó chịu.</li><li>Ngăn ngừa lông vón cục trong ruột mèo.</li><li>Hàm lượng dinh dưỡng cân bằng, catsrang phù hợp trong việc cải thiện da lông, phòng tránh bệnh quáng gà ở mèo.</li><li>Sử dụng protein cao cấp tốt cho hệ tiêu hóa.</li><li>Đặc biệt, sản phẩm không sử dụng chất bảo quản, chất kháng sinh, phẩm màu hay hương liệu nhân tạo khác.</li></ul>', 130, 1, 156000, 2, '2024-06-30 20:56:33', '2024-07-02 20:51:16', 4),
(2, 'Thức Ăn Hạt Cho Mèo Con Royal Canin Kitten 36', '<ul><li>Thương hiệu:&nbsp;<strong>Royal Canin</strong></li><li>Phù hợp cho: Mèo&nbsp;con (từ 4 đến 12 tháng tuổi).</li><li><strong>Thức ăn cho mèo</strong>&nbsp;Royal Canin Kitten&nbsp;hỗ trợ sức khỏe của mèo con bằng việc cung cấp các chất dinh dưỡng chính xác dựa trên nghiên cứu của các nhà khoa học từ ROYAL CANIN. Trong giai đoạn tăng trưởng, hệ thống tiêu hóa của mèo con chưa phát triển đầy đủ, chính vì vậy ROYAL CANIN Kitten thúc đẩy sự cân bằng hệ vi sinh đường ruột, hỗ trợ sự phát triển khỏe mạnh.</li></ul><p><strong>Lợi ích:</strong></p><ul><li>Hỗ trợ quá trình tăng trưởng và phát triển toàn diện</li><li>Thúc đẩy phát triển xương và khớp</li><li>Giúp hệ tiêu hóa khỏe mạnh</li><li>Tăng cường sức đề kháng</li><li>Hạn chế mùi hôi phân</li></ul><p><strong>Thành phần</strong></p><ul><li>Protein gia cầm, gạo, protein thực vật*, chất béo động vật, bột bắp, protein động vật, bột lúa mì, gluten bắp,...</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Chia làm 2-3 bữa/ngày</li><li>Lượng cho ăn hàng ngày được khuyến nghị (gam mỗi ngày) theo trọng lượng cơ thể (kg) và hình dáng của mèo.</li><li>Khẩu phần ăn hàng ngày có thể thay đổi liên quan đến nhiệt độ môi trường, lối sống của mèo (trong nhà-ngoài trời), tính khí và hoạt động của mèo.</li></ul>', 452, 1, 145000, 3, '2024-06-30 20:57:30', '2024-07-02 20:51:23', 4),
(3, 'Thức Ăn Hạt Cho Mèo Trưởng Thành Nuôi Trong Nhà Royal Canin Indoor 27', '<p><strong>Thức Ăn Cho Mèo Trưởng Thành Royal Canin Indoor 27</strong></p><ul><li>Thương hiệu: <strong>Royal Canin</strong></li><li>Phù hợp cho: Mèo nhà trưởng thành (trên 12 tháng tuổi)</li><li><strong>Thức ăn cho mèo</strong> Royal Canin Indoor sẽ là sự lựa chọn phù hợp với bé cưng của bạn. Được thiết kế với mức độ calo vừa phải, hạt Royal Canin giúp mèo hạn chế tăng trọng lượng. Các sợi psyllium và các chất đạm dễ tiêu hóa có trong thức ăn cũng giúp loại bỏ búi lông trong bụng và giảm thiểu mùi hôi khó chịu trong hộp cát. Thức ăn Royal Canin với dạng hạt khô độc đáo còn giúp mèo giảm sự tích tụ của cao răng và mảng bám.</li></ul><p><strong>Lợi ích:</strong></p><ul><li>GIẢM MÙI HÔI CHẤT THẢI: Các protein làm tăng khả năng tiêu hóa các chất dinh dưỡng, đồng thời hỗ trợ duy trì sức khỏe hệ thống tiết niệu, giảm lượng phân (và mùi hôi của khay vệ sinh) ở mèo trưởng thành.</li><li>QUẢN LÝ CÂN NẶNG: Chế độ ăn kiêng với mức calo vừa phải, thích ứng với cường độ hoạt động thấp của mèo nhà, giúp giữ cân nặng ở mức lý tưởng.</li><li>ĐIỀU CHỈNH BÚI LÔNG: Giúp kích thích chuyển động của dạ dày, loại bỏ các sợi lông mèo nuốt vào bụng nhờ sự kết hợp của các chất xơ lên men và không lên men.&nbsp;</li></ul><p><strong>Thành phần</strong></p><ul><li>Thành phần: Bột gà, ngô, gạo nấu bia, gluten ngô, lúa mì, mỡ gà, gluten lúa mì, hương vị tự nhiên, gạo lứt, chất xơ đậu, trấu, bột củ cải khô, dầu thực vật, canxi sulfat, men khô chưng cất ngũ cốc, natri silico aluminate, dầu cá, chiết xuất hương thảo, được bảo quản bằng hỗn hợp tocopherols và axit xitric...</li></ul>', 456, 1, 132000, 2, '2024-07-02 20:50:30', '2024-07-02 20:50:30', 4),
(4, 'Pate Mèo Kaniva Vitamin Ball Bổ Não Dưỡng Lông 70g', '<p><strong>Pate Mèo Kaniva Vitamin Ball Bổ Não Dưỡng Lông 70g</strong></p><ul><li>Thương hiệu:&nbsp;<strong>Kaniva</strong></li><li>Phù hợp cho: Mèo mọi lứa tuổi</li><li><strong>Pate mèo</strong>&nbsp;Kaniva Vitamin Ball là thức ăn cho mèo hoàn chỉnh và cân bằng được công thức chế biến để đáp ứng nhu cầu dinh dưỡng của tất cả các giai đoạn của mèo. Nó được làm từ các nguồn protein chất lượng cao, bao gồm thịt gà, cá và trứng, và cũng được tăng cường vitamin và khoáng chất để hỗ trợ sức khỏe của mèo. Pate Mèo Kaniva Vitamin Ball cũng được làm từ hỗn hợp thành phần độc đáo giúp hỗ trợ hệ tiêu hóa, da và lông của mèo.</li></ul><p><strong>Lợi ích:</strong></p><ul><li>Vitamin B3, B6 và B9 giúp nuôi dưỡng thần kinh và trí não.</li><li>Tinh Dầu cá hồi ức chế viêm, tăng miễn dịch ở mèo.</li><li>Đặc biệt tốt cho các bé cơ địa da kém hay bị nấm da chữa lành tổn thương do nấm, phòng ngừa rụng lông, cải thiện lông dầy mượt.</li><li>Ngừa tăng cholesterol cao.</li><li>Tăng tỷ lệ chuyển hóa mỡ chống béo phì.</li><li>Tránh các bệnh liên quan đến sụn khớp.</li><li>Duy trì, hỗ trợ hoạt động của não bộ</li><li>Tăng tỷ lệ hấp thụ Canxi tối đa.</li></ul><p><strong>Thành phần</strong></p><ul><li>Thịt gà và cá ngừ, Trứng,&nbsp;Dầu cá hồi,&nbsp;Tinh dầu hoa anh thảo,&nbsp;Taurine,&nbsp;Vitamin và khoáng chất.</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Có thể cho ăn trực tiếp và chỉ cần bổ sung thêm nước là có thể duy trì sức khỏe bình thường của thú cưng. Điều chỉnh liều lượng tùy theo độ tuổi, cân nặng và mức độ hoạt động của mèo nhà bạn</li><li>Bảo quản nhiệt độ phòng, để ngăn mát và dùng hết trong 48 tiếng sau khi mở nắp</li></ul>', 147, 1, 20000, NULL, '2024-07-02 20:53:38', '2024-07-21 19:50:49', 4),
(5, 'Thức Ăn Hạt Cho Mèo Sỏi Thận Royal Canin Urinary S/O', '<p><strong>THỰC PHẨM ĐIỀU TRỊ ROYAL CANIN URINARY S/O</strong></p><p><strong>HỖ TRỢ MÈO BỊ SỎI THẬN&nbsp;</strong></p><p><strong>ROYAL CANIN Urinary S/O</strong>&nbsp;là thực phẩm chức năng được nghiên cứu để hỗ trợ cho sức khỏe đường tiết niệu và bàng quang ở mèo trưởng thành. Thực phẩm lợi tiểu cho mèo, giúp pha loãng các khoáng chất dư thừa có khả năng hình thành sỏi trong nước tiểu. Chỉ số RSS* thấp làm giảm nồng độ các ion hình thành sỏi. Công thức đặc biệt tạo ra môi trường bất lợi cho sự hình thành sỏi Struvite và Canxi oxalate. Dinh dưỡng đặc biệt với hàm lượng Magie thấp, ngăn ngừa sự kết tinh và thúc đẩy hòa tan sỏi Struvite. Giảm nguy cơ tái phát các vấn đề về đường tiết niệu ở mèo.</p><p>Kết hợp với Thức ăn ướt cho mèo bị sỏi thận&nbsp;để bổ sung đầy đủ dưỡng chất cho chú mèo của bạn.</p><p><strong>Chỉ định</strong></p><ul><li>Sỏi Struvite: Hòa tan sỏi Struvite và giảm nguy cơ tái phát.</li><li>Sỏi Canxi Oxalate: Giảm nguy cơ tái phát.</li></ul><p><strong>Chống chỉ định</strong></p><ul><li>Bệnh thận mạn tính (Chronic Kidney Disease/CKD).</li><li>Bệnh về tim mạch.</li><li>Sử dụng đồng thời với thuốc acid hóa nước tiểu.</li><li>Mèo con, mèo đang mang thai và cho con bú.</li></ul><p><strong>THÀNH PHẦN</strong></p><p><strong>Nguyên liệu</strong></p><p>Gạo, gluten lúa mì*, protein gia cầm, bột bắp, chất béo động vật, protein động vật, gluten bắp, khoáng chất, xơ thực vật, dầu cá, dầu đận nành, fructo-oligo-sacarit, chiết xuất cúc vạn thọ (nguồn lutein).</p><p>Phụ gia dinh dưỡng: Vitamin A, Vitamin D3, E1(Sắt), E2 (I ốt), E4 (Đồng), E5 (Mangan), E6 (Kẽm), E8 (Selen), Chất axit hóa nước tiểu: Canxi Sunfat (1.25%). Chất chống oxi hóa.</p><p>*L.I.P.: Protein có độ tiêu hóa cao.</p>', 142, 0, 170000, 2, '2024-07-02 20:57:11', '2024-07-02 21:04:28', 4),
(6, 'Hạt Whiskas Adult Cho Mèo Trưởng Thành', '<p><strong>Hạt Whiskas cho mèo trưởng thành</strong></p><p>- Omega 3, 6 &amp; kẽm giúp bộ lông mềm mại, sáng bóng &amp; chắc khỏe.</p><p>- Vitamin A &amp; taurine giúp sáng mắt.</p><p>- Công thức dinh dưỡng hoàn chỉnh từ nguồn nguyên liệu thô chất lượng cao giúp bé phát triển toàn diện.</p><p>- Sản phẩm có 3 vị: Cá ngừ, Cá thu, Cá biển</p><p><strong>Quy cách:</strong> Túi 1.2kg</p><p><strong>Thương hiệu:</strong> Whiskas</p><p><strong>Loại:</strong> Thức ăn khô</p><p><strong>Xuất xứ:</strong> Thái lan</p>', 345, 0, 130000, 2, '2024-07-02 21:00:19', '2024-07-02 21:03:46', 4),
(7, 'Pate Mèo Teb Only Bổ Sung Dinh Dưỡng Lon 170g', '<p><strong>Pate Mèo Teb Only Bổ Sung Dinh Dưỡng Lon 170g</strong></p><ul><li>Thương hiệu:&nbsp;Teb</li><li>Phù hợp cho: Mèo mọi lứa tuổi</li><li><p><strong>Pate mèo</strong>&nbsp;Teb Only Bổ Sung Dinh Dưỡng là thức ăn ướt cho mèo được làm từ nguyên liệu cao cấp, mang lại nguồn dinh dưỡng đầy đủ và cân bằng cho mèo ở mọi lứa tuổi.&nbsp;Sản phẩm có hương vị thơm ngon, kích thích vị giác của mèo,&nbsp;cho mèo nhà bạn bữa ăn bổ dưỡng và hỗ trợ giải quyết các vấn đề do thiếu hụt dưỡng chất, giúp phát triển toàn diện.</p><p>&nbsp;</p></li></ul><p><strong>Lợi ích:</strong></p><ul><li>Cung cấp nguồn năng lượng đầy đủ để tăng trưởng, phát triển</li><li>Cung cấp vitamin cho sự phát triển, trao đổi chất cần thiết</li><li>Cung cấp lợi khuẩn cần thiết, duy trì hệ vi sinh vật có lợi trong ruột, thúc đẩy sự phát triển của lợi khuẩn</li><li>Loại bỏ những vấn đề như chán ăn, tăng trưởng kém, viêm da, giảm thị lực do thiếu vitamin</li><li>Đáp ứng sự phát triển của mèo con, mèo đang mang thai, cho con bú</li></ul><p><strong>Thành phần dinh dưỡng</strong></p><ul><li>Cá mập, thịt nai, cá ngừ, cá hồi , Chondroitin, Taurine, Omega Ω3--6, vitamin, rong biển thiên nhiên, dầu cá...</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Có thể cho ăn trực tiếp và chỉ cần bổ sung thêm nước là có thể duy trì sức khỏe bình thường của thú cưng. Điều chỉnh liều lượng tùy theo độ tuổi, cân nặng và mức độ hoạt động của mèo nhà bạn</li><li>Bảo quản nhiệt độ phòng, để ngăn mát và dùng hết trong 48 tiếng sau khi mở nắp</li></ul>', 345, 0, 35000, NULL, '2024-07-02 21:03:18', '2024-07-02 21:03:18', 4),
(8, 'Pate Mèo Con Royal Canin Kitten Instinctive 85g', '<p>&nbsp;<strong>Pate Mèo Con Royal Canin Kitten Instinctive 85g</strong></p><ul><li>Thương hiệu: Royal Canin</li><li>Phù hợp cho: Mèo (mèo mẹ đang mang thai, cho con bú và mèo con đến 12 tháng tuổi)</li><li>Pate mèo con Royal Canin Kitten Instinctive là sản phẩm được thiết kế dành riêng cho mèo dưới 12 tháng tuổi. Pate Royal Canin Kitten Instinctive chứa các thành phần trích xuất thịt, sữa và các khoáng chất thiết yếu nhằm hỗ trợ tăng cường hệ thống miễn dịch cho mèo con, thúc đẩy chúng trưởng thành khỏe mạnh. Thức ăn cho mèo ROYAL CANIN được tạo ra với sự cân bằng tối ưu giữa các protein, chất béo và carbohydrate để tăng sự ngon miệng, bổ sung dinh dưỡng hoàn hảo. Pate mèo này còn phù hợp với mèo mẹ đang mang thai và trong giai đoạn cho con bú.</li></ul><p><strong>Lợi ích:</strong></p><ul><li>Hỗ trợ tăng cường hệ thống bài tiết khỏe mạnh.</li><li>Tăng cường hệ miễn dịch của mèo con trong giai đoạn thứ 2.</li><li>Với những mẩu thức ăn nhỏ giúp mèo con nhai dễ dàng.</li><li>Công thức được xây dựng và phát triển phù hợp với nhu cầu dinh dưỡng và hấp dẫn với mèo con.</li></ul><p><strong>Thành phần dinh dưỡng</strong></p><ul><li>Thành phần:&nbsp;Thịt và dẫn xuất từ thịt, protein thực vật, dẫn xuất từ thực vật, ngũ cốc, khoáng chất, dầu và chất béo, men, các loại đường.</li><li>Phụ gia dinh dưỡng: Vitamin D3, E1 (Sắt), E2 (I ốt), E4 (Đồng), E5 (Mangan), E6 (Kẽm).</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Dựa theo độ tuổi và cân nặng của mèo, cho ăn một lượng vừa đủ vào các giờ cố định.</li><li>Có thể trộn với các thức ăn khác hoặc cho ăn trực tiếp.</li><li>Bảo quản: bảo quản ở nơi cao ráo, thoáng mát, tránh ánh nắng mặt trời. Khi mèo dùng không hết, các bạn bọc kín pate và bảo quản tủ lạnh tối đa 3 ngày và nhớ để ở nhiệt độ phòng cho pate bớt lạnh trước khi cho mèo dùng tiếp.</li></ul><p>Lưu ý:<br>&nbsp;</p><ul><li>Không cho mèo ăn quá nhiều trong một lần.</li><li>Nên cho mèo ăn thức ăn chế biến riêng, không cho ăn thức ăn thừa của người. Vì thức ăn của người có nhiều thành phần khiến mèo bị rối loạn tiêu hóa, ảnh hưởng đến sức khỏe của mèo.</li></ul>', 467, 0, 30000, NULL, '2024-07-02 21:32:21', '2024-07-02 21:32:21', 1),
(11, 'Pate Sheba Cho Mèo Con & Mèo Lớn 70g (Nhập Khẩu Thái Lan)', '<p>SHEBA - PATE NGÂM SỐT GIÀNH CHO MÈO CON VÀ MÈO TRƯỞNG THÀNH GÓI 70G<br>&nbsp;</p><p>Sheba có nhiều vị được làm từ cá ngừ, rau củ giúp bổ sung chất sơ và các loại vitamin cần thiết cho mèo với thành phần: Cá ngừ, Thịt gà, Bí đỏ, Cà rốt,...,<br><br>Paddy hiện có đầy đủ 9 hương vị của pate sheba:<br>1. Thịt gà băm nhuyễn giành cho mèo con<br>2. Thịt gà băm nhuyễn giành cho mèo lớn<br>3. Cá ngừ, Thịt gà, Cá bào<br>4. Cá ngừ<br>5. Cá ngừ, Bí đỏ, Cà rốt<br>6. Cá ngừ, Cá hồi<br>7. Cá ngừ, Cá tráp<br>8. Cá ngừ, Thanh cua<br>9. Cá ngừ, Thịt gà<br><br>Đóng gói: 70g<br>Xuất xứ: Thái Lan<br>Sản xuất: Mars</p>', 234, 1, 25000, NULL, '2024-07-02 21:40:39', '2024-07-21 19:50:13', 1),
(12, 'Pate Mèo Meowow Súp Cá Ngừ Trắng Nguyên Miếng (Lon 80g)', '<p><strong>Pate MeoWow Cá Ngừ Trắng Cho Mèo Mọi Lứa Tuổi (Lon 80g)</strong></p><p>Cá ngừ thịt trắng đóng hộp Tuna White Meat là món ăn nhẹ giàu dinh dưỡng, hỗ trợ cho sự phát triển toàn diện của mèo, đồng thời được mix vị với nhiều loại thịt khác để tăng hàm lượng dinh dưỡng cũng như hương vị thơm ngon.</p><p>- Sử dụng thịt cá ngừ trắng tươi, miếng cá mềm, kích thước nhỏ vừa ăn. Các thành phần mix cùng như tôm tươi nguyên con, cá cơm sữa Nhật Bản, thịt cua, cá hồi nguyên thớ và gà xé sasami.</p><p>- Dành cho mọi lứa tuổi, kể cả mèo con, mèo lớn tuổi và mèo có hệ tiêu hóa nhạy cảm.</p><p>- Giàu DHA, omega-3, giúp mèo sáng mắt, mượt lông.</p><p>- Bổ sung taurin, tốt cho tim mạch và trí não.</p><p>- Cấp nước cho chế độ ăn hằng ngày, đặc biệt phù hợp với những chú mèo ít uống nước.</p><p>- Hộp nhôm hút chân không hiện đại, giữ sản phẩm tươi ngon.</p><p>Trong cá ngừ, thịt trắng là phần tinh túy, giàu dinh dưỡng và có nhiều lợi ích đặc biệt đối với sức khỏe và làm đẹp. Thịt trắng có nhiều lợi ích: giàu chất béo bão hòa không no - chất béo có lợi cho sức khỏe, dễ tiêu hóa và hấp thu, giúp cơ thể đào thải lượng cholesterol xấu, tốt cho tim mạch.</p><p>Cá ngừ trắng đóng hộp Tuna White Meat bổ sung những vitamin và khoáng chất thiết yếu mà bữa ăn hằng ngày có thể bị thiếu hụt. Sản phẩm hỗ trợ chăm sóc lông bóng mượt, giúp sáng mắt, giảm đổ ghèn, tăng cường trí não.</p><p>Cá ngừ cũng giúp tăng cường chức năng gan, ngừa thiếu máu, ngăn ngừa lão hóa và hỗ trợ chuyển hóa dinh dưỡng.</p>', 145, 0, 25000, NULL, '2024-07-02 21:46:20', '2024-07-02 21:46:20', 1),
(13, 'Pate Mèo Mọi Lứa Tuổi LaPaw 375g', '<p><strong>Pate Mèo Mọi Lứa Tuổi LaPaw 375g</strong></p><ul><li>Thương hiệu:&nbsp;<strong>LaPaw</strong></li><li>Phù hợp cho: Mèo mọi lứa tuổi&nbsp;(khuyên dùng trên 3 tháng tuổi)</li><li><strong>Pate mèo</strong>&nbsp;LaPaw là sản phẩm thức ăn cho mèo được sản xuất bởi thương hiệu LaPaw.&nbsp;Pate được chế biến từ nguyên liệu sạch, an toàn, cùng các vitamin và khoáng chất cần thiết cho sức khỏe của mèo. Sản phẩm có hương vị thơm ngon, kích thích vị giác của mèo, giúp mèo ăn ngon miệng hơn. Pate Lapaw&nbsp;đảm bảo cung cấp đầy đủ dinh dưỡng cho mèo mọi lứa tuổi.<br>&nbsp;</li></ul><p><strong>Lợi ích:</strong></p><ul><li>Cung cấp đầy đủ protein, chất béo, vitamin và khoáng chất cần thiết cho mèo.</li><li>Giúp mèo phát triển khỏe mạnh, lông mượt, da khỏe.</li><li>Tăng cường sức đề kháng, ngăn ngừa bệnh tật.</li><li>Hệ tiêu hóa khỏe mạnh, hấp thụ dinh dưỡng tốt.</li></ul><p><strong>Thành phần</strong></p><ul><li>Cá ngừ và cá hồi: Cá ngừ, cá ngừ, gan gà, dầu cá, nước tinh khiết, taurine, chiết xuất rong biển, vitamin (AD,3,E,B1,B2,B6,B12) noacin, sắt hữu cơ, đồng hữu cơ, kẽm hữu cơ, manga hữu cơ, selen hữu cơ iốt.</li><li>Bò và gà: Thịt bò, thịt gà, gan gà, dầu gà, nước tinh khiết, taurine, chiết xuất rong biển, vitamin (AD,3,E,B1,B2,B6,B12)</li><li>Gà tươi: Thịt gà, gan gà, tim gà, dầu gà, nước tinh khiết, taurine, vitamin (AD,3,E,B1,B2,B6,B12) noacin, sắt hữu cơ, đồng hữu cơ, kẽm hữu cơ, manga hữu cơ, selen hữu cơ iốt.</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Sử dụng tùy vào nhu cầu hoặc cân nặng của mèo. Có thể trộn với các thức ăn khác hoặc cho ăn trực tiếp.</li><li>Bảo quản: bảo quản ở nơi cao ráo, thoáng mát, tránh ánh nắng mặt trời. Khi mèo dùng không hết, các bạn bọc kín pate và bảo quản tủ lạnh tối đa 3 ngày và nhớ để ở nhiệt độ phòng cho pate bớt lạnh trước khi cho mèo dùng tiếp.</li></ul>', 367, 0, 40000, NULL, '2024-07-02 21:51:42', '2024-07-02 21:51:42', 1),
(14, 'Pate TƯƠI The Pet Cho Chó Mèo Biếng Ăn (1kg)  Ship Now/Grab 2H', '<p>Pate Tươi Cho Mèo Hỗn Hợp cho Chó Mèo Biếng Ăn được làm từ hỗn hợp cá biển và gan gà tươi nguyên chất thích hợp dùng cho Chó Mèo.<br><br>CHẤP HẾT TẤT CẢ MÈO BIẾNG ĂN, KHÓ ĂN, KÉN MỌI LOẠI THỨC ĂN.<br>💯 100% nguyên liệu tự nhiên, không độn rau củ, chứa độ ẩm &amp; đạm tự nhiên cao từ 60-84%.<br>💯 Năng lượng cao hơn vượt trội so với các dòng sản phẩm khác trên thị trường (trung bình ở mức 400kcal/kg).<br>💯 Công thức siêu cấp nước, giúp ngăn ngừa sỏi thận.<br>💯 Với giá chỉ từ 8k/bữa ăn là Boss đã có được bữa ăn thơm ngon, tốt cho sức khỏe.<br>💯 Chỉ cần bảo quản sản phẩm trong ngăn mát, không cần chế biến hay hâm nóng.<br><br>Paddy có sẵn có 2 mùi vị thơm ngon #BestSeller, hấp dẫn các bé kén ăn<br>✅ Hỗn Hợp Gà - cho Chó &amp; Mèo<br>✅ Hỗn Hợp Cá - cho Mèo<br>✅ Hỗn Hợp Gà - cho Chó &amp; Mèo</p><p>Khối lượng: hộp to 1kg</p>', 456, 1, 100000, NULL, '2024-07-02 21:57:46', '2024-07-02 21:57:46', 1),
(15, 'Cần Câu Mèo Đính Chuông Lông Vũ', '<p>Đồ chơi cần câu Mèo bằng thép gắn lông dành cho mèo<br>- Cần với chất liệu thép dẻo bền, có thể uốn cong mà không gây gãy<br>- Thép dẻo tạo độ chuyển động tự nhiên kích thích mèo của bạn chơi đùa vận động<br>- Đồ chơi cho mèo cần câu mèo có tác dụng kích thích vận động ở mèo, giúp chúng giải tỏa căng thẳng, mệt mỏi, từ đó<br>giúp phát triển sức khỏe cũng như não bộ.<br>- Đối với những chú mèo nghịch ngợm thì swing cat còn có sức hút kéo chúng khỏi việc cào cắn đồ đạc trong nhà<br><br>Kích thước:<br>- Chiều dài dây thép: 95cm<br>- Chiều dài phần mồi câu: 12cm<br>- Chất liệu: nhựa, sợi thép và lông nhân tạo.</p>', 80, 0, 30000, NULL, '2024-07-02 22:21:22', '2024-07-02 22:21:33', 1),
(16, 'Bàn Cào Móng Giấy Cho Mèo  Tặng Cỏ Mèo', '<p>Bàn Cào Móng Giấy Cho Mèo + Tặng Kèm Cỏ Mèo (Catnip/Catmint)<br>✔️ Bao gồm: 1 bàn cào móng và 1 gói bột catpip.<br>✔️ Bàn cào móng được làm từ nhiều lớp giấy carton<br>✔️&nbsp;Chữ nhật: Dài 45 x Rộng 20 x Dày 2cm<br>✔️ Sử dụng bàn cào móng làm đồ chơi cho mèo, giúp mèo mài móng, giảm thiểu hư hại đồ đạc trong nhà.<br><br>ĐẶC ĐIỂM NỔI BẬT<br>- Đây là dụng cụ thích hợp để hướng cho chú mèo của bạn cào móng đúng chỗ. Chọn một dụng cụ cào móng với bề mặt thô nhám để mèo của bạn có thể cào và làm đẹp bộ móng bằng tất cả sự thích thú của bé cưng.<br>- Mèo thường sử dụng móng vuốt để cào đồ nội thất hoặc ghế sofa, khi có món đồ chơi dành riêng cho mèo chúng ta không cần lo lắng điều đó nữa.<br>- Cào móng cũng là một hình thức tập thể dục, tận hưởng khoảng thời gian thoải mái và thư giãn một cách đơn giản nhất.<br>- Bàn cào dành riêng cho các bé mèo dùng để cào móng, tránh hiện tượng phá phách, làm hư các đồ trong nhà.<br>- Giúp móng mèo luôn trong tình trạng tốt<br>- Chất liệu tự nhiên giúp móng mèo luôn chắc khỏe, luôn trong tình trạng tốt nhất.<br>- Giúp các bé giải toả căng thẳng, stress.<br>- Thiết kế dạng bàn hình chữ nhật giúp các bé dễ dàng cào hơn.<br>- Kích thước gọn gàng, nhẹ, dễ dàng di chuyển, dọn dẹp<br>- Ngoài ra có thể để bàn cào trên mặt phẳng để các bé nằm.<br><br>HDSD<br>✔️ Không phải tất cả mèo đều sử dụng đồ chơi cào móng ngay từ đầu, bạn có thể rắc catnip vào bàn cào, sau đó nâng cao bàn chân trước của mèo và đặt chúng vào bàn cào để tập cho mèo quen dần.<br>✔️ Có thể rắc thêm cỏ mèo (catnip/catmint) kích thích mèo chơi đùa nhiều hơn</p>', 89, 0, 50000, 15, '2024-07-02 22:23:17', '2024-07-02 22:23:17', 2),
(17, 'Cần Câu Mèo Que Gỗ Đính Thú', '<p><strong>Đặc điểm nổi bật của sản phẩm:</strong>&nbsp;<i><strong>Cây Cần Câu Mèo&nbsp;</strong></i>với thiết kế tay cầm bằng gỗ thơm vát tròn chắc chắn với phần mồi cầu ở đầu dây có&nbsp;nhiều hình thù đa dạng như: chuột, quả bóng&nbsp;tròn, chim nhỏ,..&nbsp;bằng sợi mây&nbsp;hoặc vải bông&nbsp;&nbsp;đi kèm với đó là chuông nhỏ sẽ thu hút được sự hứng thú của thú cưng.&nbsp;<i><strong>Cây Cần Câu Mèo&nbsp;</strong></i>giúp huấn luyện mèo bản năng tự nhiên, nhanh nhẹn, linh hoạt trong hành động. Tạo mối quan hệ thân thiết gắn bó giữ người nuôi và mèo trong lúc chơi đùa cùng nhau.&nbsp;</p><p><strong>Công dụng</strong>:&nbsp; <i><strong>Cây Cần Câu Mèo</strong></i>&nbsp;giúp mèo kích thích chơi đùa, vận động tự nhiên và khỏe mạnh</p><p><strong>Chất liệu&nbsp;:</strong>&nbsp;<i><strong>Cây Cần Câu Mèo&nbsp;</strong></i>được làm bằng Gỗ thơm, Dây chun và Sợi mây+Vải bông</p><p><strong>Kích cỡ khi đóng gói</strong>:&nbsp;40cm x 1cm</p><p><strong>Trọng&nbsp;lượng:&nbsp;</strong>100gram</p><p><strong>Kiểu Dáng:</strong>&nbsp;Chuột, Quả bóng tròn, Chim nhỏ, Sứa nhỏ,..</p>', 57, 0, 30000, 15, '2024-07-02 22:24:37', '2024-07-02 22:24:37', 2),
(18, 'Banh Lồng Chuột Đồ Chơi Cho Mèo', '<p><strong>Đồ Chơi Mèo</strong>&nbsp;Bóng Lồng Sắt Có Chuột Cho Mèo<br><br>– Mèo sinh ra đã có tập tính vờn bắt, nên việc mua cho bé nhà mình một món đồ chơi như Bóng Lồng Sắt Có Chuột Cho Mèo là sự lựa chọn hoàn hảo<br><br>– Bạn không cần bỏ ra quá nhiều thời gian chơi cùng với các bé, chỉ cần một quả bóng mèo nhà bạn có thể tự chơi<br><br>– Chất liệu: Kim loại tốt. Không làm ảnh hưởng răng của thú cưng khi cắn/ngoạm.<br><br>– Đường kính bóng: ~6cm<br><br>– Màu sắc đa dạng, kích thích sự tò mò cũng như làm thú cưng của bạn hứng thú hơn khi chơi.<br><br>– Bạn cũng có thể sử dụng sản phẩm để chơi đùa cùng thú cưng, huấn luyện cho thú cưng cách bắt/tha đồ.<br><br>– Sản phẩm sẽ là một dụng cụ xả stress lý tưởng cho bạn, cũng như thú cưng<br><br>– Sản phẩm được làm bằng chất liệu cao cấp nên rất an toàn cho bé yêu nhà bạn</p>', 67, 0, 50000, 15, '2024-07-02 22:26:41', '2024-07-02 22:26:41', 2),
(19, 'Trụ Cào Cat Tree Đế Tròn TDT 29*29*47 Cm', '<p>Nhà cây cho mèo (cat tree) là một trong những đồ vật mà hội nuôi mèo rất nên sở hữu trong ngôi nhà của mình. Vậy cat tree là gì và tác dụng của nó ra sao?<br>Công dụng của nhà cây cho mèo:<br>️ Tránh việc đồ đạc trong nhà bị cào xước hoặc ở tình trạng lộn xộn<br>️ “Căn nhà” trong mơ cho các “boss”<br>️ Nơi “giải trí” tuyệt cú mèo<br>️ Nơi mèo “tập thể dục”</p>', 67, 0, 250000, 15, '2024-07-02 22:27:31', '2024-07-02 22:27:31', 2),
(20, 'Đồ Chơi Chó Mèo Xe Điện Điều Khiển Từ Xa Sạc USB PetQ', '<p><strong>Đồ Chơi Chó Mèo Xe Điện Điều Khiển Từ Xa Sạc USB PetQ</strong></p><ul><li>Thương hiệu: <strong>PetQ</strong></li><li>Phù hợp cho: Chó/mèo mọi lứa tuổi</li><li>Xe Điện Điều Khiển Từ Xa Sạc USB PetQ là <strong>đồ chơi cho chó</strong> mèo độc đáo và thú vị giúp kích thích tinh thần cho chú chó hoặc mèo cưng. Xe điện điều khiển từ xa khuyến khích thú cưng vận động, giúp chúng vui vẻ khỏe mạnh hơn,&nbsp;giải tỏa căng thẳng, lo âu và ngăn ngừa các hành vi phá phách.</li></ul><p><strong>Lợi ích:&nbsp;</strong></p><ul><li>Chế độ kép tương tác: Thu hút người bạn mèo của bạn với đồ chơi mèo chuyển động bằng điện, có tính năng dễ dàng chuyển đổi giữa chế độ Điều khiển tự động và từ xa, đảm bảo cho mèo của bạn sự phấn khích khi đua bất tận.</li><li>Tránh chướng ngại vật thông minh: Được trang bị cảm biến hồng ngoại, đồ chơi mèo ô tô thể thao này phát hiện chướng ngại vật và đảo hướng thông minh, mang lại trải nghiệm chơi liền mạch mà không bị kẹt.</li><li>Phạm vi từ xa mở rộng: Chỉ huy hành động từ khoảng cách lên đến 15-20 mét, mang đến cho mèo một sân chơi rộng rãi để đuổi theo và vồ lấy đồ chơi ô tô mèo tương tác này.</li><li>Tiện lợi có thể sạc lại USB: Quên việc thay pin! Đồ chơi mèo ô tô tự động này đi kèm với khả năng sạc USB để kéo dài thời gian chơi và sạc lại không phức tạp, giúp thú cưng của bạn giải trí lâu hơn.</li><li>Tự động kích hoạt ở chế độ chờ: Được thiết kế với tính năng chờ thông minh, đồ chơi mèo thông minh tự động chuyển sang chế độ chờ sau năm phút không hoạt động, nhưng một cú chạm đơn giản từ con mèo của bạn ngay lập tức đánh thức niềm vui.</li></ul><p><strong>Thành phần</strong></p><ul><li>Kích thước xe: 74 * 67 * 44mm</li><li>Điều khiển từ xa: 41 * 16 * 115mm</li><li>Chất liệu: ABS</li><li>Pin: 300mAh</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Nhấn nhanh Bật / tắt: Khởi động / tắt xe thể thao.</li><li>Chế độ chuyển đổi: Giữ nút chuyển đổi trong 3 giây khi thiết bị được bật nguồn.</li><li>Chế độ bình thường: (đèn xanh trong 3 giây) Tự động tắt sau 5 phút hoạt động</li><li>Chế độ thông minh: (đèn báo màu xanh lam sáng trong 3 giây) Sau 5 phút hoạt động, hãy vào chế độ chờ và nhấp để kích hoạt.</li></ul>', 56, 0, 200000, NULL, '2024-07-02 22:30:04', '2024-07-02 22:30:09', 1),
(21, 'Đồ Chơi Mèo Chuột Kéo Dây Tự Động FOFOS', NULL, 500, 0, 49000, 15, '2024-07-02 22:31:47', '2024-07-02 22:31:47', 2),
(22, 'Dầu Cá Hồi Zesty Paws Hỗ Trợ Dưỡng Lông & Tăng Cường Đề Kháng Chó Mèo (Mỹ)', '<p>Dầu cá hồi Zesty Paw là một thực phẩm bổ sung:<br>- Hỗ trợ giảm đáng kể lượng cholesterol trong máu cho chó mèo.<br>- Axit Béo Omega-3 với EPA &amp; DHA sẽ giúp bộ lông của thú cưng của bạn luôn dày và bóng.<br>- Dầu cá hồi được khuyên dùng cho các vấn đề sức khỏe như: lông giòn và xỉn màu, rụng lông nhiều, gàu, da khô, tóc mỏng, viêm da, ngứa da, dị ứng, chàm, các vấn đề về sắc tố, rối loạn hệ thống miễn dịch, các vấn đề về khả năng sinh sản.<br>- Sản phẩm không có hương vị nhân tạo hoặc chất bảo quản, không có màu tổng hợp<br>- Không có dẫn xuất ngũ cốc, ngô hoặc đậu nành<br><br>Chỉ định:<br>- Thú cưng có vấn đề về xương khớp.<br>- Dị ứng ngoài da - chàm, nấm, vảy cá, rụng lông nhiều, thời kỳ thay lông, v.v.<br>- Thời kỳ tăng trưởng.<br>- Tốt cho tim mạch, giảm lượng cholesterol xấu trong máu &amp; tăng mức độ cholesterol tốt.<br>- Nâng cao hệ miễn dịch<br>- Tăng cường mùi vị của thức ăn - được khuyến khích cho chó mèo kén ăn.<br><br>Liều lượng khuyến cáo mỗi ngày:<br>- Trọng lượng dưới 10 kg: &lt; 2 - 4 ml<br>- Trọng lượng 11 - 20 kg: &lt; 4 - 8 ml<br>- Trọng lượng 21 - 30 kg: &lt; 8 - 12 ml<br>- Trọng lượng hơn 30 kg: &lt; 12 - 16 ml</p>', 67, 0, 180000, 5, '2024-07-02 22:34:37', '2024-07-02 22:34:37', 3),
(23, 'Viên Nhai Spirit Bổ Sung Dưỡng Chất Cho Chó 160g (Hộp 160 Viên)', '<p><strong>VIÊN SPIRIT BỔ SUNG CANXI CHO CHÓ:</strong></p><p>- Nên dùng vào buổi sáng sớm, kết hợp phơi nắng trước 8h sáng giúp cún chắc khỏe xương, phòng ngừa các bệnh về da. Canxi cần kết hợp với Vitamin D từ ánh sáng mặt trời mới giúp hấp thụ tốt vào cơ thể.</p><p>- Phòng ngừa thiếu hụt canxi, hạ bàn, bại liệt, chân yếu ở chó...</p><p><strong>VIÊN SPIRIT BỔ SUNG KHOÁNG CHẤT</strong></p><p>- Bổ sung chất khoáng cần thiết cho cơ thể các bé cún. - Những bé cún thiếu khoáng thường có biểu hiện ăn cỏ, ăn đất, ăn phân, ăn vôi tường... cần bổ sung thêm viên vitamin và viên khoáng chất cho cún.</p><p><strong>VIÊN SPIRIT DƯỠNG LÔNG, LÀM ĐẸP DA VÀ LÔNG</strong></p><p>- Kích thích mọc lông, mượt lông, giảm thiểu rụng và xơ lông.</p><p>- Các bé cún lông nhiều như Pom, Poodle, Maltese, Bichon... rất cần thiết cho việc chăm sóc bộ lông dày và chắc khỏe.</p><p>- Những bé đang cạo lông cần bổ sung viên dưỡng lông để lông nhanh chóng mọc dài và dày dặn, mượt mà và không bị thưa lông xơ xác nhé.</p><p><strong>VIÊN SPIRIT BỔ SUNG VITAMIN</strong></p><p>- Các bé cún cũng như người, cần đầy đủ vitamin khoáng chất để cơ thể phát triển khỏe mạnh, tăng sức đề kháng, giảm thiểu các nguy cơ thiếu hụt vitamin là tác nhân khiến các bé ốm yếu, còi cọc.</p><p>&nbsp;</p><p><strong>SỬ DỤNG</strong></p><p>- Dưới 5kg: 2 viên/ngày.</p><p>- Từ 10-25kg: 3-4 viên/ngày.</p><p>- Từ 25-35kg: 5-6 viên/ngày.</p><p>- Trên 35kg: 8-10 viên/ngày.</p><p><br>&nbsp;</p>', 68, 0, 80000, NULL, '2024-07-02 22:36:33', '2024-07-02 22:36:33', 3),
(24, 'Gel Dinh Dưỡng Cho Chó Mèo Virbac NutriPlus 120g', '<p><strong>Thông tin chung:&nbsp;</strong></p><ul><li>Thương hiệu: Virbac</li><li>Phù hợp cho: Chó/mèo mọi lứa tuổi (đặc biệt là chó mèo đang lớn, đang mang thai hay nuôi con nhỏ; Chó săn, chó nghiệp vụ; Chó mèo cần hồi phục sau khi ốm, phẫu thuật; Chó mèo sinh ra yếu, còi xương, nhẹ cân, thiếu sữa.)</li><li>Nutri-plus là một loại gel dinh dưỡng cho chó mèo, có vị thơm và rất ngon miệng. Điểm đặc biệt của sản phẩm này so với các loại thức ăn khác là sử dụng các chất dinh dưỡng từ nguồn gốc động vật, giúp chó mèo chuyển đổi các chất dinh dưỡng thành năng lượng nhanh hơn và dễ dàng hơn. Bạn có thể cho thú cưng của mình sử dụng Nutriplus Gel để giúp cải thiện khẩu vị và ngăn ngừa mất cân.&nbsp;</li></ul><p>Nutri-plus phù hợp với tất cả các giống chó mèo như: Poodle, Golden, Mèo Anh lông ngắn,... ở mọi độ tuổi. Đặc biệt, sản phẩm rất phù hợp để sử dụng cho chó mèo cần bổ sung dinh dưỡng, tăng cường sức khỏe hoặc đang bị bệnh cần hỗ trợ điều trị.</p><p><strong>Lợi ích:</strong></p><ul><li>Bổ sung đầy đủ các dưỡng chất, cung cấp năng lượng cùng tất cả các vitamin và khoáng chất cần thiết cho chó, mèo vật cưng của bạn:</li><li>Chứa nhiều chất béo và carbohydrate dạng dễ tiêu hóa giúp chó con, mèo con mau lớn.</li><li>Hỗ trợ sức khỏe chó mẹ mang thai, tăng lượng sữa, chất lượng sữa đảm bảo.</li><li>Bồi bổ cơ thể chó nghiệp vụ, chó săn.</li><li>Tăng cường sức khỏe cho chó bị thương, chó bị ốm, chó sau phẫu thuật,…</li></ul><p><strong>Thành phần dinh dưỡng</strong></p><p>Calcium pantothenate…………….………......35,25mg</p><p>Folic acid………………………………….…...…..........3,5mg</p><p>Iron………………………………………........…......….....8,8mg</p><p>Iodine……………………………………….…................8,8mg</p><p>Manganese……………………………….…...…........17,65mg</p><p>Magnesium……………………………….......…...…...7,00mg</p><p>Vitamin A……………………………………...…..........17635</p><p>IU Vitamin D…………………………….….....….…...882</p><p>IU Vitamin E………………………….........…….….....106</p><p>IU Thiamine hydrochloride (B1) …...…...35,25 mg</p><p>Riboflavin (B2) …………………………….....…...….3,5 mg</p><p>Pyridoxine hydrochloride (B6) .........….....7,6 mg</p><p>Cyanocobalamin (B12) ………….…...…….....0,03525 mg</p><p>Niacinamide (nicotinamide)………….…...….35,25 mg</p><p>Tá dược gồm triglycerides, meat peptone, glucose, maltose qs………120,5g</p><p><strong>Hướng dẫn sử dụng</strong></p><p>Nutri-plus gel có thể dùng từ 3 – 5 ngày.</p><ul><li>1-2 thìa cho 5kg thể trọng/ngày (khoảng 10cm khi bơm thuốc ra khỏi ống). Trong trường hợp thú bị quá suy nhược hoặc đang hồi sức.</li><li>Nutri-plus gel có thể dùng như là một nguồn thức ăn cho chó, thức ăn cho mèo duy nhất với liều 2-4 thìa/ 5kg thể trọng mỗi ngày.</li></ul>', 90, 0, 210000, NULL, '2024-07-02 22:38:24', '2024-07-02 22:38:24', 3),
(25, 'Dầu Cá Hồi Brit Care Dưỡng Lông Chó', '<p>DẦU CÁ HỒI CHO CHÓ MÈO BRIT CARE 1 LÍT GIÁ CỰC RẺ<br><br>Dầu cá hồi cho chó mèo Brit care là một thực phẩm bổ sung đã được kiểm chứng. Dầu cá hồi Brit care cho chó và mèo làm giảm đáng kể lượng cholesterol trong máu. Sử dụng dầu cá hồi thường xuyên sẽ giúp bộ lông của thú cưng của bạn luôn dày và bóng. Dầu cá hồi được khuyên dùng cho các vấn đề sức khỏe như: tóc giòn và xỉn màu, rụng tóc nhiều, gàu, da khô, tóc mỏng, viêm da, ngứa da, dị ứng, chàm, các vấn đề về sắc tố, rối loạn hệ thống miễn dịch, các vấn đề về khả năng sinh sản.<br><br>Chỉ định:<br>Các bệnh về xương khớp.<br>Dị ứng và bệnh ngoài da - bệnh chàm, bệnh vảy cá, rụng tóc nhiều, thời kỳ thay lông, v.v.<br>Dị ứng thực phẩm.<br>Không có cảm giác thèm ăn.<br>Thời kỳ tăng trưởng.<br><br>Các tính năng cơ bản của sản phẩm<br>Bổ sung chế độ ăn uống cho chó và mèo.<br>Giảm lượng cholesterol trong máu.<br>Tăng mức độ cholesterol tốt.<br>Tăng cường khả năng miễn dịch.<br>Tăng cường mùi vị của thức ăn - được khuyến khích cho chó mèo kén ăn.<br>Dùng cho da bị dị ứng.<br><br>Liều lượng hàng ngày:<br>Trọng lượng dưới 12 kg: 2-4 ml<br>Trọng lượng 12-24 kg - 4-8 ml<br>Trọng lượng 24-28 kg - 8-12 ml<br>Trọng lượng hơn 48 kg - 12-16 ml</p><p><br>&nbsp;</p>', 89, 1, 110000, NULL, '2024-07-02 22:39:52', '2024-07-21 19:50:36', 1),
(26, 'Xổ Giun Virbac Endogard Cho Chó (1 Viên 10kg)', '<p><strong>Lưu ý:</strong>&nbsp;<i>An toàn khi sử dụng cho tất cả các giống chó và lứa tuổi: có thể dùng cho chó con, chó đang mang thai và những giống chó nhạy cảm như chó chăn cừu, chó Collie.</i></p>', 146, 0, 38000, NULL, '2024-07-02 22:42:09', '2024-07-02 22:42:09', 3),
(27, 'Viên Nhai Dưỡng Lông Chó Mèo Zesty Paws Omega Bites Skin & Coat', '<p>Zesty Paws Omega Bites chứa nhiều axit béo omega, vitamin và chất dinh dưỡng.<br><br>Được làm từ dầu cá, biotin và vitamin C và E<br>Dành cho những chú chó có bộ lông xỉn màu, khô và dễ gãy rụng.<br>Hỗ trợ dinh dưỡng cho bộ lông chắc khỏe, bóng mượt và mềm mại.<br>Hỗ trợ sức khỏe xương khớp và hông.<br>Tăng cường hệ thống miễn dịch và hoạt động của tim mạch.<br><br>Thương hiệu: Zesty Paws<br>Trọng lượng: 360g</p>', 78, 0, 110000, 5, '2024-07-02 22:44:42', '2024-07-02 22:44:42', 3),
(28, 'Trang Chủ Nhỏ Tai Chó Mèo Virbac Epiotic 125ml Nhỏ Tai Chó Mèo Virbac Epiotic 125ml', '<p><strong>Nhỏ Tai Chó Mèo Virbac Epiotic 125ml</strong></p><ul><li>Thương hiệu: Virbac</li><li>Phù hợp cho: Chó/ Mèo mọi độ tuổi</li><li>Chó mèo có nhiều lông bên trong tai, đó là nơi chứa bụi bẩn, mảnh vụn và tích lũy ráy tai làm chúng rất khó chịu. Vệ sinh tai cho chó mèo của bạn hàng tuần sẽ giữ cho đôi tai của chúng luôn sạch sẽ, khỏe mạnh và tránh một số bệnh tật về tai. Thuốc nhỏ tai Epi-Otic là một dung dịch vệ sinh tai cho chó mèo đến từ thương hiệu Virbac, có tính sát trùng, không kích ứng và không chứa cồn. Sản phẩm này có công thức đặc biệt loại bỏ vảy sừng, bụi bẩn, ráy tai và làm khô ống tai nhanh chóng, giúp bạn dễ dàng hơn trong việc vệ sinh tai cho thú cưng của mình.</li></ul><p><strong>Lợi ích:</strong></p><ul><li>Làm sạch tai ngoài và ống tai đều đặn, đặc biệt làm sạch chất bẩn và ráy tai, làm sạch các mô hoại tử và các mảnh vụn của tai chó, mèo trước khi khám.</li><li>Làm sạch tai trước khi tiến hành các biện pháp điều trị hoặc nhỏ thuốc trị bệnh tai khác.</li><li>Tạo môi trường sạch sẽ giúp điều trị khi bị viêm tai.</li></ul><p><strong>Thành phần</strong><br>&nbsp;</p><p>Epi-Otic là một sản phẩm có tính sát trùng nhưng không kích ứng và không chứa cồn:</p><ul><li>Acid Lactic được sử dụng rộng rãi như một chất khử trùng nhẹ.</li><li>Acid Salicylic phân giải chất bẩn, kìm khuẩn và chống ngứa.</li><li>Propylene glycol hòa tan chất tiết (ráy tai) và bụi bẩn; tạo ẩm và kháng khuẩn.</li><li>Docusate sodium tạo một màng phủ bảo vệ và giúp khô ráo hoàn toàn.</li><li>PCMX có tác dụng kháng khuẩn và diệt nấm hiệu quả.</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Lắc kỹ chai thuốc trước khi sử dụng.&nbsp;</li><li>Bóp nhẹ và nhỏ thuốc vào tai.&nbsp;</li><li>Xoa nhẹ phần gốc tai, lau phần trên của vành tai và các phần có thể tiếp xúc được bằng bông gòn thấm Epi-Otic.</li><li>Vệ sinh thông thường: 2-3 lần /tuần.</li><li>Sử dụng để vệ sinh trước khi tiến hành các biện pháp điều trị khác.</li></ul>', 57, 0, 499000, NULL, '2024-07-02 22:47:29', '2024-07-02 22:47:42', 1),
(29, 'Bình Bú Sữa PETAG Chó Mèo Con (Chuẩn USA)', '<p>Bình sữa PetAg rời cho thú cưng được sản xuất bởi hãng chuyên về sữa và chăm sóc thú cưng PetAg - nhãn hiệu chuyên sản xuất các dòng sữa KMR, Esbilac, Petlac.</p><p>+ Với những chú thú cưng non nớt còn nhớ “sữa mẹ”, một chiếc bình sữa chuyên dụng sẽ giúp bạn dễ dàng vỗ về và chăm sóc chúng thật chu đáo.</p><p>+ Bình sữa rời có vạch chia chi tiết trên thân bình giúp bạn canh chỉnh lượng sữa hợp lý kết hợp cùng đầu ti mềm mại và được thiết kế đặc biệt để tạo cảm giác thoải mái và gần gũi, mang đến cho chú thú cưng nhỏ bé của bạn sự nâng niu và chăm sóc dịu dàng đầy ngọt ngào như chính bầu sữa của mẹ</p><p>ĐẶC ĐIỂM NỔI BẬT</p><p>- Chất liệu nhựa cao cấp bảo đảm an toàn, bảo đảm độ nhẹ và độ bền cho sản phẩm.</p><p>- Đầu ti mềm mại và có thiết kế đặc biệt dành riêng cho thú cưng, tạo sự gần gũi và thoải mái khi bú.</p><p>- Có vạch chia chi tiết trên thân bình giúp bạn canh chỉnh lượng sữa hợp lý.</p><p><br>&nbsp;</p>', 456, 0, 65000, NULL, '2024-07-02 22:55:00', '2024-07-02 22:55:00', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Dịch vụ khách sạn', '1719846706.jpg', '2024-07-01 01:11:46', '2024-07-01 01:11:46'),
(2, 'Spa-Grooming', '1719846726.webp', '2024-07-01 01:12:06', '2024-07-01 01:12:06'),
(3, 'Dịch vụ khác', '1719846737.jpg', '2024-07-01 01:12:17', '2024-07-01 01:12:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL,
  `CMND` varchar(30) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `chucvu` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `local`, `phone`, `date`, `CMND`, `sex`, `chucvu`, `image`, `created_at`, `updated_at`) VALUES
(6, 'Phạm Thu Cúc', 'cucpt@gmail.com', '155-157 Trần Quốc Thảo, Quận 3, Hồ Chí Minh', '0931491997', '2001-06-15', '0123456789', 'Nữ', 'Nữ', '1719916090.jpg', '2024-07-01 15:39:31', '2024-07-01 20:28:10'),
(7, 'Hồ Thị Thanh Ngân', 'nganhtt@gmail.com', '6 Nguyễn Lương Bằng, Tân Phú, Quận 7, Hồ Chí Minh', '0926737168', '1999-01-15', '0123456789', 'Nữ', 'Bán hàng', '1719898813.jpg', '2024-07-01 15:40:13', '2024-07-01 15:40:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyen Phuong Nam', 'admin@gmail.com', NULL, '$2y$10$BQ6vUidKXR/HIoiKg2Trf.CGb99LAUemSin66PZNs.RC3eK3yJdK2', NULL, '2024-06-30 20:55:06', '2024-07-01 21:44:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `ma` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `dk_hoadon` int(11) DEFAULT NULL,
  `dk_soluong` int(11) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time_start` varchar(255) NOT NULL,
  `time_end` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`id`, `ma`, `soluong`, `dk_hoadon`, `dk_soluong`, `discount`, `status`, `description`, `time_start`, `time_end`, `created_at`, `updated_at`) VALUES
(1, 'ABCDEFGH', 122, 310000, 2, 20, 1, NULL, '2024-07-23', '2024-07-31', '2024-07-21 21:29:05', '2024-07-23 19:01:44'),
(3, 'ZXCVBVCXZ', 234, 200000, 3, 15, 1, NULL, '2024-07-23', '2024-07-31', '2024-07-22 13:43:53', '2024-07-22 13:43:53'),
(4, 'QWETYUO', 122, 100000, 2, 5, 1, NULL, '2024-07-23', '2024-07-31', '2024-07-22 13:44:50', '2024-07-23 19:01:48'),
(5, 'ASDFGHJKL', 122, NULL, NULL, 15, 1, NULL, '2024-07-22', '2024-07-31', '2024-07-22 13:46:21', '2024-07-23 19:01:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher_users`
--

CREATE TABLE `voucher_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `soluong` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_voucher` int(10) UNSIGNED NOT NULL,
  `id_Cus` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `voucher_users`
--

INSERT INTO `voucher_users` (`id`, `soluong`, `status`, `id_voucher`, `id_Cus`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, '2024-07-23 19:01:44', '2024-07-23 19:01:44'),
(2, 1, 1, 4, 2, '2024-07-23 19:01:48', '2024-07-23 19:01:48'),
(3, 0, 1, 5, 2, '2024-07-23 19:01:51', '2024-07-23 19:07:09');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_idcus_foreign` (`idCus`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCat`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_idcus_foreign` (`idCus`),
  ADD KEY `comments_idpro_foreign` (`idPro`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_email_unique` (`email`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_idcat_foreign` (`idCat`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `image_products`
--
ALTER TABLE `image_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_products_idpro_foreign` (`idPro`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_idcus_foreign` (`idCus`),
  ADD KEY `orders_idvoucher_foreign` (`idVoucher`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_idorder_foreign` (`idOrder`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`idPro`),
  ADD KEY `products_idcat_foreign` (`idCat`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `voucher_users`
--
ALTER TABLE `voucher_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_users_id_voucher_foreign` (`id_voucher`),
  ADD KEY `voucher_users_id_cus_foreign` (`id_Cus`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `idCat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `image_products`
--
ALTER TABLE `image_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `idPro` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `voucher_users`
--
ALTER TABLE `voucher_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_idcus_foreign` FOREIGN KEY (`idCus`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_idcus_foreign` FOREIGN KEY (`idCus`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_idpro_foreign` FOREIGN KEY (`idPro`) REFERENCES `products` (`idPro`);

--
-- Các ràng buộc cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_idcat_foreign` FOREIGN KEY (`idCat`) REFERENCES `categories` (`idCat`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `image_products`
--
ALTER TABLE `image_products`
  ADD CONSTRAINT `image_products_idpro_foreign` FOREIGN KEY (`idPro`) REFERENCES `products` (`idPro`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_idcus_foreign` FOREIGN KEY (`idCus`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_idvoucher_foreign` FOREIGN KEY (`idVoucher`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_idorder_foreign` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_idcat_foreign` FOREIGN KEY (`idCat`) REFERENCES `categories` (`idCat`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `voucher_users`
--
ALTER TABLE `voucher_users`
  ADD CONSTRAINT `voucher_users_id_cus_foreign` FOREIGN KEY (`id_Cus`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `voucher_users_id_voucher_foreign` FOREIGN KEY (`id_voucher`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
