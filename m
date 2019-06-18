Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED2A749B5F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfFRHqs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:46:48 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19649 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbfFRHqq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:46:46 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896e70000>; Tue, 18 Jun 2019 00:46:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Jun 2019 00:46:46 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:45 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:45 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896e30002>; Tue, 18 Jun 2019 00:46:45 -0700
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
Subject: [PATCH V3 04/17] clk: tegra: save and restore divider rate
Date:   Tue, 18 Jun 2019 00:46:18 -0700
Message-ID: <1560843991-24123-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844007; bh=MzRi4/U6dTntRT5ieX4O/VlRdfg/Fy9oK6/T3fNDiA8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Xi2xihYAeSEksIwpYYcO1Q1B6z6bQGxuRtbkcYpQYfF57WoLfz9Y8F7lJFF6nwK5n
         P0J0erhNcnS+FOtR8CI6YjtKoQMfIHg3WXoQoYB+l+o3Vidu3B5j4tdBbJITJYN6qW
         VBrlH+KQ7RhSQG+AUUPMNpEh+el/mtk0OvPWn4ZCKvrYrRKg1pjAjDgcyrLk8hCoUW
         TFCUZyKYFRTplnQPY+DPSfbhMrvh2Zvah79ehE4DDkiXI7Lyt3p9DgoEHICA5REl4+
         aSkchi6R+EMYOIHWAKinlexq1PVbnu3Fg51c4/8qQS8ak7npd6HRPyQbp58TgVOxvD
         SUKAqEMwMzLJw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements context save and restore for clock divider.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry the context of clock divider is saved and
on resume context is restored back for normal operation.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-divider.c | 23 +++++++++++++++++++++++
 drivers/clk/tegra/clk.h         |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index e76731fb7d69..ecb7ff9ce97e 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -109,10 +109,33 @@ static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+static int clk_divider_save_context(struct clk_hw *hw)
+{
+	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	divider->rate = clk_frac_div_recalc_rate(hw, parent_rate);
+
+	return 0;
+}
+
+static void clk_divider_restore_context(struct clk_hw *hw)
+{
+	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+	unsigned long parent_rate = clk_hw_get_rate(parent);
+
+	if (clk_frac_div_set_rate(hw, divider->rate, parent_rate) < 0)
+		WARN_ON(1);
+}
+
 const struct clk_ops tegra_clk_frac_div_ops = {
 	.recalc_rate = clk_frac_div_recalc_rate,
 	.set_rate = clk_frac_div_set_rate,
 	.round_rate = clk_frac_div_round_rate,
+	.save_context = clk_divider_save_context,
+	.restore_context = clk_divider_restore_context,
 };
 
 struct clk *tegra_clk_register_divider(const char *name,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 905bf1096558..83623f5f55f3 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -42,6 +42,7 @@ struct clk *tegra_clk_register_sync_source(const char *name,
  * @width:	width of the divider bit field
  * @frac_width:	width of the fractional bit field
  * @lock:	register lock
+ * @rate:	rate during suspend and resume
  *
  * Flags:
  * TEGRA_DIVIDER_ROUND_UP - This flags indicates to round up the divider value.
@@ -62,6 +63,7 @@ struct tegra_clk_frac_div {
 	u8		width;
 	u8		frac_width;
 	spinlock_t	*lock;
+	unsigned long	rate;
 };
 
 #define to_clk_frac_div(_hw) container_of(_hw, struct tegra_clk_frac_div, hw)
-- 
2.7.4

