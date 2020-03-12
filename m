Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46192183CA3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 23:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgCLWiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 18:38:18 -0400
Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]:50124 "EHLO
        6.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCLWiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 18:38:18 -0400
X-Greylist: delayed 12945 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Mar 2020 18:38:18 EDT
Received: from player761.ha.ovh.net (unknown [10.108.35.131])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1704B1CE110
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 20:02:32 +0100 (CET)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player761.ha.ovh.net (Postfix) with ESMTPSA id 840B4105EE227;
        Thu, 12 Mar 2020 19:02:19 +0000 (UTC)
Date:   Thu, 12 Mar 2020 20:02:11 +0100
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api/gpio/driver.rst: fix code blocks
Message-ID: <20200312200211.56555f1a@heffalump.sk2.org>
In-Reply-To: <20200312183452.GF2376@latitude>
References: <20200312180650.1365059-1-steve@sk2.org>
        <20200312183452.GF2376@latitude>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/EJ25.ioH5tFFK9PHcoH40.w"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 9747759918732627362
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvhedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgesghdtreerredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--Sig_/EJ25.ioH5tFFK9PHcoH40.w
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2020 19:34:52 +0100, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> On Thu, Mar 12, 2020 at 07:06:51PM +0100, Stephen Kitt wrote:
> > -is a typical example of a cascaded interrupt handler using
> > gpio_irq_chip:: +is a typical example of a cascaded interrupt handler
> > using gpio_irq_chip: =20
>=20
> Thanks for the patch, but Mauro already fixed it:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dc1c8b1ff0a1985d4992f49a5775bbcf6ee5ccfba

Ah, yes, I didn=E2=80=99t check linux-next, only docs-next.

Regards,

Stephen

--Sig_/EJ25.ioH5tFFK9PHcoH40.w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl5qhzMACgkQgNMC9Yht
g5z79RAAm9GZAuW/yWNXsgIo4xZ7vu/l0TtZnkH0lOwOgZCetp6jIQOcvfVnkun6
YG6uReaKsXrCjdEK/dDK3fx7o1eVVLbffdd2+54nkgejrec6B4NWYKirqyFbP2w9
owznif4bNRh2N1XmtRrqkd+PiHYGt20EXBHMs9VhNovp1LA6j5v6LTQYSEY+6GaF
0Z5JY9SgH2QLHoWkA79F/GycAYOTC3e7oiN0J3nUL/rEH8ZjutzUKvgTYymMFj12
N6HM1tHnrPdZ6cmzo8IhF04i7rv4y+DfqHEwNIFk+TknBbA9jIv6fln1Zo9YI0wu
QqBpTRQKqr7xiSpg2zgFJt3XYhGxVhShhFHtPmIj+Fd5VDhrqgvzLDqdTPRsLL1X
FMZGY+KBquOPq4Sm0rLcKo80k0hbGHdfUqFQgurG8yeSZZN2zxLU8wZilXVWv4aR
enpbcHAIniBuHzHfjKmZQsM/iowap8mIhhVTdl68zlZQd1JGJumjosMRQOo1GPKP
t1t2zco5AnD3QZZE8k3x43uVWTg//Th574+O8t3lsa4GhlDcY1Wt+EfGFWa2dr9M
Ow4o8q2YJz9hMqEZkeKJsS7C+rF0kj5K4k6R01L7U4BmjObZv9LB+279vL/T67WZ
36qBQ7enf6ooL/V0H9chW+gKCLO1Zm3Yv2RmNu7fs6gOokLOopE=
=aXXW
-----END PGP SIGNATURE-----

--Sig_/EJ25.ioH5tFFK9PHcoH40.w--
