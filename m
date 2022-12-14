Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239FE64C66D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 10:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237993AbiLNJy1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 04:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238055AbiLNJyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 04:54:00 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED18011B;
        Wed, 14 Dec 2022 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011633; x=1702547633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gn2uz/l27FEWIkvWQjkXj9Cd5gqzlT+kGDtvIUOrdYs=;
  b=WGwNCu1YYTaz/8JYOjuV8VeGTeCAWLxtGSBQcfSRnsvZpsf4GSIadA7T
   Tfb16+LMyUudYOf8fSriOebuL+dnLnV/+5eGGQ0vZzkTq+sG5SejH8ACn
   vuhQkmt8vx4OYWGvE6FfR9pV+rU1SjpgoQ6h17d53lVayfCFFz6rZqdwQ
   LJoHdkAoa+N4poKeICpKRBVZv5ouN9xwRdfOfa0/cbI23vqeieW/DIS/D
   Q5tVYAa/CCsL8lS70npHa55nRZZfWZ4+WfTvyIVFlGH81/m+MfjC1JoW2
   M2A8If6tFseQ8NrIgT4auJZannANps4JnupsB3++yV05Cu0dLaIO6cwml
   g==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943177"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Dec 2022 10:53:48 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 14 Dec 2022 10:53:48 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 14 Dec 2022 10:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671011628; x=1702547628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gn2uz/l27FEWIkvWQjkXj9Cd5gqzlT+kGDtvIUOrdYs=;
  b=YpZmmZZ4jvK3ceXLNnq4lCdvB6Q3mlRna8csrZB8gBgj0gLuhz2ukRQh
   XdgkDmjnghSWU54gTvMnH6cMsQ1obHH6xmo94/PbE83cHvm6ZHbN3HRvv
   WZuPixaU9FwRXLa4B3vMNQgFIU5emp6PbBXjaCMaxDTxuhWYJX/6DkSgG
   JsgEXKIYBHe+SHPVUmSt9SBa9sBFvxpPizJmSQwX8XuBg/561WWhc3kT0
   /zJ+jkywMeq1aQGtI4a9to1frZJ6FGk+uW26mDU0LIhZGlYLXh/4C/pVt
   RCqB/Lxm/QzD37+g0qba1np3KhKsB3LzPWUYiUsK5L63y43xqJhTjsDbK
   w==;
X-IronPort-AV: E=Sophos;i="5.96,244,1665439200"; 
   d="scan'208";a="27943176"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Dec 2022 10:53:48 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0FCBB280071;
        Wed, 14 Dec 2022 10:53:48 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH v2 2/3] gpio: Add gpio delay driver
Date:   Wed, 14 Dec 2022 10:53:41 +0100
Message-Id: <20221214095342.937303-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver implements a GPIO enable/disable delay. It supports a list
of GPIO outputs, which ramp-up/ramp-down delay can be specified at
consumer location.
The main purpose is to address external, passive delays upon line
voltage changes.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpio/Kconfig      |   8 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-delay.c | 164 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/gpio/gpio-delay.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ec7cfd4f52b1..8f1dcbe3fd00 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1684,6 +1684,14 @@ config GPIO_AGGREGATOR
 	      industrial control context, to be operated from userspace using
 	      the GPIO chardev interface.
 
+config GPIO_DELAY
+	tristate "GPIO delay"
+	help
+	  Say yes here to enable the GPIO delay, which provides a way to
+	  configure platform specific delays for GPIO ramp-up or ramp-down
+	  delays. This can serve the following purposes:
+	    - Open-drain output using an RC filter
+
 config GPIO_LATCH
 	tristate "GPIO latch driver"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 010587025fc8..56b6cbe35248 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
 obj-$(CONFIG_GPIO_DAVINCI)		+= gpio-davinci.o
 obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
+obj-$(CONFIG_GPIO_DELAY)		+= gpio-delay.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
 obj-$(CONFIG_GPIO_EM)			+= gpio-em.o
diff --git a/drivers/gpio/gpio-delay.c b/drivers/gpio/gpio-delay.c
new file mode 100644
index 000000000000..a91d2ea9a8bc
--- /dev/null
+++ b/drivers/gpio/gpio-delay.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2022 TQ-Systems GmbH
+ * Author: Alexander Stein <linux@ew.tq-group.com>
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+
+#include "gpiolib.h"
+
+struct gpio_delay_timing {
+	unsigned long ramp_up_delay_us;
+	unsigned long ramp_down_delay_us;
+};
+
+struct gpio_delay_priv {
+	struct gpio_chip gc;
+	struct gpio_descs *input_gpio;
+	struct gpio_delay_timing *delay_timings;
+};
+
+static int gpio_delay_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static void gpio_delay_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct gpio_delay_priv *priv = gpiochip_get_data(gc);
+	struct gpio_desc *gpio_desc = priv->input_gpio->desc[offset];
+	const struct gpio_delay_timing *delay_timings;
+	bool ramp_up;
+
+	gpiod_set_value(gpio_desc, val);
+
+	delay_timings = &priv->delay_timings[offset];
+	ramp_up = (!gpiod_is_active_low(gpio_desc) && val) ||
+		  (gpiod_is_active_low(gpio_desc) && !val);
+
+	if (ramp_up && delay_timings->ramp_up_delay_us)
+		udelay(delay_timings->ramp_up_delay_us);
+	if (!ramp_up && delay_timings->ramp_down_delay_us)
+		udelay(delay_timings->ramp_down_delay_us);
+}
+
+static void gpio_delay_set_can_sleep(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct gpio_delay_priv *priv = gpiochip_get_data(gc);
+	struct gpio_desc *gpio_desc = priv->input_gpio->desc[offset];
+	const struct gpio_delay_timing *delay_timings;
+	bool ramp_up;
+
+	gpiod_set_value_cansleep(gpio_desc, val);
+
+	delay_timings = &priv->delay_timings[offset];
+	ramp_up = (!gpiod_is_active_low(gpio_desc) && val) ||
+		  (gpiod_is_active_low(gpio_desc) && !val);
+
+	if (ramp_up && delay_timings->ramp_up_delay_us)
+		fsleep(delay_timings->ramp_up_delay_us);
+	if (!ramp_up && delay_timings->ramp_down_delay_us)
+		fsleep(delay_timings->ramp_down_delay_us);
+}
+
+static int gpio_delay_of_xlate(struct gpio_chip *gc,
+			       const struct of_phandle_args *gpiospec,
+			       u32 *flags)
+{
+	struct gpio_delay_priv *priv = gpiochip_get_data(gc);
+	struct gpio_delay_timing *timings;
+	u32 line;
+
+	if (gpiospec->args_count != gc->of_gpio_n_cells)
+		return -EINVAL;
+
+	line = gpiospec->args[0];
+	if (line >= gc->ngpio)
+		return -EINVAL;
+
+	timings = &priv->delay_timings[line];
+	timings->ramp_up_delay_us = gpiospec->args[1];
+	timings->ramp_down_delay_us = gpiospec->args[2];
+
+	return line;
+}
+
+static bool gpio_delay_can_sleep(const struct gpio_delay_priv *priv)
+{
+	int i;
+
+	for (i = 0; i < priv->input_gpio->ndescs; i++)
+		if (gpiod_cansleep(priv->input_gpio->desc[i]))
+			return true;
+
+	return false;
+}
+
+static int gpio_delay_probe(struct platform_device *pdev)
+{
+	struct gpio_delay_priv *priv;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->input_gpio = devm_gpiod_get_array(&pdev->dev, "input", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->input_gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->input_gpio),
+				     "Failed to get input-gpios");
+
+	priv->delay_timings = devm_kcalloc(&pdev->dev,
+					   priv->input_gpio->ndescs,
+					   sizeof(*priv->delay_timings),
+					   GFP_KERNEL);
+	if (!priv->delay_timings)
+		return -ENOMEM;
+
+	if (gpio_delay_can_sleep(priv)) {
+		priv->gc.can_sleep = true;
+		priv->gc.set = gpio_delay_set_can_sleep;
+	} else {
+		priv->gc.can_sleep = false;
+		priv->gc.set = gpio_delay_set;
+	}
+
+	priv->gc.get_direction = gpio_delay_get_direction;
+	priv->gc.of_xlate = gpio_delay_of_xlate;
+	priv->gc.of_gpio_n_cells = 3;
+	priv->gc.ngpio = priv->input_gpio->ndescs;
+	priv->gc.owner = THIS_MODULE;
+	priv->gc.base = -1;
+	priv->gc.parent = &pdev->dev;
+
+	platform_set_drvdata(pdev, priv);
+
+	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
+}
+
+static const struct of_device_id gpio_delay_ids[] = {
+	{
+		.compatible = "gpio-delay",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, gpio_delay_ids);
+
+static struct platform_driver gpio_delay_driver = {
+	.driver	= {
+		.name		= "gpio-delay",
+		.of_match_table	= gpio_delay_ids,
+	},
+	.probe	= gpio_delay_probe,
+};
+module_platform_driver(gpio_delay_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alexander Stein <alexander.stein@ew.tq-group.com>");
+MODULE_DESCRIPTION("GPIO delay driver");
-- 
2.34.1

