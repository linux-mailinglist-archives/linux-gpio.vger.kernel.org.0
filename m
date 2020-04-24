Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8476F1B7932
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 17:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgDXPO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 11:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726959AbgDXPO6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 11:14:58 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FABC09B045;
        Fri, 24 Apr 2020 08:14:58 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id y19so4803379qvv.4;
        Fri, 24 Apr 2020 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QSwg6gghB4J4fxCnCtJXebe2/h8we5Uo4r3Dshm/gm4=;
        b=RE5RXCnG+VdWldHaDGPi6/nEecCcxvkxHbnfNVgzb8DKgjrwjLAI7Ze5lCs/z+RBFG
         CTgV2hmcegRhgTJOUk3RdA7otfcOx/Vijtj4L1PMpdAc8chmHhe0asg/Um6loo9AZkg8
         Nf1Be1hpnlfQgM7Sxant7wbJ08eQAF9hIFGrK7VdwNPrmFs76N3kR4HjHejlAlgSoXVy
         h2y2bHax3dUAlj1ueE8EVNlSOpRDWtKCT6xogZpn7YFxhj9/c5McHRdeCn20x8rbe5zv
         bKjN/WCMOEx3W+QkOMhfVtb0u8Nk95Zz4JRqIWO5tw0TYUq+VSID/HozDkZ2YHNVmqB/
         mY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QSwg6gghB4J4fxCnCtJXebe2/h8we5Uo4r3Dshm/gm4=;
        b=dkrSswHcY6xjzwVwiWZWCuRPPY79vfS/fcasQPW/6tnF6FJQrJ5vlJ+UDqyw+sod6f
         Vo1y2e3/8/oUc8P2EYh8iKgNat3SA1Qw7lbgh7CQY4Gn1GwKfQZHZZI+P3JdDGFx18vx
         lnQ5nSf6awB62jzRSDthL+ojdC8Qqs4nu8hbzT0RKK7C4JBckDFaBSKqim9NOHY62/uM
         FXK7fof7rIIXJRcsZFONigD0yf5lUFIrTGXYXWDcki2m0IdI/wc5lvpL6/9r4oSW5hNy
         Jf6E+iGGwROH89drmH71dRR80mmQitlsiUqR1fOxK/2KqQD9dt5BYRQY05ZXfSBHjAxh
         pusw==
X-Gm-Message-State: AGi0PubhDq4X+XGm1Lv7YfAwxJ9kBKPTUkdWRjriJJpOgSSqIdRRLXK4
        lSUfmvUeHhspdCQ15e+InUg=
X-Google-Smtp-Source: APiQypIvi4BPTJ2KoCQr/5RWFfI01+/rIl1QR4oi9k+baj+nWnNzEnKdLOjI7nNlp1fBi5DGaJG0bg==
X-Received: by 2002:a05:6214:1262:: with SMTP id r2mr9952180qvv.126.1587741297402;
        Fri, 24 Apr 2020 08:14:57 -0700 (PDT)
Received: from icarus (072-189-064-225.res.spectrum.com. [72.189.64.225])
        by smtp.gmail.com with ESMTPSA id 65sm3863089qkf.79.2020.04.24.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 08:14:56 -0700 (PDT)
Date:   Fri, 24 Apr 2020 11:14:54 -0400
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <20200424151454.GB5034@icarus>
References: <20200424123050.GA5653@syed>
 <20200424135547.GB3255@icarus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline
In-Reply-To: <20200424135547.GB3255@icarus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 09:55:47AM -0400, William Breathitt Gray wrote:
> On Fri, Apr 24, 2020 at 06:00:50PM +0530, Syed Nayyar Waris wrote:
> > This patch reimplements the thunderx_gpio_set_multiple function in
> > drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
> > Instead of looping for each bank in thunderx_gpio_set_multiple
> > function, now we can skip bank which is not set and save cycles.
> >=20
> > Cc: Robert Richter <rrichter@marvell.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >  drivers/gpio/gpio-thunderx.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
> > index 9f66dea..74aea25 100644
> > --- a/drivers/gpio/gpio-thunderx.c
> > +++ b/drivers/gpio/gpio-thunderx.c
> > @@ -275,12 +275,16 @@ static void thunderx_gpio_set_multiple(struct gpi=
o_chip *chip,
> >  				       unsigned long *bits)
> >  {
> >  	int bank;
> > -	u64 set_bits, clear_bits;
> > +	u64 set_bits, clear_bits, gpio_mask;
> > +	const unsigned long bank_size =3D 64;
> > +	unsigned long offset;
> > +
> >  	struct thunderx_gpio *txgpio =3D gpiochip_get_data(chip);
> > =20
> > -	for (bank =3D 0; bank <=3D chip->ngpio / 64; bank++) {
> > -		set_bits =3D bits[bank] & mask[bank];
> > -		clear_bits =3D ~bits[bank] & mask[bank];
> > +	for_each_set_clump(offset, gpio_mask, mask, chip->ngpio, bank_size) {
> > +		bank =3D offset / bank_size;
> > +		set_bits =3D bits[bank] & gpio_mask;
> > +		clear_bits =3D ~bits[bank] & gpio_mask;
> >  		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GP=
IO_TX_SET);
> >  		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + =
GPIO_TX_CLR);
> >  	}
> > --=20
> > 2.7.4
>=20
> We noticed in the original code that this set_multiple callback does not
> appear to work correctly on systems where BITS_PER_LONG =3D=3D 32. On tho=
se
> systems, the bits and mask values are 32-bit, but the for loop jumps 64
> bits at a time -- that means the loop is skipping the upper 32 gpio
> lines of every iteration.
>=20
> Is the gpio-thunderx driver only intended for 64-bit systems? Or this
> behavior a bug?
>=20
> William Breathitt Gray

Nevermind, I spoke too soon; I see there's a depends on 64BIT line in
the Kconfig for GPIO_THUNDERX.

William Breathitt Gray

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl6jAm4ACgkQhvpINdm7
VJK2DRAAjsPKyCL9M0yAhH8ymPu3Lg1Mgg3hUc3R0ZDUgEk570duKvcY4vGEWtBl
EyFpN+ZUE+XFnftAEStFDGka9cvQyYMNdyfo9AGj2Ht1Ypo6UfTvHmIMnmjUB5zj
4jThLWmEXRxXZOaNz9lQAdtdqaxTM3RzSiM4NZcc5+yNaB/n3y+XHlfKd+O6S2ZV
ruaFrVvBSYfRmXgGm5JIpJlxAWFH3hpvpHutt6MxacR0wox0Ik+mM+7t/3Yp3+l3
0fuh3UWHDEi7+yEpJlYYEwNna7rPRrzYZtOXILsKjEmJ0g98PgfhknnGLxJ5/rSR
4BURS+R61qjTGOtCk3VVb6u+FuRB8pVWvLh07NS6JPnm5aNjKTiMfYwLnxpF7cey
Kqh11+3b3gklWXgEnsBXVkZAT2kYnS/4KFC5LfFc7Mkt5K5SvQR15Y3zGu2CII2G
10Zr5XfYIS5dArs4ZbSvFiWvRKlpa3dpHJMZEQxTA1DC0l5DFLC76MC1B5MA+miA
7/J8rREmV5nyo3tAi1T05cDr5zpe2o66HB0N+qXck5TaiS0mjkMmPGVtl/BaTwDF
pqiMZWIQ8TG/2QIm9I9AZ7w+O06rQ9TkNgheE5rBxn0TM3yrLDQ9oH990kwCEFjH
Z1HQA9A7YqDjMfUQD/WNDL66B3/wUF7pCiNVgnfbHrc/vhT0w/Y=
=7Xlp
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--
