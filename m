Return-Path: <linux-gpio+bounces-9048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27B95CBA9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 13:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2D90B21D88
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0785185E7B;
	Fri, 23 Aug 2024 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ViKcp0bW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010003.outbound.protection.outlook.com [52.101.128.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA961FFC;
	Fri, 23 Aug 2024 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413515; cv=fail; b=ESWQhSJm3Qkg27R3rzckJNF7UQSR1kxbZzecwJV8cDKijg6p7d+gWMB6v0bZEGzIIFJZhyKN3P7M7Uycu3mkaKh13blQGeoVW2xZPlsVz/lpEfmyDQLWneb0mOLjSuj2/+tehmDfEP9qr3rPX8na+CqR64VdIPAemV4YSECFyBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413515; c=relaxed/simple;
	bh=xbrZmB6yN/bmFOMhun40JBa4df57mN4gM27ZaHe3z5k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OKTJR0bSoyf6fep2Q/h/WCE8uRh+wBXkpRXRS5NB75I2Sc0qETRdHOmFaWG9gChctJtp2ZaJl58JFTHT9W7mOLgM0AtMzmNiYQ6eSRJ1HzLxGnnK0yOMO3P1AW27QZs4waD59A26ysydpjU2wcqrl/rfjzuBsRfb/E4/bxRbJFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ViKcp0bW; arc=fail smtp.client-ip=52.101.128.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pS8dV/BwrvU1LZB9DbjPAqrWRYIvZV8Ewd+U2kEgvXfKTHRdn2nepzk9OecYGjU9E05vIlpZviRITEDEuHXyWiA2D0gdh0oNsO3TG6Od3EP2keAWpKyqAjH250ClXQRhKgbHUQxIBf4MUtrGy7VyzPmOELqJlp/nHgJf1Zj1td7i+Y4wsUeJw1ZZd4S9vvW9/h9uFODp8H14OmuMTe8+kGe5R/xnoL1jWsLnMv/bkiYH/Tuh5bPSNmr0koHFmzJGLPMbXZW8rVLXCnQeM+bHmPgTMKWX8sV3GsDjTBx0nQZ2MGSby7AJKtw3ylTWjPzl6n3AzejU0xBIOlTIiHawCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWTc9N5KQn1dkt9YUwjUm/rIJbhWZLhE25W71HtPFic=;
 b=DHSHvnK+pPmF2eUiE1h4lR1Ddr0zJ11gehxf5iHcjsrU/ZxGzkXI1g06c4PVBbKc8GwmhB/wC211ixrj2cxLVUrBWCJyhTUpPYO+9md6dTmFbc+fxKMuP1qoCjWf/xgR383PudiQLD1DnpokxfYs8gqGuQaYSgyYCe8YRga7e3MlGXiVgd1axO3+29ziHd59yJozF3n1S8c19Fa7zhZUFzgYOFmLXCQU2bIvR2aJ1L6SGZQZ2LBDnNg0vMZtX/woByZiSK69K1IHTs+IRD7IVynueYIGk19JY5YDoyhopu8cxrEvyaAwkXr0O/ByD/pOHJC2Wd3BzThXCuSl3NB0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWTc9N5KQn1dkt9YUwjUm/rIJbhWZLhE25W71HtPFic=;
 b=ViKcp0bWatErUzREmIJ7k/A4FzY/qyDNA2h6AGZUsPF4j7ZPmXXCx4x7LgIhFwbrRdapoeFfMG5y2yiXY7fuxxjsQO4AWERV1ppsCsLOFgnKMmDk/wZP62XehiZ49NJhiZDN27hmwJSE3//zEbWmJSaza1eL1JxDdsKl4OtXwl5p5n7Lk1s0Z8BNYqucxE+COil1G+/cWom1Bcoefny5KN4ThIHmF2h6XB349qP8UvtQnhlbbRtWIlPkXTxetDgd8bzWgS256OX0/6JyoGN7W3qk88mRBsE3tW5IH37t49h4UoT8uGCbjGhDxiB5JTD1jYJuG9JNaNOUSHm6RNUeXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR06MB6579.apcprd06.prod.outlook.com (2603:1096:820:f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Fri, 23 Aug
 2024 11:45:08 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 11:45:08 +0000
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
Subject: [PATCH v2] drivers: pinctrl: samsung: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Fri, 23 Aug 2024 19:44:41 +0800
Message-Id: <20240823114441.50648-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:3:17::31) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR06MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: c180d543-fc13-41d3-584f-08dcc36909f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e7PMOuDPKN3//SE294KIvM7CAEHQlNuEYPT69VLtuo9K1DLD21Qgt8wdQ2Wi?=
 =?us-ascii?Q?vnBX4qBSg30j2PFZtzUyYfVvxJfSVPndjwrnyAJD/WhzwyvZjn/WTlvwoN1n?=
 =?us-ascii?Q?+TYEkX76NJEtfNHiU643PoU6q/JAFN5U27I2OwDWE9FukhHDQ7lUAbNTmZId?=
 =?us-ascii?Q?g65dM/wdEks7ztdU/dI8yDyj+jHwnTGOrSqO/3D4PefZHC/UVZtyFcOZ1F2p?=
 =?us-ascii?Q?uLU4P4q3koBeanBvlhfFPj0uaJoHmrTweDhIHl5zH3hj2nfpLMLvj2zuv7IV?=
 =?us-ascii?Q?GazSfvrnAobHzHB7kHf1ln2y98jXbyLlTwnUDkU+hGiDjZCsR529Q29RcS6n?=
 =?us-ascii?Q?S7nEG6Jf3gKRaHaL9mVg6pLEbdz92WB2CZoSVTOTkihXxoMqG4WQZwl+phTu?=
 =?us-ascii?Q?6bmr80V0u06GnS8NK2bQpebMtsOdtIoco1aFCAVSRQr0Nt+j912gW/QhLSfm?=
 =?us-ascii?Q?vCH+2JtjmYEF7I00FqJ9gpKUiIerLdC5ainWLiPpzxEnXNPjd4LDYdpr+P8p?=
 =?us-ascii?Q?UStki5FfEUzPB07qPHWOiMwTXqFXWA8L9FDQLfr1y1UUqhuVqNTauC+hcQI8?=
 =?us-ascii?Q?iyM7/0Um7gsPEUglea2LhrHFDM4tmj1cFEu6l2QsOQWCaBYyhcC9IGzGSzsx?=
 =?us-ascii?Q?QBgFEma45TBDxh38Palv/b+xjCnWtN9bGYNN2QMqvX3A8/jpLUEMQDoUhK2X?=
 =?us-ascii?Q?1mBVWUJCiIQuGIB+b1XtN0Ds0G2b6CL8rXSzdTlnhLwmDiAdgoRM/yse7jac?=
 =?us-ascii?Q?Bjp20QnhnktHG0DFInIljzgB+UlmPXbEvwNKS8oMiwI5BIpjGsACSOCAYa0w?=
 =?us-ascii?Q?rnr6Soa7J83MCphlV4e+G3SgTVwjHykj8kqZW2m6EvTccpejrrj50cvJYCHO?=
 =?us-ascii?Q?dnkbK6K6lvPIputZFq38khsuuKmJWd5Q4w8+w5msQPwHvAyvpF1FrGBsf9Rg?=
 =?us-ascii?Q?pT06MGg24eyGXP6XRMZUGYSQvDA29PYH+WNebXXarzceel83sDo9+o8je66X?=
 =?us-ascii?Q?nnspmLhDVOJvdlcyZtepMinx6K9aIPnBJJZMpTQQ8s6msYKMQuVu2QwdZIO+?=
 =?us-ascii?Q?vCGivt8hFw/FdoivIH5wAx/zxHexFqedKKv9aWDys2ALBPmxZa3tL+027BAw?=
 =?us-ascii?Q?o8OU3LKdHyPE/vtp3jUb94kwjZTCsUi5LnZ4Ic+8HI1RIENLxkG64KfNVdB2?=
 =?us-ascii?Q?5Z3jDiddTRTfMXm+fzWo6qXv+NbynRIimaPR+NEFK2wonb6SbjyYiWgYlmuX?=
 =?us-ascii?Q?7wBk0heWtWhZJJBTjG8HR2Xk3tLRjJVfCsCDiqHRWE4CZq84jsivOMNq3lyG?=
 =?us-ascii?Q?anhr17OvHWSt/Ry6vYGqgAipmyzN3tgD5Jt612rsLz3VSZix7KlTHvQ7qloq?=
 =?us-ascii?Q?hHFJgAB/aLvjaAkJdS1VFS7cxLj3c0a963e7Vj59s9i1jALl5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9yQWTLWCOjs0Rt+/W71mnK1rFJiSZeNamHPL1+XpEHzWEdM8qFOOeuaxEHXw?=
 =?us-ascii?Q?lGaPmUC8BQ92uny6mA/Z7s57sMDObddSHO4X/2Omj/6YinI91sfnO5/TDSqW?=
 =?us-ascii?Q?2go0KHnRu7IEDjMtLC+Uk//sAU8eTrUTB0yHlMoA9JyYN4VxCz9vUHVRjr4P?=
 =?us-ascii?Q?Kxco6p/KUZ5LFvYEl4wWcOWlsJmLdRiTPOnAfS9u5/Mv27Zm75yAVJvE83iZ?=
 =?us-ascii?Q?sed07EeG8jhGU+zJm6AjcZB3toROltpk9xhlJE0Pj6YPzViq/xsNbtyo9YRj?=
 =?us-ascii?Q?Tvv//D3rCaOx4Ei0Az78AR4I/l1jFDqsAPHR+aOKXFkDsRqdOBWzDRNj2DqL?=
 =?us-ascii?Q?wnl8nm3lZr15446JuNrBScd7Psy0S46hnF/U9LnseI/bZQwajGTuPVOREu7m?=
 =?us-ascii?Q?8GFW1m65LgN70Dnp0i1jd/cvg+JoP4mrfbmBXbSBrUa4NRoxqsHbhz/VApvw?=
 =?us-ascii?Q?phhoASvoCIpu4FT5sJ7iiTS5saKVePyIlTW3QsUVsAfpQwPpqOaqiRuxfwHt?=
 =?us-ascii?Q?mIAPJemi+BEERsYB7jTtYDjdFDnOwOUki5sASZ4TU9hJQoxpqggylxkIQ91u?=
 =?us-ascii?Q?7OZpNafHIKjbRAlCxw9w0wCIHR4u8uUVQ2LvDSy57q7xvPIQKJpkEo+OlWuK?=
 =?us-ascii?Q?HIqS09i7VdXEaSKw17FQQ9DnE1eOa4+mIk2BJ5SfLibZDm4Z/svEGl4UlpWD?=
 =?us-ascii?Q?NvQYtGzTHGHPI8PbmLh8kqhXKUxrdWpcI4Rm4+4oTNik1A2Yo1u68qNR+db/?=
 =?us-ascii?Q?oovCDNW2WIlPVtbotdX9dtPCd1VMf4EidWhCfR1ER/If1oMO2JfD2TCgTW1r?=
 =?us-ascii?Q?L6fewZdBxQOOQyEG3eYDI75e/LAUfYF2gtIkEUEiCaphrtztr2rnvAQNgxRk?=
 =?us-ascii?Q?BVrcdTTnCBm/6FVkAJfMkAGBm1fal41stb0zGBgmrbUvJ6Ogko7LNyQ6KrEz?=
 =?us-ascii?Q?ttjitMSDrDbb+wWs4oz/7KpPDxMnSsXOxu28Iuu7Z8OCzPsTBFeRwHV7tZdM?=
 =?us-ascii?Q?YnMWEZgF1YsqBRDD92u6iwLJJ0+LAbAbJPOgdGQoU2WN4InYn4q8zN+D/YLY?=
 =?us-ascii?Q?YlKNp4UqAc2T8h374Ne9gYJS3AcKUIe1eZUScUU6wAHLofuJVIWVsaDAYBqe?=
 =?us-ascii?Q?onfJijuni1PisHr4vVCbeCn981Elkm/defFoBstBwGmhOHTnEeWo4JmcDW6P?=
 =?us-ascii?Q?bHnWbOoNEniQvfXH+QBy8SO07z6PDvn6CYxtHKJmiYHtA2767M4QXxy4MeGf?=
 =?us-ascii?Q?7PYenPYli6grfJD/F/PYRgYZescdFb0Gw8yZX3torm29Ih8takWQN9QEC7n+?=
 =?us-ascii?Q?0XH8hgDVoszk61TzD1rMVspi4BN0QqLcoSwTbS6JZ+uDgreNyNJVo93Zduxo?=
 =?us-ascii?Q?oUs3dqBVC66APZu+IzuIZa53PTLhHobswMMa2zhAn08C4FLFiTn8k5sNSD5R?=
 =?us-ascii?Q?tYwq+ZNZ67b7Kf+Fj+xdJ3ao5Tu3aL7FQgNyHZAfHBMdW5srP3uqNWPahgRU?=
 =?us-ascii?Q?wPNVfAD27oPDWT9M3hHTCGuyliPWP/NEOnLlhAGM1wHdbyPD5ELFqOypPK6g?=
 =?us-ascii?Q?eaCwIZrHrJDlzhHA6E1zqLPcGwFanRXgzfWDuegT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c180d543-fc13-41d3-584f-08dcc36909f9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 11:45:08.8330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwfRtdGBU4OtNB7e/PQo3N8atnDvIQSNlHYBiy/9u3bpwqt64py7a5geaZtCR9fK4eTitM7HXkrw9a/0xiEqLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6579

Let the kmemdup_array() take care about multiplication
and possible overflows.

Using kmemdup_array() is more appropriate and makes the code
easier to audit.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
v1->v2: modified commit message and code format according to Linux coding style and submission process
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index e4464ee815f9..675efa5d86a9 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -122,8 +122,8 @@ static int add_map_configs(struct device *dev, struct pinctrl_map **map,
 	if (WARN_ON(*num_maps == *reserved_maps))
 		return -ENOSPC;
 
-	dup_configs = kmemdup(configs, num_configs * sizeof(*dup_configs),
-			      GFP_KERNEL);
+	dup_configs = kmemdup_array(configs, num_configs, sizeof(*dup_configs),
+				    GFP_KERNEL);
 	if (!dup_configs)
 		return -ENOMEM;
 
-- 
2.17.1


