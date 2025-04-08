Return-Path: <linux-gpio+bounces-18510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E2BA80FB1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 17:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68DDB189437F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09591FCFF1;
	Tue,  8 Apr 2025 15:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aBfZt2ru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB51D5CCD;
	Tue,  8 Apr 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744125349; cv=fail; b=t++er6eHsIqrQjDAnv40WLT5y87uai3cLx4Mj4JkK7qsktj6p6gYi69i9Eh9ZQBpqstefdt7fQk0a7+M1C543Tr9zsdu8pbYVYa7ivBEr5Adirjf1XVPySli/a3Gcs4DBoE/NiCCHifKqhoiPCxE0JLlFFIu6Z3EYGvMFJ4nt3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744125349; c=relaxed/simple;
	bh=ZcPUEVIQf2vW3mQLpzyOOIOIt8jUTvYorZHbENsi6kg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hwHq8qSrNt/8QLwb3Vy9AoqnG0mdpYZD05gzAY5Wg8rMYHSh2++MimvgCuYGYeaW4UAFOmkUWfmtayXeaXG6yE0DbvM6I6VzfVBVibJAVHIZGUcb/pQa+JzQhaT9cIy79PrP2waD5amXK/tfp7nuYC6r7NqsENXVzLUyytSBsew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aBfZt2ru; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U95kmKFFMtO+7gWatLODRIfejfFgJoYmrJdIlf/yEY2B2LOnxLhndCLMUDCqdvAFGH1r+JbNGl4ShA/x/3G5+zHh6GNGao/UjtUFgltYEQgU2b3Ke1IQ/Cw6VNyuSXG5G4q0ulzrQKCcwgCspiZ+flXHLx+Q/u8XG9qZ3q3mbXFDmuXaI85UK/42CKu3PWUgA9KfYEebENcWuLeZ3Hz6t6xQcWjjUBtLwbkNBgMnROHjjRX9SfPxASDiIMba8V3kju9rWec4TDgxPjvvwFQKThLC9cCPseoM0xv733/m6jttmj6XRUoayAk0yMZyUqbkf+EutFmboW92FuamCwlfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pinGkppOUEgshd376ZxQ1hvCv/p87Fm/FKzDdR7ukpU=;
 b=VAyAKtIoyfpteG5kjEW48S2Y6Apl4s7KAI4+bE0A8G2LzOXoMgZbhqmIZfkR1sLcGxkcsb6cuRxrzGgEPnLJNq237FZZa52lyBeBjvngNcTD/DRVsNUmdySqC74jmVTgFiiEBDGGZvZKjSOrxnMjxylf5+OZ94eJ1XjkTRAtCitx70Y5B4FWEiBmzxiENRdBcX8BSeaqvtL2NXmXsMKdc0UjpXTEtipSdGUIUlotZ8arE9yYCXI5ckuuccznnWXp7URD5+8v4ipGHAFHONGtP1cqDsHgiP/FbA3UaWGIjoTO8WC/AbB6r1ske914eb5sDAUzmTI/xD70JMD5q+XfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pinGkppOUEgshd376ZxQ1hvCv/p87Fm/FKzDdR7ukpU=;
 b=aBfZt2rudRuCLEVDRDhhqwgDog3bczDhk5TPVyx21/SJ9cYbmAj+OAffS105TPpWztUzKx97zzWChlKNraFFqBrvi2bs2z8nvzU/w07qDtH+O5UAma0Nbus4K+ql4+YNas0a4OA9YikMnUvQkJ7rxq6VRBq+QOCsILKW5NcpdFKTWYTXXNx3i8G9oNHCfj9VgpyWhVYTI76fpTnw7tCZXs6JQ1//6WcR9lPujfJd9lt+HiWB64o1CxuVnHCn5tws6+3/lS3f/+O0b0Xr13fkI93y8Zaauk7OliKVdsPcIpPOw7zVE+K+MUTSWWBUk2sL/Kx9bcBwYxp0Z0vyWWxk1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 15:15:42 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 15:15:42 +0000
From: Jindong Yue <jindong.yue@nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jindong.yue@nxp.com
Subject: [RESEND PATCH] gpio: vf610: Allow building as a module
Date: Wed,  9 Apr 2025 00:15:21 +0900
Message-Id: <20250408151521.552749-1-jindong.yue@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To GV1PR04MB9183.eurprd04.prod.outlook.com
 (2603:10a6:150:27::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9183:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c65af9-e079-4e63-cdd8-08dd76b03a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PbZGen1qPJVL7rjJAoyV02JRjvFIw0Jj34tmytotjkzCL2xgWxfHf8OzpQju?=
 =?us-ascii?Q?YsFrQagNIp6I99+oBVDQIfk/ienwMW6JXjxeiMGJqGoYMBVHSAaPJP7BSqfJ?=
 =?us-ascii?Q?vuLw+/BE3DfbyLTooU9T8DPm6ROg7s1IYLrwqTiH/P4/FTIaYoZBs+af1QV6?=
 =?us-ascii?Q?E2wnku3HowAKrZCimyVeDKE+R2UzQkXM0N3bM5ZxPIUjBoHU6MrtUZyn1ylz?=
 =?us-ascii?Q?KlBUG3J0wAIAtJVgxhO3/y//UOlbaGi93hU+rrJIshZocRXWllnB8BUA/V3s?=
 =?us-ascii?Q?+w0MUhId3WOEbrMLUlm1GQUFv9XJjin+e7JS216Ej7O4VrHD5+qFZj3QvhJI?=
 =?us-ascii?Q?wMCry1Y0LsYr8+iqeBDEUUyFGk9IpR2x4yQrHMzyIBSvj/zrDYsdeU+3OmTp?=
 =?us-ascii?Q?uPqaQWzYz4uQ2NSzZfZRwEDeP/n0PuvXORny3bfWMBEHoGHOgTWz20eUmSkI?=
 =?us-ascii?Q?TEgkIsytYbWct574ZPghtv1Ve9fY3sG5hTa3GQVcBBtg5r6cj1PuVrEY41Ah?=
 =?us-ascii?Q?X5SnaiEJYEMfym3U0lC3hfFGrnKDoE3/4IuJOjpClnAJ00x8i0GLLWFDFJtq?=
 =?us-ascii?Q?r8r9PHFqIX1BzAs4TifiVOkSmfVknOooPXO3pzcYHXYMBAG2O+P+HM/io8zn?=
 =?us-ascii?Q?P5gbYJP0cLwunof2XeF3oIzw254myI5ZaV1fYPhkMGXzPhsuo7+2zZ19wIPc?=
 =?us-ascii?Q?dVsvr3s5F8X61Ng6k5wHF1vWrfhgQY6EQDc8vqtVahi7i76+TK1a0BMWqWLY?=
 =?us-ascii?Q?NfOgyOkvPAIVXgHqacJ94vARJDeaFwLsPfWjSVo2knlQuqzuPJMB8+mL1SCV?=
 =?us-ascii?Q?cqVaa0Ou0ldk7cf9A8iS5HFQWCR5ZsUIi5yb/15Xa6ROjtEK++L0QJBOVdWm?=
 =?us-ascii?Q?+CVCuZ/K/M/A6JciZ+5DCGSVW7Iurswi2vYHdcjfL6gd3eXUAtlU8r9NrhCB?=
 =?us-ascii?Q?A5i/F6EX4h4rfsFO3AmX/VvaGUmtkJXZ6MgeiwgsSbRMOKy/nLg6aZx5Ip4K?=
 =?us-ascii?Q?OVPNMbXKEHZWRIZPCA6qfghw9Rfos0AwLwzN6uXFk3biBNXKAWtxqsAWyrA9?=
 =?us-ascii?Q?RUtCXeRaymNOxmTbjF1xIwCzyKB8OhNjHuZwMX3PsKcna95fSZK4NSAQ3O0t?=
 =?us-ascii?Q?U46SoaZJrnhapsht98JCG4KshnaC913XNEyGwF+56Y6PsGOoVddz/R/Z2BWI?=
 =?us-ascii?Q?BuE7tmNXhMpYlFUEsy+UQLCi/wnupwautPlUQTlKKdsPhdML1uBMyLtgACRK?=
 =?us-ascii?Q?KHDpJCh9KHTZytrUjePnhfsJNSqLEIamsvxP3se5XGuRVMvAJnA4HfbTThKj?=
 =?us-ascii?Q?jJSU8fG9/TtMW40xzUSyt5YcYvBVquU7hFiEuWH6JnFuvF7HCRnJy+uCQUkj?=
 =?us-ascii?Q?hJP2osWoAo2Imkw+xVaYFLBLsNKoAuFm7Vhy9iw+UbeIbYxGC1GO3kXyxdRY?=
 =?us-ascii?Q?0NAh+ysuuR3AsxI4czVPay/9GRi3C4rd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?En6z55dU7Som2nHEwDFU2yIp7Ai55k+j1vPe2UBX6seCozBl9sHL90BYGtvj?=
 =?us-ascii?Q?/34Sd7fh/FabwKGqjfiK0+wP+JVGkJPptqGa1hR6XQMSPPpmUCQMU594diWr?=
 =?us-ascii?Q?vyGxWRPuPVTLlPkk2dhcUKMfEURUy5MoI2/C1eIl+vN4u1Oil26Nz3/dsO1q?=
 =?us-ascii?Q?KuXtkqXqpnA7xpmBw7ghRbK22x1R3ge+Tgvr0cDDFQ2KrDSsVDISXaCltltb?=
 =?us-ascii?Q?HApovpQ+Mz2qdrvYFssZJN992VjkwAtOl3KUtoH54Oh/pieapzgKo7jo2hCC?=
 =?us-ascii?Q?xACqQYRd9A4PA5s9lrmLJIjno8xsuEUEV2tPJ9x4T8dSWXqzoAAotYttWkNA?=
 =?us-ascii?Q?d2nYpN84sNLhL4Y6lWoiwFche6Al9l47HWAaZNd4cJvmjcQzUPS7ATIH5qmz?=
 =?us-ascii?Q?Npl7vmn8SEIue16jdyvirq0s64T5eUkZXkKNPgFmn3iiCyHeYf/0vkCX8BEV?=
 =?us-ascii?Q?ekz2wTLjHzcwBKxDmoy8iRbif2z1J2/5/XGzLGGCpsDFZbxaTHlPhzoYU8CB?=
 =?us-ascii?Q?Lynp1ctDXYv/cBWBbW12/A23l4fUez7EziSX8TfXSsSBVuEZbo6UGk04GFIN?=
 =?us-ascii?Q?06S6hJyN1hkHM7oi32xNu2L44ET9oeeUbPIqicT8wBgvu1dO1xK2sD1taCKJ?=
 =?us-ascii?Q?Ka6mfEVx4b+mTNfU78APoKOwJG+BUoHdlSL4T19APzKS2lUrfO35ekMRMMo2?=
 =?us-ascii?Q?r60IVM8oiUjVfNmbMa47+yIWz6vNBR1gtcfYNufUBNg1mnw9MU+vdl6ewOOO?=
 =?us-ascii?Q?/C6EfjQJE9uAtsr9rcOMJBQ1VxwLPJTz5lkF/CVyNgktFQ8zTSaGmgYWguzQ?=
 =?us-ascii?Q?lCvc4adG3V4yhMFbLCwj0dP1BPXpc7J9EsOYuH7dW6NNG+0cscbeYnqddU/6?=
 =?us-ascii?Q?6vz97SkWl+tqe3R14lDX5NaLRC3fdDocoA1Hml2IuyKtGOPXQ3sFFSznLLnB?=
 =?us-ascii?Q?DtOfVo2FktFoeqcUST+Y1JLKdA6Q2iqPPYjTBy3+Ax43cBwnIs8Jn/utJK1j?=
 =?us-ascii?Q?KWlM5TZqiLrbyN2fkI2mpuwtpmjcu3Aze0+BY1UB+nT/UAvBxvh9hP/XcYAJ?=
 =?us-ascii?Q?xxDNIaC/uqgKRhUiyCLDBKLFIK+pVqxZdVkYY7wJBm57NsOdQ+18dFT/YzzU?=
 =?us-ascii?Q?dWpz85iUo9/chcoO4HqVeUMqkG+0kheXJqr8Rjp5NubLIzRR0mc81YIWW6tH?=
 =?us-ascii?Q?pzYEcOFwRvyET6Gf/ngnMfWlaXWwoldaQdlUfQlsREglYKocVfXtNkvFE8ZA?=
 =?us-ascii?Q?c7RxM1hYYA5gwIMbCEd8ypuus/kVyHmVAMwspWg97WBvoVPG2iKyTlfUbjr9?=
 =?us-ascii?Q?jsXxoYFsLaZGi66tB0/rR1zhuR7kP3RKR06zytNzVJhHj4dPBZvkIyjMmNym?=
 =?us-ascii?Q?SEjDG059bXEBN4ghzcsQuyGVGSEqNlRtfT2hkAEjjUnzfhfHbkMpF/GZRGIp?=
 =?us-ascii?Q?WCTtWIIh+CVwFHNfvy3HwIfBDRy3O/1/lBfxJ3aUV3GZ5VrRjSvv/MSqr+YB?=
 =?us-ascii?Q?maka+uGQOUcG/kOkisqYhq54MbZ0attRL4hC4ItFpyxp5z/yIXsLVy4Ql3GB?=
 =?us-ascii?Q?Ik9QMaipsdSmgsZC+uBGH4K0embs3KzqHqy80wkn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c65af9-e079-4e63-cdd8-08dd76b03a0f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:15:42.1473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkzJ0ycJu8RcaWZxdWjhqVQOKGfC87W+XORd52CDSR6xApUE4cUPyu2xpIfN0K405sBXZsmYTYcHn1BF+njL/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

Support for building it as a module for use on the Android
platform, because the Android kernel(GKI) doesn't contain
board-specific drivers, it requires that these drivers
be built as a module and loaded into the system.

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


