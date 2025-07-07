Return-Path: <linux-gpio+bounces-22837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB20AFAB2E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1374E17B3D1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 05:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226B7274FF9;
	Mon,  7 Jul 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Ufk434W1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hq56xW/u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E4613AF2;
	Mon,  7 Jul 2025 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751867089; cv=none; b=tpTG244YJ2O3zOwY+jvehrR2Lmjke48cVxlnV3HJv9qaLkeDVb/Fu/RqHY2bmy8FUfbV1aOlzkPEShJ4ssvltdQrHzsK75Nu6QEmOUlRC+LFaNip1fy1y6/iqzEhFzy95/4wIFc3gEc+oCe8l1YZJZ/xH7ptYAzgaitKIIguXuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751867089; c=relaxed/simple;
	bh=OY6NmB39tHZNNYM03bTnKkyh8F+gF+0tLwazWSPrQH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xh3tYeEWhYL42u/wAarbHkeX5dHdgHuKeigN1C42Kx/Tv1fsP2vjObReIJQ8089omezTzrCiPZGKojUC0nT2rB3KTvtsIVpMHsYWM3/ALSWyqkIfrc6yisiWpIZRXPjEP9gPA4hTPEu08wgVoO9PxJRFxElV7wlI0V94TYiKEZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Ufk434W1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hq56xW/u reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751867086; x=1783403086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/zuWbbWA+h++AsLuO/S8EvEleCNiAbabnFusScUFpaM=;
  b=Ufk434W1/87l/npiSsWrHxnG4IC0xuPCZKOX1u6/to5V6PnqGjT389Mz
   84oS7Al/U42/rfr/uXcmQPJ4hDMEoU9Tayj9avWU7WAPaAk77dNnHdckv
   MUzygiY1XesgZrqQKYRBKa4On82h6gF+yNlt/eQXo/lkg9108lBTowb74
   rqg7uxLR7XEZlwQ4CI6BzKml4bIwKzyix+vqt/C3yI2kREOAbjqYR/F67
   RXtZKBB1F8BIQ0Pf/8vffJqZA4DIT/KElSeXQT5l7QVHndIdh610NNlOA
   MFQHsV8rbuslkylQWjd+IQFpBQObMfrK40E9bM6+2nyF5y4LuAhm4z72/
   A==;
X-CSE-ConnectionGUID: 2XgCGCYjSMWyRPxBMNoa0g==
X-CSE-MsgGUID: NfZ04HAES8SXg5lx8LzrxQ==
X-IronPort-AV: E=Sophos;i="6.16,293,1744063200"; 
   d="scan'208";a="45050171"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 07:44:42 +0200
X-CheckPoint: {686B5ECA-3C-943DFC15-D71A48EE}
X-MAIL-CPID: 9FE4A9E6618DBD90A2927866C4DD08E2_5
X-Control-Analysis: str=0001.0A006378.686B5EE8.0004,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA2EA1638D5;
	Mon,  7 Jul 2025 07:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751867078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zuWbbWA+h++AsLuO/S8EvEleCNiAbabnFusScUFpaM=;
	b=hq56xW/uoQ0NIQmlbw5OWPmBkzPjTo41Xj1gTb2U25f9gad7Y0jJcq6Yhc/mPD7m7N6oxC
	cFaVcCZLQHqKWykVOgWuCZYe+nA/kfIcIjoYVmpWTRAU8DviKH1XNWgWJeKXvACDS/mlvd
	/JmFpEX8EZ+0XaNygqiq76NoFo11HDnOv1UF50uFUBzEJ3+PT6ZmkUsNNIuSXeTJhNaeyg
	929lwypoi7wZih7Q4reP1WhxITYuf0GkBFPC+jnA4A+p2pDlSRL1MP252EmDGgRE2fZ3To
	brux2/XtAQ3uHqXYOMGXNIJSLs5x1yu9+TQm/PHBQ3UicTTy0yym92K0GC8fIQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject:
 Re: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
Date: Mon, 07 Jul 2025 07:44:35 +0200
Message-ID: <10691994.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <PAXPR04MB8459091FD195321E9E39851A884FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
 <3372384.44csPzL39Z@steina-w>
 <PAXPR04MB8459091FD195321E9E39851A884FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Montag, 7. Juli 2025, 07:40:58 CEST schrieb Peng Fan:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> > Subject: Re: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO
> > descriptors
> >=20
> > Hi,
> >=20
> > Am Sonntag, 6. Juli 2025, 03:04:24 CEST schrieb Peng Fan:
> > > of_gpio.h is deprecated, update the driver to use GPIO descriptors.
> > >  - Use devm_gpiod_get_optional to get GPIO descriptor, and set
> > consumer
> > >    name.
> > >  - Use gpiod_set_value to configure output value.
> > >
> > > While at here, reorder the included headers.
> > >
> > > Checking the DTS that use the device, all are using
> > GPIOD_ACTIVE_LOW
> > > polarity for reset-gpios, so all should work as expected with this pa=
tch.
> > >
> > > Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  sound/soc/codecs/tlv320aic32x4.c | 44
> > > ++++++++++++++++++++--------------------
> > >  1 file changed, 22 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/sound/soc/codecs/tlv320aic32x4.c
> > > b/sound/soc/codecs/tlv320aic32x4.c
> > > index
> > >
> > 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..1423186f5a6c181a2
> > 0dd2dd55267
> > > 9d33174edaee 100644
> > > --- a/sound/soc/codecs/tlv320aic32x4.c
> > > +++ b/sound/soc/codecs/tlv320aic32x4.c
> > > @@ -9,27 +9,26 @@
> > >   * Based on sound/soc/codecs/wm8974 and TI driver for kernel
> > 2.6.27.
> > >   */
> > >
> > > -#include <linux/module.h>
> > > -#include <linux/moduleparam.h>
> > > -#include <linux/init.h>
> > > -#include <linux/delay.h>
> > > -#include <linux/pm.h>
> > > -#include <linux/gpio.h>
> > > -#include <linux/of_gpio.h>
> > >  #include <linux/cdev.h>
> > > -#include <linux/slab.h>
> > >  #include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/init.h>
> > > +#include <linux/module.h>
> > > +#include <linux/moduleparam.h>
> > >  #include <linux/of_clk.h>
> > > +#include <linux/pm.h>
> > >  #include <linux/regulator/consumer.h>
> > > +#include <linux/slab.h>
> > >
> > > -#include <sound/tlv320aic32x4.h>
> > >  #include <sound/core.h>
> > > +#include <sound/initval.h>
> > >  #include <sound/pcm.h>
> > >  #include <sound/pcm_params.h>
> > >  #include <sound/soc.h>
> > >  #include <sound/soc-dapm.h>
> > > -#include <sound/initval.h>
> > >  #include <sound/tlv.h>
> > > +#include <sound/tlv320aic32x4.h>
> >=20
> > Mh, maybe create a single commit sorting these headers.
>=20
> ok. Let me do a v2 for this.
>=20
> >=20
> > >
> > >  #include "tlv320aic32x4.h"
> > >
> > > @@ -38,7 +37,7 @@ struct aic32x4_priv {
> > >  	u32 power_cfg;
> > >  	u32 micpga_routing;
> > >  	bool swapdacs;
> > > -	int rstn_gpio;
> > > +	struct gpio_desc *rstn_gpio;
> > >  	const char *mclk_name;
> > >
> > >  	struct regulator *supply_ldo;
> > > @@ -1236,7 +1235,14 @@ static int aic32x4_parse_dt(struct
> > aic32x4_priv
> > > *aic32x4,
> > >
> > >  	aic32x4->swapdacs =3D false;
> > >  	aic32x4->micpga_routing =3D 0;
> > > -	aic32x4->rstn_gpio =3D of_get_named_gpio(np, "reset-gpios", 0);
> > > +	/* Assert reset using GPIOD_OUT_HIGH, because reset is
> > GPIO_ACTIVE_LOW */
> > > +	aic32x4->rstn_gpio =3D devm_gpiod_get_optional(aic32x4->dev,
> > "reset", GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(aic32x4->rstn_gpio)) {
> > > +		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4-
> > >rstn_gpio),
> > > +				     "Failed to get reset gpio\n");
> > > +	} else {
> > > +		gpiod_set_consumer_name(aic32x4->rstn_gpio,
> > "tlv320aic32x4_rstn");
> > > +	}
> > >
> > >  	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
> > >  				aic32x4_setup->gpio_func, 5) >=3D 0)
> > @@ -1372,26 +1378,20 @@ int
> > > aic32x4_probe(struct device *dev, struct regmap *regmap,
> > >  		aic32x4->power_cfg =3D 0;
> > >  		aic32x4->swapdacs =3D false;
> > >  		aic32x4->micpga_routing =3D 0;
> > > -		aic32x4->rstn_gpio =3D -1;
> > > +		aic32x4->rstn_gpio =3D ERR_PTR(-ENOENT);
> >=20
> > Shouldn't this be NULL similar to when devm_gpiod_get_optional()
> > doesn't find any reset GPIO?
>=20
> There is a check in driver, so NULL not work here.
>=20
>         if (!IS_ERR(aic32x4->rstn_gpio)) {                               =
                          =20

I don't like the fact that both paths have different values for rstn_gpio
for the information there is no rstn GPIO. How about setting NULL in the wi=
thout
DT node case and checking if (aic32x4->rstn_gpio) here?

Best regards
Alexander

>                 ndelay(10);                                              =
                          =20
>                 /* deassert reset */                                     =
                          =20
>                 gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);         =
                          =20
>                 mdelay(1);                                               =
                          =20
>         }
>=20
> >=20
> > Despite that, looks good and works as intended:
> > Tested-By: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Appreciate!
>=20
> Thanks,
> Peng.
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



