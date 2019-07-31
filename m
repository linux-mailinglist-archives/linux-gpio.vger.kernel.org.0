Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 865367B6B1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 02:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfGaAUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 20:20:30 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7229 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbfGaAU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 20:20:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d40ded40002>; Tue, 30 Jul 2019 17:20:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jul 2019 17:20:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jul 2019 17:20:28 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:27 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 31 Jul 2019 00:20:28 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.107]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d40decb0006>; Tue, 30 Jul 2019 17:20:27 -0700
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
Subject: [PATCH v7 02/20] pinctrl: tegra210: Add Tegra210 pinctrl pm ops
Date:   Tue, 30 Jul 2019 17:20:06 -0700
Message-ID: <1564532424-10449-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564532437; bh=BHwK3WCEUlQoYgNYri15m7IvYYDcUcYtnB4LBFhxM5w=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=cK9oN/lcJY4/C07fx3T1DhItt/mTTnRN8ds0SFkTOGONhYt5tjMDDvMdorAHFsS1I
         6GThk8Zr/Na5YhEvf+XvfaApehpPbJcOVon6wkp/siCrQ8SsakWGX9wjgyqvedosFC
         g20yQMveOjYmiRraMfR15TTGdpPerX5j0K0GcDqintgUyt4K8OaUiPDZ3u33G1pweX
         KAGOxqj7n7hU8MtdpMDM/XRtLYqHyczeSgLpfK+4cPOasCPHCzIbGJemJcGdR8JEg8
         ebvpNaxvr/zcofrpa8o/4TJ7JDBRCZJaMzIWdika8RGd3PmPGEnZqrpYLEXbReeHwT
         wOK3bim/5Y1CQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds suspend and resume functionality to Tegra210 pinctrl.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 39ab6480a941..fc072a36deb3 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
 	.driver = {
 		.name = "tegra210-pinctrl",
 		.of_match_table = tegra210_pinctrl_of_match,
+		.pm = &tegra_pinctrl_pm,
 	},
 	.probe = tegra210_pinctrl_probe,
 };
-- 
2.7.4

