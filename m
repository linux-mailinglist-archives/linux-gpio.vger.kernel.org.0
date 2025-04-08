Return-Path: <linux-gpio+bounces-18465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BCA7F7BA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 10:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0923BE590
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 08:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D59263F2B;
	Tue,  8 Apr 2025 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NSexmrfS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012004.outbound.protection.outlook.com [52.101.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB79263C95;
	Tue,  8 Apr 2025 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100459; cv=fail; b=JLc7LB6AxrKTjLGNrSQsir2Y7c2/eEaReuZ9IkeZbTAkRdIxgiHAATQ+SIUdLZKd6v0zfebmmgTnXZ02JdNKXAlW8fgfC+3k9k0d8WIFvuPqvh5Cs2IRfc4PBNHtAs4MvK1jNjxuuRaY9iKE2JYorQbbg9tm9j7Fd6mnOkk8Jbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100459; c=relaxed/simple;
	bh=tCvYCSVB99uCoN2om6XnTnZiQrPtowZF0ev8VuFTkT0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sCo0fLEtXAgOIatKXtBTxmKkg7GyFc6SGB27/46vENUeymrIiW1Xoyk8cIL9TFJ05eRy+Ha5k5irwtpZMYb8sOKQL67vnbbma5dryArF4Hc29q9tjlShZa6YzgJ48TyBJHNlLR3aob5PyktgeFkdq+J5hVok437hfri4BKhK2sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NSexmrfS; arc=fail smtp.client-ip=52.101.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akzNbZ7/GlgwrRmLunquV3uTLimcr7WFxSOi4tenl5nkPr2G71BhVgPDg3PkO9T65+5r1VWybdIMEWEymo07p89eEzU34fKdiZzhx443VUbNuIHq1WKSG0ULyAM366VNLWwpmOZi9RKe6s2pksnQ2FYD3brGjTvK2vk7mv6mJohYWj13q+9PKr9N2DWbkW9SWFFbcjPiRibyDK4EBYqmV0TAkpRjgbeCF7NlP4gUL2YE8NJRvEY/5zm7DgB7iMltBxOXE5mmqylL16RSXc7NLe4GaA0CNudIhUXynLawJnUsC1xEFj1K2p7oMs8/yKDKmzYjNB449NXL3rLKx6gUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtU/j0VuYQa/PcEGnsT9KhYkNYujK2Babz9xdeBNTU8=;
 b=ZLMkDqYtXyQqsh0ecLG4Ge66VwDRwMjolEiubD06MBRRJr3/77mYQPdeSKAOlKwJnv0RMrUnC7H1ULtsdlH6Ku4+jgZTbN1KQtNIAI3GWvJ2YbkGn+QsY6CDw+muJLxRNFdtLheFUDo2xWLVFrDw9Ov8v+vPgWCrA1c71rjITABBJa3AA3FDZ/yR7bvv5SP09DoMIjYFZkacQj8kdSqinNzcLaHOkBAQQt7v8Z9BguZxEr0wVdPohtLEC82akgBGAZsSwJyA0vBNSJmMpGu2v8DyhVXr2ufsdvlh0xDaThjtU0VegxZo8SlTTxFvhyZz4l0lMBI3jAFem9AnJh3OOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtU/j0VuYQa/PcEGnsT9KhYkNYujK2Babz9xdeBNTU8=;
 b=NSexmrfSOhfCiizJa+7RD0DD/cIeQVbhmFs8kRuYV5XlZkHX1RwF6MOY3IgdVfwbCO/vrRC6rSObAZI0zNn9TZppQr0Qbsv+H7wg9F9xgZQ0OTarRa+dienHp1fHsHcMsycS8Lv+I0sdrlBmi4o2e7UVYyK4FjjWKliL2tr9mAqmDxoK6N/6n/7A1XE+oLXKlLg4LSdz4IGZB24xcLPhMQeQZzBV3sRAV5Qb6WrE9Z58cOIldq79zRPGoFgP2hgHJ6tcRz44iqYsna25+/uqjqPjGvyuuil+6HYF02Q9Xo9K+os94W7KVH4uDNNs1WEf1DirQ2nm0iYoEQDsd1WmnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by AM9PR04MB7491.eurprd04.prod.outlook.com (2603:10a6:20b:283::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 08:20:54 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 08:20:53 +0000
From: Jindong Yue <jindong.yue@nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jindong.yue@nxp.com
Subject: [PATCH] gpio: vf610: Allow building as a module
Date: Tue,  8 Apr 2025 17:20:31 +0900
Message-Id: <20250408082031.582461-1-jindong.yue@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To GV1PR04MB9183.eurprd04.prod.outlook.com
 (2603:10a6:150:27::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9183:EE_|AM9PR04MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b880dc9-99fa-43d6-c089-08dd76764749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7fYgDQ8JcB6o6NEL3u/QFN9hh+lAi3Ic60zVz47VV6UJM2WUvCllSYQtYbps?=
 =?us-ascii?Q?4o7/C1PqYu2Fpw8HxJy6OxwQrLyJachjtU7Rb7fdj2VzKpkCs+aAUpOOcO5U?=
 =?us-ascii?Q?QvtFKcqrcjTHyK2dI6X2eh7j50b0ayIyEXDMobEc2XWtrX1YpkTa0pInTaeW?=
 =?us-ascii?Q?bCSTXNaDaLvTQvlbFl36iWzilILIfWuuOFqTiC5hlTkuRo3MgXwkn84wG2tJ?=
 =?us-ascii?Q?Pt3KkDkKlV4TbpolilJC6dgDn1MyyCMVK43Zlmeo5CeovS2gDjdkEChdGkns?=
 =?us-ascii?Q?txOSYWsySK7MGsxqgl8/F3E5UbGS9Wb7ARPL8bz6GEOHRw3z3LXRMKocrSWA?=
 =?us-ascii?Q?GLmjrLW4ELs5biXiripPumPMw/Zssj5rUxefg2uemkrp6LclBX6zDaM8vSMj?=
 =?us-ascii?Q?Nk3ZqumkGdLAI961fWFlYjuGTiSUTgLhcWsg60YGioJ9dCewyBhuxywohyA3?=
 =?us-ascii?Q?lCWKLkXJYBpNlTTaOqNAepS9XOsxTfqJ6IAMJ2VvYEhvrJIGo7IP0wwrp4RV?=
 =?us-ascii?Q?o8fuXoamve5a4VTrZjJkehFhoGF53ygdGfwOyW7Pp/clG2GkpoAgvwiuwj7x?=
 =?us-ascii?Q?P/lOVHDiwIjyr5H9CpXvM0ZcEYqvQYnqAWPPmvxJ6DnL6b8nT0hAfUrKBKLC?=
 =?us-ascii?Q?H/25nDXTtCHSTC1GHyaoln0RJGctx677vYZW/7vzDc5FVKnOCOSfFCh8S/kg?=
 =?us-ascii?Q?v82lwKJ7tpvuOlW7tHlt3fqkfPW8VlT6rpxirTHrxS+J3G27GkzKhGCbjF+n?=
 =?us-ascii?Q?wrB/N1SGCA7H/60V0dV9jpuf95+svQrANFtTKEcKvo2xLMEbT5NUfYzli7hZ?=
 =?us-ascii?Q?VpdSnOyWDfCyOfl4zxV1tf1uVeb9GhEpqUol9KRqKiFyKyWx2BpXFc4jVeED?=
 =?us-ascii?Q?pOISalswlBl9c/x4pkXkVKO7Tf5XYAoj68bYqVOdgdrXb0rrcocDgEe5C2VB?=
 =?us-ascii?Q?dkYzvumXvTc9C2dmQeV5DI/TOUGWeHXkeNduivF5Am+8YHkOGkM31pT0sc0h?=
 =?us-ascii?Q?vB71G8RFwA7xeGbbOXtA0j9a4R7e04NBUOrXggwDkRUoTnX6XHA+/C3m6cE6?=
 =?us-ascii?Q?rGLlnDj461Vm998LqdIB480HuEZa+twQDxSTFvxUYtpLI7pLTZOykct27hPQ?=
 =?us-ascii?Q?bRjycTSIEpCRwiS3zYbLjSfF+heyfUAN7Qk/iRMcFBSWaAJ7lQ7jO9C50eGp?=
 =?us-ascii?Q?uOZv38Vs4FvQneIVRvqVkurRntKK5VfYA7tyvVQ2WNmbiRGNU9MU6p2MuRZo?=
 =?us-ascii?Q?8W3jp202wSuE4KEsdUWbjHoSvgL6pyWFDO5iVWBQ4Mpk4m3Ii7cg2IjeGFBz?=
 =?us-ascii?Q?JXwM1uM2oee9HDr3aQHeTyiOO1TQi++OAJdOiPZ7JZu9bhqjkK2Ff57pMBig?=
 =?us-ascii?Q?RiLER0LcRkvbCgteU62ZUbbVTsBiflpOxz7BKJV6b5gCVvGlfJP+0uvZYlXb?=
 =?us-ascii?Q?HsJtpTeARocgt0w9APceYbWW8HilomhQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uhwlyv7Yz/oWcMgenMCfCBXUQsqbTPuLPPuEYcQZW4ZEruSdVcbiMrXnNwc9?=
 =?us-ascii?Q?xkKDa8jPC1CIl2eOIvGUV0UANt285NVH39f/wekCItCqIymE0ny9UMw/Et9Q?=
 =?us-ascii?Q?hkvaheytalM8CDCCa9NG9cMGZNCeb20uRRIu848hLTw0o3uFd7RHI9LnYfSg?=
 =?us-ascii?Q?4sm27cYf569fHfTOPenP+dYTX6hiYIdtqIH5mbJm3dzROgZm5nenfNoli/k/?=
 =?us-ascii?Q?CfX5zoqD+UG1YGN704W0SyZ/MeJbumdLs8xOJrvo61y7b2ZWSaytL0l7y2so?=
 =?us-ascii?Q?iJGbwCS+w2DkHRX+dBuotLuxq5+mHRiog/CD7rA0c+nvJfvH9atkF2eBGZQq?=
 =?us-ascii?Q?qDOzIgk5na239bsVPIUjNwEYZ3M6G/E7JTd7LZGKVm3qAeRzdCtJjqiIGEQ3?=
 =?us-ascii?Q?NNne+Qv2EL1R9A+H13eb0kgir7u6PeD8F59FLc8KxjZkG7nRIFWzfrTKdkuJ?=
 =?us-ascii?Q?8eFQrqGtbCEGTauO8NcCE/xWM7sAszydHQDf8VdFILW/drDt4d99Lm0QX/S+?=
 =?us-ascii?Q?XwXXDFt/M7VM0NsFb7KwvhQrCqf9ccRI8KJQ0S4LLoyfwryKlq0lSU0qxoYH?=
 =?us-ascii?Q?BSnE6g2ajZHjTXQwxcVSBtjsHn5kGDcV8NY2BDuEZdpTtEDwgmXhDxHdWinh?=
 =?us-ascii?Q?Ke2YBXUPXOu9kuMhtaIv6pWFvuIZl3EGXXg6hjSY4AOcwYKb4WlQI4VJIcLU?=
 =?us-ascii?Q?vpkh26NuI6V/tQOrBupGMkDdCinujdPvMG3sxTn6AWxQpGI+i5akkgwUpxfc?=
 =?us-ascii?Q?p9Rjzzs6Gb+Z77qwoO4IKgP/ZKuMTkQyEMhPmErcv0TRA6keGY7FF0L23+bt?=
 =?us-ascii?Q?e3aCGA1dzgPrzsGApvJXt5hTdho4PTo/wv1bg90nxCNdVxGYOU7uwaSi50xd?=
 =?us-ascii?Q?PX1CYLjMGCfxlEQ4uG79dwEwW9j+y1BceFJObqv8a3dgcj/l06yOLibPTQ3F?=
 =?us-ascii?Q?uhLAvuufTXmtHlW4kg0v6F7s7bNhpgw440CskoaMBpc2ig+wZKtk+pKoHJEd?=
 =?us-ascii?Q?HUqU4dt6w7XozN8czgkf69fKvEs05gSt4eDWyHq4gCsqK5ZadrHMf8lGHuUE?=
 =?us-ascii?Q?GJGMWTmAMTNrHYsduXoz+BawceC5qT3ZoziE6rLFQcJ5PfK/hQL3qqGLWdhz?=
 =?us-ascii?Q?yU2mUCB5eg5Bu+ZrXSB0n6v8ObY9s/dhueYPVhi9egekIQ4z+D+I+9fWLAA0?=
 =?us-ascii?Q?pyeigymTFd09YSuJOsBnHgPNGNeWHWHGpcyI7VnVCzgqubNeYE7PT8ErwDrV?=
 =?us-ascii?Q?FFj98txIX9k2qjlALPktG5+9SMMopGbgMT6Bsl+HD8+4Z6LGOM4+mLRqW1uB?=
 =?us-ascii?Q?PMghtLlgW7/M1WfpRe8JiTIBE5OoqwTKuSpid3+tYUv8LvZ8KR6uCLcFi7pG?=
 =?us-ascii?Q?5js6Ss6SfmeKofKHeWyXzNC4zwddh0EuRzPM0g3OChRcoetsiCscOhuDCo/Z?=
 =?us-ascii?Q?V39ABo8yW0TuqoBfJOJQIt9lTmI1Vughj+Hnyw3paGpR7mpwKId6W4Re/o9t?=
 =?us-ascii?Q?IuYmfYLiiFHVRf5qEFzz9zU+t5VVGMft6Nh96ZHWGtftE1A9CZ6waYR1kq9n?=
 =?us-ascii?Q?93mDq8QvZoEKebnJ5NsTh/4NLhlZ7RX+KzMCJ24v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b880dc9-99fa-43d6-c089-08dd76764749
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:20:53.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPd5PUYEqRUCKdRParZR/Gn4Vxor2uQf6z1o2hLQATIJrnv4IWYEvmp8a/h68Yd2rhOh4PuHF2ZCmtc98BbxVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7491

Change the config to a tristate type and add a
module license to support building it as a module.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/gpio/gpio-vf610.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a..17127555f582 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -753,7 +753,7 @@ config GPIO_UNIPHIER
 	  Say yes here to support UniPhier GPIOs.
 
 config GPIO_VF610
-	bool "VF610 GPIO support"
+	tristate "VF610 GPIO support"
 	default y if SOC_VF610
 	depends on ARCH_MXC || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 4dad7ce0c4dc..ff2c95f03eea 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -346,3 +346,5 @@ static struct platform_driver vf610_gpio_driver = {
 };
 
 builtin_platform_driver(vf610_gpio_driver);
+MODULE_DESCRIPTION("VF610 GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


