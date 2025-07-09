Return-Path: <linux-gpio+bounces-22986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A2AFE7B3
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FBDB169810
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE132D59EA;
	Wed,  9 Jul 2025 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e9xSCxLr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524392D4B58;
	Wed,  9 Jul 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060456; cv=fail; b=C2YINWqzyVrMnjDemJF0gH4A6IdqJjVhb9u9NdU7hrLow3sUJwRvkMUM9+C7q2Lus/aGwdY0CS2TDDXMD8kpApTltXGCNat56FpK0i4UjUwjAjHQvApBdputJDoqpYC1D1Bzs6+UMJZpnXr/F1MXZP27qwyZx+XJ6MeC00NS7gU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060456; c=relaxed/simple;
	bh=lQHG0bflHLj7qJtOpusrkFGSo06zKtDZtCFra2oW5ms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MkRFFRkBUYytBkXRBH41hDPaYkTWpqEOSMFCFmcihnJbV++gU67t7QhxiAUyP+MH4spIhr3iT5EOStQj4cchgymzEA6IsD7nRatEP8xGuS1VmJ4XnV3/vL95RD6kInCC4DxCqJpFEjsKVe/eN7iWNaRVgJDunMKf4bw7oCzvir0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e9xSCxLr; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIrf0GX6zIqqBE3DZTWlLI8zRh1e63Z810zn82bNSYd7IQAnDsfTXQ2PBJV2WHw0CYetFB/ZMnvrxNuX+RRsURgp0eMpVOZrB4mS+rM7Fx4Ux8SSujMtswZljxD7QRin1d4kDpQxkGmEH0c7Q0bnStkbk3MwqpT8Mq9EJHs96uI9ihZtlYfp3ZiECTdtvELCXB1rW+vLOugKeUp8yr+RAOi7R95kwtSNqODsDuVxTuyJj8ogXP7Tg4PJaNPKln33rdWKBs9uXmYZswvJ5f21yAxqcjZ+ganlX43WOge1mLEm88Up5wnxUvcW9dGbY0aoieFYouEVgeiGz6G/eOtYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+LQMK6kmkJgItKPXd22xC/iT18OywJks6m9PP8liIY=;
 b=j84YpIzYaH/sw4Z3Dd7KLzUkk8NW2aNKpGQnQY4JJcxI1iwocS2mFZzv4Q7dAsCQl15lPjXX/lFchmlBzg00V9MSFgjf31icqTGOAi6BZOXRPBpP/Kcnj+QlaBJ935Cp4J7Aq2se/92PRPifYUUvGPvgrZzw4AXzqh0VEFFvh4T/a1uAy3CJSHEzHKZuBSKbnPeNLFsPwQXaR6fnYSp11SD8tYzanHL8tX+BRUEycdjTik9q9MHmEjOTALBrI5Nin+xtejm5lbevaEbniwBjvsQ5x+Hx+mdYpuFtY9hDD42S9FsAymEPa5YLzbQMKOc1pXFzjR0ntQM5fYnhPK7RWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+LQMK6kmkJgItKPXd22xC/iT18OywJks6m9PP8liIY=;
 b=e9xSCxLrc94NK6KzBMvQBm1C1uuYbtCIo5jsCYXJpNb5s3RfEGoqVa/xqy6WY/IbfbRAZTTGcZ9IA1IAyrR0OTPdIr+iFSfv2SstlGTjtRAGmuUFdBRZJBxKZ0rR2pr3hp938KtmxVyrL62FZ53UwSxMrCr1ykiGlF3g1Lw6nkxXYD6tgqoufpeS+UFzo0Rnr7wd9MoO7RAhJHpyRidV+XkPq8+Ut7NU8oYUYmgH4Kl+NnibPZbejRw2K5DbG6Om5x2bidZ6CRUbv4cy8hOuwU+S9OpMDlCsgGHmI3EfcoPj5O/8mcMWe/sKsHXMKnksAVBwMPytyD94xfIRDFdtiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:31 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:31 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Date: Wed,  9 Jul 2025 14:26:53 +0300
Message-Id: <20250709112658.1987608-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: e770b428-7745-4781-3592-08ddbedb97b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1jHr3f9ZCD6D9O67IYqzLuwcAjzqz32Q6QZYgabXc/1folIB0tMDng3fTP5?=
 =?us-ascii?Q?waoUK/pouAF7Nk+KqHXMRTX1AkQVATNrkZ4FRQwL4ltFR/mKx+ROlUGro1t/?=
 =?us-ascii?Q?ATNAGH2KO5Y2qzvkXwEEADOAhgXEr0LGnTqVzqoPzmvVb/zG31qEiD8V/Yx+?=
 =?us-ascii?Q?vxo95HnO+MTURAvIZoBDEZqqTbiExVc9mBybFdbDDyhDJ9k8yTjsVu3vLrEH?=
 =?us-ascii?Q?17WKY4QAekrT6AlPEqp+UmO60cHCRyC0mvGLJ60x5Ks9Gb05nv64rb3iRGBG?=
 =?us-ascii?Q?si6iA3NHSzz6VcEWHuejeNlEKK13oFafIFWEyIOzMAAfAeKcGUns7/bmSJXf?=
 =?us-ascii?Q?ohDDj28doxQtkElL1Mb+nR8sebk+l08my2vePelQAWcAuzPSMCA5bsh2pzZk?=
 =?us-ascii?Q?rZojgiXnqVrObNBNRtisGR+nzqfc9V4tVUUsgU0KdkCpImyX3cb/57KrGEKw?=
 =?us-ascii?Q?EfO2yNglc1lqi03Zz3y1YZhNz5S6pJyihPTbp4Kxte+vu2KOyzDg2fAkfDmp?=
 =?us-ascii?Q?XcagJITIO4ztEwnvizImbOsHJ4Jb7PrZVU7NIWP+azWEL8JCmSWoI/h+ziyQ?=
 =?us-ascii?Q?6Tft/wEP773so1SJmHFYTujN5MhGvGKnWVQvofpJOYdEcjaIAnXESB4qMxrR?=
 =?us-ascii?Q?wvOGmMeLYhl0FsdtewcqOKPEhMpbmj8+Zmln27fNy89RXCdidP/rWwaeqeAS?=
 =?us-ascii?Q?FhyJL+FHnnjDOIfiMxkvw/1Bi2ops2DikaAmDV9Nl7Pn+08ys/SZV/RJrWaY?=
 =?us-ascii?Q?RkiiCTx44OOWd3jcfg0ITVRkjarcAgOS35GErYOG4oYKucuH8uCwWMmbyNql?=
 =?us-ascii?Q?DpWTT28yunv87Kkn8mUjtJj1wAMQP4+HpC68n4Lx5RgvMBCw0uqvjr48xWzX?=
 =?us-ascii?Q?UX1UUXTi9KoAubojLsteqIjpUaO/l8gOvV5ofxtXB+j60dZz9L1bl9sUA+9Q?=
 =?us-ascii?Q?05qiTcXvc37tpkrXYSLFH6N/jrfI/lrPGnfKc/PTvG1IDmHB3xEEPgrZCXoT?=
 =?us-ascii?Q?LXc0MbH9zuzBF+AViXz0nOlNjIEL19qbQpjbr4UbITYUAJv7QUJ8BdGz0fC/?=
 =?us-ascii?Q?LzTQr7IFmrl3Jjfy6HoYPtCm+MWpiMYMgTOG98GnKxuQvJj8EzHiU6vxFgT4?=
 =?us-ascii?Q?2DMJl46+fw7rvqnpIfDRtc2Bx0GsLKRwhX164m6QxqgEi25rUTHDernQC2XB?=
 =?us-ascii?Q?l61gJvHrqZtiIgIsGernin2+P02MK3DApM7t1z0q17CDLanfde66sC22jeDj?=
 =?us-ascii?Q?+BiUFqbr/p/EmbEI1rafdgbCKxb2q5biKjdWIdeFnVikcBkYuut1cXWMrcI7?=
 =?us-ascii?Q?erk/zZsxWWeMmcB7iGW6777oVeVgv2Pnb7D+FnalAZEmvJABlopgM57ImLuY?=
 =?us-ascii?Q?9kx0lTaGYyIjuEpze5UnZfq0QL1PYZf5w40eN8kVfFKT0hQH8TWJ4gvdR8na?=
 =?us-ascii?Q?pYhn8q7Tjxk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zj7XnvYd6vArR46SOa2U6XdYeXnpiAXOgUGwbYz1LGtef0hrDpjF3AwWYZSr?=
 =?us-ascii?Q?QxGyDoCy5EwSAURxjI+G18kX9gn2Ly9SocP9PWFD8olbcAzCRSHfz9cQKUqH?=
 =?us-ascii?Q?j0Tx/JnTsINeh5NsK/0DtH7NeodiSEoJqG0n3Q+OV0J/3ojPDgoUhcdSuRLs?=
 =?us-ascii?Q?3Q3tzlze7H21l/BPGFX833ksPUJtpX3mfBqKKm98uigKeh3UIWISfZUAzot1?=
 =?us-ascii?Q?TtHFU21P0YBLPWXzQkH8uWijGVvk1YEeez0lG+0F8nWvIi6rvoRlMxLoMTkA?=
 =?us-ascii?Q?7bhVSDQXPxU9xf90Os/h9hySC+3N9vtWXou1N+P7PtiJ9St1p+LWK/Gmpybf?=
 =?us-ascii?Q?M9K2fibt4urofPWgevhlfo0PjlG9oPqAP0tZnMCB2sL97k5KbUTs4L3Vz0Ig?=
 =?us-ascii?Q?wya7f1vfsruyiqtBW9FOoUPbjxTu3A+DZUXsL4F6y2t/4iv3oM4YnfH0Bmc7?=
 =?us-ascii?Q?OdWAL6rdJrwwsg1pw4jwreTvxqZYH3/2FMqiPi7bqTyvpDDFunfOB+/nfdS+?=
 =?us-ascii?Q?6wB21arwVqq+OP9VLZM6Yub2Mnk48UWFz8tXBzjZDlysph4g0NwMLHagb3oA?=
 =?us-ascii?Q?lAxlv/gc394Q6JdZH3Z7RTUOcJ4l2Y/LxndQ0FanaYRL9uAuOIRhLahCQV4K?=
 =?us-ascii?Q?khJHBFcWoGAISHmxLiwLdMleGtv74G2lF0Xv6KCnVVmK/6ejkCqCzsC2ZaUX?=
 =?us-ascii?Q?ZmXjaBS/O5iV7NMa4SalDXeyw28RdrnVHhsGcVlyVdzVdw02+sy0AfDGfP3e?=
 =?us-ascii?Q?A4LMQc5Xi0oIo/a09eG0PGH96WRJRb/9XDm7ne7qHQa8RzFPzoUrUoBqbm+w?=
 =?us-ascii?Q?zc42Hb4YSqpHNnUDacnZyp9XUuxLsTETNiIWIjw4Db9Zc4EvjHyX+lRcKcgX?=
 =?us-ascii?Q?3jsObsBwZ0KFZ216kp2S2Bb4TIvqyaxwv1OiLQfOkUgsGJfgutvyrljspVZf?=
 =?us-ascii?Q?qxZm8BW3kUHjSGtGKIYmqDpevp9QhWDbiICnAitEwJyfJNA2r1IY9erj3z0r?=
 =?us-ascii?Q?w0D5bAKjITzvKgDPnOsYA0K2bI2fv25UZbo6mbaW5zeHpt3+ePLw7zrwPqOU?=
 =?us-ascii?Q?yJqTbJ6+NqFm/lzGEaiozEgWVIimXvsmv1YO0iKgN37bbnWhS0C836OBjs8q?=
 =?us-ascii?Q?td1aOB5aMRFpG156Zb/NoJfO7ugu5DuGN2SgHZI0HMQOIPA9QzT8T2/n9HI8?=
 =?us-ascii?Q?N2x2yxd/+hm6DPPPgcBsYFz8w3xHSabUmvb8hBe07MA134kKg39VDCZbr1tz?=
 =?us-ascii?Q?LdQtA0+ryW+f6LqraaX6ySXLgckhbE3rhzZmGlY4U00/hsHfHcVDXHyFJO/b?=
 =?us-ascii?Q?QmLPi83PfZiVaxZdPkkUBDRY1r8bXb8vDg+YwLutTTnlrgRCCQc1xzM2eVZI?=
 =?us-ascii?Q?zHBdXJyd3G6nRugjj1cGHDZKDwy4hsXAIUsWfsRXW3m7MU1yjhTAYeVDM8km?=
 =?us-ascii?Q?trUCDTlBf6dx+TUcvtA3t98mh+HC6squxlYZWQoTq1W1xR4uaIAX0oVCMyKm?=
 =?us-ascii?Q?mMMaHzD0f/QK4FHxY/EfaE8OjUb5v5fXX+QWsOfyk/WqKwtIBQu0yxVE6AJV?=
 =?us-ascii?Q?PzOfswZ5xgBVp7QKXqhRqnubbdiuaxwEbN3U7yGF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e770b428-7745-4781-3592-08ddbedb97b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:31.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ6q7KfaA0P3iDzwkt2EpU1pAWqyiWgwrYdK8TgN9Y8afCuDUZW2pCyVEHpq4FUjTCx2qrZ1pJfLFhp73fzMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

There are GPIO controllers such as the one present in the LX2160ARDB
QIXIS CPLD which are single register fixed-direction. This cannot be
modeled using the gpio-regmap as-is since there is no way to
present the true direction of a GPIO line.

In order to make this use case possible, add a new callback to the
gpio_config structure - .get_direction() - which can be used by user
drivers to provide the fixed direction per GPIO line.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/gpio/gpio-regmap.c  | 17 ++++++++++++++++-
 include/linux/gpio/regmap.h |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 87c4225784cf..dac2acb26655 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -32,6 +32,8 @@ struct gpio_regmap {
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
 
+	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
+
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
@@ -129,6 +131,9 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (gpio->get_direction)
+		return gpio->get_direction(gpio, offset);
+
 	if (gpio->reg_dat_base && !gpio->reg_set_base)
 		return GPIO_LINE_DIRECTION_IN;
 	if (gpio->reg_set_base && !gpio->reg_dat_base)
@@ -163,7 +168,16 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 {
 	struct gpio_regmap *gpio = gpiochip_get_data(chip);
 	unsigned int base, val, reg, mask;
-	int invert, ret;
+	int invert, ret, dir;
+
+	if (gpio->get_direction) {
+		dir = gpio->get_direction(gpio, offset);
+		if (dir == GPIO_LINE_DIRECTION_IN && output)
+			return -EOPNOTSUPP;
+		if (dir == GPIO_LINE_DIRECTION_OUT && !output)
+			return -EOPNOTSUPP;
+		return 0;
+	}
 
 	if (gpio->reg_dir_out_base) {
 		base = gpio_regmap_addr(gpio->reg_dir_out_base);
@@ -247,6 +261,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->reg_clr_base = config->reg_clr_base;
 	gpio->reg_dir_in_base = config->reg_dir_in_base;
 	gpio->reg_dir_out_base = config->reg_dir_out_base;
+	gpio->get_direction = config->get_direction;
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index c722c67668c6..99fd973e61fa 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -37,6 +37,8 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @get_direction:	(Optional) Callback to the user driver to return the
+ *			fixed direction of the GPIO line
  * @drvdata:		(Optional) Pointer to driver specific data which is
  *			not used by gpio-remap but is provided "as is" to the
  *			driver callback(s).
@@ -81,6 +83,7 @@ struct gpio_regmap_config {
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
+	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
 
 	void *drvdata;
 };
-- 
2.25.1


