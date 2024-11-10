Return-Path: <linux-gpio+bounces-12775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA909C314B
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28CD1F212C0
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB14C14F9E7;
	Sun, 10 Nov 2024 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CDwnWPIm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD91043179;
	Sun, 10 Nov 2024 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731227567; cv=fail; b=EZzkeOiBRrtubimp0vuCwljt8JPzQGZB+Yk8MBSCnsEaeOokfR/Ix+GBfzZvVuhegLDyeCu271RBUaLfxbxrWdfaucinMNrytmrvz86Ju7Ob0FUsH5X/8DUhn/hs7h4IYHRKi78R2vJuytPyJx+UoJyFgu4gMr1ANebcobAmZC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731227567; c=relaxed/simple;
	bh=NsAmWkiejqvAJWeVO/LgBGE7lHugcY2V+3Phi2DjZEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vABG3rz8aao+8ZIWG6RzGEyUsTYxyTFiLVSs3UDtanULQjD5/HcQiG5JI12axjDKUtv1NxyZQav8UvIVvVAtHv4QhWjuzdvlc8y0+JNTTEEYmctUvHr2bn7Xqojng4ePpDAzvS/7DnM+E/MLD8MX7fXBAqSQA5JrNMEMZdcyt2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CDwnWPIm; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCIvv7A8wc5dXXLQtA1FAFvAo22NH+6xvQRww3nT4uWLehOqtRbKQcPCKKVX+0n4W1jv7fwFUszyz1udY42mMz1unoAAEoOkw0XN8RSWRhHeFASfSvu4y2eYihCXJ/MPCoVFgCBnOBgYC9rgYL/U3AW+4KPqOepqdN19eMcznNDrlkY7Ti3vDgsKQod9ygDVq5wJKMHw32QBQRJxm9/YQNXUsnDCX9Zm72ULUdP8jJFLc+nqvKuHvhtqJBvzzsmFTRqjnYWXLftAt67UyMM5K6MF3qYEcx1S/P57fZIdDFiLe1Iaa2HQ9lR+CsyuMPYNxIw6rKqzw1l08UnBDOn91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FESc3diMBr5GSEy0Ft+biyTgVTdAXbcK9SfK8KhWaoM=;
 b=Pbe4dyZZz/beEM6CwYC98mlZPkv43baj1Tcm6BmF4CPBaqXMCYwGcr5HY4HHPafD/+P9prnS8yQ2O/E6CA8zxXjehz4WRoqOK/Ogg5NVxQlFLUhaQlcsStPUKVweHqmiPrhuvFZoJnwd0czcpCpagqc2Es1lW3STIxXiCtVyL1C5UTfUIbN0NHmINHixlvh7Pa5rARIP0PD9h87ZWuOTHnaiQWSE+8Zsdh5gT5abSoLlWxyLklbcEvamA6Kk24UArvzirU8BzPcq1S2Dc+fLb3RyKuMwflAksj1B3MHeMu8iZDNzOAw9KuYLMnUu/lCOvCm7aJ99bPA0vKB2MlEiQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FESc3diMBr5GSEy0Ft+biyTgVTdAXbcK9SfK8KhWaoM=;
 b=CDwnWPIm2yQ8M79MlpsBS6reojEmfNWULG/0Ajn8UVN8zfR9P1c2AIOdE2rO7qnZi4kAL3FHjEJ3FtJxuKAKARTrpXPiqILqHrLusgAQ2gQVYso+N6sYGsAlNMUPyxAM6DbqRf7ebjvgWeFF7GQbe7uT3p/63dhpXPwLB6IQr/g=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB8807.jpnprd01.prod.outlook.com (2603:1096:400:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 08:32:42 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:32:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 02/25] clk: versaclock3: Prepare for the addition of
 5L35023 device
Thread-Topic: [PATCH v2 02/25] clk: versaclock3: Prepare for the addition of
 5L35023 device
Thread-Index: AQHbMcwBj2vCXj43UE6BzezcG0a9+bKwMndw
Date: Sun, 10 Nov 2024 08:32:42 +0000
Message-ID:
 <TYCPR01MB11332348A8594AE1BA7B2A91A865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-3-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB8807:EE_
x-ms-office365-filtering-correlation-id: c9c17ea8-6ebd-44dd-6982-08dd01623ead
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cg+DKIQgJB7/1e6VWqRCbDcyBrp2QAw8h76NnM/RkE3XJksNxYe5IaZEdZEM?=
 =?us-ascii?Q?q8hwLGThSfR0udZc94BAX7m64fs0JiCKMdOdM1goqdiB/5vfRH2Pe2HQl3Kt?=
 =?us-ascii?Q?YZTsGLUK2Z5bfIZhZHo6iMQhbMLCujyK8r4Y/AuftfyqjsPFb6a7BfDJj4BO?=
 =?us-ascii?Q?uqF0a1DYOwTfzm9vomi7H45eXhZSRcNIwM4TfqK5viRgaBp2mOqiTK2MPx50?=
 =?us-ascii?Q?QOug08uzFIi+Uz+MpYnTYtXztFI+aEK5fd0GhGQekenBaTY9pqTrCz0HQykh?=
 =?us-ascii?Q?bwcb5dhcMp5lTXsOReitjdtmDRAHazH5Vjmu84+oxfrdyyD0hNAOYt2IDlmK?=
 =?us-ascii?Q?xisXUryMzNHeIZcJpYwaMH+/NHnWeLan5+ByEsZhCHbT35CtdyAdGLZy/y0P?=
 =?us-ascii?Q?vxYK51BmHSvoR7Hcbn0wzNvGLxpS3C/04PMFTFRc9RiCfXnlmDizwyOwGWcy?=
 =?us-ascii?Q?wpqvDQTxrZpYXL6ZzID6RwLE4nlwS0/qSQXrpPRSawQ26bVWwkdilye6XN2u?=
 =?us-ascii?Q?8/4u0pmsjnoG9eTEJFXNdBAJaL4kROdp3xCa+ZSL7zZ1oVmArzHfi5Nwo6/6?=
 =?us-ascii?Q?uCw8QtIjQpceTTRcDhCglUJKs4sfsANm7pf6PLOnE7Lk3bAJX1tzqpRq7ztz?=
 =?us-ascii?Q?UXaKTJV9gqpAeSgg+HQUkfOor+LcYjbuON0UZ/UE5zzcvob/+fmQdhsAq/c0?=
 =?us-ascii?Q?I7qr49ykgyy+UmJxb+HcoGFPel5hbqJWt+EfUELs5SlLQBYqsxDPLOwJVQUj?=
 =?us-ascii?Q?R5Cd6/0oMz2ECT8z022ptyQdjYQGUuCPMzZZzGyLbfz/m7/xIUISFDyFS2ro?=
 =?us-ascii?Q?2QBAzvzNc+ZieQHTyyXpBKaXtOeDQABRKgODE5JKk/sPzD/2lV0Y+BoUKr+E?=
 =?us-ascii?Q?Qs7c1d9/XhdkbPaMkd9et61O107hHMmfAF7HAFA+paSDjESvUITZvlucN5p8?=
 =?us-ascii?Q?oKqwhDLxJBYi0RXd5tI4ehk2wUvmBtQVoQVdUHBBQB9I36WnTFBEkq2iOx07?=
 =?us-ascii?Q?OaWw83oUyifn3JhUYd2dHqBoJBFNn4MyM9BBfCxVDpRZ1cb0m5s1OE6rgAu+?=
 =?us-ascii?Q?jsBL75A13I+NJO6POk7PvHAUYWGJkUC5WRL+qq2mR5IM8/o/Njbvufvu+S/v?=
 =?us-ascii?Q?tKu2Sqy6oNoypsMisyw90xj350gPZiX/Gf2iYjuHyA4r7kymSEx7urdFx0VS?=
 =?us-ascii?Q?wmV1NXpmBp8RPIRpdifCptb+I7iYdaAZ9roxRtYa5jJFX1WShyRK7pxOZH10?=
 =?us-ascii?Q?Qh921g1OXQFGOAUYDTu+F1B/Shmg6C2Nj/dJ4dgJFuIORrqe67uA3pRJhjy1?=
 =?us-ascii?Q?UDzVhPdYF7yAtEZgGfwiGcl6wGXS0A2m/KWNFKygotllOHKVpiGcKnYDfCbv?=
 =?us-ascii?Q?XHEJWxsoTFlnwc3RK9MhN2KkdS1Z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2Z6T9a7rZyugovTXlATJn8WCRA4lFvcySLo3vY1TVGt4Ps+iMWMvkeObKPdt?=
 =?us-ascii?Q?fogrvpDwiDFUU6OEoOCQdMb4Gry7JLwGLu0bsbZejmZjzGxxGHQt2DcdoVBW?=
 =?us-ascii?Q?mvVJoiHCvWnYh6g5raSSoM/+7ucYPcVH4FUrD7tdWhO84V3mcrl+3/tIKgpV?=
 =?us-ascii?Q?mkvjb9xHJMfG37pA5U418333C0uFLF4YVfT2G9wUmbc+Xbzv1xltY00D3b54?=
 =?us-ascii?Q?6piap6oAvLljdb233gS1WcsHW2PwWUsMUu2rXkItkSSf8aWael1OvmR37Tj/?=
 =?us-ascii?Q?SsDbEWmax4YUDYeDJ5/e49GMAP3KnH/zfGvuXuu54vAN1Dodxzvwleu+za6V?=
 =?us-ascii?Q?IP9asfQXRNF9vxtRn+oYWIJ2way+qHM9id3tlwrKrZHYQaamDruWOsZYZ8SK?=
 =?us-ascii?Q?9/5ZsWQKVIuWN5K6YB5Ecmii6D9oFjoumEW730kBmDnxRQLX7YZxK/PKQ73/?=
 =?us-ascii?Q?xr0ETGCFqOmPDB7eqdVWSs3AneF/ODi9PLtu8oYvIh+AQtF4eya6IoWrQiD+?=
 =?us-ascii?Q?uGdJGtTCfL0ggyEkI4uNLDcybwx1ucn3A8RUL6mmolfPxpMftsPAGY5/WX4/?=
 =?us-ascii?Q?/GLBS52sQtldwXuiAEjcP3msiQTRXoSxI745yRagLDrrCz23Q/LZowN0vYGS?=
 =?us-ascii?Q?Gnjb7QHrN4Iv4aSOrEG9UrrIPeqmhePrqUu/jQhnX+g5AWaK9TX4jWvglMPM?=
 =?us-ascii?Q?6tCP24hQ9pSPForfS2Xlw8M1ba23dZhTiSkduVnPHY+Ko+gBqbXwbM3Gb7ZB?=
 =?us-ascii?Q?e5YxE4OVRMzAQqIMLKbTLR/G2cAJJElnJd6Du7LlCsRRUILhzblucrKySwUL?=
 =?us-ascii?Q?+NpTMTvrZwg7r4UmyA1hawynVQ/TfkKfS3s6y9Tl5/tOutZFeI7Ep5qdS+C4?=
 =?us-ascii?Q?OdWsYGsl6KJI0h7/VyFrXs3UXB4EnLGw7s9GT4DvxG7dXj60A/GAAa1RQqbI?=
 =?us-ascii?Q?aMUJZ627foG4Xy2n79DaKkcbLMW+N2YWFWnLrCS8UZSfmqCpfOR0Vhd1vwDa?=
 =?us-ascii?Q?gJxKry0zIM21TE27UP/r1ucxHmF13SyBpHb8h3zPur13RQYWEvmJqpdXnd1j?=
 =?us-ascii?Q?xFNg2MveYtx7/BL54bawbDH9PWIm9AB6mKlxCjoVFtSZtpCBpi2MYno/Au65?=
 =?us-ascii?Q?em6J0UZL5v8x7JqdwEDBblyWU3mjyrpdaF10wOxctqCAlLZ1b/pYBubbSCuM?=
 =?us-ascii?Q?kdZESfY+xL6ajHqEajHrGVhU33XqfBEUQExpMjzlsZCw6NGUmlh+gSRag3SB?=
 =?us-ascii?Q?lrMOXoBScxiwdoOSwGKEnXRVzkBHV77g1fUDEy0E0Xd/F5SpgWmBfa8GY/IP?=
 =?us-ascii?Q?nydYUGkvYWqwXpM3R8j8OahmIlLqPHeTtA4ITTNEnT1ifDf5EhcCmkWpq+wX?=
 =?us-ascii?Q?xKenNBb42p+nWomaMEoa+AaA+aEMA6bNn3TgCM6pJoF292bMLstwOmqvWe2J?=
 =?us-ascii?Q?2OQJhRa1RA3pdJ9uex8V4ZZdjOsIRKIlu+decxrWTUj/8MY3SPXBWhZ3io0b?=
 =?us-ascii?Q?ynQD+FMYjKKp5DbRlt+ks6BwvJ7zgtjiJYJfCXV5+iqKUjROcUim7jmx6VL7?=
 =?us-ascii?Q?gH4xZXQqVwp1gjD9kH96YUs2//TQsH93yFjuT6fv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c17ea8-6ebd-44dd-6982-08dd01623ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:32:42.6300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqOu9cMxGHO0HYie+wVXZaSfn02UvZJcZnOy7ip0RKgsA1nrjkLRmjhlY/pIvakZUwzJRISagSKx6Ar1fQQHUkgiiQrBOMj7/tYW3EEeE/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8807

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> Subject: [PATCH v2 02/25] clk: versaclock3: Prepare for the addition of 5=
L35023 device
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The 5P35023 and 5L35035 Versa 3 clock generator variants are different bu=
t the versaclock3 driver
> could be used with small adjustments. The features that are implemented i=
n driver and differs b/w
> variants are the PLL2 Fvco and clock sel bit for SE2 clock. Adjust the dr=
iver to prepare for the
> addition of 5L35023 device.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>=20
> Changes in v2:
> - none
>=20
>  drivers/clk/clk-versaclock3.c | 61 ++++++++++++++++++++++++-----------
>  1 file changed, 43 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.=
c index
> 76d7ea1964c3..1398d16df5d0 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -78,9 +78,6 @@
>  #define VC3_PLL1_VCO_MIN		300000000UL
>  #define VC3_PLL1_VCO_MAX		600000000UL
>=20
> -#define VC3_PLL2_VCO_MIN		400000000UL
> -#define VC3_PLL2_VCO_MAX		1200000000UL
> -
>  #define VC3_PLL3_VCO_MIN		300000000UL
>  #define VC3_PLL3_VCO_MAX		800000000UL
>=20
> @@ -147,9 +144,13 @@ struct vc3_pfd_data {
>  	u8 mdiv2_bitmsk;
>  };
>=20
> +struct vc3_vco {
> +	unsigned long min;
> +	unsigned long max;
> +};
> +
>  struct vc3_pll_data {
> -	unsigned long vco_min;
> -	unsigned long vco_max;
> +	struct vc3_vco vco;
>  	u8 num;
>  	u8 int_div_msb_offs;
>  	u8 int_div_lsb_offs;
> @@ -166,12 +167,17 @@ struct vc3_div_data {  struct vc3_hw_data {
>  	struct clk_hw hw;
>  	struct regmap *regmap;
> -	const void *data;
> +	void *data;
>=20
>  	u32 div_int;
>  	u32 div_frc;
>  };
>=20
> +struct vc3_hw_cfg {
> +	struct vc3_vco pll2_vco;
> +	u32 se2_clk_sel_msk;
> +};
> +
>  static const struct clk_div_table div1_divs[] =3D {
>  	{ .val =3D 0, .div =3D 1, }, { .val =3D 1, .div =3D 4, },
>  	{ .val =3D 2, .div =3D 5, }, { .val =3D 3, .div =3D 6, }, @@ -386,10 +3=
92,10 @@ static long
> vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	const struct vc3_pll_data *pll =3D vc3->data;
>  	u64 div_frc;
>=20
> -	if (rate < pll->vco_min)
> -		rate =3D pll->vco_min;
> -	if (rate > pll->vco_max)
> -		rate =3D pll->vco_max;
> +	if (rate < pll->vco.min)
> +		rate =3D pll->vco.min;
> +	if (rate > pll->vco.max)
> +		rate =3D pll->vco.max;
>=20
>  	vc3->div_int =3D rate / *parent_rate;
>=20
> @@ -680,8 +686,10 @@ static struct vc3_hw_data clk_pll[] =3D {
>  			.num =3D VC3_PLL1,
>  			.int_div_msb_offs =3D VC3_PLL1_LOOP_FILTER_N_DIV_MSB,
>  			.int_div_lsb_offs =3D VC3_PLL1_VCO_N_DIVIDER,
> -			.vco_min =3D VC3_PLL1_VCO_MIN,
> -			.vco_max =3D VC3_PLL1_VCO_MAX
> +			.vco =3D {
> +				.min =3D VC3_PLL1_VCO_MIN,
> +				.max =3D VC3_PLL1_VCO_MAX
> +			}
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "pll1",
> @@ -698,8 +706,6 @@ static struct vc3_hw_data clk_pll[] =3D {
>  			.num =3D VC3_PLL2,
>  			.int_div_msb_offs =3D VC3_PLL2_FB_INT_DIV_MSB,
>  			.int_div_lsb_offs =3D VC3_PLL2_FB_INT_DIV_LSB,
> -			.vco_min =3D VC3_PLL2_VCO_MIN,
> -			.vco_max =3D VC3_PLL2_VCO_MAX
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "pll2",
> @@ -716,8 +722,10 @@ static struct vc3_hw_data clk_pll[] =3D {
>  			.num =3D VC3_PLL3,
>  			.int_div_msb_offs =3D VC3_PLL3_LOOP_FILTER_N_DIV_MSB,
>  			.int_div_lsb_offs =3D VC3_PLL3_N_DIVIDER,
> -			.vco_min =3D VC3_PLL3_VCO_MIN,
> -			.vco_max =3D VC3_PLL3_VCO_MAX
> +			.vco =3D {
> +				.min =3D VC3_PLL3_VCO_MIN,
> +				.max =3D VC3_PLL3_VCO_MAX
> +			}
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "pll3",
> @@ -901,7 +909,6 @@ static struct vc3_hw_data clk_mux[] =3D {
>  	[VC3_SE2_MUX] =3D {
>  		.data =3D &(struct vc3_clk_data) {
>  			.offs =3D VC3_SE2_CTRL_REG0,
> -			.bitmsk =3D VC3_SE2_CTRL_REG0_SE2_CLK_SEL
>  		},
>  		.hw.init =3D &(struct clk_init_data) {
>  			.name =3D "se2_mux",
> @@ -982,6 +989,7 @@ static int vc3_probe(struct i2c_client *client)  {
>  	struct device *dev =3D &client->dev;
>  	u8 settings[NUM_CONFIG_REGISTERS];
> +	const struct vc3_hw_cfg *data;
>  	struct regmap *regmap;
>  	const char *name;
>  	int ret, i;
> @@ -1029,9 +1037,16 @@ static int vc3_probe(struct i2c_client *client)
>  					     clk_pfd[i].hw.init->name);
>  	}
>=20
> +	data =3D i2c_get_match_data(client);
> +
>  	/* Register pll's */
>  	for (i =3D 0; i < ARRAY_SIZE(clk_pll); i++) {
>  		clk_pll[i].regmap =3D regmap;
> +		if (i =3D=3D VC3_PLL2) {
> +			struct vc3_pll_data *pll_data =3D clk_pll[i].data;
> +
> +			pll_data->vco =3D data->pll2_vco;
> +		}
>  		ret =3D devm_clk_hw_register(dev, &clk_pll[i].hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "%s failed\n", @@ -1059,6 +1074,11 @@ =
static int
> vc3_probe(struct i2c_client *client)
>  	/* Register clk muxes */
>  	for (i =3D 0; i < ARRAY_SIZE(clk_mux); i++) {
>  		clk_mux[i].regmap =3D regmap;
> +		if (i =3D=3D VC3_SE2_MUX) {
> +			struct vc3_clk_data *clk_data =3D clk_mux[i].data;
> +
> +			clk_data->bitmsk =3D data->se2_clk_sel_msk;
> +		}
>  		ret =3D devm_clk_hw_register(dev, &clk_mux[i].hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "%s failed\n", @@ -1108,8 +1128,13 @@ =
static int
> vc3_probe(struct i2c_client *client)
>  	return ret;
>  }
>=20
> +static const struct vc3_hw_cfg vc3_5p =3D {
> +	.pll2_vco =3D { .min =3D 400000000UL, .max =3D 1200000000UL },
> +	.se2_clk_sel_msk =3D BIT(6),
> +};
> +
>  static const struct of_device_id dev_ids[] =3D {
> -	{ .compatible =3D "renesas,5p35023" },
> +	{ .compatible =3D "renesas,5p35023", .data =3D &vc3_5p },
>  	{ /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dev_ids);
> --
> 2.39.2


