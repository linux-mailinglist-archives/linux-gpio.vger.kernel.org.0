Return-Path: <linux-gpio+bounces-17104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D8A4FCCC
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881063A7325
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB59211278;
	Wed,  5 Mar 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gp0kKAg9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A369420B7E7;
	Wed,  5 Mar 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171809; cv=fail; b=upGKSxnRHy3Vi3QwZ+sq3vHzX8bnWZiUHQFMPvilN2kQopDcKu/ZNEV8vZP8pmKqnAFBfKHjefwOKcL99XvUwwl4/2O+cIxNHq3a8BqlgkPFMrbTc8mzMFcT5/3DY74svKkjOUF3J4sI676mRH6MTPJ3RADfnW/bs5y4PWITqK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171809; c=relaxed/simple;
	bh=ToL+1dMao8vRi8xqT7KMm2CGvWwzuZDHUXK6X6KONUU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m3lLcPnd5jnXe6VpVs7ESQC2NRuFXt1teapTrNTtb+7KdymBIEOb0JmWnqlGedROA3pGtXKEOnBIEcUPzpvlSP5RF5dr+fUjVhMMA2uxp1sQGpQ0//fdtuCpJjfbHAeJHnbam4b7trzqDeyZrDJRUi2XZtE26ZXdjQXiIaJcyfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gp0kKAg9; arc=fail smtp.client-ip=40.107.101.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y24q/gtFXWX7fg58M3EdcgB+FnK4aOU0azTymMLbiOil1MW0Dt8rU6piFSF6udU800i4jmHuD8j+FptKpyNZCYLJKfaDzZZasgiJnPcybwgFJHQIUF+FBR4cbcq7y6YxskCfDjNWfxWQLUC5l6w/cszjGpvsReEgiTVVNgw6PYcQ5zBi/QJlukNqLM4eWzIewJuWEKTbq5bYaAkiQ1bZyanS2zzUoH39HvfEi0s1B0ji/uOuD75HrqoOKO8xDT2cg5NqpeRPJqikPNyphnaruVlJp/ecmh+PynYPIzArVf/s1R5NKIZRfUYHv0AkLc0vmxij4Fx3DULFneb1v1rvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z2I71Ed3MHruRGOvxQ1zPh8awIgDk9OJdMYwdX8RdQ=;
 b=UPE5YXnsmAFod5QpYKWORfYAy/leJ1y6ZMWa2jDJHkMRhvNotKyBapfYl+GlESyCX/aDfjzA8RIH96R8kh3yFELD70O/ghW+MOVoY/nLOacCQdnC3VgHh+R5icaX6FZwWdmMsFdvnjYOBM3Y1GNcKKAi9HuHFRxIyZ/zEioLi9+KDhlCf9cqJnvFU+JJ+i3JclFJ9plT6ZkiGxuSvjpKR46ZOOWpcRQtXdsLACH2TgTODAeIfRph+8ybMbSN/O8yqLUhoG2oGW2B/uPGS8CKDe+zzQ8Zh+AXp/MjF19CyhbqTcUKctVX11xeplX1HC3NEIKXR/kSjzqNdzEYe4uGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z2I71Ed3MHruRGOvxQ1zPh8awIgDk9OJdMYwdX8RdQ=;
 b=gp0kKAg9ODdpJmHO7koXsYdWZChn4fr9MRciOkzhvSSR+B0xdZHB4Q0mL8pndjH2zmmLiTTqdliBkqm81f9j08nySaOnwx3X3y48ldi+s56ZSzIviH3bGHu8NxXjqnJR3KSLmojpgEd02cF8Su6cvmwqQa+F/p5GNOr2W21Tzkd33mO8X48EbDzYVoKSQFVZJJVIeuI1AdqDpqS/BBx4eMva9SjukZ7L00loAhAOd+xhvK8iqb3WSosRrWgW7ab+PjbeDqmAUYEolFhaEhiOzKE9a92CMLkecMCHeN7xnCngYat3pzAI9iVASucirpHtMX9NbZx2qn4s/o0NDqKs7g==
Received: from CY5PR22CA0072.namprd22.prod.outlook.com (2603:10b6:930:80::17)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Wed, 5 Mar
 2025 10:50:04 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:80:cafe::13) by CY5PR22CA0072.outlook.office365.com
 (2603:10b6:930:80::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Wed,
 5 Mar 2025 10:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 10:50:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Mar 2025
 02:49:43 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Mar
 2025 02:49:42 -0800
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 5 Mar 2025 02:49:40 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 1/2] pinctrl: tegra: Add descriptions for SoC data fields
Date: Wed, 5 Mar 2025 16:19:38 +0530
Message-ID: <20250305104939.15168-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bde98c-5530-410e-998a-08dd5bd37c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?USu37tsRnp42aW/+lteMm7soN5eohWAOkdMqFvPUoF0IsHgb19oxF7ZiQ7VA?=
 =?us-ascii?Q?F5YTiNu6d+s4BCpbFgC/n+MVoOkm/9GolP4aZ2WV7NFx/b30pBq0rHhdz4zD?=
 =?us-ascii?Q?wcm92zS3rd3gQIVoT5VK5tnvCN1RE0p/wpNcNJPpVIBFk6RAaly1thF2JCxn?=
 =?us-ascii?Q?b1Kn36K4Q2Oyo4ZJyUFIXc2Y7SDKZ0r8ZSMHIO9r3Sa5/Yr16EcdcnZzAJ23?=
 =?us-ascii?Q?IeuAYRhB83lofcyfZl0IOIZgmars/udZbw4liPl48bp3xLSgF9oZ3IzeDIGo?=
 =?us-ascii?Q?viZ/NRE5PIG/InaMv/E/AAe77AbbFkPgeKX3+MhNF8NvWA++dFOb9A0wbet2?=
 =?us-ascii?Q?1BJCP/pcPv4YZaRYPrKP+3akJS93zYy+LYUamu2xtPa/VFrZM8BqvpD+F1BW?=
 =?us-ascii?Q?dCtsZAo7jF+WgNscZifn1xBV0VMPeCtMqhMCjL4E2ogfaC2SCdSF3xaX4tsL?=
 =?us-ascii?Q?vKvvEMVrrOYTiOsyDBZ8wiHZp/LcMjwhf19X/qXSFiHcqqHnuntxLa4F6XDL?=
 =?us-ascii?Q?BYDOanAcnZQYg3smHE2/V3rKgB3PFeixEpGCDf8fc7fjSYYvG8/tPmGRzNBg?=
 =?us-ascii?Q?Uip+AXS3OLKxhOKI+mfroa8pG5oBu7MZUnhTvkDbpi/yFNLorNeDdsWhok/9?=
 =?us-ascii?Q?IHS7gwN2zAxtcgsCaC4E1EEqNf6Kh8hLSPOKpfSF3WrnDv3jrJV2k1hGedLA?=
 =?us-ascii?Q?Woc3kzfSww/AqJ87atejpVkFs1fANBFC0Lhc0xixjsP0YCGKw635s4pkBe6q?=
 =?us-ascii?Q?mum2bgd0zdKrGyyREXjZ64iZZHb/FwiRxHPH6Xu39JZSFIBzccu2hdGdHUEB?=
 =?us-ascii?Q?lBUOTK4ozhGFJHtxVeX4mJs+/mUn1PYWdZLPA0XhOL1zKhDK0Xr3w+pHFjYI?=
 =?us-ascii?Q?2rpfSvolY+aQEv4Gh/GioGH7eYyPGXYmlMi3vSIWAEvuH196T7Cp+n8/QQXM?=
 =?us-ascii?Q?R0uZEbB9WaBDnUQRdwGY1eOf7sBaswl13cdV3G1KRoPoNaD5s1gCn9oMRAkt?=
 =?us-ascii?Q?cRRdfs70kX0hUbad9xmE3lc6gcEtoHGh3nP58GiUqBc0vcduWGB+SvrfcPS7?=
 =?us-ascii?Q?1WGtNR4NV5yT8mExfEGFbjekGqIrENpQCDNEghrMqngiTpkMyBYnozw+F6CE?=
 =?us-ascii?Q?eSC77k908ph2YPwJ/b2RBBYjVCUr41g/oiyk1TxhPT/wNc9wLD/7urMtlmOZ?=
 =?us-ascii?Q?yE6yXfKfnlW74GeWCTkLxsjGWPTl7soCJR/uYgE1pJTePN8XEUFMJp7+SUU+?=
 =?us-ascii?Q?rWnlBiPciPiir+R6LODa6Pr6M7AuXIQAJ0rtxs3X03b0lREEnpIRfFxsxbYp?=
 =?us-ascii?Q?LcnGOQGWBuTH/OngpkA3kESpU9jPTbaS9yJlVZnmSG9D8aSEPGEj8ZO9K6r2?=
 =?us-ascii?Q?kA+hrjHONvzlzccPnt6iGBCwD71eXMsvdb1HybyBbbz1dD2P9s3X8i11v6+h?=
 =?us-ascii?Q?DOW+XsvZsVh63lL4VvjJlCEVPAHSbBtRr0MIlgrv4H83kHFEyRWxoePyTOYD?=
 =?us-ascii?Q?2v3bd8dOhSF8XSY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:50:03.5111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bde98c-5530-410e-998a-08dd5bd37c3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063

Add detailed descriptions for the remaining fields in the
tegra_pinctrl_soc_data structure. This improves code documentation
and clarifies the purpose of each field, particularly for the
pin-specific configuration options.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.h | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index b3289bdf727d..b21f609b5918 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -176,16 +176,22 @@ struct tegra_pingroup {
 
 /**
  * struct tegra_pinctrl_soc_data - Tegra pin controller driver configuration
- * @ngpios:	The number of GPIO pins the pin controller HW affects.
- * @pins:	An array describing all pins the pin controller affects.
- *		All pins which are also GPIOs must be listed first within the
- *		array, and be numbered identically to the GPIO controller's
- *		numbering.
- * @npins:	The numbmer of entries in @pins.
- * @functions:	An array describing all mux functions the SoC supports.
- * @nfunctions:	The numbmer of entries in @functions.
- * @groups:	An array describing all pin groups the pin SoC supports.
- * @ngroups:	The numbmer of entries in @groups.
+ * @ngpios:		The number of GPIO pins the pin controller HW affects.
+ * @gpio_compatible:	Device-tree GPIO compatible string.
+ * @pins:		An array describing all pins the pin controller affects.
+ *			All pins which are also GPIOs must be listed first within the
+ *			array, and be numbered identically to the GPIO controller's
+ *			numbering.
+ * @npins:		The number of entries in @pins.
+ * @functions:		An array describing all mux functions the SoC supports.
+ * @nfunctions:		The number of entries in @functions.
+ * @groups:		An array describing all pin groups the pin SoC supports.
+ * @ngroups:		The number of entries in @groups.
+ * @hsm_in_mux:		High-speed mode field. Only applicable to devices with one pin per group.
+ * @schmitt_in_mux:	Schmitt trigger field. Only applicable to devices with one pin per group.
+ * @drvtype_in_mux:	Drivetype field. Only applicable to devices with one pin per group.
+ * @sfsel_in_mux:	Special function selection field.
+ *			Only applicable to devices with one pin per group.
  */
 struct tegra_pinctrl_soc_data {
 	unsigned ngpios;
-- 
2.17.1


