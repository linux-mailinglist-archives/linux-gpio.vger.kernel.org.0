Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE6338BF48
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 08:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhEUG3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 02:29:17 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:42766 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhEUG3Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 02:29:16 -0400
Received: by mail-lj1-f169.google.com with SMTP id t17so5924703ljd.9;
        Thu, 20 May 2021 23:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=99R0cjHc7I0/1EYgrL6Vl+4Tcdvbw54tuyXPnybM6q8=;
        b=kj1SmDmSnxO+EZSAOhJWhMIV3LTZydKWIkirITNb9J8Yrlc4DnfA/muyMCqHOcrLSL
         7Dvti86ULOOh5hveaevYwDVJ5K7jERY4JTjGXQzV26AhXM4w+Eqo76YPNBQvDpRumF9U
         NOwywMdJXW2efIgtK/Y67bym8Yc00Vw7dKHzcW9Ui/a2bBCosmuUBHCnQO8tp8zoXqQH
         farlKrYx2co/Um2M8jXzUvZ2x3yE9qGk8Tt/kgFvuBtkT53nXs7XwRiDhA681TuXwUkt
         xluJCt62PpWGOqaV8H6dn1sRvrO8qQVfLg0GYd8FsQdPSKb4e91neZTHznb6wcWzAQBI
         J9Vg==
X-Gm-Message-State: AOAM532uwxdGn+KpaZD+uxGc4Ypm7rmk2skiDcZLfbr1cyRAudkW4BHt
        tI26SbYiY3dz2QjPeCUq75s=
X-Google-Smtp-Source: ABdhPJw6HKcqxPIghyZlWrR7rxA9c27F98cKgasvvpYfaV5Yr8WxUZM7+tOG8yl73yj7vVLXdCmbHw==
X-Received: by 2002:a05:651c:210:: with SMTP id y16mr5677914ljn.386.1621578472082;
        Thu, 20 May 2021 23:27:52 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::3])
        by smtp.gmail.com with ESMTPSA id r10sm523863lfc.4.2021.05.20.23.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 23:27:51 -0700 (PDT)
Date:   Fri, 21 May 2021 09:27:45 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v2 1/3] gpio: regmap: Support few IC specific operations
Message-ID: <6e319c22b41747e3911c7a5cad877134cabc9231.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The set_config and init_valid_mask GPIO operations are usually very IC
specific. Allow IC drivers to provide these custom operations at
gpio-regmap registration.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
Changelog v2: (based on suggestions by Michael Walle)
  - drop gpio_regmap_set_drvdata()
  - drop checks and WARN() for pretty much impossible cases
---
 drivers/gpio/gpio-regmap.c  | 42 +++++++++++++++++++++++++++++++------
 include/linux/gpio/regmap.h | 14 ++++++++++++-
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..c05370e984b9 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -27,6 +27,10 @@ struct gpio_regmap {
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
+	int (*set_config)(struct regmap *regmap, void *drvdata,
+			  unsigned int offset, unsigned long config);
+	int (*init_valid_mask)(struct regmap *regmap, void *drvdata,
+				unsigned long *valid_mask, unsigned int ngpios);
=20
 	void *driver_data;
 };
@@ -39,6 +43,31 @@ static unsigned int gpio_regmap_addr(unsigned int addr)
 	return addr;
 }
=20
+static int regmap_gpio_init_valid_mask(struct gpio_chip *gc,
+					unsigned long *valid_mask,
+					unsigned int ngpios)
+{
+	struct gpio_regmap *gpio;
+	void *drvdata;
+
+	gpio =3D gpiochip_get_data(gc);
+	drvdata =3D gpio_regmap_get_drvdata(gpio);
+
+	return gpio->init_valid_mask(gpio->regmap, drvdata, valid_mask, ngpios);
+}
+
+static int gpio_regmap_set_config(struct gpio_chip *gc, unsigned int offse=
t,
+				  unsigned long config)
+{
+	struct gpio_regmap *gpio;
+	void *drvdata;
+
+	gpio =3D gpiochip_get_data(gc);
+	drvdata =3D gpio_regmap_get_drvdata(gpio);
+
+	return gpio->set_config(gpio->regmap, drvdata, offset, config);
+}
+
 static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
 				    unsigned int base, unsigned int offset,
 				    unsigned int *reg, unsigned int *mask)
@@ -178,12 +207,6 @@ static int gpio_regmap_direction_output(struct gpio_ch=
ip *chip,
 	return gpio_regmap_set_direction(chip, offset, true);
 }
=20
-void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
-{
-	gpio->driver_data =3D data;
-}
-EXPORT_SYMBOL_GPL(gpio_regmap_set_drvdata);
-
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 {
 	return gpio->driver_data;
@@ -235,6 +258,9 @@ struct gpio_regmap *gpio_regmap_register(const struct g=
pio_regmap_config *config
 	gpio->reg_clr_base =3D config->reg_clr_base;
 	gpio->reg_dir_in_base =3D config->reg_dir_in_base;
 	gpio->reg_dir_out_base =3D config->reg_dir_out_base;
+	gpio->driver_data =3D config->drvdata;
+	gpio->set_config =3D config->set_config;
+	gpio->init_valid_mask =3D config->init_valid_mask;
=20
 	/* if not set, assume there is only one register */
 	if (!gpio->ngpio_per_reg)
@@ -253,6 +279,10 @@ struct gpio_regmap *gpio_regmap_register(const struct =
gpio_regmap_config *config
 	chip->ngpio =3D config->ngpio;
 	chip->names =3D config->names;
 	chip->label =3D config->label ?: dev_name(config->parent);
+	if (gpio->set_config)
+		chip->set_config =3D gpio_regmap_set_config;
+	if (gpio->init_valid_mask)
+		chip->init_valid_mask =3D regmap_gpio_init_valid_mask;
=20
 #if defined(CONFIG_OF_GPIO)
 	/* gpiolib will use of_node of the parent if chip->of_node is NULL */
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..96ab3151db96 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -33,10 +33,18 @@ struct regmap;
  * @ngpio_per_reg:	Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
  *			interrupt-capable
+ * @drvdata:		(Optional) Pointer to IC specific data which is
+ *			not used by gpio-remap but is provided "as is" to
+ *			the driver callback(s).
+ *
  * @reg_mask_xlate:     (Optional) Translates base address and GPIO
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @set_config:		(Optional) hook for all kinds of settings. Uses
+ *			the same packed config format as generic pinconf.
+ * @init_valid_mask:	(Optional) routine to initialize @valid_mask, to
+ *			be used if not all GPIOs are valid.
  *
  * The ->reg_mask_xlate translates a given base address and GPIO offset to
  * register and mask pair. The base address is one of the given register
@@ -74,17 +82,21 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
+	void *drvdata;
=20
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
+	int (*set_config)(struct regmap *regmap, void *drvdata,
+			  unsigned int offset, unsigned long config);
+	int (*init_valid_mask)(struct regmap *regmap, void *drvdata,
+				unsigned long *valid_mask, unsigned int ngpios);
 };
=20
 struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *=
config);
 void gpio_regmap_unregister(struct gpio_regmap *gpio);
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
 					      const struct gpio_regmap_config *config);
-void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data);
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
=20
 #endif /* _LINUX_GPIO_REGMAP_H */
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

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCnUuEACgkQeFA3/03a
ocWgfAf/Za0770rzW1myi6VSI9c7cZFGl7e63216ugFA98EQQ6iGboDNkeZ8rXJG
HQXvdm3Wtpm8EFha5Ujk0usS2n1oIqA3ghHffuKxYqpgMNGANZDmxVfIDYgQaIpg
Ke9FjwQEHKZo8q7XQklUu95tW49sBarDPz8SmEY7TMXZSNaL4ZDJV5DGhO5WLzIp
atRDMlC9yQFKm1JqHcYkcLsI/Mm7zTZhSu8guE5HBf3RBtfX0toh3+G8RiiHFpau
RJ1H9/sjRfAdXrbYguBo0AB9nOME+jMpsNrjcEMnG3R/GRb6dzSnzWL8ZqjfMPDr
A7R/mjbX0pGQBNSAmhVyO+9krdqd3g==
=2+JO
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
