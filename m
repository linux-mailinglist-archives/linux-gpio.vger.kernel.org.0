Return-Path: <linux-gpio+bounces-1122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB0680A4D5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB0241C20D36
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044C11DA43;
	Fri,  8 Dec 2023 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8XZmqQH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6211732
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 05:53:46 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54bfa9b3ffaso3029904a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702043624; x=1702648424; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5tU4k/G7ZErkONVwah7cod53Wjfp0Nn+JHYTrxPoIs=;
        b=T8XZmqQHVwS9NqLmXA3dN9J5V5PK1+oW/CiBCSc86ujmQig6IcS079oHp2kyCOs5U9
         gFUuBkGRfulYrCatF/oWgxUxMd/ZLUiZ0kG5tWICvLizbAhVJyWy4TlF+SP9IOrnddqC
         S5p5S/CB6aa8voEii/vZRa3B/hauNjCBjXoB0HBkxhesU3spnQHndxxHHUoSVxd4LHOu
         6Re+QOxLAiSCapUUiUVUznTLRD4PxRSKPAqty8n1IIhUitfu2gzl1q76tBv6Og66eW+I
         s7IPtvI7hyc5ol8KK/K/ByJIXLTfEriW1yslVzvq1ZNj6Hia9xKK+5KLXPo17e98oEju
         3MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702043624; x=1702648424;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5tU4k/G7ZErkONVwah7cod53Wjfp0Nn+JHYTrxPoIs=;
        b=X1osxgj9h4Slk490X/72YE7ki9yosfx7njdAER+SJgmiacSai703vxhJgUjzU6KXjX
         WpJiHT27+jn1C+jOonf9HUtwYkumFOai+rTPp3fyRKFd6pR96bohfd6mHBFtGphFfQB4
         S+DSAYyEcAMu3cYK8mHD39SiZ2FCKfAyZ0Gd4no2tYmjULfpHmcUbMyiRsZtnVwDHQZb
         GXV7vVwbzTiFXKdblANpsYOqlpWRY04TUOltcxHpzt3VD7SPu2oWO1pb6XXA7h9qI3as
         4rY5knUd2ampbOKIxKBzE59w+o+Ab7RbMZUSX2feyCx7htpmxmrbOpb8vhCAis38UuVx
         MdpQ==
X-Gm-Message-State: AOJu0Yzoyvg6wklavaZWVfU+mjG8g6tZKKTPXnLi9xOJoo/vn4FKMKio
	+dbP0PD7f5RYG6mEl2kDppY=
X-Google-Smtp-Source: AGHT+IGDdDuP32NX0E8andG/1k3Fo6G3Xqc67Um+f4+x52dxLo3hYOVX7k+fTyLuHyAC2FtB71uOxQ==
X-Received: by 2002:a50:bb29:0:b0:54c:4837:9a9d with SMTP id y38-20020a50bb29000000b0054c48379a9dmr95626ede.68.1702043623972;
        Fri, 08 Dec 2023 05:53:43 -0800 (PST)
Received: from orome.fritz.box (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h28-20020a50cddc000000b0054c72a6a07csm847395edj.84.2023.12.08.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 05:53:43 -0800 (PST)
Date: Fri, 8 Dec 2023 14:53:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
Message-ID: <ZXMf5jT6F4EwHDx3@orome.fritz.box>
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel>
 <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel>
 <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SdYz8TwSaB8Z8KC0"
Content-Disposition: inline
In-Reply-To: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)


--SdYz8TwSaB8Z8KC0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 07:37:54PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
>=20
> [snip]
>=20
> >
> > Because years of technical debt, that's why. :)
> >
>=20
> Speaking of technical debt: you may have noticed that despite stating
> I'm almost done last week, I still haven't submitted my locking
> rework.
>=20
> The reason for that is that I'm stuck on some corner-cases related to
> the GPIO <-> pinctrl interaction. Specifically the fact that we have
> GPIOLIB API functions that may be called from atomic context which may
> end up calling into pinctrl where a mutex will be acquired.
>=20
> An example of that is any of the GPIO chips that don't set the
> can_sleep field in struct gpio_chip but still use
> gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> following situation:
>=20
> irq_handler() // in atomic context
>   gpiod_direction_output() // line is open-drain
>     gpio_set_config()
>       gpiochip_generic_config()
>         pinctrl_gpio_set_config()
>           mutex_lock()

I don't know of any case (at least on Tegra) where we would change
direction in atomic context. In fact, I would argue that configuration
like this should never happen in atomic context.

Thierry

--SdYz8TwSaB8Z8KC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVzH+UACgkQ3SOs138+
s6GaxQ/+Ln0O5jV5DX4PfRL7cXJOy2Wo7csC8M9ER4fB72Lw5/MH/nyfElBKblmZ
1cIjkSpMEa4HToe2/Cdel+VutowqEk+tL6IgxSnNxtD1nMPNx9jlCLMS9L/9NJmi
+WQEkZ0bLOAgWRZLdMSFLpjTdjhGRJTGdNFhSTZ6H+CP39DpHWrICUg/eFTGR7Gs
q4rk8Gsb0L6kSc6yLFzzhqvTuAjfegWvrCNLNhaw7da+eJ3+e3MxErCsIaxykYLz
HuFmCbKxDyK508CEsu0Na1DtLaIYTaIR8hGCBNEixbkK022TPBIC4SCv0ezmMTHR
Oqa+jBDv9eUqorhCTrd4mw3NszqYBNCbusXzZZJaShxFYQDXDQGxuhu5Ya/ueAct
B03OVe/AXSdcqnJY3A15e8oa97pDm90um2lmEE7/KsNcz0gJggICp0ETOsc3Oog1
4hjFsKoh5WIdMH/gCHWnWEIBrhMRgWSHgY+twN0WgcfPOySPKpyYbFleJU4oIe29
Jr1ntY+v+pE/GfauH3nqd+J2f4w6RY9aLLXRqz8/c9oQaNufiG7H5RyQF4u+Iwcp
SEaRjCfnZRWE81o47LIvP4+gaXJOsBBqKFQhf01KJuIbQHryWVtgmGjdyz0Jy1Be
T+FmGNIk/3bfFeqkGEDgITfn1AzAIkvgJjGu+F6AhUoA0sxfDfE=
=ICf3
-----END PGP SIGNATURE-----

--SdYz8TwSaB8Z8KC0--

