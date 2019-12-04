Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2A31128F9
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 11:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfLDKLD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 05:11:03 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:56706 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfLDKLD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 05:11:03 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 679B727E1511;
        Wed,  4 Dec 2019 11:11:02 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id tSwZYGviSU2Y; Wed,  4 Dec 2019 11:11:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1AC4827E1512;
        Wed,  4 Dec 2019 11:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1AC4827E1512
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575454262;
        bh=joVXQs8//R5Z6umVbn9rOFDYdh3oQu8E9e6vflv1fyA=;
        h=From:To:Date:Message-Id;
        b=oEK30dCBNu6Ow1RpCSLoon07shB0WGxeW4tYhzI3fwE6tW6D6DcMhLofLJCBM/8I5
         +HvmwrRx7rawqFQovjK5bak/OchpmHshSDkicwRRlc2rT1JdeuOl1jiQA+hr5ZbzXD
         QBDnA9JmznfGZkbd3gMpo3wxlL2tGD8dPexa/lwQ=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id C8aqRTfkIny3; Wed,  4 Dec 2019 11:11:02 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id F307227E1511;
        Wed,  4 Dec 2019 11:11:01 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Clement Leger <cleger@kalray.eu>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/5] gpio: export acpi_gpiochip_request_interrupts in gpio/driver.h
Date:   Wed,  4 Dec 2019 11:10:35 +0100
Message-Id: <20191204101042.4275-2-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

dwapb-gpio driver which uses this function will be moved to pinctrl for
pinctrl support. Export this function in gpio/driver.h to allow using
it.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/gpio/gpiolib-acpi.h |  4 ----
 include/linux/gpio/driver.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
index 1c6d65cf0629..ba2f187babe3 100644
--- a/drivers/gpio/gpiolib-acpi.h
+++ b/drivers/gpio/gpiolib-acpi.h
@@ -34,7 +34,6 @@ struct acpi_gpio_info {
 void acpi_gpiochip_add(struct gpio_chip *chip);
 void acpi_gpiochip_remove(struct gpio_chip *chip);
 
-void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
 
 int acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags,
@@ -56,9 +55,6 @@ int acpi_gpio_count(struct device *dev, const char *con_id);
 static inline void acpi_gpiochip_add(struct gpio_chip *chip) { }
 static inline void acpi_gpiochip_remove(struct gpio_chip *chip) { }
 
-static inline void
-acpi_gpiochip_request_interrupts(struct gpio_chip *chip) { }
-
 static inline void
 acpi_gpiochip_free_interrupts(struct gpio_chip *chip) { }
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e2480ef94c55..40b9f13d77e1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -733,6 +733,18 @@ void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 
+
+#ifdef CONFIG_GPIO_ACPI
+
+void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
+
+#else
+
+static inline void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
+{
+}
+
+#endif /* CONFIG_GPIO_ACPI */
 #else /* CONFIG_GPIOLIB */
 
 static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
-- 
2.15.0.276.g89ea799

