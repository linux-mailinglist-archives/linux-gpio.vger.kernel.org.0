Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F7832C7D9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239422AbhCDAc6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383614AbhCCOjg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 09:39:36 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130A9C06178C;
        Wed,  3 Mar 2021 06:23:15 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u125so6496022wmg.4;
        Wed, 03 Mar 2021 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4hHu7W2oRzk5qiRrB5nlsvyLdtqpOWE5rb4fvTy7bMA=;
        b=JkscVNpRdlAfmRd8zbhYlMVh3LN1wfc6uZql47Brx8s+UT1m79VLBl7LL6KamAZ3vp
         e1E7tb+6lKAhmy6REVAtHyJLu8R1cWJFamPayDcTtRGSqCkc7TXay6KqNeXZuuxWGMp1
         E11yzNLfAtuTRQCo23q0MEXbJl3xwls0D2Wryuc/gdGGgrFg485cLCxPZyZEijtJOugg
         Xi8GutDk7TS8hZFzkI8DW+0DrMRGZC54ZYc8Uzu5qNkhVC4Gh78JQfvBcCz3HBpQ6G/H
         +1PFinAs8UiUNxYxecmcc3/Zl2XBxwrGVCDpqNvafs6Hd34QiSRTY1A1a+lfO1D3Az0Z
         Q1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hHu7W2oRzk5qiRrB5nlsvyLdtqpOWE5rb4fvTy7bMA=;
        b=s0adV/L8hAKFuJ5ZiOgf9zJnxxxsv/Mfg2OojyC8yLm0PQWpslGAQGmm41TG4KggrO
         L9n01g+dC49v2UB+iZ4acSYLCeERaN7fV5rRUCL87VoyGCy8cxLoxknDyJhH3ctnkx5A
         GkpfLnKf64liQ2RBLyc5LoDVx18rK4ur6AkzAw+tKUFHwaCCVz2Cxok1JtaGWluiMwoa
         vfYJlh6Z/koxAXsUrFBLJWpss0Not8sKHH/RKReGD+evX/baywWLd0Mfy3F+9eFI6qsn
         FTZQxln7C9dgWdaA1iWSKMqGzses2UKdA6Y2y9lKsjAnOhBuM+XH/likFriHLtJCyzs8
         yioQ==
X-Gm-Message-State: AOAM530R7m+SfElMa4k9BOnALH1EkiV5bISnhcnvwj9C+qeDkGVpQIDE
        w0EQhTTvywkwamwiQyR1Dmg=
X-Google-Smtp-Source: ABdhPJysZ+Y5NM+6FZz/PSWR/7JtCoxdp8xPbwzIauZ2KvDcku709ka0053l9O943bE6P/EwtPtGVQ==
X-Received: by 2002:a05:600c:4292:: with SMTP id v18mr9251279wmc.23.1614781393761;
        Wed, 03 Mar 2021 06:23:13 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b15sm7876219wmd.41.2021.03.03.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:23:13 -0800 (PST)
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
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 02/14] pinctrl: bcm: add bcm63xx base code
Date:   Wed,  3 Mar 2021 15:22:58 +0100
Message-Id: <20210303142310.6371-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303142310.6371-1-noltari@gmail.com>
References: <20210303142310.6371-1-noltari@gmail.com>
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
 v3: add new patch with shared code.

 drivers/pinctrl/bcm/Kconfig           |   9 ++
 drivers/pinctrl/bcm/Makefile          |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c | 113 ++++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h |  46 +++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63xx.h

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 0ed14de0134c..9c29b23b84f4 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -29,6 +29,15 @@ config PINCTRL_BCM2835
 	help
 	   Say Y here to enable the Broadcom BCM2835 GPIO driver.
 
+config PINCTRL_BCM63XX
+	bool
+	select GENERIC_PINCONF
+	select GPIO_REGMAP
+	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
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
index 000000000000..9a2781454c14
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.c
@@ -0,0 +1,113 @@
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

