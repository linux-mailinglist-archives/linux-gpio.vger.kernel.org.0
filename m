Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7671032A15
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 09:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfFCHxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 03:53:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39611 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfFCHx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 03:53:29 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so10920381wrt.6;
        Mon, 03 Jun 2019 00:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DnOHOUTFW/E3Meo8c8oC1rIG8R7agRt9ZnAEAnXR5Oo=;
        b=JNWmUcpsmgJnZWMHZ+0UF4xxxun5ShvnpITaQbev3tO0xmqt0DO3xZRe5BU3+sS4HW
         slxplm+sGhxnSMW/ihhMuUVY91RjHA2B6/BXINfvax25uz7+pF9YMW/Nc7dUd7ZAD7ki
         2uaCJf8gb9uASAu0Wt/VzxSPFUqbOO4lddRdO85WnQExx07hDfaW/eqjnlNWinVXo2vE
         eOemqW/j6yu9APes93zmfbxVO5OxyYHFqV6oZ9dAPnVCE1pziplJnd2SeMrONqe4n2V9
         txWVLO17W/PiB6+I2d91Cw+EEIbND7SQ8XIjgaTI16WqlAstHLI70tRFyjdo/YYOgJps
         480A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DnOHOUTFW/E3Meo8c8oC1rIG8R7agRt9ZnAEAnXR5Oo=;
        b=mmVC4yRwKV3xZIBlkn/sooqvLhQK40dNbAjHks4bWwSaBhk+VP5XVbUp2K684OUJPU
         KtZ9vw7T1QoQHOJaB7d8AP7mhJUVMUDNYTiZexkc1vEM+U3Hb+LeqNM4XnAMYUbDLfaw
         hkVUalQSOoUIZdM2Nnrrg4UU70e7gvZgY3oX3YlTHX4AEztWkjsSpxgjL8Tv6BzjUkHy
         XpibKoeOsDnxW3yRIRtWnlIM++c2xcrKi42H60imNYT5FLhea8dR/yOtf/gft89dEqjS
         84BlULwrTG3QXQOvHKsOSbIuR0zFM9kwZDksDy/wY+fNZrOTQ1IOAalW0KGE4xd3MGus
         qb5w==
X-Gm-Message-State: APjAAAXLOxVimjvGt0JVrkPa26/jGVNhvzeDL9kHYIvq3EJtXk51ZrvY
        2iGwsn1Blydk8p22S0GfQHI=
X-Google-Smtp-Source: APXvYqyx6xjdXI+Zh556twjM2G9HcF+zxZmcGev1ZNI/oZ29+HNhFZ5Cz2bZUo9zMPqSeL7XRdVCOQ==
X-Received: by 2002:adf:efcd:: with SMTP id i13mr1491783wrp.51.1559548406948;
        Mon, 03 Jun 2019 00:53:26 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r9sm14227780wrq.0.2019.06.03.00.53.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 00:53:26 -0700 (PDT)
Date:   Mon, 3 Jun 2019 09:53:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190603075324.GA27753@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 03:46:00PM +0200, Linus Walleij wrote:
> On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Hierarchical IRQ domains can be used to stack different IRQ controllers
> > on top of each other. One specific use-case where this can be useful is
> > if a power management controller has top-level controls for wakeup
> > interrupts. In such cases, the power management controller can be a
> > parent to other interrupt controllers and program additional registers
> > when an IRQ has its wake capability enabled or disabled.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v3:
> > - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> > - add missing kerneldoc for new parent_domain field
> > - keep IRQ_DOMAIN dependency for clarity
> >
> > Changes in v2:
> > - select IRQ_DOMAIN_HIERARCHY to avoid build failure
> > - move more code into the gpiolib core
>=20
> This is looking really good!
>=20
> >  config GPIOLIB_IRQCHIP
> >         select IRQ_DOMAIN
> > +       select IRQ_DOMAIN_HIERARCHY
> >         bool
>=20
> Hm OK I guess. It would be ugly to ifdef all hierarchy
> code in gpiolib.
>=20
> >  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
> >  {
> > +       struct irq_domain *domain =3D chip->irq.domain;
> > +
> >         if (!gpiochip_irqchip_irq_valid(chip, offset))
> >                 return -ENXIO;
> >
> > +       if (irq_domain_is_hierarchy(domain)) {
> > +               struct irq_fwspec spec;
> > +
> > +               spec.fwnode =3D domain->fwnode;
> > +               spec.param_count =3D 2;
> > +               spec.param[0] =3D offset;
> > +               spec.param[1] =3D IRQ_TYPE_NONE;
> > +
> > +               return irq_create_fwspec_mapping(&spec);
> > +       }
> > +
> >         return irq_create_mapping(chip->irq.domain, offset);
>=20
> This is looking really good!
>=20
> > +       /*
> > +        * Allow GPIO chips to override the ->to_irq() if they really n=
eed to.
> > +        * This should only be very rarely needed, the majority should =
be fine
> > +        * with gpiochip_to_irq().
> > +        */
> > +       if (!gpiochip->to_irq)
> > +               gpiochip->to_irq =3D gpiochip_to_irq;
>=20
> Please drop this. The default .to_irq() should be good for everyone.
> Also patch 2/2 now contains a identical copy of the gpiolib
> .to_irq() which I suspect you indended to drop, actually.

It's not actually identical to the gpiolib implementation. There's still
the conversion to the non-linear DT representation for GPIO specifiers
=66rom the linear GPIO number space, which is not taken care of by the
gpiolib variant. That's precisely the point why this patch makes it
possible to let the driver override things.

More generally, if we drop this we restrict access to the built-in
hierarchical support to devices that use 2 cells as the specifier. Most
drivers support that, but there are a few exceptions:

  - gpio-lpc32xx
  - gpio-mt7621
  - gpio-pxa

gpio-pxa seems like it's really just two-cell, but the other two are
definitely different. As discussed before gpio-tegra186 is also
different but could be tweaked into doing two-cell by generating the
GPIO/IRQ map upfront.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz00fEACgkQ3SOs138+
s6ExUg/+Kgpk/o+5xU/+vPkJcf5qgh8ZH6Ieri+vtLVy6O9OIMHNXZB9Lq9DLVB7
Z21poqg0pUmpUttaCmGPkecyWqBH1vkgkZWLiLJ5BD40TiHFiOCHDC1MhrEBocsl
k5RDqV/29pRq+itQq8o31RoxPvvYaKzgYd2ReFtOcptI901cF8m905TICVk480sZ
WCe74YNqMTCQSg7ZMM2LkCVz+vZsCdbza1OtsL0rzIXpdAAvmGNtNMzYhZBn+l7b
LmhG82DM9Zu53rQaVgderWXO/3XhQo7JQQTgTEXNP9bSpxeRU0gxnR7Wy1VtD+yr
+mKRLLZ0oEUAhMg8RAxJPeFPPCZB+Xu7T2l9cL/BewHAH6V/1DompdJPokWLw8+Q
v3CKY8962TcyrQo3tcDHnYUjmsiS69L+P5/Q5aydRZ8aGjKykrBfEF87D693uFm6
nqShCP6IHFxJnWVIYSEC9GfHuKW+Osae55lqReE5zJdtMnpmRcl5qSZIywi1VUYE
BkxBL/gf6WjSqjdJxdHYje87Dhz0/OhKktGPLGRt04MfrOIAHaTUXjdIfJ28oylG
sIavcbuO6d2mdBFAgGeQ/XpF1/8OPBSWHNyMwWw3nPt1vvjJaGMvfd1DrTBHJ52K
MSGfRQ2/Ot14UGU6sYz3ZbZwZm9T1d5u5OZTTe7FN7sxib1/Kuk=
=O3rF
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
