Return-Path: <linux-gpio+bounces-12663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED6A9C026F
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 11:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142AB282B9A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 10:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F351EF08E;
	Thu,  7 Nov 2024 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuDRDKvC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ACD1EE033;
	Thu,  7 Nov 2024 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975629; cv=none; b=LIj0m+aHcWPfEoNofUXgz9qJiJruA/EhSgrM14vQb9QVb2zPSVDVa8Bnt9QRFQ3zEJ31YFDexA9XFIl/6Ri44tJ73zsnRkQ0e0WvrQqR0qZ426UxxPckqYUMQHUNIX3yGpBtu20t0hi/G5mreEL369A/ZGtoRl0iQpb1NL68DFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975629; c=relaxed/simple;
	bh=reqcU4aNdM/6ZnNhA3jLzmtcHP4bWr97Wp5+bu3JRsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmlov+ICiHT/pI0qV2GIM4Il0ZYO9JFWGfNxDrJM7l1u86DKJUKH89kDYX/eyaIh/Q6NX7jG895DIh9YJWz3tYPWQN6S5WLD9vEGBBQcBnPVJroGnI9IkBn2ACc5yQvf2hB7RVhnh6Mzov+bb2yj0jVCntzOsNOZnz64CCaDzF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuDRDKvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12D1C4CECC;
	Thu,  7 Nov 2024 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730975629;
	bh=reqcU4aNdM/6ZnNhA3jLzmtcHP4bWr97Wp5+bu3JRsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AuDRDKvCAO7REuvLzgAgdC9fLaziDChKxRLC1X+GymWQgRXP1cg6uZmoH/bP2oke3
	 H15769YzdiNvWcYSxJN2a9cnTDiLUfHXuRRsTMw9Oz0uH2MI87yeeeHgdq2k05tuGK
	 3DIUYa0yXq4CNoLnLheExA16NmyHNbKqKVP2LBYo+OXIdm7XxrALE4I/gydnWFgosv
	 ajvgkdQbXpKrOI8G76EZAArCAgVg1FL8ro0yM7SK2XwWE/Q37SYMWkA/6zl9jcg2+Z
	 /q20tgIRB0KselE46yxJITOnnSBxbqr1Wn/YhKb71r8FLamwc9ilB7WIod9Om5TpnW
	 LmY9mWginf/uQ==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] gpio: mpfs: add CoreGPIO support
Date: Thu,  7 Nov 2024 10:33:40 +0000
Message-ID: <20241107-coroner-amino-5e32e3e59ced@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107-avatar-clapper-93eb34ad0e0c@spud>
References: <20241107-avatar-clapper-93eb34ad0e0c@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3746; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=z5H4J8oVRYjVIRsfHeXdKOdKxkc1/DpYI+GAd5yexjg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOk605s/vFh4Y3VRvZfXxyrhz7HLFkVuSOf7q2BhIzhtV srM2foKHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI2SuG//ntO6sFb6hOXnSL MS/j1Hb+oCzT91kNZQtPBH14ODOj7gwjQ5P1nI7uePYIxayFFo2CzT7nLazmB86QOnuJ//n5f92 hPAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

coreGPIO, which the "hard" core in PolarFire SoC is based on, has
different offsets for inp/outp. Add some match_data handling to account
for the differences.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/gpio/gpio-mpfs.c | 38 +++++++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 3718121eb97a..4aefae05a9fb 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
+#include <linux/of_device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -30,11 +31,20 @@
 #define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
 #define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
 #define MPFS_IRQ_REG			0x80
+
 #define MPFS_INP_REG			0x84
+#define COREGPIO_INP_REG		0x90
 #define MPFS_OUTP_REG			0x88
+#define COREGPIO_OUTP_REG		0xA0
+
+struct mpfs_gpio_reg_offsets {
+	u8 inp;
+	u8 outp;
+};
 
 struct mpfs_gpio_chip {
 	struct regmap *regs;
+	const struct mpfs_gpio_reg_offsets *offsets;
 	struct gpio_chip gc;
 };
 
@@ -60,7 +70,7 @@ static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_in
 
 	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
 			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
-	regmap_update_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index),
+	regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index),
 			   value << gpio_index);
 
 	return 0;
@@ -84,9 +94,9 @@ static int mpfs_gpio_get(struct gpio_chip *gc, unsigned int gpio_index)
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
 
 	if (mpfs_gpio_get_direction(gc, gpio_index) == GPIO_LINE_DIRECTION_OUT)
-		return regmap_test_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index));
+		return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index));
 	else
-		return regmap_test_bits(mpfs_gpio->regs, MPFS_INP_REG, BIT(gpio_index));
+		return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->offsets->inp, BIT(gpio_index));
 }
 
 static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
@@ -95,7 +105,7 @@ static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int val
 
 	mpfs_gpio_get(gc, gpio_index);
 
-	regmap_update_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index),
+	regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index),
 			   value << gpio_index);
 
 	mpfs_gpio_get(gc, gpio_index);
@@ -113,6 +123,8 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	if (!mpfs_gpio)
 		return -ENOMEM;
 
+	mpfs_gpio->offsets = of_device_get_match_data(&pdev->dev);
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return dev_err_probe(dev, PTR_ERR(base), "failed to ioremap memory resource\n");
@@ -145,8 +157,24 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &mpfs_gpio->gc, mpfs_gpio);
 }
 
+static const struct mpfs_gpio_reg_offsets mpfs_reg_offsets = {
+	.inp = MPFS_INP_REG,
+	.outp = MPFS_OUTP_REG,
+};
+
+static const struct mpfs_gpio_reg_offsets coregpio_reg_offsets = {
+	.inp = COREGPIO_INP_REG,
+	.outp = COREGPIO_OUTP_REG,
+};
+
 static const struct of_device_id mpfs_gpio_of_ids[] = {
-	{ .compatible = "microchip,mpfs-gpio", },
+	{
+		.compatible = "microchip,mpfs-gpio",
+		.data = &mpfs_reg_offsets,
+	}, {
+		.compatible = "microchip,coregpio-rtl-v3",
+		.data = &coregpio_reg_offsets,
+	},
 	{ /* end of list */ }
 };
 
-- 
2.45.2


