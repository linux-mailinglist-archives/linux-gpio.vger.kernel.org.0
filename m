Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3728DB9D5D
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 12:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437623AbfIUKMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Sep 2019 06:12:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39449 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407500AbfIUKMa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Sep 2019 06:12:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id v17so4484584wml.4;
        Sat, 21 Sep 2019 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5V+1l0jDCq75nx2hkGP7XmYDBgcHjuToKHa8Xh/qfpw=;
        b=tHkts9RmDfIir1dI/ZwfMBzRgr2nOMidRZR2n98tps5VKX1lDwdIiEbiTqzJE+nvb9
         Uvvcd0vACTdIrzZhdL/7FHHNzCEJLovSSYUwgTaxL+uwo0M3fBgDrMRYkzOxVDmhQ80f
         JnR3CzUjOsOCCxaky4Wv+lJiSbsROTrv5O00QTz0JZtZTTofYqq6PaqRGu0sfymMNpv8
         wF25UZZaYP23fXXIgMZOczG4sGfTW53zQ6CxtgTUcXOADVWybxI/YEhhL7WmfntIwp+m
         tPb5ZKMcJFyQHb7+AUfdYgp6okOgcZE2n8uCDVzZBT42kItrX3915StGifcQZtIEjsS+
         CMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5V+1l0jDCq75nx2hkGP7XmYDBgcHjuToKHa8Xh/qfpw=;
        b=bFGs6E2oJFbUk+yPEypppcoLCV8qu3s/vEg4y3GZKhyxh2CAQ4Xk8kix3wSWqQcbUB
         jkAwNqCWGueCssO44rd3kRbquw0ZAFjjRi99lXgr+1qIBdUB4zAcgBRqeDzFuoXBsxzR
         IykTIBunzjM5qe5dykTsTP7I0zO923RL8PtuSl+oX5X/dcWgrsKQ5UEGwoZr+Mxll+kx
         lyoWr7gNQF1gBJ7y3k9Omj3pPAEtc/WOn9xkgNbb0jtZAw8M5437NpcfsLEI78c7/SW/
         DdTrzK5rzq55Y5e0r54nWcSITfaXkD6yWdiYl5SohQeuzUiSG4d8I9XyLgc20+0GE871
         +yOg==
X-Gm-Message-State: APjAAAVvtMITQC6l0pQxMSLFSunuXgIZPJVJAG374PKPrO1OBY73sagz
        prg34R4AJng8oN2TPDgNyXOg41lYYHI=
X-Google-Smtp-Source: APXvYqzedWO8BSI4hMqS/vfmlLiHujaadgoV9ChYFWhT/i9jcX1exRepimIgOIhYDq70Kj37hC9wJg==
X-Received: by 2002:a1c:4d0e:: with SMTP id o14mr2551268wmh.172.1569060739858;
        Sat, 21 Sep 2019 03:12:19 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id l1sm6129262wrb.1.2019.09.21.03.12.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:12:19 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/5] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
Date:   Sat, 21 Sep 2019 12:12:04 +0200
Message-Id: <20190921101207.65042-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921101207.65042-1-kholk11@gmail.com>
References: <20190921101207.65042-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Add support for the global clock controller found on MSM8976
and MSM8976 SoCs.
Since the multimedia clocks are actually in the GCC on these
SoCs, this will allow drivers to probe and control basically
all the required clocks.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8976.c                | 4215 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8976.h  |  293 ++
 5 files changed, 4518 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8976.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
index 8661c3cd3ccf..b4abf62a3f6b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
@@ -15,6 +15,7 @@ Required properties :
 			"qcom,gcc-msm8974"
 			"qcom,gcc-msm8974pro"
 			"qcom,gcc-msm8974pro-ac"
+			"qcom,gcc-msm8976"
 			"qcom,gcc-msm8994"
 			"qcom,gcc-msm8996"
 			"qcom,gcc-msm8998"
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..1cbc6697231f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -190,6 +190,14 @@ config MSM_MMCC_8974
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
 
+config MSM_GCC_8976
+	tristate "MSM8956/76 Global Clock Controller"
+	select QCOM_GDSC
+	help
+	  Support for the global clock controller on msm8956/76 devices.
+	  Say Y if you want to use peripheral devices such as UART, SPI,
+	  i2c, USB, SD/eMMC, display, graphics, camera etc.
+
 config MSM_GCC_8994
 	tristate "MSM8994 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index f0768fb1f037..5387a72d90c8 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
 obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
 obj-$(CONFIG_MSM_GCC_8960) += gcc-msm8960.o
 obj-$(CONFIG_MSM_GCC_8974) += gcc-msm8974.o
+obj-$(CONFIG_MSM_GCC_8976) += gcc-msm8976.o
 obj-$(CONFIG_MSM_GCC_8994) += gcc-msm8994.o
 obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
 obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
diff --git a/drivers/clk/qcom/gcc-msm8976.c b/drivers/clk/qcom/gcc-msm8976.c
new file mode 100644
index 000000000000..9f9d6b3f0640
--- /dev/null
+++ b/drivers/clk/qcom/gcc-msm8976.c
@@ -0,0 +1,4215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Qualcomm Global Clock Controller driver for MSM8956/76
+ *
+ * Copyright (C) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2018, AngeloGioacchino Del Regno <kholk11@gmail.com>
+ *
+ * Author: AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/bitops.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <dt-bindings/clock/qcom,gcc-msm8976.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "common.h"
+#include "clk-pll.h"
+#include "clk-regmap.h"
+#include "clk-rcg.h"
+#include "reset.h"
+#include "gdsc.h"
+
+#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
+
+enum {
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_AUX,
+	P_GPLL0_AUX_ESC,
+	P_GPLL0_OUT,
+	P_GPLL0_OUT_M,
+	P_GPLL0_OUT_MDP,
+	P_GPLL2_OUT_MAIN,
+	P_GPLL2_AUX,
+	P_GPLL2_OUT,
+	P_GPLL3_OUT_MAIN,
+	P_GPLL4_OUT_MAIN,
+	P_GPLL4_AUX,
+	P_GPLL4_OUT,
+	P_GPLL4_GFX3D,
+	P_GPLL6_OUT_MAIN,
+	P_GPLL6_AUX,
+	P_GPLL6_OUT,
+	P_GPLL6_GFX3D,
+	P_DSI0PLL,
+	P_DSI1PLL,
+	P_DSI0PLL_BYTE,
+	P_DSI1PLL_BYTE,
+	P_DSI0PLL_BYTE_MUX,
+	P_DSI1PLL_BYTE_MUX,
+	P_BIMC,
+	P_SLEEP_CLK,
+	P_XO_A,
+	P_XO,
+};
+
+
+/* MSM8956/76 - for SDCC1 */
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT, 2 },
+};
+
+static const char * const gcc_parent_names_1[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+};
+
+static const struct parent_map gcc_parent_map_v1_1[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_OUT, 4 },
+};
+
+static const char * const gcc_parent_names_v1_1[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll2_vote",
+};
+
+static const struct parent_map gcc_parent_map_2[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_AUX, 3 },
+	{ P_GPLL4_OUT, 2 },
+};
+
+static const char * const gcc_parent_names_2[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll2_vote",
+	"gpll4_vote",
+};
+
+static const struct parent_map gcc_parent_map_3[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL2_AUX, 3 },
+	{ P_GPLL6_AUX, 2 },
+};
+
+static const char * const gcc_parent_names_3[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll2_vote",
+	"gpll6_vote",
+};
+
+static const struct parent_map gcc_parent_map_4[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const struct parent_map gcc_parent_map_4_fs[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT, 2 },
+};
+
+static const char * const gcc_parent_names_4[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_5[] = {
+	{ P_XO, 0},
+	{ P_GPLL4_OUT, 2 },
+	{ P_GPLL6_OUT_MAIN, 1 },
+};
+
+static const char * const gcc_parent_names_5[] = {
+	"xo",
+	"gpll4_vote",
+	"gpll6_vote",
+};
+
+static const struct parent_map gcc_parent_map_6[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_OUT_MAIN, 5 },
+};
+
+static const char * const gcc_parent_names_6[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+};
+
+static const struct parent_map gcc_parent_map_7_mdp[] = {
+	{ P_XO, 0},
+	{ P_GPLL6_OUT, 3 },
+	{ P_GPLL0_OUT_MDP, 6 },
+};
+
+static const char * const gcc_parent_names_7_mdp[] = {
+	"xo",
+	"gpll6_vote",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_7[] = {
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL6_OUT, 3 },
+};
+
+static const char * const gcc_parent_names_7[] = {
+	"gpll0_vote",
+	"gpll6_vote",
+};
+
+static const struct parent_map gcc_parent_map_8[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const char * const gcc_parent_names_8[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_8_a[] = {
+	{ P_XO_A, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const char * const gcc_parent_names_8_a[] = {
+	"xo_a",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_8_gp[] = {
+	{ P_GPLL0_OUT_MAIN, 1 },
+};
+
+static const char * const gcc_parent_names_8_gp[] = {
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_9[] = {
+	{ P_XO, 0},
+	{ P_GPLL6_OUT_MAIN, 6 },
+};
+
+static const char * const gcc_parent_names_9[] = {
+	"xo",
+	"gpll6_vote",
+};
+
+static const struct parent_map gcc_parent_map_10[] = {
+	{ P_XO, 0 },
+};
+
+static const char * const gcc_parent_names_10[] = {
+	"xo",
+};
+
+static const struct parent_map gcc_parent_map_sdcc_ice[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_M, 3 },
+};
+
+static const char * const gcc_parent_names_sdcc_ice[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_cci[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_AUX, 2 },
+};
+
+static const char * const gcc_parent_names_cci[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_parent_map_cpp[] = {
+	{ P_XO, 0},
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_AUX, 3 },
+};
+
+static const char * const gcc_parent_names_cpp[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+};
+
+static const struct parent_map gcc_parent_map_mdss_pix0[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL, 1 },
+};
+static const char * const gcc_parent_names_mdss_pix0[] = {
+	"xo",
+	"dsi0pll",
+};
+
+static const struct parent_map gcc_parent_map_mdss_pix1[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL, 3 },
+	{ P_DSI1PLL, 1 },
+};
+
+static const char * const gcc_parent_names_mdss_pix1[] = {
+	"xo",
+	"dsi0pll",
+	"dsi1pll",
+};
+
+static const struct parent_map gcc_parent_map_mdss_byte0[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL_BYTE, 1 },
+};
+
+static const char * const gcc_parent_names_mdss_byte0[] = {
+	"xo",
+	"dsi0pllbyte",
+};
+
+static const struct parent_map gcc_parent_map_mdss_byte1[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL_BYTE, 3 },
+	{ P_DSI1PLL_BYTE, 1 },
+};
+
+static const char * const gcc_parent_names_mdss_byte1[] = {
+	"xo",
+	"dsi0pllbyte",
+	"dsi1pllbyte",
+};
+
+static const struct parent_map gcc_parent_map_gfx3d[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0_OUT_MAIN, 1 },
+	{ P_GPLL4_GFX3D, 5 },
+	{ P_GPLL6_GFX3D, 3 },
+};
+
+static const char * const gcc_parent_names_gfx3d[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+	"gpll6_vote",
+};
+
+static struct clk_fixed_factor xo = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "xo",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_fixed_factor xo_a = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "xo_a",
+		.parent_names = (const char *[]){ "cxo_a" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_pll gpll0 = {
+	.l_reg = 0x21004,
+	.m_reg = 0x21008,
+	.n_reg = 0x2100c,
+	.config_reg = 0x21014,
+	.mode_reg = 0x21000,
+	.status_reg = 0x2101c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll0_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll0_vote",
+		.parent_names = (const char *[]){ "gpll0" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll2 = {
+	.l_reg = 0x4A004,
+	.m_reg = 0x4A008,
+	.n_reg = 0x4A00c,
+	.config_reg = 0x4A014,
+	.mode_reg = 0x4A000,
+	.status_reg = 0x4A01c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll2",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll2_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(2),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll2_vote",
+		.parent_names = (const char *[]){ "gpll2" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+#define F_GPLL(f, l, m, n) { (f), (l), (m), (n), 0 }
+
+static struct pll_freq_tbl gpll3_freq_tbl[] = {
+	F_GPLL(1100000000, 57, 7, 24),
+};
+
+static struct clk_pll gpll3 = {
+	.l_reg		= 0x22004,
+	.m_reg		= 0x22008,
+	.n_reg		= 0x2200c,
+	.config_reg	= 0x22010,
+	.mode_reg	= 0x22000,
+	.status_reg	= 0x22024,
+	.status_bit	= 17,
+	.freq_tbl	= gpll3_freq_tbl,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "gpll3",
+		.parent_names = (const char*[]) { "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll3_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll3_vote",
+		.parent_names = (const char *[]){ "gpll3" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+/* GPLL3 at 1100MHz, main output enabled. */
+static struct pll_config gpll3_config = {
+	.l = 57,
+	.m = 7,
+	.n = 24,
+	.vco_val = 0x0,
+	.vco_mask = 0x3 << 20,
+	.pre_div_val = 0x0,
+	.pre_div_mask = 0x7 << 12,
+	.post_div_val = 0x0,
+	.post_div_mask = 0x3 << 8,
+	.mn_ena_mask = BIT(24),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+};
+
+static struct clk_pll gpll4 = {
+	.l_reg = 0x24004,
+	.m_reg = 0x24008,
+	.n_reg = 0x2400c,
+	.config_reg = 0x24018,
+	.mode_reg = 0x24000,
+	.status_reg = 0x24024,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll4_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(5),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll4_vote",
+		.parent_names = (const char *[]){ "gpll4" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll6 = {
+	.mode_reg = 0x37000,
+	.l_reg = 0x37004,
+	.m_reg = 0x37008,
+	.n_reg = 0x3700c,
+	.config_reg = 0x37014,
+	.status_reg = 0x3701c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll6_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(7),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_vote",
+		.parent_names = (const char *[]){ "gpll6" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_aps_0_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(300000000, P_GPLL4_OUT, 4, 0, 0),
+	F(540000000, P_GPLL6_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 aps_0_clk_src = {
+	.cmd_rcgr = 0x78008,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_aps_0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "aps_0_clk_src",
+		.parent_names = gcc_parent_names_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_aps_1_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(300000000, P_GPLL4_OUT, 4, 0, 0),
+	F(540000000, P_GPLL6_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 aps_1_clk_src = {
+	.cmd_rcgr = 0x79008,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_5,
+	.freq_tbl = ftbl_aps_1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "aps_1_clk_src",
+		.parent_names = gcc_parent_names_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_5),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
+	F(19200000, P_XO_A, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(88890000, P_GPLL0_OUT_MAIN, 9, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apss_ahb_clk_src = {
+	.cmd_rcgr = 0x46000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8_a,
+	.freq_tbl = ftbl_apss_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apss_ahb_clk_src",
+		.parent_names = gcc_parent_names_8_a,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8_a),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0200C,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup1_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
+	F(19200000, P_XO, 1, 0, 0),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x02024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup1_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x03000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup2_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x03014,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup2_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x04000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup3_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x04024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup3_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x05000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup4_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x05024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup4_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_blsp_uart_apps_clk_src[] = {
+	F(3686400, P_GPLL0_OUT_MAIN, 1, 72, 15625),
+	F(7372800, P_GPLL0_OUT_MAIN, 1, 144, 15625),
+	F(14745600, P_GPLL0_OUT_MAIN, 1, 288, 15625),
+	F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0_OUT_MAIN, 1, 3, 100),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
+	F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
+	F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 500),
+	F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
+	F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
+	F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
+	F(58982400, P_GPLL0_OUT_MAIN, 1, 1152, 15625),
+	F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
+	F(64000000, P_GPLL0_OUT_MAIN, 1, 2, 25),
+	{ }
+};
+
+static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x02044,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart1_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x03034,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_uart2_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0C00C,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup1_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0C024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup1_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0D000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup2_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0D014,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup2_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0F000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup3_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
+	.cmd_rcgr = 0x0F024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup3_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x18000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup4_i2c_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x18024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup4_spi_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
+	.cmd_rcgr = 0x0C044,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_uart1_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
+	.cmd_rcgr = 0x0D034,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_blsp_uart_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_uart2_apps_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cci_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(37500000, P_GPLL0_AUX, 1, 3, 64),
+	{ }
+};
+
+static struct clk_rcg2 cci_clk_src = {
+	.cmd_rcgr = 0x51000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_cci,
+	.freq_tbl = ftbl_cci_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cci_clk_src",
+		.parent_names = gcc_parent_names_cci,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_cci),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cpp_clk_src[] = {
+	F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(240000000, P_GPLL4_AUX, 5, 0, 0),
+	F(320000000, P_GPLL0_OUT_MAIN, 2.5,    0,     0),
+	F(400000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(480000000, P_GPLL4_AUX, 2.5,    0,     0),
+	{ }
+};
+
+static struct clk_rcg2 cpp_clk_src = {
+	.cmd_rcgr = 0x58018,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_cpp,
+	.freq_tbl = ftbl_cpp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "cpp_clk_src",
+		.parent_names = gcc_parent_names_cpp,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_cpp),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_csi0_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi0_clk_src = {
+	.cmd_rcgr = 0x4E020,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_csi0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "csi0_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_csi1_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi1_clk_src = {
+	.cmd_rcgr = 0x4F020,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_csi1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "csi1_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_csi2_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi2_clk_src = {
+	.cmd_rcgr = 0x3C020,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_csi2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "csi2_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_camss_gp0_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 camss_gp0_clk_src = {
+	.cmd_rcgr = 0x54000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8_gp,
+	.freq_tbl = ftbl_camss_gp0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "camss_gp0_clk_src",
+		.parent_names = gcc_parent_names_8_gp,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8_gp),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_camss_gp1_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 camss_gp1_clk_src = {
+	.cmd_rcgr = 0x55000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8_gp,
+	.freq_tbl = ftbl_camss_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "camss_gp1_clk_src",
+		.parent_names = gcc_parent_names_8_gp,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8_gp),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_jpeg0_clk_src[] = {
+	F(133330000, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(320000000, P_GPLL0_OUT_MAIN, 2.5,    0,     0),
+	{ }
+};
+
+static struct clk_rcg2 jpeg0_clk_src = {
+	.cmd_rcgr = 0x57000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_6,
+	.freq_tbl = ftbl_jpeg0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "jpeg0_clk_src",
+		.parent_names = gcc_parent_names_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_6),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mclk_clk_src[] = {
+	F(8000000, P_GPLL0_OUT_MAIN, 1, 1, 100),
+	F(24000000, P_GPLL6_OUT, 1, 1, 45),
+	F(66670000, P_GPLL0_OUT_MAIN, 12, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mclk0_clk_src = {
+	.cmd_rcgr = 0x52000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_mclk_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mclk0_clk_src",
+		.parent_names = gcc_parent_names_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 mclk1_clk_src = {
+	.cmd_rcgr = 0x53000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_mclk_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mclk1_clk_src",
+		.parent_names = gcc_parent_names_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 mclk2_clk_src = {
+	.cmd_rcgr = 0x5C000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7,
+	.freq_tbl = ftbl_mclk_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mclk2_clk_src",
+		.parent_names = gcc_parent_names_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_7),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_csi0phytimer_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x4E000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_csi0phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "csi0phytimer_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_csi1phytimer_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x4F000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_csi1phytimer_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "csi1phytimer_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_camss_top_ahb_clk_src[] = {
+	F(40000000, P_GPLL0_OUT_MAIN, 10, 1, 2),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 camss_top_ahb_clk_src = {
+	.cmd_rcgr = 0x5A000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_camss_top_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "camss_top_ahb_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_vfe0_clk_src[] = {
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5,    0,     0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL4_OUT, 4, 0, 0),
+	F(320000000, P_GPLL0_OUT_MAIN, 2.5,    0,     0),
+	F(466000000, P_GPLL2_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vfe0_clk_src = {
+	.cmd_rcgr = 0x58000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_vfe0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "vfe0_clk_src",
+		.parent_names = gcc_parent_names_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_vfe1_clk_src[] = {
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5,    0,     0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL4_OUT, 4, 0, 0),
+	F(320000000, P_GPLL0_OUT_MAIN, 2.5,    0,     0),
+	F(466000000, P_GPLL2_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vfe1_clk_src = {
+	.cmd_rcgr = 0x58054,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_2,
+	.freq_tbl = ftbl_vfe1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "vfe1_clk_src",
+		.parent_names = gcc_parent_names_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_crypto_clk_src[] = {
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 crypto_clk_src = {
+	.cmd_rcgr = 0x16004,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_crypto_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "crypto_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gp1_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp1_clk_src = {
+	.cmd_rcgr = 0x08004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gp1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp1_clk_src",
+		.parent_names = gcc_parent_names_10,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gp2_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp2_clk_src = {
+	.cmd_rcgr = 0x09004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gp2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp2_clk_src",
+		.parent_names = gcc_parent_names_10,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gp3_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gp3_clk_src = {
+	.cmd_rcgr = 0x0A004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_gp3_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gp3_clk_src",
+		.parent_names = gcc_parent_names_10,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 byte0_clk_src = {
+	.cmd_rcgr = 0x4D044,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_mdss_byte0,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "byte0_clk_src",
+		.parent_names = gcc_parent_names_mdss_byte0,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_mdss_byte0),
+		.ops = &clk_byte2_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_rcg2 byte1_clk_src = {
+	.cmd_rcgr = 0x4D0B0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_mdss_byte1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "byte1_clk_src",
+		.parent_names = gcc_parent_names_mdss_byte1,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_mdss_byte1),
+		.ops = &clk_byte2_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static const struct freq_tbl ftbl_esc0_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 esc0_clk_src = {
+	.cmd_rcgr = 0x4D05C,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_esc0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "esc0_clk_src",
+		.parent_names = gcc_parent_names_10,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static const struct freq_tbl ftbl_esc1_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 esc1_clk_src = {
+	.cmd_rcgr = 0x4D0A8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_esc1_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "esc1_clk_src",
+		.parent_names = gcc_parent_names_10,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_mdp_clk_src[] = {
+	F(50000000, P_GPLL0_OUT_MDP, 16, 0, 0),
+	F(80000000, P_GPLL0_OUT_MDP, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MDP, 8, 0, 0),
+	F(145454545, P_GPLL0_OUT_MDP, 5.5,    0,     0),
+	F(160000000, P_GPLL0_OUT_MDP, 5, 0, 0),
+	F(177777778, P_GPLL0_OUT_MDP, 4.5,    0,     0),
+	F(200000000, P_GPLL0_OUT_MDP, 4, 0, 0),
+	F(270000000, P_GPLL6_OUT, 4, 0, 0),
+	F(320000000, P_GPLL0_OUT_MDP, 2.5,    0,     0),
+	F(360000000, P_GPLL6_OUT, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 mdp_clk_src = {
+	.cmd_rcgr = 0x4D014,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_7_mdp,
+	.freq_tbl = ftbl_mdp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mdp_clk_src",
+		.parent_names = gcc_parent_names_7_mdp,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_7_mdp),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 pclk0_clk_src = {
+	.cmd_rcgr = 0x4D000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_mdss_pix0,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pclk0_clk_src",
+		.parent_names = gcc_parent_names_mdss_pix0,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_mdss_pix0),
+		.ops = &clk_pixel_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_rcg2 pclk1_clk_src = {
+	.cmd_rcgr = 0x4D0B8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_mdss_pix1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pclk1_clk_src",
+		.parent_names = gcc_parent_names_mdss_pix1,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_mdss_pix1),
+		.ops = &clk_pixel_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static const struct freq_tbl ftbl_vsync_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vsync_clk_src = {
+	.cmd_rcgr = 0x4D02C,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_10,
+	.freq_tbl = ftbl_vsync_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "vsync_clk_src",
+		.parent_names = gcc_parent_names_10,
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(228571429, P_GPLL0_OUT_MAIN, 3.5,    0,     0),
+	F(240000000, P_GPLL6_GFX3D, 4.5,    0,     0),
+	F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL4_GFX3D, 4, 0, 0),
+	F(360000000, P_GPLL6_GFX3D, 3, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(432000000, P_GPLL6_GFX3D, 2.5,    0,     0),
+	F(480000000, P_GPLL4_GFX3D, 2.5,    0,     0),
+	F(540000000, P_GPLL6_GFX3D, 2, 0, 0),
+	F(600000000, P_GPLL4_GFX3D, 2, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gfx3d_clk_params = {
+	.name = "gfx3d_clk_src",
+	.parent_names = gcc_parent_names_gfx3d,
+	.num_parents = ARRAY_SIZE(gcc_parent_names_gfx3d),
+	.ops = &clk_rcg2_ops,
+};
+
+static struct clk_rcg2 gfx3d_clk_src = {
+	.cmd_rcgr = 0x59000,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_gfx3d,
+	.freq_tbl = ftbl_gfx3d_clk_src,
+	.clkr.hw.init = &gfx3d_clk_params,
+};
+
+static const struct freq_tbl ftbl_pdm2_clk_src[] = {
+	F(64000000, P_GPLL0_OUT_MAIN, 12.5,    0,     0),
+	{ }
+};
+
+static struct clk_rcg2 pdm2_clk_src = {
+	.cmd_rcgr = 0x44010,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_pdm2_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pdm2_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_rbcpr_gfx_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 rbcpr_gfx_clk_src = {
+	.cmd_rcgr = 0x3A00C,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_8,
+	.freq_tbl = ftbl_rbcpr_gfx_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "rbcpr_gfx_clk_src",
+		.parent_names = gcc_parent_names_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc1_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0_OUT_MAIN, 10, 1, 4),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5,    0,     0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(342850000, P_GPLL4_OUT, 3.5,    0,     0),
+	F(400000000, P_GPLL4_OUT, 3, 0, 0),
+	{ }
+};
+
+static const struct freq_tbl ftbl_sdcc1_v1_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0_OUT_MAIN, 10, 1, 4),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5,    0,     0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	F(186400000, P_GPLL2_OUT, 5, 0, 0),
+	F(372800000, P_GPLL2_OUT, 2.5,    0,     0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_apps_clk_src = {
+	.cmd_rcgr = 0x42004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_sdcc1_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc1_apps_clk_src",
+		.parent_names = gcc_parent_names_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc1_ice_core_clk_src[] = {
+	F(100000000, P_GPLL0_OUT_M, 8, 0, 0),
+	F(200000000, P_GPLL0_OUT_M, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc1_ice_core_clk_src = {
+	.cmd_rcgr = 0x5D000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_sdcc_ice,
+	.freq_tbl = ftbl_sdcc1_ice_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc1_ice_core_clk_src",
+		.parent_names = gcc_parent_names_sdcc_ice,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_sdcc_ice),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_sdcc2_4_apps_clk_src[] = {
+	F(144000, P_XO, 16, 3, 25),
+	F(400000, P_XO, 12, 1, 4),
+	F(20000000, P_GPLL0_OUT_MAIN, 10, 1, 4),
+	F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
+	F(40000000, P_GPLL0_OUT_MAIN, 10, 1, 2),
+	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(177777778, P_GPLL0_OUT_MAIN, 4.5,    0,     0),
+	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 sdcc2_apps_clk_src = {
+	.cmd_rcgr = 0x43004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc2_apps_clk_src",
+		.parent_names = gcc_parent_names_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 sdcc3_apps_clk_src = {
+	.cmd_rcgr = 0x39004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_sdcc2_4_apps_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "sdcc3_apps_clk_src",
+		.parent_names = gcc_parent_names_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_fs_ic_clk_src[] = {
+	F(60000000, P_GPLL6_OUT_MAIN, 6, 1, 3),
+	{ }
+};
+
+static struct clk_rcg2 usb_fs_ic_clk_src = {
+	.cmd_rcgr = 0x3F034,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_9,
+	.freq_tbl = ftbl_usb_fs_ic_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb_fs_ic_clk_src",
+		.parent_names = gcc_parent_names_9,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_9),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_fs_system_clk_src[] = {
+	F(64000000, P_GPLL0_OUT, 12.5,    0,     0),
+	{ }
+};
+
+static struct clk_rcg2 usb_fs_system_clk_src = {
+	.cmd_rcgr = 0x3F010,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4_fs,
+	.freq_tbl = ftbl_usb_fs_system_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb_fs_system_clk_src",
+		.parent_names = gcc_parent_names_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_usb_hs_system_clk_src[] = {
+	F(57140000, P_GPLL0_OUT_MAIN, 14, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(177780000, P_GPLL0_OUT_MAIN, 4.5,    0,     0),
+	{ }
+};
+
+static struct clk_rcg2 usb_hs_system_clk_src = {
+	.cmd_rcgr = 0x41010,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_4,
+	.freq_tbl = ftbl_usb_hs_system_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "usb_hs_system_clk_src",
+		.parent_names = gcc_parent_names_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_vcodec0_clk_src[] = {
+	F(72727200, P_GPLL0_OUT_MAIN, 11, 0, 0),
+	F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
+	F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
+	F(228570000, P_GPLL0_OUT_MAIN, 3.5,    0,     0),
+	F(310667000, P_GPLL2_AUX, 3, 0, 0),
+	F(360000000, P_GPLL6_AUX, 3, 0, 0),
+	F(400000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(466000000, P_GPLL2_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 vcodec0_clk_src = {
+	.cmd_rcgr = 0x4C000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_3,
+	.freq_tbl = ftbl_vcodec0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "vcodec0_clk_src",
+		.parent_names = gcc_parent_names_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_aps_0_clk = {
+	.halt_reg = 0x78004,
+	.clkr = {
+		.enable_reg = 0x78004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_aps_0_clk",
+			.parent_names = (const char*[]) {
+				"aps_0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aps_1_clk = {
+	.halt_reg = 0x79004,
+	.clkr = {
+		.enable_reg = 0x79004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_aps_1_clk",
+			.parent_names = (const char*[]) {
+				"aps_1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x02008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x02008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup1_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x02004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x02004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup1_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
+	.halt_reg = 0x03010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x03010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup2_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup2_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
+	.halt_reg = 0x0300C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0300C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup2_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup2_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
+	.halt_reg = 0x04020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x04020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup3_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup3_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
+	.halt_reg = 0x0401C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0401C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup3_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup3_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
+	.halt_reg = 0x05020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x05020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup4_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup4_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
+	.halt_reg = 0x0501C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0501C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_qup4_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_qup4_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart1_apps_clk = {
+	.halt_reg = 0x0203C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0203C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_uart1_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_uart1_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_uart2_apps_clk = {
+	.halt_reg = 0x0302C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0302C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp1_uart2_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp1_uart2_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
+	.halt_reg = 0x0C008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0C008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup1_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup1_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
+	.halt_reg = 0x0C004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0C004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup1_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup1_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
+	.halt_reg = 0x0D010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0D010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup2_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup2_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
+	.halt_reg = 0x0D00C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0D00C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup2_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup2_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
+	.halt_reg = 0x0F020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0F020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup3_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup3_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
+	.halt_reg = 0x0F01C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0F01C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup3_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup3_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
+	.halt_reg = 0x18020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup4_i2c_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup4_i2c_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
+	.halt_reg = 0x1801C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1801C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_qup4_spi_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_qup4_spi_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart1_apps_clk = {
+	.halt_reg = 0x0C03C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0C03C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_uart1_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_uart1_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp2_uart2_apps_clk = {
+	.halt_reg = 0x0D02C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0D02C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_blsp2_uart2_apps_clk",
+			.parent_names = (const char*[]) {
+				"blsp2_uart2_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cci_ahb_clk = {
+	.halt_reg = 0x5101C,
+	.clkr = {
+		.enable_reg = 0x5101C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_cci_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cci_clk = {
+	.halt_reg = 0x51018,
+	.clkr = {
+		.enable_reg = 0x51018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_cci_clk",
+			.parent_names = (const char*[]) {
+				"cci_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cpp_ahb_clk = {
+	.halt_reg = 0x58040,
+	.clkr = {
+		.enable_reg = 0x58040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_cpp_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cpp_axi_clk = {
+	.halt_reg = 0x58064,
+	.clkr = {
+		.enable_reg = 0x58064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_cpp_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_cpp_clk = {
+	.halt_reg = 0x5803C,
+	.clkr = {
+		.enable_reg = 0x5803C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_cpp_clk",
+			.parent_names = (const char*[]) {
+				"cpp_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0_ahb_clk = {
+	.halt_reg = 0x4E040,
+	.clkr = {
+		.enable_reg = 0x4E040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0_clk = {
+	.halt_reg = 0x4E03C,
+	.clkr = {
+		.enable_reg = 0x4E03C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0_clk",
+			.parent_names = (const char*[]) {
+				"csi0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0phy_clk = {
+	.halt_reg = 0x4E048,
+	.clkr = {
+		.enable_reg = 0x4E048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0phy_clk",
+			.parent_names = (const char*[]) {
+				"csi0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0pix_clk = {
+	.halt_reg = 0x4E058,
+	.clkr = {
+		.enable_reg = 0x4E058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0pix_clk",
+			.parent_names = (const char*[]) {
+				"csi0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0rdi_clk = {
+	.halt_reg = 0x4E050,
+	.clkr = {
+		.enable_reg = 0x4E050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0rdi_clk",
+			.parent_names = (const char*[]) {
+				"csi0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1_ahb_clk = {
+	.halt_reg = 0x4F040,
+	.clkr = {
+		.enable_reg = 0x4F040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1_clk = {
+	.halt_reg = 0x4F03C,
+	.clkr = {
+		.enable_reg = 0x4F03C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1_clk",
+			.parent_names = (const char*[]) {
+				"csi1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1phy_clk = {
+	.halt_reg = 0x4F048,
+	.clkr = {
+		.enable_reg = 0x4F048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1phy_clk",
+			.parent_names = (const char*[]) {
+				"csi1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1pix_clk = {
+	.halt_reg = 0x4F058,
+	.clkr = {
+		.enable_reg = 0x4F058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1pix_clk",
+			.parent_names = (const char*[]) {
+				"csi1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1rdi_clk = {
+	.halt_reg = 0x4F050,
+	.clkr = {
+		.enable_reg = 0x4F050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1rdi_clk",
+			.parent_names = (const char*[]) {
+				"csi1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi2_ahb_clk = {
+	.halt_reg = 0x3C040,
+	.clkr = {
+		.enable_reg = 0x3C040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi2_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi2_clk = {
+	.halt_reg = 0x3C03C,
+	.clkr = {
+		.enable_reg = 0x3C03C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi2_clk",
+			.parent_names = (const char*[]) {
+				"csi2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi2phy_clk = {
+	.halt_reg = 0x3C048,
+	.clkr = {
+		.enable_reg = 0x3C048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi2phy_clk",
+			.parent_names = (const char*[]) {
+				"csi2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi2pix_clk = {
+	.halt_reg = 0x3C058,
+	.clkr = {
+		.enable_reg = 0x3C058,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi2pix_clk",
+			.parent_names = (const char*[]) {
+				"csi2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi2rdi_clk = {
+	.halt_reg = 0x3C050,
+	.clkr = {
+		.enable_reg = 0x3C050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi2rdi_clk",
+			.parent_names = (const char*[]) {
+				"csi2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi_vfe0_clk = {
+	.halt_reg = 0x58050,
+	.clkr = {
+		.enable_reg = 0x58050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi_vfe0_clk",
+			.parent_names = (const char*[]) {
+				"vfe0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi_vfe1_clk = {
+	.halt_reg = 0x58074,
+	.clkr = {
+		.enable_reg = 0x58074,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi_vfe1_clk",
+			.parent_names = (const char*[]) {
+				"vfe1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_gp0_clk = {
+	.halt_reg = 0x54018,
+	.clkr = {
+		.enable_reg = 0x54018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_gp0_clk",
+			.parent_names = (const char*[]) {
+				"camss_gp0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_gp1_clk = {
+	.halt_reg = 0x55018,
+	.clkr = {
+		.enable_reg = 0x55018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_gp1_clk",
+			.parent_names = (const char*[]) {
+				"camss_gp1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_ispif_ahb_clk = {
+	.halt_reg = 0x50004,
+	.clkr = {
+		.enable_reg = 0x50004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_ispif_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_jpeg0_clk = {
+	.halt_reg = 0x57020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x57020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_jpeg0_clk",
+			.parent_names = (const char*[]) {
+				"jpeg0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_jpeg_ahb_clk = {
+	.halt_reg = 0x57024,
+	.clkr = {
+		.enable_reg = 0x57024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_jpeg_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_jpeg_axi_clk = {
+	.halt_reg = 0x57028,
+	.clkr = {
+		.enable_reg = 0x57028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_jpeg_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+
+static struct clk_branch gcc_camss_mclk0_clk = {
+	.halt_reg = 0x52018,
+	.clkr = {
+		.enable_reg = 0x52018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_mclk0_clk",
+			.parent_names = (const char*[]) {
+				"mclk0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_mclk1_clk = {
+	.halt_reg = 0x53018,
+	.clkr = {
+		.enable_reg = 0x53018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_mclk1_clk",
+			.parent_names = (const char*[]) {
+				"mclk1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_mclk2_clk = {
+	.halt_reg = 0x5C018,
+	.clkr = {
+		.enable_reg = 0x5C018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_mclk2_clk",
+			.parent_names = (const char*[]) {
+				"mclk2_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_micro_ahb_clk = {
+	.halt_reg = 0x5600C,
+	.clkr = {
+		.enable_reg = 0x5600C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_micro_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi0phytimer_clk = {
+	.halt_reg = 0x4E01C,
+	.clkr = {
+		.enable_reg = 0x4E01C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi0phytimer_clk",
+			.parent_names = (const char*[]) {
+				"csi0phytimer_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_csi1phytimer_clk = {
+	.halt_reg = 0x4F01C,
+	.clkr = {
+		.enable_reg = 0x4F01C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_csi1phytimer_clk",
+			.parent_names = (const char*[]) {
+				"csi1phytimer_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_ahb_clk = {
+	.halt_reg = 0x56004,
+	.clkr = {
+		.enable_reg = 0x56004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_top_ahb_clk = {
+	.halt_reg = 0x5A014,
+	.clkr = {
+		.enable_reg = 0x5A014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_top_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_vfe0_clk = {
+	.halt_reg = 0x58038,
+	.clkr = {
+		.enable_reg = 0x58038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe0_clk",
+			.parent_names = (const char*[]) {
+				"vfe0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_vfe_ahb_clk = {
+	.halt_reg = 0x58044,
+	.clkr = {
+		.enable_reg = 0x58044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_vfe_axi_clk = {
+	.halt_reg = 0x58048,
+	.clkr = {
+		.enable_reg = 0x58048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+
+static struct clk_branch gcc_camss_vfe1_ahb_clk = {
+	.halt_reg = 0x58060,
+	.clkr = {
+		.enable_reg = 0x58060,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe1_ahb_clk",
+			.parent_names = (const char*[]) {
+				"camss_top_ahb_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_vfe1_axi_clk = {
+	.halt_reg = 0x58068,
+	.clkr = {
+		.enable_reg = 0x58068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_camss_vfe1_clk = {
+	.halt_reg = 0x5805C,
+	.clkr = {
+		.enable_reg = 0x5805C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_camss_vfe1_clk",
+			.parent_names = (const char*[]) {
+				"vfe1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_dcc_clk = {
+	.halt_reg = 0x77004,
+	.clkr = {
+		.enable_reg = 0x77004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_dcc_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_oxili_gmem_clk = {
+	.halt_reg = 0x59024,
+	.clkr = {
+		.enable_reg = 0x59024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_gmem_clk",
+			.parent_names = (const char*[]) {
+				"gfx3d_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp1_clk = {
+	.halt_reg = 0x08000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x08000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gp1_clk",
+			.parent_names = (const char*[]) {
+				"gp1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp2_clk = {
+	.halt_reg = 0x09000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x09000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gp2_clk",
+			.parent_names = (const char*[]) {
+				"gp2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gp3_clk = {
+	.halt_reg = 0x0A000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x0A000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_gp3_clk",
+			.parent_names = (const char*[]) {
+				"gp3_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_ahb_clk = {
+	.halt_reg = 0x4D07C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D07C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_axi_clk = {
+	.halt_reg = 0x4D080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_byte0_clk = {
+	.halt_reg = 0x4D094,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D094,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_byte0_clk",
+			.parent_names = (const char*[]) {
+				"byte0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = (CLK_GET_RATE_NOCACHE |
+				  CLK_SET_RATE_PARENT),
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_byte1_clk = {
+	.halt_reg = 0x4D0A0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D0A0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_byte1_clk",
+			.parent_names = (const char*[]) {
+				"byte1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_esc0_clk = {
+	.halt_reg = 0x4D098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_esc0_clk",
+			.parent_names = (const char*[]) {
+				"esc0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_esc1_clk = {
+	.halt_reg = 0x4D09C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D09C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_esc1_clk",
+			.parent_names = (const char*[]) {
+				"esc1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_mdp_clk = {
+	.halt_reg = 0x4D088,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D088,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_mdp_clk",
+			.parent_names = (const char*[]) {
+				"mdp_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_pclk0_clk = {
+	.halt_reg = 0x4D084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D084,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_pclk0_clk",
+			.parent_names = (const char*[]) {
+				"pclk0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_pclk1_clk = {
+	.halt_reg = 0x4D0A4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D0A4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_pclk1_clk",
+			.parent_names = (const char*[]) {
+				"pclk1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdss_vsync_clk = {
+	.halt_reg = 0x4D090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4D090,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdss_vsync_clk",
+			.parent_names = (const char*[]) {
+				"vsync_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x49000,
+	.clkr = {
+		.enable_reg = 0x49000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mss_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x49004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x49004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_bimc_gfx_clk = {
+	.halt_reg = 0x59048,
+	.clkr = {
+		.enable_reg = 0x59048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_bimc_gfx_clk",
+			.parent_names = (const char*[]) {
+				"gcc_oxili_gmem_clk",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_oxili_ahb_clk = {
+	.halt_reg = 0x59028,
+	.clkr = {
+		.enable_reg = 0x59028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_oxili_aon_clk = {
+	.halt_reg = 0x59044,
+	.clkr = {
+		.enable_reg = 0x59044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_aon_clk",
+			.parent_names = (const char*[]) {
+				"gfx3d_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_oxili_gfx3d_clk = {
+	.halt_reg = 0x59020,
+	.clkr = {
+		.enable_reg = 0x59020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_gfx3d_clk",
+			.parent_names = (const char*[]) {
+				"gfx3d_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_oxili_timer_clk = {
+	.halt_reg = 0x59040,
+	.clkr = {
+		.enable_reg = 0x59040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_oxili_timer_clk",
+			.parent_names = (const char*[]) {
+				"xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm2_clk = {
+	.halt_reg = 0x4400C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4400C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_pdm2_clk",
+			.parent_names = (const char*[]) {
+				"pdm2_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_pdm_ahb_clk = {
+	.halt_reg = 0x44004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x44004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_pdm_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+
+static struct clk_branch gcc_rbcpr_gfx_ahb_clk = {
+	.halt_reg = 0x3A008,
+	.clkr = {
+		.enable_reg = 0x3A008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_rbcpr_gfx_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_rbcpr_gfx_clk = {
+	.halt_reg = 0x3A004,
+	.clkr = {
+		.enable_reg = 0x3A004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_rbcpr_gfx_clk",
+			.parent_names = (const char*[]) {
+				"rbcpr_gfx_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ahb_clk = {
+	.halt_reg = 0x4201C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4201C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_apps_clk = {
+	.halt_reg = 0x42018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x42018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc1_apps_clk",
+			.parent_names = (const char*[]) {
+				"sdcc1_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc1_ice_core_clk = {
+	.halt_reg = 0x5D014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5D014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc1_ice_core_clk",
+			.parent_names = (const char*[]) {
+				"sdcc1_ice_core_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_ahb_clk = {
+	.halt_reg = 0x4301C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4301C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc2_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc2_apps_clk = {
+	.halt_reg = 0x43018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x43018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc2_apps_clk",
+			.parent_names = (const char*[]) {
+				"sdcc2_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc3_ahb_clk = {
+	.halt_reg = 0x3901C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x3901C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc3_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sdcc3_apps_clk = {
+	.halt_reg = 0x39018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x39018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_sdcc3_apps_clk",
+			.parent_names = (const char*[]) {
+				"sdcc3_apps_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb2a_phy_sleep_clk = {
+	.halt_reg = 0x4102C,
+	.clkr = {
+		.enable_reg = 0x4102C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb2a_phy_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_hs_phy_cfg_ahb_clk = {
+	.halt_reg = 0x41030,
+	.clkr = {
+		.enable_reg = 0x41030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_hs_phy_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_fs_ahb_clk = {
+	.halt_reg = 0x3F008,
+	.clkr = {
+		.enable_reg = 0x3F008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_fs_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_fs_ic_clk = {
+	.halt_reg = 0x3F030,
+	.clkr = {
+		.enable_reg = 0x3F030,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_fs_ic_clk",
+			.parent_names = (const char*[]) {
+				"usb_fs_ic_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_fs_system_clk = {
+	.halt_reg = 0x3F004,
+	.clkr = {
+		.enable_reg = 0x3F004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_fs_system_clk",
+			.parent_names = (const char*[]) {
+				"usb_fs_system_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_hs_ahb_clk = {
+	.halt_reg = 0x41008,
+	.clkr = {
+		.enable_reg = 0x41008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_hs_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_usb_hs_system_clk = {
+	.halt_reg = 0x41004,
+	.clkr = {
+		.enable_reg = 0x41004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_usb_hs_system_clk",
+			.parent_names = (const char*[]) {
+				"usb_hs_system_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus0_ahb_clk = {
+	.halt_reg = 0x4C020,
+	.clkr = {
+		.enable_reg = 0x4C020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus0_axi_clk = {
+	.halt_reg = 0x4C024,
+	.clkr = {
+		.enable_reg = 0x4C024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
+	.halt_reg = 0x4C02C,
+	.clkr = {
+		.enable_reg = 0x4C02C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_core0_vcodec0_clk",
+			.parent_names = (const char*[]) {
+				"vcodec0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
+	.halt_reg = 0x4C034,
+	.clkr = {
+		.enable_reg = 0x4C034,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_core1_vcodec0_clk",
+			.parent_names = (const char*[]) {
+				"vcodec0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+
+static struct clk_branch gcc_venus0_vcodec0_clk = {
+	.halt_reg = 0x4C01C,
+	.clkr = {
+		.enable_reg = 0x4C01C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_venus0_vcodec0_clk",
+			.parent_names = (const char*[]) {
+				"vcodec0_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* Vote clocks */
+static struct clk_branch gcc_apss_ahb_clk = {
+	.halt_reg = 0x4601C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apss_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_apss_axi_clk = {
+	.halt_reg = 0x46020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apss_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_ahb_clk = {
+	.halt_reg = 0x01008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+
+static struct clk_branch gcc_blsp2_ahb_clk = {
+	.halt_reg = 0x0B008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(20),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp2_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_prng_ahb_clk = {
+	.halt_reg = 0x13004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(8),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_prng_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x1300C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(7),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_ahb_clk = {
+	.halt_reg = 0x16024,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_axi_clk = {
+	.halt_reg = 0x16020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_crypto_clk = {
+	.halt_reg = 0x1601C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_crypto_clk",
+			.parent_names = (const char *[]){
+				"crypto_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cpp_tbu_clk = {
+	.halt_reg = 0x12040,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(14),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpp_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gfx_1_tbu_clk = {
+	.halt_reg = 0x12098,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(19),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gfx_1_tbu_clk",
+			.parent_names = (const char *[]){
+				"gcc_gfx_tbu_clk",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gfx_tbu_clk = {
+	.halt_reg = 0x12010,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gfx_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gfx_tcu_clk = {
+	.halt_reg = 0x12020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gfx_tcu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_apss_tcu_clk = {
+	.halt_reg = 0x12018,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apss_tcu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gtcu_ahb_clk = {
+	.halt_reg = 0x12044,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(13),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gtcu_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_jpeg_tbu_clk = {
+	.halt_reg = 0x12034,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_jpeg_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdp_rt_tbu_clk = {
+	.halt_reg = 0x1204C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(15),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdp_rt_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdp_tbu_clk = {
+	.halt_reg = 0x1201C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdp_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_smmu_cfg_clk = {
+	.halt_reg = 0x12038,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(12),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_smmu_cfg_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus_1_tbu_clk = {
+	.halt_reg = 0x1209C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(20),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_venus_1_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_venus_tbu_clk = {
+	.halt_reg = 0x12014,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_venus_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vfe1_tbu_clk = {
+	.halt_reg = 0x12090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(17),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vfe1_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_vfe_tbu_clk = {
+	.halt_reg = 0x1203C,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x4500C,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_vfe_tbu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc venus_gdsc = {
+	.gdscr = 0x4c018,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "venus_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc venus_core0_gdsc = {
+	.gdscr = 0x4c028,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "venus_core0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc venus_core1_gdsc = {
+	.gdscr = 0x4c030,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "venus_core1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x4d078,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc jpeg_gdsc = {
+	.gdscr = 0x5701c,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "jpeg_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc vfe0_gdsc = {
+	.gdscr = 0x58034,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "vfe0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc vfe1_gdsc = {
+	.gdscr = 0x5806c,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "vfe1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc cpp_gdsc = {
+	.gdscr = 0x58078,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "cpp_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc oxili_gx_gdsc = {
+	.gdscr = 0x5901c,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "oxili_gx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc oxili_cx_gdsc = {
+	.gdscr = 0x5904c,
+	.gds_hw_ctrl = 0x0,
+	.pd = {
+		.name = "oxili_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct clk_regmap *gcc_msm8976_clocks[] = {
+	[GPLL0] = &gpll0.clkr,
+	[GPLL2] = &gpll2.clkr,
+	[GPLL3] = &gpll3.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL6] = &gpll6.clkr,
+	[GPLL0_CLK_SRC] = &gpll0_vote,
+	[GPLL2_CLK_SRC] = &gpll2_vote,
+	[GPLL3_CLK_SRC] = &gpll3_vote,
+	[GPLL4_CLK_SRC] = &gpll4_vote,
+	[GPLL6_CLK_SRC] = &gpll6_vote,
+	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BLSP2_QUP1_I2C_APPS_CLK] = &gcc_blsp2_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP1_SPI_APPS_CLK] = &gcc_blsp2_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP2_I2C_APPS_CLK] = &gcc_blsp2_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP2_SPI_APPS_CLK] = &gcc_blsp2_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP3_I2C_APPS_CLK] = &gcc_blsp2_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP3_SPI_APPS_CLK] = &gcc_blsp2_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP4_I2C_APPS_CLK] = &gcc_blsp2_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP4_SPI_APPS_CLK] = &gcc_blsp2_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP2_UART1_APPS_CLK] = &gcc_blsp2_uart1_apps_clk.clkr,
+	[GCC_BLSP2_UART2_APPS_CLK] = &gcc_blsp2_uart2_apps_clk.clkr,
+	[GCC_CAMSS_CCI_AHB_CLK] = &gcc_camss_cci_ahb_clk.clkr,
+	[GCC_CAMSS_CCI_CLK] = &gcc_camss_cci_clk.clkr,
+	[GCC_CAMSS_CPP_AHB_CLK] = &gcc_camss_cpp_ahb_clk.clkr,
+	[GCC_CAMSS_CPP_AXI_CLK] = &gcc_camss_cpp_axi_clk.clkr,
+	[GCC_CAMSS_CPP_CLK] = &gcc_camss_cpp_clk.clkr,
+	[GCC_CAMSS_CSI0_AHB_CLK] = &gcc_camss_csi0_ahb_clk.clkr,
+	[GCC_CAMSS_CSI0_CLK] = &gcc_camss_csi0_clk.clkr,
+	[GCC_CAMSS_CSI0PHY_CLK] = &gcc_camss_csi0phy_clk.clkr,
+	[GCC_CAMSS_CSI0PIX_CLK] = &gcc_camss_csi0pix_clk.clkr,
+	[GCC_CAMSS_CSI0RDI_CLK] = &gcc_camss_csi0rdi_clk.clkr,
+	[GCC_CAMSS_CSI1_AHB_CLK] = &gcc_camss_csi1_ahb_clk.clkr,
+	[GCC_CAMSS_CSI1_CLK] = &gcc_camss_csi1_clk.clkr,
+	[GCC_CAMSS_CSI1PHY_CLK] = &gcc_camss_csi1phy_clk.clkr,
+	[GCC_CAMSS_CSI1PIX_CLK] = &gcc_camss_csi1pix_clk.clkr,
+	[GCC_CAMSS_CSI1RDI_CLK] = &gcc_camss_csi1rdi_clk.clkr,
+	[GCC_CAMSS_CSI2_AHB_CLK] = &gcc_camss_csi2_ahb_clk.clkr,
+	[GCC_CAMSS_CSI2_CLK] = &gcc_camss_csi2_clk.clkr,
+	[GCC_CAMSS_CSI2PHY_CLK] = &gcc_camss_csi2phy_clk.clkr,
+	[GCC_CAMSS_CSI2PIX_CLK] = &gcc_camss_csi2pix_clk.clkr,
+	[GCC_CAMSS_CSI2RDI_CLK] = &gcc_camss_csi2rdi_clk.clkr,
+	[GCC_CAMSS_CSI_VFE0_CLK] = &gcc_camss_csi_vfe0_clk.clkr,
+	[GCC_CAMSS_CSI_VFE1_CLK] = &gcc_camss_csi_vfe1_clk.clkr,
+	[GCC_CAMSS_GP0_CLK] = &gcc_camss_gp0_clk.clkr,
+	[GCC_CAMSS_GP1_CLK] = &gcc_camss_gp1_clk.clkr,
+	[GCC_CAMSS_ISPIF_AHB_CLK] = &gcc_camss_ispif_ahb_clk.clkr,
+	[GCC_CAMSS_JPEG0_CLK] = &gcc_camss_jpeg0_clk.clkr,
+	[GCC_CAMSS_JPEG_AHB_CLK] = &gcc_camss_jpeg_ahb_clk.clkr,
+	[GCC_CAMSS_JPEG_AXI_CLK] = &gcc_camss_jpeg_axi_clk.clkr,
+	[GCC_CAMSS_MCLK0_CLK] = &gcc_camss_mclk0_clk.clkr,
+	[GCC_CAMSS_MCLK1_CLK] = &gcc_camss_mclk1_clk.clkr,
+	[GCC_CAMSS_MCLK2_CLK] = &gcc_camss_mclk2_clk.clkr,
+	[GCC_CAMSS_MICRO_AHB_CLK] = &gcc_camss_micro_ahb_clk.clkr,
+	[GCC_CAMSS_CSI0PHYTIMER_CLK] = &gcc_camss_csi0phytimer_clk.clkr,
+	[GCC_CAMSS_CSI1PHYTIMER_CLK] = &gcc_camss_csi1phytimer_clk.clkr,
+	[GCC_CAMSS_AHB_CLK] = &gcc_camss_ahb_clk.clkr,
+	[GCC_CAMSS_TOP_AHB_CLK] = &gcc_camss_top_ahb_clk.clkr,
+	[GCC_CAMSS_VFE0_CLK] = &gcc_camss_vfe0_clk.clkr,
+	[GCC_CAMSS_VFE_AHB_CLK] = &gcc_camss_vfe_ahb_clk.clkr,
+	[GCC_CAMSS_VFE_AXI_CLK] = &gcc_camss_vfe_axi_clk.clkr,
+	[GCC_CAMSS_VFE1_AHB_CLK] = &gcc_camss_vfe1_ahb_clk.clkr,
+	[GCC_CAMSS_VFE1_AXI_CLK] = &gcc_camss_vfe1_axi_clk.clkr,
+	[GCC_CAMSS_VFE1_CLK] = &gcc_camss_vfe1_clk.clkr,
+	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_MDSS_AHB_CLK] = &gcc_mdss_ahb_clk.clkr,
+	[GCC_MDSS_AXI_CLK] = &gcc_mdss_axi_clk.clkr,
+	[GCC_MDSS_ESC0_CLK] = &gcc_mdss_esc0_clk.clkr,
+	[GCC_MDSS_ESC1_CLK] = &gcc_mdss_esc1_clk.clkr,
+	[GCC_MDSS_MDP_CLK] = &gcc_mdss_mdp_clk.clkr,
+	[GCC_MDSS_VSYNC_CLK] = &gcc_mdss_vsync_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_RBCPR_GFX_AHB_CLK] = &gcc_rbcpr_gfx_ahb_clk.clkr,
+	[GCC_RBCPR_GFX_CLK] = &gcc_rbcpr_gfx_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SDCC3_AHB_CLK] = &gcc_sdcc3_ahb_clk.clkr,
+	[GCC_SDCC3_APPS_CLK] = &gcc_sdcc3_apps_clk.clkr,
+	[GCC_USB2A_PHY_SLEEP_CLK] = &gcc_usb2a_phy_sleep_clk.clkr,
+	[GCC_USB_HS_PHY_CFG_AHB_CLK] = &gcc_usb_hs_phy_cfg_ahb_clk.clkr,
+	[GCC_USB_FS_AHB_CLK] = &gcc_usb_fs_ahb_clk.clkr,
+	[GCC_USB_FS_IC_CLK] = &gcc_usb_fs_ic_clk.clkr,
+	[GCC_USB_FS_SYSTEM_CLK] = &gcc_usb_fs_system_clk.clkr,
+	[GCC_USB_HS_AHB_CLK] = &gcc_usb_hs_ahb_clk.clkr,
+	[GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
+	[GCC_VENUS0_AHB_CLK] = &gcc_venus0_ahb_clk.clkr,
+	[GCC_VENUS0_AXI_CLK] = &gcc_venus0_axi_clk.clkr,
+	[GCC_VENUS0_CORE0_VCODEC0_CLK] = &gcc_venus0_core0_vcodec0_clk.clkr,
+	[GCC_VENUS0_CORE1_VCODEC0_CLK] = &gcc_venus0_core1_vcodec0_clk.clkr,
+	[GCC_VENUS0_VCODEC0_CLK] = &gcc_venus0_vcodec0_clk.clkr,
+	[GCC_APSS_AHB_CLK] = &gcc_apss_ahb_clk.clkr,
+	[GCC_APSS_AXI_CLK] = &gcc_apss_axi_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[GCC_BLSP2_AHB_CLK] = &gcc_blsp2_ahb_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
+	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
+	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
+	[GCC_CPP_TBU_CLK] = &gcc_cpp_tbu_clk.clkr,
+	[GCC_APSS_TCU_CLK] = &gcc_apss_tcu_clk.clkr,
+	[GCC_JPEG_TBU_CLK] = &gcc_jpeg_tbu_clk.clkr,
+	[GCC_MDP_RT_TBU_CLK] = &gcc_mdp_rt_tbu_clk.clkr,
+	[GCC_MDP_TBU_CLK] = &gcc_mdp_tbu_clk.clkr,
+	[GCC_SMMU_CFG_CLK] = &gcc_smmu_cfg_clk.clkr,
+	[GCC_VENUS_1_TBU_CLK] = &gcc_venus_1_tbu_clk.clkr,
+	[GCC_VENUS_TBU_CLK] = &gcc_venus_tbu_clk.clkr,
+	[GCC_VFE1_TBU_CLK] = &gcc_vfe1_tbu_clk.clkr,
+	[GCC_VFE_TBU_CLK] = &gcc_vfe_tbu_clk.clkr,
+	[GCC_APS_0_CLK] = &gcc_aps_0_clk.clkr,
+	[GCC_APS_1_CLK] = &gcc_aps_1_clk.clkr,
+	[APS_0_CLK_SRC] = &aps_0_clk_src.clkr,
+	[APS_1_CLK_SRC] = &aps_1_clk_src.clkr,
+	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
+	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
+	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
+	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
+	[BLSP1_QUP4_I2C_APPS_CLK_SRC] = &blsp1_qup4_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP4_SPI_APPS_CLK_SRC] = &blsp1_qup4_spi_apps_clk_src.clkr,
+	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
+	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
+	[BLSP2_QUP1_I2C_APPS_CLK_SRC] = &blsp2_qup1_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP1_SPI_APPS_CLK_SRC] = &blsp2_qup1_spi_apps_clk_src.clkr,
+	[BLSP2_QUP2_I2C_APPS_CLK_SRC] = &blsp2_qup2_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP2_SPI_APPS_CLK_SRC] = &blsp2_qup2_spi_apps_clk_src.clkr,
+	[BLSP2_QUP3_I2C_APPS_CLK_SRC] = &blsp2_qup3_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP3_SPI_APPS_CLK_SRC] = &blsp2_qup3_spi_apps_clk_src.clkr,
+	[BLSP2_QUP4_I2C_APPS_CLK_SRC] = &blsp2_qup4_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP4_SPI_APPS_CLK_SRC] = &blsp2_qup4_spi_apps_clk_src.clkr,
+	[BLSP2_UART1_APPS_CLK_SRC] = &blsp2_uart1_apps_clk_src.clkr,
+	[BLSP2_UART2_APPS_CLK_SRC] = &blsp2_uart2_apps_clk_src.clkr,
+	[CCI_CLK_SRC] = &cci_clk_src.clkr,
+	[CPP_CLK_SRC] = &cpp_clk_src.clkr,
+	[CSI0_CLK_SRC] = &csi0_clk_src.clkr,
+	[CSI1_CLK_SRC] = &csi1_clk_src.clkr,
+	[CSI2_CLK_SRC] = &csi2_clk_src.clkr,
+	[CAMSS_GP0_CLK_SRC] = &camss_gp0_clk_src.clkr,
+	[CAMSS_GP1_CLK_SRC] = &camss_gp1_clk_src.clkr,
+	[JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
+	[MCLK0_CLK_SRC] = &mclk0_clk_src.clkr,
+	[MCLK1_CLK_SRC] = &mclk1_clk_src.clkr,
+	[MCLK2_CLK_SRC] = &mclk2_clk_src.clkr,
+	[CSI0PHYTIMER_CLK_SRC] = &csi0phytimer_clk_src.clkr,
+	[CSI1PHYTIMER_CLK_SRC] = &csi1phytimer_clk_src.clkr,
+	[CAMSS_TOP_AHB_CLK_SRC] = &camss_top_ahb_clk_src.clkr,
+	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
+	[VFE1_CLK_SRC] = &vfe1_clk_src.clkr,
+	[CRYPTO_CLK_SRC] = &crypto_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[ESC0_CLK_SRC] = &esc0_clk_src.clkr,
+	[ESC1_CLK_SRC] = &esc1_clk_src.clkr,
+	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
+	[VSYNC_CLK_SRC] = &vsync_clk_src.clkr,
+	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
+	[RBCPR_GFX_CLK_SRC] = &rbcpr_gfx_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SDCC1_ICE_CORE_CLK_SRC] = &sdcc1_ice_core_clk_src.clkr,
+	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
+	[SDCC3_APPS_CLK_SRC] = &sdcc3_apps_clk_src.clkr,
+	[USB_FS_IC_CLK_SRC] = &usb_fs_ic_clk_src.clkr,
+	[USB_FS_SYSTEM_CLK_SRC] = &usb_fs_system_clk_src.clkr,
+	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
+	[VCODEC0_CLK_SRC] = &vcodec0_clk_src.clkr,
+	[GCC_MDSS_BYTE0_CLK_SRC] = &byte0_clk_src.clkr,
+	[GCC_MDSS_BYTE1_CLK_SRC] = &byte1_clk_src.clkr,
+	[GCC_MDSS_BYTE0_CLK] = &gcc_mdss_byte0_clk.clkr,
+	[GCC_MDSS_BYTE1_CLK] = &gcc_mdss_byte1_clk.clkr,
+	[GCC_MDSS_PCLK0_CLK_SRC] = &pclk0_clk_src.clkr,
+	[GCC_MDSS_PCLK1_CLK_SRC] = &pclk1_clk_src.clkr,
+	[GCC_MDSS_PCLK0_CLK] = &gcc_mdss_pclk0_clk.clkr,
+	[GCC_MDSS_PCLK1_CLK] = &gcc_mdss_pclk1_clk.clkr,
+	[GCC_GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
+	[GCC_GFX3D_OXILI_CLK] = &gcc_oxili_gfx3d_clk.clkr,
+	[GCC_GFX3D_BIMC_CLK] = &gcc_bimc_gfx_clk.clkr,
+	[GCC_GFX3D_OXILI_AHB_CLK] = &gcc_oxili_ahb_clk.clkr,
+	[GCC_GFX3D_OXILI_AON_CLK] = &gcc_oxili_aon_clk.clkr,
+	[GCC_GFX3D_OXILI_GMEM_CLK] = &gcc_oxili_gmem_clk.clkr,
+	[GCC_GFX3D_OXILI_TIMER_CLK] = &gcc_oxili_timer_clk.clkr,
+	[GCC_GFX3D_TBU0_CLK] = &gcc_gfx_tbu_clk.clkr,
+	[GCC_GFX3D_TBU1_CLK] = &gcc_gfx_1_tbu_clk.clkr,
+	[GCC_GFX3D_TCU_CLK] = &gcc_gfx_tcu_clk.clkr,
+	[GCC_GFX3D_GTCU_AHB_CLK] = &gcc_gtcu_ahb_clk.clkr,
+};
+
+static struct clk_hw *gcc_msm8976_hws[] = {
+	[GCC_XO] = &xo.hw,
+	[GCC_XO_AO] = &xo_a.hw,
+};
+
+static const struct qcom_reset_map gcc_msm8976_resets[] = {
+	[RST_CAMSS_MICRO_BCR]		= { 0x56008 },
+	[RST_USB_HS_BCR]		= { 0x41000 },
+	[RST_QUSB2_PHY_BCR]		= { 0x4103C },
+	[RST_USB2_HS_PHY_ONLY_BCR]	= { 0x41034 },
+	[RST_USB_HS_PHY_CFG_AHB_BCR]	= { 0x41038 },
+	[RST_USB_FS_BCR]		= { 0x3F000 },
+	[RST_CAMSS_CSI1PIX_BCR]		= { 0x4F054 },
+	[RST_CAMSS_CSI_VFE1_BCR]	= { 0x58070 },
+	[RST_CAMSS_VFE1_BCR]		= { 0x5807C },
+	[RST_CAMSS_CPP_BCR]		= { 0x58080 },
+};
+
+static struct gdsc *gcc_msm8976_gdscs[] = {
+	[VENUS_GDSC] = &venus_gdsc,
+	[VENUS_CORE0_GDSC] = &venus_core0_gdsc,
+	[VENUS_CORE1_GDSC] = &venus_core1_gdsc,
+	[MDSS_GDSC] = &mdss_gdsc,
+	[JPEG_GDSC] = &jpeg_gdsc,
+	[VFE0_GDSC] = &vfe0_gdsc,
+	[VFE1_GDSC] = &vfe1_gdsc,
+	[CPP_GDSC] = &cpp_gdsc,
+	[OXILI_GX_GDSC] = &oxili_gx_gdsc,
+	[OXILI_CX_GDSC] = &oxili_cx_gdsc,
+};
+
+static const struct regmap_config gcc_msm8976_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x7fffc,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc gcc_msm8976_desc = {
+	.config		= &gcc_msm8976_regmap_config,
+	.clks		= gcc_msm8976_clocks,
+	.num_clks	= ARRAY_SIZE(gcc_msm8976_clocks),
+	.resets		= gcc_msm8976_resets,
+	.num_resets	= ARRAY_SIZE(gcc_msm8976_resets),
+	.gdscs		= gcc_msm8976_gdscs,
+	.num_gdscs	= ARRAY_SIZE(gcc_msm8976_gdscs),
+};
+
+static const struct of_device_id msm_clock_gcc_match_table[] = {
+	{ .compatible = "qcom,gcc-msm8976" },
+	{},
+};
+
+static int gcc_8976_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int i, ret;
+	u32 val;
+
+	regmap = qcom_cc_map(pdev, &gcc_msm8976_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
+	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
+
+	/* Register the hws */
+	for (i = 0; i < ARRAY_SIZE(gcc_msm8976_hws); i++) {
+		ret = devm_clk_hw_register(&pdev->dev, gcc_msm8976_hws[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = qcom_cc_really_probe(pdev, &gcc_msm8976_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register GCC clocks\n");
+		return ret;
+	}
+
+	clk_set_rate(apss_ahb_clk_src.clkr.hw.clk, 19200000);
+	clk_prepare_enable(apss_ahb_clk_src.clkr.hw.clk);
+
+	/* Configure Sleep and Wakeup cycles for GMEM clock */
+	regmap_read(regmap, 0x59024, &val);
+	val ^= 0xFF0;
+	val |= (0 << 8);
+	val |= (0 << 4);
+	regmap_write(regmap, 0x59024, val);
+
+	clk_pll_configure_sr_hpm_lp(&gpll3, regmap,
+					&gpll3_config, true);
+
+	clk_set_rate(gpll3.clkr.hw.clk, 1100000000);
+
+	/* Enable AUX2 clock for APSS */
+	regmap_update_bits(regmap, 0x60000, BIT(2), BIT(2));
+
+	/* Oxili Ocmem in GX rail: OXILI_GMEM_CLAMP_IO */
+	regmap_update_bits(regmap, 0x5B00C, BIT(0), 0);
+
+	/* Configure Sleep and Wakeup cycles for OXILI clock */
+	val = regmap_read(regmap, 0x59020, &val);
+	val &= ~0xF0;
+	val |= (0 << 4);
+	regmap_write(regmap, 0x59020, val);
+
+	dev_dbg(&pdev->dev, "Registered GCC-8976 clocks\n");
+
+	return 0;
+}
+
+static struct platform_driver gcc_8976_driver = {
+	.probe = gcc_8976_probe,
+	.driver = {
+		.name = "qcom,gcc-8976",
+		.of_match_table = msm_clock_gcc_match_table,
+	},
+};
+
+static int __init gcc_8976_init(void)
+{
+	return platform_driver_register(&gcc_8976_driver);
+}
+core_initcall_sync(gcc_8976_init);
+
+static void __exit gcc_8976_exit(void)
+{
+	platform_driver_unregister(&gcc_8976_driver);
+}
+module_exit(gcc_8976_exit);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <kholk11@gmail.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:gcc-msm8976");
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8976.h b/include/dt-bindings/clock/qcom,gcc-msm8976.h
new file mode 100644
index 000000000000..d6f703733d25
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-msm8976.h
@@ -0,0 +1,293 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2018, AngeloGioacchino Del Regno <kholk11@gmail.com>
+ *
+ * Author: AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_GCC_8976_H
+#define _DT_BINDINGS_CLK_MSM_GCC_8976_H
+
+/* HW clocks */
+#define GCC_XO					0
+#define GCC_XO_AO				1
+
+/* Voters */
+#define GCC_MDSS_MDP_VOTE_CLK			5
+#define GCC_MDSS_MDP_ROTATOR_VOTE_CLK		6
+
+/* RCG, branch, div, vote */
+#define GPLL0					8
+#define GPLL2					9
+#define GPLL3					10
+#define GPLL4					11
+#define GPLL6					12
+#define GPLL0_CLK_SRC				13
+#define GPLL0_AO_CLK_SRC			14
+#define GPLL2_CLK_SRC				15
+#define GPLL3_CLK_SRC				16
+#define GPLL4_CLK_SRC				17
+#define GPLL6_CLK_SRC				18
+#define BIMC_PLL				19
+#define BIMC_PLL_VOTE				20
+#define PCNOC_BFDCD_CLK_SRC			21
+#define SYSTEM_NOC_BFDCD_CLK_SRC		22
+#define BIMC_DDR_CLK_SRC			23
+#define _QDSS_CLK				24
+#define _QDSS_A_CLK				25
+#define _SNOC_CLK				26
+#define _SNOC_A_CLK				27
+#define _SYSMMNOC_CLK				28
+#define _SYSMMNOC_A_CLK				29
+#define _SYSMMNOC_MSMBUS_CLK			30
+#define _SYSMMNOC_MSMBUS_A_CLK			31
+#define _BIMC_MSMBUS_CLK			32
+#define _BIMC_MSMBUS_A_CLK			33
+#define _BIMC_USB_CLK				34
+#define _BIMC_USB_A_CLK				35
+#define _PCNOC_KEEPALIVE_A_CLK			36
+#define _PCNOC_MSMBUS_CLK			37
+#define _PCNOC_MSMBUS_A_CLK			38
+#define _PCNOC_USB_CLK				39
+#define _PCNOC_USB_A_CLK			40
+#define _SNOC_MSMBUS_CLK			41
+#define _SNOC_MSMBUS_A_CLK			42
+#define _SNOC_USB_CLK				43
+#define _SNOC_USB_A_CLK				44
+#define _XO_LPM_CLK				45
+#define _XO_OTG_CLK				46
+#define _XO_PIL_LPASS_CLK			47
+#define _XO_PIL_MSS_CLK				48
+#define _XO_PIL_PRONTO_CLK			49
+#define _XO_WLAN_CLK				50
+
+#define _BB_CLK1				51
+#define _BB_CLK2				52
+#define _RF_CLK2				53
+#define _DIV_CLK2				54
+#define _BB_CLK1_PIN				55
+#define _BB_CLK2_PIN				56
+
+#define GCC_BLSP1_QUP1_SPI_APPS_CLK		57
+#define GCC_BLSP1_QUP1_I2C_APPS_CLK		58
+#define GCC_BLSP1_QUP2_I2C_APPS_CLK		59
+#define GCC_BLSP1_QUP2_SPI_APPS_CLK		60
+#define GCC_BLSP1_QUP3_I2C_APPS_CLK		61
+#define GCC_BLSP1_QUP3_SPI_APPS_CLK		62
+#define GCC_BLSP1_QUP4_I2C_APPS_CLK		63
+#define GCC_BLSP1_QUP4_SPI_APPS_CLK		64
+#define GCC_BLSP1_UART1_APPS_CLK		65
+#define GCC_BLSP1_UART2_APPS_CLK		66
+#define GCC_BLSP2_QUP1_I2C_APPS_CLK		67
+#define GCC_BLSP2_QUP1_SPI_APPS_CLK		68
+#define GCC_BLSP2_QUP2_I2C_APPS_CLK		69
+#define GCC_BLSP2_QUP2_SPI_APPS_CLK		70
+#define GCC_BLSP2_QUP3_I2C_APPS_CLK		71
+#define GCC_BLSP2_QUP3_SPI_APPS_CLK		72
+#define GCC_BLSP2_QUP4_I2C_APPS_CLK		73
+#define GCC_BLSP2_QUP4_SPI_APPS_CLK		74
+#define GCC_BLSP2_UART1_APPS_CLK		75
+#define GCC_BLSP2_UART2_APPS_CLK		76
+#define GCC_CAMSS_CCI_AHB_CLK			77
+#define GCC_CAMSS_CCI_CLK			78
+#define GCC_CAMSS_CPP_AHB_CLK			79
+#define GCC_CAMSS_CPP_AXI_CLK			80
+#define GCC_CAMSS_CPP_CLK			81
+#define GCC_CAMSS_CSI0_AHB_CLK			82
+#define GCC_CAMSS_CSI0_CLK			83
+#define GCC_CAMSS_CSI0PHY_CLK			84
+#define GCC_CAMSS_CSI0PIX_CLK			85
+#define GCC_CAMSS_CSI0RDI_CLK			86
+#define GCC_CAMSS_CSI1_AHB_CLK			87
+#define GCC_CAMSS_CSI1_CLK			88
+#define GCC_CAMSS_CSI1PHY_CLK			89
+#define GCC_CAMSS_CSI1PIX_CLK			90
+#define GCC_CAMSS_CSI1RDI_CLK			91
+#define GCC_CAMSS_CSI2_AHB_CLK			92
+#define GCC_CAMSS_CSI2_CLK			93
+#define GCC_CAMSS_CSI2PHY_CLK			94
+#define GCC_CAMSS_CSI2PIX_CLK			95
+#define GCC_CAMSS_CSI2RDI_CLK			96
+#define GCC_CAMSS_CSI_VFE0_CLK			97
+#define GCC_CAMSS_CSI_VFE1_CLK			98
+#define GCC_CAMSS_GP0_CLK			99
+#define GCC_CAMSS_GP1_CLK			100
+#define GCC_CAMSS_ISPIF_AHB_CLK			101
+#define GCC_CAMSS_JPEG0_CLK			102
+#define GCC_CAMSS_JPEG_AHB_CLK			103
+#define GCC_CAMSS_JPEG_AXI_CLK			104
+#define GCC_CAMSS_MCLK0_CLK			105
+#define GCC_CAMSS_MCLK1_CLK			106
+#define GCC_CAMSS_MCLK2_CLK			107
+#define GCC_CAMSS_MICRO_AHB_CLK			108
+#define GCC_CAMSS_CSI0PHYTIMER_CLK		109
+#define GCC_CAMSS_CSI1PHYTIMER_CLK		110
+#define GCC_CAMSS_AHB_CLK			111
+#define GCC_CAMSS_TOP_AHB_CLK			112
+#define GCC_CAMSS_VFE0_CLK			113
+#define GCC_CAMSS_VFE_AHB_CLK			114
+#define GCC_CAMSS_VFE_AXI_CLK			115
+#define GCC_CAMSS_VFE1_AHB_CLK			116
+#define GCC_CAMSS_VFE1_AXI_CLK			117
+#define GCC_CAMSS_VFE1_CLK			118
+#define GCC_DCC_CLK				119
+#define GCC_GP1_CLK				120
+#define GCC_GP2_CLK				121
+#define GCC_GP3_CLK				122
+#define GCC_MDSS_AHB_CLK			123
+#define GCC_MDSS_AXI_CLK			124
+#define GCC_MDSS_ESC0_CLK			125
+#define GCC_MDSS_ESC1_CLK			126
+#define GCC_MDSS_MDP_CLK			127
+#define GCC_MDSS_VSYNC_CLK			128
+#define GCC_MSS_CFG_AHB_CLK			129
+#define GCC_MSS_Q6_BIMC_AXI_CLK			130
+#define GCC_PDM2_CLK				131
+#define GCC_PRNG_AHB_CLK			132
+#define GCC_PDM_AHB_CLK				133
+#define GCC_RBCPR_GFX_AHB_CLK			134
+#define GCC_RBCPR_GFX_CLK			135
+#define GCC_SDCC1_AHB_CLK			136
+#define GCC_SDCC1_APPS_CLK			137
+#define GCC_SDCC1_ICE_CORE_CLK			138
+#define GCC_SDCC2_AHB_CLK			139
+#define GCC_SDCC2_APPS_CLK			140
+#define GCC_SDCC3_AHB_CLK			141
+#define GCC_SDCC3_APPS_CLK			142
+#define GCC_USB2A_PHY_SLEEP_CLK			143
+#define GCC_USB_HS_PHY_CFG_AHB_CLK		144
+#define GCC_USB_FS_AHB_CLK			145
+#define GCC_USB_FS_IC_CLK			146
+#define GCC_USB_FS_SYSTEM_CLK			147
+#define GCC_USB_HS_AHB_CLK			148
+#define GCC_USB_HS_SYSTEM_CLK			149
+#define GCC_VENUS0_AHB_CLK			150
+#define GCC_VENUS0_AXI_CLK			151
+#define GCC_VENUS0_CORE0_VCODEC0_CLK		152
+#define GCC_VENUS0_CORE1_VCODEC0_CLK		153
+#define GCC_VENUS0_VCODEC0_CLK			154
+#define GCC_APSS_AHB_CLK			155
+#define GCC_APSS_AXI_CLK			156
+#define GCC_BLSP1_AHB_CLK			157
+#define GCC_BLSP2_AHB_CLK			158
+#define GCC_BOOT_ROM_AHB_CLK			159
+#define GCC_CRYPTO_AHB_CLK			160
+#define GCC_CRYPTO_AXI_CLK			161
+#define GCC_CRYPTO_CLK				162
+#define GCC_CPP_TBU_CLK				163
+#define GCC_APSS_TCU_CLK			164
+#define GCC_JPEG_TBU_CLK			165
+#define GCC_MDP_RT_TBU_CLK			166
+#define GCC_MDP_TBU_CLK				167
+#define GCC_SMMU_CFG_CLK			168
+#define GCC_VENUS_1_TBU_CLK			169
+#define GCC_VENUS_TBU_CLK			170
+#define GCC_VFE1_TBU_CLK			171
+#define GCC_VFE_TBU_CLK				172
+#define GCC_APS_0_CLK				173
+#define GCC_APS_1_CLK				174
+#define APS_0_CLK_SRC				175
+#define APS_1_CLK_SRC				176
+#define APSS_AHB_CLK_SRC			177
+#define BLSP1_QUP1_I2C_APPS_CLK_SRC		178
+#define BLSP1_QUP1_SPI_APPS_CLK_SRC		179
+#define BLSP1_QUP2_I2C_APPS_CLK_SRC		180
+#define BLSP1_QUP2_SPI_APPS_CLK_SRC		181
+#define BLSP1_QUP3_I2C_APPS_CLK_SRC		182
+#define BLSP1_QUP3_SPI_APPS_CLK_SRC		183
+#define BLSP1_QUP4_I2C_APPS_CLK_SRC		184
+#define BLSP1_QUP4_SPI_APPS_CLK_SRC		185
+#define BLSP1_UART1_APPS_CLK_SRC		186
+#define BLSP1_UART2_APPS_CLK_SRC		187
+#define BLSP2_QUP1_I2C_APPS_CLK_SRC		188
+#define BLSP2_QUP1_SPI_APPS_CLK_SRC		189
+#define BLSP2_QUP2_I2C_APPS_CLK_SRC		190
+#define BLSP2_QUP2_SPI_APPS_CLK_SRC		191
+#define BLSP2_QUP3_I2C_APPS_CLK_SRC		192
+#define BLSP2_QUP3_SPI_APPS_CLK_SRC		193
+#define BLSP2_QUP4_I2C_APPS_CLK_SRC		194
+#define BLSP2_QUP4_SPI_APPS_CLK_SRC		195
+#define BLSP2_UART1_APPS_CLK_SRC		196
+#define BLSP2_UART2_APPS_CLK_SRC		197
+#define CCI_CLK_SRC				198
+#define CPP_CLK_SRC				199
+#define CSI0_CLK_SRC				200
+#define CSI1_CLK_SRC				201
+#define CSI2_CLK_SRC				202
+#define CAMSS_GP0_CLK_SRC			203
+#define CAMSS_GP1_CLK_SRC			204
+#define JPEG0_CLK_SRC				205
+#define MCLK0_CLK_SRC				206
+#define MCLK1_CLK_SRC				207
+#define MCLK2_CLK_SRC				208
+#define CSI0PHYTIMER_CLK_SRC			209
+#define CSI1PHYTIMER_CLK_SRC			210
+#define CAMSS_TOP_AHB_CLK_SRC			211
+#define VFE0_CLK_SRC				212
+#define VFE1_CLK_SRC				213
+#define CRYPTO_CLK_SRC				214
+#define GP1_CLK_SRC				215
+#define GP2_CLK_SRC				216
+#define GP3_CLK_SRC				217
+#define ESC0_CLK_SRC				218
+#define ESC1_CLK_SRC				219
+#define MDP_CLK_SRC				220
+#define VSYNC_CLK_SRC				221
+#define PDM2_CLK_SRC				222
+#define RBCPR_GFX_CLK_SRC			223
+#define SDCC1_APPS_CLK_SRC			224
+#define SDCC1_ICE_CORE_CLK_SRC			225
+#define SDCC2_APPS_CLK_SRC			226
+#define SDCC3_APPS_CLK_SRC			227
+#define USB_FS_IC_CLK_SRC			228
+#define USB_FS_SYSTEM_CLK_SRC			229
+#define USB_HS_SYSTEM_CLK_SRC			230
+#define VCODEC0_CLK_SRC				231
+#define GCC_QUSB2_PHY_CLK			232
+#define GCC_USB2_HS_PHY_ONLY_CLK		233
+#define GCC_MDSS_BYTE0_CLK_SRC			234
+#define GCC_MDSS_BYTE1_CLK_SRC			235
+#define GCC_MDSS_BYTE0_CLK			236
+#define GCC_MDSS_BYTE1_CLK			237
+#define GCC_MDSS_PCLK0_CLK_SRC			238
+#define GCC_MDSS_PCLK1_CLK_SRC			239
+#define GCC_MDSS_PCLK0_CLK			240
+#define GCC_MDSS_PCLK1_CLK			241
+#define GCC_GFX3D_CLK_SRC			242
+#define GCC_GFX3D_OXILI_CLK			243
+#define GCC_GFX3D_BIMC_CLK			244
+#define GCC_GFX3D_OXILI_AHB_CLK			245
+#define GCC_GFX3D_OXILI_AON_CLK			246
+#define GCC_GFX3D_OXILI_GMEM_CLK		247
+#define GCC_GFX3D_OXILI_TIMER_CLK		248
+#define GCC_GFX3D_TBU0_CLK			249
+#define GCC_GFX3D_TBU1_CLK			250
+#define GCC_GFX3D_TCU_CLK			251
+#define GCC_GFX3D_GTCU_AHB_CLK			252
+
+/* GCC block resets */
+#define RST_CAMSS_MICRO_BCR			0
+#define RST_USB_HS_BCR				1
+#define RST_QUSB2_PHY_BCR			2
+#define RST_USB2_HS_PHY_ONLY_BCR		3
+#define RST_USB_HS_PHY_CFG_AHB_BCR		4
+#define RST_USB_FS_BCR				5
+#define RST_CAMSS_CSI1PIX_BCR			6
+#define RST_CAMSS_CSI_VFE1_BCR			8
+#define RST_CAMSS_VFE1_BCR			9
+#define RST_CAMSS_CPP_BCR			10
+
+/* GDSCs */
+#define VENUS_GDSC				0
+#define VENUS_CORE0_GDSC			1
+#define VENUS_CORE1_GDSC			2
+#define MDSS_GDSC				3
+#define JPEG_GDSC				4
+#define VFE0_GDSC				5
+#define VFE1_GDSC				6
+#define CPP_GDSC				7
+#define OXILI_GX_GDSC				8
+#define OXILI_CX_GDSC				9
+
+#endif /* _DT_BINDINGS_CLK_MSM_GCC_8976_H */
-- 
2.21.0

