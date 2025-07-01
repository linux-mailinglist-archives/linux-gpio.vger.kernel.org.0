Return-Path: <linux-gpio+bounces-22525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E4AEFF6F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 18:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0AAB445841
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C13727EFEF;
	Tue,  1 Jul 2025 16:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDKBV61U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3927EFEE;
	Tue,  1 Jul 2025 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386621; cv=none; b=rQL+r6zZZ1xDZUEjLRhIdnVi4cA6Qvb9Afh+/foYcu4mcf77ylb+YRxv6INGaqwPXx042eT4a0+7kqRRlQC/pwZqq2ZQwzCoITO6zcwjVj18jBilZ3AN2xTQ/MccI/BRLvmJJhwRDVXCShmG/WXzNynfKwwpT3/n0oy5WYfcXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386621; c=relaxed/simple;
	bh=ZYFvov32w/RwwkOl2V2//fwxVqEHW1aTyCc5DkqCW7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzG376NPuB7T+XfVg1Ni2/9qjI/l9K/k/D51Ny4kPKdT1x8illjRBzXAKb3mOG/OVEQPD/kX9+/dC61C0b+bKuPe3RvP/eJvWuoeCMpsObJMLYcGXm9GMAnpfp0m6sefostpablE9BczU/wXoPLLlE9u3HpBJC3DELqpzkNENIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDKBV61U; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-addda47ebeaso1232378566b.1;
        Tue, 01 Jul 2025 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751386617; x=1751991417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w844XWi/oRXxr4+VYqmlGsqI1yB3nb2NUKPWI+uJdA=;
        b=IDKBV61U9b2zFP/cWf1gEGN28bHnUh1hpZho/3Fu5M5yjlhujhl81LUFjh9lBZK+Sg
         sKz6nCyla53l/ningeVqk30chiu4ObmVdPnYtzJZ9UILhSbw+iQcm6hl2KtCELUwPo8e
         0sywBLQ4WIDqLvfLA/BeLHFZWtS3M45fcvGNXO0XdcdR6iYQVx+4UVaYFIs1DlGnmdnu
         O4ZML+JizVHkZzfdo4azlbDHWCHvYbFqtyPkpPKD9jrEstufbRQA7Ery2Nx8GcH6xG06
         ttI+D7a8zqfAEruiAYpCKH/z5D/XyfElmnVPb7VXyNVBWCzDrHxND2pIqnpx1N7zgu8E
         klVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386617; x=1751991417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1w844XWi/oRXxr4+VYqmlGsqI1yB3nb2NUKPWI+uJdA=;
        b=gBVx0HE0Dk1NSPux7zfFynAkF9Al/4RJ4lCQY1qNdp41qM+6hlySqX8/J/rQ+Xg3Vx
         d50UFqqB+97eQV5EnDdZoBMy2eUL31RSbT1fxy9Zjwq8sNvWffJYler4/9pg8QGTYnEQ
         qjr1R17JHeAuulLLYjelhK0oT5VfdNZBnydLYJzNDI+RSXcjpCl8svTe1AbY0sqM+eJt
         QoVpqy+OW3PMYnkB1C/8A4EB4LUcTabkA9cZWHtoYewM4MwylFVwmcGxgb4+KBtj7pKU
         2pZKBl51W4mryuBMUA9kHYZVODEUHsnU1S3+6xxJY5sgboy/0YPwVIdY5t1YOHp8i4/N
         7k+g==
X-Forwarded-Encrypted: i=1; AJvYcCX+R+wXfqxCHKU+0gH42MIaVg1VgAnE0UoDArsr3luvju3m24g4BN4aVD4kWxPvktVxzvuL9qUyyhuFk5p3@vger.kernel.org, AJvYcCXMYune0Q74jZhzpSR0XJT1hzJvLmcAVTiTEptPyvyCQ8ds6BCoX+oA9QqfikPcM0AcKgeVjw/4VV4Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGMUwP9TEc7gBH6uYQ5E3iy2MkD5inYKZsaTRdqILSlvMg7uK
	hGG3wBuaEZ+zT+pwHzQmLUwoi7veF1U0qEj2v1zIv3QUIdb5CdRluFhT6DKEMHat05g=
X-Gm-Gg: ASbGncsVoDAMxfsiVSEdh7pB1R0Lk4hzYTMF30teS7u/LdFFobbVNa1M+pilV3YzF6y
	rE3sMlN0SXQiarBOtcVHBxuOOSRL867oL4nmiYBKLl+ebHYNNp2qcT+l4lz4xHE7LznRtEVY0W7
	/C69lmzcxGwg3RHzedCjHuqfyA7dKB1progNheVq9FWoLGSlgl2P6JkvI3/2/ihsrKZDGCksKC4
	LciFm64t41FmaEaCsnf1fqKv/3KkAVZf28UPGfzM4lnzlrYfFPmkYzAjd5w7E3EAtcjj4GdbaH+
	QBCxp2yTvTyP1WBRbTSh/ZdmgKFp5pPtQREUDzBa73BwcvI6XMGp5cx0nxav4CBKiidmW8C/p0r
	faiBOe0jsPSh1JZpmFg==
X-Google-Smtp-Source: AGHT+IHvN4NV+G2sLQ2OZezFnQXE31RVIVD2xNtadZHpGjR23dxSt/+BpQU7M/yG29v1GudfpzGRPw==
X-Received: by 2002:a17:907:d16:b0:ae0:c6e5:9738 with SMTP id a640c23a62f3a-ae3501fc1edmr1808461566b.55.1751386615587;
        Tue, 01 Jul 2025 09:16:55 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1cc9sm885869366b.168.2025.07.01.09.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:16:55 -0700 (PDT)
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
Subject: [PATCH v3 2/2] gpio: pca953x: Add support for TI TCA6418
Date: Tue,  1 Jul 2025 18:16:29 +0200
Message-ID: <20250701161629.9782-3-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701161629.9782-1-mariagarcia7293@gmail.com>
References: <20250701161629.9782-1-mariagarcia7293@gmail.com>
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
 drivers/gpio/gpio-pca953x.c | 139 +++++++++++++++++++++++++++++++-----
 1 file changed, 120 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e80a96f39788..7d77d43ef314 100644
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
@@ -237,6 +250,20 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
 	return fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
 }
 
+/* Helper function to get the correct bit mask for a given offset and chip type.
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
+	return BIT(bit_pos_in_bank);
+}
+
 #define PCA953x_BANK_INPUT	BIT(0)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
@@ -353,18 +380,41 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
 	return true;
 }
 
+/* TCA6418 breaks the PCA953x register order rule */
+static bool tca6418_check_register(struct pca953x_chip *chip, unsigned int reg,
+				   u32 access_type_mask)
+{
+	/*  Valid Input Registers - BIT(0) for readable access */
+	if (reg >= TCA6418_INPUT && reg < (TCA6418_INPUT + NBANK(chip)))
+		return (access_type_mask & BIT(0));
+	/*  Valid Output Registers - BIT(1) for writeable access */
+	if (reg >= TCA6418_OUTPUT && reg < (TCA6418_OUTPUT + NBANK(chip)))
+		return (access_type_mask & (BIT(0) | BIT(1)));
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
@@ -381,12 +431,18 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
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
@@ -401,10 +457,17 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
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
@@ -489,6 +552,16 @@ static u8 pcal6534_recalc_addr(struct pca953x_chip *chip, int reg, int off)
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
@@ -529,10 +602,12 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 
 	guard(mutex)(&chip->i2c_lock);
 
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return regmap_write_bits(chip->regmap, dirreg, bit, 0);
 	return regmap_write_bits(chip->regmap, dirreg, bit, bit);
 }
 
@@ -542,7 +617,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
 	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	int ret;
 
 	guard(mutex)(&chip->i2c_lock);
@@ -552,7 +627,11 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	/* then direction */
+	/* then direction
+	 * (in/out logic is inverted on TCA6418)
+	 */
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return regmap_write_bits(chip->regmap, dirreg, bit, bit);
 	return regmap_write_bits(chip->regmap, dirreg, bit, 0);
 }
 
@@ -560,7 +639,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 inreg = chip->recalc_addr(chip, chip->regs->input, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	u32 reg_val;
 	int ret;
 
@@ -577,7 +656,7 @@ static int pca953x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 
 	guard(mutex)(&chip->i2c_lock);
 
@@ -588,7 +667,7 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	u32 reg_val;
 	int ret;
 
@@ -597,9 +676,14 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	if (ret < 0)
 		return ret;
 
-	if (reg_val & bit)
+	/* (in/out logic is inverted on TCA6418) */
+	if (reg_val & bit) {
+		if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+			return GPIO_LINE_DIRECTION_OUT;
+		return GPIO_LINE_DIRECTION_IN;
+	}
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
 		return GPIO_LINE_DIRECTION_IN;
-
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
@@ -1117,12 +1201,22 @@ static int pca953x_probe(struct i2c_client *client)
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
@@ -1154,12 +1248,18 @@ static int pca953x_probe(struct i2c_client *client)
 	/* initialize cached registers from their original values.
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
@@ -1325,6 +1425,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,pca9536", .data = OF_953X( 4, 0), },
 	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "ti,tca6418", .data = (void *)(18 | TCA6418_TYPE | PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
 	{ .compatible = "ti,tca9535", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca9538", .data = OF_953X( 8, PCA_INT), },
-- 
2.43.0


