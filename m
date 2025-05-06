Return-Path: <linux-gpio+bounces-19641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5AAAB8B5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 08:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3BB47B16BE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 06:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14672299A9A;
	Tue,  6 May 2025 03:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A5+UhIXm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056B354E33;
	Tue,  6 May 2025 01:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746494031; cv=fail; b=rNBM0SdmJ05KxmFMnLmEVGJ2YiJDr778db2igIQ9D7TitvTMZ19ZqegBVtaXfKN4tQ3wnXuCKLNgqUs4oirhHCyhm9ll2UXEthnJnxMVKhpZ2HSFNB2e7bQvljPyxGsKshPn2k0uzGFGftI8H1QCj0XljrS6Nc70AK/rrkjzXNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746494031; c=relaxed/simple;
	bh=nxuNVSIvN1f319nWe6Lq8aepdS+jzFy5XFfcL9WmTQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IXTYy+HiVM6nFYsSFPyAPZd9jzopFThEbiIDcgI5N0zMYewAPED2edMk1ysTLnxSg5BJ6euREaxGkmiD4lvrXVSK9by7vAtJbeDYMbSMAKHo18trLrvWGGcIUaTRpK469MvNjJPDQ6emNwufgm1rR0dHoHIbyD39tufcSyv0xRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A5+UhIXm; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRu0SjskFm92RRlC1OpQZzY+yYVGz01JAAAXteJPNqV4xWlsEoWbwkV4mTJGNpQQvSTv8/oZXCekZw6+alBhXfeiAP/x5WImP6QddtgZnX4GjfIKUVls8RJovZh6NhaHtCOr7hZteOaB5d/IJkE5YPbwv4+7Jq3575mrtlDuAJ7MSLeWfJOzmLJCvG2omMp2m7YDLLKrC8S82hPZaX+iU2dKDEdgwt5WH6dg2s/DqfS6TpehtE0XDUkYX4nUHMhm8cPPpb7dZMSTns9FzwyBuk24+iHEpWHQtgK2ynGdCNI8JTNlbMML3ZMsjh6l+M4wwinyBlM5Z+knax6dsdeLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9Pxm4nsNLJac67Lf6TF2wDefTGF1IRaECg5T98TvPk=;
 b=PwShTLwgXtqPof3XkizkNNrtEFA2eocD6iPPeQ/TM7e+MwiW4bEQTnkwqRn0rxWCmzfNoDbp99IBEs2HoOOyR3LB9LNWfx72sPJKCHUacu2VJV+B4IqKOn1wXyCTnf+c8nEGEOCndwd+xkbjLmywK6VxzSpcG88N2kLNQqj2E8hFQcLiM/xfdjE8Gg62TCqM8eD6JG3jgi3FtogBCeZ8bH0hGxFKEpWQjrAGF1DU/QYDSDORE9zB6YHVSxfFQnD6dyT93WI2l4grBBytGR7Q6lNT30TypBbbva11rwPrBr89qak12R8NUMJcp8bUDgxrI/+IOuLHKh9+pnbGsEjmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9Pxm4nsNLJac67Lf6TF2wDefTGF1IRaECg5T98TvPk=;
 b=A5+UhIXmFDE2ClcWS6Nn6KpCetas7Aa/D9DH7S3b3hc2o/L0/YRtlGO6ZNRHUrDxazYW6xJDqcDj9qXMs8dviVyYZwZe1e+Mj9+zeEksfa8grXF/OJm19iCdrnV0iBtaHgcd6lepHLEdZ28VnxhpI/XUC4V2lfylllgXX2DhjDOAyjbx/4eGWMeCW94bHBDngZP5RLm3zbeez0HLBB+mAdbBJmTXVch4hx9ddVJEsBWTC/9704PpIPKSjGBQw/dvs4JR7dH3LZG7764clrVcO6XubtwI8DiXGtkSo7mP5gd6Fl7VpmmVLC+eRDtXle0juEbVvHS4I8xl+sB8aCjezQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8192.eurprd04.prod.outlook.com (2603:10a6:102:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 01:13:45 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.021; Tue, 6 May 2025
 01:13:45 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mark Brown <broonie@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2 2/9] ASoC: codec: cs42l56: Drop cs42l56.h
Thread-Topic: [PATCH v2 2/9] ASoC: codec: cs42l56: Drop cs42l56.h
Thread-Index: AQHbt+K6jmmCYrjQF0S1uVb38ZTFj7PEsIYAgAAnlPA=
Date: Tue, 6 May 2025 01:13:45 +0000
Message-ID:
 <PAXPR04MB845926B5081C254179088BA788892@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
 <20250428-csl42x-v2-2-e8056313968f@nxp.com>
 <aBlAys_SvQRHNTcp@finisterre.sirena.org.uk>
In-Reply-To: <aBlAys_SvQRHNTcp@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8192:EE_
x-ms-office365-filtering-correlation-id: 24dca383-a124-4581-04d6-08dd8c3b3f96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f1sToaCfgErpqTeJVNJPRT4cdDqeLvYHdFwB+B9u9RG2Mr74U80S47k/1Qq3?=
 =?us-ascii?Q?E6vZN/UJT/58Z/cbN1Zz1KpZZXkQvafw3PrJThvFpXhmPfJYQW+1ZXtXnAX6?=
 =?us-ascii?Q?qSluAz6eUtlngUztJ+qi2WS/tGxq6Dht42GustzyIn7G8/3xQqKniZZV3FbV?=
 =?us-ascii?Q?tBiBAxT7gSMo/Svpv85FRVhSqMZJUA/tBYBEk27ndz221a01MXwInM6HZHdD?=
 =?us-ascii?Q?V8+I/yONJYZiJmFOKyc1hlIybQBGXiRyXozalxwHewp9DCdZXrXgAO0LBqq+?=
 =?us-ascii?Q?28afHZSqeSyx7mPZvL+vIsbKDgH7FUxJR9mn7wsLxx/DCNQ9W8HfM563Toq4?=
 =?us-ascii?Q?aGKaR3X2JhKXQ//7SNgkpLg+lDN5a/gLkLSoOe8zaKYsZbdfc54C1lsQBbs2?=
 =?us-ascii?Q?Y0y+kN8IHpvPbxCAyfK99Kc1NYh/zf+74h/PSt1pG5yWzXQoKkfWa7cXU1n0?=
 =?us-ascii?Q?G0f1pSDMGS50tEng6kprpFmyvVKo3z9qcmLjzZm05aXHWEAujsezkIyqgMnN?=
 =?us-ascii?Q?N0TOG6pkqB01rtAePBX5dsTMDnoZOiWyV5vRLtd/PD37US9qoabiy/+9Vals?=
 =?us-ascii?Q?5SsO7T7znCRuagGZY4rE1YhBlCteAn2WmXw01N+jswHnqRVYScYS8XQWzTSw?=
 =?us-ascii?Q?V9wEhOyciFEDon5o1WDjvBAi4WuZCxIY1JOZMpOgc3V9Dk9Yr3XAjXXz/512?=
 =?us-ascii?Q?LGxHhQcwQhh9UVUSikZZZRzwiThJpEw3WaPF/FiFNYDV1ZjSkq3G9GafDWbP?=
 =?us-ascii?Q?WwmzXyi0SfY4fZDsf+6kb0A+qzhshDoeVziHpcxmZIyg3C8tBV+JYDA3kXCc?=
 =?us-ascii?Q?LiJHPkQ3tC/FBzBOGW2jsH+3C5qqaruLewUUvZBPRnjGlvBIpv9r3sCV2cvb?=
 =?us-ascii?Q?CBiKhp3mnQGUwCVjWPQKJRgxqgIWLubR3uF/GMRKyKA20ZkQFCuckiDamLGc?=
 =?us-ascii?Q?5hFeBY9E4B4o9sC2hxwHCEBek63MdoQLeYGHRSVbWFfZlZjEggveByrtNAnS?=
 =?us-ascii?Q?1Cq8/hvcpjS3Uwq7jc+3IEtFyPn1ZS3ldV/Z9dRfhmICPSKcRT7F+pdHO3eT?=
 =?us-ascii?Q?m4F42SQfqfXeReVTR8ajGrQMvlQZGgnrHnywE6B6VxUd+KBFLa3S9jVHlDuf?=
 =?us-ascii?Q?ytTMdwPpCK40PXMxMy2alpcec8QG5AFqlVTk7G87KUeSexNdpxyiPurrqLLt?=
 =?us-ascii?Q?omxyHkEZcs9IlsJZ6HuhvE6zlWbu+yxfWJ25fRl04IzHA6gCzy1R4pMlD8oS?=
 =?us-ascii?Q?62OKf7n4kIcta/mb/LEeVYeUnlV7BcwyNZt2pRoOv69kuqupbCU0SH+J1WVN?=
 =?us-ascii?Q?wY1xreV8oEVpd+xLvsARpHOTuftqie09ZhAPX+cf5nQPqpDaT5F81CthDMie?=
 =?us-ascii?Q?DUqIu+xLy535/z4/Q/b3aD8v9gbUB+I+kqp2Z5PWUMqoB+sEYuHk4k/PxYJQ?=
 =?us-ascii?Q?9HnFCZFZ/AuVkkqlL0MVZwTeyX0pqBA2gderteiyENt2C2LhhN3Mnw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S2EUhhz36hReEHe6ZgsQSh1ZcTIa9Spg3Q9HSxc8lUiGJv+XRaMEefylyrOH?=
 =?us-ascii?Q?hZQOwap545zQsffAcB7WeGziRPA233pDvUzXDRTQlEs9nD5nGnqPQvbJli/X?=
 =?us-ascii?Q?tp9BI993/WQ9BN2xr2JZF1HYnwQUrDIXpztoM1YBerFl1taP0EM7eN9Dr1M9?=
 =?us-ascii?Q?F5ovP7VjntIR9SejebSqD82jidvk7Wk0u77mIl4k4ltYbHNaPr/PAYKbkBtG?=
 =?us-ascii?Q?Byp7Z4QdfzpzqWIavzU0XJVWw3FUMTH6Ld7cwLMBy5MnRk4xwR9qcIsquuw8?=
 =?us-ascii?Q?9PupVFM76pyywRd6HyvBkA2KOGV3lnh+Rb9GtwoaCiORRZ0VwjuWcL0tPxN5?=
 =?us-ascii?Q?ox1/DxlNcSOlOS7Xig1FH4wqRY5Dij0xlcmv4pGFcO3vt5mTUIIVL72CLmom?=
 =?us-ascii?Q?MbVhc5Ng3Ir/y0p3D8ChoTQO5wGUlbgo657N/B8JvtK5ixK4qvC72XerUpwn?=
 =?us-ascii?Q?fuiR5wR1eAd6vb/0m3S5qwmTzYtS5b24+YSNqOttcJccd/qMGF0xQnNsaudO?=
 =?us-ascii?Q?o+bovRuBL9atQGbdYE7sEkZPc1rVqPf6iK0bVKcUwjSCns2Bmop7i3NwWZx1?=
 =?us-ascii?Q?XpTylLFf7+avZ/FLODQi+kBvKxAAl7FrcHqXIB7GM9N+PTBGVOJ+4ZKtsb2K?=
 =?us-ascii?Q?07La5ZNadzRpbyjbL0vD4A6avuZHZ48r7Ka3zUqLuJ3Y3BgXS8LDjEiK3UuA?=
 =?us-ascii?Q?r9KJfIH4nfiQTyuLwH6rJyFISawky9i7KG3h8/dVrhWZe+zZRgyvHO2Tmscx?=
 =?us-ascii?Q?KCbWMmcTI9mvGgj1u29iJjcpI8LpuDBq1ic9BQ8+oNcdwoZ9ybrljv6ngeV6?=
 =?us-ascii?Q?SXSjCKGStQQeq3Y+HJwIdCk6pbBvkNWAlqNHxI7qOdhYB2M7nZ7oTFpbm9rl?=
 =?us-ascii?Q?9c2CvAYcuKERNFtnZvA1t4+jWjVk/KI4BCAL5OzH3ZT6s6WoRXA+221tJj5r?=
 =?us-ascii?Q?gAEDV03BGCufE7dBqkRV401RPh6dwgHarJSpmUS+/4CUQ3uQ8WQd64Jj7x5e?=
 =?us-ascii?Q?fPy2y9j6r+Kqcs/VjeHhsXGLz4jN8ojVLJXZWRPQuZHA3BKkMroB1Oq0+rOS?=
 =?us-ascii?Q?etBxrfbkMMcH3BHrCBbCdbArBk27XZK5pMuOks8pfIa2etvs1kdqv8a08mXI?=
 =?us-ascii?Q?Dh0TlfConjHzWSHRCxNuwlkWASBgRLqjk2eVe5Xfw4DAYsrItR53Wbr6GZRq?=
 =?us-ascii?Q?ntlsk2GLEHK7dXM3V9PWgSYmXJTyAKgQBwqRmWfokCwcwtMERHS1XsXhz1su?=
 =?us-ascii?Q?A0GZWrtRn4tY+BOfb6fuxOy/tVvY9Fx2QXwtZzkia2r00TxoEXinc4UOOCK/?=
 =?us-ascii?Q?gqbAK10mnlMDn+CTGtrPWSyRk4Y+B45ygD7msB0Eg+cvo6lGLJEl4AVF1f1p?=
 =?us-ascii?Q?6i6aBJi336JGXndqt0y8oZs6n9gpxG8EksCQMoUd62LLOCsAJuncz8WufZUL?=
 =?us-ascii?Q?l07F9tSpgRLcDQRZS3Im7QeXNi/86Ndq1dn/AS4gWhbfLI+7wxh1ublymp2W?=
 =?us-ascii?Q?rgk/ju0aly43BoE2g6xclL4PTMQclwrUFgR8zIzJfbASnLZG8QGwPPuVXAaN?=
 =?us-ascii?Q?xZwOHt3fp9aKVogy0Sg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dca383-a124-4581-04d6-08dd8c3b3f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 01:13:45.3936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZenH74mVpnsBkG3UDe0K7DCyzJlCw/hXIG6ZG8w/cdOLQyrZeS6UKcS1NmP31LoBTO/ZiXTUi00eA1jfa+qZBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8192

> Subject: Re: [PATCH v2 2/9] ASoC: codec: cs42l56: Drop cs42l56.h
>=20
> On Mon, Apr 28, 2025 at 10:09:03AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > There is no in-tree user of "include/sound/cs42l56.h", so move 'struct
> > cs42l56_platform_data' to cs42l56.c and remove the header file.
> > And platform data is mostly for platforms that create devices non
> > using device tree. CS42L56 is a discontinued product, there is less
> > possibility that new users will use legacy method to create devices.
> > So drop cs42l56.h to prepare using GPIOD API.
>=20
> This breaks an x86 allmodconfig build:
>=20
> /build/stage/linux/sound/soc/codecs/cs42l56.c:26:10: fatal error:
> 'sound/cs42l56.h' file not found
>    26 | #include <sound/cs42l56.h>
>       |          ^~~~~~~~~~~~~~~~~
> 1 error generated.

Oops. This line was removed in patch 3, but it should be removed
in this patch 2.

I will fix this in V3.

Thanks,
Peng


