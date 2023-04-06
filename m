Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD076D92D3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Apr 2023 11:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbjDFJeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Apr 2023 05:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235883AbjDFJeQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Apr 2023 05:34:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8B86EB6;
        Thu,  6 Apr 2023 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773648; x=1712309648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SxFTAjkm1bqcujwlLN38m+7VuFBfW4+/0qfdLmZl7nI=;
  b=S2Pf4WIVvp87wk5wgshkaQbBQr3mNHpe2W2eOPpolu/p+dncqNiI3w8W
   p3J1lB06Q2DZpUhuR4/gqpUGKSMKvraWZkEwhNWiNsH21mJ5kYQJMV8Jq
   fg+vYSM6A3wCie8a9QsAlif8QtTh3gg949Er2FWGbyzLu7p07b1A8l5hZ
   aK7X6fomvTZWPf+xe7tB2SrMj9sZZ3Sm0u5VxRA18CFHnLsAkUmTAXY7G
   kZLInFg+EKfzuMYpWF0BhYRVSoGGV4Gz9qhoeskWsSjp1shZA5YlTKFew
   y12NwI3k7nFjFljdi7lm8iJOTCMcmFDTgz4GmuwzRojZrVBs5wo8pZnvm
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188772"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 06 Apr 2023 11:33:52 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 11:33:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680773632; x=1712309632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SxFTAjkm1bqcujwlLN38m+7VuFBfW4+/0qfdLmZl7nI=;
  b=UO3zbVgdy2+MJ8q2ZJ1S+PB4dfOQYxfpvYaI/koIrPlG3GTadCjDpohO
   zMIxbMsF+6lUgtoq2HUYIgzpwRPMmvENbnvajjPY01+FsukXf6lBeQs9c
   5sYOy+FaoMxGtDeXb13LJJq/zqWAX9Jy+/X4SJWO0oSsH48HaDSetTQan
   TKpI/GKW84jlJzkfX5i1BJC8RFeWSlLGXhg2EAEzVdVbdandH+sL4eHNb
   D5BQ2oCFnTtgONUug2V1fLLhQ7ZfjNjchazFMSmr8eCNsA6bl9/rH57BQ
   S8B63kH2maOUZ/BtZJoWXACyOvN/xzAhIzAX7+GU5XqOWrilIn/4irnEZ
   w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30188771"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Apr 2023 11:33:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5E7C7280056;
        Thu,  6 Apr 2023 11:33:52 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 2/3] gpio: Add gpio delay driver
Date:   Thu,  6 Apr 2023 11:33:43 +0200
Message-Id: <20230406093344.917259-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since RFC v2:
* Removed 'input' con_id
* Added Linus' A-b

 drivers/gpio/Kconfig      |   8 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-delay.c | 164 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/gpio/gpio-delay.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5521f060d58e..87c79d7a4aea 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1733,6 +1733,14 @@ config GPIO_AGGREGATOR
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
index 20036af3acb1..abb6ead17d83 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_GPIO_DA9052)		+= gpio-da9052.o
 obj-$(CONFIG_GPIO_DA9055)		+= gpio-da9055.o
 obj-$(CONFIG_GPIO_DAVINCI)		+= gpio-davinci.o
 obj-$(CONFIG_GPIO_DLN2)			+= gpio-dln2.o
+obj-$(CONFIG_GPIO_DELAY)		+= gpio-delay.o
 obj-$(CONFIG_GPIO_DWAPB)		+= gpio-dwapb.o
 obj-$(CONFIG_GPIO_EIC_SPRD)		+= gpio-eic-sprd.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
diff --git a/drivers/gpio/gpio-delay.c b/drivers/gpio/gpio-delay.c
new file mode 100644
index 000000000000..b489b561b225
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
+	priv->input_gpio = devm_gpiod_get_array(&pdev->dev, NULL, GPIOD_OUT_LOW);
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

