Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353EE34ECC7
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 17:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhC3Pl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 11:41:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:38068 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232333AbhC3Plf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 11:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=CP+IfNo9+f1PCqAYKWcxOqfgqs12
        5/VzJBpx4GQ54Kw=; b=PVNdo2xA2zJgoRbMS2T6DIA9i77S+9aSGK6fcYhOrOdf
        AwC1i3dJe8sRwFlVQ1gcAj7FxYeU1YsgN5Rr126svhktnDFg/dJiOVSHvs20ED6P
        nWgKTY97DS9CoqsgfqER19nI/E16Izk6JDDS/8LR/bEU9EpJXXSOmckXRPwICDE=
Received: (qmail 257484 invoked from network); 30 Mar 2021 17:41:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2021 17:41:33 +0200
X-UD-Smtp-Session: l3s3148p1@Zi8V1cK+KIkgARa4RV5TAXqFgB02ZUaY
Date:   Tue, 30 Mar 2021 17:41:31 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH RFC/RFT 1/1] misc: add simple logic analyzer using polling
Message-ID: <20210330154131.GA991@ninjato>
References: <20210330085655.12615-1-wsa+renesas@sang-engineering.com>
 <20210330085655.12615-2-wsa+renesas@sang-engineering.com>
 <CAHp75VcVQJ6ezyHUc8TMd0qp453QgLL42N5GqWOy5oxrp5_qnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <CAHp75VcVQJ6ezyHUc8TMd0qp453QgLL42N5GqWOy5oxrp5_qnQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> I would like to look at it closer, but don't have time right now. So,
> some kind of a shallow review.

Still, thanks for that!

> But the idea is, let's say, interesting.

:)

> > +The binding documentation is in the ``misc`` folder of the Kernel bind=
ing
> > +documentation.
>=20
> Can't you give a reference in terms of reST format?

Sure. Still need to practice reST.

> > +config GPIO_LOGIC_ANALYZER
> > +       tristate "Simple GPIO logic analyzer"
> > +       depends on GPIOLIB || COMPILE_TEST
> > +       help
> > +         This option enables support for a simple logic analyzer using=
 polled
> > +         GPIOs. Use the 'tools/debugging/gpio-logic-analyzer' script w=
ith this
> > +         driver. The script will make using it easier and can also iso=
late a
> > +         CPU for the polling task. Note that this is still a last reso=
rt
> > +         analyzer which can be affected by latencies and non-determina=
nt code
> > +         paths. However, for e.g. remote development, it may be useful=
 to get
> > +         a first view and aid further debugging.
>=20
> Module name?

Yup, willl add.

> > +#include <linux/of.h>
>=20
> Can you switch to use device property API?

IIRC I checked that and I couldn't find a replacement for
of_property_read_string_index().

> > +/* can be increased if needed */
> > +#define GPIO_LA_MAX_PROBES 8
> > +#define GPIO_LA_PROBES_MASK 7
>=20
> Does this assume the power-of-two number of probes?
> Perhaps using BIT(x) and (BIT(x) - 1) will clarify that.

The arbitrary limit of 8 probes is solely to get this out now for
initial review, to check if this is upstreamable at all. If this is
considered acceptable, I can also update this to 64 probes and can get
rid of some more hackish code (e.g. fallback names of probes), too.

> > +struct gpio_la_poll_priv {
> > +       unsigned long ndelay;
> > +       u32 buf_idx;
> > +       struct mutex lock;
> > +       struct debugfs_blob_wrapper blob;
> > +       struct gpio_descs *descs;
> > +       struct dentry *debug_dir, *blob_dent;
> > +       struct debugfs_blob_wrapper meta;
> > +       unsigned long gpio_delay;
> > +       unsigned int trigger_len;
>=20
> > +       u8 trigger_data[PAGE_SIZE];
>=20
> This is not good for fragmentation (basically you make your struct to
> occupy 2 pages, one of which will be almost wasted). Better to have a
> pointer here and allocate one page by get_zero_page() or so.

Point taken. I will have a look.

> > +       if (val) {
>=20
> if (!val)
>   return 0;
>=20
> makes your life easier.

Yeah, it is cruft from an earlier version

> > +               if (ret)
>=20
> > +                       pr_err("%s: couldn't read GPIOs: %d\n", __func_=
_, ret);
>=20
> Haven't noticed if you are using pr_fmt(). It may be better than using __=
func__.
>=20
> Btw, it seems you have a struct device for that or so. Why don't you
> use dev_err()?

Will check.

> > +               if (buf[i] < '1' || buf[i] > '0' + GPIO_LA_MAX_PROBES)
>=20
> So, you can't increase the amount of probes without breaking this
> entire parser (it will go somewhere to symbols and letters...).

Yeah. This is why I put GPIO_LA_MAX_PROBES there. When I upgrade the
number of probes, I need to have a look at all place using this define.
This code is ugly, I know.

> Shouldn't you return OVERFLOW here or something like that?

I could. But 4K of trigger data is also invalid. It is an academic
discussion, though.=20

> I'm not a fan of yet another parser in the kernel. Can you provide a
> bit of description of the format?

It is in the help of the script. I could maybe add it to the docs, too.

> > +       if (IS_ERR(priv->debug_dir))
> > +               return PTR_ERR(priv->debug_dir);
>=20
> Shouldn't be checked AFAIU.

Oh, really? Will check.

> > +static const struct of_device_id gpio_la_poll_of_match[] =3D {
> > +       { .compatible =3D GPIO_LA_NAME, },
>=20
> > +       { },
>=20
> No comma needed.

OK.

Thanks for your time!

   Wolfram


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBjRqcACgkQFA3kzBSg
KbZEcw//fVqGcbp/ilQlTdgAH01uX9tT7gIpmvlcW+XZJCFL2sO0+L0jklNMKFTu
Hzek6EvaQKKlM5+nxANh2iCieCPR9Olb6GEaPipkbO1ROrssL4p18kqnMXTun7gK
mto/nY6yVHH23Dd9HTcLf0AJkgGvhx3eLRlzdEhVxyNoPhaWLDy/tmuM3UzCnH+x
1mpCpMhvo9hwVo3FsIPEJz9o6dDxSLJvdjnuaKqi+H7tiof0waJIuuLkKmIoXad6
qpxxzZnekrShZRwyzQmEapIiEVtnuxiOpwYSzZpdRZl8Kue0YbXroLhw4R6//mee
QqehLiN12R215JGR+TJV8au9Pn/LAvFL1f8hLDVH8Iq2wUMiap3N0DIjlpwUH5do
sB/x6d+eQ/lMQtv5ll4uNg6Aw0rf1d0bdavKcyR71mCDSc1RSOJ3MQPMMcUeNoV5
llGYTRaOtW14/MvaBCh1b2iE4C6Uf/JdDr2sgpPDT35Xczef8xk2jv9bsMFzPcRU
D7pAGsknCtslp26Nb+CAIoC5Md2v/8vygcFQx/XY/7OOyGXuBMsE9I2LK4cp4hqQ
NGGPh8xQPncaNN0VZ7daDvGFXR4woaaPyN2NP7nGI6f1qe7QfPVS1S3OwmX2IBdj
nXQ96uKLxdUpPM+TyM+ln+C1dsUxUVUG/xABPakMi+PkkwZU0ug=
=0kbW
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
