Return-Path: <linux-gpio+bounces-9887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6396F22F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6702E1C2154D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D531CBE98;
	Fri,  6 Sep 2024 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SB5A8/fr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCDF1CB334;
	Fri,  6 Sep 2024 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620497; cv=fail; b=kp1O5FooxWfyJ+2SspJpjdguhabmyoO7kOYCFBGdhSvKqkOEJ2YXp2yV62Ku4fqkaYb5+6IH+DMUS4HTaSPxSBFOQPdO4ZkXFcZH5AV1r2sJJjBikJ8x8j/BQ9dzN47AyHz3+AbcIpHlToqpKeRDCmMg4s8nacg0y6pAD2HTKvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620497; c=relaxed/simple;
	bh=0EBtVRHt4serazTpODaBBzbM1CQWFB581YXNockqjIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jkt6gI1X37FzWuYYYW/95NaA17XCvUfp5hhJ8Q1WSgpx7XSL0x4gZKkc+v6MbZvvhrlHIidla1cnIu5I0Zr9vBPWQn50uOQ4Lx45m3m2yjCuKdU31K3jRWdGssZ1ThviRumCKnLdIZF4oayIagRCpVW0vnBXPIOu9jL+Ej8rOqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SB5A8/fr; arc=fail smtp.client-ip=40.107.100.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXxCpK789tl4l8o37IcxVMqxhMI41x/mX2eYaUIZbm9Dz2+1N5UVpjazbByQ61TwAnnkTXBKxjkzkB72nJCF2uSUnp5NVc1hgdtPjjts13D99ZE+H6TrfFgJPknCyr4zbKU035BsPKxeXhjjKyaqg2e9aVD5HxQHhhgmTCVz0mwq1/u6AeLSTqBLkbVLr8dq8dElXMmd9NBW6jIORCtLKZoaC27Wf0DSoF5f3QftrTqw9+nbo7kPYLRHPJoIvLyIcqnsbTOjPYnl+z4CC/LK26u7A9G2VTvGDeln5PHvESCY5KWBPbiVyS7FOPp9pr65IceI1Cilwm0SSQvWO6J+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mgQnQujlDRhyvJfjgDxSZYbzQSOlQeubMM4Tmo472w=;
 b=AEOvqrn68UucUHz9mIEKhvvXQfXfb3IP1If5Cpcfxq79qdLvW3qOQAsdHK6a3fZfOyQ+n2kEfecpzyDPGfFf0wC5Fmq4hQ6nqS/3IfIQD2JADAY7vcQT6mq7OST+xpANSl3PKxCZNiuuS7GooSF5sqB8TOV7/0ZQZvLpq6bOpJIzhy3L3tN4eNVAhEffoFKxz5SWVj1d7QPPJRrkb4L6wpDkmzJByq4H/1lVSd0gcIBe1jVp/W0rq9SVyWTQVR8d38TmFktEE0ketbTWSwP6YWy4kxY/FLqXYwpxU1AAlaSkMcnPcjaR9eAFYUwrakRcbX6HjPPLdHNFjBJR4syamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mgQnQujlDRhyvJfjgDxSZYbzQSOlQeubMM4Tmo472w=;
 b=SB5A8/frAk9THHGqexSUk5krI2UuTc4Muam8jjSnE8+kFf6U0fl/RGLnTbgKzn7IzMaf+AprygDhttNnc0DtIIYvgSkdC1SlX2FmNtCqEqgCmRSex9xdXrpi4h8xqA0iK0KEN51eizuRGdgfs/VsR4cX6wo9h3kaXaywaAjh5/o=
Received: from SN1PR12CA0070.namprd12.prod.outlook.com (2603:10b6:802:20::41)
 by SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 11:01:32 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::94) by SN1PR12CA0070.outlook.office365.com
 (2603:10b6:802:20::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Fri, 6 Sep 2024 11:01:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 11:01:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 06:01:31 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Sep 2024 06:01:27 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek
	<michal.simek@amd.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>, Praveen Teja Kundanala
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <git@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 3/3] pinctrl: pinctrl-zynqmp: Add support for Versal platform
Date: Fri, 6 Sep 2024 16:31:13 +0530
Message-ID: <20240906110113.3154327-4-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SA1PR12MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 998cedd7-d3c3-4923-fec9-08dcce634495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AKZWO2hPWlQL+gt9xAVj3VmekdKDmoof1CK9JLD4K2V+P2xaXlFIzwt382yt?=
 =?us-ascii?Q?Zk4LcMNOtLn+2Ef7eYB47pqTJnb8edMDNsHNj55gQ3lBnw3NOkNivQoNVyC7?=
 =?us-ascii?Q?WBXv1EzBnPsPXS6FrCfdhs/hKXOgPMbGqXHPS47qW4/qUKh3ES6IxwHm/TSO?=
 =?us-ascii?Q?OnUuWMiUghxKj9JHRnwgI9eQMAcKGqf9AarJnrowuoOSxX9iXUK1SFMyxTAQ?=
 =?us-ascii?Q?BQknKAPRqavl5RhuPczsoAuPU8NdaDlqX65PWl6BcebQc8w3g6od1BFBfp+y?=
 =?us-ascii?Q?Gz3BWx3JtMUguEZ4JmoD5mYtLErKn4cFjjmIjIODhQhfrvCQDHlk8f+axv8i?=
 =?us-ascii?Q?hF3zANKFOGwYxh6rk1wceOcR60YxZelxNVQfA+nFuK6yR7eAU+zgPOAIToLs?=
 =?us-ascii?Q?5hey2oFQZg0fVTJoyG9ZA42Vn8miyWZFZ0L5A6yrYEKhef8WdrXF5wF2fAur?=
 =?us-ascii?Q?3MOuxi4+Bn3RI/K/n9QwKSVWG80jlN1hMr2/7NnkYEbZ9ZG411ub5mnCDr5v?=
 =?us-ascii?Q?H4PH6HNuUOzCpY97WhHL/aHWyBjfOQT85QTI+kWP25ANh8RvhzmebF7Driq8?=
 =?us-ascii?Q?wC/asMN5/l+XMzy/fhDzddEDA9xbDGqebThB/vCrqEvdPuiIp8sGjDXKl2mE?=
 =?us-ascii?Q?dYGoIPqoSMveCt+OjrPTxzzyHU8qiFbD9UwtwfuTk31HqteVwR7wIa8AvgdY?=
 =?us-ascii?Q?x1xkjsWaZMJCl+8KtnTkJa3Riszt6OtnVVfdwPHhfG8Xwg/Zt9lO/HEgxnVI?=
 =?us-ascii?Q?vq826tBu1dMgog7pKN/mpJXNQUmS3hGew4HoW9IpwI98mF60Lf2iSHb4gsYT?=
 =?us-ascii?Q?4wXQI/WIaRSzSOk9NKuu1OH0YGFfeIfhTEli2J46QLT97eLbXUihV3c8Qrb2?=
 =?us-ascii?Q?L6xpGEBWaWDdcvPFp9HnomFpNvmhRMH7fB59WlZnlm6AEOqfW3545lxZg+2B?=
 =?us-ascii?Q?urd8yF0EehCnkHfQ9n2PgnZ1DpmOTpMZHNE3Gc7IkSAxMfUqEoEzgpVo4pHl?=
 =?us-ascii?Q?Zqm+xSU52rtflb+yBaHS6khOP7hV5JOJiLOqt7RW726Tcyb9PmM+ytjpwgBK?=
 =?us-ascii?Q?5kiEOHeGb0TOj2kaa0EnAWX8rSRx0GytIgOMMHLDVFeAjiocFpp10Ov8elDK?=
 =?us-ascii?Q?obhOuaCSNi1CqQQxhpmmCqwaZRsKBenLGgY5mLk070UC2acajO5QQgENp1or?=
 =?us-ascii?Q?aYNqqLjTN7Zg/TOf7xwdIvMFiAHL5EctGJtMWfeZkrFCyiRS34C0XsHagr3G?=
 =?us-ascii?Q?jsJlcqwKbD6silqAFKz8vk1B1vIxX9RTe0bZxT9OElirzkRqaB8X1mH5RIee?=
 =?us-ascii?Q?GWzdhJ7mBtAVXqgjQ1fVXsq6p8wUCGtWoaNAoVYiIcXoYvRzZzauTP61l2Iu?=
 =?us-ascii?Q?QUcawoU0xPk+b+v8jl6NkAfPWFe/DZp/M3GK1fzedIOFYaQdii2zq5/vT/0e?=
 =?us-ascii?Q?8F0hAOpdeVvoB/l1padrcITQuhTdnhKH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 11:01:32.6126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 998cedd7-d3c3-4923-fec9-08dcce634495
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6970

Add Pinctrl support for Xilinx Versal platform.
Driver checks for firmware support to retrieve the Pin information, if it
is supported then proceed further otherwise it returns error saying
operation not supported. Latest Xilinx Platform Management Firmware must
be used to make use of the Pinctrl driver for Versal platform.

Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 97 ++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 3c6d56fdb8c9..2b9f8db49a15 100644
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
@@ -93,6 +100,8 @@ struct zynqmp_pctrl_group {
 };
 
 static struct pinctrl_desc zynqmp_desc;
+static u32 family_code;
+static u32 sub_family_code;
 
 static int zynqmp_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
@@ -596,8 +605,12 @@ static int zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
 			if (!groups[resp[i]].name)
 				return -ENOMEM;
 
-			for (pin = 0; pin < groups[resp[i]].npins; pin++)
-				__set_bit(groups[resp[i]].pins[pin], used_pins);
+			for (pin = 0; pin < groups[resp[i]].npins; pin++) {
+				if (family_code == ZYNQMP_FAMILY_CODE)
+					__set_bit(groups[resp[i]].pins[pin], used_pins);
+				else
+					__set_bit((u8)groups[resp[i]].pins[pin] - 1, used_pins);
+			}
 		}
 	}
 done:
@@ -873,6 +886,70 @@ static int zynqmp_pinctrl_prepare_pin_desc(struct device *dev,
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
@@ -882,9 +959,18 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 	if (!pctrl)
 		return -ENOMEM;
 
-	ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev,
-					      &zynqmp_desc.pins,
-					      &zynqmp_desc.npins);
+	ret = zynqmp_pm_get_family_info(&family_code, &sub_family_code);
+	if (ret < 0)
+		return ret;
+
+	if (family_code == ZYNQMP_FAMILY_CODE) {
+		ret = zynqmp_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
+						      &zynqmp_desc.npins);
+	} else {
+		ret = versal_pinctrl_prepare_pin_desc(&pdev->dev, &zynqmp_desc.pins,
+						      &zynqmp_desc.npins);
+	}
+
 	if (ret) {
 		dev_err(&pdev->dev, "pin desc prepare fail with %d\n", ret);
 		return ret;
@@ -907,6 +993,7 @@ static int zynqmp_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id zynqmp_pinctrl_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-pinctrl" },
+	{ .compatible = "xlnx,versal-pinctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, zynqmp_pinctrl_of_match);
-- 
2.25.1


