Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B801B4EBE1
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 17:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfFUPXd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 11:23:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50344 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfFUPXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Jun 2019 11:23:33 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so6707620wmf.0;
        Fri, 21 Jun 2019 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYdHlhCEUTnl8ApLz3+hFaUyEhAI3ET9jir63bQq53k=;
        b=V6e3HCzh15Q+Ufg++HWoyt41v7UbHWVsVeBKZKqU0IrFH/ou2KbKP6LRyIfrJJum1L
         HCLOTdqWPLJSbPhfbXLV1s0L5W3W6wOZYtRyM9oKk5b8R8uUJDAc88j1w9K5sM6b02lN
         rfXfiESyv+/G1FsC1HTMu5NbPUqcjhlBDf23JpoVABssMBCLBD2t9N1xlv7v3YXCDvFg
         PKS8S3PdL47MhwzcOl4yejVVdfm7LOTaj9EbESHp5BQSCMDsDI0JIN1HOHp8QzkNgFp0
         HiIrMi0EOhSYlSNKZQWeqfGe9X58oVvNBMsTwx3Vv7ws0uZ1Vo8hLu3vCmNmhZIHiNnp
         42Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oYdHlhCEUTnl8ApLz3+hFaUyEhAI3ET9jir63bQq53k=;
        b=VFHGIbzwA6Iwwnz9vZvpPyN0Ic1d/9vaqJGME59O3WbzQCAtNszTk7BXsjlcWDi8I3
         dKUHeLbkCBA2WRQ564JFL7BwofMUXbhnsnatv/ejeMGBE5bWzIsGVfWcg0krxDRsX/bQ
         +Pv01wlOGKRncclKue/tZJ3ISYyaoy6D1/GR/5K0r+RNjFsbF0J6da3go3NzgH8uPEnx
         qkdD5tzXUJDtHcUAOYIrKTgOI8Q1y8hGPAfIYWZAuZwn+Kx6M1rG6VAffFGJxNzREUpU
         ZLHSvecja6vIGTXD24ne4Tb9IBLjmZAIC0SMVePJGdFb1S4b7LXNY/K9rJ7/a8TWSqts
         yY+g==
X-Gm-Message-State: APjAAAWw/ROLNTpL724nY4jxG/A8ntmsQJTEyZ4QI7fu8qrKI8Wz4lLc
        ueBMVoQ9D6QPEtsxK9/c6bdZDgW24U4=
X-Google-Smtp-Source: APXvYqymxLvM7bHWcOCASJsJUpCuxCg6+NbOtyEB0fEGY7JSoRFEz+r5wkxXbBGMgOoqcNi8EmkXUw==
X-Received: by 2002:a1c:e341:: with SMTP id a62mr4703960wmh.165.1561130610601;
        Fri, 21 Jun 2019 08:23:30 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id i128sm2552621wmi.16.2019.06.21.08.23.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:23:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: Add device link support
Date:   Fri, 21 Jun 2019 17:23:29 +0200
Message-Id: <20190621152329.21072-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Create a device link between a GPIO consumer and the GPIO supplier (i.e.
the GPIO chip's parent). This makes the driver core aware of the
dependency between the two devices so that it can properly order the
suspend/resume sequence.

As a side-effect the GPIO consumer will be force unloaded when the GPIO
supplier goes away, which prevents the consumer from accessing dangling
GPIOs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib-devres.c |  4 ++++
 drivers/gpio/gpiolib.c        | 20 +++++++++++++++++++-
 drivers/gpio/gpiolib.h        |  2 ++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 0acc2cc6e868..0092feec9a5a 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -177,6 +177,8 @@ struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	gpiod_add_device_link(desc, dev);
+
 	*dr = desc;
 	devres_add(dev, dr);
 
@@ -234,6 +236,8 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 		return desc;
 	}
 
+	gpiod_add_device_link(desc, dev);
+
 	*dr = desc;
 	devres_add(dev, dr);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 71cd685ed6c4..bd793038ba36 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4160,6 +4160,20 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	return status;
 }
 
+void gpiod_add_device_link(struct gpio_desc *desc, struct device *consumer)
+{
+	struct device_link *link;
+
+	link = device_link_add(consumer, desc->gdev->dev.parent,
+			       DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!link) {
+		dev_err(consumer, "failed to create device link to %s\n",
+			dev_name(desc->gdev->dev.parent));
+	} else {
+		desc->consumer = consumer;
+	}
+}
+
 /**
  * gpiod_get_index - obtain a GPIO from a multi-index GPIO function
  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
@@ -4242,6 +4256,8 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		return ERR_PTR(status);
 	}
 
+	gpiod_add_device_link(desc, dev);
+
 	return desc;
 }
 EXPORT_SYMBOL_GPL(gpiod_get_index);
@@ -4625,8 +4641,10 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_optional);
  */
 void gpiod_put(struct gpio_desc *desc)
 {
-	if (desc)
+	if (desc) {
+		device_link_remove(desc->consumer, desc->gdev->dev.parent);
 		gpiod_free(desc);
+	}
 }
 EXPORT_SYMBOL_GPL(gpiod_put);
 
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 7a65dad43932..ed1488aedce0 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -215,6 +215,7 @@ extern struct list_head gpio_devices;
 
 struct gpio_desc {
 	struct gpio_device	*gdev;
+	struct device		*consumer;
 	unsigned long		flags;
 /* flag symbols are bit numbers */
 #define FLAG_REQUESTED	0
@@ -241,6 +242,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
 int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		unsigned long lflags, enum gpiod_flags dflags);
+void gpiod_add_device_link(struct gpio_desc *desc, struct device *consumer);
 int gpiod_hog(struct gpio_desc *desc, const char *name,
 		unsigned long lflags, enum gpiod_flags dflags);
 
-- 
2.21.0

