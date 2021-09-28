Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C020741BB5C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 01:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243560AbhI1X66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 19:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243468AbhI1X6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 19:58:53 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E84C061746
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:57:05 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id y63-20020a253242000000b005b6c5e3fb71so1023699yby.18
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QCRxrKLhXqOeSWL7ZKhPhASp9RJabJgFFXFn6xQJAW8=;
        b=R0bo3m5mJxFslYZV4SrHJOGzAcINrUOt5uRO0KPp5Jyag68ajDO39Qxa6AWTtj6gst
         T3bvF7FKyYbXSPWkPXyfUbk4zZdJj5bLBi4mwd4VOn62Z5SwqPi7NeYkZUmy7JptJ6SS
         JSWoRQjM18OhxHgKxPVhIrKl3q6ECiHZowliIcyXt047XQ8PzvMr4EAzB5zc0zlovK7Q
         BM5MYep2pVQbmOFdop2sknWb7Tygu3dCmboql71vRywlaF/7/6aEoAniCDa7/flEV8EI
         FOzRACeLjrR9cMdcQNF6BON/O6bY/E26k9NW7EibR+y0PO43c+9WYKtjioHP5DrGnaPS
         mUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QCRxrKLhXqOeSWL7ZKhPhASp9RJabJgFFXFn6xQJAW8=;
        b=Sa64P7YUuJS9DUE7DvOKIpMBs8pJjN8hL/wTUgA8A/rHNtbGuxW4nlkI3GCslj0epv
         CMRM2zq+7h3p1J2Ywzep2FwaMlROq4GWvpD2M3YZ+X/sTw8fTCsLMKOMN0xqaLame0OO
         ElnqNlvU9JOFq/ufturxPBPay+ptbc+yan4TPsYcCt12BGX42o1CVW8q+D+BHQvPajMa
         zF67okxBpViML/63gPW9/Nu/ukV1ASak416UDlHWEH6WtpdyfsKBuO08cqqbjoAKhJAp
         mIIzTMaXXp+u7omG2WYfnkvwfMbFZP4/J38j7ExHchXmvwjiTocnCy91kPkFE/adt5Mv
         WYBA==
X-Gm-Message-State: AOAM533egF+mJygRvyExwQcXbXB7EvRTwx5I4kixvO10rJqnPlLLEtLD
        EwyWQ83ezB3CK7pHIy6ID6+m61yS32+C26zNxiY=
X-Google-Smtp-Source: ABdhPJw5Cl0QKvSqR1C6Kj5koYOvTNZW60AWo0EYWYte+u2y/IUxx6c+IZ+oM5GmssFgv89a8FBU7+QQSLhZM9WeQsc=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:3f04:: with SMTP id
 m4mr8900577yba.123.1632873425007; Tue, 28 Sep 2021 16:57:05 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:23 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-7-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 06/12] clk: samsung: modularize exynos arm64 clk drivers
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This modularizes the Exynos ARM64 clock drivers. The change consolidates
the clock devices into the of match table so that the platform driver
probes all the clocks (per driver) as well as exports the necessary
functions for each driver.

With this, we now have 3 separate kernel modules (pending Kconfig
changes):

1) clk-common-exynos.ko: the common exynos clock driver
2) clk-exynos5433.ko: the Exynos5433 clock driver
3) clk-exynos7.ko: the Exynos7 clock driver

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/Makefile         |   3 +-
 drivers/clk/samsung/clk-cpu.c        |   2 +-
 drivers/clk/samsung/clk-cpu.h        |   2 +-
 drivers/clk/samsung/clk-exynos5433.c | 349 +++++++++++++--------------
 drivers/clk/samsung/clk-exynos7.c    | 177 ++++++--------
 drivers/clk/samsung/clk-pll.c        |   6 +-
 drivers/clk/samsung/clk.c            |  33 ++-
 drivers/clk/samsung/clk.h            |  26 +-
 8 files changed, 287 insertions(+), 311 deletions(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index 028b2e27a37e..33f07ee87d90 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -3,7 +3,8 @@
 # Samsung Clock specific Makefile
 #
 
-obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
+obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= clk-common-exynos.o
+clk-common-exynos-y += clk.o clk-pll.o clk-cpu.o
 obj-$(CONFIG_EXYNOS_3250_COMMON_CLK)	+= clk-exynos3250.o
 obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4.o
 obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4412-isp.o
diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index b5017934fc41..ab3d0c073031 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -400,7 +400,7 @@ static int exynos5433_cpuclk_notifier_cb(struct notifier_block *nb,
 }
 
 /* helper function to register a CPU clock */
-int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
+int exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		unsigned int lookup_id, const char *name,
 		const struct clk_hw *parent, const struct clk_hw *alt_parent,
 		unsigned long offset, const struct exynos_cpuclk_cfg_data *cfg,
diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index af74686db9ef..fd885d2bf74c 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -62,7 +62,7 @@ struct exynos_cpuclk {
 #define CLK_CPU_HAS_E5433_REGS_LAYOUT	(1 << 2)
 };
 
-int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
+int exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 			unsigned int lookup_id, const char *name,
 			const struct clk_hw *parent, const struct clk_hw *alt_parent,
 			unsigned long offset,
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index b45f6a65ba64..885e38c1d487 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -112,7 +113,7 @@
 #define ENABLE_CMU_TOP			0x0c00
 #define ENABLE_CMU_TOP_DIV_STAT		0x0c04
 
-static const unsigned long top_clk_regs[] __initconst = {
+static const unsigned long top_clk_regs[] = {
 	ISP_PLL_LOCK,
 	AUD_PLL_LOCK,
 	ISP_PLL_CON0,
@@ -233,11 +234,11 @@ PNAME(mout_sclk_audio0_p)	= { "ioclk_audiocdclk0", "oscclk",
 
 PNAME(mout_sclk_hdmi_spdif_p)	= { "sclk_audio1", "ioclk_spdif_extclk", };
 
-static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
+static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] = {
 	FFACTOR(0, "oscclk_efuse_common", "oscclk", 1, 1, 0),
 };
 
-static const struct samsung_fixed_rate_clock top_fixed_clks[] __initconst = {
+static const struct samsung_fixed_rate_clock top_fixed_clks[] = {
 	/* Xi2s{0|1}CDCLK input clock for I2S/PCM */
 	FRATE(0, "ioclk_audiocdclk1", NULL, 0, 100000000),
 	FRATE(0, "ioclk_audiocdclk0", NULL, 0, 100000000),
@@ -253,7 +254,7 @@ static const struct samsung_fixed_rate_clock top_fixed_clks[] __initconst = {
 	FRATE(0, "ioclk_i2s1_bclk_in", NULL, 0, 12288000),
 };
 
-static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+static const struct samsung_mux_clock top_mux_clks[] = {
 	/* MUX_SEL_TOP0 */
 	MUX(CLK_MOUT_AUD_PLL, "mout_aud_pll", mout_aud_pll_p, MUX_SEL_TOP0,
 			4, 1),
@@ -389,7 +390,7 @@ static const struct samsung_mux_clock top_mux_clks[] __initconst = {
 			mout_sclk_hdmi_spdif_p, MUX_SEL_TOP_DISP, 0, 1),
 };
 
-static const struct samsung_div_clock top_div_clks[] __initconst = {
+static const struct samsung_div_clock top_div_clks[] = {
 	/* DIV_TOP0 */
 	DIV(CLK_DIV_ACLK_CAM1_333, "div_aclk_cam1_333", "mout_aclk_cam1_333",
 			DIV_TOP0, 28, 3),
@@ -553,7 +554,7 @@ static const struct samsung_div_clock top_div_clks[] __initconst = {
 			DIV_TOP_PERIC4, 0, 4),
 };
 
-static const struct samsung_gate_clock top_gate_clks[] __initconst = {
+static const struct samsung_gate_clock top_gate_clks[] = {
 	/* ENABLE_ACLK_TOP */
 	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
 			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
@@ -711,7 +712,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
  * ATLAS_PLL & APOLLO_PLL & MEM0_PLL & MEM1_PLL & BUS_PLL & MFC_PLL
  * & MPHY_PLL & G3D_PLL & DISP_PLL & ISP_PLL
  */
-static const struct samsung_pll_rate_table exynos5433_pll_rates[] __initconst = {
+static const struct samsung_pll_rate_table exynos5433_pll_rates[] = {
 	PLL_35XX_RATE(24 * MHZ, 2500000000U, 625, 6,  0),
 	PLL_35XX_RATE(24 * MHZ, 2400000000U, 500, 5,  0),
 	PLL_35XX_RATE(24 * MHZ, 2300000000U, 575, 6,  0),
@@ -764,7 +765,7 @@ static const struct samsung_pll_rate_table exynos5433_pll_rates[] __initconst =
 };
 
 /* AUD_PLL */
-static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initconst = {
+static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] = {
 	PLL_36XX_RATE(24 * MHZ, 400000000U, 200, 3, 2,      0),
 	PLL_36XX_RATE(24 * MHZ, 393216003U, 197, 3, 2, -25690),
 	PLL_36XX_RATE(24 * MHZ, 384000000U, 128, 2, 2,      0),
@@ -778,14 +779,14 @@ static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initcons
 	{ /* sentinel */ }
 };
 
-static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+static const struct samsung_pll_clock top_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_ISP_PLL, "fout_isp_pll", "oscclk",
 		ISP_PLL_LOCK, ISP_PLL_CON0, exynos5433_pll_rates),
 	PLL(pll_36xx, CLK_FOUT_AUD_PLL, "fout_aud_pll", "oscclk",
 		AUD_PLL_LOCK, AUD_PLL_CON0, exynos5433_aud_pll_rates),
 };
 
-static const struct samsung_cmu_info top_cmu_info __initconst = {
+static const struct samsung_cmu_info top_cmu_info = {
 	.pll_clks		= top_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
 	.mux_clks		= top_mux_clks,
@@ -805,13 +806,6 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_suspend_regs	= ARRAY_SIZE(top_suspend_regs),
 };
 
-static void __init exynos5433_cmu_top_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &top_cmu_info);
-}
-CLK_OF_DECLARE(exynos5433_cmu_top, "samsung,exynos5433-cmu-top",
-		exynos5433_cmu_top_init);
-
 /*
  * Register offset definitions for CMU_CPIF
  */
@@ -823,7 +817,7 @@ CLK_OF_DECLARE(exynos5433_cmu_top, "samsung,exynos5433-cmu-top",
 #define DIV_CPIF		0x0600
 #define ENABLE_SCLK_CPIF	0x0a00
 
-static const unsigned long cpif_clk_regs[] __initconst = {
+static const unsigned long cpif_clk_regs[] = {
 	MPHY_PLL_LOCK,
 	MPHY_PLL_CON0,
 	MPHY_PLL_CON1,
@@ -843,24 +837,24 @@ static const struct samsung_clk_reg_dump cpif_suspend_regs[] = {
 /* list of all parent clock list */
 PNAME(mout_mphy_pll_p)		= { "oscclk", "fout_mphy_pll", };
 
-static const struct samsung_pll_clock cpif_pll_clks[] __initconst = {
+static const struct samsung_pll_clock cpif_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_MPHY_PLL, "fout_mphy_pll", "oscclk",
 		MPHY_PLL_LOCK, MPHY_PLL_CON0, exynos5433_pll_rates),
 };
 
-static const struct samsung_mux_clock cpif_mux_clks[] __initconst = {
+static const struct samsung_mux_clock cpif_mux_clks[] = {
 	/* MUX_SEL_CPIF0 */
 	MUX(CLK_MOUT_MPHY_PLL, "mout_mphy_pll", mout_mphy_pll_p, MUX_SEL_CPIF0,
 			0, 1),
 };
 
-static const struct samsung_div_clock cpif_div_clks[] __initconst = {
+static const struct samsung_div_clock cpif_div_clks[] = {
 	/* DIV_CPIF */
 	DIV(CLK_DIV_SCLK_MPHY, "div_sclk_mphy", "mout_mphy_pll", DIV_CPIF,
 			0, 6),
 };
 
-static const struct samsung_gate_clock cpif_gate_clks[] __initconst = {
+static const struct samsung_gate_clock cpif_gate_clks[] = {
 	/* ENABLE_SCLK_CPIF */
 	GATE(CLK_SCLK_MPHY_PLL, "sclk_mphy_pll", "mout_mphy_pll",
 			ENABLE_SCLK_CPIF, 9, CLK_IGNORE_UNUSED, 0),
@@ -868,7 +862,7 @@ static const struct samsung_gate_clock cpif_gate_clks[] __initconst = {
 			ENABLE_SCLK_CPIF, 4, 0, 0),
 };
 
-static const struct samsung_cmu_info cpif_cmu_info __initconst = {
+static const struct samsung_cmu_info cpif_cmu_info = {
 	.pll_clks		= cpif_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(cpif_pll_clks),
 	.mux_clks		= cpif_mux_clks,
@@ -884,13 +878,6 @@ static const struct samsung_cmu_info cpif_cmu_info __initconst = {
 	.nr_suspend_regs	= ARRAY_SIZE(cpif_suspend_regs),
 };
 
-static void __init exynos5433_cmu_cpif_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &cpif_cmu_info);
-}
-CLK_OF_DECLARE(exynos5433_cmu_cpif, "samsung,exynos5433-cmu-cpif",
-		exynos5433_cmu_cpif_init);
-
 /*
  * Register offset definitions for CMU_MIF
  */
@@ -971,7 +958,7 @@ CLK_OF_DECLARE(exynos5433_cmu_cpif, "samsung,exynos5433-cmu-cpif",
 #define PAUSE				0x1008
 #define DDRPHY_LOCK_CTRL		0x100c
 
-static const unsigned long mif_clk_regs[] __initconst = {
+static const unsigned long mif_clk_regs[] = {
 	MEM0_PLL_LOCK,
 	MEM1_PLL_LOCK,
 	BUS_PLL_LOCK,
@@ -1036,7 +1023,7 @@ static const unsigned long mif_clk_regs[] __initconst = {
 	DDRPHY_LOCK_CTRL,
 };
 
-static const struct samsung_pll_clock mif_pll_clks[] __initconst = {
+static const struct samsung_pll_clock mif_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_MEM0_PLL, "fout_mem0_pll", "oscclk",
 		MEM0_PLL_LOCK, MEM0_PLL_CON0, exynos5433_pll_rates),
 	PLL(pll_35xx, CLK_FOUT_MEM1_PLL, "fout_mem1_pll", "oscclk",
@@ -1097,7 +1084,7 @@ PNAME(mout_sclk_decon_tv_vclk_b_p) = { "mout_sclk_decon_tv_vclk_a",
 PNAME(mout_sclk_dsim1_c_p)	= { "mout_sclk_dsim1_b", "sclk_mphy_pll", };
 PNAME(mout_sclk_dsim1_b_p)	= { "mout_sclk_dsim1_a", "mout_mfc_pll_div2",};
 
-static const struct samsung_fixed_factor_clock mif_fixed_factor_clks[] __initconst = {
+static const struct samsung_fixed_factor_clock mif_fixed_factor_clks[] = {
 	/* dout_{mfc|bus|mem1|mem0}_pll is half fixed rate from parent mux */
 	FFACTOR(CLK_DOUT_MFC_PLL, "dout_mfc_pll", "mout_mfc_pll", 1, 1, 0),
 	FFACTOR(CLK_DOUT_BUS_PLL, "dout_bus_pll", "mout_bus_pll", 1, 1, 0),
@@ -1105,7 +1092,7 @@ static const struct samsung_fixed_factor_clock mif_fixed_factor_clks[] __initcon
 	FFACTOR(CLK_DOUT_MEM0_PLL, "dout_mem0_pll", "mout_mem0_pll", 1, 1, 0),
 };
 
-static const struct samsung_mux_clock mif_mux_clks[] __initconst = {
+static const struct samsung_mux_clock mif_mux_clks[] = {
 	/* MUX_SEL_MIF0 */
 	MUX(CLK_MOUT_MFC_PLL_DIV2, "mout_mfc_pll_div2", mout_mfc_pll_div2_p,
 			MUX_SEL_MIF0, 28, 1),
@@ -1201,7 +1188,7 @@ static const struct samsung_mux_clock mif_mux_clks[] __initconst = {
 			MUX_SEL_MIF7, 0, 1),
 };
 
-static const struct samsung_div_clock mif_div_clks[] __initconst = {
+static const struct samsung_div_clock mif_div_clks[] = {
 	/* DIV_MIF1 */
 	DIV(CLK_DIV_SCLK_HPM_MIF, "div_sclk_hpm_mif", "div_clk2x_phy",
 			DIV_MIF1, 16, 2),
@@ -1255,7 +1242,7 @@ static const struct samsung_div_clock mif_div_clks[] __initconst = {
 			0, 3),
 };
 
-static const struct samsung_gate_clock mif_gate_clks[] __initconst = {
+static const struct samsung_gate_clock mif_gate_clks[] = {
 	/* ENABLE_ACLK_MIF0 */
 	GATE(CLK_CLK2X_PHY1, "clk2k_phy1", "div_clk2x_phy", ENABLE_ACLK_MIF0,
 			19, CLK_IGNORE_UNUSED, 0),
@@ -1520,7 +1507,7 @@ static const struct samsung_gate_clock mif_gate_clks[] __initconst = {
 			ENABLE_SCLK_MIF, 0, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info mif_cmu_info __initconst = {
+static const struct samsung_cmu_info mif_cmu_info = {
 	.pll_clks		= mif_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(mif_pll_clks),
 	.mux_clks		= mif_mux_clks,
@@ -1536,13 +1523,6 @@ static const struct samsung_cmu_info mif_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(mif_clk_regs),
 };
 
-static void __init exynos5433_cmu_mif_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &mif_cmu_info);
-}
-CLK_OF_DECLARE(exynos5433_cmu_mif, "samsung,exynos5433-cmu-mif",
-		exynos5433_cmu_mif_init);
-
 /*
  * Register offset definitions for CMU_PERIC
  */
@@ -1556,7 +1536,7 @@ CLK_OF_DECLARE(exynos5433_cmu_mif, "samsung,exynos5433-cmu-mif",
 #define ENABLE_IP_PERIC1		0x0B04
 #define ENABLE_IP_PERIC2		0x0B08
 
-static const unsigned long peric_clk_regs[] __initconst = {
+static const unsigned long peric_clk_regs[] = {
 	DIV_PERIC,
 	ENABLE_ACLK_PERIC,
 	ENABLE_PCLK_PERIC0,
@@ -1574,13 +1554,13 @@ static const struct samsung_clk_reg_dump peric_suspend_regs[] = {
 	{ ENABLE_SCLK_PERIC, 0x7 },
 };
 
-static const struct samsung_div_clock peric_div_clks[] __initconst = {
+static const struct samsung_div_clock peric_div_clks[] = {
 	/* DIV_PERIC */
 	DIV(CLK_DIV_SCLK_SCI, "div_sclk_sci", "oscclk", DIV_PERIC, 4, 4),
 	DIV(CLK_DIV_SCLK_SC_IN, "div_sclk_sc_in", "oscclk", DIV_PERIC, 0, 4),
 };
 
-static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
+static const struct samsung_gate_clock peric_gate_clks[] = {
 	/* ENABLE_ACLK_PERIC */
 	GATE(CLK_ACLK_AHB2APB_PERIC2P, "aclk_ahb2apb_peric2p", "aclk_peric_66",
 			ENABLE_ACLK_PERIC, 3, CLK_IGNORE_UNUSED, 0),
@@ -1725,7 +1705,7 @@ static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
 			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info peric_cmu_info __initconst = {
+static const struct samsung_cmu_info peric_cmu_info = {
 	.div_clks		= peric_div_clks,
 	.nr_div_clks		= ARRAY_SIZE(peric_div_clks),
 	.gate_clks		= peric_gate_clks,
@@ -1737,14 +1717,6 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.nr_suspend_regs	= ARRAY_SIZE(peric_suspend_regs),
 };
 
-static void __init exynos5433_cmu_peric_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &peric_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos5433_cmu_peric, "samsung,exynos5433-cmu-peric",
-		exynos5433_cmu_peric_init);
-
 /*
  * Register offset definitions for CMU_PERIS
  */
@@ -1774,7 +1746,7 @@ CLK_OF_DECLARE(exynos5433_cmu_peric, "samsung,exynos5433-cmu-peric",
 #define ENABLE_IP_PERIS_SECURE_ANTIBRK_CNT		0x0b1c
 #define ENABLE_IP_PERIS_SECURE_OTP_CON			0x0b20
 
-static const unsigned long peris_clk_regs[] __initconst = {
+static const unsigned long peris_clk_regs[] = {
 	ENABLE_ACLK_PERIS,
 	ENABLE_PCLK_PERIS,
 	ENABLE_PCLK_PERIS_SECURE_TZPC,
@@ -1802,7 +1774,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
 	ENABLE_IP_PERIS_SECURE_OTP_CON,
 };
 
-static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+static const struct samsung_gate_clock peris_gate_clks[] = {
 	/* ENABLE_ACLK_PERIS */
 	GATE(CLK_ACLK_AHB2APB_PERIS1P, "aclk_ahb2apb_peris1p", "aclk_peris_66",
 			ENABLE_ACLK_PERIS, 2, CLK_IGNORE_UNUSED, 0),
@@ -1921,7 +1893,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 			ENABLE_SCLK_PERIS_SECURE_OTP_CON, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info peris_cmu_info __initconst = {
+static const struct samsung_cmu_info peris_cmu_info = {
 	.gate_clks		= peris_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(peris_gate_clks),
 	.nr_clk_ids		= PERIS_NR_CLK,
@@ -1929,14 +1901,6 @@ static const struct samsung_cmu_info peris_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(peris_clk_regs),
 };
 
-static void __init exynos5433_cmu_peris_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &peris_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos5433_cmu_peris, "samsung,exynos5433-cmu-peris",
-		exynos5433_cmu_peris_init);
-
 /*
  * Register offset definitions for CMU_FSYS
  */
@@ -2005,7 +1969,7 @@ PNAME(mout_sclk_mphy_p)
 		= { "mout_sclk_ufs_mphy_user",
 			    "mout_phyclk_lli_mphy_to_ufs_user", };
 
-static const unsigned long fsys_clk_regs[] __initconst = {
+static const unsigned long fsys_clk_regs[] = {
 	MUX_SEL_FSYS0,
 	MUX_SEL_FSYS1,
 	MUX_SEL_FSYS2,
@@ -2034,7 +1998,7 @@ static const struct samsung_clk_reg_dump fsys_suspend_regs[] = {
 	{ MUX_SEL_FSYS4, 0 },
 };
 
-static const struct samsung_fixed_rate_clock fsys_fixed_clks[] __initconst = {
+static const struct samsung_fixed_rate_clock fsys_fixed_clks[] = {
 	/* PHY clocks from USBDRD30_PHY */
 	FRATE(CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY,
 			"phyclk_usbdrd30_udrd30_phyclock_phy", NULL,
@@ -2074,7 +2038,7 @@ static const struct samsung_fixed_rate_clock fsys_fixed_clks[] __initconst = {
 			NULL, 0, 26000000),
 };
 
-static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
+static const struct samsung_mux_clock fsys_mux_clks[] = {
 	/* MUX_SEL_FSYS0 */
 	MUX(CLK_MOUT_SCLK_UFS_MPHY_USER, "mout_sclk_ufs_mphy_user",
 			mout_sclk_ufs_mphy_user_p, MUX_SEL_FSYS0, 4, 1),
@@ -2158,7 +2122,7 @@ static const struct samsung_mux_clock fsys_mux_clks[] __initconst = {
 			MUX_SEL_FSYS4, 0, 1),
 };
 
-static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
+static const struct samsung_gate_clock fsys_gate_clks[] = {
 	/* ENABLE_ACLK_FSYS0 */
 	GATE(CLK_ACLK_PCIE, "aclk_pcie", "mout_aclk_fsys_200_user",
 			ENABLE_ACLK_FSYS0, 13, CLK_IGNORE_UNUSED, 0),
@@ -2329,7 +2293,7 @@ static const struct samsung_gate_clock fsys_gate_clks[] __initconst = {
 	GATE(CLK_PDMA0, "pdma0", "aclk_pdma0", ENABLE_IP_FSYS0, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info fsys_cmu_info __initconst = {
+static const struct samsung_cmu_info fsys_cmu_info = {
 	.mux_clks		= fsys_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys_mux_clks),
 	.gate_clks		= fsys_gate_clks,
@@ -2360,7 +2324,7 @@ static const struct samsung_cmu_info fsys_cmu_info __initconst = {
 #define DIV_ENABLE_IP_G2D1			0x0b04
 #define DIV_ENABLE_IP_G2D_SECURE_SMMU_G2D	0x0b08
 
-static const unsigned long g2d_clk_regs[] __initconst = {
+static const unsigned long g2d_clk_regs[] = {
 	MUX_SEL_G2D0,
 	MUX_SEL_ENABLE_G2D0,
 	DIV_G2D,
@@ -2381,7 +2345,7 @@ static const struct samsung_clk_reg_dump g2d_suspend_regs[] = {
 PNAME(mout_aclk_g2d_266_user_p)		= { "oscclk", "aclk_g2d_266", };
 PNAME(mout_aclk_g2d_400_user_p)		= { "oscclk", "aclk_g2d_400", };
 
-static const struct samsung_mux_clock g2d_mux_clks[] __initconst = {
+static const struct samsung_mux_clock g2d_mux_clks[] = {
 	/* MUX_SEL_G2D0 */
 	MUX(CLK_MUX_ACLK_G2D_266_USER, "mout_aclk_g2d_266_user",
 			mout_aclk_g2d_266_user_p, MUX_SEL_G2D0, 4, 1),
@@ -2389,13 +2353,13 @@ static const struct samsung_mux_clock g2d_mux_clks[] __initconst = {
 			mout_aclk_g2d_400_user_p, MUX_SEL_G2D0, 0, 1),
 };
 
-static const struct samsung_div_clock g2d_div_clks[] __initconst = {
+static const struct samsung_div_clock g2d_div_clks[] = {
 	/* DIV_G2D */
 	DIV(CLK_DIV_PCLK_G2D, "div_pclk_g2d", "mout_aclk_g2d_266_user",
 			DIV_G2D, 0, 2),
 };
 
-static const struct samsung_gate_clock g2d_gate_clks[] __initconst = {
+static const struct samsung_gate_clock g2d_gate_clks[] = {
 	/* DIV_ENABLE_ACLK_G2D */
 	GATE(CLK_ACLK_SMMU_MDMA1, "aclk_smmu_mdma1", "mout_aclk_g2d_266_user",
 			DIV_ENABLE_ACLK_G2D, 12, 0, 0),
@@ -2452,7 +2416,7 @@ static const struct samsung_gate_clock g2d_gate_clks[] __initconst = {
 		DIV_ENABLE_PCLK_G2D_SECURE_SMMU_G2D, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info g2d_cmu_info __initconst = {
+static const struct samsung_cmu_info g2d_cmu_info = {
 	.mux_clks		= g2d_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(g2d_mux_clks),
 	.div_clks		= g2d_div_clks,
@@ -2503,7 +2467,7 @@ static const struct samsung_cmu_info g2d_cmu_info __initconst = {
 #define CLKOUT_CMU_DISP			0x0c00
 #define CLKOUT_CMU_DISP_DIV_STAT	0x0c04
 
-static const unsigned long disp_clk_regs[] __initconst = {
+static const unsigned long disp_clk_regs[] = {
 	DISP_PLL_LOCK,
 	DISP_PLL_CON0,
 	DISP_PLL_CON1,
@@ -2588,12 +2552,12 @@ PNAME(mout_sclk_decon_tv_vclk_c_disp_p)	= {
 PNAME(mout_sclk_decon_tv_vclk_b_disp_p)	= { "mout_sclk_decon_tv_vclk_a_disp",
 					    "mout_sclk_decon_tv_vclk_user", };
 
-static const struct samsung_pll_clock disp_pll_clks[] __initconst = {
+static const struct samsung_pll_clock disp_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_DISP_PLL, "fout_disp_pll", "oscclk",
 		DISP_PLL_LOCK, DISP_PLL_CON0, exynos5433_pll_rates),
 };
 
-static const struct samsung_fixed_factor_clock disp_fixed_factor_clks[] __initconst = {
+static const struct samsung_fixed_factor_clock disp_fixed_factor_clks[] = {
 	/*
 	 * sclk_rgb_{vclk|tv_vclk} is half clock of sclk_decon_{vclk|tv_vclk}.
 	 * The divider has fixed value (2) between sclk_rgb_{vclk|tv_vclk}
@@ -2605,7 +2569,7 @@ static const struct samsung_fixed_factor_clock disp_fixed_factor_clks[] __initco
 			1, 2, 0),
 };
 
-static const struct samsung_fixed_rate_clock disp_fixed_clks[] __initconst = {
+static const struct samsung_fixed_rate_clock disp_fixed_clks[] = {
 	/* PHY clocks from MIPI_DPHY1 */
 	FRATE(0, "phyclk_mipidphy1_bitclkdiv8_phy", NULL, 0, 188000000),
 	FRATE(0, "phyclk_mipidphy1_rxclkesc0_phy", NULL, 0, 100000000),
@@ -2621,7 +2585,7 @@ static const struct samsung_fixed_rate_clock disp_fixed_clks[] __initconst = {
 			NULL, 0, 166000000),
 };
 
-static const struct samsung_mux_clock disp_mux_clks[] __initconst = {
+static const struct samsung_mux_clock disp_mux_clks[] = {
 	/* MUX_SEL_DISP0 */
 	MUX(CLK_MOUT_DISP_PLL, "mout_disp_pll", mout_disp_pll_p, MUX_SEL_DISP0,
 			0, 1),
@@ -2696,7 +2660,7 @@ static const struct samsung_mux_clock disp_mux_clks[] __initconst = {
 			mout_sclk_decon_vclk_p, MUX_SEL_DISP4, 0, 1),
 };
 
-static const struct samsung_div_clock disp_div_clks[] __initconst = {
+static const struct samsung_div_clock disp_div_clks[] = {
 	/* DIV_DISP */
 	DIV(CLK_DIV_SCLK_DSIM1_DISP, "div_sclk_dsim1_disp",
 			"mout_sclk_dsim1_b_disp", DIV_DISP, 24, 3),
@@ -2714,7 +2678,7 @@ static const struct samsung_div_clock disp_div_clks[] __initconst = {
 			DIV_DISP, 0, 2),
 };
 
-static const struct samsung_gate_clock disp_gate_clks[] __initconst = {
+static const struct samsung_gate_clock disp_gate_clks[] = {
 	/* ENABLE_ACLK_DISP0 */
 	GATE(CLK_ACLK_DECON_TV, "aclk_decon_tv", "mout_aclk_disp_333_user",
 			ENABLE_ACLK_DISP0, 2, 0, 0),
@@ -2874,7 +2838,7 @@ static const struct samsung_gate_clock disp_gate_clks[] __initconst = {
 			"div_sclk_decon_eclk_disp", ENABLE_SCLK_DISP, 2, 0, 0),
 };
 
-static const struct samsung_cmu_info disp_cmu_info __initconst = {
+static const struct samsung_cmu_info disp_cmu_info = {
 	.pll_clks		= disp_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(disp_pll_clks),
 	.mux_clks		= disp_mux_clks,
@@ -2914,7 +2878,7 @@ static const struct samsung_cmu_info disp_cmu_info __initconst = {
 #define ENABLE_IP_AUD0			0x0b00
 #define ENABLE_IP_AUD1			0x0b04
 
-static const unsigned long aud_clk_regs[] __initconst = {
+static const unsigned long aud_clk_regs[] = {
 	MUX_SEL_AUD0,
 	MUX_SEL_AUD1,
 	MUX_ENABLE_AUD0,
@@ -2938,13 +2902,13 @@ static const struct samsung_clk_reg_dump aud_suspend_regs[] = {
 PNAME(mout_aud_pll_user_aud_p)	= { "oscclk", "fout_aud_pll", };
 PNAME(mout_sclk_aud_pcm_p)	= { "mout_aud_pll_user", "ioclk_audiocdclk0",};
 
-static const struct samsung_fixed_rate_clock aud_fixed_clks[] __initconst = {
+static const struct samsung_fixed_rate_clock aud_fixed_clks[] = {
 	FRATE(0, "ioclk_jtag_tclk", NULL, 0, 33000000),
 	FRATE(0, "ioclk_slimbus_clk", NULL, 0, 25000000),
 	FRATE(0, "ioclk_i2s_bclk", NULL, 0, 50000000),
 };
 
-static const struct samsung_mux_clock aud_mux_clks[] __initconst = {
+static const struct samsung_mux_clock aud_mux_clks[] = {
 	/* MUX_SEL_AUD0 */
 	MUX(CLK_MOUT_AUD_PLL_USER, "mout_aud_pll_user",
 			mout_aud_pll_user_aud_p, MUX_SEL_AUD0, 0, 1),
@@ -2956,7 +2920,7 @@ static const struct samsung_mux_clock aud_mux_clks[] __initconst = {
 			MUX_SEL_AUD1, 0, 1),
 };
 
-static const struct samsung_div_clock aud_div_clks[] __initconst = {
+static const struct samsung_div_clock aud_div_clks[] = {
 	/* DIV_AUD0 */
 	DIV(CLK_DIV_ATCLK_AUD, "div_atclk_aud", "div_aud_ca5", DIV_AUD0,
 			12, 4),
@@ -2978,7 +2942,7 @@ static const struct samsung_div_clock aud_div_clks[] __initconst = {
 			DIV_AUD1, 0, 4),
 };
 
-static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
+static const struct samsung_gate_clock aud_gate_clks[] = {
 	/* ENABLE_ACLK_AUD */
 	GATE(CLK_ACLK_INTR_CTRL, "aclk_intr_ctrl", "div_aclk_aud",
 			ENABLE_ACLK_AUD, 12, 0, 0),
@@ -3048,7 +3012,7 @@ static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
 			ENABLE_SCLK_AUD1, 0, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info aud_cmu_info __initconst = {
+static const struct samsung_cmu_info aud_cmu_info = {
 	.mux_clks		= aud_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(aud_mux_clks),
 	.div_clks		= aud_div_clks,
@@ -3089,24 +3053,24 @@ PNAME(mout_aclk_bus2_400_p)	= { "oscclk", "aclk_bus2_400", };
 	ENABLE_IP_BUS0,		\
 	ENABLE_IP_BUS1
 
-static const unsigned long bus01_clk_regs[] __initconst = {
+static const unsigned long bus01_clk_regs[] = {
 	CMU_BUS_COMMON_CLK_REGS,
 };
 
-static const unsigned long bus2_clk_regs[] __initconst = {
+static const unsigned long bus2_clk_regs[] = {
 	MUX_SEL_BUS2,
 	MUX_ENABLE_BUS2,
 	CMU_BUS_COMMON_CLK_REGS,
 };
 
-static const struct samsung_div_clock bus0_div_clks[] __initconst = {
+static const struct samsung_div_clock bus0_div_clks[] = {
 	/* DIV_BUS0 */
 	DIV(CLK_DIV_PCLK_BUS_133, "div_pclk_bus0_133", "aclk_bus0_400",
 			DIV_BUS, 0, 3),
 };
 
 /* CMU_BUS0 clocks */
-static const struct samsung_gate_clock bus0_gate_clks[] __initconst = {
+static const struct samsung_gate_clock bus0_gate_clks[] = {
 	/* ENABLE_ACLK_BUS0 */
 	GATE(CLK_ACLK_AHB2APB_BUSP, "aclk_ahb2apb_bus0p", "div_pclk_bus0_133",
 			ENABLE_ACLK_BUS, 4, CLK_IGNORE_UNUSED, 0),
@@ -3125,13 +3089,13 @@ static const struct samsung_gate_clock bus0_gate_clks[] __initconst = {
 };
 
 /* CMU_BUS1 clocks */
-static const struct samsung_div_clock bus1_div_clks[] __initconst = {
+static const struct samsung_div_clock bus1_div_clks[] = {
 	/* DIV_BUS1 */
 	DIV(CLK_DIV_PCLK_BUS_133, "div_pclk_bus1_133", "aclk_bus1_400",
 			DIV_BUS, 0, 3),
 };
 
-static const struct samsung_gate_clock bus1_gate_clks[] __initconst = {
+static const struct samsung_gate_clock bus1_gate_clks[] = {
 	/* ENABLE_ACLK_BUS1 */
 	GATE(CLK_ACLK_AHB2APB_BUSP, "aclk_ahb2apb_bus1p", "div_pclk_bus1_133",
 			ENABLE_ACLK_BUS, 4, CLK_IGNORE_UNUSED, 0),
@@ -3150,19 +3114,19 @@ static const struct samsung_gate_clock bus1_gate_clks[] __initconst = {
 };
 
 /* CMU_BUS2 clocks */
-static const struct samsung_mux_clock bus2_mux_clks[] __initconst = {
+static const struct samsung_mux_clock bus2_mux_clks[] = {
 	/* MUX_SEL_BUS2 */
 	MUX(CLK_MOUT_ACLK_BUS2_400_USER, "mout_aclk_bus2_400_user",
 			mout_aclk_bus2_400_p, MUX_SEL_BUS2, 0, 1),
 };
 
-static const struct samsung_div_clock bus2_div_clks[] __initconst = {
+static const struct samsung_div_clock bus2_div_clks[] = {
 	/* DIV_BUS2 */
 	DIV(CLK_DIV_PCLK_BUS_133, "div_pclk_bus2_133",
 			"mout_aclk_bus2_400_user", DIV_BUS, 0, 3),
 };
 
-static const struct samsung_gate_clock bus2_gate_clks[] __initconst = {
+static const struct samsung_gate_clock bus2_gate_clks[] = {
 	/* ENABLE_ACLK_BUS2 */
 	GATE(CLK_ACLK_AHB2APB_BUSP, "aclk_ahb2apb_bus2p", "div_pclk_bus2_133",
 			ENABLE_ACLK_BUS, 3, CLK_IGNORE_UNUSED, 0),
@@ -3191,19 +3155,19 @@ static const struct samsung_gate_clock bus2_gate_clks[] __initconst = {
 	.nr_gate_clks		= ARRAY_SIZE(bus##id##_gate_clks),	\
 	.nr_clk_ids		= BUSx_NR_CLK
 
-static const struct samsung_cmu_info bus0_cmu_info __initconst = {
+static const struct samsung_cmu_info bus0_cmu_info = {
 	CMU_BUS_INFO_CLKS(0),
 	.clk_regs		= bus01_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(bus01_clk_regs),
 };
 
-static const struct samsung_cmu_info bus1_cmu_info __initconst = {
+static const struct samsung_cmu_info bus1_cmu_info = {
 	CMU_BUS_INFO_CLKS(1),
 	.clk_regs		= bus01_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(bus01_clk_regs),
 };
 
-static const struct samsung_cmu_info bus2_cmu_info __initconst = {
+static const struct samsung_cmu_info bus2_cmu_info = {
 	CMU_BUS_INFO_CLKS(2),
 	.mux_clks		= bus2_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(bus2_mux_clks),
@@ -3211,19 +3175,6 @@ static const struct samsung_cmu_info bus2_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(bus2_clk_regs),
 };
 
-#define exynos5433_cmu_bus_init(id)					\
-static void __init exynos5433_cmu_bus##id##_init(struct device_node *np)\
-{									\
-	samsung_cmu_register_one(np, &bus##id##_cmu_info);		\
-}									\
-CLK_OF_DECLARE(exynos5433_cmu_bus##id,					\
-		"samsung,exynos5433-cmu-bus"#id,			\
-		exynos5433_cmu_bus##id##_init)
-
-exynos5433_cmu_bus_init(0);
-exynos5433_cmu_bus_init(1);
-exynos5433_cmu_bus_init(2);
-
 /*
  * Register offset definitions for CMU_G3D
  */
@@ -3247,7 +3198,7 @@ exynos5433_cmu_bus_init(2);
 #define CLKOUT_CMU_G3D_DIV_STAT		0x0c04
 #define CLK_STOPCTRL			0x1000
 
-static const unsigned long g3d_clk_regs[] __initconst = {
+static const unsigned long g3d_clk_regs[] = {
 	G3D_PLL_LOCK,
 	G3D_PLL_CON0,
 	G3D_PLL_CON1,
@@ -3274,12 +3225,12 @@ static const struct samsung_clk_reg_dump g3d_suspend_regs[] = {
 PNAME(mout_aclk_g3d_400_p)	= { "mout_g3d_pll", "aclk_g3d_400", };
 PNAME(mout_g3d_pll_p)		= { "oscclk", "fout_g3d_pll", };
 
-static const struct samsung_pll_clock g3d_pll_clks[] __initconst = {
+static const struct samsung_pll_clock g3d_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_G3D_PLL, "fout_g3d_pll", "oscclk",
 		G3D_PLL_LOCK, G3D_PLL_CON0, exynos5433_pll_rates),
 };
 
-static const struct samsung_mux_clock g3d_mux_clks[] __initconst = {
+static const struct samsung_mux_clock g3d_mux_clks[] = {
 	/* MUX_SEL_G3D */
 	MUX_F(CLK_MOUT_ACLK_G3D_400, "mout_aclk_g3d_400", mout_aclk_g3d_400_p,
 			MUX_SEL_G3D, 8, 1, CLK_SET_RATE_PARENT, 0),
@@ -3287,7 +3238,7 @@ static const struct samsung_mux_clock g3d_mux_clks[] __initconst = {
 			MUX_SEL_G3D, 0, 1, CLK_SET_RATE_PARENT, 0),
 };
 
-static const struct samsung_div_clock g3d_div_clks[] __initconst = {
+static const struct samsung_div_clock g3d_div_clks[] = {
 	/* DIV_G3D */
 	DIV(CLK_DIV_SCLK_HPM_G3D, "div_sclk_hpm_g3d", "mout_g3d_pll", DIV_G3D,
 			8, 2),
@@ -3297,7 +3248,7 @@ static const struct samsung_div_clock g3d_div_clks[] __initconst = {
 			0, 3, CLK_SET_RATE_PARENT, 0),
 };
 
-static const struct samsung_gate_clock g3d_gate_clks[] __initconst = {
+static const struct samsung_gate_clock g3d_gate_clks[] = {
 	/* ENABLE_ACLK_G3D */
 	GATE(CLK_ACLK_BTS_G3D1, "aclk_bts_g3d1", "div_aclk_g3d",
 			ENABLE_ACLK_G3D, 7, 0, 0),
@@ -3331,7 +3282,7 @@ static const struct samsung_gate_clock g3d_gate_clks[] __initconst = {
 			ENABLE_SCLK_G3D, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info g3d_cmu_info __initconst = {
+static const struct samsung_cmu_info g3d_cmu_info = {
 	.pll_clks		= g3d_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(g3d_pll_clks),
 	.mux_clks		= g3d_mux_clks,
@@ -3368,7 +3319,7 @@ static const struct samsung_cmu_info g3d_cmu_info __initconst = {
 #define ENABLE_IP_GSCL_SECURE_SMMU_GSCL1	0x0b0c
 #define ENABLE_IP_GSCL_SECURE_SMMU_GSCL2	0x0b10
 
-static const unsigned long gscl_clk_regs[] __initconst = {
+static const unsigned long gscl_clk_regs[] = {
 	MUX_SEL_GSCL,
 	MUX_ENABLE_GSCL,
 	ENABLE_ACLK_GSCL,
@@ -3396,7 +3347,7 @@ static const struct samsung_clk_reg_dump gscl_suspend_regs[] = {
 PNAME(aclk_gscl_111_user_p)	= { "oscclk", "aclk_gscl_111", };
 PNAME(aclk_gscl_333_user_p)	= { "oscclk", "aclk_gscl_333", };
 
-static const struct samsung_mux_clock gscl_mux_clks[] __initconst = {
+static const struct samsung_mux_clock gscl_mux_clks[] = {
 	/* MUX_SEL_GSCL */
 	MUX(CLK_MOUT_ACLK_GSCL_111_USER, "mout_aclk_gscl_111_user",
 			aclk_gscl_111_user_p, MUX_SEL_GSCL, 4, 1),
@@ -3404,7 +3355,7 @@ static const struct samsung_mux_clock gscl_mux_clks[] __initconst = {
 			aclk_gscl_333_user_p, MUX_SEL_GSCL, 0, 1),
 };
 
-static const struct samsung_gate_clock gscl_gate_clks[] __initconst = {
+static const struct samsung_gate_clock gscl_gate_clks[] = {
 	/* ENABLE_ACLK_GSCL */
 	GATE(CLK_ACLK_BTS_GSCL2, "aclk_bts_gscl2", "mout_aclk_gscl_333_user",
 			ENABLE_ACLK_GSCL, 11, 0, 0),
@@ -3478,7 +3429,7 @@ static const struct samsung_gate_clock gscl_gate_clks[] __initconst = {
 		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL2, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info gscl_cmu_info __initconst = {
+static const struct samsung_cmu_info gscl_cmu_info = {
 	.mux_clks		= gscl_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(gscl_mux_clks),
 	.gate_clks		= gscl_gate_clks,
@@ -3527,7 +3478,7 @@ static const struct samsung_cmu_info gscl_cmu_info __initconst = {
 #define APOLLO_INTR_SPREAD_USE_STANDBYWFI	0x1084
 #define APOLLO_INTR_SPREAD_BLOCKING_DURATION	0x1088
 
-static const unsigned long apollo_clk_regs[] __initconst = {
+static const unsigned long apollo_clk_regs[] = {
 	APOLLO_PLL_LOCK,
 	APOLLO_PLL_CON0,
 	APOLLO_PLL_CON1,
@@ -3562,12 +3513,12 @@ PNAME(mout_bus_pll_apollo_user_p)	= { "oscclk", "sclk_bus_pll_apollo", };
 PNAME(mout_apollo_p)			= { "mout_apollo_pll",
 					    "mout_bus_pll_apollo_user", };
 
-static const struct samsung_pll_clock apollo_pll_clks[] __initconst = {
+static const struct samsung_pll_clock apollo_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_APOLLO_PLL, "fout_apollo_pll", "oscclk",
 		APOLLO_PLL_LOCK, APOLLO_PLL_CON0, exynos5433_pll_rates),
 };
 
-static const struct samsung_mux_clock apollo_mux_clks[] __initconst = {
+static const struct samsung_mux_clock apollo_mux_clks[] = {
 	/* MUX_SEL_APOLLO0 */
 	MUX_F(CLK_MOUT_APOLLO_PLL, "mout_apollo_pll", mout_apollo_pll_p,
 			MUX_SEL_APOLLO0, 0, 1, CLK_SET_RATE_PARENT |
@@ -3582,7 +3533,7 @@ static const struct samsung_mux_clock apollo_mux_clks[] __initconst = {
 			0, 1, CLK_SET_RATE_PARENT, 0),
 };
 
-static const struct samsung_div_clock apollo_div_clks[] __initconst = {
+static const struct samsung_div_clock apollo_div_clks[] = {
 	/* DIV_APOLLO0 */
 	DIV_F(CLK_DIV_CNTCLK_APOLLO, "div_cntclk_apollo", "div_apollo2",
 			DIV_APOLLO0, 24, 3, CLK_GET_RATE_NOCACHE,
@@ -3613,7 +3564,7 @@ static const struct samsung_div_clock apollo_div_clks[] __initconst = {
 			CLK_DIVIDER_READ_ONLY),
 };
 
-static const struct samsung_gate_clock apollo_gate_clks[] __initconst = {
+static const struct samsung_gate_clock apollo_gate_clks[] = {
 	/* ENABLE_ACLK_APOLLO */
 	GATE(CLK_ACLK_ASATBSLV_APOLLO_3_CSSYS, "aclk_asatbslv_apollo_3_cssys",
 			"div_atclk_apollo", ENABLE_ACLK_APOLLO,
@@ -3661,7 +3612,7 @@ static const struct samsung_gate_clock apollo_gate_clks[] __initconst = {
 #define E5433_APOLLO_DIV1(hpm, copy) \
 		(((hpm) << 4) | ((copy) << 0))
 
-static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst = {
+static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] = {
 	{ 1300000, E5433_APOLLO_DIV0(3, 7, 7, 7, 2), E5433_APOLLO_DIV1(7, 1), },
 	{ 1200000, E5433_APOLLO_DIV0(3, 7, 7, 7, 2), E5433_APOLLO_DIV1(7, 1), },
 	{ 1100000, E5433_APOLLO_DIV0(3, 7, 7, 7, 2), E5433_APOLLO_DIV1(7, 1), },
@@ -3672,17 +3623,17 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
 	{  600000, E5433_APOLLO_DIV0(3, 7, 7, 7, 1), E5433_APOLLO_DIV1(7, 1), },
 	{  500000, E5433_APOLLO_DIV0(3, 7, 7, 7, 1), E5433_APOLLO_DIV1(7, 1), },
 	{  400000, E5433_APOLLO_DIV0(3, 7, 7, 7, 1), E5433_APOLLO_DIV1(7, 1), },
-	{  0 },
+	{  /* sentinel */ },
 };
 
-static const struct samsung_cpu_clock apollo_cpu_clks[] __initconst = {
+static const struct samsung_cpu_clock apollo_cpu_clks[] = {
 	CPU_CLK(CLK_SCLK_APOLLO, "apolloclk", "mout_apollo_pll",
 			"mout_bus_pll_apollo_user",
 			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
 			exynos5433_apolloclk_d),
 };
 
-static const struct samsung_cmu_info apollo_cmu_info __initconst = {
+static const struct samsung_cmu_info apollo_cmu_info = {
 	.pll_clks	= apollo_pll_clks,
 	.nr_pll_clks	= ARRAY_SIZE(apollo_pll_clks),
 	.mux_clks	= apollo_mux_clks,
@@ -3734,7 +3685,7 @@ static const struct samsung_cmu_info apollo_cmu_info __initconst = {
 #define ATLAS_INTR_SPREAD_USE_STANDBYWFI	0x1084
 #define ATLAS_INTR_SPREAD_BLOCKING_DURATION	0x1088
 
-static const unsigned long atlas_clk_regs[] __initconst = {
+static const unsigned long atlas_clk_regs[] = {
 	ATLAS_PLL_LOCK,
 	ATLAS_PLL_CON0,
 	ATLAS_PLL_CON1,
@@ -3769,12 +3720,12 @@ PNAME(mout_bus_pll_atlas_user_p)	= { "oscclk", "sclk_bus_pll_atlas", };
 PNAME(mout_atlas_p)			= { "mout_atlas_pll",
 					    "mout_bus_pll_atlas_user", };
 
-static const struct samsung_pll_clock atlas_pll_clks[] __initconst = {
+static const struct samsung_pll_clock atlas_pll_clks[] = {
 	PLL(pll_35xx, CLK_FOUT_ATLAS_PLL, "fout_atlas_pll", "oscclk",
 		ATLAS_PLL_LOCK, ATLAS_PLL_CON0, exynos5433_pll_rates),
 };
 
-static const struct samsung_mux_clock atlas_mux_clks[] __initconst = {
+static const struct samsung_mux_clock atlas_mux_clks[] = {
 	/* MUX_SEL_ATLAS0 */
 	MUX_F(CLK_MOUT_ATLAS_PLL, "mout_atlas_pll", mout_atlas_pll_p,
 			MUX_SEL_ATLAS0, 0, 1, CLK_SET_RATE_PARENT |
@@ -3789,7 +3740,7 @@ static const struct samsung_mux_clock atlas_mux_clks[] __initconst = {
 			0, 1, CLK_SET_RATE_PARENT, 0),
 };
 
-static const struct samsung_div_clock atlas_div_clks[] __initconst = {
+static const struct samsung_div_clock atlas_div_clks[] = {
 	/* DIV_ATLAS0 */
 	DIV_F(CLK_DIV_CNTCLK_ATLAS, "div_cntclk_atlas", "div_atlas2",
 			DIV_ATLAS0, 24, 3, CLK_GET_RATE_NOCACHE,
@@ -3820,7 +3771,7 @@ static const struct samsung_div_clock atlas_div_clks[] __initconst = {
 			CLK_DIVIDER_READ_ONLY),
 };
 
-static const struct samsung_gate_clock atlas_gate_clks[] __initconst = {
+static const struct samsung_gate_clock atlas_gate_clks[] = {
 	/* ENABLE_ACLK_ATLAS */
 	GATE(CLK_ACLK_ATB_AUD_CSSYS, "aclk_atb_aud_cssys",
 			"div_atclk_atlas", ENABLE_ACLK_ATLAS,
@@ -3894,7 +3845,7 @@ static const struct samsung_gate_clock atlas_gate_clks[] __initconst = {
 #define E5433_ATLAS_DIV1(hpm, copy) \
 		(((hpm) << 4) | ((copy) << 0))
 
-static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst = {
+static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] = {
 	{ 1900000, E5433_ATLAS_DIV0(7, 7, 7, 7, 4), E5433_ATLAS_DIV1(7, 1), },
 	{ 1800000, E5433_ATLAS_DIV0(7, 7, 7, 7, 4), E5433_ATLAS_DIV1(7, 1), },
 	{ 1700000, E5433_ATLAS_DIV0(7, 7, 7, 7, 4), E5433_ATLAS_DIV1(7, 1), },
@@ -3910,17 +3861,17 @@ static const struct exynos_cpuclk_cfg_data exynos5433_atlasclk_d[] __initconst =
 	{  700000, E5433_ATLAS_DIV0(7, 7, 7, 7, 2), E5433_ATLAS_DIV1(7, 1), },
 	{  600000, E5433_ATLAS_DIV0(7, 7, 7, 7, 2), E5433_ATLAS_DIV1(7, 1), },
 	{  500000, E5433_ATLAS_DIV0(7, 7, 7, 7, 2), E5433_ATLAS_DIV1(7, 1), },
-	{  0 },
+	{  /* sentinel */ },
 };
 
-static const struct samsung_cpu_clock atlas_cpu_clks[] __initconst = {
+static const struct samsung_cpu_clock atlas_cpu_clks[] = {
 	CPU_CLK(CLK_SCLK_ATLAS, "atlasclk", "mout_atlas_pll",
 			"mout_bus_pll_atlas_user",
 			CLK_CPU_HAS_E5433_REGS_LAYOUT, 0x200,
 			exynos5433_atlasclk_d),
 };
 
-static const struct samsung_cmu_info atlas_cmu_info __initconst = {
+static const struct samsung_cmu_info atlas_cmu_info = {
 	.pll_clks	= atlas_pll_clks,
 	.nr_pll_clks	= ARRAY_SIZE(atlas_pll_clks),
 	.mux_clks	= atlas_mux_clks,
@@ -3962,7 +3913,7 @@ static const struct samsung_cmu_info atlas_cmu_info __initconst = {
 #define ENABLE_IP_MSCL_SECURE_SMMU_M2MSCALER1		0x0b0c
 #define ENABLE_IP_MSCL_SECURE_SMMU_JPEG			0x0b10
 
-static const unsigned long mscl_clk_regs[] __initconst = {
+static const unsigned long mscl_clk_regs[] = {
 	MUX_SEL_MSCL0,
 	MUX_SEL_MSCL1,
 	MUX_ENABLE_MSCL0,
@@ -3995,7 +3946,7 @@ PNAME(mout_aclk_mscl_400_user_p)	= { "oscclk", "aclk_mscl_400", };
 PNAME(mout_sclk_jpeg_p)			= { "mout_sclk_jpeg_user",
 					"mout_aclk_mscl_400_user", };
 
-static const struct samsung_mux_clock mscl_mux_clks[] __initconst = {
+static const struct samsung_mux_clock mscl_mux_clks[] = {
 	/* MUX_SEL_MSCL0 */
 	MUX(CLK_MOUT_SCLK_JPEG_USER, "mout_sclk_jpeg_user",
 			mout_sclk_jpeg_user_p, MUX_SEL_MSCL0, 4, 1),
@@ -4007,13 +3958,13 @@ static const struct samsung_mux_clock mscl_mux_clks[] __initconst = {
 			MUX_SEL_MSCL1, 0, 1),
 };
 
-static const struct samsung_div_clock mscl_div_clks[] __initconst = {
+static const struct samsung_div_clock mscl_div_clks[] = {
 	/* DIV_MSCL */
 	DIV(CLK_DIV_PCLK_MSCL, "div_pclk_mscl", "mout_aclk_mscl_400_user",
 			DIV_MSCL, 0, 3),
 };
 
-static const struct samsung_gate_clock mscl_gate_clks[] __initconst = {
+static const struct samsung_gate_clock mscl_gate_clks[] = {
 	/* ENABLE_ACLK_MSCL */
 	GATE(CLK_ACLK_BTS_JPEG, "aclk_bts_jpeg", "mout_aclk_mscl_400_user",
 			ENABLE_ACLK_MSCL, 9, 0, 0),
@@ -4091,7 +4042,7 @@ static const struct samsung_gate_clock mscl_gate_clks[] __initconst = {
 			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 };
 
-static const struct samsung_cmu_info mscl_cmu_info __initconst = {
+static const struct samsung_cmu_info mscl_cmu_info = {
 	.mux_clks		= mscl_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(mscl_mux_clks),
 	.div_clks		= mscl_div_clks,
@@ -4122,7 +4073,7 @@ static const struct samsung_cmu_info mscl_cmu_info __initconst = {
 #define ENABLE_IP_MFC1				0x0b04
 #define ENABLE_IP_MFC_SECURE_SMMU_MFC		0x0b08
 
-static const unsigned long mfc_clk_regs[] __initconst = {
+static const unsigned long mfc_clk_regs[] = {
 	MUX_SEL_MFC,
 	MUX_ENABLE_MFC,
 	DIV_MFC,
@@ -4141,19 +4092,19 @@ static const struct samsung_clk_reg_dump mfc_suspend_regs[] = {
 
 PNAME(mout_aclk_mfc_400_user_p)		= { "oscclk", "aclk_mfc_400", };
 
-static const struct samsung_mux_clock mfc_mux_clks[] __initconst = {
+static const struct samsung_mux_clock mfc_mux_clks[] = {
 	/* MUX_SEL_MFC */
 	MUX(CLK_MOUT_ACLK_MFC_400_USER, "mout_aclk_mfc_400_user",
 			mout_aclk_mfc_400_user_p, MUX_SEL_MFC, 0, 0),
 };
 
-static const struct samsung_div_clock mfc_div_clks[] __initconst = {
+static const struct samsung_div_clock mfc_div_clks[] = {
 	/* DIV_MFC */
 	DIV(CLK_DIV_PCLK_MFC, "div_pclk_mfc", "mout_aclk_mfc_400_user",
 			DIV_MFC, 0, 2),
 };
 
-static const struct samsung_gate_clock mfc_gate_clks[] __initconst = {
+static const struct samsung_gate_clock mfc_gate_clks[] = {
 	/* ENABLE_ACLK_MFC */
 	GATE(CLK_ACLK_BTS_MFC_1, "aclk_bts_mfc_1", "mout_aclk_mfc_400_user",
 			ENABLE_ACLK_MFC, 6, 0, 0),
@@ -4199,7 +4150,7 @@ static const struct samsung_gate_clock mfc_gate_clks[] __initconst = {
 			0, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info mfc_cmu_info __initconst = {
+static const struct samsung_cmu_info mfc_cmu_info = {
 	.mux_clks		= mfc_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(mfc_mux_clks),
 	.div_clks		= mfc_div_clks,
@@ -4230,7 +4181,7 @@ static const struct samsung_cmu_info mfc_cmu_info __initconst = {
 #define ENABLE_IP_HEVC1				0x0b04
 #define ENABLE_IP_HEVC_SECURE_SMMU_HEVC		0x0b08
 
-static const unsigned long hevc_clk_regs[] __initconst = {
+static const unsigned long hevc_clk_regs[] = {
 	MUX_SEL_HEVC,
 	MUX_ENABLE_HEVC,
 	DIV_HEVC,
@@ -4249,19 +4200,19 @@ static const struct samsung_clk_reg_dump hevc_suspend_regs[] = {
 
 PNAME(mout_aclk_hevc_400_user_p)	= { "oscclk", "aclk_hevc_400", };
 
-static const struct samsung_mux_clock hevc_mux_clks[] __initconst = {
+static const struct samsung_mux_clock hevc_mux_clks[] = {
 	/* MUX_SEL_HEVC */
 	MUX(CLK_MOUT_ACLK_HEVC_400_USER, "mout_aclk_hevc_400_user",
 			mout_aclk_hevc_400_user_p, MUX_SEL_HEVC, 0, 0),
 };
 
-static const struct samsung_div_clock hevc_div_clks[] __initconst = {
+static const struct samsung_div_clock hevc_div_clks[] = {
 	/* DIV_HEVC */
 	DIV(CLK_DIV_PCLK_HEVC, "div_pclk_hevc", "mout_aclk_hevc_400_user",
 			DIV_HEVC, 0, 2),
 };
 
-static const struct samsung_gate_clock hevc_gate_clks[] __initconst = {
+static const struct samsung_gate_clock hevc_gate_clks[] = {
 	/* ENABLE_ACLK_HEVC */
 	GATE(CLK_ACLK_BTS_HEVC_1, "aclk_bts_hevc_1", "mout_aclk_hevc_400_user",
 			ENABLE_ACLK_HEVC, 6, 0, 0),
@@ -4309,7 +4260,7 @@ static const struct samsung_gate_clock hevc_gate_clks[] __initconst = {
 			0, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info hevc_cmu_info __initconst = {
+static const struct samsung_cmu_info hevc_cmu_info = {
 	.mux_clks		= hevc_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(hevc_mux_clks),
 	.div_clks		= hevc_div_clks,
@@ -4342,7 +4293,7 @@ static const struct samsung_cmu_info hevc_cmu_info __initconst = {
 #define ENABLE_IP_ISP2			0x0b08
 #define ENABLE_IP_ISP3			0x0b0c
 
-static const unsigned long isp_clk_regs[] __initconst = {
+static const unsigned long isp_clk_regs[] = {
 	MUX_SEL_ISP,
 	MUX_ENABLE_ISP,
 	DIV_ISP,
@@ -4364,7 +4315,7 @@ static const struct samsung_clk_reg_dump isp_suspend_regs[] = {
 PNAME(mout_aclk_isp_dis_400_user_p)	= { "oscclk", "aclk_isp_dis_400", };
 PNAME(mout_aclk_isp_400_user_p)		= { "oscclk", "aclk_isp_400", };
 
-static const struct samsung_mux_clock isp_mux_clks[] __initconst = {
+static const struct samsung_mux_clock isp_mux_clks[] = {
 	/* MUX_SEL_ISP */
 	MUX(CLK_MOUT_ACLK_ISP_DIS_400_USER, "mout_aclk_isp_dis_400_user",
 			mout_aclk_isp_dis_400_user_p, MUX_SEL_ISP, 4, 0),
@@ -4372,7 +4323,7 @@ static const struct samsung_mux_clock isp_mux_clks[] __initconst = {
 			mout_aclk_isp_400_user_p, MUX_SEL_ISP, 0, 0),
 };
 
-static const struct samsung_div_clock isp_div_clks[] __initconst = {
+static const struct samsung_div_clock isp_div_clks[] = {
 	/* DIV_ISP */
 	DIV(CLK_DIV_PCLK_ISP_DIS, "div_pclk_isp_dis",
 			"mout_aclk_isp_dis_400_user", DIV_ISP, 12, 3),
@@ -4384,7 +4335,7 @@ static const struct samsung_div_clock isp_div_clks[] __initconst = {
 			"mout_aclk_isp_400_user", DIV_ISP, 0, 3),
 };
 
-static const struct samsung_gate_clock isp_gate_clks[] __initconst = {
+static const struct samsung_gate_clock isp_gate_clks[] = {
 	/* ENABLE_ACLK_ISP0 */
 	GATE(CLK_ACLK_ISP_D_GLUE, "aclk_isp_d_glue", "mout_aclk_isp_400_user",
 			ENABLE_ACLK_ISP0, 6, CLK_IGNORE_UNUSED, 0),
@@ -4562,7 +4513,7 @@ static const struct samsung_gate_clock isp_gate_clks[] __initconst = {
 			0, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info isp_cmu_info __initconst = {
+static const struct samsung_cmu_info isp_cmu_info = {
 	.mux_clks		= isp_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(isp_mux_clks),
 	.div_clks		= isp_div_clks,
@@ -4614,7 +4565,7 @@ static const struct samsung_cmu_info isp_cmu_info __initconst = {
 #define ENABLE_IP_CAM02			0X0b08
 #define ENABLE_IP_CAM03			0X0b0C
 
-static const unsigned long cam0_clk_regs[] __initconst = {
+static const unsigned long cam0_clk_regs[] = {
 	MUX_SEL_CAM00,
 	MUX_SEL_CAM01,
 	MUX_SEL_CAM02,
@@ -4707,14 +4658,14 @@ PNAME(mout_sclk_pixelasync_lite_c_init_a_p) = {
 					"mout_aclk_cam0_552_user",
 					"mout_aclk_cam0_400_user", };
 
-static const struct samsung_fixed_rate_clock cam0_fixed_clks[] __initconst = {
+static const struct samsung_fixed_rate_clock cam0_fixed_clks[] = {
 	FRATE(CLK_PHYCLK_RXBYTEECLKHS0_S4_PHY, "phyclk_rxbyteclkhs0_s4_phy",
 			NULL, 0, 100000000),
 	FRATE(CLK_PHYCLK_RXBYTEECLKHS0_S2A_PHY, "phyclk_rxbyteclkhs0_s2a_phy",
 			NULL, 0, 100000000),
 };
 
-static const struct samsung_mux_clock cam0_mux_clks[] __initconst = {
+static const struct samsung_mux_clock cam0_mux_clks[] = {
 	/* MUX_SEL_CAM00 */
 	MUX(CLK_MOUT_ACLK_CAM0_333_USER, "mout_aclk_cam0_333_user",
 			mout_aclk_cam0_333_user_p, MUX_SEL_CAM00, 8, 1),
@@ -4788,7 +4739,7 @@ static const struct samsung_mux_clock cam0_mux_clks[] __initconst = {
 			MUX_SEL_CAM04, 0, 1),
 };
 
-static const struct samsung_div_clock cam0_div_clks[] __initconst = {
+static const struct samsung_div_clock cam0_div_clks[] = {
 	/* DIV_CAM00 */
 	DIV(CLK_DIV_PCLK_CAM0_50, "div_pclk_cam0_50", "div_aclk_cam0_200",
 			DIV_CAM00, 8, 2),
@@ -4835,7 +4786,7 @@ static const struct samsung_div_clock cam0_div_clks[] __initconst = {
 			"mout_sclk_pixelasync_lite_c_init_b", DIV_CAM03, 0, 3),
 };
 
-static const struct samsung_gate_clock cam0_gate_clks[] __initconst = {
+static const struct samsung_gate_clock cam0_gate_clks[] = {
 	/* ENABLE_ACLK_CAM00 */
 	GATE(CLK_ACLK_CSIS1, "aclk_csis1", "div_aclk_csis1", ENABLE_ACLK_CAM00,
 			6, 0, 0),
@@ -5042,7 +4993,7 @@ static const struct samsung_gate_clock cam0_gate_clks[] __initconst = {
 			ENABLE_SCLK_CAM0, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info cam0_cmu_info __initconst = {
+static const struct samsung_cmu_info cam0_cmu_info = {
 	.mux_clks		= cam0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(cam0_mux_clks),
 	.div_clks		= cam0_div_clks,
@@ -5085,7 +5036,7 @@ static const struct samsung_cmu_info cam0_cmu_info __initconst = {
 #define ENABLE_IP_CAM11			0X0b04
 #define ENABLE_IP_CAM12			0X0b08
 
-static const unsigned long cam1_clk_regs[] __initconst = {
+static const unsigned long cam1_clk_regs[] = {
 	MUX_SEL_CAM10,
 	MUX_SEL_CAM11,
 	MUX_SEL_CAM12,
@@ -5137,12 +5088,12 @@ PNAME(mout_aclk_lite_c_b_p)		= { "mout_aclk_lite_c_a",
 PNAME(mout_aclk_lite_c_a_p)		= { "mout_aclk_cam1_552_user",
 					    "mout_aclk_cam1_400_user", };
 
-static const struct samsung_fixed_rate_clock cam1_fixed_clks[] __initconst = {
+static const struct samsung_fixed_rate_clock cam1_fixed_clks[] = {
 	FRATE(CLK_PHYCLK_RXBYTEECLKHS0_S2B, "phyclk_rxbyteclkhs0_s2b_phy", NULL,
 			0, 100000000),
 };
 
-static const struct samsung_mux_clock cam1_mux_clks[] __initconst = {
+static const struct samsung_mux_clock cam1_mux_clks[] = {
 	/* MUX_SEL_CAM10 */
 	MUX(CLK_MOUT_SCLK_ISP_UART_USER, "mout_sclk_isp_uart_user",
 			mout_sclk_isp_uart_user_p, MUX_SEL_CAM10, 20, 1),
@@ -5178,7 +5129,7 @@ static const struct samsung_mux_clock cam1_mux_clks[] __initconst = {
 			MUX_SEL_CAM12, 0, 1),
 };
 
-static const struct samsung_div_clock cam1_div_clks[] __initconst = {
+static const struct samsung_div_clock cam1_div_clks[] = {
 	/* DIV_CAM10 */
 	DIV(CLK_DIV_SCLK_ISP_MPWM, "div_sclk_isp_mpwm",
 			"div_pclk_cam1_83", DIV_CAM10, 16, 2),
@@ -5202,7 +5153,7 @@ static const struct samsung_div_clock cam1_div_clks[] __initconst = {
 			DIV_CAM11, 0, 3),
 };
 
-static const struct samsung_gate_clock cam1_gate_clks[] __initconst = {
+static const struct samsung_gate_clock cam1_gate_clks[] = {
 	/* ENABLE_ACLK_CAM10 */
 	GATE(CLK_ACLK_ISP_GIC, "aclk_isp_gic", "mout_aclk_cam1_333_user",
 			ENABLE_ACLK_CAM10, 4, 0, 0),
@@ -5417,7 +5368,7 @@ static const struct samsung_gate_clock cam1_gate_clks[] __initconst = {
 			ENABLE_SCLK_CAM1, 0, 0, 0),
 };
 
-static const struct samsung_cmu_info cam1_cmu_info __initconst = {
+static const struct samsung_cmu_info cam1_cmu_info = {
 	.mux_clks		= cam1_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(cam1_mux_clks),
 	.div_clks		= cam1_div_clks,
@@ -5440,12 +5391,12 @@ static const struct samsung_cmu_info cam1_cmu_info __initconst = {
 #define ENABLE_ACLK_IMEM_SLIMSSS		0x080c
 #define ENABLE_PCLK_IMEM_SLIMSSS		0x0908
 
-static const unsigned long imem_clk_regs[] __initconst = {
+static const unsigned long imem_clk_regs[] = {
 	ENABLE_ACLK_IMEM_SLIMSSS,
 	ENABLE_PCLK_IMEM_SLIMSSS,
 };
 
-static const struct samsung_gate_clock imem_gate_clks[] __initconst = {
+static const struct samsung_gate_clock imem_gate_clks[] = {
 	/* ENABLE_ACLK_IMEM_SLIMSSS */
 	GATE(CLK_ACLK_SLIMSSS, "aclk_slimsss", "aclk_imem_sssx_266",
 			ENABLE_ACLK_IMEM_SLIMSSS, 0, CLK_IGNORE_UNUSED, 0),
@@ -5455,7 +5406,7 @@ static const struct samsung_gate_clock imem_gate_clks[] __initconst = {
 			ENABLE_PCLK_IMEM_SLIMSSS, 0, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info imem_cmu_info __initconst = {
+static const struct samsung_cmu_info imem_cmu_info = {
 	.gate_clks		= imem_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(imem_gate_clks),
 	.nr_clk_ids		= IMEM_NR_CLK,
@@ -5520,7 +5471,7 @@ static int __maybe_unused exynos5433_cmu_resume(struct device *dev)
 	return 0;
 }
 
-static int __init exynos5433_cmu_probe(struct platform_device *pdev)
+static int exynos5433_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
 	struct exynos5433_cmu_data *data;
@@ -5663,11 +5614,35 @@ static const struct of_device_id exynos5433_cmu_of_match[] = {
 		.compatible = "samsung,exynos5433-cmu-imem",
 		.data = &imem_cmu_info,
 	}, {
-		.compatible = "samsung,exynos5433-cmu-atlas",
-		.data = &atlas_cmu_info,
+		.compatible = "samsung,exynos5433-cmu-top",
+		.data = &top_cmu_info
+	}, {
+		.compatible = "samsung,exynos5433-cmu-cpif",
+		.data = &cpif_cmu_info
+	}, {
+		.compatible = "samsung,exynos5433-cmu-mif",
+		.data = &mif_cmu_info
+	}, {
+		.compatible = "samsung,exynos5433-cmu-peric",
+		.data = &peric_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-peris",
+		.data = &peris_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-bus0",
+		.data = &bus0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-bus1",
+		.data = &bus1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-bus2",
+		.data = &bus2_cmu_info,
 	}, {
 		.compatible = "samsung,exynos5433-cmu-apollo",
 		.data = &apollo_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-atlas",
+		.data = &atlas_cmu_info,
 	}, {
 	},
 };
@@ -5689,8 +5664,8 @@ static struct platform_driver exynos5433_cmu_driver __refdata = {
 	.probe = exynos5433_cmu_probe,
 };
 
-static int __init exynos5433_cmu_init(void)
-{
-	return platform_driver_register(&exynos5433_cmu_driver);
-}
-core_initcall(exynos5433_cmu_init);
+module_platform_driver(exynos5433_cmu_driver);
+
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_DESCRIPTION("Samsung Exynos5433 ARMv8-family clock driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 4a5d2a914bd6..d2cdd3eec190 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -6,6 +6,9 @@
 
 #include <linux/clk-provider.h>
 #include <linux/of.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include "clk.h"
 #include <dt-bindings/clock/exynos7-clk.h>
@@ -183,7 +186,7 @@ static const struct samsung_pll_clock topc_pll_clks[] __initconst = {
 		AUD_PLL_CON0, pll1460x_24mhz_tbl),
 };
 
-static const struct samsung_cmu_info topc_cmu_info __initconst = {
+static const struct samsung_cmu_info topc_cmu_info = {
 	.pll_clks		= topc_pll_clks,
 	.nr_pll_clks		= ARRAY_SIZE(topc_pll_clks),
 	.mux_clks		= topc_mux_clks,
@@ -199,14 +202,6 @@ static const struct samsung_cmu_info topc_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(topc_clk_regs),
 };
 
-static void __init exynos7_clk_topc_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &topc_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_topc, "samsung,exynos7-clock-topc",
-	exynos7_clk_topc_init);
-
 /* Register Offset definitions for CMU_TOP0 (0x105D0000) */
 #define MUX_SEL_TOP00			0x0200
 #define MUX_SEL_TOP01			0x0204
@@ -377,7 +372,7 @@ static const struct samsung_fixed_factor_clock top0_fixed_factor_clks[] __initco
 	FFACTOR(0, "ffac_top0_mfc_pll_div2", "mout_top0_mfc_pll_user", 1, 2, 0),
 };
 
-static const struct samsung_cmu_info top0_cmu_info __initconst = {
+static const struct samsung_cmu_info top0_cmu_info = {
 	.mux_clks		= top0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(top0_mux_clks),
 	.div_clks		= top0_div_clks,
@@ -391,14 +386,6 @@ static const struct samsung_cmu_info top0_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(top0_clk_regs),
 };
 
-static void __init exynos7_clk_top0_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &top0_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_top0, "samsung,exynos7-clock-top0",
-	exynos7_clk_top0_init);
-
 /* Register Offset definitions for CMU_TOP1 (0x105E0000) */
 #define MUX_SEL_TOP10			0x0200
 #define MUX_SEL_TOP11			0x0204
@@ -559,7 +546,7 @@ static const struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initco
 	FFACTOR(0, "ffac_top1_mfc_pll_div2", "mout_top1_mfc_pll_user", 1, 2, 0),
 };
 
-static const struct samsung_cmu_info top1_cmu_info __initconst = {
+static const struct samsung_cmu_info top1_cmu_info = {
 	.mux_clks		= top1_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(top1_mux_clks),
 	.div_clks		= top1_div_clks,
@@ -573,14 +560,6 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(top1_clk_regs),
 };
 
-static void __init exynos7_clk_top1_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &top1_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
-	exynos7_clk_top1_init);
-
 /* Register Offset definitions for CMU_CCORE (0x105B0000) */
 #define MUX_SEL_CCORE			0x0200
 #define DIV_CCORE			0x0600
@@ -608,7 +587,7 @@ static const struct samsung_gate_clock ccore_gate_clks[] __initconst = {
 		ENABLE_PCLK_CCORE, 8, 0, 0),
 };
 
-static const struct samsung_cmu_info ccore_cmu_info __initconst = {
+static const struct samsung_cmu_info ccore_cmu_info = {
 	.mux_clks		= ccore_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(ccore_mux_clks),
 	.gate_clks		= ccore_gate_clks,
@@ -618,14 +597,6 @@ static const struct samsung_cmu_info ccore_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(ccore_clk_regs),
 };
 
-static void __init exynos7_clk_ccore_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &ccore_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_ccore, "samsung,exynos7-clock-ccore",
-	exynos7_clk_ccore_init);
-
 /* Register Offset definitions for CMU_PERIC0 (0x13610000) */
 #define MUX_SEL_PERIC0			0x0200
 #define ENABLE_PCLK_PERIC0		0x0900
@@ -675,7 +646,7 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
 	GATE(SCLK_PWM, "sclk_pwm", "fin_pll", ENABLE_SCLK_PERIC0, 21, 0, 0),
 };
 
-static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+static const struct samsung_cmu_info peric0_cmu_info = {
 	.mux_clks		= peric0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
 	.gate_clks		= peric0_gate_clks,
@@ -685,11 +656,6 @@ static const struct samsung_cmu_info peric0_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
 };
 
-static void __init exynos7_clk_peric0_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &peric0_cmu_info);
-}
-
 /* Register Offset definitions for CMU_PERIC1 (0x14C80000) */
 #define MUX_SEL_PERIC10			0x0200
 #define MUX_SEL_PERIC11			0x0204
@@ -697,8 +663,6 @@ static void __init exynos7_clk_peric0_init(struct device_node *np)
 #define ENABLE_PCLK_PERIC1		0x0900
 #define ENABLE_SCLK_PERIC10		0x0A00
 
-CLK_OF_DECLARE(exynos7_clk_peric0, "samsung,exynos7-clock-peric0",
-	exynos7_clk_peric0_init);
 
 /* List of parent clocks for Muxes in CMU_PERIC1 */
 PNAME(mout_aclk_peric1_66_user_p)	= { "fin_pll", "aclk_peric1_66" };
@@ -799,7 +763,7 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
 		ENABLE_SCLK_PERIC10, 19, CLK_SET_RATE_PARENT, 0),
 };
 
-static const struct samsung_cmu_info peric1_cmu_info __initconst = {
+static const struct samsung_cmu_info peric1_cmu_info = {
 	.mux_clks		= peric1_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peric1_mux_clks),
 	.gate_clks		= peric1_gate_clks,
@@ -809,14 +773,6 @@ static const struct samsung_cmu_info peric1_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(peric1_clk_regs),
 };
 
-static void __init exynos7_clk_peric1_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &peric1_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_peric1, "samsung,exynos7-clock-peric1",
-	exynos7_clk_peric1_init);
-
 /* Register Offset definitions for CMU_PERIS (0x10040000) */
 #define MUX_SEL_PERIS			0x0200
 #define ENABLE_PCLK_PERIS		0x0900
@@ -854,7 +810,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	GATE(SCLK_TMU, "sclk_tmu", "fin_pll", ENABLE_SCLK_PERIS, 10, 0, 0),
 };
 
-static const struct samsung_cmu_info peris_cmu_info __initconst = {
+static const struct samsung_cmu_info peris_cmu_info = {
 	.mux_clks		= peris_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(peris_mux_clks),
 	.gate_clks		= peris_gate_clks,
@@ -864,14 +820,6 @@ static const struct samsung_cmu_info peris_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(peris_clk_regs),
 };
 
-static void __init exynos7_clk_peris_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &peris_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_peris, "samsung,exynos7-clock-peris",
-	exynos7_clk_peris_init);
-
 /* Register Offset definitions for CMU_FSYS0 (0x10E90000) */
 #define MUX_SEL_FSYS00			0x0200
 #define MUX_SEL_FSYS01			0x0204
@@ -962,7 +910,7 @@ static const struct samsung_gate_clock fsys0_gate_clks[] __initconst = {
 		ENABLE_SCLK_FSYS04, 28, 0, 0),
 };
 
-static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
+static const struct samsung_cmu_info fsys0_cmu_info = {
 	.fixed_clks		= fixed_rate_clks_fsys0,
 	.nr_fixed_clks		= ARRAY_SIZE(fixed_rate_clks_fsys0),
 	.mux_clks		= fsys0_mux_clks,
@@ -974,14 +922,6 @@ static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
 };
 
-static void __init exynos7_clk_fsys0_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &fsys0_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_fsys0, "samsung,exynos7-clock-fsys0",
-	exynos7_clk_fsys0_init);
-
 /* Register Offset definitions for CMU_FSYS1 (0x156E0000) */
 #define MUX_SEL_FSYS10			0x0200
 #define MUX_SEL_FSYS11			0x0204
@@ -1091,7 +1031,7 @@ static const struct samsung_gate_clock fsys1_gate_clks[] __initconst = {
 		ENABLE_SCLK_FSYS13, 24, CLK_IGNORE_UNUSED, 0),
 };
 
-static const struct samsung_cmu_info fsys1_cmu_info __initconst = {
+static const struct samsung_cmu_info fsys1_cmu_info = {
 	.fixed_clks		= fixed_rate_clks_fsys1,
 	.nr_fixed_clks		= ARRAY_SIZE(fixed_rate_clks_fsys1),
 	.mux_clks		= fsys1_mux_clks,
@@ -1105,14 +1045,6 @@ static const struct samsung_cmu_info fsys1_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
 };
 
-static void __init exynos7_clk_fsys1_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &fsys1_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_fsys1, "samsung,exynos7-clock-fsys1",
-	exynos7_clk_fsys1_init);
-
 #define MUX_SEL_MSCL			0x0200
 #define DIV_MSCL			0x0600
 #define ENABLE_ACLK_MSCL		0x0800
@@ -1206,7 +1138,7 @@ static const struct samsung_gate_clock mscl_gate_clks[] __initconst = {
 			ENABLE_PCLK_MSCL, 20, 0, 0),
 };
 
-static const struct samsung_cmu_info mscl_cmu_info __initconst = {
+static const struct samsung_cmu_info mscl_cmu_info = {
 	.mux_clks		= mscl_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(mscl_mux_clks),
 	.div_clks		= mscl_div_clks,
@@ -1218,14 +1150,6 @@ static const struct samsung_cmu_info mscl_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(mscl_clk_regs),
 };
 
-static void __init exynos7_clk_mscl_init(struct device_node *np)
-{
-	samsung_cmu_register_one(np, &mscl_cmu_info);
-}
-
-CLK_OF_DECLARE(exynos7_clk_mscl, "samsung,exynos7-clock-mscl",
-		exynos7_clk_mscl_init);
-
 /* Register Offset definitions for CMU_AUD (0x114C0000) */
 #define	MUX_SEL_AUD			0x0200
 #define	DIV_AUD0			0x0600
@@ -1240,7 +1164,7 @@ CLK_OF_DECLARE(exynos7_clk_mscl, "samsung,exynos7-clock-mscl",
 PNAME(mout_aud_pll_user_p) = { "fin_pll", "fout_aud_pll" };
 PNAME(mout_aud_group_p) = { "dout_aud_cdclk", "ioclk_audiocdclk0" };
 
-static const unsigned long aud_clk_regs[] __initconst = {
+static const unsigned long aud_clk_regs[] = {
 	MUX_SEL_AUD,
 	DIV_AUD0,
 	DIV_AUD1,
@@ -1249,13 +1173,13 @@ static const unsigned long aud_clk_regs[] __initconst = {
 	ENABLE_SCLK_AUD,
 };
 
-static const struct samsung_mux_clock aud_mux_clks[] __initconst = {
+static const struct samsung_mux_clock aud_mux_clks[] = {
 	MUX(0, "mout_sclk_i2s", mout_aud_group_p, MUX_SEL_AUD, 12, 1),
 	MUX(0, "mout_sclk_pcm", mout_aud_group_p, MUX_SEL_AUD, 16, 1),
 	MUX(0, "mout_aud_pll_user", mout_aud_pll_user_p, MUX_SEL_AUD, 20, 1),
 };
 
-static const struct samsung_div_clock aud_div_clks[] __initconst = {
+static const struct samsung_div_clock aud_div_clks[] = {
 	DIV(0, "dout_aud_ca5", "mout_aud_pll_user", DIV_AUD0, 0, 4),
 	DIV(0, "dout_aclk_aud", "dout_aud_ca5", DIV_AUD0, 4, 4),
 	DIV(0, "dout_aud_pclk_dbg", "dout_aud_ca5", DIV_AUD0, 8, 4),
@@ -1267,7 +1191,7 @@ static const struct samsung_div_clock aud_div_clks[] __initconst = {
 	DIV(0, "dout_aud_cdclk", "mout_aud_pll_user", DIV_AUD1, 24, 4),
 };
 
-static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
+static const struct samsung_gate_clock aud_gate_clks[] = {
 	GATE(SCLK_PCM, "sclk_pcm", "dout_sclk_pcm",
 			ENABLE_SCLK_AUD, 27, CLK_SET_RATE_PARENT, 0),
 	GATE(SCLK_I2S, "sclk_i2s", "dout_sclk_i2s",
@@ -1295,7 +1219,7 @@ static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
 	GATE(ACLK_ADMA, "aclk_dmac", "dout_aclk_aud", ENABLE_ACLK_AUD, 31, 0, 0),
 };
 
-static const struct samsung_cmu_info aud_cmu_info __initconst = {
+static const struct samsung_cmu_info aud_cmu_info = {
 	.mux_clks		= aud_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(aud_mux_clks),
 	.div_clks		= aud_div_clks,
@@ -1307,10 +1231,67 @@ static const struct samsung_cmu_info aud_cmu_info __initconst = {
 	.nr_clk_regs		= ARRAY_SIZE(aud_clk_regs),
 };
 
-static void __init exynos7_clk_aud_init(struct device_node *np)
+static int exynos7_cmu_probe(struct platform_device *pdev)
 {
-	samsung_cmu_register_one(np, &aud_cmu_info);
+	struct device *dev = &pdev->dev;
+	const struct samsung_cmu_info *info;
+
+	info = of_device_get_match_data(dev);
+	if (info)
+		samsung_cmu_register_one(dev->of_node, info);
+
+	return 0;
 }
 
-CLK_OF_DECLARE(exynos7_clk_aud, "samsung,exynos7-clock-aud",
-		exynos7_clk_aud_init);
+static const struct of_device_id exynos7_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynos7-clock-aud",
+		.data = &aud_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-mscl",
+		.data = &mscl_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-fsys1",
+		.data = &fsys1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-fsys0",
+		.data = &fsys0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-peris",
+		.data = &peris_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-peric1",
+		.data = &peric1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-peric0",
+		.data = &peric0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-ccore",
+		.data = &ccore_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-top1",
+		.data = &top1_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-top0",
+		.data = &top0_cmu_info,
+	}, {
+		.compatible = "samsung,exynos7-clock-topc",
+		.data = &topc_cmu_info,
+	},
+};
+
+static struct platform_driver exynos7_cmu_driver __refdata = {
+	.driver	= {
+		.name = "exynos7-clock",
+		.of_match_table = exynos7_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynos7_cmu_probe,
+};
+
+module_platform_driver(exynos7_cmu_driver);
+
+MODULE_DESCRIPTION("Samsung Exynos7 ARMv8-family clock driver");
+MODULE_AUTHOR("Naveen Krishna Ch <naveenkrishna.ch@gmail.com>");
+MODULE_AUTHOR("Alim Akhtar <alim.akhtar@samsung.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 5873a9354b50..7124d831d484 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -6,6 +6,7 @@
  * This file contains the utility functions to register the pll clocks.
 */
 
+#include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/hrtimer.h>
 #include <linux/iopoll.h>
@@ -93,7 +94,7 @@ static int samsung_pll_lock_wait(struct samsung_clk_pll *pll,
 	 * Exynos SoC variants. Single register read time was usually in range
 	 * 0.4...1.5 us, never less than 0.4 us.
 	 */
-	if (pll_early_timeout || timekeeping_suspended) {
+	if (pll_early_timeout || timekeeping_is_suspended()) {
 		i = PLL_TIMEOUT_LOOPS;
 		while (i-- > 0) {
 			if (readl_relaxed(pll->con_reg) & reg_mask)
@@ -1392,7 +1393,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	samsung_clk_add_lookup(ctx, &pll->hw, pll_clk->id);
 }
 
-void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
+void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_pll, void __iomem *base)
 {
@@ -1401,3 +1402,4 @@ void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	for (cnt = 0; cnt < nr_pll; cnt++)
 		_samsung_clk_register_pll(ctx, &pll_list[cnt], base);
 }
+EXPORT_SYMBOL_GPL(samsung_clk_register_pll);
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 336243c6f120..478a25ac763b 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
 
@@ -27,6 +28,7 @@ void samsung_clk_save(void __iomem *base,
 	for (; num_regs > 0; --num_regs, ++rd)
 		rd->value = readl(base + rd->offset);
 }
+EXPORT_SYMBOL_GPL(samsung_clk_save);
 
 void samsung_clk_restore(void __iomem *base,
 				      const struct samsung_clk_reg_dump *rd,
@@ -35,6 +37,7 @@ void samsung_clk_restore(void __iomem *base,
 	for (; num_regs > 0; --num_regs, ++rd)
 		writel(rd->value, base + rd->offset);
 }
+EXPORT_SYMBOL_GPL(samsung_clk_restore);
 
 struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 						const unsigned long *rdump,
@@ -52,9 +55,10 @@ struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 
 	return rd;
 }
+EXPORT_SYMBOL_GPL(samsung_clk_alloc_reg_dump);
 
 /* setup the essentials required to support clock lookup using ccf */
-struct samsung_clk_provider *__init samsung_clk_init(struct device_node *np,
+struct samsung_clk_provider *samsung_clk_init(struct device_node *np,
 			void __iomem *base, unsigned long nr_clks)
 {
 	struct samsung_clk_provider *ctx;
@@ -74,7 +78,7 @@ struct samsung_clk_provider *__init samsung_clk_init(struct device_node *np,
 	return ctx;
 }
 
-void __init samsung_clk_of_add_provider(struct device_node *np,
+void samsung_clk_of_add_provider(struct device_node *np,
 				struct samsung_clk_provider *ctx)
 {
 	if (np) {
@@ -83,6 +87,7 @@ void __init samsung_clk_of_add_provider(struct device_node *np,
 			panic("could not register clk provider\n");
 	}
 }
+EXPORT_SYMBOL_GPL(samsung_clk_of_add_provider);
 
 /* add a clock instance to the clock lookup table used for dt based lookup */
 void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
@@ -123,7 +128,7 @@ void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 }
 
 /* register a list of fixed clocks */
-void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
+void samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 		const struct samsung_fixed_rate_clock *list,
 		unsigned int nr_clk)
 {
@@ -151,9 +156,10 @@ void __init samsung_clk_register_fixed_rate(struct samsung_clk_provider *ctx,
 				__func__, list->name);
 	}
 }
+EXPORT_SYMBOL_GPL(samsung_clk_register_fixed_rate);
 
 /* register a list of fixed factor clocks */
-void __init samsung_clk_register_fixed_factor(struct samsung_clk_provider *ctx,
+void samsung_clk_register_fixed_factor(struct samsung_clk_provider *ctx,
 		const struct samsung_fixed_factor_clock *list, unsigned int nr_clk)
 {
 	struct clk_hw *clk_hw;
@@ -171,9 +177,10 @@ void __init samsung_clk_register_fixed_factor(struct samsung_clk_provider *ctx,
 		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 	}
 }
+EXPORT_SYMBOL_GPL(samsung_clk_register_fixed_factor);
 
 /* register a list of mux clocks */
-void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
+void samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 				const struct samsung_mux_clock *list,
 				unsigned int nr_clk)
 {
@@ -194,9 +201,10 @@ void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 	}
 }
+EXPORT_SYMBOL_GPL(samsung_clk_register_mux);
 
 /* register a list of div clocks */
-void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
+void samsung_clk_register_div(struct samsung_clk_provider *ctx,
 				const struct samsung_div_clock *list,
 				unsigned int nr_clk)
 {
@@ -224,9 +232,10 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
 		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 	}
 }
+EXPORT_SYMBOL_GPL(samsung_clk_register_div);
 
 /* register a list of gate clocks */
-void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
+void samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 				const struct samsung_gate_clock *list,
 				unsigned int nr_clk)
 {
@@ -246,6 +255,7 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 		samsung_clk_add_lookup(ctx, clk_hw, list->id);
 	}
 }
+EXPORT_SYMBOL_GPL(samsung_clk_register_gate);
 
 /*
  * obtain the clock speed of all external fixed clock sources from device
@@ -342,7 +352,7 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
  */
-struct samsung_clk_provider * __init samsung_cmu_register_one(
+struct samsung_clk_provider *samsung_cmu_register_one(
 			struct device_node *np,
 			const struct samsung_cmu_info *cmu)
 {
@@ -385,3 +395,10 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 
 	return ctx;
 }
+EXPORT_SYMBOL_GPL(samsung_cmu_register_one);
+
+MODULE_DESCRIPTION("Samsung Exynos clock controller support");
+MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com>");
+MODULE_AUTHOR("Marek Szyprowski <m.szyprowski@samsung.com>");
+MODULE_AUTHOR("Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index a52a38cc1740..b82709696751 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -222,7 +222,7 @@ struct samsung_gate_clock {
 #define GATE(_id, cname, pname, o, b, f, gf)			\
 	__GATE(_id, cname, pname, o, b, f, gf)
 
-#define PNAME(x) static const char * const x[] __initconst
+#define PNAME(x) static const char * const x[]
 
 /**
  * struct samsung_clk_reg_dump: register dump of clock controller registers.
@@ -337,10 +337,10 @@ struct samsung_cmu_info {
 	const char *clk_name;
 };
 
-extern struct samsung_clk_provider *__init samsung_clk_init(
+extern struct samsung_clk_provider *samsung_clk_init(
 			struct device_node *np, void __iomem *base,
 			unsigned long nr_clks);
-extern void __init samsung_clk_of_add_provider(struct device_node *np,
+extern void samsung_clk_of_add_provider(struct device_node *np,
 			struct samsung_clk_provider *ctx);
 extern void __init samsung_clk_of_register_fixed_ext(
 			struct samsung_clk_provider *ctx,
@@ -354,32 +354,32 @@ extern void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
 extern void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 			const struct samsung_clock_alias *list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_fixed_rate(
+extern void samsung_clk_register_fixed_rate(
 			struct samsung_clk_provider *ctx,
 			const struct samsung_fixed_rate_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_fixed_factor(
+extern void samsung_clk_register_fixed_factor(
 			struct samsung_clk_provider *ctx,
 			const struct samsung_fixed_factor_clock *list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
+extern void samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 			const struct samsung_mux_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
+extern void samsung_clk_register_div(struct samsung_clk_provider *ctx,
 			const struct samsung_div_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
+extern void samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 			const struct samsung_gate_clock *clk_list,
 			unsigned int nr_clk);
-extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
+extern void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			const struct samsung_pll_clock *pll_list,
 			unsigned int nr_clk, void __iomem *base);
-extern void __init samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
+extern void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
-extern struct samsung_clk_provider __init *samsung_cmu_register_one(
-			struct device_node *,
-			const struct samsung_cmu_info *);
+extern struct samsung_clk_provider *samsung_cmu_register_one(
+			struct device_node *np,
+			const struct samsung_cmu_info *cmu);
 
 extern unsigned long _get_rate(const char *clk_name);
 
-- 
2.33.0.685.g46640cef36-goog

