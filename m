Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0356B6F549
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 21:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfGUTmM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 15:42:12 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:12489 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbfGUTlI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 15:41:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d34bfd30000>; Sun, 21 Jul 2019 12:41:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 21 Jul 2019 12:41:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 21 Jul 2019 12:41:06 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 21 Jul
 2019 19:41:06 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 21 Jul 2019 19:41:06 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.85]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d34bfd10000>; Sun, 21 Jul 2019 12:41:06 -0700
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
Subject: [PATCH V6 10/21] clk: tegra: clk-super: Add save and restore support
Date:   Sun, 21 Jul 2019 12:40:49 -0700
Message-ID: <1563738060-30213-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563738067; bh=UpaDe5/XKuz7sPTOfw95w7QpxrM2zZbYu41J4GgqNqE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=aqIx5deNisjmMGELv25qOxcO5Cq3V5YfHTK4p3JeuHYWVMYxdg9awisH53f2zSmk/
         umjBb+B6dNmFWSTBEUUNoUu0pClnp5ZK6XNfd5GDhPMQ0AV+eC8VqMJchlNsUKHEy+
         uotpOJELzgGDz+TA7HybY5Ns2cKlyZpA7i7Ru3O6jVXF8+xqfuxfZPCBwCsHw6rIlQ
         dXR6kfFpdvj8GXL4cab/75LeukB0bes5cBm3Gt9LjsHpCKTpLDVBVZiEn5MZV/RdHp
         BMxrToHwOazE9bqZq/iUKWi0OGYrW5EX6ChnXjaNaiBC5q5sHnlBd1jTzNEEgG4Z7B
         oKSSABsCGgfmw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements save and restore context for clk_super_mux
and clk_super.

During system supend, core power goes off the and context of Tegra
CAR registers is lost.

So during suspend entry, context of super clock registers are saved
through save_context clk_ops and are restored through restore_context
clk_ops to have them in same state as before suspend.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-super.c | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h       |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index d73c587e4853..84492afd3f1d 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -121,9 +121,27 @@ static int clk_super_set_parent(struct clk_hw *hw, u8 index)
 	return err;
 }
 
+static int clk_super_mux_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
+
+	mux->parent_index_ctx = clk_super_get_parent(hw);
+
+	return 0;
+}
+
+static void clk_super_mux_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *mux = to_clk_super_mux(hw);
+
+	clk_super_set_parent(hw, mux->parent_index_ctx);
+}
+
 static const struct clk_ops tegra_clk_super_mux_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
+	.save_context = clk_super_mux_save_context,
+	.restore_context = clk_super_mux_restore_context,
 };
 
 static long clk_super_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -159,12 +177,34 @@ static int clk_super_set_rate(struct clk_hw *hw, unsigned long rate,
 	return super->div_ops->set_rate(div_hw, rate, parent_rate);
 }
 
+static int clk_super_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	struct clk_hw *div_hw = &super->frac_div.hw;
+
+	super->parent_index_ctx = clk_super_get_parent(hw);
+
+	return super->div_ops->save_context(div_hw);
+}
+
+static void clk_super_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	struct clk_hw *div_hw = &super->frac_div.hw;
+
+	clk_super_set_parent(hw, super->parent_index_ctx);
+
+	super->div_ops->restore_context(div_hw);
+}
+
 const struct clk_ops tegra_clk_super_ops = {
 	.get_parent = clk_super_get_parent,
 	.set_parent = clk_super_set_parent,
 	.set_rate = clk_super_set_rate,
 	.round_rate = clk_super_round_rate,
 	.recalc_rate = clk_super_recalc_rate,
+	.save_context = clk_super_save_context,
+	.restore_context = clk_super_restore_context,
 };
 
 struct clk *tegra_clk_register_super_mux(const char *name,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index c357b49e49b0..562a3ee2d537 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -708,6 +708,7 @@ struct tegra_clk_super_mux {
 	u8		div2_index;
 	u8		pllx_index;
 	spinlock_t	*lock;
+	u8		parent_index_ctx;
 };
 
 #define to_clk_super_mux(_hw) container_of(_hw, struct tegra_clk_super_mux, hw)
-- 
2.7.4

