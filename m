Return-Path: <linux-gpio+bounces-7341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F113C903331
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700091F28695
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 07:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D209D171E66;
	Tue, 11 Jun 2024 07:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o5kPC3tf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960F8B657;
	Tue, 11 Jun 2024 07:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718089437; cv=fail; b=asS4Yh2yyHD9rpLsjGa4D8uLDlEqyF9Qu8yYXQM92KMzJLuWuhuhvNfgUkQa7OvxgXQSXY+TIMn1x0t2djPVleF7u93p3JgWfxMrbbxnUPjj+jfq3HytSMsr6hs/bucvQFaReM0bD9bB1Js7AfRGdR2oqYxhyVTom3a8+hNmh9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718089437; c=relaxed/simple;
	bh=gQk46frN4avYq9OXJ2JRxZFK88ZpE1xVwPqMjidjudc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VOcW1fl75uAsy5WuzCZNFMhl2Q25ec9wzHWuFUuLxLvz4Q363aV1mI6vNKEOz3AE2N5+jHh8APOaebW4zGDprlfIVT5Uw4F0NAoiOWrk7lPY3bAq79wIElh7BESkZwxBK2wJgnbbbVUGH8+sZU9FAHWLci34CzM5JSyBzDentmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o5kPC3tf; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7EBWWD1c8tMEXmmLktrkYmWbTkxxifGcJYyCe/CP1vr20jPRImXqWz3BUy2UVwDS+D2XmyR3VrYY0uQxmZSOo2dzBDHBSImIl03bXZtGAIGTP7hNLotWC6fzZ0mcev3tFg8CtjLV1DkCIhKdwDBF0sKYjA8f4pRGOy176pchZ9NqJm5qanS9Nl6/eMSKGPGFp9Pwa+26kpxIIRzw0ReSHSlBCgwO9hoG9b5J8hjmUgvgmdIClW2YRUu1RGwywycSH5Qw7q+aPTRe8utxOhz66uFH3d53+oPK2FaYbwEPxLnw92RT+YQ9G0M6ofdXWH1GwXt0ISEC51WWfkT7iRBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNlcmB5uJk5cP3/KGgVvZLwERuGC3ChIxJZ8uI4Fnuo=;
 b=aWkJUkJCMEx4huwLeyD/+phiZEJ821njL8JF/2LDSYzMS0XqFXyC30ydSCPqR74yuZkUUhpnWTRN/TX5E5+OK/llJTnFju8bPJofDsrM3IsTpViO1mA3jOTgWutQ9YhflQi3lY7KUT232b6c6SjD/J9FVjSEqOWaNAgBI4zoMPYXMH9b4ozXHI75D8d65OVwB1Bvinfu6LwM+nUlixLRyntk5Lr8cRjLRVuWQdaKS8zO9WeXgr4dM3P0vRUWc/phQuSPcrSX1sgDaC8N9n2xws4pEwaIEvg011VIgAuWIq7yBuu4iVwu4falcZ8E3KTKUYysXphbjE3tKV/vaZBzrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNlcmB5uJk5cP3/KGgVvZLwERuGC3ChIxJZ8uI4Fnuo=;
 b=o5kPC3tfYVjA95Icxfmbyl5e6EE1krjTTC4otEA23Lux/iiFwEEre8sBcmeAEFIjzP0X0D4Ea+peZYJW5+MK66WlutxOXvfsxl4/6SUBg9lmgQbwQJtMvK+kHxBrZzKRcO0HByYvgwYEBMq0ShfL0Fdq1EvBji86zNDU9XxIcBc=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 07:03:52 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:03:51 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: Linus Walleij <linus.walleij@linaro.org>, "Simek, Michal"
	<michal.simek@amd.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] pinctrl: zynqmp: Support muxing individual pins
Thread-Topic: [PATCH v3 2/2] pinctrl: zynqmp: Support muxing individual pins
Thread-Index: AQHau4a+n7chh+OvrkKaNvEZeTD4j7HCIzTw
Date: Tue, 11 Jun 2024 07:03:51 +0000
Message-ID:
 <BY5PR12MB4258577B994214AA6A509288DBC72@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240610223550.2449230-1-sean.anderson@linux.dev>
 <20240610223550.2449230-3-sean.anderson@linux.dev>
In-Reply-To: <20240610223550.2449230-3-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|SA1PR12MB6993:EE_
x-ms-office365-filtering-correlation-id: ac3e0cd8-7841-41e4-e6a1-08dc89e4a67a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?UL5mpXVF41NPgNmxLezP9unFBn84E5AbZ5R6xhxl3MYIwOGXdQTIqBWq15Dx?=
 =?us-ascii?Q?dDrsioumwdowRqbHdflwjj6wJzU1NL/t5oEH+53To+1y76A6ygJzRtKhs31w?=
 =?us-ascii?Q?fYwfFEp1YDbSxrShyh6IIAKJF0hgjaMI7P5CdCEbaf1wr1pSE9HweCAWQOh9?=
 =?us-ascii?Q?8ZQwIfMqS66YxgoNmR+YcFZAuHKmkv15X9z0DVMGov0ox+xCJhxu/z5avkHR?=
 =?us-ascii?Q?9xABS34mUjRHNd1Ip6NNvtpa6ycrVEVFou21JwN/jfSHjUq12C8iqjHjS+0b?=
 =?us-ascii?Q?jDhLJSzoDURZ3yqhvP4pKV1q41XNziUdkQQkmtjuU/Z0reGEc26WnIgKtBIg?=
 =?us-ascii?Q?3eQixy70D3tWZqdujDQ7Ip2c5SdrIbCwzDMofhBM+2qV6pf1YcgSZQF+59eT?=
 =?us-ascii?Q?wkoo9D2J27LrbF5PSePsDhEmX5RRKmQ5hUd2xvo6lRKTRF02vjDSXu+JG42g?=
 =?us-ascii?Q?23HksczLzUArYXfZDiXGi+UvsVuJ6O6pBUOq22eLo81hjt509L8ElSnXYmPR?=
 =?us-ascii?Q?ym72ZGWNcYp/5XVxRDcmBxcYpK6lbaJdxUfaVYvoziHvT3nYZZBsZYW52ww4?=
 =?us-ascii?Q?yLl7K66w+iKykrw5NDw9Ojgf4MT5bxdLUDGTpQ+D+saH9vuuymBbeWKzRXUb?=
 =?us-ascii?Q?ed32sKsBcr+vyFFEcStmJYLqh/QgyY1OyKz4ROyJWf0xNVmpD5wnCzSmcSHi?=
 =?us-ascii?Q?nNFaG2KDvojN3ZVxOgHPd50fSdkfkwmJYbqS3qMnB8uijUeNLe5XDPzKvTtI?=
 =?us-ascii?Q?hrLp5CWodflzXqEak/miCu9Fekq8yjt2Mt8Wf22rwvLOFI/NODL30i5Of95W?=
 =?us-ascii?Q?oPdh+FNAwV9LCoSa8Q7RfTxqGuFVYFYo/7k4v+49i/KPkJ8bngh4fC5Xg79B?=
 =?us-ascii?Q?fLCYZdIPat9YFg+yfHH1/pleLCT9ETAokXSxu1NNZ4oOaU9Wkk7Kk+wnLtPz?=
 =?us-ascii?Q?AtvtYB2giN4ABpidubJUia5dRqJmDJ6FSpNc8/xSZN5D1EZ40UPm8GCRHaXT?=
 =?us-ascii?Q?eq+QyNONPvjaPyKfCBLd9ldzTomOLc05kkKD8oZbbabhrYuA7e9vALocrCua?=
 =?us-ascii?Q?W0Yuco1Ka9PBK6eP6IdTrrCUsVfgeS8kEEwkrDJeEjxQBIBtvxjdyQMicDfg?=
 =?us-ascii?Q?KlAojhpd3LROKmTrMFD4thNLOm34YjS8xKT4ENftStPbKaDMGMCiRK0IoPAV?=
 =?us-ascii?Q?z28Sq35U8eKtv2lC1aQJRtCICsQ8pvE+c7/OqdhPiy/2WEOlCIzj8iMX+hsu?=
 =?us-ascii?Q?JUElswCYaNMXM/JDSMfOKXD6ThlLiDfCwX6nrRB7qQo3/fAHsmoPJB/RvBki?=
 =?us-ascii?Q?KFdMBjhR9Rl053ir+1ys93cPYnDtCllfXWIrVMvsOjo/5vSq+ncHj7azGukT?=
 =?us-ascii?Q?YIyALuw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5WeVjC0iWkuEGCPcsPRuvDjJagHjzbRfPf1FVnEObyxjx7Aj5E7LgPXcTefo?=
 =?us-ascii?Q?N9OXkMq44ETRwMZmh5dcE0p5zF4VKKIRckHZC+dk/63vfQpsKaBpUbj2tq9j?=
 =?us-ascii?Q?/UGRTnU6z07t8rMImeOWl34F4+L9xNWHeWFVeoVfchodBuWkAvsHKjJyhFMk?=
 =?us-ascii?Q?IkVxvgXfjlbv3aqRnwmkg3CHJq5B6tFcKxex6utG7cDgpHcd02/Ey9LFNHhM?=
 =?us-ascii?Q?Jdc10GNRc3bTAUKVuM9+TNh3lnKHrEelgvz0ewJrEKm9CrHMVUyzQnM/Jizi?=
 =?us-ascii?Q?J3OxJSPeO9JHnVSapnquG9ku869PHtRrHHuW9fFEhxA+ebZ2W8mJPPXrjyDf?=
 =?us-ascii?Q?mlaJ1dDF5xtlx2/wpUPiWktJfeLXJty4b7/OdWmD4iTR8jStCA3sKiFm8B1K?=
 =?us-ascii?Q?dmvFWSLK516cBuHWWrVzciET4Hfj5cqR51GUZi7RdjHdGFWyyWBiO0cCDkGO?=
 =?us-ascii?Q?HeKbok7+DZ6s0kZcvOtkrL/3ErUC67ZYrXeHylugFHkGTj+9FNXMjUyMhiOK?=
 =?us-ascii?Q?c/5DtmJrbPBQd3ajkLue2YHhAMI9aJRez0gHgfCwzEOuXL0gRuMb83RFkNTX?=
 =?us-ascii?Q?rd+qkxlXoLlOv6tA+Bi/sts7Og1jRgY8CGjnTafBgLU1adiudQNByT/nIYuz?=
 =?us-ascii?Q?kgj7cfvZbFD/tqpY92JcF8uCybSsq/Y8t1GiMBx1l32dUExqqV4rpMbF6mFh?=
 =?us-ascii?Q?XBATPryTsbEb6PBVwDrmNCLntrI+3/4egh4cQupsRHlLY3xg52Wpw1OxBnOP?=
 =?us-ascii?Q?jz6WfJODXLPTtDdDdVS1fIYcZHokYEgqw4mpUtnx8FlmjFhg8TckrL17ANjv?=
 =?us-ascii?Q?A6UzSoVXH/4TBCZpxfu4ztdpAPNTEF36F9kHp9WBtzpq990VdNdA2E1xLmKm?=
 =?us-ascii?Q?XeCnobdQYR/FAIlJuMLZDu/uOszz+D4GuAntvpZdHDb4VYgbTKUknWiUuza5?=
 =?us-ascii?Q?CHiTSzvBW6MfTcKZ46Pzvjw595Kn4uLDyndm9XZGq6jU3CTiw6Hr/i7ApWKF?=
 =?us-ascii?Q?LAmDi+xu1UdP1cqV2EFuX5iuUeQ+pzuU9u1htrt4lj53T9rFr5PLxzAE5tSQ?=
 =?us-ascii?Q?9iyJHi/T78xwUCnJuPTYVWXrxHfUHBO+OjQUW6Jr82qQLmbtMahyg12bMatP?=
 =?us-ascii?Q?kTPif8vhWjIpwHm1wfw7+gIKYMTTwwHGq9Odd/WEYaEhRFCgED2AY0bevTna?=
 =?us-ascii?Q?l4YT0AfnF1RxloF6l1ldGshGgSpPPLVq39FMd0nb7r5g9Gb6dTTKDnD6Wujc?=
 =?us-ascii?Q?R+eOVsSiwhe9/8HdKqR9+teddAW3hsXmhnGiBe3lALOeOUwjnQsAU8YlPFzp?=
 =?us-ascii?Q?0H+tnocuRUKy8jLNpJ+pmAPEGDJMHaNMx/fQcIbGWQsh9GmhebbtIUSwo/Jg?=
 =?us-ascii?Q?y9CLIhjDQPkVH49KWQvWjyBGZTEt7SKvY0pKVLc6IqrOSM0hFoLexaGFNUas?=
 =?us-ascii?Q?qmcqPQ+m3LRGH8cia16iAkiVXCF4ZRaBXoZhsSwjphWAYua4GQ6OlD40PlY+?=
 =?us-ascii?Q?qwx9sXxVELD3mcf0H778Zhwnn8+uHrpRxsdpgXMT91FODSXMzYpFW3RYZ+s0?=
 =?us-ascii?Q?mNvKsGuZEN10xPnybQY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e0cd8-7841-41e4-e6a1-08dc89e4a67a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 07:03:51.8359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2WTdBV254j8da4vPQrmSF/15/tUsJyDJYpil/M92S2okrehLLLkvmLi/ijfX86/q3A2m0qeQZKgGLS3R/Ryjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993



> -----Original Message-----
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Tuesday, June 11, 2024 4:06 AM
> To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> <michal.simek@amd.com>; linux-gpio@vger.kernel.org
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; Potthuri, Sai Krishna
> <sai.krishna.potthuri@amd.com>; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Sean Anderson <sean.anderson@linux.dev>
> Subject: [PATCH v3 2/2] pinctrl: zynqmp: Support muxing individual pins
>=20
> While muxing groups of pins at once can be convenient for large interface=
s,
> it can also be rigid. This is because the group is set to all pins which =
support
> a particular function, even though not all pins may be used. For example,
> the sdhci0 function may be used with a 8-bit eMMC, 4-bit SD card, or even=
 a
> 1-bit SD card. In these cases, the extra pins may be repurposed for other
> uses, but this is not currently allowed.
>=20
> There is not too much point in pin "groups" when there are not actual pin
> groups at the hardware level. The pins can all be muxed individually, so
> there's no point in adding artificial groups on top.
> Just mux the pins like the hardware allows.
>=20
> To this effect, add a new group for each pin which can be muxed. These
> groups are part of each function the pin can be muxed to. We treat group
> selectors beyond the number of groups as "pin" groups. To set this up, we
> initialize groups before functions, and then create a bitmap of used pins=
 for
> each function. These used pins are appended to the function's list of
> groups.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>

Regards
Sai Krishna

> ---
>=20
> Changes in v3:
> - Fix zynqmp_pinmux_set_mux and zynqmp_pinconf_group_set not
> handling
>   "pin" groups (thanks Sai Krishna).
>=20
> Changes in v2:
> - Use __set_bit instead of set_bit
> - Use size_add when calculating the number of kcalloc members
> - Expand commit message with some more motivation
>=20
>  drivers/pinctrl/pinctrl-zynqmp.c | 83 +++++++++++++++++++++-----------
>  1 file changed, 54 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-
> zynqmp.c
> index 5c46b7d7ebcb..e4ff3c55b87d 100644
> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> @@ -10,6 +10,7 @@
>=20
>  #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
>=20
> +#include <linux/bitmap.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -97,7 +98,7 @@ static int zynqmp_pctrl_get_groups_count(struct
> pinctrl_dev *pctldev)  {
>  	struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
>=20
> -	return pctrl->ngroups;
> +	return pctrl->ngroups + zynqmp_desc.npins;
>  }
>=20
>  static const char *zynqmp_pctrl_get_group_name(struct pinctrl_dev
> *pctldev, @@ -105,7 +106,10 @@ static const char
> *zynqmp_pctrl_get_group_name(struct pinctrl_dev *pctldev,  {
>  	struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
>=20
> -	return pctrl->groups[selector].name;
> +	if (selector < pctrl->ngroups)
> +		return pctrl->groups[selector].name;
> +
> +	return zynqmp_desc.pins[selector - pctrl->ngroups].name;
>  }
>=20
>  static int zynqmp_pctrl_get_group_pins(struct pinctrl_dev *pctldev, @@ -
> 115,8 +119,13 @@ static int zynqmp_pctrl_get_group_pins(struct
> pinctrl_dev *pctldev,  {
>  	struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
>=20
> -	*pins =3D pctrl->groups[selector].pins;
> -	*npins =3D pctrl->groups[selector].npins;
> +	if (selector < pctrl->ngroups) {
> +		*pins =3D pctrl->groups[selector].pins;
> +		*npins =3D pctrl->groups[selector].npins;
> +	} else {
> +		*pins =3D &zynqmp_desc.pins[selector - pctrl-
> >ngroups].number;
> +		*npins =3D 1;
> +	}
>=20
>  	return 0;
>  }
> @@ -197,17 +206,16 @@ static int zynqmp_pinmux_set_mux(struct
> pinctrl_dev *pctldev,
>  				 unsigned int function,
>  				 unsigned int group)
>  {
> -	struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
> -	const struct zynqmp_pctrl_group *pgrp =3D &pctrl->groups[group];
> +	const unsigned int *pins;
> +	unsigned int npins;
>  	int ret, i;
>=20
> -	for (i =3D 0; i < pgrp->npins; i++) {
> -		unsigned int pin =3D pgrp->pins[i];
> -
> -		ret =3D zynqmp_pm_pinctrl_set_function(pin, function);
> +	zynqmp_pctrl_get_group_pins(pctldev, group, &pins, &npins);
> +	for (i =3D 0; i < npins; i++) {
> +		ret =3D zynqmp_pm_pinctrl_set_function(pins[i], function);
>  		if (ret) {
>  			dev_err(pctldev->dev, "set mux failed for pin %u\n",
> -				pin);
> +				pins[i]);
>  			return ret;
>  		}
>  	}
> @@ -467,12 +475,13 @@ static int zynqmp_pinconf_group_set(struct
> pinctrl_dev *pctldev,
>  				    unsigned long *configs,
>  				    unsigned int num_configs)
>  {
> +	const unsigned int *pins;
> +	unsigned int npins;
>  	int i, ret;
> -	struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
> -	const struct zynqmp_pctrl_group *pgrp =3D &pctrl->groups[selector];
>=20
> -	for (i =3D 0; i < pgrp->npins; i++) {
> -		ret =3D zynqmp_pinconf_cfg_set(pctldev, pgrp->pins[i], configs,
> +	zynqmp_pctrl_get_group_pins(pctldev, selector, &pins, &npins);
> +	for (i =3D 0; i < npins; i++) {
> +		ret =3D zynqmp_pinconf_cfg_set(pctldev, pins[i], configs,
>  					     num_configs);
>  		if (ret)
>  			return ret;
> @@ -560,10 +569,12 @@ static int
> zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,  {
>  	u16 resp[NUM_GROUPS_PER_RESP] =3D {0};
>  	const char **fgroups;
> -	int ret, index, i;
> +	int ret, index, i, pin;
> +	unsigned int npins;
> +	unsigned long *used_pins __free(bitmap) =3D
> +		bitmap_zalloc(zynqmp_desc.npins, GFP_KERNEL);
>=20
> -	fgroups =3D devm_kcalloc(dev, func->ngroups, sizeof(*fgroups),
> GFP_KERNEL);
> -	if (!fgroups)
> +	if (!used_pins)
>  		return -ENOMEM;
>=20
>  	for (index =3D 0; index < func->ngroups; index +=3D
> NUM_GROUPS_PER_RESP) { @@ -578,23 +589,37 @@ static int
> zynqmp_pinctrl_prepare_func_groups(struct device *dev, u32 fid,
>  			if (resp[i] =3D=3D RESERVED_GROUP)
>  				continue;
>=20
> -			fgroups[index + i] =3D devm_kasprintf(dev,
> GFP_KERNEL,
> -							    "%s_%d_grp",
> -							    func->name,
> -							    index + i);
> -			if (!fgroups[index + i])
> -				return -ENOMEM;
> -
>  			groups[resp[i]].name =3D devm_kasprintf(dev,
> GFP_KERNEL,
>  							      "%s_%d_grp",
>  							      func->name,
>  							      index + i);
>  			if (!groups[resp[i]].name)
>  				return -ENOMEM;
> +
> +			for (pin =3D 0; pin < groups[resp[i]].npins; pin++)
> +				__set_bit(groups[resp[i]].pins[pin],
> used_pins);
>  		}
>  	}
>  done:
> +	npins =3D bitmap_weight(used_pins, zynqmp_desc.npins);
> +	fgroups =3D devm_kcalloc(dev, size_add(func->ngroups, npins),
> +			       sizeof(*fgroups), GFP_KERNEL);
> +	if (!fgroups)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < func->ngroups; i++) {
> +		fgroups[i] =3D devm_kasprintf(dev, GFP_KERNEL, "%s_%d_grp",
> +					    func->name, i);
> +		if (!fgroups[i])
> +			return -ENOMEM;
> +	}
> +
> +	pin =3D 0;
> +	for_each_set_bit(pin, used_pins, zynqmp_desc.npins)
> +		fgroups[i++] =3D zynqmp_desc.pins[pin].name;
> +
>  	func->groups =3D fgroups;
> +	func->ngroups +=3D npins;
>=20
>  	return 0;
>  }
> @@ -772,6 +797,10 @@ static int
> zynqmp_pinctrl_prepare_function_info(struct device *dev,
>  	if (!groups)
>  		return -ENOMEM;
>=20
> +	ret =3D zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl-
> >ngroups);
> +	if (ret)
> +		return ret;
> +
>  	for (i =3D 0; i < pctrl->nfuncs; i++) {
>  		ret =3D zynqmp_pinctrl_prepare_func_groups(dev, i, &funcs[i],
>  							 groups);
> @@ -779,10 +808,6 @@ static int
> zynqmp_pinctrl_prepare_function_info(struct device *dev,
>  			return ret;
>  	}
>=20
> -	ret =3D zynqmp_pinctrl_prepare_group_pins(dev, groups, pctrl-
> >ngroups);
> -	if (ret)
> -		return ret;
> -
>  	pctrl->funcs =3D funcs;
>  	pctrl->groups =3D groups;
>=20
> --
> 2.35.1.1320.gc452695387.dirty


