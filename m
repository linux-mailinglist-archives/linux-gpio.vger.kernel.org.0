Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E5734D205
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 16:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhC2OBB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 10:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhC2OAc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 10:00:32 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDA6C061574
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=of8bQ9zYa4l4SnBKzVyIDF5BYg8RrxRcJw3f1zs5Wfg=; b=cMcxTyVBY+GheGQX1sLxIMsKsN
        9cxoBFGUZkyYisk3P5JXvCFlQeCwtFBqh6RhXhPuDo7T0x5zuKPCb05ls2y0kzp1LhjhyABZ8ISg1
        N0JpFK3SoAF56iwbNWQbZ8m8BQM4SiDuhQFW9HHaEGsrDZ0ZisbUML9ah2Z2oGr5qF8UGM6SqOU0s
        cTptAnruZeuGxku7aPY0AiuT2flSSCfuF/Se1Q/VtP1w64xandyT+OWAl0hD2gWj1GxQma+VZM7Th
        gx2j0UuohfR+ahQ2skxNiIl0JvClPi7vjAcFJ8aPmvwuajlD1Wy23SOofLNcEukZ8TjN3okmwe12N
        hTx3WEhA==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lQsRL-0006Yt-0g; Mon, 29 Mar 2021 17:00:24 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 29 Mar 2021 17:00:19 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, drew@beagleboard.org,
        kernel test robot <lkp@intel.com>
Subject: [RFC v2 2/2] gpio: gpio-mux-input: add generic gpio input multiplexer
Date:   Mon, 29 Mar 2021 16:57:29 +0300
Message-Id: <20210329135729.10523-3-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329135729.10523-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210329135729.10523-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds support for a generic GPIO multiplexer. To drive the multiplexer a
mux-controller is needed. The output pin of the multiplexer is a GPIO
pin.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 drivers/gpio/Kconfig          |  13 ++++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-mux-input.c | 134 ++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/gpio/gpio-mux-input.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b6b6150d0d04..7bf8021e0239 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1643,4 +1643,17 @@ config GPIO_SIM
 
 endmenu
 
+comment "Other GPIO expanders"
+
+config GPIO_MUX_INPUT
+	tristate "General GPIO input multiplexer"
+	depends on OF_GPIO
+	select MULTIPLEXER
+	select MUX_GPIO
+	help
+	  Say yes here to enable support for generic GPIO input multiplexer.
+
+  	  This driver uses a mux-controller to drive the multiplexer and has a
+  	  single output pin for reading the inputs to the mux.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d717aa85f8e1..e843e1bcfc20 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
 obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
+obj-$(CONFIG_GPIO_MUX_INPUT)		+= gpio-mux-input.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
diff --git a/drivers/gpio/gpio-mux-input.c b/drivers/gpio/gpio-mux-input.c
new file mode 100644
index 000000000000..2de198a84bb9
--- /dev/null
+++ b/drivers/gpio/gpio-mux-input.c
@@ -0,0 +1,134 @@
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
+static int gpio_mux_input_get_direction(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_IN;
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
+		dev_err(&pdev->dev, "unable to claim pin GPIO: %d\n", err);
+		goto err_free_mc;
+	}
+
+	mux->mux_pin = pin;
+	mux->parent = &pdev->dev;
+
+	gc = &mux->gpio_chip;
+	gc->get = gpio_mux_input_get_value;
+	gc->get_direction = gpio_mux_input_get_direction;
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
+
+	dev_info(&pdev->dev, "registered %u input GPIOs\n", gc->ngpio);
+
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
+		.of_match_table = gpio_mux_input_id,
+	},
+	.probe	= gpio_mux_input_probe,
+};
+module_platform_driver(gpio_mux_input_driver);
+
+MODULE_AUTHOR("Mauri Sandberg <sandberg@mailfence.com>");
+MODULE_DESCRIPTION("Generic GPIO input multiplexer");
+MODULE_LICENSE("GPL");
-- 
2.25.1

