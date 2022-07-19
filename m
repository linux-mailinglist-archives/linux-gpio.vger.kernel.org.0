Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65B23579488
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 09:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiGSHtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 03:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236971AbiGSHtY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 03:49:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B52523BEA
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 00:49:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDhys-0001pc-CT; Tue, 19 Jul 2022 09:49:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDhyr-001s4j-LM; Tue, 19 Jul 2022 09:49:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDhyq-0067un-UC; Tue, 19 Jul 2022 09:49:20 +0200
Date:   Tue, 19 Jul 2022 09:49:19 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel@pengutronix.de
Subject: Re: Is a multiplexer using latches a gpio controller?
Message-ID: <20220719074919.uawwqoefcgi4rjvt@pengutronix.de>
References: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
 <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dzsvlc56kvz37hvb"
Content-Disposition: inline
In-Reply-To: <CACRpkdaBO=JzokGUF6uXZc7ASVD7LjqBxTLGwX-FShM=A9gw9A@mail.gmail.com>
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


--dzsvlc56kvz37hvb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2022 at 12:54:18AM +0200, Linus Walleij wrote:
> On Mon, Jul 18, 2022 at 10:22 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
>=20
> > we have a customer board here that uses two 8 port latches to drive
> > LEDs. The setup looks as follows:
>=20
> Very nice drawing!
>=20
> > So to change output 2 of latch #1 you have to apply the changed level on
> > IN2, apply the previous level on the other inputs (to keep the other
> > outputs constant) and toggle CLK1 once.
> >
> > This way you can drive 16 LEDs (or in general outputs) using only 10
> > GPIOs. (And with a higher number of latches the proportion becomes a bit
> > more useful.)
> >
> > Actually this construct is a general GPO (no input :-) controller, and I
> > wonder if you would accept a driver that models it as a gpio controller.
>=20
> In my opinion, yes.

ok, fine.

> > The dt binding could look as follows:
> >
> > latch-gpo {
> >         compatible =3D "latch-gpo";
> >         pinctrl-0 =3D <...>;
> >         pinctrl-names =3D <...>;
> >
> >         clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
> >         data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
> > };
> >
> > What do you think?
>=20
> I would use the actual 74xx numbers for the TTL circuits in the compatibl=
e.

To be actually useful I need at least two latches. In my case their
name is SN74LS273. (https://www.ti.com/lit/ds/symlink/sn74ls273.pdf)
So I hesitate to call this "ti,sn74ls273" because that would suggest a
single such chip?!

> I have actually merged this placeholder (without bindings nor driver):
>=20
>         /*
>          * 74HC4094 which is used as a rudimentary GPIO expander
>          * FIXME:
>          * - Create device tree bindings for this as GPIO expander
>          * - Write a pure DT GPIO driver using these bindings
>          * - Support cascading in the style of gpio-74x164.c (cannot
> be reused, very different)
>          */
>         gpio_74: gpio-74hc4094 {
>                 compatible =3D "nxp,74hc4094";
>                 cp-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>;
>                 d-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
>                 str-gpios =3D <&gpio0 2 GPIO_ACTIVE_HIGH>;
>                 /* oe-gpios is optional */
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 /* We are not cascaded */
>                 registers-number =3D <1>;
>                 gpio-line-names =3D "CONTROL_HSS0_CLK_INT",
> "CONTROL_HSS1_CLK_INT", "CONTROL_HSS0_DTR_N",
>                                 "CONTROL_HSS1_DTR_N", "CONTROL_EXT",
> "CONTROL_AUTO_RESET",
>                                 "CONTROL_PCI_RESET_N", "CONTROL_EEPROM_WC=
_N";
>         };

This is different (as Andy pointed out): With this chip you have to
clock in the $n values serially while with my approach you have a
parallel input.

I think for the serial approach you don't even need to consider a
register-number. IIUC a cascade just behaves like a single chip with
more stages, right? Then I'd not specify a "registers-number" but a
number of stages. And then that's just (as Andy pointed out) a spi
device. I would represent that as follows:

=09
	spi {
		compatible =3D "spi-gpio";
		#address-cells =3D <0x1>;
		#size-cells =3D <0x0>;

		sck-gpios =3D <&gpio0 0 GPIO_ACTIVE_HIGH>;
		//miso-gpios =3D ??
		mosi-gpios =3D <&gpio0 1 GPIO_ACTIVE_HIGH>;
		cs-gpios =3D <&gpio0 2 GPIO_ACTIVE_HIGH>;
		num-chipselects =3D <1>;

		gpio-74hc4094 {
			compatible =3D "nxp,74hc4094";
			reg =3D <0>;

			oe-gpios =3D <...>; /* optional */
			num-stages =3D <8>; /* =3D default value */

			gpio-controller;
			#gpio-cells =3D <2>;

			gpio-line-names =3D ...;
		};
	}

(And if you have a "native" spi bus, even better.) This way the
nxp,74hc4094 driver becomes way easier.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dzsvlc56kvz37hvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLWYfwACgkQwfwUeK3K
7AkJ+Qf8CxDiQXEZqpppQeZ3i5B2VM3eZlKnhqHK2Q/Olt0WsNj1WSL1WycywlZ3
itPyy+kgzPITcr/+x1enDcjrDo2LO1LG32qPOp3mmAFsumJLOf0WhyWMs791t4az
LF41F+hpsWdC51ZDh7koQr3nqO010JEa00VR3UxSE3iER6PyNLH3hFDolBW0e55r
PQV/nD8BkojCKV4VIS44LH1/PEN5PGXgRyfALeTTnyHUddRPuoaY5kKwsLeRmy4V
OneBtoGLmm1kPuWSb08jgIG5ou87zH7X3ZXwYo60pwUi+30ykQYshIoY7LHKscLg
iwjqNPqw9PPIsSbGXEowg750KJBNLg==
=s+4W
-----END PGP SIGNATURE-----

--dzsvlc56kvz37hvb--
