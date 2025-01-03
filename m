Return-Path: <linux-gpio+bounces-14489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB495A0105D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CE0E16353C
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 22:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECD21C232B;
	Fri,  3 Jan 2025 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fFxkbcud"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886E17C220;
	Fri,  3 Jan 2025 22:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735944867; cv=none; b=C4VtXRIHWF/yRLRDFEtjD5HVgft7RBvIOFRKlxugUNUgET/Y4kbTYrJiseW0fn/Bp+fV1MxHsVFo03dOgPZdgm2JKRDcq1zfeL0Ta3v/s/ho6lClfCk17y6iipw2N7W6JcqtpldLxAhrdDfvUEAiC5XAR7wp1t9ClfqPiIK6Qzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735944867; c=relaxed/simple;
	bh=Q403zm9mqZiM7NJEI2i/zsUuRRZ6VFwUGAbGjbE+DQE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZVaeC/xam4kvwrWOzyEqnIHQtaJXR9EcBTCmcXlbo1sHT7CwwHj7IqIo52gYzcoxatyP0jLKDnDadHJ70voQkx9BQJrT3WWtesOXLo3w3g1rb0gHyK1KcP5+MRwSNWVmsPrktUjM0q7wzrHwRQa5F2+zFt3VsPsPIzB9wIXY8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fFxkbcud; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503Ms7742378837
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 16:54:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735944847;
	bh=PUaUz+rpwoHsTz7ROMQCNz8UqAK+vdpgENmahlQwB7Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fFxkbcudneJzeehjEF1/4dW9oWPqvBPCkfb3aJNEoII/AbKXOGJyJ3r3DRXtgemIL
	 TaTj2vvKafT/glOPXpbLlKh6F1eWT+GcswdnLhWe9wEBP/1iHmIuPsAopmLJqIDDvJ
	 WjJGRmmY0EusA1NkpTvBrEELDb+NX2ilhvFB1xQc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503Ms7QX061292;
	Fri, 3 Jan 2025 16:54:07 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 16:54:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 16:54:07 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503Ms7AM098981;
	Fri, 3 Jan 2025 16:54:07 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 1/3] gpio: tps65215: Add TPS65215 to platform_device_id table
Date: Fri, 3 Jan 2025 16:54:05 -0600
Message-ID: <20250103225407.196068-2-s-ramamoorthy@ti.com>
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
2.34.1


