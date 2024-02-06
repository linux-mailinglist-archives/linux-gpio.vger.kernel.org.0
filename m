Return-Path: <linux-gpio+bounces-3038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A288984B787
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 15:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0711F24AAE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Feb 2024 14:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA85131752;
	Tue,  6 Feb 2024 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N7t3OGD/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C86DCED;
	Tue,  6 Feb 2024 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228720; cv=fail; b=Pca00YgKCjD6GizXuIKM+sIbuOit2yNE4xD7BO+ZtSasmkohemvPZ9G7Mzl1y6oMQILYcVUXrIq90LKMgdVHM2ZDyZO0simjEZkWrVHuHHfVYC07M/QU/2bcC5b1xmhq1kzV+iNy1ku7iPaGrF+nyeWo95JlvMtpUwaRf/t0kWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228720; c=relaxed/simple;
	bh=RLoyytMBYDFHfn7Hix+Yxwa8TmEOAvd6nfx9MP+AKls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fYNKHdak4H5BWTI1dtS8OmCfV6ZOrS2Cb1CLP87xK4ChbPfe3suoZ0mhoN8WAu6+OzHzhK2zwelLYBUVZHLw0EOWwHJDz1hML+HPmcae52LZ5pKt0ey5UhUN6Wabmb4HLIHOWeohplVeSA7jFtSx5CnBiXKbdUVUo3Kv8x8UN6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N7t3OGD/; arc=fail smtp.client-ip=40.107.113.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VydwTPBPJ87KzBWeA8k0juEV9FXYp7migBAAgys1GHJ1krDRGASGQac/D4hzNBbac+9CafLFfrLxtYmfWYBFpMJFAWP947ySBFtyWVKOeS6bDMf66pxgbk8vhvKx3QPwiq5z5fC388qMjtrJXWqhJ926X90ZeCAaeDo6TuRFQ0anCoT35mWkqWXt9qEswFuyXlAUxVZYILIahuRHsbzYslV4FMsCZ6BqUN5iD/293uCMDqr9j8HbP2U0U9Jy1BSlQVgulBQ1oLkvl+/WXQp2bu5Wrj4H3WRNmCnfhC+GxTgMqQmeprknIukDsxFClva0yZ++OC0yPnS+KcADQjyCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCN+ut18NwHC44l/ehO8HJO8oMSQQU59f5xu8JWREek=;
 b=eNFEyn1PogH2QzBDkoVqFUtXxkAZWbUqbtLc8ZS7VOqZ3/qBpO+yvj0kVdZAnBLV6cNFkwZTJocDNaBdYwUTViVaMoISHFE0DUFib3z/LLOMv9SecXkFkHB5O9+2Su1oeYdvkAScdezi7pVZxFE474jyjK4/9bYkTU8S1dhBZqWEEmq7NTuoOn/QngG7no6OTd8EfIW1QQSu4y2r42kkVoUWdXWmGYIr7Rj0mlrjDA0lA5Yqsn1WPsVXCnYwSZIPJT2nDAPrpZ3qSKcHIEn+MIV65dFb7dInyLzdYCCS4SaTOkSlTXP0WqujpYIF5uv53Gr42Bus7h8N7978VnTDNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCN+ut18NwHC44l/ehO8HJO8oMSQQU59f5xu8JWREek=;
 b=N7t3OGD/wL4AxB5GaFxikK1TEBy2OCMBdKQaZ05qzKpgrxRagjLIpZ8nq0iG+tLxBkO7AUxvkGgG265ma4YATTxBf0HG6Mcb4a9o9rpCuCmiE+5/8L6+Wtbwoci4Ys47yzBUq2wch5BM0qTwCpjRS2k9iO3LwzL2Ggnl5d+067Y=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB12125.jpnprd01.prod.outlook.com
 (2603:1096:400:440::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 14:11:56 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 14:11:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL in
 gpio_irq_{en,dis}able
Thread-Topic: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL
 in gpio_irq_{en,dis}able
Thread-Index: AQHaWQPbrv8soNH3fUmQ40zoTTone7D9Wrrw
Date: Tue, 6 Feb 2024 14:11:55 +0000
Message-ID:
 <TYCPR01MB112695DD366FE13CBB161347886462@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240206135318.165426-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240206135318.165426-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB12125:EE_
x-ms-office365-filtering-correlation-id: fab36db6-fda4-48ed-8c91-08dc271d9364
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 30e4wkIJOD5lknnROlmRP2skQtMgX8ppTYq9RrpkKLV3tIiNTU+cE2bYZr8PMeUWX/peRPPL7ZtrJBIor85gDEb4YJTBwUGg3UI/7BrVh6VDOO7O1L0otCQgkOhrQUu0SOPo4ru/kQL8i5DvfR7TF04GfV7e5owv2vAehQytNAv4o/VehwWENdesDmEBqOw301EL3oQoVWA+DG0lUOBDevY7PnsCBfm1wOV8d0RPVTyZZsLMW/pYsfBfgu+jI59GhOVhVb6Hbml6+qsk1IF+uNhT7FGXuh4NJdy5nCsYn2BTswgdY5Ru0lIDOMcZ0p1tp/qVbfuo3fj1Ql6BRyunfdq7hjxtBnQY6v4ap8A6r+sB9m/mxqB30IhavSCyEmNQheH6+qiJKb1f4p2weyjCuhXRvA7DWckvAcVIdd26zEdsLj6sRp5oaH9uiT7AKN7stc43IyVaXBGy6PozpMY9H7gZUdjf+ueUXRnIYyHqcha+ClGtR5XNg+y529k3Q+KQnCWdSVn3ofJXjs+LQCQDaFZUTf+5pGCqCynUpUWAsiUWe/COkmw5xEveLrusL0+c8WQMbVjhKbCrew+bYSYqGSpgdYlbPuIjM++bPdBKO4UUIDUzklfIxIf1wiMm+dPM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(5660300002)(52536014)(2906002)(55016003)(86362001)(41300700001)(83380400001)(38100700002)(122000001)(26005)(7696005)(55236004)(53546011)(6506007)(9686003)(33656002)(64756008)(54906003)(66946007)(66556008)(110136005)(66476007)(66446008)(478600001)(8936002)(71200400001)(76116006)(38070700009)(4326008)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mwawBdrIrDrQGb2dG+fr5yWDgckdlKmMdOf0GtZOvs8QzfKk2rKrjNzz+Pbu?=
 =?us-ascii?Q?OPyF49n6fsdVqijrvNX5FtmoezGb/hN1LTlqQVBs/GKeinxiJpeCUKkYYIZS?=
 =?us-ascii?Q?CIj9sLLgt6qESjTHz7HiWN64+3L6Y+i/U8duDbaeODUstZVGgtS663E9fwj6?=
 =?us-ascii?Q?xaIpQ5hrjh3qbnrEcX2D7bcChxjZq37wjl/b0Oh6j6tryUBh0EgCfoYMhq5f?=
 =?us-ascii?Q?7s+lEiSngiT7QOlNAataZQ9naiu5H04HC4I1qD2rzu9YmlB9pbHZWr2TIC89?=
 =?us-ascii?Q?31GpmtZRvDKJnVtbgeNKADsRk2cZiB4jsYXNvGpslNgZl0m92p2f8eCilK0Y?=
 =?us-ascii?Q?FcpR84jHOKQsu+A4itOX2xcGYVNA/Khy5a2zcKMR4M/VY7m5TG0nMjrIHd+n?=
 =?us-ascii?Q?G/pxSEBB2asJ+S3UYVV+t/5M0ZGpT9Q2z+BDHSaJqAueJmdXJ/py2kKh9H/n?=
 =?us-ascii?Q?uTUVURS/rnZGFATqgZFReg+ChqqwrjAP0aQ7OSe7JQSMfLeU20lCbWW/Yosx?=
 =?us-ascii?Q?hrNNK3zSLEGzpbvdTLLMJju6nRqN95ODtULXWjkPdTRjWM1PzRCs3QMhhJjq?=
 =?us-ascii?Q?fMrMWO2Ct9aFb/ZIjeWxHN/TbW9HbcOBVYq/sgKdRo4Ri9PIt1pWIrnT7zdq?=
 =?us-ascii?Q?ZLwVwMicO8YkRXOuTl9r2ATuUR8e/JfrTyTpI9/tgyMoF+ek8x4P1A1ndlTz?=
 =?us-ascii?Q?v5ndv9h/NeZXpKgm5CZHW9uwuCurac0XIji50/ratthVVpTmATEJGmq+w8Ss?=
 =?us-ascii?Q?opsrwojbgebnd535+fPOwY7SG/AmAe2Dteiezqv83fZjmobZVVwcqNxojvtu?=
 =?us-ascii?Q?GIRP60Rd0DWJ1ZsjbizTdYONqsNL4lvZsC6PFIfZVw7C77ft4wbzFUaONNti?=
 =?us-ascii?Q?HYLVcc5h53qHkwlTbZ7KxP+MYN9Wbyvy6SrDcLweAMgI4+JvlSJoMp3QvAes?=
 =?us-ascii?Q?CwKqsW7ABAXuKMzTITxPvmFkhRTlTizeI8UacodjhSAFc3zlKuHSNIhSc4fn?=
 =?us-ascii?Q?eNYG4jsx5bCme3dDlr/mgHIk9JTgnEyOC/Sqr9nBQRhoY8llHNmiI9VefCcx?=
 =?us-ascii?Q?dXglWgbKHi9e9sYyYNpkQleIYEL0Xi9w30EP3JDSjtxZ6cuuIS3EpxLdDM6V?=
 =?us-ascii?Q?Lt3qVUIthBMpnFJpype0NsKGm4Hwtw6ufZ/77pVCr3cRLCmAdyWvMcizeEDK?=
 =?us-ascii?Q?jhGoVZb8yq7Zcn46SPK4eRuDHb2NxG4DUp2W50st0aP3ny19lDHOYMcdW1hG?=
 =?us-ascii?Q?s/KEmtoefK0n8kgNz6OosrSzCwJ3zZeWWMtqVcXo1baef93yrLXwBheL4Ern?=
 =?us-ascii?Q?FM5BDXs/B98ExY/q4RQmiYE5LfvWp5V2qP5hdbaj2Yuqtaml725u3mCUYEw+?=
 =?us-ascii?Q?BZ9nvOtP/LaAaIgWSG2vxljzsd8lkoT5uqr6wkyWBhXEi4jv7kykAKa3g6St?=
 =?us-ascii?Q?F3Khey2gKTh6tNkL0FuM3ELKN60NnRTlWeFkCtOS/OSpxRnyOYnOkLTVmvGc?=
 =?us-ascii?Q?8kG/wsqSu6ZTgE6Hf2e+2MOd8XOUxZLJUDTg8a55QXx3Um9zX0SeZjZntjjp?=
 =?us-ascii?Q?g9TQfwyEyu+k88tI8Be/nTiwg4ZJcOSwRDtFX3PKEetNqVasfEAbOQJdCoUD?=
 =?us-ascii?Q?QQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fab36db6-fda4-48ed-8c91-08dc271d9364
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 14:11:55.9587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1yKy5CqBxVdGTl9DeuFdfN2tY6Lt24/jO51sctxJKmpelY2AJCZo1594OEz2FMLwpOHg6peQOq0u/ju2ZNhoqZm2gaONyMqdk/pOw3Rt2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12125

+ IRQ chip

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 6, 2024 1:53 PM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> gpio@vger.kernel.org; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> Subject: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL i=
n
> gpio_irq_{en,dis}able
>=20
> Currently on irq_disable(), we are disabling gpio interrupt enable(ISEL).
> That means the pin is just gpio input and not gpio input interrupt any
> more. So, move configuring ISEL in rzg2l_gpio_child_to_parent_hwirq()/
> rzg2l_gpio_irq_domain_free() so that pin will be gpioint always even
> during irq_disable().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch.
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index d400dcb048fc..4f979b7081c5 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1836,22 +1836,18 @@ static void rzg2l_gpio_irq_endisable(struct
> rzg2l_pinctrl *pctrl,  static void rzg2l_gpio_irq_disable(struct irq_data
> *d)  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct rzg2l_pinctrl *pctrl =3D container_of(gc, struct rzg2l_pinctrl,
> gpio_chip);
>  	unsigned int hwirq =3D irqd_to_hwirq(d);
>=20
>  	irq_chip_disable_parent(d);
> -	rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
>  	gpiochip_disable_irq(gc, hwirq);
>  }
>=20
>  static void rzg2l_gpio_irq_enable(struct irq_data *d)  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> -	struct rzg2l_pinctrl *pctrl =3D container_of(gc, struct rzg2l_pinctrl,
> gpio_chip);
>  	unsigned int hwirq =3D irqd_to_hwirq(d);
>=20
>  	gpiochip_enable_irq(gc, hwirq);
> -	rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
>  	irq_chip_enable_parent(d);
>  }
>=20
> @@ -1933,6 +1929,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct
> gpio_chip *gc,
>  		goto err;
>  	}
>=20
> +	rzg2l_gpio_irq_endisable(pctrl, child, true);
>  	pctrl->hwirq[irq] =3D child;
>  	irq +=3D RZG2L_TINT_IRQ_START_INDEX;
>=20
> @@ -1976,6 +1973,7 @@ static void rzg2l_gpio_irq_domain_free(struct
> irq_domain *domain, unsigned int v
>=20
>  		for (i =3D 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
>  			if (pctrl->hwirq[i] =3D=3D hwirq) {
> +				rzg2l_gpio_irq_endisable(pctrl, hwirq, false);
>  				rzg2l_gpio_free(gc, hwirq);
>  				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
>  				bitmap_release_region(pctrl->tint_slot, i,
> get_order(1));
> --
> 2.25.1


