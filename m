Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCFDC7B6DA
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 02:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbfGaAUe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 20:20:34 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1910 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728705AbfGaAUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 20:20:34 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d40ded10000>; Tue, 30 Jul 2019 17:20:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jul 2019 17:20:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jul 2019 17:20:32 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:32 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:32 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 31 Jul 2019 00:20:32 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.107]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d40ded00000>; Tue, 30 Jul 2019 17:20:32 -0700
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
Subject: [PATCH v7 17/20] soc/tegra: pmc: Configure core power request polarity
Date:   Tue, 30 Jul 2019 17:20:21 -0700
Message-ID: <1564532424-10449-18-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564532433; bh=+irRG9Bl8eDAFdqPLYIcqsrOHQrSrUdohaTd6jMdMg0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=rPXbzDJ6qzgg5g5DdM/9xDwZ6ZN+ru3IGnmUG48eSegwc+HpChLhTF9JhpaOptEi8
         Sr1vq/4SuR+9xslqo3mHb7cHU/DyVdzkNEyWDy5XicYLFWYyieDFoTzSl+UJY3oG3D
         3NBJ1+AIzIbRrzhr3QmbQNqMzniFcx9Y1GfnZDlVdoyl2Qpu01jUSJnm8D+k1jMBzZ
         4/yvsYCDlOaSBchtgmVu4bFGHDCt/nMnEr/BO12qWzs04KOYZg9snfP9lykozvT0w1
         cGz+MuwE5r6Tyz9m/MYPkB4XcmfkpXtjuiJXbnSBYx16m1IUW2ZK/EC5k6+ONl71+m
         iZgN+8QaSib5Q==
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
index 3aa71c28a10a..e013ada7e4e9 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -56,6 +56,7 @@
 #define  PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
+#define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
 
 #define PMC_WAKE_MASK			0x0c
@@ -2290,6 +2291,11 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
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

