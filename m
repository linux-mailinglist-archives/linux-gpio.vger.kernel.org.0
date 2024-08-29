Return-Path: <linux-gpio+bounces-9334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC3963BE8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 08:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE231B241B6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 06:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAD715F3E2;
	Thu, 29 Aug 2024 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="bLlypdfW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061.outbound.protection.outlook.com [40.107.117.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6A15C13B;
	Thu, 29 Aug 2024 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724914084; cv=fail; b=lJ1MkYCkd2shCsZ+M2PGeEZjnjtJXUlO/aMbt6KskDxwtaZNXoXdc3HvwixMBwc4CfmWaDJRBj5QBGsXiooIGoVrZgBgu9uOFLBbrkF5QCGuzlCE5XLYBkCiTKEWqZKPxMKFJ/87iO/kZ4lJzbSS2HDO02+HYk1l0y+zpAtPDHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724914084; c=relaxed/simple;
	bh=vDKpHv88WWa/JKUBSCbeCuP8tvkgE7NjET2v7nwN4Os=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RMTnN84eUL+2uQNIT9I6Mw8+TfS6yvCjt6EVQawDxuqpvCZha4U3oMMhwX/07tvdotmbSIZfc6/p3T1a4xs+DzZU3SJ9ONpFN1HvxgWR0HXv3ES9muEz7rY5sCc6Gvwbo3KExAJljtiJO5D2WJTdLL2kHBxc8+ovJSupLnLVGkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=bLlypdfW; arc=fail smtp.client-ip=40.107.117.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G67dtSesRM3GSKiInlKxbHtVObQyFGaGI7ONf4/1awJMWI7lroQNmileSp1CYA5N11tchjjnhxa9SM/FFhh5o04AjaTJY/7w0BFyzcXMqRfV45bzly7OLozHJKQQ4l+TWW+LRaXJRrTyUSNXnL6QQkvPubshvSdTNeLZvz1j8Pq+/mSnyTUpIGBCa0D41pHeuv+6lze94PdTKxaghreoMC5ZieMnMLZFH3cwsMU9oUkoUb7z49F3U3KhP+DGZVTCy+1lsEQPMJN2PPwXWb05OlzuKqIDTWsBd0NOxXxYtlVvPD4Bf6DxA2cZmaHaMH2he/ubqL4/msESwo4L5X5ctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVwAX4Aemk9Y+b84TBb+XP/wjmeUC22ujyb7rdt9x68=;
 b=PnH6cO4jtmW2cp42RNyMNUEjpqDQOxAZ4BlQfMPmtGZB5SixLb9iOOdjV0M8X5tjZJW/oS9+4GQDnWZFs+yMJaJHfTD2T6WxmWueWCKuAglcArCon1pZ05Hfr/O4wWpH3EKOfvUyoBc/1gLrnaqeje9iXYEu9TuzP5xOb8rPjQqEsSZ/aLT8fEbEd3unoE217WHLzgRV4SAMxF2S6bTP1Fw8qxXIF7nTkHK9lixrvz2oBItXsodTkaGQt61W1e2TUaHWZKGgf4JK4shcQ440/ykuiia0fLiw8Q/yGT3xNNgjWDr/AhB2BQNyTHm8KqJjr0TAscZ9RZvQdOgCP3diBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVwAX4Aemk9Y+b84TBb+XP/wjmeUC22ujyb7rdt9x68=;
 b=bLlypdfWRGvsLZVGnB0NGVMvuxxGL89aTwYINabH4R2qMocEFj1dMPsVFdWx5UZDNOriwSIlj5XvtRYVstLbJ/bzLdNYwTrNN//eQ0H5xuDDiYEQpebAK8VXqtpi+3ddts7aJIwnSkRfI1rVTlpr68EPGZtytC3v2qTI3MYAf1ppsVzIm81Pxp5ZbopcVdufVlTzyLdhfr0eN6Uur7MtP0KImcEFkJB7IX3AokDubWLLqmVQFRgZYg8dv+lBTFz93IJXogBYKPS9rynsKcG0ENOSH8wUpm2NTngvf+FG0RHbQc1vAMJ6XEo2Rz8D37Jw4/zeAbFTUrEC74CiumCa4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14) by TYSPR06MB7047.apcprd06.prod.outlook.com
 (2603:1096:400:46d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 06:47:58 +0000
Received: from KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a]) by KL1PR0601MB4211.apcprd06.prod.outlook.com
 ([fe80::29e8:8083:a2b3:bd1a%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:47:57 +0000
From: Wang Jianzheng <wangjianzheng@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	wangjianzheng@vivo.com
Subject: [PATCH 1/5] pinctrl: sunxi: Use devm_clk_get_enabled() helpers
Date: Thu, 29 Aug 2024 14:47:37 +0800
Message-Id: <20240829064737.16169-1-wangjianzheng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::18) To KL1PR0601MB4211.apcprd06.prod.outlook.com
 (2603:1096:820:23::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4211:EE_|TYSPR06MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcd4967-1789-450a-03a1-08dcc7f683e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ssajJbdMA6fjlt9SwHq8Exp4wZ+UcYUC7Xmpm3B0hFbfX0beoSGGJ1YFw09c?=
 =?us-ascii?Q?To3KzKB9ex5qe5OZyE6H3Iq4O+1jUV+ZRpb1X6RfwJPqta7zGud/FGBofBph?=
 =?us-ascii?Q?4Om4mbCi2mIByFlEWTOsl+ej0KoP015gaXTUvu8zOK2JcKmQAmkxAbodlJM+?=
 =?us-ascii?Q?tjzGmMcrYQpSKwj/d1DAbpbdg6uco0o0JqtKTiQSDaOyy0PahjB1evmazVK9?=
 =?us-ascii?Q?t0AwbKqtpMbPT49CfhbrgzYD5coEo4pdQ2GhZxqew9ROuJFtsK6BtFw5ZHRV?=
 =?us-ascii?Q?pBEbL+j1xfFxOXXm0YZSsEjtxVMjY5OGLdyqlA9uH6Ku1AC9hdmZMQKXHk5Z?=
 =?us-ascii?Q?oQDZxJBMdHinRAuNf7gcb9cbnKUEqVGE1vvzXbcw5ZSGjdYigQ5aZn8jdVmC?=
 =?us-ascii?Q?Pj1lKsojMbLz9qpjJRMQyIooPamx3m/KBQDDDIxbDTWwnCi6A7NICRNn/b27?=
 =?us-ascii?Q?RS/9GdiPvbaGbDxHcoyZbs4Nsycw2MU4B9CVCtQx8JD/riMHIM+ycZQbuSxA?=
 =?us-ascii?Q?r2dwOSjxVZpAT70unL901QtXa5LgnOvBRHC9s8QLY/eGzqWVwr64jv8dhkws?=
 =?us-ascii?Q?C6y+YVojsfyuoERQNn7/x1SzCtg8wKfni7YtXX8q3eyb92tNdA/mL03/FbXc?=
 =?us-ascii?Q?gs9QoJxXN1D1JDXDoWC50hkNvBFvUnh6DkBgGz+oX74SyJNge2IFVZd2Vk5n?=
 =?us-ascii?Q?DhiiJnC0UzR6JGDOvLro72TuUi2PbrqceXKa9azhpZsucl6p1XMMExv97w0W?=
 =?us-ascii?Q?ttHIS7cDGaHSkI15iTYRvb6zEncuwwchO4/bsL4tfKkm0CF1PhuVMwH/huyO?=
 =?us-ascii?Q?wZeCUZ7jbJflQ9mbC40LMMi6ab+b7YVfK+kA7rr5E+y30FXAhGdIC7jIPVtF?=
 =?us-ascii?Q?mdhoKAB1XCTQAx1wHLuu2qXOyf+Z3jjykW8j0SzEwEQlfd/9jvmdnX05Lhiv?=
 =?us-ascii?Q?cyXOb6ZXaK4YLPJbUiDMYPk57CDcJQ8ViMXWngtws7fTv+nCdBsDHbWAMcmo?=
 =?us-ascii?Q?2Jlshpu1dQPCcv6uQXAYRPFMmU7I6mruVxDUZYO/DCviUld4TDYTusTHa7Wx?=
 =?us-ascii?Q?Md7lawP1DjxCJs9o+CTSDxAePH+iOhGAMYnHIfbY+jq1memEZOBICpXk6cFI?=
 =?us-ascii?Q?WZ5/WR6GjYmkKkhL8GR5iQKSV/uVGWC5YVa+94pUuWvxnyUBL0FBbLBmSStC?=
 =?us-ascii?Q?DW1P5ZCWXs4qMdveKa85xoMqYGox1wgTSF4RAPlPAzxXQDA3f2tFaLQXhVx1?=
 =?us-ascii?Q?EDSGFFYPzFhXAS1CnFb+2t1Pq0Bnw46zV8b/nyqc5xSKvskNpqMQHDYMt7Bp?=
 =?us-ascii?Q?vCEcPMo94lTc3adZOdr/KndxXEJwjnDD+0xpVzz5M1wyYXlBwKVLjAQsD3+l?=
 =?us-ascii?Q?898+fOM7Cn/PMfwayn0NjJtdCXjmiXWHiVzEERaP9ivV5MH30A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4211.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lDPP/t/skaNCN1yYaSZYbiiOtQgaSlc/zEFu+MXjK1/BDAlAbpkJ9lPexHLe?=
 =?us-ascii?Q?q4/twW7UL2Wh7YjUbXgXOHw6aMn8uMt4SGQ1MdJ+sWLfe+adxJAMVBt3duzb?=
 =?us-ascii?Q?XrTEQgWFxys4Ovtu8yLz421ttvizzV+IXt0PFHxbjpnhpy2Q/u8H8r0ix89L?=
 =?us-ascii?Q?UhMSKvDweOMrO/PTGRRdys5xtYbiy2UdlT6o323KaDtLZ5Gd1x6nbqUUrdjs?=
 =?us-ascii?Q?OLvB23eGHA+OwpZ9aDVqW3QPTgLwU2UB8+fgEWYCJUbYCRWkQkFruAP9Ixi7?=
 =?us-ascii?Q?5ASclwA8lN606Qb6Ong85jIHh2NpD4DzY5s2NCnpznf4N6p1g8692BHqirA9?=
 =?us-ascii?Q?Foro4OkwhY7QEWO1Wng1buA4QORpQB7X4BG8y/BL/pTUGxJ737GuAPMMbzvQ?=
 =?us-ascii?Q?reYcGwvNAdiEWoTwT8avCCvFEGyNELDqLSs2hIDEbAIXx/tnbwz8QCy/6Z+i?=
 =?us-ascii?Q?A9/R7ACwyV8GwttEUrh1IH+DyISBoPEMzTCIjUp9XAGSy0AgGrtsao5jTqG/?=
 =?us-ascii?Q?9aiPPxEqfq4KnydcxHBvHWZKM90JCu8a5L4KJTfYIm0vDExuO+nBrofGvLRj?=
 =?us-ascii?Q?24aJKCu9IoxnkdSrqG+f/aEdifFboRPw+a7jR6MBPIkf5RSwGOTpin2f54US?=
 =?us-ascii?Q?Ks07BNYAiUmXGL28vcQeSRasm1UbhrQW34oDKiKg6izXleSYj+Jv46JliR1f?=
 =?us-ascii?Q?VNroOeE3NLqrL31+4AwLLpaV+7+CkZ7oR6SG6BlyWG357APNkrN0PE+/Q52l?=
 =?us-ascii?Q?oYE9NZ0nr5UcmiEkHJVw08k9dOYgeY+V+1uUyAMWmUkcGh+C8cfe6P+0sWWw?=
 =?us-ascii?Q?DAL4yxFiZ3V5f/oGT5rCUZYeQ8z1Jf1cm83K8kqdxiqxcQwC4kIQTJPck689?=
 =?us-ascii?Q?pqsobKh54DKeib/ZRj8y8rHSrhhEPz5CiBqt82yczHY67dtd4AlSjd8JfwKl?=
 =?us-ascii?Q?Mp3NN/OKh5059hVgH5Ap7RrKGiy6DWQVe3XyXXmIH+YbG74jqX1ax/DkGZCO?=
 =?us-ascii?Q?rmNpgIO4g9ExZAiXsQ4900n+5RnyaW01w4bURSD3ZW/4o2N2BL+OUtqiVd/3?=
 =?us-ascii?Q?vmommFCNX6aoQ0s9QYkp32TfpZVWkhL54yVKmwLDWEpMgziKVLjDnP/Ghz9v?=
 =?us-ascii?Q?4J30j7nahLski2Wb1OuCEpwaVuDzckO62LMS+KngTB24+0KekfTDjk4L2Og/?=
 =?us-ascii?Q?sKOQA3ULtFSTtuRQ9vFXTQVdf3I7Zf9rtLCmVKCGiY3QCLbaD+izNTw00hSa?=
 =?us-ascii?Q?8EeeCHoL6zWTyEWUQcfLom5F/2AWXD0vWfFmhRWneOm3bP7pnO5hE/30Fudo?=
 =?us-ascii?Q?rprcbxGRd6/l0W6oB0m6cANKN+4SHTTwwYB7Q9acyLCbhmpM459+HInjOjNZ?=
 =?us-ascii?Q?f614TDIfTFYBOb5z2wUwmfp9MsNalXxBC1nSmaFEOO8mJvxuU58u+XDdDYnz?=
 =?us-ascii?Q?Gawyz08SsqXLPR0jqXORhN8sfzVDA/KDt54vcANKjVwmO+SInk8Z+eZHbwj+?=
 =?us-ascii?Q?TTIHYaU/nLpzzgbmhnzRqwW9PQqFzamMSNRpnFWPCdP+eLZ/yid6vcquyJBg?=
 =?us-ascii?Q?fdZNamsZvXKNyL1kUiiKMojGiAoq379EggYRB9l2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcd4967-1789-450a-03a1-08dcc7f683e9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4211.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:47:57.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNQqBgGKpcx8hKRH8IVpvknog9X8SL3ZegsbXR2un1vvdVnPsJ04YmsVuSTpziuTCfnsYDG81Hzo7J+HCjco5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7047

sunxi sunxi_pinctrl_init_with_variant get, enable clk and
deinit_device disable and unprepare it.

This simplifes the code and avoids the calls to
clk_disable_unprepare().

Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 73bcf806af0e..bde67ee31417 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1603,30 +1603,26 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 	}
 
 	ret = of_clk_get_parent_count(node);
-	clk = devm_clk_get(&pdev->dev, ret == 1 ? NULL : "apb");
+	clk = devm_clk_get_enabled(&pdev->dev, ret == 1 ? NULL : "apb");
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
 		goto gpiochip_error;
 	}
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		goto gpiochip_error;
-
 	pctl->irq = devm_kcalloc(&pdev->dev,
 				 pctl->desc->irq_banks,
 				 sizeof(*pctl->irq),
 				 GFP_KERNEL);
 	if (!pctl->irq) {
 		ret = -ENOMEM;
-		goto clk_error;
+		goto gpiochip_error;
 	}
 
 	for (i = 0; i < pctl->desc->irq_banks; i++) {
 		pctl->irq[i] = platform_get_irq(pdev, i);
 		if (pctl->irq[i] < 0) {
 			ret = pctl->irq[i];
-			goto clk_error;
+			goto gpiochip_error;
 		}
 	}
 
@@ -1637,7 +1633,7 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 	if (!pctl->domain) {
 		dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
 		ret = -ENOMEM;
-		goto clk_error;
+		goto gpiochip_error;
 	}
 
 	for (i = 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
@@ -1669,8 +1665,6 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 
 	return 0;
 
-clk_error:
-	clk_disable_unprepare(clk);
 gpiochip_error:
 	gpiochip_remove(pctl->chip);
 	return ret;
-- 
2.34.1


