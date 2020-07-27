Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294F022E821
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 10:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgG0InG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 04:43:06 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:13862 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgG0Imw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 04:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595839370; x=1627375370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7thvExZSalBZUH4+8/Ip/j0mToLKwhEPjKW89XaoI1M=;
  b=N8+VXSlDitPNrao9YdQtIzYWibz7qBWm28cVqBW06N+MTbTEL8woxqg2
   sLtbZTxVIQCQ6QKQawSOrICaKvwcHbiDVvqeSPDP+EDg/hXhtMvuayHzq
   VfW8hHSWWCBJ7mC7Sogj9c+/ml53ExUtClrI4n6RNoHbliOMxpcAW0deB
   26OmGoVPoZpDid4N8FE7ClhaE4a25QIpr1AynLaY9yo6a3yi05IXdOZh3
   H32z1s0LMnab4IRXkuR/Ve9OARRt5pate0BNGxiQ/1geJsUCKmwWkYZf9
   G81sSEy26873f9dQpD3euQBxPHDfQez68HihN1R7fpMVtV/BbZ/yMSRp7
   g==;
IronPort-SDR: PfeTjsj7r7Z6Hdd6VN7YfJVIhO0KmAIHff55XlRf+2ypfq6pDauPBokTbXdzEDqt+w2pckUy+o
 vHoZUBQ/w5ivlaXvC246vC77GMLPuRZzPKZ+DAqmTebtuX6WOL+WDoLbKmGQOtBbGbv2RL2GZQ
 SJQpONYmqplAWz4sqQXlyx/nzMraUtiiIAEDVe19Nwl/dWcV+Br/CV4WiX2LDz0VEhgZLisRHv
 kP1Cr/vS2p0uGAeLnNq1wKJCij4ejZYsH5loNMvCEq3bD3ndZMwdOkyKwoIc/xPOi4Sn36We9Q
 0es=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="20643783"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2020 01:42:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 01:42:48 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 01:42:45 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 08/10] clk: sparx5: Add Sparx5 SoC DPLL clock driver
Date:   Mon, 27 Jul 2020 10:42:09 +0200
Message-ID: <20200727084211.6632-9-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727084211.6632-1-lars.povlsen@microchip.com>
References: <20200727084211.6632-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a device driver for the Sparx5 SoC DPLL clock

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-sparx5.c | 295 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 296 insertions(+)
 create mode 100644 drivers/clk/clk-sparx5.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index ca9af11d33913..da8fcf147eb13 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_EFM32)		+= clk-efm32gg.o
+obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
 obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
diff --git a/drivers/clk/clk-sparx5.c b/drivers/clk/clk-sparx5.c
new file mode 100644
index 0000000000000..0fad0c1a01862
--- /dev/null
+++ b/drivers/clk/clk-sparx5.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Microchip Sparx5 SoC Clock driver.
+ *
+ * Copyright (c) 2019 Microchip Inc.
+ *
+ * Author: Lars Povlsen <lars.povlsen@microchip.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/clk-provider.h>
+#include <linux/bitfield.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/microchip,sparx5.h>
+
+#define PLL_DIV		GENMASK(7, 0)
+#define PLL_PRE_DIV	GENMASK(10, 8)
+#define PLL_ROT_DIR	BIT(11)
+#define PLL_ROT_SEL	GENMASK(13, 12)
+#define PLL_ROT_ENA	BIT(14)
+#define PLL_CLK_ENA	BIT(15)
+
+#define MAX_SEL 4
+#define MAX_PRE BIT(3)
+
+static const u8 sel_rates[MAX_SEL] = { 0, 2*8, 2*4, 2*2 };
+
+static const char *clk_names[N_CLOCKS] = {
+	"core", "ddr", "cpu2", "arm2",
+	"aux1", "aux2", "aux3", "aux4",
+	"synce",
+};
+
+struct s5_hw_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+};
+
+struct s5_clk_data {
+	void __iomem *base;
+	struct s5_hw_clk s5_hw[N_CLOCKS];
+};
+
+struct s5_pll_conf {
+	unsigned long freq;
+	u8 div;
+	bool rot_ena;
+	u8 rot_sel;
+	u8 rot_dir;
+	u8 pre_div;
+};
+
+#define to_s5_pll(hw) container_of(hw, struct s5_hw_clk, hw)
+
+static unsigned long s5_calc_freq(unsigned long parent_rate,
+				  const struct s5_pll_conf *conf)
+{
+	unsigned long rate = parent_rate / conf->div;
+
+	if (conf->rot_ena) {
+		int sign = conf->rot_dir ? -1 : 1;
+		int divt = sel_rates[conf->rot_sel] * (1 + conf->pre_div);
+		int divb = divt + sign;
+
+		rate = mult_frac(rate, divt, divb);
+		rate = roundup(rate, 1000);
+	}
+
+	return rate;
+}
+
+static void s5_search_fractional(unsigned long rate,
+				 unsigned long parent_rate,
+				 int div,
+				 struct s5_pll_conf *conf)
+{
+	struct s5_pll_conf best;
+	ulong cur_offset, best_offset = rate;
+	int d, i, j;
+
+	memset(conf, 0, sizeof(*conf));
+	conf->div = div;
+	conf->rot_ena = 1;	/* Fractional rate */
+
+	for (d = 0; best_offset > 0 && d <= 1 ; d++) {
+		conf->rot_dir = !!d;
+		for (i = 0; best_offset > 0 && i < MAX_PRE; i++) {
+			conf->pre_div = i;
+			for (j = 1; best_offset > 0 && j < MAX_SEL; j++) {
+				conf->rot_sel = j;
+				conf->freq = s5_calc_freq(parent_rate, conf);
+				cur_offset = abs(rate - conf->freq);
+				if (cur_offset < best_offset) {
+					best_offset = cur_offset;
+					best = *conf;
+				}
+			}
+		}
+	}
+
+	/* Best match */
+	*conf = best;
+}
+
+static unsigned long s5_calc_params(unsigned long rate,
+				    unsigned long parent_rate,
+				    struct s5_pll_conf *conf)
+{
+	if (parent_rate % rate) {
+		struct s5_pll_conf alt1, alt2;
+		int div;
+
+		div = DIV_ROUND_CLOSEST_ULL(parent_rate, rate);
+		s5_search_fractional(rate, parent_rate, div, &alt1);
+
+		/* Straight match? */
+		if (alt1.freq == rate) {
+			*conf = alt1;
+		} else {
+			/* Try without rounding divider */
+			div = parent_rate / rate;
+			if (div != alt1.div) {
+				s5_search_fractional(rate, parent_rate, div,
+						     &alt2);
+				/* Select the better match */
+				if (abs(rate - alt1.freq) <
+				    abs(rate - alt2.freq))
+					*conf = alt1;
+				else
+					*conf = alt2;
+			}
+		}
+	} else {
+		/* Straight fit */
+		memset(conf, 0, sizeof(*conf));
+		conf->div = parent_rate / rate;
+	}
+
+	return conf->freq;
+}
+
+static int s5_pll_enable(struct clk_hw *hw)
+{
+	struct s5_hw_clk *pll = to_s5_pll(hw);
+	u32 val = readl(pll->reg);
+
+	val |= PLL_CLK_ENA;
+	writel(val, pll->reg);
+
+	return 0;
+}
+
+static void s5_pll_disable(struct clk_hw *hw)
+{
+	struct s5_hw_clk *pll = to_s5_pll(hw);
+	u32 val = readl(pll->reg);
+
+	val &= ~PLL_CLK_ENA;
+	writel(val, pll->reg);
+}
+
+static int s5_pll_set_rate(struct clk_hw *hw,
+			   unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct s5_hw_clk *pll = to_s5_pll(hw);
+	struct s5_pll_conf conf;
+	unsigned long eff_rate;
+	u32 val;
+
+	eff_rate = s5_calc_params(rate, parent_rate, &conf);
+	if (eff_rate != rate)
+		return -EOPNOTSUPP;
+
+	val = readl(pll->reg) & PLL_CLK_ENA;
+	val |= FIELD_PREP(PLL_DIV, conf.div);
+	if (conf.rot_ena) {
+		val |= PLL_ROT_ENA;
+		val |= FIELD_PREP(PLL_ROT_SEL, conf.rot_sel);
+		val |= FIELD_PREP(PLL_PRE_DIV, conf.pre_div);
+		if (conf.rot_dir)
+			val |= PLL_ROT_DIR;
+	}
+	writel(val, pll->reg);
+
+	return 0;
+}
+
+static unsigned long s5_pll_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct s5_hw_clk *pll = to_s5_pll(hw);
+	struct s5_pll_conf conf;
+	u32 val;
+
+	val = readl(pll->reg);
+
+	if (val & PLL_CLK_ENA) {
+		conf.div     = FIELD_GET(PLL_DIV, val);
+		conf.pre_div = FIELD_GET(PLL_PRE_DIV, val);
+		conf.rot_ena = FIELD_GET(PLL_ROT_ENA, val);
+		conf.rot_dir = FIELD_GET(PLL_ROT_DIR, val);
+		conf.rot_sel = FIELD_GET(PLL_ROT_SEL, val);
+
+		conf.freq = s5_calc_freq(parent_rate, &conf);
+	} else {
+		conf.freq = 0;
+	}
+
+	return conf.freq;
+}
+
+static long s5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *parent_rate)
+{
+	struct s5_pll_conf conf;
+
+	return s5_calc_params(rate, *parent_rate, &conf);
+}
+
+static const struct clk_ops s5_pll_ops = {
+	.enable		= s5_pll_enable,
+	.disable	= s5_pll_disable,
+	.set_rate	= s5_pll_set_rate,
+	.round_rate	= s5_pll_round_rate,
+	.recalc_rate	= s5_pll_recalc_rate,
+};
+
+static struct clk_hw *s5_clk_hw_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct s5_clk_data *s5_clk = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= N_CLOCKS) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &s5_clk->s5_hw[idx].hw;
+}
+
+static int s5_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int i, ret;
+	struct s5_clk_data *s5_clk;
+	struct clk_parent_data pdata = { .index = 0 };
+	struct clk_init_data init = {
+		.ops = &s5_pll_ops,
+		.num_parents = 1,
+		.parent_data = &pdata,
+	};
+
+	s5_clk = devm_kzalloc(dev, sizeof(*s5_clk), GFP_KERNEL);
+	if (!s5_clk)
+		return -ENOMEM;
+
+	s5_clk->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(s5_clk->base))
+		return PTR_ERR(s5_clk->base);
+
+	for (i = 0; i < N_CLOCKS; i++) {
+		struct s5_hw_clk *s5_hw = &s5_clk->s5_hw[i];
+
+		init.name = clk_names[i];
+		s5_hw->reg = s5_clk->base + (i * 4);
+		s5_hw->hw.init = &init;
+		ret = devm_clk_hw_register(dev, &s5_hw->hw);
+		if (ret) {
+			dev_err(dev, "failed to register %s clock\n",
+				init.name);
+			return ret;
+		}
+	}
+
+	return devm_of_clk_add_hw_provider(dev, s5_clk_hw_get, s5_clk);
+}
+
+static const struct of_device_id s5_clk_dt_ids[] = {
+	{ .compatible = "microchip,sparx5-dpll", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, s5_clk_dt_ids);
+
+static struct platform_driver s5_clk_driver = {
+	.probe  = s5_clk_probe,
+	.driver = {
+		.name = "sparx5-clk",
+		.of_match_table = s5_clk_dt_ids,
+	},
+};
+builtin_platform_driver(s5_clk_driver);
-- 
2.27.0

