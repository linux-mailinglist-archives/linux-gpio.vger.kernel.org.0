Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE2138AC01
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 13:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238649AbhETLcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 07:32:06 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:44742 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241981AbhETL3v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 07:29:51 -0400
Received: by mail-lf1-f52.google.com with SMTP id j6so21299209lfr.11;
        Thu, 20 May 2021 04:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NABjH9mhLGUTJZ1B1wVw40uqQXDgbe7ohEozQt28Ijw=;
        b=hEXnj8NHqHHqimrz/o4LcTg/9wxdWyxIKqiPMxlA9HmgdgHZvdcQEfXJIMiSf2sgSY
         KuF59eakFXeVh2EZRp1CydKN99qmP7qP7/P+kPzfQ5dU6guYlk3mtx12yXATXkNiBRKj
         oN4k8kS58RqQRVK0KP5kDG5ofn3F6CjeeJ4Km3XwPoiG+02QF+Ssnx0tt9CN03NCteL3
         KRZpVut/UtTCMsuI4cUjJs30O4+E3WIXBC6dKbatVl1++GYFrq90TZwiuB007zdkOlPF
         43J7eE+cNOnsKYGEdYjKz1vIaA+A0MqalB1hpyPyBOGaXVtMfANPepYmViNUZmQ/8mzf
         wUgQ==
X-Gm-Message-State: AOAM532/0a4M5OtJyrBnB6vG75H33jgon6K8uXki7oWfdfZ8DudO+94k
        AeBIsYfojqC/TBzQ5EBUoPk=
X-Google-Smtp-Source: ABdhPJzDYNyphgHQ173kl+pG4fSUC3kqNxaY08KcogcWxHXYdEzc2JECql+4kPD513XUMrSKATWZUw==
X-Received: by 2002:a05:6512:34c7:: with SMTP id w7mr3178479lfr.82.1621510107771;
        Thu, 20 May 2021 04:28:27 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id m4sm244855ljc.20.2021.05.20.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 04:28:27 -0700 (PDT)
Date:   Thu, 20 May 2021 14:28:20 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH 1/2] gpio: regmap: Support few IC specific operations
Message-ID: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The set_config and init_valid_mask GPIO operations are usually very IC
specific. Allow IC drivers to provide these custom operations at
gpio-regmap registration.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-regmap.c  | 49 +++++++++++++++++++++++++++++++++++++
 include/linux/gpio/regmap.h | 13 ++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..315285cacd3f 100644
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
@@ -39,6 +43,43 @@ static unsigned int gpio_regmap_addr(unsigned int addr)
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
+
+	if (!gpio->init_valid_mask) {
+		WARN_ON(!gpio->init_valid_mask);
+		return -EINVAL;
+	}
+
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
+
+	if (!gpio->set_config) {
+		WARN_ON(!gpio->set_config);
+		return -EINVAL;
+	}
+
+	drvdata =3D gpio_regmap_get_drvdata(gpio);
+
+	return gpio->set_config(gpio->regmap, drvdata, offset, config);
+}
+
 static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
 				    unsigned int base, unsigned int offset,
 				    unsigned int *reg, unsigned int *mask)
@@ -235,6 +276,8 @@ struct gpio_regmap *gpio_regmap_register(const struct g=
pio_regmap_config *config
 	gpio->reg_clr_base =3D config->reg_clr_base;
 	gpio->reg_dir_in_base =3D config->reg_dir_in_base;
 	gpio->reg_dir_out_base =3D config->reg_dir_out_base;
+	gpio->set_config =3D config->set_config;
+	gpio->init_valid_mask =3D config->init_valid_mask;
=20
 	/* if not set, assume there is only one register */
 	if (!gpio->ngpio_per_reg)
@@ -253,6 +296,10 @@ struct gpio_regmap *gpio_regmap_register(const struct =
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
@@ -280,6 +327,8 @@ struct gpio_regmap *gpio_regmap_register(const struct g=
pio_regmap_config *config
 		chip->direction_output =3D gpio_regmap_direction_output;
 	}
=20
+	gpio_regmap_set_drvdata(gpio, config->drvdata);
+
 	ret =3D gpiochip_add_data(chip, gpio);
 	if (ret < 0)
 		goto err_free_gpio;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..c382a3caefc3 100644
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
@@ -74,10 +82,15 @@ struct gpio_regmap_config {
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

base-commit: d07f6ca923ea0927a1024dfccafc5b53b61cfecc
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

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCmR8cACgkQeFA3/03a
ocVAswgAkw7xOXvkNG9rtzm11OqfzrlRhjBHC3YJoImTegb5eAt5V5UsUMD774uY
hwOCCCbjqISb0sk+IUzECycgVhnStTDJ1a85ygj5Nq0v6ZP/x4gaVhGSxdzCpeSc
4rIt7oD+Y+z8kVmUpm9p3NLgPW/KAwOrpQv6l98BVK8u6Ixs5/lwSX4rcWQGm6Mz
otEXdwDF76GHnwbd+si69cq0aQknA6ksS4rduBsH6MPGKoSiq+1kJQVNLGuJfy5i
Q+Tc++fboiRAAA2JQpgDEVCVfWOp9OpKdBDEnW+jvT5ILOV0XF5/KZmbzAfPFsXZ
NOsiCvrlM0exxYm/wi5bpDEIixcz5A==
=dcmP
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
