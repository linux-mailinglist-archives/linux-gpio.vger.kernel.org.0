Return-Path: <linux-gpio+bounces-14738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716FA0C4EB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7879918851B7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA81E1F9AAE;
	Mon, 13 Jan 2025 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kF3TgaVi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B651D5CCC;
	Mon, 13 Jan 2025 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808962; cv=none; b=efU3dRor0Amf+38B8JMjAqdbnUKmFh0GdO29kUcxL2cDVVY7SBpH7xLvDXIgMkMbAOEuNx/H2eNI8T7ycKIY2/AKHeQrU4G2mIpa3Tkax/pdafmLq3wLuGErKuFVvAGebX3RPdn/hKDIQkwEpraTNNj0OLedQjy8WdkW/GKQlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808962; c=relaxed/simple;
	bh=eLgWbwr+HdznEx+mPYR8aItzP0MmG4feZT8c4voRN78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chGZM1JK1c/hkooTjPy6aPGNeSFnqVFwQ7xv/PUva7eugYAbVOgEBy8uddZ5TTxH7vOgx8lQEVx/1EfKE709wlKFRhpypGSjLFvUGa0bdrg7iGrj5zIpuUWpZVB4zAws8RZ4Zvx84oHRoysB7CpR3ZPnpIZGsSs8Zo9L/6xi/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kF3TgaVi; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50DMtUZE103651;
	Mon, 13 Jan 2025 16:55:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736808930;
	bh=gLmMXGTfUb8j5ddv6kcDeHTlf8WPsi4njchz9eZjtf8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kF3TgaVio8Ma8eG05F7dYwGLf5TVm9lNvx9SuJwwvOo9rgcBBzl4yEF2jD6THKpBa
	 mnjWTuXjA8t88Hju3cNX5fBkTHJnvSAKp5tA2YCElakM0VwDUJbM2XJC9D1jPqd+8r
	 VKR44ueSvIFf6ekSokQegTgr+FXMsw6ZwXqdbjhw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtUwC086496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 16:55:30 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 16:55:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 16:55:30 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DMtU55047817;
	Mon, 13 Jan 2025 16:55:30 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 1/3] gpio: tps65215: Add TPS65215 to platform_device_id table
Date: Mon, 13 Jan 2025 16:55:28 -0600
Message-ID: <20250113225530.124213-2-s-ramamoorthy@ti.com>
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

Add platform_device_id struct and use the platform_get_device_id() output
to match which PMIC device is in use. With new name options, the gpio_chip
.label field is now assigned to the platform_device name match.

Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 526640c39a11..7e03be0c7c92 100644
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
+	{ }
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


