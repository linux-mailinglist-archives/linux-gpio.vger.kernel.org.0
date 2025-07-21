Return-Path: <linux-gpio+bounces-23594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8809B0C7B2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 17:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F10B55434A4
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE66F2DE6E7;
	Mon, 21 Jul 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dS5L1Tre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40CB28D83E;
	Mon, 21 Jul 2025 15:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112157; cv=fail; b=YXF1A4Gyryy+PGwc7a0Kl41+XgeYldVbTfFTXpWxh+jgDU7dODezxhzt+4Cm6L3LDDmLdvGS/t4D6Z2PDKEU5xpjQcEVy/13DB0aG+UoTyWV8uekc9k10JeyRrGnfu8mVgB2Jpo5Yjsef3PEX6RGeVUJRBSufTKYtlZiTWr9SSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112157; c=relaxed/simple;
	bh=94NO7tqubPQhhHjxExiyWr2857FyFTZhwK3bvsDMIGo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oBgENd5lR8esOpIrPDFVXSBNyXkuRNN9onNeE35jYYkiMu6DN1mSVXESooa5GaO9ZlEjsNKCopa6VeXS2tpjQI9CEOVz9zgLvo4936uOncNfqf1Fkx8LQ2u+ilbUGyp0pXbyhm6qGiXo7qelZJQVFPLrhU4ITBCa0fNOeU3S28k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dS5L1Tre; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FplLtxfPSw+SoSpeK8zK/KKtVvnF1gLZoKFLqgRgfMck/TSiIJwJ11R8hwxuNWQqFUdqpuO3Kt+twUa9tFGvPny3mnmLu6PWsv2MQApWdHKztokcHxkevaVcYEU0yHGIdLib6vgKyoWZy8BDkmpeZmjJFzc+XomGChaRPtwyytX24Yy1M5EZgGI5PYY1nqdS19AjBV5WfPPokthP9kkvckXk05flGhCfhphPsY1ytsySHoVdHRguHqrtQ6Z3PvAM9RW4BpqnaS+l6xZOIq/nft2lOr3ZCgMzm8iw7kmhePBhkIlGZ9p+IPD0xg+SpwGUiU30G/DdTgUR7Spop8UYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Jc+X8bsZKaNv94NBjwT2n373ZWARbFW5jFq9el7i7c=;
 b=QTG+fNP1o/dIhHlfMKsY07PeX3rTCR620j9a45LjSUHYBXlvYH/030mgbW0VRZFWOjzwYIvX0quoyLEaq05/CadUn36bctpF2tYAXAlLIlkUAI4oYNyt3wEMX+IGjbZefjD25jsFH7YkQJP4kdfareiJ474YMucn0SfE8Lu+w6OTTNVd1Ji41aFv6LBT0FzUgK7Qvea7DRXjrgtd6MudsdqjUlkjgN0QNN+mRjCbRyG39MEKNfUo3pYQfqpqbNYuuyK4JT3b8lqbZDcSp6VQna+IqVayrRB3Di6ePL2ttTTdQqoA2VydZR3XvH9LkoXSkULIXvR7k3Zao7wzl23ayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jc+X8bsZKaNv94NBjwT2n373ZWARbFW5jFq9el7i7c=;
 b=dS5L1TreLnAYV/ODF1YPTaHB17M4drcDbuSWKlnPWk+vBARLoTmB9lj3/+7dcmUtnj5cl7bbaHgskLF2e0Nt45wVoM0JDRAWACJ3QFWQ7uU75srzBIEta0nqRkq/mm6ynXJq+bI28a51GmZ7R0YyMb83ZAPTYuOvkZh4DLfx4gCL9ibP5PuQDjXdKBgL0zCPp3bfKYS0PGXzlsL2jq0FKUhQK+/b/gzjEM+gkodtxaGYXVExWbnRxgzzMuzXqhC/Najrav4egLpQ3Yb8iLpsTGi6YnozAOWRea7XAArPPyeuBQpsAYxCZ0tRRtbnt4rH2Cu4+5GvULc+fIeRW9TYnQ==
Received: from CH0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:610:e7::18)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 15:35:53 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::57) by CH0PR03CA0223.outlook.office365.com
 (2603:10b6:610:e7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 15:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 15:35:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Jul
 2025 08:35:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 21 Jul
 2025 08:35:30 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 21
 Jul 2025 08:35:29 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <davem@davemloft.net>,
	<asmaa@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, David Thompson <davthompson@nvidia.com>, "Shravan
 Kumar Ramani" <shravankr@nvidia.com>
Subject: [PATCH v1] gpio-mlxbf2: only get IRQ for device instances 0 and 3
Date: Mon, 21 Jul 2025 11:35:23 -0400
Message-ID: <20250721153523.29258-1-davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 813cd50e-6ce4-47cb-963d-08ddc86c4720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GnEOv1jT6WDFFWqGnke3rmYtHTgGUjvU/51Z/nq/IjusFFcFgxxkikGAmIP6?=
 =?us-ascii?Q?sehrZrp1e7lkshV3MNj0rVAsz4BXVNS0oX/bljIsfBJseoE0ufrkKOFxJz4m?=
 =?us-ascii?Q?UZ9kMxtjcvNtxiFOt4msXqNR/fx5SilbfJB6RkqHs0w/0haQAnkuoF+yVd/y?=
 =?us-ascii?Q?2G2i5mLM1oZWXUNaoheUnFJ5fsSyS4N94KY2qIyFDo3nVrSWux3CwBXM5zeo?=
 =?us-ascii?Q?gKTsqmoetaDiuOGwsloqZltmqFJ5QHxY1mFkU4eUiK7TlJpbb66uaOZH4O8g?=
 =?us-ascii?Q?UDP7puRBDRdBltejFP5xh33ugzeveJ+EdTpHl0+PCD7828+fcFOI8trI8FG/?=
 =?us-ascii?Q?mN4Hi1zSd+Psvwk7bV5XHfebTkckv1xQ2201piR4/3ysc7YIa+/X7zO0tbL0?=
 =?us-ascii?Q?rJQMgnkKg4ksjJEeH24mUju5OnjO1OUab8aC9sDVPBWcwXUBtXyY6q77xli2?=
 =?us-ascii?Q?NVxzIoov7XaXpa2bgYRoVrE2Iiy15TTJMuNTuIQ3giBCqRFGWm8NmI9haO3a?=
 =?us-ascii?Q?UCIjLW5ou9qG08fLyGv5uFAmL6lPQHCMs/Y7V4iUlW7Tu9BmlWisHeGGw6sW?=
 =?us-ascii?Q?/Y7RKu98uz+DqbTlXqzwEWTpOZF8XYXdL+3YaaW/459du1Qp6EmQUA9oCD+f?=
 =?us-ascii?Q?7fkJje2RMCZ996/MZD3o91/Q0KiJ6TzGbY1V5TKlbWRkdwXNQZD3+pVKzEwU?=
 =?us-ascii?Q?bKBeOqVRUDz+Yzdv3MYTl/GjkPCe+z/BMZZP3cLyiQYE9QQ3E6erS7+Lely3?=
 =?us-ascii?Q?ydvtWDdttWnHh/xH40iyus7JsagnM6I5IMd/3DaMZ1kkfmlO14IBA7R4jl4n?=
 =?us-ascii?Q?BuFgB25tl3XkXOPEuZfk79kX1Vicx85R+8+inswu4thZBO7zE8GsvAjV8ut4?=
 =?us-ascii?Q?DmurfUhZDci46T2fyrgF1cd62KrQHczAPdYdivzeF0GTrgrud1UrgPaIBLjD?=
 =?us-ascii?Q?B826j5ejQLhpxiC+C37JAU/s79XlQKvVLfQZru9zJ6XFtIoTZ0LrObNQvC1Q?=
 =?us-ascii?Q?NzpNtuhjzoIcvEq+TAQ3Qu0+wqXcS/3TCsQ5hwc0Jr3TadTdFFxgzEFcNQz3?=
 =?us-ascii?Q?yW504o198zXZ6LvNvJPVMmWGz+xj+gvwCCJ+ShdvQ/PaFqHUqatvQ9zlPDnb?=
 =?us-ascii?Q?C8TAQPx5WfWxDWS0yGDL4hXMjLh2chppPCDBOp5TYAVfw+bV3ZoR3ZGbxWz0?=
 =?us-ascii?Q?H1YAzRBWxkC6tOY2gMWV02RHUu/ppW3Dl7iHVffkzHQbR0t0ttNKuz4akCJp?=
 =?us-ascii?Q?428Q4ENsfUnLZXWSDE/WCwmb+ARYm4wHQW3S9pgVUc0HNCukWeMc44qMPJyl?=
 =?us-ascii?Q?uSiM6GiHZivOO3HfuEvs0wGcle4UdT57ACln/2+1gzIwIY9zbD1psCOPHL0W?=
 =?us-ascii?Q?wOGkdYqZWlSTQ7TIN/rf2yARiSstyIg7jz9MR0olfX89M89qhnFP2QvMjmNG?=
 =?us-ascii?Q?daLwnqaRBClqVUqXdpY1NeGJlvS2YviPaNCMHMFCfPo8TMH2D+0O9zQ8J+kW?=
 =?us-ascii?Q?3+D3N+qS1saSmLVouej5VmJeoOO/8wJSqVuB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 15:35:53.0514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 813cd50e-6ce4-47cb-963d-08ddc86c4720
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

The gpio-mlxbf2 driver interfaces with four GPIO controllers,
device instances 0-3. There are two IRQ resources shared between
the four controllers, and they are found in the ACPI table for
device instances 0 and 3.  The driver should not attempt to get
an IRQ resource when probing device instance 1 or 2, otherwise
the following error is logged:
  mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found

Fixes: 2b725265cb08 ("gpio: mlxbf2: Introduce IRQ support")
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
2.43.2


