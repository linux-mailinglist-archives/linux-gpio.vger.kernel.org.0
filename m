Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26D22D2497
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgLHHhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:37:09 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58712 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgLHHhJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607413028; x=1638949028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yAjWctHf8AP4HagufjhcdQdx8KLubAwRXRiGmRcPLLI=;
  b=R6J7+fTIMWtinYTdOuP7aCSK8Y0WuMxWTPqxCVSzJ4dnIKB7+XKTIb0o
   /10THy+I72Ia024IG/Q7aYOaH/5uhUekMNugrj8aiLGt33WqZ7gv0h08h
   gibQjS5Lv/xJ3QNGvqvtGFa5NRy4CDhi74WS2I2+xYmqnqjwUZJhfgtZi
   01bPTLtBKV8c6NttgF8G2/r6IUjs3m9I0ZvWDiMlTyWLe4Ij2YTFSp//L
   vOFMGTnQKKoVgFi35w8Xz+zqLw+7ayGAefcCh3A1twL0piWI9XSyd31jK
   uBvZlMJhSroqcdBE7Trw38DnN2pGxtW6dPh2y6wuIY8lqdNwTN5R/go93
   g==;
IronPort-SDR: Z/HVjptHe6IXkACbjzN1kOOHVdTWa7dF4uVxCHNEXqGmUfEhArsM3rXqszpk4NmVMchPgyNHMY
 34HQ69xi9Qmm2b/uAQw5b3Xkzzj2dPlmqid0WiQLNhmFpke/bE2VsmTgdz4vzrYruWI4Bv9HmI
 st2QK75bi+66S1q4RkF+ZLkpMZVc5eqd+YD/42JhBUbydJ7F7crXNpa0Y/ALnwmqHjJyYPZRog
 kkIPmq8JBNNgxBTzuP7rw0fqsmtHSUqP8bQwFiD40F25/z0rWqTxli9ZiPUuYHyANcAPfTFj2c
 E/g=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876663"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:23 +0800
IronPort-SDR: M7sx/m1T5dTeYoemqr/bEGGAphAA5sW0qbU9cM67NRtIXtb0sQgA3peBwKbxYLyOtJICjB6tsM
 8BnIIBVlyzixTh8DirlhbuUxBuVqAbjOY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:23 -0800
IronPort-SDR: JMVJ8mx7Xy6crK0/XfKx5uj3ra4FohOSC500pUCsWh6UakvUW/4UD4PevvpK0X/1zGF/bnO2GB
 9idwlIbK9mXg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:21 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 11/21] riscv: Add Canaan Kendryte K210 clock driver
Date:   Tue,  8 Dec 2020 16:33:45 +0900
Message-Id: <20201208073355.40828-12-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
This new driver with the compatible string "canaan,k210-clk" implements
support for the full clock structure of the K210 SoC. Since it is
required for the correct operation of the SoC, this driver is
automatically selected for compilation when the SOC_CANAAN option is
selected.

With this change, the k210-sysctl driver is turned into a simple
platform driver which enables its power bus clock and triggers
populating its child nodes. This driver is also automatically selected
for compilation with the selection of SOC_CANAAN. The sysctl driver
retains the SOC early initialization code, but the implementation now
relies on the new function k210_clk_early_init() provided by the new
clk-k210 driver. This function declaration is done using the new header
file include/soc/canaan/k210-sysctl.h which also include register
definitions for the system controller.

The clock structure implemented and many of the coding ideas for the
driver come from the work by Sean Anderson on the K210 support for the
U-Boot project.

The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE
K210 SOC SYSTEM CONTROLLER DRIVER" with myself listed as maintainer
for this driver.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS                      |    8 +
 drivers/clk/Kconfig              |    8 +
 drivers/clk/Makefile             |    1 +
 drivers/clk/clk-k210.c           | 1005 ++++++++++++++++++++++++++++++
 drivers/soc/canaan/Kconfig       |   18 +-
 drivers/soc/canaan/Makefile      |    2 +-
 drivers/soc/canaan/k210-sysctl.c |  248 ++------
 include/soc/canaan/k210-sysctl.h |   43 ++
 8 files changed, 1113 insertions(+), 220 deletions(-)
 create mode 100644 drivers/clk/clk-k210.c
 create mode 100644 include/soc/canaan/k210-sysctl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f474153dbec..85a6a0beebd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3831,6 +3831,14 @@ W:	https://github.com/Cascoda/ca8210-linux.git
 F:	Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
 F:	drivers/net/ieee802154/ca8210.c
 
+CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
+M:	Damien Le Moal <damien.lemoal@wdc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
+F:	drivers/soc/canaan/
+F:	include/soc/canaan/
+
 CACHEFILES: FS-CACHE BACKEND FOR CACHING ON MOUNTED FILESYSTEMS
 M:	David Howells <dhowells@redhat.com>
 L:	linux-cachefs@redhat.com (moderated for non-subscribers)
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c715d4681a0b..bd899707cc31 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -359,6 +359,14 @@ config COMMON_CLK_FIXED_MMIO
 	help
 	  Support for Memory Mapped IO Fixed clocks
 
+config COMMON_CLK_K210
+	bool "Clock driver for the Canaan Kendryte K210 SoC"
+	depends on COMMON_CLK && OF
+	depends on RISCV && SOC_CANAAN
+	default SOC_CANAAN
+	help
+	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index da8fcf147eb1..573a060c7e57 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
 obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
 obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
 obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
+obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
 obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
 obj-$(CONFIG_COMMON_CLK_MAX77686)	+= clk-max77686.o
 obj-$(CONFIG_COMMON_CLK_MAX9485)	+= clk-max9485.o
diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
new file mode 100644
index 000000000000..1d528395527c
--- /dev/null
+++ b/drivers/clk/clk-k210.c
@@ -0,0 +1,1005 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ */
+#define pr_fmt(fmt)     "k210-clk: " fmt
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <asm/soc.h>
+#include <soc/canaan/k210-sysctl.h>
+
+#include <dt-bindings/clock/k210-clk.h>
+
+/*
+ * Clocks parameters.
+ */
+struct k210_clk_cfg {
+	const char *name;
+	u8 gate_reg;
+	u8 gate_bit;
+	u8 div_reg;
+	u8 div_shift;
+	u8 div_width;
+	u8 div_type;
+	u8 mux_reg;
+	u8 mux_bit;
+};
+
+enum k210_clk_div_type {
+	K210_DIV_NONE,
+	K210_DIV_ONE_BASED,
+	K210_DIV_DOUBLE_ONE_BASED,
+	K210_DIV_POWER_OF_TWO,
+};
+
+#define K210_GATE(_reg, _bit)	\
+	.gate_reg = (_reg),	\
+	.gate_bit = (_bit)
+#define K210_DIV(_reg, _shift, _width, _type)	\
+	.div_reg = (_reg),			\
+	.div_shift = (_shift),			\
+	.div_width = (_width),			\
+	.div_type = (_type)
+#define K210_MUX(_reg, _bit)	\
+	.mux_reg = (_reg),	\
+	.mux_bit = (_bit)
+
+static struct k210_clk_cfg k210_clks[K210_NUM_CLKS] = {
+
+	/* Gated clocks, no mux, no divider */
+	[K210_CLK_CPU] = {
+		.name = "cpu",
+		K210_GATE(K210_SYSCTL_EN_CENT, 0)
+	},
+	[K210_CLK_DMA] = {
+		.name = "dma",
+		K210_GATE(K210_SYSCTL_EN_PERI, 1)
+	},
+	[K210_CLK_FFT] = {
+		.name = "fft",
+		K210_GATE(K210_SYSCTL_EN_PERI, 4)
+	},
+	[K210_CLK_GPIO] = {
+		.name = "gpio",
+		K210_GATE(K210_SYSCTL_EN_PERI, 5)
+	},
+	[K210_CLK_UART1] = {
+		.name = "uart1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 16)
+	},
+	[K210_CLK_UART2] = {
+		.name = "uart2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 17)
+	},
+	[K210_CLK_UART3] = {
+		.name = "uart3",
+		K210_GATE(K210_SYSCTL_EN_PERI, 18)
+	},
+	[K210_CLK_FPIOA] = {
+		.name = "fpioa",
+		K210_GATE(K210_SYSCTL_EN_PERI, 20)
+	},
+	[K210_CLK_SHA] = {
+		.name = "sha",
+		K210_GATE(K210_SYSCTL_EN_PERI, 26)
+	},
+	[K210_CLK_AES] = {
+		.name = "aes",
+		K210_GATE(K210_SYSCTL_EN_PERI, 19)
+	},
+	[K210_CLK_OTP] = {
+		.name = "otp",
+		K210_GATE(K210_SYSCTL_EN_PERI, 27)
+	},
+	[K210_CLK_RTC] = {
+		.name = "rtc",
+		K210_GATE(K210_SYSCTL_EN_PERI, 29)
+	},
+
+	/* Gated divider clocks */
+	[K210_CLK_SRAM0] = {
+		.name = "sram0",
+		K210_GATE(K210_SYSCTL_EN_CENT, 1),
+		K210_DIV(K210_SYSCTL_THR0, 0, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_SRAM1] = {
+		.name = "sram1",
+		K210_GATE(K210_SYSCTL_EN_CENT, 2),
+		K210_DIV(K210_SYSCTL_THR0, 4, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_ROM] = {
+		.name = "rom",
+		K210_GATE(K210_SYSCTL_EN_PERI, 0),
+		K210_DIV(K210_SYSCTL_THR0, 16, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_DVP] = {
+		.name = "dvp",
+		K210_GATE(K210_SYSCTL_EN_PERI, 3),
+		K210_DIV(K210_SYSCTL_THR0, 12, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_APB0] = {
+		.name = "apb0",
+		K210_GATE(K210_SYSCTL_EN_CENT, 3),
+		K210_DIV(K210_SYSCTL_SEL0, 3, 3, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_APB1] = {
+		.name = "apb1",
+		K210_GATE(K210_SYSCTL_EN_CENT, 4),
+		K210_DIV(K210_SYSCTL_SEL0, 6, 3, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_APB2] = {
+		.name = "apb2",
+		K210_GATE(K210_SYSCTL_EN_CENT, 5),
+		K210_DIV(K210_SYSCTL_SEL0, 9, 3, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_AI] = {
+		.name = "ai",
+		K210_GATE(K210_SYSCTL_EN_PERI, 2),
+		K210_DIV(K210_SYSCTL_THR0, 8, 4, K210_DIV_ONE_BASED)
+	},
+	[K210_CLK_SPI0] = {
+		.name = "spi0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 6),
+		K210_DIV(K210_SYSCTL_THR1, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_SPI1] = {
+		.name = "spi1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 7),
+		K210_DIV(K210_SYSCTL_THR1, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_SPI2] = {
+		.name = "spi2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 8),
+		K210_DIV(K210_SYSCTL_THR1, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2C0] = {
+		.name = "i2c0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 13),
+		K210_DIV(K210_SYSCTL_THR5, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2C1] = {
+		.name = "i2c1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 14),
+		K210_DIV(K210_SYSCTL_THR5, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2C2] = {
+		.name = "i2c2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 15),
+		K210_DIV(K210_SYSCTL_THR5, 24, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_WDT0] = {
+		.name = "wdt0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 24),
+		K210_DIV(K210_SYSCTL_THR6, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_WDT1] = {
+		.name = "wdt1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 25),
+		K210_DIV(K210_SYSCTL_THR6, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S0] = {
+		.name = "i2s0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 10),
+		K210_DIV(K210_SYSCTL_THR3, 0, 16, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S1] = {
+		.name = "i2s1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 11),
+		K210_DIV(K210_SYSCTL_THR3, 16, 16, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S2] = {
+		.name = "i2s2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 12),
+		K210_DIV(K210_SYSCTL_THR4, 0, 16, K210_DIV_DOUBLE_ONE_BASED)
+	},
+
+	/* Divider clocks, no gate, no mux */
+	[K210_CLK_I2S0_M] = {
+		.name = "i2s0_m",
+		K210_DIV(K210_SYSCTL_THR4, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S1_M] = {
+		.name = "i2s1_m",
+		K210_DIV(K210_SYSCTL_THR4, 24, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+	[K210_CLK_I2S2_M] = {
+		.name = "i2s2_m",
+		K210_DIV(K210_SYSCTL_THR4, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
+	},
+
+	/* Muxed gated divider clocks */
+	[K210_CLK_SPI3] = {
+		.name = "spi3",
+		K210_GATE(K210_SYSCTL_EN_PERI, 9),
+		K210_DIV(K210_SYSCTL_THR1, 24, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 12)
+	},
+	[K210_CLK_TIMER0] = {
+		.name = "timer0",
+		K210_GATE(K210_SYSCTL_EN_PERI, 21),
+		K210_DIV(K210_SYSCTL_THR2,  0, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 13)
+	},
+	[K210_CLK_TIMER1] = {
+		.name = "timer1",
+		K210_GATE(K210_SYSCTL_EN_PERI, 22),
+		K210_DIV(K210_SYSCTL_THR2, 8, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 14)
+	},
+	[K210_CLK_TIMER2] = {
+		.name = "timer2",
+		K210_GATE(K210_SYSCTL_EN_PERI, 23),
+		K210_DIV(K210_SYSCTL_THR2, 16, 8, K210_DIV_DOUBLE_ONE_BASED),
+		K210_MUX(K210_SYSCTL_SEL0, 15)
+	},
+};
+
+/*
+ * PLL control register bits.
+ */
+#define K210_PLL_CLKR		GENMASK(3, 0)
+#define K210_PLL_CLKF		GENMASK(9, 4)
+#define K210_PLL_CLKOD		GENMASK(13, 10)
+#define K210_PLL_BWADJ		GENMASK(19, 14)
+#define K210_PLL_RESET		(1 << 20)
+#define K210_PLL_PWRD		(1 << 21)
+#define K210_PLL_INTFB		(1 << 22)
+#define K210_PLL_BYPASS		(1 << 23)
+#define K210_PLL_TEST		(1 << 24)
+#define K210_PLL_EN		(1 << 25)
+#define K210_PLL_SEL		GENMASK(27, 26) /* PLL2 only */
+
+/*
+ * PLL lock register bits.
+ */
+#define K210_PLL_LOCK		0
+#define K210_PLL_CLEAR_SLIP	2
+#define K210_PLL_TEST_OUT	3
+
+/*
+ * Clock selector register bits.
+ */
+#define K210_ACLK_SEL		BIT(0)
+#define K210_ACLK_DIV		GENMASK(2, 1)
+
+/*
+ * PLLs.
+ */
+enum k210_pll_id {
+	K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM
+};
+
+struct k210_pll {
+	enum k210_pll_id id;
+	void __iomem *reg;
+	void __iomem *lock;
+	u8 lock_shift;
+	u8 lock_width;
+	struct clk_hw hw;
+};
+#define to_k210_pll(hw)	container_of(hw, struct k210_pll, hw)
+
+/*
+ * PLLs configuration: by default PLL0 runs at 780 MHz and PLL1 at 299 MHz.
+ * The first 2 SRAM banks depend on ACLK/CPU clock which is by default PLL0
+ * rate divided by 2. Set PLL1 to 390 MHz so that the third SRAM bank has the
+ * same clock as the first 2.
+ */
+struct k210_pll_cfg {
+	u32 reg;
+	u8 lock_shift;
+	u8 lock_width;
+	u32 r;
+	u32 f;
+	u32 od;
+	u32 bwadj;
+};
+
+static struct k210_pll_cfg k210_plls_cfg[] = {
+	{ K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */
+	{ K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */
+	{ K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */
+};
+
+/*
+ * Indexes in the parents array of clocks used as parents to other clocks.
+ */
+enum k210_parent_idx {
+	K210_PARENT_IN0 = 0,
+	K210_PARENT_PLL0,
+	K210_PARENT_PLL1,
+	K210_PARENT_PLL2,
+	K210_PARENT_ACLK,
+	K210_PARENT_APB0,
+	K210_PARENT_APB1,
+	K210_PARENT_NUM_CLKS,
+};
+
+/**
+ * struct k210_clk - Driver data
+ * @regs: system controller registers start address
+ * @clk_lock: clock setting spinlock
+ * @plls: SoC PLLs descriptors
+ * @aclk: ACLK clock
+ * @clks: All other clocks
+ * @parents: array of pointers to clocks used as parents for muxed clocks.
+ * @clk_data: clock specifier translation for all clocks
+ */
+struct k210_clk {
+	void __iomem			*regs;
+	spinlock_t			clk_lock;
+	struct k210_pll			plls[K210_PLL_NUM];
+	struct clk_hw			aclk;
+	struct clk_hw			clks[K210_NUM_CLKS];
+	const struct clk_hw		*parents[K210_PARENT_NUM_CLKS];
+	struct clk_hw_onecell_data	*clk_data;
+};
+
+static struct k210_clk *kcl;
+
+/*
+ * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
+ */
+static void k210_aclk_set_selector(u8 sel)
+{
+	u32 reg = readl(kcl->regs + K210_SYSCTL_SEL0);
+
+	if (sel)
+		reg |= K210_ACLK_SEL;
+	else
+		reg &= K210_ACLK_SEL;
+	writel(reg, kcl->regs + K210_SYSCTL_SEL0);
+}
+
+static void k210_init_pll(struct k210_pll *pll, enum k210_pll_id id,
+			  void __iomem *base)
+{
+	pll->id = id;
+	pll->lock = base + K210_SYSCTL_PLL_LOCK;
+	pll->reg = base + k210_plls_cfg[id].reg;
+	pll->lock_shift = k210_plls_cfg[id].lock_shift;
+	pll->lock_width = k210_plls_cfg[id].lock_width;
+}
+
+static void k210_pll_wait_for_lock(struct k210_pll *pll)
+{
+	u32 reg, mask = GENMASK(pll->lock_shift + pll->lock_width - 1,
+				pll->lock_shift);
+
+	while (true) {
+		reg = readl(pll->lock);
+		if ((reg & mask) == mask)
+			break;
+
+		reg |= BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
+		writel(reg, pll->lock);
+	}
+}
+
+static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
+{
+	u32 reg = readl(pll->reg);
+	u32 mask = K210_PLL_PWRD | K210_PLL_EN;
+
+	if (reg & K210_PLL_RESET)
+		return false;
+
+	return (reg & mask) == mask;
+}
+
+static void k210_pll_enable_hw(struct k210_pll *pll)
+{
+	struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+
+	if (k210_pll_hw_is_enabled(pll))
+		goto unlock;
+
+	/*
+	 * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cores and
+	 * SRAM running.
+	 */
+	if (pll->id == K210_PLL0)
+		k210_aclk_set_selector(0);
+
+	/* Set PLL factors */
+	reg = readl(pll->reg);
+	reg &= ~GENMASK(19, 0);
+	reg |= FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
+	reg |= FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
+	reg |= FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
+	reg |= FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
+	reg |= K210_PLL_PWRD;
+	writel(reg, pll->reg);
+
+	/*
+	 * Reset the PLL: ensure reset is low before asserting it.
+	 * The magic NOPs come from the Kendryte reference SDK.
+	 */
+	reg &= ~K210_PLL_RESET;
+	writel(reg, pll->reg);
+	reg |= K210_PLL_RESET;
+	writel(reg, pll->reg);
+	nop();
+	nop();
+	reg &= ~K210_PLL_RESET;
+	writel(reg, pll->reg);
+
+	k210_pll_wait_for_lock(pll);
+
+	reg &= ~K210_PLL_BYPASS;
+	reg |= K210_PLL_EN;
+	writel(reg, pll->reg);
+
+	if (pll->id == K210_PLL0)
+		k210_aclk_set_selector(1);
+
+unlock:
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+}
+
+static void k210_pll_disable_hw(struct k210_pll *pll)
+{
+	unsigned long flags;
+	u32 reg;
+
+	/*
+	 * Bypassing before powering off is important so child clocks do not
+	 * stop working. This is especially important for pll0, the indirect
+	 * parent of the cpu clock.
+	 */
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+	reg = readl(pll->reg);
+	reg |= K210_PLL_BYPASS;
+	writel(reg, pll->reg);
+
+	reg &= ~K210_PLL_PWRD;
+	reg &= ~K210_PLL_EN;
+	writel(reg, pll->reg);
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+}
+
+static int k210_pll_enable(struct clk_hw *hw)
+{
+	k210_pll_enable_hw(to_k210_pll(hw));
+
+	return 0;
+}
+
+static void k210_pll_disable(struct clk_hw *hw)
+{
+	k210_pll_disable_hw(to_k210_pll(hw));
+}
+
+static int k210_pll_is_enabled(struct clk_hw *hw)
+{
+	return k210_pll_hw_is_enabled(to_k210_pll(hw));
+}
+
+static unsigned long k210_pll_get_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	u32 reg = readl(pll->reg);
+	u32 r, f, od;
+
+	if (reg & K210_PLL_BYPASS)
+		return parent_rate;
+
+	if (!(reg & K210_PLL_PWRD))
+		return 0;
+
+	r = FIELD_GET(K210_PLL_CLKR, reg) + 1;
+	f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
+	od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
+
+	return (u64)parent_rate * f / (r * od);
+}
+
+static const struct clk_ops k210_pll_ops = {
+	.enable		= k210_pll_enable,
+	.disable	= k210_pll_disable,
+	.is_enabled	= k210_pll_is_enabled,
+	.recalc_rate	= k210_pll_get_rate,
+};
+
+static int k210_pll2_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+
+	reg = readl(pll->reg);
+	reg &= ~K210_PLL_SEL;
+	reg |= FIELD_PREP(K210_PLL_SEL, index);
+	writel(reg, pll->reg);
+
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+
+	return 0;
+}
+
+static u8 k210_pll2_get_parent(struct clk_hw *hw)
+{
+	struct k210_pll *pll = to_k210_pll(hw);
+	u32 reg = readl(pll->reg);
+
+	return FIELD_GET(K210_PLL_SEL, reg);
+}
+
+static const struct clk_ops k210_pll2_ops = {
+	.enable		= k210_pll_enable,
+	.disable	= k210_pll_disable,
+	.is_enabled	= k210_pll_is_enabled,
+	.recalc_rate	= k210_pll_get_rate,
+	.set_parent	= k210_pll2_set_parent,
+	.get_parent	= k210_pll2_get_parent,
+};
+
+static int k210_register_pll(struct k210_pll *pll, const char *name,
+			     int num_parents, const struct clk_ops *ops)
+{
+	struct clk_init_data init = {};
+
+	init.name = name;
+	init.parent_hws = kcl->parents;
+	init.num_parents = num_parents;
+	init.ops = ops;
+	pll->hw.init = &init;
+
+	return clk_hw_register(NULL, &pll->hw);
+}
+
+static int k210_register_plls(struct device_node *np)
+{
+	int i, ret;
+
+	for (i = 0; i < K210_PLL_NUM; i++)
+		k210_init_pll(&kcl->plls[i], i, kcl->regs);
+
+	/* PLL0 and PLL1 only have IN0 as parent */
+	ret = k210_register_pll(&kcl->plls[K210_PLL0], "pll0", 1,
+				&k210_pll_ops);
+	if (ret) {
+		pr_err("%pOFP: register PLL0 failed\n", np);
+		return ret;
+	}
+	kcl->parents[K210_PARENT_PLL0] = &kcl->plls[K210_PLL0].hw;
+
+	ret = k210_register_pll(&kcl->plls[K210_PLL1], "pll1", 1,
+				&k210_pll_ops);
+	if (ret) {
+		pr_err("%pOFP: register PLL1 failed\n", np);
+		return ret;
+	}
+	kcl->parents[K210_PARENT_PLL1] = &kcl->plls[K210_PLL1].hw;
+
+	/* PLL2 has IN0, PLL0 and PLL1 as parents */
+	ret = k210_register_pll(&kcl->plls[K210_PLL2], "pll2", 3,
+				&k210_pll2_ops);
+	if (ret) {
+		pr_err("%pOFP: register PLL2 failed\n", np);
+		return ret;
+	}
+	kcl->parents[K210_PARENT_PLL2] = &kcl->plls[K210_PLL2].hw;
+
+	return 0;
+}
+
+static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
+{
+	k210_aclk_set_selector(index);
+
+	return 0;
+}
+
+static u8 k210_aclk_get_parent(struct clk_hw *hw)
+{
+	u32 sel;
+
+	sel = readl(kcl->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;
+
+	return sel ? 1 : 0;
+}
+
+static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	u32 reg = readl(kcl->regs + K210_SYSCTL_SEL0);
+	unsigned int shift;
+
+	if (!(reg & 0x1))
+		return parent_rate;
+
+	shift = FIELD_GET(K210_ACLK_DIV, reg);
+
+	return parent_rate / (2UL << shift);
+}
+
+static const struct clk_ops k210_aclk_ops = {
+	.set_parent	= k210_aclk_set_parent,
+	.get_parent	= k210_aclk_get_parent,
+	.recalc_rate	= k210_aclk_get_rate,
+};
+
+static int k210_register_aclk(struct device_node *np)
+{
+	struct clk_init_data init = {};
+	int ret;
+
+	/* ACLK has IN0 and PLL0 as parents */
+	init.name = "aclk";
+	init.parent_hws = kcl->parents;
+	init.num_parents = 2;
+	init.ops = &k210_aclk_ops;
+	kcl->aclk.init = &init;
+
+	ret = clk_hw_register(NULL, &kcl->aclk);
+	if (ret) {
+		pr_err("%pOFP: register aclk failed\n", np);
+		return ret;
+	}
+
+	kcl->parents[K210_PARENT_ACLK] = &kcl->aclk;
+
+	return 0;
+}
+
+#define to_k210_clk_id(hw)	((unsigned int)((hw) - &kcl->clks[0]))
+#define to_k210_clk_cfg(hw)	(&k210_clks[to_k210_clk_id(hw)])
+
+static u32 k210_clk_get_div_val(struct k210_clk_cfg *kclk)
+{
+	u32 reg = readl(kcl->regs + kclk->div_reg);
+
+	return (reg >> kclk->div_shift) & GENMASK(kclk->div_width - 1, 0);
+}
+
+static unsigned long k210_clk_divider(struct k210_clk_cfg *kclk,
+				      u32 div_val)
+{
+	switch (kclk->div_type) {
+	case K210_DIV_ONE_BASED:
+		return div_val + 1;
+	case K210_DIV_DOUBLE_ONE_BASED:
+		return (div_val + 1) * 2;
+	case K210_DIV_POWER_OF_TWO:
+		return 2UL << div_val;
+	case K210_DIV_NONE:
+	default:
+		return 0;
+	}
+}
+
+static int k210_clk_enable(struct clk_hw *hw)
+{
+	struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
+	unsigned long flags;
+	u32 reg;
+
+	if (!kclk->gate_reg)
+		return 0;
+
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+	reg = readl(kcl->regs + kclk->gate_reg);
+	reg |= BIT(kclk->gate_bit);
+	writel(reg, kcl->regs + kclk->gate_reg);
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+
+	return 0;
+}
+
+static void k210_clk_disable(struct clk_hw *hw)
+{
+	struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
+	unsigned long flags;
+	u32 reg;
+
+	if (!kclk->gate_reg)
+		return;
+
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+	reg = readl(kcl->regs + kclk->gate_reg);
+	reg &= ~BIT(kclk->gate_bit);
+	writel(reg, kcl->regs + kclk->gate_reg);
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+}
+
+static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
+	unsigned long flags;
+	u32 reg;
+
+	if (!kclk->mux_reg) {
+		if (WARN_ON(index != 0))
+			return -EINVAL;
+		return 0;
+	}
+
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+	reg = readl(kcl->regs + kclk->mux_reg);
+	if (index)
+		reg |= BIT(kclk->mux_bit);
+	else
+		reg &= ~BIT(kclk->mux_bit);
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+
+	return 0;
+}
+
+static u8 k210_clk_get_parent(struct clk_hw *hw)
+{
+	struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
+	unsigned long flags;
+	u32 reg, idx;
+
+	if (!kclk->mux_reg)
+		return 0;
+
+	spin_lock_irqsave(&kcl->clk_lock, flags);
+	reg = readl(kcl->regs + kclk->mux_reg);
+	idx = (reg & BIT(kclk->mux_bit)) ? 1 : 0;
+	spin_unlock_irqrestore(&kcl->clk_lock, flags);
+
+	return idx;
+}
+
+static unsigned long k210_clk_get_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
+	unsigned long divider;
+
+	if (!kclk->div_reg)
+		return parent_rate;
+
+	divider = k210_clk_divider(kclk, k210_clk_get_div_val(kclk));
+	if (WARN_ON(!divider))
+		return 0;
+
+	return parent_rate / divider;
+}
+
+static const struct clk_ops k210_clk_ops = {
+	.enable		= k210_clk_enable,
+	.disable	= k210_clk_disable,
+	.set_parent	= k210_clk_set_parent,
+	.get_parent	= k210_clk_get_parent,
+	.recalc_rate	= k210_clk_get_rate,
+};
+
+static struct clk_hw *k210_register_clk(int id, enum k210_parent_idx parent_idx,
+					int num_parents, unsigned long flags)
+{
+	struct clk_init_data init = {};
+	int ret;
+
+	init.name = k210_clks[id].name;
+	init.parent_hws = &kcl->parents[parent_idx];
+	init.num_parents = num_parents;
+	init.flags = flags;
+	init.ops = &k210_clk_ops;
+	kcl->clks[id].init = &init;
+
+	ret = clk_hw_register(NULL, &kcl->clks[id]);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &kcl->clks[id];
+}
+
+static inline struct clk_hw *k210_register_mux_clk(int id)
+{
+	/*
+	 * All muxed clocks have IN0 and PLL0 as parents: these are the
+	 * first two entries of the parents array.
+	 */
+	return k210_register_clk(id, K210_PARENT_IN0, 2, 0);
+}
+
+static inline struct clk_hw *k210_register_critical_clk(int id,
+					enum k210_parent_idx parent_idx)
+{
+	return k210_register_clk(id, parent_idx, 1, CLK_IS_CRITICAL);
+}
+
+static inline struct clk_hw *k210_register_child(int id,
+					enum k210_parent_idx parent_idx)
+{
+	return k210_register_clk(id, parent_idx, 1, 0);
+}
+
+static inline struct clk_hw *k210_register_in0_child(int id)
+{
+	return k210_register_child(id, K210_PARENT_IN0);
+}
+
+static inline struct clk_hw *k210_register_pll0_child(int id)
+{
+	return k210_register_child(id, K210_PARENT_PLL0);
+}
+
+static inline struct clk_hw *k210_register_pll2_child(int id)
+{
+	return k210_register_child(id, K210_PARENT_PLL2);
+}
+
+static inline struct clk_hw *k210_register_aclk_child(int id)
+{
+	return k210_register_child(id, K210_PARENT_ACLK);
+}
+
+static inline struct clk_hw *k210_register_apb0_child(int id)
+{
+	return k210_register_child(id, K210_PARENT_APB0);
+}
+
+static inline struct clk_hw *k210_register_apb1_child(int id)
+{
+	return k210_register_child(id, K210_PARENT_APB1);
+}
+
+static void __init k210_clk_init(struct device_node *np)
+{
+	struct device_node *sysctl_np;
+	struct clk_hw **hws;
+	struct clk *in0;
+	int i, ret;
+
+	kcl = kzalloc(sizeof(*kcl), GFP_KERNEL);
+	if (!kcl)
+		return;
+
+	kcl->clk_data = kzalloc(struct_size(kcl->clk_data, hws, K210_NUM_CLKS),
+				GFP_KERNEL);
+	if (!kcl->clk_data)
+		return;
+
+	sysctl_np = of_get_parent(np);
+	kcl->regs = of_iomap(sysctl_np, 0);
+	of_node_put(sysctl_np);
+	if (!kcl->regs) {
+		pr_err("%pOFP: failed to map registers\n", np);
+		return;
+	}
+
+	spin_lock_init(&kcl->clk_lock);
+	kcl->clk_data->num = K210_NUM_CLKS;
+	hws = kcl->clk_data->hws;
+	for (i = 0; i < K210_NUM_CLKS; i++)
+		hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	/* Get the system base fixed-rate 26MHz oscillator clock */
+	in0 = of_clk_get(np, 0);
+	if (IS_ERR(in0)) {
+		pr_err("%pOFP: failed to get base fixed-rate oscillator\n", np);
+		return;
+	}
+	kcl->parents[K210_PARENT_IN0] = __clk_get_hw(in0);
+
+	ret = k210_register_plls(np);
+	if (ret)
+		return;
+
+	ret = k210_register_aclk(np);
+	if (ret)
+		return;
+
+	/*
+	 * Critical clocks: there are no consumers of the SRAM clocks,
+	 * including the AI clock for the third SRAM bank. The CPU clock
+	 * is only referenced by the uarths serial device and so would be
+	 * disabled if the serial console is disabled. Mark all these clocks
+	 * as critical so that they are never disabled by the core clock
+	 * management.
+	 */
+	hws[K210_CLK_CPU] =
+		k210_register_critical_clk(K210_CLK_CPU, K210_PARENT_ACLK);
+	hws[K210_CLK_SRAM0] =
+		k210_register_critical_clk(K210_CLK_SRAM0, K210_PARENT_ACLK);
+	hws[K210_CLK_SRAM1] =
+		k210_register_critical_clk(K210_CLK_SRAM1, K210_PARENT_ACLK);
+	hws[K210_CLK_AI] =
+		 k210_register_critical_clk(K210_CLK_AI, K210_PARENT_PLL1);
+
+	/* Clocks with aclk as source */
+	hws[K210_CLK_DMA] = k210_register_aclk_child(K210_CLK_DMA);
+	hws[K210_CLK_FFT] = k210_register_aclk_child(K210_CLK_FFT);
+	hws[K210_CLK_ROM] = k210_register_aclk_child(K210_CLK_ROM);
+	hws[K210_CLK_DVP] = k210_register_aclk_child(K210_CLK_DVP);
+	hws[K210_CLK_APB0] = k210_register_aclk_child(K210_CLK_APB0);
+	hws[K210_CLK_APB1] = k210_register_aclk_child(K210_CLK_APB1);
+	hws[K210_CLK_APB2] = k210_register_aclk_child(K210_CLK_APB2);
+
+	/* Clocks with PLL0 as source */
+	hws[K210_CLK_SPI0] = k210_register_pll0_child(K210_CLK_SPI0);
+	hws[K210_CLK_SPI1] = k210_register_pll0_child(K210_CLK_SPI1);
+	hws[K210_CLK_SPI2] = k210_register_pll0_child(K210_CLK_SPI2);
+	hws[K210_CLK_I2C0] = k210_register_pll0_child(K210_CLK_I2C0);
+	hws[K210_CLK_I2C1] = k210_register_pll0_child(K210_CLK_I2C1);
+	hws[K210_CLK_I2C2] = k210_register_pll0_child(K210_CLK_I2C2);
+
+	/* Clocks with PLL2 as source */
+	hws[K210_CLK_I2S0] = k210_register_pll2_child(K210_CLK_I2S0);
+	hws[K210_CLK_I2S1] = k210_register_pll2_child(K210_CLK_I2S1);
+	hws[K210_CLK_I2S2] = k210_register_pll2_child(K210_CLK_I2S2);
+	hws[K210_CLK_I2S0_M] = k210_register_pll2_child(K210_CLK_I2S0_M);
+	hws[K210_CLK_I2S1_M] = k210_register_pll2_child(K210_CLK_I2S1_M);
+	hws[K210_CLK_I2S2_M] = k210_register_pll2_child(K210_CLK_I2S2_M);
+
+	/* Clocks with IN0 as source */
+	hws[K210_CLK_WDT0] = k210_register_in0_child(K210_CLK_WDT0);
+	hws[K210_CLK_WDT1] = k210_register_in0_child(K210_CLK_WDT1);
+	hws[K210_CLK_RTC] = k210_register_in0_child(K210_CLK_RTC);
+
+	/* Clocks with APB0 as source */
+	kcl->parents[K210_PARENT_APB0] = hws[K210_CLK_APB0];
+	hws[K210_CLK_GPIO] = k210_register_apb0_child(K210_CLK_GPIO);
+	hws[K210_CLK_UART1] = k210_register_apb0_child(K210_CLK_UART1);
+	hws[K210_CLK_UART2] = k210_register_apb0_child(K210_CLK_UART2);
+	hws[K210_CLK_UART3] = k210_register_apb0_child(K210_CLK_UART3);
+	hws[K210_CLK_FPIOA] = k210_register_apb0_child(K210_CLK_FPIOA);
+	hws[K210_CLK_SHA] = k210_register_apb0_child(K210_CLK_SHA);
+
+	/* Clocks with APB1 as source */
+	kcl->parents[K210_PARENT_APB1] = hws[K210_CLK_APB1];
+	hws[K210_CLK_AES] = k210_register_apb1_child(K210_CLK_AES);
+	hws[K210_CLK_OTP] = k210_register_apb1_child(K210_CLK_OTP);
+
+	/* Mux clocks with in0 or pll0 as source */
+	hws[K210_CLK_SPI3] = k210_register_mux_clk(K210_CLK_SPI3);
+	hws[K210_CLK_TIMER0] = k210_register_mux_clk(K210_CLK_TIMER0);
+	hws[K210_CLK_TIMER1] = k210_register_mux_clk(K210_CLK_TIMER1);
+	hws[K210_CLK_TIMER2] = k210_register_mux_clk(K210_CLK_TIMER2);
+
+	for (i = 0; i < K210_NUM_CLKS; i++) {
+		if (IS_ERR(hws[i])) {
+			pr_err("%pOFP: register clock %s failed %ld\n",
+			       np, k210_clks[i].name, PTR_ERR(hws[i]));
+			return;
+		}
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->clk_data);
+	if (ret) {
+		pr_err("%pOFP: add clock provider failed %d\n", np, ret);
+		return;
+	}
+
+	pr_info("%pOFP: CPU running at %lu MHz\n",
+		np, clk_hw_get_rate(hws[K210_CLK_CPU]) / 1000000);
+}
+
+CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);
+
+/*
+ * Enable PLL1 to be able to use the AI SRAM.
+ */
+void __init k210_clk_early_init(void __iomem *regs)
+{
+	struct k210_pll pll1;
+
+	/* Make sure ACLK selector is set to PLL0 */
+	k210_aclk_set_selector(1);
+
+	/* Startup PLL1 to enable the aisram bank for general memory use */
+	k210_init_pll(&pll1, K210_PLL1, regs);
+	k210_pll_enable_hw(&pll1);
+}
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 5232d13f07e5..8179b69518b4 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -1,14 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_CANAAN
-
-config K210_SYSCTL
+config SOC_K210_SYSCTL
 	bool "Canaan Kendryte K210 SoC system controller"
-	default y
-	depends on RISCV
+	depends on RISCV && SOC_CANAAN && OF
+	default SOC_CANAAN
+        select PM
+        select SIMPLE_PM_BUS
+        select SYSCON
+        select MFD_SYSCON
 	help
-	  Enables controlling the K210 various clocks and to enable
-	  general purpose use of the extra 2MB of SRAM normally
-	  reserved for the AI engine.
-
-endif
+	  Canaan Kendryte K210 SoC system controller driver.
diff --git a/drivers/soc/canaan/Makefile b/drivers/soc/canaan/Makefile
index 002d9ce95c0d..570280ad7967 100644
--- a/drivers/soc/canaan/Makefile
+++ b/drivers/soc/canaan/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_K210_SYSCTL)	+= k210-sysctl.o
+obj-$(CONFIG_SOC_K210_SYSCTL)	+= k210-sysctl.o
diff --git a/drivers/soc/canaan/k210-sysctl.c b/drivers/soc/canaan/k210-sysctl.c
index 4608fbca20e1..b9c54390fbd5 100644
--- a/drivers/soc/canaan/k210-sysctl.c
+++ b/drivers/soc/canaan/k210-sysctl.c
@@ -3,205 +3,44 @@
  * Copyright (c) 2019 Christoph Hellwig.
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  */
-#include <linux/types.h>
 #include <linux/io.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
-#include <linux/bitfield.h>
+#include <linux/of_platform.h>
+#include <linux/clk.h>
 #include <asm/soc.h>
 
-#define K210_SYSCTL_CLK0_FREQ		26000000UL
+#include <soc/canaan/k210-sysctl.h>
 
-/* Registers base address */
-#define K210_SYSCTL_SYSCTL_BASE_ADDR	0x50440000ULL
-
-/* Registers */
-#define K210_SYSCTL_PLL0		0x08
-#define K210_SYSCTL_PLL1		0x0c
-/* clkr: 4bits, clkf1: 6bits, clkod: 4bits, bwadj: 4bits */
-#define   PLL_RESET		(1 << 20)
-#define   PLL_PWR		(1 << 21)
-#define   PLL_INTFB		(1 << 22)
-#define   PLL_BYPASS		(1 << 23)
-#define   PLL_TEST		(1 << 24)
-#define   PLL_OUT_EN		(1 << 25)
-#define   PLL_TEST_EN		(1 << 26)
-#define K210_SYSCTL_PLL_LOCK		0x18
-#define   PLL0_LOCK1		(1 << 0)
-#define   PLL0_LOCK2		(1 << 1)
-#define   PLL0_SLIP_CLEAR	(1 << 2)
-#define   PLL0_TEST_CLK_OUT	(1 << 3)
-#define   PLL1_LOCK1		(1 << 8)
-#define   PLL1_LOCK2		(1 << 9)
-#define   PLL1_SLIP_CLEAR	(1 << 10)
-#define   PLL1_TEST_CLK_OUT	(1 << 11)
-#define   PLL2_LOCK1		(1 << 16)
-#define   PLL2_LOCK2		(1 << 16)
-#define   PLL2_SLIP_CLEAR	(1 << 18)
-#define   PLL2_TEST_CLK_OUT	(1 << 19)
-#define K210_SYSCTL_CLKSEL0	0x20
-#define   CLKSEL_ACLK		(1 << 0)
-#define K210_SYSCTL_CLKEN_CENT		0x28
-#define   CLKEN_CPU		(1 << 0)
-#define   CLKEN_SRAM0		(1 << 1)
-#define   CLKEN_SRAM1		(1 << 2)
-#define   CLKEN_APB0		(1 << 3)
-#define   CLKEN_APB1		(1 << 4)
-#define   CLKEN_APB2		(1 << 5)
-#define K210_SYSCTL_CLKEN_PERI		0x2c
-#define   CLKEN_ROM		(1 << 0)
-#define   CLKEN_DMA		(1 << 1)
-#define   CLKEN_AI		(1 << 2)
-#define   CLKEN_DVP		(1 << 3)
-#define   CLKEN_FFT		(1 << 4)
-#define   CLKEN_GPIO		(1 << 5)
-#define   CLKEN_SPI0		(1 << 6)
-#define   CLKEN_SPI1		(1 << 7)
-#define   CLKEN_SPI2		(1 << 8)
-#define   CLKEN_SPI3		(1 << 9)
-#define   CLKEN_I2S0		(1 << 10)
-#define   CLKEN_I2S1		(1 << 11)
-#define   CLKEN_I2S2		(1 << 12)
-#define   CLKEN_I2C0		(1 << 13)
-#define   CLKEN_I2C1		(1 << 14)
-#define   CLKEN_I2C2		(1 << 15)
-#define   CLKEN_UART1		(1 << 16)
-#define   CLKEN_UART2		(1 << 17)
-#define   CLKEN_UART3		(1 << 18)
-#define   CLKEN_AES		(1 << 19)
-#define   CLKEN_FPIO		(1 << 20)
-#define   CLKEN_TIMER0		(1 << 21)
-#define   CLKEN_TIMER1		(1 << 22)
-#define   CLKEN_TIMER2		(1 << 23)
-#define   CLKEN_WDT0		(1 << 24)
-#define   CLKEN_WDT1		(1 << 25)
-#define   CLKEN_SHA		(1 << 26)
-#define   CLKEN_OTP		(1 << 27)
-#define   CLKEN_RTC		(1 << 29)
-
-struct k210_sysctl {
-	void __iomem		*regs;
-	struct clk_hw		hw;
-};
-
-static void k210_set_bits(u32 val, void __iomem *reg)
+static int __init k210_sysctl_probe(struct platform_device *pdev)
 {
-	writel(readl(reg) | val, reg);
-}
-
-static void k210_clear_bits(u32 val, void __iomem *reg)
-{
-	writel(readl(reg) & ~val, reg);
-}
-
-static void k210_pll1_enable(void __iomem *regs)
-{
-	u32 val;
-
-	val = readl(regs + K210_SYSCTL_PLL1);
-	val &= ~GENMASK(19, 0);				/* clkr1 = 0 */
-	val |= FIELD_PREP(GENMASK(9, 4), 0x3B);		/* clkf1 = 59 */
-	val |= FIELD_PREP(GENMASK(13, 10), 0x3);	/* clkod1 = 3 */
-	val |= FIELD_PREP(GENMASK(19, 14), 0x3B);	/* bwadj1 = 59 */
-	writel(val, regs + K210_SYSCTL_PLL1);
-
-	k210_clear_bits(PLL_BYPASS, regs + K210_SYSCTL_PLL1);
-	k210_set_bits(PLL_PWR, regs + K210_SYSCTL_PLL1);
-
-	/*
-	 * Reset the pll. The magic NOPs come from the Kendryte reference SDK.
-	 */
-	k210_clear_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);
-	k210_set_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);
-	nop();
-	nop();
-	k210_clear_bits(PLL_RESET, regs + K210_SYSCTL_PLL1);
-
-	for (;;) {
-		val = readl(regs + K210_SYSCTL_PLL_LOCK);
-		if (val & PLL1_LOCK2)
-			break;
-		writel(val | PLL1_SLIP_CLEAR, regs + K210_SYSCTL_PLL_LOCK);
+	struct device *dev = &pdev->dev;
+	struct clk *pclk;
+	int ret;
+
+	dev_info(dev, "K210 system controller\n");
+
+	/* Get power bus clock */
+	pclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk),
+				     "Get bus clock failed\n");
+
+	ret = clk_prepare_enable(pclk);
+	if (ret) {
+		dev_err(dev, "Enable bus clock failed\n");
+		return ret;
 	}
 
-	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL1);
-}
-
-static unsigned long k210_sysctl_clk_recalc_rate(struct clk_hw *hw,
-		unsigned long parent_rate)
-{
-	struct k210_sysctl *s = container_of(hw, struct k210_sysctl, hw);
-	u32 clksel0, pll0;
-	u64 pll0_freq, clkr0, clkf0, clkod0;
-
-	/*
-	 * If the clock selector is not set, use the base frequency.
-	 * Otherwise, use PLL0 frequency with a frequency divisor.
-	 */
-	clksel0 = readl(s->regs + K210_SYSCTL_CLKSEL0);
-	if (!(clksel0 & CLKSEL_ACLK))
-		return K210_SYSCTL_CLK0_FREQ;
-
-	/*
-	 * Get PLL0 frequency:
-	 * freq = base frequency * clkf0 / (clkr0 * clkod0)
-	 */
-	pll0 = readl(s->regs + K210_SYSCTL_PLL0);
-	clkr0 = 1 + FIELD_GET(GENMASK(3, 0), pll0);
-	clkf0 = 1 + FIELD_GET(GENMASK(9, 4), pll0);
-	clkod0 = 1 + FIELD_GET(GENMASK(13, 10), pll0);
-	pll0_freq = clkf0 * K210_SYSCTL_CLK0_FREQ / (clkr0 * clkod0);
+	/* Populate children */
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		dev_err(dev, "Populate platform failed %d\n", ret);
 
-	/* Get the frequency divisor from the clock selector */
-	return pll0_freq / (2ULL << FIELD_GET(0x00000006, clksel0));
-}
-
-static const struct clk_ops k210_sysctl_clk_ops = {
-	.recalc_rate	= k210_sysctl_clk_recalc_rate,
-};
-
-static const struct clk_init_data k210_clk_init_data = {
-	.name		= "k210-sysctl-pll1",
-	.ops		= &k210_sysctl_clk_ops,
-};
-
-static int k210_sysctl_probe(struct platform_device *pdev)
-{
-	struct k210_sysctl *s;
-	int error;
-
-	pr_info("Kendryte K210 SoC sysctl\n");
-
-	s = devm_kzalloc(&pdev->dev, sizeof(*s), GFP_KERNEL);
-	if (!s)
-		return -ENOMEM;
-
-	s->regs = devm_ioremap_resource(&pdev->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0));
-	if (IS_ERR(s->regs))
-		return PTR_ERR(s->regs);
-
-	s->hw.init = &k210_clk_init_data;
-	error = devm_clk_hw_register(&pdev->dev, &s->hw);
-	if (error) {
-		dev_err(&pdev->dev, "failed to register clk");
-		return error;
-	}
-
-	error = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
-					    &s->hw);
-	if (error) {
-		dev_err(&pdev->dev, "adding clk provider failed\n");
-		return error;
-	}
-
-	return 0;
+	return ret;
 }
 
 static const struct of_device_id k210_sysctl_of_match[] = {
-	{ .compatible = "kendryte,k210-sysctl", },
+	{ .compatible = "canaan,k210-sysctl", },
 	{}
 };
 
@@ -212,12 +51,13 @@ static struct platform_driver k210_sysctl_driver = {
 	},
 	.probe			= k210_sysctl_probe,
 };
+builtin_platform_driver(k210_sysctl_driver);
 
-static int __init k210_sysctl_init(void)
-{
-	return platform_driver_register(&k210_sysctl_driver);
-}
-core_initcall(k210_sysctl_init);
+/*
+ * System controller registers base address and size.
+ */
+#define K210_SYSCTL_BASE_ADDR	0x50440000ULL
+#define K210_SYSCTL_BASE_SIZE	0x1000
 
 /*
  * This needs to be called very early during initialization, given that
@@ -225,24 +65,14 @@ core_initcall(k210_sysctl_init);
  */
 static void __init k210_soc_early_init(const void *fdt)
 {
-	void __iomem *regs;
-
-	regs = ioremap(K210_SYSCTL_SYSCTL_BASE_ADDR, 0x1000);
-	if (!regs)
-		panic("K210 sysctl ioremap");
-
-	/* Enable PLL1 to make the KPU SRAM useable */
-	k210_pll1_enable(regs);
-
-	k210_set_bits(PLL_OUT_EN, regs + K210_SYSCTL_PLL0);
+	void __iomem *sysctl_base;
 
-	k210_set_bits(CLKEN_CPU | CLKEN_SRAM0 | CLKEN_SRAM1,
-		      regs + K210_SYSCTL_CLKEN_CENT);
-	k210_set_bits(CLKEN_ROM | CLKEN_TIMER0 | CLKEN_RTC,
-		      regs + K210_SYSCTL_CLKEN_PERI);
+	sysctl_base = ioremap(K210_SYSCTL_BASE_ADDR, K210_SYSCTL_BASE_SIZE);
+	if (!sysctl_base)
+		panic("k210-sysctl: ioremap failed");
 
-	k210_set_bits(CLKSEL_ACLK, regs + K210_SYSCTL_CLKSEL0);
+	k210_clk_early_init(sysctl_base);
 
-	iounmap(regs);
+	iounmap(sysctl_base);
 }
-SOC_EARLY_INIT_DECLARE(generic_k210, "kendryte,k210", k210_soc_early_init);
+SOC_EARLY_INIT_DECLARE(k210_soc, "canaan,kendryte-k210", k210_soc_early_init);
diff --git a/include/soc/canaan/k210-sysctl.h b/include/soc/canaan/k210-sysctl.h
new file mode 100644
index 000000000000..0c2b2c2dabca
--- /dev/null
+++ b/include/soc/canaan/k210-sysctl.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef K210_SYSCTL_H
+#define K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller registers offsets.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_SYSCTL_GIT_ID	0x00 /* Git short commit id */
+#define K210_SYSCTL_UART_BAUD	0x04 /* Default UARTHS baud rate */
+#define K210_SYSCTL_PLL0	0x08 /* PLL0 controller */
+#define K210_SYSCTL_PLL1	0x0C /* PLL1 controller */
+#define K210_SYSCTL_PLL2	0x10 /* PLL2 controller */
+#define K210_SYSCTL_PLL_LOCK	0x18 /* PLL lock tester */
+#define K210_SYSCTL_ROM_ERROR	0x1C /* AXI ROM detector */
+#define K210_SYSCTL_SEL0	0x20 /* Clock select controller 0 */
+#define K210_SYSCTL_SEL1	0x24 /* Clock select controller 1 */
+#define K210_SYSCTL_EN_CENT	0x28 /* Central clock enable */
+#define K210_SYSCTL_EN_PERI	0x2C /* Peripheral clock enable */
+#define K210_SYSCTL_SOFT_RESET	0x30 /* Soft reset ctrl */
+#define K210_SYSCTL_PERI_RESET	0x34 /* Peripheral reset controller */
+#define K210_SYSCTL_THR0	0x38 /* Clock threshold controller 0 */
+#define K210_SYSCTL_THR1	0x3C /* Clock threshold controller 1 */
+#define K210_SYSCTL_THR2	0x40 /* Clock threshold controller 2 */
+#define K210_SYSCTL_THR3	0x44 /* Clock threshold controller 3 */
+#define K210_SYSCTL_THR4	0x48 /* Clock threshold controller 4 */
+#define K210_SYSCTL_THR5	0x4C /* Clock threshold controller 5 */
+#define K210_SYSCTL_THR6	0x50 /* Clock threshold controller 6 */
+#define K210_SYSCTL_MISC	0x54 /* Miscellaneous controller */
+#define K210_SYSCTL_PERI	0x58 /* Peripheral controller */
+#define K210_SYSCTL_SPI_SLEEP	0x5C /* SPI sleep controller */
+#define K210_SYSCTL_RESET_STAT	0x60 /* Reset source status */
+#define K210_SYSCTL_DMA_SEL0	0x64 /* DMA handshake selector 0 */
+#define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
+#define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
+
+void k210_clk_early_init(void __iomem *regs);
+
+#endif
-- 
2.28.0

