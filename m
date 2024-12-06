Return-Path: <linux-gpio+bounces-13601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020939E7A55
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 22:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C151F16B5D9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 21:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB7B1FFC5F;
	Fri,  6 Dec 2024 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9+uSzXQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F871C3C18;
	Fri,  6 Dec 2024 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733519084; cv=none; b=oDbGdtwSVTi8LSFjPPVKIYWJlofP+skLnn79sjnJn8DUTc/GkOaDcvbIrXOGrDyhZK1rdt4pOlDjYicxBlWQ2Ki6XGlmvYen/AfKOvyFCLOWD6WnXpd1K1Pyq44irCCZZemqYKsx3ECTgmW6bnUvg6gJhfMcEBJ2e2hvuq6bIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733519084; c=relaxed/simple;
	bh=M83fACsut8XvBVtcUvfBH8jP+xPV8I4U2WKYEJvzyBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UNnq+MrbcEWR9lSrKG1su1KwjSFeCUiqPcyLa69riaRtJV6IZQ20+Je6jZ9W4d1KMsOuviC8wCGTDqVICuDEeXpCoz+DbX9j73U47/KqV6ddbpe56976Ev/v09FvzIsvtm5qxTJrDiVVMQfqPjGaEPsoiSCETSliHpP7J4K0y7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9+uSzXQ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d8a2d0588bso21601946d6.2;
        Fri, 06 Dec 2024 13:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733519082; x=1734123882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=;
        b=W9+uSzXQC7c6x3XE015ZhyzBX9VWJJ/wOHi6NbkpRkZ2Ei1kbADx8gcof5Gtg7qcyO
         +Y+g3SYcVeUDQSXOj8JuPTV/KYwCuK9LZP7WXFG0YgRN4FxwB7ftRr575daY1n+Ysdlx
         AI0EMhNQOiSuNiR2MtIwwMwjo7tYuPO6hoW08Rp7atN4Es1z+6KbQSj7FqPDOaGtJhYn
         5pXyXekq0TRgXsCxjoJ9tPyX3en1rLLaXxwaQNfNOjY1AQFaQrKMb31C7oCi2v6ChA+f
         Um+e3RUcqDMR0g1WAH+xzacrF0BE1pRu893Y15HG9yM/02DtKI4wF7UluOE4MUtDjRJ0
         QPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733519082; x=1734123882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIsQxVZOmSisxuVH5z4x+NyiZyPKlPsv2rD1mEtYR5Y=;
        b=N3c48uSTKB0ihZB1lSXgPDlVWrv5vuXbfPkYeTeqXeypkP1ZxVJVW0RD+7IEnoWDjM
         sn6619aVnKMOzFqvB81TaYyJPBdENXBYbjM7ELKi/S6++NHXAe1cZ4jPwcrogZ10wB9r
         u4Vvqtzsf2ygQscz1BJrCuNcFp5q/gipmHZo1xcZEM7uS7HiXq2Ndc8+iYyjelHaoOgp
         Oba6DA2HO7jhoa3TE+nExFrnK/jPmah5Oq/ZC9Pi0n1RmczVaDOfCuUEERw54Lik5Rjq
         flskKp1mcG9ZQEIjFn/qtJk2wtBXsfE58MeSFmGFNcqgzHWtxyRS2p+3mFkhdXzEReEk
         fItw==
X-Forwarded-Encrypted: i=1; AJvYcCVdsoHb+hfPYPl64UE9vZxR5hIJ0/GJd9ib3iKUg+SNVKNFb4jIcmwZqTRjTcn3aHPS0TdqkY3Qobd+vj/c@vger.kernel.org, AJvYcCXdr/Rq6dD/BMBMOPHZchf5wSkpR64SVJSdXW2SXci82z9zg3JeX5oDGnC2Fu92FnU0SZHH8Zy/XtCz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm91FNIAlC6nWSP90nXH8GXlgy1IQ//7Dp8jvmSoXsXdIHU6x7
	T+KQWKr7qhrxfVBToeR6VNeQ8vl3ED1NQN16tAmC1PsO4HzkK6ht
X-Gm-Gg: ASbGncuOKmSk8rf/pgOqn0S5pUh5BAl78s6m4hflBCduGYRzncLmFLxh1yBjiNBUyM2
	7HhVh7fkGtpIi+2D6q3aOyJ2AONZ+LUWZjiTQBVNM2t5HyGitcnTyOVBci5mKBR/xHA/09JneB2
	thFpp0i4XBvwqT96YSmRfZOjqUDBB1zodFOy8kzBtqWX3Vun608jSvXHSyzQLwhDM3VZIkUQqd5
	3A7pYpsAnseIojxbiOoIlOlsXB/e1qNelJA/1jAtagk8sk4RfaTHayVniY1dA==
X-Google-Smtp-Source: AGHT+IEQdKZujTj7jjBxjOcAodQ9XvJwI3WBewZCeAsZZLW6wO5g4aM64JIpWh3fzo/92H8adS9G7Q==
X-Received: by 2002:a05:6214:20c3:b0:6d4:36ff:4358 with SMTP id 6a1803df08f44-6d8e718552amr89532996d6.25.1733519082094;
        Fri, 06 Dec 2024 13:04:42 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da675214sm23068256d6.11.2024.12.06.13.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 13:04:41 -0800 (PST)
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
Subject: [PATCH v2] pinctrl: stm32: Add check for clk_enable()
Date: Fri,  6 Dec 2024 16:08:00 -0500
Message-Id: <20241206210800.3346579-1-zmw12306@gmail.com>
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

v1 -> v2:

1. Convert the driver to clk_bulk*() API.
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..188de29ac281 100644
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
@@ -1647,7 +1646,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 			fwnode_handle_put(child);
 
 			for (i = 0; i < pctl->nbanks; i++)
-				clk_disable_unprepare(pctl->banks[i].clk);
+				clk_disable_unprepare(pctl->clks[i].clk);
 
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


