Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF2E2B440E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 13:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKPMxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 07:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgKPMxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 07:53:54 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AEAC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 04:53:54 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id j7so18568281wrp.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 04:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V6pNd4u4x1KhWy82fmYf16mrSvcc4ufAe2TmaIq/IlI=;
        b=Wgj9YOG8kZTdYV7BYhGmSbimTK2ecDPMK9n/6gbfm29F0lPhSct9kH1GaFG+UgX3z5
         rP1h/ai0PqL3LrFgN7HMedo5AkrbrsD6V5i18i+kvMqpb3N5Cz7TQCxJ+UCJxoKUOPeP
         cBI6uJZSFFvmbyvDTeK34V30VhLiiN8tJIa6xisD2nmRg69ywHl9FqLB/ecakf+ej9z6
         G7GM7iueSHL+wekx7eeM0/f4tgl3KykeQbLqypg4egHA8RdWwH84Io7sGUjuxHQ7r3IS
         JPEbkQGQCwWibuB4flOXlk2G7uNOqZ6uQtKNfH62OYtajBRCkOkJkgOdRVwsQRAwNgSk
         gfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V6pNd4u4x1KhWy82fmYf16mrSvcc4ufAe2TmaIq/IlI=;
        b=m6MubV8AVGlHopuo9nkwdw073quAsgpQ9qd3bnoOrF5uLtrm7iAsWZLa6/Zpm+220X
         A4YKATgBojHa7PhjPk/VdMMagM4WhjMa+7bPXQkrFtpgqC3Cx85lETSkoctTZUz9oOUM
         OMWKzbO3up+24wsIv+sH+hn23OhNAjK2MzYxcB+xpCuGgpIgDL8VmInBujc9Z6HJbRXD
         QB/fouhqzxhTbgW9Fkuwh/Tv5Lq2c+0Rywx66ljVwxcPJvogyrU76i64DiD9DQEHz4QP
         d6wVH2GMLQV8umBSwQuJI4SkR3D9YX+h3YSrCH3DCcGzxU8qRjWzw8EJ2Fjzw+qClorI
         i4/g==
X-Gm-Message-State: AOAM5325AEukpx36NZ9SUfshrcLzEZUpoEQREdZCKiHj8TQ0kEDkcsS8
        sJ6cQuNQ4t50ygGAtqmHQ6ZfZDeBr+U=
X-Google-Smtp-Source: ABdhPJwVrz9z4lsDOfsLFAYP6jXovnCG+9wKUEnxXJWMDzHd2SEY0a3qFPHcknd8OSf/48KJu2YBHA==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr19250117wrs.32.1605531233293;
        Mon, 16 Nov 2020 04:53:53 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f13sm17208853wrq.78.2020.11.16.04.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 04:53:51 -0800 (PST)
Date:   Mon, 16 Nov 2020 13:53:49 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 2/2] RFT: gpio: tegra186: Set affinity callback to parent
Message-ID: <20201116125349.GC2224373@ulmo>
References: <20201111140628.24067-1-linus.walleij@linaro.org>
 <20201111140628.24067-2-linus.walleij@linaro.org>
 <20201113214448.GA2138577@ulmo>
 <08147080c7af44420e0744249df6b26d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <08147080c7af44420e0744249df6b26d@kernel.org>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 09:02:24AM +0000, Marc Zyngier wrote:
> Linus, Thierry,
>=20
> On 2020-11-13 21:44, Thierry Reding wrote:
> > On Wed, Nov 11, 2020 at 03:06:28PM +0100, Linus Walleij wrote:
> > > This assigns the .irq_set_affinity to the parent callback.
> > > I assume the Tegra186 is an SMP system so this would be
> > > beneficial.
> > >=20
> > > I used the pattern making the hirerarchy tolerant for missing
> > > parent as in Marc's earlier patch.
> > >=20
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Cc: Vidya Sagar <vidyas@nvidia.com>
> > > Suggested-by: Marc Zyngier <maz@kernel.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > >  drivers/gpio/gpio-tegra186.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/drivers/gpio/gpio-tegra186.c
> > > b/drivers/gpio/gpio-tegra186.c
> > > index 9500074b1f1b..5060e81f5f49 100644
> > > --- a/drivers/gpio/gpio-tegra186.c
> > > +++ b/drivers/gpio/gpio-tegra186.c
> > > @@ -444,6 +444,16 @@ static int tegra186_irq_set_wake(struct
> > > irq_data *data, unsigned int on)
> > >  	return 0;
> > >  }
> > >=20
> > > +static int tegra186_irq_set_affinity(struct irq_data *data,
> > > +				     const struct cpumask *dest,
> > > +				     bool force)
> > > +{
> > > +	if (data->parent_data)
> > > +		return irq_chip_set_affinity_parent(data, dest, force);
> > > +
> > > +	return 0;
>=20
> Having come to my senses, this should definitely return an error when
> there is no parent is present (i.e. we can't claim success when the
> affinity hasn't changed).

FWIW, if I change the "return 0" to something like "return -EINVAL", I
no longer see the warning in the kernel log.

Thierry

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+ydlsACgkQ3SOs138+
s6FzVQ/+M+a7gcPvR0/V6OBTDsytIRrQITBgkWEUNa3qMu/j69u8mIk+O0AwkpLi
2BJcX7Th1lWStO8joJZKdl+/J1RJVMGcOLsajEDowID5ZgxD6JDqqiYVVRzS8pIA
KwEVyy5U1Gse9Yena4EmXya7qLpWa84fbMJVy7pZJnAZmaIUJS8tXL/iXBHZgn6K
0vPOqA0L6miNgeGtlxxZw6Edyf6y6pnvUg46nFCMiLsMLXmujI4gwzF0Ab3oPUM8
XKH67q+eFxPgDgzqDJFA/05dG/3cPb/6a3qBUCAmKWDyy3/Kn3/lX8yQYNs45gu0
mn6OI8psjgn25fliU0fEFus+aoyAt6giVC8xFKimU2LPzPfVQ757+9tBo1ZY2Sha
x4+mYV35/ZPvqAHemD3QPQINrPSCJLeDc7ScSPjQUTrIT0m4DmtzW6RDCZ36KReF
iE3HrwEV4DbOYrau8nsYLs/udkmrvqhNkX1oFicfM6hOBH5cham0aRcFXFqYgzPQ
ZcWOIWaaYsvM8ZNX1Nx8/v88knvrcy32FcltKGjEKasZ/Vs346DCG+qKIZJH2QhL
QtQbFQyIz3786Jf6lB2UL4ZjW1Y0hQkxJ7SuBvwYKp2xbwI93z/KPoTJ/jF6Rcge
RL5D6SDHRa/rRp3mQogA6kLtl8HiLkDAwlaprzAv848hIVCj7Cw=
=HQRP
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
