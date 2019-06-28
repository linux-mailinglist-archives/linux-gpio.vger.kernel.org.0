Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A375905E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfF1CNl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:13:41 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19612 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfF1CNk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577cb0001>; Thu, 27 Jun 2019 19:13:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:33 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Jun 2019 19:13:33 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:33 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577cd0001>; Thu, 27 Jun 2019 19:13:33 -0700
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
Subject: [PATCH V5 01/18] irqchip: tegra: Do not disable COP IRQ during suspend
Date:   Thu, 27 Jun 2019 19:12:35 -0700
Message-ID: <1561687972-19319-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688011; bh=s1XnuLcDk97/CuRHD9/IW+GAX3pxhADV42EQBIG7j4Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ETTtTjjfEu+L/wxeVVmd8cYksQbkCX1BAC6i3+R7aQOT6CazTXhXqr/531Ks2g6KO
         uREF9fi+9zjcQZAyWJ8JWoRotKLI4tDvnUWh7S8Nzy1NDxZGm/4o72vvkJPRV1d32a
         wpkjOREkFvio444O0ZKyL3dC8zfLAR47pk52qnE4OrGDllugTIYXun+ziZahauLueM
         rXnswh8xu0LtGxWfwJk6+gdjw7Oy5jsPS5krxyBdcUgWtUiQDInEewOQRk8Uqfrf91
         hTNC7uDbIz66YhPZi/A2KzLIkZqb7afAHwgPm+F8Wu+g/g1AULWN057B2lOCDNGrOj
         Czlv7qR+FuL3A==
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

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/irqchip/irq-tegra.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index e1f771c72fc4..851f88cef508 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -44,6 +44,7 @@ static unsigned int num_ictlrs;
 
 struct tegra_ictlr_soc {
 	unsigned int num_ictlrs;
+	bool supports_sc7;
 };
 
 static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
@@ -56,6 +57,7 @@ static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
 
 static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
 	.num_ictlrs = 6,
+	.supports_sc7 = true,
 };
 
 static const struct of_device_id ictlr_matches[] = {
@@ -67,6 +69,7 @@ static const struct of_device_id ictlr_matches[] = {
 
 struct tegra_ictlr_info {
 	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
+	const struct tegra_ictlr_soc *soc;
 #ifdef CONFIG_PM_SLEEP
 	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
 	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
@@ -147,8 +150,20 @@ static int tegra_ictlr_suspend(void)
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
+			/* Disable COP interrupts if SC7 is not supported */
+			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
 
 		/* Disable CPU interrupts */
 		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
@@ -339,6 +354,7 @@ static int __init tegra_ictlr_init(struct device_node *node,
 		goto out_unmap;
 	}
 
+	lic->soc = soc;
 	tegra_ictlr_syscore_init();
 
 	pr_info("%pOF: %d interrupts forwarded to %pOF\n",
-- 
2.7.4

