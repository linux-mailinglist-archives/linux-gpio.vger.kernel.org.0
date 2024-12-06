Return-Path: <linux-gpio+bounces-13603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCEF9E7B74
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 23:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 402FB2823F2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 22:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61921F4279;
	Fri,  6 Dec 2024 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9ijn6zG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CE22C6E3;
	Fri,  6 Dec 2024 22:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733523182; cv=none; b=hqhft/jq0AEmlxTgle1Kz+NozgP7YK0YFiIZh8i82PA9nV1uXHFLnO/FTY9hgt5AiDwXT6RhaOArId5UPbQKt3SH0+qaTNGoC8NF2P03YDjRkjcaBPw+ujTfc5a5NwcfdxFEeoXI9uErm3VN+3By74k6wkCbiYBsNGlE/1hKz2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733523182; c=relaxed/simple;
	bh=bA2NGoNsP1HkX5+YuFM8aDMcV6Wkpd8dXcDcdQYqcBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q8aXYVRmQ/OdqlUPY2ImV0lvjOkfyh9mi7+HxzjwnV3BAQoOlnKSArGbA2ONxP5WiLfd/BdU7+Z+4KVhJlB9sMI40Rr8XskOa3XYca6zSoCNnVfJBenFV7/ej21KPWHWhARYObd4BllisrTEduaxNyLxGJevL2OUQGQ+cQsXy8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9ijn6zG; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d87fea84cdso16110656d6.2;
        Fri, 06 Dec 2024 14:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733523179; x=1734127979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q42RlzBJ7KqBAuqUYePY8IHU3p8Lx6u0Ba/+7jjyPE8=;
        b=c9ijn6zGBeKIB22XOsEUs6tCWYnQzX/6pkiXfhy+1RYL+euB58sgZMQnLTIn9NV+JU
         /uO0RyLNGweDPXEWWcYWe1jx5SSTyCDgBlb7kpgOp6lsgATUI63jaoaNDZG+LSZPPRI3
         iHdUy1/m0sePgkHuTVZGe2ybOmiXhCxgjpJSgcLOd+QNA/4JP0BrR++/KUbyEYPVdU8+
         GW3xYr9p3jKWPLAFBd+rHo2Q3eLFtju9wm2LyM+AFmUtA6am+AvAUyQKTbZ2JdMWs0S4
         quaZ+ungqRs1orX8uLUQlQSNK9UHZwMbIu2ihZ4Rb1Wie53lptPjZWfpC3Dg0tPzZRWF
         knPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523179; x=1734127979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q42RlzBJ7KqBAuqUYePY8IHU3p8Lx6u0Ba/+7jjyPE8=;
        b=wivVEohnBOkEclaGgVR883688jqyD+LDBBvfeveuIZ0TcCvtWkEcHVVfwXtDuYKzrQ
         PwPjXExKoPVMDXW/03pBsuAmYGweUh+Ya6ZMmf5PgxMKvYaeiv0na420qURTiu4GnsLZ
         P8W1Xe6R/5XpYj0BTgXOqw+mACPzY6bX6FkS1Bn+n4PbX8vxPd7yLfkRCOoDNIRCOkEa
         NBKlql4TRg/00HHdjGPdFBb3CM0Q/1P1qZ27dz3+Jar4mnwl/XHUAkxQmhXJHl+2jNmv
         CPMngY9tg6xffA256f9y76eNJvn2Uy+8gAVTAuO1bbthf/HDfXU2xqFufHwrFdyDbpLM
         mBjw==
X-Forwarded-Encrypted: i=1; AJvYcCUAYsni1kl05U9bVjL++cCAEpp/CJKV/zAWt6avU08hxR+Fa0/k6sLJoAobeqn5MupXMuTqidPpi9bK@vger.kernel.org, AJvYcCUM3gEqq/NnBVNfFwIKSIFkPWEwjBTHjyDwhuR9BIuM+oeJM7lepMd1YXMIp0LobTJRv4SWx5wySZ/KvnK5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6jEdsPob/8Yn7v+GMpi6JNIgbhLiPQUjzJR/j/pJB6vKWkw6U
	qpWe1vPD1IQh4fe50rtnQssAtGh9cPCwcFqOi7qKCGR+aSRSoLOW40TvoiOg
X-Gm-Gg: ASbGncudnVCw1YKuyI1DWuKO8KnfFRLszAcnd6U8D8S/bbKh/DMoBpdfTA85ThlJwnj
	i5v3nXdNCV4A/60QiwGcNp80sFg8EWt05Yoq0TZut7QIutQE52hvrg10vhauAGt9KaTPSTLpiKZ
	sJ6aUD68yOWzyOLNft93mM2hQF/mOHGZqlWYULRx9AgRBsj/CTn5FT/mWnSL8RqN1X9B714DgKJ
	0vIA1CnxhsbWZTGQ9JbzogC6BlelJG1c9wsi/d8pU6wJMOtpGrkz+9/UNvUVw==
X-Google-Smtp-Source: AGHT+IFQFkzHlBJRc6UEiHKJ4eYO1c21bJ9G3NUU01WnmUgcxL08A7K6w/BdnqegWiG6jNv0dFMTIw==
X-Received: by 2002:a05:6214:29e7:b0:6d8:9c92:6555 with SMTP id 6a1803df08f44-6d8e71675ecmr53676936d6.29.1733523178756;
        Fri, 06 Dec 2024 14:12:58 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da9fd1f2sm23607676d6.81.2024.12.06.14.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:12:58 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] pinctrl: nomadik: Add check for clk_enable()
Date: Fri,  6 Dec 2024 17:16:18 -0500
Message-Id: <20241206221618.3453159-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch the potential
error.
Disable success clks in the error handling.
Change return type of nmk_gpio_glitch_slpm_init casade.

Fixes: 3a19805920f1 ("pinctrl: nomadik: move all Nomadik drivers to subdir")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add clk_disable in error handling.
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 35 ++++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f4f10c60c1d2..4261541928e9 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -438,9 +438,9 @@ static void nmk_prcm_altcx_set_mode(struct nmk_pinctrl *npct,
  *  - Any spurious wake up event during switch sequence to be ignored and
  *    cleared
  */
-static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
+static int nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 {
-	int i;
+	int i, j, ret;
 
 	for (i = 0; i < NMK_MAX_BANKS; i++) {
 		struct nmk_gpio_chip *chip = nmk_gpio_chips[i];
@@ -449,11 +449,21 @@ static void nmk_gpio_glitch_slpm_init(unsigned int *slpm)
 		if (!chip)
 			break;
 
-		clk_enable(chip->clk);
+		ret = clk_enable(chip->clk);
+		if (ret) {
+			for (j = 0; j < i; j++) {
+				chip = nmk_gpio_chips[j];
+				clk_disable(chip->clk);
+			}
 
+			return ret;
+		}
+
 		slpm[i] = readl(chip->addr + NMK_GPIO_SLPC);
 		writel(temp, chip->addr + NMK_GPIO_SLPC);
 	}
+
+	return 0;
 }
 
 static void nmk_gpio_glitch_slpm_restore(unsigned int *slpm)
@@ -923,7 +933,9 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 
 			slpm[nmk_chip->bank] &= ~BIT(bit);
 		}
-		nmk_gpio_glitch_slpm_init(slpm);
+		ret = nmk_gpio_glitch_slpm_init(slpm);
+		if (ret)
+			goto out_pre_slpm_init;
 	}
 
 	for (i = 0; i < g->grp.npins; i++) {
@@ -940,7 +952,10 @@ static int nmk_pmx_set(struct pinctrl_dev *pctldev, unsigned int function,
 		dev_dbg(npct->dev, "setting pin %d to altsetting %d\n",
 			g->grp.pins[i], g->altsetting);
 
-		clk_enable(nmk_chip->clk);
+		ret = clk_enable(nmk_chip->clk);
+		if (ret)
+			goto out_glitch;
+
 		/*
 		 * If the pin is switching to altfunc, and there was an
 		 * interrupt installed on it which has been lazy disabled,
@@ -988,6 +1003,7 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	unsigned int bit;
+	int ret;
 
 	if (!range) {
 		dev_err(npct->dev, "invalid range\n");
@@ -1004,7 +1020,9 @@ static int nmk_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	find_nmk_gpio_from_pin(pin, &bit);
 
-	clk_enable(nmk_chip->clk);
+	ret = clk_enable(nmk_chip->clk);
+	if (ret)
+		return ret;
 	/* There is no glitch when converting any pin to GPIO */
 	__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
 	clk_disable(nmk_chip->clk);
@@ -1058,6 +1076,7 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned long cfg;
 	int pull, slpm, output, val, i;
 	bool lowemi, gpiomode, sleep;
+	int ret;
 
 	nmk_chip = find_nmk_gpio_from_pin(pin, &bit);
 	if (!nmk_chip) {
@@ -1116,7 +1135,9 @@ static int nmk_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			output ? (val ? "high" : "low") : "",
 			lowemi ? "on" : "off");
 
-		clk_enable(nmk_chip->clk);
+		ret = clk_enable(nmk_chip->clk);
+		if (ret)
+			return ret;
 		if (gpiomode)
 			/* No glitch when going to GPIO mode */
 			__nmk_gpio_set_mode(nmk_chip, bit, NMK_GPIO_ALT_GPIO);
-- 
2.34.1


