Return-Path: <linux-gpio+bounces-19323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35FCA9D307
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 22:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48B0D164CC0
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 20:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C526E221D9E;
	Fri, 25 Apr 2025 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aPSGwDaP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D15186E20;
	Fri, 25 Apr 2025 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613227; cv=none; b=pRbaeQy9FLzbJKFFXuF/59FWlER4Phfzl3Wz9PIA5gYc384zvxY3MpAsCDXurDO+CTvTt011aTyOU58QWTshT5q66fWbKZJHvyBvzdzNpNQPW9kM0IZ7bJ3A8Fp0kJeKL3tI98skdu87EOkm05F7yZBCExq+Hcg+b+reQyyKxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613227; c=relaxed/simple;
	bh=a2fd/ouzR5gQ0KPu5a9x2xFjwchY9cXrpbjCfSslLlQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QXt8thz+JFkcsTnq86WR5M/CJfEyCvOowvtYqBT/d8JUIohYrxvJ2sDn7G8f7l+Mlgspcs9a5j2muKnNMxACuYZQJV1rFHtgqnWxyXo0KaRbw3sIhq8CXvcg5H0Q8xAOdDNgaQCkWHanIqv8U5Xi5xRK+zAHsD/RwhJ1xLdWxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aPSGwDaP; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKXG9x2267843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745613196;
	bh=WVKldgf/yjRpef/BpS7lZTdEVRLPxQjIE5A/hLeZScY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aPSGwDaPDCxkNvpn9lNszcBI0RzOODuGG3NuErDopzuDIWlGCBYYDrPvBxF1eSUF2
	 CQxgOxbalTGpRFvdGSnV7BuBQxPkjCFUmEHDrPGBZcq9S5KpaukxKbcSnGio3kqJhk
	 emQHcnHBg7XF04KQguSfTzAhvnv75xKSPaXbhKNw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKXGHD019855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:33:16 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:33:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:33:15 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKXFbY054212;
	Fri, 25 Apr 2025 15:33:15 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 3/3] gpio: tps65219: Add support for varying gpio/offset values
Date: Fri, 25 Apr 2025 15:33:15 -0500
Message-ID: <20250425203315.71497-4-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425203315.71497-1-s-ramamoorthy@ti.com>
References: <20250425203315.71497-1-s-ramamoorthy@ti.com>
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
 drivers/gpio/gpio-tps65219.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index a5a9dfdb214c..c971deac8619 100644
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
-	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct tps65219_gpio *gpio;
+	const struct tps65219_chip_data *pmic;
+
+	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
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
2.43.0


