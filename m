Return-Path: <linux-gpio+bounces-24303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615FB2293F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 15:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52337683EC9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 13:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84424283FF8;
	Tue, 12 Aug 2025 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bQx/eg/p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4586280A56;
	Tue, 12 Aug 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006017; cv=fail; b=jiaLY7nthYoiHwwmq6woL/K9SwumxtPv6kEiRrmJaFeLxZtZKg80xRheSFHO1nEnLXsSfLm84dP8tiF8SpNOfWcuBUDobr5BF4eGpbUwsV2ntEalPMAFbIHPnQAEGtX632d2HVq5GdJkVvnq4GOO0NIQ25bzv/nCZCNUJ5WdovI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006017; c=relaxed/simple;
	bh=P/TOFF5/a94gx3oMVKPOiljiw1qE2bagW8w+DseQORQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O0+4WKFATLnMpZf148b5Qpu5Q6gSgx0A/p6hN+EYJgTwnu45I1yZBg5RMAOwaokrLl+53n+npOcbvZ512xRNmRx4DlDzpOa1Q0DcefEcbKy8USqK1ovBEHKHv0Wcp5PL5XDx9B3OT3mmaZmTr3pPDnQvUNsKHchErWYWP7RlN1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bQx/eg/p; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfcNxTMEBNhc1Jrk8zlSgL8nGQZ0ZUPE3La0YRcatjaOd7gYgirnOyc8gVANMgHDCLhArUW3nEVnVJZlsCTKQdXja+qw711j0XxcwfVsYGvk3ZQppjLLXalBnXkCCKbcLG+97QXVmb0OTbs41W/6kPntojCEwXBVVMIc2P+vs/UHAuh0Xga9hfFrSfOrY6hxhmHBKUjZmyXq+j9Q+oFVAd42IK4yffyddnJZcfANINAp+u05yAcy+c3j+MLw3XGWubz9+qbLnVSRNLwOthKAeotBN1EYA7KoOkseupNDvl7Owo2Rcm7TXPCvbhisMaxwBGzX2a05mHqoxcq/KNzsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saK7jCkFduI8kxZCHZ9Ie41tt2lsz2ZHKTUO45idcmo=;
 b=bUiiw35cLE8RZVaVcBJ0TPRJ1jOveBSi/PD1wDoMan40wkM8GxF3k8tYfKO0168K2/Hd9IDLQ3QxdJd1z9rByfhJLUE+vFDVKuXsuWBdrh10lv/f5TPrRZ0XGa0szRffzYAxAoYEcgGstQNF+rBF+9rF2box3/IvYMzZbikeTkh+2Srgzwkj7TN118pGEGFTnq6faEkydOnTVQnKgEEPMWp1LIC0OC7frMfp4ow2eBvPUWTO2LuANd/5c07MnbDI9xiSdVK9QZBd4At89jB93x7/o93lp7CVlQoiUA0B2OKCdUiI2HzNGmdqtP9dl7wjrgjnRqpM+uVJXdmIOk2buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saK7jCkFduI8kxZCHZ9Ie41tt2lsz2ZHKTUO45idcmo=;
 b=bQx/eg/p3E4KW8ERKyqBf006JQndkBXKnbcIriXEC46EPlE98t74OpXXovY3Eo2F9nqYq+EOSVpJe2vLpO9Jq6nNBdkt9HEwO3Ngk1PDrArWtJgsv4QzxPbXZHHcclIKGgOTpvwSiMW3Yyvz7At9X+snPJJMXKDNfiqq6dz43IfE8sm6HmVpEygEL7WArudYVW2Sqi+spef1ZrT7MGJTPmOhIz21Z+kbT/J8OVI34rFBiCe3Hd0DolvPa2FF7BvxmDCT8F7NoSyPcwdDFTrBC4t2b+BQofbVw+np4Q9zDv3IiKhyENwqvyBezyuJKKDm1K+/DnQNg62yo0W30dZWaw==
Received: from CH5PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:1ed::13)
 by BL4PR12MB9535.namprd12.prod.outlook.com (2603:10b6:208:591::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 13:40:12 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::c6) by CH5PR02CA0016.outlook.office365.com
 (2603:10b6:610:1ed::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 13:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 13:40:12 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 06:39:59 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 06:39:58 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Tue, 12
 Aug 2025 06:39:57 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>, <stable@vger.kernel.org>
Subject: [PATCH v2 1/2] Revert "gpio: mlxbf3: only get IRQ for device instance 0"
Date: Tue, 12 Aug 2025 09:39:51 -0400
Message-ID: <8d9d9d6beb0b2785e3a4d75662f585e28dfba8df.1755005277.git.davthompson@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1755005277.git.davthompson@nvidia.com>
References: <cover.1755005277.git.davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|BL4PR12MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7341f7-f800-4d2c-f6fc-08ddd9a5c34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0g3f53t+agVVgOqxZhn8t9aE+e+hFBTRqvhH4jxAwQ0pt8OxZv71/wzjIxwp?=
 =?us-ascii?Q?7g3zQrR8s5e+vbQN7eGlJkISKbSqbkEwlDDah1DlSfAEzkLQ8aaX7olkLQvd?=
 =?us-ascii?Q?5rt+E6qFC4czjICZsRrVDubjQOwI6vwk1IiK8CIrOYRV/yl3+6JgXITZBuZS?=
 =?us-ascii?Q?C+w7Bl/fvQ0snkyXis0oSIcSiD3bmfwu5FnzRoSIAECFKf0QQnkvrezB84jF?=
 =?us-ascii?Q?07uYUXR7pXmrhX9byOmtUNItB6k6qltOBN++vL5ev5PaRqJkzx8GXBHinqZz?=
 =?us-ascii?Q?H0L9fS2EGgWx5xvhmAM6cH0IUuR4Ab31cHZs4PJ+joMCFjOA175LB2KRej7o?=
 =?us-ascii?Q?HcDya7efJiCham/tsAy33VExl9gYHtO1ao6aofczo7/XnkeJGx4GzxraaaGq?=
 =?us-ascii?Q?ub/7dcxk4LKhJHY3xPuVtm5ChDNw4qbRlzTkL4Uyh7iccDmHwlcy0NejW0Aa?=
 =?us-ascii?Q?z4asJ9DY0B/2o64xW8+SeViPNjwhoSsxx6sQqh5mrgMIw0pSPAqI5q35AUCO?=
 =?us-ascii?Q?fAtuZ5Rt9j0Qh3ngmLiIbxxRtaMYphTp47fF+I5xGlqAwLcLH7baOM6aBY7v?=
 =?us-ascii?Q?2Dm/y5n3HkLjF/OXFCcoRKS+qE8YwBuqv85jszlsNWjhJ9k8T/0q6r1k1HU9?=
 =?us-ascii?Q?Wmrapk2kPP8cCcoG5Rno/G/OhDLFGCWsp3bhA2S0aSG+Ph2WVezR/mYLqHvz?=
 =?us-ascii?Q?jEeN5C5SMQKiJXhtmRMW2ZuwtKLni1U5nwYblYv4SPOh+gYH+mNgJAMU8BNN?=
 =?us-ascii?Q?xjNQduetu9CJEwff4Xsd9fpJi5fAYnK9teaSZt/HaF8jOnqmzgoMVD23HpFV?=
 =?us-ascii?Q?N4Non7vTvSmFKl2G/dnWNKDBiLNSsE0mn/recULWATHZKDqMQyGsc30CFO2g?=
 =?us-ascii?Q?kenm830duxrWhRTLjetdoDEanEY2Xk18blaN0MImUJ4eJMdWPgLtPXQ0gL7Y?=
 =?us-ascii?Q?chS5HtEprHSBgufjC9XZ9ILdIc1TF19gKFx63jEjzNFqwNqZ2JyA274GjMFs?=
 =?us-ascii?Q?MWwvbvdfiQjSMDFBqTVim1/0mNiWA4OrSU5wnl79fLBnA2XonLklWjd7hkKP?=
 =?us-ascii?Q?IZq1RZjerEdBqJX2lfPRtybqTzMpeSc/YPZ28sYnocbxJCPBoW6vOfBHuaQo?=
 =?us-ascii?Q?sYbd0JiWAy//QG5jbI+CWyepQdpD9gJT0DvvyEbdOmGVd+39JYsb2xQv41dB?=
 =?us-ascii?Q?DHS/oGmmsKeTy6qLCuLPj2NdDQadR82Si2db0iju13b9YOOjA2wfUbre7yy7?=
 =?us-ascii?Q?zrcw1UK+S3gMYea6MCMjCQJYBtpH3J8p9B32EDfkqigfEkhId4NC6gI5H7CI?=
 =?us-ascii?Q?spKYKnZI3KLE2azaP1PBM83WecqgKNGAyYjOUsyw5Y8X9GE56GSRgldmsU0D?=
 =?us-ascii?Q?NNgpxm6byjMJmC9WZC7YfZiyyTKBobnTgBddq6o8UhzoDGXu3Igw0461Z7Vg?=
 =?us-ascii?Q?tAc3+QHrwQEsqDKRBgKv9APj2wSvoRzxrvHeEs5u7fxxpq64X5fSzTKf1VnO?=
 =?us-ascii?Q?8Hzw3WIHTNvt9f3QShCf3CX5ZLa8OTCAsXNh?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 13:40:12.4523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7341f7-f800-4d2c-f6fc-08ddd9a5c34d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9535

This reverts commit 10af0273a35ab4513ca1546644b8c853044da134.

While this change was merged, it is not the preferred solution.
During review of a similar change to the gpio-mlxbf2 driver, the
use of "platform_get_irq_optional" was identified as the preferred
solution, so let's use it for gpio-mlxbf3 driver as well.

Cc: stable@vger.kernel.org
Fixes: 10af0273a35a ("gpio: mlxbf3: only get IRQ for device instance 0")
Signed-off-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


