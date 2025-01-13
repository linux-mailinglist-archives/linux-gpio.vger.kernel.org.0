Return-Path: <linux-gpio+bounces-14737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAEA0C4E8
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C379918811A6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08A21F9A95;
	Mon, 13 Jan 2025 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gHkHqXHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E61D5CCC;
	Mon, 13 Jan 2025 22:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808951; cv=none; b=ntwhhEY2EZNVKk9UlxsAFMBG3dWVK7lMCQ9/SouChTZtsq673ws7gIH70BiU1FJ6erGUMuO+o11RGBIFVKNlh3F2ubL+6a+WtxDAefHcLPCNyPWaPzAtzb6YDpsjdPl5tHAUPZNd/MQzl6//HzJb0eTxXnlPFlv4+MdSevBhoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808951; c=relaxed/simple;
	bh=Fmb/nG+uD0XTG4I2Ot3fwepT/zZC/OX2GMKcSIhtlwQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOS0uu/ZFCpCV3d11P0mIAhVj7/lK61x6DOOQgu2Jlu3Qe7nsPpsu6F9mPOruNMQVuFfbl/m3mLtbT/YuKByD4F+Ng1DAJWtOV8hA6tkGf6O3DdiG++z1MOBBvITrtz3w2uKREWk7h17FZCoTYGBEJsPTJxSjuNH4ECKYR/6qQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gHkHqXHr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtVto3760652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:55:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736808931;
	bh=ojOuWESO9FkVlOtfgnqTVX+eAvMKTt16l2Utsyj+/EM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gHkHqXHropckwdylTndJLGnd6lh+ulVwgg7/kd6RPhre1cwbAp3hoFbskzh5aTTp4
	 Jx3ObbXariSKS6+6nXw3KZJATPkHmtYIPPvkFW2iJ95xp/cL0yKc0AA7kMjvC43Q24
	 yv5fmAeYOkUFDNT3Vlbz5CyhX0uouNSp5apfzXoo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtVJq037814
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 16:55:31 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 16:55:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 16:55:30 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DMtU57047817;
	Mon, 13 Jan 2025 16:55:30 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 3/3] gpio tps65215: Add support for varying gpio/offset values
Date: Mon, 13 Jan 2025 16:55:30 -0600
Message-ID: <20250113225530.124213-4-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113225530.124213-1-s-ramamoorthy@ti.com>
References: <20250113225530.124213-1-s-ramamoorthy@ti.com>
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
 drivers/gpio/gpio-tps65219.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 70a4410c473a..f2d8fd65d422 100644
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
+	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.offset - 1) : offset - 1;
 
 	mask = BIT(bit);
 	v = value ? mask : 0;
@@ -148,14 +152,28 @@ static const struct gpio_chip tps65219_template_chip = {
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
-	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct tps65219_gpio *gpio;
+	const struct tps65219_chip_data *pmic;
+
+	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
+	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
+	pmic = &chip_info_table[chip];
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -164,6 +182,8 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
 	gpio->tps = tps;
 	gpio->gpio_chip = tps65219_template_chip;
 	gpio->gpio_chip.label = dev_name(&pdev->dev);
+	gpio->gpio_chip.ngpio =  pmic->ngpio;
+	gpio->gpio_chip.offset = pmic->offset;
 	gpio->gpio_chip.parent = tps->dev;
 
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
-- 
2.43.0


