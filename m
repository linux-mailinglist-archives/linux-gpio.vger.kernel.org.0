Return-Path: <linux-gpio+bounces-26161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0597B57AEB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FA8A7A865E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B8F30EF65;
	Mon, 15 Sep 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D0iyGGQK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836D30DECD;
	Mon, 15 Sep 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939103; cv=fail; b=cfYMWFDJWsFBJ0P9QylOIWOA1U/i2Dyige01JkbHBNUZ/7KSMJ/7b/6XtI8rovAAHvfZX6ybL7bHU9SB3U8/MV9Pq+fOA16wzVdKjiNLrtoSEv7wSnlKgVrWNpc4qjZRh3ijes4Xmdy27AURdbIN7a7olWeDSujzI/52Bzp4dzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939103; c=relaxed/simple;
	bh=U3/JH1pWLm8FJHFgTSOLzowMxWGhY1td04AhBiJ2lrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AzU1xPe15rsbyxBPK0qEWIABavt/YekdoBI0960TC4jLHSY7aEpDqCkd3QPw2YfcsIWnvnlEzBqajo+ZT8d9O9ptR6Rh/hqhGD9icaqR2mztA7H4x/lpWYxFzUvUexPZOEBpvWlRQ2PBa1A531WZZ4lmGl+e3Y1CccTHJrpuBVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D0iyGGQK; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmETekrKf1ZgwhjW/5aUznj5wmDKeIVIXaNf6/lgtzb9n2D22WSdj2IejwEmgn+tYrcNga2IqjrVZyKjJF0p4l+NsHXIwLwlk/ear16DOw/r5t1j3iCwEVq+EVsUBEf7Al3TyZdPGj/Rec1k2D6MM0gxIZKSm4zO0IpK6WQLmnPRsCdco5bJLIjeWAMwri6ATSXoTaEbQ1QN+rXfz2ztfvq+rDmmp/nOhtEvNcXPa7zLYE857WCbDXLobiNGwRb6tZQDStM9Y6ysKPHzhdDJV700fxUDXtlwr+RSwviC120gDfN4TUYVAzABUig+01gEnXixew+4szOwUKd8eIWALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A5DumHQQXLOFYbwdAxWZoNT9n7u2Mrb5Uv4okkhL1g=;
 b=NF12tvHow6fK4bcUc6eJIJWutQtda8rK2Y6cF6Nm7KcxJ/1Kp94s+nXJWOMEp8k1/NLL8/eSCb2oG8ZJ1dnl5i6c7FmRBOKsNNcaYbhbAuLRDsLf09toPTKIZNs30trcBxlCoI4KonJrRJh21CQnfI+xAOY81DIZv6s6XKgxlGClEl9xyaKkK8vA2cDMVd3lwIcszHVpHioQQPouZbPai3HXhjhcjXeXp6C8YfP0ssEvxr7kIB1GqyAkLZjWKLyMcpPcytO/PllzxGPQeoLWcIAMW6V0RnxThTGVeYGS7Swvqc7G6u6BpLfqfgqk54CKidNUOhmlmSZGoPSnUoipSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A5DumHQQXLOFYbwdAxWZoNT9n7u2Mrb5Uv4okkhL1g=;
 b=D0iyGGQK0SG2MeR98dReag3VG5XTVAuu11Yb6p3iw+ywwQdsUG3OAFhqIhj5TjX6Qp8JeLhUSVIgWPPeqaUUJ8lz3A1+0YtlPIs/XkIlfUPwCz4/PvgXlupaJc/XRZdnURSmfQfuARxv4KNtooulfHtiwypA2+G/3cFVzAm494TQvcT9TOpP5HZTn7C5PrZPIlH2VTcGYEo5TPlGAjPlRb57Zqi9LxaHIOS+U/t2xpPuescSspkun/7SBAs1nD/h78tJ/Kq/H76hrCp3FEJeYmMX4jxuqVBr/ZsiXHSbm8y8akyrTc6z+xJOZSzZ3XvFZ1Eg38OFLkr5a/zgiFXMlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:24:56 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:56 +0000
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
Subject: [PATCH v2 4/9] gpio: regmap: add the .fixed_direction_output configuration parameter
Date: Mon, 15 Sep 2025 15:23:49 +0300
Message-Id: <20250915122354.217720-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0007.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::17) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fdd24a-aaed-45f4-b07a-08ddf452e128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Le0Vv6K5+t9fQf1jTN/h4DppvCVeF1MNAIrw+/Y+SdhbWKVDfQaK4iqoJ0lA?=
 =?us-ascii?Q?Lu3xvJonxDSv0DKyoqejKr8YlMsMHpH+ofnPkwNoqWkzsPhiQLjm0Z4AwIWC?=
 =?us-ascii?Q?X4nQcRMMpF5GLf6Ls1Xr9E9G0GaBJi74oSuPnwMslAgupMXv9DfgFZcHcpmw?=
 =?us-ascii?Q?xdIk4HZzNcw8awJoGFBj14oeob80+pO90feCN5+2i9hhW1gpGgAyzNAlVf0S?=
 =?us-ascii?Q?EQEopNzFHRoWvx0jz/ubVYGs4zxv0zqLdUEowUmY/gSPJ40kNjJpaUDuoZUY?=
 =?us-ascii?Q?9QSlPBclHAEfZak7WnH6KuDvai4UzwKRmIrTuMzLN1IkeqVtWv9WIZ3ZErKv?=
 =?us-ascii?Q?hSsU6q0dPLPOIVdpbW7LWD8/CltLbpVo/XJ6QCRfP65BRAkBMpLyI/KOWeiV?=
 =?us-ascii?Q?h3kqHqc+QU1jTgHqTipurRrLoYq09vHeBkeI8jUGkrH+RNMqKrnq4jSPr3Wn?=
 =?us-ascii?Q?/s7JH7MHiBkezJDB3rbnJPKrui83NNQ6o77RCC0MP4UVAAktADa/yuyzpOR6?=
 =?us-ascii?Q?fdbV3YsFNVXaRJ8m1J/JKaTfh5TNpV41J7J0n0P9g/SBjTqnj34H7sJ2d10U?=
 =?us-ascii?Q?1h0hHyVxknBnorfdve1G3DNlMZJl8LHO551kQo7S7jHc2M2lTTP6W/c4tTWn?=
 =?us-ascii?Q?z8XDykP9UgXTWPVQAK42ED0jaE26WUOboLQ/E43cBMkNRI6+0uG76tHLGC32?=
 =?us-ascii?Q?q32jNmGf87+tG0CvjIMkwn8JKDPOwzTwr581og+KWZeVYqjtO3/iBVXh3F80?=
 =?us-ascii?Q?HoEudmcqu7JOxqsMcs/9xX4kxipyPNllVH2+JaFV5R2bWUw0ziDRhFcW7Erq?=
 =?us-ascii?Q?nknDNWA55xB39cCDFIJuBK4wDSGjtlwrYFuwhRW94FnWqG+r2jO42z+UiZAv?=
 =?us-ascii?Q?OavqQ+R7bswF36/0RSM5X4S8hUGW3Dw7pWMz7l8wsbtz5FsRT9dMYEUgGJQk?=
 =?us-ascii?Q?BsQV2/1PiguJc6klp84GrVx2ngc4BB7S95JoTVEvcYSDr4xqXOFep+gtx3py?=
 =?us-ascii?Q?J4lzQ6ryjTCr2D3zLM3xF2kZcRotkh2tKV1qbZyxN9M3/4LDJqHy1BmoeW1X?=
 =?us-ascii?Q?ceQt7dTkDvA8ytAoNYblsLRJr3HN4/iJ2OugSfeHKPFfgwGYDa/Ww+nv+zqz?=
 =?us-ascii?Q?u8SEN+0OD+eHz2FBpwAAfu203KQNE+Xj2bB9KKiuVRKFWI3hxQZlwOT18CPz?=
 =?us-ascii?Q?UP+rxkaaf3+usSLpk06amovaQ9vpZp2R6eW1xnspQw/4P4MA+fEODK28yP5Y?=
 =?us-ascii?Q?yv2cCZ4MjKw0qqB3j6nfKdgswQNzNHW4ohWlugzXSfFv7QydYFAL8uSwo2fN?=
 =?us-ascii?Q?y3oA5/5gsa+cYTcvZjmQZba/tY3M/DN8ldkc91qUh2LEVj1jKlpHEacF2S7H?=
 =?us-ascii?Q?2wJziuzcBzLttl0wvhpdfZQ+QxZ5e6LmCuRmXD3Cg41erimCHN2KnZC74T12?=
 =?us-ascii?Q?tqKdP2R3uNklpjLRO7MZPKEiV4lbS+vQ3IbrTqKthzFACEpUoUw3og=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gVtrghQw9rw0lh146mIUpGIsnZqiiEz23bc3/D81qBBvCddyk3BKJmhbkmdn?=
 =?us-ascii?Q?/qkgDOQD7WGPH7960hqYKT/0DUEDvH+FajXO9meS253kqRBYJUeknmfeDJG8?=
 =?us-ascii?Q?sPRc2SuiXra4jYBAjoe2jiTI/OhGSzzB4htQTfDBwhwfY0HYvpxgth+oqpfP?=
 =?us-ascii?Q?difN88+LDwDqFND2R6QnQRkXC1jaeES1ytC8g1Sii1CBjm+5aMfvC5YhdczD?=
 =?us-ascii?Q?AHM8WKlh5JUFvtYeGtgAWInyMYdFzoXVvHwGYT/UAs39CkKVy1c4AcMnM8G4?=
 =?us-ascii?Q?m3Xx+ZGLYYgBWB+0+6zgHbHrPg3O/fDSYsYqvUpncbDXKu5vQX3k5Qvi0KvD?=
 =?us-ascii?Q?QsYir9Dr14PiWql9a/4yaJ8Ksk9psp67bAGJ5xsHyhCY29NAvincSXEdcDcY?=
 =?us-ascii?Q?Ax9yGdx6T0Vgi1AVNv6+VLX/cV7HFPO0O0ygIlqOo+5lPPTc3WfYB0EC5qzW?=
 =?us-ascii?Q?HKRDu4jwEFVWMucKZ/PtQcA/DK3YQmytNpUCGdg7qg72QPKACKSpSBxGVuM2?=
 =?us-ascii?Q?DT6V502AgZfxN6Pw1uPYrdqELkAG+0MILGCsEI2yf9YLF+UDy8DU7pUV7D0P?=
 =?us-ascii?Q?q7ypjKZdrwpg4BLsbUE6CIbxoiwtLdjW1R7McZ023qcZrhaDqwnrd/r4DpwG?=
 =?us-ascii?Q?/SVw271aI3UPLEdwmbdSXS644qW5zmEUpEPDCsk2PQubbzORGbXIK1Xr2fB4?=
 =?us-ascii?Q?4WYlSF+mWCYEoJny3aIctCeidj7HFXulNo3hOYAhKJLpclq+AOW+1kuCBFkG?=
 =?us-ascii?Q?p9GMUASTO5KkSofpfANBthOvx0+khrjcjjz97d5LkKQPPCq4Ag9wFkhE69do?=
 =?us-ascii?Q?lFF6rvCY2rd5+QospVaEpX+dk+RY1a0XS5lhiUKEDmr5mTI+1bHI4LbKUOhk?=
 =?us-ascii?Q?9DZTgqdJqjdyzy8I3hiF7Pz9Y7+hXK6bi/U+QfZHWLEH1b1NQlyS4ebcBDMa?=
 =?us-ascii?Q?s4i+eyefeManqLRDkfh0oOLU4bWuRfB35lkWaeZCscnOOf5YW+ZHUjRjSdO5?=
 =?us-ascii?Q?ZVMU4riRHndOfMZNZV6AEu9kYqEwKHOP6nQdjrfoZFXX1/ByEE956YN+LqBp?=
 =?us-ascii?Q?B8YkDEgYLvDHdAfEvQBgXh3iC4gmsn1PMjzYarhevfqd8fyaxWYlWVaN2AEN?=
 =?us-ascii?Q?Dvi5jvM8+HRGZ9mUxGu6MdCQp/137sRG+KFx88s9Cpry2j5DDiRI884jwaQA?=
 =?us-ascii?Q?nSG4iUZc8dJSmKgd/VQEGZZNqUvJ37yibxslslp4YpdKRgyyPGVFPZV/k7sh?=
 =?us-ascii?Q?cRFOCWfI6TW3CApnKOm9PRoOHacrph9zSjuoYv8pJ0PLmbfB/nlTzAFeuKJE?=
 =?us-ascii?Q?LttYW6Nw+22+u0cxFB/QLaZjThg51kilM+HOIA1xVEKMjIo/a3WBqvyT30ke?=
 =?us-ascii?Q?3LpSc5FZHqOuCGzSdmHLkfwECxLHqkKRUdolwAWIswUqy6OowurHK0bo++5K?=
 =?us-ascii?Q?amaERkaV6cbiSyXPFjcURU3OaspYa2fuvH3r0TXljciGxm5bdGzqkoaxnVXV?=
 =?us-ascii?Q?aEAxgZuavsR7Uhdq2OIKfD7QTTgvsI+H5pkf0XDQjpcY3gf4ugqxsAhfMZnp?=
 =?us-ascii?Q?TTgHs/7Q2hIDizoWxjxthrkeD3oe51P2y/985Lrh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fdd24a-aaed-45f4-b07a-08ddf452e128
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:55.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6wBx2iEKepcTM1RNlLe+mMaiPqBKiPSLblneOFz+VdMOp5K6HHySOnxFyvz5T5TRrlyiWsENip+hq0fjgTTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

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

 drivers/gpio/gpio-regmap.c  | 12 ++++++++++++
 include/linux/gpio/regmap.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index e8a32dfebdcb..2489768686d3 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_output;
 
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
@@ -129,6 +130,16 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	if (offset >= chip->ngpio)
+		return -EINVAL;
+
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
@@ -247,6 +258,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->reg_clr_base = config->reg_clr_base;
 	gpio->reg_dir_in_base = config->reg_dir_in_base;
 	gpio->reg_dir_out_base = config->reg_dir_out_base;
+	gpio->fixed_direction_output = config->fixed_direction_output;
 
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index c722c67668c6..34c143aca42d 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -78,6 +78,8 @@ struct gpio_regmap_config {
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
 
+	unsigned long *fixed_direction_output;
+
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
-- 
2.25.1


