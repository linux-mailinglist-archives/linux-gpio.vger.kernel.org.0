Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED943142D8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhBHWY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:57 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49701 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhBHWYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:52 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M58SY-1lALNj34rs-001Cu5; Mon, 08 Feb 2021 23:22:15 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 07/12] gpio: amd-fch: add oftree probing support
Date:   Mon,  8 Feb 2021 23:21:58 +0100
Message-Id: <20210208222203.22335-8-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:yTfMa/Q6JJwUZY+PPtP27G34rsIXtNT7w2QEAriQh7lzWzb8EOn
 r445EViP6HeIxHFmne2s3OKQ+BXq6kE05vthvyALzNGkxWM89QE1qNZykBBgx027Fldx4Bq
 bBO50iRiQDUndKYhtYoETSw84zA9vXFAQxkEV2C1R1pZT2nr/cQWY9X/6K8flGh7u9h8tZZ
 kV5OgQGBKuUlli3FqlWfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LxJTd96Aqis=:J6IRJlk1Ktory7oriGNIDR
 Vyrp6CCMyaLU+9AhEMngBAlqyVZ/sZ6X8CnU4/hm0Muoijcxq0qjV9UYDmpP4a6KnzA6bu/Zn
 HZUe+Cvek6z7XHHBoKJ9uI1M7eht2QwCMztDvnD7u3pRBOzf2rw4y6TjncP/E9fpgm8aZcftm
 EfN22T1ukRfsvQhd4h6NB0pse6ukxyYkJF8Ec83deiSe50zM6Jx0Ai0XyuodgxhQdG1YuYAg1
 tBLyDc9VmvXjCC93iEL7WIYbBti0Gi83PmAqnvfO3JZGSfetznUJ0hJJpewxOHD1xioKS7kxt
 P4WlH3ztd3KD5tZCgQ6snXTUXvDrY5o3a2y4LPUiJ/oFb1vamHyENr49sDd+6BMjKpokc0Jfd
 zfBlTT5HEH7wVAufkeWM2smg/7UYr2CB/beLNcjpbnY3yO56Xn/MTmyTOGTgJ
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for probing via device tree.
---
 drivers/gpio/gpio-amd-fch.c                     | 58 +++++++++++++++++++++++++
 include/dt-bindings/gpio/amd-fch-gpio.h         | 36 +++++++++++++++
 include/linux/platform_data/gpio/gpio-amd-fch.h | 24 ++--------
 3 files changed, 98 insertions(+), 20 deletions(-)
 create mode 100644 include/dt-bindings/gpio/amd-fch-gpio.h

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 2a21354ed6a0..32024f99dae5 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -136,12 +136,61 @@ static int amd_fch_gpio_request(struct gpio_chip *chip,
 	return 0;
 }
 
+static struct amd_fch_gpio_pdata *load_pdata(struct device *dev)
+{
+	struct amd_fch_gpio_pdata *pdata;
+	int ret;
+
+	pdata = devm_kzalloc(dev, sizeof(struct amd_fch_gpio_pdata),
+			     GFP_KERNEL);
+	if (!pdata)
+		goto nomem;
+
+	pdata->gpio_num = of_property_count_elems_of_size(dev->of_node,
+							  "gpio-regs",
+							  sizeof(u32));
+	pdata->gpio_reg = devm_kzalloc(dev, sizeof(int)*pdata->gpio_num,
+				       GFP_KERNEL);
+	if (!pdata->gpio_reg)
+		goto nomem;
+
+	pdata->gpio_names = devm_kzalloc(dev, sizeof(char*)*pdata->gpio_num,
+					 GFP_KERNEL);
+	if (!pdata->gpio_names)
+		goto nomem;
+
+	ret = of_property_read_variable_u32_array(dev->of_node, "gpio-regs",
+						  pdata->gpio_reg,
+						  pdata->gpio_num,
+						  pdata->gpio_num);
+	if (ret != pdata->gpio_num) {
+		dev_err(dev, "failed reading gpio-regs from DT: %d\n", ret);
+		return NULL;
+	}
+
+	ret = of_property_read_string_array(dev->of_node, "gpio-line-names",
+					    pdata->gpio_names, pdata->gpio_num);
+	if (ret != pdata->gpio_num) {
+		dev_err(dev, "failed reading gpio-names from DT: %d\n", ret);
+		return NULL;
+	}
+
+	return pdata;
+
+nomem:
+	dev_err(dev, "load_pdata: failed allocating memory\n");
+	return NULL;
+}
+
 static int amd_fch_gpio_probe(struct platform_device *pdev)
 {
 	struct amd_fch_gpio_priv *priv;
 	struct amd_fch_gpio_pdata *pdata;
 
 	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata)
+		pdata = load_pdata(&pdev->dev);
+
 	if (!pdata) {
 		dev_err(&pdev->dev, "no platform_data\n");
 		return -ENOENT;
@@ -165,6 +214,9 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
 	priv->gc.get_direction		= amd_fch_gpio_get_direction;
 	priv->gc.get			= amd_fch_gpio_get;
 	priv->gc.set			= amd_fch_gpio_set;
+#ifdef CONFIG_OF_GPIO
+	priv->gc.of_node		= pdev->dev.of_node;
+#endif
 
 	spin_lock_init(&priv->lock);
 
@@ -177,9 +229,15 @@ static int amd_fch_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(&pdev->dev, &priv->gc, priv);
 }
 
+static const struct of_device_id amd_fch_gpio_of_match[] = {
+	{ .compatible = "amd,fch-gpio" },
+	{}
+};
+
 static struct platform_driver amd_fch_gpio_driver = {
 	.driver = {
 		.name = AMD_FCH_GPIO_DRIVER_NAME,
+		.of_match_table = amd_fch_gpio_of_match,
 	},
 	.probe = amd_fch_gpio_probe,
 };
diff --git a/include/dt-bindings/gpio/amd-fch-gpio.h b/include/dt-bindings/gpio/amd-fch-gpio.h
new file mode 100644
index 000000000000..7a47e6debcdb
--- /dev/null
+++ b/include/dt-bindings/gpio/amd-fch-gpio.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * AMD FCH gpio platform data definitions
+ *
+ * Copyright (C) 2020 metux IT consult
+ * Author: Enrico Weigelt <info@metux.net>
+ *
+ */
+
+#ifndef __DT_BINDINGS_GPIO_AMD_FCH_REGS_H
+#define __DT_BINDINGS_GPIO_AMD_FCH_REGS_H
+
+/*
+ * gpio registers addresses
+ *
+ * these regs need to be assigned by board setup, since they're wired
+ * in very board specifici was, rarely documented, this should not be
+ * available to users.
+ */
+#define AMD_FCH_GPIO_REG_GPIO49		0x40
+#define AMD_FCH_GPIO_REG_GPIO50		0x41
+#define AMD_FCH_GPIO_REG_GPIO51		0x42
+#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0	0x43
+#define AMD_FCH_GPIO_REG_GPIO57		0x44
+#define AMD_FCH_GPIO_REG_GPIO58		0x45
+#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1	0x46
+#define AMD_FCH_GPIO_REG_GPIO64		0x47
+#define AMD_FCH_GPIO_REG_GPIO68		0x48
+#define AMD_FCH_GPIO_REG_GPIO66_SPKR	0x5B
+#define AMD_FCH_GPIO_REG_GPIO71		0x4D
+#define AMD_FCH_GPIO_REG_GPIO32_GE1	0x59
+#define AMD_FCH_GPIO_REG_GPIO33_GE2	0x5A
+#define AMT_FCH_GPIO_REG_GEVT22		0x09
+
+#endif /* __DT_BINDINGS_GPIO_AMD_FCH_REGS_H */
diff --git a/include/linux/platform_data/gpio/gpio-amd-fch.h b/include/linux/platform_data/gpio/gpio-amd-fch.h
index 255d51c9d36d..336f7387e82c 100644
--- a/include/linux/platform_data/gpio/gpio-amd-fch.h
+++ b/include/linux/platform_data/gpio/gpio-amd-fch.h
@@ -11,25 +11,9 @@
 #ifndef __LINUX_PLATFORM_DATA_GPIO_AMD_FCH_H
 #define __LINUX_PLATFORM_DATA_GPIO_AMD_FCH_H
 
-#define AMD_FCH_GPIO_DRIVER_NAME "gpio_amd_fch"
+#include <dt-bindings/gpio/amd-fch-gpio.h>
 
-/*
- * gpio register index definitions
- */
-#define AMD_FCH_GPIO_REG_GPIO49		0x40
-#define AMD_FCH_GPIO_REG_GPIO50		0x41
-#define AMD_FCH_GPIO_REG_GPIO51		0x42
-#define AMD_FCH_GPIO_REG_GPIO55_DEVSLP0	0x43
-#define AMD_FCH_GPIO_REG_GPIO57		0x44
-#define AMD_FCH_GPIO_REG_GPIO58		0x45
-#define AMD_FCH_GPIO_REG_GPIO59_DEVSLP1	0x46
-#define AMD_FCH_GPIO_REG_GPIO64		0x47
-#define AMD_FCH_GPIO_REG_GPIO68		0x48
-#define AMD_FCH_GPIO_REG_GPIO66_SPKR	0x5B
-#define AMD_FCH_GPIO_REG_GPIO71		0x4D
-#define AMD_FCH_GPIO_REG_GPIO32_GE1	0x59
-#define AMD_FCH_GPIO_REG_GPIO33_GE2	0x5A
-#define AMT_FCH_GPIO_REG_GEVT22		0x09
+#define AMD_FCH_GPIO_DRIVER_NAME "gpio_amd_fch"
 
 /*
  * struct amd_fch_gpio_pdata - GPIO chip platform data
@@ -39,8 +23,8 @@
  */
 struct amd_fch_gpio_pdata {
 	int			gpio_num;
-	int			*gpio_reg;
-	const char * const	*gpio_names;
+	u32			*gpio_reg;
+	const char * 		*gpio_names;
 };
 
 #endif /* __LINUX_PLATFORM_DATA_GPIO_AMD_FCH_H */
-- 
2.11.0

