Return-Path: <linux-gpio+bounces-17334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96760A5825F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 786597A6257
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E521F1C75E2;
	Sun,  9 Mar 2025 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euAFlOgh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816401C5D57;
	Sun,  9 Mar 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510155; cv=none; b=J0HfHsAcV72e6+U5u2gA3XdU6afKXxBDRXJ3L7MkUgKG5wao3FuwPggzWtUKCzMS3bIgGJeG8maaxDBcsQrYyNglK4oF45IZNvGtMxQaOWjdy9PEiVHl1Exp/z/uXzS6bZgeNjeKtLa8d/rpjsIyHbtJ1IXmvxn0bxNdY5wYSO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510155; c=relaxed/simple;
	bh=isJwiyvhDieXvUvglHGvWl+xZJTvF4GkLQxg/6UGnQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zrkvp46wPzTla5CPgy7ouTBmmG4zdd81PcumQG+1XBx/RaE7ykkTISdBz9LOQuhn6/JghbWkx49ysLbYuav/4QwQkGv0wq4/DXyOdUMMFb7TWG6VQcEpZOdpBR1GqABaHJ9/AC+a34rf4fsoLRtTsoCKCy/bMORWwam6njUmyk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euAFlOgh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec61d0f65so665255566b.1;
        Sun, 09 Mar 2025 00:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510144; x=1742114944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K7F3AG8p3jn+TqnD56bwwg65vWoBgvzQnnpSqZySYI=;
        b=euAFlOghEWq3JrTi54fpVUEhauZGrsy5VdCP8blph4oKomlAtFYpfrjs+fn1P+xekM
         8KzJ7dvaTfErMlvF+s4laH71yV4hKcrlbiSHTdKURNcE/QF2lChZlmjK3mCKqGUImOVh
         kIpZXry1/xJzDlXdu+yQV2CI/E2HarTvy3pfsFpmG9B2x1O6crt0zyF52eqArbYsQ1MZ
         PyHK8V9P3QQyVGX0Fr6gWOZjVD9lDLLE2Bw5Y+peVz74OWvgFEAaRpKKcf5MMB5MwIP5
         38VtwcqXynnutpkg/a05y5IRt9hjR9fQXBcFxVUMN1x+0a4++b9YSACX+ZgzNmvOR0ln
         zV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510144; x=1742114944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1K7F3AG8p3jn+TqnD56bwwg65vWoBgvzQnnpSqZySYI=;
        b=Qye7HeLNNwvgtxZ494n9438exj17pNKnIqJR82hab6yqQB0e7Uz5YoqMFSmE4uDyy8
         iU9rUKoPuWSdIvXEFcXsLoXHx9xFmb8Lp7cP/WEKVf+9VLc1D9r3RgwpZLO9gQKaPGcI
         1c4MAsoPVOZMBJSOUpFk4qeoTMdfDvjN1lBRJvZSbVS3KTOZAsBE1D9A8SPyppd/gaAr
         711EeLEAPjVBUC0/yRKOGdUoOyFrBupw3OImn/qnEOvYhWtfsXwxPuyA3+QAtauGrlwV
         +DcrOannScubLHT/8bqzaTAME1RsYu5m+8gFMslFsb01/4QJeI9hWfS3vfiJADSZjLM4
         STZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQKOF8YCLnUQuuISUkiiidEXiKV83LkhXDzIdaZQWTp87uj4zvv1wg/+s69HIifpS8lBU4gPgFtO5OXH8Q@vger.kernel.org, AJvYcCWk4UQ6nI+EeMs4qQYYRvPSKgGPiEBxR7PnZq6WjtTtRMxCP/kMxts0pN7LfJgLVzvi/m9TGNB9LY4ewg==@vger.kernel.org, AJvYcCWr4bKwT0WxMNiMGR9aZHdY/HyI1XxGUFn4t/8NMKSg5jKKYCRc70BxyTAyqM23z9Wj3JsKePkdUK4F@vger.kernel.org, AJvYcCXhAKK6Xv/3Wht0YBdxdwVIb4lbUOukxuX+1l2qKqKZlGJGT0t98+5HiWEHV6TXmZqbEGTOvUWg47WNXEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzarLax6n1RBuj2/PktcsbI3i+XeOEHppNxJOYauIZxA2CktkGx
	gkkn7PK+/F/x9gIz1Yz9hl+kT8gocCawOpTDrhEX1b8R//D4KVTP
X-Gm-Gg: ASbGncuG2gESk5QnZviWAEOOP7SUFyh2BP1mVwK/omiE6LygtM0Lwevwe9Vj9anDbcL
	0sNijY7nhKeSjRAEUWaDa17uIEAsnVAcPfZ9UKoTunrG/SUzSGlF6ZT0luCXJJT42Qw6HsYqePK
	UYmgojqMP9u0ygv182xrsP29O5GU7GqgfvAfdVg5rfH2ym7JagjoxpkbLly0ZAA9uNSf1N9GAsV
	uIqSQu+Tr1w1ZKUooKBavg66F8Wt9duj11oODvCxDXmUfCfM3QsCeQPiFmEDvUpBSWfbhlWRYjb
	gK3MK63gNuBOjcnN4TCbglixJzHyjSVLwLEiTtFnecRtvCb/LEAqW2bq6A==
X-Google-Smtp-Source: AGHT+IH659jFzbiIt/JGysNpn33iTWD0zJ7QTIHu8uczBJc+AAKzM4K2+yX3TYjVZwK1/Kq1pdqgCw==
X-Received: by 2002:a17:907:2d90:b0:abf:6264:a624 with SMTP id a640c23a62f3a-ac2526e682cmr919362266b.32.1741510142971;
        Sun, 09 Mar 2025 00:49:02 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:49:01 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Sun,  9 Mar 2025 10:48:04 +0200
Message-ID: <20250309084814.3114794-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add drivers for some of the broad-market Maxim GMSL2 / GMSL3 serializers
and deserializers.

These drivers are meant to replace the existing MAX96712 / MAX96714 /
MAX96717 drivers, while integrating them in a common framework, keeping
compatibility with existing usecases, and avoiding code duplication,
while also enabling more features across the whole range.

These drivers also add support for the following new chips:
 * MAX96716 (GMSL2)
 * MAX9296A (GMSL2)
 * MAX96792A (GMSL3)
 * MAX9295A (GMSL2)
 * MAX96793 (GMSL3)

These drivers enable support for the following new features:
 * Full Streams API support
 * .get_frame_desc()
 * .get_mbus_config()
 * I2C ATR, I2C MUX
 * automatic VC remapping
 * automatic pixel mode / tunnel mode selection
 * automatic double mode selection
 * logging of internal state and chip status registers via .log_status()
 * PHY modes
 * serializer pinctrl

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                                 |    1 +
 drivers/media/i2c/Kconfig                   |    2 +
 drivers/media/i2c/Makefile                  |    1 +
 drivers/media/i2c/maxim-serdes/Kconfig      |   53 +
 drivers/media/i2c/maxim-serdes/Makefile     |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c   | 1146 +++++++++
 drivers/media/i2c/maxim-serdes/max96717.c   | 1501 ++++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c   |  905 ++++++++
 drivers/media/i2c/maxim-serdes/max_des.c    | 2321 +++++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h    |  135 ++
 drivers/media/i2c/maxim-serdes/max_ser.c    | 1584 +++++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h    |  132 ++
 drivers/media/i2c/maxim-serdes/max_serdes.c |  302 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h |   88 +
 14 files changed, 8177 insertions(+)
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c1e01668e81a..e97c4f55bc2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14225,6 +14225,7 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+F:	drivers/media/i2c/maxim-serdes/
 
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e576b213084d..e24c84962c92 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1653,6 +1653,8 @@ config VIDEO_MAX96717
 	  To compile this driver as a module, choose M here: the
 	  module will be called max96717.
 
+source "drivers/media/i2c/maxim-serdes/Kconfig"
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 6c23a4463527..b24e7cf7bb2f 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
 obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
new file mode 100644
index 000000000000..fafa6a47d5eb
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Kconfig
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_MAXIM_SERDES
+	tristate "Maxim GMSL2 Serializer and Deserializer support"
+	depends on VIDEO_DEV
+	select I2C_ATR
+	select I2C_MUX
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver supports the Maxim GMSL2 common Serializer and Deserializer
+	  framework.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called max_serdes.
+
+config VIDEO_MAX96717
+	tristate "Maxim MAX96717 GMSL2 Serializer support"
+	depends on OF && COMMON_CLK
+	select VIDEO_MAXIM_SERDES
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GPIOLIB
+	help
+	  This driver supports the Maxim MAX96717 GMSL2 Serializer,
+	  which receives video on a MIPI CSI-2 interface and outputs it
+	  on a GMSL2 link.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called max96717.
+
+config VIDEO_MAX96724
+	tristate "Maxim MAX96724 Quad GMSL2 Deserializer support"
+	select VIDEO_MAXIM_SERDES
+	help
+	  This driver supports the Maxim MAX96724 Quad GMSL2 Deserializer,
+	  which converts from four GMSL2/1 to 1, 2 or 4 MIPI D-PHY or
+	  C-PHY outputs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called max96724.
+
+config VIDEO_MAX9296A
+	tristate "Maxim MAX9296A Dual GMSL2 Deserializer support"
+	select VIDEO_MAXIM_SERDES
+	help
+	  This driver supports the Maxim MAX9296A Dual GMSL2 Deserializer,
+	  which converts from two GMSL2/1 to 1 or 2 MIPI D-PHY outputs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called max9296a.
diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
new file mode 100644
index 000000000000..ae306bc33bfb
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+max-serdes-objs := max_serdes.o max_ser.o max_des.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
+obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
+obj-$(CONFIG_VIDEO_MAX96724) += max96724.o
+obj-$(CONFIG_VIDEO_MAX9296A) += max9296a.o
diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2c/maxim-serdes/max9296a.c
new file mode 100644
index 000000000000..d2ee4cccb633
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -0,0 +1,1146 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim MAX9296A Quad GMSL2 Deserializer Driver
+ *
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+
+#include "max_des.h"
+
+#define MAX9296A_REG0				0x0
+
+#define MAX9296A_REG1				0x1
+#define MAX9296A_REG1_DIS_REM_CC_A		BIT(4)
+#define MAX9296A_REG1_RX_RATE_A			GENMASK(1, 0)
+#define MAX9296A_REG1_RX_RATE_6Gbps		0b10
+#define MAX9296A_REG1_RX_RATE_12Gbps		0b11
+
+#define MAX9296A_REG2				0x2
+#define MAX9296A_REG2_VID_EN(p)			BIT((p) + 4)
+
+#define MAX9296A_REG3				0x3
+#define MAX9296A_REG3_DIS_REM_CC_B		BIT(2)
+
+#define MAX9296A_REG4				0x4
+#define MAX9296A_REG4_GMSL3_X(x)		BIT((x) + 6)
+#define MAX9296A_REG4_RX_RATE_B			GENMASK(1, 0)
+
+#define MAX9296A_REG6				0x6
+#define MAX9296A_REG6_GMSL2_X(x)		BIT((x) + 6)
+
+#define MAX9296A_CTRL0				0x10
+#define MAX9296A_CTRL0_LINK_CFG			GENMASK(1, 0)
+#define MAX9296A_CTRL0_AUTO_LINK		BIT(4)
+#define MAX9296A_CTRL0_RESET_ONESHOT		BIT(5)
+#define MAX9296A_CTRL0_RESET_ALL		BIT(7)
+
+#define MAX9296A_CTRL2				0x12
+#define MAX9296A_CTRL2_RESET_ONESHOT_B		BIT(5)
+
+#define MAX9296A_MIPI_TX0(x)			(0x28 + (x) * 0x5000)
+#define MAX9296A_MIPI_TX0_RX_FEC_EN		BIT(1)
+
+#define MAX9296A_RX50(p)			(0x50 + (p))
+#define MAX9296A_RX50_STR_SEL			GENMASK(1, 0)
+
+#define MAX9296A_VIDEO_PIPE_EN			0x160
+#define MAX9296A_VIDEO_PIPE_EN_MASK(p)		BIT(p)
+
+#define MAX9296A_VIDEO_PIPE_SEL			0x161
+#define MAX9296A_VIDEO_PIPE_SEL_STREAM(p)	(GENMASK(1, 0) << ((p) * 3))
+
+#define MAX9296A_VPRBS(p)			(0x1dc + (p) * 0x20)
+#define MAX9296A_VPRBS_VIDEO_LOCK		BIT(0)
+
+#define MAX9296A_BACKTOP12			0x313
+#define MAX9296A_BACKTOP12_CSI_OUT_EN		BIT(1)
+
+#define MAX9296A_BACKTOP21			0x31c
+#define MAX9296A_BACKTOP21_BPP8DBL(p)		BIT(4 + (p))
+
+#define MAX9296A_BACKTOP22(x)			(0x31d * (x) * 0x3)
+#define MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL	GENMASK(4, 0)
+#define MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL_EN	BIT(5)
+
+#define MAX9296A_BACKTOP24			0x31f
+#define MAX9296A_BACKTOP24_BPP8DBL_MODE(p)	BIT(4 + (p))
+
+#define MAX9296A_BACKTOP32			0x327
+#define MAX9296A_BACKTOP32_BPP10DBL(p)		BIT(p)
+#define MAX9296A_BACKTOP32_BPP10DBL_MODE(p)	BIT(4 + (p))
+
+#define MAX9296A_BACKTOP33			0x328
+#define MAX9296A_BACKTOP32_BPP12DBL(p)		BIT(p)
+
+#define MAX9296A_MIPI_PHY2			0x332
+#define MAX9296A_MIPI_PHY2_PHY_STDBY_N(x)	(GENMASK(5, 4) << ((x) * 2))
+
+#define MAX9296A_MIPI_PHY3(x)			(0x333 + (x))
+#define MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4	GENMASK(7, 0)
+
+#define MAX9296A_MIPI_PHY5(x)			(0x335 + (x))
+#define MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1	GENMASK(1, 0)
+#define MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3	GENMASK(4, 3)
+#define MAX9296A_MIPI_PHY5_PHY_POL_MAP_CLK(x)	((x) == 0 ? BIT(5) : BIT(2))
+
+#define MAX9296A_MIPI_PHY18			(0x342)
+#define MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(x)	(GENMASK(3, 0) << (4 * (x)))
+
+#define MAX9296A_MIPI_PHY20			(0x342)
+#define MAX9296A_MIPI_PHY20_PHY_PKT_CNT(x)	(GENMASK(3, 0) << (4 * (x)))
+
+#define MAX9296A_MIPI_TX3(x)			(0x403 + (x) * 0x40)
+#define MAX9296A_MIPI_TX3_DESKEW_INIT_8X32K	FIELD_PREP(GENMASK(2, 0), 0b001)
+#define MAX9296A_MIPI_TX3_DESKEW_INIT_AUTO	BIT(7)
+
+#define MAX9296A_MIPI_TX4(x)			(0x404 + (x) * 0x40)
+#define MAX9296A_MIPI_TX4_DESKEW_PER_2K		FIELD_PREP(GENMASK(2, 0), 0b001)
+#define MAX9296A_MIPI_TX4_DESKEW_PER_AUTO	BIT(7)
+
+#define MAX9296A_MIPI_TX10(x)			(0x40a + 0x40 * (x))
+#define MAX9296A_MIPI_TX10_CSI2_LANE_CNT	GENMASK(7, 6)
+#define MAX9296A_MIPI_TX10_CSI2_CPHY_EN		BIT(5)
+
+#define MAX9296A_MIPI_TX11(p)			(0x40b + (p) * 0x40)
+#define MAX9296A_MIPI_TX12(p)			(0x40c + (p) * 0x40)
+
+#define MAX9296A_MIPI_TX13(p, x)		(0x40d + (p) * 0x40 + (x) * 0x2)
+#define MAX9296A_MIPI_TX13_MAP_SRC_DT		GENMASK(5, 0)
+#define MAX9296A_MIPI_TX13_MAP_SRC_VC		GENMASK(7, 6)
+
+#define MAX9296A_MIPI_TX14(p, x)		(0x40e + (p) * 0x40 + (x) * 0x2)
+#define MAX9296A_MIPI_TX14_MAP_DST_DT		GENMASK(5, 0)
+#define MAX9296A_MIPI_TX14_MAP_DST_VC		GENMASK(7, 6)
+
+#define MAX9296A_MIPI_TX45(p, x)		(0x42d + (p) * 0x40 + (x) / 4)
+#define MAX9296A_MIPI_TX45_MAP_DPHY_DEST(x)	(GENMASK(1, 0) << (2 * ((x) % 4)))
+
+#define MAX9296A_MIPI_TX51(x)			(0x433 + (x) * 0x40)
+#define MAX9296A_MIPI_TX51_ALT_MEM_MAP_12	BIT(0)
+#define MAX9296A_MIPI_TX51_ALT_MEM_MAP_8	BIT(1)
+#define MAX9296A_MIPI_TX51_ALT_MEM_MAP_10	BIT(2)
+#define MAX9296A_MIPI_TX51_ALT2_MEM_MAP_8	BIT(4)
+
+#define MAX9296A_MIPI_TX52(x)			(0x434 + 0x40 * (x))
+#define MAX9296A_MIPI_TX52_TUN_DEST		BIT(1)
+#define MAX9296A_MIPI_TX52_TUN_EN		BIT(0)
+
+#define MAX9296A_GMSL1_EN			0xf00
+#define MAX9296A_GMSL1_EN_LINK_EN		GENMASK(1, 0)
+
+#define MAX9296A_RLMS3E(x)			(0x143e + 0x100 * (x))
+#define MAX9296A_RLMS3F(x)			(0x143f + 0x100 * (x))
+#define MAX9296A_RLMS49(x)			(0x1449 + 0x100 * (x))
+#define MAX9296A_RLMS7E(x)			(0x147e + 0x100 * (x))
+#define MAX9296A_RLMS7F(x)			(0x147f + 0x100 * (x))
+#define MAX9296A_RLMSA3(x)			(0x14a3 + 0x100 * (x))
+#define MAX9296A_RLMSA5(x)			(0x14a5 + 0x100 * (x))
+#define MAX9296A_RLMSD8(x)			(0x14d8 + 0x100 * (x))
+
+#define MAX9296A_DPLL_0(x)			(0x1c00 + ((x) == 0 ? 1 : 2) * 0x100)
+#define MAX9296A_DPLL_0_CONFIG_SOFT_RST_N	BIT(0)
+
+#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
+#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))
+
+#define MAX9296A_PIPES_NUM		4
+#define MAX9296A_PHYS_NUM		2
+
+static const struct regmap_config max9296a_i2c_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+};
+
+struct max9296a_priv {
+	struct max_des des;
+	const struct max9296a_chip_info *info;
+
+	struct device *dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+
+	struct gpio_desc *gpiod_pwdn;
+};
+
+struct max9296a_chip_info {
+	unsigned int max_register;
+	enum max_gmsl_version versions;
+	unsigned int num_pipes;
+	unsigned int pipe_hw_ids[MAX9296A_PIPES_NUM];
+	unsigned int phy_hw_ids[MAX9296A_PIPES_NUM];
+	unsigned int num_phys;
+	unsigned int num_links;
+	struct max_phys_configs phys_configs;
+	bool select_resets_link;
+	bool has_per_link_reset;
+	bool phy0_lanes_0_1_on_second_phy;
+	bool polarity_on_physical_lanes;
+	bool supports_cphy;
+	bool supports_phy_log;
+	bool adjust_rlms;
+	bool fix_tx_ids;
+
+	int (*set_pipe_stream_id)(struct max_des *des, struct max_des_pipe *pipe,
+				  unsigned int stream_id);
+	int (*set_pipe_enable)(struct max_des *des, struct max_des_pipe *pipe,
+			       bool enable);
+	int (*set_pipe_phy)(struct max_des *des, struct max_des_pipe *pipe,
+			    struct max_des_phy *phy);
+	int (*set_pipe_tunnel_enable)(struct max_des *des, struct max_des_pipe *pipe,
+				      bool enable);
+	int (*select_links)(struct max_des *des, unsigned int mask);
+	int (*select_link_version)(struct max_des *des, struct max_des_link *link,
+				   enum max_gmsl_version version);
+};
+
+#define des_to_priv(_des) \
+	container_of(_des, struct max9296a_priv, des)
+
+static int max9296a_wait_for_device(struct max9296a_priv *priv)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < 10; i++) {
+		unsigned int val;
+
+		ret = regmap_read(priv->regmap, MAX9296A_REG0, &val);
+		if (!ret && val)
+			return 0;
+
+		msleep(100);
+
+		dev_err(priv->dev, "Retry %u waiting for deserializer: %d\n", i, ret);
+	}
+
+	return ret;
+}
+
+static int max9296a_reset(struct max9296a_priv *priv)
+{
+	int ret;
+
+	ret = max9296a_wait_for_device(priv);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_bits(priv->regmap, MAX9296A_CTRL0,
+			      MAX9296A_CTRL0_RESET_ALL);
+	if (ret)
+		return ret;
+
+	msleep(100);
+
+	ret = max9296a_wait_for_device(priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static unsigned int max9296a_pipe_id(struct max9296a_priv *priv,
+				     struct max_des_pipe *pipe)
+{
+	return priv->info->pipe_hw_ids[pipe->index];
+}
+
+static unsigned int max9296a_phy_id(struct max9296a_priv *priv,
+				    struct max_des_phy *phy)
+{
+	return priv->info->phy_hw_ids[phy->index];
+}
+
+static int max9296a_reg_read(struct max_des *des, unsigned int reg,
+			     unsigned int *val)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+
+	return regmap_read(priv->regmap, reg, val);
+}
+
+static int max9296a_reg_write(struct max_des *des, unsigned int reg,
+			      unsigned int val)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+
+	return regmap_write(priv->regmap, reg, val);
+}
+
+static int max9626a_log_pipe_status(struct max_des *des,
+				    struct max_des_pipe *pipe, const char *name)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MAX9296A_VPRBS(index), &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tvideo_lock: %u\n", name,
+		!!(val & MAX9296A_VPRBS_VIDEO_LOCK));
+
+	return 0;
+}
+
+static int max9296a_log_phy_status(struct max_des *des,
+				   struct max_des_phy *phy, const char *name)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = phy->index;
+	unsigned int val;
+	int ret;
+
+	if (!priv->info->supports_phy_log)
+		return 0;
+
+	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY18, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tcsi2_pkt_cnt: %lu\n", name,
+		field_get(MAX9296A_MIPI_PHY18_CSI2_TX_PKT_CNT(index), val));
+
+	ret = regmap_read(priv->regmap, MAX9296A_MIPI_PHY20, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tphy_pkt_cnt: %lu\n", name,
+		field_get(MAX9296A_MIPI_PHY20_PHY_PKT_CNT(index), val));
+
+	return 0;
+}
+
+static int max9296a_set_enable(struct max_des *des, bool enable)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP12,
+				  MAX9296A_BACKTOP12_CSI_OUT_EN, enable);
+}
+
+static int max9296a_init(struct max_des *des)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	int ret;
+
+	/* Disable link auto-select. */
+	ret = regmap_clear_bits(priv->regmap, MAX9296A_CTRL0,
+				MAX9296A_CTRL0_AUTO_LINK);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max9296a_init_phy(struct max_des *des, struct max_des_phy *phy)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
+	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
+	unsigned int dpll_freq = phy->link_frequency * 2;
+	unsigned int num_hw_data_lanes;
+	unsigned int hw_index = max9296a_phy_id(priv, phy);
+	unsigned int index = phy->index;
+	unsigned int used_data_lanes = 0;
+	unsigned int val;
+	unsigned int i;
+	int ret;
+
+	if (is_cphy && !priv->info->supports_cphy) {
+		dev_err(priv->dev, "CPHY not supported\n");
+		return -EINVAL;
+	}
+
+	num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
+
+	/*
+	 * MAX9296A has four PHYs, but does not support single-PHY configurations,
+	 * only double-PHY configurations, even when only using two lanes.
+	 * For PHY 0 + PHY 1, PHY 1 is the master PHY.
+	 * For PHY 2 + PHY 3, PHY 2 is the master PHY.
+	 * Clock is always on the master PHY.
+	 * For first pair of PHYs, first lanes are on the master PHY.
+	 * For second pair of PHYs, first lanes are on the master PHY too.
+	 *
+	 * PHY 0 + 1
+	 * CLK = PHY 1
+	 * PHY1 Lane 0 = D0
+	 * PHY1 Lane 1 = D1
+	 * PHY0 Lane 0 = D2
+	 * PHY0 Lane 1 = D3
+	 *
+	 * PHY 2 + 3
+	 * CLK = PHY 2
+	 * PHY2 Lane 0 = D0
+	 * PHY2 Lane 1 = D1
+	 * PHY3 Lane 0 = D2
+	 * PHY3 Lane 1 = D3
+	 *
+	 * MAX96714 only has two PHYs which cannot support single-PHY configurations.
+	 * Clock is always on the master PHY, first lanes are on PHY 0, even if
+	 * PHY 1 is the master PHY.
+	 *
+	 * PHY 0 + 1
+	 * CLK = PHY 1
+	 * PHY0 Lane 0 = D0
+	 * PHY0 Lane 1 = D1
+	 * PHY1 Lane 0 = D2
+	 * PHY1 Lane 1 = D3
+	 */
+
+	/* Configure a lane count. */
+	ret = regmap_update_bits(priv->regmap, MAX9296A_MIPI_TX10(hw_index),
+				 MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
+				 FIELD_PREP(MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
+					    num_data_lanes - 1));
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX10(hw_index),
+				 MAX9296A_MIPI_TX10_CSI2_CPHY_EN, is_cphy);
+	if (ret)
+		return ret;
+
+	/* Configure lane mapping. */
+	/*
+	 * The lane of each PHY can be mapped to physical lanes 0, 1, 2, and 3.
+	 * This mapping is exclusive, multiple lanes, even if unused cannot be
+	 * mapped to the same physical lane.
+	 * Each lane mapping is represented as two bits.
+	 */
+	val = 0;
+	for (i = 0; i < num_hw_data_lanes ; i++) {
+		unsigned int map;
+
+		if (i < num_data_lanes)
+			map = phy->mipi.data_lanes[i] - 1;
+		else
+			map = ffz(used_data_lanes);
+
+		val |= map << (i * 2);
+		used_data_lanes |= BIT(map);
+	}
+
+	if (phy->index == 0 && priv->info->phy0_lanes_0_1_on_second_phy)
+		val = ((val & 0xf) << 4) | ((val >> 4) & 0xf);
+
+	ret = regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY3(index),
+				 MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4,
+				 FIELD_PREP(MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4, val));
+	if (ret)
+		return ret;
+
+	/*
+	 * Configure lane polarity.
+	 *
+	 * PHY 0 and 1 are on register 0x335.
+	 * PHY 2 and 3 are on register 0x336.
+	 *
+	 * Each PHY has 3 bits of polarity configuration.
+	 *
+	 * On MAX9296A, each bit represents the lane polarity of logical lanes.
+	 * Each of these lanes can be mapped to any physical lane.
+	 * 0th bit is for lane 0.
+	 * 1st bit is for lane 1.
+	 * 2nd bit is for clock lane.
+	 *
+	 * On MAX96714, each bit represents the lane polarity of physical lanes.
+	 * 0th bit for physical lane 0.
+	 * 1st bit for physical lane 1.
+	 * 2nd bit for clock lane of PHY 0, the slave PHY, which is unused.
+	 *
+	 * 3rd bit for physical lane 2.
+	 * 4th bit for physical lane 3.
+	 * 5th bit for clock lane of PHY 1, the master PHY.
+	 */
+
+	val = 0;
+	for (i = 0; i < num_data_lanes; i++) {
+		unsigned int map;
+
+		if (!phy->mipi.lane_polarities[i + 1])
+			continue;
+
+		/*
+		 * The numbers inside the data_lanes array specify the hardware
+		 * lane each logical lane maps to.
+		 * If polarity is set for the physical lanes, retrieve the
+		 * physical lane matching the logical lane from data_lanes.
+		 * Otherwise, when polarity is set for the logical lanes
+		 * the index of the polarity can be used.
+		 */
+
+		if (priv->info->polarity_on_physical_lanes)
+			map = phy->mipi.data_lanes[i];
+		else
+			map = i;
+
+		val |= BIT(map);
+	}
+
+	if (phy->index == 0 && priv->info->phy0_lanes_0_1_on_second_phy)
+		val = ((val & 0x3) << 2) | ((val >> 2) & 0x3);
+
+	ret = regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
+				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1 |
+				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3,
+				 FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1, val) |
+				 FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3, val >> 2));
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
+				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_CLK(index),
+				 phy->mipi.lane_polarities[0]);
+	if (ret)
+		return ret;
+
+	/* Put DPLL block into reset. */
+	ret = regmap_clear_bits(priv->regmap, MAX9296A_DPLL_0(index),
+				MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
+	if (ret)
+		return ret;
+
+	/* Set DPLL frequency. */
+	ret = regmap_update_bits(priv->regmap, MAX9296A_BACKTOP22(index),
+				 MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL,
+				 FIELD_PREP(MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL,
+					    div_u64(dpll_freq, 100000000)));
+	if (ret)
+		return ret;
+
+	/* Enable DPLL frequency. */
+	ret = regmap_set_bits(priv->regmap, MAX9296A_BACKTOP22(index),
+			      MAX9296A_BACKTOP22_PHY_CSI_TX_DPLL_EN);
+	if (ret)
+		return ret;
+
+	/* Pull DPLL block out of reset. */
+	ret = regmap_set_bits(priv->regmap, MAX9296A_DPLL_0(index),
+			      MAX9296A_DPLL_0_CONFIG_SOFT_RST_N);
+	if (ret)
+		return ret;
+
+	if (dpll_freq > 1500000000ull) {
+		/* Enable initial deskew with 2 x 32k UI. */
+		ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX3(hw_index),
+				   MAX9296A_MIPI_TX3_DESKEW_INIT_AUTO |
+				   MAX9296A_MIPI_TX3_DESKEW_INIT_8X32K);
+		if (ret)
+			return ret;
+
+		/* Enable periodic deskew with 2 x 1k UI.. */
+		ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX4(hw_index),
+				   MAX9296A_MIPI_TX4_DESKEW_PER_AUTO |
+				   MAX9296A_MIPI_TX4_DESKEW_PER_2K);
+		if (ret)
+			return ret;
+	} else {
+		/* Disable initial deskew. */
+		ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX3(hw_index), 0x0);
+		if (ret)
+			return ret;
+
+		/* Disable periodic deskew. */
+		ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX4(hw_index), 0x0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max9296a_set_phy_mode(struct max_des *des, struct max_des_phy *phy,
+				 struct max_des_phy_mode *mode)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = phy->index;
+	unsigned int phy_id = index == 0 ? 1 : 2;
+	int ret;
+
+	/* Set alternate memory map modes. */
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
+				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_12,
+				 mode->alt_mem_map12);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
+				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_8,
+				 mode->alt_mem_map8);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
+				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_10,
+				 mode->alt_mem_map10);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
+				 MAX9296A_MIPI_TX51_ALT2_MEM_MAP_8,
+				 mode->alt2_mem_map8);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max9296a_set_phy_active(struct max_des *des, struct max_des_phy *phy,
+				   bool enable)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_PHY2,
+				  MAX9296A_MIPI_PHY2_PHY_STDBY_N(phy->index), enable);
+}
+
+static int max9296a_set_pipe_remap(struct max_des *des,
+				   struct max_des_pipe *pipe,
+				   unsigned int i,
+				   struct max_des_remap *remap)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+	unsigned int phy_id = remap->phy == 0 ? 1 : 2;
+	int ret;
+
+	/* Set source Data Type and Virtual Channel. */
+	/* TODO: implement extended Virtual Channel. */
+	ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX13(index, i),
+			   FIELD_PREP(MAX9296A_MIPI_TX13_MAP_SRC_DT,
+				      remap->from_dt) |
+			   FIELD_PREP(MAX9296A_MIPI_TX13_MAP_SRC_VC,
+				      remap->from_vc));
+	if (ret)
+		return ret;
+
+	/* Set destination Data Type and Virtual Channel. */
+	/* TODO: implement extended Virtual Channel. */
+	ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX14(index, i),
+			   FIELD_PREP(MAX9296A_MIPI_TX14_MAP_DST_DT,
+				      remap->to_dt) |
+			   FIELD_PREP(MAX9296A_MIPI_TX14_MAP_DST_VC,
+				      remap->to_vc));
+	if (ret)
+		return ret;
+
+	/* Set destination PHY. */
+	return regmap_update_bits(priv->regmap, MAX9296A_MIPI_TX45(index, i),
+				  MAX9296A_MIPI_TX45_MAP_DPHY_DEST(i),
+				  field_prep(MAX9296A_MIPI_TX45_MAP_DPHY_DEST(i),
+					     phy_id));
+}
+
+static int max9296a_set_pipe_remaps_enable(struct max_des *des,
+					   struct max_des_pipe *pipe,
+					   unsigned int mask)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+	int ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_MIPI_TX11(index), mask);
+	if (ret)
+		return ret;
+
+	return regmap_write(priv->regmap, MAX9296A_MIPI_TX12(index), mask >> 8);
+}
+
+static int max9296a_set_pipe_enable(struct max_des *des, struct max_des_pipe *pipe,
+				    bool enable)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_REG2,
+				  MAX9296A_REG2_VID_EN(index), enable);
+}
+
+static int max96714_set_pipe_enable(struct max_des *des, struct max_des_pipe *pipe,
+				    bool enable)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_VIDEO_PIPE_EN,
+				  MAX9296A_VIDEO_PIPE_EN_MASK(index - 1), enable);
+}
+
+static int max96714_set_pipe_tunnel_enable(struct max_des *des,
+					   struct max_des_pipe *pipe, bool enable)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX52(index),
+				  MAX9296A_MIPI_TX52_TUN_EN, enable);
+}
+
+static int max9296a_set_pipe_stream_id(struct max_des *des, struct max_des_pipe *pipe,
+				       unsigned int stream_id)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+
+	return regmap_update_bits(priv->regmap, MAX9296A_RX50(index), MAX9296A_RX50_STR_SEL,
+				  FIELD_PREP(MAX9296A_RX50_STR_SEL, pipe->stream_id));
+}
+
+static int max96714_set_pipe_stream_id(struct max_des *des, struct max_des_pipe *pipe,
+				       unsigned int stream_id)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+
+	return regmap_update_bits(priv->regmap, MAX9296A_VIDEO_PIPE_SEL,
+				  MAX9296A_VIDEO_PIPE_SEL_STREAM(index - 1),
+				  field_prep(MAX9296A_VIDEO_PIPE_SEL_STREAM(index - 1),
+					     stream_id));
+}
+
+static int max96716_set_pipe_phy(struct max_des *des,
+				 struct max_des_pipe *pipe,
+				 struct max_des_phy *phy)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX52(index),
+				  MAX9296A_MIPI_TX52_TUN_DEST, phy->index);
+}
+
+static int max9296a_set_pipe_mode(struct max_des *des,
+				  struct max_des_pipe *pipe,
+				  struct max_des_pipe_mode *mode)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = max9296a_pipe_id(priv, pipe);
+	int ret;
+
+	/* Set 8bit double mode. */
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP21,
+				 MAX9296A_BACKTOP21_BPP8DBL(index), mode->dbl8);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP24,
+				 MAX9296A_BACKTOP24_BPP8DBL_MODE(index),
+				 mode->dbl8mode);
+	if (ret)
+		return ret;
+
+	/* Set 10bit double mode. */
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP32,
+				 MAX9296A_BACKTOP32_BPP10DBL(index), mode->dbl10);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP32,
+				 MAX9296A_BACKTOP32_BPP10DBL_MODE(index),
+				 mode->dbl10mode);
+	if (ret)
+		return ret;
+
+	/* Set 12bit double mode. */
+	/* TODO: check support for double mode on MAX96714. */
+	return regmap_assign_bits(priv->regmap, MAX9296A_BACKTOP33,
+				  MAX9296A_BACKTOP32_BPP12DBL(index), mode->dbl12);
+}
+
+static int max9296a_reset_link(struct max9296a_priv *priv, unsigned int index)
+{
+	unsigned int reg, mask;
+
+	if (index == 0) {
+		reg = MAX9296A_CTRL0;
+		mask = MAX9296A_CTRL0_RESET_ONESHOT;
+	} else {
+		reg = MAX9296A_CTRL2;
+		mask = MAX9296A_CTRL2_RESET_ONESHOT_B;
+	}
+
+	return regmap_set_bits(priv->regmap, reg, mask);
+}
+
+static int max9296a_init_link_rlms(struct max9296a_priv *priv,
+				   struct max_des_link *link)
+{
+	unsigned int index = link->index;
+	int ret;
+
+	/*
+	 * These settings are described as required on datasheet page 53
+	 * for MAX96714.
+	 */
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMS3E(index), 0xfd);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMS3F(index), 0x3d);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMS49(index), 0xf5);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMS7E(index), 0xa8);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMS7F(index), 0x68);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMSA3(index), 0x30);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMSA5(index), 0x70);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->regmap, MAX9296A_RLMSD8(index), 0x07);
+	if (ret)
+		return ret;
+
+	return max9296a_reset_link(priv, link->index);
+}
+
+static int max9296a_init_link(struct max_des *des, struct max_des_link *link)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	int ret;
+
+	if (priv->info->adjust_rlms) {
+		ret = max9296a_init_link_rlms(priv, link);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max9296a_select_links(struct max_des *des, unsigned int mask)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	int ret;
+
+	if (priv->info->num_links == 1)
+		return 0;
+
+	if (!mask) {
+		dev_err(priv->dev, "Disable all links unsupported\n");
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(priv->regmap, MAX9296A_GMSL1_EN,
+				 MAX9296A_GMSL1_EN_LINK_EN,
+				 FIELD_PREP(MAX9296A_GMSL1_EN_LINK_EN, mask));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX9296A_CTRL0,
+				 MAX9296A_CTRL0_LINK_CFG |
+				 MAX9296A_CTRL0_RESET_ONESHOT,
+				 FIELD_PREP(MAX9296A_CTRL0_LINK_CFG, mask) |
+				 FIELD_PREP(MAX9296A_CTRL0_RESET_ONESHOT, 1));
+	if (ret)
+		return ret;
+
+	if (priv->info->has_per_link_reset) {
+		ret = max9296a_reset_link(priv, 1);
+		if (ret)
+			return ret;
+	}
+
+	msleep(200);
+
+	return 0;
+}
+
+static int max96716_select_links(struct max_des *des, unsigned int mask)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		bool dis = !(mask & BIT(i));
+		unsigned int reg, mask;
+
+		if (i == 0) {
+			reg = MAX9296A_REG1;
+			mask = MAX9296A_REG1_DIS_REM_CC_A;
+		} else {
+			reg = MAX9296A_REG3;
+			mask = MAX9296A_REG3_DIS_REM_CC_B;
+		}
+
+		ret = regmap_assign_bits(priv->regmap, reg, mask, dis);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max96792a_select_link_version(struct max_des *des,
+					 struct max_des_link *link,
+					 enum max_gmsl_version version)
+{
+	struct max9296a_priv *priv = des_to_priv(des);
+	unsigned int index = link->index;
+	bool en = version == MAX_GMSL_3;
+	unsigned int reg, mask, val;
+	int ret;
+
+	if (index == 0) {
+		reg = MAX9296A_REG1;
+		mask = MAX9296A_REG1_RX_RATE_A;
+	} else {
+		reg = MAX9296A_REG4;
+		mask = MAX9296A_REG4_RX_RATE_B;
+	}
+
+	val = en ? MAX9296A_REG1_RX_RATE_12Gbps
+		 : MAX9296A_REG1_RX_RATE_6Gbps;
+	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX0(index),
+				 MAX9296A_MIPI_TX0_RX_FEC_EN, en);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX9296A_REG6,
+				 MAX9296A_REG6_GMSL2_X(index), !en);
+	if (ret)
+		return ret;
+
+	return regmap_assign_bits(priv->regmap, MAX9296A_REG4,
+				  MAX9296A_REG4_GMSL3_X(index), en);
+}
+
+static const struct max_des_ops max9296a_ops = {
+	.num_remaps_per_pipe = 16,
+	.reg_read = max9296a_reg_read,
+	.reg_write = max9296a_reg_write,
+	.log_pipe_status = max9626a_log_pipe_status,
+	.log_phy_status = max9296a_log_phy_status,
+	.set_enable = max9296a_set_enable,
+	.init = max9296a_init,
+	.init_phy = max9296a_init_phy,
+	.set_phy_mode = max9296a_set_phy_mode,
+	.set_phy_active = max9296a_set_phy_active,
+	.set_pipe_remap = max9296a_set_pipe_remap,
+	.set_pipe_remaps_enable = max9296a_set_pipe_remaps_enable,
+	.set_pipe_mode = max9296a_set_pipe_mode,
+	.init_link = max9296a_init_link,
+};
+
+static int max9296a_probe(struct i2c_client *client)
+{
+	struct regmap_config i2c_regmap = max9296a_i2c_regmap;
+	struct device *dev = &client->dev;
+	struct max9296a_priv *priv;
+	struct max_des_ops *ops;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return -ENOMEM;
+
+	priv->info = device_get_match_data(dev);
+	if (!priv->info) {
+		dev_err(dev, "Failed to get match data\n");
+		return -ENODEV;
+	}
+
+	priv->dev = dev;
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	i2c_regmap.max_register = priv->info->max_register;
+	priv->regmap = devm_regmap_init_i2c(client, &i2c_regmap);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "powerdown",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_pwdn))
+		return PTR_ERR(priv->gpiod_pwdn);
+
+	if (priv->gpiod_pwdn) {
+		/* PWDN must be held for 1us for reset */
+		udelay(1);
+
+		gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
+		/* Maximum power-up time (tLOCK) 4ms */
+		usleep_range(4000, 5000);
+	}
+
+	*ops = max9296a_ops;
+
+	ops->versions = priv->info->versions;
+	ops->fix_tx_ids = priv->info->fix_tx_ids;
+	ops->num_phys = priv->info->num_phys;
+	ops->num_pipes = priv->info->num_pipes;
+	ops->num_links = priv->info->num_links;
+	ops->phys_configs = priv->info->phys_configs;
+	ops->set_pipe_enable = priv->info->set_pipe_enable;
+	ops->set_pipe_stream_id = priv->info->set_pipe_stream_id;
+	ops->set_pipe_phy = priv->info->set_pipe_phy;
+	ops->set_pipe_tunnel_enable = priv->info->set_pipe_tunnel_enable;
+	ops->select_links = priv->info->select_links;
+	ops->select_link_version = priv->info->select_link_version;
+	ops->select_resets_link = priv->info->select_resets_link;
+	priv->des.ops = ops;
+
+	ret = max9296a_reset(priv);
+	if (ret)
+		return ret;
+
+	return max_des_probe(client, &priv->des);
+}
+
+static void max9296a_remove(struct i2c_client *client)
+{
+	struct max9296a_priv *priv = i2c_get_clientdata(client);
+
+	max_des_remove(&priv->des);
+
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
+}
+
+static const struct max_phys_config max9296a_phys_configs[] = {
+	{ { 4, 4 } },
+};
+
+static const struct max_phys_config max96714_phys_configs[] = {
+	{ { 4 } },
+};
+
+static const struct max9296a_chip_info max9296a_info = {
+	.max_register = 0x1f00,
+	.set_pipe_stream_id = max9296a_set_pipe_stream_id,
+	.set_pipe_enable = max9296a_set_pipe_enable,
+	.select_links = max9296a_select_links,
+	.select_resets_link = true,
+	.phys_configs = {
+		.num_configs = ARRAY_SIZE(max9296a_phys_configs),
+		.configs = max9296a_phys_configs,
+	},
+	.phy0_lanes_0_1_on_second_phy = true,
+	.fix_tx_ids = true,
+	.num_pipes = 4,
+	.pipe_hw_ids = { 0, 1, 2, 3 },
+	.num_phys = 2,
+	.phy_hw_ids = { 1, 2 },
+	.num_links = 2,
+};
+
+static const struct max9296a_chip_info max96714_info = {
+	.max_register = 0x5011,
+	.set_pipe_stream_id = max96714_set_pipe_stream_id,
+	.set_pipe_enable = max96714_set_pipe_enable,
+	.set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
+	.phys_configs = {
+		.num_configs = ARRAY_SIZE(max96714_phys_configs),
+		.configs = max96714_phys_configs,
+	},
+	.polarity_on_physical_lanes = true,
+	.supports_phy_log = true,
+	.adjust_rlms = true,
+	.num_pipes = 1,
+	.pipe_hw_ids = { 1 },
+	.num_phys = 1,
+	.phy_hw_ids = { 1 },
+	.num_links = 1,
+};
+
+static const struct max9296a_chip_info max96716a_info = {
+	.max_register = 0x52d6,
+	.set_pipe_stream_id = max96714_set_pipe_stream_id,
+	.set_pipe_enable = max96714_set_pipe_enable,
+	.set_pipe_phy = max96716_set_pipe_phy,
+	.set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
+	.select_links = max96716_select_links,
+	.phys_configs = {
+		.num_configs = ARRAY_SIZE(max9296a_phys_configs),
+		.configs = max9296a_phys_configs,
+	},
+	.has_per_link_reset = true,
+	.phy0_lanes_0_1_on_second_phy = true,
+	.supports_cphy = true,
+	.supports_phy_log = true,
+	.num_pipes = 2,
+	.pipe_hw_ids = { 1, 2 },
+	.num_phys = 2,
+	.phy_hw_ids = { 1, 2 },
+	.num_links = 2,
+};
+
+static const struct max9296a_chip_info max96792a_info = {
+	.max_register = 0x52d6,
+	.versions = BIT(MAX_GMSL_2) | BIT(MAX_GMSL_3),
+	.set_pipe_stream_id = max96714_set_pipe_stream_id,
+	.set_pipe_phy = max96716_set_pipe_phy,
+	.set_pipe_enable = max96714_set_pipe_enable,
+	.set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
+	.select_links = max9296a_select_links,
+	.select_link_version = max96792a_select_link_version,
+	.select_resets_link = true,
+	.phys_configs = {
+		.num_configs = ARRAY_SIZE(max9296a_phys_configs),
+		.configs = max9296a_phys_configs,
+	},
+	.has_per_link_reset = true,
+	.phy0_lanes_0_1_on_second_phy = true,
+	.supports_cphy = true,
+	.supports_phy_log = true,
+	.num_pipes = 2,
+	.pipe_hw_ids = { 1, 2 },
+	.num_phys = 2,
+	.phy_hw_ids = { 1, 2 },
+	.num_links = 2,
+};
+
+static const struct of_device_id max9296a_of_table[] = {
+	{ .compatible = "maxim,max9296a", .data = &max9296a_info },
+	{ .compatible = "maxim,max96714", .data = &max96714_info },
+	{ .compatible = "maxim,max96714f", .data = &max96714_info },
+	{ .compatible = "maxim,max96716a", .data = &max96716a_info },
+	{ .compatible = "maxim,max96792a", .data = &max96792a_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, max9296a_of_table);
+
+static struct i2c_driver max9296a_i2c_driver = {
+	.driver	= {
+		.name = "max9296a",
+		.of_match_table	= of_match_ptr(max9296a_of_table),
+	},
+	.probe = max9296a_probe,
+	.remove = max9296a_remove,
+};
+
+module_i2c_driver(max9296a_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim MAX9296A Quad GMSL2 Deserializer Driver");
+MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2c/maxim-serdes/max96717.c
new file mode 100644
index 000000000000..a3b7e5687e5d
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max96717.c
@@ -0,0 +1,1501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim MAX96717 GMSL2 Serializer Driver
+ *
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/regmap.h>
+
+#include "max_ser.h"
+
+#define MAX96717_REG0				0x0
+
+#define MAX96717_REG2				0x2
+#define MAX96717_REG2_VID_TX_EN_P(p)		BIT(4 + (p))
+
+#define MAX96717_REG3				0x3
+#define MAX96717_REG3_RCLKSEL			GENMASK(1, 0)
+#define MAX96717_REG3_RCLKSEL_REFERENCE_PLL	0b11
+
+#define MAX96717_REG6				0x6
+#define MAX96717_REG6_RCLKEN			BIT(5)
+
+#define MAX96717_I2C_2(x)			(0x42 + (x) * 0x2)
+#define MAX96717_I2C_2_SRC			GENMASK(7, 1)
+
+#define MAX96717_I2C_3(x)			(0x43 + (x) * 0x2)
+#define MAX96717_I2C_3_DST			GENMASK(7, 1)
+
+#define MAX96717_TX3(p)				(0x53 + (p) * 0x4)
+#define MAX96717_TX3_TX_STR_SEL			GENMASK(1, 0)
+
+#define MAX96717_VIDEO_TX0(p)			(0x100 + (p) * 0x8)
+#define MAX96717_VIDEO_TX0_AUTO_BPP		BIT(3)
+
+#define MAX96717_VIDEO_TX1(p)			(0x101 + (p) * 0x8)
+#define MAX96717_VIDEO_TX1_BPP			GENMASK(5, 0)
+
+#define MAX96717_VIDEO_TX2(p)			(0x102 + (p) * 0x8)
+#define MAX96717_VIDEO_TX2_PCLKDET		BIT(7)
+#define MAX96717_VIDEO_TX2_DRIFT_DET_EN		BIT(1)
+
+#define MAX96717_GPIO_A(x)			(0x2be + (x) * 0x3)
+#define MAX96717_GPIO_A_GPIO_OUT_DIS		BIT(0)
+#define MAX96717_GPIO_A_GPIO_TX_EN		BIT(1)
+#define MAX96717_GPIO_A_GPIO_RX_EN		BIT(2)
+#define MAX96717_GPIO_A_GPIO_IN			BIT(3)
+#define MAX96717_GPIO_A_GPIO_OUT		BIT(4)
+#define MAX96717_GPIO_A_TX_COMP_EN		BIT(5)
+#define MAX96717_GPIO_A_RES_CFG			BIT(7)
+
+#define MAX96717_GPIO_B(x)			(0x2bf + (x) * 0x3)
+#define MAX96717_GPIO_B_GPIO_TX_ID		GENMASK(4, 0)
+#define MAX96717_GPIO_B_OUT_TYPE		BIT(5)
+#define MAX96717_GPIO_B_PULL_UPDN_SEL		GENMASK(7, 6)
+#define MAX96717_GPIO_B_PULL_UPDN_SEL_NONE	0b00
+#define MAX96717_GPIO_B_PULL_UPDN_SEL_PU	0b01
+#define MAX96717_GPIO_B_PULL_UPDN_SEL_PD	0b10
+
+#define MAX96717_GPIO_C(x)			(0x2c0 + (x) * 0x3)
+#define MAX96717_GPIO_C_GPIO_RX_ID		GENMASK(4, 0)
+
+#define MAX96717_CMU2				0x302
+#define MAX96717_CMU2_PFDDIV_RSHORT		GENMASK(6, 4)
+#define MAX96717_CMU2_PFDDIV_RSHORT_1_1V	0b001
+
+#define MAX96717_FRONTTOP_0			0x308
+#define MAX96717_FRONTTOP_0_CLK_SEL_P(x)	BIT(x)
+#define MAX96717_FRONTTOP_0_START_PORT(x)	BIT((x) + 4)
+
+#define MAX96717_FRONTTOP_1(p)			(0x309 + (p) * 0x2)
+#define MAX96717_FRONTTOP_2(p)			(0x30a + (p) * 0x2)
+
+#define MAX96717_FRONTTOP_9			0x311
+#define MAX96717_FRONTTOP_9_START_PORT(p, x)	BIT((p) + (x) * 4)
+
+#define MAX96717_FRONTTOP_10			0x312
+#define MAX96717_FRONTTOP_10_BPP8DBL(p)		BIT(p)
+
+#define MAX96717_FRONTTOP_11			0x313
+#define MAX96717_FRONTTOP_11_BPP10DBL(p)	BIT(p)
+#define MAX96717_FRONTTOP_11_BPP12DBL(p)	BIT((p) + 4)
+
+#define MAX96717_FRONTTOP_12(p, x)		(0x314 + (p) * 0x2 + (x))
+#define MAX96717_MEM_DT_SEL			GENMASK(5, 0)
+#define MAX96717_MEM_DT_EN			BIT(6)
+
+#define MAX96717_FRONTTOP_20(p)			(0x31c + (p) * 0x1)
+#define MAX96717_FRONTTOP_20_SOFT_BPP_EN	BIT(5)
+#define MAX96717_FRONTTOP_20_SOFT_BPP		GENMASK(4, 0)
+
+#define MAX96717_MIPI_RX0			0x330
+#define MAX96717_MIPI_RX0_NONCONTCLK_EN		BIT(6)
+
+#define MAX96717_MIPI_RX1			0x331
+#define MAX96717_MIPI_RX1_CTRL_NUM_LANES	GENMASK(5, 4)
+
+#define MAX96717_MIPI_RX2			0x332
+#define MAX96717_MIPI_RX2_PHY1_LANE_MAP		GENMASK(7, 4)
+
+#define MAX96717_MIPI_RX3			0x333
+#define MAX96717_MIPI_RX3_PHY2_LANE_MAP		GENMASK(3, 0)
+
+#define MAX96717_MIPI_RX4			0x334
+#define MAX96717_MIPI_RX4_PHY1_POL_MAP		GENMASK(5, 4)
+
+#define MAX96717_MIPI_RX5			0x335
+#define MAX96717_MIPI_RX5_PHY2_POL_MAP		GENMASK(1, 0)
+#define MAX96717_MIPI_RX5_PHY2_POL_MAP_CLK	BIT(2)
+
+#define MAX96717_EXTA(x)			(0x3dc + (x))
+
+#define MAX96717_EXT11				0x383
+#define MAX96717_EXT11_TUN_MODE			BIT(7)
+
+#define MAX96717_EXT21				0x38d
+#define MAX96717_EXT22				0x38e
+#define MAX96717_EXT23				0x38f
+#define MAX96717_EXT24				0x390
+
+#define MAX96717_REF_VTG0			0x3f0
+#define MAX96717_REF_VTG0_REFGEN_EN		BIT(0)
+#define MAX96717_REF_VTG0_REFGEN_RST		BIT(1)
+#define MAX96717_REF_VTG0_REFGEN_PREDEF_FREQ_ALT\
+						BIT(3)
+#define MAX96717_REF_VTG0_REFGEN_PREDEF_FREQ	GENMASK(5, 4)
+#define MAX96717_REF_VTG0_REFGEN_PREDEF_EN	BIT(6)
+
+#define MAX96717_REF_VTG1			0x3f1
+#define MAX96717_REF_VTG1_PCLKEN		BIT(0)
+#define MAX96717_REF_VTG1_PCLK_GPIO		GENMASK(5, 1)
+#define MAX96717_REF_VTG1_RCLKEN_Y		BIT(7)
+
+#define MAX96717_PIO_SLEW_0			0x56f
+#define MAX96717_PIO_SLEW_0_PIO00_SLEW		GENMASK(1, 0)
+#define MAX96717_PIO_SLEW_0_PIO01_SLEW		GENMASK(3, 2)
+#define MAX96717_PIO_SLEW_0_PIO02_SLEW		GENMASK(5, 4)
+
+#define MAX96717_PIO_SLEW_1			0x570
+#define MAX96717_PIO_SLEW_1_PIO05_SLEW		GENMASK(3, 2)
+#define MAX96717_PIO_SLEW_1_PIO06_SLEW		GENMASK(5, 4)
+
+#define MAX96717_PIO_SLEW_2			0x571
+#define MAX96717_PIO_SLEW_2_PIO010_SLEW		GENMASK(5, 4)
+#define MAX96717_PIO_SLEW_2_PIO011_SLEW		GENMASK(7, 6)
+
+#define MAX96717_PIO_SLEW_FASTEST		0b00
+
+#define MAX96717_BIAS_PULL_STRENGTH_1000000_OHM	1000000U
+#define MAX96717_BIAS_PULL_STRENGTH_40000_OHM	40000U
+
+#define MAX96717_DEFAULT_CLKOUT_RATE		24000000UL
+
+#define MAX96717_NAME				"max96717"
+#define MAX96717_PINCTRL_NAME			MAX96717_NAME "-pinctrl"
+#define MAX96717_GPIOCHIP_NAME			MAX96717_NAME "-gpiochip"
+#define MAX96717_GPIO_NUM			11
+#define MAX96717_PIPES_NUM			4
+#define MAX96717_PHYS_NUM			2
+
+#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
+#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))
+
+struct max96717_priv {
+	struct max_ser ser;
+	struct pinctrl_desc pctldesc;
+	struct gpio_chip gc;
+	const struct max96717_chip_info *info;
+
+	struct device *dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct pinctrl_dev *pctldev;
+
+	struct clk_hw clk_hw;
+	u8 pll_predef_index;
+};
+
+struct max96717_chip_info {
+	bool supports_3_data_lanes;
+	bool supports_tunnel_mode;
+	bool supports_noncontinuous_clock;
+	bool supports_pkt_cnt;
+	unsigned int num_pipes;
+	unsigned int num_dts_per_pipe;
+	unsigned int pipe_hw_ids[MAX96717_PIPES_NUM];
+	unsigned int num_phys;
+	unsigned int phy_hw_ids[MAX96717_PHYS_NUM];
+};
+
+#define ser_to_priv(_ser) \
+	container_of(_ser, struct max96717_priv, ser)
+
+static inline struct max96717_priv *clk_hw_to_priv(struct clk_hw *hw)
+{
+	return container_of(hw, struct max96717_priv, clk_hw);
+}
+
+static const struct regmap_config max96717_i2c_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0x1f00,
+};
+
+static int max96717_wait_for_device(struct max96717_priv *priv)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < 10; i++) {
+		unsigned int val;
+
+		ret = regmap_read(priv->regmap, MAX96717_REG0, &val);
+		if (!ret && val)
+			return 0;
+
+		msleep(100);
+
+		dev_err(priv->dev, "Retry %u waiting for serializer: %d\n", i, ret);
+	}
+
+	return ret;
+}
+
+#define MAX96717_PIN(n) \
+	PINCTRL_PIN(n, "mfp" __stringify(n))
+
+static const struct pinctrl_pin_desc max96717_pins[] = {
+	MAX96717_PIN(0),
+	MAX96717_PIN(1),
+	MAX96717_PIN(2),
+	MAX96717_PIN(3),
+	MAX96717_PIN(4),
+	MAX96717_PIN(5),
+	MAX96717_PIN(6),
+	MAX96717_PIN(7),
+	MAX96717_PIN(8),
+	MAX96717_PIN(9),
+	MAX96717_PIN(10),
+};
+
+#define MAX96717_GROUP_PINS(name, ...) \
+	static const unsigned int name ## _pins[] = { __VA_ARGS__ }
+
+MAX96717_GROUP_PINS(mfp0, 0);
+MAX96717_GROUP_PINS(mfp1, 1);
+MAX96717_GROUP_PINS(mfp2, 2);
+MAX96717_GROUP_PINS(mfp3, 3);
+MAX96717_GROUP_PINS(mfp4, 4);
+MAX96717_GROUP_PINS(mfp5, 5);
+MAX96717_GROUP_PINS(mfp6, 6);
+MAX96717_GROUP_PINS(mfp7, 7);
+MAX96717_GROUP_PINS(mfp8, 8);
+MAX96717_GROUP_PINS(mfp9, 9);
+MAX96717_GROUP_PINS(mfp10, 10);
+
+#define MAX96717_GROUP(name) \
+	PINCTRL_PINGROUP(__stringify(name), name ## _pins, ARRAY_SIZE(name ## _pins))
+
+static const struct pingroup max96717_ctrl_groups[] = {
+	MAX96717_GROUP(mfp0),
+	MAX96717_GROUP(mfp1),
+	MAX96717_GROUP(mfp2),
+	MAX96717_GROUP(mfp3),
+	MAX96717_GROUP(mfp4),
+	MAX96717_GROUP(mfp5),
+	MAX96717_GROUP(mfp6),
+	MAX96717_GROUP(mfp7),
+	MAX96717_GROUP(mfp8),
+	MAX96717_GROUP(mfp9),
+	MAX96717_GROUP(mfp10),
+};
+
+#define MAX96717_FUNC_GROUPS(name, ...) \
+	static const char * const name ## _groups[] = { __VA_ARGS__ }
+
+MAX96717_FUNC_GROUPS(gpio, "mfp0", "mfp1", "mfp2", "mfp3", "mfp4", "mfp5",
+		     "mfp6", "mfp7", "mfp8", "mfp9", "mfp10");
+MAX96717_FUNC_GROUPS(rclkout, "mfp0", "mfp1", "mfp2", "mfp3", "mfp4",
+		     "mfp7", "mfp8");
+
+enum max96717_func {
+	max96717_func_gpio,
+	max96717_func_rclkout,
+};
+
+#define MAX96717_FUNC(name)						\
+	[max96717_func_ ## name] =					\
+		PINCTRL_PINFUNCTION(__stringify(name), name ## _groups,	\
+				    ARRAY_SIZE(name ## _groups))
+
+static const struct pinfunction max96717_functions[] = {
+	MAX96717_FUNC(gpio),
+	MAX96717_FUNC(rclkout),
+};
+
+#define MAX96717_PINCTRL_X(x)			(PIN_CONFIG_END + (x))
+#define MAX96717_PINCTRL_PULL_STRENGTH_HIGH	MAX96717_PINCTRL_X(1)
+#define MAX96717_PINCTRL_JITTER_COMPENSATION_EN	MAX96717_PINCTRL_X(2)
+#define MAX96717_PINCTRL_GMSL_TX_EN		MAX96717_PINCTRL_X(3)
+#define MAX96717_PINCTRL_GMSL_RX_EN		MAX96717_PINCTRL_X(4)
+#define MAX96717_PINCTRL_GMSL_TX_ID		MAX96717_PINCTRL_X(5)
+#define MAX96717_PINCTRL_GMSL_RX_ID		MAX96717_PINCTRL_X(6)
+#define MAX96717_PINCTRL_RCLKOUT_CLK		MAX96717_PINCTRL_X(7)
+#define MAX96717_PINCTRL_INPUT_VALUE		MAX96717_PINCTRL_X(8)
+
+static const struct pinconf_generic_params max96717_cfg_params[] = {
+	{ "maxim,jitter-compensation", MAX96717_PINCTRL_JITTER_COMPENSATION_EN, 0 },
+	{ "maxim,gmsl-tx", MAX96717_PINCTRL_GMSL_TX_EN, 0 },
+	{ "maxim,gmsl-rx", MAX96717_PINCTRL_GMSL_RX_EN, 0 },
+	{ "maxim,gmsl-tx-id", MAX96717_PINCTRL_GMSL_TX_ID, 0 },
+	{ "maxim,gmsl-rx-id", MAX96717_PINCTRL_GMSL_RX_ID, 0 },
+	{ "maxim,rclkout-clock", MAX96717_PINCTRL_RCLKOUT_CLK, 0 },
+};
+
+static int max96717_ctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(max96717_ctrl_groups);
+}
+
+static const char *max96717_ctrl_get_group_name(struct pinctrl_dev *pctldev,
+						unsigned int selector)
+{
+	return max96717_ctrl_groups[selector].name;
+}
+
+static int max96717_ctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					unsigned int selector,
+					const unsigned int **pins,
+					unsigned int *num_pins)
+{
+	*pins = (unsigned int *)max96717_ctrl_groups[selector].pins;
+	*num_pins = max96717_ctrl_groups[selector].npins;
+
+	return 0;
+}
+
+static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
+				       unsigned int *reg, unsigned int *mask,
+				       unsigned int *val)
+{
+	*reg = MAX96717_GPIO_A(offset);
+
+	switch (param) {
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		*mask = MAX96717_GPIO_A_GPIO_OUT_DIS;
+		*val = 0b0;
+		return 0;
+	case PIN_CONFIG_INPUT_ENABLE:
+		*mask = MAX96717_GPIO_A_GPIO_OUT_DIS;
+		*val = 0b1;
+		return 0;
+	case MAX96717_PINCTRL_GMSL_TX_EN:
+		*mask = MAX96717_GPIO_A_GPIO_TX_EN;
+		*val = 0b1;
+		return 0;
+	case MAX96717_PINCTRL_GMSL_RX_EN:
+		*mask = MAX96717_GPIO_A_GPIO_RX_EN;
+		*val = 0b1;
+		return 0;
+	case MAX96717_PINCTRL_INPUT_VALUE:
+		*mask = MAX96717_GPIO_A_GPIO_IN;
+		*val = 0b1;
+		return 0;
+	case PIN_CONFIG_OUTPUT:
+		*mask = MAX96717_GPIO_A_GPIO_OUT;
+		*val = 0b1;
+		return 0;
+	case MAX96717_PINCTRL_JITTER_COMPENSATION_EN:
+		*mask = MAX96717_GPIO_A_TX_COMP_EN;
+		*val = 0b1;
+		return 0;
+	case MAX96717_PINCTRL_PULL_STRENGTH_HIGH:
+		*mask = MAX96717_GPIO_A_RES_CFG;
+		*val = 0b1;
+		return 0;
+	}
+
+	*reg = MAX96717_GPIO_B(offset);
+
+	switch (param) {
+	case MAX96717_PINCTRL_GMSL_TX_ID:
+		*mask = MAX96717_GPIO_B_GPIO_TX_ID;
+		return 0;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		*mask = MAX96717_GPIO_B_OUT_TYPE;
+		*val = 0b0;
+		return 0;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		*mask = MAX96717_GPIO_B_OUT_TYPE;
+		*val = 0b1;
+		return 0;
+	case PIN_CONFIG_BIAS_DISABLE:
+		*mask = MAX96717_GPIO_B_PULL_UPDN_SEL;
+		*val = MAX96717_GPIO_B_PULL_UPDN_SEL_NONE;
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		*mask = MAX96717_GPIO_B_PULL_UPDN_SEL;
+		*val = MAX96717_GPIO_B_PULL_UPDN_SEL_PD;
+		return 0;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		*mask = MAX96717_GPIO_B_PULL_UPDN_SEL;
+		*val = MAX96717_GPIO_B_PULL_UPDN_SEL_PU;
+		return 0;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_SLEW_RATE:
+		if (offset < 3) {
+			*reg = MAX96717_PIO_SLEW_0;
+			if (offset == 0)
+				*mask = MAX96717_PIO_SLEW_0_PIO00_SLEW;
+			else if (offset == 1)
+				*mask = MAX96717_PIO_SLEW_0_PIO01_SLEW;
+			else
+				*mask = MAX96717_PIO_SLEW_0_PIO02_SLEW;
+		} else if (offset < 5) {
+			*reg = MAX96717_PIO_SLEW_1;
+			if (offset == 3)
+				*mask = MAX96717_PIO_SLEW_1_PIO05_SLEW;
+			else
+				*mask = MAX96717_PIO_SLEW_1_PIO06_SLEW;
+		} else if (offset < 7) {
+			return -EINVAL;
+		} else if (offset < 9) {
+			*reg  = MAX96717_PIO_SLEW_2;
+			if (offset == 7)
+				*mask = MAX96717_PIO_SLEW_2_PIO010_SLEW;
+			else
+				*mask = MAX96717_PIO_SLEW_2_PIO011_SLEW;
+		} else {
+			return -EINVAL;
+		}
+		return 0;
+	case MAX96717_PINCTRL_GMSL_RX_ID:
+		*reg = MAX96717_GPIO_C(offset);
+		*mask = MAX96717_GPIO_C_GPIO_RX_ID;
+		return 0;
+	case MAX96717_PINCTRL_RCLKOUT_CLK:
+		if (offset != 2 && offset != 4)
+			return -EINVAL;
+
+		*reg = MAX96717_REG3;
+		*mask = MAX96717_REG3_RCLKSEL;
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int max96717_conf_pin_config_get(struct pinctrl_dev *pctldev,
+					unsigned int offset,
+					unsigned long *config)
+{
+	struct max96717_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	u32 param = pinconf_to_config_param(*config);
+	unsigned int reg, mask, val, en_val;
+	int ret;
+
+	ret = max96717_get_pin_config_reg(offset, param, &reg, &mask, &en_val);
+	if (ret)
+		return ret;
+
+	switch (param) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case MAX96717_PINCTRL_JITTER_COMPENSATION_EN:
+	case MAX96717_PINCTRL_GMSL_TX_EN:
+	case MAX96717_PINCTRL_GMSL_RX_EN:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+	case PIN_CONFIG_INPUT_ENABLE:
+		ret = regmap_read(priv->regmap, reg, &val);
+		if (ret)
+			return ret;
+
+		val = field_get(mask, val) == en_val;
+		if (!val)
+			return -EINVAL;
+
+		break;
+	case MAX96717_PINCTRL_PULL_STRENGTH_HIGH:
+	case MAX96717_PINCTRL_INPUT_VALUE:
+	case PIN_CONFIG_OUTPUT:
+		ret = regmap_read(priv->regmap, reg, &val);
+		if (ret)
+			return ret;
+
+		val = field_get(mask, val) == en_val;
+		break;
+	case MAX96717_PINCTRL_GMSL_TX_ID:
+	case MAX96717_PINCTRL_GMSL_RX_ID:
+	case MAX96717_PINCTRL_RCLKOUT_CLK:
+	case PIN_CONFIG_SLEW_RATE:
+		ret = regmap_read(priv->regmap, reg, &val);
+		if (ret)
+			return ret;
+
+		val = field_get(mask, val);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		*config = pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIGH, 0);
+
+		ret = max96717_conf_pin_config_get(pctldev, offset, config);
+		if (ret)
+			return ret;
+
+		val = pinconf_to_config_argument(*config);
+		if (val)
+			val = MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
+		else
+			val = MAX96717_BIAS_PULL_STRENGTH_40000_OHM;
+
+		break;
+	default:
+		break;
+	}
+
+	*config = pinconf_to_config_packed(param, val);
+
+	return 0;
+}
+
+static int max96717_conf_pin_config_set_one(struct max96717_priv *priv,
+					    unsigned int offset,
+					    unsigned long config)
+{
+	u32 param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
+	unsigned int reg, mask, val, en_val;
+	int ret;
+
+	ret = max96717_get_pin_config_reg(offset, param, &reg, &mask, &en_val);
+	if (ret)
+		return ret;
+
+	switch (param) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		val = field_prep(mask, en_val);
+
+		ret = regmap_update_bits(priv->regmap, reg, mask, val);
+		break;
+	case MAX96717_PINCTRL_JITTER_COMPENSATION_EN:
+	case MAX96717_PINCTRL_PULL_STRENGTH_HIGH:
+	case MAX96717_PINCTRL_GMSL_TX_EN:
+	case MAX96717_PINCTRL_GMSL_RX_EN:
+	case PIN_CONFIG_OUTPUT_ENABLE:
+	case PIN_CONFIG_INPUT_ENABLE:
+	case PIN_CONFIG_OUTPUT:
+		val = field_prep(mask, arg ? en_val : ~en_val);
+
+		ret = regmap_update_bits(priv->regmap, reg, mask, val);
+		break;
+	case MAX96717_PINCTRL_GMSL_TX_ID:
+	case MAX96717_PINCTRL_GMSL_RX_ID:
+	case MAX96717_PINCTRL_RCLKOUT_CLK:
+	case PIN_CONFIG_SLEW_RATE:
+		val = field_prep(mask, arg);
+
+		ret = regmap_update_bits(priv->regmap, reg, mask, val);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	if (ret)
+		return ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = arg >= MAX96717_BIAS_PULL_STRENGTH_1000000_OHM;
+		config = pinconf_to_config_packed(MAX96717_PINCTRL_PULL_STRENGTH_HIGH, arg);
+		return max96717_conf_pin_config_set_one(priv, offset, config);
+	case PIN_CONFIG_OUTPUT:
+		config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 1);
+		return max96717_conf_pin_config_set_one(priv, offset, config);
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		config = pinconf_to_config_packed(MAX96717_PINCTRL_GMSL_RX_EN, 0);
+		return max96717_conf_pin_config_set_one(priv, offset, config);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int max96717_conf_pin_config_set(struct pinctrl_dev *pctldev,
+					unsigned int offset,
+					unsigned long *configs,
+					unsigned int num_configs)
+{
+	struct max96717_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	while (num_configs--) {
+		unsigned long config = *configs;
+
+		ret = max96717_conf_pin_config_set_one(priv, offset, config);
+		if (ret)
+			return ret;
+
+		configs++;
+	}
+
+	return 0;
+}
+
+static int max96717_mux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(max96717_functions);
+}
+
+static const char *max96717_mux_get_function_name(struct pinctrl_dev *pctldev,
+						  unsigned int selector)
+{
+	return max96717_functions[selector].name;
+}
+
+static int max96717_mux_get_groups(struct pinctrl_dev *pctldev,
+				   unsigned int selector,
+				   const char * const **groups,
+				   unsigned int * const num_groups)
+{
+	*groups = max96717_functions[selector].groups;
+	*num_groups = max96717_functions[selector].ngroups;
+
+	return 0;
+}
+
+static int max96717_mux_set_rclkout(struct max96717_priv *priv, unsigned int group)
+{
+	int ret;
+
+	/* Enable PCLK output. */
+	ret = regmap_set_bits(priv->regmap, MAX96717_REF_VTG1,
+			      MAX96717_REF_VTG1_PCLKEN);
+	if (ret)
+		return ret;
+
+	/* Set PCLK output to the RCLK pin. */
+	ret = regmap_update_bits(priv->regmap, MAX96717_REF_VTG1,
+				 MAX96717_REF_VTG1_PCLK_GPIO,
+				 FIELD_PREP(MAX96717_REF_VTG1_PCLK_GPIO, group));
+	if (ret)
+		return ret;
+
+	/* Enable RCLK output on PCLK. */
+	ret = regmap_set_bits(priv->regmap, MAX96717_REF_VTG1,
+			      MAX96717_REF_VTG1_RCLKEN_Y);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96717_mux_set(struct pinctrl_dev *pctldev, unsigned int selector,
+			    unsigned int group)
+{
+	struct max96717_priv *priv = pinctrl_dev_get_drvdata(pctldev);
+
+	switch (selector) {
+	case max96717_func_rclkout:
+		return max96717_mux_set_rclkout(priv, group);
+	}
+
+	return 0;
+}
+
+static int max96717_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	struct max96717_priv *priv = gpiochip_get_data(gc);
+	int ret;
+
+	ret = max96717_conf_pin_config_get(priv->pctldev, offset, &config);
+	if (ret)
+		return ret;
+
+	return pinconf_to_config_argument(config) ? GPIO_LINE_DIRECTION_OUT
+						  : GPIO_LINE_DIRECTION_IN;
+}
+
+static int max96717_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+	struct max96717_priv *priv = gpiochip_get_data(gc);
+
+	return max96717_conf_pin_config_set_one(priv, offset, config);
+}
+
+static int max96717_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
+					  int value)
+{
+	unsigned long config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+	struct max96717_priv *priv = gpiochip_get_data(gc);
+
+	return max96717_conf_pin_config_set_one(priv, offset, config);
+}
+
+static int max96717_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	unsigned long config = pinconf_to_config_packed(MAX96717_PINCTRL_INPUT_VALUE, 0);
+	struct max96717_priv *priv = gpiochip_get_data(gc);
+	int ret;
+
+	ret = max96717_conf_pin_config_get(priv->pctldev, offset, &config);
+	if (ret)
+		return ret;
+
+	return pinconf_to_config_argument(config);
+}
+
+static void max96717_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	unsigned long config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+	struct max96717_priv *priv = gpiochip_get_data(gc);
+	int ret;
+
+	ret = max96717_conf_pin_config_set_one(priv, offset, config);
+	if (ret)
+		dev_err(priv->dev, "Failed to set GPIO %u output value, err: %d\n",
+			offset, ret);
+}
+
+static unsigned int max96717_pipe_id(struct max96717_priv *priv,
+				     struct max_ser_pipe *pipe)
+{
+	return priv->info->pipe_hw_ids[pipe->index];
+}
+
+static unsigned int max96717_phy_id(struct max96717_priv *priv,
+				    struct max_ser_phy *phy)
+{
+	return priv->info->phy_hw_ids[phy->index];
+}
+
+static int max96717_set_pipe_enable(struct max_ser *ser,
+				    struct max_ser_pipe *pipe, bool enable)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	unsigned int mask = MAX96717_REG2_VID_TX_EN_P(index);
+
+	return regmap_assign_bits(priv->regmap, MAX96717_REG2, mask, enable);
+}
+
+static int max96717_reg_read(struct max_ser *ser, unsigned int reg,
+			     unsigned int *val)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+
+	return regmap_read(priv->regmap, reg, val);
+}
+
+static int max96717_reg_write(struct max_ser *ser, unsigned int reg,
+			      unsigned int val)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+
+	return regmap_write(priv->regmap, reg, val);
+}
+
+static int max96717_set_pipe_dt_en(struct max_ser *ser, struct max_ser_pipe *pipe,
+				   unsigned int i, bool enable)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	unsigned int reg;
+
+	if (i < 2)
+		reg = MAX96717_FRONTTOP_12(index, i);
+	else
+		/*
+		 * DT 7 and 8 are only supported on MAX96717, no need for pipe
+		 * index to be taken into account.
+		 */
+		reg = MAX96717_EXTA(i - 2);
+
+	return regmap_assign_bits(priv->regmap, reg, MAX96717_MEM_DT_EN, enable);
+}
+
+static int max96717_set_pipe_dt(struct max_ser *ser, struct max_ser_pipe *pipe,
+				unsigned int i, unsigned int dt)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	unsigned int reg;
+
+	if (i < 2)
+		reg = MAX96717_FRONTTOP_12(index,  i);
+	else
+		reg = MAX96717_EXTA(i - 2);
+
+	return regmap_update_bits(priv->regmap, reg, MAX96717_MEM_DT_SEL,
+				  FIELD_PREP(MAX96717_MEM_DT_SEL, dt));
+}
+
+static int max96717_set_pipe_vcs(struct max_ser *ser,
+				 struct max_ser_pipe *pipe,
+				 unsigned int vcs)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	int ret;
+
+	ret = regmap_write(priv->regmap, MAX96717_FRONTTOP_1(index),
+			   (vcs >> 0) & 0xff);
+	if (ret)
+		return ret;
+
+	return regmap_write(priv->regmap, MAX96717_FRONTTOP_2(index),
+			      (vcs >> 8) & 0xff);
+}
+
+static int max96717_log_status(struct max_ser *ser, const char *name)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int val;
+	int ret;
+
+	if (!priv->info->supports_tunnel_mode)
+		return 0;
+
+	ret = regmap_read(priv->regmap, MAX96717_EXT23, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: tun_pkt_cnt: %u\n", name, val);
+
+	return 0;
+}
+
+static int max96717_log_pipe_status(struct max_ser *ser,
+				    struct max_ser_pipe *pipe,
+				    const char *name)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MAX96717_VIDEO_TX2(index), &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tpclkdet: %u\n", name, !!(val & MAX96717_VIDEO_TX2_PCLKDET));
+
+	return 0;
+}
+
+static int max96717_log_phy_status(struct max_ser *ser,
+				   struct max_ser_phy *phy,
+				   const char *name)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int val;
+	int ret;
+
+	if (!priv->info->supports_pkt_cnt)
+		return 0;
+
+	ret = regmap_read(priv->regmap, MAX96717_EXT21, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tphy_pkt_cnt: %u\n", name, val);
+
+	ret = regmap_read(priv->regmap, MAX96717_EXT22, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tcsi_pkt_cnt: %u\n", name, val);
+
+	ret = regmap_read(priv->regmap, MAX96717_EXT24, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tphy_clk_cnt: %u\n", name, val);
+
+	return 0;
+}
+
+static int max96717_init_phy(struct max_ser *ser,
+			     struct max_ser_phy *phy)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
+	unsigned int used_data_lanes = 0;
+	unsigned int val;
+	unsigned int i;
+	int ret;
+
+	if (num_data_lanes == 3 && !priv->info->supports_3_data_lanes) {
+		dev_err(priv->dev, "Unsupported 3 data lane mode\n");
+		return -EINVAL;
+	}
+
+	/* Configure a lane count. */
+	ret = regmap_update_bits(priv->regmap, MAX96717_MIPI_RX1,
+				 MAX96717_MIPI_RX1_CTRL_NUM_LANES,
+				 FIELD_PREP(MAX96717_MIPI_RX1_CTRL_NUM_LANES,
+					    num_data_lanes - 1));
+	if (ret)
+		return ret;
+
+	/* Configure lane mapping. */
+	val = 0;
+	for (i = 0; i < 4; i++) {
+		unsigned int map;
+
+		if (i < num_data_lanes)
+			map = phy->mipi.data_lanes[i] - 1;
+		else
+			map = ffz(used_data_lanes);
+
+		val |= map << (i * 2);
+		used_data_lanes |= BIT(map);
+	}
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_MIPI_RX3,
+				 MAX96717_MIPI_RX3_PHY2_LANE_MAP,
+				 FIELD_PREP(MAX96717_MIPI_RX3_PHY2_LANE_MAP, val));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_MIPI_RX2,
+				 MAX96717_MIPI_RX2_PHY1_LANE_MAP,
+				 FIELD_PREP(MAX96717_MIPI_RX2_PHY1_LANE_MAP, val >> 4));
+	if (ret)
+		return ret;
+
+	/* Configure lane polarity. */
+	val = 0;
+	for (i = 0; i < num_data_lanes; i++)
+		if (phy->mipi.lane_polarities[i + 1])
+			val |= BIT(i);
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_MIPI_RX5,
+				 MAX96717_MIPI_RX5_PHY2_POL_MAP,
+				 FIELD_PREP(MAX96717_MIPI_RX5_PHY2_POL_MAP, val));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_MIPI_RX4,
+				 MAX96717_MIPI_RX4_PHY1_POL_MAP,
+				 FIELD_PREP(MAX96717_MIPI_RX4_PHY1_POL_MAP, val >> 2));
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_MIPI_RX5,
+				 MAX96717_MIPI_RX5_PHY2_POL_MAP_CLK,
+				 phy->mipi.lane_polarities[0]);
+	if (ret)
+		return ret;
+
+	if (priv->info->supports_noncontinuous_clock) {
+		ret = regmap_assign_bits(priv->regmap, MAX96717_MIPI_RX0,
+					 MAX96717_MIPI_RX0_NONCONTCLK_EN,
+					 phy->mipi.flags &
+					 V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max96717_set_phy_active(struct max_ser *ser, struct max_ser_phy *phy,
+				   bool enable)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_phy_id(priv, phy);
+
+	return regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_0,
+				  MAX96717_FRONTTOP_0_START_PORT(index), enable);
+}
+
+static int max96717_set_pipe_stream_id(struct max_ser *ser,
+				       struct max_ser_pipe *pipe,
+				       unsigned int stream_id)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+
+	return regmap_update_bits(priv->regmap, MAX96717_TX3(index),
+				  MAX96717_TX3_TX_STR_SEL,
+				  FIELD_PREP(MAX96717_TX3_TX_STR_SEL, stream_id));
+}
+
+static int max96717_set_pipe_phy(struct max_ser *ser, struct max_ser_pipe *pipe,
+				 struct max_ser_phy *phy)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	unsigned int phy_id = max96717_phy_id(priv, phy);
+	int ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_0,
+				 MAX96717_FRONTTOP_0_CLK_SEL_P(index),
+				 phy_id == 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_9,
+				 MAX96717_FRONTTOP_9_START_PORT(index, 0),
+				 phy_id == 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_9,
+				 MAX96717_FRONTTOP_9_START_PORT(index, 1),
+				 phy_id == 1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96717_set_pipe_mode(struct max_ser *ser,
+				  struct max_ser_pipe *pipe,
+				  struct max_ser_pipe_mode *mode)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	unsigned int index = max96717_pipe_id(priv, pipe);
+	int ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_VIDEO_TX0(index),
+				 MAX96717_VIDEO_TX0_AUTO_BPP, !mode->bpp);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_VIDEO_TX1(index),
+				 MAX96717_VIDEO_TX1_BPP,
+				 FIELD_PREP(MAX96717_VIDEO_TX1_BPP, mode->bpp));
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_VIDEO_TX2(index),
+				 MAX96717_VIDEO_TX2_DRIFT_DET_EN, !mode->bpp);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_10,
+				 MAX96717_FRONTTOP_10_BPP8DBL(index),
+				 mode->dbl8);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_11,
+				 MAX96717_FRONTTOP_11_BPP10DBL(index),
+				 mode->dbl10);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96717_FRONTTOP_11,
+				 MAX96717_FRONTTOP_11_BPP12DBL(index),
+				 mode->dbl12);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_FRONTTOP_20(index),
+				 MAX96717_FRONTTOP_20_SOFT_BPP |
+				 MAX96717_FRONTTOP_20_SOFT_BPP_EN,
+				 FIELD_PREP(MAX96717_FRONTTOP_20_SOFT_BPP,
+					    mode->soft_bpp) |
+				 FIELD_PREP(MAX96717_FRONTTOP_20_SOFT_BPP_EN,
+					    !!mode->soft_bpp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96717_set_i2c_xlate(struct max_ser *ser, unsigned int i,
+				  struct max_i2c_xlate *xlate)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_I2C_2(i),
+				 MAX96717_I2C_2_SRC,
+				 FIELD_PREP(MAX96717_I2C_2_SRC, xlate->src));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96717_I2C_3(i),
+				 MAX96717_I2C_3_DST,
+				 FIELD_PREP(MAX96717_I2C_3_DST, xlate->dst));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96717_set_tunnel_enable(struct max_ser *ser, bool enable)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+
+	return regmap_assign_bits(priv->regmap, MAX96717_EXT11,
+				  MAX96717_EXT11_TUN_MODE, enable);
+}
+
+static const struct max_phys_config max96717_phys_configs[] = {
+	{ { 4 } },
+};
+
+static int max96717_init(struct max_ser *ser)
+{
+	struct max96717_priv *priv = ser_to_priv(ser);
+	int ret;
+
+	/*
+	 * Set CMU2 PFDDIV to 1.1V for correct functionality of the device,
+	 * as mentioned in the datasheet, under section MANDATORY REGISTER PROGRAMMING.
+	 */
+	ret = regmap_update_bits(priv->regmap, MAX96717_CMU2,
+				 MAX96717_CMU2_PFDDIV_RSHORT,
+				 FIELD_PREP(MAX96717_CMU2_PFDDIV_RSHORT,
+					    MAX96717_CMU2_PFDDIV_RSHORT_1_1V));
+	if (ret)
+		return ret;
+
+	if (ser->ops->set_tunnel_enable) {
+		ret = ser->ops->set_tunnel_enable(ser, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinctrl_ops max96717_ctrl_ops = {
+	.get_groups_count = max96717_ctrl_get_groups_count,
+	.get_group_name = max96717_ctrl_get_group_name,
+	.get_group_pins = max96717_ctrl_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static const struct pinconf_ops max96717_conf_ops = {
+	.pin_config_get = max96717_conf_pin_config_get,
+	.pin_config_set = max96717_conf_pin_config_set,
+	.is_generic = true,
+};
+
+static const struct pinmux_ops max96717_mux_ops = {
+	.get_functions_count = max96717_mux_get_functions_count,
+	.get_function_name = max96717_mux_get_function_name,
+	.get_function_groups = max96717_mux_get_groups,
+	.set_mux = max96717_mux_set,
+};
+
+static const struct max_ser_ops max96717_ops = {
+	.num_i2c_xlates = 2,
+	.phys_configs = {
+		.num_configs = ARRAY_SIZE(max96717_phys_configs),
+		.configs = max96717_phys_configs,
+	},
+	.reg_read = max96717_reg_read,
+	.reg_write = max96717_reg_write,
+	.log_status = max96717_log_status,
+	.log_pipe_status = max96717_log_pipe_status,
+	.log_phy_status = max96717_log_phy_status,
+	.init = max96717_init,
+	.set_i2c_xlate = max96717_set_i2c_xlate,
+	.init_phy = max96717_init_phy,
+	.set_phy_active = max96717_set_phy_active,
+	.set_pipe_enable = max96717_set_pipe_enable,
+	.set_pipe_dt = max96717_set_pipe_dt,
+	.set_pipe_dt_en = max96717_set_pipe_dt_en,
+	.set_pipe_vcs = max96717_set_pipe_vcs,
+	.set_pipe_mode = max96717_set_pipe_mode,
+	.set_pipe_stream_id = max96717_set_pipe_stream_id,
+	.set_pipe_phy = max96717_set_pipe_phy,
+};
+
+struct max96717_pll_predef_freq {
+	unsigned long freq;
+	bool is_alt;
+	u8 val;
+};
+
+static const struct max96717_pll_predef_freq max96717_predef_freqs[] = {
+	{ 13500000, true,  0 }, { 19200000, false, 0 },
+	{ 24000000, true,  1 }, { 27000000, false, 1 },
+	{ 37125000, false, 2 }, { 74250000, false, 3 },
+};
+
+static unsigned long
+max96717_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct max96717_priv *priv = clk_hw_to_priv(hw);
+
+	return max96717_predef_freqs[priv->pll_predef_index].freq;
+}
+
+static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
+						 unsigned long rate)
+{
+	unsigned int i, idx = 0;
+	unsigned long diff_new, diff_old = U32_MAX;
+
+	for (i = 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
+		diff_new = abs(rate - max96717_predef_freqs[i].freq);
+		if (diff_new < diff_old) {
+			diff_old = diff_new;
+			idx = i;
+		}
+	}
+
+	return idx;
+}
+
+static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	struct max96717_priv *priv = clk_hw_to_priv(hw);
+	struct device *dev = &priv->client->dev;
+	unsigned int idx;
+
+	idx = max96717_clk_find_best_index(priv, rate);
+
+	if (rate != max96717_predef_freqs[idx].freq) {
+		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
+			 rate, max96717_predef_freqs[idx].freq);
+	}
+
+	return max96717_predef_freqs[idx].freq;
+}
+
+static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct max96717_priv *priv = clk_hw_to_priv(hw);
+	unsigned int val, idx;
+	int ret = 0;
+
+	idx = max96717_clk_find_best_index(priv, rate);
+
+	val = FIELD_PREP(MAX96717_REF_VTG0_REFGEN_PREDEF_FREQ,
+			 max96717_predef_freqs[idx].val);
+
+	if (max96717_predef_freqs[idx].is_alt)
+		val |= MAX96717_REF_VTG0_REFGEN_PREDEF_FREQ_ALT;
+
+	val |= MAX96717_REF_VTG0_REFGEN_RST | MAX96717_REF_VTG0_REFGEN_EN;
+
+	ret = regmap_write(priv->regmap, MAX96717_REF_VTG0, val);
+	if (ret)
+		return ret;
+
+	ret = regmap_clear_bits(priv->regmap, MAX96717_REF_VTG0,
+				MAX96717_REF_VTG0_REFGEN_RST);
+	if (ret)
+		return ret;
+
+	priv->pll_predef_index = idx;
+
+	return 0;
+}
+
+static int max96717_clk_prepare(struct clk_hw *hw)
+{
+	struct max96717_priv *priv = clk_hw_to_priv(hw);
+
+	return regmap_set_bits(priv->regmap, MAX96717_REG6, MAX96717_REG6_RCLKEN);
+}
+
+static void max96717_clk_unprepare(struct clk_hw *hw)
+{
+	struct max96717_priv *priv = clk_hw_to_priv(hw);
+
+	regmap_clear_bits(priv->regmap, MAX96717_REG6, MAX96717_REG6_RCLKEN);
+}
+
+static const struct clk_ops max96717_clk_ops = {
+	.prepare     = max96717_clk_prepare,
+	.unprepare   = max96717_clk_unprepare,
+	.set_rate    = max96717_clk_set_rate,
+	.recalc_rate = max96717_clk_recalc_rate,
+	.round_rate  = max96717_clk_round_rate,
+};
+
+static int max96717_register_clkout(struct max96717_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct clk_init_data init = { .ops = &max96717_clk_ops };
+	unsigned long config;
+	int ret;
+
+	config = pinconf_to_config_packed(MAX96717_PINCTRL_RCLKOUT_CLK,
+					  MAX96717_REG3_RCLKSEL_REFERENCE_PLL);
+	ret = max96717_conf_pin_config_set_one(priv, 4, config);
+	if (ret)
+		return ret;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_SLEW_RATE,
+					  MAX96717_PIO_SLEW_FASTEST);
+	ret = max96717_conf_pin_config_set_one(priv, 4, config);
+	if (ret)
+		return ret;
+
+	init.name = kasprintf(GFP_KERNEL, "max96717.%s.clk_out", dev_name(dev));
+	if (!init.name)
+		return -ENOMEM;
+
+	priv->clk_hw.init = &init;
+
+	ret = max96717_clk_set_rate(&priv->clk_hw,
+				    MAX96717_DEFAULT_CLKOUT_RATE, 0);
+	if (ret)
+		goto free_init_name;
+
+	ret = devm_clk_hw_register(dev, &priv->clk_hw);
+	kfree(init.name);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register clock HW\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &priv->clk_hw);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Cannot add OF clock provider\n");
+
+	return 0;
+
+free_init_name:
+	kfree(init.name);
+	return ret;
+}
+
+static int max96717_gpiochip_probe(struct max96717_priv *priv)
+{
+	struct device *dev = priv->dev;
+	int ret;
+
+	priv->pctldesc = (struct pinctrl_desc) {
+		.owner = THIS_MODULE,
+		.name = MAX96717_PINCTRL_NAME,
+		.pins = max96717_pins,
+		.npins = ARRAY_SIZE(max96717_pins),
+		.pctlops = &max96717_ctrl_ops,
+		.confops = &max96717_conf_ops,
+		.pmxops = &max96717_mux_ops,
+		.custom_params = max96717_cfg_params,
+		.num_custom_params = ARRAY_SIZE(max96717_cfg_params),
+	};
+
+	ret = devm_pinctrl_register_and_init(dev, &priv->pctldesc, priv, &priv->pctldev);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_enable(priv->pctldev);
+	if (ret)
+		return ret;
+
+	priv->gc = (struct gpio_chip) {
+		.owner = THIS_MODULE,
+		.label = MAX96717_GPIOCHIP_NAME,
+		.base = -1,
+		.ngpio = MAX96717_GPIO_NUM,
+		.parent = dev,
+		.can_sleep = true,
+		.request = gpiochip_generic_request,
+		.free = gpiochip_generic_free,
+		.set_config = gpiochip_generic_config,
+		.get_direction = max96717_gpio_get_direction,
+		.direction_input = max96717_gpio_direction_input,
+		.direction_output = max96717_gpio_direction_output,
+		.get = max96717_gpio_get,
+		.set = max96717_gpio_set,
+	};
+
+	return devm_gpiochip_add_data(dev, &priv->gc, priv);
+}
+
+static int max96717_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max96717_priv *priv;
+	struct max_ser_ops *ops;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return -ENOMEM;
+
+	priv->info = device_get_match_data(dev);
+	if (!priv->info) {
+		dev_err(dev, "Failed to get match data\n");
+		return -ENODEV;
+	}
+
+	priv->dev = dev;
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	priv->regmap = devm_regmap_init_i2c(client, &max96717_i2c_regmap);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	*ops = max96717_ops;
+
+	if (priv->info->supports_tunnel_mode)
+		ops->set_tunnel_enable = max96717_set_tunnel_enable;
+
+	ops->supports_noncontinuous_clock = priv->info->supports_noncontinuous_clock;
+	ops->num_pipes = priv->info->num_pipes;
+	ops->num_dts_per_pipe = priv->info->num_dts_per_pipe;
+	ops->num_phys = priv->info->num_phys;
+	priv->ser.ops = ops;
+
+	ret = max96717_wait_for_device(priv);
+	if (ret)
+		return ret;
+
+	ret = max96717_gpiochip_probe(priv);
+	if (ret)
+		return ret;
+
+	ret = max96717_register_clkout(priv);
+	if (ret)
+		return ret;
+
+	return max_ser_probe(client, &priv->ser);
+}
+
+static void max96717_remove(struct i2c_client *client)
+{
+	struct max96717_priv *priv = i2c_get_clientdata(client);
+
+	max_ser_remove(&priv->ser);
+}
+
+static const struct max96717_chip_info max9295a_info = {
+	.num_pipes = 4,
+	.num_dts_per_pipe = 2,
+	.pipe_hw_ids = { 0, 1, 2, 3 },
+	.num_phys = 1,
+	.phy_hw_ids = { 1 },
+};
+
+static const struct max96717_chip_info max96717_info = {
+	.supports_3_data_lanes = true,
+	.supports_pkt_cnt = true,
+	.supports_tunnel_mode = true,
+	.supports_noncontinuous_clock = true,
+	.num_pipes = 1,
+	.num_dts_per_pipe = 4,
+	.pipe_hw_ids = { 2 },
+	.num_phys = 1,
+	.phy_hw_ids = { 1 },
+};
+
+static const struct of_device_id max96717_of_ids[] = {
+	{ .compatible = "maxim,max9295a", .data = &max9295a_info },
+	{ .compatible = "maxim,max96717", .data = &max96717_info },
+	{ .compatible = "maxim,max96717f", .data = &max96717_info },
+	{ .compatible = "maxim,max96793", .data = &max96717_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max96717_of_ids);
+
+static struct i2c_driver max96717_i2c_driver = {
+	.driver	= {
+		.name = MAX96717_NAME,
+		.of_match_table = max96717_of_ids,
+	},
+	.probe = max96717_probe,
+	.remove = max96717_remove,
+};
+
+module_i2c_driver(max96717_i2c_driver);
+
+MODULE_DESCRIPTION("MAX96717 GMSL2 Serializer Driver");
+MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/maxim-serdes/max96724.c b/drivers/media/i2c/maxim-serdes/max96724.c
new file mode 100644
index 000000000000..d60dbfff2f2b
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max96724.c
@@ -0,0 +1,905 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim MAX96724 Quad GMSL2 Deserializer Driver
+ *
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+
+#include "max_des.h"
+
+#define MAX96724_REG0				0x0
+
+#define MAX96724_REG3				0x3
+#define MAX96724_REG3_DIS_REM_CC_0(x)		(BIT(0) << (2 * (x)))
+
+#define MAX96724_REG6				0x6
+#define MAX96724_REG6_LINK_EN			GENMASK(3, 0)
+
+#define MAX96724_PWR1				0x13
+#define MAX96724_PWR1_RESET_ALL			BIT(6)
+
+#define MAX96724_VIDEO_PIPE_SEL(p)		(0xf0 + (p) / 2)
+#define MAX96724_VIDEO_PIPE_SEL_STREAM(p)	(GENMASK(1, 0) << (4 * ((p) % 2)))
+
+#define MAX96724_VIDEO_PIPE_EN			0xf4
+#define MAX96724_VIDEO_PIPE_EN_MASK(p)		BIT(p)
+#define MAX96724_VIDEO_PIPE_EN_STREAM_SEL_ALL	BIT(4)
+
+#define MAX96724_VPRBS(p)			(0x1dc + (p) * 0x20)
+#define MAX96724_VPRBS_VIDEO_LOCK		BIT(0)
+
+#define MAX96724_BACKTOP12			0x40b
+#define MAX96724_BACKTOP12_CSI_OUT_EN		BIT(1)
+
+#define MAX96724_BACKTOP21			0x414
+#define MAX96724_BACKTOP21_BPP8DBL(p)		BIT(4 + (p))
+
+#define MAX96724_BACKTOP22(x)			(0x415 * (x) * 0x3)
+#define MAX96724_BACKTOP22_PHY_CSI_TX_DPLL	GENMASK(4, 0)
+#define MAX96724_BACKTOP22_PHY_CSI_TX_DPLL_EN	BIT(5)
+
+#define MAX96724_BACKTOP24			0x417
+#define MAX96724_BACKTOP24_BPP8DBL_MODE(p)	BIT(4 + (p))
+
+#define MAX96724_BACKTOP30			0x41d
+#define MAX96724_BACKTOP30_BPP10DBL3		BIT(4)
+#define MAX96724_BACKTOP30_BPP10DBL3_MODE	BIT(5)
+
+#define MAX96724_BACKTOP31			0x41e
+#define MAX96724_BACKTOP31_BPP10DBL2		BIT(6)
+#define MAX96724_BACKTOP31_BPP10DBL2_MODE	BIT(7)
+
+#define MAX96724_BACKTOP32			0x41f
+#define MAX96724_BACKTOP32_BPP12(p)		BIT(p)
+#define MAX96724_BACKTOP32_BPP10DBL0		BIT(4)
+#define MAX96724_BACKTOP32_BPP10DBL0_MODE	BIT(5)
+#define MAX96724_BACKTOP32_BPP10DBL1		BIT(6)
+#define MAX96724_BACKTOP32_BPP10DBL1_MODE	BIT(7)
+
+#define MAX96724_MIPI_PHY0			0x8a0
+#define MAX96724_MIPI_PHY0_PHY_CONFIG		GENMASK(4, 0)
+#define MAX96724_MIPI_PHY0_PHY_4X2		BIT(0)
+#define MAX96724_MIPI_PHY0_PHY_2X4		BIT(2)
+#define MAX96724_MIPI_PHY0_PHY_1X4A_2X2		BIT(3)
+#define MAX96724_MIPI_PHY0_PHY_1X4B_2X2		BIT(4)
+
+#define MAX96724_MIPI_PHY2			0x8a2
+#define MAX96724_MIPI_PHY2_PHY_STDB_N_4(x)	(GENMASK(5, 4) << ((x) / 2 * 2))
+#define MAX96724_MIPI_PHY2_PHY_STDB_N_2(x)	(BIT(4 + (x)))
+
+#define MAX96724_MIPI_PHY3(x)			(0x8a3 + (x) / 2)
+#define MAX96724_MIPI_PHY3_PHY_LANE_MAP_4	GENMASK(7, 0)
+#define MAX96724_MIPI_PHY3_PHY_LANE_MAP_2(x)	(GENMASK(3, 0) << (4 * ((x) % 2)))
+
+#define MAX96724_MIPI_PHY5(x)			(0x8a5 + (x) / 2)
+#define MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1	GENMASK(1, 0)
+#define MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3	GENMASK(4, 3)
+#define MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK	BIT(5)
+#define MAX96724_MIPI_PHY5_PHY_POL_MAP_2(x)	(GENMASK(1, 0) << (3 * ((x) % 2)))
+#define MAX96724_MIPI_PHY5_PHY_POL_MAP_2_CLK(x)	BIT(2 + 3 * ((x) % 2))
+
+#define MAX96724_MIPI_PHY13			0x8ad
+#define MAX96724_MIPI_PHY13_T_T3_PREBEGIN	GENMASK(5, 0)
+#define MAX96724_MIPI_PHY13_T_T3_PREBEGIN_64X7	FIELD_PREP(MAX96724_MIPI_PHY13_T_T3_PREBEGIN, 63)
+
+#define MAX96724_MIPI_PHY14			0x8ae
+#define MAX96724_MIPI_PHY14_T_T3_PREP		GENMASK(1, 0)
+#define MAX96724_MIPI_PHY14_T_T3_PREP_55NS	FIELD_PREP(MAX96724_MIPI_PHY14_T_T3_PREP, 0b01)
+#define MAX96724_MIPI_PHY14_T_T3_POST		GENMASK(6, 2)
+#define MAX96724_MIPI_PHY14_T_T3_POST_32X7	FIELD_PREP(MAX96724_MIPI_PHY14_T_T3_POST, 31)
+
+#define MAX96724_MIPI_CTRL_SEL			0x8ca
+#define MAX96724_MIPI_CTRL_SEL_MASK(p)		(GENMASK(1, 0) << ((p) * 2))
+
+#define MAX96724_MIPI_PHY25(x)			(0x8d0 + (x) / 2)
+#define MAX96724_MIPI_PHY25_CSI2_TX_PKT_CNT(x)	(GENMASK(3, 0) << (4 * ((x) % 2)))
+
+#define MAX96724_MIPI_PHY27(x)			(0x8d2 + (x) / 2)
+#define MAX96724_MIPI_PHY27_PHY_PKT_CNT(x)	(GENMASK(3, 0) << (4 * ((x) % 2)))
+
+#define MAX96724_MIPI_TX3(x)			(0x903 + (x) * 0x40)
+#define MAX96724_MIPI_TX3_DESKEW_INIT_8X32K	FIELD_PREP(GENMASK(2, 0), 0b001)
+#define MAX96724_MIPI_TX3_DESKEW_INIT_AUTO	BIT(7)
+
+#define MAX96724_MIPI_TX4(x)			(0x904 + (x) * 0x40)
+#define MAX96724_MIPI_TX4_DESKEW_PER_2K		FIELD_PREP(GENMASK(2, 0), 0b001)
+#define MAX96724_MIPI_TX4_DESKEW_PER_AUTO	BIT(7)
+
+#define MAX96724_MIPI_TX10(x)			(0x90a + (x) * 0x40)
+#define MAX96724_MIPI_TX10_CSI2_CPHY_EN		BIT(5)
+#define MAX96724_MIPI_TX10_CSI2_LANE_CNT	GENMASK(7, 6)
+
+#define MAX96724_MIPI_TX11(p)			(0x90b + (p) * 0x40)
+#define MAX96724_MIPI_TX12(p)			(0x90c + (p) * 0x40)
+
+#define MAX96724_MIPI_TX13(p, x)		(0x90d + (p) * 0x40 + (x) * 0x2)
+#define MAX96724_MIPI_TX13_MAP_SRC_DT		GENMASK(5, 0)
+#define MAX96724_MIPI_TX13_MAP_SRC_VC		GENMASK(7, 6)
+
+#define MAX96724_MIPI_TX14(p, x)		(0x90e + (p) * 0x40 + (x) * 0x2)
+#define MAX96724_MIPI_TX14_MAP_DST_DT		GENMASK(5, 0)
+#define MAX96724_MIPI_TX14_MAP_DST_VC		GENMASK(7, 6)
+
+#define MAX96724_MIPI_TX45(p, x)		(0x92d + (p) * 0x40 + (x) / 4)
+#define MAX96724_MIPI_TX45_MAP_DPHY_DEST(x)	(GENMASK(1, 0) << (2 * ((x) % 4)))
+
+#define MAX96724_MIPI_TX51(x)			(0x933 + (x) * 0x40)
+#define MAX96724_MIPI_TX51_ALT_MEM_MAP_12	BIT(0)
+#define MAX96724_MIPI_TX51_ALT_MEM_MAP_8	BIT(1)
+#define MAX96724_MIPI_TX51_ALT_MEM_MAP_10	BIT(2)
+#define MAX96724_MIPI_TX51_ALT2_MEM_MAP_8	BIT(4)
+
+#define MAX96724_MIPI_TX54(x)			(0x936 + (x) * 0x40)
+#define MAX96724_MIPI_TX54_TUN_EN		BIT(0)
+
+#define MAX96724_MIPI_TX57(x)			(0x939 + (x) * 0x40)
+#define MAX96724_MIPI_TX57_TUN_DEST		GENMASK(5, 4)
+#define MAX96724_MIPI_TX57_DIS_AUTO_TUN_DET	BIT(6)
+
+#define MAX96724_DE_DET				0x11f0
+#define MAX96724_HS_DET				0x11f1
+#define MAX96724_VS_DET				0x11f2
+#define MAX96724_HS_POL				0x11f3
+#define MAX96724_VS_POL				0x11f4
+#define MAX96724_DET(p)				BIT(p)
+
+#define MAX96724_DPLL_0(x)			(0x1c00 + (x) * 0x100)
+#define MAX96724_DPLL_0_CONFIG_SOFT_RST_N	BIT(0)
+
+#define MAX96724_PHY1_ALT_CLOCK		5
+
+#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
+#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))
+
+static const struct regmap_config max96724_i2c_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0x1f00,
+};
+
+struct max96724_priv {
+	struct max_des des;
+	const struct max96724_chip_info *info;
+
+	struct device *dev;
+	struct i2c_client *client;
+	struct regmap *regmap;
+
+	struct gpio_desc *gpiod_pwdn;
+};
+
+struct max96724_chip_info {
+	bool supports_pipe_stream_autoselect;
+	unsigned int num_pipes;
+};
+
+#define des_to_priv(_des) \
+	container_of(_des, struct max96724_priv, des)
+
+static int max96724_wait_for_device(struct max96724_priv *priv)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < 10; i++) {
+		unsigned int val;
+
+		ret = regmap_read(priv->regmap, MAX96724_REG0, &val);
+		if (!ret && val)
+			return 0;
+
+		msleep(100);
+
+		dev_err(priv->dev, "Retry %u waiting for deserializer: %d\n", i, ret);
+	}
+
+	return ret;
+}
+
+static int max96724_reset(struct max96724_priv *priv)
+{
+	int ret;
+
+	ret = max96724_wait_for_device(priv);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96724_PWR1,
+				 MAX96724_PWR1_RESET_ALL,
+				 FIELD_PREP(MAX96724_PWR1_RESET_ALL, 1));
+	if (ret)
+		return ret;
+
+	fsleep(10000);
+
+	ret = max96724_wait_for_device(priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96724_reg_read(struct max_des *des, unsigned int reg,
+			     unsigned int *val)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+
+	return regmap_read(priv->regmap, reg, val);
+}
+
+static int max96724_reg_write(struct max_des *des, unsigned int reg,
+			      unsigned int val)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+
+	return regmap_write(priv->regmap, reg, val);
+}
+
+static unsigned int max96724_phy_id(struct max_des *des, struct max_des_phy *phy)
+{
+	unsigned int num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
+
+	/* PHY 1 is the master PHY when combining PHY 0 and PHY 1. */
+	if (phy->index == 0 && num_hw_data_lanes == 4)
+		return 1;
+
+	return phy->index;
+}
+
+static int max96724_log_pipe_status(struct max_des *des,
+				    struct max_des_pipe *pipe, const char *name)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = pipe->index;
+	unsigned int val, mask;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MAX96724_VPRBS(index), &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tvideo_lock: %u\n", name,
+		!!(val & MAX96724_VPRBS_VIDEO_LOCK));
+
+	mask = MAX96724_DET(index);
+
+	ret = regmap_read(priv->regmap, MAX96724_DE_DET, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tde_det: %u\n", name, !!(val & mask));
+
+	ret = regmap_read(priv->regmap, MAX96724_HS_DET, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \ths_det: %u\n", name, !!(val & mask));
+
+	ret = regmap_read(priv->regmap, MAX96724_VS_DET, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tvs_det: %u\n", name, !!(val & mask));
+
+	ret = regmap_read(priv->regmap, MAX96724_HS_POL, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \ths_pol: %u\n", name, !!(val & mask));
+
+	ret = regmap_read(priv->regmap, MAX96724_VS_POL, &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tvs_pol: %u\n", name, !!(val & mask));
+
+	return 0;
+}
+
+static int max96724_log_phy_status(struct max_des *des,
+				   struct max_des_phy *phy, const char *name)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = max96724_phy_id(des, phy);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MAX96724_MIPI_PHY25(index), &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tcsi2_pkt_cnt: %lu\n", name,
+		field_get(MAX96724_MIPI_PHY25_CSI2_TX_PKT_CNT(index), val));
+
+	ret = regmap_read(priv->regmap, MAX96724_MIPI_PHY27(index), &val);
+	if (ret)
+		return ret;
+
+	pr_info("%s: \tphy_pkt_cnt: %lu\n", name,
+		field_get(MAX96724_MIPI_PHY27_PHY_PKT_CNT(index), val));
+
+	return 0;
+}
+
+static int max96724_set_enable(struct max_des *des, bool enable)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+
+	return regmap_assign_bits(priv->regmap, MAX96724_BACKTOP12,
+				  MAX96724_BACKTOP12_CSI_OUT_EN, enable);
+}
+
+static const unsigned int max96724_phys_configs_reg_val[] = {
+	MAX96724_MIPI_PHY0_PHY_1X4A_2X2,
+	MAX96724_MIPI_PHY0_PHY_2X4,
+
+	MAX96724_MIPI_PHY0_PHY_4X2,
+	MAX96724_MIPI_PHY0_PHY_1X4A_2X2,
+	MAX96724_MIPI_PHY0_PHY_1X4B_2X2,
+	MAX96724_MIPI_PHY0_PHY_2X4,
+};
+
+static const struct max_phys_config max96724_phys_configs[] = {
+	/*
+	 * PHY 1 can be in 4-lane mode (combining lanes of PHY 0 and PHY 1)
+	 * but only use the data lanes of PHY0, while continuing to use the
+	 * clock lane of PHY 1.
+	 * Specifying clock-lanes as 5 turns on alternate clocking mode.
+	 */
+	{ { 2, 0, 2, 2 }, { MAX96724_PHY1_ALT_CLOCK, 0, 0, 0 } },
+	{ { 2, 0, 4, 0 }, { MAX96724_PHY1_ALT_CLOCK, 0, 0, 0 } },
+
+	/*
+	 * When combining PHY 0 and PHY 1 to make them function in 4-lane mode,
+	 * PHY 1 is the master PHY, but we use PHY 0 here to maintain
+	 * compatibility.
+	 */
+	{ { 2, 2, 2, 2 } },
+	{ { 4, 0, 2, 2 } },
+	{ { 2, 2, 4, 0 } },
+	{ { 4, 0, 4, 0 } },
+};
+
+static int max96724_init(struct max_des *des)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		ret = regmap_set_bits(priv->regmap, MAX96724_MIPI_TX57(i),
+				      MAX96724_MIPI_TX57_DIS_AUTO_TUN_DET);
+		if (ret)
+			return ret;
+	}
+
+	if (priv->info->supports_pipe_stream_autoselect) {
+		/* Enable stream autoselect. */
+		ret = regmap_update_bits(priv->regmap, MAX96724_VIDEO_PIPE_EN,
+					 MAX96724_VIDEO_PIPE_EN_STREAM_SEL_ALL,
+					 FIELD_PREP(MAX96724_VIDEO_PIPE_EN_STREAM_SEL_ALL, 1));
+		if (ret)
+			return ret;
+	}
+
+	/* Set PHY mode. */
+	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY0,
+				 MAX96724_MIPI_PHY0_PHY_CONFIG,
+				 max96724_phys_configs_reg_val[des->phys_config]);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96724_init_phy(struct max_des *des, struct max_des_phy *phy)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	bool is_cphy = phy->bus_type == V4L2_MBUS_CSI2_CPHY;
+	unsigned int num_data_lanes = phy->mipi.num_data_lanes;
+	unsigned int dpll_freq = phy->link_frequency * 2;
+	unsigned int num_hw_data_lanes;
+	unsigned int index;
+	unsigned int used_data_lanes = 0;
+	unsigned int val, mask;
+	unsigned int i;
+	int ret;
+
+	index = max96724_phy_id(des, phy);
+	num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
+
+	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_TX10(index),
+				 MAX96724_MIPI_TX10_CSI2_LANE_CNT,
+				 FIELD_PREP(MAX96724_MIPI_TX10_CSI2_LANE_CNT,
+					    num_data_lanes - 1));
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX10(index),
+				 MAX96724_MIPI_TX10_CSI2_CPHY_EN, is_cphy);
+	if (ret)
+		return ret;
+
+	/* Configure lane mapping. */
+	val = 0;
+	for (i = 0; i < num_hw_data_lanes ; i++) {
+		unsigned int map;
+
+		if (i < num_data_lanes)
+			map = phy->mipi.data_lanes[i] - 1;
+		else
+			map = ffz(used_data_lanes);
+
+		val |= map << (i * 2);
+		used_data_lanes |= BIT(map);
+	}
+
+	if (num_hw_data_lanes == 4)
+		mask = MAX96724_MIPI_PHY3_PHY_LANE_MAP_4;
+	else
+		mask = MAX96724_MIPI_PHY3_PHY_LANE_MAP_2(index);
+
+	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY3(index),
+				 mask, field_prep(mask, val));
+	if (ret)
+		return ret;
+
+	/* Configure lane polarity. */
+	val = 0;
+	for (i = 0; i < num_data_lanes; i++)
+		if (phy->mipi.lane_polarities[i + 1])
+			val |= BIT(i);
+
+	if (num_hw_data_lanes == 4) {
+		ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
+					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1 |
+					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
+					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1,
+						    val) |
+					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
+						    val >> 2));
+		if (ret)
+			return ret;
+
+		ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
+					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK,
+					 phy->mipi.lane_polarities[0]);
+		if (ret)
+			return ret;
+	} else {
+		ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
+					 MAX96724_MIPI_PHY5_PHY_POL_MAP_2(index),
+					 field_prep(MAX96724_MIPI_PHY5_PHY_POL_MAP_2(index), val));
+		if (ret)
+			return ret;
+
+		ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
+					 MAX96724_MIPI_PHY5_PHY_POL_MAP_2_CLK(index),
+					 phy->mipi.lane_polarities[0]);
+		if (ret)
+			return ret;
+	}
+
+	if (!is_cphy && dpll_freq > 1500000000ull) {
+		/* Enable initial deskew with 2 x 32k UI. */
+		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX3(index),
+				   MAX96724_MIPI_TX3_DESKEW_INIT_AUTO |
+				   MAX96724_MIPI_TX3_DESKEW_INIT_8X32K);
+		if (ret)
+			return ret;
+
+		/* Enable periodic deskew with 2 x 1k UI.. */
+		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX4(index),
+				   MAX96724_MIPI_TX4_DESKEW_PER_AUTO |
+				   MAX96724_MIPI_TX4_DESKEW_PER_2K);
+		if (ret)
+			return ret;
+	} else {
+		/* Disable initial deskew. */
+		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX3(index), 0x0);
+		if (ret)
+			return ret;
+
+		/* Disable periodic deskew. */
+		ret = regmap_write(priv->regmap, MAX96724_MIPI_TX4(index), 0x0);
+		if (ret)
+			return ret;
+	}
+
+	if (is_cphy) {
+		/* Configure C-PHY timings. */
+		ret = regmap_write(priv->regmap, MAX96724_MIPI_PHY13,
+				   MAX96724_MIPI_PHY13_T_T3_PREBEGIN_64X7);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(priv->regmap, MAX96724_MIPI_PHY14,
+				   MAX96724_MIPI_PHY14_T_T3_PREP_55NS |
+				   MAX96724_MIPI_PHY14_T_T3_POST_32X7);
+		if (ret)
+			return ret;
+	}
+
+	/* Put DPLL block into reset. */
+	ret = regmap_clear_bits(priv->regmap, MAX96724_DPLL_0(index),
+				MAX96724_DPLL_0_CONFIG_SOFT_RST_N);
+	if (ret)
+		return ret;
+
+	/* Set DPLL frequency. */
+	ret = regmap_update_bits(priv->regmap, MAX96724_BACKTOP22(index),
+				 MAX96724_BACKTOP22_PHY_CSI_TX_DPLL,
+				 FIELD_PREP(MAX96724_BACKTOP22_PHY_CSI_TX_DPLL,
+					    div_u64(dpll_freq, 100000000)));
+	if (ret)
+		return ret;
+
+	/* Enable DPLL frequency. */
+	ret = regmap_set_bits(priv->regmap, MAX96724_BACKTOP22(index),
+			      MAX96724_BACKTOP22_PHY_CSI_TX_DPLL_EN);
+	if (ret)
+		return ret;
+
+	/* Pull DPLL block out of reset. */
+	ret = regmap_set_bits(priv->regmap, MAX96724_DPLL_0(index),
+			      MAX96724_DPLL_0_CONFIG_SOFT_RST_N);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96724_set_phy_mode(struct max_des *des, struct max_des_phy *phy,
+				 struct max_des_phy_mode *mode)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = max96724_phy_id(des, phy);
+	int ret;
+
+	/* Set alternate memory map modes. */
+	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
+				 MAX96724_MIPI_TX51_ALT_MEM_MAP_12,
+				 mode->alt_mem_map12);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
+				 MAX96724_MIPI_TX51_ALT_MEM_MAP_8,
+				 mode->alt_mem_map8);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
+				 MAX96724_MIPI_TX51_ALT_MEM_MAP_10,
+				 mode->alt_mem_map10);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX51(index),
+				 MAX96724_MIPI_TX51_ALT2_MEM_MAP_8,
+				 mode->alt2_mem_map8);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max96724_set_phy_active(struct max_des *des, struct max_des_phy *phy,
+				   bool enable)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = max96724_phy_id(des, phy);
+	unsigned int num_hw_data_lanes;
+	unsigned int mask;
+
+	num_hw_data_lanes = max_des_phy_hw_data_lanes(des, phy);
+
+	if (num_hw_data_lanes == 4)
+		/* PHY 1 -> bits [1:0] */
+		/* PHY 2 -> bits [3:2] */
+		mask = MAX96724_MIPI_PHY2_PHY_STDB_N_4(index);
+	else
+		mask = MAX96724_MIPI_PHY2_PHY_STDB_N_2(index);
+
+	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY2, mask, enable);
+}
+
+static int max96724_set_pipe_remap(struct max_des *des,
+				   struct max_des_pipe *pipe,
+				   unsigned int i,
+				   struct max_des_remap *remap)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = pipe->index;
+	int ret;
+
+	/* Set source Data Type and Virtual Channel. */
+	/* TODO: implement extended Virtual Channel. */
+	ret = regmap_write(priv->regmap, MAX96724_MIPI_TX13(index, i),
+			   FIELD_PREP(MAX96724_MIPI_TX13_MAP_SRC_DT,
+				      remap->from_dt) |
+			   FIELD_PREP(MAX96724_MIPI_TX13_MAP_SRC_VC,
+				      remap->from_vc));
+	if (ret)
+		return ret;
+
+	/* Set destination Data Type and Virtual Channel. */
+	/* TODO: implement extended Virtual Channel. */
+	ret = regmap_write(priv->regmap, MAX96724_MIPI_TX14(index, i),
+			   FIELD_PREP(MAX96724_MIPI_TX14_MAP_DST_DT,
+				      remap->to_dt) |
+			   FIELD_PREP(MAX96724_MIPI_TX14_MAP_DST_VC,
+				      remap->to_vc));
+	if (ret)
+		return ret;
+
+	/* Set destination PHY. */
+	return regmap_update_bits(priv->regmap, MAX96724_MIPI_TX45(index, i),
+				  MAX96724_MIPI_TX45_MAP_DPHY_DEST(i),
+				  field_prep(MAX96724_MIPI_TX45_MAP_DPHY_DEST(i),
+					     remap->phy));
+}
+
+static int max96724_set_pipe_remaps_enable(struct max_des *des,
+					   struct max_des_pipe *pipe,
+					   unsigned int mask)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = pipe->index;
+	int ret;
+
+	ret = regmap_write(priv->regmap, MAX96724_MIPI_TX11(index), mask);
+	if (ret)
+		return ret;
+
+	return regmap_write(priv->regmap, MAX96724_MIPI_TX12(index), mask >> 8);
+}
+
+static int max96724_set_pipe_phy(struct max_des *des, struct max_des_pipe *pipe,
+				 struct max_des_phy *phy)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int phy_index = max96724_phy_id(des, phy);
+	unsigned int index = pipe->index;
+	int ret;
+
+	ret = regmap_update_bits(priv->regmap, MAX96724_MIPI_TX57(index),
+				 MAX96724_MIPI_TX57_TUN_DEST,
+				 FIELD_PREP(MAX96724_MIPI_TX57_TUN_DEST,
+					    phy_index));
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(priv->regmap, MAX96724_MIPI_CTRL_SEL,
+				  MAX96724_MIPI_CTRL_SEL_MASK(index),
+				  field_prep(MAX96724_MIPI_CTRL_SEL_MASK(index),
+					     phy_index));
+}
+
+static int max96724_set_pipe_enable(struct max_des *des, struct max_des_pipe *pipe,
+				    bool enable)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = pipe->index;
+
+	return regmap_assign_bits(priv->regmap, MAX96724_VIDEO_PIPE_EN,
+				  MAX96724_VIDEO_PIPE_EN_MASK(index), enable);
+}
+
+static int max96724_set_pipe_stream_id(struct max_des *des, struct max_des_pipe *pipe,
+				       unsigned int stream_id)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = pipe->index;
+
+	return regmap_update_bits(priv->regmap, MAX96724_VIDEO_PIPE_SEL(index),
+				  MAX96724_VIDEO_PIPE_SEL_STREAM(index),
+				  field_prep(MAX96724_VIDEO_PIPE_SEL_STREAM(index),
+					     stream_id));
+}
+
+static int max96724_set_pipe_mode(struct max_des *des,
+				  struct max_des_pipe *pipe,
+				  struct max_des_pipe_mode *mode)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int index = pipe->index;
+	unsigned int reg, mask, mode_mask;
+	int ret;
+
+	/* Set 8bit double mode. */
+	ret = regmap_assign_bits(priv->regmap, MAX96724_BACKTOP21,
+				 MAX96724_BACKTOP21_BPP8DBL(index), mode->dbl8);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, MAX96724_BACKTOP24,
+				 MAX96724_BACKTOP24_BPP8DBL_MODE(index),
+				 mode->dbl8mode);
+	if (ret)
+		return ret;
+
+	/* Set 10bit double mode. */
+	if (index == 3) {
+		reg = MAX96724_BACKTOP30;
+		mask = MAX96724_BACKTOP30_BPP10DBL3;
+		mode_mask = MAX96724_BACKTOP30_BPP10DBL3_MODE;
+	} else if (index == 2) {
+		reg = MAX96724_BACKTOP31;
+		mask = MAX96724_BACKTOP31_BPP10DBL2;
+		mode_mask = MAX96724_BACKTOP31_BPP10DBL2_MODE;
+	} else if (index == 1) {
+		reg = MAX96724_BACKTOP32;
+		mask = MAX96724_BACKTOP32_BPP10DBL1;
+		mode_mask = MAX96724_BACKTOP32_BPP10DBL1_MODE;
+	} else {
+		reg = MAX96724_BACKTOP32;
+		mask = MAX96724_BACKTOP32_BPP10DBL0;
+		mode_mask = MAX96724_BACKTOP32_BPP10DBL0_MODE;
+	}
+
+	ret = regmap_assign_bits(priv->regmap, reg, mask, mode->dbl10);
+	if (ret)
+		return ret;
+
+	ret = regmap_assign_bits(priv->regmap, reg, mode_mask, mode->dbl10mode);
+	if (ret)
+		return ret;
+
+	/* Set 12bit double mode. */
+	return regmap_assign_bits(priv->regmap, MAX96724_BACKTOP32,
+				  MAX96724_BACKTOP32_BPP12(index), mode->dbl12);
+}
+
+static int max96724_set_pipe_tunnel_enable(struct max_des *des,
+					   struct max_des_pipe *pipe, bool enable)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+
+	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_TX54(pipe->index),
+				  MAX96724_MIPI_TX54_TUN_EN, enable);
+}
+
+static int max96724_select_links(struct max_des *des, unsigned int mask)
+{
+	struct max96724_priv *priv = des_to_priv(des);
+	unsigned int val = 0;
+	unsigned int i;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		if ((mask & BIT(i)))
+			continue;
+
+		val |= MAX96724_REG3_DIS_REM_CC_0(i);
+	}
+
+	return regmap_write(priv->regmap, MAX96724_REG3, val);
+}
+
+static const struct max_des_ops max96724_ops = {
+	.num_phys = 4,
+	.num_links = 4,
+	.num_remaps_per_pipe = 16,
+	.phys_configs = {
+		.num_configs = ARRAY_SIZE(max96724_phys_configs),
+		.configs = max96724_phys_configs,
+	},
+	.reg_read = max96724_reg_read,
+	.reg_write = max96724_reg_write,
+	.log_pipe_status = max96724_log_pipe_status,
+	.log_phy_status = max96724_log_phy_status,
+	.set_enable = max96724_set_enable,
+	.init = max96724_init,
+	.init_phy = max96724_init_phy,
+	.set_phy_mode = max96724_set_phy_mode,
+	.set_phy_active = max96724_set_phy_active,
+	.set_pipe_phy = max96724_set_pipe_phy,
+	.set_pipe_stream_id = max96724_set_pipe_stream_id,
+	.set_pipe_enable = max96724_set_pipe_enable,
+	.set_pipe_remap = max96724_set_pipe_remap,
+	.set_pipe_remaps_enable = max96724_set_pipe_remaps_enable,
+	.set_pipe_mode = max96724_set_pipe_mode,
+	.set_pipe_tunnel_enable = max96724_set_pipe_tunnel_enable,
+	.select_links = max96724_select_links,
+};
+
+static const struct max96724_chip_info max96724_info = {
+	.supports_pipe_stream_autoselect = true,
+	.num_pipes = 4,
+};
+
+static const struct max96724_chip_info max96712_info = {
+	.num_pipes = 8,
+};
+
+static int max96724_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct max96724_priv *priv;
+	struct max_des_ops *ops;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
+	if (!ops)
+		return -ENOMEM;
+
+	priv->info = device_get_match_data(dev);
+	if (!priv->info) {
+		dev_err(dev, "Failed to get match data\n");
+		return -ENODEV;
+	}
+
+	priv->dev = dev;
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	priv->regmap = devm_regmap_init_i2c(client, &max96724_i2c_regmap);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_pwdn))
+		return PTR_ERR(priv->gpiod_pwdn);
+
+	if (priv->gpiod_pwdn) {
+		/* PWDN must be held for 1us for reset */
+		udelay(1);
+
+		gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
+		/* Maximum power-up time (tLOCK) 4ms */
+		usleep_range(4000, 5000);
+	}
+
+	*ops = max96724_ops;
+	ops->num_pipes = priv->info->num_pipes;
+	priv->des.ops = ops;
+
+	ret = max96724_reset(priv);
+	if (ret)
+		return ret;
+
+	return max_des_probe(client, &priv->des);
+}
+
+static void max96724_remove(struct i2c_client *client)
+{
+	struct max96724_priv *priv = i2c_get_clientdata(client);
+
+	max_des_remove(&priv->des);
+
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
+}
+
+static const struct of_device_id max96724_of_table[] = {
+	{ .compatible = "maxim,max96712", .data = &max96712_info },
+	{ .compatible = "maxim,max96724", .data = &max96724_info },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, max96724_of_table);
+
+static struct i2c_driver max96724_i2c_driver = {
+	.driver	= {
+		.name = "max96724",
+		.of_match_table	= of_match_ptr(max96724_of_table),
+	},
+	.probe = max96724_probe,
+	.remove = max96724_remove,
+};
+
+module_i2c_driver(max96724_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim MAX96724 Quad GMSL2 Deserializer Driver");
+MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
new file mode 100644
index 000000000000..ba4c697ad60e
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_des.c
@@ -0,0 +1,2321 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim GMSL2 Deserializer Driver
+ *
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c-atr.h>
+#include <linux/i2c-mux.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#include "max_des.h"
+#include "max_ser.h"
+#include "max_serdes.h"
+
+#define MAX_DES_LINK_FREQUENCY_MIN 100000000ull
+#define MAX_DES_LINK_FREQUENCY_DEFAULT 750000000ull
+#define MAX_DES_LINK_FREQUENCY_MAX 1250000000ull
+
+#define MAX_DES_PHYS_NUM		4
+#define MAX_DES_PIPES_NUM		8
+
+struct max_des_priv {
+	struct max_des *des;
+	unsigned int versions;
+
+	struct device *dev;
+	struct i2c_client *client;
+	struct i2c_atr *atr;
+	struct i2c_mux_core *mux;
+
+	struct media_pad *pads;
+	struct regulator **pocs;
+	struct max_source *sources;
+	u64 *streams_masks;
+
+	struct v4l2_subdev sd;
+	struct v4l2_async_notifier nf;
+
+	struct max_des_phy *unused_phy;
+};
+
+struct max_des_remap_context {
+	/* Mark whether chip can function in tunnel mode. */
+	bool tunnel_enable;
+	/* Mark the PHYs to which each pipe is mapped. */
+	unsigned long pipe_phy_masks[MAX_DES_PIPES_NUM];
+	/* Mark whether pipe has remapped VC ids. */
+	bool vc_ids_remapped[MAX_DES_PIPES_NUM];
+	/* Map between pipe VC ids and PHY VC ids. */
+	unsigned int vc_ids_map[MAX_DES_PIPES_NUM][MAX_DES_PHYS_NUM][MAX_SERDES_VC_ID_NUM];
+	/* Mark whether a pipe VC id has been mapped to a PHY VC id. */
+	unsigned long vc_ids_masks[MAX_DES_PIPES_NUM][MAX_DES_PHYS_NUM];
+	/* Mark whether a PHY VC id has been mapped. */
+	unsigned long dst_vc_ids_masks[MAX_DES_PHYS_NUM];
+};
+
+struct max_des_mode_context {
+	bool phys_bpp8_shared_with_16[MAX_DES_PHYS_NUM];
+	bool pipes_bpp8_shared_with_16[MAX_DES_PIPES_NUM];
+	u32 phys_double_bpps[MAX_DES_PHYS_NUM];
+	u32 pipes_double_bpps[MAX_DES_PIPES_NUM];
+};
+
+static inline struct max_des_priv *sd_to_priv(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct max_des_priv, sd);
+}
+
+static inline struct max_des_priv *nf_to_priv(struct v4l2_async_notifier *nf)
+{
+	return container_of(nf, struct max_des_priv, nf);
+}
+
+static inline bool max_des_pad_is_sink(struct max_des *des, u32 pad)
+{
+	return pad < des->ops->num_links;
+}
+
+static inline bool max_des_pad_is_source(struct max_des *des, u32 pad)
+{
+	return pad >= des->ops->num_links;
+}
+
+static inline unsigned int max_des_link_to_pad(struct max_des *des,
+					       struct max_des_link *link)
+{
+	return link->index;
+}
+
+static inline unsigned int max_des_phy_to_pad(struct max_des *des,
+					      struct max_des_phy *phy)
+{
+	return phy->index + des->ops->num_links;
+}
+
+static inline unsigned int max_des_num_pads(struct max_des *des)
+{
+	return des->ops->num_links + des->ops->num_phys;
+}
+
+static struct max_des_phy *max_des_pad_to_phy(struct max_des *des, u32 pad)
+{
+	if (!max_des_pad_is_source(des, pad))
+		return NULL;
+
+	return &des->phys[pad - des->ops->num_links];
+}
+
+static struct max_des_link *max_des_pad_to_link(struct max_des *des, u32 pad)
+{
+	if (!max_des_pad_is_sink(des, pad))
+		return NULL;
+
+	return &des->links[pad];
+}
+
+static struct max_des_pipe *
+max_des_find_link_pipe(struct max_des *des, struct max_des_link *link)
+{
+	unsigned int i;
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		struct max_des_pipe *pipe = &des->pipes[i];
+
+		if (pipe->link_id == link->index)
+			return pipe;
+	}
+
+	return NULL;
+}
+
+static struct max_source *
+max_des_find_link_source(struct max_des_priv *priv, struct max_des_link *link)
+{
+	return &priv->sources[link->index];
+}
+
+static int max_des_set_pipe_remaps(struct max_des_priv *priv,
+				   struct max_des_pipe *pipe,
+				   struct max_des_remap *remaps,
+				   unsigned int num_remaps)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_remaps; i++) {
+		struct max_des_remap *remap = &remaps[i];
+
+		ret = des->ops->set_pipe_remap(des, pipe, i, remap);
+		if (ret)
+			return ret;
+	}
+
+	return des->ops->set_pipe_remaps_enable(des, pipe, GENMASK(num_remaps - 1, 0));
+}
+
+static int max_des_set_phy_active(struct max_des *des, struct max_des_phy *phy,
+				  bool active)
+{
+	int ret;
+
+	ret = des->ops->set_phy_active(des, phy, active);
+	if (ret)
+		return ret;
+
+	phy->active = active;
+
+	return 0;
+}
+
+static int max_des_set_pipe_enable(struct max_des *des, struct max_des_pipe *pipe,
+				   bool enable)
+{
+	int ret;
+
+	ret = des->ops->set_pipe_enable(des, pipe, enable);
+	if (ret)
+		return ret;
+
+	pipe->enabled = enable;
+
+	return 0;
+}
+
+static int max_des_map_src_dst_vc_id(struct max_des_remap_context *context,
+				     unsigned int pipe_id, unsigned int phy_id,
+				     unsigned int src_vc_id, unsigned int *dst_vc_id)
+{
+	unsigned int vc_id;
+
+	if (src_vc_id >= MAX_SERDES_VC_ID_NUM)
+		return -E2BIG;
+
+	if (context->vc_ids_masks[pipe_id][phy_id] & BIT(src_vc_id)) {
+		*dst_vc_id = context->vc_ids_map[pipe_id][phy_id][src_vc_id];
+		return 0;
+	}
+
+	if (!(context->dst_vc_ids_masks[phy_id] & BIT(src_vc_id))) {
+		vc_id = src_vc_id;
+	} else {
+		context->vc_ids_remapped[pipe_id] = true;
+		vc_id = ffz(context->dst_vc_ids_masks[phy_id]);
+	}
+
+	if (vc_id >= MAX_SERDES_VC_ID_NUM)
+		return -E2BIG;
+
+	context->pipe_phy_masks[pipe_id] |= BIT(phy_id);
+	context->dst_vc_ids_masks[phy_id] |= BIT(vc_id);
+
+	context->vc_ids_map[pipe_id][phy_id][src_vc_id] = vc_id;
+	context->vc_ids_masks[pipe_id][phy_id] |= BIT(src_vc_id);
+
+	*dst_vc_id = vc_id;
+
+	return 0;
+}
+
+static int max_des_populate_remap_context(struct max_des_priv *priv,
+					  struct max_des_remap_context *context,
+					  const struct v4l2_subdev_krouting *routing)
+{
+	struct max_des *des = priv->des;
+	struct v4l2_subdev_route *route;
+	unsigned int link_id;
+	bool tunnel_enable;
+	int ret;
+
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		struct max_source *source;
+		struct max_des_link *link;
+		struct max_des_pipe *pipe;
+		struct max_des_phy *phy;
+		unsigned int vc_id;
+
+		link = max_des_pad_to_link(des, route->sink_pad);
+		if (!link) {
+			dev_err(priv->dev, "Failed to find link for pad %u\n",
+				route->sink_pad);
+			return -ENOENT;
+		}
+
+		phy = max_des_pad_to_phy(des, route->source_pad);
+		if (!phy) {
+			dev_err(priv->dev, "Failed to find PHY for pad %u\n",
+				route->source_pad);
+			return -ENOENT;
+		}
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to find frame desc entry for stream %u:%u: %d\n",
+				route->sink_pad, route->sink_stream, ret);
+			return ret;
+		}
+
+		ret = max_des_map_src_dst_vc_id(context, pipe->index, phy->index,
+						entry.bus.csi2.vc, &vc_id);
+		if (ret)
+			return ret;
+	}
+
+	if (!des->ops->set_pipe_tunnel_enable)
+		return 0;
+
+	tunnel_enable = true;
+
+	for (link_id = 0; link_id < des->ops->num_links; link_id++) {
+		struct max_des_link *link = &des->links[link_id];
+		struct max_des_pipe *pipe;
+		struct max_source *source;
+
+		if (!link->enabled)
+			continue;
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		if (max_ser_supports_tunnel_mode(source->sd) &&
+		    hweight_long(context->pipe_phy_masks[pipe->index]) <= 1 &&
+		    !context->vc_ids_remapped[pipe->index])
+			continue;
+
+		tunnel_enable = false;
+	}
+
+	context->tunnel_enable = tunnel_enable;
+
+	return 0;
+}
+
+static int max_des_populate_mode_context(struct max_des_priv *priv,
+					 struct max_des_mode_context *context,
+					 const struct v4l2_subdev_krouting *routing)
+{
+	bool bpp8_not_shared_with_16_phys[MAX_DES_PHYS_NUM] = { 0 };
+	u32 undoubled_bpps_phys[MAX_DES_PHYS_NUM] = { 0 };
+	struct max_des *des = priv->des;
+	struct v4l2_subdev_route *route;
+	struct max_des_link *link;
+	struct max_des_pipe *pipe;
+	struct max_des_phy *phy;
+	unsigned int doubled_bpp;
+	unsigned int bpp;
+	unsigned int i;
+	u32 stream_bpps;
+	u32 sink_bpps;
+	int ret;
+
+	/*
+	 * Go over all streams and check if the current stream is doubled.
+	 *
+	 * If the current stream is doubled, add it to a doubled mask for both
+	 * the pipe and the PHY.
+	 *
+	 * If the current stream is not doubled, add it to a local undoubled
+	 * mask for the PHY.
+	 *
+	 * Also, track whether an 8bpp stream is shared with any bpp > 8 on both
+	 * the PHYs and the pipes, since that needs to be special cased.
+	 *
+	 * After going over all the streams, remove the undoubled streams from
+	 * the doubled ones. Doubled and undoubled streams cannot be streamed
+	 * over the same PHY.
+	 *
+	 * Then, do a second pass to remove the undoubled streams from the pipes.
+	 *
+	 * This operation cannot be done in a single pass because any pipe might
+	 * generate an undoubled stream for a specific bpp, causing already
+	 * processed pipes to need to have their doubled bpps updated.
+	 */
+
+	for_each_active_route(routing, route) {
+		unsigned int min_bpp;
+		unsigned int max_bpp;
+
+		phy = max_des_pad_to_phy(des, route->source_pad);
+		if (!phy)
+			return -ENOENT;
+
+		link = max_des_pad_to_link(des, route->sink_pad);
+		if (!link)
+			return -ENOENT;
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		ret = max_get_bpps(priv->sources, 0, &stream_bpps,
+				   routing, route->sink_pad,
+				   BIT_ULL(route->sink_stream));
+		if (ret)
+			return ret;
+
+		ret = max_get_bpps(priv->sources, 0, &sink_bpps,
+				   routing, route->sink_pad, ~0ULL);
+		if (ret)
+			return ret;
+
+		ret = max_process_bpps(priv->dev, sink_bpps, ~0U, &doubled_bpp);
+		if (ret)
+			return ret;
+
+		bpp = __ffs(stream_bpps);
+		min_bpp = __ffs(sink_bpps);
+		max_bpp = __fls(sink_bpps);
+
+		if (bpp == doubled_bpp) {
+			context->phys_double_bpps[phy->index] |= BIT(bpp);
+			context->pipes_double_bpps[pipe->index] |= BIT(bpp);
+		} else {
+			undoubled_bpps_phys[phy->index] |= BIT(bpp);
+		}
+
+		if (min_bpp == 8 && max_bpp > 8) {
+			context->phys_bpp8_shared_with_16[phy->index] = true;
+			context->pipes_bpp8_shared_with_16[pipe->index] = true;
+		} else if (min_bpp == 8 && max_bpp == 8) {
+			bpp8_not_shared_with_16_phys[phy->index] = true;
+		}
+	}
+
+	for (i = 0; i < des->ops->num_phys; i++) {
+		if (context->phys_bpp8_shared_with_16[i] && bpp8_not_shared_with_16_phys[i]) {
+			dev_err(priv->dev,
+				"Cannot stream 8bpp coming from pipes padded to 16bpp "
+				"and pipes not padded to 16bpp on the same PHY\n");
+			return -EINVAL;
+		}
+	}
+
+	for (i = 0; i < des->ops->num_phys; i++)
+		context->phys_double_bpps[i] &= ~undoubled_bpps_phys[i];
+
+	for_each_active_route(routing, route) {
+		struct max_des_link *link;
+		struct max_des_pipe *pipe;
+		struct max_des_phy *phy;
+
+		phy = max_des_pad_to_phy(des, route->source_pad);
+		if (!phy)
+			return -ENOENT;
+
+		link = max_des_pad_to_link(des, route->sink_pad);
+		if (!link)
+			return -ENOENT;
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		context->pipes_double_bpps[pipe->index] &=
+			context->phys_double_bpps[phy->index];
+	}
+
+	return 0;
+}
+
+static void max_des_get_pipe_mode(struct max_des_mode_context *context,
+				  struct max_des_pipe *pipe,
+				  struct max_des_pipe_mode *mode)
+{
+	u32 double_bpps = context->pipes_double_bpps[pipe->index];
+
+	if ((double_bpps & BIT(8)) &&
+	    !context->pipes_bpp8_shared_with_16[pipe->index]) {
+		mode->dbl8 = true;
+		mode->dbl8mode = true;
+	}
+}
+
+static void max_des_get_phy_mode(struct max_des_mode_context *context,
+				 struct max_des_phy *phy,
+				 struct max_des_phy_mode *mode)
+{
+	bool bpp8_pipe_shared_with_16 = context->phys_bpp8_shared_with_16[phy->index];
+	u32 double_bpps = context->phys_double_bpps[phy->index];
+
+	if (BIT(8) & double_bpps) {
+		if (bpp8_pipe_shared_with_16)
+			mode->alt2_mem_map8 = true;
+		else
+			mode->alt_mem_map8 = true;
+	}
+
+	if (BIT(10) & double_bpps)
+		mode->alt_mem_map10 = true;
+
+	if (BIT(12) & double_bpps)
+		mode->alt_mem_map12 = true;
+}
+
+static int max_des_set_modes(struct max_des_priv *priv,
+			     struct max_des_mode_context *context)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_phys; i++) {
+		struct max_des_phy *phy = &des->phys[i];
+		struct max_des_phy_mode mode = { 0 };
+
+		max_des_get_phy_mode(context, phy, &mode);
+
+		if (phy->mode.alt_mem_map8 == mode.alt_mem_map8 &&
+		    phy->mode.alt_mem_map10 == mode.alt_mem_map10 &&
+		    phy->mode.alt_mem_map12 == mode.alt_mem_map12 &&
+		    phy->mode.alt2_mem_map8 == mode.alt2_mem_map8)
+			continue;
+
+		ret = des->ops->set_phy_mode(des, phy, &mode);
+		if (ret)
+			return ret;
+
+		phy->mode = mode;
+	}
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		struct max_des_pipe *pipe = &des->pipes[i];
+		struct max_des_pipe_mode mode = { 0 };
+
+		max_des_get_pipe_mode(context, pipe, &mode);
+
+		if (pipe->mode.dbl8 == mode.dbl8 &&
+		    pipe->mode.dbl10 == mode.dbl10 &&
+		    pipe->mode.dbl12 == mode.dbl12 &&
+		    pipe->mode.dbl8mode == mode.dbl8mode &&
+		    pipe->mode.dbl10mode == mode.dbl10mode)
+			continue;
+
+		ret = des->ops->set_pipe_mode(des, pipe, &mode);
+		if (ret)
+			return ret;
+
+		pipe->mode = mode;
+	}
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		struct max_des_pipe *pipe;
+		struct max_source *source;
+
+		if (!link->enabled)
+			continue;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		ret = max_ser_set_double_bpps(source->sd,
+					      context->pipes_double_bpps[pipe->index]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max_des_set_tunnel(struct max_des_priv *priv,
+			      struct max_des_remap_context *context)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	if (des->tunnel == context->tunnel_enable)
+		return 0;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		struct max_des_pipe *pipe;
+		struct max_source *source;
+
+		if (!link->enabled)
+			continue;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		if (des->ops->set_pipe_tunnel_enable) {
+			ret = des->ops->set_pipe_tunnel_enable(des, pipe,
+							       context->tunnel_enable);
+			if (ret)
+				return ret;
+		}
+
+		ret = max_ser_set_tunnel_enable(source->sd, context->tunnel_enable);
+		if (ret)
+			return ret;
+	}
+
+	des->tunnel = context->tunnel_enable;
+
+	return 0;
+}
+
+static int max_des_set_pipes_phy(struct max_des_priv *priv,
+				 struct max_des_remap_context *context)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	if (!des->ops->set_pipe_phy)
+		return 0;
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		struct max_des_pipe *pipe = &des->pipes[i];
+		struct max_des_phy *phy;
+		unsigned int phy_id;
+
+		phy_id = find_first_bit(&context->pipe_phy_masks[pipe->index],
+					des->ops->num_phys);
+
+		if (priv->unused_phy &&
+		    (!context->tunnel_enable || phy_id == des->ops->num_phys))
+			phy_id = priv->unused_phy->index;
+
+		if (phy_id != des->ops->num_phys) {
+			phy = &des->phys[phy_id];
+
+			ret = des->ops->set_pipe_phy(des, pipe, phy);
+			if (ret)
+				return ret;
+		}
+
+		pipe->phy_id = phy_id;
+	}
+
+	return 0;
+}
+
+static int max_des_add_remap(struct max_des_remap *remaps,
+			     unsigned int *num_remaps, unsigned int phy_id,
+			     unsigned int src_vc_id, unsigned int dst_vc_id,
+			     unsigned int dt)
+{
+	struct max_des_remap *remap = &remaps[*num_remaps];
+
+	remap->from_dt = dt;
+	remap->from_vc = src_vc_id;
+	remap->to_dt = dt;
+	remap->to_vc = dst_vc_id;
+	remap->phy = phy_id;
+
+	(*num_remaps)++;
+
+	return 0;
+}
+
+static int max_des_get_pipe_remaps(struct max_des_priv *priv,
+				   struct max_des_remap_context *context,
+				   struct max_des_pipe *pipe,
+				   struct max_source *source,
+				   struct max_des_remap *remaps,
+				   unsigned int *num_remaps,
+				   const struct v4l2_subdev_krouting *routing,
+				   u32 pad, u64 streams_mask)
+{
+	struct max_des *des = priv->des;
+	struct v4l2_subdev_route *route;
+	unsigned long vc_ids_masks = 0;
+	unsigned int phy_id;
+	int ret;
+
+	*num_remaps = 0;
+
+	if (context->tunnel_enable)
+		return 0;
+
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		struct max_des_phy *phy;
+		unsigned int src_vc_id, dst_vc_id;
+
+		if (pad != route->sink_pad)
+			continue;
+
+		if (!(BIT_ULL(route->sink_stream) & streams_mask))
+			continue;
+
+		if (*num_remaps + 1 > des->ops->num_remaps_per_pipe) {
+			dev_err(priv->dev, "Too many streams for pipe %u\n",
+				pipe->index);
+			return -E2BIG;
+		}
+
+		phy = max_des_pad_to_phy(des, route->source_pad);
+		if (!phy) {
+			dev_err(priv->dev, "Failed to find PHY for pad %u\n",
+				route->source_pad);
+			return -ENOENT;
+		}
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to find frame desc entry for stream %u:%u: %d\n",
+				route->sink_pad, route->sink_stream, ret);
+			return ret;
+		}
+
+		src_vc_id = entry.bus.csi2.vc;
+		vc_ids_masks |= BIT(src_vc_id);
+
+		ret = max_des_map_src_dst_vc_id(context, pipe->index, phy->index,
+						src_vc_id, &dst_vc_id);
+		if (ret)
+			return ret;
+
+		ret = max_des_add_remap(remaps, num_remaps, phy->index,
+					src_vc_id, dst_vc_id,
+					entry.bus.csi2.dt);
+		if (ret)
+			return ret;
+	}
+
+	for (phy_id = 0; phy_id < des->ops->num_phys; phy_id++) {
+		unsigned long mask = context->vc_ids_masks[pipe->index][phy_id];
+		unsigned int src_vc_id;
+
+		for_each_set_bit(src_vc_id, &mask, MAX_SERDES_VC_ID_NUM) {
+			unsigned int dst_vc_id;
+
+			if (!(vc_ids_masks & BIT(src_vc_id)))
+				continue;
+
+			if (*num_remaps + 2 > des->ops->num_remaps_per_pipe) {
+				dev_err(priv->dev, "Too many streams for pipe %u\n",
+					pipe->index);
+				return -E2BIG;
+			}
+
+			ret = max_des_map_src_dst_vc_id(context, pipe->index, phy_id,
+							src_vc_id, &dst_vc_id);
+			if (ret)
+				return ret;
+
+			ret = max_des_add_remap(remaps, num_remaps, phy_id,
+						src_vc_id, dst_vc_id,
+						MIPI_CSI2_DT_FS);
+			if (ret)
+				return ret;
+
+			ret = max_des_add_remap(remaps, num_remaps, phy_id,
+						src_vc_id, dst_vc_id,
+						MIPI_CSI2_DT_FE);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int max_des_update_pipe(struct max_des_priv *priv,
+			       struct max_des_remap_context *context,
+			       struct max_source *source,
+			       struct max_des_pipe *pipe,
+			       const struct v4l2_subdev_krouting *routing,
+			       u32 pad, u64 streams_mask)
+{
+	struct max_des *des = priv->des;
+	struct max_des_remap *remaps;
+	unsigned int num_remaps;
+	int ret;
+
+	remaps = devm_kcalloc(priv->dev, des->ops->num_remaps_per_pipe,
+			      sizeof(*remaps), GFP_KERNEL);
+	if (!remaps)
+		return -ENOMEM;
+
+	ret = max_des_get_pipe_remaps(priv, context, pipe, source, remaps,
+				      &num_remaps, routing, pad, streams_mask);
+	if (ret)
+		goto err_free_new_remaps;
+
+	ret = max_des_set_pipe_remaps(priv, pipe, remaps, num_remaps);
+	if (ret)
+		goto err_free_new_remaps;
+
+	if (pipe->remaps)
+		devm_kfree(priv->dev, pipe->remaps);
+
+	pipe->remaps = remaps;
+	pipe->num_remaps = num_remaps;
+
+	return 0;
+
+err_free_new_remaps:
+	devm_kfree(priv->dev, remaps);
+
+	return ret;
+}
+
+static int max_des_init_link_ser_xlate(struct max_des_priv *priv,
+				       struct max_des_link *link,
+				       struct i2c_adapter *adapter,
+				       u8 power_up_addr, u8 new_addr)
+{
+	struct max_des *des = priv->des;
+	u8 addrs[] = { power_up_addr, new_addr };
+	u8 current_addr;
+	int ret;
+
+	ret = des->ops->select_links(des, BIT(link->index));
+	if (ret)
+		return ret;
+
+	ret = max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
+					&current_addr);
+	if (ret) {
+		dev_err(priv->dev,
+			"Failed to wait for serializer at 0x%02x or 0x%02x: %d\n",
+			power_up_addr, new_addr, ret);
+		return ret;
+	}
+
+	ret = max_ser_reset(adapter, current_addr);
+	if (ret) {
+		dev_err(priv->dev, "Failed to reset serializer: %d\n", ret);
+		return ret;
+	}
+
+	ret = max_ser_wait(adapter, power_up_addr);
+	if (ret) {
+		dev_err(priv->dev,
+			"Failed to wait for serializer at 0x%02x: %d\n",
+			power_up_addr, ret);
+		return ret;
+	}
+
+	ret = max_ser_change_address(adapter, power_up_addr, new_addr);
+	if (ret) {
+		dev_err(priv->dev,
+			"Failed to change serializer from 0x%02x to 0x%02x: %d\n",
+			power_up_addr, new_addr, ret);
+		return ret;
+	}
+
+	ret = max_ser_wait(adapter, new_addr);
+	if (ret) {
+		dev_err(priv->dev,
+			"Failed to wait for serializer at 0x%02x: %d\n",
+			new_addr, ret);
+		return ret;
+	}
+
+	if (des->ops->fix_tx_ids) {
+		ret = max_ser_fix_tx_ids(adapter, new_addr);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int max_des_init(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	ret = des->ops->init(des);
+	if (ret)
+		return ret;
+
+	ret = des->ops->set_enable(des, false);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < des->ops->num_phys; i++) {
+		struct max_des_phy *phy = &des->phys[i];
+
+		if (phy->enabled) {
+			ret = des->ops->init_phy(des, phy);
+			if (ret)
+				return ret;
+		}
+
+		ret = des->ops->set_phy_active(des, phy, false);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		struct max_des_pipe *pipe = &des->pipes[i];
+
+		ret = des->ops->set_pipe_enable(des, pipe, false);
+		if (ret)
+			return ret;
+
+		if (des->ops->set_pipe_tunnel_enable) {
+			ret = des->ops->set_pipe_tunnel_enable(des, pipe, false);
+			if (ret)
+				return ret;
+		}
+
+		ret = des->ops->set_pipe_stream_id(des, pipe, pipe->stream_id);
+		if (ret)
+			return ret;
+
+		ret = max_des_set_pipe_remaps(priv, pipe, pipe->remaps,
+					      pipe->num_remaps);
+		if (ret)
+			return ret;
+	}
+
+	if (!des->ops->init_link)
+		return 0;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+
+		if (!link->enabled)
+			continue;
+
+		ret = des->ops->init_link(des, link);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max_des_ser_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
+				       u16 addr, u16 alias)
+{
+	struct max_des_priv *priv = i2c_atr_get_driver_data(atr);
+	struct max_des *des = priv->des;
+	struct max_des_link *link = &des->links[chan_id];
+	unsigned int i;
+	int ret;
+
+	if (link->ser_xlate.en) {
+		dev_err(priv->dev, "Serializer for link %u already bound\n",
+			link->index);
+		return -EINVAL;
+	}
+
+	for (i = MAX_GMSL_MAX; i >= MAX_GMSL_MIN; i--) {
+		if (!(priv->versions & BIT(i)))
+			continue;
+
+		if (des->ops->select_link_version) {
+			ret = des->ops->select_link_version(des, link, i);
+			if (ret)
+				return ret;
+		}
+
+		ret = max_des_init_link_ser_xlate(priv, link, priv->client->adapter,
+						  addr, alias);
+		if (!ret)
+			break;
+	}
+
+	if (ret) {
+		dev_err(priv->dev, "Cannot find serializer for link %u\n",
+			link->index);
+		return -ENOENT;
+	}
+
+	link->version = i;
+	link->ser_xlate.src = alias;
+	link->ser_xlate.dst = addr;
+	link->ser_xlate.en = true;
+
+	return 0;
+}
+
+static void max_des_ser_atr_detach_addr(struct i2c_atr *atr, u32 chan_id, u16 addr)
+{
+	/* Don't do anything. */
+}
+
+static const struct i2c_atr_ops max_des_i2c_atr_ops = {
+	.attach_addr = max_des_ser_atr_attach_addr,
+	.detach_addr = max_des_ser_atr_detach_addr,
+};
+
+static void max_des_i2c_atr_deinit(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+
+		/* Deleting adapters that haven't been added does no harm. */
+		i2c_atr_del_adapter(priv->atr, link->index);
+	}
+
+	i2c_atr_delete(priv->atr);
+}
+
+static int max_des_i2c_atr_init(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	unsigned int mask = 0;
+	unsigned int i;
+	int ret;
+
+	if (!i2c_check_functionality(priv->client->adapter,
+				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
+		return -ENODEV;
+
+	priv->atr = i2c_atr_new(priv->client->adapter, priv->dev,
+				&max_des_i2c_atr_ops, des->ops->num_links,
+				I2C_ATR_F_STATIC | I2C_ATR_F_PASSTHROUGH);
+	if (IS_ERR(priv->atr))
+		return PTR_ERR(priv->atr);
+
+	i2c_atr_set_driver_data(priv->atr, priv);
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		struct i2c_atr_adap_desc desc = {
+			.chan_id = i,
+		};
+
+		if (!link->enabled)
+			continue;
+
+		ret = i2c_atr_add_adapter(priv->atr, &desc);
+		if (ret)
+			goto err_add_adapters;
+	}
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+
+		if (!link->enabled)
+			continue;
+
+		mask |= BIT(link->index);
+	}
+
+	return des->ops->select_links(des, mask);
+
+err_add_adapters:
+	max_des_i2c_atr_deinit(priv);
+
+	return ret;
+}
+
+static void max_des_i2c_mux_deinit(struct max_des_priv *priv)
+{
+	i2c_mux_del_adapters(priv->mux);
+}
+
+static int max_des_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct max_des_priv *priv = i2c_mux_priv(muxc);
+	struct max_des *des = priv->des;
+
+	if (!des->ops->select_links)
+		return 0;
+
+	return des->ops->select_links(des, BIT(chan));
+}
+
+static int max_des_i2c_mux_init(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	u32 flags = I2C_MUX_LOCKED;
+	unsigned int i;
+	int ret;
+
+	if (des->ops->num_links == 1)
+		flags |= I2C_MUX_GATE;
+
+	priv->mux = i2c_mux_alloc(priv->client->adapter, priv->dev,
+				  des->ops->num_links, 0, flags,
+				  max_des_i2c_mux_select, NULL);
+	if (!priv->mux)
+		return -ENOMEM;
+
+	priv->mux->priv = priv;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+
+		if (!link->enabled)
+			continue;
+
+		ret = i2c_mux_add_adapter(priv->mux, 0, i);
+		if (ret)
+			goto err_add_adapters;
+	}
+
+	return 0;
+
+err_add_adapters:
+	i2c_mux_del_adapters(priv->mux);
+
+	return ret;
+}
+
+static void max_des_i2c_adapter_deinit(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+
+	if (des->ops->select_resets_link)
+		return max_des_i2c_atr_deinit(priv);
+	else
+		return max_des_i2c_mux_deinit(priv);
+}
+
+static int max_des_i2c_adapter_init(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+
+	if (des->ops->select_resets_link)
+		return max_des_i2c_atr_init(priv);
+	else
+		return max_des_i2c_mux_init(priv);
+
+	return 0;
+}
+
+static int max_des_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *format)
+{
+	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_des *des = priv->des;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && des->active)
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (max_des_pad_is_source(des, format->pad))
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int max_des_log_status(struct v4l2_subdev *sd)
+{
+	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_des *des = priv->des;
+	unsigned int i, j;
+	int ret;
+
+	v4l2_info(sd, "active: %u\n", des->active);
+	v4l2_info(sd, "tunnel: %u", des->tunnel);
+	if (des->ops->log_status) {
+		ret = des->ops->log_status(des, sd->name);
+		if (ret)
+			return ret;
+	}
+	v4l2_info(sd, "\n");
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+
+		v4l2_info(sd, "link: %u\n", link->index);
+		v4l2_info(sd, "\tenabled: %u\n", link->enabled);
+
+		if (!link->enabled) {
+			v4l2_info(sd, "\n");
+			continue;
+		}
+
+		v4l2_info(sd, "\tversion: %u\n", link->version);
+		v4l2_info(sd, "\tser_xlate: en: %u, src: 0x%02x dst: 0x%02x\n",
+			  link->ser_xlate.en, link->ser_xlate.src,
+			  link->ser_xlate.dst);
+		v4l2_info(sd, "\n");
+	}
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		struct max_des_pipe *pipe = &des->pipes[i];
+
+		v4l2_info(sd, "pipe: %u\n", pipe->index);
+		v4l2_info(sd, "\tenabled: %u\n", pipe->enabled);
+		if (pipe->phy_id == des->ops->num_phys)
+			v4l2_info(sd, "\tphy_id: invalid\n");
+		else
+			v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
+		v4l2_info(sd, "\tstream_id: %u\n", pipe->stream_id);
+		v4l2_info(sd, "\tlink_id: %u\n", pipe->link_id);
+		v4l2_info(sd, "\tdbl8: %u\n", pipe->mode.dbl8);
+		v4l2_info(sd, "\tdbl8mode: %u\n", pipe->mode.dbl8mode);
+		v4l2_info(sd, "\tdbl10: %u\n", pipe->mode.dbl10);
+		v4l2_info(sd, "\tdbl10mode: %u\n", pipe->mode.dbl10mode);
+		v4l2_info(sd, "\tdbl12: %u\n", pipe->mode.dbl12);
+		v4l2_info(sd, "\tremaps: %u\n", pipe->num_remaps);
+		for (j = 0; j < pipe->num_remaps; j++) {
+			struct max_des_remap *remap = &pipe->remaps[j];
+
+			v4l2_info(sd, "\t\tremap: from: vc: %u, dt: 0x%02x\n",
+				  remap->from_vc, remap->from_dt);
+			v4l2_info(sd, "\t\t       to:   vc: %u, dt: 0x%02x, phy: %u\n",
+				  remap->to_vc, remap->to_dt, remap->phy);
+		}
+		if (des->ops->log_pipe_status) {
+			ret = des->ops->log_pipe_status(des, pipe, sd->name);
+			if (ret)
+				return ret;
+		}
+		v4l2_info(sd, "\n");
+	}
+
+	for (i = 0; i < des->ops->num_phys; i++) {
+		struct max_des_phy *phy = &des->phys[i];
+
+		v4l2_info(sd, "phy: %u\n", phy->index);
+		v4l2_info(sd, "\tenabled: %u\n", phy->enabled);
+
+		if (!phy->enabled) {
+			v4l2_info(sd, "\n");
+			continue;
+		}
+
+		v4l2_info(sd, "\tactive: %u\n", phy->active);
+		v4l2_info(sd, "\tlink_frequency: %llu\n", phy->link_frequency);
+		v4l2_info(sd, "\tnum_data_lanes: %u\n", phy->mipi.num_data_lanes);
+		v4l2_info(sd, "\tclock_lane: %u\n", phy->mipi.clock_lane);
+		v4l2_info(sd, "\talt_mem_map8: %u\n", phy->mode.alt_mem_map8);
+		v4l2_info(sd, "\talt2_mem_map8: %u\n", phy->mode.alt2_mem_map8);
+		v4l2_info(sd, "\talt_mem_map10: %u\n", phy->mode.alt_mem_map10);
+		v4l2_info(sd, "\talt_mem_map12: %u\n", phy->mode.alt_mem_map12);
+		if (des->ops->log_phy_status) {
+			ret = des->ops->log_phy_status(des, phy, sd->name);
+			if (ret)
+				return ret;
+		}
+		v4l2_info(sd, "\n");
+	}
+
+	return 0;
+}
+
+static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_mbus_frame_desc *fd,
+					unsigned int pad)
+{
+	struct max_des_remap_context context = { 0 };
+	struct max_des_priv *priv = sd_to_priv(sd);
+	struct max_des *des = priv->des;
+	struct v4l2_subdev_route *route;
+	struct max_des_phy *phy;
+	int ret;
+
+	phy = max_des_pad_to_phy(des, pad);
+	if (!phy) {
+		dev_err(priv->dev, "Failed to find PHY for pad %u\n", pad);
+		return -ENOENT;
+	}
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	ret = max_des_populate_remap_context(priv, &context, &state->routing);
+	if (ret)
+		return ret;
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		struct max_source *source;
+		struct max_des_link *link;
+		struct max_des_pipe *pipe;
+		unsigned int dst_vc_id;
+
+		if (pad != route->source_pad)
+			continue;
+
+		link = max_des_pad_to_link(des, route->sink_pad);
+		if (!link) {
+			dev_err(priv->dev, "Failed to find link for pad %u\n",
+				route->sink_pad);
+			return -ENOENT;
+		}
+
+		pipe = max_des_find_link_pipe(des, link);
+		if (!pipe)
+			return -ENOENT;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to find frame desc entry for stream %u:%u: %d\n",
+				route->sink_pad, route->sink_stream, ret);
+			return ret;
+		}
+
+		ret = max_des_map_src_dst_vc_id(&context, pipe->index, phy->index,
+						entry.bus.csi2.vc, &dst_vc_id);
+		if (ret)
+			return ret;
+
+		entry.bus.csi2.vc = dst_vc_id;
+		entry.stream = route->source_stream;
+
+		fd->entry[fd->num_entries++] = entry;
+	}
+
+	return 0;
+}
+
+static int max_des_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct max_des_priv *priv = sd_to_priv(sd);
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
+
+	ret = max_des_get_frame_desc_state(sd, state, fd, pad);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int max_des_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
+{
+	struct max_des_priv *priv = sd_to_priv(sd);
+	struct max_des *des = priv->des;
+	struct max_des_phy *phy;
+
+	phy = max_des_pad_to_phy(des, pad);
+	if (!phy)
+		return -EINVAL;
+
+	cfg->type = phy->bus_type;
+	cfg->bus.mipi_csi2 = phy->mipi;
+	cfg->link_freq = phy->link_frequency;
+
+	return 0;
+}
+
+static int max_des_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       enum v4l2_subdev_format_whence which,
+			       struct v4l2_subdev_krouting *routing)
+{
+	struct max_des_priv *priv = sd_to_priv(sd);
+	struct max_des *des = priv->des;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && des->active)
+		return -EBUSY;
+
+	/*
+	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
+	 * frame desc is made dynamically allocated.
+	 */
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -E2BIG;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
+static int max_des_update_link(struct max_des_priv *priv,
+			       struct max_des_remap_context *context,
+			       struct max_des_link *link,
+			       const struct v4l2_subdev_krouting *routing,
+			       u64 streams_mask)
+{
+	struct max_source *source;
+	struct max_des *des = priv->des;
+	u32 pad = max_des_link_to_pad(des, link);
+	bool enable_changed = !streams_mask != !priv->streams_masks[pad];
+	bool enable = !!streams_mask;
+	struct max_des_pipe *pipe;
+	int ret;
+
+	pipe = max_des_find_link_pipe(des, link);
+	if (!pipe)
+		return -ENOENT;
+
+	source = max_des_find_link_source(priv, link);
+	if (!source)
+		return -ENOENT;
+
+	if (!source->sd)
+		return 0;
+
+	if (!enable && enable_changed) {
+		ret = max_des_set_pipe_enable(des, pipe, enable);
+		if (ret)
+			return ret;
+	}
+
+	ret = max_des_update_pipe(priv, context, source, pipe,
+				  routing, pad, streams_mask);
+	if (ret)
+		goto err_revert_pipe_disable;
+
+	if (enable && enable_changed) {
+		ret = max_des_set_pipe_enable(des, pipe, enable);
+		if (ret)
+			goto err_revert_update_pipe;
+	}
+
+	return 0;
+
+err_revert_update_pipe:
+	max_des_update_pipe(priv, context, source, pipe,
+			    routing, pad, priv->streams_masks[pad]);
+
+err_revert_pipe_disable:
+	if (!enable && enable_changed)
+		max_des_set_pipe_enable(des, pipe, !enable);
+
+	return ret;
+}
+
+static int max_des_update_phy(struct max_des_priv *priv,
+			      const struct v4l2_subdev_krouting *routing,
+			      u32 pad, u64 *streams_masks)
+{
+	bool enable_changed = !streams_masks[pad] != !priv->streams_masks[pad];
+	bool enable = !!streams_masks[pad];
+	struct max_des *des = priv->des;
+	struct max_des_phy *phy;
+	int ret;
+
+	phy = max_des_pad_to_phy(des, pad);
+	if (!phy)
+		return -EINVAL;
+
+	if (enable_changed) {
+		ret = max_des_set_phy_active(des, phy, enable);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max_des_update_active(struct max_des_priv *priv, u64 *streams_masks,
+				 bool expected_active)
+{
+	struct max_des *des = priv->des;
+	bool active = false;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_phys; i++) {
+		struct max_des_phy *phy = &des->phys[i];
+		u32 pad = max_des_phy_to_pad(des, phy);
+
+		if (streams_masks[pad]) {
+			active = true;
+			break;
+		}
+	}
+
+	if (active != expected_active || des->active == active)
+		return 0;
+
+	ret = des->ops->set_enable(des, active);
+	if (ret)
+		return ret;
+
+	des->active = active;
+
+	return 0;
+}
+
+static int max_des_update_links(struct max_des_priv *priv,
+				struct max_des_remap_context *context,
+				const struct v4l2_subdev_krouting *routing,
+				u64 *streams_masks)
+{
+	struct max_des *des = priv->des;
+	unsigned int failed_update_link_id = des->ops->num_links;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		u32 sink_pad = max_des_link_to_pad(des, link);
+
+		ret = max_des_update_link(priv, context, link, routing,
+					  streams_masks[sink_pad]);
+		if (ret) {
+			failed_update_link_id = i;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = 0; i < failed_update_link_id; i++) {
+		struct max_des_link *link = &des->links[i];
+		u32 sink_pad = max_des_link_to_pad(des, link);
+
+		max_des_update_link(priv, context, link, routing,
+				    priv->streams_masks[sink_pad]);
+	}
+
+	return ret;
+}
+
+static int max_des_enable_disable_streams(struct max_des_priv *priv,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 updated_streams_mask,
+					  bool enable)
+{
+	struct max_des *des = priv->des;
+
+	return max_xlate_enable_disable_streams(priv->sources, 0, state,
+						pad, updated_streams_mask, 0,
+						des->ops->num_links, enable);
+}
+
+static int max_des_update_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 updated_streams_mask, bool enable)
+{
+	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_des_remap_context context = { 0 };
+	struct max_des_mode_context mode_context = { 0 };
+	struct max_des *des = priv->des;
+	unsigned int num_pads = max_des_num_pads(des);
+	u64 *streams_masks;
+	int ret;
+
+	ret = max_des_populate_remap_context(priv, &context, &state->routing);
+	if (ret)
+		return ret;
+
+	ret = max_des_populate_mode_context(priv, &mode_context, &state->routing);
+	if (ret)
+		return ret;
+
+	ret = max_get_streams_masks(priv->dev, state, pad, updated_streams_mask,
+				    num_pads, 0, des->ops->num_links,
+				    priv->streams_masks, &streams_masks, enable);
+	if (ret)
+		return ret;
+
+	ret = max_des_set_pipes_phy(priv, &context);
+	if (ret)
+		goto err_free_streams_masks;
+
+	ret = max_des_set_tunnel(priv, &context);
+	if (ret)
+		goto err_free_streams_masks;
+
+	ret = max_des_set_modes(priv, &mode_context);
+	if (ret)
+		goto err_free_streams_masks;
+
+	if (!enable) {
+		ret = max_des_enable_disable_streams(priv, state, pad,
+						     updated_streams_mask, enable);
+		if (ret)
+			goto err_free_streams_masks;
+	}
+
+	ret = max_des_update_active(priv, streams_masks, false);
+	if (ret)
+		goto err_revert_streams_disable;
+
+	ret = max_des_update_links(priv, &context, &state->routing, streams_masks);
+	if (ret)
+		goto err_revert_active_disable;
+
+	ret = max_des_update_phy(priv, &state->routing, pad, streams_masks);
+	if (ret)
+		goto err_revert_links_update;
+
+	ret = max_des_update_active(priv, streams_masks, true);
+	if (ret)
+		goto err_revert_phy_update;
+
+	if (enable) {
+		ret = max_des_enable_disable_streams(priv, state, pad,
+						     updated_streams_mask, enable);
+		if (ret)
+			goto err_revert_active_enable;
+	}
+
+	devm_kfree(priv->dev, priv->streams_masks);
+	priv->streams_masks = streams_masks;
+
+	return 0;
+
+err_revert_active_enable:
+	max_des_update_active(priv, priv->streams_masks, false);
+
+err_revert_phy_update:
+	max_des_update_phy(priv, &state->routing, pad, priv->streams_masks);
+
+err_revert_links_update:
+	max_des_update_links(priv, &context, &state->routing, priv->streams_masks);
+
+err_revert_active_disable:
+	max_des_update_active(priv, priv->streams_masks, true);
+
+err_revert_streams_disable:
+	if (!enable)
+		max_des_enable_disable_streams(priv, state, pad,
+					       updated_streams_mask, !enable);
+
+err_free_streams_masks:
+	devm_kfree(priv->dev, streams_masks);
+
+	return ret;
+}
+
+static int max_des_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	return max_des_update_streams(sd, state, pad, streams_mask, true);
+}
+
+static int max_des_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	return max_des_update_streams(sd, state, pad, streams_mask, false);
+}
+
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int max_des_g_register(struct v4l2_subdev *sd,
+			      struct v4l2_dbg_register *reg)
+{
+	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_des *des = priv->des;
+	unsigned int val;
+	int ret;
+
+	ret = des->ops->reg_read(des, reg->reg, &val);
+	if (ret)
+		return ret;
+
+	reg->val = val;
+	reg->size = 1;
+
+	return 0;
+}
+
+static int max_des_s_register(struct v4l2_subdev *sd,
+			      const struct v4l2_dbg_register *reg)
+{
+	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_des *des = priv->des;
+
+	return des->ops->reg_write(des, reg->reg, reg->val);
+}
+#endif
+
+static const struct v4l2_subdev_core_ops max_des_core_ops = {
+	.log_status = max_des_log_status,
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = max_des_g_register,
+	.s_register = max_des_s_register,
+#endif
+};
+
+static const struct v4l2_subdev_pad_ops max_des_pad_ops = {
+	.enable_streams = max_des_enable_streams,
+	.disable_streams = max_des_disable_streams,
+
+	.set_routing = max_des_set_routing,
+	.get_frame_desc = max_des_get_frame_desc,
+
+	.get_mbus_config = max_des_get_mbus_config,
+
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = max_des_set_fmt,
+};
+
+static const struct v4l2_subdev_ops max_des_subdev_ops = {
+	.core = &max_des_core_ops,
+	.pad = &max_des_pad_ops,
+};
+
+static const struct media_entity_operations max_des_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int max_des_notify_bound(struct v4l2_async_notifier *nf,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_connection *base_asc)
+{
+	struct max_des_priv *priv = nf_to_priv(nf);
+	struct max_asc *asc = asc_to_max(base_asc);
+	struct max_source *source = asc->source;
+	struct max_des *des = priv->des;
+	struct max_des_link *link = &des->links[source->index];
+	u32 pad = max_des_link_to_pad(des, link);
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&subdev->entity,
+					  source->ep_fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
+		return ret;
+	}
+
+	source->sd = subdev;
+	source->pad = ret;
+
+	ret = media_create_pad_link(&source->sd->entity, source->pad,
+				    &priv->sd.entity, pad,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(priv->dev, "Unable to link %s:%u -> %s:%u\n",
+			source->sd->name, source->pad, priv->sd.name, pad);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max_des_notify_unbind(struct v4l2_async_notifier *nf,
+				  struct v4l2_subdev *subdev,
+				  struct v4l2_async_connection *base_asc)
+{
+	struct max_asc *asc = asc_to_max(base_asc);
+	struct max_source *source = asc->source;
+
+	source->sd = NULL;
+}
+
+static const struct v4l2_async_notifier_operations max_des_notify_ops = {
+	.bound = max_des_notify_bound,
+	.unbind = max_des_notify_unbind,
+};
+
+static int max_des_v4l2_notifier_register(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	v4l2_async_subdev_nf_init(&priv->nf, &priv->sd);
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		struct max_source *source;
+		struct max_asc *asc;
+
+		if (!link->enabled)
+			continue;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->ep_fwnode)
+			continue;
+
+		asc = v4l2_async_nf_add_fwnode(&priv->nf, source->ep_fwnode,
+					       struct max_asc);
+		if (IS_ERR(asc)) {
+			dev_err(priv->dev,
+				"Failed to add subdev for source %u: %pe", i,
+				asc);
+
+			v4l2_async_nf_cleanup(&priv->nf);
+
+			return PTR_ERR(asc);
+		}
+
+		asc->source = source;
+	}
+
+	priv->nf.ops = &max_des_notify_ops;
+
+	ret = v4l2_async_nf_register(&priv->nf);
+	if (ret) {
+		dev_err(priv->dev, "Failed to register subdev notifier");
+		v4l2_async_nf_cleanup(&priv->nf);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max_des_v4l2_notifier_unregister(struct max_des_priv *priv)
+{
+	v4l2_async_nf_unregister(&priv->nf);
+	v4l2_async_nf_cleanup(&priv->nf);
+}
+
+static int max_des_v4l2_register(struct max_des_priv *priv)
+{
+	struct v4l2_subdev *sd = &priv->sd;
+	struct max_des *des = priv->des;
+	void *data = i2c_get_clientdata(priv->client);
+	unsigned int num_pads = max_des_num_pads(des);
+	unsigned int i;
+	int ret;
+
+	v4l2_i2c_subdev_init(sd, priv->client, &max_des_subdev_ops);
+	i2c_set_clientdata(priv->client, data);
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &max_des_media_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+
+	for (i = 0; i < num_pads; i++) {
+		if (max_des_pad_is_sink(des, i))
+			priv->pads[i].flags = MEDIA_PAD_FL_SINK;
+		else
+			priv->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+	}
+
+	v4l2_set_subdevdata(sd, priv);
+
+	ret = media_entity_pads_init(&sd->entity, num_pads, priv->pads);
+	if (ret)
+		return ret;
+
+	ret = max_des_v4l2_notifier_register(priv);
+	if (ret)
+		goto err_media_entity_cleanup;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_nf_cleanup;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret)
+		goto err_sd_cleanup;
+
+	return 0;
+
+err_sd_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_nf_cleanup:
+	max_des_v4l2_notifier_unregister(priv);
+err_media_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static void max_des_v4l2_unregister(struct max_des_priv *priv)
+{
+	struct v4l2_subdev *sd = &priv->sd;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	max_des_v4l2_notifier_unregister(priv);
+	media_entity_cleanup(&sd->entity);
+}
+
+static int max_des_update_pocs(struct max_des_priv *priv, bool enable)
+{
+	struct max_des *des = priv->des;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		unsigned int index = link->index;
+
+		if (!link->enabled)
+			continue;
+
+		if (!priv->pocs)
+			continue;
+
+		if (enable)
+			ret = regulator_enable(priv->pocs[index]);
+		else
+			ret = regulator_disable(priv->pocs[index]);
+
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to set POC supply to %u: %u\n",
+				enable, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int max_des_parse_sink_dt_endpoint(struct max_des_priv *priv,
+					  struct max_des_link *link,
+					  struct max_source *source,
+					  struct fwnode_handle *fwnode)
+{
+	struct max_des *des = priv->des;
+	u32 pad = max_des_link_to_pad(des, link);
+	unsigned int index = link->index;
+	struct fwnode_handle *ep;
+	char poc_name[10];
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
+	if (!ep)
+		return 0;
+
+	source->ep_fwnode = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
+	if (!source->ep_fwnode) {
+		dev_err(priv->dev,
+			"Failed to get remote endpoint on port %u\n", pad);
+		return -ENODEV;
+	}
+
+	snprintf(poc_name, sizeof(poc_name), "port%u-poc", index);
+	priv->pocs[index] = devm_regulator_get_optional(priv->dev, poc_name);
+	if (IS_ERR(priv->pocs[index])) {
+		ret = PTR_ERR(priv->pocs[index]);
+		if (ret != -ENODEV) {
+			dev_err(priv->dev,
+				"Failed to get POC supply on port %u: %d\n",
+				index, ret);
+			goto err_put_source_ep_fwnode;
+		}
+
+		priv->pocs[index] = NULL;
+	}
+
+	link->enabled = true;
+
+	return 0;
+
+err_put_source_ep_fwnode:
+	fwnode_handle_put(source->ep_fwnode);
+
+	return ret;
+}
+
+static int max_des_parse_src_dt_endpoint(struct max_des_priv *priv,
+					 struct max_des_phy *phy,
+					 struct fwnode_handle *fwnode)
+{
+	struct max_des *des = priv->des;
+	u32 pad = max_des_phy_to_pad(des, phy);
+	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = V4L2_MBUS_UNKNOWN };
+	struct v4l2_mbus_config_mipi_csi2 *mipi = &v4l2_ep.bus.mipi_csi2;
+	enum v4l2_mbus_type bus_type;
+	struct fwnode_handle *ep;
+	u64 link_frequency;
+	unsigned int i;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
+	if (!ep)
+		return 0;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &v4l2_ep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		dev_err(priv->dev, "Could not parse endpoint on port %u\n", pad);
+		return ret;
+	}
+
+	bus_type = v4l2_ep.bus_type;
+	if (bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    bus_type != V4L2_MBUS_CSI2_CPHY) {
+		v4l2_fwnode_endpoint_free(&v4l2_ep);
+		dev_err(priv->dev, "Unsupported bus-type %u on port %u\n",
+			pad, bus_type);
+		return -EINVAL;
+	}
+
+	ret = 0;
+	if (v4l2_ep.nr_of_link_frequencies == 0)
+		link_frequency = MAX_DES_LINK_FREQUENCY_DEFAULT;
+	else if (v4l2_ep.nr_of_link_frequencies == 1)
+		link_frequency = v4l2_ep.link_frequencies[0];
+	else
+		ret = -EINVAL;
+
+	v4l2_fwnode_endpoint_free(&v4l2_ep);
+
+	if (ret) {
+		dev_err(priv->dev, "Invalid link frequencies %u on port %u\n",
+			v4l2_ep.nr_of_link_frequencies, pad);
+		return -EINVAL;
+	}
+
+	if (link_frequency < MAX_DES_LINK_FREQUENCY_MIN ||
+	    link_frequency > MAX_DES_LINK_FREQUENCY_MAX) {
+		dev_err(priv->dev, "Invalid link frequency %llu on port %u\n",
+			link_frequency, pad);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < mipi->num_data_lanes; i++) {
+		if (mipi->data_lanes[i] > mipi->num_data_lanes) {
+			dev_err(priv->dev, "Invalid data lane %u on port %u\n",
+				mipi->data_lanes[i], pad);
+			return -EINVAL;
+		}
+	}
+
+	phy->bus_type = bus_type;
+	phy->mipi = *mipi;
+	phy->link_frequency = link_frequency;
+	phy->enabled = true;
+
+	return 0;
+}
+
+int max_des_phy_hw_data_lanes(struct max_des *des, struct max_des_phy *phy)
+{
+	const struct max_phys_configs *configs = &des->ops->phys_configs;
+	const struct max_phys_config *config = &configs->configs[des->phys_config];
+
+	return config->lanes[phy->index];
+}
+EXPORT_SYMBOL(max_des_phy_hw_data_lanes);
+
+static int max_des_find_phys_config(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	const struct max_phys_configs *configs = &des->ops->phys_configs;
+	struct max_des_phy *phy;
+	unsigned int i, j;
+
+	if (!configs->num_configs)
+		return 0;
+
+	for (i = 0; i < configs->num_configs; i++) {
+		const struct max_phys_config *config = &configs->configs[i];
+		bool matching = true;
+
+		for (j = 0; j < des->ops->num_phys; j++) {
+			phy = &des->phys[j];
+
+			if (!phy->enabled)
+				continue;
+
+			if (phy->mipi.num_data_lanes <= config->lanes[j] &&
+			    phy->mipi.clock_lane == config->clock_lane[j])
+				continue;
+
+			matching = false;
+
+			break;
+		}
+
+		if (matching)
+			break;
+	}
+
+	if (i == configs->num_configs) {
+		dev_err(priv->dev, "Invalid lane configuration\n");
+		return -EINVAL;
+	}
+
+	des->phys_config = i;
+
+	return 0;
+}
+
+static int max_des_parse_dt(struct max_des_priv *priv)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(priv->dev);
+	struct max_des *des = priv->des;
+	struct max_des_link *link;
+	struct max_des_pipe *pipe;
+	struct max_des_phy *phy;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < des->ops->num_phys; i++) {
+		phy = &des->phys[i];
+		phy->index = i;
+
+		ret = max_des_parse_src_dt_endpoint(priv, phy, fwnode);
+		if (ret)
+			return ret;
+	}
+
+	ret = max_des_find_phys_config(priv);
+	if (ret)
+		return ret;
+
+	/* Find an unsed PHY to send unampped data to. */
+	for (i = 0; i < des->ops->num_phys; i++) {
+		phy = &des->phys[i];
+
+		if (!phy->enabled) {
+			priv->unused_phy = phy;
+			break;
+		}
+	}
+
+	for (i = 0; i < des->ops->num_pipes; i++) {
+		pipe = &des->pipes[i];
+		pipe->index = i;
+
+		/*
+		 * Serializers can send data on different stream ids over the
+		 * same link, and some deserializers support stream id autoselect
+		 * allowing them to receive data from all stream ids.
+		 * Deserializers that support that feature should enable it.
+		 * Others are limited to using just stream id 0 for now to
+		 * prevent the routing from getting too complicated.
+		 */
+		pipe->stream_id = 0;
+
+		/*
+		 * We already checked that num_pipes >= num_links.
+		 * Set up pipe to receive data from the link with the same index.
+		 * This is already the default for most chips, and some of them
+		 * don't even support receiving pipe data from a different link.
+		 */
+		pipe->link_id = i;
+	}
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		link = &des->links[i];
+		link->index = i;
+	}
+
+	for (i = 0; i < des->ops->num_links; i++) {
+		struct max_des_link *link = &des->links[i];
+		struct max_source *source;
+
+		source = max_des_find_link_source(priv, link);
+		if (!source)
+			return -ENOENT;
+
+		source->index = i;
+
+		ret = max_des_parse_sink_dt_endpoint(priv, link, source, fwnode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max_des_allocate(struct max_des_priv *priv)
+{
+	struct max_des *des = priv->des;
+	unsigned int num_pads = max_des_num_pads(des);
+
+	des->phys = devm_kcalloc(priv->dev, des->ops->num_phys,
+				 sizeof(*des->phys), GFP_KERNEL);
+	if (!des->phys)
+		return -ENOMEM;
+
+	des->pipes = devm_kcalloc(priv->dev, des->ops->num_pipes,
+				  sizeof(*des->pipes), GFP_KERNEL);
+	if (!des->pipes)
+		return -ENOMEM;
+
+	des->links = devm_kcalloc(priv->dev, des->ops->num_links,
+				  sizeof(*des->links), GFP_KERNEL);
+	if (!des->links)
+		return -ENOMEM;
+
+	priv->sources = devm_kcalloc(priv->dev, des->ops->num_links,
+				     sizeof(*priv->sources), GFP_KERNEL);
+	if (!priv->sources)
+		return -ENOMEM;
+
+	priv->pocs = devm_kcalloc(priv->dev, des->ops->num_links,
+				  sizeof(*priv->pocs), GFP_KERNEL);
+	if (!priv->pocs)
+		return -ENOMEM;
+
+	priv->pads = devm_kcalloc(priv->dev, num_pads,
+				  sizeof(*priv->pads), GFP_KERNEL);
+	if (!priv->pads)
+		return -ENOMEM;
+
+	priv->streams_masks = devm_kcalloc(priv->dev, num_pads,
+					   sizeof(*priv->streams_masks),
+					   GFP_KERNEL);
+	if (!priv->streams_masks)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int max_des_probe(struct i2c_client *client, struct max_des *des)
+{
+	struct device *dev = &client->dev;
+	struct max_des_priv *priv;
+	int ret;
+
+	if (des->ops->num_phys > MAX_DES_PHYS_NUM)
+		return -E2BIG;
+
+	if (des->ops->num_pipes > MAX_DES_PIPES_NUM)
+		return -E2BIG;
+
+	if (des->ops->num_links > des->ops->num_pipes)
+		return -E2BIG;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (des->ops->select_link_version && !des->ops->select_links) {
+		dev_err(dev,
+			"Cannot implement .select_link_version() without .select_links()\n");
+		return -EINVAL;
+	}
+
+	if (des->ops->select_link_version && !des->ops->select_resets_link) {
+		dev_err(dev,
+			"Cannot implement .select_link_version() without .select_resets_link\n");
+		return -EINVAL;
+	}
+
+	priv->versions = des->ops->versions;
+	if (!priv->versions)
+		priv->versions = BIT(MAX_GMSL_2);
+
+	if (hweight_long(priv->versions) != 1 &&
+	    !des->ops->select_link_version) {
+		dev_err(dev, "Multiple version without .select_link_version()\n");
+		return -EINVAL;
+	}
+
+	priv->client = client;
+	priv->dev = dev;
+	priv->des = des;
+	des->priv = priv;
+
+	ret = max_des_allocate(priv);
+	if (ret)
+		return ret;
+
+	ret = max_des_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	ret = max_des_init(priv);
+	if (ret)
+		return ret;
+
+	ret = max_des_update_pocs(priv, true);
+	if (ret)
+		return ret;
+
+	ret = max_des_i2c_adapter_init(priv);
+	if (ret)
+		goto err_disable_pocs;
+
+	ret = max_des_v4l2_register(priv);
+	if (ret)
+		goto err_i2c_adapter_deinit;
+
+	return 0;
+
+err_i2c_adapter_deinit:
+	max_des_i2c_adapter_deinit(priv);
+
+err_disable_pocs:
+	max_des_update_pocs(priv, false);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(max_des_probe);
+
+int max_des_remove(struct max_des *des)
+{
+	struct max_des_priv *priv = des->priv;
+
+	max_des_v4l2_unregister(priv);
+
+	max_des_i2c_adapter_deinit(priv);
+
+	max_des_update_pocs(priv, false);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max_des_remove);
+
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("I2C_ATR");
diff --git a/drivers/media/i2c/maxim-serdes/max_des.h b/drivers/media/i2c/maxim-serdes/max_des.h
new file mode 100644
index 000000000000..3ce16d03a8a3
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_des.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#ifndef MAX_DES_H
+#define MAX_DES_H
+
+#include <media/v4l2-mediabus.h>
+
+#include "max_serdes.h"
+
+#define MAX_DES_DT_VC(dt, vc) (((vc) & 0x3) << 6 | ((dt) & 0x3f))
+
+struct max_des_remap {
+	u8 from_dt;
+	u8 from_vc;
+	u8 to_dt;
+	u8 to_vc;
+	u8 phy;
+};
+
+struct max_des_link {
+	unsigned int index;
+	bool enabled;
+	enum max_gmsl_version version;
+	struct max_i2c_xlate ser_xlate;
+};
+
+struct max_des_pipe_mode {
+	bool dbl8;
+	bool dbl10;
+	bool dbl12;
+	bool dbl8mode;
+	bool dbl10mode;
+};
+
+struct max_des_pipe {
+	unsigned int index;
+	unsigned int stream_id;
+	unsigned int link_id;
+	unsigned int phy_id;
+	struct max_des_remap *remaps;
+	unsigned int num_remaps;
+	struct max_des_pipe_mode mode;
+	bool enabled;
+};
+
+struct max_des_phy_mode {
+	bool alt_mem_map8;
+	bool alt2_mem_map8;
+	bool alt_mem_map10;
+	bool alt_mem_map12;
+};
+
+struct max_des_phy {
+	unsigned int index;
+	s64 link_frequency;
+	struct v4l2_mbus_config_mipi_csi2 mipi;
+	enum v4l2_mbus_type bus_type;
+	struct max_des_phy_mode mode;
+	bool enabled;
+	bool active;
+};
+
+struct max_des;
+
+struct max_des_ops {
+	unsigned int num_phys;
+	unsigned int num_pipes;
+	unsigned int num_links;
+	unsigned int num_remaps_per_pipe;
+	unsigned int versions;
+	bool fix_tx_ids;
+	bool select_resets_link;
+
+	struct max_phys_configs phys_configs;
+
+	int (*reg_read)(struct max_des *des, unsigned int reg, unsigned int *val);
+	int (*reg_write)(struct max_des *des, unsigned int reg, unsigned int val);
+	int (*log_status)(struct max_des *des, const char *name);
+	int (*log_pipe_status)(struct max_des *des, struct max_des_pipe *pipe,
+			       const char *name);
+	int (*log_phy_status)(struct max_des *des, struct max_des_phy *phy,
+			      const char *name);
+	int (*set_enable)(struct max_des *des, bool enable);
+	int (*init)(struct max_des *des);
+	int (*init_phy)(struct max_des *des, struct max_des_phy *phy);
+	int (*set_phy_mode)(struct max_des *des, struct max_des_phy *phy,
+			    struct max_des_phy_mode *mode);
+	int (*set_phy_active)(struct max_des *des, struct max_des_phy *phy,
+			      bool active);
+	int (*set_pipe_stream_id)(struct max_des *des, struct max_des_pipe *pipe,
+				  unsigned int stream_id);
+	int (*set_pipe_phy)(struct max_des *des, struct max_des_pipe *pipe,
+			    struct max_des_phy *phy);
+	int (*set_pipe_enable)(struct max_des *des, struct max_des_pipe *pipe,
+			       bool enable);
+	int (*set_pipe_remap)(struct max_des *des, struct max_des_pipe *pipe,
+			      unsigned int i, struct max_des_remap *remap);
+	int (*set_pipe_remaps_enable)(struct max_des *des, struct max_des_pipe *pipe,
+				      unsigned int mask);
+	int (*set_pipe_mode)(struct max_des *des, struct max_des_pipe *pipe,
+			     struct max_des_pipe_mode *mode);
+	int (*set_pipe_tunnel_enable)(struct max_des *des, struct max_des_pipe *pipe,
+				      bool enable);
+	int (*init_link)(struct max_des *des, struct max_des_link *link);
+	int (*select_links)(struct max_des *des, unsigned int mask);
+	int (*select_link_version)(struct max_des *des, struct max_des_link *link,
+				   enum max_gmsl_version version);
+};
+
+struct max_des_priv;
+
+struct max_des {
+	struct max_des_priv *priv;
+
+	const struct max_des_ops *ops;
+
+	struct max_des_phy *phys;
+	struct max_des_pipe *pipes;
+	struct max_des_link *links;
+
+	unsigned int phys_config;
+	bool tunnel;
+	bool active;
+};
+
+int max_des_probe(struct i2c_client *client, struct max_des *des);
+
+int max_des_remove(struct max_des *des);
+
+int max_des_phy_hw_data_lanes(struct max_des *des, struct max_des_phy *phy);
+
+#endif // MAX_DES_H
diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c/maxim-serdes/max_ser.c
new file mode 100644
index 000000000000..5302ff8da25c
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_ser.c
@@ -0,0 +1,1584 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Maxim GMSL2 Serializer Driver
+ *
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c-atr.h>
+#include <linux/i2c-mux.h>
+#include <linux/module.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#include "max_ser.h"
+#include "max_serdes.h"
+
+#define MAX_SER_NUM_LINKS	1
+
+struct max_ser_priv {
+	struct max_ser *ser;
+	struct device *dev;
+	struct i2c_client *client;
+
+	struct i2c_atr *atr;
+	struct i2c_mux_core *mux;
+
+	struct media_pad *pads;
+	struct max_source *sources;
+	u64 *streams_masks;
+	u32 double_bpps;
+
+	struct v4l2_subdev sd;
+	struct v4l2_async_notifier nf;
+};
+
+static inline struct max_ser_priv *sd_to_priv(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct max_ser_priv, sd);
+}
+
+static inline struct max_ser_priv *nf_to_priv(struct v4l2_async_notifier *nf)
+{
+	return container_of(nf, struct max_ser_priv, nf);
+}
+
+static inline bool max_ser_pad_is_sink(struct max_ser *ser, u32 pad)
+{
+	return pad < ser->ops->num_phys;
+}
+
+static inline bool max_ser_pad_is_source(struct max_ser *ser, u32 pad)
+{
+	return pad >= ser->ops->num_phys;
+}
+
+static inline unsigned int max_ser_phy_to_pad(struct max_ser *ser,
+					      struct max_ser_phy *phy)
+{
+	return phy->index;
+}
+
+static inline unsigned int max_ser_num_pads(struct max_ser *ser)
+{
+	return ser->ops->num_phys + MAX_SER_NUM_LINKS;
+}
+
+static struct max_ser_phy *max_ser_pad_to_phy(struct max_ser *ser, u32 pad)
+{
+	if (!max_ser_pad_is_sink(ser, pad))
+		return NULL;
+
+	return &ser->phys[pad];
+}
+
+static struct max_ser_pipe *
+max_ser_find_phy_pipe(struct max_ser *ser, struct max_ser_phy *phy)
+{
+	unsigned int i;
+
+	for (i = 0; i < ser->ops->num_pipes; i++) {
+		struct max_ser_pipe *pipe = &ser->pipes[i];
+
+		if (pipe->phy_id == phy->index)
+			return pipe;
+	}
+
+	return NULL;
+}
+
+static struct max_source *
+max_ser_find_phy_source(struct max_ser_priv *priv, struct max_ser_phy *phy)
+{
+	return &priv->sources[phy->index];
+}
+
+static int max_ser_phy_set_active(struct max_ser *ser, struct max_ser_phy *phy,
+				  bool active)
+{
+	int ret;
+
+	ret = ser->ops->set_phy_active(ser, phy, active);
+	if (ret)
+		return ret;
+
+	phy->active = active;
+
+	return 0;
+}
+
+static int max_ser_set_pipe_enable(struct max_ser *ser, struct max_ser_pipe *pipe,
+				   bool enable)
+{
+	int ret;
+
+	ret = ser->ops->set_pipe_enable(ser, pipe, enable);
+	if (ret)
+		return ret;
+
+	pipe->enabled = enable;
+
+	return 0;
+}
+
+static int max_ser_set_pipe_dts(struct max_ser_priv *priv, struct max_ser_pipe *pipe,
+				unsigned int *dts, unsigned int num_dts)
+{
+	struct max_ser *ser = priv->ser;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_dts; i++) {
+		ret = ser->ops->set_pipe_dt(ser, pipe, i, dts[i]);
+		if (ret)
+			return ret;
+
+		ret = ser->ops->set_pipe_dt_en(ser, pipe, i, true);
+		if (ret)
+			return ret;
+	}
+
+	if (num_dts == pipe->num_dts)
+		return 0;
+
+	for (i = num_dts; i < ser->ops->num_dts_per_pipe; i++) {
+		ret = ser->ops->set_pipe_dt_en(ser, pipe, i, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max_ser_set_pipe_mode(struct max_ser_priv *priv, struct max_ser_pipe *pipe,
+				 struct max_ser_pipe_mode *mode)
+{
+	struct max_ser *ser = priv->ser;
+
+	if (mode->bpp == pipe->mode.bpp &&
+	    mode->soft_bpp == pipe->mode.soft_bpp &&
+	    mode->dbl8 == pipe->mode.dbl8 &&
+	    mode->dbl10 == pipe->mode.dbl10 &&
+	    mode->dbl12 == pipe->mode.dbl12)
+		return 0;
+
+	return ser->ops->set_pipe_mode(ser, pipe, mode);
+}
+
+static int max_ser_i2c_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
+				       u16 addr, u16 alias)
+{
+	struct max_i2c_xlate xlate = { .src = alias, .dst = addr, .en = true };
+	struct max_ser_priv *priv = i2c_atr_get_driver_data(atr);
+	struct max_ser *ser = priv->ser;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ser->ops->num_i2c_xlates; i++)
+		if (!ser->i2c_xlates[i].en)
+			break;
+
+	if (i == ser->ops->num_i2c_xlates) {
+		dev_err(priv->dev,
+			"Reached maximum number of I2C translations\n");
+		return -EINVAL;
+	}
+
+	ret = ser->ops->set_i2c_xlate(ser, i, &xlate);
+	if (ret)
+		return ret;
+
+	ser->i2c_xlates[i] = xlate;
+
+	return 0;
+}
+
+static void max_ser_i2c_atr_detach_addr(struct i2c_atr *atr, u32 chan_id, u16 addr)
+{
+	struct max_ser_priv *priv = i2c_atr_get_driver_data(atr);
+	struct max_ser *ser = priv->ser;
+	struct max_i2c_xlate xlate = { 0 };
+	unsigned int i;
+
+	/* Find index of matching I2C translation. */
+	for (i = 0; i < ser->ops->num_i2c_xlates; i++)
+		if (ser->i2c_xlates[i].dst == addr)
+			break;
+
+	WARN_ON(i == ser->ops->num_i2c_xlates);
+
+	ser->ops->set_i2c_xlate(ser, i, &xlate);
+	ser->i2c_xlates[i] = xlate;
+}
+
+static const struct i2c_atr_ops max_ser_i2c_atr_ops = {
+	.attach_addr = max_ser_i2c_atr_attach_addr,
+	.detach_addr = max_ser_i2c_atr_detach_addr,
+};
+
+static void max_ser_i2c_atr_deinit(struct max_ser_priv *priv)
+{
+	/* Deleting adapters that haven't been added does no harm. */
+	i2c_atr_del_adapter(priv->atr, 0);
+
+	i2c_atr_delete(priv->atr);
+}
+
+static int max_ser_i2c_atr_init(struct max_ser_priv *priv)
+{
+	struct i2c_atr_adap_desc desc = {
+		.chan_id = 0,
+	};
+
+	if (!i2c_check_functionality(priv->client->adapter,
+				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
+		return -ENODEV;
+
+	priv->atr = i2c_atr_new(priv->client->adapter, priv->dev,
+				&max_ser_i2c_atr_ops, 1, 0);
+	if (IS_ERR(priv->atr))
+		return PTR_ERR(priv->atr);
+
+	i2c_atr_set_driver_data(priv->atr, priv);
+
+	return i2c_atr_add_adapter(priv->atr, &desc);
+}
+
+static int max_ser_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
+{
+	return 0;
+}
+
+static void max_ser_i2c_mux_deinit(struct max_ser_priv *priv)
+{
+	i2c_mux_del_adapters(priv->mux);
+}
+
+static int max_ser_i2c_mux_init(struct max_ser_priv *priv)
+{
+	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
+				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
+				  max_ser_i2c_mux_select, NULL);
+	if (!priv->mux)
+		return -ENOMEM;
+
+	return i2c_mux_add_adapter(priv->mux, 0, 0);
+}
+
+static int max_ser_i2c_adapter_init(struct max_ser_priv *priv)
+{
+	if (device_get_named_child_node(priv->dev, "i2c-gate"))
+		return max_ser_i2c_mux_init(priv);
+	else
+		return max_ser_i2c_atr_init(priv);
+}
+
+static void max_ser_i2c_adapter_deinit(struct max_ser_priv *priv)
+{
+	if (device_get_named_child_node(priv->dev, "i2c-gate"))
+		max_ser_i2c_mux_deinit(priv);
+	else
+		max_ser_i2c_atr_deinit(priv);
+}
+
+static int max_ser_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *format)
+{
+	struct max_ser_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_ser *ser = priv->ser;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && ser->active)
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (max_ser_pad_is_source(ser, format->pad))
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int max_ser_log_status(struct v4l2_subdev *sd)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+	unsigned int i, j;
+	int ret;
+
+	v4l2_info(sd, "tunnel: %u\n", ser->tunnel);
+	if (ser->ops->log_status) {
+		ret = ser->ops->log_status(ser, sd->name);
+		if (ret)
+			return ret;
+	}
+	for (i = 0; i < ser->ops->num_i2c_xlates; i++)
+		v4l2_info(sd, "\ten: %u, src: 0x%02x dst: 0x%02x\n",
+			  ser->i2c_xlates[i].en, ser->i2c_xlates[i].src,
+			  ser->i2c_xlates[i].dst);
+	v4l2_info(sd, "\n");
+
+	for (i = 0; i < ser->ops->num_pipes; i++) {
+		struct max_ser_pipe *pipe = &ser->pipes[i];
+
+		v4l2_info(sd, "pipe: %u\n", pipe->index);
+		v4l2_info(sd, "\tenabled: %u\n", pipe->enabled);
+
+		if (!pipe->enabled) {
+			v4l2_info(sd, "\n");
+			continue;
+		}
+
+		v4l2_info(sd, "\tphy_id: %u\n", pipe->phy_id);
+		v4l2_info(sd, "\tstream_id: %u\n", pipe->stream_id);
+		v4l2_info(sd, "\tdts: %u\n", pipe->num_dts);
+		for (j = 0; j < pipe->num_dts; j++)
+			v4l2_info(sd, "\t\tdt: 0x%02x\n", pipe->dts[j]);
+		v4l2_info(sd, "\tvcs: 0x%08x\n", pipe->vcs);
+		v4l2_info(sd, "\tdbl8: %u\n", pipe->mode.dbl8);
+		v4l2_info(sd, "\tdbl10: %u\n", pipe->mode.dbl10);
+		v4l2_info(sd, "\tdbl12: %u\n", pipe->mode.dbl12);
+		v4l2_info(sd, "\tsoft_bpp: %u\n", pipe->mode.soft_bpp);
+		v4l2_info(sd, "\tbpp: %u\n", pipe->mode.bpp);
+		if (ser->ops->log_pipe_status) {
+			ret = ser->ops->log_pipe_status(ser, pipe, sd->name);
+			if (ret)
+				return ret;
+		}
+		v4l2_info(sd, "\n");
+	}
+
+	for (i = 0; i < ser->ops->num_phys; i++) {
+		struct max_ser_phy *phy = &ser->phys[i];
+
+		v4l2_info(sd, "phy: %u\n", phy->index);
+		v4l2_info(sd, "\tenabled: %u\n", phy->enabled);
+
+		if (!phy->enabled) {
+			v4l2_info(sd, "\n");
+			continue;
+		}
+
+		v4l2_info(sd, "\tactive: %u\n", phy->active);
+		v4l2_info(sd, "\tnum_data_lanes: %u\n", phy->mipi.num_data_lanes);
+		v4l2_info(sd, "\tclock_lane: %u\n", phy->mipi.clock_lane);
+		v4l2_info(sd, "\tnoncontinuous_clock: %u\n",
+			  !!(phy->mipi.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK));
+		if (ser->ops->log_phy_status) {
+			ret = ser->ops->log_phy_status(ser, phy, sd->name);
+			if (ret)
+				return ret;
+		}
+		v4l2_info(sd, "\n");
+	}
+
+	return 0;
+}
+
+static int max_ser_get_frame_desc_state(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_mbus_frame_desc *fd,
+					unsigned int pad)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	if (!max_ser_pad_is_source(ser, pad))
+		return -ENOENT;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		struct max_source *source;
+		struct max_ser_phy *phy;
+
+		if (pad != route->source_pad)
+			continue;
+
+		phy = max_ser_pad_to_phy(ser, route->sink_pad);
+		if (!phy) {
+			dev_err(priv->dev, "Failed to find link for pad %u\n",
+				route->sink_pad);
+			return -ENOENT;
+		}
+
+		source = max_ser_find_phy_source(priv, phy);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->sd)
+			continue;
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to find frame desc entry for stream %u:%u: %d\n",
+				route->sink_pad, route->sink_stream, ret);
+			return ret;
+		}
+
+		entry.stream = route->source_stream;
+
+		fd->entry[fd->num_entries++] = entry;
+	}
+
+	return 0;
+}
+
+static int max_ser_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
+
+	ret = max_ser_get_frame_desc_state(sd, state, fd, pad);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int max_ser_set_routing(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       enum v4l2_subdev_format_whence which,
+			       struct v4l2_subdev_krouting *routing)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ser->active)
+		return -EBUSY;
+
+	/*
+	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
+	 * frame desc is made dynamically allocated.
+	 */
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -E2BIG;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
+static int max_ser_get_vcs_dts(struct max_ser_priv *priv,
+			       const struct v4l2_subdev_krouting *routing,
+			       struct max_source *source,
+			       unsigned int *vcs,
+			       unsigned int *dts, unsigned int *num_dts,
+			       u32 sink_pad, u64 streams_mask)
+{
+	struct max_ser *ser = priv->ser;
+	struct v4l2_subdev_route *route;
+	unsigned int i;
+	int ret;
+
+	*vcs = 0;
+	*num_dts = 0;
+
+	if (ser->tunnel)
+		return 0;
+
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		unsigned int vc, dt;
+
+		if (sink_pad != route->sink_pad)
+			continue;
+
+		if (!(BIT_ULL(route->sink_stream) & streams_mask))
+			continue;
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to find frame desc entry for stream %u:%u: %d\n",
+				route->sink_pad, route->sink_stream, ret);
+			return ret;
+		}
+
+		vc = entry.bus.csi2.vc;
+		dt = entry.bus.csi2.dt;
+
+		if (vc >= MAX_SERDES_VC_ID_NUM)
+			return -E2BIG;
+
+		*vcs |= BIT(vc);
+
+		/* Skip already added DT. */
+		for (i = 0; i < *num_dts; i++)
+			if (dts[i] == dt)
+				break;
+
+		if (i < *num_dts)
+			continue;
+
+		dts[*num_dts] = dt;
+		(*num_dts)++;
+	}
+
+	/*
+	 * Hardware cannot distinguish between different pairs of VC and DT,
+	 * issue a warning.
+	 */
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		unsigned int vc, dt;
+
+		if (sink_pad != route->sink_pad)
+			continue;
+
+		/*
+		 * Skip enabled streams, we only want to check for leaks
+		 * among the disabled streams.
+		 */
+		if ((BIT_ULL(route->sink_stream) & streams_mask))
+			continue;
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to find frame desc entry for stream %u:%u: %d\n",
+				route->sink_pad, route->sink_stream, ret);
+			return ret;
+		}
+
+		vc = entry.bus.csi2.vc;
+		dt = entry.bus.csi2.dt;
+
+		if (vc >= MAX_SERDES_VC_ID_NUM)
+			return -E2BIG;
+
+		if (!(*vcs & BIT(vc)))
+			continue;
+
+		for (i = 0; i < *num_dts; i++)
+			if (dts[i] == dt)
+				break;
+
+		if (i == *num_dts)
+			continue;
+
+		dev_warn(priv->dev, "Leaked disabled stream %u:%u with VC: %u, DT: %u",
+			 route->source_pad, route->source_stream, vc, dt);
+	}
+
+	return 0;
+}
+
+static int max_ser_get_mode(struct max_ser_priv *priv,
+			    struct max_ser_pipe_mode *mode,
+			    const struct v4l2_subdev_krouting *routing, u32 pad)
+{
+	struct max_ser *ser = priv->ser;
+	unsigned int doubled_bpp;
+	unsigned int min_bpp;
+	unsigned int max_bpp;
+	u32 bpps;
+	int ret;
+
+	if (ser->tunnel)
+		return 0;
+
+	ret = max_get_bpps(priv->sources, 0, &bpps, routing, pad, ~0ULL);
+	if (ret)
+		return ret;
+
+	ret = max_process_bpps(priv->dev, bpps, priv->double_bpps, &doubled_bpp);
+	if (ret)
+		return ret;
+
+	if (doubled_bpp == 8)
+		mode->dbl8 = true;
+	else if (doubled_bpp == 10)
+		mode->dbl10 = true;
+	else if (doubled_bpp == 12)
+		mode->dbl12 = true;
+
+	if (doubled_bpp) {
+		bpps &= ~BIT(doubled_bpp);
+		bpps |= BIT(doubled_bpp * 2);
+	}
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (doubled_bpp)
+		mode->soft_bpp = min_bpp;
+
+	if (min_bpp != max_bpp)
+		mode->bpp = max_bpp;
+
+	return 0;
+}
+
+static int max_ser_update_pipe(struct max_ser_priv *priv,
+			       struct max_source *source,
+			       struct max_ser_pipe *pipe,
+			       const struct v4l2_subdev_krouting *routing,
+			       u32 pad, u64 streams_mask)
+{
+	struct max_ser *ser = priv->ser;
+	struct max_ser_pipe_mode mode = { 0 };
+	unsigned int num_dts;
+	unsigned int *dts;
+	unsigned int vcs;
+	int ret;
+
+	dts = devm_kcalloc(priv->dev, ser->ops->num_dts_per_pipe, sizeof(*dts),
+			   GFP_KERNEL);
+	if (!dts)
+		return -ENOMEM;
+
+	ret = max_ser_get_vcs_dts(priv, routing, source, &vcs, dts, &num_dts,
+				  pad, streams_mask);
+	if (ret)
+		goto err_free_dts;
+
+	ret = max_ser_get_mode(priv, &mode, routing, pad);
+	if (ret)
+		goto err_free_dts;
+
+	ret = ser->ops->set_pipe_vcs(ser, pipe, vcs);
+	if (ret)
+		goto err_free_dts;
+
+	ret = max_ser_set_pipe_mode(priv, pipe, &mode);
+	if (ret)
+		goto err_revert_vcs;
+
+	ret = max_ser_set_pipe_dts(priv, pipe, dts, num_dts);
+	if (ret)
+		goto err_revert_mode;
+
+	pipe->vcs = vcs;
+	pipe->mode = mode;
+
+	if (pipe->dts)
+		devm_kfree(priv->dev, pipe->dts);
+
+	pipe->dts = dts;
+	pipe->num_dts = num_dts;
+
+	return 0;
+
+err_revert_mode:
+	max_ser_set_pipe_mode(priv, pipe, &pipe->mode);
+
+err_revert_vcs:
+	ser->ops->set_pipe_vcs(ser, pipe, pipe->vcs);
+
+err_free_dts:
+	devm_kfree(priv->dev, dts);
+
+	return ret;
+}
+
+static int max_ser_update_phy(struct max_ser_priv *priv,
+			      const struct v4l2_subdev_krouting *routing,
+			      struct max_ser_phy *phy, u64 streams_mask)
+{
+	struct max_ser *ser = priv->ser;
+	u32 pad = max_ser_phy_to_pad(ser, phy);
+	bool enable_changed = !streams_mask != !priv->streams_masks[pad];
+	bool enable = !!streams_mask;
+	struct max_source *source;
+	struct max_ser_pipe *pipe;
+	int ret;
+
+	pipe = max_ser_find_phy_pipe(ser, phy);
+	if (!pipe)
+		return -ENOENT;
+
+	source = max_ser_find_phy_source(priv, phy);
+	if (!source)
+		return -ENOENT;
+
+	if (!source->sd)
+		return 0;
+
+	if (!enable && enable_changed) {
+		ret = max_ser_set_pipe_enable(ser, pipe, enable);
+		if (ret)
+			return -ENOENT;
+
+		ret = max_ser_phy_set_active(ser, phy, enable);
+		if (ret)
+			goto err_revert_pipe_disable;
+	}
+
+	ret = max_ser_update_pipe(priv, source, pipe, routing, pad, streams_mask);
+	if (ret)
+		goto err_revert_phy_disable;
+
+	if (enable && enable_changed) {
+		ret = max_ser_phy_set_active(ser, phy, enable);
+		if (ret)
+			goto err_revert_pipe_update;
+
+		ret = max_ser_set_pipe_enable(ser, pipe, enable);
+		if (ret)
+			goto err_revert_phy_enable;
+	}
+
+	return 0;
+
+err_revert_phy_enable:
+	if (enable && enable_changed)
+		max_ser_set_pipe_enable(ser, pipe, !enable);
+
+err_revert_pipe_update:
+	max_ser_update_pipe(priv, source, pipe, routing, pad, priv->streams_masks[pad]);
+
+err_revert_phy_disable:
+	if (!enable && enable_changed)
+		max_ser_phy_set_active(ser, phy, !enable);
+
+err_revert_pipe_disable:
+	if (!enable && enable_changed)
+		max_ser_set_pipe_enable(ser, pipe, !enable);
+
+	return ret;
+}
+
+static int max_ser_update_phys(struct max_ser_priv *priv,
+			       const struct v4l2_subdev_krouting *routing,
+			       u64 *streams_masks)
+{
+	struct max_ser *ser = priv->ser;
+	unsigned int failed_update_phy_id = ser->ops->num_phys;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ser->ops->num_phys; i++) {
+		struct max_ser_phy *phy = &ser->phys[i];
+		u32 sink_pad = max_ser_phy_to_pad(ser, phy);
+
+		ret = max_ser_update_phy(priv, routing, phy, streams_masks[sink_pad]);
+		if (ret) {
+			failed_update_phy_id = i;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = 0; i < failed_update_phy_id; i++) {
+		struct max_ser_phy *phy = &ser->phys[i];
+		u32 sink_pad = max_ser_phy_to_pad(ser, phy);
+
+		max_ser_update_phy(priv, routing, phy, priv->streams_masks[sink_pad]);
+	}
+
+	return ret;
+}
+
+static int max_ser_enable_disable_streams(struct max_ser_priv *priv,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 updated_streams_mask,
+					  bool enable)
+{
+	struct max_ser *ser = priv->ser;
+
+	return max_xlate_enable_disable_streams(priv->sources, 0, state,
+						pad, updated_streams_mask, 0,
+						ser->ops->num_phys, enable);
+}
+
+static int max_ser_update_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 updated_streams_mask, bool enable)
+{
+	struct max_ser_priv *priv = v4l2_get_subdevdata(sd);
+	struct max_ser *ser = priv->ser;
+	unsigned int num_pads = max_ser_num_pads(ser);
+	u64 *streams_masks;
+	int ret;
+
+	ret = max_get_streams_masks(priv->dev, state, pad, updated_streams_mask,
+				    num_pads, 0, ser->ops->num_phys,
+				    priv->streams_masks, &streams_masks, enable);
+	if (ret)
+		return ret;
+
+	if (!enable) {
+		ret = max_ser_enable_disable_streams(priv, state, pad,
+						     updated_streams_mask, enable);
+		if (ret)
+			goto err_free_streams_masks;
+	}
+
+	ret = max_ser_update_phys(priv, &state->routing, streams_masks);
+	if (ret)
+		goto err_revert_streams_disable;
+
+	if (enable) {
+		ret = max_ser_enable_disable_streams(priv, state, pad,
+						     updated_streams_mask, enable);
+		if (ret)
+			goto err_revert_phys_update;
+	}
+
+	devm_kfree(priv->dev, priv->streams_masks);
+	priv->streams_masks = streams_masks;
+	ser->active = !!streams_masks[pad];
+
+	return 0;
+
+err_revert_phys_update:
+	max_ser_update_phys(priv, &state->routing, priv->streams_masks);
+
+err_revert_streams_disable:
+	if (!enable)
+		max_ser_enable_disable_streams(priv, state, pad,
+					       updated_streams_mask, !enable);
+
+err_free_streams_masks:
+	devm_kfree(priv->dev, streams_masks);
+
+	return ret;
+}
+
+static int max_ser_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	return max_ser_update_streams(sd, state, pad, streams_mask, true);
+}
+
+static int max_ser_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	return max_ser_update_streams(sd, state, pad, streams_mask, false);
+}
+
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int max_ser_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+	unsigned int val;
+	int ret;
+
+	ret = ser->ops->reg_read(ser, reg->reg, &val);
+	if (ret)
+		return ret;
+
+	reg->val = val;
+	reg->size = 1;
+
+	return 0;
+}
+
+static int max_ser_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_register *reg)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+
+	return ser->ops->reg_write(ser, reg->reg, reg->val);
+}
+#endif
+
+static const struct v4l2_subdev_core_ops max_ser_core_ops = {
+	.log_status = max_ser_log_status,
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register = max_ser_g_register,
+	.s_register = max_ser_s_register,
+#endif
+};
+
+static const struct v4l2_subdev_pad_ops max_ser_pad_ops = {
+	.enable_streams = max_ser_enable_streams,
+	.disable_streams = max_ser_disable_streams,
+
+	.set_routing = max_ser_set_routing,
+	.get_frame_desc = max_ser_get_frame_desc,
+
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = max_ser_set_fmt,
+};
+
+static const struct v4l2_subdev_ops max_ser_subdev_ops = {
+	.core = &max_ser_core_ops,
+	.pad = &max_ser_pad_ops,
+};
+
+static const struct media_entity_operations max_ser_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int max_ser_init(struct max_ser_priv *priv)
+{
+	struct max_ser *ser = priv->ser;
+	unsigned int i;
+	int ret;
+
+	ret = ser->ops->init(ser);
+	if (ret)
+		return ret;
+
+	if (ser->ops->set_tunnel_enable) {
+		ret = ser->ops->set_tunnel_enable(ser, false);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < ser->ops->num_phys; i++) {
+		struct max_ser_phy *phy = &ser->phys[i];
+
+		if (phy->enabled) {
+			ret = ser->ops->init_phy(ser, phy);
+			if (ret)
+				return ret;
+		}
+
+		ret = ser->ops->set_phy_active(ser, phy, false);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < ser->ops->num_pipes; i++) {
+		struct max_ser_pipe *pipe = &ser->pipes[i];
+		struct max_ser_phy *phy = &ser->phys[pipe->phy_id];
+
+		ret = ser->ops->set_pipe_enable(ser, pipe, false);
+		if (ret)
+			return ret;
+
+		ret = ser->ops->set_pipe_stream_id(ser, pipe, pipe->stream_id);
+		if (ret)
+			return ret;
+
+		ret = ser->ops->set_pipe_phy(ser, pipe, phy);
+		if (ret)
+			return ret;
+
+		ret = ser->ops->set_pipe_vcs(ser, pipe, 0);
+		if (ret)
+			return ret;
+
+		ret = ser->ops->set_pipe_mode(ser, pipe, &pipe->mode);
+		if (ret)
+			return ret;
+
+		ret = max_ser_set_pipe_dts(priv, pipe, NULL, 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int max_ser_notify_bound(struct v4l2_async_notifier *nf,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_connection *base_asc)
+{
+	struct max_ser_priv *priv = nf_to_priv(nf);
+	struct max_asc *asc = asc_to_max(base_asc);
+	struct max_source *source = asc->source;
+	u32 pad = source->index;
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&subdev->entity,
+					  source->ep_fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
+		return ret;
+	}
+
+	source->sd = subdev;
+	source->pad = ret;
+
+	ret = media_create_pad_link(&source->sd->entity, source->pad,
+				    &priv->sd.entity, pad,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(priv->dev, "Unable to link %s:%u -> %s:%u\n",
+			source->sd->name, source->pad, priv->sd.name, pad);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max_ser_notify_unbind(struct v4l2_async_notifier *nf,
+				  struct v4l2_subdev *subdev,
+				  struct v4l2_async_connection *base_asc)
+{
+	struct max_asc *asc = asc_to_max(base_asc);
+	struct max_source *source = asc->source;
+
+	source->sd = NULL;
+}
+
+static const struct v4l2_async_notifier_operations max_ser_notify_ops = {
+	.bound = max_ser_notify_bound,
+	.unbind = max_ser_notify_unbind,
+};
+
+static int max_ser_v4l2_notifier_register(struct max_ser_priv *priv)
+{
+	struct max_ser *ser = priv->ser;
+	unsigned int i;
+	int ret;
+
+	v4l2_async_subdev_nf_init(&priv->nf, &priv->sd);
+
+	for (i = 0; i < ser->ops->num_phys; i++) {
+		struct max_ser_phy *phy = &ser->phys[i];
+		struct max_source *source;
+		struct max_asc *asc;
+
+		source = max_ser_find_phy_source(priv, phy);
+		if (!source)
+			return -ENOENT;
+
+		if (!source->ep_fwnode)
+			continue;
+
+		asc = v4l2_async_nf_add_fwnode(&priv->nf, source->ep_fwnode,
+					       struct max_asc);
+		if (IS_ERR(asc)) {
+			dev_err(priv->dev,
+				"Failed to add subdev for source %u: %pe", i,
+				asc);
+
+			v4l2_async_nf_cleanup(&priv->nf);
+
+			return PTR_ERR(asc);
+		}
+
+		asc->source = source;
+	}
+
+	priv->nf.ops = &max_ser_notify_ops;
+
+	ret = v4l2_async_nf_register(&priv->nf);
+	if (ret) {
+		dev_err(priv->dev, "Failed to register subdev notifier");
+		v4l2_async_nf_cleanup(&priv->nf);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max_ser_v4l2_notifier_unregister(struct max_ser_priv *priv)
+{
+	v4l2_async_nf_unregister(&priv->nf);
+	v4l2_async_nf_cleanup(&priv->nf);
+}
+
+static int max_ser_v4l2_register(struct max_ser_priv *priv)
+{
+	struct v4l2_subdev *sd = &priv->sd;
+	struct max_ser *ser = priv->ser;
+	void *data = i2c_get_clientdata(priv->client);
+	unsigned int num_pads = max_ser_num_pads(ser);
+	unsigned int i;
+	int ret;
+
+	v4l2_i2c_subdev_init(sd, priv->client, &max_ser_subdev_ops);
+	i2c_set_clientdata(priv->client, data);
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &max_ser_media_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+
+	priv->pads = devm_kcalloc(priv->dev, num_pads, sizeof(*priv->pads), GFP_KERNEL);
+	if (!priv->pads)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pads; i++) {
+		if (max_ser_pad_is_sink(ser, i))
+			priv->pads[i].flags = MEDIA_PAD_FL_SINK;
+		else
+			priv->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+	}
+
+	v4l2_set_subdevdata(sd, priv);
+
+	ret = media_entity_pads_init(&sd->entity, num_pads, priv->pads);
+	if (ret)
+		return ret;
+
+	ret = max_ser_v4l2_notifier_register(priv);
+	if (ret)
+		goto err_media_entity_cleanup;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_nf_cleanup;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret)
+		goto err_sd_cleanup;
+
+	return 0;
+
+err_sd_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_nf_cleanup:
+	max_ser_v4l2_notifier_unregister(priv);
+err_media_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static void max_ser_v4l2_unregister(struct max_ser_priv *priv)
+{
+	struct v4l2_subdev *sd = &priv->sd;
+
+	max_ser_v4l2_notifier_unregister(priv);
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+static int max_ser_parse_sink_dt_endpoint(struct max_ser_priv *priv,
+					  struct max_ser_phy *phy,
+					  struct max_source *source,
+					  struct fwnode_handle *fwnode)
+{
+	struct max_ser *ser = priv->ser;
+	u32 pad = max_ser_phy_to_pad(ser, phy);
+	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
+	struct v4l2_mbus_config_mipi_csi2 *mipi = &v4l2_ep.bus.mipi_csi2;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, pad, 0, 0);
+	if (!ep)
+		return 0;
+
+	source->ep_fwnode = fwnode_graph_get_remote_endpoint(ep);
+	if (!source->ep_fwnode) {
+		dev_err(priv->dev,
+			"Failed to get remote endpoint on port %u\n", pad);
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		dev_err(priv->dev, "Could not parse endpoint on port %u\n", pad);
+		return ret;
+	}
+
+	if (mipi->flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK &&
+	    !ser->ops->supports_noncontinuous_clock) {
+		dev_err(priv->dev,
+			"Clock non-continuous mode is not supported on port %u\n", pad);
+		return -EINVAL;
+	}
+
+	phy->mipi = v4l2_ep.bus.mipi_csi2;
+	phy->enabled = true;
+
+	return 0;
+}
+
+static int max_ser_find_phys_config(struct max_ser_priv *priv)
+{
+	struct max_ser *ser = priv->ser;
+	const struct max_phys_configs *configs = &ser->ops->phys_configs;
+	struct max_ser_phy *phy;
+	unsigned int i, j;
+
+	if (!configs->num_configs)
+		return 0;
+
+	for (i = 0; i < configs->num_configs; i++) {
+		const struct max_phys_config *config = &configs->configs[i];
+		bool matching = true;
+
+		for (j = 0; j < ser->ops->num_phys; j++) {
+			phy = &ser->phys[j];
+
+			if (!phy->enabled)
+				continue;
+
+			if (phy->mipi.num_data_lanes <= config->lanes[j])
+				continue;
+
+			matching = false;
+
+			break;
+		}
+
+		if (matching)
+			break;
+	}
+
+	if (i == configs->num_configs) {
+		dev_err(priv->dev, "Invalid lane configuration\n");
+		return -EINVAL;
+	}
+
+	ser->phys_config = i;
+
+	return 0;
+}
+
+static int max_ser_parse_dt(struct max_ser_priv *priv)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(priv->dev);
+	struct max_ser *ser = priv->ser;
+	struct max_ser_pipe *pipe;
+	struct max_ser_phy *phy;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ser->ops->num_phys; i++) {
+		phy = &ser->phys[i];
+		phy->index = i;
+	}
+
+	for (i = 0; i < ser->ops->num_pipes; i++) {
+		pipe = &ser->pipes[i];
+		pipe->index = i;
+		pipe->phy_id = i % ser->ops->num_phys;
+		pipe->stream_id = i % MAX_SERDES_STREAMS_NUM;
+	}
+
+	for (i = 0; i < ser->ops->num_phys; i++) {
+		struct max_ser_phy *phy = &ser->phys[i];
+		struct max_source *source;
+
+		source = max_ser_find_phy_source(priv, phy);
+		if (!source)
+			return -ENOENT;
+
+		source->index = i;
+
+		ret = max_ser_parse_sink_dt_endpoint(priv, phy, source, fwnode);
+		if (ret)
+			return ret;
+	}
+
+	return max_ser_find_phys_config(priv);
+}
+
+static int max_ser_allocate(struct max_ser_priv *priv)
+{
+	struct max_ser *ser = priv->ser;
+	unsigned int num_pads = max_ser_num_pads(ser);
+
+	ser->phys = devm_kcalloc(priv->dev, ser->ops->num_phys,
+				 sizeof(*ser->phys), GFP_KERNEL);
+	if (!ser->phys)
+		return -ENOMEM;
+
+	ser->pipes = devm_kcalloc(priv->dev, ser->ops->num_pipes,
+				  sizeof(*ser->pipes), GFP_KERNEL);
+	if (!ser->pipes)
+		return -ENOMEM;
+
+	ser->i2c_xlates = devm_kcalloc(priv->dev, ser->ops->num_i2c_xlates,
+				       sizeof(*ser->i2c_xlates), GFP_KERNEL);
+	if (!ser->i2c_xlates)
+		return -ENOMEM;
+
+	priv->sources = devm_kcalloc(priv->dev, ser->ops->num_phys,
+				     sizeof(*priv->sources), GFP_KERNEL);
+	if (!priv->sources)
+		return -ENOMEM;
+
+	priv->streams_masks = devm_kcalloc(priv->dev, num_pads,
+					   sizeof(*priv->streams_masks),
+					   GFP_KERNEL);
+	if (!priv->streams_masks)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int max_ser_probe(struct i2c_client *client, struct max_ser *ser)
+{
+	struct device *dev = &client->dev;
+	struct max_ser_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	priv->dev = dev;
+	priv->ser = ser;
+	ser->priv = priv;
+
+	ret = max_ser_allocate(priv);
+	if (ret)
+		return ret;
+
+	ret = max_ser_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	ret = max_ser_init(priv);
+	if (ret)
+		return ret;
+
+	ret = max_ser_i2c_adapter_init(priv);
+	if (ret)
+		return ret;
+
+	ret = max_ser_v4l2_register(priv);
+	if (ret)
+		goto err_i2c_adapter_deinit;
+
+	return 0;
+
+err_i2c_adapter_deinit:
+	max_ser_i2c_adapter_deinit(priv);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(max_ser_probe);
+
+int max_ser_remove(struct max_ser *ser)
+{
+	struct max_ser_priv *priv = ser->priv;
+
+	max_ser_v4l2_unregister(priv);
+
+	max_ser_i2c_adapter_deinit(priv);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max_ser_remove);
+
+int max_ser_set_double_bpps(struct v4l2_subdev *sd, u32 double_bpps)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+
+	priv->double_bpps = double_bpps;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max_ser_set_double_bpps);
+
+bool max_ser_supports_tunnel_mode(struct v4l2_subdev *sd)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+
+	if (!ser->ops->set_tunnel_enable)
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL(max_ser_supports_tunnel_mode);
+
+int max_ser_set_tunnel_enable(struct v4l2_subdev *sd, bool enable)
+{
+	struct max_ser_priv *priv = sd_to_priv(sd);
+	struct max_ser *ser = priv->ser;
+	int ret;
+
+	if (!ser->ops->set_tunnel_enable)
+		return 0;
+
+	if (ser->tunnel == enable)
+		return 0;
+
+	ret = ser->ops->set_tunnel_enable(ser, enable);
+	if (ret)
+		return ret;
+
+	ser->tunnel = enable;
+
+	return 0;
+}
+EXPORT_SYMBOL(max_ser_set_tunnel_enable);
+
+static int max_ser_read_reg(struct i2c_adapter *adapter, u8 addr,
+			    u16 reg, u8 *val)
+{
+	u8 buf[2] = { reg >> 8, reg & 0xff };
+	struct i2c_msg msg[2] = {
+		{
+			.addr = addr,
+			.flags = 0,
+			.buf = buf,
+			.len = sizeof(buf),
+		},
+		{
+			.addr = addr,
+			.flags = I2C_M_RD,
+			.buf = buf,
+			.len = 1,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
+	if (ret < 0)
+		return ret;
+
+	*val = buf[0];
+
+	return 0;
+}
+
+static int max_ser_write_reg(struct i2c_adapter *adapter, u8 addr,
+			     u16 reg, u8 val)
+{
+	u8 buf[3] = { reg >> 8, reg & 0xff, val };
+	struct i2c_msg msg[1] = {
+		{
+			.addr = addr,
+			.flags = 0,
+			.buf = buf,
+			.len = sizeof(buf),
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(adapter, msg, ARRAY_SIZE(msg));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int max_ser_reset(struct i2c_adapter *adapter, u8 addr)
+{
+	int ret;
+	u8 val;
+
+	ret = max_ser_read_reg(adapter, addr, MAX_SER_CTRL0, &val);
+	if (ret)
+		return ret;
+
+	val |= MAX_SER_CTRL0_RESET_ALL;
+
+	return max_ser_write_reg(adapter, addr, MAX_SER_CTRL0, val);
+}
+EXPORT_SYMBOL_GPL(max_ser_reset);
+
+int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
+			      unsigned int num_addrs, u8 *current_addr)
+{
+	unsigned int i, j;
+	int ret = 0;
+	u8 val;
+
+	for (i = 0; i < 10; i++) {
+		for (j = 0; j < num_addrs; j++) {
+			ret = max_ser_read_reg(adapter, addrs[j], MAX_SER_REG0, &val);
+			if (!ret && val) {
+				*current_addr = addrs[j];
+				return 0;
+			}
+
+			msleep(100);
+		}
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(max_ser_wait_for_multiple);
+
+int max_ser_wait(struct i2c_adapter *adapter, u8 addr)
+{
+	u8 current_addr;
+
+	return max_ser_wait_for_multiple(adapter, &addr, 1, &current_addr);
+}
+EXPORT_SYMBOL_GPL(max_ser_wait);
+
+static int max_ser_get_dev_id(struct i2c_adapter *adapter, u8 addr, u8 *dev_id)
+{
+	return max_ser_read_reg(adapter, addr, MAX_SER_REG13, dev_id);
+}
+
+int max_ser_fix_tx_ids(struct i2c_adapter *adapter, u8 addr)
+{
+	unsigned int addr_regs[] = {
+		MAX_SER_CFGI_INFOFR_TR3,
+		MAX_SER_CFGL_SPI_TR3,
+		MAX_SER_CFGC_CC_TR3,
+		MAX_SER_CFGC_GPIO_TR3,
+		MAX_SER_CFGL_IIC_X_TR3,
+		MAX_SER_CFGL_IIC_Y_TR3,
+	};
+	unsigned int i;
+	u8 dev_id;
+	int ret;
+
+	ret = max_ser_get_dev_id(adapter, addr, &dev_id);
+	if (ret)
+		return ret;
+
+	switch (dev_id) {
+	case MAX_SER_MAX9265A_DEV_ID:
+		for (i = 0; i < ARRAY_SIZE(addr_regs); i++) {
+			ret = max_ser_write_reg(adapter, addr, addr_regs[i], addr);
+			if (ret)
+				return ret;
+		}
+
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max_ser_fix_tx_ids);
+
+int max_ser_change_address(struct i2c_adapter *adapter, u8 addr, u8 new_addr)
+{
+	int ret;
+	u8 val;
+
+	ret = max_ser_read_reg(adapter, addr, MAX_SER_REG0, &val);
+	if (ret)
+		return ret;
+
+	val |= FIELD_PREP(MAX_SER_REG0_DEV_ADDR, new_addr);
+
+	return max_ser_write_reg(adapter, addr, MAX_SER_REG0, val);
+}
+EXPORT_SYMBOL_GPL(max_ser_change_address);
+
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("I2C_ATR");
diff --git a/drivers/media/i2c/maxim-serdes/max_ser.h b/drivers/media/i2c/maxim-serdes/max_ser.h
new file mode 100644
index 000000000000..c68ef90bab4a
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_ser.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#ifndef MAX_SER_H
+#define MAX_SER_H
+
+#include <linux/i2c.h>
+
+#include <media/v4l2-mediabus.h>
+
+#include "max_serdes.h"
+
+#define MAX_SER_REG0				0x0
+#define MAX_SER_REG0_DEV_ADDR			GENMASK(7, 1)
+
+#define MAX_SER_CTRL0				0x10
+#define MAX_SER_CTRL0_RESET_ALL			BIT(7)
+
+#define MAX_SER_REG13				0xd
+#define MAX_SER_MAX96717_DEV_ID			0xbf
+#define MAX_SER_MAX9265A_DEV_ID			0x91
+
+#define MAX_SER_CFGI_INFOFR_TR3			0x7b
+#define MAX_SER_CFGL_SPI_TR3			0x83
+#define MAX_SER_CFGC_CC_TR3			0x8b
+#define MAX_SER_CFGC_GPIO_TR3			0x93
+#define MAX_SER_CFGL_IIC_X_TR3			0xa3
+#define MAX_SER_CFGL_IIC_Y_TR3			0xab
+
+struct max_ser_phy {
+	unsigned int index;
+	struct v4l2_mbus_config_mipi_csi2 mipi;
+	bool enabled;
+	bool active;
+};
+
+struct max_ser_pipe_mode {
+	unsigned int soft_bpp;
+	unsigned int bpp;
+	bool dbl8;
+	bool dbl10;
+	bool dbl12;
+};
+
+struct max_ser_pipe {
+	unsigned int index;
+	unsigned int phy_id;
+	unsigned int stream_id;
+	unsigned int *dts;
+	unsigned int num_dts;
+	unsigned int vcs;
+	struct max_ser_pipe_mode mode;
+	bool enabled;
+};
+
+struct max_ser;
+
+struct max_ser_ops {
+	unsigned int num_pipes;
+	unsigned int num_dts_per_pipe;
+	unsigned int num_phys;
+	unsigned int num_i2c_xlates;
+	bool supports_noncontinuous_clock;
+
+	struct max_phys_configs phys_configs;
+
+	int (*reg_read)(struct max_ser *ser, unsigned int reg, unsigned int *val);
+	int (*reg_write)(struct max_ser *ser, unsigned int reg, unsigned int val);
+	int (*log_status)(struct max_ser *ser, const char *name);
+	int (*log_pipe_status)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			       const char *name);
+	int (*log_phy_status)(struct max_ser *ser, struct max_ser_phy *phy,
+			      const char *name);
+	int (*init)(struct max_ser *ser);
+	int (*set_i2c_xlate)(struct max_ser *ser, unsigned int i,
+			     struct max_i2c_xlate *i2c_xlate);
+	int (*set_tunnel_enable)(struct max_ser *ser, bool enable);
+	int (*init_phy)(struct max_ser *ser, struct max_ser_phy *phy);
+	int (*set_phy_active)(struct max_ser *ser, struct max_ser_phy *phy,
+			      bool enable);
+	int (*set_pipe_enable)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			       bool enable);
+	int (*set_pipe_dt)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			   unsigned int i, unsigned int dt);
+	int (*set_pipe_dt_en)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			      unsigned int i, bool enable);
+	int (*set_pipe_vcs)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			    unsigned int vcs);
+	int (*set_pipe_mode)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			     struct max_ser_pipe_mode *mode);
+	int (*set_pipe_stream_id)(struct max_ser *ser, struct max_ser_pipe *pipe,
+				  unsigned int stream_id);
+	int (*set_pipe_phy)(struct max_ser *ser, struct max_ser_pipe *pipe,
+			    struct max_ser_phy *phy);
+};
+
+struct max_ser_priv;
+
+struct max_ser {
+	struct max_ser_priv *priv;
+
+	const struct max_ser_ops *ops;
+
+	struct max_i2c_xlate *i2c_xlates;
+
+	struct max_ser_phy *phys;
+	struct max_ser_pipe *pipes;
+
+	unsigned int phys_config;
+	unsigned int active;
+	bool tunnel;
+};
+
+int max_ser_probe(struct i2c_client *client, struct max_ser *ser);
+
+int max_ser_remove(struct max_ser *ser);
+
+int max_ser_set_double_bpps(struct v4l2_subdev *sd, u32 double_bpps);
+bool max_ser_supports_tunnel_mode(struct v4l2_subdev *sd);
+int max_ser_set_tunnel_enable(struct v4l2_subdev *sd, bool enable);
+
+int max_ser_reset(struct i2c_adapter *adapter, u8 addr);
+int max_ser_wait(struct i2c_adapter *adapter, u8 addr);
+int max_ser_wait_for_multiple(struct i2c_adapter *adapter, u8 *addrs,
+			      unsigned int num_addrs, u8 *current_addr);
+
+int max_ser_change_address(struct i2c_adapter *adapter, u8 addr, u8 new_addr);
+int max_ser_fix_tx_ids(struct i2c_adapter *adapter, u8 addr);
+
+#endif // MAX_SER_H
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/i2c/maxim-serdes/max_serdes.c
new file mode 100644
index 000000000000..e2863109a57b
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/stringify.h>
+
+#include <media/mipi-csi2.h>
+
+#include <uapi/linux/media-bus-format.h>
+
+#include "max_serdes.h"
+
+#define MAX_MIPI_FMT(_dt, _bpp)	\
+{				\
+	.dt = (_dt),		\
+	.bpp = (_bpp),		\
+}
+
+static const struct max_mipi_format max_mipi_formats[] = {
+	MAX_MIPI_FMT(MIPI_CSI2_DT_EMBEDDED_8B, 8),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_YUV422_8B, 16),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_YUV422_10B, 20),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RGB565, 16),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RGB666, 18),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RGB888, 24),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RAW8, 8),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RAW10, 10),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RAW12, 12),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RAW14, 14),
+	MAX_MIPI_FMT(MIPI_CSI2_DT_RAW16, 16),
+};
+
+const struct max_mipi_format *max_mipi_format_by_dt(u8 dt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(max_mipi_formats); i++)
+		if (max_mipi_formats[i].dt == dt)
+			return &max_mipi_formats[i];
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(max_mipi_format_by_dt);
+
+int max_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
+			    struct v4l2_mbus_frame_desc_entry *entry)
+{
+	struct v4l2_mbus_frame_desc fd;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (fd.entry[i].stream == stream) {
+			*entry = fd.entry[i];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL(max_get_fd_stream_entry);
+
+int max_get_bpps(struct max_source *sources, u32 source_sink_pad_offset,
+		 u32 *bpps, const struct v4l2_subdev_krouting *routing,
+		 u32 pad, u64 streams_mask)
+{
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	*bpps = 0;
+
+	for_each_active_route(routing, route) {
+		struct v4l2_mbus_frame_desc_entry entry;
+		const struct max_mipi_format *format;
+		struct max_source *source;
+
+		if (route->sink_pad == pad) {
+			if (!(BIT_ULL(route->sink_stream) & streams_mask))
+				continue;
+		} else if (route->source_pad == pad) {
+			if (!(BIT_ULL(route->source_stream) & streams_mask))
+				continue;
+		} else {
+			continue;
+		}
+
+		source = &sources[route->sink_pad + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		ret = max_get_fd_stream_entry(source->sd, source->pad,
+					      route->sink_stream, &entry);
+		if (ret)
+			return ret;
+
+		format = max_mipi_format_by_dt(entry.bus.csi2.dt);
+		if (!format)
+			continue;
+
+		*bpps |= BIT(format->bpp);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(max_get_bpps);
+
+int max_process_bpps(struct device *dev, u32 bpps, u32 allowed_double_bpps,
+		     unsigned int *doubled_bpp)
+{
+	unsigned int min_bpp;
+	unsigned int max_bpp;
+	bool doubled = false;
+
+	if (!bpps)
+		return 0;
+
+	*doubled_bpp = 0;
+
+	/*
+	 * Hardware can double bpps 8, 10, 12, and it can pad bpps < 16
+	 * to another bpp <= 16:
+	 * Hardware can only stream a single constant bpp up to 24.
+	 *
+	 * From these features and limitations, the following rules
+	 * can be deduced:
+	 *
+	 * A bpp of 8 can always be doubled if present.
+	 * A bpp of 10 can be doubled only if there are no other bpps or the
+	 * only other bpp is 20.
+	 * A bpp of 12 can be doubled only if there are no other bpps or the
+	 * only other bpp is 24.
+	 * Bpps <= 16 cannot coexist with bpps > 16.
+	 * Bpps <= 16 need to be padded to the biggest bpp.
+	 */
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (min_bpp == 8) {
+		doubled = true;
+	} else if (min_bpp == 10 || min_bpp == 12) {
+		u32 bpp_or_double = BIT(min_bpp) | BIT(min_bpp * 2);
+		u32 other_bpps = bpps & ~bpp_or_double;
+
+		if (!other_bpps)
+			doubled = true;
+	}
+
+	if (doubled && (allowed_double_bpps & BIT(min_bpp))) {
+		*doubled_bpp = min_bpp;
+		bpps &= ~BIT(min_bpp);
+		bpps |= BIT(min_bpp * 2);
+	}
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (max_bpp > 24) {
+		dev_err(dev, "Cannot stream bpps > 24\n");
+		return -EINVAL;
+	}
+
+	if (min_bpp <= 16 && max_bpp > 16) {
+		dev_err(dev, "Cannot stream bpps <= 16 with bpps > 16\n");
+		return -EINVAL;
+	}
+
+	if (max_bpp > 16 && min_bpp != max_bpp) {
+		dev_err(dev, "Cannot stream multiple bpps when one is > 16\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(max_process_bpps);
+
+int max_xlate_enable_disable_streams(struct max_source *sources,
+				     u32 source_sink_pad_offset,
+				     const struct v4l2_subdev_state *state,
+				     u32 pad, u64 updated_streams_mask,
+				     u32 sink_pad_start, u32 num_sink_pads,
+				     bool enable)
+{
+	u32 failed_sink_pad;
+	int ret;
+	u32 i;
+
+	for (i = sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+		struct max_source *source;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		source = &sources[i + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		if (enable)
+			ret = v4l2_subdev_enable_streams(source->sd, source->pad,
+							 updated_sink_streams_mask);
+		else
+			ret = v4l2_subdev_disable_streams(source->sd, source->pad,
+							  updated_sink_streams_mask);
+		if (ret) {
+			failed_sink_pad = i;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = sink_pad_start; i < failed_sink_pad; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+		struct max_source *source;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		source = &sources[i + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		if (!enable)
+			v4l2_subdev_enable_streams(source->sd, source->pad,
+						   updated_sink_streams_mask);
+		else
+			v4l2_subdev_disable_streams(source->sd, source->pad,
+						    updated_sink_streams_mask);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(max_xlate_enable_disable_streams);
+
+int max_get_streams_masks(struct device *dev,
+			  const struct v4l2_subdev_state *state,
+			  u32 pad, u64 updated_streams_mask,
+			  u32 num_pads, u32 sink_pad_start,
+			  u32 num_sink_pads, u64 *old_streams_masks,
+			  u64 **new_streams_masks, bool enable)
+{
+	u64 *streams_masks;
+	unsigned int i;
+
+	streams_masks = devm_kcalloc(dev, num_pads, sizeof(*streams_masks), GFP_KERNEL);
+	if (!streams_masks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pads; i++)
+		streams_masks[i] = old_streams_masks[i];
+
+	for (i = sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		if (enable)
+			streams_masks[i] |= updated_sink_streams_mask;
+		else
+			streams_masks[i] &= ~updated_sink_streams_mask;
+	}
+
+	if (enable)
+		streams_masks[pad] |= updated_streams_mask;
+	else
+		streams_masks[pad] &= ~updated_streams_mask;
+
+	*new_streams_masks = streams_masks;
+
+	return 0;
+}
+EXPORT_SYMBOL(max_get_streams_masks);
+
+MODULE_DESCRIPTION("Maxim GMSL2 Serializer/Deserializer Driver");
+MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.h b/drivers/media/i2c/maxim-serdes/max_serdes.h
new file mode 100644
index 000000000000..f71fe824f152
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#ifndef MAX_SERDES_H
+#define MAX_SERDES_H
+
+#include <linux/types.h>
+
+#include <media/v4l2-subdev.h>
+
+#define MAX_SERDES_PHYS_MAX		4
+#define MAX_SERDES_STREAMS_NUM		4
+#define MAX_SERDES_VC_ID_NUM		4
+
+enum max_gmsl_version {
+	MAX_GMSL_2 = 2,
+	MAX_GMSL_MIN = MAX_GMSL_2,
+	MAX_GMSL_3 = 3,
+	MAX_GMSL_MAX = MAX_GMSL_3,
+};
+
+struct max_phys_config {
+	unsigned int lanes[MAX_SERDES_PHYS_MAX];
+	unsigned int clock_lane[MAX_SERDES_PHYS_MAX];
+};
+
+struct max_phys_configs {
+	const struct max_phys_config *configs;
+	unsigned int num_configs;
+};
+
+struct max_i2c_xlate {
+	u8 src;
+	u8 dst;
+	bool en;
+};
+
+struct max_mipi_format {
+	u8 dt;
+	u8 bpp;
+};
+
+struct max_source {
+	struct v4l2_subdev *sd;
+	u16 pad;
+	struct fwnode_handle *ep_fwnode;
+
+	unsigned int index;
+};
+
+struct max_asc {
+	struct v4l2_async_connection base;
+	struct max_source *source;
+};
+
+static inline struct max_asc *asc_to_max(struct v4l2_async_connection *asc)
+{
+	return container_of(asc, struct max_asc, base);
+}
+
+const struct max_mipi_format *max_mipi_format_by_dt(u8 dt);
+
+int max_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
+			    struct v4l2_mbus_frame_desc_entry *entry);
+
+int max_get_bpps(struct max_source *sources, u32 source_sink_pad_offset,
+		 u32 *bpps, const struct v4l2_subdev_krouting *routing,
+		 u32 pad, u64 streams_mask);
+int max_process_bpps(struct device *dev, u32 bpps, u32 allowed_double_bpps,
+		     unsigned int *doubled_bpp);
+
+int max_xlate_enable_disable_streams(struct max_source *sources,
+				     u32 source_sink_pad_offset,
+				     const struct v4l2_subdev_state *state,
+				     u32 pad, u64 updated_streams_mask,
+				     u32 sink_pad_start, u32 num_sink_pads,
+				     bool enable);
+
+int max_get_streams_masks(struct device *dev,
+			  const struct v4l2_subdev_state *state,
+			  u32 pad, u64 updated_streams_mask,
+			  u32 num_pads, u32 sink_pad_start,
+			  u32 num_sink_pads, u64 *old_streams_masks,
+			  u64 **new_streams_masks, bool enable);
+
+#endif // MAX_SERDES_H
-- 
2.48.1


