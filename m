Return-Path: <linux-gpio+bounces-26174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB9B57E3C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 16:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06604172510
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 13:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6E231B110;
	Mon, 15 Sep 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RPhi66n4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B831A05B;
	Mon, 15 Sep 2025 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944547; cv=fail; b=QgdaxzQxjvp168A+75p0XTbZUWQ6b0HNuDpdyrp0d+KFxs2qNAA7bPWEJzE+wmwCzuypi/7RzKXrjFDva/ZWDguWHM0gm2QlRBi50eTwurDbvlZ6sxEOdAseNw/EWfpSSkhJv97pLZgZmxgoE0ASl5sALxbhmwJAsKb0Lg/45Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944547; c=relaxed/simple;
	bh=Yfrrhl30RgwGHubRODgvg4WB1Hm/jSA5VC9K0Hbcz7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QX3K9zytKun0GAgVAK2rm9PUTENunQKlYffJb9Q/Qb5KRdkOn1UmByYp2zF5BROFPzPHiywF9+qKzZhuBKhcmLIerod7iUJttLyT+ydFsPO1QXJbhRATn+9UTQgZxv/3G6AlBjU1BKrV6RlFwHKshvzV0VJbv/xztPddcBI4Fdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RPhi66n4; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF0BfrWXN4j8vVIJYcYnKj7uvZSJPe2dfk/58ZVxj38QMTAUmZg8nlv8poDSfQyyKnhlH1YrP4O1b7HROT5gXfXt9IJaCQaUMqqpkLGyUylQjBtnXQRxJqTDkYvAGid4pGYBUETTZNwEcZCk2QfST0HE9rDraOViOwrb7erD++b7FpAAginHJezLH77znFoCozUnItiqsDDmZ55EJd/4LznWSCYgKF+SNOVdayJJqf/V9/JItaZHNXYCD5mDpNUfp3X12bvE0hiJY+xwS/bFufwjaKLITAY8Ip+cSJ2Pu7efdsV7cU1nbVPLu8OtXMyMatW3poKhbCSMyYHsQMKczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGX19kOEV4C/n7c25R26aZvQJmkh+gZ/cfFZ0GRA8js=;
 b=dNnsMFy+oax8EMbzyvugc9f/N/+h7S+3fZbSbA7s3mYRsEGkSVR1aUlszWbrBDgPjlIViNpZPegUL1b8lmwjVz9JucphmBMWaGR85s8JHIdiw0pINvKy9w5foXHohnG7jkU8PHptLXxPi1sWjGy267Arj7uzLqy9WiGVJz/EtMUYhFlTEtTOGRg54sZ/wOI0rwL7BsXt0mwi352kFp+SFgQu3Li01zhYRn/SC1RIXrtCfpJrxx8xpqebTxrxZDaGgXSzRDtT15erOOXQStaL9M9GRcHDKeJRrjA6gw4vv6LPI16zh6/cN+gIMKPw0KkSt1IBuRSjpp+i5Sb3Zx4DYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGX19kOEV4C/n7c25R26aZvQJmkh+gZ/cfFZ0GRA8js=;
 b=RPhi66n4lXW15myymoVNmQ/dZ5tRQp7wKYg2bO07EBgW8Y+qBvDajyGf26mhv45M7wvTwI8i8GDtyprXIcetPMg38UjbGSdYidwGWbGSOCDyeb0RnFAP7sBY/d/qsirNLePuy3bAYZ8bVS3WdkB5Ju6OwhdbsJp9Bi+IR7eqxka5mkzEZ51yKakxHMYDSc4yTYg383nZVFNcY2s7GgFJyUq79bt7lz5SkLUclym7lfwxjVm7lsxj5BuiPxC9vs648zrKEdYsRdXhF6mmMSKh9uENdqYWJ8wrWMH3Ibfk33dfMwG937VTr6ILHI8nbByPVMDU8rmTGb7NTxcstO4qDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10824.eurprd04.prod.outlook.com (2603:10a6:150:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 13:55:40 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 13:55:40 +0000
Date: Mon, 15 Sep 2025 16:55:37 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 4/9] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Message-ID: <4awrlgj33bg33gg4ianqk5ypchrygppkqyyojfliznitbtzu5h@xsgnk25syvqq>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-5-ioana.ciornei@nxp.com>
 <DCTDUJO0PS8B.1LD03WTEMNRVP@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCTDUJO0PS8B.1LD03WTEMNRVP@kernel.org>
X-ClientProxiedBy: AS4P250CA0023.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10824:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ccb4f26-b05e-49f5-a460-08ddf45f8e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FV3WPX58DBhIaEjFZTxd3EbgvYSFkEXukxeql7xs7kBmXqPOk8oibIsRcxa2?=
 =?us-ascii?Q?2wELbUQbgkeP3orT5TencbxWOW7JtykUpf2IjhfRn3zRioKS3vySijnVjExC?=
 =?us-ascii?Q?f+5YdTCXYJt21bQlc72tR+rjoP5ejvU/NwP1sPKPyDCpjgHR/MS0x624Z4yO?=
 =?us-ascii?Q?uFSAuiGgYl2maQOxLXPVAgNbLQ2LJHnZAMDERJ/L1g0677bj1+cvLiSUNsvS?=
 =?us-ascii?Q?8q6XLiW5T+JuvbIG16FUiEgJ0R3zyVHHE/bGAly8zRljI8C0aD7UV37Rwcpk?=
 =?us-ascii?Q?+5GXma1/XnhLe29sj09DrxtTDPrpi0pR7LvooXzAxqcOjL6Knw8yIZW29ouf?=
 =?us-ascii?Q?J+ViEYWqbcD0xfU4yUXtGNu15Ie1R6A75AXu0kPOYT0p9RhhQLyNBzeI+MCn?=
 =?us-ascii?Q?JhZZOYWTnBIDcE3MsDy+tYnbFHl/0WhgZY0d7MBJ8wn+vVzuuf7UIViYisKx?=
 =?us-ascii?Q?FZpi757tZm+Uizi86aBxwPUC0yzkHAXrNz1/6kkB+qatJVdaVe9PVIOwmbM0?=
 =?us-ascii?Q?5DnccxOh6xf8pgy0CPwnjco/8KHXUVL/SB9fWIhz/m9I26wBiHkhZc+rU5nO?=
 =?us-ascii?Q?TwqYes0rgj5PnNT2musi56SGRf/POU1dIqArhk5R44KSOwI5K9vM6+/xqPDF?=
 =?us-ascii?Q?rDGeFtY/QQNCdhDfq3pLV7rMg5nNp/w8rXgAGQ+I1meHft+oebd1w04W8QaO?=
 =?us-ascii?Q?95JHFWCIl9nQjtzt0hrcW0olwXqRcKTdAFKjwfLUpskZABngzsG4OGyD+Uvv?=
 =?us-ascii?Q?pcbI3oIhMBogzInCvG3v/vplmAnTs012sRbYfSWLYrpu3a7w0lEenVPwwIrs?=
 =?us-ascii?Q?Ssnb7qHfYC0GIlv0fGWplQXJmiHwrsWmYJSv9eXR0HTwv5fEepKfRHbXtAy5?=
 =?us-ascii?Q?CbguroVHon2cH7fSLDaUJlVFmX07JEKcjnrjh6YPZJ7/3S6Ip3wb9WOrpyqr?=
 =?us-ascii?Q?x2Ye3Q2tCD8uNpAJbXtAsw7PWhYlrJU6kzRsY0ToC3hFZ+ilxo8Ii6+sU983?=
 =?us-ascii?Q?efqIVMD/JaRRqS4XTNBS/qmfi1L964OjMMNWiS2gj1Mk4WUH9yq5RjmZe4Cs?=
 =?us-ascii?Q?uLURWJGClR+hOGThAcgbS+S/MplMVJGzwucUyTZJGkVzx4dZsf8KyHixTu9Y?=
 =?us-ascii?Q?8faXclL7pBeqvbKcD6p2hwCYvZF6cqAEU5xa4i7ReKn31JsS3rz2hoYX8+NH?=
 =?us-ascii?Q?op35HM9dOwgJSuNZyMXfBcnu7LmVpgjK5qnGC4cfIGxcofx6tmfhF4aHC87r?=
 =?us-ascii?Q?RUPF5nZd9Wu/8Tqe0Ck9rSlOu2v/t3Jw1NPAColaSwS/8TLHWyo3HKnkml+6?=
 =?us-ascii?Q?CSqZsrHE2T87WwV19nHv567i9g3wzpwnF2jpqETsPGCHvpzyXlTkncgPfoiU?=
 =?us-ascii?Q?T0jSTfIh3prjoCCY0czKHt/YTpF0wIBp7hAyQqTRepLh8lItt+hHvdlsgaCf?=
 =?us-ascii?Q?7TsRWeVz9o0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ij0zW0QiZQzCYKZXKgNl8cOzgi5vFXgBDpdsOJ9yYuPoQ+of7TZ86Wsmp4W2?=
 =?us-ascii?Q?1os+2cXkI4xEmeuZNy7Fk5P2k6jOXImRdO7MyPu//wmbZwXD5GYOiRcSzNNc?=
 =?us-ascii?Q?Evm54H71LaZNMVik8+6SH5L0YDrRrseYPVDPUl6FVeNwKfJUr+ak7vcXcV68?=
 =?us-ascii?Q?CW9keuc9V6YdsrFuPy5sXSRBUV2ySynwbPqqRsnV1qqG8ugcSBC7eZZWU9Pj?=
 =?us-ascii?Q?k0Sb36TLrEDM6RWY6WnXsCwQmsR7yKAnO77/VzERlMcUG83e+ovg7HGUQvxa?=
 =?us-ascii?Q?Eu07dzwuTrhiukGmzlPDxiBqOw+BvKumQcx3XeQuYpPNYQVM+DGyEQyNvta+?=
 =?us-ascii?Q?eLDNmacFFHamzWLMGk2zYLNatoKRrHbj3CRprYVR2O5+Bl2LdTYKY5VwsmNi?=
 =?us-ascii?Q?L4FJbPcOVN11gw/G3eyCzCSPE24BV624yQbAXYiwKmXZwrJhN23u8XS0Rdwe?=
 =?us-ascii?Q?ja4+yFSdsmiJMiyA9R5lm8tlDjWDPjNVduy7BZGwsJaXCKbY6nyadGvd8E/D?=
 =?us-ascii?Q?Xn+xXFFWZ9/NK2mk8kCfiCQwepXe1LVno+syC8RCY7xOcnU5BW+gdMZN3nB6?=
 =?us-ascii?Q?PsBC8uLAlRJhpglIALA8oSJqtQmtQwOaTxvcOxrh7XUgQNBVFlkRd1WXjpmz?=
 =?us-ascii?Q?4yONg+I0Zm/CiHo15fAwce2CKsf7VFSKDjAGHO6FSy0s4UTAxw2wP3fmuyuA?=
 =?us-ascii?Q?t2RvKLJbTGFaws9x/YVIZfrTWPxbWiymwICryUdMERKX93Q9esvMHlMUQQaZ?=
 =?us-ascii?Q?TvVUfjlX/cMH2aRNzNl/dJSAucUndMAtHqXdf/Y3IlmwC2LXis0tdPQy6EAe?=
 =?us-ascii?Q?omTW3Rvx8+EwsRU8WJb3UNSNF2ibtOqd2pe4/CsT3yZwb/M62vc3Bh/VMROx?=
 =?us-ascii?Q?8n0kJvri/ed6Cl8K4sXjxy1mZvQOuw7nQHFJYVUATc5E3qczNv5KZyDjbVfa?=
 =?us-ascii?Q?OJXEa8HgLp6t3bNGgTu3fEuOBLGNFi280my941AYu9ecuD7GnXgvxZd15HK0?=
 =?us-ascii?Q?n/7QGL39a9DDb/CSN6f+GAq++KyIJhKy0F3ymENznaotgvLazsLO1DlRP7tv?=
 =?us-ascii?Q?FGrvCprlfZVLKug+rbQrwKkVdAAZr9iFwRXDZ6kycNTHDlzskpigMMk31GXj?=
 =?us-ascii?Q?dK6hqgXxSNsfIf0eBJp8tS0BFP5hQY1qqi8qlOoDw1v7ny0JCchc5FTSmDo3?=
 =?us-ascii?Q?jiVVO/BVT3oa2SlqB+QU2D4dib/gSL80hrT5Om5C8xardAjdIkw3zX6/FDfV?=
 =?us-ascii?Q?cHKMT5I0Vi5DkHN4N2hyw9NXeTtO7KjntuPoVMvPuOt9znUjL7sb4dBUGSRi?=
 =?us-ascii?Q?U9qnU+2KYlSAB4qO8rflDPMar9KNYRPlMiLMg9CXOasI+b9oXWxChpgkGJZp?=
 =?us-ascii?Q?9DlHAdBGieb5SGsU0ATRLSFtoNK5CLvFEgVrOLR3sTcOu5Q6gSDiXVCzJks5?=
 =?us-ascii?Q?NgtB2zsqks1UqN/iyuPDN/m6wH6Ix0YQX8jq6p8HbVcCq93v2F4JhRAosyQp?=
 =?us-ascii?Q?sRrmZ2HFlLeDufgORn14i8K5PzwH9PJa6TIc8klQlBetICdAn00w0ewbvqVu?=
 =?us-ascii?Q?FOFVJRv+Jpdn7NC2B8MaoKg3VRvMQbYDrqVu7E0X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ccb4f26-b05e-49f5-a460-08ddf45f8e1c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:55:40.1620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PofVrUKO8Q6mDdQil1p3P9lFs6PPTz7CDTj/8dFmUR0Q6wBNvH551uf7vN/wd6XwTaR4Hhz3vfaov8UBbH24Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10824

On Mon, Sep 15, 2025 at 02:45:58PM +0200, Michael Walle wrote:
> Hi Ioana,
> 
> On Mon Sep 15, 2025 at 2:23 PM CEST, Ioana Ciornei wrote:
> > There are GPIO controllers such as the one present in the LX2160ARDB
> > QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
> > together in a single register. This cannot be modeled using the
> > gpio-regmap as-is since there is no way to present the true direction of
> > a GPIO line.
> >
> > In order to make this use case possible, add a new configuration
> > parameter - fixed_direction_output - into the gpio_regmap_config
> > structure. This will enable user drivers to provide a bitmap that
> > represents the fixed direction of the GPIO lines.
> 
> I wonder about the ownership of that allocated memory in the config
> structure (and btw, I guess you leak the memory in your driver)

Yes, I missed that memory leak. Sorry.

> and
> if it's not better and more error proof to allocate and copy the
> bitmap in gpio-regmap too (and maybe use devm_bitmap_alloc()) and
> leave it to the caller to handle the passed bitmap. I.e. it could
> also be on the stack.

So you are suggesting gpio-regmap to allocate the bitmap using
devm_bitmap_alloc() and base its size on config->ngpio, then copy into
it the bitmap passed by the caller, right?  Yes, that does seem more
error proof in terms of memory handling. Will change it in the next
version.

> 
> Otherwise, this looks good.
> 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Add the fixed_direction_output bitmap to the gpio_regmap_config
> >
> >  drivers/gpio/gpio-regmap.c  | 12 ++++++++++++
> >  include/linux/gpio/regmap.h |  2 ++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> > index e8a32dfebdcb..2489768686d3 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -31,6 +31,7 @@ struct gpio_regmap {
> >  	unsigned int reg_clr_base;
> >  	unsigned int reg_dir_in_base;
> >  	unsigned int reg_dir_out_base;
> > +	unsigned long *fixed_direction_output;
> >  
> >  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
> >  			      unsigned int offset, unsigned int *reg,
> > @@ -129,6 +130,16 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
> >  	unsigned int base, val, reg, mask;
> >  	int invert, ret;
> >  
> > +	if (offset >= chip->ngpio)
> > +		return -EINVAL;
> 
> Not sure this can happen. I tried to look into gpiolib.c but
> couldn't find anything obvious that it can't happen. Maybe Linus or
> Bartosz can comment on that.
> 
> > +
> > +	if (gpio->fixed_direction_output) {
> > +		if (test_bit(offset, gpio->fixed_direction_output))
> > +			return GPIO_LINE_DIRECTION_OUT;
> > +		else
> > +			return GPIO_LINE_DIRECTION_IN;
> > +	}
> > +
> >  	if (gpio->reg_dat_base && !gpio->reg_set_base)
> >  		return GPIO_LINE_DIRECTION_IN;
> >  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> > @@ -247,6 +258,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
> >  	gpio->reg_clr_base = config->reg_clr_base;
> >  	gpio->reg_dir_in_base = config->reg_dir_in_base;
> >  	gpio->reg_dir_out_base = config->reg_dir_out_base;
> > +	gpio->fixed_direction_output = config->fixed_direction_output;
> >  
> >  	chip = &gpio->gpio_chip;
> >  	chip->parent = config->parent;
> > diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> > index c722c67668c6..34c143aca42d 100644
> > --- a/include/linux/gpio/regmap.h
> > +++ b/include/linux/gpio/regmap.h
> > @@ -78,6 +78,8 @@ struct gpio_regmap_config {
> >  	int ngpio_per_reg;
> >  	struct irq_domain *irq_domain;
> >  
> > +	unsigned long *fixed_direction_output;
> 
> Please add some documentation.

Ok, sure.

Ioana

