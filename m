Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126B63231AA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 20:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhBWTzT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 14:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhBWTzR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 14:55:17 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B775BC06174A
        for <linux-gpio@vger.kernel.org>; Tue, 23 Feb 2021 11:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ELKWjc28e8qudAUWNAHkXV6NzdifjV/BkFHrLvQR5NY=; b=vHcjeUPtEgRMOqMoNp0A6SOZ2A
        C9YfaEMuk/yHOEOjmkLiZ/BPg60yes6uM09eR2cQ+sKx2n5zDhf//Wds5/M2UX2N1A5EulF82BBgL
        waZ9apZOHIy62kleZSUtz3gwXQwDxRM7Nr8MqkX/J8vIPiyIeCUFTuemsNrINi5BnxGJLB8snazkp
        Dt2N2GYkMPD427IRg7dLbKcsAOZJzeHqK9PfMid0RCMDNlhE0XcHq8qXgwMZkjbCWDAxXRlZsFGmE
        p2a3KFVnog3jlgBLfPRAeJpx10W7rZIugMb8blPwRXanLqf3FnXsBUYS1uw+e+PY32lKTOlx+LORv
        YU7X67BA==;
Received: from 194-168-191-90.dyn.estpak.ee ([90.191.168.194] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lEdlT-0005lZ-EL; Tue, 23 Feb 2021 21:54:36 +0200
Received: by ubuntu (sSMTP sendmail emulation); Tue, 23 Feb 2021 21:54:23 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Cc:     Mauri Sandberg <sandberg@mailfence.com>
Subject: [PATCH] gpio: driver for the NXP 74HC153 chip
Date:   Tue, 23 Feb 2021 21:53:26 +0200
Message-Id: <20210223195326.1355245-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223195326.1355245-1-sandberg@mailfence.com>
References: <20210223195326.1355245-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.168.194
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support for NXP 74HC153 Dual 4-input Multiplexer. This provides a GPIO
interface supporting input mode only

74HCT153 is a dual 4-input multiplexer. The device features independent
enable inputs (nE) and common data select inputs (S0 and S1). For each
multiplexer, the select inputs select one of the four binary inputs and
routes it to the multiplexer output (nY).

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 drivers/gpio/Kconfig            |   8 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-nxp-74hc153.c | 291 ++++++++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)
 create mode 100644 drivers/gpio/gpio-nxp-74hc153.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fa225175e68d..62c3aa34ae6e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1645,4 +1645,12 @@ config GPIO_MOCKUP
 
 endmenu
 
+comment "Other GPIO expanders"
+
+config GPIO_NXP_74HC153
+	tristate "NXP 74HC153 Dual 4-input multiplexer"
+	help
+	  Support for NXP 74HC153 Dual 4-input Multiplexer. This
+	  provides a GPIO interface supporting input mode only.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 35e3b6026665..3e4f48e7fd61 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -108,6 +108,7 @@ obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
+obj-$(CONFIG_GPIO_NXP_74HC153)		+= gpio-nxp-74hc153.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
diff --git a/drivers/gpio/gpio-nxp-74hc153.c b/drivers/gpio/gpio-nxp-74hc153.c
new file mode 100644
index 000000000000..f683547cfd6b
--- /dev/null
+++ b/drivers/gpio/gpio-nxp-74hc153.c
@@ -0,0 +1,291 @@
+/*
+ *  NXP 74HC153 - Dual 4-input multiplexer GPIO driver
+ *
+ *  Copyright (C) 2010 Gabor Juhos <juhosg@openwrt.org>
+ *  Copyright (C) 2020 Mauri Sandberg <sandberg@mailfence.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ *
+ *  Example device tree definition:
+ *
+ *  gpio-extender {
+ *    compatible = "nxp,74hc153-gpio";
+ *    gpio-controller;
+ *    #gpio-cells = <2>;
+ *
+ *    // GPIOs used by this node
+ *    gpio-s0 = <&gpio 9 GPIO_ACTIVE_HIGH>;
+ *    gpio-s1 = <&gpio 11 GPIO_ACTIVE_HIGH>;
+ *    gpio-1y = <&gpio 12 GPIO_ACTIVE_HIGH>;
+ *    gpio-2y = <&gpio 14 GPIO_ACTIVE_HIGH>;
+ *  };
+ *
+ */
+
+#include <linux/version.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/gpio.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/of_gpio.h>
+
+#define NXP_74HC153_NUM_GPIOS   8
+#define NXP_74HC153_S0_MASK     0x1
+#define NXP_74HC153_S1_MASK     0x2
+#define NXP_74HC153_BANK_MASK   0x4
+
+#define NXP_74HC153_DRIVER_NAME "nxp-74hc153"
+
+struct nxp_74hc153_config {
+	unsigned gpio_pin_s0;
+	unsigned gpio_pin_s1;
+	unsigned gpio_pin_1y;
+	unsigned gpio_pin_2y;
+};
+
+struct nxp_74hc153_chip {
+	struct device             *parent;
+	struct gpio_chip          gpio_chip;
+	struct mutex              lock;
+	struct nxp_74hc153_config config;
+};
+
+static struct nxp_74hc153_chip *gpio_to_nxp(struct gpio_chip *gc)
+{
+	return container_of(gc, struct nxp_74hc153_chip, gpio_chip);
+}
+
+static int nxp_74hc153_direction_input(struct gpio_chip *gc, unsigned offset)
+{
+	return 0;
+}
+
+static int nxp_74hc153_direction_output(struct gpio_chip *gc,
+					unsigned offset, int val)
+{
+	return -EINVAL;
+}
+
+static int nxp_74hc153_get_value(struct gpio_chip *gc, unsigned offset)
+{
+	struct nxp_74hc153_chip *nxp;
+	struct nxp_74hc153_platform_data *pdata;
+	unsigned s0;
+	unsigned s1;
+	unsigned pin;
+	int ret;
+
+	nxp = gpio_to_nxp(gc);
+	pdata = nxp->parent->platform_data;
+
+	s0 = !!(offset & NXP_74HC153_S0_MASK);
+	s1 = !!(offset & NXP_74HC153_S1_MASK);
+	pin = (offset & NXP_74HC153_BANK_MASK) ? nxp->config.gpio_pin_2y
+	                                       : nxp->config.gpio_pin_1y;
+
+	mutex_lock(&nxp->lock);
+	gpio_set_value(nxp->config.gpio_pin_s0, s0);
+	gpio_set_value(nxp->config.gpio_pin_s1, s1);
+	ret = gpio_get_value(pin);
+	mutex_unlock(&nxp->lock);
+
+	return ret;
+}
+
+static void nxp_74hc153_set_value(struct gpio_chip *gc,
+	unsigned offset, int val)
+{
+	/* not supported */
+}
+
+static int nxp_74hc153_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct nxp_74hc153_chip *nxp;
+	struct gpio_chip *gc;
+	int err;
+	unsigned gpio_s0;
+	unsigned gpio_s1;
+	unsigned gpio_1y;
+        unsigned gpio_2y;
+
+	nxp = kzalloc(sizeof(struct nxp_74hc153_chip), GFP_KERNEL);
+	if (nxp == NULL) {
+		dev_err(&pdev->dev, "no memory for private data\n");
+		return -ENOMEM;
+	}
+
+	gpio_s0 = of_get_named_gpio(np, "gpio-s0", 0);
+	gpio_s1 = of_get_named_gpio(np, "gpio-s1", 0);
+	gpio_1y = of_get_named_gpio(np, "gpio-1y", 0);
+	gpio_2y = of_get_named_gpio(np, "gpio-2y", 0);
+
+	if (!gpio_is_valid(gpio_s0) || !gpio_is_valid(gpio_s1) ||
+  	    !gpio_is_valid(gpio_1y) || !gpio_is_valid(gpio_2y)) {
+
+		dev_err(&pdev->dev, "control GPIO(s) are missing\n");
+		err = -EINVAL;
+		goto err_free_nxp;
+	} else {
+		nxp->config.gpio_pin_s0 = gpio_s0;
+		nxp->config.gpio_pin_s1 = gpio_s1;
+		nxp->config.gpio_pin_1y = gpio_1y;
+		nxp->config.gpio_pin_2y = gpio_2y;
+	}
+
+	// apply pin configuration
+	err = gpio_request(nxp->config.gpio_pin_s0, dev_name(&pdev->dev));
+	if (err) {
+		dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
+			nxp->config.gpio_pin_s0, err);
+		goto err_free_nxp;
+	}
+
+	err = gpio_request(nxp->config.gpio_pin_s1, dev_name(&pdev->dev));
+	if (err) {
+		dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
+			nxp->config.gpio_pin_s1, err);
+		goto err_free_s0;
+	}
+
+	err = gpio_request(nxp->config.gpio_pin_1y, dev_name(&pdev->dev));
+	if (err) {
+		dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
+			nxp->config.gpio_pin_1y, err);
+		goto err_free_s1;
+	}
+
+	err = gpio_request(nxp->config.gpio_pin_2y, dev_name(&pdev->dev));
+	if (err) {
+		dev_err(&pdev->dev, "unable to claim gpio %u, err=%d\n",
+			nxp->config.gpio_pin_2y, err);
+		goto err_free_1y;
+	}
+
+	err = gpio_direction_output(nxp->config.gpio_pin_s0, 0);
+	if (err) {
+		dev_err(&pdev->dev,
+			"unable to set direction of gpio %u, err=%d\n",
+			nxp->config.gpio_pin_s0, err);
+		goto err_free_2y;
+	}
+
+	err = gpio_direction_output(nxp->config.gpio_pin_s1, 0);
+	if (err) {
+		dev_err(&pdev->dev,
+			"unable to set direction of gpio %u, err=%d\n",
+			nxp->config.gpio_pin_s1, err);
+		goto err_free_2y;
+	}
+
+	err = gpio_direction_input(nxp->config.gpio_pin_1y);
+	if (err) {
+		dev_err(&pdev->dev,
+			"unable to set direction of gpio %u, err=%d\n",
+			nxp->config.gpio_pin_1y, err);
+		goto err_free_2y;
+	}
+
+	err = gpio_direction_input(nxp->config.gpio_pin_2y);
+	if (err) {
+		dev_err(&pdev->dev,
+			"unable to set direction of gpio %u, err=%d\n",
+			nxp->config.gpio_pin_2y, err);
+		goto err_free_2y;
+	}
+
+	nxp->parent = &pdev->dev;
+	mutex_init(&nxp->lock);
+
+	gc = &nxp->gpio_chip;
+
+	gc->direction_input  = nxp_74hc153_direction_input;
+	gc->direction_output = nxp_74hc153_direction_output;
+	gc->get = nxp_74hc153_get_value;
+	gc->set = nxp_74hc153_set_value;
+	gc->can_sleep = 1;
+
+	gc->base = -1;
+	gc->ngpio = NXP_74HC153_NUM_GPIOS;
+	gc->label = dev_name(nxp->parent);
+	gc->parent = nxp->parent;
+	gc->owner = THIS_MODULE;
+	gc->of_node = np;
+
+	err = gpiochip_add(&nxp->gpio_chip);
+	if (err) {
+		dev_err(&pdev->dev, "unable to add gpio chip, err=%d\n", err);
+		goto err_free_2y;
+	}
+
+	platform_set_drvdata(pdev, nxp);
+	return 0;
+
+err_free_2y:
+	gpio_free(nxp->config.gpio_pin_2y);
+err_free_1y:
+	gpio_free(nxp->config.gpio_pin_1y);
+err_free_s1:
+	gpio_free(nxp->config.gpio_pin_s1);
+err_free_s0:
+	gpio_free(nxp->config.gpio_pin_s0);
+err_free_nxp:
+	kfree(nxp);
+	return err;
+}
+
+static int nxp_74hc153_remove(struct platform_device *pdev)
+{
+	struct nxp_74hc153_chip *nxp = platform_get_drvdata(pdev);
+
+	if (nxp) {
+		gpiochip_remove(&nxp->gpio_chip);
+		gpio_free(nxp->config.gpio_pin_2y);
+		gpio_free(nxp->config.gpio_pin_1y);
+		gpio_free(nxp->config.gpio_pin_s1);
+		gpio_free(nxp->config.gpio_pin_s0);
+
+		kfree(nxp);
+		platform_set_drvdata(pdev, NULL);
+	}
+
+	return 0;
+}
+
+static struct of_device_id nxp_74hc153_id[] = {
+	{
+		.compatible = "nxp,74hc153-gpio",
+		.data = NULL,
+	}, { /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, nxp_74hc153_id);
+
+static struct platform_driver nxp_74hc153_driver = {
+	.probe          = nxp_74hc153_probe,
+	.remove         = nxp_74hc153_remove,
+	.driver = {
+		.name   = NXP_74HC153_DRIVER_NAME,
+		.owner  = THIS_MODULE,
+		.of_match_table = nxp_74hc153_id,
+	},
+};
+
+static int __init nxp_74hc153_init(void)
+{
+	return platform_driver_register(&nxp_74hc153_driver);
+}
+subsys_initcall(nxp_74hc153_init);
+
+static void __exit nxp_74hc153_exit(void)
+{
+	platform_driver_unregister(&nxp_74hc153_driver);
+}
+module_exit(nxp_74hc153_exit);
+
+MODULE_AUTHOR("Gabor Juhos <juhosg@openwrt.org>");
+MODULE_DESCRIPTION("GPIO expander driver for NXP 74HC153");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" NXP_74HC153_DRIVER_NAME);
-- 
2.25.1

