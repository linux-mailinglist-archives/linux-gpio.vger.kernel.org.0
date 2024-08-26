Return-Path: <linux-gpio+bounces-9145-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A395EB97
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6261C215BA
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D988A13AA31;
	Mon, 26 Aug 2024 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="UOFKmVVr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2042.outbound.protection.outlook.com [40.92.41.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9513A276;
	Mon, 26 Aug 2024 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660259; cv=fail; b=oJ3su6WQpM3hhRly7bNiytj4gBnfEmo0cFZ1EpOxuhfXeyOaurEwHIbvQidCwp2TdcUtPW6LZOQa2khh6c0BEhAYy/kPA8u5Tc5ldl7BrPA52wIM9/xpouDB9FDxDajR6mo2bVdNnS6/obIPGNCZyzchRlyyWufctKNTaWKWaDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660259; c=relaxed/simple;
	bh=DZ9M3pNE48O+kQSl/hWMUMlV75vXul/0AqJ7j2Bexxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AVfp7vUMR4LH3+SGBJakh4DNMtYQo4jVtyIypkCGVl35Fyonybo27rbVCk1Mf1WJyvb/E7SoiCsroF/Xvh3tI2uFfnZSnHP5Kja325EboMKxiVqeH8pIxde3y8uXgpa62TiUgN2HMIugBqoK3KecD7u1OEwbU7HKSV0GW4/YMgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=UOFKmVVr; arc=fail smtp.client-ip=40.92.41.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr9NYT3GN2GR1XInax50/jzcmvPMtoaMA5MXC0J8ote/E6l/6Mhxm9FU0zESRTJWlY4kFmGXNiIm0ge89OHdQgIcG+f/YVZgC70FZvPwmGDZlWmQC+k0bx8GG7bQw+GX1ff0a4mwKBehk7RPGeh3E/ruzQjryUAcPngXeoqy5Y+7VSTSF0WokjNJEAJ/rt5clBIHD6JCNwG6eBEfs1v3lQDpgUZgkmRvGaZIVwFfRacDEdn/Q/T28IY3xzum44Dj95VzbZqr8K8r72iugGtWwoJNSlgWoWKDgteq99oSmZ/BRj32H2VgRSYL2tvqrhQlE1OqdeUkiZtI9bGRIJkxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLvUjEmgSycrgKN4oH0j+rWKWt5lmb6XZCax+smt0g4=;
 b=bmzgZRWBX3Me+f9Pm1LQkIJIZ/uZTZahral98VTzyowTIc+iJwqvmq/1H+1Zr7Op33ovhbveECPPnAvtpF4uhsq1QGBCiU4VPa2NSiM5YsJOKt3OhIIuFTliyM9U5kl7JYBxx8UwEOVkxEWIbAVVWi5VUFqblCGdJDRu4QlAUOAOunKXrKIS5jwYPy+jXS0KxAD21RQilDNVAwE5OfqlQCmPegsnJVtEnJx02NAlT9IjnZkeK/iTx+sGsiiWhlUaPwZcaDfUXIthEWZsCzHZ3NJO67JVzO4Fo+JZn9dklXDO6PpXmUYoGACcM59dqXOpD/F/BMEqAzlkxcys9VAsvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLvUjEmgSycrgKN4oH0j+rWKWt5lmb6XZCax+smt0g4=;
 b=UOFKmVVro5uZPKC+s4YrOsJJtpJMbV1ZiclK1LpAQhQG3YtneKtLn7jEif6Y0Vubfd3E86JF47WrVe9pDYDhsREbuRGmP0EoZwe6iOWmPP8PT5RG5P7QBggTWntegXNLtLOMrOA3PFfbZO3aluYrXBekcHMch0ZXT3aRfuxNy5U6PpdTO4eNJlck8Zsfo3xBJ1VrXoSMglD1I/kHjdVQEIRpYtvHzlFQLAkGq/peuqAXcK68fCW+TvHckZc9CQOBzS0JlgCrQdYPnaavNgLKzRQHIelmoQlgTlkavf56hKTClG6TM6+tLEqEINYHOr2HNtic8b5oeV+OZ4+6J87ugA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA0PR20MB6653.namprd20.prod.outlook.com (2603:10b6:208:481::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:17:32 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:17:32 +0000
Date: Mon, 26 Aug 2024 16:16:25 +0800
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
Subject: Re: [PATCH v2 2/4] pinctrl: spacemit: add support for SpacemiT K1 SoC
Message-ID:
 <IA1PR20MB4953C2A8A4FF5E707094F234BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-2-ddd38a345d12@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825-02-k1-pinctrl-v2-2-ddd38a345d12@gentoo.org>
X-TMN: [h75jYs0koMsKoEPhmyvBzJMWnf7bENyYa7Y41u9TfbQ=]
X-ClientProxiedBy: SG2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:4:54::25) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <wv2gj42gglb2d4fuqlabcr7sb3ihaxsqffetzplfgg4wihstym@qxjpmd3jlbrd>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA0PR20MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: e916e7a7-2469-485b-6d2a-08dcc5a788af
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|19110799003|8060799006|5072599009|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	6ZsthX78LxO5gakuQfNjImBiUk6GTYrPbPs9EXvZ0TJAv2fv8ojg3FDT7GVNTUPqebe0V4QSU7kTZdZSUcvNI8Eh4p2I2I30dw7F6DTiyK9MqjYUvon1w7UEHGWcWuxc/FfLYKtYVBr6Cm5SIdo/r8zSFUYLC4Pu37PU30Pf9Zltj6+CT/VCEiZkR6V1Jw7HbmlEFo2dBm0GUWApxMGLDgjd3CHg2SNvvNlP4kSuJ0qtWfvUGsh4Re7ICC2lYYkFCHooHt/AnG6aZl8KsHZ0nh+avYqSQWtTmRvry0edKOnLG1V2PjsV6Uiegejve1tNLpi1nYo/kdRdwTOPpvVOXL8SH17d9kE8oxYDVfScZHnDT5GO9O8RdXNHyM+SjwsKObhdWHgrLhKS2SerX1qkf/NUQQZhReh1o3EOgdM+jzChR5urnNpUIZS9oM43TlRGFSFhci+aHYtqaRAIKEOiJRXR9+CQ0AcW2WDYlZDEZFJnu12JbS/GPf+gL6UTja4oXxI+tg7pPRlM1YN/6C0KZUYbjJ4YCZRqOUTUOD0xvidpgO0/qCn9BFRa2s/EQJeQ12ulVxsVSCjq9VDRelkkUveeVYXna9YFSeF0G8UUHGQqVy6sTFT+sTCV8RDuf7P7i8e9aXp2WNHnRo/D8ALd1592Kps6kmxQ2JauVvuvFiE55GjiF0rkVInIciZ0wNMtewqfkDU7elUHvCxckcsaU+MWY7VcA/pHNN5ELR6Rr6I=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BSrC0bXuOOWMOY4j0Xfxt6fNuZsssSGJzxQFYjEETefLFHhnk3wB7GyzG0DA?=
 =?us-ascii?Q?OGLHm99LhpRlIukRrMf1TEgX5QDdIDaB4jV2+ZTPhzf3zXOkg5bqLASWo6Tx?=
 =?us-ascii?Q?Q4vZofBTCr3EHZdQGhXBGtQrCmor9RRpzCfS5FUsVDnwinQhMuVgHtsoXsHb?=
 =?us-ascii?Q?0MWKh2ZGu3+1G5Sh0pqx+obehvMZOEEvywYptFCtdhkm25eQU4jwnEy/Yxnw?=
 =?us-ascii?Q?LbvEx0DOdA+3h2ocNCuaEIwIRPFN/gK5aT3s+3wPFqU0t1PAdfN0zBr/LB79?=
 =?us-ascii?Q?zIQA1D2iB2MPAXu+uGu/UF/5WjLYVf5nn0Wny814AJDvd6hfaIB4PxVE7F71?=
 =?us-ascii?Q?tBS5VPbld41g5Jk285mr1bw9c2fMNiMnRV1+LhOpKKkluhJbjoqaXy5HH/1c?=
 =?us-ascii?Q?olyEzNAB4KIqZeC+MtLJQVXLiudMJXq9HWtrprugzuzBtOEh6pwf4HUJooLX?=
 =?us-ascii?Q?RLYT3tSyf+SS432i2USr2E2bURIJyBJ7vK90VlRs7XMUWOmaya3+lHHmGM43?=
 =?us-ascii?Q?qmMbDcWAct4uzM0C4QrBM4XwKoQ7IqKRGz8TG8e62SfHyBTXfeVmIqrXojPL?=
 =?us-ascii?Q?hw/nN2mqdQY14a/gIGWl29Y7DmhOoyc3CQH4g4NV2pB+D2gykaFVUrsuVbgH?=
 =?us-ascii?Q?lU0hO/H4jc/Al/gQqcRT44MHq8l8Ui37reIGBN4MFORoh7RidJzGUGT4xIDk?=
 =?us-ascii?Q?07TcZQh+2HztgwugrOhbayNTjPiO9NGFqP1XCKaqx2bHjSpkGwAPLYkw97LL?=
 =?us-ascii?Q?WaAZf16UW6RICYgg3sGlCwiBSzXjli2/HCPH3hi05MOxNfCM8316O8G+ql68?=
 =?us-ascii?Q?+Fgvdvo4ethAuj+uMkCjJFz9fiIKmNGnupoZWQ76WJNzlOXTX1hcSdYWfXDc?=
 =?us-ascii?Q?NKby7w+TzeQvPSWy6/h2Nr5gV6Njn3Ykj2CoDY70zDe+NyNk9x4almT+CygQ?=
 =?us-ascii?Q?hfynhdDgArRHVP+GNNZB2+wzsdHW1XO6jnTY4XafihGbecggy0LrR0eK3NdT?=
 =?us-ascii?Q?CgqSk5N9WYsfwZB1hoDpDQ4dIMFgODEHhiluxXjalqD6j46OhBNSvmKswDfb?=
 =?us-ascii?Q?gEA2t0MMWrSIbBIR0FbHcwFOJZ0UZg9LjO/y0mLLvRZ9z+bCsit2GV2Ng+tw?=
 =?us-ascii?Q?rMwZGo7TOxEOtQ8Sp8H8ol/FeFJhRxZjLzvv5XWE9BPgLlcd5RSEnr7invE0?=
 =?us-ascii?Q?nokPnUKw3DrJ0pi10mxX71WvqWA8h0DruY54mUkLn6AwmPrV07bJf0LAFayG?=
 =?us-ascii?Q?FIPRY/RXHvjYJivLk9B4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e916e7a7-2469-485b-6d2a-08dcc5a788af
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:17:32.7655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR20MB6653

On Sun, Aug 25, 2024 at 01:10:03PM GMT, Yixun Lan wrote:
> SpacemiT's K1 SoC has a pinctrl controller which use single register
> to describe all functions, which include bias pull up/down, drive
> strength, schmitter trigger, slew rate, strong pull up, mux mode.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/Kconfig               |    1 +
>  drivers/pinctrl/Makefile              |    1 +
>  drivers/pinctrl/spacemit/Kconfig      |   17 +
>  drivers/pinctrl/spacemit/Makefile     |    3 +
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 1012 +++++++++++++++++++++++++++++++++
>  drivers/pinctrl/spacemit/pinctrl-k1.h |   36 ++
>  6 files changed, 1070 insertions(+)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 7e4f93a3bc7ac..8358da47cd00d 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -583,6 +583,7 @@ source "drivers/pinctrl/qcom/Kconfig"
>  source "drivers/pinctrl/realtek/Kconfig"
>  source "drivers/pinctrl/renesas/Kconfig"
>  source "drivers/pinctrl/samsung/Kconfig"
> +source "drivers/pinctrl/spacemit/Kconfig"
>  source "drivers/pinctrl/spear/Kconfig"
>  source "drivers/pinctrl/sprd/Kconfig"
>  source "drivers/pinctrl/starfive/Kconfig"
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index cc809669405ab..553beead7ffa0 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -73,6 +73,7 @@ obj-y				+= qcom/
>  obj-$(CONFIG_ARCH_REALTEK)      += realtek/
>  obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
>  obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
> +obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
>  obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> new file mode 100644
> index 0000000000000..168f8a5ffbb95
> --- /dev/null
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Sophgo SoC PINCTRL drivers
> +#
> +
> +config PINCTRL_SPACEMIT_K1
> +	tristate "SpacemiT K1 SoC Pinctrl driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GENERIC_PINCONF
> +	help
> +	  Say Y to select the pinctrl driver for K1 SoC.
> +	  This pin controller allows selecting the mux function for
> +	  each pin. This driver can also be built as a module called
> +	  pinctrl-k1.
> diff --git a/drivers/pinctrl/spacemit/Makefile b/drivers/pinctrl/spacemit/Makefile
> new file mode 100644
> index 0000000000000..fede1e80fe0ff
> --- /dev/null
> +++ b/drivers/pinctrl/spacemit/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_PINCTRL_SPACEMIT_K1)	+= pinctrl-k1.o
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> new file mode 100644
> index 0000000000000..9ed9530c78150
> --- /dev/null
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> +
> +#include <linux/bitfield.h>
> +#include <linux/export.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/spinlock.h>
> +#include <linux/module.h>
> +
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> +
> +#include "../core.h"
> +#include "../pinctrl-utils.h"
> +#include "../pinconf.h"
> +#include "../pinmux.h"
> +#include "pinctrl-k1.h"
> +
> +/*
> + * +---------+----------+-----------+--------+--------+----------+--------+
> + * |   pull  |   drive  | schmitter |  slew  |  edge  |  strong  |   mux  |
> + * | up/down | strength |  trigger  |  rate  | detect |   pull   |  mode  |
> + * +---------+----------+-----------+--------+--------+----------+--------+
> + *   3 bits     3 bits     2 bits     1 bit    3 bits     1 bit    3 bits
> + */
> +
> +#define PAD_MUX			GENMASK(2, 0)
> +#define PAD_STRONG_PULL		BIT(3)
> +#define PAD_EDGE_RISE		BIT(4)
> +#define PAD_EDGE_FALL		BIT(5)
> +#define PAD_EDGE_CLEAR		BIT(6)
> +#define PAD_SLEW_RATE		GENMASK(12, 11)
> +#define PAD_SLEW_RATE_EN	BIT(7)
> +#define PAD_SCHMITT		GENMASK(9, 8)
> +#define PAD_DRIVE		GENMASK(12, 10)
> +#define PAD_PULLDOWN		BIT(13)
> +#define PAD_PULLUP		BIT(14)
> +#define PAD_PULL_EN		BIT(15)
> +
> +#define spacemit_pin_to_reg(pctrl, pin)		((pctrl)->regs + (pin << 2))
> +
> +struct spacemit_pin {
> +	u16				pin;
> +	u16				flags;
> +};
> +
> +struct spacemit_pinctrl {
> +	struct device				*dev;
> +	struct pinctrl_dev			*pctl_dev;
> +	const struct spacemit_pinctrl_data	*data;
> +	struct pinctrl_desc			pdesc;
> +
> +	struct list_head			gpiofuncs;
> +
> +	struct mutex				mutex;
> +	raw_spinlock_t				lock;
> +
> +	void __iomem				*regs;
> +};
> +
> +struct spacemit_pinctrl_data {
> +	const struct pinctrl_pin_desc   *pins;
> +	const struct spacemit_pin	*data;
> +	u16				npins;
> +};
> +
> +struct spacemit_gpiofunc_range {
> +	u32		offset;
> +	u32		npins;
> +	u32		gpiofunc;
> +	struct		list_head node;
> +};
> +
> +struct spacemit_pin_mux_config {
> +	const struct spacemit_pin	*pin;
> +	u32		config;
> +};
> +
> +struct spacemit_pin_drv_strength {
> +	u8		val;
> +	u32		mA;
> +};
> +
> +static unsigned int spacemit_dt_get_pin(u32 value)
> +{
> +	return (value >> 16) & GENMASK(15, 0);
> +}
> +
> +static unsigned int spacemit_dt_get_pin_mux(u32 value)
> +{
> +	return value & GENMASK(15, 0);
> +}
> +
> +static const struct spacemit_pin *spacemit_get_pin(struct spacemit_pinctrl *pctrl,
> +						   unsigned long pin)
> +{
> +	const struct spacemit_pin *pdata = pctrl->data->data;
> +	int i;
> +
> +	for (i = 0; i < pctrl->data->npins; i++) {
> +		if (pin == pdata[i].pin)
> +			return &pdata[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static inline enum spacemit_pin_io_type spacemit_to_pin_io_type(
> +	const struct spacemit_pin *pin)
> +{
> +	return K1_PIN_GET_IO_TYPE(pin->flags);
> +}
> +
> +/* External: IO voltage via external source, can be 1.8V or 3.3V */
> +static const char * const io_type_desc[] = {
> +	"None",
> +	"Fixed/1V8",
> +	"Fixed/3V3",
> +	"External",
> +};
> +
> +static void spacemit_pctrl_dbg_show(struct pinctrl_dev *pctldev,
> +				    struct seq_file *seq, unsigned int pin)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> +	enum spacemit_pin_io_type type = spacemit_to_pin_io_type(spin);
> +	void __iomem *reg;
> +	u32 value;
> +
> +	seq_printf(seq, "pin: %u ", spin->pin);
> +
> +	seq_printf(seq, "type: %s ", io_type_desc[type]);
> +
> +	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> +	value = readl(reg);
> +	seq_printf(seq, "mux: 0x%08x ", value);
> +}
> +

> +/* use IO high level output current as the table */
> +static struct spacemit_pin_drv_strength spacemit_ds_1v8_tbl[4] = {
> +	{ (0 << 1), 11 },
> +	{ (1 << 1), 21 },
> +	{ (2 << 1), 32 },
> +	{ (3 << 1), 42 },
> +};
> +
> +static struct spacemit_pin_drv_strength spacemit_ds_3v3_tbl[8] = {
> +	{ 0,  7 },
> +	{ 2, 10 },
> +	{ 4, 13 },
> +	{ 6, 16 },
> +	{ 1, 19 },
> +	{ 3, 23 },
> +	{ 5, 26 },
> +	{ 7, 29 },
> +};

Why these two use different format?

> +
> +static inline u8 spacemit_get_ds_value(struct spacemit_pin_drv_strength *tbl,
> +				       u32 num, u32 mA)
> +{
> +	int i;
> +
> +	for (i = 0; i < num; i++)
> +		if (mA <= tbl[i].mA)
> +			return tbl[i].val;
> +
> +	return tbl[num - 1].val;
> +}
> +
> +static inline u8 spacemit_get_driver_strength(enum spacemit_pin_io_type type,
> +					      u32 mA)
> +{
> +	switch (type) {
> +	case IO_TYPE_1V8:
> +		return spacemit_get_ds_value(spacemit_ds_1v8_tbl,
> +					     ARRAY_SIZE(spacemit_ds_1v8_tbl),
> +					     mA);
> +	case IO_TYPE_3V3:
> +		return spacemit_get_ds_value(spacemit_ds_3v3_tbl,
> +					     ARRAY_SIZE(spacemit_ds_3v3_tbl),
> +					     mA);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
> +					 struct device_node *np,
> +					 struct pinctrl_map **maps,
> +					 unsigned int *num_maps)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct device *dev = pctrl->dev;
> +	struct device_node *child;
> +	struct pinctrl_map *map;
> +	const char **grpnames;
> +	const char *grpname;
> +	int ngroups = 0;
> +	int nmaps = 0;
> +	int ret;
> +
> +	for_each_available_child_of_node(np, child)
> +		ngroups += 1;
> +
> +	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
> +	if (!grpnames)
> +		return -ENOMEM;
> +
> +	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;
> +
> +	ngroups = 0;
> +	mutex_lock(&pctrl->mutex);
> +	for_each_available_child_of_node(np, child) {
> +		int npins = of_property_count_u32_elems(child, "pinmux");
> +		unsigned int *pins;
> +		struct spacemit_pin_mux_config *pinmuxs;
> +		u32 config;
> +		int i;
> +
> +		if (npins < 1) {
> +			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
> +				np, child);
> +			ret = -EINVAL;
> +			goto dt_failed;
> +		}
> +
> +		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
> +					 np, child);
> +		if (!grpname) {
> +			ret = -ENOMEM;
> +			goto dt_failed;
> +		}
> +
> +		grpnames[ngroups++] = grpname;
> +
> +		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> +		if (!pins) {
> +			ret = -ENOMEM;
> +			goto dt_failed;
> +		}
> +
> +		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
> +		if (!pinmuxs) {
> +			ret = -ENOMEM;
> +			goto dt_failed;
> +		}
> +
> +		for (i = 0; i < npins; i++) {
> +			ret = of_property_read_u32_index(child, "pinmux",
> +							 i, &config);
> +
> +			if (ret)
> +				goto dt_failed;
> +
> +			pins[i] = spacemit_dt_get_pin(config);
> +			pinmuxs[i].config = config;
> +			pinmuxs[i].pin = spacemit_get_pin(pctrl, pins[i]);
> +
> +			if (!pinmuxs[i].pin) {
> +				dev_err(dev, "failed to get pin %d\n", pins[i]);
> +				ret = -ENODEV;
> +				goto dt_failed;
> +			}
> +		}
> +

It will be better to check the power-source before inserting a map.

> +		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
> +		map[nmaps].data.mux.function = np->name;
> +		map[nmaps].data.mux.group = grpname;
> +		nmaps += 1;
> +
> +		ret = pinctrl_generic_add_group(pctldev, grpname,
> +						pins, npins, pinmuxs);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to add group %s: %d\n", grpname, ret);
> +			goto dt_failed;
> +		}
> +
> +		ret = pinconf_generic_parse_dt_config(child, pctldev,
> +						      &map[nmaps].data.configs.configs,
> +						      &map[nmaps].data.configs.num_configs);
> +		if (ret) {
> +			dev_err(dev, "failed to parse pin config of group %s: %d\n",
> +				grpname, ret);
> +			goto dt_failed;
> +		}
> +
> +		if (map[nmaps].data.configs.num_configs == 0)
> +			continue;
> +
> +		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
> +		map[nmaps].data.configs.group_or_pin = grpname;
> +		nmaps += 1;
> +	}
> +
> +	ret = pinmux_generic_add_function(pctldev, np->name,
> +					  grpnames, ngroups, NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "error adding function %s: %d\n", np->name, ret);
> +		goto function_failed;
> +	}
> +
> +	*maps = map;
> +	*num_maps = nmaps;
> +	mutex_unlock(&pctrl->mutex);
> +
> +	return 0;
> +
> +dt_failed:
> +	of_node_put(child);
> +function_failed:
> +	pinctrl_utils_free_map(pctldev, map, nmaps);
> +	mutex_unlock(&pctrl->mutex);
> +	return ret;
> +}
> +
> +static const struct pinctrl_ops spacemit_pctrl_ops = {
> +	.get_groups_count	= pinctrl_generic_get_group_count,
> +	.get_group_name		= pinctrl_generic_get_group_name,
> +	.get_group_pins		= pinctrl_generic_get_group_pins,
> +	.pin_dbg_show		= spacemit_pctrl_dbg_show,
> +	.dt_node_to_map		= spacemit_pctrl_dt_node_to_map,
> +	.dt_free_map		= pinctrl_utils_free_map,
> +};
> +
> +static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
> +			      unsigned int fsel, unsigned int gsel)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct group_desc *group;
> +	const struct spacemit_pin_mux_config *configs;
> +	unsigned int i, mux;
> +	void __iomem *reg;
> +
> +	group = pinctrl_generic_get_group(pctldev, gsel);
> +	if (!group)
> +		return -EINVAL;
> +
> +	configs = group->data;
> +
> +	for (i = 0; i < group->grp.npins; i++) {
> +		const struct spacemit_pin *spin = configs[i].pin;
> +		u32 value = configs[i].config;
> +		unsigned long flags;
> +
> +		reg = spacemit_pin_to_reg(pctrl, spin->pin);
> +		mux = spacemit_dt_get_pin_mux(value);
> +
> +		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +		value = readl_relaxed(reg) & ~PAD_MUX;
> +		writel_relaxed(mux | value, reg);
> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +	}
> +
> +	return 0;
> +}
> +
> +static int spacemit_request_gpio(struct pinctrl_dev *pctldev,
> +				 struct pinctrl_gpio_range *range,
> +				 unsigned int pin)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct spacemit_gpiofunc_range *frange = NULL;
> +	struct list_head *pos, *tmp;
> +	void __iomem *reg;
> +
> +	list_for_each_safe(pos, tmp, &pctrl->gpiofuncs) {
> +		frange = list_entry(pos, struct spacemit_gpiofunc_range, node);
> +		if (pin >= frange->offset + frange->npins
> +			|| pin < frange->offset)
> +			continue;
> +
> +		reg = spacemit_pin_to_reg(pctrl, pin);
> +		writel(frange->gpiofunc | PAD_EDGE_CLEAR, reg);
> +
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pinmux_ops spacemit_pmx_ops = {
> +	.get_functions_count	= pinmux_generic_get_function_count,
> +	.get_function_name	= pinmux_generic_get_function_name,
> +	.get_function_groups	= pinmux_generic_get_function_groups,
> +	.set_mux		= spacemit_pmx_set_mux,
> +	.gpio_request_enable	= spacemit_request_gpio,
> +};
> +
> +#define PIN_CONFIG_K1_SLEW_RATE_ENABLE	(PIN_CONFIG_END + 1)
> +#define PIN_CONFIG_K1_STRONG_PULL_UP	(PIN_CONFIG_END + 2)
> +
> +static const struct pinconf_generic_params spacemit_pinconf_custom_params[] = {
> +	{ "spacemit,slew-rate-disable",	PIN_CONFIG_K1_SLEW_RATE_ENABLE,	 0 },
> +	{ "spacemit,slew-rate-enable",	PIN_CONFIG_K1_SLEW_RATE_ENABLE,	 1 },

> +	{ "spacemit,strong-pull-up",	PIN_CONFIG_K1_STRONG_PULL_UP,	 1 },

default enable?

> +};
> +
> +static int spacemit_add_gpio_func(struct device_node *node, struct spacemit_pinctrl *pctrl)
> +{
> +	const char *propname = "spacemit,gpio-range";
> +	const char *cellname = "#spacemit,gpio-range-cells";
> +	struct of_phandle_args gpiospec;
> +	struct spacemit_gpiofunc_range *range;
> +	int ret, i;
> +
> +	for (i = 0; ; i++) {
> +		ret = of_parse_phandle_with_args(node, propname, cellname,
> +						 i, &gpiospec);
> +		/* Do not treat it as error. Only treat it as end condition. */
> +		if (ret) {
> +			ret = 0;
> +			break;
> +		}
> +		range = devm_kzalloc(pctrl->dev, sizeof(*range), GFP_KERNEL);
> +		if (!range) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		range->offset = gpiospec.args[0];
> +		range->npins = gpiospec.args[1];
> +		range->gpiofunc = gpiospec.args[2];
> +		mutex_lock(&pctrl->mutex);
> +		list_add_tail(&range->node, &pctrl->gpiofuncs);
> +		mutex_unlock(&pctrl->mutex);
> +	}
> +
> +	return ret;
> +}
> +
> +static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
> +				unsigned int pin, unsigned long *config)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	int param = pinconf_to_config_param(*config);
> +	u32 value, arg;
> +
> +	if (!pin)
> +		return -EINVAL;
> +
> +	value = readl(spacemit_pin_to_reg(pctrl, pin));
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		arg = !FIELD_GET(PAD_PULL_EN, value);
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		arg = FIELD_GET(PAD_PULLDOWN, value);
> +		break;
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		arg = FIELD_GET(PAD_PULLUP, value);
> +		break;
> +	case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +		arg = FIELD_GET(PAD_DRIVE, value);
> +		break;
> +	case PIN_CONFIG_INPUT_SCHMITT:
> +		arg = FIELD_GET(PAD_SCHMITT, value);
> +		break;
> +	case PIN_CONFIG_SLEW_RATE:
> +		arg = FIELD_GET(PAD_SLEW_RATE, value);
> +		break;
> +	case PIN_CONFIG_K1_SLEW_RATE_ENABLE:
> +		arg = FIELD_GET(PAD_SLEW_RATE_EN, value);
> +		break;
> +	case PIN_CONFIG_K1_STRONG_PULL_UP:
> +		arg = FIELD_GET(PAD_STRONG_PULL, value);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	*config = pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}
> +
> +static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
> +					    unsigned long *configs,
> +					    unsigned int num_configs,
> +					    u32 *value)
> +{
> +	enum spacemit_pin_io_type type;
> +	int i, param;
> +	u32 v = 0, voltage = 0, arg, val;

> +#define ENABLE_DRV_STRENGTH	BIT(1)
> +#define ENABLE_SLEW_RATE	BIT(2)

move this before the function.

> +	u32 flag = 0, drv_strength, slew_rate;
> +
> +	if (!spin)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num_configs; i++) {
> +		param = pinconf_to_config_param(configs[i]);
> +		arg = pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +			v &= ~(PAD_PULL_EN | PAD_PULLDOWN | PAD_PULLUP);
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			v &= ~PAD_PULLDOWN;
> +			v |= PAD_PULL_EN;
> +			v |= FIELD_PREP(PAD_PULLDOWN, arg);
> +			break;
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +			v &= ~PAD_PULLUP;
> +			v |= PAD_PULL_EN;
> +			v |= FIELD_PREP(PAD_PULLUP, arg);
> +			break;
> +		case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +			flag |= ENABLE_DRV_STRENGTH;
> +			drv_strength = arg;
> +			break;
> +		case PIN_CONFIG_INPUT_SCHMITT:
> +			slew_rate = arg;
> +			break;
> +		case PIN_CONFIG_POWER_SOURCE:
> +			voltage = arg;
> +			break;
> +		case PIN_CONFIG_SLEW_RATE:
> +			flag |= ENABLE_SLEW_RATE;
> +			break;
> +		case PIN_CONFIG_K1_SLEW_RATE_ENABLE:
> +			if (arg)
> +				v |= PAD_SLEW_RATE_EN;
> +			else
> +				v &= ~PAD_SLEW_RATE_EN;
> +			break;
> +		case PIN_CONFIG_K1_STRONG_PULL_UP:
> +			v &= ~PAD_STRONG_PULL;
> +			v |= FIELD_PREP(PAD_STRONG_PULL, arg);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (flag & ENABLE_DRV_STRENGTH) {
> +		type = spacemit_to_pin_io_type(spin);
> +
> +		/* fix external io type */
> +		if (type == IO_TYPE_EXTERNAL) {
> +			switch (voltage) {
> +			case 1800:
> +				type = IO_TYPE_1V8;
> +				break;
> +			case 3300:
> +				type = IO_TYPE_3V3;
> +				break;
> +			default:
> +				pr_err("pin(%d) lack power source\n", spin->pin);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		val = spacemit_get_driver_strength(type, drv_strength);
> +
> +		v &= ~PAD_DRIVE;
> +		v |= FIELD_PREP(PAD_DRIVE, val);
> +	}
> +

> +	if (flag & ENABLE_SLEW_RATE) {
> +		v &= ~PAD_SLEW_RATE;
> +		v |= FIELD_PREP(PAD_SLEW_RATE, arg);
> +		/* check, driver strength & slew rate */
> +		if (flag & ENABLE_DRV_STRENGTH) {
> +			if (slew_rate != FIELD_GET(PAD_SLEW_RATE, v))
> +				pr_warn("%s: slew rate conflict with driver strength\n", __func__);

Should this return -EINVAL?

> +		} else {
> +			v &= ~PAD_SCHMITT;
> +			v |= FIELD_PREP(PAD_SCHMITT, slew_rate);
> +		}
> +	}
> +
> +	*value = v;
> +
> +	return 0;
> +}
> +
> +static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
> +				 unsigned int pin,
> +				 u32 value)
> +{
> +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> +	void __iomem *reg;
> +	unsigned long flags;
> +	unsigned int mux;
> +
> +	if (!pin)
> +		return -EINVAL;
> +
> +	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> +
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> +	mux = readl_relaxed(reg) & PAD_MUX;
> +	writel_relaxed(mux | value, reg);
> +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
> +				unsigned int pin, unsigned long *configs,
> +				unsigned int num_configs)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> +	u32 value;
> +
> +	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
> +		return -EINVAL;
> +
> +	return spacemit_pin_set_config(pctrl, pin, value);
> +}
> +
> +static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
> +				      unsigned int gsel,
> +				      unsigned long *configs,
> +				      unsigned int num_configs)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct spacemit_pin *spin;
> +	const struct group_desc *group;
> +	u32 value;
> +	int i;
> +
> +	group = pinctrl_generic_get_group(pctldev, gsel);
> +	if (!group)
> +		return -EINVAL;
> +
> +	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
> +	if (spacemit_pinconf_generate_config(spin, configs, num_configs, &value))
> +		return -EINVAL;
> +
> +	for (i = 0; i < group->grp.npins; i++)
> +		spacemit_pin_set_config(pctrl, group->grp.pins[i], value);
> +
> +	return 0;
> +}
> +

> +static void spacemit_pinconf_dbg_show(struct pinctrl_dev *pctldev,
> +				      struct seq_file *seq, unsigned int pin)
> +{
> +	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> +	enum spacemit_pin_io_type type = spacemit_to_pin_io_type(spin);
> +	void __iomem *reg;
> +
> +	reg = spacemit_pin_to_reg(pctrl, pin);
> +	seq_printf(seq, " reg (0x%x), io (%d)\n", readl(reg), type);
> +}
> +

I think this is a duplicate of "spacemit_pctrl_dbg_show".

> +static const struct pinconf_ops spacemit_pinconf_ops = {
> +	.pin_config_get			= spacemit_pinconf_get,
> +	.pin_config_set			= spacemit_pinconf_set,
> +	.pin_config_group_set		= spacemit_pinconf_group_set,
> +	.pin_config_dbg_show		= spacemit_pinconf_dbg_show,
> +	.is_generic			= true,
> +};
> +
> +static int spacemit_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_pinctrl *pctrl;
> +	const struct spacemit_pinctrl_data *pctrl_data;
> +	int ret;
> +
> +	pctrl_data = device_get_match_data(dev);
> +	if (!pctrl_data)
> +		return -ENODEV;
> +
> +	if (pctrl_data->npins == 0)
> +		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
> +
> +	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
> +	if (!pctrl)
> +		return -ENOMEM;
> +
> +	pctrl->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pctrl->regs))
> +		return PTR_ERR(pctrl->regs);
> +
> +	pctrl->pdesc.name = dev_name(dev);
> +	pctrl->pdesc.pins = pctrl_data->pins;
> +	pctrl->pdesc.npins = pctrl_data->npins;
> +	pctrl->pdesc.pctlops = &spacemit_pctrl_ops;
> +	pctrl->pdesc.pmxops = &spacemit_pmx_ops;
> +	pctrl->pdesc.confops = &spacemit_pinconf_ops;
> +	pctrl->pdesc.num_custom_params = ARRAY_SIZE(spacemit_pinconf_custom_params);
> +	pctrl->pdesc.custom_params = spacemit_pinconf_custom_params;
> +	pctrl->pdesc.owner = THIS_MODULE;
> +
> +	pctrl->data = pctrl_data;
> +	pctrl->dev = dev;
> +	raw_spin_lock_init(&pctrl->lock);
> +	INIT_LIST_HEAD(&pctrl->gpiofuncs);
> +	mutex_init(&pctrl->mutex);
> +
> +	platform_set_drvdata(pdev, pctrl);
> +
> +	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
> +					     pctrl, &pctrl->pctl_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail to register pinctrl driver\n");
> +	ret = spacemit_add_gpio_func(np, pctrl);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "fail to get gpio function\n");
> +
> +	return pinctrl_enable(pctrl->pctl_dev);
> +}
> +
> +static const struct pinctrl_pin_desc k1_pin_desc[] = {
> +	PINCTRL_PIN(GPIO_00, "GPIO_00"),
> +	PINCTRL_PIN(GPIO_01, "GPIO_01"),
> +	PINCTRL_PIN(GPIO_02, "GPIO_02"),
> +	PINCTRL_PIN(GPIO_03, "GPIO_03"),
> +	PINCTRL_PIN(GPIO_04, "GPIO_04"),
> +	PINCTRL_PIN(GPIO_05, "GPIO_05"),
> +	PINCTRL_PIN(GPIO_06, "GPIO_06"),
> +	PINCTRL_PIN(GPIO_07, "GPIO_07"),
> +	PINCTRL_PIN(GPIO_08, "GPIO_08"),
> +	PINCTRL_PIN(GPIO_09, "GPIO_09"),
> +	PINCTRL_PIN(GPIO_10, "GPIO_10"),
> +	PINCTRL_PIN(GPIO_11, "GPIO_11"),
> +	PINCTRL_PIN(GPIO_12, "GPIO_12"),
> +	PINCTRL_PIN(GPIO_13, "GPIO_13"),
> +	PINCTRL_PIN(GPIO_14, "GPIO_14"),
> +	PINCTRL_PIN(GPIO_15, "GPIO_15"),
> +	PINCTRL_PIN(GPIO_16, "GPIO_16"),
> +	PINCTRL_PIN(GPIO_17, "GPIO_17"),
> +	PINCTRL_PIN(GPIO_18, "GPIO_18"),
> +	PINCTRL_PIN(GPIO_19, "GPIO_19"),
> +	PINCTRL_PIN(GPIO_20, "GPIO_20"),
> +	PINCTRL_PIN(GPIO_21, "GPIO_21"),
> +	PINCTRL_PIN(GPIO_22, "GPIO_22"),
> +	PINCTRL_PIN(GPIO_23, "GPIO_23"),
> +	PINCTRL_PIN(GPIO_24, "GPIO_24"),
> +	PINCTRL_PIN(GPIO_25, "GPIO_25"),
> +	PINCTRL_PIN(GPIO_26, "GPIO_26"),
> +	PINCTRL_PIN(GPIO_27, "GPIO_27"),
> +	PINCTRL_PIN(GPIO_28, "GPIO_28"),
> +	PINCTRL_PIN(GPIO_29, "GPIO_29"),
> +	PINCTRL_PIN(GPIO_30, "GPIO_30"),
> +	PINCTRL_PIN(GPIO_31, "GPIO_31"),
> +	PINCTRL_PIN(GPIO_32, "GPIO_32"),
> +	PINCTRL_PIN(GPIO_33, "GPIO_33"),
> +	PINCTRL_PIN(GPIO_34, "GPIO_34"),
> +	PINCTRL_PIN(GPIO_35, "GPIO_35"),
> +	PINCTRL_PIN(GPIO_36, "GPIO_36"),
> +	PINCTRL_PIN(GPIO_37, "GPIO_37"),
> +	PINCTRL_PIN(GPIO_38, "GPIO_38"),
> +	PINCTRL_PIN(GPIO_39, "GPIO_39"),
> +	PINCTRL_PIN(GPIO_40, "GPIO_40"),
> +	PINCTRL_PIN(GPIO_41, "GPIO_41"),
> +	PINCTRL_PIN(GPIO_42, "GPIO_42"),
> +	PINCTRL_PIN(GPIO_43, "GPIO_43"),
> +	PINCTRL_PIN(GPIO_44, "GPIO_44"),
> +	PINCTRL_PIN(GPIO_45, "GPIO_45"),
> +	PINCTRL_PIN(GPIO_46, "GPIO_46"),
> +	PINCTRL_PIN(GPIO_47, "GPIO_47"),
> +	PINCTRL_PIN(GPIO_48, "GPIO_48"),
> +	PINCTRL_PIN(GPIO_49, "GPIO_49"),
> +	PINCTRL_PIN(GPIO_50, "GPIO_50"),
> +	PINCTRL_PIN(GPIO_51, "GPIO_51"),
> +	PINCTRL_PIN(GPIO_52, "GPIO_52"),
> +	PINCTRL_PIN(GPIO_53, "GPIO_53"),
> +	PINCTRL_PIN(GPIO_54, "GPIO_54"),
> +	PINCTRL_PIN(GPIO_55, "GPIO_55"),
> +	PINCTRL_PIN(GPIO_56, "GPIO_56"),
> +	PINCTRL_PIN(GPIO_57, "GPIO_57"),
> +	PINCTRL_PIN(GPIO_58, "GPIO_58"),
> +	PINCTRL_PIN(GPIO_59, "GPIO_59"),
> +	PINCTRL_PIN(GPIO_60, "GPIO_60"),
> +	PINCTRL_PIN(GPIO_61, "GPIO_61"),
> +	PINCTRL_PIN(GPIO_62, "GPIO_62"),
> +	PINCTRL_PIN(GPIO_63, "GPIO_63"),
> +	PINCTRL_PIN(GPIO_64, "GPIO_64"),
> +	PINCTRL_PIN(GPIO_65, "GPIO_65"),
> +	PINCTRL_PIN(GPIO_66, "GPIO_66"),
> +	PINCTRL_PIN(GPIO_67, "GPIO_67"),
> +	PINCTRL_PIN(GPIO_68, "GPIO_68"),
> +	PINCTRL_PIN(GPIO_69, "GPIO_69"),
> +	PINCTRL_PIN(GPIO_70, "GPIO_70/PRI_DTI"),
> +	PINCTRL_PIN(GPIO_71, "GPIO_71/PRI_TMS"),
> +	PINCTRL_PIN(GPIO_72, "GPIO_72/PRI_TCK"),
> +	PINCTRL_PIN(GPIO_73, "GPIO_73/PRI_TDO"),
> +	PINCTRL_PIN(GPIO_74, "GPIO_74"),
> +	PINCTRL_PIN(GPIO_75, "GPIO_75"),
> +	PINCTRL_PIN(GPIO_76, "GPIO_76"),
> +	PINCTRL_PIN(GPIO_77, "GPIO_77"),
> +	PINCTRL_PIN(GPIO_78, "GPIO_78"),
> +	PINCTRL_PIN(GPIO_79, "GPIO_79"),
> +	PINCTRL_PIN(GPIO_80, "GPIO_80"),
> +	PINCTRL_PIN(GPIO_81, "GPIO_81"),
> +	PINCTRL_PIN(GPIO_82, "GPIO_82"),
> +	PINCTRL_PIN(GPIO_83, "GPIO_83"),
> +	PINCTRL_PIN(GPIO_84, "GPIO_84"),
> +	PINCTRL_PIN(GPIO_85, "GPIO_85"),
> +	PINCTRL_PIN(GPIO_86, "GPIO_86"),
> +	PINCTRL_PIN(GPIO_87, "GPIO_87"),
> +	PINCTRL_PIN(GPIO_88, "GPIO_88"),
> +	PINCTRL_PIN(GPIO_89, "GPIO_89"),
> +	PINCTRL_PIN(GPIO_90, "GPIO_90"),
> +	PINCTRL_PIN(GPIO_91, "GPIO_91"),
> +	PINCTRL_PIN(GPIO_92, "GPIO_92"),
> +	PINCTRL_PIN(GPIO_93, "GPIO_93/PWR_SCL"),
> +	PINCTRL_PIN(GPIO_94, "GPIO_94/PWR_SDA"),
> +	PINCTRL_PIN(GPIO_95, "GPIO_95/VCX0_EN"),
> +	PINCTRL_PIN(GPIO_96, "GPIO_96/DVL0"),
> +	PINCTRL_PIN(GPIO_97, "GPIO_97/DVL1"),
> +	PINCTRL_PIN(GPIO_98,  "GPIO_98/QSPI_DAT3"),
> +	PINCTRL_PIN(GPIO_99,  "GPIO_99/QSPI_DAT2"),
> +	PINCTRL_PIN(GPIO_100, "GPIO_100/QSPI_DAT1"),
> +	PINCTRL_PIN(GPIO_101, "GPIO_101/QSPI_DAT0"),
> +	PINCTRL_PIN(GPIO_102, "GPIO_102/QSPI_CLK"),
> +	PINCTRL_PIN(GPIO_103, "GPIO_103/QSPI_CSI"),
> +	PINCTRL_PIN(GPIO_104, "GPIO_104/MMC1_DAT3"),
> +	PINCTRL_PIN(GPIO_105, "GPIO_105/MMC1_DAT2"),
> +	PINCTRL_PIN(GPIO_106, "GPIO_106/MMC1_DAT1"),
> +	PINCTRL_PIN(GPIO_107, "GPIO_107/MMC1_DAT0"),
> +	PINCTRL_PIN(GPIO_108, "GPIO_108/MMC1_CMD"),
> +	PINCTRL_PIN(GPIO_109, "GPIO_109/MMC1_CLK"),
> +	PINCTRL_PIN(GPIO_110, "GPIO_110"),
> +	PINCTRL_PIN(GPIO_111, "GPIO_111"),
> +	PINCTRL_PIN(GPIO_112, "GPIO_112"),
> +	PINCTRL_PIN(GPIO_113, "GPIO_113"),
> +	PINCTRL_PIN(GPIO_114, "GPIO_114"),
> +	PINCTRL_PIN(GPIO_115, "GPIO_115"),
> +	PINCTRL_PIN(GPIO_116, "GPIO_116"),
> +	PINCTRL_PIN(GPIO_117, "GPIO_117"),
> +	PINCTRL_PIN(GPIO_118, "GPIO_118"),
> +	PINCTRL_PIN(GPIO_119, "GPIO_119"),
> +	PINCTRL_PIN(GPIO_120, "GPIO_120"),
> +	PINCTRL_PIN(GPIO_121, "GPIO_121"),
> +	PINCTRL_PIN(GPIO_122, "GPIO_122"),
> +	PINCTRL_PIN(GPIO_123, "GPIO_123"),
> +	PINCTRL_PIN(GPIO_124, "GPIO_124"),
> +	PINCTRL_PIN(GPIO_125, "GPIO_125"),
> +	PINCTRL_PIN(GPIO_126, "GPIO_126"),
> +	PINCTRL_PIN(GPIO_127, "GPIO_127"),
> +};
> +
> +static const struct spacemit_pin k1_pin_data[ARRAY_SIZE(k1_pin_desc)] = {
> +	K1_FUNC_PIN(GPIO_00, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_01, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_02, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_03, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_04, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_05, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_06, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_07, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_08, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_09, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_10, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_11, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_12, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_13, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_14, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_15, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_16, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_17, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_18, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_19, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_20, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_21, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_22, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_23, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_24, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_25, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_26, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_27, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_28, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_29, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_30, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_31, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_32, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_33, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_34, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_35, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_36, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_37, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_38, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_39, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_40, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_41, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_42, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_43, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_44, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_45, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_46, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_47, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_48, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_49, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_50, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_51, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_52, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_53, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_54, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_55, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_56, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_57, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_58, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_59, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_60, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_61, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_62, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_63, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_64, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_65, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_66, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_67, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_68, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_69, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_70, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_71, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_72, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_73, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_74, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_75, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_76, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_77, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_78, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_79, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_80, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_81, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_82, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_83, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_84, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_85, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_86, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_87, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_88, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_89, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_90, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_91, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_92, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_93, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_94, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_95, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_96, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_97, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_98, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_99, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_100, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_101, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_102, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_103, IO_TYPE_EXTERNAL),
> +	K1_FUNC_PIN(GPIO_104, IO_TYPE_3V3),
> +	K1_FUNC_PIN(GPIO_105, IO_TYPE_3V3),
> +	K1_FUNC_PIN(GPIO_106, IO_TYPE_3V3),
> +	K1_FUNC_PIN(GPIO_107, IO_TYPE_3V3),
> +	K1_FUNC_PIN(GPIO_108, IO_TYPE_3V3),
> +	K1_FUNC_PIN(GPIO_109, IO_TYPE_3V3),
> +	K1_FUNC_PIN(GPIO_110, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_111, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_112, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_113, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_114, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_115, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_116, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_117, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_118, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_119, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_120, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_121, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_122, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_123, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_124, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_125, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_126, IO_TYPE_1V8),
> +	K1_FUNC_PIN(GPIO_127, IO_TYPE_1V8),
> +};
> +
> +static const struct spacemit_pinctrl_data k1_pinctrl_data = {
> +	.pins = k1_pin_desc,
> +	.data = k1_pin_data,
> +	.npins = ARRAY_SIZE(k1_pin_desc),
> +};
> +
> +static const struct of_device_id k1_pinctrl_ids[] = {
> +	{ .compatible = "spacemit,k1-pinctrl", .data = &k1_pinctrl_data },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, k1_pinctrl_ids);
> +
> +static struct platform_driver k1_pinctrl_driver = {
> +	.probe	= spacemit_pinctrl_probe,
> +	.driver	= {
> +		.name			= "k1-pinctrl",
> +		.suppress_bind_attrs	= true,
> +		.of_match_table		= k1_pinctrl_ids,
> +	},
> +};
> +module_platform_driver(k1_pinctrl_driver);
> +
> +MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> +MODULE_DESCRIPTION("Pinctrl driver for the SpacemiT K1 SoC");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.h b/drivers/pinctrl/spacemit/pinctrl-k1.h
> new file mode 100644
> index 0000000000000..9d6589b626e9d
> --- /dev/null
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> +
> +#ifndef _PINCTRL_SPACEMIT_K1_H
> +#define _PINCTRL_SPACEMIT_K1_H
> +
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinconf.h>
> +
> +enum spacemit_pin_io_type {
> +	IO_TYPE_NONE = 0,
> +	IO_TYPE_1V8,
> +	IO_TYPE_3V3,
> +	IO_TYPE_EXTERNAL,
> +};
> +
> +#define K1_PIN_IO_TYPE		GENMASK(2, 1)
> +
> +#define K1_PIN_CAP_IO_TYPE(type)		\
> +	FIELD_PREP_CONST(K1_PIN_IO_TYPE, type)
> +#define K1_PIN_GET_IO_TYPE(val)			\
> +	FIELD_GET(K1_PIN_IO_TYPE, val)
> +
> +#define K1_FUNC_PIN(_id, _io)				\
> +	{							\
> +		.pin = (_id),					\
> +		.flags = (K1_PIN_CAP_IO_TYPE(_io))		\
> +	}
> +
> +#endif /* _PINCTRL_SPACEMIT_K1_H */
> 
> -- 
> 2.45.2
> 

