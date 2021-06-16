Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1633A9BF7
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbhFPN3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 09:29:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2586 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233223AbhFPN3d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 09:29:33 -0400
X-IronPort-AV: E=Sophos;i="5.83,278,1616425200"; 
   d="scan'208";a="84546645"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Jun 2021 22:27:26 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D9B73423A668;
        Wed, 16 Jun 2021 22:27:24 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] pinctrl: renesas: Add pins/groups/functions for I2C, SCIF and USB supported by RZ/G2L SoC
Date:   Wed, 16 Jun 2021 14:26:41 +0100
Message-Id: <20210616132641.29087-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add pins/groups/functions for I2C, SCIF and USB supported by RZ/G2L SoC and
bind it with RZ/G2L PFC core.

Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/Kconfig         |   5 +
 drivers/pinctrl/renesas/Makefile        |   1 +
 drivers/pinctrl/renesas/pfc-r9a07g044.c | 362 ++++++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |   6 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.h |   2 +
 5 files changed, 376 insertions(+)
 create mode 100644 drivers/pinctrl/renesas/pfc-r9a07g044.c

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 2b4ac226ce35..dc7faa6eaeb1 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -37,6 +37,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_PFC_R8A77990 if ARCH_R8A77990
 	select PINCTRL_PFC_R8A77995 if ARCH_R8A77995
 	select PINCTRL_PFC_R8A779A0 if ARCH_R8A779A0
+	select PINCTRL_PFC_R9A07G044 if ARCH_R9A07G044
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
 	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
@@ -155,6 +156,10 @@ config PINCTRL_PFC_R8A73A4
 	bool "pin control support for R-Mobile APE6" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 
+config PINCTRL_PFC_R9A07G044
+	bool "pin control support for RZ/G2L" if COMPILE_TEST
+	select PINCTRL_RZG2L
+
 config PINCTRL_RZA1
 	bool "pin control support for RZ/A1"
 	depends on OF
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index 7d9238a9ef57..2ea5fa3a7769 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_PINCTRL_PFC_R8A77980)	+= pfc-r8a77980.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77990)	+= pfc-r8a77990.o
 obj-$(CONFIG_PINCTRL_PFC_R8A77995)	+= pfc-r8a77995.o
 obj-$(CONFIG_PINCTRL_PFC_R8A779A0)	+= pfc-r8a779a0.o
+obj-$(CONFIG_PINCTRL_PFC_R9A07G044)	+= pfc-r9a07g044.o
 obj-$(CONFIG_PINCTRL_PFC_SH7203)	+= pfc-sh7203.o
 obj-$(CONFIG_PINCTRL_PFC_SH7264)	+= pfc-sh7264.o
 obj-$(CONFIG_PINCTRL_PFC_SH7269)	+= pfc-sh7269.o
diff --git a/drivers/pinctrl/renesas/pfc-r9a07g044.c b/drivers/pinctrl/renesas/pfc-r9a07g044.c
new file mode 100644
index 000000000000..3f2ef4f52173
--- /dev/null
+++ b/drivers/pinctrl/renesas/pfc-r9a07g044.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * R9A07G044 processor support - pinctrl GPIO hardware block.
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include "pinctrl-rzg2l.h"
+
+#define RZG2L_GPIO_PIN_CONF	(0)
+
+static const struct {
+	struct pinctrl_pin_desc pin_gpio[392];
+} pinmux_pins = {
+	.pin_gpio = {
+		RZ_G2L_PINCTRL_PIN_GPIO(0, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(1, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(2, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(3, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(4, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(5, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(6, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(7, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(8, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(9, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(10, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(11, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(12, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(13, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(14, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(15, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(16, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(17, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(18, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(19, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(20, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(21, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(22, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(23, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(24, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(25, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(26, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(27, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(28, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(29, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(30, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(31, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(32, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(33, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(34, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(35, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(36, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(37, 0),
+		RZ_G2L_PINCTRL_PIN_GPIO(38, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(39, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(40, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(41, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(42, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(43, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(44, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(45, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(46, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(47, RZG2L_GPIO_PIN_CONF),
+		RZ_G2L_PINCTRL_PIN_GPIO(48, RZG2L_GPIO_PIN_CONF),
+	},
+};
+
+/* - RIIC2 ------------------------------------------------------------------ */
+static int i2c2_a_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(3, 0), RZ_G2L_PIN(3, 1),
+};
+static int i2c2_b_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(19, 0), RZ_G2L_PIN(19, 1),
+};
+static int i2c2_c_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(42, 3), RZ_G2L_PIN(42, 4),
+};
+static int i2c2_d_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(46, 0), RZ_G2L_PIN(46, 1),
+};
+static int i2c2_e_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(48, 0), RZ_G2L_PIN(48, 1),
+};
+/* - RIIC3 ------------------------------------------------------------------ */
+static int i2c3_a_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(8, 1), RZ_G2L_PIN(8, 0),
+};
+static int i2c3_b_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(18, 0), RZ_G2L_PIN(18, 1),
+};
+static int i2c3_c_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(46, 2), RZ_G2L_PIN(46, 3),
+};
+static int i2c3_d_pins[] = {
+	/* SDA, SCL */
+	RZ_G2L_PIN(48, 2), RZ_G2L_PIN(48, 3),
+};
+
+/* - SCIF0 ------------------------------------------------------------------ */
+static int scif0_clk_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(39, 0),
+};
+static int scif0_ctrl_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(39, 1), RZ_G2L_PIN(39, 2),
+};
+static int scif0_data_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(38, 0), RZ_G2L_PIN(38, 1),
+};
+/* - SCIF1 ------------------------------------------------------------------ */
+static int scif1_clk_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(40, 2),
+};
+static int scif1_ctrl_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(41, 0), RZ_G2L_PIN(41, 1),
+};
+static int scif1_data_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(40, 0), RZ_G2L_PIN(40, 1),
+};
+/* - SCIF2 ------------------------------------------------------------------ */
+static int scif2_clk_a_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(5, 0),
+};
+static int scif2_clk_b_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(17, 0),
+};
+static int scif2_clk_c_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(37, 0),
+};
+static int scif2_clk_d_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(42, 2),
+};
+static int scif2_clk_e_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(48, 2),
+};
+static int scif2_ctrl_a_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(5, 1), RZ_G2L_PIN(5, 2),
+};
+static int scif2_ctrl_b_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(17, 1), RZ_G2L_PIN(17, 2),
+};
+static int scif2_ctrl_c_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(37, 1), RZ_G2L_PIN(37, 2),
+};
+static int scif2_ctrl_d_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(42, 3), RZ_G2L_PIN(42, 4),
+};
+static int scif2_ctrl_e_pins[] = {
+	/* CTS, RTS */
+	RZ_G2L_PIN(48, 3), RZ_G2L_PIN(48, 4),
+};
+static int scif2_data_a_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(4, 0), RZ_G2L_PIN(4, 1),
+};
+static int scif2_data_b_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(16, 0), RZ_G2L_PIN(16, 1),
+};
+static int scif2_data_c_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(33, 0), RZ_G2L_PIN(33, 1),
+};
+static int scif2_data_d_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(42, 0), RZ_G2L_PIN(42, 1),
+};
+static int scif2_data_e_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(48, 0), RZ_G2L_PIN(48, 1),
+};
+/* - SCIF3 ------------------------------------------------------------------ */
+static int scif3_clk_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(1, 0),
+};
+static int scif3_data_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(0, 0), RZ_G2L_PIN(0, 1),
+};
+/* - SCIF4 ------------------------------------------------------------------ */
+static int scif4_clk_pins[] = {
+	/* SCK */
+	RZ_G2L_PIN(3, 0),
+};
+static int scif4_data_pins[] = {
+	/* TX, RX */
+	RZ_G2L_PIN(2, 0), RZ_G2L_PIN(2, 1),
+};
+
+/* - USB0 ------------------------------------------------------------------- */
+static int usb0_a_pins[] = {
+	/* VBUS, OVC */
+	RZ_G2L_PIN(4, 0), RZ_G2L_PIN(5, 0),
+};
+static int usb0_a_otg_exicen_pins[] = {
+	/* OTG_EXICEN */
+	RZ_G2L_PIN(5, 2),
+};
+static int usb0_a_otg_id_pins[] = {
+	/* OTG_ID */
+	RZ_G2L_PIN(5, 1),
+};
+static int usb0_b_pins[] = {
+	/* VBUS, OVC */
+	RZ_G2L_PIN(6, 0), RZ_G2L_PIN(7, 0),
+};
+static int usb0_b_otg_exicen_pins[] = {
+	/* OTG_EXICEN */
+	RZ_G2L_PIN(7, 2),
+};
+static int usb0_b_otg_id_pins[] = {
+	/* OTG_ID */
+	RZ_G2L_PIN(7, 1),
+};
+/* - USB1 ------------------------------------------------------------------- */
+static int usb1_a_pins[] = {
+	/* VBUS, OVC */
+	RZ_G2L_PIN(8, 0), RZ_G2L_PIN(8, 1),
+};
+static int usb1_b_pins[] = {
+	/* VBUS, OVC */
+	RZ_G2L_PIN(29, 0), RZ_G2L_PIN(29, 1),
+};
+static int usb1_c_pins[] = {
+	/* VBUS, OVC */
+	RZ_G2L_PIN(38, 0), RZ_G2L_PIN(38, 1),
+};
+static int usb1_d_pins[] = {
+	/* VBUS, OVC */
+	RZ_G2L_PIN(42, 0), RZ_G2L_PIN(42, 1),
+};
+
+static struct group_desc pinmux_groups[] = {
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c2_a, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c2_b, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c2_c, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c2_d, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c2_e, 3),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c3_a, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c3_b, 3),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c3_c, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(i2c3_d, 3),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif0_clk, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif0_ctrl, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif0_data, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif1_clk, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif1_ctrl, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif1_data, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_clk_a, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_clk_b, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_clk_c, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_clk_d, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_clk_e, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_ctrl_a, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_ctrl_b, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_ctrl_c, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_ctrl_d, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_ctrl_e, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_data_a, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_data_b, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_data_c, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_data_d, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif2_data_e, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif3_clk, 5),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif3_data, 5),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif4_clk, 5),
+	RZ_G2L_PINCTRL_PIN_GROUP(scif4_data, 5),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb0_a, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb0_a_otg_exicen, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb0_a_otg_id, 1),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb0_b, 3),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb0_b_otg_exicen, 3),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb0_b_otg_id, 3),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb1_a, 2),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb1_b, 4),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb1_c, 5),
+	RZ_G2L_PINCTRL_PIN_GROUP(usb1_d, 1),
+};
+
+static const char *i2c2_groups[] = {
+	"i2c2_a", "i2c2_b", "i2c2_c", "i2c2_d", "i2c2_e",
+};
+
+static const char *i2c3_groups[] = {
+	"i2c3_a", "i2c3_b", "i2c3_c", "i2c3_d",
+};
+
+static const char *scif0_groups[] = {
+	"scif0_clk", "scif0_ctrl", "scif0_data",
+};
+
+static const char *scif1_groups[] = {
+	"scif1_clk", "scif1_ctrl", "scif1_data",
+};
+
+static const char *scif2_groups[] = {
+	"scif2_clk_a", "scif2_clk_b", "scif2_clk_c", "scif2_clk_d", "scif2_clk_e",
+	"scif2_ctrl_a", "scif2_ctrl_b", "scif2_ctrl_c", "scif2_ctrl_d", "scif2_ctrl_e",
+	"scif2_data_a", "scif2_data_b", "scif2_data_c", "scif2_data_d", "scif2_data_e",
+};
+
+static const char *scif3_groups[] = {
+	"scif3_clk", "scif3_data",
+};
+
+static const char *scif4_groups[] = {
+	"scif4_clk", "scif4_data",
+};
+
+static const char *usb0_groups[] = {
+	"usb0_a", "usb0_a_otg_exicen", "usb0_a_otg_id",
+	"usb0_b", "usb0_b_otg_exicen", "usb0_b_otg_id",
+};
+
+static const char *usb1_groups[] = {
+	"usb1_a", "usb1_b", "usb1_c", "usb1_d",
+};
+
+static const struct function_desc pinmux_functions[] = {
+	RZ_G2L_FN_DESC(i2c2),
+	RZ_G2L_FN_DESC(i2c3),
+	RZ_G2L_FN_DESC(scif0),
+	RZ_G2L_FN_DESC(scif1),
+	RZ_G2L_FN_DESC(scif2),
+	RZ_G2L_FN_DESC(scif3),
+	RZ_G2L_FN_DESC(scif4),
+	RZ_G2L_FN_DESC(usb0),
+	RZ_G2L_FN_DESC(usb1),
+};
+
+const struct rzg2l_pin_soc r9a07g044_pinctrl_data = {
+	.pins = pinmux_pins.pin_gpio,
+	.npins = ARRAY_SIZE(pinmux_pins.pin_gpio),
+	.groups = pinmux_groups,
+	.ngroups = ARRAY_SIZE(pinmux_groups),
+	.funcs = pinmux_functions,
+	.nfuncs = ARRAY_SIZE(pinmux_functions),
+	.nports = ARRAY_SIZE(pinmux_pins.pin_gpio) / RZG2L_MAX_PINS_PER_PORT,
+};
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index b9730b53fd85..a1d67409c649 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -512,6 +512,12 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzg2l_pinctrl_of_table[] = {
+#ifdef CONFIG_PINCTRL_PFC_R9A07G044
+	{
+		.compatible = "renesas,r9a07g044-pinctrl",
+		.data = &r9a07g044_pinctrl_data,
+	},
+#endif
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.h b/drivers/pinctrl/renesas/pinctrl-rzg2l.h
index 39135e5bc04e..c6f178c8d916 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.h
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.h
@@ -91,4 +91,6 @@ struct rzg2l_pin_soc {
 
 #define RZ_G2L_FN_DESC(id)	{ #id, id##_groups, ARRAY_SIZE(id##_groups) }
 
+extern const struct rzg2l_pin_soc r9a07g044_pinctrl_data;
+
 #endif
-- 
2.17.1

