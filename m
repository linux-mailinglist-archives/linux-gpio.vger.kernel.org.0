Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679A3590AE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfF1COs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:14:48 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19569 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfF1CNg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577cc0000>; Thu, 27 Jun 2019 19:13:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 27 Jun 2019 19:13:34 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:33 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:33 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577cd0003>; Thu, 27 Jun 2019 19:13:33 -0700
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
Subject: [PATCH V5 03/18] clk: tegra: Save and restore divider rate
Date:   Thu, 27 Jun 2019 19:12:37 -0700
Message-ID: <1561687972-19319-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688012; bh=Nd1v90bh7Ho/ojHQIob7we6JLN3yOOpS5vD9L3b3q98=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Esh937kSEIxLY5xzF34aqQUtuPveBpeB1+nKe2kKdtZPlDKZvqf40pCp06i5UiEB1
         xXRmpZoHaizLBqysekD4RVh1r325jzvpheJ8ZfQeYberKYZPpErAZl+XEebBG5BnN5
         VYoAyMorKOAx6j5HoBLbFfzBAmPJiuWDK1p8o1IuNhCgdctGwpvgGAlCxu+uW89TuL
         LrB190AUWCAb47w+UrRQToxSDwJmKqKuYOfW9l8l2MEz3yywJjTV9mSRPHSBIg3Ow0
         C2KdNSdMxUjHEoH7yh6nHoTYg67JNc8rPrH+XgJOyGl2IV0Cr6Ov38s2Nd1i1c7h2n
         dp00VSTv97YPw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements context save and restore for clock divider.

During system suspend, core power goes off and looses the settings
of the Tegra CAR controller registers.

So during suspend entry the context of clock divider is saved and
on resume context is restored back for normal operation.

Acked-by: Thierry Reding <treding@nvidia.com>
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

