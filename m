Return-Path: <linux-gpio+bounces-19325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E11A9D30D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 22:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C621B6255E
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 20:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E67D2236EE;
	Fri, 25 Apr 2025 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UcDTxIVs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B1521FF28;
	Fri, 25 Apr 2025 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613234; cv=none; b=nfZONe0VmuLVChHtEf89T89gF8BD9qYZxC0iKEEFHD29ESTSKEgz3fO2RsHLql3QX445Eem4YHJEUN6kEGB/IJec+2wRlpctCXJ3Xh0l+aCdbKBQPWu5tRvAJD+d9y4tVSyudCivQo9f0dkV7ScWC9V/3pIDpXf9LzWEvrVxYaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613234; c=relaxed/simple;
	bh=fpsALeurDplFEDYi6Y4/YldvSEypIcvFuNMmHGuVBSI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o/Uk2aJisQiZEWui6P829BpLfR2hYAwk4n99K7qbaRNh4iOS7rWi/c02SMh1IMI2f/dQzsNdg3DGa5B96FYAzW2yO3ri79zZ5ou31JiViam4kJwjuC6krgb/ZOXTplAgz+I5hC5NU3KGhtjXpLjofDEFijvozA4Gv7LpebR6UzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UcDTxIVs; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKXGs22253043
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745613196;
	bh=ol88Fhen3dkSnlD6MynWEnaah8tYj6NinLGb/qYvyt0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UcDTxIVsdC0e//h/CaTOHBC4+hoDPk9EcQSIJpfVtbSCGUdIZEocXMY8kn9TgQlZE
	 T6b4H/U4znCYfnelUez/pr9mdAAI33dR1pGegLDESIxXY/af4Vzag6vi/URe/d3Cdx
	 Qu1ANZ6Lt4xBePKfeWEM/Ge2xaZ66lQEBHWnqlVM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKXGeE048883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:33:16 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:33:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:33:15 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKXFbW054212;
	Fri, 25 Apr 2025 15:33:15 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 1/3] gpio: tps65219: Add TPS65215 to platform_device_id table
Date: Fri, 25 Apr 2025 15:33:13 -0500
Message-ID: <20250425203315.71497-2-s-ramamoorthy@ti.com>
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

Add platform_device_id struct and use the platform_get_device_id() output
to match which PMIC device is in use. With new name options, the gpio_chip
.label field is now assigned to the platform_device name match.

Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 526640c39a11..996f8deaf03d 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * GPIO driver for TI TPS65219 PMICs
+ * GPIO driver for TI TPS65215/TPS65219 PMICs
  *
- * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
  */
 
 #include <linux/bits.h>
@@ -141,7 +141,6 @@ static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int off
 }
 
 static const struct gpio_chip tps65219_template_chip = {
-	.label			= "tps65219-gpio",
 	.owner			= THIS_MODULE,
 	.get_direction		= tps65219_gpio_get_direction,
 	.direction_input	= tps65219_gpio_direction_input,
@@ -164,20 +163,28 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
 
 	gpio->tps = tps;
 	gpio->gpio_chip = tps65219_template_chip;
+	gpio->gpio_chip.label = dev_name(&pdev->dev);
 	gpio->gpio_chip.parent = tps->dev;
 
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
 }
 
+static const struct platform_device_id tps6521x_gpio_id_table[] = {
+	{ "tps65215-gpio", TPS65215 },
+	{ "tps65219-gpio", TPS65219 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
+
 static struct platform_driver tps65219_gpio_driver = {
 	.driver = {
 		.name = "tps65219-gpio",
 	},
 	.probe = tps65219_gpio_probe,
+	.id_table = tps6521x_gpio_id_table,
 };
 module_platform_driver(tps65219_gpio_driver);
 
-MODULE_ALIAS("platform:tps65219-gpio");
 MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
-MODULE_DESCRIPTION("TPS65219 GPIO driver");
+MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


