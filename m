Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E4B383D53
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhEQT37 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbhEQT35 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:29:57 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10B2C06138A
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 12:28:39 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 16B581FFBF8;
        Mon, 17 May 2021 21:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3q6JoyXSrkPLBoFuPy3yaThUjOXJKmAlTPeZBosKKkc=;
        b=LOwGCCu/IYFbqsbTPoCSb6E3ENeTVgct/Tp56oZZsi4aw3g2F2GfVsTOvZRdkH9I0hmKHe
        gl+3TCr1Gkgm4EtEss/qK+deBP77YIWotFro6JAJz5cyK4SEnZ+n1vJ2QTivkFlC8qqlgW
        2TjiMNXD2Aip7vvnPzDnPoTCAHGJgPhV+cAmGIAto/FR1wtR5PMU9zdHV4vyMB3dczsmHH
        6PXBXkdm3EynCku/qOZrFwSqg4AHS/unJQNXy7d6eu4hi+PYtKWrALkj5cyjtYGWVMKFiQ
        2fGkh44iFv+Bt+6X7p2DWw4mOj3m40NKLS64QUJC6glwjecb62OK9GBTgFPHOw==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
Date:   Mon, 17 May 2021 21:28:04 +0200
Message-Id: <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621279162.git.sander@svanheule.net>
References: <cover.1621279162.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO chips may not support setting the output value when a pin is
configured as an input, although the current implementation assumes this
is always possible.

Add support for setting pin direction before value. The order defaults
to setting the value first, but this can be reversed by setting the
regmap_config.no_set_on_input flag, similar to the corresponding flag in
the gpio-mmio driver.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/gpio/gpio-regmap.c  | 20 +++++++++++++++++---
 include/linux/gpio/regmap.h |  3 +++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 134cedf151a7..1cdb20f8f8b4 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -170,14 +170,25 @@ static int gpio_regmap_direction_input(struct gpio_chip *chip,
 	return gpio_regmap_set_direction(chip, offset, false);
 }
 
-static int gpio_regmap_direction_output(struct gpio_chip *chip,
-					unsigned int offset, int value)
+static int gpio_regmap_dir_out_val_first(struct gpio_chip *chip,
+					 unsigned int offset, int value)
 {
 	gpio_regmap_set(chip, offset, value);
 
 	return gpio_regmap_set_direction(chip, offset, true);
 }
 
+static int gpio_regmap_dir_out_dir_first(struct gpio_chip *chip,
+					 unsigned int offset, int value)
+{
+	int err;
+
+	err = gpio_regmap_set_direction(chip, offset, true);
+	gpio_regmap_set(chip, offset, value);
+
+	return err;
+}
+
 void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
 {
 	gpio->driver_data = data;
@@ -277,7 +288,10 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
 		chip->get_direction = gpio_regmap_get_direction;
 		chip->direction_input = gpio_regmap_direction_input;
-		chip->direction_output = gpio_regmap_direction_output;
+		if (config->no_set_on_input)
+			chip->direction_output = gpio_regmap_dir_out_dir_first;
+		else
+			chip->direction_output = gpio_regmap_dir_out_val_first;
 	}
 
 	ret = gpiochip_add_data(chip, gpio);
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 334dd928042b..2a732f8f23be 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -30,6 +30,8 @@ struct regmap;
  * @reg_dir_out_base:	(Optional) out setting register base address
  * @reg_stride:		(Optional) May be set if the registers (of the
  *			same type, dat, set, etc) are not consecutive.
+ * @no_set_on_input:	Set if output value can only be set when the direction
+ *			is configured as output.
  * @ngpio_per_reg:	Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
  *			interrupt-capable
@@ -73,6 +75,7 @@ struct gpio_regmap_config {
 	unsigned int reg_dir_out_base;
 	int reg_stride;
 	int ngpio_per_reg;
+	bool no_set_on_input;
 	struct irq_domain *irq_domain;
 
 	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
-- 
2.31.1

