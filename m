Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEB340F652
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 12:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343894AbhIQKzj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 06:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242359AbhIQKzh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 06:55:37 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8306C061767;
        Fri, 17 Sep 2021 03:54:15 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id c190-20020a1c9ac7000000b0030b459ea869so1092791wme.4;
        Fri, 17 Sep 2021 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xbi2CxEi+IpEXJ5ypGdOvWg9Sd7CJbQdgWYZaFnG9uA=;
        b=LHc5TX4gPkLeB72kkkX1qmJ+n0DFlYYFGnfwrXePNYlxXegcanaBjNOPX6EM7iZb11
         SK6Fzp4OLuYIQ/oi/TscLON8XXA4bBeZMBm/Dp3g4LQfnpVCvtcA0wxYlAM6DVDTrx4r
         fX7Y/rgfu+NhkbppjuBBzDCK0BgUEaGnun0NnlD+ZZyiTH9w1nGwFEZcnLdSuV2gZxCa
         aBlUEUzO+aocFpi2Wtlvoo4Chl5rTH3dDPivQlk7PLCi9t+sbeH5Evi+9infST5XjXxt
         gN2LX4AfWAGyCt4+OMMHR2nSH4N9m4DPX77fBhDTtCDTmAWYHriHIu2AlPq6Q7LGdvHM
         X0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xbi2CxEi+IpEXJ5ypGdOvWg9Sd7CJbQdgWYZaFnG9uA=;
        b=FgZIRWQUzG/00lh1PCRxJgWng7zLXxxKkAEuNNCGNAQ6IUrvw01aRAqdSiz76Mzm1H
         uWp9y0U5hdtifnr5havIYe+bo+lZ0gXpcb2D8XMl1Bc58oLkWUanGNMMiwlzqjRQEiTQ
         zPAGj16dXQW1jLtkr7DTzofKupmF5CL8fL5yLAk9uU3yk4KD5LDyjyRt0qwsKU2qoQDH
         6wfEM0Sx+eL5KAvNe4CZFxU5WEo5Nq1l9yRao8SA2MX1urWJUtYA3CJ/EioDjeBZtzWm
         xTLbhqcAG5mOXb6x7Ou5shjxU0iyo5TfPifGTUfGw4d2C/4Nx46Zvm60Bm48cLn9tx7f
         2qag==
X-Gm-Message-State: AOAM533n+lPyO8ENyEpDP1NH0HPhZuPWmyUG32f6tZg2kgqswuys+ZQ1
        QusPKmzUHQj0xp2ACD8qkLwA/ZWGOb8=
X-Google-Smtp-Source: ABdhPJzTKzUQt4lNaGNVQPwITNzpxde4AGRnL7HjiBMjnBEF4nNiUsjGMXxAuTtKY3vm44lI3hPWtQ==
X-Received: by 2002:a1c:7ed3:: with SMTP id z202mr4372365wmc.152.1631876054322;
        Fri, 17 Sep 2021 03:54:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z13sm7582249wrs.90.2021.09.17.03.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 03:54:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: tegra186: Force one interrupt per bank
Date:   Fri, 17 Sep 2021 12:54:11 +0200
Message-Id: <20210917105412.595539-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Newer chips support up to 8 interrupts per bank, which can be useful to
balance the load and decrease latency. However, it also required a very
complicated interrupt routing to be set up. To keep things simple for
now, ensure that a single interrupt per bank is enforced, even if all
possible interrupts are described in device tree.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 68 ++++++++++++++++++++++++++++++++----
 1 file changed, 62 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index c99858f40a27..1bc4152e0275 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -81,6 +81,8 @@ struct tegra_gpio {
 	unsigned int *irq;
 
 	const struct tegra_gpio_soc *soc;
+	unsigned int num_irqs_per_bank;
+	unsigned int num_banks;
 
 	void __iomem *secure;
 	void __iomem *base;
@@ -594,6 +596,28 @@ static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
 	}
 }
 
+static unsigned int tegra186_gpio_irqs_per_bank(struct tegra_gpio *gpio)
+{
+	struct device *dev = gpio->gpio.parent;
+
+	if (gpio->num_irq > gpio->num_banks) {
+		if (gpio->num_irq % gpio->num_banks != 0)
+			goto error;
+	}
+
+	if (gpio->num_irq < gpio->num_banks)
+		goto error;
+
+	gpio->num_irqs_per_bank = gpio->num_irq / gpio->num_banks;
+
+	return 0;
+
+error:
+	dev_err(dev, "invalid number of interrupts (%u) for %u banks\n",
+		gpio->num_irq, gpio->num_banks);
+	return -EINVAL;
+}
+
 static int tegra186_gpio_probe(struct platform_device *pdev)
 {
 	unsigned int i, j, offset;
@@ -608,7 +632,17 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	gpio->soc = device_get_match_data(&pdev->dev);
+	gpio->gpio.label = gpio->soc->name;
+	gpio->gpio.parent = &pdev->dev;
+
+	/* count the number of banks in the controller */
+	for (i = 0; i < gpio->soc->num_ports; i++)
+		if (gpio->soc->ports[i].bank > gpio->num_banks)
+			gpio->num_banks = gpio->soc->ports[i].bank;
+
+	gpio->num_banks++;
 
+	/* get register apertures */
 	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
 	if (IS_ERR(gpio->secure)) {
 		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
@@ -629,6 +663,10 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->num_irq = err;
 
+	err = tegra186_gpio_irqs_per_bank(gpio);
+	if (err < 0)
+		return err;
+
 	gpio->irq = devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq),
 				 GFP_KERNEL);
 	if (!gpio->irq)
@@ -642,9 +680,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		gpio->irq[i] = err;
 	}
 
-	gpio->gpio.label = gpio->soc->name;
-	gpio->gpio.parent = &pdev->dev;
-
 	gpio->gpio.request = gpiochip_generic_request;
 	gpio->gpio.free = gpiochip_generic_free;
 	gpio->gpio.get_direction = tegra186_gpio_get_direction;
@@ -708,7 +743,30 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	irq->parent_handler = tegra186_gpio_irq;
 	irq->parent_handler_data = gpio;
 	irq->num_parents = gpio->num_irq;
-	irq->parents = gpio->irq;
+
+	/*
+	 * To simplify things, use a single interrupt per bank for now. Some
+	 * chips support up to 8 interrupts per bank, which can be useful to
+	 * distribute the load and decrease the processing latency for GPIOs
+	 * but it also requires a more complicated interrupt routing than we
+	 * currently program.
+	 */
+	if (gpio->num_irqs_per_bank > 1) {
+		irq->parents = devm_kcalloc(&pdev->dev, gpio->num_banks,
+					    sizeof(*irq->parents), GFP_KERNEL);
+		if (!irq->parents)
+			return -ENOMEM;
+
+		for (i = 0; i < gpio->num_banks; i++)
+			irq->parents[i] = gpio->irq[i * gpio->num_irqs_per_bank];
+
+		irq->num_parents = gpio->num_banks;
+	} else {
+		irq->num_parents = gpio->num_irq;
+		irq->parents = gpio->irq;
+	}
+
+	tegra186_gpio_init_route_mapping(gpio);
 
 	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
@@ -719,8 +777,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 	}
 
-	tegra186_gpio_init_route_mapping(gpio);
-
 	irq->map = devm_kcalloc(&pdev->dev, gpio->gpio.ngpio,
 				sizeof(*irq->map), GFP_KERNEL);
 	if (!irq->map)
-- 
2.33.0

