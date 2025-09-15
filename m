Return-Path: <linux-gpio+bounces-26167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E4B57BAE
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4DE188618E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACF2FD1C1;
	Mon, 15 Sep 2025 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5MQNHjd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A0030BF53;
	Mon, 15 Sep 2025 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940362; cv=none; b=DOznAL3x8Qqn4bn0TAG4qgFh5aDhOpCZ/8HJnqB3oiRrei2omokkUePB4Vmx3MW8QyvDyUk6o9oqbHa5HS2WySnTexKRabzFnmOjzo7/2qqBiTZyQXl0vO76gGdrNnA/2KtCTdceH1uOMsLpEADrgJLZqSUGPRXEPFtY+2+H2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940362; c=relaxed/simple;
	bh=BNNYoYpkBHTO9cpmUyT6nQRRrUm5Of6d7v3BDEpFFU4=;
	h=Content-Type:Date:Message-Id:From:To:Subject:Cc:References:
	 In-Reply-To; b=bQ7rB4WZGgXa0SYDWjvzGNY3pGZ9MCEfGb2Azjm4bCrIiqLPJVwbkSM9GEvFvMC3I2+MXk3YrBmNTxf0UorNh1FavxOv3mutflDFjpI8OnKXljw//RYD+s2QDlOwIqsIa1gXQrJwe1x2vAeb9faHvA3cTtrxitne7UM7aGlgMYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5MQNHjd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7B9C4CEF1;
	Mon, 15 Sep 2025 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757940362;
	bh=BNNYoYpkBHTO9cpmUyT6nQRRrUm5Of6d7v3BDEpFFU4=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=P5MQNHjdJOR5OvJ2seL9fNaXLlcWGaiKyZi6zDxypyw2W59qIZyeDLkNYYkRcwAfx
	 YVfCzRNxSYdK9dRclEKMCbWxHfe5vM9u4Phd8LR6GeD0LQ9mRSyHLbD812YZ+EUalj
	 a+f4aAP5uEn0IQs46QKp5fQ9/IP3U2JKi6i34zTB++GhmJd7z0NkCu5YQapAbH6eev
	 vgfsiT0TR8NJcy94zbNNStasbKd+28YOJtnR0ZQ42KEZSzDPVqzSNVrfRqgE/cejaZ
	 FsPmE4okkwbYujW8ISwyubXxYnp+Da7R7oto/toJ+Ir+krtFNPP1/s7B7b9EH5BvVk
	 S/jkQ3yHVBvyA==
Content-Type: multipart/signed;
 boundary=b738722ffd0679501c74392f15a62318d558d5578d88a795dfcc1186f5e5;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 15 Sep 2025 14:45:58 +0200
Message-Id: <DCTDUJO0PS8B.1LD03WTEMNRVP@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo" <shawnguo@kernel.org>,
 "Lee Jones" <lee@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/9] gpio: regmap: add the .fixed_direction_output
 configuration parameter
Cc: "Frank Li" <Frank.Li@nxp.com>
X-Mailer: aerc 0.16.0
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-5-ioana.ciornei@nxp.com>
In-Reply-To: <20250915122354.217720-5-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--b738722ffd0679501c74392f15a62318d558d5578d88a795dfcc1186f5e5
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Ioana,

On Mon Sep 15, 2025 at 2:23 PM CEST, Ioana Ciornei wrote:
> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS FPGA which have fixed-direction input and output GPIO lines mixed
> together in a single register. This cannot be modeled using the
> gpio-regmap as-is since there is no way to present the true direction of
> a GPIO line.
>
> In order to make this use case possible, add a new configuration
> parameter - fixed_direction_output - into the gpio_regmap_config
> structure. This will enable user drivers to provide a bitmap that
> represents the fixed direction of the GPIO lines.

I wonder about the ownership of that allocated memory in the config
structure (and btw, I guess you leak the memory in your driver) and
if it's not better and more error proof to allocate and copy the
bitmap in gpio-regmap too (and maybe use devm_bitmap_alloc()) and
leave it to the caller to handle the passed bitmap. I.e. it could
also be on the stack.

Otherwise, this looks good.

> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Add the fixed_direction_output bitmap to the gpio_regmap_config
>
>  drivers/gpio/gpio-regmap.c  | 12 ++++++++++++
>  include/linux/gpio/regmap.h |  2 ++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index e8a32dfebdcb..2489768686d3 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -31,6 +31,7 @@ struct gpio_regmap {
>  	unsigned int reg_clr_base;
>  	unsigned int reg_dir_in_base;
>  	unsigned int reg_dir_out_base;
> +	unsigned long *fixed_direction_output;
> =20
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
> @@ -129,6 +130,16 @@ static int gpio_regmap_get_direction(struct gpio_chi=
p *chip,
>  	unsigned int base, val, reg, mask;
>  	int invert, ret;
> =20
> +	if (offset >=3D chip->ngpio)
> +		return -EINVAL;

Not sure this can happen. I tried to look into gpiolib.c but
couldn't find anything obvious that it can't happen. Maybe Linus or
Bartosz can comment on that.

> +
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
> @@ -247,6 +258,7 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>  	gpio->reg_clr_base =3D config->reg_clr_base;
>  	gpio->reg_dir_in_base =3D config->reg_dir_in_base;
>  	gpio->reg_dir_out_base =3D config->reg_dir_out_base;
> +	gpio->fixed_direction_output =3D config->fixed_direction_output;
> =20
>  	chip =3D &gpio->gpio_chip;
>  	chip->parent =3D config->parent;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index c722c67668c6..34c143aca42d 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -78,6 +78,8 @@ struct gpio_regmap_config {
>  	int ngpio_per_reg;
>  	struct irq_domain *irq_domain;
> =20
> +	unsigned long *fixed_direction_output;

Please add some documentation.

-michael

> +
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);


--b738722ffd0679501c74392f15a62318d558d5578d88a795dfcc1186f5e5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaMgKhhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/g/OQGApkK4RyQeR27/lOz7UgmjxXWviLT24rk7
HomZpRwCI1WRHKWuke8PKCKR4WSGZcYjAYDBPXI1xnHdn8m/n1TIQChwQTK5HsFI
3TxEofLzFPbcaU5PkHKQoroE+2VZNlrfg8A=
=QdL8
-----END PGP SIGNATURE-----

--b738722ffd0679501c74392f15a62318d558d5578d88a795dfcc1186f5e5--

