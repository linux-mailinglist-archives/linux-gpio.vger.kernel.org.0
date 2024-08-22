Return-Path: <linux-gpio+bounces-8966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CDD95AD46
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 08:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7272C1F23C5B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 06:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A6E137C2A;
	Thu, 22 Aug 2024 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="m56np1oK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2046.outbound.protection.outlook.com [40.107.215.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525FF13699B;
	Thu, 22 Aug 2024 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307304; cv=fail; b=bOUCYmIM4yYolthLDJST6i/YgI8giM80wD68g7YnrSSW9+OQXQwapSyTeK3uW22piiiwBQc920KTqLB1CK4wohc6+Y+3pC2Hhv5umhxw7IFRiyoczDaezSnzX78iIH+A2hNNBNnvWDkBTNxh+8WYDxY4CUQUrVIfAHBaLVGXuKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307304; c=relaxed/simple;
	bh=lCfAT1Wy1up1BsDrDs6gu6LhRKtBtB0BH+2W9q2mSvM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MbRjE9rs7ih+KGMN5KRUZiM4cveFjaw14/clGM6nr/z/uqQ902BLXBFwEp0gfzpL9quQZkLqjsGZR7OLn8rRimhZFeDZ+txDMVsTj8r+cnqGjQgQXn9zyDip/bqwXlhzVPwivf4hcQTZMc9x1fUoDRQzQ9OlcwTVa3nKFhlvkzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=m56np1oK; arc=fail smtp.client-ip=40.107.215.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shxnCtnLleQuf/7EqwkXlaRN0jo1w6VXTR9njokUYWoLkDO2vr+qZFVGO9RhuFn+IZnPBw9bM8WDb/3BfR/x7N+eddoAGbEvfBbbyiZGBIx00V90iMQLoHAxpvUxK5MKcv+/fmM/0Ld4DmhE1cadNbsEa2LrngmalxtHDum2teydRQfFHt+8yPJC1UPzdnemOsaIm6L6gMaUf64I0flt+BwGcZYaoy1HFcK3dbHTwEUtqmR4vhEaHB+n19cdrrJN7I+Suyd3qzqvkNT0zx6WYNbSO0oWFAnBnuSz+T9PGxDcjrUCUtaJAP4EcbZkLmof3t4jCAJFjAsGqF0UMJUXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0ur6iKbFmwl1IdD2YH9vPaetD7KKuKRUnNGOagkSGg=;
 b=lOMVEma5SKG3OWIqDDd5sP/8BgrtiqlMUvJKcPjNgyg5s4caCy26Z5eu6WCOV2/HqBx3mI0KS9d2Hj4WG6vO4DUJ1WDoJ0WxrWXCCFkaT4GrPBYytnFncRnS55UbGJ/5Njk7ZjHsU5Q6vjP6vslmz9W0dAUZ+yB+HS18xdYCql/VRPqZG0Gu/ZHBW4TbfLJQ9vGcQt2pWvvM9T7mkjGD8wRbbJup/D31gRa+XgntyqK+chEu/k6tsk7wd7hi8xtcGNei2xSQIgLqF9uwMkt0KpMrd7Ssl2vDpWXXVuVOwYYz89lNfh33yhmF0MbaeHf4QCy5byvad4o99YMPb3Ztcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0ur6iKbFmwl1IdD2YH9vPaetD7KKuKRUnNGOagkSGg=;
 b=m56np1oKgQ8tlFOr8SB4aCd++jhQSAb1tI5Ih6Z1yJlI9XCbeQ4JgsORInn+Y1V9iFgyHzAxdmc5Tsx/Qz/6bvO7ifUtY65ZLyCellTMHdIZucWBeoAo8k2wtzyqrrTJ7vStwxQckvzFfr5Pl3Eizgq1bT1D8w5EriJce6tIBwzLnHfEiefNbz2HAP8zxC+I8twTKpffOpVW1bKdojv3cn6wI345ge9bKBAzkMQBnrUK+cSBWGQCBHrtIVGUH5exW+iSH4Nqe7dMfo/RWdbE7xtTkfJnTk3qY4y+zCQzZvuzj8+wU2DmBLtfX4x4AQLmLwRZ/5uiHgfFxxzxmrfKvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR06MB6161.apcprd06.prod.outlook.com (2603:1096:820:d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 06:14:56 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:14:56 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drivers/pinctrl/renesas: Switch to use kmemdup_array()
Date: Thu, 22 Aug 2024 14:14:38 +0800
Message-Id: <20240822061438.14617-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR06MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef6bb9c-2f8a-4422-bfa6-08dcc271beaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l45GG3YxfPD79lJ0KYfHzvXelPPio2wBo2s1eQRXZO5UXkHXDY9nK5vxJhHC?=
 =?us-ascii?Q?iA7nzUeE0mAP0Mq/9wuLo2aOgbzy3e3717PAne23xCFAvcwzPK/qIVcmFpen?=
 =?us-ascii?Q?/ReCWVsrUWFF5w5iVibVXT8GmPNRS3sIrWl8OqdKACn2NPiIuYO88Faqav+e?=
 =?us-ascii?Q?QOYreAaBQUjtneZydGccDheJO8rT+3SF1ZkgedbaANq6VoYcjzO0Bci/DiFn?=
 =?us-ascii?Q?moi+0kOw+g0quR6ASS0jfViH2an6dE6pTt0sa4BMsPng4dWRNN8kE8Jg3JNi?=
 =?us-ascii?Q?JkWiz5v/qbErPhbDzfJAQWp5dHkHSCC6GYqxSjj+iUUf8/0ewEbReea+L5us?=
 =?us-ascii?Q?WD0nrwKlA6vKns2fItyDvpdkVyDujATaNXSbtJ6N/Zx3jvWdzW0yrNlM3RMZ?=
 =?us-ascii?Q?/Xeudcarv4AgpSFKh9E2El+0+NDfUbjCWoKWTpsTQM7KYJQJAy0lj/3Hv5uv?=
 =?us-ascii?Q?ZVHUtktnUQRVEydMeR33gPHyAu9kCiaCJbwDuBAEadDL3WfVYqDr/41rRgzG?=
 =?us-ascii?Q?xcX6yIUoOlVENNgrcGmIKKUayAFbUwgrUUFToeGHROqPR53ZNiW6abDToFq6?=
 =?us-ascii?Q?N+bdbJUCsU6nSWkyWZvhLlxiImbb+sy+x58k4mAdVJWwA8wsRrxUnQf1r0w9?=
 =?us-ascii?Q?iqa9eSQ8yeuoXDwSQXHwUlwkh234a8Rh7q2p1J6mTOKyPCH7eZi6KXnU4SHd?=
 =?us-ascii?Q?n3MHhFcywQwup9AmelB1Q45dkcmD2Cuefke5d6BLgqKQjRJuD5+oIfkYcux+?=
 =?us-ascii?Q?UB4dteCkw0j2YiEGjWpIO+G9hv8Z4GCe+z+iyMY30Jlk7Ymbpe3FSgKeOo0x?=
 =?us-ascii?Q?Cpv7PbHXSxzNz0mZw7ikVyLctDpbCDnYWCAIKuYGg5ryFN/0GesueVFbz69j?=
 =?us-ascii?Q?qCMdcIjkw4ygHO4bDR2rqSAYac9cyzmMXavtSdMK7qmfRRZNPny/6U6qV5KM?=
 =?us-ascii?Q?pOkPwGKNnBaRaY+vlb8UTYN+DiATiQwjJCLHTMT5J01l7D7ERBq/28+WItC/?=
 =?us-ascii?Q?Kk2dcay1lWFIaru5qMpGvy9dKEaZfBl2q/Wr7K/VnXdnEKcQwfb1sn/T6+XD?=
 =?us-ascii?Q?08l6cWDzZkvRvBSHAWUX6M8U16wXMrvaYBt7CNa414OZ5F7ZdJp5rxc8q+9V?=
 =?us-ascii?Q?ggzTF90AiwqhB63o9OMHhvs6SRdrqgzSiNOd0v06V/7BLpsTzvsldR0q7b0n?=
 =?us-ascii?Q?1sH91jjadzR88meuxnTgUOufuuQbGeQNKlnoifrSStZYlgI2U+M+EmvlbAEB?=
 =?us-ascii?Q?Bygqae0PKoO/bNVM+E+oWFdvDNl3CBeL6IPQmgF9hYRhAR9eyMjq0CQ0qpTr?=
 =?us-ascii?Q?0UDdLmHl+voyADJVJslksdjUOoLNX21tlw2RGWqZCBU5KrliIK8SOr4M/gY9?=
 =?us-ascii?Q?r/F39qTcUpZIUtA3WdT8wxkNvSQIG1C304vbj2MAJd6JHNnE/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CCop2eS2Disb6G1RQBvr1ZNkxMpVomxPxePNsW8BWDtO7ErxOMMnEG0RMsO6?=
 =?us-ascii?Q?9nrz31vRVPgDZuQraoIpAzfO1chuH67Z7MVDJPdwlfN3r5sy80TLfuMV4hXC?=
 =?us-ascii?Q?tYB5Q+xj7t/tnm3s/fMBN637FZbjW+o1vZTkNYizpHxlax0N2APZivGhrzU6?=
 =?us-ascii?Q?hg7mqBH38AwlM2CC6qDI4FBlgf6eRvGz4hWAQqEXudDdvNiHzZii9JRW+l2X?=
 =?us-ascii?Q?z3x9YeBu3M4SLQbyY0/TMPfKvDgFGbqIuBNFh0hpTqjFxUy5PdLLWw8U+Skf?=
 =?us-ascii?Q?1mVJu7SsmX7jA719mcWRtH2FtlAlM5FSXDvbCKuwQmxHYCvA9WYU6nsnArhK?=
 =?us-ascii?Q?rrvB86Q7TUmPsAuc58q3DqhqgP9L0X59KHWnp0eqImTV0kBKigioXDuS7QbC?=
 =?us-ascii?Q?jq3k3lGn33qny7vA4hy/XOXq+cwJDDHHRDF4gfVsczE9e2zomfjNXWngdekl?=
 =?us-ascii?Q?nAIW8lPdQ5fvQtOLjnu9TKKbowA+J/3gWXnUf5TECcIwLx+rmBH+IvWvaFvC?=
 =?us-ascii?Q?+hMadjqU96Y5Lhrsf2KdrPIwAECT7oEScpVXH/MsIi+XI4XjTt/tGpQedhIE?=
 =?us-ascii?Q?CDEz4xdYRkFwmibkqAd47Wqp90rsa7VGJTL8KRwYTjYI4MlX7NkZWUU8q42h?=
 =?us-ascii?Q?GZjzIwJa2k7RkAoCg/U7kfmBbMgJjHw9y/RBYotuDFnN7n25oN3hcF7Obszu?=
 =?us-ascii?Q?fgt8p9Hxry+qaVNpqAmeqqrXLbX2j9M0UmkkshXun5hGK0Yk2M/I6RVB/UyK?=
 =?us-ascii?Q?+oK0WaptGWAI0pfUSdMf64T+5PwVGMqkExfiy9k62QvlWe1psxiaesGvlwuJ?=
 =?us-ascii?Q?xbTBZmOPYLJRVIHBSsNcnF689rCdh66x9y3Of1HOqPAaGUoqPWojLaGpfOtg?=
 =?us-ascii?Q?XVGn8J3rLfuE19BRVIXPOazccCHIxt79eaoyiqLqfqVrN9mbpOGqsFQe9ceu?=
 =?us-ascii?Q?5fCP86RnyjF/huCvnuasCd/xClocFDIqMc+lrekffQ5AKL/dCggP1lZnbvpq?=
 =?us-ascii?Q?BPYjgP3L43S11O+H81NWsoMx/FzGi2MXsAR0Wy1i9rO1W0o1cY8S5ehG9wfv?=
 =?us-ascii?Q?Yns4/RmR/Dx8B6eAbEeCI+makllZnKsFbQcrTrsqXT2gfltSbHexOqEAN3rs?=
 =?us-ascii?Q?XSla689ceShtgIn5NjNbOoW3IhLe7NIlaqjYXseEftUBRvZUfaFyPsxfULWM?=
 =?us-ascii?Q?rFW+rjKSq92b6gxpIXB3OHPU8bGel6oRwxSQLRB0uoUhsXOOSPHhBUTAd156?=
 =?us-ascii?Q?+ZWm2eIY/Q1yj+nJSCi6V0O/YC9vajlC+3u3Dj6xw7vdUl4GXzZoVaIKCsnZ?=
 =?us-ascii?Q?qbvmuBW3PY28BIzBvEQwsFkdrXaZt+IV/vvz5Jv+/00QHq6pKFRP6lPLI11Z?=
 =?us-ascii?Q?CZTvU0cxR2fb2w/M+CDO01UPzA2ylkLQo0Ur8vJIJ14wL8ETzArjGwyXwln+?=
 =?us-ascii?Q?nY0sqCa/nLVnIceD8mkzjvM+/RPXcW/sWRDHynJEdlYbkaobEDTzKiDEr9+8?=
 =?us-ascii?Q?6IIDxZoHUZwFJapneOfE6mmz6s54vMBxlIUZPYfetaf1ryITN8hZN426p/OQ?=
 =?us-ascii?Q?PkkBVEElPN0Kwf8789WPBu6U3sT9ZAu8IcMi/ESD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef6bb9c-2f8a-4422-bfa6-08dcc271beaf
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:14:56.7926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD0wVXWyOlOM5YhRaNFDR4JUBc8jI/i65K+1od0f92T0ukfKeTc9fty6s1OCk+oaYT2ENXfucPrbqs1QE52t3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6161

Let the kememdup_array() take care about
multiplication and possible overflows.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 4 ++--
 drivers/pinctrl/renesas/pinctrl.c       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5e3d735a8570..afee3427763e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -528,8 +528,8 @@ static int rzg2l_map_add_config(struct pinctrl_map *map,
 {
 	unsigned long *cfgs;
 
-	cfgs = kmemdup(configs, num_configs * sizeof(*cfgs),
-		       GFP_KERNEL);
+	cfgs = kmemdup_array(configs, num_configs,
+				sizeof(*cfgs), GFP_KERNEL);
 	if (!cfgs)
 		return -ENOMEM;
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 0cae5472ac67..d3e1f42f4a56 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -196,8 +196,8 @@ static int rzv2m_map_add_config(struct pinctrl_map *map,
 {
 	unsigned long *cfgs;
 
-	cfgs = kmemdup(configs, num_configs * sizeof(*cfgs),
-		       GFP_KERNEL);
+	cfgs = kmemdup_array(configs, num_configs,
+				sizeof(*cfgs), GFP_KERNEL);
 	if (!cfgs)
 		return -ENOMEM;
 
diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index 03e9bdbc82b9..cfcef35f0e7f 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -83,8 +83,8 @@ static int sh_pfc_map_add_config(struct pinctrl_map *map,
 {
 	unsigned long *cfgs;
 
-	cfgs = kmemdup(configs, num_configs * sizeof(*cfgs),
-		       GFP_KERNEL);
+	cfgs = kmemdup_array(configs, num_configs,
+				sizeof(*cfgs), GFP_KERNEL);
 	if (cfgs == NULL)
 		return -ENOMEM;
 
-- 
2.17.1


