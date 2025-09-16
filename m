Return-Path: <linux-gpio+bounces-26218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0AFB59D62
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 18:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BA951C01FC9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 16:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61E1374261;
	Tue, 16 Sep 2025 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NExPAjyb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3893431E7;
	Tue, 16 Sep 2025 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039634; cv=fail; b=Oes9xaSwHQesAgZ0xE1fYccb0jMlkIWgNy+/RI3gYgHeMosF0/6ruxgcKeKdW5/znEvrmYzLRpym5pqEM36TUi42E4RhD+fqvPuqHe3lCdL+31ud6rchamgERXLbckgFSYSZSmHtubZS04Tzk4XZa9Lr/sgn7vBW0PwL3iln+cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039634; c=relaxed/simple;
	bh=TjJpfsg9Ys+hVthA6ac7LPVAgn9KabgyZ0oaWWozAP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=en+bvxR//KTQwKtOeaZH+hqP3rJxckyc7fSrHPlU6RbJ3O+0usGffJ8OsYZ5DZLebq/+cNtyTAaO2Y4QI2qvgKppYtiHiczCsr4NzZomd0ai9Xn/9RA26xVCtvaSKkxeZanl7wFxC4f7toVu5TrifpmaLX1kE/zNqQJgLQlh68A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NExPAjyb; arc=fail smtp.client-ip=52.101.72.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGRm4I+mleTX2Jw3sSpd6QqgbwvZ1rvCToxRGIbAjYNqSupBAwVa55ncz0OCSUGAl82x+jq98mHpiV7z9/aAeHjn4fbAAtQgmcRrT0nobw7en2FQcsUIKs7iwi8Z9KTPPB751kfx9Z5KZhYGd7/Zal0z8K6dzRBJzKRcE8vTW5TsHxFny76qlUyXSLnzyp+XpAzxYKpY9Pz6rBzJCWs1Ml58rIWEPMqFu7Q8lntKdkScyb7qQqNkY3eR0ExeahaPh5mSuPk2qK8P69owenamL5CELJ3G1WEwEbSBF1Z55SUWw+AxWoeP1nJnfiu7Nt0JWx35FIx+eWlYLDlZRqPljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8g1lL8PqzSxE+ILtPMlxhsKWFT2fS8CQ2rTnZYwjKDw=;
 b=gQTWh99YlzDNA3jli8oeMzl72m8YcgvDFHZc951GNz88F86PVAjf9A7HdHNEurX5nm8NVUHjsaOijSCmYDUCzwAzqunrqvj65jU1V2DhPHyCU4O2OSjwRrOW1G0cxKgra+ixUtlF3/xxqS/t3cjYlQekYyZAqNwhkfc6ECbtpGnXefRyEuOYKRi7HtCcKGinZcUE1+V2o2EphcL6WNJBZPT4HN6ECU5/7NsQA8prewhsJtIjAA+qXdQxb3q55cjjChM7DYffL/Z1+bpBikJ+iAz+HDPL3bHHhqKrDPvctOUXtcu+oLRdAJ5i/d9B10QziSVbvbAm9eGQoZ1hsLssqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8g1lL8PqzSxE+ILtPMlxhsKWFT2fS8CQ2rTnZYwjKDw=;
 b=NExPAjybnDMKmLufANQP248nhokq+Q6awbONOIuNEM4y0eV7yCoLvYcexU38d1Oa1a+AAIOG/SZsePUTTzrlq5ofw3jbkP8suS/EOnB2z3S/zK9H+YCSbdtihJdh4k/mA3c6dAVPKcMDsTfbW3yTrlbkyvqD7SRsRb3kxZtGaewG6WAkeY/gXHpXNqagxZBJSSb5fI2mOVrman+l2EtTULVB10ma3StZ7HX6b1NPDn+9oeHUu6udrzFujM0e9Sz95bUl2uqw/Y4ty3ZMpB35PsZ1JOMOSXWFpzAvt1GRWqKgRnTtoWrhhPwxJem1umfgfICY/7wwPHj19itp1oKGYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8317.eurprd04.prod.outlook.com (2603:10a6:102:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Tue, 16 Sep
 2025 16:20:29 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 16:20:29 +0000
Date: Tue, 16 Sep 2025 12:20:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] mfd: simple-mfd-i2c: add compatible string for
 LX2160ARDB
Message-ID: <aMmOSM6tOi9RX6ZD@lizhi-Precision-Tower-5810>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-4-ioana.ciornei@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-4-ioana.ciornei@nxp.com>
X-ClientProxiedBy: AM0PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::38) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: e21f51aa-3a2c-4c46-2981-08ddf53cf397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g6OBFKnJP+Et62twBuNp0SlT9louth55VySpLkxK/eNBGY0RDuxZ+/UdNujF?=
 =?us-ascii?Q?zlhGW7BNNp7CatBoTWqAvHVJsy9KW6d7nCEnWzkDm0J/SPBSKjpBLnXvIZaA?=
 =?us-ascii?Q?ANh4VM6CpwBq0TsMIKvq9pxcCF/z7/4TqpMIiuavNkmY/1RuwSU2nNu8x2Y0?=
 =?us-ascii?Q?KHbRTw3Q7DgO0vJTJGdELJTkS+VfUq9EL8QtsrV+nDfqspfKLWjTJpBNb9TM?=
 =?us-ascii?Q?jdmDWR62pa3CPNkx9yAC90BPMDvbpIpzPMwNuC0mV+TuXzyFc6esAee/Ua9t?=
 =?us-ascii?Q?XjjMIaY+8Y2zjpnM5QiGDs/fcQWtsnJxVB94fNPRifumXRmxiOWEVcviq0oc?=
 =?us-ascii?Q?JSTLGkX3TImDv/NB8PoJPm2H5CAXLaeHqFoOvbZ8MgQzbK7wBhE2Sy88IyYn?=
 =?us-ascii?Q?Lu1WLMtxcgKgvZXuL5GoiLOPZ+vHdQCRR3/Tm6oJ+vdnGm/Q6c/vHyMHzfWg?=
 =?us-ascii?Q?UXCtIAeCoQ/kVsQKN2EP6V8No8tipULh4lZZequ7HOJk/qf62+1AzdfEP7qI?=
 =?us-ascii?Q?6L32sSNHTqzxFxoKQJTd2uZ5GJF2NU3ga4Qd4w8OG/K4wOOH1dasdqLH1E+A?=
 =?us-ascii?Q?Sm2OeYQsfO3MEWQ6RjZWDKPnvudSZISABVznVSYp46qxFxnbvfViPdYXQwFH?=
 =?us-ascii?Q?vAtM73ignD1fTo1PCE7mlyZ1qlx1OKaosN5TS1iXm4NVp7Ig0LSCWA0OUBIp?=
 =?us-ascii?Q?GqfrGBFZYeDC6O4L+0Xzvoe49LjqTA/B/k688gga/nsB9Vd8dC0F6S7ZSwoc?=
 =?us-ascii?Q?LRahXGH0lai7Koe/UEOOMqImDOwHKrBOlP3cznXb1lCLF3OZCSeUtMnHKlql?=
 =?us-ascii?Q?USut1QzeJKyW1b4bAIWjTnmy18+UDxoB0y7pJcDcoMxNh3XqjS5mJU2cdT9M?=
 =?us-ascii?Q?CEcN++/Iwo2vSH1t38ZjiE2p6CozsVK/N3+mnuZb/vD6yuwZdbSaoPylmf0j?=
 =?us-ascii?Q?D+1U6TswCDvsOevCgemMemPK/YKg5x49KlYPSdflgeTzunyS7pzkuLlhWfa5?=
 =?us-ascii?Q?gfgMjvgxFttB5zdsDQgbWUc/wuXjGNfkn7BMtQL1GLsnvH6ZQiC3PXo4bmDV?=
 =?us-ascii?Q?JX9zFcTLlNdKkMiW/Fg64YRLY0mLvsaO+AkHyI2GNpmURF00W5Ps54XEVaNK?=
 =?us-ascii?Q?OWexI0Se0B7GFHdad9p/BdgT4BqVizJogNxdlmdFof6ZlCpbQpo3sqggNAzY?=
 =?us-ascii?Q?WDqQUPf+0Zaqa0tOUQqgRDF+9Gp6BMpGz7Akogsq0N7qtifpJPXGx7ytnvKM?=
 =?us-ascii?Q?EepeOmKglZrNJN2htfVy5JXfGUzd5gzuxWjl7vTnNBcGtbajqWxzcfgKzThl?=
 =?us-ascii?Q?MPmaycLpMVqIRqcZ4q5/jgBWza3neQGd5igBSepNDuAps47Zr+0Y07BIWjfV?=
 =?us-ascii?Q?MQ+Fmb0O23iHexvRGMPeGQkmBrYzRzX3RwOCbCX68gaKt2K7kfifkbyJRzgL?=
 =?us-ascii?Q?xM/DQN8TE1lbDzj7pdqKRJpAFVPwBUsfGczso1O5JOss5/G4BE8jBA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Faq72+KOuJoFfFPoA7b649JWXpKKlaRCqHNux/fM3vTAY4EWw3FZ2YOLerIZ?=
 =?us-ascii?Q?OTjfztYJQrKqJ8baDCBfN+wcmvUJkw/V4FMC0edyf6V9dmXpuxiHUTGoHJFi?=
 =?us-ascii?Q?8BK+R204bYuIEUrggkmOhn0PWwDq3N9AZ/99/lIXQ9fP3cZSUAQEwKjtAIIt?=
 =?us-ascii?Q?S0pSVxcHlRh8YGxzZgF97UB0VEl7cY4wmyM8osRn3XnNG+/ms7eISER8VTJy?=
 =?us-ascii?Q?UW1t6plUT8Nnc17Jf4zuuJrPcuQhSyE1FnzX/AzibDXUkaW34LY5//SriuRd?=
 =?us-ascii?Q?D2JOUljYLOE4+sMDgtywtfdgBYgk54efwHOmcYkHqWS4942yJxq8maOFAQeV?=
 =?us-ascii?Q?n6cEfE7Xq2ya+K3pgPS8zl+KqHtMJf2ijq2dXbzDGAC4odwhOk7G5gAbaB6s?=
 =?us-ascii?Q?FgwBtVN/4YTIIofbbpqOJ08/y4seSDnoGXLPY3hfeYe/gJfdyihQTH9sI54x?=
 =?us-ascii?Q?K/h/VmIk/DC8eXh45jlhk+ifvzIYcNq9El84Gpa6KKBSNXaLwuRFO6JoTPOe?=
 =?us-ascii?Q?sOWJ0oti1zSSA1u87kJNV+jHAteouQmQebRpaOgMbaRsabIxga+afr8j5Xjd?=
 =?us-ascii?Q?cGmB66c18eAMxq9G69dvX4N+QXOPHoCx2zJwhei2B+JzcbDo096KPym0qmQQ?=
 =?us-ascii?Q?UNPt2CE6JjoNn5O1f1wmwX1HhFU9THg4d2xrlXrfeYgy8KcjCvUBfcJA1eR9?=
 =?us-ascii?Q?Unwjs/BtO++juKxjgj9AQ+q79kG16CZ82r8YBEGef46rSNJRUBY4FvfAeEFl?=
 =?us-ascii?Q?X0MPvNtXPTCXiy0ZNP3shEDqOS7bliXoqYVBOyvdUrnvb41haPWbUSy/z+Zn?=
 =?us-ascii?Q?/GT+JX/+3EtL94xf4ETonfSm2Z6L1BOnsNi6/Pk9ABUp4J4sAH16C8rFCshL?=
 =?us-ascii?Q?/b4dC8E94HndaPNEWFG8gNtTRaOWj/FvSA13yTm7PjCrgTWK9hJQb1C2g15w?=
 =?us-ascii?Q?9hEe0pzIRlTkCHGQ3NfYb66Hvg/qDiQrf8bE8V4E2sIZP9W5vBmHLOHjxrYW?=
 =?us-ascii?Q?Ix55xQM8wuzJ/6XQxJnoY9/Bm9yxijSwGEowBJPTm0chkjyUu1QrczLbZL6m?=
 =?us-ascii?Q?aT6DJTbpAXFY4Gfy3ZlPJVwQK6nyfbfUkUmxuRVGdpvhex2O43R07vOjxcu/?=
 =?us-ascii?Q?Y73bo+35MXSPtdvOWBlG8oTM85RupiDxfMjyBNbX9FKZW7r/ckm+sSVMUDt5?=
 =?us-ascii?Q?IqvhPp8/XfbAEQ/SV/BCFRkN8uU8rOHzzBveN5tyw/fDiYeel2nyp5ebnUhn?=
 =?us-ascii?Q?/cBr56LZMXMlRXWQsSjtU8FufgCiBmQ5/DHdeirvIamGI8FFbOT3vmfG6Zj3?=
 =?us-ascii?Q?KOJfYCsPDEW6rDf+mAYOWRhMWumGURFytx54tiV2WEgWOEu2Eqg2p9TDqOtc?=
 =?us-ascii?Q?d/nXOfZ9y4JMY71i11O6ajA2r6CVjSOLnwxIS8fmn+JfZD8aqzXEC/Sfkt4N?=
 =?us-ascii?Q?XCV6E1IcknGsZckD4ofQWVKHtO1JDkmLE/Q3CIUP6KBJJRY5X0d4n8cJZT0e?=
 =?us-ascii?Q?BrDS6F2JuIhkht4WxlvsRKtZVryAC306MO6b4IU24jmTI8dYgyOqgGGZB9jd?=
 =?us-ascii?Q?KyT76Jt+amL4f6H8yP74cBd/CKCWzVxHL0kmxD0N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21f51aa-3a2c-4c46-2981-08ddf53cf397
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:20:29.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO5C2YkiWK8cej4KeAb6ctM2/pcnUcSEcpBvYJ8OGF0gFcVAVuFrCGqvlNFCz/lUvbrxI9PAZvjVCMvyFpoNyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8317

On Mon, Sep 15, 2025 at 03:23:48PM +0300, Ioana Ciornei wrote:
> Extend the list of supported devices with the QIXIS FPGA found on the
> LX2160ARDB board.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - none
>
>  drivers/mfd/simple-mfd-i2c.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 63ac26388860..6fbe85437d8d 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -115,6 +115,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
>  	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
>  	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
> +	{ .compatible = "fsl,lx2160ardb-fpga" },

driver data is the same as fsl,lx2160aqds-fpga.

why not fallback to fsl,lx2160aqds-fpga in dts file ?

Frank

>  	{ .compatible = "fsl,lx2160aqds-fpga" },
>  	{ .compatible = "fsl,ls1028aqds-fpga" },
>  	{ .compatible = "spacemit,p1", .data = &spacemit_p1, },
> --
> 2.25.1
>

