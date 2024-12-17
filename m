Return-Path: <linux-gpio+bounces-13958-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E69F4B02
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 13:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10DD716DB29
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 12:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C1F1F12E4;
	Tue, 17 Dec 2024 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NJ9NbTd9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3DE12C475;
	Tue, 17 Dec 2024 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438832; cv=fail; b=lSHH9U/5iOhO7lY5+0ZGFtB4R0URZ+1GXFs8m7KWu3l4Z7irzNeJ3X39mcyXq9JDw/nyCNulaKnC8+SJUbeyIgIHsC4LCKcGSDAEP65Js133oYP5ewI8MLgb6biNr+K6vM3q0kBI+B4z+Io5+E6jfN9lP55C0Hmn/oZXJpxPAJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438832; c=relaxed/simple;
	bh=Z+hGX9i6axfOVxcRGD1aw72v6fVG3mxo+ILeUJcUAXQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R+6DCH9aBPeZt7WC+mpF0qW8vF2/Fcar8UufNQGRmTN1nqT9/iCummojWoktwsm8ZlkNPub4/dWnoNXZO+OrdrVA9zH/HqoJ3tb/wocO0fSiDkHNmCtsAqpKP7nB+02zEOSFfwsoyRMVV2VfqCgggwcZhVjZmLRr0DcFa4RBI8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NJ9NbTd9; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsWBv8pqvI/6iovy4TLUZE4PeaLNYYOcY5h56IVnDMdGX+8+aPY8tHCmZ5av94xFxjseCfj4ximNFRhu7L7w+6BCWmi33Iig3gz8uqDtOGHXahZnWqYajuMSj7maQAYMWPmBF//rVw+Tr+FX66EfIw6J1Pp7loFFzVAh3oExXC+TlvpUpUGx77T2oSQRo9NqLPeD9t4snv2CNmeBUnl+tSv44qXlV+2HZ3SizGGYG1FHK6XZWYwr8p2W7yLBBbURefFEMMS9jmPA8nJuz8YU7J7uEBJ2/rk3Wf9lwtA227lXRomPSS1utwPGNug1esUOacRXAruQL8Sb6WGHHXttIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0diShOmkd3HZ7/Lo6/RCQ6bYBJddNtoOiT6dHaVvxI8=;
 b=R8AK1eqO2HTxpAWlK42WZ/L45p3YSgH5o69btPSm3MVYB7jG3NUE+tnu5j62EsaARkRv/Mzmmz3ldCgqhnXZDFhsOljw8W9C28uR7bnNQASLSlQpVc/BUuQjha7Qrb8699/j6g/lgorIGPp3dFtOGPKH5QpPLL7qzrReX+QvpbHNDD7rbqSqii+v73w9gYC3qm9bE/46ubmlYE2wCgIgeTyj4aF1YHzPIOgOykIxXUWMOZcygplbBQ1RCQpQgkQ4LYIlQwo4M79CwP9fDyz9WE8Q+OOw46x+ES1JKUY242iTnUKhBZRDvid8YpZSIYTlaGVDWH4QstvHcZ5ngJSF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0diShOmkd3HZ7/Lo6/RCQ6bYBJddNtoOiT6dHaVvxI8=;
 b=NJ9NbTd9Rb+p8OaYmFJ4nLlIMtlahcgldLQ/1Or3BXH6SFNd1tC+JPBlerQypNb3MidTYKIVLO+Ta1J/uPiAQ4cPCewXSSAzAFgEVd5YfEvtIP32ug7mmI+AnGY6RdvZIm7dH1xeH42I+TitXEaCBRLXNxQ11phzQziFXEyk3Go=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13432.jpnprd01.prod.outlook.com (2603:1096:405:1bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 12:33:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 12:33:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
Thread-Topic: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Thread-Index: AQHbT/Q3WD6tdQXPjkGBdqOWiVuV17LqVg8AgAABJcA=
Date: Tue, 17 Dec 2024 12:33:45 +0000
Message-ID:
 <TY3PR01MB11346412D98C6644E51B253BB86042@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
 <20241217115828.GA859895-robh@kernel.org>
In-Reply-To: <20241217115828.GA859895-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13432:EE_
x-ms-office365-filtering-correlation-id: 02e6294b-70da-4d6b-7578-08dd1e970cb5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tdbAuDpHwzuT2VNxJuKAj8UkFlNk+qk15LRicOJwDViNT/2mm2VRAgPVVfIo?=
 =?us-ascii?Q?4PVqCkNc0aMBrUrYhrmNz/GAOx/irF6UYpG3WpHcu0VY7yjjA9tZGtJZBMSJ?=
 =?us-ascii?Q?d9ZuSH4EZr84xRK0X2tSEbKR48juAU3TRHyOB3fimvS6vZlEsVZlju8jwdiE?=
 =?us-ascii?Q?TL0l8uHT0ThB1pv36i0Kkc1e1ipjXnsVF0uF2rRAzconRdb4w3Cp7Ul0cKr8?=
 =?us-ascii?Q?48lxylzUnva5gwFT4VrkCz0nGWyp/WZWHb1xElmM/tLuNtTfigZ+LUMJsiTr?=
 =?us-ascii?Q?im0SQocAF3pcnd7Z2jH9nChKSatMiiIBlGw4bUm0QMdS8uFN7iag1YJJ2XeG?=
 =?us-ascii?Q?PAnQDZjKpq9EzBOZxi6AbVXfUI9EXvXIwkCJdFFgcotW1kT+rSJ7G9Ufl9Fe?=
 =?us-ascii?Q?QY1cGbEuuL7oDUI08ub2mridXDwRUyIUuxPPuiNuCaUU4hQ4q+kt3fwpAaiz?=
 =?us-ascii?Q?3HFZtLVkRBicVO2DAs5HXUbpR0yv2GGDr4zDNXEloEtG09JH57E+rXytnRq1?=
 =?us-ascii?Q?nZkixZ/Kvtu4hkbsuxOSUedX/PmuIG492t/V87iq3mdrnwyOpZlwWf5JOkwa?=
 =?us-ascii?Q?IYWL7K72NVJyERYVbg/zq6L8GkjnPGaAA8dMdThtzGuqnBTAVN7FcsUYndEH?=
 =?us-ascii?Q?tEL0cAHOjTPz0rUBS74iEwTtedAnBb5ogYsDO7iNMvONkAGjk1uXKNnkfTkC?=
 =?us-ascii?Q?UOj0Ync4lzxu9XEnhIf50PtHlZcZV9QuzxiyebkyOnjRsReqUYxx93vBRLIO?=
 =?us-ascii?Q?fXgQ8pVK3qbGQyuQsGY8e0ZkoS7GYoF7IfaEvlr958JXekTcS6DWLiMVSTpx?=
 =?us-ascii?Q?z/U7W6qRD5cqz9fVVjnZMorCScEY48scE0IfqaTMKz6wZufdsY7Y8x0Yi920?=
 =?us-ascii?Q?VGpKD8j3pZNEXvHIiwthfHPMBnhNrH1zruOX103fTQn/geddzDdsEDYj+uy8?=
 =?us-ascii?Q?xIXi8IGUpqyafsGBQTzC4SrzRGLjtiZjfwOlzT1FW1uH9XSZSBHeMFZ1NRoO?=
 =?us-ascii?Q?mgEvL5X0ASyDiBf7UIz9k8wqCX7O6HseYbtFXYCKFMLTDn97cooFWj7Ydtt3?=
 =?us-ascii?Q?WCfE+7asvB+sjlJ+rAiDrWnWzIn5/DQ06bEoZJ8On8hjXQr0kqzOdC8zs0Hr?=
 =?us-ascii?Q?/oOQh3DMtT8+4viiq8QDtKMcx5rHjg1wo6zBmZ+7wVY2twLiCY/NaqU0mmM5?=
 =?us-ascii?Q?yjQlxhKdL9uBkmtk+VehbdToCDWDgN9Eivde8bamwGEdRiIr4q8gz/ze+b20?=
 =?us-ascii?Q?Kv9dMnQ3qJsI/Exm9n3bHbPFULAQxdT7YjJJadnKEU04nmEQk7STxNLW4C5j?=
 =?us-ascii?Q?i6BYrGyt2R2j6d054K7zOCj0VfdLuShAw2R0FKPwUDC6Giz6K3BOdBlFkG9Y?=
 =?us-ascii?Q?zu1tEDQwL8auPFzPUjMDF7HzQZ8bzDrnTxal704H3hrRJwafWyfUeborKYrj?=
 =?us-ascii?Q?CzpAIQ67zxmboIJDazItEfP+PF5kWd8D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TsNIz0uJge7UaVcewolKBGV59ESvUQwNg6gRshHoRHEhIk5NgFbc5jFsdAEp?=
 =?us-ascii?Q?0hSx7cmzZUQZ3fNWIy25PHf0MTX55hG///UUjiMpe73tSs1Sgm4ip9BGBlSs?=
 =?us-ascii?Q?+12obcauwRf3k6+IYG7B+6NPzKxA0O6/HiwUYShRASZxKrsY+BdCKAAD52N5?=
 =?us-ascii?Q?d6aZe+hyGEbSuLQYFuqU6CBuPt3VhWmDYOTWQBa0HMcPo0gH2jg4IQaArcdb?=
 =?us-ascii?Q?b9G5ihgcibbfyOgYbyHlPEvkxiIXIrFukQ/7eAwex8JS4i52Q7RjVEthjXnH?=
 =?us-ascii?Q?KDTGfdEbQ5e+CjbkwC+ogb0pJXsSB299zfsb8itB9LikPy6hxurLAsk8ex4q?=
 =?us-ascii?Q?8mtr61DN06/KsXGEMBiie+ylX8QwlnRGE2fTY6HhxnL61YSlsWIe9ePxD0O/?=
 =?us-ascii?Q?aNlsdDC/D4iTgpm6aA5pFaQY8owCeLK9oMdCYa/Bif0D3Fji3LZK8ZFhLIQD?=
 =?us-ascii?Q?nb9NEGnshl3RQiV+u6MJbqY/pz1GTPzNwzMJKG1xNFeuQZez0RM7wXbp3RrE?=
 =?us-ascii?Q?7TvCQmvpJ57L9yg2dK20ngAxmzbfyvBHjpUs9tBqtpp0SsfaTe92guFE7kuE?=
 =?us-ascii?Q?WALQLgQPNqZodwoEgxBa5CTfPXNm9W9mosyW4cQQdpCldwr9SXzlESh18Zf+?=
 =?us-ascii?Q?bJGAk4Ath0dSYYstYKqpYwF8fJjmQkTU6XBv0syY2/FRCmEgfPX11hZbn102?=
 =?us-ascii?Q?4b/UG17VjWMQNeQSmo3OgcjLpUrkiXu8LBDRZNU/qTNfEFF/IOxhVHoqTF1c?=
 =?us-ascii?Q?xFqYG4992yAVAbCuEbRLVIMoPBOjfh9ICwM3f5AuWAuT2JAIoMOYep3jxysh?=
 =?us-ascii?Q?isX973aniyVwcCOePAYMP1upG0ZiYC4735BXqXek1rvw+XRbIP0HLaRJuiCl?=
 =?us-ascii?Q?CcRCAckIrU35+2XVrlrF1paAHmp85hmcKwZjOqwGDLNOWZ9M2ri696/4k2KC?=
 =?us-ascii?Q?AtHGJdNaRQmUQ/j2FPufTR1n8xmrJJjRbJ/77mg0PYYe1DQRnw2TvPt5qevv?=
 =?us-ascii?Q?xQWlA0MH5b1+nJnZA358HACdDrNG9WL+F48tHBXkQrJHCIYo/G0xZZl/amiA?=
 =?us-ascii?Q?K0+XstMg+iablfLSzhurGOa9maMqNyJHDB0NKYf6nnLIBlfsThhvvYyqjcN7?=
 =?us-ascii?Q?2glQIW1CpSE8kRrOjhmtUscHFdJ+nmVA8dBAgzJlpQa7tWHnt0tmRJf1G/kI?=
 =?us-ascii?Q?SMjUJDmXeEUeTiVWCCWZGBRcSzVbwyNktbKG68pgtCZP7vrN8t/+9TMt3bU2?=
 =?us-ascii?Q?sc+rv2lzgPg3AdlBxQ5kJdeDIQ5kayCiwSscgPJdWLe5SNM+coL0JkgJc4Va?=
 =?us-ascii?Q?EglGtkr2cSJnd6ADCdTqVjHXocyMJzY4rf0ephi2No5pQE5R4vInd1njOJDM?=
 =?us-ascii?Q?Knf8O2ymqom/jJ4zmOECvsxl8ptM4DIqp+YdAVlCF02W15JSmEumunLh90U3?=
 =?us-ascii?Q?Q1gVpA6v61W4EsspKxgLrj4PjedTiYr9NjOozyj+trttYuHDBY9KLQMRX4EG?=
 =?us-ascii?Q?YZUWbWGYNk9pu29ICfIYRNwr8nLK9DJORCmyjmbcwc6/8pwnqt7LlVzvxqhW?=
 =?us-ascii?Q?TMlle3lR63KCyWUYDaRvstGX4EbADC2DD8EX3VCOmS1e7JnnICifsygy0P85?=
 =?us-ascii?Q?ww=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e6294b-70da-4d6b-7578-08dd1e970cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 12:33:45.8438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGgkdUifw5qPcI4Tx5lZxtE1RFT2JuGllPdT+mn0EWcKuqf1NiOeOkJsPg3tzjOGTcuKNk/bay8RBcBLk6uqBFvVK92/X2yd8xTNItWSECc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13432

Hi Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 17 December 2024 11:58
> Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-nume=
rical port support for RZ/V2H
>=20
> On Mon, Dec 16, 2024 at 07:53:11PM +0000, Biju Das wrote:
> > RZ/V2H has ports P0-P9 and PA-PB. Add support for defining
> > alpha-numerical ports in DT using RZV2H_* macros.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v3->v4:
> >  * Added new header file with separate RZV2H_P* definitions.
> > v3:
> >  * New patch.
> > ---
> >  .../pinctrl/renesas,r9a09g057-pinctrl.h       | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644
> > include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> >
> > diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > new file mode 100644
> > index 000000000000..9008a7e71609
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * This header provides constants for Renesas RZ/V2H family pinctrl bi=
ndings.
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + *
> > + */
> > +
> > +#ifndef __DT_BINDINGS_RZV2H_PINCTRL_H #define
> > +__DT_BINDINGS_RZV2H_PINCTRL_H
> > +
> > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > +
> > +/* RZV2H_Px =3D Offset address of PFC_P_mn  - 0x20 */
> > +#define RZV2H_P0	0
> > +#define RZV2H_P1	1
> > +#define RZV2H_P2	2
> > +#define RZV2H_P3	3
> > +#define RZV2H_P4	4
> > +#define RZV2H_P5	5
> > +#define RZV2H_P6	6
> > +#define RZV2H_P7	7
> > +#define RZV2H_P8	8
> > +#define RZV2H_P9	9
> > +#define RZV2H_PA	10
> > +#define RZV2H_PB	11
>=20
> I'm not a fan of defines which are just 'FOO_n n'. And these are if you s=
peak hex.

For RZ/V2H, ports are P{0..9} and P{A..B}, the port name are with in hexa d=
ecimal range

whereas for RZ/G3E SoC,

Ports are P{0..8},P{A..H},P{J..M},PS

RZ/V2H and RZ/G3E are similar SoCs.

>=20
> > +
> > +#define RZV2H_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2H_P##b, p, f)
> > +#define RZV2H_GPIO(port, pin)		RZG2L_GPIO(RZV2H_P##port, pin)
>=20
> So the user does RZV2H_GPIO(A, 123) instead of RZV2H_GPIO(0xA, 123)? Not =
sure the bounds checking the
> port is worth it. pin or function can still be crap.

Previously we were using plain number in DT for RZ/V2H, RZG2L_GPIO(10, pin)=
 =3D RZG2L_GPIO(0xA, pin)
The port names for RZ/G2L are plane number, whereas for RZ/G3E and RZ/V2H i=
t's alpha numeric.

Since RZ/V2H ports are within the hexadecimal range, maybe this header file=
 can be dropped
at least for RZ/V2H??

Any way we are doing bounds check in driver.

Cheers,
Biju


