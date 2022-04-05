Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C12074F40D5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243168AbiDEUUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443206AbiDEPjK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 11:39:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CBD147ADE;
        Tue,  5 Apr 2022 06:55:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E23F1B81BA9;
        Tue,  5 Apr 2022 13:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9451DC385A6;
        Tue,  5 Apr 2022 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649166902;
        bh=3tagcrRVOAEqHsMgZjnh8ALbmm4rYGMwZCoIbUkDEbM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gZNOYElhjmkUG0PJZWCKdlDkrf/6lNHkAAO62+/oa6OpMH3VBbta1E506jUT4bG5B
         qt1NHrzn+zmnkFrdisUhabRT82DMuUunITuXO5FWjLvGl/ph1SpWr6AKuSymUUiDEN
         BKb97DaTBQjWQBEquti4atNyK9Wf+NCFFdfZltgW+V7M5Q+668xbObakETFmDKUUgU
         NOvdZiepERfP0wfugc5SILfM2O0eiiY+vgP/flWM9deagyf5DO0kaguLpolW5M3YZL
         MrwOTiDLVYQQRcqR25t1pxnCiU38Lxh2nOHseyjbsDP0NxpFldkxHi6PDC9QyE8j4I
         JRedflZi8v9bw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nbje8-001q4g-Ix; Tue, 05 Apr 2022 14:55:00 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2 04/10] gpio: tegra186: Make the irqchip immutable
Date:   Tue,  5 Apr 2022 14:54:38 +0100
Message-Id: <20220405135444.199295-5-maz@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405135444.199295-1-maz@kernel.org>
References: <20220405135444.199295-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com, joey.gouly@arm.com, jonathanh@nvidia.com, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, bjorn.andersson@linaro.org, agross@kernel.org, jeffrey.l.hugo@gmail.com, tglx@linutronix.de, Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel-team@android.com, treding@nvidia.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Prevent gpiolib from messing with the irqchip by advertising
the irq_chip structure as immutable, making it const, and adding
the various calls that gpiolib relies upon.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpio-tegra186.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 031fe105b58e..84c4f1e9fb0c 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -80,7 +80,6 @@ struct tegra_gpio_soc {
 
 struct tegra_gpio {
 	struct gpio_chip gpio;
-	struct irq_chip intc;
 	unsigned int num_irq;
 	unsigned int *irq;
 
@@ -372,6 +371,8 @@ static void tegra186_irq_mask(struct irq_data *data)
 	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
 	value &= ~TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT;
 	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
+
+	gpiochip_disable_irq(&gpio->gpio, data->hwirq);
 }
 
 static void tegra186_irq_unmask(struct irq_data *data)
@@ -385,6 +386,8 @@ static void tegra186_irq_unmask(struct irq_data *data)
 	if (WARN_ON(base == NULL))
 		return;
 
+	gpiochip_enable_irq(&gpio->gpio, data->hwirq);
+
 	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
 	value |= TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT;
 	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
@@ -456,6 +459,24 @@ static int tegra186_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static void tegra186_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	seq_printf(p, dev_name(gc->parent));
+}
+
+static const struct irq_chip tegra186_gpio_irq_chip = {
+	.irq_ack		= tegra186_irq_ack,
+	.irq_mask		= tegra186_irq_mask,
+	.irq_unmask		= tegra186_irq_unmask,
+	.irq_set_type		= tegra186_irq_set_type,
+	.irq_set_wake		= tegra186_irq_set_wake,
+	.irq_print_chip		= tegra186_irq_print_chip,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static void tegra186_gpio_irq(struct irq_desc *desc)
 {
 	struct tegra_gpio *gpio = irq_desc_get_handler_data(desc);
@@ -760,15 +781,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
 #endif /* CONFIG_OF_GPIO */
 
-	gpio->intc.name = dev_name(&pdev->dev);
-	gpio->intc.irq_ack = tegra186_irq_ack;
-	gpio->intc.irq_mask = tegra186_irq_mask;
-	gpio->intc.irq_unmask = tegra186_irq_unmask;
-	gpio->intc.irq_set_type = tegra186_irq_set_type;
-	gpio->intc.irq_set_wake = tegra186_irq_set_wake;
-
 	irq = &gpio->gpio.irq;
-	irq->chip = &gpio->intc;
+	gpio_irq_chip_set_chip(irq, &tegra186_gpio_irq_chip);
 	irq->fwnode = of_node_to_fwnode(pdev->dev.of_node);
 	irq->child_to_parent_hwirq = tegra186_gpio_child_to_parent_hwirq;
 	irq->populate_parent_alloc_arg = tegra186_gpio_populate_parent_fwspec;
-- 
2.34.1

