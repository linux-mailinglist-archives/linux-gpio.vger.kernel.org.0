Return-Path: <linux-gpio+bounces-26332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D04B85BC7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829E71889396
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD58D314B63;
	Thu, 18 Sep 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aPdjhvsX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2E3128A0;
	Thu, 18 Sep 2025 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209941; cv=fail; b=LYcMEW5nJUZFgPPLOmDCOiSea/nK5ELewTtzOeldWcy/hu8bqKu2tgOsyk4Sx7Wb0808INs9HFmX+kKV3zrTpUSfDR9X45mAfq83y6jnFYs+kmP1z4tMBhpSDU9RS+sJo8TUTGAsDhS0pIPZrpnZXmK0fT5WyJUuYsftwXbijqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209941; c=relaxed/simple;
	bh=RumaLkqdm6hvvnDyhS9v44jgGhOyyMQMAyj1MpLWUgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sDSLO/4kyK4Zkb0zi7j7y4VIRdHFmj0PBj7Vb8xLG4MH2r36I3fF7Nwk65dI9DHYFwBu7yYsgJLDToxJ3QIiy6FXRNKXwFSGncI1sQ6Cu4LMSog+FKN464Y+5JLK1GsLFyBobwrXYXC95OnY+IG80ttCdOQsEfdLFgadx+uPMfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aPdjhvsX; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnuj+bihjZNKo44iysnwACSrnscsthpM7M1q6YfuVdwqBUDoVymzObFXfEpoRodCz0AxGnhR5IlMkopSzhQEGoC0ls4XwLO6a/n6GpiUuqgbJe5G4kYS7somvNae9Oo4f533uAH77Opribs1354wHX2PCMDKY/sKrbx05R4qDfbhLUfDNIA7ZNbzq3EBllLy6I3bvG5OWnmtDQ29cpQNKyXQ4zQngJFzM5Zqz+BFHJVuK45uyMlrvfm5M9rooIYGjiDXHWbgSCgcsVo8ZbL3jnz4b/SuEwycPQMnrziDclZbRq+OaMkPhS9uTKviu1LliL9fJWgDEOqHWvUDAPC9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkTfIhwb+kczK/TdPGZOsH+0AqmEJge7+vqUt68nTCo=;
 b=OKRLjTiVWwFVPh/dgHZG5uXrGWN5NW4oazhK29uYv0RTkHxtYXCwYQPkvJ5YdHKLPtWauvTw95cLz13GDoD3w7+UmCE5+T34Dlge/MV/vivoRBee4RpUqFjAOJp6eZqxlZM+Lv62cCaxpg5oalUjrLQWwsRmxtQyxdYT/Z5AX6Tq2wCpu6uTGrYs8iSl7T+tyS6xf/6rwvR99pDXcICFyhc6m+0lLOAi3wO9F2EqSFsVrtA7oLIDQRtntdWpyfyv5EUOaKcZpo9y2egyRAjVd0rYgk7qULuOHqw0wqU949aXdCPBWofwJpEFs+o0TvSB7d2e0c4wh1oj6GA3PuyCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkTfIhwb+kczK/TdPGZOsH+0AqmEJge7+vqUt68nTCo=;
 b=aPdjhvsXd5z09jc2Ou01BvTT6Kcq74v2M0IBpklTWSE4NhFDKy1geXojQ3zKfgqVwmjKdGKXuWMHUaZBx+MaDZee1Km8NLNIwHMBneyH6GP7wS7lMWPF6NefoMfIZ1KWyv4q/tUFyG/CdKhnWOLo8+z290sNdVQpFfCdKcD3OH6iGrYEPxgXkIqgYoXi/kFZKlTQtlpk/barPT+FS1uW//XMjzBmQdQVO+IcnUNwW3SXCnYtPg+hM5rAyPLZX2B68Ltqo/r7Z8ZwmEm8E5q7n6uNVuMDpxsb3Mx0cnkhvT0bTYGmgDWGKMpW5aOMOJacgjE7Y3woL0D2s0Yj85a9hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB9975.eurprd04.prod.outlook.com (2603:10a6:150:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Thu, 18 Sep
 2025 15:38:55 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:38:55 +0000
Date: Thu, 18 Sep 2025 11:38:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/10] gpio: add QIXIS FPGA GPIO controller
Message-ID: <aMwnhuUO7LbPZOOI@lizhi-Precision-Tower-5810>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-7-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917090422.870033-7-ioana.ciornei@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB9975:EE_
X-MS-Office365-Filtering-Correlation-Id: 946dffab-ec7d-4780-241b-08ddf6c979e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sdSJgWHsLR/bwlb3fV/+olvdf4W2ULQBblL5QwFOgw8HPja1AU+LhAuWhIZX?=
 =?us-ascii?Q?5oOJy5NoOMF71i86rKRTHiG42Mtd9hK/0YFodWVKpjs4pgY8rNez0kwx9Mq2?=
 =?us-ascii?Q?05XleKhkb4cfCHIYthdjXkoZG5hAr/CO9d0AUCgVq1blvjWXh9HPOYjMPGcd?=
 =?us-ascii?Q?p4aAmt6QIjKOCLPRWP1nhiVT4iSNGAGKMwZKFmnq9AlHmz3n3ssgvnNhR1P8?=
 =?us-ascii?Q?jbrca56QoVvgtXMVgJs6LLZaMqlR11CCN3yV2rIfzRbjjldoASD8+WQp2TEM?=
 =?us-ascii?Q?yJiU4FBJSzpRlSQ/UX2JQuTxhxoQb0xiUGtcmM9oauVXwUZBQIriIwEymOXW?=
 =?us-ascii?Q?qI3ySfSxkyx9qXG3HgKID1gmMTnJVPWuAtBH0UNPuI3fBIy0BUwSPOULtXhJ?=
 =?us-ascii?Q?mL+SLa1C+o924aIwNHLkz3ka809HEWJyOeaADlsyUgwhXCkWt1U5ypdu8E/2?=
 =?us-ascii?Q?t0ShrAYpuAVRKxDvoOctY6yms9JPljOBpybYYi0wtdomoeo1oRgZEfYE7mJW?=
 =?us-ascii?Q?pCKqBXmlOy2CfAZoO96yp+RW6JI31GZ9MU759HM5uWUcWdwCH74Od9OKWOGC?=
 =?us-ascii?Q?YsevI+gEOi6u8WmvePpgWsbsmBBSh/Rr/evR8jzXJZG6loXE3ezuxZbPWDkb?=
 =?us-ascii?Q?0ztV/23OVPo/c2+O5bxM9gFmhL1p97bZTLIdiC04T90Qz5vzdYB6YWmjoxkh?=
 =?us-ascii?Q?sGGyQrYC7WMtWNvRFevs1znyBPqfPmDMw8HRzart1wU3RcPIQV32M99liMs6?=
 =?us-ascii?Q?VQL5l8HR2BSq5a4xbuApqoHPVinzIgfxVZW4itZkpJY6AjiWom8fIBZEQOf7?=
 =?us-ascii?Q?nMsfGxpTqEDg5dOIijzCfGMhApEUngm4zINKXxwZNLo2vntRRAqalOD7gyuS?=
 =?us-ascii?Q?1QZ/YP33GXQkTiCw4jEYNsRn3Frfx8klxYw4obv69ZxqySrapdk/MmSxwdqv?=
 =?us-ascii?Q?uKgQzUTxhQIoZop2hX7mR4ctTKxst3KgVwwamkpMfQKlosiGg3UMRB/Piea+?=
 =?us-ascii?Q?ctHfYbvmQC2u8T/HW1YbWXGqJ1a9dkzeGAkZxERoPzFCY6CWXy4KoEyoMlwl?=
 =?us-ascii?Q?Sdb8/xkFddYJYT+7OTxlvwQ8XPGTAJmlda8Sfbul+G7ea7gxRF3SFw0aeP0N?=
 =?us-ascii?Q?3sJhRRLvQSt7H9jKyUD3EyFGI3o4P/AjBWTaaF7hHo/luZWKylwEiRq6o5B1?=
 =?us-ascii?Q?Ij14aRooy7+Nz0ECI7DxoosWjBdAz27PlSdgjEHKV2tj8NifW+VTXJ8n3CyG?=
 =?us-ascii?Q?2gCMRk53h4BBeNGgdIsiE9DKYDhfMTwOokyl38VRqUunFxTcFiFUbIXczRh4?=
 =?us-ascii?Q?dGUkC7CMOKulosnHGZ/tUArh06ZeO5TEvg1mEsA5ZlxZtgBFx6vLSLRv07lq?=
 =?us-ascii?Q?QedquM60KOUOhCrGori69di8WMETv9nJehXCcWw/fxG9un4gj6Ppm6mwGvtJ?=
 =?us-ascii?Q?wivM8r3uppphVNR8BXrBgdKR1VxKsDHcEQne2H0d9tZuc5ow/gKvHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tJq0UeKfML78swOzL+F9BYbo75E7IHRq4NZjBuWcpWWYB/UP4aX4yGH7xAKJ?=
 =?us-ascii?Q?Vjj0AEFvEh9m/emoqRNCgMP8s3H6XGrjIAUD0g8S4U9YQ5PaPgx/wl5V+Kkt?=
 =?us-ascii?Q?kwH+0fOEU3PTwDiooZBHwmUIGBlVo86segr2/vjBb8chmxTtqS77Ks2q3WDJ?=
 =?us-ascii?Q?7WwMFBzE7ClKViWFEKwoj+5uwzaia6g20hmZB6p+LOZwn4cbrG+FH/lrzUgm?=
 =?us-ascii?Q?UKF2/p49pRD4Xfe6jczs5R8pNY0wLw+0dw9q9lmnyrTUdD+3sHKohAk7LkVd?=
 =?us-ascii?Q?dbektZOo3Zg3vjQ5MGnXEcAJJMP6Z7jRMEHQxD/kWPhGi3v+2jZ+eRpDxvOd?=
 =?us-ascii?Q?U6nNIOzfv7KLp6Ho+ceY668T23fBPcqtA5LpSLPptFK1eY07aMbkgoLZRy5b?=
 =?us-ascii?Q?PO0mCo0M1EUP6KX1PQNcZqJt1D6Xu9P8o/Y5ShXQDDlDKwe00ujrEC46Vk12?=
 =?us-ascii?Q?t4S6Tod4eMESZrBw5e+u+Q/dYEj3Hy9FXR+yHMtLPK0jOfO1DfzfM0WLvPZh?=
 =?us-ascii?Q?Bh3WzbYo0J517uOT1LZNdZAa1D3QTFb64/j/B5uGOTc2Tnoil5k9PAoHb7FK?=
 =?us-ascii?Q?4Pslibpdp3JcdO7RUYJR+gQQu3ksXDhZrxDXDnxLt838ECwMSBobGzUvOeY/?=
 =?us-ascii?Q?ZnhB+GuLhF1D1E2RbabM4eA7a49Dc4Xg+AzGTS7lsQlnjAGw6a1BKeMPAjJj?=
 =?us-ascii?Q?8ehGgtNSPSNNXHC1TCpaRdY5XDqCvQqP2ShHHEos2wzd1o9McZKWgIRd0UlV?=
 =?us-ascii?Q?Cl6k2QCmBA6o05ScYlyGu6i+QsAPgVA8q0IkpOi0Vtc+T0iTQVbBW/HxOMSi?=
 =?us-ascii?Q?sEJ9OCQ4OnmamFXDbOsSfBlzwvXGvjQX7Mo2EfuYCfnSp1XOVKBOL2azbNIV?=
 =?us-ascii?Q?/v5qmA/xjq6jU47zZc4qtP58BShctgET4cGm5SfGFgmBqi+SxHJX+W+qWEDy?=
 =?us-ascii?Q?aLQZL/dMd7SilYkDMGzbjU/j7DrtGpW+XmKiHQRB1JnNWfj3Xu0jF5PlbFlW?=
 =?us-ascii?Q?hh1ynfd0oDWW/bKqv4XH/Fv4ci6rIjShPzQekczD/a0077xV/zTFWZmuiVB7?=
 =?us-ascii?Q?EOz0DQ8qj8r4vg74fv3m2fPXl9EnqvjjZ85qQ63m78Jxih3fIRqf2fgNq+19?=
 =?us-ascii?Q?sDu0bbQ0hN76glI2btQBaAhosz80dn71XrG7B+mZdUQqwNJQDcJy+viKouBF?=
 =?us-ascii?Q?ABk1w+Dw8bXEXTswqllZTUNgXQeiopJraisD6rKXjU0Tf8IhJmhLrxiv3CcI?=
 =?us-ascii?Q?swGmUAyUx6ljHeoaxAn/BkKLo815pu1M+BuQl67zncTL8v7oQYdWLgNMdlpw?=
 =?us-ascii?Q?hHFS3ntNDQGwZbsfIwdwT0AgBHmQsRshUbPuYSsKMHA2/kW+hQU+VeAUSSud?=
 =?us-ascii?Q?BAGOSFhzC0Wmyklq25sbV8xpia4RXnh7OQiKmlyawLEgL2zfuSwe+9KW1j0Y?=
 =?us-ascii?Q?N9BcGeXV72bKn2pFuic8F/5USEV4OY55fGifXlnFAAUjJAEBsPuHEjjL+fT6?=
 =?us-ascii?Q?/evUVwFj8My4a5F3y5HKzE5doYyjY1eaC+aSwttKaQKzT8W7AVJs7RgFVqj6?=
 =?us-ascii?Q?mzxxo5lbH4K0DEG4HcNXn1+3TbVFQ55QUkEeLMNP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946dffab-ec7d-4780-241b-08ddf6c979e6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 15:38:55.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyHxisbnwOu+CR60tndYwzeuo+oKOYBPUrVrgqfOPaMeT6oNSnrt7I7Wjbx6/hQh4jVT7Y//1DE/LqKQjNt4OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9975

On Wed, Sep 17, 2025 at 12:04:18PM +0300, Ioana Ciornei wrote:
> Add support for the GPIO controller found on some QIXIS FPGAs in
> Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
> using gpio-regmap.
>
> A GPIO controller has a maximum of 8 lines (all found in the same
> register). Even within the same controller, the GPIO lines' direction is
> fixed, which mean that both input and output lines are found in the same
> register. This is why the driver also passed to gpio-regmap the newly
> added .fixed_direction_output bitmap to represent the true direction of
> the lines.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
> - Use the newly added .fixed_direction_output bitmap representing
>   the fixed direction of the GPIO lines.
> Changes in v3:
> - Remove 'drivers' from the commit title.
> - Remove the qixis_cpld_gpio_type enum since its not needed.
> - Remove the NULL check for device_get_match_data().
> - Use a bitmap declared on the stack as the config field passed to
>   gpio-regmap.
>
>  drivers/gpio/Kconfig           |   9 +++
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-qixis-fpga.c | 107 +++++++++++++++++++++++++++++++++
>  3 files changed, 117 insertions(+)
>  create mode 100644 drivers/gpio/gpio-qixis-fpga.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 81fe3b085f7b..e963a7ee4ce1 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1962,6 +1962,15 @@ config GPIO_LATCH
>  	  Say yes here to enable a driver for GPIO multiplexers based on latches
>  	  connected to other GPIOs.
>
> +config GPIO_QIXIS_FPGA
> +	tristate "NXP QIXIS FPGA GPIO support"
> +	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
> +	select GPIO_REGMAP
> +	help
> +	  This enables support for the GPIOs found in the QIXIS FPGA which is
> +	  integrated on some NXP Layerscape boards such as LX2160ARDB and
> +	  LS1046AQDS.
> +
>  config GPIO_MOCKUP
>  	tristate "GPIO Testing Driver (DEPRECATED)"
>  	select IRQ_SIM
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b1593ce92ebe..850c0e086c82 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -144,6 +144,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
>  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
>  obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
>  obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
> +obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
>  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
>  obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
>  obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
> diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
> new file mode 100644
> index 000000000000..048a2cac4f0f
> --- /dev/null
> +++ b/drivers/gpio/gpio-qixis-fpga.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Layerscape GPIO QIXIS FPGA driver
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct qixis_cpld_gpio_config {
> +	u64 output_lines;
> +};
> +
> +static const struct qixis_cpld_gpio_config lx2160ardb_sfp_cfg = {
> +	.output_lines = BIT(0),
> +};
> +
> +static const struct qixis_cpld_gpio_config ls1046aqds_stat_pres2_cfg = {
> +	.output_lines = 0x0,
> +};
> +
> +static const struct regmap_config regmap_config_8r_8v = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static int qixis_cpld_gpio_probe(struct platform_device *pdev)
> +{
> +	DECLARE_BITMAP(fixed_direction_output, 8);
> +	const struct qixis_cpld_gpio_config *cfg;
> +	struct gpio_regmap_config config = {0};
> +	struct regmap *regmap;
> +	void __iomem *reg;
> +	u32 base;
> +	int ret;
> +
> +	if (!pdev->dev.parent)
> +		return -ENODEV;
> +
> +	cfg = device_get_match_data(&pdev->dev);
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &base);
> +	if (ret)
> +		return ret;
> +
> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap) {
> +		/* In case there is no regmap configured by the parent device,
> +		 * create our own from the MMIO space.
> +		 */
> +		reg = devm_platform_ioremap_resource(pdev, 0);
> +		if (!reg)
> +			return -ENODEV;
> +
> +		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
> +		if (!regmap)
> +			return -ENODEV;
> +
> +		/* In this case, the offset of our register is 0 inside the
> +		 * regmap area that we just created.
> +		 */
> +		base = 0;
> +	}
> +	config.reg_dat_base = GPIO_REGMAP_ADDR(base);
> +	config.reg_set_base = GPIO_REGMAP_ADDR(base);
> +
> +	config.drvdata = (void *)cfg;
> +	config.regmap = regmap;
> +	config.parent = &pdev->dev;
> +	config.ngpio_per_reg = 8;
> +	config.ngpio = 8;
> +
> +	bitmap_from_u64(fixed_direction_output, cfg->output_lines);
> +	config.fixed_direction_output = fixed_direction_output;
> +
> +	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
> +}
> +
> +static const struct of_device_id qixis_cpld_gpio_of_match[] = {
> +	{
> +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp",
> +		.data = &lx2160ardb_sfp_cfg,
> +	},
> +	{
> +		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
> +		.data = &ls1046aqds_stat_pres2_cfg,
> +	},
> +
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qixis_cpld_gpio_of_match);
> +
> +static struct platform_driver qixis_cpld_gpio_driver = {
> +	.probe = qixis_cpld_gpio_probe,
> +	.driver = {
> +		.name = "gpio-qixis-cpld",
> +		.of_match_table = qixis_cpld_gpio_of_match,
> +	},
> +};
> +module_platform_driver(qixis_cpld_gpio_driver);
> --
> 2.25.1
>

