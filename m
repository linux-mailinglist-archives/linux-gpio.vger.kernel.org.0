Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F8E43DD9A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 11:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhJ1JVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:21:33 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:37663 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhJ1JVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:21:33 -0400
Received: by mail-lj1-f180.google.com with SMTP id 188so9563077ljj.4;
        Thu, 28 Oct 2021 02:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yq6BwnSmNf80lpDeEcazJdzs3D3BE8lrJc9IhNqrmmQ=;
        b=Az45LzkG8dHiOo9DcdrjEt6Hc8XXCPnGjEFUULbz+YplIQ9hU1yQvSFIjRBgzvJWsA
         rtoqmFchgtM5i7qBNOKEN6jDGjMA9mxhsTbtBCfIIJG0mRJM+ryKOw6yp9ebzkcP7xJF
         uIzJ5Grby9YWoaf3j5FUhHkoc22TA0yV4IzjHoFtrgKVw4rC1z/Lr87vJXARphaM5Ukk
         Wg/Q5AiCGvf4m4v2n0Bg6eyvi+5igVJMMVFg1J2hPo8W9r+U78gjBE6U18FRcALKZFO0
         +8KpZA1AXwwstC3qOhewDLUGj55m70kuPkuByYDgtCCMwOo/xenYzyOBsToMe4KPXo8M
         KQfg==
X-Gm-Message-State: AOAM533X5ySRn1c9p3otyNUuCU4aeLSv1Pe18oD4qBqQwPKNCOq2Loeh
        o3qAu2O1fIGNTgDRTFDQNZA=
X-Google-Smtp-Source: ABdhPJybVm/EhdfVqe99WdxGaaH9eltbA9mC1GxPtys1jJuLExq1MdtM8alCepgoeCxcO+7fY/n3Zw==
X-Received: by 2002:a2e:2a83:: with SMTP id q125mr3404356ljq.313.1635412744802;
        Thu, 28 Oct 2021 02:19:04 -0700 (PDT)
Received: from fedora (d44bs26yxfwtfmx4yyk-4.rev.dnainternet.fi. [2001:14bb:c6:2fb:6813:24a0:454f:2])
        by smtp.gmail.com with ESMTPSA id e29sm254284lfc.141.2021.10.28.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:19:04 -0700 (PDT)
Date:   Thu, 28 Oct 2021 12:18:57 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     lukas.bulwahn@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [RESEND PATCH 2/4] gpio: bd70528 Drop BD70528 support
Message-ID: <5da2237a0446e960a7726c23eb34cb1eaf6f4b54.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sPu3AeqMFjAZuYLd"
Content-Disposition: inline
In-Reply-To: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--sPu3AeqMFjAZuYLd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The only known BD70528 use-cases are such that the PMIC is controlled
=66rom separate MCU which is not running Linux. I am not aware of
any Linux driver users. Furthermore, it seems there is no demand for
this IC. Let's ease the maintenance burden and drop the driver. We can
always add it back if there is sudden need for it.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/Kconfig        |  11 --
 drivers/gpio/Makefile       |   1 -
 drivers/gpio/gpio-bd70528.c | 230 ------------------------------------
 3 files changed, 242 deletions(-)
 delete mode 100644 drivers/gpio/gpio-bd70528.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fae5141251e5..ca6d71fe7185 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1120,17 +1120,6 @@ config GPIO_ARIZONA
 	help
 	  Support for GPIOs on Wolfson Arizona class devices.
=20
-config GPIO_BD70528
-	tristate "ROHM BD70528 GPIO support"
-	depends on MFD_ROHM_BD70528
-	help
-	  Support for GPIOs on ROHM BD70528 PMIC. There are four GPIOs
-	  available on the ROHM PMIC in total. The GPIOs can also
-	  generate interrupts.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called gpio-bd70528.
-
 config GPIO_BD71815
 	tristate "ROHM BD71815 PMIC GPIO support"
 	depends on MFD_ROHM_BD71828
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index fbcda637d5e1..dd62fd6e60d2 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -38,7 +38,6 @@ obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+=3D gpio-aspeed-sgpio.o
 obj-$(CONFIG_GPIO_ATH79)		+=3D gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+=3D gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+=3D gpio-xgs-iproc.o
-obj-$(CONFIG_GPIO_BD70528)		+=3D gpio-bd70528.o
 obj-$(CONFIG_GPIO_BD71815)		+=3D gpio-bd71815.o
 obj-$(CONFIG_GPIO_BD71828)		+=3D gpio-bd71828.o
 obj-$(CONFIG_GPIO_BD9571MWV)		+=3D gpio-bd9571mwv.o
diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
deleted file mode 100644
index 397a50d6bc65..000000000000
--- a/drivers/gpio/gpio-bd70528.c
+++ /dev/null
@@ -1,230 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (C) 2018 ROHM Semiconductors
-// gpio-bd70528.c ROHM BD70528MWV gpio driver
-
-#include <linux/gpio/driver.h>
-#include <linux/mfd/rohm-bd70528.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
-
-#define GPIO_IN_REG(offset) (BD70528_REG_GPIO1_IN + (offset) * 2)
-#define GPIO_OUT_REG(offset) (BD70528_REG_GPIO1_OUT + (offset) * 2)
-
-struct bd70528_gpio {
-	struct regmap *regmap;
-	struct device *dev;
-	struct gpio_chip gpio;
-};
-
-static int bd70528_set_debounce(struct bd70528_gpio *bdgpio,
-				unsigned int offset, unsigned int debounce)
-{
-	u8 val;
-
-	switch (debounce) {
-	case 0:
-		val =3D BD70528_DEBOUNCE_DISABLE;
-		break;
-	case 1 ... 15000:
-		val =3D BD70528_DEBOUNCE_15MS;
-		break;
-	case 15001 ... 30000:
-		val =3D BD70528_DEBOUNCE_30MS;
-		break;
-	case 30001 ... 50000:
-		val =3D BD70528_DEBOUNCE_50MS;
-		break;
-	default:
-		dev_err(bdgpio->dev,
-			"Invalid debounce value %u\n", debounce);
-		return -EINVAL;
-	}
-	return regmap_update_bits(bdgpio->regmap, GPIO_IN_REG(offset),
-				 BD70528_DEBOUNCE_MASK, val);
-}
-
-static int bd70528_get_direction(struct gpio_chip *chip, unsigned int offs=
et)
-{
-	struct bd70528_gpio *bdgpio =3D gpiochip_get_data(chip);
-	int val, ret;
-
-	/* Do we need to do something to IRQs here? */
-	ret =3D regmap_read(bdgpio->regmap, GPIO_OUT_REG(offset), &val);
-	if (ret) {
-		dev_err(bdgpio->dev, "Could not read gpio direction\n");
-		return ret;
-	}
-	if (val & BD70528_GPIO_OUT_EN_MASK)
-		return GPIO_LINE_DIRECTION_OUT;
-
-	return GPIO_LINE_DIRECTION_IN;
-}
-
-static int bd70528_gpio_set_config(struct gpio_chip *chip, unsigned int of=
fset,
-				   unsigned long config)
-{
-	struct bd70528_gpio *bdgpio =3D gpiochip_get_data(chip);
-
-	switch (pinconf_to_config_param(config)) {
-	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		return regmap_update_bits(bdgpio->regmap,
-					  GPIO_OUT_REG(offset),
-					  BD70528_GPIO_DRIVE_MASK,
-					  BD70528_GPIO_OPEN_DRAIN);
-		break;
-	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		return regmap_update_bits(bdgpio->regmap,
-					  GPIO_OUT_REG(offset),
-					  BD70528_GPIO_DRIVE_MASK,
-					  BD70528_GPIO_PUSH_PULL);
-		break;
-	case PIN_CONFIG_INPUT_DEBOUNCE:
-		return bd70528_set_debounce(bdgpio, offset,
-					    pinconf_to_config_argument(config));
-		break;
-	default:
-		break;
-	}
-	return -ENOTSUPP;
-}
-
-static int bd70528_direction_input(struct gpio_chip *chip, unsigned int of=
fset)
-{
-	struct bd70528_gpio *bdgpio =3D gpiochip_get_data(chip);
-
-	/* Do we need to do something to IRQs here? */
-	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
-				 BD70528_GPIO_OUT_EN_MASK,
-				 BD70528_GPIO_OUT_DISABLE);
-}
-
-static void bd70528_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			     int value)
-{
-	int ret;
-	struct bd70528_gpio *bdgpio =3D gpiochip_get_data(chip);
-	u8 val =3D (value) ? BD70528_GPIO_OUT_HI : BD70528_GPIO_OUT_LO;
-
-	ret =3D regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
-				 BD70528_GPIO_OUT_MASK, val);
-	if (ret)
-		dev_err(bdgpio->dev, "Could not set gpio to %d\n", value);
-}
-
-static int bd70528_direction_output(struct gpio_chip *chip, unsigned int o=
ffset,
-				    int value)
-{
-	struct bd70528_gpio *bdgpio =3D gpiochip_get_data(chip);
-
-	bd70528_gpio_set(chip, offset, value);
-	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
-				 BD70528_GPIO_OUT_EN_MASK,
-				 BD70528_GPIO_OUT_ENABLE);
-}
-
-#define GPIO_IN_STATE_MASK(offset) (BD70528_GPIO_IN_STATE_BASE << (offset))
-
-static int bd70528_gpio_get_o(struct bd70528_gpio *bdgpio, unsigned int of=
fset)
-{
-	int ret;
-	unsigned int val;
-
-	ret =3D regmap_read(bdgpio->regmap, GPIO_OUT_REG(offset), &val);
-	if (!ret)
-		ret =3D !!(val & BD70528_GPIO_OUT_MASK);
-	else
-		dev_err(bdgpio->dev, "GPIO (out) state read failed\n");
-
-	return ret;
-}
-
-static int bd70528_gpio_get_i(struct bd70528_gpio *bdgpio, unsigned int of=
fset)
-{
-	unsigned int val;
-	int ret;
-
-	ret =3D regmap_read(bdgpio->regmap, BD70528_REG_GPIO_STATE, &val);
-
-	if (!ret)
-		ret =3D !(val & GPIO_IN_STATE_MASK(offset));
-	else
-		dev_err(bdgpio->dev, "GPIO (in) state read failed\n");
-
-	return ret;
-}
-
-static int bd70528_gpio_get(struct gpio_chip *chip, unsigned int offset)
-{
-	int ret;
-	struct bd70528_gpio *bdgpio =3D gpiochip_get_data(chip);
-
-	/*
-	 * There is a race condition where someone might be changing the
-	 * GPIO direction after we get it but before we read the value. But
-	 * application design where GPIO direction may be changed just when
-	 * we read GPIO value would be pointless as reader could not know
-	 * whether the returned high/low state is caused by input or output.
-	 * Or then there must be other ways to mitigate the issue. Thus
-	 * locking would make no sense.
-	 */
-	ret =3D bd70528_get_direction(chip, offset);
-	if (ret =3D=3D GPIO_LINE_DIRECTION_OUT)
-		ret =3D bd70528_gpio_get_o(bdgpio, offset);
-	else if (ret =3D=3D GPIO_LINE_DIRECTION_IN)
-		ret =3D bd70528_gpio_get_i(bdgpio, offset);
-	else
-		dev_err(bdgpio->dev, "failed to read GPIO direction\n");
-
-	return ret;
-}
-
-static int bd70528_probe(struct platform_device *pdev)
-{
-	struct device *dev =3D &pdev->dev;
-	struct bd70528_gpio *bdgpio;
-	int ret;
-
-	bdgpio =3D devm_kzalloc(dev, sizeof(*bdgpio), GFP_KERNEL);
-	if (!bdgpio)
-		return -ENOMEM;
-	bdgpio->dev =3D dev;
-	bdgpio->gpio.parent =3D dev->parent;
-	bdgpio->gpio.label =3D "bd70528-gpio";
-	bdgpio->gpio.owner =3D THIS_MODULE;
-	bdgpio->gpio.get_direction =3D bd70528_get_direction;
-	bdgpio->gpio.direction_input =3D bd70528_direction_input;
-	bdgpio->gpio.direction_output =3D bd70528_direction_output;
-	bdgpio->gpio.set_config =3D bd70528_gpio_set_config;
-	bdgpio->gpio.can_sleep =3D true;
-	bdgpio->gpio.get =3D bd70528_gpio_get;
-	bdgpio->gpio.set =3D bd70528_gpio_set;
-	bdgpio->gpio.ngpio =3D 4;
-	bdgpio->gpio.base =3D -1;
-#ifdef CONFIG_OF_GPIO
-	bdgpio->gpio.of_node =3D dev->parent->of_node;
-#endif
-	bdgpio->regmap =3D dev_get_regmap(dev->parent, NULL);
-	if (!bdgpio->regmap)
-		return -ENODEV;
-
-	ret =3D devm_gpiochip_add_data(dev, &bdgpio->gpio, bdgpio);
-	if (ret)
-		dev_err(dev, "gpio_init: Failed to add bd70528-gpio\n");
-
-	return ret;
-}
-
-static struct platform_driver bd70528_gpio =3D {
-	.driver =3D {
-		.name =3D "bd70528-gpio"
-	},
-	.probe =3D bd70528_probe,
-};
-
-module_platform_driver(bd70528_gpio);
-
-MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
-MODULE_DESCRIPTION("BD70528 voltage regulator driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:bd70528-gpio");
--=20
2.31.1


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

--sPu3AeqMFjAZuYLd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmF6awEACgkQeFA3/03a
ocWDJQgAoZYHtru/v6dFGLLh2qtGIzUdME0X6bH+Bt1bCJ7u2Sr38ggVM+qfhgFf
/m4BBb5bN71mYx9s28OJYzcwISFBBOS2kJfiIhCs6M4DXOei9pL2eeq8eFEzDZdS
VU9fudiDHRlaQkoWJggo1ZzAzGaaSXUCyo83SXzFIaefaeGi0Z1L+FXVCRufGiob
V8Td5GGiByMZF9/IJ9hCoVvetPqZ6I0GxBuYMRhbQlBbUE0GRoQO2y5kNuAz9xyu
n1PZJlBpx7C0+H/8sur62aZnGp3CoogaddHK7O/sg3HF1AfxMwwhbhi0gClg184z
Fh8CB+2BGN7TNrghuk8AWEGhngvF6w==
=k9vI
-----END PGP SIGNATURE-----

--sPu3AeqMFjAZuYLd--
