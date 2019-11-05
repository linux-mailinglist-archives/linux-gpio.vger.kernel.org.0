Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25353F070B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbfKEUgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:03 -0500
Received: from mga05.intel.com ([192.55.52.43]:56275 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729594AbfKEUgD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="205105301"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2019 12:36:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BFF4E189; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/7] gpiolib: Introduce ->add_pin_ranges() callback
Date:   Tue,  5 Nov 2019 22:35:53 +0200
Message-Id: <20191105203557.78562-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When IRQ chip is being added by GPIO library, the ACPI based platform expects
GPIO <-> pin mapping ranges to be initialized in order to correctly initialize
ACPI event mechanism on affected platforms. Unfortunately this step is missed.

Introduce ->add_pin_ranges() callback to fill the above mentioned gap.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c      | 12 ++++++++++++
 include/linux/gpio/driver.h |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aaf9c0a74c38..f888e46f0e93 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -390,6 +390,14 @@ static void gpiochip_free_valid_mask(struct gpio_chip *gpiochip)
 	gpiochip->valid_mask = NULL;
 }
 
+static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
+{
+	if (gc->add_pin_ranges)
+		return gc->add_pin_ranges(gc);
+
+	return 0;
+}
+
 bool gpiochip_line_is_valid(const struct gpio_chip *gpiochip,
 				unsigned int offset)
 {
@@ -1407,6 +1415,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		}
 	}
 
+	ret = gpiochip_add_pin_ranges(chip);
+	if (ret)
+		goto err_remove_of_chip;
+
 	acpi_gpiochip_add(chip);
 
 	machine_gpiochip_add(chip);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index fd860c553ff4..424d03770b26 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -287,6 +287,9 @@ struct gpio_irq_chip {
  *	state (such as pullup/pulldown configuration).
  * @init_valid_mask: optional routine to initialize @valid_mask, to be used if
  *	not all GPIOs are valid.
+ * @add_pin_ranges: optional routine to initialize pin ranges, to be used when
+ *	requires special mapping of the pins that provides GPIO functionality.
+ *	It is called after adding GPIO chip and before adding IRQ chip.
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
@@ -377,6 +380,8 @@ struct gpio_chip {
 						   unsigned long *valid_mask,
 						   unsigned int ngpios);
 
+	int			(*add_pin_ranges)(struct gpio_chip *chip);
+
 	int			base;
 	u16			ngpio;
 	const char		*const *names;
-- 
2.24.0.rc1

