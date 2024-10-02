Return-Path: <linux-gpio+bounces-10734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15298DF6F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E173B21AA2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98921D042F;
	Wed,  2 Oct 2024 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gTw01HMn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA623CE
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883269; cv=fail; b=QmTzF77zfQzmcT5ihwsw5Lelcn/jOZ0cndBUKaRhoQhfG9XYnizO62sPn476hvdfvkvSdkSU3dz0baQeBfS2r2kVfT6dwm45gt7vqn8D+Y6CgJuOcewkM+kWsGMLsZCs0xUHTEtYcTB6cPsJCVgiW22IFKrzmCdpnZ3BmsX8teg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883269; c=relaxed/simple;
	bh=xZaeChnawPmyhVCifTYAF6LSRNwDtIRqJBRYxQokvm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tUP7j9Iccup2gsfw3OZx4wTjKdSHjKLV7u7MOejp+KBtfC1KW0FWMEJqn+jnPN2QMYLsK76mhmB7RFDiAvw/GhNSdZtfnXVkJRL4kYpdGHZJOze6H9hBAqnxr/B4m+imc52BwcAuA/g/VfqoWMBMf6G3RVelJ9wmaHGbpU4yXvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gTw01HMn; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwq0pyFyFpYgb0ypkNPu9FlY2NYTaddrNVQ2Wr6kCi+IbuDs0tzWLd38eY25gJKTciXCA5MfrU/Lr0QOfwdGibllrL8xnzW3A5HniUZ1CiQhxW/94nhUxbl1q+RC6VvAaXZcWg4Sq1hGm6hb762oUzDVGfh3+5M/V7QSFrkpfWygKqVLUQ3u928gejvCfMV6E/nUow+YhwXPoqw3oHyFqp2xfeB4Q4ZaYUJDjVPDAw8zK3ol8nj8wKGpHAe9ZZaZEhfGq/exXg9Dn0Z7cpPUFS4mxhDKZbJw0cOxaAr/YOSKdzkSlBfBUviVZjgAkF8BCvTHoNtLN6VGNAAhd/0MSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97JynLNleZvbXl13BgQ2E/oWBdMa+pSZN8tcTVVQOK4=;
 b=qYZx+lut5qV2gKYPwi0UqyLBuCUL3mfEeK2LeKrMMcclq4661/rl0a8efwq8Gisr8Xci8EJen3h5SkNfAPT2JVMwMkVpbz0v5FGb/tOGj1iiU0G8qbEiVER9AK/Rg+WumkV2u/pcc2t7Crjuk+DTipdUASoLZoUv2IR77v+JIIXU1S2iCV17MZMc1SQ5dlcjpdbgf/R2z++gVeBtW2FWz3W1v1JV+sxfjykxlzL18lkNoQZYnf+EcAdzZG+TjtErh1I5cBTteQl8aJozgZQUd1m0YsJbOsH0GeBfp4hR3niRaqunEgxW8wOlvwvVWGV7S0CMbTmzwb9TG07z43U1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97JynLNleZvbXl13BgQ2E/oWBdMa+pSZN8tcTVVQOK4=;
 b=gTw01HMnxzhXSW345/FsOdyC3vUsfabPZD0+/JxqmHO9DQPwi3xjsyjU+n5zQEBx+4fqzAUoPYcht5sRx6nmM2ZRiK5X0e+zleoDx6KQwENPsD8vanuNTKGdIZ9SZF4b9qzJWzQYGiIEgvEfDMMhF6zmAnd7up7q28YZv/hwcyIW8meHsrXuTtksm3twnsuKr1MJP66Fzdt7KV3GmQHbw52Ivf4dI5xVZxw+Wt7PbbkWlZblNy08RNFbltA3BL7q3Pos/QDztC6X7eovuS/W5fE8/dn1bslzWaAy5UzYCTc8iJNppbvhMsGQTkTpzdJ5mh8ziH1W00kvGd+UWn9pag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:34:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8005.024; Wed, 2 Oct 2024
 15:34:23 +0000
Date: Wed, 2 Oct 2024 11:34:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] pinctrl: imx1: Fix too generic defines
Message-ID: <Zv1n9vrC7tuWmTCt@lizhi-Precision-Tower-5810>
References: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-fix-imx-pc-v1-1-95f8b89400ee@linaro.org>
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bcfa13-ef61-4b77-2fb4-08dce2f7b0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GoXyYRG5uXE9zq55/BCQXIxwfwjyD6F3MsoKbpYWoElOZYN32TQZ2p1e0aZ3?=
 =?us-ascii?Q?Mj7Ivzm4NorfkmsMPzctwrP9kHeFHkTgjvL98jDn7GFHgpwV9+YbieE6gxnc?=
 =?us-ascii?Q?KFU0otyirq3g2u2RCM1S/xmYP0u83KHDeatY4czdscRBSTgC5wfLdriUTLqW?=
 =?us-ascii?Q?hTbLCKQgQjhyTo9lHDZ67iGrGoxu+fXDwgjec7Mc3qI+tq0WkzVtsf4+0V54?=
 =?us-ascii?Q?u8s6jG0cUK/lOopiu9iwhFY71AS3VXdJFIyDxkUjkYII13OM9x6InEhlqisi?=
 =?us-ascii?Q?c0Mn3TUTHRTZ9h9FBEGG+buvw6/wJ5QjF1rkrEL+a3wbbabJd4/jHc8ygat9?=
 =?us-ascii?Q?1DCJBHER37zxa+QhPgqki133dZX4OBcE/jN/NnD6AxsFE2NC6jvHV5VO3FhJ?=
 =?us-ascii?Q?88JyxIpBrARkoZvLgnl+MhFS4lq4MY5KmsZH6gDEYggpIpTl//OEQgzMx+wr?=
 =?us-ascii?Q?M2jLDH3wkkK/0db6K9pmajXRlkO+FxEOutqpT1Ob1r/7pWbu1ysuH6NnJCox?=
 =?us-ascii?Q?bfGs079NUHzG9RT0llRIOloHtWPJHAdN3zpyXNpCZuM2jvMkNLrLJRPbfQK8?=
 =?us-ascii?Q?mpkhrC1W8A27aBTw3pVBwImGSPiiWlp+4RsOuNFZ3Lzy4eZ19CZY9jdeCbUz?=
 =?us-ascii?Q?se9td+L3QXI3cwZNEjUAkZ+a86Y4S6MXHmXSp81vu23dhSlgdxEQix5Z4hbH?=
 =?us-ascii?Q?D1RKdUu4EY15gCQ7LhgXqRntlM7cg5oWVrbpLnfLpfAd9eCYeJ1D7km4CiEc?=
 =?us-ascii?Q?4LuvBlrGJ1ExnEFTUc9C4VujjMJ7gzrGMnA2dugcWvKTjixF7ooE6wA/Frpu?=
 =?us-ascii?Q?R6Qmgh0oGUMCVHvQSYHqn4/UFsM26cCmBa9OhUpFXs/7O/D+qoDpLSKm3jwa?=
 =?us-ascii?Q?5sPeGTLv17YNSU9R9lTDOAZyDyPkP6MsKeLUQeyFzZHVtwGwvMHJnHtB9/VX?=
 =?us-ascii?Q?otXrmHTS88Ud6Zb0leDOLmuQxad9tC0mopqOcCz+P3vpHyC+tWi/12FOC5z6?=
 =?us-ascii?Q?m0q15HuOOFrYgqeUVtyZnisk/kvY3SExk8MmRo/VJdtbsBtkTu5fHmXqN+Pd?=
 =?us-ascii?Q?p00ukjTEdmPK13+94S+/K3v4PMuNAuvVFxtytJD+8fxSN7RQuoqtTO6X58y/?=
 =?us-ascii?Q?g32Lp89VnOjUUP5HMEoQ0BfnkjKjnBP4lts1Ro0zT98wiurCxeljZEkjgfar?=
 =?us-ascii?Q?lEt+oXjQ/EeJONdqSk6BKlvcWCYDmU70n986Kvw1YcFvr7HpnHe62x0C7tw+?=
 =?us-ascii?Q?Q5oAO2S1AneJW1P2DJsnkHzqRXTrKsJEWJkDZAnDKjjupEPzyGmolMO9IItV?=
 =?us-ascii?Q?vBPuSXu+1D8bSB760yp2b7kmVO+EaVeXvPgTKOaYi8LC1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LNNHGT+zVbjkOW3ot7tTrNzMlGDJSAr2COVRHdqqTKN9s+lDPe2mmArh1rK/?=
 =?us-ascii?Q?nLRNfnA/pbVe0t/cwHjeZIObGbzBuZ5TBPx7jvzxWr6Xh4B5j4h4MwA4PxcL?=
 =?us-ascii?Q?yLkuuX4X7aFfaYx3cBSIA28vWnFbIoJHvfF1RQs4rNJQtjmuSfh6x21xo4pi?=
 =?us-ascii?Q?NNdjeFjpvyPD60B/sUbaFAJmvtmhMKCOWaSXnLVwJ4CqH1oW9l7spuwtuUnX?=
 =?us-ascii?Q?txc/ienQ4MDFfva5YHZxizVJfHNNvYcIeYCkHsLsRwBHMthwIXUOpQ4iiNhW?=
 =?us-ascii?Q?tJwma6WTlNWXf6NoHDxWoVO36/7mD88575modCsjSXa4qphJWoDUvUkg+tBm?=
 =?us-ascii?Q?fvs8FXd/tiG+IYg/wPsOfsafm5HAW7r1ZpYGJOxsUZWEtSpe8LXBtP8oy5Ed?=
 =?us-ascii?Q?aK97azfU/V2c/xG+2XjvVZhyx29oM6kbK6iGEqsPpj/WxlmfoN1Kz6tYxJMI?=
 =?us-ascii?Q?Mr075vNDXdFK5oa5D1AuHPpLYJGWKkYWY6FEpolOQ8rFtxDH+1xNnP/6UtPQ?=
 =?us-ascii?Q?Uy4I/1SG6jgk9yq4WRdFFpE/OivZ7A98JBRjqKO8QGHLbZKrb7Ybma7/OpAK?=
 =?us-ascii?Q?f0Va+jCZQDRkFZi6th0IsvXuxOmXn0EP9amZjefi8L9DkO57k0of72pcc7NG?=
 =?us-ascii?Q?RJEn8cS6DhXkojIl8Z7vDPGLJtNycDGRjR5g9CTwnXiDU6iH9h6cgafX5J8L?=
 =?us-ascii?Q?WpjfBIVzObMS05brMC5o6fe7sj8WuYbjGjN7E3ml8DZaVJFlBmlX5WI+WCDa?=
 =?us-ascii?Q?swy0CJSMIXg54kYFh42wzLAJIQFH2zvTClRCLNtUGhP6cvQguJAJR+q/Q0Tm?=
 =?us-ascii?Q?H92raz6E/wpAM0BYESnE0Z1paKxck+sQFyWnmMtn94n4kz0EgcTnjhsA6zqu?=
 =?us-ascii?Q?Q7nhrEWg4O379oS82lD1rYty72H1FXg2UeZK3RURfkTyRmIcfyTd6FUmjJ5d?=
 =?us-ascii?Q?WbGndU3+h/lBzlJAV6bFUmcp6vsQWcNY+IDqHYTsff8RwLA0zyKlgCyUfk77?=
 =?us-ascii?Q?w/wUcM19q5PAV+6wEUd+H1plBh0RpqhYQz66qfd+mXUHdX24ZsUmy5C7iNYv?=
 =?us-ascii?Q?lzalIqret+JorZZGoEPEbiVvVHXHxalUh+E+p84NIokdW7ph7enrOfyoY+Wv?=
 =?us-ascii?Q?17+RjPjRxzYS7uz7pZbKcUm1pxNNghI4Qb/WTHWYD7S8h2/oCd4MXRoJRXRk?=
 =?us-ascii?Q?9tSIwCaNDLtgxstUbeA/e8eGGp+uidnqHPOuN+fTsR19DrtYgC2pBqqsFRq1?=
 =?us-ascii?Q?DoyzHJlz4XpxQKVs0PHXW+lLQzb2Oyz27TiESy4RgcW5+ixbd778mSsnf1Z2?=
 =?us-ascii?Q?AzXI1EEYPJDFovUih1iWL0CFfwY19UNyjFcs37tvTr21XFLj/8WF+KRuB1tG?=
 =?us-ascii?Q?UmmJ8cevEx6ZI5sgW86CYs9ffVwoVLUSj3rpSTpZxLK8TjIom7fAuhTH7BUO?=
 =?us-ascii?Q?PZevJVjZzJ01oEZ3tNv4kna3vNzYCT/qoytWODr4LE/8O6Kg2hVVUrmp/qA3?=
 =?us-ascii?Q?IzHZYpKy5TcXH3DTlCOip9ygS7KMtFSrdxRluJHz8j8ZBcHyKC/8gg5y9JqP?=
 =?us-ascii?Q?B7Q4N9PB0rlNpPNFCpN4yap/NaUxHWSqT+ovXHwb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bcfa13-ef61-4b77-2fb4-08dce2f7b0f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:34:23.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPoAVitmjx5LMMFCkhiVwxhcYpfXzSNSQhcv0R+VyeDhIz1MMtR7LHDnkqBUXmlLAeKq7REtHBjDDXFGHfOqvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837

On Wed, Oct 02, 2024 at 04:22:49PM +0200, Linus Walleij wrote:
> The "PC" define is colliding with the (apparently broadcased)
> define for "program counter" on Loongarch, so let's rename all
> these 2-letter defines so they don't collide with stuff.

nit: wrap to 75 chars

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Fixes: a55222b7a132 pinctrl: freescale: enable use with COMPILE_TEST
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410020940.wGISlWfV-lkp@intel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx1.c | 228 +++++++++++++++----------------
>  1 file changed, 114 insertions(+), 114 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1.c b/drivers/pinctrl/freescale/pinctrl-imx1.c
> index 1e2b0fe9ffd6..bd39cadf1f34 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1.c
> @@ -12,122 +12,122 @@
>  #include "pinctrl-imx1.h"
>
>  #define PAD_ID(port, pin)	((port) * 32 + (pin))
> -#define PA	0
> -#define PB	1
> -#define PC	2
> -#define PD	3
> +#define IMX1_PA	0
> +#define IMX1_PB	1
> +#define IMX1_PC	2
> +#define IMX1_PD	3
>
>  enum imx1_pads {
> -	MX1_PAD_A24		= PAD_ID(PA, 0),
> -	MX1_PAD_TIN		= PAD_ID(PA, 1),
> -	MX1_PAD_PWMO		= PAD_ID(PA, 2),
> -	MX1_PAD_CSI_MCLK	= PAD_ID(PA, 3),
> -	MX1_PAD_CSI_D0		= PAD_ID(PA, 4),
> -	MX1_PAD_CSI_D1		= PAD_ID(PA, 5),
> -	MX1_PAD_CSI_D2		= PAD_ID(PA, 6),
> -	MX1_PAD_CSI_D3		= PAD_ID(PA, 7),
> -	MX1_PAD_CSI_D4		= PAD_ID(PA, 8),
> -	MX1_PAD_CSI_D5		= PAD_ID(PA, 9),
> -	MX1_PAD_CSI_D6		= PAD_ID(PA, 10),
> -	MX1_PAD_CSI_D7		= PAD_ID(PA, 11),
> -	MX1_PAD_CSI_VSYNC	= PAD_ID(PA, 12),
> -	MX1_PAD_CSI_HSYNC	= PAD_ID(PA, 13),
> -	MX1_PAD_CSI_PIXCLK	= PAD_ID(PA, 14),
> -	MX1_PAD_I2C_SDA		= PAD_ID(PA, 15),
> -	MX1_PAD_I2C_SCL		= PAD_ID(PA, 16),
> -	MX1_PAD_DTACK		= PAD_ID(PA, 17),
> -	MX1_PAD_BCLK		= PAD_ID(PA, 18),
> -	MX1_PAD_LBA		= PAD_ID(PA, 19),
> -	MX1_PAD_ECB		= PAD_ID(PA, 20),
> -	MX1_PAD_A0		= PAD_ID(PA, 21),
> -	MX1_PAD_CS4		= PAD_ID(PA, 22),
> -	MX1_PAD_CS5		= PAD_ID(PA, 23),
> -	MX1_PAD_A16		= PAD_ID(PA, 24),
> -	MX1_PAD_A17		= PAD_ID(PA, 25),
> -	MX1_PAD_A18		= PAD_ID(PA, 26),
> -	MX1_PAD_A19		= PAD_ID(PA, 27),
> -	MX1_PAD_A20		= PAD_ID(PA, 28),
> -	MX1_PAD_A21		= PAD_ID(PA, 29),
> -	MX1_PAD_A22		= PAD_ID(PA, 30),
> -	MX1_PAD_A23		= PAD_ID(PA, 31),
> -	MX1_PAD_SD_DAT0		= PAD_ID(PB, 8),
> -	MX1_PAD_SD_DAT1		= PAD_ID(PB, 9),
> -	MX1_PAD_SD_DAT2		= PAD_ID(PB, 10),
> -	MX1_PAD_SD_DAT3		= PAD_ID(PB, 11),
> -	MX1_PAD_SD_SCLK		= PAD_ID(PB, 12),
> -	MX1_PAD_SD_CMD		= PAD_ID(PB, 13),
> -	MX1_PAD_SIM_SVEN	= PAD_ID(PB, 14),
> -	MX1_PAD_SIM_PD		= PAD_ID(PB, 15),
> -	MX1_PAD_SIM_TX		= PAD_ID(PB, 16),
> -	MX1_PAD_SIM_RX		= PAD_ID(PB, 17),
> -	MX1_PAD_SIM_RST		= PAD_ID(PB, 18),
> -	MX1_PAD_SIM_CLK		= PAD_ID(PB, 19),
> -	MX1_PAD_USBD_AFE	= PAD_ID(PB, 20),
> -	MX1_PAD_USBD_OE		= PAD_ID(PB, 21),
> -	MX1_PAD_USBD_RCV	= PAD_ID(PB, 22),
> -	MX1_PAD_USBD_SUSPND	= PAD_ID(PB, 23),
> -	MX1_PAD_USBD_VP		= PAD_ID(PB, 24),
> -	MX1_PAD_USBD_VM		= PAD_ID(PB, 25),
> -	MX1_PAD_USBD_VPO	= PAD_ID(PB, 26),
> -	MX1_PAD_USBD_VMO	= PAD_ID(PB, 27),
> -	MX1_PAD_UART2_CTS	= PAD_ID(PB, 28),
> -	MX1_PAD_UART2_RTS	= PAD_ID(PB, 29),
> -	MX1_PAD_UART2_TXD	= PAD_ID(PB, 30),
> -	MX1_PAD_UART2_RXD	= PAD_ID(PB, 31),
> -	MX1_PAD_SSI_RXFS	= PAD_ID(PC, 3),
> -	MX1_PAD_SSI_RXCLK	= PAD_ID(PC, 4),
> -	MX1_PAD_SSI_RXDAT	= PAD_ID(PC, 5),
> -	MX1_PAD_SSI_TXDAT	= PAD_ID(PC, 6),
> -	MX1_PAD_SSI_TXFS	= PAD_ID(PC, 7),
> -	MX1_PAD_SSI_TXCLK	= PAD_ID(PC, 8),
> -	MX1_PAD_UART1_CTS	= PAD_ID(PC, 9),
> -	MX1_PAD_UART1_RTS	= PAD_ID(PC, 10),
> -	MX1_PAD_UART1_TXD	= PAD_ID(PC, 11),
> -	MX1_PAD_UART1_RXD	= PAD_ID(PC, 12),
> -	MX1_PAD_SPI1_RDY	= PAD_ID(PC, 13),
> -	MX1_PAD_SPI1_SCLK	= PAD_ID(PC, 14),
> -	MX1_PAD_SPI1_SS		= PAD_ID(PC, 15),
> -	MX1_PAD_SPI1_MISO	= PAD_ID(PC, 16),
> -	MX1_PAD_SPI1_MOSI	= PAD_ID(PC, 17),
> -	MX1_PAD_BT13		= PAD_ID(PC, 19),
> -	MX1_PAD_BT12		= PAD_ID(PC, 20),
> -	MX1_PAD_BT11		= PAD_ID(PC, 21),
> -	MX1_PAD_BT10		= PAD_ID(PC, 22),
> -	MX1_PAD_BT9		= PAD_ID(PC, 23),
> -	MX1_PAD_BT8		= PAD_ID(PC, 24),
> -	MX1_PAD_BT7		= PAD_ID(PC, 25),
> -	MX1_PAD_BT6		= PAD_ID(PC, 26),
> -	MX1_PAD_BT5		= PAD_ID(PC, 27),
> -	MX1_PAD_BT4		= PAD_ID(PC, 28),
> -	MX1_PAD_BT3		= PAD_ID(PC, 29),
> -	MX1_PAD_BT2		= PAD_ID(PC, 30),
> -	MX1_PAD_BT1		= PAD_ID(PC, 31),
> -	MX1_PAD_LSCLK		= PAD_ID(PD, 6),
> -	MX1_PAD_REV		= PAD_ID(PD, 7),
> -	MX1_PAD_CLS		= PAD_ID(PD, 8),
> -	MX1_PAD_PS		= PAD_ID(PD, 9),
> -	MX1_PAD_SPL_SPR		= PAD_ID(PD, 10),
> -	MX1_PAD_CONTRAST	= PAD_ID(PD, 11),
> -	MX1_PAD_ACD_OE		= PAD_ID(PD, 12),
> -	MX1_PAD_LP_HSYNC	= PAD_ID(PD, 13),
> -	MX1_PAD_FLM_VSYNC	= PAD_ID(PD, 14),
> -	MX1_PAD_LD0		= PAD_ID(PD, 15),
> -	MX1_PAD_LD1		= PAD_ID(PD, 16),
> -	MX1_PAD_LD2		= PAD_ID(PD, 17),
> -	MX1_PAD_LD3		= PAD_ID(PD, 18),
> -	MX1_PAD_LD4		= PAD_ID(PD, 19),
> -	MX1_PAD_LD5		= PAD_ID(PD, 20),
> -	MX1_PAD_LD6		= PAD_ID(PD, 21),
> -	MX1_PAD_LD7		= PAD_ID(PD, 22),
> -	MX1_PAD_LD8		= PAD_ID(PD, 23),
> -	MX1_PAD_LD9		= PAD_ID(PD, 24),
> -	MX1_PAD_LD10		= PAD_ID(PD, 25),
> -	MX1_PAD_LD11		= PAD_ID(PD, 26),
> -	MX1_PAD_LD12		= PAD_ID(PD, 27),
> -	MX1_PAD_LD13		= PAD_ID(PD, 28),
> -	MX1_PAD_LD14		= PAD_ID(PD, 29),
> -	MX1_PAD_LD15		= PAD_ID(PD, 30),
> -	MX1_PAD_TMR2OUT		= PAD_ID(PD, 31),
> +	MX1_PAD_A24		= PAD_ID(IMX1_PA, 0),
> +	MX1_PAD_TIN		= PAD_ID(IMX1_PA, 1),
> +	MX1_PAD_PWMO		= PAD_ID(IMX1_PA, 2),
> +	MX1_PAD_CSI_MCLK	= PAD_ID(IMX1_PA, 3),
> +	MX1_PAD_CSI_D0		= PAD_ID(IMX1_PA, 4),
> +	MX1_PAD_CSI_D1		= PAD_ID(IMX1_PA, 5),
> +	MX1_PAD_CSI_D2		= PAD_ID(IMX1_PA, 6),
> +	MX1_PAD_CSI_D3		= PAD_ID(IMX1_PA, 7),
> +	MX1_PAD_CSI_D4		= PAD_ID(IMX1_PA, 8),
> +	MX1_PAD_CSI_D5		= PAD_ID(IMX1_PA, 9),
> +	MX1_PAD_CSI_D6		= PAD_ID(IMX1_PA, 10),
> +	MX1_PAD_CSI_D7		= PAD_ID(IMX1_PA, 11),
> +	MX1_PAD_CSI_VSYNC	= PAD_ID(IMX1_PA, 12),
> +	MX1_PAD_CSI_HSYNC	= PAD_ID(IMX1_PA, 13),
> +	MX1_PAD_CSI_PIXCLK	= PAD_ID(IMX1_PA, 14),
> +	MX1_PAD_I2C_SDA		= PAD_ID(IMX1_PA, 15),
> +	MX1_PAD_I2C_SCL		= PAD_ID(IMX1_PA, 16),
> +	MX1_PAD_DTACK		= PAD_ID(IMX1_PA, 17),
> +	MX1_PAD_BCLK		= PAD_ID(IMX1_PA, 18),
> +	MX1_PAD_LBA		= PAD_ID(IMX1_PA, 19),
> +	MX1_PAD_ECB		= PAD_ID(IMX1_PA, 20),
> +	MX1_PAD_A0		= PAD_ID(IMX1_PA, 21),
> +	MX1_PAD_CS4		= PAD_ID(IMX1_PA, 22),
> +	MX1_PAD_CS5		= PAD_ID(IMX1_PA, 23),
> +	MX1_PAD_A16		= PAD_ID(IMX1_PA, 24),
> +	MX1_PAD_A17		= PAD_ID(IMX1_PA, 25),
> +	MX1_PAD_A18		= PAD_ID(IMX1_PA, 26),
> +	MX1_PAD_A19		= PAD_ID(IMX1_PA, 27),
> +	MX1_PAD_A20		= PAD_ID(IMX1_PA, 28),
> +	MX1_PAD_A21		= PAD_ID(IMX1_PA, 29),
> +	MX1_PAD_A22		= PAD_ID(IMX1_PA, 30),
> +	MX1_PAD_A23		= PAD_ID(IMX1_PA, 31),
> +	MX1_PAD_SD_DAT0		= PAD_ID(IMX1_PB, 8),
> +	MX1_PAD_SD_DAT1		= PAD_ID(IMX1_PB, 9),
> +	MX1_PAD_SD_DAT2		= PAD_ID(IMX1_PB, 10),
> +	MX1_PAD_SD_DAT3		= PAD_ID(IMX1_PB, 11),
> +	MX1_PAD_SD_SCLK		= PAD_ID(IMX1_PB, 12),
> +	MX1_PAD_SD_CMD		= PAD_ID(IMX1_PB, 13),
> +	MX1_PAD_SIM_SVEN	= PAD_ID(IMX1_PB, 14),
> +	MX1_PAD_SIM_PD		= PAD_ID(IMX1_PB, 15),
> +	MX1_PAD_SIM_TX		= PAD_ID(IMX1_PB, 16),
> +	MX1_PAD_SIM_RX		= PAD_ID(IMX1_PB, 17),
> +	MX1_PAD_SIM_RST		= PAD_ID(IMX1_PB, 18),
> +	MX1_PAD_SIM_CLK		= PAD_ID(IMX1_PB, 19),
> +	MX1_PAD_USBD_AFE	= PAD_ID(IMX1_PB, 20),
> +	MX1_PAD_USBD_OE		= PAD_ID(IMX1_PB, 21),
> +	MX1_PAD_USBD_RCV	= PAD_ID(IMX1_PB, 22),
> +	MX1_PAD_USBD_SUSPND	= PAD_ID(IMX1_PB, 23),
> +	MX1_PAD_USBD_VP		= PAD_ID(IMX1_PB, 24),
> +	MX1_PAD_USBD_VM		= PAD_ID(IMX1_PB, 25),
> +	MX1_PAD_USBD_VPO	= PAD_ID(IMX1_PB, 26),
> +	MX1_PAD_USBD_VMO	= PAD_ID(IMX1_PB, 27),
> +	MX1_PAD_UART2_CTS	= PAD_ID(IMX1_PB, 28),
> +	MX1_PAD_UART2_RTS	= PAD_ID(IMX1_PB, 29),
> +	MX1_PAD_UART2_TXD	= PAD_ID(IMX1_PB, 30),
> +	MX1_PAD_UART2_RXD	= PAD_ID(IMX1_PB, 31),
> +	MX1_PAD_SSI_RXFS	= PAD_ID(IMX1_PC, 3),
> +	MX1_PAD_SSI_RXCLK	= PAD_ID(IMX1_PC, 4),
> +	MX1_PAD_SSI_RXDAT	= PAD_ID(IMX1_PC, 5),
> +	MX1_PAD_SSI_TXDAT	= PAD_ID(IMX1_PC, 6),
> +	MX1_PAD_SSI_TXFS	= PAD_ID(IMX1_PC, 7),
> +	MX1_PAD_SSI_TXCLK	= PAD_ID(IMX1_PC, 8),
> +	MX1_PAD_UART1_CTS	= PAD_ID(IMX1_PC, 9),
> +	MX1_PAD_UART1_RTS	= PAD_ID(IMX1_PC, 10),
> +	MX1_PAD_UART1_TXD	= PAD_ID(IMX1_PC, 11),
> +	MX1_PAD_UART1_RXD	= PAD_ID(IMX1_PC, 12),
> +	MX1_PAD_SPI1_RDY	= PAD_ID(IMX1_PC, 13),
> +	MX1_PAD_SPI1_SCLK	= PAD_ID(IMX1_PC, 14),
> +	MX1_PAD_SPI1_SS		= PAD_ID(IMX1_PC, 15),
> +	MX1_PAD_SPI1_MISO	= PAD_ID(IMX1_PC, 16),
> +	MX1_PAD_SPI1_MOSI	= PAD_ID(IMX1_PC, 17),
> +	MX1_PAD_BT13		= PAD_ID(IMX1_PC, 19),
> +	MX1_PAD_BT12		= PAD_ID(IMX1_PC, 20),
> +	MX1_PAD_BT11		= PAD_ID(IMX1_PC, 21),
> +	MX1_PAD_BT10		= PAD_ID(IMX1_PC, 22),
> +	MX1_PAD_BT9		= PAD_ID(IMX1_PC, 23),
> +	MX1_PAD_BT8		= PAD_ID(IMX1_PC, 24),
> +	MX1_PAD_BT7		= PAD_ID(IMX1_PC, 25),
> +	MX1_PAD_BT6		= PAD_ID(IMX1_PC, 26),
> +	MX1_PAD_BT5		= PAD_ID(IMX1_PC, 27),
> +	MX1_PAD_BT4		= PAD_ID(IMX1_PC, 28),
> +	MX1_PAD_BT3		= PAD_ID(IMX1_PC, 29),
> +	MX1_PAD_BT2		= PAD_ID(IMX1_PC, 30),
> +	MX1_PAD_BT1		= PAD_ID(IMX1_PC, 31),
> +	MX1_PAD_LSCLK		= PAD_ID(IMX1_PD, 6),
> +	MX1_PAD_REV		= PAD_ID(IMX1_PD, 7),
> +	MX1_PAD_CLS		= PAD_ID(IMX1_PD, 8),
> +	MX1_PAD_PS		= PAD_ID(IMX1_PD, 9),
> +	MX1_PAD_SPL_SPR		= PAD_ID(IMX1_PD, 10),
> +	MX1_PAD_CONTRAST	= PAD_ID(IMX1_PD, 11),
> +	MX1_PAD_ACD_OE		= PAD_ID(IMX1_PD, 12),
> +	MX1_PAD_LP_HSYNC	= PAD_ID(IMX1_PD, 13),
> +	MX1_PAD_FLM_VSYNC	= PAD_ID(IMX1_PD, 14),
> +	MX1_PAD_LD0		= PAD_ID(IMX1_PD, 15),
> +	MX1_PAD_LD1		= PAD_ID(IMX1_PD, 16),
> +	MX1_PAD_LD2		= PAD_ID(IMX1_PD, 17),
> +	MX1_PAD_LD3		= PAD_ID(IMX1_PD, 18),
> +	MX1_PAD_LD4		= PAD_ID(IMX1_PD, 19),
> +	MX1_PAD_LD5		= PAD_ID(IMX1_PD, 20),
> +	MX1_PAD_LD6		= PAD_ID(IMX1_PD, 21),
> +	MX1_PAD_LD7		= PAD_ID(IMX1_PD, 22),
> +	MX1_PAD_LD8		= PAD_ID(IMX1_PD, 23),
> +	MX1_PAD_LD9		= PAD_ID(IMX1_PD, 24),
> +	MX1_PAD_LD10		= PAD_ID(IMX1_PD, 25),
> +	MX1_PAD_LD11		= PAD_ID(IMX1_PD, 26),
> +	MX1_PAD_LD12		= PAD_ID(IMX1_PD, 27),
> +	MX1_PAD_LD13		= PAD_ID(IMX1_PD, 28),
> +	MX1_PAD_LD14		= PAD_ID(IMX1_PD, 29),
> +	MX1_PAD_LD15		= PAD_ID(IMX1_PD, 30),
> +	MX1_PAD_TMR2OUT		= PAD_ID(IMX1_PD, 31),
>  };
>
>  /* Pad names for the pinmux subsystem */
>
> ---
> base-commit: 30e830b8b952e550344224546f8cd83c5c49a5bf
> change-id: 20241002-fix-imx-pc-9b33864c0331
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

