Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA8424069D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 15:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgHJNeA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 09:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgHJNeA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 09:34:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17A7C061756
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 06:33:59 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k57w5-0002ut-S7; Mon, 10 Aug 2020 15:33:57 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k57w4-0006od-PD; Mon, 10 Aug 2020 15:33:56 +0200
Date:   Mon, 10 Aug 2020 15:33:56 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
Message-ID: <20200810133356.wn2fk66pei3w5yua@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de>
 <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
 <871rkkhy7v.fsf@nanos.tec.linutronix.de>
 <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com>
 <87r1sjham2.fsf@nanos.tec.linutronix.de>
 <20200806194608.bdhvltvwxi3opykk@pengutronix.de>
 <87eeojh5vh.fsf@nanos.tec.linutronix.de>
 <20200806210709.5etazgtsfgkdnoui@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3fex52n3xl56lef6"
Content-Disposition: inline
In-Reply-To: <20200806210709.5etazgtsfgkdnoui@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3fex52n3xl56lef6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 11:07:09PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello Thomas,
>=20
> On Thu, Aug 06, 2020 at 10:33:06PM +0200, Thomas Gleixner wrote:
> > Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> > > On Thu, Aug 06, 2020 at 08:50:45PM +0200, Thomas Gleixner wrote:
> > >> handle_nested_irq() does not care. It cares about thread context,
> > >> external reentrancy protection for the same nested interrupt and that
> > >> the nested interrupt has a thread handler.
> > >>=20
> > >> The latter is what goes belly up because w/o that threaded bit set t=
he
> > >> GPIO core fails to set nested thread. So if a consumer requests an
> > >> interrupt with request_any_context_irq() then that fails to select
> > >> thread mode which means the threaded handler is not set causing
> > >> handle_nested_irq() to fail.
> > >
> > > For a caller of request_threaded_irq() that passes a relevant hardirq
> > > handler the hardirq handler is never called but request_threaded_irq()
> > > doesn't fail. The handler is just replaced by irq_nested_primary_hand=
ler
> > > in __setup_irq(). Is that a bug? (I didn't test, just read the code, =
so I
> > > might have missed something.)
> >=20
> > Depends on what the threaded handler expects what the primary handler
> > has done. It might just work or not :)
>=20
> So we need something like:
>=20
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 48c38e09c673..31777a0b79df 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1393,12 +1393,18 @@ __setup_irq(unsigned int irq, struct irq_desc *de=
sc, struct irqaction *new)
>  			ret =3D -EINVAL;
>  			goto out_mput;
>  		}
> -		/*
> -		 * Replace the primary handler which was provided from
> -		 * the driver for non nested interrupt handling by the
> -		 * dummy function which warns when called.
> -		 */
> -		new->handler =3D irq_nested_primary_handler;
> +
> +		if (new->handler =3D=3D NULL) {
> +			/* Scream loud if the primary handler gets called */
> +			new->handler =3D irq_nested_primary_handler;
> +		} else {
> +			/*
> +			 * The handler won't be called as the requestor expects,
> +			 * so refuse to install the handler
> +			 */
> +			ret =3D -EINVAL;
> +			goto out_mput;
> +		}
>  	} else {
>  		if (irq_settings_can_thread(desc)) {
>  			ret =3D irq_setup_forced_threading(new);
>=20

The siox stuff is used at Eckelmann (i.e. probably the only siox user)
via /dev/gpiochip%d. The code providing this device uses
request_threaded_irq(), so that's why we didn't run into the oops. That
the primary handler might not run was noticed already and cared for in
commit 1033be58992f ("gpiolib: fix line event timestamps for nested
irqs").

I grepped around a bit and I think most other drivers depend on their
primary handler being called. (Some primary handlers disable and/or mask
the irq[1], this is wrong, isn't it?)

So I really think request_threaded_irq should not silently rop the
primary handler on the floor.

Best regards
Uwe

[1] I saw:
 - arch/mips/alchemy/devboards/db1200.c
 - drivers/crypto/hisilicon/sec/sec_drv.c
 - drivers/crypto/stm32/stm32-hash.c
 - drivers/dma/idxd/init.c



--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3fex52n3xl56lef6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8xTMEACgkQwfwUeK3K
7AmXrAf6A6Q2k3DoADwkOMt5SOZJoWBkLVOwOALEc/qdFz8dOjYhTP7NMPLgpfIE
uSo8H+NXI6V1sBmbuJS9EcwtAVc77eJ+krQ2+wVGZ2RYtMQgEc9j5RuodsXmxUtZ
WMog0aYDAeKhKK521vl1VzXN4w1OGW3EGJeklPkQD3qFWb67SQmm/oVs49gtn51q
SE9+QwnthqX3W/yMN8k9a8phQbCzISK4BBiz/m7uo+QxIyM1qfFLUqyTt3OSljL2
oe61PKjjsBWodf2DUmJFv+fZQHMgUPs+zV/2hugOYwNKilf7EGjlvfqJvuwSpfHv
g40WVoz4JvERPNl4PMBJuEAEQk1v/g==
=j+b9
-----END PGP SIGNATURE-----

--3fex52n3xl56lef6--
