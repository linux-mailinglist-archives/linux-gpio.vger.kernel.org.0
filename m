Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B23B49B24
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 09:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbfFRHrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 03:47:22 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9740 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbfFRHrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 03:47:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0897080000>; Tue, 18 Jun 2019 00:47:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 00:47:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 00:47:21 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 07:47:20 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 18 Jun 2019 07:47:20 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.168.217]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0897060003>; Tue, 18 Jun 2019 00:47:20 -0700
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
Subject: [PATCH V3 17/17] arm64: dts: tegra210-p2180: Jetson TX1 SC7 timings
Date:   Tue, 18 Jun 2019 00:46:31 -0700
Message-ID: <1560843991-24123-18-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560844041; bh=Vsp36/vqBLGzaHV4U5nFiJBH5J5qqVmQ31C7uPAHcPk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=rKHUB+HqOYKLOeLs3gxU+2VJICl873Ak0DxOzwmFxJZtt4Rp0tDiqJwLoQAf2qHEe
         bFfkRful2dQCxQoJuqpkTKOVj4/yD2dC6WT7xi8zRhobYnUS4uKcOa+Yzn3ey5QgUc
         iSSNhOqqtjMwLwlrTl3kgmE/K7AW0VcJil7Z6O5Rspqz0LKi9ChNJwkIvBaYQMxG8F
         +/yJ75T4Rigjpd8SWCxauF8IkDj+H9CfO3QTSOjKyE1FXg0TBAwt3gCM/rxMHKBkGq
         kl71f1CHD6tzP7ABi5ojSXQHJQ1cZBpvdEve42/MNE67nkDNUDldpsob1DTwJxfo4X
         Z88pVPot5Alnw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch has Jetson TX1 platform specific SC7 timing configuration
in device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index e8654061ce03..f7c9332085f8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -279,6 +279,13 @@
 
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <0>;
+		nvidia,cpu-pwr-good-time = <0>;
+		nvidia,cpu-pwr-off-time = <0>;
+		nvidia,core-pwr-good-time = <4587 3876>;
+		nvidia,core-pwr-off-time = <39065>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
 	};
 
 	/* eMMC */
-- 
2.7.4

