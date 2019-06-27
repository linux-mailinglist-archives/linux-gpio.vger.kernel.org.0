Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C740858015
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 12:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfF0KUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 06:20:05 -0400
Received: from smtp6-g21.free.fr ([212.27.42.6]:58034 "EHLO smtp6-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbfF0KUE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Jun 2019 06:20:04 -0400
Received: from eos (unknown [213.61.153.180])
        (Authenticated sender: albeu)
        by smtp6-g21.free.fr (Postfix) with ESMTPSA id D3B1A78038E;
        Thu, 27 Jun 2019 10:19:53 +0000 (UTC)
Date:   Thu, 27 Jun 2019 12:19:52 +0200
From:   Alban <albeu@free.fr>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Alban Bedel <albeu@free.fr>, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-mips@linux-mips.org
Subject: Re: [PATCH] gpio: ath79: Pass irqchip when adding gpiochip
Message-ID: <20190627121952.681c9eb1@eos>
In-Reply-To: <20190625120030.16432-1-linus.walleij@linaro.org>
References: <20190625120030.16432-1-linus.walleij@linaro.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Mh9pzI_.rL==Y8BpE.lFccF"; protocol="application/pgp-signature"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--Sig_/Mh9pzI_.rL==Y8BpE.lFccF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Jun 2019 14:00:30 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip.
>=20
> For chained irqchips this is a pretty straight-forward
> conversion.
>=20
> Take this opportunity to add a local dev pointer and
> use devm_gpiochip_add() so we can get rid of the remove()
> callback altogether.
>=20
> Cc: Alban Bedel <albeu@free.fr>
> Cc: linux-mips@linux-mips.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Alban Bedel <albeu@free.fr>

--Sig_/Mh9pzI_.rL==Y8BpE.lFccF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAl0UmEgACgkQdJSaS524
LbzNPw//RI5bCNLQkyv8ayg52T0RN8v3gly56VodsSRCynrWJmPT1MLAkwJRAOt6
DjHebv+m/2Q+9MRB881ta9+VpC8jKgcpuKvI/MbhegFlvvbo46Y2lP1wK+RfL/Ro
rrQ9yfnZPRiPpWYEOPRi50zDs98FmDFcX0hJqxl0ZpNLJrwBQP2UBM9DubIhcteJ
SFTXvS8JaXxwJkuEKcFQykKMoRwSCWGCVoyIjMjkM5C83Fj0iRa5w3ecIMz2uzyu
I3sH5OV4U0/rULoDAXFyf3BiNk31V9qBd5fq53wxM+QXwSQUMDZDvfJHNhS+ufrJ
yO7ib3yB/2YkjSInIB8HrqbeF0gX0PGRXnogVj7RDqvFDt+bKN3/zSdaKQK/5d88
SvDHuJLdP+isApsJZq/Af3VdkLJzJ4oSES8tASv+XX65B6kb7vNkdbkaEU3sJO4P
oL+CXluK9P/dLFOAJqa51iCgU7/XjWsRhzeR7D7g8RimOvg+euLtxt+s0QbrUPEM
E4YHj80KrWD7wyChKzZl6ugTmm341ihp6iCzFRgb9rYEtkY+Sai2SvIbH+ZukUgP
0s2ZzzpLWLdRFamoKpyEuURbNaTTo+d29DRqIGTr0Brg09ECq1+MysOQ2PwngVYj
xaknQYbSV1LFD1CP/igvamUrEkGgBlaqjaZ2Jzg3E8sPOjdaC+c=
=Urvr
-----END PGP SIGNATURE-----

--Sig_/Mh9pzI_.rL==Y8BpE.lFccF--
