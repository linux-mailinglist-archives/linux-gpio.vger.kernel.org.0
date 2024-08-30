Return-Path: <linux-gpio+bounces-9433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E797C965C0E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 695E71F225FC
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 08:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCCB16EB7E;
	Fri, 30 Aug 2024 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UV4VmP4j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04olkn2050.outbound.protection.outlook.com [40.92.47.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B816EC12;
	Fri, 30 Aug 2024 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.47.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007730; cv=fail; b=LeVh+sF+6SMOLb34mtFgHsoVQCMyEBcZkyQ5HRhQErJdIKdSpx/AgpjoZHVYrjlO9D/V/vHYHz8kX24BLZcqDahPeTHj3C6V1SYhFMvFbOMDUgC1cBKCYq7Ri4qy3jIosXtEwxJVn6WJ9UrhfsrqaEON9A2bS84rK7lEegRRXHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007730; c=relaxed/simple;
	bh=L7p7BtE4zEnMuWVX6l91DdgFSpJv0MEE009XOXUasKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LomMNu68ZFMKU6chorFBNBHSEm7M8XJxrj2i5wmm6m5iDP0l56qjiub2L6G4OhrE3mWwJQC3D/CCfCdEwvxjWFzf0GMzTXgSM+lCUPHJfK5mxWnWak5XBTdJ+xYpETsIfjldORwC/FeSzbUQIiVS5BaBFZBu7zMHtCt/DFAzKAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UV4VmP4j; arc=fail smtp.client-ip=40.92.47.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1QrCOWkZKcdWWN6tvyxxbKQtz2GhF5Gwfqx9ImfopIQLl8qXyijgGQ2FTFO2qbSkG3EvTgkAS0RqOLTKK5Ch5apt+tYQi2tXwpCBIvkoYqx6AX1URX3SQRMGQBBWOayVqsIJRanGsBAQx+qo8Ql2dl0XeKPh0IiZNVrG2aZXlbG3snhYeiWVtK2pfKUUmQ4z71aybxlT9wPwYVgVIyeIDWWdQVF7hHbHbB9rjEQY1JAqcdAq7UaSEzWyYkF4hry1RM6i68yAnnBXc9NV9eLEXOvcTL31dNyluO5T0nB8aU4pUBMRNhXIoDuUElCpSznkUce0ITBrznhsOm/DTt1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wExFnTotY0bkXB4qvU68194faUzqnWH17rXDHpxCCSk=;
 b=EClo8wXVha9kfV69fj6H6EaM9570FNQLsysWjAAWNW+fXmDGadGVPtP9J5U8BNTG9OO5PZCrLSmZFxMhE3jz3ERN+NR8bCMByjoIpiSgSuYEBxRE+hBT2vB1SclEPs07mRk69r6SRs55pyMWAivYAAr5wuTc1UDoNwEKiUeN9YOT377z/YX3SXTqvtwdjrTLj62bbDiRK5Vr1+g1TDL8ap+QahNaLCvL7VyTxR4S6zBwzSzQpRJob7sYPyQC7OT5S2Z3L2+30T/vj/McoT5v/oHFG5k6uwG7GnxijaEACRPwxQ9NY4IX/1RlnaSlxY03QgEQtaw9Cy+uMysB+2ZIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wExFnTotY0bkXB4qvU68194faUzqnWH17rXDHpxCCSk=;
 b=UV4VmP4jGJiBzfpjAVhh1yHC5kvNIA8HI6h68rdUIOKjRCUV/8Pkz+DDiumRjEZ3RQ8eR0+1zNc7ZcXYMAGRXjnLrvCF0705lwgFWUug8vvVSYqoDnd8RMPTGL/B60IPfAfsBF8SaPfLK4vSUQAv3rVAz8/VIEBbizlwjARX4qH9FmBtyOTWvTCyyYwbUR71LrRGCEj5k6w4cod2qsS8A8j+wN037nK7vUdJpGK7ZiuI9YAuD/kgGdy3l0PiSKiSPd/F+Ds77VJOcmzh3q+sdLPmvh34/ir3yyDmB8JHku+MPsT/ZE2AkJNvobKjxY/pCMz4KokNWHe8r/Z9BxoW4g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5218.namprd20.prod.outlook.com (2603:10b6:510:1c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 08:48:44 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 08:48:44 +0000
Date: Fri, 30 Aug 2024 16:47:39 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@spacemit.com>, Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID:
 <IA1PR20MB495356670C7F97542E6F5072BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-3-1fed6a22be98@gentoo.org>
 <IA1PR20MB495369231BB1E1677228D95DBB972@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240830075626-GYA41291@gentoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830075626-GYA41291@gentoo>
X-TMN: [zlcGTxEZJuqaULsJHdpCqguVyHvsBPTV1LSf2vXWveI=]
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <mlsih6s2lgmapjshkpdnv42lzajpz3vd5auqpv5yysr4dnpjoo@c6ec7ijpe5ov>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c00012-531c-47ad-f926-08dcc8d08e33
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|15080799006|19110799003|8060799006|6090799003|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	62OEtHyRrUecktfzFi+51JnYUlGXsIJsAwLlGuJYlUtCuRChPbxhKAyoAACYr9SPJSVDgv9FPqVyadcHRav2yisuGS6rnAH9oezUpgXaQbVkB7N6u5IIcgOVHeLwkuSIzcemlqfhDl7FK0ABGrQfnkK1ZIYFpIz31dRR0p9FEW5cPFeDKdRC9IhT8GnHqErJ+AJcaUZvT86M3bjQkBKzlgtBfsLukz8QRYHN/dgamI1WtyBTU1UY0y6YaxY0S2nULteO5zbqkr1mgEE67m5lcp6G1pY9OzZhEv0gc3UcOY3R1N3892M2QTJTMlh3wifz3NXiussOPjk0i3g0g1JTbFJIaSKMkmCUPNOshFI+l03CYU9T/jvWTRRib5IgHFNhzVyu8SIPtZHeSy/Rddu4gifHd3u66COmgLIe5WuFBEbvgyyp/9Dj4CYd9IvHVFGZFAmPC+ikTvnzj9QUquc4t2t6E4sIm5Tsmt81wWTc+sq6rAEH9BzPNwmEfPHAf4uGsmT/gc5YdJ9jwxBCSOmt7wLMIwIwVzNmotCJZgDxbrZGw07m4V485aZIqZ04Q6mE3KsJwIwiqv/g3WXWKAy8FLMVf8vbBi6c9tmco69vWPLZMIy9Qbxo9t8khKZHy0M5s+2CzBQhKysJpq4+du+MJZxLUg7fENtqPw+VF6HlYPV5eK0oDODBwr+kkQHtsxu0PDE/aufcUZnxwsKuFb0VWSWJy5CUU8GinzIm1k3JHwF8ZbSPG+Peln148GHFmvp13do8tZt8nP3jvWBH+oyu/g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GO5sb3CefbjASO+vxoPjN48sOu2w0pAKrvS9QW3JiD7g1RvrRFwW/3hFKi4p?=
 =?us-ascii?Q?qurg32V/UR7mhJzb8W+Sr+foj2vVqLA7SvDBER5YGWowcJ/5OMehMoyRKxmW?=
 =?us-ascii?Q?dWL14+5gMInRrMhktP1+whuNpAfMvvHg1fFkO8IIhBtweyIH1WUXIKliCPBI?=
 =?us-ascii?Q?b4QM1hMJjoDaPk76JANqhRvwjznJtTf3Ex2fyDtA8aXkzq1nooCHLKPT+rt/?=
 =?us-ascii?Q?OXqkhNHRa5hwGsi0lC81Pd13Jkp1u4FdhOnO4groNpKu0bKkpb+qJ5vLPJ3o?=
 =?us-ascii?Q?0ObtygkgvRGRS86k3AOmhTC29Pn6oHhYHlLpJ3UISX+QzkHTIQI/ijl37ktl?=
 =?us-ascii?Q?giXsSKI6/gwzRyxLt9Hzj4fxDq36sw9CobgI6dLJI3z0kNzdRbbTrpuqUS2q?=
 =?us-ascii?Q?OeJW2O060zg0IwJQ7UjQXRiUfAQ3YqeqUPd3eGXIanRbhS0cmdpiQUMgsenX?=
 =?us-ascii?Q?jenEmSZRZTwIfRPq+97bgreIBhXOEdbkTCGzi04bW7NyPU4iCawzX31S8ytZ?=
 =?us-ascii?Q?gZZ/fZjgZSsk6iwVcO7PbCasT12Lck/4FQYkaFuKXcgCl7GEgvjAL825wFhc?=
 =?us-ascii?Q?7mAOoAHCMQ0UNRkDrNl0+PCD6U9eWu/8xTimDVLz8Qka+YU8/B8lVM54xIQv?=
 =?us-ascii?Q?EIvayt/fPPqzWbvQzM69uybS6frrjYPBpErB/WKfSuhfhM+lkw5Ufm96I1e/?=
 =?us-ascii?Q?fXmXGiqkJqqGyJRAcnltNHHVF/8cRObNCowPXNc2tC46MhxlrZkIBZx+6/5V?=
 =?us-ascii?Q?mxxuYxHKbJTKikJjggSOrvlp7KlXGm6jM9SdCgmTssFP+f3d8CZL8FkLmeW+?=
 =?us-ascii?Q?Pvl1JeJro/bBE9KWN0dDL34Sx0QA6oX6TBL+Vs8vNRRJAX3Y27NJgR0cP2f5?=
 =?us-ascii?Q?E+sZaQqBHyvg6Y/Z7Zd0cRz/KSxywxa8CYdyni7/05LSiV2mVLUPhktLszau?=
 =?us-ascii?Q?j25i5z069pcXonIPnDmFhCN/4vrCk4jHGrfjydZ6/ZN6tZ4v6Plih8UKvSDF?=
 =?us-ascii?Q?RgiIlyYQBGdjGqcnOhBzA10QHPka2Gvz6vo/NcZGePHm82KifwQuKRaNx39y?=
 =?us-ascii?Q?LWEGiqN7T81TCufX7eFCY7WajlN0YZ26e5FJCcc4hw6h6O8/p3X1l0ljI+qw?=
 =?us-ascii?Q?TrYPmbokRgZBEwD5UD/tn+xZ0b+SExQCQ7rBDQ54WsXzXKVXaG/tAfJAyvoo?=
 =?us-ascii?Q?E2k6oDtIz2UYSVP6Xjoi4hK/07PxljqJNERMK5+zMTcMu1xvnNVp90FN+A0T?=
 =?us-ascii?Q?C+OYAqclc21vmnQEiDeK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c00012-531c-47ad-f926-08dcc8d08e33
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 08:48:44.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5218

On Fri, Aug 30, 2024 at 07:56:26AM GMT, Yixun Lan wrote:
> Hi
> 
> On 09:36 Fri 30 Aug     , Inochi Amaoto wrote:
> > On Wed, Aug 28, 2024 at 11:30:25AM GMT, Yixun Lan wrote:
> > > Add pinctrl device tree data to SpacemiT's K1 SoC.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > > Note, only minimal device tree data added in this series,
> > > which just try to demonstrate this pinctrl driver, but
> > > more dt data can be added later, in separate patches.
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  19 ++++
> > >  arch/riscv/boot/dts/spacemit/k1-pinctrl.h    | 161 +++++++++++++++++++++++++++
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi         |   5 +
> > >  3 files changed, 185 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > new file mode 100644
> > > index 0000000000000..1082f92753176
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > @@ -0,0 +1,19 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > > + */
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include "k1-pinctrl.h"
> > > +
> > 
> > > +&pinctrl {
> > > +	uart0_2_cfg: uart0-2-cfg {
> > > +		uart0-2-pins {
> > > +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> > > +				 <K1_PADCONF(GPIO_69, 2)>;
> > > +
> > > +			bias-pull-up = <0>;
> > > +			drive-strength = <32>;
> > > +		};
> > > +	};
> > > +};
> > 
> > "uart0_2"? Is not enough to use "uart0"?
> > 
> not sure if I understand your point correctly here, are you saying that
> we should describe all configurations of the "uart0", as there are indeed
> another two options - uart0_0, uart0_1 which using different pins, I can
> add them in next version

I doubt whether it is necessary to add all configuration. Now I think adding
only used is fine and can save a lot space.

> 
> for uart0_2 itself , I would consider it's a complete configuration
> 
> > Although I do not reject to add a new common file, it is better
> > for you to squash this part into the next uart dts patch. I think
> > this is more related.
> > 
> I can squash them into one patch but still with separated pinctrl common file,
> does this sound good to you?

This is OK for me.

> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

