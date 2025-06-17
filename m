Return-Path: <linux-gpio+bounces-21712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B24ADDD5D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E0244A0792
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 20:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A08C2F0039;
	Tue, 17 Jun 2025 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rya9WdkJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E362E719C;
	Tue, 17 Jun 2025 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193068; cv=none; b=sT62tk1wSylZIlc3/wHHU9TLBJrrcp+paUoUrqWOAEISewVwVMmn7Sn7UDaEJgO/bpJQ1lPK2v9Ykca4HyM+Jo4i3WYArwmIus6QNqsIU+e2lxegWR/fVZXuKy71+ZvdSyZ48UNKwpvzy+935ptkd2QKVCrwuWo3zAG+ekk7prM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193068; c=relaxed/simple;
	bh=sYAPtFdjuAKuqc4VaQUAZRkxVXkZRxpSMveykkOuu2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSsUeD5QnoIfbnXc4sOywhzlHusl5OM46DZ6nE07/0Qqlvtu2Pf0IsNXuR4m2o6/p/nZ/AWRrmzgKevm20FojPZKI65z0ihed+m2JnHI5gbwR28kkGsBDppidyADubL6L4FM+Kh/W242HzxLnt18J1DgBEvuMBa/5uKdEPvC+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rya9WdkJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad891bb0957so1119147966b.3;
        Tue, 17 Jun 2025 13:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750193064; x=1750797864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/s91vta0kTK6rWLy93aEq22bvH84T445RMN6cvAClg=;
        b=Rya9WdkJVusoyd1VZJN2HIcvrqPYrekQxqAUh6Us2Qh/U2Z3kANL+FgsPgBylhLVmv
         VQ74bEGZMC9AZif13wW442YOsYYPIzG9LKQYJXXfqjv9Am8zbje+S8WrdSvT+7c8wiBa
         Kk+vDtb8Vc/DxX0iheQXKfm9yDwDCuAVFO4udW1jPQbHhVO/6WcRWA5P0d6E3TpQRgWh
         AOFf7f0P5GCp7n3fRYVu7WOoBHnyX4VQpypUZM8GW0PmyaGJy+KWtGS/ZoRvrXxTt12B
         TovTl6kfLvNPozQ+9t35uV0At2EYmQPDfnRGMeNlhDRtaETlCAwV5WTNB26wWwvJDu5U
         piPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193064; x=1750797864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/s91vta0kTK6rWLy93aEq22bvH84T445RMN6cvAClg=;
        b=F8MLxjS24xKr0dvHqgv4wVj3eDZgcJS2eOR8Yyt0PiNa8HTjsDYm9BvF4ynOgB6Vah
         GN4Yo7UWSblKlipkbMLrxxBrSOw4Kj9/zrmTtpxCF+TwG9DU3FbmelksPiAN3tFSZJyP
         C9JO8zFx9T9iGDnMri6xLHC50riGfM6M543wUfnVAai6oklnibOkxhdq2cCB1DT/RZkz
         cU+W7dqKrrwz2isMzC8mVb2KfXSScV7/VAHJEhIe4cDzTIfFK8i33uxMySZeg+NWJfuh
         XD2xDT9PBznw7KClNrDUdZpTdPJkchiRBEBjL62oIOE6KNZFtjz0jijLvYgbfYveh7dQ
         hcig==
X-Forwarded-Encrypted: i=1; AJvYcCU1FnQGklTJYCBVz/EKWWYyihe9MGcDhP4fTr0OYv6Fth2paHASA/O0rl4TBt/w/DmJYlqqv19S2+FSdsfV@vger.kernel.org, AJvYcCXVJOCqKO5Hw3JY/ZeowiKavt70oCWGXQfgeak46DkZT/xCzZ6v416Rvof9EfUHXEj7e90QYKj8OwvH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5A/n05qmBsEMMlN+Ko+oqjmI4BnrbqAOEpT7+BlSGbn6iugqI
	IA2sgcpa8j88DnTT8/uc0C3ozNFG6ec/Q4eDXRHUggnK6PZvudWd/vx2JSOjOOPz
X-Gm-Gg: ASbGncv/C7sAlbaW6BAj+K/w3I60vglxV0fpvrXc0Pfz1dNH8Fvbx2urowAfDBJycoC
	g4rlIqzHS2taPrlO6nC93zRnl8030otNTyzRNjov86wrp4dLikdbgQRUlOzuyrPYvbzEPGvB0pO
	4yZZ77b9z63UYIswGYpNXIfMykSBw9albg2LeY2IkRNHQhieZ5OyeNpHoJWDi+uJY3vhjW4LB7K
	/IFV0POHAkqLVRM4OBLclGbWC2LbxWYf69egAZUx6QH4vvexL7M8Q/e0Z9+GhvMfqjp6ckWbM3q
	IBrUmB9b1Rr7g7KiNlSjwqhaoBDFGR5WvVqT5zhROarCXPHx9b7MuOlvhizlC3YkxLD7UoyoGwA
	7i8sTkPstfmy81hjSlg==
X-Google-Smtp-Source: AGHT+IFryB0VdhlPgLLGynIH5UA3tZCvFiYsh4cl4Jv6FEPDS+gQH8Md0j7T+kKXOywqb55lcAdqjA==
X-Received: by 2002:a17:907:72c9:b0:ad8:8529:4f83 with SMTP id a640c23a62f3a-adfad449c2bmr1278227666b.39.1750193064457;
        Tue, 17 Jun 2025 13:44:24 -0700 (PDT)
Received: from maria-HP-Pavilion-Laptop.home ([178.226.54.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec7b8fe73sm911857866b.0.2025.06.17.13.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:44:24 -0700 (PDT)
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
Subject: [PATCH 2/2] gpio: pca953x: Add support for TI TCA6418
Date: Tue, 17 Jun 2025 22:44:02 +0200
Message-ID: <20250617204402.33656-3-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617204402.33656-1-mariagarcia7293@gmail.com>
References: <20250617204402.33656-1-mariagarcia7293@gmail.com>
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
 drivers/gpio/gpio-pca953x.c | 110 ++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b852e4997629..9fe28d7ba667 100644
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
@@ -237,6 +250,21 @@ static int pca953x_bank_shift(struct pca953x_chip *chip)
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
+	else
+		return BIT(bit_pos_in_bank);
+}
+
 #define PCA953x_BANK_INPUT	BIT(0)
 #define PCA953x_BANK_OUTPUT	BIT(1)
 #define PCA953x_BANK_POLARITY	BIT(2)
@@ -353,6 +381,23 @@ static bool pcal6534_check_register(struct pca953x_chip *chip, unsigned int reg,
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
@@ -362,6 +407,9 @@ static bool pca953x_readable_register(struct device *dev, unsigned int reg)
 		bank = PCA957x_BANK_INPUT | PCA957x_BANK_OUTPUT |
 		       PCA957x_BANK_POLARITY | PCA957x_BANK_CONFIG |
 		       PCA957x_BANK_BUSHOLD;
+	} else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		/* BIT(0) to indicate read access */
+		return tca6418_check_register(chip, reg, BIT(0));
 	} else {
 		bank = PCA953x_BANK_INPUT | PCA953x_BANK_OUTPUT |
 		       PCA953x_BANK_POLARITY | PCA953x_BANK_CONFIG;
@@ -384,6 +432,9 @@ static bool pca953x_writeable_register(struct device *dev, unsigned int reg)
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
 		bank = PCA957x_BANK_OUTPUT | PCA957x_BANK_POLARITY |
 			PCA957x_BANK_CONFIG | PCA957x_BANK_BUSHOLD;
+	} else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		/* BIT(1) for write access */
+		return tca6418_check_register(chip, reg, BIT(1));
 	} else {
 		bank = PCA953x_BANK_OUTPUT | PCA953x_BANK_POLARITY |
 			PCA953x_BANK_CONFIG;
@@ -403,6 +454,9 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
 		bank = PCA957x_BANK_INPUT;
+	else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		/* BIT(2) for volatile access */
+		return tca6418_check_register(chip, reg, BIT(2));
 	else
 		bank = PCA953x_BANK_INPUT;
 
@@ -489,6 +543,15 @@ static u8 pcal6534_recalc_addr(struct pca953x_chip *chip, int reg, int off)
 	return pinctrl + addr + (off / BANK_SZ);
 }
 
+static u8 tca6418_recalc_addr(struct pca953x_chip *chip, int reg_base, int offset)
+{
+	/* reg_base will be TCA6418_INPUT, TCA6418_OUTPUT, or TCA6418_DIRECTION
+	 * offset is the global GPIO line offset (0-17)
+	 * BANK_SZ is 8 for TCA6418 (8 bits per register bank)
+	 */
+	return reg_base + (offset / BANK_SZ);
+}
+
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
 	u8 regaddr = chip->recalc_addr(chip, reg, 0);
@@ -529,11 +592,14 @@ static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 
 	guard(mutex)(&chip->i2c_lock);
 
-	return regmap_write_bits(chip->regmap, dirreg, bit, bit);
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return regmap_write_bits(chip->regmap, dirreg, bit, 0);
+	else
+		return regmap_write_bits(chip->regmap, dirreg, bit, bit);
 }
 
 static int pca953x_gpio_direction_output(struct gpio_chip *gc,
@@ -542,7 +608,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
 	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	int ret;
 
 	guard(mutex)(&chip->i2c_lock);
@@ -552,15 +618,20 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	/* then direction */
-	return regmap_write_bits(chip->regmap, dirreg, bit, 0);
+	/* then direction
+	 * (in/out logic is inverted on TCA6418)
+	 */
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return regmap_write_bits(chip->regmap, dirreg, bit, bit);
+	else
+		return regmap_write_bits(chip->regmap, dirreg, bit, 0);
 }
 
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 inreg = chip->recalc_addr(chip, chip->regs->input, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	u32 reg_val;
 	int ret;
 
@@ -577,7 +648,7 @@ static int pca953x_gpio_set_value(struct gpio_chip *gc, unsigned int off,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 outreg = chip->recalc_addr(chip, chip->regs->output, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 
 	guard(mutex)(&chip->i2c_lock);
 
@@ -588,7 +659,7 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
-	u8 bit = BIT(off % BANK_SZ);
+	u8 bit = pca953x_get_bit_mask(chip, off);
 	u32 reg_val;
 	int ret;
 
@@ -597,10 +668,17 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	if (ret < 0)
 		return ret;
 
-	if (reg_val & bit)
+	/* (in/out logic is inverted on TCA6418) */
+	if (reg_val & bit) {
+		if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+			return GPIO_LINE_DIRECTION_OUT;
+		else
+			return GPIO_LINE_DIRECTION_IN;
+	}
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
 		return GPIO_LINE_DIRECTION_IN;
-
-	return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int pca953x_gpio_get_multiple(struct gpio_chip *gc,
@@ -1120,6 +1198,11 @@ static int pca953x_probe(struct i2c_client *client)
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCAL653X_TYPE) {
 		chip->recalc_addr = pcal6534_recalc_addr;
 		chip->check_reg = pcal6534_check_register;
+	}  else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		chip->recalc_addr = tca6418_recalc_addr;
+		/* We don't assign chip->check_reg = tca6418_check_register directly here.
+		 * Instead, the wrappers handle the dispatch based on PCA_CHIP_TYPE.
+		 */
 	} else {
 		chip->recalc_addr = pca953x_recalc_addr;
 		chip->check_reg = pca953x_check_register;
@@ -1157,6 +1240,8 @@ static int pca953x_probe(struct i2c_client *client)
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
 		chip->regs = &pca957x_regs;
 		ret = device_pca957x_init(chip);
+	} else if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		chip->regs = &tca6418_regs;
 	} else {
 		chip->regs = &pca953x_regs;
 		ret = device_pca95xx_init(chip);
@@ -1325,6 +1410,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,pca9536", .data = OF_953X( 4, 0), },
 	{ .compatible = "ti,tca6408", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca6416", .data = OF_953X(16, PCA_INT), },
+	{ .compatible = "ti,tca6418", .data = (void *)(18 | TCA6418_TYPE | PCA_INT), },
 	{ .compatible = "ti,tca6424", .data = OF_953X(24, PCA_INT), },
 	{ .compatible = "ti,tca9535", .data = OF_953X(16, PCA_INT), },
 	{ .compatible = "ti,tca9538", .data = OF_953X( 8, PCA_INT), },
-- 
2.43.0


