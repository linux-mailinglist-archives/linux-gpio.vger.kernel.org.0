Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E6D2D5D02
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 15:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389984AbgLJOGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 09:06:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5144 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729637AbgLJOGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 09:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607609195; x=1639145195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fIaxjbAWWNgcvXbbu108kFj+8gDfBhmvtKF+sYbgjzk=;
  b=G/+1bJ1ZvNqL1/1Zh9QPawQudcacWHQE/gA9vczx1TCK3wnpoLElRO5F
   CTgzhT6ulnMxJ81mG+EWTpSd40hX5ukOhviCbQ7+oT2X/ecsEN5dlpW90
   83cYOhQAaLr18dtoqV6foE/qRNdxD6LQiflzwFlWlmCyiU1bHNtMucoAs
   8DBVci5oky5hps5JwkE0dCC+Brd/wKzL5wKXX07VI/5Zlc8cmdbnSWbVH
   WqjoS2vlPINZGzC/O1Nm45q4MeVoE+ey442KKBAbNKZxczB8Wtf8ZtvFY
   bq+McyEwTSyalgAF5hvCHvMyMW3mqs9ULBswrsI6wf5I+EbfIg5yhbYME
   w==;
IronPort-SDR: D/mUh9y9XIa9VJh1Hv2oNtQjZuJkHtmmYRoEVSiA6GFe9NksMjKQXlHvcKwb+yGXRvA0UN0HTW
 5UYEaAekzkOuZ2H1qoqMuPyWUyj6/rVDsRO8iGeO79MkVyosX/A9ohrVlnGhwA19zYEJV0KK0u
 bvXSkIJbVI6/CJKgUSYuHgZfVbOx/f9BY6P9/EjJsBsrfYExkCPBXOSZ6Lytzmk1E6bm6xPWH8
 vohOBMZj8hCgqTCAQl8kHhVJB2wzQqVCQD78O2YJPuwltC1ce29sKWl9EswxVnHUFtuGNE9hzW
 r/0=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; 
   d="scan'208";a="159316741"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:03:44 +0800
IronPort-SDR: C4OI1Z+oWiWQWRb+8VGi+nncg92Dxa2OgNcmSN7z7mglmlNZ+Nc3zdmug3C/4y2ZlYuaXXwf7W
 bFXhvUJhSh2AIOruIgs1U4qOHK0BwSing=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:47:36 -0800
IronPort-SDR: MI9J0LoWl2T8JUyqwr/6OwV6eqwV8goA27vEOCD5P2Ii3wPkAMQG32urLeT2f77PfizC6gPRJe
 6dzk1oQVWPSg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:44 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v8 13/22] riscv: Add Canaan Kendryte K210 reset controller
Date:   Thu, 10 Dec 2020 23:03:04 +0900
Message-Id: <20201210140313.258739-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a reset controller driver for the Canaan Kendryte K210 SoC. This
driver relies on its syscon compatible parent node (sysctl) for its
register mapping. Default this driver compilation to y when the
SOC_CANAAN option is selected.

The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 MAINTAINERS                |   8 +++
 arch/riscv/Kconfig.socs    |   1 +
 drivers/reset/Kconfig      |  10 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k210.c | 131 +++++++++++++++++++++++++++++++++++++
 5 files changed, 151 insertions(+)
 create mode 100644 drivers/reset/reset-k210.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 85a6a0beebd1..6059a1e4caa6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3831,6 +3831,14 @@ W:	https://github.com/Cascoda/ca8210-linux.git
 F:	Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
 F:	drivers/net/ieee802154/ca8210.c
 
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
index 88ac0d1a5da4..fdefd7eff1ae 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -29,6 +29,7 @@ config SOC_CANAAN
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
 	select SIFIVE_PLIC
+	select ARCH_HAS_RESET_CONTROLLER
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 07d162b179fc..8bd4f1c34631 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -82,6 +82,16 @@ config RESET_INTEL_GW
 	  Say Y to control the reset signals provided by reset controller.
 	  Otherwise, say N.
 
+config RESET_K210
+	bool "Reset controller driver for Canaan Kendryte K210 SoC"
+	depends on (SOC_CANAAN || COMPILE_TEST) && OF
+	select MFD_SYSCON
+	default SOC_CANAAN
+	help
+	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
+	  Say Y if you want to control reset signals provided by this
+	  controller.
+
 config RESET_LANTIQ
 	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
 	default SOC_TYPE_XWAY
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 16947610cc3b..ef2e807721fa 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
+obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
new file mode 100644
index 000000000000..1b6e03522b40
--- /dev/null
+++ b/drivers/reset/reset-k210.c
@@ -0,0 +1,131 @@
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
+
+	return regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id), 1);
+}
+
+static inline int k210_rst_deassert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct k210_rst *ksr = to_k210_rst(rcdev);
+
+	return regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id), 0);
+}
+
+static int k210_rst_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	int ret;
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
+	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
+	if (ret)
+		return ret;
+
+	return reg & bit;
+}
+
+static int k210_rst_xlate(struct reset_controller_dev *rcdev,
+			  const struct of_phandle_args *reset_spec)
+{
+	unsigned long id = reset_spec->args[0];
+
+	if (!(BIT(id) & K210_RST_MASK))
+		return -EINVAL;
+
+	return id;
+}
+
+static const struct reset_control_ops k210_rst_ops = {
+	.assert		= k210_rst_assert,
+	.deassert	= k210_rst_deassert,
+	.reset		= k210_rst_reset,
+	.status		= k210_rst_status,
+};
+
+static int k210_rst_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np = of_get_parent(dev->of_node);
+	struct k210_rst *ksr;
+
+	dev_info(dev, "K210 reset controller\n");
+
+	ksr = devm_kzalloc(dev, sizeof(*ksr), GFP_KERNEL);
+	if (!ksr)
+		return -ENOMEM;
+
+	ksr->map = syscon_node_to_regmap(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(ksr->map))
+		return PTR_ERR(ksr->map);
+
+	ksr->rcdev.owner = THIS_MODULE;
+	ksr->rcdev.dev = dev;
+	ksr->rcdev.of_node = dev->of_node;
+	ksr->rcdev.ops = &k210_rst_ops;
+	ksr->rcdev.nr_resets = fls(K210_RST_MASK);
+	ksr->rcdev.of_reset_n_cells = 1;
+	ksr->rcdev.of_xlate = k210_rst_xlate;
+
+	return devm_reset_controller_register(dev, &ksr->rcdev);
+}
+
+static const struct of_device_id k210_rst_dt_ids[] = {
+	{ .compatible = "canaan,k210-rst" },
+	{ /* sentinel */ },
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
2.29.2

