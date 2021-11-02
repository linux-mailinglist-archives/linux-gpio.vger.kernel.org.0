Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15A4442F08
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 14:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhKBNY0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 09:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhKBNY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 09:24:26 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A1DC061714;
        Tue,  2 Nov 2021 06:21:51 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so2071335wmz.2;
        Tue, 02 Nov 2021 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vnyxukz472xPvVYh68ZaE0H9Apcd9cWOc5YchYaiUR0=;
        b=g24U6lQnAL/NXrSO+wnGtkLj9FJmYfaz7I+qLHIbh8fhPVRzki3sIGovnW5QmhziUu
         g4xaXIUB1ETgkKCjE8JQ5Rlbb+Hm4kLDVzMJgpTht41MRXjgkFkOusRH770WV7ykB2d7
         IJw712bwHZTmvXsglRfJzOmuh8z0aiAD96h4TqODIwoJ5/N0XFfQHF4QFXfKY3VBzkKZ
         0vY88vEaIC+KtTRwP9Co6BTIuLWdxxC+R56UJvyotXe/w4vnpn1bwVRbUGm0W4IEwfsZ
         XYAXf6S1KiO6HYTnS9TTHkSsZVBjVssY5s9X+38Zx91wuysgniJS5QXT3keQjyQUrHo9
         qHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vnyxukz472xPvVYh68ZaE0H9Apcd9cWOc5YchYaiUR0=;
        b=be19A3mqTfNJz1Xh5ptSphZ5DwoJZt7csLSU/FZKgZ4UsY3i3XSlEnuMlkqQVmbdUl
         R8GVqQaVVGU+JUSIbBOM7JNQeFRvOH4ZGCohEQikPKAH4D+b/murQas1X9McmLF8NW6e
         AuAsErEselCtOsrdzQIdGSpyVjqccUgcFZy9qocnmyGBeYjgD4wJTet5+zTTgCQv9XPf
         ag6uam933o0o9KmzWDPABLQVrC6kA5KN1nbvRgOQEeYlcMc3VGLTGDLS5KMrhSOiOUfY
         en5g3y/gFDVls/WIRKWeVlpHdMIVlYI8AVDIYfveJ/PRol6KT73PwNmnX03kb4JRxQBt
         DnwQ==
X-Gm-Message-State: AOAM532Y+60egd+OEIK279cbqYCx5nlwbDRWrL6G/GGvhb25aLRnIKJF
        HLfHVrIMPF+Ns9i72Gm0Lla9U8rKqBi5lQ==
X-Google-Smtp-Source: ABdhPJxbeEJNBn8Q9KyjG71Smim1fbb9OKxe4RGUERMxcHgAEmcBg0E1MKmod+/Rloc7LPPLcXbvpw==
X-Received: by 2002:a05:600c:17c3:: with SMTP id y3mr6916963wmo.136.1635859309626;
        Tue, 02 Nov 2021 06:21:49 -0700 (PDT)
Received: from orome.fritz.box ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o11sm7795606wrw.13.2021.11.02.06.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 06:21:48 -0700 (PDT)
Date:   Tue, 2 Nov 2021 14:21:45 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra234 gpio
Message-ID: <YYE7aXo0mfCfCqGF@orome.fritz.box>
References: <20211021123021.9602-1-pshete@nvidia.com>
 <20211021123021.9602-2-pshete@nvidia.com>
 <YXq3/1AXX7KiwpTy@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Uf8nR5L+sGbA8gQE"
Content-Disposition: inline
In-Reply-To: <YXq3/1AXX7KiwpTy@orome.fritz.box>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Uf8nR5L+sGbA8gQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 04:47:27PM +0200, Thierry Reding wrote:
> On Thu, Oct 21, 2021 at 06:00:21PM +0530, Prathamesh Shete wrote:
> > Add support for the Tegra234 GPIO bank configuration.
> >=20
> > Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> > ---
> >  drivers/gpio/gpio-tegra186.c | 74 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >=20
> > diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> > index d38980b9923a..edcc91b35e1e 100644
> > --- a/drivers/gpio/gpio-tegra186.c
> > +++ b/drivers/gpio/gpio-tegra186.c
> > @@ -14,6 +14,7 @@
> > =20
> >  #include <dt-bindings/gpio/tegra186-gpio.h>
> >  #include <dt-bindings/gpio/tegra194-gpio.h>
> > +#include <dt-bindings/gpio/tegra234-gpio.h>
> > =20
> >  /* security registers */
> >  #define TEGRA186_GPIO_CTL_SCR 0x0c
> > @@ -877,6 +878,73 @@ static const struct tegra_gpio_soc tegra194_aon_so=
c =3D {
> >  	.instance =3D 1,
> >  };
> > =20
> > +#define TEGRA234_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> > +	[TEGRA234_MAIN_GPIO_PORT_##_name] =3D {			\
> > +		.name =3D #_name,					\
> > +		.bank =3D _bank,					\
> > +		.port =3D _port,					\
> > +		.pins =3D _pins,					\
> > +	}
> > +
> > +static const struct tegra_gpio_port tegra234_main_ports[] =3D {
> > +	TEGRA234_MAIN_GPIO_PORT(A, 0, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(B, 0, 3, 1),
> > +	TEGRA234_MAIN_GPIO_PORT(C, 5, 1, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(D, 5, 2, 4),
> > +	TEGRA234_MAIN_GPIO_PORT(E, 5, 3, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(F, 5, 4, 6),
> > +	TEGRA234_MAIN_GPIO_PORT(G, 4, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(H, 4, 1, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(I, 4, 2, 7),
> > +	TEGRA234_MAIN_GPIO_PORT(J, 5, 0, 6),
> > +	TEGRA234_MAIN_GPIO_PORT(K, 3, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(L, 3, 1, 4),
> > +	TEGRA234_MAIN_GPIO_PORT(M, 2, 0, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(N, 2, 1, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(P, 2, 2, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(Q, 2, 3, 8),
> > +	TEGRA234_MAIN_GPIO_PORT(R, 2, 4, 6),
>=20
> I stumbled across an old patch I had created a couple of months ago that
> is very similar to this one. However, at the time I had added a couple
> more ports here, namely S, T, U and V. Is there a reason why you're not
> including those here?

Nevermind, looks like my patch had been based on out-of-date
documentation, so the table here is correct.

That said, I noticed that you didn't include an update to the device
tree bindings documentation. I do have that, in addition to a conversion
to the new json-schema format. Do you mind if I resend your two patches
here along with the DT documentatino update that I have? I've also got
the DTS changes for Tegra234 to expose these, which I would also like to
include for completeness.

Thierry

--Uf8nR5L+sGbA8gQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGBO2kACgkQ3SOs138+
s6ERMhAAqKD5qym7G+BML2GexG7qta8zEEk72ntv3yNThnGOTs4hPTz15b/Ww03M
uMWf4RZ+bqT622Ks94949itAmrYol3vHcqiuqc0DailUjN4P1veAKwR0b2iEQIg+
ViLhuyzG+Vp46Mv1M75NE2cfwafRFCr+3C0K2Uwyyy3RTa41qfBq9IuiHFQsGO+O
y/msa2UC2XKUNyIO8w5LELKMNTI7srqO9kJGReNT8jR8jRqtj/2qGLE2gb0hN48L
qpd+QMgrgZ365xgiKZT1e4wa/MU35ORc0uGPNcN4os94VpHhUtXVVZssJpedccb1
nPMWe0L5/EdxTKM4gqdAm/uV0jbzIwVqTe9Ys05MClDicBnIxSomsNM+RfRs5xsj
4q/laWwE4Dzus0dB15kyNRlFdYhaFT3WDe8l3wMN0WNtJIbUcRHEx8zxUStz5HIt
nEUQ4SpIL9UFh+7p9B55CLcUYfXmD4typXgkt9R7lFP9fuALbOLnRs7xKY4TBT4p
uavclFFl4rI8oAnmU5QVfIPoX5/pjFh+lEfzl3nNMVYbqIvjPFLEmiypo3QwsFRg
o9uM56q3U3KFxT3ELFOBkOOFPVBRDjgSOp6LNnb2oj2MrXhOhh0Tu9N/JoHNYrpV
vmL8Q+Qj3n5uX05eW5Va3ot+fydYf17jez4RGqtX3YrSv9w+Cco=
=vpbn
-----END PGP SIGNATURE-----

--Uf8nR5L+sGbA8gQE--
