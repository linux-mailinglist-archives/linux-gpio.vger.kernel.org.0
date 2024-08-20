Return-Path: <linux-gpio+bounces-8847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E121495810F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 10:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95CB8281B88
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 08:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E5118A6CA;
	Tue, 20 Aug 2024 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="igo8G/7k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC318E34B;
	Tue, 20 Aug 2024 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142820; cv=fail; b=HNXKuXzpv0oaq/f1vAFfSugcRS6AzZBlOwxYNsUjVMB6ZsjUCOFpFjtrXyhWeJV6nFa/bJqrrcDLrD3eGJhGMYUli7/nfUZ3JSU+VZevSsS6p9UTZh6tbP+nntaD4e6C2qNDctJhAvpr/qDpW3XBLa5obM3yLNJwMSxKVmoPB10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142820; c=relaxed/simple;
	bh=hgxdO9bQWs8wdjSsrOwNOgxQPKX6k/AAkkZdngQbmj8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gjTVlTj9F/msxKrg3PEdlF8m9DlPna7RcnLss9iO5PzWIymPnnHRIdQnTLHGqfuJG2V+S4Z8/7gPVQaEXU1P/X9KbGPFb7qNnda6IhkkBruJ/eWIgzwswuqsZmbe4mL3M1+7FIwXzjXEUCqOfPqJ8XA4bGP7vRzX1KWr3TCL6aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=igo8G/7k; arc=fail smtp.client-ip=40.107.255.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bhe0UTWkFwaRRemnkcFPCo1HGO6DRTHa2r8hI2bDRF6Fa/nRh+oAr5yuLPIQu4YZkj5uyqqFOxnOasKAfFW5ONSrbVR9jZcfefja3phhIvN6qrkALH/vyriyID61+FZYnaNl81AwPc93sR41A1qvayJfu6DkP4nhkKuQ/fwFUqYpjrXDqjzUIU1PmHS8Q3j8qqk3FpBI6qMzlK078izV1SiDSRton4Ov3uYZOyCiEdv23uDmB4eatdpyj2B6WD5glg3yNbiL/UbKLZ0J90EdCh3VkF8HWfPA0gFvR3YLUm9uvnvVQ5BLr59UBJa43/7ubiBkArDIrncAo1agokYxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJPBsIq7YAA3ML9oLOc5aRgZBJ40VC9m1eTjT84QemY=;
 b=fn/h61S38zMkVIUN8JvNw3uKymEKjScvOPvMDcGklG8boKZfpWRqX05MHgKJQuO88MNbeyuDXJpo6d3E9Oj9PM15xFN2koIG/7wE5RyIyZkqjlagWayITNybIBKUWSI3n6JiInSdroW7/Il3jkWs0oSymOh9QZhd7lbB4eYTjHJikLORmkrkWwtQiZ3mJY7OEhaqfV47PmkOWighNRHbr++1FCWjYJQqxLOFsN5PIc1rDIrcgYv2u4GnOVku+FbdxT+Gr94uMLRDS02hdWzvBDzccgthQ1P7tbNB1AImO0DTE4bxMbNcVzh8whVPTDZMdNnZcXrlOcPzmnzCNs2NIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJPBsIq7YAA3ML9oLOc5aRgZBJ40VC9m1eTjT84QemY=;
 b=igo8G/7kPGPKaU+OmM9qUJuEHxFCZ50friiD1xgx0/mSR3OYAN+uwH0kvHPBv+oy4tMMcgABzWCq7nDOBGt5N4PZPOrPV22OEYc+NwY61vZR3qWujtCYCwy8DuvX12wiDHpDUpm3FP0hn6sDD20/7Qkn8quIzanOjD5qxNP3rLCFTtkZKqusXkp0fPjJD/qIG/dnnKwvTHnd+dgVt/JOiKhtGIYU5kLWoeONh4Dt2R+QPYZe03z4/A4NY+Y3VLxJAeg+9I5RIqWHfHsqw9+/5VxbOQ8qD+gKl0KwXdw1dc/eApCRDBwQVj+OUxA0EQF26k51N9zHYs/hxn0xrhqNBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6467.apcprd06.prod.outlook.com (2603:1096:400:464::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 08:33:33 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 08:33:33 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: Keerthy <j-keerthy@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH] gpio: Simplify using devm_clk_get_enabled()
Date: Tue, 20 Aug 2024 16:33:22 +0800
Message-Id: <20240820083323.62485-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: da99ac3f-8e4d-4b06-e365-08dcc0f2c6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5j6cncrKBZiVseEUjeHI6iBLIGV35KAgkTDMOEg9glg5RMhu0pDiJPgfRph4?=
 =?us-ascii?Q?hYqGPf6aoxIgkGJK7MKbmgBG7616vafSig7R8eLeHAFeoJwo6rwfnuTu8iPE?=
 =?us-ascii?Q?TqbYIN5gJDv7RvbLBTZtoFZIvc+7vdinZoYbpT2hYtIlU/7tU/viAp/0Cunl?=
 =?us-ascii?Q?BuZY1BV8gDP5AXwudUHHAc8XNBk8i5UsgDpxKl91xsMwixjDHgxb8yqiOpqZ?=
 =?us-ascii?Q?qqWx8VWtOSEjGDG7hHwXlrAGOC3wMfp8XC0ZTI+eZr3/nsdq5xY+4ljNveWw?=
 =?us-ascii?Q?TiSQP9UJvBJGSC6tIGpM48YUJ+Albjmn3BdE8W23vo7p6tpGX7tkycX10lK5?=
 =?us-ascii?Q?bMRsS1yyfJ0pvF+qnWhnNAFbB0MLMezFXsaY89wjqyZVzLhGI30sX386KY2q?=
 =?us-ascii?Q?FAf7KaD49K0BT+iZFVx2lkzSyTzWtfKYtWUR9INlysdtebopgaNltK4sTxH9?=
 =?us-ascii?Q?fobJQPflGbdom4jUfVxW+6qpVZiHtigZ7P2G7P1LcYTgW3/aQ9SDovUemM2t?=
 =?us-ascii?Q?9TVHCzLr5m6j5WMx4vQtAWOgYDOzxZQQrsZB+8wviTUVdy3oN601LxYaQrAT?=
 =?us-ascii?Q?yN49g6kTxtfuf6nrhpw08+oB05o8DGL/MQ0l/ODqa6ZZiMhBuuQowRVy27Hi?=
 =?us-ascii?Q?qdRiMEurxkkcHBrwWccUrJNGFr12dlIyGu+eLWHb+2DsTttJ7IBv/O5LYoh9?=
 =?us-ascii?Q?SJQkrwNslAbIo02QKrE6vEhYzPFc0obEPELON5jJGfgc+OYP374tKRHgjTNK?=
 =?us-ascii?Q?Kpx9AmpFR6K66egvuZsN1bMOrY2RAwMx+r0tX+9FuCO9cy9UeTAajEkk02Gz?=
 =?us-ascii?Q?ngB1rTPr14FBCSKg4kOHpPp3avbIPZU9XyqkXiX2UvYHERt6SO72HnVzOeZh?=
 =?us-ascii?Q?TgJ6ccpoABbTu2oaO3K6i09nmPVVwjmsqQpFdv8qUSDoD/U4zDYRC8v+mS4U?=
 =?us-ascii?Q?jOAucQOS0cgDhLH/bENetC1MVSgltWEB3GOyk/CvSRt2gNbhUeS+B8Y9mZib?=
 =?us-ascii?Q?r2p63cFa2no8y86oLA8+cq/GW90D8nKxsuhZ4uoJns6Uu1QCfRZxl1lwn+x2?=
 =?us-ascii?Q?ucoMc/aqA9vLhTanyY4AJppLR3R8SxD1SUqJ8zTWQduK9KQ6lDOq3dsslPWR?=
 =?us-ascii?Q?WCz6SuKL2mGM7rTi3EpFtTMw94e3s8gW2iH4/223POYitiwAzXjanp/f9fpQ?=
 =?us-ascii?Q?7qzOFcMxVRsIICYOuTXtoy6P3XsuYObxkzXnMolSdfhbODEgZSIQkQd0DhzQ?=
 =?us-ascii?Q?anwuLpUA8OP7+mMv7qJxdETeqkSYeafoHjAYQdv48ENnHyeY6GCbSoeIi2p0?=
 =?us-ascii?Q?gw76TM16LcIbmCJlLjkA+RYEry/68uqK2GelH33coAejsOjpoLxHgaa0u0uC?=
 =?us-ascii?Q?QrDvoC+8ojkEPSyra03U8wZhNyPUpHbRLhqB/rxdPCxRDZe1Uw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JFpjUzonyBDxaaWDAYhFlPYCKC5AZT+UoHx9tDbqXmHfkjPhBih+S662fZ9d?=
 =?us-ascii?Q?EXpRR9UnC0/W6Ol0c+kwEZRu/7g22yZacjzZPwG8ClMr3PadFQXvBb0iEG01?=
 =?us-ascii?Q?ggyMKBKi9wQkTjhkV50oIylBixN37ulVup8QFrGUrv3abecsDTsfHpRm7g/f?=
 =?us-ascii?Q?8Ar89DWVPnDZGHtDSprnbfETwJdtrX1xmL/Nq95FP6tuoY+ewGYhh2+fFKhk?=
 =?us-ascii?Q?QdAKpbdccRjLYVLmWQw3Ephbc28mDxKP/HwzTuqVyxhfmYhtf2pSeVwE3kM5?=
 =?us-ascii?Q?oB65gAuM69hAAUpW9iu9mChkheIyQaX3ORqAPCcrCLkLpuh2LXosnRcgWxpg?=
 =?us-ascii?Q?CLzi5HIDBUpZr1VqbDg1jG6REiEg/9pHFGFey0X7eaL/fUcSrSuTLZ4ZWe9P?=
 =?us-ascii?Q?Tndak/fqva+yUKovG8J2kUbSpqZJB565us5gzYokJr5v5foCb5ajLn9zfExT?=
 =?us-ascii?Q?yIj5rzqId5VoQ70yjG7rkiDouIhvVhuXDmbIZtgTRDm5yZXfT334lrHUlQ6n?=
 =?us-ascii?Q?bl1oiV1V/TyhsddU9xUCCBgJSGCaRo0LKSZBrafAhetPw1Vu2JUSkiIRYJHQ?=
 =?us-ascii?Q?OOO58v4qww2J1DeYKsvcW/QV51Q1muXw1ay0JDPM1AOkRdKmbqy5Q93ReRAp?=
 =?us-ascii?Q?HN0g+EtVMH7ABwSVYNzLjzmYGp9rPVOBDKxK7W2ntfYGrSun7f2kdxx1hTQF?=
 =?us-ascii?Q?XF6et+LZLlXwy+RtUpa0gG1SuTG+2Kw4IkuAYDF0Y66Hf3NzBNojFy5aWqGL?=
 =?us-ascii?Q?Yktv0vN/bJXRUX+k3wLKvYajGzUQj2jsYNderTKa0JZ8HEGp6T7uNH7oP6gZ?=
 =?us-ascii?Q?nsK4K5l18sxZ57zCvLPOKS2WcMEmg1a4rxzOwhWKUVvQoweo+leLWrbwliH/?=
 =?us-ascii?Q?Ds+1s2zWSZeJ00sLPSP79DVArQnCIVlviduOBvPzvKCiQudIdcMXsJPlVYrG?=
 =?us-ascii?Q?uzrwOb6hJ1ZboHPYyOlfdS07CuqMCOrmR+cndjMWrwkDoNrW0lnIXLQlOlGn?=
 =?us-ascii?Q?XtcESHGRfeuBnOVleVOgDCXMOhA9KQ79+1n16/j7e+cJzAOv4FRaz/v6NKQN?=
 =?us-ascii?Q?AMixul653p6O13BF3kxYoI9PgIU+AhZeqlB+0UWAM9GZJNOxUEbqQwOM+8PV?=
 =?us-ascii?Q?1LbI094G2pywukXu1YYeDzd+8t5vSb2NbQ40GRnDXAkLirDPCZwJ9UeJsmjp?=
 =?us-ascii?Q?bzKbTqHpsoIq/5/50jKEhzBuCyOCkZtJffXznRAOj5mXNUxRCpeHLmN2+DHV?=
 =?us-ascii?Q?j6V7yjVN1gJixfLdFbDgdP7mqrd8k2RR9unVL8OtV8KhKcBqVT+pYhDIfRAS?=
 =?us-ascii?Q?XiAj6H1w9AV9E5eoE2W40rUIfHmoDmMgjH4fFI0kzWl0jYVH9mQDRrLumC+5?=
 =?us-ascii?Q?TMQ2M1KMAdI+RHIMWwwFewR7Yy4ODSXpcwj/dglUb4vISfqEi0laKIe7HCZM?=
 =?us-ascii?Q?DhRKhksrZuua0cqybPbnMc+rXzpb4iRhcZLBGlx4XegwnZCzJniYbGOJWcFi?=
 =?us-ascii?Q?A4Ax8mVAD2N7EnyQnegMxpOCrhg6RH/SkuzX8ym42YQ9CFjDgrUYZa6cyBTe?=
 =?us-ascii?Q?cty+ZuEybuVYm0xyIxxE4SxPih2y+4bghugNmEvI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da99ac3f-8e4d-4b06-e365-08dcc0f2c6db
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 08:33:33.2908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFrxIv1HSjM1/+whGW1fOuJHr5Q8juRoYT07mPifHmV7XHeLWzIwoQYwRMHIooPOpZWJnK2fKeTP8msVLFbFUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6467

devm_clk_get_enabled() will call devm_clk_get() + clk_prepare_enable()
and the clock will automatically be disabled, unprepared and freed when
the device is unbound from the bus. So simplify .probe() and .remove()
accordingly.

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/gpio/gpio-davinci.c  | 13 ++-----------
 drivers/gpio/gpio-stp-xway.c | 10 ++--------
 drivers/gpio/gpio-zynq.c     | 10 +---------
 3 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 1d0175d6350b..945832d54ac3
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -482,7 +482,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 {
 	unsigned	gpio, bank;
 	int		irq;
-	int		ret;
 	struct clk	*clk;
 	u32		binten = 0;
 	unsigned	ngpio;
@@ -504,21 +503,16 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 
 	ngpio = pdata->ngpio;
 
-	clk = devm_clk_get(dev, "gpio");
+	clk = devm_clk_get_enabled(dev, "gpio");
 	if (IS_ERR(clk)) {
 		dev_err(dev, "Error %ld getting gpio clock\n", PTR_ERR(clk));
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	if (!pdata->gpio_unbanked) {
 		irq = devm_irq_alloc_descs(dev, -1, 0, ngpio, 0);
 		if (irq < 0) {
 			dev_err(dev, "Couldn't allocate IRQ numbers\n");
-			clk_disable_unprepare(clk);
 			return irq;
 		}
 
@@ -527,7 +521,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 							chips);
 		if (!irq_domain) {
 			dev_err(dev, "Couldn't register an IRQ domain\n");
-			clk_disable_unprepare(clk);
 			return -ENODEV;
 		}
 	}
@@ -596,10 +589,8 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 				       sizeof(struct
 					      davinci_gpio_irq_data),
 					      GFP_KERNEL);
-		if (!irqdata) {
-			clk_disable_unprepare(clk);
+		if (!irqdata)
 			return -ENOMEM;
-		}
 
 		irqdata->regs = g;
 		irqdata->bank_num = bank;
diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 053d616f2e02..5a6406d1f03a
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -296,23 +296,17 @@ static int xway_stp_probe(struct platform_device *pdev)
 	if (!of_property_read_bool(pdev->dev.of_node, "lantiq,rising"))
 		chip->edge = XWAY_STP_FALLING;
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Failed to get clock\n");
 		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	xway_stp_hw_init(chip);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
-	if (ret) {
-		clk_disable_unprepare(clk);
+	if (ret)
 		return ret;
-	}
 
 	dev_info(&pdev->dev, "Init done\n");
 
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 466e23031afc..1a42336dfc1d
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -940,16 +940,10 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	chip->ngpio = gpio->p_data->ngpio;
 
 	/* Retrieve GPIO clock */
-	gpio->clk = devm_clk_get(&pdev->dev, NULL);
+	gpio->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(gpio->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(gpio->clk), "input clock not found.\n");
 
-	ret = clk_prepare_enable(gpio->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-		return ret;
-	}
-
 	spin_lock_init(&gpio->dirlock);
 
 	pm_runtime_set_active(&pdev->dev);
@@ -999,7 +993,6 @@ static int zynq_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 err_pm_dis:
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(gpio->clk);
 
 	return ret;
 }
@@ -1019,7 +1012,6 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 	if (ret < 0)
 		dev_warn(&pdev->dev, "pm_runtime_get_sync() Failed\n");
 	gpiochip_remove(&gpio->chip);
-	clk_disable_unprepare(gpio->clk);
 	device_set_wakeup_capable(&pdev->dev, 0);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.39.0


