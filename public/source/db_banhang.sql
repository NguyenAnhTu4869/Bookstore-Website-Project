-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2017 at 08:34 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

-- INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
-- (1, 1, '2020-06-28', 90000, 'COD', 'Vui lòng giao hàng đúng giờ', '2020-06-28 07:14:32', '2020-06-28 07:14:32'),
-- (2, 2, '2020-06-28', 125000, 'ATM', 'hello', '2020-06-28 07:25:25', '2020-06-28 07:25:25'),
-- (3, 2, '2020-06-28', 425000, 'COD', 'hello', '2020-06-28 07:30:37', '2020-06-28 07:30:37'),
-- (4, 3, '2020-06-28', 222000, 'COD', 'Vui lòng giao hàng trước 5h', '2020-06-28 10:15:17', '2020-06-28 10:15:17'),
-- (5, 4, '2020-06-29', 300000, 'COD', 'Vui lòng chuyển đúng hạn', '2020-06-29 13:14:32', '2020-06-29 13:14:32');

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

-- INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
-- (1, 1, 1, 5, 15000, '2020-06-28 07:14:32', '2020-06-28 07:14:32'),
-- (2, 1, 2, 1, 15000, '2020-06-28 07:14:32', '2020-06-28 07:14:32'),
-- (3, 4, 3, 1, 15000, '2020-06-29 13:13:31', '2020-06-29 13:13:31'),
-- (4, 4, 7, 1, 230000, '2020-06-29 13:13:31', '2020-06-29 13:13:31'),
-- (5, 3, 19, 2, 150000, '2020-06-28 10:15:17', '2020-06-28 10:15:17'),
-- (6, 3, 54, 1, 125000, '2020-06-28 10:15:17', '2020-06-28 10:15:17'),
-- (7, 2, 54, 1, 125000, '2020-06-28 07:25:25', '2020-06-28 07:25:25'),
-- (8, 5, 19, 2, 150000, '2020-06-29 13:14:32', '2020-06-29 13:14:32');

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
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

-- INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
-- (1, 'Jane', 'nữ', 'jane@gmail.com', 'HCM', '0101010101', 'Vui lòng giao hàng đúng giờ', '2020-06-28 07:14:32', '2020-06-28 07:15:23'),
-- (2, 'Robert', 'nam', 'robert@gmail.com', 'HCM', '0909090909', 'hello', '2020-06-28 07:25:25', '2020-06-28 07:30:37'),
-- (3, 'Hana', 'nữ', 'hanahana@gmail.com', 'HCM', '0123456789', 'Vui lòng giao hàng trước 5h', '2020-06-28 10:15:17', '2020-06-28 10:19:33'),
-- (4, 'Bruce', 'nam', 'wayne@gmail.com', 'HCM', '1234567890', 'Vui lòng chuyển đúng hạn', '2020-06-29 13:13:31', '2020-06-29 15:23:32'),
-- (5, 'Lucy', 'nữ', 'lucylover@gmail.com', 'HCM', '9876543210', 'không chú', '2020-06-29 13:14:32', '2020-06-29 13:15:02');

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
(1, '', '', 'sample1.jpg', '2020-06-20 08:00:23', '0000-00-00 00:00:00'),
(2, '', '', 'sample2.jpg', '2020-06-20 08:07:49', '0000-00-00 00:00:00'),
(3, '', '', 'sample3.jpg', '2020-06-20 08:08:35', '0000-00-00 00:00:00'),
(4, '', '', 'sample4.jpg', '2020-06-20 08:09:24', '0000-00-00 00:00:00'),
(5, '', '', 'sample5.jpg', '2020-06-20 08:10:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `amount` int(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `author`, `description`, `amount`, `unit_price`, `promotion_price`, `image`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Bookmark Fairy tail (1 cái)', 7, '', '', 20, 15000, 0, 'bookmark_ft.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(2, 'Bookmark Narto (1 cái)', 7, '', '', 20, 15000, 0, 'bookmark_nrt.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(3, 'Bookmark One Piece (1 cái)', 7, '', '', 20, 15000, 12000, 'bookmark_op.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(4, 'Lịch để bàn Doraemon (2020)', 7, '', '', 4, 40000, 0, 'lich_drm.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(5, 'Lịch để bàn Miku (2020)', 7, '', '', 2, 45000, 0, 'lich_mk.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(6, 'Lịch để bàn Umaru (2020)', 7, '', '', 5, 45000, 40000, 'lich_umr.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(7, 'Bộ sticker Doraemon kỉ niệm 50 năm ra mắt', 7, '', '', 13, 230000, 210000, 'sticker_drm.jpg', 1, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(8, 'Bộ sticker Conan', 7, '', '', 8, 20000, 0, 'sticker_conan.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(9, 'Bộ sticker Kimetsu no Yaiba', 7, '', '', 3, 20000, 0, 'sticker_kny.jpg', 0, '2020-06-16 10:00:16', '2020-06-20 08:00:16'),
(10, 'Full combo Sherlock Holmes (3 cuốn)', 6, 'Sir Arthur Conan Doyle', 'Từ khi xuất hiện lần đầu tiên vào năm 1887, thám tử Sherlock Holmes đã trở thành một trong những nhân vật hư cấu được yêu thích nhất. Là bậc thầy về khoa học suy luận, có thể làm sáng tỏ ngay cả những vụ án khó và phức tạp nhất bằng cách phát hiện ra những manh mối mà với người khác là quá mơ hồ và không thể nhận biết, thám tử Sherlock Holmes là nhân vật chính trong bộ tác phẩm gồm sáu mươi câu chuyện được viết bởi Sir Arthur Conan Doyle từ năm 1887 đến năm 1927. Với sự giúp đỡ của người bạn tận tụy và trung thành là bác sĩ Watson, thám tử Sherlock Holmes đã khiến vô số những kẻ lừa đảo, kẻ cướp và kẻ sát nhân bị đưa ra truy tố trước pháp luật. Nhiều câu chuyện về Sherlock Holmes đã được xếp vào hàng những tác phẩm trinh thám hư cấu hay nhất mọi thời đại, trong số đó có “Chiếc nhẫn tình cờ”, “Vụ bê bối ở Bohemia”, “Dải băng lốm đốm” và “Con chó săn của dòng họ Baskerville”.', 10, 410000, 0, 'combo_sh.jpg', 0, '2020-06-16 11:02:36', NULL),
(11, 'Combo Maze Runner (4 cuốn)', 6, 'James Dashner', 'Bản combo bao gồm các cuốn: The Maze Runner, The Scorch Trials, The Death Cure and The Kill Order.', 5, 959000, 599000, 'combo_mr.jpg', 0, '2020-06-16 11:02:36', NULL),
(12, 'Full combo Harry Potter (7 cuốn)', 6, 'J. K. Rowling', 'Harry Potter Combo (Full Set of 7) includes: Harry Potter And The Philosopher`s Stone, Harry Potter And The Chamber Of Secrets, Harry Potter And The Prisoner Of Azkaban, Harry Potter And The Goblet Of Fire, Harry Potter And The Order of the Phoenix , Harry Potter And The Half-Blood Prince, Harry Potter And The Deathly Hallows.', 10, 1550000, 0, 'combo_hp.jpg', 0, '2020-06-16 11:02:36', NULL),
(13, 'Full combo Yu-Gi-Oh! (1-38)', 6, 'Takahashi Kazuki', 'Yu-Gi-Oh! là câu chuyện về cậu bé Yugi – một học sinh trung học lớp 10 hay bị bạn bè bắt nạt – thường dành gần như toàn bộ thời gian của mình để chơi game một mình. Mọi chuyện bắt đầu thay đổi khi cậu giải được Trò Chơi Ngàn Năm, một linh vật bí ẩn của Ai Cập cổ đại.', 2, 850000, 800000, 'combo_ygo.jpg', 0, '2020-06-16 11:02:36', NULL),
(14, 'Full combo Fate/Stay Night (1-20)', 6, 'Dat Nishiwaki, Type-Moon', 'Ba năm sau cái chết của cha nuôi, nhiều sự kiện lạ lùng bắt đầu xảy ra trong thành phố nơi nhân vật chính là Emiya đang sinh sống. Bỗng nhiên, Emiya nhận ra bản thân đã bị cuốn vào một cuộc chiến giữa những pháp sư được gọi là “Master” cùng các hộ vệ “Servant” vốn là những anh linh từ thuở khai thiên lập địa.', 13, 800000, 720000, 'combo_fsn.jpg', 0, '2020-06-16 11:02:36', NULL),
(15, 'Combo Tiệm đồ cổ Á Xá (1-6)', 6, 'Lời: Huyền Sắc, Tranh: Hiểu Bạc', 'Cổ vật trong Á Xá, mỗi một vật đều có câu chuyện của riêng mình, cất giữ rất nhiều năm, chẳng ai lắng nghe. Bởi vì, chúng đều không biết nói…', 4, 474000, 450000, 'combo_ax16.jpg', 0, '2020-06-16 11:02:36', NULL),
(16, 'Combo Date A Live (5-7)', 6, 'Tachibana Koushi', 'Combo Date A Live từ tập 5 đến tập 7 gồm hành trình hẹn hò với Kaguya và Yuzuru (tinh linh Yamai) ở tập 5, cưa đổ cô gái Tinh linh Miku ở tập 6 và giải cứu Touka với sự giúp đỡ của các Tinh linh ở tập 7', 15, 300000, 240000, 'combo_dal57.jpg', 1, '2020-06-16 11:02:36', NULL),
(17, 'Boxset Diệt Slime Suốt 300 Năm, Tôi Levelmax Lúc Nào Chẳng Hay (1-3)', 6, 'Morita Kisetsu', 'Ấn phẩm Boxset Diệt slime suốt 300 năm được phát hành thay cho lời cảm ơn của tác giả Morita Kisetsu cùng đơn vị phát hành Tsuki LightNovel tới tất cả các bạn độc giả đã dành tình cảm đặc biệt cho bộ truyện trong thời gian qua.', 3, 490000, 0, 'combo_slime300123.jpg', 0, '2020-06-16 11:02:36', NULL),
(18, 'Boxset Your Name (3 cuốn)', 6, 'Shinkai Makoto, Kotone Ranmaru', 'Boxset Your Name là combo bao gồm 3 cuốn manga Your name', 7, 105000, 0, 'combo_yn.jpg', 1, '2020-06-16 11:02:36', NULL),
(19, 'Alice Ở Xứ Sở Diệu Kỳ Và Thế Giới Trong Gương', 5, 'Lewis Carroll', 'Phiên bản có minh họa màu+nhiều minh họa đen trắng', 28, 150000, 0, 'vanhoc_aoxsdk.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(20, 'Phù Thủy Xứ Oz & Trên Những Nẻo Đường Xứ Oz', 5, 'L Frank Baum, Kriss Sison', 'Phiên bản có minh họa màu+nhiều minh họa đen trắng', 13, 150000, 0, 'vanhoc_ptxoz.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(21, 'Tôi Đã Tình Cờ Viết Một Cuốn Sách Như Thế Nào', 5, 'Annet Huizing', 'TÔI ĐÃ TÌNH CỜ VIẾT MỘT CUỐN SÁCH NHƯ THẾ NÀO đoạt Giải thưởng Sách Hay Hà Lan ANNET HUIZING năm 2015.', 8, 55000, 0, 'vanhoc_tdtcvmcsntn.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(22, 'Truyện cổ Andersen', 5, 'Val Biro', 'Cuốn sách này gồm những truyện thuộc hàng hay nhất của Hans Christian Andersen được Val Biro kể lại và minh họa: Bầy chim thiên nga, Chàng Giăng Bị Thịt, Chiếc rương biết bay, Vịt con xấu xí, Chú lính chì dũng cảm, Chim họa mi, Cô bé Tí Hon.', 6, 125000, 0, 'vanhoc_tca.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(23, 'Có Một Mùa Hè', 5, 'Đặng Ái', 'Cổn giồ, cậu học sinh nghịch ngợm, quấy phá tới mức được “mời” lên phòng giám hiệu không biết bao nhiêu lần. Lần đầu “long trọng”, tới bảy tám thầy cô và thầy hiệu trưởng tiếp đón, sau cứ kém dần, có bữa chỉ còn bác lao công. Thế mà, sau một mùa hè, cậu có cuộc bứt phá ngoạn mục. Chuyện dài và hấp dẫn, các bạn nghe kể từ từ nhé.', 16, 80000, 0, 'vanhoc_cmmh.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(24, 'Sau Những Ngày Mưa', 5, 'Phạm Thu Hà', 'Câu chuyện nhẹ nhàng da diết và đầy tính nhân văn, trải ra theo giọng kể của một cô gái đi theo đoàn diễn hội chợ. Từ đó, những ký ức được hồi tưởng, gắn kết với quá khứ, hiện tại. Truyện có những trang tả cảnh tả tình ở vùng rừng núi Tây Bắc tuyệt đẹp và trong trẻo. Mạch truyện chầm chậm nhưng cuốn hút, để lại nhiều dư âm ngọt ngào cho độc giả.', 19, 55000, 0, 'vanhoc_snnm.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(25, 'Cửa Sổ Phía Đông', 5, 'Nguyễn Thị Kim Hòa', 'Câu chuyện về hành trình tìm lại ký ức sau khi bị xóa bỏ của một cô gái, từ đó mở ra biết bao bi kịch của những số phận xung quanh cô ấy. Tất cả đều mang nỗi đau chiến tranh theo nhiều cách khác nhau. Một tác phẩm về đề tài hậu chiến được viết đầy rung cảm và mới mẻ thông qua một số yếu tố giả tưởng xen lẫn chất ly kỳ hấp dẫn.', 14, 60000, 0, 'vanhoc_cspd.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(26, 'Những Câu Chuyện Trong Thành Phố', 5, 'Vũ Tùng Lâm', 'Những câu chuyện trong thành phố, đó là bất cứ thành phố nào, vào bất cứ thời gian nào, với các câu chuyện có thể xảy ra với bất kỳ người nào: cậu học sinh ao ước được ra sân chính thức với quả bóng da, cô gái vô danh bị người yêu cợt nhả, gã trung niên mua tình của người yêu cũ, người phụ nữ ám ảnh chồng mình ngoại tình, hai con người muốn kết thúc cuộc sống gặp nhau…', 11, 62000, 50000, 'vanhoc_nccttp.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(27, 'Những Câu Chuyện Sưởi Ấm Tâm Hồn: Ngôi Nhà Trong Cỏ', 5, 'Lý Lan', 'Tác phẩm Ngôi nhà trong cỏ đoạt giải A Cuộc thi sáng tác cho Nhi đồng (1982-1984) do Nhà xuất bản Kim Đồng và Hội Nhà văn tổ chức.', 10, 86000, 0, 'vanhoc_nntc.jpg', 0, '2020-06-16 20:20:00', '2020-06-17 16:15:00'),
(28, 'Cô Gái Đến Từ Hôm Qua', 4, 'Nguyễn Nhật Ánh', 'Cô gái đến từ hôm qua được ví như một cuốn phim của quá khứ và hiện tại được ngòi bút tài hoa của tác giả dẫn dắt ta đi từ bất ngờ này đến thú vị khác. Nếu ngày xưa còn bé, Thư luôn tự hào mình là cậu con trai thông minh có quyền bắt nạt và sai khiến các cô bé cùng lứa tuổi (nạn nhân cụ thể là bé Tiểu Li) thì giờ đây lớn lên, anh luôn khổ sở khi thấy mình ngu ngơ và bị một cô bạn tên là Việt Án “xỏ mũi”. Và điều nghịch lý ấy xem ra ngày càng “trớ trêu” hơn…', 23, 80000, 0, 'story_cgdthq.jpg', 0, '2020-06-16 21:05:00', '2020-06-18 15:30:00'),
(29, 'Lão Hạc', 4, 'Nam Cao', 'Lão Hạc là một truyện ngắn của nhà văn Nam Cao được viết năm 1943. Tác phẩm được đánh giá là một trong những truyện ngắn khá tiêu biểu của dòng văn học hiện thực, nội dung truyện đã phần nào phản ánh được hiện trạng xã hội Việt Nam trong giai đoạn trước Cách mạng tháng Tám.', 6, 45000, 0, 'story_lh.jpg', 0, '2020-06-16 21:05:00', '2020-06-18 15:30:00'),
(30, 'Chí Phèo', 4, 'Nam Cao', 'Chí Phèo – Với những tình tiết hấp hẫn Nam Cao đã đưa người đọc tái hiện bức tranh chân thực nông thôn Việt Nam trước 1945, nghèo đói, xơ xác trên con đường phá sản, bần cùng, hết sức thê thảm, người nông dân bị đẩy vào con đường tha hóa, lưu manh hóa.', 8, 75000, 0, 'story_cp.jpg', 0, '2020-06-16 21:05:00', '2020-06-18 15:30:00'),
(31, 'Số Đỏ', 4, 'Vũ Trọng Phụng', 'Số đỏ là một tiểu thuyết văn học của nhà văn Vũ Trọng Phụng, đăng ở Hà Nội báo từ số 40 ngày 7 tháng 10 1936 và được in thành sách lần đầu vào năm 1938. Nhiều nhân vật và câu nói trong tác phẩm đã đi vào cuộc sống đời thường và tác phẩm đã được dựng thành kịch, phim. Nhân vật chính của Số đỏ là Xuân - biệt danh là Xuân Tóc đỏ, từ chỗ là một kẻ bị coi là hạ lưu, bỗng nhảy lên tầng lớp danh giá của xã hội nhờ trào lưu Âu hóa của giới tiểu tư sản Hà Nội khi đó.', 27, 55000, 0, 'story_sd.jpg', 0, '2020-06-16 21:05:00', '2020-06-18 15:30:00'),
(32, 'Tắt Đèn', 4, 'Ngô Tất Tố', 'Tắt đèn là một cuốn xã hội tiểu thuyết tả cảnh đau khổ của dân quê, của một người đàn bà nhà quê An Nam suốt đời sống trong sự nghèo đói và sự ức hiếp của bọn cường hào và người có thế lực mà lúc nào cũng vẫn hết lòng vì chồng, vì con.', 6, 40000, 0, 'story_td.jpg', 0, '2020-06-16 21:05:00', '2020-06-18 15:30:00'),
(33, 'Hai Đứa Trẻ', 4, 'Thạch Lam', 'Hai chị em Liên ở đây rõ ràng không còn là hai đứa trẻ. Chúng là những trái cây non bị nắng gió cuộc đời bắt phải chín ép. Chúng ló những mầm non bị thui chột bởi thiếu ánh dương, bởi cuộc đời chúng đã mất hết chất phù sa, màu mỡ. Thật tội nghiệp khi hạnh phúc lớn nhất của chúng chỉ là chờ đợi chuyến tàu đêm…', 3, 50000, 0, 'story_hdt.jpg', 0, '2020-06-16 21:05:00', '2020-06-18 15:30:00'),
(34, 'Goblin Slayer, Vol. 1', 3, 'Kumo Kagyu', 'Goblin Slayer is a Japanese dark fantasy light novel series written by Kumo Kagyu and illustrated by Noboru Kannatsuki.', 8, 500000, 0, 'fb_gs.jpg', 1, '2020-06-18 12:15:34', NULL),
(35, 'Konosuba: God`s Blessing on This Wonderful World!, Vol. 1', 3, 'Akatsuki Natsume', 'Kono subarashii sekai ni shukufuku o! or KonoSuba for short, is a Light Novel series written by author Akatsuki Natsume and illustrated by Mishima Kurone.', 6, 520000, 500000, 'fb_knsb.jpg', 1, '2020-06-18 12:15:34', NULL),
(36, 'The Rising of the Shield Hero Vol. 1', 3, 'Aneko Yusagi', 'Tate no Yūsha no Nariagari is a Japanese light novel series by Aneko Yusagi. Originally published as an online novel in a user-created novel page called Shōsetsuka ni Narō, the series was published by Media Factory with an expanded storyline featuring Seira.', 10, 570000, 490000, 'fb_trotsh.jpg', 0, '2020-06-18 12:15:34', NULL),
(37, 'Tensei Shitara Slime Datta Ken Vol. 1', 3, 'Fuse', 'The story begins with Satoru Mikami, a 37-year-old employee who lives a boring and unhappy life. In a meeting of robbers, he lost his life. I thought that boring life was over ... But no! It is the beginning of a new life. Mikami wakes up, finds herself in a strange world. And the monstrous thing is that he no longer has a human form but has become a slime monster with no eyes. As he got used to this new form, he began to explore the world with other monsters and the work of changing a new world began.', 10, 550000, 0, 'fb_tssdk1.jpg', 1, '2020-06-18 12:15:34', NULL),
(38, 'Tensei Shitara Slime Datta Ken Vol. 2', 3, 'Fuse', 'The story begins with Satoru Mikami, a 37-year-old employee who lives a boring and unhappy life. In a meeting of robbers, he lost his life. I thought that boring life was over ... But no! It is the beginning of a new life. Mikami wakes up, finds herself in a strange world. And the monstrous thing is that he no longer has a human form but has become a slime monster with no eyes. As he got used to this new form, he began to explore the world with other monsters and the work of changing a new world began.', 13, 550000, 0, 'fb_tssdk2.jpg', 1, '2020-06-18 12:15:34', NULL),
(39, 'Overlord, Vol. 1: The Undead King', 3, 'Maruyama Kugane', 'For twelve years, the virtual world of Yggdrasil has served as the playground and battlefield for the skeletal lord Momonga and his guild of fellow monsters, Ainz Ooal Gown. But the guild`s glory days are over, and the game is shutting down permanently. When Momonga logs in one last time just to be there when the servers go dark, something happens-and suddenly, fantasy is reality. A rogues` gallery of fanatically devoted NPCs is ready to obey his every order, but the world Momonga now inhabits is not the one he remembers. The game may be over, but the epic tale of Ainz Ooal Gown is only', 4, 470000, 350000, 'fb_ovl.jpg', 0, '2020-06-18 12:15:34', NULL),
(40, 'No Game No Life Vol. 1', 3, 'Yū Kamiya', 'The two brothers Sora & Shiro create the legend of gamers with the championship achievement in all game rankings under the name of &nbsp; &nbsp; &nbsp; or Blank. Stepping out of the virtual world, they are genuine NEETs, without jobs, without education, in isolation and afraid of outside contact, always thinking that they gave birth to the wrong world. One day, a strange person who claimed to be a god asked a strange question "2 people who want to enter a world that is only decided by games ?? if it really exists ??" and gave 2 brothers be taken to a different world - where everything is decided by games, from tools, currencies, countries and even lives. When coming here, the only goal of the two cousins ​​is just: to defeat the 16 ethnic groups - to gain race flags (which are the core of a nation here) to challenge Tet.', 8, 550000, 0, 'fb_ngnl.jpg', 0, '2020-06-18 12:15:34', NULL),
(41, 'Dr. Stone Vol. 1', 3, 'Riichiro Inagaki', 'Dr. Stone is a Japanese manga series written by Riichiro Inagaki and illustrated by Boichi, posted on Weekly Shonen Jump from March 6, 2017 with individual chapters collected and published by Shueisha in ten tankōbon volumes from of April 2019.', 2, 350000, 330000, 'fb_drs.jpg', 0, '2020-06-18 12:15:34', NULL),
(42, 'MIỀN ĐẤT HỨA -The Promised Neverland- 1', 2, 'Kaiu Shirai - Posuka Demizu', 'Emma, Norman và Ray đang tận hưởng cuộc sống hạnh phúc tại một cô nhi viện nhỏ bé, cùng người mẹ nuôi rất đỗi thân yêu và các anh chị em không cùng chung dòng máu. Thế nhưng, một ngày nọ, cuộc sống êm đềm của cả ba bỗng chốc kết thúc. Vận mệnh nào đang chờ đón ba đứa trẻ khi sự thật phơi bày…!?', 6, 40000, 35000, 'manga_mdh1.jpg', 1, '2020-06-18 13:20:28', NULL),
(43, 'MIỀN ĐẤT HỨA -The Promised Neverland- 2', 2, 'Kaiu Shirai - Posuka Demizu', 'Emma, Norman và Ray đang tận hưởng cuộc sống hạnh phúc tại một cô nhi viện nhỏ bé, cùng người mẹ nuôi rất đỗi thân yêu và các anh chị em không cùng chung dòng máu. Thế nhưng, một ngày nọ, cuộc sống êm đềm của cả ba bỗng chốc kết thúc. Vận mệnh nào đang chờ đón ba đứa trẻ khi sự thật phơi bày…!?', 11, 40000, 0, 'manga_mdh2.jpg', 1, '2020-06-18 13:20:28', NULL),
(44, 'MIỀN ĐẤT HỨA -The Promised Neverland- 3', 2, 'Kaiu Shirai - Posuka Demizu', 'Emma, Norman và Ray đang tận hưởng cuộc sống hạnh phúc tại một cô nhi viện nhỏ bé, cùng người mẹ nuôi rất đỗi thân yêu và các anh chị em không cùng chung dòng máu. Thế nhưng, một ngày nọ, cuộc sống êm đềm của cả ba bỗng chốc kết thúc. Vận mệnh nào đang chờ đón ba đứa trẻ khi sự thật phơi bày…!?', 19, 40000, 0, 'manga_mdh3.jpg', 1, '2020-06-18 13:20:28', NULL),
(45, 'Thám tử lừng danh Conan 93', 2, 'Gosho Aoyama', '', 13, 20000, 0, 'manga_conan93.jpg', 0, '2020-06-18 13:20:28', '2020-06-20 08:39:28'),
(46, 'Thám tử lừng danh Conan 94', 2, 'Gosho Aoyama', '', 19, 20000, 0, 'manga_conan94.jpg', 0, '2020-06-18 13:20:28', '2020-06-20 08:39:28'),
(47, 'Thám tử lừng danh Conan 95', 2, 'Gosho Aoyama', '', 24, 20000, 0, 'manga_conan95.jpg', 0, '2020-06-18 13:20:28', '2020-06-20 08:39:28'),
(48, 'Pokemon Special 50', 2, 'Hidenori Kusaka, Satoshi Yamamoto', 'Black đã tới được giải liên đoàn Pokeùmon cậu mơ ước bấy lâu!', 15, 25000, 0, 'manga_pkm50.jpg', 1, '2020-06-18 13:20:28', NULL),
(49, 'Pokemon Special 51', 2, 'Hidenori Kusaka, Satoshi Yamamoto', 'Đá ánh sáng đã trở lại nguyên hình là Bạch Long Reshiram trước sự chứng kiến của Hắc Long Zekrom!! "Không thể cùng tồn tại với kẻ thù" là suy nghĩ chung của 2 Pokémon này. Một trận đấu giữa lửa và sấm sét đã nổ ra, đồng thời là trận đấu giữa Black và N!!!', 15, 25000, 0, 'manga_pkm51.jpg', 1, '2020-06-18 13:20:28', NULL),
(50, 'Pokemon Special 52', 2, 'Hidenori Kusaka, Satoshi Yamamoto', 'Cuộc điều tra thanh thiếu niên Rakutsu trực thuộc cảnh sát xuất hiện!!!', 15, 25000, 0, 'manga_pkm52.jpg', 1, '2020-06-18 13:20:28', NULL),
(51, 'Pokemon Special 53', 2, 'Hidenori Kusaka, Satoshi Yamamoto', 'Lack-Two liên tục đuổi bắt hết người này đến người  khác trong các Thất Hiền Nhân. Tuy nhiên nhóm Plasma đã lao vào cuộc chiến với tốc độ còn nhanh hơn thế. Cuối cùng, tàu bay Plasma Frigate đã xuất hiện!!', 15, 25000, 0, 'manga_pkm53.jpg', 1, '2020-06-18 13:20:28', NULL),
(52, 'Relife 9', 2, 'YayoiSo', 'Kaizaki Arata, 27 tuổi, thất nghiệp, chán nản với cuộc đời. Tình cờ trong một lần say xỉn, anh trở thành đối tượng thí nghiệm của dự án mang tên ReLIFE, bị thu nhỏ về hình dạng của một học sinh cao trung 17 tuổi, từ đó bắt đầu hành trình học lại kỹ năng sống, làm lại cuộc đời.', 20, 750000, 60000, 'manga_rl9.jpg', 1, '2020-06-18 13:20:28', NULL),
(53, 'Relife 10', 2, 'YayoiSo', 'Kaizaki Arata, 27 tuổi, thất nghiệp, chán nản với cuộc đời. Tình cờ trong một lần say xỉn, anh trở thành đối tượng thí nghiệm của dự án mang tên ReLIFE, bị thu nhỏ về hình dạng của một học sinh cao trung 17 tuổi, từ đó bắt đầu hành trình học lại kỹ năng sống, làm lại cuộc đời.', 20, 750000, 60000, 'manga_rl10.jpg', 1, '2020-06-18 13:20:28', NULL),
(54, 'Sword art online - Tập 14', 1, 'Reki Kawahara', 'Tòa tháp trắng Central Cathedral tượng trưng cho Giáo hội Công lý.', 25, 125000, 0, 'ln_sao14.jpg', 1, '2020-06-18 13:20:28', NULL),
(55, 'Sword art online - Tập 15', 1, 'Reki Kawahara', '“Kirito, cho tớ biết, tớ phải làm sao mới được đây?” Cái giá phải trả của việc đánh bại tư tế tối cao Administrator, là cái chết của Eugeo, và trạng thái tinh thần suy sụp của Kirito.', 25, 125000, 0, 'ln_sao15.jpg', 1, '2020-06-18 13:20:28', NULL),
(56, 'Sword art online - Tập 16', 1, 'Reki Kawahara', 'Đằng sau khung cảnh chiến trận dữ dội ấy là một Kirito vẫn trầm cảm ngồi trên xe lăn, nhưng khát khao bảo vệ con người tỏa ra từ trái tim cậu đang tiếp sức và kêu gọi rất nhiều bạn bè người quen tìm đến, tiếp tục sứ mệnh cậu đang làm dở. Trong đó tất nhiên không thể thiếu Asuna, đăng nhập vào UW bằng siêu tài khoản nữ thần sáng thế…', 25, 125000, 0, 'ln_sao16.jpg', 1, '2020-06-18 13:20:28', NULL),
(57, 'Kẻ Dị Biệt Tại Trường Học Phép Thuật - Tập 1', 1, 'Sato Tsutomu', 'Kẻ dị biệt tại trường học phép thuật 1 lấy bối cảnh thế giới tương lai, khi mà phép thuật không còn là sản phẩm của trí tưởng tượng, truyền thuyết hay cổ tích nữa mà đã trở thành công nghệ có thật.', 15, 96000, 79000, 'ln_mhk1.jpg', 1, '2020-06-18 13:20:28', NULL),
(58, 'Kẻ Dị Biệt Tại Trường Học Phép Thuật - Tập 2', 1, 'Sato Tsutomu', 'Tổ chức chính trị quốc tế chống phép thuật “Blanche”. Nó hoạt động với mục đích loại bỏ tận gốc phân biệt đối xử dựa trên năng lực phép thuật trong xã hội, và phản đối hệ thống hành chính hiện đại hiện đang ưu tiên về mặt chính trị cho các pháp sư. Đó chính là lý tưởng của nhóm người này.', 15, 96000, 79000, 'ln_mhk2.jpg', 1, '2020-06-18 13:20:28', NULL),
(59, 'Kẻ Dị Biệt Tại Trường Học Phép Thuật - Tập 3', 1, 'Sato Tsutomu', 'Mặt đất rung chuyển ngay khi tiếng còi khai cuộc cất lên. “Địa Lôi Nguyên?” Chữ Nguyên ở đây không phải “Căn nguyên”, mà là “Suối nguồn”. Tatsuya lẩm bẩm biệt danh ấy theo phản xạ khi thấy cảnh tượng trước mắt.', 15, 120000, 96000, 'ln_mhk3.jpg', 1, '2020-06-18 13:20:28', NULL),
(60, 'Hiệp Sĩ Lưu Ban - Tập 6', 1, 'Misora Riku', 'Để đánh bại toàn bộ thành viên Akatsuki, Stella đã đề nghị chuyện trận đấu một chọi bốn đầy bất thường. Ngọn lửa của Công chúa tóc đỏ sau khi thiêu rụi tất cả những kẻ tàn bạo và hủy hoại học viện Hagun đã bùng cháy dữ dội.', 20, 98000, 74000, 'ln_hslb6.jpg', 1, '2020-06-18 13:20:28', NULL),
(61, 'Hiệp Sĩ Lưu Ban - Tập 7', 1, 'Misora Riku', 'Vì lịch trình thi đấu thay đổi nên Ikki phải thi đấu hai trận liên tiếp và giành chiến thắng trong trận chiến đầu tiên nhờ Nhất Đao Tu La. Tuy nhiên cậu không thể sử dụng át chủ bài này trong trận đấu kế tiếp.', 20, 98000, 74000, 'ln_hslb7.jpg', 1, '2020-06-18 13:20:28', NULL),
(62, 'Hiệp Sĩ Lưu Ban - Tập 8', 1, 'Misora Riku', 'Shizuku bị đóng đinh bằng vô số thanh kiếm và Amane cười khinh miệt khi đứng trước mặt cô. Trận tứ kết quyết định đối thủ đấu tay đôi của Ikki đã khép lại với bi kịch diễn ra trước trận đấu.', 20, 98000, 74000, 'ln_hslb8.jpg', 1, '2020-06-18 13:20:28', NULL);

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
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Light novel', 'Light novel hay tiểu thuyết ngắn, là một dòng tiểu thuyết có nguồn gốc Nhật Bản', 'ln_sao16.jpg', '2020-06-15 06:15:15', NULL),
(2, 'Manga', 'Manga là một cụm từ trong tiếng Nhật để chỉ các loại truyện tranh của Nhật Bản.', 'manga_rl9.jpg', '2020-06-15 06:18:35', NULL),
(3, 'Foreign books', '', 'fb_ovl.jpg', '2020-06-15 06:20:11', NULL),
(4, 'Story', '', 'story_sd.jpg', '2020-06-15 06:25:23', NULL),
(5, 'Literature book', '', 'vanhoc_ptxoz.jpg', '2020-06-15 06:26:15', NULL),
(6, 'Full combo', '', 'combo_fsn.jpg', '2020-06-15 06:27:36', NULL),
(7, 'Items - gifts', '', 'sticker_kny.jpg', '2020-06-15 06:30:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(4) DEFAULT '0',
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

INSERT INTO `users` (`id`, `full_name`, `email`, `level`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Imirai Okimura', 'imirai@gmail.com', 2, '$2y$12$wPWIToG4PWD/6gYcIEiJYORKOipQzRe0S26GCCl3JekHiUbZjxaO.', '0123456789', 'Hồ Chí Minh', NULL, '2020-06-15 07:17:33', '2020-06-16 07:17:45'),
(2, 'Guilty Genex', 'genex@gmail.com', 1, '$2y$12$Ax7zTgkIkFCrFcVeZ.Kj4OVEUfaPeCC3rlVCFvFfxTf3/LVmRoXVe', '0123456789', 'Hồ Chí Minh', NULL, '2020-06-15 07:17:33', '2020-06-16 07:17:45'),
(3, 'Test User', 'testuser@gmail.com', 0, '$2y$12$TtVMIYBAXwMZyiEyM9i6GObwZJeNZNI9CR9a.WkwdLTJ2ekfaZBEO', '0123456789', 'Hồ Chí Minh', NULL, '2020-06-15 07:17:33', '2020-06-16 07:17:45');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
