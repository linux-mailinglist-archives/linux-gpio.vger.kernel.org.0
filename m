Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC6A5793FC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 09:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbiGSHTl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 03:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235808AbiGSHTk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 03:19:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9941A30564
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 00:19:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDhW5-0005qE-QX; Tue, 19 Jul 2022 09:19:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDhW4-001s0d-Gh; Tue, 19 Jul 2022 09:19:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDhW3-0067p2-Jb; Tue, 19 Jul 2022 09:19:35 +0200
Date:   Tue, 19 Jul 2022 09:19:31 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: Is a multiplexer using latches a gpio controller?
Message-ID: <20220719071931.lcbbwoei6nmd6kx5@pengutronix.de>
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
 <CAHp75VeRfguxwjf3y3qWSQCwQF=cOFvt7iP0KVJMnGwdyPvUnA@mail.gmail.com>
 <CAHp75Vdx+2zJ_dNAgXHnRPhMn7csX=P-NPcvHWmMJ1iLZ_WYBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wifb3h2noeqsijbd"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdx+2zJ_dNAgXHnRPhMn7csX=P-NPcvHWmMJ1iLZ_WYBg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--wifb3h2noeqsijbd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 12:11:56AM +0200, Andy Shevchenko wrote:
> On Tue, Jul 19, 2022 at 12:05 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Jul 18, 2022 at 10:27 PM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > we have a customer board here that uses two 8 port latches to drive
> > > LEDs. The setup looks as follows:
> > >
> > > CLK0 ----------------------.        ,--------.
> > > CLK1 -------------------.  `--------|>    #0 |
> > >                         |           |        |
> > > IN0 -----------------+--|-----------|D0    Q0|-----|=E2=97=81
> > > IN1 ---------------+-|--|-----------|D1    Q1|-----|=E2=97=81
> > > IN2 -------------+-|-|--|-----------|D2    Q2|-----|=E2=97=81
> > > IN3 -----------+-|-|-|--|-----------|D3    Q3|-----|=E2=97=81
> > > IN4 ---------+-|-|-|-|--|-----------|D4    Q4|-----|=E2=97=81
> > > IN5 -------+-|-|-|-|-|--|-----------|D5    Q5|-----|=E2=97=81
> > > IN6 -----+-|-|-|-|-|-|--|-----------|D6    Q6|-----|=E2=97=81
> > > IN7 ---+-|-|-|-|-|-|-|--|-----------|D7    Q7|-----|=E2=97=81
> > >        | | | | | | | |  |           `--------'
> > >        | | | | | | | |  |
> > >        | | | | | | | |  |           ,--------.
> > >        | | | | | | | |  `-----------|>    #1 |
> > >        | | | | | | | |              |        |
> > >        | | | | | | | `--------------|D0    Q0|-----|=E2=97=81
> > >        | | | | | | `----------------|D1    Q1|-----|=E2=97=81
> > >        | | | | | `------------------|D2    Q2|-----|=E2=97=81
> > >        | | | | `--------------------|D3    Q3|-----|=E2=97=81
> > >        | | | `----------------------|D4    Q4|-----|=E2=97=81
> > >        | | `------------------------|D5    Q5|-----|=E2=97=81
> > >        | `--------------------------|D6    Q6|-----|=E2=97=81
> > >        `----------------------------|D7    Q7|-----|=E2=97=81
> > >                                     `--------'
> > >
> > >
> > > So to change output 2 of latch #1 you have to apply the changed level=
 on
> > > IN2, apply the previous level on the other inputs (to keep the other
> > > outputs constant) and toggle CLK1 once.
> > >
> > > This way you can drive 16 LEDs (or in general outputs) using only 10
> > > GPIOs. (And with a higher number of latches the proportion becomes a =
bit
> > > more useful.)
> > >
> > > Actually this construct is a general GPO (no input :-) controller, an=
d I
> > > wonder if you would accept a driver that models it as a gpio controll=
er.
> > >
> > > The dt binding could look as follows:
> > >
> > > latch-gpo {
> > >         compatible =3D "latch-gpo";
> > >         pinctrl-0 =3D <...>;
> > >         pinctrl-names =3D <...>;
> > >
> > >         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
> > >         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> > > };
> > >
> > > What do you think?
> >
> > Bart, what happened to the [1]? Is it abandoned, forgotten?
> >
> > Uwe, isn't it what you need?
>=20
> It needs "downstream" GPIO and ->get_direction(), etc should act accordin=
gly.

No, IIUC this is different. With a multiplexer there can always only be
a single line that is controlled (or read) and the other lines are (I
assume) high-z.

The latch approach above is about 16 outputs and at all times the state
off all 16 lines is fixed because the latches keep their state when the
clk line is kept stable.

Best regards
Uwe

> > [1]: https://lore.kernel.org/linux-gpio/20220205215918.8924-1-maukka@ex=
t.kapsi.fi/

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wifb3h2noeqsijbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLWWwEACgkQwfwUeK3K
7AkZ3QgAgnYtrl6iANT2kF3te5qFU66xc0nkBNL1ggEU07PJgTsbbds3D9gn+d5a
eya9o75nO5iWp/EJS1C0e6uMP6Bmzm2hy9gxYdunWKlr3+oGVPINOQDeM1H6H/yP
m1QyGR774f8bo+K6/DdyO7S28oNN1RlKSe6mzc0UYMaUiZxDmyB4ZkXAjcvxSBPa
yHXX/7an+sxl7YJKbh8un3KRjj7Bynbd7K/8tuEGyBvpFL/tFqZ28gk8ti4lX7Ep
cwN9oypE5ubX74sGZX18UlrzRbTOu/cjoZV20Rpj9HSoa9NJ1zbpRyyjg7nrScVX
RWjwVq1fZkBRn/+JG9YaNf9psnyKXg==
=TJj9
-----END PGP SIGNATURE-----

--wifb3h2noeqsijbd--
