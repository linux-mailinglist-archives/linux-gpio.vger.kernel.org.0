Return-Path: <linux-gpio+bounces-14221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205F9FC1DA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 21:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597FA1883968
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 20:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248F91D86CE;
	Tue, 24 Dec 2024 20:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZjYdlt1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6D1465B4;
	Tue, 24 Dec 2024 20:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735070585; cv=none; b=iFR7Ldvl9CDf5VFEXzQNOCoKc7C956p2UBi20CMk3+Nm7GN9mkvbvpJrFMshtfD2OOssVQsXjNybGDFPXefn69YqCcopt6OtGu5vNdzRU1FWJ4ZFHpAkNmkc3xE8DAzy0PT5D/1xtuNEI9j+pyjPkr+K7sIDfOYOtSn0iHVwVWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735070585; c=relaxed/simple;
	bh=kKMCgdOtt8sjk7gbDCkMPMAZShJNbICfwsSqXjYqoRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=juTIf5thmcbDfpEc+F7vH3zXnYA083iveJ3HMpuFDWhux1H1/kD4HnKG2DdFEURsiknXlG5wtbWVBH67ngWKFz6ocJOO3vskQO3pl+l4DFQosdJYrH6hyf/0+pAMc4795u9aC/UmhzWwe3Ay5a/VdLMothBN7/VjLIu3IUveCdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZjYdlt1; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844e55a981dso203400039f.3;
        Tue, 24 Dec 2024 12:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735070583; x=1735675383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poncxOnZdDcZKHqz0owUgHxjpuHE1fKkza/gUQopM84=;
        b=BZjYdlt1k1h7+ryxPhnWqHdCjZ3VhW3t3tnSjgdsioH/nl7/bVUblnu0WqqoV1Gmmc
         musZH7kmX1C0enNHLTCptPBKioga6rwl1zmWaVrg6I1J+Cd3ERBuAZeJHLjDLvoN6QSz
         Fit/z2CfhOxn8ytTScZVk6o5YZ3V93LjX0GBo6gWzFEB1bZxSIcn1tvU9wp1JulJL6Qo
         f+bCAmji3a18V5CYfXtfZayO9XzefBLxphe8sRm/fadOqMJIue/k53NqjaqcBlYZf12A
         HMDCiq7BzkWuPFMHIiZgj7HEA8vlVlXZqSpWZrGYg5q/WDE1NtjtrsAEh8MCX2GhRQFn
         +m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735070583; x=1735675383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poncxOnZdDcZKHqz0owUgHxjpuHE1fKkza/gUQopM84=;
        b=p+nKhRt6t81MFwvDrhn9w5BmhhAcj7SQqOmi4jAlXPc881/irGEaXYGSgeN7IwnkwU
         /ay7sQerKoEvYVOyHQnaegjHpwTbgstna7NP7zkzEoZVi1lmQTY3etlGPrrfgmh2VmHX
         p/dE2FUZchcB3y2MkFA7QdA8IboFH8wvb3fzIo0NYKlFNcycUu0urK8RuKWNoyXzGzZk
         EdhHoqYdN4yePI0DxYmHMpkEQpPG8cRfcYOrz0ZDIfkOKQhxTKPUMGw9qRPgEN8IRJhS
         RhNrj3jbsOp4EvAGDPDVvR9ffEiM93KrkdvTEX7yeyqIhIXWGcHOVkEEhHUUOuHtRxrv
         CVdA==
X-Forwarded-Encrypted: i=1; AJvYcCVGqCZCZgKBJNGBy+12lEoyzw4g3ze7+ven/Sexrv98xa/RZATWDuDal3KDB+u3vMNmGcwbOZ9lchUOHRTy@vger.kernel.org, AJvYcCXNAL4etLf80ifozzc8SDeVEZCPaXJXFlSFQr5RmwMa9qP8Og3RtX757RySs3pd6APovEAlgEqifOyA@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrK24exTGLKBvG6ojXcW2LyA3eAB3WsvxVomZdPlM5wDxW90w
	fOq6FhHedspa7EM0l4LckotkSJffTf1rjoKhDDtQeubXxJWrsvIi
X-Gm-Gg: ASbGnctVZrkmzErCcpq67c8ylqaUhu1gPrQWeYtKS6liopdyOm7zlB89zw0h0rPi2vV
	Omjbr+qVVRIrDaQ98q0h4iGBolNdJkQ+BhjGWorOjhnU44MVPcUmE7ZB7lv+Yi6R6PYerBF5UxD
	s86uDEtHV4MO1hC1CBxpBmNC/NBy/svcjrO06ChV4T209Hrkh3TG7nI7G6mZ1SrUc11M8p384b1
	vmJm3AoHD2gNVHjW1AwGsF2icfmHnMDrHzzYJk/ltWqw2xhhTgYIilHvZ6pTp+OF17c
X-Google-Smtp-Source: AGHT+IFCS4C7fNiL6P/tkM9845PTEQ0rb/c/Qe3WOuiYEvVQ+LydZky1ohM7JeCfVoiEmoAcbg9QqQ==
X-Received: by 2002:a05:6e02:174d:b0:3a7:e7a9:8a78 with SMTP id e9e14a558f8ab-3c2d515168fmr129378365ab.17.1735070583459;
        Tue, 24 Dec 2024 12:03:03 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1dab95sm2842435173.123.2024.12.24.12.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:03:02 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
Cc: antonio.borneo@foss.st.com,
	linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	make24@iscas.ac.cn,
	peng.fan@nxp.com,
	fabien.dessenne@foss.st.com,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH RESEND v7] pinctrl: stm32: Add check for clk_enable()
Date: Tue, 24 Dec 2024 15:06:08 -0500
Message-Id: <20241224200608.84923-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the driver to clk_bulk*() API.
Add check for the return value of clk_bulk_enable() to catch
the potential error.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v6 -> v7:
1. Move clk_bulk_prepare_enable() before calling 
stm32_gpiolib_register_bank().

v5 -> v6:
1. Call devm_clk_bulk_get_all in stm32_pctl_probe().

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank()
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 71 +++++++++++----------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..9c32ae3e5d45 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -86,7 +86,6 @@ struct stm32_pinctrl_group {
 
 struct stm32_gpio_bank {
 	void __iomem *base;
-	struct clk *clk;
 	struct reset_control *rstc;
 	spinlock_t lock;
 	struct gpio_chip gpio_chip;
@@ -108,6 +107,7 @@ struct stm32_pinctrl {
 	unsigned ngroups;
 	const char **grp_names;
 	struct stm32_gpio_bank *banks;
+	struct clk_bulk_data *clks;
 	unsigned nbanks;
 	const struct stm32_pinctrl_match_data *match_data;
 	struct irq_domain	*domain;
@@ -1308,12 +1308,6 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
-	if (err) {
-		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
-		return err;
-	}
-
 	bank->gpio_chip = stm32_gpio_template;
 
 	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
@@ -1360,26 +1354,21 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 							   bank->fwnode, &stm32_gpio_domain_ops,
 							   bank);
 
-		if (!bank->domain) {
-			err = -ENODEV;
-			goto err_clk;
-		}
+		if (!bank->domain)
+			return -ENODEV;
 	}
 
 	names = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
-	if (!names) {
-		err = -ENOMEM;
-		goto err_clk;
-	}
+	if (!names)
+		return -ENOMEM;
 
 	for (i = 0; i < npins; i++) {
 		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
 		if (stm32_pin && stm32_pin->pin.name) {
 			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
-			if (!names[i]) {
-				err = -ENOMEM;
-				goto err_clk;
-			}
+			if (!names[i])
+				return -ENOMEM;
+
 		} else {
 			names[i] = NULL;
 		}
@@ -1390,15 +1379,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	err = gpiochip_add_data(&bank->gpio_chip, bank);
 	if (err) {
 		dev_err(dev, "Failed to add gpiochip(%d)!\n", bank_nr);
-		goto err_clk;
+		return err;
 	}
 
 	dev_info(dev, "%s bank added\n", bank->gpio_chip.label);
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(bank->clk);
-	return err;
 }
 
 static struct irq_domain *stm32_pctrl_get_irq_domain(struct platform_device *pdev)
@@ -1621,6 +1606,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	ret = devm_clk_bulk_get_all(dev, &pctl->clks);
+	if (ret < 0)
+		return ret;
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,25 +1620,20 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
-			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
-					     "failed to get clk\n");
-		}
 		i++;
 	}
 
+	ret = clk_bulk_prepare_enable(banks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	for_each_gpiochip_node(dev, child) {
 		ret = stm32_gpiolib_register_bank(pctl, child);
 		if (ret) {
 			fwnode_handle_put(child);
-
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
-			return ret;
+			goto err_clk;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1642,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+
+err_clk:
+	clk_bulk_disable_unprepare(banks, pctl->clks);
+	return ret;
 }
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
@@ -1726,10 +1714,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1724,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	ret = clk_bulk_enable(pctl->nbanks, pctl->clks);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1


