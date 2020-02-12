Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F34715AFE8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 19:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgBLSeJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 13:34:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:59102 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728575AbgBLSeJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Feb 2020 13:34:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A0B5DAE89;
        Wed, 12 Feb 2020 18:34:06 +0000 (UTC)
Message-ID: <9a5412d00e7f674b2330133d5c276f4ac6eff8d8.camel@suse.de>
Subject: Re: [PATCH 3/4] pinctrl: bcm2835: Add support for all GPIOs on
 BCM2711
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
Date:   Wed, 12 Feb 2020 19:34:05 +0100
In-Reply-To: <1581166975-22949-4-git-send-email-stefan.wahren@i2se.com>
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com>
         <1581166975-22949-4-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Fbsk2tY5nCejiYEjevA4"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--=-Fbsk2tY5nCejiYEjevA4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-02-08 at 14:02 +0100, Stefan Wahren wrote:
> The BCM2711 supports 58 GPIOs. So extend pinctrl and GPIOs accordingly.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!

>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 54 +++++++++++++++++++++++++++--=
-----
> -
>  1 file changed, 42 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 7f0a9c6..061e70e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -37,6 +37,7 @@
> =20
>  #define MODULE_NAME "pinctrl-bcm2835"
>  #define BCM2835_NUM_GPIOS 54
> +#define BCM2711_NUM_GPIOS 58
>  #define BCM2835_NUM_BANKS 2
>  #define BCM2835_NUM_IRQS  3
> =20
> @@ -78,7 +79,7 @@ struct bcm2835_pinctrl {
> =20
>  	/* note: locking assumes each bank will have its own unsigned long */
>  	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
> -	unsigned int irq_type[BCM2835_NUM_GPIOS];
> +	unsigned int irq_type[BCM2711_NUM_GPIOS];
> =20
>  	struct pinctrl_dev *pctl_dev;
>  	struct gpio_chip gpio_chip;
> @@ -145,6 +146,10 @@ static struct pinctrl_pin_desc bcm2835_gpio_pins[] =
=3D {
>  	BCM2835_GPIO_PIN(51),
>  	BCM2835_GPIO_PIN(52),
>  	BCM2835_GPIO_PIN(53),
> +	BCM2835_GPIO_PIN(54),
> +	BCM2835_GPIO_PIN(55),
> +	BCM2835_GPIO_PIN(56),
> +	BCM2835_GPIO_PIN(57),
>  };
> =20
>  /* one pin per group */
> @@ -203,6 +208,10 @@ static const char * const bcm2835_gpio_groups[] =3D =
{
>  	"gpio51",
>  	"gpio52",
>  	"gpio53",
> +	"gpio54",
> +	"gpio55",
> +	"gpio56",
> +	"gpio57",
>  };
> =20
>  enum bcm2835_fsel {
> @@ -353,6 +362,22 @@ static const struct gpio_chip bcm2835_gpio_chip =3D =
{
>  	.can_sleep =3D false,
>  };
> =20
> +static const struct gpio_chip bcm2711_gpio_chip =3D {
> +	.label =3D "pinctrl-bcm2711",
> +	.owner =3D THIS_MODULE,
> +	.request =3D gpiochip_generic_request,
> +	.free =3D gpiochip_generic_free,
> +	.direction_input =3D bcm2835_gpio_direction_input,
> +	.direction_output =3D bcm2835_gpio_direction_output,
> +	.get_direction =3D bcm2835_gpio_get_direction,
> +	.get =3D bcm2835_gpio_get,
> +	.set =3D bcm2835_gpio_set,
> +	.set_config =3D gpiochip_generic_config,
> +	.base =3D -1,
> +	.ngpio =3D BCM2711_NUM_GPIOS,
> +	.can_sleep =3D false,
> +};
> +
>  static void bcm2835_gpio_irq_handle_bank(struct bcm2835_pinctrl *pc,
>  					 unsigned int bank, u32 mask)
>  {
> @@ -399,7 +424,7 @@ static void bcm2835_gpio_irq_handler(struct irq_desc
> *desc)
>  		bcm2835_gpio_irq_handle_bank(pc, 0, 0xf0000000);
>  		bcm2835_gpio_irq_handle_bank(pc, 1, 0x00003fff);
>  		break;
> -	case 2: /* IRQ2 covers GPIOs 46-53 */
> +	case 2: /* IRQ2 covers GPIOs 46-57 */
>  		bcm2835_gpio_irq_handle_bank(pc, 1, 0x003fc000);
>  		break;
>  	}
> @@ -618,7 +643,7 @@ static struct irq_chip bcm2835_gpio_irq_chip =3D {
> =20
>  static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
> -	return ARRAY_SIZE(bcm2835_gpio_groups);
> +	return BCM2835_NUM_GPIOS;
>  }
> =20
>  static const char *bcm2835_pctl_get_group_name(struct pinctrl_dev *pctld=
ev,
> @@ -776,7 +801,7 @@ static int bcm2835_pctl_dt_node_to_map(struct pinctrl=
_dev
> *pctldev,
>  		err =3D of_property_read_u32_index(np, "brcm,pins", i, &pin);
>  		if (err)
>  			goto out;
> -		if (pin >=3D ARRAY_SIZE(bcm2835_gpio_pins)) {
> +		if (pin >=3D pc->pctl_desc.npins) {
>  			dev_err(pc->dev, "%pOF: invalid brcm,pins value %d\n",
>  				np, pin);
>  			err =3D -EINVAL;
> @@ -852,7 +877,7 @@ static int bcm2835_pmx_get_function_groups(struct
> pinctrl_dev *pctldev,
>  {
>  	/* every pin can do every function */
>  	*groups =3D bcm2835_gpio_groups;
> -	*num_groups =3D ARRAY_SIZE(bcm2835_gpio_groups);
> +	*num_groups =3D BCM2835_NUM_GPIOS;
> =20
>  	return 0;
>  }
> @@ -1055,7 +1080,7 @@ static const struct pinconf_ops bcm2711_pinconf_ops=
 =3D {
>  static const struct pinctrl_desc bcm2835_pinctrl_desc =3D {
>  	.name =3D MODULE_NAME,
>  	.pins =3D bcm2835_gpio_pins,
> -	.npins =3D ARRAY_SIZE(bcm2835_gpio_pins),
> +	.npins =3D BCM2835_NUM_GPIOS,
>  	.pctlops =3D &bcm2835_pctl_ops,
>  	.pmxops =3D &bcm2835_pmx_ops,
>  	.confops =3D &bcm2835_pinconf_ops,
> @@ -1063,9 +1088,9 @@ static const struct pinctrl_desc bcm2835_pinctrl_de=
sc =3D
> {
>  };
> =20
>  static const struct pinctrl_desc bcm2711_pinctrl_desc =3D {
> -	.name =3D MODULE_NAME,
> +	.name =3D "pinctrl-bcm2711",
>  	.pins =3D bcm2835_gpio_pins,
> -	.npins =3D ARRAY_SIZE(bcm2835_gpio_pins),
> +	.npins =3D BCM2711_NUM_GPIOS,
>  	.pctlops =3D &bcm2835_pctl_ops,
>  	.pmxops =3D &bcm2835_pmx_ops,
>  	.confops =3D &bcm2711_pinconf_ops,
> @@ -1077,6 +1102,11 @@ static const struct pinctrl_gpio_range
> bcm2835_pinctrl_gpio_range =3D {
>  	.npins =3D BCM2835_NUM_GPIOS,
>  };
> =20
> +static const struct pinctrl_gpio_range bcm2711_pinctrl_gpio_range =3D {
> +	.name =3D "pinctrl-bcm2711",
> +	.npins =3D BCM2711_NUM_GPIOS,
> +};
> +
>  struct bcm_plat_data {
>  	const struct gpio_chip *gpio_chip;
>  	const struct pinctrl_desc *pctl_desc;
> @@ -1090,9 +1120,9 @@ static const struct bcm_plat_data bcm2835_plat_data=
 =3D {
>  };
> =20
>  static const struct bcm_plat_data bcm2711_plat_data =3D {
> -	.gpio_chip =3D &bcm2835_gpio_chip,
> +	.gpio_chip =3D &bcm2711_gpio_chip,
>  	.pctl_desc =3D &bcm2711_pinctrl_desc,
> -	.gpio_range =3D &bcm2835_pinctrl_gpio_range,
> +	.gpio_range =3D &bcm2711_pinctrl_gpio_range,
>  };
> =20
>  static const struct of_device_id bcm2835_pinctrl_match[] =3D {
> @@ -1118,8 +1148,8 @@ static int bcm2835_pinctrl_probe(struct platform_de=
vice
> *pdev)
>  	int err, i;
>  	const struct of_device_id *match;
> =20
> -	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) !=3D BCM2835_NUM_GPIOS);
> -	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) !=3D BCM2835_NUM_GPIOS);
> +	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) !=3D BCM2711_NUM_GPIOS);
> +	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) !=3D BCM2711_NUM_GPIOS);
> =20
>  	pc =3D devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
>  	if (!pc)


--=-Fbsk2tY5nCejiYEjevA4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5ERR0ACgkQlfZmHno8
x/4PUgf9FbUDm9e+5P2tjaxbklEvedw5I+MC1aKYkCbpqgrllWD/1S9III3ObgA6
UykAv2VcDSfDR4ZG+rcmE8qlmBwOnPO/h7xTLEPrEM0dVeKGgwExbmXOZs69h1t/
tJXR8e5cfWUc3Vfow3GIIiTCmbu+uDRNOHrh4TA0EOQS+lO/THPdgMieFd/M4cm3
qqwNXIuDDwpyBtU6rH2Eyc9WxbK6tea2wEYLEE9u8iEBXW/xnIcDoFiX0/gMOlqa
RUyBpGFAUQkEYrmhJZe24W9VcuXFRJIau+jXqgZ/uAafJWyVVIELSLYH+mDb87PU
hvjNaFO4ABpuHEJxtgkCfNDK55WnKw==
=sFe1
-----END PGP SIGNATURE-----

--=-Fbsk2tY5nCejiYEjevA4--

