Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE04391068
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 08:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbhEZGMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 02:12:24 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:37715 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbhEZGMX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 02:12:23 -0400
Received: by mail-lf1-f53.google.com with SMTP id b26so780892lfq.4;
        Tue, 25 May 2021 23:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7XFftguTcFQmlVkEMCNxVmipWHmtjK7hc0l8K1kFIUo=;
        b=S+bsdX712UB9197bYH8VFnWE7yLOdE4vTlfQoWc5LYAms3jMbMdT416elMUGooOWEp
         UI2CM5pZ0nBd76zoBjMtsAxWyyBEObjh8Wn2fLlVl8pJPJWUwx9AxHy5IRVaHwmop5Ll
         uZwXnWt9tKH+7LEb6FtI5IyfeXVexgSz1WGsLznocg6BP2X/g1wvxTcaeKyFfQJJBaWd
         yJZs+34ySqbI/nTpMlvrscvZbO6ASWv2L7rvKPdkghXMZm4vejQoBB9VjVSEEeKVad40
         4Y4W2kP4efjJo9HQM5dyplq4QEvsKXTrF03E4SNoduN55sxYJYk/+wX25PH19rDIuJst
         /RQw==
X-Gm-Message-State: AOAM532buXGlciZG4fxC8+Z1GP+eTwv+R+ezXnJYgizSL6wpOBu0GZ6e
        +NnBkDz8lEnqYANZWyiKawk=
X-Google-Smtp-Source: ABdhPJxapYgCnSiU10EAGd5tm0TnaHp1gKF0IF4Qk7XditaD2JZZTrGgZbGH9PeqaTPuPVDgi2OsAA==
X-Received: by 2002:a05:6512:3456:: with SMTP id j22mr1089312lfr.532.1622009451277;
        Tue, 25 May 2021 23:10:51 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id v21sm361009lfe.255.2021.05.25.23.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 23:10:50 -0700 (PDT)
Date:   Wed, 26 May 2021 09:10:45 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com,
        linux-arm-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 3/3] gpio: bd71815: Use gpio-regmap
Message-ID: <a576fcc102063f2ae79d06b14ced2c6f2a491f4c.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Utilize the gpio-regmap helper and drop the custom functions

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
Changelog v3:
  - gpio: Adapt to changes in gpio_regmap
---
 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-bd71815.c | 121 +++++++++---------------------------
 2 files changed, 32 insertions(+), 90 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6727fd..97e1348cd410 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1120,6 +1120,7 @@ config GPIO_BD70528
 config GPIO_BD71815
 	tristate "ROHM BD71815 PMIC GPIO support"
 	depends on MFD_ROHM_BD71828
+	select GPIO_REGMAP
 	help
 	  Support for GPO(s) on ROHM BD71815 PMIC. There are two GPOs
 	  available on the ROHM PMIC.
diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
index 08ff2857256f..45782d376b3d 100644
--- a/drivers/gpio/gpio-bd71815.c
+++ b/drivers/gpio/gpio-bd71815.c
@@ -9,6 +9,7 @@
  */
=20
 #include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/module.h>
@@ -17,82 +18,30 @@
 /* For the BD71815 register definitions */
 #include <linux/mfd/rohm-bd71815.h>
=20
-struct bd71815_gpio {
-	/* chip.parent points the MFD which provides DT node and regmap */
-	struct gpio_chip chip;
-	/* dev points to the platform device for devm and prints */
-	struct device *dev;
-	struct regmap *regmap;
-};
-
-static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
+static int bd71815_gpio_set_config(const struct gpio_regmap_config *gr_con=
fig,
+				   unsigned int offset, unsigned long config)
 {
-	struct bd71815_gpio *bd71815 =3D gpiochip_get_data(chip);
-	int ret, val;
-
-	ret =3D regmap_read(bd71815->regmap, BD71815_REG_GPO, &val);
-	if (ret)
-		return ret;
-
-	return (val >> offset) & 1;
-}
-
-static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
-{
-	struct bd71815_gpio *bd71815 =3D gpiochip_get_data(chip);
-	int ret, bit;
-
-	bit =3D BIT(offset);
-
-	if (value)
-		ret =3D regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
-	else
-		ret =3D regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
-
-	if (ret)
-		dev_warn(bd71815->dev, "failed to toggle GPO\n");
-}
-
-static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int of=
fset,
-				   unsigned long config)
-{
-	struct bd71815_gpio *bdgpio =3D gpiochip_get_data(chip);
+	struct regmap *regmap =3D gr_config->regmap;
=20
 	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		return regmap_update_bits(bdgpio->regmap,
+		return regmap_update_bits(regmap,
 					  BD71815_REG_GPO,
 					  BD71815_GPIO_DRIVE_MASK << offset,
 					  BD71815_GPIO_OPEN_DRAIN << offset);
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		return regmap_update_bits(bdgpio->regmap,
+		return regmap_update_bits(regmap,
 					  BD71815_REG_GPO,
 					  BD71815_GPIO_DRIVE_MASK << offset,
 					  BD71815_GPIO_CMOS << offset);
 	default:
+		dev_err(gr_config->parent, "Unsupported config (0x%lx)\n",
+			config);
 		break;
 	}
 	return -ENOTSUPP;
 }
=20
-/* BD71815 GPIO is actually GPO */
-static int bd71815gpo_direction_get(struct gpio_chip *gc, unsigned int off=
set)
-{
-	return GPIO_LINE_DIRECTION_OUT;
-}
-
-/* Template for GPIO chip */
-static const struct gpio_chip bd71815gpo_chip =3D {
-	.label			=3D "bd71815",
-	.owner			=3D THIS_MODULE,
-	.get			=3D bd71815gpo_get,
-	.get_direction		=3D bd71815gpo_direction_get,
-	.set			=3D bd71815gpo_set,
-	.set_config		=3D bd71815_gpio_set_config,
-	.can_sleep		=3D true,
-};
-
 #define BD71815_TWO_GPIOS	GENMASK(1, 0)
 #define BD71815_ONE_GPIO	BIT(0)
=20
@@ -111,15 +60,17 @@ static const struct gpio_chip bd71815gpo_chip =3D {
  * but allows using it by providing the DT property
  * "rohm,enable-hidden-gpo".
  */
-static int bd71815_init_valid_mask(struct gpio_chip *gc,
+static int bd71815_init_valid_mask(const struct gpio_regmap_config *c,
 				   unsigned long *valid_mask,
 				   unsigned int ngpios)
 {
+
 	if (ngpios !=3D 2)
 		return 0;
=20
-	if (gc->parent && device_property_present(gc->parent,
-						  "rohm,enable-hidden-gpo"))
+	/* The property should be in MFD DT node */
+	if (c->parent && fwnode_property_present(c->fwnode,
+						 "rohm,enable-hidden-gpo"))
 		*valid_mask =3D BD71815_TWO_GPIOS;
 	else
 		*valid_mask =3D BD71815_ONE_GPIO;
@@ -127,9 +78,21 @@ static int bd71815_init_valid_mask(struct gpio_chip *gc,
 	return 0;
 }
=20
+/* Template for regmap gpio config */
+static const struct gpio_regmap_config gpio_cfg_template =3D {
+	.label			=3D "bd71815",
+	.reg_set_base		=3D BD71815_REG_GPO,
+	.ngpio			=3D 2,
+};
+
+static const struct gpio_regmap_ops ops =3D {
+	.set_config		=3D bd71815_gpio_set_config,
+	.init_valid_mask	=3D bd71815_init_valid_mask,
+};
+
 static int gpo_bd71815_probe(struct platform_device *pdev)
 {
-	struct bd71815_gpio *g;
+	struct gpio_regmap_config cfg;
 	struct device *parent, *dev;
=20
 	/*
@@ -140,34 +103,12 @@ static int gpo_bd71815_probe(struct platform_device *=
pdev)
 	/* The device-tree and regmap come from MFD =3D> use parent for that */
 	parent =3D dev->parent;
=20
-	g =3D devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
-	if (!g)
-		return -ENOMEM;
-
-	g->chip =3D bd71815gpo_chip;
-
-	/*
-	 * FIXME: As writing of this the sysfs interface for GPIO control does
-	 * not respect the valid_mask. Do not trust it but rather set the ngpios
-	 * to 1 if "rohm,enable-hidden-gpo" is not given.
-	 *
-	 * This check can be removed later if the sysfs export is fixed and
-	 * if the fix is backported.
-	 *
-	 * For now it is safest to just set the ngpios though.
-	 */
-	if (device_property_present(parent, "rohm,enable-hidden-gpo"))
-		g->chip.ngpio =3D 2;
-	else
-		g->chip.ngpio =3D 1;
-
-	g->chip.init_valid_mask =3D bd71815_init_valid_mask;
-	g->chip.base =3D -1;
-	g->chip.parent =3D parent;
-	g->regmap =3D dev_get_regmap(parent, NULL);
-	g->dev =3D dev;
+	cfg =3D gpio_cfg_template;
+	cfg.parent =3D parent;
+	cfg.regmap =3D dev_get_regmap(parent, NULL);
+	cfg.fwnode =3D dev_fwnode(dev);
=20
-	return devm_gpiochip_add_data(dev, &g->chip, g);
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &cfg, &ops));
 }
=20
 static struct platform_driver gpo_bd71815_driver =3D {
--=20
2.25.4


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCt5mUACgkQeFA3/03a
ocXVBgf9GdiWECyIlqske9r/Ea+M8rrnfY51zKsEDDThUtOFtJAnmj8gGt7SBgvd
MavCgxKedmhkv6sJLgZe0KmyiCWB1x767bpVptDFSpALB+yflHygOPfvkGsjIPHD
rLQPsIm6HAebf9ffah33jRgS91fu+RgX2HCl5I3iDlQqc1lPlSTsKSsm45v/vX6N
AEO7nQuJAT1atW37AqHvqABZHnhuntCgitS+dxZgpNoXVm9GJK1T3sFS2zilojNw
7IhtGN8y7IQUN2rj26pJohJBdgysjy0DE2qz1ljcQXNuhybubiP+yyss/fnO6T4I
KJuKXkB1/yCtGE0daxxvm5dmoIiFBg==
=v4on
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
