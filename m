Return-Path: <linux-gpio+bounces-6526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20F8CB139
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8817B213A7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF49F144D36;
	Tue, 21 May 2024 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="VDk1JRV0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6814430D
	for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716305205; cv=none; b=oU1qHwoEbHJ32FXV117cdQIvZqLIPuwGbehQ7Oapw1EenNzv6G4MBSU4zj9GJeBbkIxR3aOBZhzHUolpRI7PM1hDkNze1tvpViIUFFgNPTqupXLNNrDQuavuQzv0LW1RhVYIi1TXBzZld7o0TrDWN/0SkwflaMskoGQOSxaofyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716305205; c=relaxed/simple;
	bh=cTHe3yMlR9xXw7lxXZ7eArbEWi0LYEzeSOzMMlbzFG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0uUb+ajl+gRG1RmhcVF4UWMwfcKwk00f3J76g+8vdSfTgc6GjS6ExBkbl2efkByi6FptWKcPKk5J5rqzOLWLAD6CpacGziK4iJB8jk0BQqFvlNHhCprrwYMjCp3/kyXeRAn0SkfUUvx5Qict/UFo6PGb5gVFGAc51HnoSDyo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=VDk1JRV0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-574f7c0bab4so11634355a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1716305201; x=1716910001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rjLn6crkk+FZyvtitmZt9qDIbYFZ00Z0BFOR6L2o2c=;
        b=VDk1JRV08quZhxkgg7UIK46JjKqK+j0cX/GitHW+YcBkCXalnN9/7vSVhFMDPUiVIn
         DW+wcLlPl8VmtH0sYAXmKmHDEOESNh+kZH34yB/5C0NMMMu283YV8OMJTjT7tMx3gfN+
         IdREOfCWbl8WT/kaga2M//LYczNL5jDvJpHXtLchHRaKUaOCI4hxp7ZO9EX3d3b3VeWu
         l6CMAfrtOIaFAZnyI8Tp3AlGg/cdY4y0V0CchoUbsRe8we9vX2s4sHDRtthat9zYkhMX
         O7XZOMihBdfpI6ZwH9d7xtV0Fsk+gvM5uK2yDxRDLGw/s0iCrclbYirhD2hwWuWbfmDe
         +qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716305201; x=1716910001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rjLn6crkk+FZyvtitmZt9qDIbYFZ00Z0BFOR6L2o2c=;
        b=h248zSCk33JNo/f1VlnLszVYSAkaLPVYov9ZpulV/G53T+Xi6Xxq0iQDU5QIZHByUq
         fzBNRJZRhVciu0s+x2Dkuol/Ak9YWgHdVRE/J1ZVaS3yTMB+InKvSKjnEUiTBg0uCPo1
         7/EbmjK+tHWYj0JBCJkpNUjBs5iv9oYceedUJlURDzlNlkb77sLRExpl0bVi4vuIftqs
         Hkc/LDMG8SP2f6uqa3XnuxGRe92K8PDpfpazHs8PAgC3IBvEd7ZSfA3XqYTkhxo8E3a5
         2NFLTVY8fvho3MHIgHIEn7oJjyCXb7esQ2ww2wOagCwuIV9EwjmtVS6dkKWv88jI1sRR
         Kk9A==
X-Forwarded-Encrypted: i=1; AJvYcCXb7A2tEpX5fHnouyrTjmfAS29Dk97BZTsvYcW1VRt/eB1eQtof7P0mMwAH1mMr8/3elVQPGOAIez3roGVx0pD+tAf/BmN7FcKh5A==
X-Gm-Message-State: AOJu0YzjW2FjQ8C7hMJUpSFAXodU8uujrSfgTzs2pjx17P+Y0ZqT17aK
	dFNznUUA6d7q6g/LvDCM3OCz7yayfsWV/g2Uqyw3Og370rMeqwMsbk9E9AyDrI2/EDUvXNfEkoV
	8
X-Google-Smtp-Source: AGHT+IFbzN83Lvjgry3fYhyDeN6yz/WEJGyQWb1CTLP6cXz+H50bserwMnATmoFQKxpesjnBptrf6w==
X-Received: by 2002:a17:906:3a9a:b0:a5a:7493:5b68 with SMTP id a640c23a62f3a-a5d5ecdc977mr785308366b.24.1716305200732;
        Tue, 21 May 2024 08:26:40 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b180c7sm1638327666b.221.2024.05.21.08.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:26:40 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: cy8c95x0: Use regmap ranges
Date: Tue, 21 May 2024 17:25:58 +0200
Message-ID: <20240521152602.1097764-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of implementing a custom register paging mechanism in
the driver use the existing regmap ranges feature.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 179 +++++++++--------------------
 1 file changed, 53 insertions(+), 126 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index ca54d91fdc77..9570de598193 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -58,9 +58,14 @@
 
 #define CY8C95X0_PIN_TO_OFFSET(x) (((x) >= 20) ? ((x) + 4) : (x))
 
-#define CY8C95X0_MUX_REGMAP_TO_PORT(x) ((x) / MUXED_STRIDE)
-#define CY8C95X0_MUX_REGMAP_TO_REG(x) (((x) % MUXED_STRIDE) + CY8C95X0_INTMASK)
-#define CY8C95X0_MUX_REGMAP_TO_OFFSET(x, p) ((x) - CY8C95X0_INTMASK + (p) * MUXED_STRIDE)
+#define MAX_BANK		8
+#define BANK_SZ			8
+#define MAX_LINE		(MAX_BANK * BANK_SZ)
+#define MUXED_STRIDE		(CY8C95X0_DRV_HIZ - CY8C95X0_INTMASK)
+#define CY8C95X0_GPIO_MASK	GENMASK(7, 0)
+#define CY8C95X0_VIRTUAL	(CY8C95X0_COMMAND + 1)
+#define CY8C95X0_MUX_REGMAP_TO_OFFSET(x, p) \
+	(CY8C95X0_VIRTUAL + (x) - CY8C95X0_INTMASK + (p) * MUXED_STRIDE)
 
 static const struct i2c_device_id cy8c95x0_id[] = {
 	{ "cy8c9520", 20, },
@@ -120,18 +125,11 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
 	{}
 };
 
-#define MAX_BANK 8
-#define BANK_SZ 8
-#define MAX_LINE	(MAX_BANK * BANK_SZ)
-#define MUXED_STRIDE	16
-#define CY8C95X0_GPIO_MASK		GENMASK(7, 0)
-
 /**
  * struct cy8c95x0_pinctrl - driver data
  * @regmap:         Device's regmap. Only direct access registers.
- * @muxed_regmap:   Regmap for all muxed registers.
  * @irq_lock:       IRQ bus lock
- * @i2c_lock:       Mutex for the device internal mux register
+ * @i2c_lock:       Mutex to hold while using the regmap
  * @irq_mask:       I/O bits affected by interrupts
  * @irq_trig_raise: I/O bits affected by raising voltage level
  * @irq_trig_fall:  I/O bits affected by falling voltage level
@@ -152,7 +150,6 @@ static const struct dmi_system_id cy8c95x0_dmi_acpi_irq_info[] = {
  */
 struct cy8c95x0_pinctrl {
 	struct regmap *regmap;
-	struct regmap *muxed_regmap;
 	struct mutex irq_lock;
 	struct mutex i2c_lock;
 	DECLARE_BITMAP(irq_mask, MAX_LINE);
@@ -331,6 +328,9 @@ static int cypress_get_pin_mask(struct cy8c95x0_pinctrl *chip, unsigned int pin)
 
 static bool cy8c95x0_readable_register(struct device *dev, unsigned int reg)
 {
+	if (reg >= CY8C95X0_VIRTUAL)
+		return true;
+
 	switch (reg) {
 	case 0x24 ... 0x27:
 		return false;
@@ -341,6 +341,9 @@ static bool cy8c95x0_readable_register(struct device *dev, unsigned int reg)
 
 static bool cy8c95x0_writeable_register(struct device *dev, unsigned int reg)
 {
+	if (reg >= CY8C95X0_VIRTUAL)
+		return true;
+
 	switch (reg) {
 	case CY8C95X0_INPUT_(0) ... CY8C95X0_INPUT_(7):
 		return false;
@@ -433,106 +436,33 @@ static bool cy8c95x0_quick_path_register(unsigned int reg)
 	}
 }
 
-static const struct reg_default cy8c95x0_reg_defaults[] = {
-	{ CY8C95X0_OUTPUT_(0), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(1), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(2), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(3), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(4), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(5), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(6), GENMASK(7, 0) },
-	{ CY8C95X0_OUTPUT_(7), GENMASK(7, 0) },
-	{ CY8C95X0_PORTSEL, 0 },
-	{ CY8C95X0_PWMSEL, 0 },
-};
-
-static int
-cy8c95x0_mux_reg_read(void *context, unsigned int off, unsigned int *val)
-{
-	struct cy8c95x0_pinctrl *chip = context;
-	u8 port = CY8C95X0_MUX_REGMAP_TO_PORT(off);
-	int ret, reg = CY8C95X0_MUX_REGMAP_TO_REG(off);
-
-	/* Select the correct bank */
-	ret = regmap_write(chip->regmap, CY8C95X0_PORTSEL, port);
-	if (ret < 0)
-		goto out;
-
-	/*
-	 * Read the register through direct access regmap. The target range
-	 * is marked volatile.
-	 */
-	return regmap_read(chip->regmap, reg, val);
-}
-
-static int
-cy8c95x0_mux_reg_write(void *context, unsigned int off, unsigned int val)
-{
-	struct cy8c95x0_pinctrl *chip = context;
-	u8 port = CY8C95X0_MUX_REGMAP_TO_PORT(off);
-	int ret, reg = CY8C95X0_MUX_REGMAP_TO_REG(off);
-
-	/* Select the correct bank */
-	ret = regmap_write(chip->regmap, CY8C95X0_PORTSEL, port);
-	if (ret < 0)
-		goto out;
-
-	/*
-	 * Write the register through direct access regmap. The target range
-	 * is marked volatile.
-	 */
-	return regmap_write(chip->regmap, reg, val);
-}
-
-static bool cy8c95x0_mux_accessible_register(struct device *dev, unsigned int off)
-{
-	struct i2c_client *i2c = to_i2c_client(dev);
-	struct cy8c95x0_pinctrl *chip = i2c_get_clientdata(i2c);
-	u8 port = CY8C95X0_MUX_REGMAP_TO_PORT(off);
-	u8 reg = CY8C95X0_MUX_REGMAP_TO_REG(off);
-
-	if (port >= chip->nport)
-		return false;
-
-	return cy8c95x0_muxed_register(reg);
-}
-
-static struct regmap_bus cy8c95x0_regmap_bus = {
-	.reg_read = cy8c95x0_mux_reg_read,
-	.reg_write = cy8c95x0_mux_reg_write,
-};
-
-/* Regmap for muxed registers CY8C95X0_INTMASK - CY8C95X0_DRV_HIZ */
-static const struct regmap_config cy8c95x0_muxed_regmap = {
-	.name = "muxed",
-	.reg_bits = 8,
-	.val_bits = 8,
-	.cache_type = REGCACHE_FLAT,
-	.use_single_read = true,
-	.use_single_write = true,
-	.max_register = MUXED_STRIDE * BANK_SZ,
-	.num_reg_defaults_raw = MUXED_STRIDE * BANK_SZ,
-	.readable_reg = cy8c95x0_mux_accessible_register,
-	.writeable_reg = cy8c95x0_mux_accessible_register,
-	.disable_locking = true,
+static const struct regmap_range_cfg cy8c95x0_ranges[] = {
+	{
+		.range_min = CY8C95X0_VIRTUAL,
+		.range_max = 0,		/* Updated at runtime */
+		.selector_reg = CY8C95X0_PORTSEL,
+		.selector_mask = 0x07,
+		.selector_shift = 0x0,
+		.window_start = CY8C95X0_INTMASK,
+		.window_len = MUXED_STRIDE,
+	}
 };
 
-/* Direct access regmap */
-static const struct regmap_config cy8c95x0_i2c_regmap = {
-	.name = "direct",
+static const struct regmap_config cy8c9520_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-	.reg_defaults = cy8c95x0_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(cy8c95x0_reg_defaults),
-
 	.readable_reg = cy8c95x0_readable_register,
 	.writeable_reg = cy8c95x0_writeable_register,
 	.volatile_reg = cy8c95x0_volatile_register,
 	.precious_reg = cy8c95x0_precious_register,
 
 	.cache_type = REGCACHE_FLAT,
-	.max_register = CY8C95X0_COMMAND,
+	.ranges	= NULL,			/* Updated at runtime */
+	.num_ranges = 1,
+	.max_register = 0,		/* Updated at runtime */
+	.num_reg_defaults_raw = 0,	/* Updated at runtime */
+	.use_single_read = true,	/* Workaround for regcache bug */
 	.disable_locking = true,
 };
 
@@ -544,7 +474,6 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 						   bool *change, bool async,
 						   bool force)
 {
-	struct regmap *regmap;
 	int ret, off, i, read_val;
 
 	/* Caller should never modify PORTSEL directly */
@@ -553,12 +482,10 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 
 	mutex_lock(&chip->i2c_lock);
 
-	/* Registers behind the PORTSEL mux have their own regmap */
+	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
-		regmap = chip->muxed_regmap;
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
 	} else {
-		regmap = chip->regmap;
 		/* Quick path direct access registers honor the port argument */
 		if (cy8c95x0_quick_path_register(reg))
 			off = reg + port;
@@ -566,7 +493,7 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 			off = reg;
 	}
 
-	ret = regmap_update_bits_base(regmap, off, mask, val, change, async, force);
+	ret = regmap_update_bits_base(chip->regmap, off, mask, val, change, async, force);
 	if (ret < 0)
 		goto out;
 
@@ -577,16 +504,16 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 				continue;
 			off = CY8C95X0_MUX_REGMAP_TO_OFFSET(i, port);
 
-			ret = regmap_read(regmap, off, &read_val);
+			ret = regmap_read(chip->regmap, off, &read_val);
 			if (ret < 0)
 				continue;
 
 			if (!(read_val & mask & val))
 				continue;
 
-			regcache_cache_only(regmap, true);
-			regmap_update_bits(regmap, off, mask & val, 0);
-			regcache_cache_only(regmap, false);
+			regcache_cache_only(chip->regmap, true);
+			regmap_update_bits(chip->regmap, off, mask & val, 0);
+			regcache_cache_only(chip->regmap, false);
 		}
 	}
 out:
@@ -662,17 +589,14 @@ static int cy8c95x0_regmap_update_bits(struct cy8c95x0_pinctrl *chip, unsigned i
 static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 				unsigned int port, unsigned int *read_val)
 {
-	struct regmap *regmap;
 	int off, ret;
 
 	mutex_lock(&chip->i2c_lock);
 
-	/* Registers behind the PORTSEL mux have their own regmap */
+	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
-		regmap = chip->muxed_regmap;
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
 	} else {
-		regmap = chip->regmap;
 		/* Quick path direct access registers honor the port argument */
 		if (cy8c95x0_quick_path_register(reg))
 			off = reg + port;
@@ -680,7 +604,7 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 			off = reg;
 	}
 
-	ret = regmap_read(regmap, off, read_val);
+	ret = regmap_read(chip->regmap, off, read_val);
 
 	mutex_unlock(&chip->i2c_lock);
 
@@ -1513,6 +1437,8 @@ static int cy8c95x0_detect(struct i2c_client *client,
 static int cy8c95x0_probe(struct i2c_client *client)
 {
 	struct cy8c95x0_pinctrl *chip;
+	struct regmap_config regmap_conf;
+	struct regmap_range_cfg regmap_range_conf;
 	struct regulator *reg;
 	int ret;
 
@@ -1532,15 +1458,20 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	chip->tpin = chip->driver_data & CY8C95X0_GPIO_MASK;
 	chip->nport = DIV_ROUND_UP(CY8C95X0_PIN_TO_OFFSET(chip->tpin), BANK_SZ);
 
+	memcpy(&regmap_range_conf, &cy8c95x0_ranges[0], sizeof(regmap_range_conf));
+
 	switch (chip->tpin) {
 	case 20:
 		strscpy(chip->name, cy8c95x0_id[0].name, I2C_NAME_SIZE);
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 3 * MUXED_STRIDE;
 		break;
 	case 40:
 		strscpy(chip->name, cy8c95x0_id[1].name, I2C_NAME_SIZE);
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 6 * MUXED_STRIDE;
 		break;
 	case 60:
 		strscpy(chip->name, cy8c95x0_id[2].name, I2C_NAME_SIZE);
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 8 * MUXED_STRIDE;
 		break;
 	default:
 		return -ENODEV;
@@ -1573,22 +1504,18 @@ static int cy8c95x0_probe(struct i2c_client *client)
 		gpiod_set_consumer_name(chip->gpio_reset, "CY8C95X0 RESET");
 	}
 
-	/* Generic regmap for direct access registers */
-	chip->regmap = devm_regmap_init_i2c(client, &cy8c95x0_i2c_regmap);
+	/* Regmap for direct and paged registers */
+	memcpy(&regmap_conf, &cy8c9520_i2c_regmap, sizeof(regmap_conf));
+	regmap_conf.ranges = &regmap_range_conf;
+	regmap_conf.max_register = regmap_range_conf.range_max;
+	regmap_conf.num_reg_defaults_raw = regmap_range_conf.range_max;
+
+	chip->regmap = devm_regmap_init_i2c(client, &regmap_conf);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		goto err_exit;
 	}
 
-	/* Port specific regmap behind PORTSEL mux */
-	chip->muxed_regmap = devm_regmap_init(&client->dev, &cy8c95x0_regmap_bus,
-					      chip, &cy8c95x0_muxed_regmap);
-	if (IS_ERR(chip->muxed_regmap)) {
-		ret = dev_err_probe(&client->dev, PTR_ERR(chip->muxed_regmap),
-				    "Failed to register muxed regmap\n");
-		goto err_exit;
-	}
-
 	bitmap_zero(chip->push_pull, MAX_LINE);
 	bitmap_zero(chip->shiftmask, MAX_LINE);
 	bitmap_set(chip->shiftmask, 0, 20);
-- 
2.44.0


