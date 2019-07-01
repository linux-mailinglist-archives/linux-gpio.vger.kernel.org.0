Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D095B7A4
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbfGAJN5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:13:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51891 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbfGAJNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:22 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so15008910wma.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tqPX2JOS7PxzKu4kEaqrRL6KdFEYnldfjy2nAu15Was=;
        b=Ec0ncqa/5L0s6FucgC7Kc9ztadmHeeVsjw6u2xHFMfg4rUk6V7dHalQaSmwed4ubck
         YddFlTxLQmhye4WJpK/b6f3qB/RvZzhKAd2fWmxlqarOdYhfyrDUMrntN2/u6DvVx3CA
         E61tyfF9fIOBgpnkxR67tM6C7Mcu3MHwQ9BPNk9vhMd89Uv2VVJwR4HyM9vMAYR51N3w
         WOLYYTlwyGZdh5lzgwv7xoV8ujsQ7x2t+uNkppd5odV7VgLdyVUg8GT/9+EFTkIA+ez+
         uBl9i79txeX7sRiQdNmasOlH8roYtTqgAZ/SGXgBR3OJJEkRmsDyk+BFIinMH22FMzTC
         YnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tqPX2JOS7PxzKu4kEaqrRL6KdFEYnldfjy2nAu15Was=;
        b=sEmBz1zXQ441nuz5uF4GryCVuxYpknMwOKf+HeenulvMN/0BjUcV7VoV8ea8t7yaml
         juJO7jf1voVLNUSr+9tpglihmDjbvze7Y2koCHB0hnyxJML+1PanxBEOEKi7Ob5HE/S0
         T7y3fHppXDhvSzAStwxRbT60Gx0Tc5tuH4cqHTvHa1OO4glTov/r+qlD3fh8SzeoSw6G
         YH4GDqPmInSm2gRQr0dwFa0XWAyDnXdsVtkVGVs33mQyJeAWqb1yqEJDeVx8FfKPk8ab
         MIQSDPLGSq67797qFBOnE1V2nSKzQ721rcBV6xhlOCUc5NFzPlEWP2/jiyQG8rv2zPTY
         quSQ==
X-Gm-Message-State: APjAAAVMZQQeW4+QIJBPVfJMAJM0jAqJWHFkU7s8tDdOF3B2mdD5tqlq
        COPSSIyyKdRffrDpSsOVTM9v1w==
X-Google-Smtp-Source: APXvYqzsledssU1TMjGOGhq3eIqMPFQAfS8iNYPDXJJFWkRCJhXDqIYcZGPS2KrIet0yAX8Ha7LE4A==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr15455990wmb.4.1561972397925;
        Mon, 01 Jul 2019 02:13:17 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:17 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 07/14] clk: meson: g12a: add notifiers to handle cpu clock change
Date:   Mon,  1 Jul 2019 11:12:51 +0200
Message-Id: <20190701091258.3870-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In order to implement clock switching for the CLKID_CPU_CLK and
CLKID_CPUB_CLK, notifiers are added on specific points of the
clock tree :

cpu_clk / cpub_clk
|   \- cpu_clk_dyn
|      |  \- cpu_clk_premux0
|      |        |- cpu_clk_postmux0
|      |        |    |- cpu_clk_dyn0_div
|      |        |    \- xtal/fclk_div2/fclk_div3
|      |        \- xtal/fclk_div2/fclk_div3
|      \- cpu_clk_premux1
|            |- cpu_clk_postmux1
|            |    |- cpu_clk_dyn1_div
|            |    \- xtal/fclk_div2/fclk_div3
|            \- xtal/fclk_div2/fclk_div3
\ sys_pll / sys1_pll

This for each cluster, a single one for G12A, two for G12B.

Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_REPARENT,
to be used as "parking" clock in a safe clock frequency.

A notifier is added on each cpu_clk_premux0 to detech when CCF want to
change the frequency of the cpu_clk_dyn tree.
In this notifier, the cpu_clk_premux1 tree is configured to use the xtal
clock and then the cpu_clk_dyn is switch to cpu_clk_premux1 while CCF
updates the cpu_clk_premux0 tree.

A notifier is added on each sys_pll/sys1_pll to detect when CCF wants to
change the PLL clock source of the cpu_clk.
In this notifier, the cpu_clk is switched to cpu_clk_dyn while CCF
updates the sys_pll/sys1_pll frequency.

A third small notifier is added on each cpu_clk / cpub_clk and cpu_clk_dyn,
add a small delay at PRE_RATE_CHANGE/POST_RATE_CHANGE to let the other
notofiers change propagate before changing the cpu_clk_premux0 and sys_pll
clock trees.

This notifier set permits switching the cpu_clk / cpub_clk without any
glitches and using a safe parking clock while switching between sub-GHz
clocks using the cpu_clk_dyn tree.

This setup has been tested and validated on the Amlogic G12A and G12B
SoCs running the arm64 cpuburn at [1] and cycling between all the possible
cpufreq translations of each cluster and checking the final frequency using
the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 500 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 468 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index db1c4ed9d54e..3d2c2ac9a46d 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 
 #include "clk-input.h"
 #include "clk-mpll.h"
@@ -85,16 +86,9 @@ static struct clk_regmap g12a_fixed_pll = {
 	},
 };
 
-/*
- * Internal sys pll emulation configuration parameters
- */
-static const struct reg_sequence g12a_sys_init_regs[] = {
-	{ .reg = HHI_SYS_PLL_CNTL1,	.def = 0x00000000 },
-	{ .reg = HHI_SYS_PLL_CNTL2,	.def = 0x00000000 },
-	{ .reg = HHI_SYS_PLL_CNTL3,	.def = 0x48681c00 },
-	{ .reg = HHI_SYS_PLL_CNTL4,	.def = 0x88770290 },
-	{ .reg = HHI_SYS_PLL_CNTL5,	.def = 0x39272000 },
-	{ .reg = HHI_SYS_PLL_CNTL6,	.def = 0x56540000 },
+static const struct pll_mult_range g12a_sys_pll_mult_range = {
+	.min = 128,
+	.max = 250,
 };
 
 static struct clk_regmap g12a_sys_pll_dco = {
@@ -124,14 +118,15 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 29,
 			.width   = 1,
 		},
-		.init_regs = g12a_sys_init_regs,
-		.init_count = ARRAY_SIZE(g12a_sys_init_regs),
+		.range = &g12a_sys_pll_mult_range,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll_dco",
-		.ops = &meson_clk_pll_ro_ops,
+		.ops = &meson_clk_pll_ops,
 		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
+		/* This clock feeds the CPU, avoid disabling it */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -144,9 +139,10 @@ static struct clk_regmap g12a_sys_pll = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sys_pll",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_names = (const char *[]){ "sys_pll_dco" },
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -177,12 +173,15 @@ static struct clk_regmap g12b_sys1_pll_dco = {
 			.shift   = 29,
 			.width   = 1,
 		},
+		.range = &g12a_sys_pll_mult_range,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sys1_pll_dco",
-		.ops = &meson_clk_pll_ro_ops,
+		.ops = &meson_clk_pll_ops,
 		.parent_names = (const char *[]){ IN_PREFIX "xtal" },
 		.num_parents = 1,
+		/* This clock feeds the CPU, avoid disabling it */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -195,9 +194,10 @@ static struct clk_regmap g12b_sys1_pll = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "sys1_pll",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &clk_regmap_divider_ops,
 		.parent_names = (const char *[]){ "sys1_pll_dco" },
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -266,7 +266,7 @@ static struct clk_regmap g12a_cpu_clk_premux0 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ IN_PREFIX "xtal",
 						  "fclk_div2",
 						  "fclk_div3" },
@@ -275,6 +275,38 @@ static struct clk_regmap g12a_cpu_clk_premux0 = {
 };
 
 /* Datasheet names this field as "mux0_divn_tcnt" */
+#define SYS_CPU_DYN_ENABLE	BIT(26)
+
+/* This divider uses bit 26 to take change in account */
+static int g12a_cpu_clk_mux0_div_set_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, div->table, div->width,
+			      div->flags);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << div->shift;
+
+	regmap_update_bits(clk->map, HHI_SYS_CPU_CLK_CNTL0,
+			   SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
+
+	return regmap_update_bits(clk->map, div->offset,
+				  clk_div_mask(div->width) << div->shift |
+				  SYS_CPU_DYN_ENABLE, val);
+};
+
+const struct clk_ops g12a_cpu_clk_mux0_div_ops = {
+	.recalc_rate = clk_regmap_div_recalc_rate,
+	.round_rate = clk_regmap_div_round_rate,
+	.set_rate = g12a_cpu_clk_mux0_div_set_rate,
+};
+
 static struct clk_regmap g12a_cpu_clk_mux0_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
@@ -283,9 +315,10 @@ static struct clk_regmap g12a_cpu_clk_mux0_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &g12a_cpu_clk_mux0_div_ops,
 		.parent_names = (const char *[]){ "cpu_clk_dyn0_sel" },
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -298,10 +331,11 @@ static struct clk_regmap g12a_cpu_clk_postmux0 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpu_clk_dyn0_sel",
 						  "cpu_clk_dyn0_div" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -314,11 +348,13 @@ static struct clk_regmap g12a_cpu_clk_premux1 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn1_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ IN_PREFIX "xtal",
 						  "fclk_div2",
 						  "fclk_div3" },
 		.num_parents = 3,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -346,10 +382,12 @@ static struct clk_regmap g12a_cpu_clk_postmux1 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn1",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpu_clk_dyn1_sel",
 						  "cpu_clk_dyn1_div" },
 		.num_parents = 2,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -362,10 +400,11 @@ static struct clk_regmap g12a_cpu_clk_dyn = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpu_clk_dyn0",
 						  "cpu_clk_dyn1" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -378,10 +417,11 @@ static struct clk_regmap g12a_cpu_clk = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpu_clk_dyn",
 						  "sys_pll" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -394,10 +434,11 @@ static struct clk_regmap g12b_cpu_clk = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpu_clk_dyn",
 						  "sys1_pll" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -410,7 +451,7 @@ static struct clk_regmap g12b_cpub_clk_premux0 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ IN_PREFIX "xtal",
 						  "fclk_div2",
 						  "fclk_div3" },
@@ -418,6 +459,37 @@ static struct clk_regmap g12b_cpub_clk_premux0 = {
 	},
 };
 
+/* This divider uses bit 26 to take change in account */
+static int g12b_cpub_clk_mux0_div_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, div->table, div->width,
+			      div->flags);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << div->shift;
+
+	regmap_update_bits(clk->map, HHI_SYS_CPUB_CLK_CNTL,
+			   SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
+
+	return regmap_update_bits(clk->map, div->offset,
+				  clk_div_mask(div->width) << div->shift |
+				  SYS_CPU_DYN_ENABLE, val);
+};
+
+static const struct clk_ops g12b_cpub_clk_mux0_div_ops = {
+	.recalc_rate = clk_regmap_div_recalc_rate,
+	.round_rate = clk_regmap_div_round_rate,
+	.set_rate = g12b_cpub_clk_mux0_div_set_rate,
+};
+
 /* Datasheet names this field as "mux0_divn_tcnt" */
 static struct clk_regmap g12b_cpub_clk_mux0_div = {
 	.data = &(struct clk_regmap_div_data){
@@ -427,9 +499,10 @@ static struct clk_regmap g12b_cpub_clk_mux0_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0_div",
-		.ops = &clk_regmap_divider_ro_ops,
+		.ops = &g12b_cpub_clk_mux0_div_ops,
 		.parent_names = (const char *[]){ "cpub_clk_dyn0_sel" },
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -442,10 +515,11 @@ static struct clk_regmap g12b_cpub_clk_postmux0 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpub_clk_dyn0_sel",
 						  "cpub_clk_dyn0_div" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -458,11 +532,13 @@ static struct clk_regmap g12b_cpub_clk_premux1 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn1_sel",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ IN_PREFIX "xtal",
 						  "fclk_div2",
 						  "fclk_div3" },
 		.num_parents = 3,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -490,10 +566,12 @@ static struct clk_regmap g12b_cpub_clk_postmux1 = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn1",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpub_clk_dyn1_sel",
 						  "cpub_clk_dyn1_div" },
 		.num_parents = 2,
+		/* This sub-tree is used a parking clock */
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -506,10 +584,11 @@ static struct clk_regmap g12b_cpub_clk_dyn = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpub_clk_dyn0",
 						  "cpub_clk_dyn1" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -522,13 +601,225 @@ static struct clk_regmap g12b_cpub_clk = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk",
-		.ops = &clk_regmap_mux_ro_ops,
+		.ops = &clk_regmap_mux_ops,
 		.parent_names = (const char *[]){ "cpub_clk_dyn",
 						  "sys_pll" },
 		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
+static int g12a_cpu_clk_mux_notifier_cb(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	if (event == POST_RATE_CHANGE || event == PRE_RATE_CHANGE) {
+		/* Wait for clock propagation before/after changing the mux */
+		udelay(100);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block g12a_cpu_clk_mux_nb = {
+	.notifier_call = g12a_cpu_clk_mux_notifier_cb,
+};
+
+struct g12a_cpu_clk_postmux_nb_data {
+	struct notifier_block nb;
+	struct clk_hw *xtal;
+	struct clk_hw *cpu_clk_dyn;
+	struct clk_hw *cpu_clk_postmux0;
+	struct clk_hw *cpu_clk_postmux1;
+	struct clk_hw *cpu_clk_premux1;
+};
+
+static int g12a_cpu_clk_postmux_notifier_cb(struct notifier_block *nb,
+					 unsigned long event, void *data)
+{
+	struct g12a_cpu_clk_postmux_nb_data *nb_data =
+		container_of(nb, struct g12a_cpu_clk_postmux_nb_data, nb);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		/*
+		 * This notifier means cpu_clk_postmux0 clock will be changed
+		 * to feed cpu_clk, this is the current path :
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_postmux0
+		 *                \- cpu_clk_muxX_div
+		 *                      \- cpu_clk_premux0
+		 *				\- fclk_div3 or fclk_div2
+		 *		OR
+		 *                \- cpu_clk_premux0
+		 *			\- fclk_div3 or fclk_div2
+		 */
+
+		/* Setup cpu_clk_premux1 to xtal */
+		clk_hw_set_parent(nb_data->cpu_clk_premux1,
+				  nb_data->xtal);
+
+		/* Setup cpu_clk_postmux1 to bypass divider */
+		clk_hw_set_parent(nb_data->cpu_clk_postmux1,
+				  nb_data->cpu_clk_premux1);
+
+		/* Switch to parking clk on cpu_clk_postmux1 */
+		clk_hw_set_parent(nb_data->cpu_clk_dyn,
+				  nb_data->cpu_clk_postmux1);
+
+		/*
+		 * Now, cpu_clk is 24MHz in the current path :
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_postmux1
+		 *                \- cpu_clk_premux1
+		 *                      \- xtal
+		 */
+
+		udelay(100);
+
+		return NOTIFY_OK;
+
+	case POST_RATE_CHANGE:
+		/*
+		 * The cpu_clk_postmux0 has ben updated, now switch back
+		 * cpu_clk_dyn to cpu_clk_postmux0 and take the changes
+		 * in account.
+		 */
+
+		/* Configure cpu_clk_dyn back to cpu_clk_postmux0 */
+		clk_hw_set_parent(nb_data->cpu_clk_dyn,
+				  nb_data->cpu_clk_postmux0);
+
+		/*
+		 * new path :
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_postmux0
+		 *                \- cpu_clk_muxX_div
+		 *                      \- cpu_clk_premux0
+		 *				\- fclk_div3 or fclk_div2
+		 *		OR
+		 *                \- cpu_clk_premux0
+		 *			\- fclk_div3 or fclk_div2
+		 */
+
+		udelay(100);
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct g12a_cpu_clk_postmux_nb_data g12a_cpu_clk_postmux0_nb_data = {
+	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
+	.cpu_clk_postmux0 = &g12a_cpu_clk_postmux0.hw,
+	.cpu_clk_postmux1 = &g12a_cpu_clk_postmux1.hw,
+	.cpu_clk_premux1 = &g12a_cpu_clk_premux1.hw,
+	.nb.notifier_call = g12a_cpu_clk_postmux_notifier_cb,
+};
+
+static struct g12a_cpu_clk_postmux_nb_data g12b_cpub_clk_postmux0_nb_data = {
+	.cpu_clk_dyn = &g12b_cpub_clk_dyn.hw,
+	.cpu_clk_postmux0 = &g12b_cpub_clk_postmux0.hw,
+	.cpu_clk_postmux1 = &g12b_cpub_clk_postmux1.hw,
+	.cpu_clk_premux1 = &g12b_cpub_clk_premux1.hw,
+	.nb.notifier_call = g12a_cpu_clk_postmux_notifier_cb,
+};
+
+struct g12a_sys_pll_nb_data {
+	struct notifier_block nb;
+	struct clk_hw *sys_pll;
+	struct clk_hw *cpu_clk;
+	struct clk_hw *cpu_clk_dyn;
+};
+
+static int g12a_sys_pll_notifier_cb(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct g12a_sys_pll_nb_data *nb_data =
+		container_of(nb, struct g12a_sys_pll_nb_data, nb);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		/*
+		 * This notifier means sys_pll clock will be changed
+		 * to feed cpu_clk, this the current path :
+		 * cpu_clk
+		 *    \- sys_pll
+		 *          \- sys_pll_dco
+		 */
+
+		/* Configure cpu_clk to use cpu_clk_dyn */
+		clk_hw_set_parent(nb_data->cpu_clk,
+				  nb_data->cpu_clk_dyn);
+
+		/*
+		 * Now, cpu_clk uses the dyn path
+		 * cpu_clk
+		 *    \- cpu_clk_dyn
+		 *          \- cpu_clk_dynX
+		 *                \- cpu_clk_dynX_sel
+		 *		     \- cpu_clk_dynX_div
+		 *                      \- xtal/fclk_div2/fclk_div3
+		 *                   \- xtal/fclk_div2/fclk_div3
+		 */
+
+		udelay(100);
+
+		return NOTIFY_OK;
+
+	case POST_RATE_CHANGE:
+		/*
+		 * The sys_pll has ben updated, now switch back cpu_clk to
+		 * sys_pll
+		 */
+
+		/* Configure cpu_clk to use sys_pll */
+		clk_hw_set_parent(nb_data->cpu_clk,
+				  nb_data->sys_pll);
+
+		udelay(100);
+
+		/* new path :
+		 * cpu_clk
+		 *    \- sys_pll
+		 *          \- sys_pll_dco
+		 */
+
+		return NOTIFY_OK;
+
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct g12a_sys_pll_nb_data g12a_sys_pll_nb_data = {
+	.sys_pll = &g12a_sys_pll.hw,
+	.cpu_clk = &g12a_cpu_clk.hw,
+	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
+	.nb.notifier_call = g12a_sys_pll_notifier_cb,
+};
+
+/* G12B first CPU cluster uses sys1_pll */
+static struct g12a_sys_pll_nb_data g12b_cpu_clk_sys1_pll_nb_data = {
+	.sys_pll = &g12b_sys1_pll.hw,
+	.cpu_clk = &g12b_cpu_clk.hw,
+	.cpu_clk_dyn = &g12a_cpu_clk_dyn.hw,
+	.nb.notifier_call = g12a_sys_pll_notifier_cb,
+};
+
+/* G12B second CPU cluster uses sys_pll */
+static struct g12a_sys_pll_nb_data g12b_cpub_clk_sys_pll_nb_data = {
+	.sys_pll = &g12a_sys_pll.hw,
+	.cpu_clk = &g12b_cpub_clk.hw,
+	.cpu_clk_dyn = &g12b_cpub_clk_dyn.hw,
+	.nb.notifier_call = g12a_sys_pll_notifier_cb,
+};
+
 static struct clk_regmap g12a_cpu_clk_div16_en = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_SYS_CPU_CLK_CNTL1,
@@ -3792,18 +4083,163 @@ static const struct reg_sequence g12a_init_regs[] = {
 	{ .reg = HHI_MPLL_CNTL0,	.def = 0x00000543 },
 };
 
+static int meson_g12a_dvfs_setup_common(struct platform_device *pdev,
+					struct clk_hw **hws)
+{
+	const char *notifier_clk_name;
+	struct clk *notifier_clk;
+	struct clk_hw *xtal;
+	int ret;
+
+	xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);
+
+	/* Setup clock notifier for cpu_clk_postmux0 */
+	g12a_cpu_clk_postmux0_nb_data.xtal = xtal;
+	notifier_clk_name = clk_hw_get_name(&g12a_cpu_clk_postmux0.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk,
+				    &g12a_cpu_clk_postmux0_nb_data.nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpu_clk_postmux0 notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for cpu_clk_dyn mux */
+	notifier_clk_name = clk_hw_get_name(&g12a_cpu_clk_dyn.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpu_clk_dyn notifier\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int meson_g12b_dvfs_setup(struct platform_device *pdev)
+{
+	struct clk_hw **hws = g12b_hw_onecell_data.hws;
+	const char *notifier_clk_name;
+	struct clk *notifier_clk;
+	struct clk_hw *xtal;
+	int ret;
+
+	ret = meson_g12a_dvfs_setup_common(pdev, hws);
+	if (ret)
+		return ret;
+
+	xtal = clk_hw_get_parent_by_index(hws[CLKID_CPU_CLK_DYN1_SEL], 0);
+
+	/* Setup clock notifier for cpu_clk mux */
+	notifier_clk_name = clk_hw_get_name(&g12b_cpu_clk.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpu_clk notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for sys1_pll */
+	notifier_clk_name = clk_hw_get_name(&g12b_sys1_pll.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk,
+				    &g12b_cpu_clk_sys1_pll_nb_data.nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the sys1_pll notifier\n");
+		return ret;
+	}
+
+	/* Add notifiers for the second CPU cluster */
+
+	/* Setup clock notifier for cpub_clk_postmux0 */
+	g12b_cpub_clk_postmux0_nb_data.xtal = xtal;
+	notifier_clk_name = clk_hw_get_name(&g12b_cpub_clk_postmux0.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk,
+				    &g12b_cpub_clk_postmux0_nb_data.nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpub_clk_postmux0 notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for cpub_clk_dyn mux */
+	notifier_clk_name = clk_hw_get_name(&g12b_cpub_clk_dyn.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpub_clk_dyn notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for cpub_clk mux */
+	notifier_clk_name = clk_hw_get_name(&g12b_cpub_clk.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpub_clk notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for sys_pll */
+	notifier_clk_name = clk_hw_get_name(&g12a_sys_pll.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk,
+				    &g12b_cpub_clk_sys_pll_nb_data.nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the sys_pll notifier\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+
+static int meson_g12a_dvfs_setup(struct platform_device *pdev)
+{
+	struct clk_hw **hws = g12a_hw_onecell_data.hws;
+	const char *notifier_clk_name;
+	struct clk *notifier_clk;
+	int ret;
+
+	ret = meson_g12a_dvfs_setup_common(pdev, hws);
+	if (ret)
+		return ret;
+
+	/* Setup clock notifier for cpu_clk mux */
+	notifier_clk_name = clk_hw_get_name(&g12a_cpu_clk.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk, &g12a_cpu_clk_mux_nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the cpu_clk notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for sys_pll */
+	notifier_clk_name = clk_hw_get_name(&g12a_sys_pll.hw);
+	notifier_clk = __clk_lookup(notifier_clk_name);
+	ret = clk_notifier_register(notifier_clk, &g12a_sys_pll_nb_data.nb);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register the sys_pll notifier\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct meson_eeclkc_data g12a_clkc_data = {
 	.regmap_clks = g12a_clk_regmaps,
 	.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
 	.hw_onecell_data = &g12a_hw_onecell_data,
 	.init_regs = g12a_init_regs,
 	.init_count = ARRAY_SIZE(g12a_init_regs),
+	.setup = meson_g12a_dvfs_setup,
 };
 
 static const struct meson_eeclkc_data g12b_clkc_data = {
 	.regmap_clks = g12a_clk_regmaps,
 	.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
-	.hw_onecell_data = &g12b_hw_onecell_data
+	.hw_onecell_data = &g12b_hw_onecell_data,
+	.setup = meson_g12b_dvfs_setup,
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.21.0

