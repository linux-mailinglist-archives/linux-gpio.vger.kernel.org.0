Return-Path: <linux-gpio+bounces-19434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21745AA041D
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 09:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E53A1B6443B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 07:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B03327466D;
	Tue, 29 Apr 2025 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLzBkn7v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8A1F76A5;
	Tue, 29 Apr 2025 07:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745910597; cv=none; b=Pk8mXNEgx0mx48iVWdJpLpqzZx5H7WfI7agHkwrkE754sJZqeSg2lMn/qbBSQkgScahAU+fIBwzpy28uR2VPa+jZejIqxVlHEW92v39Qj2wtyBW1ts5kf7IutmA1su/49ExPzBjdKnSWQG4kLf14Zc4y+i/xNlvPPtGZT9w62/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745910597; c=relaxed/simple;
	bh=XYz3g2B0rvs9Ov2YUd2o2zmJrspxC64MWa2M4SH/gUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ru4z9q68NvzyfXFDwp8a2iBFf4+k9Ja1rO9BvZ4ss60f420FcxX7fryVsvP2JxYRx3g6TNqOfachoM+oedefx30JPP8J+GlucXE7zvsAGaQIkrUXXAvSlMRuzL5rzZRru1o6kOtClO2I8eIpAGkcyRzPl4EE2K1JJYkAmKIYYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLzBkn7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782F9C4CEE3;
	Tue, 29 Apr 2025 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745910596;
	bh=XYz3g2B0rvs9Ov2YUd2o2zmJrspxC64MWa2M4SH/gUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLzBkn7vxR3ao/EIan1Ff3uh7sQpmsEwhTyvp5IWbiNtqN50Zz/Xyge++kELaJN0q
	 kMFpD/jygnIMW5irfCRHI1/OVghY9TyguwAoG6JGFRuLB12fPTTndhMsERnLtxJVI+
	 wrdDiskFcX7rprpqyAD5jb78XXPmEjOP4woZg3f8UV4ahjmC8sga4B3fg+JZGGbSsz
	 8VmTcfeSdQfDPyV/QYga3rL+W+deyMnR0DXK8PsAVfjFfbba+7pehYP3BREI1aPGXl
	 eLCkMiD9L+6FQVeWWGCGc7G102jR3mGdcoBf1JnDrEjP48Wz5un/kPBYmstcawhD9D
	 ln9Dj+vJkBQ6A==
Date: Tue, 29 Apr 2025 09:09:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: mediatek: airoha: use new GPIO line value
 setter callbacks
Message-ID: <aBB7QkazpVxlUCJc@lore-desk>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
 <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SzPC/w3b/xBP/t6u"
Content-Disposition: inline
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-1-93e6a01855e7@linaro.org>


--SzPC/w3b/xBP/t6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-airoha.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index 5d84a778683d..b97b28ebb37a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2247,15 +2247,16 @@ static int airoha_convert_pin_to_reg_offset(struc=
t pinctrl_dev *pctrl_dev,
>  }
> =20
>  /* gpio callbacks */
> -static void airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
> -			    int value)
> +static int airoha_gpio_set(struct gpio_chip *chip, unsigned int gpio,
> +			   int value)
>  {
>  	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);
>  	u32 offset =3D gpio % AIROHA_PIN_BANK_SIZE;
>  	u8 index =3D gpio / AIROHA_PIN_BANK_SIZE;
> =20
> -	regmap_update_bits(pinctrl->regmap, pinctrl->gpiochip.data[index],
> -			   BIT(offset), value ? BIT(offset) : 0);
> +	return regmap_update_bits(pinctrl->regmap,
> +				  pinctrl->gpiochip.data[index],
> +				  BIT(offset), value ? BIT(offset) : 0);
>  }
> =20
>  static int airoha_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> @@ -2280,9 +2281,7 @@ static int airoha_gpio_direction_output(struct gpio=
_chip *chip,
>  	if (err)
>  		return err;
> =20
> -	airoha_gpio_set(chip, gpio, value);
> -
> -	return 0;
> +	return airoha_gpio_set(chip, gpio, value);
>  }
> =20
>  /* irq callbacks */
> @@ -2419,7 +2418,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->free =3D gpiochip_generic_free;
>  	gc->direction_input =3D pinctrl_gpio_direction_input;
>  	gc->direction_output =3D airoha_gpio_direction_output;
> -	gc->set =3D airoha_gpio_set;
> +	gc->set_rv =3D airoha_gpio_set;
>  	gc->get =3D airoha_gpio_get;
>  	gc->base =3D -1;
>  	gc->ngpio =3D AIROHA_NUM_PINS;
> @@ -2715,9 +2714,7 @@ static int airoha_pinconf_set_pin_value(struct pinc=
trl_dev *pctrl_dev,
>  	if (pin < 0)
>  		return pin;
> =20
> -	airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
> -
> -	return 0;
> +	return airoha_gpio_set(&pinctrl->gpiochip.chip, pin, value);
>  }
> =20
>  static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
>=20
> --=20
> 2.45.2
>=20

--SzPC/w3b/xBP/t6u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBB7QgAKCRA6cBh0uS2t
rH+7AP9aAxct76GnQDHEVxQpxzo251BHKc2c0P+HYX1/qSMfZQD/bQxwhnZGiu8p
hKaJ4RR5BS1SvzR7LL64CT3ArjhR5A4=
=KZkz
-----END PGP SIGNATURE-----

--SzPC/w3b/xBP/t6u--

