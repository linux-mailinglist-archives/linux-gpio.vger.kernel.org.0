Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1416C14CBED
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 14:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgA2N4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 08:56:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:40766 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbgA2N4S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jan 2020 08:56:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 29963AD85;
        Wed, 29 Jan 2020 13:56:16 +0000 (UTC)
Message-ID: <1aca11e7f66c0ebfc9499097d7c40a1835a80224.camel@suse.de>
Subject: Re: [RFC PATCH 0/4] pinctrl: bcm2835: Add support for all BCM2711
 GPIOs
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 29 Jan 2020 14:56:14 +0100
In-Reply-To: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-paFAbKmIJx8fhqD6d+ZI"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-paFAbKmIJx8fhqD6d+ZI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-01-27 at 19:15 +0100, Stefan Wahren wrote:
> The BCM2711 supports 58 GPIOs [1] by using the existing BCM2835 GPIO regi=
sters
> completely. So there is no need to change the binding.
>=20
> Patch 1 and 2 prepare the pinctrl driver to be extended to 58 GPIOs in Pa=
tch
> 3.
> I didn't want to squash them in order to make review as easy as possible.
> The final patch 4 assigns all SoC GPIOs a label as we already did for
> the older Raspberry Pi boards.
>=20
> [1] - https://github.com/raspberrypi/linux/issues/3101#issuecomment-57309=
2294
>=20
> Stefan Wahren (4):
>   pinctrl: bcm2835: Drop unused define
>   pinctrl: bcm2835: Refactor platform data
>   pinctrl: bcm2835: Add support for all GPIOs on BCM2711
>   ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
>=20
>  arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  74 ++++++++++++++++++++++++
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 106 ++++++++++++++++++++++++++--=
-----
> -
>  2 files changed, 156 insertions(+), 24 deletions(-)

Overall this looks good to me (modulo the small comments). I also gave it a=
 go
on RPi4 and RPi3b without issues.

Regards,
Nicolas


--=-paFAbKmIJx8fhqD6d+ZI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl4xjv4ACgkQlfZmHno8
x/7yugf5AWxKTdxdP/JzIcOGAX2fJIvWc9lWYEAIxvcQqDsO5+HAuYMj9ehOQXrc
HAI3r/UAS5EQGaotd2OuLj/UkkZRwyukoc4baF2xvARRWCyTFxbRX0XOdy0x7BOb
e4ZeMCI12sb0xZXNzsC+qlIidQ5At66CIdrn64vrDvtyrtkjR4/bYW8M3evTj+4x
CGIF+P8J9ZWVsbRyKohYnsj33Ggi6pwwHXzGAxbOgdJyToF9l10LnEW0WrmieKov
84UleM5Exg4ic23NbxSBpTdQzM83ht0d5yLW/gZf7e4gaI/Hy3yn1Wnu8nEJwnHa
xSUxIt7nyLcMLMHrwoKIi0QSvnSFqA==
=pB/z
-----END PGP SIGNATURE-----

--=-paFAbKmIJx8fhqD6d+ZI--

