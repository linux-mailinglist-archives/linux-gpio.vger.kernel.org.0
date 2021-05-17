Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C7C383AA3
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 18:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237801AbhEQRAq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 13:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236776AbhEQRAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 13:00:46 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879DFC061573
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=o2Af4r6ondZLXI+wXQ/vPcbCdKAE02a1WwUiFgRTyC0=; b=f3sLJ2tL1QnabOxyMLsJ4GxT4A
        TUFDfAWhC5IftcucM6TrjDs5m5otgGOKNoV26OjEajgEEhbweqZWVrGQq5x6WIWNCKGBVGNfqOmVL
        AmXq0TLMUNr60fMTt1ZSAZBlXxscileftL8k2A+FTZq9xULb8iUPIbnrOBPEzJE/6Fj7APlVBsZVL
        9k1xJfyGo5EhpXrN0ljYIzr5bHzdzJBC54mloadjzgf/UJdBYXL/ffTGj/BJ2RQxnxmBqf7a++gf/
        NT908puK99Z6vgN6Rwt6GfEjuecxaWAaumX0ivduD609IUDVJYvxy1J4pAoLt5SevYfNGR8ZLa0GH
        juEda7yQ==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1ligaO-0003BP-Av; Mon, 17 May 2021 19:59:21 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 17 May 2021 19:59:19 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, drew@beagleboard.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v3 2/2] gpio: gpio-mux-input: add generic gpio input multiplexer
Date:   Mon, 17 May 2021 19:58:47 +0300
Message-Id: <20210517165847.206316-3-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517165847.206316-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210517165847.206316-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
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
v2 -> v3:
 - use managed device resources
 - update Kconfig description
v1 -> v2:
 - removed .owner from platform_driver as per test bot's instruction
 - added MODULE_AUTHOR, MODULE_DESCRIPTION, MODULE_LICENSE
 - added gpio_mux_input_get_direction as it's recommended for all chips
 - removed because this is input only chip: gpio_mux_input_set_value
 - removed because they are not needed for input/output only chips:
     gpio_mux_input_direction_input
     gpio_mux_input_direction_output
 - fixed typo in an error message
 - added info message about successful registration
 - removed can_sleep flag as this does not sleep while getting GPIO value
   like I2C or SPI do
 - Updated description in Kconfig
---
 drivers/gpio/Kconfig          |  16 +++++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-mux-input.c | 124 ++++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/gpio/gpio-mux-input.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6727fd..b7dd4ba59e6e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1657,4 +1657,20 @@ config GPIO_MOCKUP
 
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
+  	  single output pin for reading the inputs to the mux. The driver can be
+  	  used in situations when GPIO pins are used to select what multiplexer
+  	  pin should be used for reading input and the output pin of the
+  	  multiplexer is connected to a GPIO input pin.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d7c81e1611a4..ff2b530d8ef4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -104,6 +104,7 @@ obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
 obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
+obj-$(CONFIG_GPIO_MUX_INPUT)		+= gpio-mux-input.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
diff --git a/drivers/gpio/gpio-mux-input.c b/drivers/gpio/gpio-mux-input.c
new file mode 100644
index 000000000000..3c41e6f47012
--- /dev/null
+++ b/drivers/gpio/gpio-mux-input.c
@@ -0,0 +1,124 @@
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
+	struct device *dev = &pdev->dev;
+	struct gpio_mux_input *mux;
+	struct mux_control *mc;
+	struct gpio_desc *pin;
+	struct gpio_chip *gc;
+	int err;
+
+	mux = devm_kzalloc(dev, sizeof(struct gpio_mux_input), GFP_KERNEL);
+	if (mux == NULL)
+		return -ENOMEM;
+
+	mc = devm_mux_control_get(dev, NULL);
+	if (IS_ERR(mc)) {
+		err = (int) PTR_ERR(mc);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "unable to get mux-control: %d\n", err);
+		return err;
+	}
+
+	mux->mux_control = mc;
+	pin = devm_gpiod_get(dev, "pin",  GPIOD_IN);
+	if (IS_ERR(pin)) {
+		err = (int) PTR_ERR(pin);
+		dev_err(dev, "unable to claim output pin: %d\n", err);
+		return err;
+	}
+
+	mux->mux_pin = pin;
+	mux->parent = dev;
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
+		dev_err(dev, "unable to add gpio chip, err=%d\n", err);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, mux);
+	dev_info(dev, "registered %u input GPIOs\n", gc->ngpio);
+	return 0;
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

