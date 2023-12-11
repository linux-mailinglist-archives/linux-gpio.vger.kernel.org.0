Return-Path: <linux-gpio+bounces-1222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660CA80C762
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 11:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2037B2816C5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 10:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D26E2D618;
	Mon, 11 Dec 2023 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAINEJfs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A59CF
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 02:55:12 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-551437d5344so594759a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702292111; x=1702896911; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8NqRFt+DQYkjsf6KQlxQcKuVu85/KLHJGJTAkWsa9k=;
        b=EAINEJfsqfxM/tIkK3B3q+prABwDgKSKRnYn+GphCBGuMsSroN9Suxq/vtnZlI7HmH
         Yiu+IH8SN1/8+Xodmq9Gi1f4LZL8uUuAj0KoPHr8/vrtWe7AMsq4K4GZ190f2XW+5HtV
         k4FDU/KlI2pzhU/KkT3XeKu1EovuibwV+ExCYbG2ZOrTkIKP5fwTZjfqhHu6OoBc0V0v
         2SWOyMofU4wcrWtK+KibFmpc5jH3ywMe2VIobT8F4SYiuRpGCMRH1Fwd5JZwdgVtgNU1
         fCatGaYOF3uYlY4MbdcP9AHEIbdHQvdpbEOf7bxq/NQ922EMJsqH6JV9W+PnGWyUl9uV
         xvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292111; x=1702896911;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8NqRFt+DQYkjsf6KQlxQcKuVu85/KLHJGJTAkWsa9k=;
        b=cgZnw8EGlEimnmcmkj7Xv2yzylG37EpgH46WQDe/GxTHRmNyE3xAUTPK2j6eR33e82
         Q6+Ds76SYuaYRDU8M2wYgLNMrsl8czd0fkHA+mI/w85deoaPuow0ybBVsLz5Eqql1oos
         ViH/o+SHibQF9FxwX8ro+A+UO0JAzhZabZRhdXY89xhKza35zF2DpX0ty9ICD04Rkg+l
         VbOcUl14C3+ubphGcAsc5KOk/4mB46tgATsYRXhlRhnBMm5Pi9G+9zi0QM/SZJWPwUOa
         3gUsDzdGbW5CQD8/dAgN6QimR4iYzfJXbNgfcftbggllyBm4WoYjsPXtv7Rb5sMSztCe
         /vZg==
X-Gm-Message-State: AOJu0YyvzkGH10dWMSWnZkIq8XN0GlahupI8vUwTgtZ/JSzmlr9MbS6o
	bsvxiJ1AAtHkxkbk/fKgpeA=
X-Google-Smtp-Source: AGHT+IHkEM1FEbOW8uzmGAkL6bdlRD4+xVTGNiHf6Zspg2VQE5wC2I4zf30w+ZpHa5uC6r2hoXdg9A==
X-Received: by 2002:a17:906:7495:b0:a1f:8034:8c4d with SMTP id e21-20020a170906749500b00a1f80348c4dmr1471605ejl.40.1702292110954;
        Mon, 11 Dec 2023 02:55:10 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id tb16-20020a1709078b9000b00a1d06fb6800sm4583046ejc.36.2023.12.11.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:55:10 -0800 (PST)
Date: Mon, 11 Dec 2023 11:55:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXbqjY14ick-3YpW@orome.fritz.box>
References: <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
 <ZXMgmhTioEQ78Xeq@orome.fritz.box>
 <CAMRc=MeB9noBavBRiuKZf_6iWZJY0+ZG=n+ddGOs+TVavvuEfQ@mail.gmail.com>
 <ZXNHG0yp9QVflLBG@orome.fritz.box>
 <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dI9vJvOzIKffSKyo"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfg0tYwmiNfTkX+aBJyZSk0TG-EXmnd=3R22wmT7q53Tw@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--dI9vJvOzIKffSKyo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 07:30:36PM +0100, Bartosz Golaszewski wrote:
> On Fri, Dec 8, 2023 at 5:41=E2=80=AFPM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Fri, Dec 08, 2023 at 03:47:00PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Dec 8, 2023 at 2:56=E2=80=AFPM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > On Fri, Dec 08, 2023 at 02:12:45PM +0100, Linus Walleij wrote:
> > > > > On Thu, Dec 7, 2023 at 7:38=E2=80=AFPM Bartosz Golaszewski <brgl@=
bgdev.pl> wrote:
> > > > >
> > > > > > The reason for that is that I'm stuck on some corner-cases rela=
ted to
> > > > > > the GPIO <-> pinctrl interaction. Specifically the fact that we=
 have
> > > > > > GPIOLIB API functions that may be called from atomic context wh=
ich may
> > > > > > end up calling into pinctrl where a mutex will be acquired.
> > > > >
> > > > > OK I see the problem.
> > > > >
> > > > > > An example of that is any of the GPIO chips that don't set the
> > > > > > can_sleep field in struct gpio_chip but still use
> > > > > > gpiochip_generic_config() (e.g. tegra186). We can then encounte=
r the
> > > > > > following situation:
> > > > > >
> > > > > > irq_handler() // in atomic context
> > > > > >   gpiod_direction_output() // line is open-drain
> > > > > >     gpio_set_config()
> > > > > >       gpiochip_generic_config()
> > > > > >         pinctrl_gpio_set_config()
> > > > > >           mutex_lock()
> > > > > >
> > > > > > Currently we don't take any locks nor synchronize in any other =
way
> > > > > > (which is wrong as concurrent gpiod_direction_output() and
> > > > > > gpiod_direction_input() will get in each other's way).
> > > > >
> > > > > The only thing that really make sense to protect from here is
> > > > > concurrent access to the same register (such as if a single
> > > > > register contains multiple bits to set a number of GPIOs at
> > > > > output or input).
> > > > >
> > > > > The real usecases for gpiod_direction_* I know of are limited to:
> > > > >
> > > > > 1. Once when the GPIO is obtained.
> > > > >
> > > > > 2. In strict sequence switching back and forth as in
> > > > >     drivers/i2c/busses/i2c-cbus-gpio.c
> > > > >     cbus_transfer()
> > > >
> > > > Isn't this a very special case already? cbus_transfer() holds the s=
pin
> > > > lock across the entire function, so it will only work for a very sm=
all
> > > > set of GPIO providers anyway, right? Anything that's sleepable just=
 is
> > > > not going to work. I suspect that direction configuration is then a=
lso
> > > > not going to sleep, so this should be fine.
> > > >
> > >
> > > Maybe we could switch to using gpiod_direction_*_raw() here and then
> > > mark regular gpiod_direction_input/output() as might_sleep() and be
> > > done with it? Treat this one as a special-case and then not accept
> > > anyone new calling these from atomic context?
> >
> > Yeah, I2C CBUS already uses gpiod_set_value() in the same context as
> > gpiod_direction_output()/gpiod_direction_input(), so it would've already
> > warned about a mismatch anyway. Doing a test-run with the regular
> > direction accessors marked as might_sleep() should flush out any other
> > abusers.
> >
> > Thierry
>=20
> We cannot possibly test all drivers out there but we can start out by
> adding: `WARN_ON(in_atomic())` to the direction setters and getters
> for the next release and then possibly switch to a full might_sleep()
> if nobody complains?

What's the harm in using might_sleep() right away? If there's a lot of
problems we need to back out the change anyway, so whether we back out
the WARN_ON() or the might_sleep() doesn't really make a difference.

Thierry

--dI9vJvOzIKffSKyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV26o0ACgkQ3SOs138+
s6HqoQ//Rijbe0vPauVBGMjrdvr7BMsG/UY7bLLC6tmwThzMpOd1VulzyWsuc0S+
EvEojI1G8RoJYmsc7WVM57j33oa/uUMtIPSt/VCM5kMJ6C9uVyj0kFylUuRtESE1
2pTKhWLqY1AefcbAq5QbkQ1yOJ3vuK7JRLXuvt3ra4NZRL4Jg5vt/Wst0HnjRBRw
g6Kq0XnOuTFSNHFUdmFgECx502/F8turPClwbDWns7QJhltBfBZAaVCphfIhSkf8
PENl8OuewE3ACtyM7Ofs3le72a0F4WS+PD8etEQWz3g9SWfFuDTPA8XBt1vC9alk
MVY3mpiEA8sGhLwLqgQZpYDHDEN1KzlfJaBkuPLrW4NpHpCs51DltQUX4AHznUrR
MjGDnFXZTEevoR7/nAkzXGJEGbPtPFZPk4pmyQvlidR4nPYWvaJUFk/3VTIkp3k6
ikjhxyOEPtVGr/Q7kVkVJvXeX59053E4cz70jVuWrddTlMS35+p6RoTOAb+LfM97
iGzRuoVjgFKnca2ymKkgV0nlhjVUDRVn8cU1RtPobiYXm+UKZY6s4v7ycnqfrzwK
puBoybLjS14wrXLJWCSi0NiLh8lhyuGOUI+pwCp0XPeltGmEJWSCUzYWsnhbQxi1
W/x33hH4Chvmk0hKJY/A1KYYXjbZu8tUyaCXmxrph1ntotXM1H0=
=0QEt
-----END PGP SIGNATURE-----

--dI9vJvOzIKffSKyo--

