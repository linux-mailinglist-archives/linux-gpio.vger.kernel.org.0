Return-Path: <linux-gpio+bounces-23213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EAAB03F82
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 15:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7591D1A628DE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCEF250C06;
	Mon, 14 Jul 2025 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b0Tj76vt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC522505AF;
	Mon, 14 Jul 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499088; cv=fail; b=dlvltzp+E0l8/ALB8FRO76exoXLzJtnpJ8NXCPoB3s8twyh7gHX4WmWa1GYAPYSLRH57yL1NLkSiLAh9uRXm67Mja9sx/ch1V0vcSkxQK1SiMsSZsQrbtmwEJNspgyXFQeBiOUNkQPOs+isj+VpmRbzI81/9B7sssal1eBosCvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499088; c=relaxed/simple;
	bh=xf+FIdkbB7eXD1IlS6UeGwRxIx+/o79N+QRCeoJaC+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gtc44vFFbl+SCSxmx4c7DDnfxfo/eYtgQwOYH5C+wFNYSIBDs8r+mUjCWWyPixA2CYBrISGw7n92kpfCusuP+ZceW0y7ViPY5yq5muzZSJF+OJGZr8vRbgSYn70RQgclDmTAt0bT4NOiRSstmZAOyW3dzd4hEFBvdHSB0sBlcBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b0Tj76vt; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH36dRCACI+frL812V/XOWet1fgJIKxKIKXEA/KamIQWqAt9ZuDUm4P2OXRPutSW8t+Qe5ecAfmcX4t4+vOPmjqRGHmN4h4fARaxQ2ERFjWHDOdhPk6LcchwGTV7ouzLmswt/zO6ChXXgin5E6PhN1QMXWf4D6N/WBKs4TSLf5YPzjzL+FIiqZFWI/pVL9kaLRdjkQztACZ7MGT70SoeOEwsqRmot40pBzurl77z/46K6sfJRWE1hj0zlEHPNpsv2ik1lye94+M+RciJmApX3M3HdQG9tV1cRHeoudtYATL/iCy1URKA/ejgClhV7Jdp7OlE6Ib4NzSpLkpVgIjLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dil5TX9HIIpjoUEnlnBWkseYdYh4ig2uIHYsr0IAQD4=;
 b=xqcKlCC/xhWtbfAQX8FVw5vZIMC4JwHf2y5LB55xoKDbKAur5Vs2qyj5bE6eOzwew4mAgTnGl01oqbVIgcvhzFe1g+Jeg2EZkkw+tDWMyaD40p79yZiYdrVK8sv8ImRmxbyP/zcNgkszHQMAmGoiotpMn4ljptPehjct4Cw1aARtWiKf62TbtS8mZ/G/1CfS78iuwHk/kL31i+gJeqGgM/gmFVutA2CbGYO83ypyRcC9gQXDMX/aosp4fRpXCO9od7ChLSXPpCf1HtgLiUkb3zREDrFL8nh7SivO0MfA8TD0yX90RSSWXyN0BHshYnqINBbK+6xG0QZNNWWtKGlHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dil5TX9HIIpjoUEnlnBWkseYdYh4ig2uIHYsr0IAQD4=;
 b=b0Tj76vtKBEXb8j2I2O+mg6JfEq9xTjUpG2m7NOTyRwgTIAtyGir2Jsasz3bt0TpqpKgQpRJZPwqt4zDRGL1F8IPC/CVsKzkh2Gsib5+hk9J/ydJJ5yyBCp4hKIy/bplOFiXpppEf2be1ILulOvwAgFpTyFqEL0VYJXxBEDP3eVyuiPGHvffpEq63bB+PjfmPnU8zEgkGAKmyY9B2W9ClmewEI2+rSoyme59TktX1FWmrlCQBxOrjjddph8pSjIkJIeCeyq/BmgEQKf37Hm74B1FamuaIu8YupWa4eQQvm2xWfj111zEbTDm5qNX9PrUDE2FWpFVUJdjX0bpC/knKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB10084.eurprd04.prod.outlook.com (2603:10a6:150:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 13:18:02 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Mon, 14 Jul 2025
 13:18:01 +0000
Date: Mon, 14 Jul 2025 16:17:58 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Lee Jones <lee@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Message-ID: <sbvgkepshytjklww6ifttbeg5zg6szlp43qsi75zwkstcgffqv@gritt6czkkej>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <DB7M5DTXEACR.3N7DO1DM0PZB1@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7M5DTXEACR.3N7DO1DM0PZB1@kernel.org>
X-ClientProxiedBy: FR4P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d326c9a-86e6-4601-06cf-08ddc2d8dbfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BuM6N7aXpoGVltmuCpm655L98NoeBVqTCjgrOVe5Tp7Mki2ItMFPPYzgf7fZ?=
 =?us-ascii?Q?g4oEzKWHxp0VJ0MYmk2YSJGo5Yj4YmzKf0qrvRDlSe3pHkpprZem9SdGVtMX?=
 =?us-ascii?Q?GtBogeq0OoWdiCECAUb4qShNm7dYhR6Z9SMSCKBIQG7g1jddo4A/+UEJR9qV?=
 =?us-ascii?Q?y5XtVVW6O92iTFI753FSOGN+jLtd+q6IquwX/8UuGm1K//4jP1Xk+ad3ViHn?=
 =?us-ascii?Q?YV552rjLZTslwSkNrduEe5X2wZSKnplTB3HaOofr4yX9dZ/BgsqS6cm+qaey?=
 =?us-ascii?Q?iR4nTFd1wF666YYORJidq4vx/30sJLV9LaSKqpGto0mpJWQfdOEzz+Y3KeCI?=
 =?us-ascii?Q?JwsKXCxgxWuk4irKl8w5bdq1+iTjOZ4ks8gmmCq/mzYLfKyz6LUR0WhVSgK9?=
 =?us-ascii?Q?2ILrvoo1x5+7eXt0QRL8aWFtOdHObDZI2lfR7cIxu0dQxx8MWEvljJlUSTy7?=
 =?us-ascii?Q?igz0UNZuwt4X89nE2RNOnsnzvEq9odz2jfemcJcWt8cd3Jr5B8fsEJBTE/P4?=
 =?us-ascii?Q?sTPkORQUhDeraz6zC6ZVERUtqatSsGoftcrf6SQaOvMFPKmLuAyZK8zD8dz9?=
 =?us-ascii?Q?sEtecMU7SbZPEJiHkKvedf6S09SnlnPCkw05p2G96+JSCuAjAWSA5jfE/GS2?=
 =?us-ascii?Q?I1hoFA3h9SXzhY1CrhyUIarzclISOuxiJxKcllVZKxKACPOUxO9P6EfWC51X?=
 =?us-ascii?Q?I13xkKGOD/WeVDBtxOtBZWkybK6552+F52t56xi++4M1R/mU471LOhLl7R1X?=
 =?us-ascii?Q?9PjDz1urDD3K6QTZIQRUG6NO7u6ertlq+XtcP1cPkLk9s+oGqgZT0cCfCaLt?=
 =?us-ascii?Q?n5AQV2AdLcYm4YSfzODPZ9Sfwe25imr2L1c1AD8gQHCOMi0scfHHiUj+JCEW?=
 =?us-ascii?Q?kuy6zaP6FpRk+IiRLMgMt1j6s5Wh4clOfVb7CHvHXSco6fK/uU83RzLyAzL1?=
 =?us-ascii?Q?lVLuIsRzs85dlTxWG9EWU6ZpwNNlEhPpLZSLma4q2SgYLi5YEWvDt60Lzm1p?=
 =?us-ascii?Q?gtFZW/rgIeXBe5eGjIUH0JSvat+xWEHCwyxTbU+p7yPNnCUZi2ZlscJLMzk7?=
 =?us-ascii?Q?n/dBU2FJHWRsHlnPbj3s6pvvqTJvnfdakJYERrjbjV47LSRkfDDcwNMSNhn7?=
 =?us-ascii?Q?5aEOVf779yMHqYZK50a19ik5GOwN/Ma0aKY+06tfbNyCzYhCqnIC1ijvCdSK?=
 =?us-ascii?Q?olO2SlylUC+hXRTXUFG/h0l3Vys4cfoQLs8dEcCi6rH6iDgIB7VXtNT1upj2?=
 =?us-ascii?Q?eMwPuOjXswK5IQooKc+TldIGwhFty2/H9eCiAdMZtt2g02GekPNVYdhQjwvg?=
 =?us-ascii?Q?t7A7aKlwuqX1E1THOnrq5WxASWIU2HgXF8466rS6cAdzh6QWG928/KS55cfz?=
 =?us-ascii?Q?aRUi5U7kmBsKitb/0aGJhkOfzaPtG537q+j9Va7vYbkHC0exYElFISvPVEB2?=
 =?us-ascii?Q?FYevuv+XeIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L2UdJR60YlLTDaf60UhKv1imYvezq7Jb8dlcwp17xkgi9hEKsQzIBmXNEmZP?=
 =?us-ascii?Q?54Xo/x0XZspx/TIeNt166YeaglhyGCAI0/okAU90v2hX/NR1VkgmstmXsKs7?=
 =?us-ascii?Q?1ncFZkhwXXWmFe5tDWv3SVLwukTudQlK5VO/rG3+AR8ZsdeHW5RwiLs4/xqJ?=
 =?us-ascii?Q?wlJWQ47Q48VwU8qedntSEouP9YsX6TWhlkolkSK+1ZOfpgj7kIW1DfKd/R8L?=
 =?us-ascii?Q?s/QIpabQjmYqlied1pSbYN81sR2ALUss2vgpV6OENox+bfYdLcd5l+tNHwAV?=
 =?us-ascii?Q?ZqRDUf04Bp3vj9J/Iu/1IHoZl5ZTnfGyi2CIQy9SC2hY2l2OVlD1Da8Yme5v?=
 =?us-ascii?Q?FlmKq4jOY61hQAjSoGPVEQvIuxtmzJXz8ybahQMn4GoCP9IDL90Bhjoah/Et?=
 =?us-ascii?Q?wmUlzPiwIqYCI5XDQ0y9ZSkPN84DzB0iOIqH01GSNLGjJejHyU/i0IGrRbqJ?=
 =?us-ascii?Q?iQo0AN1JWNhWFAi/03sZFUW6o0ybNrR88ozBCfKiws8AzY/f296C63KB34Lf?=
 =?us-ascii?Q?Lx6ySsXE4edi0C1LNr4yTSnV0KmYWeluprX4CuOpFA6Ib/075LHfIbNraXDh?=
 =?us-ascii?Q?WhXtBCvx4bfFGhh4/3o/zbr+uMiAdFfIm3/fQ0793GuIyxjMrohuXAQjVWu4?=
 =?us-ascii?Q?EoMtAY4N24EdgO7jHySIZwWzdbVyDG177vGJKmK4OIYxUhNCuQGSIhBOnf8W?=
 =?us-ascii?Q?o+AFheQDrDH9aDYs3p0ZZ4su4ycQL6yeTWUGjDg9FDWcoxuG2YHgP99QEVPI?=
 =?us-ascii?Q?7js7PNh/TcXikKEsQkLWTtCXa9BpRrTV2DEIfVPyY9sxKGFt+LuHV7qSugEO?=
 =?us-ascii?Q?/yiPSllUjJFoae6akMyGxK6u1GAMx4llsTtjM4H8QqmxwwYavEfmLxHgJMkw?=
 =?us-ascii?Q?hD9UtH0j4VK4GjwXiP1KdBfF3DOy1eiyho9YznwQr2Cw6Co6xA/fpzEVmGji?=
 =?us-ascii?Q?0KhCKe/Sokeu63oOgCPoSmzX3KJHeLdytCx3AMpQQAyufyNugFwJDE2MFunh?=
 =?us-ascii?Q?3W8VKQlBhR3q2i9+2/p2wDIBrSGHvqwMZhECyiRJsFzZUuGyw0P22pfLanjL?=
 =?us-ascii?Q?jV+EUGgUg/AmhRLh/4XaOLNgYb/ev6aIAcqT0Yk3/mneDcFm7m5Q6Y1xYFIx?=
 =?us-ascii?Q?kmcA1PFne4Bgb3a/cBMqerGx0FIgdX3zqh4uRv7E4TSQrQXz83mpVPJB3cse?=
 =?us-ascii?Q?u2T7pfoncopfEz+ENwdabaBlvdJG4vv3hNj7JP+aouU3FggBwMbumWqYm2L6?=
 =?us-ascii?Q?0BSPrGbqdUHpMpuQyUrWG/YZiZ71gcfhRzKLoiYjUcSymlVHUeHT8hMvh6qb?=
 =?us-ascii?Q?eV2QYRGyccpW6/q8zp6CodPro8+NaRZ0epEukRYXj+js85fTRrbTvsWGfzKO?=
 =?us-ascii?Q?b8jcCEmfDl8yaCmBEeHUxUv1XBW1Brfo1qwrrlRRlmVIkUSfmT2LcwYX7Ntc?=
 =?us-ascii?Q?y5/pX7FJBOhjnKX0n72FWuKnNckSAX0bPfj3L0O45aXilgU9ohVM838N6sOl?=
 =?us-ascii?Q?Mh8EPRgVW/7dtV90qR7yjj2Ofo3S4o6mqEDyXGpSe66WwtlRWMYKsPu1eCJY?=
 =?us-ascii?Q?ASsWL821cMMZojAXWbDG4lRhNYJwf38Wi3vAgz+N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d326c9a-86e6-4601-06cf-08ddc2d8dbfb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 13:18:01.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPVxk1WuewvNpNQVzW7wZ1tYYIjJYnpXJ5R37X5Z4kyzbJ/IIVCHeifKDUkBILZsPOalHkkXR1rs1qefJlwwaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10084

On Wed, Jul 09, 2025 at 05:01:38PM +0200, Michael Walle wrote:
> Hi Ioana,
> 
> great to see another user of gpio-regmap.
> 
> On Wed Jul 9, 2025 at 1:26 PM CEST, Ioana Ciornei wrote:
> > There are GPIO controllers such as the one present in the LX2160ARDB
> > QIXIS CPLD which are single register fixed-direction. This cannot be
> > modeled using the gpio-regmap as-is since there is no way to
> > present the true direction of a GPIO line.
> 
> You mean input and output mixed together in one register? At least
> to me, that wasn't so obvious by the commit message, I had to look
> at the actual driver.
> 

Yes, that is right. I will update the commit message to make it more
clear for everybody.

> > In order to make this use case possible, add a new callback to the
> > gpio_config structure - .get_direction() - which can be used by user
> > drivers to provide the fixed direction per GPIO line.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  drivers/gpio/gpio-regmap.c  | 17 ++++++++++++++++-
> >  include/linux/gpio/regmap.h |  3 +++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> > index 87c4225784cf..dac2acb26655 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -32,6 +32,8 @@ struct gpio_regmap {
> >  	unsigned int reg_dir_in_base;
> >  	unsigned int reg_dir_out_base;
> >  
> > +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> > +
> >  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> >  			      unsigned int offset, unsigned int *reg,
> >  			      unsigned int *mask);
> > @@ -129,6 +131,9 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
> >  	unsigned int base, val, reg, mask;
> >  	int invert, ret;
> >  
> > +	if (gpio->get_direction)
> > +		return gpio->get_direction(gpio, offset);
> > +
> >  	if (gpio->reg_dat_base && !gpio->reg_set_base)
> >  		return GPIO_LINE_DIRECTION_IN;
> >  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> > @@ -163,7 +168,16 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
> >  {
> >  	struct gpio_regmap *gpio = gpiochip_get_data(chip);
> >  	unsigned int base, val, reg, mask;
> > -	int invert, ret;
> > +	int invert, ret, dir;
> > +
> > +	if (gpio->get_direction) {
> > +		dir = gpio->get_direction(gpio, offset);
> > +		if (dir == GPIO_LINE_DIRECTION_IN && output)
> > +			return -EOPNOTSUPP;
> > +		if (dir == GPIO_LINE_DIRECTION_OUT && !output)
> > +			return -EOPNOTSUPP;
> > +		return 0;
> > +	}
> 
> What is the intention here? Shouldn't there be just a .set_direction
> op and if there isn't one, return EOPNOTSUPP?
> 
> In any case, that is unused code for your driver as far as I see,
> because you neither set .reg_dir_in_base nor .reg_dir_out_base and
> thus, .direction_input nor .direction_output are set within the
> gpio_chip struct (see gpio_regmap_register()).
> 

Yes, you are right. I did want to return ealier an EOPNOTSUPP to make
sure that in my specific case no directions would be changed. But that
is not needed indeed since, as you said, I do not use .reg_dir_in_base
nor .reg_dir_out_base.

I will remove this in v2.

And since we are on the subject, I will try out Andrew's suggestion with
giving gpio-regmap a bitmap to use directly.

Thanks!
Ioana

