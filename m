Return-Path: <linux-gpio+bounces-26221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6492B59DFF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D2AB3250E5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BD1261B76;
	Tue, 16 Sep 2025 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bz8Wb2ig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013052.outbound.protection.outlook.com [52.101.83.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614531E8BE;
	Tue, 16 Sep 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041042; cv=fail; b=tS5DxqDWHG/H8v4ZwWjp6MnTVRANBcK0bO928wrz/b6Nm2NxCJTqNYcs6wpwR7bN6++UWzgVEhk58Luuh/wZ1HXT+UL0yV2wUR6AY69RvSdOv3AnKoDpU26VeQYl4mfa0R3km43ZWf5A8J6yLyal2e6/h59UMWKPlIMms9UC1Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041042; c=relaxed/simple;
	bh=nc6AbRPPA4mM3FC/ijdVKXEWr8tJDAsJ3gewuXVyF7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C5nNIsgAsn+bfO5hjN94UG1fQySCprgnAlceLViL4JxvAvQdLGMsb6kQdIFfmlw0Ji4u2H7tfrn9vrJB7RFh/7z0xU+7f3DoJsUPIJtpJ1EpqL7deu66lygvBoetLjIEbuzxK6RGnWgPogz6HtAP/wzDELqjB0ugN80gPRRuvpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bz8Wb2ig; arc=fail smtp.client-ip=52.101.83.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4+t9C9vZTW+9DLfRn/Yv4QJfvLJuu3u8bAn+Xqx1qnHqGuOIBFViFLOSaIVtlqDirh00X+ExXln6xyMtzwLCWYWVrEk3WEqHry01Z5BPqBZkOfEDJRpg+lpn8WvhhMfrXc1ixBwZ7y0n8SeVRGOf5kmgu0IhBPGC2qv9yp1942fRBeRgFrMTDUnoWb4YnoRM2CUVL611XBFn4AT4v+jzohP/hubnBxO/eFi/kznrFqhNPMs5UCc8atqFZfgJDuShr1he+RpmWGOV5WHNJDIXepre6+zZsU0PWQTK4S9IFNBetEvDzVkbPUlu2VLerXs0sWWIzetES6Yr+wdy9ExqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qNleUqgQ6aURVIQhcgqLQLMBggy8U6F3jWYpGsWvJc=;
 b=XwEJ2fqe8cL8egANzVRoL5Y17/r75oE1Wqoj7LIcjjnHQk10n8K9KABwrv6Betv8SciCxVRClXDT+ui77BZcFPGPfDDlHjFCloTB0XREnhc3fokT6l1QcsnKv98ET7u//VmRWvZbWjJ+YX38s00dyvzpNXZQoE//cTz8/W4tXf0x9rqhbmaeQFyTRhgA8YG/Xh+vhFkdLjrZMV5IKgjMiprCzl3ajvYI2z8oGZn5XQXKaKdfm9BcjwJgAM8wOETfuObmszSzAz4URgzESx8bVAw31FInp8XKHRShawFH7Gh8NKliGuC3biVqdhNruo2qYlsA0aPUrjaJ5kOB6mYnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qNleUqgQ6aURVIQhcgqLQLMBggy8U6F3jWYpGsWvJc=;
 b=bz8Wb2igMvZOFfCAM1VVplYHnIYRvA/PLCm9PoscolGfYr14p0EqhDoKhhLmoqiWL/s3dPGJlCgs29khaQlmXBXvnanMykjy1qZG1GP0SYa9l4aVtSQEgmFA4LBx+FVE5SemsC2AzPUmO6taWsehljZIp8hCF+7jziYddpSosa9KK6ns58dkAMMF1ostvjau+Sc6jK8GUT6UyXlJMdiQiqM8FMdkNvT+AdFxtPv0Fbfw6vhQ3EnqCZfTMGKR9xhBtBUx62Ji/WstPqHejpxzpXKZgNNnbrY1EqhwdfA4U1Bvq6y+6UnKGWpJJG0Pph5mUVUvYQzb8FupM79yNHmIQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB10936.eurprd04.prod.outlook.com (2603:10a6:10:588::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 16:43:53 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:43:53 +0000
Date: Tue, 16 Sep 2025 12:43:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] arm64: dts: ls1046a-qds: describe the FPGA based
 GPIO controller
Message-ID: <aMmTwsb0TaNuEnFC@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-8-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-8-ioana.ciornei@nxp.com>
X-ClientProxiedBy: PH7P221CA0053.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::22) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca5f377-b1a3-46de-263d-08ddf54038ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mMLQvqBT3I2Ig0fJIQKEuBed+e+mdvUL5NjmZEFfE2H7vNnrhnEtjdtE8Vt0?=
 =?us-ascii?Q?fbutpJuniguE0p2fA/LDN0DE+fs1rS/YH6aO75I46fnlDpFFsVZR1PsysM+/?=
 =?us-ascii?Q?BH05vN47/R0clUXNUi8hbTkTqi9kgYepKVLGMQyoC0gyuKSF2WT5/wbfH+c4?=
 =?us-ascii?Q?Yv19elDCDl0SbIF8M41XR7N//oYqewp4qI36a4DEZgq6lJYpUKE3737Ig4po?=
 =?us-ascii?Q?3cISnrWEjPnm9zjBjL8uK2cbYMmHxkZALcLEPc/WpnpTbmVR5OsurzLZMuW6?=
 =?us-ascii?Q?ChJJwdVEhJMKPD3+AbXfrgWp2Fx9WFcVxu5JOH0WZEcnVVX4OTPFuuiGYP1x?=
 =?us-ascii?Q?Phlq3DD4SqYle3CaoA6Fz08Fk1ICluSqr0IpY3D3S+9xqqL2xD0Vj/HHEAZ8?=
 =?us-ascii?Q?yNcPApuV04rPhcuuKIU8PuOnXuMj+UAA76AjiByaxi1QvqUHMDWXG0v/tn6W?=
 =?us-ascii?Q?hl261FPZmGn6/zEv69tcw9Gnhp8tDgfF1BH4yYAyWBu1Cb4O5w6YL0aRuPEb?=
 =?us-ascii?Q?FD7oKakUxQWQPUGGwvaNqZ0VTWDxe3PbWXpEa4QwZWOB3jwdYC4CCRj3fprG?=
 =?us-ascii?Q?gR50nWNFTYPapm6eey6hDtv2U8bIOlAk8hzAVip82M0QoccPk8SZglhi87Bk?=
 =?us-ascii?Q?qEEHreSy6CqxDJvakeM9OjooKlurjY7JDAtD4KYvg5nozBSr3D+zsp3Xg824?=
 =?us-ascii?Q?WxDX09ngfR5AoQLIhcqFydBuVbgsCHzZxgCBjZ0Zkbpv4sguIfEJYf3OKxpW?=
 =?us-ascii?Q?y1rArj2k+pjMKbNW17Y2kN19ziYhD38N2FFgUY9TojLofhe/JV2vPZ5vICq9?=
 =?us-ascii?Q?itMC87DdtB0yeervly5mS1rUvuO0WI/5shiavXNZnQ9bsTwv9qH5QVTWLaBJ?=
 =?us-ascii?Q?2jDANli8u9K1HMgG0R8KZJd893EZfu2uUo6vxL2cDw7iipE7uSvCd5ex+ifg?=
 =?us-ascii?Q?i+T09xrSnVHjVJK8k/2qetGWq+g/+zf4bunNv1I7xlakeeeUx0Q9XQai74V7?=
 =?us-ascii?Q?h9KLRqIM6hX0a51a0Ynj1n24Ywoas08mem1gP+Kz0qTBVSHc7nnJeCh82ob0?=
 =?us-ascii?Q?7p51DGFuAV67aDSKjAMreUJd/JvnRJC+dKe3m7a0yrv6NNpg5ckcNkYMpw3o?=
 =?us-ascii?Q?sTnTm0ZYth1Ju8mQe1vkLsgvvHgov+SxwKmCtsSPIhj1NF2b/Krc/YW3g+/K?=
 =?us-ascii?Q?FAvVoBGw0xOtXCm5+EPiPiWMhaZNkn8HhDdA7c/KmekO6deShsj6LZi2OhOE?=
 =?us-ascii?Q?zdZfQCcF4JJ6UAA+at/Dd0+g+vSbt33x+Px2/z/o7yKHmqPv3eqmV/r560EE?=
 =?us-ascii?Q?bTQglR2ut0EMjxaJRXdm2PGnnSHRBee5k609v235hJ2ZQBrMBqd+z+wRx4+T?=
 =?us-ascii?Q?lWd5A/adAKDekNvRfumo48X8c3Q5cpcmWaeevD3AaY/VVfzEN/+8q83UmwK+?=
 =?us-ascii?Q?qw5JZRjkiPZG61+5YsXxOJIJo+0lf8MwVINyZ5/K2Wx/YRx3LMJVVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QZM9mzCfBd1ITN58Qs9GgnH3tDXL0LbboHPuW1r2FrKTljbj3dJP7c6p4z9Z?=
 =?us-ascii?Q?GXTRqgAcepYrH6GKsYCpLcbXmSCM9Mzc4W4VQbAKFIpC3MqHZRiRHlvzPgAU?=
 =?us-ascii?Q?NLiIuDKmOxNcljUsW9AFLMgDT23EmLEODGpEUdvEAMEFO6/Z1zskEuqXbY9f?=
 =?us-ascii?Q?nl0GuAisGH0aD6cQ4hYCdonHVHOqVRZiXA3wEtOXP2QcsQ8bY7Y+vo7BNzcM?=
 =?us-ascii?Q?oy/kNGYPWLbe0YzKxc4nNoSfSWsRUSHBuuefoc9q7NTqabnH6wg3kUN7ZA77?=
 =?us-ascii?Q?2gaT/9Ub9plR1T2buyBv2PdZ3gP+ojpjEg7BE5gQs+ISiszXRLj1irEeJFfR?=
 =?us-ascii?Q?PLZ9KAOuIT9I/0QZtPyNBhy5iCj4flAkOPPnfGezJBI/GlsjgkhVTuEkz1Oy?=
 =?us-ascii?Q?h2YmHapd6T1yZGzxxX30ZljwPWEYMo/5hFv2pgPRk127zaFnIFv6nUNxdywd?=
 =?us-ascii?Q?smZrU6IyLCXURHshz8OOdoGYPLLKg4LEyzjtaAoKb9ZS93ADedXOAaFZ0Cb+?=
 =?us-ascii?Q?jjM3u2JGstTziLDEfVr1ndG23pCYPf7HIY/yidhI9SpWDwag2A61bwJjUV+7?=
 =?us-ascii?Q?vqEovUYHii2gSS9/7Ioy0wINJdFiwbHT8gtN72l1olRag4LTtlEoYjRjXYIH?=
 =?us-ascii?Q?BSo8sNc4Y7veeKzI3P0qXB1EGZpctm24/Ffo4MfbnsMlpVUyp08INtb5F8Rq?=
 =?us-ascii?Q?u8LqlQ/9aqsKyLRdcGVtYYOGKVJSxnc3Fsg7RmM/j5gFL41zjL+KYUr91c64?=
 =?us-ascii?Q?J/f/fxKNh/s2jBdQfe5susiYrIqyKgm3sIvRa3dVny0In8an77l037R3L63j?=
 =?us-ascii?Q?1Ah2WBWPYoGbEfSOqUwLmNMnwJWg37floqtw7/bTbs1QFiaGDNvAghxJi+o7?=
 =?us-ascii?Q?pqwm5w4NckjH7QMY9I21zaGkWAjLCWeEbEg3GbVxfRaCphvgE8MrglTJnC52?=
 =?us-ascii?Q?4DTxkUmMopNBKM3YD7B8/2PehWbbBWrW/XaRx3BzTZnLPGUvXgCmTJgBsAkg?=
 =?us-ascii?Q?lwNmqQAPLURSlDLaRqG4kgHeuKTv4+Q/GOSUTLTmQSItOlNiBU71Maoj9DUb?=
 =?us-ascii?Q?0DoplPlbH021OtIhf6vsC2ux3hXmTh01E8B5ErkqnptswidYydPAEFf24Hjq?=
 =?us-ascii?Q?njmcIltCXKJQpEIsZkLmOyEdA5d6IBLcR4MATxFthdZKN2YFHYE8+yNV6d0v?=
 =?us-ascii?Q?YgCUwz35jYlFZvcc/s4bHg/xmDnLAXdCZ8tzsd2P0ysGFDmV0sfC0Ke6irZb?=
 =?us-ascii?Q?OdgIfuZJFysokihtz6wm/Dnmj7/Dx4Bg3Rc2VdPwFThK5IouOaH3iQD7WmAV?=
 =?us-ascii?Q?s1fr7ci0IUR5h4sslC8mnTjiu+OY3inbwyBltN/1XPcKIE5b1ABFhY9TudgA?=
 =?us-ascii?Q?raIigVueyWk9FiagBhIeVfsEChtvQPhA1BFO/L47Cn7BE33InHfVawjhVOtX?=
 =?us-ascii?Q?Ky4AWsBdrzjmwahkN1M48AkOgPp1rdu386ZntwDm7w80mobstsTsHZPoWUsq?=
 =?us-ascii?Q?SgJc9KU1SNwG1zOmI1JSMN7n9cBz6E54tjoOftF3/7EJ5uYz6xIIhH6D30p5?=
 =?us-ascii?Q?kf7I+OeSSsv75DSfE8bm54IyQhPAt7IB4DYbQQQj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca5f377-b1a3-46de-263d-08ddf54038ae
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:43:53.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWU6frzYkfuHRBcKYUf09CpUkt++TLmXkQLiWixZ1kPwgZPK5vQbbOZ8o99hha+3uGKO/yrMRtBXzRVN8CqEAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10936

On Mon, Sep 15, 2025 at 03:23:52PM +0300, Ioana Ciornei wrote:
> The QIXIS FPGA node is extended so that it describes the GPIO controller
> responsible for all the status presence lines on both SFP+ cages as well
> as the IO SLOTs present on the board.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
> - none
>
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> index 736722b58e77..64133e63da96 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> @@ -166,8 +166,20 @@ nand@1,0 {
>
>  	fpga: board-control@2,0 {
>  		compatible = "fsl,ls1046aqds-fpga", "fsl,fpga-qixis", "simple-mfd";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
>  		reg = <0x2 0x0 0x0000100>;
>  		ranges = <0 2 0 0x100>;
> +
> +		stat_pres2: gpio-stat-pres2@c {
> +			compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2";
> +			reg = <0xc 1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-line-names =
> +				"SLOT1", "SLOT2", "SLOT3", "SLOT4", "SLOT5", "SLOT6",
> +				"SFP1_MOD_DEF", "SFP2_MOD_DEF";
> +		};
>  	};
>  };
>
> --
> 2.25.1
>

