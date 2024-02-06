Return-Path: <linux-gpio+bounces-3037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0E84B784
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 15:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 274FBB27AB8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA4E131752;
	Tue,  6 Feb 2024 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ku/Mhlcm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F12131727;
	Tue,  6 Feb 2024 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228691; cv=fail; b=iVGQNGDc+N+AhpOdCtkJOZUmVHzreqq5JIUT7lDl1dYnscpqtHqwYj5UW1GzExsuVQrIvyTtvmG3bHIOXGOM/arBAPfUdisHFjpn6B8rqZZUZG9QY4rxM5ZpT4HkpAun1dH7yzV9mzayWe2ww6DB32SwonKi4+YBrbH8QffOLZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228691; c=relaxed/simple;
	bh=3xr/xz2DIWZoCvBMEIxeEBeJUjcJq1lWtwwulYUkE+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bzTsX3K+zU+XE+EzgNVlTvhZ+ZV9dCQJpRTJ6gMIWMJ4/lBmxgxsjhohTkukNZR9ZjX/gXZGvejGsPP62OJe81jy2ZxHiaqGMVqlHkvmXCzudqJHgpMDc6gBf/n93gUP32pZTAhscOtUQ1H1ewRx8TwEOyr5P1OgfyqwwvTNtI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ku/Mhlcm; arc=fail smtp.client-ip=40.107.113.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMlSyw16aRiTa+/5IWTgHh8tDkdB1GTV0+NcIiHip1ZpyHvv9/w4vX5ebpZXfDffPLBsGE6Awh5u2RRHHNFlgb2Guebw15JXgs5nVQM31jmixogO9oAcY84xot7f+XVEhLUILGAeMEthSkFpXk9+g4JvBElsiaGg2OnNFhcJ9sMrsCnmWt/v1JGCXgq01b42ITEDfmFbnj97SEFVEc0mhYNhGFSpmCpCSukdmfNFo1upaAdTuzibeVzifXA9VpXC3jzl6UzPKj0kGfv0tCD5xISFInqOFX6bQwzR6LWmuKfTHDTYojRiBwHsQq2PRxRVtNvIrNGt+N12Q8jHU/YMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoMJfvYODiFmXP+cD2DrWXGGy/H+ySwTrNyTLYQp+T4=;
 b=G1yXO9zlC2H+6KVCb4W480io9SrbyngvIzd0i73aDSrn6F81eGPary56tDPHj3KcoKMfEdM8+PrVoBbKQ4TU4Yf2yGFPUjnri7u256/WZ2qX6ra5Tf5dc3SK9bmJVdx2PzjfCCFQxVYdsxFpMYVa43lrX6McbH8Nd2F5sWO1Z/vAZ+X76TqoRx6b3vPKKlS2DDqhSOqLjPElK6HGSHLIVlrQNleAzAHCwoKmtCqKa9fPsDVmZK74jIpziJnF3E2076aLMI7SwM+nNuZSsdqQ3w7Add1cfoNAU3Ir1VNaNiwhO0t1KAi9Jb1JxoMfBi6PhFqlIlFbs4uuPPEkuudD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoMJfvYODiFmXP+cD2DrWXGGy/H+ySwTrNyTLYQp+T4=;
 b=ku/Mhlcmvsz89m/KtrGazwYhblKYNKFVyuhNeFipdNmVdcEW8GjiI0QQ3dxNJ7yLwFLJ01eS9+LIX7TBxUnVjDLbJueWfBd4DtvWlCA1NVKXpquyfsgEkBDN62VPDAaQIJW+DITnGFKnBJgAm0vX3dz9tjlEMaBEkiHYfa9OnW8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB12125.jpnprd01.prod.outlook.com
 (2603:1096:400:440::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 14:11:26 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 14:11:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify
 rzg2l_gpio_irq_{en,dis}able
Thread-Topic: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify
 rzg2l_gpio_irq_{en,dis}able
Thread-Index: AQHaWQOVl9qDBQbg7UaOPK0eO7hdA7D9WpUg
Date: Tue, 6 Feb 2024 14:11:26 +0000
Message-ID:
 <TYCPR01MB1126930011997EC54135354CC86462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com>
 <20240206135115.151218-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240206135115.151218-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB12125:EE_
x-ms-office365-filtering-correlation-id: f3277ebe-ed7d-4e0c-4980-08dc271d81ab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UFd8GXC78f28QkaXidyeQdSomybIMFZztvGHZIZO+iiEZTE70j2e4kS/PAB+q3hzXH0dCLBGfFmDoFYSI8ovXlTemxhv4YBn5FI49c/9u4t7mrdjKaeYJsABPG5Sg5lZ1ImXSICtyQiRnsK+1bX8sJchp67Q5odjMlEoqPI1EyjxZoJuRakcq4o2b/rafB2ugWKxYVhk9XG/e5GkFtepga0WkbPsT7YGNuzLAreX4jexMV1aQnpx0GWGcH9BojAMQ+wqzbCGkL8DKQXsvYkX72xvJ08z5COLY1mEvJ+MuUFiLTbEtgX19V2CD7dg8axgbpedICzvo+uYTVyaZaO4kIEGfBy7Hw74tk9o+WRF1Tqdn32YDqTX7aM7o1GqRrbqQfah7qD83MtDEDRvnnzH7lZ2BhOfqQf5+xH2pLtg1UJfh7CDRaVPrA586umFESaWrsxmW6SoSvx3HfxKbvOii4fQj6JAg50cCu0U+TfjCCIVc7L+ZzQ+oIs+L7idl3CbxpPXcsdUOJfESIz82PZKa4TK0AXM/84990T+uvIibQgwPPbWEshg5UCdmSzRVqVV89zJzKdBm/WOCx52EROI8bLR/qFBwW2F4zD06j3M3y4Km9B7GVVVN5UuOPpHcGY3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(52536014)(2906002)(55016003)(86362001)(41300700001)(83380400001)(38100700002)(122000001)(26005)(7696005)(55236004)(53546011)(6506007)(9686003)(33656002)(64756008)(54906003)(66946007)(66556008)(110136005)(66476007)(66446008)(478600001)(8936002)(71200400001)(76116006)(38070700009)(4326008)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bhwq8/p5pumlTKx44T2dG++089Ddee+0PhX5y/Jx3IMb1sdZnqotFKZNCu9N?=
 =?us-ascii?Q?JiLYPrm4v8Sk5oaUhSOHiidDAk5e8wTw6qVrTFVKmmQQz1yE3JYZtopmgb+L?=
 =?us-ascii?Q?9E2EJnlOYMzLx1HFgbQnagFe/ilL4C1YthRr60wLfExw7KeZWnvfkMJd1NuH?=
 =?us-ascii?Q?DrODzwgI0ksschpgIHu5vwAHngTWibUEJ2p2fYJt45uPoHpOT5/yNRHF/g5p?=
 =?us-ascii?Q?GrM+yi0YxdUQXTYOvRDErH0+x8BNOjlGBLY6GghQmEPTO27UZ25qYaYm/dHC?=
 =?us-ascii?Q?D4mWGG49AO23qRMvhL86UjptOp+Qrk7CZZhKBeynhaLjgKq/S68LCG8LXgBA?=
 =?us-ascii?Q?k4Ip1ZmuDH6WyZ5c9aBCMlOzixmgGJkxJvjjngbW2AnK4ZbJHkUzJ/CgRNGy?=
 =?us-ascii?Q?vN8YPV6ouX0OeTO+AVKBgIbcU1F8l1PINAfrOkxQ8D4PFf5WdRDxl6AfWgpg?=
 =?us-ascii?Q?e+7laxfopx3zoX1TrafLkvx25KmIUycOj/J6o6kYgn6Og1E6boMXfP1Wmau7?=
 =?us-ascii?Q?UZXzTh++D4dPdFcmNzsyMOZYKD6N2iW3IcbWokRqNga8VJxFYxzagUIl7S/g?=
 =?us-ascii?Q?Z691l9WnHfFIDwbnHwvlIQNzZQjayY8ulR1ZnzdwmUcIrPEOADtXiuLE0wBi?=
 =?us-ascii?Q?bm1DcR1sCRaIAkjjXRe5ExJQkTUGy3Wuvd8du56/wWPFc4rmsi+9LMlsSobI?=
 =?us-ascii?Q?79UnMSNgh7cvENiYt+uXGXsUmbglYSlty1H3Igul1szklYu7FQ7Nw7fbHxYO?=
 =?us-ascii?Q?uK37bJFJWqS85OmtdC7MkVQ8jCgZ//EUM6UjkKvO5+eYwOOz90P+EUMkvXh9?=
 =?us-ascii?Q?mxE5TZ3dNyraLMvee0oYH2zEiHXccuVC7zW1xqh3++xc6nSR+a74XKf8Ybnx?=
 =?us-ascii?Q?8534P2Hdc3vTDVdDPgKJ3tx7nJQbfNKiSP4Y3gcLUkS5M6kpS8tBP6UZi++2?=
 =?us-ascii?Q?NImNGjdY8XF36ZRh/ToDjioYSEJ7JgC/Ucg2FzA+DUZdLMp2K343Lr2mBjxG?=
 =?us-ascii?Q?+dc272kJ0Sr05tfq/Vs3+/C993at/A/K6ViDtiryXwzWiVYZFdgv6G2NnIcr?=
 =?us-ascii?Q?3zT0+v5UNeopD2OHRvdNuyOCikKBJky5OgqOWEn5DlvNV56894fqgUwfS+q+?=
 =?us-ascii?Q?gIqrkZzYrgr4deXynL+WuldbEbH6VTlqaqRsEBAU+KF3cxc2OnS7eYLeMgXO?=
 =?us-ascii?Q?V9agqYJcK95RDZzqi6L/cE+smROWs5S2o1/zwxZvcxyL5WOfeAshMt9VDbgQ?=
 =?us-ascii?Q?6yKuHN0N8D/+w4bzPgblue7Dswjx96lO+VF8Ek0KjdUZ7/wu20hhU94e7SHx?=
 =?us-ascii?Q?lilHhkDtEDnhRSnggCpifLgTbTSozz7kUYX78oHmTw/dRsmwDFVcHhNHWu/+?=
 =?us-ascii?Q?ROtjrA08NdH6ugCNymRZuJn20/CpaBE44+jhRo95rvrHwK0h9e710USHjBI7?=
 =?us-ascii?Q?PA2S7SGxh4HTlSUDPCSHAScyB+snpXfiL8BfDK/YdKAnqtg0EVyG5NlqCrmS?=
 =?us-ascii?Q?ObIXI6KCcxK4pbzc6nQwDWELFRPQdN8aSRIuUuIJZK0T3yS5cGQ3LqmVnC0W?=
 =?us-ascii?Q?dHIECOvZpQCPucQAnkgoQiUTO6HBUakxcJG/nFMSvolXs6KcvSFXbgRev2+2?=
 =?us-ascii?Q?3A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f3277ebe-ed7d-4e0c-4980-08dc271d81ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 14:11:26.2260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbV+6er7XpO/sRHxV1I2jNZ1Nz9MYs9w49laWIY2uw8lvJKTvnBMGycINgd1cd/m75EOPKHEzonV9NVj1Gh8yLsz8+1wDTZuxrVaHaVyCJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12125

+ IRQ chip

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
> Subject: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify
> rzg2l_gpio_irq_{en,dis}able
>=20
> Simplify rzg2l_gpio_irq_{en,dis}able by adding a helper function
> rzg2l_gpio_irq_endisable().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 40 ++++++++++---------------
>  1 file changed, 16 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 03725a3c6703..d400dcb048fc 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1809,11 +1809,9 @@ static int rzg2l_gpio_get_gpioint(unsigned int
> virq, struct rzg2l_pinctrl *pctrl
>  	return gpioint;
>  }
>=20
> -static void rzg2l_gpio_irq_disable(struct irq_data *d)
> +static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
> +				     unsigned int hwirq, bool enable)
>  {
> -	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct rzg2l_pinctrl *pctrl =3D container_of(gc, struct rzg2l_pinctrl,
> gpio_chip);
> -	unsigned int hwirq =3D irqd_to_hwirq(d);
>  	const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[hwirq];
>  	u64 *pin_data =3D pin_desc->drv_data;
>  	u32 off =3D RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> @@ -1821,8 +1819,6 @@ static void rzg2l_gpio_irq_disable(struct irq_data
> *d)
>  	unsigned long flags;
>  	void __iomem *addr;
>=20
> -	irq_chip_disable_parent(d);
> -
>  	addr =3D pctrl->base + ISEL(off);
>  	if (bit >=3D 4) {
>  		bit -=3D 4;
> @@ -1830,9 +1826,21 @@ static void rzg2l_gpio_irq_disable(struct irq_data
> *d)
>  	}
>=20
>  	spin_lock_irqsave(&pctrl->lock, flags);
> -	writel(readl(addr) & ~BIT(bit * 8), addr);
> +	if (enable)
> +		writel(readl(addr) | BIT(bit * 8), addr);
> +	else
> +		writel(readl(addr) & ~BIT(bit * 8), addr);
>  	spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
>=20
> +static void rzg2l_gpio_irq_disable(struct irq_data *d) {
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +	struct rzg2l_pinctrl *pctrl =3D container_of(gc, struct rzg2l_pinctrl,
> gpio_chip);
> +	unsigned int hwirq =3D irqd_to_hwirq(d);
> +
> +	irq_chip_disable_parent(d);
> +	rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
>  	gpiochip_disable_irq(gc, hwirq);
>  }
>=20
> @@ -1841,25 +1849,9 @@ static void rzg2l_gpio_irq_enable(struct irq_data
> *d)
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rzg2l_pinctrl *pctrl =3D container_of(gc, struct rzg2l_pinctrl,
> gpio_chip);
>  	unsigned int hwirq =3D irqd_to_hwirq(d);
> -	const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[hwirq];
> -	u64 *pin_data =3D pin_desc->drv_data;
> -	u32 off =3D RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> -	u8 bit =3D RZG2L_PIN_ID_TO_PIN(hwirq);
> -	unsigned long flags;
> -	void __iomem *addr;
>=20
>  	gpiochip_enable_irq(gc, hwirq);
> -
> -	addr =3D pctrl->base + ISEL(off);
> -	if (bit >=3D 4) {
> -		bit -=3D 4;
> -		addr +=3D 4;
> -	}
> -
> -	spin_lock_irqsave(&pctrl->lock, flags);
> -	writel(readl(addr) | BIT(bit * 8), addr);
> -	spin_unlock_irqrestore(&pctrl->lock, flags);
> -
> +	rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
>  	irq_chip_enable_parent(d);
>  }
>=20
> --
> 2.25.1


