Return-Path: <linux-gpio+bounces-9227-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4FB961690
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F71A285AAA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7381D2795;
	Tue, 27 Aug 2024 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hf0TcZq6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8581D279D;
	Tue, 27 Aug 2024 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782509; cv=fail; b=Gkxxb+WjQi8jsRB4oshbFd5nmYN9YRCCOI7oWMTIWF9HNayFLNjFcYAYBb6Wgw4vZ/h1XA5inR4JDJIhqrBeYzQKFGIqmHkQn4a+JhOoe83zAJSe7OXskLibz1mpzo19Lp5Z3iOG0H6fTR3bsTaPhi3zljlRMJpZDz+S/SNurvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782509; c=relaxed/simple;
	bh=HW7nsYGqvaWcH0UojoGZfvkVdT4bAMbbn9ga3JveTT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EarGNKZ5OaEsV9+mjM8rx2+X4otUVwSS2fg/r3QtUK0mCFOIjoTJU6dwnAbQ50qLA9/OkaxAvp0qerpk6N+FrUUY/YcIH4OTtDschpL0i2rGlD7T1v8Y+1qptKBYZiCjg/akMOZsmbTLUxW9Qwe0VliLUeQWDwSV/RhjD4KgL2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hf0TcZq6; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMgNOudFNCOPI/h89b6+YJ4M4hfd9X0JL8za8HUv5j9iIwcWcAeugpDLN4OsohO0ZBuBYvBUcNgRZfEjbXc/0Uuf0F5TOxjS5Zxdk1PZhSN1L5VAvzqCiuguuE3Z7CnKbeCeb5Wei72nm/UPgU1gdvMTqolW6E61W+V0Ze9b6sRzIRiyl8qRCsEQpACoqo9fYqZIEXknd6liZYnVgTDSJ9fwP+2TabXWtgDC7bLpEacf4oVrawstmAsSR4MowH4hIQ0488QhTjkQlMl8cXj3sHTfwz5G7Sv8Sw5j/PQaZ+M395kuOuoWwJzP38HxZGWbbeb5/kQIYFa6ovMaulfiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYci2bdFlRXuXOlj3V2jnS3UjDIcGu47AQUBOEUDtFw=;
 b=RP+3ZFyNABtuIDjc7zgMPYduErdUv+qlzVbFpWTqF+MFJnV8IBvpTYGvfmdC62x5BGj6Wz/kPNTvWaCsQeHBDXOZUw6zMyHoERy5RT5ecoVporhqQJ4vSIbEfxNXmX8h/WBxBRjEYU0vji4FiD7GpjifeHAxJEXSMwLNv3C1YkUURaWAAHkw4irdxdOScrmNyHvT6kf3t737DRUhzL3sGfvqmH4ATmgyVwCoSvxUwOJj0qQ5Ggu3jsGqFBXZxkq+f76ZXC64cXKeNxiIKYJ9JtfimIybQv+G4N0vJCEXXUBP8qpaNG1/fKY3knB71a4GResSvEZeJdx3uIiUflB+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYci2bdFlRXuXOlj3V2jnS3UjDIcGu47AQUBOEUDtFw=;
 b=Hf0TcZq6m13jxM2iahMteB6/GlzGrUB6rUq7uyROZqYHdsLk3RuqlpWEmfD8XQxdCtlGfmBBYJr6SEcp0m6NYjZLt7fohwyHPH/we4YRw0nLKwaOF9wfsu3/M2tRQ2c6B1NYXI7vZShTdHKGkzkyW8PtMOHjEr+87Xb15YTkuj1vMgksUCrppF09f1PwoIiZiAA1Eqg9RSOqVJ3ir8BGl+GDDtsT51IVcKVm+aJCLH9+r9eQyC3/oyh3n96+Ca6jDA0TmjlqtwxKYD2NkUK6o5KH2ZcLnP0r2wwzxV0QEMHULf+b0zqo3uKwwCAfKGGjLbtRcCNvMa+UBGLocbCaww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 27 Aug
 2024 18:15:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 18:15:02 +0000
Date: Tue, 27 Aug 2024 14:14:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Leonard <David.Leonard@digi.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: ls1012a: Add pinctrl driver support
Message-ID: <Zs4XngympYeWcwnY@lizhi-Precision-Tower-5810>
References: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com>
 <Zs4W9EGSCFfxDgq9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs4W9EGSCFfxDgq9@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: f690c4b2-6d98-438b-04c3-08dcc6c42b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e8RnGxT848ixcpf4cSuxOWWV9ypQJd8khYDi5ij9ACWcIQerkjCtxtByVIXc?=
 =?us-ascii?Q?tKnWfzS/jjtHAy4yTwoLArJMb5XxAxR2ZS+lCD4E3f49L3oGjflvJ6xaUcBL?=
 =?us-ascii?Q?rqAFYZg0Y87/JYKUQ3K0U+OtnQTY+ntqK/80X3EwbsI6hDnKnCRqM47SFmtN?=
 =?us-ascii?Q?5GKMALBWwL571QE+hCE6IXKwIC/ks/LYIv0P1eCnHBR44QOTE7MT+Dm9aQJW?=
 =?us-ascii?Q?ojoK2pcGCkL5G6bQYh1iK+cOzBgVDjSpfv9+/xs03KHclAqJn6U1L/2MFnVg?=
 =?us-ascii?Q?hadwhzKlsxkCXFD0PLBUd9zxBtx4pjrQCrSZEzaC3I1xVgn/UiE7Dw7or6oG?=
 =?us-ascii?Q?sLaVy2mpSyVYo2dkVq3qaXKtMiXp7gY5TnR2QApf9nsp0BiHsRnuJxRlKkUc?=
 =?us-ascii?Q?mMTsJ3Yg44IAsUgBDpbOyL6Hnqyaq7BPXZst19e/r1+2CBLOhurx/7P+nr/s?=
 =?us-ascii?Q?I2kpXeDh9eoP8yglg2jdO76/F0lJy8szlBxZ/XDdh7E5LKz2eStQBKral9K3?=
 =?us-ascii?Q?k+0O7g0z39EJVhyXzbdMlc2UCUpS6REOkOT5/MdbTVMNuJZYtEHCn17YhWC0?=
 =?us-ascii?Q?sxle0s0P7BdoOtculTEGNBpsXMM5UiSBFfxCBMg7NFnrcwMwcesGyhZiYbB0?=
 =?us-ascii?Q?+IdQZuPFjr/Bq1Wmh/3gz7425jrtnUdKAMhgaDxglxATmPg5U+PXClTWUx8F?=
 =?us-ascii?Q?i4jOB7MLflLlKwdx8wIpKlW2fbxrrFL0aAb6nixZovANLsy2SIMrId08yWt1?=
 =?us-ascii?Q?cRra2T09kxJGwI6H2mPvgWzBjcf8BzdiT7lWuUgQMMXhHKqqNiTKKEXK3qVv?=
 =?us-ascii?Q?Nm/cnCGTPSDapIgAAKsngMOZUwCLNsPWqVQgInkRZt7Y68+HLkM/NDpGXsot?=
 =?us-ascii?Q?YZwjBLRpxtEHc3qXrBa/dy4JpCLkBjdvV3XocSry0TQvpijGC+zfR0kkOfbt?=
 =?us-ascii?Q?FvYQoSVFQDeWHEnEdXCqFkoE1R79nVpfm1mw91zDD07ZgteEtXEsueZ7xeAX?=
 =?us-ascii?Q?PNo1sukfHwfCqspbnHYTzNtdbWmd6uuRhtVyMniHfGeUu8ahPURFSqkU8iif?=
 =?us-ascii?Q?OJvn3T/OLldLcKPDFPnm6frmNhcMtrTxabVIX54hciLd1CavIsK2RA9MUSvc?=
 =?us-ascii?Q?yuPzaxGAs7rMu8P/uOAyLkvZwuYS0DP+PEXD6qVrlptZ9slOlyfN+3e4sGLN?=
 =?us-ascii?Q?OGRt9SqFBeCynFoWXRreAna2DCKO11pcON8mAHom9XWbhTlp8F2kBYoEcivv?=
 =?us-ascii?Q?2/CteIc27v/NmJDGokjblvI9EluAozVuBe9WcXQcjlTJDelteVLYWNePtgR/?=
 =?us-ascii?Q?WxFSDDHJ5PB3K95jDsPHecYXX/TVf5+0a5g7kgy7sziBDTfaBcMbVGBLrD3W?=
 =?us-ascii?Q?tMeXaeunvElmJDHi5PStNKAjLlnkA0U+GGmJ4RKIqczjkSSljA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EHBIpw2+YHdRsdQjDBATjlWl+Ydbs7KDitb1nxcM1HLz6nTavp6bQ3XCamMO?=
 =?us-ascii?Q?d5DYsYc8Biy+tOSW7dUd8aumAWRI838E7Y1GvchL3qDeSOIolF77+hka2vUg?=
 =?us-ascii?Q?z2YL2uery608iwHurbnmLlxu9m5B5yWDaaRUynAca5e3chcyCwpuXIqdKYnd?=
 =?us-ascii?Q?ckNODwTVaXmEfmOf5XSdQjiNolthW/C6Tv4VmmkYGYJb+cEsbzfo9QdlKr4l?=
 =?us-ascii?Q?3iysC4YBK2nNvH/NeSfP4+YX8fxrgWJwdAycjPaav5RzPDYSZYUi8KdBtgwr?=
 =?us-ascii?Q?qQNq2q222z38Nb2KMFPmBfWnrisu+TK8nzeQhv654adZYk9/tWrQMWWdFwDn?=
 =?us-ascii?Q?HkxDYl+hZ9rToSfHsA/07eNzpIggGKN070hBD+fw2YHelATYMmqF9rGwzUNA?=
 =?us-ascii?Q?1drl7l/qyKNGk/YJJdAD1IptS1yxp6FXhJKFsnJdMpnYdcOSe7suAx5UManf?=
 =?us-ascii?Q?zwtrV7BFijKULyzJl854al4FGf3Oe3frgzHkmmwtcuSe800yH4vswm1fG2k0?=
 =?us-ascii?Q?5OxvKFf6pdL9qB1DyZuI8R2goFBQJrxlykRVSaXTptgBiSNkP1r0TfdIfZWc?=
 =?us-ascii?Q?UmsWYlJ1mr0SRRYp/3yIIfda+Faj3FJnYrYg0YTnQHI+kFZ6x7+fi76/h5x8?=
 =?us-ascii?Q?43NlUkvweJY2B7GMMMB3XGss2SWfsiLc341kMQI5dngCPnxKJTvFTIXllGtq?=
 =?us-ascii?Q?0hxcDqdd21dw7iftuVYCtAOLIqEFuhHK+qAFvyfKXQETCeXglbM0qe4BgK4Y?=
 =?us-ascii?Q?gDK5XC7GTqKQNkzjrj9c+CaG+u9LFnxGjm4htSONNx05KYMaQNj5KKYxONJX?=
 =?us-ascii?Q?QS5LUyqxqDHOsHvv3dW6zGMJXV7gGCdrpV9Gnx0POgs5n5rpnTnhF9OjYzKV?=
 =?us-ascii?Q?TV5D4xTJad3zM865cIHHtG8Rzn2v0sIgPQ53j+coyk4CEK0xrw8AVs/EMAbI?=
 =?us-ascii?Q?rLx5YNo884TXRRenSaIMcjWCaXquvcES6biiaMhAHVdi3c5fD8X8UhMSxY6i?=
 =?us-ascii?Q?Z+boO27OUouMpj5y7m0B9Ve+eZ+jUMBhLJjss+ecKi8EL9SBubeDx1JkyNSn?=
 =?us-ascii?Q?xwsgawewLgPFNd0XE0oEGgJoIqoWKMmq/q0CNdRtS+ZWxzNVLMuCCFKZXxSr?=
 =?us-ascii?Q?jnRM0y8MJHS6SKufH//b/k2yDKcWUEM94cXj16dWAKk40b7N5j8rLoaa4pgn?=
 =?us-ascii?Q?9J0O5Wm9/6l9pNXC9haK+c+jRFVwtypmKusfD9mqslOCx947wAz/0zt3SLvm?=
 =?us-ascii?Q?3b2zUe/lO/7LA7igJmlaU3Um5OwYQceyD9//tJdqqZY+C/06eq5RlqEL4yB7?=
 =?us-ascii?Q?ozFN7ClO2i3oxcldge2cDyzC5oRFSS2L7+m8OyKnq/rS/Hck155H+ZlizIOc?=
 =?us-ascii?Q?VPzjR4/bwdLFZEKVSGmHFsS+LX1zNVVjjLeHlwf3GqmIxHFsIGSRhFUPioW2?=
 =?us-ascii?Q?4TQsk68H5YGZ3Wr5CESw6W6NIjW1ju+ytN3dVJnrZa8z6s6Z5HsOw6vfTL1O?=
 =?us-ascii?Q?TAGxSDgUeF0sCNLkGxQnDfEEVk0x+0zGtirLxkIo5vrpz1/bVqR0udZzeAXl?=
 =?us-ascii?Q?XJKfQ2gW5oY1YSsZahY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f690c4b2-6d98-438b-04c3-08dcc6c42b4b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 18:15:02.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVo8Xg48ogSQeuw48SjGSI2uuPiqjp0pdpukJHl5IaTlxTzl112izCkf5cVU+UN31wwKtoh+HZIcetTKjdIqvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781

On Tue, Aug 27, 2024 at 02:12:04PM -0400, Frank Li wrote:
> On Tue, Aug 27, 2024 at 12:05:24PM +1000, David Leonard wrote:
> >
> > Add QorIQ LS1012A pinctrl driver, allowing i2c-core to exert
> > GPIO control over the second I2C bus.
> >
> > Signed-off-by: David Leonard <David.Leonard@digi.com>
> > ---
>
> Why not use pinctrl-single ?
>
> You can ref arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
>
> It did similar thing to use GPIO recover i2c bus.
>
> Just need change dts file.

Next time, please cc: imx@lists.linux.dev

Frank

>
> Frank
>
>
> >  drivers/pinctrl/freescale/Kconfig           |   8 +
> >  drivers/pinctrl/freescale/Makefile          |   1 +
> >  drivers/pinctrl/freescale/pinctrl-ls1012a.c | 381 ++++++++++++++++++++
> >  3 files changed, 390 insertions(+)
> >  create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1012a.c
> >
> > diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> > index 3b59d7189004..a2038042eeae 100644
> > --- a/drivers/pinctrl/freescale/Kconfig
> > +++ b/drivers/pinctrl/freescale/Kconfig
> > @@ -209,6 +209,14 @@ config PINCTRL_IMX93
> >  	help
> >  	  Say Y here to enable the imx93 pinctrl driver
> >
> > +config PINCTRL_LS1012A
> > +	tristate "LS1012A pinctrl driver"
> > +	depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
> > +	select PINMUX
> > +	select GENERIC_PINCONF
> > +	help
> > +	  Say Y here to enable the ls1012a pinctrl driver
> > +
> >  config PINCTRL_VF610
> >  	bool "Freescale Vybrid VF610 pinctrl driver"
> >  	depends on SOC_VF610
> > diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
> > index d27085c2b4c4..6926529d8635 100644
> > --- a/drivers/pinctrl/freescale/Makefile
> > +++ b/drivers/pinctrl/freescale/Makefile
> > @@ -35,3 +35,4 @@ obj-$(CONFIG_PINCTRL_IMX25)	+= pinctrl-imx25.o
> >  obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
> >  obj-$(CONFIG_PINCTRL_IMXRT1050)	+= pinctrl-imxrt1050.o
> >  obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
> > +obj-$(CONFIG_PINCTRL_LS1012A)	+= pinctrl-ls1012a.o
> > diff --git a/drivers/pinctrl/freescale/pinctrl-ls1012a.c b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
> > new file mode 100644
> > index 000000000000..d4c535ed6c07
> > --- /dev/null
> > +++ b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
> > @@ -0,0 +1,381 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +/*
> > + * Pin controller for NXP QorIQ LS1012A.
> > + *
> > + * Copyright (c) 2024 Digi International, Inc.
> > + * Author: David Leonard <David.Leonard@digi.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/pinmux.h>
> > +#include <linux/pinctrl/pinconf-generic.h>
> > +#include <linux/of.h>
> > +#include <linux/io.h>
> > +#include <linux/regmap.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/sys_soc.h>
> > +
> > +struct ls1012a_pinctrl_pdata {
> > +	struct pinctrl_dev *pctl_dev;
> > +	void __iomem *cr0mem;
> > +	bool big_endian;
> > +	u32 ssc;
> > +};
> > +
> > +/* Bitfield macros for masks and values that follow the datasheet's
> > + * bit numbering schemes for registers of different bit-endianess. */
> > +#define BITV_BE(hi, v)	((v) << (31 - (hi) % 32))
> > +#define BITM_BE(hi, lo)	(((1 << ((hi) - (lo) + 1)) - 1) << (31 - (hi) % 32))
> > +#define BITV_LE(lo, v)	((v) << ((lo) % 32))
> > +#define BITM_LE(lo, hi)	(((1 << ((hi) - (lo) + 1)) - 1) << ((lo) % 32))
> > +
> > +/* SCFG PMUXCR0 pinmux control register */
> > +#define SCFG_PMUXCR0			0x430
> > +#define QSPI_MUX_OVRD_MASK		BITM_BE(0, 0)	/* [0] */
> > +#define QSPI_MUX_DISABLE		BITV_BE(0, 0)	/*  use RCW */
> > +#define QSPI_MUX_ENABLE			BITV_BE(0, 1)	/*  use PMUXCR0 */
> > +#define QSPI_DATA0_GPIO_OVR_MASK	BITM_BE(1, 1)	/* [1] */
> > +#define QSPI_DATA0_GPIO_SEL_SPI		BITV_BE(1, 0)	/*  DATA0,SCK,CS0 */
> > +#define QSPI_DATA0_GPIO_SEL_GPIO	BITV_BE(1, 1)	/*  GPIO1[4,11,5] */
> > +#define QSPI_DATA1_GPIO_OVR_MASK	BITM_BE(3, 2)	/* [3:2] */
> > +#define QSPI_DATA1_GPIO_SEL_SPI		BITV_BE(3, 0)	/*  DATA1 */
> > +#define QSPI_DATA1_GPIO_SEL_GPIO	BITV_BE(3, 1)	/*  GPIO1[12] */
> > +#define QSPI_IIC2_OVR_MASK		BITM_BE(5, 4)	/* [5:4] */
> > +#define QSPI_IIC2_SEL_GPIO		BITV_BE(5, 0)	/*  GPIO1[13,14] */
> > +#define QSPI_IIC2_SEL_I2C		BITV_BE(5, 1)	/*  SCL,SDA (rev0) */
> > +#define QSPI_IIC2_SEL_SPI		BITV_BE(5, 2)	/*  DATA2,DATA3 */
> > +
> > +/* RCW SoC-specific configuration (read-only) */
> > +#define DCFG_RCWSR			0x100
> > +#define SOC_SPEC_CONFIG			416		/* word 13 */
> > +#define DCFG_SSC_REG			(DCFG_RCWSR + SOC_SPEC_CONFIG / 8)
> > +#define SSC_DATA0_GPIO_MASK		BITM_LE(421, 421)
> > +#define SSC_DATA0_GPIO_SEL_SPI		BITV_LE(421, 0)	/*  DATA0,SCK,CS0 */
> > +#define SSC_DATA0_GPIO_SEL_GPIO		BITV_LE(421, 1)	/*  GPIO1[11,4,5] */
> > +#define SSC_DATA1_GPIO_MASK		BITM_LE(422, 423)
> > +#define SSC_DATA1_GPIO_SEL_SPI		BITV_LE(422, 0)	/*  DATA1 */
> > +#define SSC_DATA1_GPIO_SEL_GPIO		BITV_LE(422, 2)	/*  GPIO1[12] */
> > +#define SSC_IIC2_MASK			BITM_LE(424, 425)
> > +#define SSC_IIC2_SEL_GPIO		BITV_LE(424, 0)	/*  GPIO1[13,14] */
> > +#define SSC_IIC2_SEL_I2C		BITV_LE(424, 2)	/*  SCL,SDA */
> > +#define SSC_IIC2_SEL_SPI		BITV_LE(424, 1)	/*  DATA2,DATA3 */
> > +#define SSC_IIC2_SEL_GPIO_RESET		BITV_LE(424, 3)	/*  GPIO1[13],RESET_REQ_B*/
> > +
> > +const struct pinctrl_pin_desc ls1012a_pins[] = {
> > +	PINCTRL_PIN(60, "QSPI_A_DATA3/GPIO1_14/IIC2_SDA/RESET_REQ_B"),
> > +	PINCTRL_PIN(61, "QSPI_A_DATA1/GPIO1_12"),
> > +	PINCTRL_PIN(62, "QSPI_A_SCK/GPIO1_04"),
> > +	PINCTRL_PIN(122, "QSPI_A_DATA2/GPIO1_13/IIC2_SCL"),
> > +	PINCTRL_PIN(123, "QSPI_A_DATA0/GPIO1_11"),
> > +	PINCTRL_PIN(124, "QSPI_A_CS0/GPIO1_05"),
> > +};
> > +
> > +static const unsigned int qspi_1_grp[] = { 62, 123, 124 };
> > +static const unsigned int qspi_2_grp[] = { 61 };
> > +static const unsigned int qspi_3_grp[] = { 122, 60 };
> > +
> > +#define GRP_qspi_1	0	/* SCK,CS0,DATA0 */
> > +#define GRP_qspi_2	1	/* DATA1 */
> > +#define GRP_qspi_3	2	/* DATA2,DATA3 */
> > +#define _GRP_max	3
> > +
> > +#define _PINGROUP(name) \
> > +	[GRP_##name] = PINCTRL_PINGROUP(#name "_grp", name##_grp, ARRAY_SIZE(name##_grp))
> > +static const struct pingroup ls1012a_groups[] = {
> > +	_PINGROUP(qspi_1),
> > +	_PINGROUP(qspi_2),
> > +	_PINGROUP(qspi_3),
> > +};
> > +
> > +
> > +static void ls1012a_write_cr0(struct ls1012a_pinctrl_pdata *pd, u32 val)
> > +{
> > +	if (pd->big_endian)
> > +		iowrite32be(val, pd->cr0mem);
> > +	else
> > +		iowrite32(val, pd->cr0mem);
> > +}
> > +
> > +static u32 ls1012a_read_cr0(struct ls1012a_pinctrl_pdata *pd)
> > +{
> > +	return pd->big_endian ? ioread32be(pd->cr0mem) : ioread32(pd->cr0mem);
> > +}
> > +
> > +static int ls1012a_get_groups_count(struct pinctrl_dev *pcdev)
> > +{
> > +	return ARRAY_SIZE(ls1012a_groups);
> > +}
> > +
> > +static const char *ls1012a_get_group_name(struct pinctrl_dev *pcdev,
> > +	unsigned int selector)
> > +{
> > +	return ls1012a_groups[selector].name;
> > +}
> > +
> > +static int ls1012a_get_group_pins(struct pinctrl_dev *pcdev,
> > +	unsigned int selector, const unsigned int **pins, unsigned int *npins)
> > +{
> > +	*pins = ls1012a_groups[selector].pins;
> > +	*npins = ls1012a_groups[selector].npins;
> > +	return 0;
> > +}
> > +
> > +static const struct pinctrl_ops ls1012a_pinctrl_ops = {
> > +	.get_groups_count = ls1012a_get_groups_count,
> > +	.get_group_name = ls1012a_get_group_name,
> > +	.get_group_pins = ls1012a_get_group_pins,
> > +	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
> > +	.dt_free_map = pinconf_generic_dt_free_map,
> > +};
> > +
> > +static const char * const i2c_groups[] = { "qspi_3_grp" };
> > +static const char * const spi_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
> > +static const char * const gpio_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
> > +static const char * const gpio_reset_groups[] = { "qspi_3_grp" };
> > +
> > +#define FUNC_i2c	0
> > +#define FUNC_spi	1
> > +#define FUNC_gpio	2
> > +#define FUNC_gpio_reset 3
> > +#define _FUNC_max	4
> > +
> > +#define _PINFUNC(name) \
> > +	[FUNC_##name] = PINCTRL_PINFUNCTION(#name, name##_groups, ARRAY_SIZE(name##_groups))
> > +static const struct pinfunction ls1012a_functions[] = {
> > +	_PINFUNC(i2c),
> > +	_PINFUNC(spi),
> > +	_PINFUNC(gpio),
> > +	_PINFUNC(gpio_reset),
> > +};
> > +
> > +static int ls1012a_get_functions_count(struct pinctrl_dev *pctldev)
> > +{
> > +	return ARRAY_SIZE(ls1012a_functions);
> > +}
> > +
> > +static const char *ls1012a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
> > +{
> > +	return ls1012a_functions[func].name;
> > +}
> > +
> > +static int ls1012a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
> > +	const char * const **groups,
> > +	unsigned int * const ngroups)
> > +{
> > +	*groups = ls1012a_functions[func].groups;
> > +	*ngroups = ls1012a_functions[func].ngroups;
> > +	return 0;
> > +}
> > +
> > +/*
> > + * LS1012A
> > + *    Group: qspi_1             qspi_2      qspi_3
> > + *           ================== =========== =============
> > + *    Pin:   62    123    124   61          122    60
> > + *           ----- ------ ----- ----------- ------ ------
> > + * i2c                                      SCL    SDA    (RCW only)
> > + * spi       SCK   DATA0
> > + * spi       SCK   DATA0        DATA1
> > + * spi       SCK   DATA0        DATA1       DATA2  DATA3
> > + * gpio      GPIO4 GPIO11 GPIO5
> > + * gpio                         GPIO12
> > + * gpio                                     GPIO13 GPIO14
> > + * gpio_reset                               GPIO13 REQ_B  (RCW only)
> > + */
> > +
> > +static const struct ls1012a_func_mux {
> > +	u32 cr0mask, cr0; /* mux control */
> > +	u32 sscmask, ssc; /* equivalent in RCW */
> > +} ls1012a_func_mux[_FUNC_max][_GRP_max] = {
> > +	[FUNC_i2c] = {
> > +		[GRP_qspi_3] = {
> > +			.sscmask = SSC_IIC2_MASK,
> > +			.ssc =     SSC_IIC2_SEL_I2C,
> > +		},
> > +	},
> > +	[FUNC_spi] = {
> > +		[GRP_qspi_1] = {
> > +			.cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
> > +			.cr0 =     QSPI_DATA0_GPIO_SEL_SPI,
> > +			.sscmask = SSC_DATA0_GPIO_MASK,
> > +			.ssc =     SSC_DATA0_GPIO_SEL_SPI
> > +		},
> > +		[GRP_qspi_2] = {
> > +			.cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
> > +			.cr0 =     QSPI_DATA1_GPIO_SEL_SPI,
> > +			.sscmask = SSC_DATA1_GPIO_MASK,
> > +			.ssc =     SSC_DATA1_GPIO_SEL_SPI,
> > +		},
> > +		[GRP_qspi_3] = {
> > +			.cr0mask = QSPI_IIC2_OVR_MASK,
> > +			.cr0 =     QSPI_IIC2_SEL_SPI,
> > +			.sscmask = SSC_IIC2_MASK,
> > +			.ssc =     SSC_IIC2_SEL_SPI,
> > +		},
> > +	},
> > +	[FUNC_gpio] = {
> > +		[GRP_qspi_1] = {
> > +			.cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
> > +			.cr0 =     QSPI_DATA0_GPIO_SEL_GPIO,
> > +			.sscmask = SSC_DATA0_GPIO_MASK,
> > +			.ssc =     SSC_DATA0_GPIO_SEL_GPIO,
> > +		},
> > +		[GRP_qspi_2] = {
> > +			.cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
> > +			.cr0 =     QSPI_DATA1_GPIO_SEL_GPIO,
> > +			.sscmask = SSC_DATA1_GPIO_MASK,
> > +			.ssc =     SSC_DATA1_GPIO_SEL_GPIO,
> > +		},
> > +		[GRP_qspi_3] = {
> > +			.cr0mask = QSPI_IIC2_OVR_MASK,
> > +			.cr0 =     QSPI_IIC2_SEL_GPIO,
> > +			.sscmask = SSC_IIC2_MASK,
> > +			.ssc =     SSC_IIC2_SEL_GPIO,
> > +		},
> > +	},
> > +	[FUNC_gpio_reset] = {
> > +		[GRP_qspi_3] = {
> > +			.sscmask = SSC_IIC2_MASK,
> > +			.ssc =     SSC_IIC2_SEL_GPIO_RESET,
> > +		},
> > +	},
> > +};
> > +
> > +static int ls1012a_set_mux(struct pinctrl_dev *pcdev,
> > +	unsigned int func, unsigned int group)
> > +{
> > +	struct ls1012a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
> > +	const struct ls1012a_func_mux *fm = &ls1012a_func_mux[func][group];
> > +	u32 cr0 = ls1012a_read_cr0(pd);
> > +
> > +	if (!fm->cr0mask) {
> > +		if ((pd->ssc & fm->sscmask) != fm->ssc)
> > +			return -EOPNOTSUPP;
> > +		cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_DISABLE;
> > +	} else {
> > +		cr0 = (cr0 & ~fm->cr0mask) | fm->cr0;
> > +		if ((pd->ssc & fm->sscmask) != fm->ssc)
> > +			cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_ENABLE;
> > +	}
> > +	ls1012a_write_cr0(pd, cr0);
> > +	return 0;
> > +}
> > +
> > +static void ls1012a_init_mux(struct ls1012a_pinctrl_pdata *pd)
> > +{
> > +	unsigned int func, group;
> > +	const struct ls1012a_func_mux *fm;
> > +	u32 cr0;
> > +
> > +	cr0 = ls1012a_read_cr0(pd);
> > +	if ((cr0 & QSPI_MUX_OVRD_MASK) == QSPI_MUX_DISABLE) {
> > +		/*
> > +		 * Prepare a disabled MUXCR0 to have a same/similar
> > +		 * configuration as RCW SSC, and leave it disabled.
> > +		 */
> > +		for (func = 0; func < _FUNC_max; func++) {
> > +			for (group = 0; group < _GRP_max; group++) {
> > +				fm = &ls1012a_func_mux[func][group];
> > +				if (fm->sscmask &&
> > +				    fm->ssc == (pd->ssc & fm->sscmask)) {
> > +					cr0 &= ~fm->cr0mask;
> > +					cr0 |= fm->cr0;
> > +				}
> > +			}
> > +		}
> > +		ls1012a_write_cr0(pd, cr0);
> > +	}
> > +}
> > +
> > +static const struct pinmux_ops ls1012a_pinmux_ops = {
> > +	.get_functions_count = ls1012a_get_functions_count,
> > +	.get_function_name = ls1012a_get_function_name,
> > +	.get_function_groups = ls1012a_get_function_groups,
> > +	.set_mux = ls1012a_set_mux,
> > +};
> > +
> > +static struct pinctrl_desc ls1012a_pinctrl_desc = {
> > +	.name = "ls1012a",
> > +	.pins = ls1012a_pins,
> > +	.npins = ARRAY_SIZE(ls1012a_pins),
> > +	.pctlops = &ls1012a_pinctrl_ops,
> > +	.pmxops = &ls1012a_pinmux_ops,
> > +	.owner = THIS_MODULE,
> > +};
> > +
> > +static int ls1012a_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +	struct ls1012a_pinctrl_pdata *pd;
> > +	int ret;
> > +	u32 dcfg_ssc;
> > +	struct regmap *dcfg_regmap;
> > +
> > +	pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
> > +	if (!pd)
> > +		return -ENOMEM;
> > +	platform_set_drvdata(pdev, pd);
> > +
> > +	pd->big_endian = device_is_big_endian(&pdev->dev);
> > +
> > +	/* SCFG PMUX0 */
> > +	pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(pd->cr0mem))
> > +		return PTR_ERR(pd->cr0mem);
> > +	dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
> > +		pd->big_endian ? "be" : "le");
> > +
> > +	/* DCFG RCW SSC */
> > +	dcfg_regmap = syscon_regmap_lookup_by_phandle(
> > +		dev_of_node(&pdev->dev), "dcfg-regmap");
> > +	if (IS_ERR(dcfg_regmap)) {
> > +		dev_err(&pdev->dev, "dcfg regmap: %pe\n", dcfg_regmap);
> > +		return -EINVAL;
> > +	}
> > +	ret = regmap_read(dcfg_regmap, DCFG_SSC_REG, &dcfg_ssc);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "dcfg-regmap read: %d\n", ret);
> > +		return ret;
> > +	}
> > +	pd->ssc = swab32(dcfg_ssc); /* untwist RCW fields */
> > +
> > +	dev_dbg(&pdev->dev, "dcfg ssc = %08x (grp1=%s grp2=%s grp3=%s)\n",
> > +		pd->ssc,
> > +		(pd->ssc & SSC_DATA0_GPIO_MASK) == SSC_DATA0_GPIO_SEL_SPI ? "spi" : "gpio",
> > +		(pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_SPI ? "spi"
> > +		: (pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_GPIO ? "gpio"
> > +		: (pd->ssc & SSC_DATA1_GPIO_MASK) == 0x80 ? "10" : "11",
> > +		(pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_GPIO ? "gpio"
> > +		: (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_I2C ? "i2c"
> > +		: (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_SPI ? "spi"
> > +		: "gpio+reset");
> > +
> > +	ls1012a_init_mux(pd);
> > +
> > +	ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1012a_pinctrl_desc,
> > +		pd, &pd->pctl_dev);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
> > +
> > +	pinctrl_enable(pd->pctl_dev);
> > +	return ret;
> > +}
> > +
> > +static const struct of_device_id ls1012a_pinctrl_match_table[] = {
> > +	{ .compatible = "fsl,ls1012a-pinctrl" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +static struct platform_driver ls1012a_pinctrl_driver = {
> > +	.driver = {
> > +		.name = "ls1012a_pinctrl",
> > +		.of_match_table = ls1012a_pinctrl_match_table,
> > +	},
> > +	.probe = ls1012a_pinctrl_probe,
> > +};
> > +
> > +builtin_platform_driver(ls1012a_pinctrl_driver)
> > +
> > +MODULE_DESCRIPTION("LS1012A pinctrl driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.0
> >

