Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F43378F7E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 15:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbhEJNl4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 09:41:56 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:33336 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235728AbhEJM7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 08:59:35 -0400
Received: by mail-lf1-f54.google.com with SMTP id h4so23258057lfv.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 05:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent;
        bh=cKn1sJZaD8pAD5FPzV5qlxqaHrySH0ASfAx5sQGN1vA=;
        b=q1GyFM9P44Ex9ZYNLJmn5AbHIPqumPyYftR+OF4UJYPIvzKs5DQ1c5kfP9ox4tPdLc
         HIyWHMAal1FqqRh5HRvFWj2TCwsCR6vrcjkHFnGmYi9Wv+QxsDfIgvuDcdkq5CkuUc5i
         xrgPrB1OjIjJpqkCi3V1N7Gp9f6YqlYDVSFPeXnzmk7ORHnpxH46fEtRWS0nRcmLzH/w
         rqC6M7fCVPjICqbEVJL21CMX6CL7jkfFVy9sSP3VIQ5RFcJ44GOqVQZCG6TpvN/naor2
         cF4xXIyDC1Im0XXGZtBeykgKxcSTfIsZT+GMeuII8nUtW5UqL8n7DMbKFTx88XguHqKs
         vkBg==
X-Gm-Message-State: AOAM532Sj2h6NgtWq2JddDPGZKsuDjhmjNoJCHSfLX743sHoduniVs6z
        9m/ml6tlmsWW5p9D2DS95i4=
X-Google-Smtp-Source: ABdhPJwWKkjxYFguyqWWMe4S5LvTmamHD2c9xnNpJ2viZ8CA43xN/1u4blKeMgnBAMbaQe87Qxaztw==
X-Received: by 2002:ac2:5fcb:: with SMTP id q11mr16628799lfg.248.1620651505898;
        Mon, 10 May 2021 05:58:25 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id x1sm3137815ljd.61.2021.05.10.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:58:25 -0700 (PDT)
Message-ID: <c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com>
Subject: regmap-gpio: Support set_config and other not quite so standard
 ICs?
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>
In-Reply-To: <c5a4ef7341b5b0b56d1ad950867828463cfdb7fc.camel@fi.rohmeurope.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdZnrkiYGaOTZLvCnp72WYiV0+YhCe+TbMjN_3CLyJHvgA@mail.gmail.com>
         <c5a4ef7341b5b0b56d1ad950867828463cfdb7fc.camel@fi.rohmeurope.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-9Gt92+/OVSlgeSHCDewM"
MIME-Version: 1.0
Date:   Mon, 10 May 2021 15:58:13 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-9Gt92+/OVSlgeSHCDewM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus, All,

On Thu, 2021-03-25 at 12:32 +0200, Matti Vaittinen wrote:
> On Thu, 2021-03-25 at 10:35 +0100, Linus Walleij wrote:

snip

> > It could potentially (like the other Rohm GPIO MFD PMIC drivers)
> > make some use of the gpio regmap library, but we have some
> > pending changes for that so look into it after the next merge
> > window.
> >=20
> > I.e. for your TODO: look at the GPIO_REGMAP helper.
>=20
> I just took a quick peek at gpio_regmap and it looks pretty good to
> me!
>=20
> Any particular reason why gpio_regmap is not just part of gpio_chip?
> I
> guess providing the 'gpio_regmap_direction_*()', 'gpio_regmap_get()',
> 'gpio_regmap_set()' as exported helpers and leaving calling the
> (devm_)gpiochip_add_data() to IC driver would have allowed more
> flexibility. Drivers could then use the gpio_regamap features which
> fit
> the IC (by providing pointers to helper functions in gpio_chip) - and
> handle potential oddball-features by using pointers to some
> customized
> functions in gpio_chip.

So, v5.13-rc1 is out. I started wondering the gpio_regamap - and same
question persists. Why hiding the gpio_chip from gpio_regmap users?

Current IF makes it very hard (impossible?) for driver to override any
of the regmap_gpio functions (or provide own alternatives) for cases
which do not fit the generic regmap_gpio model.

My first obstacle is providing gpio_chip.set_config for BD71815.

1) I guess the method fitting current design would be adding drive-mode=20
register/mask(s) to the gpio_regmap_config. Certainly doable - but I
have a bad feeling of this approach. I am afraid this leads to bloating
the gpio_regmap_config with all kinds of IC specific workarounds (when
HW designers have invented new cool control registers setups) - or then
just not using the regmap_gpio for any ICs which have any quirks - even
if 90% of regmap_gpio logic would fit...

2) Other possibility is allowing IC driver to provide function pointers
for some operations (in my case for example for the set_config) - if
the default operation the regmap_gpio provides does not fit the IC.
This would require the regmap_gpio to be visible to IC drivers so that
IC drivers can access the regmap, device & register information - or
some way to convert the gpio_chip pointer to IC specific private data
pointer. Doable but still slightly bloat.

3) The last option would be adding pointer to regmap_gpio to gpio_chip
- and exporting the regmap_gpio functions as helpers - leaving the gpio
registration to be done by the IC driver. That would allow IC driver to
use the regmap_gpio helpers which suit the IC and write own functions
for rest of the stuff.

I'd like to hear opinions - should I draft some changes according to
these proposals (which one, 1,2,3 or something else?) - or as this all
been already discussed and am I just missing something?

Best Regards
	Matti Vaittinen

--=-9Gt92+/OVSlgeSHCDewM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCZLV8ACgkQeFA3/03a
ocXOIAf/VIBlVdyAe38lPehMQicv+HlB2gxgu30zw8J6n7Xfn78n742GtIC6jxJQ
qHLF8HnhrpA5QUkY5YW0OwGhaMK2lnByf5r1dNmBL70iXUNBbL1e0R2D0M/wYM16
Xz7xnnIdQHy2AoI9zGZUAzBm9beBS9SJbPN5GBOwpVBehQVfSGZuEi/kieIq7/Kr
VmebWJtEZ/zZ2tcUUCXjB2wjda9DqLFeKutuJDcpMSYyqNVzMI4CtcPp2pRzm0SC
abetCHeREBKSZE0BZ7//+Efcgz8JM/RzWV9OA/iP0akoDQ+GpB8RyyitOs5FDpeQ
OnqF3ebf75smWQqW+H2EtgyAo05Sag==
=VVry
-----END PGP SIGNATURE-----

--=-9Gt92+/OVSlgeSHCDewM--

