Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A4714051F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgAQIPH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:15:07 -0500
Received: from lucky1.263xmail.com ([211.157.147.132]:33374 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbgAQIPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:15:07 -0500
Received: from localhost (unknown [192.168.167.69])
        by lucky1.263xmail.com (Postfix) with ESMTP id 993D98BC4A;
        Fri, 17 Jan 2020 16:14:02 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P20995T139699247118080S1579248839183075_;
        Fri, 17 Jan 2020 16:14:02 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6c49e8a0d8b6f473e9c028a05b11f82b>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de, david.wu@rock-chips.com,
        kever.yang@rock-chips.com
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, jay.xu@rock-chips.com
Subject: [PATCH v4 2/2] pinctrl: rockchip: split rockchip pinctrl driver by SoC type
Date:   Fri, 17 Jan 2020 16:13:58 +0800
Message-Id: <20200117081358.5772-3-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117081358.5772-1-jay.xu@rock-chips.com>
References: <c4ec95a7-aaf1-2331-352f-2def319a1c7d@rock-chips.com>
 <20200117081358.5772-1-jay.xu@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pinctrl-rockchip driver grows larger by adding support for
each new SoC, that make the kernel Image size too large since
it only under one config named PINCTRL_ROCKCHIP.

This patch split driver in the form of core driver + soc driver,
- pinctrl-rockchip.c defined an platform probe register function
- pinctrl-rkxxxx.c init module by matching compatible name

For rockchip_defconfig, it needs to select all PINCTRL_RKxxxx to
keep same with old driver.

For some special defconfig, it can only select one PINCTRL_RKxxxx.

Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes since v3:
- add base patch with directory change only, suggested by Robin
- rebase patch

changes since v2:
- remove rockchip_pinctrl_remove
- rename rockchip_pinctrl_* to rockchip_pctrl_*
- redule arguments for get_soc_data
- add module author for each new driver files
- add copyright for new driver files

changes since v1:
- add rockchip_pinctrl_remove
- remove unused head files in pinctrl-rockchip.h

 drivers/pinctrl/rockchip/Kconfig            |  114 +
 drivers/pinctrl/rockchip/Makefile           |   14 +
 drivers/pinctrl/rockchip/pinctrl-px30.c     |  224 ++
 drivers/pinctrl/rockchip/pinctrl-rk2928.c   |   70 +
 drivers/pinctrl/rockchip/pinctrl-rk3036.c   |   69 +
 drivers/pinctrl/rockchip/pinctrl-rk3066a.c  |   72 +
 drivers/pinctrl/rockchip/pinctrl-rk3066b.c  |   51 +
 drivers/pinctrl/rockchip/pinctrl-rk3128.c   |  161 ++
 drivers/pinctrl/rockchip/pinctrl-rk3188.c   |  147 ++
 drivers/pinctrl/rockchip/pinctrl-rk3228.c   |  225 ++
 drivers/pinctrl/rockchip/pinctrl-rk3288.c   |  210 ++
 drivers/pinctrl/rockchip/pinctrl-rk3308.c   |  420 +++
 drivers/pinctrl/rockchip/pinctrl-rk3328.c   |  272 ++
 drivers/pinctrl/rockchip/pinctrl-rk3368.c   |  125 +
 drivers/pinctrl/rockchip/pinctrl-rk3399.c   |  195 ++
 drivers/pinctrl/rockchip/pinctrl-rockchip.c | 2547 ++-----------------
 drivers/pinctrl/rockchip/pinctrl-rockchip.h |  388 +++
 drivers/pinctrl/rockchip/pinctrl-rv1108.c   |  214 ++
 18 files changed, 3149 insertions(+), 2369 deletions(-)
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-px30.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk2928.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3036.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3066a.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3066b.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3128.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3188.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3228.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3288.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3308.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3328.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3368.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rk3399.c
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rockchip.h
 create mode 100644 drivers/pinctrl/rockchip/pinctrl-rv1108.c

diff --git a/drivers/pinctrl/rockchip/Kconfig b/drivers/pinctrl/rockchip/Kconfig
index 7a0077ca32dd..4873a05108f8 100644
--- a/drivers/pinctrl/rockchip/Kconfig
+++ b/drivers/pinctrl/rockchip/Kconfig
@@ -5,8 +5,122 @@ if (ARCH_ROCKCHIP || COMPILE_TEST)
 config PINCTRL_ROCKCHIP
 	bool
 	select PINMUX
+	select PINCONF
 	select GENERIC_PINCONF
+	select GPIOLIB_IRQCHIP
 	select GENERIC_IRQ_CHIP
 	select MFD_SYSCON
 
+config PINCTRL_PX30
+	tristate "PX30 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK2928
+	tristate "RK2928 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3036
+	tristate "RK3036 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3066A
+	tristate "RK3066A pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3066B
+	tristate "RK3066B pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3128
+	tristate "RK3128 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3188
+	tristate "RK3188 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3228
+	tristate "RK3228 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3288
+	tristate "RK3288 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3308
+	tristate "RK3308 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3328
+	tristate "RK3328 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3368
+	tristate "RK3368 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RK3399
+	tristate "RK3399 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
+config PINCTRL_RV1108
+	tristate "RV1108 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_ROCKCHIP
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  SoCs on Rockchip platform.
+
 endif
diff --git a/drivers/pinctrl/rockchip/Makefile b/drivers/pinctrl/rockchip/Makefile
index 50568f4b6667..a250b60631f5 100644
--- a/drivers/pinctrl/rockchip/Makefile
+++ b/drivers/pinctrl/rockchip/Makefile
@@ -1,2 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PINCTRL_PX30)	+= pinctrl-px30.o
+obj-$(CONFIG_PINCTRL_RK2928)	+= pinctrl-rk2928.o
+obj-$(CONFIG_PINCTRL_RK3036)	+= pinctrl-rk3036.o
+obj-$(CONFIG_PINCTRL_RK3066A)	+= pinctrl-rk3066a.o
+obj-$(CONFIG_PINCTRL_RK3066B)	+= pinctrl-rk3066b.o
+obj-$(CONFIG_PINCTRL_RK3128)	+= pinctrl-rk3128.o
+obj-$(CONFIG_PINCTRL_RK3188)	+= pinctrl-rk3188.o
+obj-$(CONFIG_PINCTRL_RK3228)	+= pinctrl-rk3228.o
+obj-$(CONFIG_PINCTRL_RK3288)	+= pinctrl-rk3288.o
+obj-$(CONFIG_PINCTRL_RK3308)	+= pinctrl-rk3308.o
+obj-$(CONFIG_PINCTRL_RK3328)	+= pinctrl-rk3328.o
+obj-$(CONFIG_PINCTRL_RK3368)	+= pinctrl-rk3368.o
+obj-$(CONFIG_PINCTRL_RK3399)	+= pinctrl-rk3399.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
+obj-$(CONFIG_PINCTRL_RV1108)	+= pinctrl-rv1108.o
diff --git a/drivers/pinctrl/rockchip/pinctrl-px30.c b/drivers/pinctrl/rockchip/pinctrl-px30.c
new file mode 100644
index 000000000000..d92563cdf957
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-px30.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define PX30_PULL_PMU_OFFSET		0x10
+#define PX30_PULL_GRF_OFFSET		0x60
+#define PX30_PULL_BITS_PER_PIN		2
+#define PX30_PULL_PINS_PER_REG		8
+#define PX30_PULL_BANK_STRIDE		16
+
+#define PX30_DRV_PMU_OFFSET		0x20
+#define PX30_DRV_GRF_OFFSET		0xf0
+#define PX30_DRV_BITS_PER_PIN		2
+#define PX30_DRV_PINS_PER_REG		8
+#define PX30_DRV_BANK_STRIDE		16
+
+#define PX30_SCHMITT_PMU_OFFSET			0x38
+#define PX30_SCHMITT_GRF_OFFSET			0xc0
+#define PX30_SCHMITT_PINS_PER_PMU_REG		16
+#define PX30_SCHMITT_BANK_STRIDE		16
+#define PX30_SCHMITT_PINS_PER_GRF_REG		8
+
+static struct rockchip_mux_route_data px30_mux_route_data[] = {
+	{
+		/* cif-d2m0 */
+		.bank_num = 2,
+		.pin = 0,
+		.func = 1,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 7),
+	}, {
+		/* cif-d2m1 */
+		.bank_num = 3,
+		.pin = 3,
+		.func = 3,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 7) | BIT(7),
+	}, {
+		/* pdm-m0 */
+		.bank_num = 3,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 8),
+	}, {
+		/* pdm-m1 */
+		.bank_num = 2,
+		.pin = 22,
+		.func = 1,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 8) | BIT(8),
+	}, {
+		/* uart2-rxm0 */
+		.bank_num = 1,
+		.pin = 27,
+		.func = 2,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 10),
+	}, {
+		/* uart2-rxm1 */
+		.bank_num = 2,
+		.pin = 14,
+		.func = 2,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 10) | BIT(10),
+	}, {
+		/* uart3-rxm0 */
+		.bank_num = 0,
+		.pin = 17,
+		.func = 2,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 9),
+	}, {
+		/* uart3-rxm1 */
+		.bank_num = 1,
+		.pin = 15,
+		.func = 2,
+		.route_offset = 0x184,
+		.route_val = BIT(16 + 9) | BIT(9),
+	},
+};
+
+static void px30_calc_pull(struct rockchip_pin_bank *bank,
+			   int pin_num, struct regmap **regmap,
+			   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 32 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = PX30_PULL_PMU_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = PX30_PULL_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the 2nd bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * PX30_PULL_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / PX30_PULL_PINS_PER_REG) * 4);
+	*bit = (pin_num % PX30_PULL_PINS_PER_REG);
+	*bit *= PX30_PULL_BITS_PER_PIN;
+}
+
+static void px30_calc_drv(struct rockchip_pin_bank *bank,
+			  int pin_num, struct regmap **regmap,
+			  int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 32 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = PX30_DRV_PMU_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = PX30_DRV_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the 2nd bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * PX30_DRV_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / PX30_DRV_PINS_PER_REG) * 4);
+	*bit = (pin_num % PX30_DRV_PINS_PER_REG);
+	*bit *= PX30_DRV_BITS_PER_PIN;
+}
+
+static int px30_calc_schmitt(struct rockchip_pin_bank *bank,
+			     int pin_num,
+			     struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int pins_per_reg;
+
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = PX30_SCHMITT_PMU_OFFSET;
+		pins_per_reg = PX30_SCHMITT_PINS_PER_PMU_REG;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = PX30_SCHMITT_GRF_OFFSET;
+		pins_per_reg = PX30_SCHMITT_PINS_PER_GRF_REG;
+		*reg += (bank->bank_num  - 1) * PX30_SCHMITT_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / pins_per_reg) * 4);
+	*bit = pin_num % pins_per_reg;
+
+	return 0;
+}
+
+static struct rockchip_pin_bank px30_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1",
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2",
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT),
+};
+
+static struct rockchip_pin_ctrl px30_pin_ctrl = {
+		.pin_banks		= px30_pin_banks,
+		.nr_banks		= ARRAY_SIZE(px30_pin_banks),
+		.label			= "PX30-GPIO",
+		.type			= PX30,
+		.grf_mux_offset		= 0x0,
+		.pmu_mux_offset		= 0x0,
+		.iomux_routes		= px30_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(px30_mux_route_data),
+		.pull_calc_reg		= px30_calc_pull,
+		.drv_calc_reg		= px30_calc_drv,
+		.schmitt_calc_reg	= px30_calc_schmitt,
+};
+
+static const struct of_device_id px30_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,px30-pinctrl",
+		.data = &px30_pin_ctrl },
+	{},
+};
+
+static struct platform_driver px30_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "px30-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = px30_pinctrl_dt_match,
+	},
+};
+
+static int __init px30_pinctrl_init(void)
+{
+	return platform_driver_register(&px30_pinctrl_driver);
+}
+postcore_initcall(px30_pinctrl_init);
+
+MODULE_DESCRIPTION("PX30 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk2928.c b/drivers/pinctrl/rockchip/pinctrl-rk2928.c
new file mode 100644
index 000000000000..14bca5b427da
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk2928.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK2928_PULL_OFFSET		0x118
+#define RK2928_PULL_PINS_PER_REG	16
+#define RK2928_PULL_BANK_STRIDE		8
+
+static void rk2928_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK2928_PULL_OFFSET;
+	*reg += bank->bank_num * RK2928_PULL_BANK_STRIDE;
+	*reg += (pin_num / RK2928_PULL_PINS_PER_REG) * 4;
+
+	*bit = pin_num % RK2928_PULL_PINS_PER_REG;
+};
+
+static struct rockchip_pin_bank rk2928_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk2928_pin_ctrl = {
+		.pin_banks		= rk2928_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk2928_pin_banks),
+		.label			= "RK2928-GPIO",
+		.type			= RK2928,
+		.grf_mux_offset		= 0xa8,
+		.pull_calc_reg		= rk2928_calc_pull,
+};
+
+static const struct of_device_id rk2928_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk2928-pinctrl",
+		.data = &rk2928_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk2928_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk2928-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk2928_pinctrl_dt_match,
+	},
+};
+
+static int __init rk2928_pinctrl_init(void)
+{
+	return platform_driver_register(&rk2928_pinctrl_driver);
+}
+postcore_initcall(rk2928_pinctrl_init);
+
+MODULE_DESCRIPTION("RK2928 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3036.c b/drivers/pinctrl/rockchip/pinctrl-rk3036.c
new file mode 100644
index 000000000000..78363fc892de
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3036.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3036_PULL_OFFSET		0x118
+#define RK3036_PULL_PINS_PER_REG	16
+#define RK3036_PULL_BANK_STRIDE		8
+
+static void rk3036_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3036_PULL_OFFSET;
+	*reg += bank->bank_num * RK3036_PULL_BANK_STRIDE;
+	*reg += (pin_num / RK3036_PULL_PINS_PER_REG) * 4;
+
+	*bit = pin_num % RK3036_PULL_PINS_PER_REG;
+};
+
+static struct rockchip_pin_bank rk3036_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+};
+
+static struct rockchip_pin_ctrl rk3036_pin_ctrl = {
+		.pin_banks		= rk3036_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3036_pin_banks),
+		.label			= "RK3036-GPIO",
+		.type			= RK2928,
+		.grf_mux_offset		= 0xa8,
+		.pull_calc_reg		= rk3036_calc_pull,
+};
+
+static const struct of_device_id rk3036_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3036-pinctrl",
+		.data = &rk3036_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3036_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3036-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3036_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3036_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3036_pinctrl_driver);
+}
+postcore_initcall(rk3036_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3036 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3066a.c b/drivers/pinctrl/rockchip/pinctrl-rk3066a.c
new file mode 100644
index 000000000000..476e7b2d738e
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3066a.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3066A_PULL_GRF_OFFSET		0x118
+#define RK3066A_PULL_PINS_PER_REG	16
+#define RK3066A_PULL_BANK_STRIDE		8
+
+static void rk3066a_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3066A_PULL_GRF_OFFSET;
+	*reg += bank->bank_num * RK3066A_PULL_BANK_STRIDE;
+	*reg += (pin_num / RK3066A_PULL_PINS_PER_REG) * 4;
+
+	*bit = pin_num % RK3066A_PULL_PINS_PER_REG;
+};
+
+static struct rockchip_pin_bank rk3066a_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+	PIN_BANK(4, 32, "gpio4"),
+	PIN_BANK(6, 16, "gpio6"),
+};
+
+static struct rockchip_pin_ctrl rk3066a_pin_ctrl = {
+		.pin_banks		= rk3066a_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3066a_pin_banks),
+		.label			= "RK3066-GPIO",
+		.type			= RK2928,
+		.grf_mux_offset		= 0xa8,
+		.pull_calc_reg		= rk3066a_calc_pull,
+};
+
+static const struct of_device_id rk3066a_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3066a-pinctrl",
+		.data = &rk3066a_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3066a_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3066a-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3066a_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3066a_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3066a_pinctrl_driver);
+}
+postcore_initcall(rk3066a_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3066A pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3066b.c b/drivers/pinctrl/rockchip/pinctrl-rk3066b.c
new file mode 100644
index 000000000000..7353cc8caa37
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3066b.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+static struct rockchip_pin_bank rk3066b_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk3066b_pin_ctrl = {
+		.pin_banks	= rk3066b_pin_banks,
+		.nr_banks	= ARRAY_SIZE(rk3066b_pin_banks),
+		.label		= "RK3066b-GPIO",
+		.type		= RK3066B,
+		.grf_mux_offset	= 0x60,
+};
+
+static const struct of_device_id rk3066b_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3066b-pinctrl",
+		.data = &rk3066b_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3066b_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3066b-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3066b_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3066b_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3066b_pinctrl_driver);
+}
+postcore_initcall(rk3066b_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3066B pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3128.c b/drivers/pinctrl/rockchip/pinctrl-rk3128.c
new file mode 100644
index 000000000000..da289019fd9c
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3128.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3128_PULL_GRF_OFFSET	0x118
+#define RK3128_PULL_PINS_PER_REG	16
+#define RK3128_PULL_BANK_STRIDE		8
+
+static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
+	{
+		/* spi-0 */
+		.bank_num = 1,
+		.pin = 10,
+		.func = 1,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 3) | BIT(16 + 4),
+	}, {
+		/* spi-1 */
+		.bank_num = 1,
+		.pin = 27,
+		.func = 3,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(3),
+	}, {
+		/* spi-2 */
+		.bank_num = 0,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(4),
+	}, {
+		/* i2s-0 */
+		.bank_num = 1,
+		.pin = 5,
+		.func = 1,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 5),
+	}, {
+		/* i2s-1 */
+		.bank_num = 0,
+		.pin = 14,
+		.func = 1,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 5) | BIT(5),
+	}, {
+		/* emmc-0 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 6),
+	}, {
+		/* emmc-1 */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x144,
+		.route_val = BIT(16 + 6) | BIT(6),
+	},
+};
+
+static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
+	{
+		.num = 2,
+		.pin = 20,
+		.reg = 0xe8,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 21,
+		.reg = 0xe8,
+		.bit = 4,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 22,
+		.reg = 0xe8,
+		.bit = 8,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 23,
+		.reg = 0xe8,
+		.bit = 12,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 24,
+		.reg = 0xd4,
+		.bit = 12,
+		.mask = 0x7
+	},
+};
+
+static void rk3128_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3128_PULL_GRF_OFFSET;
+	*reg += bank->bank_num * RK3128_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3128_PULL_PINS_PER_REG) * 4);
+
+	*bit = pin_num % RK3128_PULL_PINS_PER_REG;
+}
+
+static struct rockchip_pin_bank rk3128_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk3128_pin_ctrl = {
+		.pin_banks		= rk3128_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3128_pin_banks),
+		.label			= "RK3128-GPIO",
+		.type			= RK3128,
+		.grf_mux_offset		= 0xa8,
+		.iomux_recalced		= rk3128_mux_recalced_data,
+		.niomux_recalced	= ARRAY_SIZE(rk3128_mux_recalced_data),
+		.iomux_routes		= rk3128_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3128_mux_route_data),
+		.pull_calc_reg		= rk3128_calc_pull,
+};
+
+static const struct of_device_id rk3128_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3128-pinctrl",
+		.data = &rk3128_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3128_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3128-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3128_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3128_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3128_pinctrl_driver);
+}
+postcore_initcall(rk3128_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3128 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3188.c b/drivers/pinctrl/rockchip/pinctrl-rk3188.c
new file mode 100644
index 000000000000..802e3791f8b4
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3188.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3188_PULL_GRF_OFFSET		0x164
+#define RK3188_PULL_PMU_OFFSET		0x64
+#define RK3188_PULL_BITS_PER_PIN	2
+#define RK3188_PULL_PINS_PER_REG	8
+#define RK3188_PULL_BANK_STRIDE		16
+
+static void rk3188_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 12 pins of the first bank are located elsewhere */
+	if (bank->bank_num == 0 && pin_num < 12) {
+		*regmap = info->regmap_pmu ? info->regmap_pmu
+					   : bank->regmap_pull;
+		*reg = info->regmap_pmu ? RK3188_PULL_PMU_OFFSET : 0;
+		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
+		*bit *= RK3188_PULL_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_pull ? info->regmap_pull
+					    : info->regmap_base;
+		*reg = info->regmap_pull ? 0 : RK3188_PULL_GRF_OFFSET;
+
+		/* correct the offset, as it is the second pull register */
+		*reg -= 4;
+		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+
+		/*
+		 * The bits in these registers have an inverse ordering
+		 * with the lowest pin being in bits 15:14 and the highest
+		 * pin in bits 1:0
+		 */
+		*bit = 7 - (pin_num % RK3188_PULL_PINS_PER_REG);
+		*bit *= RK3188_PULL_BITS_PER_PIN;
+	}
+}
+
+static struct rockchip_pin_bank rk3188_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_GPIO_ONLY, 0, 0, 0),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk3188_pin_ctrl = {
+		.pin_banks		= rk3188_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3188_pin_banks),
+		.label			= "RK3188-GPIO",
+		.type			= RK3188,
+		.grf_mux_offset		= 0x60,
+		.pull_calc_reg		= rk3188_calc_pull,
+};
+
+static struct regmap_config rockchip_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int rk3188_pinctrl_probe(struct platform_device *pdev)
+{
+	struct rockchip_pinctrl *info;
+	int ret;
+
+	ret = rockchip_pctrl_probe(pdev);
+	if (ret)
+		return ret;
+
+	info = platform_get_drvdata(pdev);
+	if (!info)
+		return -EINVAL;
+
+	if (IS_ERR_OR_NULL(info->regmap_base)) {
+		struct resource *res;
+		void __iomem *base;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		rockchip_regmap_config.max_register = resource_size(res) - 4;
+		rockchip_regmap_config.name = "rockchip,pinctrl";
+		info->regmap_base =
+			devm_regmap_init_mmio(&pdev->dev, base,
+					      &rockchip_regmap_config);
+
+		/* to check for the old dt-bindings */
+		info->reg_size = resource_size(res);
+
+		/* Honor the old binding, with pull registers as 2nd resource */
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		rockchip_regmap_config.max_register =
+						resource_size(res) - 4;
+		rockchip_regmap_config.name = "rockchip,pinctrl-pull";
+		info->regmap_pull =
+			devm_regmap_init_mmio(&pdev->dev,
+					      base,
+					      &rockchip_regmap_config);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id rk3188_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3188-pinctrl",
+		.data = &rk3188_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3188_pinctrl_driver = {
+	.probe		= rk3188_pinctrl_probe,
+	.driver = {
+		.name	= "rk3188-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3188_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3188_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3188_pinctrl_driver);
+}
+postcore_initcall(rk3188_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3188 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3228.c b/drivers/pinctrl/rockchip/pinctrl-rk3228.c
new file mode 100644
index 000000000000..2a4e14f7dc6c
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3228.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3228_PULL_GRF_OFFSET		0x100
+#define RK3228_PULL_BITS_PER_PIN	2
+#define RK3228_PULL_PINS_PER_REG	8
+#define RK3228_PULL_BANK_STRIDE		16
+
+#define RK3228_DRV_GRF_OFFSET		0x200
+#define RK3228_DRV_BITS_PER_PIN		2
+#define RK3228_DRV_PINS_PER_REG		8
+#define RK3228_DRV_BANK_STRIDE		16
+
+static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
+	{
+		/* pwm0-0 */
+		.bank_num = 0,
+		.pin = 26,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16),
+	}, {
+		/* pwm0-1 */
+		.bank_num = 3,
+		.pin = 21,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(0),
+	}, {
+		/* pwm1-0 */
+		.bank_num = 0,
+		.pin = 27,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 1),
+	}, {
+		/* pwm1-1 */
+		.bank_num = 0,
+		.pin = 30,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 1) | BIT(1),
+	}, {
+		/* pwm2-0 */
+		.bank_num = 0,
+		.pin = 28,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2),
+	}, {
+		/* pwm2-1 */
+		.bank_num = 1,
+		.pin = 12,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* pwm3-0 */
+		.bank_num = 3,
+		.pin = 26,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* pwm3-1 */
+		.bank_num = 1,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* sdio-0_d0 */
+		.bank_num = 1,
+		.pin = 1,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 4),
+	}, {
+		/* sdio-1_d0 */
+		.bank_num = 3,
+		.pin = 2,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 4) | BIT(4),
+	}, {
+		/* spi-0_rx */
+		.bank_num = 0,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 5),
+	}, {
+		/* spi-1_rx */
+		.bank_num = 2,
+		.pin = 0,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 5) | BIT(5),
+	}, {
+		/* emmc-0_cmd */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 7),
+	}, {
+		/* emmc-1_cmd */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 7) | BIT(7),
+	}, {
+		/* uart2-0_rx */
+		.bank_num = 1,
+		.pin = 19,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 8),
+	}, {
+		/* uart2-1_rx */
+		.bank_num = 1,
+		.pin = 10,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 8) | BIT(8),
+	}, {
+		/* uart1-0_rx */
+		.bank_num = 1,
+		.pin = 10,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 11),
+	}, {
+		/* uart1-1_rx */
+		.bank_num = 3,
+		.pin = 13,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 11) | BIT(11),
+	},
+};
+
+static void rk3228_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3228_PULL_GRF_OFFSET;
+	*reg += bank->bank_num * RK3228_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3228_PULL_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3228_PULL_PINS_PER_REG);
+	*bit *= RK3228_PULL_BITS_PER_PIN;
+}
+
+static void rk3228_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3228_DRV_GRF_OFFSET;
+	*reg += bank->bank_num * RK3228_DRV_BANK_STRIDE;
+	*reg += ((pin_num / RK3228_DRV_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3228_DRV_PINS_PER_REG);
+	*bit *= RK3228_DRV_BITS_PER_PIN;
+}
+
+static struct rockchip_pin_bank rk3228_pin_banks[] = {
+	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk3228_pin_ctrl = {
+		.pin_banks		= rk3228_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3228_pin_banks),
+		.label			= "RK3228-GPIO",
+		.type			= RK3288,
+		.grf_mux_offset		= 0x0,
+		.iomux_routes		= rk3228_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3228_mux_route_data),
+		.pull_calc_reg		= rk3228_calc_pull,
+		.drv_calc_reg		= rk3228_calc_drv,
+};
+
+static const struct of_device_id rk3228_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3228-pinctrl",
+		.data = &rk3228_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3228_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3228-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3228_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3228_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3228_pinctrl_driver);
+}
+postcore_initcall(rk3228_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3228 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3288.c b/drivers/pinctrl/rockchip/pinctrl-rk3288.c
new file mode 100644
index 000000000000..d1a37833a758
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3288.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3288_PULL_GRF_OFFSET		0x140
+#define RK3288_PULL_PMU_OFFSET		0x64
+#define RK3288_PULL_BITS_PER_PIN	2
+#define RK3288_PULL_PINS_PER_REG	8
+#define RK3288_PULL_BANK_STRIDE		16
+
+#define RK3288_DRV_PMU_OFFSET		0x70
+#define RK3288_DRV_GRF_OFFSET		0x1c0
+#define RK3288_DRV_BITS_PER_PIN		2
+#define RK3288_DRV_PINS_PER_REG		8
+#define RK3288_DRV_BANK_STRIDE		16
+
+#define RK3288_GRF_GPIO6C_IOMUX		0x64
+#define GPIO6C6_SEL_WRITE_ENABLE	BIT(28)
+
+static u32 rk3288_grf_gpio6c_iomux;
+
+static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
+	{
+		/* edphdmi_cecinoutt1 */
+		.bank_num = 7,
+		.pin = 16,
+		.func = 2,
+		.route_offset = 0x264,
+		.route_val = BIT(16 + 12) | BIT(12),
+	}, {
+		/* edphdmi_cecinout */
+		.bank_num = 7,
+		.pin = 23,
+		.func = 4,
+		.route_offset = 0x264,
+		.route_val = BIT(16 + 12),
+	},
+};
+
+static void rk3288_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3288_PULL_PMU_OFFSET;
+
+		*reg += ((pin_num / RK3288_PULL_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3288_PULL_PINS_PER_REG;
+		*bit *= RK3288_PULL_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3288_PULL_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the 2nd bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK3288_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3288_PULL_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3288_PULL_PINS_PER_REG);
+		*bit *= RK3288_PULL_BITS_PER_PIN;
+	}
+}
+
+static void rk3288_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3288_DRV_PMU_OFFSET;
+
+		*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3288_DRV_PINS_PER_REG;
+		*bit *= RK3288_DRV_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3288_DRV_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the 2nd bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
+		*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
+		*bit *= RK3288_DRV_BITS_PER_PIN;
+	}
+}
+
+static struct rockchip_pin_bank rk3288_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 24, "gpio0",
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_UNROUTED),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1",
+			     IOMUX_UNROUTED,
+			     IOMUX_UNROUTED,
+			     IOMUX_UNROUTED,
+			     0),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, 0, 0,
+			     IOMUX_UNROUTED),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0,
+			     IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4",
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_WIDTH_4BIT,
+			     0, 0),
+	PIN_BANK_IOMUX_FLAGS(5, 32, "gpio5",
+			     IOMUX_UNROUTED,
+			     0, 0,
+			     IOMUX_UNROUTED),
+	PIN_BANK_IOMUX_FLAGS(6, 32, "gpio6", 0, 0, 0,
+			     IOMUX_UNROUTED),
+	PIN_BANK_IOMUX_FLAGS(7, 32, "gpio7", 0, 0,
+			     IOMUX_WIDTH_4BIT,
+			     IOMUX_UNROUTED),
+	PIN_BANK(8, 16, "gpio8"),
+};
+
+static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
+		.pin_banks		= rk3288_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3288_pin_banks),
+		.label			= "RK3288-GPIO",
+		.type			= RK3288,
+		.grf_mux_offset		= 0x0,
+		.pmu_mux_offset		= 0x84,
+		.iomux_routes		= rk3288_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3288_mux_route_data),
+		.pull_calc_reg		= rk3288_calc_pull,
+		.drv_calc_reg		= rk3288_calc_drv,
+};
+
+static int rk3288_pinctrl_suspend(struct device *dev)
+{
+	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
+	int ret = pinctrl_force_sleep(info->pctl_dev);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * RK3288 GPIO6_C6 mux would be modified by Maskrom when resume, so save
+	 * the setting here, and restore it at resume.
+	 */
+	ret = regmap_read(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
+			  &rk3288_grf_gpio6c_iomux);
+	if (ret) {
+		pinctrl_force_default(info->pctl_dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rk3288_pinctrl_resume(struct device *dev)
+{
+	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
+	int ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
+			       rk3288_grf_gpio6c_iomux |
+			       GPIO6C6_SEL_WRITE_ENABLE);
+
+	if (ret)
+		return ret;
+
+	return pinctrl_force_default(info->pctl_dev);
+}
+
+SIMPLE_DEV_PM_OPS(rk3288_pinctrl_dev_pm_ops,
+		  rk3288_pinctrl_suspend,
+		  rk3288_pinctrl_resume);
+
+static const struct of_device_id rk3288_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3288-pinctrl",
+		.data = &rk3288_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3288_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3288-pinctrl",
+		.pm = &rk3288_pinctrl_dev_pm_ops,
+		.of_match_table = rk3288_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3288_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3288_pinctrl_driver);
+}
+postcore_initcall(rk3288_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3288 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3308.c b/drivers/pinctrl/rockchip/pinctrl-rk3308.c
new file mode 100644
index 000000000000..7c9bf608c431
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3308.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3308_PULL_GRF_OFFSET		0xa0
+#define RK3308_PULL_BITS_PER_PIN	2
+#define RK3308_PULL_PINS_PER_REG	8
+#define RK3308_PULL_BANK_STRIDE		16
+
+#define RK3308_DRV_GRF_OFFSET		0x100
+#define RK3308_DRV_BITS_PER_PIN		2
+#define RK3308_DRV_PINS_PER_REG		8
+#define RK3308_DRV_BANK_STRIDE		16
+
+#define RK3308_SCHMITT_PINS_PER_REG		8
+#define RK3308_SCHMITT_BANK_STRIDE		16
+#define RK3308_SCHMITT_GRF_OFFSET		0x1a0
+
+static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
+	{
+		/* rtc_clk */
+		.bank_num = 0,
+		.pin = 19,
+		.func = 1,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 0) | BIT(0),
+	}, {
+		/* uart2_rxm0 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 2) | BIT(16 + 3),
+	}, {
+		/* uart2_rxm1 */
+		.bank_num = 4,
+		.pin = 26,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 2) | BIT(16 + 3) | BIT(2),
+	}, {
+		/* i2c3_sdam0 */
+		.bank_num = 0,
+		.pin = 15,
+		.func = 2,
+		.route_offset = 0x608,
+		.route_val = BIT(16 + 8) | BIT(16 + 9),
+	}, {
+		/* i2c3_sdam1 */
+		.bank_num = 3,
+		.pin = 12,
+		.func = 2,
+		.route_offset = 0x608,
+		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(8),
+	}, {
+		/* i2c3_sdam2 */
+		.bank_num = 2,
+		.pin = 0,
+		.func = 3,
+		.route_offset = 0x608,
+		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(9),
+	}, {
+		/* i2s-8ch-1-sclktxm0 */
+		.bank_num = 1,
+		.pin = 3,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* i2s-8ch-1-sclkrxm0 */
+		.bank_num = 1,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* i2s-8ch-1-sclktxm1 */
+		.bank_num = 1,
+		.pin = 13,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* i2s-8ch-1-sclkrxm1 */
+		.bank_num = 1,
+		.pin = 14,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 3) | BIT(3),
+	}, {
+		/* pdm-clkm0 */
+		.bank_num = 1,
+		.pin = 4,
+		.func = 3,
+		.route_offset = 0x308,
+		.route_val =  BIT(16 + 12) | BIT(16 + 13),
+	}, {
+		/* pdm-clkm1 */
+		.bank_num = 1,
+		.pin = 14,
+		.func = 4,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
+	}, {
+		/* pdm-clkm2 */
+		.bank_num = 2,
+		.pin = 6,
+		.func = 2,
+		.route_offset = 0x308,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
+	}, {
+		/* pdm-clkm-m2 */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 3,
+		.route_offset = 0x600,
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* spi1_miso */
+		.bank_num = 3,
+		.pin = 10,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 9),
+	}, {
+		/* spi1_miso_m1 */
+		.bank_num = 2,
+		.pin = 4,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 9) | BIT(9),
+	}, {
+		/* owire_m0 */
+		.bank_num = 0,
+		.pin = 11,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 10) | BIT(16 + 11),
+	}, {
+		/* owire_m1 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 7,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
+	}, {
+		/* owire_m2 */
+		.bank_num = 2,
+		.pin = 2,
+		.func = 5,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
+	}, {
+		/* can_rxd_m0 */
+		.bank_num = 0,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 12) | BIT(16 + 13),
+	}, {
+		/* can_rxd_m1 */
+		.bank_num = 1,
+		.pin = 22,
+		.func = 5,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
+	}, {
+		/* can_rxd_m2 */
+		.bank_num = 2,
+		.pin = 2,
+		.func = 4,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
+	}, {
+		/* mac_rxd0_m0 */
+		.bank_num = 1,
+		.pin = 20,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 14),
+	}, {
+		/* mac_rxd0_m1 */
+		.bank_num = 4,
+		.pin = 2,
+		.func = 2,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 14) | BIT(14),
+	}, {
+		/* uart3_rx */
+		.bank_num = 3,
+		.pin = 12,
+		.func = 4,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 15),
+	}, {
+		/* uart3_rx_m1 */
+		.bank_num = 0,
+		.pin = 17,
+		.func = 3,
+		.route_offset = 0x314,
+		.route_val = BIT(16 + 15) | BIT(15),
+	},
+};
+
+static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
+	{
+		.num = 1,
+		.pin = 14,
+		.reg = 0x28,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 15,
+		.reg = 0x2c,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 18,
+		.reg = 0x30,
+		.bit = 4,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 19,
+		.reg = 0x30,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 20,
+		.reg = 0x30,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 21,
+		.reg = 0x34,
+		.bit = 0,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 22,
+		.reg = 0x34,
+		.bit = 4,
+		.mask = 0xf
+	}, {
+		.num = 1,
+		.pin = 23,
+		.reg = 0x34,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 3,
+		.pin = 12,
+		.reg = 0x68,
+		.bit = 8,
+		.mask = 0xf
+	}, {
+		.num = 3,
+		.pin = 13,
+		.reg = 0x68,
+		.bit = 12,
+		.mask = 0xf
+	}, {
+		.num = 2,
+		.pin = 2,
+		.reg = 0x608,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 3,
+		.reg = 0x608,
+		.bit = 4,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 16,
+		.reg = 0x610,
+		.bit = 8,
+		.mask = 0x7
+	}, {
+		.num = 3,
+		.pin = 10,
+		.reg = 0x610,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 3,
+		.pin = 11,
+		.reg = 0x610,
+		.bit = 4,
+		.mask = 0x7
+	},
+};
+
+static void rk3308_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3308_PULL_GRF_OFFSET;
+	*reg += bank->bank_num * RK3308_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3308_PULL_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3308_PULL_PINS_PER_REG);
+	*bit *= RK3308_PULL_BITS_PER_PIN;
+}
+
+static void rk3308_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3308_DRV_GRF_OFFSET;
+	*reg += bank->bank_num * RK3308_DRV_BANK_STRIDE;
+	*reg += ((pin_num / RK3308_DRV_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3308_DRV_PINS_PER_REG);
+	*bit *= RK3308_DRV_BITS_PER_PIN;
+}
+
+static int rk3308_calc_schmitt(struct rockchip_pin_bank *bank,
+			       int pin_num,
+			       struct regmap **regmap,
+			       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3308_SCHMITT_GRF_OFFSET;
+
+	*reg += bank->bank_num * RK3308_SCHMITT_BANK_STRIDE;
+	*reg += ((pin_num / RK3308_SCHMITT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3308_SCHMITT_PINS_PER_REG;
+
+	return 0;
+}
+
+static struct rockchip_pin_bank rk3308_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1",
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2",
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT),
+	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4",
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT,
+			     IOMUX_WIDTH_2BIT),
+};
+
+static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
+		.pin_banks		= rk3308_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
+		.label			= "RK3308-GPIO",
+		.type			= RK3308,
+		.grf_mux_offset		= 0x0,
+		.iomux_recalced		= rk3308_mux_recalced_data,
+		.niomux_recalced	= ARRAY_SIZE(rk3308_mux_recalced_data),
+		.iomux_routes		= rk3308_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3308_mux_route_data),
+		.pull_calc_reg		= rk3308_calc_pull,
+		.drv_calc_reg		= rk3308_calc_drv,
+		.schmitt_calc_reg	= rk3308_calc_schmitt,
+};
+
+static const struct of_device_id rk3308_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3308-pinctrl",
+		.data = &rk3308_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3308_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3308-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3308_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3308_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3308_pinctrl_driver);
+}
+postcore_initcall(rk3308_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3308 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3328.c b/drivers/pinctrl/rockchip/pinctrl-rk3328.c
new file mode 100644
index 000000000000..4eedddf10fbc
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3328.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3328_PULL_GRF_OFFSET		0x100
+#define RK3328_PULL_BITS_PER_PIN	2
+#define RK3328_PULL_PINS_PER_REG	8
+#define RK3328_PULL_BANK_STRIDE		16
+
+#define RK3328_DRV_GRF_OFFSET		0x200
+#define RK3328_DRV_BITS_PER_PIN		2
+#define RK3328_DRV_PINS_PER_REG		8
+#define RK3328_DRV_BANK_STRIDE		16
+
+#define RK3328_SCHMITT_GRF_OFFSET		0x380
+#define RK3328_SCHMITT_BITS_PER_PIN		1
+#define RK3328_SCHMITT_PINS_PER_REG		16
+#define RK3328_SCHMITT_BANK_STRIDE		8
+
+static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
+	{
+		/* uart2dbg_rxm0 */
+		.bank_num = 1,
+		.pin = 1,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(16 + 1),
+	}, {
+		/* uart2dbg_rxm1 */
+		.bank_num = 2,
+		.pin = 1,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16) | BIT(16 + 1) | BIT(0),
+	}, {
+		/* gmac-m1_rxd0 */
+		.bank_num = 1,
+		.pin = 11,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 2) | BIT(2),
+	}, {
+		/* gmac-m1-optimized_rxd3 */
+		.bank_num = 1,
+		.pin = 14,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 10) | BIT(10),
+	}, {
+		/* pdm_sdi0m0 */
+		.bank_num = 2,
+		.pin = 19,
+		.func = 2,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 3),
+	}, {
+		/* pdm_sdi0m1 */
+		.bank_num = 1,
+		.pin = 23,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 3) | BIT(3),
+	}, {
+		/* spi_rxdm2 */
+		.bank_num = 3,
+		.pin = 2,
+		.func = 4,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 4) | BIT(16 + 5) | BIT(5),
+	}, {
+		/* i2s2_sdim0 */
+		.bank_num = 1,
+		.pin = 24,
+		.func = 1,
+		.route_offset = 0x50,
+		.route_val = BIT(16 + 6),
+	}, {
+		/* i2s2_sdim1 */
+		.bank_num = 3,
+		.pin = 2,
+		.func = 6,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 6) | BIT(6),
+	}, {
+		/* card_iom1 */
+		.bank_num = 2,
+		.pin = 22,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 7) | BIT(7),
+	}, {
+		/* tsp_d5m1 */
+		.bank_num = 2,
+		.pin = 16,
+		.func = 3,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 8) | BIT(8),
+	}, {
+		/* cif_data5m1 */
+		.bank_num = 2,
+		.pin = 16,
+		.func = 4,
+		.route_offset = 0x50,
+		.route_val =  BIT(16 + 9) | BIT(9),
+	},
+};
+
+static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
+	{
+		.num = 2,
+		.pin = 8,
+		.reg = 0x24,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 9,
+		.reg = 0x24,
+		.bit = 2,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 10,
+		.reg = 0x24,
+		.bit = 4,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 11,
+		.reg = 0x24,
+		.bit = 6,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 12,
+		.reg = 0x24,
+		.bit = 8,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 13,
+		.reg = 0x24,
+		.bit = 10,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 14,
+		.reg = 0x24,
+		.bit = 12,
+		.mask = 0x3
+	}, {
+		.num = 2,
+		.pin = 15,
+		.reg = 0x28,
+		.bit = 0,
+		.mask = 0x7
+	}, {
+		.num = 2,
+		.pin = 23,
+		.reg = 0x30,
+		.bit = 14,
+		.mask = 0x3
+	},
+};
+
+static void rk3328_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3328_PULL_GRF_OFFSET;
+	*reg += bank->bank_num * RK3328_PULL_BANK_STRIDE;
+	*reg += ((pin_num / RK3328_PULL_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3328_PULL_PINS_PER_REG);
+	*bit *= RK3328_PULL_BITS_PER_PIN;
+}
+
+static void rk3328_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3328_DRV_GRF_OFFSET;
+	*reg += bank->bank_num * RK3328_DRV_BANK_STRIDE;
+	*reg += ((pin_num / RK3328_DRV_PINS_PER_REG) * 4);
+
+	*bit = (pin_num % RK3328_DRV_PINS_PER_REG);
+	*bit *= RK3328_DRV_BITS_PER_PIN;
+}
+
+static int rk3328_calc_schmitt(struct rockchip_pin_bank *bank,
+			       int pin_num,
+			       struct regmap **regmap,
+			       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3328_SCHMITT_GRF_OFFSET;
+
+	*reg += bank->bank_num * RK3328_SCHMITT_BANK_STRIDE;
+	*reg += ((pin_num / RK3328_SCHMITT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3328_SCHMITT_PINS_PER_REG;
+
+	return 0;
+}
+
+static struct rockchip_pin_bank rk3328_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
+			     IOMUX_WIDTH_3BIT,
+			     IOMUX_WIDTH_3BIT,
+			     0),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
+			     IOMUX_WIDTH_3BIT,
+			     IOMUX_WIDTH_3BIT,
+			     0, 0),
+};
+
+static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
+		.pin_banks		= rk3328_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
+		.label			= "RK3328-GPIO",
+		.type			= RK3288,
+		.grf_mux_offset		= 0x0,
+		.iomux_recalced		= rk3328_mux_recalced_data,
+		.niomux_recalced	= ARRAY_SIZE(rk3328_mux_recalced_data),
+		.iomux_routes		= rk3328_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3328_mux_route_data),
+		.pull_calc_reg		= rk3328_calc_pull,
+		.drv_calc_reg		= rk3328_calc_drv,
+		.schmitt_calc_reg	= rk3328_calc_schmitt,
+};
+
+static const struct of_device_id rk3328_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3328-pinctrl",
+		.data = &rk3328_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3328_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3328-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3328_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3328_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3328_pinctrl_driver);
+}
+postcore_initcall(rk3328_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3328 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3368.c b/drivers/pinctrl/rockchip/pinctrl-rk3368.c
new file mode 100644
index 000000000000..f1bc71673fd2
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3368.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3368_PULL_GRF_OFFSET		0x100
+#define RK3368_PULL_PMU_OFFSET		0x10
+#define RK3368_PULL_BITS_PER_PIN	2
+#define RK3368_PULL_PINS_PER_REG	8
+#define RK3368_PULL_BANK_STRIDE		16
+
+#define RK3368_DRV_GRF_OFFSET		0x200
+#define RK3368_DRV_PMU_OFFSET		0x20
+#define RK3368_DRV_BITS_PER_PIN		2
+#define RK3368_DRV_PINS_PER_REG		8
+#define RK3368_DRV_BANK_STRIDE		16
+
+static void rk3368_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 32 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3368_PULL_PMU_OFFSET;
+
+		*reg += ((pin_num / RK3368_PULL_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3368_PULL_PINS_PER_REG;
+		*bit *= RK3368_PULL_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3368_PULL_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the second bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK3368_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3368_PULL_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3368_PULL_PINS_PER_REG);
+		*bit *= RK3368_PULL_BITS_PER_PIN;
+	}
+}
+
+static void rk3368_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 32 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3368_DRV_PMU_OFFSET;
+
+		*reg += ((pin_num / RK3368_DRV_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3368_DRV_PINS_PER_REG;
+		*bit *= RK3368_DRV_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3368_DRV_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the second bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK3368_DRV_BANK_STRIDE;
+		*reg += ((pin_num / RK3368_DRV_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3368_DRV_PINS_PER_REG);
+		*bit *= RK3368_DRV_BITS_PER_PIN;
+	}
+}
+
+static struct rockchip_pin_bank rk3368_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU),
+	PIN_BANK(1, 32, "gpio1"),
+	PIN_BANK(2, 32, "gpio2"),
+	PIN_BANK(3, 32, "gpio3"),
+};
+
+static struct rockchip_pin_ctrl rk3368_pin_ctrl = {
+		.pin_banks		= rk3368_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3368_pin_banks),
+		.label			= "RK3368-GPIO",
+		.type			= RK3368,
+		.grf_mux_offset		= 0x0,
+		.pmu_mux_offset		= 0x0,
+		.pull_calc_reg		= rk3368_calc_pull,
+		.drv_calc_reg		= rk3368_calc_drv,
+};
+
+static const struct of_device_id rk3368_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3368-pinctrl",
+		.data = &rk3368_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3368_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3368-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3368_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3368_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3368_pinctrl_driver);
+}
+postcore_initcall(rk3368_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3368 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rk3399.c b/drivers/pinctrl/rockchip/pinctrl-rk3399.c
new file mode 100644
index 000000000000..3c23806037f4
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rk3399.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RK3399_PULL_GRF_OFFSET		0xe040
+#define RK3399_PULL_PMU_OFFSET		0x40
+#define RK3399_PULL_BITS_PER_PIN	2
+#define RK3399_PULL_PINS_PER_REG	8
+#define RK3399_PULL_BANK_STRIDE		16
+
+static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
+	{
+		/* uart2dbga_rx */
+		.bank_num = 4,
+		.pin = 8,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11),
+	}, {
+		/* uart2dbgb_rx */
+		.bank_num = 4,
+		.pin = 16,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
+	}, {
+		/* uart2dbgc_rx */
+		.bank_num = 4,
+		.pin = 19,
+		.func = 1,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
+	}, {
+		/* pcie_clkreqn */
+		.bank_num = 2,
+		.pin = 26,
+		.func = 2,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 14),
+	}, {
+		/* pcie_clkreqnb */
+		.bank_num = 4,
+		.pin = 24,
+		.func = 1,
+		.route_offset = 0xe21c,
+		.route_val = BIT(16 + 14) | BIT(14),
+	},
+};
+
+static void rk3399_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The bank0:16 and bank1:32 pins are located in PMU */
+	if (bank->bank_num == 0 || bank->bank_num == 1) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3399_PULL_PMU_OFFSET;
+
+		*reg += bank->bank_num * RK3399_PULL_BANK_STRIDE;
+
+		*reg += ((pin_num / RK3399_PULL_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3399_PULL_PINS_PER_REG;
+		*bit *= RK3399_PULL_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3399_PULL_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the 3rd bank */
+		*reg -= 0x20;
+		*reg += bank->bank_num * RK3399_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3399_PULL_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3399_PULL_PINS_PER_REG);
+		*bit *= RK3399_PULL_BITS_PER_PIN;
+	}
+}
+
+static void rk3399_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int drv_num = (pin_num / 8);
+
+	/*  The bank0:16 and bank1:32 pins are located in PMU */
+	if (bank->bank_num == 0 || bank->bank_num == 1)
+		*regmap = info->regmap_pmu;
+	else
+		*regmap = info->regmap_base;
+
+	*reg = bank->drv[drv_num].offset;
+	if (bank->drv[drv_num].drv_type == DRV_TYPE_IO_1V8_3V0_AUTO ||
+	    bank->drv[drv_num].drv_type == DRV_TYPE_IO_3V3_ONLY)
+		*bit = (pin_num % 8) * 3;
+	else
+		*bit = (pin_num % 8) * 2;
+}
+
+static struct rockchip_pin_bank rk3399_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_DRV_FLAGS_OFFSET_PULL_FLAGS(0, 32, "gpio0",
+							 IOMUX_SOURCE_PMU,
+							 IOMUX_SOURCE_PMU,
+							 IOMUX_SOURCE_PMU,
+							 IOMUX_SOURCE_PMU,
+							 DRV_TYPE_IO_1V8_ONLY,
+							 DRV_TYPE_IO_1V8_ONLY,
+							 DRV_TYPE_IO_DEFAULT,
+							 DRV_TYPE_IO_DEFAULT,
+							 0x80,
+							 0x88,
+							 -1,
+							 -1,
+							 PULL_TYPE_IO_1V8_ONLY,
+							 PULL_TYPE_IO_1V8_ONLY,
+							 PULL_TYPE_IO_DEFAULT,
+							 PULL_TYPE_IO_DEFAULT),
+	PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(1, 32, "gpio1", IOMUX_SOURCE_PMU,
+					IOMUX_SOURCE_PMU,
+					IOMUX_SOURCE_PMU,
+					IOMUX_SOURCE_PMU,
+					DRV_TYPE_IO_1V8_OR_3V0,
+					DRV_TYPE_IO_1V8_OR_3V0,
+					DRV_TYPE_IO_1V8_OR_3V0,
+					DRV_TYPE_IO_1V8_OR_3V0,
+					0xa0,
+					0xa8,
+					0xb0,
+					0xb8),
+	PIN_BANK_DRV_FLAGS_PULL_FLAGS(2, 32, "gpio2", DRV_TYPE_IO_1V8_OR_3V0,
+				      DRV_TYPE_IO_1V8_OR_3V0,
+				      DRV_TYPE_IO_1V8_ONLY,
+				      DRV_TYPE_IO_1V8_ONLY,
+				      PULL_TYPE_IO_DEFAULT,
+				      PULL_TYPE_IO_DEFAULT,
+				      PULL_TYPE_IO_1V8_ONLY,
+				      PULL_TYPE_IO_1V8_ONLY),
+	PIN_BANK_DRV_FLAGS(3, 32, "gpio3", DRV_TYPE_IO_3V3_ONLY,
+			   DRV_TYPE_IO_3V3_ONLY,
+			   DRV_TYPE_IO_3V3_ONLY,
+			   DRV_TYPE_IO_1V8_OR_3V0),
+	PIN_BANK_DRV_FLAGS(4, 32, "gpio4", DRV_TYPE_IO_1V8_OR_3V0,
+			   DRV_TYPE_IO_1V8_3V0_AUTO,
+			   DRV_TYPE_IO_1V8_OR_3V0,
+			   DRV_TYPE_IO_1V8_OR_3V0),
+};
+
+static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
+		.pin_banks		= rk3399_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3399_pin_banks),
+		.label			= "RK3399-GPIO",
+		.type			= RK3399,
+		.grf_mux_offset		= 0xe000,
+		.pmu_mux_offset		= 0x0,
+		.grf_drv_offset		= 0xe100,
+		.pmu_drv_offset		= 0x80,
+		.iomux_routes		= rk3399_mux_route_data,
+		.niomux_routes		= ARRAY_SIZE(rk3399_mux_route_data),
+		.pull_calc_reg		= rk3399_calc_pull,
+		.drv_calc_reg		= rk3399_calc_drv,
+};
+
+static const struct of_device_id rk3399_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rk3399-pinctrl",
+		.data = &rk3399_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rk3399_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rk3399-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rk3399_pinctrl_dt_match,
+	},
+};
+
+static int __init rk3399_pinctrl_init(void)
+{
+	return platform_driver_register(&rk3399_pinctrl_driver);
+}
+postcore_initcall(rk3399_pinctrl_init);
+
+MODULE_DESCRIPTION("RK3399 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/rockchip/pinctrl-rockchip.c b/drivers/pinctrl/rockchip/pinctrl-rockchip.c
index fc9a2a9959d9..2a687bd2f2e6 100644
--- a/drivers/pinctrl/rockchip/pinctrl-rockchip.c
+++ b/drivers/pinctrl/rockchip/pinctrl-rockchip.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ *
  * Pinctrl driver for Rockchip SoCs
  *
  * Copyright (c) 2013 MundoReader S.L.
@@ -12,29 +14,11 @@
  *		http://www.linaro.org
  *
  * and pinctrl-at91:
- * Copyright (C) 2011-2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+ * Copyright (C) 2011-2012 Jean-Christophe
+ *		PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  */
 
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/bitops.h>
-#include <linux/gpio/driver.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/pinctrl/machine.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/clk.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-#include <dt-bindings/pinctrl/rockchip.h>
-
-#include "core.h"
-#include "pinconf.h"
+#include "pinctrl-rockchip.h"
 
 /* GPIO control registers */
 #define GPIO_SWPORT_DR		0x00
@@ -50,356 +34,9 @@
 #define GPIO_EXT_PORT		0x50
 #define GPIO_LS_SYNC		0x60
 
-enum rockchip_pinctrl_type {
-	PX30,
-	RV1108,
-	RK2928,
-	RK3066B,
-	RK3128,
-	RK3188,
-	RK3288,
-	RK3308,
-	RK3368,
-	RK3399,
-};
-
-/**
- * Encode variants of iomux registers into a type variable
- */
-#define IOMUX_GPIO_ONLY		BIT(0)
-#define IOMUX_WIDTH_4BIT	BIT(1)
-#define IOMUX_SOURCE_PMU	BIT(2)
-#define IOMUX_UNROUTED		BIT(3)
-#define IOMUX_WIDTH_3BIT	BIT(4)
-#define IOMUX_WIDTH_2BIT	BIT(5)
-
-/**
- * @type: iomux variant using IOMUX_* constants
- * @offset: if initialized to -1 it will be autocalculated, by specifying
- *	    an initial offset value the relevant source offset can be reset
- *	    to a new value for autocalculating the following iomux registers.
- */
-struct rockchip_iomux {
-	int				type;
-	int				offset;
-};
-
-/**
- * enum type index corresponding to rockchip_perpin_drv_list arrays index.
- */
-enum rockchip_pin_drv_type {
-	DRV_TYPE_IO_DEFAULT = 0,
-	DRV_TYPE_IO_1V8_OR_3V0,
-	DRV_TYPE_IO_1V8_ONLY,
-	DRV_TYPE_IO_1V8_3V0_AUTO,
-	DRV_TYPE_IO_3V3_ONLY,
-	DRV_TYPE_MAX
-};
-
-/**
- * enum type index corresponding to rockchip_pull_list arrays index.
- */
-enum rockchip_pin_pull_type {
-	PULL_TYPE_IO_DEFAULT = 0,
-	PULL_TYPE_IO_1V8_ONLY,
-	PULL_TYPE_MAX
-};
-
-/**
- * @drv_type: drive strength variant using rockchip_perpin_drv_type
- * @offset: if initialized to -1 it will be autocalculated, by specifying
- *	    an initial offset value the relevant source offset can be reset
- *	    to a new value for autocalculating the following drive strength
- *	    registers. if used chips own cal_drv func instead to calculate
- *	    registers offset, the variant could be ignored.
- */
-struct rockchip_drv {
-	enum rockchip_pin_drv_type	drv_type;
-	int				offset;
-};
-
-/**
- * @reg_base: register base of the gpio bank
- * @reg_pull: optional separate register for additional pull settings
- * @clk: clock of the gpio bank
- * @irq: interrupt of the gpio bank
- * @saved_masks: Saved content of GPIO_INTEN at suspend time.
- * @pin_base: first pin number
- * @nr_pins: number of pins in this bank
- * @name: name of the bank
- * @bank_num: number of the bank, to account for holes
- * @iomux: array describing the 4 iomux sources of the bank
- * @drv: array describing the 4 drive strength sources of the bank
- * @pull_type: array describing the 4 pull type sources of the bank
- * @valid: is all necessary information present
- * @of_node: dt node of this bank
- * @drvdata: common pinctrl basedata
- * @domain: irqdomain of the gpio bank
- * @gpio_chip: gpiolib chip
- * @grange: gpio range
- * @slock: spinlock for the gpio bank
- * @route_mask: bits describing the routing pins of per bank
- */
-struct rockchip_pin_bank {
-	void __iomem			*reg_base;
-	struct regmap			*regmap_pull;
-	struct clk			*clk;
-	int				irq;
-	u32				saved_masks;
-	u32				pin_base;
-	u8				nr_pins;
-	char				*name;
-	u8				bank_num;
-	struct rockchip_iomux		iomux[4];
-	struct rockchip_drv		drv[4];
-	enum rockchip_pin_pull_type	pull_type[4];
-	bool				valid;
-	struct device_node		*of_node;
-	struct rockchip_pinctrl		*drvdata;
-	struct irq_domain		*domain;
-	struct gpio_chip		gpio_chip;
-	struct pinctrl_gpio_range	grange;
-	raw_spinlock_t			slock;
-	u32				toggle_edge_mode;
-	u32				recalced_mask;
-	u32				route_mask;
-};
-
-#define PIN_BANK(id, pins, label)			\
-	{						\
-		.bank_num	= id,			\
-		.nr_pins	= pins,			\
-		.name		= label,		\
-		.iomux		= {			\
-			{ .offset = -1 },		\
-			{ .offset = -1 },		\
-			{ .offset = -1 },		\
-			{ .offset = -1 },		\
-		},					\
-	}
-
-#define PIN_BANK_IOMUX_FLAGS(id, pins, label, iom0, iom1, iom2, iom3)	\
-	{								\
-		.bank_num	= id,					\
-		.nr_pins	= pins,					\
-		.name		= label,				\
-		.iomux		= {					\
-			{ .type = iom0, .offset = -1 },			\
-			{ .type = iom1, .offset = -1 },			\
-			{ .type = iom2, .offset = -1 },			\
-			{ .type = iom3, .offset = -1 },			\
-		},							\
-	}
-
-#define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
-	{								\
-		.bank_num	= id,					\
-		.nr_pins	= pins,					\
-		.name		= label,				\
-		.iomux		= {					\
-			{ .offset = -1 },				\
-			{ .offset = -1 },				\
-			{ .offset = -1 },				\
-			{ .offset = -1 },				\
-		},							\
-		.drv		= {					\
-			{ .drv_type = type0, .offset = -1 },		\
-			{ .drv_type = type1, .offset = -1 },		\
-			{ .drv_type = type2, .offset = -1 },		\
-			{ .drv_type = type3, .offset = -1 },		\
-		},							\
-	}
-
-#define PIN_BANK_DRV_FLAGS_PULL_FLAGS(id, pins, label, drv0, drv1,	\
-				      drv2, drv3, pull0, pull1,		\
-				      pull2, pull3)			\
-	{								\
-		.bank_num	= id,					\
-		.nr_pins	= pins,					\
-		.name		= label,				\
-		.iomux		= {					\
-			{ .offset = -1 },				\
-			{ .offset = -1 },				\
-			{ .offset = -1 },				\
-			{ .offset = -1 },				\
-		},							\
-		.drv		= {					\
-			{ .drv_type = drv0, .offset = -1 },		\
-			{ .drv_type = drv1, .offset = -1 },		\
-			{ .drv_type = drv2, .offset = -1 },		\
-			{ .drv_type = drv3, .offset = -1 },		\
-		},							\
-		.pull_type[0] = pull0,					\
-		.pull_type[1] = pull1,					\
-		.pull_type[2] = pull2,					\
-		.pull_type[3] = pull3,					\
-	}
-
-#define PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(id, pins, label, iom0, iom1,	\
-					iom2, iom3, drv0, drv1, drv2,	\
-					drv3, offset0, offset1,		\
-					offset2, offset3)		\
-	{								\
-		.bank_num	= id,					\
-		.nr_pins	= pins,					\
-		.name		= label,				\
-		.iomux		= {					\
-			{ .type = iom0, .offset = -1 },			\
-			{ .type = iom1, .offset = -1 },			\
-			{ .type = iom2, .offset = -1 },			\
-			{ .type = iom3, .offset = -1 },			\
-		},							\
-		.drv		= {					\
-			{ .drv_type = drv0, .offset = offset0 },	\
-			{ .drv_type = drv1, .offset = offset1 },	\
-			{ .drv_type = drv2, .offset = offset2 },	\
-			{ .drv_type = drv3, .offset = offset3 },	\
-		},							\
-	}
-
-#define PIN_BANK_IOMUX_FLAGS_DRV_FLAGS_OFFSET_PULL_FLAGS(id, pins,	\
-					      label, iom0, iom1, iom2,  \
-					      iom3, drv0, drv1, drv2,   \
-					      drv3, offset0, offset1,   \
-					      offset2, offset3, pull0,  \
-					      pull1, pull2, pull3)	\
-	{								\
-		.bank_num	= id,					\
-		.nr_pins	= pins,					\
-		.name		= label,				\
-		.iomux		= {					\
-			{ .type = iom0, .offset = -1 },			\
-			{ .type = iom1, .offset = -1 },			\
-			{ .type = iom2, .offset = -1 },			\
-			{ .type = iom3, .offset = -1 },			\
-		},							\
-		.drv		= {					\
-			{ .drv_type = drv0, .offset = offset0 },	\
-			{ .drv_type = drv1, .offset = offset1 },	\
-			{ .drv_type = drv2, .offset = offset2 },	\
-			{ .drv_type = drv3, .offset = offset3 },	\
-		},							\
-		.pull_type[0] = pull0,					\
-		.pull_type[1] = pull1,					\
-		.pull_type[2] = pull2,					\
-		.pull_type[3] = pull3,					\
-	}
-
-/**
- * struct rockchip_mux_recalced_data: represent a pin iomux data.
- * @num: bank number.
- * @pin: pin number.
- * @bit: index at register.
- * @reg: register offset.
- * @mask: mask bit
- */
-struct rockchip_mux_recalced_data {
-	u8 num;
-	u8 pin;
-	u32 reg;
-	u8 bit;
-	u8 mask;
-};
-
-enum rockchip_mux_route_location {
-	ROCKCHIP_ROUTE_SAME = 0,
-	ROCKCHIP_ROUTE_PMU,
-	ROCKCHIP_ROUTE_GRF,
-};
-
-/**
- * struct rockchip_mux_recalced_data: represent a pin iomux data.
- * @bank_num: bank number.
- * @pin: index at register or used to calc index.
- * @func: the min pin.
- * @route_offset: the max pin.
- * @route_val: the register offset.
- */
-struct rockchip_mux_route_data {
-	u8 bank_num;
-	u8 pin;
-	u8 func;
-	enum rockchip_mux_route_location route_location;
-	u32 route_offset;
-	u32 route_val;
-};
-
-/**
- */
-struct rockchip_pin_ctrl {
-	struct rockchip_pin_bank	*pin_banks;
-	u32				nr_banks;
-	u32				nr_pins;
-	char				*label;
-	enum rockchip_pinctrl_type	type;
-	int				grf_mux_offset;
-	int				pmu_mux_offset;
-	int				grf_drv_offset;
-	int				pmu_drv_offset;
-	struct rockchip_mux_recalced_data *iomux_recalced;
-	u32				niomux_recalced;
-	struct rockchip_mux_route_data *iomux_routes;
-	u32				niomux_routes;
-
-	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit);
-	void	(*drv_calc_reg)(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit);
-	int	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit);
-};
-
-struct rockchip_pin_config {
-	unsigned int		func;
-	unsigned long		*configs;
-	unsigned int		nconfigs;
-};
-
-/**
- * struct rockchip_pin_group: represent group of pins of a pinmux function.
- * @name: name of the pin group, used to lookup the group.
- * @pins: the pins included in this group.
- * @npins: number of pins included in this group.
- * @func: the mux function number to be programmed when selected.
- * @configs: the config values to be set for each pin
- * @nconfigs: number of configs for each pin
- */
-struct rockchip_pin_group {
-	const char			*name;
-	unsigned int			npins;
-	unsigned int			*pins;
-	struct rockchip_pin_config	*data;
-};
-
-/**
- * struct rockchip_pmx_func: represent a pin function.
- * @name: name of the pin function, used to lookup the function.
- * @groups: one or more names of pin groups that provide this function.
- * @num_groups: number of groups included in @groups.
- */
-struct rockchip_pmx_func {
-	const char		*name;
-	const char		**groups;
-	u8			ngroups;
-};
-
-struct rockchip_pinctrl {
-	struct regmap			*regmap_base;
-	int				reg_size;
-	struct regmap			*regmap_pull;
-	struct regmap			*regmap_pmu;
-	struct device			*dev;
-	struct rockchip_pin_ctrl	*ctrl;
-	struct pinctrl_desc		pctl;
-	struct pinctrl_dev		*pctl_dev;
-	struct rockchip_pin_group	*groups;
-	unsigned int			ngroups;
-	struct rockchip_pmx_func	*functions;
-	unsigned int			nfunctions;
-};
+#define RK3188_PULL_BITS_PER_PIN	2
+#define RK3288_DRV_BITS_PER_PIN	2
+#define RK3399_DRV_3BITS_PER_PIN	3
 
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
@@ -407,9 +44,9 @@ static struct regmap_config rockchip_regmap_config = {
 	.reg_stride = 4,
 };
 
-static inline const struct rockchip_pin_group *pinctrl_name_to_group(
-					const struct rockchip_pinctrl *info,
-					const char *name)
+static inline const struct rockchip_pin_group *
+pinctrl_name_to_group(const struct rockchip_pinctrl *info,
+		      const char *name)
 {
 	int i;
 
@@ -426,7 +63,7 @@ static inline const struct rockchip_pin_group *pinctrl_name_to_group(
  * and the register base of the pin bank.
  */
 static struct rockchip_pin_bank *pin_to_bank(struct rockchip_pinctrl *info,
-								unsigned pin)
+					     unsigned int pin)
 {
 	struct rockchip_pin_bank *b = info->ctrl->pin_banks;
 
@@ -436,9 +73,8 @@ static struct rockchip_pin_bank *pin_to_bank(struct rockchip_pinctrl *info,
 	return b;
 }
 
-static struct rockchip_pin_bank *bank_num_to_bank(
-					struct rockchip_pinctrl *info,
-					unsigned num)
+static struct rockchip_pin_bank *
+bank_num_to_bank(struct rockchip_pinctrl *info, unsigned int num)
 {
 	struct rockchip_pin_bank *b = info->ctrl->pin_banks;
 	int i;
@@ -463,7 +99,7 @@ static int rockchip_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *rockchip_get_group_name(struct pinctrl_dev *pctldev,
-							unsigned selector)
+					   unsigned int selector)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 
@@ -471,8 +107,9 @@ static const char *rockchip_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int rockchip_get_group_pins(struct pinctrl_dev *pctldev,
-				      unsigned selector, const unsigned **pins,
-				      unsigned *npins)
+				   unsigned int selector,
+				   const unsigned int **pins,
+				   unsigned int *npins)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 
@@ -486,8 +123,9 @@ static int rockchip_get_group_pins(struct pinctrl_dev *pctldev,
 }
 
 static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
-				 struct device_node *np,
-				 struct pinctrl_map **map, unsigned *num_maps)
+				   struct device_node *np,
+				   struct pinctrl_map **map,
+				   unsigned int *num_maps)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	const struct rockchip_pin_group *grp;
@@ -509,7 +147,7 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	map_num += grp->npins;
 	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map),
-								GFP_KERNEL);
+			       GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
 
@@ -544,7 +182,8 @@ static int rockchip_dt_node_to_map(struct pinctrl_dev *pctldev,
 }
 
 static void rockchip_dt_free_map(struct pinctrl_dev *pctldev,
-				    struct pinctrl_map *map, unsigned num_maps)
+				 struct pinctrl_map *map,
+				 unsigned int num_maps)
 {
 }
 
@@ -556,224 +195,6 @@ static const struct pinctrl_ops rockchip_pctrl_ops = {
 	.dt_free_map		= rockchip_dt_free_map,
 };
 
-/*
- * Hardware access
- */
-
-static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
-	{
-		.num = 1,
-		.pin = 0,
-		.reg = 0x418,
-		.bit = 0,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 1,
-		.reg = 0x418,
-		.bit = 2,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 2,
-		.reg = 0x418,
-		.bit = 4,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 3,
-		.reg = 0x418,
-		.bit = 6,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 4,
-		.reg = 0x418,
-		.bit = 8,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 5,
-		.reg = 0x418,
-		.bit = 10,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 6,
-		.reg = 0x418,
-		.bit = 12,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 7,
-		.reg = 0x418,
-		.bit = 14,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 8,
-		.reg = 0x41c,
-		.bit = 0,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 9,
-		.reg = 0x41c,
-		.bit = 2,
-		.mask = 0x3
-	},
-};
-
-static  struct rockchip_mux_recalced_data rk3128_mux_recalced_data[] = {
-	{
-		.num = 2,
-		.pin = 20,
-		.reg = 0xe8,
-		.bit = 0,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 21,
-		.reg = 0xe8,
-		.bit = 4,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 22,
-		.reg = 0xe8,
-		.bit = 8,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 23,
-		.reg = 0xe8,
-		.bit = 12,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 24,
-		.reg = 0xd4,
-		.bit = 12,
-		.mask = 0x7
-	},
-};
-
-static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
-	{
-		.num = 1,
-		.pin = 14,
-		.reg = 0x28,
-		.bit = 12,
-		.mask = 0xf
-	}, {
-		.num = 1,
-		.pin = 15,
-		.reg = 0x2c,
-		.bit = 0,
-		.mask = 0x3
-	}, {
-		.num = 1,
-		.pin = 18,
-		.reg = 0x30,
-		.bit = 4,
-		.mask = 0xf
-	}, {
-		.num = 1,
-		.pin = 19,
-		.reg = 0x30,
-		.bit = 8,
-		.mask = 0xf
-	}, {
-		.num = 1,
-		.pin = 20,
-		.reg = 0x30,
-		.bit = 12,
-		.mask = 0xf
-	}, {
-		.num = 1,
-		.pin = 21,
-		.reg = 0x34,
-		.bit = 0,
-		.mask = 0xf
-	}, {
-		.num = 1,
-		.pin = 22,
-		.reg = 0x34,
-		.bit = 4,
-		.mask = 0xf
-	}, {
-		.num = 1,
-		.pin = 23,
-		.reg = 0x34,
-		.bit = 8,
-		.mask = 0xf
-	}, {
-		.num = 3,
-		.pin = 12,
-		.reg = 0x68,
-		.bit = 8,
-		.mask = 0xf
-	}, {
-		.num = 3,
-		.pin = 13,
-		.reg = 0x68,
-		.bit = 12,
-		.mask = 0xf
-	}, {
-		.num = 2,
-		.pin = 2,
-		.reg = 0x608,
-		.bit = 0,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 3,
-		.reg = 0x608,
-		.bit = 4,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 16,
-		.reg = 0x610,
-		.bit = 8,
-		.mask = 0x7
-	}, {
-		.num = 3,
-		.pin = 10,
-		.reg = 0x610,
-		.bit = 0,
-		.mask = 0x7
-	}, {
-		.num = 3,
-		.pin = 11,
-		.reg = 0x610,
-		.bit = 4,
-		.mask = 0x7
-	},
-};
-
-static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
-	{
-		.num = 2,
-		.pin = 12,
-		.reg = 0x24,
-		.bit = 8,
-		.mask = 0x3
-	}, {
-		.num = 2,
-		.pin = 15,
-		.reg = 0x28,
-		.bit = 0,
-		.mask = 0x7
-	}, {
-		.num = 2,
-		.pin = 23,
-		.reg = 0x30,
-		.bit = 14,
-		.mask = 0x3
-	},
-};
-
 static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 				      int *reg, u8 *bit, int *mask)
 {
@@ -797,600 +218,6 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
 	*bit = data->bit;
 }
 
-static struct rockchip_mux_route_data px30_mux_route_data[] = {
-	{
-		/* cif-d2m0 */
-		.bank_num = 2,
-		.pin = 0,
-		.func = 1,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 7),
-	}, {
-		/* cif-d2m1 */
-		.bank_num = 3,
-		.pin = 3,
-		.func = 3,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 7) | BIT(7),
-	}, {
-		/* pdm-m0 */
-		.bank_num = 3,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 8),
-	}, {
-		/* pdm-m1 */
-		.bank_num = 2,
-		.pin = 22,
-		.func = 1,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 8) | BIT(8),
-	}, {
-		/* uart2-rxm0 */
-		.bank_num = 1,
-		.pin = 27,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 10),
-	}, {
-		/* uart2-rxm1 */
-		.bank_num = 2,
-		.pin = 14,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 10) | BIT(10),
-	}, {
-		/* uart3-rxm0 */
-		.bank_num = 0,
-		.pin = 17,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 9),
-	}, {
-		/* uart3-rxm1 */
-		.bank_num = 1,
-		.pin = 15,
-		.func = 2,
-		.route_offset = 0x184,
-		.route_val = BIT(16 + 9) | BIT(9),
-	},
-};
-
-static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
-	{
-		/* spi-0 */
-		.bank_num = 1,
-		.pin = 10,
-		.func = 1,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 3) | BIT(16 + 4),
-	}, {
-		/* spi-1 */
-		.bank_num = 1,
-		.pin = 27,
-		.func = 3,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(3),
-	}, {
-		/* spi-2 */
-		.bank_num = 0,
-		.pin = 13,
-		.func = 2,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(4),
-	}, {
-		/* i2s-0 */
-		.bank_num = 1,
-		.pin = 5,
-		.func = 1,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 5),
-	}, {
-		/* i2s-1 */
-		.bank_num = 0,
-		.pin = 14,
-		.func = 1,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 5) | BIT(5),
-	}, {
-		/* emmc-0 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 6),
-	}, {
-		/* emmc-1 */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x144,
-		.route_val = BIT(16 + 6) | BIT(6),
-	},
-};
-
-static struct rockchip_mux_route_data rk3188_mux_route_data[] = {
-	{
-		/* non-iomuxed emmc/flash pins on flash-dqs */
-		.bank_num = 0,
-		.pin = 24,
-		.func = 1,
-		.route_location = ROCKCHIP_ROUTE_GRF,
-		.route_offset = 0xa0,
-		.route_val = BIT(16 + 11),
-	}, {
-		/* non-iomuxed emmc/flash pins on emmc-clk */
-		.bank_num = 0,
-		.pin = 24,
-		.func = 2,
-		.route_location = ROCKCHIP_ROUTE_GRF,
-		.route_offset = 0xa0,
-		.route_val = BIT(16 + 11) | BIT(11),
-	},
-};
-
-static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
-	{
-		/* pwm0-0 */
-		.bank_num = 0,
-		.pin = 26,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16),
-	}, {
-		/* pwm0-1 */
-		.bank_num = 3,
-		.pin = 21,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16) | BIT(0),
-	}, {
-		/* pwm1-0 */
-		.bank_num = 0,
-		.pin = 27,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 1),
-	}, {
-		/* pwm1-1 */
-		.bank_num = 0,
-		.pin = 30,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 1) | BIT(1),
-	}, {
-		/* pwm2-0 */
-		.bank_num = 0,
-		.pin = 28,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 2),
-	}, {
-		/* pwm2-1 */
-		.bank_num = 1,
-		.pin = 12,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 2) | BIT(2),
-	}, {
-		/* pwm3-0 */
-		.bank_num = 3,
-		.pin = 26,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* pwm3-1 */
-		.bank_num = 1,
-		.pin = 11,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 3) | BIT(3),
-	}, {
-		/* sdio-0_d0 */
-		.bank_num = 1,
-		.pin = 1,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 4),
-	}, {
-		/* sdio-1_d0 */
-		.bank_num = 3,
-		.pin = 2,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 4) | BIT(4),
-	}, {
-		/* spi-0_rx */
-		.bank_num = 0,
-		.pin = 13,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 5),
-	}, {
-		/* spi-1_rx */
-		.bank_num = 2,
-		.pin = 0,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 5) | BIT(5),
-	}, {
-		/* emmc-0_cmd */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 7),
-	}, {
-		/* emmc-1_cmd */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 7) | BIT(7),
-	}, {
-		/* uart2-0_rx */
-		.bank_num = 1,
-		.pin = 19,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 8),
-	}, {
-		/* uart2-1_rx */
-		.bank_num = 1,
-		.pin = 10,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 8) | BIT(8),
-	}, {
-		/* uart1-0_rx */
-		.bank_num = 1,
-		.pin = 10,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 11),
-	}, {
-		/* uart1-1_rx */
-		.bank_num = 3,
-		.pin = 13,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 11) | BIT(11),
-	},
-};
-
-static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
-	{
-		/* edphdmi_cecinoutt1 */
-		.bank_num = 7,
-		.pin = 16,
-		.func = 2,
-		.route_offset = 0x264,
-		.route_val = BIT(16 + 12) | BIT(12),
-	}, {
-		/* edphdmi_cecinout */
-		.bank_num = 7,
-		.pin = 23,
-		.func = 4,
-		.route_offset = 0x264,
-		.route_val = BIT(16 + 12),
-	},
-};
-
-static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
-	{
-		/* rtc_clk */
-		.bank_num = 0,
-		.pin = 19,
-		.func = 1,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 0) | BIT(0),
-	}, {
-		/* uart2_rxm0 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 2) | BIT(16 + 3),
-	}, {
-		/* uart2_rxm1 */
-		.bank_num = 4,
-		.pin = 26,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 2) | BIT(16 + 3) | BIT(2),
-	}, {
-		/* i2c3_sdam0 */
-		.bank_num = 0,
-		.pin = 15,
-		.func = 2,
-		.route_offset = 0x608,
-		.route_val = BIT(16 + 8) | BIT(16 + 9),
-	}, {
-		/* i2c3_sdam1 */
-		.bank_num = 3,
-		.pin = 12,
-		.func = 2,
-		.route_offset = 0x608,
-		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(8),
-	}, {
-		/* i2c3_sdam2 */
-		.bank_num = 2,
-		.pin = 0,
-		.func = 3,
-		.route_offset = 0x608,
-		.route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(9),
-	}, {
-		/* i2s-8ch-1-sclktxm0 */
-		.bank_num = 1,
-		.pin = 3,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* i2s-8ch-1-sclkrxm0 */
-		.bank_num = 1,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* i2s-8ch-1-sclktxm1 */
-		.bank_num = 1,
-		.pin = 13,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3) | BIT(3),
-	}, {
-		/* i2s-8ch-1-sclkrxm1 */
-		.bank_num = 1,
-		.pin = 14,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 3) | BIT(3),
-	}, {
-		/* pdm-clkm0 */
-		.bank_num = 1,
-		.pin = 4,
-		.func = 3,
-		.route_offset = 0x308,
-		.route_val =  BIT(16 + 12) | BIT(16 + 13),
-	}, {
-		/* pdm-clkm1 */
-		.bank_num = 1,
-		.pin = 14,
-		.func = 4,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
-	}, {
-		/* pdm-clkm2 */
-		.bank_num = 2,
-		.pin = 6,
-		.func = 2,
-		.route_offset = 0x308,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
-	}, {
-		/* pdm-clkm-m2 */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 3,
-		.route_offset = 0x600,
-		.route_val = BIT(16 + 2) | BIT(2),
-	}, {
-		/* spi1_miso */
-		.bank_num = 3,
-		.pin = 10,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 9),
-	}, {
-		/* spi1_miso_m1 */
-		.bank_num = 2,
-		.pin = 4,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 9) | BIT(9),
-	}, {
-		/* owire_m0 */
-		.bank_num = 0,
-		.pin = 11,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 10) | BIT(16 + 11),
-	}, {
-		/* owire_m1 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 7,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
-	}, {
-		/* owire_m2 */
-		.bank_num = 2,
-		.pin = 2,
-		.func = 5,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
-	}, {
-		/* can_rxd_m0 */
-		.bank_num = 0,
-		.pin = 11,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 12) | BIT(16 + 13),
-	}, {
-		/* can_rxd_m1 */
-		.bank_num = 1,
-		.pin = 22,
-		.func = 5,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
-	}, {
-		/* can_rxd_m2 */
-		.bank_num = 2,
-		.pin = 2,
-		.func = 4,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
-	}, {
-		/* mac_rxd0_m0 */
-		.bank_num = 1,
-		.pin = 20,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 14),
-	}, {
-		/* mac_rxd0_m1 */
-		.bank_num = 4,
-		.pin = 2,
-		.func = 2,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 14) | BIT(14),
-	}, {
-		/* uart3_rx */
-		.bank_num = 3,
-		.pin = 12,
-		.func = 4,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 15),
-	}, {
-		/* uart3_rx_m1 */
-		.bank_num = 0,
-		.pin = 17,
-		.func = 3,
-		.route_offset = 0x314,
-		.route_val = BIT(16 + 15) | BIT(15),
-	},
-};
-
-static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
-	{
-		/* uart2dbg_rxm0 */
-		.bank_num = 1,
-		.pin = 1,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16) | BIT(16 + 1),
-	}, {
-		/* uart2dbg_rxm1 */
-		.bank_num = 2,
-		.pin = 1,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16) | BIT(16 + 1) | BIT(0),
-	}, {
-		/* gmac-m1_rxd0 */
-		.bank_num = 1,
-		.pin = 11,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 2) | BIT(2),
-	}, {
-		/* gmac-m1-optimized_rxd3 */
-		.bank_num = 1,
-		.pin = 14,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 10) | BIT(10),
-	}, {
-		/* pdm_sdi0m0 */
-		.bank_num = 2,
-		.pin = 19,
-		.func = 2,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 3),
-	}, {
-		/* pdm_sdi0m1 */
-		.bank_num = 1,
-		.pin = 23,
-		.func = 3,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 3) | BIT(3),
-	}, {
-		/* spi_rxdm2 */
-		.bank_num = 3,
-		.pin = 2,
-		.func = 4,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 4) | BIT(16 + 5) | BIT(5),
-	}, {
-		/* i2s2_sdim0 */
-		.bank_num = 1,
-		.pin = 24,
-		.func = 1,
-		.route_offset = 0x50,
-		.route_val = BIT(16 + 6),
-	}, {
-		/* i2s2_sdim1 */
-		.bank_num = 3,
-		.pin = 2,
-		.func = 6,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 6) | BIT(6),
-	}, {
-		/* card_iom1 */
-		.bank_num = 2,
-		.pin = 22,
-		.func = 3,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 7) | BIT(7),
-	}, {
-		/* tsp_d5m1 */
-		.bank_num = 2,
-		.pin = 16,
-		.func = 3,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 8) | BIT(8),
-	}, {
-		/* cif_data5m1 */
-		.bank_num = 2,
-		.pin = 16,
-		.func = 4,
-		.route_offset = 0x50,
-		.route_val =  BIT(16 + 9) | BIT(9),
-	},
-};
-
-static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
-	{
-		/* uart2dbga_rx */
-		.bank_num = 4,
-		.pin = 8,
-		.func = 2,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 10) | BIT(16 + 11),
-	}, {
-		/* uart2dbgb_rx */
-		.bank_num = 4,
-		.pin = 16,
-		.func = 2,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
-	}, {
-		/* uart2dbgc_rx */
-		.bank_num = 4,
-		.pin = 19,
-		.func = 1,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
-	}, {
-		/* pcie_clkreqn */
-		.bank_num = 2,
-		.pin = 26,
-		.func = 2,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 14),
-	}, {
-		/* pcie_clkreqnb */
-		.bank_num = 4,
-		.pin = 24,
-		.func = 1,
-		.route_offset = 0xe21c,
-		.route_val = BIT(16 + 14) | BIT(14),
-	},
-};
-
 static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 				   int mux, u32 *loc, u32 *reg, u32 *value)
 {
@@ -1401,8 +228,8 @@ static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
 
 	for (i = 0; i < ctrl->niomux_routes; i++) {
 		data = &ctrl->iomux_routes[i];
-		if ((data->bank_num == bank->bank_num) &&
-		    (data->pin == pin) && (data->func == mux))
+		if (data->bank_num == bank->bank_num &&
+		    data->pin == pin && data->func == mux)
 			break;
 	}
 
@@ -1522,7 +349,7 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 		return 0;
 
 	dev_dbg(info->dev, "setting mux of GPIO%d-%d to %d\n",
-						bank->bank_num, pin, mux);
+		bank->bank_num, pin, mux);
 
 	regmap = (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
 				? info->regmap_pmu : info->regmap_base;
@@ -1577,528 +404,6 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	return ret;
 }
 
-#define PX30_PULL_PMU_OFFSET		0x10
-#define PX30_PULL_GRF_OFFSET		0x60
-#define PX30_PULL_BITS_PER_PIN		2
-#define PX30_PULL_PINS_PER_REG		8
-#define PX30_PULL_BANK_STRIDE		16
-
-static void px30_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				       int pin_num, struct regmap **regmap,
-				       int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 32 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = PX30_PULL_PMU_OFFSET;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = PX30_PULL_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * PX30_PULL_BANK_STRIDE;
-	}
-
-	*reg += ((pin_num / PX30_PULL_PINS_PER_REG) * 4);
-	*bit = (pin_num % PX30_PULL_PINS_PER_REG);
-	*bit *= PX30_PULL_BITS_PER_PIN;
-}
-
-#define PX30_DRV_PMU_OFFSET		0x20
-#define PX30_DRV_GRF_OFFSET		0xf0
-#define PX30_DRV_BITS_PER_PIN		2
-#define PX30_DRV_PINS_PER_REG		8
-#define PX30_DRV_BANK_STRIDE		16
-
-static void px30_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-				      int pin_num, struct regmap **regmap,
-				      int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 32 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = PX30_DRV_PMU_OFFSET;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = PX30_DRV_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * PX30_DRV_BANK_STRIDE;
-	}
-
-	*reg += ((pin_num / PX30_DRV_PINS_PER_REG) * 4);
-	*bit = (pin_num % PX30_DRV_PINS_PER_REG);
-	*bit *= PX30_DRV_BITS_PER_PIN;
-}
-
-#define PX30_SCHMITT_PMU_OFFSET			0x38
-#define PX30_SCHMITT_GRF_OFFSET			0xc0
-#define PX30_SCHMITT_PINS_PER_PMU_REG		16
-#define PX30_SCHMITT_BANK_STRIDE		16
-#define PX30_SCHMITT_PINS_PER_GRF_REG		8
-
-static int px30_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
-					 int pin_num,
-					 struct regmap **regmap,
-					 int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-	int pins_per_reg;
-
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = PX30_SCHMITT_PMU_OFFSET;
-		pins_per_reg = PX30_SCHMITT_PINS_PER_PMU_REG;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = PX30_SCHMITT_GRF_OFFSET;
-		pins_per_reg = PX30_SCHMITT_PINS_PER_GRF_REG;
-		*reg += (bank->bank_num  - 1) * PX30_SCHMITT_BANK_STRIDE;
-	}
-
-	*reg += ((pin_num / pins_per_reg) * 4);
-	*bit = pin_num % pins_per_reg;
-
-	return 0;
-}
-
-#define RV1108_PULL_PMU_OFFSET		0x10
-#define RV1108_PULL_OFFSET		0x110
-#define RV1108_PULL_PINS_PER_REG	8
-#define RV1108_PULL_BITS_PER_PIN	2
-#define RV1108_PULL_BANK_STRIDE		16
-
-static void rv1108_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-					 int pin_num, struct regmap **regmap,
-					 int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 24 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RV1108_PULL_PMU_OFFSET;
-	} else {
-		*reg = RV1108_PULL_OFFSET;
-		*regmap = info->regmap_base;
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * RV1108_PULL_BANK_STRIDE;
-	}
-
-	*reg += ((pin_num / RV1108_PULL_PINS_PER_REG) * 4);
-	*bit = (pin_num % RV1108_PULL_PINS_PER_REG);
-	*bit *= RV1108_PULL_BITS_PER_PIN;
-}
-
-#define RV1108_DRV_PMU_OFFSET		0x20
-#define RV1108_DRV_GRF_OFFSET		0x210
-#define RV1108_DRV_BITS_PER_PIN		2
-#define RV1108_DRV_PINS_PER_REG		8
-#define RV1108_DRV_BANK_STRIDE		16
-
-static void rv1108_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-					int pin_num, struct regmap **regmap,
-					int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 24 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RV1108_DRV_PMU_OFFSET;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RV1108_DRV_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * RV1108_DRV_BANK_STRIDE;
-	}
-
-	*reg += ((pin_num / RV1108_DRV_PINS_PER_REG) * 4);
-	*bit = pin_num % RV1108_DRV_PINS_PER_REG;
-	*bit *= RV1108_DRV_BITS_PER_PIN;
-}
-
-#define RV1108_SCHMITT_PMU_OFFSET		0x30
-#define RV1108_SCHMITT_GRF_OFFSET		0x388
-#define RV1108_SCHMITT_BANK_STRIDE		8
-#define RV1108_SCHMITT_PINS_PER_GRF_REG		16
-#define RV1108_SCHMITT_PINS_PER_PMU_REG		8
-
-static int rv1108_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
-					   int pin_num,
-					   struct regmap **regmap,
-					   int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-	int pins_per_reg;
-
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RV1108_SCHMITT_PMU_OFFSET;
-		pins_per_reg = RV1108_SCHMITT_PINS_PER_PMU_REG;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RV1108_SCHMITT_GRF_OFFSET;
-		pins_per_reg = RV1108_SCHMITT_PINS_PER_GRF_REG;
-		*reg += (bank->bank_num  - 1) * RV1108_SCHMITT_BANK_STRIDE;
-	}
-	*reg += ((pin_num / pins_per_reg) * 4);
-	*bit = pin_num % pins_per_reg;
-
-	return 0;
-}
-
-#define RK3308_SCHMITT_PINS_PER_REG		8
-#define RK3308_SCHMITT_BANK_STRIDE		16
-#define RK3308_SCHMITT_GRF_OFFSET		0x1a0
-
-static int rk3308_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3308_SCHMITT_GRF_OFFSET;
-
-	*reg += bank->bank_num * RK3308_SCHMITT_BANK_STRIDE;
-	*reg += ((pin_num / RK3308_SCHMITT_PINS_PER_REG) * 4);
-	*bit = pin_num % RK3308_SCHMITT_PINS_PER_REG;
-
-	return 0;
-}
-
-#define RK2928_PULL_OFFSET		0x118
-#define RK2928_PULL_PINS_PER_REG	16
-#define RK2928_PULL_BANK_STRIDE		8
-
-static void rk2928_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK2928_PULL_OFFSET;
-	*reg += bank->bank_num * RK2928_PULL_BANK_STRIDE;
-	*reg += (pin_num / RK2928_PULL_PINS_PER_REG) * 4;
-
-	*bit = pin_num % RK2928_PULL_PINS_PER_REG;
-};
-
-#define RK3128_PULL_OFFSET	0x118
-
-static void rk3128_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-					 int pin_num, struct regmap **regmap,
-					 int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3128_PULL_OFFSET;
-	*reg += bank->bank_num * RK2928_PULL_BANK_STRIDE;
-	*reg += ((pin_num / RK2928_PULL_PINS_PER_REG) * 4);
-
-	*bit = pin_num % RK2928_PULL_PINS_PER_REG;
-}
-
-#define RK3188_PULL_OFFSET		0x164
-#define RK3188_PULL_BITS_PER_PIN	2
-#define RK3188_PULL_PINS_PER_REG	8
-#define RK3188_PULL_BANK_STRIDE		16
-#define RK3188_PULL_PMU_OFFSET		0x64
-
-static void rk3188_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 12 pins of the first bank are located elsewhere */
-	if (bank->bank_num == 0 && pin_num < 12) {
-		*regmap = info->regmap_pmu ? info->regmap_pmu
-					   : bank->regmap_pull;
-		*reg = info->regmap_pmu ? RK3188_PULL_PMU_OFFSET : 0;
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	} else {
-		*regmap = info->regmap_pull ? info->regmap_pull
-					    : info->regmap_base;
-		*reg = info->regmap_pull ? 0 : RK3188_PULL_OFFSET;
-
-		/* correct the offset, as it is the 2nd pull register */
-		*reg -= 4;
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-
-		/*
-		 * The bits in these registers have an inverse ordering
-		 * with the lowest pin being in bits 15:14 and the highest
-		 * pin in bits 1:0
-		 */
-		*bit = 7 - (pin_num % RK3188_PULL_PINS_PER_REG);
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	}
-}
-
-#define RK3288_PULL_OFFSET		0x140
-static void rk3288_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 24 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RK3188_PULL_PMU_OFFSET;
-
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RK3288_PULL_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-
-		*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	}
-}
-
-#define RK3288_DRV_PMU_OFFSET		0x70
-#define RK3288_DRV_GRF_OFFSET		0x1c0
-#define RK3288_DRV_BITS_PER_PIN		2
-#define RK3288_DRV_PINS_PER_REG		8
-#define RK3288_DRV_BANK_STRIDE		16
-
-static void rk3288_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 24 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RK3288_DRV_PMU_OFFSET;
-
-		*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3288_DRV_PINS_PER_REG;
-		*bit *= RK3288_DRV_BITS_PER_PIN;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RK3288_DRV_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
-		*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
-
-		*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
-		*bit *= RK3288_DRV_BITS_PER_PIN;
-	}
-}
-
-#define RK3228_PULL_OFFSET		0x100
-
-static void rk3228_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3228_PULL_OFFSET;
-	*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-	*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-
-	*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-	*bit *= RK3188_PULL_BITS_PER_PIN;
-}
-
-#define RK3228_DRV_GRF_OFFSET		0x200
-
-static void rk3228_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3228_DRV_GRF_OFFSET;
-	*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
-	*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
-
-	*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
-	*bit *= RK3288_DRV_BITS_PER_PIN;
-}
-
-#define RK3308_PULL_OFFSET		0xa0
-
-static void rk3308_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3308_PULL_OFFSET;
-	*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-	*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-
-	*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-	*bit *= RK3188_PULL_BITS_PER_PIN;
-}
-
-#define RK3308_DRV_GRF_OFFSET		0x100
-
-static void rk3308_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3308_DRV_GRF_OFFSET;
-	*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
-	*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
-
-	*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
-	*bit *= RK3288_DRV_BITS_PER_PIN;
-}
-
-#define RK3368_PULL_GRF_OFFSET		0x100
-#define RK3368_PULL_PMU_OFFSET		0x10
-
-static void rk3368_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 32 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RK3368_PULL_PMU_OFFSET;
-
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RK3368_PULL_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-
-		*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	}
-}
-
-#define RK3368_DRV_PMU_OFFSET		0x20
-#define RK3368_DRV_GRF_OFFSET		0x200
-
-static void rk3368_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-				    int pin_num, struct regmap **regmap,
-				    int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The first 32 pins of the first bank are located in PMU */
-	if (bank->bank_num == 0) {
-		*regmap = info->regmap_pmu;
-		*reg = RK3368_DRV_PMU_OFFSET;
-
-		*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3288_DRV_PINS_PER_REG;
-		*bit *= RK3288_DRV_BITS_PER_PIN;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RK3368_DRV_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 2nd bank */
-		*reg -= 0x10;
-		*reg += bank->bank_num * RK3288_DRV_BANK_STRIDE;
-		*reg += ((pin_num / RK3288_DRV_PINS_PER_REG) * 4);
-
-		*bit = (pin_num % RK3288_DRV_PINS_PER_REG);
-		*bit *= RK3288_DRV_BITS_PER_PIN;
-	}
-}
-
-#define RK3399_PULL_GRF_OFFSET		0xe040
-#define RK3399_PULL_PMU_OFFSET		0x40
-#define RK3399_DRV_3BITS_PER_PIN	3
-
-static void rk3399_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
-					 int pin_num, struct regmap **regmap,
-					 int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	/* The bank0:16 and bank1:32 pins are located in PMU */
-	if ((bank->bank_num == 0) || (bank->bank_num == 1)) {
-		*regmap = info->regmap_pmu;
-		*reg = RK3399_PULL_PMU_OFFSET;
-
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	} else {
-		*regmap = info->regmap_base;
-		*reg = RK3399_PULL_GRF_OFFSET;
-
-		/* correct the offset, as we're starting with the 3rd bank */
-		*reg -= 0x20;
-		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
-		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
-
-		*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
-		*bit *= RK3188_PULL_BITS_PER_PIN;
-	}
-}
-
-static void rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
-					int pin_num, struct regmap **regmap,
-					int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-	int drv_num = (pin_num / 8);
-
-	/*  The bank0:16 and bank1:32 pins are located in PMU */
-	if ((bank->bank_num == 0) || (bank->bank_num == 1))
-		*regmap = info->regmap_pmu;
-	else
-		*regmap = info->regmap_base;
-
-	*reg = bank->drv[drv_num].offset;
-	if ((bank->drv[drv_num].drv_type == DRV_TYPE_IO_1V8_3V0_AUTO) ||
-	    (bank->drv[drv_num].drv_type == DRV_TYPE_IO_3V3_ONLY))
-		*bit = (pin_num % 8) * 3;
-	else
-		*bit = (pin_num % 8) * 2;
-}
-
 static int rockchip_perpin_drv_list[DRV_TYPE_MAX][8] = {
 	{ 2, 4, 8, 12, -1, -1, -1, -1 },
 	{ 3, 6, 9, 12, -1, -1, -1, -1 },
@@ -2337,7 +642,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 }
 
 static int rockchip_set_pull(struct rockchip_pin_bank *bank,
-					int pin_num, int pull)
+			     int pin_num, int pull)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
@@ -2347,7 +652,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	u32 data, rmask;
 
 	dev_dbg(info->dev, "setting pull of GPIO%d-%d to %d\n",
-		 bank->bank_num, pin_num, pull);
+		bank->bank_num, pin_num, pull);
 
 	/* rk3066b does support any pulls */
 	if (ctrl->type == RK3066B)
@@ -2401,28 +706,6 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	return ret;
 }
 
-#define RK3328_SCHMITT_BITS_PER_PIN		1
-#define RK3328_SCHMITT_PINS_PER_REG		16
-#define RK3328_SCHMITT_BANK_STRIDE		8
-#define RK3328_SCHMITT_GRF_OFFSET		0x380
-
-static int rk3328_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
-					   int pin_num,
-					   struct regmap **regmap,
-					   int *reg, u8 *bit)
-{
-	struct rockchip_pinctrl *info = bank->drvdata;
-
-	*regmap = info->regmap_base;
-	*reg = RK3328_SCHMITT_GRF_OFFSET;
-
-	*reg += bank->bank_num * RK3328_SCHMITT_BANK_STRIDE;
-	*reg += ((pin_num / RK3328_SCHMITT_PINS_PER_REG) * 4);
-	*bit = pin_num % RK3328_SCHMITT_PINS_PER_REG;
-
-	return 0;
-}
-
 static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -2480,7 +763,7 @@ static int rockchip_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *rockchip_pmx_get_func_name(struct pinctrl_dev *pctldev,
-					  unsigned selector)
+					      unsigned int selector)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 
@@ -2488,8 +771,9 @@ static const char *rockchip_pmx_get_func_name(struct pinctrl_dev *pctldev,
 }
 
 static int rockchip_pmx_get_groups(struct pinctrl_dev *pctldev,
-				unsigned selector, const char * const **groups,
-				unsigned * const num_groups)
+				   unsigned int selector,
+				   const char * const **groups,
+				   unsigned int * const num_groups)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 
@@ -2499,8 +783,8 @@ static int rockchip_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
-			    unsigned group)
+static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
+			    unsigned int group)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	const unsigned int *pins = info->groups[group].pins;
@@ -2534,7 +818,8 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int rockchip_gpio_get_direction(struct gpio_chip *chip,
+				       unsigned int offset)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
 	u32 data;
@@ -2589,8 +874,8 @@ static int _rockchip_pmx_gpio_set_direction(struct gpio_chip *chip,
 }
 
 static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
-					      struct pinctrl_gpio_range *range,
-					      unsigned offset, bool input)
+					   struct pinctrl_gpio_range *range,
+					   unsigned int offset, bool input)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip;
@@ -2599,7 +884,7 @@ static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	chip = range->gc;
 	pin = offset - chip->base;
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
-		 offset, range->name, pin, input ? "input" : "output");
+		offset, range->name, pin, input ? "input" : "output");
 
 	return _rockchip_pmx_gpio_set_direction(chip, offset - chip->base,
 						input);
@@ -2624,7 +909,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK2928:
 	case RK3128:
 		return (pull == PIN_CONFIG_BIAS_PULL_PIN_DEFAULT ||
-					pull == PIN_CONFIG_BIAS_DISABLE);
+			pull == PIN_CONFIG_BIAS_DISABLE);
 	case RK3066B:
 		return pull ? false : true;
 	case PX30:
@@ -2640,12 +925,14 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	return false;
 }
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value);
-static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset);
+static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value);
+static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset);
 
 /* set the pin config settings for a specified pin */
 static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
-				unsigned long *configs, unsigned num_configs)
+				unsigned long *configs,
+				unsigned int num_configs)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
@@ -2661,7 +948,7 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			rc =  rockchip_set_pull(bank, pin - bank->pin_base,
-				param);
+						param);
 			if (rc)
 				return rc;
 			break;
@@ -2676,15 +963,17 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 
 			rc = rockchip_set_pull(bank, pin - bank->pin_base,
-				param);
+					       param);
 			if (rc)
 				return rc;
 			break;
 		case PIN_CONFIG_OUTPUT:
 			rockchip_gpio_set(&bank->gpio_chip,
 					  pin - bank->pin_base, arg);
-			rc = _rockchip_pmx_gpio_set_direction(&bank->gpio_chip,
-					  pin - bank->pin_base, false);
+			rc =
+			_rockchip_pmx_gpio_set_direction(&bank->gpio_chip,
+							 pin - bank->pin_base,
+							 false);
 			if (rc)
 				return rc;
 			break;
@@ -2693,8 +982,9 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			if (!info->ctrl->drv_calc_reg)
 				return -ENOTSUPP;
 
-			rc = rockchip_set_drive_perpin(bank,
-						pin - bank->pin_base, arg);
+			rc =
+			rockchip_set_drive_perpin(bank,
+						  pin - bank->pin_base, arg);
 			if (rc < 0)
 				return rc;
 			break;
@@ -2709,7 +999,6 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		default:
 			return -ENOTSUPP;
-			break;
 		}
 	} /* for each config */
 
@@ -2718,7 +1007,7 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 /* get the pin config settings for a specified pin */
 static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
-							unsigned long *config)
+				unsigned long *config)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
@@ -2779,7 +1068,6 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		break;
 	default:
 		return -ENOTSUPP;
-		break;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -2799,8 +1087,8 @@ static const struct of_device_id rockchip_bank_match[] = {
 	{},
 };
 
-static void rockchip_pinctrl_child_count(struct rockchip_pinctrl *info,
-						struct device_node *np)
+static void rockchip_pctrl_child_count(struct rockchip_pinctrl *info,
+				       struct device_node *np)
 {
 	struct device_node *child;
 
@@ -2813,10 +1101,10 @@ static void rockchip_pinctrl_child_count(struct rockchip_pinctrl *info,
 	}
 }
 
-static int rockchip_pinctrl_parse_groups(struct device_node *np,
-					      struct rockchip_pin_group *grp,
-					      struct rockchip_pinctrl *info,
-					      u32 index)
+static int rockchip_pctrl_parse_groups(struct device_node *np,
+				       struct rockchip_pin_group *grp,
+				       struct rockchip_pinctrl *info,
+				       u32 index)
 {
 	struct rockchip_pin_bank *bank;
 	int size;
@@ -2845,11 +1133,11 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 	grp->npins = size / 4;
 
 	grp->pins = devm_kcalloc(info->dev, grp->npins, sizeof(unsigned int),
-						GFP_KERNEL);
+				 GFP_KERNEL);
 	grp->data = devm_kcalloc(info->dev,
-					grp->npins,
-					sizeof(struct rockchip_pin_config),
-					GFP_KERNEL);
+				 grp->npins,
+				 sizeof(struct rockchip_pin_config),
+				 GFP_KERNEL);
 	if (!grp->pins || !grp->data)
 		return -ENOMEM;
 
@@ -2871,7 +1159,8 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 
 		np_config = of_find_node_by_phandle(be32_to_cpup(phandle));
 		ret = pinconf_generic_parse_dt_config(np_config, NULL,
-				&grp->data[j].configs, &grp->data[j].nconfigs);
+						      &grp->data[j].configs,
+						      &grp->data[j].nconfigs);
 		if (ret)
 			return ret;
 	}
@@ -2879,9 +1168,9 @@ static int rockchip_pinctrl_parse_groups(struct device_node *np,
 	return 0;
 }
 
-static int rockchip_pinctrl_parse_functions(struct device_node *np,
-						struct rockchip_pinctrl *info,
-						u32 index)
+static int rockchip_pctrl_parse_functions(struct device_node *np,
+					  struct rockchip_pinctrl *info,
+					  u32 index)
 {
 	struct device_node *child;
 	struct rockchip_pmx_func *func;
@@ -2900,15 +1189,15 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 	if (func->ngroups <= 0)
 		return 0;
 
-	func->groups = devm_kcalloc(info->dev,
-			func->ngroups, sizeof(char *), GFP_KERNEL);
+	func->groups = devm_kcalloc(info->dev, func->ngroups,
+				    sizeof(char *), GFP_KERNEL);
 	if (!func->groups)
 		return -ENOMEM;
 
 	for_each_child_of_node(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[grp_index++];
-		ret = rockchip_pinctrl_parse_groups(child, grp, info, i++);
+		ret = rockchip_pctrl_parse_groups(child, grp, info, i++);
 		if (ret) {
 			of_node_put(child);
 			return ret;
@@ -2918,8 +1207,8 @@ static int rockchip_pinctrl_parse_functions(struct device_node *np,
 	return 0;
 }
 
-static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
-					      struct rockchip_pinctrl *info)
+static int rockchip_pctrl_parse_dt(struct platform_device *pdev,
+				   struct rockchip_pinctrl *info)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -2927,22 +1216,20 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 	int ret;
 	int i;
 
-	rockchip_pinctrl_child_count(info, np);
+	rockchip_pctrl_child_count(info, np);
 
 	dev_dbg(&pdev->dev, "nfunctions = %d\n", info->nfunctions);
 	dev_dbg(&pdev->dev, "ngroups = %d\n", info->ngroups);
 
-	info->functions = devm_kcalloc(dev,
-					      info->nfunctions,
-					      sizeof(struct rockchip_pmx_func),
-					      GFP_KERNEL);
+	info->functions = devm_kcalloc(dev, info->nfunctions,
+				       sizeof(struct rockchip_pmx_func),
+				       GFP_KERNEL);
 	if (!info->functions)
 		return -EINVAL;
 
-	info->groups = devm_kcalloc(dev,
-					    info->ngroups,
-					    sizeof(struct rockchip_pin_group),
-					    GFP_KERNEL);
+	info->groups = devm_kcalloc(dev, info->ngroups,
+				    sizeof(struct rockchip_pin_group),
+				    GFP_KERNEL);
 	if (!info->groups)
 		return -EINVAL;
 
@@ -2952,7 +1239,7 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 		if (of_match_node(rockchip_bank_match, child))
 			continue;
 
-		ret = rockchip_pinctrl_parse_functions(child, info, i++);
+		ret = rockchip_pctrl_parse_functions(child, info, i++);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse function\n");
 			of_node_put(child);
@@ -2963,8 +1250,8 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
-static int rockchip_pinctrl_register(struct platform_device *pdev,
-					struct rockchip_pinctrl *info)
+static int rockchip_pctrl_register(struct platform_device *pdev,
+				   struct rockchip_pinctrl *info)
 {
 	struct pinctrl_desc *ctrldesc = &info->pctl;
 	struct pinctrl_pin_desc *pindesc, *pdesc;
@@ -2988,7 +1275,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	ctrldesc->npins = info->ctrl->nr_pins;
 
 	pdesc = pindesc;
-	for (bank = 0 , k = 0; bank < info->ctrl->nr_banks; bank++) {
+	for (bank = 0, k = 0; bank < info->ctrl->nr_banks; bank++) {
 		pin_bank = &info->ctrl->pin_banks[bank];
 		for (pin = 0; pin < pin_bank->nr_pins; pin++, k++) {
 			pdesc->number = k;
@@ -2998,7 +1285,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 		}
 	}
 
-	ret = rockchip_pinctrl_parse_dt(pdev, info);
+	ret = rockchip_pctrl_parse_dt(pdev, info);
 	if (ret)
 		return ret;
 
@@ -3026,7 +1313,8 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
  * GPIO handling
  */
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	void __iomem *reg = bank->reg_base + GPIO_SWPORT_DR;
@@ -3050,7 +1338,7 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
  * Returns the level of the pin for input direction and setting of the DR
  * register for output gpios.
  */
-static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset)
+static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	u32 data;
@@ -3068,7 +1356,8 @@ static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset)
  * mux function as 'gpio input' will be handled by the pinctrl subsystem
  * interface.
  */
-static int rockchip_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
+static int rockchip_gpio_direction_input(struct gpio_chip *gc,
+					 unsigned int offset)
 {
 	return pinctrl_gpio_direction_input(gc->base + offset);
 }
@@ -3079,7 +1368,7 @@ static int rockchip_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
  * interface.
  */
 static int rockchip_gpio_direction_output(struct gpio_chip *gc,
-					  unsigned offset, int value)
+					  unsigned int offset, int value)
 {
 	rockchip_gpio_set(gc, offset, value);
 	return pinctrl_gpio_direction_output(gc->base + offset);
@@ -3113,13 +1402,11 @@ static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
  * interface.
  */
 static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
-				  unsigned long config)
+				    unsigned long config)
 {
 	enum pin_config_param param = pinconf_to_config_param(config);
 
 	switch (param) {
-	case PIN_CONFIG_INPUT_DEBOUNCE:
-		rockchip_gpio_set_debounce(gc, offset, true);
 		/*
 		 * Rockchip's gpio could only support up to one period
 		 * of the debounce clock(pclk), which is far away from
@@ -3131,6 +1418,8 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		 * still return -ENOTSUPP as before, to make sure the caller
 		 * of gpiod_set_debounce won't change its behaviour.
 		 */
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		rockchip_gpio_set_debounce(gc, offset, true);
 		return -ENOTSUPP;
 	default:
 		return -ENOTSUPP;
@@ -3141,7 +1430,7 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
  * gpiolib gpio_to_irq callback function. Creates a mapping between a GPIO pin
  * and a virtual IRQ, if not already present.
  */
-static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
+static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned int virq;
@@ -3360,7 +1649,7 @@ static void rockchip_irq_disable(struct irq_data *d)
 }
 
 static int rockchip_interrupts_register(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
+					struct rockchip_pinctrl *info)
 {
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_pin_bank *bank = ctrl->pin_banks;
@@ -3384,7 +1673,8 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 		}
 
 		bank->domain = irq_domain_add_linear(bank->of_node, 32,
-						&irq_generic_chip_ops, NULL);
+						     &irq_generic_chip_ops,
+						     NULL);
 		if (!bank->domain) {
 			dev_warn(&pdev->dev, "could not initialize irq domain for bank %s\n",
 				 bank->name);
@@ -3393,8 +1683,10 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 		}
 
 		ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
-					 "rockchip_gpio_irq", handle_level_irq,
-					 clr, 0, IRQ_GC_INIT_MASK_CACHE);
+						     "rockchip_gpio_irq",
+						     handle_level_irq,
+						     clr, 0,
+						     IRQ_GC_INIT_MASK_CACHE);
 		if (ret) {
 			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
 				bank->name);
@@ -3440,8 +1732,24 @@ static int rockchip_interrupts_register(struct platform_device *pdev,
 	return 0;
 }
 
-static int rockchip_gpiolib_register(struct platform_device *pdev,
+static int rockchip_gpiolib_unregister(struct platform_device *pdev,
 						struct rockchip_pinctrl *info)
+{
+	struct rockchip_pin_ctrl *ctrl = info->ctrl;
+	struct rockchip_pin_bank *bank = ctrl->pin_banks;
+	int i;
+
+	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
+		if (!bank->valid)
+			continue;
+		gpiochip_remove(&bank->gpio_chip);
+	}
+
+	return 0;
+}
+
+static int rockchip_gpiolib_register(struct platform_device *pdev,
+				     struct rockchip_pinctrl *info)
 {
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct rockchip_pin_bank *bank = ctrl->pin_banks;
@@ -3468,7 +1776,7 @@ static int rockchip_gpiolib_register(struct platform_device *pdev,
 		ret = gpiochip_add_data(gc, bank);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
-							gc->label, ret);
+				gc->label, ret);
 			goto fail;
 		}
 	}
@@ -3486,24 +1794,8 @@ static int rockchip_gpiolib_register(struct platform_device *pdev,
 	return ret;
 }
 
-static int rockchip_gpiolib_unregister(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
-{
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
-	int i;
-
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid)
-			continue;
-		gpiochip_remove(&bank->gpio_chip);
-	}
-
-	return 0;
-}
-
-static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
-				  struct rockchip_pinctrl *info)
+static int rockchip_pctrl_get_bank_data(struct rockchip_pin_bank *bank,
+					struct rockchip_pinctrl *info)
 {
 	struct resource res;
 	void __iomem *base;
@@ -3540,9 +1832,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 						    resource_size(&res) - 4;
 			rockchip_regmap_config.name =
 					    "rockchip,rk3188-gpio-bank0-pull";
-			bank->regmap_pull = devm_regmap_init_mmio(info->dev,
-						    base,
-						    &rockchip_regmap_config);
+			bank->regmap_pull =
+				devm_regmap_init_mmio(info->dev,
+						      base,
+						      &rockchip_regmap_config);
 		}
 		of_node_put(node);
 	}
@@ -3556,33 +1849,26 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
 	return clk_prepare(bank->clk);
 }
 
-static const struct of_device_id rockchip_pinctrl_dt_match[];
-
 /* retrieve the soc specific data */
-static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
-						struct rockchip_pinctrl *d,
-						struct platform_device *pdev)
+static int rockchip_pctrl_get_soc_data(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
-	struct device_node *node = pdev->dev.of_node;
-	struct device_node *np;
-	struct rockchip_pin_ctrl *ctrl;
+	struct rockchip_pinctrl *d = platform_get_drvdata(pdev);
+	struct rockchip_pin_ctrl *ctrl = d->ctrl;
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
 	struct rockchip_pin_bank *bank;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
 
-	match = of_match_node(rockchip_pinctrl_dt_match, node);
-	ctrl = (struct rockchip_pin_ctrl *)match->data;
-
-	for_each_child_of_node(node, np) {
-		if (!of_find_property(np, "gpio-controller", NULL))
+	for_each_child_of_node(np, child) {
+		if (!of_find_property(child, "gpio-controller", NULL))
 			continue;
 
 		bank = ctrl->pin_banks;
 		for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-			if (!strcmp(bank->name, np->name)) {
-				bank->of_node = np;
+			if (!strcmp(bank->name, child->name)) {
+				bank->of_node = child;
 
-				if (!rockchip_get_bank_data(bank, d))
+				if (!rockchip_pctrl_get_bank_data(bank, d))
 					bank->valid = true;
 
 				break;
@@ -3651,10 +1937,10 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 
 			/*
 			 * Increase offset according to drv width.
-			 * 3bit drive-strenth'es are spread over two registers.
+			 * 3bit drive-strength'es are spread over two registers.
 			 */
-			if ((drv->drv_type == DRV_TYPE_IO_1V8_3V0_AUTO) ||
-			    (drv->drv_type == DRV_TYPE_IO_3V3_ONLY))
+			if (drv->drv_type == DRV_TYPE_IO_1V8_3V0_AUTO ||
+			    drv->drv_type == DRV_TYPE_IO_3V3_ONLY)
 				inc = 8;
 			else
 				inc = 4;
@@ -3688,121 +1974,75 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 		}
 	}
 
-	return ctrl;
+	return 0;
 }
 
-#define RK3288_GRF_GPIO6C_IOMUX		0x64
-#define GPIO6C6_SEL_WRITE_ENABLE	BIT(28)
-
-static u32 rk3288_grf_gpio6c_iomux;
-
-static int __maybe_unused rockchip_pinctrl_suspend(struct device *dev)
+static int rockchip_pctrl_suspend(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
-	int ret = pinctrl_force_sleep(info->pctl_dev);
 
-	if (ret)
-		return ret;
-
-	/*
-	 * RK3288 GPIO6_C6 mux would be modified by Maskrom when resume, so save
-	 * the setting here, and restore it at resume.
-	 */
-	if (info->ctrl->type == RK3288) {
-		ret = regmap_read(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
-				  &rk3288_grf_gpio6c_iomux);
-		if (ret) {
-			pinctrl_force_default(info->pctl_dev);
-			return ret;
-		}
-	}
+	if (!info)
+		return -EINVAL;
 
-	return 0;
+	return pinctrl_force_sleep(info->pctl_dev);
 }
 
-static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
+static int rockchip_pctrl_resume(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
-	int ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
-			       rk3288_grf_gpio6c_iomux |
-			       GPIO6C6_SEL_WRITE_ENABLE);
 
-	if (ret)
-		return ret;
+	if (!info)
+		return -EINVAL;
 
 	return pinctrl_force_default(info->pctl_dev);
 }
 
-static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
-			 rockchip_pinctrl_resume);
+SIMPLE_DEV_PM_OPS(rockchip_pctrl_dev_pm_ops,
+		  rockchip_pctrl_suspend,
+		  rockchip_pctrl_resume);
+EXPORT_SYMBOL(rockchip_pctrl_dev_pm_ops);
 
-static int rockchip_pinctrl_probe(struct platform_device *pdev)
+int rockchip_pctrl_probe(struct platform_device *pdev)
 {
-	struct rockchip_pinctrl *info;
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
+	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
-	struct rockchip_pin_ctrl *ctrl;
-	struct device_node *np = pdev->dev.of_node, *node;
-	struct resource *res;
-	void __iomem *base;
+	struct rockchip_pinctrl *info;
 	int ret;
 
-	if (!dev->of_node) {
-		dev_err(dev, "device tree node not found\n");
-		return -ENODEV;
-	}
+	if (!np)
+		return -EINVAL;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	if (!match || !match->data)
+		return -EINVAL;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
 	info->dev = dev;
+	info->ctrl = (struct rockchip_pin_ctrl *)match->data;
+
+	platform_set_drvdata(pdev, info);
 
-	ctrl = rockchip_pinctrl_get_soc_data(info, pdev);
-	if (!ctrl) {
+	ret = rockchip_pctrl_get_soc_data(pdev);
+	if (ret) {
 		dev_err(dev, "driver data not available\n");
 		return -EINVAL;
 	}
-	info->ctrl = ctrl;
 
-	node = of_parse_phandle(np, "rockchip,grf", 0);
-	if (node) {
-		info->regmap_base = syscon_node_to_regmap(node);
+	child = of_parse_phandle(np, "rockchip,grf", 0);
+	if (child) {
+		info->regmap_base = syscon_node_to_regmap(child);
 		if (IS_ERR(info->regmap_base))
 			return PTR_ERR(info->regmap_base);
-	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		base = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(base))
-			return PTR_ERR(base);
-
-		rockchip_regmap_config.max_register = resource_size(res) - 4;
-		rockchip_regmap_config.name = "rockchip,pinctrl";
-		info->regmap_base = devm_regmap_init_mmio(&pdev->dev, base,
-						    &rockchip_regmap_config);
-
-		/* to check for the old dt-bindings */
-		info->reg_size = resource_size(res);
-
-		/* Honor the old binding, with pull registers as 2nd resource */
-		if (ctrl->type == RK3188 && info->reg_size < 0x200) {
-			res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-			base = devm_ioremap_resource(&pdev->dev, res);
-			if (IS_ERR(base))
-				return PTR_ERR(base);
-
-			rockchip_regmap_config.max_register =
-							resource_size(res) - 4;
-			rockchip_regmap_config.name = "rockchip,pinctrl-pull";
-			info->regmap_pull = devm_regmap_init_mmio(&pdev->dev,
-						    base,
-						    &rockchip_regmap_config);
-		}
 	}
 
-	/* try to find the optional reference to the pmu syscon */
-	node = of_parse_phandle(np, "rockchip,pmu", 0);
-	if (node) {
-		info->regmap_pmu = syscon_node_to_regmap(node);
+	child = of_parse_phandle(np, "rockchip,pmu", 0);
+	if (child) {
+		info->regmap_pmu = syscon_node_to_regmap(child);
 		if (IS_ERR(info->regmap_pmu))
 			return PTR_ERR(info->regmap_pmu);
 	}
@@ -3811,444 +2051,13 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rockchip_pinctrl_register(pdev, info);
+	ret = rockchip_pctrl_register(pdev, info);
 	if (ret) {
 		rockchip_gpiolib_unregister(pdev, info);
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, info);
-
 	return 0;
 }
+EXPORT_SYMBOL(rockchip_pctrl_probe);
 
-static struct rockchip_pin_bank px30_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU
-			    ),
-	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT
-			    ),
-	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT
-			    ),
-	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT
-			    ),
-};
-
-static struct rockchip_pin_ctrl px30_pin_ctrl = {
-		.pin_banks		= px30_pin_banks,
-		.nr_banks		= ARRAY_SIZE(px30_pin_banks),
-		.label			= "PX30-GPIO",
-		.type			= PX30,
-		.grf_mux_offset		= 0x0,
-		.pmu_mux_offset		= 0x0,
-		.iomux_routes		= px30_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(px30_mux_route_data),
-		.pull_calc_reg		= px30_calc_pull_reg_and_bit,
-		.drv_calc_reg		= px30_calc_drv_reg_and_bit,
-		.schmitt_calc_reg	= px30_calc_schmitt_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rv1108_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU),
-	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
-	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, 0, 0, 0),
-	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0, 0),
-};
-
-static struct rockchip_pin_ctrl rv1108_pin_ctrl = {
-	.pin_banks		= rv1108_pin_banks,
-	.nr_banks		= ARRAY_SIZE(rv1108_pin_banks),
-	.label			= "RV1108-GPIO",
-	.type			= RV1108,
-	.grf_mux_offset		= 0x10,
-	.pmu_mux_offset		= 0x0,
-	.iomux_recalced		= rv1108_mux_recalced_data,
-	.niomux_recalced	= ARRAY_SIZE(rv1108_mux_recalced_data),
-	.pull_calc_reg		= rv1108_calc_pull_reg_and_bit,
-	.drv_calc_reg		= rv1108_calc_drv_reg_and_bit,
-	.schmitt_calc_reg	= rv1108_calc_schmitt_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk2928_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-};
-
-static struct rockchip_pin_ctrl rk2928_pin_ctrl = {
-		.pin_banks		= rk2928_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk2928_pin_banks),
-		.label			= "RK2928-GPIO",
-		.type			= RK2928,
-		.grf_mux_offset		= 0xa8,
-		.pull_calc_reg		= rk2928_calc_pull_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3036_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-};
-
-static struct rockchip_pin_ctrl rk3036_pin_ctrl = {
-		.pin_banks		= rk3036_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3036_pin_banks),
-		.label			= "RK3036-GPIO",
-		.type			= RK2928,
-		.grf_mux_offset		= 0xa8,
-		.pull_calc_reg		= rk2928_calc_pull_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3066a_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-	PIN_BANK(4, 32, "gpio4"),
-	PIN_BANK(6, 16, "gpio6"),
-};
-
-static struct rockchip_pin_ctrl rk3066a_pin_ctrl = {
-		.pin_banks		= rk3066a_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3066a_pin_banks),
-		.label			= "RK3066a-GPIO",
-		.type			= RK2928,
-		.grf_mux_offset		= 0xa8,
-		.pull_calc_reg		= rk2928_calc_pull_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3066b_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-};
-
-static struct rockchip_pin_ctrl rk3066b_pin_ctrl = {
-		.pin_banks	= rk3066b_pin_banks,
-		.nr_banks	= ARRAY_SIZE(rk3066b_pin_banks),
-		.label		= "RK3066b-GPIO",
-		.type		= RK3066B,
-		.grf_mux_offset	= 0x60,
-};
-
-static struct rockchip_pin_bank rk3128_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-};
-
-static struct rockchip_pin_ctrl rk3128_pin_ctrl = {
-		.pin_banks		= rk3128_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3128_pin_banks),
-		.label			= "RK3128-GPIO",
-		.type			= RK3128,
-		.grf_mux_offset		= 0xa8,
-		.iomux_recalced		= rk3128_mux_recalced_data,
-		.niomux_recalced	= ARRAY_SIZE(rk3128_mux_recalced_data),
-		.iomux_routes		= rk3128_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3128_mux_route_data),
-		.pull_calc_reg		= rk3128_calc_pull_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3188_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_GPIO_ONLY, 0, 0, 0),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-};
-
-static struct rockchip_pin_ctrl rk3188_pin_ctrl = {
-		.pin_banks		= rk3188_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3188_pin_banks),
-		.label			= "RK3188-GPIO",
-		.type			= RK3188,
-		.grf_mux_offset		= 0x60,
-		.iomux_routes		= rk3188_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3188_mux_route_data),
-		.pull_calc_reg		= rk3188_calc_pull_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3228_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-};
-
-static struct rockchip_pin_ctrl rk3228_pin_ctrl = {
-		.pin_banks		= rk3228_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3228_pin_banks),
-		.label			= "RK3228-GPIO",
-		.type			= RK3288,
-		.grf_mux_offset		= 0x0,
-		.iomux_routes		= rk3228_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3228_mux_route_data),
-		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
-		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3288_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 24, "gpio0", IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_UNROUTED
-			    ),
-	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_UNROUTED,
-					     IOMUX_UNROUTED,
-					     IOMUX_UNROUTED,
-					     0
-			    ),
-	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, 0, 0, IOMUX_UNROUTED),
-	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0, IOMUX_WIDTH_4BIT),
-	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4", IOMUX_WIDTH_4BIT,
-					     IOMUX_WIDTH_4BIT,
-					     0,
-					     0
-			    ),
-	PIN_BANK_IOMUX_FLAGS(5, 32, "gpio5", IOMUX_UNROUTED,
-					     0,
-					     0,
-					     IOMUX_UNROUTED
-			    ),
-	PIN_BANK_IOMUX_FLAGS(6, 32, "gpio6", 0, 0, 0, IOMUX_UNROUTED),
-	PIN_BANK_IOMUX_FLAGS(7, 32, "gpio7", 0,
-					     0,
-					     IOMUX_WIDTH_4BIT,
-					     IOMUX_UNROUTED
-			    ),
-	PIN_BANK(8, 16, "gpio8"),
-};
-
-static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
-		.pin_banks		= rk3288_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3288_pin_banks),
-		.label			= "RK3288-GPIO",
-		.type			= RK3288,
-		.grf_mux_offset		= 0x0,
-		.pmu_mux_offset		= 0x84,
-		.iomux_routes		= rk3288_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3288_mux_route_data),
-		.pull_calc_reg		= rk3288_calc_pull_reg_and_bit,
-		.drv_calc_reg		= rk3288_calc_drv_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3308_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT),
-	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT),
-	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT),
-	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT),
-	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4", IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT,
-					     IOMUX_WIDTH_2BIT),
-};
-
-static struct rockchip_pin_ctrl rk3308_pin_ctrl = {
-		.pin_banks		= rk3308_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3308_pin_banks),
-		.label			= "RK3308-GPIO",
-		.type			= RK3308,
-		.grf_mux_offset		= 0x0,
-		.iomux_recalced		= rk3308_mux_recalced_data,
-		.niomux_recalced	= ARRAY_SIZE(rk3308_mux_recalced_data),
-		.iomux_routes		= rk3308_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3308_mux_route_data),
-		.pull_calc_reg		= rk3308_calc_pull_reg_and_bit,
-		.drv_calc_reg		= rk3308_calc_drv_reg_and_bit,
-		.schmitt_calc_reg	= rk3308_calc_schmitt_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3328_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
-	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
-	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
-			     IOMUX_WIDTH_3BIT,
-			     IOMUX_WIDTH_3BIT,
-			     0),
-	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
-			     IOMUX_WIDTH_3BIT,
-			     IOMUX_WIDTH_3BIT,
-			     0,
-			     0),
-};
-
-static struct rockchip_pin_ctrl rk3328_pin_ctrl = {
-		.pin_banks		= rk3328_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3328_pin_banks),
-		.label			= "RK3328-GPIO",
-		.type			= RK3288,
-		.grf_mux_offset		= 0x0,
-		.iomux_recalced		= rk3328_mux_recalced_data,
-		.niomux_recalced	= ARRAY_SIZE(rk3328_mux_recalced_data),
-		.iomux_routes		= rk3328_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3328_mux_route_data),
-		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
-		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
-		.schmitt_calc_reg	= rk3328_calc_schmitt_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3368_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU,
-					     IOMUX_SOURCE_PMU
-			    ),
-	PIN_BANK(1, 32, "gpio1"),
-	PIN_BANK(2, 32, "gpio2"),
-	PIN_BANK(3, 32, "gpio3"),
-};
-
-static struct rockchip_pin_ctrl rk3368_pin_ctrl = {
-		.pin_banks		= rk3368_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3368_pin_banks),
-		.label			= "RK3368-GPIO",
-		.type			= RK3368,
-		.grf_mux_offset		= 0x0,
-		.pmu_mux_offset		= 0x0,
-		.pull_calc_reg		= rk3368_calc_pull_reg_and_bit,
-		.drv_calc_reg		= rk3368_calc_drv_reg_and_bit,
-};
-
-static struct rockchip_pin_bank rk3399_pin_banks[] = {
-	PIN_BANK_IOMUX_FLAGS_DRV_FLAGS_OFFSET_PULL_FLAGS(0, 32, "gpio0",
-							 IOMUX_SOURCE_PMU,
-							 IOMUX_SOURCE_PMU,
-							 IOMUX_SOURCE_PMU,
-							 IOMUX_SOURCE_PMU,
-							 DRV_TYPE_IO_1V8_ONLY,
-							 DRV_TYPE_IO_1V8_ONLY,
-							 DRV_TYPE_IO_DEFAULT,
-							 DRV_TYPE_IO_DEFAULT,
-							 0x80,
-							 0x88,
-							 -1,
-							 -1,
-							 PULL_TYPE_IO_1V8_ONLY,
-							 PULL_TYPE_IO_1V8_ONLY,
-							 PULL_TYPE_IO_DEFAULT,
-							 PULL_TYPE_IO_DEFAULT
-							),
-	PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(1, 32, "gpio1", IOMUX_SOURCE_PMU,
-					IOMUX_SOURCE_PMU,
-					IOMUX_SOURCE_PMU,
-					IOMUX_SOURCE_PMU,
-					DRV_TYPE_IO_1V8_OR_3V0,
-					DRV_TYPE_IO_1V8_OR_3V0,
-					DRV_TYPE_IO_1V8_OR_3V0,
-					DRV_TYPE_IO_1V8_OR_3V0,
-					0xa0,
-					0xa8,
-					0xb0,
-					0xb8
-					),
-	PIN_BANK_DRV_FLAGS_PULL_FLAGS(2, 32, "gpio2", DRV_TYPE_IO_1V8_OR_3V0,
-				      DRV_TYPE_IO_1V8_OR_3V0,
-				      DRV_TYPE_IO_1V8_ONLY,
-				      DRV_TYPE_IO_1V8_ONLY,
-				      PULL_TYPE_IO_DEFAULT,
-				      PULL_TYPE_IO_DEFAULT,
-				      PULL_TYPE_IO_1V8_ONLY,
-				      PULL_TYPE_IO_1V8_ONLY
-				      ),
-	PIN_BANK_DRV_FLAGS(3, 32, "gpio3", DRV_TYPE_IO_3V3_ONLY,
-			   DRV_TYPE_IO_3V3_ONLY,
-			   DRV_TYPE_IO_3V3_ONLY,
-			   DRV_TYPE_IO_1V8_OR_3V0
-			   ),
-	PIN_BANK_DRV_FLAGS(4, 32, "gpio4", DRV_TYPE_IO_1V8_OR_3V0,
-			   DRV_TYPE_IO_1V8_3V0_AUTO,
-			   DRV_TYPE_IO_1V8_OR_3V0,
-			   DRV_TYPE_IO_1V8_OR_3V0
-			   ),
-};
-
-static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
-		.pin_banks		= rk3399_pin_banks,
-		.nr_banks		= ARRAY_SIZE(rk3399_pin_banks),
-		.label			= "RK3399-GPIO",
-		.type			= RK3399,
-		.grf_mux_offset		= 0xe000,
-		.pmu_mux_offset		= 0x0,
-		.grf_drv_offset		= 0xe100,
-		.pmu_drv_offset		= 0x80,
-		.iomux_routes		= rk3399_mux_route_data,
-		.niomux_routes		= ARRAY_SIZE(rk3399_mux_route_data),
-		.pull_calc_reg		= rk3399_calc_pull_reg_and_bit,
-		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
-};
-
-static const struct of_device_id rockchip_pinctrl_dt_match[] = {
-	{ .compatible = "rockchip,px30-pinctrl",
-		.data = &px30_pin_ctrl },
-	{ .compatible = "rockchip,rv1108-pinctrl",
-		.data = &rv1108_pin_ctrl },
-	{ .compatible = "rockchip,rk2928-pinctrl",
-		.data = &rk2928_pin_ctrl },
-	{ .compatible = "rockchip,rk3036-pinctrl",
-		.data = &rk3036_pin_ctrl },
-	{ .compatible = "rockchip,rk3066a-pinctrl",
-		.data = &rk3066a_pin_ctrl },
-	{ .compatible = "rockchip,rk3066b-pinctrl",
-		.data = &rk3066b_pin_ctrl },
-	{ .compatible = "rockchip,rk3128-pinctrl",
-		.data = (void *)&rk3128_pin_ctrl },
-	{ .compatible = "rockchip,rk3188-pinctrl",
-		.data = &rk3188_pin_ctrl },
-	{ .compatible = "rockchip,rk3228-pinctrl",
-		.data = &rk3228_pin_ctrl },
-	{ .compatible = "rockchip,rk3288-pinctrl",
-		.data = &rk3288_pin_ctrl },
-	{ .compatible = "rockchip,rk3308-pinctrl",
-		.data = &rk3308_pin_ctrl },
-	{ .compatible = "rockchip,rk3328-pinctrl",
-		.data = &rk3328_pin_ctrl },
-	{ .compatible = "rockchip,rk3368-pinctrl",
-		.data = &rk3368_pin_ctrl },
-	{ .compatible = "rockchip,rk3399-pinctrl",
-		.data = &rk3399_pin_ctrl },
-	{},
-};
-
-static struct platform_driver rockchip_pinctrl_driver = {
-	.probe		= rockchip_pinctrl_probe,
-	.driver = {
-		.name	= "rockchip-pinctrl",
-		.pm = &rockchip_pinctrl_dev_pm_ops,
-		.of_match_table = rockchip_pinctrl_dt_match,
-	},
-};
-
-static int __init rockchip_pinctrl_drv_register(void)
-{
-	return platform_driver_register(&rockchip_pinctrl_driver);
-}
-postcore_initcall(rockchip_pinctrl_drv_register);
diff --git a/drivers/pinctrl/rockchip/pinctrl-rockchip.h b/drivers/pinctrl/rockchip/pinctrl-rockchip.h
new file mode 100644
index 000000000000..ad4200b44744
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rockchip.h
@@ -0,0 +1,388 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#ifndef __PINCTRL_ROCKCHIP_H__
+#define __PINCTRL_ROCKCHIP_H__
+
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <linux/irq.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+
+enum rockchip_pinctrl_type {
+	PX30,
+	RV1108,
+	RK2928,
+	RK3066B,
+	RK3128,
+	RK3188,
+	RK3288,
+	RK3308,
+	RK3368,
+	RK3399,
+};
+
+/**
+ * Encode variants of iomux registers into a type variable
+ */
+#define IOMUX_GPIO_ONLY		BIT(0)
+#define IOMUX_WIDTH_4BIT	BIT(1)
+#define IOMUX_SOURCE_PMU	BIT(2)
+#define IOMUX_UNROUTED		BIT(3)
+#define IOMUX_WIDTH_3BIT	BIT(4)
+#define IOMUX_WIDTH_2BIT	BIT(5)
+
+/**
+ * @type: iomux variant using IOMUX_* constants
+ * @offset: if initialized to -1 it will be autocalculated, by specifying
+ *	    an initial offset value the relevant source offset can be reset
+ *	    to a new value for autocalculating the following iomux registers.
+ */
+struct rockchip_iomux {
+	int				type;
+	int				offset;
+};
+
+/**
+ * enum type index corresponding to rockchip_perpin_drv_list arrays index.
+ */
+enum rockchip_pin_drv_type {
+	DRV_TYPE_IO_DEFAULT = 0,
+	DRV_TYPE_IO_1V8_OR_3V0,
+	DRV_TYPE_IO_1V8_ONLY,
+	DRV_TYPE_IO_1V8_3V0_AUTO,
+	DRV_TYPE_IO_3V3_ONLY,
+	DRV_TYPE_MAX
+};
+
+/**
+ * enum type index corresponding to rockchip_pull_list arrays index.
+ */
+enum rockchip_pin_pull_type {
+	PULL_TYPE_IO_DEFAULT = 0,
+	PULL_TYPE_IO_1V8_ONLY,
+	PULL_TYPE_MAX
+};
+
+/**
+ * @drv_type: drive strength variant using rockchip_perpin_drv_type
+ * @offset: if initialized to -1 it will be autocalculated, by specifying
+ *	    an initial offset value the relevant source offset can be reset
+ *	    to a new value for autocalculating the following drive strength
+ *	    registers. if used chips own cal_drv func instead to calculate
+ *	    registers offset, the variant could be ignored.
+ */
+struct rockchip_drv {
+	enum rockchip_pin_drv_type	drv_type;
+	int				offset;
+};
+
+/**
+ * @reg_base: register base of the gpio bank
+ * @reg_pull: optional separate register for additional pull settings
+ * @clk: clock of the gpio bank
+ * @irq: interrupt of the gpio bank
+ * @saved_masks: Saved content of GPIO_INTEN at suspend time.
+ * @pin_base: first pin number
+ * @nr_pins: number of pins in this bank
+ * @name: name of the bank
+ * @bank_num: number of the bank, to account for holes
+ * @iomux: array describing the 4 iomux sources of the bank
+ * @drv: array describing the 4 drive strength sources of the bank
+ * @pull_type: array describing the 4 pull type sources of the bank
+ * @valid: is all necessary information present
+ * @of_node: dt node of this bank
+ * @drvdata: common pinctrl basedata
+ * @domain: irqdomain of the gpio bank
+ * @gpio_chip: gpiolib chip
+ * @grange: gpio range
+ * @slock: spinlock for the gpio bank
+ * @route_mask: bits describing the routing pins of per bank
+ */
+struct rockchip_pin_bank {
+	void __iomem			*reg_base;
+	struct regmap			*regmap_pull;
+	struct clk			*clk;
+	int				irq;
+	u32				saved_masks;
+	u32				pin_base;
+	u8				nr_pins;
+	char				*name;
+	u8				bank_num;
+	struct rockchip_iomux		iomux[4];
+	struct rockchip_drv		drv[4];
+	enum rockchip_pin_pull_type	pull_type[4];
+	bool				valid;
+	struct device_node		*of_node;
+	struct rockchip_pinctrl		*drvdata;
+	struct irq_domain		*domain;
+	struct gpio_chip		gpio_chip;
+	struct pinctrl_gpio_range	grange;
+	raw_spinlock_t			slock;
+	u32				toggle_edge_mode;
+	u32				recalced_mask;
+	u32				route_mask;
+};
+
+#define PIN_BANK(id, pins, label)			\
+	{						\
+		.bank_num	= id,			\
+		.nr_pins	= pins,			\
+		.name		= label,		\
+		.iomux		= {			\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+		},					\
+	}
+
+#define PIN_BANK_IOMUX_FLAGS(id, pins, label, iom0, iom1, iom2, iom3)	\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = -1 },			\
+			{ .type = iom1, .offset = -1 },			\
+			{ .type = iom2, .offset = -1 },			\
+			{ .type = iom3, .offset = -1 },			\
+		},							\
+	}
+
+#define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+		},							\
+		.drv		= {					\
+			{ .drv_type = type0, .offset = -1 },		\
+			{ .drv_type = type1, .offset = -1 },		\
+			{ .drv_type = type2, .offset = -1 },		\
+			{ .drv_type = type3, .offset = -1 },		\
+		},							\
+	}
+
+#define PIN_BANK_DRV_FLAGS_PULL_FLAGS(id, pins, label, drv0, drv1,	\
+				      drv2, drv3, pull0, pull1,		\
+				      pull2, pull3)			\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+			{ .offset = -1 },				\
+		},							\
+		.drv		= {					\
+			{ .drv_type = drv0, .offset = -1 },		\
+			{ .drv_type = drv1, .offset = -1 },		\
+			{ .drv_type = drv2, .offset = -1 },		\
+			{ .drv_type = drv3, .offset = -1 },		\
+		},							\
+		.pull_type[0] = pull0,					\
+		.pull_type[1] = pull1,					\
+		.pull_type[2] = pull2,					\
+		.pull_type[3] = pull3,					\
+	}
+
+#define PIN_BANK_IOMUX_DRV_FLAGS_OFFSET(id, pins, label, iom0, iom1,	\
+					iom2, iom3, drv0, drv1, drv2,	\
+					drv3, offset0, offset1,		\
+					offset2, offset3)		\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = -1 },			\
+			{ .type = iom1, .offset = -1 },			\
+			{ .type = iom2, .offset = -1 },			\
+			{ .type = iom3, .offset = -1 },			\
+		},							\
+		.drv		= {					\
+			{ .drv_type = drv0, .offset = offset0 },	\
+			{ .drv_type = drv1, .offset = offset1 },	\
+			{ .drv_type = drv2, .offset = offset2 },	\
+			{ .drv_type = drv3, .offset = offset3 },	\
+		},							\
+	}
+
+#define PIN_BANK_IOMUX_FLAGS_DRV_FLAGS_OFFSET_PULL_FLAGS(id, pins,	\
+					      label, iom0, iom1, iom2,  \
+					      iom3, drv0, drv1, drv2,   \
+					      drv3, offset0, offset1,   \
+					      offset2, offset3, pull0,  \
+					      pull1, pull2, pull3)	\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = -1 },			\
+			{ .type = iom1, .offset = -1 },			\
+			{ .type = iom2, .offset = -1 },			\
+			{ .type = iom3, .offset = -1 },			\
+		},							\
+		.drv		= {					\
+			{ .drv_type = drv0, .offset = offset0 },	\
+			{ .drv_type = drv1, .offset = offset1 },	\
+			{ .drv_type = drv2, .offset = offset2 },	\
+			{ .drv_type = drv3, .offset = offset3 },	\
+		},							\
+		.pull_type[0] = pull0,					\
+		.pull_type[1] = pull1,					\
+		.pull_type[2] = pull2,					\
+		.pull_type[3] = pull3,					\
+	}
+
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @num: bank number.
+ * @pin: pin number.
+ * @bit: index at register.
+ * @reg: register offset.
+ * @mask: mask bit
+ */
+struct rockchip_mux_recalced_data {
+	u8 num;
+	u8 pin;
+	u32 reg;
+	u8 bit;
+	u8 mask;
+};
+
+enum rockchip_mux_route_location {
+	ROCKCHIP_ROUTE_SAME = 0,
+	ROCKCHIP_ROUTE_PMU,
+	ROCKCHIP_ROUTE_GRF,
+};
+
+/**
+ * struct rockchip_mux_recalced_data: represent a pin iomux data.
+ * @bank_num: bank number.
+ * @pin: index at register or used to calc index.
+ * @func: the min pin.
+ * @route_offset: the max pin.
+ * @route_val: the register offset.
+ */
+struct rockchip_mux_route_data {
+	u8 bank_num;
+	u8 pin;
+	u8 func;
+	enum rockchip_mux_route_location route_location;
+	u32 route_offset;
+	u32 route_val;
+};
+
+/**
+ */
+struct rockchip_pin_ctrl {
+	struct rockchip_pin_bank	*pin_banks;
+	u32				nr_banks;
+	u32				nr_pins;
+	char				*label;
+	enum rockchip_pinctrl_type	type;
+	int				grf_mux_offset;
+	int				pmu_mux_offset;
+	int				grf_drv_offset;
+	int				pmu_drv_offset;
+	struct rockchip_mux_recalced_data *iomux_recalced;
+	u32				niomux_recalced;
+	struct rockchip_mux_route_data *iomux_routes;
+	u32				niomux_routes;
+
+	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit);
+	void	(*drv_calc_reg)(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit);
+	int	(*schmitt_calc_reg)(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit);
+};
+
+struct rockchip_pin_config {
+	unsigned int		func;
+	unsigned long		*configs;
+	unsigned int		nconfigs;
+};
+
+/**
+ * struct rockchip_pin_group: represent group of pins of a pinmux function.
+ * @name: name of the pin group, used to lookup the group.
+ * @pins: the pins included in this group.
+ * @npins: number of pins included in this group.
+ * @func: the mux function number to be programmed when selected.
+ * @configs: the config values to be set for each pin
+ * @nconfigs: number of configs for each pin
+ */
+struct rockchip_pin_group {
+	const char			*name;
+	unsigned int			npins;
+	unsigned int			*pins;
+	struct rockchip_pin_config	*data;
+};
+
+/**
+ * struct rockchip_pmx_func: represent a pin function.
+ * @name: name of the pin function, used to lookup the function.
+ * @groups: one or more names of pin groups that provide this function.
+ * @num_groups: number of groups included in @groups.
+ */
+struct rockchip_pmx_func {
+	const char		*name;
+	const char		**groups;
+	u8			ngroups;
+};
+
+struct rockchip_pinctrl {
+	struct regmap			*regmap_base;
+	int				reg_size;
+	struct regmap			*regmap_pull;
+	struct regmap			*regmap_pmu;
+	struct device			*dev;
+	struct rockchip_pin_ctrl	*ctrl;
+	struct pinctrl_desc		pctl;
+	struct pinctrl_dev		*pctl_dev;
+	struct rockchip_pin_group	*groups;
+	unsigned int			ngroups;
+	struct rockchip_pmx_func	*functions;
+	unsigned int			nfunctions;
+};
+
+extern const struct dev_pm_ops rockchip_pctrl_dev_pm_ops;
+
+int rockchip_pctrl_probe(struct platform_device *pdev);
+
+#endif
diff --git a/drivers/pinctrl/rockchip/pinctrl-rv1108.c b/drivers/pinctrl/rockchip/pinctrl-rv1108.c
new file mode 100644
index 000000000000..947b65db860b
--- /dev/null
+++ b/drivers/pinctrl/rockchip/pinctrl-rv1108.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-rockchip.h"
+
+#define RV1108_PULL_PMU_OFFSET		0x10
+#define RV1108_PULL_OFFSET		0x110
+#define RV1108_PULL_PINS_PER_REG	8
+#define RV1108_PULL_BITS_PER_PIN	2
+#define RV1108_PULL_BANK_STRIDE		16
+
+#define RV1108_DRV_PMU_OFFSET		0x20
+#define RV1108_DRV_GRF_OFFSET		0x210
+#define RV1108_DRV_BITS_PER_PIN		2
+#define RV1108_DRV_PINS_PER_REG		8
+#define RV1108_DRV_BANK_STRIDE		16
+
+#define RV1108_SCHMITT_PMU_OFFSET		0x30
+#define RV1108_SCHMITT_GRF_OFFSET		0x388
+#define RV1108_SCHMITT_BANK_STRIDE		8
+#define RV1108_SCHMITT_PINS_PER_GRF_REG		16
+#define RV1108_SCHMITT_PINS_PER_PMU_REG		8
+
+static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
+	{
+		.num = 1,
+		.pin = 0,
+		.reg = 0x418,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 1,
+		.reg = 0x418,
+		.bit = 2,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 2,
+		.reg = 0x418,
+		.bit = 4,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 3,
+		.reg = 0x418,
+		.bit = 6,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 4,
+		.reg = 0x418,
+		.bit = 8,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 5,
+		.reg = 0x418,
+		.bit = 10,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 6,
+		.reg = 0x418,
+		.bit = 12,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 7,
+		.reg = 0x418,
+		.bit = 14,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 8,
+		.reg = 0x41c,
+		.bit = 0,
+		.mask = 0x3
+	}, {
+		.num = 1,
+		.pin = 9,
+		.reg = 0x41c,
+		.bit = 2,
+		.mask = 0x3
+	},
+};
+
+static void rv1108_calc_pull(struct rockchip_pin_bank *bank,
+			     int pin_num, struct regmap **regmap,
+			     int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RV1108_PULL_PMU_OFFSET;
+	} else {
+		*reg = RV1108_PULL_OFFSET;
+		*regmap = info->regmap_base;
+		/* correct the offset, as we're starting with the secnod bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RV1108_PULL_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RV1108_PULL_PINS_PER_REG) * 4);
+	*bit = (pin_num % RV1108_PULL_PINS_PER_REG);
+	*bit *= RV1108_PULL_BITS_PER_PIN;
+}
+
+static void rv1108_calc_drv(struct rockchip_pin_bank *bank,
+			    int pin_num, struct regmap **regmap,
+			    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located in PMU */
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RV1108_DRV_PMU_OFFSET;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RV1108_DRV_GRF_OFFSET;
+
+		/* correct the offset, as we're starting with the second bank */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RV1108_DRV_BANK_STRIDE;
+	}
+
+	*reg += ((pin_num / RV1108_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1108_DRV_PINS_PER_REG;
+	*bit *= RV1108_DRV_BITS_PER_PIN;
+}
+
+static int rv1108_calc_schmitt(struct rockchip_pin_bank *bank,
+			       int pin_num,
+			       struct regmap **regmap,
+			       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int pins_per_reg;
+
+	if (bank->bank_num == 0) {
+		*regmap = info->regmap_pmu;
+		*reg = RV1108_SCHMITT_PMU_OFFSET;
+		pins_per_reg = RV1108_SCHMITT_PINS_PER_PMU_REG;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RV1108_SCHMITT_GRF_OFFSET;
+		pins_per_reg = RV1108_SCHMITT_PINS_PER_GRF_REG;
+		*reg += (bank->bank_num  - 1) * RV1108_SCHMITT_BANK_STRIDE;
+	}
+	*reg += ((pin_num / pins_per_reg) * 4);
+	*bit = pin_num % pins_per_reg;
+
+	return 0;
+}
+
+static struct rockchip_pin_bank rv1108_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU,
+			     IOMUX_SOURCE_PMU),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0, 0),
+};
+
+static struct rockchip_pin_ctrl rv1108_pin_ctrl = {
+	.pin_banks		= rv1108_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1108_pin_banks),
+	.label			= "RV1108-GPIO",
+	.type			= RV1108,
+	.grf_mux_offset		= 0x10,
+	.pmu_mux_offset		= 0x0,
+	.iomux_recalced		= rv1108_mux_recalced_data,
+	.niomux_recalced	= ARRAY_SIZE(rv1108_mux_recalced_data),
+	.pull_calc_reg		= rv1108_calc_pull,
+	.drv_calc_reg		= rv1108_calc_drv,
+	.schmitt_calc_reg	= rv1108_calc_schmitt,
+};
+
+static const struct of_device_id rv1108_pinctrl_dt_match[] = {
+	{ .compatible = "rockchip,rv1108-pinctrl",
+		.data = &rv1108_pin_ctrl },
+	{},
+};
+
+static struct platform_driver rv1108_pinctrl_driver = {
+	.probe		= rockchip_pctrl_probe,
+	.driver = {
+		.name	= "rv1108-pinctrl",
+		.pm = &rockchip_pctrl_dev_pm_ops,
+		.of_match_table = rv1108_pinctrl_dt_match,
+	},
+};
+
+static int __init rv1108_pinctrl_init(void)
+{
+	return platform_driver_register(&rv1108_pinctrl_driver);
+}
+postcore_initcall(rv1108_pinctrl_init);
+
+MODULE_DESCRIPTION("RV1108 pin control and GPIO driver");
+MODULE_AUTHOR("Jianqun Xu <jay.xu@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1



