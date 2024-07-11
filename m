Return-Path: <linux-gpio+bounces-8180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C90792E4DE
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 12:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C061F22704
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2024 10:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC10415ADB1;
	Thu, 11 Jul 2024 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eqsqXWsU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E715958E;
	Thu, 11 Jul 2024 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720694024; cv=fail; b=Z2B+jAl9HXy8W07X60dtqde6Vvdank1W4BqgT9FirIkVpS3XIRJYSTVumKtvjTtRshCGc+5mfJXC8cHb294u+TObJz5GnEIhT0Vp8G/7j9TVsNvvUqanbgieLAKm7NHu+eK47d9uN6AEk83nd8cFANTyJ/5r3FG2U9HXLv688PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720694024; c=relaxed/simple;
	bh=aEP9//HJhri6/luYGIN3gPQz8tAOFxNPNqiJvuDfi6k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmFwrqPcdkUqtu39Gra8UAkpZv6t0OIsSCHRWVAKOwa/NG6Y7P7YhVHPCRs+Ra7HxNP/lUhfVAc2M2+pbIxovbctBA1VMOGcasD9e6jAHTVTJrSUKHaWcP1GqfHjyokq+1nZC79ZaCB1hJdS617xOqFG6c7STvRy5u8g/rINrEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eqsqXWsU; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHwqY6rVGcOBzD2NraRA0OOBUYEQvqrCJkEDtJhCNIWyrsbqmfEhoirmZnmJFSvf2r7Uxz4rz9A/4D3PQbtrY5yC0rHyhAHmr4iA5RHRdSzeXhiVwcff4UpzEweLKY459GlA5SsMYLxdYAXgGLEi2iFjruLfgnaAAJ55Aeyhmp071hZBAmD1CmqWfmPpALk0CSQ2Qo6Rsnwba4wqJmlUYHXXQN9/BQWgAyThUqr02kLis2nWSaGK1aja2JUvRhOpPfejlBYLVvwDCE8lle51ZVFvSRKuCnlVuenYDTqhltRDAxbSofUwccZyD9XrH45NFvw+twWcM6OIVLWP2GPn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18X7AL+gySGaAU6T4kRJemHzBS231JLwQEuirixxrqM=;
 b=yAP9JYLqMeustLgHE8yCVdvyOcILVJyGrSp4xWtzcxvORCctQWqfONrezlHMzaLYYlZRNGw6eq/tm8TbVjQzuJDqBYYCyw02iYrshOiIuTL1aBoY2EHg8xDSOCi3UKg1EfC++Bqg+noOO5+1ge4PD+Ghj6nrhu4oBYtcuDazQ+wBzOGV0rwU1xtfyJebBBSI17faecogCQMzwESW27GEqHpzu9U3Vlr3dPSgDNeQiVQ0qOK55IzRJEZpRVeOUOIXU1V5P9HxZU7YCbcET+zhDdBWttx99qjKdSltRLStD4wil3fOF7ER66QY3KAC0ZAaxYX6Y/8Og6vb2QmvhrUcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18X7AL+gySGaAU6T4kRJemHzBS231JLwQEuirixxrqM=;
 b=eqsqXWsU+QqriSS3x31VZJ/sRsLltHrmlfPMVu1043oMzyZ0vA+3v8FxEhiKn75HiL5WXXeDZwvOc6+tdVozQLXvZ20SMRfZw/6inoukLs7gneiU3GilY3HYQgM+U3SGi7aa4Cdvib7P0Yt3wyRStZ0SGAbvobRFQ0Un9Z5m6D8=
Received: from SJ0PR05CA0065.namprd05.prod.outlook.com (2603:10b6:a03:332::10)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 10:33:39 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::bf) by SJ0PR05CA0065.outlook.office365.com
 (2603:10b6:a03:332::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 10:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 10:33:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 05:33:36 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 11 Jul 2024 05:33:32 -0500
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
Subject: [PATCH 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal platform
Date: Thu, 11 Jul 2024 16:03:17 +0530
Message-ID: <20240711103317.891813-4-sai.krishna.potthuri@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c9a0f9-0cb7-4287-9e6b-08dca194ed3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6Vyr14wr8nUSSwfrRa/4VTeZjiN9SL5WoxlTWhVUpDRWlk+5jakSHozdEnM?=
 =?us-ascii?Q?hAOr0YTGRLk2838Tgw4DfrlPrzqiA4EpPvv6X3AUI4FIsaqjzbeAjdsnMg8C?=
 =?us-ascii?Q?YLNxKGX5X4ehjVl7d8NPeJm4RPiiklE1xswK0t9TSFB7xglMbxZlrlJ5s6pk?=
 =?us-ascii?Q?TNiu1P8vdlTv9eH2Fjm5LTIUrMAsWCmuKfdNXE5WL3hYSWaJhHdxzyJr6gdP?=
 =?us-ascii?Q?NXKD+Gz7wi5QRvG2sjRwtQcey7Pt8QVj63zEHN6LChyomy6Q7poWQLbIO+aW?=
 =?us-ascii?Q?7wiozMx6C8T870xshJZUuCX+7T3wyEsOwHdV2RZWdjlgIE5O7Hbp9jv/aZlC?=
 =?us-ascii?Q?G61/CDXEbKiQkr/XuU8H65T2WwXpNym7jZ9oktGKMDJfuPp5rN0aZinqxAa+?=
 =?us-ascii?Q?oKMs/83DbGTRQPjfUsa3hzOD1GafHXpRUB3B3tf6ycFuCANuCjSMF1Fj6v3R?=
 =?us-ascii?Q?ugAVqI3s5yURSzMbF4BDK/TCcD32LsyP265WY+8d4/zOt+R2M/gjhZbx4qeR?=
 =?us-ascii?Q?nEHj1/Ahsd5pzb0bQegMs6I0U2vXHxq38CfZA2rlLPp9K3Sok+vHYtnSd4t4?=
 =?us-ascii?Q?afetyl08lppJ2fxK7gTaTO22V/Mm6lqjfN376Up81WOyrOaQg/0052h03yjm?=
 =?us-ascii?Q?ZfwVadYV19FgrF6eVnE8vSS+lD3Ou8IhvXiYtsosA4YvaLpKYXNuw9MzbBhX?=
 =?us-ascii?Q?kl/tvBTHeQse53LVQjB/taDZ+OUPPwWBSEHncYP2a91J9/NqGqKuQtXNI43G?=
 =?us-ascii?Q?GrQisLurE37w6W8mYHWWCZCjIwDg5HukNXuKMpLHphyMkifWAtm5UXKBE6xs?=
 =?us-ascii?Q?9LTmc9/RAqa8PceFpg4WPb1O7ELZalYcuGY+L7G48Dka3Z1GAK1BYJzpFv+B?=
 =?us-ascii?Q?ZArXV8mrgrh35GQ13mwSAoext7HrVaX/sKscXEsEDKFuIBwn8Hu+Jb4Ih7+y?=
 =?us-ascii?Q?6GRpNITlLwTDjdZGzKSpBg0/E/LCOApyBUP62nqW5Cj20Mp8DeU/nUo3JD4B?=
 =?us-ascii?Q?d8Yc31Q0u+ezZUPYXWa37FVhr7sQx+aASChqSVscX8+g1jnxDhJi6lf/9509?=
 =?us-ascii?Q?1JOdpsOOML3299pEzAVm9fbH+pzoRf9RKsf8Vfy18bxpE2o+borCxOZxzbfc?=
 =?us-ascii?Q?AvBAIci4Wa89xIKZA+VGQ7iG7NGylOpjM+HubD6ed4p5z34r8K5Czgx2524R?=
 =?us-ascii?Q?utgyw1yv6Pc+L6bScYm98nlMEYI4E9t3AI932JMOa5SveGBE+Yeb+vSCxg1l?=
 =?us-ascii?Q?7qSwASVugBgFjs0pjdxdbCIiMLU+GpkjQXaAfrBs+k9TiQhfLnMeQTuh6XL4?=
 =?us-ascii?Q?3qE+IoN6XdR38faABq4fsqqkD1IwDlEAYckwCQ3FYxiIudp+gDuzQMsThYfm?=
 =?us-ascii?Q?qXeDoRdM7Nf3JazLZFKo081hS7ELPoEoaWheEyt5VOVRrAT7MifYwh8yT/tm?=
 =?us-ascii?Q?z98hBTlF4VWi5TdfSKCWfollNp5+wyIO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 10:33:38.3447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c9a0f9-0cb7-4287-9e6b-08dca194ed3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

Add Pinctrl support for Xilinx Versal platform.
Driver checks for firmware support to retrieve the Pin information, if it
is supported then proceed further otherwise it returns error saying
operation not supported. Latest Xilinx Platform Management Firmware must
be used to make use of the Pinctrl driver for Versal platform.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 91 ++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 3c6d56fdb8c9..e2cfd3d512e8 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
 
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -44,6 +45,12 @@
 #define DRIVE_STRENGTH_8MA	8
 #define DRIVE_STRENGTH_12MA	12
 
+#define VERSAL_LPD_PIN_PREFIX		"LPD_MIO"
+#define VERSAL_PMC_PIN_PREFIX		"PMC_MIO"
+
+#define VERSAL_PINCTRL_ATTR_NODETYPE_MASK	GENMASK(19, 14)
+#define VERSAL_PINCTRL_NODETYPE_LPD_MIO		BIT(0)
+
 /**
  * struct zynqmp_pmux_function - a pinmux function
  * @name:	Name of the pin mux function
@@ -596,8 +603,12 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 			if (!groups[resp[i]].name)
 				return -ENOMEM;
 
-			for (pin = 0; pin < groups[resp[i]].npins; pin++)
-				__set_bit(groups[resp[i]].pins[pin], used_pins);
+			for (pin = 0; pin < groups[resp[i]].npins; pin++) {
+				if (of_device_is_compatible(dev->of_node, "xlnx,zynqmp-pinctrl"))
+					__set_bit(groups[resp[i]].pins[pin], used_pins);
+				else
+					__set_bit((u8)groups[resp[i]].pins[pin] - 1, used_pins);
+			}
 		}
 	}
 done:
@@ -873,6 +884,70 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
 	return 0;
 }
 
+static int versal_pinctrl_get_attributes(u32 pin_idx, u32 *response)
+{
+	struct zynqmp_pm_query_data qdata = {0};
+	u32 payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	qdata.qid = PM_QID_PINCTRL_GET_ATTRIBUTES;
+	qdata.arg1 = pin_idx;
+
+	ret = zynqmp_pm_query_data(qdata, payload);
+	if (ret)
+		return ret;
+
+	memcpy(response, &payload[1], sizeof(*response));
+
+	return 0;
+}
+
+static int versal_pinctrl_prepare_pin_desc(struct device *dev,
+					   const struct pinctrl_pin_desc **zynqmp_pins,
+					   unsigned int *npins)
+{
+	u32 lpd_mio_pins = 0, attr, nodetype;
+	struct pinctrl_pin_desc *pins, *pin;
+	int ret, i;
+
+	ret = zynqmp_pm_is_function_supported(PM_QUERY_DATA, PM_QID_PINCTRL_GET_ATTRIBUTES);
+	if (ret)
+		return ret;
+
+	ret = zynqmp_pinctrl_get_num_pins(npins);
+	if (ret)
+		return ret;
+
+	pins = devm_kzalloc(dev, sizeof(*pins) * *npins, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	for (i = 0; i < *npins; i++) {
+		ret = versal_pinctrl_get_attributes(i, &attr);
+		if (ret)
+			return ret;
+
+		pin = &pins[i];
+		pin->number = attr;
+		nodetype = FIELD_GET(VERSAL_PINCTRL_ATTR_NODETYPE_MASK, attr);
+		if (nodetype == VERSAL_PINCTRL_NODETYPE_LPD_MIO) {
+			pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+						   VERSAL_LPD_PIN_PREFIX, i);
+			lpd_mio_pins++;
+		} else {
+			pin->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+						   VERSAL_PMC_PIN_PREFIX, i - lpd_mio_pins);
+		}
+
+		if (!pin->name)
+			return -ENOMEM;
+	}
+
+	*zynqmp_pins = pins;
+
+	return 0;
+}
+
 static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 {
 	struct zynqmp_pinctrl *pctrl;
@@ -882,9 +957,14 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 	if (!pctrl)
 		return -ENOMEM;
 
-	ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev,
-					      &zynqmp_desc.pins,
-					      &zynqmp_desc.npins);
+	if (of_device_is_compatible(pdev->dev.of_node, "xlnx,versal-pinctrl")) {
+		ret = versal_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
+						      &zynqmp_desc.npins);
+	} else {
+		ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
+						      &zynqmp_desc.npins);
+	}
+
 	if (ret) {
 		dev_err(&pdev->dev, "pin desc prepare fail with %d\n", ret);
 		return ret;
@@ -907,6 +987,7 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id zynqmp_pinctrl_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-pinctrl" },
+	{ .compatible = "xlnx,versal-pinctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, zynqmp_pinctrl_of_match);
-- 
2.25.1


