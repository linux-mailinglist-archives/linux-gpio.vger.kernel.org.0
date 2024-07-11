Return-Path: <linux-gpio+bounces-8178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD492E4D3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 12:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2A8285172
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 10:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F991527A1;
	Thu, 11 Jul 2024 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cH8vFEu/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EFA158DA7;
	Thu, 11 Jul 2024 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694015; cv=fail; b=cn22Oe9duE/yE7BnNcaVgPFmCOAH/sYXKfqjWXJ+Ile6037wROMGooBZJBx+rxJtQC+s9tGvkXvbYPQpvEML7kGMQTRs9yZd+sWJsS3aFwhYrJIY/inxYF7/qsYIh2cEAt/8kbui3v3RzmWae3X25CR2Ev3Wo9tzKjJtdrcOr1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694015; c=relaxed/simple;
	bh=mTsv8dsMDPVkopOiVLD0UuBrNA3yg7waF7su465kIw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oW61FvIuBoHY/tPZcsHEdei7eck6W1ZcSqSIgNIlwNT3PoA4e7KjnJnw2OqGKqU2FNDpm13/HqNma7p9O1ltw3q44uGROyuAw/KXw9CL7Acgi2jnamcEMDBxDAd7zmsstuvL8h89fkEcr/dCdyqIWrstKAbjgIx+b8+fy09Xi7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cH8vFEu/; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKnA6R2IkwgVU3db5Esk0k8/RnLwU0FA2CotqTis74RxqVT/mqkKQ2ldDhVVZjrJpogv4GdyYG0WN1pqN2mCuIgRyzA7DnToKnzILpLWUYhiHfiRksohqNVw4xvmTDzwGf2eUrbCOIyq42AwGultGNchEWdOgVgDZZ4LDn50Q5k3x8Pz9qxyBtNizBjG8CfHgNvbQZazOp8hDZq3kQQWcdlJJd3/ceFV1Je6G+w1Zx9ABAYzKtRnUr+mLtZPi8Q6+QifIDBEwjvRIrtcJvrflXUyqw3a+hEgbp0mcS6TGC1DGBjRzp4aP8IFtwuPKpW9cgkJ/TiRBTIRHzl2SU2X8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hBf6u0FXNVDwPHgCQOHFMYhzC3f9/b+19rnlTYZLlw=;
 b=zE3bssttcvnfRoPVT9Zqo1lNlQH2ZUGDM3HuVrZpExpwoZVD57LUkUOO7nAx9DiyVZdSJMnYeOPCP9OZzUjWps42eEsL0bkKzq3yfMv6Z4RK0fWNWEzN+nJE4VwutdWo4zwY+WY/iPsFMqS8KOHgew1+1N4nKxIswzgYeAsCRuAig104mgvTticmYza1aYnxeOdn7U83BfU2W/NuLN8/gw5BuL1/cTCksGfx+8pjyR2FzvmdoUI+xU+OyyQ+mixpY4Tqy5H1vAAa6KLHa6G3n6lJAGMkuHvjt7N12bihxY8/pYzcGjcnDIEc2bkN94ICnMCjggipt0flZreOmACIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hBf6u0FXNVDwPHgCQOHFMYhzC3f9/b+19rnlTYZLlw=;
 b=cH8vFEu/x/qmd6PssCwNfvOAlW8YLyxrRBBeI+t2dMRx506puNZ5m+Cpn/2npfh1gGwfFoOgQGEvzDnZmE0wAKAhxbLP45xc9u2dxxIWnKaAMpSmtBO5zxGzBpSPuXkRQQRLzq8qNfJSspDj+S9cfOubiG5pW38E80O1BVOBZh8=
Received: from MW4PR04CA0162.namprd04.prod.outlook.com (2603:10b6:303:85::17)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 10:33:29 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::c1) by MW4PR04CA0162.outlook.office365.com
 (2603:10b6:303:85::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Thu, 11 Jul 2024 10:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 10:33:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 05:33:27 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 11 Jul 2024 05:33:23 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Jay
 Buddhabhatti" <jay.buddhabhatti@amd.com>, Dhaval Shah
	<dhaval.r.shah@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: Add support for Xilinx Versal platform
Date: Thu, 11 Jul 2024 16:03:15 +0530
Message-ID: <20240711103317.891813-2-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
References: <20240711103317.891813-1-sai.krishna.potthuri@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: sai.krishna.potthuri@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c71441f-ea9f-4131-36f4-08dca194e7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1bI/HwZPrwAreiAPEwNq69g8s4YbgExNXnuL5hZLsg9S/2cObmbIQI25DQsI?=
 =?us-ascii?Q?jZJyzS3Zgr4qfEA4CZmEor61n8rE2d9PnjLCvthPn51/TS3H81A/xnLiz8rl?=
 =?us-ascii?Q?Ec/DbSmY7OPlCkjSuoG/Iq44bl187CvV6cBEMBA09WQzo98HPpKaz4iink99?=
 =?us-ascii?Q?r6mJ7QoLp6eoTOjQMfhFfPY8saorQo5+RSVnhHDTReUJs60lAngDrd2kz7K+?=
 =?us-ascii?Q?r14++PlwE2CwcnXGfhFc3WXZfa279OCKdeWaHCrBO92/YlqajOuNWqkBH8lF?=
 =?us-ascii?Q?D0iEbOObbxmU+NMnGJV0vCrMppYqi/QIq+syONkXO8nfZjDyK6eI56UH0FNy?=
 =?us-ascii?Q?IPzTJIfFT7molfC+1WJn7PKo27Zz/zn8SKbJaA/gZOAb2rjUpHHOZaoYu/wN?=
 =?us-ascii?Q?hXc6PyHTnHzx039McKRUFa/IkuJoM5Ere1fSfrPuxwXya2llOut0QC4vLTI1?=
 =?us-ascii?Q?DdeMjhhSNYSTBVMbllvtRAaPPyel9cnlCNTHxGOGZz73z8+9ht2Sp7Z2rIlE?=
 =?us-ascii?Q?jk0XO6g6f0DuE2vlk6CCxveUjAtu/6Z76uwHYuNx/xo03b+UPA1N7fwlo+qp?=
 =?us-ascii?Q?Iiq3lbgPUk9vEEtBeP2CP/aCDTE1Ty87vbTOImMsx8/37q8ZxkOzYbh24YNp?=
 =?us-ascii?Q?15iyClPmdZSoCTHk+c9CV9zjOLqGqjkFS4kNJk5slPBa5c3SrdSuNG+b+V1T?=
 =?us-ascii?Q?7mkwSlGQzki8VSQ87TZFKCjDwoBPHl9oF0e20XBYFtDn6iBHCDTaHC8f7KJi?=
 =?us-ascii?Q?mSfYg9VB787x6NtVPWPhayl1yCQtmas+sKk1WbZ//1GdjBCFwVNNU2raGan+?=
 =?us-ascii?Q?Y2JNiyOFmeUjibwEZ0cvbciUm6p9gOXqYXBnuLY8UYRVqsCe0SGz4gN2z5CB?=
 =?us-ascii?Q?0WwbqoNBX2jxY7QiOz6k0LdTO9ou7Np5uxOKxfagv2aOiu33SI5rn4BLFUxa?=
 =?us-ascii?Q?EhSRjvjcAvAwcuiiOPj1t61/uyWFnDKKSI4vI3HAk+EmmTUd6qPE5i1uh6Xi?=
 =?us-ascii?Q?7HJ7+yf+5MjkfdO70JS5yO24Kc3ype5lfntP47184fl/QR07F1Zk/v5V8iaw?=
 =?us-ascii?Q?0Blcoblyg40BYBQqg8JgQL4bnfHYE/9of+uMxyEJym/7oe11jlrzz7z4muAJ?=
 =?us-ascii?Q?hU5pgXdApSVdOOu8GtgwQRJ4QTuvYOIVZ3dzEVAkkCtXf+8S5rWuq5W01gaI?=
 =?us-ascii?Q?4KUvtzvZNP/JtBikKwJkHChn6i79vmc8Z+AKEDG+u5BN24kQMtRpC9UjMNk9?=
 =?us-ascii?Q?1K6C7F1QwN8hUBc/58cN95TX5LPBo/pVB07YwJ4F6Gin2QqC/z0r1k83A0/w?=
 =?us-ascii?Q?JiJdI3H3Oijapf3q1lexD5HaFU0nbKvg8R5VOz7Gvp2RqsLYkyzcKdTIq6Jb?=
 =?us-ascii?Q?1NDOdPGWURp/QO2lUNl0Wdwsd6y7nVQx/JmlM0G8a/M2AwlC8rTVqYl09UBL?=
 =?us-ascii?Q?E/niGpw3rX0+jsCTY7WhVxz9F84EICic?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 10:33:29.0420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c71441f-ea9f-4131-36f4-08dca194e7a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712

Add Xilinx Versal compatible string and corresponding groups, function and
pins properties to support pin controller features on Versal platform.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 509 +++++++++++-------
 1 file changed, 329 insertions(+), 180 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
index ce66fd15ff9c..68c378b17f49 100644
--- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
@@ -28,7 +28,9 @@ description: |
 
 properties:
   compatible:
-    const: xlnx,zynqmp-pinctrl
+    enum:
+      - xlnx,zynqmp-pinctrl
+      - xlnx,versal-pinctrl
 
 patternProperties:
   '^(.*-)?(default|gpio-grp)$':
@@ -46,196 +48,334 @@ patternProperties:
             description:
               List of pins to select (either this or "groups" must be specified)
             items:
-              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+              allOf:
+                - if:
+                    properties:
+                      compatible:
+                        contains:
+                          const: xlnx,zynqmp-pinctrl
+                  then:
+                    pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+                  else:
+                    pattern: '^((LPD|PMC)_)?MIO([0-9]|[1-6][0-9]|7[0-7])$'
 
           groups:
             description:
               List of groups to select (either this or "pins" must be
               specified), available groups for this subnode.
             items:
-              anyOf:
-                - pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
-                - enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
-                         ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
-                         gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
-                         mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
-                         qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
-                         spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
-                         spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
-                         spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
-                         spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
-                         spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
-                         spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
-                         spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
-                         spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
-                         spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
-                         spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
-                         spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
-                         spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
-                         spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
-                         spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
-                         spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
-                         spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
-                         sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
-                         sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
-                         sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
-                         sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
-                         sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
-                         sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
-                         sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
-                         sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
-                         sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
-                         sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
-                         sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
-                         sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
-                         sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
-                         sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
-                         sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
-                         sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
-                         sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
-                         sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
-                         sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
-                         sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
-                         sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
-                         sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
-                         nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
-                         nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
-                         can0_1_grp, can0_2_grp, can0_3_grp,
-                         can0_4_grp, can0_5_grp, can0_6_grp,
-                         can0_7_grp, can0_8_grp, can0_9_grp,
-                         can0_10_grp, can0_11_grp, can0_12_grp,
-                         can0_13_grp, can0_14_grp, can0_15_grp,
-                         can0_16_grp, can0_17_grp, can0_18_grp,
-                         can1_0_grp, can1_1_grp, can1_2_grp,
-                         can1_3_grp, can1_4_grp, can1_5_grp,
-                         can1_6_grp, can1_7_grp, can1_8_grp,
-                         can1_9_grp, can1_10_grp, can1_11_grp,
-                         can1_12_grp, can1_13_grp, can1_14_grp,
-                         can1_15_grp, can1_16_grp, can1_17_grp,
-                         can1_18_grp, can1_19_grp, uart0_0_grp,
-                         uart0_1_grp, uart0_2_grp, uart0_3_grp,
-                         uart0_4_grp, uart0_5_grp, uart0_6_grp,
-                         uart0_7_grp, uart0_8_grp, uart0_9_grp,
-                         uart0_10_grp, uart0_11_grp, uart0_12_grp,
-                         uart0_13_grp, uart0_14_grp, uart0_15_grp,
-                         uart0_16_grp, uart0_17_grp, uart0_18_grp,
-                         uart1_0_grp, uart1_1_grp, uart1_2_grp,
-                         uart1_3_grp, uart1_4_grp, uart1_5_grp,
-                         uart1_6_grp, uart1_7_grp, uart1_8_grp,
-                         uart1_9_grp, uart1_10_grp, uart1_11_grp,
-                         uart1_12_grp, uart1_13_grp, uart1_14_grp,
-                         uart1_15_grp, uart1_16_grp, uart1_17_grp,
-                         uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
-                         i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
-                         i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
-                         i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
-                         i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
-                         i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
-                         i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
-                         i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
-                         i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
-                         i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
-                         i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
-                         i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
-                         i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
-                         i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
-                         ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
-                         ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
-                         ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
-                         ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
-                         ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
-                         ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
-                         ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
-                         ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
-                         ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
-                         ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
-                         ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
-                         ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
-                         ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
-                         ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
-                         ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
-                         ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
-                         ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
-                         ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
-                         ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
-                         ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
-                         ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
-                         ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
-                         ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
-                         ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
-                         swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
-                         swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
-                         swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
-                         swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
-                         swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
-                         swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
-                         swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
-                         swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
-                         swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
-                         swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
-                         swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
-                         swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
-                         swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
-                         swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
-                         swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
-                         swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
-                         swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
-                         gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
-                         gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
-                         gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
-                         gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
-                         gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
-                         gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
-                         gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
-                         gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
-                         gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
-                         gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
-                         gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
-                         gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
-                         gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
-                         gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
-                         gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
-                         gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
-                         gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
-                         gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
-                         gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
-                         gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
-                         gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
-                         gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
-                         gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
-                         gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
-                         gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
-                         gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
-                         usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
-                         pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
-                         pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
-                         pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
-                         pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
-                         pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
-                         pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
-                         csu0_0_grp, csu0_1_grp, csu0_2_grp,
-                         csu0_3_grp, csu0_4_grp, csu0_5_grp,
-                         csu0_6_grp, csu0_7_grp, csu0_8_grp,
-                         csu0_9_grp, csu0_10_grp, csu0_11_grp,
-                         dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
-                         dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
-                         pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
-                         pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
-                         trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
-                         trace0_clk_2_grp, testscan0_0_grp]
+              allOf:
+                - if:
+                    properties:
+                      compatible:
+                        contains:
+                          const: xlnx,zynqmp-pinctrl
+                  then:
+                    anyOf:
+                      - pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+                      - enum: [ethernet0_0_grp, ethernet1_0_grp, ethernet2_0_grp,
+                               ethernet3_0_grp, gemtsu0_0_grp, gemtsu0_1_grp,
+                               gemtsu0_2_grp, mdio0_0_grp, mdio1_0_grp,
+                               mdio1_1_grp, mdio2_0_grp, mdio3_0_grp,
+                               qspi0_0_grp, qspi_ss_0_grp, qspi_fbclk_0_grp,
+                               spi0_0_grp, spi0_ss_0_grp, spi0_ss_1_grp,
+                               spi0_ss_2_grp, spi0_1_grp, spi0_ss_3_grp,
+                               spi0_ss_4_grp, spi0_ss_5_grp, spi0_2_grp,
+                               spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp,
+                               spi0_3_grp, spi0_ss_9_grp, spi0_ss_10_grp,
+                               spi0_ss_11_grp, spi0_4_grp, spi0_ss_12_grp,
+                               spi0_ss_13_grp, spi0_ss_14_grp, spi0_5_grp,
+                               spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp,
+                               spi1_0_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                               spi1_ss_2_grp, spi1_1_grp, spi1_ss_3_grp,
+                               spi1_ss_4_grp, spi1_ss_5_grp, spi1_2_grp,
+                               spi1_ss_6_grp, spi1_ss_7_grp, spi1_ss_8_grp,
+                               spi1_3_grp, spi1_ss_9_grp, spi1_ss_10_grp,
+                               spi1_ss_11_grp, spi1_4_grp, spi1_ss_12_grp,
+                               spi1_ss_13_grp, spi1_ss_14_grp, spi1_5_grp,
+                               spi1_ss_15_grp, spi1_ss_16_grp, spi1_ss_17_grp,
+                               sdio0_0_grp, sdio0_1_grp, sdio0_2_grp,
+                               sdio0_3_grp, sdio0_4_grp, sdio0_5_grp,
+                               sdio0_6_grp, sdio0_7_grp, sdio0_8_grp,
+                               sdio0_9_grp, sdio0_10_grp, sdio0_11_grp,
+                               sdio0_12_grp, sdio0_13_grp, sdio0_14_grp,
+                               sdio0_15_grp, sdio0_16_grp, sdio0_17_grp,
+                               sdio0_18_grp, sdio0_19_grp, sdio0_20_grp,
+                               sdio0_21_grp, sdio0_22_grp, sdio0_23_grp,
+                               sdio0_24_grp, sdio0_25_grp, sdio0_26_grp,
+                               sdio0_27_grp, sdio0_28_grp, sdio0_29_grp,
+                               sdio0_30_grp, sdio0_31_grp, sdio0_32_grp,
+                               sdio0_pc_0_grp, sdio0_cd_0_grp, sdio0_wp_0_grp,
+                               sdio0_pc_1_grp, sdio0_cd_1_grp, sdio0_wp_1_grp,
+                               sdio0_pc_2_grp, sdio0_cd_2_grp, sdio0_wp_2_grp,
+                               sdio1_0_grp, sdio1_1_grp, sdio1_2_grp,
+                               sdio1_3_grp, sdio1_4_grp, sdio1_5_grp,
+                               sdio1_6_grp, sdio1_7_grp, sdio1_8_grp,
+                               sdio1_9_grp, sdio1_10_grp, sdio1_11_grp,
+                               sdio1_12_grp, sdio1_13_grp, sdio1_14_grp,
+                               sdio1_15_grp, sdio1_pc_0_grp, sdio1_cd_0_grp,
+                               sdio1_wp_0_grp, sdio1_pc_1_grp, sdio1_cd_1_grp,
+                               sdio1_wp_1_grp, nand0_0_grp, nand0_ce_0_grp,
+                               nand0_rb_0_grp, nand0_dqs_0_grp, nand0_ce_1_grp,
+                               nand0_rb_1_grp, nand0_dqs_1_grp, can0_0_grp,
+                               can0_1_grp, can0_2_grp, can0_3_grp,
+                               can0_4_grp, can0_5_grp, can0_6_grp,
+                               can0_7_grp, can0_8_grp, can0_9_grp,
+                               can0_10_grp, can0_11_grp, can0_12_grp,
+                               can0_13_grp, can0_14_grp, can0_15_grp,
+                               can0_16_grp, can0_17_grp, can0_18_grp,
+                               can1_0_grp, can1_1_grp, can1_2_grp,
+                               can1_3_grp, can1_4_grp, can1_5_grp,
+                               can1_6_grp, can1_7_grp, can1_8_grp,
+                               can1_9_grp, can1_10_grp, can1_11_grp,
+                               can1_12_grp, can1_13_grp, can1_14_grp,
+                               can1_15_grp, can1_16_grp, can1_17_grp,
+                               can1_18_grp, can1_19_grp, uart0_0_grp,
+                               uart0_1_grp, uart0_2_grp, uart0_3_grp,
+                               uart0_4_grp, uart0_5_grp, uart0_6_grp,
+                               uart0_7_grp, uart0_8_grp, uart0_9_grp,
+                               uart0_10_grp, uart0_11_grp, uart0_12_grp,
+                               uart0_13_grp, uart0_14_grp, uart0_15_grp,
+                               uart0_16_grp, uart0_17_grp, uart0_18_grp,
+                               uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                               uart1_3_grp, uart1_4_grp, uart1_5_grp,
+                               uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                               uart1_9_grp, uart1_10_grp, uart1_11_grp,
+                               uart1_12_grp, uart1_13_grp, uart1_14_grp,
+                               uart1_15_grp, uart1_16_grp, uart1_17_grp,
+                               uart1_18_grp, i2c0_0_grp, i2c0_1_grp,
+                               i2c0_2_grp, i2c0_3_grp, i2c0_4_grp,
+                               i2c0_5_grp, i2c0_6_grp, i2c0_7_grp,
+                               i2c0_8_grp, i2c0_9_grp, i2c0_10_grp,
+                               i2c0_11_grp, i2c0_12_grp, i2c0_13_grp,
+                               i2c0_14_grp, i2c0_15_grp, i2c0_16_grp,
+                               i2c0_17_grp, i2c0_18_grp, i2c1_0_grp,
+                               i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                               i2c1_4_grp, i2c1_5_grp, i2c1_6_grp,
+                               i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                               i2c1_10_grp, i2c1_11_grp, i2c1_12_grp,
+                               i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                               i2c1_16_grp, i2c1_17_grp, i2c1_18_grp,
+                               i2c1_19_grp, ttc0_clk_0_grp, ttc0_wav_0_grp,
+                               ttc0_clk_1_grp, ttc0_wav_1_grp, ttc0_clk_2_grp,
+                               ttc0_wav_2_grp, ttc0_clk_3_grp, ttc0_wav_3_grp,
+                               ttc0_clk_4_grp, ttc0_wav_4_grp, ttc0_clk_5_grp,
+                               ttc0_wav_5_grp, ttc0_clk_6_grp, ttc0_wav_6_grp,
+                               ttc0_clk_7_grp, ttc0_wav_7_grp, ttc0_clk_8_grp,
+                               ttc0_wav_8_grp, ttc1_clk_0_grp, ttc1_wav_0_grp,
+                               ttc1_clk_1_grp, ttc1_wav_1_grp, ttc1_clk_2_grp,
+                               ttc1_wav_2_grp, ttc1_clk_3_grp, ttc1_wav_3_grp,
+                               ttc1_clk_4_grp, ttc1_wav_4_grp, ttc1_clk_5_grp,
+                               ttc1_wav_5_grp, ttc1_clk_6_grp, ttc1_wav_6_grp,
+                               ttc1_clk_7_grp, ttc1_wav_7_grp, ttc1_clk_8_grp,
+                               ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_wav_0_grp,
+                               ttc2_clk_1_grp, ttc2_wav_1_grp, ttc2_clk_2_grp,
+                               ttc2_wav_2_grp, ttc2_clk_3_grp, ttc2_wav_3_grp,
+                               ttc2_clk_4_grp, ttc2_wav_4_grp, ttc2_clk_5_grp,
+                               ttc2_wav_5_grp, ttc2_clk_6_grp, ttc2_wav_6_grp,
+                               ttc2_clk_7_grp, ttc2_wav_7_grp, ttc2_clk_8_grp,
+                               ttc2_wav_8_grp, ttc3_clk_0_grp, ttc3_wav_0_grp,
+                               ttc3_clk_1_grp, ttc3_wav_1_grp, ttc3_clk_2_grp,
+                               ttc3_wav_2_grp, ttc3_clk_3_grp, ttc3_wav_3_grp,
+                               ttc3_clk_4_grp, ttc3_wav_4_grp, ttc3_clk_5_grp,
+                               ttc3_wav_5_grp, ttc3_clk_6_grp, ttc3_wav_6_grp,
+                               ttc3_clk_7_grp, ttc3_wav_7_grp, ttc3_clk_8_grp,
+                               ttc3_wav_8_grp, swdt0_clk_0_grp, swdt0_rst_0_grp,
+                               swdt0_clk_1_grp, swdt0_rst_1_grp, swdt0_clk_2_grp,
+                               swdt0_rst_2_grp, swdt0_clk_3_grp, swdt0_rst_3_grp,
+                               swdt0_clk_4_grp, swdt0_rst_4_grp, swdt0_clk_5_grp,
+                               swdt0_rst_5_grp, swdt0_clk_6_grp, swdt0_rst_6_grp,
+                               swdt0_clk_7_grp, swdt0_rst_7_grp, swdt0_clk_8_grp,
+                               swdt0_rst_8_grp, swdt0_clk_9_grp, swdt0_rst_9_grp,
+                               swdt0_clk_10_grp, swdt0_rst_10_grp, swdt0_clk_11_grp,
+                               swdt0_rst_11_grp, swdt0_clk_12_grp, swdt0_rst_12_grp,
+                               swdt1_clk_0_grp, swdt1_rst_0_grp, swdt1_clk_1_grp,
+                               swdt1_rst_1_grp, swdt1_clk_2_grp, swdt1_rst_2_grp,
+                               swdt1_clk_3_grp, swdt1_rst_3_grp, swdt1_clk_4_grp,
+                               swdt1_rst_4_grp, swdt1_clk_5_grp, swdt1_rst_5_grp,
+                               swdt1_clk_6_grp, swdt1_rst_6_grp, swdt1_clk_7_grp,
+                               swdt1_rst_7_grp, swdt1_clk_8_grp, swdt1_rst_8_grp,
+                               swdt1_clk_9_grp, swdt1_rst_9_grp, swdt1_clk_10_grp,
+                               swdt1_rst_10_grp, swdt1_clk_11_grp, swdt1_rst_11_grp,
+                               swdt1_clk_12_grp, swdt1_rst_12_grp, gpio0_0_grp,
+                               gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                               gpio0_4_grp, gpio0_5_grp, gpio0_6_grp,
+                               gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                               gpio0_10_grp, gpio0_11_grp, gpio0_12_grp,
+                               gpio0_13_grp, gpio0_14_grp, gpio0_15_grp,
+                               gpio0_16_grp, gpio0_17_grp, gpio0_18_grp,
+                               gpio0_19_grp, gpio0_20_grp, gpio0_21_grp,
+                               gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                               gpio0_25_grp, gpio0_26_grp, gpio0_27_grp,
+                               gpio0_28_grp, gpio0_29_grp, gpio0_30_grp,
+                               gpio0_31_grp, gpio0_32_grp, gpio0_33_grp,
+                               gpio0_34_grp, gpio0_35_grp, gpio0_36_grp,
+                               gpio0_37_grp, gpio0_38_grp, gpio0_39_grp,
+                               gpio0_40_grp, gpio0_41_grp, gpio0_42_grp,
+                               gpio0_43_grp, gpio0_44_grp, gpio0_45_grp,
+                               gpio0_46_grp, gpio0_47_grp, gpio0_48_grp,
+                               gpio0_49_grp, gpio0_50_grp, gpio0_51_grp,
+                               gpio0_52_grp, gpio0_53_grp, gpio0_54_grp,
+                               gpio0_55_grp, gpio0_56_grp, gpio0_57_grp,
+                               gpio0_58_grp, gpio0_59_grp, gpio0_60_grp,
+                               gpio0_61_grp, gpio0_62_grp, gpio0_63_grp,
+                               gpio0_64_grp, gpio0_65_grp, gpio0_66_grp,
+                               gpio0_67_grp, gpio0_68_grp, gpio0_69_grp,
+                               gpio0_70_grp, gpio0_71_grp, gpio0_72_grp,
+                               gpio0_73_grp, gpio0_74_grp, gpio0_75_grp,
+                               gpio0_76_grp, gpio0_77_grp, usb0_0_grp,
+                               usb1_0_grp, pmu0_0_grp, pmu0_1_grp,
+                               pmu0_2_grp, pmu0_3_grp, pmu0_4_grp,
+                               pmu0_5_grp, pmu0_6_grp, pmu0_7_grp,
+                               pmu0_8_grp, pmu0_9_grp, pmu0_10_grp,
+                               pmu0_11_grp, pcie0_0_grp, pcie0_1_grp,
+                               pcie0_2_grp, pcie0_3_grp, pcie0_4_grp,
+                               pcie0_5_grp, pcie0_6_grp, pcie0_7_grp,
+                               csu0_0_grp, csu0_1_grp, csu0_2_grp,
+                               csu0_3_grp, csu0_4_grp, csu0_5_grp,
+                               csu0_6_grp, csu0_7_grp, csu0_8_grp,
+                               csu0_9_grp, csu0_10_grp, csu0_11_grp,
+                               dpaux0_0_grp, dpaux0_1_grp, dpaux0_2_grp,
+                               dpaux0_3_grp, pjtag0_0_grp, pjtag0_1_grp,
+                               pjtag0_2_grp, pjtag0_3_grp, pjtag0_4_grp,
+                               pjtag0_5_grp, trace0_0_grp, trace0_clk_0_grp,
+                               trace0_1_grp, trace0_clk_1_grp, trace0_2_grp,
+                               trace0_clk_2_grp, testscan0_0_grp]
+                  else:
+                    anyOf:
+                      - pattern: '^((LPD|PMC)_)?MIO([0-9]|[1-6][0-9]|7[0-7])$'
+                      - enum: [spi0_0_grp, spi0_1_grp, spi0_2_grp, spi0_3_grp, spi0_4_grp, spi0_5_grp,
+                               spi0_ss_0_grp, spi0_ss_1_grp, spi0_ss_2_grp, spi0_ss_3_grp, spi0_ss_4_grp,
+                               spi0_ss_5_grp, spi0_ss_6_grp, spi0_ss_7_grp, spi0_ss_8_grp, spi0_ss_9_grp,
+                               spi0_ss_10_grp, spi0_ss_11_grp, spi0_ss_12_grp, spi0_ss_13_grp, spi0_ss_14_grp,
+                               spi0_ss_15_grp, spi0_ss_16_grp, spi0_ss_17_grp, spi1_0_grp, spi1_1_grp,
+                               spi1_2_grp, spi1_3_grp, spi1_4_grp, spi1_5_grp, spi1_ss_0_grp, spi1_ss_1_grp,
+                               spi1_ss_2_grp, spi1_ss_3_grp, spi1_ss_4_grp, spi1_ss_5_grp, spi1_ss_6_grp,
+                               spi1_ss_7_grp, spi1_ss_8_grp, spi1_ss_9_grp, spi1_ss_10_grp, spi1_ss_11_grp,
+                               spi1_ss_12_grp, spi1_ss_13_grp, spi1_ss_14_grp, spi1_ss_15_grp, spi1_ss_16_grp
+                               spi1_ss_17_grp, can0_0_grp, can0_1_grp, can0_2_grp, can0_3_grp, can0_4_grp,
+                               can0_5_grp, can0_6_grp, can0_7_grp, can0_8_grp, can0_9_grp, can0_10_grp,
+                               can0_11_grp, can0_12_grp, can0_13_grp, can0_14_grp, can0_15_grp, can0_16_grp,
+                               can0_17_grp, can1_0_grp, can1_1_grp, can1_2_grp, can1_3_grp, can1_4_grp,
+                               can1_5_grp, can1_6_grp, can1_7_grp, can1_8_grp, can1_9_grp, can1_10_grp,
+                               can1_11_grp, can1_12_grp, can1_13_grp, can1_14_grp, can1_15_grp, can1_16_grp,
+                               can1_17_grp, can1_18_grp, i2c0_0_grp, i2c0_1_grp, i2c0_2_grp, i2c0_3_grp,
+                               i2c0_4_grp, i2c0_5_grp, i2c0_6_grp, i2c0_7_grp, i2c0_8_grp, i2c0_9_grp,
+                               i2c0_10_grp, i2c0_11_grp, i2c0_12_grp, i2c0_13_grp, i2c0_14_grp, i2c0_15_grp,
+                               i2c0_16_grp, i2c0_17_grp, i2c1_0_grp, i2c1_1_grp, i2c1_2_grp, i2c1_3_grp,
+                               i2c1_4_grp, i2c1_5_grp, i2c1_6_grp, i2c1_7_grp, i2c1_8_grp, i2c1_9_grp,
+                               i2c1_10_grp, i2c1_11_grp, i2c1_12_grp, i2c1_13_grp, i2c1_14_grp, i2c1_15_grp,
+                               i2c1_16_grp, i2c1_17_grp, i2c1_18_grp, i2c_pmc_0_grp, i2c_pmc_1_grp,
+                               i2c_pmc_2_grp, i2c_pmc_3_grp, i2c_pmc_4_grp, i2c_pmc_5_grp, i2c_pmc_6_grp,
+                               i2c_pmc_7_grp, i2c_pmc_8_grp, i2c_pmc_9_grp, i2c_pmc_10_grp, i2c_pmc_11_grp,
+                               i2c_pmc_12_grp, ttc0_clk_0_grp, ttc0_clk_1_grp, ttc0_clk_2_grp, ttc0_clk_3_grp,
+                               ttc0_clk_4_grp, ttc0_clk_5_grp, ttc0_clk_6_grp, ttc0_clk_7_grp, ttc0_clk_8_grp,
+                               ttc0_wav_0_grp, ttc0_wav_1_grp, ttc0_wav_2_grp, ttc0_wav_3_grp, ttc0_wav_4_grp,
+                               ttc0_wav_5_grp, ttc0_wav_6_grp, ttc0_wav_7_grp, ttc0_wav_8_grp, ttc1_clk_0_grp,
+                               ttc1_clk_1_grp, ttc1_clk_2_grp, ttc1_clk_3_grp, ttc1_clk_4_grp, ttc1_clk_5_grp,
+                               ttc1_clk_6_grp, ttc1_clk_7_grp, ttc1_clk_8_grp, ttc1_wav_0_grp, ttc1_wav_1_grp,
+                               ttc1_wav_2_grp, ttc1_wav_3_grp, ttc1_wav_4_grp, ttc1_wav_5_grp, ttc1_wav_6_grp,
+                               ttc1_wav_7_grp, ttc1_wav_8_grp, ttc2_clk_0_grp, ttc2_clk_1_grp, ttc2_clk_2_grp,
+                               ttc2_clk_3_grp, ttc2_clk_4_grp, ttc2_clk_5_grp, ttc2_clk_6_grp, ttc2_clk_7_grp,
+                               ttc2_clk_8_grp, ttc2_wav_0_grp, ttc2_wav_1_grp, ttc2_wav_2_grp, ttc2_wav_3_grp,
+                               ttc2_wav_4_grp, ttc2_wav_5_grp, ttc2_wav_6_grp, ttc2_wav_7_grp, ttc2_wav_8_grp,
+                               ttc3_clk_0_grp, ttc3_clk_1_grp, ttc3_clk_2_grp, ttc3_clk_3_grp, ttc3_clk_4_grp,
+                               ttc3_clk_5_grp, ttc3_clk_6_grp, ttc3_clk_7_grp, ttc3_clk_8_grp, ttc3_wav_0_grp,
+                               ttc3_wav_1_grp, ttc3_wav_2_grp, ttc3_wav_3_grp, ttc3_wav_4_grp, ttc3_wav_5_grp,
+                               ttc3_wav_6_grp, ttc3_wav_7_grp, ttc3_wav_8_grp, wwdt0_0_grp, wwdt0_1_grp,
+                               wwdt0_2_grp, wwdt0_3_grp, wwdt0_4_grp, wwdt0_5_grp, wwdt1_0_grp, wwdt1_1_grp,
+                               wwdt1_2_grp, wwdt1_3_grp, wwdt1_4_grp, wwdt1_5_grp, sysmon_i2c0_0_grp,
+                               sysmon_i2c0_1_grp, sysmon_i2c0_2_grp, sysmon_i2c0_3_grp, sysmon_i2c0_4_grp,
+                               sysmon_i2c0_5_grp, sysmon_i2c0_6_grp, sysmon_i2c0_7_grp, sysmon_i2c0_8_grp,
+                               sysmon_i2c0_9_grp, sysmon_i2c0_10_grp, sysmon_i2c0_11_grp, sysmon_i2c0_12_grp,
+                               sysmon_i2c0_13_grp, sysmon_i2c0_14_grp, sysmon_i2c0_15_grp,
+                               sysmon_i2c0_16_grp, sysmon_i2c0_17_grp, sysmon_i2c0_alrt_0_grp,
+                               sysmon_i2c0_alrt_1_grp, sysmon_i2c0_alrt_2_grp, sysmon_i2c0_alrt_3_grp,
+                               sysmon_i2c0_alrt_4_grp, sysmon_i2c0_alrt_5_grp, sysmon_i2c0_alrt_6_grp,
+                               sysmon_i2c0_alrt_7_grp, sysmon_i2c0_alrt_8_grp, sysmon_i2c0_alrt_9_grp,
+                               sysmon_i2c0_alrt_10_grp, sysmon_i2c0_alrt_11_grp, sysmon_i2c0_alrt_12_grp,
+                               sysmon_i2c0_alrt_13_grp, sysmon_i2c0_alrt_14_grp, sysmon_i2c0_alrt_15_grp,
+                               sysmon_i2c0_alrt_16_grp, sysmon_i2c0_alrt_17_grp, uart0_0_grp, uart0_1_grp,
+                               uart0_2_grp, uart0_3_grp, uart0_4_grp, uart0_5_grp, uart0_6_grp, uart0_7_grp,
+                               uart0_8_grp, uart0_ctrl_0_grp, uart0_ctrl_1_grp, uart0_ctrl_2_grp,
+                               uart0_ctrl_3_grp, uart0_ctrl_4_grp, uart0_ctrl_5_grp, uart0_ctrl_6_grp,
+                               uart0_ctrl_7_grp, uart0_ctrl_8_grp, uart1_0_grp, uart1_1_grp, uart1_2_grp,
+                               uart1_3_grp, uart1_4_grp, uart1_5_grp, uart1_6_grp, uart1_7_grp, uart1_8_grp,
+                               uart1_ctrl_0_grp, uart1_ctrl_1_grp, uart1_ctrl_2_grp, uart1_ctrl_3_grp,
+                               uart1_ctrl_4_grp, uart1_ctrl_5_grp, uart1_ctrl_6_grp, uart1_ctrl_7_grp,
+                               uart1_ctrl_8_grp, gpio0_0_grp, gpio0_1_grp, gpio0_2_grp, gpio0_3_grp,
+                               gpio0_4_grp, gpio0_5_grp, gpio0_6_grp, gpio0_7_grp, gpio0_8_grp, gpio0_9_grp,
+                               gpio0_10_grp, gpio0_11_grp, gpio0_12_grp, gpio0_13_grp, gpio0_14_grp,
+                               gpio0_15_grp, gpio0_16_grp, gpio0_17_grp, gpio0_18_grp, gpio0_19_grp,
+                               gpio0_20_grp, gpio0_21_grp, gpio0_22_grp, gpio0_23_grp, gpio0_24_grp,
+                               gpio0_25_grp, gpio1_0_grp, gpio1_1_grp, gpio1_2_grp, gpio1_3_grp, gpio1_4_grp,
+                               gpio1_5_grp, gpio1_6_grp, gpio1_7_grp, gpio1_8_grp, gpio1_9_grp,
+                               gpio1_10_grp, gpio1_11_grp, gpio1_12_grp, gpio1_13_grp, gpio1_14_grp,
+                               gpio1_15_grp, gpio1_16_grp, gpio1_17_grp, gpio1_18_grp, gpio1_19_grp,
+                               gpio1_20_grp, gpio1_21_grp, gpio1_22_grp, gpio1_23_grp, gpio1_24_grp,
+                               gpio1_25_grp, gpio2_0_grp, gpio2_1_grp, gpio2_2_grp, gpio2_3_grp, gpio2_4_grp,
+                               gpio2_5_grp, gpio2_6_grp, gpio2_7_grp, gpio2_8_grp, gpio2_9_grp, gpio2_10_grp,
+                               gpio2_11_grp, gpio2_12_grp, gpio2_13_grp, gpio2_14_grp, gpio2_15_grp,
+                               gpio2_16_grp, gpio2_17_grp, gpio2_18_grp, gpio2_19_grp, gpio2_20_grp,
+                               gpio2_21_grp, gpio2_22_grp, gpio2_23_grp, gpio2_24_grp, gpio2_25_grp,
+                               emio0_0_grp, emio0_1_grp, emio0_2_grp, emio0_3_grp, emio0_4_grp, emio0_5_grp,
+                               emio0_6_grp, emio0_7_grp, emio0_8_grp, emio0_9_grp, emio0_10_grp,
+                               emio0_11_grp, emio0_12_grp, emio0_13_grp, emio0_14_grp, emio0_15_grp,
+                               emio0_16_grp, emio0_17_grp, emio0_18_grp, emio0_19_grp, emio0_20_grp,
+                               emio0_21_grp, emio0_22_grp, emio0_23_grp, emio0_24_grp, emio0_25_grp,
+                               emio0_26_grp, emio0_27_grp, emio0_28_grp, emio0_29_grp, emio0_30_grp,
+                               emio0_31_grp, emio0_32_grp, emio0_33_grp, emio0_34_grp, emio0_35_grp,
+                               emio0_36_grp, emio0_37_grp, emio0_38_grp, emio0_39_grp, emio0_40_grp,
+                               emio0_41_grp, emio0_42_grp, emio0_43_grp, emio0_44_grp, emio0_45_grp,
+                               emio0_46_grp, emio0_47_grp, emio0_48_grp, emio0_49_grp, emio0_50_grp,
+                               emio0_51_grp, emio0_52_grp, emio0_53_grp, emio0_54_grp, emio0_55_grp,
+                               emio0_56_grp, emio0_57_grp, emio0_58_grp, emio0_59_grp, emio0_60_grp,
+                               emio0_61_grp, emio0_62_grp, emio0_63_grp, emio0_64_grp, emio0_65_grp,
+                               emio0_66_grp, emio0_67_grp, emio0_68_grp, emio0_69_grp, emio0_70_grp,
+                               emio0_71_grp, emio0_72_grp, emio0_73_grp, emio0_74_grp, emio0_75_grp,
+                               emio0_76_grp, emio0_77_grp, gem0_0_grp, gem0_1_grp, gem1_0_grp, gem1_1_grp,
+                               trace0_0_grp, trace0_1_grp, trace0_2_grp, trace0_clk_0_grp, trace0_clk_1_grp,
+                               trace0_clk_2_grp, mdio0_0_grp, mdio0_1_grp, mdio1_0_grp, mdio1_1_grp,
+                               gem_tsu0_0_grp, gem_tsu0_1_grp, gem_tsu0_2_grp, gem_tsu0_3_grp, pcie0_0_grp,
+                               pcie0_1_grp, pcie0_2_grp, smap0_0_grp, usb0_0_grp, sd0_0_grp, sd0_1_grp,
+                               sd0_2_grp, sd0_3_grp, sd0_4_grp, sd0_5_grp, sd0_6_grp, sd0_7_grp, sd0_8_grp,
+                               sd0_9_grp, sd0_10_grp, sd0_11_grp, sd0_12_grp, sd0_13_grp, sd0_14_grp,
+                               sd0_15_grp, sd0_16_grp, sd0_17_grp, sd0_18_grp, sd0_19_grp, sd0_20_grp,
+                               sd0_21_grp, sd0_pc_0_grp, sd0_pc_1_grp, sd0_cd_0_grp, sd0_cd_1_grp,
+                               sd0_wp_0_grp, sd0_wp_1_grp, sd1_0_grp, sd1_1_grp, sd1_2_grp, sd1_3_grp,
+                               sd1_4_grp, sd1_5_grp, sd1_6_grp, sd1_7_grp, sd1_8_grp, sd1_9_grp, sd1_10_grp,
+                               sd1_11_grp, sd1_12_grp, sd1_13_grp, sd1_14_grp, sd1_15_grp, sd1_16_grp,
+                               sd1_17_grp, sd1_18_grp, sd1_19_grp, sd1_20_grp, sd1_21_grp, sd1_pc_0_grp,
+                               sd1_pc_1_grp, sd1_cd_0_grp, sd1_cd_1_grp, sd1_wp_0_grp, sd1_wp_1_grp,
+                               ospi0_0_grp, ospi0_ss_0_grp, qspi0_0_grp, qspi0_fbclk_0_grp, qspi0_ss_0_grp,
+                               test_clk_0_grp, test_scan_0_grp, tamper_trigger_0_grp]
             maxItems: 78
 
           function:
             description:
               Specify the alternative function to be configured for the
               given pin groups.
-            enum: [ethernet0, ethernet1, ethernet2, ethernet3, gemtsu0, usb0, usb1, mdio0,
-                   mdio1, mdio2, mdio3, qspi0, qspi_fbclk, qspi_ss, spi0, spi1, spi0_ss,
-                   spi1_ss, sdio0, sdio0_pc, sdio0_wp, sdio0_cd, sdio1, sdio1_pc, sdio1_wp,
-                   sdio1_cd, nand0, nand0_ce, nand0_rb, nand0_dqs, can0, can1, uart0, uart1,
-                   i2c0, i2c1, ttc0_clk, ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav,
-                   ttc3_clk, ttc3_wav, swdt0_clk, swdt0_rst, swdt1_clk, swdt1_rst, gpio0, pmu0,
-                   pcie0, csu0, dpaux0, pjtag0, trace0, trace0_clk, testscan0]
+            allOf:
+              - if:
+                  properties:
+                    compatible:
+                      contains:
+                        const: xlnx,zynqmp-pinctrl
+                then:
+                  enum: [ethernet0, ethernet1, ethernet2, ethernet3, gemtsu0, usb0, usb1, mdio0,
+                         mdio1, mdio2, mdio3, qspi0, qspi_fbclk, qspi_ss, spi0, spi1, spi0_ss,
+                         spi1_ss, sdio0, sdio0_pc, sdio0_wp, sdio0_cd, sdio1, sdio1_pc, sdio1_wp,
+                         sdio1_cd, nand0, nand0_ce, nand0_rb, nand0_dqs, can0, can1, uart0, uart1,
+                         i2c0, i2c1, ttc0_clk, ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav,
+                         ttc3_clk, ttc3_wav, swdt0_clk, swdt0_rst, swdt1_clk, swdt1_rst, gpio0, pmu0,
+                         pcie0, csu0, dpaux0, pjtag0, trace0, trace0_clk, testscan0]
+                else:
+                  enum: [spi0, spi0_ss, spi1, spi1_ss, can0, can1, i2c0, i2c1, i2c_pmc, ttc0_clk,
+                         ttc0_wav, ttc1_clk, ttc1_wav, ttc2_clk, ttc2_wav, ttc3_clk, ttc3_wav, wwdt0,
+                         wwdt1, sysmon_i2c0, sysmon_i2c0_alrt, uart0, uart0_ctrl, uart1, uart1_ctrl,
+                         gpio0, gpio1, gpio2, emio0, gem0, gem1, trace0, trace0_clk, mdio0, mdio1, gem_tsu0,
+                         pcie0, smap0, usb0, sd0, sd0_pc, sd0_cd, sd0_wp, sd1, sd1_pc, sd1_wp, sd1_cd,
+                         ospi0, ospi0_ss, qspi0, qspi0_fbclk, qspi0_ss, test_clk, test_scan, tamper_trigger]
 
         required:
           - function
@@ -262,7 +402,16 @@ patternProperties:
             description:
               List of pin names to select in this subnode.
             items:
-              pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+              allOf:
+                - if:
+                    properties:
+                      compatible:
+                        contains:
+                          const: xlnx,zynqmp-pinctrl
+                  then:
+                    pattern: '^MIO([0-9]|[1-6][0-9]|7[0-7])$'
+                  else:
+                    pattern: '^((LPD|PMC)_)?MIO([0-9]|[1-6][0-9]|7[0-7])$'
             maxItems: 78
 
           bias-pull-up: true
-- 
2.25.1


