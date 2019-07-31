Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6454B7B6E5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 02:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbfGaAVX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 20:21:23 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7255 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbfGaAUd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 20:20:33 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d40ded80000>; Tue, 30 Jul 2019 17:20:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 30 Jul 2019 17:20:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 30 Jul 2019 17:20:31 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:31 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:31 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 31 Jul 2019 00:20:31 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.107]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d40dece0014>; Tue, 30 Jul 2019 17:20:31 -0700
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
Subject: [PATCH v7 13/20] clk: tegra210: Add suspend and resume support
Date:   Tue, 30 Jul 2019 17:20:17 -0700
Message-ID: <1564532424-10449-14-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564532440; bh=gPK8lOd2L0E8wxNUkaQDExJ9pyS50gN50iD6gfS3XN4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=GI3OBRzqvtIUM9H77MaQsqv/QKgkVmNPqKUcWvo31Swq1eSkd7PysdCIuNot5rzHq
         B+1Nd2F2w1JYqdAFByeWXUBo66kR2/RSFqzxHeHCdMGu0WwtY8Xij7kzMrapECN2Ni
         uElKUbmHngDrxm3AM06RzV/JhOQDpHzfPkTwWrCQ/NdsbXUkL7li3W9OW2CUO6oY3e
         pUkduC+K4lUv6Chy0ZanIp5WzPB8OzjAnCOYgfubkaWIG0E8IV72XrbC4oQHQmszm8
         nx6kNs7x5ePCukrFauFx/rIqU9xX0lJnmSIM7miQmUGSrgOykHBBQYIzd1J72etxcf
         azVshf+1dTsTA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for clk: tegra210: suspend-resume.

All the CAR controller settings are lost on suspend when core
power goes off.

This patch has implementation for saving and restoring all PLLs
and clocks context during system suspend and resume to have the
clocks back to same state for normal operation.

Clock driver suspend and resume are registered as syscore_ops as clocks
restore need to happen before the other drivers resume to have all their
clocks back to the same state as before suspend.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 75 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 998bf60b219a..14ea9f373a84 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -9,13 +9,13 @@
 #include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/syscore_ops.h>
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/mutex.h>
 #include <linux/clk/tegra.h>
 #include <dt-bindings/clock/tegra210-car.h>
 #include <dt-bindings/reset/tegra210-car.h>
-#include <linux/iopoll.h>
 #include <linux/sizes.h>
 #include <soc/tegra/pmc.h>
 
@@ -220,11 +220,15 @@
 #define CLK_M_DIVISOR_SHIFT 2
 #define CLK_M_DIVISOR_MASK 0x3
 
+#define CLK_MASK_ARM	0x44
+#define MISC_CLK_ENB	0x48
+
 #define RST_DFLL_DVCO 0x2f4
 #define DVFS_DFLL_RESET_SHIFT 0
 
 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
+#define CPU_SOFTRST_CTRL 0x380
 
 #define LVL2_CLK_GATE_OVRA 0xf8
 #define LVL2_CLK_GATE_OVRC 0x3a0
@@ -2825,6 +2829,7 @@ static int tegra210_enable_pllu(void)
 	struct tegra_clk_pll_freq_table *fentry;
 	struct tegra_clk_pll pllu;
 	u32 reg;
+	int ret;
 
 	for (fentry = pll_u_freq_table; fentry->input_rate; fentry++) {
 		if (fentry->input_rate == pll_ref_freq)
@@ -2853,9 +2858,14 @@ static int tegra210_enable_pllu(void)
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
 
-	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
-					  reg & PLL_BASE_LOCK, 2, 1000);
-	if (!(reg & PLL_BASE_LOCK)) {
+	/*
+	 * During clock resume syscore operation, same PLLU init and enable
+	 * routines gets invoked. So, readx_poll_timeout_atomic can't be used
+	 * here as it uses ktime_get() and timekeeping resume doesn't happen
+	 * by that time. So, using tegra210_wait_for_mask for PLL LOCK.
+	 */
+	ret = tegra210_wait_for_mask(&pllu, PLLU_BASE, PLL_BASE_LOCK);
+	if (ret) {
 		pr_err("Timed out waiting for PLL_U to lock\n");
 		return -ETIMEDOUT;
 	}
@@ -3288,6 +3298,56 @@ static void tegra210_disable_cpu_clock(u32 cpu)
 }
 
 #ifdef CONFIG_PM_SLEEP
+#define car_readl(_base, _off) readl_relaxed(clk_base + (_base) + ((_off) * 4))
+#define car_writel(_val, _base, _off) \
+		writel_relaxed(_val, clk_base + (_base) + ((_off) * 4))
+
+static u32 spare_reg_ctx, misc_clk_enb_ctx, clk_msk_arm_ctx;
+static u32 cpu_softrst_ctx[3];
+
+static int tegra210_clk_suspend(void)
+{
+	unsigned int i;
+
+	clk_save_context();
+
+	/*
+	 * Save the bootloader configured clock registers SPARE_REG0,
+	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL.
+	 */
+	spare_reg_ctx = readl_relaxed(clk_base + SPARE_REG0);
+	misc_clk_enb_ctx = readl_relaxed(clk_base + MISC_CLK_ENB);
+	clk_msk_arm_ctx = readl_relaxed(clk_base + CLK_MASK_ARM);
+
+	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
+		cpu_softrst_ctx[i] = car_readl(CPU_SOFTRST_CTRL, i);
+
+	return 0;
+}
+
+static void tegra210_clk_resume(void)
+{
+	unsigned int i;
+
+	tegra_clk_osc_resume(clk_base);
+
+	/*
+	 * Restore the bootloader configured clock registers SPARE_REG0,
+	 * MISC_CLK_ENB, CLK_MASK_ARM, CPU_SOFTRST_CTRL from saved context.
+	 */
+	writel_relaxed(spare_reg_ctx, clk_base + SPARE_REG0);
+	writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
+	writel_relaxed(clk_msk_arm_ctx, clk_base + CLK_MASK_ARM);
+
+	for (i = 0; i < ARRAY_SIZE(cpu_softrst_ctx); i++)
+		car_writel(cpu_softrst_ctx[i], CPU_SOFTRST_CTRL, i);
+
+	fence_udelay(5, clk_base);
+
+	tegra210_init_pllu();
+	clk_restore_context();
+}
+
 static void tegra210_cpu_clock_suspend(void)
 {
 	/* switch coresite to clk_m, save off original source */
@@ -3303,6 +3363,11 @@ static void tegra210_cpu_clock_resume(void)
 }
 #endif
 
+static struct syscore_ops tegra_clk_syscore_ops = {
+	.suspend = tegra210_clk_suspend,
+	.resume = tegra210_clk_resume,
+};
+
 static struct tegra_cpu_car_ops tegra210_cpu_car_ops = {
 	.wait_for_reset	= tegra210_wait_cpu_in_reset,
 	.disable_clock	= tegra210_disable_cpu_clock,
@@ -3587,5 +3652,7 @@ static void __init tegra210_clock_init(struct device_node *np)
 	tegra210_mbist_clk_init();
 
 	tegra_cpu_car_ops = &tegra210_cpu_car_ops;
+
+	register_syscore_ops(&tegra_clk_syscore_ops);
 }
 CLK_OF_DECLARE(tegra210, "nvidia,tegra210-car", tegra210_clock_init);
-- 
2.7.4

