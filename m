Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB422D237
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfE1XJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:59 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16496 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfE1XJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf8c0001>; Tue, 28 May 2019 16:09:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 May 2019 16:09:00 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:08:59 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:08:59 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8b0003>; Tue, 28 May 2019 16:08:59 -0700
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
Subject: [PATCH V2 04/12] clk: tegra: add support for peripheral clock suspend and resume
Date:   Tue, 28 May 2019 16:08:48 -0700
Message-ID: <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084940; bh=xFOmjeaoCNKZGSYsRBa0HN3DzU4TBaJQr2OcS9aU+yo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=aZrcrlN+dCGQehBr2IcQ67Mf1RMkZXisnfCh06ISK0M4+16+MRCACtn9mUX47zRAp
         CmHdnHWCbB4BXerkBFhbUWjpeJFX/fW8YzxB4GBo12iDTuk4L/kGZe9iVA5nb5OpFm
         oibUJrKPUVGy+ZDLE0MJ1PUpBpUqQgr3FNLLuoYVjg4EfN1UjpxcAlU1GZdC9T4OT4
         V4E8l4TfR9DxWayZn1Jx5N6LZoDVKIhi5Ph0vwniu/FRHvNGhfvU9GZ33CiiCui8Yp
         Y9yk8v9ZRnoltl/Mpc7SLI/Hot4tJXzh+P+4vnifp750SIk7Q4nL9FL5F3Jocah/yy
         Lg9ggsrzx4OWQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements peripheral clock context save and restore
to support system suspend and resume operation.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h |  3 ++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 6f2862eddad7..08b788766564 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -81,6 +81,10 @@ static struct clk **clks;
 static int clk_num;
 static struct clk_onecell_data clk_data;
 
+#ifdef CONFIG_PM_SLEEP
+static u32 *periph_ctx;
+#endif
+
 /* Handlers for SoC-specific reset lines */
 static int (*special_reset_assert)(unsigned long);
 static int (*special_reset_deassert)(unsigned long);
@@ -210,6 +214,65 @@ const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
 	}
 }
 
+#ifdef CONFIG_PM_SLEEP
+void tegra_clk_periph_suspend(void __iomem *clk_base)
+{
+	int i, idx;
+
+	idx = 0;
+	for (i = 0; i < periph_banks; i++, idx++)
+		periph_ctx[idx] =
+			readl_relaxed(clk_base + periph_regs[i].rst_reg);
+
+	for (i = 0; i < periph_banks; i++, idx++)
+		periph_ctx[idx] =
+			readl_relaxed(clk_base + periph_regs[i].enb_reg);
+}
+
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base)
+{
+	int i;
+
+	WARN_ON(count != periph_banks);
+
+	for (i = 0; i < count; i++)
+		writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_reg);
+}
+
+void tegra_clk_periph_resume(void __iomem *clk_base)
+{
+	int i, idx;
+
+	idx = 0;
+	for (i = 0; i < periph_banks; i++, idx++)
+		writel_relaxed(periph_ctx[idx],
+			       clk_base + periph_regs[i].rst_reg);
+
+	/* ensure all resets have propagated */
+	fence_udelay(2, clk_base);
+	tegra_read_chipid();
+
+	for (i = 0; i < periph_banks; i++, idx++)
+		writel_relaxed(periph_ctx[idx],
+			       clk_base + periph_regs[i].enb_reg);
+
+	/* ensure all enables have propagated */
+	fence_udelay(2, clk_base);
+	tegra_read_chipid();
+}
+
+static int tegra_clk_suspend_ctx_init(int banks)
+{
+	int err = 0;
+
+	periph_ctx = kzalloc(2 * banks * sizeof(*periph_ctx), GFP_KERNEL);
+	if (!periph_ctx)
+		err = -ENOMEM;
+
+	return err;
+}
+#endif
+
 struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 {
 	clk_base = regs;
@@ -226,11 +289,20 @@ struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int banks)
 	periph_banks = banks;
 
 	clks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-	if (!clks)
+	if (!clks) {
 		kfree(periph_clk_enb_refcnt);
+		return NULL;
+	}
 
 	clk_num = num;
 
+#ifdef CONFIG_PM_SLEEP
+	if (tegra_clk_suspend_ctx_init(banks)) {
+		kfree(periph_clk_enb_refcnt);
+		kfree(clks);
+		return NULL;
+	}
+#endif
 	return clks;
 }
 
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index e4d124cc5657..ab238b2c3125 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -848,6 +848,9 @@ void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
 void tegra_clk_plle_tegra210_resume(struct clk *c);
 void tegra_clk_sync_state_pll(struct clk *c);
 void tegra_clk_sync_state_pll_out(struct clk *clk);
+void tegra_clk_periph_suspend(void __iomem *clk_base);
+void tegra_clk_periph_resume(void __iomem *clk_base);
+void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *clk_base);
 #endif
 
 
-- 
2.7.4

