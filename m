Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0D511A807
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbfLKJrl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:47:41 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40417 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbfLKJrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:47:41 -0500
Received: by mail-lj1-f193.google.com with SMTP id s22so23287139ljs.7;
        Wed, 11 Dec 2019 01:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Nmnmop7c4tpm03nqjbpZphifDl10w7FRjX939hxO2U=;
        b=VYUkFvR3jJsYhnpZ5gzcRqLOfMdzotpI2dnhjr21NAXMRkRcuraRcsDeo21W3ELEQv
         CHGrn16j9XrH/dCti8/YUQZ/CaRI5gXWp4SArJ75m/s/i5QW919lj2pslkZ1HYvenmBv
         tT6soSqel501kQ+yECnUshyGLJPVwm0taqFTwvgJZtZHlNGDUxxJeF9FbYEjAwdy7YoQ
         04dRBBZuTKlVOKpV26OA6hkjUSAXynGElER5XJWVHA43odAdrgN2B4eLEH/Ntij3zgh2
         wT9sIQ819NvaQcr9zw38PBO1FqlNronzccWLwYap7TOtWfzI0e5wugXLgFlN4OqiDmTM
         Zxbg==
X-Gm-Message-State: APjAAAVSRRUa7xT0aGV7r5/eokTUs9w+f7bvUuOBXwT1aBDE3QqqeYSj
        3B5BgOVNy9+TqHwGSUHufJs=
X-Google-Smtp-Source: APXvYqxOYJCSevhtr6F0jisIMljU5aGhdvZJk+Pi3xApCteDz0krKDYyYIloBq6xde0TBapjF+lAYw==
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr1381093ljj.243.1576057657544;
        Wed, 11 Dec 2019 01:47:37 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id h24sm791994ljc.84.2019.12.11.01.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:47:36 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:47:30 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v6 10/15] gpio: devres: Add devm_gpiod_get_parent_array
Message-ID: <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
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

Changes since v5:
- renamed internal function (no __ - prefixes for Linus :] )

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/gpio/gpiolib-devres.c                 | 65 ++++++++++++++-----
 include/linux/gpio/consumer.h                 |  5 ++
 3 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 13046fcf0a5d..f5d3594b29b8 100644
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
index 4421be09b960..affec50adb8d 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -255,19 +255,11 @@ struct gpio_desc *__must_check devm_gpiod_get_index_optional(struct device *dev,
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
+devm_gpiod_get_array_common(struct device *gpiodev,
+			    struct device *managed,
+			    const char *con_id,
+			    enum gpiod_flags flags)
 {
 	struct gpio_descs **dr;
 	struct gpio_descs *descs;
@@ -277,19 +269,62 @@ struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
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
+	return devm_gpiod_get_array_common(dev, NULL, con_id, flags);
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
+	return devm_gpiod_get_array_common(dev->parent, dev, con_id, flags);
+}
+EXPORT_SYMBOL_GPL(devm_gpiod_get_parent_array);
+
 /**
  * devm_gpiod_get_array_optional - Resource-managed gpiod_get_array_optional()
  * @dev:	GPIO consumer
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 5215fdba6b9a..ff0558492645 100644
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
