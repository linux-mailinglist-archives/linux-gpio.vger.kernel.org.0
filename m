Return-Path: <linux-gpio+bounces-26394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE6B89CB5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 16:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94C03B7EFA
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 14:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62C82FE56B;
	Fri, 19 Sep 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXx6/+2W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E61D19D89E;
	Fri, 19 Sep 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758290824; cv=none; b=Kc+7g+p+/1RQuuK7jHSZvBGVxD8rjsq1OYo7J7KYimaFFDcCkMmfhILf6obA6nsy4Oxy+Nx9G6tIl7d3h1/vgbPjupNc2GTxw78tIw6cZwVdIOmnKMuWrLmggvgfkrK+ANF4UL5x+lCLteO+Mdy32DIUWeB9x1I22UmiS8fiJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758290824; c=relaxed/simple;
	bh=lD0zXCe7O3Qv3mgyhk/Uwu2fvbC6A8RGfqhioMnV9DI=;
	h=Content-Type:Date:Message-Id:To:Subject:Cc:From:References:
	 In-Reply-To; b=nG3pQrv98D30Ckfo4kzxYBv8NwQc3ON+L+Q4sIvbdwAjM7QfMXfiCFnQH78y1GV7L/F2sfefkeSn4yMiWjtazfvpKQ00yJAnFJQiTSIG3fj1D9d3/jZncSs44JqFScVCn6ScEasVo6vqGgrsP22J3Fr22fCfynQByniQoiO4MDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXx6/+2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1887C4CEF0;
	Fri, 19 Sep 2025 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758290824;
	bh=lD0zXCe7O3Qv3mgyhk/Uwu2fvbC6A8RGfqhioMnV9DI=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=JXx6/+2WdPJVF7J9Hh1r2V8RZ6VEK1BgvPiiaJV3ytWYTeQOgh0tBHw0txKmY2ReZ
	 EKJnJgq7OJV8L3GWG2NxvLSg59bJbzPeVcuN1fMiIUXrYakOVsg6cUkaaSu1juGWd7
	 fYzBwYDINRoJKOl5lalsU3slOinKwG3mMyplPGCZwZKtfN9bil9k82n/YAlNAtR/p8
	 QA5JGxx5vbKjLxt7Z6kKmRT7zeeL3GyezT8LgKBYOdZtLj98VGwFcz/gXnTZejPn2a
	 /6/Fp7wqJ6K+y4Srusv9edoS3oXQ3cnmb05V+m3F5d0XPcJK8Z/FI+oLWbJFp6Fd1+
	 r7M6LZ7sGxEbQ==
Content-Type: multipart/signed;
 boundary=00b412111fd7ee6f5957702d234f390bcbb45bd82c439efd0768cbbe22e3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 19 Sep 2025 16:07:00 +0200
Message-Id: <DCWU2RORGVQS.1R1V3SNBA883K@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v4 06/11] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn
 Guo" <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Frank Li" <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
 <20250919132515.1895640-7-ioana.ciornei@nxp.com>
 <DCWTIV3281OX.1N3AA8K3T21LY@kernel.org>
 <re2izaxwbjp6hcms3cps4l4tfvwaxyt56gkc7ohrftcjizwkwt@jsjjo3b6xrcs>
In-Reply-To: <re2izaxwbjp6hcms3cps4l4tfvwaxyt56gkc7ohrftcjizwkwt@jsjjo3b6xrcs>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--00b412111fd7ee6f5957702d234f390bcbb45bd82c439efd0768cbbe22e3
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > > @@ -129,6 +130,13 @@ static int gpio_regmap_get_direction(struct gpio=
_chip *chip,
> > >  	unsigned int base, val, reg, mask;
> > >  	int invert, ret;
> > > =20
> > > +	if (gpio->fixed_direction_output) {
> > > +		if (test_bit(offset, gpio->fixed_direction_output))
> > > +			return GPIO_LINE_DIRECTION_OUT;
> > > +		else
> > > +			return GPIO_LINE_DIRECTION_IN;
> > > +	}
> > > +
> > >  	if (gpio->reg_dat_base && !gpio->reg_set_base)
> > >  		return GPIO_LINE_DIRECTION_IN;
> > >  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> > > @@ -277,6 +285,17 @@ struct gpio_regmap *gpio_regmap_register(const s=
truct gpio_regmap_config *config
> > >  			return ERR_PTR(ret);
> >=20
> > Not related to your patch, but this line above is wrong. That should
> > be "goto err_free_gpio". Would you mind adding a patch for it? I
> > could do it myself, but it will probably conflict with this series.
> > I'm fine either way (if you do it, don't forget the Fixes: tag).
>
> If this would be the only change, I would not do a v5. If there are more
> things to change, of course.

Fine by me.

> > >  	}
> > > =20
> > > +	if (config->fixed_direction_output) {
> > > +		gpio->fixed_direction_output =3D bitmap_alloc(chip->ngpio,
> > > +							    GFP_KERNEL);
> > > +		if (!gpio->fixed_direction_output) {
> > > +			ret =3D -ENOMEM;
> > > +			goto err_free_gpio;
> > > +		}
> > > +		bitmap_copy(gpio->fixed_direction_output,
> > > +			    config->fixed_direction_output, chip->ngpio);
> > > +	}
> > > +
> > >  	/* if not set, assume there is only one register */
> > >  	gpio->ngpio_per_reg =3D config->ngpio_per_reg;
> > >  	if (!gpio->ngpio_per_reg)
> > > @@ -293,7 +312,7 @@ struct gpio_regmap *gpio_regmap_register(const st=
ruct gpio_regmap_config *config
> > > =20
> > >  	ret =3D gpiochip_add_data(chip, gpio);
> > >  	if (ret < 0)
> > > -		goto err_free_gpio;
> > > +		goto err_free_bitmap;
> >=20
> > There's also an err_free_gpio jump below, that should also be
> > replaced with err_free_bitmap.
>
> I am a bit confused. With this patch applied there is only one 'goto
> err_free_gpio' in gpio-regmap.c and that's the one added by me above.
>
> What am I missing?

Probably commit 553b75d4bfe9 ("gpio: regmap: Allow to allocate
regmap-irq device") which was added to the mfd/gpio/next tree a
couple of days ago.

-michael

--00b412111fd7ee6f5957702d234f390bcbb45bd82c439efd0768cbbe22e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaM1jhBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jKGwF+PVRyuzBD4EqNfDUok7ywKjX5FxI4SZP9
oR2Lu1LYWA4+ToNQTjkw4q3WDcQQ1kNyAX9r8PsuQzPBJmSqmKIWwjUl7JRKBf55
1Q3GSgZirXf6a8lOV0ogw6h0lbYp7BoCNEk=
=Kyd5
-----END PGP SIGNATURE-----

--00b412111fd7ee6f5957702d234f390bcbb45bd82c439efd0768cbbe22e3--

