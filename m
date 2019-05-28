Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503D32D20E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfE1XJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:20 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16508 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbfE1XJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf8d0000>; Tue, 28 May 2019 16:09:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 May 2019 16:09:01 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:09:00 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:09:00 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8c000f>; Tue, 28 May 2019 16:09:00 -0700
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
Subject: [PATCH V2 08/12] soc/tegra: pmc: allow support for more tegra wake models
Date:   Tue, 28 May 2019 16:08:52 -0700
Message-ID: <1559084936-4610-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084941; bh=TL2n3OtdXxVcQiiOyjZYY5RCn0QsZt4TN9LjjdGwntQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=n4b2Rrh6ZaSzF6CJOF8VIdMV9ny9aw9gw4H6543MXoqH1h8ZVndMmhwnC4u0mOYij
         Y6Y2on8KNFx5WZstUKcQO0gUfBOtBVacTaJUsO0BsMoqdweK6jmwS+nWgskYJtcEuF
         4zoWhJ7iBoVAikxfkfKfzWs7lch1d38fIyLR6nkr2/AnT8nR+aiVvWD+feT/X2k/Jy
         3mfNfr5itUCcD3MzuIgtkaMLF/mqYyzdnkzhN3ZcMfHdvoiZyCLrBZfHbeq1pUTnMq
         1HRVCH51RZNFSbVF8SbaHpCObOZINJWv67bUgg1SGyf7WFoyhdjvgp3ehXWwH6V+jC
         m0uhhAP4QsbTg==
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
 drivers/soc/tegra/pmc.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5648e5c09ef5..974b4c9f6ada 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -235,6 +235,8 @@ struct tegra_pmc_soc {
 	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
 				   struct device_node *np,
 				   bool invert);
+	int (*irq_set_wake)(struct irq_data *data, unsigned int on);
+	int (*irq_set_type)(struct irq_data *data, unsigned int type);
 
 	const char * const *reset_sources;
 	unsigned int num_reset_sources;
@@ -1915,12 +1917,15 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
-static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	unsigned int offset, bit;
 	u32 value;
 
+	if (data->hwirq == ULONG_MAX)
+		return 0;
+
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -1943,7 +1948,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	u32 value;
@@ -1996,8 +2001,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_unmask = irq_chip_unmask_parent;
 	pmc->irq.irq_eoi = irq_chip_eoi_parent;
 	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
-	pmc->irq.irq_set_type = tegra_pmc_irq_set_type;
-	pmc->irq.irq_set_wake = tegra_pmc_irq_set_wake;
+	if (pmc->soc->irq_set_type)
+		pmc->irq.irq_set_type = pmc->soc->irq_set_type;
+	if (pmc->soc->irq_set_wake)
+		pmc->irq.irq_set_wake = pmc->soc->irq_set_wake;
 
 	pmc->domain = irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_node,
 					       &tegra_pmc_irq_domain_ops, pmc);
@@ -2670,6 +2677,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
 	.reset_sources = tegra186_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra186_reset_sources),
 	.reset_levels = tegra186_reset_levels,
@@ -2748,6 +2757,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
 	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
 	.wake_events = tegra194_wake_events,
 };
-- 
2.7.4

