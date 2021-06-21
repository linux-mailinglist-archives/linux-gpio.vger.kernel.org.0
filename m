Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12543AF1DD
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 19:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhFUR1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 13:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhFUR1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 13:27:45 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9FFC06175F;
        Mon, 21 Jun 2021 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YX8nJf1NwX63y/AXWkCvdkNPri3yGjcQoWlt4DfFcjs=; b=r2Wu2n0x/BYcXip76M7YWj8ZyR
        rpAnK/x+VJlpcmZK01X6darQnVysj5NcYn8upB9NW9RFs2RT49Ujf8nUW4pDAmXHIYSV1p8KAnQ9i
        hFHGjlUTfmZz+X4vCu91EYdCedQ5TxVpYgcyJqC0BbUcc+n+uN1tEQVPXfcQukNGKEVYQBAVRiaMf
        sHpSDPLLL84AK70VeZQEGiD3N6vTfFQLh90rSno5HeirUsYUvxc2ErZrSW8QVoP9VLtycbCpsMXuV
        N5Lj/o58BJQfrF/IesRT9c+9f1o9ziuWtB6arXdJmLZsVLXgrrqpCOE2XQFCrrwFE/kCanlvaYgPi
        rrXnviZg==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:49247 helo=localdomain)
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1lvNfp-0002Cz-6t; Mon, 21 Jun 2021 20:25:26 +0300
Received: by localdomain (sSMTP sendmail emulation); Mon, 21 Jun 2021 20:25:25 +0300
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, Mauri Sandberg <maukka@ext.kapsi.fi>
Date:   Mon, 21 Jun 2021 20:20:53 +0300
Message-Id: <20210621172053.107045-3-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621172053.107045-1-maukka@ext.kapsi.fi>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210621172053.107045-1-maukka@ext.kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.2
Subject: [PATCH v5 2/2] gpio: gpio-cascade: add generic GPIO cascade
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds support for a building cascades of GPIO lines. That is, it allows
setups when there is one upstream line and multiple cascaded lines, out
of which one can be chosen at a time. The status of the upstream line
can be conveyd to the selected cascaded line or, vice versa, the status
of the cascaded line can be conveyed to the upstream line.

A gpio-mux is being used to select, which cascaded GPIO line is being
used at any given time.

At the moment only input direction is supported. In future it should be
possible to add support for output direction, too.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
---
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
 drivers/gpio/Kconfig        |  14 ++++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-cascade.c | 139 ++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/gpio/gpio-cascade.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ae2721967191..d8bdb6d87b1f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1669,4 +1669,18 @@ config GPIO_MOCKUP
 
 endmenu
 
+comment "Other GPIO expanders"
+
+config GPIO_CASCADE
+	tristate "General GPIO cascade"
+	depends on OF_GPIO
+	select MULTIPLEXER
+	select MUX_GPIO
+	help
+	  Say yes here to enable support for generic GPIO cascade.
+
+	  This allows building one-to-many cascades of GPIO lines using
+	  different types of multiplexers readily available. At the
+	  moment only input lines are supported.
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 32a32659866a..94a9d6e43bc2 100644
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
index 000000000000..91053ac489c2
--- /dev/null
+++ b/drivers/gpio/gpio-cascade.c
@@ -0,0 +1,139 @@
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
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/mux/consumer.h>
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
+	struct gpio_cascade *cas;
+	int ret;
+
+	cas = chip_to_cascade(gc);
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
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct gpio_cascade *cas;
+	struct mux_control *mc;
+	struct gpio_desc *upstream;
+	struct gpio_chip *gc;
+	int err;
+
+	cas = devm_kzalloc(dev, sizeof(struct gpio_cascade), GFP_KERNEL);
+	if (cas == NULL)
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
+	cas->mux_control = mc;
+	upstream = devm_gpiod_get(dev, "upstream",  GPIOD_IN);
+	if (IS_ERR(upstream)) {
+		err = (int) PTR_ERR(upstream);
+		dev_err(dev, "unable to claim upstream GPIO line: %d\n", err);
+		return err;
+	}
+
+	cas->upstream_line = upstream;
+	cas->parent = dev;
+
+	gc = &cas->gpio_chip;
+	gc->get = gpio_cascade_get_value;
+	gc->get_direction = gpio_cascade_get_direction;
+
+	gc->base = -1;
+	gc->ngpio = mux_control_states(mc);
+	gc->label = dev_name(cas->parent);
+	gc->parent = cas->parent;
+	gc->owner = THIS_MODULE;
+	gc->of_node = np;
+
+	err = gpiochip_add(&cas->gpio_chip);
+	if (err) {
+		dev_err(dev, "unable to add gpio chip, err=%d\n", err);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, cas);
+	dev_info(dev, "registered %u cascaded GPIO lines\n", gc->ngpio);
+	return 0;
+}
+
+static const struct of_device_id gpio_cascade_id[] = {
+	{
+		.compatible = "gpio-cascade",
+		.data = NULL,
+	},
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

