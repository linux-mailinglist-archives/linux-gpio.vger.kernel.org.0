Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F662A8520
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 18:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731620AbgKERlQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 12:41:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:35046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731609AbgKERlQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 12:41:16 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5086206CA;
        Thu,  5 Nov 2020 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604598075;
        bh=jLceanMH05KdG86WkZBB6n6wTXzxintlHLTl9Cs/5ZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cbEuNZ2rjfnqX1xKGJXGMDXzxmT7fxPcoV/YtU73CqDCr/Dqws1EeZVfWvcc1pGRG
         1UZ2+AVjdWl4UzsN736Yie4uS9+9FN7eGlgjM2mrnG/6uVTGfeDyyCQPy2jiEGHhpz
         Fk9hnXI4kXV3o9kjArRYY7MpxP4YqsDrZm+X+vwk=
Date:   Thu, 5 Nov 2020 17:40:57 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RFT PATCH v2 7/8] gpio: exar: switch to using regmap
Message-ID: <20201105174057.GG4856@sirena.org.uk>
References: <20201104193051.32236-1-brgl@bgdev.pl>
 <20201104193051.32236-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline
In-Reply-To: <20201104193051.32236-8-brgl@bgdev.pl>
X-Cookie: It's the thought, if any, that counts!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 08:30:50PM +0100, Bartosz Golaszewski wrote:

> @@ -119,21 +81,39 @@ static void exar_set_value(struct gpio_chip *chip, u=
nsigned int offset,
>  	unsigned int addr =3D exar_offset_to_lvl_addr(exar_gpio, offset);
>  	unsigned int bit =3D exar_offset_to_bit(exar_gpio, offset);
> =20
> -	exar_update(chip, addr, value, bit);
> +	regmap_assign_bits(exar_gpio->regs, addr, BIT(bit), value);
>  }

This appears to be the use of _assign_bits() and TBH I'm still both
having a hard time understanding the motivation for it and liking the
name, especially since AFAICT it's only setting a single bit here.  The
above is just

	regmap_update_bits(exar_gpio->regs, addr, 1 << bit, value << bit);

AFAICT (and indeed now I dig around assign_bit() only works on a single
bit and does both shifts which makes the correspondance with that
interface super unclear, we're not mirroring that interface here).  If
you're trying to clone the bitops function it should probably be an
actual clone of the bitops function not something different, that would
be clearer and it'd be easier to understand why someone would want the
API in the first place.  But perhaps I'm missing something here?

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+kOSgACgkQJNaLcl1U
h9BvTwf+JQnDErho/812fHKBe67LfZpu8fAQk/xgihUH1umVooHQgLbD/pHnM/XZ
OM4CudCboMHcmPl4fLi/g21VXUMuFOOiHmB7GQnQfK73AJXU6VK0+lLCWjZeMy7h
pv1TQFMrdB6rIV4tbu0b0uFmh3rSpwefkdkhCnzh0N+ZihDrmLamleqcrRkjraoy
Jdn+LNKqie9Y9eS0ZyuMv0InlR4oYFCMzd/l/VAtAE7fZ8CWXhxOk5dAP7T+XYKe
FulE4B+YXf/7OpHAv4uXYJ1CdUV/4+gDcAfg4BWwqxMKH0xQgMofhDzipa59eAS1
FExJ9R/kSpLGGW+E8C0ootOJMohteQ==
=zR8C
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--
