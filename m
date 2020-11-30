Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15D62C933E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 00:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389028AbgK3XwK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 18:52:10 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:7900 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389020AbgK3XwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 18:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606780797; x=1638316797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E+b7c8urpicJDRQUpY/CZ+PfrVONj4BhVfmCYYgqZws=;
  b=nm7n/IfbCrsbbpBnoldbDw/AapMs56MFRxJI1cO/6LGiR1fiBwbH8lan
   CTSXa23yz3z5OGyPKdFYrR2UleV5HTRLNbfqHsa2erY9juhZ+gIfvKP7q
   p4/aRcHVk7leK6o7yklAEaMfpVIjaEeAbCm71MPENyrxUcCHnfYerE6d/
   gJAGiuq49koB8KaaMzUfSndoqi+ww+mPBrggMu+LxD7UzXr9TzJweOhfb
   w40mPZsgKMV4tsqumgOaIG7CU6qTuWmITn+LxOnhoWuIgo7LkI4f5OnAm
   F034KlcRLSWS0Mxk8S1AcqbijQbFa/WpA/umxvK5Y2JqFfgFSiH4KIWOO
   w==;
IronPort-SDR: zzgd88HGtlsWwLAtXaMbBibspUSm8oQWQrecvXc+m52C/6DiCeitYFewQS1Utc8v9fIUPW1/6U
 FcX6xCejk2IN+WtJZUyU7gVtBkzbWrIC7x3dddM6XX7VZU779JF1Ma26d4M/mhjmwIIPGb8I3z
 FaP7AuwneG9Em+9IczbHtkkTUvqrHfWEIkVUB2bL8jufe8AyK8vqSwt691TqxtLEYCJFMwX0DS
 jXtM5Wc04XjRZ4s9tTrtWYIVTkeJ7RCw+S0QMcLD+qHdFwamaZL656h60VTP8RbYS5DMJ1ytzH
 9KQ=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="257538325"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:55:14 +0800
IronPort-SDR: aVcsAGa8uiLJazYeMGRkXzQ6EpFViVuKCoaVbgVlM0d1yDD/yBt3FUHjbJONtLgioLHkxyfIb0
 9Sehcc9cIvI+IjSP9jcvSx6ZhzeqIBsTA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 15:33:14 -0800
IronPort-SDR: wcVaWN6b94icwvxwh8UoFfp77ob2l+K82YjRNda35Ac3ZF2hSHhLXQokkgE1kJAwdQmVmMAmpE
 rGF0k4v87aJg==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:59 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v3 13/21] riscv: Add Canaan Kendryte K210 reset controller
Date:   Tue,  1 Dec 2020 08:48:21 +0900
Message-Id: <20201130234829.118298-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a reset controller driver for the Canaan Kendryte K210 SoC. This
driver relies on its syscon compatible parent node (sysctl) for its
register mapping. Automatically select this driver for compilation
when the SOC_CANAAN option is selected.

The MAINTAINERS file is updated to list myself as maintainer of this new
driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                |   2 +
 arch/riscv/Kconfig.socs    |   3 +
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
 5 files changed, 156 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7836f471df71..64cf5a801360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3831,8 +3831,10 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
 F:	Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
+F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 F:	drivers/clk/clk-k210.c
 F:	drivers/pinctrl/pinctrl-k210.c
+F:	drivers/reset/reset-k210.c
 F:	drivers/soc/canaan/
 F:	include/soc/canaan/
 
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
index 000000000000..2cf9a63c763d
--- /dev/null
+++ b/drivers/reset/reset-k210.c
@@ -0,0 +1,141 @@
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
+builtin_platform_driver(k210_rst_driver);
-- 
2.28.0

