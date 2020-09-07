Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C98F25FE6C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 18:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbgIGQQO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 12:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbgIGQPh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 12:15:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA84C061573
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 09:15:35 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kFJno-0001sv-G5; Mon, 07 Sep 2020 18:15:32 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kFJnn-0002et-PM; Mon, 07 Sep 2020 18:15:31 +0200
Date:   Mon, 7 Sep 2020 18:15:31 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: siox: explicitly support only threaded irqs
Message-ID: <20200907161531.x7wdxmb5e3qdbtn7@pengutronix.de>
References: <20200907153135.3307-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cgjxmmqsfjfxvawn"
Content-Disposition: inline
In-Reply-To: <20200907153135.3307-1-a.fatoum@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cgjxmmqsfjfxvawn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ahmad,

On Mon, Sep 07, 2020 at 05:31:35PM +0200, Ahmad Fatoum wrote:
> The gpio-siox driver uses handle_nested_irq() to implement its
> interrupt support. This is only capable of handling threaded irq
> actions. For a hardirq action it triggers a NULL pointer oops.
> (It calls action->thread_fn which is NULL then.)
>=20
> Prevent registration of a hardirq action by setting
> gpio_irq_chip::threaded to true.

cool commit log :-)

> Cc: u.kleine-koenig@pengutronix.de
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks for picking this up.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cgjxmmqsfjfxvawn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl9WXKAACgkQwfwUeK3K
7Alg0Qf/VlxWkLp9Bpt+uYNTELqmDL/zHOIn4GQTGgJrM34u8CTDAlLetTFtr9OW
edbUtd2vWanorXEl3qdPxqi31FmgbQljDmwOu15VQuEsSzb8mNMkSRP2BOuiCRas
B10LsGriMod8/49H2A5UVhSs/cNVT0JiLgPxQIssWYulH07agqHlSNCeMmgf7GTA
6JJHYUl/Mld/qnKABxDUIYTTv70U9tXO2KsSkOFs4IF9AZIroQayBiDyDDvxJrPB
gt0SpzcHMFE7to6edyGIbdxU+ag22FzL/XJnDM2EALjr6c7vAX6n9ui1HpZ7BNsI
WEA54N3FLA5A1MYwDqwnhKwVVMhGUA==
=J3Py
-----END PGP SIGNATURE-----

--cgjxmmqsfjfxvawn--
