Return-Path: <linux-gpio+bounces-23995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A6B19AAA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 06:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3917417649E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 04:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1FB1E7C1B;
	Mon,  4 Aug 2025 04:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gv+LoM5a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770D3207;
	Mon,  4 Aug 2025 04:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754281038; cv=fail; b=PzBdjYGUL6MGx4TuhuQ9JICe+ii1NmRZcFirUfpUYEB/SNbkK+v1qOk1ceLF+hyU4iln5m4tgADVsfZrmz8jXaWtHncDzg8txYU+MnqrWiXMOCDK6UtWqPPuoO6YGlZCg36V3YYGrgDlaiB4AXEnrTm9fhC7gXZkZktsobic5c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754281038; c=relaxed/simple;
	bh=jwcFhOrJOtjR4H5S7sm3AwHwiPYiA0VhNNDjqXRp2yw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hLa0Hs/jLJfhtja9WQoAm+OG9nlskWEL1uL05ypt5QMTTr7fSzAW+GcsXV3GFX7wQ8hYrnC0S3ptoCxm/lImaVcb35VJBVY8Ph2pKx3884ZTipcpn6xgvgNIHdij6PRgobfXRielvAmJDLmZdUbbPJPt6xNled18nNiclw71GvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gv+LoM5a; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSprck8qsrhIELq1GH2MiTil0JsSX4w5E9TnPmizgmHqXSVLxdSX81CmPZsJZxloD/OyZ39PbHbX2zK4DyMmxMpZRdhKl+xlmBggvm6nbXeArfjEr9wn5b/KfwrikWRiztvn2IkMtKmKrGBWNRTG4BcXi2PGd1j/nKoS34YeEynxtohT+bf5X8kjhg1hGnQp0cVZJRxRHevotDij6TcryhdmvRStGq2qeeUoETIxrP91xTzh010U4/P2+uR0kb7iTy9tu6VucNf1n6VCX81mwEIAjFrCQSG7DZ2R6oZkIhIdhhEp2ObYp0mcBmg+bBga2lBvj586bgAwLBRBn9eCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRFtEDDDr5LFBv37grq+a9Y5PB3aj2HWMCkeDWrff78=;
 b=tWpoIbLbFliN2GIIAI/kkMysG+JWlNq6kgPH6/NLw7L32hgBw3A6C6jGgHjMgZWONAtBuQ8BNsjF3AOy1X3TXo0Qf6iXTZGkyM7lFjwS/YtMIyfBALyo+SqDGjfXvNmmxH2qywhsAe43mahpzWGNJmZAsQpYkrZBGBmPyPHm+3Ac1eTqFtvIi5XLpcXIFRxh6BOqtoLGB1HyD8HND7ZocivkqELKStrLpp9yl1LXH9hRnospyRCj7lyleZ6y469mCbg8jbt5cQ4fh57k3R9PEduu5COtrt9dbTU7/HWe/JCx3w6GDDEMpqSni4a0W5IJJOr7EPxoYhQsKfLkopziow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRFtEDDDr5LFBv37grq+a9Y5PB3aj2HWMCkeDWrff78=;
 b=gv+LoM5a8HB/GuumWOVAc9pF5JnZaBrYxjYruX6mjhgUqc4+T5JWhGF6O6yvia3OnE7Knx6sjMDfyXqR0xR67sCgoyVbQF7WXbAEUBFTDGKUyTRQJ7iUMJPmXFJ74kROzGfXCtKPKFsoFRGAIECw4rc7szvDXWwnK4fbO0h8neNr9AKZb1LOrFRufYG47uzflv5Jnj8K3FG7ai98MlhJv6By1wmapqVdmxIwRI+JZD0c7k44aYrBdUGkVzs2cqRHSDc5CKKK/9E7yvK9wGqqvZzkENH4PjZTT8WkMuwPS3JIvySRtg0wBz7cnopdw+4e25IVs2fnS6ahRqT5hK+qYw==
Received: from SN1PR12CA0070.namprd12.prod.outlook.com (2603:10b6:802:20::41)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 04:17:11 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::1e) by SN1PR12CA0070.outlook.office365.com
 (2603:10b6:802:20::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Mon,
 4 Aug 2025 04:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 04:17:11 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 3 Aug
 2025 21:17:07 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 3 Aug 2025 21:17:07 -0700
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 3 Aug 2025 21:17:04 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 2/2] gpio: tegra186: Add support for Tegra256
Date: Mon, 4 Aug 2025 09:46:57 +0530
Message-ID: <20250804041657.27688-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250804041657.27688-1-pshete@nvidia.com>
References: <20250804041657.27688-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: e10e1a76-8d1c-4aa5-7d33-08ddd30dc8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/SQlaf/kUHldfTcVoRMU+BhXnXAEY839/TqmDJpBeyrUuK0lpjvTLSwM0QIY?=
 =?us-ascii?Q?Y1anZThi75a2xSt79BCnCavh2io4TJTsSaASLVS3cnl/Fz+dMx6K5H0GaL2Q?=
 =?us-ascii?Q?F7d4ODkTnrRz7ZWoz0Hft+bGXJDjLjpbJ48Ks8c3vUEwph2DtfdeS1O6J7kb?=
 =?us-ascii?Q?RE01gFqEurQTzsvAM0wB8rL20XNP2RiqJDKZmQd6n1H/ljkFTqvQPMXtdIrc?=
 =?us-ascii?Q?W/4jcyVpK4f+l+kSZ9K+O7/mwWok6KhCy5nOMhHi5HoJL4V7d+NKQOA1miSJ?=
 =?us-ascii?Q?bVZm0KBEaPrVFiToJ0FIk6AxB8wH5csayf9m1IU36Ac1rN3i/68hX5YFMnP4?=
 =?us-ascii?Q?9rwlMAPBISlEGH5m/ZsC/a1rxizHV3pP7GeGnBWRQeJtbOJKogYicMOEYTTQ?=
 =?us-ascii?Q?KnWKCCw83CUgLRb9Hj7UOR9e1lQLqeQPzG11LM2nHrxcoNHa7cMXpbbHuMd2?=
 =?us-ascii?Q?BBAywKz4mVhhxbMFPDUfaDcd+ZR3SL+UlnYKkH0trXM+HCHFsJUhCPTkbMz0?=
 =?us-ascii?Q?ZR8bSDYIQ7s5WgzRxu4nwCl5R/JEKlM5aN9cx/JmJ3YpD36rd3gfJBIPzjDz?=
 =?us-ascii?Q?pxnhwx8JSKYSBQmRBkI9oouuDPlI+/z26lDfgdM1FUQlLtQxzv5VDGcSofYW?=
 =?us-ascii?Q?6cv5PldSt92sHCP2s810M6QQqy4DkWEKgvRMiSpeRtG5GVKjuYYqzDMkD9YC?=
 =?us-ascii?Q?H6hfgGCCs6ABgxm4BE6LJjzWfWk2jLykpQqfOiVWA5K0B/OKLGqYRxPYBDZW?=
 =?us-ascii?Q?gWStdm8eQZsbLKErcf02TpHuRGnQRxreTUU4v/7FPwWcjks4ZNldXYp3V+5X?=
 =?us-ascii?Q?FLXpaF/3ITFTSZbyqUgH0AdyKafBjeHdzcDhgpopTPwMofOYp2+oEcFnubRH?=
 =?us-ascii?Q?2s7v9Mcq6yBXbFwXhFcn42DAWK0SykpI1p/ZU6OWTswkIBGAuxim0lvsEecI?=
 =?us-ascii?Q?SDkSsLPJJhleMwJFwSxvDDDgOfNElSFS6/EAjrG0OKKI/kR7FsR6gLFF6swe?=
 =?us-ascii?Q?jM9BOZSGC76LKNm4Ye1zLNTbGEG02w1GRlb3eB4dbJyTEFZdCyFdjo4ylNuA?=
 =?us-ascii?Q?ftzskQPRHmrGmyLYYlkJT/ekTqUDMyNL8j7hhizRAiyaZIvPf1F6Xx+bgrtX?=
 =?us-ascii?Q?uV1KbsesJ5MwYa5cSFjvO4RxN1hWPlsfdoORVRzGl3mHs0K7EjCHH5FPS6QZ?=
 =?us-ascii?Q?kYdTJgYmurL4IX1w1jgcdu4oR2NtPkxuFv9m9vpRoHAMAYdApU75DVF840M/?=
 =?us-ascii?Q?f+5JEVoWkoSM6P8bLrBlnm0IcroWp/uwlqn9VtD2qEZ+9Y07rSBip8FvnLW5?=
 =?us-ascii?Q?1Ulf57r9zp+9rHbz7ykR38CQ96nMrFK0tRwTjugjkNMd0/Y3aDL5CU8xGrGN?=
 =?us-ascii?Q?1JrBr1tCniG6taCmHaNqqQXjQlgOnResJW/L8Wa696OzPpa9UVhEiEqPPMsc?=
 =?us-ascii?Q?1YHf5OFlknrVcpj5Y1arDTPSd4h8BfqBWMTB+h86u4+Eu7AVZQeCFxGFMvp0?=
 =?us-ascii?Q?ZD3yI/Pq9HrysDfNXZCrLyjr8zCrNOiXIdyHFEhF9nT5nWbmGCcgDzCPyg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 04:17:11.1600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10e1a76-8d1c-4aa5-7d33-08ddd30dc8c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109

Extend the existing Tegra186 GPIO controller driver with support for the
GPIO controller found on Tegra256. While the programming model remains
the same, the number of pins has slightly changed.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d27bfac6c9f5..c9f1441a7b30 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -20,6 +20,7 @@
 #include <dt-bindings/gpio/tegra194-gpio.h>
 #include <dt-bindings/gpio/tegra234-gpio.h>
 #include <dt-bindings/gpio/tegra241-gpio.h>
+#include <dt-bindings/gpio/tegra256-gpio.h>
 
 /* security registers */
 #define TEGRA186_GPIO_CTL_SCR 0x0c
@@ -1274,6 +1275,30 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
 	.has_vm_support = false,
 };
 
+#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
+	[TEGRA256_MAIN_GPIO_PORT_##_name] = {			\
+		.name = #_name,					\
+		.bank = _bank,					\
+		.port = _port,					\
+		.pins = _pins,					\
+	}
+
+static const struct tegra_gpio_port tegra256_main_ports[] = {
+	TEGRA256_MAIN_GPIO_PORT(A, 0, 0, 8),
+	TEGRA256_MAIN_GPIO_PORT(B, 0, 1, 8),
+	TEGRA256_MAIN_GPIO_PORT(C, 0, 2, 8),
+	TEGRA256_MAIN_GPIO_PORT(D, 0, 3, 8),
+};
+
+static const struct tegra_gpio_soc tegra256_main_soc = {
+	.num_ports = ARRAY_SIZE(tegra256_main_ports),
+	.ports = tegra256_main_ports,
+	.name = "tegra256-gpio-main",
+	.instance = 1,
+	.num_irqs_per_bank = 8,
+	.has_vm_support = true,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -1293,6 +1318,9 @@ static const struct of_device_id tegra186_gpio_of_match[] = {
 	}, {
 		.compatible = "nvidia,tegra234-gpio-aon",
 		.data = &tegra234_aon_soc
+	}, {
+		.compatible = "nvidia,tegra256-gpio",
+		.data = &tegra256_main_soc
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1


