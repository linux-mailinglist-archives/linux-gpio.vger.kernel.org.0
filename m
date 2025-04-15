Return-Path: <linux-gpio+bounces-18861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A4A8A046
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 15:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1363442270
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 13:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C214829B78C;
	Tue, 15 Apr 2025 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OKDM2ed4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JFgGQ4+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7752949EB;
	Tue, 15 Apr 2025 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725215; cv=none; b=KzUISBfgIAQvoZmTZjCxtky8T4qFdzap4dmWd7Kpss6COfLYBvyIoGwG0boLfZExRmeit/B/WhDncoCzO7cbQJiOn5XNpBhV7sO7u1Sya55rswkhC7P51DR9Jnrg4f6EwR1MmOYwk9wvkuV482N5G75j9BJ2JjAmvMi8IX3Gr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725215; c=relaxed/simple;
	bh=FdK4ILJscL/ugJeymIxGyEgAGIjMkW6pQkXNlqQM9hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJ9caUCGoIFYC2vCRdI/4hpa5kbTuITjIUU/pOp1q5Ca5FX+I3/M4mGkPqAM0JfBCt5jZuYmXmHbiSbkhLmTY7UQT5esrjlZXlWtp+IL24ri1ZyfZeAb3IHc2yIFoMZ5n4gt1kfUQwjIxnKIdZxVqloSLCqK50siDG/guLQ5dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=OKDM2ed4; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JFgGQ4+E reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744725211; x=1776261211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/n4PAOWUxiy6GTI0VO9pOTS66Ah8rFoVk3FItB8CDM=;
  b=OKDM2ed4EArd9dj8st8agNXmYBazRxE/5dai0omE+/oDTUwLoQ/bexFs
   DK7u8pkSptNeHbMoNdZLcwbyTx+rWWVlox+tsRmP5guTCcV1y6JXiBa/Z
   0ZQXqSgY7I6X2pqXPZ/+dc3VDvHWC3oMbPZY8Ju3ldyCpJgi7ZQZrO1XX
   X57z/PMOJ3nXmKqIES59ytVieJHP0QmRc7ljzws0xdNiHmuq4JZov+dTX
   hG7K1uIXy2M8/bdgHIYCwXqt0FmXYAaXacFR651Ui1n6S3q19+KHfnfte
   N4vUhcvRxMljgZJHoV7clNIi1b6kFJKbGcTDwXdh5cecbdSKG1kLqsghX
   g==;
X-CSE-ConnectionGUID: NJa57L0GRe28Q9o+XdiQbg==
X-CSE-MsgGUID: F2H3oj2GRRuoXPj6T5uBZw==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43544637"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:53:28 +0200
X-CheckPoint: {67FE64D8-7-F35B2447-E1635CDE}
X-MAIL-CPID: DB57507F5E6F33E9D6B02DFD89F6A31B_1
X-Control-Analysis: str=0001.0A006398.67FE64DD.003A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 662DC16352A;
	Tue, 15 Apr 2025 15:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744725203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/n4PAOWUxiy6GTI0VO9pOTS66Ah8rFoVk3FItB8CDM=;
	b=JFgGQ4+EACo5aPEMIDN03VmkZDwzyb6DpLBatoj0gILdTJCMTCyHoeQKnYM/LdcFUL2n0M
	Ye1e9LXrU1sWtz9o1gOAlJDceaz9BJvcC4W1UGae79XlxxVZHIftuTSnfBigvNfnj0r2EG
	zAY7gBuHxkczYURmzRKPBhTp6y77xS14IPWOxi/WIAZr73btkWzdwTLwbML8Es7wI8OpKs
	oHn6RKUU10P24M63ZQh6nN05jeB3PvWhZdISEX7yO/7wrlW/6eRwOx33iyQQAQ0kLpCGO7
	QRvWZzk+dW38hge+YbO2v8vi42mclHYXceiMm37Weqp0wOX7XdCtxRl1e0LuJA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
 Peng Fan <peng.fan@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject:
 Re: [PATCH 2/7] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
Date: Tue, 15 Apr 2025 15:53:19 +0200
Message-ID: <5004055.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
References:
 <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-2-c0db9d3fd6e9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Dienstag, 8. April 2025, 03:39:58 CEST schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor, and set consumer
>    name.
>  - Use gpiod_set_value to configure output value.
>=20
> reset pin is active low, so when request the gpio, set GPIOD_OUT_HIGH to
> assert reset and later deassert reset with value set to 0.

IMHO it shouldn't matter if that pin is active-low or not. You want to
activate that reset, so GPIOD_OUT_HIGH is correct. If the GPIO is active-low
then nice, everything will be taken careof.

> While at here, reorder the included headers.
>=20
> Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
> polarity for reset-gpios, so all should work as expected with this patch.
>=20
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/codecs/tlv320aic32x4.c | 44 ++++++++++++++++++++--------------=
=2D-----
>  1 file changed, 22 insertions(+), 22 deletions(-)
>=20
> diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320ai=
c32x4.c
> index 7dbcf7f7130b04a27f58f20beb83eb3676c79c3d..1423186f5a6c181a20dd2dd55=
2679d33174edaee 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -9,27 +9,26 @@
>   * Based on sound/soc/codecs/wm8974 and TI driver for kernel 2.6.27.
>   */
> =20
> -#include <linux/module.h>
> -#include <linux/moduleparam.h>
> -#include <linux/init.h>
> -#include <linux/delay.h>
> -#include <linux/pm.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
>  #include <linux/cdev.h>
> -#include <linux/slab.h>
>  #include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
>  #include <linux/of_clk.h>
> +#include <linux/pm.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> =20
> -#include <sound/tlv320aic32x4.h>
>  #include <sound/core.h>
> +#include <sound/initval.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
> -#include <sound/initval.h>
>  #include <sound/tlv.h>
> +#include <sound/tlv320aic32x4.h>
> =20
>  #include "tlv320aic32x4.h"
> =20
> @@ -38,7 +37,7 @@ struct aic32x4_priv {
>  	u32 power_cfg;
>  	u32 micpga_routing;
>  	bool swapdacs;
> -	int rstn_gpio;
> +	struct gpio_desc *rstn_gpio;
>  	const char *mclk_name;
> =20
>  	struct regulator *supply_ldo;
> @@ -1236,7 +1235,14 @@ static int aic32x4_parse_dt(struct aic32x4_priv *a=
ic32x4,
> =20
>  	aic32x4->swapdacs =3D false;
>  	aic32x4->micpga_routing =3D 0;
> -	aic32x4->rstn_gpio =3D of_get_named_gpio(np, "reset-gpios", 0);
> +	/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW =
*/

As stated above this comment shouldn't be necessary, it might be even
confusing if there is some external inverter to the GPIO.

> +	aic32x4->rstn_gpio =3D devm_gpiod_get_optional(aic32x4->dev, "reset", G=
PIOD_OUT_HIGH);
> +	if (IS_ERR(aic32x4->rstn_gpio)) {
> +		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4->rstn_gpio),
> +				     "Failed to get reset gpio\n");
> +	} else {
> +		gpiod_set_consumer_name(aic32x4->rstn_gpio, "tlv320aic32x4_rstn");

Any reason to not set the consumer name to "tlv320aic32x4_reset"? I assume
the 'n' implies active-low. But this is something for the devicetree, not t=
he driver.

Best regards,
Alexander

> +	}
> =20
>  	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
>  				aic32x4_setup->gpio_func, 5) >=3D 0)
> @@ -1372,26 +1378,20 @@ int aic32x4_probe(struct device *dev, struct regm=
ap *regmap,
>  		aic32x4->power_cfg =3D 0;
>  		aic32x4->swapdacs =3D false;
>  		aic32x4->micpga_routing =3D 0;
> -		aic32x4->rstn_gpio =3D -1;
> +		aic32x4->rstn_gpio =3D ERR_PTR(-ENOENT);
>  		aic32x4->mclk_name =3D "mclk";
>  	}
> =20
> -	if (gpio_is_valid(aic32x4->rstn_gpio)) {
> -		ret =3D devm_gpio_request_one(dev, aic32x4->rstn_gpio,
> -				GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");
> -		if (ret !=3D 0)
> -			return ret;
> -	}
> -
>  	ret =3D aic32x4_setup_regulators(dev, aic32x4);
>  	if (ret) {
>  		dev_err(dev, "Failed to setup regulators\n");
>  		return ret;
>  	}
> =20
> -	if (gpio_is_valid(aic32x4->rstn_gpio)) {
> +	if (!IS_ERR(aic32x4->rstn_gpio)) {
>  		ndelay(10);
> -		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
> +		/* deassert reset */
> +		gpiod_set_value_cansleep(aic32x4->rstn_gpio, 0);
>  		mdelay(1);
>  	}
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



