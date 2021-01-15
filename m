Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4ED2F805D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 17:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbhAOQNH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 11:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbhAOQNH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 11:13:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81B5C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 08:12:26 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0Ri4-000613-SI; Fri, 15 Jan 2021 17:12:24 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1l0Ri3-00035n-RC; Fri, 15 Jan 2021 17:12:23 +0100
Date:   Fri, 15 Jan 2021 17:12:23 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] gpio: pca953x: Add support for pca9506
Message-ID: <20210115161223.3weymsqrl3hdxtdx@pengutronix.de>
References: <20210113194952.104734-1-u.kleine-koenig@pengutronix.de>
 <CAMpxmJWy_1vXPopMRP_-U_jEAUbHJBEHA4x88H98i2JA=dzPHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5pblz2pntlkyiuuv"
Content-Disposition: inline
In-Reply-To: <CAMpxmJWy_1vXPopMRP_-U_jEAUbHJBEHA4x88H98i2JA=dzPHA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--5pblz2pntlkyiuuv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bart,

On Fri, Jan 15, 2021 at 03:18:10PM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 13, 2021 at 8:50 PM Uwe Kleine-K=F6nig
> >  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
> >  drivers/gpio/gpio-pca953x.c                              | 2 ++
> > [...]
>
> This looks good but we usually split the DT bindings and code changes
> into separate patches. Would you mind resending?

If I do mind, do you then take the patch as is? :-)

Well, ok, I can split ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5pblz2pntlkyiuuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmABvuQACgkQwfwUeK3K
7An9pggAiHF7yJroKXNPrvTlOMD6CUSOVq2k6z+rStmyZF/UTDNRJRlTkKdmNG5w
f9OmezW4mX9jUckXG2BHiUt845ndeJ6tyXeivmre/N4e5CJUD1cY0CbesSr1V/KV
kc3O0Jqqx5GZB7DlkS0dOce7FlGVHixKIgQD07649qzv0Xg0OYTKKDwvGR/vx78s
qofsuBJW7V9qyVx2QbXzuSbJqkLHkDApMnjocgXiYNxBwMmun2GRBldo52kwpDKL
p+1Lf1FuXhJowQP7KbBMnuuGNRhFS/h7yxFyeg99BiLR9qAjEbkcNRNKHaUhlqPv
mK5MIzTp2QQ7mNEts12QkqOSY2oiLg==
=YqpM
-----END PGP SIGNATURE-----

--5pblz2pntlkyiuuv--
