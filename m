Return-Path: <linux-gpio+bounces-19861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A63AB1514
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 894291895142
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CB82949E7;
	Fri,  9 May 2025 13:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r23LBHzR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514929345E
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796971; cv=none; b=j5fXhSsi9D/gQcTFbPdw+GVt+VU+JDn5KDQhSKfnU21dsoNb5LZ9dddlzI3THl+vOORuPHZV3jjEBpIrQzVYvfnw87gb9t/Rr1cXHrKNfZVDlqEZ6EUE+xlKYak439d8KI1KrRDZDzZ8ClUsomRpVHfoFdQAfVJpef/db1bwziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796971; c=relaxed/simple;
	bh=+Jkxm9kUk59Gf/JCqhNw58JVqdFzrzMShOMpUPaIUXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0VBT9LdjVTL+W9S2k4M8dgqEj9Zqy/gMBumgED4xd7lLHFbgRpHVv625CwjNflPsEhwtWE1Iz8qK0xJSyRO9Pk9NYMyl123DoIbmjj6cEQbMV+usYIF5pt/YkEz/cT7PEDBi67K3QhqL4wX5W1hopvUyAmkmBdr4iPWTB+B8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r23LBHzR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so242575966b.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746796963; x=1747401763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEZ5yV3kjpB0dWJKbm0TojZamiJAr44GIREkbrbcqS8=;
        b=r23LBHzR+IP2OyWVVQgya+aZkhsrc2MePN8NyyshNgNN3XADYz5F1VkdYMRY2fvCPG
         ENIoElQdqKrHWFJ8lVJdhyUSOLGmgb31H66Ds3cDJPuWxegc9Hn/g8EJZ/UgQTIsJkfM
         IWQRfYY2pBDLEJ5avRt0yAi6SUSxYBBT4OVEn7WUATPYFmh+ojPAiSxVgIwcSrjsYHC9
         xwKY3zHt7zeg+X7p+bBCwQ17GOFRktUvMY4XcupDuXSlj0SxuVNu/TCmczCQAmFybTfr
         d1I9iGGw8zhEX4sY1MKojvZUe+2xMKFGSzznl86KknyWO062I9V4+vzzuXYa+Pxg1h76
         APVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796963; x=1747401763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEZ5yV3kjpB0dWJKbm0TojZamiJAr44GIREkbrbcqS8=;
        b=U4g74IS2qBTzBbH+fQUqNgFnEMmM4b/UpShCkHZdZX/c/INU+JoIp9Jxyw6+hJmf0f
         Rn/y3J6asW61lXREqoL3EoUEIXn3tDo2CRDtCiAjnU26iWL6Y8gGB1yMQDPGQ6Kdscxo
         oYnI5CgJS0MgN9Gn7Bzz5AENmMLhps/akneMad26WIjOi2FfijosWy0MbsBd7w++IYyG
         9vkNACTaNmWtf1n8K+b0VpQrwD0S9HKUugBWgBUQeEnt53+CZVzncbw//PVkWXY5U8nl
         KKPyzc32o96l3lC/J3EnE9XMQ25smg5sU+kaRp6kLckmw9gYjGKlt0w9kah/QgcJDfOb
         jw/w==
X-Forwarded-Encrypted: i=1; AJvYcCUyxq6tKvH1FCFrIvQC4OKHka6C4SZsX/z4YLGxj88o1D2cv2qf4+MYC2VGuPxf6y8Cpt0saoAK5s4c@vger.kernel.org
X-Gm-Message-State: AOJu0YwItSqDGEz4HKkS/k/UOfXCpbVU5fI5BkZfncCaaXVYiCbkA3rw
	wsmUgNPweqhRLspY5iTOAhChH8cQVuLEcaArZjDdImWcA/+UhQmQak62zdYKFEVpaPq6nY7uR4B
	iFf0=
X-Gm-Gg: ASbGncsXDt9BnnsXURNjd4WGATznAyHI2KA3d6Af2REP1Mzs9qKfYjuacdTcyeh7UpX
	umx5tbTQqEJG+rdglfK+eQtOU2JXnw18N7P7IFHQlktlV7NEo+FtRtSl8QVlpSCXviLIjexHHc+
	UTR7v7yLyfPPt6WRNcaKdFS+1SddxTR3sVlm2Cdjv/gW8JCd4jyWVrqV/5IAMJWTADkoiQC+a2c
	tFvDjnpTidnPD+PpW0x90fJDtkP6sPceVT7EWKnBSnTBUt4kKIO+321IZGqOTXDkOHnMPUL7Q6A
	ogsfD8xYEkzjGDgm7xmTwd1lhNVDf6DpfouXYfRHOVPxYFwnOGa3BYhkR6a6NHHAe5b9BqM3Pom
	o1opfPm3nq5jupUE16I7Fiupy
X-Google-Smtp-Source: AGHT+IEbOeh7PFZq5CeNNsjyHag0syj3cqkitAu6N5t6AmeAYLBL0zs3TlGd46bhZBWKYhYG9yQIqQ==
X-Received: by 2002:a17:907:1b1a:b0:ad2:15ec:1350 with SMTP id a640c23a62f3a-ad21928fa05mr323882766b.57.1746796962729;
        Fri, 09 May 2025 06:22:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947abcasm149041966b.84.2025.05.09.06.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:22:42 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 May 2025 14:22:39 +0100
Subject: [PATCH v10 1/3] mfd: max77759: add Maxim MAX77759 core mfd driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250509-max77759-mfd-v10-1-962ac15ee3ef@linaro.org>
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
In-Reply-To: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

Fuel Gauge and TCPC have separate and independent I2C addresses,
register maps, and interrupt lines and are therefore excluded from the
MFD core device driver here.

The GPIO and NVMEM interfaces are accessed via specific commands to the
built-in microprocessor. This driver implements an API that client
drivers can use for accessing those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v10: update a comment (Lee)

v6: really use postinc

v5:
* update all (I hope) of Lee's comments:
* file header C comment (not C++)
* drop references to 'MFD'
* extra indent register bit definitions
* make 'struct max77759' public
* drop comments that were used for visual separation only
* drop MAX77759_*_REG_LAST_REGISTER defines
* add comments to regmap ranges
* use longer lines
* sort local variable in reverse christmas tree order
* update comments in max77759_maxq_command()
* drop BUILD_BUG_ON()
* use dev_err() in max77759_maxq_command()
* reflow max77759_create_i2c_subdev() slightly and update error messages
* drop useless comment in max77759_add_chained_maxq()
* reflow max77759_probe()
* consistent upper-/lower-case in messages

v4:
* add missing build_bug.h include
* update an irq chip comment
* fix a whitespace in register definitions

v2:
* add kernel doc for max77759_maxq_command() and related structs
* fix an msec / usec typo
* add missing error handling of devm_mutex_init() (Christophe)
* align sentinel in max77759_of_id[] with max77759_i2c_id[]
  (Christophe)
* some tidy-ups in max77759_maxq_command() (Christophe)

max77759 Lee's updates
---
 MAINTAINERS                  |   2 +
 drivers/mfd/Kconfig          |  20 ++
 drivers/mfd/Makefile         |   1 +
 drivers/mfd/max77759.c       | 690 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77759.h | 165 +++++++++++
 5 files changed, 878 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dbdf02d6b0c9357ad1da520a0f6c16b7f38f879..59684bf6b8780b652b173f20ce8d2f70b1609a85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14719,6 +14719,8 @@ M:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
+F:	drivers/mfd/max77759.c
+F:	include/linux/mfd/max77759.h
 
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
 M:	Javier Martinez Canillas <javier@dowhile0.org>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e146b28240e731557f34ebe6dea99016b6d19f6b..6fb3768e3d71cbb5c81f63de36cdb2d27a0a7726 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -943,6 +943,26 @@ config MFD_MAX77714
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
index 8f315298b32a2a9ee114ed5e49e760bd8f930aee..79495f9f3457b8a666646ec9671861c64d7939e1 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -169,6 +169,7 @@ obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
 obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
 obj-$(CONFIG_MFD_MAX77705)	+= max77705.o
 obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
+obj-$(CONFIG_MFD_MAX77759)	+= max77759.o
 obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
 obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
 max8925-objs			:= max8925-core.o max8925-i2c.o
diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
new file mode 100644
index 0000000000000000000000000000000000000000..6cf6306c4a3b25655ff08077b6f94316ab8cae04
--- /dev/null
+++ b/drivers/mfd/max77759.c
@@ -0,0 +1,690 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Google Inc
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Core driver for Maxim MAX77759 companion PMIC for USB Type-C
+ */
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
+/* Chip ID as per MAX77759_PMIC_REG_PMIC_ID */
+enum {
+	MAX77759_CHIP_ID = 59,
+};
+
+enum max77759_i2c_subdev_id {
+	/*
+	 * These are arbitrary and simply used to match struct
+	 * max77759_i2c_subdev entries to the regmap pointers in struct
+	 * max77759 during probe().
+	 */
+	MAX77759_I2C_SUBDEV_ID_MAXQ,
+	MAX77759_I2C_SUBDEV_ID_CHARGER,
+};
+
+struct max77759_i2c_subdev {
+	enum max77759_i2c_subdev_id id;
+	const struct regmap_config *cfg;
+	u16 i2c_address;
+};
+
+static const struct regmap_range max77759_top_registers[] = {
+	regmap_reg_range(0x00, 0x02), /* PMIC_ID / PMIC_REVISION / OTP_REVISION */
+	regmap_reg_range(0x22, 0x24), /* INTSRC / INTSRCMASK / TOPSYS_INT */
+	regmap_reg_range(0x26, 0x26), /* TOPSYS_INT_MASK */
+	regmap_reg_range(0x40, 0x40), /* I2C_CNFG */
+	regmap_reg_range(0x50, 0x51), /* SWRESET / CONTROL_FG */
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
+	.max_register = MAX77759_PMIC_REG_CONTROL_FG,
+	.wr_table = &max77759_top_wr_table,
+	.rd_table = &max77759_top_rd_table,
+	.volatile_table = &max77759_top_volatile_table,
+	.num_reg_defaults_raw = MAX77759_PMIC_REG_CONTROL_FG + 1,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_range max77759_maxq_registers[] = {
+	regmap_reg_range(0x60, 0x73), /* Device ID, Rev, INTx, STATUSx, MASKx */
+	regmap_reg_range(0x81, 0xa1), /* AP_DATAOUTx */
+	regmap_reg_range(0xb1, 0xd1), /* AP_DATAINx */
+	regmap_reg_range(0xe0, 0xe0), /* UIC_SWRST */
+};
+
+static const struct regmap_range max77759_maxq_ro_registers[] = {
+	regmap_reg_range(0x60, 0x63), /* Device ID, Rev */
+	regmap_reg_range(0x68, 0x6f), /* STATUSx */
+	regmap_reg_range(0xb1, 0xd1),
+};
+
+static const struct regmap_range max77759_maxq_volatile_registers[] = {
+	regmap_reg_range(0x64, 0x6f), /* INTx, STATUSx */
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
+	.max_register = MAX77759_MAXQ_REG_UIC_SWRST,
+	.wr_table = &max77759_maxq_wr_table,
+	.rd_table = &max77759_maxq_rd_table,
+	.volatile_table = &max77759_maxq_volatile_table,
+	.num_reg_defaults_raw = MAX77759_MAXQ_REG_UIC_SWRST + 1,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct regmap_range max77759_charger_registers[] = {
+	regmap_reg_range(0xb0, 0xcc),
+};
+
+static const struct regmap_range max77759_charger_ro_registers[] = {
+	regmap_reg_range(0xb4, 0xb8), /* INT_OK, DETAILS_0x */
+};
+
+static const struct regmap_range max77759_charger_volatile_registers[] = {
+	regmap_reg_range(0xb0, 0xb1), /* INTx */
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
+	.max_register = MAX77759_CHGR_REG_CHG_CNFG_19,
+	.wr_table = &max77759_charger_wr_table,
+	.rd_table = &max77759_charger_rd_table,
+	.volatile_table = &max77759_charger_volatile_table,
+	.num_reg_defaults_raw = MAX77759_CHGR_REG_CHG_CNFG_19 + 1,
+	.cache_type = REGCACHE_FLAT,
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
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_APCMDRESI, 0, MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_SYSMSGI, 0, MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_GPIO, 0, GENMASK(1, 0)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC1, 0, GENMASK(5, 2)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC2, 1, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC3, 2, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_MAXQ_INT_UIC4, 3, GENMASK(7, 0)),
+};
+
+static const struct regmap_irq max77759_topsys_irqs[] = {
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_TSHDN, 0, MAX77759_PMIC_REG_TOPSYS_INT_TSHDN),
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_SYSOVLO, 0, MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO),
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_SYSUVLO, 0, MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO),
+	REGMAP_IRQ_REG(MAX77759_TOPSYS_INT_FSHIP_NOT_RD, 0, MAX77759_PMIC_REG_TOPSYS_INT_FSHIP),
+};
+
+static const struct regmap_irq max77759_chgr_irqs[] = {
+	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_1, 0, GENMASK(7, 0)),
+	REGMAP_IRQ_REG(MAX77759_CHARGER_INT_2, 1, GENMASK(7, 0)),
+};
+
+static const struct regmap_irq_chip max77759_pmic_irq_chip = {
+	.name = "max77759-pmic",
+	/* INTSRC is read-only and doesn't require clearing */
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
+		.cfg = &max77759_regmap_config_maxq,
+		/* I2C address is same as for sub-block 'top' */
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
+int max77759_maxq_command(struct max77759 *max77759,
+			  const struct max77759_maxq_command *cmd,
+			  struct max77759_maxq_response *rsp)
+{
+	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
+	struct device *dev = regmap_get_device(max77759->regmap_maxq);
+	static const unsigned int timeout_ms = 200;
+	int ret;
+
+	if (cmd->length > MAX77759_MAXQ_OPCODE_MAXLENGTH)
+		return -EINVAL;
+
+	/*
+	 * As a convenience for API users when issuing simple commands, rsp is
+	 * allowed to be NULL. In that case we need a temporary here to write
+	 * the response to, as we need to verify that the command was indeed
+	 * completed correctly.
+	 */
+	if (!rsp)
+		rsp = _rsp;
+
+	if (!rsp->length || rsp->length > MAX77759_MAXQ_OPCODE_MAXLENGTH)
+		return -EINVAL;
+
+	guard(mutex)(&max77759->maxq_lock);
+
+	reinit_completion(&max77759->cmd_done);
+
+	/*
+	 * MaxQ latches the message when the DATAOUT32 register is written. If
+	 * cmd->length is shorter we still need to write 0 to it.
+	 */
+	ret = regmap_bulk_write(max77759->regmap_maxq,
+				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
+				cmd->length);
+	if (!ret && cmd->length < MAX77759_MAXQ_OPCODE_MAXLENGTH)
+		ret = regmap_write(max77759->regmap_maxq,
+				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
+	if (ret) {
+		dev_err(dev, "writing command failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Wait for response from MaxQ */
+	if (!wait_for_completion_timeout(&max77759->cmd_done,
+					 msecs_to_jiffies(timeout_ms))) {
+		dev_err(dev, "timed out waiting for response\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = regmap_bulk_read(max77759->regmap_maxq,
+			       MAX77759_MAXQ_REG_AP_DATAIN0,
+			       rsp->rsp, rsp->length);
+	if (ret) {
+		dev_err(dev, "reading response failed: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * As per the protocol, the first byte of the reply will match the
+	 * request.
+	 */
+	if (cmd->cmd[0] != rsp->rsp[0]) {
+		dev_err(dev, "unexpected opcode response for %#.2x: %*ph\n",
+			cmd->cmd[0], (int)rsp->length, rsp->rsp);
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(max77759_maxq_command);
+
+static irqreturn_t apcmdres_irq_handler(int irq, void *irq_data)
+{
+	struct max77759 *max77759 = irq_data;
+
+	regmap_write(max77759->regmap_maxq, MAX77759_MAXQ_REG_UIC_INT1,
+		     MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI);
+
+	complete(&max77759->cmd_done);
+
+	return IRQ_HANDLED;
+}
+
+static int max77759_create_i2c_subdev(struct i2c_client *client,
+				      struct max77759 *max77759,
+				      const struct max77759_i2c_subdev *sd)
+{
+	struct i2c_client *sub;
+	struct regmap *regmap;
+	int ret;
+
+	/*
+	 * If 'sd' has an I2C address, 'sub' will be assigned a new 'dummy'
+	 * device, otherwise use it as-is.
+	 */
+	sub = client;
+	if (sd->i2c_address) {
+		sub = devm_i2c_new_dummy_device(&client->dev,
+						client->adapter,
+						sd->i2c_address);
+
+		if (IS_ERR(sub))
+			return dev_err_probe(&client->dev, PTR_ERR(sub),
+					"failed to claim I2C device %s\n",
+					sd->cfg->name);
+	}
+
+	regmap = devm_regmap_init_i2c(sub, sd->cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&sub->dev, PTR_ERR(regmap),
+				     "regmap init for '%s' failed\n",
+				     sd->cfg->name);
+
+	ret = regmap_attach_dev(&client->dev, regmap, sd->cfg);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "regmap attach of '%s' failed\n",
+				     sd->cfg->name);
+
+	if (sd->id == MAX77759_I2C_SUBDEV_ID_MAXQ)
+		max77759->regmap_maxq = regmap;
+	else if (sd->id == MAX77759_I2C_SUBDEV_ID_CHARGER)
+		max77759->regmap_charger = regmap;
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
+				     "failed to get parent vIRQ(%d) for chip %s\n",
+				     pirq, chip->name);
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0, chip,
+				       data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add %s IRQ chip\n",
+				     chip->name);
+
+	return 0;
+}
+
+static int max77759_add_chained_maxq(struct i2c_client *client,
+				     struct max77759 *max77759,
+				     struct regmap_irq_chip_data *parent)
+{
+	struct regmap_irq_chip_data *irq_chip_data;
+	int apcmdres_irq;
+	int ret;
+
+	ret = max77759_add_chained_irq_chip(&client->dev,
+					    max77759->regmap_maxq,
+					    MAX77759_INT_MAXQ,
+					    parent,
+					    &max77759_maxq_irq_chip,
+					    &irq_chip_data);
+	if (ret)
+		return ret;
+
+	init_completion(&max77759->cmd_done);
+	apcmdres_irq = regmap_irq_get_virq(irq_chip_data,
+					   MAX77759_MAXQ_INT_APCMDRESI);
+
+	ret = devm_request_threaded_irq(&client->dev, apcmdres_irq,
+					NULL, apcmdres_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					dev_name(&client->dev), max77759);
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
+				     "failed to add child devices (MaxQ)\n");
+
+	return 0;
+}
+
+static int max77759_add_chained_topsys(struct i2c_client *client,
+				       struct max77759 *max77759,
+				       struct regmap_irq_chip_data *parent)
+{
+	struct regmap_irq_chip_data *irq_chip_data;
+	int ret;
+
+	ret = max77759_add_chained_irq_chip(&client->dev,
+					    max77759->regmap_top,
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
+					struct max77759 *max77759,
+					struct regmap_irq_chip_data *parent)
+{
+	struct regmap_irq_chip_data *irq_chip_data;
+	int ret;
+
+	ret = max77759_add_chained_irq_chip(&client->dev,
+					    max77759->regmap_charger,
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
+				     "failed to add child devices (charger)\n");
+
+	return 0;
+}
+
+static int max77759_probe(struct i2c_client *client)
+{
+	struct regmap_irq_chip_data *irq_chip_data_pmic;
+	struct irq_data *irq_data;
+	struct max77759 *max77759;
+	unsigned long irq_flags;
+	unsigned int pmic_id;
+	int ret;
+
+	max77759 = devm_kzalloc(&client->dev, sizeof(*max77759), GFP_KERNEL);
+	if (!max77759)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, max77759);
+
+	max77759->regmap_top = devm_regmap_init_i2c(client,
+						    &max77759_regmap_config_top);
+	if (IS_ERR(max77759->regmap_top))
+		return dev_err_probe(&client->dev, PTR_ERR(max77759->regmap_top),
+				     "regmap init for '%s' failed\n",
+				     max77759_regmap_config_top.name);
+
+	ret = regmap_read(max77759->regmap_top,
+			  MAX77759_PMIC_REG_PMIC_ID, &pmic_id);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "unable to read device ID\n");
+
+	if (pmic_id != MAX77759_CHIP_ID)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "unsupported device ID %#.2x (%d)\n",
+				     pmic_id, pmic_id);
+
+	ret = devm_mutex_init(&client->dev, &max77759->maxq_lock);
+	if (ret)
+		return ret;
+
+	for (int i = 0; i < ARRAY_SIZE(max77759_i2c_subdevs); i++) {
+		ret = max77759_create_i2c_subdev(client, max77759,
+						 &max77759_i2c_subdevs[i]);
+		if (ret)
+			return ret;
+	}
+
+	irq_data = irq_get_irq_data(client->irq);
+	if (!irq_data)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "invalid IRQ: %d\n", client->irq);
+
+	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
+	irq_flags |= irqd_get_trigger_type(irq_data);
+
+	ret = devm_regmap_add_irq_chip(&client->dev, max77759->regmap_top,
+				       client->irq, irq_flags, 0,
+				       &max77759_pmic_irq_chip,
+				       &irq_chip_data_pmic);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to add IRQ chip '%s'\n",
+				     max77759_pmic_irq_chip.name);
+
+	ret = max77759_add_chained_maxq(client, max77759, irq_chip_data_pmic);
+	if (ret)
+		return ret;
+
+	ret = max77759_add_chained_topsys(client, max77759, irq_chip_data_pmic);
+	if (ret)
+		return ret;
+
+	ret = max77759_add_chained_charger(client, max77759, irq_chip_data_pmic);
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
+	{ "max77759" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
+
+static const struct of_device_id max77759_of_id[] = {
+	{ .compatible = "maxim,max77759", },
+	{ }
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
+MODULE_DESCRIPTION("Maxim MAX77759 core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/max77759.h b/include/linux/mfd/max77759.h
new file mode 100644
index 0000000000000000000000000000000000000000..c6face34e38555cbc09db4131925b6ed781af511
--- /dev/null
+++ b/include/linux/mfd/max77759.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Google Inc.
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Maxim MAX77759 core driver
+ */
+
+#ifndef __LINUX_MFD_MAX77759_H
+#define __LINUX_MFD_MAX77759_H
+
+#include <linux/completion.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#define MAX77759_PMIC_REG_PMIC_ID               0x00
+#define MAX77759_PMIC_REG_PMIC_REVISION         0x01
+#define MAX77759_PMIC_REG_OTP_REVISION          0x02
+#define MAX77759_PMIC_REG_INTSRC                0x22
+#define MAX77759_PMIC_REG_INTSRCMASK            0x23
+#define   MAX77759_PMIC_REG_INTSRC_MAXQ         BIT(3)
+#define   MAX77759_PMIC_REG_INTSRC_TOPSYS       BIT(1)
+#define   MAX77759_PMIC_REG_INTSRC_CHGR         BIT(0)
+#define MAX77759_PMIC_REG_TOPSYS_INT            0x24
+#define MAX77759_PMIC_REG_TOPSYS_INT_MASK       0x26
+#define   MAX77759_PMIC_REG_TOPSYS_INT_TSHDN    BIT(6)
+#define   MAX77759_PMIC_REG_TOPSYS_INT_SYSOVLO  BIT(5)
+#define   MAX77759_PMIC_REG_TOPSYS_INT_SYSUVLO  BIT(4)
+#define   MAX77759_PMIC_REG_TOPSYS_INT_FSHIP    BIT(0)
+#define MAX77759_PMIC_REG_I2C_CNFG              0x40
+#define MAX77759_PMIC_REG_SWRESET               0x50
+#define MAX77759_PMIC_REG_CONTROL_FG            0x51
+
+#define MAX77759_MAXQ_REG_UIC_INT1              0x64
+#define   MAX77759_MAXQ_REG_UIC_INT1_APCMDRESI  BIT(7)
+#define   MAX77759_MAXQ_REG_UIC_INT1_SYSMSGI    BIT(6)
+#define   MAX77759_MAXQ_REG_UIC_INT1_GPIO6I     BIT(1)
+#define   MAX77759_MAXQ_REG_UIC_INT1_GPIO5I     BIT(0)
+#define   MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, en)  (((en) & 1) << (offs))
+#define   MAX77759_MAXQ_REG_UIC_INT1_GPIOxI_MASK(offs) \
+				MAX77759_MAXQ_REG_UIC_INT1_GPIOxI(offs, ~0)
+#define MAX77759_MAXQ_REG_UIC_INT2              0x65
+#define MAX77759_MAXQ_REG_UIC_INT3              0x66
+#define MAX77759_MAXQ_REG_UIC_INT4              0x67
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS1       0x68
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS2       0x69
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS3       0x6a
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS4       0x6b
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS5       0x6c
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS6       0x6d
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS7       0x6f
+#define MAX77759_MAXQ_REG_UIC_UIC_STATUS8       0x6f
+#define MAX77759_MAXQ_REG_UIC_INT1_M            0x70
+#define MAX77759_MAXQ_REG_UIC_INT2_M            0x71
+#define MAX77759_MAXQ_REG_UIC_INT3_M            0x72
+#define MAX77759_MAXQ_REG_UIC_INT4_M            0x73
+#define MAX77759_MAXQ_REG_AP_DATAOUT0           0x81
+#define MAX77759_MAXQ_REG_AP_DATAOUT32          0xa1
+#define MAX77759_MAXQ_REG_AP_DATAIN0            0xb1
+#define MAX77759_MAXQ_REG_UIC_SWRST             0xe0
+
+#define MAX77759_CHGR_REG_CHG_INT               0xb0
+#define MAX77759_CHGR_REG_CHG_INT2              0xb1
+#define MAX77759_CHGR_REG_CHG_INT_MASK          0xb2
+#define MAX77759_CHGR_REG_CHG_INT2_MASK         0xb3
+#define MAX77759_CHGR_REG_CHG_INT_OK            0xb4
+#define MAX77759_CHGR_REG_CHG_DETAILS_00        0xb5
+#define MAX77759_CHGR_REG_CHG_DETAILS_01        0xb6
+#define MAX77759_CHGR_REG_CHG_DETAILS_02        0xb7
+#define MAX77759_CHGR_REG_CHG_DETAILS_03        0xb8
+#define MAX77759_CHGR_REG_CHG_CNFG_00           0xb9
+#define MAX77759_CHGR_REG_CHG_CNFG_01           0xba
+#define MAX77759_CHGR_REG_CHG_CNFG_02           0xbb
+#define MAX77759_CHGR_REG_CHG_CNFG_03           0xbc
+#define MAX77759_CHGR_REG_CHG_CNFG_04           0xbd
+#define MAX77759_CHGR_REG_CHG_CNFG_05           0xbe
+#define MAX77759_CHGR_REG_CHG_CNFG_06           0xbf
+#define MAX77759_CHGR_REG_CHG_CNFG_07           0xc0
+#define MAX77759_CHGR_REG_CHG_CNFG_08           0xc1
+#define MAX77759_CHGR_REG_CHG_CNFG_09           0xc2
+#define MAX77759_CHGR_REG_CHG_CNFG_10           0xc3
+#define MAX77759_CHGR_REG_CHG_CNFG_11           0xc4
+#define MAX77759_CHGR_REG_CHG_CNFG_12           0xc5
+#define MAX77759_CHGR_REG_CHG_CNFG_13           0xc6
+#define MAX77759_CHGR_REG_CHG_CNFG_14           0xc7
+#define MAX77759_CHGR_REG_CHG_CNFG_15           0xc8
+#define MAX77759_CHGR_REG_CHG_CNFG_16           0xc9
+#define MAX77759_CHGR_REG_CHG_CNFG_17           0xca
+#define MAX77759_CHGR_REG_CHG_CNFG_18           0xcb
+#define MAX77759_CHGR_REG_CHG_CNFG_19           0xcc
+
+/* MaxQ opcodes for max77759_maxq_command() */
+#define MAX77759_MAXQ_OPCODE_MAXLENGTH (MAX77759_MAXQ_REG_AP_DATAOUT32 - \
+					MAX77759_MAXQ_REG_AP_DATAOUT0 + \
+					1)
+
+#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_READ   0x21
+#define MAX77759_MAXQ_OPCODE_GPIO_TRIGGER_WRITE  0x22
+#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_READ   0x23
+#define MAX77759_MAXQ_OPCODE_GPIO_CONTROL_WRITE  0x24
+#define MAX77759_MAXQ_OPCODE_USER_SPACE_READ     0x81
+#define MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE    0x82
+
+/**
+ * struct max77759 - core max77759 internal data structure
+ *
+ * @regmap_top: Regmap for accessing TOP registers
+ * @maxq_lock: Lock for serializing access to MaxQ
+ * @regmap_maxq: Regmap for accessing MaxQ registers
+ * @cmd_done: Used to signal completion of a MaxQ command
+ * @regmap_charger: Regmap for accessing charger registers
+ *
+ * The MAX77759 comprises several sub-blocks, namely TOP, MaxQ, Charger,
+ * Fuel Gauge, and TCPCI.
+ */
+struct max77759 {
+	struct regmap *regmap_top;
+
+	/* This protects MaxQ commands - only one can be active */
+	struct mutex maxq_lock;
+	struct regmap *regmap_maxq;
+	struct completion cmd_done;
+
+	struct regmap *regmap_charger;
+};
+
+/**
+ * struct max77759_maxq_command - structure containing the MaxQ command to
+ * send
+ *
+ * @length: The number of bytes to send.
+ * @cmd: The data to send.
+ */
+struct max77759_maxq_command {
+	u8 length;
+	u8 cmd[] __counted_by(length);
+};
+
+/**
+ * struct max77759_maxq_response - structure containing the MaxQ response
+ *
+ * @length: The number of bytes to receive.
+ * @rsp: The data received. Must have at least @length bytes space.
+ */
+struct max77759_maxq_response {
+	u8 length;
+	u8 rsp[] __counted_by(length);
+};
+
+/**
+ * max77759_maxq_command() - issue a MaxQ command and wait for the response
+ * and associated data
+ *
+ * @max77759: The core max77759 device handle.
+ * @cmd: The command to be sent.
+ * @rsp: Any response data associated with the command will be copied here;
+ *     can be %NULL if the command has no response (other than ACK).
+ *
+ * Return: 0 on success, a negative error number otherwise.
+ */
+int max77759_maxq_command(struct max77759 *max77759,
+			  const struct max77759_maxq_command *cmd,
+			  struct max77759_maxq_response *rsp);
+
+#endif /* __LINUX_MFD_MAX77759_H */

-- 
2.49.0.1015.ga840276032-goog


