Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE71449B52
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbfFRHq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:46:59 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19673 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfFRHq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:46:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896f10000>; Tue, 18 Jun 2019 00:46:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 00:46:56 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:55 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:56 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896ee0000>; Tue, 18 Jun 2019 00:46:56 -0700
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
Subject: [PATCH V3 08/17] clk: tegra: add support for peripheral clock suspend and resume
Date:   Tue, 18 Jun 2019 00:46:22 -0700
Message-ID: <1560843991-24123-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844017; bh=XxXnlq+TujPWngS562UXjtW8HdavZKOUpZld3hJwekQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=G/Ns6yraA5bwBGu3XnArGzWXpybmCZGgv068rhuLenhsEg1bjiqV65EtkBqA2W3qq
         axgjbAM7GxSzFulkX++U9u5Q7O3l25GRvuvYwnZ/J2sjndSDogh88w/twGTjUgt8aU
         T7H+HI0yyD1hiQVGh17DM7QXcEuWGgFUr9MoAwtO3cj7vYvFfeqNnqT/47+9CaxnAm
         OCKxoWlhpQ0XnSSMDZSIzLNz9NYP2Ol+YZSeEsc6XbPXGJLhc1NZywH/TqysO1h8D6
         xuNY9mHttpr31Y+EDONXyVMflVThS8/Ugw737KqXfnICHrfg++/EVE4SJx4u8BmAo8
         j5ci3QiqVVkTg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch creates APIs to save and restore the state of all
peripheral clocks reset and enables.

These APIs are invoked by Tegra210 clock driver during suspend and
resume to save the peripheral clocks state before suspend and to
restore them on resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h |  3 +++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 26690663157a..bd3b46c5f941 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -70,6 +70,7 @@ static struct clk **clks;
 static int clk_num;
 static struct clk_onecell_data clk_data;
 
+static u32 *periph_ctx;
 static u32 cclkg_burst_policy_ctx[2];
 static u32 cclklp_burst_policy_ctx[2];
 static u32 sclk_burst_policy_ctx[2];
@@ -279,6 +280,63 @@ void tegra_sclk_cpulp_burst_policy_restore_context(void)
 	writel_relaxed(clk_arm_ctx, clk_base + CLK_MASK_ARM);
 }
 
+void tegra_clk_periph_suspend(void __iomem *clk_base)
+{
+	int i, idx;
+
+	idx = 0;
+	for (i = 0; i < periph_banks; i++, idx++)
+		periph_ctx[idx] =
+			readl_relaxed(clk_base + periph_regs[i].rst_reg);
+
+	for (i = 0; i < periph_banks; i++, idx++)
+		periph_ctx[idx] =
+			readl_relaxed(clk_base + periph_regs[i].enb_reg);
+}
+
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base)
+{
+	int i;
+
+	WARN_ON(count != periph_banks);
+
+	for (i = 0; i < count; i++)
+		writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_reg);
+}
+
+void tegra_clk_periph_resume(void __iomem *clk_base)
+{
+	int i, idx;
+
+	idx = 0;
+	for (i = 0; i < periph_banks; i++, idx++)
+		writel_relaxed(periph_ctx[idx],
+			       clk_base + periph_regs[i].rst_reg);
+
+	/* ensure all resets have propagated */
+	fence_udelay(2, clk_base);
+	tegra_read_chipid();
+
+	for (i = 0; i < periph_banks; i++, idx++)
+		writel_relaxed(periph_ctx[idx],
+			       clk_base + periph_regs[i].enb_reg);
+
+	/* ensure all enables have propagated */
+	fence_udelay(2, clk_base);
+	tegra_read_chipid();
+}
+
+static int tegra_clk_suspend_ctx_init(int banks)
+{
+	int err = 0;
+
+	periph_ctx = kcalloc(2 * banks, sizeof(*periph_ctx), GFP_KERNEL);
+	if (!periph_ctx)
+		err = -ENOMEM;
+
+	return err;
+}
+
 struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 {
 	clk_base = regs;
@@ -295,11 +353,21 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 	periph_banks = banks;
 
 	clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-	if (!clks)
+	if (!clks) {
 		kfree(periph_clk_enb_refcnt);
+		return NULL;
+	}
 
 	clk_num = num;
 
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		if (tegra_clk_suspend_ctx_init(banks)) {
+			kfree(periph_clk_enb_refcnt);
+			kfree(clks);
+			return NULL;
+		}
+	}
+
 	return clks;
 }
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index c8f8a23096e2..a354cacae5a6 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -853,6 +853,9 @@ void tegra_cclkg_burst_policy_save_context(void);
 void tegra_cclkg_burst_policy_restore_context(void);
 void tegra_sclk_cclklp_burst_policy_save_context(void);
 void tegra_sclk_cpulp_burst_policy_restore_context(void);
+void tegra_clk_periph_suspend(void __iomem *clk_base);
+void tegra_clk_periph_resume(void __iomem *clk_base);
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base);
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4

