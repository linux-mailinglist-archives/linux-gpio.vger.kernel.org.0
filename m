Return-Path: <linux-gpio+bounces-3036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90B84B77F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 15:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E82D51C21D11
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DC513173B;
	Tue,  6 Feb 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S2hgoH4e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D836DCED;
	Tue,  6 Feb 2024 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228659; cv=fail; b=Gh+fA2zqrLnHvmjwmf+aVKXXtdjBmwOHOnlPJwrdEjV+0ESa7zMz09GFX2Uao2xckvYAo755HCkjo+Yv4K7ZV/BBJn3CxJhvm6TzKo5J3aO7OziU++OzO/siEI8l7omaiZcbDDLU8sMa7+/18BzjYSAjSL09pL6TF9m3tHydHHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228659; c=relaxed/simple;
	bh=cj5aM9lydwPd1zrd2p+A5TsMTkTC6XRjyS77g+7y9qU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fyh0Vfd8tx7GT15RHuS9PHhoABT2UysxW72FcafkzmN3L21Sv0McAsKZSDKevxsZq+7qMyh5+srxg2uG3EVJYmVjw5cdyLEF4B4vxfm1Ms2vLGSlD2Qt0VoMKJzf9aTFC7MUdU0cHmFALidpcooiZeSmX/YsVCLXOqvtyNwWqBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S2hgoH4e; arc=fail smtp.client-ip=40.107.113.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NseZykB+8k+A87sv97F5j6TSrvlOa4DszqZKVuAeUniNg581kpH6azbTDVgZt3qxm+WOf/znk9/5b6C4MWwZRAum76pjNE6jbcvSnkJxhNDOT4qHiDY4ivFZyI1zGZynPp5wdyd94FGFpY2bJLyPqUWiBe50e9u/s21PU4VyRraA6Wm8kAsbxGNYuZr0tSPI2IvDesWoUf3lqaxQuocH5+H8O1SUOrhbSGphHjGuf0WkVUz39c/ePehb/xnukKPeCyyT21JEa5/EGkRPtr109TpLy0JgOYEJyWBq+5O3Svu7vx+tCWMr5GmJTf9z3uehJ/Uazl+jlhZcyZNCR8jxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l47iQuOsHch+dv7Rp7RdyLc4z9PukkAJtGC7NyB3kcY=;
 b=S3iuWw+Dl5aC5ZCF2oct3jGRwxeeS1y73TdzwrCGIzrGxMh56rmcETo6o7171B0Y0V19zQdnuf0Y2px1J5OOsqsDAHQCEbLMU9jgTApCch3wWaUrruwc4qpnteipgYjmmvDTpKDFU5I3txlo8kf8/b/Lnnd6Gp9/cEf+sjEoQU1IUO3E8+jggN+D08jC+4zSXyRzQ4gZw9SwFedYXSUapADzNQoUgnnDe9I+27AuB8GugU/znQs6DKk698gkHUqpSlcyJoBhTnS882OkkIM+LihgXMt5d5KJrv9pSvbtnnzPybUGif+gfOJFGAyPFZvz8cIXo9ipoEFwAG0wqQFt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l47iQuOsHch+dv7Rp7RdyLc4z9PukkAJtGC7NyB3kcY=;
 b=S2hgoH4eFQFkvXV9aNDng/iR3stflzAFWre/m1EllA83Sz9DnkgDD84pkjyBzh509VtSaTTEPkmMn8/q8Hh+/1J1o/pO+zz3D++aQqY8OU9aVsjCy8KLd6VvwC8DD0aBqCVffzSdc5QqA2lzXdA5JNaAqN4RVuK1og3jjiU4xbs=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB12125.jpnprd01.prod.outlook.com
 (2603:1096:400:440::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 14:10:54 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 14:10:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Configure interrupt input
 mode
Thread-Topic: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Configure interrupt
 input mode
Thread-Index: AQHaWQOTXp/ZglMOmUGEWcvqUhnMLLD9WnLQ
Date: Tue, 6 Feb 2024 14:10:53 +0000
Message-ID:
 <TYCPR01MB11269AA49D4149705AE41F1C786462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
 <20240206135115.151218-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240206135115.151218-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB12125:EE_
x-ms-office365-filtering-correlation-id: f4ebb0a2-77c8-4e05-c00c-08dc271d6e6f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /TEy7FraMzqB9SiO1GoYIwU1xz86o7dbZUzLm5bZT44NskOCX0CUtVxOu86fAoswDVLBkPGKPDUBquucupB9u+I5DLB7RZ+beIE0FxqdPu4+3qxcA/ak9f1S8IYi20IIHvUdxqb5YP1r4CMCsp4gV4M4970+RuS66pX7rnV7CvpZ5EyAVx4oLTnJkaU2eTjxGCPy8IYqDrEO6TbBLaNhg/PwPPGOtz6JtuWUB1xTn7svDoH62ORZzPTVGXNJFdtldBJxvamUCz2F+6q4aBTwDYsLRhSTzT/7MwQEqhKY2zMQk8c2I77uD3V4hAjQSgNbJ46aWbcUZzvZzmLBB69W1pT47CQH876n7C6yO/tCqF2hWSCwJ1WOSifZMeSRlMPECClpP1X+0j1l78wcyamKDez4aTrypXoOPngNnW3DBtdLF3cehfyMYN1qpxneN2Cji6ZbtLWf14JIh6CfAU9sgZ84n7VZqR/FOePCqtiK5Qccc1T6CwegrEP2AfGGycnvjdt8s/F21yCUWgp1Mrecv2WgxPP7TI1HPZ3rHepTT1GYXRTiHfK0X4H2P9ek/ySEeyAqwE2oXLFqlGKcu8YBqSFRK9/3EMyn9t91Q37IAkWfpJD9hTMDCP192G7k4506
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(52536014)(2906002)(55016003)(86362001)(41300700001)(83380400001)(38100700002)(122000001)(26005)(7696005)(55236004)(53546011)(6506007)(9686003)(33656002)(64756008)(54906003)(66946007)(66556008)(110136005)(66476007)(66446008)(478600001)(8936002)(71200400001)(76116006)(38070700009)(4326008)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ig54/Dmh1OkAfgluzk6EwKKQ/9QBB91KooxTD1azvEoldhJlWwQjyOZ36MXo?=
 =?us-ascii?Q?WIK/QUbm9m/Nx6L6+TOhE6nIbf5l1su6rb8ElSUb+vGa2WxxD6gcCRTYYLqb?=
 =?us-ascii?Q?uSEzvjaS76zxprjZQNxJZy/RkGwUbgb+5TFOOCsP1sxJhOoNSK9yJptScZ8h?=
 =?us-ascii?Q?PxI3yFSo7nVzW91vBFdh7jrpaZcJ6MyvyKpU3JQ/AhqhiA8tXFyqDIhR6l8Y?=
 =?us-ascii?Q?ThzI+R8jX7ATnKCiGyvlKsEUoIiNNvinrE1s3Q6fIrFdlkxBZudwis4ndt8B?=
 =?us-ascii?Q?a1ldMU0yPeLPBN9F7koBI9j8rGZcFWHKDf7AhwM+iQRJy4W5zGpE6xgyz75J?=
 =?us-ascii?Q?9sILBvn2eduX3wZn/stTAyM/lLeJ6xmQKivXZMkVdtD38cAqHUSPvhcYYSj9?=
 =?us-ascii?Q?RGhn4IVcunXPubY0i1CIZiyyMHzskVlR4RjoQN7X4yGiDNBJ8kHu8XP5McGy?=
 =?us-ascii?Q?Vh4HB1JYp6gWqG8hpGV1KJIpaZNGhIx6pnImeNRyFuY1sZTntlenZwE1gIM3?=
 =?us-ascii?Q?lsByowuw/HMOsUeYG/dMg5+oKa349BLGg/kOQ9gLIaDqt9lKCidFSRy4BnyF?=
 =?us-ascii?Q?S7zfP094Go5zVtv2r9OYqBxmLpWAY9KyuAhhIanwOmvWD4xNqwJjMkyw8tdE?=
 =?us-ascii?Q?tHhMo3FgO52V7LSzcSk4uCkCvfz4nP9QApSvh6aWUJqlZm5q/h50EjEPZIkb?=
 =?us-ascii?Q?ybGO34ElVc1RLWlIDDx1mxA6CdrRh/Nd8ziQJsRMwy4HwxdFJU5LblzxQjst?=
 =?us-ascii?Q?Z3+95f9wgszIMapSE9Cy20MABNQiru/W4x+5qO5AyXMqxtoid55YqAoe41oO?=
 =?us-ascii?Q?hObIEpBYHo4NjG1cSmu9yG/zSvzM9PWTtrMJuttQqTCPzOWoiPNLTq2/7AIb?=
 =?us-ascii?Q?VxWCnovluyABtND9QywFYCgxIh2zvla2GqFQw3C7iioTkTegjMHyST9d0Ezm?=
 =?us-ascii?Q?FA02SgluJTeWTcVKuQKTBVBb+VWMNnfgSh6xnoaLNeg3wQv/Ngw+zLSKubEE?=
 =?us-ascii?Q?KwsKRgfhHBcAtC589dE+v8L3ZL3bc4b4kXlZkBjRBLUP3o+d4Kk46aMRYtHM?=
 =?us-ascii?Q?b5MOzwRWwwEG2reBRocjgwTIRKpuM1lJdciQYE+IzeDsi4iFtkxbrOwOkyzN?=
 =?us-ascii?Q?xIWjLpsA+bx8HljSHgkNG7/+pyj+2b76051WsGqPtioitnwaE9a4cC4Pvcne?=
 =?us-ascii?Q?HiyC+zsCBE7KQlBgsRgAWZhoILTBVHmp2HErCmjkVNG6H93wpiX6RIFEB8Cj?=
 =?us-ascii?Q?cXUB7/N6PRcffko6bjEH/xZgv526aZGr4swT9lLljy2q71DRcbN4RhiUCGtd?=
 =?us-ascii?Q?C4ftn4xvvhDe+UL75ZvwQTfuBILWftp+fQfnpy+6mNkC4vUP6SA4dUcwqLpW?=
 =?us-ascii?Q?owjYNHSTjmUR6e8C/nteJqfGcjP1YrPxxrD9zxWm0QchNlSfhKghv0C5zHjv?=
 =?us-ascii?Q?TBhjMEfRNqxABNZX+7AOT/lXIW3tqiCoToGLcslgWsLHKcXJJnOr4bNPLNCh?=
 =?us-ascii?Q?S71O/AIKLWu+S1KcFnIMM+iXw3XN6BZZ+n+sqqdjEWmsV4qQrgI/EEyBwRdT?=
 =?us-ascii?Q?yhY8nt9T8GtFoJnU1zC3JJtJjbHIy3nqDevMDHvhn7e8xkV16etwpxXAeWyO?=
 =?us-ascii?Q?ig=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ebb0a2-77c8-4e05-c00c-08dc271d6e6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 14:10:53.9950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EywbcNZtPkrioUygDj9uK4tJiTM2EhwhHQYe3W8fc4NUKgm9ghpdP9c574R6IVfEF01DrhmHvtUGivmD+2TZkB+jq5oAOVGHxLBUd4Bc4Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12125

+ IRQchip

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 6, 2024 1:51 PM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> Subject: [PATCH v2 1/3] pinctrl: renesas: rzg2l: Configure interrupt inpu=
t
> mode
>=20
> Configure GPIO interrupt as input mode. Also if the bootloader sets gpio
> interrupt pin as function, override it as gpio.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced u32->u64 for pin_data
>  * Added rzg2l_gpio_free() for error path for bitmap_find_free_region().
>  * rzg2l_gpio_free() called during rzg2l_gpio_irq_domain_free().
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 37 +++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 818dccdd70da..03725a3c6703 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1894,6 +1894,26 @@ static const struct irq_chip rzg2l_gpio_irqchip =
=3D {
>  	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>=20
> +static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip,
> +unsigned int offset) {
> +	struct rzg2l_pinctrl *pctrl =3D gpiochip_get_data(chip);
> +	const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[offset];
> +	u64 *pin_data =3D pin_desc->drv_data;
> +	u32 off =3D RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> +	u8 bit =3D RZG2L_PIN_ID_TO_PIN(offset);
> +	u8 reg8;
> +	int ret;
> +
> +	reg8 =3D readb(pctrl->base + PMC(off));
> +	if (reg8 & BIT(bit)) {
> +		ret =3D rzg2l_gpio_request(chip, offset);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return rzg2l_gpio_direction_input(chip, offset); }
> +
>  static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>  					    unsigned int child,
>  					    unsigned int child_type,
> @@ -1903,16 +1923,24 @@ static int rzg2l_gpio_child_to_parent_hwirq(struc=
t
> gpio_chip *gc,
>  	struct rzg2l_pinctrl *pctrl =3D gpiochip_get_data(gc);
>  	unsigned long flags;
>  	int gpioint, irq;
> +	int ret;
>=20
>  	gpioint =3D rzg2l_gpio_get_gpioint(child, pctrl);
>  	if (gpioint < 0)
>  		return gpioint;
>=20
> +	ret =3D rzg2l_gpio_interrupt_input_mode(gc, child);
> +	if (ret)
> +		return ret;
> +
>  	spin_lock_irqsave(&pctrl->bitmap_lock, flags);
>  	irq =3D bitmap_find_free_region(pctrl->tint_slot,
> RZG2L_TINT_MAX_INTERRUPT, get_order(1));
>  	spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
> -	if (irq < 0)
> -		return -ENOSPC;
> +	if (irq < 0) {
> +		ret =3D -ENOSPC;
> +		goto err;
> +	}
> +
>  	pctrl->hwirq[irq] =3D child;
>  	irq +=3D RZG2L_TINT_IRQ_START_INDEX;
>=20
> @@ -1920,6 +1948,10 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct
> gpio_chip *gc,
>  	*parent_type =3D IRQ_TYPE_LEVEL_HIGH;
>  	*parent =3D RZG2L_PACK_HWIRQ(gpioint, irq);
>  	return 0;
> +
> +err:
> +	rzg2l_gpio_free(gc, child);
> +	return ret;
>  }
>=20
>  static int rzg2l_gpio_populate_parent_fwspec(struct gpio_chip *chip, @@ =
-
> 1952,6 +1984,7 @@ static void rzg2l_gpio_irq_domain_free(struct irq_domai=
n
> *domain, unsigned int v
>=20
>  		for (i =3D 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
>  			if (pctrl->hwirq[i] =3D=3D hwirq) {
> +				rzg2l_gpio_free(gc, hwirq);
>  				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
>  				bitmap_release_region(pctrl->tint_slot, i,
> get_order(1));
>  				spin_unlock_irqrestore(&pctrl->bitmap_lock,
> flags);
> --
> 2.25.1


