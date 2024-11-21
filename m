Return-Path: <linux-gpio+bounces-13182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4D9D4F44
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 15:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B80285F30
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2024 14:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05321D9350;
	Thu, 21 Nov 2024 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="X3U22K/j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8D1D9353;
	Thu, 21 Nov 2024 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732200924; cv=fail; b=g9s6Dr25C+uX9mt+x57+angbi/dd+igLp30YMj7IGzdaJF2biOdWyeYS2daKAOgi2SjNkhJ07c8xYZ+qt50nZPMzgLgiY6dlttImiovIwkM9KpYCE42pzztlRx6cvTn9164AfRGw1gfU684OdqmbTQh4pwnW8tQmaGqVRQ4GTu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732200924; c=relaxed/simple;
	bh=qbbLE/P16iIU83ZWFl84rqzkvoBog7xHmDi9+aReTV4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=p4h/HqJ8FDXTSrK3R0aRG5iv66k9rhWkvrpkdtvkrXlTF2TDIAnnSPNh5CrWQBpPT1Gi/Gcx3rjE3IThmzhvy1hoGCiTXI8lOnqQWbhhsMuOHXWL8Rguu1qJ4fDzze7IJSbJi0sHQXgrlez+VLrD7iEx3hhFQqn3hO8t26CvKXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=X3U22K/j; arc=fail smtp.client-ip=40.107.241.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9Fk4gthF/GmAqN8Kgsp6DHsMHqUsK4x6fU0YVYe9OIrccmAu0QlDS0/KTei/F9l8vGQv86g7S8QlFhjM/kAzjL6Ecua49zLKfpHzz1pQv7XKO4STDngi36NFZCxWTVFc2rSgfMTXC0rqQOPdms+Fhkb0TySGbQWwj7qMTi8NMgaydPbc9xAwqQvl4KBcrHFOUOR2KY39cpGlQmFltXENf6UXwC5sqhKE6M18ZqB5kq0T6JFfU/S/xI786MDsjCuXO6OL0hA9VVsKAq9Fyi+OpT36sPnxQlfPKpb+I1LXiJaxAuOfSs/4wqke2QI0J4VUXdVTWjmLAPIDxxVK47I/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZxk7eWnHGvm+0E6OWQeXlgW4JMzzowWCnH8XmuzGiU=;
 b=L6B1NOFaikD7lphxNNP+Z0EnkYcdy8PZL/yTUawMJ8rFOM8r84HrtAV4Vc2rHkCM8M8eiwWAixiCVt/uQ5n0vm3GxElESH4HSSS35P9B4PyGoc14A4/kMj+iRpFdL/Tx+eaCSXFqMaaMWL7M+yLT3s3JgvqR++0sYFtabJ72imZMmLiBeld6pOkFBA3CMRvP5K5L60nt7EJ0/fbFx74sfbQnfqU7Wrf9dqUa0uJGflRJKqIPvIybRDVmwpyyvY+Xyrmzrg36caWnFCId4P54tDcQp6leno3FSlxBAQ+RVqPpz+GfSWEKK7mDgstiTfaa5CenKGRGjRQ43YxmUC3LOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZxk7eWnHGvm+0E6OWQeXlgW4JMzzowWCnH8XmuzGiU=;
 b=X3U22K/j1WJizf+J76H5kn6zur1cgAhvK4i2laq+g4KkGcMmT7P0BjljjfdGbWcJb3DgvFsoRqfyl0bjkkM92GTXvq0qGWsebiwK1gtotr+L3djp8ZMTkAMFnLYE6LqjF5lB1YO7nLjWIfF53BCd57xw6yobZDPUx7wTE7FLFSM=
Received: from DU2PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:10:28d::17)
 by AS1PR06MB8588.eurprd06.prod.outlook.com (2603:10a6:20b:4d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 14:55:19 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::f8) by DU2PR04CA0192.outlook.office365.com
 (2603:10a6:10:28d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Thu, 21 Nov 2024 14:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 14:55:18 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 21 Nov 2024 15:55:18 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com,
	m.felsch@pengutronix.de,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH] gpio: mxc: fix warning about static allocation of GPIO base
Date: Thu, 21 Nov 2024 15:55:15 +0100
Message-Id: <20241121145515.3087855-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Nov 2024 14:55:18.0405 (UTC) FILETIME=[61749B50:01DB3C25]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|AS1PR06MB8588:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 92f22076-ad22-4901-eb41-08dd0a3c8430
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nDd/7qVm1lJXXmUDMOoe3RTQuPtXturPjDHMzE2dlZIELbneRCVwJ4tI1Nv2?=
 =?us-ascii?Q?SzBKLUKZeoh+PtDuWvUTNHOQwoWq01WicQWPNOaiBvMcdU5tRwVtoGb4Pz2k?=
 =?us-ascii?Q?zNK2XgbxbOYhEbszd+zJJUxAOrdUoaiF7c5P7aWEecwDhTNhZoPLRkxOd+Ll?=
 =?us-ascii?Q?IumIpV/zE4LIJLftGzV8dYnvbSsWbplBNkjhXO+qHwcPK45Lj9dYYKSonLwr?=
 =?us-ascii?Q?2+gGBJghPkh8vpqa0+t+BlVhWoWxMzSZldrxFGlwdgKZnQ6q5jMtJKe2gspT?=
 =?us-ascii?Q?JdWXiyITUYU3yX4M6uizXOgVr0ZmlGho5vlB/BfF/jzTpR6TeayHQA6N3QTB?=
 =?us-ascii?Q?gxgir2jr6gySaKIdQ7CcRZu9X+nGpvhuBKJZsy3p+pzK5t5IeUNWq42sv6Nc?=
 =?us-ascii?Q?s5fiVboc+kL0814QAL0epJw2UGRovwhLdY9XvUBVwwKWLxvejC4u8yCKxihC?=
 =?us-ascii?Q?lTF3Q4M5Y4Zah1oSCFEVeNak33adur2v5uckTV6kcQrCUrkXKkH6afCoHrVR?=
 =?us-ascii?Q?TJdMeXtDKe4w2lkjaUsDc+U18B5Nv3qDU8YG6ag1dlbex1M9KKhdrFiHZ7i8?=
 =?us-ascii?Q?93lqc9TxrkzKqT5Tn6pC0Y/mp7rhX+FwlIgA4M55wZ6u3LSMpf/Js2sf3wnk?=
 =?us-ascii?Q?+bmmZYr1wS/C2EaYHeT0tl/YRM29LUchqct6fqT2fMYHcER4HNEeA+S3oe+3?=
 =?us-ascii?Q?iMp7iaT+RTEwZ38QOhR534Hgw0CI6+adtfF+hJVh1JjiXQlRqkS36VytGkRP?=
 =?us-ascii?Q?Zn63I/18aUzMSFxYg+diE4WOt8IFcIqAVMgxzS87eEKQ8s0GOW1LkC2jrJhL?=
 =?us-ascii?Q?xN2y6SVQj7yKIfmz/gj5y7R7wgxuhsM2nUzjVZyc0S3eFDtYq0mIoJNUsngS?=
 =?us-ascii?Q?xBJbwb7uvVjspY2cRVJeEqE6zfW0B5CgPuSwpi0CpX0XFzspi2kY16+ohciA?=
 =?us-ascii?Q?KKBaltRm2vblyRhHh2fRNBq6ixVgc77P2RBFfvbrazBk58blJzq4guyUF0D0?=
 =?us-ascii?Q?6ToGkvKj4FCcGhIkDiVBqVkEHta0geRfV2j1xc34q+RmGOaqhknuXb7miMXL?=
 =?us-ascii?Q?Uv5xqgfwGaPZBPwTPVl07TJ69M1bzdTULDKAzmOtMdLwdxTvmVU8YHLdfMF5?=
 =?us-ascii?Q?3PMAouHX1iqfNITvgn9k3dcT0b7+qZqOEOD+K27FqTHQwEJ7jGEa8FQitVYD?=
 =?us-ascii?Q?HtDe1+ZPuw45+oq2BqFXOlb5FUk7lgU3UEs2eBj02w2ys1waai+DgfKaKP97?=
 =?us-ascii?Q?eJUobl7N+OGqzVw3fxqVzR0WC+yOm7saw/ztUaDyCpTesxsl81dGIQmrrQrt?=
 =?us-ascii?Q?1i+T2cVXX1lVfu81a6d/H5fRnNLWWQHPWFhjTKOa3mgD8KndIWfCGOJs54IH?=
 =?us-ascii?Q?Z2pCaIWGUg871otIbsPtoKJObodmJIkdUZb600vuERXn36TbfQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 14:55:18.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f22076-ad22-4901-eb41-08dd0a3c8430
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR06MB8588

Static allocation of GPIO base is deprecated, let gpiolib perform the
dynamic allocation. This is done by initializing base to a negative
value before the registration of the gpio controller.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 drivers/gpio/gpio-mxc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4cb455b2bdee..a7418a4814d6 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	port->gc.request = mxc_gpio_request;
 	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
-	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
-					     pdev->id * 32;
+	port->gc.base = -1;
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
 	if (err)

base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1


