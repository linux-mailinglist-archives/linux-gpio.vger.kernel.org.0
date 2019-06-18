Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67BA49B38
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbfFRHrI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:47:08 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14155 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbfFRHrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:47:07 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896f80001>; Tue, 18 Jun 2019 00:47:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:47:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Jun 2019 00:47:05 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:47:04 +0000
Received: from HQMAIL108.nvidia.com (172.18.146.13) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:47:04 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:47:03 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896f50004>; Tue, 18 Jun 2019 00:47:04 -0700
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
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH V3 11/17] clk: tegra210: support for Tegra210 clocks suspend and resume
Date:   Tue, 18 Jun 2019 00:46:25 -0700
Message-ID: <1560843991-24123-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844024; bh=SGcqTwvLQqwf1tE0nNYcxmB0duJ1Yuf1/djbG6n28AE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DWI6L8UiRvOIoa3VkwUYVGNn1EyJJhVBini8WE2AIFGM9hdSlJHvD9XLa/nVnTwAK
         4p4jmrN/fnoM1exu97UXMoYrmsazlXEod4ifZOs/LAywWxqX+TSt4+k5+o/+mTsu8r
         MsI8C1Jhips8SFjJAzWS5Kw1RbGqHxr6ffCS3TS9gm9tYDnLu/XmtYzYhwZtK4mdzR
         O20G6sKIpoAmkmlfOKnfee+EtP++tJ95GJ51TizktV0qlQFlhBoyAbr/jtUyfsgA4U
         iVzMx4AtnsdFgR3Nct8rVxDvq+v/L89spqvxEPyFtvDq829dggwWtESUJLKdF4WHEN
         uxvf6PbgOedhw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds system suspend and resume support for Tegra210
clocks.

All the CAR controller settings are lost on suspend when core power
goes off.

This patch has implementation for saving and restoring all the PLLs
and clocks context during system suspend and resume to have the
system back to operating state.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 218 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 211 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index e1ba62d2b1a0..c34d92e871f4 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -9,10 +9,12 @@
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
@@ -20,6 +22,7 @@
 #include <soc/tegra/pmc.h>
 
 #include "clk.h"
+#include "clk-dfll.h"
 #include "clk-id.h"
 
 /*
@@ -36,6 +39,8 @@
 #define CLK_SOURCE_LA 0x1f8
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
+#define CLK_OUT_ENB_Y 0x298
+#define CLK_ENB_PLLP_OUT_CPU BIT(31)
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -225,6 +230,7 @@
 
 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
+#define CPU_SOFTRST_CTRL 0x380
 
 #define LVL2_CLK_GATE_OVRA 0xf8
 #define LVL2_CLK_GATE_OVRC 0x3a0
@@ -2820,6 +2826,7 @@ static int tegra210_enable_pllu(void)
 	struct tegra_clk_pll_freq_table *fentry;
 	struct tegra_clk_pll pllu;
 	u32 reg;
+	int ret;
 
 	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
 		if (fentry->input_rate == pll_ref_freq)
@@ -2836,7 +2843,7 @@ static int tegra210_enable_pllu(void)
 	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
 	reg &= ~BIT(pllu.params->iddq_bit_idx);
 	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
-	udelay(5);
+	fence_udelay(5, clk_base);
 
 	reg = readl_relaxed(clk_base + PLLU_BASE);
 	reg &= ~GENMASK(20, 0);
@@ -2844,13 +2851,13 @@ static int tegra210_enable_pllu(void)
 	reg |= fentry->n << 8;
 	reg |= fentry->p << 16;
 	writel(reg, clk_base + PLLU_BASE);
-	udelay(1);
+	fence_udelay(1, clk_base);
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
+	fence_udelay(1, clk_base);
 
-	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
-					  reg & PLL_BASE_LOCK, 2, 1000);
-	if (!(reg & PLL_BASE_LOCK)) {
+	ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
+	if (ret) {
 		pr_err("Timed out waiting for PLL_U to lock\n");
 		return -ETIMEDOUT;
 	}
@@ -2890,12 +2897,12 @@ static int tegra210_init_pllu(void)
 		reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
 		reg &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
 		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
-		udelay(1);
+		fence_udelay(1, clk_base);
 
 		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
 		reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
 		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
-		udelay(1);
+		fence_udelay(1, clk_base);
 
 		reg = readl_relaxed(clk_base + PLLU_BASE);
 		reg &= ~PLLU_BASE_CLKENABLE_USB;
@@ -3282,6 +3289,188 @@ static void tegra210_disable_cpu_clock(u32 cpu)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static u32 cpu_softrst_ctx[3];
+static struct platform_device *dfll_pdev;
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
+static struct platform_device *dfll_pdev;
+#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
+#define car_writel(_val, _base, _off) \
+		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
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
+	tegra_cclkg_burst_policy_save_context();
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
+
+	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
+		for (off = periph_srcs[i].start; off <= periph_srcs[i].end;
+		     off += 4)
+			*clk_rst_ctx++ = car_readl(off, 0);
+
+	tegra_sclk_cclklp_burst_policy_save_context();
+
+	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
+		cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
+
+	clk_save_context();
+
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
+	struct clk *clk;
+
+	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
+		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
+
+	tegra_clk_osc_resume(clk_base);
+
+	/*
+	 * restore all the plls before configuring clocks and resetting
+	 * the devices.
+	 */
+	tegra210_init_pllu();
+	tegra_sclk_cpulp_burst_policy_restore_context();
+	clk_restore_context();
+
+	/* enable all clocks before configuring clock sources */
+	tegra_clk_periph_force_on(periph_clks_on, ARRAY_SIZE(periph_clks_on),
+				  clk_base);
+	/* wait for all writes to happen to have all the clocks enabled */
+	wmb();
+	fence_udelay(2, clk_base);
+
+	/* restore all the devices clock sources */
+	for (i = 0; i < ARRAY_SIZE(periph_srcs); i++)
+		for (off = periph_srcs[i].start; off <= periph_srcs[i].end;
+		     off += 4)
+			car_writel(*clk_rst_ctx++, off, 0);
+
+	/* propagate and restore resets, restore clock state */
+	fence_udelay(5, clk_base);
+	tegra_clk_periph_resume(clk_base);
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
+	tegra_cclkg_burst_policy_restore_context();
+	fence_udelay(2, clk_base);
+
+	if (dfll_pdev)
+		tegra_dfll_resume(dfll_pdev, true);
+
+	parent = clk_hw_get_parent(__clk_get_hw(clks[TEGRA210_CLK_CCLK_G]));
+	clk = clks[TEGRA210_CLK_PLL_X];
+	if (parent != __clk_get_hw(clk))
+		tegra_clk_sync_state_pll(__clk_get_hw(clk));
+
+	/* Disable PLL_OUT_CPU after DFLL resume */
+	val = car_readl(CLK_OUT_ENB_Y, 0);
+	val &= ~CLK_ENB_PLLP_OUT_CPU;
+	car_writel(val, CLK_OUT_ENB_Y, 0);
+}
+
 static void tegra210_cpu_clock_suspend(void)
 {
 	/* switch coresite to clk_m, save off original source */
@@ -3295,8 +3484,20 @@ static void tegra210_cpu_clock_resume(void)
 	writel(tegra210_cpu_clk_sctx.clk_csite_src,
 				clk_base + CLK_SOURCE_CSITE);
 }
+#else
+#define tegra210_clk_suspend	NULL
+#define tegra210_clk_resume	NULL
+static inline u32 *tegra210_init_suspend_ctx(void)
+{
+	return NULL;
+}
 #endif
 
+static struct syscore_ops tegra_clk_syscore_ops = {
+	.suspend = tegra210_clk_suspend,
+	.resume = tegra210_clk_resume,
+};
+
 static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
 	.wait_for_reset	= tegra210_wait_cpu_in_reset,
 	.disable_clock	= tegra210_disable_cpu_clock,
@@ -3580,5 +3781,8 @@ static void __init tegra210_clock_init(struct device_node *np)
 	tegra210_mbist_clk_init();
 
 	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
+
+	if (tegra210_init_suspend_ctx())
+		register_syscore_ops(&tegra_clk_syscore_ops);
 }
 CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
-- 
2.7.4

