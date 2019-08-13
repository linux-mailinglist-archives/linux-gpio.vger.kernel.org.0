Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F048B765
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 13:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfHMLnC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 07:43:02 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55317 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfHMLnB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Aug 2019 07:43:01 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 1378880743; Tue, 13 Aug 2019 13:42:45 +0200 (CEST)
Date:   Tue, 13 Aug 2019 13:42:58 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Stefan Roese <sr@denx.de>, linux-serial@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190813114258.GA11559@amd>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
 <20190808134859.GY30120@smile.fi.intel.com>
 <c4d14b64-6c2f-7e87-ea45-aa780dca85b8@denx.de>
 <20190812105307.GA30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20190812105307.GA30120@smile.fi.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-08-12 13:53:07, Andy Shevchenko wrote:
> On Thu, Aug 08, 2019 at 03:59:36PM +0200, Stefan Roese wrote:
> > On 08.08.19 15:48, Andy Shevchenko wrote:
> > > On Thu, Aug 08, 2019 at 03:25:43PM +0200, Stefan Roese wrote:
> > > > This patch fixes a backward compatibility issue, when boards use the
> > > > old style GPIO suffix "-gpio" instead of the new "-gpios". This
> > > > potential problem has been introduced by commit d99482673f95 ("seri=
al:
> > > > mctrl_gpio: Check if GPIO property exisits before requesting it").
> > > >=20
> > > > This patch now fixes this issue by iterating over all supported GPIO
> > > > suffixes by using the newly introduced for_each_gpio_suffix() helpe=
r.
> > > >=20
> > > > Also, the string buffer is now allocated on the stack to avoid the
> > > > problem of allocation in a loop and its potential failure.
> > >=20
> > > >   	for (i =3D 0; i < UART_GPIO_MAX; i++) {
> > > >   		enum gpiod_flags flags;
> > > > -		char *gpio_str;
> > > > +		const char *suffix;
> > > > +		char gpio_str[32];	/* 32 is max size of property name */
> > >=20
> > > Hmm... don't we have some define for the maximum length of property?
> >=20
> > I've come up with this assumption from this code (identical comment):
> >=20
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib-of.=
c#L293
> >=20
> > (and other places in drivers/gpio/*)
>=20
> I tried hard to find an evidence of this in Linux kernel, I assume that c=
omes
> from DT compiler or something, but fail. Linux kernel OF properties handl=
ing is
> written in the assumption of arbitrary length of the property name.
>=20
> It might be that my hard was not hard at all and I missed something.
>=20
> > > Or maybe we can still continue using kasprintf() approach?
> >=20
> > Frankly, I was feeling a bit uncomfortable with this memory allocation
> > in a loop. And Pavel also commented on this:
> >=20
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2066286.ht=
ml
>=20
> If memory allocator fails, it's a big issue, and what will happen next pr=
obably
> much less important.

Not... really. With "too big" allocations, it will fail.

Anyway, my point is that allocating in a loop for this is slow and
ugly. If we don't have a maximum property length, we should probably
invent some. I mean, we can agree that 64KB property name is not okay,
right?


								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1SokIACgkQMOfwapXb+vI03QCfVL56ayV+DiFy0yy9qhjJkLPe
hLMAoKc9LU5izQbyJvwSCZljjRHmTBOy
=UlO0
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
