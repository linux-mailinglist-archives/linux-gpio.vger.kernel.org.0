Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3DC49B70
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfFRHqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:46:40 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14088 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRHqj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:46:39 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896de0000>; Tue, 18 Jun 2019 00:46:38 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:46:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Jun 2019 00:46:38 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:46:38 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:46:37 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896db0002>; Tue, 18 Jun 2019 00:46:37 -0700
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
Subject: [PATCH V3 01/17] irqchip: tegra: do not disable COP IRQ during suspend
Date:   Tue, 18 Jun 2019 00:46:15 -0700
Message-ID: <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560843998; bh=tvQslV53EocwPwpfbzGR9nKs+VHwI0rTa6hb/3PMnzs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=py24H3zSsCh8vv5XIuecFN8vBKIfcKLB9Ef4V5fvur/MzQXWl45QCvRxP818KqWxE
         inVizr59zaN7EAtq0t8/39FeJskarrLcpFdSdIFHFPmdoA2Bf9hfw6unz+MQDYFvwW
         +WOPoYER0cGVRSL9W81Xd8bgyvk39dlZG/uszlhYKJvMxBDdoTZ+5fvvr3aiHWSdVW
         Tr3CPVztngIOsXKPv8bkMgmUy8e/5NK0EaDwJKXYB0sSfRc/Utfsyn+M4BCfLb1XIE
         v02mIC4XkH2pyCNoM5hIC94oH85917Upn0Wrn186s9hIPfG++kEMiOlNLnh0/xSYgr
         43UaYgdmjEgnQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
sequence and sc7 entry firmware is run from COP/BPMP-Lite.

So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
for Tegra210.

This patch has fix for leaving the COP IRQ enabled for Tegra210 during
interrupt controller suspend operation.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/irqchip/irq-tegra.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index e1f771c72fc4..cf0c07052064 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -44,18 +44,22 @@ static unsigned int num_ictlrs;
 
 struct tegra_ictlr_soc {
 	unsigned int num_ictlrs;
+	bool supports_sc7;
 };
 
 static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
 	.num_ictlrs = 4,
+	.supports_sc7 = false,
 };
 
 static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
 	.num_ictlrs = 5,
+	.supports_sc7 = false,
 };
 
 static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
 	.num_ictlrs = 6,
+	.supports_sc7 = true,
 };
 
 static const struct of_device_id ictlr_matches[] = {
@@ -67,6 +71,7 @@ static const struct of_device_id ictlr_matches[] = {
 
 struct tegra_ictlr_info {
 	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
+	const struct tegra_ictlr_soc *soc;
 #ifdef CONFIG_PM_SLEEP
 	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
 	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
@@ -147,8 +152,19 @@ static int tegra_ictlr_suspend(void)
 		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
 		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
 
-		/* Disable COP interrupts */
-		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
+		/*
+		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
+		 *
+		 * Tegra210 system suspend flow uses sc7entry firmware which
+		 * is executed by COP/BPMP and it includes disabling COP IRQ,
+		 * clamping CPU rail, turning off VDD_CPU, and preparing the
+		 * system to go to SC7/LP0.
+		 *
+		 * COP/BPMP wakes up when COP IRQ is triggered and runs
+		 * sc7entry-firmware. So need to keep COP interrupt enabled.
+		 */
+		if (!lic->soc->supports_sc7)
+			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
 
 		/* Disable CPU interrupts */
 		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
@@ -339,6 +355,7 @@ static int __init tegra_ictlr_init(struct device_node *node,
 		goto out_unmap;
 	}
 
+	lic->soc = soc;
 	tegra_ictlr_syscore_init();
 
 	pr_info("%pOF: %d interrupts forwarded to %pOF\n",
-- 
2.7.4

