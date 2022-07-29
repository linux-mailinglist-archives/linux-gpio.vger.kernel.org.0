Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33D3585012
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jul 2022 14:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiG2MZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 08:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbiG2MZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 08:25:04 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF71668DD3;
        Fri, 29 Jul 2022 05:25:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,201,1654527600"; 
   d="scan'208";a="127811501"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Jul 2022 21:25:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.113])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 63A18432833F;
        Fri, 29 Jul 2022 21:24:59 +0900 (JST)
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
Subject: [PATCH v2 2/2] drivers: pinctrl: renesas: Add RZ/G2L POEG driver support
Date:   Fri, 29 Jul 2022 13:24:48 +0100
Message-Id: <20220729122448.498690-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
References: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The output pins of the RZ/G2L general PWM timer (GPT) can be disabled
by using the port output enabling function for the GPT (POEG).

This patch series add basic support using s/w control through
sysfs to enable/disable output from GPT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Renamed the file poeg-rzg2l->rzg2l-poeg
 * Removed the macro POEGG as there is only single register and
   updated rzg2l_poeg_write() and rzg2l_poeg_read()
 * Updated error handling in probe()
Ref->v1:
 * Moved driver files from soc to pincontrol directory
 * Updated KConfig
---
 drivers/pinctrl/renesas/Kconfig           |   2 +
 drivers/pinctrl/renesas/Makefile          |   2 +
 drivers/pinctrl/renesas/poeg/Kconfig      |  12 ++
 drivers/pinctrl/renesas/poeg/Makefile     |   2 +
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c | 147 ++++++++++++++++++++++
 5 files changed, 165 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/poeg/Kconfig
 create mode 100644 drivers/pinctrl/renesas/poeg/Makefile
 create mode 100644 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 6cc6aa7304bb..5cc6f94a4105 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -311,4 +311,6 @@ config PINCTRL_PFC_SHX3
 	bool "pin control support for SH-X3" if COMPILE_TEST
 	select PINCTRL_SH_FUNC_GPIO
 
+source "drivers/pinctrl/renesas/poeg/Kconfig"
+
 endmenu
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index 558b30ce0dec..de1bb592fbf3 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -52,6 +52,8 @@ obj-$(CONFIG_PINCTRL_RZG2L)	+= pinctrl-rzg2l.o
 obj-$(CONFIG_PINCTRL_RZN1)	+= pinctrl-rzn1.o
 obj-$(CONFIG_PINCTRL_RZV2M)	+= pinctrl-rzv2m.o
 
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
index 000000000000..610bdd6182be
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_POEG_RZG2L)	+= rzg2l-poeg.o
diff --git a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
new file mode 100644
index 000000000000..0c73637f3b2c
--- /dev/null
+++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
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
+#define POEGG_SSF	BIT(3)
+
+struct rzg2l_poeg_chip {
+	struct reset_control *rstc;
+	void __iomem *mmio;
+};
+
+static void rzg2l_poeg_write(struct rzg2l_poeg_chip *chip, u32 data)
+{
+	iowrite32(data, chip->mmio);
+}
+
+static u32 rzg2l_poeg_read(struct rzg2l_poeg_chip *chip)
+{
+	return ioread32(chip->mmio);
+}
+
+static ssize_t output_disable_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);
+	unsigned int val;
+	u32 reg_val;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	reg_val = rzg2l_poeg_read(chip);
+	if (val)
+		reg_val |= POEGG_SSF;
+	else
+		reg_val &= ~POEGG_SSF;
+
+	rzg2l_poeg_write(chip, reg_val);
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
+	reg = rzg2l_poeg_read(chip);
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
+	platform_set_drvdata(pdev, chip);
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
+		goto err_pm;
+	}
+
+	ret = device_create_file(&pdev->dev, &dev_attr_output_disable);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to create poeg sysfs: %d\n", ret);
+		goto err_file;
+	}
+
+	return 0;
+
+err_file:
+	pm_runtime_put(&pdev->dev);
+err_pm:
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
+		.name = "rzg2l-poeg",
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

