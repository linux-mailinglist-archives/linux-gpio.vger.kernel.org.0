Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1832DE1A25
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391341AbfJWMaA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 08:30:00 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37370 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391336AbfJWMaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 08:30:00 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id H0Vy2100b05gfCL060VysK; Wed, 23 Oct 2019 14:29:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0000pA-KE; Wed, 23 Oct 2019 14:29:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0003FE-JD; Wed, 23 Oct 2019 14:29:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] pinctrl: sh-pfc: r8a7796: Add R8A77961 PFC support
Date:   Wed, 23 Oct 2019 14:29:55 +0200
Message-Id: <20191023122955.12420-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122955.12420-1-geert+renesas@glider.be>
References: <20191023122955.12420-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the Pin Function Controller in the R-Car M3-W+
(R8A77961) SoC.

R-Car M3-W+ is pin compatible with R-Car M3-W (R8A77960), which allows
for both SoCs to share a driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by, Tested-by,
  - Move r8a7796_pinmux_info rename to a prerequisite patch.
---
 drivers/pinctrl/sh-pfc/Kconfig       |  4 ++++
 drivers/pinctrl/sh-pfc/Makefile      |  1 +
 drivers/pinctrl/sh-pfc/core.c        |  6 ++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 29 +++++++++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  1 +
 5 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 93d6034be4ff63f2..28d66e7cb098863b 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -28,6 +28,7 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
 	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
 	select PINCTRL_PFC_R8A77960 if ARCH_R8A77960 || ARCH_R8A7796
+	select PINCTRL_PFC_R8A77961 if ARCH_R8A77961
 	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
 	select PINCTRL_PFC_R8A77970 if ARCH_R8A77970
 	select PINCTRL_PFC_R8A77980 if ARCH_R8A77980
@@ -120,6 +121,9 @@ config PINCTRL_PFC_R8A7795
 config PINCTRL_PFC_R8A77960
 	bool "R-Car M3-W pin control support" if COMPILE_TEST
 
+config PINCTRL_PFC_R8A77961
+	bool "R-Car M3-W+ pin control support" if COMPILE_TEST
+
 config PINCTRL_PFC_R8A77965
 	bool "R-Car M3-N pin control support" if COMPILE_TEST
 
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index e3594cd2620386af..3bc05666e1a6652e 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7794)	+= pfc-r8a7794.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795-es1.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77960)	+= pfc-r8a7796.o
+obj-$(CONFIG_PINCTRL_PFC_R8A77961)	+= pfc-r8a7796.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77965)	+= pfc-r8a77965.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77970)	+= pfc-r8a77970.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77980)	+= pfc-r8a77980.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index e3292abd6c9456f8..2959623e9b724f40 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -591,6 +591,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a77960_pinmux_info,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_PFC_R8A77961
+	{
+		.compatible = "renesas,pfc-r8a77961",
+		.data = &r8a77961_pinmux_info,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_PFC_R8A77965
 	{
 		.compatible = "renesas,pfc-r8a77965",
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 9de2909c7ad9dff0..a2496baca85d23f8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R8A7796 processor support - PFC hardware block.
+ * R8A7796 (R-Car M3-W/W+) support - PFC hardware block.
  *
  * Copyright (C) 2016-2019 Renesas Electronics Corp.
  *
@@ -6236,3 +6236,30 @@ const struct sh_pfc_soc_info r8a77960_pinmux_info = {
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
 };
 #endif
+
+#ifdef CONFIG_PINCTRL_PFC_R8A77961
+const struct sh_pfc_soc_info r8a77961_pinmux_info = {
+	.name = "r8a77961_pfc",
+	.ops = &r8a7796_pinmux_ops,
+	.unlock_reg = 0xe6060000, /* PMMR */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
+		ARRAY_SIZE(pinmux_groups.automotive),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
+		ARRAY_SIZE(pinmux_functions.automotive),
+
+	.cfg_regs = pinmux_config_regs,
+	.drive_regs = pinmux_drive_regs,
+	.bias_regs = pinmux_bias_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
+#endif
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index a7eb527fdc60ae25..640d2a4cb838804f 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -321,6 +321,7 @@ extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7795es1_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77970_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77980_pinmux_info;
-- 
2.17.1

