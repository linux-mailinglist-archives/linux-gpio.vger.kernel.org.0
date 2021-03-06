Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2794232FB88
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 16:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhCFP5r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 10:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbhCFP5S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 10:57:18 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6842C06175F;
        Sat,  6 Mar 2021 07:57:17 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u14so5963098wri.3;
        Sat, 06 Mar 2021 07:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RtvYoKdx8w9T7nCZXjDJ+e7ffNXHqzVkfLQSRgUpMkk=;
        b=DIJN31KU6wKdZxkod/kcycggjctUK/X8Q5LcO993E9SAkTBRdnVQ3zOCJ75iHzddjH
         yVBDeGvbt1gbQL+jjARFRSJ4s95QwRZkA8xrh6LiiqOuemO84sHg286UhLhpxlQnrdh5
         DNmU2be3sJashx3NUD41VjBENhjB5bojA6ze9DY30xeNb6+LvTgDGtlHWXBjfMZHur9x
         dMC+jMHGdsGluawI5qJSBXDQH+pvmmFQiGIbuqYaGYsXZo0jyICevywToXVDiF9ega1Q
         TZk01D0lsS1hv6VJ9f1YCdrNdaiysJkoxwAfwTp6wusJUN1TenxoqVn6MoZ70F6ypS4r
         kcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtvYoKdx8w9T7nCZXjDJ+e7ffNXHqzVkfLQSRgUpMkk=;
        b=lWwA8fbkDxyn8LIxxkPfZvLvQbTDF+wKw+wWQEi98N/F65zh+yyYd8PiUj9vKcUGe4
         hnhKrMeWGgl6VOC+rK1Y52R1sHRfUvt7K31PhGnVvGsqsVUW6HGyj8Wg2Jv1nIiBxlgA
         eZnZzA3QUZMa5MuzpfX/IAwkmlphz1MFjeXHuhrpz2Euiwpf48SGz9m3S4Cn/LBsrYfK
         2e9/o3l2Ks8icZpllWOlw+NcGQP669oM2OORJ8WcUtr9iuKfK9JiyA6G2xOj6H7nVhjI
         HJ2KtRlkAnqKZU81lMzaLoSX623nHLAun6vlyu3QN1uQG9KbddIYouEVr+VI+Zkq+0fF
         ZmCg==
X-Gm-Message-State: AOAM533fFs1w3p55bBEiXeWfPey79tXQKxsYIIQA3WWPjZlLSsidqRIN
        Mg5SH+6JJq22peUQGZf3A8o=
X-Google-Smtp-Source: ABdhPJyg9wd28aIKCB7Qr5i2k3Uonygdv4vLzg03mrNoStf/cbevsvXVu5iPt5lqKZ3Y279TAxj+5w==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr14531922wrz.11.1615046236423;
        Sat, 06 Mar 2021 07:57:16 -0800 (PST)
Received: from skynet.lan (224.red-2-138-103.dynamicip.rima-tde.net. [2.138.103.224])
        by smtp.gmail.com with ESMTPSA id p6sm9315188wru.2.2021.03.06.07.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:57:16 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 03/15] pinctrl: bcm: add bcm63xx base code
Date:   Sat,  6 Mar 2021 16:57:00 +0100
Message-Id: <20210306155712.4298-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210306155712.4298-1-noltari@gmail.com>
References: <20210306155712.4298-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper for registering BCM63XX pin controllers.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v5: add changes suggested by Andy Shevchenko
 v4: drop IRQ selects from Kconfig and add missing of_node_put()
 v3: add new patch with shared code

 drivers/pinctrl/bcm/Kconfig           |   7 ++
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 112 ++++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h |  43 ++++++++++
 4 files changed, 163 insertions(+)
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
index 000000000000..0a8906e4261b
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -0,0 +1,112 @@
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

