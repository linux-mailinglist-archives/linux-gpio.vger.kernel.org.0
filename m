Return-Path: <linux-gpio+bounces-7709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E50917B3E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 10:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EE9D1F271DE
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 08:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BC21684B9;
	Wed, 26 Jun 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="fkUk8Mkd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631123B1A1
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391544; cv=none; b=tbShmCxYBtrNI1ujLABxW1T+XQhSVDE4PRfmkXQG3mzRAh+oekNJfKJGALUsyLuDGa4YGG3Mtb0uqoc6mnJBNU4TbAaTyf1n9DzDTBy+JDG+YGeDnRPHnunOpdyP1z1tDlzmJKD/ZQk9xqdp2Vy49KjjJCzUOaU6MV2H9a/J0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391544; c=relaxed/simple;
	bh=e+4il4BiDqDqxdJ+2HXtfhb5dyGkvKJ2NlmBscN7Lsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nb5K8sCSgSWBzcRyj3u0QUDDbbWl9sLkJQs/OtMsmE5as367IuTwKvuE88u9xfl9LDXasidS+dyQLIR7fSfCRrBOK32VauZUqGYSILnHmlzAP5Q561zygnPg6LDtU4E2/v3bF34EBBQIYIKZO7VSsy4cvcehNgRSU6CYl323FjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=fkUk8Mkd; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7194ce90afso499095166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1719391541; x=1719996341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiDsIDBP7mglQq7Zo2R30eNEeyLgI5TULZGsWugMJk4=;
        b=fkUk8Mkd3tNXmEuh+f7SuiDafff5f+ftgkswgLjlo6H7Vr6UZF9eNjqlUcro9djeNZ
         NulqKLlqBCGSygZZyKkBF3zDkkCC5dLGD2PueGhyILyqnnhOtAX8m11cRokwvyyC4Frw
         xASXLZhn3LgoI2Diny+qyUeCimRVyXFTsVLqs/aVXxzN18rO25ineTWSa53niGDAxARO
         mE50fuhMzaK2+7zOoA9QXlYCRntwvkq+KXQ89dT7PYhvU1sYh7lELeg8gKEIWvuuEzzM
         rwk63FTSCCrJG5TJ7x8fkzwshJghxZMikOIF8tgfXfXnL88Su/B9aehgmF1jkzvaYe0I
         hXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391541; x=1719996341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiDsIDBP7mglQq7Zo2R30eNEeyLgI5TULZGsWugMJk4=;
        b=fFwMX/Ph4SKLY3yKaGxN6kX3bBWv3JQSaCILUwb/jpJoQZKaGKn0ITqhmxP1qMBTSe
         tiGLOPjIr/uRDCqW2FEWhZ+6A1E+OXxaZBHhDxVn6jwV3il6EnQQp0BL2bSj2tb2zs2U
         ENJabmN+KgP+lQpTGkzP8ns+O0QEnpkU3+ER40+zq680v9tnFSeqvIMxspNoG0siUAhF
         317UEy2HmYv+LHW2tctMRYWH6pNAgVf3y7ZhmbSvBf/AO6XwPNswY/AtE8H8cJRr+QY3
         5TDL+vK69Sdyi4Vr6osiR9l9kgLmmNZsYdE9uPrMmKS4h1BBTDlH+PYG68euVo37EB6Y
         bkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzqSkWI0b7Hi6vX789fg9UmxvKWBJo0qHD0Vnkx3X+vAwnlVu/OI94DW6yd0wpSwItPVQwCLpJzoE7SVvZJXfvv5iVU/0ICocYmA==
X-Gm-Message-State: AOJu0YwOUebLz7zqxsP1DzJQBNv7V8/5tqFalC3AXdCwDgb6n+bwRGfo
	jVQxLSVNMkOIdryE/m2q82QxfbFxs7wt3hINy+2gIjyCXjZYI4QmizpgJcJPuQA=
X-Google-Smtp-Source: AGHT+IETBbf+gHc8aPv/nhXZcZ13PbW3DXb5PtzTmTYrkptRRxHPPyjOwl/EAxG4mHTvlKU/EZqLdw==
X-Received: by 2002:a17:906:230d:b0:a6f:50ae:e0a with SMTP id a640c23a62f3a-a715f978a7amr612805566b.37.1719391540668;
        Wed, 26 Jun 2024 01:45:40 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72605ff279sm218647166b.5.2024.06.26.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:45:40 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com,
	broonie@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: cy8c95x0: Use cleanup.h
Date: Wed, 26 Jun 2024 10:45:22 +0200
Message-ID: <20240626084525.787298-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the guard mutex from cleanup.h to make the code more readable.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 4efb8b5cc2d3..781949e0e09e 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/bitmap.h>
+#include <linux/cleanup.h>
 #include <linux/dmi.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
@@ -480,8 +481,6 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 	if (reg == CY8C95X0_PORTSEL)
 		return -EINVAL;
 
-	mutex_lock(&chip->i2c_lock);
-
 	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
@@ -492,10 +491,11 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 		else
 			off = reg;
 	}
+	guard(mutex)(&chip->i2c_lock);
 
 	ret = regmap_update_bits_base(chip->regmap, off, mask, val, change, async, force);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	/* Update the cache when a WC bit is written */
 	if (cy8c95x0_wc_register(reg) && (mask & val)) {
@@ -516,8 +516,6 @@ static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip
 			regcache_cache_only(chip->regmap, false);
 		}
 	}
-out:
-	mutex_unlock(&chip->i2c_lock);
 
 	return ret;
 }
@@ -591,8 +589,6 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 {
 	int off, ret;
 
-	mutex_lock(&chip->i2c_lock);
-
 	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
@@ -603,11 +599,10 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 		else
 			off = reg;
 	}
+	guard(mutex)(&chip->i2c_lock);
 
 	ret = regmap_read(chip->regmap, off, read_val);
 
-	mutex_unlock(&chip->i2c_lock);
-
 	return ret;
 }
 
-- 
2.44.0


