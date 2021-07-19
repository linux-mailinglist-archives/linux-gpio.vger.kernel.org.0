Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267723CD6A7
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 16:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240680AbhGSN4Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 09:56:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231618AbhGSN4Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Jul 2021 09:56:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 431D3610F7;
        Mon, 19 Jul 2021 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626705416;
        bh=mhN+6XFHGuuvmrVr2yFFaQSZ906VYeQjF1XqdvS2+RA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WjjLIdW9lZ877buxXIbsbOKoNmokA5xO+oy/fQYIBju9wMX8xVFbCitcm3saC5VUR
         xvrzLFfRLGjdzAmHbL7ImjA+UuNymqdm3PztZtL7yQEIL+3mQiLitDYJkn4XamH6kJ
         j22SRvsXm0DzCNTgFQvHgdW1RBMWRf/gme6l00CYVolvOldusjLSNhvmptOuO16GgJ
         CurhQ2Qau01CihsadccGiXDZMWrluVTmF7sdnWfIl8WIlcaTwVLo4tRLyLPLtzY6Ea
         EU46t04MQCIbT8m2vsehXv766QiaWJ1nNIz8vmxjWWPM30hwlgbhQ2AjI9iz5sdPHF
         h/dgLdS9Uz+gg==
Received: by earth.universe (Postfix, from userid 1000)
        id 3ED123C0C98; Mon, 19 Jul 2021 16:36:54 +0200 (CEST)
Date:   Mon, 19 Jul 2021 16:36:54 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
        Dirk Opfer <dirk@opfer-online.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM/pxa/mfd/power/sound: Switch Tosa to GPIO descriptors
Message-ID: <20210719143654.xnefdgihckvd6ipo@earth.universe>
References: <20210715151625.394960-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="knurw6njbqijvhwr"
Content-Disposition: inline
In-Reply-To: <20210715151625.394960-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--knurw6njbqijvhwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 15, 2021 at 05:16:25PM +0200, Linus Walleij wrote:
> The Tosa device (Sharp SL-6000) has a mishmash driver set-up
> for the Toshiba TC6393xb MFD that includes a battery charger
> and touchscreen and has some kind of relationship to the SoC
> sound driver for the AC97 codec. Other devices define a chip
> like this but seem only half-implemented, not really handling
> battery charging etc.
>=20
> This patch switches the Toshiba MFD device to provide GPIO
> descriptors to the battery charger and SoC codec. As a result
> some descriptors need to be moved out of the Tosa boardfile
> and new one added: all SoC GPIO resources to these drivers
> now comes from the main boardfile, while the MFD provide
> GPIOs for its portions.
>=20
> As a result we can request one GPIO from our own GPIO chip
> and drop two hairy callbacks into the board file.
>=20
> This platform badly needs to have its drivers split up and
> converted to device tree probing to handle this quite complex
> relationship in an orderly manner. I just do my best in solving
> the GPIO descriptor part of the puzzle. Please don't ask me
> to fix everything that is wrong with these driver to todays
> standards, I am just trying to fix one aspect. I do try to
> use modern devres resource management and handle deferred
> probe using new functions where appropriate.

Yeah, the wm97xx-battery situation is a huge mess with
two different drivers for the same hardware on different
platforms :(

> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Cc: Dirk Opfer <dirk@opfer-online.de>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Dmitry/Dirk: it'd be great if you could test this patch on
> the Tosa and try to help me iron out any bugs.
>=20
> Merging strategy: please provide ACKs and I will attempt
> to merge this through the SoC tree.
> ---
>  drivers/power/supply/tosa_battery.c   | 171 ++++++++++++++++----------
> [...]

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--knurw6njbqijvhwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmD1jf8ACgkQ2O7X88g7
+pqzaxAAhHdHnDIcpqqYRZgFkFyO8hfZLW/0G0cNAfDWuueBGoK5TCPS6QKSrktK
hLApGZmNW97Xp1O3EJgixy6Knci69+qdqpgpMXOPMLgYkyYTj8wUexadnLSVnp0m
saNe9glCAmX1Quu9OclMF28KyYFdc2mbKZT/5yv6FGm2Bxs/h3qDcHKYNQP7Rnrt
GiKaxhu2z0Z98qlXrKpCI9pDeJU8o2d6ZDfRY5yXtL/pvXv0eBI4/2blKLxnZNq5
EdexXDp/bGoOuTyOX4a5SsYh//C2bzl8het/d5Tju6ZEGkJuW1fV+obgO6bG9ckU
yBrninBdHFwfQIf9rxXhdO0iBxGZX0/eCQvRtymDvBH9v0ICKNkGFuPjCtmmMUqk
MvpgoKFU8p2redht3DPTYLZ0PlzfIgDKIm0CEqhCaQPWGprY/jkrklv/VJN9Kj2L
UgmN8i+sIRcgxuUKUKg5/QHz9oUAmqAqWYFp9cB2EIUplo2b2xLubWQ8MUqg4/i6
mo8OBrm8+2WhWIiO9+L2C4g+UYbZi5d8OC27cP8ZMYGKchiw1bYcp/M+AHyhxzon
il7tVEoSuE/q/C3xDmPNTOawuQtF2vhk8bHkYWayC2fqIifXFoj+UBMVUxKsarHn
Kvt4Xmsgal2u2YdZB6ySXNg/prAj5kGat5H6IVUXzS9xMEhmhE4=
=2aop
-----END PGP SIGNATURE-----

--knurw6njbqijvhwr--
