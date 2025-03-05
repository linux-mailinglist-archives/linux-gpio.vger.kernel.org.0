Return-Path: <linux-gpio+bounces-17103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FFBA4FCCA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6771895C83
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EF620DD66;
	Wed,  5 Mar 2025 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oY28O4LD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411020D516;
	Wed,  5 Mar 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171808; cv=fail; b=KQ6B6sXGov2tdNqTSW5Fd8514IQ+BkVV0QrWSnXZaxOfC+7wj5ueX6kIQfefcr57FX7TiuQ10F4TQKyYVVWKTqxjMxdZkq603M0e46CKg7Rz3kMJOYOy0ADlu0px27pW6IRVsUjnP4xOC88qCpyWJ5eVWJJ0s0g6+0UaxxLamJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171808; c=relaxed/simple;
	bh=k8/3p9Zyi5Zjw7Fm6yUlD8skyOgVzVVglBZsEBzLHd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bd7LTV6rVxvz6aPhSnB7p7JQgEs61aJ2sBmMZmwf+0uEE8tc7T0FsPy0+iAC+pVqv5AHairOiqnkHFI8EkAcN5RlRL69DPSxQSgtEuvhe01rEve+6gb4LjfqrUuC8pSGOQZmyFFcfNbxL31rVqA0+Tl30ExpE8GhGMv1t/mHPr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oY28O4LD; arc=fail smtp.client-ip=40.107.96.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5xXdkIkyTZmyRpXYLGlT/Tfl1Q+yZaGts5uyTtRZtsq434PDx/wrzPjlcL0Mv513rLxTjwfuiNo+5v5tScIFFVhDwCMRX9eGFBDnjA/zndblYhfyCgbV9MmpiIZIZkkTycwE7nVbyd3/AkShP0XvRnP1vO5A0TV+EWN0mzoUy5LWb+lvMrQTbgqAxS5acIe/DOL5uFMobWzVgz7Phb9b4hPgmhCFBBbX6FSA5EYQmvzuQcd688Tn6kgsUmDNimoKXhX9yjWY8Yp5+2qWHfH+lZNu3gxkITVZp6Gyg/QsXnJyqb+HH9boB9ZQeN5vckEufkLAuZ6Z2uWzrezuLvOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aknPjH5SiETYEPgbg2eF2BhDXG6XWvR+B7YI3q5jZwk=;
 b=IbTwdPSP+sUnnme0zmm/BGUNjeM0MeZf6zgMy1GH5p6B7ili+WLPMzgIVaysEVeIU0MR9En3rfngtqHzk6lE7xtDeJUncQSDhJoSXk0s6+NugsxjeS66Ti8+OI0I/rrlCFOQj9Ss+Oy7j4bNbP+Qb1JBr++a/FG+ztVhC/ZeugkLNSRc9qBW/GEHrN/bTr46dq04D+V8P9yuKdrvQP9M2LSspgqz35qof2MppdbH0kXrK7VIrUKrMbh1EfIqAaNR1Auv2bIVPoQ7aRntoYcGUYH+3JiXsF8IL7mQ/Q3RV/c0WIWzq0S/6SHAGMkLL89qN039VA5MJCUs6pq6XY9qbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aknPjH5SiETYEPgbg2eF2BhDXG6XWvR+B7YI3q5jZwk=;
 b=oY28O4LDABO0pgZne/KAb9QHHEtlwwQUoaV3WwFvYg/shc9YOl1aGFjEbQ5qOWDqJoztb26qZh5KJktFfso5elkcvtkeBcuGOQHuZgSW+dH4vFM2XGEBWTHy7x2mAWiar3zLvzYLuWaWYrUz2c8K0h+DQ8BDrPXQtsUAI/P6fir+YrOAJ8BmbYbq4lNy2DffU9eZbNmnQpv6VKBgqs8QFw5oOOPaOQWAzkKz64IyCeFEVwWkOTBfQtraos4Eh5agiXz14z3YJSUMyUbxqni9ja+C9xYLusobZdXWl6EitFiwvVOEq97WhO1N3gzsH75f2iG8kfbBV8fRhakvmQM1MQ==
Received: from BYAPR02CA0018.namprd02.prod.outlook.com (2603:10b6:a02:ee::31)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:50:02 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::2b) by BYAPR02CA0018.outlook.office365.com
 (2603:10b6:a02:ee::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 10:50:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 10:50:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Mar 2025
 02:49:46 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Mar
 2025 02:49:46 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 5 Mar 2025 02:49:44 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 2/2] pinctrl-tegra: Restore SFSEL bit when freeing pins
Date: Wed, 5 Mar 2025 16:19:39 +0530
Message-ID: <20250305104939.15168-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250305104939.15168-1-pshete@nvidia.com>
References: <20250305104939.15168-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: cc551027-065b-4abc-bc21-08dd5bd37b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xR8M/LRparuam7bDhUlLTJajDpUFz1eS9nb/jJ4H8zG8crK6VSVZWq0ul8mq?=
 =?us-ascii?Q?DdwQWfrz0ApZk7u821vrPd3oeYRnhwOoZwr2UlhggpBoFHHF+iE0naEmvlnF?=
 =?us-ascii?Q?fU/w/QlLZLd7HwqJnuWUvzznn3zRtjWITw1ggrXr4pu99A8jJoGiuQsMGlJz?=
 =?us-ascii?Q?1mrz4mGT50I6LEAwcTpoUztw9gQINrn7pxL+ekYVTPSPfsAq5yvG8zq43FQv?=
 =?us-ascii?Q?8b/6cz/7Nyco4raFPCYymjzxowU7pF0jCG3oE1jwpgScrotWxFsTp8B2m4rP?=
 =?us-ascii?Q?T+ThJV8X0kzOJSaWS4AvvhMYTWA6+Ac6R9DhduSDR2tIDk5wXH8dbrG1JWlL?=
 =?us-ascii?Q?6eYZPUItroHCaitFrQhnedRRQwUEONolRGPoXsmbzGJbJGyR1nAHBnNZcfDS?=
 =?us-ascii?Q?NvkGcYubuUdT7lG5Q4JQvZizenMOv3iH1VHw+HrhnSW4UPKa0ar0cQBTOpfF?=
 =?us-ascii?Q?SrJby7bYpzD0yuNtVDgeWVVAqgahzz9XFCUbtvxKdSkDmDeeAsr3QMc/2Wah?=
 =?us-ascii?Q?2b5LD0rhL5xKj+iS6ImN2EklDWSIR48NZSdoKKvqLw7K7eMtVCHNR9wdv3dK?=
 =?us-ascii?Q?eUXVaXYlggJbPjGsmEQccv/prjnydaOFNA2DXXxsNKY4j7Va5xm6k0BH4CxQ?=
 =?us-ascii?Q?PkFIHlNAVxpLcAi4Uzneon5n7//clyOge0M82dksXEGR1WMi4WU7oi18UWfq?=
 =?us-ascii?Q?o9am7cuOgW1imK+iOW5hFV/IhlMhSDzkSqH5wuTzAUW1oBI4OzwpE6EmV6SU?=
 =?us-ascii?Q?6F1mflpdt/MyYvKWULdbVp5fL3GXodMkrk8xmRjrZ3r+pRM+GF2yIEb7P40C?=
 =?us-ascii?Q?jvodLNw36Y/4ym0nrjN8hTo4BxF6d3bYzhkdQ+eHsuLwhg9a0xvp9vRH3enc?=
 =?us-ascii?Q?ui0nCcHQxCN9h7M9FkDx09ETKT0xBPFUp0i/oIPjcBlpilnSuCfbquUmDMBg?=
 =?us-ascii?Q?VAQxdPmJsitxFM0c77PxQ+aqc+ljAW1iQ+Hner/xazQR6usAAWBDR4enM5Jo?=
 =?us-ascii?Q?xc4ZulAXeR6cha94dcFg/qZGrAUx41qfHWfJ8ehTqhDmbHNYc2v3PS8M+qdV?=
 =?us-ascii?Q?47Ima/zfxnRS2iVwX+w0Ni1FDA/F15IpkB9t1pOV/PffFXVK1fpM+y2GMHX8?=
 =?us-ascii?Q?aBtiil8OhOTxX0JowuLIQX/zukm8R6VdaDkBZ7OJQTrQDMqam0SzID53P5m+?=
 =?us-ascii?Q?PEEHGIhWMtDwtWLdQKibEYiyFFgdVwrbNm6ICb5WJESTtVnCpe45ICvQiZPA?=
 =?us-ascii?Q?ELQcOG/1oYQ0kPb4Yv50gl6Co8+9Yx0GR/X/4SqmLwm0UT15GkZGHjSSG8B/?=
 =?us-ascii?Q?j+WRRFJ+NJGjwO6l88rV9PwErSQbGKuHpxdbi+uHgbcapqzdBYiGaBTq2Axi?=
 =?us-ascii?Q?wQ8eP8RIgXTBhBA13Z55eQxBj4mTdNXPPghPPF8NGX5lpboPTAC9Pf7isE8W?=
 =?us-ascii?Q?twrhZyeQPCKheNt/mkNEAVfn4kgS58mPtgkoLTkHSDxOCMwhakU6DQ9Nl3C/?=
 =?us-ascii?Q?8WhSre+21K/Sl5E=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:50:01.9688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc551027-065b-4abc-bc21-08dd5bd37b46
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213

Each pin can be configured as a Special Function IO (SFIO) or GPIO,
where the SFIO enables the pin to operate in alternative modes such as
I2C, SPI, etc.

The current implementation sets all the pins back to SFIO mode
even if they were initially in GPIO mode. This can cause glitches
on the pins when pinctrl_gpio_free() is called.

Avoid these undesired glitches by storing the pin's SFIO/GPIO
state on GPIO request and restoring it on GPIO free.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 59 +++++++++++++++++++++++----
 drivers/pinctrl/tegra/pinctrl-tegra.h |  6 +++
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index c83e5a65e680..abe31fead395 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -275,8 +275,8 @@ static int tegra_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctldev,
-					unsigned int offset)
+static int tegra_pinctrl_get_group_index(struct pinctrl_dev *pctldev,
+					 unsigned int offset)
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	unsigned int group, num_pins, j;
@@ -289,12 +289,35 @@ static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *
 			continue;
 		for (j = 0; j < num_pins; j++) {
 			if (offset == pins[j])
-				return &pmx->soc->groups[group];
+				return group;
 		}
 	}
 
-	dev_err(pctldev->dev, "Pingroup not found for pin %u\n", offset);
-	return NULL;
+	return -EINVAL;
+}
+
+static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *pctldev,
+							    unsigned int offset,
+							    int group_index)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+
+	if (group_index < 0 || group_index > pmx->soc->ngroups)
+		return NULL;
+
+	return &pmx->soc->groups[group_index];
+}
+
+static struct tegra_pingroup_config *tegra_pinctrl_get_group_config(struct pinctrl_dev *pctldev,
+								    unsigned int offset,
+								    int group_index)
+{
+	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
+
+	if (group_index < 0)
+		return NULL;
+
+	return &pmx->pingroup_configs[group_index];
 }
 
 static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
@@ -303,12 +326,15 @@ static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	const struct tegra_pingroup *group;
+	struct tegra_pingroup_config *config;
+	int group_index;
 	u32 value;
 
 	if (!pmx->soc->sfsel_in_mux)
 		return 0;
 
-	group = tegra_pinctrl_get_group(pctldev, offset);
+	group_index = tegra_pinctrl_get_group_index(pctldev, offset);
+	group = tegra_pinctrl_get_group(pctldev, offset, group_index);
 
 	if (!group)
 		return -EINVAL;
@@ -316,7 +342,11 @@ static int tegra_pinctrl_gpio_request_enable(struct pinctrl_dev *pctldev,
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return -EINVAL;
 
+	config = tegra_pinctrl_get_group_config(pctldev, offset, group_index);
+	if (!config)
+		return -EINVAL;
 	value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
+	config->is_sfsel = (value & BIT(group->sfsel_bit)) != 0;
 	value &= ~BIT(group->sfsel_bit);
 	pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
 
@@ -329,12 +359,15 @@ static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 	const struct tegra_pingroup *group;
+	struct tegra_pingroup_config *config;
+	int group_index;
 	u32 value;
 
 	if (!pmx->soc->sfsel_in_mux)
 		return;
 
-	group = tegra_pinctrl_get_group(pctldev, offset);
+	group_index = tegra_pinctrl_get_group_index(pctldev, offset);
+	group = tegra_pinctrl_get_group(pctldev, offset, group_index);
 
 	if (!group)
 		return;
@@ -342,8 +375,12 @@ static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pctldev,
 	if (group->mux_reg < 0 || group->sfsel_bit < 0)
 		return;
 
+	config = tegra_pinctrl_get_group_config(pctldev, offset, group_index);
+	if (!config)
+		return;
 	value = pmx_readl(pmx, group->mux_bank, group->mux_reg);
-	value |= BIT(group->sfsel_bit);
+	if (config->is_sfsel)
+		value |= BIT(group->sfsel_bit);
 	pmx_writel(pmx, value, group->mux_bank, group->mux_reg);
 }
 
@@ -788,6 +825,12 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
 	pmx->dev = &pdev->dev;
 	pmx->soc = soc_data;
 
+	pmx->pingroup_configs = devm_kcalloc(&pdev->dev,
+					     pmx->soc->ngroups, sizeof(*pmx->pingroup_configs),
+					     GFP_KERNEL);
+	if (!pmx->pingroup_configs)
+		return -ENOMEM;
+
 	/*
 	 * Each mux group will appear in 4 functions' list of groups.
 	 * This over-allocates slightly, since not all groups are mux groups.
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index b21f609b5918..ddb371a9d665 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -8,6 +8,10 @@
 #ifndef __PINMUX_TEGRA_H__
 #define __PINMUX_TEGRA_H__
 
+struct tegra_pingroup_config {
+	bool is_sfsel;
+};
+
 struct tegra_pmx {
 	struct device *dev;
 	struct pinctrl_dev *pctl;
@@ -21,6 +25,8 @@ struct tegra_pmx {
 	int nbanks;
 	void __iomem **regs;
 	u32 *backup_regs;
+	/* Array of size soc->ngroups */
+	struct tegra_pingroup_config *pingroup_configs;
 };
 
 enum tegra_pinconf_param {
-- 
2.17.1


