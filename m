Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2FE23C5A6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Aug 2020 08:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgHEGR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Aug 2020 02:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgHEGR5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2020 02:17:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D690FC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 23:17:56 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3CkM-0002qN-Kt; Wed, 05 Aug 2020 08:17:54 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3CkL-0004TT-LN; Wed, 05 Aug 2020 08:17:53 +0200
Date:   Wed, 5 Aug 2020 08:17:53 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
Message-ID: <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="scljatgkl7jdtay7"
Content-Disposition: inline
In-Reply-To: <20200804091603.541-1-a.fatoum@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--scljatgkl7jdtay7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[adding tglx for irq expertise to Cc]

On Tue, Aug 04, 2020 at 11:16:03AM +0200, Ahmad Fatoum wrote:
> Generic GPIO consumers like gpio-keys use request_any_context_irq()
> to request a threaded handler if irq_settings_is_nested_thread() =3D=3D
> true or a hardirq handler otherwise.
>=20
> Drivers using handle_nested_irq() must be sure that the nested
> IRQs were requested with threaded handlers, because the IRQ
> is handled by calling action->thread_fn().
>=20
> The gpio-siox driver dispatches IRQs via handle_nested_irq,
> but has irq_settings_is_nested_thread() =3D=3D false.
>=20
> Set gpio_irq_chip::threaded to remedy this.

Sounds reasonable, but I have to keep this for others to judge if this
is indeed how the irq stuff works.

> ---
> I am writing a driver similar to gpio-siox and I ran into a null pointer
> dereference, because ->threaded wasn't set. I didn't test this on actual
> SIOX hardware.
>=20
> This patch doesn't fix the case were are driver explicitly calls
> request_irq and is combined with a driver that does handle_nested_irq.
>=20
> Is there a flag, such drivers should additionally set or should we
> check action->thread_fn before calling it inside handle_nested_irq?

If gpio_irq_chip::threaded being set means that this problem happens
IMHO the driver is fine and something in the generic gpio code should do
the right thing here.

Best regards and thanks for caring,
Uwe

> ---
>  drivers/gpio/gpio-siox.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
> index 26e1fe092304..f8c5e9fc4bac 100644
> --- a/drivers/gpio/gpio-siox.c
> +++ b/drivers/gpio/gpio-siox.c
> @@ -245,6 +245,7 @@ static int gpio_siox_probe(struct siox_device *sdevic=
e)
>  	girq->chip =3D &ddata->ichip;
>  	girq->default_type =3D IRQ_TYPE_NONE;
>  	girq->handler =3D handle_level_irq;
> +	girq->threaded =3D true;
> =20
>  	ret =3D devm_gpiochip_add_data(dev, &ddata->gchip, NULL);
>  	if (ret)
> --=20
> 2.28.0
>=20
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--scljatgkl7jdtay7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8qTw4ACgkQwfwUeK3K
7AlrUAf+IghLO1gMP9U0E33gkqS45ybfOZWgLa1og560LyTFT3AZWWsjHwCeDp9x
X3hGtJ3ExmfLLb6K9Y5q91RGhR3yy9rAXqHZeyqv9F4MWCnzDv1riYawIpcbzdv3
dJ8t0KpPb49Cmto7HmVqYN+61fczDaVrjo3z1j+mH/4keQfubjGI/kFN3+ujzdU1
tLdSaMOO+/B+V8IGCB5ssf1vX67ZqBmVc0z8cPTM5Kj/nm7hzaP0wMqUkubTSpe+
HL++JO/VAwj1IoxwYnmzHi+9uCKx1RTHYBX+uSieajscYNHPPdTIM/mFVHazg9BO
e6i20gEDBdFnAC1hnsWTIHV4sOJC/g==
=4D8H
-----END PGP SIGNATURE-----

--scljatgkl7jdtay7--
