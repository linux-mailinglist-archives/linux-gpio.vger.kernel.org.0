Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE84717CCF
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235722AbjEaKHA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 May 2023 06:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbjEaKG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 May 2023 06:06:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021D7E2
        for <linux-gpio@vger.kernel.org>; Wed, 31 May 2023 03:06:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4IjJ-0000F7-8n; Wed, 31 May 2023 12:06:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4IjI-0044pQ-2i; Wed, 31 May 2023 12:06:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q4IjH-009mVM-68; Wed, 31 May 2023 12:06:55 +0200
Date:   Wed, 31 May 2023 12:06:55 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@pengutronix.de,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: use "active" and "inactive" instead of
 "high" and "low" for output hogs
Message-ID: <20230531100655.dedu3udhd4dv7r7j@pengutronix.de>
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-3-u.kleine-koenig@pengutronix.de>
 <CAHp75VegyUL6J-s4W4fHhKu4cNeBA=4J4CmDHmtAfCUr9qGHQg@mail.gmail.com>
 <20230531065829.7qrkv2ivs57aymcz@pengutronix.de>
 <CAHp75VeNTuQWLqieSyh0djyrBApoZRwKOAnMRd80fVGzfJAnbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="72ydsnektuj33hzn"
Content-Disposition: inline
In-Reply-To: <CAHp75VeNTuQWLqieSyh0djyrBApoZRwKOAnMRd80fVGzfJAnbw@mail.gmail.com>
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


--72ydsnektuj33hzn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 31, 2023 at 12:51:15PM +0300, Andy Shevchenko wrote:
> On Wed, May 31, 2023 at 9:58=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Wed, May 31, 2023 at 12:51:34AM +0300, Andy Shevchenko wrote:
> > > On Tue, May 30, 2023 at 6:19=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@pengutronix.de> wrote:
>=20
> ...
>=20
> > > As I said before, this does not cover the ACPI case. Consider
> >
> > I don't understand that concern. Currently there is nothing for ACPI
> > that parses "output-high" et al.
>=20
> This is not true.
>=20
> > So you want me to introduce support for
> > hogs defined by ACPI to fix the strange semantic for dt-defined hogs?
> > What am I missing?
>=20
> https://elixir.bootlin.com/linux/v6.4-rc4/source/drivers/gpio/gpiolib-acp=
i.c#L1262

Ah, that was the necessary hint. Adding the aliases there would be a
third patch in this series, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--72ydsnektuj33hzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR3HD4ACgkQj4D7WH0S
/k5Fwgf8Dhj7wrAg5wsobZp2N52h8cj879s94CihJaayMQlU2l4YtLr01afWuM3O
UFm6j0j5FBjaenFTkgeFREp8tijq7cpO+Iwx/3IIC6QfkKeLNny9wRBCsM03au66
64C/vbprrz9561M0JrAw3spTyvXkJQLSh4oIBzy1sjhmKFeApSIGf2B4Z+UlFgLz
DsRz5rC0RxLioSaItqFAeHIJoZpDzXglRoxNxGsYUBLTppB6Cy/8VcK/EDpCKfnV
pUjIawZ9V2ubuLWVeK0t9HvO0PXnR0joFuk2vQx3Seo3Dtkjgn5glWd3BjsumM43
QmNImH3N60qyXw1F/LjUpnuk+bOUwQ==
=pPQK
-----END PGP SIGNATURE-----

--72ydsnektuj33hzn--
