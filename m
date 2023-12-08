Return-Path: <linux-gpio+bounces-1129-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A28ED80A973
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 17:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE702813E2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 16:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F082D315B3;
	Fri,  8 Dec 2023 16:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB3CEWRY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677DC122
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 08:41:03 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a1f37fd4b53so241552666b.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 08:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702053662; x=1702658462; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E8iXs5aTA/YBrKJU1VpM6zgjZSruIe73xcl9AeXxhI=;
        b=cB3CEWRYSYMEwCRVJEs/e4reF6hEGdqkLA1E80SRxX+wgmg+w+bRqIkcZxriNCJhlk
         QLkNzRFblM7oZcVTd+o24tLSxGMdIPIM2wNaMenSBnNrjjvoRG80Wwpz6+qzMgfAt2BM
         u+xZ/aXmm44MLZRb5dele0in3kkqaogC7InhjQj0/3X85Vxj701CtmqrFaz+dtOpVeEl
         KO9Vtse2QX7lYhajMNbIBG55zSV5F9UhvN/gcaZSPy4lOcZJzcd919JHSlFLi3FRVKl3
         5LCaBni45N5I7c0mJR4cvme0b5FQBlnTGj5zLh2iOBlm1pIZpvVAiUIwNLYvzfMTfHDx
         KTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053662; x=1702658462;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1E8iXs5aTA/YBrKJU1VpM6zgjZSruIe73xcl9AeXxhI=;
        b=pNnH+zV5zlGZZ1YmE+pAIinN+I+cXcBdqYt6YyEkYXNt4UqgLYiGUac3JB9O54ZLnP
         yyxwpp19JEOjcHHoOkqrMBe0YJj76nBtsNND4kSaaDhgE//Huu/skZ70rdBzdK/zLAyi
         KlznyUzyoVS9Xqk4t5Ie2ZK/gOSjOvJpw3bdc2Ur6F/wy8CGy5PDhK9Jbx0AoTbSBvFd
         NUsG4UbDxjVSlPZM8EPlZ3pQ5GbMYRS9YG4RuIJC0TMYmIZ7971sIoYHF/NWNorfMLdW
         Gy0MaQ0L09pk9peS5jtZuW5jezvVmgrRXx2qnTB8udI3sDoiNWYFuKgYTkYvHIJEx8Ic
         RpfA==
X-Gm-Message-State: AOJu0YwuN7/XTx45ct3uzo/MidCFeT/PQmJsIMnchpAF9sBLbyy4XHXN
	TFGypeZ9JOTSLcTKx6hmDII=
X-Google-Smtp-Source: AGHT+IFXj1j8jfswuvbh52VRnKD/FkDR1fenBYn/zj+GQL6HiS3r45bWvw20eI/NkLjkeEDaMswWQg==
X-Received: by 2002:a17:907:31c3:b0:a19:a1ba:da2d with SMTP id xf3-20020a17090731c300b00a19a1bada2dmr159666ejb.84.1702053661727;
        Fri, 08 Dec 2023 08:41:01 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id lm11-20020a17090718cb00b00a1db76f99c8sm1213342ejc.93.2023.12.08.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:41:01 -0800 (PST)
Date: Fri, 8 Dec 2023 17:40:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXNHG0yp9QVflLBG@orome.fritz.box>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box>
 <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UTexObAz1uXYFujm"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--UTexObAz1uXYFujm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 03:47:00PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 8, 2023 at 2:56=E2=80=AFPM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Fri, Dec 08, 2023 at 02:12:45PM +0100, Linus Walleij wrote:
> > > On Thu, Dec 7, 2023 at 7:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > >
> > > > The reason for that is that I'm stuck on some corner-cases related =
to
> > > > the GPIO <-> pinctrl interaction. Specifically the fact that we have
> > > > GPIOLIB API functions that may be called from atomic context which =
may
> > > > end up calling into pinctrl where a mutex will be acquired.
> > >
> > > OK I see the problem.
> > >
> > > > An example of that is any of the GPIO chips that don't set the
> > > > can_sleep field in struct gpio_chip but still use
> > > > gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> > > > following situation:
> > > >
> > > > irq_handler() // in atomic context
> > > >   gpiod_direction_output() // line is open-drain
> > > >     gpio_set_config()
> > > >       gpiochip_generic_config()
> > > >         pinctrl_gpio_set_config()
> > > >           mutex_lock()
> > > >
> > > > Currently we don't take any locks nor synchronize in any other way
> > > > (which is wrong as concurrent gpiod_direction_output() and
> > > > gpiod_direction_input() will get in each other's way).
> > >
> > > The only thing that really make sense to protect from here is
> > > concurrent access to the same register (such as if a single
> > > register contains multiple bits to set a number of GPIOs at
> > > output or input).
> > >
> > > The real usecases for gpiod_direction_* I know of are limited to:
> > >
> > > 1. Once when the GPIO is obtained.
> > >
> > > 2. In strict sequence switching back and forth as in
> > >     drivers/i2c/busses/i2c-cbus-gpio.c
> > >     cbus_transfer()
> >
> > Isn't this a very special case already? cbus_transfer() holds the spin
> > lock across the entire function, so it will only work for a very small
> > set of GPIO providers anyway, right? Anything that's sleepable just is
> > not going to work. I suspect that direction configuration is then also
> > not going to sleep, so this should be fine.
> >
>=20
> Maybe we could switch to using gpiod_direction_*_raw() here and then
> mark regular gpiod_direction_input/output() as might_sleep() and be
> done with it? Treat this one as a special-case and then not accept
> anyone new calling these from atomic context?

Yeah, I2C CBUS already uses gpiod_set_value() in the same context as
gpiod_direction_output()/gpiod_direction_input(), so it would've already
warned about a mismatch anyway. Doing a test-run with the regular
direction accessors marked as might_sleep() should flush out any other
abusers.

Thierry

--UTexObAz1uXYFujm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVzRxkACgkQ3SOs138+
s6Fd8xAAvgmlcl6JFXMjTcKkMZzkQ8OXq9LtIkQSBazpc388IxRNT0bYVwIavCyw
W4ke9bL0zGwbWrwqe3cRPqdfHDFxURanks0lgCbeMP3ittIWy7xfJB3yNAYi5GHa
NhDxZtXHpknxc57DDafjc+Lcryu8D0lJ8iyt8eO/zqdzyjyJDmfRZFs1uKMSRRuu
i2OQFoMY+QQDiYeWNuX5p+1g8smLk5xEtLdHwV/fDjuo4ZluZ2gseXxFHSCDIC7y
1n3qPtre6/gGxjY3zLHxDoAzdC8dc6wNmVAZ6snWncmmnaNFpyNAkicBidGGl4Bs
Sw5pHJrE0oOF/VqZdfLTmxIysLJjjTk+kKQL/rOVAXnp1yDyM3q5wyGXDPV0sOAD
rlQrVimUnHA/cfPKEZ1JAMphEffN8BB/9V0+Ihy51VyTuopkHLHUmteLVQl8xtuc
y8R3VnQQhE4UkC0uheD3JE2SLG77J2nOeymTF5e8TI3MpK99UjNgQRY2WxWn++ZX
7RwgsjSYvMU32AF2dHLRLx79YKJlQDw5vAZdM36U4lEZKXJRaYxLS7rLyl7Utb9h
/8TBq3gq6530bb9FsdpSIXqY2sSro1sGr+dC2+4ktYiE1QSVBWIEKS0B1JP72sq1
wcFhXn525g4nRSwpCEMCjZ9SbxGhlxwnxtGd2HXvN1eUDRHI7Tg=
=86k1
-----END PGP SIGNATURE-----

--UTexObAz1uXYFujm--

