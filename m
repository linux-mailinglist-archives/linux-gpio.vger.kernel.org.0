Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E92A40245C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237917AbhIGHcT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:32:19 -0400
Received: from mail-dm6nam08on2054.outbound.protection.outlook.com ([40.107.102.54]:28800
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236242AbhIGHcP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:32:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFsyIiOaDfzNryInEx10INlyZ60rco6T3+o8isnXnsD5fvbHrPe+OQMUA0b4x2x+cuagUU2bSTPsxMZD6AVnLv5/rsw5dIYrJHjnnl4eSgZ0958HvMLMWrp0EtfMYz3OUGtSrIeac8N3BW2TPNu3CmFPm+8R6aa+0p9t2btJe7LLNdkW/kgNKVLfbbgpVMVqoXtJswPpFZ2vH7XIeTUQyoplVlW/dSp95HDmgTturtxnCuhosTUxo6s8dA3ZtEwtGnrKFhubft2MiGuD3o+y8Bn/Qnf7sFb4U1sVMr1qWhn2LCHxbOZba2FEwIb2rGkepD/yCxHMAbfG3Ebm7rH3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FzaeHkjeR+l2hq6r9CccmsWRGKLdEzi++JN3uu1F14s=;
 b=gbcPhPPqYrTCMdp8Z/p9dgV7raDLZ8Kqt66c5OOSTVUUL8GHjEDyBXIerlLLYr8LLis7miSnt6xmiKIewz0nVW1psFyvc24rf+Q0jr1Oc7ZzIxS7Z9iHaC9g5QhoJZuasxNXOfvxKlAZ2PIK4R1KjuUYtTkP3khFTPSWGMQwuCJaK1LfJAudOEoOxCZHZ+/Wz5TXIZMK/I2gVsWiXGo1Xib6L0T/hTjJWgcreq3Jh/rtkeWXhqrpSgnopYqi+5CA8/nc4f+OQVWpyXsAPSahkW2WgaMYwWj3dbRQQl9644L40uVLYk7iKrPhmKiGXIH8m1OnlrL0Ar+yY0/aaTHWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzaeHkjeR+l2hq6r9CccmsWRGKLdEzi++JN3uu1F14s=;
 b=sM+WAcsr+ShAl8uBYxX9solO5mHsoVzf89aT5VCjKXIKN4sOp2IzZVz4qRV2f91oMVi47i1pBLoK2CIhc0dBopGAPW7aKG/76Ru4DfgxCvUbKaroMUxOuGshMrCThT4eW15n7rId/7ewkNXRNVGTwCu+zbH15MFiznFOsCNZ7VHtdZXjIGYY2m/QCHlDpcnNyndXWnM/OSGBq1ZONCvEnjjSrbsEPfASNbJxHdIzYHD40wBlxtb+bM30JIzDtzDdSP2zG2IVXQYhLK67oCnrj+VuGyylYmWYaQfJe8e4kk6aCaAG0V2+cPHnEKI0AsI7YbTYSrY2VuoFuiV2+cvV8A==
Received: from BN6PR1401CA0023.namprd14.prod.outlook.com
 (2603:10b6:405:4b::33) by MWHPR12MB1632.namprd12.prod.outlook.com
 (2603:10b6:301:10::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 07:31:07 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::b4) by BN6PR1401CA0023.outlook.office365.com
 (2603:10b6:405:4b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 07:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:31:07 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 00:31:06 -0700
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 7 Sep 2021 07:31:04 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v2 2/2] arm64: tegra: GPIO Interrupt entries
Date:   Tue, 7 Sep 2021 13:00:38 +0530
Message-ID: <20210907073038.2983-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210907073038.2983-1-pshete@nvidia.com>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
 <20210907073038.2983-1-pshete@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1cdb329-8b3c-46e4-2614-08d971d174fc
X-MS-TrafficTypeDiagnostic: MWHPR12MB1632:
X-Microsoft-Antispam-PRVS: <MWHPR12MB16325AD0310C47EEADA05DB4B7D39@MWHPR12MB1632.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iOT0Q8Rmw0eYbg8df6Xe5SzhcDW8A0YyOWb/TnCaU6EBUx5VJxo1DhhINVr7v0BX5o+gSCiTZlLpa+6c3dWJwOKo2glhnCAESmcq7WZU85jqBOrFamLKAqr75Vc7omnUKw0ujE8j4eTkbtcMP2sYwf4HVL3MaDkxecCRaXmrQU65DdRelVqE/kq2qhf4SjjAq3BwBmUQWHHX6iwCvghTws+TsF3nlcyeONU/CQZtJbJxfqFN5ehYyTQesJRrjQAXQLs5tVmeSnN+jjS2RRdCNqyW8bCKNs4mANlg2S2LA6POc8MdK502OEt9lj67T96NgXD24pE5HLDqWNAaKWjRuxUCvScPvwRrVlXziVR05VVcQrWsnuxvtnV/6dgoL1NDgVszW7hE1MbqW8iY7DmpJ2vFceRfnTDsGGvX06BL/sOlyNns6QVc66ve84K+XFF6dfpd1ZvIIdj84/eFNnEQ/qP9AeO7MkByOy/UuLYW1EoGNl1yQ1yQ0A5RpE1xYxlnmxsaY2w3th/8VzA3Ax3X4Xd2JI/EnORZO4x7D/f0wZBKSBOtGRv8J8dDTshANSTi+fzwvQO7JF6rEH/6eeHjwSWmVQwYfQGLpe4JflJ9/SQY/FCSjxOVL3lA7Dc+3S0Op8AAjfGEL/V5oBD0uKDyGErsWx1LUkq9aVKX0pntnIArvzxKc8lG3kSB14ze/yaYp7v4LHd9BdPwyEHizjo/Q==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(110136005)(107886003)(70586007)(4326008)(36860700001)(2616005)(70206006)(36756003)(1076003)(336012)(2906002)(82310400003)(316002)(186003)(5660300002)(7696005)(26005)(426003)(8936002)(8676002)(6666004)(47076005)(7636003)(508600001)(356005)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:31:07.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cdb329-8b3c-46e4-2614-08d971d174fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1632
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

T19x supports 8 entries for GPIO controller.
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

