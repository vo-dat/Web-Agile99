-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2020 lúc 04:37 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `storedb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `Position` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Position`) VALUES
(1, 'Trà', 1),
(2, 'Bánh Mì', 0),
(3, 'Cà Phê', 3),
(5, 'Khác', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `groups`
--

INSERT INTO `groups` (`GroupID`, `GroupName`) VALUES
(1, 'Admin'),
(3, 'Khách hàng'),
(4, 'Test'),
(6, 'test'),
(10, 'YN'),
(13, 'YN1'),
(14, 'TESTT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturers`
--

CREATE TABLE `manufacturers` (
  `ManufacturerID` int(11) NOT NULL,
  `ManufacturerName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `manufacturers`
--

INSERT INTO `manufacturers` (`ManufacturerID`, `ManufacturerName`) VALUES
(1, 'Nhóm 99'),
(2, 'ABO');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderitems`
--

INSERT INTO `orderitems` (`OrderID`, `ProductID`, `Quantity`) VALUES
(31, 30, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddedDate` datetime NOT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Sum` int(11) DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddedDate`, `Address`, `Phone`, `Sum`, `Status`) VALUES
(31, 26, '2020-10-23 21:26:40', 'HCM', '12345', 38000, b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `ImageUrl` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL DEFAULT 0,
  `Quantity` int(11) NOT NULL DEFAULT 0,
  `Description` varchar(1000) NOT NULL,
  `Body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ProductID`, `ManufacturerID`, `CategoryID`, `ProductName`, `ImageUrl`, `Price`, `Quantity`, `Description`, `Body`) VALUES
(21, 1, 1, 'Trà Sen Vàng', '452134802270_crop_TRASENVANG.png', 319, 10, 'Trà', 'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.'),
(22, 1, 1, 'Trà Thanh Đào', '151987484270_crop_TRATHANHDAO.png', 31000, 10, 'Trà', ''),
(23, 1, 1, 'Trà Thạch Vải', '683616356270_crop_TRATHACHVAI_1.png', 39000, 10, 'Trà', 'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.'),
(24, 1, 1, 'Trà Thạch Đào', '847970534270_crop_TRATHACHDAO.png', 39000, 10, 'Trà', 'Hương vị tự nhiên, thơm ngon của Trà Việt với phong cách hiện đại tại Highlands Coffee sẽ giúp bạn gợi mở vị giác của bản thân và tận hưởng một cảm giác thật khoan khoái, tươi mới.'),
(25, 1, 2, 'Bánh Mì Xá Xíu', '1446201144270_crop_BMCHALUAXAXIU.png', 26000, 10, 'Bánh Mì', ''),
(26, 1, 2, ' Bánh Mì Xíu Mại', '1744980395270_crop_BMXIUMAI.png', 20000, 10, 'Bánh Mì', 'Bạn đã quá quen thuộc với Bánh mì Việt Nam. Hãy nếm thử một miếng Bánh mì ngon, giòn, nóng hổi tại Highlands Coffee. Một kết hợp hoàn hảo giữa lớp nhân chua, cay, mặn, ngọt quyện với lớp vỏ bánh mì giòn tan, mịn màng tạo ra tầng tầng lớp lớp dư vị cho thực khách. '),
(27, 1, 2, 'Bánh Mì Thịt Nướng', '326659118270_crop_BMTHITNUONG.png', 32000, 10, 'Bánh Mì', 'Bạn đã quá quen thuộc với Bánh mì Việt Nam. Hãy nếm thử một miếng Bánh mì ngon, giòn, nóng hổi tại Highlands Coffee. Một kết hợp hoàn hảo giữa lớp nhân chua, cay, mặn, ngọt quyện với lớp vỏ bánh mì giòn tan, mịn màng tạo ra tầng tầng lớp lớp dư vị cho thực khách. '),
(30, 1, 5, 'Bánh Chuối', '1205025424270_crop_BANHCHUOI.jpg', 19000, 10, 'Bánh Ngọt', 'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee. Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.'),
(32, 1, 5, 'Bánh Đào', '574447618270_crop_MOUSSEDAO.png', 17000, 10, 'Bánh Ngọt', 'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee. Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.'),
(33, 1, 5, 'Bánh CaCao', '933900418270_crop_MOUSSECACAO.png', 15000, 10, 'Bánh Ngọt', 'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee. Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.'),
(34, 1, 5, 'Bánh PhôMai', '894396016270_crop_PHOMAICAPHE.jpg', 18000, 10, 'Bánh Ngọt', 'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee. Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.'),
(35, 1, 5, 'Bánh ChoCoLate', '1635425670270_crop_SOCOLAHL.png', 22000, 10, 'Bánh Ngọt', 'Còn gì tuyệt vời hơn khi kết hợp thưởng thức đồ uống của bạn cùng với những chiếc bánh ngọt ngon tinh tế được làm thủ công ngay tại bếp bánh của Highlands Coffee. Những chiếc bánh của chúng tôi mang hương vị đặc trưng của ẩm thực Việt và còn là sự Tận Tâm, gửi gắm mà chúng tôi dành cho Quý khách hàng.'),
(36, 1, 3, 'Phin Sữa Đá', '2009975044270_crop_PHIN-SUA-DA.png', 30000, 10, 'Phin Cà Phê', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là \'Phin\', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa...'),
(37, 1, 3, 'PhinDi ChoCo', '1269627013270_crop_PHINDI_Choco-min.png', 45000, 10, 'Cà Phê Fin.', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là \'Phin\', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa...'),
(38, 1, 3, 'PhinDi Hạnh Nhân', '648277329270_crop_PHINDI_Hanh_Nhan-min.png', 45000, 10, 'Phin Cà Phê', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là \'Phin\', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa...'),
(39, 1, 3, 'PhinDi Kem Sữa', '903613552270_crop_PHINDI_Kem_Sua-min.png', 50000, 10, 'Phin Cà Phê', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là \'Phin\', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa...'),
(40, 1, 3, 'Phin Đen Đá', '1952766379270_crop_CFD.png', 30000, 10, 'Phin Cà Phê', 'Việt Nam tự hào sở hữu một di sản văn hóa cà phê giàu có, và \'Phin\' chính là linh hồn, là nét văn hóa thưởng thức cà phê đã ăn sâu vào tiềm thức biết bao người Việt. Cà phê rang xay được chiết xuất chậm rãi từng giọt một thông qua dụng cụ lọc bằng kim loại có tên là \'Phin\', cũng giống như thể hiện sự sâu sắc trong từng suy nghĩ và chân thành trong những mối quan hệ hiện hữu. Bạn có thể tùy thích lựa chọn uống nóng hoặc dùng chung với đá, có hoặc không có sữa...');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `PassWord` varchar(32) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `GroupID`, `FullName`, `UserName`, `PassWord`, `Email`) VALUES
(1, 1, 'admin', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'ynhup1999@gmail.com'),
(23, 3, 'Như', 'Như', 'c4ca4238a0b923820dcc509a6f75849b', 'meocon@gmail.com'),
(26, 3, 'dat', 'dat', '81dc9bdb52d04dc20036dbd8313ed055', 'ntykaka1234@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Chỉ mục cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`ManufacturerID`);

--
-- Chỉ mục cho bảng `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `ManufacturerID` (`ManufacturerID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `GroupID` (`GroupID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ManufacturerID`) REFERENCES `manufacturers` (`ManufacturerID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`GroupID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
