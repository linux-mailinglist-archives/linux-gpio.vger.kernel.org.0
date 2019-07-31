Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A84EF7B6E6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 02:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbfGaAUd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 20:20:33 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9237 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbfGaAUc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 20:20:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d40dece0001>; Tue, 30 Jul 2019 17:20:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jul 2019 17:20:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jul 2019 17:20:29 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:29 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:28 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 31 Jul 2019 00:20:28 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.107]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d40decc0003>; Tue, 30 Jul 2019 17:20:28 -0700
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
Subject: [PATCH v7 05/20] clk: tegra: pll: Save and restore pll context
Date:   Tue, 30 Jul 2019 17:20:09 -0700
Message-ID: <1564532424-10449-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564532430; bh=LZ7m9jVPRdI6V1cJgmfBo3kyydvS0HAPmIIFMNESz0k=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=MtMPmopb1iMmFti/3yf179hWsj4RyCCkpgPmyrAx+bl6gwALrCf1LuNKdRMXhv51G
         eESMuTH/CCxS+rLxRiNDO0C7jP4NRBVxj4sbNvwy78w1XIy0bYkj87MIu4TKufNMUb
         9S665sAVwDQJI+tf0AtUIW5Kd0hijmnvOX/rKbDNiaXG1TrnmrBoqgVnOt1ZsXcMq9
         Xggdo+6T3fQWUa+Y8gKKvmXNzDY4TaVEgDagEzBXYN7/+wsE6CtbSZidRE0roXE4ml
         gT6W+AmMWfkioA1P4b2Wk58BueWZq6S6DXtqUrNnuo6DlcnK0797vvyMwXMsMOIh4t
         cRWihri0Znp/w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements save and restore of PLL context.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry pll context is stored and on resume it is
restored back along with its state.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 112 +++++++++++++++++++++++++++++++-------------
 drivers/clk/tegra/clk.h     |   4 ++
 2 files changed, 84 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1583f5fc992f..344605135a70 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1008,6 +1008,50 @@ static unsigned long clk_plle_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
+static int tegra_clk_pll_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	u32 val = 0;
+
+	if (pll->params->flags & TEGRA_PLLMB)
+		val = pll_readl_base(pll);
+	else if (pll->params->flags & TEGRA_PLLRE)
+		val = pll_readl_base(pll) & divp_mask_shifted(pll);
+
+	pll->pllbase_ctx = val;
+	return 0;
+}
+
+static void tegra_clk_pll_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+	unsigned long rate = clk_hw_get_rate(hw);
+	u32 val;
+
+	if (clk_pll_is_enabled(hw))
+		return;
+
+	if (pll->params->flags & TEGRA_PLLMB) {
+		pll_writel_base(pll->pllbase_ctx, pll);
+	} else if (pll->params->flags & TEGRA_PLLRE) {
+		val = pll_readl_base(pll);
+		val &= ~(divp_mask_shifted(pll));
+		pll_writel_base(pll->pllbase_ctx | val, pll);
+	}
+
+	if (pll->params->set_defaults)
+		pll->params->set_defaults(pll);
+
+	clk_pll_set_rate(hw, rate, parent_rate);
+
+	if (!__clk_get_enable_count(hw->clk))
+		clk_pll_disable(hw);
+	else
+		clk_pll_enable(hw);
+}
+
 const struct clk_ops tegra_clk_pll_ops = {
 	.is_enabled = clk_pll_is_enabled,
 	.enable = clk_pll_enable,
@@ -1015,6 +1059,8 @@ const struct clk_ops tegra_clk_pll_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_round_rate,
 	.set_rate = clk_pll_set_rate,
+	.save_context = tegra_clk_pll_save_context,
+	.restore_context = tegra_clk_pll_restore_context,
 };
 
 const struct clk_ops tegra_clk_plle_ops = {
@@ -1802,6 +1848,27 @@ static int clk_pllu_tegra114_enable(struct clk_hw *hw)
 
 	return ret;
 }
+
+static void _clk_plle_tegra_init_parent(struct tegra_clk_pll *pll)
+{
+	u32 val, val_aux;
+
+	/* ensure parent is set to pll_ref */
+	val = pll_readl_base(pll);
+	val_aux = pll_readl(pll->params->aux_reg, pll);
+
+	if (val & PLL_BASE_ENABLE) {
+		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
+		    (val_aux & PLLE_AUX_PLLP_SEL))
+			WARN(1, "pll_e enabled with unsupported parent %s\n",
+			     (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
+			     "pll_re_vco");
+	} else {
+		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
+		pll_writel(val_aux, pll->params->aux_reg, pll);
+		fence_udelay(1, pll->clk_base);
+	}
+}
 #endif
 
 static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
@@ -2214,27 +2281,12 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
 {
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
-	u32 val, val_aux;
 
 	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
-	/* ensure parent is set to pll_re_vco */
-
-	val = pll_readl_base(pll);
-	val_aux = pll_readl(pll_params->aux_reg, pll);
-
-	if (val & PLL_BASE_ENABLE) {
-		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
-			(val_aux & PLLE_AUX_PLLP_SEL))
-			WARN(1, "pll_e enabled with unsupported parent %s\n",
-			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
-					"pll_re_vco");
-	} else {
-		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
-		pll_writel(val_aux, pll_params->aux_reg, pll);
-	}
+	_clk_plle_tegra_init_parent(pll);
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
 				      &tegra_clk_plle_tegra114_ops);
@@ -2276,6 +2328,8 @@ static const struct clk_ops tegra_clk_pllss_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 	.round_rate = clk_pll_ramp_round_rate,
 	.set_rate = clk_pllxc_set_rate,
+	.save_context = tegra_clk_pll_save_context,
+	.restore_context = tegra_clk_pll_restore_context,
 };
 
 struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
@@ -2375,6 +2429,7 @@ struct clk *tegra_clk_register_pllre_tegra210(const char *name,
 		pll_params->vco_min = pll_params->adjust_vco(pll_params,
 							     parent_rate);
 
+	pll_params->flags |= TEGRA_PLLRE;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -2520,11 +2575,19 @@ static void clk_plle_tegra210_disable(struct clk_hw *hw)
 		spin_unlock_irqrestore(pll->lock, flags);
 }
 
+static void tegra_clk_plle_t210_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+
+	_clk_plle_tegra_init_parent(pll);
+}
+
 static const struct clk_ops tegra_clk_plle_tegra210_ops = {
 	.is_enabled =  clk_plle_tegra210_is_enabled,
 	.enable = clk_plle_tegra210_enable,
 	.disable = clk_plle_tegra210_disable,
 	.recalc_rate = clk_pll_recalc_rate,
+	.restore_context = tegra_clk_plle_t210_restore_context,
 };
 
 struct clk *tegra_clk_register_plle_tegra210(const char *name,
@@ -2535,27 +2598,12 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
 {
 	struct tegra_clk_pll *pll;
 	struct clk *clk;
-	u32 val, val_aux;
 
 	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
 
-	/* ensure parent is set to pll_re_vco */
-
-	val = pll_readl_base(pll);
-	val_aux = pll_readl(pll_params->aux_reg, pll);
-
-	if (val & PLLE_BASE_ENABLE) {
-		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
-			(val_aux & PLLE_AUX_PLLP_SEL))
-			WARN(1, "pll_e enabled with unsupported parent %s\n",
-			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
-					"pll_re_vco");
-	} else {
-		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
-		pll_writel(val_aux, pll_params->aux_reg, pll);
-	}
+	_clk_plle_tegra_init_parent(pll);
 
 	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
 				      &tegra_clk_plle_tegra210_ops);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 230c05d8eef0..f1ef6ae8c979 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -233,6 +233,7 @@ struct tegra_clk_pll;
  * TEGRA_PLLMB - PLLMB has should be treated similar to PLLM. This
  *     flag indicated that it is PLLMB.
  * TEGRA_PLL_VCO_OUT - Used to indicate that the PLL has a VCO output
+ * TEGRA_PLLRE - Used to indicate that it is PLLRE
  */
 struct tegra_clk_pll_params {
 	unsigned long	input_min;
@@ -299,6 +300,7 @@ struct tegra_clk_pll_params {
 #define TEGRA_MDIV_NEW BIT(11)
 #define TEGRA_PLLMB BIT(12)
 #define TEGRA_PLL_VCO_OUT BIT(13)
+#define TEGRA_PLLRE BIT(14)
 
 /**
  * struct tegra_clk_pll - Tegra PLL clock
@@ -308,6 +310,7 @@ struct tegra_clk_pll_params {
  * @pmc:	address of PMC, required to read override bits
  * @lock:	register lock
  * @params:	PLL parameters
+ * @pllbase_ctx: pll base register value during suspend and resume
  */
 struct tegra_clk_pll {
 	struct clk_hw	hw;
@@ -315,6 +318,7 @@ struct tegra_clk_pll {
 	void __iomem	*pmc;
 	spinlock_t	*lock;
 	struct tegra_clk_pll_params	*params;
+	u32	pllbase_ctx;
 };
 
 #define to_clk_pll(_hw) container_of(_hw, struct tegra_clk_pll, hw)
-- 
2.7.4

