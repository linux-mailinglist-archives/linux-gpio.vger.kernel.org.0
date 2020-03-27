Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 095201957AF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 14:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgC0NDY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 09:03:24 -0400
Received: from foss.arm.com ([217.140.110.172]:44406 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgC0NDY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 09:03:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD261FB;
        Fri, 27 Mar 2020 06:03:23 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52AD13F71F;
        Fri, 27 Mar 2020 06:03:23 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:03:21 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-gpio@vger.kernel.org
Subject: Re: register access issues in pca953x gpio driver
Message-ID: <20200327130321.GA4437@sirena.org.uk>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 08:49:22AM +0100, Uwe Kleine-K=F6nig wrote:

> @broonie: I don't know regmap good enough to instantly know the right
> magic to do this. Can you give a rough overview what would be needed?

If you want to dynamically change if the register is autoincrementing
you're going to have to add stuff to regmap for that, it understands
devices that autoincrement and devices that don't autoincrement but
there's currently nothing for transitioning between the two.

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl59+ZYACgkQJNaLcl1U
h9DPDwf/U7FGjCVpuBFG9+OmU7w304tObkWN8NNUZ3e1m/o8yC0l2kySyEdUGLxQ
m/+oFRAamjXAPwb7pGyswc4NLHHxN5VEbXcmJlzj/4/GaLKsn+Piot/d51JCgw9k
Ub744Z/ChCOF6g7QxpL0wt/ciSWmSqxzsV+ja7NeIdTH87KzFss8lsWqsoGFc7Nv
GKE77O80LUlVBii3yVGl9tlPkwfapMDTqxkIFeNHfofbF8i/YjdXfCmywXnYxSS0
RucKl2ljIYI8xcAZ+oJQkQdZTe824FFHGg7lUtRna+kGXvi20orfHngejCJ6HUpI
8HZMBUjQc49d0UJcHU8PiMOKBCH1cA==
=B4ZD
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
