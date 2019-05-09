Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC8A18689
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 10:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfEIIJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 04:09:35 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14754 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfEIIJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 04:09:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd3e0180002>; Thu, 09 May 2019 01:08:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 May 2019 01:09:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 May 2019 01:09:32 -0700
Received: from HQMAIL103.nvidia.com (172.20.187.11) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 May
 2019 08:09:31 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 9 May 2019 08:09:31 +0000
Received: from kyarlagadda-linux.nvidia.com (Not Verified[10.19.64.169]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd3e0380003>; Thu, 09 May 2019 01:09:31 -0700
From:   Krishna Yarlagadda <kyarlagadda@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>,
        <vidyas@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: [Patch-V2 3/4] pinctrl: tegra: Add Tegra194 pinmux driver
Date:   Thu, 9 May 2019 13:38:15 +0530
Message-ID: <1557389296-10257-3-git-send-email-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
References: <1557389296-10257-1-git-send-email-kyarlagadda@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557389336; bh=I9ztogdgQWxlUbRsIE1w6IFbR6hAxS6MHG5OxI6z/HY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=M3lWK+HjnFEVZ7a4vFZyLmyDGOyDjX54Y9Fh/dJNAeZOFekV4i0XqnRpTobg9CRBa
         sxfkxQU01GM+LNFrI4OgR/Q42VWYB0AZI5+AkuToZw664OgeLxjyxc5qbC4yir/EMV
         pMhSiIGehjynufJ+Ji0T8HyhQ9fKTgUR5N7NbKS2DMhHBPpbg3oCdIr4VlIPJVyes+
         qziunCkiOrj2LpRKMHtCK/QrsMENR7E8FPiyXIgyGGvAjLkiMW03HQYJ+VIt1NoJNJ
         hgBrSQNvCh6ejKmlBzi8rw1Paagb+4LtT6PUvr74+eMd8n1a5g0duNwCY+iYgYb6VE
         4tAUd6GuafJXg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 has PCIE L5 rst and clkreq pins which need to be controlled
dynamically at runtime. This driver supports change pinmux for these
pins. Pinmux for rest of the pins is set statically by bootloader and
will not be changed by this driver

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
---
Changes in V2:
split V1 patch into 3 patches driver change, updating header to support
new driver and select pinmux drier in soc.
Remove irrelevant macros.

 drivers/pinctrl/tegra/Kconfig            |   4 +
 drivers/pinctrl/tegra/Makefile           |   1 +
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 168 +++++++++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra194.c

diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index 24e20cc..6f79f1f 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -23,6 +23,10 @@ config PINCTRL_TEGRA210
 	bool
 	select PINCTRL_TEGRA
 
+config PINCTRL_TEGRA194
+	bool
+	select PINCTRL_TEGRA
+
 config PINCTRL_TEGRA_XUSB
 	def_bool y if ARCH_TEGRA
 	select GENERIC_PHY
diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
index bbcb043..ead4e10 100644
--- a/drivers/pinctrl/tegra/Makefile
+++ b/drivers/pinctrl/tegra/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_PINCTRL_TEGRA30)		+= pinctrl-tegra30.o
 obj-$(CONFIG_PINCTRL_TEGRA114)		+= pinctrl-tegra114.o
 obj-$(CONFIG_PINCTRL_TEGRA124)		+= pinctrl-tegra124.o
 obj-$(CONFIG_PINCTRL_TEGRA210)		+= pinctrl-tegra210.o
+obj-$(CONFIG_PINCTRL_TEGRA194)		+= pinctrl-tegra194.o
 obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+= pinctrl-tegra-xusb.o
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
new file mode 100644
index 0000000..399598a
--- /dev/null
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Pinctrl data for the NVIDIA Tegra194 pinmux
+ *
+ * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+/* Define unique ID for each pins */
+enum pin_id {
+	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 = 256,
+	TEGRA_PIN_PEX_L5_RST_N_PGG1 = 257,
+	TEGRA_PIN_NUM_GPIOS = 258,
+};
+
+/* Table for pin descriptor */
+static const struct pinctrl_pin_desc tegra194_pins[] = {
+	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
+		    "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
+		    "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
+};
+
+static const unsigned int pex_l5_clkreq_n_pgg0_pins[] = {
+	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
+};
+
+static const unsigned int pex_l5_rst_n_pgg1_pins[] = {
+	TEGRA_PIN_PEX_L5_RST_N_PGG1,
+};
+
+/* Define unique ID for each function */
+enum tegra_mux_dt {
+	TEGRA_MUX_RSVD0,
+	TEGRA_MUX_RSVD1,
+	TEGRA_MUX_RSVD2,
+	TEGRA_MUX_RSVD3,
+	TEGRA_MUX_PE5,
+};
+
+/* Make list of each function name */
+#define TEGRA_PIN_FUNCTION(lid)			\
+	{					\
+		.name = #lid,			\
+	}
+static struct tegra_function tegra194_functions[] = {
+	TEGRA_PIN_FUNCTION(rsvd0),
+	TEGRA_PIN_FUNCTION(rsvd1),
+	TEGRA_PIN_FUNCTION(rsvd2),
+	TEGRA_PIN_FUNCTION(rsvd3),
+	TEGRA_PIN_FUNCTION(pe5),
+};
+
+#define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,	\
+			     drvup_w, slwr_b, slwr_w, slwf_b,	\
+			     slwf_w, bank)			\
+		.drv_reg = DRV_PINGROUP_Y(r),			\
+		.drv_bank = bank,				\
+		.drvdn_bit = drvdn_b,				\
+		.drvdn_width = drvdn_w,				\
+		.drvup_bit = drvup_b,				\
+		.drvup_width = drvup_w,				\
+		.slwr_bit = slwr_b,				\
+		.slwr_width = slwr_w,				\
+		.slwf_bit = slwf_b,				\
+		.slwf_width = slwf_w
+
+#define PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk, e_input,	\
+			     e_od, schmitt_b, drvtype)		\
+		.mux_reg = ((r)),				\
+		.lpmd_bit = -1,					\
+		.lock_bit = -1,					\
+		.hsm_bit = -1,					\
+		.parked_bit = -1,				\
+		.mux_bank = bank,				\
+		.mux_bit = 0,					\
+		.pupd_reg = PINGROUP_REG_##pupd(r),		\
+		.pupd_bank = bank,				\
+		.pupd_bit = 2,					\
+		.tri_reg = ((r)),				\
+		.tri_bank = bank,				\
+		.tri_bit = 4,					\
+		.einput_bit = e_input,				\
+		.odrain_bit = e_od,				\
+		.schmitt_bit = schmitt_b,			\
+		.drvtype_bit = 13,				\
+		.drv_reg = -1
+
+#define drive_pex_l5_clkreq_n_pgg0				\
+	DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
+#define drive_pex_l5_rst_n_pgg1					\
+	DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
+
+#define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_lpbk,	\
+		 e_input, e_lpdr, e_od, schmitt_b, drvtype, io_rail)	\
+	{							\
+		.name = #pg_name,				\
+		.pins = pg_name##_pins,				\
+		.npins = ARRAY_SIZE(pg_name##_pins),		\
+			.funcs = {				\
+				TEGRA_MUX_##f0,			\
+				TEGRA_MUX_##f1,			\
+				TEGRA_MUX_##f2,			\
+				TEGRA_MUX_##f3,			\
+			},					\
+		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,	\
+				     e_input, e_od,		\
+				     schmitt_b, drvtype),	\
+		drive_##pg_name,				\
+	}
+
+static const struct tegra_pingroup tegra194_groups[] = {
+	PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, 0,
+		 Y, -1, 6, 8, 11, 12, N, "vddio_pex_ctl_2"),
+	PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
+		 Y, -1, 6, 8, 11, 12, N, "vddio_pex_ctl_2"),
+};
+
+static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
+	.ngpios = TEGRA_PIN_NUM_GPIOS,
+	.pins = tegra194_pins,
+	.npins = ARRAY_SIZE(tegra194_pins),
+	.functions = tegra194_functions,
+	.nfunctions = ARRAY_SIZE(tegra194_functions),
+	.groups = tegra194_groups,
+	.ngroups = ARRAY_SIZE(tegra194_groups),
+	.hsm_in_mux = true,
+	.schmitt_in_mux = true,
+	.drvtype_in_mux = true,
+};
+
+static int tegra194_pinctrl_probe(struct platform_device *pdev)
+{
+	return tegra_pinctrl_probe(pdev, &tegra194_pinctrl);
+}
+
+static const struct of_device_id tegra194_pinctrl_of_match[] = {
+	{ .compatible = "nvidia,tegra194-pinmux", },
+	{ },
+};
+
+static struct platform_driver tegra194_pinctrl_driver = {
+	.driver = {
+		.name = "tegra194-pinctrl",
+		.of_match_table = tegra194_pinctrl_of_match,
+	},
+	.probe = tegra194_pinctrl_probe,
+};
+
+static int __init tegra194_pinctrl_init(void)
+{
+	return platform_driver_register(&tegra194_pinctrl_driver);
+}
+arch_initcall(tegra194_pinctrl_init);
-- 
2.7.4

