Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2240FD1494
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731514AbfJIQv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:51:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:29515 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731192AbfJIQvZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 12:51:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 09:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="218688244"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 09 Oct 2019 09:51:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A749E312; Wed,  9 Oct 2019 19:51:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/5] gpiolib: Initialize the hardware with a callback
Date:   Wed,  9 Oct 2019 19:50:53 +0300
Message-Id: <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After changing the drivers to use GPIO core to add an IRQ chip
it appears that some of them requires a hardware initialization
before adding the IRQ chip.

Add an optional callback ->init_hw() to allow that drivers
to initialize hardware if needed.

This change is a part of the fix NULL pointer dereference
brought to the several drivers recently.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c      | 22 +++++++++++++++++++++-
 include/linux/gpio/driver.h |  8 ++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bdbc1649eafa..85601ad4fcd5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -86,6 +86,7 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 				struct lock_class_key *lock_key,
 				struct lock_class_key *request_key);
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
+static int gpiochip_irqchip_init_hw(struct gpio_chip *gpiochip);
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip);
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip);
 
@@ -1406,6 +1407,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	machine_gpiochip_add(chip);
 
+	ret = gpiochip_irqchip_init_hw(chip);
+	if (ret)
+		goto err_remove_acpi_chip;
+
 	ret = gpiochip_irqchip_init_valid_mask(chip);
 	if (ret)
 		goto err_remove_acpi_chip;
@@ -1622,6 +1627,16 @@ static struct gpio_chip *find_chip_by_name(const char *name)
  * The following is irqchip helper code for gpiochips.
  */
 
+static int gpiochip_irqchip_init_hw(struct gpio_chip *gc)
+{
+	struct gpio_irq_chip *girq = &gc->irq;
+
+	if (!girq->init_hw)
+		return 0;
+
+	return girq->init_hw(gc);
+}
+
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gc)
 {
 	struct gpio_irq_chip *girq = &gc->irq;
@@ -2446,8 +2461,13 @@ static inline int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 {
 	return 0;
 }
-
 static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
+
+static inline int gpiochip_irqchip_init_hw(struct gpio_chip *gpiochip)
+{
+	return 0;
+}
+
 static inline int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 {
 	return 0;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f8245d67f070..5dd9c982e2cb 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -201,6 +201,14 @@ struct gpio_irq_chip {
 	 */
 	bool threaded;
 
+	/**
+	 * @init_hw: optional routine to initialize hardware before
+	 * an IRQ chip will be added. This is quite useful when
+	 * a particular driver wants to clear IRQ related registers
+	 * in order to avoid undesired events.
+	 */
+	int (*init_hw)(struct gpio_chip *chip);
+
 	/**
 	 * @init_valid_mask: optional routine to initialize @valid_mask, to be
 	 * used if not all GPIO lines are valid interrupts. Sometimes some
-- 
2.23.0

