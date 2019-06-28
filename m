Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C95E59064
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfF1CNv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:13:51 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17643 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfF1CNj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 22:13:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1577d00000>; Thu, 27 Jun 2019 19:13:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 19:13:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Jun 2019 19:13:37 -0700
Received: from HQMAIL102.nvidia.com (172.18.146.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:37 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL102.nvidia.com
 (172.18.146.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Jun
 2019 02:13:36 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 28 Jun 2019 02:13:36 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.155]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d1577d00002>; Thu, 27 Jun 2019 19:13:36 -0700
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
Subject: [PATCH V5 18/18] arm64: dts: tegra210-p3450: Jetson nano SC7 timings
Date:   Thu, 27 Jun 2019 19:12:52 -0700
Message-ID: <1561687972-19319-19-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561688016; bh=nUcVR3aZhc7CmOqQ/Gf0Or0b77WEAikV513SetsAm3o=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=lV07bS1nw6Nyav+vjPMiy5zgQnmLOJyQ8iBL05bLAZxsqvAkPZm4pvjAu9G3/loHd
         v39prKHsdCGeOTbBQBfiJfJHfX15MR373/8gVHDi07luwpwEfwNaNr9JghYaDUPvlt
         eVhlsRK458IhZT6LIHRPHvUwNSbMx9xMFZb4TpPL/wL7v3rywlSQryJSAXW709u/Kz
         8BN+icPwB73mJ/xSlwBc2chhvx2TzTETtNH53BS+cF/jMkJ8pOITVCHZvMgw0PhgEy
         2rm6GIKIt7dCO/bj1VSmsxiCoOxXmuevPT23KfqCJOLwQAPfT7a7rLlkWD3SPYQpw+
         7KQcNQ0s5s0lA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds Jetson nano platform specific SC7 timing configuration
in the device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9d17ec707bce..b81bfdfbc115 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -382,6 +382,13 @@
 
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
++		nvidia,suspend-mode = <0>;
+		nvidia,cpu-pwr-good-time = <0>;
+		nvidia,cpu-pwr-off-time = <0>;
+		nvidia,core-pwr-good-time = <4587 3876>;
+		nvidia,core-pwr-off-time = <39065>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
 	};
 
 	hda@70030000 {
-- 
2.7.4

