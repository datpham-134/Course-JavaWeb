CREATE DATABASE [baloshop]

USE [baloshop]

CREATE TABLE [category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](200) NULL,
	[status] [int] NULL,
	primary key (id)
)


CREATE TABLE [image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[image_name] [nvarchar](200) NULL,
	[status] [int] NULL,
	primary key (id)
)


CREATE TABLE [product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](2000) NULL,
	[image] [nvarchar](100) NULL,
	[create_date] [date] default getdate(),
	[status] [int] NULL,
	primary key (id)
)


CREATE TABLE [status_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[status] [nvarchar](100) NULL,
	primary key (id)
)


CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shiping_info_id] [int] NULL,
	[create_date] [date] NULL,
	[total_price] [decimal](18, 0) NULL,
	[note] [nvarchar](1000) NULL,
	[status] [int] NULL,
	primary key (id)
)


CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](200) NULL,
	[product_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	primary key (id)
)


CREATE TABLE [dbo].[shiping_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[mobile] [nvarchar](15) NULL,
	[address] [nvarchar](2000) NULL,
	primary key (id)
)


CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[status] [int] NULL,
	primary key (id)
)


CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_detail_id] [int] NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[role_id] [int] NULL,
	[create_date] [date] NULL,
	[active_code] [nvarchar](100) NULL,
	[status] [int] NULL,
	primary key (id)
)

CREATE TABLE [dbo].[account_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[mobile] [nvarchar](50) NULL,
	[gender] [int] NULL,
	[address] [nvarchar](1500) NULL,
	primary key (id)
)


INSERT [dbo].[role] ([id], [name], [status]) VALUES (1, N'admin', 1)
INSERT [dbo].[role] ([id], [name], [status]) VALUES (2, N'staff', 1)
INSERT [dbo].[role] ([id], [name], [status]) VALUES (3, N'member', 1)
SET IDENTITY_INSERT [dbo].[role] OFF


INSERT INTO category (category, status) VALUES (N'Balo', 1);
INSERT INTO category (category, status) VALUES (N'Túi tote', 1);
INSERT INTO category (category, status) VALUES (N'Túi bao tử', 1);
INSERT INTO category (category, status) VALUES (N'Túi đeo vai', 1);
INSERT INTO category (category, status) VALUES (N'Túi văn phòng', 1);


INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (1, 'BL-001', N'SOLDIER - WAXED/AIRY/BLUE', 10, 2000000, N'Balo vải bố dày có quai và đáy làm bằng da bò tự nhiên.<br>Một ngăn dây kéo lớn mặt trước.<br>Một ngăn dây kéo hông phải, 1 túi đắp hông trái.<br>Một ngăn dây kéo bên trong và 2 túi nhỏ.<br>Khoá bấm kim loại chất lượng cao.<br>Dây kéo YKK, đầu kéo bằng da bò.<br>Vải bố dày, không xù lông.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'soldier-waxed-airy-1_master.jpg', 1);
INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (1, 'BL-002', N'SOLDIER - NAVY/BLACK', 10, 2200000, N'Balo vải bố dày có quai và đáy làm bằng da bò tự nhiên.<br>Một ngăn dây kéo lớn mặt trước.<br>Một ngăn dây kéo hông phải, 1 túi đắp hông trái.<br>Một ngăn dây kéo bên trong và 2 túi nhỏ.<br>Khoá bấm kim loại chất lượng cao.<br>Dây kéo YKK, đầu kéo bằng da bò.<br>Vải bố dày, không xù lông.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'soldier-navy-black-1_master.jpg', 1);
INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (1, 'BL-003', N'1975 S - NAVY/BEIGE', 10, 2200000, N'Balo vải bố dày có quai làm bằng da bò tự nhiên.<br>Miệng túi dây rút, có một ngăn lớn mặt trước.<br>Một ngăn dây kéo hông phải, 1 túi đắp hông trái.<br>Ngăn chính có 1 ngăn chống sốc cho laptop.<<br>Khoá bấm kim loại chất lượng cao.<br>Vải bố dày, không xù lông.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'1975s-navy-beige-1_master.jpg', 2);
INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (1, 'BL-004', N'MARS - RED/BEIGE', 10, 1825000, N'Balo vải bố dày có quai bắt chéo làm bằng da bò tự nhiên.<br>Một ngăn lớn mặt trước.<br>Một ngăn dây kéo hông phải, một túi đắp hông trái.<<br>Ngăn chính có 1 ngăn chống sốc cho laptop.<br>Một ngăn dây kéo bên trong và 2 túi nhỏ.<br>Dây kéo YKK, đầu kéo bằng da bò.<br>Vải bố dày, không xù lông.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'mars-red-beige-2_master.jpg', 1);
INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (1, 'BL-004', N'MARS - YELLOW/BEIGE', 10, 1825000, N'Sử dụng vải H8200 do Hem Concept sản xuât.<br>Balo vải bố dày có quai bắt chéo làm bằng da bò tự nhiên.<br>Một ngăn lớn mặt trước.<br>Một ngăn dây kéo hông phải, một túi đắp hông trái.<<br>Ngăn chính có 1 ngăn chống sốc cho laptop.<br>Một ngăn dây kéo bên trong và 2 túi nhỏ.<br>Dây kéo YKK, đầu kéo bằng da bò.<br>Vải bố dày, không xù lông.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'mars-yellow-gray-1_master.png', 1);
INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (3, 'BL-005', N'KIRA - NAVY/GRAY', 10, 799000, N'Sử dụng chất liệu vải H8200 do Hem Concept sản xuất.<br>Một ngăn dây kéo mặt trước.<br>Ngăn chính có 1 ngăn dây kéo bên trong.<br>Dây đeo bằng cotton, khoá nhựa chất lượng cao.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'kira-navy-gray-1_master.jpg', 1);
INSERT INTO product (category_id, code, name, quantity, price, description, image, status) VALUES (3, 'BL-006', N'KIRA - PLUM/BLACK', 10, 799000, N'Sử dụng chất liệu vải H8200 do Hem Concept sản xuất.<br>Một ngăn dây kéo mặt trước.<br>Ngăn chính có 1 ngăn dây kéo bên trong.<br>Dây đeo bằng cotton, khoá nhựa chất lượng cao.<br>Có khả năng chống thấm nước. Bảo hành 1 năm.', N'kira-plum-black-1_master.jpg', 1);


INSERT INTO image (product_id, image_name, status) VALUES (1, N'soldier-waxed-airy-2_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (1, N'soldier-waxed-airy-3_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (1, N'soldier-waxed-airy-4_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (2, N'soldier-navy-black-2_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (2, N'soldier-navy-black-3_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (2, N'soldier-navy-black-4_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (3, N'1975s-navy-beige-2_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (3, N'1975s-navy-beige-3_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (3, N'1975s-navy-beige-4_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (4, N'mars-red-beige-2_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (4, N'mars-red-beige-3_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (4, N'mars-red-beige-4_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (5, N'mars-yellow-gray-2_master.png', 1)
INSERT INTO image (product_id, image_name, status) VALUES (5, N'mars-yellow-gray-3_master.png', 1)
INSERT INTO image (product_id, image_name, status) VALUES (5, N'mars-yellow-gray-4_master.png', 1)
INSERT INTO image (product_id, image_name, status) VALUES (6, N'kira-navy-gray-2_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (6, N'kira-navy-gray-3_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (6, N'kira-navy-gray-4_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (7, N'kira-plum-black-2_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (7, N'kira-plum-black-3_master.jpg', 1)
INSERT INTO image (product_id, image_name, status) VALUES (7, N'kira-plum-black-4_master.jpg', 1)


INSERT INTO status_product (code, status) VALUES (1, N'Còn hàng');
INSERT INTO status_product (code, status) VALUES (2, N'Giảm giá');
INSERT INTO status_product (code, status) VALUES (3, N'Hết hàng');
INSERT INTO status_product (code, status) VALUES (4, N'Ngừng kinh doanh');