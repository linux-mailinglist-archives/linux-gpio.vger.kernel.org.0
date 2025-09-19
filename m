Return-Path: <linux-gpio+bounces-26395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89FB89D90
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 16:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C9F18832C9
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ECA315D5D;
	Fri, 19 Sep 2025 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M2i7QOqw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC331064A;
	Fri, 19 Sep 2025 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291155; cv=fail; b=HUyHY6HMs+ABw4ziQkrTGTD9OltHclf0H4BxG9eqsp/cFsqlYfgLvIdNpTAKIHaIVZTFF7uviUNMgyqVVmkf1fPHQfKmld4eFvuVxyw5NDie/jH6OnphQcaFOBDQXlhhBlDWUukXP7lkxtfmaB17mKrRV7b3iUNyh5tlXgJLo+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291155; c=relaxed/simple;
	bh=u8ZCuxUStn94DvdcvdHuFTiC1Lv4KObCUPuGuFFsyKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vo+s8f5rSNIR8qF1RiCjMD3mFsTryU8kXbrHhq0A6ENuyyu+4ebBFAUz925zinsjWXNsuNuyg5fuPvKaKlmltUenpZGYZieBoueve2ioio5tfXKhwB6DUSlqOcFCcJwu9rUo0fF3KwcNrc2osJ/z95ZXSbJttQZhpp0Ql1LFwFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M2i7QOqw; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6VkqOYa00bhEIblyC/rRMn++G2Puj4F7YPGN0s8V4DiVG3tIZGxQghRm02zcJPTFbcsiWXtPcRjs4xN/26cFEYT5u8gnVbRELuH5o8IbSUpPUVuVctytFzesNDIqznBlivBV2RF3WJNaHhFMIENu4uzva8vVefy3PkyTswUIChQLnDET01HSckYhfPVdsvAFJRaoKGlI5tAF8RK+3htVuGnmuaoS+0Gxp0/BkQtQmv3q8fGUPjczdTzeOgJ4TENV+83zrtlEUmk1bkHfndNPAONS9TkTn+pBbtBwSMZj6xawTqvfte+/RbwBgK/5IrdzPqiPkeTnzPHHWnZuTb2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1lOIVp3sDJwNa9xm55u+pSVBdrw17qyLDjb7pC7TVQ=;
 b=NgGlwADwdFAUphCrieauW2jvJCeFCIi7VODakzYZJXzRPtZ4CaqkSCzTxOWG2P1PwZwtNTZkKVi8Rn50XGQ72FymQL2Hs9LLVPqOu+Pn7CxMMcYukWm+19ECZiCw++LOlDnPgMQaOBxcfTk+ygfPly6lC/tHCGPqRAM8ccqVJ3HC88ebG/AhcctW9HH4s73DqtcDrZ8LAMPcD7th+tgKfFvXg/iMdD30WBsK/y2fneeyLJ/1eDVxsueV9PbHbgf+/v1DY1McunMDvA3CutcRvSJ7YOQAEhypO0l8c50hDllBnxfjK71AQi1o21Mv3+67RL2SfEKosuh/TLyHaNPx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1lOIVp3sDJwNa9xm55u+pSVBdrw17qyLDjb7pC7TVQ=;
 b=M2i7QOqwSc3KFbeOVkrYUEHBRG02+l2zLNqQGGVaTsWlsaoh63+nyCeOgdXIViApgqYM+f/fiaYoN6qu2B25IYy44hS21FucS5Q9Qzq/w6h5XWcXsI3YOPWxZuBYTz3Izw4SYA5GkWxXJbnlVoRSxAqPn2ZwRA6TWdachJ8+xREtwGaXW1LB5AqgyShd2dsC613oQ1Ygkjlv262sV6NN1IMUZ6h1Dr62r6MvzE9jfls7S47nWpWojNTIb+Z5pRBR4hdO087r4knL83w6lxNOgZKYu6BUnRYKKQMlpeMa55wndiUAHQ2KfCbNHiIdXG8x38hwmndce2t0BRPBeUUNsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS4PR04MB9482.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 14:12:28 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 14:12:28 +0000
Date: Fri, 19 Sep 2025 17:12:25 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Shawn Guo <shawnguo@kernel.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 06/11] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Message-ID: <jmuvbmu6qfxpv7vrs2fvsqxj42nig7j6b3xmndawmxzozu2gqi@spe2o24tvngw>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
 <20250919132515.1895640-7-ioana.ciornei@nxp.com>
 <DCWTIV3281OX.1N3AA8K3T21LY@kernel.org>
 <re2izaxwbjp6hcms3cps4l4tfvwaxyt56gkc7ohrftcjizwkwt@jsjjo3b6xrcs>
 <DCWU2RORGVQS.1R1V3SNBA883K@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCWU2RORGVQS.1R1V3SNBA883K@kernel.org>
X-ClientProxiedBy: AM9P192CA0029.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::34) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS4PR04MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: ba07fbd1-4745-4cbb-867c-08ddf78690f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CQJPFjxb0lk6hrZUl9nO7MtNFX6eigtqvL/Mh5C1Rt+Y2Bb6beFnV7f6bt5z?=
 =?us-ascii?Q?rbzxUXkOwjvz4k5OD2d7czLsV5zO3FNamQ6g6B2AxqsgqF2gVOnWSndSTmqC?=
 =?us-ascii?Q?AmB5WRHvfZmy5x6ajDb7U4VL4s6GqwUHR/zhfItUQYaG5lQOA/OvcOo8g1Ns?=
 =?us-ascii?Q?EDPaiFXcW22bWhYqwHBnIyO+e8sTcSwXo7+e6PpB2BUFNLxnKWNJfn3L2G6j?=
 =?us-ascii?Q?i2MEme/0RLc5iFCs7v4mP8hs6QNAgn4T5hIb69pno/vg2iKHvVKP06UYAtzG?=
 =?us-ascii?Q?SL4srxidXNDxbQCmRNEIZ7WKvBjBcaQ6qOieAqFK1cLlvetwUFOFVrbMpp6U?=
 =?us-ascii?Q?zJBInRBoz0FodhW+g/6pGr0V3JWOJyZvq+RK9u3JNk7xzMFuRD98VFZfNgHa?=
 =?us-ascii?Q?7Tm2LbNXkfcyuY5regQ3yUNJnySGc7LjufIUGbQQ/3vxGMEmpiOG0nqwvw/R?=
 =?us-ascii?Q?GFCXB74d913g3iVrRvEnQL6I2AxfVFri7jdox5JgWR9lEQ2a7NZ0m9bHJHJ1?=
 =?us-ascii?Q?I2vD48w9qBAeoOeIUNUTxXdd568tgubO8sfBjwljMNn7mw+/WUaV9UFTL2LA?=
 =?us-ascii?Q?MFKtIw2m82mtx4QUmEmbI1uaFIaGazL4eJW6LcWMTp/oYQjUMnimwjvlhJSH?=
 =?us-ascii?Q?5VUZZ6vZk25B3z1CpgX4LWwmh2EztrR7DhU/59XgKYOWiUC9w8gj0S8ze4/4?=
 =?us-ascii?Q?VbVf+lOo8VIbJbPFDVBm14aqTjU/7DQx6mfv8slHQx6m7Tvv6aiSaxyyVqse?=
 =?us-ascii?Q?S+jIy3ynVKqBdkj1A2ixvI/4H0cP1bRuD8qnkNdU4yQDrDMI8j3hInJJyoxR?=
 =?us-ascii?Q?y1BSRqLNs2RU3GPEnNT/uHRCTOC31PWff6xw0Y9DtiUk/KG6J91zaAPNZT36?=
 =?us-ascii?Q?DTPjBU8Q+emdVK2zp4hAgLHF93udTnRyHUyqJapi6FTLn5IkOJH+6DVzQewH?=
 =?us-ascii?Q?iKrVqLKX1OGLWO5Wd7Qfiw4CUwQNmU0ddQQaExaR4dB8n1hgO2hU+t0gNSB8?=
 =?us-ascii?Q?omzBSQHU6Q3/vYUAruJGn26kMHNQgiFj69QacHpanAnOklyWbe+gaLYZfVbO?=
 =?us-ascii?Q?Su4ZAcucYGJITBrUjU8qmFqL4862qSd3aWzJj3ulZUJz2/faEvw8Ivf1hBGc?=
 =?us-ascii?Q?9Nv+7BpCxBE19ZxUIClcPiUSmFeTF6Fgfm5szRuDPakwRRffOycqVPGskQVw?=
 =?us-ascii?Q?gnp38F2Jt9oibRU32wqFaTqzx9wND93+M3BPOa84esR7p+G9KEJg2CAD56Er?=
 =?us-ascii?Q?9cPa6+ZtHCRT4xAuOqMpwg9r04yQ4DkPFDgUi5Rt63LJZ7cxITcF+Og4KPZ0?=
 =?us-ascii?Q?9FAtbJ+BIE4lLOvtqUd1714ZN9CPabfWvQHI/y2QKtpTogqEA06BTFDk6FeP?=
 =?us-ascii?Q?SXVIk/m3dStWDhKG9nLEqw4eTHUlQxkSeRaGSwAxOtpk+gIooCUNI/eM943Q?=
 =?us-ascii?Q?LBZ0a24R168=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IlOYD2jLd5HGvjjLmCch2d4lEOJE2ZNvUyEl2z7OKRNtejbKShiwcwjh3+Gd?=
 =?us-ascii?Q?w3Rj51tSX9CO3QxkSNb+rwbl02TAFV29E0U3DQznAyyizf3FgARXTVZQ46JF?=
 =?us-ascii?Q?B7uOmV33YfdHcfughRvA7jLkttjXzdeoBB+LNfFzi7AToGKngRxVYvTtAQbu?=
 =?us-ascii?Q?Y4/KytA5Yvwn7DwXscS0vupkFw9QStfhT9sbNaYpZyuVNUJc5GEbZls4IOJQ?=
 =?us-ascii?Q?jd73lEU7GH130Z4lA/WV2uUHY1bFahuRDTcTvJxX1xQI1983fQsZ+pg8T/VN?=
 =?us-ascii?Q?pePObG3SfRBHXdLeClT4UCm8al0u3udzMBeY/CLBX6osVcBv93r1k0TuB2rl?=
 =?us-ascii?Q?huZFlt9V+EvqeOjxHBWVu+RP+rS/+eq73wuO/ghd++Tp5WUm421+mCGBdbRj?=
 =?us-ascii?Q?qF37xvhdJpDZfeVF0KClVfM3DW3atQ7mVqTqUCwzlP13VWDrRpmsesr2XS6O?=
 =?us-ascii?Q?tG0ZpA4picI+s55jWqQ//+dUn7Sc64gO9h0jXYyf7jgoUr2i+TEna1Q8j0kt?=
 =?us-ascii?Q?SAPCUP9DxofpiLxDpq/UAtzYKeT88S3YzTBav+InWHZPh2b8B70TpIhDv2sZ?=
 =?us-ascii?Q?PvfwnNsDBM30w2Pues8z8sorDD0/prQSdH8lEqM0cLDRlY141KppcspjhyPI?=
 =?us-ascii?Q?jLZ2oQu/8C4E1zUHPXpcVK4J5A2AvARvd9dR2uO1wBj+6ThM33oH9oydxJ/B?=
 =?us-ascii?Q?TOMp3BCnHWmbtiTqES9tO3ed6xl4ROFYoRhfoZK0RuupW1u3QHwrRFg96TQw?=
 =?us-ascii?Q?LN2CJvSnOauqsIfKTUdiCt3PtdCND/1lNYTLBpHOsKTPex7ZeD0r+h3AiECt?=
 =?us-ascii?Q?1qbqWBQi95lhMlnTolPF2NHjhEJ/7nNsQ80r1gB7baT9ZL3/GcatY9w3FVNP?=
 =?us-ascii?Q?0w5E2dad0CI71rKfC9if8b/FZ86A19agzolr7aIa/KHwVSwAKSzZDuZK8RgR?=
 =?us-ascii?Q?TESsW2NjmF5Bf3bLu/+Ef1d1enhJcdSNelfjVnmK1Psd+Mwl6GcwNMhgkaZ3?=
 =?us-ascii?Q?3Apc4y5YtnABrDlzb4r/ecpWXVPv05KtcgvYI/CZigqqPBv9mf23xnwjE9ri?=
 =?us-ascii?Q?zeQpW9bTBQE+yv5itGNuAr0kP/ss+/xNP4B3w2228brMztsfua4dH4iNi0BH?=
 =?us-ascii?Q?5swqk7EdVmIIdntX4zvzNvW8hH1lCf4oxInk8yYI6uZUQ4190XNH2o9QKpS5?=
 =?us-ascii?Q?c/0kKK0clYrG6rwpOp6W7OubretHeIviWagmSqvSeRA2ndG62RWoiG55G0Ol?=
 =?us-ascii?Q?6Dxr5BKVhp6/JfbIXZmvDMb/JpFIEH3td5uDE06nLPdjaNX1o6auYSJkZPS1?=
 =?us-ascii?Q?9ITtErMTAHWadnl6mSwPpQUDWN49+KrJ8R66+WP1quo1jHvNl0vpHV/ELzlx?=
 =?us-ascii?Q?0IlMgrHcepF5o/+XyLTOw8NJwBEhdYGmzuq+mg7hGhF39qFn8IcoU0VqBtCn?=
 =?us-ascii?Q?5xTDVtKme6BY/ZTog6cg+HPu+HFOBjlRA0Cy6eA4D6AK89DvfapL99QCsIIP?=
 =?us-ascii?Q?xOeYFYatqdFrk9yLZ5MypFpXKfeaI1Oya0KX0FPcyHEhWyNh0+wJCxA5xHA5?=
 =?us-ascii?Q?6Kvsuo+fzUN6LlB7MbFkl8dzknISNt1EYZrcJkR9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba07fbd1-4745-4cbb-867c-08ddf78690f4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:12:28.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/P6inrEqyzjX8aVq5bVgB6D/BtjeMQ/dtbl4QG2iLy8VTzoNUl3gS298iuSNqR0UB7mMiK0PrAVE/BerXYVtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9482

On Fri, Sep 19, 2025 at 04:07:00PM +0200, Michael Walle wrote:

[snip] 
> > > >  	}
> > > >  
> > > > +	if (config->fixed_direction_output) {
> > > > +		gpio->fixed_direction_output = bitmap_alloc(chip->ngpio,
> > > > +							    GFP_KERNEL);
> > > > +		if (!gpio->fixed_direction_output) {
> > > > +			ret = -ENOMEM;
> > > > +			goto err_free_gpio;
> > > > +		}
> > > > +		bitmap_copy(gpio->fixed_direction_output,
> > > > +			    config->fixed_direction_output, chip->ngpio);
> > > > +	}
> > > > +
> > > >  	/* if not set, assume there is only one register */
> > > >  	gpio->ngpio_per_reg = config->ngpio_per_reg;
> > > >  	if (!gpio->ngpio_per_reg)
> > > > @@ -293,7 +312,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
> > > >  
> > > >  	ret = gpiochip_add_data(chip, gpio);
> > > >  	if (ret < 0)
> > > > -		goto err_free_gpio;
> > > > +		goto err_free_bitmap;
> > > 
> > > There's also an err_free_gpio jump below, that should also be
> > > replaced with err_free_bitmap.
> >
> > I am a bit confused. With this patch applied there is only one 'goto
> > err_free_gpio' in gpio-regmap.c and that's the one added by me above.
> >
> > What am I missing?
> 
> Probably commit 553b75d4bfe9 ("gpio: regmap: Allow to allocate
> regmap-irq device") which was added to the mfd/gpio/next tree a
> couple of days ago.
> 

Yes, I was on a 1-day old linux-next. Thanks for pointing this out.

In this case, I will have to do a v5 to also change that goto. I will
also add the patch that you requested.

Ioana

