Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA4A2D3ADF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgLIFir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:38:47 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15280 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgLIFiq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492325; x=1639028325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o/kx5UIskC1O2tfKPUUl2yE0Gu8+GjhqhAXmvOM1gCs=;
  b=SazazdbrsFyMOps72yw1FCFw42Rvbik0NUKdB8cS6bi/SMga+2n17mVU
   0Tss0EG1sUUuIL0Z/sWgUvFZtR6fjdCTHwC4T/yGem4NojBFe4ewY/l6F
   XFEM3I6eir2FAOvvjwlMeE5I9nVIb2mnXWsBfSoePxPHaJgPZdIHl9Iv2
   nuSPRR/qAuLJxBuwnMDYEYW7E12Qe7DMxOj8pf4K+SHfHQgVEk78V10xu
   o2Yt9Wnyyvo1guiIApePx5JTy7sJCBrCv/0Cwj0FapfutqZTsMERy4naT
   VYS+J0SxqB4UH/vZpNx1dP5xN73ZJgV+wFoAusudm7W9CglNxXDPlt7Uy
   g==;
IronPort-SDR: 3RvZUJAthhAMoi31/Yuc6NVftmLOs0gMG8JByBSvo5Cml8X4wj/tSkxUALngsBAgm0h29bOIpn
 wEOjhamrutdOvmF8YBzcumc6l2WZ4AwMVLCmDf8bfQn2DC/O3hQK/SKZIEm5oxHr31JhAvTOxx
 TLFO7jTBvz0jdrd+KOovrYrGS6GF7JuVf1edKohp3KbFZkkFMPdKKd1xewJ2DGlq/esRiXgkxm
 D2pqTnmn2XEFV5jZfWDvatGh9Yp0YsRS3p8w5NJ2p5G9KDlHTzWqFgJNRYduGENTTFhcpwFOIM
 ixU=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735917"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:37 +0800
IronPort-SDR: +c/uaPWoqw1Dj5/yd+gEnTp9AmHiZB29yWCvE16RZ5eS0zy66vxPaXizcuZpUgS9rQ0/0Z3Ixc
 3SD01Ay9LeEsn4E1+Hl3mnymma9kn0QnQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:21:04 -0800
IronPort-SDR: bibJ8y/9FXVyhCecUUZcsdn2j1JQsbdg/u/TkAS6BruWg9O+uT9Vo8tLNaHD/+wE3GMw6GHI81
 ybQ0j1xyUVDA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:36 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 13/22] riscv: Add Canaan Kendryte K210 reset controller
Date:   Wed,  9 Dec 2020 14:34:57 +0900
Message-Id: <20201209053506.122582-14-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
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
 drivers/reset/reset-k210.c | 130 +++++++++++++++++++++++++++++++++++++
 5 files changed, 150 insertions(+)
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
index 000000000000..f664c43ab405
--- /dev/null
+++ b/drivers/reset/reset-k210.c
@@ -0,0 +1,130 @@
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
+static int __init k210_rst_probe(struct platform_device *pdev)
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

