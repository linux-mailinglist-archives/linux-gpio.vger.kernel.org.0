Return-Path: <linux-gpio+bounces-26204-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C3B59677
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 14:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84B331BC6ACD
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 12:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1D6307AD7;
	Tue, 16 Sep 2025 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWJ17n3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209FC3112D8;
	Tue, 16 Sep 2025 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758026719; cv=fail; b=Zemh4QawhHdoCFyS8eiNThWwOdn3dllnAU7kYiVMFTc/85v+Q5OWR6ZvQ3pGcF18LX4yNR8yLH7fi7/ZDAijSBymG70biJcn2JDiZjCKLD2oqvhKTk508zc1gSNvhcFmoHITrcxTDnYUILqpSA57kwqlw/ppzAb9+Jqy3tpyMVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758026719; c=relaxed/simple;
	bh=rRbrcLuDSBhmcNsooDZTALbmvb+shngFlMhb4CoC3u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pjUnfkFPgsaisOWzNk4rrZRKZMTaJ6nMoXi/w1VyT2AETgvQxanebwsRFyJ2r9lTHRGB3fDxDvTOs1ty/MBctbzy4eJO2d9Y/S8GaFjzjqlPTrfBkipDls+ipNqBpRzdcswJ7xWyN0diDJ2TdhWVZV8vDtsLNhySSMsn+FWU+FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWJ17n3f; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5URfMt5fozWQNCoAP7nBtKsxE6dgqtOorUx4XCc4NQV+0CaO9LpvkV2oSUNzhs+uLClWq7VfG4UgJpI61jYyvoHmm2Us2Dx5/W+bfQCh72yrNseGtm+335vVuGdsj8DNWvCleSvdSnI0H88WbenA7Li1La2z7fL3xcr2xkzLHCr53G5DESzlJ0EMeGbAyehjTWt6H0b2HzZjrnvb6Xxf44MPDEEqJIHNLb6WZLodvjTFYQfkEPxlxNyywo4uZAusRzUUwdf594ZFKz1t2OxsGWg5JNrVc386aJXDKb/5Wqauxp67fFnmdU+W1vdARdsHEzL9sOZD1miZsLKvmY13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsjNcuICqBIRwNdElUAbiISi/Zheu8wdt8c8qfSunbE=;
 b=yr68UNV9AmPfkp55nJKQZ8KX3c972Qx0j+44C0kz8zgtUnVp7LMUuqZOcHvn5juQnFHnGhdkYej/J+PKFpitAWlXHOn8ezC9njn/aIJyBRz3/R05NY0pwu4P8P84OGW5y5YXtow+3giHf35FISw4HdG/8prg7NAYHMsj2DV3s0RzL17Wp//HUTYKJ9F5Bi08MA2K/w8GJf0rgk3SAH1DxfxXNzRsnJwkDEMWhSGGZHqB3+YiFy7FiSUjawBsBdpdI2enARGvoW7ugTf9hsNxovuZHhWwC+lLh6mpq7NIEdnb+nQY91bPfrIZSyTwD01Gku9G4FSg9ld9bzJFm8JYmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsjNcuICqBIRwNdElUAbiISi/Zheu8wdt8c8qfSunbE=;
 b=GWJ17n3foQ2sFxn8KlP22LnfoS3eu05TmNiCZryuXwH2VtiAmkqe82CClkO7LwPcEXmaafvNShb685HuOpwB99YwLrYst8ywlU+8dIGVvUf+ZXsDd0evqOiZTsV4NrffoyV1/k+E//DX9wPElTJGubUU8t+zw3qIOzQevrQSBNk4Uqf+vYjIbBkjzZVDLWQBr/Pn0zlUF1Jy8lKH6W/9xswRGZ0ZsRT6a8e1YN+UhHG8JyudZoZhmi9G3JV/geekvRp/CSyx0Ugj0uHf3VvbskP0QmfRGCqT0tGE4n6hu+H7SwYfawTMKn8tKzqL41S40wjWWKBZnihKlU1NGPhN2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DB9PR04MB8188.eurprd04.prod.outlook.com (2603:10a6:10:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Tue, 16 Sep
 2025 12:45:13 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 12:45:13 +0000
Date: Tue, 16 Sep 2025 15:45:09 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support
 to also cover the LX2160ARDB FPGA
Message-ID: <5a2x7m2vxbql67rxdjrionmzc6gjrebymahzdl7xc6fjlc3dxz@ykpgin225dg3>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-3-ioana.ciornei@nxp.com>
 <20250915202742.GA3329659-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915202742.GA3329659-robh@kernel.org>
X-ClientProxiedBy: AS4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::7) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DB9PR04MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: c29f7fb7-51d5-420a-72ea-08ddf51ee0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RIcw8m8CMDJRTZJjoW5gigrejyDkIoG9nRmWkFYaB6SvqSg9jHh7p4KsNOje?=
 =?us-ascii?Q?hOWTtE1Wo8HoAuWYLcFLaMqPbEIFRCJtDMkWoUNm416CklXguX810ts9CYWj?=
 =?us-ascii?Q?mj2EakFm5pCCAPk3yTkcFVSQwBV49ccQkp3YCQb/6zw9EW8GM7lv44+mQVWA?=
 =?us-ascii?Q?+UebMgZPIWlokZU3T9u620YwnGFT9aRRIffTmk03ZJwcLkC33oxWKliQwQ6V?=
 =?us-ascii?Q?yr3BHjqVkHbu4zNtA1LV36Q0GTSRsGXXMlLMGHrjRFRM2Fvup1fyHuAXmq9x?=
 =?us-ascii?Q?CHi8vA2h3Nxtl4E8XXAHQ9MR7U2X2GOHntcK7pfXjnLi0zk5U/46uzrNR0o3?=
 =?us-ascii?Q?5pYpNINKIrPqGAF16Qejt/y6mXrM2NYm8P2u1F9r3i1aLMFUGhZlnLN4umfp?=
 =?us-ascii?Q?YlpnZodnY3YUWtyJ/4ohPyQTbEzvr2Rf8rVbLazloZ6vvGg3Qq17tud8Tt2n?=
 =?us-ascii?Q?de7JwKi8ljmupiURxOQByREUQlhT7brGbghJC0kDhjdpbk6z2LQX7KNtnzIU?=
 =?us-ascii?Q?uYR3vXdiKRne4K9+3QdIuCgVbusCmq5VuPJxD9twO2ygi90q1xCa0hdrKMkH?=
 =?us-ascii?Q?76KTp+nsnxstALMpYUYWF+dF8Hk8lrKgXbjB/i7cmOvzdxSru+W2DAYhRajZ?=
 =?us-ascii?Q?DyQfNTHuGndXWmIEdSac6IIx15HyWOI54XPIusTkGmriUfQlx+e9bljZU5qc?=
 =?us-ascii?Q?315aQjKvlCgXdKkUhZaHbGMsR3OK3eEucLU5V4bLF0iVwSx5m4aIg0kVZX9U?=
 =?us-ascii?Q?4SeUS4jGJv66EiRp8C2DEB8rbBJfNtO2E9oe4OG7XpewkLau913dSU2cpoXt?=
 =?us-ascii?Q?w/9dgUB/OEpfzIeL8Kdn7ZoLbB0DExJ+AKm8yrsX4WIiV//F+HrebllfqQ8c?=
 =?us-ascii?Q?cGbHClEukLof/wvwNNNWwgb4KEGfNujLQcoqzFAI1y92w/f36YNv2kl8AGtz?=
 =?us-ascii?Q?ZFet8YetHy653aaa8YHOecr7RP/uvK6gb9VoIAHqdjXJhTttnWtXTPXJOji/?=
 =?us-ascii?Q?7iR+CS3fkYb1H2YyytpxwbdsSNWaConjEfU7EWTcJ0jVvwLYNb2JBbpO/Y3Z?=
 =?us-ascii?Q?NPpaFEu35Gw6yGQMYrTfOSXrrVqcItGBH8a1UYJh/wlFLZICkpOCZ7huCFzB?=
 =?us-ascii?Q?oVS2sSJB4/+TNwvCY3NjlBqsKflLuoKjizstFXjORDmSKdkoiq49S6i0fooL?=
 =?us-ascii?Q?EDaA9BKFTlnFm/EhS1Fwj/WMsAdNugOGwTMaZPR3dOz3T1BmB+g9Hc+8kZgN?=
 =?us-ascii?Q?zcUwlEK+WSXuyHLjmsXur0Mkn4KADxJUv4I/pyIsXO+oT2jCxnFvCTWEuZ8e?=
 =?us-ascii?Q?9o4fATCreFJ+3FYVm2dKfl0Hs2/nS5aA6eAli+Boj//tnmb9vPdMKXMefTeL?=
 =?us-ascii?Q?sZAHlspkUyg4Gx+k1M7W76mgE+/XR6j6wo1JyBwSV4VnsmCop8qayrbGdPki?=
 =?us-ascii?Q?aSAqdZV8t0s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ikFoyaDYvuXhzOWobpuPSLhGROYMIPlUQ81UpaoxkPp97nEYIO/sbzUA3ol0?=
 =?us-ascii?Q?hgIlvOxQMvnlOOorZ/4uRoLYLG6JBDLm2yKnEoebzxb9O2x5E9CCCpa0O5nt?=
 =?us-ascii?Q?ggbZsws5EnNtY2VVQT2W1T4CZNkzwOj/6cWSHZ39s4TK81SV3iNSR2YN9IvM?=
 =?us-ascii?Q?Cnk4bGwk77Kb4ild3NmqhNvS9CSrSOntPL2RH0waVGgoraue+vwTxNHp/JLi?=
 =?us-ascii?Q?eeck4oLueL8kHll3qRpOmUV6+mMs1QWnROJPAdvWJdluw/MAyDtnhnrpouCT?=
 =?us-ascii?Q?ozHwBzuJPf4BKI71jtSJlpoj0ogTEw5d0+IOJXPJRi1CKEwTBt/JhTZMaL9n?=
 =?us-ascii?Q?9k057uoBW2fb/6FjWjr1oGc+zfEFcp2DrIQjWRR8q9ppp3hATAvqv73ihYvn?=
 =?us-ascii?Q?LaPfwb8yEt/FHcnmzFMB7CIfDSnz+7zI05Bzda5HBNO3plD1xi4k9O/GBaMK?=
 =?us-ascii?Q?W9O7OH+XAoo/jga0hr+xYIGkZW/lJWNMTKdd+3Viau5sjduBDs+GeC7hGBV1?=
 =?us-ascii?Q?eznXSoabfWNqEx3RmY2jaODUgmrlybIVHDOZMa7vXYN2e80mDJuohrq7M9su?=
 =?us-ascii?Q?X4xEUNkN16+eXFB+tfmHt36zpTxmFPueiWYVxnQi4VYzkk/fgGfS+j6aQlYz?=
 =?us-ascii?Q?++z4w6ZKa9sPJsEWMaZYGJhxYBPh9EhoBUd4tZYGCCAxRK4f6UU4SHVvdSWw?=
 =?us-ascii?Q?/CrrQEIT7YMnqBT+n7rcTbvJruKmBX7YCnZ3s8tiS8HCn01vPBFLUMUXMZS8?=
 =?us-ascii?Q?zuMhU90CJp4davcONFMB6oW1Q8jPmjRco2whePAx5KpThMbsz04CPPL2Z9xt?=
 =?us-ascii?Q?xGgCZ+g6oOQC2XL9G8+qoZOcz1LF5CPL3baV828BRs15Jbz7sy3ZvE0NhJhM?=
 =?us-ascii?Q?tdKtGTT4ObR8SdMsY9IvLwCRvLli5B8F0P5LKCqbIAz+BTQeqtKquH98Q9/6?=
 =?us-ascii?Q?SDUmCDVVCeTnI1SoN2t6N2b5Ada/ATJQl2/gnKJJKIw21CkCsMHjSS9uvgD3?=
 =?us-ascii?Q?Rpbs1oomXab8i9YtoDBrG6EIABDAY27b2B5CbiImC3FMdqTi0qAdZMTeVMZq?=
 =?us-ascii?Q?ecjGAGkPq2zxHnICZ0Ay+81fUWY52130hQZmMwBUZYCKB8deqQ7AwJfu4k6p?=
 =?us-ascii?Q?OAkcmglTU8JSbwzC/W1GJxwZHygiy7SN0JdXafEiPidQl2D377OVrYfuC27y?=
 =?us-ascii?Q?mL0mdV+K6elQ3ckuG1r9wRz/Hxol9IFMrdJxssidQBfaBGuZJOwSJu67WS3X?=
 =?us-ascii?Q?AVewn0OhSeiGAHca7Zi47EyqP1nIe8tGDYJmYZo2o2k7HKvlxT4gFrUKQ93I?=
 =?us-ascii?Q?XS4ddtWi8KHBhReNIGWSSYPVxAebP5ApxL0Z4uJEZI2hZhI+tWy1dGg4Cwtq?=
 =?us-ascii?Q?0q/wuiXH4u+dbEQ07he6kjENHaSOwgVjYcVort7STZZXtQKtMFVGv20OfXEQ?=
 =?us-ascii?Q?K9YDb0l6o5S4bqVEiB6O1IaIStOCOAWPRyw6hD41mT35ffUZeChol23KoUcp?=
 =?us-ascii?Q?GQG5npJQNEclcdfmoZuNUueRePHa/6JAqNGktwa5kseF2USMkQIZQv4CUTrd?=
 =?us-ascii?Q?vW0A28YTVonp0ER7vltNO+aTW7AJdEw4b79hDeUE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f7fb7-51d5-420a-72ea-08ddf51ee0c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:45:13.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTbMQF1TyRoWAfuUVgYz3mbrzU3MVgY3WpqtKN1aw5dfW0HLmYwgjU8aS21msNqG/CNArTMaHe1PUjPmHys92w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8188

On Mon, Sep 15, 2025 at 03:27:42PM -0500, Rob Herring wrote:
> On Mon, Sep 15, 2025 at 03:23:47PM +0300, Ioana Ciornei wrote:
> > Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> > 
> > Since the register map exposed by the LX2160ARDB's FPGA also contains
> > two GPIO controllers, accept the necessary GPIO pattern property.
> > At the same time, add the #address-cells and #size-cells properties as
> > valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> > addressable.
> > 
> > This is needed because when defining child devices such as the GPIO
> > controller described in the added example, the child device needs a the
> > reg property to properly identify its register location.
> > Impose this restriction for the new compatible through an if-statement.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> > Changes in v2:
> > - Enforce a unit address on the child gpios nodes (remove the ?)
> > - Enforce the use of unit addresses by having #address-size and
> >   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> > 
> >  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > index 28b37772fb65..da21d0defa04 100644
> > --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> > @@ -22,6 +22,13 @@ properties:
> >                - fsl,lx2160aqds-fpga
> >            - const: fsl,fpga-qixis-i2c
> >            - const: simple-mfd
> > +      - const: fsl,lx2160ardb-fpga
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> >  
> >    interrupts:
> >      maxItems: 1
> > @@ -32,10 +39,26 @@ properties:
> >    mux-controller:
> >      $ref: /schemas/mux/reg-mux.yaml
> >  
> > +patternProperties:
> > +  "^gpio@[0-9a-f]+$":
> > +    $ref: /schemas/gpio/trivial-gpio.yaml
> 
> This results in this schema being applied twice and more 
> importantly allows any compatible listed in it to be allowed here. So I 
> would drop the $ref and do this instead:
> 
>        additionalProperties: true
> 
>        properties:
>          compatible:
>            contains:
>              enum:
>                - fsl,lx2160ardb-fpga-gpio-sfp
>                ...

Ok, sure. Will do this instead.

I just realized that I didn't update the fsl,fpga-qixis.yaml which
covers the LS1046AQDS board. I will use the same approach there as well
for the gpio@ pattern property.

Thanks!
Ioana

