Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8C432A1B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 09:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfFCHyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 03:54:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41918 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfFCHyJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 03:54:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so10908832wrm.8;
        Mon, 03 Jun 2019 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Jc7RTNdlKbjvzZoes3lNTQ2YApwJsgBEhNds1f4HJKs=;
        b=h35yfEjrY2vvw99MwIpgXVkJ5IJiLh3ia6b0guwVdc3G0+xJ2Lb1yR3zklGwbM3WxX
         BL9Uh2FU37IOo8En3rj1xsbbk36A6TTZfUw4xW57Z8D4k/Q2kj+3vzrADUe2RP1a9hCO
         T9fGLYAcz6iENTagpLuICFPOUeCyAy/nn8b1w+H/1W6eg/2/WStqBy9DteoE/WgKHgWY
         6vkKgvCshlq7vF3eyL1FKkaybSVOorAkVs3CqUusi+kl0gF0uAgbYLTrBjX/QsDcagNd
         brUWJdFilFSI2qHU4us+OZ95q9iLISWkqoeRjL1oxvn1boPXwPFTZho2AyjZ9TheB+4D
         DrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jc7RTNdlKbjvzZoes3lNTQ2YApwJsgBEhNds1f4HJKs=;
        b=c959ET3jhdje8pI85lQp7zFmLItbZ7cU13rue6w5pSllvXUoDWJDxSEOHWk442gx4G
         pAeRvTPs9YMoJ7M+OdEfScgRDaCOgg2mSEG8WypgCtyRaE4ibOkhyHaHp4zLNpXNDtzN
         +HIdKVUlVJ8qw2Zj4cpd9q5R/XOockDsiRSlpcDaPDZeLqpvffecWQO4j1V7/rJmLe54
         kQV9++9InlcjvJrZSlpvlKhtU8cldrhvVnWZNZb4zrNX7u/pgQutA/JXaVaDQqfXN/Vc
         Ijc2iiNuFZTQ1ty4kEbQlgJxnhHY5GvZ3mfbwFtZSjeILURZ+fVFd839AkWSgK8NbO01
         MYow==
X-Gm-Message-State: APjAAAVdpZ79b0FNkS5am9QGd8n+PHKh3LP+UGyAhTKZMZ9+AgPasJxo
        /NIvYdZee5uI1hZBXHwD424=
X-Google-Smtp-Source: APXvYqxiTSwZLXUULRvAFA/dfGcBZic3OggAmUtZmzPOd/5qOuxPbnrAMWF3IQY0KCa3Np3mjYPxUA==
X-Received: by 2002:a5d:5390:: with SMTP id d16mr8506962wrv.85.1559548447260;
        Mon, 03 Jun 2019 00:54:07 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id c2sm20530611wrf.75.2019.06.03.00.54.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 00:54:06 -0700 (PDT)
Date:   Mon, 3 Jun 2019 09:54:05 +0200
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
Message-ID: <20190603075405.GB27753@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
 <CACRpkdb6OjHZGgDHXH8gfi0WwzX8170zHJKbpbnSRv+UsZvfhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <CACRpkdb6OjHZGgDHXH8gfi0WwzX8170zHJKbpbnSRv+UsZvfhw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 10:35:22PM +0200, Linus Walleij wrote:
> On Sun, Jun 2, 2019 at 3:51 PM Linus Walleij <linus.walleij@linaro.org> w=
rote:
> > On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Hierarchical IRQ domains can be used to stack different IRQ controlle=
rs
> > > on top of each other. One specific use-case where this can be useful =
is
> > > if a power management controller has top-level controls for wakeup
> > > interrupts. In such cases, the power management controller can be a
> > > parent to other interrupt controllers and program additional registers
> > > when an IRQ has its wake capability enabled or disabled.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v3:
> > > - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> > > - add missing kerneldoc for new parent_domain field
> > > - keep IRQ_DOMAIN dependency for clarity
> >
> > Actually I applied the patch, and dropped the two lines making
> > it possible to override .to_irq() for now, so I can illustrate my
> > idea on top. If I manage.
>=20
> Bah I rewrote the whole think as I want it, maybe my ideas are stupid
> but take a look at it, also very interested in input from the irqchip
> maintainers.
>=20
> Sending it out as RFC in a moment.

Okay, taking a look.

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz00h0ACgkQ3SOs138+
s6EZfw/7BJannL3kB1Nh/+VGh/5w17Bx5M9krNi9ZnAdgOmUdIkhU2jgYJeq9rHL
lL0mqmiTp3kOC/P6UaWZDuP9Ua2c4A4tWyDm1f1/mFntd+jwdf/RCkeeGwlGKeaP
Hjk+xQLfb+iJGAIDE/yFuObO5/4NbcqtfNr62odpmhy/X2AvZT09bDIRJEtkrPdw
Eg2QIsO7Y7IQ7FaIpL353upu01V7xgiFxJuTq883zLT7TEF//RxnpYe3KEqAwVA2
Vj18fFheP0kJbFfsQWeHw7Dald+4pENxQzfq2eohnl2BdwkbFWLEwlNRcozhLgLP
cT8AX1H1L//+aOSZAnvm2QvVNsvkMyGELs1rznw6+82/BS3+bZctpDXUoJ9gl1Bc
nvZjzKftd3cUkr10K5tPgXiM/72MqQWflEHhlJ68kA2sJrOuoTEpRyNgXpIBqHuX
StSVhjqQU3UHP/QgviN1Bp/QpEI+1NPjrO1debtHdiKEa/JcwqGuzl/6bcckBwoC
0bT1bb/5DE5IFYLixCQndPaX5rWnV6xX7FDttEi7+1f6QtqvH1tkexhddKWNOCOB
rCMlNgDYTpbV0wVNixKgepiJLbUw3xxX/UMOZV161MQayl9ahIKa1y1zJWTzjlPg
nc6cNCt8uaYBLH/rm0w4nQ4VN2EypDKEn7fjj3Sk8QqLYz0s3mE=
=lwgL
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
