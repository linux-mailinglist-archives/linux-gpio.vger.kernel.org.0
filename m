Return-Path: <linux-gpio+bounces-13846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1299F018E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 02:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86723188CCD8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 01:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3868472;
	Fri, 13 Dec 2024 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xuwr+D3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4578F629;
	Fri, 13 Dec 2024 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734052015; cv=none; b=megU9vQjsnjujM6BjRjvozp6Ay7yX9exIAi/e7ohcShGS7yzCGkdMAsqmo6DkNAsXJQ2JfBBUVYdUKuC+1S8r11L0S911eJGF+dOXrdUoLXuKLG+12upT1m23u0VCzPEVURyw7BX668Er0aDSX4a9ygZp6B2nhCK07HUvXatz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734052015; c=relaxed/simple;
	bh=n7wVq+1UCyrG6+zQt3uQKmOrBrFfDhp8VV/cRQQhCU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HH9SMesdhdRqrWSr1Ce8pFzqWVBzhk30GsiJOI2/NoS5WH4w+s8atlTekJaY0F/Qp4+Jqd02lumsNO0IA/Qpsc+OCW7dlJaZxxBkmH/jDrxWwACD+uhUVnBWtu0gZvzoQFaU5SJpXcygWyPH5GNAFEmngN33+AdyNgn/UZvMlpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xuwr+D3F; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844e12f702dso36632939f.3;
        Thu, 12 Dec 2024 17:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734052013; x=1734656813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=;
        b=Xuwr+D3FhhSQIckcDwangsAjZpi83SoSWHF3cAD3fOuNBHSyNvImfBECwNey/TXV61
         LNkPegz1UIt0QeuMadkWUWlS5gsn1qJcDg9YZbtdCR2HLODhG3jhvETHWDV7ra//I7Dn
         kyHEHz2EZASn1dE/jarPOhsYUKsQTztU0z/8Prj6Zx+B1zcNNgyU09d7bfVFYeam1R1Y
         V64MPnA6np8WUNR2OOmF0IovSnNG/jJxtsLJvFvvA50Tf4FSKLF2A0MPt5PGjTrIh8Js
         5AnNBpsALMcd0Kpjj+nhnKs6flhOM2uPM1Lx6Z8+Fp79dGuA3tLpWMHylWfFO8qajrd2
         qC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734052013; x=1734656813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2c/XwSCr59KYiV5COV+QijUTe/cctADBA4FfAWvsC6E=;
        b=LMgRMPE/WfgZClKMXOPtMZcWKwqfGoodH+XCxNgRd8ki7FPPLnAfIrN33IXIHeZYCu
         neOeY1HCpbNvCpllenTItawszfOso4iGJKDXT6PaMjJADN2xPrrqXvsICxyEF9xRU+7H
         MjUIoWHEA2WD2FI9VrYp2pn37yGYR9iRa7LDGu3innP6U2P3NydSPmv6b/Cj1BcaUEos
         DB9d7aY+iDQvWk2Mu+FceRTp3lgZ1AcGzRq5l5z+4MpsM2TfX75Gpp2EsFTGcan9vClj
         dA7727G2/WM8OmT2IXLIVly3yrG4Ca0kJLECvdE+BYLuulQxhS/OuVUgSYXpf9Fi5LNI
         KWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiECK9X9KNix0oWXCocb72lXwZ51JlNpT+FtfKaVba+2EGRrEwLXHTzqYZvR1yOihhNfRunkbb0V40@vger.kernel.org, AJvYcCX9F627GRmfyb51Wjv2hk5JqSVy5odXqyFmiPxt8pm4Be1vEQpyGFZk0O2R2gv1Zp7OHqxzp8UmNuDssdPi@vger.kernel.org
X-Gm-Message-State: AOJu0YwuO5bGdzVNzWKemABiUqlfznUVQOxeqdqv1EYUnZ338P8Ky8YC
	gRdLbyWddDIM+AXcK7BvmM+ZqwbJMXMPrulsbU46rqKKgOd5UwlW
X-Gm-Gg: ASbGncsR3Ldn7QInEKMl1qydlBC03vvXPjz9sdgIYsc4vjZ0/Lm8RuREhSndXjdnaC6
	QeQGkngbXFdoDrGCR6ooqURboIIXiMEZaay/jmy2FTfxyPHXU0zhwtrc0QU95p+HTDisdoQLMNE
	3mHGnvGDr7ROUGCiCNSiPVr/xerOX6DkN6C7GAuHWndd3ZQiSBfR5VXCxqXxvIRKd33qODQnQpX
	H+laT9DYqbHaSMjyWVQ505P7uTA5fVNA8EsE+hFNzgqZP167gTCHwYXXxwFi30rjP0t
X-Google-Smtp-Source: AGHT+IE0aRqUJwlA5+FNU6Sqc7UszAClayD0xVEQXFIIaM793yvcNU2uDJsHlxIEfHs4it75DfgO/g==
X-Received: by 2002:a05:6e02:13a5:b0:3a7:e0c0:5f0d with SMTP id e9e14a558f8ab-3aff4616f35mr9786085ab.3.1734052013275;
        Thu, 12 Dec 2024 17:06:53 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a9628ba832sm32644325ab.64.2024.12.12.17.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 17:06:51 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de,
	antonio.borneo@foss.st.com
Cc: linus.walleij@linaro.org,
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
Subject: [PATCH v4] pinctrl: stm32: Add check for clk_enable()
Date: Thu, 12 Dec 2024 20:09:48 -0500
Message-Id: <20241213010948.2623382-1-zmw12306@gmail.com>
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

v3 -> v4:
1. Add initialization for  pctl->clks.
2. Adjust alignment.

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 37 +++++++++++++++------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..427749d4f6a5 100644
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
@@ -1308,7 +1308,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (IS_ERR(bank->base))
 		return PTR_ERR(bank->base);
 
-	err = clk_prepare_enable(bank->clk);
+	err = clk_prepare_enable(pctl->clks[pctl->nbanks].clk);
 	if (err) {
 		dev_err(dev, "failed to prepare_enable clk (%d)\n", err);
 		return err;
@@ -1397,7 +1397,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	return 0;
 
 err_clk:
-	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(pctl->clks[pctl->nbanks].clk);
 	return err;
 }
 
@@ -1617,10 +1617,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1631,11 +1639,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1646,8 +1653,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+			clk_bulk_disable_unprepare(pctl->nbanks, pctl->clks);
 
 			return ret;
 		}
@@ -1726,10 +1732,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1742,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


