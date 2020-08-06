Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8672223E27A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 21:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgHFTqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 15:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgHFTqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 15:46:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04578C061574
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 12:46:17 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3lq6-000375-2O; Thu, 06 Aug 2020 21:46:10 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3lq4-0001VV-Sw; Thu, 06 Aug 2020 21:46:08 +0200
Date:   Thu, 6 Aug 2020 21:46:08 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
Message-ID: <20200806194608.bdhvltvwxi3opykk@pengutronix.de>
References: <20200804091603.541-1-a.fatoum@pengutronix.de>
 <20200805061753.5o63zu4ionhgjab4@pengutronix.de>
 <871rkkhy7v.fsf@nanos.tec.linutronix.de>
 <CACRpkdaOysS1-Y=3ghQ+1qbMTR8yi3bHg=_+gUOPo_EcmGmJiw@mail.gmail.com>
 <87r1sjham2.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xih6xlvfk6735ntg"
Content-Disposition: inline
In-Reply-To: <87r1sjham2.fsf@nanos.tec.linutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--xih6xlvfk6735ntg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 08:50:45PM +0200, Thomas Gleixner wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
> > On Thu, Aug 6, 2020 at 12:20 PM Thomas Gleixner <tglx@linutronix.de> wr=
ote:
> >
> >> So the solution for this driver is either to make the dispatch handler
> >> threaded or use the hard interrupt variant of dispatching the
> >> demultiplexed GPIO interrupts.
> >
> > The struct gpio_irq_chip .threaded bool that the patch
> > sets just instructs the gpio core to issue
> > irq_set_nested_thread(irq, 1) on the child IRQ.
> >
> > This is a driver of type "struct siox_driver" handling the
> > IRQ through the special .get_data callback supplied in the
> > driver struct and it calls handle_nested_irq(irq) so with
> > this fix it percolated up to the parent as intended.
> >
> > So far so good. So I think the patch should be applied.
> >
> > But what is behind this .get_data() callback for siox drivers?
> >
> > The siox driver framework in drivers/siox dispatches calls
> > to .get_data() from a polling thread which is just some ordinary
> > kthread. It looks like this because the SIOX (I think) needs
> > to do polled I/O. (drivers/siox/siox-core.c)
> >
> > So this is a thread but it is not an irq thread from the irq core,
> > however it is treated like such by the driver, and in a way what
> > happens is events, just polled by a thread.
>=20
> As Uwe just explained.
>=20
> > So when we call handle_nested_irq() ... we are not really
> > calling that from an irq handler.
> >
> > I don't know if the IRQ core even sees a difference between which
> > thread it gets interfaced with. I suppose it does? :/
>=20
> handle_nested_irq() does not care. It cares about thread context,
> external reentrancy protection for the same nested interrupt and that
> the nested interrupt has a thread handler.
>=20
> The latter is what goes belly up because w/o that threaded bit set the
> GPIO core fails to set nested thread. So if a consumer requests an
> interrupt with request_any_context_irq() then that fails to select
> thread mode which means the threaded handler is not set causing
> handle_nested_irq() to fail.

For a caller of request_threaded_irq() that passes a relevant hardirq
handler the hardirq handler is never called but request_threaded_irq()
doesn't fail. The handler is just replaced by irq_nested_primary_handler
in __setup_irq(). Is that a bug? (I didn't test, just read the code, so I
might have missed something.)=20

> The polling kthread is a slight but clever abomination, but it just
> works because it provides thread context and cannot run concurrently.

I think this is the first time you called any of my code "clever" :-)
=20
> So Ahmad's patch is correct, just the changelog needs polishing.

Trying to be constructive, here is my suggested changelog:

	gpio: siox: explicitly only support threaded irqs

	The gpio-siox driver uses handle_nested_irq() to implement its
	interrupt support. This is only capable to handle threaded irq
	actions. For a hardirq action it triggers a NULL pointer oops.
	(It calls action->thread_fn which is NULL then.)

	So prevent registration of a hardirq action by setting
	gpio_irq_chip::threaded to true.

Does this address all your concerns?

Is this bad enough to justify sending this patch to stable?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xih6xlvfk6735ntg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8sXf0ACgkQwfwUeK3K
7Amo+Qf/fN1GTEHIWSrxr1nuexynLh4/SQzZ81hIo6o++q26qVXZYYZzIPQWCVm6
oIhC+IcUiLAhOv7CixDAmaVQkZ+5ADwA/UhXCiyDAqXANkszJ5eFdsLWaoMcOIs0
FKqfkchLvBVdvjQ1eyV/y9XQz8GJ4SOaeRmQjVox5RnNLjazeFUEoMqZhyATCCcJ
PaJsghlW/0nh4bogXuJ6By4ZqQE+LFwe2eQPHqXQwn3eT7mnKHePhTveRDm1t055
iKw1S5llmYQEM/qXbrVMc76i8airR7UfIRJ3Ftt3mkBHZjJuEuAwgbRnWob8yUVq
litTTD9aHYqMQtAhkN1xgCfF/8Tsng==
=MQsG
-----END PGP SIGNATURE-----

--xih6xlvfk6735ntg--
