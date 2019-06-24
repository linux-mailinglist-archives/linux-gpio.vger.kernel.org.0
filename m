Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C00D44FFE0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 05:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfFXDD3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 23:03:29 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:17284 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbfFXDD0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jun 2019 23:03:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d103d7c0002>; Sun, 23 Jun 2019 20:03:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 23 Jun 2019 20:03:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 23 Jun 2019 20:03:25 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 03:03:25 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Jun
 2019 03:03:25 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Jun 2019 03:03:25 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.174.126]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d103d7b0000>; Sun, 23 Jun 2019 20:03:25 -0700
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
Subject: [PATCH V4 08/18] clk: tegra: support for saving and restoring OSC context
Date:   Sun, 23 Jun 2019 20:02:49 -0700
Message-ID: <1561345379-2429-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561345404; bh=WYpLUxY/8RjJcWiK3+mUmFnaveTTPx4NdVxAsiwzuNA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=KGzQhu6WnjgU410YHOWuUtEnrCjckmwatjCeUukv00340UxqHOthOgBxJ8FHWZ+x4
         WEmOLQ1K/O/wOtnRIxJOYL7qj8mDhxA2oh2XzVvNXzZMYba5vLsCziPSmgj/wouH0F
         80/IepGCAQtP4gH3aDMvUQvZkSykCh9v2fN22JEjQFT659M4JTQlyXFlv9OQEVyeEo
         PRTtMtducN7Hoqwi96RCIs6zXnZ1UvMPTsvR7wWPKWtmVXHZksn0RME9swzuhiu6wm
         pWwvRfexcr3KEwLov04Z2pblSRoSMdcnAjDmTGQKmu8ve9PxziF2/9sU7Xx0UsZAoD
         upHpmq21iB5Bw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for storing OSC clock frequency and the
drive-strength during OSC clock init and creates an API to restore
OSC control register value from the saved context.

This API is invoked by Tegra210 clock driver during system resume
to restore the  OSC clock settings.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-fixed.c | 14 ++++++++++++++
 drivers/clk/tegra/clk.h             |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index 8d91b2b191cf..e8df0ccbffd0 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -17,7 +17,10 @@
 #define OSC_CTRL			0x50
 #define OSC_CTRL_OSC_FREQ_SHIFT		28
 #define OSC_CTRL_PLL_REF_DIV_SHIFT	26
+#define OSC_CTRL_MASK			(0x3f2 |	\
+					(0xf << OSC_CTRL_OSC_FREQ_SHIFT))
 
+static u32 osc_ctrl_ctx;
 int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 			      unsigned long *input_freqs, unsigned int num,
 			      unsigned int clk_m_div, unsigned long *osc_freq,
@@ -29,6 +32,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 	unsigned osc_idx;
 
 	val = readl_relaxed(clk_base + OSC_CTRL);
+	osc_ctrl_ctx = val & OSC_CTRL_MASK;
 	osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
 
 	if (osc_idx < num)
@@ -96,3 +100,13 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 		*dt_clk = clk;
 	}
 }
+
+void tegra_clk_osc_resume(void __iomem *clk_base)
+{
+	u32 val;
+
+	val = readl_relaxed(clk_base + OSC_CTRL) & ~OSC_CTRL_MASK;
+	val |= osc_ctrl_ctx;
+	writel_relaxed(val, clk_base + OSC_CTRL);
+	fence_udelay(2, clk_base);
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 5ba4f503aea0..5a08827078e4 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -853,6 +853,7 @@ void tegra_cclkg_burst_policy_save_context(void);
 void tegra_cclkg_burst_policy_restore_context(void);
 void tegra_sclk_cclklp_burst_policy_save_context(void);
 void tegra_sclk_cpulp_burst_policy_restore_context(void);
+void tegra_clk_osc_resume(void __iomem *clk_base);
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4

