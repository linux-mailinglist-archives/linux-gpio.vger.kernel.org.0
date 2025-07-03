Return-Path: <linux-gpio+bounces-22764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F4AF825E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8768417E591
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2932BEC3A;
	Thu,  3 Jul 2025 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fzi/B22+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4C2BEC21;
	Thu,  3 Jul 2025 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576294; cv=none; b=VBR3SHV8w1Z5RjHoCuY8DEsJCreKmTTtB4Z8naQdu5FDvRnLcc1fsGvWaaHcjr/y7IE7/xZmu+DP5EgKDFNIOmfq8hoce+w88o9BLpz+iRm+j6MJb+fY2/cx17F2lPzkmw2XHcH60JIVb4TIzZiSuDPTwEefw+bqb3nsYlHZt+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576294; c=relaxed/simple;
	bh=ljqK7ZSinwdj3wGb/XbvTD/aeZolJSDY9gLpfwvON0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpeRUX5jQhueP3a1ijQbJ2atuABjLpAqcAc8QvpLrKRUreHncajvQ9b4g1qEKeW30yTv8JrMprYc87IwURthN1PW1yN7CUmGt933LQ9UtvWciee3ou8x+d8dSiZLLpRzRxXKfwumbC+oIS4miyK3gz5nBI3TdT+LmHFKKu2w2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fzi/B22+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso298826966b.0;
        Thu, 03 Jul 2025 13:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751576290; x=1752181090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBl8dQczHAXEhEM0gV05tmYGqc2dxbZmQ+ZuwlIemCU=;
        b=Fzi/B22+DR3NE2F1XskrNjUY6xp0kErfyYbVgHSovu4dE+0e5Wp/bDMdv0MHWXC6Cc
         Rs1VwWtZm1W0+qOs/cqMwPgvMOwU+1bY9KzbYrrJXsmqTTbaA25q1YMXD0drCTV0MngX
         bkLjOFL3rVJCMZvpbag92yVKX/AxdNQZjIQ3ZGcQUwttvFtx15Xkfxkwdo02omOSMaQY
         IhWTb8nr1SxHbDge1AZs5tSXHLWH1i6wX9r1QaAY3383XN23Rybf3a4Wwrb9hh36aPtb
         XMbCoxrL6zVJjvIGeYp6GnAUwGkAIgLPBw0R/54/p1dm8LNCluTZ30CBa0Oa6Tl36K41
         rWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751576290; x=1752181090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBl8dQczHAXEhEM0gV05tmYGqc2dxbZmQ+ZuwlIemCU=;
        b=sokj0emX+LMZaD8fP2azYU+G37I5bCwWavY+DUhOhGA36/qVj6v11RISQ/QmD87ZfR
         g1h5GJL3rOjL3dE0JSMNtkTmeCLrIpQJazKOza/s7YHAsNZUjDVEmdavp7LCh9Z0OSgD
         rKMJRVZfOyN3rAFPFkUy9IT/4eL+M2B9XbyfYxnwwkI07qthccMg2xTeFrvQminwU/Z5
         YbRF/Ct57N5EoGop1zKhkjIRv1QDm2OfQlarUNA7/r4XvXKvzP1kn+ywqDDkV4qaRqiX
         9yUUpM0cA5cW9GYcBfRyyXLfqaKmgN8+4xp5DiZ22rWhRJ/FNUlfFrqYZBiOWUSPIQhR
         gnDA==
X-Forwarded-Encrypted: i=1; AJvYcCUC5TE/t+H6fr0zF8Gsv2OgLPNTNw8UPiPfJWXc7wvxCOiEkYLgF3egq9ImWCykm5d1GpShEEf8wWd0@vger.kernel.org, AJvYcCWVKd+y25no3nhLtWXhImQn7k/kfRF/UFqjiJbSwF5oXq/kbVh84XYcuu96RqgAdSmkxkRuBDhpCsOYsXxj@vger.kernel.org
X-Gm-Message-State: AOJu0YyhWVOhTcJO6xqkcxySj1dKj/Mx3XHFuYS2tMp814R0d0QCJw2p
	x6NEp8vciao4p7r9sKDf2d+g76KPgbsN/i+KDcI7bth9Ey13ZIjqZIXqUk0pwuJaOvg=
X-Gm-Gg: ASbGncvjLUbwuKAHCOUCVfBGcWtrpSh29VLBdSaasW+I3X7btlVJctf6euobVdXMdDX
	IuTnsZw+QEN/8aNOUrv9+jHzePRaVYJcDRwlen8JEoUCTNyKsiCJW3imNBMuSdpKI9PDId9CM4O
	3/BAaU5FfwDgVmox13jrYIw8Ewr9cFawHZ+46WKdktan4RLIgSqlVxe6zMly32aJMj+fMtWXtSX
	ytA0PUGdZYsfsk5tq5KWUCnrEMhH1GeRGBt4m3Hq1jcxxrCH0At/MbMp/7AgrNlYASyjpTZZv9y
	9MMQ/4jNLNBWxvs5yN5W0x3BjIuQodQ2GkiXbWGXfvneFcv6zte6SpvRAZZml7+Kzmvmbazt19Q
	YL8tD2q/nRfkJeKT41H5kTw3zZoeE
X-Google-Smtp-Source: AGHT+IHH8akoCM0HxEWjNOLH+Y13IPfIkT1lnFFch0nvpFBf3R9eFnP7PvP3T7bTb4ZkkYDOjqkbTw==
X-Received: by 2002:a17:906:c14e:b0:ae3:d0fe:a35e with SMTP id a640c23a62f3a-ae3f9c06608mr39671266b.11.1751576289790;
        Thu, 03 Jul 2025 13:58:09 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm38750366b.107.2025.07.03.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 13:58:09 -0700 (PDT)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	Maria Garcia <mgarcia@qblox.com>
Subject: [PATCH v4 2/2] gpio: pca953x: Add support for TI TCA6418
Date: Thu,  3 Jul 2025 22:57:40 +0200
Message-ID: <20250703205740.45385-3-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703205740.45385-1-mariagarcia7293@gmail.com>
References: <20250703205740.45385-1-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TI TCA6418 is a 18-channel I2C I/O expander. It is slightly
different to other models from the same family, such as TCA6416,
but has enough in common with them to make it work with just a
few tweaks, which are explained in the code's documentation.

Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
---
 drivers/gpio/gpio-pca953x.c | 153 +++++++++++++++++++++++++++++++-----
 1 file changed, 133 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e80a96f39788..5d40bf9b941d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -38,6 +38,10 @@
 #define PCA953X_INVERT		0x02
 #define PCA953X_DIRECTION	0x03
 
+#define TCA6418_INPUT		0x14
+#define TCA6418_OUTPUT		0x17
+#define TCA6418_DIRECTION	0x23
+
 #define REG_ADDR_MASK		GENMASK(5, 0)
 #define REG_ADDR_EXT		BIT(6)
 #define REG_ADDR_AI		BIT(7)
@@ -76,7 +80,8 @@
 #define PCA953X_TYPE		BIT(12)
 #define PCA957X_TYPE		BIT(13)
 #define PCAL653X_TYPE		BIT(14)
-#define PCA_TYPE_MASK		GENMASK(15, 12)
+#define TCA6418_TYPE		BIT(16)
+#define PCA_TYPE_MASK		GENMASK(16, 12)
 
 #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)
 
@@ -115,6 +120,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pca6107", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
+	{ "tca6418", 18 | TCA6418_TYPE | PCA_INT, },
 	{ "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
 	{ "tca9538", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
@@ -204,6 +210,13 @@ static const struct pca953x_reg_config pca957x_regs = {
 	.invert = PCA957X_INVRT,
 };
 
+static const struct pca953x_reg_config tca6418_regs = {
+	.direction = TCA6418_DIRECTION,
+	.output = TCA6418_OUTPUT,
+	.input = TCA6418_INPUT,
+	.invert = 0xFF, /* Does not apply */
+};
+
 struct pca953x_chip {
 	unsigned gpio_start;
 	struct mutex i2c_lock;
@@ -237,6 +250,22 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
+/*
+ * Helper function to get the correct bit mask for a given offset and chip type.
+ * The TCA6418's input, output, and direction banks have a peculiar bit order:
+ * the first byte uses reversed bit order, while the second byte uses standard order.
+ */
+static inline u8 pca953x_get_bit_mask(struct pca953x_chip *chip, unsigned int offset)
+{
+	unsigned int bit_pos_in_bank = offset % BANK_SZ;
+	int msb = BANK_SZ - 1;
+
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE && offset <= msb)
+		return BIT(msb - bit_pos_in_bank);
+
+	return BIT(bit_pos_in_bank);
+}
+
 #define PCA953x_BANK_INPUT	BIT(0)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
@@ -353,18 +382,43 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
 	return true;
 }
 
+/* TCA6418 breaks the PCA953x register order rule */
+static bool tca6418_check_register(struct pca953x_chip *chip, unsigned int reg,
+				   u32 access_type_mask)
+{
+	/*  Valid Input Registers - BIT(0) for readable access */
+	if (reg >= TCA6418_INPUT && reg < (TCA6418_INPUT + NBANK(chip)))
+		return (access_type_mask & BIT(0));
+
+	/*  Valid Output Registers - BIT(1) for writeable access */
+	if (reg >= TCA6418_OUTPUT && reg < (TCA6418_OUTPUT + NBANK(chip)))
+		return (access_type_mask & (BIT(0) | BIT(1)));
+
+	/*  Valid Direction Registers - BIT(2) for volatile access */
+	if (reg >= TCA6418_DIRECTION && reg < (TCA6418_DIRECTION + NBANK(chip)))
+		return (access_type_mask & (BIT(0) | BIT(1)));
+
+	return false;
+}
+
 static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA957X_TYPE:
 		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
 		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
 		       PCA957x_BANK_BUSHOLD;
-	} else {
+		break;
+	case TCA6418_TYPE:
+		/* BIT(0) to indicate read access */
+		return tca6418_check_register(chip, reg, BIT(0));
+	default:
 		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
 		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
+		break;
 	}
 
 	if (chip->driver_data & PCA_PCAL) {
@@ -381,12 +435,18 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA957X_TYPE:
 		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
 			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
-	} else {
+		break;
+	case TCA6418_TYPE:
+		/* BIT(1) for write access */
+		return tca6418_check_register(chip, reg, BIT(1));
+	default:
 		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
 			PCA953x_BANK_CONFIG;
+		break;
 	}
 
 	if (chip->driver_data & PCA_PCAL)
@@ -401,10 +461,17 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	u32 bank;
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA957X_TYPE:
 		bank = PCA957x_BANK_INPUT;
-	else
+		break;
+	case TCA6418_TYPE:
+		/* BIT(2) for volatile access */
+		return tca6418_check_register(chip, reg, BIT(2));
+	default:
 		bank = PCA953x_BANK_INPUT;
+		break;
+	}
 
 	if (chip->driver_data & PCA_PCAL)
 		bank |= PCAL9xxx_BANK_IRQ_STAT;
@@ -489,6 +556,16 @@ static u8 pcal6534_recalc_addr(struct pca953x_chip *chip, int reg, int off)
 	return pinctrl + addr + (off / BANK_SZ);
 }
 
+static u8 tca6418_recalc_addr(struct pca953x_chip *chip, int reg_base, int offset)
+{
+	/*
+	 * reg_base will be TCA6418_INPUT, TCA6418_OUTPUT, or TCA6418_DIRECTION
+	 * offset is the global GPIO line offset (0-17)
+	 * BANK_SZ is 8 for TCA6418 (8 bits per register bank)
+	 */
+	return reg_base + (offset / BANK_SZ);
+}
+
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
 	u8 regaddr = chip->recalc_addr(chip, reg, 0);
@@ -529,10 +606,13 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 
 	guard(mutex)(&chip->i2c_lock);
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return regmap_write_bits(chip->regmap, dirreg, bit, 0);
+
 	return regmap_write_bits(chip->regmap, dirreg, bit, bit);
 }
 
@@ -542,7 +622,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
 	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	int ret;
 
 	guard(mutex)(&chip->i2c_lock);
@@ -552,7 +632,13 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	/* then direction */
+	/*
+	 * then direction
+	 * (in/out logic is inverted on TCA6418)
+	 */
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return regmap_write_bits(chip->regmap, dirreg, bit, bit);
+
 	return regmap_write_bits(chip->regmap, dirreg, bit, 0);
 }
 
@@ -560,7 +646,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 inreg = chip->recalc_addr(chip, chip->regs->input, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	u32 reg_val;
 	int ret;
 
@@ -577,7 +663,7 @@ static int pca953x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 
 	guard(mutex)(&chip->i2c_lock);
 
@@ -588,7 +674,7 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	u32 reg_val;
 	int ret;
 
@@ -597,7 +683,14 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	if (ret < 0)
 		return ret;
 
-	if (reg_val & bit)
+	/* (in/out logic is inverted on TCA6418) */
+	if (reg_val & bit) {
+		if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+			return GPIO_LINE_DIRECTION_OUT;
+
+		return GPIO_LINE_DIRECTION_IN;
+	}
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
 		return GPIO_LINE_DIRECTION_IN;
 
 	return GPIO_LINE_DIRECTION_OUT;
@@ -1117,12 +1210,22 @@ static int pca953x_probe(struct i2c_client *client)
 		regmap_config = &pca953x_i2c_regmap;
 	}
 
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCAL653X_TYPE) {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCAL653X_TYPE:
 		chip->recalc_addr = pcal6534_recalc_addr;
 		chip->check_reg = pcal6534_check_register;
-	} else {
+		break;
+	case TCA6418_TYPE:
+		chip->recalc_addr = tca6418_recalc_addr;
+		/*
+		 * We don't assign chip->check_reg = tca6418_check_register directly here.
+		 * Instead, the wrappers handle the dispatch based on PCA_CHIP_TYPE.
+		 */
+		break;
+	default:
 		chip->recalc_addr = pca953x_recalc_addr;
 		chip->check_reg = pca953x_check_register;
+		break;
 	}
 
 	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
@@ -1151,15 +1254,22 @@ static int pca953x_probe(struct i2c_client *client)
 	lockdep_set_subclass(&chip->i2c_lock,
 			     i2c_adapter_depth(client->adapter));
 
-	/* initialize cached registers from their original values.
+	/*
+	 * initialize cached registers from their original values.
 	 * we can't share this chip with another i2c master.
 	 */
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	switch (PCA_CHIP_TYPE(chip->driver_data)) {
+	case PCA957X_TYPE:
 		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip);
-	} else {
+		break;
+	case TCA6418_TYPE:
+		chip->regs = &tca6418_regs;
+		break;
+	default:
 		chip->regs = &pca953x_regs;
 		ret = device_pca95xx_init(chip);
+		break;
 	}
 	if (ret)
 		return ret;
@@ -1325,6 +1435,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,pca9536", .data = OF_953X( 4, 0), },
 	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "ti,tca6418", .data = (void *)(18 | TCA6418_TYPE | PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
 	{ .compatible = "ti,tca9535", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca9538", .data = OF_953X( 8, PCA_INT), },
@@ -1355,7 +1466,9 @@ static int __init pca953x_init(void)
 {
 	return i2c_add_driver(&pca953x_driver);
 }
-/* register after i2c postcore initcall and before
+
+/*
+ * register after i2c postcore initcall and before
  * subsys initcalls that may rely on these GPIOs
  */
 subsys_initcall(pca953x_init);
-- 
2.43.0


