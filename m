Return-Path: <linux-gpio+bounces-13896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C859F260D
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2024 21:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38F21165001
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2024 20:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C7A1BC08B;
	Sun, 15 Dec 2024 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSKBkW2Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204B282E1;
	Sun, 15 Dec 2024 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734295026; cv=none; b=gA435ZdoQJC/atGKrD6PlHMcNpvZCKQk6FCKK/XjfcGjQVoUkeNgX5Qf1NYIGtkKxxN48YtySF9RZoFTOy1uIsyWRt2eZf/5k1EPx86YP3VR4Kp/TxvteeDOamfCkbTZYJF1Q+0WUT5L5ce1t1fjkJdMQTYVDCqe/Wrvk77K7hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734295026; c=relaxed/simple;
	bh=X1K4wSau30fYA2lbnYeGwayHNblaat6aNKPSM756XCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=di4WYeR6M+jvcs3rkihRjx+GsfKcu5H/T4z7BfEqQitDbKIQan1kQkhkMYQUBFQD7bsq7t9BZA93ihjjf37TF6J/h/2xUHqDfINn6a2iXIxtLfCqQQl25QLpQ5uooU4r0BXLC6zJ9U11YkltUAAaMpLmO7jcIrgCnV1qT2O8Trg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSKBkW2Z; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844e61f3902so253408339f.0;
        Sun, 15 Dec 2024 12:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734295024; x=1734899824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=;
        b=ZSKBkW2ZzJkIZJH+z01bk9PpGLSVzNFO3+CDhqmDsxOadUVYQwcW7twzo8utGGqbod
         XgvSk0QA2lmgXkzAXbyX3hXg5NFUs4eEWiHqpELtTHyT4Qw0Yau7Ghk7R/kVXZpg3sbR
         aoaqGv26DhxE7VIVHlb/5P1aE/2GhWdEzkmr58ucmUY4lzn7yWnlHsVypNOC9O4TjOVn
         oLIptf1zXuI3IaoDP+8z8mdzScys5gelsDeOgcNWFGg8KfvaNPBcth+g1+FWbJIzBrao
         ShXIRsF8hEGq0ccwfO5FiazRmxNcitlu5vXeE3QtR+YmTkJNNZPB7Po9VekJBhwFaSxI
         d8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734295024; x=1734899824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTfdf5nMQc4EWge5pFOY3vdTy/j5chcCgYemMh7oSNk=;
        b=bPqhDL3Kt/7+2JjECNUNqtZ3u4+P3s5T5z4wUK2EcCU09UposMjLcSvNsYw+2NhraN
         g7BvAPTN9L9xDnfa1AQcM3mgl/1TRDFgmwRYdL0Ag70dBu+E3QRB9yluKVURhLb0XHCe
         8cNLzSWa7aQbSQ+ZOb2sNFo9vhp714DOdmvSR9W0DwQyl4Rmmb+Y1hFI/ww5t5pIna54
         OxG2v7tgkwpWp7A/NMxO+LqNdzqitAbgzTPpeQtAJoIOxmd1+2T+hNyIB7Gcof8GMPAE
         qxZDM0NYdNlgFCXFjLPLLCKaLWUSciVJBwi0188zHRxaO3TQQuARmmYfZDgHPO9FRm6b
         EANA==
X-Forwarded-Encrypted: i=1; AJvYcCVQzk6w8IyzfgwnbP7VMKXnnGVbsPURnple3nLMQsHTF7MadHEaz5GWL4F0uzVcPaYz4TYYa/agY4wF@vger.kernel.org, AJvYcCWQi8TGVHa6aYd0VKYMD1KXRaA0VGEgqepKGGWNwugm4F4CrvsrwkzmamSpumUGGj2zH1m0xW431dbZIBZa@vger.kernel.org
X-Gm-Message-State: AOJu0YwXyzAIyMB8b/TVxzU3lgzAogwhARDuJnWJHlSTul5Ck9rVS61z
	o2isIk6KifG1vt2OqvYTXZh1j5AEPicCOqx2agwqA2jNGfCNprzd
X-Gm-Gg: ASbGncslbxpA3DgGP87G9BKc56qN6/CeDB2WUwRpo8HbtVBcLm3P/TXdqZz45hOczgJ
	4vqC0GCNMgzO3asiAJ+cYOBjPe7kGSJc9O1l7z9+l3kFrJsuhCikxLiexMOSlNkcv7q2H8l3aiP
	NDMKiPnhLV5j9iAAq4hXWKnl7QlJD8aIEnSFEUA8y9yizTTpzOQiBh0qzb+quWLZuRns8ve1l3K
	30jXtoohg/ynz4ol9ZkpSC1CO/+25wAHqf266cAHXCLppQrMAPzaPdzgdpLGO7GKCJ6
X-Google-Smtp-Source: AGHT+IEgLKb6YqAkp/sb/aFLexcbRJzAt4rZw2ltZ964YL9/S1xZekP6D1npsz0NfYXIDmMoBDXGeA==
X-Received: by 2002:a05:6602:2b0e:b0:83d:e526:fde7 with SMTP id ca18e2360f4ac-844e87be5c6mr1146615539f.6.1734295023634;
        Sun, 15 Dec 2024 12:37:03 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a336bsm892166173.100.2024.12.15.12.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 12:37:02 -0800 (PST)
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
Subject: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
Date: Sun, 15 Dec 2024 15:40:14 -0500
Message-Id: <20241215204014.4076659-1-zmw12306@gmail.com>
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

v4 -> v5:
1. Move the clock handling from stm32_gpiolib_register_bank() 
and moving it to its caller.
2. Call clk_bulk_prepare_enable() in stm32_pctl_probe() 
and clk_bulk_disable_unprepare() for error.

v3 -> v4:
1. Add initialization for  pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 70 ++++++++++++---------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..5874a054dc48 100644
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
@@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
-			GFP_KERNEL);
+				   GFP_KERNEL);
 	if (!pctl->banks)
 		return -ENOMEM;
 
+	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
+				  GFP_KERNEL);
+	if (!pctl->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < banks; ++i)
+		pctl->clks[i].id = "";
+
 	i = 0;
 	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
@@ -1631,11 +1624,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 			return -EPROBE_DEFER;
 		}
-
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
@@ -1646,15 +1638,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1726,10 +1721,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1731,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


