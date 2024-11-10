Return-Path: <linux-gpio+bounces-12773-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1D9C3141
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 09:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C184D1F215E8
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 08:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDD614D70B;
	Sun, 10 Nov 2024 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Fae4VLBo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763E43179;
	Sun, 10 Nov 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731227483; cv=fail; b=gL4i3NdbSHhdOfA4PIibMzpMlw2pBUXHpH1JtvVEroVHHx3c6dNSxk+RG0nuMRvwtyV/0Yyg9d1bp2QEtow7bptzaAqib1QtNurokWteirYHAt0sg4Llm7p/vd4FDV2A88zF4/595L3535vECkKpYgsjLoqp/IcxEzfruSNfIZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731227483; c=relaxed/simple;
	bh=FYVP1Al1HVzPVs6UkqiEj4KUzO4fUIgAYLdwpK8TUQw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pqGO4YCM9DuTcB3xwu4px0zjNBxMG8jSr4TWN2qXM7f9OemIO1CvCS7NTMGOo2D1bPDIY6C62eYGqeeD+73Rnq4z5NljUnl89CQCdTP1rj+faWoDHthsy5x3XX+SSnEzDiJNFXdEMiHlJuEIx9uvTnAWP0utorPBrk4WlOc52ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Fae4VLBo; arc=fail smtp.client-ip=52.101.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRzVyjtuh8cvtIKRvZSXEsxigHoLc+VUvKhEnhcFlm17fjTEQPhzuVvXsAYaMx25eStSa2hWP4gmfkXNN4HYcvlC39r5VMU67XwRC9L0tSRrqu+aAxoZPD2SbBmNlbg2hdyVvM52n2Pr84hLMOMtD7cmfIYjPiNBzEls2qKhdaydwKNXsKNv76BeGdOwnBrkDBGWGzBEcnurpKVIEOcoGhKePP4MGJHFKKNkmDuUZFClm/U1eg9iLPchZ/hM83EVp5LWpoLxqzNUrbA8haN+YKgyNF1BOuN7OYmjexTZ/vJahiwncnQEWrp+1spSC7cCERu+YjGxq4tg7bm6CjizHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5KGQEEAWxMWbsQ4e6/ShGOA4x7bH87SIzfdPU7y3SQ=;
 b=ExQbt/Fg6mHISRQ3/FygyUNeiVokpu8sTen+GoTnllHyPeAU0kAFXLAQvm7P2SMePP4CLKHWRu06RRm+ngcWv7viF9PXKhyOpihKxT04y2rfEwyILSOw0oZboTmZhqlGJOUg9V6sDslIq8EsAmJmgVvTK39Xn0vlXJZpfnDAfto80o8aLuPVS1+XoxkB/JfmH5pDG5jeuz+iEe4R5gfrIKLlilYWYEWxFUjP8yLR/6bE5cFFAYbJDby/a5Angsb38oru6PMndPniWsmlHH8aKZ0x2YRzihfUCSwtiNazYIQnWjqApYZdConEtvzeBGQjS2vXrLyQNWpliHGPfAQX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5KGQEEAWxMWbsQ4e6/ShGOA4x7bH87SIzfdPU7y3SQ=;
 b=Fae4VLBosK8hz6ZoFJD51essA8pCzx7YwcQqFC8rlRSsrI70UnFE+ZEXKeyWqJJBjLINEfcKj5QQ5ZDWedg3Q1x4hrs33oh2iIKoh+qf1ORP/up92lfw5M/FraTNM5X1NbCD/41Z2W39QJvoJ6inOy5wMdsAkWNpFkQeQHp0ioo=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB8807.jpnprd01.prod.outlook.com (2603:1096:400:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 08:31:10 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 08:31:03 +0000
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
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v2 03/25] dt-bindings: clock: versaclock3: Document
 5L35023 Versa3 clock generator
Thread-Topic: [PATCH v2 03/25] dt-bindings: clock: versaclock3: Document
 5L35023 Versa3 clock generator
Thread-Index: AQHbMcwB+XPh1w3XrUG9TQmlSunktrKwMfAQ
Date: Sun, 10 Nov 2024 08:31:03 +0000
Message-ID:
 <TYCPR01MB113327EF54AE67BC77C25F476865F2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108104958.2931943-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241108104958.2931943-4-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB8807:EE_
x-ms-office365-filtering-correlation-id: d6e1004d-63bf-4f23-ffc6-08dd016203bf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3ses++LHLYgly6K4pa08qvDH+0H5cJQhpdliBdVGxj7u4oCIclllG9glqNqr?=
 =?us-ascii?Q?qjB7BL2HOy023HsqRCr3NVc/rnrVPSYNhls6/xEWp5Cq8SFA8ASP1DztTeTO?=
 =?us-ascii?Q?GNdC8XStOXfP9I6tHgp+1/9ixiKk4ogI3UiRZjwxch14LLU/dp53yNy0jWf2?=
 =?us-ascii?Q?HwyE7eCMmJYiafilXB1+Wh4RNSn+xBR+Q9bDMeuuSu9W/e+/w5LNkF1GFtKJ?=
 =?us-ascii?Q?YOLB6TaP8CsLP9P1+l4vr3wX+mdbcxwrBmaen7N1jsIzpEqVgvGgP6HMVQai?=
 =?us-ascii?Q?GQ2yHOYqeh2E5mT34E3iymEa37ouNV7fWja0rZpI4PZu26XiuqQioxzdhaHe?=
 =?us-ascii?Q?KVDrX9+lAeQMOXTtCrjXEy0a7LVAzxvJ3Ut+ZpGPbPgx9ZPh0gYsv/xw7mTZ?=
 =?us-ascii?Q?UpakuQVdpM0nQWfle2lzWmaoyZ3lrSNL/Up/Gpq6G6BQRTSQKOFVxl4lhhNR?=
 =?us-ascii?Q?LEYDXs1JXLfajm3qfQBtmfzx+A84UjOqvMDXuFXc+zvpx7zGgeLk+ytzl8ey?=
 =?us-ascii?Q?oK8RxnEmzbCxk0dVyALcDUrioq9R2lJ8+b3APqKwsSHsL3IRAqGYsyCtTRG6?=
 =?us-ascii?Q?leiAE6rcuN6rnpmP6ytYG92GPaSGZIbwFQMDzZ8TYCf3qUl219rK+reH2Pir?=
 =?us-ascii?Q?eu1wMAH0KDHOqEtbEJEzE0N026ZovoHaB4OioBg4IjjLQewGkplfbpVejZKg?=
 =?us-ascii?Q?eIfU1zTavs/uaQD0b4lN/gpdOSmu0zv6MlU5EZqFwiXWSQIyM2awLr8lJzRO?=
 =?us-ascii?Q?QTjwnbvxniVCOY0OfY6+9ps6ePLhvCzI9a+tk+HG/QC+RxAyHvQKoTJXJuTL?=
 =?us-ascii?Q?igmylvf2zF1Qz53DaYlqcbKdrwi1zp5Nr8jCG4io4+/KGCBNe6v4slYInPv2?=
 =?us-ascii?Q?ETaTPLX/k6Trc3iqRWBxg5OsvBAOeS+3s4WFzj2tGVP/RJgkCuACZMQsxOk2?=
 =?us-ascii?Q?/+zf3Vw7cF02//JWYkV6uDl4g+QebhZpiUYo4VRzaHUEx0riecrFP6n1VxF4?=
 =?us-ascii?Q?n8Ah+BmBVVbjEuq/TPMkbgR8FuC12D79Mnbzz0djOr3dOJADXf0WHmyB5UYH?=
 =?us-ascii?Q?Wn/EehATfao6fAgpYUcL2TCo9kM5EBfqYi3zulMchRcifG8Mxtz6Kv/sL9bX?=
 =?us-ascii?Q?XiT/z4Ejsd4IZZpf0aLbqcrc0q8/W7c3uTELd/OqAvTAKL8ZnYVSx3kPTCj5?=
 =?us-ascii?Q?CqyIDERKzfhQul+Xas8MjjVIUKsrA83oafujfVWnQyoXDHCJM9ebWOuztgrt?=
 =?us-ascii?Q?wzfwKf2K148Nvk5QpgeGqsuYUgIvUyC/cEcVqio8xqsVjjBpBoonf4g6HkrR?=
 =?us-ascii?Q?z2lu/lEDAgzITvkW63amgNnHUX2Oh6ojybQIiKrwIeFoeeb6jr3q9ps1mQ4f?=
 =?us-ascii?Q?2lAFtx/Tycg4H3EBwx2kXIQfLSQc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?A/+OmihZFZa20fyVYohTE6oXlYhweQZvWxvv79T80APOO21h3uteUYaXO6vu?=
 =?us-ascii?Q?XHz6qc7oHZapQrt9bnxeK9kesiFQMXq1ilTNBaUA3EuN50uZT6Jp+nxa+Ppe?=
 =?us-ascii?Q?JSGoiENlzQNiZ1uyJ4OPFCHPFfXXPxwluWRm85X15Ga1ugSvz6tmBxyta27/?=
 =?us-ascii?Q?T8kfSnBxcQThIweLuDApvE91kcSwqKybjyH4eeha2qpo7nGiUyQWnJrU4No2?=
 =?us-ascii?Q?QyocwWsJJT95549PQFyUccAbnLFw/XJLK8bkDCj/9Bd5U51cJOMpk6E0ggzD?=
 =?us-ascii?Q?ZqO00uRVmXPi6hgQ3LupQrsPSNe1JghA6ME+MivIc/zpUvg98b8OqNHaSBaQ?=
 =?us-ascii?Q?28hFH8LyAPoeJ/+o3K4d+Ex21JXaBz8lCnLQWUaew6GR3DUAgwB81jdGP5Jz?=
 =?us-ascii?Q?S3aiLpGAyLR8QSHiO2Tulr4+g/0XbhH5T1eiMyH70p4U/gkc8SCnJgCvZope?=
 =?us-ascii?Q?Oq1BQqLJ92baTQsB7vGwg2VGvecVn9XX9LaOuSvW6wv9WYNpF6fE42NwXeQz?=
 =?us-ascii?Q?JoLDpERj3MGshGVnIQbBboWZkLbII5zjmUFQ440Rz4PjzD082bL4t1hz8XBB?=
 =?us-ascii?Q?DPWrQ9QN0+cDHXoqZl9RCsH/H3fPCSWMgp8TqiIbv6zDp2Pj5I/CKcG5Zv63?=
 =?us-ascii?Q?BLBrcTDdxnQfAx/K9OPxGoiz+83TzjfMuUdP+FvztW+Arf3jG1XSkWX64Kfg?=
 =?us-ascii?Q?y/81cZGnGhQvbI0nOyxFYpF1RqDFTwPZVH9MhSQOknz85W56G0C3q/nnWsoT?=
 =?us-ascii?Q?Q2bT+cYD+jXVhxRij3t5dvOHuTB14ea6XXtL1JUkOACgadT18fTb597vQV25?=
 =?us-ascii?Q?3FpSzMa0m+w578zoVXmI81pVdf9v5H0QFsSR+C8BGzNsHcRau5mpvwV/dtWX?=
 =?us-ascii?Q?/Bv2IWKcOY7NmUEVd02l6KFqTJbqguPP98xKehwG/I6xqVLIM0DiVT8MNHQs?=
 =?us-ascii?Q?EPbQCvtbSeA781LveGWK2g0WLGHEB32eikJdWcK1MsmWK+olPTiCK54gUeLF?=
 =?us-ascii?Q?2sgceZhBetf2U26S+Z3LcqkJuIa0IuHOiC7FUZUv/nojOWFK+4tUrrDiVn0g?=
 =?us-ascii?Q?JXf9gJvdIdtRpk7/jX1Jrn7aTfHIbGFc5YnHgYZHaI9OtGnjFlih5+0qxRTK?=
 =?us-ascii?Q?ldWzQIO5TBQXcLymuwNl7Naxm06g/5n9bZrmh6dQF49PHkRtXdutUT6ODu+2?=
 =?us-ascii?Q?rND0qg7C37X7G7zedoLOytnNmNnzuVcCq/0cZ6EWCrDi1Rx6TlnrtqrDJxNl?=
 =?us-ascii?Q?ZiEHkpVR+ogCv5raOvFEF2p1BIS8XXGDx1pW2f9wOwXwoz2x+cqne0gY4+FI?=
 =?us-ascii?Q?jbD9p6sgvGWQvypTMhRlH7/OQr9NLducbzNijn34bOXRrcJ0yD+Fsb4mcQid?=
 =?us-ascii?Q?H1pk74eqnIG6pmlhYUZQA0nsZOw7yr7C72aaqBEtMO1hWQx4v3i1DK8dIMph?=
 =?us-ascii?Q?hG0LdKZ/embNJnvA2gOl8Oo3lTsPkBhDWQdXe5tmzQVu1auluMd3Ynripot2?=
 =?us-ascii?Q?ORMRKt7A4VgLD26LHY42zEROoIIncNULhwosX+6yphHjuwrcTUdkUhCEpRG3?=
 =?us-ascii?Q?Sytmqq3x5HwcneMmohMvthZ9jYEYHCA3VaKy1PzXuqk4Og0ozNNkUCpKBLCs?=
 =?us-ascii?Q?lw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e1004d-63bf-4f23-ffc6-08dd016203bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2024 08:31:03.7641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mu4l9y7ssxFdAl58HyIQQLQn0Wwai0SUqEG7pFNCZIKGrZVbGjfRf7FwOBejYL2xkIVpLkmPb70FMd8LZUxX6GNtgPpbUV66BUC+6btbGsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8807

Hi Claudiu,

Thanks for the patch.

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 November 2024 10:50
> Subject: [PATCH v2 03/25] dt-bindings: clock: versaclock3: Document 5L350=
23 Versa3 clock generator
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> There are some differences b/w 5L35023 and 5P35023 Versa3 clock generator=
 variants but the same driver
> could be used with minimal adjustments. The identified differences are PL=
L2 Fvco, the clock sel bit
> for SE2 clock and different default values for some registers.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>=20
> Changes in v2:
> - collected tags
>=20
>  Documentation/devicetree/bindings/clock/renesas,5p35023.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> index 42b6f80613f3..162d38035188 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> @@ -31,6 +31,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - renesas,5l35023
>        - renesas,5p35023
>=20
>    reg:
> --
> 2.39.2


