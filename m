Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A592C1CFB
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbgKXEiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:38:00 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:49807 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728953AbgKXEh7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192679; x=1637728679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Az6O/WzoiosWPFmOOsLRfis9CNZAmyhMPpEj64bfwfs=;
  b=DpJfuC/nzxVyAfV5PN+Qm8p4t9ZRlBEIR3TLOLxLj6DGreJ8tqfH83sd
   8ni2NmUbqJ5UspcgmFku6c9PnILnk9o9BgGAw/qK2kqmBxOEcFuCfzjOX
   u6RVMIpmxUlEljCy3q/+xUHfqEg9ZNpWjNndHfIjzrVx3Kt4YhoDCR0zI
   0Gozq9tVuyslgH89G/Yme+/lYtIUmdgfI/rjNc5eKNhQTR19RPfIEOxe7
   vp/7oOXe35dcejAk3/okg+U/zk0ahWz+Q4wfqFTczdUGSgLJ07fQYX+mw
   tVU14jNDvq527v+qHhM1iQRFyHeHBMpi5ZgeGNKLFGUjcR0ZSANYdE/IT
   g==;
IronPort-SDR: nVYylcPack7t7W+OFtSuUOWm7X7zNVMwG6Ch4X0w21bPXd1MgwYgZDUKQpGFRn9SuA4hV5K3kS
 yOko/KRNNoSrXo9R8TP5NeP4iECkb41eXZyh05R6217igOGhnEios5sjV5OHzijEFUprhdUjFb
 jZp5XqWIruVtIidZDshf/L+YGwgoeDNS8V+rjStQKhA2nbvaT//gFh1JDE53fAhGRsGWGnztZC
 /pT/HC/+ZgfSVAkSNHgLM8gmN4yqb+i4RwZnTlnWC/g+wQqozOSYBYIVpj0YRfXr9MtR5jXnQU
 /Zc=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498188"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:59 +0800
IronPort-SDR: /Fi3clV1PFj0I8QBvYejpJP/j5Gr38b5Vp0kEou7eueRUzrJiHJi07B8FIc5L0cIa9gMMXGRdd
 GaphQwIA29/y3zl9rz33LqPXro9gT82+A=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:42 -0800
IronPort-SDR: 3vJFMhvKc6oNnHXF4Ykfgdbx0fwN5+8XxKPrP7M7MBdSoft1daX93XIFPjW5aI8iYJnjaANihk
 7NLs27nzQ6Ig==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:56 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 13/21] riscv: Add Canaan Kendryte K210 reset controller
Date:   Tue, 24 Nov 2020 13:37:20 +0900
Message-Id: <20201124043728.199852-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a reset controller driver for the Canaan Kendryte K210 SoC. This
driver relies on its syscon compatible parent node (sysctl) for its
register mapping. Automatically select this driver for compilation
when the SOC_CANAAN option is selected.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig.socs    |   3 +
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 150 +++++++++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 68bdd664b5c2..b3cd253ec2c2 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -33,6 +33,9 @@ config SOC_CANAAN
 	select CLK_K210
 	select PINCTRL
 	select PINCTRL_K210
+	select ARCH_HAS_RESET_CONTROLLER
+	select RESET_CONTROLLER
+	select RESET_K210
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 07d162b179fc..529d206cfdfd 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -245,6 +245,15 @@ config RESET_ZYNQ
 	help
 	  This enables the reset controller driver for Xilinx Zynq SoCs.
 
+config RESET_K210
+	bool "Reset controller driver for Canaan Kendryte K210 SoC"
+	depends on RISCV && SOC_CANAAN
+	depends on OF && MFD_SYSCON
+	help
+	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
+	  Say Y if you want to control reset signals provided by this
+	  controller.
+
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 16947610cc3b..1730a31e6871 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -33,4 +33,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
+obj-$(CONFIG_RESET_K210) += reset-k210.o
 
diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
new file mode 100644
index 000000000000..1e37d657a942
--- /dev/null
+++ b/drivers/reset/reset-k210.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <soc/canaan/k210-sysctl.h>
+
+#include <dt-bindings/reset/k210-rst.h>
+
+#define K210_RST_MASK	0x27FFFFFF
+
+struct k210_rst {
+	struct regmap *map;
+	struct reset_controller_dev rcdev;
+};
+
+static inline struct k210_rst *
+to_k210_rst(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct k210_rst, rcdev);
+}
+
+static inline int k210_rst_assert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+	u32 bit = BIT(id);
+
+	if (!(bit & K210_RST_MASK))
+		return -EINVAL;
+
+	dev_dbg(rcdev->dev, "assert %lu\n", id);
+
+	regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, bit, 1);
+
+	return 0;
+}
+
+static inline int k210_rst_deassert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+	u32 bit = BIT(id);
+
+	if (!(bit & K210_RST_MASK))
+		return -EINVAL;
+
+	dev_dbg(rcdev->dev, "deassert %lu\n", id);
+
+	regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, bit, 0);
+
+	return 0;
+}
+
+static int k210_rst_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	int ret;
+
+	dev_dbg(rcdev->dev, "reset %lu\n", id);
+
+	ret = k210_rst_assert(rcdev, id);
+	if (ret == 0) {
+		udelay(10);
+		ret = k210_rst_deassert(rcdev, id);
+	}
+
+	return ret;
+}
+
+static int k210_rst_status(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+	u32 reg, bit = BIT(id);
+	int ret;
+
+	if (!(bit & K210_RST_MASK))
+		return -EINVAL;
+
+	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
+	if (ret)
+		return ret;
+
+	return ret & bit;
+}
+
+static const struct reset_control_ops k210_rst_ops = {
+	.assert		= k210_rst_assert,
+	.deassert	= k210_rst_deassert,
+	.reset		= k210_rst_reset,
+	.status		= k210_rst_status,
+};
+
+static int __init k210_rst_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct k210_rst *ksr;
+
+	dev_info(dev, "K210 reset controller\n");
+
+	if (!dev->parent) {
+		dev_err(&pdev->dev, "No parent for K210 reset controller\n");
+		return -ENODEV;
+	}
+
+	ksr = devm_kzalloc(dev, sizeof(*ksr), GFP_KERNEL);
+	if (!ksr)
+		return -ENOMEM;
+
+	ksr->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(ksr->map))
+		return PTR_ERR(ksr->map);
+
+	ksr->rcdev.owner = THIS_MODULE;
+	ksr->rcdev.dev = dev;
+	ksr->rcdev.of_node = dev->of_node;
+	ksr->rcdev.nr_resets = fls(K210_RST_MASK);
+	ksr->rcdev.ops = &k210_rst_ops;
+
+	return devm_reset_controller_register(dev, &ksr->rcdev);
+}
+
+static const struct of_device_id k210_rst_dt_ids[] = {
+	{ .compatible = "canaan,k210-rst" },
+};
+
+static struct platform_driver k210_rst_driver = {
+	.probe	= k210_rst_probe,
+	.driver = {
+		.name		= "k210-rst",
+		.of_match_table	= k210_rst_dt_ids,
+	},
+};
+
+/*
+ * Most devices on the K210 SoC need reset as part of their initialization.
+ * So initialize this driver early as part of the post core initialization.
+ */
+static int __init k210_rst_init(void)
+{
+	return platform_driver_register(&k210_rst_driver);
+}
+postcore_initcall(k210_rst_init);
-- 
2.28.0

