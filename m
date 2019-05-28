Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49CD52D216
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfE1XJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:20 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16489 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfE1XJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf8c0000>; Tue, 28 May 2019 16:09:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 May 2019 16:09:00 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:59 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:59 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:08:59 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8b0002>; Tue, 28 May 2019 16:08:59 -0700
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
Subject: [PATCH V2 03/12] clk: tegra: save and restore PLLs state for system
Date:   Tue, 28 May 2019 16:08:47 -0700
Message-ID: <1559084936-4610-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084940; bh=/Hx0pFugZ5HOyft79UPXTVIbpFB9kW0A+IwH8WA6lP0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DcQur5Udt76nutMjh5dSj81X8dp3BfSl7LG2+kqY7piY5/Zl5GzpueWpx7VsdmBfJ
         0OARyhV8GXnQxCogrBaFWq/poeT6pc1MmABqJSZXxC5yFK1pDC8lFiYIySFhuUzp9j
         sbXqkciu/rGvS5NMIZER6pnSRpkmNr1XcBoJkZVdTex5M7ECmboFJUvzMXA/JRNB9j
         JYcUDjiJY7pY3nH5IP1mhyBHfcbfJweUxDZtY2bM0cxTP7Ve5tfj2PkyQTqFiHeZ8B
         T3pFsEGaiQFjX/wHUB//NkZql0QQ1sNJNe/5Xw1696BhxdfPaGadLmwc4Z2dFrfQCq
         wasM2j+8un0XQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch has implementation of saving and restoring PLL's state to
support system suspend and resume operations.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-divider.c | 19 ++++++++
 drivers/clk/tegra/clk-pll-out.c | 25 +++++++++++
 drivers/clk/tegra/clk-pll.c     | 99 ++++++++++++++++++++++++++++++++---------
 drivers/clk/tegra/clk.h         |  9 ++++
 4 files changed, 132 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 2a1822a22740..718694727042 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -14,6 +14,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/err.h>
@@ -179,3 +180,21 @@ struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
 					  reg, 16, 1, CLK_DIVIDER_READ_ONLY,
 					  mc_div_table, lock);
 }
+
+#if defined(CONFIG_PM_SLEEP)
+void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate)
+{
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate;
+
+	if (IS_ERR(parent)) {
+		WARN_ON(1);
+		return;
+	}
+
+	parent_rate = clk_hw_get_rate(parent);
+
+	if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
+		WARN_ON(1);
+}
+#endif
diff --git a/drivers/clk/tegra/clk-pll-out.c b/drivers/clk/tegra/clk-pll-out.c
index 257cae0c1488..8b8c3b77d243 100644
--- a/drivers/clk/tegra/clk-pll-out.c
+++ b/drivers/clk/tegra/clk-pll-out.c
@@ -14,6 +14,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/err.h>
@@ -120,3 +121,27 @@ struct clk *tegra_clk_register_pll_out(const char *name,
 
 	return clk;
 }
+
+#if defined(CONFIG_PM_SLEEP)
+void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+
+	if (IS_ERR(parent)) {
+		WARN_ON(1);
+		return;
+	}
+
+	tegra_clk_divider_resume(parent, rate);
+	clk_pll_out_enable(hw);
+}
+
+void tegra_clk_sync_state_pll_out(struct clk *clk)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+
+	if (!__clk_get_enable_count(clk))
+		clk_pll_out_disable(hw);
+}
+#endif
diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 6b976b2514f7..b363b6c6f600 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -20,6 +20,7 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/tegra.h>
 
 #include "clk.h"
 
@@ -1813,6 +1814,28 @@ static int clk_pllu_tegra114_enable(struct clk_hw *hw)
 
 	return ret;
 }
+
+static void _clk_plle_tegra_init_parent(struct tegra_clk_pll *pll)
+{
+	u32 val, val_aux;
+
+	/* ensure parent is set to pll_ref */
+
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
@@ -2289,6 +2312,21 @@ static const struct clk_ops tegra_clk_pllss_ops = {
 	.set_rate = clk_pllxc_set_rate,
 };
 
+static void _pllss_set_defaults(struct tegra_clk_pll *pll)
+{
+	u32 val;
+
+	pll_writel_misc(PLLSS_MISC_DEFAULT, pll);
+	pll_writel(PLLSS_CFG_DEFAULT, pll->params->ext_misc_reg[0], pll);
+	pll_writel(PLLSS_CTRL1_DEFAULT, pll->params->ext_misc_reg[1], pll);
+	pll_writel(PLLSS_CTRL2_DEFAULT, pll->params->ext_misc_reg[2], pll);
+
+	val = pll_readl_base(pll);
+	val &= ~PLLSS_LOCK_OVERRIDE;
+	pll_writel_base(val, pll);
+}
+
 struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 				void __iomem *clk_base, unsigned long flags,
 				struct tegra_clk_pll_params *pll_params,
@@ -2339,10 +2377,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 
 	_update_pll_mnp(pll, &cfg);
 
-	pll_writel_misc(PLLSS_MISC_DEFAULT, pll);
-	pll_writel(PLLSS_CFG_DEFAULT, pll_params->ext_misc_reg[0], pll);
-	pll_writel(PLLSS_CTRL1_DEFAULT, pll_params->ext_misc_reg[1], pll);
-	pll_writel(PLLSS_CTRL1_DEFAULT, pll_params->ext_misc_reg[2], pll);
+	_pllss_set_defaults(pll);
 
 	val = pll_readl_base(pll);
 	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
@@ -2546,27 +2581,12 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
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
@@ -2710,3 +2730,42 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 }
 
 #endif
+
+#if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARCH_TEGRA_210_SOC)
+void tegra_clk_pll_resume(struct clk *c, unsigned long rate)
+{
+	struct clk_hw *hw = __clk_get_hw(c);
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+
+	if (clk_pll_is_enabled(hw))
+		return;
+
+	if (IS_ERR(parent)) {
+		WARN_ON(1);
+		return;
+	}
+
+	if (pll->params->set_defaults)
+		pll->params->set_defaults(pll);
+
+	clk_set_rate(c, rate);
+	clk_pll_enable(hw);
+}
+
+void tegra_clk_sync_state_pll(struct clk *c)
+{
+	struct clk_hw *hw = __clk_get_hw(c);
+
+	if (!__clk_get_enable_count(c))
+		clk_pll_disable(hw);
+}
+
+void tegra_clk_plle_tegra210_resume(struct clk *c)
+{
+	struct clk_hw *hw = __clk_get_hw(c);
+	struct tegra_clk_pll *pll = to_clk_pll(hw);
+
+	_clk_plle_tegra_init_parent(pll);
+}
+#endif
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 09bccbb9640c..e4d124cc5657 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -841,6 +841,15 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
 int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
 		 u8 frac_width, u8 flags);
 
+#ifdef CONFIG_PM_SLEEP
+void tegra_clk_pll_resume(struct clk *c, unsigned long rate);
+void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate);
+void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
+void tegra_clk_plle_tegra210_resume(struct clk *c);
+void tegra_clk_sync_state_pll(struct clk *c);
+void tegra_clk_sync_state_pll_out(struct clk *clk);
+#endif
+
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4

