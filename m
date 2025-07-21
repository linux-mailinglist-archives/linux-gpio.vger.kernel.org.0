Return-Path: <linux-gpio+bounces-23595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493CB0C842
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 17:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 971A31C20F83
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42372E06D7;
	Mon, 21 Jul 2025 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JIIB3Jnt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BCB1F463A;
	Mon, 21 Jul 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113339; cv=fail; b=TpJoF8SZqxZfRtE2SajNaJW9H081CuE27zoCLxXuYisJG/dvd9Bp01a9Q9VQajrvHZON1nv9Ac86biXlvWZn19xTpjahpGklkNMU7Ztz1N7Ebbi2pl6afSQOwOREj5rKdYbSdta+6sumhPu6Upp0oeUVCa3If+O6V6KR8owtMNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113339; c=relaxed/simple;
	bh=5YHna/W10pKLFeBLzS2gcO8flYdLVC2fFL7hyESf/Fk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k/cUI23VP5g9l0U9w8V1uKtEI34swtxMA+Y6lJY63CZqepmwshc9KsjgqkWLR72QUVXeFArj7lUdGb0QZwIRIomFd16thStitrC/xeAlsu4UU82kvr5vdqAuHKd7GqUIiGeDHCz/IOiDyiyVQAdfHbD1/4Wk95BCffHelbCfqh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JIIB3Jnt; arc=fail smtp.client-ip=40.107.236.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRYT7T2jULTkWmp3U4Cl64o7kqTSDpQv191xZTU6915FKJvGgkHE09hajepu2Nuzs9wK1jGQeJXEc+l2YVRi/lbQYRiuEkrgZPLM+hDx0Pdc2+LIRgpdyiekYL6sJFFafaG3IeJDDQ6Z6ukCA1IuKBiooWlaoBp9wn8y1l0DpdtX3e/vqg9xM51+GJKtcICHdRBXprlAcItND0ZYMNAfR6W5XNN670a9Xees9TZR2qW7Jz8EvGXXqc9fkVdER8RqWOyrnntOG0NR91PDUGuXzZ5JduEvGUxXVS1HxeJ/qWdW5GoYQzvXfpSo0ImHbIl5M3laYIdhUyZEAv3kZF+IEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWHSuwOFrdgjx3K5IttGX1pOaQjunMjAVyC/80rv4v8=;
 b=lQJxRBKB9Eljuqcl0xg34O0F3H25sD9r5Y8CrrPo5vT7hcFbVvmVlf6fI6X8BBR5ppRAl3fPAZ6HFVEKovZc8EFhAAe1r7Etgm/HeBaW8fe3u7HKQgag0etPcT+AVVqIU5XGMC8Y2lVc+vuCvwMTwhqZdZuAZhmuSnRhOoTDCeqprgYtE2jqAztqGB7nj44R4IX7mf4aiMPbYPS7D75HUOn1CJcbuh9fxHtkE40VmE7kNYer236BhsTq/bhEytI/+JtVlhgfaRMGKMqE1nP3JlDOcWrqG+C562W4ACMIwxphLOe3/SfMw/Euw5x0utz26YDkjyQoH6buU4iygxstNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWHSuwOFrdgjx3K5IttGX1pOaQjunMjAVyC/80rv4v8=;
 b=JIIB3Jnt4Q0S5Rj87YPDvid7QhUK2fFEoQZ3c/zGgtUVsHej6O2WXPypXBf+awc96p4WYHK13Lcwqz5PMTQ5UN6uv1I8WCeDTz+/pXvtJdilRLx7VdBjO/WmyLtDHxtjR+g/7j9JfS5Nq5ugB5Ik6aFR7fPwLAZrjb+6l7MUOq/AxJ2VhtbJhee1ijcm00Ou8gRXUe6QPtWw0ZmDnRDiATy9KSHZJQSsKcQ4oPnXsRh4Jx8QaGnX5bGoKBKjR7mcpqsotKxFK3ik1X69FFfUQA8NyaQWT5jPAGA9q3q6CppsGftQLjY0NHdLBWXpCyuZYn0KsNK5CrgUqpPXZ94D+A==
Received: from SA1P222CA0083.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::21)
 by SJ2PR12MB9237.namprd12.prod.outlook.com (2603:10b6:a03:554::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 15:55:34 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::26) by SA1P222CA0083.outlook.office365.com
 (2603:10b6:806:35e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 15:55:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 15:55:34 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Jul
 2025 08:55:18 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 21 Jul
 2025 08:55:17 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 21
 Jul 2025 08:55:15 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <davem@davemloft.net>,
	<asmaa@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, David Thompson <davthompson@nvidia.com>, "Shravan
 Kumar Ramani" <shravankr@nvidia.com>
Subject: [PATCH v2] gpio-mlxbf2: only get IRQ for device instances 0 and 3
Date: Mon, 21 Jul 2025 11:55:13 -0400
Message-ID: <20250721155513.29636-1-davthompson@nvidia.com>
X-Mailer: git-send-email 2.30.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f7d32e-1587-4a28-1967-08ddc86f0713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?24f3Mozaw4hG2lqVgh1NjX7X+5xFRiXQBLch+0bI4P9NtSYmYOSe/MCMB1nO?=
 =?us-ascii?Q?MooLr7Tg26vSB22wDBBoQbkX5pzeAmGkrlohePJz7YbdzLweDH34VJQlqszc?=
 =?us-ascii?Q?XlM8NUXS77I2Hk9lTwr04YwIz31xyQwkx8fNIE1qILPmEFkb1ikgaJZSxKih?=
 =?us-ascii?Q?KTeYWzDk1XmqVUL61D4tB7UA6tyWdYtzeNYVjNobkWMyxytzmzby3JwWJrGt?=
 =?us-ascii?Q?Sklm+0IbN6kmaFkN2SPxyUxPlzbCGXECFedbTSWn87IdAGZV2L1byx1rNRSc?=
 =?us-ascii?Q?ddCLeBB7w9YOXaRlHHZy5YIp0PVDAQBcp+pziNFNuU3DfMa5+Vh1qQBqLWyO?=
 =?us-ascii?Q?nh46xCgcmn97oPbDnTfYLD4o+JiUFL1Iu3AHy9y0ImC67WArv03Dzv4rnVwt?=
 =?us-ascii?Q?4TKXjrrZ4BI/XIen15EQZAXFiI1TI3ymYecUe4/w2srAWbXUc0o6XfO31Evw?=
 =?us-ascii?Q?eDp9Umrtzq1HqBN/3G+3EiIGG+JYerZ+CWwgJYoqJuOZ/DHCxqlnkGO7b8D0?=
 =?us-ascii?Q?e4u1Wjfk6iHmANpBLfdngdcfgKT2woPTaTtUFDCfNWLYmZAWgDTYV30KKjm/?=
 =?us-ascii?Q?yjaq8mMkkL7q9PxKy3nov+xh7N0Uq+4fZN0U5+WGrXFnFX2fNNZNPtJgGlEW?=
 =?us-ascii?Q?IcyDUCSsR8KAK7bwtFKpejNzgpfXwPeQp/d36q8TR/kHxJgimNiOdZDGSB+F?=
 =?us-ascii?Q?QusZqN6ZGC5q7oRI5cPDGvx6iOACH7D4hOPqBnIkCnMSfQxxWXr4ymCXboid?=
 =?us-ascii?Q?xAbfbe0E0f6BqdqAY3izQFLjvT6xIRcYv7WdYd9TNBMmIU0ZWnz3WEG65QwV?=
 =?us-ascii?Q?jfIwFwx+irl58c/STSiKn0dNppza1aahJkk9XSXjpwO7sSNrybmAS/EvDZx3?=
 =?us-ascii?Q?nCJtm0jVwNKwOIY+6LncLz71VCvc3hbQS7U5OX/V7pBCQNZm/4N2/Lo8hBxn?=
 =?us-ascii?Q?mNnnro2gAQ84qiRgkdXLyh7mmByaQrup1GIThgexQiLOLaLkbn/mcDrc04ML?=
 =?us-ascii?Q?y9DSaSc3/lPxZ843EnC+KhGCNt0vlutWi6rxgPMuML/Wifmw+0GkMmEC2lH0?=
 =?us-ascii?Q?ZHzRDue1C9TsQIT3bT4XbbP5IJARw+WRABYkp2ucF8BIICsAnyT2+M8zaI9Y?=
 =?us-ascii?Q?1XQhgWHiiKkxgatH2T/Z2Zv+d+zb6yHxro3c2r9NumGZ13MOeVCAz6UfZVPd?=
 =?us-ascii?Q?r01m5+YuixlG+68Rm1xLnxndCERSUetCxEAZSnDUBpsIegyYY3oCk+DT4ddW?=
 =?us-ascii?Q?NQmcFb5riZnvwmg8nZlret1n0HUgzHN4wwDjWabZjwq+nZ3+qBKQopYP0BgA?=
 =?us-ascii?Q?SzDvrJbloiATB3/7BYQoR12wJVNjcz9ASZ6SQn7rLBUKm/Spuk4bd6SqBD6X?=
 =?us-ascii?Q?H5aBDMcQktsU5S13FP6WDsNI0aNdMHcAg8acHTnnF4ImDT2ayuJ+vAPDGgC1?=
 =?us-ascii?Q?ev1OnbLZMeYETvUgZiru9iG7jWBWIJ9HiG6tPS7629XW8QIHQE54nh0wr2iq?=
 =?us-ascii?Q?r/rQL6Dw2uXgk79gE6XRE1ZqxkbrGjEmDdmk?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 15:55:34.0492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f7d32e-1587-4a28-1967-08ddc86f0713
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237

The gpio-mlxbf2 driver interfaces with four GPIO controllers,
device instances 0-3. There are two IRQ resources shared between
the four controllers, and they are found in the ACPI table for
device instances 0 and 3.  The driver should not attempt to get
an IRQ resource when probing device instance 1 or 2, otherwise
the following error is logged:
  mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found

Fixes: 2b725265cb08 ("gpio: mlxbf2: Introduce IRQ support")
Cc: stable@vger.kernel.org
Signed-off-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
---
 drivers/gpio/gpio-mlxbf2.c | 56 ++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 6f3dda6b635f..fc56ac81e344 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -353,7 +353,9 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	unsigned int npins;
 	const char *name;
+	char *colon_ptr;
 	int ret, irq;
+	long num;
 
 	name = dev_name(dev);
 
@@ -397,26 +399,40 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = npins;
 	gc->owner = THIS_MODULE;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0) {
-		girq = &gs->gc.irq;
-		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
-		girq->handler = handle_simple_irq;
-		girq->default_type = IRQ_TYPE_NONE;
-		/* This will let us handle the parent IRQ in the driver */
-		girq->num_parents = 0;
-		girq->parents = NULL;
-		girq->parent_handler = NULL;
-
-		/*
-		 * Directly request the irq here instead of passing
-		 * a flow-handler because the irq is shared.
-		 */
-		ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
-				       IRQF_SHARED, name, gs);
-		if (ret) {
-			dev_err(dev, "failed to request IRQ");
-			return ret;
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
+	if (!num || num == 3) {
+		irq = platform_get_irq(pdev, 0);
+		if (irq >= 0) {
+			girq = &gs->gc.irq;
+			gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
+			girq->handler = handle_simple_irq;
+			girq->default_type = IRQ_TYPE_NONE;
+			/* This will let us handle the parent IRQ in the driver */
+			girq->num_parents = 0;
+			girq->parents = NULL;
+			girq->parent_handler = NULL;
+
+			/*
+			 * Directly request the irq here instead of passing
+			 * a flow-handler because the irq is shared.
+			 */
+			ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
+					       IRQF_SHARED, name, gs);
+			if (ret) {
+				dev_err(dev, "failed to request IRQ");
+				return ret;
+			}
 		}
 	}
 
-- 
2.30.1


