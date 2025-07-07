Return-Path: <linux-gpio+bounces-22835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3BDAFAACF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9937C16E311
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 05:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD856262FEC;
	Mon,  7 Jul 2025 05:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hNBc1W2q";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RtllfmDL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A42E3716;
	Mon,  7 Jul 2025 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865790; cv=none; b=WxiwvjaisrcO7gr6vcd4xlzPqOwhT+MNMAJ2VodpiOc6HxdRxLIbJ13sWF3aGs7+WMRPpgfWEf/leQ7a5NAl+nGpVip1fNM0GePwcb+QUPihZNefC8egP573/znCugId/ist/QQ9GRf97EaXlXniJBg0IWiAJ09fHZvJPJxf3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865790; c=relaxed/simple;
	bh=x5ClnhVxoTppU8mcAz2GviFtfU98kezUnu2JV0mVGtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1Au1Hy3Mk7PmYKBbXNuWVIljXzxqKZ9X1qwltIGXvXw5HZq9I0gM8CSO7QhPRMKOljQiGLLt8X2HldwlQiQOe3qvLxLfgDcHereMO2ziRuDWFiMobOQToWdU1OlDUtmwPMtt4ijRLFM3tu2/rOytL0wT7m0cSEz5WiL22AG278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=hNBc1W2q; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RtllfmDL reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751865787; x=1783401787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tAFzTdvEL/g2hW5e7OE/YHFfQnWN6WPVOHZ43Rh/S78=;
  b=hNBc1W2qJoU13apQ72jiXddV+3X/3kUYw/LeV4tmGlGSbl6wV4AMFT3v
   lFQ+GIuAXSptDeaGmUJAXdATGfvI6M7u2Kg++eDrhNlLdYDZxye4IV+kY
   PHC+dYnEbUuZj0ULzanLbL6VABJlbBtQBvBlh7ZcIQfg1uKv3FUVa2SiB
   72xZ17x09qaH+t9Vopli+adFMDmF0fK3P/tNfjYUxJ6nAOqO/ZXW2LruN
   QH556G38ItUk2xkPGTvqwMKc6b2lvCl/zpUgFKtC7N0CMo+Ea8zXx/ys0
   N8XPt9IPUZ/lTow3/UIcR5FQJyaJv7wMgtnrb+FO3TBbAjSVvImZ4HGqR
   w==;
X-CSE-ConnectionGUID: 9IcLi66/TAKgMudn+Tfuow==
X-CSE-MsgGUID: yWmDf2cXSrKDRFiWqJ8AGw==
X-IronPort-AV: E=Sophos;i="6.16,293,1744063200"; 
   d="scan'208";a="45049793"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jul 2025 07:23:03 +0200
X-CheckPoint: {686B59B7-13-943DFC15-D71A48EE}
X-MAIL-CPID: C0CD751F9E2B6DA5070A76C743CE7991_5
X-Control-Analysis: str=0001.0A006372.686B59EE.0019,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 122AC161583;
	Mon,  7 Jul 2025 07:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751865778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAFzTdvEL/g2hW5e7OE/YHFfQnWN6WPVOHZ43Rh/S78=;
	b=RtllfmDLili5K+5wVLFQJ3haQIUGJmPTG8r0NaW/hCoaYOlep+G5s3XmAl/dfWgZmmCxEy
	yjjNAXPEhFK9kjX0uYRyiy3C1UXkiI/KkPh6UTPpmD0UdWXoT1ltgJqxXxBuKDATfpFqvG
	CBLtkRpB1HenMqt2hoJbTaQVhc1fsL+9Gct9WqTNGk53eaJeuAkKU/pJ80uaiLDDhN9hvF
	SuMgve0n8q1PP8Z6s3Yn7JSgarjJZ17K+RcKjkGasYpd7SfPYooffFbDBRHm1sUpbmy0O5
	mJ4DZvuB2/PM0xGqP+1inJuBF84o/XGzGaHuK+vKOLh+Kz9gTH/M4Q0VNbmuBQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject:
 Re: [PATCH 2/2] ASoC: codec: tlv320aic32x4: Convert to GPIO descriptors
Date: Mon, 07 Jul 2025 07:22:57 +0200
Message-ID: <3372384.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250706-asoc-gpio-1-v1-2-f0912095e923@nxp.com>
References:
 <20250706-asoc-gpio-1-v1-0-f0912095e923@nxp.com>
 <20250706-asoc-gpio-1-v1-2-f0912095e923@nxp.com>
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

Am Sonntag, 6. Juli 2025, 03:04:24 CEST schrieb Peng Fan:
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor, and set consumer
>    name.
>  - Use gpiod_set_value to configure output value.
>=20
> While at here, reorder the included headers.
>=20
> Checking the DTS that use the device, all are using GPIOD_ACTIVE_LOW
> polarity for reset-gpios, so all should work as expected with this patch.
>=20
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

Mh, maybe create a single commit sorting these headers.

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
> +	aic32x4->rstn_gpio =3D devm_gpiod_get_optional(aic32x4->dev, "reset", G=
PIOD_OUT_HIGH);
> +	if (IS_ERR(aic32x4->rstn_gpio)) {
> +		return dev_err_probe(aic32x4->dev, PTR_ERR(aic32x4->rstn_gpio),
> +				     "Failed to get reset gpio\n");
> +	} else {
> +		gpiod_set_consumer_name(aic32x4->rstn_gpio, "tlv320aic32x4_rstn");
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

Shouldn't this be NULL similar to when devm_gpiod_get_optional() doesn't
find any reset GPIO?

Despite that, looks good and works as intended:
Tested-By: Alexander Stein <alexander.stein@ew.tq-group.com>

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



