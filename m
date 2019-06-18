Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 349C549B1B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbfFRHrT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:47:19 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19691 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729226AbfFRHrT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:47:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0897070000>; Tue, 18 Jun 2019 00:47:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:47:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 00:47:18 -0700
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:47:18 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:47:17 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0897030001>; Tue, 18 Jun 2019 00:47:17 -0700
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
Subject: [PATCH V3 16/17] soc/tegra: pmc: configure deep sleep control settings
Date:   Tue, 18 Jun 2019 00:46:30 -0700
Message-ID: <1560843991-24123-17-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844039; bh=nQJmjDHX/yyz71fC5Ramf2lDdXrwkLYirADexX5oFCU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=OB9/UxJyZ+AG0aOpRR1NfNDxjMOzFg6yaSD0RkvrR/nkxWcSxlrQIhNyp08qu4bqF
         mc3bSzjBRkcKi+/QmOsuqURXHxkL5HmEbwP9fUtQElV7IP6ue/UFHbYWH4reGbeNFH
         GQHEVzXK4shiMQgFqBKYGmQryX9RpdPUvodtlBBPXWdfFoGxGETUiTNFR7wQhaRFos
         YBpmbb/V79N7A9CI+Y3uoyvQ+Jwl9zpovqBiRVY9p4NknXrVPq+l5SNIfEdTCdxATc
         zEhDU8C59HI3GImfFXPi2s8JK6PiVFxau46UrEbM3dhoBFsaH1zsJfbYDaX/3Okxn7
         /XfU5qxT3W6dQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
timings which are platform specific that should be configured before
entering into deep sleep.

Below are the timing specific configurations for deep sleep entry and
wakeup.
- Core rail power-on stabilization timer
- OSC clock stabilization timer after SOC rail power is stabilized.
- Core power off time is the minimum wake delay to keep the system
  in deep sleep state irrespective of any quick wake event.

These values depends on the discharge time of regulators and turn OFF
time of the PMIC to allow the complete system to finish entering into
deep sleep state.

These values vary based on the platform design and are specified
through the device tree.

This patch has implementation to configure these timings which are must
to have for proper deep sleep and wakeup operations.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index c9eea5ef008a..1b2ecda88a26 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -89,6 +89,8 @@
 
 #define PMC_CPUPWRGOOD_TIMER		0xc8
 #define PMC_CPUPWROFF_TIMER		0xcc
+#define PMC_COREPWRGOOD_TIMER		0x3c
+#define PMC_COREPWROFF_TIMER		0xe0
 
 #define PMC_PWR_DET_VALUE		0xe4
 
@@ -2292,6 +2294,7 @@ static const struct tegra_pmc_regs tegra20_pmc_regs = {
 static void tegra20_pmc_init(struct tegra_pmc *pmc)
 {
 	u32 value;
+	unsigned long osc, pmu, off;
 
 	/* Always enable CPU power request */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
@@ -2317,6 +2320,15 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value |= PMC_CNTRL_SYSCLK_OE;
 	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+
+	osc = DIV_ROUND_UP_ULL(pmc->core_osc_time * 8192, 1000000);
+	pmu = DIV_ROUND_UP_ULL(pmc->core_pmu_time * 32768, 1000000);
+	off = DIV_ROUND_UP_ULL(pmc->core_off_time * 32768, 1000000);
+	if (osc && pmu)
+		tegra_pmc_writel(pmc, ((osc << 8) & 0xff00) | (pmu & 0xff),
+				 PMC_COREPWRGOOD_TIMER);
+	if (off)
+		tegra_pmc_writel(pmc, off, PMC_COREPWROFF_TIMER);
 }
 
 static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
-- 
2.7.4

