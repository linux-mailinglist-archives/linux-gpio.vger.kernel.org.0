Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5793171775D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 08:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbjEaG7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 02:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjEaG7F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 02:59:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DB4E67
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 23:58:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fmx-00031X-Lt; Wed, 31 May 2023 08:58:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fmw-0042yn-J4; Wed, 31 May 2023 08:58:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4Fmv-009jZj-NJ; Wed, 31 May 2023 08:58:29 +0200
Date:   Wed, 31 May 2023 08:58:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of
 "high" and "low" for output hogs
Message-ID: <20230531065829.7qrkv2ivs57aymcz@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de>
 <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kiuvageklynpwzoc"
Content-Disposition: inline
In-Reply-To: <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--kiuvageklynpwzoc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Wed, May 31, 2023 at 12:51:34AM +0300, Andy Shevchenko wrote:
> On Tue, May 30, 2023 at 6:19=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > For active-low GPIOs the currently available nomenclature requires
> > regular explaination to the non-enlightened folks, e.g. because a hog
>=20
> explanation
>=20
> > defined as:
> >
> >         someline {
> >                 gpio-hog;
> >                 gpios =3D <24 GPIO_ACTIVE_LOW>;
> >                 output-high;
> >         }
> >
> > results in the line being set to the physical low level.
> >
> > So use the terms "active" and "inactive" which are less ambigous and
>=20
> ambiguous

Damn, I should configure my editor to enable spell checking
automatically. Thanks.

> > keep the old names as synonyms. The above example can now be written as:
> >
> >         someline {
> >                 gpio-hog;
> >                 gpios =3D <24 GPIO_ACTIVE_LOW>;
> >                 output-active;
> >         }
> >
> > where it is less surprising that the output is set to a low level.
>=20
> As I said before, this does not cover the ACPI case. Consider

I don't understand that concern. Currently there is nothing for ACPI
that parses "output-high" et al. So you want me to introduce support for
hogs defined by ACPI to fix the strange semantic for dt-defined hogs?
What am I missing?

> > +       GPIOD_OUT_LOW_OPEN_DRAIN =3D GPIOD_OUT_INACTIVE_OPEN_DRAIN,
> > +       GPIOD_OUT_HIGH_OPEN_DRAIN =3D GPIOD_OUT_ACTIVE_OPEN_DRAIN,
>=20
> This one is an interesting case, because depending on the transistor
> polarity this may be active GND or VDD. All the same for OPEN_SOURCE
> which seems not defined (but should be equivalent to the opposite to
> the _DRAIN cases).

This is (also) orthogonal to my change, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kiuvageklynpwzoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR28BQACgkQj4D7WH0S
/k7FxAgAuOovYouJhcxpL/5nw26UfQnSVtr7ctHWUS/DjWR8loktxhEBQGpxDwU1
EA1uoD9cG+26vYOLTV+PRT4AWwA68i4kn2FC4RcyaoSyA8T5+Pja3LAX3dgrvOWV
l2VZ+nJmJWPjEm73mzVKSMKTP92uXCMuphCGCga8Bn4MqeC+DGgYpU2njXQIQZWj
XWhfXDWbsJV/Nx2iL8ksnpuBKZmZiMIzFgTrVFQxWuQFMBVefVGmR5jRijwA5ULV
+4YDU3Uu00gpCrJIWsk1ds3/HNV70L1dFSvaCYI57v69HdwttyclIP/Dqu/JpW1B
zI46pAE2Gu5kTNXPQfpmbjsjS+zWmQ==
=Ff3y
-----END PGP SIGNATURE-----

--kiuvageklynpwzoc--
