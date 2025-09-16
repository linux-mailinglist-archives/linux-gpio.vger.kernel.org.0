Return-Path: <linux-gpio+bounces-26219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB40B59DD9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C10D24E17B7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0355231E89D;
	Tue, 16 Sep 2025 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LYON0a1P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07E31E893;
	Tue, 16 Sep 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040758; cv=fail; b=Mhtta5btBxpbUuJfnnEeTDLbVo/DkDKBgpJ8uNm2G3zEwvPtwbNTVeTgnS7uSzcOjNgWLmav4Ked41Sk2MpxRnJ1vR9ldt1dW6A+f96se2IEDQnTDMTUDfAkSedYgxoYHdioF55bREu7tvs1AnMJZWSkp6enntXmtKsdKlUp6Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040758; c=relaxed/simple;
	bh=PkhWYm+Ba1fALowdxm+gES/dtPHcn9BZRrO+OAV2SAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PwxJF4yt+kKt4DnnoIIVRBq/k8uzL0e5hyru58NEv4VjL3wJl/T6ckKqOVlpfMG//sdJeFOE07UjZ1s8vLeWLL+n15SA/tsPhAEab7pLpAReJZBgj/xec05wX/AYjVcLO0vf1gEp8rvMbRNTDmhJmkr9w+da99UUbV3rY0gRnaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LYON0a1P; arc=fail smtp.client-ip=52.101.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSMaCLdIs6IidmefyEL1/FKBFBIilrO7+Gf/VFr4h6C1ZpyeuuETj5GUk2HcwItRTaMNeBFU9NMDqEMa7vySF03KzBVMqdKa/iz6pZFtuIotewrGZWcFIFBsExjmZAeJnwqDbb5BtQwzDFmDE4jloenCFhqcdBOHQDmet53ASfifxQv9qsFY1z6A06iPiQDy3ZnztgidYMLmO/MtPg+EkTT8Z+L8C6ZxdhUOZNf9yyjWpPh0gWmqv0Mfa/G83QAlwH1xIjL2MkPVmcM52eQ71uGJ2tdmzugiXTpH5AeYOxkITK6CQtN4YuOdmjpRsYlW0w5PPH5CNU/zrI9jDC4yoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9umFAhG+WlspuuJ8z+DWgNEbM1Hzlg2T56+ZnKcwsI=;
 b=XqSrUI0aUtKxUWN8FEmGTPHaqACR1ZqsiOMwe4iJL3nrJ8Lr9rLrl7nJMQPYXE7G1qy6S6MAIXL6BOsY4VlpyC8cgIk9RD1kmZXTvJqfw87GznW4FjyGtdwRk51utGLc+/IwHBFWr2bKFGTDAhgDLsQ6GT59m6yjcvHDUpCT0Ks2CBjewKpF5ZML+d4nzUgBr1nGHLiA08PU/I+/I5r4/TM+BZKi4WVJVXct2Bnc13op/MIZRTA296j632B4D64rFXExhWXvF1PRFbKGHWmATEYPUswbMFG7AL0n57TNbkmsZK1ecGUyozsXByQKegevPz8Pb08PypDfNdMvNFvVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9umFAhG+WlspuuJ8z+DWgNEbM1Hzlg2T56+ZnKcwsI=;
 b=LYON0a1P06w+y9xQb9/tDHknisFxQjKA+H+gm2xftXzVtRiqO2MC5lF27W7pWT4jQxuJcuaTXvb8tvUohGvOq8azDRZUxy/BlNz4E3w6aW9xSutGNXXz38w8thFLd4zbU9/872WEuQ/QH5WietYKUaQctpr6zew27RwLoXl0B86XW21i63IUu895bf58qp7wLz4oY5I7/WlZCn5KdFuk/pfo9e556n994oqB7D7s2C5XGVJ/0iFivPdOQ0IhtLsnZADIkMaLMw+IN8qf4Krv+xVRSUmbPyfGiA5+7fPbcC6/PpIcqKSerNcGe6Gr/saXVoRh0ah+dqXHuOpfnSU5Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB10936.eurprd04.prod.outlook.com (2603:10a6:10:588::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 16:39:09 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:39:09 +0000
Date: Tue, 16 Sep 2025 12:39:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <aMmSpu/TWOmpHJ60@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-6-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-6-ioana.ciornei@nxp.com>
X-ClientProxiedBy: PH8PR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::10) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa48932-007e-4ae4-84b6-08ddf53f8f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nwvBIkXSyxX8trEEpnfgUhH4alCFqa6UG8Nqrwg/crS3HxVLo/KkaQFIxzsQ?=
 =?us-ascii?Q?dt7+kYLptmDrJhY6mTc505g4sh0wCVRn/bro2CA/E2jLx3hF2EzfpYwegY0G?=
 =?us-ascii?Q?FhFfiCJvvEXNZLO8Wt8TAKiXrUfEl6zHfepFM4Js+JzMe7hazkXhnMONAv/C?=
 =?us-ascii?Q?3fgCEYad0ztH/0fcIRG8GHtOnBo6qgRV2+muwKfP3/SxtvRa7cwqYLSiyu/N?=
 =?us-ascii?Q?/IoJR/zLj1gP76tclYzK6tlnyY5NjFHKij4RHln9EicGbj7UenyCnBfy+h0U?=
 =?us-ascii?Q?7MEW1dXZK8pGxL7Ir3TIjPwj5eYZZsnSak63KZLFZLHdso01B8VGrgmlGFnM?=
 =?us-ascii?Q?6Jmxt86vZIxYIa7omU6Qe6XvhJE7lWWz+SzwmdhDLhqinbFOFqDoLnD2k1f0?=
 =?us-ascii?Q?eu2DpAD5sU71CskYFgIuNvORkS/a4SkxRFj6UE/klh+WIzoYyUfCWscAfF9Y?=
 =?us-ascii?Q?0X4myv66hdZI/ZY0tQFz3faEQRWXD2I0c6nafnTlF0MOWkfKNYwGEKix7pD7?=
 =?us-ascii?Q?IcabyN8mSzZLmGopKcgw6KE9dbHtXypmwnuPeALGaMhUa+gTR/3bjFHhXHSL?=
 =?us-ascii?Q?s+HcnpDsaw8Gk4YpBSJQCyGPl6b5bILc9NYQeSUEzZyDGr/nUwyZVEAUvT5x?=
 =?us-ascii?Q?Ndy7tZLcJu+ZRTD4zQonIjD9nqvXE5m1C4x02qmPPKI7b9sjBLxOjgkWffRH?=
 =?us-ascii?Q?/qwFiqX5xHY/78bbpLRM/eIZM4ZPN5KQDhbrKyy40xf+OMEPp93mlZcMeBKc?=
 =?us-ascii?Q?OO8Ilz8HDi1nbolL7XHz9OEB1dW8oVjmuy/Q5+QoG6fKgnGcXhExCKGRr6ad?=
 =?us-ascii?Q?8tF74Es+U9M4UFCtf+SOxsSfLI+7wp6iAK524/FSroRVP3cD+bcWrCvV5wLh?=
 =?us-ascii?Q?6rtUYNoot0HY0UVf4SaGWDPIsFPR0j5nfSS5xo3dZcQIXkP5Kh/Y1clreHOZ?=
 =?us-ascii?Q?S7mNBGtHJl9KoL90i29bF2cXIg/o/G3O6iKaIdNXAaqkp6VWMaU/Jy0TPyCo?=
 =?us-ascii?Q?fib1iQJydCy59ANevICJ76m4vxWoLEe9H96hS4H/5A9Q8Mdf+lhEFgYavy7a?=
 =?us-ascii?Q?yCzBAz0DDUmlsUcPZG+k0I0MDzpFveGPOI3UNOTXNv5F0qTxxeTxufurGHCx?=
 =?us-ascii?Q?9pc4LiRR5/EHiOlCeJxEPNczUJSO0LuIS5DPu92mrI/VzAxyMVC0nrgFnty7?=
 =?us-ascii?Q?hHSzDV0hqXSYBpjLb0nCr6K6ebz0w/Prv0tXqriw9U3vtSweUZghq3V+QQYi?=
 =?us-ascii?Q?eyioVhAEV0fsJpcqQFL52Xeh1D3bZpYJVCHGvYlcUMla+nLY6nMHG5O+AJAB?=
 =?us-ascii?Q?ei2C/iz893PbpZkn7ZgLSoX5KsXSdRxFxIUzX2wnKVIEnkqxVcWcmiogXuGZ?=
 =?us-ascii?Q?lJoxDQ+YqZOdTpNN/eEmms278yzfQ4ecIRJDeT8gxcbhZRw2gglc/NzTFZrL?=
 =?us-ascii?Q?Xh/VOp6qLi5EPVXR4moCjT5UHQ7tQLTA4/YmGjnya7wr12qPNzSG4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XmMYcCHXskCFyhrbLSQmm9+3LfZveFGUlctsdqOTTJllvLMkCeszdzue3k/V?=
 =?us-ascii?Q?ZneHdLpnjhkAQTLbq0y4bqVLmoLvwBH2f2E4qbLSo004Ld4DiJb7fZgm+bqh?=
 =?us-ascii?Q?7NvrutVNS5/ZT/HkzsSCw7NG1/ocDE4c4NuhDQMIG15Lb4B3dqg4UCjvOIm2?=
 =?us-ascii?Q?sAmjlsOue+l6+1kpXvs+C1Zp8zWKZhtslffnV50GrMn9JBOZIGdlP4w0LOJa?=
 =?us-ascii?Q?V9lK67BeEz946+vcxrTAkyVmUdS6sWrBcRMDKzhUSfNWp8TFACiBLiX7PCth?=
 =?us-ascii?Q?eg38ZoeYC6bJDCOsLFCKYLG/BxS6nvN0EZe4XIc0mdAOOEMNs+R7jaYp5vyE?=
 =?us-ascii?Q?B15Y/t+Ha0IhhQcW+k5lIQV4wTuY8h5VzsvzYgrf8omyFErBmH4ez2kIoGLL?=
 =?us-ascii?Q?HGQn7oVCEjD7jlmY9/WrI/Uu9axf1UK9sJ45a3kw5ebZSCOPLB8yzOwIGvs9?=
 =?us-ascii?Q?B1yPXwT0uGL/SXCYMMjFFVT9hGlvsiNFdT+PVe7X8E0xupj5HfmxdHzbrMxZ?=
 =?us-ascii?Q?SIs9oSh55bsIBs+OWU+0gIfVkM8TYvcbtiJGSkqLXP6koW1k0IS4kOeP5Gap?=
 =?us-ascii?Q?OOqA9w7pGENPQmaHhWlAKemj6I6nt5ILAE7+7gkGgB+K0fsm45e2J/hmGNYx?=
 =?us-ascii?Q?6+k245o7He+WvvSuXiKfx561O8O5hr2F3jU/9i3RiTfgWgD4dBcz8UOSzghr?=
 =?us-ascii?Q?a6eP22KAckLppFiihHgXPb1f7eiqkwewzpavVURXN5PxX8mnCj/uUsvvyX+N?=
 =?us-ascii?Q?TPBIoXoP/eziJ1/vGI1RcQl8bCOEHaJKjBuTOkVhSzNBGEYFpfNPZ8WQ9VXW?=
 =?us-ascii?Q?iSOepzKfXS+mc0T3vtHKv73PzUib6TqUhUCeZuriQMvvA2Itqx3FYOohZlbZ?=
 =?us-ascii?Q?+kfz037Sd/6tGmrAABcO5qMd8/zdw1pGvc+9LKr3JeigsZVg5a3oK22dpJdZ?=
 =?us-ascii?Q?6VYofCemBf//a6AH3Ko16wXcjzZRIxs+Z4MgwFCClRzPGsp2jpIwPOORX80M?=
 =?us-ascii?Q?3q+3pntN345fCTOhShe3GIeFbnPWsoX55hIOR2LSRjG+2fYvgnjsY1OEdBea?=
 =?us-ascii?Q?Cm+McdYQ24g4DbPt5Yoofqkz6GjvE20n6wQue3LxpI8gcLBoIb5yaM8SveyU?=
 =?us-ascii?Q?llG/7cHRzX0h/wb4easoXxFMLSgGjk5npDjcZ7u9YAsJcEGWQdMlZhHsMhOg?=
 =?us-ascii?Q?NA6Cw7B7uuVo6m7rqa87p3dkCDpCJEc5TWNnBUO70jUotanlMcWslUUvZOTq?=
 =?us-ascii?Q?DV/e3onhnQRUfQVbIVjT232dC3WiY+MvffMiR1j3sCf3/FbNb9VZ1xzZ42WO?=
 =?us-ascii?Q?flLTQxH7CMdOAaoFBGU6xVODy0jCc3kAeKCjVwSo3IU67uw5nESF1uLQ2q8O?=
 =?us-ascii?Q?rJBQfFEQHo4NuRDuCg4wVMKC/YEXk6HuLwP5wys4aUBysmKKE19x13MU50Zn?=
 =?us-ascii?Q?eiR79CWw88tPvpJQkrcbu1sTf7gZd7P0khbWs8IiC2kGWcq9J0rq9FE8IhQK?=
 =?us-ascii?Q?IhmthG6rWqcsrLvxgvGsbUhnZRe6Kl16jJ8MKw/Z2M7axXbkuwEV8K20F2oC?=
 =?us-ascii?Q?Ft0KPYgWq9EYqwMTi7zgOrEPTsCjmDzS+rZ6c7bd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa48932-007e-4ae4-84b6-08ddf53f8f3b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:39:09.2729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOO+37Z1LKC2wtJdTdYr3DxgSL3NsGM08FLjxrTntgIRheRYsbSjRkb6aW0O/y1vieR56uAj43gomXsxkmpPEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10936

On Mon, Sep 15, 2025 at 03:23:50PM +0300, Ioana Ciornei wrote:
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
> ---
> Changes in v2:
> - Use the newly added .fixed_direction_output bitmap representing
>   the fixed direction of the GPIO lines.
>
>  drivers/gpio/Kconfig           |   9 +++
>  drivers/gpio/Makefile          |   1 +
>  drivers/gpio/gpio-qixis-fpga.c | 123 +++++++++++++++++++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100644 drivers/gpio/gpio-qixis-fpga.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 886bef9106da..4ca5890007ff 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1951,6 +1951,15 @@ config GPIO_LATCH
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
> index 379f55e9ed1e..373b1f169558 100644
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
> index 000000000000..23219a634f73
> --- /dev/null
> +++ b/drivers/gpio/gpio-qixis-fpga.c
> @@ -0,0 +1,123 @@
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
> +enum qixis_cpld_gpio_type {
> +	LX2160ARDB_GPIO_SFP = 0,
> +	LS1046AQDS_GPIO_STAT_PRES2,
> +};

needn't type at all.

> +
> +struct qixis_cpld_gpio_config {
> +	enum qixis_cpld_gpio_type type;
> +	u64 output_lines;
> +};
> +
> +static struct qixis_cpld_gpio_config lx2160ardb_sfp_cfg = {
> +	.type = LX2160ARDB_GPIO_SFP,
> +	.output_lines = BIT(0),
> +};
> +
> +static struct qixis_cpld_gpio_config ls1046aqds_stat_pres2_cfg = {
> +	.type = LS1046AQDS_GPIO_STAT_PRES2,
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
> +	if (!cfg)
> +		return -ENODEV;

Needn't this check.

> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &base);
> +	if (ret)
> +		return ret;
> +
> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap) {
> +		/* In case there is no regmap configured by the parent device,
> +		 * create our own.
> +		 */

/* Use MMIO space */

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
> +
> +	config.drvdata = (void *)cfg;
> +	config.regmap = regmap;
> +	config.parent = &pdev->dev;
> +	config.ngpio_per_reg = 8;
> +	config.ngpio = 8;
> +	config.fixed_direction_output = bitmap_alloc(8, GFP_KERNEL);
> +	if (!config.fixed_direction_output)
> +		return -ENOMEM;
> +	bitmap_from_u64(config.fixed_direction_output, cfg->output_lines);
> +
> +	switch (cfg->type) {
> +	case LX2160ARDB_GPIO_SFP:
> +	case LS1046AQDS_GPIO_STAT_PRES2:
> +		config.reg_dat_base = GPIO_REGMAP_ADDR(base);
> +		config.reg_set_base = GPIO_REGMAP_ADDR(base);


only two compatibles string in qixis_cpld_gpio_of_match. so it can set
unconditional.

Frank
> +		break;
> +	}
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

