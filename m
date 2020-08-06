Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D9123E364
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 23:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgHFVHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 17:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgHFVHO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 17:07:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEE7C061574
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 14:07:14 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3n6U-00023A-Em; Thu, 06 Aug 2020 23:07:10 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3n6T-0004ZV-BT; Thu, 06 Aug 2020 23:07:09 +0200
Date:   Thu, 6 Aug 2020 23:07:09 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
Message-ID: <20200806210709.5etazgtsfgkdnoui@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de>
 <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
 <871rkkhy7v.fsf@nanos.tec.linutronix.de>
 <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com>
 <87r1sjham2.fsf@nanos.tec.linutronix.de>
 <20200806194608.bdhvltvwxi3opykk@pengutronix.de>
 <87eeojh5vh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="75n4mrucr4xkreqh"
Content-Disposition: inline
In-Reply-To: <87eeojh5vh.fsf@nanos.tec.linutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--75n4mrucr4xkreqh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Thu, Aug 06, 2020 at 10:33:06PM +0200, Thomas Gleixner wrote:
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> > On Thu, Aug 06, 2020 at 08:50:45PM +0200, Thomas Gleixner wrote:
> >> handle_nested_irq() does not care. It cares about thread context,
> >> external reentrancy protection for the same nested interrupt and that
> >> the nested interrupt has a thread handler.
> >>=20
> >> The latter is what goes belly up because w/o that threaded bit set the
> >> GPIO core fails to set nested thread. So if a consumer requests an
> >> interrupt with request_any_context_irq() then that fails to select
> >> thread mode which means the threaded handler is not set causing
> >> handle_nested_irq() to fail.
> >
> > For a caller of request_threaded_irq() that passes a relevant hardirq
> > handler the hardirq handler is never called but request_threaded_irq()
> > doesn't fail. The handler is just replaced by irq_nested_primary_handler
> > in __setup_irq(). Is that a bug? (I didn't test, just read the code, so=
 I
> > might have missed something.)
>=20
> Depends on what the threaded handler expects what the primary handler
> has done. It might just work or not :)

So we need something like:

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 48c38e09c673..31777a0b79df 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1393,12 +1393,18 @@ __setup_irq(unsigned int irq, struct irq_desc *desc=
, struct irqaction *new)
 			ret =3D -EINVAL;
 			goto out_mput;
 		}
-		/*
-		 * Replace the primary handler which was provided from
-		 * the driver for non nested interrupt handling by the
-		 * dummy function which warns when called.
-		 */
-		new->handler =3D irq_nested_primary_handler;
+
+		if (new->handler =3D=3D NULL) {
+			/* Scream loud if the primary handler gets called */
+			new->handler =3D irq_nested_primary_handler;
+		} else {
+			/*
+			 * The handler won't be called as the requestor expects,
+			 * so refuse to install the handler
+			 */
+			ret =3D -EINVAL;
+			goto out_mput;
+		}
 	} else {
 		if (irq_settings_can_thread(desc)) {
 			ret =3D irq_setup_forced_threading(new);

? Do we need to care for other allowed values of new->handler? Maybe
irq_default_primary_handler?

> > Is this bad enough to justify sending this patch to stable?
>=20
> Yes, a Cc: stable and a Fixes: tag is justified.

That would be

Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--75n4mrucr4xkreqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8scPoACgkQwfwUeK3K
7AnQjwf+NVenm0tilv5dLcz2EM4fNz/Drg4QN3+GejSqC91vKU3VrTjbNcb0YxR8
qHMTARruuR0CTOAo4L21onsw+9svN8b4ykl+yeqQ2NAa0mWMv7FQvJzUl0HscMwv
imS7eusbaIVSPCDKI4B736GpMlARYzNvvwDT+i7MlqLrRlqvFN/sTvy7o5lvNDZG
Zo2Hn6DKHwo+xBEm08Lad05BMf5s/1/oAwlNfPg2SMR8sxQ3ptrCDm+BqDuib6jy
UCXH5/rWqI3V0fRPMc3VOvvyYvi/XwAICQ/Jd0e/BkKj0odeGxqNLgMC+IRwTwk6
O+UsW9NscENYju1C7cbu2EBeBf5FcQ==
=qFCN
-----END PGP SIGNATURE-----

--75n4mrucr4xkreqh--
