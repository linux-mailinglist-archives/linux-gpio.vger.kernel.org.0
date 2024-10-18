Return-Path: <linux-gpio+bounces-11646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C952B9A4239
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 17:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE8571C209AD
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 15:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA78A200C89;
	Fri, 18 Oct 2024 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="AIZnqn0c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567581D7989;
	Fri, 18 Oct 2024 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264962; cv=none; b=bh2Icj4EGlLfs3JVUDzc34f9j/pJ1SK3QwfFDA/JOHmU/ISC4/+1uK6YJLWja+a2gRr17yx9jrvT8SzV+P7ZtfBR0d7oYmAA0mkYaSdX3L4H7KArtSVrLpCgp3sYWtKzXvOapfHZYrB9sb2oI8o5aybt/DdjoEQVFoHOoU21Qbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264962; c=relaxed/simple;
	bh=SSpKaVaCX27nL5SxgyzizMtsMVImkADVzoBCLGb09Mk=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=CYZ83zziAZhGG6eI/nCyNpIdeosSbVn+5UNBNUgcl3hiF2lP37g/kDk3RDc8R1xndcf9GJSv9YQ8erIUBGPtShPeKsvP5wr1qGLsBkdRWsfe+lJkJFfCmcVCPqLsnL7hVDJZUq+k24bv+pcCQ21NHUKWttzob+oiA5lrdnuHRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=AIZnqn0c; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1729264937; x=1729869737; i=frank-w@public-files.de;
	bh=nYO/ZWwzw37Yw09J81DGKU8898+LB3M5uGlP4gdXjqU=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AIZnqn0cRCQTHsnWPwGY1EisV+fQDC0WkiPE76y2Ze3JfwdCfNLWcV1UeGe0dkSx
	 MCFIYCdol7BqAj4jPprgIaHdwu5oXu9zorbcIdKWWB4oQCHwKjmf51gPGVc7uBWh2
	 G6p9cqAImrD0P8jQEB0MyvIhuNgtv0eUjn4d9mBftkyYojyrAehCA8VveUcFSb1+y
	 SbTeeTLGoUin0QcjgXIk407gBmz0uOo00yRxVE9T8SBui4ihHAuPI9wQF8fCQThb2
	 CiL9chUWVUaUZNeEHz5EIvzbFwOZ+FX2KGy37DfsBC7qhmBG9NVDF2MRSU2eVHe0h
	 m42Bc5iH+KM/Bp0JMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.70] ([217.61.156.70]) by web-mail.gmx.net
 (3c-app-gmx-bs21.server.lan [172.19.170.73]) (via HTTP); Fri, 18 Oct 2024
 17:22:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-c4ba2a12-a350-4681-b2f5-e04c27bb3630-1729264937213@3c-app-gmx-bs21>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com, Sam Shih <sam.shih@mediatek.com>,
 =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: Aw: Re: [PATCH v4 2/4] pinctrl: mediatek: add MT7988 pinctrl driver
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Oct 2024 17:22:17 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <d1a9f533-3a9e-47c2-9476-c54653b56e68@collabora.com>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-3-linux@fw-web.de>
 <d1a9f533-3a9e-47c2-9476-c54653b56e68@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:LhGHiJlaXI887Ob46HR55sDLtu+gghtsz7L1HjmF/g2v//30/Su9ziz6UJFD51KjA2b8h
 MOOtaYbkh3YWrl752DWj6BWxAFq8n1ffWe1cBnFDAM2BYoGsqLUQyjEYDoiBYeNeS0j0L2FoycJP
 NI/giYUHQ3RXj8LSSzb6KrhJCW/iUCcqWXxgODtLaVcAW4+hxlfNa/vG0afkmt+P5mIP3PRwigvR
 zhFWPV0jluHR8dOWX31a0QHdq+bE01ldfDW47Xqhu6RA91qmFb2Ky/I2cdb4hrWXKQLY4aUPH0gU
 BI=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L2sIoFh25S4=;5fTiyybGU9Ehmit0sEVxGFXQvqP
 y3IlCKOyyZpabjtj9f2QPKH7uH46/p3Q2cOdcnaDaXt93hhjnT7hCIiFFvF5DDxovcPxna20w
 JgH1Ejg+BpzEzY7GnLwT56LNVS29KJ1oF4pC5n2wd2Nr9NvOHMbIE5BwlWdKUXWX6OKw/PbBF
 t2hvXCuWnXpVdvYFCmGSP4p4fWXQVl5RWVlxRJ1rJUYockZ9EppNPTz0pe3t/VillfznQ3tfV
 yG9GdhNneph7U5oY27kRZ83dgQjasFTgAQu5faRdqphxWft65wA/bK5zsNFgH8FPXM7RrOs+v
 b5GQLZUjerUHE+JjGP86/Yhqdc+yjoum7L8tCiPFu0c3F2kT1ZiQXhb9ULlfpg2vSbZqa1Gnh
 CDRp+66GtUcfnh8nqSBEyUdy4u1jI5JuBEYUtq1l8a0KA+Bp15Y9/2SiOuWvB9acDtLwgeWwz
 4kCEqW2MtCoBKGur2B0nOe3j776xlyRyiUPn6auPo26XvN1sStqZP6NA0Za2hC/tlGUSOG/Fk
 kRNwTyovrIkm9I9vs+aGlw9Ee8ThP4Rg1WCTU5qHc2WzgLA5R/Oxzq2iZINTX7SSvINivfMJP
 /wDVN2dfnem44VLEq5dV81w9aiDIaalEHThdfkGRymqNDFGMsFzkB4R+vTM7V3Y6T8/aitspT
 fZog3nDkTZ5e6nPCxMmhS0wSo/pj1AhqPgGV3T3V0g==

Hi Angelo

> Gesendet: Donnerstag, 10=2E Oktober 2024 um 14:28 Uhr
> Betreff: Re: [PATCH v4 2/4] pinctrl: mediatek: add MT7988 pinctrl driver
>
> Il 09/10/24 18:52, Frank Wunderlich ha scritto:
> > From: Daniel Golle <daniel@makrotopia=2Eorg>
> >=20
> > Add pinctrl driver for the MediaTek MT7988 SoC=2E
> >=20
> > Signed-off-by: Sam Shih <sam=2Eshih@mediatek=2Ecom>
> > Signed-off-by: Daniel Golle <daniel@makrotopia=2Eorg>
> > [correctly initialise for the function_desc structure]
> > Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc=2Eunal@arinc9=2Ecom>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
> > ---
> >   drivers/pinctrl/mediatek/Kconfig          |    7 +
> >   drivers/pinctrl/mediatek/Makefile         |    1 +
> >   drivers/pinctrl/mediatek/pinctrl-mt7988=2Ec | 1526 +++++++++++++++++=
++++
> >   3 files changed, 1534 insertions(+)
> >   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7988=2Ec
> >=20
> > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediat=
ek/Kconfig
> > index 7af287252834=2E=2E952110c783d4 100644
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> > @@ -187,6 +187,13 @@ config PINCTRL_MT7986
> >   	default ARM64 && ARCH_MEDIATEK
> >   	select PINCTRL_MTK_MOORE
> >  =20
> > +config PINCTRL_MT7988
> > +	bool "Mediatek MT7988 pin control"
> > +	depends on OF
> > +	depends on ARM64 || COMPILE_TEST
> > +	default ARM64 && ARCH_MEDIATEK
> > +	select PINCTRL_MTK_MOORE
> > +
> >   config PINCTRL_MT8167
> >   	bool "MediaTek MT8167 pin control"
> >   	depends on OF
> > diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/media=
tek/Makefile
> > index 680f7e8526e0=2E=2E2b47ce030b54 100644
> > --- a/drivers/pinctrl/mediatek/Makefile
> > +++ b/drivers/pinctrl/mediatek/Makefile
> > @@ -27,6 +27,7 @@ obj-$(CONFIG_PINCTRL_MT7623)		+=3D pinctrl-mt7623=2E=
o
> >   obj-$(CONFIG_PINCTRL_MT7629)		+=3D pinctrl-mt7629=2Eo
> >   obj-$(CONFIG_PINCTRL_MT7981)		+=3D pinctrl-mt7981=2Eo
> >   obj-$(CONFIG_PINCTRL_MT7986)		+=3D pinctrl-mt7986=2Eo
> > +obj-$(CONFIG_PINCTRL_MT7988)		+=3D pinctrl-mt7988=2Eo
> >   obj-$(CONFIG_PINCTRL_MT8167)		+=3D pinctrl-mt8167=2Eo
> >   obj-$(CONFIG_PINCTRL_MT8173)		+=3D pinctrl-mt8173=2Eo
> >   obj-$(CONFIG_PINCTRL_MT8183)		+=3D pinctrl-mt8183=2Eo
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988=2Ec b/drivers/pin=
ctrl/mediatek/pinctrl-mt7988=2Ec
> > new file mode 100644
> > index 000000000000=2E=2E5479f4fa47a7
> > --- /dev/null
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mt7988=2Ec
> > @@ -0,0 +1,1526 @@
> > +// SPDX-License-Identifier: GPL-2=2E0
> > +/*
> > + * The MT7988 driver based on Linux generic pinctrl binding=2E
> > + *
> > + * Copyright (C) 2020 MediaTek Inc=2E
> > + * Author: Sam Shih <sam=2Eshih@mediatek=2Ecom>
> > + */
> > +
> > +#include "pinctrl-moore=2Eh"
> > +
> > +enum MT7988_PINCTRL_REG_PAGE {
>=20
> Lowercase name for the enumeration, please=2E

will do in next version

> > +	GPIO_BASE,
> > +	IOCFG_TR_BASE,
> > +	IOCFG_BR_BASE,
> > +	IOCFG_RB_BASE,
> > +	IOCFG_LB_BASE,
> > +	IOCFG_TL_BASE,
> > +};
> > +
>=20
> =2E=2Esnip=2E=2E
>=20
> > +static const struct mtk_eint_hw mt7988_eint_hw =3D {
> > +	=2Eport_mask =3D 7,
> > +	=2Eports =3D 7,
> > +	=2Eap_num =3D ARRAY_SIZE(mt7988_pins),
> > +	=2Edb_cnt =3D 16,
>=20
> Are you sure that the EINT controller in this SoC doesn't have the
> DBNC_SET and DBNC_CLR registers?
>=20
> Another way of asking the same thing: are you sure that this SoC does
> not support interrupt debounce?

Got information from MTK, that hw debounce is only available for pins 0 to=
 15,
and does not support pins with numbers 16 or higher and definition here is=
 correct=2E

> > +};
> > +
> > +static const char * const mt7988_pinctrl_register_base_names[] =3D {
> > +	"gpio",	 "iocfg_tr", "iocfg_br",
> > +	"iocfg_rb", "iocfg_lb", "iocfg_tl",
> > +};
> > +
> > +static struct mtk_pin_soc mt7988_data =3D {
> > +	=2Ereg_cal =3D mt7988_reg_cals,
> > +	=2Epins =3D mt7988_pins,
> > +	=2Enpins =3D ARRAY_SIZE(mt7988_pins),
> > +	=2Egrps =3D mt7988_groups,
> > +	=2Engrps =3D ARRAY_SIZE(mt7988_groups),
> > +	=2Efuncs =3D mt7988_functions,
> > +	=2Enfuncs =3D ARRAY_SIZE(mt7988_functions),
> > +	=2Eeint_hw =3D &mt7988_eint_hw,
> > +	=2Egpio_m =3D 0,
> > +	=2Eies_present =3D false,
> > +	=2Ebase_names =3D mt7988_pinctrl_register_base_names,
> > +	=2Enbase_names =3D ARRAY_SIZE(mt7988_pinctrl_register_base_names),
> > +	=2Ebias_disable_set =3D mtk_pinconf_bias_disable_set,
> > +	=2Ebias_disable_get =3D mtk_pinconf_bias_disable_get,
> > +	=2Ebias_set =3D mtk_pinconf_bias_set,
> > +	=2Ebias_get =3D mtk_pinconf_bias_get,
> > +	=2Epull_type =3D mt7988_pull_type,
> > +	=2Ebias_set_combo =3D mtk_pinconf_bias_set_combo,
> > +	=2Ebias_get_combo =3D mtk_pinconf_bias_get_combo,
> > +	=2Edrive_set =3D mtk_pinconf_drive_set_rev1,
> > +	=2Edrive_get =3D mtk_pinconf_drive_get_rev1,
> > +	=2Eadv_pull_get =3D mtk_pinconf_adv_pull_get,
> > +	=2Eadv_pull_set =3D mtk_pinconf_adv_pull_set,
> > +};
> > +
> > +static const struct of_device_id mt7988_pinctrl_of_match[] =3D {
>=20
> Please compress that to a single line=2E
>=20
> { =2Ecompatible =3D "mediatek,mt7988-pinctrl" },

will do in next version

> Cheers,
> Angelo

regards Frank

