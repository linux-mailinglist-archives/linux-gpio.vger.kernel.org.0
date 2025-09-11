Return-Path: <linux-gpio+bounces-25939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A402FB52ED5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 12:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7961C851D8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 10:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4BF311970;
	Thu, 11 Sep 2025 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OKAjZge0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2040.outbound.protection.outlook.com [40.107.113.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333C2417C3;
	Thu, 11 Sep 2025 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757587407; cv=fail; b=SNnxumKoVP3lrehahNo28GYc85QMDUP0ClzcW7HgLV07RO+GJVJ+vb8ZBN/g60KunJ3FATwT3UUHWfWoPUlHEzcr3hw1Qtb0ldpLsxe1bcNDHnZeLG8aK6TROAak0iiJSmrETFLjz8LJWKrKGHz3MOk74WHXHuBOQjUgWjjEgQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757587407; c=relaxed/simple;
	bh=toPvSg3DXOjwHoRfgOKtiPMi/4uLfjX7ksoWKJgk75g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OBqvE/G7gr1RfXW513HwzvX8E8aneTVRlpY+MHL4HAZ1Rc//Jt70bjVeDysp431lUvKuS7RVX/r7mQoPo13tbbwwZGPzm4NobkZ5dosQ9s0mLQdZk3iGjXYrVKHNGNgps2zQtpj4Dk8aWezx7LmHHc2Sd0XJQwNbhhFGV0uBUaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OKAjZge0; arc=fail smtp.client-ip=40.107.113.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V66LOLQ2yZfYU+VrEezV32vdbu+HIuSKOWO5zYPylQj3uaBRUXRx4rJHJPvm7+bHq9lPoWFfzuG0exhqXNCRhaKltgOrPrNygGBkfIzNIwJwk9ybYudE9od5r5A0kj7UwN14iR4APayFUHaLPqZW36F1biuWTdFFfKz0QjJ1UpDEzFS8AOq8P475rf9X+T+iqwTHi54/wBS/VksMZo2RmVne33NZPh9BH9S8RMjD1ea6wG8JC66g2fRSUg6VO9AZd+LFKnvTxH5SIhBa448B9cn9pPjpZ4uurIaHifsNyBQCgwhMA7HSKnFEyg+RehGhyVmC+kddAwck4njxb56D5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJ+5x+h6EutH2Dt3iaYcRnG/HdUkaBGdNnp2BMXX5Lg=;
 b=GSwyxhsbplwWyNfGNJ6NEWAhF64MIBn9e+5vGqgjRzYi53o3OyHXscNmMaInOwwTbK/d+OFIcvoUxoNi13Nb5/XTWmEur1mWQ8IwwCUkubHsbQb9UAMKkCKXXmz3+fnLEcbijO14a8CbqLFZeLP4ZMqUEH6J9RytWwXp5yiwblMZlyYp3W7alLF4Lo8NhruBwYeMQm4f0PuEGf142esIojWqWABI4cQdUUPEwNGmxGhFRwz1JT8mgZDy9sqTS1RAqXRldNWzfOn4Wz7RpMJxFNUdnYEoEKFgvF9MZuGn+NwmIXPkEHkjgL0UHe0+gNbsdgHUM/5TNojkJSPMwx2uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJ+5x+h6EutH2Dt3iaYcRnG/HdUkaBGdNnp2BMXX5Lg=;
 b=OKAjZge09zzA+JM7p7prPfKcTjCUfoqJqCaZ8cuAJg04Y1wy0J8LpPcxzV4J+a0mqI/9b8BY5XC101nbE8Ajr6q65SlDN1LHVGUzQTbwO4uiobOPUtaGFz8bHAT2LlUG/SQdQONxa76J3+UQcDKkmalvV10aRFUq2GEL8MtO2E4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12995.jpnprd01.prod.outlook.com (2603:1096:405:1dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 10:43:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 10:43:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
Thread-Topic: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
Thread-Index: AQHcIM7gM4gUjrlV/0KGKodi3f4+P7SNz30w
Date: Thu, 11 Sep 2025 10:43:20 +0000
Message-ID:
 <TY3PR01MB113460BE4B4D20305021D85328609A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12995:EE_
x-ms-office365-filtering-correlation-id: 5514c1fc-e5aa-4e1c-ef80-08ddf1200666
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DKeXyF130wsr6VJl1tQ0pKj0OXilW/mnW1DqFQQxvGhb2rOZ/ly8u4mGh35O?=
 =?us-ascii?Q?DyLOIpK2lyXI8ZaIdNKrp4VaAl3xbgMrt9iUO669zjwMgMl/nK2n2m4vQlDd?=
 =?us-ascii?Q?lFCJId9R1Q32LD3sL8KGvLbPlIrMZtV+lJ1KnnicEPSMEULwixBZ6DVIBFOH?=
 =?us-ascii?Q?5C2Kj1JyZ1u9jzOQ9mzBvMfcdy3WbYQ+fZhhTE5uHmGcg6g9RI6o1SQMjrDo?=
 =?us-ascii?Q?ljhLyVRrw5hDecV/qh/99RiKemFAjjKjmQfXtYgjnPYM3tWx1Lt62unkfvRP?=
 =?us-ascii?Q?hvAaNQk7Yths7iXFQCq/Hoq9c3f50TZ5dVTcOqfKWqSZ0JGqBVLhyfp5+W0z?=
 =?us-ascii?Q?PHiZfpQBneEU0QhvE9Thk1Bp7dzHKQGRsJ67yL9okaxRLT7XEIwdwnKwfG1T?=
 =?us-ascii?Q?2JQqMc0ZrlH4GjC8nvlPOYSBrrzNk/j4CeH+AaQw5/50jwJd7xNtJzU8r7CL?=
 =?us-ascii?Q?g6GA0tVqMIXU6aopmSJwq9893MAULdQey+sUXykpCo/2wu8W/4px7YAS2ugD?=
 =?us-ascii?Q?D65gMoJ2BQqtNd05X3slemI+j5Howb/kYiQ3hWGpnSG8Wvtlm9NJSyoLTNV5?=
 =?us-ascii?Q?qcTVew4+s6Ls8HZ70zyRgw+Ba2NPmeQVabg/WVRtlyjENFnKv2BA947mtON5?=
 =?us-ascii?Q?AMcQIVxqHd4uTHa9c/cgh0nBFOwIV6nDIU0SOsRBa3dK7I7k+5AtPKLwvyLU?=
 =?us-ascii?Q?i5CYCMH4f65EoGJHi6I6nSi3ycGqK2NxgtzIlQ/Wi2fMtmOClByT9WrP4PBU?=
 =?us-ascii?Q?O0hf3ET9mWqEjfalvFc1mN7Z11Hu7V9vjw1HQQOEDDQlKq158xO0pDzDILIb?=
 =?us-ascii?Q?xZ3MUuS11nraYNdkmG+Bj+ifjkAj314QN8E1DWn+qe1nEWG0JPsx6tCYE3cb?=
 =?us-ascii?Q?aKrm65M0mE1qeN7guk5PCldOYpKRGUvrIp6ly0fwNXQ51wp+OyzBUah467Kq?=
 =?us-ascii?Q?FGgtTRvVuV9Hz8JgNolxqftiXHW6dZ1rcLwnjB5nv0Xu2k4wxP0JNDSx7p5R?=
 =?us-ascii?Q?D2+UMdpyLzwwZUIWanad55z9RWZc5uHvhstvMekwunUljaYYvxHECcFqjsWy?=
 =?us-ascii?Q?iz9JqbAOC4jThZ0KZ7+lJxhDiOg9U6daZ7IK+MYmcU/vxBEx6uGN4bqiYTl/?=
 =?us-ascii?Q?FQql0CAe3bxbIwiMKktW3O33kzeUcMHliMLKiM1RIsaWCanH7GXy3ijt7BC2?=
 =?us-ascii?Q?ngIcWLqWj1KBngYabqrFnlb+bgpnSvq/NcV+6Au4M6VzhmkEB9CJ/m2RivTC?=
 =?us-ascii?Q?jqRZXc2nYTi5ASjN7zGVW149GxqVB7zJWI3yvw+OqnRdvlR67MgeTKZrQOqY?=
 =?us-ascii?Q?rczgOyRmXsxyDgY+Zm2uPgZNIGEDViCdXFF1a4FCxDFuVH45l873udYf9HLI?=
 =?us-ascii?Q?KWm4wuX0WjE5VXGn81eOC4F6bQrrwQgIKzmfR7k1iPpMsP+Di7GrVqjv5GiO?=
 =?us-ascii?Q?fyXyeQf/qqTB/t4OKIrUl5zG4q1g4mcxZPx/iRsAstEO+CvLNNPM5cwuIC/w?=
 =?us-ascii?Q?lwFNKItG8V+j5wM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rx6PgEU6Zuf5g5NiVcuIDM0RAt2jA/Y7UVKQ/bK4pyt2gQeDIlLjK3P1VQrR?=
 =?us-ascii?Q?eh0OOjXkRESe+/c+5K42chBbN/9WpjvAxxzwaxnrWKbQm4GOZFqskqYmXN4M?=
 =?us-ascii?Q?C+QpjNzWewwNRONiBm6c1uMx9oTEP3mWokUsba+oHc9z3laTgVleJ69OZilv?=
 =?us-ascii?Q?QO2VP3QDtSINoS8OBCVvyhZsKvZr16GVfQ45eWhFRjJUqw+vQnKyHP4m9AaQ?=
 =?us-ascii?Q?KXKv+OHw3z/skr7V2BAiCTEJ773NWtlzRlMt6qmSRM4TwhpTYYYNKCRaNZf7?=
 =?us-ascii?Q?ze67jmdx0X24cZjQru68/rcERIDsaGTdo0e7O8bT86ySRbTo4ZmdHo6uDvas?=
 =?us-ascii?Q?zMXXVU5FhQVYw2faRf4miAv8dMZwjNLNaRlPHl1+zB8UOS1m6NBWGvXaCRkO?=
 =?us-ascii?Q?3w7Y84j2uEqiWXaBHOcXnQXwP3nJQ2FZfzalrsBDaLrK7JZdktpsKEv00X+P?=
 =?us-ascii?Q?IxYceXyED2UR5FFCR3v+9hX48qjx8LYQrl2mikgksT3CQALvyiwkZxwycSkO?=
 =?us-ascii?Q?ADteDw2w4sD2M+L+kf7SgzEhXd588cbDPLvw1JrmxyIjn3WSY91duDa58W/I?=
 =?us-ascii?Q?+UxobeaiPRftbKTlDJx185sQaHtltKNfIgDbvdvVm5MdS0D+uaGKCSO/ZTlR?=
 =?us-ascii?Q?+d2tJ5NWP9QxQSesjAMpDt78w0PnhaLd+huBPaXdPIcTuWVXy54WMzwaQ69D?=
 =?us-ascii?Q?sdMuSsyb4TSocpL+jVkiTlYEdP/Z/lT03UfixiKz5rcygMOzc7yi5T4Zy/Aj?=
 =?us-ascii?Q?C58P1vSqjFKYfIHnwG41eJSIZYub3k45bUVHHdBhGFrUL3UQ4OgkNuC6Uj2p?=
 =?us-ascii?Q?H18J+SO6ODlUDIJ40iCZQ4k2mZLETY2KyMTYVEvY3p8Pa7gvUQ8lxPXeZMBA?=
 =?us-ascii?Q?gYdg/+I0v50twu+N3PABUALZ0t6DRCMjinxHLzl4EhMyQyYnc55CoxGg2Uza?=
 =?us-ascii?Q?RZdDoYpj6XpCqimUJpcyM1UqDOCJxGIiGaPTPsZ6Dv6IcO5bvuqSoO5zsS/z?=
 =?us-ascii?Q?YAC8+JhEODdr6grTaBZ/DZOn0r3RGAyfv9EXTIp2bycSK2r5RVmCL6CiD/F2?=
 =?us-ascii?Q?8pIql6ZLS2pQZyai/93dqItQ1kIRZyZl/4WLMcD/t3JGeVSr7SKcX2hh0q7b?=
 =?us-ascii?Q?TnobZvgUmg5pwNRyiTDj61jRn62WIULgRVzzdDjH6kgInDLJ3wg3a1kp1TIo?=
 =?us-ascii?Q?j27BpItJqDvvloAHBv3QxqVB4JGgJmU8GADcT6wU7/R9d5Srd2ftynYxAIqi?=
 =?us-ascii?Q?wbmq9x0QXm0/y24m+b2gTpJ8ks8VEOzA3w2isierr7aH7dtNCSWSkr/B0Eyx?=
 =?us-ascii?Q?Hr84bLQnHa/Wo5YZieuz94FCBhRdUBpe3jalS68Lylo1ansHdpRgVB1j3eCg?=
 =?us-ascii?Q?gSbTKWNLZeRaiE2VVtFW7eNt/mPrWiyKlgmQ8VV7AW/i/hYBO4SWnZ4+BmHE?=
 =?us-ascii?Q?gSYA3yNvTztJ8VYNuJCfMSqsasfHccawRAxhhkgY9f4fRrWBQCgsetRcObHk?=
 =?us-ascii?Q?rROInI7LoHVtXiOlUBtWLzMTFUlOgkNZ/qFGlCYUR2i+ErNSzQZkIPd1REVo?=
 =?us-ascii?Q?RKkd2mKYw7Nwb9nDfQSLDybKX9MrS8byhy6CALIxW12gqIzEe5NrCaL5Z+ED?=
 =?us-ascii?Q?FA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5514c1fc-e5aa-4e1c-ef80-08ddf1200666
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 10:43:20.4765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kp0aptvDJrTCg8vgV43QgR7MJw2bREPPcAKEoCKmspIPefMnrFnQ/2nvDJzB4g6sz6idrqjpBNnAcSaE8OS3zlIbQi+uHaJSTILSsgppgKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12995

Hi Claudiu,

> -----Original Message-----
> From: Claudiu <claudiu.beznea@tuxon.dev>
> Sent: 08 September 2025 15:43
> Subject: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in
> gpio_irq_{en,dis}able*()") dropped the configuration of ISEL from
> rzg2l_gpio_irq_enable()/rzg2l_gpio_irq_disable() and moved it to
> rzg2l_gpio_child_to_parent_hwirq()/rzg2l_gpio_irq_domain_free() to fix sp=
urious IRQs.
>=20
> The resume code used rzg2l_gpio_irq_enable() (called from
> rzg2l_gpio_irq_restore()) to reconfigure the wakeup interrupts. Some driv=
ers (e.g. Ethernet) may also
> reconfigure interrupts in their own code, eventually calling rzg2l_gpio_i=
rq_enable(), when these are
> not wakeup interrupts.
>=20
> After commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring IS=
EL in
> gpio_irq_{en,dis}able*()"), ISEL was no longer configured properly after =
resume.
>=20
> Fix this by adding rzg2l_gpio_irq_endisable() back into rzg2l_gpio_irq_en=
able(), and by using its
> unlocked variant in rzg2l_gpio_irq_restore(). Having IRQs enable in rzg2l=
_gpio_irq_enable() should be
> safe with respect to spurious IRQs, as in the probe case IRQs are enabled=
 anyway in
> rzg2l_gpio_child_to_parent_hwirq(). No spurious IRQs were detected on sus=
pend/resume tests (executed on
> RZ/G3S).

IIRC, I believe the issue is ISEL is not restored during resume. Can we res=
tore this register just like
Schmitt register suspend/restore[1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20250911&id=3D837afa592c6234be82acb5d23e0a39e9befdaa85

Cheers,
Biju

>=20
> Fixes: 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in =
gpio_irq_{en,dis}able*(")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index b182b3b8a542..6ae1ee3ffc81 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2428,7 +2428,7 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq=
, struct rzg2l_pinctrl
> *pctrl  }
>=20
>  static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
> -				     unsigned int hwirq, bool enable)
> +				     unsigned int hwirq, bool enable, bool lock)
>  {
>  	const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[hwirq];
>  	u64 *pin_data =3D pin_desc->drv_data;
> @@ -2443,12 +2443,16 @@ static void rzg2l_gpio_irq_endisable(struct rzg2l=
_pinctrl *pctrl,
>  		addr +=3D 4;
>  	}
>=20
> -	spin_lock_irqsave(&pctrl->lock, flags);
> +	if (lock)
> +		spin_lock_irqsave(&pctrl->lock, flags);
> +
>  	if (enable)
>  		writel(readl(addr) | BIT(bit * 8), addr);
>  	else
>  		writel(readl(addr) & ~BIT(bit * 8), addr);
> -	spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +	if (lock)
> +		spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>=20
>  static void rzg2l_gpio_irq_disable(struct irq_data *d) @@ -2460,15 +2464=
,22 @@ static void
> rzg2l_gpio_irq_disable(struct irq_data *d)
>  	gpiochip_disable_irq(gc, hwirq);
>  }
>=20
> -static void rzg2l_gpio_irq_enable(struct irq_data *d)
> +static void rzg2l_gpio_irq_enable_helper(struct irq_data *d, bool lock)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct rzg2l_pinctrl *pctrl =3D container_of(gc, struct rzg2l_pinctrl,
> +gpio_chip);
>  	unsigned int hwirq =3D irqd_to_hwirq(d);
>=20
>  	gpiochip_enable_irq(gc, hwirq);
> +	rzg2l_gpio_irq_endisable(pctrl, hwirq, true, lock);
>  	irq_chip_enable_parent(d);
>  }
>=20
> +static void rzg2l_gpio_irq_enable(struct irq_data *d) {
> +	rzg2l_gpio_irq_enable_helper(d, true); }
> +
>  static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type=
)  {
>  	return irq_chip_set_type_parent(d, type); @@ -2570,7 +2581,7 @@ static =
int
> rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>  		goto err;
>  	}
>=20
> -	rzg2l_gpio_irq_endisable(pctrl, child, true);
> +	rzg2l_gpio_irq_endisable(pctrl, child, true, true);
>  	pctrl->hwirq[irq] =3D child;
>  	irq +=3D pctrl->data->hwcfg->tint_start_index;
>=20
> @@ -2617,7 +2628,7 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pin=
ctrl *pctrl)
>  		spin_lock_irqsave(&pctrl->lock, flags);
>  		ret =3D rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
>  		if (!ret && !irqd_irq_disabled(data))
> -			rzg2l_gpio_irq_enable(data);
> +			rzg2l_gpio_irq_enable_helper(data, false);
>  		spin_unlock_irqrestore(&pctrl->lock, flags);
>=20
>  		if (ret)
> @@ -2640,7 +2651,7 @@ static void rzg2l_gpio_irq_domain_free(struct irq_d=
omain *domain, unsigned int v
>=20
>  		for (i =3D 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
>  			if (pctrl->hwirq[i] =3D=3D hwirq) {
> -				rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
> +				rzg2l_gpio_irq_endisable(pctrl, hwirq, false, true);
>  				rzg2l_gpio_free(gc, hwirq);
>  				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
>  				bitmap_release_region(pctrl->tint_slot, i, get_order(1));
> --
> 2.43.0


