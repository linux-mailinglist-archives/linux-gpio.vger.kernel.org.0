Return-Path: <linux-gpio+bounces-27344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD8BF4F95
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C3FA4E159F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C6A27B331;
	Tue, 21 Oct 2025 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZlXlZ8D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAB246762;
	Tue, 21 Oct 2025 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031989; cv=none; b=pYv+Wq2ERG966eSV61/La+/vfPeWp+PFdn63rJdkv0NY26COBa7rsTSkslOESD2ZIcew6kIekZ47VF/3e39sC2vE78vGA9eJ0Fj3TtVC/k5Kpd2PE8EFNmYjgmNgr1kF29q8DZpsYYXeao12AsZcvi4CLprxWsAQNKTRoMiFYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031989; c=relaxed/simple;
	bh=XbheeYVcu+eWSj83TG8XUBPLwc0y4ngILfkU6mRhd2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=OgUxckKVMxG1A9Nlb/2iEXypZjyKB2PbbD223H8DTKfd1SPkwSQdzWFu2534ZyORcopQIH2NtlOqgFllVh7lqge9JrXp9piM9E1K77/LdnYdlglygi5959riPFoZ+rab1N2wTp0L3Zf1ERc7QlpAvgzJjthEWXdBG2HqTq/NjoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZlXlZ8D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AB4C4CEF1;
	Tue, 21 Oct 2025 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761031989;
	bh=XbheeYVcu+eWSj83TG8XUBPLwc0y4ngILfkU6mRhd2k=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=RZlXlZ8DnKlN6Lwiaq5eHxGTAMB6bajTUYOaSncUWSyvlAC6kGLqvDIBX7wHvbncY
	 71TzWkcUu5iCJCGr1LQpJBKPIXA282YQ1DAKo7qDc6j2xAQa+12Kof5/BFihmlaCee
	 s2I85ycMt4fskAumZJqCKzRrFwy0XVvgzQgWKXrMIxBf2psl2qqfzSFMxg/KD0jCYp
	 3FgLSf4kFLokNWQOFRZs4+ZxgzkiLmEnzEQH8OaqrmtFBKEDmyRYhad2VbkV2OGs5f
	 8uPwVvArsrlX8BIG4qkIFx9WNSqBrKx5u4AAj1jBE7hFDDffjqsoFsrnzwhRXbZNvi
	 LgC4FoKMvT+Ew==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5a96699aa7bce8cff3c065f27f0a06d176682fa96de5831cad390e619421;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 21 Oct 2025 09:33:04 +0200
Message-Id: <DDNTQLB5YRM3.39C226E0QO6X9@kernel.org>
To: "Sander Vanheule" <sander@svanheule.net>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [RFC PATCH 1/2] gpio: regmap: Force writes for aliased data
 regs
Cc: <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251020115636.55417-1-sander@svanheule.net>
 <20251020115636.55417-2-sander@svanheule.net>
In-Reply-To: <20251020115636.55417-2-sander@svanheule.net>

--5a96699aa7bce8cff3c065f27f0a06d176682fa96de5831cad390e619421
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Oct 20, 2025 at 1:56 PM CEST, Sander Vanheule wrote:
> GPIO chips often have data input and output fields aliased to the same
> offset. Since gpio-regmap performs a value update before the direction
> update (to prevent glitches), a pin currently configured as input may
> cause regmap_update_bits() to not perform a write.
>
> This may cause unexpected line states when the current input state
> equals the requested output state:
>
>         OUT   IN      OUT
>     DIR ''''''\...|.../''''''
>
>     pin ....../'''|'''\......
>              (1) (2) (3)
>
>     1. Line was configurad as out-low, but is reconfigured to input.
>        External logic results in high value.
>     2. Set output value high. regmap_update_bits() sees the value is
>        already high and discards the register write.
>     3. Line is switched to output, maintaining the stale output config
>        (low) instead of the requested config (high).
>
> By switching to regmap_write_bits(), a write of the requested output
> value can be forced, irrespective of the read state. Do this only for
> aliased registers, so the more efficient regmap_update_bits() can still
> be used for distinct registers.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  drivers/gpio/gpio-regmap.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index ab9e4077fa60..ba3c19206ccf 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -93,7 +93,7 @@ static int gpio_regmap_set(struct gpio_chip *chip, unsi=
gned int offset,
>  {
>  	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
>  	unsigned int base =3D gpio_regmap_addr(gpio->reg_set_base);
> -	unsigned int reg, mask;
> +	unsigned int reg, mask, mask_val;
>  	int ret;
> =20
>  	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
> @@ -101,9 +101,15 @@ static int gpio_regmap_set(struct gpio_chip *chip, u=
nsigned int offset,
>  		return ret;
> =20
>  	if (val)
> -		ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask);
> +		mask_val =3D mask;
>  	else
> -		ret =3D regmap_update_bits(gpio->regmap, reg, mask, 0);
> +		mask_val =3D 0;
> +
> +	/* ignore input values which shadow the old output value */
> +	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
> +		ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> +	else
> +		ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask_val);

I wonder if we should just switch to regmap_write_bits() entirely.

In patch 2, you've wrote:

> The generic gpiochip implementation stores a shadow value of the
> pin output data, which is updated and written to hardware on output
> data changes. Pin input values are always obtained by reading the
> aliased data register from hardware.

I couldn't find that in the code though. But if the gpiolib only
updates the output register on changes, the write part in
regmap_update_bits() would always occur.

In any case, feel free to add.

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--5a96699aa7bce8cff3c065f27f0a06d176682fa96de5831cad390e619421
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPc3MRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j/kwF/bIZorni+ajmT4gREj7sDrBRoFGqrZr4+
+Jb5htHw4G2KNKE0ag3j13k5ujnBrq7HAYCKmmzc0S9bjRG+NIr5Q9Qp0WPM5et1
sCCEaoOOwy6HlHIYfWl1KJl+Xzt+UlaUU20=
=CdCx
-----END PGP SIGNATURE-----

--5a96699aa7bce8cff3c065f27f0a06d176682fa96de5831cad390e619421--

