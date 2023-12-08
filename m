Return-Path: <linux-gpio+bounces-1123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6681D80A4DB
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2352817EA
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 13:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB5D1DA44;
	Fri,  8 Dec 2023 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC4ndtFj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82D21985
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 05:56:46 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c236624edso22388625e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702043805; x=1702648605; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=relHJYgIxCRlCTkuQnj3pfcDAYgRUshD8z+XZxnedko=;
        b=BC4ndtFj0dHGWyF3iLPnl+4qBbCDxul6mOczJf33CFVWwly/dLRv3Ss6P31sfM+VFL
         YajZ7lvgTD5p4PhnwuyqzWf15+HNSW/ZNapXaRKNQWbQcOP5XybKj0473sg/J1X9TGvA
         vPofLLXYqnPXZ2owJFB7i+HYQa+haE+cOhfsvlumRaOUOCjf7epgRiHVPIjPAb5Z3BBt
         i56NQLDzdQdxIJ7Kgt5da/isGXlCF6OjZ1tWZF+ADMahsO6MsD6g0w4tjT19142x0MuD
         A47HX6KszfEnBQfFsgo33tbo6EVqJftQq+AbolUZ2Zyh0G6enoyNlfsduh2S8eP4aJZa
         KS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702043805; x=1702648605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=relHJYgIxCRlCTkuQnj3pfcDAYgRUshD8z+XZxnedko=;
        b=vUEt2DUzHPgCYcgS27CdWfEe8lwkK/dV5T79f8SLqED11e0mQZ1F0X5l+mdGPIhvPR
         lG+tRDYItBAf6/NaT7X4HYGz07SGL7Y5Clczu1lbkvR4P2VqrTpZ0Rf7sqN/oBBsDs9O
         qMBYKA0y7WLW25idmU+RX3VQ7tc+IR0R7xx13ZmC5ae8jErxn+z2fvvNX1nOvHrB92bR
         mqyFnWHA7H57II4Mk50StQrQO2xwxsn7nRbaHXcJerRTCr98GZpWjzsEbItIumELe8xz
         xn91XrVrJXUcjgNNqYSqjuAP3Wcxw+MzgjqTOnf7+Bu0xUN/odyswRYBeyXU9g4Cnl2D
         wKtw==
X-Gm-Message-State: AOJu0YwDhGxQtaFiZUCaGKbcEe8MU/He3m0NlDJSiQFgSADgu70z4Pc7
	xAFOkSNzO5nevE/u6N6z9xc8oaHH/T4=
X-Google-Smtp-Source: AGHT+IFd6BGdyKwIGdWKFqUPYmC4BsHqSS7HW6V7MecgwssmwZyDomf0UTp4GBOU2YRkaZSnqK2u/A==
X-Received: by 2002:a05:600c:54c1:b0:40c:357e:289 with SMTP id iw1-20020a05600c54c100b0040c357e0289mr1363wmb.65.1702043804875;
        Fri, 08 Dec 2023 05:56:44 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c450d00b00405c7591b09sm2976126wmo.35.2023.12.08.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 05:56:44 -0800 (PST)
Date: Fri, 8 Dec 2023 14:56:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXMgmhTioEQ78Xeq@orome.fritz.box>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
 <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tF8TQxf27GF0tSPL"
Content-Disposition: inline
In-Reply-To: <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--tF8TQxf27GF0tSPL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 02:12:45PM +0100, Linus Walleij wrote:
> On Thu, Dec 7, 2023 at 7:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>=20
> > The reason for that is that I'm stuck on some corner-cases related to
> > the GPIO <-> pinctrl interaction. Specifically the fact that we have
> > GPIOLIB API functions that may be called from atomic context which may
> > end up calling into pinctrl where a mutex will be acquired.
>=20
> OK I see the problem.
>=20
> > An example of that is any of the GPIO chips that don't set the
> > can_sleep field in struct gpio_chip but still use
> > gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> > following situation:
> >
> > irq_handler() // in atomic context
> >   gpiod_direction_output() // line is open-drain
> >     gpio_set_config()
> >       gpiochip_generic_config()
> >         pinctrl_gpio_set_config()
> >           mutex_lock()
> >
> > Currently we don't take any locks nor synchronize in any other way
> > (which is wrong as concurrent gpiod_direction_output() and
> > gpiod_direction_input() will get in each other's way).
>=20
> The only thing that really make sense to protect from here is
> concurrent access to the same register (such as if a single
> register contains multiple bits to set a number of GPIOs at
> output or input).
>=20
> The real usecases for gpiod_direction_* I know of are limited to:
>=20
> 1. Once when the GPIO is obtained.
>=20
> 2. In strict sequence switching back and forth as in
>     drivers/i2c/busses/i2c-cbus-gpio.c
>     cbus_transfer()

Isn't this a very special case already? cbus_transfer() holds the spin
lock across the entire function, so it will only work for a very small
set of GPIO providers anyway, right? Anything that's sleepable just is
not going to work. I suspect that direction configuration is then also
not going to sleep, so this should be fine.

Thierry

--tF8TQxf27GF0tSPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVzIJoACgkQ3SOs138+
s6HEMw/+NJKjxjmEOsldGWkh6OxIk66ffpk559pz5qvuwZv4t56OcHFHWictjAO1
HIH3U6rNoL78qfKyvLYWLgifR+8IDcb38BkDI8Lbg8h5qrGbGw0ztjB6C/9CS3pO
KPNQLurrHNuYX4YuDSvnXD1S7MX0dKRzagIX3s4dYkOW/3j7JGxv46hsjy16ELrS
29A9VPa/fzAjHrjU7uRQ+nlwkhd8mjUpX7D7zmz/ElgA1+1oXPvJCJPDaaQIJOW9
E2V7MNA2Dudb2kciFeS4n/8rMFDdXIc68Lx2Rxa8uxBHoeutDss5jTe45X20iz/K
YTStx57Xdq2ruGHleA4TuWQr3gUkkgt16TYR7yC3uJvjHd/z9hdKAJqpFREP9Ao2
mT4IHHh3bugDZKZOW/Q/B33NacEEIcSKEFaCsJkNqlVrlVa0ShZ1CWu/O/9zZbIL
fCS+6K95N8qI7pchDtE7AY+EYKuN7ubECCiuYfhhVTzJlIrfb34kKZCLbnZsuhyu
LbM+MMuA+9hY9uI23APRS4G7hxHuAXTj2gDpjz+GAJyYbNXg7JQsFsBQa8Tgf2lY
9XPzyzny48NWfQuwLUJq12pp/QvX+yNU0Er3HXAWCGNEEn4JnmQypmMd7Nqm9k28
XQyy9HC6MXD7zWb8hwuFoBxRegVBPMluS2M4yr5ZGoxTmxjCOOo=
=iM+K
-----END PGP SIGNATURE-----

--tF8TQxf27GF0tSPL--

