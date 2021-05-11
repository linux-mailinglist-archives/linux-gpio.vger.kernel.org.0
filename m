Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED735379E05
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 06:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhEKEBG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 00:01:06 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:40498 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhEKEBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 00:01:05 -0400
Received: by mail-lj1-f176.google.com with SMTP id c15so8896184ljr.7
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 20:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent;
        bh=Ja7xWhvSyHKA48RSUH+zOKe9asOSjd6WC/iawBZNnXg=;
        b=D0eumVcFvOFJp6OqwqGufAYXmButgG9+s7CIvRn/HZ/1DE775SNjGcvCAmssfLaDIU
         rNijj+Z2ifroJdigwUYmkr/zjiZHqeCPF9tkzdLGst2iYfs/OubmMfjdBXvWQSgMZWXc
         KHfKfSy4kWSWX003u5NdxbT66Q/ZKLz0SpGUeb0TC9fqe0iWVNtsY3aSJ8NVeSc2J5hM
         jlD2nYgNBdjWRcDuudur7wuWGpxR2ohGM65KlzJc3C546gAruWCj2jmmCYKEIWEE1cLk
         UjhfvjZ71D4ASKOB1vltmOU9Tcfr19aHN9t3JwbWU/s22MTg13L4drwfN4dplRl4NuJ/
         ZofA==
X-Gm-Message-State: AOAM530WU+7i5IxPYXde7UGdkY3Wn+d7/f3wpcA7ZJmMwQ5RiUtJig+g
        vA9PmZ0qHnlno38Vhxa1zQs=
X-Google-Smtp-Source: ABdhPJxXvEkowZ3kAXJq/l/SnT8tDPCw393LJAsBaTkp0cvT4Eny6yB6/OKhqCwT2h/2+Ju9VjI9vw==
X-Received: by 2002:a2e:818b:: with SMTP id e11mr22341567ljg.468.1620705599058;
        Mon, 10 May 2021 20:59:59 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id e28sm2434675lfn.188.2021.05.10.20.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 20:59:58 -0700 (PDT)
Message-ID: <3a8c418bc40a736f44ab19a549a58d6bdecc59be.camel@fi.rohmeurope.com>
Subject: Re: regmap-gpio: Support set_config and other not quite so
 standard ICs?
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Michael Walle <michael@walle.cc>
In-Reply-To: <CAHp75VcUva-1cv6xaU0-RADVS=GR1VMk50cqR5NPU1LCFX2N5A@mail.gmail.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdZnrkiYGaOTZLvCnp72WYiV0+YhCe+TbMjN_3CLyJHvgA@mail.gmail.com>
         <c5a4ef7341b5b0b56d1ad950867828463cfdb7fc.camel@fi.rohmeurope.com>
         <c4faac648d3e0c7f3dcb50f7e24c8b322e8c6974.camel@fi.rohmeurope.com>
         <CAHp75VcUva-1cv6xaU0-RADVS=GR1VMk50cqR5NPU1LCFX2N5A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-aAJr0Gad4Qiy1ZL/MPgp"
MIME-Version: 1.0
Date:   Tue, 11 May 2021 06:59:53 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-aAJr0Gad4Qiy1ZL/MPgp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Morning Andy,

On Mon, 2021-05-10 at 19:54 +0300, Andy Shevchenko wrote:
> On Mon, May 10, 2021 at 4:41 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > Hi Linus, All,
> >=20
> > On Thu, 2021-03-25 at 12:32 +0200, Matti Vaittinen wrote:
> > > On Thu, 2021-03-25 at 10:35 +0100, Linus Walleij wrote:
> >=20
> > snip
> >=20
> > > > It could potentially (like the other Rohm GPIO MFD PMIC
> > > > drivers)
> > > > make some use of the gpio regmap library, but we have some
> > > > pending changes for that so look into it after the next merge
> > > > window.
> > > >=20
> > > > I.e. for your TODO: look at the GPIO_REGMAP helper.
> > >=20
> > > I just took a quick peek at gpio_regmap and it looks pretty good
> > > to
> > > me!
> > >=20
> > > Any particular reason why gpio_regmap is not just part of
> > > gpio_chip?
> > > I
> > > guess providing the 'gpio_regmap_direction_*()',
> > > 'gpio_regmap_get()',
> > > 'gpio_regmap_set()' as exported helpers and leaving calling the
> > > (devm_)gpiochip_add_data() to IC driver would have allowed more
> > > flexibility. Drivers could then use the gpio_regamap features
> > > which
> > > fit
> > > the IC (by providing pointers to helper functions in gpio_chip) -
> > > and
> > > handle potential oddball-features by using pointers to some
> > > customized
> > > functions in gpio_chip.
> >=20
> > So, v5.13-rc1 is out. I started wondering the gpio_regamap - and
> > same
> > question persists. Why hiding the gpio_chip from gpio_regmap users?
>=20
> In general to me this sounds like opening a window for
> non-controllable changes vs. controllable. Besides that, struct
> gpio_chip has more than a few callbacks. On top of that, opening this
> wide window means you won't be able to stop or refactoring become a
> burden. I would be on the stricter side here.

I kind of fail to see your point Andy. Or yes, I know exposing the
gpio_chip to user allows much more flexibility. But what are the
options? What would a driver developer do when his HW does almost fir
the standard regmap_gpio - but not just quite? Say that for example the
changing of gpio direction requires some odd additional register access
- but other than that the regmap_gpio operations like setting/getting
the value, IRQ options etc. fitted the regmap_gpio logic.

If he can not override this one function - then he will need to write
wholly new GPIO driver without re-using any of the regmap-gpio stuff.
You know, if one can't use regmap-gpio, he's likely to use the already
exposed gpio_chip anyways. I'd say this is much more of a pain to
maintain. Or maybe you add another work-around option in the
gpio_regmap_config to indicate this (and every other) oddball HW -
which eventually leads to a mess.

But this is all just my thinking - I'm kind of a "bystander" here and
that's why I asked for opinions. Thanks for sharing yours, Andy. I do
appreciate all the help and discussion.

> > 3) The last option would be adding pointer to regmap_gpio to
> > gpio_chip
> > - and exporting the regmap_gpio functions as helpers - leaving the
> > gpio
> > registration to be done by the IC driver. That would allow IC
> > driver to
> > use the regmap_gpio helpers which suit the IC and write own
> > functions
> > for rest of the stuff.

I was trying to describe here the approach that has been taken in use
at the regulator subsystem - which has used the regmap helpers for
quite a while. I think that approach is scaling quite Ok even for
strange HW.


Best Regards
	Matti Vaittinen


--=-aAJr0Gad4Qiy1ZL/MPgp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCaAKMACgkQeFA3/03a
ocXKRAgAw7NCfegQ1PRtJoxqrFnvSL3tbGDvD+gi/8TZAKMWG4RGlrK4Zs64CHoX
gD/E46oBMukIUBW2kxnimtIMkabCh+hiVpqeSakm2uoDAeGtp+LD6Y6VzXKWCW/c
Sgvh5QRtsLFA8ZgN4akbpUWLNCNf+bX2Vri3TArdi4BR2bkwetmnQYCUuD/FjCWA
3Ul6DxwMied/wAyOy4BiBa4FoATzeV8/Vnwl8tyUONpvf7Pa5MAXn+d30RwYh98S
W6FABcm+19GruzQH9zhmsBdkAouLONTRI5VakaEe9PNrakGoPkPupkZsDeeexeMA
Finb5uzppYlUzcsbk/QFHJPjAorZIQ==
=bJhc
-----END PGP SIGNATURE-----

--=-aAJr0Gad4Qiy1ZL/MPgp--

