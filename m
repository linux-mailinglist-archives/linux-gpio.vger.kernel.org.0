Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB38942A612
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237101AbhJLNoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237108AbhJLNn6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:43:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A65C061764;
        Tue, 12 Oct 2021 06:41:55 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i24so85999152lfj.13;
        Tue, 12 Oct 2021 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EyjxGlBKFT580NBuuCRsa44pKY08piWvK/f5t3xuptA=;
        b=L6VVnbF2xiMuMOp05dY5Qa2BTfTqlgXErFJ+dAxbAFq1EobIEl6qZmlEb855i+nlKT
         HUYJ772stAmeK/uYhRhwyrt+D427mEV3MWOzVTQiqR1gefngrkjAQ48IIksGBkLKgVPk
         80Dm5s1diJI4VZUHqC7AAdKwaXRScTfI+5x9rsMY076aqBC024l1rqY2+p0N0X4FGY8w
         Ug4FZO95pcV2hTTqqIX7P+sA9q78PQKVkxOlvN+EHOAgEUiUOA8icpX8xwe7iJgcxPJe
         tBrHWrvdVi2A6+5/8Hzfs+8MoBOMzizjp/8B6JT59uETowBQgavS//hv51+/Z007L4/v
         049Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=EyjxGlBKFT580NBuuCRsa44pKY08piWvK/f5t3xuptA=;
        b=uCtpDX7piXZzcWm04aHmzSxP/5rifka+sdvSw6ZXiM/oEeW1y/9NKJnycmXOFB62Wt
         vfwY4NpJQkTZsBCYKUBEJIxWuGhFvG+0kBEyBOTEU/iHHKCt+VBKg+vXAFP8mQ5xS9MO
         xy8mChaa3jy/2w2lEjdAjD1nT793zqPwJZKE2Bd7PGqvjbdV917GveF/00fZ6CY7dBp3
         f2n+/x4rfR0Qg5+pQxjy2LoY4MTenKCbymqD5lUCmvUhYkyxPVlFv5SfPRvCFcTkcKqV
         e43z4JA4L+0qH/DjS3MF1W/6CTE6vhJ467wi4Wts3STZsADeU4lJzM1DHS/K1vclUgb3
         R9xA==
X-Gm-Message-State: AOAM53185ZSO/gBdUON1VHEVYdcyhASgnnzdoyFuptGL6usyo0sQVB5l
        lszH5Xp+EXphJnaBBXyJbIE=
X-Google-Smtp-Source: ABdhPJwMfO7/PhMOAO8hZZcoknPhcj8O96SRwfTr9t77SLBWxMXhwKNhG3Hnqaqv1eCS7Xsg/uKDAA==
X-Received: by 2002:a2e:2e03:: with SMTP id u3mr29926536lju.269.1634046114267;
        Tue, 12 Oct 2021 06:41:54 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:53 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
Date:   Tue, 12 Oct 2021 15:40:17 +0200
Message-Id: <20211012134027.684712-7-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add a driver for the StarFive JH7100 clock generator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 MAINTAINERS                                |   7 +
 drivers/clk/Kconfig                        |   1 +
 drivers/clk/Makefile                       |   1 +
 drivers/clk/starfive/Kconfig               |  10 +
 drivers/clk/starfive/Makefile              |   3 +
 drivers/clk/starfive/clk-starfive-jh7100.c | 769 +++++++++++++++++++++
 6 files changed, 791 insertions(+)
 create mode 100644 drivers/clk/starfive/Kconfig
 create mode 100644 drivers/clk/starfive/Makefile
 create mode 100644 drivers/clk/starfive/clk-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a4a0c2baaf27..d2b95b96f0ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17847,6 +17847,13 @@ M:	Ion Badulescu <ionut@badula.org>
 S:	Odd Fixes
 F:	drivers/net/ethernet/adaptec/starfire*
 
+STARFIVE JH7100 CLOCK DRIVER
+M:	Emil Renner Berthing <kernel@esmil.dk>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
+F:	drivers/clk/starfive/clk-starfive-jh7100.c
+F:	include/dt-bindings/clock/starfive-jh7100.h
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@redhat.com>
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc97396a..c91931c94888 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -412,6 +412,7 @@ source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/sifive/Kconfig"
 source "drivers/clk/socfpga/Kconfig"
 source "drivers/clk/sprd/Kconfig"
+source "drivers/clk/starfive/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
 source "drivers/clk/tegra/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e42312121e51..a9bb2478fbdd 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -109,6 +109,7 @@ obj-y					+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
+obj-$(CONFIG_SOC_STARFIVE)		+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-$(CONFIG_SUNXI_CCU)			+= sunxi-ng/
 obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
new file mode 100644
index 000000000000..801326c18327
--- /dev/null
+++ b/drivers/clk/starfive/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config CLK_STARFIVE_JH7100
+	bool "StarFive JH7100 clock support"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on OF
+	default SOC_STARFIVE
+	help
+	  Say yes here to support the clock controller on the StarFive JH7100
+	  SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
new file mode 100644
index 000000000000..09759cc73530
--- /dev/null
+++ b/drivers/clk/starfive/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+# StarFive Clock
+obj-$(CONFIG_CLK_STARFIVE_JH7100)	+= clk-starfive-jh7100.o
diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
new file mode 100644
index 000000000000..ce1ec8155da3
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jh7100.c
@@ -0,0 +1,769 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JH7100 Clock Generator Driver
+ *
+ * Copyright 2021 Ahmad Fatoum, Pengutronix
+ * Copyright (C) 2021 Glider bv
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/starfive-jh7100.h>
+
+#define JH7100_CLK_ENABLE_SHIFT	31
+#define JH7100_CLK_INVERT_SHIFT	30
+#define JH7100_CLK_MUX_SHIFT	24
+
+#define JH7100_CLK_ENABLE	BIT(31)
+#define JH7100_CLK_INVERT	BIT(30)
+#define JH7100_CLK_MUX_MASK	GENMASK(27, 24)
+#define JH7100_CLK_DIV_MASK	GENMASK(23, 0)
+
+static const char *const cpundbus_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll0_out",
+	[2] = "pll1_out",
+	[3] = "pll2_out",
+};
+
+static const char *const dla_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll1_out",
+	[2] = "pll2_out",
+};
+
+static const char *const dsp_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll0_out",
+	[2] = "pll1_out",
+	[3] = "pll2_out",
+};
+
+static const char *const gmacusb_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll0_out",
+	[2] = "pll2_out",
+};
+
+static const char *const perh0_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll0_out",
+};
+
+static const char *const perh1_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll2_out",
+};
+
+static const char *const vin_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll1_out",
+	[2] = "pll2_out",
+};
+
+static const char *const vout_root_sels[] __initconst = {
+	[0] = "osc_aud",
+	[1] = "pll0_out",
+	[2] = "pll2_out",
+};
+
+static const char *const cdechifi4_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll1_out",
+	[2] = "pll2_out",
+};
+
+static const char *const cdec_root_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "pll0_out",
+	[2] = "pll1_out",
+};
+
+static const char *const voutbus_root_sels[] __initconst = {
+	[0] = "osc_aud",
+	[1] = "pll0_out",
+	[2] = "pll2_out",
+};
+
+static const char *const pll2_refclk_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "osc_aud",
+};
+
+static const char *const ddrc0_sels[] __initconst = {
+	[0] = "ddrosc_div2",
+	[1] = "ddrpll_div2",
+	[2] = "ddrpll_div4",
+	[3] = "ddrpll_div8",
+};
+
+static const char *const ddrc1_sels[] __initconst = {
+	[0] = "ddrosc_div2",
+	[1] = "ddrpll_div2",
+	[2] = "ddrpll_div4",
+	[3] = "ddrpll_div8",
+};
+
+static const char *const nne_bus_sels[] __initconst = {
+	[0] = "cpu_axi",
+	[1] = "nnebus_src1",
+};
+
+static const char *const usbphy_25m_sels[] __initconst = {
+	[0] = "osc_sys",
+	[1] = "usbphy_plldiv25m",
+};
+
+static const char *const gmac_tx_sels[] __initconst = {
+	[0] = "gmac_gtxclk",
+	[1] = "gmac_mii_txclk",
+	[2] = "gmac_rmii_txclk",
+};
+
+static const char *const gmac_rx_pre_sels[] __initconst = {
+	[0] = "gmac_gr_mii_rxclk",
+	[1] = "gmac_rmii_rxclk",
+};
+
+struct jh7100_clk {
+	struct clk_hw hw;
+	unsigned int idx;
+	u32 max;
+};
+
+struct clk_starfive_jh7100_priv {
+	/* protect registers against overlapping read-modify-write */
+	spinlock_t rmw_lock;
+	struct device *dev;
+	void __iomem *base;
+	struct clk_hw *pll[3];
+	struct jh7100_clk reg[JH7100_CLK_PLL0_OUT];
+};
+
+static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
+{
+	return container_of(hw, struct jh7100_clk, hw);
+}
+
+static struct clk_starfive_jh7100_priv *jh7100_priv_from(struct jh7100_clk *clk)
+{
+	return container_of(clk, struct clk_starfive_jh7100_priv, reg[clk->idx]);
+}
+
+static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
+{
+	struct clk_starfive_jh7100_priv *priv = jh7100_priv_from(clk);
+	void __iomem *reg = priv->base + 4 * clk->idx;
+
+	return readl_relaxed(reg);
+}
+
+static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
+{
+	struct clk_starfive_jh7100_priv *priv = jh7100_priv_from(clk);
+	void __iomem *reg = priv->base + 4 * clk->idx;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	value |= readl_relaxed(reg) & ~mask;
+	writel_relaxed(value, reg);
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+}
+
+static int jh7100_clk_enable(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+
+	dev_dbg(jh7100_priv_from(clk)->dev, "enable(%s)\n", clk_hw_get_name(&clk->hw));
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
+	return 0;
+}
+
+static void jh7100_clk_disable(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+
+	dev_dbg(jh7100_priv_from(clk)->dev, "disable(%s)\n", clk_hw_get_name(&clk->hw));
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
+}
+
+static int jh7100_clk_is_enabled(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+
+	return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
+}
+
+static int jh7100_clk_is_parent_enabled(struct clk_hw *hw)
+{
+	return clk_hw_is_enabled(clk_hw_get_parent(hw));
+}
+
+static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
+	unsigned long rate;
+
+	if (value)
+		rate = parent_rate / value;
+	else
+		rate = 0;
+
+	dev_dbg(jh7100_priv_from(clk)->dev, "recalc_rate(%s, %lu) = %lu (div %u)\n",
+		clk_hw_get_name(&clk->hw), parent_rate, rate, value);
+
+	return rate;
+}
+
+static unsigned long jh7100_clk_bestdiv(struct jh7100_clk *clk,
+					unsigned long rate, unsigned long parent)
+{
+	unsigned long max = clk->max & JH7100_CLK_DIV_MASK;
+	unsigned long div = DIV_ROUND_UP(parent, rate);
+
+	if (div > max)
+		div = max;
+
+	return div;
+}
+
+static int jh7100_clk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	unsigned long parent = req->best_parent_rate;
+	unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
+	unsigned long div = jh7100_clk_bestdiv(clk, rate, parent);
+
+	rate = parent / div;
+	if (rate < req->min_rate && div > 1) {
+		div -= 1;
+		rate = parent / div;
+	}
+
+	dev_dbg(jh7100_priv_from(clk)->dev,
+		"determine_rate(%s, {%lu<=%lu<=%lu from %lu}) = %lu (div %lu)\n",
+		clk_hw_get_name(&clk->hw), req->min_rate, req->rate, req->max_rate,
+		parent, rate, div);
+
+	req->rate = rate;
+	return 0;
+}
+
+static int jh7100_clk_set_rate(struct clk_hw *hw,
+			       unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	unsigned long div = jh7100_clk_bestdiv(clk, rate, parent_rate);
+
+	dev_dbg(jh7100_priv_from(clk)->dev,
+		"set_rate(%s, %lu, %lu) = %lu (div %lu)\n",
+		clk_hw_get_name(&clk->hw), rate, parent_rate,
+		parent_rate / div, div);
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
+	return 0;
+}
+
+static u8 jh7100_clk_get_parent(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = jh7100_clk_reg_get(clk);
+
+	return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
+}
+
+static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
+
+	dev_dbg(jh7100_priv_from(clk)->dev, "set_parent(%s, %u)\n",
+		clk_hw_get_name(&clk->hw), index);
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
+	return 0;
+}
+
+static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	int ret = clk_mux_determine_rate_flags(&clk->hw, req, 0);
+
+	dev_dbg(jh7100_priv_from(clk)->dev, "determine_rate(%s) = %d\n",
+		clk_hw_get_name(&clk->hw), ret);
+
+	return ret;
+}
+
+static int jh7100_clk_get_phase(struct clk_hw *hw)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value = jh7100_clk_reg_get(clk);
+
+	return (value & JH7100_CLK_INVERT) ? 180 : 0;
+}
+
+static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	u32 value;
+
+	dev_dbg(jh7100_priv_from(clk)->dev, "set_phase(%s, %d)\n",
+		clk_hw_get_name(&clk->hw), degrees);
+
+	if (degrees == 0)
+		value = 0;
+	else if (degrees == 180)
+		value = JH7100_CLK_INVERT;
+	else
+		return -EINVAL;
+
+	jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	static const struct debugfs_reg32 jh7100_clk_reg = {
+		.name = "CTRL",
+		.offset = 0,
+	};
+	struct jh7100_clk *clk = jh7100_clk_from(hw);
+	struct clk_starfive_jh7100_priv *priv = jh7100_priv_from(clk);
+	struct debugfs_regset32 *regset;
+
+	regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return;
+
+	regset->regs = &jh7100_clk_reg;
+	regset->nregs = 1;
+	regset->base = priv->base + 4 * clk->idx;
+
+	debugfs_create_regset32("registers", 0400, dentry, regset);
+}
+#else
+#define jh7100_clk_debug_init NULL
+#endif
+
+static const struct clk_ops jh7100_clk_gate_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_div_ops = {
+	.is_enabled = jh7100_clk_is_parent_enabled,
+	.recalc_rate = jh7100_clk_recalc_rate,
+	.determine_rate = jh7100_clk_determine_rate,
+	.set_rate = jh7100_clk_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_gdiv_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.recalc_rate = jh7100_clk_recalc_rate,
+	.determine_rate = jh7100_clk_determine_rate,
+	.set_rate = jh7100_clk_set_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_mux_ops = {
+	.is_enabled = jh7100_clk_is_parent_enabled,
+	.get_parent = jh7100_clk_get_parent,
+	.set_parent = jh7100_clk_set_parent,
+	.determine_rate = jh7100_clk_mux_determine_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_gmux_ops = {
+	.enable = jh7100_clk_enable,
+	.disable = jh7100_clk_disable,
+	.is_enabled = jh7100_clk_is_enabled,
+	.get_parent = jh7100_clk_get_parent,
+	.set_parent = jh7100_clk_set_parent,
+	.determine_rate = jh7100_clk_mux_determine_rate,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+static const struct clk_ops jh7100_clk_inv_ops = {
+	.is_enabled = jh7100_clk_is_parent_enabled,
+	.get_phase = jh7100_clk_get_phase,
+	.set_phase = jh7100_clk_set_phase,
+	.debug_init = jh7100_clk_debug_init,
+};
+
+#define JH7100_GATE(_idx, _name, _parent, _flags) [_idx] = { \
+	.name = _name, \
+	.ops = &jh7100_clk_gate_ops, \
+	.parent = _parent, \
+	.flags = CLK_SET_RATE_PARENT | (_flags), \
+	.max = JH7100_CLK_ENABLE, \
+}
+
+#define JH7100__DIV(_idx, _name, _parent, _max) [_idx] = { \
+	.name = _name, \
+	.ops = &jh7100_clk_div_ops, \
+	.parent = _parent, \
+	.flags = 0, \
+	.max = _max, \
+}
+
+#define JH7100_GDIV(_idx, _name, _parent, _max, _flags) [_idx] = { \
+	.name = _name, \
+	.ops = &jh7100_clk_gdiv_ops, \
+	.parent = _parent, \
+	.flags = (_flags), \
+	.max = JH7100_CLK_ENABLE | (_max), \
+}
+
+#define JH7100__MUX(_idx, _name, _parents) [_idx] = { \
+	.name = _name, \
+	.ops = &jh7100_clk_mux_ops, \
+	.parents = _parents, \
+	.flags = 0, \
+	.max = (ARRAY_SIZE(_parents) - 1) << JH7100_CLK_MUX_SHIFT, \
+}
+
+#define JH7100_GMUX(_idx, _name, _parents, _flags) [_idx] = { \
+	.name = _name, \
+	.ops = &jh7100_clk_gmux_ops, \
+	.parents = _parents, \
+	.flags = (_flags), \
+	.max = JH7100_CLK_ENABLE | \
+		((ARRAY_SIZE(_parents) - 1) << JH7100_CLK_MUX_SHIFT), \
+}
+
+#define JH7100__INV(_idx, _name, _parent) [_idx] = { \
+	.name = _name, \
+	.ops = &jh7100_clk_inv_ops, \
+	.parent = _parent, \
+	.flags = CLK_SET_RATE_PARENT, \
+	.max = JH7100_CLK_INVERT, \
+}
+
+static const struct {
+	const char *name;
+	const struct clk_ops *ops;
+	union {
+		const char *parent;
+		const char *const *parents;
+	};
+	unsigned long flags;
+	u32 max;
+} jh7100_clk_data[] __initconst = {
+	JH7100__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", cpundbus_root_sels),
+	JH7100__MUX(JH7100_CLK_DLA_ROOT, "dla_root", dla_root_sels),
+	JH7100__MUX(JH7100_CLK_DSP_ROOT, "dsp_root", dsp_root_sels),
+	JH7100__MUX(JH7100_CLK_GMACUSB_ROOT, "gmacusb_root", gmacusb_root_sels),
+	JH7100__MUX(JH7100_CLK_PERH0_ROOT, "perh0_root", perh0_root_sels),
+	JH7100__MUX(JH7100_CLK_PERH1_ROOT, "perh1_root", perh1_root_sels),
+	JH7100__MUX(JH7100_CLK_VIN_ROOT, "vin_root", vin_root_sels),
+	JH7100__MUX(JH7100_CLK_VOUT_ROOT, "vout_root", vout_root_sels),
+	JH7100_GDIV(JH7100_CLK_AUDIO_ROOT, "audio_root", "pll0_out", 8, 0),
+	JH7100__MUX(JH7100_CLK_CDECHIFI4_ROOT, "cdechifi4_root", cdechifi4_root_sels),
+	JH7100__MUX(JH7100_CLK_CDEC_ROOT, "cdec_root", cdec_root_sels),
+	JH7100__MUX(JH7100_CLK_VOUTBUS_ROOT, "voutbus_root", voutbus_root_sels),
+	JH7100__DIV(JH7100_CLK_CPUNBUS_ROOT_DIV, "cpunbus_root_div", "cpundbus_root", 2),
+	JH7100__DIV(JH7100_CLK_DSP_ROOT_DIV, "dsp_root_div", "dsp_root", 4),
+	JH7100__DIV(JH7100_CLK_PERH0_SRC, "perh0_src", "perh0_root", 4),
+	JH7100__DIV(JH7100_CLK_PERH1_SRC, "perh1_src", "perh1_root", 4),
+	JH7100_GDIV(JH7100_CLK_PLL0_TESTOUT, "pll0_testout", "perh0_src", 31, 0),
+	JH7100_GDIV(JH7100_CLK_PLL1_TESTOUT, "pll1_testout", "dla_root", 31, 0),
+	JH7100_GDIV(JH7100_CLK_PLL2_TESTOUT, "pll2_testout", "perh1_src", 31, 0),
+	JH7100__MUX(JH7100_CLK_PLL2_REF, "pll2_refclk", pll2_refclk_sels),
+	JH7100__DIV(JH7100_CLK_CPU_CORE, "cpu_core", "cpunbus_root_div", 8),
+	JH7100__DIV(JH7100_CLK_CPU_AXI, "cpu_axi", "cpu_core", 8),
+	JH7100__DIV(JH7100_CLK_AHB_BUS, "ahb_bus", "cpunbus_root_div", 8),
+	JH7100__DIV(JH7100_CLK_APB1_BUS, "apb1_bus", "ahb_bus", 8),
+	JH7100__DIV(JH7100_CLK_APB2_BUS, "apb2_bus", "ahb_bus", 8),
+	JH7100_GATE(JH7100_CLK_DOM3AHB_BUS, "dom3ahb_bus", "ahb_bus", CLK_IGNORE_UNUSED),
+	JH7100_GATE(JH7100_CLK_DOM7AHB_BUS, "dom7ahb_bus", "ahb_bus", CLK_IGNORE_UNUSED),
+	JH7100_GATE(JH7100_CLK_U74_CORE0, "u74_core0", "cpu_core", CLK_IGNORE_UNUSED),
+	JH7100_GDIV(JH7100_CLK_U74_CORE1, "u74_core1", "cpu_core", 8, CLK_IGNORE_UNUSED),
+	JH7100_GATE(JH7100_CLK_U74_AXI, "u74_axi", "cpu_axi", CLK_IGNORE_UNUSED),
+	JH7100_GATE(JH7100_CLK_U74RTC_TOGGLE, "u74rtc_toggle", "osc_sys", CLK_IGNORE_UNUSED),
+	JH7100_GATE(JH7100_CLK_SGDMA2P_AXI, "sgdma2p_axi", "cpu_axi", 0),
+	JH7100_GATE(JH7100_CLK_DMA2PNOC_AXI, "dma2pnoc_axi", "cpu_axi", 0),
+	JH7100_GATE(JH7100_CLK_SGDMA2P_AHB, "sgdma2p_ahb", "ahb_bus", 0),
+	JH7100__DIV(JH7100_CLK_DLA_BUS, "dla_bus", "dla_root", 4),
+	JH7100_GATE(JH7100_CLK_DLA_AXI, "dla_axi", "dla_bus", 0),
+	JH7100_GATE(JH7100_CLK_DLANOC_AXI, "dlanoc_axi", "dla_bus", 0),
+	JH7100_GATE(JH7100_CLK_DLA_APB, "dla_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_VP6_CORE, "vp6_core", "dsp_root_div", 4, 0),
+	JH7100__DIV(JH7100_CLK_VP6BUS_SRC, "vp6bus_src", "dsp_root", 4),
+	JH7100_GDIV(JH7100_CLK_VP6_AXI, "vp6_axi", "vp6bus_src", 4, 0),
+	JH7100__DIV(JH7100_CLK_VCDECBUS_SRC, "vcdecbus_src", "cdechifi4_root", 4),
+	JH7100__DIV(JH7100_CLK_VDEC_BUS, "vdec_bus", "vcdecbus_src", 8),
+	JH7100_GATE(JH7100_CLK_VDEC_AXI, "vdec_axi", "vdec_bus", 0),
+	JH7100_GATE(JH7100_CLK_VDECBRG_MAIN, "vdecbrg_mainclk", "vdec_bus", 0),
+	JH7100_GDIV(JH7100_CLK_VDEC_BCLK, "vdec_bclk", "vcdecbus_src", 8, 0),
+	JH7100_GDIV(JH7100_CLK_VDEC_CCLK, "vdec_cclk", "cdec_root", 8, 0),
+	JH7100_GATE(JH7100_CLK_VDEC_APB, "vdec_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_JPEG_AXI, "jpeg_axi", "cpunbus_root_div", 8, 0),
+	JH7100_GDIV(JH7100_CLK_JPEG_CCLK, "jpeg_cclk", "cpunbus_root_div", 8, 0),
+	JH7100_GATE(JH7100_CLK_JPEG_APB, "jpeg_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_GC300_2X, "gc300_2x", "cdechifi4_root", 8, 0),
+	JH7100_GATE(JH7100_CLK_GC300_AHB, "gc300_ahb", "ahb_bus", 0),
+	JH7100__DIV(JH7100_CLK_JPCGC300_AXIBUS, "jpcgc300_axibus", "vcdecbus_src", 8),
+	JH7100_GATE(JH7100_CLK_GC300_AXI, "gc300_axi", "jpcgc300_axibus", 0),
+	JH7100_GATE(JH7100_CLK_JPCGC300_MAIN, "jpcgc300_mainclk", "jpcgc300_axibus", 0),
+	JH7100__DIV(JH7100_CLK_VENC_BUS, "venc_bus", "vcdecbus_src", 8),
+	JH7100_GATE(JH7100_CLK_VENC_AXI, "venc_axi", "venc_bus", 0),
+	JH7100_GATE(JH7100_CLK_VENCBRG_MAIN, "vencbrg_mainclk", "venc_bus", 0),
+	JH7100_GDIV(JH7100_CLK_VENC_BCLK, "venc_bclk", "vcdecbus_src", 8, 0),
+	JH7100_GDIV(JH7100_CLK_VENC_CCLK, "venc_cclk", "cdec_root", 8, 0),
+	JH7100_GATE(JH7100_CLK_VENC_APB, "venc_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_DDRPLL_DIV2, "ddrpll_div2", "pll1_out", 2, CLK_IGNORE_UNUSED),
+	JH7100_GDIV(JH7100_CLK_DDRPLL_DIV4, "ddrpll_div4", "ddrpll_div2", 2, CLK_IGNORE_UNUSED),
+	JH7100_GDIV(JH7100_CLK_DDRPLL_DIV8, "ddrpll_div8", "ddrpll_div4", 2, CLK_IGNORE_UNUSED),
+	JH7100_GDIV(JH7100_CLK_DDROSC_DIV2, "ddrosc_div2", "osc_sys", 2, CLK_IGNORE_UNUSED),
+	JH7100_GMUX(JH7100_CLK_DDRC0, "ddrc0", ddrc0_sels, CLK_IGNORE_UNUSED),
+	JH7100_GMUX(JH7100_CLK_DDRC1, "ddrc1", ddrc1_sels, CLK_IGNORE_UNUSED),
+	JH7100_GATE(JH7100_CLK_DDRPHY_APB, "ddrphy_apb", "apb1_bus", CLK_IGNORE_UNUSED),
+	JH7100__DIV(JH7100_CLK_NOC_ROB, "noc_rob", "cpunbus_root_div", 8),
+	JH7100__DIV(JH7100_CLK_NOC_COG, "noc_cog", "dla_root", 8),
+	JH7100_GATE(JH7100_CLK_NNE_AHB, "nne_ahb", "ahb_bus", 0),
+	JH7100__DIV(JH7100_CLK_NNEBUS_SRC1, "nnebus_src1", "dsp_root", 4),
+	JH7100__MUX(JH7100_CLK_NNE_BUS, "nne_bus", nne_bus_sels),
+	JH7100_GATE(JH7100_CLK_NNE_AXI, "nne_axi", "nne_bus", 0),
+	JH7100_GATE(JH7100_CLK_NNENOC_AXI, "nnenoc_axi", "nne_bus", 0),
+	JH7100_GATE(JH7100_CLK_DLASLV_AXI, "dlaslv_axi", "nne_bus", 0),
+	JH7100_GATE(JH7100_CLK_DSPX2C_AXI, "dspx2c_axi", "nne_bus", CLK_IGNORE_UNUSED),
+	JH7100__DIV(JH7100_CLK_HIFI4_SRC, "hifi4_src", "cdechifi4_root", 4),
+	JH7100__DIV(JH7100_CLK_HIFI4_COREFREE, "hifi4_corefree", "hifi4_src", 8),
+	JH7100_GATE(JH7100_CLK_HIFI4_CORE, "hifi4_core", "hifi4_corefree", 0),
+	JH7100__DIV(JH7100_CLK_HIFI4_BUS, "hifi4_bus", "hifi4_corefree", 8),
+	JH7100_GATE(JH7100_CLK_HIFI4_AXI, "hifi4_axi", "hifi4_bus", 0),
+	JH7100_GATE(JH7100_CLK_HIFI4NOC_AXI, "hifi4noc_axi", "hifi4_bus", 0),
+	JH7100__DIV(JH7100_CLK_SGDMA1P_BUS, "sgdma1p_bus", "cpunbus_root_div", 8),
+	JH7100_GATE(JH7100_CLK_SGDMA1P_AXI, "sgdma1p_axi", "sgdma1p_bus", 0),
+	JH7100_GATE(JH7100_CLK_DMA1P_AXI, "dma1p_axi", "sgdma1p_bus", 0),
+	JH7100_GDIV(JH7100_CLK_X2C_AXI, "x2c_axi", "cpunbus_root_div", 8, CLK_IGNORE_UNUSED),
+	JH7100__DIV(JH7100_CLK_USB_BUS, "usb_bus", "cpunbus_root_div", 8),
+	JH7100_GATE(JH7100_CLK_USB_AXI, "usb_axi", "usb_bus", 0),
+	JH7100_GATE(JH7100_CLK_USBNOC_AXI, "usbnoc_axi", "usb_bus", 0),
+	JH7100__DIV(JH7100_CLK_USBPHY_ROOTDIV, "usbphy_rootdiv", "gmacusb_root", 4),
+	JH7100_GDIV(JH7100_CLK_USBPHY_125M, "usbphy_125m", "usbphy_rootdiv", 8, 0),
+	JH7100_GDIV(JH7100_CLK_USBPHY_PLLDIV25M, "usbphy_plldiv25m", "usbphy_rootdiv", 32, 0),
+	JH7100__MUX(JH7100_CLK_USBPHY_25M, "usbphy_25m", usbphy_25m_sels),
+	JH7100__DIV(JH7100_CLK_AUDIO_DIV, "audio_div", "audio_root", 131072),
+	JH7100_GATE(JH7100_CLK_AUDIO_SRC, "audio_src", "audio_div", 0),
+	JH7100_GATE(JH7100_CLK_AUDIO_12288, "audio_12288", "osc_aud", 0),
+	JH7100_GDIV(JH7100_CLK_VIN_SRC, "vin_src", "vin_root", 4, 0),
+	JH7100__DIV(JH7100_CLK_ISP0_BUS, "isp0_bus", "vin_src", 8),
+	JH7100_GATE(JH7100_CLK_ISP0_AXI, "isp0_axi", "isp0_bus", 0),
+	JH7100_GATE(JH7100_CLK_ISP0NOC_AXI, "isp0noc_axi", "isp0_bus", 0),
+	JH7100_GATE(JH7100_CLK_ISPSLV_AXI, "ispslv_axi", "isp0_bus", 0),
+	JH7100__DIV(JH7100_CLK_ISP1_BUS, "isp1_bus", "vin_src", 8),
+	JH7100_GATE(JH7100_CLK_ISP1_AXI, "isp1_axi", "isp1_bus", 0),
+	JH7100_GATE(JH7100_CLK_ISP1NOC_AXI, "isp1noc_axi", "isp1_bus", 0),
+	JH7100__DIV(JH7100_CLK_VIN_BUS, "vin_bus", "vin_src", 8),
+	JH7100_GATE(JH7100_CLK_VIN_AXI, "vin_axi", "vin_bus", 0),
+	JH7100_GATE(JH7100_CLK_VINNOC_AXI, "vinnoc_axi", "vin_bus", 0),
+	JH7100_GDIV(JH7100_CLK_VOUT_SRC, "vout_src", "vout_root", 4, 0),
+	JH7100__DIV(JH7100_CLK_DISPBUS_SRC, "dispbus_src", "voutbus_root", 4),
+	JH7100__DIV(JH7100_CLK_DISP_BUS, "disp_bus", "dispbus_src", 4),
+	JH7100_GATE(JH7100_CLK_DISP_AXI, "disp_axi", "disp_bus", 0),
+	JH7100_GATE(JH7100_CLK_DISPNOC_AXI, "dispnoc_axi", "disp_bus", 0),
+	JH7100_GATE(JH7100_CLK_SDIO0_AHB, "sdio0_ahb", "ahb_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SDIO0_CCLKINT, "sdio0_cclkint", "perh0_src", 24, 0),
+	JH7100__INV(JH7100_CLK_SDIO0_CCLKINT_INV, "sdio0_cclkint_inv", "sdio0_cclkint"),
+	JH7100_GATE(JH7100_CLK_SDIO1_AHB, "sdio1_ahb", "ahb_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SDIO1_CCLKINT, "sdio1_cclkint", "perh1_src", 24, 0),
+	JH7100__INV(JH7100_CLK_SDIO1_CCLKINT_INV, "sdio1_cclkint_inv", "sdio1_cclkint"),
+	JH7100_GATE(JH7100_CLK_GMAC_AHB, "gmac_ahb", "ahb_bus", 0),
+	JH7100__DIV(JH7100_CLK_GMAC_ROOT_DIV, "gmac_root_div", "gmacusb_root", 8),
+	JH7100_GDIV(JH7100_CLK_GMAC_PTP_REF, "gmac_ptp_refclk", "gmac_root_div", 31, 0),
+	JH7100_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", "gmac_root_div", 255, 0),
+	JH7100_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", "gmac_rmii_ref", 8, 0),
+	JH7100_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", "gmac_rmii_ref", 8, 0),
+	JH7100__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", gmac_tx_sels),
+	JH7100__INV(JH7100_CLK_GMAC_TX_INV, "gmac_tx_inv", "gmac_tx"),
+	JH7100__MUX(JH7100_CLK_GMAC_RX_PRE, "gmac_rx_pre", gmac_rx_pre_sels),
+	JH7100__INV(JH7100_CLK_GMAC_RX_INV, "gmac_rx_inv", "gmac_rx_pre"),
+	JH7100_GATE(JH7100_CLK_GMAC_RMII, "gmac_rmii", "gmac_rmii_ref", 0),
+	JH7100_GDIV(JH7100_CLK_GMAC_TOPHYREF, "gmac_tophyref", "gmac_root_div", 127, 0),
+	JH7100_GATE(JH7100_CLK_SPI2AHB_AHB, "spi2ahb_ahb", "ahb_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SPI2AHB_CORE, "spi2ahb_core", "perh0_src", 31, 0),
+	JH7100_GATE(JH7100_CLK_EZMASTER_AHB, "ezmaster_ahb", "ahb_bus", 0),
+	JH7100_GATE(JH7100_CLK_E24_AHB, "e24_ahb", "ahb_bus", 0),
+	JH7100_GATE(JH7100_CLK_E24RTC_TOGGLE, "e24rtc_toggle", "osc_sys", 0),
+	JH7100_GATE(JH7100_CLK_QSPI_AHB, "qspi_ahb", "ahb_bus", 0),
+	JH7100_GATE(JH7100_CLK_QSPI_APB, "qspi_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_QSPI_REF, "qspi_refclk", "perh0_src", 31, 0),
+	JH7100_GATE(JH7100_CLK_SEC_AHB, "sec_ahb", "ahb_bus", 0),
+	JH7100_GATE(JH7100_CLK_AES, "aes_clk", "sec_ahb", 0),
+	JH7100_GATE(JH7100_CLK_SHA, "sha_clk", "sec_ahb", 0),
+	JH7100_GATE(JH7100_CLK_PKA, "pka_clk", "sec_ahb", 0),
+	JH7100_GATE(JH7100_CLK_TRNG_APB, "trng_apb", "apb1_bus", 0),
+	JH7100_GATE(JH7100_CLK_OTP_APB, "otp_apb", "apb1_bus", 0),
+	JH7100_GATE(JH7100_CLK_UART0_APB, "uart0_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_UART0_CORE, "uart0_core", "perh1_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_UART1_APB, "uart1_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_UART1_CORE, "uart1_core", "perh1_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_SPI0_APB, "spi0_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SPI0_CORE, "spi0_core", "perh1_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_SPI1_APB, "spi1_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SPI1_CORE, "spi1_core", "perh1_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_I2C0_APB, "i2c0_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_I2C0_CORE, "i2c0_core", "perh1_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_I2C1_APB, "i2c1_apb", "apb1_bus", 0),
+	JH7100_GDIV(JH7100_CLK_I2C1_CORE, "i2c1_core", "perh1_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_GPIO_APB, "gpio_apb", "apb1_bus", 0),
+	JH7100_GATE(JH7100_CLK_UART2_APB, "uart2_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_UART2_CORE, "uart2_core", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_UART3_APB, "uart3_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_UART3_CORE, "uart3_core", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_SPI2_APB, "spi2_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SPI2_CORE, "spi2_core", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_SPI3_APB, "spi3_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_SPI3_CORE, "spi3_core", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_I2C2_APB, "i2c2_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_I2C2_CORE, "i2c2_core", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_I2C3_APB, "i2c3_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_I2C3_CORE, "i2c3_core", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_WDTIMER_APB, "wdtimer_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_WDT_CORE, "wdt_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER0_CORE, "timer0_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER1_CORE, "timer1_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER2_CORE, "timer2_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER3_CORE, "timer3_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER4_CORE, "timer4_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER5_CORE, "timer5_coreclk", "perh0_src", 63, 0),
+	JH7100_GDIV(JH7100_CLK_TIMER6_CORE, "timer6_coreclk", "perh0_src", 63, 0),
+	JH7100_GATE(JH7100_CLK_VP6INTC_APB, "vp6intc_apb", "apb2_bus", 0),
+	JH7100_GATE(JH7100_CLK_PWM_APB, "pwm_apb", "apb2_bus", 0),
+	JH7100_GATE(JH7100_CLK_MSI_APB, "msi_apb", "apb2_bus", 0),
+	JH7100_GATE(JH7100_CLK_TEMP_APB, "temp_apb", "apb2_bus", 0),
+	JH7100_GDIV(JH7100_CLK_TEMP_SENSE, "temp_sense", "osc_sys", 31, 0),
+	JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", "apb2_bus", 0),
+};
+
+static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct clk_starfive_jh7100_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= JH7100_CLK_END) {
+		dev_err(priv->dev, "%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (idx >= JH7100_CLK_PLL0_OUT)
+		return priv->pll[idx - JH7100_CLK_PLL0_OUT];
+
+	return &priv->reg[idx].hw;
+}
+
+static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
+{
+	struct clk_starfive_jh7100_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->rmw_lock);
+	priv->dev = &pdev->dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
+							 "osc_sys", 0, 40, 1);
+	if (IS_ERR(priv->pll[0]))
+		return PTR_ERR(priv->pll[0]);
+
+	priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
+							 "osc_sys", 0, 64, 1);
+	if (IS_ERR(priv->pll[1]))
+		return PTR_ERR(priv->pll[1]);
+
+	priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
+							 "pll2_refclk", 0, 55, 1);
+	if (IS_ERR(priv->pll[2]))
+		return PTR_ERR(priv->pll[2]);
+
+	for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
+		struct clk_init_data init = {
+			.name = jh7100_clk_data[idx].name,
+			.ops = jh7100_clk_data[idx].ops,
+			.num_parents = ((jh7100_clk_data[idx].max & JH7100_CLK_MUX_MASK)
+					>> JH7100_CLK_MUX_SHIFT) + 1,
+			.flags = jh7100_clk_data[idx].flags,
+		};
+		struct jh7100_clk *clk = &priv->reg[idx];
+
+		if (init.num_parents > 1)
+			init.parent_names = jh7100_clk_data[idx].parents;
+		else
+			init.parent_names = &jh7100_clk_data[idx].parent;
+
+		clk->hw.init = &init;
+		clk->idx = idx;
+		clk->max = jh7100_clk_data[idx].max;
+
+		ret = clk_hw_register(priv->dev, &clk->hw);
+		if (ret)
+			goto err;
+	}
+
+	ret = devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh7100_get, priv);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	while (idx > 0)
+		clk_hw_unregister(&priv->reg[--idx].hw);
+	return ret;
+}
+
+static const struct of_device_id clk_starfive_jh7100_match[] = {
+	{ .compatible = "starfive,jh7100-clkgen" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver clk_starfive_jh7100_driver = {
+	.driver = {
+		.name = "clk-starfive-jh7100",
+		.of_match_table = clk_starfive_jh7100_match,
+	},
+};
+
+static int __init clk_starfive_jh7100_init(void)
+{
+	return platform_driver_probe(&clk_starfive_jh7100_driver,
+				     clk_starfive_jh7100_probe);
+}
+
+subsys_initcall(clk_starfive_jh7100_init);
+
+MODULE_DESCRIPTION("StarFive JH7100 Clock Generator Driver");
+MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");
+MODULE_AUTHOR("Geert Uytterhoeven <geert@linux-m68k.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

