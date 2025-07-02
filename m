Return-Path: <linux-gpio+bounces-22657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F08AF5F1A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 18:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6291C476A9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 16:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904102F2702;
	Wed,  2 Jul 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QhDuSF9w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48542F50B4;
	Wed,  2 Jul 2025 16:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474999; cv=none; b=s/88saz41yzMDy1NfM3yzQicD09tR58IXqZYsz8gV9CZVCYBHZy1eFM7GR/5lBCeioj4qDT+sMc8XmO5sgOeBIAMfDHcmXU6aftYNyV3NbS0lBgwtc0qeMKPJR1ixl5W2WvqQo7imqblzF7X6fZ3+tEwyjADNdUF9HaHDGaKuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474999; c=relaxed/simple;
	bh=Hh/4tWWTDXvZ8GsDxvsEMlv9qEMhw4hDFi2Gr2kYNwA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTMgeX3XWxpLZ+9VXQn/rBCW+7MmBvrCJLEn2sJduYn1xln5e0X37zuyWEjrQ9ClY0KSgejI4NanPklRZo5rIC5j63tOLmmEClbfKgs8EJUjGOhHIWxmFuE5HoVOV0FwDQroymKpKSYR5rIrMdr4CGer4Ci8IDPHve59aWD4quA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QhDuSF9w; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562GnRZ53292728;
	Wed, 2 Jul 2025 11:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751474967;
	bh=Lutp9KfC58W6Br8Zye34zSE8rie3h5J1OHlUnj/vYxE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QhDuSF9wOD3wbINzyf7LIdazZrN5c+m6sGSe6TvMY/YC+PFFyNqJj7Q1ga0R7ly2o
	 uhmCRMPFszW+SmsK/7advkPj0QVRvA6CRaj5S2bq9PYgdaczojuP6b5p2G0RklTYqx
	 ufq2S2pnOtTbOk2W0xLZ6yHyS0Ucp1N3f+KvQOnc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 562GnRX94092324
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 11:49:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 11:49:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 11:49:27 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 562GnQ5M3771376;
	Wed, 2 Jul 2025 11:49:26 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jcormier@criticallink.com>
Subject: [PATCH v5 1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
Date: Wed, 2 Jul 2025 11:49:25 -0500
Message-ID: <20250702164926.2990958-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702164926.2990958-1-s-ramamoorthy@ti.com>
References: <20250702164926.2990958-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

TPS65215 and TPS65219 are overlapping PMIC devices. While their regulator
features differe, the GPIO features are the same. In the TPS65219 MFD
driver, the 2 PMICs share the same "tps65219-gpio" compatible string to
limit support for TPS65215 in this GPIO driver to comments.

The TPS6521X_GPIO0_IDX and TPS6521X_GPIO0_OFFSET macro name prefixes are
updated to indicate these macros apply to both PMICs.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65219.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 526640c39a11..3c762103babc 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * GPIO driver for TI TPS65219 PMICs
+ * GPIO driver for TI TPS65215/TPS65219 PMICs
  *
- * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com/
  */
 
 #include <linux/bits.h>
@@ -13,8 +13,15 @@
 #include <linux/regmap.h>
 
 #define TPS65219_GPIO0_DIR_MASK		BIT(3)
-#define TPS65219_GPIO0_OFFSET		2
-#define TPS65219_GPIO0_IDX		0
+#define TPS6521X_GPIO0_OFFSET		2
+#define TPS6521X_GPIO0_IDX		0
+
+/*
+ * TPS65215 & TPS65219 GPIO mapping
+ * Linux gpio offset 0 -> GPIO (pin16) -> bit_offset 2
+ * Linux gpio offset 1 -> GPO1 (pin8 ) -> bit_offset 0
+ * Linux gpio offset 2 -> GPO2 (pin17) -> bit_offset 1
+ */
 
 struct tps65219_gpio {
 	struct gpio_chip gpio_chip;
@@ -26,7 +33,7 @@ static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
 	int ret, val;
 
-	if (offset != TPS65219_GPIO0_IDX)
+	if (offset != TPS6521X_GPIO0_IDX)
 		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG, &val);
@@ -42,7 +49,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	struct device *dev = gpio->tps->dev;
 	int ret, val;
 
-	if (offset != TPS65219_GPIO0_IDX) {
+	if (offset != TPS6521X_GPIO0_IDX) {
 		dev_err(dev, "GPIO%d is output only, cannot get\n", offset);
 		return -ENOTSUPP;
 	}
@@ -71,7 +78,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
 	struct device *dev = gpio->tps->dev;
 	int v, mask, bit;
 
-	bit = (offset == TPS65219_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
+	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS6521X_GPIO0_OFFSET : offset - 1;
 
 	mask = BIT(bit);
 	v = value ? mask : 0;
@@ -117,7 +124,7 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
 	struct device *dev = gpio->tps->dev;
 
-	if (offset != TPS65219_GPIO0_IDX) {
+	if (offset != TPS6521X_GPIO0_IDX) {
 		dev_err(dev, "GPIO%d is output only, cannot change to input\n", offset);
 		return -ENOTSUPP;
 	}
@@ -131,7 +138,7 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	tps65219_gpio_set(gc, offset, value);
-	if (offset != TPS65219_GPIO0_IDX)
+	if (offset != TPS6521X_GPIO0_IDX)
 		return 0;
 
 	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
@@ -179,5 +186,5 @@ module_platform_driver(tps65219_gpio_driver);
 
 MODULE_ALIAS("platform:tps65219-gpio");
 MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
-MODULE_DESCRIPTION("TPS65219 GPIO driver");
+MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


