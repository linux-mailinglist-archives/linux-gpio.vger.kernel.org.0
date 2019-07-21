Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB4C06F556
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 21:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfGUTlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 15:41:02 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8992 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbfGUTlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 15:41:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34bfc80000>; Sun, 21 Jul 2019 12:40:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 12:40:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 12:40:58 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:40:58 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:40:58 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 21 Jul 2019 19:40:58 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.85]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d34bfc90000>; Sun, 21 Jul 2019 12:40:58 -0700
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
Subject: [PATCH V6 05/21] clk: tegra: pllout: Save and restore pllout context
Date:   Sun, 21 Jul 2019 12:40:44 -0700
Message-ID: <1563738060-30213-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563738056; bh=XCkccFmr6HwkH8cbMy/GTsrauvkmh1OiKCcR5AhT1B8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=lyYpN8EDe4/kVt4VWFEtRSbE/aCW8pDkVx8gKNricSLqOmSRYg4izJdQp/PlKUwVp
         yGhFhA+1vrwnpLhth2tnZ5cF0kBEn5o7IhKPszyKifRUyZixTCB5Gfcf3peO1hVWlc
         1c5Y4S+UuUYlnO55M6s0swQCQm9RFjlZZW2cHPv9bUO/pX4MwJFQL8rlV7PHy2AkQs
         cSjDT3JRAXpuBPFao9jt0K9ViDWqJR3s9HaCL6gn/i6BkchyXo7obQjB97N/ynrBvb
         5hQsoM/AdKsiQD521hke3mMvtWeVhGKUmV582gmdmNoj7hLvnpauPdGFOjFJ+1zc5G
         H7Apn7+Q0aLCA==
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
index df172d5772d7..4721ee030d1c 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3200,7 +3200,8 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
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

