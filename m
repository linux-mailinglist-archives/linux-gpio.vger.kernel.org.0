Return-Path: <linux-gpio+bounces-24211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F68B213A7
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 19:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B9182A66E2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 17:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6453D2D4814;
	Mon, 11 Aug 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KRAj8RsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB9B2D47EF;
	Mon, 11 Aug 2025 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754934667; cv=fail; b=oA2R+f0tghnB48Ftcvk7fmG55C7TcPfFUNiusURGunnWyLb7Wt1PtN2jjxhTLNBmHcK/uT4c8Af1tdajwgugX3ATQdHxVSBRPd2rTtMZEFSGs1zRfQi6UahNC6Auy63Knen8S+ovl7loXNspwirf8O49L1guazqADeLL71Gh6H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754934667; c=relaxed/simple;
	bh=y8JClKUr7hCJglqXUoOtRLGEZZsh4vQT1eFbqTWZfy0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=us07zWbNFRn+8TSRiUMW8kWzPr1PBimgHKaNWj4dZxziasHidu9Ax+S8v0bfIWcliMwx3W83aIr3lbVb8rM6nRUOOMMxJ8mYp/LEv0Oa6kywhJvTg0ASZODSLVbqtKFF9rPoy26GDSmgkX1SqirsPtnOeLD87S357WEBNGMze4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KRAj8RsB; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsLItsS1tSvI4cJaujfVOtXkaWEs2jFk0JXrab6/aedFm4PPAs9oMm3bZ01uy4cZ9SPqkhIZtSVa7dG8Sh/+wvYSZr1coW7HWnmhY3Yjyjllh+3vRjZZ8bgRWgwnH+jtee01v5A4p+u4HcNYx7hiUDlsXhdbV/tvgfF+MU1nK+VvvVZo+y4cUidgrVxiI2sKmMjV8YIH2D3yhUaywekN5/ff4oNoue/id7GMx+L/qmNqkWtWsuF2F4c/m3JluWdKIDVVUvhxbPBu3NZWj8EvIwurnXgm0yZHQHphvX1COLP04RfBuG5sPsayC/aZF8tDsaJBTzIcqkOkk3NN5bY2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtwHzaFSoEashgRDIp8LQX9M0c0E9EJ5ynFP84R7bgo=;
 b=b79/2WGClePvcmtornxwV+sH47fCtpJsWlZl+DgQBUd4lOrEUDf/tSgmBA3IXDHCngdFcHv8H4BPUkrcR+2FxcLiWnANNqqQIWe4i7CFGDTsEMNcsY/rkFRB9db7B63RiV7jMqzAgJyZVWErArhlS5kA1JWScgqFOwd3qNOGGL0OomKVCYvhXy41aMQ+g8OJdnEXLsOw15FCiOnr3xgD4PLT3RrrISAKYuvZPZbKX3u4Uh7BE1GXPG3yPkoYWcO4ZsWETY+prr7DqJavjD+j4q3uB60Uu8g57+am6JY11gktFjtvA9lguT2AEHez0VVVhONTLZ+jFfn8Y8aWcxI5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtwHzaFSoEashgRDIp8LQX9M0c0E9EJ5ynFP84R7bgo=;
 b=KRAj8RsBtkxRPsTUfJ54C6oYVfKEUB9VLLdv7XAS3F2W8XTCYI3TmkO1sknam9xCCyh4Ilmi5sRcyoFZ6LqQB6Z0hcgGNzL9Vj1XuM2DGD39mS4lcU6qzNzuN/D/ibJ2JBwSaKK5JXRWGyMECTSz/pD1deWsoVhKcQhNIIdvU/Sv310oe0eMX2rbpCqFy4SrjqR3EdnGxWVQaCjEQJkfxpq0bbhbN4BHVG3SCCp6QZSaHEG8OjVCBxYtPoZYoCjP3n8pFEYyONcyaU3xcOWNkt2pV6JeQ6o7HNMvNIbJnpUUKL2u8Vvp9iZM5xprTCY7EbxEn5IgWcpzfLJ8h+33Lg==
Received: from BN9PR03CA0873.namprd03.prod.outlook.com (2603:10b6:408:13c::8)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 17:50:58 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::b0) by BN9PR03CA0873.outlook.office365.com
 (2603:10b6:408:13c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 17:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 17:50:57 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 10:50:56 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 10:50:55 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 11 Aug 2025 10:50:54 -0700
From: David Thompson <davthompson@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthompson@nvidia.com>
Subject: [PATCH v1 2/2] gpio: mlxbf3: use platform_get_irq_optional()
Date: Mon, 11 Aug 2025 13:50:45 -0400
Message-ID: <ce70b98a201ce82b9df9aa80ac7a5eeaa2268e52.1754928650.git.davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: b58083fe-a017-423b-a35b-08ddd8ffa0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hmEq1xV+IjFeZg+bG0J1qNeOmZI8HOh6ivA7KSuYWIWpjOGMfXSRGL+Gu7JJ?=
 =?us-ascii?Q?x0RUbdBYbkktu1D7mSuuWw7w6YpbKB2xwIPkNSiiU0yUSsOPZn9V3n6E7T7N?=
 =?us-ascii?Q?lJAVTz8/a+Ip5uo725vFrg/6d4rp9lnTGPLOiSk69ezVXPoT8JWLsczP1Up2?=
 =?us-ascii?Q?+7ugGLUNx6c/HDg8br5j1GI2o0nfvkRjhF+bmJRiVke39I8wimHyO2LFOI6l?=
 =?us-ascii?Q?I1VDXCz+LZYIO+FVoGthGTEb26bUCKSfhwvnSxIPFzX4BNwmI2nm2eQF3dC+?=
 =?us-ascii?Q?ET/CimPo8i5MV81N4fHdHo6Ftvl9bdDI0BMMuL4IYew/niRDXZDjgx9uVO6M?=
 =?us-ascii?Q?nmQe04FMNsPhJMHhWIdn5UH3PyFfHCuAW1G3vOf4ndXvtsH4PpVFoV/o3RkB?=
 =?us-ascii?Q?aL6uLkY0RdBxehirM2uHsCYqFkvri6Q1GggOOMfLVXtMmKtB2GqYj7NlvpUP?=
 =?us-ascii?Q?6mf3KKfflUumJS3dSXhjjkAW+8XB20pQyokBkQSom6rmC0ZHGGp05FBN2Qfr?=
 =?us-ascii?Q?wJuXXCE9LJGO5m+8L0eG4s9FqGo7dhFUGZ1UB8EWAzntXYpCuWZaQcPkgC5b?=
 =?us-ascii?Q?ca53XUtNBj6E7HXiJO8X3UyCpGXBsb80OYU1ZUsjF5Csol2r53ss3N+MsR8d?=
 =?us-ascii?Q?eWn8DwGtTxmum2sZW2JWMhM21b+7XY3453cY5HVbKmHELkGTGRQf07NiUko5?=
 =?us-ascii?Q?aISu+WgsRGpms43Pvpmp/wE228wENR4tzmvOROp2Dmrsm5feTzczp3SQasD6?=
 =?us-ascii?Q?ZzcJ3ox8X3S4neKXuQA2XZpCe5Qbl8DzgMLhhSmYQ9lgffy7DAGXErGh+tpZ?=
 =?us-ascii?Q?jwf6K7bN06jDkWMNZVjhmVJDOmCV6qs/yBPsA8BnjUnVMwIKdC88RUKfwoWY?=
 =?us-ascii?Q?4KRtay+XYRWZIGyT14o1aq/ILUB5HaTtSZtBvePvX8yEjMNPFrWMLySEkPw9?=
 =?us-ascii?Q?bGNTc1+Y7vkz3v+CDzZNc8O6liFi+QaNQsPz5rAZKo2T5Ehja4GnkrYvKwAo?=
 =?us-ascii?Q?EfLlXEjBqVZYODOC6faLE3k2ewGXygXsR0M5FSck6+gKCrTZrCRxgmereHCl?=
 =?us-ascii?Q?nCUmsL7+542CFAQehmlsVDGk90WyHrL5pkHe7MUMr41llS0Vjts7r8KLlgaz?=
 =?us-ascii?Q?Adr31BzW+gf4nNKcuy+0WmCYJvbWWMktEcw0kyLWaj8j3F1xG6Zw8Soq/mXT?=
 =?us-ascii?Q?5ZGbZ0KnwwH8AKJvRV/5+FVeJcY3lY8453Kr6IxKUPDvTNsfnjrKn4BsXX+H?=
 =?us-ascii?Q?F9oecPH+qjUgdJPGWKRgJ0mL7FeOII3ZmhyNKoZdYmLj8zQpfJiBWNch3oVB?=
 =?us-ascii?Q?gb3vhdDIayd+QCYMEsQLbegIzo+7gv496wFD+Q3DxV4wM71N3eHR9luoEvk5?=
 =?us-ascii?Q?xd9qw/xrqnEqjJOqtojRnhRvkr+atEgGLld3NukGpKtB16W13KUkD7GqaO53?=
 =?us-ascii?Q?mD0H/b0gV//TnrH8HLntKizYVq284lG+EcydoeK+AlrBDXDwv/2wbVsPD28K?=
 =?us-ascii?Q?gSY3tIUFtifexgOjhPmuZ5XvXU+etJgcBBq+?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 17:50:57.8724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58083fe-a017-423b-a35b-08ddd8ffa0ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293

The gpio-mlxbf3 driver interfaces with two GPIO controllers,
device instance 0 and 1. There is a single IRQ resource shared
between the two controllers, and it is found in the ACPI table for
device instance 0. The driver should not use platform_get_irq(),
otherwise this error is logged when probing instance 1:
    mlxbf3_gpio MLNXBF33:01: error -ENXIO: IRQ index 0 not found

Fixes: cd33f216d241 ("gpio: mlxbf3: Add gpio driver support")
Signed-off-by: David Thompson <davthompson@nvidia.com>
---
 drivers/gpio/gpio-mlxbf3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 10ea71273c89..ed29b07d16c1 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -227,7 +227,7 @@ static int mlxbf3_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->add_pin_ranges = mlxbf3_gpio_add_pin_ranges;
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq >= 0) {
 		girq = &gs->gc.irq;
 		gpio_irq_chip_set_chip(girq, &gpio_mlxbf3_irqchip);
-- 
2.43.2


