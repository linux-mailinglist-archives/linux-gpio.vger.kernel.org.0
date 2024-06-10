Return-Path: <linux-gpio+bounces-7307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A9690215B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 941C8B218F3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 12:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2259A7E767;
	Mon, 10 Jun 2024 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k/7aCud4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F1678274;
	Mon, 10 Jun 2024 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021770; cv=fail; b=Dz5ITyB7Qe8wACYj1BX1pp/vwIwiQqKiXlGQuIdCNdT9wROsznZ+xMn2+fSpFCOfYH2PUzSqmNWQaUzazdK5imclDer4zzXvou9UNjiS39HdoB0oK3+9eugdUuLkg8m6h1uFQKm92fqqA0w/0/3llCZcd8nrzPv9Mi2xSv/geHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021770; c=relaxed/simple;
	bh=k+r23EAHPVv6pN9X62CUNoSFvk+/bIkbg52RPfTZY+k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AD6beD8OiMHjjNuekzSawzCIJHO9m8TbS5jlVtKjzzgNeJ+fwTylFVFIdMeAJlX1jfsM01BalyNt1WRySkoOTaNeckX3BQjmSmu9z/SVB2cE+zWOCEarf/AZScpk+27DalBtat8djqjp/RoCih9faQk9nHZETg7L6Q8qGD2SZIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k/7aCud4; arc=fail smtp.client-ip=40.107.102.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bL6Z7v6JgfG98I8UX3afmW1JHUozbAdghDUvBxWLX1FMMC9LQIQEDrrJ/TKRbcAFlNBajaiPIS5UO07JIKoaqmHoyLpIMe0tWEbY57ZLNE626KuXAnzpq0LuOszBigVD2nN7hc+lrwKcU0nAOtY6CC0nZvSvQVJGUxNAceuEoRexHThG8nxcXjae4ZXsTdVYI3//QiaMwfri4pdmaYTd1rmjFb8W3pcvMnBclX0FNruIDA0XJBX8oDi6Bii1LoBunw56jlAKbaWYfhKJIXT9+nLOsWjqCuzZ94jduJyW2V1sso+GeO4E/PbZ/V29WPJ2MW+X5Kn4lPY/vltQkFQgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvzpu/Traac7hSlxD+gp49b3UaSB6XcUWptalRM3rTY=;
 b=czkwxrskAa0tPWhGqTli3MHClSjMMgVIh6MEJY+6RPvcXf8xH8QjBl9ia28CXj74KubTzVtoAey3UIX8GZn7IR8Aa4YD2gki46NBE9KpoNQcagY4JEx0xcAzt3YXYMCNLCH6+QSETtTspH2h9MjHJYe48JMopI6KjGDJKuNGABqw49rZP3CdEZA32H0xLn/Zu/RWw4YQjy+AWrqWcYfpkH4QgtcaBfFTawqVwJVx6BxOUQQgBTgBE2uhWcCgKPuFrtL/9s+YRfEXTAhtS2JeHv6SJdLLv0o/6zsObZySkIfolrCl/dfbUGIyqdTCa8F1er0ELpY8mS3l6g0TSYgUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvzpu/Traac7hSlxD+gp49b3UaSB6XcUWptalRM3rTY=;
 b=k/7aCud4KHaPbI/4Evl37BXztCu/HTYrs83H0d0Rt+dVNy2zXu6jUVJDNIQ9sgUHI55OaI7tA4p4BgPofGnu0J9ia3No8PDsuQyICZ9rLnSCDpfgUbwmSNHUE+Quh+2mh2AgPUe2ti13A12acdHDOUdeMh9EBxDUMnLEjwaL67I=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by IA1PR12MB8518.namprd12.prod.outlook.com (2603:10b6:208:447::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:16:05 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::3228:a925:2191:98b3%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:16:05 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: Linus Walleij <linus.walleij@linaro.org>, "Simek, Michal"
	<michal.simek@amd.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Goud, Srinivas"
	<srinivas.goud@amd.com>
Subject: RE: [PATCH v2 2/2] pinctrl: zynqmp: Support muxing individual pins
Thread-Topic: [PATCH v2 2/2] pinctrl: zynqmp: Support muxing individual pins
Thread-Index: AQHaqscJLyv1f+yXaUCJWrRlyOMmRLHA/9UQ
Date: Mon, 10 Jun 2024 12:16:05 +0000
Message-ID:
 <BY5PR12MB4258AB37A4D6CC28E69DDE51DBC62@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20240520150424.2531458-1-sean.anderson@linux.dev>
 <20240520150424.2531458-3-sean.anderson@linux.dev>
In-Reply-To: <20240520150424.2531458-3-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|IA1PR12MB8518:EE_
x-ms-office365-filtering-correlation-id: c10b16ba-9d74-470e-0776-08dc894719f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Z9fEpB/D9ltmGiBgMJIqIkGS+h55pD/CHGcGYMBCEbE4tDQjrgzpL6bzXVqn?=
 =?us-ascii?Q?VzXMyBb9/LAIiC6wwz409gGkiCzAliHTZQKLfsl51L/1kvbW3XjB5jQk47aA?=
 =?us-ascii?Q?umgcJuIFMZUl3bT3Dhp2PzQicCKYALohIBi6pbyYkBpXCyeLdrL3I3gVupVp?=
 =?us-ascii?Q?2zCaDl54blRJECXRspLubYltkN5OKzZ1tcFckRChmGHblgMUE5yzhKGYlLwW?=
 =?us-ascii?Q?wgGGzyn5psY1h29MSW0qA1eVTdrxx0Nu8FvZmKfVSqVByK+I4yPh5fA02a/0?=
 =?us-ascii?Q?f+tu7UdEyIyQrZ9o/7VTel65jCQJl0XreXV4k55++sQruC7d8zXoAAqET5E7?=
 =?us-ascii?Q?3bOBpq6k7D3wY3NwVADQWrrjwVD5KdW7kSUpVH2dUxM3B7KZ6iFvGbjP4dUY?=
 =?us-ascii?Q?8iG7px9G/k+KtKFZheQ8yGQVXuMRRtEUGe4EIHjxgxvH7WCy3j1D5HGh90Sr?=
 =?us-ascii?Q?9dxYvRT6GFrmy/p0FmukUtIdt4Bv32iHvedwh+iQiyBxNrFuuTm7zqplRcVz?=
 =?us-ascii?Q?2/jsCL785TFd8Vrxy8mg7rCfn9KXemP1Xqr+aCsRh2IXxKVkmfYhoTHsyp8l?=
 =?us-ascii?Q?xUYxZoNpV3z5ldI9t0oVcNUBwSFxa2Na/zMhYRVapnJXm5FpILMXGy6haoob?=
 =?us-ascii?Q?Uic7JWoerrmF8x/SvTC6OLNHg9REx3HBA+BLA4FD3EbE7CfCdN5bYbQY2XfL?=
 =?us-ascii?Q?f+BvlfBgEtlnDlwejzSeC0Adbf07CrtnjZy9ZLctrpYywnucah3Taa6phRDl?=
 =?us-ascii?Q?vdET4cDLl2b93GUOsDFbeH1Y8r7dfUNAqAaWPohfMkysC6+Yk9w7eFXD0DwQ?=
 =?us-ascii?Q?ALD3dLvpmbN5IrkCLe2AiRYS2+aPAXESCaCsfnBHr2CijFyu1iRyaGFjolez?=
 =?us-ascii?Q?se9gQQQHSz3NxYQDZtBUDLvsy1rS9dYm9shnRfk+g8D0SM8cvK1ivHKraejq?=
 =?us-ascii?Q?pH8tAeN3Q7FLVFgbrtGczP19hbSunzJSXKhB8LjI0O7JdNIVaXuUQoXSmYI1?=
 =?us-ascii?Q?9pQ6ZX9RbTSEfH7shBCe4ieRVs67dRE6a1k48wW/+otzOCFzS30Fr135HaCy?=
 =?us-ascii?Q?ZV4yhmbpWvkg5kGPVqiF4CQrNHe31y/hTZMB4AFVQJoHvcef4zCHyDuyzLwD?=
 =?us-ascii?Q?A2+ak9BNZQKK1mQ1Mbsnfi0bGFWSApc69vYIxOIoil1BSI1eHRm7JFpwT2BU?=
 =?us-ascii?Q?nzYu53vqhbdy3WcQ4mcv1P5jKGG3nXU5C8y/OMm/7l9Bwe7yaU7+gMbz6QXU?=
 =?us-ascii?Q?OJjgGrr1t/p1Px9elbNOG8sMSDvVZhhzQMjnwey0RE8/cMzPfixzRRLSzrbJ?=
 =?us-ascii?Q?6l+DL0UX2wDf5CvGRNAe3c/5Fjv7vAzN5VmZZj3wo+Jho1tl3sza0TZ6aW/C?=
 =?us-ascii?Q?dzuITq4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qo5RRJ7L5c/rcn1GBX0e/4eOwwMGM7DFru8jAEzgf+WnOuw4RowuP8X9Pulq?=
 =?us-ascii?Q?JBtYg84g3YzaMUxJo4mYTKtf68wDF1OHuZk5z4O6Pim1c1ce+VOA8By3cumS?=
 =?us-ascii?Q?e6AcDuUREZU9dKYzOVegNHxdNT26/7dI1ZVZyeM6F/71GK95Ur8wDKE5rUr2?=
 =?us-ascii?Q?X1Z5SJ9BVTTKVv0rg0kRSF/kiYKR2Pb3Ay85R1qK7+AZGDcQ8P2QGxr+e2+I?=
 =?us-ascii?Q?OC70kbi4C8EjguigqqoI46daFmtIDwNP6sEfPy3p4bvgbuGFO4sGgQRQX6XF?=
 =?us-ascii?Q?7RhPcBJTQvgZEhIolkBxLJAAbcFolX8bFelTuZQ+fZQiwhA0FpipAfOKgFZZ?=
 =?us-ascii?Q?Htw668xxmx1rHACvtC97lLqLfkDs4LKnnXDGP2KmgzqFZpcV5G5ej8fXgolV?=
 =?us-ascii?Q?98KIf/1hAxnX2a9K5tV5PkU1EJGGd5VORkgFaR1WqtRzgk7lla93YN7XqZIr?=
 =?us-ascii?Q?iyBzIvQeAMrh07l8JOJDRBaeapn3ddLchDKhFTS9s11+QME+qh/bAQWzue+S?=
 =?us-ascii?Q?cyeqjk6qpfff6jBqVfKtHvgloszj+LT0h2R7o7j0ogzTD3JvgkdvKW+2jFbM?=
 =?us-ascii?Q?r/ths9Rd+eM+da98SMShBzHd46kCc0QmyBQVs7siZwqtAE9Xx4PpbwOrn1+s?=
 =?us-ascii?Q?tpjQoQwEPwsmqaTpG0bnEgXxdDei4n0x+4gLZqnVNq2Zx5s1OtvwyfOdFXqo?=
 =?us-ascii?Q?1Uo3cjFJifWkIh4Js3uPQodMtWUz11Oai3cwAhUwfVS55LDbBTh08c29ush8?=
 =?us-ascii?Q?6HVSAlKGXGyiEUFsYSpd+I1srbtZnrfWHHT++WSoDdJRZBHc9MZzWVxwd5u0?=
 =?us-ascii?Q?iMDtSdsn50W6U4McbnhhIbPZNCxx3uFZpZ5/OBzDB6a3lxpXM6ygfizFjiXy?=
 =?us-ascii?Q?gF1MxNaSAp+OF5DTc2aBuQ08UCYpKDTu5k7auAWhw8pyJlybsHMcsMxkVH7e?=
 =?us-ascii?Q?Go9vrdgmL/rxr6SAq+to/QwK4dDpds/pVm+yxWrhSxu9ne5sOZtamx7ChnSv?=
 =?us-ascii?Q?WnNlf4/KgGI0dr/eM0cfC8V6PKAwgUc2ATP9wywkKB5oYwJpCi7UnXR/DlQH?=
 =?us-ascii?Q?wqGNeKHI8IYeX0QAsMo3YHmuxStjWz1MGjNolhH6exisg2z+vb51Zyt8Tx+A?=
 =?us-ascii?Q?nsb4VqgxNtcXrNHzDS0irkdV8hebj6lwTnUmaX7LIjzUISqL/HnA9EwQh78E?=
 =?us-ascii?Q?A7F/9KHpWkcCp0ueoQlUestUymEoVr9U97f6IIqwx6yNwpP2rnZIOK2LzsB6?=
 =?us-ascii?Q?XsgicvxxV53YCpdx3oR+sgA/ecbFl9XecvmFbFpPnGSNh0HpRWVsy5Ba4lBl?=
 =?us-ascii?Q?GNAw0E0OMmNkpdLxLJmpmxrSP8iEJ7UDAOnhMPTRskI63v3AinR+i09vhUf+?=
 =?us-ascii?Q?tt6MVsKgnvF7roNRv7hM95f4IEPcWOojf15NDAqycZxymO2XCn32OhFJ3X3+?=
 =?us-ascii?Q?5BM+uXeyUNJ2hewKvM9LQdfC1XRRRxd6EZwS6WRiOVTUhr0qjOAZdtu5DC1F?=
 =?us-ascii?Q?D4GpiTL32KJLo19nqXgQk5dfZUSVO/l0U9uEnHRAjm+3XDeHDT1IH+E3JZV0?=
 =?us-ascii?Q?JXn5GyXFLr0wABRnybc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c10b16ba-9d74-470e-0776-08dc894719f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 12:16:05.0977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbR/vDxun7cW9cW1MBrMAvFf3emONaJZpqMnucKieBUJs4MnvBsUJMh8rg0vOxPZb6eHj1xh2xgqQjsyIYle1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518

Hi Sean,

> -----Original Message-----
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Monday, May 20, 2024 8:34 PM
> To: Linus Walleij <linus.walleij@linaro.org>; Simek, Michal
> <michal.simek@amd.com>; linux-gpio@vger.kernel.org
> Cc: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; linux-
> kernel@vger.kernel.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> linux-arm-kernel@lists.infradead.org; Sean Anderson
> <sean.anderson@linux.dev>
> Subject: [PATCH v2 2/2] pinctrl: zynqmp: Support muxing individual pins
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
> ---
>=20
> Changes in v2:
> - Use __set_bit instead of set_bit
> - Use size_add when calculating the number of kcalloc members
> - Expand commit message with some more motivation
>=20
>  drivers/pinctrl/pinctrl-zynqmp.c | 61 ++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-
> zynqmp.c
> index 5c46b7d7ebcb..7cc1e43fb07c 100644
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
While testing this patch, observed that some more changes required in the=20
other functions like set_mux, pin_config_group_set. Pasted the diff below.


diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zyn=
qmp.c
index 636e56f7cd92..c82074819be3 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -206,12 +206,18 @@ static int zynqmp_pinmux_set_mux(struct pinctrl_dev *=
pctldev,
                                 unsigned int function,
                                 unsigned int group)
 {
-       struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
-       const struct zynqmp_pctrl_group *pgrp =3D &pctrl->groups[group];
+       const unsigned *pins;
+       unsigned npins;
        int ret, i;
=20
-       for (i =3D 0; i < pgrp->npins; i++) {
-               unsigned int pin =3D pgrp->pins[i];
+       ret =3D zynqmp_pctrl_get_group_pins(pctldev, group, &pins, &npins);
+       if (ret) {
+               dev_err(pctldev->dev, "Get group pins failed for group %u\n=
", group);
+               return ret;
+       }
+
+       for (i =3D 0; i < npins; i++) {
+               unsigned int pin =3D pins[i];
=20
                ret =3D zynqmp_pm_pinctrl_set_function(pin, function);
                if (ret) {
@@ -476,13 +482,18 @@ static int zynqmp_pinconf_group_set(struct pinctrl_de=
v *pctldev,
                                    unsigned long *configs,
                                    unsigned int num_configs)
 {
-       int i, ret;
-       struct zynqmp_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
-       const struct zynqmp_pctrl_group *pgrp =3D &pctrl->groups[selector];
-
-       for (i =3D 0; i < pgrp->npins; i++) {
-               ret =3D zynqmp_pinconf_cfg_set(pctldev, pgrp->pins[i], conf=
igs,
-                                            num_configs);
+       const unsigned *pins;
+        unsigned npins;
+        int i, ret;
+
+        ret =3D zynqmp_pctrl_get_group_pins(pctldev, selector, &pins, &npi=
ns);
+        if (ret) {
+                dev_err(pctldev->dev, "Get group pins failed for group %u\=
n", selector);
+                return ret;
+        }
+
+       for (i =3D 0; i < npins; i++) {
+               ret =3D zynqmp_pinconf_cfg_set(pctldev, pins[i], configs, n=
um_configs);
                if (ret)
                        return ret;
        }

Regards
Sai Krishna

