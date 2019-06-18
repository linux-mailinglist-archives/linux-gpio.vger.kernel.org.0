Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4210849B4F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbfFRHrA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:47:00 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9715 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFRHq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:46:56 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896ed0000>; Tue, 18 Jun 2019 00:46:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Jun 2019 00:46:54 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:53 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:53 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896eb0003>; Tue, 18 Jun 2019 00:46:53 -0700
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
Subject: [PATCH V3 07/17] clk: tegra: save and restore CPU and System clocks context
Date:   Tue, 18 Jun 2019 00:46:21 -0700
Message-ID: <1560843991-24123-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844014; bh=rX5C6TLRq6S7JDWcvC7pebJyWsbcNEJPnKOIpc/oRDQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=hmtsUmsBcnfkalFaVr5lFf0cnBssKBVcJ8SMd+T64qsDe+rXwauY26LHtvRXFYBU1
         ID5Y1Acjw8v2KEdAk31OzrvHcOpymFQVGcTyj7nOJZLvko4BTh7f+KYioyCQndZLRt
         /+iKvcSGCnYl93hv2IX3v0Q2pj9XRpsgwlkKzx862Bxih2h3+CHvzmvUaqmAoQLD3r
         aUMPAPB8WI7qQOTl2WXSDY+0wWDnI1itTuSD650GQJ32Ms0gr/ESgVhEuLd+cwZNyq
         TjACd0JGQ9iaSIZg2CZhMjuH/Q2/KCXDEmZ3kkVKKjJp4MK5y5f0f9hRIosuQSlXCO
         +DuFqEMaPI+7Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

During system suspend state, core power goes off and looses all the
CAR controller register settings.

This patch creates APIs for saving and restoring the context of Tegra
CPUG, CPULP and SCLK.

CPU and System clock context includes
- CPUG, CPULP, and SCLK burst policy settings for clock sourcea of all
  their normal states.
- SCLK divisor and System clock rate for restoring SCLK, AHB and APB
  rates on resume.
- OSC_DIV settings which are used as reference clock input to some PLLs.
- SPARE_REG and CLK_MASK settings.

These APIs are used in Tegra210 clock driver during suspend and resume
operation.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-super-gen4.c |  4 --
 drivers/clk/tegra/clk.c                  | 80 ++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h                  | 14 ++++++
 3 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index cdfe7c9697e1..ed69ec4d883e 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -19,10 +19,6 @@
 #define PLLX_MISC2 0x514
 #define PLLX_MISC3 0x518
 
-#define CCLKG_BURST_POLICY 0x368
-#define CCLKLP_BURST_POLICY 0x370
-#define SCLK_BURST_POLICY 0x028
-#define SYSTEM_CLK_RATE 0x030
 #define SCLK_DIVIDER 0x2c
 
 static DEFINE_SPINLOCK(sysrate_lock);
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 573e3c967ae1..26690663157a 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -70,6 +70,12 @@ static struct clk **clks;
 static int clk_num;
 static struct clk_onecell_data clk_data;
 
+static u32 cclkg_burst_policy_ctx[2];
+static u32 cclklp_burst_policy_ctx[2];
+static u32 sclk_burst_policy_ctx[2];
+static u32 sys_clk_divisor_ctx, system_rate_ctx;
+static u32 spare_ctx, misc_clk_enb_ctx, clk_arm_ctx;
+
 /* Handlers for SoC-specific reset lines */
 static int (*special_reset_assert)(unsigned long);
 static int (*special_reset_deassert)(unsigned long);
@@ -199,6 +205,80 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
 	}
 }
 
+void tegra_cclkg_burst_policy_save_context(void)
+{
+	int i;
+
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++)
+		cclkg_burst_policy_ctx[i] = readl_relaxed(clk_base +
+							  CCLKG_BURST_POLICY +
+							  (i * 4));
+}
+
+void tegra_cclkg_burst_policy_restore_context(void)
+{
+	int i;
+
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++)
+		writel_relaxed(cclkg_burst_policy_ctx[i],
+			       clk_base + CCLKG_BURST_POLICY + (i * 4));
+
+	fence_udelay(2, clk_base);
+}
+
+void tegra_sclk_cclklp_burst_policy_save_context(void)
+{
+	int i;
+
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++) {
+		cclklp_burst_policy_ctx[i] = readl_relaxed(clk_base +
+							  CCLKLP_BURST_POLICY +
+							  (i * 4));
+
+		sclk_burst_policy_ctx[i] = readl_relaxed(clk_base +
+							  SCLK_BURST_POLICY +
+							  (i * 4));
+	}
+
+	sys_clk_divisor_ctx = readl_relaxed(clk_base + SYS_CLK_DIV);
+	system_rate_ctx = readl_relaxed(clk_base + SYSTEM_CLK_RATE);
+	spare_ctx = readl_relaxed(clk_base + SPARE_REG0);
+	misc_clk_enb_ctx = readl_relaxed(clk_base + MISC_CLK_ENB);
+	clk_arm_ctx = readl_relaxed(clk_base + CLK_MASK_ARM);
+}
+
+void tegra_sclk_cpulp_burst_policy_restore_context(void)
+{
+	int i;
+	u32 val;
+
+	/*
+	 * resume SCLK and CPULP clocks
+	 * for SCLk, set safe dividers values first and then restore source
+	 * and dividers
+	 */
+
+	writel_relaxed(0x1, clk_base + SYSTEM_CLK_RATE);
+	val = readl_relaxed(clk_base + SYS_CLK_DIV);
+	if (val < sys_clk_divisor_ctx)
+		writel_relaxed(sys_clk_divisor_ctx, clk_base + SYS_CLK_DIV);
+
+	fence_udelay(2, clk_base);
+
+	for (i = 0; i < BURST_POLICY_REG_SIZE; i++) {
+		writel_relaxed(cclklp_burst_policy_ctx[i],
+			       clk_base + CCLKLP_BURST_POLICY + (i * 4));
+		writel_relaxed(sclk_burst_policy_ctx[i],
+			       clk_base + SCLK_BURST_POLICY + (i * 4));
+	}
+
+	writel_relaxed(sys_clk_divisor_ctx, clk_base + SYS_CLK_DIV);
+	writel_relaxed(system_rate_ctx, clk_base + SYSTEM_CLK_RATE);
+	writel_relaxed(spare_ctx, clk_base + SPARE_REG0);
+	writel_relaxed(misc_clk_enb_ctx, clk_base + MISC_CLK_ENB);
+	writel_relaxed(clk_arm_ctx, clk_base + CLK_MASK_ARM);
+}
+
 struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 {
 	clk_base = regs;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 581deb4f3ac0..c8f8a23096e2 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -10,6 +10,16 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 
+#define SCLK_BURST_POLICY	0x28
+#define SYSTEM_CLK_RATE		0x30
+#define CLK_MASK_ARM		0x44
+#define MISC_CLK_ENB		0x48
+#define CCLKG_BURST_POLICY	0x368
+#define CCLKLP_BURST_POLICY	0x370
+#define SYS_CLK_DIV		0x400
+#define SPARE_REG0 		0x55c
+#define BURST_POLICY_REG_SIZE	2
+
 /**
  * struct tegra_clk_sync_source - external clock source from codec
  *
@@ -839,6 +849,10 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
 int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
 		 u8 frac_width, u8 flags);
 void tegra_clk_sync_state_pll(struct clk_hw *hw);
+void tegra_cclkg_burst_policy_save_context(void);
+void tegra_cclkg_burst_policy_restore_context(void);
+void tegra_sclk_cclklp_burst_policy_save_context(void);
+void tegra_sclk_cpulp_burst_policy_restore_context(void);
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4

