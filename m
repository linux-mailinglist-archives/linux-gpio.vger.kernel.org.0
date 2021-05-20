Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E9438AC15
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 13:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241487AbhETLd2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 07:33:28 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:34482 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240815AbhETLb2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 07:31:28 -0400
Received: by mail-lj1-f174.google.com with SMTP id b12so12040557ljp.1;
        Thu, 20 May 2021 04:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U9v2XFXhxWrJhhTytw+psilkDCTZjJus/6PodmNXrec=;
        b=HItdze0PUMMV9yizKnC0DZQAUQ+cMYOFfoiZ9WZ9SKkJJLfubXbpkFAVl6n5rG319+
         KjqAqtdl1XQi4ZeTsSER/BaKiIz7FSd2WES1cZaA5yaM5rTByL2TLfA7FBQh3klFQ0+B
         TgG7iRFXFas7QJ7xpOwPITNlOp0DH8RAdMUfyJ9qC6DOvAF/xfdWWmHAN7mb5VCszHYx
         EqsIQcynBKOPMQTPEb110Zch87UX4/kBHamKxgH3R/yi7V/ygVo1k5FRP1VVVKzxxClx
         8nHklP150UQWoGxjn40+jJsF1DEuflG0eZq/qEXQV5Cu8BB7nuiuLlZkTSYcn5JQu/R4
         KmZQ==
X-Gm-Message-State: AOAM531YZ7IzugmqVlUcoAX6Y91ZZsUAywZoprhXgm8udXtpVZJaObX0
        wzEitKwfTvFSDmm96E63X3s=
X-Google-Smtp-Source: ABdhPJwdYh5+eDjhh/s7gGLVPa8CI29IYjav5VMGf846yjxHbKRHlLhc75ZQ+QTKXlajNlYIoA2UFA==
X-Received: by 2002:a2e:a314:: with SMTP id l20mr2634956lje.167.1621510205827;
        Thu, 20 May 2021 04:30:05 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id q3sm236113ljp.67.2021.05.20.04.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 04:30:05 -0700 (PDT)
Date:   Thu, 20 May 2021 14:29:57 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH 2/2] gpio: bd71815: Use gpio-regmap
Message-ID: <7f19bf2bb61ad64a9df94ab16bc1cca08e8efe43.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Utilize the gpio-regmap helper and drop the custom functions

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-bd71815.c | 106 ++++++++++--------------------------
 2 files changed, 29 insertions(+), 78 deletions(-)

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
index 08ff2857256f..a241c01e08d1 100644
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
@@ -18,81 +19,33 @@
 #include <linux/mfd/rohm-bd71815.h>
=20
 struct bd71815_gpio {
-	/* chip.parent points the MFD which provides DT node and regmap */
-	struct gpio_chip chip;
-	/* dev points to the platform device for devm and prints */
 	struct device *dev;
-	struct regmap *regmap;
 };
=20
-static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
-{
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
+static int bd71815_gpio_set_config(struct regmap *regmap, void *drvdata,
+				   unsigned int offset,
 				   unsigned long config)
 {
-	struct bd71815_gpio *bdgpio =3D gpiochip_get_data(chip);
+	struct bd71815_gpio *bdgpio =3D (struct bd71815_gpio *)drvdata;
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
+		dev_err(bdgpio->dev, "Unsupported config (0x%lx)\n", config);
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
@@ -111,14 +64,16 @@ static const struct gpio_chip bd71815gpo_chip =3D {
  * but allows using it by providing the DT property
  * "rohm,enable-hidden-gpo".
  */
-static int bd71815_init_valid_mask(struct gpio_chip *gc,
+static int bd71815_init_valid_mask(struct regmap *regmap, void *drvdata,
 				   unsigned long *valid_mask,
 				   unsigned int ngpios)
 {
+	struct bd71815_gpio *bdgpio =3D (struct bd71815_gpio *)drvdata;
+
 	if (ngpios !=3D 2)
 		return 0;
=20
-	if (gc->parent && device_property_present(gc->parent,
+	if (bdgpio->dev && device_property_present(bdgpio->dev->parent,
 						  "rohm,enable-hidden-gpo"))
 		*valid_mask =3D BD71815_TWO_GPIOS;
 	else
@@ -127,9 +82,19 @@ static int bd71815_init_valid_mask(struct gpio_chip *gc,
 	return 0;
 }
=20
+/* Template for regmap gpio config */
+static const struct gpio_regmap_config gpio_cfg_template =3D {
+	.label			=3D "bd71815",
+	.reg_set_base		=3D BD71815_REG_GPO,
+	.ngpio			=3D 2,
+	.set_config		=3D bd71815_gpio_set_config,
+	.init_valid_mask	=3D bd71815_init_valid_mask,
+};
+
 static int gpo_bd71815_probe(struct platform_device *pdev)
 {
 	struct bd71815_gpio *g;
+	struct gpio_regmap_config cfg;
 	struct device *parent, *dev;
=20
 	/*
@@ -144,30 +109,15 @@ static int gpo_bd71815_probe(struct platform_device *=
pdev)
 	if (!g)
 		return -ENOMEM;
=20
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
 	g->dev =3D dev;
=20
-	return devm_gpiochip_add_data(dev, &g->chip, g);
+	cfg =3D gpio_cfg_template;
+	cfg.parent =3D parent;
+	cfg.regmap =3D dev_get_regmap(parent, NULL);
+	cfg.fwnode =3D dev_fwnode(dev);
+	cfg.drvdata =3D g;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &cfg));
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

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCmSDUACgkQeFA3/03a
ocVu9Af/QXYEHOU3ReHOMx+Lp4csm93q887u9NFlC5FOgvNZvnjfiWm0UzcXK39y
h84RGdeO2n69cuYfoUKImW5ws6uz/XgPZc/rGuJHYvVicEGi1rOLWlm6VPIsIOIa
a8PG3QCdAo6FH/l1OXVvKACHsyzIEZhQsRGGwqZapesIjaoBXLWI5KcJ7c7ywIGD
CQ2IA7IBZn6Y7w5gFpt8155uIhGeatosD9mXiL6T35lsUqnjklaaZcDvG9GPNCbx
5agm1E7Nm+oKawo3XkpTYVXL/9DHjbIRvjsDY6mKslweQXzpVNRKXKmibNYNdTNk
46OFQRfWrWKKVT8hq5wXCOEtskxyRQ==
=iz9Q
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
