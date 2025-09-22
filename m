Return-Path: <linux-gpio+bounces-26468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30088B91AD3
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E0457A9CC4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796BF258CF9;
	Mon, 22 Sep 2025 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fTCErwpM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D525394A;
	Mon, 22 Sep 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551098; cv=fail; b=PIZhHiekUl0b9OfBRkSjmD2hayTvFUMuBnVy3+0Q5Ftkdw1V/M9VaAyka50BE2SJDolwp6z/o6akfS11JoAqEoGkRbBvJSxqiWB9vKRi+lvh7Ff9GZqxGen2gX1oEX9GkjK1LbJnlnpQDPNZ33mS2EOePuUmoxvb4grKpwZz1iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551098; c=relaxed/simple;
	bh=AWnDg3cbVmuVl/6ovOEXbOaC8frPjKlgFuRi2Zq2P7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=druLQIsAcuo/CgeijJUrqgVzVTSzlecWeNa6qI8te+mf4NDuVKKH1fycF2r3jadI2l1R0ibeJGmCnVuuRYZLsqeoM9CZCRUgnnIgzflcOotDJtveDYoEqA5ma6ck7VL5q8akWKaj5mXEr8D/CxFeiv6qzAbFStTL8pNQ9asuMcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fTCErwpM; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRzH/s32HWw6uWL5Y4wt0kCKCThbcdJbbZ7BQ7OIhhnPF/djjfGlpcuctYAF7CnjRBk4DO8Gqfi04EsAEsz1moTe2N5BgGhYCBfo1HnjVaOKU7m0OWxx4s0dknNjr4+A8jOO9iiRxC+spNZEdTZaMYQXk48ooDpRp1mXFkXz4R4k6UjG5pVh8lQ6+tQU7iHtsmFWaVEQXK8WQlU3KjuWNRD1jLeXpsCGloSaHFqmhwKEaXqRic8qEU8K3Og/YHr5XybqPnfrIyqhAQgjLyIA7npOX9byG9KUzMbY8bJoBWJXnO3QA5koirXKqeS4iKGZHcihaCujXLHiB76bJdb7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTVoLprTjDsarbV8/b6uDIBAn8+uxb00bDDoAZMp+Cs=;
 b=Bq6cqWgwSlOf8gnWDHe/YtYL0fwJgAUiJC9M9O+Hx7mvuInWWqk28wiNdM5dLcumIOcUZ0/auE7ljEokcA/wEBzgsvp1XL4HHV8qGzgvwVtloFVA8MH/+P5//ZozA28NVqKiz2KYV8J1h9MgJtNjDT1K8zPZdg55aR9JSa2Gu3PMpgMKGl/2PblXTzezavEjZ2TcYDEWTKs+qbry5lOFLKVa8wZllEjeb5VHbHgjlrRqnrI8pHnBaUtsIysoZ+tM+u7PkuSSsQokInr2z7k7nphdd72XvrhIrlhPPkQJ3LhL4Jjisn9DvzxMgAjXayduuSV9AA8fQwR45kbUZv6i4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTVoLprTjDsarbV8/b6uDIBAn8+uxb00bDDoAZMp+Cs=;
 b=fTCErwpME63dGOpDh31GMWLbotDVR4U68lffp/VAIU28AILoG3F6qWQrmq70MlZAypofRTpKKyVVSo8Z5KwJvPZSBDJD9aCrPoL5n2rwSfbcnR1tR/gfPz8hFefGBg7QQDW00PeEMZH6zushhBAsCA1jv0am+0LZKT50LVqQrBJF/jCuEYP8CquNTozzYaVeOXJGtWH4HW0vx6FiVG4QWzzcBefgpNZfT3JQxtpKpPhTVdvERu7onf4BlMLVlYgqYMEbDEkuYg7LMro2WsB2XU8RIRqFYSzfUXj1nPG5k//sAu2I9BtRlZXYCi1iZbbNmVjEgjUbaz31NvffT+q2mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:52 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:52 +0000
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
Subject: [PATCH v5 07/12] gpio: regmap: add the .fixed_direction_output configuration parameter
Date: Mon, 22 Sep 2025 17:24:22 +0300
Message-Id: <20250922142427.3310221-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdfd626-8286-4395-99d4-08ddf9e3cb2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xYjt3WYzUa4g6j6X/7ZOjWnm2ek+AamOv6mMyyiAMh7MC/l4dbWpKy8ayboS?=
 =?us-ascii?Q?MC2weDL6R/HP2LFQvOQTpmHxiDNWyExisyUpOZ0t4+bPlJ/chbZ/7lUq+B1v?=
 =?us-ascii?Q?6NblfGiyrLRiQwXwvWx9QlIioTcbvzVx7gOvAIoQ0hLYOTe6B8qH4KdMAHzk?=
 =?us-ascii?Q?HuaehEDcnCC01OFEgFKaCDPYuAFsW85cO+CMvxjCcaLIT6aPVL2TYZBgOqTW?=
 =?us-ascii?Q?SybWymzvhy9oDF6y7DTZ0CKqzo9i3WplwLBjtdt11kwrrXPZjQ7qw3E5n/s8?=
 =?us-ascii?Q?tgPz8CsMdTElxiVV2oCM88wYfpzvQM+LTVa6kP/Al2wUGro5fW/ZCNwYSFtW?=
 =?us-ascii?Q?PUCW++cpUO350dPtNl/+HxzYLSZ3A9dvR3pxOo/7aD9Ghg1j3CnGRMNi1uiA?=
 =?us-ascii?Q?e93D+7mNxxGdtgBpKxUYDX4S0JWS32P+h0GF3Ie4wBbPeRa3HnjR7wdoZq1z?=
 =?us-ascii?Q?fRN4Oc3zf2cjUxHwnZ5uipiEAziCiKyCiltgY1e9Mzdb0U9p8y9lTqWretlS?=
 =?us-ascii?Q?/U1dbaoatT4aY4C6d6tpvfA+h9/kGDwTomMYR/sg38fHB8I4gx/1hnC9OUmM?=
 =?us-ascii?Q?tUSaWP68etARhXpSUpmR5+wQkvq4wgg4OQxdbpk6wp3qnYrxu/OIGp6VVA6k?=
 =?us-ascii?Q?JOt3bmMBtKsxZ27YDEN/T7Pv2OomRd+n7Atu3O+uDrvH/Al1ADNSQfoIZ6jh?=
 =?us-ascii?Q?fYko7tC9EaxM+oCi5a6Hnm4CMFxdbFB4u6IE12WPP5FkapmYH+P9bZN+7MJV?=
 =?us-ascii?Q?2H8tUNfW+d+6oZ8d4XqEw9wvotIGi48TWt1eAt3G7TLZZWFR/rGVb8MIB+LW?=
 =?us-ascii?Q?1F+AFhZGHR3oFHRFvSGDU61qmgZnEkVRAzdRb91HMd529GvY2gIMz6S5SWSa?=
 =?us-ascii?Q?CNdGEzOrMgvj2JiISQsmeB0BbwJ5jBwHo8YKs8g3YzgDZR0vcZB54HgXNO8B?=
 =?us-ascii?Q?KWOJciG+UyMExOSSzgf2+HVrhTsIzWr17gxowPtXznCplSOexdFJaBEXMVDP?=
 =?us-ascii?Q?lxOo9CnzGi2L9Q/SkGVQJTs0faoPyl15Hhm7gp1zalR3e1p736cRkhielxyx?=
 =?us-ascii?Q?cnmkJUAFkSSqnK4eHi9s54wry3IlbIdcdDChxh+pFlxmcQumlRmhP1VXVjJj?=
 =?us-ascii?Q?c+Hj+ll0oAFM3EDLgUA1r8B1JlrPqGPAdJHStgs53zAzFHmxgKOsp4VdbjzQ?=
 =?us-ascii?Q?haZtN7MOniEIGEgRHLdQ/4qZs+uu8EH83yUlo3kJ+9ITT9sWId4+fxMW5Qrx?=
 =?us-ascii?Q?sctuccde4LXVrbXa/KfR1LWsQHv4Am10U3cx8j12YCy3SVFO10RJZfFOMi48?=
 =?us-ascii?Q?rOGbm3LBNEgrbotyAqmTd/YaeF7OhFmf9aR0f2T8kaWgftLYGraTnjh+oHCP?=
 =?us-ascii?Q?mYOD+omTYGl5UhgL9ZTK64fFq3NG3auexScDQXDt7xC1E4JVva297tQ0+k8W?=
 =?us-ascii?Q?cHqYK3mnPyESx6+zhpFIHv5MEkeH+NhADXapEMHh9Q7F83erCs7n9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M8MhhCr0RHSuulNQW23I5JCP+MT/5TW4I1GzqO/4IHcLCQDuZDOaUY6onfXX?=
 =?us-ascii?Q?GSeN8K0vIhw980T8Kz5x4pVKFBvNgqbQSa5rIin0XmReJ7GfLpzR1SMDMT+0?=
 =?us-ascii?Q?g7nFzBp+xwkDe9V6rdgNiipk9hLhkdttdjcQkVnlv871rGX8eIV4wOe4Blm5?=
 =?us-ascii?Q?g3gZ07Z2qFQtLsccgmgFayPC2tvrQo+nuMkBGdOQ6Bb2IHb9gC411ETm8FCH?=
 =?us-ascii?Q?TIWFPAJh+y0kwWhsuMDO2wpnkAZY+21XwztitQAXJXmf+CRYgmgK+1RJEcP/?=
 =?us-ascii?Q?njjY6+QRS0POIA5q8V3VMqgsN2OVezFvXwAsE5siPPjCtgmDKAMV6G81B8Js?=
 =?us-ascii?Q?K96Xoye8RoTQC9r1dKHWh3kRqV06KxH64YuRy/moMbyOSGD7Qh1O+53dbOKE?=
 =?us-ascii?Q?nBi/3yk29CM2hyYizRc1cx0GwShcRWpWilnKEiNMHgNet3v86vrLgliAF3yw?=
 =?us-ascii?Q?uezQjReTYXIgdwTgypOjzBATS0Cotv1L6VLUL6BUsKT9c9fZq5dq+kaW6AOM?=
 =?us-ascii?Q?uWNQecBEbd1Rxpih4i4XM21rPWwCm+OgkYt+T5OL2h1VxbI4B9yHWKb9VMWw?=
 =?us-ascii?Q?gU9j/WcC32cF9QH/4ekYvYDj66B6UyDiTRWZKcp6g++G8ZR7N7+ZgW0BJnch?=
 =?us-ascii?Q?TnAx18/be4ts83BsRaKppIwuZqw/fz54B2kl2W40HPeCbkkxpfG2Yq6doRkB?=
 =?us-ascii?Q?f6vpGn7p5dstj43Mx9CHeaBb00gKTSF+6NOIH5zPQcF2V5FSgg+WVnVcqFro?=
 =?us-ascii?Q?sGmoL3nBMsJJhobyx1QeQimXPj9F+r4b0NFYcgNzqzDwnx+ds2HrbAj/vcA0?=
 =?us-ascii?Q?BZnc0YvJCPj5Ca+I6J9eu9jXSXxnoxPXad11nHc3iFDveuBcylt+G50c6JUb?=
 =?us-ascii?Q?d4fT1zsOlxZtEPHnQX19h77wWP0mgcVbj/zseupcqckr9iErWXClzGidADCp?=
 =?us-ascii?Q?07zHeeSxSaMogVZj7gKHVBj079o14fU43+hXU56eVCCGInlpEtRLT8zetMhF?=
 =?us-ascii?Q?nGFOiS9I6yxBNPKLGOqyehKsJv/cGfcxIdB6nTdfbFzifGhXktXFsp7uvJPR?=
 =?us-ascii?Q?b/bDNbpWffDD4okAFGy5iu1zclEwcLy98LVx20gG8Pgidd37z28o0dFXrnLZ?=
 =?us-ascii?Q?61N4s0B/gMKC/wEaDNlUapET8MQ3Kwxon8xNp+2+adEiTZ6hE8SsvZpEkXVT?=
 =?us-ascii?Q?7ixMwgTp+lUSu9t94U7Xnbt/uDTh9KemybzKe0krBjQzKntDtHROxLpXpDp4?=
 =?us-ascii?Q?GrE+NNRXEyIxSYEPZDAxPiZeTsq4SdK+4l1XUfQ81Zx8+JjQ48PpyNCghVp+?=
 =?us-ascii?Q?DGpJX04A+QHP6PjDfze3rthT6XAJqV8VMHJz106JyN6PZolqVYLRz3lHeKza?=
 =?us-ascii?Q?UHu+yHeVfmjLX0OnuNE8BCpo5envwimdzZHPMsV2c92L8hynI6hrvQ89GBAO?=
 =?us-ascii?Q?6nTaaWht9KCVjm2RgJi2b3x3mKQ7vgAsZmY1dHMhaWzTRCtS253s8Mx45egN?=
 =?us-ascii?Q?K1SXwJW7kI3TTvwseeeoA2UlM8sU05MfbhmvCa7YTL3PhcJP4nPBgKOJqWew?=
 =?us-ascii?Q?uVGyXB5lvEOXEj9KbOhBbhf+DEujE5OpSt53N4aZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdfd626-8286-4395-99d4-08ddf9e3cb2d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:51.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxlVb/aK1DVYd83XsWMA2k59tLtRQ+5TgcRekFKlrkwMrXUfjnH001ZbglnJCI2xKqxV5oXDkMoJHX44/AAJgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207

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
Changes in v4:
- Replace devres bitmap allocation with bitmap_alloc() and
  bitmap_free().
Changes in v5:
- Rebased on top of latest linux-next, change the extra goto statement.

 drivers/gpio/gpio-regmap.c  | 26 ++++++++++++++++++++++++--
 include/linux/gpio/regmap.h |  5 +++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ab9e4077fa60..f4267af00027 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -31,6 +31,7 @@ struct gpio_regmap {
 	unsigned int reg_clr_base;
 	unsigned int reg_dir_in_base;
 	unsigned int reg_dir_out_base;
+	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ
 	int regmap_irq_line;
@@ -134,6 +135,13 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
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
@@ -284,6 +292,17 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			goto err_free_gpio;
 	}
 
+	if (config->fixed_direction_output) {
+		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
+							    GFP_KERNEL);
+		if (!gpio->fixed_direction_output) {
+			ret = -ENOMEM;
+			goto err_free_gpio;
+		}
+		bitmap_copy(gpio->fixed_direction_output,
+			    config->fixed_direction_output, chip->ngpio);
+	}
+
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
@@ -300,7 +319,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
-		goto err_free_gpio;
+		goto err_free_bitmap;
 
 #ifdef CONFIG_REGMAP_IRQ
 	if (config->regmap_irq_chip) {
@@ -309,7 +328,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 						 config->regmap_irq_line, config->regmap_irq_flags,
 						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
 		if (ret)
-			goto err_free_gpio;
+			goto err_free_bitmap;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
 	} else
@@ -326,6 +345,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 
 err_remove_gpiochip:
 	gpiochip_remove(chip);
+err_free_bitmap:
+	bitmap_free(gpio->fixed_direction_output);
 err_free_gpio:
 	kfree(gpio);
 	return ERR_PTR(ret);
@@ -344,6 +365,7 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio)
 #endif
 
 	gpiochip_remove(&gpio->gpio_chip);
+	bitmap_free(gpio->fixed_direction_output);
 	kfree(gpio);
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 622a2939ebe0..87983a5f3681 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -38,6 +38,10 @@ struct regmap;
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
@@ -85,6 +89,7 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	unsigned long *fixed_direction_output;
 
 #ifdef CONFIG_REGMAP_IRQ
 	struct regmap_irq_chip *regmap_irq_chip;
-- 
2.25.1


