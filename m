Return-Path: <linux-gpio+bounces-14488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E0AA0105A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4DAC1884CB5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 22:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8271BDA91;
	Fri,  3 Jan 2025 22:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SeFUyJHi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FB72E401;
	Fri,  3 Jan 2025 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735944865; cv=none; b=QtlYx5LV6j6xFLzuAgZ+P40du0FPIVeSQK450BSvY/hS4l2IpWluzvUZwYcx0kQgYmwPSpyz++sRo6JIHQoJcnwv7LUw1b07AK22H2WqdMnFRYR/3EZLuEdJQJn8mJ8//mb4pQG7tQ9oOdS66p/oQIhj/LiMlAUE2fRMUv2Myns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735944865; c=relaxed/simple;
	bh=cla/HPYLsfl2z1Zg3daqfYOHVGEV9GJA2zhuacRsqQ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vCcw9j8ijSuYz3iUCQyR/S2T763vacBKBos0QoyFqiFcPQIPfe2mpE5jOSKAk53l1av5EUBAfS40G3NQHPHm0a9zJBzC3VJJu8af1Inb0SbFtEGGAgNdJi1XfBlZ58DHEanLGojP5+W/oaHhp/yrvIG7q1TkSzP/frhjAA61EZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SeFUyJHi; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503Ms7Hn078932;
	Fri, 3 Jan 2025 16:54:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735944847;
	bh=P/njhejPc44HTljZBfzvhhj6hnO7YPM6bRtiVVpdc2g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SeFUyJHi2brY9SWiSuMBl77ztcMemTg56nJ8Kh+XrtC59C+1WcallbVSjjiril/Qs
	 /1cfVzOJ6f/PR1IZOTD39TA+VtS0vA+m9FDAJItJ4hD+7mDKScMaiYBfkINz36/SCW
	 akP8XEtg9hpM4Pohuz2UjP2OtvnTBcjk8fvwjsN0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503Ms7ch008026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 16:54:07 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 16:54:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 16:54:07 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503Ms7AO098981;
	Fri, 3 Jan 2025 16:54:07 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/3] gpio tps65215: Add support for varying gpio/offset values
Date: Fri, 3 Jan 2025 16:54:07 -0600
Message-ID: <20250103225407.196068-4-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103225407.196068-1-s-ramamoorthy@ti.com>
References: <20250103225407.196068-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add device-specific structs to select the different PMIC .npgio and .offset
values. With the chip_data struct values selected based on the match data,
having a separate GPIO0_OFFSET macro is no longer needed.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 70a4410c473a..14286dd5fdfb 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -13,7 +13,6 @@
 #include <linux/regmap.h>
 
 #define TPS65219_GPIO0_DIR_MASK		BIT(3)
-#define TPS65219_GPIO0_OFFSET		2
 #define TPS6521X_GPIO0_IDX			0
 
 struct tps65219_gpio {
@@ -21,6 +20,11 @@ struct tps65219_gpio {
 	struct tps65219 *tps;
 };
 
+struct tps65219_chip_data {
+	int ngpio;
+	int offset;
+};
+
 static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
@@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
 	struct device *dev = gpio->tps->dev;
 	int v, mask, bit;
 
-	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
+	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.ngpio - 1) : offset - 1;
 
 	mask = BIT(bit);
 	v = value ? mask : 0;
@@ -148,14 +152,29 @@ static const struct gpio_chip tps65219_template_chip = {
 	.get			= tps65219_gpio_get,
 	.set			= tps65219_gpio_set,
 	.base			= -1,
-	.ngpio			= 3,
 	.can_sleep		= true,
 };
 
+static const struct tps65219_chip_data chip_info_table[] = {
+	[TPS65215] = {
+		.ngpio = 2,
+		.offset = 1,
+	},
+	[TPS65219] = {
+		.ngpio = 3,
+		.offset = 2,
+	},
+};
+
 static int tps65219_gpio_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct tps65219_gpio *gpio;
+	const struct tps65219_chip_data *pmic;
+
+	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
+
+	pmic = &chip_info_table[chip];
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -164,6 +183,8 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
 	gpio->tps = tps;
 	gpio->gpio_chip = tps65219_template_chip;
 	gpio->gpio_chip.label = dev_name(&pdev->dev);
+	gpio->gpio_chip.ngpio =  pmic->ngpio;
+	gpio->gpio_chip.offset = pmic->offset;
 	gpio->gpio_chip.parent = tps->dev;
 
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
-- 
2.34.1


