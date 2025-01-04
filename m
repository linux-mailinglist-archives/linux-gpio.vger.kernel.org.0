Return-Path: <linux-gpio+bounces-14498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7FBA01258
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 05:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83887163134
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 04:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C2C482DD;
	Sat,  4 Jan 2025 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWBUeT2T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00333C5;
	Sat,  4 Jan 2025 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735966465; cv=none; b=n56mArHe5cXMt4Kup8K/QFXwK9OWWEfR9aSID9bIRx0RjuLmfO0YFECr8XBL6Hy+Epa6EgpPeIqCEsive5KKm/SPE/DGzEOZ4RC+2YsAUFJiE+yqzla3B+V7oNKy/YdElfPxjKiPpyQ5W3ipjXbpDapfvZTCJfr0YskQHmNn9yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735966465; c=relaxed/simple;
	bh=mLv1xwxMVn6RiSqRlDh66Xz9clGQ7mkuJnjyjO9fNdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XYQd5S1aDdDGOjDtEM/cRf6c9hqVPAUbFgi9ld1OwTmxiphPjq28V+rW44nyY4qfTpnX1i+eIvGJ3CTLvxuDsxes7X8jEBW8YOD4+ZtKbdHg7ab60kGvXSlIVCD/YHuFbVPKtJ9wjyfVjQ9rVskGkO+FDNb7afotf23E/cwP8FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWBUeT2T; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46677ef6910so137161161cf.2;
        Fri, 03 Jan 2025 20:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735966463; x=1736571263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKtVNznWE9ivtuG9PazmrMJTjbIr3cgCBeROWg6IRwA=;
        b=eWBUeT2TpNMLM1XVx9rD+Q1YDR5oeN2fDNhzRy294u3Wi9DObj7Xb9nqRiNxn0LVq8
         OW20QSO1bG0/V8To5zSGt5Pgl9gD3SaiiP/JVc+bNiJs8v9CbcdTp4h/rp4vZSuhX/zB
         ixq/sezANA6BG9aK1pAWeNQN2yWEd1vcsJ1wvqc07pMDT9TZvsmzOEkQ5qSckScvjJoq
         np5h4Uxuigi1gUIG1RmfmKyteYhBXdaplaRszQGBaiQ04X9OQWZAXcUg4x0jXR4xxFOQ
         qTgBsUl081jAQpKr6MnF3Top1HNTivWhOWy1zVSPgh3OxSUl2lWno39APzGdZe91OFEK
         KYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735966463; x=1736571263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKtVNznWE9ivtuG9PazmrMJTjbIr3cgCBeROWg6IRwA=;
        b=cZ9yuccz6fya5D7uLiXXHgvniocG8jYht/1Iz7FhtWeyhQJXk/5t0STA50tpSG5TdO
         tWpCqkVLn8oLzikzmHlRmKfUTgqfuP9IvuHHa4vXiAMj0FMxQs4SPkOKJxuIFxhH54Ed
         aje1UItLYn8bK6VoFuiwxS3XYI0gjtosz3o/RKfp6DTlSTS1ODRJ/T7eSnleZrsF/WES
         GReLWQ+N+azKSuqP0H5pwWeRK2LyguTTyuuqGnfNG38MLbARDUEMpQgzSuJ7fkj+sY65
         +z0C6swIlHDh7IVUpSNtrN9k3pLSsrWAIUpmEI7QZaaEqjc2Zq8dnabO6giFXBj0oVS/
         kcqg==
X-Forwarded-Encrypted: i=1; AJvYcCV19bNv01+JPBRLSt43/X1KDDYl9bE+jZbahhWCUE5XXjkGqSDCU5xhE2hI4X1+JhJkCqPPlEDVQhXQYvey@vger.kernel.org, AJvYcCV8D47UwI8SbNIDXAIDcP5tcmBtAQx/B9mEqh7GjclbrYjtl9JMCfcCkM610kVSt6BYbwymFawE70q8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/fxGXi3cMoX7e16Ln5GH0VAC4mVWCMuotkKx1vVRMnsO77t6
	LJEFvDAX5cLR+mQABdyONZhozS/qM6IB9xN+Dx4jEzYoRrSNsUdA
X-Gm-Gg: ASbGncvaxgFqV3+dExWzyzqqFuhQqccZJe0TdS4TrI3v9mzws9HqnL5cyFFKoxbOnHb
	giUIg/TT7WsGeNbnloIEcR4EO0IisAIt67Ll0o5Ni+kfVyuUyWgvPnDfgyb0t+/GqmZ2BVbXnAE
	waLsfmfFxecjzGVlsKulFDtVdufFDbt6F+u0DC6lfMXEVUivqqPA83WLLrvimi6Prr6CEjYRgeI
	1bnR1ZOM6ZRyShqTvT9KirfS5L+pBAjZrudwnwJn4Sd5b0pywdDzLz7KxloEy86Vmmd
X-Google-Smtp-Source: AGHT+IGuRBycg0rPS7jWSLpZFMW1uJJeqNf+gkRAZpqLuLZIePatB2YLOX2g6/Z+dw35DEhFlFiIkQ==
X-Received: by 2002:ac8:7d42:0:b0:467:864b:dd6f with SMTP id d75a77b69052e-46a4a9bcd1emr787901711cf.54.1735966462878;
        Fri, 03 Jan 2025 20:54:22 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a106fsm151866871cf.38.2025.01.03.20.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 20:54:21 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: antonio.borneo@foss.st.com
Cc: marex@denx.de,
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
Subject: [PATCH v9] pinctrl: stm32: Add check for clk_enable()
Date: Fri,  3 Jan 2025 23:57:12 -0500
Message-Id: <20250104045712.1317024-1-zmw12306@gmail.com>
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

v8 -> v9:
1. Revert changes from v5 to v6.
2. Add assignment for clk id to avoid NULL pointer dereference.

v7 -> v8:
1. Remove all previously registered GPIO chips before disabling 
the clocks.

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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 79 ++++++++++++++-------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..cb6c107b7cdc 100644
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
@@ -1360,26 +1354,20 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
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
 		} else {
 			names[i] = NULL;
 		}
@@ -1390,15 +1378,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
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
@@ -1621,6 +1605,15 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
+				  GFP_KERNEL);
+	if (!pctl->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < banks; ++i)
+		pctl->clks[i].id = "pctl";
+
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1632,24 +1625,26 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 		}
 
-		bank->clk = of_clk_get_by_name(np, NULL);
-		if (IS_ERR(bank->clk)) {
+		pctl->clks[i].clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(pctl->clks[i].clk)) {
 			fwnode_handle_put(child);
-			return dev_err_probe(dev, PTR_ERR(bank->clk),
+			return dev_err_probe(dev, PTR_ERR(pctl->clks[i].clk),
 					     "failed to get clk\n");
 		}
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
+			goto err_register;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1653,15 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+err_register:
+	for (i = 0; i < pctl->nbanks; i++) {
+		struct stm32_gpio_bank *bank = &pctl->banks[i];
+
+		gpiochip_remove(&bank->gpio_chip);
+	}
+
+	clk_bulk_disable_unprepare(banks, pctl->clks);
+	return ret;
 }
 
 static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
@@ -1726,10 +1730,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1740,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


