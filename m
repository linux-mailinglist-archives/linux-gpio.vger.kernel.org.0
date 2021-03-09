Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AE3332212
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 10:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCIJh6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 04:37:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:43063 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhCIJhl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Mar 2021 04:37:41 -0500
IronPort-SDR: Ry/Sf24IzWpYMHkJHlwEryvNVq7qmY/fnWvmYc3wkwrncwg2QtVRO2xoOWUDzpphk59YQaXCmI
 rcQ6lt23SowA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188240933"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="188240933"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 01:37:40 -0800
IronPort-SDR: 5B9uJ4FbXNqRvB+2m0JkeVbnJXwMNOl1v+uc2PPGp8wmRlRUUdtQUlW7T2EmxeF2vSyl7YGp9Q
 z3vzH3gi/Bew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="408581527"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 09 Mar 2021 01:37:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7D52E56B; Tue,  9 Mar 2021 11:37:38 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Cc:     Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v6 4/6] gpiolib: Introduce acpi_gpio_dev_init() and call it from core
Date:   Tue,  9 Mar 2021 11:37:34 +0200
Message-Id: <20210309093736.67925-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309093736.67925-1-andriy.shevchenko@linux.intel.com>
References: <20210309093736.67925-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the ACPI case we may use the firmware node in the similar way
as it's done for OF case. We may use that fwnode for other purposes
in the future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 7 +++++++
 drivers/gpio/gpiolib-acpi.h | 4 ++++
 drivers/gpio/gpiolib.c      | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 1aacd2a5a1fd..21750be9c489 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1291,6 +1291,13 @@ void acpi_gpiochip_remove(struct gpio_chip *chip)
 	kfree(acpi_gpio);
 }
 
+void acpi_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev)
+{
+	/* Set default fwnode to parent's one if present */
+	if (gc->parent)
+		ACPI_COMPANION_SET(&gdev->dev, ACPI_COMPANION(gc->parent));
+}
+
 static int acpi_gpio_package_count(const union acpi_object *obj)
 {
 	const union acpi_object *element = obj->package.elements;
diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index e2edb632b2cc..e476558d9471 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -36,6 +36,8 @@ struct acpi_gpio_info {
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
 
+void acpi_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev);
+
 void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
 
@@ -58,6 +60,8 @@ int acpi_gpio_count(struct device *dev, const char *con_id);
 static inline void acpi_gpiochip_add(struct gpio_chip *chip) { }
 static inline void acpi_gpiochip_remove(struct gpio_chip *chip) { }
 
+static inline void acpi_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev) { }
+
 static inline void
 acpi_gpiochip_request_interrupts(struct gpio_chip *chip) { }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 41a57f042843..1853075df741 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -590,6 +590,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gc->gpiodev = gdev;
 
 	of_gpio_dev_init(gc, gdev);
+	acpi_gpio_dev_init(gc, gdev);
 
 	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
 	if (gdev->id < 0) {
-- 
2.30.1

