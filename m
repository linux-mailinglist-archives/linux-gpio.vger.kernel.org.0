Return-Path: <linux-gpio+bounces-14370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38F9FECC7
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 05:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426AD161967
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 04:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFC6145A0B;
	Tue, 31 Dec 2024 04:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7q0I9Nt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BBE249E5;
	Tue, 31 Dec 2024 04:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735619102; cv=none; b=Obj2frzPCrfG/HIeWmg8/04yy+agdlocwcJnCZIg9KmJFbnYGp3gcPYym0JNHkDB/RJ4ku365rFchUyWIhQiGdAZ2ZXWnsUOvBNrkdfYd541aMKSmS6HlZqs9bUkUVWhAoBG9+VrI7ef50ac6qc+KJyjVlnLREUFwRp6gA8EJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735619102; c=relaxed/simple;
	bh=u6wh1RX0dCYDcGjW9dUKEWu5sABiLGzJ1W2ycRPDLBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jr4BoM8PiTR0QCN3ynRecKTURv2aYV7JadViLOBkQZtiBuTSjaKEzAW87fMUNc/bpNOALj+2T6daC6yU3i5X9cdI6Ifaj8sRAwtBNgAYYnHLXLom2x/uBn8tOzsFXk1T5p9dXcLJOAGxgEB69g/8D7hMSz1zdsd8GClRJgK/xpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7q0I9Nt; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8442ec2adc7so363453739f.2;
        Mon, 30 Dec 2024 20:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735619100; x=1736223900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=;
        b=k7q0I9Ntiw65YG59fr2RDcdtD5Y1XMzprSXHK/RV+62XcGSDalM7wAD0cwl6MVUzoU
         YhavNeKuXuXC/s3g7lXuXuB/SRF533GVUTLK96Dhrk7MZxEuyzED4iAcVQUdCAIdtz6t
         VcKhvDdlRMnktSE9OcTjDrl2N4qA8iqnRuS8YK+OWl7M+iCPDGu+Rk4xBLswnhzO6QUZ
         GlvuxI2rytSuUcviL5SNJv2xfgPhu3HhTF43qmfPRYlHt98A/pIIwhNhEpiTdoB8EqC/
         ZMPn37LYLypJbbxH2ezgQQnOBGZKIzDCFDORVIHzcBcszJdgwZN1amsmPlOOkm5ulud7
         8gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735619100; x=1736223900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8V9K9na5hi5DyccRbFjWLo7NIv+AoHV6qIzmsllDmA8=;
        b=adbXvY6kBF/6tIaedLlQWQ4hrmMDcQ+ALFDEkI7Vk6b/zxNoN43Dtg7LRZWt4gjJbJ
         R1FQIir0NfpfbbQCpiFescLAK6xbPSdfHGyl1JBOl7bTFtRBoP5O/tmgjmZVfm7EII80
         JnAQs36HQU1ZPW4DBT8RMdXx4Sg9e6ecQVcUXE/y89VN1ycfszC9ezb9MwRiQeeDYMxx
         +MSj2kJ469ds4f+OFmPXMWEtEmJPvRYszkECpUIS8ShiYYtKGFjRtdYk3dkkiNAHECYQ
         cUQoZben2LqqnfDVX2gSX51Ig4LKGCoJi53AtwAS/jRXRSGdtX/WdBE/0WZbRWV8VwPU
         ZV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwZfifCtjYFZD2h4fOpI/TqOjuX1Nezqk53gh19LPXGJVXibDPX/8EYoLUWDkOn44oonN8+ePUhVao@vger.kernel.org, AJvYcCW015uwbVc4KT5yp9NB55rTQ2SJOdy+H5XV3zwZADQOQhJCCXavYgNm4GL8SYORxmMOXebzV9NN0aBD76CC@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZ7MBNwa9tpJbPKvBjUAupZKXgHi0r59TAincpwNLH28w73hx
	GIAeY5UKZuI7HDtqm7gV7qYMT3WaNFsLp6O/j27dC10jV26wCzqH
X-Gm-Gg: ASbGncuFa7bvFyXna4DEgSzhwJDYVpVEco67yoSs50f373Oft9SS0BBBE3qMtpt0QE0
	iGmUT058irxPMwpZE+IBFDhNWtBeKu2TOM2MezIhBh+D4e+l6KEDaj9wha9Va3F9Rw4FwmKfPFe
	r95hNw9iDQSrv55u2yyvYdALBqgNxFQsBHY/B8qDGoCXH75Opdbkq/5sZUcZopMtaNJe2YNZozc
	u5KGr50ebjwE6K/xU/gYrdfBj56IyHQuQ06ulm85jiNnxehTF4xJaikLLegCM7rOvRV
X-Google-Smtp-Source: AGHT+IFWciUZBXof1ClsDUD8qKNSVi/Is3uvZ/OcdGpT3wvFKtaZF6hzKy2H4IWFdlhfBLpQxrowkQ==
X-Received: by 2002:a05:6602:1503:b0:834:d7b6:4fea with SMTP id ca18e2360f4ac-8499e4cf6admr3595656639f.6.1735619099986;
        Mon, 30 Dec 2024 20:24:59 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e698e2e985sm5286933173.38.2024.12.30.20.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 20:24:58 -0800 (PST)
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
Subject: [PATCH v8] pinctrl: stm32: Add check for clk_enable()
Date: Mon, 30 Dec 2024 23:27:56 -0500
Message-Id: <20241231042756.3166495-1-zmw12306@gmail.com>
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 76 ++++++++++++---------------
 1 file changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..32c04391e2a0 100644
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
+			goto err_register;
 		}
 
 		pctl->nbanks++;
@@ -1658,6 +1642,16 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	dev_info(dev, "Pinctrl STM32 initialized\n");
 
 	return 0;
+
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
@@ -1726,10 +1720,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1730,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


