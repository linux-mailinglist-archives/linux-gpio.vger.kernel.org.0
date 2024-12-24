Return-Path: <linux-gpio+bounces-14220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0AD9FC1CE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 20:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58FFA16304A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2024 19:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D017018D63C;
	Tue, 24 Dec 2024 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0FyCeeO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F4716132F;
	Tue, 24 Dec 2024 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735070219; cv=none; b=IEtctCJ8llHnKmjC3wcwDi3bLf8Y7fm+o/Oj111z11zVpsForKLSSKXCT9xbxnMop5DdXGf2VBUuLs/nr9HZJ65tI1RodXVM+X1HGdARLd1FmNuko0UQOg/o/vEycIdT5MCpyKIkENE7l5b7nkjXM87TVzw+YNyjXWeRqUWyy5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735070219; c=relaxed/simple;
	bh=mjZ5CpBh6nKB4Yxeo8vN5nbbMmQydxSPB3ZEOTsKd2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U0ctOeZVV/pSFxhzAbB8DP280tLPAEuTDMCTb2wFZuyjaw3cyTgLQT8FXUwzH1Vw5rtmxPWzbhttiP+HyuNvyg/H+uk5fw2POVxRAnnIUSYK7PTOckMiKfmKPTXB+PNDbzt12JEzaQFhMlSrTWvmRxBBjQUyEHhc0cPlsmif/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0FyCeeO; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844de072603so491875839f.0;
        Tue, 24 Dec 2024 11:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735070217; x=1735675017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=;
        b=Z0FyCeeODUkog80bDMWIOE7EnwSg1qkPObDtcM/v9B45Jnl3AJoofOmOUoCRVTnp/4
         4ZZwn4/GIsJtEDbkeYNBVRtgKizxbTNcU2yE1SuWN4mEJMDVNuoSaUw0H0mQWLtT/BR2
         XHNlXDZshfKBtCw5Jn5pTMcM2G3TGKC7BRX3RsJ1FJaT33UXjpbiSoLLQ6Kfw630C9iE
         2QAUt/yHPmH2xPiCrVAz0HAIvLoo0zec5iKRJ8O+/Jzd2SeQ2cxU4pXb5MU7INbO5AAl
         BG9JChyZ6kswJiExwMomCz1+FJrrgHtQnZeHq2diZD4lS+wMzqs/nf5oXBQBeRtbRS1b
         XbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735070217; x=1735675017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpbE32YrRX7k68vHgrK8mf3gbDDES5zEOdwfZIy6I+0=;
        b=W+CzT7H4ecmSQP2fOth/pAAQNV/J5j30gnSAVX0ABX3kODm4sY/6uY404ShvO1iTg5
         aO5T1JF4e4dxhbCwp1+BS047TD19eRJgEL2VCwqx+LqsNhp85zlVDc+l4JutvNgGw5+b
         9q3+RodEK7dLTszbL2CMdIFWF2uPN9l4HFFLmgHlm6WfhS9VmqCTb1+9JpGoy0uZubzP
         XIE4fPJd1vJjNBSJ23cldfHGCec1TN7JBPW9qT/RWh2MrMSHGAQjRZv7xidPIRGt7nxB
         pW9y7CuF0sl14qIz1EhTaOQ6PLP+0Sc3vdBtc+C+2FxZcVjx26Z9R7MP+zrTK3IOxZb7
         F/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWTxDdS1oIOGgZOxIxmHoxVHQsGurnnDWFfy0HtoOKoZ4vXRBn+ydsMsrnOaOFNZUcbKOar1NOgathZ@vger.kernel.org, AJvYcCXOj2EBoXQ0eBaT2cwrQn3mlCviFwMiLfn5dh7UmbgjfyCoMsG06PAUaU7seh9Mv3s0nXDaBwXW4G5QLIoD@vger.kernel.org
X-Gm-Message-State: AOJu0YxsDfynTOGTLwpntw/JUVyHVEJiRjXJG8V5oX1uSZF+5Q15E1Ti
	taFXi9wbC06mxE0GcFQShOKDY9hVdqfLXSjelPZg0EySQKvvraJT
X-Gm-Gg: ASbGncuNMs6lDVIAbMr1AuB+mjwxtNQM/Wu4npuncRf3nFn6fOg2ue3pmu2xcpeGXRk
	qoy84X0ytNPWmus07PJxpjJSw7s3c4ssDAEv8HuezOtMxWIITThIg+eZ/c10dDuMLT20OU68OID
	hXAuKjn5yFvHHqq2lx6BgJstt8lJRNRaL1dQ4Xfwh1/rWqW1rUj/ZFePnU9CfZ9hgEXR2bXOwmf
	5jGZ/ZcUhZmWgAvSqYVoH5kf9Q7jgWjXxFv515aFHV5sr0OQAGO//ET1nfcAvQCyC2u
X-Google-Smtp-Source: AGHT+IHX4vrmb8xk5P7zI2PSaxST8v5YjWWt+HzJlZhWJGjYPjLwHvnt47dobMyGbrbLFCDBd6cTxQ==
X-Received: by 2002:a92:c24c:0:b0:3a7:c5cb:8bf3 with SMTP id e9e14a558f8ab-3c2d277f5aamr146379315ab.9.1735070217031;
        Tue, 24 Dec 2024 11:56:57 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0de053105sm29963655ab.15.2024.12.24.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 11:56:56 -0800 (PST)
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
Subject: [PATCH v7] pinctrl: stm32: Add check for clk_enable()
Date: Tue, 24 Dec 2024 15:00:00 -0500
Message-Id: <20241224200000.76661-1-zmw12306@gmail.com>
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


