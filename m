Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6D119586D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 14:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbgC0N6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 09:58:23 -0400
Received: from foss.arm.com ([217.140.110.172]:44928 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727125AbgC0N6X (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 09:58:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1FC21FB;
        Fri, 27 Mar 2020 06:58:22 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 359033F71F;
        Fri, 27 Mar 2020 06:58:22 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:58:20 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-gpio@vger.kernel.org
Subject: Re: register access issues in pca953x gpio driver
Message-ID: <20200327135820.GE4437@sirena.org.uk>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
 <20200327130321.GA4437@sirena.org.uk>
 <20200327134657.5yes5wh6c4u3nu54@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline
In-Reply-To: <20200327134657.5yes5wh6c4u3nu54@pengutronix.de>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 02:46:57PM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Mar 27, 2020 at 01:03:21PM +0000, Mark Brown wrote:

> > If you want to dynamically change if the register is autoincrementing
> > you're going to have to add stuff to regmap for that, it understands
> > devices that autoincrement and devices that don't autoincrement but
> > there's currently nothing for transitioning between the two.

> I'm not entirely sure, but I think they all support autoincrementing but
> some need the flag set and others don't. I imagine that this should be
> modeled as register range [0-0x7f] (as AI =3D 0x80) and the accessor
> callbacks have to set AI or not depending on the chip.

So it's not that you're varying this at runtime but rather that you have
different chips?  In that case you can use read_flag_mask and
write_flag_mask to set the autoincrement flag, and use_single_write for
things that lack autoincrement.

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5+BnsACgkQJNaLcl1U
h9CClgf7BYPJ4Y71Nj8fBUSRQBNDbAc8Ccotd+9AKBx4OJrO56V84PrifEZZNqSG
jgEZ0FCQMI5oMw7agfD7hzXmjMsoWOPVMeO5CLcESDLN6gJTib++dhS1sAHyqAuT
PnA8zBmr+taApXq03nCinFTkcoVYZ53PaKzr3zIvXMvIlmKMusrIOLXTb8hcu6o0
jXMvBLFlyw5N+MZEqBrsZ6XybeZHYBRZoRb4fWCByfRJU8dBNp4cVHpVD+wthMQK
ML7yUlKiqIqNx6hmaoKTGR9ULIr/nLVj0XgQzo7FoW3bHwXaCpilJPgOEoAmAmxc
iQtFGhUs/+E+5Aux+3GJDJHEjvDeVw==
=SLa6
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
