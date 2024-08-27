Return-Path: <linux-gpio+bounces-9240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0629617E6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 21:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24F28284591
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 19:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59531D2F5E;
	Tue, 27 Aug 2024 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="go4YQxCD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013036.outbound.protection.outlook.com [52.101.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C6195F04;
	Tue, 27 Aug 2024 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724786410; cv=fail; b=o2MVOfnpgbkZO0czk7U3NmFqQTOcW2K+l3wJgRVkAFbaCp4c4AeCSb6v5DHK4Py/VRTHeBRL5o7sHz1Nf1VY0vUnH/TvTB6Sr/iGYGnJ+wjgo+rzBgbmEZ8FNIvMXYeZhbUC6WyXzDahK4965HDrlj61yZAhWgG1tBMbfn0nf2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724786410; c=relaxed/simple;
	bh=579MKNArS0929nDc0KPbe9RoB8C9D8puaPgdPyZ8mNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QYRyFphrP/dYZdi+yV/KsATRC5qOg1GT3BlMHrKErq+e9E3ck42KpAVeFVaeaII0X+/ynPHUUMQB9r0Qq2OYutG1FPAkpUEhU+Ywd1d4V0E4uBhURh4UdBOW/yLmFMt0O0Tud1d41ryZNoa2VsM2SmLyOMcYJM+vHvurlJJSbSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=go4YQxCD; arc=fail smtp.client-ip=52.101.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFYatQW/9mkQrib8QIh6qNgxheg0ZdHCnLl69F0WxfAWUrEyL0aJDoCqCj1TNwtlfh8zFF/unxzHmq6mhCccrTY4HAgpNhl5PVZ2jJ96c9+EtGfJcgX3hOEqBbF1tZseiBlAjfnCt1mC027Lul6GT6xFAEm6HLab5IliI47PLV0gRWnFobkpVRXuthwymndXjhtS+SK8P8hJRFggCbR4ueLJY/JhDLm1L5wdSte/Q4yjz/mFkv+WLavCepNuqq+xBlrRcr3ZMclCZQdV7ZBKMjTrLcEflaC3QEeD7T+TBaaPrBCIpMUwdPPomzKjlHqKsrryCzFP5uaqkzRb93yZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKgN/O9s76S0m/TcUWMVCWzeKoozw0FCS+//Am32JtY=;
 b=b7yKqB8Uy4a0UkTSIFurNvK8sI7VsF+zXROHttt+3SlYdJVgKSqM5sQDiIpInQgRGQh0kMsCRPZOKt3o2VdbDe+0/hAKefrfxY2T6HAUUIAlolMMESBYJrPog1OGsWFCURhchtFi3/0B6wSEsbzvRtAgN9GtH5HcrwsZNad+Z2DiuGzaNxguA2Hy1MwjiMJ8KKfIqVRwr9saUVLsimGYsD39o4eFHOnsEAIHjZqLgkjuP8IJC6+c6s0HGdA6JLl2HXFU6pIcH8DouQOTgImnjYvXeKL3Lw0RbtEZM+bNShg9Kh31IzqhGusFwsmPfIArZyU1H5abZlX33AlxDWMw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKgN/O9s76S0m/TcUWMVCWzeKoozw0FCS+//Am32JtY=;
 b=go4YQxCDzsgZrAmJwgEj9gkTLMaWGMrZYU2nE6e39Zfqarw0ad0VC1vD5q8Ei1rGPTnQPmQGxnipSRwcMRRiybEVuHe8XQdIWZev3/mMYRSmA0+6VFLChOmDBJTKSlofPxS0dCr/m8JfpTxDgW53Df/dKSUFCWe7dzrwUl93hgzVt7PLF9IRnh0mZtmtckDlih7mJ7MnggzhHeYNVD98wzkp02c3uxW0yhlLjQkaR7ZMFF4oYJ+JeJ6Dn/NIgSuiU3TcaRKbu1h+iteU5wod8EP8SzODbF8o3Fvd7o/52PXE0mdOLdPg5Gc5A2P3HCyTxC3D5kmZroqVs2ycrhKiOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 19:20:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 19:20:04 +0000
Date: Tue, 27 Aug 2024 15:19:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Leonard <David.Leonard@digi.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: ls1046a: Add pinctrl driver support
Message-ID: <Zs4m2xZ9CTgPBGX8@lizhi-Precision-Tower-5810>
References: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0ecf4f4-94f1-2efd-b05b-fc117c62e516@digi.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e7d636-ecb7-4f5a-9a54-08dcc6cd4121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wg5k9swvUDf4cvEUo+DNYE76myqoPpK3uO72S6jwTDj/XJKx+oF1KqAcl2vr?=
 =?us-ascii?Q?uBm2sZxpMCwQ9JECGYNiMhqrkEwvGYlCDQPvSpMdXm98NdurbVeNtfeS6QTE?=
 =?us-ascii?Q?oO/hPwk0uaTjvL7Du7C3Ufe6qvaxCWiF6JRD9rpKuSk/s24QFAd9GOgboZYD?=
 =?us-ascii?Q?zM12SOYP9uIQjcVov0/geTiqwxsP40KIayWMIPYKCz7LZgRsKfz/Ki0dOCiV?=
 =?us-ascii?Q?XsT6t0qrRlYVABX+bSgisXpIEiP20ayl0L5trh6eCBPwdSvlD3NPKuOPEOj4?=
 =?us-ascii?Q?I6myS5rGXn525aJ+5+zzZf6qrVvgD578W5cCk85NF53ZcyizXjtHjyY5MWBw?=
 =?us-ascii?Q?GQYUb+FOcNO5x8EwZrqjCYhmRBSfGjcDlP+S5h2YQ8/NxuDg7pkZeRTPDBhe?=
 =?us-ascii?Q?xj57c4jbp3cuXQ8F6Y5QZKFELekrJrholDaVDyUft8K39WASv+4F1/Ac0yfF?=
 =?us-ascii?Q?eFmCfvGimX+V+EmaSfyvBPXvfpfDxcjIDOFirfuXFeMZ8EGBXV62M1iURw0N?=
 =?us-ascii?Q?Yc/e1MCFpe/10gr7Ehr+sNUrqlSWSLKubS6+7s9U6w7um0ff9tKP+t9jQ/25?=
 =?us-ascii?Q?ffbiKRjrohsSzfXFhbo+TRf9VA9IV+WWfulboJoaI7bLU5N4yl80FlCqZ0rb?=
 =?us-ascii?Q?E5cle2XqVFxgDyIlPEdWKBVrT+S3xsZ04e16LwWPkUOk0iEryCOtogqqqVDT?=
 =?us-ascii?Q?rCpYX9mlWi6lLxUzYtQASOl6qXw2F/zY5ozyB16/aGNHeGyDCtzNcYDhctfR?=
 =?us-ascii?Q?xJQRUHzoW2whyDZmRYO75eaqRjRm6QBru7rExNUtjMvR+1zE3vUYfeHIXlr8?=
 =?us-ascii?Q?tJ97Ua3csFJAjdgtbFKpgIHdmgfiOV8d0dx3BnMs0m4VyHVgquTz0twzg2f2?=
 =?us-ascii?Q?LLqDBeUTaWjYswUHjdzxQl0vAQ+8dSJzTMaedXbT3D5iUo3tghmVs5zatzgK?=
 =?us-ascii?Q?0Bdehsc9sr+rEX7VSm9CB33vTkIt5vrsqfYBezuX+Ehc1985gsgnPxvxaGmo?=
 =?us-ascii?Q?DpCUS/8fuJd2Jpoy4MrE9FOj7kEQDtswJtayi+5UVNRnJkiaBtIB5OrMuzjv?=
 =?us-ascii?Q?yvWfhz17DfKQrSJuws1VBRgQ4wU4zepv/CYlVTTCMsWqPcImG7hT9OeJ0Vi8?=
 =?us-ascii?Q?GUMwCflqHfetGmEviJYhQPcsCQGqmX4zQ0jWMiiiKfbRss7Uci5gdVejp2HO?=
 =?us-ascii?Q?ijBUTt8eg+EVuucgkxCK6cqXI0hl2ACIgOAYEvGP8oFiTtoIa3tqBL7bdrc6?=
 =?us-ascii?Q?e2XFznVJ0xbdfb01Iy1uqgjxIGxFXuEJUNZqK3BD4RyLPMYSBSArvpoqnU5u?=
 =?us-ascii?Q?Nas2rP1VAfN608/zJNQvfyCEmo4Xe9MxEYum3hTm+UTJhKs4J+VKSVMb+rqt?=
 =?us-ascii?Q?XfyyQMXIOgZugRy4xIG8/COQkJjQE2svGm7Sp/w776DoMAoi8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YK5tFIXP91d+oNTJV84LK3fNErmwbNuhFB2euGupWGwFWH/Tn38/stlBWd/F?=
 =?us-ascii?Q?WEaNS3Mv3KxuRisw/Ejh8IzslJ8HB6EBKF+WNn98b7Fo8dUELmi2sCDRelYY?=
 =?us-ascii?Q?48L7nBoH0TcmzHue7ryGRn9dxuFeu/3WE/kRgX/2seAG5OjViK8BVgFrPpfN?=
 =?us-ascii?Q?YwntnUS/R1lQkmqcdMpCgfN/MaXGwCVXR441gVpTFnkMtkAMMmEhKup7jDqE?=
 =?us-ascii?Q?yK57h3hnfnL/TOxjzVCAkNNXfx3eltYSQ0RpkzSBmHdUUx0iq+mg1OYOMklh?=
 =?us-ascii?Q?cbH4ASs1nZHIGolo5tY+Rw9LvwToXW6HFVuR3e6Fh+fF0t0WyScZ07CVlYfx?=
 =?us-ascii?Q?xAMuuxWuMcuT+hAKQr275quvoSlt5ymirvoC8TwrM+en1UuvijzBOHnIyr03?=
 =?us-ascii?Q?oP7m/VRA/xxZHCwlYoSF6gdMfY/KFoQxAuWB8rgrwUbQ5k5kAk3MplbNwYm2?=
 =?us-ascii?Q?lh9WLAXxF6ynmdpg7+82vSFk66SsKxRWrwadcbDFqUk9rNWFv/+aO5piVH3y?=
 =?us-ascii?Q?FYhL+404Lm6YHgtvPbPP0xHsNGUDQd+oMb1EjIRzCGReV/whzuFW+XB5S+uZ?=
 =?us-ascii?Q?TBQiPYIQ99kCyhxdMRwOT3JSgmKTbFdM0H9JoBRdBi1UiPULQUKKZswjqxf6?=
 =?us-ascii?Q?tJWStqgtEe+HvGqketLeSb6UIiYVvj8aBAh9TaEPctygyYIbdadTP1TLqWZu?=
 =?us-ascii?Q?jM3iXSFTIhzVjRo5Td8QeZjHlfOSBXLBFB/T24ks0/SZlvHBpL3VALIbFieW?=
 =?us-ascii?Q?QfmFFpvablD5IbU0XJ2V2otdtyE31okcPYN7cRfCr0Np4Bl8rLku3/cSR0SY?=
 =?us-ascii?Q?MmMbAqBaQN3sYdD/lzjJjPRkx3APF8asXgwsWxoEGXCXPJUbdbstCxvIp5LY?=
 =?us-ascii?Q?A7ZN3dxCn+3wzd6Ta2R9sbTbmo+brrzz/9P+b1WD6gomYQIBeLNPKqz8APwn?=
 =?us-ascii?Q?5PRk3r8K3kjsJBpVlWKub5vOjYqOiTzePZswQWQcmhKITZYj6prdhXiWDazq?=
 =?us-ascii?Q?SlXyrg5aaOJGP/9v/Q54iXWjlddXCd2qlUFecfAxqNTR1RJlOX0CvWEplWfk?=
 =?us-ascii?Q?rhKdXGBfpy/n9nvQCnEDSmlnxE7m02+m8xwBueIqaJx0fHqlzTK9sF3tG6H+?=
 =?us-ascii?Q?HjqJgCyHC5XcsbcyIzZK6LuhSj1LNIwbfUCnH5Cyn+o0ZSXdcrMJnBDbu/cd?=
 =?us-ascii?Q?zmizE7qa1DiSN5OIpEJNukUyf6WsxsM5CZPuIfsR5wlspfUI5u47kIbIKTkf?=
 =?us-ascii?Q?IxFFdT8FL23A/hev40G/bCgxO1XMdVIPaf2cQe8O1Jn6ntMtJUw/xkPRPp2K?=
 =?us-ascii?Q?5lZAD8vzvX7+kLwZswLbx/eANXGi0mEBA8Hdigh3eQ4Bbqht/S0xeCqBqThn?=
 =?us-ascii?Q?jPF0YyW00slNiKVUNylOsszH7F245yFS+bi9UXoy3jbduisL9GeK4vk8qiCN?=
 =?us-ascii?Q?8hzO+jznJbq5o5zN3zNdKJUdkCW4wPjRj/p+dwlPQ/C5hYeSNfEH+Ec/Ziix?=
 =?us-ascii?Q?YnXcp9F63tla2ySBrBXKUkN3BVAogCRmU/oZs0ZM/BX/eIr3ov2FDillOM+J?=
 =?us-ascii?Q?ZB1U+pkDWxhkIgYhsWc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e7d636-ecb7-4f5a-9a54-08dcc6cd4121
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 19:20:04.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vl6Gq6tpsJKY9yDhwvPPyCrE+GMdbx9iKQHQGtpSBKEaOaCVhvhQjcBCnt8KoCM2r0zV61nlvAsLiqkkIMVdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350

On Tue, Aug 27, 2024 at 12:12:24PM +1000, David Leonard wrote:
>
> Add QorIQ LS1046A pinctrl driver allowing i2c-core to exert
> GPIO control over the third and fourth I2C buses.
>
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---

Why not use pinctrl-single,  please ref fsl,lx2160x.dtsi for GPIO/i2c
recover.

Frank

>  drivers/pinctrl/freescale/Kconfig           |   8 +
>  drivers/pinctrl/freescale/Makefile          |   1 +
>  drivers/pinctrl/freescale/pinctrl-ls1046a.c | 224 ++++++++++++++++++++
>  3 files changed, 233 insertions(+)
>  create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1046a.c
>
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index a2038042eeae..2641db6c64c7 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -217,6 +217,14 @@ config PINCTRL_LS1012A
>  	help
>  	  Say Y here to enable the ls1012a pinctrl driver
>
> +config PINCTRL_LS1046A
> +	tristate "LS1046A pinctrl driver"
> +	depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	help
> +	  Say Y here to enable the ls1046a pinctrl driver
> +
>  config PINCTRL_VF610
>  	bool "Freescale Vybrid VF610 pinctrl driver"
>  	depends on SOC_VF610
> diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
> index 6926529d8635..66fec747af73 100644
> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile
> @@ -36,3 +36,4 @@ obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
>  obj-$(CONFIG_PINCTRL_IMXRT1050)	+= pinctrl-imxrt1050.o
>  obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
>  obj-$(CONFIG_PINCTRL_LS1012A)	+= pinctrl-ls1012a.o
> +obj-$(CONFIG_PINCTRL_LS1046A)	+= pinctrl-ls1046a.o
> diff --git a/drivers/pinctrl/freescale/pinctrl-ls1046a.c b/drivers/pinctrl/freescale/pinctrl-ls1046a.c
> new file mode 100644
> index 000000000000..9f5ec31f1e05
> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-ls1046a.c
> @@ -0,0 +1,224 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller for NXP QorIQ LS1046A.
> + *
> + * Copyright (c) 2024 Digi International, Inc.
> + * Author: David Leonard <David.Leonard@digi.com>
> + */
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/of.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/sys_soc.h>
> +
> +struct ls1046a_pinctrl_pdata {
> +	struct pinctrl_dev *pctl_dev;
> +	void __iomem *cr0mem;
> +	bool big_endian;
> +	u32 ssc;
> +};
> +
> +/*
> + *       L4           M4            M3           N3
> + *  i2c  IIC3_SCL     IIC3_SDA      IIC4_SCL     IIC4_SDA
> + *  gpio GPIO_4[10]   GPIO_4[11]    GPIO_4[12]   GPIO_4[13]
> + *  evt  EVT_B[5]     EVT_B[6]      EVT_B[7]     EVT_B[8]
> + *  usb  USB2_DRVVBUS USB2_PWRFAULT USB3_DRVVBUS USB3_PWRFAULT
> + *  ftm  FTM8_CH0     FTM8_CH1      FTM3_FAULT   FTM_EXT3CLK
> + */
> +
> +/* SCFG_RCWPMUXCR0 pinmux control register */
> +#define SCFG_RCWPMUXCR0			0x0157040c
> +#define RCWPMUXCR0_FIELD(shift, func)	((u32)(func) << (29 - (shift)))
> +#define RCWPMUXCR0_MASK(shift)		RCWPMUXCR0_FIELD(shift, RCWPMUXCR0_FUNC_MASK)
> +#define RCWPMUXCR0_IIC3_SCL_SHIFT	17
> +#define RCWPMUXCR0_IIC3_SDA_SHIFT	21
> +#define RCWPMUXCR0_IIC4_SCL_SHIFT	25
> +#define RCWPMUXCR0_IIC4_SDA_SHIFT	29
> +#define RCWPMUXCR0_FUNC_I2C		0
> +#define RCWPMUXCR0_FUNC_GPIO		1
> +#define RCWPMUXCR0_FUNC_EVT		2
> +#define RCWPMUXCR0_FUNC_USB		3
> +#define RCWPMUXCR0_FUNC_FTM		5
> +#define RCWPMUXCR0_FUNC_CLK		6
> +#define RCWPMUXCR0_FUNC_MASK		7
> +
> +#define PIN_L4 0 /* IIC3_SCL/GPIO_4[10]/EVT_B[5]/USB2_DRVVBUS/FTM8_CH0 */
> +#define PIN_M4 1 /* IIC3_SDA/GPIO_4[11]/EVT_B[6]/USB2_PWRFAULT/FTM8_CH1 */
> +#define PIN_M3 2 /* IIC4_SCL/GPIO_4[12]/EVT_B[7]/USB3_DRVVBUS/FTM3_FAULT */
> +#define PIN_N3 3 /* IIC4_SDA/GPIO_4[13]/EVT_B[8]/USB3_PWRFAULT/FTM_EXT3CLK */
> +
> +const struct pinctrl_pin_desc ls1046a_pins[] = {
> +	PINCTRL_PIN(PIN_L4, "L4"),
> +	PINCTRL_PIN(PIN_M4, "M4"),
> +	PINCTRL_PIN(PIN_M3, "M3"),
> +	PINCTRL_PIN(PIN_N3, "N3"),
> +};
> +
> +/* Each pin is its own group */
> +static const char * const ls1046a_groups[] = { "L4", "M4", "M3", "N3" };
> +
> +static int ls1046a_get_groups_count(struct pinctrl_dev *pcdev)
> +{
> +	return ARRAY_SIZE(ls1046a_pins);
> +}
> +
> +static const char *ls1046a_get_group_name(struct pinctrl_dev *pcdev,
> +	unsigned int selector)
> +{
> +	return ls1046a_pins[selector].name;
> +}
> +
> +static int ls1046a_get_group_pins(struct pinctrl_dev *pcdev,
> +	unsigned int selector, const unsigned int **pins, unsigned int *npins)
> +{
> +	*pins = &ls1046a_pins[selector].number;
> +	*npins = 1;
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops ls1046a_pinctrl_ops = {
> +	.get_groups_count = ls1046a_get_groups_count,
> +	.get_group_name = ls1046a_get_group_name,
> +	.get_group_pins = ls1046a_get_group_pins,
> +	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
> +	.dt_free_map = pinconf_generic_dt_free_map,
> +};
> +
> +/* Every pin has the same set of functions */
> +#define FUNC_i2c	0
> +#define FUNC_gpio	1
> +#define FUNC_evt	2
> +#define FUNC_usb	3
> +#define FUNC_ftm	4
> +
> +#define _PINFUNC(name) \
> +	[FUNC_##name] = PINCTRL_PINFUNCTION(#name, ls1046a_groups, ARRAY_SIZE(ls1046a_groups))
> +static const struct pinfunction ls1046a_functions[] = {
> +	_PINFUNC(i2c),
> +	_PINFUNC(gpio),
> +	_PINFUNC(evt),
> +	_PINFUNC(usb),
> +	_PINFUNC(ftm),
> +};
> +
> +static int ls1046a_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	return ARRAY_SIZE(ls1046a_functions);
> +}
> +
> +static const char *ls1046a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
> +{
> +	return ls1046a_functions[func].name;
> +}
> +
> +static int ls1046a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
> +	const char * const **groups,
> +	unsigned int * const ngroups)
> +{
> +	*groups = ls1046a_functions[func].groups;
> +	*ngroups = ls1046a_functions[func].ngroups;
> +	return 0;
> +}
> +
> +static int ls1046a_set_mux(struct pinctrl_dev *pcdev,
> +	unsigned int func, unsigned int pin)
> +{
> +	struct ls1046a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
> +	static const u32 cr0_reg_func[] = {
> +		[FUNC_i2c] = RCWPMUXCR0_FUNC_I2C,
> +		[FUNC_gpio] = RCWPMUXCR0_FUNC_GPIO,
> +		[FUNC_evt] = RCWPMUXCR0_FUNC_EVT,
> +		[FUNC_usb] = RCWPMUXCR0_FUNC_USB,
> +		[FUNC_ftm] = RCWPMUXCR0_FUNC_FTM,
> +	};
> +	static const unsigned int cr0_pin_shift[] = {
> +		[PIN_L4] = RCWPMUXCR0_IIC3_SCL_SHIFT,
> +		[PIN_M4] = RCWPMUXCR0_IIC3_SDA_SHIFT,
> +		[PIN_M3] = RCWPMUXCR0_IIC4_SCL_SHIFT,
> +		[PIN_N3] = RCWPMUXCR0_IIC4_SDA_SHIFT,
> +	};
> +	u32 cr0;
> +
> +	if (pd->big_endian)
> +		cr0 = ioread32be(pd->cr0mem);
> +	else
> +		cr0 = ioread32(pd->cr0mem);
> +
> +	unsigned int pin_shift = cr0_pin_shift[pin];
> +	u32 reg_func = cr0_reg_func[func];
> +	u32 newcr0 = (cr0 & ~RCWPMUXCR0_MASK(pin_shift)) |
> +		RCWPMUXCR0_FIELD(pin_shift, reg_func);
> +
> +	if (pd->big_endian)
> +		iowrite32be(newcr0, pd->cr0mem);
> +	else
> +		iowrite32(newcr0, pd->cr0mem);
> +	return 0;
> +}
> +
> +static const struct pinmux_ops ls1046a_pinmux_ops = {
> +	.get_functions_count = ls1046a_get_functions_count,
> +	.get_function_name = ls1046a_get_function_name,
> +	.get_function_groups = ls1046a_get_function_groups,
> +	.set_mux = ls1046a_set_mux,
> +};
> +
> +static const struct pinctrl_desc ls1046a_pinctrl_desc = {
> +	.name = "ls1046a",
> +	.pins = ls1046a_pins,
> +	.npins = ARRAY_SIZE(ls1046a_pins),
> +	.pctlops = &ls1046a_pinctrl_ops,
> +	.pmxops = &ls1046a_pinmux_ops,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int ls1046a_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct ls1046a_pinctrl_pdata *pd;
> +	int ret;
> +
> +	pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, pd);
> +
> +	pd->big_endian = device_is_big_endian(&pdev->dev);
> +
> +	/* SCFG PMUX0 */
> +	pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pd->cr0mem))
> +		return PTR_ERR(pd->cr0mem);
> +	dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
> +		pd->big_endian ? "be" : "le");
> +
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1046a_pinctrl_desc,
> +		pd, &pd->pctl_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
> +
> +	pinctrl_enable(pd->pctl_dev);
> +	return ret;
> +}
> +
> +static const struct of_device_id ls1046a_pinctrl_match_table[] = {
> +	{ .compatible = "fsl,ls1046a-pinctrl" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver ls1046a_pinctrl_driver = {
> +	.driver = {
> +		.name = "ls1046a_pinctrl",
> +		.of_match_table = ls1046a_pinctrl_match_table,
> +	},
> +	.probe = ls1046a_pinctrl_probe,
> +};
> +
> +builtin_platform_driver(ls1046a_pinctrl_driver)
> +
> +MODULE_DESCRIPTION("LS1046A pinctrl driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

