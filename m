Return-Path: <linux-gpio+bounces-26162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A02B57AE7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1227417A5FA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076A308F1F;
	Mon, 15 Sep 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J4x//iMM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A230EF67;
	Mon, 15 Sep 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939106; cv=fail; b=mow05+WihSyBTo6s02ZZw9hR5IWg/pw+viJl7XvwMSE8YmTqpsonaGyMLp/q6Lc+YvBbgJQGN9OEm7Top1n2vK6Lx8Fo10buhmcJxLSUeeLiSL6GEzqCHoNR/MDQrf/30Ya4DvZwwJ/2JubZMuJBIDa6DrmyGQXWNuJfq9Iq/To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939106; c=relaxed/simple;
	bh=W8Oj/Y7eYuea8WW2W7Yq3wyRuUh7e4JjWSS4CcLeGnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JI6LvEcx6SKsg5K46nL/+/5K5U5Dba8xWgv93Zm5qE6T/Lz4zpK6vgzNvS7aAl287HQYBk4swGZspkRZKZhyieoq7gYMsnrxbDMS10gYE1/ysh43mXCmBfozcl0eG/bAJcP07TOCl/LW9GGSDkSf5x2DuaHzllAk5ee454VZCys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J4x//iMM; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mt+ERDGP9wr8BIKIgugcYxCxKqjyjVSgzu9saRbVYpX2XWMaCG0fY5UaTMg5C0ckT9q2zCsMrpolcPRpia134KxVK01zhqUYPipJOrtACJx/24Eo4Zu+2+iNksskvJfbhPBKVnTfcxWbeSFImSGyc3yUJr/vjQm5dAkzHVRJHet+MStbn1XI/qXzd7sBOIgKFk5TQvE3yczOausYiwAKKa3O/C87Sp2U8lLlb1rL2nSVGcf0bnKkgU4qOd2C+wHLU/41SFFakT6lV3GYFsbqiBRCg2hm17wsu9CBlV0DdlT2SkfgHMwPVqalBEJFMnrXLv0pDoZa0ra/3ZJ6hNRt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRuD8opDj91OqsqtjE83pYB7kpyo3pu+KLwWZNzaIpg=;
 b=d9R0csJMloSwitCQ4BqwgvfeU25gA79A8fauPArSwuhBk+9ezEmgEmv46s+zbwEEqobDWKHmOsJlBB73JwzeVIPYHhSuHTeGKdOOpDQJevVFv4WKmdTSofItc5Q8yumBFtvmeHm4GTVhDjrvyC16b7O5kU7Gs5rDwruH8zVXGDX8Dsr0okPB+5hvyAdAoKvwB3P1+KuhGGXfuVBcVz1dMq3htgmEv4zn6thkvvF268x5QHEviDhE3eUQKX7Fd86hLmEfsMIVb5HSCQnHAHLjaUN63o8yT4hNgg/f5PMUdQArKyAIVqcxLVaM0HRKF+2pb502dT9djO1hAbz27sHDnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRuD8opDj91OqsqtjE83pYB7kpyo3pu+KLwWZNzaIpg=;
 b=J4x//iMMfmXdddLXaGlmJyjulc/iWBxjyzuPhyvIFRNgM8gKThhAlQ4PusF57o3PoIit1ablQ0CjeNAHUHLDJryszQwDbdD0hY+3hnHqTcQgWiH5MC29Y+0z3QCZqZLGPbm6iQb5H0Mjqlh+PPQG1Gzb5x8gNKRWmbe1FKoFvFtJWkVbK9wuTd2fqevDDj8AIqRZy0S898joqlaG4QQLwVcyqGVTa+7ugVh5p11NrMO+VRlgU7YAjkkIvwM45+30azY4fEFYEeH80HSAEQ9GbvWv47f7m0KhjRbD/BmrZsdc//FsmoL6R+B0ZMsYFxIEWC6u0AZ3mRUfSU4YWvXMrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:24:57 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:57 +0000
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
Subject: [PATCH v2 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Date: Mon, 15 Sep 2025 15:23:50 +0300
Message-Id: <20250915122354.217720-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::39) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db88f73-8f46-47af-06c9-08ddf452e202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37L3dkNFOcZC9TqO/gu8C+QKnbGWtFoXNZoQgj+XBKYFOLHETWRy7IZkW5t7?=
 =?us-ascii?Q?fiFEe9l9AVo11SskRkCLaLFwx9BvgqxKyGlH4QxjTJ7gQrzwq4saAHqGiXxG?=
 =?us-ascii?Q?MVT5EEbKtvxppyBwTTRJ15nfouLORw64QWup4NV5TNYItSphiAL96XqhxBl7?=
 =?us-ascii?Q?orrFfhH9cofqE+kG0ktJtZZ6oiV/URGC31iE2XiWBfxVMZ62u1Wc5ryzEz2s?=
 =?us-ascii?Q?T9DZAKWj2VutFW0/yPGRTfU/5X8xRDVC7FuoubeKl+KTqFQ43b3FkKcFhqlk?=
 =?us-ascii?Q?QG8IcTGbykbHZ2N1hQNBXiGYG4yCfdToF3kHbOvMjEvh5wDOtnKszSBmjg+q?=
 =?us-ascii?Q?13h7e5A/xIyAwOgsaSzxHAhvohyJd50gNZkP+JnbqV/SKX3MclYcsf98cfpy?=
 =?us-ascii?Q?qlw+w9Qr12aAHcDoJ3UOSefeiA5lW+WXkwcgFGBu/lPlsNRZ7fraULqwPJP6?=
 =?us-ascii?Q?8dNFham9p/uxbM2hfn6zWoCragubM89RuQ2l/cLwrv66V6nDz4mcz2XGTvEK?=
 =?us-ascii?Q?BNXJo6N5VWY+NE3FqkNbrfMOGQQsS5akGYppsliRAeYDPZw0TN9yxDl0JqCT?=
 =?us-ascii?Q?xANpNdAsrkgff33fTYKfQH9LNNXeYIEh5JNm9tRDiYgbHrmM/rb/UOHh8UG7?=
 =?us-ascii?Q?FY8+sWCLmwPMoWWBYPKxN/F/dFyJ6SeDk4DESsExvbig5tgGETV4tazVga7E?=
 =?us-ascii?Q?oPHs0LjDMAnyfGpDoWhUVbLexgGMyoVh/htzsowOjlA1GUfylfNWvrvR95Wo?=
 =?us-ascii?Q?kHh8ZGtPnJIbat5OQBjGTgITyl12w4V5gUXFGoqHi5zqhjpPwDLi4+DPCwmg?=
 =?us-ascii?Q?UO5WT9osO4ggbk7xTEoBOeGzs3Jy3eKb/da1aOtAw/rpI9vY41se5bFSdjwT?=
 =?us-ascii?Q?xO4VDPMi8orA7YtDGnbPFWM8J5f5LNlY4SOkj0Kd7WJCz/iYe1fgfSz0E9LO?=
 =?us-ascii?Q?xbbtekBFjdwamwGziiDm7b8isnLZ7A76b4HQzqyE2Iqx/BBp23A0kPdYpCrU?=
 =?us-ascii?Q?tGRO4/TSsLpw1M7O6hOShhok3xpikFE/0E6xQW5DFI4FfWfiv2nPVJUfG/SN?=
 =?us-ascii?Q?INclvainMlmo/fc3m+mSkgpWZ0e5quxs/v1xYrVGcRKkEcqJlIL2nlERIWU4?=
 =?us-ascii?Q?sz2P5ZtMn+cwJwXD4rsHSVpzdq2iALbejX74OLWWWVPpA9ja7ZkChX2/AhX3?=
 =?us-ascii?Q?DLY0L7AatycKnnZZJVtEXD50ZFgs6StFTS2B9hYEOtbpuSeWodJAWrOBgrBF?=
 =?us-ascii?Q?THXjodlqjOsFVn5AOSazUJGd2ahlQeqzGZaFIeMbFECzRnQD5QwukzqrN4gp?=
 =?us-ascii?Q?RirgkaY6X1Df/NWBlb9mlj1sm/x4eLPVzsK3i6Cy3DR5xCaHydf2Wme1gDHv?=
 =?us-ascii?Q?VifQR0KocqtylDDsUILXsDwTRkZP5isV2shi5mDjsunAVO7kFME/VoiqEFux?=
 =?us-ascii?Q?UDDTC01aPbp53Eb5rxkCetMAwJ7og8YpRp/rPV+kdt0yHbNDeHvViw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hc2TnQF9LdEn4Pf5xDkbhArPlR92ps0xeMwA4324ce45CYDyWwGbkOJP6iHV?=
 =?us-ascii?Q?9DUTgU5NcMmOUyps9N6eWEHcBshwCpiFewivWonxxRcqMP8RcdofHYDkaXtT?=
 =?us-ascii?Q?KsLgU2Plsoyoyn7yRhMq8pA1koKrL4rK753lVr+dfhD5UW6EZXZGE4VzOoYy?=
 =?us-ascii?Q?LQE7bQ4312wNFsmTdiJR2mRh8pnqO/7K3i1G03ufaPBe96ZBVyq7V1ce9Vyi?=
 =?us-ascii?Q?YraExOwBF8++1AQz0yegjhotTydqPnVpnwWwCckNCtQjcLHyq85aGExTUkfg?=
 =?us-ascii?Q?ZY77//KPnto1uM/j2DGU8ULxgDVGeVl4Yh4SOW4jSO4wFp1OSFWyHOBAVmuZ?=
 =?us-ascii?Q?3s4VhonEpckypqtyjYsVDx2yHnaMAEGgOaH/MIbNIm8RU6I8yXd9qmTo9BVl?=
 =?us-ascii?Q?l9giFuSDJi95ZtgTRvwY5YDDIxnsV68WVKVhEXnIGVmk4mkZGDPTWVEKsH+R?=
 =?us-ascii?Q?CJniIHcfGGH5jvkO8HkcscAIUFqFK0jCMmvh4Eua5tCq8W00DN6QtNMXIzRp?=
 =?us-ascii?Q?4TvUkAXo8UEdjjko0SpEFKbMNX6Mjj6Jf1AwwPoKPrZQ+pzsfrSYZOoxRiMN?=
 =?us-ascii?Q?YZWlgpUqPNJIPzYSzokr5PoqRVn5AAWoyu78ga8I8oXHk5f7h2CpT7bBBZ7g?=
 =?us-ascii?Q?JJoSUlI+ZKVllaptRTehUFQLRooo5EQQA0CJS1/vlG0UnFCPO9epSmvQja0b?=
 =?us-ascii?Q?IQhYwoTnTkgJfiTBaK6sysjNt0/1KRLGGyTi9+MTCF33VNihzDYAZWJuRM6O?=
 =?us-ascii?Q?KVPe7YTxbrvY6bMmqVApMMNGajTJOW1X9QIIHGh/fpaUEgFkNqeW9j/G9yzc?=
 =?us-ascii?Q?1IGcGMaQSkE5B01aEGfzieLj+KuRyXdgbNdOvIF2Q0MPjuv4WZtP5NnSUKut?=
 =?us-ascii?Q?M25MHzlD8ZpuM/kbTqZXq+l7M7rdAjX44Ajymy5BC75eAX/RI+XhS28x9qXj?=
 =?us-ascii?Q?J23vUlzLZ7dzfjIRH9Mv3QR91V1ORqAWWIoTGN4cygrz0Wa6oTjvrbRFfkEP?=
 =?us-ascii?Q?l8zeWy4rDuMJSUAm0WER6+Fzl3pKkloTHTPExBc4lIvnKRvTPmHBUZR3LZHp?=
 =?us-ascii?Q?UIKsQbS3qUdSMpfkoqgUKEybMMcoFSlc8ja3VUgbFlotlAOOYFoiPswz2/4v?=
 =?us-ascii?Q?EAxSWDK75v6XyMQvKONiNZdzepB4vdkawPm89mCalW1vf0y2r6rSObGi/hMy?=
 =?us-ascii?Q?pPhVYFIyPj3rXVn4QnVi9yu5AZKEeko5TvTW7xVFjg7nELwhzpj15hUTuVVZ?=
 =?us-ascii?Q?Wt1IzkScrZJClsA5t1F1xeZDIKnnfNy9PMMwPiWLJ3OUhem/XYnS6kB5xLgs?=
 =?us-ascii?Q?jEoO49vnNRGwsK9zLpa3HGJQWnEAVqHT2qx26sOWygjoJcGlR1x2GN+SFAM9?=
 =?us-ascii?Q?x1Yer6MbjVB2NonJAcoyLcSbo8N2NaHbOnNeVcrKnbuussFrfFk8nsK3caDO?=
 =?us-ascii?Q?RrxQqePiH/fOH5c6wlVTRmHia8l/LvBLhAUX91pbdEiqBBywmafjWAy40Mzc?=
 =?us-ascii?Q?T6LgE/0X+W5Cby5POtZxswD55NPi/t9DB7oQZ+PhbfkJVTPewbVIZtgHHRpI?=
 =?us-ascii?Q?30gl3ifMFyLdmI1JwWZ2gS2KVHGYdi5UjgEJhB3O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db88f73-8f46-47af-06c9-08ddf452e202
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:57.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWXaTy8KfyKtTuGa2kFhfbChsv1jgEyGJdrrY13248qR787mlbszL9m+KQ5f/pWDJKu6JyOSCquYnSPWXDnb5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

Add support for the GPIO controller found on some QIXIS FPGAs in
Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
using gpio-regmap.

A GPIO controller has a maximum of 8 lines (all found in the same
register). Even within the same controller, the GPIO lines' direction is
fixed, which mean that both input and output lines are found in the same
register. This is why the driver also passed to gpio-regmap the newly
added .fixed_direction_output bitmap to represent the true direction of
the lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Use the newly added .fixed_direction_output bitmap representing
  the fixed direction of the GPIO lines.

 drivers/gpio/Kconfig           |   9 +++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-qixis-fpga.c | 123 +++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 886bef9106da..4ca5890007ff 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1951,6 +1951,15 @@ config GPIO_LATCH
 	  Say yes here to enable a driver for GPIO multiplexers based on latches
 	  connected to other GPIOs.
 
+config GPIO_QIXIS_FPGA
+	tristate "NXP QIXIS FPGA GPIO support"
+	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIOs found in the QIXIS FPGA which is
+	  integrated on some NXP Layerscape boards such as LX2160ARDB and
+	  LS1046AQDS.
+
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver (DEPRECATED)"
 	select IRQ_SIM
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..373b1f169558 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -144,6 +144,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
+obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
new file mode 100644
index 000000000000..23219a634f73
--- /dev/null
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Layerscape GPIO QIXIS FPGA driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+enum qixis_cpld_gpio_type {
+	LX2160ARDB_GPIO_SFP = 0,
+	LS1046AQDS_GPIO_STAT_PRES2,
+};
+
+struct qixis_cpld_gpio_config {
+	enum qixis_cpld_gpio_type type;
+	u64 output_lines;
+};
+
+static struct qixis_cpld_gpio_config lx2160ardb_sfp_cfg = {
+	.type = LX2160ARDB_GPIO_SFP,
+	.output_lines = BIT(0),
+};
+
+static struct qixis_cpld_gpio_config ls1046aqds_stat_pres2_cfg = {
+	.type = LS1046AQDS_GPIO_STAT_PRES2,
+	.output_lines = 0x0,
+};
+
+static const struct regmap_config regmap_config_8r_8v = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int qixis_cpld_gpio_probe(struct platform_device *pdev)
+{
+	const struct qixis_cpld_gpio_config *cfg;
+	struct gpio_regmap_config config = {0};
+	struct regmap *regmap;
+	void __iomem *reg;
+	u32 base;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	cfg = device_get_match_data(&pdev->dev);
+	if (!cfg)
+		return -ENODEV;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &base);
+	if (ret)
+		return ret;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		/* In case there is no regmap configured by the parent device,
+		 * create our own.
+		 */
+		reg = devm_platform_ioremap_resource(pdev, 0);
+		if (!reg)
+			return -ENODEV;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
+		if (!regmap)
+			return -ENODEV;
+
+		/* In this case, the offset of our register is 0 inside the
+		 * regmap area that we just created.
+		 */
+		base = 0;
+	}
+
+	config.drvdata = (void *)cfg;
+	config.regmap = regmap;
+	config.parent = &pdev->dev;
+	config.ngpio_per_reg = 8;
+	config.ngpio = 8;
+	config.fixed_direction_output = bitmap_alloc(8, GFP_KERNEL);
+	if (!config.fixed_direction_output)
+		return -ENOMEM;
+	bitmap_from_u64(config.fixed_direction_output, cfg->output_lines);
+
+	switch (cfg->type) {
+	case LX2160ARDB_GPIO_SFP:
+	case LS1046AQDS_GPIO_STAT_PRES2:
+		config.reg_dat_base = GPIO_REGMAP_ADDR(base);
+		config.reg_set_base = GPIO_REGMAP_ADDR(base);
+		break;
+	}
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id qixis_cpld_gpio_of_match[] = {
+	{
+		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp",
+		.data = &lx2160ardb_sfp_cfg,
+	},
+	{
+		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
+		.data = &ls1046aqds_stat_pres2_cfg,
+	},
+
+	{}
+};
+MODULE_DEVICE_TABLE(of, qixis_cpld_gpio_of_match);
+
+static struct platform_driver qixis_cpld_gpio_driver = {
+	.probe = qixis_cpld_gpio_probe,
+	.driver = {
+		.name = "gpio-qixis-cpld",
+		.of_match_table = qixis_cpld_gpio_of_match,
+	},
+};
+module_platform_driver(qixis_cpld_gpio_driver);
-- 
2.25.1


