Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18AD402469
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237640AbhIGHeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:34:01 -0400
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com ([40.107.237.50]:33377
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237574AbhIGHeA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:34:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChwdIDWTpeEO6EpO4NKT8ZQIZbCVpsCzrfACL3kMZy0e4t06gBIJeSpN3wBeGS1FCyxp77kTXnrUWc9i36bs0EItg29lF4ixMl7hdjM4aXd065BGGdddalIMdRhpzG8fFYNGTHhA5FGHDP84cE+8iZkEov3vuKwg1ARq8684Mcak2nm1Jdzir9GVN/DrX9F12Vz4jss8Ti4WpH2hkcXQ+fg2FHcRgaAolpyL/uiejpTXfT95I682eNmpZ1tgbbXkAu2yYJNoH5Szgvpfv/1PJeJ67hdZT36FrFsm/lN2rbRLTOyjVPiiJaB82Ws4srMdgLnl/21UNFaFqiOylRKQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q9SmtQF/3R/2CpmdaDA6rdxMKwUi699jXGv1X0n2HiM=;
 b=FerkhcHDg3KpEZ9euhSexW/SmC3AM4QEVn/2/OTuWoeuvRhtJj7Z+HXEXnsOpgF4hhHPgqde9qF18iKZcVDT/nngA2NmBPtccat97oWCXhUyzWkygrlbZaEX3rO+xYZmEt0wDVb0fCmkgPJkMXVeVBiYEP9k8Nw7AI317tUohldhNAj2Y5hWpVBsA5BCogHkcDJpHW60a9kV642yPWc22eciaFIMp2DCL3Wi6xVpmF55xHsVUosVSm1xQzKFyRRpOdspJnKlTX8cF769hYtHGdGrpMNKNOb65sX9zSdIWggyQsw4UCPDABUppXV4ZPbNNaNOTbEyTQEY5AJnFHNazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9SmtQF/3R/2CpmdaDA6rdxMKwUi699jXGv1X0n2HiM=;
 b=ICEVd3XLjcO2qeobOFkzgMbdmw2j1RMgiyODnd41Jr5QMUZ7LnWmy9jYhKnpmJjnLxB3PLoeE+rOSZbNTxSCo/mY5TRRhyQHIl2bZK9YS9luquxt7rSNRaW2JKKQB9SHmB34YtdrgbkQQ2urphwjwu80/81oCGuCszKIa/LLdRYpFFNaDCHUvw6N1LmXRKFuESMAoPjPxsBir2dnPCvXi0Ts2/SLSb9tAqH2l2Cm8B5Sk7AAc01HFHUjC3XxJKvyfmxWZv3RFwZBXFnsnjahwQbgekUxfufkLfAMa47GJmdWuOczbdFGFXrrtnEaW1gUEhX9mBxqAqLS2YjGlEv3bg==
Received: from MW2PR16CA0014.namprd16.prod.outlook.com (2603:10b6:907::27) by
 SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Tue, 7 Sep
 2021 07:32:52 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::b8) by MW2PR16CA0014.outlook.office365.com
 (2603:10b6:907::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 07:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:32:52 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 07:32:51 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 7 Sep 2021 07:32:49 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v3 2/2] arm64: tegra: GPIO Interrupt entries
Date:   Tue, 7 Sep 2021 13:02:24 +0530
Message-ID: <20210907073224.3070-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907073224.3070-1-pshete@nvidia.com>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073224.3070-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efa3bb30-3da3-4c87-7574-08d971d1b38d
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5438107F5648C4EF87439537B7D39@SJ0PR12MB5438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpJ/H3bAW+1EGY3WyrXPUoW2GsW4wB7TxOYy+E8vsDzVqvNj7/ODAIZl6JXGhyvdk4pXyo18iV5eENZSR3fBZu4DKgEk7dhMlSFETvQiGTcSluf5nLzFoWJUh/MRVh5F2XWEaivSAoooPiMDv83ZQhHY0if7Mia7DcZ8pHcXSUbRXxOpAsPd5WmrKT3qhhRNFsN5Wa3DhSOlPcsDraA3H1nhZAGh+TjFGy1QFWBKQCb04G5lqAZaTHsnvC4eQ4k/RhnaOPAk7ayoI7Ygv3JOhMfzQy9CHUHzsr6NfNhr0c7kLD9OSAuPn5F3d87kUDn9CUAKZ1IJ7Y9AKrohop1I5DbZrxZnHCFYMZ9Y+Bdul9lsWOqz72g5x/KBWtk2T1HssIt4VFTKoRANZFFb5NdGfMruwX6pHVQMPbcNOQaSpkODcNRqT98Yq/bqk7dPG32VDxj5zlmsefnYPRGah9rIMsyJt03BzP0uVM3Foog61wTbtwEcwGUEawiTxUO2rEoKFJJsQQVNQHoOOtyk+101Vh/bxL3qZlWNpTfdkZvzs4v3sv7WN9/kL3WLmc11OCi2ifUpWFDcZc0dmxcPjuYSzUoBcxESuDmsBvg02GuqsUDshX51Ni1md4qj9tShrI/evt9w0fSb8oclpJmzJxW1eS1uTaBlHZ/8m0Y4d62HOVXHsHTPMBwBv7fGEEEdVE+KvPBcBkBeFr5obRwaJSMbEw==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(356005)(2906002)(508600001)(336012)(186003)(8936002)(2616005)(4326008)(36756003)(7636003)(8676002)(107886003)(26005)(47076005)(86362001)(70586007)(7696005)(426003)(1076003)(36860700001)(70206006)(316002)(110136005)(82310400003)(83380400001)(54906003)(5660300002)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:32:52.3093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efa3bb30-3da3-4c87-7574-08d971d1b38d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5438
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

Tegra19x supports 8 entries for GPIO controller.
This change adds the required interrupt entires for all GPIO controllers.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b7d532841390..c681a79c44ec 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -34,11 +34,53 @@
 			reg = <0x2200000 0x10000>,
 			      <0x2210000 0x10000>;
 			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			#gpio-cells = <2>;
@@ -1273,7 +1315,10 @@
 			reg-names = "security", "gpio";
 			reg = <0xc2f0000 0x1000>,
 			      <0xc2f1000 0x1000>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.17.1

