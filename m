Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6F05907B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfF1COG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:14:06 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17636 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfF1CNi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:38 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577cf0002>; Thu, 27 Jun 2019 19:13:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 27 Jun 2019 19:13:36 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:35 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:35 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577cf0005>; Thu, 27 Jun 2019 19:13:35 -0700
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
Subject: [PATCH V5 15/18] soc/tegra: pmc: Configure core power request polarity
Date:   Thu, 27 Jun 2019 19:12:49 -0700
Message-ID: <1561687972-19319-16-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688015; bh=ERKuxl3VXTCSt7ZlOTdJl+Ti8kkBSY5vvhGXUlExL9k=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=b+Nz4QhuQfKLjQwtpiYRZWIrNdsgN2oCg/p16Y4NbBHhONFZAhUu+6OyyXIdjXza3
         zYrXVr2TU0enjfReEok1xsRyisdZ6pzhNQypP+yUVqJJAY+sS33y+Tuu1UNUuZt4qe
         ldS+nXLouvRbvxKKdZSLhKSB3Hg0RJ/vsN388BT1b3BY3SuZojLWM6PRFo9d9xP2wy
         jprVaoo1cDMog7nBGtrnz/huM19gDtfF7NCAvilkkUxeD3itB0Azx+yaqFAr1qX4OQ
         IIX6SVqrc0MVJPWfG5xeRRq1wP1LwTrVDNF38PF2MLkE/74ymDmwIg8CZXajjAPa5m
         fINxzSVbQiKnQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch configures polarity of the core power request signal
in PMC control register based on the device tree property.

PMC asserts and de-asserts power request signal based on it polarity
when it need to power-up and power-down the core rail during SC7.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 194100d77243..ed83c0cd09a3 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -56,6 +56,7 @@
 #define  PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
+#define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
 #define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
 
@@ -2303,6 +2304,11 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
 	else
 		value |= PMC_CNTRL_SYSCLK_POLARITY;
 
+	if (pmc->corereq_high)
+		value &= ~PMC_CNTRL_PWRREQ_POLARITY;
+	else
+		value |= PMC_CNTRL_PWRREQ_POLARITY;
+
 	/* configure the output polarity while the request is tristated */
 	tegra_pmc_writel(pmc, value, PMC_CNTRL);
 
-- 
2.7.4

