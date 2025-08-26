Return-Path: <linux-gpio+bounces-24971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03DEB3591B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 11:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80F28162FA7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C8C334375;
	Tue, 26 Aug 2025 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZDND5GCU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C61C321432
	for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200924; cv=none; b=OY5bgiA/ZGJBUiRA8tzZwz8akzxx0CrV+Kr4o0+txSvIAw04V8+tQAb3vI9M8nWXITNkvqbY9nzQoRoR61G7g/Hbwid6PyMLmbItu2zMShcjnAhn7fgVYaeWWu5RJKPRBRE/7YKYXLCgHWte1lqeXodG+XZ0jENBGrfnno/3mUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200924; c=relaxed/simple;
	bh=4pgJ76z8CLhArC9qYQdQzWo1qSAKNk492KC0kKL17oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p57eOSl36kP1rLxnPDscbziLA+tgZZ7QtppOq3F+dXgxSFsaBUnz6rMQHfErTtlSDvrVaxBkxvb+vKCJPklLiUzUUGNaO5lJcj/vx8FktcvO6JH0HUL84pdzfRY5s1ynpB4rMaCcTTmiE4d5hG9Oqf7GPiYbfRDMP0hWIMdLCWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZDND5GCU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3c51f015a1cso2587459f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Aug 2025 02:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200921; x=1756805721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAicBEYxH4Wq0iMqjkmBP1ydMlvyJQbxDwaiB57cyeU=;
        b=ZDND5GCUr91HA79SOEG+VxkitfO9fOixTXuDJmcLwkTod+5tXDNGivmy/euqudQiZa
         NRzAzhOBsAQfEq7LDyaOfQUmntkzV3mYGuQd0KFVOfkQ6il6HSm18CcG1DxhAFe/qAkt
         5yMiP4NqxLm3rrbcNwOjzNseXhCO1pTyTYVz0FKkiUBHmA/14Kll7Jo1NE44bPxn2+2t
         1nFOkg+Qsf47v2MakJdjS0kB1vhmWitKjKUGQ/AuWfxsWDWQgY3gQtCNesSzD8CY7y0X
         5fmjVpbJ/oAZLhkMjDFj8U4i7UAV2zAD2XhqgXs6eg2aomwrgGCKpQnl3LFSSO6UQo0y
         VSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200921; x=1756805721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAicBEYxH4Wq0iMqjkmBP1ydMlvyJQbxDwaiB57cyeU=;
        b=IkCpjhLHVdUzgc9SNKdZP/Ckhg7j6jb8sMyPBccASSYq9fsxTmSvSzH3nv0Ltcle0/
         CzVkZP4n0l7V0mUeEGgRldewJy8TP+XHUioNkbL5SoLc6lqoVm08UunrDSIKRmQlXAdw
         sk1qZiaIpRSuulrqFgLSdAMC17cnRZe4qhUOh7Sr2fsMjhY+gph3u+vsfiaeLX8iOEji
         wKsgzXIn+0TKErS49hrlOhLwc1pbfZYmbZKc4vm1goG/ejW2X4Zsn1L30t3cLqJuni4/
         5zgAgqhFgye07M5eclB4eQEZYe1AHzBxikyRqAtKcjn3LZRPQCrFrETkLmTpFz2KfUa/
         0Y1Q==
X-Gm-Message-State: AOJu0YzW9/VmKS1boHVNC0IRlhSBsbcWuRkWMoObOM21o0sMMomaEcxu
	codvJXIY0G1o3syUuvGyorbMFYigWjz+bcancRrq2ahc6ZrITBn8d+fN4fsFKKMsrDw=
X-Gm-Gg: ASbGncue2QX8ZzyEgMV0qwmt6aDrrgqj67blkRS3fGwmSxsKDf7OYrMmh6jisOpk3mi
	ZfnLkC6EhnbjGDt48PwKuYSj9mRUmFSX9Uq+DI7J1nV8RSLPszi9oe85Vw3titLz+V9Zbzh0QVI
	CaFa86c9MP3DHQB9BptOJA8doF6WGDeiaIZ8N4tJ2qReCGmiNoYryYJ+Tl1CC5b0r062Tbbtnei
	a9IDbZ2Z1REe8r6qa/gAHlIpJqWSQiEoxp68atV+a57fsS+qOHb9na/+lf4cLAQ5xaRfPtp8cI0
	Jq1fvKcSTDouRuRe11RK0Br/kDCul+FZ/5NIV+gzvjHheaZgbyhWcAFIS5J34mv1EHLWVbqAf6A
	h7ftADFeq9VyWey9k
X-Google-Smtp-Source: AGHT+IFpS9xXWMY2Dm1hPaoX2TY/sMKcuRIGpn0bg1DjysIZvtrpX2vCzH3rGMaLHK0/5fha31aU9w==
X-Received: by 2002:a5d:5d87:0:b0:3c9:469d:c054 with SMTP id ffacd0b85a97d-3c9469dc236mr4724123f8f.63.1756200920562;
        Tue, 26 Aug 2025 02:35:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:35:09 +0200
Subject: [PATCH 08/12] gpio: ftgpio010: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-8-f67603e4b27e@linaro.org>
References: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
In-Reply-To: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3151;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sNq5AHyzS/pQA5YDfBiBOreqsVgAub+i5MXKUwXqNI0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/N4KYXmzF6Cg0MaDbG0pp3RTIGwO49gGsAe
 qJ9pzvJqjSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/zQAKCRARpy6gFHHX
 cjcND/9da8AdGmBg/JbIu1BPLF5WyvYdgdS+Dl7+Ag6JInBicBZinpzZjhoKyKl3aTkYpdrI0D4
 xsleetUZK9dsiSv2qpRP9K27n5kBSYdsvp6wY9Nx6IH3PgR/k9UYkuSgCoj0yJBe0XfUVwrG3LB
 XhTucuLiOuJ6JTZYCIkxENv80ts3hYZPj+pbR80RymELfoGEdY6JwsJHji424KuSWmJjN1sCap9
 TgMDX+RQZ22zRItzzh8tmBRRuiLkK4K14fH11aUfrRaE2Fazi0f5/+oimccLNXKtsDov35sksbj
 OoNnf8hH982iL5RF7zyI1h6qWTARAotWgvYp36flEp4aB1G1dXrarhSP5i6vFoq8TbbndY04mXD
 ysBeHSj3AqZuKJKzeeO8DTytdX+NqBRH4hcpRLKUdo778w+cIywo+03hi4W24kXSlbJShIf3nq7
 guElSKzFW4Ez3KW1Enz9YcBi6zfQ3DDtqKU1k4Fy2DtHrpjKH+4I1VfXpYsOhM2i3BdrNX/mIuT
 akAlgu12pLzJmh1PRhpDJ4B+r1TWbjoMzjGbI3pFuTEfWg693E0c5XHusfIFbVRe9TuaQfCJMpG
 w7+/+E/XjaRS6BUWGCA+RYXMWtf9HT3fIbglLkNl+48fZ892Fhb+TKXqih6xN6trIbg4J1mgBDT
 /GvsEwTjY4IVjrA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ftgpio010.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 56666ca8889bc92b91b160751728b65e287b0123..dfa2c9444960a304d411e8d20db9bce0f8afa1c6 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -14,6 +14,7 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
@@ -41,13 +42,13 @@
 /**
  * struct ftgpio_gpio - Gemini GPIO state container
  * @dev: containing device for this instance
- * @gc: gpiochip for this instance
+ * @chip: generic GPIO chip for this instance
  * @base: remapped I/O-memory base
  * @clk: silicon clock
  */
 struct ftgpio_gpio {
 	struct device *dev;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	struct clk *clk;
 };
@@ -234,6 +235,7 @@ static const struct irq_chip ftgpio_irq_chip = {
 
 static int ftgpio_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ftgpio_gpio *g;
 	struct gpio_irq_chip *girq;
@@ -262,27 +264,30 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 		 */
 		return PTR_ERR(g->clk);
 
-	ret = bgpio_init(&g->gc, dev, 4,
-			 g->base + GPIO_DATA_IN,
-			 g->base + GPIO_DATA_SET,
-			 g->base + GPIO_DATA_CLR,
-			 g->base + GPIO_DIR,
-			 NULL,
-			 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = g->base + GPIO_DATA_IN,
+		.set = g->base + GPIO_DATA_SET,
+		.clr = g->base + GPIO_DATA_CLR,
+		.dirout = g->base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&g->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
 
-	g->gc.label = dev_name(dev);
-	g->gc.base = -1;
-	g->gc.parent = dev;
-	g->gc.owner = THIS_MODULE;
-	/* ngpio is set by bgpio_init() */
+	g->chip.gc.label = dev_name(dev);
+	g->chip.gc.base = -1;
+	g->chip.gc.parent = dev;
+	g->chip.gc.owner = THIS_MODULE;
+	/* ngpio is set by gpio_generic_chip_init() */
 
 	/* We need a silicon clock to do debounce */
 	if (!IS_ERR(g->clk))
-		g->gc.set_config = ftgpio_gpio_set_config;
+		g->chip.gc.set_config = ftgpio_gpio_set_config;
 
-	girq = &g->gc.irq;
+	girq = &g->chip.gc.irq;
 	gpio_irq_chip_set_chip(girq, &ftgpio_irq_chip);
 	girq->parent_handler = ftgpio_gpio_irq_handler;
 	girq->num_parents = 1;
@@ -303,7 +308,7 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	/* Clear any use of debounce */
 	writel(0x0, g->base + GPIO_DEBOUNCE_EN);
 
-	return devm_gpiochip_add_data(dev, &g->gc, g);
+	return devm_gpiochip_add_data(dev, &g->chip.gc, g);
 }
 
 static const struct of_device_id ftgpio_gpio_of_match[] = {

-- 
2.48.1


