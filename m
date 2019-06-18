Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1512849B47
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbfFRHrj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:47:39 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14169 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfFRHrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:47:08 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0896fb0000>; Tue, 18 Jun 2019 00:47:07 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:47:07 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 00:47:07 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:47:06 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:47:06 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0896f80007>; Tue, 18 Jun 2019 00:47:06 -0700
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
Subject: [PATCH V3 12/17] soc/tegra: pmc: allow support for more tegra wake
Date:   Tue, 18 Jun 2019 00:46:26 -0700
Message-ID: <1560843991-24123-13-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844027; bh=4EGQI++zj4lUDjQs0M1vegh7zzNvu5bAdmZ5kricB/0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ZgEA02B306QGuVA6EM5wD1pKUQMNg5hcs5pnmYOGM8L2pnTzCaunYb15iOriCsRuo
         28sxZirK2rUfhr9AWRyttvVKg0k6/rhl5wtR/WonT80yHeYDikeIx4PeemZEfrUT4M
         GjiwJHkLJ5PBnzn4zOcDmNFi1iRpLKfClU68SedyH7d3OTiQuKjqZ9uByQYhlJ1SqZ
         +neCV99leG2sHOSQkzNkdk2CRUYJrn+uMQ6+7K9UjBxyZ7cpuW1z7bOPzCo8rZG9sk
         010Hj3R3r6h8sRYyNHeiX5xamg037SKpEg6O28zJ0e3LmNY9RV9MLoiLODug7jzLm7
         QDwR/CeQicFjw==
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
 drivers/soc/tegra/pmc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index edd4fe06810f..e87f29a35fcf 100644
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
@@ -1919,7 +1921,7 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
-static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	unsigned int offset, bit;
@@ -1951,7 +1953,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	u32 value;
@@ -2005,8 +2007,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
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
@@ -2679,6 +2683,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
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

