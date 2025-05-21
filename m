Return-Path: <linux-gpio+bounces-20395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C225ABED51
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F894E1E35
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 07:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550A22343B6;
	Wed, 21 May 2025 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iqeXnVKm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365717BD3;
	Wed, 21 May 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813851; cv=fail; b=MNjeODDvbUA6usgUYLacL/zIFSdMM1xLc1AZ5C6wZiJWvfVKdPDW4SsbDlcEmpIo9dP5m1/PB4ck3ARavYElxri0rf3G2J3E6cpF3jo5z6wxJ0+S7uSe04WhAHpy9pVZ7VXTuFesAXVD5TIyjOVRDsxVraEUcghdBJzF/3VWit0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813851; c=relaxed/simple;
	bh=X6Z8f0ymYOb8oD1zvfQ1jbrnVzOWw/FypWNPQhjQWM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H9niYHrlft5+9b9LYO6yFbRwFLzOU0MdRnPjfOJzFNlgjlVKM/UOomFlUwonDG8CxsBCEJSjos5FdwfdjMwFTMG7TrnzRg5IPzzdaM+lmPAaD1/5r+Be0Yb76KUbPZjHk41/D+Qbn0UJLaByN/O1hraa/CmWBN+aidNQWmJL4Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iqeXnVKm; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHFhud6GTkGANDt9J/Tr5qF8MGkxjEbralJI6kDOTVNqsRu8kIfFvkmbrfFwxla+zte+XWwBfe9KmGFNkgj+EMVmiPgTplj0J8w6wlCyNUHUMAEoWNuuho8beWcY95uEDi42I6erXzW/dJfAZQd6B5rjIL17raWwtDSAkJ90w72PdDMAeoOvCzRzPTRsFY7KfVRC4NREKMfjTXsxuqjCJv+VmmLrcwKhRTNbpdZvvVHTJwEOMXG1fa6+rD+jAp30XvtmiRQZlxA7is7Th1p71WLNka9it/ebk1GD/e7EdmCruO+1XTlaRYR5q/ioFMnm9xD2VcZ1LCANmJxMFVcbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miyRaruwIdXjui2u4BZS2ouZ/uyA3oKezHA8QeInZGc=;
 b=LBhuM/H7tnaitgETvjVmU0UV8kdNceayL959g4ge2sKLQCdLYXpx8bqs7MXzP2Zxa6KWGYdnnToTKrimzNTMXpMRVMIbcDZf9TGd66vdVccxyEdRcTEA+lkDWOsETitIuxrfGlpbR4iPegvMGAesr2ICwhpjjCNBX6Rabt7u3XvAy8tj08vUb2OlE4Pw5k5DT6uMca2ZP3e4BCZgQIbxNATOLO2L/Wkq80Wq65VeccVw5MojiCVG5S8QJGc7QiyQw5QkqhVsthQ2tx2LXn/1w6FfNLybFR206OaoUUrFfVNi4HR51Pqyj0QUce/iw8xEVwsmqSn/Vfj+SbYSipSxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miyRaruwIdXjui2u4BZS2ouZ/uyA3oKezHA8QeInZGc=;
 b=iqeXnVKmIkm+ZuDfQejTN6S0MMD2Z7ykmvm1P+xDIY0MpLzfnfAU++SvGhDDGsfFacxE4ll0UVQrJd1jXFdAAWgYI3tKnpZipGN2PVNjJ/cUJfCoIo2cgWZccg0GYtypaCs/1vuRWfXJKReJPOmvN9R1DhTROEFETSMKW06TL9R35YSs7TgpU4dCPmL/Vk5Fj7TZjkQ3/taba2EqKa/4jbhtA5zaFpTRxFjwyVZIPstO5zRJWrd+gAsEZvkYTGlIIMIPD00QjLqI0zaJyAY3Vz7VK9BVw7ULRg2kb/MTgbfJ1uqXiho28s678D9xMLgmUndZ9lYEWAZcR6iEWPbiQw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8751.eurprd04.prod.outlook.com (2603:10a6:102:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 07:50:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:50:44 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot
	<lkp@intel.com>
Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Topic: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Thread-Index: AQHbyiFiAXGIjXNaiEKSziOE+hKW37PcrwSAgAAFRiA=
Date: Wed, 21 May 2025 07:50:44 +0000
Message-ID:
 <PAXPR04MB8459EE334B883AAAE22ACDFB889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250521072416.57505-1-brgl@bgdev.pl>
 <PAXPR04MB8459CE5696113684FF076D12889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB8459CE5696113684FF076D12889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8751:EE_
x-ms-office365-filtering-correlation-id: 1c955c83-46ff-4ffc-6cbf-08dd983c3112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xL2TmvJuY6RPkMeu/3tkzhwnlzY3QAijx/AUEjVAokGZS7+ox+RvbisJMSsT?=
 =?us-ascii?Q?DuFclSmCTsD95JwCHaZfhQvjo1+m7apHTIeCIQIOyOC5+STAZT/SVW9ltY/y?=
 =?us-ascii?Q?YErLYbac1mCNytTD5je7Qx5CY4uu5uOaMbJtIa90Ce2qYcpA1DX5IuYdXSRQ?=
 =?us-ascii?Q?gcnZWuZiSb9PhS9IkiV+K6E+gMXuR6u2FcaxllYt0OO+NbR5m/etEXEfKyDn?=
 =?us-ascii?Q?zE1HFg+4GT8ZzfMujg0h3D00tD9RalWMofc6hRnkTdti1JC/r/iliBlhIm+k?=
 =?us-ascii?Q?bPEDu6hqm8w3rXL96mabQHKesNKUlWOVdXGRoUadNla6vF5XpqFtijS0HV7P?=
 =?us-ascii?Q?BPfLGeMQs6JkEUdvfLUHwc5lLy9kK7cLk3lKVzQ5SnNleKBRyaGaEA84q+ga?=
 =?us-ascii?Q?9liBZsgFWrLwHgfvX+sFwUCLB46iY1/NR2QjKLwhBn0kFaD3WM/bbXAfd9JR?=
 =?us-ascii?Q?Wmzmx7xTo+agDTQ8vxbVWS9Ugh3xxaayHNVtb1DVRrnMr9PRGOa7r/Tr++eP?=
 =?us-ascii?Q?/FhIuOSMYuX+sHJslgsTmG4hrt7qhKBHTKWfB3PxtttJn02PvWxOrqtvF9SA?=
 =?us-ascii?Q?fXH5idpmPY0Fi3EUrEagsJH2HFBDX6xLPCvJoAF6usfSVoLGRXRd/8h3VFub?=
 =?us-ascii?Q?ZhPmsrAMKZYLFH5WGT8DwpNs7btM2bHm5zHt2uHgS+rr1uHHXkkXUYzp/aJm?=
 =?us-ascii?Q?QTw3umyLITgDw6wKMKr2+6RUlBeZL46TS1K4LxaboZpb6HSCISCOUoLCl74H?=
 =?us-ascii?Q?0oqJ5xCaIJ84nj+w0x8TTFpVKbx//29qfZTSTt6250nD+5HptQzbTg+aTRTb?=
 =?us-ascii?Q?ZYJ9JNXK+4Lghsq6PsBKlHb/YSP7/HnC3nSvqHvqxrUp4dP1Xf3RyQmP1fDy?=
 =?us-ascii?Q?anNBt2uB/Qt/uzuPVhAQ0N5UHFAtoIOqm5kMo35My0lM5hZXZm//xiblafeM?=
 =?us-ascii?Q?989qojRdvK0poUcU9rLq8cpW9CSZfqN54mNsTnTzyAi7zI52d+1chIfbExuu?=
 =?us-ascii?Q?ge3ug5d7Kyf8uVGNP2+axtV1yWda4JULibCzkTVkLieGBfjmFR/0+gNQidHb?=
 =?us-ascii?Q?Ib391MdXSXicgIfO53Vu7EllQw2bKrAuyPIpsNlcMOo8kxAGucWMb54sJsaa?=
 =?us-ascii?Q?4ffbefUB8o1ybmNUT35M2BGFDWPTuq640JpxrW7iLswsmjMm8lv1I+7bvJX5?=
 =?us-ascii?Q?dSdZcE9M4h8IjxUH7aLEZrhtY2lJapZXvgrANOTjngjfFVaRB/pyMySsDvkY?=
 =?us-ascii?Q?UEmT8MNqwaQNQWvVigKh3eGylsfM8cur9kMHfGDQnBneClNZkxUajpx6eAmu?=
 =?us-ascii?Q?QmrrSokKHM6UjJcKFf/TVodC9leXkxF0gvGTEC7D4Zygg77kpsPZshEQlcA+?=
 =?us-ascii?Q?pu4eH7cKBvdTc6GKDqJ3W/24xHCEcY3q0RgspB+q43MuGe8W/zXKWuyL9bFh?=
 =?us-ascii?Q?H/1z9iktuSk/COPAQ8qHsAx0Bhp74/r0yKPEoI11ih0BoLFUrql09w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MG5gXeSemyvFv8iekvvHobri9bFV8uqOfY6aMrA2C1/qshuC524epuagU2RR?=
 =?us-ascii?Q?CC72ZW4ADdpcVbIlPSIxZ6p9LWhUlUBJvWNOATBHy2gJJPIbYtrdhNyxM9us?=
 =?us-ascii?Q?eRCyxFqb2j4QuIEnuaoJVwuJRPCsuLmfn95AP0VjpfzqqsDPa78iMkIDdVvd?=
 =?us-ascii?Q?UqTjI35QcC6VgorYEnyzPEoHtxOVKjniuHP/9sC34M4or/pZvl4t17EocD+1?=
 =?us-ascii?Q?dTZX9L5Nrela6Qk5Ul33CHbKzO4xM3Loe/CgBDsDPDNR4q157YTiUeYBuRKw?=
 =?us-ascii?Q?n5pmbKjISykQYjmM9rr41tUVVI5GeU2mtyyZVGHM59hWWlEWaVBLzZeFP5Qf?=
 =?us-ascii?Q?DRCOzwK9daMHiQTiD1RG08unuv843SFrzeAF3ZXGBttEnrFTroP5bwqIC3Ae?=
 =?us-ascii?Q?I1vygxz8PVm/PGbv/Iz2AsuiI50KADyJvQ1HHJDm6Ld9dWy7LdRykCsLRjGO?=
 =?us-ascii?Q?WDKVboJ6Y/Puyr5U4QkPu0LBtMWTuL2j/EgEPpXcYHbcgf83eLxj+orV1m0X?=
 =?us-ascii?Q?T85zEY51SVFVBj720kSGOWa4po2V083ll/2Q6uYKAclgUGE7DYpRelggNG1p?=
 =?us-ascii?Q?Y5GUNPIwIueZ6T1Clw/eHDqt/DF2Hc/rnri+lycy0x6pWrjXZyRveLcVpVUl?=
 =?us-ascii?Q?y4iy6iPBnoFNfMGRHIaUcZGVaFN+nk+BBPQrUAWEDyc4kk6U+mg5fA8+0qlY?=
 =?us-ascii?Q?hPiU7JMBusuRJOOgSEeaFxXub6Me/ZUfmtnyZKl1Klvoh6rrB1L8MkAHe4Rl?=
 =?us-ascii?Q?n+5s1lN7YO9k8uOrQni8SH5VfShtpaodd9tIv83+Ewy97VjWBQG7CZTvKz29?=
 =?us-ascii?Q?gBtF23gxlpI5LnUfk/WO4TeSSXvwzJn1cKUCdCRXQkPTOa9/LVuESXtaMGwH?=
 =?us-ascii?Q?2K53Tep4QUqJem9qL/ZPr7sDM/+URQo5Y/J1/4EqydhjXryghO/z92jOtDdc?=
 =?us-ascii?Q?k26e+dEcVts95Y8QAa8W+q+P71oo8M3nWBK9frLhBJ81/nhzlIb9ddrnRkbA?=
 =?us-ascii?Q?9aMwgkoX4Tuy6od3NpUa8h7v8hh9+39Li7yc0lOc5EDxGK925D9FM8klRVdZ?=
 =?us-ascii?Q?BjeY8AUwHOBQIZAS1uvURHdG1IeqQo9pihzgUfNysDgapyvS2Lq4mtaybGyH?=
 =?us-ascii?Q?t0JL0nrK9x1wL7dTL7gJYMGnbGHWH07Mk3Jlvp2SmdjrDRR0mA4hCizZBu7p?=
 =?us-ascii?Q?Ril3+EYeCr659tDgnrfJF+KoauPIebXsA6qINk5n5NRUp3it1DzqUrd4zRqp?=
 =?us-ascii?Q?lfdB77Cny1o95IJl4MFV90P/rpYCPG3w0BdsdL6lHXHk5vdgqu95DnVjqS2i?=
 =?us-ascii?Q?idn/IFSK5UFgP1ICbLF9iPUpAnPzFAqven2yXi6LEWVAbuUwlvRilkQHrf3h?=
 =?us-ascii?Q?kElowjbdeeeb8L71ZW89iqqZ6LPjLm08NQF4lysR1Z8ktyS2tb7CcYbDTNjM?=
 =?us-ascii?Q?aq+qGeWRT0QjJs/FbLjwHCxCK1Px5QfimSGD/ZEejhkpzs1tETKkcJn8pNUE?=
 =?us-ascii?Q?1HHHuW1lHQ3SPuTwLCqDdA0H/YkhHNT5286hb85Vx569x/xrLwasPIYwp0J3?=
 =?us-ascii?Q?XsiB0/zjiFtYtvIpiBw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c955c83-46ff-4ffc-6cbf-08dd983c3112
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 07:50:44.4840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXqdZjrcqAlCHkq7Zc4jU2eihmd4WyZBvkayLfmPlCMQBSLhmA/kqJ891OrRl/5ULy6w8knwnwzqBxfoD+a1vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8751

Hi Bartosz,

> Subject: RE: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
>=20
> > Subject: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
> >
>=20
> > ---
> > Another one signalled by the build bot. Peng: if you could go through
> > the other patches you sent and verify their dependencies are
> > satisfied, that would be awesome.
>=20
> I tried all configs under arch/arm/configs/, no error with this patch
> applied.
> I will give a check on other archs.

For other Kconfig entries, would you help add a patch to=20
select GPIOLIB_IRQCHIP for them all to avoid potential issue?

GPIO_TIMBERDALE: no configs select this entry
GPIO_BCM_KONA: multi_v7_defconfig has GPIOLIB_IRQCHIP in .config
GPIO_LPC18XX: lpc18xx_defconfig has GPIOLIB_IRQCHIP in .config
GPIO_XGENE: arm64 defconfig has GPIOLIB_IRQCHIP in .config
GPIO_GRGPIO: no configs select this entry

Thanks,
Peng

>=20
> Thanks,
> Peng
>=20
> >
> >  drivers/gpio/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
> > bbc71cdde9ed6..5bc31b56b5157 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -253,6 +253,7 @@ config GPIO_DAVINCI
> >  	tristate "TI Davinci/Keystone GPIO support"
> >  	default y if ARCH_DAVINCI
> >  	depends on ((ARM || ARM64) && (ARCH_DAVINCI ||
> ARCH_KEYSTONE ||
> > ARCH_K3)) || COMPILE_TEST
> > +	select GPIOLIB_IRQCHIP
> >  	help
> >  	  Say yes here to enable GPIO support for TI Davinci/Keystone
> SoCs.
> >
> > --
> > 2.48.1


