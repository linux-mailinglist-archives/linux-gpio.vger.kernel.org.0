Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9817859091
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfF1COW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:14:22 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5504 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfF1CNh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:37 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577d20000>; Thu, 27 Jun 2019 19:13:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 27 Jun 2019 19:13:35 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:35 +0000
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:34 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:34 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577ce0004>; Thu, 27 Jun 2019 19:13:34 -0700
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
Subject: [PATCH V5 10/18] clk: tegra210: Use fence_udelay during PLLU init
Date:   Thu, 27 Jun 2019 19:12:44 -0700
Message-ID: <1561687972-19319-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688018; bh=xqhwILz/Sn/NsMkmMnHLFLG0V6+/ga/n+S6KiTKUBRg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=iLZFm7Ao1Xip/E2ikDPRaZsZ2dPVX6jG/cz1QwXtWJVqHrHkTZHrFOgG66+Ld7Z24
         4jtOTJW85UpU2Obpr0auggd6zQyF56b4tOzeA5gWJFTy4iFRkTjddytypLDw/bq18F
         s377wHubIY1AOy3OkFFpvwpKnFj2LlshmVGULyZv1jVlcBqCqAsWiSYocwR1Wdw+L6
         Te98furkDkYz9Yadd6uMIK62CtjxtZ2utmQSlaF6KEPkOH23lC93QIu0GKyVj2+KVG
         Hith+9hgBIXCttcY/XcRDuopHEwYxNjfgvVVm/+Ls1YsvV3aUVBV11qbsIaoP1fXCw
         YHDFVt02IZ3fA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch uses fence_udelay rather than udelay during PLLU
initialization to ensure writes to clock registers happens before
waiting for specified delay.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 7f90442462af..1c08c53482a5 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2836,7 +2836,7 @@ static int tegra210_enable_pllu(void)
 	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
 	reg &= ~BIT(pllu.params->iddq_bit_idx);
 	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
-	udelay(5);
+	fence_udelay(5, clk_base);
 
 	reg = readl_relaxed(clk_base + PLLU_BASE);
 	reg &= ~GENMASK(20, 0);
@@ -2844,7 +2844,7 @@ static int tegra210_enable_pllu(void)
 	reg |= fentry->n << 8;
 	reg |= fentry->p << 16;
 	writel(reg, clk_base + PLLU_BASE);
-	udelay(1);
+	fence_udelay(1, clk_base);
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
 
@@ -2890,12 +2890,12 @@ static int tegra210_init_pllu(void)
 		reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
 		reg &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
 		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
-		udelay(1);
+		fence_udelay(1, clk_base);
 
 		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
 		reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
 		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
-		udelay(1);
+		fence_udelay(1, clk_base);
 
 		reg = readl_relaxed(clk_base + PLLU_BASE);
 		reg &= ~PLLU_BASE_CLKENABLE_USB;
-- 
2.7.4

