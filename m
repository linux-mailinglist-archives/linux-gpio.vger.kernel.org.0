Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C91C580441
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 21:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiGYTHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 15:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbiGYTHb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 15:07:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4BBDF47
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 12:07:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oG3QO-0001MM-Hi; Mon, 25 Jul 2022 21:07:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oG3QN-003AVt-Fd; Mon, 25 Jul 2022 21:07:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oG3QM-007Too-LA; Mon, 25 Jul 2022 21:07:26 +0200
Date:   Mon, 25 Jul 2022 21:07:19 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sascha Hauer <kernel@pengutronix.de>
Subject: Re: Is a multiplexer using latches a gpio controller?
Message-ID: <20220725190719.hpahbo4uuqsu3nyf@pengutronix.de>
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
 <CAHp75VeRfguxwjf3y3qWSQCwQF=cOFvt7iP0KVJMnGwdyPvUnA@mail.gmail.com>
 <CAHp75Vdx+2zJ_dNAgXHnRPhMn7csX=P-NPcvHWmMJ1iLZ_WYBg@mail.gmail.com>
 <20220719071931.lcbbwoei6nmd6kx5@pengutronix.de>
 <CAHp75VfLQujQx5pBJ_6rAjkoHD5nd5APqXXjDccNQ1fUiXXh0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dbmxzw5mmzwx5zjt"
Content-Disposition: inline
In-Reply-To: <CAHp75VfLQujQx5pBJ_6rAjkoHD5nd5APqXXjDccNQ1fUiXXh0g@mail.gmail.com>
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


--dbmxzw5mmzwx5zjt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 11:19:54AM +0200, Andy Shevchenko wrote:
> On Tue, Jul 19, 2022 at 9:19 AM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Tue, Jul 19, 2022 at 12:11:56AM +0200, Andy Shevchenko wrote:
> > > On Tue, Jul 19, 2022 at 12:05 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Jul 18, 2022 at 10:27 PM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > > > > we have a customer board here that uses two 8 port latches to dri=
ve
> > > > > LEDs. The setup looks as follows:
> > > > >
> > > > > CLK0 ----------------------.        ,--------.
> > > > > CLK1 -------------------.  `--------|>    #0 |
> > > > >                         |           |        |
> > > > > IN0 -----------------+--|-----------|D0    Q0|-----|=E2=97=81
> > > > > IN1 ---------------+-|--|-----------|D1    Q1|-----|=E2=97=81
> > > > > IN2 -------------+-|-|--|-----------|D2    Q2|-----|=E2=97=81
> > > > > IN3 -----------+-|-|-|--|-----------|D3    Q3|-----|=E2=97=81
> > > > > IN4 ---------+-|-|-|-|--|-----------|D4    Q4|-----|=E2=97=81
> > > > > IN5 -------+-|-|-|-|-|--|-----------|D5    Q5|-----|=E2=97=81
> > > > > IN6 -----+-|-|-|-|-|-|--|-----------|D6    Q6|-----|=E2=97=81
> > > > > IN7 ---+-|-|-|-|-|-|-|--|-----------|D7    Q7|-----|=E2=97=81
> > > > >        | | | | | | | |  |           `--------'
> > > > >        | | | | | | | |  |
> > > > >        | | | | | | | |  |           ,--------.
> > > > >        | | | | | | | |  `-----------|>    #1 |
> > > > >        | | | | | | | |              |        |
> > > > >        | | | | | | | `--------------|D0    Q0|-----|=E2=97=81
> > > > >        | | | | | | `----------------|D1    Q1|-----|=E2=97=81
> > > > >        | | | | | `------------------|D2    Q2|-----|=E2=97=81
> > > > >        | | | | `--------------------|D3    Q3|-----|=E2=97=81
> > > > >        | | | `----------------------|D4    Q4|-----|=E2=97=81
> > > > >        | | `------------------------|D5    Q5|-----|=E2=97=81
> > > > >        | `--------------------------|D6    Q6|-----|=E2=97=81
> > > > >        `----------------------------|D7    Q7|-----|=E2=97=81
> > > > >                                     `--------'
> > > > >
> > > > >
> > > > > So to change output 2 of latch #1 you have to apply the changed l=
evel on
> > > > > IN2, apply the previous level on the other inputs (to keep the ot=
her
> > > > > outputs constant) and toggle CLK1 once.
> > > > >
> > > > > This way you can drive 16 LEDs (or in general outputs) using only=
 10
> > > > > GPIOs. (And with a higher number of latches the proportion become=
s a bit
> > > > > more useful.)
> > > > >
> > > > > Actually this construct is a general GPO (no input :-) controller=
, and I
> > > > > wonder if you would accept a driver that models it as a gpio cont=
roller.
> > > > >
> > > > > The dt binding could look as follows:
> > > > >
> > > > > latch-gpo {
> > > > >         compatible =3D "latch-gpo";
> > > > >         pinctrl-0 =3D <...>;
> > > > >         pinctrl-names =3D <...>;
> > > > >
> > > > >         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
> > > > >         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> > > > > };
> > > > >
> > > > > What do you think?
> > > >
> > > > Bart, what happened to the [1]? Is it abandoned, forgotten?
> > > >
> > > > Uwe, isn't it what you need?
> > >
> > > It needs "downstream" GPIO and ->get_direction(), etc should act acco=
rdingly.
> >
> > No, IIUC this is different. With a multiplexer there can always only be
> > a single line that is controlled (or read) and the other lines are (I
> > assume) high-z.
>=20
> I don't know the Linux mux framework implementation, but from a
> hardware perspective the mux is what you have. In the GPIO (mux)
> driver you need to be able to switch banks as you wish, the rest is
> the drivers' business. If gpio-cascade gives no possibility to do that
> due to broken mux in Linux, then indeed, it can't be accepted at all
> and I have to withdraw my tags from that.

I think you didn't understand what I said (or I didn't understand the
problem you describe).

The thing that is supported by gpio-mux-input is:

	CTRL  ---.  .
	          \/|
	          / |
	          | |---<-- INPUTA
	GPIO --<--| |
	          | |---<-- INPUTB
	          \ |
	           \|
	            '

This is about inputs. CTRL selects which of the inputs on the right is
forwarded to GPIO and the other lines are tristated. Theoretically you
can also drive one of the lines on the right side, but only one and only
while no other line is read.

The hardware construct I have is about outputs and there is no problem
with highz lines, all lines are always driven.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dbmxzw5mmzwx5zjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLe6eMACgkQwfwUeK3K
7AluwAf6At9NAIfwrvMwMdjAFMXlqb2GlnSaShbccMiOvkd2yzYCnuUn/pqEjqRP
h8cOy92uDVzQIkPZdPvBWOu7rILTZax4JeUieZbWACrfgRLmQjd0TxhbVrD5zg9v
ve9IbNaYHNxJI5tNIAAFp8auYZdjXpx8CAL3VUjV8I/Lr1P7Dh/kOqj9wpS1Zyu+
lWqkufo0o1hMLzsuT3yHJdOMjahzbAC0l3wxR9VEOaYEqLPQcyoVAsRsMFpRlmxp
0H36lm2fxRgN1wYBi0ofxBqhhUUXVv7MQf29/0hglaanLQIQGDF/zsUQwVSRk4Ys
7j8WGnjJBmQUx01nk7R7XN9fsc9GvA==
=ApID
-----END PGP SIGNATURE-----

--dbmxzw5mmzwx5zjt--
