Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33C740F655
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 12:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343924AbhIQKzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 06:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343904AbhIQKzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 06:55:40 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37D4C061574;
        Fri, 17 Sep 2021 03:54:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i23so14502047wrb.2;
        Fri, 17 Sep 2021 03:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=si4x9NoZruUfMwjjOkCcKTyRfQDxhp+QOI7/QUzui6w=;
        b=Wxb4CF/lG5HmSN+yBf/znISKPZSM5M73lUA6eroKyQH9OaqrcZ46HgmzXAVYhW9ltv
         k+WFR3VI31rvlGvKJkRQYaMH3eV+/6tiOlC3SR59VIzY+CLIWHnTncKUtjQVGZuOMxN5
         l0w+BoUVQDkKyl2TkpbA+BdA8dK0rDttMdeDfhyngNdO3zpWGm0pidi7/bMum/f35E59
         H0G/CVAARPDMpUVKq6BfvMwSuVswqRhA+wn3Nwxt0b3k8tgultdO5BGZKt55BhnayBQ1
         1q9idodfs9dOConk127JiC/12ja9jdolfFhrm9RuegyL+lK0Pa1Au26EFflkPMEIY1W9
         Mm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=si4x9NoZruUfMwjjOkCcKTyRfQDxhp+QOI7/QUzui6w=;
        b=xnV3/ylT4NMMsZFB4K/Fn4HqQBIL9ijgaTW1aTqVzwSrEgjdBaihUT6GEr/19bFGcv
         tM1mUALCwuyU5ZPw5hPEz6GozdKaWQeXbaTfUDdhNJd9+eyLRENs3+THTTvl4Ehndha/
         37hQf9dhFNHxWOUtOfr7CmLo+lUMY5qdr1dFc6Hto8xuMk0GTxOIDlx1+OZ2XUUJI9BT
         7mF9mBPQKm2cNlDz3TIjGZ4XX3HJ1DEUVZkmrIDWUgcNArDdRb4fWfLrB/r6o+v0mAg4
         MvY5VGHcIDldGflFA95C9JOly3cZDA50Pnkmzt2ckjOwXL4bQF46xfvHVrDKqqI1ytFk
         E7Ng==
X-Gm-Message-State: AOAM531ZvzaATdt5OC23lrnYyl+WvUz7z+WGTdzxK4qeuu58Nrc35gyi
        HQita2765vUCxLA6AuWF/tk=
X-Google-Smtp-Source: ABdhPJxmy7wVtNuzXGqMKfBmv2eVJNd77Vye4zFaPEvNep8dSDHKlAidj7poLfCcL7AUGmbKcVRQng==
X-Received: by 2002:adf:e603:: with SMTP id p3mr11408824wrm.357.1631876056587;
        Fri, 17 Sep 2021 03:54:16 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id i67sm1415531wmi.41.2021.09.17.03.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 03:54:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: tegra186: Support multiple interrupts per bank
Date:   Fri, 17 Sep 2021 12:54:12 +0200
Message-Id: <20210917105412.595539-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917105412.595539-1-thierry.reding@gmail.com>
References: <20210917105412.595539-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 and later support more than a single interrupt per bank. This
is primarily useful for virtualization but can also be helpful for more
fine-grained CPU affinity control. To keep things simple for now, route
all pins to the first interrupt.

For backwards-compatibility, support old device trees that specify only
one interrupt per bank by counting the interrupts at probe time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1bc4152e0275..c026e7141e4e 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -69,6 +69,8 @@ struct tegra_gpio_soc {
 	const char *name;
 	unsigned int instance;
 
+	unsigned int num_irqs_per_bank;
+
 	const struct tegra186_pin_range *pin_ranges;
 	unsigned int num_pin_ranges;
 	const char *pinmux;
@@ -452,7 +454,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 	struct irq_domain *domain = gpio->gpio.irq.domain;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int parent = irq_desc_get_irq(desc);
-	unsigned int i, offset = 0;
+	unsigned int i, j, offset = 0;
 
 	chained_irq_enter(chip, desc);
 
@@ -465,7 +467,12 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 		base = gpio->base + port->bank * 0x1000 + port->port * 0x200;
 
 		/* skip ports that are not associated with this bank */
-		if (parent != gpio->irq[port->bank])
+		for (j = 0; j < gpio->num_irqs_per_bank; j++) {
+			if (parent == gpio->irq[port->bank * gpio->num_irqs_per_bank + j])
+				break;
+		}
+
+		if (j == gpio->num_irqs_per_bank)
 			goto skip;
 
 		value = readl(base + TEGRA186_GPIO_INTERRUPT_STATUS(1));
@@ -567,6 +574,7 @@ static const struct of_device_id tegra186_pmc_of_match[] = {
 
 static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
 {
+	struct device *dev = gpio->gpio.parent;
 	unsigned int i, j;
 	u32 value;
 
@@ -585,12 +593,30 @@ static void tegra186_gpio_init_route_mapping(struct tegra_gpio *gpio)
 		 */
 		if ((value & TEGRA186_GPIO_CTL_SCR_SEC_REN) == 0 &&
 		    (value & TEGRA186_GPIO_CTL_SCR_SEC_WEN) == 0) {
-			for (j = 0; j < 8; j++) {
+			/*
+			 * On Tegra194 and later, each pin can be routed to one or more
+			 * interrupts.
+			 */
+			for (j = 0; j < gpio->num_irqs_per_bank; j++) {
+				dev_dbg(dev, "programming default interrupt routing for port %s\n",
+					port->name);
+
 				offset = TEGRA186_GPIO_INT_ROUTE_MAPPING(p, j);
 
-				value = readl(base + offset);
-				value = BIT(port->pins) - 1;
-				writel(value, base + offset);
+				/*
+				 * By default we only want to route GPIO pins to IRQ 0. This works
+				 * only under the assumption that we're running as the host kernel
+				 * and hence all GPIO pins are owned by Linux.
+				 *
+				 * For cases where Linux is the guest OS, the hypervisor will have
+				 * to configure the interrupt routing and pass only the valid
+				 * interrupts via device tree.
+				 */
+				if (j == 0) {
+					value = readl(base + offset);
+					value = BIT(port->pins) - 1;
+					writel(value, base + offset);
+				}
 			}
 		}
 	}
@@ -610,6 +636,9 @@ static unsigned int tegra186_gpio_irqs_per_bank(struct tegra_gpio *gpio)
 
 	gpio->num_irqs_per_bank = gpio->num_irq / gpio->num_banks;
 
+	if (gpio->num_irqs_per_bank > gpio->soc->num_irqs_per_bank)
+		goto error;
+
 	return 0;
 
 error:
@@ -766,7 +795,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		irq->parents = gpio->irq;
 	}
 
-	tegra186_gpio_init_route_mapping(gpio);
+	if (gpio->soc->num_irqs_per_bank > 1)
+		tegra186_gpio_init_route_mapping(gpio);
 
 	np = of_find_matching_node(NULL, tegra186_pmc_of_match);
 	if (np) {
@@ -833,6 +863,7 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.ports = tegra186_main_ports,
 	.name = "tegra186-gpio",
 	.instance = 0,
+	.num_irqs_per_bank = 1,
 };
 
 #define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -859,6 +890,7 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.ports = tegra186_aon_ports,
 	.name = "tegra186-gpio-aon",
 	.instance = 1,
+	.num_irqs_per_bank = 1,
 };
 
 #define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
@@ -910,6 +942,7 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.ports = tegra194_main_ports,
 	.name = "tegra194-gpio",
 	.instance = 0,
+	.num_irqs_per_bank = 8,
 	.num_pin_ranges = ARRAY_SIZE(tegra194_main_pin_ranges),
 	.pin_ranges = tegra194_main_pin_ranges,
 	.pinmux = "nvidia,tegra194-pinmux",
@@ -936,6 +969,7 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.ports = tegra194_aon_ports,
 	.name = "tegra194-gpio-aon",
 	.instance = 1,
+	.num_irqs_per_bank = 8,
 };
 
 static const struct of_device_id tegra186_gpio_of_match[] = {
-- 
2.33.0

