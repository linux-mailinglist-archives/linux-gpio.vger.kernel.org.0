Return-Path: <linux-gpio+bounces-26279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0676B7D8B4
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3173BB489
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3725E3016EB;
	Wed, 17 Sep 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qox4nZRe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B732F618A;
	Wed, 17 Sep 2025 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758094846; cv=fail; b=EtgSf7oLxYnRRXNSJCxLP21b6jV15MBDTDxGBCulCKCLxlfqsafoCViR3KZzMnZbv9uGfRuOiDEgMGBLSAva1n3yVVMjNniyv+ki4Cyzq2nzqJcQ7cQimqkyoiRtHAy0gTiFhoNItLjLr/UlCG067ERuVJOJ9qLPpBq0re1FxO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758094846; c=relaxed/simple;
	bh=jRrV8LcYU68ahx2PMI+977xZGStcKCQXLU3qpw+oiJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cnmelH3vYf5wIJ2Wa/EGJqoooX9ga/Lfm9P5UotlGNTLLYs8VRp8kBzFIBxHuttvS3wxaKfVeEMh7WjLDT7sSZMoAbNXBslZ9Jx0HX15EXFPUlsfdeqA/Kxmq7kkrtETXsw+fYRIoB/rr+8CUa+NkvtHEMLAIp2qx8xcG5Bcln0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qox4nZRe; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNVdGJqcHdtV7SbeLAtdAE5FMJCxEkVk6BMlZ0x+2OUmXrIf38UcZWvnrLjM1u/n1be36U74XaYCWoLIKTezIIDZe6GkuUrUdB5Cx6MNDYIivttJQeBAN6aOwbpK1ygHourp/teS5XQx9uer2HUypg4Z1MoIXCuzX3/yP7ThR0WP/7Ulzb4G9mLpu19LYb7QtitpySOrN6XBnPTi8O3fZ2+HAhgiUXRxHGHcgVLqdY3vzyDGst8fWwIgexwYMrcMmcZDgNFGut0oeXxEMrWfdWnye86JV6Vpsf7PrDxVg63azzXYlwk8HNJA95wGqDMYIGfQx2/4thS4D6Q1tx0dwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUcq8i0jtjiwqGBNDn4JeCOIML6YOLMYISZEjoZGfm4=;
 b=aC+OA904pCghoMVJ1n3Zug/MEyrZzkXBV9nWR/nvoVW6MdoBxSsEJ3AYJPfuHBAWQvFD0iemohqjBqxxg4yq8so6uNqZfnsrEanoa6vGkJgaueWkMtSMkIfUzZLJA1qagx2zIVAx45Wj3wghJx545ZXTH3yNyHIayyBNoKZOW7DCYWZcXH0iSdbLr8tt9+7oe4IPytPjjD9KBrqgJfPK1f2ACThbGB4PUmnUA9jQE7GyNVzcetlXJwgR6CqoSUYe4V0Us0onX70euvFFQx9GPcbYVmpZkt/gG99W7cam8vLoGsYse41D4YgXWteRoJRQBqCjp7CU4aYPI6MQmFkVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUcq8i0jtjiwqGBNDn4JeCOIML6YOLMYISZEjoZGfm4=;
 b=Qox4nZReMIj86kE77vnRjODmpB9U6DLrX1bCxFdU3EQ6b1bRYh403LXGPUKMoGJYLDcjmN29D43tjsOJSUDADbWkzlHhHz4zcM5Nmly6hMYdhmG6w0GhhkVJHMGyA5WWqhmlTvOs5Rhe5lu3RYrLGIBC+6zlwlppjW2UE4yZz7kieH1N4gHe/Fi94ZF5ga5oRaRtRfjFNG2ct4mSCCELBXnf5r/EDpGuT5UezWmlcKqRjuTRHSKCfwNoG6O29bGBJebFGLW1W9bPrDeqAPLl51PMh+/79oPzZjBGM2dj0hD4i8YONdxK5dF38sBlVhl13sr0OkMko3+IYlVwQe1Y8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 07:40:39 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 07:40:39 +0000
Date: Wed, 17 Sep 2025 10:40:37 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <jfxasie7r3362tsxscd6bqpoprsj7pgmatlj6jsfgvorkwbor3@xsikgz67p6qb>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-6-ioana.ciornei@nxp.com>
 <aMmSpu/TWOmpHJ60@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMmSpu/TWOmpHJ60@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6ddf1b-933b-4247-d88f-08ddf5bd7fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o0IF3ImQ3wKv7GODKPxpSog7zEAO7wAaoCtjVv7kwKwcSS2DxyD243azPiow?=
 =?us-ascii?Q?o0VAk53FJBb3SS1FfoQhRXqsrqX10AgCiGChaZaXF+Z8e3ySaa1AgvfTQ/qH?=
 =?us-ascii?Q?BiNS88fSUA18YbLGnFE9JYwPcIfGiTTUlnvvVnvR/sKnq6MEwcEoG/rspg2L?=
 =?us-ascii?Q?B/wmamZabrX5l6UJMUMqiaIV4rbxQbblsRXkfajXGjHrXjtHrT1eRG53JoEF?=
 =?us-ascii?Q?QWrUJqcxDhmf5cNxFIa37FWHj1GW3wr7C75BZxrlxdZMGNjWoE//8j7ThV/P?=
 =?us-ascii?Q?nZON3Al1V6c7oAbcugKB3Lj5Itf3mR2GG3gNxpkSvGflmZ1ye1Kdq9IRgLUb?=
 =?us-ascii?Q?2rtoN7HU0bOP5HjHiiKZ1Hvak3evi5rpJof/2zJq78Cw6VvAoLu/Vffqf6xt?=
 =?us-ascii?Q?MLRrhfIAaHkhWIkli1pI4Mrr6VR9WNXdnNn6Sm0qFsi/+ZxDm+Um+O5mShzV?=
 =?us-ascii?Q?aX4FH2U85FDeXDJoASVAcLu48vQiYLuLa9nHNb/5ipjaNQ4OsKZ2kMgFbmU7?=
 =?us-ascii?Q?H5UEAmfOl5cATpUkElvV+6OYMX4FtcW0PRYNiVHMr7zsD07+D8p5ctPYWZ0Z?=
 =?us-ascii?Q?K+IMlw8y0BeuLoTPg0ouXPUodd5uCAzHUd25w27q8fr2KKoG0gGD7ytAKv+J?=
 =?us-ascii?Q?oFYoeCDzNwjT4tylkGZwb26EabZgjiv6tJbu3TCXF3wx2LhqNF8KTW5Drgll?=
 =?us-ascii?Q?+vz7LM8Sf5aAgUuf6usJzJ+sVa2LxUAqvTBSjUUTRaAn+iS5RJ8qtd0+4+vX?=
 =?us-ascii?Q?is52iGCNm/F/hFtu5mGQf9bY8xQVbZwwGSF/muLpWqT7AFGzhliwPfpDkUUa?=
 =?us-ascii?Q?F0+lLCJO18ppIyOfvKpARqVsdHkKXHUJoocEPBL+KsTLp7R2Bri6wJXOiBGX?=
 =?us-ascii?Q?9MHEKTLdVW9UleHemX3PJKn87YT56LIdo6BHjsX0sKBozI2knLNJMCb8CFZN?=
 =?us-ascii?Q?8bTZXQbrLHz2XCNFDxMo6/7tYvvpJwwuOk4YX8lrAIunLdLIqES8PXVT3iNV?=
 =?us-ascii?Q?3CdBaQ9olSq1qO0KOiI0wNqG9O6sYSnAIajtptl0/SpTT/ZwXfnlhfPP9Dlo?=
 =?us-ascii?Q?0g1JAeSXO0JdzrX2NNarYGcaYqsTgL1kHKTdkyFxgKbHnFmmS2jc8rYHF1c9?=
 =?us-ascii?Q?p8R6C3fKcPZPD0vv/gd4cl/18JTVGvfad4qm4Db5RPSxi1Iy31iB7XrOyuWO?=
 =?us-ascii?Q?Gkq7zJovzKW/84iBPZtiIi3aedUdduI3H/IZ/QBCAm156Ps1k+tzrPBTbYUi?=
 =?us-ascii?Q?WsHiprvohkPg57ZWvZJiWfdAgHyHF4RwiIKfCIaLS5/5McbeAei2vB9iiUae?=
 =?us-ascii?Q?OJ/+RPr9w3c9zmSoT0o0gAbAlp4XEvrlad6niM6BV5H3VbC2kfgBBcxrKCYC?=
 =?us-ascii?Q?zdqNhnASTukkzWHRJEBn7yOxJmA4Y88HpEPXdyIsbUBmCjJb9MUHYCNNwcWt?=
 =?us-ascii?Q?3ca9ol0fr4s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mHbechMrapvLB0cTTRXWrcJGPC+ppop/obVXjCKic/NvwW7DPb4BkERNDIF2?=
 =?us-ascii?Q?t0YhsE10qS9FoiFAzxL4W0/GcitU8ydTRxBxrrkR7M161xZg0rslbNuM80tw?=
 =?us-ascii?Q?s1St2VR3B0EF9uSTuISOASAG3voH5PFyREXiFgu61OVyTlh5aYqbIXiQXbOJ?=
 =?us-ascii?Q?VZmqzkYz6CIW2Ec8QkXLh6Byrsv2Vo4rnLaX5aN+kBdAv9OEhjcUa9279uQv?=
 =?us-ascii?Q?+y6bL20nicHJHisazqLrsvCy4G9s5Naa91bqYOg7K4AOO0fishf0/UOf2Pw1?=
 =?us-ascii?Q?4G4LWDx+ZyZXdEnQVoVp/fqBUANerMocSHcpudA4qjWxQamjXStKLk9u6g0Q?=
 =?us-ascii?Q?VJezMabEi2lgpYtNkoM1BSo5wT4yU54PCfAl4svbJhg7C6m+aQ6AMsbp1L/f?=
 =?us-ascii?Q?h0WKoq9AYM/gOJ6FlMLcwSGDPJs6jOHPT1FBEvB07eBAp33F+1Hi0gOB0o6s?=
 =?us-ascii?Q?+Hbz7tY6saLFHiJU7xNzMBytg2+RPxxYi3oREQ2WttQECgAeRD2IXRwWeYPv?=
 =?us-ascii?Q?V3m4v4Z6pVJoWok9lzoX9n3K11W9JfauRfslaXfxUW4pe+SZ9z9TXiEcc06F?=
 =?us-ascii?Q?Dwa9iPAITExIlyfcPbOsFj4gddC8Y3Sa72gxPRrCrETWrTTszMbdw/YppuKz?=
 =?us-ascii?Q?HXZKeq5HD40qIBloCMdVc6gHMawtF5fI0T1FBIKyOwBYXz8zTvCYHdlkKaup?=
 =?us-ascii?Q?eVSYSqTcFTSmxSGFtkKiwGcGNBpfP8o3+kiWumg/pZ5rBIfMCUDTRNs9Pvx3?=
 =?us-ascii?Q?K+pPCoSwlybMtROy0tAAlu0xDK2sYMGvC5L/r/dsA61uW3n0gg0kbj/1erfU?=
 =?us-ascii?Q?BbK+1Ny5VgUDgbFkydGiX///bhDQSc2/flQ8gnqBAwyBSw0HNHkimX79Q6Xc?=
 =?us-ascii?Q?yeTLdQIH225gKY2oA1/CFWRSuG4hy1gY6ORQ17sQfsw63tXNxXQi17OA38Di?=
 =?us-ascii?Q?tQFl4WVtctZGORY24lwjOgAvoEhDOumLVaae2s3D9SmDmjIHhInOn6CuhyUg?=
 =?us-ascii?Q?0NHvx8D0qnMSEIPYhQGqFYgdxYQZ8KYL34ViU3XqvFqJMi7bDibeKXNT1Hfa?=
 =?us-ascii?Q?2BENbspOAiS/Lo/f8+gXMxYtOTd8Yy7FUIE48FQ8gDP1OZaPoLdlOU6+mx2r?=
 =?us-ascii?Q?Z35SwdbSfGp97xijMipD//3fiCa/mevcWlXQDxZPtjK4GEtXlhq4w0AZpp53?=
 =?us-ascii?Q?XfTaF7M1IMydse+ukLaKToVHzBMZJKQEQsU/gsNbgRcm7LL9h4Sd34TUjpVU?=
 =?us-ascii?Q?1zBT1ccm1M8Qm9NU3t46PmPQYLYoHMajgDwwT2csJhy4QyNrd1y5d2ua7Zrn?=
 =?us-ascii?Q?VxkmE0SkdUcLiwxL1T9cYAbKhrrIgQaCpA9o+KBzen9no267WUi5KbDyFAWQ?=
 =?us-ascii?Q?Lm35oEKeZK3UFQs9ROo+zzr96bkhl5YpLcONnA9qyluEhIOY/iY9iscw8+dh?=
 =?us-ascii?Q?vv3rYJQhlRUr//QGO2sFpsYoeFr5uM0Zglp8DgnpEkk+fPQOMw3DDyf0hEq/?=
 =?us-ascii?Q?GMXFc8MEebaxyCsVzL1Yl3GBc9PVz3g5Rw5YJOZ3at71653QsSbHZbt9yXOY?=
 =?us-ascii?Q?Vwh3zaN9dVWYIi2DPVwiB4heisqyPliL4F03eTCE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6ddf1b-933b-4247-d88f-08ddf5bd7fb6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:40:39.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugI+ITcYoimRRUCiHhFGhZV/Wudm/yxndJpRf2Fbrediy6rOLPKamrPcKsqUDZXBJMJHXl1LhKtj0Qs2AHB0WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183

On Tue, Sep 16, 2025 at 12:39:02PM -0400, Frank Li wrote:
> On Mon, Sep 15, 2025 at 03:23:50PM +0300, Ioana Ciornei wrote:
> > Add support for the GPIO controller found on some QIXIS FPGAs in
> > Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
> > using gpio-regmap.
> >
> > A GPIO controller has a maximum of 8 lines (all found in the same
> > register). Even within the same controller, the GPIO lines' direction is
> > fixed, which mean that both input and output lines are found in the same
> > register. This is why the driver also passed to gpio-regmap the newly
> > added .fixed_direction_output bitmap to represent the true direction of
> > the lines.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Use the newly added .fixed_direction_output bitmap representing
> >   the fixed direction of the GPIO lines.
> >
> >  drivers/gpio/Kconfig           |   9 +++
> >  drivers/gpio/Makefile          |   1 +
> >  drivers/gpio/gpio-qixis-fpga.c | 123 +++++++++++++++++++++++++++++++++
> >  3 files changed, 133 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-qixis-fpga.c
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 886bef9106da..4ca5890007ff 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1951,6 +1951,15 @@ config GPIO_LATCH
> >  	  Say yes here to enable a driver for GPIO multiplexers based on latches
> >  	  connected to other GPIOs.
> >
> > +config GPIO_QIXIS_FPGA
> > +	tristate "NXP QIXIS FPGA GPIO support"
> > +	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
> > +	select GPIO_REGMAP
> > +	help
> > +	  This enables support for the GPIOs found in the QIXIS FPGA which is
> > +	  integrated on some NXP Layerscape boards such as LX2160ARDB and
> > +	  LS1046AQDS.
> > +
> >  config GPIO_MOCKUP
> >  	tristate "GPIO Testing Driver (DEPRECATED)"
> >  	select IRQ_SIM
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 379f55e9ed1e..373b1f169558 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -144,6 +144,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
> >  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
> >  obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
> >  obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
> > +obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
> >  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
> >  obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
> >  obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
> > diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
> > new file mode 100644
> > index 000000000000..23219a634f73
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-qixis-fpga.c
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Layerscape GPIO QIXIS FPGA driver
> > + *
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/regmap.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +enum qixis_cpld_gpio_type {
> > +	LX2160ARDB_GPIO_SFP = 0,
> > +	LS1046AQDS_GPIO_STAT_PRES2,
> > +};
> 
> needn't type at all.
> 

True, I can just pass the u64 bitmap directly as data. Will try.

[snip]

> > +	if (!pdev->dev.parent)
> > +		return -ENODEV;
> > +
> > +	cfg = device_get_match_data(&pdev->dev);
> > +	if (!cfg)
> > +		return -ENODEV;
> 
> Needn't this check.

Ok.

> 
> > +
> > +	ret = device_property_read_u32(&pdev->dev, "reg", &base);
> > +	if (ret)
> > +		return ret;
> > +
> > +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> > +	if (!regmap) {
> > +		/* In case there is no regmap configured by the parent device,
> > +		 * create our own.
> > +		 */
> 
> /* Use MMIO space */

Ok.


[snip]

> +		config.reg_set_base = GPIO_REGMAP_ADDR(base);
> 
> 
> only two compatibles string in qixis_cpld_gpio_of_match. so it can set
> unconditional.
> 

Fair point. Will change.

Ioana

