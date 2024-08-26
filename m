Return-Path: <linux-gpio+bounces-9142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89695EAB3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E16B2B208FC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99D7139CFC;
	Mon, 26 Aug 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="XMmhFzNb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2068.outbound.protection.outlook.com [40.107.255.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D685654;
	Mon, 26 Aug 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658057; cv=fail; b=tYfZp/xf1RFHoQkdp6I3yfgn+OIy0EHRuMggx9Q5JPjcAHr0s+1XKrsbNBmawTS5ksIl+GwlOrZrTXJwWGBlGH4l6dLAfoueJ2m19tGIOHePhLCDbMLoJVczN7oaBCJvJlJaI3D5KST2WpbKonosnxk8YLWZTWwSRejgbnJZdYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658057; c=relaxed/simple;
	bh=DKp3F8SLZWnf0G3y/YtlnTi2ym0DSwX063hoc7P9A60=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FcI7e5dtzOFHzK/6TYD+eKrX5XmKH6tNQtfoDLinYvSB8u82Ny7+s2z9SPs/J6qEMmSlo0xYX1x0JkrstRmKciWl0coriyuXnlse9EX/CusKIXhbeHldvnqunfpUcS27Wmz2oT/UaTlNqiwyBvPvshcmyL5fLt9gA6/yRvBsVXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=XMmhFzNb; arc=fail smtp.client-ip=40.107.255.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siE0NPO7josp31siu7lPmlGMwmRiIxtI7X4Y0J19JJ+YrJOsqhUDAGTye16SzcQbQRLu1X6PHiXkTKv/UdpgF3PwDZj8etDo/vAblePXG2V213MzcS3gFy6xO8MtYILTnZm0Df4xe9123cuqJ2CdXR659SuUAeifC1j9MAOSgimzb1Uov5RgAXHNLAmTXXBrJ4gRs9Nok1cEO6P9sfchrDu98lEbxvdBzSOQ9LUPSTO4G/R3nSLIsxkLvMefh5IMnnEGsPdsZQzcdZUhakBxq+JQiNRzW4SETVP6XmEUttjBdJH0UOhuv3Eh3ucjOQKYhlNHrLm5ugEZmylMnFs0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu9WQLbg+Y6FbsPkRYRMIpVr3PUbcyX1yXFj2AEX6/U=;
 b=hCuaWdF+paf8pg3e3vMYZhXbd/5yG4isKSciM+wsLCOlYe1WNECbLMtRscRfgQjTfFomWDQS+KGcQHEePi2uA7A5ph4wF7zJnLDiX/orjoNAQOh+kGDCbvfbNLKJFGFAgTeA0mwACOlmKzx7mL6QSZd6xuuA2tBvWn24IKlAz/WCy+LR8wqJLWzTInnrZBvRG0RCOmsp8Zu9eGLwtBFGx/3Fm9ib1CUibB+FcAzUcZnxf/P9Q8sK93YI9e6FOeth5HbZ99mHyE2gO0bWX5/kJaspUXwoGoxfVyO63eDnhXv+SwHmWEcfI3U7ZBe/oVle0j+NtAQrGac2XQzsLXSgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu9WQLbg+Y6FbsPkRYRMIpVr3PUbcyX1yXFj2AEX6/U=;
 b=XMmhFzNbU4soYmZykAXTX9KHvRSxfWnQ23jhib3umLgBbxOLCN0Q8FhggqFZ9Lypm8A3HT+Dv2i3zCcYfKixm7yIxk0B9Y6P07VmI5btRkoa/wuDSXpMrmVW1f9Pya5D9tzX4wtNz1+FjcxsOLOyStIJUc2+PXjJA5K6nsl0GGHW2+KVo4g7obq6HI8BRpdhl10xL10VY1TtLjDSh4cZjmp/3tWBIxVcb3SLYGpJfvN0SdjVy6sSdNdzNmi+18ZpjZp7gqR+ySfWcKYEHuYMqLgoHY0Lp3riP+vyGaSZt1WL/hwm86/wlwa/qY+awiH846O8OakVFFk/ymmPUdgR3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEZPR06MB5810.apcprd06.prod.outlook.com (2603:1096:101:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 07:40:50 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:40:50 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v2] pinctrl: nomadik: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Mon, 26 Aug 2024 15:40:37 +0800
Message-Id: <20240826074037.2313468-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::23) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SEZPR06MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3b7046-579f-48a4-f28d-08dcc5a267db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5i4QV/tWo939JNouynN63Ljv3ux02DOIeuQycEctjGpjjxqpzi7I8MJrNf+/?=
 =?us-ascii?Q?C6wi/2KOBPPkICmR2VpWHtMiG0fXxVvUeEt9lD4wNACmOaXYVLvZle+T1KBU?=
 =?us-ascii?Q?B07iffqEnazSNbRzPkE6d4ISgNinsdMdpgz2t0tHPaSDvwhFFeEA04wpY7QR?=
 =?us-ascii?Q?mmA/+gMpZFUHERlf0cHMkl1Qn27ByHGb0FtadKhYSTFftgiQaTHSREAa/4ah?=
 =?us-ascii?Q?G7Uib5BDI2ZQczAPubuTJCPlrnbhx+s41glIAE7EvUiKaSUnBsoxd9ksKHqY?=
 =?us-ascii?Q?QdcSplCpCUTuCHyg8K1D/TM20qQwOGJTyPddqcEKhlUasYBhJfwk6aU2+xMn?=
 =?us-ascii?Q?syOHQRxyvCnEB8G+I8ptzpXE39RzAALtOXGSuQgyyHRgFe9AE8zR1E8KiuSw?=
 =?us-ascii?Q?z/CVrxTxe63SHvrvS1FGpRSo4PEVb6uaUxys8MYlvzEwa0cigUzsJ7+5JrDl?=
 =?us-ascii?Q?At7kIj7lmKMqfAJxVqt5/wTo7aacL3J3kTtPhxSnj9LCr1Rt/F+UUwr0JbfW?=
 =?us-ascii?Q?GLZAkDPSm06VzZKfkQIUrjWZUsOJI+wCfZB60ARY9ZP+zSNdA6bntXVyCmtg?=
 =?us-ascii?Q?5f1aBCyEcj6tiqfegliGE46uXYtc3sbpDmbjeodHafxVmgq/zLjA9hlu1CfG?=
 =?us-ascii?Q?OwBvyUxO7+i5eDLdM4mxsN8He5aSD3PoeoHisQJTsNHzMFjsQsLRO/43bxS7?=
 =?us-ascii?Q?W6N7C6W93kpRaLGtOQ+8Ia5kpOnyklz7tp5ufCP6ksi/KfpZRyi9S9Hfm6bv?=
 =?us-ascii?Q?0EsUwydyKfnQMRjetqDXS0dPO+hG077AX926wYM+pM2etbFoirX9RIvXFFEC?=
 =?us-ascii?Q?Ri1X2gcTHIkF2225aiYJGm6tRifZziGaO0ZIOEI3sds0x+JbAGGM3btxZ4rE?=
 =?us-ascii?Q?Mtewaxpvd7l2Fzn57KTu5aoVvGBw5TmKheDKbuFw1xBVlVarKIUHaLdL6LiS?=
 =?us-ascii?Q?dJE0CbWf+hHJ296MxBrgnjuAJXmLq8rBZU1qOG9vpZQQ/tJgIsuGlg/Lhh50?=
 =?us-ascii?Q?Bhz4UkjXNglGHh/ZLLZcuxGe0n6vpHYbpOXTCq8Y+4wJxFugr9sgdpYNi2X8?=
 =?us-ascii?Q?oXdMVTtgErjdwHFMzvFZZPdnBs+qGRALUoOB8hHgryRWMIDemy5oIZwH103W?=
 =?us-ascii?Q?YEdFcmLBOl5bo98DcQXzSGTK2hroulJjXG1hSWy1mTZ6iTRQz4WwPbBQTZdo?=
 =?us-ascii?Q?rnc5Ob2yeBiZ6lUbt7+w4QJ/og0I74FIpH7OsVhis577PXt8E5DIOL5R04Em?=
 =?us-ascii?Q?6rKUTOramXfilpSKvtAlNV00RmVsoJJ72OLVPZBqb+eQU+j9keoxDVxbr8R7?=
 =?us-ascii?Q?u2p+R0pzik48FlZDEuEjpI7cykIYKDLGy6aokxC0cXnddCEoWWOpV9yKLFEG?=
 =?us-ascii?Q?KpHroaJhQic+Lsc0k6poMAB6KnYV9B+yD24zBXkDBSvDTiTpVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dXDipCjvN6Ae4YFEfUGt5W5heuwkvJjL1KsIGZ09wwcei2wUq/753FyQvz0q?=
 =?us-ascii?Q?k750Xx6hy24unjKNqFQSFoLR5kgIbQygsgaqtpPx5TLvLVqrS2swVd5tVfX+?=
 =?us-ascii?Q?OIvjEHPi8hvPGfaepwHocDjEZ0zuNsUhqL7AKT3at+DdetYDnzKQJpEGhbqt?=
 =?us-ascii?Q?2DAw0hHQRDeLG7HugiehmS8mo9Snd7kQ0fuEyKWsBPfvGW6UB4FqR8Y3GIF9?=
 =?us-ascii?Q?q3+VGQehDjfgcCuly6nEulBk1ttsSitKd2kE9Go204urD99+bmI6+H1vHDLp?=
 =?us-ascii?Q?d7buD4FRMkZbpTkB7B0rWM+V9bjPNAX3JWndywnvmrHzgZV5X0ThYiay+cZ3?=
 =?us-ascii?Q?rXsojZt7Dx4+WEfiLCxuKk/JIXkz5DWjWHiqurM7ZlVxkUtHUhVwT/uK+61m?=
 =?us-ascii?Q?aqBYR950c4k2h4yKc6lfoWEP5hoyPwXh4bAS8whzwXCXzJ+XvnwWyTM0+cIj?=
 =?us-ascii?Q?ENiqQPa7ORyxChUFOVqRpNErRWqkdShwtGVhSnQ2S/9/7yXmM4VdRB6gqO2t?=
 =?us-ascii?Q?pbYDKjRP8J5FK4n0EYSips4Se1CzY1SIfcaEexXCmo9UZxANGn/tOyFZDNOt?=
 =?us-ascii?Q?P0FnyGgU+ZdWw6zLUF4JE3W/4VpelNWE3tQufGu6qwUuzJ6Kxm9vNVsofCcb?=
 =?us-ascii?Q?ySb3AGiUmm0137/XQ797C7ZyWm2BB7/9YZrNIHtJXdhXtsMtEt2b8owDXB7P?=
 =?us-ascii?Q?LTF/HAmEdNU3LREmXAr9cS5pY+U6gmxZUF69YiDfs+eBXbHvK0guTBpBwMsn?=
 =?us-ascii?Q?5ZpK18UnHwJGn9/TMxLOt69nF8P6+pw/cr6JE2NcMRrTXH4GVUIOfeiirBeX?=
 =?us-ascii?Q?VaxJtiw9wo0suNdjWmmfrOg0o1Z2bZ2SiXDRwvmKi392thT5KE38bqf/OvVN?=
 =?us-ascii?Q?dWymKtXfVhpBk2jyr/cw4qSx4EEakGiBIm+m5CM3w8NBFgPa0JRyJiui4/ab?=
 =?us-ascii?Q?22cBnzlAr5F2y0FhlaKXGCsAY1fmmOwZeVn725KvB9ykT0taVsl37xBr691r?=
 =?us-ascii?Q?Ti+LfflXCAJobiTTog8GSB9o5QWmr1ST69ILpZZE9YTMHbpIC2Z0HguIB//c?=
 =?us-ascii?Q?apa0RyZ++OA8FMag4JSNVOB4DWB5RsqkGzWNYvk34PMvp9JOipj6y/Rr7DBQ?=
 =?us-ascii?Q?D8C9HT2oZ/r/3QwwBbvaLRxT+3rVpJb4YrF2nqsVnnS0fCwVby7RMm39lpUP?=
 =?us-ascii?Q?XyJ63AnbRO6WNUYafo6Ll7Li+b7fazAIxue6VwZztzWthmrnjUGLuJhpWlKL?=
 =?us-ascii?Q?gzebQ74v70XasGvLig+yoM20pkJHmALx5wvGLjk7m+kpRUf9oeE/id1g7oVJ?=
 =?us-ascii?Q?m3ob0VOjztK4mEYcaTrqWMCdJA/x/FoPSsMWRpoBSVJJZG94sCPUGja5TGiw?=
 =?us-ascii?Q?U1VbJRlvs5zkM+nNk5Afj8Xvu3c73Hsdz06T5eoCr3qoIgN14DtwTNnx+HNE?=
 =?us-ascii?Q?eILWweZI+Q0HyHIwK5KL/eEGmRV3xSC6wpLiqaVyadO20FxzUhlUNnG3YVQM?=
 =?us-ascii?Q?S1hunJ6e2jcC+PpHtqzPBTRk/9PS8EII2pppfumhkDDZ/dmo+uq3sMazZUjb?=
 =?us-ascii?Q?W9tRJIyU8bd5ocUfjnSk9t89DV2Z2zI7MakmrXlW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3b7046-579f-48a4-f28d-08dcc5a267db
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:40:49.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HglSDmlpcbKxABqBybVXid8f45BcEnI8259z28waRID9dapfU6fBZzRvRH2n5ekkgXf5nsxF6DhODMGhEwZRLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5810

Let the kememdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c  | 3 +--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 47f62c89955a..68750b6f8e57 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -716,8 +716,7 @@ static int abx500_dt_add_map_configs(struct pinctrl_map **map,
 	if (*num_maps == *reserved_maps)
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs), GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index fa78d5ecc685..f4f10c60c1d2 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -601,8 +601,7 @@ static int nmk_dt_add_map_configs(struct pinctrl_map **map,
 	if (*num_maps == *reserved_maps)
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs), GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
-- 
2.34.1


