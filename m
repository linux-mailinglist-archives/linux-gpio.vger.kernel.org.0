Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6F21F5671
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 16:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgFJOCD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 10:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbgFJOCC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 10:02:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2179AC03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 07:02:02 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 9269E2A473F
Received: by earth.universe (Postfix, from userid 1000)
        id D01533C08C6; Wed, 10 Jun 2020 16:01:56 +0200 (CEST)
Date:   Wed, 10 Jun 2020 16:01:56 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: Add gpio-charger to the documentation
Message-ID: <20200610140156.bt7b3usuumurrmuf@earth.universe>
References: <20200610095124.170079-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v6jdptnjhg43pl62"
Content-Disposition: inline
In-Reply-To: <20200610095124.170079-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--v6jdptnjhg43pl62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Jun 10, 2020 at 11:51:24AM +0200, Linus Walleij wrote:
> The GPIO-based charger is another of the helpful devices built
> on top of GPIO.
>=20
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/driver-api/gpio/drivers-on-gpio.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Document=
ation/driver-api/gpio/drivers-on-gpio.rst
> index 820b403d50f6..d85fb748cc52 100644
> --- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
> +++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
> @@ -89,6 +89,13 @@ hardware descriptions such as device tree or ACPI:
>    Consumer Electronics Control bus using only GPIO. It is used to commun=
icate
>    with devices on the HDMI bus.
> =20
> +- gpio-charger: drivers/power/supply/gpio-charger.c is used if you need =
to do
> +  battery charging and all you have to go by to check the presence of the
> +  battery

The presence being checked and reported to userspace is for the AC
adapter, not the battery. Battery presence is handled by battery
driver (e.g. sbs-battery has a detect gpio).

> +          or more complex tasks such as indicating charging status using
> +  nothing but GPIO lines, this driver provides that and also a clearly d=
efined
> +  way to pass the charging parameters from hardware descriptions such as=
 the
> +  device tree.
> +
>  Apart from this there are special GPIO drivers in subsystems like MMC/SD=
 to
>  read card detect and write protect GPIO lines, and in the TTY serial sub=
system
>  to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines=
=2E The

Otherwise LGTM.

-- Sebastian

--v6jdptnjhg43pl62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl7g580ACgkQ2O7X88g7
+pr9CBAAlq/VHjxp8wjPMI3Ui1HEKTE+XOubatZZcqmxc4gXioZAcbYGSZJdlPeT
cwyZFSKs/hausngXblBwt0vSHssSo4sDwt7lXL95SrkJbuDA1gH47/FtwBQYjWci
HiXtFSmmjBQ7Qe3j+BWCX1H6w+ehjNFt3gH/qP4hnyZhOKnc+57pLVS7pOhfKlj+
GXIdxaWjzdoRyiFDVLCY46C8zaC6ClekImNomJDFNcWycpyClF51Ah6I5NSF+Yew
26jnE5cLCbYk2WD3SmSwx+R5t3dArqcxo6Cf8qHUcAaQl+89iCMESLY0K89hPSCr
RsKWKyUp4skv97Q2qSH8wZsKVWvqICgeZ1s1fvcBCNeqUNyLCkRvhBxmmF5sH/9K
J1sl0lVotNvDzS7pOx9bjGZXj2WnhF6jgB5ElS6pF1Lk1x3mkeVGYur64WYevxFo
kZ7eco6dd/c4q81xX69reI2ldlEGjeDXiXzn6G8zPIupo5ybn1BX/idnu6W6PnkV
HUBeZQyyHqHYwKI2wX6YIsDhx2a9oDydRxKatBgPshJDfgdlIIs2hxyDl98DCWSY
DyI4iLmcIgQlGFlIHRWpPh/Ek4p+yI+tQRwef/j4J60naDMVh6yY+MiMERy9AD7S
auYKYc3gJVeqcShbTAQzLzVKy/nQBdAuEZl5mpFcgqE5Cu/hPog=
=CAS5
-----END PGP SIGNATURE-----

--v6jdptnjhg43pl62--
