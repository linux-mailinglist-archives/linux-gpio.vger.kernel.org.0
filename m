Return-Path: <linux-gpio+bounces-16483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6CFA41B14
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D9E9175753
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A0D255E29;
	Mon, 24 Feb 2025 10:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIyHEvXk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DDA2505C9
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392941; cv=none; b=WQfmfZYvPtyjmMLTGgxQFwSEw4ep6T27hcEBCLiv06nLZwSongFbgRMy+NwbCW6USswvsd91txuCW4A0Y6gOQLVYgZ10CnFsegTtJMLH4NR6MXSrVoabJHTm5nJQAF6EB5amY5SKwPM7KeRCQL6AskF5qZtVH0PrDQRd3ousR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392941; c=relaxed/simple;
	bh=Y4wD8NaJ45fHHIFtdN0sYlkypO0HBjUk/ga0OkxNdQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZ5rX1mhj5ZZPNcIYGTlE+4EchHnrB3sDZbVUiF/7CFJusHgNoPV8QsU97VFpyQr5LR9g5bA3VniFwQRKvcekpVI1YaGP75/x9LUhdZ+XPA8V3V8Juz7CMBbeNx15ULeh9JmscKeMsQV1y2x7VCjczZcj595E0gWHVZMTybaBj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIyHEvXk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb86beea8cso758005266b.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740392934; x=1740997734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM1R4UQWbXYe5ZX8IWSfG5/MdMAGW8GaixItrs+PVG0=;
        b=aIyHEvXkJajZvSOs82nXFs2+KGIyeF+AE5ae3Sz76r6hH9jZN10RO7KrP3DHFvViK2
         AQX4CRgOOgpfn9rTKYjV+2j/zbNoCQ+/HNa0B4VIYNGocJwNCsvXaFhoVeTV/YBgDBIO
         O9QPB8x0yibArNtAkIvp8+6rTIUV7vkTVrZQb5ZmjeHaf1mjw+F8+uvPpvQMACKKrhPs
         YkP7fbvKuLVPNJRCE4piRfjNMsG+rEFZ8gMjlv3n5EB070S6SRLneEMs6efxkbVIm8CS
         lUyQj291W3OBLIHOwO4i/xBexsays/6gio3FssYHIWq3c10lVt6sQU4tqNeP+mPbwlP6
         wrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740392934; x=1740997734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM1R4UQWbXYe5ZX8IWSfG5/MdMAGW8GaixItrs+PVG0=;
        b=iwsbZvZQQzYLS2LHx1m4u0P8iDvvGSrdIBgrXlzp9SQiu/4G/i4Ggk/UDXt0gC0jrm
         fXnVnAE41lMF9YYqDGGZ+54yhsU2O2MScXv1JX4LZzDlOUTJv/7+/wCuIjV1bziWBFDz
         tRxfsRWsoG3N3yShwBv5kFV7Naj5fVFq6ukA9y1ARf4uFTfB2MF86o1ZcB6DpktYzm3j
         rVEb8gOUll71KAUNR98+XQjqU9O2hzHsCxvQEx7zI5K7jwLc9x2zv1PvrNikTj/ZTKj9
         yvYkXDxt/uHaNMd3wwEIpjBOC8hKV0pU4uvOcpPPKVBhdOYczKPVkylNy6QYslNto4y2
         dWNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH+6hdyaKbvF6/e5o89Jeu8lSjQnuIo087RnkF7QpwXoeEFMzDXMhC1oGI29o1GrXQn/Wo0dFGTMFs@vger.kernel.org
X-Gm-Message-State: AOJu0YzyoXKTF486XYOodUQe6XrS6wlC7pvee2KAF7rXI4Of6HtdKfRu
	U01EKW0feBmTLjNZBtaI4cRqokoHP8YsLX5ArV0lQXfsVbm3M3VjVigYxCFCB0A=
X-Gm-Gg: ASbGncvu332ouG260YUrDtrhSyjQ3y0lTt2ny2dqqk88ltwIp5hz10Tg6Ig8yz9+Mvq
	FPP+799Zyvb4DrLqA/lJG8rPFOBysx+J59Sd2xUKkx8N7qQkc5LizLyjfVeM7mJlU459dywUJ4v
	hCsWuZd5ECTosf0e99Lti1t9V1liKhIXyXZaAapz4fwySmvBu8qqsB3hfzDZwW9A6CJPDvH+YTi
	kBuPozNXr9XxxvH51YYsLec4B6359ZW6GDiCzQAV+Pt1QlEWDokuK1dNhuLgnVYao2zQ970MWbb
	HFSjRqhSXoZZ5p/elFeTns1Ekh4wyH3qk01zV+GveznGyYXAvmpzAyEYsqTqS5Vrw4dcksfV//b
	lXv9GDZ6NVQ==
X-Google-Smtp-Source: AGHT+IGZAW/uaSo2Yy/gS+oiwVAxhasx1vdxEt7Ls8MjGqOJ5S2zsgNGMXNXKySLW82A7bSN/0DLng==
X-Received: by 2002:a17:906:314f:b0:ab7:8079:78ae with SMTP id a640c23a62f3a-abc09d33b16mr1120826166b.44.1740392933966;
        Mon, 24 Feb 2025 02:28:53 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb186c5d5sm1349206666b.51.2025.02.24.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:28:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 24 Feb 2025 10:28:52 +0000
Subject: [PATCH 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-max77759-mfd-v1-4-2bff36f9d055@linaro.org>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.1

The Maxim MAX77759 is a companion Power Management IC for USB Type-C
applications with Battery Charger, Fuel Gauge, temperature sensors, USB
Type-C Port Controller (TCPC), NVMEM, and additional GPIO interfaces.

Fuel Gauge and TCPC have separate and independent I2C addresses,
register maps, and interrupt lines and are therefore excluded from the
MFD core device driver here.

The GPIO and NVMEM interfaces are accessed via specific commands to the
built-in microprocessor. This driver implements an API that client
drivers can use for accessing those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                  |   2 +
 drivers/mfd/Kconfig          |  20 ++
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/max77759.c       | 739 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77759.h |  74 +++++
 5 files changed, 836 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2c19a1b4c05..b1bbe7165e0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14327,6 +14327,8 @@ M:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
+F:	drivers/mfd/max77759.c
+F:	include/linux/mfd/max77759.h
 
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d44c69bb3dfd..1d72bf086401 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -930,6 +930,26 @@ config MFD_MAX77714
 	  drivers must be enabled in order to use each functionality of the
 	  device.
 
+config MFD_MAX77759
+	tristate "Maxim Integrated MAX77759 PMIC"
+	depends on I2C
+	depends on OF
+	select IRQ_DOMAIN
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	help
+	  Say yes here to add support for Maxim Integrated MAX77759.
+	  This is a companion Power Management IC for USB Type-C applications
+	  with Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
+	  Port Controller (TCPC), NVMEM, and additional GPIO interfaces.
+	  This driver provides common support for accessing the device;
+	  additional drivers must be enabled in order to use the functionality
+	  of the device.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called max77759.
+
 config MFD_MAX77843
 	bool "Maxim Semiconductor MAX77843 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..cc9362afd8f0 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
 obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
 obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
 obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
+obj-$(CONFIG_MFD_MAX77759)	+= max77759.o
 obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
 obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
 max8925-objs			:= max8925-core.o max8925-i2c.o
diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
new file mode 100644
index 000000000000..57e9a1e95df5
--- /dev/null
+++ b/drivers/mfd/max77759.c
@@ -0,0 +1,739 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright 2020 Google Inc
+// Copyright 2025 Linaro Ltd.
+//
+// Core MFD driver for Maxim MAX77759 companion PMIC for USB Type-C
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/max77759.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/overflow.h>
+#include <linux/regmap.h>
+
+/* registers - registers useful to drivers are declared in the public header */
+/* PMIC / TOP */
+#define MAX77759_PMIC_REG_PMIC_ID             0x00
+#define MAX77759_PMIC_REG_PMIC_ID_MAX77759    59
+
+#define MAX77759_PMIC_REG_PMIC_REVISION       0x01
+#define MAX77759_PMIC_REG_OTP_REVISION        0x02
+
+#define MAX77759_PMIC_REG_INTSRC	      0x22
+#define MAX77759_PMIC_REG_INTSRCMASK          0x23
+#define MAX77759_PMIC_REG_INTSRC_MAXQ         BIT(3)
+#define MAX77759_PMIC_REG_INTSRC_TOPSYS       BIT(1)
+#define MAX77759_PMIC_REG_INTSRC_CHGR         BIT(0)
+
+#define MAX77759_PMIC_REG_TOPSYS_INT          0x24
+#define MAX77759_PMIC_REG_TOPSYS_INT_MASK     0x26
+#define MAX77759_PMIC_REG_TOPSYS_INT_TSHDN    BIT(6)
+#define MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO  BIT(5)
+#define MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO  BIT(4)
+#define MAX77759_PMIC_REG_TOPSYS_INT_FSHIP    BIT(0)
+
+#define MAX77759_PMIC_REG_I2C_CNFG            0x40
+#define MAX77759_PMIC_REG_SWRESET             0x50
+#define MAX77759_PMIC_REG_CONTROL_FG          0x51
+#define MAX77759_PMIC_REG_LAST_REGISTER       MAX77759_PMIC_REG_CONTROL_FG
+
+/* MaxQ */
+#define MAX77759_MAXQ_REG_AP_DATAOUT0       0x81
+#define MAX77759_MAXQ_REG_AP_DATAOUT32      0xa1
+#define MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX  (MAX77759_MAXQ_REG_AP_DATAOUT32 \
+					     - MAX77759_MAXQ_REG_AP_DATAOUT0 \
+					     + 1)
+#define MAX77759_MAXQ_REG_AP_DATAIN0        0xb1
+#define MAX77759_MAXQ_REG_LAST_REGISTER     0xe0
+
+/* charger */
+#define MAX77759_CHGR_REG_LAST_REGISTER  0xcc
+
+enum max77759_i2c_subdev_id {
+	MAX77759_I2C_SUBDEV_ID_MAXQ,
+	MAX77759_I2C_SUBDEV_ID_CHARGER,
+};
+
+struct max77759_mfd {
+	/* protecting MaxQ commands - only one can be active */
+	struct mutex maxq_lock;
+	struct regmap *regmap_maxq;
+	struct completion cmd_done;
+
+	struct regmap *regmap_top;
+	struct regmap *regmap_charger;
+};
+
+struct max77759_i2c_subdev {
+	enum max77759_i2c_subdev_id id;
+	const struct regmap_config *cfg;
+	u16 i2c_address;
+};
+
+/* TOP registers */
+static const struct regmap_range max77759_top_registers[] = {
+	regmap_reg_range(0x00, 0x02),
+	regmap_reg_range(0x22, 0x24),
+	regmap_reg_range(0x26, 0x26),
+	regmap_reg_range(0x40, 0x40),
+	regmap_reg_range(0x50, 0x51),
+};
+
+static const struct regmap_range max77759_top_ro_registers[] = {
+	regmap_reg_range(0x00, 0x02),
+	regmap_reg_range(0x22, 0x22),
+};
+
+static const struct regmap_range max77759_top_volatile_registers[] = {
+	regmap_reg_range(0x22, 0x22),
+	regmap_reg_range(0x24, 0x24),
+};
+
+static const struct regmap_access_table max77759_top_wr_table = {
+	.yes_ranges = max77759_top_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_top_registers),
+	.no_ranges = max77759_top_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(max77759_top_ro_registers),
+};
+
+static const struct regmap_access_table max77759_top_rd_table = {
+	.yes_ranges = max77759_top_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_top_registers),
+};
+
+static const struct regmap_access_table max77759_top_volatile_table = {
+	.yes_ranges = max77759_top_volatile_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_top_volatile_registers),
+};
+
+static const struct regmap_config max77759_regmap_config_top = {
+	.name = "top",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77759_PMIC_REG_LAST_REGISTER,
+	.wr_table = &max77759_top_wr_table,
+	.rd_table = &max77759_top_rd_table,
+	.volatile_table = &max77759_top_volatile_table,
+	.num_reg_defaults_raw = MAX77759_PMIC_REG_LAST_REGISTER + 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+/* MaxQ registers */
+static const struct regmap_range max77759_maxq_registers[] = {
+	regmap_reg_range(0x60, 0x73),
+	regmap_reg_range(0x81, 0xa1),
+	regmap_reg_range(0xb1, 0xd1),
+	regmap_reg_range(0xe0, 0xe0),
+};
+
+static const struct regmap_range max77759_maxq_ro_registers[] = {
+	regmap_reg_range(0x60, 0x63),
+	regmap_reg_range(0x68, 0x6f),
+	regmap_reg_range(0xb1, 0xd1),
+};
+
+static const struct regmap_range max77759_maxq_volatile_registers[] = {
+	regmap_reg_range(0x64, 0x6f),
+	regmap_reg_range(0xb1, 0xd1),
+	regmap_reg_range(0xe0, 0xe0),
+};
+
+static const struct regmap_access_table max77759_maxq_wr_table = {
+	.yes_ranges = max77759_maxq_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_maxq_registers),
+	.no_ranges = max77759_maxq_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(max77759_maxq_ro_registers),
+};
+
+static const struct regmap_access_table max77759_maxq_rd_table = {
+	.yes_ranges = max77759_maxq_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_maxq_registers),
+};
+
+static const struct regmap_access_table max77759_maxq_volatile_table = {
+	.yes_ranges = max77759_maxq_volatile_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_maxq_volatile_registers),
+};
+
+static const struct regmap_config max77759_regmap_config_maxq = {
+	.name = "maxq",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77759_MAXQ_REG_LAST_REGISTER,
+	.wr_table = &max77759_maxq_wr_table,
+	.rd_table = &max77759_maxq_rd_table,
+	.volatile_table = &max77759_maxq_volatile_table,
+	.num_reg_defaults_raw = MAX77759_MAXQ_REG_LAST_REGISTER + 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+/* charger registers */
+static const struct regmap_range max77759_charger_registers[] = {
+	regmap_reg_range(0xb0, 0xcc),
+};
+
+static const struct regmap_range max77759_charger_ro_registers[] = {
+	regmap_reg_range(0xb4, 0xb8),
+};
+
+static const struct regmap_range max77759_charger_volatile_registers[] = {
+	regmap_reg_range(0xb0, 0xb1),
+	regmap_reg_range(0xb4, 0xb8),
+};
+
+static const struct regmap_access_table max77759_charger_wr_table = {
+	.yes_ranges = max77759_charger_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_charger_registers),
+	.no_ranges = max77759_charger_ro_registers,
+	.n_no_ranges = ARRAY_SIZE(max77759_charger_ro_registers),
+};
+
+static const struct regmap_access_table max77759_charger_rd_table = {
+	.yes_ranges = max77759_charger_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_charger_registers),
+};
+
+static const struct regmap_access_table max77759_charger_volatile_table = {
+	.yes_ranges = max77759_charger_volatile_registers,
+	.n_yes_ranges = ARRAY_SIZE(max77759_charger_volatile_registers),
+};
+
+static const struct regmap_config max77759_regmap_config_charger = {
+	.name = "charger",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77759_CHGR_REG_LAST_REGISTER,
+	.wr_table = &max77759_charger_wr_table,
+	.rd_table = &max77759_charger_rd_table,
+	.volatile_table = &max77759_charger_volatile_table,
+	.num_reg_defaults_raw = MAX77759_CHGR_REG_LAST_REGISTER + 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+/*
+ * Interrupts - with the following interrupt hierarchy:
+ *   pmic IRQs (INTSRC)
+ *     - MAXQ_INT: MaxQ IRQs
+ *       - UIC_INT1
+ *         - APCmdResI
+ *         - SysMsgI
+ *         - GPIOxI
+ *     - TOPSYS_INT: topsys
+ *       - TOPSYS_INT
+ *         - TSHDN_INT
+ *         - SYSOVLO_INT
+ *         - SYSUVLO_INT
+ *         - FSHIP_NOT_RD
+ *     - CHGR_INT: charger
+ *       - CHG_INT
+ *       - CHG_INT2
+ */
+enum {
+	MAX77759_INT_MAXQ,
+	MAX77759_INT_TOPSYS,
+	MAX77759_INT_CHGR,
+};
+
+enum {
+	MAX77759_TOPSYS_INT_TSHDN,
+	MAX77759_TOPSYS_INT_SYSOVLO,
+	MAX77759_TOPSYS_INT_SYSUVLO,
+	MAX77759_TOPSYS_INT_FSHIP_NOT_RD,
+};
+
+enum {
+	MAX77759_MAXQ_INT_APCMDRESI,
+	MAX77759_MAXQ_INT_SYSMSGI,
+	MAX77759_MAXQ_INT_GPIO,
+	MAX77759_MAXQ_INT_UIC1,
+	MAX77759_MAXQ_INT_UIC2,
+	MAX77759_MAXQ_INT_UIC3,
+	MAX77759_MAXQ_INT_UIC4,
+};
+
+enum {
+	MAX77759_CHARGER_INT_1,
+	MAX77759_CHARGER_INT_2,
+};
+
+static const struct regmap_irq max77759_pmic_irqs[] = {
+	REGMAP_IRQ_REG(MAX77759_INT_MAXQ, 0, MAX77759_PMIC_REG_INTSRC_MAXQ),
+	REGMAP_IRQ_REG(MAX77759_INT_TOPSYS, 0, MAX77759_PMIC_REG_INTSRC_TOPSYS),
+	REGMAP_IRQ_REG(MAX77759_INT_CHGR, 0, MAX77759_PMIC_REG_INTSRC_CHGR),
+};
+
+static const struct regmap_irq max77759_maxq_irqs[] = {
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_APCMDRESI,
+		       0, MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_SYSMSGI,
+		       0, MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_GPIO, 0, GENMASK(1, 0)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC1, 0, GENMASK(5, 2)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC2, 1, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC3, 2, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC4, 3, GENMASK(7, 0)),
+};
+
+static const struct regmap_irq max77759_topsys_irqs[] = {
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_TSHDN,
+		       0, MAX77759_PMIC_REG_TOPSYS_INT_TSHDN),
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_SYSOVLO,
+		       0, MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO),
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_SYSUVLO,
+		       0, MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO),
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_FSHIP_NOT_RD,
+		       0, MAX77759_PMIC_REG_TOPSYS_INT_FSHIP),
+};
+
+static const struct regmap_irq max77759_chgr_irqs[] = {
+	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
+};
+
+static const struct regmap_irq_chip max77759_pmic_irq_chip = {
+	.name = "max77759-pmic",
+	.status_base = MAX77759_PMIC_REG_INTSRC,
+	.mask_base = MAX77759_PMIC_REG_INTSRCMASK,
+	.num_regs = 1,
+	.irqs = max77759_pmic_irqs,
+	.num_irqs = ARRAY_SIZE(max77759_pmic_irqs),
+};
+
+/*
+ * We can let regmap-irq auto-ack the topsys interrupt bits as required, but
+ * for all others the individual drivers need to know which interrupt bit
+ * exactly is set inside their interrupt handlers, and therefore we can not set
+ * .ack_base for those.
+ * MAX77759_MAXQ_REG_UIC_INT1 is read-only and doesn't require clearing.
+ */
+static const struct regmap_irq_chip max77759_maxq_irq_chip = {
+	.name = "max77759-maxq",
+	.domain_suffix = "MAXQ",
+	.status_base = MAX77759_MAXQ_REG_UIC_INT1,
+	.mask_base = MAX77759_MAXQ_REG_UIC_INT1_M,
+	.num_regs = 4,
+	.irqs = max77759_maxq_irqs,
+	.num_irqs = ARRAY_SIZE(max77759_maxq_irqs),
+};
+
+static const struct regmap_irq_chip max77759_topsys_irq_chip = {
+	.name = "max77759-topsys",
+	.domain_suffix = "TOPSYS",
+	.status_base = MAX77759_PMIC_REG_TOPSYS_INT,
+	.mask_base = MAX77759_PMIC_REG_TOPSYS_INT_MASK,
+	.ack_base = MAX77759_PMIC_REG_TOPSYS_INT,
+	.num_regs = 1,
+	.irqs = max77759_topsys_irqs,
+	.num_irqs = ARRAY_SIZE(max77759_topsys_irqs),
+};
+
+static const struct regmap_irq_chip max77759_chrg_irq_chip = {
+	.name = "max77759-chgr",
+	.domain_suffix = "CHGR",
+	.status_base = MAX77759_CHGR_REG_CHG_INT,
+	.mask_base = MAX77759_CHGR_REG_CHG_INT_MASK,
+	.num_regs = 2,
+	.irqs = max77759_chgr_irqs,
+	.num_irqs = ARRAY_SIZE(max77759_chgr_irqs),
+};
+
+static const struct max77759_i2c_subdev max77759_i2c_subdevs[] = {
+	{
+		.id = MAX77759_I2C_SUBDEV_ID_MAXQ,
+		/* I2C address is same as top's */
+		.cfg = &max77759_regmap_config_maxq,
+	},
+	{
+		.id = MAX77759_I2C_SUBDEV_ID_CHARGER,
+		.cfg = &max77759_regmap_config_charger,
+		.i2c_address = 0x69,
+	},
+};
+
+static const struct resource max77759_gpio_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MAX77759_MAXQ_INT_GPIO, "GPI"),
+};
+
+static const struct resource max77759_charger_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MAX77759_CHARGER_INT_1, "INT1"),
+	DEFINE_RES_IRQ_NAMED(MAX77759_CHARGER_INT_2, "INT2"),
+};
+
+static const struct mfd_cell max77759_cells[] = {
+	MFD_CELL_OF("max77759-nvmem", NULL, NULL, 0, 0,
+		    "maxim,max77759-nvmem"),
+};
+
+static const struct mfd_cell max77759_maxq_cells[] = {
+	MFD_CELL_OF("max77759-gpio", max77759_gpio_resources, NULL, 0, 0,
+		    "maxim,max77759-gpio"),
+};
+
+static const struct mfd_cell max77759_charger_cells[] = {
+	MFD_CELL_RES("max77759-charger", max77759_charger_resources),
+};
+
+int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
+			  const struct max77759_maxq_command *cmd,
+			  struct max77759_maxq_response *rsp)
+{
+	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
+	int ret;
+	static const unsigned int timeout_ms = 200;
+
+	if (cmd->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
+		return -EINVAL;
+
+	/* rsp is allowed to be NULL. In that case we do need a temporary. */
+	if (!rsp)
+		rsp = _rsp;
+
+	BUILD_BUG_ON(MAX77759_MAXQ_OPCODE_MAXLENGTH
+		     != MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX);
+	if (!rsp->length || rsp->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&max77759_mfd->maxq_lock);
+
+	reinit_completion(&max77759_mfd->cmd_done);
+
+	/* write the opcode and data */
+	ret = regmap_bulk_write(max77759_mfd->regmap_maxq,
+				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
+				cmd->length);
+	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX) {
+		/* writing the last byte triggers MaxQ */
+		ret = regmap_write(max77759_mfd->regmap_maxq,
+				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
+	}
+	if (ret)
+		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
+			 "write data failed: %d\n", ret);
+	if (ret)
+		return ret;
+
+	/* wait for response from MaxQ */
+	if (!wait_for_completion_timeout(&max77759_mfd->cmd_done,
+					 usecs_to_jiffies(timeout_ms))) {
+		dev_err(regmap_get_device(max77759_mfd->regmap_maxq),
+			"timed out waiting for data\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = regmap_bulk_read(max77759_mfd->regmap_maxq,
+			       MAX77759_MAXQ_REG_AP_DATAIN0,
+			       rsp->rsp, rsp->length);
+	if (ret) {
+		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
+			 "read data failed: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * As per the protocol, the first byte of the reply will match the
+	 * request.
+	 */
+	if (rsp->rsp[0] != cmd->cmd[0]) {
+		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
+			 "unexpected opcode response for %#.2x: %*ph\n",
+			 cmd->cmd[0], (int)rsp->length, rsp->rsp);
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max77759_maxq_command);
+
+static irqreturn_t apcmdres_irq_handler(int irq, void *irq_data)
+{
+	struct max77759_mfd *max77759_mfd = irq_data;
+
+	regmap_write(max77759_mfd->regmap_maxq, MAX77759_MAXQ_REG_UIC_INT1,
+		     MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI);
+
+	complete(&max77759_mfd->cmd_done);
+
+	return IRQ_HANDLED;
+}
+
+static int max77759_create_i2c_subdev(struct i2c_client *client,
+				      struct max77759_mfd *max77759_mfd,
+				      const struct max77759_i2c_subdev *sd)
+{
+	struct i2c_client *sub;
+	struct regmap *regmap;
+	int ret;
+
+	if (sd->i2c_address) {
+		sub = devm_i2c_new_dummy_device(&client->dev,
+						client->adapter,
+						sd->i2c_address);
+
+		if (IS_ERR(sub))
+			return dev_err_probe(&client->dev, PTR_ERR(sub),
+					"failed to claim i2c device %s\n",
+					sd->cfg->name);
+	} else {
+		sub = client;
+	}
+
+	regmap = devm_regmap_init_i2c(sub, sd->cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&sub->dev, PTR_ERR(regmap),
+				     "regmap init failed\n");
+
+	ret = regmap_attach_dev(&client->dev, regmap, sd->cfg);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "regmap attach failed\n");
+
+	if (sd->id == MAX77759_I2C_SUBDEV_ID_MAXQ)
+		max77759_mfd->regmap_maxq = regmap;
+	else if (sd->id == MAX77759_I2C_SUBDEV_ID_CHARGER)
+		max77759_mfd->regmap_charger = regmap;
+
+	return 0;
+}
+
+static int max77759_add_chained_irq_chip(struct device *dev,
+					 struct regmap *regmap,
+					 int pirq,
+					 struct regmap_irq_chip_data *parent,
+					 const struct regmap_irq_chip *chip,
+					 struct regmap_irq_chip_data **data)
+{
+	int irq, ret;
+
+	irq = regmap_irq_get_virq(parent, pirq);
+	if (irq < 0)
+		return dev_err_probe(dev, irq,
+				     "Failed to get parent vIRQ(%d) for chip %s\n",
+				     pirq, chip->name);
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0, chip,
+				       data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add %s IRQ chip\n",
+				     chip->name);
+
+	return 0;
+}
+
+static int max77759_add_chained_maxq(struct i2c_client *client,
+				     struct max77759_mfd *max77759_mfd,
+				     struct regmap_irq_chip_data *parent)
+{
+	struct regmap_irq_chip_data *irq_chip_data;
+	int ret;
+	int apcmdres_irq;
+
+	ret = max77759_add_chained_irq_chip(&client->dev,
+					    max77759_mfd->regmap_maxq,
+					    MAX77759_INT_MAXQ,
+					    parent,
+					    &max77759_maxq_irq_chip,
+					    &irq_chip_data);
+	if (ret)
+		return ret;
+
+	/*
+	 * We need to register our own IRQ handler before any MFD cells, to
+	 * ensure client drivers can use our MaxQ interface APIs without
+	 * any race conditions.
+	 */
+	init_completion(&max77759_mfd->cmd_done);
+	apcmdres_irq = regmap_irq_get_virq(irq_chip_data,
+					   MAX77759_MAXQ_INT_APCMDRESI);
+
+	ret = devm_request_threaded_irq(&client->dev, apcmdres_irq,
+					NULL, apcmdres_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					dev_name(&client->dev), max77759_mfd);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "MAX77759_MAXQ_INT_APCMDRESI failed\n");
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				   max77759_maxq_cells,
+				   ARRAY_SIZE(max77759_maxq_cells),
+				   NULL, 0,
+				   regmap_irq_get_domain(irq_chip_data));
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to add MFD devices (MaxQ)\n");
+
+	return 0;
+}
+
+static int max77759_add_chained_topsys(struct i2c_client *client,
+				       struct max77759_mfd *max77759_mfd,
+				       struct regmap_irq_chip_data *parent)
+{
+	struct regmap_irq_chip_data *irq_chip_data;
+	int ret;
+
+	ret = max77759_add_chained_irq_chip(&client->dev,
+					    max77759_mfd->regmap_top,
+					    MAX77759_INT_TOPSYS,
+					    parent,
+					    &max77759_topsys_irq_chip,
+					    &irq_chip_data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max77759_add_chained_charger(struct i2c_client *client,
+					struct max77759_mfd *max77759_mfd,
+					struct regmap_irq_chip_data *parent)
+{
+	struct regmap_irq_chip_data *irq_chip_data;
+	int ret;
+
+	ret = max77759_add_chained_irq_chip(&client->dev,
+					    max77759_mfd->regmap_charger,
+					    MAX77759_INT_CHGR,
+					    parent,
+					    &max77759_chrg_irq_chip,
+					    &irq_chip_data);
+	if (ret)
+		return ret;
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				   max77759_charger_cells,
+				   ARRAY_SIZE(max77759_charger_cells),
+				   NULL, 0,
+				   regmap_irq_get_domain(irq_chip_data));
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to add MFD devices (charger)\n");
+
+	return 0;
+}
+
+static int max77759_probe(struct i2c_client *client)
+{
+	struct regmap *regmap_top;
+	unsigned int pmic_id;
+	int ret;
+	struct irq_data *irq_data;
+	struct max77759_mfd *max77759_mfd;
+	unsigned long irq_flags;
+	struct regmap_irq_chip_data *irq_chip_data_pmic;
+
+	regmap_top = devm_regmap_init_i2c(client, &max77759_regmap_config_top);
+	if (IS_ERR(regmap_top))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap_top),
+				     "regmap init failed\n");
+
+	ret = regmap_read(regmap_top, MAX77759_PMIC_REG_PMIC_ID, &pmic_id);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Unable to read Device ID\n");
+
+	if (pmic_id != MAX77759_PMIC_REG_PMIC_ID_MAX77759)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported Device ID %#.2x (%d)\n",
+				     pmic_id, pmic_id);
+
+	irq_data = irq_get_irq_data(client->irq);
+	if (!irq_data)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "Invalid IRQ: %d\n", client->irq);
+
+	max77759_mfd = devm_kzalloc(&client->dev, sizeof(*max77759_mfd),
+				    GFP_KERNEL);
+	if (!max77759_mfd)
+		return -ENOMEM;
+
+	max77759_mfd->regmap_top = regmap_top;
+	devm_mutex_init(&client->dev, &max77759_mfd->maxq_lock);
+
+	i2c_set_clientdata(client, max77759_mfd);
+
+	for (int i = 0; i < ARRAY_SIZE(max77759_i2c_subdevs); ++i) {
+		ret = max77759_create_i2c_subdev(client,
+						 max77759_mfd,
+						 &max77759_i2c_subdevs[i]);
+		if (ret)
+			return ret;
+	}
+
+	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
+	irq_flags |= irqd_get_trigger_type(irq_data);
+
+	ret = devm_regmap_add_irq_chip(&client->dev, max77759_mfd->regmap_top,
+				       client->irq, irq_flags, 0,
+				       &max77759_pmic_irq_chip,
+				       &irq_chip_data_pmic);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to add IRQ chip\n");
+
+	/* INTSRC - MaxQ & children */
+	ret = max77759_add_chained_maxq(client, max77759_mfd,
+					irq_chip_data_pmic);
+	if (ret)
+		return ret;
+
+	/* INTSRC - topsys & children */
+	ret = max77759_add_chained_topsys(client, max77759_mfd,
+					  irq_chip_data_pmic);
+	if (ret)
+		return ret;
+
+	/* INTSRC - charger & children */
+	ret = max77759_add_chained_charger(client, max77759_mfd,
+					   irq_chip_data_pmic);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
+				    max77759_cells, ARRAY_SIZE(max77759_cells),
+				    NULL, 0,
+				    regmap_irq_get_domain(irq_chip_data_pmic));
+}
+
+static const struct i2c_device_id max77759_i2c_id[] = {
+	{ "max77759", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
+
+static const struct of_device_id max77759_of_id[] = {
+	{ .compatible = "maxim,max77759", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max77759_of_id);
+
+static struct i2c_driver max77759_i2c_driver = {
+	.driver = {
+		.name = "max77759",
+		.of_match_table = max77759_of_id,
+	},
+	.probe = max77759_probe,
+	.id_table = max77759_i2c_id,
+};
+module_i2c_driver(max77759_i2c_driver);
+
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_DESCRIPTION("Maxim MAX77759 multi-function core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
new file mode 100644
index 000000000000..f901bcf502cb
--- /dev/null
+++ b/include/linux/mfd/max77759.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Google Inc.
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Client interface for Maxim MAX77759 MFD driver
+ */
+
+#ifndef __LINUX_MFD_MAX77759_H
+#define __LINUX_MFD_MAX77759_H
+
+/* MaxQ opcodes */
+#define MAX77759_MAXQ_OPCODE_MAXLENGTH 33
+
+#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_READ   0x21
+#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_WRITE  0x22
+#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_READ   0x23
+#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_WRITE  0x24
+#define MAX77759_MAXQ_OPCODE_USER_SPACE_READ     0x81
+#define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE    0x82
+
+/*
+ * register map (incomplete) - registers not useful for drivers are not
+ * declared here
+ */
+/* MaxQ */
+#define MAX77759_MAXQ_REG_UIC_INT1            0x64
+#define MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI  BIT(7)
+#define MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI    BIT(6)
+#define MAX77759_MAXQ_REG_UIC_INT1_GPIO6I     BIT(1)
+#define MAX77759_MAXQ_REG_UIC_INT1_GPIO5I     BIT(0)
+#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, en)  (((en) & 1) << (offs))
+#define MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(offs) \
+				MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, ~0)
+
+#define MAX77759_MAXQ_REG_UIC_INT2            0x65
+#define MAX77759_MAXQ_REG_UIC_INT3            0x66
+#define MAX77759_MAXQ_REG_UIC_INT4            0x67
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS1     0x68
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS2     0x69
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS3     0x6a
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS4     0x6b
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS5     0x6c
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS6     0x6d
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS7     0x6f
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS8     0x6f
+#define MAX77759_MAXQ_REG_UIC_INT1_M          0x70
+#define MAX77759_MAXQ_REG_UIC_INT2_M          0x71
+#define MAX77759_MAXQ_REG_UIC_INT3_M          0x72
+#define MAX77759_MAXQ_REG_UIC_INT4_M          0x73
+
+/* charger */
+#define MAX77759_CHGR_REG_CHG_INT        0xb0
+#define MAX77759_CHGR_REG_CHG_INT2       0xb1
+#define MAX77759_CHGR_REG_CHG_INT_MASK   0xb2
+#define MAX77759_CHGR_REG_CHG_INT2_MASK  0xb3
+
+struct max77759_mfd;
+
+struct max77759_maxq_command {
+	u8 length;
+	u8 cmd[] __counted_by(length);
+};
+
+struct max77759_maxq_response {
+	u8 length;
+	u8 rsp[] __counted_by(length);
+};
+
+int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
+			  const struct max77759_maxq_command *cmd,
+			  struct max77759_maxq_response *rsp);
+
+#endif /* __LINUX_MFD_MAX77759_H */

-- 
2.48.1.658.g4767266eb4-goog


