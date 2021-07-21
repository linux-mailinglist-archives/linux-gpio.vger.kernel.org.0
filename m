Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A957E3D0E6A
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 14:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbhGULVr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 07:21:47 -0400
Received: from mail-bn8nam11on2056.outbound.protection.outlook.com ([40.107.236.56]:6496
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236665AbhGULOu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 07:14:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iI6PJzhYg6R+N0XRgYFXgLCsBcaZHBrzX+1Z3xNSCYyxPXUMFl5WPV8gRD0jAZeC/mGQc/HClqmW32R3EqskYwg50QkYbNLV3H0/IoEgnU6sCjB+3WE8Y5Rbf1Hv8ie3j26pgJ45DdObQYLVqlHSqwpi95G0jX9I+3TDYxmanqD41OqTHq09E1q2u6ow+6Zz8VccgFHeYIj/t5YLf2qRlgTkMSSzghC/qKQSujtZSmP2gYCfV+u0yd96cCAldk7DXNNLVlkMCM6y/mUPCSNVnOq6fVNzz4f0itSbYBG/Bb9hl1ywGwGACQPmFMlIDX87ntTVNsp9RNabrb452tX16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjldc77sArK05bnXcS1ATHkH1P/OywKlfOjvCu5X4tE=;
 b=LfKlZJ/DBoPiskl2iwRPDwT5/m8hGD5wv7Deit5NSJWUMkVMysNhwcFx4c16og4BNU2AreQ0pt2c2fmS+6SW8bEM7x7s/cb/fl/U9YI0bIXLSw7tKiSwUE0TCqoNYNRErT/GZPraVo48+dsjx+t7evNSO4odAL79wvYZrr0n8FlqpJE9nLEXjbESb2/UGucg8fnfTtIXva+TOBWfMcmAVgTkw0pHVbI5FvNlEKCWN02UsKdFHVHFAtDbUE3eylBh1F9oyZLNIOzUijRpGhAe5d7UlbDpZw3wYhnRo/UKZzEIw7M3hIrx+JJUJkFoBZRnDi5YnFbRFhZTSWrNpndq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjldc77sArK05bnXcS1ATHkH1P/OywKlfOjvCu5X4tE=;
 b=HkJQ2DnnCKfD146Z70Nutr+SvyQRJ6qakboA3Mpwz76TCr9t2D5EGkRYFJLoRSIfxr0IPEnO0t27wwSFOxq57JBaamV7ki+45pA4y+hAcu0t4zLVP1zl8zt5yBDoUoSj67iAv9whXLSuBy5abWkBdBEN8i7nUqcV7SKbOSjDOsg=
Received: from BN9PR03CA0672.namprd03.prod.outlook.com (2603:10b6:408:10e::17)
 by BYAPR02MB4566.namprd02.prod.outlook.com (2603:10b6:a03:57::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 11:55:24 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::b8) by BN9PR03CA0672.outlook.office365.com
 (2603:10b6:408:10e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 11:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:55:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 21 Jul 2021 04:55:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 21 Jul 2021 04:55:18 -0700
Envelope-to: git@xilinx.com,
 saikrishna12468@gmail.com,
 robh+dt@kernel.org,
 linus.walleij@linaro.org,
 gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.106] (port=50909 helo=xhdvnc125.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <lakshmi.sai.krishna.potthuri@xilinx.com>)
        id 1m6Aon-000EcW-CC; Wed, 21 Jul 2021 04:55:17 -0700
Received: by xhdvnc125.xilinx.com (Postfix, from userid 14964)
        id BD9BC121DFD; Wed, 21 Jul 2021 17:24:23 +0530 (IST)
From:   Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <git@xilinx.com>,
        <saikrishna12468@gmail.com>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Subject: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with 'power-source' property
Date:   Wed, 21 Jul 2021 17:22:33 +0530
Message-ID: <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 352e2341-a814-432b-a0eb-08d94c3e6c9b
X-MS-TrafficTypeDiagnostic: BYAPR02MB4566:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4566FC7D2271E82B4500D3C0BDE39@BYAPR02MB4566.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DArrvsnUO2cGJ/FtSDfoyBkEB20SdDtrydvLPxFuWI3TpS+gdn2r/NkUBsHxjdsZiz/CEQkznjamP841vDDI6CSbhQzclIXhqDo4c3vlqowZUr+0rWkzYtiFjkJT7WeF96NJ7f1ZYJij3MtuJq8ewAECeWlE66aF5Wg9Zuq1WN6l6H5PpE42L7bN2QM9qcB7lID+7tRR1JM0rdY4X1II5iMPbTQ3R2G0oFtneEMuw3mErpQURRou5RPm3Wfe4ZWvQrgVn1tWWXThU1jwkVPRhvuyeGKakoBpgEAbpGQkqWpiBxEgOzi63LfpQm31YHkHfcrMCyJiUoKG0/ytTTg27mwVdicUgm/zg4T9rEYeqkz9P23ceYT1IPTM40jVvPTkcHlKSh0rF8jQo6zRTvEzzDlHLHCRlWL4DrclUf1RcYveoL9a2pCN33MjxXytpAvvzkAFTAKifBGcHCN50kA2+KpxkataGlgxngH/a/Zib65I1DUd/srYxNpDen7MZNc8lCaf20D4HdQZJceojMra5n2YGkT73hDJyDaW0Si7B/yTNJLSvoKOE6nb2u1b6TS3CJzjp0iD0FuTSWTrB4ajLDfx5GyXarWodyHPSm1dHNwvF5dRovtYewoNqt49/8HzAJwLoaZqZLFLsVfFfCop0B7z7sMWjXfwqqlYs/Zn0wMxCxcldLlEZ/f9uMUCQMzQgOVI8MG00Wp646XLdeQZzkRP8VdsSRhFEQhCgQ0IlhI=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(7636003)(6266002)(47076005)(2906002)(478600001)(5660300002)(8936002)(26005)(70206006)(356005)(4326008)(36756003)(6666004)(70586007)(42186006)(107886003)(36860700001)(8676002)(186003)(336012)(82740400003)(82310400003)(2616005)(36906005)(426003)(83380400001)(316002)(54906003)(110136005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:55:24.2148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 352e2341-a814-432b-a0eb-08d94c3e6c9b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4566
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace 'io-standard' property with 'power-source' property in all zynq dts
files to be in sync with Zynq pinctrl driver.

Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
---
 arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
 arch/arm/boot/dts/zynq-microzed.dts |  2 +-
 arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
 arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
index b0b836aedd76..be7eae611fb7 100644
--- a/arch/arm/boot/dts/zynq-ebaz4205.dts
+++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
@@ -57,7 +57,7 @@
 
 		conf {
 			groups = "gpio0_20_grp", "gpio0_32_grp";
-			io-standard = <3>;
+			power-source = <3>;
 			slew-rate = <0>;
 		};
 
@@ -75,7 +75,7 @@
 
 		conf {
 			groups = "sdio0_2_grp";
-			io-standard = <3>;
+			power-source = <3>;
 			slew-rate = <0>;
 			bias-disable;
 		};
@@ -87,7 +87,7 @@
 
 		conf-cd {
 			groups = "gpio0_34_grp";
-			io-standard = <3>;
+			power-source = <3>;
 			slew-rate = <0>;
 			bias-high-impedance;
 			bias-pull-up;
@@ -102,7 +102,7 @@
 
 		conf {
 			groups = "uart1_4_grp";
-			io-standard = <3>;
+			power-source = <3>;
 			slew-rate = <0>;
 		};
 
diff --git a/arch/arm/boot/dts/zynq-microzed.dts b/arch/arm/boot/dts/zynq-microzed.dts
index 6ed84fb15902..f44a4464943b 100644
--- a/arch/arm/boot/dts/zynq-microzed.dts
+++ b/arch/arm/boot/dts/zynq-microzed.dts
@@ -71,7 +71,7 @@
 		conf {
 			groups = "usb0_0_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-rx {
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index cf70aff26c66..cf1e1cc3d132 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -206,7 +206,7 @@
 		conf {
 			groups = "can0_9_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-rx {
@@ -229,7 +229,7 @@
 		conf {
 			groups = "ethernet0_0_grp";
 			slew-rate = <0>;
-			io-standard = <4>;
+			power-source = <4>;
 		};
 
 		conf-rx {
@@ -252,7 +252,7 @@
 		conf-mdio {
 			groups = "mdio0_0_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 			bias-disable;
 		};
 	};
@@ -270,7 +270,7 @@
 				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
 				 "gpio0_13_grp", "gpio0_14_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-pull-up {
@@ -294,7 +294,7 @@
 			groups = "i2c0_10_grp";
 			bias-pull-up;
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 	};
 
@@ -307,7 +307,7 @@
 		conf {
 			groups = "sdio0_2_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 			bias-disable;
 		};
 
@@ -321,7 +321,7 @@
 			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		mux-wp {
@@ -334,7 +334,7 @@
 			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 	};
 
@@ -347,7 +347,7 @@
 		conf {
 			groups = "uart1_10_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-rx {
@@ -370,7 +370,7 @@
 		conf {
 			groups = "usb0_0_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-rx {
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 77943c16d33f..d21e3ae4ebb2 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -150,7 +150,7 @@
 		conf {
 			groups = "ethernet0_0_grp";
 			slew-rate = <0>;
-			io-standard = <4>;
+			power-source = <4>;
 		};
 
 		conf-rx {
@@ -173,7 +173,7 @@
 		conf-mdio {
 			groups = "mdio0_0_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 			bias-disable;
 		};
 	};
@@ -187,7 +187,7 @@
 		conf {
 			groups = "gpio0_7_grp", "gpio0_46_grp", "gpio0_47_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-pull-up {
@@ -211,7 +211,7 @@
 			groups = "i2c0_10_grp";
 			bias-pull-up;
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 	};
 
@@ -224,7 +224,7 @@
 		conf {
 			groups = "sdio0_2_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 			bias-disable;
 		};
 
@@ -238,7 +238,7 @@
 			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		mux-wp {
@@ -251,7 +251,7 @@
 			bias-high-impedance;
 			bias-pull-up;
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 	};
 
@@ -264,7 +264,7 @@
 		conf {
 			groups = "uart1_10_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-rx {
@@ -287,7 +287,7 @@
 		conf {
 			groups = "usb0_0_grp";
 			slew-rate = <0>;
-			io-standard = <1>;
+			power-source = <1>;
 		};
 
 		conf-rx {
-- 
2.17.1

