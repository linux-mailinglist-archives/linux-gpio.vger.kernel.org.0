Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E476B2D224
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 01:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfE1XJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 19:09:34 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11179 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbfE1XJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 19:09:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cedbf840001>; Tue, 28 May 2019 16:08:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 May 2019 16:09:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 May 2019 16:09:01 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 May
 2019 23:09:00 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 May 2019 23:09:00 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.86]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cedbf8c0010>; Tue, 28 May 2019 16:09:00 -0700
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
Subject: [PATCH V2 09/12] soc/tegra: pmc: add pmc wake support for tegra210
Date:   Tue, 28 May 2019 16:08:53 -0700
Message-ID: <1559084936-4610-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559084933; bh=JndXRTXLz9twJOUQu0KI1wkSVnCVn45ycqGV26hT2vk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ASdLbqj9EmbMxTuexMJRhH+1oJTFpC+7rBKY1xd6ef0ofZhxflPrq8Uv5nNAG7s4n
         l3z14QgHEjhhQt0doAxuxrxgpkbF++hc/R3eCrEna1FDn0jdHiFq+7fE2VX4w9t2jw
         iKoFVd7uWqEkUHWUpaWibnBPBMdLu5ll78ahnU+ru3LgBBUy390kIdYOdZuppps3Wo
         iMoGju3nfHR14aLcfkN3/4PnPic18/+6K3IK8hDhrtEo+ydVnj3tX3sbytHwntSDgk
         /WlQUI21h/4sbcN9/4w4FnrxToUC2+b/8ykpANsq4D/aRwOfZMXE8C1UYfZaC/S5Zp
         WmH6eKuxpS+Xg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch implements PMC wakeup sequence for Tegra210 and defines
common used wake events of RTC alarm and power key.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 974b4c9f6ada..54dc8409e353 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -57,6 +57,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
 #include <dt-bindings/gpio/tegra186-gpio.h>
 #include <dt-bindings/gpio/tegra194-gpio.h>
+#include <dt-bindings/gpio/tegra-gpio.h>
 
 #define PMC_CNTRL			0x0
 #define  PMC_CNTRL_INTR_POLARITY	BIT(17) /* inverts INTR polarity */
@@ -66,6 +67,12 @@
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
+#define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
+
+#define PMC_WAKE_MASK			0x0c
+#define PMC_WAKE_LEVEL			0x10
+#define PMC_WAKE_STATUS			0x14
+#define PMC_SW_WAKE_STATUS		0x18
 
 #define DPD_SAMPLE			0x020
 #define  DPD_SAMPLE_ENABLE		BIT(0)
@@ -96,6 +103,11 @@
 
 #define PMC_SCRATCH41			0x140
 
+#define PMC_WAKE2_MASK			0x160
+#define PMC_WAKE2_LEVEL			0x164
+#define PMC_WAKE2_STATUS		0x168
+#define PMC_SW_WAKE2_STATUS		0x16c
+
 #define PMC_SENSOR_CTRL			0x1b0
 #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -245,6 +257,7 @@ struct tegra_pmc_soc {
 
 	const struct tegra_wake_event *wake_events;
 	unsigned int num_wake_events;
+	unsigned int max_supported_wake_events;
 };
 
 static const char * const tegra186_reset_sources[] = {
@@ -1917,6 +1930,54 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
+static int tegra210_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 value;
+
+	if (data->hwirq == ULONG_MAX)
+		return 0;
+
+	offset = data->hwirq / 32;
+	bit = data->hwirq % 32;
+
+	/*
+	 * latch wakeups to SW_WAKE_STATUS register to capture events
+	 * that would not make it into wakeup event register during LP0 exit.
+	 */
+	value = tegra_pmc_readl(pmc, PMC_CNTRL);
+	value |= PMC_CNTRL_LATCH_WAKEUPS;
+	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	usleep_range(110, 120);
+
+	value &= ~PMC_CNTRL_LATCH_WAKEUPS;
+	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+	usleep_range(110, 120);
+
+	tegra_pmc_writel(pmc, 0, PMC_SW_WAKE_STATUS);
+	if (pmc->soc->max_supported_wake_events > 32)
+		tegra_pmc_writel(pmc, 0, PMC_SW_WAKE2_STATUS);
+
+	tegra_pmc_writel(pmc, 0, PMC_WAKE_STATUS);
+	if (pmc->soc->max_supported_wake_events > 32)
+		tegra_pmc_writel(pmc, 0, PMC_WAKE2_STATUS);
+
+	/* enable PMC wake */
+	if (data->hwirq >= 32)
+		offset = PMC_WAKE2_MASK;
+	else
+		offset = PMC_WAKE_MASK;
+	value = tegra_pmc_readl(pmc, offset);
+	if (on)
+		value |= 1 << bit;
+	else
+		value &= ~(1 << bit);
+	tegra_pmc_writel(pmc, value, offset);
+
+	return 0;
+}
+
 static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -1948,6 +2009,48 @@ static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int tegra210_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
+	unsigned int offset, bit;
+	u32 value;
+
+	if (data->hwirq == ULONG_MAX)
+		return 0;
+
+	offset = data->hwirq / 32;
+	bit = data->hwirq % 32;
+
+	if (data->hwirq >= 32)
+		offset = PMC_WAKE2_LEVEL;
+	else
+		offset = PMC_WAKE_LEVEL;
+	value = tegra_pmc_readl(pmc, offset);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= 1 << bit;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_LEVEL_LOW:
+		value &= ~(1 << bit);
+		break;
+
+	case IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING:
+		value ^= 1 << bit;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	tegra_pmc_writel(pmc, value, offset);
+
+	return 0;
+}
+
 static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
@@ -2535,6 +2638,11 @@ static const struct pinctrl_pin_desc tegra210_pin_descs[] = {
 	TEGRA210_IO_PAD_TABLE(TEGRA_IO_PIN_DESC)
 };
 
+static const struct tegra_wake_event tegra210_wake_events[] = {
+	TEGRA_WAKE_GPIO("power", 24, 0, 189),
+	TEGRA_WAKE_IRQ("rtc", 16, 2),
+};
+
 static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.num_powergates = ARRAY_SIZE(tegra210_powergates),
 	.powergates = tegra210_powergates,
@@ -2552,10 +2660,15 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
 	.regs = &tegra20_pmc_regs,
 	.init = tegra20_pmc_init,
 	.setup_irq_polarity = tegra20_pmc_setup_irq_polarity,
+	.irq_set_wake = tegra210_pmc_irq_set_wake,
+	.irq_set_type = tegra210_pmc_irq_set_type,
 	.reset_sources = tegra210_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra210_reset_sources),
 	.reset_levels = NULL,
 	.num_reset_levels = 0,
+	.num_wake_events = ARRAY_SIZE(tegra210_wake_events),
+	.wake_events = tegra210_wake_events,
+	.max_supported_wake_events = 64,
 };
 
 #define TEGRA186_IO_PAD_TABLE(_pad)					     \
-- 
2.7.4

