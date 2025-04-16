Return-Path: <linux-gpio+bounces-18909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E5FA8B03A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA4817EEDA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 06:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FDB221F34;
	Wed, 16 Apr 2025 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ex4kNJEA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A62206B3;
	Wed, 16 Apr 2025 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784788; cv=fail; b=qogLLp4PXoA+Q6EtMOoH+GQL16Lprx2EQfzg53H3t4D+Le42lBQr/9ylbyRcNUHPPa3tXf0O9fSabmEvzIeAPoyTcpZP0Ct0YZbCt5/qodX/cyng+Xw4u//Cl+HWWPOUh2JS5gDHGWuJOup0SZz3d3iY3xzudr0BS9CLvfuxMEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784788; c=relaxed/simple;
	bh=I/HKZl45doA0gncAaqv+JJxgnP4P+vPp+zK7ylKPVkE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CApleLYOl+vnK8TG9LnkGm/W7qurBLkIyoHAXo852+YSRsf0lGBQTqYDKqkue392VX2MzpwVblPHvStfqSAoXJFLN/YvpCr697jLnxRDxePikBznficP4z0AAaNcewip0g+OQqg68UQpqvZ1wTRGC3X/ol55JDLiUih+5aRWHWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ex4kNJEA; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN3Mo5mwpQ2H8MsQUdim8cJY2GGVSFx0BolslUQ2EY1BIBhiYay8fideVq4bK7JjZSH6R4aYKDJEjKoTXHAAJwnQHJMsY/SrnxcuX2x6u17liHU5GyFjKxR2o5QNb0vGBq9KWMBn7aTNHd2PkZ768x+TYfE9o5yEnMwdV602P8WHVVsqC+FRRz+jQesZeZ1eAINQ/w//5mcIkG5+Fq9h0jWKx59GgNWIcZAW7YiaPYhIuMZx5+Awr0CSf32u7NbP7E2HTUQRl5NO9MjvoPdj3Kz31ZwDem9mXnukEYAD8cDnJWxgm1KOtWtGQnjvu6zOcgdi/DnA1W6hdLneHKtI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZGfK1qpdTl3LOt3Myt0QV+mLoQMlSspIgXbDRjEB1Y=;
 b=GnJKf/X8Q9o4wEm36OrpQD3JssgEbyizmpVB5ByEuMasaQ3b2yKanUahB3yS4o+xuxH6I6Y7Z+gtQ9TZRvlV+16shgHpsxS8iZhK8ltNUQmc1M0tLQ2URCfX+odUcLKIsjVysJwgiBrBAmzCNDCJQ63Ipp0n+V7WxkkjBGIikMIojIO0vHv0krWQGjAMo2azAitcc6CO+AC91ZXN3kC4uqZ5+Ajek2PEKzTyGRmXrbAI7jgOKnTGD7ZqmhRPh8x7xpyFd/zDFgQm/9vRbAlU9en7DBpmfTbUBSc14AKFaDR8RandAlRtTYp5CL0P3thUbtAoihLXAIUS9LVU4KKn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZGfK1qpdTl3LOt3Myt0QV+mLoQMlSspIgXbDRjEB1Y=;
 b=ex4kNJEAsj1PLzsEYCbLnAfmjs2Hwy4RJ89UNBD8rMdxnZ8vuJbOSQuVDexqUSqbfVXkg4wLYTzNJ3Q2zSB7phYRbBA1/a2rfRy2szgLcP/b+ege0sXhZlXh0GWM8uMkFFlvAtL+XkO4JGqRVrHulczfHu1fOKnM9QCK7VmxKghWlyLL+iMTpKbOBkJ5+iu+vuN10C1IC01ncVAfk4Nnc9phrHsNoCpv3lcqfPhi5bH11llYD2e07tQHJrM/PaWWVHSJ2b9Trxv20vMxaZZAl1m7M3cu2pkelCyZiOCdgyvaT4u2d8vYjXhQR3FPkDwUaidOyOjjDOU4DE1Wkgfm6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by PAXPR04MB8352.eurprd04.prod.outlook.com (2603:10a6:102:1cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 06:26:23 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:26:23 +0000
From: Jindong Yue <jindong.yue@nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jindong.yue@nxp.com
Subject: [PATCH v2] gpio: vf610: Allow building as a module
Date: Wed, 16 Apr 2025 15:26:05 +0900
Message-Id: <20250416062605.1948856-1-jindong.yue@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To GV1PR04MB9183.eurprd04.prod.outlook.com
 (2603:10a6:150:27::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9183:EE_|PAXPR04MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a308dc3-bf09-4a32-502a-08dd7caf9bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JYflelWTt94kaCR1OX/a2Zx33Wxwz4Dti4FLhTOMKtqmRr8LKpxR95UqPra6?=
 =?us-ascii?Q?9tt7Cgm8NJbhIuvYTzVEXMVHLkOfglTnMmOML/Nw13vvNMhoMZgJxZOrYIsl?=
 =?us-ascii?Q?6m/8ZiS7/nhprrBrrD7f1s9LG7Js+U9a4VxXF5KiNgCoEDFLEaw4DuAv1m+6?=
 =?us-ascii?Q?D/Sb661YLwP4a9UXin1psAyPb2GQOH2Tc9uOTRBS0QynzLcl/Wz7c58i3v+u?=
 =?us-ascii?Q?FmPVFjDFaRgNEbZwK//cHJePMI+Aoskg97R8y3jBGr+TpUWSImQwmda7DIYA?=
 =?us-ascii?Q?kLZznuwENK0EUgoze36aERj3Qz7RR4VfHsovNcuAX/KPXuHJMRN1iv72rPWa?=
 =?us-ascii?Q?6vIXjTAdRpsJ+DzWbHnJasXvXNzd5fln8atmTsfby7IPUa36GCKQqsmhmh5T?=
 =?us-ascii?Q?Owpc8bFLgE4UVelXxP3sy0EGQjeIqvEVNB7nO52TLA/dVN2dLQJRQZCqvvo+?=
 =?us-ascii?Q?3zLU5rlGlTYSBNI8gCe8nmRb+WaBuBpr2vno4tfBy22RwAeZ5l/Z/KNjJL3W?=
 =?us-ascii?Q?hcaubZBJgDP2EvocVfWlTCp7/iPbTFDy+VSfp3Lj1dkWwGjwqPtMLLxgF5w3?=
 =?us-ascii?Q?KlX0jKEarOdrTHYGFk0ige5WJVRFLshG80wLFlH+PtkZAoftPAydOC0R8C4e?=
 =?us-ascii?Q?uFhW/+/fQx1DseOAHuSlfT6YpsHotnPaRPL+vJveL08MeXCxPd+VfcMmkZ5/?=
 =?us-ascii?Q?SleSTA0gSmNkVXDDIPcU41/SREErOLZ9fgpGetAGXPMvNZ8vQ4vETpbnV6m3?=
 =?us-ascii?Q?UFG63LW0K/xpw3tT30Pl47yFnvRlkklFPagyazzA6YZTAmQ9Q9YeInKkre3v?=
 =?us-ascii?Q?XAegXWfe+f9DbqAIXMZhZsP0Qq+AwNzFlb9W51FVq+hgOVAoiNBPziBxsmD1?=
 =?us-ascii?Q?ojdy0zyBAKLSM42FrW8j5bWyUJ/nJK1QnMUIiodNNC3a3CR4EKgaGQFzQPmD?=
 =?us-ascii?Q?KEVshyuRKAoLh9Kus5Uw95CeyKtZgJRpUiS+Q4ouwXVJ816QQJ9ZziwR2Gh3?=
 =?us-ascii?Q?QddS5bNo38egNE8FdTCDQefl5nzu71Jy6DEZ+wz+5QHFcLLQs+6qWIuBBft5?=
 =?us-ascii?Q?6FK4nb8vX5TrNjRe5znvyApj+AWb0kq+f1chVVpslLR20wOxw1/qazVd9IgW?=
 =?us-ascii?Q?ZBD0Y7PXq9LWGZAhDaPgrPnybFLJRbtyvu+xWT/VTBwaCFnqVy20GpM4eYg9?=
 =?us-ascii?Q?V6b7sGTVUoOwk+wIoaPXKvL52UuuPbRm5Bo5XAi4O8ByD3MbwMRw7JpZ+2j+?=
 =?us-ascii?Q?4c1eMcIqrI/EkW5j1XMgwdggXFI6MX8xAe+5q3YsWkxGUA9T50A8iDvAij7K?=
 =?us-ascii?Q?naurYXhuqTR0nFbkjLSq1qzcW3bdTkLisvWalhdR2BaAZDVPnlSHBbu5Uzv6?=
 =?us-ascii?Q?YLnzbdMOmyGsQsleNiCJRLbvWz1rJRwvNAdQ/ub2lmkQOS3y1b1khaQaMyLk?=
 =?us-ascii?Q?rKEB+KneIDSmMQM0EWF3A7GE4TRtEcCd4pj6f8o+4sxor9tQDCBSYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gfs/0PpBW0Ye9LjEVx4Dj+kJMDUN1+O9D2QjA967ExX6FqsURehIzL6xsxhL?=
 =?us-ascii?Q?lwJBh/nEA2yutifyxlt3uGZt3oKVLmXf8IlzNZAugE47BPD5agMvnHBa/VJO?=
 =?us-ascii?Q?hs5+77npC7vIsuI5Dw5z7x5z03NaGfJ8bBUXgbeFRHCawv0/fjfwoVZ1HEh2?=
 =?us-ascii?Q?BOQq8NPNwH4O1C3vzWniIhiBxKl3qKFnn7hFSNFDhcAKcTfJW4ZRbE5zoXx4?=
 =?us-ascii?Q?QFayNT4hr0nXIhj9Ot3LFqsvqPXVUi5UKhuQXvddJ7vuarQotSlUKqlDQUOT?=
 =?us-ascii?Q?docNzO/TLLDOnnY1y/6gpTLgVA9BuNZ8i2GlqOLoKIE+22eDFT8iJotfP4WP?=
 =?us-ascii?Q?/t6bJcV8WNwr6aB2PCiW3aLFp7ZmL003GM8ecOcUOgTqNmU/AtSSEIv9aLLI?=
 =?us-ascii?Q?nF6rKUXejT0zyp+dlP9/g+o4wpYsp0eLBu3zztB7o4tnKkclL+KwKj2N7gWg?=
 =?us-ascii?Q?ZWmB+R0tOn7a/xtd63KN4vJTt60OdnS3RL19+gC3yONRvlOv83Hhtu4yv+7P?=
 =?us-ascii?Q?gyhpC7LK/3n0E3WljZAFyKhV+qWuPjH69GqUuuAQuVC+LIEOsddDxKEJIMrF?=
 =?us-ascii?Q?8tk/tlvb6mW5YwoLPq2NDSO2Tewt+b6w/UabMnjZEQb4oElcCHPs1SgLQNbi?=
 =?us-ascii?Q?6TvpDzDxXL9Fugj5a5QSYPeD/0mf9gATHQeSxTIm1NWC7fIiFVUDEWb0enMe?=
 =?us-ascii?Q?qyK41igGLnt+3c3bl11SCo7HeIGnhqVc94xAU7q/L7utFoIcpHQbGHqyhH9R?=
 =?us-ascii?Q?7ePLvDb9jER0s0GxnZhrx3M33AJ7M4qRDX9nVdYtBwZlwKslUTvX2afMJFIQ?=
 =?us-ascii?Q?dDfuvEWVB30Xx+LtpHPMCn3dyaG0g0Yy5EhAVnvsok2y0bSJSOjuBPskt6GK?=
 =?us-ascii?Q?ivYG4MbOVb+vSCD889NnJV/opUsAVHZWXFQaRguSkz8JL6Jcq/nXEQ06knr3?=
 =?us-ascii?Q?FwzU0U+1001sfUgBYYPqTmyDpTM3vPOVuWLvZoJClVrN9Dsqh6nRlb32nBY/?=
 =?us-ascii?Q?Famf6FjtSeaxnsi6ldc9sry/1mhnaXlLMTUUlubohjnqv5tHIz1lLa3z/njm?=
 =?us-ascii?Q?QJeLvm+41t5xGFKVQwR1UCAvWSNsRaLlSXnK+FMOgKatcgIuakMcaVuDYlMw?=
 =?us-ascii?Q?uhAQVfIwI7Bj/8j6jP9VJEJShlyXZ0dgRFIRECGzj6sepdCFAuAwyLTakznK?=
 =?us-ascii?Q?8lT3aTpWrqwnrnivz3Ja6Kr8OkuBFw+ArtO+23As9fGfbqpabVy4+EM5aUX9?=
 =?us-ascii?Q?/NGWfUPVGd8wpdq70YFl4bbBvvV4aV+UMtmYqnODUaFKKziJzYiVYlu87arm?=
 =?us-ascii?Q?c5bbr1AEserxJ/AzRZSpZ0y28MB4q9hPI8wu3aqoSMS4q0grEaRcKTycYBz9?=
 =?us-ascii?Q?4Z1m+QLcvzo6TBy3YNPQIy01VIIEb4NxVinY1W55QMlGzEfQFlxKC+qqtVqN?=
 =?us-ascii?Q?XgcsFCuCf4eLv8QeNrI+k7CKwdJni1f1Of3MOECjmd5FZLxhh2c/b1/scyu8?=
 =?us-ascii?Q?THSbCBXP0aEDRXRyqO6L2AP48N4KBWRVmvQoHgejK5QGDSMaEREVlsGjK3bS?=
 =?us-ascii?Q?yFYW8VKCYyWWIFE5AKzTZXxk552pHuEfjGFKoU1I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a308dc3-bf09-4a32-502a-08dd7caf9bb1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 06:26:23.4595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4O2eroqDcAjBzviAKJfsjn7hwzCKjdhfOe2oSf8xgZxHgJXVXU4ZRYw7aPb9dyLEiDDoj3Grnbhs2eQJ5hq/bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8352

Support for building it as a module for use on the Android
platform, because the Android kernel(GKI) doesn't contain
board-specific drivers, it requires that these drivers
be built as a module and loaded into the system.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
---
v2 update: 
builtin_platform_driver -> module_platform_driver
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/gpio/gpio-vf610.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
index 4dad7ce0c4dc..7de0d5b53d56 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -345,4 +345,6 @@ static struct platform_driver vf610_gpio_driver = {
 	.probe		= vf610_gpio_probe,
 };
 
-builtin_platform_driver(vf610_gpio_driver);
+module_platform_driver(vf610_gpio_driver);
+MODULE_DESCRIPTION("VF610 GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


