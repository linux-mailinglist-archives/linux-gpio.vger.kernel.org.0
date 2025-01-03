Return-Path: <linux-gpio+bounces-14490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CEFA01060
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E9A1884E56
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 22:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6E31C3C03;
	Fri,  3 Jan 2025 22:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L/CVHIsa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E91C07D8;
	Fri,  3 Jan 2025 22:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735944868; cv=none; b=S76AXwGSSgAf+Gv16LG6/nQvVrBxedjikllMyLq11BmpXJWpPlwlfoQ3Iuqb0vT6vp7NAqaYK4yb1/xB4xwcu5vR4N7fq0sSwLk2E2v1i1hudsZhTm9iVBy9kwkwLbqxrvzWtEIiOmbLyo0O4FQFwEKPwYRtsIVeJM4PbXxi6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735944868; c=relaxed/simple;
	bh=eSr5N1hUUfxtSUbzLQ2EFTRIjK+Xij7hHF3aqOdHeaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kptso75pb1+gvqvfwLBx4qnxT9J1XVI1fHvNA2acHSSmVvUr5EJa8yRIw97rH5LKfJjnBep7oV63DG0tmBrrSSSOWJVDZPlDlAHUA9+EwugaNEMTDm9YXsP979oQefqaxvn1rI6+LCj9T1CCccCl+q4HGz+hFJd9YNiGH27K6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L/CVHIsa; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503Ms7WU2092079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 16:54:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735944847;
	bh=f2JPN1Vy9rlWE3OwLirkOuTgKa3hD3fQAWOBoPHOuMY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L/CVHIsasc60bHIPwnckQc2a4FVaAXQM/QiRezmpXgm2jaXjxxotD80t30bIpshd9
	 1rP3v9GykiYQiZwgELnfBnHWOA1W941RC+c/QY7f3nv4KPY69/MCcHlBnHOHwPU7zq
	 QOIwTritocnYggsSrJIxT09Im6byPeT4pKmICT5M=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503Ms7rM006867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 16:54:07 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 16:54:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 16:54:07 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503Ms7AN098981;
	Fri, 3 Jan 2025 16:54:07 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/3] gpio: tps65215: Update GPIO0_IDX macro prefix
Date: Fri, 3 Jan 2025 16:54:06 -0600
Message-ID: <20250103225407.196068-3-s-ramamoorthy@ti.com>
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

Updating the macro name to TPS6521X_GPIO0_IDX is meant to indicate this
macro applies to both PMIC devices.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
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
2.34.1


