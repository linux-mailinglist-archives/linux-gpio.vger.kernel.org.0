Return-Path: <linux-gpio+bounces-23035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81EAFF2B5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 22:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FFE0488368
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 20:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42946241131;
	Wed,  9 Jul 2025 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="jnboihQS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E4111A8;
	Wed,  9 Jul 2025 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752091842; cv=none; b=sT4vK65Tr3u0ff0q13G9v86YLSkDIhLUHwxgTcT0KmbTMHQ1DNklYHG4AYFROhBmX7iEwj03atrh62ZY+6wJ9i1w4HE7uibSQa5EXEHRn1tyqkCiCU3P7+KkKVszclzUGnD8d6o45Xz5qyYC81jinR96j1Z/Q5dZJDzaAN3HpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752091842; c=relaxed/simple;
	bh=qcTYazims5gSDPUmF6xT8jmIgdXHc5ZK5SXfnjCDJR0=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=tUAGriw0jVVUcoacBY1pHF9zyYtj0bUfIGVuHImMVa/3VrER0zJ03irjiYGK0VNsk7hCZX7u93Eza7pLEzr02MNfNCKSOmzQHyGMZm0qTyxOSTbnEj8LuyC0jMWkj6X7Nmm7sfKSzIpZnEE0Ns0Xz+9ssVcc8jDoBuaYWKkeQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=jnboihQS; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=/EKBvO1ldjauTDgDlEM7fO2GffzznzTc9JGctpGxNqU=; b=jnboihQS7A+tzowPAQhM0/4rFA
	yKpG1NpyhDvWLnnYNInNtqnVP7EbCR1twuHIbMgtEVTaaSTFh6K5B0e5XDXSFOviz1a7OuXV965aE
	Dm+9sxbudgkxDjSISkmPT96gyxq9B79zAHsvtkA17CqcRHpchd+ftc4QpFchX+Tbak+Q=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:54994 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uZb7e-0006bB-Ew; Wed, 09 Jul 2025 16:10:31 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  9 Jul 2025 16:10:28 -0400
Message-Id: <20250709201028.2175903-1-hugo@hugovil.com>
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
Subject: [PATCH] gpio: pca953x: use regmap_update_bits() to improve efficiency
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
 drivers/gpio/gpio-pca953x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e80a96f397885..34dd5b4a6b299 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -533,7 +533,7 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 
 	guard(mutex)(&chip->i2c_lock);
 
-	return regmap_write_bits(chip->regmap, dirreg, bit, bit);
+	return regmap_update_bits(chip->regmap, dirreg, bit, bit);
 }
 
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
@@ -548,12 +548,12 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	guard(mutex)(&chip->i2c_lock);
 
 	/* set output level */
-	ret = regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
+	ret = regmap_update_bits(chip->regmap, outreg, bit, val ? bit : 0);
 	if (ret)
 		return ret;
 
 	/* then direction */
-	return regmap_write_bits(chip->regmap, dirreg, bit, 0);
+	return regmap_update_bits(chip->regmap, dirreg, bit, 0);
 }
 
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
@@ -581,7 +581,7 @@ static int pca953x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
 
 	guard(mutex)(&chip->i2c_lock);
 
-	return regmap_write_bits(chip->regmap, outreg, bit, val ? bit : 0);
+	return regmap_update_bits(chip->regmap, outreg, bit, val ? bit : 0);
 }
 
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
@@ -658,9 +658,9 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 
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
@@ -668,9 +668,9 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 
 	/* Disable/Enable pull-up/pull-down */
 	if (param == PIN_CONFIG_BIAS_DISABLE)
-		return regmap_write_bits(chip->regmap, pull_en_reg, bit, 0);
+		return regmap_update_bits(chip->regmap, pull_en_reg, bit, 0);
 	else
-		return regmap_write_bits(chip->regmap, pull_en_reg, bit, bit);
+		return regmap_update_bits(chip->regmap, pull_en_reg, bit, bit);
 }
 
 static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,

base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
-- 
2.39.5


