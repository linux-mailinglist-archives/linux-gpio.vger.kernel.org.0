Return-Path: <linux-gpio+bounces-13602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE79E7B22
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 22:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE38166BFE
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 21:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC20922C6E1;
	Fri,  6 Dec 2024 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKzVlPPH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ACB22C6C2;
	Fri,  6 Dec 2024 21:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733521199; cv=none; b=nLs6GyGPxkYDt0C/OULneRQGtwfczU3d7QcJJGPmmowFt0Vz9ZbhytNwVizAMLlwZoQT5Ut4GCcLiJzgPeeGn9Lev+NIBhw0b36TiaFVGSz0wpUwTOM0L9Ot1Rk0HVZPwWH56RyZB2s1ss28Yz36V+9OVdMtfuVCaSXJKoRc/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733521199; c=relaxed/simple;
	bh=ArcPzhginUvzo8hqwZ90kZqaeGNR8p7VkU1QkNSvbvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tg/+5g8gev0ohGcwLJ95qjTJ5QQb3rK9VNzhj9wHy22g4kQvTwDrOlDc8kbzP3DYPqe80AmC0gdZugg6OV6UaEuFzi7iqRlZ7j6DIPLrn/+LafN2xG9LNNx9u+UcU4Zd4d8+zmXFcC7AnFy87U+RrjAM7Hszgc2HkFvubcLY868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKzVlPPH; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6681e92b1so291837285a.0;
        Fri, 06 Dec 2024 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733521197; x=1734125997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=;
        b=GKzVlPPHFGhsM6BsoFJ8XB2kDOu2u5mVzSHrxHTr0xNDgQBwosP6SDAifQank/zUMO
         83dvPrdoJ2JidqG2fvFZ7lJaA6lUlWVbRVJbMelEXWTRpn3LJXs2bVie0/lu64VHZWj9
         pR1VbCxdT05Jf6HoBEEsY6lw5BLKUokLkkS9rSZpeXJoxWguPdng5QT82Ch3DkMRdV0Q
         9O6jOYqRf+7A1h7bEhRQCWPyOS8xfj6w03X80QmAka/vLlkpUSrSqGxJKLY3gF7pbdvF
         apvvisBVofpCGK7Htvl1uF9kMTGo8hDt10H5cutROetH9JMYckiRUmw6euOH7xMGurse
         x5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733521197; x=1734125997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhNrtrkwQMSxpIdT9BDntslWAjYECtg/oyySnSEisxE=;
        b=H+l9L5Tr6WxnH34QMYuxzNCXLZghSQYAe0IzYoZWhSKx7YVie27P8XmBOwO1ZTtlAD
         EiZxMCpotO/UNgZxCvZXfp59uNjIS1p2j1CVQsXlx+0IyAl8knfnYBk4xbewPZml1Y6t
         yJNvLJYLs7AakH6q9ST4a5UqD6LGwNdvTBsAJVqOjXRMju5QFyyercXQMl5EJPMyPVzE
         hFReeLr/iY6XdN0exz8mjJzeCy9hHMoJneHdkRVeT1rJtlWARe6sUx1tGW90Sv6vDif7
         BY5IY+dOe+7cJP8YZonw63TcOusQUJKllIF5lWjjXIbKNF9d7rvb+z6ujNKo3n4G1Zg+
         SpNg==
X-Forwarded-Encrypted: i=1; AJvYcCWtXfYPgW52CboEUdjNj9nVi5ta/nsBLIwzmdhJxE4tAfn06Q1YgzSvw4YwcA44i4EcZ6oBHSHE52seHqG8@vger.kernel.org, AJvYcCX1lRIQ22MhFd+8S53xtyx8qVTj2aK3wM6Tn2Hn2o6whuo4Hi4o+Fi9Hu5rrv1gPctlUucJlQQLB12p@vger.kernel.org
X-Gm-Message-State: AOJu0YykzF93Mv7I5Rf2x+WSYajQR1Sl5+s8vq0ysQbayWihZ/zxqskR
	snIWzssZUxV5zB2IzK+99i5o4uH43ANh4R8RmqICWyA6u5InPhbS
X-Gm-Gg: ASbGncsCZf0saYc/RZMylwOgygXVCJkX/fYsNyiqD7yGa1WpDr4vzZOORAgHJBGFb5T
	Yf9FnPrEA9WQuZU88HHbdM3bMkEkHY6+PyqT5WdgiOjC667HfmVN69XVNUlnuYxknThnbbW3xg8
	MVOLwPet2EzwXeSXsNAFbXCl6TbTm+dkcvnvHV6wyQHr7o5x5wd9jy8ak4ezwfoV0+vaJfoy/oJ
	FfIW6Trz3mVtLyCPFD88DnnvpnT/lq3aMnPkGMS2Yzp/UDJAMsUHJl32GuDCw==
X-Google-Smtp-Source: AGHT+IEEnGwLcZ6wgoSEVpifnZ7n698aIGd7Lu/CBlB0yurAYkGYemOCDvTincbiQGiudFkAp3rHqA==
X-Received: by 2002:a05:620a:2682:b0:7b6:7356:a19e with SMTP id af79cd13be357-7b6bcac22a4mr686886185a.7.1733521196806;
        Fri, 06 Dec 2024 13:39:56 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467451fa7fcsm3100801cf.9.2024.12.06.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 13:39:55 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: marex@denx.de
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
Subject: [PATCH v3] pinctrl: stm32: Add check for clk_enable()
Date: Fri,  6 Dec 2024 16:43:15 -0500
Message-Id: <20241206214315.3385033-1-zmw12306@gmail.com>
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

v2 -> v3:

1. Convert clk_disable_unprepare to clk_bulk_disable
and clk_bulk_unprepare.

v1 -> v2:

1. Move int ret declaration into if block.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 28 +++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..0ef912e82736 100644
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
 
@@ -1631,11 +1631,10 @@ int stm32_pctl_probe(struct platform_device *pdev)
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
@@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		if (ret) {
 			fwnode_handle_put(child);
 
-			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+			clk_bulk_disable(pctl->nbanks, pctl->clks);
+			clk_bulk_unprepare(pctl->nbanks, pctl->clks);
 
 			return ret;
 		}
@@ -1726,10 +1725,8 @@ static int __maybe_unused stm32_pinctrl_restore_gpio_regs(
 int __maybe_unused stm32_pinctrl_suspend(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_disable(pctl->banks[i].clk);
+	clk_bulk_disable(pctl->nbanks, pctl->clks);
 
 	return 0;
 }
@@ -1738,10 +1735,11 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
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


