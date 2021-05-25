Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409BA390130
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 14:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhEYMpj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 08:45:39 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:44799 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhEYMpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 08:45:38 -0400
Received: by mail-lj1-f181.google.com with SMTP id s25so37917580ljo.11;
        Tue, 25 May 2021 05:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I6upucyzdujRrxbXcYTyjzRBNcSLHuixBi+1X5XaI/g=;
        b=ZfbsOgzF22lWr/L4a3S9kwgyyd4nB4Pxl7S9n2XO/O5ro7wEdPd/ttOHfme6D9XIQO
         uwdMq9yPl+K4brau9s7XflA7DVsU9kUiTEETRsd/c8SwS/1yfTgTJbfzgc1jmwDGgLWC
         lm+sLIiS5QAeDtZFWIVGeNYn5NwnxEEjYYB4JADl7PQh+HX8Iwipuhg8HXVgeMF4A7Wc
         LqF95IP+J7PkBMINQoK5IPDH6r6x6XEcp7XQKsQm4ZP60gugpfyujqZGcLlvhlSjDt73
         RMgMgDimOELx+q53k3OIfoSTsbIaB4KsXfqwa2wY7m9l91RTX1CSeCFhx+Pl+1PYHIEY
         fTSw==
X-Gm-Message-State: AOAM5300Av079gI3bVgVtfJsoSy0QwuX9gdTesU1dE69v5LqG3WCSflL
        nljZjJOg+bAfpD1+q34a6fA=
X-Google-Smtp-Source: ABdhPJzqzH/vH9FNMs5DYzteSgmp0G0azARV6QkoFJcdNtK4dbwtWt8lj51NpafGk7Whl5LdHBcPWA==
X-Received: by 2002:a2e:8086:: with SMTP id i6mr20235461ljg.135.1621946646510;
        Tue, 25 May 2021 05:44:06 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id r19sm1727352lfi.246.2021.05.25.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:44:05 -0700 (PDT)
Date:   Tue, 25 May 2021 15:43:59 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v3 1/3] gpio: regmap: Support few IC specific operations
Message-ID: <116225e2cee20a8ad793f775c5d98aa4d24318d4.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <cover.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The set_config and init_valid_mask GPIO operations are usually very IC
specific. Allow IC drivers to provide these custom operations at
gpio-regmap registration.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
Changelog v3:

IC drivers which need to implement some own GPIO operations are
likely to need data that is provided in gpio-regmap config. Divide
gpio-regmap in GPIO core specific (gpio_chip, ops and internal
book-keeping if any) and public configurations which can be given
(as read-only data) to IC drivers.

Re-use the gpio_regmap_config struct and pass it as such to IC driver
call-backs to avoid polluting interface and IC drivers with small

Changelog v2: (based on suggestions by Michael Walle)
  - drop gpio_regmap_set_drvdata()
  - drop checks and WARN() for pretty much impossible cases
---
 drivers/gpio/gpio-regmap.c  | 189 +++++++++++++++++++++---------------
 include/linux/gpio/regmap.h |  51 +++++++---
 2 files changed, 145 insertions(+), 95 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..4f0903d1acd5 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -12,23 +12,13 @@
 #include <linux/regmap.h>
=20
 struct gpio_regmap {
-	struct device *parent;
-	struct regmap *regmap;
+	struct gpio_regmap_config config;
+	struct gpio_regmap_ops *ops;
 	struct gpio_chip gpio_chip;
=20
-	int reg_stride;
-	int ngpio_per_reg;
-	unsigned int reg_dat_base;
-	unsigned int reg_set_base;
-	unsigned int reg_clr_base;
-	unsigned int reg_dir_in_base;
-	unsigned int reg_dir_out_base;
-
-	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-			      unsigned int offset, unsigned int *reg,
-			      unsigned int *mask);
-
-	void *driver_data;
+	int (*reg_mask_xlate)(const struct gpio_regmap_config *config,
+			      unsigned int base, unsigned int offset,
+			      unsigned int *reg, unsigned int *mask);
 };
=20
 static unsigned int gpio_regmap_addr(unsigned int addr)
@@ -39,14 +29,35 @@ static unsigned int gpio_regmap_addr(unsigned int addr)
 	return addr;
 }
=20
-static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
+static int regmap_gpio_init_valid_mask(struct gpio_chip *gc,
+					unsigned long *valid_mask,
+					unsigned int ngpios)
+{
+	struct gpio_regmap *gpio;
+
+	gpio =3D gpiochip_get_data(gc);
+
+	return gpio->ops->init_valid_mask(&gpio->config, valid_mask, ngpios);
+}
+
+static int gpio_regmap_set_config(struct gpio_chip *gc, unsigned int offse=
t,
+				  unsigned long config)
+{
+	struct gpio_regmap *gpio;
+
+	gpio =3D gpiochip_get_data(gc);
+
+	return gpio->ops->set_config(&gpio->config, offset, config);
+}
+
+static int gpio_regmap_simple_xlate(const struct gpio_regmap_config *confi=
g,
 				    unsigned int base, unsigned int offset,
 				    unsigned int *reg, unsigned int *mask)
 {
-	unsigned int line =3D offset % gpio->ngpio_per_reg;
-	unsigned int stride =3D offset / gpio->ngpio_per_reg;
+	unsigned int line =3D offset % config->ngpio_per_reg;
+	unsigned int stride =3D offset / config->ngpio_per_reg;
=20
-	*reg =3D base + stride * gpio->reg_stride;
+	*reg =3D base + stride * config->reg_stride;
 	*mask =3D BIT(line);
=20
 	return 0;
@@ -55,20 +66,21 @@ static int gpio_regmap_simple_xlate(struct gpio_regmap =
*gpio,
 static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
+	struct gpio_regmap_config *config =3D &gpio->config;
 	unsigned int base, val, reg, mask;
 	int ret;
=20
 	/* we might not have an output register if we are input only */
-	if (gpio->reg_dat_base)
-		base =3D gpio_regmap_addr(gpio->reg_dat_base);
+	if (config->reg_dat_base)
+		base =3D gpio_regmap_addr(config->reg_dat_base);
 	else
-		base =3D gpio_regmap_addr(gpio->reg_set_base);
+		base =3D gpio_regmap_addr(config->reg_set_base);
=20
-	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret =3D gpio->reg_mask_xlate(config, base, offset, &reg, &mask);
 	if (ret)
 		return ret;
=20
-	ret =3D regmap_read(gpio->regmap, reg, &val);
+	ret =3D regmap_read(config->regmap, reg, &val);
 	if (ret)
 		return ret;
=20
@@ -79,53 +91,56 @@ static void gpio_regmap_set(struct gpio_chip *chip, uns=
igned int offset,
 			    int val)
 {
 	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
-	unsigned int base =3D gpio_regmap_addr(gpio->reg_set_base);
+	struct gpio_regmap_config *config =3D &gpio->config;
+	unsigned int base =3D gpio_regmap_addr(config->reg_set_base);
 	unsigned int reg, mask;
=20
-	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	gpio->reg_mask_xlate(config, base, offset, &reg, &mask);
 	if (val)
-		regmap_update_bits(gpio->regmap, reg, mask, mask);
+		regmap_update_bits(config->regmap, reg, mask, mask);
 	else
-		regmap_update_bits(gpio->regmap, reg, mask, 0);
+		regmap_update_bits(config->regmap, reg, mask, 0);
 }
=20
 static void gpio_regmap_set_with_clear(struct gpio_chip *chip,
 				       unsigned int offset, int val)
 {
 	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
+	struct gpio_regmap_config *config =3D &gpio->config;
 	unsigned int base, reg, mask;
=20
 	if (val)
-		base =3D gpio_regmap_addr(gpio->reg_set_base);
+		base =3D gpio_regmap_addr(config->reg_set_base);
 	else
-		base =3D gpio_regmap_addr(gpio->reg_clr_base);
+		base =3D gpio_regmap_addr(config->reg_clr_base);
=20
-	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
-	regmap_write(gpio->regmap, reg, mask);
+	gpio->reg_mask_xlate(config, base, offset, &reg, &mask);
+	regmap_write(config->regmap, reg, mask);
 }
=20
 static int gpio_regmap_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
 	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
+	struct gpio_regmap_config *config =3D &gpio->config;
 	unsigned int base, val, reg, mask;
 	int invert, ret;
=20
-	if (gpio->reg_dir_out_base) {
-		base =3D gpio_regmap_addr(gpio->reg_dir_out_base);
+	if (config->reg_dir_out_base) {
+		base =3D gpio_regmap_addr(config->reg_dir_out_base);
 		invert =3D 0;
-	} else if (gpio->reg_dir_in_base) {
-		base =3D gpio_regmap_addr(gpio->reg_dir_in_base);
+	} else if (config->reg_dir_in_base) {
+		base =3D gpio_regmap_addr(config->reg_dir_in_base);
 		invert =3D 1;
 	} else {
 		return -EOPNOTSUPP;
 	}
=20
-	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret =3D gpio->reg_mask_xlate(config, base, offset, &reg, &mask);
 	if (ret)
 		return ret;
=20
-	ret =3D regmap_read(gpio->regmap, reg, &val);
+	ret =3D regmap_read(config->regmap, reg, &val);
 	if (ret)
 		return ret;
=20
@@ -139,20 +154,21 @@ static int gpio_regmap_set_direction(struct gpio_chip=
 *chip,
 				     unsigned int offset, bool output)
 {
 	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
+	struct gpio_regmap_config *config =3D &gpio->config;
 	unsigned int base, val, reg, mask;
 	int invert, ret;
=20
-	if (gpio->reg_dir_out_base) {
-		base =3D gpio_regmap_addr(gpio->reg_dir_out_base);
+	if (config->reg_dir_out_base) {
+		base =3D gpio_regmap_addr(config->reg_dir_out_base);
 		invert =3D 0;
-	} else if (gpio->reg_dir_in_base) {
-		base =3D gpio_regmap_addr(gpio->reg_dir_in_base);
+	} else if (config->reg_dir_in_base) {
+		base =3D gpio_regmap_addr(config->reg_dir_in_base);
 		invert =3D 1;
 	} else {
 		return -EOPNOTSUPP;
 	}
=20
-	ret =3D gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	ret =3D gpio->reg_mask_xlate(config, base, offset, &reg, &mask);
 	if (ret)
 		return ret;
=20
@@ -161,7 +177,7 @@ static int gpio_regmap_set_direction(struct gpio_chip *=
chip,
 	else
 		val =3D output ? mask : 0;
=20
-	return regmap_update_bits(gpio->regmap, reg, mask, val);
+	return regmap_update_bits(config->regmap, reg, mask, val);
 }
=20
 static int gpio_regmap_direction_input(struct gpio_chip *chip,
@@ -178,25 +194,18 @@ static int gpio_regmap_direction_output(struct gpio_c=
hip *chip,
 	return gpio_regmap_set_direction(chip, offset, true);
 }
=20
-void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
-{
-	gpio->driver_data =3D data;
-}
-EXPORT_SYMBOL_GPL(gpio_regmap_set_drvdata);
-
-void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
-{
-	return gpio->driver_data;
-}
-EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
-
 /**
  * gpio_regmap_register() - Register a generic regmap GPIO controller
- * @config: configuration for gpio_regmap
+ * @config:	configuration for gpio_regmap
+ * @ops:	Provide pointer IC specific functions to handle needs where
+ *		the standard gpio_regmap does not provide generic functions
+ *		or provided functions do not fit the IC. Can be set NULL if
+ *		no IC specific operations are required.
  *
  * Return: A pointer to the registered gpio_regmap or ERR_PTR error value.
  */
-struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *=
config)
+struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *=
config,
+					 const struct gpio_regmap_ops *ops)
 {
 	struct gpio_regmap *gpio;
 	struct gpio_chip *chip;
@@ -225,26 +234,40 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
 	if (!gpio)
 		return ERR_PTR(-ENOMEM);
=20
-	gpio->parent =3D config->parent;
-	gpio->regmap =3D config->regmap;
-	gpio->ngpio_per_reg =3D config->ngpio_per_reg;
-	gpio->reg_stride =3D config->reg_stride;
-	gpio->reg_mask_xlate =3D config->reg_mask_xlate;
-	gpio->reg_dat_base =3D config->reg_dat_base;
-	gpio->reg_set_base =3D config->reg_set_base;
-	gpio->reg_clr_base =3D config->reg_clr_base;
-	gpio->reg_dir_in_base =3D config->reg_dir_in_base;
-	gpio->reg_dir_out_base =3D config->reg_dir_out_base;
+	gpio->config =3D *config;
+	if (ops) {
+		/*
+		 * We could avoid ops struct allocation if just the
+		 * xlate is given as it is used directly from gpio_regmap.
+		 * I don't think that optimization is worth the hassle as
+		 * there may not be many cases with custom xlate and no other
+		 * ops. We can change this if I am wrong.
+		 */
+		gpio->ops =3D kzalloc(sizeof(*ops), GFP_KERNEL);
+		if (!gpio->ops) {
+			ret =3D -ENOMEM;
+			goto err_free_gpio;
+		}
+		*gpio->ops =3D *ops;
+	}
=20
 	/* if not set, assume there is only one register */
-	if (!gpio->ngpio_per_reg)
-		gpio->ngpio_per_reg =3D config->ngpio;
+	if (!gpio->config.ngpio_per_reg)
+		gpio->config.ngpio_per_reg =3D config->ngpio;
=20
 	/* if not set, assume they are consecutive */
-	if (!gpio->reg_stride)
-		gpio->reg_stride =3D 1;
+	if (!gpio->config.reg_stride)
+		gpio->config.reg_stride =3D 1;
=20
-	if (!gpio->reg_mask_xlate)
+	/*
+	 * Dublicate the reg_mask_xlate to gpio_regmap so we don't need to
+	 * always check if ops is populated and reg_mask_xlate is given
+	 * - or allocate whole ops struct just for unconditional
+	 * reg_mask_xlate if no ops are required.
+	 */
+	if (ops && ops->reg_mask_xlate)
+		gpio->reg_mask_xlate =3D ops->reg_mask_xlate;
+	else
 		gpio->reg_mask_xlate =3D gpio_regmap_simple_xlate;
=20
 	chip =3D &gpio->gpio_chip;
@@ -253,7 +276,12 @@ struct gpio_regmap *gpio_regmap_register(const struct =
gpio_regmap_config *config
 	chip->ngpio =3D config->ngpio;
 	chip->names =3D config->names;
 	chip->label =3D config->label ?: dev_name(config->parent);
-
+	if (gpio->ops) {
+		if (gpio->ops->set_config)
+			chip->set_config =3D gpio_regmap_set_config;
+		if (gpio->ops->init_valid_mask)
+			chip->init_valid_mask =3D regmap_gpio_init_valid_mask;
+	}
 #if defined(CONFIG_OF_GPIO)
 	/* gpiolib will use of_node of the parent if chip->of_node is NULL */
 	chip->of_node =3D to_of_node(config->fwnode);
@@ -269,12 +297,12 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
 	chip->can_sleep =3D true;
=20
 	chip->get =3D gpio_regmap_get;
-	if (gpio->reg_set_base && gpio->reg_clr_base)
+	if (gpio->config.reg_set_base && gpio->config.reg_clr_base)
 		chip->set =3D gpio_regmap_set_with_clear;
-	else if (gpio->reg_set_base)
+	else if (gpio->config.reg_set_base)
 		chip->set =3D gpio_regmap_set;
=20
-	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
+	if (gpio->config.reg_dir_in_base || gpio->config.reg_dir_out_base) {
 		chip->get_direction =3D gpio_regmap_get_direction;
 		chip->direction_input =3D gpio_regmap_direction_input;
 		chip->direction_output =3D gpio_regmap_direction_output;
@@ -295,6 +323,7 @@ struct gpio_regmap *gpio_regmap_register(const struct g=
pio_regmap_config *config
 err_remove_gpiochip:
 	gpiochip_remove(chip);
 err_free_gpio:
+	kfree(gpio->ops);
 	kfree(gpio);
 	return ERR_PTR(ret);
 }
@@ -307,6 +336,7 @@ EXPORT_SYMBOL_GPL(gpio_regmap_register);
 void gpio_regmap_unregister(struct gpio_regmap *gpio)
 {
 	gpiochip_remove(&gpio->gpio_chip);
+	kfree(gpio->ops);
 	kfree(gpio);
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
@@ -328,7 +358,8 @@ static void devm_gpio_regmap_unregister(struct device *=
dev, void *res)
  * Return: A pointer to the registered gpio_regmap or ERR_PTR error value.
  */
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
-					      const struct gpio_regmap_config *config)
+					      const struct gpio_regmap_config *config,
+					      const struct gpio_regmap_ops *ops)
 {
 	struct gpio_regmap **ptr, *gpio;
=20
@@ -337,7 +368,7 @@ struct gpio_regmap *devm_gpio_regmap_register(struct de=
vice *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
=20
-	gpio =3D gpio_regmap_register(config);
+	gpio =3D gpio_regmap_register(config, ops);
 	if (!IS_ERR(gpio)) {
 		*ptr =3D gpio;
 		devres_add(dev, ptr);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..ba1a4b14969b 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -6,12 +6,39 @@
 struct device;
 struct fwnode_handle;
 struct gpio_regmap;
+struct gpio_regmap_config;
 struct irq_domain;
 struct regmap;
=20
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
=20
+/**
+ * struct gpio_regmap_ops - Custom operations for regmap_gpio.
+ * @reg_mask_xlate:     Translates base address and GPIO
+ *			offset to a register/bitmask pair. If not given the
+ *			default gpio_regmap_simple_xlate() is used.
+ * @set_config:		Hook for all kinds of settings. Uses the same packed
+ *			config format as generic pinconf.
+ * @init_valid_mask:	Routine to initialize @valid_mask, to be used if not
+ *			all GPIOs are valid.
+ *
+ * Provide ustom operations for the regmap_gpio controller where the
+ * standard regmap_gpio operations are insufficient.
+ * The ->reg_mask_xlate translates a given base address and GPIO offset to
+ * register and mask pair. The base address is one of the given register
+ * base addresses in the gpio_regmap_config structure.
+ */
+struct gpio_regmap_ops {
+	int (*reg_mask_xlate)(const struct gpio_regmap_config *config,
+			      unsigned int base, unsigned int offset,
+			      unsigned int *reg, unsigned int *mask);
+	int (*set_config)(const struct gpio_regmap_config *regmap_config,
+			  unsigned int offset, unsigned long config);
+	int (*init_valid_mask)(const struct gpio_regmap_config *config,
+			       unsigned long *valid_mask, unsigned int ngpios);
+};
+
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
@@ -33,14 +60,9 @@ struct regmap;
  * @ngpio_per_reg:	Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
  *			interrupt-capable
- * @reg_mask_xlate:     (Optional) Translates base address and GPIO
- *			offset to a register/bitmask pair. If not
- *			given the default gpio_regmap_simple_xlate()
- *			is used.
- *
- * The ->reg_mask_xlate translates a given base address and GPIO offset to
- * register and mask pair. The base address is one of the given register
- * base addresses in this structure.
+ * @drvdata:		(Optional) Pointer to IC specific data which is
+ *			not used by gpio-remap but is provided "as is" to
+ *			the driver callback(s).
  *
  * Although all register base addresses are marked as optional, there are
  * several rules:
@@ -74,17 +96,14 @@ struct gpio_regmap_config {
 	int reg_stride;
 	int ngpio_per_reg;
 	struct irq_domain *irq_domain;
-
-	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-			      unsigned int offset, unsigned int *reg,
-			      unsigned int *mask);
+	void *drvdata;
 };
=20
-struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *=
config);
+struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *=
config,
+					 const struct gpio_regmap_ops *ops);
 void gpio_regmap_unregister(struct gpio_regmap *gpio);
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
-					      const struct gpio_regmap_config *config);
-void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data);
-void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
+					      const struct gpio_regmap_config *config,
+					      const struct gpio_regmap_ops *ops);
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

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCs8Q8ACgkQeFA3/03a
ocWhpAf/WWHpGnLhJyMsKBxbBoO/qvrQuHT5ZHFpk/iXCyRzeEfMi59cbf0oAmH+
SiW8Sh7RldajaPd7eDoFOrtyaYxRpWIq9QVIudTtKtVR17toLlbm6NvgO2aHXTAn
UOz7Usm8L6mnZrK7u04kRNVAWrc7JHT1f0qgukE/SSJxZCC5BxvnP3/QBN1jl2P9
uNdcKz/6lI3p3naNbv+ERujTwHWjcZ8/IKjR9u1CbqfBiAqMfsg8ej+ob36UJ5bU
ZG3FAfPXebgfq+sGMptP4N1kMlE1pgdWgp5vM3z6yD0YPW3LpnLUkxqa8lhUVoVS
wkjmtWDNoM7cXtvJ4baPGtM8E690qg==
=nJ7G
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
