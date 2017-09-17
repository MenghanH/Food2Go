-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2017 at 04:41 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(17, 17, '2017-08-03', 8, 'COD', 'giao hang nhanh', '2017-08-02 20:30:32', '2017-08-02 20:30:32'),
(18, 18, '2017-08-10', 16, 'COD', 'asd', '2017-08-10 07:48:25', '2017-08-10 07:48:25'),
(19, 19, '2017-08-10', 8, 'COD', 'quick', '2017-08-10 07:59:03', '2017-08-10 07:59:03'),
(16, 16, '2017-08-02', 8, 'COD', 'lam banh it ngot thoi', '2017-08-02 06:13:39', '2017-08-02 06:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(19, 16, 1, 1, 8, '2017-08-02 06:13:39', '2017-08-02 06:13:39'),
(20, 17, 1, 1, 8, '2017-08-02 20:30:32', '2017-08-02 20:30:32'),
(21, 19, 1, 1, 8, '2017-08-10 07:59:03', '2017-08-10 07:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(17, 'Ton', 'Male', 'tonle@gmail.com', 'auckland', '0123456789', 'giao hang nhanh', '2017-08-02 20:30:32', '2017-08-02 20:30:32'),
(18, 'asd', 'Male', 'asd@gmail.com', 'asd', 'asd', 'asd', '2017-08-10 07:48:25', '2017-08-10 07:48:25'),
(19, 'bao bao', 'Male', 'baonguyen@gmail.com', 'mount street', '0123456789', 'quick', '2017-08-10 07:59:03', '2017-08-10 07:59:03'),
(16, 'Ngoc cao', 'nữ', 'Ngociubao@gamil.com', '53 tan vinh hcm', '0123456789', 'lam banh it ngot thoi', '2017-08-02 06:13:39', '2017-08-02 06:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Durian crepe', 5, 'Smooth and decilious with nice smell', 10, 8, '1430967449-pancake-sau-rieng-6.jpg', 'bag', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'Chocolate crepe', 6, '', 10, 6, 'crepe-chocolate.jpg', 'bag', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Durian-Banana Crepe', 5, '', 15, 10, 'crepe-chuoi.jpg', 'bag', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Peach Crepe', 5, '', 16, 0, 'crepe-dao.jpg', 'bag', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Strawberry Crepe', 5, '', 16, 0, 'crepedau.jpg', 'bag', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Original French Crepe', 5, '', 20, 18, 'crepe-phap.jpg', 'bag', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Apple Crepe', 5, '', 16, 0, 'crepe-tao.jpg', 'bag', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Green Tea Crepe', 5, '', 16, 15, 'crepe-traxanh.jpg', 'bag', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Durian-melons Crepe', 5, '', 16, 15, 'saurieng-dua.jpg', 'bag ', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'BlueBerry Gato', 3, '', 25, 0, '544bc48782741.png', 'pie', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'Fruit Jelly Gato', 3, '', 20, 18, '210215-banh-sinh-nhat-rau-cau-body- (6).jpg', 'pie', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Chocolate Strawberry cake', 3, '', 30, 28, 'banh kem sinh nhat.jpg', 'pie', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Strawberry III cake', 3, '', 30, 28, 'Banh-kem (6).jpg', 'pie', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Strawberry I cake', 3, '', 35, 32, 'banhkem-dau.jpg', 'pie', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Fruit II cake', 3, '', 15, 12, 'banhtraicay.jpg', 'bag', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Apple Cake', 3, '', 25, 24, 'Fruit-Cake_7979.jpg', 'pie', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'Cream Apple cake', 2, '', 18, 0, '20131108144733.jpg', 'bag', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Chocolate-Fruit cake', 2, '', 15, 0, 'Fruit-Cake_7976.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Chocolate-Fruit II cake', 2, '', 15, 0, 'Fruit-Cake_7981.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'Peach Cake', 2, '', 16, 15, 'Peach-Cake_3294.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Salted egg donuts I', 1, '', 16, 15, 'banhbonglantrung.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Salted egg donuts II', 1, '', 18, 0, 'banhbonglantrungmuoi.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'French cake', 1, '', 18, 0, 'banh-man-thu-vi-nhat-1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Australia bread', 1, '', 8, 7, 'dung-khoai-tay-lam-banh-gato-man-cuc-ngon.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Salty cake mixed', 1, '', 5, 0, 'Fruit-Cake.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'Muffins eggs', 1, '', 10, 8, 'maxresdefault.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Scone Peach Cake', 1, '', 12, 0, 'Peach-Cake_3300.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Loaf I bread', 1, '', 10, 0, 'sli12.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Chocolate Strawberry I cake', 4, '', 38, 35, 'sli12.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'Fruit-Cake I', 4, '', 38, 35, 'Fruit-Cake.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Fruit-Cake II', 4, '', 38, 35, 'Fruit-Cake_7971.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Doraemon cake', 4, '', 28, 25, 'p1392962167_banh74.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Caramen Pudding', 4, '', 28, 0, 'Caramen-pudding636099031482099583.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Chocolate Fruit', 4, '', 32, 30, 'chocolate-fruit636098975917921990.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Coffee Chocolate GH6', 4, '', 32, 30, 'COFFE-CHOCOLATE636098977566220885.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Mango Mouse', 4, '', 32, 30, 'mango-mousse-cake.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Matcha Mouse', 4, '', 35, 33, 'MATCHA-MOUSSE.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Flower Fruit', 4, '', 35, 33, 'flower-fruits636102461981788938.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Strawberry Delight', 4, '', 35, 33, 'strawberry-delight636102445035635173.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'Raspberry Delight', 4, '', 35, 33, 'raspberry.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'Beefy Pizza', 6, 'Beef, corn,BBQ sauce,mozzarella cheese', 15, 13, '40819_food_pizza.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Hawaii Pizza', 6, 'Tomato Sauce, ham , melons,mozzarella cheese', 12, 0, 'hawaiian paradise_large-900x900.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Smoke Chicken Pizza', 6, 'BBQ chicken,mushroom,Tomato sauce,mozzarella cheese.', 12, 0, 'chicken black pepper_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Sausage Pizza', 6, 'klobasa Sausage, mushroom, corn, Tomato sauce, Mozzarella cheese.', 12, 0, 'pizza-miami.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Ocean Pizza', 6, ' Prawn, squid,Chill, Onion, Tomato,mozzarella cheese.', 12, 0, 'seafood curry_large-900x900.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'All Meaty Pizza', 6, 'Ham, bacon, chorizo,mozzarella cheese.', 14, 0, 'all1).jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Tuna Pizza', 6, 'Tuna, Mayonnaise sauce,Tomato sauce,Onion, Mozzarella cheese', 14, 0, '54eaf93713081_-_07-germany-tuna.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, 'Cream cake coconut milk', 7, '', 12, 10, 'maxresdefault.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Cream cake milk', 7, '', 12, 10, 'sukem.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, 'Cream cake with fresh milk fried crispy', 7, '', 15, 0, '1434429117-banh-su-kem-chien-20.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Fresh Strawberry milk cake', 7, '', 15, 0, 'sukemdau.jpg', 'bag', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, 'Cream-cheese cake', 7, '', 15, 0, 'He-Thong-Banh-Su-Singapore-Chewy-Junior.jpg', 'bag', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, 'Fresh cream with fruit cake', 7, '', 15, 0, 'foody-banh-su-que-635930347896369908.jpg', 'bag', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, 'Cream-coffe cake', 7, '', 15, 0, 'banh-su-kem-ca-phe-1.jpg', 'bag', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, 'Cream cheese cake', 7, '', 15, 0, '50020041-combo-20-banh-su-que-pho-mai-9.jpg', 'bag', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, 'Chocolate cream cake', 7, '', 15, 0, 'combo-20-banh-su-que-kem-sua-tuoi-phu-socola.jpg', 'bag', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, 'Macaron cake', 2, 'To enjoy macaron, people can find traditional flavors such as raspberry, chocolate, to new flavors such as mushrooms and green tea. Macaron with crunchy crust of bread crumbs, fatty sweetness of the kernel, lovely appearance and colorful colors, this is a dish you should not miss when exploring the French cuisine. .', 20, 18, 'Macaron9.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, 'Tiramisu - Italia', 2, 'Just take a piece, you will feel all the flavors that mix the same so people also say this cake is Paradise in your mouth.', 20, 0, '234.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, 'Apple cake - America', 2, 'American Apple Cake with crispy crust, soft crust, apple sweet aroma, sweet taste of fruit will be a perfect choice for pastry fans around the world..', 20, 0, '1234.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, 'Cupcake - UK', 6, 'The cupcakes are made up of soft spongy cakes and creamy top of the eye with many different shapes and colors. Cupcakes are also said to bring joy and laughter as their lovely shape.', 15, 12, 'cupcake.jpg', 'pie', 1, NULL, NULL),
(62, 'Sachertorte', 6, 'Sachertorte is a sponge cake created by Austria best patriot & nbsp; chef. Sachertorte has a sweet taste, consisting of layers of bread made from bread guts and milk cheesecake, alternating between layers of cake is apricot jam. This chowder is so famous that the Austrian city of Vienna has set a national Sachertorte date on December 5 every year.', 25, 22, '111.jpg', 'pie', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Saltine crackers', 'If you are fascinated by the sweet tarlet, you can not miss the salty tarso. In addition to eye-catching shapes, crispy crispy crackers along with salty salmon like chicken, mushroom, pig, ... of cake will conquer anyone who try it.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Cake', 'Cake is a common food in the form of bread rolls made from dough, baked up for dessert. Cakes come in a variety of colors, which can be categorized according to ingredients and processing techniques such as wheat pastry, butter, sponge cakes. Cake can serve special items such as wedding cake, birthday cake, Christmas cake, Halloween cake..', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Fruit cake', 'Fruit cake is a play, not only Hue but when \"lost\" in the land of ancient Vietnam, this cake also seems a bit sophisticated, picky and special. Inspired by the fruits of the garden, through the skillful hand of the Hue woman, the fruit cake was born - sweet, fragrant, gentle to please so many people enjoy..', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Cheese cake', 'cream cakes actually come in a variety of flavors, textures and different ways of doing things, not just \"cake\" in general!', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Crepes', 'Crepe is a famous French cakes, delicious cakes, delicious so this has made many young people have to \"fall in love\"', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Pizza', 'Pizza is not only a favorite food around the world, but also recognized by the EU authorities as part of the European culinary heritage. And to be certified as a pizza maker is not easy. One has to go through all the steps taken by the Italian government and the European Union ... all to ensure the reputation of this dish..', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Cream cake', 'Cream cake is a pastry in the form of cream made from ingredients such as wheat flour, eggs, milk, butter .... beat to form a mixture and then by pressing and spraying through a bag to Shape the small cake and finally be cooked ripe. Cream cake can add chocolate ingredients to enhance the taste. Cake originated from France.', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Bao Nguyen', 'ricarnguyen@gmail.com', '$2y$10$nmV7ruqOZwVG9Dj0mRSHnu2HGvRIKjMl8416jS9qWX2glTuEGTiLm', '0220103933', '17 wakefield', '0wN10F84vpNVkwFaYTDCjdcb4f7PHsexN6OGyCA9YEXMzqpgLmUUnsF1LJut', '2017-07-25 19:06:47', '2017-07-25 19:06:47'),
(8, 'Thien Phu', 'phu.nguyen09995@gmail.com', '$2y$10$Qrvj0Urz7tiDrT2CVa2kxeWDj.HPEsz8HUY5n1PWCTX55OOkraWii', '0201589796', '17 wakefield', 'EYuuVutA04CO0pqr9LMHSRTYdy5rDPQUxJOu5SWyWA7Fdho46L5TUcqOTSv8', '2017-07-25 19:08:56', '2017-07-25 19:08:56'),
(9, 'Hieu Le', 'hieule@gmial.com', '$2y$10$Shht2IVag2Z9iCE2uvIJC.J/PObV3IC7Mop6lCtpPhvWP/bAK3ZRi', '01297812570', '1010 New Zealand', NULL, '2017-07-25 19:25:40', '2017-07-25 19:25:40'),
(10, 'Nhu Quynh', 'quynh@gmail.com', '$2y$10$jAZUnWjOryoqhJLFhIGmMeXIpo6T1tRThPM5SiaivthGL9pAccjIm', '0123456789', 'fruitvale auckland', NULL, '2017-07-25 19:26:56', '2017-07-25 19:26:56'),
(11, 'Nhu Quynh Tran', 'quynh123@gmail.com', '$2y$10$ICjqS3Ak6XIDjSbnQUpEW.7pXiAekfULqFjosGDeHE0tun53Sg1SG', '0123456789', 'fruitvale auckland', 'uTSi8X7Y0pXJMtX0vRpDMTxY72JBznig7QVjNygMAg3MSAM40WCcmo1Co1ax', '2017-07-25 19:29:49', '2017-07-25 19:29:49'),
(12, 'Boi Ngoc', 'ngociu@gmail.com', '$2y$10$CthWCmryCy4Ds8n7MbS31OGEUGEZsLfHLqkw08LVhQaUPn7oCWWyy', '012897123456', 'Dong thap viet nam', NULL, '2017-07-25 19:30:52', '2017-07-25 19:30:52'),
(13, 'Huy Tran', 'huytran@gmail.com', '$2y$10$r6wn8NpGXDfFfzXH.X2DPO2wdRByAbyWpMEY8MOFfkigRRrjZ9AZq', '0123965478', 'mount street', NULL, '2017-07-25 20:11:41', '2017-07-25 20:11:41'),
(14, 'Phuong Tran', 'phuongtran@gmail.com', '$2y$10$WIjK7hYD.XaRdrswUYOT6OTQMDwR24Ik2zO4gx5spPevzPVQf2sem', '0147258369', 'fruitvale auckland', NULL, '2017-07-25 20:12:43', '2017-07-25 20:12:43'),
(15, 'Ton Le', 'tonle@gmail.com', '$2y$10$6XqMUZz4eZHhBmPL1iQWVelnntf71/5Hkwk4K4UVMfMJjBD5y0Csa', '0125369874', 'Liverpool', NULL, '2017-07-25 20:31:51', '2017-07-25 20:31:51'),
(16, 'Jeremy', 'jeremy@gmail.com', '$2y$10$IDJers/GWUoDv307Tre7fuYZNZqJjVX6.mKwoHxk6EHJNY3Va.Oga', '0321456987', 'Auckland', NULL, '2017-07-25 20:34:53', '2017-07-25 20:34:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
