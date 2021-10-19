Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E18E433FAB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 22:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235065AbhJSUM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 16:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhJSUM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 16:12:26 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059CAC06161C;
        Tue, 19 Oct 2021 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gFN8R2U6QR1XWLkHGWxAj2WQIAxoH0HovnQZLhbe0zs=; b=uBoifJPZuUSVOMwkP2ybigzsBH
        0RD5fg3uCRgEIlrOLkoT2eQprfne4PXc09odCKCJGZ7w0OEv7Edc1ER4HH9Z7LYWtmn6ez2wpEXj7
        hppwDZxHnUaWl0TlD3QrDhzQEuVt7CvlWx0ciJk3oqNpviwcA1G/Rfsna5wKAr3Q7OgvOaLYPljVO
        gzuVFX7ydEC0dPG1EP6ryl+kNeH801y3v6PLJNhVSrgF3s6WA0K+ZVn2RKJc7HiIU+aEFzJyHR0Ko
        XYYYG0tHaAedHlF/16fe4NJCub92EhAThRSrpvzT/T8Gke/6Qb4t7S/7YeQqtD8no1flTKppv63uh
        wrJQrR0g==;
Received: from 153-106-191-90.dyn.estpak.ee ([90.191.106.153]:63065 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1mcvR1-0002ys-M8; Tue, 19 Oct 2021 23:10:09 +0300
Received: by localdomain (sSMTP sendmail emulation); Tue, 19 Oct 2021 23:10:06 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Tue, 19 Oct 2021 23:08:31 +0300
Message-Id: <20211019200831.3817-3-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019200831.3817-1-maukka@ext.kapsi.fi>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20211019200831.3817-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.106.153
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.2
Subject: [PATCH v7 2/2] gpio: gpio-cascade: add generic GPIO cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds support for building cascades of GPIO lines. That is, it allows
setups when there is one upstream line and multiple cascaded lines, out
of which one can be chosen at a time. The status of the upstream line
can be conveyed to the selected cascaded line or, vice versa, the status
of the cascaded line can be conveyed to the upstream line.

A multiplexer is being used to select, which cascaded GPIO line is being
used at any given time.

At the moment only input direction is supported. In future it should be
possible to add support for output direction, too.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
---
v6 -> v7:
 - In Kconfig add info about module name
 - adhere to new convention that allows lines longer than 80 chars
 - use dev_probe_err with upstream gpio line too
 - refactor for cleaner exit of probe function.
v5 -> v6:
 - In Kconfig, remove dependency to OF_GPIO and select only MULTIPLEXER
 - refactor code preferring one-liners
 - clean up prints, removing them from success-path.
 - don't explicitly set gpio_chip.of_node as it's done in the GPIO library
 - use devm_gpiochip_add_data instead of gpiochip_add
v4 -> v5:
 - renamed gpio-mux-input -> gpio-cascade. refactored code accordingly
   here and there and changed to use new bindings and compatible string
   - ambigious and vague 'pin' was rename to 'upstream_line'
 - dropped Tested-by and Reviewed-by due to changes in bindings
 - dropped Reported-by suggested by an automatic bot as it was not really
   appropriate to begin with
 - functionally it's the same as v4
v3 -> v4:
 - Changed author email
 - Included Tested-by and Reviewed-by from Drew
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
 drivers/gpio/Kconfig        |  15 +++++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-cascade.c | 118 ++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/gpio/gpio-cascade.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 37a6f77c86fe..e69457144459 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1694,4 +1694,19 @@ config GPIO_VIRTIO
 
 endmenu
 
+comment "Other GPIO expanders"
+
+config GPIO_CASCADE
+	tristate "General GPIO cascade"
+	select MULTIPLEXER
+	help
+	  Say yes here to enable support for generic GPIO cascade.
+
+	  This allows building one-to-many cascades of GPIO lines using
+	  different types of multiplexers readily available. At the
+	  moment only input lines are supported.
+
+	  To build the driver as a module choose 'm' and the resulting module
+	  will be called 'gpio-cascade'.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 71ee9fc2ff83..e8945456e7ea 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
 obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
+obj-$(CONFIG_GPIO_CASCADE)		+= gpio-cascade.o
 obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
 obj-$(CONFIG_GPIO_SNPS_CREG)		+= gpio-creg-snps.o
 obj-$(CONFIG_GPIO_CRYSTAL_COVE)		+= gpio-crystalcove.o
diff --git a/drivers/gpio/gpio-cascade.c b/drivers/gpio/gpio-cascade.c
new file mode 100644
index 000000000000..82001299265e
--- /dev/null
+++ b/drivers/gpio/gpio-cascade.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  A generic GPIO cascade driver
+ *
+ *  Copyright (C) 2021 Mauri Sandberg <maukka@ext.kapsi.fi>
+ *
+ * This allows building cascades of GPIO lines in a manner illustrated
+ * below:
+ *
+ *                 /|---- Cascaded GPIO line 0
+ *  Upstream      | |---- Cascaded GPIO line 1
+ *  GPIO line ----+ | .
+ *                | | .
+ *                 \|---- Cascaded GPIO line n
+ *
+ * A gpio-mux is being used to select, which cascaded line is being
+ * addressed at any given time.
+ *
+ * At the moment only input mode is supported due to lack of means for
+ * testing output functionality. At least theoretically output should be
+ * possible with an open drain constructions.
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/mux/consumer.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+
+struct gpio_cascade {
+	struct device		*parent;
+	struct gpio_chip	gpio_chip;
+	struct mux_control	*mux_control;
+	struct gpio_desc	*upstream_line;
+};
+
+static struct gpio_cascade *chip_to_cascade(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_cascade, gpio_chip);
+}
+
+static int gpio_cascade_get_direction(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int gpio_cascade_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_cascade *cas = chip_to_cascade(gc);
+	int ret;
+
+	ret = mux_control_select(cas->mux_control, offset);
+	if (ret)
+		return ret;
+
+	ret = gpiod_get_value(cas->upstream_line);
+	mux_control_deselect(cas->mux_control);
+	return ret;
+}
+
+static int gpio_cascade_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_cascade *cas;
+	struct mux_control *mc;
+	struct gpio_desc *upstream;
+	struct gpio_chip *gc;
+
+	cas = devm_kzalloc(dev, sizeof(*cas), GFP_KERNEL);
+	if (!cas)
+		return -ENOMEM;
+
+	mc = devm_mux_control_get(dev, NULL);
+	if (IS_ERR(mc))
+		return dev_err_probe(dev, PTR_ERR(mc), "unable to get mux-control\n");
+
+	cas->mux_control = mc;
+	upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
+	if (IS_ERR(upstream))
+		return dev_err_probe(dev, PTR_ERR(upstream), "unable to claim upstream GPIO line\n");
+
+	cas->upstream_line = upstream;
+	cas->parent = dev;
+
+	gc = &cas->gpio_chip;
+	gc->get = gpio_cascade_get_value;
+	gc->get_direction = gpio_cascade_get_direction;
+	gc->base = -1;
+	gc->ngpio = mux_control_states(mc);
+	gc->label = dev_name(cas->parent);
+	gc->parent = cas->parent;
+	gc->owner = THIS_MODULE;
+
+	platform_set_drvdata(pdev, cas);
+	return devm_gpiochip_add_data(dev, &cas->gpio_chip, NULL);
+}
+
+static const struct of_device_id gpio_cascade_id[] = {
+	{ .compatible = "gpio-cascade" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, gpio_cascade_id);
+
+static struct platform_driver gpio_cascade_driver = {
+	.driver	= {
+		.name		= "gpio-cascade",
+		.of_match_table = gpio_cascade_id,
+	},
+	.probe	= gpio_cascade_probe,
+};
+module_platform_driver(gpio_cascade_driver);
+
+MODULE_AUTHOR("Mauri Sandberg <maukka@ext.kapsi.fi>");
+MODULE_DESCRIPTION("Generic GPIO cascade");
+MODULE_LICENSE("GPL");
-- 
2.25.1

