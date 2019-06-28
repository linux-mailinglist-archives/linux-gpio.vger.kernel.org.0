Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C286859081
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfF1CNi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:13:38 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17629 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfF1CNh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577cf0000>; Thu, 27 Jun 2019 19:13:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Jun 2019 19:13:35 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:35 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:35 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:35 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577cf0000>; Thu, 27 Jun 2019 19:13:35 -0700
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
Subject: [PATCH V5 12/18] soc/tegra: pmc: Allow support for more tegra wake
Date:   Thu, 27 Jun 2019 19:12:46 -0700
Message-ID: <1561687972-19319-13-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688015; bh=2GvhhOatfsM2bYQzuVGHbcx4hR8oEy2cTWpoIl1r38Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=EWysqwD20Hw+TrWjze8+lirhX1q7Wr0zQjD/3DWWlzX5VZ1ARs/TL0SiGs9y/NKGe
         nWZV5w66pjgJul5UW8mHwnzx7ogsrRC9dekpauXW83IBOOzZnSGD/yxu2de1Y9KjOg
         ksX9FMK3G6/E3hSFVK5GSuMMEioqRQnIO0yGtyri1S+unh4VWsskQsdSEYUXOlO1+u
         sDOXrHFHIs/aYFS7OiBSao7cj04xl6p45bp3B1zG8eQPpl86lOUPRlDkhvnHauTqfp
         13Vv4v3lNeY5lupg825EdDmiPmzHqvYhmZNZKnQeUZK6zp3frITTskmmhDw7CJ2Wo0
         a2rkHrsAJdFqw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch allows to create separate irq_set_wake and irq_set_type
implementations for different tegra designs PMC that has different
wake models which require difference wake registers and different
programming sequence.

AOWAKE model support is available for Tegra186 and Tegra194 only
and it resides within PMC and supports tiered wake architecture.

Tegra210 and prior tegra designs uses PMC directly to receive wake
events and coordinate the wake sequence.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9f9c1c677cf4..91c84d0e66ae 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -226,6 +226,8 @@ struct tegra_pmc_soc {
 	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
 				   struct device_node *np,
 				   bool invert);
+	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
+	int (*irq_set_type)(struct irq_data *data, unsigned int type);
 
 	const char * const *reset_sources;
 	unsigned int num_reset_sources;
@@ -1920,7 +1922,7 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
-static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	unsigned int offset, bit;
@@ -1952,7 +1954,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	u32 value;
@@ -2006,8 +2008,8 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_unmask = irq_chip_unmask_parent;
 	pmc->irq.irq_eoi = irq_chip_eoi_parent;
 	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
-	pmc->irq.irq_set_type = tegra_pmc_irq_set_type;
-	pmc->irq.irq_set_wake = tegra_pmc_irq_set_wake;
+	pmc->irq.irq_set_type = pmc->soc->irq_set_type;
+	pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
 
 	pmc->domain = irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_node,
 					       &tegra_pmc_irq_domain_ops, pmc);
@@ -2680,6 +2682,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
 	.reset_sources = tegra186_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra186_reset_sources),
 	.reset_levels = tegra186_reset_levels,
-- 
2.7.4

