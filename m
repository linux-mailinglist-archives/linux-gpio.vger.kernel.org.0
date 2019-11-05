Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03FDF070A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbfKEUgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:03 -0500
Received: from mga04.intel.com ([192.55.52.120]:41970 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727095AbfKEUgD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="376818796"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Nov 2019 12:36:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B0ECF115; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/7] gpiolib: No need to call gpiochip_remove_pin_ranges() twice
Date:   Tue,  5 Nov 2019 22:35:52 +0200
Message-Id: <20191105203557.78562-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

of_gpiochip_add(), when fails, calls gpiochip_remove_pin_ranges().

ADD:
  gpiochip_add_data_with_key() ->
    of_gpiochip_add() -> (ERROR path)
      gpiochip_remove_pin_ranges()

At the same time of_gpiochip_remove() calls exactly the above mentioned
function unconditionally and so does gpiochip_remove().

REMOVE:
  gpiochip_remove() ->
    gpiochip_remove_pin_ranges()
    of_gpiochip_remove() ->
      gpiochip_remove_pin_ranges()

Since gpiochip_remove() calls gpiochip_remove_pin_ranges() unconditionally,
we have duplicate call to the same function when it's not necessary.

Move gpiochip_remove_pin_ranges() from of_gpiochip_add() to gpiochip_add()
to avoid duplicate calls and be consistent with the explicit call in
gpiochip_remove().

Fixes: e93fa3f24353 ("gpiolib: remove duplicate pin range code")
Depends-on: f7299d441a4d ("gpio: of: Fix of_gpiochip_add() error path")
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c | 5 +----
 drivers/gpio/gpiolib.c    | 3 ++-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0380a1d6b660..bd06743a5d7c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -885,16 +885,13 @@ int of_gpiochip_add(struct gpio_chip *chip)
 	of_node_get(chip->of_node);
 
 	ret = of_gpiochip_scan_gpios(chip);
-	if (ret) {
+	if (ret)
 		of_node_put(chip->of_node);
-		gpiochip_remove_pin_ranges(chip);
-	}
 
 	return ret;
 }
 
 void of_gpiochip_remove(struct gpio_chip *chip)
 {
-	gpiochip_remove_pin_ranges(chip);
 	of_node_put(chip->of_node);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a13f656c3034..aaf9c0a74c38 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1448,6 +1448,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
 err_free_gpiochip_mask:
+	gpiochip_remove_pin_ranges(chip);
 	gpiochip_free_valid_mask(chip);
 err_remove_from_list:
 	spin_lock_irqsave(&gpio_lock, flags);
@@ -1503,8 +1504,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	gdev->chip = NULL;
 	gpiochip_irqchip_remove(chip);
 	acpi_gpiochip_remove(chip);
-	gpiochip_remove_pin_ranges(chip);
 	of_gpiochip_remove(chip);
+	gpiochip_remove_pin_ranges(chip);
 	gpiochip_free_valid_mask(chip);
 	/*
 	 * We accept no more calls into the driver from this point, so
-- 
2.24.0.rc1

