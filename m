Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF11D3491F1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 13:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhCYM3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 08:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhCYM3Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 08:29:24 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE5AC06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=To/IbCmae+7r3GZ+mwza5PKigW3IoMiD3wBa9D4YBzY=; b=blHc6JqEFKfNjefr9PYdzFC9oP
        y4cJxCyPPgH61q/9OllneSNc8W7P9Y0YZ0UwbPDOu61moLK+8kr6GvOj6C20vScjNosWRF4/KSLkt
        qUY72JIVA9ZfnM6+BKy3UtNbGQaeLSJ6+QUns7vd3PehjXnUB2OQj4DJZcuW1n+bfMlj1Gjyyok1y
        Qugehexv+btevveu9Jbao9V0q4GxfuQP4Sq6mrTZi8cuZLs+tF1r2mrfZbE/HYZ7KSDpA36BOFGjw
        kSRuZIiKPn/oxebAMU+Zun9pOemuyNwgmKdAIkaHNUbjnTFddP+W5W1j0gCIcKzWC1kn1Ya48IEgI
        KcudNzxA==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPP73-00036j-Fa; Thu, 25 Mar 2021 14:29:22 +0200
Received: by ubuntu (sSMTP sendmail emulation); Thu, 25 Mar 2021 14:29:20 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Cc:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, geert+renesas@glider.be,
        Mauri Sandberg <sandberg@mailfence.com>
Subject: [RFC gpio/for-next 2/2] gpio: gpio-mux-input: add generic gpio input multiplexer
Date:   Thu, 25 Mar 2021 14:28:32 +0200
Message-Id: <20210325122832.119147-3-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Suppport for a general GPIO multiplexer. To drive the multiplexer a
mux-controller is needed. The output pin of the multiplexer is a GPIO
pin.

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 drivers/gpio/Kconfig          |  11 +++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-mux-input.c | 143 ++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 drivers/gpio/gpio-mux-input.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..41062d8f7d93 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1641,4 +1641,15 @@ config GPIO_MOCKUP
 
 endmenu
 
+comment "Other GPIO expanders"
+
+config GPIO_MUX_INPUT
+	tristate "General GPIO input multiplexer"
+	select MULTIPLEXER
+	select MUX_GPIO
+	depends on OF_GPIO
+	help
+	  Say yes here to enable support for generic GPIO input multiplexer. This
+	  needs a multiplexer controller to drive the select pins.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 35e3b6026665..00f7576ce23f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -105,6 +105,7 @@ obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
 obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
 obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
+obj-$(CONFIG_GPIO_MUX_INPUT)		+= gpio-mux-input.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
diff --git a/drivers/gpio/gpio-mux-input.c b/drivers/gpio/gpio-mux-input.c
new file mode 100644
index 000000000000..ec0c7acbab2f
--- /dev/null
+++ b/drivers/gpio/gpio-mux-input.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  A generic GPIO input multiplexer driver
+ *
+ *  Copyright (C) 2021 Mauri Sandberg <sandberg@mailfence.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/mux/consumer.h>
+
+struct gpio_mux_input {
+	struct device		*parent;
+	struct gpio_chip	gpio_chip;
+	struct mux_control	*mux_control;
+	struct gpio_desc	*mux_pin;
+};
+
+static struct gpio_mux_input *gpio_to_mux(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_mux_input, gpio_chip);
+}
+
+static int gpio_mux_input_direction_input(struct gpio_chip *gc,
+				       unsigned int offset)
+{
+	return 0;
+}
+
+static int gpio_mux_input_direction_output(struct gpio_chip *gc,
+					unsigned int offset, int val)
+{
+	return -EINVAL;
+}
+
+static int gpio_mux_input_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_mux_input *mux;
+	int ret;
+
+	mux = gpio_to_mux(gc);
+	ret = mux_control_select(mux->mux_control, offset);
+	if (ret)
+		return ret;
+
+	ret = gpiod_get_value(mux->mux_pin);
+	mux_control_deselect(mux->mux_control);
+	return ret;
+}
+
+static void gpio_mux_input_set_value(struct gpio_chip *gc,
+				  unsigned int offset, int val)
+{
+	/* not supported */
+}
+
+static int gpio_mux_input_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct gpio_mux_input *mux;
+	struct gpio_chip *gc;
+	struct mux_control *mc;
+	struct gpio_desc *pin;
+	int err;
+
+	mux = kzalloc(sizeof(struct gpio_mux_input), GFP_KERNEL);
+	if (mux == NULL)
+		return -ENOMEM;
+
+	mc = mux_control_get(&pdev->dev, NULL);
+	if (IS_ERR(mc)) {
+		err = (int) PTR_ERR(mc);
+		if (err != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "unable to get mux-control: %d\n",
+				err);
+		goto err_free_mux;
+	}
+
+	mux->mux_control = mc;
+	pin = gpiod_get(&pdev->dev, "pin",  GPIOD_IN);
+	if (IS_ERR(pin)) {
+		err = (int) PTR_ERR(pin);
+		dev_err(&pdev->dev, "unable to claim pin GPIOs: %d\n", err);
+		goto err_free_mc;
+	}
+
+	mux->mux_pin = pin;
+	mux->parent = &pdev->dev;
+
+	gc = &mux->gpio_chip;
+	gc->direction_input  = gpio_mux_input_direction_input;
+	gc->direction_output = gpio_mux_input_direction_output;
+	gc->get = gpio_mux_input_get_value;
+	gc->set = gpio_mux_input_set_value;
+	gc->can_sleep = 1;
+
+	gc->base = -1;
+	gc->ngpio = mux_control_states(mc);
+	gc->label = dev_name(mux->parent);
+	gc->parent = mux->parent;
+	gc->owner = THIS_MODULE;
+	gc->of_node = np;
+
+	err = gpiochip_add(&mux->gpio_chip);
+	if (err) {
+		dev_err(&pdev->dev, "unable to add gpio chip, err=%d\n", err);
+		goto err_free_pin;
+	}
+
+	platform_set_drvdata(pdev, mux);
+	return 0;
+
+err_free_pin:
+	gpiod_put(pin);
+err_free_mc:
+	mux_control_put(mc);
+err_free_mux:
+	kfree(mux);
+	return err;
+}
+
+static const struct of_device_id gpio_mux_input_id[] = {
+	{
+		.compatible = "gpio-mux-input",
+		.data = NULL,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, gpio_mux_input_id);
+
+static struct platform_driver gpio_mux_input_driver = {
+	.driver	= {
+		.name		= "gpio-mux-input",
+		.owner		= THIS_MODULE,
+		.of_match_table = gpio_mux_input_id,
+	},
+	.probe	= gpio_mux_input_probe,
+};
+module_platform_driver(gpio_mux_input_driver);
-- 
2.25.1

