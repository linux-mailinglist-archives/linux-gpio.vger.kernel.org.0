Return-Path: <linux-gpio+bounces-26963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD346BCC57B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 11:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 31EBE3547B1
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 09:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2143C26B77B;
	Fri, 10 Oct 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hUAOJjAs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FABE137932;
	Fri, 10 Oct 2025 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760088583; cv=fail; b=DkzyMJ8oL5mrMbzzu7I0jnJKICEDqUV3VBOqUvb8rH9HDgwYpsB9vcOdg7vgekG/Kj4JY7KzuxEj8RpH2I8ka5AEKm2/CXdIUpyqZAdkJCE3SfoVxmmwH3EHI+6CiFio6GCk+B+adClkstH2TqLPkK59EKAb0AcAG7YPCzFhXts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760088583; c=relaxed/simple;
	bh=MzccJtzennFQRQwxrXNo5Bt0nCxAdZ1JlYACNydkXDk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B4cy7/qjPl39QgBPAF2vaotQxx5MAJLhP/cXp1kvgHyTV6bWw5yH543bvVTNq18+m95XPF2WLqvo1IWMjTTzKAMKcUUEu2PAYlmdsdKuF9iu+5gCl3JT3WNMjJCpDdprzLo0Dl/RbxCx5y3SCHpDXMGZk6R5LmthiFJ9mWD0ejg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hUAOJjAs; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+4c/GQw63QiZbi4sP6JNbk9yQMOD59Xxz0CR6EwF/91ErHY13qrrkapNg4ymWW5P6UHY7uei61atnerfFvAKLOcYU/tq4NDe9sOiWX1a6Ypp/6LhMrg2H/zvuOvOtFeby5ojqhc3eYvKV7bYaAPkmO558EhZni1nFVOdXtO3vl//tnTFKETVYSrASC1Ba2D20K4X6XmVR42kg0zPzz7sR5wt48sWxnTBd03l7pYUJkYo98l597EVbsI660Rus0EIs+uAUFtLEQe4qO/HL5ZL5urjWxjAIifeS1PC6XVglPeoBX7E8nBxguFK6qhQsx8b670Hurd73KNcIv6SrLxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1zF+XtlU7bHK7jrN7q6y/LPioD36/XH8eUji8/u3Xk=;
 b=hhwovVYureR4AQqKn78vqQcrgAAbhFEq5BHFrx3hMS8hTcnEhvtOh+4EsBkR+I8uzznxWGET/mRzm9Bm5d1fmm20+wcJGL01NZAvTediIyArlEnw0iuglxZlkZ3HlOyoB8GLztr3nO/89DhqtMrzxBi/df0EmQui8xbVRiOsNOxlsDl1yQ1l0xFu8tzPM36iwH5KMTprJULSAndMfku0LFMw2F6u8a8+HH4Bi1wp6+2G+07E5e/9M1KSGDwzZCvAAVPEetExGgRDSUp4Mb60dvfTxFvtL1Qz6A9V/8JX+rxlDFqPOPVRG2hpYpsFICdh/UBrIG2EXKykzN15qH8moA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1zF+XtlU7bHK7jrN7q6y/LPioD36/XH8eUji8/u3Xk=;
 b=hUAOJjAsn+K4bmDwkBsxmQv2kdGyQxKyz7v4Gd5VDx/nmZ476c3hKFNFj+3MzvO4jGdGO9dVxjf+XSE811sRWb2TFhB/U87XNs8CLHlsIZT0rx6wpka71DcGJSqsr9QwdiRa5dTIrgexU74IQLxR/ODfkBvU+eDs7/07N3zEdSSNrGfsQfTZ9rPd3bok55dpsSEup5ikeF4S/pxyq2lcDpteYFcmjqVr2W+iZjbRw7seKdoYTB0d+TnalI53gcBwehBj/l2XTvV4kflSX2nDCA++hz5eAXki/wbXXeNNwTU+4nD7eC9OhxEzhjdEL8SRyh/sbp0EYTVdE9gAbnmF9w==
Received: from BL1PR13CA0313.namprd13.prod.outlook.com (2603:10b6:208:2c1::18)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:29:34 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::9f) by BL1PR13CA0313.outlook.office365.com
 (2603:10b6:208:2c1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Fri,
 10 Oct 2025 09:29:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 09:29:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 10 Oct
 2025 02:29:19 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 02:29:19 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 02:29:16 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 1/2] gpio: tegra186: Use generic macro for port definitions
Date: Fri, 10 Oct 2025 14:59:12 +0530
Message-ID: <20251010092913.711906-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: d465aa8b-949a-4422-9ede-08de07df864a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4I7f+IZ7Bs/rq9QQMBNkBqN1BeXP2qPhxU0ZjPPHgXVtEufJ2XnK3vea24D0?=
 =?us-ascii?Q?tiriN7oQtpICAUSa3vbeKyZglp8zEO3ABi+ws2y66ekIV9BBBba7Dy2ARYM2?=
 =?us-ascii?Q?RE+vexoyOk/0ADB6gI94fWXRhSgMDMGWI5RgLs4WFeRhz+ARf+SlCCtu29Og?=
 =?us-ascii?Q?JYembWlLLtVz3SPnbBjUPKlHl5fzoT4vytpCnrFT+aycfmMwONG6dGCyvklD?=
 =?us-ascii?Q?S/x2qYNcYwucLMtpxaH4JbPil5zHcGu8DslvzkEvxZsBaOVfpxlOaJVlEwRk?=
 =?us-ascii?Q?+ByFC6YAHhQtAlp0bgZsRM8Wif9yWbdK4NpOjMm7BSjoyYhDoVKTYjIMYizc?=
 =?us-ascii?Q?2A46ObaxSpdv3TsjxJ9Y+nm1pUUCjXHoirlyOTVoXmkr7o70mMRVd++LiaI6?=
 =?us-ascii?Q?7y3KggyAhX9vGein+aOwlUDfa/MMgCoVYFGLRyFKB+E1/XWRyPpdE8Hmh/tP?=
 =?us-ascii?Q?2qbuVzFYijYVfsuhaWj3Zd/1Dt4ijEMn8YKpOhN4Uck6HlkPZUgbhSD7Vf+J?=
 =?us-ascii?Q?2aLIujE85U5aSj8TlpBvMbH2uXRM4v6ic96eFr6/vqiRXCcPqdUyyI9WmqUb?=
 =?us-ascii?Q?5vuI11sXnd9F3PIZLjefUNx6NEo7tLK5BeoUfd19FUxWAlvyhXYhuNPZYXwU?=
 =?us-ascii?Q?UUzL4zP4Pwrxh4Mx70zanTAuZSALJTq6So5nhLTYAR89ZpDRPeobQQtevZHQ?=
 =?us-ascii?Q?dRC0ZcoCwYRTms+HfIzwiXwbw1eRFbTzuileas495M6Mctlh4eQjUGTrgYYi?=
 =?us-ascii?Q?H+NldvRCZC+cU0Rn7fDKNSbiVJKG8fmtJO2Zz6mVSGC/vfwF/j3OqrnaTtFW?=
 =?us-ascii?Q?gFG/U+Sbde9sjKYKixAzPy6o2b5AnAYJ4G4D8WY4OP13YGXrz4JoiExl52dg?=
 =?us-ascii?Q?UldjP2b+eCWbQBzaz/LF1NUazti5HiJZwnsXxefLstoe20LbhneK5wc4ixuG?=
 =?us-ascii?Q?5VFIYTNVlYyQI8hlNQGFDORXpKhiJpiy7K/KbjwDXw3CJufIy8Ke0IJmkg66?=
 =?us-ascii?Q?YKIlXvZWdnJHZ2nJ45VIjoXypKqzYCSYxHqtbhuvBY0clSNX5EZ4weq1NZaZ?=
 =?us-ascii?Q?K6XXf21/cYBpdLD2594q4qg0bAe8oK6kzE4ukAbIGpNF37PxizV48wD5EdCd?=
 =?us-ascii?Q?/LHQcaPQ5khLH5KHAf94/+Yb/nYea99pT+KUeAk0vAoJwaOwL97AJZfy/4xH?=
 =?us-ascii?Q?0pSB0xr1MBsFoJrMYCVui72wGxMPdwihoIlXH2Enk/llkJcsZCgMKDQXAtLV?=
 =?us-ascii?Q?tbAjup3AM2QOGAIf6Ncu9jNABn0kPcLqOH9PtwtITVVgIALy2AKVXV81pY+X?=
 =?us-ascii?Q?+xMITTg6y7dv6mFffIRCid8ag6Mk2cj4nq/BM7l/ZoXa+aBebVXXGz4D9H7g?=
 =?us-ascii?Q?FE0cKaGrClWSagi3hWsmhHjOZF112SeM8XSXOTjD0ThIOdYqnXsbM9mKt1RK?=
 =?us-ascii?Q?Q0RaGM6nDaMRjs35+/1iShEHEfDLvKwryK7x0Q3cDsqXQnsu4RhKrSIJ1LN6?=
 =?us-ascii?Q?+A/sIYpENBWg4SYy9aiFTUlYO5ihDooNvlgofL6rDnbvoIU+7qbMhC/l1FhY?=
 =?us-ascii?Q?/nNz8mUxe46au2uMDXs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:29:34.3389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d465aa8b-949a-4422-9ede-08de07df864a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

Introduce a generic macro TEGRA_GPIO_PORT to define SoC specific
ports macros. This simplifies the code and avoids unnecessary
duplication.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
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


