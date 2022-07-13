Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DFC573816
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 15:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbiGMNzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 09:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbiGMNzo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 09:55:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C16362CDFC;
        Wed, 13 Jul 2022 06:55:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,267,1650898800"; 
   d="scan'208";a="127722011"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jul 2022 22:55:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 64EB343AFF6F;
        Wed, 13 Jul 2022 22:55:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] drivers: pinctrl: renesas: Add POEG driver support
Date:   Wed, 13 Jul 2022 14:55:28 +0100
Message-Id: <20220713135528.1386594-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
References: <20220713135528.1386594-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The output pins of the general PWM timer (GPT) can be disabled by
using the port output enabling function for the GPT (POEG).

This patch series add basic support using s/w control through
sysfs to enable/disable output from GPT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref->v1:
 * Moved driver files from soc to pincontrol directory
 * Updated KConfig
---
 drivers/pinctrl/renesas/Kconfig           |   2 +
 drivers/pinctrl/renesas/Makefile          |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig      |  12 ++
 drivers/pinctrl/renesas/poeg/Makefile     |   2 +
 drivers/pinctrl/renesas/poeg/poeg-rzg2l.c | 147 ++++++++++++++++++++++
 5 files changed, 165 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/poeg-rzg2l.c

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 961007ce7b3a..3e75a7ee7658 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -290,4 +290,6 @@ config PINCTRL_PFC_SHX3
 	bool "pin control support for SH-X3" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
+source "drivers/pinctrl/renesas/poeg/Kconfig"
+
 endmenu
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index 5d936c154a6f..53b78c22acad 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -50,6 +50,8 @@ obj-$(CONFIG_PINCTRL_RZA2)	+= pinctrl-rza2.o
 obj-$(CONFIG_PINCTRL_RZG2L)	+= pinctrl-rzg2l.o
 obj-$(CONFIG_PINCTRL_RZN1)	+= pinctrl-rzn1.o
 
+obj-$(CONFIG_POEG_RZG2L)	+= poeg/
+
 ifeq ($(CONFIG_COMPILE_TEST),y)
 CFLAGS_pfc-sh7203.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
 CFLAGS_pfc-sh7264.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
diff --git a/drivers/pinctrl/renesas/poeg/Kconfig b/drivers/pinctrl/renesas/poeg/Kconfig
new file mode 100644
index 000000000000..efea83a60a11
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+config POEG_RZG2L
+	tristate "RZ/G2L poeg support"
+	depends on ARCH_RZG2L
+	depends on PWM_RZG2L_GPT
+	depends on HAS_IOMEM
+	help
+	  This driver exposes the General Port Output Enable for PWM found
+	  in RZ/G2L.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called poeg-rzg2l.
diff --git a/drivers/pinctrl/renesas/poeg/Makefile b/drivers/pinctrl/renesas/poeg/Makefile
new file mode 100644
index 000000000000..cc1ec08d2021
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_POEG_RZG2L)	+= poeg-rzg2l.o
diff --git a/drivers/pinctrl/renesas/poeg/poeg-rzg2l.c b/drivers/pinctrl/renesas/poeg/poeg-rzg2l.c
new file mode 100644
index 000000000000..3ef6d68be7cf
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/poeg-rzg2l.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L Port Output Enable for GPT (POEG) driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#define POEGG		0
+#define POEGG_SSF	BIT(3)
+
+struct rzg2l_poeg_chip {
+	struct reset_control *rstc;
+	void __iomem *mmio;
+};
+
+static void rzg2l_poeg_write(struct rzg2l_poeg_chip *chip, u32 reg, u32 data)
+{
+	iowrite32(data, chip->mmio + reg);
+}
+
+static u32 rzg2l_poeg_read(struct rzg2l_poeg_chip *chip, u32 reg)
+{
+	return ioread32(chip->mmio + reg);
+}
+
+static ssize_t output_disable_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);
+	unsigned int val;
+	u32 reg;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	reg = rzg2l_poeg_read(chip, POEGG);
+	if (val)
+		reg |= POEGG_SSF;
+	else
+		reg &= ~POEGG_SSF;
+
+	rzg2l_poeg_write(chip, POEGG, reg);
+
+	return ret ? : count;
+}
+
+static ssize_t output_disable_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);
+	u32 reg;
+
+	reg = rzg2l_poeg_read(chip, POEGG);
+
+	return sprintf(buf, "%u\n", (reg & POEGG_SSF) ? 1 : 0);
+}
+static DEVICE_ATTR_RW(output_disable);
+
+static const struct of_device_id rzg2l_poeg_of_table[] = {
+	{ .compatible = "renesas,rzg2l-poeg", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg2l_poeg_of_table);
+
+static int rzg2l_poeg_probe(struct platform_device *pdev)
+{
+	struct rzg2l_poeg_chip *chip;
+	int ret;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->mmio))
+		return PTR_ERR(chip->mmio);
+
+	chip->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(chip->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(chip->rstc),
+				     "get reset failed\n");
+
+	ret = reset_control_deassert(chip->rstc);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(&pdev->dev);
+	platform_set_drvdata(pdev, chip);
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
+		goto err;
+	}
+
+	ret = device_create_file(&pdev->dev, &dev_attr_output_disable);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to create poeg sysfs: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(chip->rstc);
+
+	return ret;
+}
+
+static int rzg2l_poeg_remove(struct platform_device *pdev)
+{
+	struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);
+
+	device_remove_file(&pdev->dev, &dev_attr_output_disable);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	reset_control_assert(chip->rstc);
+
+	return 0;
+}
+
+static struct platform_driver rzg2l_poeg_driver = {
+	.driver = {
+		.name = "poeg-rzg2l",
+		.of_match_table = of_match_ptr(rzg2l_poeg_of_table),
+	},
+	.probe = rzg2l_poeg_probe,
+	.remove = rzg2l_poeg_remove,
+};
+module_platform_driver(rzg2l_poeg_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L POEG Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

