Return-Path: <linux-gpio+bounces-26970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2289BCC7E1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 086E5423728
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843DD2ED87F;
	Fri, 10 Oct 2025 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k9k6880W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965592ED164;
	Fri, 10 Oct 2025 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091263; cv=fail; b=Vk+AMnThIk6+fvgCy7lyATZoY7GJHgw+kTA/HtT/YqH+XuM2eToCYN+3EqSM1/KYEHdZosgsvu8Sgz+ubM8tAW81l2qsbmxkS63OcnYFA7RpRa/wwjTbS3S/Uxh7yAhb/rjpxUCYxKiNPw0q1KLrxCx6gtzeEewdOan5q5YAgss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091263; c=relaxed/simple;
	bh=efyownvs308EbKF+teE08tllXrbGJudapEKm6wfpLL0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lsbTvzekfRZ1b/0Dl+7YJGPptC1t4gOrXsHwrWR2JsNXaRRqpsIhpAVoYyrAlFDec/2uLgiswK4E5gXCtyJBHBt6pbXnLdLRMS3UGylOpUKD49BzTNCffOXJ8T9Yp49u+zKROC0Sor1nk8lXzBpTACouVZ20O+qEIfhhpMFZzrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k9k6880W; arc=fail smtp.client-ip=40.107.200.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPHqfsRG4KBmGexqTWDp9HrpBPlStGXb/Bq3hfdtgmuUC4LcDnD+xLMDqrqYIfqjupT74o5RF12ojgB/nzAHk0XQTkDrOibeLs9x0E2I+0Ars1myyTJJcjngam+bQuF0K4VdjhSajFFgGEYDIJ98cBzWtAxK/2SK3Hhnlq8sTEwAHQitThHtuVCSU1Wq/K35+y7F7tYELpp3EfsJO9FQVkSYEzo9Th9QWQ93D+xSAwPKqA1WXI0keeqqpjzR7Vj4MnTqmd4gtq/aEnTiwo8TkZsfCAuI/P5Dw47Ox1QdAJWdPRVwDOvSZmSd73foFv7oewEOxE8eU8fjfzV5oip8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8go8J9Us5mislrukA6fg9GnbHZEMGH88VZP2zzElUZU=;
 b=l8j1/IdEdCioa6iJzFValktxVnM2ptxHW0jvLyhpKlkdz5GXdPnpTi0VfXlq9wU2g3Ka6b/KT99tXjJvr7XkBHt+4HFQeVm8S/8obup1pZGjb+tOFMeA7Ttdtd+Wyr670bHjJgbgSC0+zecobFYI7P6mIcMlLTQIyv5+laM10zEKVniAU5Y3TZ5VFqdSQglbgBYhOCLCh89FG2fhw9X+2EjcSkiQdb2/K4eE8+438qpXmmuLN6P/RkuSZM2/oCd0shgN+ZdjlkN6ac1+WJzDFkpeeapz7+GvalrNDd5udZ675YSkJ5ByVg+YK2WJzN01C98/Ydd6Aze3LaP++ljWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8go8J9Us5mislrukA6fg9GnbHZEMGH88VZP2zzElUZU=;
 b=k9k6880WVgiG21AMTQUoAzx8+GJAS0q6fBO3xJpxrKiaDgHIj2GUEBl0rmzhfiEu2KpNOCZETzGdtGrCm+itkQXmcxtrgYupKIehmgSIjnjG8hBq29vjO4SS9qPOEQeYs3sZJM12SWeOQBGMc2j70qcdGqxcZWktSNQirqezMIc1maGL3g0kQlEIheuIxFabrM8/WG4xNhRXojCoKn+qTK7iXrKndHb77sUGaSHmpXZ54sZ/NanEXJW/pdrvDnday4dcBc71MpsAisat/d3cs8rvg4WS+cSTdO0rAyduXPBulKsRAOShN1iC0f/Ssutx2Hqj0ukJ1nTw+Y3VoLYgcA==
Received: from DS7PR03CA0209.namprd03.prod.outlook.com (2603:10b6:5:3b6::34)
 by DS4PR12MB9770.namprd12.prod.outlook.com (2603:10b6:8:29d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:14:16 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b6:cafe::b2) by DS7PR03CA0209.outlook.office365.com
 (2603:10b6:5:3b6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Fri,
 10 Oct 2025 10:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 10:14:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 10 Oct
 2025 03:14:04 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 03:14:03 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 03:14:01 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 1/2] gpio: tegra186: Use generic macro for port definitions
Date: Fri, 10 Oct 2025 15:43:30 +0530
Message-ID: <20251010101331.712553-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|DS4PR12MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cad90ac-9d0e-4b23-7331-08de07e5c49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Efw4ZMxqH11GSd5W9ut0BC4J3iZtnIJyvFurfRXgQfrqbBN8i1V43rtYIxwe?=
 =?us-ascii?Q?+8ypyP3xJ/yt8dLhnGLfZL1v/KRdce+i8QAPYqKjQHVqEYcXgEL6tvKJq6QG?=
 =?us-ascii?Q?AQz+GHg4WBdj3qgGsFzddOHJVD85lw7EH4d/NqiS5CVs/iFWGkrmPKzmwPib?=
 =?us-ascii?Q?OorRP8Jwdb9fowaR0ZqlR0R/NIwbLC4Rdqayi5mdCLMW60YolcOHMOihcQ8U?=
 =?us-ascii?Q?WH4UPKSeefDbkA64EMpySvV20bScwneDvLdrMkikJU37acMNUNHPDUIBCkpU?=
 =?us-ascii?Q?Xlp3TtdVOLND7wZadV6trdO1RT9qWaOuapET6PivYW9lNVZJ8c48ElVnclzd?=
 =?us-ascii?Q?eiZAOPuVxpxW0sNBKHWAY+NlU7A5KFyLUL1qT2ccnbs4IXDRtke7BEC5OSca?=
 =?us-ascii?Q?7tItwXYp3vvtosZ1KaCD3ANASXUI2Z3PqSN0zHIhI1/sFcO3BBNayYUi6Dpi?=
 =?us-ascii?Q?wvZ45uBx2wl5nYgicKnbZjmZGEmk8Do5W9vqH1NwUfiDdyN7ciMR07ykEM3d?=
 =?us-ascii?Q?f0A8ovkpnPXm23wqfay6tPliIWLNbku/Vv3oeOddx720o5bqs2mXd5dQHG8e?=
 =?us-ascii?Q?KLZ+bBdGHY88xrGB5xwm9ZcQxzMUdx/wemGYFYjclKK2QUa9ents3n3+cDAz?=
 =?us-ascii?Q?+mw8ebnJ2u8+81O4LK3V9Rx0du8MajGsk+wXJSgYKF5G980x5x+K55gNAqWn?=
 =?us-ascii?Q?2YDyGek6EcGxnh4CwgzjzLxychaYFSJCo+w/RZnxbdcr/TlsveNroZJUeuMo?=
 =?us-ascii?Q?hPU6b1QkGRxls/BTS6sS1JCVX2WPr5fxYF1nMxI3CAleEHpds3ZwQKM/yUzp?=
 =?us-ascii?Q?XtHaPek2vtvz9YsxrljUZiN35gKLn/PRMLokhmaWOHpBbxD4XVO25pMPtu2S?=
 =?us-ascii?Q?TG4Ci9LaeJPL0EpnZPVzcwziB+xWWS1JzJEXXsr1vIyv1byRnia03qK/fddC?=
 =?us-ascii?Q?xdsGoFTtp4go/urM3GHGafj9vl78eC+EN1FW2az8MTjt5NkE7/FSsDQDwzqx?=
 =?us-ascii?Q?JMuvNtDtDU8uuOqe5e8oe03o2U5BnZZuVEOOERR4tgMDxHBIqQS7khSklMr5?=
 =?us-ascii?Q?cZcWSP2uNn30IaJRcKgYpRCErYCETG2/PUWz2p09r2D6+m3T2EbVlZbNqtPB?=
 =?us-ascii?Q?OlFYKn1k9C9bqwcJuPepOyG04T/I6GfXfvRBt2qGRf3c5muRVnnYLARQ8xil?=
 =?us-ascii?Q?PWqWiSJ5xraICZgbqYM3f8i75nGosEDZlzLmR1i3zPq3cYeE10nlPl+w8s1n?=
 =?us-ascii?Q?i0tavwIBt/jwSXkcRlR+ulNkEdIJXSXyn1F4eIUPcW4fEQuH/7iKTtJ4nM7s?=
 =?us-ascii?Q?NgYJyLoUmfxZLdTCXl/chPgrvbZjIqfGLI/GqtCovqzMNdsSk0Z8kW3itifi?=
 =?us-ascii?Q?odCmW4TH+T8/4TATtFZixp/VV0fFknEicM7T+CAUyLH5ETV0zVwXFdU43iLs?=
 =?us-ascii?Q?TVe5ymu+7MLg1+0rZApiXfROHOjzW9sQ4A0KgahevapYyTVXpxG+MQWtsZU9?=
 =?us-ascii?Q?NMSYBlDiUtRupv7Lu/wiOYfOEUixi49QdxaDAEQwnzpfzxhqz3c2ZaAbhos1?=
 =?us-ascii?Q?txSC0Dbwie7MLTvbx20=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:14:15.9119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cad90ac-9d0e-4b23-7331-08de07e5c49c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9770

Introduce a generic macro TEGRA_GPIO_PORT to define SoC specific
ports macros. This simplifies the code and avoids unnecessary
duplication.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 87 +++++++++++-------------------------
 1 file changed, 25 insertions(+), 62 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 4d3db6e06eeb..7ea541d6d537 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1002,14 +1002,17 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
 }
 
-#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA186_MAIN_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
+#define TEGRA_GPIO_PORT(_prefix, _name, _bank, _port, _pins) \
+	[_prefix##_GPIO_PORT_##_name] = { \
+		.name = #_name, \
+		.bank = _bank, \
+		.port = _port, \
+		.pins = _pins, \
 	}
 
+#define TEGRA186_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA186_MAIN, _name, _bank, _port, _pins)
+
 static const struct tegra_gpio_port tegra186_main_ports[] = {
 	TEGRA186_MAIN_GPIO_PORT( A, 2, 0, 7),
 	TEGRA186_MAIN_GPIO_PORT( B, 3, 0, 7),
@@ -1045,13 +1048,8 @@ static const struct tegra_gpio_soc tegra186_main_soc = {
 	.has_vm_support = false,
 };
 
-#define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA186_AON_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA186_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA186_AON, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra186_aon_ports[] = {
 	TEGRA186_AON_GPIO_PORT( S, 0, 1, 5),
@@ -1073,13 +1071,8 @@ static const struct tegra_gpio_soc tegra186_aon_soc = {
 	.has_vm_support = false,
 };
 
-#define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA194_MAIN_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA194_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA194_MAIN, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra194_main_ports[] = {
 	TEGRA194_MAIN_GPIO_PORT( A, 1, 2, 8),
@@ -1129,13 +1122,8 @@ static const struct tegra_gpio_soc tegra194_main_soc = {
 	.has_vm_support = true,
 };
 
-#define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA194_AON_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA194_AON, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra194_aon_ports[] = {
 	TEGRA194_AON_GPIO_PORT(AA, 0, 3, 8),
@@ -1155,13 +1143,8 @@ static const struct tegra_gpio_soc tegra194_aon_soc = {
 	.has_vm_support = false,
 };
 
-#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA234_MAIN_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA234_MAIN, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra234_main_ports[] = {
 	TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
@@ -1200,13 +1183,8 @@ static const struct tegra_gpio_soc tegra234_main_soc = {
 	.has_vm_support = true,
 };
 
-#define TEGRA234_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA234_AON_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA234_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA234_AON, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra234_aon_ports[] = {
 	TEGRA234_AON_GPIO_PORT(AA, 0, 4, 8),
@@ -1227,13 +1205,8 @@ static const struct tegra_gpio_soc tegra234_aon_soc = {
 	.has_vm_support = false,
 };
 
-#define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA241_MAIN_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA241_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA241_MAIN, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra241_main_ports[] = {
 	TEGRA241_MAIN_GPIO_PORT(A, 0, 0, 8),
@@ -1258,13 +1231,8 @@ static const struct tegra_gpio_soc tegra241_main_soc = {
 	.has_vm_support = false,
 };
 
-#define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA241_AON_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA241_AON_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA241_AON, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra241_aon_ports[] = {
 	TEGRA241_AON_GPIO_PORT(AA, 0, 0, 8),
@@ -1280,13 +1248,8 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
 	.has_vm_support = false,
 };
 
-#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
-	[TEGRA256_MAIN_GPIO_PORT_##_name] = {			\
-		.name = #_name,					\
-		.bank = _bank,					\
-		.port = _port,					\
-		.pins = _pins,					\
-	}
+#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins) \
+	TEGRA_GPIO_PORT(TEGRA256_MAIN, _name, _bank, _port, _pins)
 
 static const struct tegra_gpio_port tegra256_main_ports[] = {
 	TEGRA256_MAIN_GPIO_PORT(A, 0, 0, 8),
-- 
2.43.0


