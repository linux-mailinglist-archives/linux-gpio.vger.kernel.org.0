Return-Path: <linux-gpio+bounces-23216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFCB04044
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 15:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB45A3A420E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 13:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F67246BC7;
	Mon, 14 Jul 2025 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="R6+4lpqc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696B23AB8E;
	Mon, 14 Jul 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500261; cv=none; b=HSqPgopFv1zzZDJODRFBrb50N/b2POkgYb7n2fKk2yJWppNLt2rJJ8blOChE7RM+j5aGOGIwvgnIxIH6w5TRmKa1IGXp6k8uevDAFkxJbou2jWXJXa83O6zpdhrZo4npQSwbcEqw60yDHqvbgVgp+nDnFT23npCDv97soDniYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500261; c=relaxed/simple;
	bh=ucZkSpFfXMCWM+n/ckXWhndxhkQPKbM9AwH9fq36q2g=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=LWfBqDVYfQeVML1D0CSxHAJ7Wq02yEUv4GZCt+Sfpu3JxR5L0U2U4hewd2hs92kD8sxSoxa4gm/0uuni9pqiUVvBfY1X0lI156Wk80jiKkZgfmldzeJAZ1FU2otwAztwgEXWyPVaKqROeP+7jbNu+HASLYoQxpD3Ym16rZTge8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=R6+4lpqc; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=aHNAeOZ/dbZ3uZvDxMF1/QUUJWuRA5K3D1Shf8AvzvE=; b=R6+4lpqcsFLsNZ2KVoHe2koGyT
	UGgVMhR684enW3Y6Fomi5kagG1Ei7D+XghphqGJVuEUtBYT2ye0PaU5PQiYk6P1nTnBvSOWoQuFNP
	XD0i67nXDupNI/+NOgCcn8c24hQkHOUkvvAFxZ7Zv3YPJLqrCbLLerfY93/Uigna+qw0=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:45674 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1ubJNB-0002WY-Em; Mon, 14 Jul 2025 09:37:37 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 14 Jul 2025 09:37:30 -0400
Message-Id: <20250714133730.6353-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH v2] gpio: pca953x: use regmap_update_bits() to improve efficiency
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Using regmap_update_bits() allows to reduce the number of I2C transfers
when updating bits that haven't changed on non-volatile registers.

For example on a PCAL6416, when changing a GPIO direction from input to
output, the number of I2C transfers can be reduced from 4 to just 1 if
the pull resistors configuration hasn't changed and the output value
is the same as before.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
V1 -> V2: rebase on gpio/for-next
---
 drivers/gpio/gpio-pca953x.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f5184860bd89f..169877e59da9d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -611,9 +611,9 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 	guard(mutex)(&chip->i2c_lock);
 
 	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
-		return regmap_write_bits(chip->regmap, dirreg, bit, 0);
+		return regmap_update_bits(chip->regmap, dirreg, bit, 0);
 
-	return regmap_write_bits(chip->regmap, dirreg, bit, bit);
+	return regmap_update_bits(chip->regmap, dirreg, bit, bit);
 }
 
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
@@ -628,7 +628,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	guard(mutex)(&chip->i2c_lock);
 
 	/* set output level */
-	ret = regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
+	ret = regmap_update_bits(chip->regmap, outreg, bit, val ? bit : 0);
 	if (ret)
 		return ret;
 
@@ -637,9 +637,9 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	 * (in/out logic is inverted on TCA6418)
 	 */
 	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
-		return regmap_write_bits(chip->regmap, dirreg, bit, bit);
+		return regmap_update_bits(chip->regmap, dirreg, bit, bit);
 
-	return regmap_write_bits(chip->regmap, dirreg, bit, 0);
+	return regmap_update_bits(chip->regmap, dirreg, bit, 0);
 }
 
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
@@ -667,7 +667,7 @@ static int pca953x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
 
 	guard(mutex)(&chip->i2c_lock);
 
-	return regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
+	return regmap_update_bits(chip->regmap, outreg, bit, val ? bit : 0);
 }
 
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
@@ -751,9 +751,9 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 
 	/* Configure pull-up/pull-down */
 	if (param == PIN_CONFIG_BIAS_PULL_UP)
-		ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, bit);
+		ret = regmap_update_bits(chip->regmap, pull_sel_reg, bit, bit);
 	else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
-		ret = regmap_write_bits(chip->regmap, pull_sel_reg, bit, 0);
+		ret = regmap_update_bits(chip->regmap, pull_sel_reg, bit, 0);
 	else
 		ret = 0;
 	if (ret)
@@ -761,9 +761,9 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 
 	/* Disable/Enable pull-up/pull-down */
 	if (param == PIN_CONFIG_BIAS_DISABLE)
-		return regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
+		return regmap_update_bits(chip->regmap, pull_en_reg, bit, 0);
 	else
-		return regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
+		return regmap_update_bits(chip->regmap, pull_en_reg, bit, bit);
 }
 
 static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,

base-commit: e502df58b5e3767c00e887744b6eff43b7fde3ea
-- 
2.39.5


