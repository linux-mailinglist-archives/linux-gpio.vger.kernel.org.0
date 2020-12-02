Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09C2CB368
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 04:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387402AbgLBD2m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 22:28:42 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:25510 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387395AbgLBD2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 22:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606879721; x=1638415721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qUhgcXAEmstFvDDTZCs254hVW5tXrcrt1MkiwYeb6Sc=;
  b=cHmdKatr/GK7zXiPLMse4kPu3J6xW8bHABnqNC76ussBlvXaHmCbhFQI
   wanAUhXSdUpulU3lnf+UdLhRh0vovKjZ19MUaqBFCYwiRopaZ2ey6qgQK
   5EXmp7uegK7o1G7YeX9gLJJ3rW2nEhMH5jN6dpCdW/jLVTK2Dqe1oufFY
   IHkqbwAJuwEE4rIOf+11s4uxGKKrJR7VyKNAiowCVNushJ/1OQOUPN9TP
   1alCgpeCh+4sqcV23J+nPfjOVp5YhVya89MZ1S/UPxhKQTEPNEFvNRxhN
   VkwtBbGsaWtb5ZlO/WcodJy3klUqil19XjOgHhIzI1NeE0uGHQIdZHowl
   A==;
IronPort-SDR: yE4rNcgJGpkMFuGB/kFF2AbbLKxgziBnW7MoKWXv8czZi5nzjhubbZCGVGVkUxUeAgPM/7qbLk
 NNFA9j8DoG4j0nnKC1ERMhli7my7C29+oYNtttNGCrwB2Nwm8QKIXtm34Y1q1NAGpfHDVXbCRm
 lZ0AMReQdpI2DvjPI0JA709qrvaXHZT8grxf1Az68KJrV7VUZcsr3dIGGUArbAGis3VY5OvOMa
 Fl4F2RukyOe1wUZgjsmWFun5OcGOMb3jSTr2SJc0LrvhxtAeolyjX0oqx68ncfzhsrgfEokiwh
 arg=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; 
   d="scan'208";a="155183562"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:32 +0800
IronPort-SDR: pWW5BQSCc0H6k3hI/Li1UNNbJt9m/CliYRsKHiHZeCH9tzjIallZ2EPns80CB/F9+RQ4As9ezx
 rh2GC3bBX0gQ7WqyZrFttVjeHJbgUPd5g=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 19:11:06 -0800
IronPort-SDR: gyr0Zvw0NdAGIsOh+cSeT8mVDmndtnYuHKACkkUn3CFAO2TpKoexk942VgpX/AMnNedmirp7Ds
 iLkPXg7s/MfQ==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.196])
  by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:30 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v4 13/21] riscv: Add Canaan Kendryte K210 reset controller
Date:   Wed,  2 Dec 2020 12:24:52 +0900
Message-Id: <20201202032500.206346-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a reset controller driver for the Canaan Kendryte K210 SoC. This
driver relies on its syscon compatible parent node (sysctl) for its
register mapping. Automatically select this driver for compilation
when the SOC_CANAAN option is selected.

The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                |   8 +++
 arch/riscv/Kconfig.socs    |   3 +
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
 5 files changed, 162 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a059ab02fa8a..c2b3d6e48cd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3837,6 +3837,14 @@ L:	linux-gpio@vger.kernel.org (pinctrl driver)
 F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
 F:	drivers/pinctrl/pinctrl-k210.c
 
+CANAAN/KENDRYTE K210 SOC RESET CONTROLLER DRIVER
+M:	Damien Le Moal <damien.lemoal@wdc.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
+F:	drivers/reset/reset-k210.c
+
 CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
 M:	Damien Le Moal <damien.lemoal@wdc.com>
 L:	linux-riscv@lists.infradead.org
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

