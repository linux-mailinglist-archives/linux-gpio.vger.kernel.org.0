Return-Path: <linux-gpio+bounces-14145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF679FA92C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 03:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4AEB163979
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2024 02:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37CA18052;
	Mon, 23 Dec 2024 02:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn8cePv9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E73DDA8;
	Mon, 23 Dec 2024 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734919406; cv=none; b=OQIDgBCXWtqRahcYglMvVKrQSS6wQbdIwDZIBgJMBDw3zZkCpnhIFbAmpMC+mddeDKUfNJiHYl5/SmDTIajfMkinLwogdYSdI3H/VdowMJKVvS0D31/2/zdgBpakx5Az0r1VpZFcpR7FKgVChTCccloV2Gl95IAIJH+X1IHT7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734919406; c=relaxed/simple;
	bh=umYUkq1ytIQ5DSuo9Ba3z3ev6ww/YPm+fZtB8s3e5q8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oHK2AFPLNtHN5OFTVbARoODKf+vgxekILoFauv/vSnfKzopLxEySs28sCjMUB7Ic+rXTMbqUJ2DviKqueDi4Cx7gtkNRtRHcIUXFjxqJ604/cnk2iV+hjPVyG1pE844sgZxq5sgH9f7HP73E73o/FOzXG0+7Yel4zHA8Jy8nxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn8cePv9; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso317164039f.3;
        Sun, 22 Dec 2024 18:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734919404; x=1735524204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xSJsjcj6qOEXUjJ0CVtQMVpNqANaTh2TojnrhfBJYw=;
        b=Mn8cePv9KhCOrX1bXiu2LaNbrtKmxHQsqQ6Sg5vJ2cmGeXhR5njdBquojmtMLxmmXt
         rOEoLf+hFdFzRXPUzYmVAb+LFzImPVAJEE0xG5Cv9m8TVDrBHRj/lLaaGYhjQScMeFiB
         P44M1m53qinFBtHxI5X717GOGOLl6LqRwA2Z4N5IVuzJdb8sighYGDm/EPQIHLBpJglg
         Q/mBBybhl30zcR9iJjVwcFl2ffp8eIf+2w1/9CsBOHwtxlE4QEEk3E+d4BV/xTuiWBSk
         ewNBdOosLA4YYr735mkFLcok3QuAx6n9IWvXkH8VUtcr3DlcPJlZpimLB5ymEtclwpmG
         52ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734919404; x=1735524204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xSJsjcj6qOEXUjJ0CVtQMVpNqANaTh2TojnrhfBJYw=;
        b=JNaUqvdygNTc0RA0V8OKy7SS3sL4J4/58GI1QRW7k68e1uozdx8HiKY4FaMdEFevLp
         DL7rMO88xvqrofMc3wkWfK2RmDxOc9uIEf6yJXz4SJE4NHXYrzK340rjMUEh4a0QnltP
         hu82JYGcZK4hBMDNtQO9l2R4alkqNHAsM9kIT/I1yp7nacRhMtJUD0Q8aq3GEit88cWb
         LUeog3MlDPXYvIBOdD6zSgb9DV5CyqFc4ooi+xLMZ4EXNvw9kmfiWkLF3E3BLKHv9RnF
         ISF1c+VqUuH1e/u9w0S1sqbBZ72OxhcQp5hnJmJgJnkpiX7e+rpgfIWzllL03FK8fs+i
         tSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsM+hG5cQhmce/FBHgiHsovHZSuA4Luisub0xZRwwkXbHFM6JRWF8CwVn2hw+Pc9S4tP0u0jPDlXovpcuY@vger.kernel.org, AJvYcCXbTsK9nZddj3j0QgvFWhe60gbeQ8WjrwZ2q5qbSm3r1vntTGW+Ql+nZtaL7TJtxZ7oNxEOe8tEHvup@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFMizI+H+0ObQk+aCcEoSd4QLgiTpPxa5kdfO/qOx5IJth03M
	CTmcqo/9/qQyE8rC0mCfmKenibc9qtuAIM3urjYUlRu5u1rUN20V
X-Gm-Gg: ASbGnct9YG81AW+BWkYrvygt/9PMa3njTCj9HhBUQ1QCkks4sLnAN3OrcAijl9wjL1q
	y3RIJbOik+TjeVx9s0I72r7WJRjLTxTzti3r0VPwpv01DUWNwCCFY9f6VzJa/05Qtc3IzQmQUpA
	CVD8eNxNI0bzpP88X+wNlwFB19B6vWOhs5tEBzp3fVHw9Mldo3C4rJ8mKCsGy9Sss+biPulCAPa
	hnkNzYXjO97SbeKWFAX5jYPsJq7RmnCGcFAJA29RbsMoyRGLWw4ZBWryV77QXxajTvI
X-Google-Smtp-Source: AGHT+IFXSVIikuC4zfcUFG8mWYTfJ/hx7F+IP5PDPNnajsE2n+NPTRarFFKK4WonDsGoyc/2WmmPRQ==
X-Received: by 2002:a05:6602:3f92:b0:843:ebf1:16df with SMTP id ca18e2360f4ac-8499e65898emr881040539f.10.1734919403923;
        Sun, 22 Dec 2024 18:03:23 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8eb2c8sm198806439f.47.2024.12.22.18.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:03:22 -0800 (PST)
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
Subject: [PATCH v6] pinctrl: stm32: Add check for clk_enable()
Date: Sun, 22 Dec 2024 21:06:29 -0500
Message-Id: <20241223020629.3471182-1-zmw12306@gmail.com>
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 64 ++++++++++-----------------
 1 file changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..3efe976adf84 100644
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
@@ -1631,13 +1620,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
 
@@ -1646,15 +1628,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
-
 			return ret;
 		}
 
 		pctl->nbanks++;
 	}
 
+	ret = clk_bulk_prepare_enable(pctl->nbanks, pctl->clks);
+	if (ret) {
+		dev_err(dev, "failed to prepare_enable clk (%d)\n", ret);
+		return ret;
+	}
+
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
@@ -1726,10 +1711,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1721,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


