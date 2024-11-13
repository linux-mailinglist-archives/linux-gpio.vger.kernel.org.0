Return-Path: <linux-gpio+bounces-12933-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F89C6E97
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACEDA2852CF
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 12:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655EC200BBA;
	Wed, 13 Nov 2024 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oR9zGZdA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22736200BAE;
	Wed, 13 Nov 2024 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731499282; cv=none; b=ZTq13ZFXTF/yv4OBxBaGS6QcBFWgfNFMcyeGqqxdN1M850NnGhVRFEDHQHdYPIU9ASzB9mnR8JgtzV92j0xYICMCOFubyg3wcy0u+gagu1YW6jwe44lDUzF8w0WsLf9c4paYGpqVdd8z9HT6H2OV7kuVA+4YIxvYVDlKJTNfZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731499282; c=relaxed/simple;
	bh=ORisRMuk1T0WqUFbKLRVSva2kgNKPqcIzImCJfmPcHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8fuM/c2lxtPx0ZFdTfVaKSGdPrdYuMswc/jAIBTwlAjAeIu+RoBaU/1gcjkeSADNImEK361ESS6hCF4Uek3FyOn5BGTMdpKdHJkxfeLIx0x296wQU+zQnR5YYJrQw1Viyibiy95OqBbuIn83Yfuo33QV6RPEzviFWBXLaliETk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oR9zGZdA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC52C4CECF;
	Wed, 13 Nov 2024 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731499280;
	bh=ORisRMuk1T0WqUFbKLRVSva2kgNKPqcIzImCJfmPcHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oR9zGZdAsJvT5LkiPR4zsUKxMblWwDftv7xsaEcizireUrj12/KgjLoVQQu42qBpk
	 Wp+I8rVKa1zfwO5L7Zq19zHpPjffa6boYACVMEqDNqviKY/MkwUxrE3NczQ0RG3BHG
	 dPacMZf3WTA+iZw50QUKouI4I3StWDe6FYiGLpSiNnSbEjwY7nI0eEPOapBZ+HNkq1
	 yh3fai6BdpzTFmW7ri78TORvtmhgD8CpFHysLCCwJTX7QDhM7aZwkmzyJZB7COfdaJ
	 MIYgm5ygIpNo7o9z8I3i1wjHXARHhnTwvP4DhRfhDuPCgGDbRg6XPiU+F8F6DTlyMw
	 zImhnwyCrkjYw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] gpio: mpfs: add CoreGPIO support
Date: Wed, 13 Nov 2024 12:01:04 +0000
Message-ID: <20241113-jovial-atlantic-cd07f05eb2e5@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241113-ramble-blaspheme-b303dbf37271@spud>
References: <20241113-ramble-blaspheme-b303dbf37271@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3715; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=PlBkXtuDea/efkIOtmvOmkz9aissYKKWld/e40312mY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkmU/5vWDMrxmDugbiOYy2LQqUnR4e/c9V95ZT7f0p0T k1UbM3vjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyE04rhf63plnume7PeqlR9 /Xnh7bSF1cwSFWqOJxQM+d6plbRlhDAyfD0x0/mlola4YNonle6TjPk7Vbqm55/n6rtbs4DBUUm RBQA=
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
index 3718121eb97a..561a961c97a6 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 
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
 
+	mpfs_gpio->offsets = device_get_match_data(&pdev->dev);
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


