Return-Path: <linux-gpio+bounces-23599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6919CB0C887
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 18:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9AE81AA7FC6
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99C42E06EA;
	Mon, 21 Jul 2025 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DI+vKXbA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB51A3154;
	Mon, 21 Jul 2025 16:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753114965; cv=fail; b=uzeFXvb/Yuy3GO88920I7zgAdMdOWF4VM35k+Xp7RsMN+TOnyzUa/KnTWOfhbrkS/GNgLwcpPu2OWb3aIk1tluwv1WUooN3ZWk42QtWtNOaiQdE479FYese7nw0/wsEvxCYvkoIFOYlLBrKDfAPgCpGoeWHmKa/I+MdLyoQCG7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753114965; c=relaxed/simple;
	bh=ZPsbpab/SATy0TjynNfWyHqXjZ7zP4dRfC2yrMH4bQA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vC0DedTO4oDAO7/HJy0Pfb8zce0Bv8ineccva8p2Dbb2THnuBqQ7Ldgl7Is5AjvRvDsDtfa73Hc6emMOP0HmZGCBrUDxPgHLW6fvX33R8yx8vuAHSng8g80CH5lLdwACujmHWyhOPBCct0SPesJKG+hK9NmXkDJUdrCnimH24l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DI+vKXbA; arc=fail smtp.client-ip=40.107.223.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUuRm3soB6xP1lpJnIIyl11Wcjp4wlN5uLKEXT74x89xATEdGSR/H1jK4Nt2YlJkE6zpEH/puQmfXKcOWCSy6psCUaINq9mi85lF9SgG5MC2aYDSJHZcDt06kVzN+hWQDZcIYTp2BRhQipp2sinMt0JEW+PiOBu9p2dbrZDbElZ0QbiSUqQxrUnVQKPXVfPWAF7S4uX27L3ft6H6X5nN8wIo3tzBO4PUpAL2Wt3E0qEmLDSlHxAeFZxt2rrCu6Y6MBXf0k9y8tsptnr2Ztum+K6N8Q04RVodaGi/trrDrAqYYF7HzGR5bcwnVmpgkVxi2vMmcqTXBtXW5XQ8gzvRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg6kP+NrdcJ63gG6SNHjyODJAIZrSvFODiWU4W+HGYk=;
 b=f3NpgqSPabYUCdAVNnjNweQ+/kH7f5N/lQWn/BR0SeCl0lNkUJ/HO3PRmCMSGqlPO8IufFmwyWoO+KmCLn8slkLh2JdrkDij8QK1JY+OWAj8K4y8lFAUh+eKMdxk4CdAqo+qFwfarY+Jn2GjqsIHu4smMzq/TnP3oiEiSRg9/79K4hPQRq1U4iBQXrGJfo7adXJ/IRcQb6jWpz34AYlmHcthrYwy7YHG6tnlcqSfmzhKBPJRi9qPTU/olCOVGUxdJQ4oSXyR8dR1LznAnu+NQsJ4i5o0NWsxpK0y7ZUGJeuXmZYiRE114TNWB0slal8F3dhL0KP3heXL7jbAYn8uNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg6kP+NrdcJ63gG6SNHjyODJAIZrSvFODiWU4W+HGYk=;
 b=DI+vKXbAbtHgVz9rEO9jV5p04IPXET0bICdqZs8rVjm83K3EJ6QySuY7dNomOvvg6MpDy4b+M3VsGi3oYhTr4aLn15n5p5y0yOwEx4etiJYNAex4JzhqJW1OZfj7MhNV7HNzKo8og+pSaGrVw5Hr2P40r8hPAwtmIe1cAYRuwLWT72NIbSPlSjnsYZkGW3xvJGVc2qnZljkf4qwEImnCkofOe5vEbhfnubcUEwCirY/XMsO4JbtW9efV54VQ4qFAzQplwoCy/PlSzF0EKdz1G+q6eJLaK/1rYaVyLGjbSbDKBfBruvDSv/j7irZtTcuQ/itH12NlB7zRFkFCU7DZCg==
Received: from MW4PR04CA0275.namprd04.prod.outlook.com (2603:10b6:303:89::10)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 16:22:39 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::60) by MW4PR04CA0275.outlook.office365.com
 (2603:10b6:303:89::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 16:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 16:22:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Jul
 2025 09:22:18 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 21 Jul
 2025 09:22:18 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 21
 Jul 2025 09:22:16 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <davem@davemloft.net>,
	<asmaa@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, David Thompson <davthompson@nvidia.com>, "Shravan
 Kumar Ramani" <shravankr@nvidia.com>
Subject: [PATCH v3] gpio-mlxbf2: only get IRQ for device instances 0 and 3
Date: Mon, 21 Jul 2025 12:22:15 -0400
Message-ID: <20250721162215.30327-1-davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: b34ab125-8796-4597-45e3-08ddc872cf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s1FPxUgYU8uS3xxc4wetmSuA+F88lH8HPZXROSO0opJMofXOLzymYeTKF9Uh?=
 =?us-ascii?Q?6IIv8qxCV3urHg+rJRi42OeCFz3VBFSpI11bhTSOqzZJ0bWSGlL3cZ21GluW?=
 =?us-ascii?Q?DcKPHLkeCqvXIQLxSH8gbAS+F0iSmcKyRjQbLJHlXPToKsaHNCjVsCfPBwO4?=
 =?us-ascii?Q?JYRIPcgcq0v+ANAj5iBL4HWADsUk8+fekFUH/i9DVUjW3er4EFQ5KWXQoupy?=
 =?us-ascii?Q?aVLCtZcikqcuRNdUFz8Hlvf5SOCtvMNJR7CKizSzEtVhLWGmo/GY/Bz6VTBK?=
 =?us-ascii?Q?YEo4/8B06KqbHZiMlOqpLR8WcxM9l6dG2+g11J+31zTaahYU1iv48nrrCuW/?=
 =?us-ascii?Q?Oywdk2wt+IVQ5sy8fgo4ShZYBnnFGQVN3yF0sb3aZZgXADYV4sXnLlIwyb54?=
 =?us-ascii?Q?M+8jBaF1wAbTRt2HnDEL5AfDA48EbErlLXzDHr2tRtVISHZnuwLq/17SudWA?=
 =?us-ascii?Q?2rbdNPDNFuSjif0SL55++56PUu+y7yjggUBA17olMdbiQGKKCBb0WorMRBGk?=
 =?us-ascii?Q?azNB/5LiJZWbFK7AW+HDQzH+I44AoT6pcFbSV0aGZs+edRakdeKGHUWLfZN+?=
 =?us-ascii?Q?X/ExXtwXkDNVPnjFTLIXBIJ0oI945jw+AhMVZzuPWlBjL5alJ+rytzVu6khy?=
 =?us-ascii?Q?4nafpRjeft+43SMt5q8p93mYQAS+DyWkGlk5I4H4msRvIkMAvfmjFy6VKL/R?=
 =?us-ascii?Q?N6fij2wz2/ePFc9IZ2pqjtjduoSoC4EbHlR+ToBvP2z5dnRvaobhxeS6ikOL?=
 =?us-ascii?Q?qLC0y+zliXkS7AyRMJOYBL6/5d2xOwAZkC2zTeSyGpQQvuh1NVAeuMUruIns?=
 =?us-ascii?Q?iP8S2xvqv0ffBdTdahZsgh9q5UWqNecTwk1C6hv+6j5BJnA9JNqaijL91z7m?=
 =?us-ascii?Q?uOsHFRJAXT68rJ+pA8hcfDvwYyfOF724WXWezatSUbM9+Kyj5SABUf/bLdVW?=
 =?us-ascii?Q?uJLGwn9Q1ZIau4qoGPY0+rc227MClMQGdlZ/3GEmljplQNfps1KhsCQUOG9t?=
 =?us-ascii?Q?cYBHpLai7aN1bqEesdrytzufG9leJUHSxI0F5PoTSJ6tHiiWVV/HjD+Y3+MD?=
 =?us-ascii?Q?XL1oqBZsq/Q0NbYDzPau1gqWTEAh06hGkICjfEayP5WitjKqMyq1enpl6q3R?=
 =?us-ascii?Q?m5FbLZXPRJnZPL9QjrkEPMVU7p7ky3LxIUaxsxgc4i6o5d6Lj31CTHQBcUuW?=
 =?us-ascii?Q?AsUAxXAY2NRRySyZLktZuJE0v5QP2O2d8sW6rNNZmMdhVHlRbVIDUkEparEb?=
 =?us-ascii?Q?68J9uU3zUaSnWDhMki/kWtNU7XC1elj8j5YmXb6bF9jl1StXnoBzGfTpI5uZ?=
 =?us-ascii?Q?ZDFmppvL1uxlNpT+CojiThBf+WoDQ36/amOmjlemKTTWR3FXBbVw8lROPdyb?=
 =?us-ascii?Q?DgCbSFKiFI9eCTvqqAhBJ+Ut5Jvx/tcL1sqNgrX67IGCNcdsig6CdVV2vdEX?=
 =?us-ascii?Q?+FAxIv8hCL5OgeqLmHy4iaWUcCY7ueakD77hW0sZXG0paBbetp5mbL+EWGB3?=
 =?us-ascii?Q?teApWJCuCgaKfn6ApMba+HqwpRoIzw/bxmxb?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 16:22:38.8773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34ab125-8796-4597-45e3-08ddc872cf7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907

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
v3: added version history
v2: added tag "Cc: stable@vger.kernel.org"

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


