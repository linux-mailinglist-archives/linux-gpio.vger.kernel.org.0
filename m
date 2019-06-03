Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE6433383
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 17:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfFCP2w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 11:28:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45916 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfFCP2w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 11:28:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id b18so12515972wrq.12;
        Mon, 03 Jun 2019 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R0W4k3BICJ2WutXYH9IGV5/N63dSSF//OiRLIaj1e9Y=;
        b=S9Kkj17DDzDE5Z7XeeEr+Rzf+HfZirV7k6u/QNk25GVYowii2mVqhnbBb7z9YBCNLf
         qSHAIPSfiBDzhIHa2Hluko5PH5p3lXrLHkYVAB0AtRMcEyGvWyUYIfascea08kABZeAO
         7febfroAd6uFY+EnOPYO4ONxC9tlnyXvy6w1iRj9IAjZUoUxUrQ2R4x9JKM1ZQOd43qg
         ggW7PaIC5ZNy+QpYN0QI5xBoJbBNX00qgdnpwU+REWtcLWHhPgqz6fTIEgvCRSLpAwLx
         EQxYgYvZtkVdLzGiYpGK/ii1i4B0MyefEoLPhUP266vd+Yc0GFzH5K4e88Ddgo3x0oEc
         /WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R0W4k3BICJ2WutXYH9IGV5/N63dSSF//OiRLIaj1e9Y=;
        b=Bj+873IZEFJY374Kkrh7YnYK9UkdWlxUQezY647F5HYPL3Bo9CSDBOxJEQpqK11tas
         voFJnaIpvnUa1MWqfxd6emsHYy2rH0eQLi9uUUXdJ/63CmL09E1L5uLR+P48QyaOvSD7
         ZS+5EGumxjgsRuKqrTXQgwDeEJZh0NEnCZXik5L2D4qEiNh1+xJHNLz6UIGe3Q0n95hq
         AcAXrUYeqKqn1fCQ0QtJcKTx4XzqUPYbZlOrZbcUpKcR7ouh6ddoUZQ5G6M+b69s+0CS
         EktMB9s1Pwds0CUbp5RQUjkcFQ9jjAilFsB+rqjtssj9RkKKU1/i5oFWZh2ZdIhY9jh1
         L1cg==
X-Gm-Message-State: APjAAAU5JJKTPEH4ZUm9GjGmoojCdlpegTU2Ko4GKL74zgyGSwVO3eQa
        b8IYFkBLG1M62+QxeEGR1kk=
X-Google-Smtp-Source: APXvYqxNjelk8UuA5p+0R6FFQve85Va22YZnaVsDYbsKcbDvsVP02pGq0aCY6v8Q0G/y3TqkgdKYnQ==
X-Received: by 2002:adf:8367:: with SMTP id 94mr17313992wrd.179.1559575730576;
        Mon, 03 Jun 2019 08:28:50 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f197sm15425228wme.39.2019.06.03.08.28.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 08:28:49 -0700 (PDT)
Date:   Mon, 3 Jun 2019 17:28:48 +0200
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
Message-ID: <20190603152848.GA23747@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
 <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
 <20190603121227.GB30132@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20190603121227.GB30132@ulmo>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 02:12:27PM +0200, Thierry Reding wrote:
> On Mon, Jun 03, 2019 at 12:58:02PM +0200, Linus Walleij wrote:
> > On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> > > Me
> >=20
> > > > Please drop this. The default .to_irq() should be good for everyone.
> > > > Also patch 2/2 now contains a identical copy of the gpiolib
> > > > .to_irq() which I suspect you indended to drop, actually.
> > >
> > > It's not actually identical to the gpiolib implementation. There's st=
ill
> > > the conversion to the non-linear DT representation for GPIO specifiers
> > > from the linear GPIO number space, which is not taken care of by the
> > > gpiolib variant. That's precisely the point why this patch makes it
> > > possible to let the driver override things.
> >=20
> > OK something is off here, because the purpose of the irqdomain
> > is exactly to translate between different number spaces, so it should
> > not happen in the .to_irq() function at all.
> >=20
> > Irqdomain uses .map() in the old variant and .translate() in the
> > hierarchical variant to do this, so something is skewed.
> >=20
> > All .to_irq() should ever do is just call the irqdomain to do the
> > translation, no other logic (unless I am mistaken) so we should
> > be able to keep the simple .to_irq() logic inside gpiolib.
>=20
> Well, that's exactly the problem that I'm trying to solve. The problem
> is that .translate() translates from the DT number space to the GPIO or
> IRQ number space. However, since gpiochip_to_irq() now wants to call the
> irq_create_fwspec_mapping() interface, it must convert from the offset
> (in GPIO space) into the DT number space, which is what that function
> expects.

Hm... I wonder if we even need this irq_create_fwspec_mapping() there.
Couldn't we just do an irq_create_mapping() since we already know which
one of the GPIO IRQ controller's interrupts we want to create a mapping
for? If we already convert to the GPIO number space in the .translate()
then the offset already corresponds to the one that we need to map, no?

I'll make a note to try that tomorrow.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz1PKwACgkQ3SOs138+
s6EvrxAAhvVOkUGVn6WQQ2jnZM1b0tya6pzAhUw11OYc7Ub6nc6yFaiQ8wE0pbcG
cAApoHS1T00Yj8qHqUQHieIVRAEE0dpWheKOs4hNsWHu/SlYW0l19EbfYOFBqo+n
iQje2Vtmc2/eYSwHmE1ggqbX2OO9MtvxQ7oyKCPxXzDlXOO0c7zEMKvHmZpEp4zy
RBNCQAcqUR3JbUgMVd4qvxytWjxhJo/AscOJ2754Wvd7Ut6FpO0qIJsTCcOCMaua
6le5HOOYVEgj0Wd/3CFJUrpQWlikVPRUHVCZECieBoruv2IcffHC/zxDlYpMTRdV
+9OLds+6TRf1R6AiIPiAm/tcRpG+D30RoR8AsruR+9GuVZoRQf21Pr+pTT4WhWRT
NPYRVSxe+mAMXgCjoWcu5qWYkweMsCxUVFhGWyoe0tRlxV3t0BJf6Rd+69SgbMmd
RTJtLY/3vGkNkI7iXFEJgH8iBr0mPLCBMG6SwcA7E3xopVqhzHU2lsSNUEG5x6nz
z09tzO1Bsr2RNAz5j5mPxJPUdbcUwE3dHnRB4XG99vCBxsPoPNShHir/9ygUg2tM
sFLPLcMvHJfNe/jukF+3C0jLVVs8ZYY4yDfJtltKDwhoBeiS1+T7hocMlsohM8VG
Mmsv1050gE6pzqQKF4sxEhqNO8vuh4gbOyX8cYThMdtkBic2aFQ=
=IpuP
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
