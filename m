Return-Path: <linux-gpio+bounces-17769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF1A68827
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 10:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7759880EB3
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F42571D5;
	Wed, 19 Mar 2025 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV08U90c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38339253320;
	Wed, 19 Mar 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376694; cv=none; b=pBWHMXkvcBvVLJLuhGORsmDQ5/KWI6mWGWIbBcQc+8nGJ88ezqu5iARZfsFtGnSLyuFdIaEbGO749hizYhJe5Jrq6wcKRdxp2R34u93gYpBaNKvzmSGFvtYGASSQ94nocM8I55AADHDmrJ20KhfB9RVQh/ISPVz7vi6fw/vzOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376694; c=relaxed/simple;
	bh=X95jK7dXfEpY1qM1mZq8gm6tuDS1sRSzbSKDDrKSl1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BxFv3y+n6XvIWe9dbxE35sevuUXIgy3jreF3WkXfKKcw6qAhQLMH78pGm2nqaPJevuLcvD+Ff2FErp3GSVjVO6A57ztGu0HxfijJj+2YpMYAvvk+xbDw3WZB9HFjs+QHgApxnZWtsehB178YWtnZBhN3f4Foq3j0r0G1kmFprxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV08U90c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F41C4CEEE;
	Wed, 19 Mar 2025 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376693;
	bh=X95jK7dXfEpY1qM1mZq8gm6tuDS1sRSzbSKDDrKSl1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nV08U90cffSUj0fOaIRr0bid2ksSbqHDRmWlsGWFVyYOtLgHqePbsTtevKfZfTOKX
	 BOqlcLvlkxEVaLrME8b/f48iOvGh2MNCAUWj8LnSAysj9RaO2sHur2d1EbwmGz4GHi
	 MZfLAjg4YRmn/Mb28MbJxsItMQBOP4CnrLo9tSe7m7rex7IDNoSvBOl95xElKA9b1T
	 ZwdaCeH+KQ4O/nfTDqwAKe69n5qFf1WwMUEupbKrLKOkGh+jKHe/JGey6VD/hHfD4O
	 kphueHQoHJBKb6sW4dKj330/eEUJX//ftRXqOPKnRMleQCypXqIvH8Ox0AmijT285h
	 hyHixyfsBDx8w==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Keerthy <j-keerthy@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 17/57] irqdomain: gpio: Switch to irq_domain_create_*()
Date: Wed, 19 Mar 2025 10:29:10 +0100
Message-ID: <20250319092951.37667-18-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

irq_domain_add_*() interfaces are going away as being obsolete now.
Switch to the preferred irq_domain_create_*() ones. Those differ in the
node parameter: They take more generic struct fwnode_handle instead of
struct device_node. Therefore, of_fwnode_handle() is added around the
original parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: "Uwe Kleine-König" <ukleinek@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpio-brcmstb.c   | 2 +-
 drivers/gpio/gpio-davinci.c   | 5 ++---
 drivers/gpio/gpio-em.c        | 5 +++--
 drivers/gpio/gpio-grgpio.c    | 2 +-
 drivers/gpio/gpio-lpc18xx.c   | 8 +++-----
 drivers/gpio/gpio-mvebu.c     | 2 +-
 drivers/gpio/gpio-mxc.c       | 2 +-
 drivers/gpio/gpio-mxs.c       | 4 ++--
 drivers/gpio/gpio-pxa.c       | 6 +++---
 drivers/gpio/gpio-rockchip.c  | 2 +-
 drivers/gpio/gpio-sa1100.c    | 2 +-
 drivers/gpio/gpio-sodaville.c | 2 +-
 drivers/gpio/gpio-tb10x.c     | 2 +-
 drivers/gpio/gpio-twl4030.c   | 5 ++---
 include/linux/gpio/driver.h   | 5 +++--
 15 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index ca3472977431..e7671bcd5c07 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -437,7 +437,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 	int err;
 
 	priv->irq_domain =
-		irq_domain_add_linear(np, priv->num_gpios,
+		irq_domain_create_linear(of_fwnode_handle(np), priv->num_gpios,
 				      &brcmstb_gpio_irq_domain_ops,
 				      priv);
 	if (!priv->irq_domain) {
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 63fc7888c1d4..3c3b3ed46d9b 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -479,9 +479,8 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 			return irq;
 		}
 
-		irq_domain = irq_domain_add_legacy(dev->of_node, ngpio, irq, 0,
-							&davinci_gpio_irq_ops,
-							chips);
+		irq_domain = irq_domain_create_legacy(of_fwnode_handle(dev->of_node), ngpio, irq, 0,
+						      &davinci_gpio_irq_ops, chips);
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
 			return -ENODEV;
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 6c862c572322..8d86f205f53e 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -323,8 +323,9 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_release_resources = em_gio_irq_relres;
 	irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_MASK_ON_SUSPEND;
 
-	p->irq_domain = irq_domain_add_simple(dev->of_node, ngpios, 0,
-					      &em_gio_irq_domain_ops, p);
+	p->irq_domain = irq_domain_create_simple(of_fwnode_handle(dev->of_node),
+						 ngpios, 0,
+						 &em_gio_irq_domain_ops, p);
 	if (!p->irq_domain) {
 		dev_err(dev, "cannot initialize irq domain\n");
 		return -ENXIO;
diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 30a0522ae735..641df8f2fd3d 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -397,7 +397,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 			return -EINVAL;
 		}
 
-		priv->domain = irq_domain_add_linear(np, gc->ngpio,
+		priv->domain = irq_domain_create_linear(of_fwnode_handle(np), gc->ngpio,
 						     &grgpio_irq_domain_ops,
 						     priv);
 		if (!priv->domain) {
diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index 2cf9fb4637a2..ae6182cce723 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -240,11 +240,9 @@ static int lpc18xx_gpio_pin_ic_probe(struct lpc18xx_gpio_chip *gc)
 
 	raw_spin_lock_init(&ic->lock);
 
-	ic->domain = irq_domain_add_hierarchy(parent_domain, 0,
-					      NR_LPC18XX_GPIO_PIN_IC_IRQS,
-					      dev->of_node,
-					      &lpc18xx_gpio_pin_ic_domain_ops,
-					      ic);
+	ic->domain = irq_domain_create_hierarchy(parent_domain, 0, NR_LPC18XX_GPIO_PIN_IC_IRQS,
+						 of_fwnode_handle(dev->of_node),
+						 &lpc18xx_gpio_pin_ic_domain_ops, ic);
 	if (!ic->domain) {
 		pr_err("unable to add irq domain\n");
 		ret = -ENODEV;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 3604abcb6fec..4055596faef7 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1242,7 +1242,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return 0;
 
 	mvchip->domain =
-	    irq_domain_add_linear(np, ngpios, &irq_generic_chip_ops, NULL);
+	    irq_domain_create_linear(of_fwnode_handle(np), ngpios, &irq_generic_chip_ops, NULL);
 	if (!mvchip->domain) {
 		dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT).\n",
 			mvchip->chip.label);
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 619b6fb9d833..74bc8f06a97a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -502,7 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}
 
-	port->domain = irq_domain_add_legacy(np, 32, irq_base, 0,
+	port->domain = irq_domain_create_legacy(of_fwnode_handle(np), 32, irq_base, 0,
 					     &irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err = -ENODEV;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 024ad077e98d..b418fbccb26c 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -303,8 +303,8 @@ static int mxs_gpio_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	port->domain = irq_domain_add_legacy(np, 32, irq_base, 0,
-					     &irq_domain_simple_ops, NULL);
+	port->domain = irq_domain_create_legacy(of_fwnode_handle(np), 32, irq_base, 0,
+						&irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err = -ENODEV;
 		goto out_iounmap;
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 91cea97255fa..c3dfaed45c43 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -636,9 +636,9 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	if (!pxa_last_gpio)
 		return -EINVAL;
 
-	pchip->irqdomain = irq_domain_add_legacy(pdev->dev.of_node,
-						 pxa_last_gpio + 1, irq_base,
-						 0, &pxa_irq_domain_ops, pchip);
+	pchip->irqdomain = irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node),
+						    pxa_last_gpio + 1, irq_base, 0,
+						    &pxa_irq_domain_ops, pchip);
 	if (!pchip->irqdomain)
 		return -ENOMEM;
 
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 01a3b3dac58b..c63352f2f1ec 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -521,7 +521,7 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	struct irq_chip_generic *gc;
 	int ret;
 
-	bank->domain = irq_domain_add_linear(bank->of_node, 32,
+	bank->domain = irq_domain_create_linear(of_fwnode_handle(bank->of_node), 32,
 					&irq_generic_chip_ops, NULL);
 	if (!bank->domain) {
 		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 242dad763ac4..3f3ee36bc3cb 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -319,7 +319,7 @@ void __init sa1100_init_gpio(void)
 
 	gpiochip_add_data(&sa1100_gpio_chip.chip, NULL);
 
-	sa1100_gpio_irqdomain = irq_domain_add_simple(NULL,
+	sa1100_gpio_irqdomain = irq_domain_create_simple(NULL,
 			28, IRQ_GPIO0,
 			&sa1100_gpio_irqdomain_ops, sgc);
 
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index c2a2c76c1652..6a3c4c625138 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -169,7 +169,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 			IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
 			IRQ_LEVEL | IRQ_NOPROBE);
 
-	sd->id = irq_domain_add_legacy(pdev->dev.of_node, SDV_NUM_PUB_GPIOS,
+	sd->id = irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node), SDV_NUM_PUB_GPIOS,
 				sd->irq_base, 0, &irq_domain_sdv_ops, sd);
 	if (!sd->id)
 		return -ENODEV;
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index b6335cde455f..8cf676fd0a0b 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -183,7 +183,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 		if (ret != 0)
 			return ret;
 
-		tb10x_gpio->domain = irq_domain_add_linear(np,
+		tb10x_gpio->domain = irq_domain_create_linear(of_fwnode_handle(np),
 						tb10x_gpio->gc.ngpio,
 						&irq_generic_chip_ops, NULL);
 		if (!tb10x_gpio->domain) {
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index bcd692229c7c..0d17985a5fdc 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -502,7 +502,6 @@ static void gpio_twl4030_power_off_action(void *data)
 static int gpio_twl4030_probe(struct platform_device *pdev)
 {
 	struct twl4030_gpio_platform_data *pdata;
-	struct device_node *node = pdev->dev.of_node;
 	struct gpio_twl4030_priv *priv;
 	int ret, irq_base;
 
@@ -524,8 +523,8 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 		return irq_base;
 	}
 
-	irq_domain_add_legacy(node, TWL4030_GPIO_MAX, irq_base, 0,
-			      &irq_domain_simple_ops, NULL);
+	irq_domain_create_legacy(of_fwnode_handle(pdev->dev.of_node), TWL4030_GPIO_MAX, irq_base, 0,
+				 &irq_domain_simple_ops, NULL);
 
 	ret = twl4030_sih_setup(&pdev->dev, TWL4030_MODULE_GPIO, irq_base);
 	if (ret < 0)
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4c0294a9104d..b53233051bee 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -287,8 +287,9 @@ struct gpio_irq_chip {
 	/**
 	 * @first:
 	 *
-	 * Required for static IRQ allocation. If set, irq_domain_add_simple()
-	 * will allocate and map all IRQs during initialization.
+	 * Required for static IRQ allocation. If set,
+	 * irq_domain_create_simple() will allocate and map all IRQs
+	 * during initialization.
 	 */
 	unsigned int first;
 
-- 
2.49.0


