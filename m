Return-Path: <linux-gpio+bounces-30297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC9BD05B5B
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 20:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D3103010FFF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7034A326D51;
	Thu,  8 Jan 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="buKr53Hz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5396A32692C;
	Thu,  8 Jan 2026 18:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767898606; cv=fail; b=qBcR30Ud52KSUEXyYoEcQp1fMxHztwz2xQGkJNormUljPtxjhx6485pcrIc963V0cRrTZwwgYtRn0ZKhPM3nm4DFwP35xvPxpspOr0/HhiYIOvMs+qpRzeoyXU8AMPaJPwrQvbVIAakBFO35SWEMRAqdMuZE411ZxeccS5K3Fr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767898606; c=relaxed/simple;
	bh=7XyXNGWQl9a0fA9wf05avvuobhTXCjUxmWvrO+cYG3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s0jwppzvZEwk3L0tucCKWeHxIvOtcn/3THV/bDcLke3R+uYQzdYpZMTtuH08O/PfE0THZjzlgwLGyHyaUn0Rv9RPwNcqa6CEWhzSDsuq4kkHtTzb3V/kuYx5wcyIWXveZT18B5KeVwlRJVjMDx4cZBYtQmSQ8k5z1zQ+eG46q3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=buKr53Hz; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4KRFn0KxKeaAFGvVSgpETWP1Firvnvw0aa+/nxFfxZOWE9YgHyuTGu2l7Smab7KB48zcQXrFzkxa15CPaODVpQF/9sodEPpyehjRnN/WKLs45gyIlpnBGuGRd/Ngiq5R0QcGD8LuAKAb5TwVIZWNuSlbfwPLs8VHYGlaeXjfq3oWTcz0fYn/eM2FxjLohT2J8gLJs4RNgOzHMG6KLXvDpovr6rxZexGlPTRLiv2Sv1WkLxY1c5fKevOLlfFj/5ofWQkORWv7XjQ2dx5SjsBh+c8jRZ6h2Bj23JQuAqbD3BSFveuXP28DBBCQzrYLWvBxyh4KwExBeLXjdzK9QlChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhhwBcnwfWrczn4IcmqYtFEKjXHjyssPTyyqG7hpOOI=;
 b=kGERO7Jwyi0H2vl2LkUDOeXS5ydPsogG4qKVXIz8FLZH9QSD+UWD1PrNy87DKFM3cgQZ/lfWLnk28P7vsLuB1zZC/Tn3N3z1DgPYtSKGvUH5PQWG0s51EBvahVjGHPZwTGKY+sNitrYWcAn0hx9/oQaCjMRY8jaLOCsPRD9Ozg+ixHWIa7c1c8bW/3d8KSttGgRxErXjDrn1jQPULw+3uFP9KVqw1oUO6CPLM0vkFb2BCYJghvW9tpgLVG/q0lGNRxc+y/x6MkxklOdx2QttGM2fj6Y0BiN7Vr2dL6Jiqx2dTpUmYCFt4fAYC+qtGWKBwMFfrJx3vwvvgAEk10bESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhhwBcnwfWrczn4IcmqYtFEKjXHjyssPTyyqG7hpOOI=;
 b=buKr53HzXlAuystCOZO9rEc3cLpnTn4vgE+UgyaggFp3WJ3pbzYKZ95m8Zy6/CNimGfBDSozUxhummdzji9vxwp+NnlVx9uSo7xhCI6stzZYG1ROMQhmoJGpTtQak6BYVgtNIVqWzjHJFz4NgEcGexiVW5ohjT7z3QaI5n9qNUs=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYWPR01MB10003.jpnprd01.prod.outlook.com
 (2603:1096:400:1e3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Thu, 8 Jan
 2026 18:56:39 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9520.000; Thu, 8 Jan 2026
 18:56:39 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
Thread-Topic: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
Thread-Index: AQHcZfhdZsIwObSoc0SAQeXjJaQ2kbVIvSyAgAADA2A=
Date: Thu, 8 Jan 2026 18:56:39 +0000
Message-ID:
 <TYRPR01MB15619ED191A00BDE5087CF1DC8585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYWPR01MB10003:EE_
x-ms-office365-filtering-correlation-id: 472730a7-7ed7-4851-8011-08de4ee7a7cc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?k/Vp1zlDSI2uzh3EpRJXJaJ9x9Kutg0MQdfxDOs69VNe3BQb3NecpcBK+dj8?=
 =?us-ascii?Q?jtX4li2/jjcmloXQeCwnkrRFf0aXVjSzSw9+g5cK8yCAOgC6dqh1p9KYPxCb?=
 =?us-ascii?Q?OH8o1EHhC/bXmW0t9jKRe2gCU94FwPUuxejOdrUaGgLyWxWSnP97L4YEQm7T?=
 =?us-ascii?Q?Mv5v2p+XinKT5s00ve+luL6ib1sUk+FPKx5wiqKtXXlQrqzxlo/Okn/btYjT?=
 =?us-ascii?Q?x4tMr7Uje0skftjHGj7GcoxozX5irtLpifttaZZMgjzs6FXyFpmN/gcglx2K?=
 =?us-ascii?Q?iQVpA+5M6+X/Ns85x7Lqu6FvUAHqSWVTlWKTtLY5MY7uswcqJOcI/DNM+zjt?=
 =?us-ascii?Q?AvvRT9Dj+ft4dRfhIVnfSQ8hh+XixhDUBRD/Yc3E5t2oeVfOk6wUWTjycFba?=
 =?us-ascii?Q?Kes65pvZq/RURou4dCIrnibB67mKVfpcZkOgGWWFPDU/ISEWZVg77vAtctFd?=
 =?us-ascii?Q?o+RxO37ExwQVS9MHFWvmrqSJ85UrPXwsgS0zcrsPOlIZ+f3cZHRitdhoS0KS?=
 =?us-ascii?Q?VlnUSudyzkNBzN/KX65NuRBc+der4XXUvQ44K4P7hlB1GU/If+YmS/cglPAZ?=
 =?us-ascii?Q?/9DIQ/v5Kzm8vvhV3bB40H3JlUOlEvxo2nelYF8a91M34h96fBCWTHKFCOfN?=
 =?us-ascii?Q?TRL+yz1zoQPD2Hcc7ApZEYSdmW8s3H1h94w6chqGxVnJujHXoiRoi8DEK3MX?=
 =?us-ascii?Q?eK4WkEkJUqVF10Ur9IFuysoXcBp9k3UpEmEENVzKB7D/mGPApS2aWNgow/eK?=
 =?us-ascii?Q?gmaroU6M9pW//6kppkOGeIFfdGwbVCHiVn35qNia1HLdXyIyAGU54ITNhZ84?=
 =?us-ascii?Q?nOdrCSU2v+gPzo3jyuxbyWwa1K+Z92zd7it6WjvtpTOeT6PNE1uhD/3Jn2L1?=
 =?us-ascii?Q?aDFFxgtJajCi36WCl5eQiSTuPLpQzN4AivT9uSttG9s11JZmZMw8DpGQNodz?=
 =?us-ascii?Q?6QkFn7tHYLohO0jyM/Ohu50HIasD0Rk0ZS+8gA4IHfIAx5KktVj4nHJQ6R3F?=
 =?us-ascii?Q?Pfl+4jpPezWQNanamtCu0T4lrOkhkXzjsxmYus3hdXC5pDFv0Lgvu3Zrh+y/?=
 =?us-ascii?Q?+UuuzCJni70otrZaISBgg4v5wckIdelJC52qiKDRVf0T9iC7ftJJH2UdyaGd?=
 =?us-ascii?Q?2Uo3AiWIwCt2liQSz+s/ysOb9mVonO3RfzEsJXNiE2RPwWPKLL6u/tLhRG6p?=
 =?us-ascii?Q?fB7yxV2bZIdwJlD8/TsotldLLH8nbSXKpARPAr0Ko9Jue57XvRufMQlc1fG6?=
 =?us-ascii?Q?ifWTPj5vNzv8MGkzINbFbJzTHX8SyD4jswg02eqsI3Be/LIQCicvQesNGCvr?=
 =?us-ascii?Q?pnzU5XzPEPf1JMCq/7aVivZN9AEH+w4VpJu+SDleEW0iE0rV+jNtgZrwHDXg?=
 =?us-ascii?Q?1QWcm3vCx571TjreWal8ZmO3T/DxA54LE7//EoFY75SHTkDECUs+I2cTpi0Y?=
 =?us-ascii?Q?sidnn8Gu01OpQP7XgvRMK4EjbCNVb7LTSR8yblA7fX/PS7SNCd2x4pz4Zfu0?=
 =?us-ascii?Q?TNTRWj7EvC8Au2YOB/Yx/Yob0X2JW/v9wd54?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ev6o9J6NnhmUnRBGT9DKOjjFT3ayu95lxQyAGiOgH7cNuDcdApDcpw9ZQlIP?=
 =?us-ascii?Q?ANH0n6w03XTmbH32rN/ROOkf8tLzpXa+7zHTuePdQgExcBFn53xkALgdEczn?=
 =?us-ascii?Q?FkCg1phFMNaRbjefyOiYDPmIxvngjlYT31YBAU1Xwt8hOgcuGNHxHwbwWitA?=
 =?us-ascii?Q?q3s9KmrTciVM8HcUUCoNRQ/rOduSWdBMDINSIkxtihhMqYml0Fq/ndxnqNlO?=
 =?us-ascii?Q?BJifivv2V7sA+HjDFr2qxVI3ex5K1bU3aKVPEC5ioSU7JX3BY8ok4Pvyrqao?=
 =?us-ascii?Q?O5K9KEydR1+sO9h04QH9j7PX02gkJyYFk8S5y0uuboBiiURwXnfwCl9wRJDf?=
 =?us-ascii?Q?eZwKVVxWgHDJLUO2FdsUiMsjlPKkHwWXRM2bvYXiU6dDAfpsYY909GalT1ER?=
 =?us-ascii?Q?t7vyC/lk/OzAM6fa4+fNxDPfS1JESfRsdDJwKbZsbt3KYL10jx+2MntlnYsQ?=
 =?us-ascii?Q?HcA78h+3+LZa4BsoW6vY3hyawzOiiTwoVcb2K9nC3fw8sYE0SFmM14m6g2sq?=
 =?us-ascii?Q?hz4A2p9yifwmjzX8RlPY5Rxh/SyaCGf1LktGlaUoxncTGg0G2G29OXEoZ2h9?=
 =?us-ascii?Q?k6UFeFql+DNows2lS/ElracPprFl4A1s3EknqZr89+i2SIWTJYs8y/YKFhV0?=
 =?us-ascii?Q?Vae5L7QlCQWaxZn2gqmOWM7RvKHboT227zmEPF35pFiyDW1DC0Pt+QitCH66?=
 =?us-ascii?Q?FKw9FGA60YVboG+4n4xpIbNXUQhpS/G7ZUQkSZA8RxhqUdmEfPJqmOx7J4Bb?=
 =?us-ascii?Q?yGHR26/yF/C+eUovIHxUT+QUH1DANUHfJUYFW2oeJ8GpHDZt8N/JT64tExmD?=
 =?us-ascii?Q?hbvWAnUtreK5A1CXaAIOBR5c8pMcifJu/8fcZEodm9pwrT/pBrFlTkpk7EMk?=
 =?us-ascii?Q?G65if4RLnLup4he1n/m2wXfRfghMHjM60E0sOQ83oeh6NUMaRyu2IVMq0cIY?=
 =?us-ascii?Q?43fGyVel5fon0frH9jzgGzPzHbIUoing+SH/T3N3/fEluRVV1TL+CG9fZ3zm?=
 =?us-ascii?Q?gvodF5FXz8CGnfhzJOaDY3HOj+AMkcbbUyAMXqruGQiNhmiw7E1xfgIIgQ8J?=
 =?us-ascii?Q?R1jYepZsqo0WTitPTo832STMUuCfRnm4ZSm7XC8oNcfOI/F4j1A3hm4F+qGG?=
 =?us-ascii?Q?isLMx6aFRIsaGz4zTmIkBubVdu/Zpt8O7uhjrILLlnitaU7LbOERPE1NipRP?=
 =?us-ascii?Q?Z2BDOx2Pnl9CvUF6GJHuchSgloou7Op2QpCFRYy5WrjY7BKQVvw83hRa/KV+?=
 =?us-ascii?Q?SbmhpMAQ7ufOt7f5vjUqpKWRTlOmU/zUh/MgfesZRboEVfCJAx8cuPe0yL2A?=
 =?us-ascii?Q?RtnqOcGRTyXVRt5QG7aGxw0f3ZMBxsbYynOlPB9ZrDzaM9dzVzNevzbIGGyO?=
 =?us-ascii?Q?H6+37UaFBL3S29LSlEvY6MPlFWdw6WBxT+d74STzHYbisvb4/47iCNZ3+DIo?=
 =?us-ascii?Q?ifqlkvwsXwVnk73QpR7gMj1nc9XH3nUPHioOCFE4Qq5+WSPxaheeuhPnF08/?=
 =?us-ascii?Q?yocWf5m94WTQEmC9Cm8fxvFGGgWKqzdb28ekvN6hi6gllIeDQ8VQVMRRKfmq?=
 =?us-ascii?Q?H+l2m9REfZKpkCbgN+yUzUo22x0vjgEYH9hpe8rckO39uzXr7Kl/ImYuvDZo?=
 =?us-ascii?Q?SFBiEJu3i8p9429ryZmpdMrbx58LlggwBtz8eoWK5UtqA4toTa7UybvgTQ5c?=
 =?us-ascii?Q?DDEqNrDxTLvjEXv9Edp70s99CNOfNJ7v6NxFL+fR2FvZITzCJLyNTS23+tS/?=
 =?us-ascii?Q?7I6ybORSALOu+U/F6jVByq7wMTfNwZdJF0gTYnICQytwM1zIsiEn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472730a7-7ed7-4851-8011-08de4ee7a7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 18:56:39.2735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86g16WN+kfbbfJbwK3S8nFpcPm3xwEfJs0klvAYmm1j8FLwJqctX3ySLmB3zKf3mrExi6dJW6VVuWRLoN/Yrbwv/SKedx4id1f2c3XGdKAw6AGjT+eenSsbOp92Z0BoR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10003

> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Thursday, January 8, 2026 7:31 PM
>=20
> Hi Cosmin,
>=20
> On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
> <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> > IRQ-capable pins handled by the ICU, which forwards them to the GIC.
> >
> > The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> > and the mapping is not configurable.
> >
> > Add a GPIO IRQ chip to the pin controller that can be used to configure
> > these pins as IRQ lines.
> >
> > The pin controller places the requested pins into IRQ function,
> > disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> > functionality to the parent IRQ domain, the ICU. The ICU does level
> > translation and then forwards other functionality to the GIC.
> >
> > Wakeup capability is implemented by placing the entire pin controller o=
n
> > the wakeup path if any pins are requested to be wakeup-capable.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>=20
> > @@ -644,14 +650,194 @@ static const char * const rzt2h_gpio_names[] =3D=
 {
> >         "P35_0", "P35_1", "P35_2", "P35_3", "P35_4", "P35_5", "P35_6", =
"P35_7",
> >  };
> >
> > +/*
> > + * Interrupts 0-15 are for INTCPUn, which are not exposed externally.
> > + * Interrupts 16-31 are for IRQn. SEI is 32.
>=20
> Isn't SEI 406, and DMAC0_INT0 32?
>=20

406 is the SPI number, but the IRQ parent of the pinctrl chip is the ICU,
not the GIC.

The ICU has the SPI interrupts inside the interrupts array in device tree,
so this index is an index into that array, as that's how translation is
done in the ICU driver. See rzt2h_icu_parse_interrupts().

SEI particularly works just fine as it was tested using the user switch.

I think the #interrupt-cells descriptions inside the
renesas,r9a09g077-icu.yaml and renesas,rzv2h-icu.yaml files need adjusting.

My bad that I didn't catch those mistakes.

> > + * This table matches the information found in User Manual's Table 17.=
2,
> > + * List of multiplexed pin configurations (5 of 51).
>=20
> 3-6 of 51
>=20
> However, the mapping is much easier to derive from the "Interrupt" rows
> in the various tables in Section 17.5 ("Multiplexed Pin Configurations"),
> as these match the order in rzt2h_gpio_irq_map[].
>=20

Do you want me to change the comment?

> > + * RZ/N2H has the same GPIO to IRQ mapping, except for the pins which
> > + * are not present.
> > + */
> > +static const u8 rzt2h_gpio_irq_map[] =3D {
> > +       32, 16, 17, 18, 19,  0, 20, 21,
>=20
> s/32/406/, but that doesn't fit in u8, and would overflow .used_irqs[],
> so you probably should translate it in the code instead.
>=20

See above.

> > +       22,  0,  0,  0,  0,  0,  0,  0,
> > +       23, 24, 25, 26, 27,  0,  0,  0,
> > +        0,  0, 28, 29, 30, 31,  0,  0,
> > +        0,  0,  0,  0,  0, 32, 16, 17,
> > +       18, 19, 20, 21, 22,  0,  0,  0,
> > +        0,  0, 24, 25, 26, 27,  0, 28,
> > +       29, 30, 31,  0,  0,  0,  0,  0,
> > +        0,  0,  0,  0,  0, 24, 32, 16,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +       20, 23, 17, 18, 19,  0, 16, 25,
> > +       29, 20, 21, 22, 23,  0,  0,  0,
> > +        0,  0,  0,  0, 17,  0,  0, 18,
> > +        0,  0, 19,  0,  0, 20,  0, 30,
> > +       21,  0,  0, 22,  0,  0, 24, 25,
> > +        0,  0,  0,  0,  0, 16, 17,  0,
> > +       18,  0,  0, 26, 27,  0,  0,  0,
> > +       28, 29, 30, 31,  0,  0,  0,  0,
> > +       23, 31, 32, 16, 17, 18, 19, 20,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +       27,  0,  0, 21, 22, 23, 24, 25,
> > +       26,  0,  0,  0,  0,  0,  0,  0,
> > +       27, 28, 29, 30, 31,  0,  0,  0,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +        0,  0,  0,  0,  0, 28, 32, 16,
> > +       17, 18, 19,  0,  0,  0,  0, 20,
> > +       21, 22, 23,  0,  0,  0,  0,  0,
> > +        0,  0,  0,  0, 24, 25,  0,  0,
> > +        0,  0, 26, 27,  0,  0,  0, 30,
> > +        0, 29,  0,  0,  0,  0,  0,  0,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +        0,  0,  0, 28, 29, 30, 31,  0,
> > +        0,  0,  0,  0,  0,  0,  0, 30,
> > +        0,  0,  0,  0,  0,  0,  0,  0,
> > +};
>=20
> > +static int rzt2h_pinctrl_suspend_noirq(struct device *dev)
> > +{
> > +       struct rzt2h_pinctrl *pctrl =3D dev_get_drvdata(dev);
> > +
> > +       if (atomic_read(&pctrl->wakeup_path))
> > +               device_set_wakeup_path(dev);
> > +
> > +       return 0;
> > +}
>=20
> Please move this function closer to the location where it is used,
> i.e. just above rzt2h_pinctrl_pm_ops.
>=20

Ack.

> >+ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> >+                                            unsigned int child,
> >+                                            unsigned int child_type,
> >+                                            unsigned int *parent,
> >+                                            unsigned int *parent_type)
> >+ {
> >+        struct rzt2h_pinctrl *pctrl =3D gpiochip_get_data(gc);
> >+        u8 port =3D RZT2H_PIN_ID_TO_PORT(child);
> >+        u8 pin =3D RZT2H_PIN_ID_TO_PIN(child);
> >+        u8 parent_irq;
> >+
> >+        parent_irq =3D rzt2h_gpio_irq_map[child];
> >+        if (parent_irq < RZT2H_INTERRUPTS_START)
>=20
> Or !parent_irq, cfr. the check in rzt2h_gpio_init_irq_valid_mask()?
>=20

This was done to make sure that the parent_irq - RZT2H_INTERRUPTS_START
operation below cannot possibly underflow. The same check makes less
sense in the context of rzt2h_gpio_init_irq_valid_mask(). With this
extra information, what would you like me to change?

> >+                return -EINVAL;
> >+
> >+        if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> >+                             pctrl->used_irqs))
> >+                return -EBUSY;
> >+
> >+        rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT=
);
> >+
> >+        *parent =3D parent_irq;
> >+        *parent_type =3D child_type;
> >+
> >+        return 0;
> >+ }
>=20
> > +
> >  static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
> >  {
> >         struct pinctrl_gpio_range *range =3D &pctrl->gpio_range;
> >         struct gpio_chip *chip =3D &pctrl->gpio_chip;
> > +       struct device_node *np =3D pctrl->dev->of_node;
> > +       struct irq_domain *parent_domain;
> >         struct device *dev =3D pctrl->dev;
> >         struct of_phandle_args of_args;
> > +       struct device_node *parent_np;
> > +       struct gpio_irq_chip *girq;
> >         int ret;
> >
> > +       parent_np =3D of_irq_find_parent(np);
> > +       if (!parent_np)
> > +               return -ENXIO;
>=20
> Despite your claim that the interrupts properties are optional,
> I think  this will abort probing when they are actually missing?
>=20

It won't, it will just use whatever parent interrupt controller
it can find (GIC in this case). I tested it.

interrupt-parent is implicitly allowed on any node so it's not
useful to add it to the bindings. And we cannot mark it as
required because it breaks compatibility.

But, without ICU being set as the interrupt-parent, the parent
returned here will depend on the structure of the device tree,
as interrupt-parent can be set at any level.

With the current device tree structure, it will return the GIC
if the interrupt-parent is missing on the pinctrl node.

Without #interrupt-cells, no one will be able to reference the
interrupt controller created by the pinctrl. And if
#interrupt-cells is present then surely interrupt-parent will be
there too.

I think we can leave the parent domain finding as-is but we should
 guard GPIO's irqchip initialization using

if (of_property_present(np, "interrupt-parent") {...}

so that an IRQ chip with the wrong parent is not created, even if
it cannot be referenced in any way.

What do you think?

> > +
> > +       parent_domain =3D irq_find_host(parent_np);
> > +       of_node_put(parent_np);
> > +       if (!parent_domain)
> > +               return -EPROBE_DEFER;
> > +
> >         ret =3D of_parse_phandle_with_fixed_args(dev->of_node, "gpio-ra=
nges", 3, 0, &of_args);
> >         if (ret)
> >                 return dev_err_probe(dev, ret, "Unable to parse gpio-ra=
nges\n");
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

