Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B092FFF51A
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2019 20:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfKPTAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Nov 2019 14:00:11 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41050 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfKPTAK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2019 14:00:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id m4so9307076ljj.8;
        Sat, 16 Nov 2019 11:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Xc3aXfj5fKknG0fOd3dvmuUOV3F4urul9om4+Tw3L8=;
        b=TAHAzRyGKdwAL4yACYTNXNkGkxtY+Bz58wKkUHHTyLncrT2em7VLaRtGInIR4n6VYF
         dP9Yl1LKXXPtawmgJ+/5ro9JFWXBkGrpdb4ngh9SWyCVt3rU+vIhmYX4dN76j74cP+0e
         xWWuiBDRPyj5nybemqrCqEO7hXIrPRgvzkhyzhyi2lrCm6Wh3FDaUFft0nBeZImKr7rE
         nBDavR7drv5mGLe7NxyjIJjjn8ByvLOxyzwyyBcJufeobi/y1pst13qCGTn6o0KyyOHB
         NbjEBDBe27qINKGTQtxDjxjBVej+7mx1CwokbtxOQTEtIiqnPcC39uwtRI8GsgZElnC1
         oBPQ==
X-Gm-Message-State: APjAAAV70i6GPYUQZR9phJaYTv9Y8b34nWhoV9HXKjqWBaPlRu3Pg0Ts
        6E+Y5iYyVLK19vdlbwEOOnM=
X-Google-Smtp-Source: APXvYqxf1ROh2OHh+5pCl6lQjVTwQ1L0tT7JD9qxxsNPzrZnyyfHdZk/Xgwu3TAGZjRbrjjAuW3LBg==
X-Received: by 2002:a2e:9106:: with SMTP id m6mr15758141ljg.146.1573930806996;
        Sat, 16 Nov 2019 11:00:06 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id l21sm5707187lji.46.2019.11.16.11.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 11:00:06 -0800 (PST)
Date:   Sat, 16 Nov 2019 20:59:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v4 10/16] gpio: devres: Add devm_gpiod_get_parent_array
Message-ID: <8dd9dad2765d47fd6c6fec20566326d00e48a696.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bunch of MFD sub-devices which are instantiated by MFD do not have
own device-tree nodes but have (for example) the GPIO consumer
information in parent device's DT node. Add resource managed
devm_gpiod_get_array() for such devices so that they can get the
consumer information from parent DT while still binding the GPIO
reservation life-time to this sub-device life time.

If devm_gpiod_get_array is used as such - then unloading and then
re-loading the child device fails as the GPIOs reserved during first
load are not freed when driver for sub-device is unload (if parent
stays there).

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/gpio/gpiolib-devres.c                 | 65 ++++++++++++++-----
 include/linux/gpio/consumer.h                 |  5 ++
 3 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index a100bef54952..1b8302ba405b 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -270,6 +270,7 @@ GPIO
   devm_gpiod_get_index()
   devm_gpiod_get_index_optional()
   devm_gpiod_get_optional()
+  devm_gpiod_get_parent_array()
   devm_gpiod_put()
   devm_gpiod_unhinge()
   devm_gpiochip_add_data()
diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 98e3c20d9730..584fa6edfd20 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -270,19 +270,11 @@ struct gpio_desc *__must_check devm_gpiod_get_index_optional(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_get_index_optional);
 
-/**
- * devm_gpiod_get_array - Resource-managed gpiod_get_array()
- * @dev:	GPIO consumer
- * @con_id:	function within the GPIO consumer
- * @flags:	optional GPIO initialization flags
- *
- * Managed gpiod_get_array(). GPIO descriptors returned from this function are
- * automatically disposed on driver detach. See gpiod_get_array() for detailed
- * information about behavior and return values.
- */
-struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
-						     const char *con_id,
-						     enum gpiod_flags flags)
+static struct gpio_descs *__must_check
+__devm_gpiod_get_array(struct device *gpiodev,
+		       struct device *managed,
+		       const char *con_id,
+		       enum gpiod_flags flags)
 {
 	struct gpio_descs **dr;
 	struct gpio_descs *descs;
@@ -292,19 +284,62 @@ struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
 	if (!dr)
 		return ERR_PTR(-ENOMEM);
 
-	descs = gpiod_get_array(dev, con_id, flags);
+	descs = gpiod_get_array(gpiodev, con_id, flags);
 	if (IS_ERR(descs)) {
 		devres_free(dr);
 		return descs;
 	}
 
 	*dr = descs;
-	devres_add(dev, dr);
+	if (managed)
+		devres_add(managed, dr);
+	else
+		devres_add(gpiodev, dr);
 
 	return descs;
 }
+
+/**
+ * devm_gpiod_get_array - Resource-managed gpiod_get_array()
+ * @dev:	GPIO consumer
+ * @con_id:	function within the GPIO consumer
+ * @flags:	optional GPIO initialization flags
+ *
+ * Managed gpiod_get_array(). GPIO descriptors returned from this function are
+ * automatically disposed on driver detach. See gpiod_get_array() for detailed
+ * information about behavior and return values.
+ */
+struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
+						     const char *con_id,
+						     enum gpiod_flags flags)
+{
+	return __devm_gpiod_get_array(dev, NULL, con_id, flags);
+}
 EXPORT_SYMBOL_GPL(devm_gpiod_get_array);
 
+/**
+ * devm_gpiod_get_parent_array - Resource-managed gpiod_get_array for subdevices
+ * @dev:	Managed device whose parent is the GPIO consumer
+ * @con_id:	function within the GPIO consumer
+ * @flags:	optional GPIO initialization flags
+ *
+ * Managed gpiod_get_array() for subdevices. This function is intended to be
+ * used by MFD sub-devices whose GPIO bindings are in parent (MFD) device but
+ * whose GPIO reservation should last only for the dub-device life time.
+ * Returns EINVAL if no parent device is found. Rest of the behaviour and
+ * return values are as documented for gpiod_get_array()
+ */
+struct gpio_descs *__must_check
+devm_gpiod_get_parent_array(struct device *dev,
+			    const char *con_id,
+			    enum gpiod_flags flags)
+{
+	if (!dev | !dev->parent)
+		return ERR_PTR(-EINVAL);
+	return __devm_gpiod_get_array(dev->parent, dev, con_id, flags);
+}
+EXPORT_SYMBOL_GPL(devm_gpiod_get_parent_array);
+
 /**
  * devm_gpiod_get_array_optional - Resource-managed gpiod_get_array_optional()
  * @dev:	GPIO consumer
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index b70af921c614..01a82b1c6828 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -103,6 +103,11 @@ struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
 struct gpio_descs *__must_check
 devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
 			      enum gpiod_flags flags);
+struct gpio_descs *__must_check
+devm_gpiod_get_parent_array(struct device *dev,
+			    const char *con_id,
+			    enum gpiod_flags flags);
+
 void devm_gpiod_put(struct device *dev, struct gpio_desc *desc);
 void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc);
 void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs);
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
