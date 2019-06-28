Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8616859054
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfF1CNg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:13:36 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5480 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbfF1CNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577d00001>; Thu, 27 Jun 2019 19:13:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 27 Jun 2019 19:13:34 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:33 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577cd0006>; Thu, 27 Jun 2019 19:13:33 -0700
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
Subject: [PATCH V5 04/18] clk: tegra: pllout: Save and restore pllout context
Date:   Thu, 27 Jun 2019 19:12:38 -0700
Message-ID: <1561687972-19319-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688017; bh=TqspXxSUMOnx+v+IVW31w3ws6+ZGaWHJIhoopYd5LSU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=O9eOYxdk9m0jJ/CVgPsOnW0OnW938t2EQiT1151+6g3Lit9Z8gDyYPABNQTTy8Awu
         YHHmI01jIgTFTk4hEKSZlP1zpK92A9m+90MolMu599U+WMvnoTb8X0XUOGiHfrXZZj
         bM761ThcCSOp3tE3SYkCfCAAld4E/glVN5XlERjiRXRCdl8HnTbT4N0VvQt9xkVzNG
         box83on4PX74XOKn1XcRAwl2KNaVCtHSSrIFkNIQPnAH7X7oXAgfB7VvU22F6K2eiY
         yayQ/r3PRgApygMSu8WLDqfEZUsH18QoHgNw/wWIomuC3LKIeRo9ouRoU2ABqpTaFy
         JZvXRq2rXZXfw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements save and restore of pllout context.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry the state of pllout is saved and on resume
it is restored back to have pllout in same state as before suspend.

pllout rate is saved and restore in clock divider so it will be at
same rate as before suspend when pllout state is restored.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll-out.c  | 28 ++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-tegra210.c |  3 ++-
 drivers/clk/tegra/clk.h          |  9 +++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
index 35f2bf00e1e6..8f26a7e3e579 100644
--- a/drivers/clk/tegra/clk-pll-out.c
+++ b/drivers/clk/tegra/clk-pll-out.c
@@ -69,10 +69,38 @@ static void clk_pll_out_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(pll_out->lock, flags);
 }
 
+static int tegra_clk_pll_out_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll_out *pll_out = to_clk_pll_out(hw);
+
+	if (pll_out->flags & TEGRA_PLLRE_OUT)
+		pll_out->pllout_ctx = readl_relaxed(pll_out->reg);
+	else
+		pll_out->pllout_ctx = clk_hw_get_rate(hw);
+
+	return 0;
+}
+
+static void tegra_clk_pll_out_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll_out *pll_out = to_clk_pll_out(hw);
+
+	if (pll_out->flags & TEGRA_PLLRE_OUT) {
+		writel_relaxed(pll_out->pllout_ctx, pll_out->reg);
+	} else {
+		if (!__clk_get_enable_count(hw->clk))
+			clk_pll_out_disable(hw);
+		else
+			clk_pll_out_enable(hw);
+	}
+}
+
 const struct clk_ops tegra_clk_pll_out_ops = {
 	.is_enabled = clk_pll_out_is_enabled,
 	.enable = clk_pll_out_enable,
 	.disable = clk_pll_out_disable,
+	.save_context = tegra_clk_pll_out_save_context,
+	.restore_context = tegra_clk_pll_out_restore_context,
 };
 
 struct clk *tegra_clk_register_pll_out(const char *name,
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index ac1d27a8c650..cbd77658dcf7 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3195,7 +3195,8 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 					 8, 8, 1, NULL);
 	clk = tegra_clk_register_pll_out("pll_re_out1", "pll_re_out1_div",
 					 clk_base + PLLRE_OUT1, 1, 0,
-					 CLK_SET_RATE_PARENT, 0, NULL);
+					 CLK_SET_RATE_PARENT, TEGRA_PLLRE_OUT,
+					 NULL);
 	clks[TEGRA210_CLK_PLL_RE_OUT1] = clk;
 
 	/* PLLE */
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 83623f5f55f3..fb29a8c27873 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -439,6 +439,12 @@ struct clk *tegra_clk_register_pllu_tegra210(const char *name,
  * @rst_bit_idx:	bit to reset PLL divider
  * @lock:		register lock
  * @flags:		hardware-specific flags
+ * @pllout_ctx:		pllout context to save and restore during suspend
+ *			and resume
+ *
+ * Flags:
+ * TEGRA_PLLRE_OUT - This flag indicates that it is PLLRE_OUT and is used to
+ *		     identify PLLRE_OUT during clk_pll_out save and restore.
  */
 struct tegra_clk_pll_out {
 	struct clk_hw	hw;
@@ -447,8 +453,11 @@ struct tegra_clk_pll_out {
 	u8		rst_bit_idx;
 	spinlock_t	*lock;
 	u8		flags;
+	unsigned int	pllout_ctx;
 };
 
+#define TEGRA_PLLRE_OUT BIT(0)
+
 #define to_clk_pll_out(_hw) container_of(_hw, struct tegra_clk_pll_out, hw)
 
 extern const struct clk_ops tegra_clk_pll_out_ops;
-- 
2.7.4

