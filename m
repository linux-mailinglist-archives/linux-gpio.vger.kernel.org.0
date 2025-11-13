Return-Path: <linux-gpio+bounces-28451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6EDC5906D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 18:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 432164FD68D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 16:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD5C3587A5;
	Thu, 13 Nov 2025 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cPNdSBhC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555AA357A55;
	Thu, 13 Nov 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051508; cv=fail; b=CPZugGJV6z7bxJFGSeW0iFH9185e/tcuQ/NMAkNACoubkGqHSQajRoND8n3hxAf+IG3fn8PN0jx8ZTZUY4OJWuU7iySwc0/L6brX6kD5ff/0QQxHikcr7HpOZ74roegxYl4QtzFAx/uCFbWyB69v7Mt7ow4thVZiwVe/NyB8eug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051508; c=relaxed/simple;
	bh=VLwrEk9sTry7zO426W5BMd/MAFppZePgk92WFQFS4Zo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s8Pctbj8igU9NHes98RzGxW1fk3XQaF42C61Zi18Nr5hrff7Y5+flL3WGDH9P9p2ryN0SCf71QN/RmcJkiRkegI3T24XEjtdLpdpLRwVkcYdEASrL1isluylaEjseoYSAzfXKOYHRxKF7mX5DXNMvNbDiOMeKxI+Eq6AdhjWf5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cPNdSBhC; arc=fail smtp.client-ip=52.101.61.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8i4vO0SIqbEb/BR4S57SORh+nVa3SNtAiszl6sl35F1aFLNhCRu0Tgjmxc0UoRs1V0Q29HBRSHynwLdq3YqSQcmV47WzTpcXwkbBk1eaC5GtIzy3hBlIjnKQtDy4nDVBh3m6TjsibJXmi0NV7+VH6j059WpE48PP3fwAWudSwhWeTE5xaOKtIc95kzuu28J/jWSAKTzL0fuh9ipFKPeHvGni8ZtdYlQ7rBYs1DXAvtw5lBKT1/s5h+0x7QOVKxSh9kXWSENfnz5WLFYrrT+OQJrUmLUVlQPtz8ie43gJ2I3iHhG2hsa2Yu5WwOv78FXcAwDSRHWwmNyc3yjyza6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+93hdRL7Bch1JUkvRRNBiK22lgvEd1EaOIyiMFE1he8=;
 b=wvCmKXZiYofkXne3NNQQYEl2ZuHvWBKFQDnBxDB8rZD4BOd9am4V+4C6Ck4+Ci4BDwVa+g5ItHSnrverl1NSfKziWFEAqF/4URjz6tnfnfd6nFB8UXZxn85I2XuF/QCCWNNVol1ft6ujUT7wyJsXy+QisUhUmCfGDEC0oga7shljRkDRt2KlMtPDDcTFDZiKNbrwerm4IL+NI8cHW+EhnTkkv5HQDbFCmSRq1mNCIFMe2m4tGStaS5D7+SOmfnAZb/mNM9GLKn+Qat+jpksCQQ29qs61QDCDu91SJBUuNGgyJslR40WB0ugwY3lgeUCc9hSg6armMyk+uraOWrexXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+93hdRL7Bch1JUkvRRNBiK22lgvEd1EaOIyiMFE1he8=;
 b=cPNdSBhCyTcoo0fxAggYu7tYwZZrNp87qCtEMlsqJRFfTLDdhzksaaCmZiN+H+gJNXNLnOm4TYXXSIS05X1LjiUvrGutSq5w69MOv0D1HuoaFDz5K5FCueshJ26h2uf3zvpbRzd5ISYuRyal4shqyAlsccsRU7ikUuS24C+PEJ/ymDcXmAikLnu+2OGQE9KTRGh3BE85RjXl4uRQ+r6NKzvtrWjaIrKvlyoY8RUCE05dCYbUzCDQroduDvY+pU1iQchw/hb11HDLLMfuQSyywjQrT05AKiil92SjkJUg4k7XxGBXCaxnunH5Yd+IN2tuaaXO1mh/zR+t7h2aNO6abg==
Received: from SJ0PR03CA0131.namprd03.prod.outlook.com (2603:10b6:a03:33c::16)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:31:40 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::f) by SJ0PR03CA0131.outlook.office365.com
 (2603:10b6:a03:33c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 16:31:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:31:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 08:31:17 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 08:31:17 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 08:31:14 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <pshete@nvidia.com>, <nhartman@nvidia.com>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH] gpio: tegra186: Fix GPIO name collisions for Tegra410
Date: Thu, 13 Nov 2025 22:01:12 +0530
Message-ID: <20251113163112.885900-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e926c76-e074-4462-c395-08de22d21fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I4IP63rUkjd7cduICucilmeBFSa1F63prPfM3pGfyh84MwVfb2zHVS9WyJQ0?=
 =?us-ascii?Q?z05G3AGQIpOhppuhr83gxKcgZV8akwUMXKo+uob6G250o3TtQXlbiysUzXnJ?=
 =?us-ascii?Q?OtdCcqZIbXn5M7BfgGm4DDeFWO4oqHgQvJQrq2peBNiZypMkPz9l8gc6mNeg?=
 =?us-ascii?Q?XEzUfVQqh3BcopzpRNmDwxkXT5jzXaAftrteaIWY8e2RpH4M1LB4AsduWXag?=
 =?us-ascii?Q?GrqXffAfJnC4dq4RhuLj61ut+8r94SgiesJycsj7sy/n26j+hJNtI+XEI4rE?=
 =?us-ascii?Q?NPjPK5sPC4VuJPIAvKXWfUu2Iq0s5NeeFfpGNt5noRgcK04PY5uO5iQNhsS9?=
 =?us-ascii?Q?bGn1Tqr0WoodNyDY+PE0EgBrEuWOufhMSSlLiOl0nnAH4cELsYbpaqdEZ+N8?=
 =?us-ascii?Q?nPTi83yEXoRERjzDzlhiUIBEE7E3dUPQV7BCRL7okxIBttf2T6yAZVG/x6ib?=
 =?us-ascii?Q?PcUo6q5UEplnMecHpQmujvn9KW/vbmyKuV6tRftSfTMOZ6dAO4tqdCMljJ2/?=
 =?us-ascii?Q?4WYEaVVgLiSqkqC/52ws/Wx7T7aUyV3kcQKcAfi8lhsXgx6lTjsdV+1ZuJ2L?=
 =?us-ascii?Q?7DtCEb8pQSsSGUOreNk9yuZc7gYjMZTb0EPi1uPqbXJFWTXQy4g1fCcU7TnZ?=
 =?us-ascii?Q?/QDwebA9Aoohb6Zn70LlPBqQznppJuhxZWG01MnNoJ5+yRxnFvc5Z0jL8E2B?=
 =?us-ascii?Q?Wh6g7zaLuNmNcm0h1LkigM2bNz/vzDoAXL7voopPqk7Al+VlBys1t3LDXOUx?=
 =?us-ascii?Q?arffNvCGq3NoaFs+Zh5PB5ZR0gEEm/k1upqj2KQFf2spXrmUvFukgYRBAfUg?=
 =?us-ascii?Q?/dCM0/xJo/s0C+L60CxEz3MdDVAHt2reQZJPWCHpRK4vOIFxLyf2RnGhWxNv?=
 =?us-ascii?Q?eA5EcxZzGTPswJUkN4/ouLr/iEBCgjCR0ZSb4xIPqNXGHwGng9KpMA2IGkAf?=
 =?us-ascii?Q?voHW6zelxKXb+Bt8/iGBDJMMCYOLdomP1KgX8GCJ8uddlj0Km++MzfY911nt?=
 =?us-ascii?Q?Xmsg+mBmqCio+5lY3Ft6WPYjt52zroRWeFLFKf6yDTWUA7q+1MNgvSxrBLGg?=
 =?us-ascii?Q?lznorczklwq/VUWf89Qv7y8svaxXUHK2GdkxSK2rwPlVnSYb9ANBXbPGvZjO?=
 =?us-ascii?Q?lbwGDIfoDntZwjexaXDx436IsPpW6+y3IUM9icGaww7ecg6fZPuC8Zmx03ty?=
 =?us-ascii?Q?euxP4rl7WrqXBhP3NF3neXvlku+6EEXe+K0Ccr7xep3cMhMT3GguugkVFT3G?=
 =?us-ascii?Q?d3qnUl16YeSKw6zbTNhepARWLPYzQepvtIof6eBwuMVerGqx+icLAXr92ymy?=
 =?us-ascii?Q?KoMq5ll0wE4CLjwOHWs8CuKS8M/OmNxiJgtaI/dSF7cwcsdtdD/8n2x30FUH?=
 =?us-ascii?Q?Bu5f+VWJ7J9NLpOeDA22bmSqlIcOBO7dUke5LMBMpSwtm/sfCF05aGUBUWAW?=
 =?us-ascii?Q?+hVsbBh/bwL6SSiCm5kNFE/z8SsHHodwwQDyx6xG5tIsvO6N/9xoiFxyM8CQ?=
 =?us-ascii?Q?DV96CBkgeGTpvFQ52ZsBw3JA4n+AmAXgozqPfgNcprNj6xvDaSz/mEOPBHRM?=
 =?us-ascii?Q?4WkX5dAsssyFEEQqNiA=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:31:40.2623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e926c76-e074-4462-c395-08de22d21fba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

On Tegra410, Compute and System GPIOs have same port names. This
results in the same GPIO names for both Compute and System GPIOs
during initialization in `tegra186_gpio_probe()`, which results in
following warnings:

  kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.00'
  kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.01'
  kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.02'
  kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.00'
  kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.01'
  ...

Add GPIO name prefix in the SoC data and use it to initialize the GPIO
name.

Port names remain unchanged for previous SoCs. On Tegra410, Compute
GPIOs are named COMPUTE-P<PORT>.GPIO, and System GPIOs are named
SYSTEM-P<PORT>.GPIO.

Fixes: 9631a10083d8 ("gpio: tegra186: Add support for Tegra410")
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 83ecdc876985..b1498b59a921 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -109,6 +109,7 @@ struct tegra_gpio_soc {
 	const struct tegra_gpio_port *ports;
 	unsigned int num_ports;
 	const char *name;
+	const char *prefix;
 	unsigned int instance;
 
 	unsigned int num_irqs_per_bank;
@@ -940,8 +941,12 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 		char *name;
 
 		for (j = 0; j < port->pins; j++) {
-			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL,
-					      "P%s.%02x", port->name, j);
+			if (gpio->soc->prefix)
+				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
+						      gpio->soc->prefix, port->name, j);
+			else
+				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
+						      port->name, j);
 			if (!name)
 				return -ENOMEM;
 
@@ -1306,6 +1311,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
 	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
 	.ports = tegra410_compute_ports,
 	.name = "tegra410-gpio-compute",
+	.prefix = "COMPUTE",
 	.num_irqs_per_bank = 8,
 	.instance = 0,
 };
@@ -1335,6 +1341,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
 	.num_ports = ARRAY_SIZE(tegra410_system_ports),
 	.ports = tegra410_system_ports,
 	.name = "tegra410-gpio-system",
+	.prefix = "SYSTEM",
 	.num_irqs_per_bank = 8,
 	.instance = 0,
 };
-- 
2.43.0


