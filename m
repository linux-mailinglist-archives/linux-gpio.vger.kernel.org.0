Return-Path: <linux-gpio+bounces-12788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B855D9C34A5
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 22:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CBFF282226
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 21:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ED9157A67;
	Sun, 10 Nov 2024 21:01:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06906157493
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 21:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272460; cv=none; b=JPBa4PoWMktya7Zf+m7mGcEWDWHdVlOcOZcHIMRS7ZyyxYLHZYqNjhko/J9FjSIFc/JmtaGO/lLOQgIwozseV2NZ9s3K/LhVSbM4e/vC7tyhfPSRLjTxpkGep6nC4cKetIU3Rd2cL9Qf2/j2UkspbpkLJ0cPc6R7WRJutAbeeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272460; c=relaxed/simple;
	bh=EQt3n3i1KyUDZRw+vpApQXPdDqecwrKAyC+BRjzPnP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0SsQbs11aPCkhz4+y20IyhY/s4lsiv0fs1a3zdAC/Eobwj42LIo0vPxHv6q6PaCb/N5Vc3S62Zs49l0sPC9N2MQvrn04uKeSfBAx50wsqAo4wMDJ1Q1jUt/VMMmiwnzSxnC1JyS5OqFILP5yEDahx37Bco+2PUtytEWIgtyDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id e093f038-9fa6-11ef-8874-005056bdd08f;
	Sun, 10 Nov 2024 23:00:55 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 6/6] pinctrl: cy8c95x0: remove unneeded goto labels
Date: Sun, 10 Nov 2024 22:59:46 +0200
Message-ID: <20241110210040.18918-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110210040.18918-1-andy.shevchenko@gmail.com>
References: <20241110210040.18918-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases the code uses goto labels to just return an error code.
Replace those with direct return:s and drop unneeded goto labels.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 8c611abd4745..0d6c2027d4c1 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -746,14 +746,12 @@ static int cy8c95x0_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 
 	ret = cy8c95x0_regmap_read(chip, CY8C95X0_DIRECTION, port, &reg_val);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	if (reg_val & bit)
 		return GPIO_LINE_DIRECTION_IN;
 
 	return GPIO_LINE_DIRECTION_OUT;
-out:
-	return ret;
 }
 
 static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
@@ -815,8 +813,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	case PIN_CONFIG_SLEEP_HARDWARE_STATE:
 	case PIN_CONFIG_SLEW_RATE:
 	default:
-		ret = -ENOTSUPP;
-		goto out;
+		return -ENOTSUPP;
 	}
 	/*
 	 * Writing 1 to one of the drive mode registers will automatically
@@ -824,7 +821,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	 */
 	ret = cy8c95x0_regmap_read(chip, reg, port, &reg_val);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	if (reg_val & bit)
 		arg = 1;
@@ -832,8 +829,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 		arg = !arg;
 
 	*config = pinconf_to_config_packed(param, (u16)arg);
-out:
-	return ret;
+	return 0;
 }
 
 static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
@@ -845,7 +841,6 @@ static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
 	unsigned long param = pinconf_to_config_param(config);
 	unsigned long arg = pinconf_to_config_argument(config);
 	unsigned int reg;
-	int ret;
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_UP:
@@ -876,22 +871,17 @@ static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
 		reg = CY8C95X0_PWMSEL;
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
-		ret = cy8c95x0_pinmux_direction(chip, off, !arg);
-		goto out;
+		return cy8c95x0_pinmux_direction(chip, off, !arg);
 	case PIN_CONFIG_INPUT_ENABLE:
-		ret = cy8c95x0_pinmux_direction(chip, off, arg);
-		goto out;
+		return cy8c95x0_pinmux_direction(chip, off, arg);
 	default:
-		ret = -ENOTSUPP;
-		goto out;
+		return -ENOTSUPP;
 	}
 	/*
 	 * Writing 1 to one of the drive mode registers will automatically
 	 * clear conflicting set bits in the other drive mode registers.
 	 */
-	ret = cy8c95x0_regmap_write_bits(chip, reg, port, bit, bit);
-out:
-	return ret;
+	return cy8c95x0_regmap_write_bits(chip, reg, port, bit, bit);
 }
 
 static int cy8c95x0_gpio_get_multiple(struct gpio_chip *gc,
-- 
2.47.0


