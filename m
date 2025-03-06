Return-Path: <linux-gpio+bounces-17142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BFA541E2
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 06:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E49B189280F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 05:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1BB19A2A3;
	Thu,  6 Mar 2025 05:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FukES9Vb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2A77E9;
	Thu,  6 Mar 2025 05:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741237574; cv=fail; b=VhcHyl1NrZ4KFdOZUF53Z5tz7T8JntSBllbtarzaxy/aeeX+GRS5hw8PPosfdDy+t2W99SbDoV304lWmy+iSG4fX5jpxwcdJ1vWOy4r5SD4A48bH5aXIQBForER5gtiIp9YeGslOEY7KHue3FrSK16M9oFa3dMlVprqfZuhoRCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741237574; c=relaxed/simple;
	bh=GOtu8rLzXIzkvp1Qqst7rgaDDKmWjLpmNgv8U/OwpZE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YQbhdEhwA9LbVc/gk1H0SVsdAqoP7qvrHSeiBHGqQsS0lekAKbWPCE46nVanVwjz7EgGPpDGB4jHET497G99Kz8bk/siUxv+q109cg2NCeBA4Kh9bVdTdnxOUT2c3MGcSTKgGMYjDQqHRGEghihh1CPA5Z3ZIphKhnKbA9AqfxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FukES9Vb; arc=fail smtp.client-ip=40.107.236.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLs2/kJpVFWPx0LJaXG8mi+SBIpZbO9X0oe7G4QX1pBvFz9JrDTeraaIH0+KIQvGdtNWIeT/crEwBrRBZm1/XlRzEs9dscaF50opux9pesQaRQipXsN0yQQJFSCnv5iqIUJBqo2svx7QKAmKEpToI4rffUIrNG09QpGEfBtZyzZgnSbahzreo4oP9NY053zRuNBv6y3uWsYRH30JiBtd/2btDfL9kc5XbmOk1SsYuKoNMrll6L31mwr5blN6ZzAvAzIgDMTpQ8BASko0o/uwj9xm9/8NZzV4nbroPiJf39hNvAwp//FYx/4/vy0zX/JobFnPXlvpIC2oCBD9Z0DTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJnY6dKTeIU4WwgUS/PIoeuOxx/aSaHuerq5+djuCgg=;
 b=zQkdb1bO5PNE9xJVnlu4MP3Bu2Sbd7qTDRZQamIHWe8/ZA9OLe8SVNLPMt+OsX6wDqpO0s/+ysUBFRoopM3bihsAWi3XnH8X1QzTtOAbgLpx0Q57l+1ot1gOuYw+ljxjDfZzPdkgQWeKbuiFKSUVvCSahZQ0G2wynVPqdwTFt6EAbm1OrXLPz2ODCymho23uN/gYuRiCPA3+CYXsdHd3GdvxW44x0BHRz55IGbBCL9NAhxl/7DZzHtVquIh+jSROQU+IdoRJ+t7eOm9lH7cfFMH45XbmN50qmf9Ajsgc2j2+YKDWUxKtEzpzTuKZYnCjtLnixMaWERWhjqIXur4bHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJnY6dKTeIU4WwgUS/PIoeuOxx/aSaHuerq5+djuCgg=;
 b=FukES9VbYvDaH2unVvuBg+WwnwnNNzs1Yql0fa2u3B0FnSw+swKFyuhikBSsdKpEQGGOOfvY7xxUsJ4kpCV49TGHvH3uAZJfYhuvuEBYgy+1EA3ZovDRMJJxjDKEoFpe2CjUWzy3kXc+6xrTxvedq1pNVSrmGlOKJOXFRfh9DftilM2otR67D0Dz6W+BYfrOUUAaB/buyhSBivVbSR9VIZMNtS7qmeivPnTVnl4TzD8sut7uAuRjWWLORit/GKu3ph8CukBJCTTZPIlH58LuGoOy2kQnku0JDJfit0eysnHITX73k1G78/gjojgdz135EcjwpLnrmfiHl+LMcAfKiQ==
Received: from DS7PR05CA0027.namprd05.prod.outlook.com (2603:10b6:5:3b9::32)
 by IA1PR12MB6411.namprd12.prod.outlook.com (2603:10b6:208:388::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 05:06:07 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::40) by DS7PR05CA0027.outlook.office365.com
 (2603:10b6:5:3b9::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 05:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 05:06:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Mar 2025
 21:05:48 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Mar
 2025 21:05:47 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 5 Mar 2025 21:05:45 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH v2] pinctrl: tegra: Set SFIO mode to Mux Register
Date: Thu, 6 Mar 2025 10:35:42 +0530
Message-ID: <20250306050542.16335-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|IA1PR12MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: c36a69d1-5c3a-4713-1dd1-08dd5c6c9a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dFiw7yJLD6m7Nny/MdnWxFLVtjyhn2vOPTsTGOVmMQcSERtqRYR/w1JhdTaE?=
 =?us-ascii?Q?E9GCSAQXKX6+bVjlFIGZYSvec8RAXN09Ep4Dfxjj6B/tB909RZNaPO9kbTBP?=
 =?us-ascii?Q?ZdxlFacCd/LptwFSWrz3r8G+SyKkxYZB3LmIyDAhXszTqIcbk3SLvG8Qj4zh?=
 =?us-ascii?Q?ZrRMT3cqaiRzRxGmYnidrpFI0LPj+WBCuUCL1dmanwW8LUsTsVaroJ9Oe2mY?=
 =?us-ascii?Q?FRP6d1hNVJj1hRUWtM0CN+PjlGBOCWrESR0+JJWeTNp8a1NBU8XT/n3Ul1Xd?=
 =?us-ascii?Q?TEZ/KHD5BVf5hJsoZJE9j5hQrYFBAh3PSCk2HA2R41ZMlUH3+5DvAJPItXd0?=
 =?us-ascii?Q?w4Vns+Cj5qKEpg3Hn0TiESkwzxk9iwqdyW2G51vy0ccsgFbCWzSnNRmv82Gj?=
 =?us-ascii?Q?7zXPWbRtYveFZhcWTy5P53+EHs0qDdnCQFKCCPPlxKLQaA9zgYsfapwsKhI4?=
 =?us-ascii?Q?n/0L2cx1TLTnr2br5HldOhjF0RGhVZCrp3uxnGrHa8fHDd5LqENxUfdcToii?=
 =?us-ascii?Q?YxbVFfyKUCmuaHLxrt5KxOmtEmbtLK7S2arOduD6vL7A3UhCIatxDE4PGojn?=
 =?us-ascii?Q?Yr1u5mP075HVJ+Gi6ykfJFDNTq/TniAECsLbFdnBb6MdNI0lEOTViyUOBFjj?=
 =?us-ascii?Q?YhjNgaJkMeV+WAj4vzUcZ/eJl2myDBN1e2MZLBZ4V2HXE5doH2jaU+o3r9C7?=
 =?us-ascii?Q?Tye+MpYfth8hSpUHrsLjslAOlTepj9xM5AwAs5RwJj690HBmZbMh9JbJzHKP?=
 =?us-ascii?Q?ZHKxTQcnyFDioEMatib284wpGoTM9tfQ8fbPCw/8jMtowgNnv6MEcdOSVnoa?=
 =?us-ascii?Q?MX4Tru0hvoao6AjrP6EhlHrhAryAiqxhVPMAGt8FTsuSx01XWgy/bXAMxJXi?=
 =?us-ascii?Q?qvvB0FedtAOIniZgYlY6hfmGrdBvFTfoZAVVx9OUz5t2UHyD+EFY2wagRJKt?=
 =?us-ascii?Q?/LV0gROwjcdYNdYiHomijdFWcbq0lA8AWkU5fTLNmuHtQ11qNWFBo+mhbeQu?=
 =?us-ascii?Q?Vv4HyElyyT9aXM7ZVyb8NW7kcXnHMeVQD2eg4xf/F2XE8BrcQjTGY8gkgXRQ?=
 =?us-ascii?Q?NbIkEApfYk8YPtt91u8G+Xuf9+qBRY+2vLmY+ilJMCvOVIzjRtJuA5gFSNEg?=
 =?us-ascii?Q?/feUFF6serw5cLixiprMAmqmxRJc6/ZapocCp+WmwGaoxWGacBkOfLSK8xA/?=
 =?us-ascii?Q?7ZQOT+TByL7xt4bCZr1owX6JbALXVZEBRfM5OiVCCAu8pIFRpgcaDWPHtYMH?=
 =?us-ascii?Q?k6VSJUtN+FsIdR1Gj8L4emXlSn35QN3nDpGGvt8lVuqrtegDPr7snPyw6bpT?=
 =?us-ascii?Q?l3VPIr6TBSF1UwQWnOH6OSega0uFeLlW6SsOLxWsuidEdwTh3VOcUQyj5Uej?=
 =?us-ascii?Q?A4ij8OO61a+eliuXzqO3hlZkDvBPF8+ES0R6uKs1eMsicO7Rrq5mO9Icc4ne?=
 =?us-ascii?Q?aHDz6zWj5Ry+0firPoKHwytcSuRPNcZjZASf4u++WCluAqyB8ifh7f3bzfNe?=
 =?us-ascii?Q?rA+fEwW7PQuakIY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 05:06:06.7378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c36a69d1-5c3a-4713-1dd1-08dd5c6c9a22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6411

Tegra devices have an 'sfsel' bit field that determines whether a pin
operates in SFIO (Special Function I/O) or GPIO mode. Currently,
tegra_pinctrl_gpio_disable_free() sets this bit when releasing a GPIO.

However, tegra_pinctrl_set_mux() can be called independently in certain
code paths where gpio_disable_free() is not invoked. In such cases, failing
to set the SFIO mode could lead to incorrect pin configurations, resulting
in functional issues for peripherals relying on SFIO.

This patch ensures that whenever set_mux() is called, the SFIO mode is
correctly set in the Mux Register if the 'sfsel' bit is present. This
prevents situations where the pin remains in GPIO mode despite being
configured for SFIO use.

Fixes: 59b67585e242 ("pinctrl: add a driver for NVIDIA Tegra")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
v1->v2: Updated commit message describing the need.
v1: https://lore.kernel.org/linux-tegra/CACRpkdY2E+8quTVVkCqoph-h6Ye+hEb+z+D5+2g=ArmfLpGR1A@mail.gmail.com/

 drivers/pinctrl/tegra/pinctrl-tegra.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index abe31fead395..27823e420734 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -270,6 +270,9 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	val = pmx_readl(pmx, g->mux_bank, g->mux_reg);
 	val &= ~(0x3 << g->mux_bit);
 	val |= i << g->mux_bit;
+	/* Set the SFIO/GPIO selection to SFIO when under pinmux control*/
+	if (pmx->soc->sfsel_in_mux)
+		val |= (1 << g->sfsel_bit);
 	pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
 
 	return 0;
-- 
2.17.1


