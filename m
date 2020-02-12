Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E24F15AFE4
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 19:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgBLSds (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 13:33:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:58958 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgBLSds (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Feb 2020 13:33:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C0BC5AE89;
        Wed, 12 Feb 2020 18:33:46 +0000 (UTC)
Message-ID: <e64348f0e8304402cb007035d6b98c85e44887d1.camel@suse.de>
Subject: Re: [PATCH 2/4] pinctrl: bcm2835: Refactor platform data
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 12 Feb 2020 19:33:45 +0100
In-Reply-To: <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
         <1581166975-22949-3-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-jembeui3zBlsU8T/UDlG"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-jembeui3zBlsU8T/UDlG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-08 at 14:02 +0100, Stefan Wahren wrote:
> This prepares the platform data to be easier to extend for more GPIOs.
> Except of this there is no functional change.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!

>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 57 +++++++++++++++++++++++++++--=
-----
> -
>  1 file changed, 44 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 3fc2638..7f0a9c6 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -82,6 +82,7 @@ struct bcm2835_pinctrl {
> =20
>  	struct pinctrl_dev *pctl_dev;
>  	struct gpio_chip gpio_chip;
> +	struct pinctrl_desc pctl_desc;
>  	struct pinctrl_gpio_range gpio_range;
> =20
>  	raw_spinlock_t irq_lock[BCM2835_NUM_BANKS];
> @@ -1051,7 +1052,7 @@ static const struct pinconf_ops bcm2711_pinconf_ops=
 =3D {
>  	.pin_config_set =3D bcm2711_pinconf_set,
>  };
> =20
> -static struct pinctrl_desc bcm2835_pinctrl_desc =3D {
> +static const struct pinctrl_desc bcm2835_pinctrl_desc =3D {
>  	.name =3D MODULE_NAME,
>  	.pins =3D bcm2835_gpio_pins,
>  	.npins =3D ARRAY_SIZE(bcm2835_gpio_pins),
> @@ -1061,19 +1062,47 @@ static struct pinctrl_desc bcm2835_pinctrl_desc =
=3D {
>  	.owner =3D THIS_MODULE,
>  };
> =20
> -static struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range =3D {
> +static const struct pinctrl_desc bcm2711_pinctrl_desc =3D {
> +	.name =3D MODULE_NAME,
> +	.pins =3D bcm2835_gpio_pins,
> +	.npins =3D ARRAY_SIZE(bcm2835_gpio_pins),
> +	.pctlops =3D &bcm2835_pctl_ops,
> +	.pmxops =3D &bcm2835_pmx_ops,
> +	.confops =3D &bcm2711_pinconf_ops,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static const struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range =3D {
>  	.name =3D MODULE_NAME,
>  	.npins =3D BCM2835_NUM_GPIOS,
>  };
> =20
> +struct bcm_plat_data {
> +	const struct gpio_chip *gpio_chip;
> +	const struct pinctrl_desc *pctl_desc;
> +	const struct pinctrl_gpio_range *gpio_range;
> +};
> +
> +static const struct bcm_plat_data bcm2835_plat_data =3D {
> +	.gpio_chip =3D &bcm2835_gpio_chip,
> +	.pctl_desc =3D &bcm2835_pinctrl_desc,
> +	.gpio_range =3D &bcm2835_pinctrl_gpio_range,
> +};
> +
> +static const struct bcm_plat_data bcm2711_plat_data =3D {
> +	.gpio_chip =3D &bcm2835_gpio_chip,
> +	.pctl_desc =3D &bcm2711_pinctrl_desc,
> +	.gpio_range =3D &bcm2835_pinctrl_gpio_range,
> +};
> +
>  static const struct of_device_id bcm2835_pinctrl_match[] =3D {
>  	{
>  		.compatible =3D "brcm,bcm2835-gpio",
> -		.data =3D &bcm2835_pinconf_ops,
> +		.data =3D &bcm2835_plat_data,
>  	},
>  	{
>  		.compatible =3D "brcm,bcm2711-gpio",
> -		.data =3D &bcm2711_pinconf_ops,
> +		.data =3D &bcm2711_plat_data,
>  	},
>  	{}
>  };
> @@ -1082,6 +1111,7 @@ static int bcm2835_pinctrl_probe(struct platform_de=
vice
> *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
> +	const struct bcm_plat_data *pdata;
>  	struct bcm2835_pinctrl *pc;
>  	struct gpio_irq_chip *girq;
>  	struct resource iomem;
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
> +	pdata =3D match->data;
> +
> +	pc->gpio_chip =3D *pdata->gpio_chip;
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
> +	pc->pctl_desc =3D *pdata->pctl_desc;
> +	pc->pctl_dev =3D devm_pinctrl_register(dev, &pc->pctl_desc, pc);
>  	if (IS_ERR(pc->pctl_dev)) {
>  		gpiochip_remove(&pc->gpio_chip);
>  		return PTR_ERR(pc->pctl_dev);
>  	}
> =20
> -	pc->gpio_range =3D bcm2835_pinctrl_gpio_range;
> +	pc->gpio_range =3D *pdata->gpio_range;
>  	pc->gpio_range.base =3D pc->gpio_chip.base;
>  	pc->gpio_range.gc =3D &pc->gpio_chip;
>  	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);


--=-jembeui3zBlsU8T/UDlG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5ERQkACgkQlfZmHno8
x/5q4Af/a3wksMkUu0+vG5EJBAUUl64iLQYAVXlOAJF2u/rUn3Rvyv1+dDzAd+Kg
Mtg1SprUOuzianSk3PxYCa4zwuoRN9G2YwLgyP7o3ANfZAC8TArhEFCkdFNx9qdG
86L8/tPdPoH/bTCCJpyAH18w7/fQONzTymcMTjguVmb6pVZT+AYLgkp2FYlnCt4V
F2aK6v4roOo6ENKRnvFAA4WTt6JOG8zy10peZCUmWO1i6DJs7mX0YCOcGdEy5yZV
Cy+RCZIi104TZIu2gSoNTQmnHTOA66+CC1N0mKW07FY+2RmX+vagOIs2r3qatJBM
NTCXyqYv1/vD4Ruf1xo38zhqYG+Kug==
=L8Aw
-----END PGP SIGNATURE-----

--=-jembeui3zBlsU8T/UDlG--

