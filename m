Return-Path: <linux-gpio+bounces-9030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC4395C7F8
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 10:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84B51C214E9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 08:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC61B14375C;
	Fri, 23 Aug 2024 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aX/8QRlG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2059.outbound.protection.outlook.com [40.107.255.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990203D552;
	Fri, 23 Aug 2024 08:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401481; cv=fail; b=a/LnlH+3ntOjvQ/CTc+qoExV2LrWQISOS+EoZE6JltX4SsqlLQmjw5ey6qf/sZAtoAnQsezbM00EKl1Fec10q5nuucr5kb7Ihh3/QQ3IFJSwgiLMQRjawngAchw6yfX7NN357YUIHE7db3Q3ViB4J2vYUrjyc/JwuhcKyiBLtOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401481; c=relaxed/simple;
	bh=vD035+GPuFjehY+FGM9+55EMI3MK5Uwuz2cUJb27W1k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lC+p77Pw/jZPlG0YtoOyE2D70sJ76nsXuBmw0cOn2NKyAsA2qHz07nv4S3QzzCjb1IUCf3KAwFwR/ygy3pYvl6JHGWqQQnrtRFQqG0kPR7EklbdlBxp5TUiE/rrXpYG3G+6CInSd5fh4erSizxwDH+KsK2MKEKOSD2eyfFTlD68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aX/8QRlG; arc=fail smtp.client-ip=40.107.255.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2ocU7mVPZP8WTPHzt1zaf3GYeYxtD8dN6+v0k1b0/WZpqwhP9FWysNYYPQBpQOOUtHqI1RSqSOSxKdAty7Ax2ucKrsV1Dw1P+Rho3/b4eBRVHX8tHxxXFZhblEU2PuJ4u6/UsPMYdSxwRPvjJvKO1YwNnCWEdBfy3niHRg62kwulaOR7SBZaICMO90sYoAiZ7CtJWqiWFKK6QvnPTT3Z/ubiOxrk0LNY680Oc40W6jDs23D6y4oTZD79dbuE52GHesGly/P53j7L9fcUn+OMhpO18I+NvcZf1Dv41doJZN36w9yr5Pk14eXU140ch+E4ZsA+g05+Zo6XNWXIWS3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmPM02ph6BW5C7tmT6hXy2+cA48fSak8DeXOX65CSGY=;
 b=iXVUgLi9UcrC8QOiGcDjyLhxpRcMzap//VjeVMx5TDR42Jgu5ELD0kAsH00BSlhUlKtoyZTaOa74uDhSd2qaotkWVJ2qOYJSfZmW0az6XFZ6tUo/tFJtEUJJleNQmXhwyEk8RDhupaTMxx/F3lRe5TxpdYURjg4cA/Wllj6Ke+C7HmH3oaoQxGZrMC/XBCxo3gxq9BVemVP4r9wYcsDwoV4lcpGDg/F/WbqDohSu89ks0pJsPkfbnkIxGHZ7NJD+uM5IFQTWjYAwk+wpuElBPCabYNoBDVH+UgR/thCNkAr5Uow/J0xWAwtK7wIdd3SfTUViymJ0xICXqJI5BgeNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmPM02ph6BW5C7tmT6hXy2+cA48fSak8DeXOX65CSGY=;
 b=aX/8QRlG5Q1IskiK3OvoOxNtmJtjSLq7UGesrO1YHn/jSz0en2ZBg6U3YXGNzDcsXubfXMdyTjfAJS+KM1mzClmETN8bbyLAxWWCm9q84cu2/W/ieZMAs1waaRnUQHeTJJsosSBfyDJngGgLC3h6VL2MnL0X+RzUoTlYpudnKeQznRq/cCy1rnYtSyZ1fHK/A409mzmazEsI9tZdl8u+vQ9mvdp4Dpc6hHNyiVKoEPwi4BsbF4pgepkaAOFoMTMBDQRRIW04pZg020M4RDbMkZwIzzNIxuHvI0NbRNRaQ7EbKQSPmR4g0+5Hs9vRcc69DUapZWvuurYkrAovQxPucg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SEYPR06MB5232.apcprd06.prod.outlook.com (2603:1096:101:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 08:24:33 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:24:33 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] drivers/pinctrl/samsung: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Fri, 23 Aug 2024 16:24:07 +0800
Message-Id: <20240823082407.48219-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SEYPR06MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec7f153-ce1d-4088-2275-08dcc34d0474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+mxq+RnnM+E6dQUw+eNopg0XusEF5WVHd0Fz+LG9HsVP/PUhKSjUGCBLR6IS?=
 =?us-ascii?Q?sfPxh69a7IDh+NScDp0djjLJ5o+CgDj/CdFgTlGAe7JYFHkoaL4XLPERbSnE?=
 =?us-ascii?Q?Jid9uZ7sx6A0iWPhycidhwAyADQQgyghJtUqbqBILmv7EW6rZVd/buTS7wXo?=
 =?us-ascii?Q?WWP3eBSdN6fCeY0fWl+aHUx4fV0nyyjzVoA8anIHIfpQur/SA86T9qJqYK03?=
 =?us-ascii?Q?mbLhUYHylU1WITa631fy7yxXaRSvnoQbGYnHLY9XnRxoteDjQKrXQnSGibo6?=
 =?us-ascii?Q?OSEqyLu9IsTglBTySm4nEfaUvW58kDUZ/MUwU6BXSeeLF4dItpFUEIJLk6Zk?=
 =?us-ascii?Q?YEeTD3usrAnxcg3mwemzkpn883wAnG1PCE02f44kxVSeUBTlghR85981sxk/?=
 =?us-ascii?Q?yznZ3DymoWvobtSxhEXlXiJ4IdTpPPmMHKwhTSuqhKniLFcvvp0QO70fUqdx?=
 =?us-ascii?Q?VyIxYc6+p4J83dOjDcFPRVZOJhbpQNFGXJNq2Ri2iyGH1IXthJrXAuecLiqH?=
 =?us-ascii?Q?W5oLj523PX41PwW2e/KIAsu9pfq9iq4jWqteMKGYNDM7baToId29ho4pjNT5?=
 =?us-ascii?Q?O8rhwi2uVmD56QC4Kt8fl91J6Dd/XSoXkaDV1xxKNCnr7jeEMASdnmic0/pt?=
 =?us-ascii?Q?gXnf3YzK1oYMQO1pFQBWv+QU/KBGWOS3SdCQefDwUkat4OrHQ87/X+RXP1hP?=
 =?us-ascii?Q?PsJ/4mrIFC7VLPRs4NLqYuL8rgsvH5s/6zvTEraQCHT/9hqm9qpYAtLgX104?=
 =?us-ascii?Q?1gGqW9PSX5q/e84O1C/Nn58dTkWc9DVR9aQunLEBVOIGgtzOuPJh8aK9C5wG?=
 =?us-ascii?Q?BJH4ehzYDLiOduFNAdUyeJmMPzyEl/mIktONUGE/vNAE/lpQIte+CCtjbV40?=
 =?us-ascii?Q?zgD/0xQhJyVrNnqUOBBLjcfyXfcb0rw8U93S0IU2Aj2Tf6sza7zhtmZc4qaN?=
 =?us-ascii?Q?Qqs8mMJkyaMgF63TD4ujth00BcSB1bUQaWCmr1wgLfrOzO3Z3lvdFuTdyFvS?=
 =?us-ascii?Q?AVk4mMG4zwSYPqsdQfCsdj9rZqbYNDOL68a/HnIxtI9EnjElA9SmUamNVNl5?=
 =?us-ascii?Q?4lc8Ro9SJ8+DiW8aKBnxfs8ge3qqbYCxwUmmMJfY8nmB4+1ph+50WgWx29Xa?=
 =?us-ascii?Q?39bqEq4RFwRV7a6CoB0aORnUG5q/tke4iO0eRq9KhbfVZSyXKk2IV7w+UDBV?=
 =?us-ascii?Q?EycoEZfgQZRnF8+hjbX0vmWPYiXyECwjVae+tYwXvq8dHTh8Azl7oe1gVU34?=
 =?us-ascii?Q?zL2P5BnDbJNzjsM3ONATEixzGD7eJEWtwuGyC0cdYx/IVLcF79hRlufdSiGt?=
 =?us-ascii?Q?tsho5V5zPe9B/cBrAbluqds+8WDVfvvGbGPnyOt/yJMqdD0Lod/K/SJW3w/U?=
 =?us-ascii?Q?/5mXVSXK0S4zdvmt7tx9aMnoyjro08SSaw+G+rttbWPzW8Ze2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EKgHSJuq86CaWhGpLvb23mtFWEIuDEpl1J69iXLHOZGbR22hBKgeXxoqJdyz?=
 =?us-ascii?Q?KQd4Yg6vGUZjB++NvTK3tguY+q7WflhxiMWX+kld09fi8cQHFofwkTQBiS2d?=
 =?us-ascii?Q?fWXOIuqJrV8O6jRW9iXhIkS/iUt4to/t/Mtnunk6y8dIeoxvcVPdq8Gam8/D?=
 =?us-ascii?Q?zGfAnbPqESGG8ZMN5s1Prh2KEuOEv7izYBnTbELEar5aYpWcftF5U5Tty6+7?=
 =?us-ascii?Q?weM824IW+dDCYqO+8p0cqaHPBjTUFIdk7fKHFCfgdMdgsGHYllGNl9HTtsoj?=
 =?us-ascii?Q?aIKrxXUcHM/K1SgiyVP8zZCp0OkjA25r1XY67kkEKRn9mFniZOG2Ji6uquL8?=
 =?us-ascii?Q?KKf/7sRmUPD+GgHqa6Ue/X3qriFZk4b/zMRh2tY/4TzK8l4QwTTWzSxOAXCx?=
 =?us-ascii?Q?XjS5wOvdlurt99FmKyfPZxg7KWBfHZs8jjTiQL15FVjSRyMHXOIR1B/huNBa?=
 =?us-ascii?Q?KJYJo8oCZudzFscFfPaK9sz9eYwSFUsz9+YZcclXkZNmrc3HNe5edapefKKy?=
 =?us-ascii?Q?kJ3kfgXXh3D0fx6m5Fcd40DJd4NO1lWdud/FRbnsF7oB3xKgTfo4StcLL2Ri?=
 =?us-ascii?Q?JqON3kCG0FGROCUkKZruveAilwda5tifddrR+1IpbIPRa9KUnvaxvLpLmJws?=
 =?us-ascii?Q?Cb+hkOVNI/oeBoJlIqHTnCpT3Ol6am3fZ7++SP15R+ovij5rcdC5QX+CgmBY?=
 =?us-ascii?Q?nZITDVgZwbTPE9W7JEF1YpbZwIv2v2wa6mI9Rb9MaLluXy3HDqesCBwxtYV0?=
 =?us-ascii?Q?unNcU2YfDdQULqQZKcZ5eAdILvDwEFD9BckmxTXKKQquY4TuJUYsUWh/+rwy?=
 =?us-ascii?Q?yM/Dq73I919IYiPKKKfeI9q2jAPBbXt+4RnJ/2+oyu6YAGXcaJ/VMUVyysFu?=
 =?us-ascii?Q?QoMCs/zF5t2Mt0Xf78yyhsvgtVt8RkSS1xj4rNmxdaXzSI9cduIQwEEpzBHY?=
 =?us-ascii?Q?SFYdgASdTpXLDAIAxdvzSMuAceJ7QV8kkr/4u2WiQJDUDU3vSfwF98pToHq0?=
 =?us-ascii?Q?Ml3AzyvmwAfJBG8EG/gAhdL1HloEb1vCfKydt/VTh1Xoh5wzuaMxUbkWzmdi?=
 =?us-ascii?Q?bcm0/VMkW1cZk973TYkjlLYlV5QVvDDJ/nRS+4fAuoPwBDjSUX/GSCSm2sEX?=
 =?us-ascii?Q?YH+mQyWR+m+QWOrwHV3FDHVq6LljzO06YUwbNPaRvg5Isar/gpb4dO7+CFaM?=
 =?us-ascii?Q?lnEbx/4NNyq5c1XZlo5i1a2tQCHXe9qOKCTkNHM5ZH48cJRjtTxyNVFmunr1?=
 =?us-ascii?Q?DVT6/cevefBEY/76x56/p3pUQvYlZjDNbbfQj2m3ZPL9yjKLG540Vn5lkpOU?=
 =?us-ascii?Q?Z09ZPz5iMiUqWXP7uuMfIW5VkK8rzOqGGmeGDM3gK2jkCAi5zEOiOq4OX7JH?=
 =?us-ascii?Q?dsC0yWpO6wg8+OlCzoOQy0xwdBlJ1VV0u/IerVCDiWwGa6uiuewc1u9U6TYn?=
 =?us-ascii?Q?9gnXp48kJZ6wIfuZ1cS4zQ5zO4uLuDI0aOXpX9Qm4558BGrdyWTCgGkptslW?=
 =?us-ascii?Q?GPrR7JvHfblTtQtdUI9nOHHVuZHb1I9AmiBGd4kBg/4laGv+7O2Vh9x1/Ax+?=
 =?us-ascii?Q?Ia+dnJoRTRoOAEABmpEV2FEBs1ulbknhp/pCnRnl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec7f153-ce1d-4088-2275-08dcc34d0474
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:24:33.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKKPh+51VfsDRKYrICG29opdBk7k4ZKT2Zp7e4UsAlcC2ON8gcNXZwOPSCD+umM4WFNx+jtcEC1bPg7yfwV0rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5232

Let the kememdup_array() take care about
multiplication and possible overflows.

Using kmemdup_array() is more appropriate 
and makes the code easier to audit.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index e4464ee815f9..da24890f27f7 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -122,8 +122,8 @@ static int add_map_configs(struct device *dev, struct pinctrl_map **map,
 	if (WARN_ON(*num_maps == *reserved_maps))
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs,
+					sizeof(*dup_configs), GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
-- 
2.17.1


