Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DAB2D214
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbfE1XJT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:19 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9128 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727463AbfE1XJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf8c0001>; Tue, 28 May 2019 16:09:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 May 2019 16:09:01 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:09:00 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:09:00 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8c000e>; Tue, 28 May 2019 16:09:00 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>, <skomatineni@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH V2 07/12] clk: tegra: support for Tegra210 clocks suspend-resume
Date:   Tue, 28 May 2019 16:08:51 -0700
Message-ID: <1559084936-4610-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084941; bh=Do9xE48DzoI0s2vOPh1lbLxEP7Ag5+Tzi57J8kcPVsc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=XJzVTWDaPtDTiGHC3lX6eKEOsQEQtDOLYaGCIr43BbpXemCcQuGto4vCMH9eEgY+l
         rlpgLfFDoCJ5pluP0dU6Wp68XvnzHTnpYjBk9aeQHAeUA3VRbkfg1GXzC6eKBLrrrt
         Q8p+ViIhBR8yEP5MAIFLDAkEjUkbWTWEBYMUyInhVya9usxV9aZRi3WwUrSIYaXk5R
         l5JcLSN//XJBV94Ez8iMGSkSLaAIHnsC89QbKkTCgscWTgMNTMJtAvMl5HhzNuzKu4
         GbPNkrFWe2BW6kDhwpmQeUHDGZNwSVyvp/PAjc+9RJZEctH4M+DtE7DWyBrveBxDzC
         jdhOrRR8Jnx1g==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds system suspend and resume support for Tegra210
clocks.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 382 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 382 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index ed3c7df75d1e..d012b53ca132 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -20,10 +20,12 @@
 #include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/mutex.h>
 #include <linux/clk/tegra.h>
+#include <linux/syscore_ops.h>
 #include <dt-bindings/clock/tegra210-car.h>
 #include <dt-bindings/reset/tegra210-car.h>
 #include <linux/iopoll.h>
@@ -31,6 +33,7 @@
 #include <soc/tegra/pmc.h>
 
 #include "clk.h"
+#include "clk-dfll.h"
 #include "clk-id.h"
 
 /*
@@ -48,6 +51,9 @@
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
 
+#define CLK_OUT_ENB_Y 0x298
+#define CLK_ENB_PLLP_OUT_CPU BIT(31)
+
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
 #define PLLC_MISC0 0x88
@@ -71,6 +77,8 @@
 #define PLLM_MISC1 0x98
 #define PLLM_MISC2 0x9c
 #define PLLP_BASE 0xa0
+#define PLLP_OUTA 0xa4
+#define PLLP_OUTB 0xa8
 #define PLLP_MISC0 0xac
 #define PLLP_MISC1 0x680
 #define PLLA_BASE 0xb0
@@ -227,9 +235,18 @@
 #define XUSB_PLL_CFG0_UTMIPLL_LOCK_DLY		0x3ff
 #define XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK	(0x3ff << 14)
 
+#define SCLK_BURST_POLICY	0x28
+#define SYSTEM_CLK_RATE		0x30
+#define CLK_MASK_ARM		0x44
+#define MISC_CLK_ENB		0x48
+#define CCLKG_BURST_POLICY	0x368
+#define CCLKLP_BURST_POLICY	0x370
+#define CPU_SOFTRST_CTRL	0x380
+#define SYS_CLK_DIV		0x400
 #define SPARE_REG0 0x55c
 #define CLK_M_DIVISOR_SHIFT 2
 #define CLK_M_DIVISOR_MASK 0x3
+#define BURST_POLICY_REG_SIZE 2
 
 #define RST_DFLL_DVCO 0x2f4
 #define DVFS_DFLL_RESET_SHIFT 0
@@ -3381,6 +3398,367 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
 };
 
+#ifdef CONFIG_PM_SLEEP
+static unsigned long pll_c_rate, pll_c2_rate, pll_c3_rate, pll_x_rate;
+static unsigned long pll_c4_rate, pll_d2_rate, pll_dp_rate;
+static unsigned long pll_re_vco_rate, pll_d_rate, pll_a_rate, pll_a1_rate;
+static unsigned long pll_c_out1_rate;
+static unsigned long pll_a_out0_rate, pll_c4_out3_rate;
+static unsigned long pll_p_out_rate[5];
+static unsigned long pll_u_out1_rate, pll_u_out2_rate;
+static unsigned long pll_mb_rate;
+static u32 pll_m_v;
+static u32 pll_p_outa, pll_p_outb;
+static u32 pll_re_out_div, pll_re_out_1;
+static u32 cpu_softrst_ctx[3];
+static u32 cclkg_burst_policy_ctx[2];
+static u32 cclklp_burst_policy_ctx[2];
+static u32 sclk_burst_policy_ctx[3];
+static u32 sclk_ctx, spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;
+
+static struct platform_device *dfll_pdev;
+#define car_readl(_base, _off) \
+	readl_relaxed(clk_base + (_base) + ((_off) * 4))
+#define car_writel(_val, _base, _off) \
+	writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
+
+static u32 *periph_clk_src_ctx;
+struct periph_source_bank {
+	u32 start;
+	u32 end;
+};
+
+static struct periph_source_bank periph_srcs[] = {
+	[0] = {
+		.start = 0x100,
+		.end = 0x198,
+	},
+	[1] = {
+		.start = 0x1a0,
+		.end = 0x1f8,
+	},
+	[2] = {
+		.start = 0x3b4,
+		.end = 0x42c,
+	},
+	[3] = {
+		.start = 0x49c,
+		.end = 0x4b4,
+	},
+	[4] = {
+		.start = 0x560,
+		.end = 0x564,
+	},
+	[5] = {
+		.start = 0x600,
+		.end = 0x678,
+	},
+	[6] = {
+		.start = 0x694,
+		.end = 0x6a0,
+	},
+	[7] = {
+		.start = 0x6b8,
+		.end = 0x718,
+	},
+};
+
+/* This array lists the valid clocks for each periph clk bank */
+static u32 periph_clks_on[] = {
+	0xdcd7dff9,
+	0x87d1f3e7,
+	0xf3fed3fa,
+	0xffc18cfb,
+	0x793fb7ff,
+	0x3fe66fff,
+	0xfc1fc7ff,
+};
+
+static inline unsigned long clk_get_rate_nolock(struct clk *clk)
+{
+	if (IS_ERR_OR_NULL(clk)) {
+		WARN_ON(1);
+		return 0;
+	}
+
+	return clk_hw_get_rate(__clk_get_hw(clk));
+}
+
+static inline struct clk *pll_p_clk(unsigned int x)
+{
+	if (x < 4) {
+		return clks[TEGRA210_CLK_PLL_P_OUT1 + x];
+	} else if (x != 4) {
+		WARN_ON(1);
+		return NULL;
+	} else {
+		return clks[TEGRA210_CLK_PLL_P_OUT5];
+	}
+}
+
+static u32 * __init tegra210_init_suspend_ctx(void)
+{
+	int i, size = 0;
+
+	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
+		size += periph_srcs[i].end - periph_srcs[i].start + 4;
+
+	periph_clk_src_ctx = kmalloc(size, GFP_KERNEL);
+
+	return periph_clk_src_ctx;
+}
+
+static int tegra210_clk_suspend(void)
+{
+	int i;
+	unsigned long off;
+	struct device_node *node;
+	u32 *clk_rst_ctx = periph_clk_src_ctx;
+	u32 val;
+
+	pll_a_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_A]);
+	pll_a_out0_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_A_OUT0]);
+	pll_a1_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_A1]);
+	pll_c2_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_C2]);
+	pll_c3_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_C3]);
+	pll_c_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_C]);
+	pll_c_out1_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_C_OUT1]);
+	pll_x_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_X]);
+	pll_c4_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_C4]);
+	pll_c4_out3_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_C4_OUT3]);
+	pll_dp_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_DP]);
+	pll_d_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_D]);
+	pll_d2_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_D2]);
+	pll_re_vco_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_RE_VCO]);
+	pll_re_out_div = car_readl(PLLRE_BASE, 0) & (0xf << 16);
+	pll_re_out_1 = car_readl(PLLRE_OUT1, 0);
+	pll_u_out1_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_U_OUT1]);
+	pll_u_out2_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_U_OUT2]);
+	pll_mb_rate = clk_get_rate_nolock(clks[TEGRA210_CLK_PLL_MB]);
+	pll_m_v = car_readl(PLLM_BASE, 0);
+	pll_p_outa = car_readl(PLLP_OUTA, 0);
+	pll_p_outb = car_readl(PLLP_OUTB, 0);
+
+	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
+		cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
+
+	for (i = 0; i < ARRAY_SIZE(pll_p_out_rate); i++)
+		pll_p_out_rate[i] = clk_get_rate_nolock(pll_p_clk(i));
+
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++) {
+		cclkg_burst_policy_ctx[i] = car_readl(CCLKG_BURST_POLICY, i);
+		cclklp_burst_policy_ctx[i] = car_readl(CCLKLP_BURST_POLICY, i);
+		sclk_burst_policy_ctx[i] = car_readl(SCLK_BURST_POLICY, i);
+	}
+	sclk_burst_policy_ctx[i] = car_readl(SYS_CLK_DIV, 0);
+
+	sclk_ctx = car_readl(SYSTEM_CLK_RATE, 0);
+	spare_ctx = car_readl(SPARE_REG0, 0);
+	misc_clk_enb_ctx = car_readl(MISC_CLK_ENB, 0);
+	clk_arm_ctx = car_readl(CLK_MASK_ARM, 0);
+
+	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
+		for (off = periph_srcs[i].start; off <= periph_srcs[i].end;
+			off += 4)
+			*clk_rst_ctx++ = car_readl(off, 0);
+
+	if (!dfll_pdev) {
+		node = of_find_compatible_node(NULL, NULL,
+					       "nvidia,tegra210-dfll");
+		if (node)
+			dfll_pdev = of_find_device_by_node(node);
+		of_node_put(node);
+		if (!dfll_pdev)
+			pr_err("dfll node not found. no suspend for dfll\n");
+	}
+
+	if (dfll_pdev)
+		tegra_dfll_suspend(dfll_pdev);
+
+	/* Enable PLLP_OUT_CPU after dfll suspend */
+	val = car_readl(CLK_OUT_ENB_Y, 0);
+	val |= CLK_ENB_PLLP_OUT_CPU;
+	car_writel(val, CLK_OUT_ENB_Y, 0);
+
+	tegra_clk_periph_suspend(clk_base);
+	return 0;
+}
+
+static void tegra210_clk_resume(void)
+{
+	int i;
+	unsigned long off;
+	u32 val;
+	u32 *clk_rst_ctx = periph_clk_src_ctx;
+	struct clk_hw *parent;
+
+	tegra_clk_osc_resume(clk_base);
+
+	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
+		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
+
+	/*
+	 * Since we are going to reset devices and switch clock sources in this
+	 * function, plls and secondary dividers is required to be enabled. The
+	 * actual value will be restored back later.
+	 */
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_P_OUT1],
+				 pll_p_out_rate[0]);
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_P_OUT3],
+				 pll_p_out_rate[2]);
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_P_OUT4],
+				 pll_p_out_rate[3]);
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_P_OUT5],
+				 pll_p_out_rate[4]);
+
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_A1], pll_a1_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_C2], pll_c2_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_C3], pll_c3_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_C], pll_c_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_X], pll_x_rate);
+
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_A], pll_a_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_D], pll_d_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_D2], pll_d2_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_DP], pll_dp_rate);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_C4], pll_c4_rate);
+
+	/* enable the PLLD */
+	val = car_readl(PLLD_MISC0, 0);
+	val |= PLLD_MISC0_DSI_CLKENABLE;
+	car_writel(val, PLLD_MISC0, 0);
+
+	/* reprogram PLLRE post divider, VCO, 2ndary divider (in this order) */
+	if (!__clk_is_enabled(clks[TEGRA210_CLK_PLL_RE_VCO])) {
+		val = car_readl(PLLRE_BASE, 0);
+		val &= ~(0xf << 16);
+		car_writel(val | pll_re_out_div, PLLRE_BASE, 0);
+	}
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_RE_VCO], pll_re_vco_rate);
+
+	car_writel(pll_re_out_1, PLLRE_OUT1, 0);
+
+	/* resume PLLU */
+	tegra210_init_pllu();
+
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_U_OUT1],
+				 pll_u_out1_rate);
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_U_OUT2],
+				 pll_u_out2_rate);
+
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_C_OUT1],
+				 pll_c_out1_rate);
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_A_OUT0],
+				 pll_a_out0_rate);
+	tegra_clk_pll_out_resume(clks[TEGRA210_CLK_PLL_C4_OUT3],
+				 pll_c4_out3_rate);
+	/*
+	 * resume SCLK and CPULP clocks
+	 * for SCLk 1st set safe dividers values, then restore source,
+	 * then restore dividers
+	 */
+	car_writel(0x1, SYSTEM_CLK_RATE, 0);
+	val = car_readl(SYS_CLK_DIV, 0);
+	i = BURST_POLICY_REG_SIZE;
+	if (val < sclk_burst_policy_ctx[i])
+		car_writel(sclk_burst_policy_ctx[i], SYS_CLK_DIV, 0);
+	fence_udelay(2, clk_base);
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++) {
+		car_writel(cclklp_burst_policy_ctx[i], CCLKLP_BURST_POLICY, i);
+		car_writel(sclk_burst_policy_ctx[i], SCLK_BURST_POLICY, i);
+	}
+	car_writel(sclk_burst_policy_ctx[i], SYS_CLK_DIV, 0);
+
+	car_writel(sclk_ctx, SYSTEM_CLK_RATE, 0);
+	car_writel(spare_ctx, SPARE_REG0, 0);
+	car_writel(misc_clk_enb_ctx, MISC_CLK_ENB, 0);
+	car_writel(clk_arm_ctx, CLK_MASK_ARM, 0);
+
+	/* enable all clocks before configuring clock sources */
+	tegra_clk_periph_force_on(periph_clks_on, ARRAY_SIZE(periph_clks_on),
+				  clk_base);
+
+	wmb();
+	fence_udelay(2, clk_base);
+
+	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
+		for (off = periph_srcs[i].start; off <= periph_srcs[i].end;
+		     off += 4)
+			car_writel(*clk_rst_ctx++, off, 0);
+
+	/* propagate and restore resets, restore clock state */
+	fence_udelay(5, clk_base);
+	tegra_clk_periph_resume(clk_base);
+
+	/* restore (sync) the actual PLL and secondary divider values */
+	car_writel(pll_p_outa, PLLP_OUTA, 0);
+	car_writel(pll_p_outb, PLLP_OUTB, 0);
+
+	tegra_clk_sync_state_pll_out(clks[TEGRA210_CLK_PLL_U_OUT1]);
+	tegra_clk_sync_state_pll_out(clks[TEGRA210_CLK_PLL_U_OUT2]);
+
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_A1]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_C2]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_C3]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_C]);
+
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_RE_VCO]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_C4]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_D2]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_DP]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_A]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_D]);
+
+	tegra_clk_sync_state_pll_out(clks[TEGRA210_CLK_PLL_C_OUT1]);
+	tegra_clk_sync_state_pll_out(clks[TEGRA210_CLK_PLL_A_OUT0]);
+
+	/*
+	 * restore CPUG clocks:
+	 * - enable DFLL in open loop mode
+	 * - switch CPUG to DFLL clock source
+	 * - close DFLL loop
+	 * - sync PLLX state
+	 */
+	if (dfll_pdev)
+		tegra_dfll_resume(dfll_pdev, false);
+
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++)
+		car_writel(cclkg_burst_policy_ctx[i], CCLKG_BURST_POLICY, i);
+	fence_udelay(2, clk_base);
+
+	if (dfll_pdev)
+		tegra_dfll_resume(dfll_pdev, true);
+
+	parent = clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
+	if (parent != __clk_get_hw(clks[TEGRA210_CLK_PLL_X]))
+		tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_X]);
+
+	/* Disable PLL_OUT_CPU after DFLL resume */
+	val = car_readl(CLK_OUT_ENB_Y, 0);
+	val &= ~CLK_ENB_PLLP_OUT_CPU;
+	car_writel(val, CLK_OUT_ENB_Y, 0);
+
+	car_writel(pll_m_v, PLLM_BASE, 0);
+	tegra_clk_pll_resume(clks[TEGRA210_CLK_PLL_MB], pll_mb_rate);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_M]);
+	tegra_clk_sync_state_pll(clks[TEGRA210_CLK_PLL_MB]);
+
+	tegra_clk_plle_tegra210_resume(clks[TEGRA210_CLK_PLL_E]);
+}
+#else
+#define tegra210_clk_suspend	NULL
+#define tegra210_clk_resume	NULL
+static inline u32 *tegra210_init_suspend_ctx(void)
+{
+	return NULL;
+}
+#endif
+
+static struct syscore_ops tegra_clk_syscore_ops = {
+	.suspend = tegra210_clk_suspend,
+	.resume = tegra210_clk_resume,
+};
+
 /**
  * tegra210_clock_apply_init_table - initialize clocks on Tegra210 SoCs
  *
@@ -3591,5 +3969,9 @@ static void __init tegra210_clock_init(struct device_node *np)
 	tegra210_mbist_clk_init();
 
 	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
+
+	if (tegra210_init_suspend_ctx())
+		register_syscore_ops(&tegra_clk_syscore_ops);
+
 }
 CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
-- 
2.7.4

