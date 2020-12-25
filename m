Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1823E2E2AAA
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Dec 2020 10:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbgLYJeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Dec 2020 04:34:16 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:32384 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729292AbgLYJeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Dec 2020 04:34:14 -0500
X-IronPort-AV: E=Sophos;i="5.78,447,1599490800"; 
   d="scan'208";a="67150509"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Dec 2020 18:33:36 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A9A8C40178D8;
        Fri, 25 Dec 2020 18:33:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Date:   Fri, 25 Dec 2020 18:33:27 +0900
Message-Id: <1608888807-3117-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608888807-3117-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608888807-3117-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

The new PMIC BD9574MWF inherits features from BD9571MWV.
Add the support of new PMIC to existing bd9571mwv driver.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/bd9571mwv.c       | 76 ++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mfd/bd9571mwv.h | 17 ++++++++--
 2 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 2c1fcbb..e15b1ac 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * ROHM BD9571MWV-M MFD driver
+ * ROHM BD9571MWV-M and BD9574MVF-M core driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  * Copyright (C) 2020 Renesas Electronics Corporation
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/rohm-generic.h>
 #include <linux/module.h>
 
 #include <linux/mfd/bd9571mwv.h>
@@ -103,6 +104,72 @@ static struct regmap_irq_chip bd9571mwv_irq_chip = {
 	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
 };
 
+static const struct mfd_cell bd9574mwf_cells[] = {
+	{ .name = "bd9574mwf-regulator", },
+	{ .name = "bd9574mwf-gpio", },
+};
+
+static const struct regmap_range bd9574mwf_readable_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_VENDOR_CODE, BD9571MWV_PRODUCT_REVISION),
+	regmap_reg_range(BD9571MWV_BKUP_MODE_CNT, BD9571MWV_BKUP_MODE_CNT),
+	regmap_reg_range(BD9571MWV_DVFS_VINIT, BD9571MWV_DVFS_SETVMAX),
+	regmap_reg_range(BD9571MWV_DVFS_SETVID, BD9571MWV_DVFS_MONIVDAC),
+	regmap_reg_range(BD9571MWV_GPIO_IN, BD9571MWV_GPIO_IN),
+	regmap_reg_range(BD9571MWV_GPIO_INT, BD9571MWV_GPIO_INTMASK),
+	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTMASK),
+};
+
+static const struct regmap_access_table bd9574mwf_readable_table = {
+	.yes_ranges	= bd9574mwf_readable_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9574mwf_readable_yes_ranges),
+};
+
+static const struct regmap_range bd9574mwf_writable_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_BKUP_MODE_CNT, BD9571MWV_BKUP_MODE_CNT),
+	regmap_reg_range(BD9571MWV_DVFS_SETVID, BD9571MWV_DVFS_SETVID),
+	regmap_reg_range(BD9571MWV_GPIO_DIR, BD9571MWV_GPIO_OUT),
+	regmap_reg_range(BD9571MWV_GPIO_INT_SET, BD9571MWV_GPIO_INTMASK),
+	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTMASK),
+};
+
+static const struct regmap_access_table bd9574mwf_writable_table = {
+	.yes_ranges	= bd9574mwf_writable_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9574mwf_writable_yes_ranges),
+};
+
+static const struct regmap_range bd9574mwf_volatile_yes_ranges[] = {
+	regmap_reg_range(BD9571MWV_DVFS_MONIVDAC, BD9571MWV_DVFS_MONIVDAC),
+	regmap_reg_range(BD9571MWV_GPIO_IN, BD9571MWV_GPIO_IN),
+	regmap_reg_range(BD9571MWV_GPIO_INT, BD9571MWV_GPIO_INT),
+	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTREQ),
+};
+
+static const struct regmap_access_table bd9574mwf_volatile_table = {
+	.yes_ranges	= bd9574mwf_volatile_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9574mwf_volatile_yes_ranges),
+};
+
+static const struct regmap_config bd9574mwf_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.cache_type	= REGCACHE_RBTREE,
+	.rd_table	= &bd9574mwf_readable_table,
+	.wr_table	= &bd9574mwf_writable_table,
+	.volatile_table	= &bd9574mwf_volatile_table,
+	.max_register	= 0xff,
+};
+
+static struct regmap_irq_chip bd9574mwf_irq_chip = {
+	.name		= "bd9574mwf",
+	.status_base	= BD9571MWV_INT_INTREQ,
+	.mask_base	= BD9571MWV_INT_INTMASK,
+	.ack_base	= BD9571MWV_INT_INTREQ,
+	.init_ack_masked = true,
+	.num_regs	= 1,
+	.irqs		= bd9571mwv_irqs,
+	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
+};
+
 static int bd957x_identify(struct device *dev, struct regmap *regmap)
 {
 	unsigned int value;
@@ -162,6 +229,12 @@ static int bd9571mwv_probe(struct i2c_client *client,
 		cells = bd9571mwv_cells;
 		num_cells = ARRAY_SIZE(bd9571mwv_cells);
 		break;
+	case BD9571MWV_PRODUCT_CODE_BD9574MWF:
+		regmap_config = &bd9574mwf_regmap_config;
+		irq_chip = &bd9574mwf_irq_chip;
+		cells = bd9574mwf_cells;
+		num_cells = ARRAY_SIZE(bd9574mwf_cells);
+		break;
 	default:
 		dev_err(dev, "Unsupported device 0x%x\n", ret);
 		return -ENODEV;
@@ -190,6 +263,7 @@ static int bd9571mwv_probe(struct i2c_client *client,
 
 static const struct of_device_id bd9571mwv_of_match_table[] = {
 	{ .compatible = "rohm,bd9571mwv", },
+	{ .compatible = "rohm,bd9574mwf", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, bd9571mwv_of_match_table);
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
index e1716ec..8efd99d 100644
--- a/include/linux/mfd/bd9571mwv.h
+++ b/include/linux/mfd/bd9571mwv.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * ROHM BD9571MWV-M driver
+ * ROHM BD9571MWV-M and BD9574MWF-M driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  * Copyright (C) 2020 Renesas Electronics Corporation
@@ -14,11 +14,12 @@
 #include <linux/device.h>
 #include <linux/regmap.h>
 
-/* List of registers for BD9571MWV */
+/* List of registers for BD9571MWV and BD9574MWF */
 #define BD9571MWV_VENDOR_CODE			0x00
 #define BD9571MWV_VENDOR_CODE_VAL		0xdb
 #define BD9571MWV_PRODUCT_CODE			0x01
 #define BD9571MWV_PRODUCT_CODE_BD9571MWV	0x60
+#define BD9571MWV_PRODUCT_CODE_BD9574MWF	0x74
 #define BD9571MWV_PRODUCT_REVISION		0x02
 
 #define BD9571MWV_I2C_FUSA_MODE			0x10
@@ -48,6 +49,7 @@
 #define BD9571MWV_VD33_VID			0x44
 
 #define BD9571MWV_DVFS_VINIT			0x50
+#define BD9574MWF_VD09_VINIT			0x51
 #define BD9571MWV_DVFS_SETVMAX			0x52
 #define BD9571MWV_DVFS_BOOSTVID			0x53
 #define BD9571MWV_DVFS_SETVID			0x54
@@ -61,6 +63,7 @@
 #define BD9571MWV_GPIO_INT_SET			0x64
 #define BD9571MWV_GPIO_INT			0x65
 #define BD9571MWV_GPIO_INTMASK			0x66
+#define BD9574MWF_GPIO_MUX			0x67
 
 #define BD9571MWV_REG_KEEP(n)			(0x70 + (n))
 
@@ -70,6 +73,8 @@
 #define BD9571MWV_PROT_ERROR_STATUS2		0x83
 #define BD9571MWV_PROT_ERROR_STATUS3		0x84
 #define BD9571MWV_PROT_ERROR_STATUS4		0x85
+#define BD9574MWF_PROT_ERROR_STATUS5		0x86
+#define BD9574MWF_SYSTEM_ERROR_STATUS		0x87
 
 #define BD9571MWV_INT_INTREQ			0x90
 #define BD9571MWV_INT_INTREQ_MD1_INT		BIT(0)
@@ -82,6 +87,12 @@
 #define BD9571MWV_INT_INTREQ_BKUP_TRG_INT	BIT(7)
 #define BD9571MWV_INT_INTMASK			0x91
 
+#define BD9574MWF_SSCG_CNT			0xA0
+#define BD9574MWF_POFFB_MRB			0xA1
+#define BD9574MWF_SMRB_WR_PROT			0xA2
+#define BD9574MWF_SMRB_ASSERT			0xA3
+#define BD9574MWF_SMRB_STATUS			0xA4
+
 #define BD9571MWV_ACCESS_KEY			0xff
 
 /* Define the BD9571MWV IRQ numbers */
@@ -91,7 +102,7 @@ enum bd9571mwv_irqs {
 	BD9571MWV_IRQ_MD2_E2,
 	BD9571MWV_IRQ_PROT_ERR,
 	BD9571MWV_IRQ_GP,
-	BD9571MWV_IRQ_128H_OF,
+	BD9571MWV_IRQ_128H_OF,	/* BKUP_HOLD on BD9574MWF */
 	BD9571MWV_IRQ_WDT_OF,
 	BD9571MWV_IRQ_BKUP_TRG,
 };
-- 
2.7.4

