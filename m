Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E15C2D230
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfE1XJC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:02 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9119 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbfE1XJC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:02 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf8c0000>; Tue, 28 May 2019 16:09:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 May 2019 16:09:00 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:09:00 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:09:00 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8c0000>; Tue, 28 May 2019 16:09:00 -0700
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
Subject: [PATCH V2 05/12] clk: tegra: add support for OSC clock resume
Date:   Tue, 28 May 2019 16:08:49 -0700
Message-ID: <1559084936-4610-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084940; bh=3D0hYh0yJU65ev4mxVYWDd3lZpbIvoh4OGgGNcwuEq8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=eXCmA9cd3LUjmJdeXsGbErE8vuV5+E8VUJvxzx7TN1V6Hlj7ZcBmnuJ0V3d/N/aYD
         lrnG4qaSCRVE91v8KnW6x08cRhLoL4KrkpLfktIIpGjcmBMVOEQwMjwgNfhUzcG66F
         wxz7mEIYQk9502gCtOmjK64kXz2iINy5E8Rscg3JkSRXJh6ZCkL0YYAmK4aDbW8k83
         osJX7HcM+m68u9rVdEUnvL78x7oBBk5xh6UtqpeA9TaIEqMRbfkJWuOlwsUtYFXNc1
         n7BM+qcAnCTmf0D1qn6tS/KOzUxGVKm0q+dBdtTWsPnTkJ9u11OBISESX8HYth+eL5
         ejbj1d2DhReEw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for restoring OSC control context on resume.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-fixed.c | 16 ++++++++++++++++
 drivers/clk/tegra/clk.h             |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 91c38f1666c1..de94333e800c 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -28,7 +28,10 @@
 #define OSC_CTRL			0x50
 #define OSC_CTRL_OSC_FREQ_SHIFT		28
 #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
+#define OSC_CTRL_MASK			(0x3f2 |	\
+					(0xf << OSC_CTRL_OSC_FREQ_SHIFT))
 
+static u32 osc_ctrl_ctx;
 int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 			      unsigned long *input_freqs, unsigned int num,
 			      unsigned int clk_m_div, unsigned long *osc_freq,
@@ -40,6 +43,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 	unsigned osc_idx;
 
 	val = readl_relaxed(clk_base + OSC_CTRL);
+	osc_ctrl_ctx = val & OSC_CTRL_MASK;
 	osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
 
 	if (osc_idx < num)
@@ -107,3 +111,15 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 		*dt_clk = clk;
 	}
 }
+
+#ifdef CONFIG_PM_SLEEP
+void tegra_clk_osc_resume(void __iomem *clk_base)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
+	val |= osc_ctrl_ctx;
+	writel_relaxed(val, clk_base + OSC_CTRL);
+	fence_udelay(2, clk_base);
+}
+#endif
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index ab238b2c3125..666b9d907951 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -851,6 +851,7 @@ void tegra_clk_sync_state_pll_out(struct clk *clk);
 void tegra_clk_periph_suspend(void __iomem *clk_base);
 void tegra_clk_periph_resume(void __iomem *clk_base);
 void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base);
+void tegra_clk_osc_resume(void __iomem *clk_base);
 #endif
 
 
-- 
2.7.4

