Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10257578BAF
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 22:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiGRUWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 16:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiGRUWN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 16:22:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087FE31223
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 13:22:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDXFo-0005Bj-HP; Mon, 18 Jul 2022 22:22:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDXFn-001mUe-K8; Mon, 18 Jul 2022 22:22:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDXFm-00623G-Qw; Mon, 18 Jul 2022 22:22:06 +0200
Date:   Mon, 18 Jul 2022 22:22:05 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: Is a multiplexer using latches a gpio controller?
Message-ID: <20220718202205.ssf3k2dqkuvc6bgm@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uv7c5tth75dupikf"
Content-Disposition: inline
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


--uv7c5tth75dupikf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

we have a customer board here that uses two 8 port latches to drive
LEDs. The setup looks as follows:

CLK0 ----------------------.        ,--------.
CLK1 -------------------.  `--------|>    #0 |
                        |           |        |
IN0 -----------------+--|-----------|D0    Q0|-----|=E2=97=81
IN1 ---------------+-|--|-----------|D1    Q1|-----|=E2=97=81
IN2 -------------+-|-|--|-----------|D2    Q2|-----|=E2=97=81
IN3 -----------+-|-|-|--|-----------|D3    Q3|-----|=E2=97=81
IN4 ---------+-|-|-|-|--|-----------|D4    Q4|-----|=E2=97=81
IN5 -------+-|-|-|-|-|--|-----------|D5    Q5|-----|=E2=97=81
IN6 -----+-|-|-|-|-|-|--|-----------|D6    Q6|-----|=E2=97=81
IN7 ---+-|-|-|-|-|-|-|--|-----------|D7    Q7|-----|=E2=97=81
       | | | | | | | |  |           `--------'
       | | | | | | | |  |
       | | | | | | | |  |           ,--------.
       | | | | | | | |  `-----------|>    #1 |
       | | | | | | | |              |        |
       | | | | | | | `--------------|D0    Q0|-----|=E2=97=81
       | | | | | | `----------------|D1    Q1|-----|=E2=97=81
       | | | | | `------------------|D2    Q2|-----|=E2=97=81
       | | | | `--------------------|D3    Q3|-----|=E2=97=81
       | | | `----------------------|D4    Q4|-----|=E2=97=81
       | | `------------------------|D5    Q5|-----|=E2=97=81
       | `--------------------------|D6    Q6|-----|=E2=97=81
       `----------------------------|D7    Q7|-----|=E2=97=81
                                    `--------'


So to change output 2 of latch #1 you have to apply the changed level on
IN2, apply the previous level on the other inputs (to keep the other
outputs constant) and toggle CLK1 once.

This way you can drive 16 LEDs (or in general outputs) using only 10
GPIOs. (And with a higher number of latches the proportion becomes a bit
more useful.)

Actually this construct is a general GPO (no input :-) controller, and I
wonder if you would accept a driver that models it as a gpio controller.

The dt binding could look as follows:

latch-gpo {
	compatible =3D "latch-gpo";
	pinctrl-0 =3D <...>;
	pinctrl-names =3D <...>;

	clk-gpios =3D /* CLK0 */ <...>, /* CLK1 */ <...>;
	data-gpios =3D /* IN0 */ <...>, /* IN1 */ <...>, ...;
};

What do you think?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uv7c5tth75dupikf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLVwOkACgkQwfwUeK3K
7AmImwgAmg1Ia5zpArkYOMurJrtXAkdVuV5IfZIzHFdnflFqgdJSEz/w9vbmhk9c
DGDXujw7HHxdfPsF9WBH//mwAflak22LhaUePpEFPC/Twa+9n20YzDn96aJLMLKo
CIYoqAywhlh7i3zl1+Zr1t+yHchdgcVaAEIXy35gYeRv6gpU8AgEyNwPPHE/bq9Z
kIqMVfAeWCOnw1irqvWLwkgPLLLInUr1Qwd+/9durn3wyVRj6tgThuECvh5PRWYN
PPN3BBpMidnG2LhkmRzPxSWA65ZQ8K5F85FYfzRXKZX4PqbBAQbqMgC5R6xSW14j
/yxM0AV0dmYGP2xpG0nDk0M62Xovgg==
=wWjt
-----END PGP SIGNATURE-----

--uv7c5tth75dupikf--
