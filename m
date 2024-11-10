Return-Path: <linux-gpio+bounces-12777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 934569C3155
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273741F21538
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE8114D70E;
	Sun, 10 Nov 2024 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZdjARC4H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CB14D70F;
	Sun, 10 Nov 2024 08:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731227635; cv=fail; b=b7/myH8UGDi1/YxwdHccQbSLd72niBPZOBgI4Mni2Jh7vCoVVrQqOd8OmvnIsTfcemgEDJfyHZ9bH/JHr8cEc0cqDKhxe+pv3QmZziiRNHemDP3fpE3YNIhq/ADdE+qVHy/aoiJ+ENJMpSbgfJnNxe88zIOjaW0bH9VWr3Ucmms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731227635; c=relaxed/simple;
	bh=lTrvtAkulv3eAEgLx6CllkWfZTCS6f/nynQnnRBrM+k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WKi+/BbEZwhIVoe8bGq+60pw9c8vtdEIsWucnZfR58eZ+J9mMdvJdBRTs4JtYaIvF6T0qI3BJfEbktfv7uUX0pgD81esPrmwxMquiUel92VtNLYHyFsaitXJkVJiKetMw5VlHa47wshC+0dQ4+T4qBY5RzNJ4IvWEer0iHkeqQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZdjARC4H; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbAUULXTzC219Tc3mnAKe8xfWWJ9TIqxweC41/sKzJudkfyY9gx12u3EywYK7iAU4zbp7Byl0QdUKvohLw7WZpySAouH1InY8/DfK37FYOpYE7bJUHsLMaKU1i+zPiBeVKcOZ9NeUpmCkfMoYOgyJWrGEIfn/u/P7Dl9d3VqFu4fwLVAr8NMkv3DikYqsHECfMevfqwHXAfG4yCdg8WFsJt1JxkuyUlJ4H/T9Bj6/Zz6fD1dlh3UF7crb8amu6y+yHhf1sB3BV/3cn+PZAg04xgrvlecgH7Y5lIas415Ihx92WrUuC6zMmmWqq6P8uDcrcb+qVfEWJq4MD6JJz5Gnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2a//vbx02dnoOU0YhJ2gBNN0pCy6Yyor1PmiIs8Qt0=;
 b=iSRC3gkBM6w/HAwt+FvIL8YSexg+/T6jFSk5RnRcwo3BNmB8RX4aAOdNKzbmk5wuWPE7NL/jgS/EUAVGMSa7qhwMERqPo8BnmizhUwwibbovjSW2mOfV9IiBt+sJxHqYLmP4WQe5TmiFg21LCezupc+dRPe6coklop4ZhhRgT9dTUPvSvanHbSFu9/ZjWygljLUpesCTUhk749WnGZSrDoxkWQb9RQAG5gNTXeAXkA3lJg2sqF3SdK1ElV2Soegm7x2yXk4/g+PsTGKAOEXT98a5dtaZCP0HTx8dUDcyzhsBMMBjyBC+IsMJd3nZxmA0LTj7SSQjSqWjsa/qWlgSaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2a//vbx02dnoOU0YhJ2gBNN0pCy6Yyor1PmiIs8Qt0=;
 b=ZdjARC4H6Kv1HYsHyuwIHCFH9p+me9N3VCQJxtzz90/8yjQ4m/3dZKc19X8TuwMAZklEXG6QuBz7aO+2nopM/jFSUlkTKZpllMyiRg9UyNfO4R+ieZZyNBM/eOk5LfRCjtoqxMX+dKj4P9lew3isn3rUoqpUijlI70ohaWFqZFo=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB8807.jpnprd01.prod.outlook.com (2603:1096:400:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 08:33:50 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:33:50 +0000
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
Subject: RE: [PATCH v2 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
Thread-Topic: [PATCH v2 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
Thread-Index: AQHbMcwGxLNsq4zxjkmF9Ri6pfuKYLKwMtJg
Date: Sun, 10 Nov 2024 08:33:50 +0000
Message-ID:
 <TYCPR01MB11332871E3DB562DB9E28FD6F865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-6-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB8807:EE_
x-ms-office365-filtering-correlation-id: d29932a3-85d0-4de1-a1ea-08dd0162671b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yvqgM6SLolWlFVIUGVsRKTUR/LxThzb7R6F1piKk9/8Vtgq986vcNjQPyBpo?=
 =?us-ascii?Q?WS2BeT3faOgaB1OY96IQSfv9dP/Fzgvog7XRwl4bgC9KpusJq5qbumsY0ndI?=
 =?us-ascii?Q?oX5gYKqm13nDNS6NwC1ll1/lK87pVgll2I2gD6w6GDiYU4Vcz2lwxcwnzUHy?=
 =?us-ascii?Q?6sudGbPQbu9BHH/gP4LyyhWWg6C4B8RD2IE3lLGk/Xn0YJhnYr2Rv3jBMn21?=
 =?us-ascii?Q?AFudaegXI0oT4QH/eRbFmQvCylnnQDn6YQeKBPNyUmPdyhP9QWKH5OtBjy1a?=
 =?us-ascii?Q?DMHAwz9jKWoczKL/hcI8UNqKGAk/+rxtYcyJA3my40Yrl/YM0+6WLiDIkLpD?=
 =?us-ascii?Q?VQRfP/UXtI4xRLvCFj9pTeLytPnLW920KkgGgzB039SaKB8QpZEsexwPmnFA?=
 =?us-ascii?Q?XTIvCu1RRGw75+gavWtxjQ6HWSLZ6GxD5tdMaQkNQyUC3peOLJZvduphJbdR?=
 =?us-ascii?Q?/+y76gqDDW57pGV1Zm64WAvSQxPe0y68p0hGX77yN34S+FTvf9U9DM19DnvS?=
 =?us-ascii?Q?uNPQhzneB1TUa8U73Dzpo0aQStLQgnEDsDwgh3jsD5h+LEM7fJxkgICtXT3U?=
 =?us-ascii?Q?M5uuBAq05gCCK0378xAVZ9kFCGbIpPlfWMgaH+VdwoIXC1SFaf4CI5BGliSY?=
 =?us-ascii?Q?5dX5VwEsgfqGJz8raXxQ8DBvJCmJ/CbPpkYUmc9c6cE9sEm4QAADe+X1+oRb?=
 =?us-ascii?Q?Fjdc9CQ1Ao6qVgLw1JDaxRt1E/LVVviYG7oXLaeQGrJjAyZMMZ+qqgJhb3JV?=
 =?us-ascii?Q?fr2m8NvTSLx/qGvQa9s/Fq+tTSX4NJaykLfZPNWx3sUqY69E+N6gV9Viy/HD?=
 =?us-ascii?Q?3fbCyh4Kt+L7jk3tFb/6defJ6PpeH/rTHVrjPQlaTG3DG8me+9J/+OyTKdTc?=
 =?us-ascii?Q?bvOR4tzPdA207WuvWnVz4gbSNeAGUhWFiXLtCLbUhpjSqlBFXkBMkcXgNQu9?=
 =?us-ascii?Q?Q+zDSHDZjAcozn4tbMdagbX7qgL1RIN/mQshSlZEiWlPTjvO7l2A7OGJLcgB?=
 =?us-ascii?Q?/LziRnuXtmGhCWWqP1U8WGmF/ed3qcf3GrvCW34yWCmYZtZBzem5pATFmxBl?=
 =?us-ascii?Q?0P4TplJBrhIBQWO9U0BPHf5/lAGWgoPVLvcwqJ+KsLJpTnYfRNXrmpQbs/Ig?=
 =?us-ascii?Q?vGix+7sufeK6Qb/r9+LML25U3HSDSGAevwueAX/a/+MbzmvcL5jZuqw7HMGh?=
 =?us-ascii?Q?6QFmekQJTsAaB7vpvR6LivY5/skImh758Sp9EzDJeiMo5vn+BALkn4T3jakF?=
 =?us-ascii?Q?veyxxLEiTwi4zpXinvr4umzu+KpQCRiKy218V3no1jjofIyA6VCt2wnkVRrJ?=
 =?us-ascii?Q?HskqPcTDkBCGpuK4QeQXZy6grKbsqyghlN7oHICM2LuB/EWtuGITk3Xdei8L?=
 =?us-ascii?Q?KOBFKn0ZhieWRuDc/IlXiEzB5BLg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?l/MdvHkWobtziMrfKugJ21MAILNgE4lEBTAp633FskceDWCuHCcuYKv8Rhez?=
 =?us-ascii?Q?FyPWhR65nJ+gN44GIYmLg+EoFo1GaTsrKRZHk1k5zZsqcfjbbSf2IQadh2xl?=
 =?us-ascii?Q?1r0LW5hV32GRV6lpekRRdLNNmpUKWRUCnsCdD//NELYZv2E3wM38qKWtg9ny?=
 =?us-ascii?Q?ma+7xETPKiN4xMR9KJ2SJx5lJEJsZQ59CVQu4eGvUTSUzrmwhr+tPHUUHiox?=
 =?us-ascii?Q?BVpyLgPCGAWN/OXA6ZBWaZRUuEZuLArNxtv7wzLu00b08bHrizuYviKUYRWe?=
 =?us-ascii?Q?fNx+COJS52t4qCiimSLurwehwfavK0C64hKfP22SnuX1iy9Wu5ssdwIocj1a?=
 =?us-ascii?Q?+zNa1sZHh0uCwlEDQcSrjaj1ypg5jW3956yuNebxDXUt5s/aGmY9d3BW5izv?=
 =?us-ascii?Q?OvUQr8Za6dFCqVEPSG3W4O/R+dnhYfa9HsnLAZDNwwy4/o0cm8GRI74cs2YK?=
 =?us-ascii?Q?gKowY13Q7gPukQ39znmdQ/ukZOZfLJcecKXqHm8LTiRXuIrg9YO1g/RbTXOR?=
 =?us-ascii?Q?2BjKPhJAUywg3nMBg3uuf/VCGju0muWaVehON/xHiFXFuaZkjXEDI1kfOoS1?=
 =?us-ascii?Q?8VnXMDoaahDBynJGZPG4dYdH2pDoQPRy4zvPjkTiayKBEOhScpWb97qqEyMO?=
 =?us-ascii?Q?8piS03NDa+nc8sz6tVugoR1azF3a61n8iuBA2UoKeeP3CNufikr37iQPKgDw?=
 =?us-ascii?Q?H24pD/yaGH4Np86UQAW+B8pNGqg3DulbDFluFwSBiUeHZxib8Vf/EZGK0MKi?=
 =?us-ascii?Q?IPsltTU/pHblQ6h51hfiV7uGhq9IsP/kaPRJEPXeD717Ngu50Q118tFbjItH?=
 =?us-ascii?Q?RyqOkalZSSYlS3NHeBlI70KnpL0bjTFEfRVOAeBRbVdUcibQbazj0x3Ga+3M?=
 =?us-ascii?Q?hquFcig60e+exb286+LeeRpz23EtgDsesUswJ4IqOCSGly4tiTy3cuwV3D3w?=
 =?us-ascii?Q?5EdledtlgK0fQeB/mFklndIC8qCU51WPfB2D55MGtEbo3zxryigOKexP6QCL?=
 =?us-ascii?Q?krMP5yo+MDwmPL9A/AyRx5gbiCCihU7Un8Rr9DzaaYi4nfUYaPqYcpN5OOtN?=
 =?us-ascii?Q?R5EropZ/+XGz/2q3KO43jVRktfILYzw0SjHNAB0qwMxOZG8jAbVvGoSAjqQd?=
 =?us-ascii?Q?zXz8RE+zUL7kafuzQexovlqT1FYNDiDZM2tv+LdBY/qBCLkVDQizdM7QdVzZ?=
 =?us-ascii?Q?3FIuMKwVGFQgmel9Vad7ntL6GvoC4sN9nIx4KKqXtI5PG5ncKTSsEvUdw+JX?=
 =?us-ascii?Q?uiBovI5vEbFFtJ0O0B3J6j9a0xocpFCdE6htR8o4VQmxlXyeJSI4X3CNJ15H?=
 =?us-ascii?Q?GqHoro2CuqkdHlLGfGA15NQ62VnP5/0voqzK1vuMJTUEKN2/syMYz1v2FsRo?=
 =?us-ascii?Q?8D/2Pd2BjT7bsw/Bx7SnPTiHRAy7MJnIv2VW3QXAjg38ufZNxs4/6r6Lp6zg?=
 =?us-ascii?Q?RBRkskOi/hSe1oDGO0M95g3MwXQdxxOFWFqtuqN7lRa7n9w0HjKcUOd9rn1D?=
 =?us-ascii?Q?EF9xl85D8nm1MQtU4iiTPLF3KgW2qpChV/HiR9WiT8o7Ji7jWpobdxrdaX4X?=
 =?us-ascii?Q?Xkkfbp+ntc7j8CfHqT19NKPjzQpn/bNp76BnewG+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d29932a3-85d0-4de1-a1ea-08dd0162671b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:33:50.4205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YyK9Ag/mlOBI7NOAktPRWNcy8i0la8/4ADltJ2EIkbSMrkNzczIVxqEn87gEVh6yVec1/pbxfH9xn8kKIqznubhGPDdXuODzHLw/FOm1nsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8807

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> Subject: [PATCH v2 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add audio clock pins. These are used by audio IPs as input pins to feed t=
hem with audio clocks.
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
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 8ffb9430a134..1190ca4b1808 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2086,6 +2086,8 @@ static const struct rzg2l_dedicated_configs rzg3s_d=
edicated_pins[] =3D {
>  						      PIN_CFG_SOFT_PS)) },
>  	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_SOFT_P=
S)) },
>  	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN=
_CFG_SOFT_PS) },
> +	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
> +	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
>  	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_I=
O_VMC_SD0)) },
>  	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_I=
EN |
>  						     PIN_CFG_IO_VMC_SD0)) },
> --
> 2.39.2


