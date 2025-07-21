Return-Path: <linux-gpio+bounces-23609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF60B0CE39
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 01:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17BB188ECD5
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 23:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0591248F4B;
	Mon, 21 Jul 2025 23:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e74GgFWt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E9E1D63E8;
	Mon, 21 Jul 2025 23:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140735; cv=none; b=epnpiRD93xsFcgielKjvTxEzya94W0XnCtofxRqyWr0pougFFCV9+91bkngT7tV/9zd/rWhqkhnpjuv9AQMmXN9a305vC3GRgAxvno/50rzKpRty6FFpPfM96yW108hjAk2Ey4o7fL2FMU0UB/5xTb9Pc6Et7V16Ms0sqPxJ8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140735; c=relaxed/simple;
	bh=i6tKxEuNcD+G3UxzVGGlc6hiHq4a95HioUMYUjqtpEI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxR//tlBXm4t+Cqf9fj+Jo8fE1tg0uL/M94OPIM4u/hEmbDVUdfezJIm7lLdlUxTNQvQLY+woioSffdb/EilViLLEdIKyhcP36ZI84XRW2IB1FtvCAy/+CXF+9wWd2HfJkGDEYrr5fh4LETi7otJrQZtdWJ9XSIE1dpka0RseVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e74GgFWt; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LNVlE21377432;
	Mon, 21 Jul 2025 18:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753140707;
	bh=HVdfvtwEcQGLkiDPt4ta3EAyLflj1k+V7DiWgjSOcBM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e74GgFWtVwgrH85pdtk9PJI+kq3PbHjU9fWv7VLa115WRy3PvJI9UiLXIy9UIRevB
	 sLKopar37OQKsbmwpDrkXIvftVpwUguXVMi3E55bO9G6Wthdmm+TWTR23RHlsener1
	 ifsaEe0p85wlhgWF6GKXHPmQl4pDfelzxuNsuVqI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LNVlNa3657518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 18:31:47 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 18:31:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 18:31:46 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LNVkOx394796;
	Mon, 21 Jul 2025 18:31:47 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jcormier@criticallink.com>,
        <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v7 1/2] gpio: tps65219: Update _IDX & _OFFSET macro prefix
Date: Mon, 21 Jul 2025 18:31:45 -0500
Message-ID: <20250721233146.962225-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721233146.962225-1-s-ramamoorthy@ti.com>
References: <20250721233146.962225-1-s-ramamoorthy@ti.com>
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

Reviewed-by: Roger Quadros <rogerq@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 526640c39a11..2355eec0cee6 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * GPIO driver for TI TPS65219 PMICs
+ * GPIO driver for TI TPS65215/TPS65219 PMICs
  *
- * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2022, 2025 Texas Instruments Incorporated - http://www.ti.com/
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


