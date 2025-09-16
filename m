Return-Path: <linux-gpio+bounces-26216-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04FB59D25
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B713ABF6F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A832BEFF2;
	Tue, 16 Sep 2025 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PXk1O+jz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70D29D265;
	Tue, 16 Sep 2025 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038876; cv=fail; b=pidW5daxhHPlGaE+3mr1rOan8AveAA7j9pIPERYnhGNZhhWV1kL/iU7t9BYRWQC65HEZghnL/rPpRZaySuGYtYVWBrFTyckjCi1o2I5lmZjMjiVRodO0Qghu7Qf7+cgziJy6F0YqtHCfPHKtIdpWueW0rb/i0v56lnE85n5n1wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038876; c=relaxed/simple;
	bh=qaJgDRgSBAoCOJxAacL6iLoTTP6iDIy0owY/z6SSl6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MROU/rN17L/8o7+Min5Xt5YiZMbtyGtzJZTlXjKfZlMAGJvr/IChU8i/4R5SETaTicw/Ms1aJYvYm4Rd5J2hWh5m12ANTE4Iq8dYj66DY+weULMTA+Iv/HHvwKDwxNE4ZCxpZxaM4m3gmIVgTcnfEwRKE3qIHyNWfv1B/Yc0Fpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PXk1O+jz; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRp39jwAqCTD6uO6CxFu7aoPk8ed4xzGlsylquvFxtRVSI1iXt+LxrRq/90eT+R74RSPHwOikXuAQB2ujm3LvpNDLOhnyeXptHoOIMTPtSt0HFrn9lwuzJA+hTzWgi8dPNS8PRt27+URZNs1jfNIIladl3SLrwrwzGAO5SsLGA3xywe5tnK/u4LwYaQGIFJlISIvvOIJ12eoRhkN5QpTKDZJo8qTLsduk8OPHe9Co++IMNcP1H4fTEtWzGa31Qs/7NJzYJ3+gwkNgq7kZg8ugn/+DfwDDFsj/lJ/dw+8FKCRxDIDbSmvJ/4wvnVpyHIEeBENFJnk3v71c40HpaljAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPoGzaaunsWugECtCkhU9r+r4nYMzAWgV/BqoHyZPNI=;
 b=TQ16scTMnHYn2IcvVwrjXcpaM/sdHi2qgrWV79MN7GB+Xc5fncI0oGMSJrOCWW0gU8ekp2Z6YlpNXt25qA0zn/5mWsAiETHIonAB9PNRsU/TrH1HjCCppIYs20JyBNPRfPKNj4JsjqavqL/nSbE6I3QDuDWgaIoM0Kra8KKhnVxQd1OFPtObAYTk0NxfHGAV6VkBEo+liEZyP9x+wpsmfoYItD/FyDsE4xnyd5wyE3XT8e6kDqez/+sC940k7+disAjm5yV2hB6DUZnhwm1jMB4V/YlVdT3SU9igstS2qF6UIDDwOiV+Wt/Y3CuGI2cyEfGGkfSAs5WttsUWiuMghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPoGzaaunsWugECtCkhU9r+r4nYMzAWgV/BqoHyZPNI=;
 b=PXk1O+jz/Rux2xfN1zbXBpoDgkooGKtIgIjZOgbsbdsor2Ps9P6QPQ6NkhdzGbtJPZwCZtFTKQLzkeuV9RYVYh9ZT4Xg6eaZTjJsLbphvBwNN7PRgvIUHMjvDkHFn4FXyu/W7P9QYurfANLkv6NsogeYqWW5jnf3DK88shr3GgZvoO3UyQZCMOIyoRLonvruLw0gVqUH75eNjZbr/PRHR9K5JlCbbRfTf3nxv5JYxnKB9kiKDEesQryeazFJ5vy9ljNFVozUls36I/hTepNaOYfRkGAd0sxVublC8BkvgFXIjGfoWVsKZXFa0kMof4XJbxZl4Sr9jsnd0suU3kaY7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS5PR04MB9753.eurprd04.prod.outlook.com (2603:10a6:20b:679::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 16:07:50 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:07:50 +0000
Date: Tue, 16 Sep 2025 12:07:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: gpio: add QIXIS FPGA based GPIO
 controller
Message-ID: <aMmLTldFerRrwgvP@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-2-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-2-ioana.ciornei@nxp.com>
X-ClientProxiedBy: PH7P221CA0085.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::19) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS5PR04MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c26aeb-db13-426e-c19a-08ddf53b2f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V4VgrIygGOqUV1Rb0HPpvGlVO+SX2BJ8oeGoVVjx7+bhagqp3s8pzJe3Q7NK?=
 =?us-ascii?Q?mh6Tp0HtZyt7CzDrBB0VaBKWD4qcajO1tzNpbvqsdAfCRVB+YKSFj+GAew+K?=
 =?us-ascii?Q?V/BzfdY0vpQ0CSCQMAw6iLnOJQwiWnTsgdsr1S5Lz0WIlJh2Tdf/yUbTgQjy?=
 =?us-ascii?Q?Y6DQnafIsTUA1zD0Hvllbye3GwrMkc2O1tbuCNGwTJ10W8HJU850Q0EPmMfz?=
 =?us-ascii?Q?hiJYE3c7MVJKfs5bLc7K/ZIoukIxwesv372xcItZUGGQHeUIFDv8W1stFwn/?=
 =?us-ascii?Q?BR0MhmLf179o5sRrWkyRNZlsfz93521M8QdY03bRWdNg/Jj7Ti61hFBvdmOf?=
 =?us-ascii?Q?ZHmjPWCzAqO1U7Cv23WfQ6WQ/+Ybco8MU+qxGBrzpVr0dPm4pj208QRBZgbt?=
 =?us-ascii?Q?n5BDkXm6+OEtZvpa6Ug28VpDjAGnjznhvf3X1jmRCpQMQ50OVuyBVcIiJwwM?=
 =?us-ascii?Q?OtKyy0VPVRXTl+U32I+y60Od/vt8sXDfSwFwf3hGuxckneK0iL1pgryfCaXS?=
 =?us-ascii?Q?lCTlLmFpqzlFrsmpZNy48FUEm3NsUKhVnNUfTCXrLiVC2p57EexKDSfPHYs5?=
 =?us-ascii?Q?aPbm5xdQQSOwUl2ILDHWUCid2PYUl5JivqhHGHBCkP33NBn5YVJIcejIpPBR?=
 =?us-ascii?Q?cKPlA5HIik2JWG11eSU8oM7xThO4hO7JV6MigtfjjKUJsAXgvsnu0iF/l0uj?=
 =?us-ascii?Q?H4FPAGDMJR+ZjZTYGRlkyTQ+Yehed/YtxM4t2hyptGvwA4LZGVwG4BIv13cm?=
 =?us-ascii?Q?0nICATcSs/MBU94s+8DkKes/uQIU/6tbmtOEJWLveCWsIcHx5TY6S++0wMSN?=
 =?us-ascii?Q?upWa4F8trOLY8mo2yik6tRl5xBmC5/neVx3CaZl3AAo/cF2ZqqB+gmHg1tN/?=
 =?us-ascii?Q?u9KR8+pWUNSw9dDMvZDprTyKnYbbB56PLy45tUg5fRSlrXMCCdLteQBfWiH8?=
 =?us-ascii?Q?3gPOUju6u417g/A8lZhZya+Yq8dTFap8TX/Q6Nr81pxm6F/5Xz96hXKcS4Q4?=
 =?us-ascii?Q?L4As5AuUifzlLM7R56BckP3u+JLGk8tgcJBn0GKO2VcMhxzr90tkGyvyGJiN?=
 =?us-ascii?Q?cMuwr+02lHU6YW9w6KgTwftR+P3Ll+5zNzHJ3PoZ5K+sQ9pOYr8YUkS7VaC0?=
 =?us-ascii?Q?xLxh/RM0ESopX8CDXvkTYV/7GtzSbWzKdPckZ8OCb0vzARRjyN7cVPGDSVAp?=
 =?us-ascii?Q?CoE2+FFPm6pcP6cupxMCSUG8TiCh9cs6xz9eUt8vodRtTarR6UpS1e39kUjh?=
 =?us-ascii?Q?mDerDz5/G+ShtTIliwSd+78RKwz5WWWt8zMqm56WRd+dNSoYbTTu5YCB/NpS?=
 =?us-ascii?Q?irmBYnFwf4iwOQsa2h7S2KbocPdA8VlGphv7c4vntmx1VJlsuSO5Wjo2byi5?=
 =?us-ascii?Q?yuKLX6V4iUknZPmYgnpYVVfEAuZlRtVvD1h9ZfQ5xiaJSDUhBHrdFYUCPMy1?=
 =?us-ascii?Q?3e1aU/dfnxKBTrmuenpoJk53EbJedNXLPyX2OkPtlNONTR9FjwcDZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uu1M3Yry+v2uwkbBHn/7waJi+Q2mhu0WSBXDchaR07KXrRZ4NbZ7jfY4TAt0?=
 =?us-ascii?Q?Ke5eoe1I93XdDTldD9sZAVRbJmJ8BfquOUUbgcNeeL9N4YqLOgM2UkSivnSg?=
 =?us-ascii?Q?b0/1XXjabsqn1750vQXO9muQIbdJluZAjX9ggTBw9Y4PAevfFxu8o2bGbtXF?=
 =?us-ascii?Q?rPdRWxsSg9avVxUTbITNBUhXLgCRfqo2DQZ5Jzi8+iLz6XriepTwLiNjYziO?=
 =?us-ascii?Q?KhUlKWkBsd8zQiKVS2XCi6R6mBbgVqlspOibjksZeNnyy8VtG9JyeKKivYSf?=
 =?us-ascii?Q?rbPhhBguPrWu6KS9QNOb0GaJHlSa2ZLsLMozvWnjelb5f+uFzqpvVbXzqj/M?=
 =?us-ascii?Q?wpP0UFv42VzYgPHfiuv+5DdAZdq2byqtPvjJ0w4WnuLivZ6522zGWlyTidmw?=
 =?us-ascii?Q?frviLkAX4KAvNE1ZKBi+cJ3TGQj3GAnA0zp4/uFG9VwPe2yLPeOpo2Kl9ZRd?=
 =?us-ascii?Q?Xzi57atBzdrGJfmv8jweDu49M4zdnq8X0cZIrHRMFAIRKKDGnoY1p2nRas7d?=
 =?us-ascii?Q?31iEGaOA8hh3skySDSbya2NdqjRYwOL5bJZQZzU+TSycxgPyUzTH3C/vMhtA?=
 =?us-ascii?Q?WFvSFpsOOOU4iLppzQUum69rqAO/6dQUZj4u/7V/jbWEyzBM1sl/xpQuWPg7?=
 =?us-ascii?Q?/d4uXUXKQwvNfszjF3kmfSPQoRI+/pWE4RAyhR1v//Um0s1d/HC8wxGyFWx7?=
 =?us-ascii?Q?XZhFap7nASaIXdmuPSMYfYtiBQl3aKKoGJ80ggtImCTRHptIyZpvmwUys3Ob?=
 =?us-ascii?Q?QGSbNyWidBOVjbeCTwrBGIC/Ns0Py1BTbxwr5etMxHgeBdLGSOSlqGtJZdwH?=
 =?us-ascii?Q?HdvkMohgrfWEfro/In0VxZEuEuzMnc2vl/I/4Ea4i/skzrNdJn+xVnDpBenU?=
 =?us-ascii?Q?ck3DrykaYHb1mb8TQtYaD2nS72KTZLoaqpxn8D00d7oXQvMVZzp5cG4e82NG?=
 =?us-ascii?Q?MfjucR1OrkG1yg1SacLH68otdu9jinK1xG9q0rY/rHoPH/1Y9kpNdfTtZBk0?=
 =?us-ascii?Q?mk/BAg8OUyZUAQLaF8gnwdRU2/MUv2aNvs6eConX2M8pRT2N30qjJ4CJ51vG?=
 =?us-ascii?Q?po/YSfV73IUQbEH5cwOAl/YUaxRqpc37igVJTi6mRTcFUcnt5ExOUS9F9dTj?=
 =?us-ascii?Q?ejSUO4McwdMWLNwozrSI9goRFkp5HMHkJlGm5FQ+MV34qgT/ZzGTSa+ChVUg?=
 =?us-ascii?Q?VykkZkhkX1k25leTo4HNF3xodiuhDPFsqpemTEnQ8wa5QOPkGUWEd6cVfh7j?=
 =?us-ascii?Q?wGZTc5arEna5zz+LXSt7lWGvFCrk6gM6R4acb3MeggyZ020cboFGcmmmtxic?=
 =?us-ascii?Q?EdNTW6MfvaNNrPjOaD3Jqdeea3sR9Q6VSNTJzju7Gp3w6lsrL2zj3m2/rx6a?=
 =?us-ascii?Q?ShCpmYCYvdSZISi2ibUfeVYOyDSm0R0BLyXMIrA+KzWZcAHTh23sF/Nw1nCq?=
 =?us-ascii?Q?G5zW0qee2zrnhQzLW+WYM4sQTtpbxdkSR987hmEGME63ouKru//hY1IG/zWn?=
 =?us-ascii?Q?ka0bbVvHphJn+9RwEgRgcoPMEsVysm0FIxTzLVMUN/MTWegM3mwPaZ9MSW/O?=
 =?us-ascii?Q?QBZ8qeSc0jlxiIu2koBDDj83x+VogccBEd3WfAzm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c26aeb-db13-426e-c19a-08ddf53b2f22
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:07:50.0652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYDJC1mjXLnHrCENoEfw306beYesn2rvT+inqrOfkV0q9x17h2d33yX4x/K+wQN3MA2AphUlZnRcL0KDNGu1Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9753

On Mon, Sep 15, 2025 at 03:23:46PM +0300, Ioana Ciornei wrote:
> Add a device tree binding for the QIXIS FPGA based GPIO controller.
> Depending on the board, the QIXIS FPGA exposes registers which act as a
> GPIO controller, each with 8 GPIO lines of fixed direction.
>
> Since each QIXIS FPGA layout has its particularities, add a separate
> compatible string for each board/GPIO register combination supported.
>
> Since these GPIO controllers are trivial, make use of the newly added
> trivial-gpio.yaml file instead of creating an entirely new one.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
> - Used the newly added trivial-gpio.yaml file
> - Removed redundant "bindings" from commit title
> - Added only one compatible string for the gpio controllers on
>   LX2160ARDB since both registers have the same layout.
>
>  Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
> index c994177de940..3f4bbd57fc52 100644
> --- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
> @@ -22,6 +22,8 @@ properties:
>            - cznic,moxtet-gpio
>            - dlg,slg7xl45106
>            - fcs,fxl6408
> +          - fsl,ls1046aqds-fpga-gpio-stat-pres2
> +          - fsl,lx2160ardb-fpga-gpio-sfp
>            - gateworks,pld-gpio
>            - ibm,ppc4xx-gpio
>            - loongson,ls1x-gpio
> --
> 2.25.1
>

