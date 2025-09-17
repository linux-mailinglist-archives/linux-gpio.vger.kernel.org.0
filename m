Return-Path: <linux-gpio+bounces-26292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBBB7E630
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80BF37B17D8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6173932F494;
	Wed, 17 Sep 2025 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aD/VgK6L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17032F46D;
	Wed, 17 Sep 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099907; cv=fail; b=npYM0IwmGm4n6IwV7S1sCiVXAcgIJxwlJJ0xb1SfskSXoAPtJWcdWaSu/gZhyvWyttX4OEMR9s1zZEeJ6XgbSP9GuZJWjWTiIylD/2srTyrE1FsRm75etNRfkzA+8cTDEkqxvgqNK2XbgrEerDIfEsQSPKkOS7014vR/Jh/O7yM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099907; c=relaxed/simple;
	bh=d8/qcHc6hPxwKyu62V/VZH0mD2JVNgr6bz5tr63dPCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxDMfNP4W64cCm4HtpCqCSudPFL1sT0kXghpNkyXzVFcn/0xdwoWofe+6fojEXcEX7sKJEWeHMQjcUgft0uvd5hXr01SXdez8NW28PcWIeTNs+KCbPRR9tRubkmFnt01k80pKJZkoGXvaNVStvzux3OLkI6CG+Z4yEOOb9WfthI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aD/VgK6L; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVbm23tF+2hLKJL83iWz7ThA7YQ1sRiBqjlrrzoeW6hXLQ7EsdGV881PKTeqLLD76xJHK+vXNQ8IgwA8XFaBTDi5H0xaV5nligX7SA/CeTPqJR6UcAhij/Dgo3Zbc09mJvXPEx3l5tQUV72DIS/Qd6giG0fpSkUacIF2XDMgMI+fQmeLHXGvyLf0ejdCag42I1CIXEWHxPkmOQuc1GLSb60ocot2jQAmegK0PfetrAoDfQlVqMf+GbiLjZfQE2D5mLAMwP6MqnbiHE6FGhXvkpC9+ZAlybrGf/beG1k9cVZB2B1AY94zQS/V8pWNVX5rjUp8YMDJ+RYuw2CrajSQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGmqkkDB/d1iXR+KwKasIw03uOLHuF0hvb0exfobGuY=;
 b=jy5LiITfh0sUU1mnqIRh+2KE+yZoQ/N7VxX9qzEfJrSUZpwcV+GPnEbajELTSwpsIxERabsmzfLqS76zYPS9NZkz3FbQ/x3PBTWkzxmcUuRdZ9X5tWn3Bwoklz2cynbPJEJOOEbbkRZq1hQrLVF5bb4CSr44TiTlXAz0MzqKyzbxspMnFdHqvWUHy8gv7h5LOLVa4oNDsGD2YY1CT/QGNQNakg7mkIReHzzvYJLzz5KeNGADW8v8SdM5ZkwNT6+HDgmViy0UtF+MnvaV/V76xVjUbCmwRd6gZkvM4qUkzUf+dPA8462i3Z1b5BRZPdm2TtCOLegxXdH6mg97rq6ohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGmqkkDB/d1iXR+KwKasIw03uOLHuF0hvb0exfobGuY=;
 b=aD/VgK6Lrl2xQpWnBMA0CEgmHcTZj29ceAfcZocGfTlR+fs8yI2JZhug3UfRQKTttwCpo8vEfyCe/vyV567YsqSZ3jYvxFtnrTyvG6jEu5qdcqhf0eg1meizaGRZf7XX5/jtSnd9ETvfg2qpcgCjOt6j1viU/1nw6nUTl2AJrLv33y3v4jj0e44D91Gr9UjQNnVGGe/yndDKMsmlnc6gKe+tV1o5rg7rltqzS6QZzCpzbwSBJqhdTttG44GdGv2OsqXL+c3qmLBTqmCBjWGo0smdY63tgYPg2c7yiqs2K5V6iXqLvOIgb4R95DI1ucAJPH+6XJ7Mappi2rNICOb/WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:05:00 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:05:00 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 05/10] gpio: regmap: add the .fixed_direction_output configuration parameter
Date: Wed, 17 Sep 2025 12:04:17 +0300
Message-Id: <20250917090422.870033-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0095.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::36) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba117d0-1834-4558-7a07-08ddf5c947f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LjrkO3kqkjSyifAL7ocWNNwfq/+ZOfVHw/YDvFEHYcHJjpbMthBS1sa3yHcw?=
 =?us-ascii?Q?TMzGQFj1yg/UZiVnZZv2U8wIApbKtGlparOXnXbyCQhbOXnZEsAmZysvbWEv?=
 =?us-ascii?Q?TWFoPiGFHAbkJqQ0sWlzM8I2aQE7ga8j2gFoz0/MLRZlvyJDJavefeKp3qOi?=
 =?us-ascii?Q?pfsn/t7XcFFzXdES5tg0/6rJ+emsYJ2uEGj+M7HXsnFQ7BbEmgTC+/hVpxc8?=
 =?us-ascii?Q?+2wxNG+elr2hw4Vtgl5Ojhl9Bpqwd3a93QxSR14J4QaHIkIAWzjCUF74TUfj?=
 =?us-ascii?Q?FPGQBUbuByf5KBzZvDAuMHCPP0liSc6yfTU6Y+5OECNQiOp3yOXAdBIpMETP?=
 =?us-ascii?Q?bzSFD2jTvCWxPBOJrqJ1Htj+9gtIw1lqhb7OoWEBqlaCo4xjMgeXiqpnfDZW?=
 =?us-ascii?Q?nr6nt8G70lTtjKa1NtrZfU9Bniq4t2pdMV1Rm4HmFJwAayBIJA6qe72gFZtP?=
 =?us-ascii?Q?+jL0GU7qhXFKwPbL5HIGvDV/TTRNubWhYAF/AyZYyh7Fvmi2bCYGSTkqBYZA?=
 =?us-ascii?Q?eoo/VRsd+RN5W8f0gNk8+sJ8GL0G9Cy4RUbsBjIJ2FkNK6qgwz/Ql+Hd+yK2?=
 =?us-ascii?Q?h9VCZ4I+NPy6lakCV6LiKUD/e7CMnJ7eNhomcyJJtK9kwKgFRLO0TBuFd45E?=
 =?us-ascii?Q?6KeIf+I+62wc4WzQRhNB8xo68fkJQDW66qM6JjQS0sqrCInzziGnIlKrFMDd?=
 =?us-ascii?Q?lZOvKkSBOj2dKNOvgXwIObxNFZSF2bxKOlic7uNzirvjipnwux8BX2wfLj03?=
 =?us-ascii?Q?E5+AU2XJiMYiJy5YR5StIMl0cMqYiohChZtaD3W1HmkE+KGcnyTghxlRVWzr?=
 =?us-ascii?Q?xbzMklCxUHCLZmBrTS4gWvllaTLlclvu1+Om1uAE9V8ElTiD1Ou1dzBXno4W?=
 =?us-ascii?Q?c+PMFpRuUTw8pc3nC4R1WDVyx8T286m1x4tzo95FIRbYdnhaSOczAt8SX3bp?=
 =?us-ascii?Q?K2AJZUPt4XV1tebAq1dK7kxktr++y67EowN0qgBf2xpuViAzcGdSmGteC0F6?=
 =?us-ascii?Q?dbgU6wusRwVqCs4ZCbYB9tgdLuRbjon9DNkwj+jUdzGZxXeoem0GQPyC+kmx?=
 =?us-ascii?Q?dfv+9ZZ30DTdGFJKqSuzw1res2LGq1dqLedM//K6Bp8P74ZmKGSMSfs0GjBI?=
 =?us-ascii?Q?Flvwkb1QoqpeuLt4qVlpRMX5yLKf7wQCvAy65l2uAalDH0EpcqSz69rqgoBP?=
 =?us-ascii?Q?WM/giNFc5Yd1g0BbLy6XSuE9URuPLKyO/d4cDpcoL77CsJ/mKHl93TkYPD+J?=
 =?us-ascii?Q?xKr01VAGbjSZoHZvlbxhuko75xn74I27JCmBC+tjmR65wArMhQSAB7W9R9O5?=
 =?us-ascii?Q?5hluBnnUwYnny8Or5hmxYbuz50W9KvSrl5t0kI+gJAqL2elipxJxco6Bn75w?=
 =?us-ascii?Q?wEIWeoq5TxCux15iL1v9uMXfnwjbU8f51u5B9ZhQoftq5elEw39XKrMwE1wT?=
 =?us-ascii?Q?KOCwiggRHIk9kjqpOzWyrfGDzkHLCMZnphsbgZjIqFk810Jmapge+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AdLr42aSnc7go3w678dh5XfMOnQv98nJrp4q+tzqZZDDOpFkmjwejaHedGNH?=
 =?us-ascii?Q?f8mY/dxCB5mz32sGcaIssv5e9FmzljQcPqmfbbi6fXItxqbqrBbG18CuCrv8?=
 =?us-ascii?Q?KM36PPHSZ/Dp4INooXjtxjiFEwfagMFzN6zk7PORVwICoX8q8+hLRDU40dmV?=
 =?us-ascii?Q?prHMNi741zQpyeEV0fphqMnPg8Z+vSowSxJboaFcGqSg/Yfd28P5/+Z5/4WZ?=
 =?us-ascii?Q?T/ZOVTMlB0qwgzpV054x/mUFy7xcVOmMtgU6zjhNR1TA7SZZUqTKuqqhF0ve?=
 =?us-ascii?Q?xXYgDjsoyLjBPkZt9RI0683oTDb967G7qqXLUZpY8SvmHsfvJ9URta/93g6N?=
 =?us-ascii?Q?dAbXgllI5tn3KPxisPdWK3ZxCSUGyRyhS+uSV1TNmxTCl0IOzbqYFDGbmLh5?=
 =?us-ascii?Q?uXaTnJ/1TmzeAepkG31xfyp1lKzj8bHIefZuHSiUZGQx5QYe99iwZDAzl/2/?=
 =?us-ascii?Q?B/eTI9VKqDfbVZgPNT6UZIOCNmXnFlBZfgeG6hoYqmsAqBWvKhcyueQiZ2kp?=
 =?us-ascii?Q?wK+9CQbKp0XFso3AsxupKeWYY6D7UnFaOcLBWSu+jAW6w8aSUFaDxrIc/xS8?=
 =?us-ascii?Q?oVMmwRjl3ySqYQRqd4XhIDuOfqUc1dgGIjANdkPu2IW+vyepKdKBkXp+ZHmn?=
 =?us-ascii?Q?FaJDQA/VLGit+47HTxndzRrd5cAmA/5nAg/axm4NzwdEUsvL/B2YCZZifDqf?=
 =?us-ascii?Q?g2i6n+CXigrR//DWwfbN3qdY66q4m3zXj620lELyZYhW+MjX3iFFNS8or55T?=
 =?us-ascii?Q?BaHCkO0bLWCOqh4CG3/4GNR/7S849xr/5K2fViPoO3g0f55c13RUbD1v/6j0?=
 =?us-ascii?Q?luGDxGZjGSUjaaT4UTgZi2zNWp1oJ3rtc0LuImCHuUrwmn9AWE6nfv4OA8Cj?=
 =?us-ascii?Q?qE/Sd5R8TNu+RCxG30waFKQRve0u13ZZRkcLtw2cYxlIhoxtz+VS9MsEsRvI?=
 =?us-ascii?Q?IqtJhQZkGY6odDC63ZSnCIdTFaORyH4R4n7qn1scZsg837ULTKt2WDhbUrCC?=
 =?us-ascii?Q?ajDNCXH8PjZr4cJNZDQ6OqJE0//lHhiq6w09BDumUSIMAG3h87yG7q4/GIOl?=
 =?us-ascii?Q?7fVYFlMob0Bh3PUwZNrGUeHU1YvUNjEcsgFz4TERyYKDs68fLVbFaA3ZHRg/?=
 =?us-ascii?Q?Ft11HA466xGA8KB/V5tZ1DN+915Wull0K4Ztvq1D3VhCC1l8JwfZlN1bRBsO?=
 =?us-ascii?Q?E9yEJKmVkDnGoNh2fV386l6exv4Ul6zU/wrFO47gt6B2u+DKF4X8pdqbdS7N?=
 =?us-ascii?Q?NeKBC458F+blXRDX/SLYrfRZxlBx5yEkHKSq5Bf1IhtbqAgnJ4mZWVbD1v1K?=
 =?us-ascii?Q?jdIeoL/02wDNX60jdX1sr3Xsco6SKOfe4MWVIY0o0Tv1JG2xSVyoW7NYXhRX?=
 =?us-ascii?Q?JqETCxUiDnSiqUwQG4CzRJiYG7iuxvDpc27U1sFwTi2h+EYcGqKl6na8FQIN?=
 =?us-ascii?Q?HDhzN0lqlI+M2KFK6BK6yBzu4Mip5iuLUvWLyNkYE4onEz9qHF+gCnrPVzxs?=
 =?us-ascii?Q?9Wo3wt15N24snnZS5tIcEUwu7NVfH8EBWw/qZoO0EYttuqKTGh7jUvwICmiW?=
 =?us-ascii?Q?KdQUxa32Tvfo2onFKjBUtknSZjK6AOcGqA1pUbae?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba117d0-1834-4558-7a07-08ddf5c947f7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:05:00.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zEouYfR6wLgUfqE6iMP16wcHfUesUrdtiPmPdRy1Gpc1EfkyqjCxGFP9hWTC4t0E2ezvED79KCXYL4bdlSAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

There are GPIO controllers such as the one present in the LX2160ARDB
QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
together in a single register. This cannot be modeled using the
gpio-regmap as-is since there is no way to present the true direction of
a GPIO line.

In order to make this use case possible, add a new configuration
parameter - fixed_direction_output - into the gpio_regmap_config
structure. This will enable user drivers to provide a bitmap that
represents the fixed direction of the GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Add the fixed_direction_output bitmap to the gpio_regmap_config
Changes in v3:
- Make a deep copy of the new bitmap.
- Remove the offset check against the ngpio.
- Added documentation for the new config field.

 drivers/gpio/gpio-regmap.c  | 18 ++++++++++++++++++
 include/linux/gpio/regmap.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index e8a32dfebdcb..9edd79b5c10e 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_output;
 
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
@@ -129,6 +130,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (gpio->fixed_direction_output) {
+		if (test_bit(offset, gpio->fixed_direction_output))
+			return GPIO_LINE_DIRECTION_OUT;
+		else
+			return GPIO_LINE_DIRECTION_IN;
+	}
+
 	if (gpio->reg_dat_base && !gpio->reg_set_base)
 		return GPIO_LINE_DIRECTION_IN;
 	if (gpio->reg_set_base && !gpio->reg_dat_base)
@@ -277,6 +285,16 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			return ERR_PTR(ret);
 	}
 
+	if (config->fixed_direction_output) {
+		gpio->fixed_direction_output = devm_bitmap_alloc(config->parent,
+								 chip->ngpio,
+								 GFP_KERNEL);
+		if (!gpio->fixed_direction_output)
+			return ERR_PTR(-ENOMEM);
+		bitmap_copy(gpio->fixed_direction_output,
+			    config->fixed_direction_output, chip->ngpio);
+	}
+
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index c722c67668c6..8d3d595bfdd3 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -37,6 +37,10 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @fixed_direction_output:
+ *			(Optional) Bitmap representing the fixed direction of
+ *			the GPIO lines. Useful when there are GPIO lines with a
+ *			fixed direction mixed together in the same register.
  * @drvdata:		(Optional) Pointer to driver specific data which is
  *			not used by gpio-remap but is provided "as is" to the
  *			driver callback(s).
@@ -78,6 +82,8 @@ struct gpio_regmap_config {
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
 
+	unsigned long *fixed_direction_output;
+
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
-- 
2.25.1


