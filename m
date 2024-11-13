Return-Path: <linux-gpio+bounces-12968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29A39C7439
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 15:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A572B2A7BA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28787201113;
	Wed, 13 Nov 2024 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wy/Kr0mo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F71DF73C;
	Wed, 13 Nov 2024 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731506275; cv=fail; b=bhiGKz/Ul8HEKMrRTF/J2hHFLJgfxJzHL1a2gJO87E82CN2VnC4KZYGlfL8a7w567Q+0pPYy96c1j9D5AzXC84rboK9/drxKxAmRSLMFoFzMklOBf2+bJAM6LUIMebbt5NmttU1XlKvs4czZMWtHTu2ujR9J64RVH+wDONvzHr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731506275; c=relaxed/simple;
	bh=cxaPOGQFW6f9bSWumZo9yVz9HeB/0mylP+lNGeMIE6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nrWen0q9lEfdNC761FkEDsze0O5SxgS1tBCDYRDZ9SoLlvyffK87ldtq9+sAqlmbOQxm583Wz91NB0X8p/zxgotE+tvPaIHUYj6U4KGwJraEL/yFK43Kfl6LrFC4Nua1BcunC22QOH8I7TwLCjf1oCyUAPeVTDfL469v7wDy1No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wy/Kr0mo; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uasNUHmo39JthyeutwVqIuwZIXF1gIrvhtr7qhccT95qwh71qahK1YjsRaCF7cdl1y8FdbflpwymNi2B8dYUb4xQvEs9/vJlPtK05mPPH8OQwctxGKA6dvJQTbyiui/vb0EkEG9e6/9RmycbvDgKx+A7CFvbCS6McuJlcvBotoVNLZi8rumgNZmGjwltcSSW6Xx26/WPcXceEitANYlrjpgQf8fucjwaX1AwH7moSRO8Jt0sVekp3vY4ZvvDcnMaGDIkMOvYetZjGY62yySHtVtr1wQH7U3CSOO9mnRMLzqn8naDjHHqqNM4lmEDALfVRzJ1vO+zniO79F67cJe3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVCT6v7ASg0TuJ7+eda/hZarlfXo/qIGuqQrtDUapLI=;
 b=XYoBZXFlb2KWOKj64+busAv6uESUlJpzQQU9+RcPleojGAZqOvSpY0TZFyz5Gey/VYvxagDrn04IFRoEVy1zfrH4kCpZfSeFt0k4bPPIg3J75Nml8GDtP5ov9x1wK+TqseEGJvfkWGFmftXN4T35WP9POkySkaw6AOkRFlF+ecgZu8N3BENUgiaPy6ccO0TY/9zNFrlx6kys3v/7oMWlfjtt4xoQwVKiuZeG/qNpQS3HL5PTzkSxJzfhAY3RzqwHDqS0KO/RMyclCWWM4Y74vdtd4lgZM0oxuJ+3M3ZZa5JX7wfLqDTel0UHB/IaxfiJ8RN3fVCoAk5AuERmG+sd4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVCT6v7ASg0TuJ7+eda/hZarlfXo/qIGuqQrtDUapLI=;
 b=wy/Kr0motm3b7XkdyMbkB78NxEaETmRR1+R1PyuZuTdfosUuvhXxDUpFLIABZMYrkeXLoBe6tYGePbn4KmIYykNR/RjwpsmVXLYebedZTvWIkd7pY6cZNODcdeKxouyZDKWg9PmVi7MomXmtCu9AYAegMR7DFuPLpNIfY3mS2GI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12948.jpnprd01.prod.outlook.com (2603:1096:604:33d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 13:57:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 13:57:50 +0000
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
Subject: RE: [PATCH v3 21/25] arm64: dts: renesas: r9a08g045: Add SSI nodes
Thread-Topic: [PATCH v3 21/25] arm64: dts: renesas: r9a08g045: Add SSI nodes
Thread-Index: AQHbNdENanMZJWVJh0it+i+AxTKSgrK1PE6A
Date: Wed, 13 Nov 2024 13:57:50 +0000
Message-ID:
 <TY3PR01MB11346C711262273318BA18615865A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-22-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-22-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12948:EE_
x-ms-office365-filtering-correlation-id: ec6ca472-e1ba-4f30-f09a-08dd03eb295d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?cmvgIVKGcQTz+VRowAL83GPL1q+SvqoZhoKMSBtrKWaesMceI6qq1CgdvvY6?=
 =?us-ascii?Q?+8KjhBOha6QB6Z+HGSRiilZapxb5JF98roYZWmWqEwN/IinvylbJMnxYNB1s?=
 =?us-ascii?Q?UVcoiZRxRIqV8PHKUi3frgUxj09ZIDZ5hEtd1s/VAFNRGcn/C0Xql7+v1rOp?=
 =?us-ascii?Q?ltiPZHda8A2BBepOoc26sRRKL9mL9Mg2jz8kFx+BGH8F6IANT3I4kyQ3MHQv?=
 =?us-ascii?Q?PvOiQad7GI3zLXxQtPr0AzIUu5q2P94yzIM3223EzdP1Ooi0uj2EaSJdv4xZ?=
 =?us-ascii?Q?0wzpzzNfpertMXxJY9BZRY2IqmcHU0JvWRj/QWhDn6gqM6o437JxkeLgVv5A?=
 =?us-ascii?Q?fJrBAo/lazCLIwv1KDS6wWMHRwHiMUDea8yzuJzF0pHjutGvjfrulLkMTkA0?=
 =?us-ascii?Q?P0bQvD+6FvUM1Hk9MeUcynNgrgWkkYJOa1QIKjDZmBcA4BtWgfAG4p2vs/QO?=
 =?us-ascii?Q?stTY9V6zhwebp8L/tjavS++JrjHpaXZR1H/c1r4Gakb7zqFl3PTlshZegMjA?=
 =?us-ascii?Q?rAUwh9Aebhb+Keosa2oznmkKv//H/Ui6gXklhtUHxP477WhUYLGO2Z4VnYfw?=
 =?us-ascii?Q?tDv6ZljbrUXPMrWJQeZP6uMh8d8mFjJGvqiLhODTpZ1nktkRQ4rP+wdnrRs7?=
 =?us-ascii?Q?kuCDQyLDSWuCauXvmJT2qrjku0nJJSqvN4TYSgciyUeJNbOVBLxbS9OOadQr?=
 =?us-ascii?Q?4YSHAB1gApKj3LpBqdj+NB6PkQ1qIpvOU4gwpp3FKLb4i3ZXWqLEJMiJVsaA?=
 =?us-ascii?Q?6pCcMay+z2N4pVF93fvrbRPALXs5jQpVLFrdRpi8vlfWTTpLM/0ItnPuFMEH?=
 =?us-ascii?Q?3ri2TRkc9cY899PSW4kaoJKIIhPzLctYq+ImZ/wkDBKyg88f4P/sTOymFga5?=
 =?us-ascii?Q?xTVfbyeQy2XxOrVB8+wvag6ky8eEIbnwMFNQjJhjy4uwvB5I1WbEYw/ebED8?=
 =?us-ascii?Q?+mxrbushio15PQuir7UBU/zT+1p/+KZW0Up9LQxiJ++MO3KoZicTUNmgVULd?=
 =?us-ascii?Q?c5hcFL+z+bA1p7imZXoF745/6cgAow9CCpmhr8zyIMAUU5XIxYPZb2wyYqeo?=
 =?us-ascii?Q?rfk/0LGubi4l2a+kuTPikNs21SrcsusLqO8wL9KaKVX78Fzot6jE/HeFW2j3?=
 =?us-ascii?Q?FlTsvLHdcS0ZV7glN2flxwGWQ5rM8210a1cuCzQvoL9tJtFJM2Dg3WwsLdmY?=
 =?us-ascii?Q?KRyMkmb/BQ6WGOfF3aqooRcGGXjYQiLpaZvsE6aq0NNaJjdH3frm7mxm6ZRa?=
 =?us-ascii?Q?FqeScYG+x0pZ1o/ugWcIlZBCZGJ3GLl+KPHXj3IrQIZJQhuSeB7T+dFbrd+4?=
 =?us-ascii?Q?+a4Viuqs8EtFqnQdBhWCtANpg/f80kvjWjslNC8UF0u3O5mEDZkHhmRosX/v?=
 =?us-ascii?Q?vlRq7xjEjUfMt3ntwNdWnD2RP8hQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JnMiASgb1uVjGx6u5JM4WoEOV5/eq/O5zW6LtxEcBHsgS7UcBrHQIxXUEWLe?=
 =?us-ascii?Q?2Mqrd9iV1/xp/phpjFk4/YWJP/bvn/80cWDu/D7As7Yk0isJcWAuteF0vOga?=
 =?us-ascii?Q?HipBg7QfFjaHshmyBSB9+rDh9AJ12wh2kj3AJefKlkSZYfO3bzTJuyXTpfEi?=
 =?us-ascii?Q?vLguLl3d4bzlGYkttv0xaF6ozdhztupOD3QD49gPMyVWd/Htl7NlwGxvEYTR?=
 =?us-ascii?Q?OMjsspRhoOVige4uDJer3ZAJKd07EoH75Q9RSlo+cwkCb/5edJbtXeJQrCOv?=
 =?us-ascii?Q?TLMiueKwYlaVH2GwicgH3A9jDH1HqHg7x3x5DeJcMbL/L+91dv0Xn3oZfhiP?=
 =?us-ascii?Q?mIGjDHs31rRI1YhXRap9yAlMGeROeSNN+3h/ZfAf8PoIuZuhlLx6pOTVmaHX?=
 =?us-ascii?Q?32Ld5jevzC8WbUJqzsWtjH7qH80GuQZGA/1zWgs9LC3cx/LEs1powUuKc8HX?=
 =?us-ascii?Q?gmHEiXWi/bI4vVjOQL4JTBhzBkmN8Y+ivIMyyPqkfQLTicBNihE+HqXVor0d?=
 =?us-ascii?Q?vGs7zqpI6h3hjSr0t62/X3RD5LNAXp5QZ6U172lWyDuFeXZvxRGFU8tXG5yk?=
 =?us-ascii?Q?+2WEGih4bvOiLDZ9rVkGlT0Qx5gBkxi0uudSbU0fPHzycJkglWg+A7EFfyft?=
 =?us-ascii?Q?td+WcvnNnltL2tAFw5ghJQjNfHkn8n+B1+8bEQOARfvmPULsaBttp1eJBqzj?=
 =?us-ascii?Q?L2BJQwSQMm/5TwMVEmJRDY6HOnP6eUyw+jkqinLSkTsMT6ZdSvZGOAm1p0TS?=
 =?us-ascii?Q?woDDOR2VoEauYYiR3yAWGM/+7DsBcaU/USTVai7ds7cn6+RuOMtacSt7gHZY?=
 =?us-ascii?Q?3L9+zxdTDq0Z/fW+o3WnNtAtp4HOHAKsfWB5QNQ4SMysl2U2IpJKeEt7oS19?=
 =?us-ascii?Q?pZPdCP76lr7OTVXilAHQTYxhygh5YFLpoiKIvcwXpGCMqtJcft/Jtp7VrwF/?=
 =?us-ascii?Q?uej31OeWlaIzF/sFTMjdbiJiE/m+P0LA9hqiDraWlhygpd669uc3yDSxumPV?=
 =?us-ascii?Q?ctd/rPkQUbvvEB6pzjYCADa0T7sHR4wgFKk5IUTuCvPECilPOLix4yEA2gVX?=
 =?us-ascii?Q?Dewx0TTme7oOJtQd0OKO+gakK61pN3/ary+U/dJ4ssr5HBlAwIvyj+KVniSW?=
 =?us-ascii?Q?qlafy99zhPrK9+fk8DfRzJk1qlrFd8P10Dxwb1LJM13tYugVTiRMSzDEKTgP?=
 =?us-ascii?Q?AxqEqh6nZhaeJUDXZSIOZmlkh4OhZpDzqDA/GbaILIX34XdRlmJhQ5Cs9MnO?=
 =?us-ascii?Q?X/hoj0MyHjSTDMbM1B6FEix6cB4KE2+R9XFNbrBj/seFS1r5k4lvbJHlSrle?=
 =?us-ascii?Q?CWb6uDZVzkbgPIui64T+1mZvOxjrqHMnJHdj7ynZ3xbg9RB0ilLRd0zzUAW/?=
 =?us-ascii?Q?rFjkzA0yFEoEQ0iJVigZjgnb4WRwedsMmpKDhqO5QQfk+5BxRUTgqb1sohPx?=
 =?us-ascii?Q?Uzu/LO34nKo5KGZ2HNJth9TkDKupwUeBzNpC1g06y2qj9yyAIP0370PNXJsj?=
 =?us-ascii?Q?CfvIlecFtwJqmwnpMgTwEldNU8BSUDPVPxllwSbKZ8bTpsjn52/fs4QpfYe0?=
 =?us-ascii?Q?KfUdjzS904XXBbLvwmfKNw8HeLCfF7N6GP2MWJ4ECddcYvl/z4cfE1v3abfO?=
 =?us-ascii?Q?4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6ca472-e1ba-4f30-f09a-08dd03eb295d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 13:57:50.2119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAjxO9sUfPPLwUr91hqC48x0xmYxgQHDu67orPA2on0K8N4hwq6Ac/kXECTlJu93PoRUSvuKprERWXs7kngDW/0JF8CXBh9R0TCkR/ZL1Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12948

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 13 November 2024 13:36
> Subject: [PATCH v3 21/25] arm64: dts: renesas: r9a08g045: Add SSI nodes
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add DT nodes for the SSI IPs available on the Renesas RZ/G3S SoC. Along w=
ith it external audio clocks
> were added. Board device tree could use it and update the frequencies.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>=20
> Changes in v3:
> - none
>=20
> Changes in v2:
> - none
>=20
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g045.dtsi
> index be8a0a768c65..24c6388cd0d5 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -14,6 +14,22 @@ / {
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
>=20
> +	audio_clk1: audio-clk1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by boards that provide it. */
> +		clock-frequency =3D <0>;
> +		status =3D "disabled";
> +	};
> +
> +	audio_clk2: audio-clk2 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by boards that provide it. */
> +		clock-frequency =3D <0>;
> +		status =3D "disabled";
> +	};
> +
>  	cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> @@ -187,6 +203,86 @@ i2c3: i2c@10090c00 {
>  			status =3D "disabled";
>  		};
>=20
> +		ssi0: ssi@100a8000 {
> +			compatible =3D "renesas,r9a08g045-ssi",
> +				     "renesas,rz-ssi";
> +			reg =3D <0 0x100a8000 0 0x400>;
> +			interrupts =3D <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 241 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 242 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "int_req", "dma_rx", "dma_tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G045_SSI0_PCLK2>,
> +				 <&cpg CPG_MOD R9A08G045_SSI0_PCLK_SFR>,
> +				 <&audio_clk1>, <&audio_clk2>;
> +			clock-names =3D "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> +			resets =3D <&cpg R9A08G045_SSI0_RST_M2_REG>;
> +			dmas =3D <&dmac 0x2665>, <&dmac 0x2666>;
> +			dma-names =3D "tx", "rx";
> +			power-domains =3D <&cpg>;
> +			#sound-dai-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		ssi1: ssi@100a8400 {
> +			compatible =3D "renesas,r9a08g045-ssi",
> +				     "renesas,rz-ssi";
> +			reg =3D <0 0x100a8400 0 0x400>;
> +			interrupts =3D <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 244 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 245 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "int_req", "dma_rx", "dma_tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G045_SSI1_PCLK2>,
> +				 <&cpg CPG_MOD R9A08G045_SSI1_PCLK_SFR>,
> +				 <&audio_clk1>, <&audio_clk2>;
> +			clock-names =3D "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> +			resets =3D <&cpg R9A08G045_SSI1_RST_M2_REG>;
> +			dmas =3D <&dmac 0x2669>, <&dmac 0x266a>;
> +			dma-names =3D "tx", "rx";
> +			power-domains =3D <&cpg>;
> +			#sound-dai-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		ssi2: ssi@100a8800 {
> +			compatible =3D "renesas,r9a08g045-ssi",
> +				     "renesas,rz-ssi";
> +			reg =3D <0 0x100a8800 0 0x400>;
> +			interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 248 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "int_req", "dma_rx", "dma_tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G045_SSI2_PCLK2>,
> +				 <&cpg CPG_MOD R9A08G045_SSI2_PCLK_SFR>,
> +				 <&audio_clk1>, <&audio_clk2>;
> +			clock-names =3D "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> +			resets =3D <&cpg R9A08G045_SSI2_RST_M2_REG>;
> +			dmas =3D <&dmac 0x266d>, <&dmac 0x266e>;
> +			dma-names =3D "tx", "rx";
> +			power-domains =3D <&cpg>;
> +			#sound-dai-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
> +		ssi3: ssi@100a8c00 {
> +			compatible =3D "renesas,r9a08g045-ssi",
> +				     "renesas,rz-ssi";
> +			reg =3D <0 0x100a8c00 0 0x400>;
> +			interrupts =3D <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 251 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "int_req", "dma_rx", "dma_tx";
> +			clocks =3D <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
> +				 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
> +				 <&audio_clk1>, <&audio_clk2>;
> +			clock-names =3D "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> +			resets =3D <&cpg R9A08G045_SSI3_RST_M2_REG>;
> +			dmas =3D <&dmac 0x2671>, <&dmac 0x2672>;
> +			dma-names =3D "tx", "rx";
> +			power-domains =3D <&cpg>;
> +			#sound-dai-cells =3D <0>;
> +			status =3D "disabled";
> +		};
> +
>  		cpg: clock-controller@11010000 {
>  			compatible =3D "renesas,r9a08g045-cpg";
>  			reg =3D <0 0x11010000 0 0x10000>;
> --
> 2.39.2


