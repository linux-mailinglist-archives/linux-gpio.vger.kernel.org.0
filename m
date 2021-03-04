Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B232332CEFC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236980AbhCDI6G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236977AbhCDI56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:57:58 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB6BC061760;
        Thu,  4 Mar 2021 00:57:18 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o7-20020a05600c4fc7b029010a0247d5f0so4116569wmq.1;
        Thu, 04 Mar 2021 00:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K4XGYh172AgAoiK0Xj/AfoyGhY8lKuqFSlG3DCK5MUA=;
        b=URKzE73C5jFHPlDjmBD3gTeKZyOKfkGjjtJg7khfmK+Vook8CfW5dIGt7jjIzIJRus
         1FzcZNjC5Pe3iq9xXIzsAXAOJwp96GRB+aW0Dv0vI6wIKMh5DnKn5e91xtNoqKzPybZd
         Bjx26zbtXgK1i5d6ek/iYi8mpPcuDj3HLqtXE3h/7ASTZDOYl+6+YM2/FKILWSD8KxR1
         63ZGei/PGrwG2PpZae6tkG2Y2wzKZcgKIa/cfOZ/lKqR5rJpinPsKGGAtVv/Qb1dbfgI
         Etd7cZ+ipsJVLfYhvEOe4z8QqtJ2nDhY3fwbNpUugzLCYZ/MIwmqFVXACLxa2odj9aIv
         QixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K4XGYh172AgAoiK0Xj/AfoyGhY8lKuqFSlG3DCK5MUA=;
        b=c2iuP1u0Lt61UbVrl23pmgfq51HZArpcr1J6YXw3nAiaY3IFiX0e7Gx1035XVp746n
         gMqZg4CJNTX8zT/lGYyiziEYl2Mtse7VifCFUztUXz+3ssSBqyaMX/m9sMRSwLN//7S0
         UukUgUQrWwYYejqbjoCH72NY96l7iUoDB7d6Fxjf4X4spFeukRKGsdn1Y4vYDvM7kBQe
         XzWj0J3yZjQv9MdwiV2yHnre2JaO2eZP/E66I2ZhXjS4OtZQSuDXlaY6NRdsWUXlqh9r
         thyNMBpjhkEi2uJY7aApW/IWY+zAGiy2sG07JlK+p8v20PCnPraevo+IfcRVLa55E9Iu
         mrXA==
X-Gm-Message-State: AOAM531q69Eup5LloyIuaPUvn6urX3Za7uQECSgrwgQLtNdqHbtEVhK+
        Ck/HdsXxFZqT+k0ZG0av4F4=
X-Google-Smtp-Source: ABdhPJyYYOGKJdlCW927sQxwcLqTb8z28KXW9x/0F8REA6PeaSVebR+qGEbiTFZo+xmR5QAdMQ0MOQ==
X-Received: by 2002:a1c:dd43:: with SMTP id u64mr2802877wmg.160.1614848237100;
        Thu, 04 Mar 2021 00:57:17 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id q15sm2828976wrx.56.2021.03.04.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 00:57:16 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/15] pinctrl: bcm: add bcm63xx base code
Date:   Thu,  4 Mar 2021 09:56:58 +0100
Message-Id: <20210304085710.7128-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304085710.7128-1-noltari@gmail.com>
References: <20210304085710.7128-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper for registering BCM63XX pin controllers.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v4: drop IRQ selects from Kconfig and add missing of_node_put()
 v3: add new patch with shared code

 drivers/pinctrl/bcm/Kconfig           |   7 ++
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 114 ++++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h |  46 +++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.h

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 0ed14de0134c..882f19bdc243 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -29,6 +29,13 @@ config PINCTRL_BCM2835
 	help
 	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
+config PINCTRL_BCM63XX
+	bool
+	select GENERIC_PINCONF
+	select GPIO_REGMAP
+	select PINCONF
+	select PINMUX
+
 config PINCTRL_IPROC_GPIO
 	bool "Broadcom iProc GPIO (with PINCONF) driver"
 	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
index 79d5e49fdd9a..0e3cf9b15c65 100644
--- a/drivers/pinctrl/bcm/Makefile
+++ b/drivers/pinctrl/bcm/Makefile
@@ -3,6 +3,7 @@
 
 obj-$(CONFIG_PINCTRL_BCM281XX)		+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_BCM2835)		+= pinctrl-bcm2835.o
+obj-$(CONFIG_PINCTRL_BCM63XX)		+= pinctrl-bcm63xx.o
 obj-$(CONFIG_PINCTRL_IPROC_GPIO)	+= pinctrl-iproc-gpio.o
 obj-$(CONFIG_PINCTRL_CYGNUS_MUX)	+= pinctrl-cygnus-mux.o
 obj-$(CONFIG_PINCTRL_NS)		+= pinctrl-ns.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.c b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
new file mode 100644
index 000000000000..9a2d68c1ad26
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for BCM63xx GPIO unit (pinctrl + GPIO)
+ *
+ * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
+ * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
+ */
+
+#include <linux/gpio/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-bcm63xx.h"
+
+#define BCM63XX_BANK_SIZE	4
+
+#define BCM63XX_DIROUT_REG	0x04
+#define BCM63XX_DATA_REG	0x0c
+
+static int bcm63xx_reg_mask_xlate(struct gpio_regmap *gpio,
+				  unsigned int base, unsigned int offset,
+				  unsigned int *reg, unsigned int *mask)
+{
+	unsigned int line = offset % BCM63XX_BANK_GPIOS;
+	unsigned int stride = offset / BCM63XX_BANK_GPIOS;
+
+	*reg = base - stride * BCM63XX_BANK_SIZE;
+	*mask = BIT(line);
+
+	return 0;
+}
+
+static const struct of_device_id bcm63xx_gpio_of_match[] = {
+	{ .compatible = "brcm,bcm6318-gpio", },
+	{ .compatible = "brcm,bcm6328-gpio", },
+	{ .compatible = "brcm,bcm6358-gpio", },
+	{ .compatible = "brcm,bcm6362-gpio", },
+	{ .compatible = "brcm,bcm6368-gpio", },
+	{ .compatible = "brcm,bcm63268-gpio", },
+	{ /* sentinel */ },
+};
+
+static int bcm63xx_gpio_probe(struct device *dev, struct device_node *node,
+			      const struct bcm63xx_pinctrl_soc *soc,
+			      struct bcm63xx_pinctrl *pc)
+{
+	struct gpio_regmap_config grc = {0};
+
+	grc.parent = dev;
+	grc.of_node = node;
+	grc.ngpio = soc->ngpios;
+	grc.ngpio_per_reg = BCM63XX_BANK_GPIOS;
+	grc.regmap = pc->regs;
+	grc.reg_mask_xlate = bcm63xx_reg_mask_xlate;
+
+	if (of_property_read_u32(node, "data", &grc.reg_dat_base))
+		grc.reg_dat_base = BCM63XX_DATA_REG;
+	grc.reg_set_base = grc.reg_dat_base;
+
+	if (of_property_read_u32(node, "dirout", &grc.reg_dir_out_base))
+		grc.reg_dir_out_base = BCM63XX_DIROUT_REG;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &grc));
+}
+
+int bcm63xx_pinctrl_probe(struct platform_device *pdev,
+			  const struct bcm63xx_pinctrl_soc *soc,
+			  void *driver_data)
+{
+	struct device *dev = &pdev->dev;
+	struct bcm63xx_pinctrl *pc;
+	struct device_node *node;
+	int err;
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pc);
+
+	pc->dev = dev;
+	pc->driver_data = driver_data;
+
+	pc->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(pc->regs))
+		return PTR_ERR(pc->regs);
+
+	pc->pctl_desc.name = dev_name(dev);
+	pc->pctl_desc.pins = soc->pins;
+	pc->pctl_desc.npins = soc->npins;
+	pc->pctl_desc.pctlops = soc->pctl_ops;
+	pc->pctl_desc.pmxops = soc->pmx_ops;
+	pc->pctl_desc.owner = THIS_MODULE;
+
+	pc->pctl_dev = devm_pinctrl_register(dev, &pc->pctl_desc, pc);
+	if (IS_ERR(pc->pctl_dev))
+		return PTR_ERR(pc->pctl_dev);
+
+	for_each_child_of_node(dev->of_node, node) {
+		if (of_match_node(bcm63xx_gpio_of_match, node)) {
+			err = bcm63xx_gpio_probe(dev, node, soc, pc);
+			if (err) {
+				dev_err(dev, "could not add GPIO chip\n");
+				of_node_put(node);
+				return err;
+			}
+		}
+	}
+
+	dev_info(dev, "registered\n");
+
+	return 0;
+}
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
new file mode 100644
index 000000000000..cb2bfca7d174
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
+ * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
+ */
+
+#ifndef __PINCTRL_BCM63XX_H__
+#define __PINCTRL_BCM63XX_H__
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/regmap.h>
+
+#include "../core.h"
+
+#define BCM63XX_BANK_GPIOS 32
+
+struct bcm63xx_pinctrl_soc {
+	struct pinctrl_ops *pctl_ops;
+	struct pinmux_ops *pmx_ops;
+
+	const struct pinctrl_pin_desc *pins;
+	unsigned npins;
+
+	unsigned int ngpios;
+};
+
+struct bcm63xx_pinctrl {
+	struct device *dev;
+	struct regmap *regs;
+
+	struct pinctrl_desc pctl_desc;
+	struct pinctrl_dev *pctl_dev;
+
+	void *driver_data;
+};
+
+static inline unsigned int bcm63xx_bank_pin(unsigned int pin)
+{
+	return pin % BCM63XX_BANK_GPIOS;
+}
+
+int bcm63xx_pinctrl_probe(struct platform_device *pdev,
+			  const struct bcm63xx_pinctrl_soc *soc,
+			  void *driver_data);
+
+#endif /* __PINCTRL_BCM63XX_H__ */
-- 
2.20.1

