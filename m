Return-Path: <linux-gpio+bounces-24212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A0B213AB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 19:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37BE86801C7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F305B2D6E7A;
	Mon, 11 Aug 2025 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jZlZLS6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416B52D47EF;
	Mon, 11 Aug 2025 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754934673; cv=fail; b=cdIf58AV3Peto3p36Ecfw7qlJnXIrh+LTqMsXxYpkTI0um3eAEY470XQ6ltfhQ/VEduwzbl9606WX/K22wZ1cCFmyBd52KT3siJIU7EjY/M9ZYd1DLcWh6BsAtKLUw2YT6ormQQbg5srys9G4uz6/aoeVQsXSxbmW7viiMvgSrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754934673; c=relaxed/simple;
	bh=IgYHMoMnJJW3EBMJo+KMIljUv7VtBq6QUJ5kYhsKXO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RiKY6IkWDEhzx5Kq30qEDZc+HXcafo5lYLhh3KEI/VfFeLz4rCH8aBjQRP2vxj/+w+dOyCHSS0GqlRZsaWmHL/jInZXGhO1AkoN2P2yUzd5BwX+XVdGTSW9/z4XAVYqwKFc9qcdaynGsZnNvCXyqhzuqiU2Kd8T27ikWPdlLNyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jZlZLS6u; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epAstIYmzjA0VTKw29auZvu+f+xQtxzMNEVlglACjNc7L7tRmo4DUOOdQ2hw3f9EK+88muqPrM1nxsoy2i5blU6R3mtnYEWN1YxL1lsSoOIrFZkk7reNRl7jpusiRDZ2czQ5OqAFLY09F03gDVb6Lec0TxYAt+UP6JGURNV+FnxO1IaZjD51BQ+W0NFHbz1rzYnTDyFn6mV94sNi2g0Sp3650A0e8X33oBnQnCLUbKpj5426M5HaUDLeqs0zakQrqwxF2AAU41JBxiCOdabJwb3ruTXzbAIr84wpavuJ7FzTlYCSNTuL0ToCTQQ+P02XMTYerLDXAMqEan5WblJG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij6P2RPCxqrRrjX3Ni91bGFaZfAnLrjvWm3GwAmQ4FQ=;
 b=rG3fRq7NoUewP9nvUcoUnBueff2oN5phOtZs4fmw8K+9l60T/OWXB7FyYeC8Ft7DfWoeY3QdvjxHYOoJVShDY7fNzgqkk+tZw20SF/4nb/uIjyov0ctHHpKG94QV3GVT8yccNdiV5CStaKeJ4iLnQ2yzH8veVSeyryQF3vlPFNOJM3ESHIme+9o+7uFTcgfl9aJf0bT7kZtBm9n/EG8vhI7B6BE1XJwFfgZLzltbCSv0xmevlQBwHkUmEW5n8XPWTVVbdpoUONB7HYYF/ywSNzHpJyNg7afunQ7jtln+4LqUm2ydy9G0zjwUeO7zpzcYQjAaXDsLNjeGCxhfzDYxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij6P2RPCxqrRrjX3Ni91bGFaZfAnLrjvWm3GwAmQ4FQ=;
 b=jZlZLS6u1unRjQIElYsJk/z4hy13wqRbRjYnzQGB/z7DnpGA46bXDb+IDbMBjKS6+u1Es39j64dTjMqlpfbg5MmGRgnLRK8jgLwY2fkoF3cr0qlEJ76K0zISi5maBZrtHAmnokMRObL9oAu+ghGt1n9+kjPEZhCcWTRNf33Ay+rDgdtzzzNArIvsCIp/f1GEwRJFECTiCSMs6dM2fFNX1UgIl9quOTAVB2B/vLPbELFFVuwJ5QDHq0PgpT9WBQ8LLX6vDYkwjfl2KcWCTyvlYLgYIBqIMmh0xRCZBWhPqMa1G/GXHdRlDMXtGQTsfbFepweuAYGm9aTOlikoQEnOuA==
Received: from BN0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:408:e6::17)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 17:51:06 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::8f) by BN0PR03CA0012.outlook.office365.com
 (2603:10b6:408:e6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.20 via Frontend Transport; Mon,
 11 Aug 2025 17:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 17:51:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 10:50:53 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 10:50:52 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 11 Aug 2025 10:50:51 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>, <stable@vger.kernel.org>
Subject: [PATCH v1 1/2] Revert "gpio: mlxbf3: only get IRQ for device instance 0"
Date: Mon, 11 Aug 2025 13:50:44 -0400
Message-ID: <8d2b630c71b3742f2c74242cf7d602706a6108e6.1754928650.git.davthompson@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1754928650.git.davthompson@nvidia.com>
References: <cover.1754928650.git.davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6a0c6c-90f8-4996-cdcf-08ddd8ffa576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EukSuTulr0FDBvz8dEzFTDxK+Mlb/G/MOL/DFPQwpgpiz/zl6RsKfBkIcfSS?=
 =?us-ascii?Q?MF1/JW5q8BlNIN2KNRLa5QdgDdeOLRXsNxsl1gHCCxhG8hTF/tMredYgLb0S?=
 =?us-ascii?Q?eZAcZZ/DYVHQEZRU5cQ1b52K7866rnyFBrn9uSKXZ2lYAWMkmVVHt2j4D/zc?=
 =?us-ascii?Q?9f1pysiR9dTA751hFYWWg50QzfMMJ9tEripjVu1cnXgi65G+dPBdZ14J8FQd?=
 =?us-ascii?Q?6Ns8R1CGL0Pg+rkNoOHWhLsMLXC/2q8DOjxNaaxdnTjsjYXysMSg6TAO/PKV?=
 =?us-ascii?Q?prvVGl+3I5s3ilHwg/IrARsRTphcjGBw66tdE1eEGu4/pT9obEMXXOO5ZqNB?=
 =?us-ascii?Q?fQcaf4g4qVIOq3lFEnLDfbPwpef+lemJ8x3LZ4+nlYu3/QKrutMS8WmHfIVD?=
 =?us-ascii?Q?x9sN2C4VqYthBRo1JserjJzbJcpvR2o+IiFT1WNBzOwBepfSL73YAZP36cwA?=
 =?us-ascii?Q?HAgTtr2cVWxG1pr0ove93LyvwWTLKgp/8MmDqRBVtN1W0HSoOUZA4Et/ogRX?=
 =?us-ascii?Q?ioxV1Yqq7j58bi2/2wAraSVIys7hAUjk6OtliB0pip8k/6cTpmwakljRzVkY?=
 =?us-ascii?Q?q265U6J0scR9cTMGQQjDQd0xEmebd+18age8ChuPTeJVpFuNFDl6dMCEhHlc?=
 =?us-ascii?Q?GOxGUWPjWtCBJz1UH4AWipRgyFz/mFajNEjrWibdTybzHLdihz0snIo1m7WQ?=
 =?us-ascii?Q?6DsfTwbUsr5MyVg/TiC6j6kb9a8V3aTQ24y05iZViksL6WWQObvjALnUTEMw?=
 =?us-ascii?Q?rueOst6D/FAdV4y1WlCsWs7QI/kpVb/B7N4LkYCNMASjkLrcxW4n/r55kjw9?=
 =?us-ascii?Q?q0WhSVNC17/WdYL0ZPbEX7X/4MvdR6Xh9JkrxAl5Dzm3VqNad6s7CQ+AK2Qh?=
 =?us-ascii?Q?qxvmCY2mKmpdR8zC2KD2BRK6SRli55pgV+e/7URVK1OCc0iIhSgtChkGix9r?=
 =?us-ascii?Q?mwfjmhzQbr/8mclcrr50t4qJvey0Qawe+7l9yPwy1M7hR4+ERrXrudlBYTUd?=
 =?us-ascii?Q?3LDhgrH7ZYqxW8E0g3Vaxt8Wl5vPl76JRF8Ebo6oRW1CbWAF2vI6L+6oJWqF?=
 =?us-ascii?Q?dcJ6M153vp8ImNVopMx77PKbjqM02rleKPSXhZQxecVOqFrrRtZRUSNLlcy2?=
 =?us-ascii?Q?fsIHL7ZsVxTpF+90kh545IDfmi7CqyylUUEiIizMV9qLjUdwDgfINYIfotuf?=
 =?us-ascii?Q?FVByBKOZ8joexLigv2ToxM8uieOHxlBhYsUsmZhezROWHYYFRrwkIh1oT7Id?=
 =?us-ascii?Q?czrP2WEVYhniuBaQ+oyV/FbZLBCjsz1m+SjjJRoCdyGXCCf+bfXNf9/7kiJE?=
 =?us-ascii?Q?NbNWMcGb4eR1BgyA1Y3RyALLJuMW3tsgxbe2og3Z/mTsM0UYG1AbJOmdARcK?=
 =?us-ascii?Q?IXRg5KSyUWH7/6KPzI2TLqGQUR2qxXReGydX3tyd8/JY+OPiGF49GTLIPxCj?=
 =?us-ascii?Q?1B4mrRC/nvpc/XupFPN9TlPUngWWxpdEwporVWFuDjuZ0xQboTJo1NTFBISh?=
 =?us-ascii?Q?oX7HDDA9k2TecCjhEEtVdmoQt8C7GEiDUEOC?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 17:51:05.8973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6a0c6c-90f8-4996-cdcf-08ddd8ffa576
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569

This reverts commit 10af0273a35ab4513ca1546644b8c853044da134.

While this change was merged, it is not the preferred solution.
During review of a similar change to the gpio-mlxbf2 driver, the
use of "platform_get_irq_optional" was identified as the preferred
solution, so let's use it for gpio-mlxbf3 driver as well.

Cc: stable@vger.kernel.org
Fixes: 10af0273a35a ("gpio: mlxbf3: only get IRQ for device instance 0")
Signed-off-by: David Thompson <davthompson@nvidia.com>
---
 drivers/gpio/gpio-mlxbf3.c | 54 ++++++++++++++------------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 9875e34bde72..10ea71273c89 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -190,9 +190,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	struct mlxbf3_gpio_context *gs;
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *gc;
-	char *colon_ptr;
 	int ret, irq;
-	long num;
 
 	gs = devm_kzalloc(dev, sizeof(*gs), GFP_KERNEL);
 	if (!gs)
@@ -229,39 +227,25 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->add_pin_ranges = mlxbf3_gpio_add_pin_ranges;
 
-	colon_ptr = strchr(dev_name(dev), ':');
-	if (!colon_ptr) {
-		dev_err(dev, "invalid device name format\n");
-		return -EINVAL;
-	}
-
-	ret = kstrtol(++colon_ptr, 16, &num);
-	if (ret) {
-		dev_err(dev, "invalid device instance\n");
-		return ret;
-	}
-
-	if (!num) {
-		irq = platform_get_irq(pdev, 0);
-		if (irq >= 0) {
-			girq = &gs->gc.irq;
-			gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
-			girq->default_type = IRQ_TYPE_NONE;
-			/* This will let us handle the parent IRQ in the driver */
-			girq->num_parents = 0;
-			girq->parents = NULL;
-			girq->parent_handler = NULL;
-			girq->handler = handle_bad_irq;
-
-			/*
-			 * Directly request the irq here instead of passing
-			 * a flow-handler because the irq is shared.
-			 */
-			ret = devm_request_irq(dev, irq, mlxbf3_gpio_irq_handler,
-					       IRQF_SHARED, dev_name(dev), gs);
-			if (ret)
-				return dev_err_probe(dev, ret, "failed to request IRQ");
-		}
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0) {
+		girq = &gs->gc.irq;
+		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
+		girq->default_type = IRQ_TYPE_NONE;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->parent_handler = NULL;
+		girq->handler = handle_bad_irq;
+
+		/*
+		 * Directly request the irq here instead of passing
+		 * a flow-handler because the irq is shared.
+		 */
+		ret = devm_request_irq(dev, irq, mlxbf3_gpio_irq_handler,
+				       IRQF_SHARED, dev_name(dev), gs);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request IRQ");
 	}
 
 	platform_set_drvdata(pdev, gs);
-- 
2.43.2


