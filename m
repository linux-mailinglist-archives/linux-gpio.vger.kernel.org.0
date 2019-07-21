Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4076F54C
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 21:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfGUTlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 15:41:07 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15833 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbfGUTlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 15:41:06 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34bfd60000>; Sun, 21 Jul 2019 12:41:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 12:41:03 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 21 Jul 2019 12:41:03 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:03 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:03 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 21 Jul 2019 19:41:03 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.85]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d34bfcd0001>; Sun, 21 Jul 2019 12:41:03 -0700
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
Subject: [PATCH V6 08/21] clk: tegra: clk-periph: Add save and restore support
Date:   Sun, 21 Jul 2019 12:40:47 -0700
Message-ID: <1563738060-30213-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563738071; bh=K4EMK7Ckti8Q7Dg4JGSGEsr+mR5YceM/9vT0vz2nTmA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Ed1KIkJ3OkYSmHMKE5vh++DK0fVnQEMUzw1gRTxFObu8bhLy3TzeYcA/GV6QOdl9X
         UuirkdciiirJlOJfb13cjx4gbuqXcd4whLP8CPsyIqbvGUno63mSi9K5ecBUI5a5Z2
         OWPmPyt6p2aFbnnj+F8zfpgQ8J9VPe+149nwH5awHg9uc/JOeScG+r0nRXAPH4zClb
         2zCiSSa5hdBzRWA6jyuP8eT+6a9Ofe096sb2dlznWEsuzeupc22dyIXpbd+AeMwAst
         urDz5JZo1CJuhrIMYd7qikeVisFisknrwcSL6LCapX/kG0XAqyT136aUm4F3Gqv4FR
         5j8Pl8BQ4TsRA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements save and restore context for peripheral fixed
clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
peripheral clock ops.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry clock and reset state of peripherals is saved
and on resume they are restored to have clocks back to same rate and
state as before suspend.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-periph-fixed.c | 33 +++++++++++++++++++++++++++
 drivers/clk/tegra/clk-periph-gate.c  | 34 ++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-periph.c       | 43 ++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk-sdmmc-mux.c    | 30 +++++++++++++++++++++++++
 drivers/clk/tegra/clk.h              |  8 +++++++
 5 files changed, 148 insertions(+)

diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/clk-periph-fixed.c
index c088e7a280df..21b24530fa00 100644
--- a/drivers/clk/tegra/clk-periph-fixed.c
+++ b/drivers/clk/tegra/clk-periph-fixed.c
@@ -60,11 +60,44 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
+static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
+	u32 mask = 1 << (fixed->num % 32);
+
+	fixed->enb_ctx = readl_relaxed(fixed->base + fixed->regs->enb_reg) &
+			 mask;
+	fixed->rst_ctx = readl_relaxed(fixed->base + fixed->regs->rst_reg) &
+			 mask;
+
+	return 0;
+}
+
+static void tegra_clk_periph_fixed_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
+	u32 mask = 1 << (fixed->num % 32);
+
+	if (fixed->enb_ctx)
+		writel_relaxed(mask, fixed->base + fixed->regs->enb_set_reg);
+	else
+		writel_relaxed(mask, fixed->base + fixed->regs->enb_clr_reg);
+
+	udelay(2);
+
+	if (!fixed->rst_ctx) {
+		udelay(5); /* reset propogation delay */
+		writel_relaxed(mask, fixed->base + fixed->regs->rst_reg);
+	}
+}
+
 static const struct clk_ops tegra_clk_periph_fixed_ops = {
 	.is_enabled = tegra_clk_periph_fixed_is_enabled,
 	.enable = tegra_clk_periph_fixed_enable,
 	.disable = tegra_clk_periph_fixed_disable,
 	.recalc_rate = tegra_clk_periph_fixed_recalc_rate,
+	.save_context = tegra_clk_periph_fixed_save_context,
+	.restore_context = tegra_clk_periph_fixed_restore_context,
 };
 
 struct clk *tegra_clk_register_periph_fixed(const char *name,
diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index 4b31beefc9fc..6ba5b08e0787 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -25,6 +25,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
 
 #define read_rst(gate) \
 	readl_relaxed(gate->clk_base + (gate->regs->rst_reg))
+#define write_rst_set(val, gate) \
+	writel_relaxed(val, gate->clk_base + (gate->regs->rst_set_reg))
 #define write_rst_clr(val, gate) \
 	writel_relaxed(val, gate->clk_base + (gate->regs->rst_clr_reg))
 
@@ -110,10 +112,42 @@ static void clk_periph_disable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&periph_ref_lock, flags);
 }
 
+static int clk_periph_gate_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
+
+	gate->clk_state_ctx = read_enb(gate) & periph_clk_to_bit(gate);
+	gate->rst_state_ctx = read_rst(gate) & periph_clk_to_bit(gate);
+
+	return 0;
+}
+
+static void clk_periph_gate_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_periph_gate *gate = to_clk_periph_gate(hw);
+
+	if (gate->clk_state_ctx)
+		write_enb_set(periph_clk_to_bit(gate), gate);
+	else
+		write_enb_clr(periph_clk_to_bit(gate), gate);
+
+	udelay(5);
+
+	if (!(gate->flags & TEGRA_PERIPH_NO_RESET) &&
+	    !(gate->flags & TEGRA_PERIPH_MANUAL_RESET)) {
+		if (gate->rst_state_ctx)
+			write_rst_set(periph_clk_to_bit(gate), gate);
+		else
+			write_rst_clr(periph_clk_to_bit(gate), gate);
+	}
+}
+
 const struct clk_ops tegra_clk_periph_gate_ops = {
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
 	.disable = clk_periph_disable,
+	.save_context = clk_periph_gate_save_context,
+	.restore_context = clk_periph_gate_restore_context,
 };
 
 struct clk *tegra_clk_register_periph_gate(const char *name,
diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 58437da25156..b29a1ed2ec08 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/export.h>
+#include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 
@@ -99,6 +100,42 @@ static void clk_periph_disable(struct clk_hw *hw)
 	gate_ops->disable(gate_hw);
 }
 
+static int clk_periph_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_periph *periph = to_clk_periph(hw);
+	const struct clk_ops *gate_ops = periph->gate_ops;
+	struct clk_hw *gate_hw = &periph->gate.hw;
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
+		gate_ops->save_context(gate_hw);
+
+	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
+		periph->rate_ctx = clk_periph_recalc_rate(hw, parent_rate);
+
+	periph->parent_ctx = clk_periph_get_parent(hw);
+
+	return 0;
+}
+
+static void clk_periph_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_periph *periph = to_clk_periph(hw);
+	const struct clk_ops *gate_ops = periph->gate_ops;
+	struct clk_hw *gate_hw = &periph->gate.hw;
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	clk_periph_set_parent(hw, periph->parent_ctx);
+
+	if (!(periph->gate.flags & TEGRA_PERIPH_NO_DIV))
+		clk_periph_set_rate(hw, periph->rate_ctx, parent_rate);
+
+	if (!(periph->gate.flags & TEGRA_PERIPH_NO_GATE))
+		gate_ops->restore_context(gate_hw);
+}
+
 const struct clk_ops tegra_clk_periph_ops = {
 	.get_parent = clk_periph_get_parent,
 	.set_parent = clk_periph_set_parent,
@@ -108,6 +145,8 @@ const struct clk_ops tegra_clk_periph_ops = {
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
 	.disable = clk_periph_disable,
+	.save_context = clk_periph_save_context,
+	.restore_context = clk_periph_restore_context,
 };
 
 static const struct clk_ops tegra_clk_periph_nodiv_ops = {
@@ -116,6 +155,8 @@ static const struct clk_ops tegra_clk_periph_nodiv_ops = {
 	.is_enabled = clk_periph_is_enabled,
 	.enable = clk_periph_enable,
 	.disable = clk_periph_disable,
+	.save_context = clk_periph_save_context,
+	.restore_context = clk_periph_restore_context,
 };
 
 static const struct clk_ops tegra_clk_periph_no_gate_ops = {
@@ -124,6 +165,8 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
 	.recalc_rate = clk_periph_recalc_rate,
 	.round_rate = clk_periph_round_rate,
 	.set_rate = clk_periph_set_rate,
+	.save_context = clk_periph_save_context,
+	.restore_context = clk_periph_restore_context,
 };
 
 static struct clk *_tegra_clk_register_periph(const char *name,
diff --git a/drivers/clk/tegra/clk-sdmmc-mux.c b/drivers/clk/tegra/clk-sdmmc-mux.c
index a5cd3e31dbae..fffe08e02c10 100644
--- a/drivers/clk/tegra/clk-sdmmc-mux.c
+++ b/drivers/clk/tegra/clk-sdmmc-mux.c
@@ -194,6 +194,34 @@ static void clk_sdmmc_mux_disable(struct clk_hw *hw)
 	gate_ops->disable(gate_hw);
 }
 
+static int clk_sdmmc_mux_save_context(struct clk_hw *hw)
+{
+	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
+	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
+	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	sdmmc_mux->rate_ctx = clk_sdmmc_mux_recalc_rate(hw, parent_rate);
+	sdmmc_mux->parent_ctx = clk_sdmmc_mux_get_parent(hw);
+	gate_ops->save_context(gate_hw);
+
+	return 0;
+}
+
+static void clk_sdmmc_mux_restore_context(struct clk_hw *hw)
+{
+	struct tegra_sdmmc_mux *sdmmc_mux = to_clk_sdmmc_mux(hw);
+	const struct clk_ops *gate_ops = sdmmc_mux->gate_ops;
+	struct clk_hw *gate_hw = &sdmmc_mux->gate.hw;
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	clk_sdmmc_mux_set_parent(hw, sdmmc_mux->parent_ctx);
+	clk_sdmmc_mux_set_rate(hw, sdmmc_mux->rate_ctx, parent_rate);
+	gate_ops->restore_context(gate_hw);
+}
+
 static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
 	.get_parent = clk_sdmmc_mux_get_parent,
 	.set_parent = clk_sdmmc_mux_set_parent,
@@ -203,6 +231,8 @@ static const struct clk_ops tegra_clk_sdmmc_mux_ops = {
 	.is_enabled = clk_sdmmc_mux_is_enabled,
 	.enable = clk_sdmmc_mux_enable,
 	.disable = clk_sdmmc_mux_disable,
+	.save_context = clk_sdmmc_mux_save_context,
+	.restore_context = clk_sdmmc_mux_restore_context,
 };
 
 struct clk *tegra_clk_register_sdmmc_mux_div(const char *name,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 3cd003b7512a..ac6de3a0b91f 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -523,6 +523,8 @@ struct tegra_clk_periph_gate {
 	int			clk_num;
 	int			*enable_refcnt;
 	const struct tegra_clk_periph_regs *regs;
+	bool			clk_state_ctx;
+	bool			rst_state_ctx;
 };
 
 #define to_clk_periph_gate(_hw)					\
@@ -549,6 +551,8 @@ struct tegra_clk_periph_fixed {
 	unsigned int mul;
 	unsigned int div;
 	unsigned int num;
+	bool enb_ctx;
+	bool rst_ctx;
 };
 
 struct clk *tegra_clk_register_periph_fixed(const char *name,
@@ -581,6 +585,8 @@ struct tegra_clk_periph {
 	const struct clk_ops	*mux_ops;
 	const struct clk_ops	*div_ops;
 	const struct clk_ops	*gate_ops;
+	unsigned long		rate_ctx;
+	u8			parent_ctx;
 };
 
 #define to_clk_periph(_hw) container_of(_hw, struct tegra_clk_periph, hw)
@@ -732,6 +738,8 @@ struct tegra_sdmmc_mux {
 	const struct clk_ops	*gate_ops;
 	struct tegra_clk_periph_gate	gate;
 	u8			div_flags;
+	unsigned long		rate_ctx;
+	u8			parent_ctx;
 };
 
 #define to_clk_sdmmc_mux(_hw) container_of(_hw, struct tegra_sdmmc_mux, hw)
-- 
2.7.4

