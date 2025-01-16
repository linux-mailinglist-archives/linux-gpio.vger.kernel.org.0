Return-Path: <linux-gpio+bounces-14872-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA5A1448F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 23:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00F153A609A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 22:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B38C236A62;
	Thu, 16 Jan 2025 22:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TTbSPYrp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B81DAC81;
	Thu, 16 Jan 2025 22:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067137; cv=none; b=ScvMVJrRva+/aTzkG9m/XN7l4LgDjVx8sPf6KS8PEJ2yCN1NBV3jUPgHfB0a3JnWZae9Mrbbi6Qa3EN2tZi7pGidq4X2SgDuFR6WLmNOWchaiBS8XS9cvAObSCuxVhaN/HDdBSqNoOIgCYbTdeRoJAnQCcF7ZGbAz0+6K2AN3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067137; c=relaxed/simple;
	bh=+IujE3cxCeU0fLF5a4tyykT1CiAKcFwbHzhdkuKMlrs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTzaFaas/qXnIRyKl4YqLml4ZZ1dVDLg46tegVpmyjNX8f4QY5lnf5g4tbG6LO+dcKKTjKTjKIMFaA+IMlEmuj0491N4rVw8ISraxSPO4pAyRGg2d0xB2Ugl4XuOsJQNgXVPTKLCbMjJbZCAkhDCjQOi5DEcgrX0DqchTY2lvQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TTbSPYrp; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMceWD223977
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 16:38:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067120;
	bh=GeXJ821fNC9BH95Vrlqxb5lfJurrOTDvgowcdMP1QFs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TTbSPYrpSNUxn56wLVPu+3Dj5DlBBpgubOD7EB2ArNiI0NwumIKondMdpNh9GfUbl
	 IYv11ITf7XNL3S/3EHeoJEp7YzPue5zA6TvVrGiTUlY3rOVkRJaEfWd1Qr5fPf5Fog
	 0LDffKfbNe3ghbNyBpQaPvQlPOH0HOpzhy7U8sTs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMcevQ089601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jan 2025 16:38:40 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:38:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:38:40 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMcebS024854;
	Thu, 16 Jan 2025 16:38:40 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 1/1] gpio: tps65214: Add support for TI TPS65214 PMIC
Date: Thu, 16 Jan 2025 16:38:40 -0600
Message-ID: <20250116223840.430054-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116223840.430054-1-s-ramamoorthy@ti.com>
References: <20250116223840.430054-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add TPS65214 support to platform_id table and device-specific chip_data
struct. Update descriptions to reflect the driver supports 3 PMICs:
TPS65214, TPS65215, and TPS65219.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/gpio/gpio-tps65219.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 6845f2920f3a..6b8d88ca3e8a 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * GPIO driver for TI TPS65215/TPS65219 PMICs
+ * TI TPS65214/TPS65215/TPS65219 PMIC GPIO Driver
  *
  * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
  */
@@ -156,6 +156,10 @@ static const struct gpio_chip tps65219_template_chip = {
 };
 
 static const struct tps65219_chip_data chip_info_table[] = {
+	[TPS65214] = {
+		.ngpio = 2,
+		.offset = 1,
+	},
 	[TPS65215] = {
 		.ngpio = 2,
 		.offset = 1,
@@ -191,6 +195,7 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps6521x_gpio_id_table[] = {
+	{ "tps65214-gpio", TPS65214 },
 	{ "tps65215-gpio", TPS65215 },
 	{ "tps65219-gpio", TPS65219 },
 	{ }
@@ -207,5 +212,5 @@ static struct platform_driver tps65219_gpio_driver = {
 module_platform_driver(tps65219_gpio_driver);
 
 MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
-MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
+MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 GPIO driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


