Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10898458E21
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 13:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239513AbhKVMWj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 07:22:39 -0500
Received: from www.zeus03.de ([194.117.254.33]:34416 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239507AbhKVMWi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Nov 2021 07:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rHDAtzlq4yZRIQ810fdaUSF1e6YC
        9KKZiymAjzTNLi8=; b=MARUeGD49sLiBFwpEbvCgneGq2qaVUsj+HNPnOdWtMrU
        6JDHqdkTgUoUaajMwzpuixFNQcW5kZokTHBA5xkzqBZsujTTqWn2B+NWoNbfeVs8
        3p4ZoR2o7OAblNxolruEt+1ekkpJCi5Um52RWEHJCkbYH4YYY+Jeqwc6c3AvQLQ=
Received: (qmail 795569 invoked from network); 22 Nov 2021 13:19:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2021 13:19:30 +0100
X-UD-Smtp-Session: l3s3148p1@cz3Eol/RqN0gAwDPXwnCAFkDAkP2hjT7
Date:   Mon, 22 Nov 2021 13:19:20 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YZuKyEcsXb8dwiHG@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
 <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
 <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
 <YUhGkBdXJUI3XadP@ninjato>
 <CAHp75VcXuYLM4cPAb+rv47wz0v+Q6tjek6tKuBj32K81XxkKaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UUeC4Ll6cpV9GYTC"
Content-Disposition: inline
In-Reply-To: <CAHp75VcXuYLM4cPAb+rv47wz0v+Q6tjek6tKuBj32K81XxkKaA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--UUeC4Ll6cpV9GYTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> > ? Dunno, maybe it is not arbitrary that it is < PAGE_SIZE but other than
> > that the value I chose is arbitrary. There is no technical reason for
> > 2048.
>=20
> I understand, but the comment is a bit misleading. My proposal is to
> extend / amend the comment to point the upper-upper limit out. Perhaps
> you need to rename "upper" for your case, or use a different word for
> the PAGE_SIZE limit. Up to you.

I use now "upper limit is arbitrary but should be less than PAGE_SIZE".

> > > > +       if (ret < 0) {
> > >
> > > > +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> > > > +               return ret;
> > > > +       }
> > >
> > > Perhaps
> > >
> > >   return dev_err_probe() ?
> >
> > Reading strings from DT can be deferred? I don't think so.
>=20
> There is a new development, i.e. the documentation for dev_err_probe()
> is going to be amended to allow this. But I can't quickly find a patch
> in mailing list with the related discussion.

I still don't get this one, so if there is new development and you have
a pointer, I'd be glad to hear about it. Otherwise we can fix it
incrementally later.

All the best,

   Wolfram


--UUeC4Ll6cpV9GYTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGbisQACgkQFA3kzBSg
KbYjVxAAhAEkgJ9mkVKfVHzW7nH/rKKhQUNyA277eADWyw+pOXSfIO/k92g1q20s
bJ7BrUdJpvyMqC91wsOL/v8jEMzNRUKduYKRU8/nRCF8gyRT93yYpsXa8CG4DQrC
i+ZkLUloiIeqkzD7tn4oj72duihVGEPjljohhwmRlxUEImVMXpcpdTqFeUtj55Ak
2h9rZp61rmz6Fy1f+fRX3wMyG2/7lPr5uTo2NjYpM/z9eNeEyuziZCuawj24zk12
rvxn/Y2ZdIrqBOzD6L0QvqEONX2bCs3n7SxnYK4H+GMSc3RGH+0Ovd5f01zE6kH6
bW5ADVic+qhEQrmlQ5728x/x6pr99634K1tFrj3v1thVhIzqdT1wK0kW3YduLibi
n04hhKw6GuHPj4evoVr9p3tjg+GjtUYLTKTCHsxzk8vKLLZvgxSqFfTaYLAuI1Er
CSVepIhhlC3ba4v7Cq/xIYgT5c1ZRLNcIRWLqk0A9FPordyW22VqQULenSzZOE9d
MyKF5zzOHphzimtD/1Ym+3O77KgNv4HZnXYHkiBtuorWjLiD7UG2i2UWZTRHsbvv
hTAOKHiGeJcSOHPLC9NUXMJ+w6bF19kUzIw54pU+aOKSc2gOEASh7yHtw/B3Z6EP
qZQZLKfmIn6fmCXMP6fb4o92SRP5fse1oo/llDP8sLtD6p0CShY=
=tn0o
-----END PGP SIGNATURE-----

--UUeC4Ll6cpV9GYTC--
