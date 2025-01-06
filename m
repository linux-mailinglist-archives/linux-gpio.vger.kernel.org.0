Return-Path: <linux-gpio+bounces-14550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCFA03273
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 23:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D9B37A25EA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 22:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93771E0DE3;
	Mon,  6 Jan 2025 22:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmJIQJsI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E21DFE00;
	Mon,  6 Jan 2025 22:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201052; cv=none; b=TUF2CbwxFPJabs6rMRTRlLiNBM249rGo+ydjO6UGw8TV1RDAkbEDL2nWAdqfebW+Kmth9asUyUa3/+lNZZdmU1NKpbxxuSaSwqjGQtHmDaUyvWzKBCzQnUm7/BMb4SIgo+oVnSbWSNNBMlsvPqBR2rkEeVCySyRYqzDKXkatR94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201052; c=relaxed/simple;
	bh=at9np1z8Ck7wyx0Uk5qFx/MFfX+3ExRo99H/VjaKBlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tOW3B3EK8GG1sNw//gL7kGz+G70DICT0pacEbMj4fWh6cY4myUz4kTr6o5uGOnGACEpe5t2MpjKKAmjGh9UcP3nNn/fpdgShRrk99huimNymemEC2ktvotRHgWc6ag9wO2JEZz/my/e+sDz1kTpgSpqkfijQZiXHnKedzrjpTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmJIQJsI; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6ea711805so1673338185a.1;
        Mon, 06 Jan 2025 14:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736201048; x=1736805848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gE972PSUI18MWZ+RwXKg9FgJGGHphELoFtgsgAWfKDc=;
        b=KmJIQJsIdohcgCLn8sIFJFjsWZXLn3np0Jlf1fxRY9JlhPv2rKuMLUjATTF02njWoF
         EC30jH98zSxoUEQBeArSmOdlIyZ+PZq2fVL2XzAi0f+OrKssT3N4NgYrhTuME4879Ra8
         V9GYBgPpBaS1uZIMF3AYlmGkKkX1p4taIjo5Y1nw4MHbpVaEKe8rvu57pS7DSYzw5uWh
         AK1bEO0qi3+Mtz2CN9OHMKXs70h5QOjZ82/D+pYwm6fpRMqyQ+qFPjbsPirjlJ56AEGG
         INwlrND6cBxbYoe15e1urCqQqzzsTGAMIrCaa/oxtQEjLr0RxQk7i3Nw5sMYFoz1UXj3
         mdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736201048; x=1736805848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gE972PSUI18MWZ+RwXKg9FgJGGHphELoFtgsgAWfKDc=;
        b=E5NKTIuCjOIz0qhzUNAnRt5987JvXThKXxWtZrUzVcCgQS0CnSzsZhp+TIH/wGOtaZ
         IBd6YGWQjRXyFeW7N969GG/zX0UUSjwDlKCZdkPiWMk4bPfWGuW14c7AD06W0r44X5MJ
         HShglJfp0t/CN5SM97vg6Y8Q1Ks0+lV0KO8jxFZEEdfCEW4+I07ZfGZLOHi3VgZSnRP1
         e/CNaByd/5ezyw36ifybUba60VT+GRaIPfXI8GRg4Vm0EtinPtZ+l4nvt6w9JqoZxo4y
         dgPQE36LmA243BZbFKIleJ26J0r0HdwD9Hm/4VHActFI8d81hxv+IQFff8WNpbDDv+EB
         wXqg==
X-Forwarded-Encrypted: i=1; AJvYcCWW7YwBB6NsuTLbq3R8xqP3pLzXCnZBfEh9h7US1UnJBBdDpOzAawR2bmNyuTajbJFmZVWpFgKFtzT5mZsU@vger.kernel.org, AJvYcCXJP6NrkT979IdcBjm84cTFndVxnagIXXqBdi9XkdDEWYrddkMittB4H/jC5qgZkOw0g0p8k4Bj96Pl@vger.kernel.org
X-Gm-Message-State: AOJu0YzpVLnw/CxwtdedOT3s75QiUtrAYK8o1r/gZzAJz3JvhB11k4C0
	IEgY7vyPj1CIcOt3rPaexjCeW/etVSXk25UAyJIXPq44DTYssY+G
X-Gm-Gg: ASbGncv2kUUHOhN6Js7qLgR1dyTACLAK5emzdQLIiFB+wUgUTPKq+LRE82kmIIGbvwl
	p39hvIFqqeSlGxcENUR0Q9HHXmHdMzkwef6YjAS1cJBuRImIO0hAneYSUTrCJw+oEUiHoYqdoiY
	xC95eWJqS4RJpfmM9qfrV078vQyvtjU7XA1gNQMCoAazqJUnAUXmZNw5GoDVeaobmmsus5uywgq
	9KaGgc5MkKwsPCmKk+NMIIg5idPkMrkBp7Acn2LaRT4CaZx/DyKkTuLkmzhuIwHO+Fh
X-Google-Smtp-Source: AGHT+IGn0g8TEC3Aj/0e3OGDC3eL91fHDnZHW118aKg0tjM+B8b8FsO0SH7lTvnA8lvipg/jwXVjnQ==
X-Received: by 2002:a05:620a:19a0:b0:7b1:52a9:ae1d with SMTP id af79cd13be357-7b9ba716a1bmr10201657485a.6.1736201047754;
        Mon, 06 Jan 2025 14:04:07 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac30d378sm1541912685a.56.2025.01.06.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:04:06 -0800 (PST)
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
Subject: [PATCH v10] pinctrl: stm32: Add check for clk_enable()
Date: Mon,  6 Jan 2025 17:06:59 -0500
Message-Id: <20250106220659.2640365-1-zmw12306@gmail.com>
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

v9 -> v10:
1. Move the id assignment into pctl->clks[i].clk assignment loop.
2. Remove empty lines.

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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 76 +++++++++++++--------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..03f3f707d275 100644
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
@@ -1621,6 +1605,11 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
+				  GFP_KERNEL);
+	if (!pctl->clks)
+		return -ENOMEM;
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1632,24 +1621,27 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
+		pctl->clks[i].id = "pctl";
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
@@ -1658,6 +1650,15 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1726,10 +1727,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1737,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


