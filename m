Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D30F33F2CF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 15:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhCQOiY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 10:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbhCQOiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 10:38:11 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5845C06174A;
        Wed, 17 Mar 2021 07:38:10 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id 61so2063812wrm.12;
        Wed, 17 Mar 2021 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3UEL5SzZ311HnQNCdHWJiLduDEnVfZQtmSWlYq+ACVM=;
        b=T5bencRnIrnKFxpt+rQRCCuCbHZZxcefBFf1qFNF5iyscuD8cJvc49N/HXxicV2rB7
         CePQTbbbBa6hVxNs5Gou4XQH1mbr5Uu62fbQQ1Bqf0+LA33S6u8RpIeQVnJ5XVUgl48a
         zfZyn4e4NcL0oLNuTZ0Z3rAxJ1YUqnkNhx59BubpRgcK0rljcpPaFEIfaxtILj0Ls/7V
         0ERlDi9gPRUJcF90oXS3p3fwKoiGHRX/XgOjwO/jDkmv9uufOsNLeJlw+LzrVV7B5Up3
         xC5koUiYiMJaddhsLylNQsmMEdxVayWCzTRmWRXP7wqsmvRNklYBm4ufYao0NB5R2kWA
         PY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UEL5SzZ311HnQNCdHWJiLduDEnVfZQtmSWlYq+ACVM=;
        b=YUn1vZIh/+B3gmm6bC1XYo/w8FUmCNEYxR+VT0rUoVUQKQ+oUwDss/p0hxnv+1litL
         S+Wx/rV89VZZHyxMmcc6OWPBGqfc95eZfNrDW9l1BV5U0cHCxzc/Mq3Tb5jssKkYdHB5
         yHpuf5jhDCy0N5zbukK6dNQcPZ05K9LpXUGJkloyiLuBNi9v3hSzyKhSlSve7Peuqmh+
         xDVXyffw7VrGD7WUH/S/o2m7JmsPQkGm89AMmY2ICGEf2dHctCW9TmFrHZRTO/DfKqwD
         xZ/3Hwp+s++R7K+aDutlTbYT8MiHDTHTqZY3bm4oNpAEruJjb7tjT4vvZMDVlas2kpq1
         Sz5A==
X-Gm-Message-State: AOAM532rENOwCaPJt8i6uWyRV5Jlol7QBEBaQho3fl2hFyM1ZcGwpSL2
        yg11t54bRgA0GuiUI6zD4bU=
X-Google-Smtp-Source: ABdhPJyCygr6HIC1TZAs8AEZ/e6yTX47u3AA6U8fd7o+xxhcqARmUDi/r4Fc0a6BVG6MlGtC2RnaeQ==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr4819376wrx.150.1615991889679;
        Wed, 17 Mar 2021 07:38:09 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a75sm2518948wme.10.2021.03.17.07.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:38:09 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 04/22] pinctrl: bcm: add bcm63xx base code
Date:   Wed, 17 Mar 2021 15:37:45 +0100
Message-Id: <20210317143803.26127-5-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317143803.26127-1-noltari@gmail.com>
References: <20210317143803.26127-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper for registering BCM63XX pin controllers.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v8: add changes suggested by Rob Herring
 v7: revert from fwnode to "of" and look for brcm,bcm63xx-gpio on the parent
 v6: add changes suggested by Andy Shevchenko
 v5: add changes suggested by Andy Shevchenko
 v4: drop IRQ selects from Kconfig and add missing of_node_put()
 v3: add new patch with shared code

 drivers/pinctrl/bcm/Kconfig           |   7 ++
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 109 ++++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h |  43 ++++++++++
 4 files changed, 160 insertions(+)
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
index 000000000000..e1285fe2fbc0
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -0,0 +1,109 @@
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
+#include <linux/mod_devicetable.h>
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
+	{ /* sentinel */ }
+};
+
+static int bcm63xx_gpio_probe(struct device *dev, struct device_node *node,
+			      const struct bcm63xx_pinctrl_soc *soc,
+			      struct bcm63xx_pinctrl *pc)
+{
+	struct gpio_regmap_config grc = {0};
+
+	grc.parent = dev;
+	grc.fwnode = &node->fwnode;
+	grc.ngpio = soc->ngpios;
+	grc.ngpio_per_reg = BCM63XX_BANK_GPIOS;
+	grc.regmap = pc->regs;
+	grc.reg_dat_base = BCM63XX_DATA_REG;
+	grc.reg_dir_out_base = BCM63XX_DIROUT_REG;
+	grc.reg_set_base = BCM63XX_DATA_REG;
+	grc.reg_mask_xlate = bcm63xx_reg_mask_xlate;
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
+	for_each_child_of_node(dev->parent->of_node, node) {
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
+	return 0;
+}
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
new file mode 100644
index 000000000000..3bdb50021f1b
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
@@ -0,0 +1,43 @@
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

