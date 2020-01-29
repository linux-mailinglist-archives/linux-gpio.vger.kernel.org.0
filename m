Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE5414CBBD
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 14:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgA2NwJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 08:52:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:38712 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbgA2NwI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Jan 2020 08:52:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 75568AD85;
        Wed, 29 Jan 2020 13:52:05 +0000 (UTC)
Message-ID: <b4c4b18eabe845e4cc3e0e1d5af2f3aa7b9091c7.camel@suse.de>
Subject: Re: [RFC PATCH 2/4] pinctrl: bcm2835: Refactor platform data
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 29 Jan 2020 14:52:03 +0100
In-Reply-To: <1580148908-4863-3-git-send-email-stefan.wahren@i2se.com>
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
         <1580148908-4863-3-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-d10hOAw7/iXklX9kAd3Z"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-d10hOAw7/iXklX9kAd3Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,
thanks for the series!

On Mon, 2020-01-27 at 19:15 +0100, Stefan Wahren wrote:
> This prepares the platform data to be easier to extend for more GPIOs.
> Except of this there is no functional change.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

[...]

> @@ -1083,6 +1112,7 @@ static int bcm2835_pinctrl_probe(struct platform_de=
vice
> *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
>  	struct bcm2835_pinctrl *pc;
> +	struct bcm_plat_data *pdata;

You could define this as const...

>  	struct gpio_irq_chip *girq;
>  	struct resource iomem;
>  	int err, i;
> @@ -1108,7 +1138,13 @@ static int bcm2835_pinctrl_probe(struct platform_d=
evice
> *pdev)
>  	if (IS_ERR(pc->base))
>  		return PTR_ERR(pc->base);
> =20
> -	pc->gpio_chip =3D bcm2835_gpio_chip;
> +	match =3D of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
> +	if (!match)
> +		return -EINVAL;
> +
> +	pdata =3D (struct bcm_plat_data *)match->data;

...and drop this cast.

> +
> +	memcpy(&pc->gpio_chip, pdata->gpio_chip, sizeof(pc->gpio_chip));
>  	pc->gpio_chip.parent =3D dev;
>  	pc->gpio_chip.of_node =3D np;
> =20
> @@ -1159,19 +1195,14 @@ static int bcm2835_pinctrl_probe(struct
> platform_device *pdev)
>  		return err;
>  	}
> =20
> -	match =3D of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
> -	if (match) {
> -		bcm2835_pinctrl_desc.confops =3D
> -			(const struct pinconf_ops *)match->data;
> -	}
> -
> -	pc->pctl_dev =3D devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
> +	memcpy(&pc->pctl_desc, pdata->pctl_desc, sizeof(pc->pctl_desc));

I suggest doing (here and below):

	pc->pctl_desc =3D *pdata->pctl_desc;

> +	pc->pctl_dev =3D devm_pinctrl_register(dev, &pc->pctl_desc, pc);
>  	if (IS_ERR(pc->pctl_dev)) {
>  		gpiochip_remove(&pc->gpio_chip);
>  		return PTR_ERR(pc->pctl_dev);
>  	}
> =20
> -	pc->gpio_range =3D bcm2835_pinctrl_gpio_range;
> +	memcpy(&pc->gpio_range, pdata->gpio_range, sizeof(pc->gpio_range));
>  	pc->gpio_range.base =3D pc->gpio_chip.base;
>  	pc->gpio_range.gc =3D &pc->gpio_chip;
>  	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);

Regards,
Nicolas


--=-d10hOAw7/iXklX9kAd3Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl4xjgMACgkQlfZmHno8
x/5JwAf9FcQOs7WwV7QJ+nt29U48mXMjZhtcYmyn6DKR1pMZjkiT0bDey6lFCqFw
/GO7cinvI0n8LWSSTlqcfTNfSx8i4/S3HVBwwsH89e5aiXqjNsOhJVvjjZJapVcC
V9oMmxsstrTuQJXFFyufCcOTOxrZDIy93J1bu+4/UTITv9DuvmV74YDAi42880u+
41/ZgmJJkAgcirVoODK4lrbocd1ilh2mUFYcu9Of2oA3/MA0XSz50EpS1iHhZtSP
u6bZFQhOlT/nT2d+WfB9aem95yg+XWcMCA/OHkRgpFWNlFoTOxRrZWRBrOP/Toa3
+HAulEAOla3nDKnnaVFYAAbFncB5kA==
=B3Z4
-----END PGP SIGNATURE-----

--=-d10hOAw7/iXklX9kAd3Z--

