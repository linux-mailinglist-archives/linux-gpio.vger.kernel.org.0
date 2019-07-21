Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C190A6F540
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 21:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbfGUTlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 15:41:08 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15841 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfGUTlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 15:41:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34bfd80000>; Sun, 21 Jul 2019 12:41:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 12:41:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 12:41:05 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:04 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 21 Jul 2019 19:41:05 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.85]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d34bfcf0001>; Sun, 21 Jul 2019 12:41:04 -0700
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
Subject: [PATCH V6 09/21] clk: tegra: clk-super: Fix to enable PLLP branches to CPU
Date:   Sun, 21 Jul 2019 12:40:48 -0700
Message-ID: <1563738060-30213-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563738072; bh=3K7x/Oh8TQ/N8+NUlmWQ/I1v4OLQzS5q7gcJIEIHpvw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=U75hOrfw9Zo6SQfx5tUtMiuAHkmqQ6n3fODs1qXTqxclkbzlZ41U3iKBhjnZW6+hO
         /t/Rk0n48gxj3qT3ct8xjZDueHfgx6YxynZF7/FdsV5NdYJqb2qPVAaTptqSeOcex5
         b06gawEKA+aLghLMT7d/54aw2ADrsWde4ZtJTPM3QGewQ/Ccvo7V/enCBBR6MEyhZ7
         BluJsj8aLn76Al81Xjf82q6sbiaVbOZEDBr1fpQOPn0Ayjsa5zZZCMT59vRbmqogeQ
         QhPdWW/s/VGS0M6smJNDZAlU7lqlkdVLxpeyLMKjnvDY3xwgPyXBtOPI+Wz5c7TaW2
         Oa/CTRtBtaCDA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch has a fix to enable PLLP branches to CPU before changing
the CPU clusters clock source to PLLP for Gen5 Super clock.

During system suspend entry and exit, CPU source will be switched
to PLLP and this needs PLLP branches to be enabled to CPU prior to
the switch.

On system resume, warmboot code enables PLLP branches to CPU and
powers up the CPU with PLLP clock source.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-super.c            | 11 +++++++++++
 drivers/clk/tegra/clk-tegra-super-gen4.c |  4 ++--
 drivers/clk/tegra/clk.h                  |  4 ++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 39ef31b46df5..d73c587e4853 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -28,6 +28,9 @@
 #define super_state_to_src_shift(m, s) ((m->width * s))
 #define super_state_to_src_mask(m) (((1 << m->width) - 1))
 
+#define CCLK_SRC_PLLP_OUT0 4
+#define CCLK_SRC_PLLP_OUT4 5
+
 static u8 clk_super_get_parent(struct clk_hw *hw)
 {
 	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
@@ -97,6 +100,14 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
 		if (index == mux->div2_index)
 			index = mux->pllx_index;
 	}
+
+	/*
+	 * Enable PLLP branches to CPU before selecting PLLP source
+	 */
+	if ((mux->flags & TEGRA_CPU_CLK) &&
+	    ((index == CCLK_SRC_PLLP_OUT0) || (index == CCLK_SRC_PLLP_OUT4)))
+		tegra_clk_set_pllp_out_cpu(true);
+
 	val &= ~((super_state_to_src_mask(mux)) << shift);
 	val |= (index & (super_state_to_src_mask(mux))) << shift;
 
diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c b/drivers/clk/tegra/clk-tegra-super-gen4.c
index cdfe7c9697e1..cd208d0eca2a 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -180,7 +180,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 					gen_info->num_cclk_g_parents,
 					CLK_SET_RATE_PARENT,
 					clk_base + CCLKG_BURST_POLICY,
-					0, 4, 8, 0, NULL);
+					TEGRA_CPU_CLK, 4, 8, 0, NULL);
 		} else {
 			clk = tegra_clk_register_super_mux("cclk_g",
 					gen_info->cclk_g_parents,
@@ -201,7 +201,7 @@ static void __init tegra_super_clk_init(void __iomem *clk_base,
 					gen_info->num_cclk_lp_parents,
 					CLK_SET_RATE_PARENT,
 					clk_base + CCLKLP_BURST_POLICY,
-					0, 4, 8, 0, NULL);
+					TEGRA_CPU_CLK, 4, 8, 0, NULL);
 		} else {
 			clk = tegra_clk_register_super_mux("cclk_lp",
 					gen_info->cclk_lp_parents,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index ac6de3a0b91f..c357b49e49b0 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -694,6 +694,9 @@ struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
  * Flags:
  * TEGRA_DIVIDER_2 - LP cluster has additional divider. This flag indicates
  *     that this is LP cluster clock.
+ * TEGRA_CPU_CLK - This flag indicates this is CPU cluster clock. To use PLLP
+ * for CPU clock source, need to enable PLLP branches to CPU by setting the
+ * additional bit PLLP_OUT_CPU for gen5 super clock.
  */
 struct tegra_clk_super_mux {
 	struct clk_hw	hw;
@@ -710,6 +713,7 @@ struct tegra_clk_super_mux {
 #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super_mux, hw)
 
 #define TEGRA_DIVIDER_2 BIT(0)
+#define TEGRA_CPU_CLK	BIT(1)
 
 extern const struct clk_ops tegra_clk_super_ops;
 struct clk *tegra_clk_register_super_mux(const char *name,
-- 
2.7.4

