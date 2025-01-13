Return-Path: <linux-gpio+bounces-14740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02995A0C4F1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 23:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8352116740C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2025 22:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817001FA150;
	Mon, 13 Jan 2025 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ii8AVSor"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A01F9F78;
	Mon, 13 Jan 2025 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808967; cv=none; b=n3LBdZ4kIngr9om0Cs1E4TLy44uFXt6cFSgxzZrM7cEaUA2ub8zyaKuVELn9EmIbuNRy4JxNJauh9tsu9EUd3zajzR4ZGrzOhh7suMfW0+oHNuHkRpr/ztru2YlVkdRuFbjOhAtmMq4YF2iDntj1+Iuu8LDoIymIw9ZmhUWB9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808967; c=relaxed/simple;
	bh=M0Lu9nzsBwZ8zrdo6QtSe3xZr6xQn4q8rTZSoxWH+hA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFWAQ4PGFhGHL/zHOzODsLH1DhteXONOrZzTeQE3FtRIL8iQ/SWPbNcBo0roZd2FZav9p6dIioK1otF2mz9T6KFRnu4XZw1t0qzECRuxFaAkMOiGWOvNUUSdT1xtkdzPxJKTbud8t9qLUEvFHdpzOFvD2YRDiB5fFTPqsLEGqDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ii8AVSor; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtU9X3881631
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:55:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736808930;
	bh=kL/SJcfgV3QjRqYYg0mlBQ5Mo829P8bsgPsREmi4k9w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ii8AVSor2rbGpSFuxUBpcH5ShqnjhS1eMZEXruWi1Ikpj4wjweYRtLg8AmL7v9I4w
	 fZk38LgMLVHRbbmyk7DIorz2Ts+S9FLP9NucP781gOBRikCXC5bnU2R3b1IyHi2LXW
	 MvzLbHxt52IJVZ2+XjBHTx6IM5wxzI77nK1PzdCY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DMtUdK003265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 16:55:30 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 16:55:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 16:55:30 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DMtU56047817;
	Mon, 13 Jan 2025 16:55:30 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 2/3] gpio: tps65215: Update GPIO0_IDX macro prefix
Date: Mon, 13 Jan 2025 16:55:29 -0600
Message-ID: <20250113225530.124213-3-s-ramamoorthy@ti.com>
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

Updating the macro name to TPS6521X_GPIO0_IDX is meant to indicate this
macro applies to both PMIC devices.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tps65219.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 7e03be0c7c92..70a4410c473a 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -14,7 +14,7 @@
 
 #define TPS65219_GPIO0_DIR_MASK		BIT(3)
 #define TPS65219_GPIO0_OFFSET		2
-#define TPS65219_GPIO0_IDX		0
+#define TPS6521X_GPIO0_IDX			0
 
 struct tps65219_gpio {
 	struct gpio_chip gpio_chip;
@@ -26,7 +26,7 @@ static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
 	int ret, val;
 
-	if (offset != TPS65219_GPIO0_IDX)
+	if (offset != TPS6521X_GPIO0_IDX)
 		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG, &val);
@@ -42,7 +42,7 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	struct device *dev = gpio->tps->dev;
 	int ret, val;
 
-	if (offset != TPS65219_GPIO0_IDX) {
+	if (offset != TPS6521X_GPIO0_IDX) {
 		dev_err(dev, "GPIO%d is output only, cannot get\n", offset);
 		return -ENOTSUPP;
 	}
@@ -71,7 +71,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
 	struct device *dev = gpio->tps->dev;
 	int v, mask, bit;
 
-	bit = (offset == TPS65219_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
+	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
 
 	mask = BIT(bit);
 	v = value ? mask : 0;
@@ -117,7 +117,7 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
 	struct device *dev = gpio->tps->dev;
 
-	if (offset != TPS65219_GPIO0_IDX) {
+	if (offset != TPS6521X_GPIO0_IDX) {
 		dev_err(dev, "GPIO%d is output only, cannot change to input\n", offset);
 		return -ENOTSUPP;
 	}
@@ -131,7 +131,7 @@ static int tps65219_gpio_direction_input(struct gpio_chip *gc, unsigned int offs
 static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	tps65219_gpio_set(gc, offset, value);
-	if (offset != TPS65219_GPIO0_IDX)
+	if (offset != TPS6521X_GPIO0_IDX)
 		return 0;
 
 	if (tps65219_gpio_get_direction(gc, offset) == GPIO_LINE_DIRECTION_OUT)
-- 
2.43.0


