Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63FF4110F4
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 10:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbhITIb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 04:31:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:44196 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235832AbhITIbj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Sep 2021 04:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=V3qeqboLXKvTgpPPFp/00Iz4UpTd
        r9XWmObz8M34siw=; b=eUUYID1QsLx886Vp+BV3KPbCF4rGhGBiXSr0mC9juqQR
        MV5uUV0BVjlVKNZBgunxvEBsSage8axBidUT71z0zbFY7ydm5ujWzLMqnx4X9fu0
        ArV9dUsHWki2dmLsiFUm0BOjTW0EMA6axfi/9ZQcHrL3X8bDgvr+LsXAyoPEY2c=
Received: (qmail 2400880 invoked from network); 20 Sep 2021 10:30:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2021 10:30:08 +0200
X-UD-Smtp-Session: l3s3148p1@YWy9FmnMroogAwDPXwlxANIWpbLKE1Uh
Date:   Mon, 20 Sep 2021 10:30:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YUhGkBdXJUI3XadP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210918083307.3195-1-wsa+renesas@sang-engineering.com>
 <20210918083307.3195-2-wsa+renesas@sang-engineering.com>
 <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+LAkWgDK13VhUQYg"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdv=0i05EitMi6JjbjML-jFD_1M0q7ps2KVHcN4UtFU-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--+LAkWgDK13VhUQYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

thanks for the prompt review again!

> > +       /* upper limit is arbitrary */
>=20
> Not really. I believe if the upper limit is > PAGE_SIZE, you would get
> -ENOMEM with much higher chances. So, I think the comment should be
> amended,

? Dunno, maybe it is not arbitrary that it is < PAGE_SIZE but other than
that the value I chose is arbitrary. There is no technical reason for
2048.

>=20
> > +       if (count > 2048 || count & 1)
> > +               return -EINVAL;
>=20
> ...
>=20
> > +       ret =3D device_property_read_string_array(dev, "probe-names", g=
pio_names,
> > +                                               priv->descs->ndescs);
> > +       if (ret >=3D 0 && ret !=3D priv->descs->ndescs)
> > +               ret =3D -ENODATA;
> > +       if (ret < 0) {
>=20
> > +               dev_err(dev, "error naming the GPIOs: %d\n", ret);
> > +               return ret;
> > +       }
>=20
> Perhaps
>=20
>   return dev_err_probe() ?

Reading strings from DT can be deferred? I don't think so.

> And I think it might be split into two conditionals with
> distinguishable error messages.

I think "something is wrong with the names" is helpful enough for the
user.


> > +       dev_info(dev, "initialized");
>=20
> Unneeded noise.

Nope, I added it because when I was adding more instances, this proved
useful. I'd agree if this is a regular driver. But this is a
only-for-special-case-debugging one.

> > +       [ -n "$cur_cpu" ] && fail "CPU$isol_cpu requested but CPU$cur_c=
pu already isolated"
>=20
> For the sake of style (handle errors on the error) I would use
>=20
> [ -z "..." ] || fail ...

I'll think about it. On first glimpse, this doesn't look more readable
to me. "if this is true then do that" is super readable in my book. But
yes, when calling external programs, I need '||' anyhow, true.

> > +       # Move tasks away from isolated CPU
> > +       for p in $(ps -o pid | tail -n +2); do
> > +               mask=3D$(taskset -p "$p") || continue
> > +               [ "${mask##*: }" !=3D "$oldmask" ] && continue
>=20
> Perhaps
>=20
>   [ ... =3D ... ] || continue
>=20
> to be in alignment with the rest of the similar lines here?

Yes.

> > +       *) fail "error parsing commandline: $*";;
>=20
> command line

OK.

> > +if [ -n "$lainstance" ]; then
>=20
> Shouldn't be rather '-d' ?

Nope, this is just a string for now. '-d' comes later with $lasysfsdir.

> > +[ ! -d "$lacpusetdir" ] && echo "Auto-Isolating CPU1" && init_cpu 1
>=20
> This ! along with double && is hard to read. Simply

Same as above, will think about it. But "if there is not this directory,
then do a) and b)" is not hard to read in my book.

Happy hacking,

   Wolfram


--+LAkWgDK13VhUQYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFIRowACgkQFA3kzBSg
KbZ1QA/8D789923P8m5eIJH+JqOLgIPKLF8efnTccUKrYUJpfiHOQZbHLoxwLEg5
iqYi3h0Y3iN5fXoPsK7UGHgrywtlWGnXY+pplXWhEqYtH10TC+j3lK92UzaR4bHR
+kImKQBCKnQoowA4CEHIs7/hx7B11IlS/Kyty564QOQAKwDZ7mSUOGCg12H2clEs
bl6JysehXdfmZhNnrv8Rs/nwa14h7kRIFCoHQwPP3vctRtKhOsoeOjaK1MEGf2ov
I9cxnb0y6VrBRHulz/sp04SD1MJn8SjPDC/UH217YJsUkWrrAEi9SfdT1iK1bMrC
cC0ohuCRQLUgYTD8RKNFIyW8E7yKDsIudcx+1WpV+Q2kt8w6KXlOwcVuOw2mC2SO
fx1AZr6Us2Gj2daEbLooTfxYC5q3VbjVPfmBxX5yeE1Ph3E0l/7iUFHJ9SRQePQ+
kRIc/QLHtikqlnRJ475xFbUObkJzTkv4TahRSwO4rs5SLLZ+QlshhcAYnQQgsuUK
9zTmg2Q6LLZVBY/wUb+cVnZVpomBa9FNX6EuEhmxzsi8XGqJDTwZXUmJE2VaEmPM
3hj4yFhNM4tr+HrpoptiBuwonITYAOWP6w/dEf6lePbqRyuj+KZBhwueCptsValD
htisxjWaHjw/Fm+iFUsm+uSezh4alXjaNWhi+EstoBHaarFN7+4=
=XuoP
-----END PGP SIGNATURE-----

--+LAkWgDK13VhUQYg--
