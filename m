Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E7E23DF7C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 19:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbgHFRsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 13:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbgHFQf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 12:35:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC94C0A893A
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 08:07:16 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3hU1-0007Dk-6y; Thu, 06 Aug 2020 17:07:05 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3hU0-0000Qq-1B; Thu, 06 Aug 2020 17:07:04 +0200
Date:   Thu, 6 Aug 2020 17:07:03 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
Message-ID: <20200806150703.sdg6cfh7pxqzf4wl@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de>
 <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
 <871rkkhy7v.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lzux2txe2ee3mov4"
Content-Disposition: inline
In-Reply-To: <871rkkhy7v.fsf@nanos.tec.linutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--lzux2txe2ee3mov4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 12:20:52PM +0200, Thomas Gleixner wrote:
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
> > On Tue, Aug 04, 2020 at 11:16:03AM +0200, Ahmad Fatoum wrote:
> >> Generic GPIO consumers like gpio-keys use request_any_context_irq()
> >> to request a threaded handler if irq_settings_is_nested_thread() =3D=3D
> >> true or a hardirq handler otherwise.
> >>=20
> >> Drivers using handle_nested_irq() must be sure that the nested
> >> IRQs were requested with threaded handlers, because the IRQ
> >> is handled by calling action->thread_fn().
> >>=20
> >> The gpio-siox driver dispatches IRQs via handle_nested_irq,
> >> but has irq_settings_is_nested_thread() =3D=3D false.
> >>=20
> >> Set gpio_irq_chip::threaded to remedy this.
> >
> > Sounds reasonable, but I have to keep this for others to judge if this
> > is indeed how the irq stuff works.
>=20
> handle_nested_irq() documentation clearly says: "Handle a nested irq
> from a irq thread". As a consequence the caller of this function must
> run in an interrupt thread. This is an optimization to spare tons of
> interrupt threads and context switches.
>=20
> So the solution for this driver is either to make the dispatch handler
> threaded or use the hard interrupt variant of dispatching the
> demultiplexed GPIO interrupts.

The action item isn't entirely clear for me. There is no "parent" irq, I
have for siox a kthread that does some IO and looks that the resulting
data which effectively reports the current state of the GPIO line. And
if this GPIO is configured to trigger an irq and the matching transition
(or state) is seen, I want to trigger the irq action. So the caller has
neither hard nor threaded irq context.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lzux2txe2ee3mov4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8sHJQACgkQwfwUeK3K
7AkI/wf9GZzob+b46rdJPCPCVEzRsIex8OnlFy3GV0KS3r3AClT0vH2LvDDVJZnE
+3yqHMZnClgGPlzgm8wGK1IF0TLH5gmeX45gYbMtgagRTB//0M2F+hO61x82jfV3
CyelBa52f0dft48p8wCXvya+g7+9iY/zgHKLcJnynU3HSgufTWxkzqzrOD/H7/Rq
GCWpVxxQW2Oa2U0kX3BpJ/3T5G5CXz0JIEc7jE3lVzhSuWlL7mzePYyvFq02g/dD
jU0h2Aor2T0ntvRw6hr0w65y+inmM4T2CTB8Ktch8oyo9ErRjjGPwVxG8Rm63bP0
SDX6JMRwQZKjUPwuSwxRSVmIhEyoOQ==
=krGx
-----END PGP SIGNATURE-----

--lzux2txe2ee3mov4--
