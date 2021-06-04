Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32A739C3A3
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jun 2021 01:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhFDXD2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 19:03:28 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:57883 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFDXD2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 19:03:28 -0400
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de [77.23.133.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B9E582224D;
        Sat,  5 Jun 2021 01:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622847698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ADrXaqp0+MMaJtBSueG99bAjGWTUIKt3XWo1eTmSkvk=;
        b=Jg3klmP5rAGWw5nCoiV3Jsf+P3TUlk3kOqqgmFXI+Md63UWlPY9P2XWiCi42ajPS4N1iif
        GcLdM6dmJXRKPvWevO8yBRmy2uA0luRLmhjRbdcZ3FHGd/vd30lu0fcCxPpISQ8U/TKSIR
        OgZBv19cmVyHoZmFspr5aEOrPT4G2kM=
From:   Michael Walle <michael@walle.cc>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2] gpio: regmap: move drvdata to config data
Date:   Sat,  5 Jun 2021 00:58:57 +0200
Message-Id: <20210604225857.18694-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop gpio_regmap_set_drvdata() and instead add it to the configuration
data passed to gpio_regmap_register().

gpio_regmap_set_drvdata() can't really be used in a race free way. This
is because the gpio_regmap object which is needed by _set_drvdata() is
returned by gpio_regmap_register(). On the other hand, the callbacks
which use the drvdata might already be called right after the
gpiochip_add() call in gpio_regmap_register(). Therefore, we have to
provide the drvdata early before we call gpiochip_add().

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
changes since v1:
 - added Matti's Sob

 drivers/gpio/gpio-regmap.c  | 7 +------
 include/linux/gpio/regmap.h | 6 +++++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..583cd1cdead8 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -178,12 +178,6 @@ static int gpio_regmap_direction_output(struct gpio_chip *chip,
 	return gpio_regmap_set_direction(chip, offset, true);
 }
 
-void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
-{
-	gpio->driver_data = data;
-}
-EXPORT_SYMBOL_GPL(gpio_regmap_set_drvdata);
-
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 {
 	return gpio->driver_data;
@@ -226,6 +220,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 		return ERR_PTR(-ENOMEM);
 
 	gpio->parent = config->parent;
+	gpio->driver_data = config->drvdata;
 	gpio->regmap = config->regmap;
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	gpio->reg_stride = config->reg_stride;
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..a9f7b7faf57b 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -37,6 +37,9 @@ struct regmap;
  *			offset to a register/bitmask pair. If not
  *			given the default gpio_regmap_simple_xlate()
  *			is used.
+ * @drvdata:		(Optional) Pointer to driver specific data which is
+ *			not used by gpio-remap but is provided "as is" to the
+ *			driver callback(s).
  *
  * The ->reg_mask_xlate translates a given base address and GPIO offset to
  * register and mask pair. The base address is one of the given register
@@ -78,13 +81,14 @@ struct gpio_regmap_config {
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
 			      unsigned int offset, unsigned int *reg,
 			      unsigned int *mask);
+
+	void *drvdata;
 };
 
 struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config);
 void gpio_regmap_unregister(struct gpio_regmap *gpio);
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
 					      const struct gpio_regmap_config *config);
-void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data);
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
 
 #endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.20.1

