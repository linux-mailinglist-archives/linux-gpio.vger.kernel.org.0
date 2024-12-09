Return-Path: <linux-gpio+bounces-13633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A411B9E8FD5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5991528162C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50113216E26;
	Mon,  9 Dec 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QzuvIUIL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE9621660B;
	Mon,  9 Dec 2024 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733739228; cv=fail; b=DxhtBWFJP9rg7Uz5oj+2cfu8x4apwh+jKQNUSZxT8kg0N6WY+NaBZq0Nn7XeyH1hSQJSZyDE73XT5oXX7/xGmUEjaa8URYd60ThXkpYMaCQsWfvbUgFuJrFwv1diCVbhwTJCzgc81h/fOPbgCz9XPkfRgObqiT9917yDN2Ku1ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733739228; c=relaxed/simple;
	bh=rDMHf9Rv5wz6flotiWfqUTy+E9yjDi3rL9v5pYxMVWM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mcb3sjmDbYPR1N1f6wOpGT0azUDViFBvIQQ83Q7dVtLcB2SymQTRcbhUhR/svk/QGCI1JoWfXZyvYUiMVtVerUTRf01gQG5swG22DNiQjKFZ6vwrlkJiSlIBniyAcFr2GUjcaVNY6DIkU+w4QClvgiGzxBvpDBofoOV5BJRqGD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QzuvIUIL; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQxuNBvey+XJfGdOf8BoPyBxO5lR57VZob94PtajgEOWkz8zFESKBkbxl0+Y4AL1P7bX5c/suUMb4ltWwq+XcnQDVrDZ6dwHfot6etQD3VHTrJfeU4lgSvCV//yWl36CYZOWEQ+mDlst62b0eD/zD7ZqdY0228hH8MqrkQDT3UdSY0gxfV7tjk39uMij4DdL9ub+R8g5O2CgwU0Te9CDIAmbjYZ6WPwc2vRNiCwbU9qP3QOtn5lq8BTJ4Fh4EsqqclIRJzjZOV/4gMtE7b6Egws/pDLsngkf82t91ce8Z83tdEL8Ydut4+jaJvw0VID1I0HQco+u/dFBAS+rrBiEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXWWA28Y8ma3+i4PeF9huPMKRLDjL7ozxkHxjnlDr3g=;
 b=lcHAkCDaytJ1YSREqiwBJNVnSiPjFk3X3b4AUVAH/D4nd9dZxWCPMN2tp3VEI3POwD8EGywKFXI3iYxd03QQ3Wt+RMvp+YiykgH+UrA2hn6I2n7Mz6fASLfrHUwkzwzeOyoh3AZSBI4iUE1YdOorWlsos+S5HUtT932sGoJgUwKocPBtQGSMlwgFtPg5sTrqboijBzfjah/xY02PvJrbmBo2jFUThp0ofHrInF7Y7XQCp6fqee7S9djwtkDz71HrKL0oM+/mF8/T+dZUc6eYQt720f6uVkAF+lcIIN950hQc0XXHFD2yvsf9abaH9PGmcPWNJ9eBL2ljeD7DWcJkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXWWA28Y8ma3+i4PeF9huPMKRLDjL7ozxkHxjnlDr3g=;
 b=QzuvIUIL1K4ariCzrEYal60ZAUhW99OvnAi3lY2DnQ15L59bVGS4m+tW/VVLhbePgp7pj/lq1gXetyCzsUQvKiwpFd7wJDcTepfDN3MDFFT9FbNEclL9wa4AJYVGcdzM2Wz2m6AZBRQdLXE/meV+RQ3FnedSPoMBshnWrbhkl8H+0NxkHwFB2LEi5VsmoWtWP00W9LpCGWwyRaXZBZGjQqohkn1enkJ3U1+qvbOH+J1AE8HZISujj4g0mT8GD6Qinu+X/hCjLMqB8JZiMlxsvAM8p5oWIrDYa+4EhmQpzQ3ClfoEchS7mIRBNFEMCv5Q3pA6uhyWNfgwyC+ZX9EfxQ==
Received: from BN0PR02CA0051.namprd02.prod.outlook.com (2603:10b6:408:e5::26)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 10:13:38 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::a0) by BN0PR02CA0051.outlook.office365.com
 (2603:10b6:408:e5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Mon,
 9 Dec 2024 10:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 10:13:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 02:13:18 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 9 Dec 2024 02:13:17 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 02:13:15 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<pshete@nvidia.com>, <peng.fan@nxp.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl-tegra: Add config property GPIO mode
Date: Mon, 9 Dec 2024 15:43:14 +0530
Message-ID: <20241209101314.22834-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d521c24-cc34-4625-3366-08dd183a25c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s/gMnhaha291Mpd5r1///inNWJb9iYXGUoeveO+s1REl4Th5Jg35aSLOgJE4?=
 =?us-ascii?Q?Av2KqkFR0Q2KmEASv3+L1kEPA/zr5MW8URNCa4613p5IHrvrJvyZmRJTfyGA?=
 =?us-ascii?Q?0UL/xrI0JS4yQv/UUmJ1SzTNo6pSX3eL8NbBvqDb+ve+mKJg0jDpjxSEHeJW?=
 =?us-ascii?Q?zUgP7nSPNf7UoSIDmlUcwDGVtlneSy+LLrJqRIlwaRHsVi2qxoC8h+wFTosu?=
 =?us-ascii?Q?e3aR0Nbyo9lSCiYBze3WELCnnZeeXg7M36dSsyOyLgfLObQU5WzYc+PnH/Ng?=
 =?us-ascii?Q?xY5dGdbSMlv/8hy+b/L34pAHfaTMvTShVUobfIMscLaBlDUSrdtPzQ2JOLFC?=
 =?us-ascii?Q?YazCmMwvG8ZpN3cmxzGXFG4XVUHsYyKu9W5mRESJon2RIEZQGIBkkfqGFKKt?=
 =?us-ascii?Q?w8ehuXdFPbd9RScLucqevMYH8UYD7P1KKl+2StZA8LHI/gqOCxIDx3FY6B3B?=
 =?us-ascii?Q?gBgBLMA34ABFJD2Dep8TpEpICc+89agIRznZ9b/eXwppZLjjg5TCX+zWf9Fz?=
 =?us-ascii?Q?mBZ6dgD17sqI9Z5z9M9njj1GMO12Js+iw37fGnvgzJqdVBTchMKcj7zqDCbm?=
 =?us-ascii?Q?7hhMaDzlmjArZt4q75jpjAQB99ldIrPwlukMraZ/Su0PD2fJVKQKrwHN/KAc?=
 =?us-ascii?Q?TvfvLI5qOeG+Ebt9CWazOOlBUwp9rfRNfcIf59sU1pDMmlp2Ecdw73LeOUMX?=
 =?us-ascii?Q?omiGCUlHa+p9FNtTfSHvONFmx8HGwZ2h5ijFSsWh0bLPohRv5rfkbxpmLeIt?=
 =?us-ascii?Q?oZystdDM1UYrnjOYKt2aREEVYf8vqOiTPv5+PwTxBSn9FfCPwOJWaUhcjAmJ?=
 =?us-ascii?Q?tTFv/6Z1FJ+nGG6FlTPR+ocnMKgFmbkXAYQcbL7VHHcgY8bnq0U6oMFi5t44?=
 =?us-ascii?Q?0zoXhtE9RA+FkWAiXHMLQDHaoCmvO/7VCUyuiH20cXpjlo+0P85CwRUWwe4L?=
 =?us-ascii?Q?CG3RaWrFUAkMzlaUsA9N6fGcJkq0F/a9RqhVlDuQO5egSsc6eFx+paot2ez0?=
 =?us-ascii?Q?OfMPzor4tGrqDNLLAeutzOVcFfXrTO/Gxj6Brypi+7JPauhv7PFRYngA/36F?=
 =?us-ascii?Q?4Ej3s61G+ft9cDZNnUiHJ24LX/o+bQ1WpIg9ed7FBg9Qdim+TSkI98byz+6j?=
 =?us-ascii?Q?FENfIpkzjUtvqnDhjQ4g6tcd/DSjruiLqnj9X5NHSNWJt2jZvarNQxEwDQyF?=
 =?us-ascii?Q?LxxD9fwo7q3cSz9hAdFYFdt3xRWfHnvnEE/3DIMY6jbp/F7AKMZ5i47tc3wT?=
 =?us-ascii?Q?1MDZJSlq3w7z3as7VBpIdpcOxatpuWa+ckTkD8bJ7qPDMocxZc2qGO86qEtG?=
 =?us-ascii?Q?rK1me4FhzHcpEIQp/v6fO9y3VPWweCkrefWj/zmWH3al5aKV+Tc/D1VdEdoW?=
 =?us-ascii?Q?NMNqXs0M2cBt1CG406fA8SMlqP4wTUCzkgv5DNTQXadlTwZdNBYZxkOLcJC5?=
 =?us-ascii?Q?HUB+3z5Bc2+CA1ic17scC5rn+KLH6Pzz?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 10:13:37.5726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d521c24-cc34-4625-3366-08dd183a25c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

The SFIO/GPIO select bit is a crucial part of Tegra's pin multiplexing
system:
- When set to 1, the pin operates in SFIO mode, controlled by the
  pin's assigned special function.
- When set to 0, the pin operates as a general-purpose GPIO.

This SFIO/GPIO select bit that is set for a given pin is not displayed,
adding the support to retrieve this information from the
pinmux set for each pin.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 11 +++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 9523b93008d0..b3501c78b5b6 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -96,6 +96,7 @@ static const struct cfg_param {
 	{"nvidia,slew-rate-falling",	TEGRA_PINCONF_PARAM_SLEW_RATE_FALLING},
 	{"nvidia,slew-rate-rising",	TEGRA_PINCONF_PARAM_SLEW_RATE_RISING},
 	{"nvidia,drive-type",		TEGRA_PINCONF_PARAM_DRIVE_TYPE},
+	{"nvidia,gpio-mode",		TEGRA_PINCONF_PARAM_GPIO_MODE},
 };
 
 static int tegra_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
@@ -476,6 +477,16 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		*bit = g->drvtype_bit;
 		*width = 2;
 		break;
+	case TEGRA_PINCONF_PARAM_GPIO_MODE:
+		if (pmx->soc->sfsel_in_mux) {
+			*bank = g->mux_bank;
+			*reg = g->mux_reg;
+			*bit = g->sfsel_bit;
+			*width = 1;
+		} else {
+			*reg = -ENODEV;
+		}
+		break;
 	default:
 		dev_err(pmx->dev, "Invalid config param %04x\n", param);
 		return -ENOTSUPP;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index b97136685f7a..a47ac519f3ec 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -60,6 +60,8 @@ enum tegra_pinconf_param {
 	TEGRA_PINCONF_PARAM_SLEW_RATE_RISING,
 	/* argument: Integer, range is HW-dependant */
 	TEGRA_PINCONF_PARAM_DRIVE_TYPE,
+	/* argument: Boolean */
+	TEGRA_PINCONF_PARAM_GPIO_MODE,
 };
 
 enum tegra_pinconf_pull {
-- 
2.17.1


