Return-Path: <linux-gpio+bounces-26390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73BB89B8D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 798ED7A766C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2099D30E0FA;
	Fri, 19 Sep 2025 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tb27IyoI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07382DCF6B;
	Fri, 19 Sep 2025 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758289264; cv=none; b=sCzyyrzn4kDT7Z/JmjXmwxOSJ9DxtpBeKMpHr7qtyYBTuQAPTcghenaupIJF/ly1WLKdaTvloGHSSVGgF+szcCOZ6xjYDBVMvLzQBeiIfoOKLsj2AI1P3XWVJlelkRMxx8v/RSlT2ODGYqGyCHEB2/ZD4dpTBkAtn4OwuNNm65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758289264; c=relaxed/simple;
	bh=Whnj1sdEiFAxpK/uQRW8qTTkQYUX3XKRBMjGVx+ZtmY=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=MgWSJy8CQn35Acmz2qFvp0L1xXSkv70/VC8XLmLPlstkA4XbY+pPFphpFbT6AWc5ioh8LGqNV/rLaYYtrhRwU2Iv7U+ZLJKrjXd3h3yjvQqDTjr4rA3OHMLIpwXpjrae+t7/2gYRYM8bWfeUdfGXMhW4On4TuLMNKwPlGCcha2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tb27IyoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2637C4CEF0;
	Fri, 19 Sep 2025 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758289264;
	bh=Whnj1sdEiFAxpK/uQRW8qTTkQYUX3XKRBMjGVx+ZtmY=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Tb27IyoIUHVlzAJfaAOer8SLyV2BnACaFPOHyyUg7dCx2FN4I7sQ8m4ueP/8OtUi4
	 W7XhvSezJOVprBY5nqgYEzJnZmepH6zq9VyDUsN0+Bzu8742C8lTG3lmpl7+KlLz+f
	 JOxB0RWffJbBdDdH7TGSkH+ReWTL+juNY6NA5Cdn61pcqSBeHYOnwo7WAxQUZZQkr1
	 o4WSYmA90Lohiao+oX3bb9IcxVtQL5OY0HMH6diCzjc655SE84x+nKzYWuT7Ep3BSI
	 O2XBDt0PQ9mJUnWgv7hOXia+bvDxhF5WfRq2noNEnhg9AJ3L4xnHrh5MudEH73rM+w
	 +DbI6BrsQfQVw==
Content-Type: multipart/signed;
 boundary=56d4de16baac021d3a0c1d32adf4ccbce942bc9b2c00b43def604fbb9d19;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 19 Sep 2025 15:41:00 +0200
Message-Id: <DCWTIV3281OX.1N3AA8K3T21LY@kernel.org>
Cc: "Frank Li" <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo" <shawnguo@kernel.org>,
 "Lee Jones" <lee@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 06/11] gpio: regmap: add the .fixed_direction_output
 configuration parameter
X-Mailer: aerc 0.16.0
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
 <20250919132515.1895640-7-ioana.ciornei@nxp.com>
In-Reply-To: <20250919132515.1895640-7-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--56d4de16baac021d3a0c1d32adf4ccbce942bc9b2c00b43def604fbb9d19
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> @@ -129,6 +130,13 @@ static int gpio_regmap_get_direction(struct gpio_chi=
p *chip,
>  	unsigned int base, val, reg, mask;
>  	int invert, ret;
> =20
> +	if (gpio->fixed_direction_output) {
> +		if (test_bit(offset, gpio->fixed_direction_output))
> +			return GPIO_LINE_DIRECTION_OUT;
> +		else
> +			return GPIO_LINE_DIRECTION_IN;
> +	}
> +
>  	if (gpio->reg_dat_base && !gpio->reg_set_base)
>  		return GPIO_LINE_DIRECTION_IN;
>  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> @@ -277,6 +285,17 @@ struct gpio_regmap *gpio_regmap_register(const struc=
t gpio_regmap_config *config
>  			return ERR_PTR(ret);

Not related to your patch, but this line above is wrong. That should
be "goto err_free_gpio". Would you mind adding a patch for it? I
could do it myself, but it will probably conflict with this series.
I'm fine either way (if you do it, don't forget the Fixes: tag).

>  	}
> =20
> +	if (config->fixed_direction_output) {
> +		gpio->fixed_direction_output =3D bitmap_alloc(chip->ngpio,
> +							    GFP_KERNEL);
> +		if (!gpio->fixed_direction_output) {
> +			ret =3D -ENOMEM;
> +			goto err_free_gpio;
> +		}
> +		bitmap_copy(gpio->fixed_direction_output,
> +			    config->fixed_direction_output, chip->ngpio);
> +	}
> +
>  	/* if not set, assume there is only one register */
>  	gpio->ngpio_per_reg =3D config->ngpio_per_reg;
>  	if (!gpio->ngpio_per_reg)
> @@ -293,7 +312,7 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
> =20
>  	ret =3D gpiochip_add_data(chip, gpio);
>  	if (ret < 0)
> -		goto err_free_gpio;
> +		goto err_free_bitmap;

There's also an err_free_gpio jump below, that should also be
replaced with err_free_bitmap.

Otherwise looks good.

-michael

--56d4de16baac021d3a0c1d32adf4ccbce942bc9b2c00b43def604fbb9d19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaM1dbBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gX2QF/ZtcAS802B5vR1Y3Nx4gepUDmm8Xa7+Lp
Q1NwNB8L/Nz+7vE98O+AGlYe3ySVcSyXAYCP6H1epCSQ+QcZsXUfE89BbhUapGDH
Ggqbw/zjQJjMEllic7eYt8G1gQRkdKm3V6I=
=s+d8
-----END PGP SIGNATURE-----

--56d4de16baac021d3a0c1d32adf4ccbce942bc9b2c00b43def604fbb9d19--

