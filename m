Return-Path: <linux-gpio+bounces-14247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038DD9FCE4E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 22:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AF8F7A043D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2024 21:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A801A1BBBE0;
	Thu, 26 Dec 2024 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tbmQcLKr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA391B21AB;
	Thu, 26 Dec 2024 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250367; cv=none; b=LVQAX6G4woLzgj4sVnbz4mduUc851Z88Gng/viiLsu0xz1pURIuRtwT9+vCFcgYq2Dm2VJwTUoMeRBF0Y2twKMcLc9HDFAC3IggD66x3LkxT0O+psedusqsjkJWLltrgR65+MfCidOW9kVjA1vALmX8jz0MNo1wR6UmmUwFOSu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250367; c=relaxed/simple;
	bh=YOJFcQUVYHvLAon8zslNiB3RMNDVOXFQDrTZMWRacwA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INHBHOLV53BTLvYrQcuucLoM9+/QakluBieBpZgvayhd+Tvhhfmyk/DUGFHZBFErQGO+VidU/2dkNekI8TB2k8j2cbNWZ5DsvQGqQySBo6cyKL6HJTQrw0wwCUuFYHa3CpIHhy1C8It0xiFI3POl8uKf2T//qJNeEpDdez1plVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tbmQcLKr; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLx0xK1011603
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:59:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250341;
	bh=VgXU2JJnzqdxhbvzpcY0jkgaaM3Y+6O185ODfuYm7OY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tbmQcLKrAYzFVAaekz2uFqCOkrw/DVX6p2D9zDsZrlzFAdEmYb+5nujXhRePyOw+P
	 Ljv3Q37NQtQjTXri3jDN1AspdOCszf/ngEIRQqEa6wlms8onBMH+17I9Bt6bMJ0QN4
	 buQhuHWa3N+6Gscs+QpQtavKa3zG92muFCu5zoF4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLx0Jr076129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:59:00 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:59:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:59:00 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLww60056047;
	Thu, 26 Dec 2024 15:59:00 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 3/3] gpio tps65215: Add support for varying gpio/offset values
Date: Thu, 26 Dec 2024 15:58:58 -0600
Message-ID: <20241226215858.397054-4-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226215858.397054-1-s-ramamoorthy@ti.com>
References: <20241226215858.397054-1-s-ramamoorthy@ti.com>
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
index 7adc1274d80e..18055c2dd35c 100644
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
 
+struct chip_data {
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
 
+static const struct chip_data chip_info_table[] = {
+	[TPS65219] = {
+		.ngpio = 3,
+		.offset = 2,
+	},
+	[TPS65215] = {
+		.ngpio = 2,
+		.offset = 1,
+	},
+};
+
 static int tps65219_gpio_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
 	struct tps65219_gpio *gpio;
+	const struct chip_data *pmic;
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


