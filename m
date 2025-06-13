Return-Path: <linux-gpio+bounces-21561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FABAD92E0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 18:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CC733BA058
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 16:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB36F1F37D4;
	Fri, 13 Jun 2025 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JplZWJxT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61BF1E378C;
	Fri, 13 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832505; cv=fail; b=pbIBXTe5t9h5RHiiFxN5kuy3mfb9V86d1jNRlP9PziFakdLRx5xDg6AkwfiokQTI07MZkoen25hC8ZJeL4NE0DoLQBAWenzuTqSVSuHYsuLckKWH6q2llh1WKS4+GXWYHAjmNFRntAJudRiVP09wpX6gRAiWGQsXm/LfCpuCptc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832505; c=relaxed/simple;
	bh=EOhy9ABZCwFPLb6ISn0pe9KVWu0y+n9AjuqArMWxiQ4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XRJuEJu+MC1e6FHER60/8Bd08R2Y56ns4mtSgrnTj8ajxFPhBxcG+AYJlRtn/FxXUemybbyXm2ukbkhR40vVhN4L8L6it/RIPxqAKNdmDFDSbWYBJZ62KXzLk7Vhg7ndb0T3wD3I3SSwzFZ+1DGOb9yRKlymnEUBk6LWa9/+vS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JplZWJxT; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR7tZwPPcPK84PA743WLFKVjBXAEKCQ6E7NJTPxuEZPSN5OsL5qPWVib7jZDYUnQh0baCI/ELBCbeH7Y6WINF4J2Ebqdff7AhblCIAHzPhLK5WViwiKnySRStir7Z25AGy5pIMngEwINmHZH2AS1B1IbifMquU7SUwd3HnE0zr7RPqBZ1hSUqydFeIGqms+tLBU6cDPAmI3phBuJXyYbCi0/Z3yQM4rzOQVm1pcQL1EmgAV21y/PmRNe7KAT0PCI1Ut3LZcOAWSQp7vhyKOCklr4Pb7Pe0Pv/OH3D1Prykx+9mgxRSnN1WGYRhmoRfbozPlZJjOoJBOCtB+yALcSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU9ImkQS3p72Inan8dmIXDlU8czeYoa/HFE1AcJWvWc=;
 b=cgZssS4mcIwudM07rkDQKbY5TwQEez4+cpQgEFsgmboRyivadFco3TocfU0Erjzn7+2QzTON6Zqt1nx8QipcIADgHpP1jm1pKvOkSPbdrISk2mQpNp9qbtOgKy/e/vmmwfVg3HUa2QZSeWHfU+bzNe7O8qer289iEq8+Jgnxv0TF1o8dTUNqnz7SgRUdVzRlMrNgVWD1ZOTt2gBL1Xtl4/O78Uo3QUIbmXYDZd+JOihy/PSF6QBHZ/o2Fu2w3Az/TBdrZ2NALPIc0zFuIIyhcCyEdRCcSNNk02yB/ZQ/6Fk9RN0bv8PnC/bSHjQ02yAx9D7e2tUlEMhpqmrIrqAX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU9ImkQS3p72Inan8dmIXDlU8czeYoa/HFE1AcJWvWc=;
 b=JplZWJxTyFRM9YHDgcYnG1WoZ1pswFZylXXseDgGTvxwJEvVBWNo7CJWYXdZmynxB9dVsHEVp89ljOKsu6SNR1WzRAioyGPErBbfcBmD6Mz04hRCbCF6mvbwbV/961wpzHGyLk/8kvx1axnZZjcxrwzSAu0412LeojlUmOt9fbJO0zK5bnD7WyeBQdaSyPjJG5hBihxaXxsf8aLDUFTL4CsbmjMsIp0bin4ZD1WoSO7HW79jsABM7eUGA8sRXExU7LsSjepQad+0535OmF2sR7VNB1Ej2pA0P/qW5nqnQ9slqzW/SUh6gasuOpGEURJnG8q0lV6ONjje/idvL4Qa/g==
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 13 Jun
 2025 16:35:00 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::37) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 16:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 16:35:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Jun
 2025 09:34:46 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Jun
 2025 09:34:46 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 13
 Jun 2025 09:34:45 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>, Shravan Kumar Ramani
	<shravankr@nvidia.com>
Subject: [PATCH v1] gpio: mlxbf3: only get IRQ for device instance 0
Date: Fri, 13 Jun 2025 16:34:43 +0000
Message-ID: <20250613163443.1065217-1-davthompson@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e05159-13db-4c50-d66a-08ddaa983db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zrugr9MpJq7BpgU91MXv7WRskrftMY3l+OktgHVK0DpOV39VDkD1CcThWpkY?=
 =?us-ascii?Q?e3iAnhFrYw7SZxwpl9kMpdqH6zA0tk2R/a54XRMCPVTINsCG6Vdyaf8t18tB?=
 =?us-ascii?Q?y5uL1hly6/VezK7r9AR3EWj1nKOg3upRSv2H0K3VYKZnUdPuv1RJDqXfNix/?=
 =?us-ascii?Q?EGcILqRm0cBbqNWoVrnPwEdaRuOhT7p4rXYPHS5N5C5l9W9uIkMMPboeUCHm?=
 =?us-ascii?Q?2VVQF8hRzmZmFB6/JWfyaKs1av8yKCnlLrd7JaGVWnqp0o4Xrv2H0ML203Lb?=
 =?us-ascii?Q?51K2X3iIrtXD/RdkcTGqsg6dhaJd+TKTVVdyvlVd28sPdenJ89MhiVy/1CCG?=
 =?us-ascii?Q?WQj2WK3MUp7trWm+tc+qSFcT78fr5NQjxShvEEFGtzi2tF9Frv8T/3HVEAv5?=
 =?us-ascii?Q?oqrkPG3Hkgb/yUCbobAxytyPkwYFdfrarnUKBnX+1YNWxWvr/ZMaAyrU8Gmm?=
 =?us-ascii?Q?9934Haco+sQ4dMfMVjvi53P9fCA5FRrz2u0P7eaylgSEdpfg5TxuXNeIYsTR?=
 =?us-ascii?Q?Hr6rnw5zxGhCVh4HRTEo96wDJyFjPcH/LyZ76Kl8/dJqkIKUntOQV1Trz8FV?=
 =?us-ascii?Q?0zHDF+TaevergN3CqipnjLwNd1540ri5c/fZMDcXrrZduOCtzDKCucCIoB4h?=
 =?us-ascii?Q?PS72HSV+H8vynw3Uzr5kFKUQjDzXdGBQKrJdC5b1eMDvzF2dH8UhXzeWSsPI?=
 =?us-ascii?Q?jWCiXTRgCqzC7MGK5n0r2oHu1ro/+1Vsst95NySYhU8w/SzBNu5ldkiE2bTC?=
 =?us-ascii?Q?SFo1XGwZX2e4RQxEa2NK1+Fv/QD4SnqXfTJ5aA6qo+q8jIT0rP6JUoqvMoJo?=
 =?us-ascii?Q?LIfNrfpugbbhjm3k5Hz3D/w9HF8hnjZmxTho9IPenkwJUvkPmeWGgw8k9lFy?=
 =?us-ascii?Q?/uhiKceG1tuFjVPmEWNsFJLEE2lIqcdGPp8tgqA1appoCNOyCT9ehF+/Bnqu?=
 =?us-ascii?Q?4a6mRhf8nDlBWtm4pvQgFYfoiJyQj3G6OTmHqYMNmJLiETJ6DSaIuFhgm+GX?=
 =?us-ascii?Q?EJGdC/ZED/u3hx/eGTSMQlz1NbaM+CgGnkakFhUjMMwN7bhbrWYCYuBQMl3n?=
 =?us-ascii?Q?yNi+oIjhsIXuaYeFzIb0zR9CVuf9/xgPuYSB7TVToBhBmbZ0DIjPcfDzEvGT?=
 =?us-ascii?Q?0149Vlz8E478MnYC5rUXS4gHVYyurVXx+gc/3YI55QePU7IVJZWeucBtAJU/?=
 =?us-ascii?Q?E8HD29Wd6tn5jSefHArmnGWfPuOnFF5TEAYIfMdD3qXZzZwqL+/0qdQFJ/rC?=
 =?us-ascii?Q?aO8niGqtzm4jBikubB7TY6yAR8x52mBD2/xL/AlCLW6EJzqgW/gx7cOaOPKR?=
 =?us-ascii?Q?L7fLuGWrbeaoACbWo/it7CKeZpPzgkcOkJXI8S5Gul1gXxbmzt0LUBLih7ns?=
 =?us-ascii?Q?m1mhfFk8B14xU/L3II7cusmZCiOwvrr1r+ljAQ59XixMrULGpQB/Yvn0Y3lX?=
 =?us-ascii?Q?M+sNSJ4TX9M9R3vMoJx0G9ru9uwFsnip2lb/DaEUFBYp5sydhdIptKjOGLWA?=
 =?us-ascii?Q?CHNoBjpmdUdAo2W7/ee+dlSjF/ldn2qISWHV?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:35:00.1922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e05159-13db-4c50-d66a-08ddaa983db1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357

The gpio-mlxbf3 driver interfaces with two GPIO controllers,
device instance 0 and 1. There is a single IRQ resource shared
between the two controllers, and it is found in the ACPI table for
device instance 0.  The driver should not attempt to get an IRQ
resource when probing device instance 1, otherwise the following
error is logged:
  mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found

Signed-off-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
---
 drivers/gpio/gpio-mlxbf3.c | 54 ++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 10ea71273c89..9875e34bde72 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -190,7 +190,9 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	struct mlxbf3_gpio_context *gs;
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *gc;
+	char *colon_ptr;
 	int ret, irq;
+	long num;
 
 	gs = devm_kzalloc(dev, sizeof(*gs), GFP_KERNEL);
 	if (!gs)
@@ -227,25 +229,39 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->add_pin_ranges = mlxbf3_gpio_add_pin_ranges;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0) {
-		girq = &gs->gc.irq;
-		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
-		girq->default_type = IRQ_TYPE_NONE;
-		/* This will let us handle the parent IRQ in the driver */
-		girq->num_parents = 0;
-		girq->parents = NULL;
-		girq->parent_handler = NULL;
-		girq->handler = handle_bad_irq;
-
-		/*
-		 * Directly request the irq here instead of passing
-		 * a flow-handler because the irq is shared.
-		 */
-		ret = devm_request_irq(dev, irq, mlxbf3_gpio_irq_handler,
-				       IRQF_SHARED, dev_name(dev), gs);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to request IRQ");
+	colon_ptr = strchr(dev_name(dev), ':');
+	if (!colon_ptr) {
+		dev_err(dev, "invalid device name format\n");
+		return -EINVAL;
+	}
+
+	ret = kstrtol(++colon_ptr, 16, &num);
+	if (ret) {
+		dev_err(dev, "invalid device instance\n");
+		return ret;
+	}
+
+	if (!num) {
+		irq = platform_get_irq(pdev, 0);
+		if (irq >= 0) {
+			girq = &gs->gc.irq;
+			gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
+			girq->default_type = IRQ_TYPE_NONE;
+			/* This will let us handle the parent IRQ in the driver */
+			girq->num_parents = 0;
+			girq->parents = NULL;
+			girq->parent_handler = NULL;
+			girq->handler = handle_bad_irq;
+
+			/*
+			 * Directly request the irq here instead of passing
+			 * a flow-handler because the irq is shared.
+			 */
+			ret = devm_request_irq(dev, irq, mlxbf3_gpio_irq_handler,
+					       IRQF_SHARED, dev_name(dev), gs);
+			if (ret)
+				return dev_err_probe(dev, ret, "failed to request IRQ");
+		}
 	}
 
 	platform_set_drvdata(pdev, gs);
-- 
2.43.2


