Return-Path: <linux-gpio+bounces-9412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DB9654C2
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 03:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C1F21F2394D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 01:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C4E4436E;
	Fri, 30 Aug 2024 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="SkpAIZu5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2047.outbound.protection.outlook.com [40.92.18.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2759C25569;
	Fri, 30 Aug 2024 01:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724981867; cv=fail; b=BZd8XfFkaUE5bnUjZUDfKxGUW0K5eOnR2/iLiWVwILA6K9vxA0aCW1PULlH1pbB88WOKaYf1J01vE7pLliSwRCn3uzdHcdPcTVVoscYhi26OBb5kIWslaaIgeXQ1Cf43QqYELXBsFaHqXG5JJW3rhJpA5PXmKENd1byYSt2uQbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724981867; c=relaxed/simple;
	bh=wLOUsPMUoGU5c6ywFNUy0j7mWIiPLFuDmKc1foMeGts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NchlzTR63SCP2PVyAVN4xRTIvMnOQByxTRvQx4tBQXE0yVK/Jd+TES4WrA9tNJ4i2rIGc+pnXAQQ2D8k/d0Lc1NyErTs3YLNbjPDVMcHiXYVJEavZ+mdzuJPGYXXJw9jn8zH44oVm9PxUNbc4HDwBjv3toHHeSHHxktKVq1np0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=SkpAIZu5; arc=fail smtp.client-ip=40.92.18.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufJrW0IHecIaFxGDna0i3PyG4afOmFwq7+22yTSGpMG0E/EXkZ2Z1I79ZIn0NNcPcVVF/MF8JeFdXuvByZllu2StIRlRDorhwu1jrCX689/AU2ehB0bcuBXD4HkAEznp8VU0svJmTpYPW4GRfKh5lW2SUCixRQ/xnFb0NxGU7cxYCPLeJGOtGw8Zu715JX/Mw2wW9C2Www14yFs935E4qNoAk0BQQpL89PoPVwXxVaF1SV72JpXq7JYpER8+VFp6BCHPmfgywdQuYuY0iCzH4lWWBSLDCzz7tAu44PrneHP4/lDEDp5+TCJ9mF5Bx2820xnuof45Q8dDlta+Ayiisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T00PQqnqmwB+s18OvyGJtnEMV+TgwpgwqhTwsnxP4fE=;
 b=VmVU8T67q3Ill/5xz0xuLL4U2eOvP3doiyG+adMafRrJWoAw2+6c2wYq7ty+TY5w1A5NdPGquXpR9qFkhVFrQ53ecosoOPxLf0Jqa00tqs8lyTlA3ci5OOUqeYZXNyxOAaZLhz7wo0YSa6i7VEYTrv/2EjLQJU6eFlrw3mINUvfNVZ2AQfhkOU1VZ7x6o09ngwlS7YXn492obgI+VlCqXD2OHwBGuSh+6smjXgO6RP5pNqxqxmInfYVBOpmbCfg0M/jXjRKihf20fNV65CAC/UXmQxA8BPRc8qwKeEMjXjp9xkxJTeqsrL1ikrC+meXi3FxT3IqjG+CoMXdeK4yRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T00PQqnqmwB+s18OvyGJtnEMV+TgwpgwqhTwsnxP4fE=;
 b=SkpAIZu5t/EKmruVwd4bbgW9bY+onO4S+nhH5OGlSv/m0jlBFBZAxUEIUPunK3iRwJ8nkeAKhy/0lOHdNtL8tkbmKPJixYyAm/YSJhlQajzwg8dSGzA3pwEVizjSJJXVOI8l8y7Xyr0x86XIcmjd3LdmisusWk3FklX8XqYcFS/Nr57jOx8uWtVrrDp+tfdFx12T0eVLBUOR4PQpg6XQGPqm+GmrvjG5ihOoMjE+iFhpUwRACLn91363vLF60XhZf84kYKc/UM7WBHxxVEnXHBR0YWwzx56vN30tBfF4sSVnOtjN7eE8zhpk2oejFwqo6tDzFRuwr9A/fFymTNndvQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB7460.namprd20.prod.outlook.com (2603:10b6:806:3e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Fri, 30 Aug
 2024 01:37:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 01:37:42 +0000
Date: Fri, 30 Aug 2024 09:36:38 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>
Cc: Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Icenowy Zheng <uwu@icenowy.me>, Meng Zhang <zhangmeng.kevin@spacemit.com>, 
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID:
 <IA1PR20MB495369231BB1E1677228D95DBB972@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-3-1fed6a22be98@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-02-k1-pinctrl-v3-3-1fed6a22be98@gentoo.org>
X-TMN: [W8XeUWs6eml+qHjCMBJ8ELS+rLCdADjNUexqji2fAus=]
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <542dw6k2u7hby5wp2bz2i34uy63a355nq5sfiegorrpcmlcmiu@a5cbxvfpd6e6>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 39dba282-b7f4-4912-3c1e-08dcc894571a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799006|19110799003|461199028|6090799003|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	5rIkLxi1N/+61UPA3QDlB2GNUFUB6eBRXNZPvfZyJS+n/zzdpzJOY2O7YR1gupJeFrKeJbD7vhnrCfJFe3neiUQz6sTjqPCwdnYk7cOaionUYzhAdmbd5Vpt21mKEzFZcFpi5E/RyM9AwIshnE+WCFdd44Ti+BcLlm30tBZXyYbldQy/1S31SsGuwzgAJajppsJnCzhRoG/JhXLthjzjiVK3du2tla6IoMX5uNiR7c0kBN+IKhTkg9gbMp0s/c24kJS9k7yrrIWUi3U/+OVFc3X+S/ire0+GSM1FwuyWDAqPpsU9iit7qAfFE2hOiqegbe2jZYBE8fKuothBwCce7txAnyqjZDlTIj15aV0txUDpb4X0ONPMSx1x8l2fvB2IoG9bW7qnIVFJLO7qkjmGbeOblpCnKc2Ck+sA296TvAK/9LCFx0LCMN03mEZrHUYlPqkj6dPJxO+1emQFfFQN8r3yMmbM+OwYPUik3cfEg1YgyeAyIHgigJRRHwWGxgmIGOiGvOKBaOo9AeO5qSVTL6yXsSxGGsjaVXmAGAvbw+WezZ1boDPrz3I5AGPVfh7h2Op5EbRWJmC2owPNmtenMo2kuvZnG3KSoxJ2Z/TQfKyrQQsE+tquMcO0Xdb8zCDWAalC1E+xM+/odrQsgHMBnLZ8GzY1FVuDdqyhQlAWs/GRb85AQcnqUihzqh0msz8iC4oaTIl9Ji82206OL79OlxTHN+xpb+h1VnRQG5Gq8xQ09xBr5oF0lfneHf1qbh8ogsE9j4zmUoJl5Y0XmniCUg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rnx6IAj2WIaCidwNcyjCv1T9ejWXh/gENDqfEIFdPC5Cfd6wre/q+xsMw74+?=
 =?us-ascii?Q?I0Do6zQOTReYL/1d/SQgACcpmJnygnVwSGjzqk6mlRjfmbChZQyj9A9CY2Ux?=
 =?us-ascii?Q?+tO6OwZXaU5RA/RlBvBMbHxGA77qpyCdIOmg+tbmQuj9FCUfJdZBJEX21q7w?=
 =?us-ascii?Q?IqN9DgHCYkTsVvatAfkyqiPAd2u6bHV6ARtHcFvytHAAIyqKjS1VfjtCZl6R?=
 =?us-ascii?Q?r71wYqhfp9M0ero9k19N4+1BKUGx6KwfUG1BYd51cPohohXscRJDxLDIMjmX?=
 =?us-ascii?Q?s+3Qdg78Nkx5BINNET+W924nkxmsAJMDRtJIKCK14xNb/pDASHms6f/7OCtF?=
 =?us-ascii?Q?aBLPnAm63b0WKLIwCAul9TJCU/9tDFF3xbmdorqeCsxNViWl8PEADNLwY8WS?=
 =?us-ascii?Q?Iqy4nu4d9Y4T25TUqWlFsjoNZ0i6Ebiq2Qs9H/eG0e0iMesti4jYGhdgntsR?=
 =?us-ascii?Q?NOmZJGxekxiyev/nXS76WLhRyo9jv+2ODynENce2vLuEoHAK+qzsBijM85aa?=
 =?us-ascii?Q?HBHY5P3JKkFxgXIKBOXiuVTCAj1eiQIBNG+6TWmNroSneFFuZm3Ot5yg1BAE?=
 =?us-ascii?Q?enT2LTM6spmA78QqzSKkgjIaju8/k2gSU57P+k5a77AB8onDTsM6YRLJXzqn?=
 =?us-ascii?Q?+U5BEjXQ8CEAbrF8y6SFJlChLkmz0Hiy9n1tAdIge0qqKQygMIqb7el5tN4Y?=
 =?us-ascii?Q?QrjHvz8DOt9rc7THFYwRaafDJVvWZah4pdHp5TpvXg0dOu5Ih0mjex3MVY3H?=
 =?us-ascii?Q?iT75hquVr0Hb2pz1ayS0A4chQr6O4g8gqg/DYIcG7XshVG3/bMFGcqgmQ/xk?=
 =?us-ascii?Q?OavQlahdFN23TSicVA4ajpSmcCdiJn26YE3MmgF3wUaAx1IWooLFfCSbvkJO?=
 =?us-ascii?Q?4P/F85lw7AWzARRPsSyV9soj5aFhXB4uX2gjurBhd9anVdrNwXAXSxEt+GIW?=
 =?us-ascii?Q?eOnsBZYyqBJ3rCdl58i6buWCy/nSLtPave30pGA//qC+JL6BOS2x+TMRhSZ9?=
 =?us-ascii?Q?yMYw8X59qUFJ+/E727w/ml5fyB9T9dDVHlUDoRXjpbxZ1WcyNxWRlzd0uK2v?=
 =?us-ascii?Q?zpNqpKpQbliVJFpvkpPwcM8+AzHAFMQQ/QBXCQlv6Btb0yps226udlbfv9FZ?=
 =?us-ascii?Q?BgSNJoPoN1RlRFTURGzTjgrIqOKYRe7Sd3tXbYzBiNyMd06bdCxfmJMrQ/8Y?=
 =?us-ascii?Q?ErnhQTlDhpFQBVu42Xs4daqV+UZ5UNPR/PvPHm813d2xPG3x1Nw3ejZKCmhv?=
 =?us-ascii?Q?xKsS5n7+U8hdE2SaPNah?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dba282-b7f4-4912-3c1e-08dcc894571a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 01:37:42.4069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB7460

On Wed, Aug 28, 2024 at 11:30:25AM GMT, Yixun Lan wrote:
> Add pinctrl device tree data to SpacemiT's K1 SoC.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Note, only minimal device tree data added in this series,
> which just try to demonstrate this pinctrl driver, but
> more dt data can be added later, in separate patches.
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  19 ++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.h    | 161 +++++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi         |   5 +
>  3 files changed, 185 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..1082f92753176
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k1-pinctrl.h"
> +

> +&pinctrl {
> +	uart0_2_cfg: uart0-2-cfg {
> +		uart0-2-pins {
> +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> +				 <K1_PADCONF(GPIO_69, 2)>;
> +
> +			bias-pull-up = <0>;
> +			drive-strength = <32>;
> +		};
> +	};
> +};

"uart0_2"? Is not enough to use "uart0"?

Although I do not reject to add a new common file, it is better
for you to squash this part into the next uart dts patch. I think
this is more related.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.h b/arch/riscv/boot/dts/spacemit/k1-pinctrl.h
> new file mode 100644
> index 0000000000000..3be4e29553c29
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.h
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> + *
> + */
> +
> +#ifndef _SPACEMIT_K1_PINCTRL_H
> +#define _SPACEMIT_K1_PINCTRL_H
> +
> +#define PINMUX(pin, mux) \
> +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> +
> +/* pin offset */
> +#define PINID(x)	((x) + 1)
> +
> +#define GPIO_INVAL  0
> +#define GPIO_00     PINID(0)
> +#define GPIO_01     PINID(1)
> +#define GPIO_02     PINID(2)
> +#define GPIO_03     PINID(3)
> +#define GPIO_04     PINID(4)
> +#define GPIO_05     PINID(5)
> +#define GPIO_06     PINID(6)
> +#define GPIO_07     PINID(7)
> +#define GPIO_08     PINID(8)
> +#define GPIO_09     PINID(9)
> +#define GPIO_10     PINID(10)
> +#define GPIO_11     PINID(11)
> +#define GPIO_12     PINID(12)
> +#define GPIO_13     PINID(13)
> +#define GPIO_14     PINID(14)
> +#define GPIO_15     PINID(15)
> +#define GPIO_16     PINID(16)
> +#define GPIO_17     PINID(17)
> +#define GPIO_18     PINID(18)
> +#define GPIO_19     PINID(19)
> +#define GPIO_20     PINID(20)
> +#define GPIO_21     PINID(21)
> +#define GPIO_22     PINID(22)
> +#define GPIO_23     PINID(23)
> +#define GPIO_24     PINID(24)
> +#define GPIO_25     PINID(25)
> +#define GPIO_26     PINID(26)
> +#define GPIO_27     PINID(27)
> +#define GPIO_28     PINID(28)
> +#define GPIO_29     PINID(29)
> +#define GPIO_30     PINID(30)
> +#define GPIO_31     PINID(31)
> +
> +#define GPIO_32     PINID(32)
> +#define GPIO_33     PINID(33)
> +#define GPIO_34     PINID(34)
> +#define GPIO_35     PINID(35)
> +#define GPIO_36     PINID(36)
> +#define GPIO_37     PINID(37)
> +#define GPIO_38     PINID(38)
> +#define GPIO_39     PINID(39)
> +#define GPIO_40     PINID(40)
> +#define GPIO_41     PINID(41)
> +#define GPIO_42     PINID(42)
> +#define GPIO_43     PINID(43)
> +#define GPIO_44     PINID(44)
> +#define GPIO_45     PINID(45)
> +#define GPIO_46     PINID(46)
> +#define GPIO_47     PINID(47)
> +#define GPIO_48     PINID(48)
> +#define GPIO_49     PINID(49)
> +#define GPIO_50     PINID(50)
> +#define GPIO_51     PINID(51)
> +#define GPIO_52     PINID(52)
> +#define GPIO_53     PINID(53)
> +#define GPIO_54     PINID(54)
> +#define GPIO_55     PINID(55)
> +#define GPIO_56     PINID(56)
> +#define GPIO_57     PINID(57)
> +#define GPIO_58     PINID(58)
> +#define GPIO_59     PINID(59)
> +#define GPIO_60     PINID(60)
> +#define GPIO_61     PINID(61)
> +#define GPIO_62     PINID(62)
> +#define GPIO_63     PINID(63)
> +
> +#define GPIO_64     PINID(64)
> +#define GPIO_65     PINID(65)
> +#define GPIO_66     PINID(66)
> +#define GPIO_67     PINID(67)
> +#define GPIO_68     PINID(68)
> +#define GPIO_69     PINID(69)
> +#define GPIO_70     PINID(70)
> +#define GPIO_71     PINID(71)
> +#define GPIO_72     PINID(72)
> +#define GPIO_73     PINID(73)
> +#define GPIO_74     PINID(74)
> +#define GPIO_75     PINID(75)
> +#define GPIO_76     PINID(76)
> +#define GPIO_77     PINID(77)
> +#define GPIO_78     PINID(78)
> +#define GPIO_79     PINID(79)
> +#define GPIO_80     PINID(80)
> +#define GPIO_81     PINID(81)
> +#define GPIO_82     PINID(82)
> +#define GPIO_83     PINID(83)
> +#define GPIO_84     PINID(84)
> +#define GPIO_85     PINID(85)
> +
> +#define GPIO_101    PINID(89)
> +#define GPIO_100    PINID(90)
> +#define GPIO_99     PINID(91)
> +#define GPIO_98     PINID(92)
> +#define GPIO_103    PINID(93)
> +#define GPIO_102    PINID(94)
> +
> +#define GPIO_104    PINID(109)
> +#define GPIO_105    PINID(110)
> +#define GPIO_106    PINID(111)
> +#define GPIO_107    PINID(112)
> +#define GPIO_108    PINID(113)
> +#define GPIO_109    PINID(114)
> +#define GPIO_110    PINID(115)
> +
> +#define GPIO_93     PINID(116)
> +#define GPIO_94     PINID(117)
> +#define GPIO_95     PINID(118)
> +#define GPIO_96     PINID(119)
> +#define GPIO_97     PINID(120)
> +
> +#define GPIO_86     PINID(122)
> +#define GPIO_87     PINID(123)
> +#define GPIO_88     PINID(124)
> +#define GPIO_89     PINID(125)
> +#define GPIO_90     PINID(126)
> +#define GPIO_91     PINID(127)
> +#define GPIO_92     PINID(128)
> +
> +#define GPIO_111    PINID(130)
> +#define GPIO_112    PINID(131)
> +#define GPIO_113    PINID(132)
> +#define GPIO_114    PINID(133)
> +#define GPIO_115    PINID(134)
> +#define GPIO_116    PINID(135)
> +#define GPIO_117    PINID(136)
> +#define GPIO_118    PINID(137)
> +#define GPIO_119    PINID(138)
> +#define GPIO_120    PINID(139)
> +#define GPIO_121    PINID(140)
> +#define GPIO_122    PINID(141)
> +#define GPIO_123    PINID(142)
> +#define GPIO_124    PINID(143)
> +#define GPIO_125    PINID(144)
> +#define GPIO_126    PINID(145)
> +#define GPIO_127    PINID(146)
> +
> +#define SLEW_RATE_SLOW0		0
> +#define SLEW_RATE_SLOW1		1
> +#define SLEW_RATE_MEDIUM	2
> +#define SLEW_RATE_FAST		3
> +
> +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> +
> +#endif /* _SPACEMIT_K1_PINCTRL_H */
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 0777bf9e01183..a2d5f7d4a942a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -416,6 +416,11 @@ uart9: serial@d4017800 {
>  			status = "disabled";
>  		};
>  
> +		pinctrl: pinctrl@d401e000 {
> +			compatible = "spacemit,k1-pinctrl";
> +			reg = <0x0 0xd401e000 0x0 0x400>;
> +		};
> +
>  		plic: interrupt-controller@e0000000 {
>  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> 
> -- 
> 2.45.2
> 

