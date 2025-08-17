Return-Path: <linux-gpio+bounces-24465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED018B292EB
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 14:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B912F200A13
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 12:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21190229B12;
	Sun, 17 Aug 2025 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G6UL9Rmw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE321DB127;
	Sun, 17 Aug 2025 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755432378; cv=fail; b=C6EMny3iU6EiJxNOMV0KD7x+G5BBniF9dd3DiZAB7qgS8b6jc3Ens8NzRgkL1tL69Tpu+ACW4qx6eSLQgD94BbW+dxNsOegdAKdGrAqNOXuNfD5easiKQQJDamKNESyJN5D+KcbPuyUDqdBsECxi9Lm8XDeOudpjvozcfcQfBPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755432378; c=relaxed/simple;
	bh=LP8Zo0nBPU6DuwKNWBZ7loOkrfrCFisWFgNPSPcWwnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pFE+zLANMerRyiSkvBNQoYp4fYCMJ2hWXPKn3urHB3IPdNv4wq8M0r2Jk6TeoI+AhLjHr1uTH6k1LI9XKmwnvTWAm4XBoaIGfL1a8LmXgY1balbg+GKVmpsmjUFXDkaLlqF6HpJ4mxYmVYvsk1SUV7lHuO68ZbjyW8MpZWaT4hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G6UL9Rmw; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llgtEIuZUHj3L29Ft7/U4fiSpXMO7IQvoxjgWE/y1oyPBNP6hVJ0QA7LfXIe0uArL1OSSOHuSSgCyFcB+x9jsdWq3gzHy1uTdo7utJ+V78QeYjWGYKY5u0xirp8nYcosK9iXn2Hquw76gJzJIWaBuaHmsBsTV5rmbpPHlmQm1wDn+hIxU0z9mpgZKiftlG0zdTjO+cPhAAYnx8L0gsOIf5Cltyin0MctWcTH/mWDOGNYvOYsFB3U2ZZyIavECmw4DfjuCj9c/eKxnYAUBoiCj/LAfCQhuxkaJJ1Wsu4v/yRuyDBNGI5AAJkFutoSEFDt/VoJ/f1YhiK1XKrXyroiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr4IkCR4Jg5qMRb/BKTMSC1MsxI0EjY7KTp6jj0qvrQ=;
 b=HEvAbLNrFW+mG7UGs1E3+6CyByQYCy9dYRgnGBDpDtf9TVofOJpGrfaXLcdHRaNkEUyj+U1NlOjQ5ukKjmk9qP1Z725lRmQIspXT5Ssb4T3GC9oWK/aAjzdn4VgaYtJHhJEErXqOdSNpWwlTKD5kDJH4/H6kE9kMGjY0Vjty9u1svoUD9QRKJOpnwfwgXxacDxeCvOOLxg2PXo/OxwKmXlvzIGWLwlfGCPFRbkqBcMIGiGlYd00uU9qaJ71/J3n+EOKQ7E5faPuyrVIk6px0KLc/gfvt+szVA8uLTba9CX6feV4AfYPFJwn/JNgrD+WASkf2AF9QQsvBtwKSe9t6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr4IkCR4Jg5qMRb/BKTMSC1MsxI0EjY7KTp6jj0qvrQ=;
 b=G6UL9RmwtyLDT5o5Cveb/jrhxkbQTHytUFj3lO9ZxrXOra5BfNjVYDsduNnySxMU2uDRzkdbeCxF6lfEbdg5Lpz/tzyJ5Kc9AlcdNy2iM+ukfi4L4FTvEpbsgS9yQUVVX6wLH5meoJNKv/QHbS0Q36ZatY5gaXjjfKUt6DV1ZwM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12158.jpnprd01.prod.outlook.com (2603:1096:405:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sun, 17 Aug
 2025 12:06:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.023; Sun, 17 Aug 2025
 12:06:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 2/2] pinctrl: renesas: rzg2l: Don't reconfigure the pin if
 it is same as reset values
Thread-Topic: [PATCH 2/2] pinctrl: renesas: rzg2l: Don't reconfigure the pin
 if it is same as reset values
Thread-Index: AQHcDfOaLXzGkXUWrkimgxkRhOv4LrRmwk3g
Date: Sun, 17 Aug 2025 12:06:06 +0000
Message-ID:
 <TY3PR01MB113461793362E7286253037468636A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250815144749.143832-1-biju.das.jz@bp.renesas.com>
 <20250815144749.143832-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250815144749.143832-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12158:EE_
x-ms-office365-filtering-correlation-id: 76088824-7e69-41ba-a71e-08dddd8671d1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZrFSEidhRjXTmfPBYoLRM22H/njM80a3lFDK1i1TqR72vpx/WKllX8/EWngJ?=
 =?us-ascii?Q?9xYevzR1uUSDbfAvvcZRn4uYjzWSGs9wvt1oEnZ8/QFUc+Tl9EkHaHuxgjoY?=
 =?us-ascii?Q?9cmaA473M576MTd1+vg6YhIKltbPmBxokW8cbvso9pxS5F+OA3M/MWBuTyI9?=
 =?us-ascii?Q?vJMH2MihVH4I6//S7lvlXjJp5HgA871bHHY7vcu95dq279+pNxsKY9EUna47?=
 =?us-ascii?Q?nFnazotaLbFizs3qy/9Zrx+fG+YeJiZTi+ErEJKVUo8ni+cF+YRosxHvM5zL?=
 =?us-ascii?Q?kxUjTH0jkhRrjrx+DfNUYRqPZAFvqj5w9hams+rxgDc9YqIPSdByB0VUtaqP?=
 =?us-ascii?Q?tO2nmXkFPMOrlTrdg44EI7ofni7GJt36XtAyVScQ3W4dnmOGCVcusgxISwL6?=
 =?us-ascii?Q?gxxsTljvNDSTQP0N+S3M69nvwj5V9UURStmj6TRUUOA//MhHzNn1cNrfESho?=
 =?us-ascii?Q?hjk9LL56jG/1gdALbgz7AbgJcjQmGwZ3eS8+nqQaLQWDqMFCeAJshJo0Q0ay?=
 =?us-ascii?Q?nyyqWZoviEikrvpL9q9ydVJ6SX9R59Z3CzmaN61/sVm95znhEb+2kD6af892?=
 =?us-ascii?Q?HeM6L0iB51/vEv31HJJq+jQzjp2Ii7DuCctO/cfzTGyW/c0+gzq3vRx+T0Ak?=
 =?us-ascii?Q?mAb7HbSCtjLX0t5wLycI49EKEGCFBHJ7YYxNeAoa8Vd5/KdORWBaAHWN2N4L?=
 =?us-ascii?Q?QeTioqZMGHj7zYTBRp+xTf0kNz5G7eTiUgezDc8epezfAVad62H3ZC0Ekai1?=
 =?us-ascii?Q?1/I3G7zI3N6Cewy4NkuDCUZDTy/+cJ+nq+v0CbT6cMXoECzq+uXTrMYV/bOr?=
 =?us-ascii?Q?j5iS7rq621j3TCmLW6gXtYkRBFhCjh/r0utBCcQuQqzIFdTrYaICJITk86SM?=
 =?us-ascii?Q?yQQo1LZ4+nxT7Ok6OgvQHBWnmzBpPUfIWkexonHBec2hznHMbB0twEZSYPh1?=
 =?us-ascii?Q?2RWIhXIquxwZ9+TplZ/P8yiBe1FhOu9efIrXtbz560m/LXN7lTDYhfaouQnW?=
 =?us-ascii?Q?jj/cic74pVSEeyJgon7wmS9dk0wl7SDBDuzqz0nHzVPOwxHASchw5K8MsWFe?=
 =?us-ascii?Q?vr6V4w63TTW6x8yiV2AAyoiXbQG+/IG4Nm6k2+He5TWRTyHyaS3ol0Atj2GN?=
 =?us-ascii?Q?qoJWXk3Ib5Lpz7nglnJje2iXRCljjqawZ7BMYPywXpPGI6McDXKx7lWLRpQZ?=
 =?us-ascii?Q?SrZpbKgjj26+a13+o7pMj+zExjg1rHVzAKImDyLbqH3w/vDyeUcBZdnaYGTl?=
 =?us-ascii?Q?EKxrZPoHjtXwsHSWR+Mv+NAH71sLxEqz6lQh530wYCui21af7N4jWYEwycr9?=
 =?us-ascii?Q?D43Pa1QD24rF/w5vg8W0DAbwfx0lmcEhLO+4GQh+a0OhLSfKbbuY3GyUJKli?=
 =?us-ascii?Q?LLIWTAIzWxn52Um6ayMqVaLVzpzK+Rk5oxmMsDyxCxVbbdCHPm4QsQwlBe1C?=
 =?us-ascii?Q?LWiNY2CIGG1q6cNZnPuwYYJsTo/KwxMiPKNtodpPfMnx4UQc0d+S3w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dEr1TbY7WSE9p7nx9gK90lEuFwz/JpeMPcRpWXLu/gJW2skxjEtIHkFYmUNA?=
 =?us-ascii?Q?u0WpyjPcWg+llyd/AG79IfhiueerbYh82lnTomH6ZEKUn3/sTURc4xusI8N9?=
 =?us-ascii?Q?FZO1+iSY4huS/xiUaXUcYDddcehH1b1GYiizoxFnU68p1D1SgekIvLAbDvwU?=
 =?us-ascii?Q?Plcph3x9ByNTCrrVr4c+f2Nul3LbzSBhgv9oSvgxzOPfDMbozbDZqffO7Gvi?=
 =?us-ascii?Q?WEWHWGE5S6mJZkUsNvS1NYnEvIkFbHbdX84jRW20H5hlHFBtm3IAW6DyxueV?=
 =?us-ascii?Q?Ruv6J3axxOQfFj/snJPUWCa+dVwlxTSvWmdb1Jzgf1pnZby/DOAMJCH74o6G?=
 =?us-ascii?Q?TrI8ahjd740uVRm8EU0yMP5v6jM8TSJ/woldyk9Ec67kXiqCrRGPE4DK0zHr?=
 =?us-ascii?Q?d459kPAj/Ji8EBjcjoP1F+e3N9AbVTB2+CBsBdoMJwbP2w/93Ihn5KOmytlp?=
 =?us-ascii?Q?E8abo5hkeG4mR3KIA/Bj8NbzBrXC+3XEgVwc5//1g03bQ9Wh5JQbk3vOthUA?=
 =?us-ascii?Q?TEguKQhWdM0+mr3FCmivaRHrOTnudJaq26xZeGCKdgH6SN2DuN1CA1UV+RrI?=
 =?us-ascii?Q?BqHKfI7SIusIfxOcG8TIxS2m8vHQs1fwkel0iqkw3WFD4UBX/CU/5vqFOtUx?=
 =?us-ascii?Q?tmv0Yp3VGD0+s5LzkONClsTAdUc+0mcpC8ksLm9uMQVw0AhZKpRXvuCWEhd6?=
 =?us-ascii?Q?+XSGaZq/mk9S0SlDjBYrPTQ1IxSz9AvBnCsQ0s8k78OcfHwa8LX7BxBeR0rK?=
 =?us-ascii?Q?AZRy+JMIuFG9w88hgBSbR5T0Bk+eiNOIAAsecQp0NTJxCJWNG7axWO1Jeo+9?=
 =?us-ascii?Q?Y72YOIwg1A6BksmROE+35r+hE7QbDl2eSmNHwOCyh4HSwdJoR4w/EcapywWF?=
 =?us-ascii?Q?V3ko3YzEOa76Mew2w2R8Fd8p1ZBjc7Nnn5mpiLc8yxo4C7MavBGZBni2GDNY?=
 =?us-ascii?Q?8FrjOWSfwLv/D/XvyS6LHCuX/z4WUVIcaIqEg01NRhiS4IifnpVdyoq+0Bau?=
 =?us-ascii?Q?GEHat0gN3whsfkncRC+4VGw12SN+zA4fwT90KAh7Pr0hxe+N/wMH0a0poyBz?=
 =?us-ascii?Q?MHD1pzWn/0253drjiUHoSLTpbnfIA3awq5FB7yH2/sK/LJwZgiRkl0GNXR/s?=
 =?us-ascii?Q?47z3DW47pH61IgI9KL0f5bVcNcDwJzZKUy12MWSmHaH9y2ZmjLnsY+WVy+uh?=
 =?us-ascii?Q?Dd6d3H/hDXq8Jw2oNaDghA+Lm+vpMJWcBv0KukojCcKKCB79XWo49gk4ec+B?=
 =?us-ascii?Q?HXz/pg6Vi5CceXzyr2+ZWLCQbJceSTf+QTxIJTHlGoCHwL3CUV0Wru5DLNYG?=
 =?us-ascii?Q?nz9sEmZDMuEhglmJGGGEG024HqlzPe3zbaeBi/oeGHZnwQDwZX6xc6EUSs6X?=
 =?us-ascii?Q?cqdw9zXUxeuJ1Ejxe8BO+pCUhSLfNf5HSm0ry6T0oqy5wXL6PHmSoV/K6Z7n?=
 =?us-ascii?Q?gWPSqiCIevq7Jy3Z86RfaqX/wmG0k5OD7cWBj9IVmNYbTksnq9YwYs7R24dm?=
 =?us-ascii?Q?zHJhM5AxXuFMNb6QyitGSrGI+GgJG9Y2nBFGECWsZyykXrGuM11Kf3sN6ovR?=
 =?us-ascii?Q?fIv2pqWN5leNKu05EnBAn8tf29ZkehQApN+faMaxTr4mF7TXQAQZ4IvcBF0x?=
 =?us-ascii?Q?Jw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76088824-7e69-41ba-a71e-08dddd8671d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2025 12:06:06.0934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zPZENTzc048vBa/Zsszycm+4LOdri7XTxmJ9UmB+vtXCY814NtRD+Sg3kvwfYkKWZ+/RJnoY9C3MDFk3iGfkZ8OPnqGmf5jlyckZQoOpMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12158

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 15 August 2025 15:48
> Subject: [PATCH 2/2] pinctrl: renesas: rzg2l: Don't reconfigure the pin i=
f it is same as reset values
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Don't reconfigure the pin if the pin's configuration values are same as r=
eset values during resume() to
> avoid spurious IRQ. E.g: For NMI function the PS0 pin configuration are P=
MC =3D 1 and PFC =3D 0 and is same
> as that of reset values. Currently during resume the pin is already in NM=
I function.
> But the code is forcefully setting it to GPIO HI-Z state and then again r=
econfiguring to NMI function
> leading to spurious IRQ.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 34 +++++++++++++++----------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 2b5d16594bb7..086fcb18c6d8 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -3103,27 +3103,35 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg=
2l_pinctrl *pctrl)
>  		pm =3D readw(pctrl->base + PM(off));
>  		for_each_set_bit(pin, &pinmap, max_pin) {
>  			struct rzg2l_pinctrl_reg_cache *cache =3D pctrl->cache;
> +			u32 pfc_mask;
> +			u32 pfc_val;
>=20
>  			/* Nothing to do if PFC was not configured before. */
>  			if (!(cache->pmc[port] & BIT(pin)))
>  				continue;
>=20
> -			/* Set pin to 'Non-use (Hi-Z input protection)' */
> -			pm &=3D ~(PM_MASK << (pin * 2));
> -			writew(pm, pctrl->base + PM(off));
> +			pfc_val =3D readl(pctrl->base + PFC(off));
> +			pfc_mask =3D PFC_MASK << (pin * 4);
>=20
> -			/* Temporarily switch to GPIO mode with PMC register */
> -			pmc &=3D ~BIT(pin);
> -			writeb(pmc, pctrl->base + PMC(off));
> +			/* Nothing to do if reset value of the pin is same as cached value */
> +			if ((cache->pfc[port] & pfc_mask) !=3D (pfc_val & pfc_mask)) {
> +				/* Set pin to 'Non-use (Hi-Z input protection)' */
> +				pm &=3D ~(PM_MASK << (pin * 2));
> +				writew(pm, pctrl->base + PM(off));
>=20
> -			/* Select Pin function mode. */
> -			pfc &=3D ~(PFC_MASK << (pin * 4));
> -			pfc |=3D (cache->pfc[port] & (PFC_MASK << (pin * 4)));
> -			writel(pfc, pctrl->base + PFC(off));
> +				/* Temporarily switch to GPIO mode with PMC register */
> +				pmc &=3D ~BIT(pin);
> +				writeb(pmc, pctrl->base + PMC(off));
>=20
> -			/* Switch to Peripheral pin function. */
> -			pmc |=3D BIT(pin);
> -			writeb(pmc, pctrl->base + PMC(off));
> +				/* Select Pin function mode. */
> +				pfc &=3D ~pfc_mask;
> +				pfc |=3D cache->pfc[port] & pfc_mask;
> +				writel(pfc, pctrl->base + PFC(off));
> +
> +				/* Switch to Peripheral pin function. */
> +				pmc |=3D BIT(pin);
> +				writeb(pmc, pctrl->base + PMC(off));
> +			}

I will send v2, as I forgot to update rzg2l_pinctrl_set_pfc_mode()
Aswell.

Cheers,
Biju



>  		}
>  	}
>=20
> --
> 2.43.0


