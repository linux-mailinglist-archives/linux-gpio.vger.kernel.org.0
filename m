Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D99401891
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Sep 2021 11:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbhIFJFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Sep 2021 05:05:07 -0400
Received: from www.zeus03.de ([194.117.254.33]:46696 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhIFJFH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 6 Sep 2021 05:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=+Lf5rHLf0XW+4qcczI7zr8aKUSRq
        Rmu8VTL41qQ6cUc=; b=U4yzp7eBzry1Fk4sS0p5VLfi2M52yzs8ccti73J7z6ET
        O4z2lScvHlFuVidZeZX/QGcNTD8tK7h1JAlvM/9lpXVCi1+yTqWnwIWVHq6Z7hes
        H85AZaDeSURNvPzZpnlr8xqd8wZt8vyC4tWcqEfZtow806Dmgea2IHYbnZHuUag=
Received: (qmail 405358 invoked from network); 6 Sep 2021 11:04:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2021 11:04:01 +0200
X-UD-Smtp-Session: l3s3148p1@TVsX7k/LrqIgARa4Ra5MAc3ZBYWvSFq1
Date:   Mon, 6 Sep 2021 11:04:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <YTXZgNQJj0aI4zuC@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20210901194549.3999-1-wsa+renesas@sang-engineering.com>
 <20210901194549.3999-2-wsa+renesas@sang-engineering.com>
 <CAHp75VdZt_dDb0YpThfsoqRvWdjfVZT70o=eCJCbThJ9qbD42w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Rrk7XrymjnozogX+"
Content-Disposition: inline
In-Reply-To: <CAHp75VdZt_dDb0YpThfsoqRvWdjfVZT70o=eCJCbThJ9qbD42w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Rrk7XrymjnozogX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

thank you for the review again!

> > +       unsigned long state =3D 0; /* zeroed because GPIO arrays are bi=
tfields */
>=20
> Not sure if bitmap_zero() would be better. Up to you.

Looks cleaner, I'll check.

> > +static int fops_buf_size_set(void *data, u64 val)
> > +{
> > +       struct gpio_la_poll_priv *priv =3D data;
> > +       int ret =3D 0;
> > +       void *p;
> > +
> > +       if (!val)
>=20
> > +               return -EINVAL;
>=20
> Hmm... in this case you haven't updated the internal parameters, but...
>=20
> > +       mutex_lock(&priv->lock);
> > +
> > +       vfree(priv->blob.data);
> > +       p =3D vzalloc(val);
> > +       if (!p) {
> > +               val =3D 0;
> > +               ret =3D -ENOMEM;
>=20
> ...here you do. What's the difference?

vfree(). In the latter case, the old buffer is already gone.


> > +       if (ret >=3D 0 && ret !=3D priv->descs->ndescs)
>=20
> > +               ret =3D -ENOSTR;
>=20
> A bit of an unusual error code.
> Perhaps -ENODATA?

OK, as long as it is unique...

> > +               /* '10' is length of 'probe00=3D\n\0' */
>=20
> Maybe instead of comment is to use respective strlen():s / sizeof():s?
>=20
> Actually, looking below possible option is
>=20
> const char *fmt =3D "probe...";
>=20
> add_len +=3D sprintf(NULL, 0, fmt, 0, "");
>=20
> ...
>=20
> snprintf(..., fmt, ...);
>=20
> But it's up to you.
>=20
> > +               add_len =3D strlen(gpio_names[i]) + 10;
> > +
> > +               new_meta =3D devm_krealloc(dev, meta, meta_len + add_le=
n, GFP_KERNEL);
> > +               if (!new_meta)
> > +                       return -ENOMEM;
> > +
> > +               meta =3D new_meta;
> > +               snprintf(meta + meta_len, add_len, "probe%02d=3D%s\n", =
i + 1, gpio_names[i]);
>=20
> > +               /* ' - 1' to skip the NUL terminator */
> > +               meta_len +=3D add_len - 1;
>=20
> Reuse return value from snprintf()?

I will have a look at these string refactorings when I need the analyzer
next time and come back then.

>=20
> > +       }
>=20
> ...
>=20
> > +static int gpio_la_poll_remove(struct platform_device *pdev)
> > +{
> > +       struct gpio_la_poll_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +       mutex_lock(&priv->lock);
> > +       debugfs_remove_recursive(priv->debug_dir);
> > +       mutex_unlock(&priv->lock);
>=20
> mutex_destroy()?

Oh yes, thank you!

>=20
> > +
> > +       return 0;
> > +}
>=20
> ...
>=20
> > +#!/bin/sh -eu
>=20
> Next step is to add 'f' to the mix here :-)

-f broke zip file generation in a way I didn't know how to resolve
differently. Sadly, I can't recall the details right now.

>=20
> ...
>=20
> > +$0 - helper script for the Linux Kernel Sloppy GPIO Logic Analyzer
>=20
> Use at the top something like
>=20
> PROG_NAME=3D"${0##*/}"

I like this!

> echo "$2'
> exit $1

I don't see the need now. We can update if we need it.

> > +       [ -n "$cur_cpu" ] && fail "CPU$isol_cpu requested but CPU$cur_c=
pu already isolated"
>=20
> This theoretically may fail the script since you have '-e'.
> I guess I have mentioned that 'a && b' is not an equivalent to 'if-then-f=
i'.
> I suggest double checking all similar expressions and try under
> different shells (like dash).

Well, from the cover-letter:

* A *lot* of cleanups to the shell script guided by checkers, mainly
  'shellcheck'. This is mainly to ensure that the scripts works on most
  minimal shells. Tested are 'busybox ash', 'dash', and 'bash'.

> > +       [ -w "$cpufreqgov" ] && echo 'performance' > "$cpufreqgov" || t=
rue
>=20
> I guess this is where you actually hit the above mentioned difference.

I used a different kernel on a different SoC which did not have CPUfreq
at all.

>=20
> ...
>=20
> > +while true; do
> > +       case "$1" in
> > +       -c|--cpu) initcpu=3D"$2"; shift 2;;
> > +       -d|--duration-us) duration=3D"$2"; shift 2;;
> > +       -h|--help) print_help; exit 0;;
> > +       -i|--instance) lasysfsdir=3D"$sysfsdir/$2"; shift 2;;
> > +       -k|--kernel-debug-dir) debugdir=3D"$2"; shift 2;;
> > +       -n|--num_samples) numsamples=3D"$2"; shift 2;;
> > +       -o|--output-dir) outputdir=3D"$2"; shift 2;;
> > +       -s|--sample_freq) samplefreq=3D"$2"; shift 2;;
> > +       -t|--trigger) triggerdat=3D"$2"; shift 2;;
> > +       --)     shift; break;;
> > +       *)      fail "error parsing commandline: $*";;
> > +       esac
>=20
> I would prefer to have a clear shift here instead of doing shift 2
> everywhere above (less error prone).

If we ever support binary arguments (toggles), then a generic 'shift 2'
won't work?

>=20
> > +done
>=20
> ...
>=20
> I think usage of SI units makes sense to be less error prone in case
> you are using them more than once.

SI would be useful, for sure. But I need to move on right now, so it
needs to be done incrementally.

All the best,

   Wolfram


--Rrk7XrymjnozogX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE12X0ACgkQFA3kzBSg
Kbb0Dg//UOkBNzRGo+9gGDS7ix7/uqbUrjNU/rbxS5xv7oabrqELtKB0VO4AuQyv
up+ueFvstDAYYmPBHwbwOYi63+UvWscxGwCmBUkdbu5idskPmP2m2Md0SDBfrLB7
bEz+EcCwlZ1QHsmgHAvG7779WP8NeqfTXKlERHFOWGcQ5q8TqWaqxxxWKelaObt2
gabA1kQUT5S3oT+V7v5A+48gQfVv+SZNduR071dWQItaLnHUwQQ2IN0o8tczdZuR
fghQ3GayF0f6KbBVczbXk+Zfn/02gvqZDtfLQF26jLStcVN8kBkSUEPwmLQn0ipV
efEEvYRJqoOyZwt3JyUvUxt25NNniFPoXemjeeotArN1tca9o5jg+gMjk8wejVTt
rNJlHc4s0zCGFrSpMIVSMwuQBm/7yHJ0Cge7Tc6YU6/hk3PEhf0PDVP9lCnVFuqy
p2xSLiecEQbTn4oX1vot9wtSTrCln3fTMUSh4mYHfcjMKvbTeITP5Xg5hGuYyoRE
oJL8e3sBTJ7E3p7z1gzKArBf/B2AEXWtas2GPVoUM+jayj40LUeOcbId+th4I23a
Iuu/ThZcWVTPBhoKEuefvm2uGtkh2HXeCoSYuYbaaAJabvwbq8F8RV05CK9U4Q4j
B0lDLDpP8ckXhV77okr+6dzrlsook6yccwo9M3swAfqbHjV86EA=
=PpO2
-----END PGP SIGNATURE-----

--Rrk7XrymjnozogX+--
