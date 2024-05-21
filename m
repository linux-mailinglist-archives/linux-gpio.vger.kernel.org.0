Return-Path: <linux-gpio+bounces-6524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B828CB136
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 17:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 705F0283513
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB021448D9;
	Tue, 21 May 2024 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="BS/EnN8P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018A1442EF
	for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716305203; cv=none; b=QH70mg3TB7nvxfEB/Tqb3fcnGK0pjuck02lGGhi3OJUs5DVEJ5r+nfTI1Jhfe+d64IDG7NGSp6WdYitcIHMKvS+DxhgHfOeaLmnk6d10d7VMlHeGDt/l3yeiPZocxDAk0/H2gDR5L+PsJ8vFDiixuo6WFKcB36nQDkGQfLSKn8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716305203; c=relaxed/simple;
	bh=YbcpAnvKee2GOMccnSTVfLdSPbQ/cZoM9orq9m3+dek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TxpeTTX8v/TBgxejAnZClJklZIWdIY1AtL2sQnKzUDJ/Q1EQ2FtcGRciVmsgriiQPPQa/bIAwqsweeF2H1t45Usdq/AdMOeEZ7SCk+oPtbiaoDYznRg6/H2k+weVTeFXdpQbxM/mbfwXGZiQPyAQ/aJbUUl7gpI93/RiJ1Ftk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=BS/EnN8P; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so900250966b.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2024 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1716305199; x=1716909999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SP7h2B6yJgGk4TH9IEQ7JI0U019rt16DjXGMkeKeb4=;
        b=BS/EnN8PmaRk1Jmat2BP1RZDEfPL7COEnqjTFsqKlLlt4brTZk8qLSb8L/AJOyr2en
         D5zuaIOZ8XiRsLtXzvyZRG0bxeaVbSa3pkywN91poW9SnbyEB1jfWY3Mdzfp5OUzIhNO
         VTkfAaY7P7IgvxhVLaOF2m0zHtvMPImKEXsBs1Ia+ScdvwZcFMLzyui7aYzLH8CoMbUP
         qxGWcK8IK5Y9GakY+U61BpLAXbHvL3nmsSv0LN7Hxc342JWP8/KCCw7uXLkFZKsuSXDe
         TF+Znt7g+fkyFnY9aSOIHNfpfeEVnS6uGL+lE6bHhueFQtdV6AXrB2snwKxK0pvFtVp9
         FTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716305199; x=1716909999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SP7h2B6yJgGk4TH9IEQ7JI0U019rt16DjXGMkeKeb4=;
        b=NQp7sehxUjmT8xZ55+1Qo/d3NTJzchpBUzqJL5iRA+o3ZOg66fF5MSKmB+42o3DB50
         c4L4oWi4zgiMdZIs3qQF45Yd3/5sq3HKRQ4+cgKEra3Wy/DdZcWblJNfuqYrfKtOFw1X
         no1oYTRxmDLJnJlajHPai7lvcPccxYSDQqAFjnLjZK9nN7ucM9mfFIhvo9PjGdNzzP9L
         G+uT1cx20WoBKmwQoa0ye77yZifIyVJq5PG9WBG/JN0JOllMw85YMFcIF+N+vz09y1Vo
         2YvgTC+FOPjwgcunPlsKHGZQ8xTIsdOF2XGZ8IcLHDXstjdXF5Dpbvi9WrcFiS2RKH5Z
         oNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsuk2FbPNSRY92EHfUkJ2do5niaUTVnot1743+bquT/p9VCeQdjDZD81nZ25gjNqB4divfGythJF6pOXHMgDqrptyCPRdxKq3Ccw==
X-Gm-Message-State: AOJu0YwRnFh8OsKeN43ri3yjS4GOTrofgx8cdOG3xsWVOCwB32gvKt4M
	zdnBJow4YJgOas3SqEidlgbyVjrA1hgTzKt1ymJQ8E9QwhQyeHfEuzXmAZsiVYg=
X-Google-Smtp-Source: AGHT+IHNXBESWf3UtYt88Rul5ND3zDlu4ztC4pHIbV9GB5hTd3riRS/EOXQgXNRtiuUfWmdtSDvAWg==
X-Received: by 2002:a17:906:6882:b0:a5a:76e2:c2a8 with SMTP id a640c23a62f3a-a5a76e2c306mr1547537466b.23.1716305199086;
        Tue, 21 May 2024 08:26:39 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b180c7sm1638327666b.221.2024.05.21.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:26:38 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: cy8c95x0: Use single I2C lock
Date: Tue, 21 May 2024 17:25:57 +0200
Message-ID: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there are 3 locks being used when accessing the chip, one
in the driver and one in each regmap. Reduce that to one driver only
lock that protects all regmap and regcache accesses.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 981c569bd671..ca54d91fdc77 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -453,7 +453,6 @@ cy8c95x0_mux_reg_read(void *context, unsigned int off, unsigned int *val)
 	u8 port = CY8C95X0_MUX_REGMAP_TO_PORT(off);
 	int ret, reg = CY8C95X0_MUX_REGMAP_TO_REG(off);
 
-	mutex_lock(&chip->i2c_lock);
 	/* Select the correct bank */
 	ret = regmap_write(chip->regmap, CY8C95X0_PORTSEL, port);
 	if (ret < 0)
@@ -463,11 +462,7 @@ cy8c95x0_mux_reg_read(void *context, unsigned int off, unsigned int *val)
 	 * Read the register through direct access regmap. The target range
 	 * is marked volatile.
 	 */
-	ret = regmap_read(chip->regmap, reg, val);
-out:
-	mutex_unlock(&chip->i2c_lock);
-
-	return ret;
+	return regmap_read(chip->regmap, reg, val);
 }
 
 static int
@@ -477,7 +472,6 @@ cy8c95x0_mux_reg_write(void *context, unsigned int off, unsigned int val)
 	u8 port = CY8C95X0_MUX_REGMAP_TO_PORT(off);
 	int ret, reg = CY8C95X0_MUX_REGMAP_TO_REG(off);
 
-	mutex_lock(&chip->i2c_lock);
 	/* Select the correct bank */
 	ret = regmap_write(chip->regmap, CY8C95X0_PORTSEL, port);
 	if (ret < 0)
@@ -487,11 +481,7 @@ cy8c95x0_mux_reg_write(void *context, unsigned int off, unsigned int val)
 	 * Write the register through direct access regmap. The target range
 	 * is marked volatile.
 	 */
-	ret = regmap_write(chip->regmap, reg, val);
-out:
-	mutex_unlock(&chip->i2c_lock);
-
-	return ret;
+	return regmap_write(chip->regmap, reg, val);
 }
 
 static bool cy8c95x0_mux_accessible_register(struct device *dev, unsigned int off)
@@ -524,6 +514,7 @@ static const struct regmap_config cy8c95x0_muxed_regmap = {
 	.num_reg_defaults_raw = MUXED_STRIDE * BANK_SZ,
 	.readable_reg = cy8c95x0_mux_accessible_register,
 	.writeable_reg = cy8c95x0_mux_accessible_register,
+	.disable_locking = true,
 };
 
 /* Direct access regmap */
@@ -542,6 +533,7 @@ static const struct regmap_config cy8c95x0_i2c_regmap = {
 
 	.cache_type = REGCACHE_FLAT,
 	.max_register = CY8C95X0_COMMAND,
+	.disable_locking = true,
 };
 
 static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
@@ -559,6 +551,8 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 	if (reg == CY8C95X0_PORTSEL)
 		return -EINVAL;
 
+	mutex_lock(&chip->i2c_lock);
+
 	/* Registers behind the PORTSEL mux have their own regmap */
 	if (cy8c95x0_muxed_register(reg)) {
 		regmap = chip->muxed_regmap;
@@ -574,7 +568,7 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 
 	ret = regmap_update_bits_base(regmap, off, mask, val, change, async, force);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	/* Update the cache when a WC bit is written */
 	if (cy8c95x0_wc_register(reg) && (mask & val)) {
@@ -595,6 +589,8 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 			regcache_cache_only(regmap, false);
 		}
 	}
+out:
+	mutex_unlock(&chip->i2c_lock);
 
 	return ret;
 }
@@ -667,7 +663,9 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 				unsigned int port, unsigned int *read_val)
 {
 	struct regmap *regmap;
-	int off;
+	int off, ret;
+
+	mutex_lock(&chip->i2c_lock);
 
 	/* Registers behind the PORTSEL mux have their own regmap */
 	if (cy8c95x0_muxed_register(reg)) {
@@ -682,7 +680,11 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 			off = reg;
 	}
 
-	return regmap_read(regmap, off, read_val);
+	ret = regmap_read(regmap, off, read_val);
+
+	mutex_unlock(&chip->i2c_lock);
+
+	return ret;
 }
 
 static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
-- 
2.44.0


