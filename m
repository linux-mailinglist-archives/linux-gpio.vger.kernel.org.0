Return-Path: <linux-gpio+bounces-23067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C9AFFDFE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD0401885773
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E9D292B33;
	Thu, 10 Jul 2025 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="evD2M/nV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B6220F32;
	Thu, 10 Jul 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139428; cv=fail; b=Vrou7taRmRBOv2uAcMEhPgQdsVatoeKNWaVurE95IddaBf+L6O4tKxN7VZmyB1oTMse+xnfIqigOcNbosGfrZPhNaJcJTVRFIfqGt5c2ThclMf6v9S5vKl3GAWKJvo3ciMH6uGS6ZAVSsNBVSdfKAfye8n0f6rRoDj31qAAWvho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139428; c=relaxed/simple;
	bh=NVSLb+uifB/mcF7EamnIQg+MR9ZK5zohNVCVMOA5W/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EId+bTI/Tnnvhn14kBT1MWFlv03qClt6+wSs1i6iblhVXGlWXpM5WJ+Xut62gV+IVaW10U7AmXLap34j4oeAdDhlcHz9rRfIHdIjl4n0G6o/NRcDG9y0La84qzRSOyQ6SM+nThzH/HHA9NI4Rxd/8l2TsulyBJVuHfF4MRsNDxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=evD2M/nV; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvKVAYz7GsErb1bgbRbjl8qdBfdwvVatdKuy9f/ea8vPOhe5hK9/8+zsF+mfgp2vp2RwBiN25TxKu1sN6GaSm3gerBBAhMbYXuR1Li3xATTSKfFd52Q2bZwFjIBYUvbG7yS+vAmP31UgTuD/jwRayWNat6ePpNuPvk98t3BnJYHnbQlzo/ClI/uPLHRGk+4W5JYhs2qP1qUt6n9lXQjg111L90Uda7NjonBtc/PH8l4aPemXFJiOVpxfv//Q1dmSXL/+awIjDARPYGpSb0CJTapj71b+ctqRp3yhGnlYCjUJvfFOLANxU3/vwW/M6mf7UGVmNk9NVWoQuDNus6F+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1L90Yb3u5byrEupVGYGJgqZqHBiebdvGUZo0DkrKww=;
 b=td1JHVrUI0X94U4myOrFcY+OpGPPukE0TwsRrf8RQv9SvJ9i5rWC+W0YDXFDghJ68357WRb2SC34U/8lYl2pTUgMso9YekxRcninRG4XxWqjDUJ4OfYTTV2tAFQqZiup7PBChjhQyflGYHvAJgKmhWsaNAOPBtKlagv3d3aiQFuhH+KdMaJ27AzR5msBlOeXG8i5mQCEXqr64DEvp+dkn8WtHEAf0rklZgNUSTec1L5WTfrJh/0jJD2IodD0MuTHIT8FGDJ/zrhmHGqLlzSeLKr7FeJzd63bKsZ3nm5vM9N7lsXdLJL+FRuPdLLgFa0ZCtllQ75CI6DhqTHCoRQm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1L90Yb3u5byrEupVGYGJgqZqHBiebdvGUZo0DkrKww=;
 b=evD2M/nV9Z8EWhjgnCMezUGlnH3UgVW421xeCVoDEi9VIJMYx2/2Qqfmn1ur1/yE3AgIfPpEuH0JgFD0RYp+ALqpveaKJ79Ijtm2gbTpGvy/KZ9uGqHuec7Bh8AWnHNKPbJtUABIbKdPEB68dtJE7R/0k2VW3Y0zFImdAl+1hl6DNAQCQFI7TSm3d4rF2P4m2i8Uj7PYPIyClISbARW/GhC9OKiCpp8psLQ0mqxCp/F2GkUD3njIK1TaOnBL1aM7eWNB0h7ytfI72F8LflAMDhaiM7FthlFBMEY9LKXy3PUMANSIRqrxDKDB3dI3U/npbDV2rxsXCD4fwNcFKNNKYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9471.eurprd04.prod.outlook.com (2603:10a6:102:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 09:23:43 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Thu, 10 Jul 2025
 09:23:43 +0000
Date: Thu, 10 Jul 2025 12:23:39 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Message-ID: <tsgdrm6qetvepolbyxjral3ark7yrtwi5zyazras3ka2xjax77@hds2kvc3nzda>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: b3dfb7b6-04f0-4daf-88fd-08ddbf9376a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0j8x0h14vNcUN5sMNWiHG7GmJKF3EzdzYR6b1zEk/iIi37LS1nIsZeilTWMX?=
 =?us-ascii?Q?VMriWGNg49oplxYiZja0DecgLxCJUD2CE7NjrNp25xEKBSjFhg/QfbgNgK09?=
 =?us-ascii?Q?ZANZ6e12GAQCll2X1NiI+pxJ7gw6xrnjAiRbIhhljwgOy0GKLxoK2DTBCK+6?=
 =?us-ascii?Q?KUUPSkZPvnyxximZ1UExZZzDSa9gT9u5d1FUCf52S5x8xSZ6bsCLb6HarJB3?=
 =?us-ascii?Q?DvTKAKOc+PF/qaBoTyZCNJg/iwJALhf3CRK4Y81H/9yR9n9PTZzds7eHGzuF?=
 =?us-ascii?Q?kYnuQxy9iDM/sMfRIEB5PdGPqGgLe6/6qTDG5uCSZzRhxBP8V8YnV8eOvUOu?=
 =?us-ascii?Q?Ewm8fGEvS2THDkbDcVsAHUhD3MwMFh42v7E2P6vF5/LljRBexvzJAiDib4Sv?=
 =?us-ascii?Q?wlIBj+72yEdNQ5uRAB3PLInbJD1wa4/sr2+ioaTMDgebJolzIGf9J3grNpa0?=
 =?us-ascii?Q?NvybYEpXKPJMT1GONdMjyZAEByz6peMVNfbYA1/7id/RGao5IZLlZeoivzFN?=
 =?us-ascii?Q?ZpNx+cVoCBaAGFchv0yIcEMJBjFa8X0vKJAkHKoFJotbBCtSivfm08PCkpKX?=
 =?us-ascii?Q?B9wxPe+aCQsccajWOs9zC2phF7tQ3oym4PZXl/BVxyG82seIB8njkkqef/fu?=
 =?us-ascii?Q?Lmp/94+25meoe2/rvUaXRaBGsBrIhWgwrOr9PO19YjX9mkA/FbNhGENLksPp?=
 =?us-ascii?Q?jyx9ACN+ccQ3h3229MRKo+lNbxMqVYMtHitM11CXybb4ytKz190LNPehLIsZ?=
 =?us-ascii?Q?Yh3ryI67u/NqaglYaeqjqdAOrvCVCaD5RchGh76njTf5MVcbtztCj4QAxtnl?=
 =?us-ascii?Q?AbPFg46WWstGOjVdqUuyQykLaeRuOz8ARZ2Vu8AlkyO9W7xVpktTKCH4X/1z?=
 =?us-ascii?Q?f0xj0oWL0woSQ7Ct4uaWWy+XXnnkOEM/IjIvwHMPY4S5UqfNo5BD8eY6enZw?=
 =?us-ascii?Q?I74Zk1fB+UF5GcSq10GnUUkixj3Qajv9r10SlFQVMqJYHGp4cUpPd4dFxLUH?=
 =?us-ascii?Q?pTOW7ae1BLuGlV8a1Hh7Op4NMitS1QaIeeAnMAlqLyAeuU6IJWN/YAAgh3U/?=
 =?us-ascii?Q?7oTWCuqB6G1RgnaiD78ie2wsuc2dgi4s61jcDa6jaaadbuq+MEjqlMiiqVrB?=
 =?us-ascii?Q?w6Jho+1fnLWTizOlweK+v5pUTt1AM960CjLRYhzNuDg2epIRBq1rpSJ0Bcua?=
 =?us-ascii?Q?YQVi8Da9joq+ziwe/nmFgWqHcdhZZpDlst++4nxVUDkUDTc6zaNquxZAsOLd?=
 =?us-ascii?Q?JBAYd0d95/rd3aX4OVtR1xbhTNE5dtOXM0atEyWLKqGzDhcfVDmzKtxn+t2X?=
 =?us-ascii?Q?Q6mlGqYANCLlxRSr/K+K159caBjUUvybuJajcQJE6ODSOfeLROXWWS6iUQyu?=
 =?us-ascii?Q?pRVg502prxsP8X3IqkOQpcX0raJ1PIUuc4P/cX2Dp0gA+2CGyVTMKC2XG+Sg?=
 =?us-ascii?Q?fTB9pUqk+iI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mc91RzcOOmQekzeIlE9t+txk5SCMHpfcPiOaC1QQ3gehQniJrESz3ptHWypI?=
 =?us-ascii?Q?XYMyLJlKJeZIbN0212r85LlpMAaN4+FJT641hd6etBmFoF9uUEstGkb4gz2o?=
 =?us-ascii?Q?hFMEc1sijjsG3j1qJ7Z3XfBzVeJgTP5f7A3A+gs4xB0vrxsANZXEJ+qpvcRn?=
 =?us-ascii?Q?On9kDzoYDpN71HFngqSnH58AcbKmP4NtFtFes0xbNMKV8iDj/6hEmsoHngvb?=
 =?us-ascii?Q?SHziv8qZIA2l65sEuDn71xpy7r0ho0+TeCWe/uDaUMQlCtfc8PJub8wZQwje?=
 =?us-ascii?Q?eggMbJwF8HLyddIjcOX8H5xdrf8aNplN8oXfjmc4rtwL4PHsSId0aOy2UsD/?=
 =?us-ascii?Q?zOAUaGRADfIHpI8kb2qRPCmJFpz5ibxXzMHfo5m/TvbOIcUn/B2CSGTi2JZ8?=
 =?us-ascii?Q?DwNRDzIP0dirl0sZw9mzdcJgVxO+kG/Co/M5gVxgfbNXndWfWZivC74WLE6J?=
 =?us-ascii?Q?oguBsJHRonCvdHkx2ofZylSwX/7MU6jLQ20+qGNtNbviyOX1xcYhlOhSSvUL?=
 =?us-ascii?Q?pqpJJFoUsL6UtLkUY6FgFydc9kYc1WZwvGIq/mxyHG1yYgXUDACM/5VlGpvj?=
 =?us-ascii?Q?ZFbOT/ajInnsmGWCk9Ai25iEtwieZtrekfQGsacGGFQk9Pkox3jpujOiWJMR?=
 =?us-ascii?Q?tKjqDNnA5ei4twQwz2/oxsIaX9L8mrcbsI3mB6V1S3obB0F4XZfpIW/fy1MR?=
 =?us-ascii?Q?DIMuaqdvIlZxkL+6DxDNXiRwN/K2jX1NNtbew1ANkc4kv7JBQ1MTatjmT0hh?=
 =?us-ascii?Q?numZg3bZyvJVWMdSgoi/Vn1LRcQtW3jPokhSlrofNJ1mRMVvXBb5wBlgLkJG?=
 =?us-ascii?Q?c9ugetFbzWI/36vCewnzs7DfPmX2bZ/s5snB00v/NlK7ad2NgzhaCYvsboye?=
 =?us-ascii?Q?PxzTR/XsoqfksCxOyU3zatjxxedSl7PB8JmdHb+uqj6oW8BRKCFb/Y9kUnAV?=
 =?us-ascii?Q?Jyi7VkrDZHDkW84UhF17DdDV+pNmuXMSgivhPimF74SWpgeZ90gkVXgZQCnA?=
 =?us-ascii?Q?2kGQARAjnJs3qCWD7Krm7JphkwSEaEe7PDT2NeE8oGWGmhDknjlx3UAIAOwq?=
 =?us-ascii?Q?RDQTO9crh4Xo83WKBprEQh8VllQqcC6zbTRUU6smgft7Iag9pnBqlD4Pqs3I?=
 =?us-ascii?Q?l0Auf1N+4Xj/sf9kq+RBad4DiW8AZn/SArGiyPtTk9KmGwn3hBt9GORygTYy?=
 =?us-ascii?Q?fmQlEoOyxHSDSO4Nd92byo4tio0PGXxFlmWIJn91C2GbyWcf+s5dr5EMGMQF?=
 =?us-ascii?Q?eY6VHz3ZbvxjWXGyO7ociIBFt4tOTPlP8mcpC1bb8EbeAMI8x14VxABAKgqh?=
 =?us-ascii?Q?CCeBsSQ+HIdXzzGxmmY27YuoC5wdXc5PKLVMSs/J8sBD/rCzRByYm1VZRHH3?=
 =?us-ascii?Q?wUF3iFeyftHMERhKUP/CIcNkGZ4WMC65Qe8FquCywiM2uY9zWS/wlq6oIhK9?=
 =?us-ascii?Q?vGQiQIpsTI8wyUcJdPT8uMVf/rzvzb9aZRwZIIXuUvM8rOaaaquO4vvzpfZN?=
 =?us-ascii?Q?Ih92hgEyBO19fFNfNcvg+1mYjhu+/irTDQL0UuLA3jAvtpSShREL5U8/k/pO?=
 =?us-ascii?Q?K/MNCqeURYwqlBZPz9AxcgnhQfA5K97y8bXHvL4g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dfb7b6-04f0-4daf-88fd-08ddbf9376a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 09:23:43.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yFslx4vwHek4p3NNypWmOnRqLT8UvOtw4aMOwe72ErhsguGWkTGK973nRLt6lrHnQ52SKSUtg5b3GrpXDM65w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9471

On Wed, Jul 09, 2025 at 05:09:17PM +0200, Andrew Lunn wrote:
> On Wed, Jul 09, 2025 at 02:26:53PM +0300, Ioana Ciornei wrote:
> > There are GPIO controllers such as the one present in the LX2160ARDB
> > QIXIS CPLD which are single register fixed-direction. This cannot be
> > modeled using the gpio-regmap as-is since there is no way to
> > present the true direction of a GPIO line.
> > 
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
> 
> This is not my area, so i will deffer to the GPIO
> Maintainers. However, it is not clear to me what get_direction()
> should return. Is it the current direction, or the supported
> directions? Maybe it should be called get_fixed_direction()?
> 
> I then wounder how it will be implemented. Since it is fixed, it is
> probably just a constant bitmap, and you look at the offset bit in
> this batmap? At minimum a ready made helper could be provided, or
> rather than have this op, just provide the bitmap, and gpio-regmap.c
> can look at the bit in the bitmap?
>

That is indeed possible and would save us from an extra callback that
doesn't do much, it just looks into the same kind of bitmap that
gpio-regmap could just have access to directly.

I will wait for feedback from the GPIO maintainers but I do like the
idea.

Thanks!

