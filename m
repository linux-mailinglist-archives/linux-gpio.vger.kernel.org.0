Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82E52986EC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 07:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770499AbgJZGjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 02:39:20 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16782 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1770486AbgJZGjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 02:39:19 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f966f020000>; Sun, 25 Oct 2020 23:38:58 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 06:39:15 +0000
Received: from vidyas-desktop.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Oct 2020 06:39:11 +0000
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <jckuo@nvidia.com>,
        <kyarlagadda@nvidia.com>, <lorenzo.pieralisi@arm.com>,
        <amurray@thegoodpenguin.co.uk>
CC:     <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kthota@nvidia.com>, <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>,
        <sagar.tv@gmail.com>
Subject: [PATCH 2/2] arm64: tegra: Fix DT binding for IO High Voltage entry
Date:   Mon, 26 Oct 2020 12:09:02 +0530
Message-ID: <20201026063902.14744-2-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026063902.14744-1-vidyas@nvidia.com>
References: <20201026063902.14744-1-vidyas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603694338; bh=LI104L2D+SwIdxtDq4b7FINXu6Attxn2TxYNi16Z+hs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=KvgFGXHqjXKF3QrUmrjMr7L68sJocNnR4O74HcMFCJm2HJbwBGND/QBsnmnJvKjj3
         1G217TVgLY3/aa3VorJJRmk7BKomsT5enSNh0EKau2z9aDRYDhCd6K4ZPk15Ua+x4E
         0LeMmMl4P3GnwtWVE0KJEzmOZ7lyerxD7EEF2EgsrklRypIAnP9TrwUJ170Dofstp6
         oTe4fv3clsi9rFTENyUfs8K0NhPddU3HDZrbzvo3WkGW7evdoBqeIlo4Z20I+hW/nf
         DvvLhe/sMwxluMxvSR6qoMZXRSEe20MwOPwRk5yOEGPcOPmhx4PJxRz7veTOsqarLh
         SA83ZMLPKW86A==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the device-tree entry that represents I/O High Voltage property
by replacing 'nvidia,io-high-voltage' with 'nvidia,io-hv' as the former
entry is deprecated.

Fixes: dbb72e2c305b ("arm64: tegra: Add configuration for PCIe C5 sideband signals")
Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 48160f48003a..5007a2a8647c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -155,7 +155,7 @@
 					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
 					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
 					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
 					nvidia,tristate = <TEGRA_PIN_DISABLE>;
 					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				};
@@ -167,7 +167,7 @@
 					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
 					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
 					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-					nvidia,io-high-voltage = <TEGRA_PIN_ENABLE>;
+					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
 					nvidia,tristate = <TEGRA_PIN_DISABLE>;
 					nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				};
-- 
2.17.1

