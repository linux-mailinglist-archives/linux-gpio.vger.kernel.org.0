Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF3F16BFD2
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2020 12:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgBYLrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Feb 2020 06:47:31 -0500
Received: from mga01.intel.com ([192.55.52.88]:26635 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729510AbgBYLrb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Feb 2020 06:47:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 03:47:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="255927002"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2020 03:47:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 578283F4; Tue, 25 Feb 2020 13:47:26 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Optimize gpiochip_remove() when check for requested line
Date:   Tue, 25 Feb 2020 13:47:25 +0200
Message-Id: <20200225114725.839-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here are the following optimizations have been done:
 - break the loop after first found requested line
  - due to above, drop redundant boolean variable
 - replace open coded variant of gpiochip_is_requested()
  - due to above, drop redundant pointer to struct gpio_desc
 - use 'unsigned int' instead of 'unsigned' for loop counter

Note, pointer to struct gpio_chip followed by pointer to struct gpio_device
is still valid, back link is not.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 26fe775e4bab..c98902a13f6f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1819,10 +1819,8 @@ EXPORT_SYMBOL_GPL(gpiochip_get_data);
 void gpiochip_remove(struct gpio_chip *chip)
 {
 	struct gpio_device *gdev = chip->gpiodev;
-	struct gpio_desc *desc;
 	unsigned long	flags;
-	unsigned	i;
-	bool		requested = false;
+	unsigned int	i;
 
 	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
 	gpiochip_sysfs_unregister(gdev);
@@ -1842,13 +1840,12 @@ void gpiochip_remove(struct gpio_chip *chip)
 
 	spin_lock_irqsave(&gpio_lock, flags);
 	for (i = 0; i < gdev->ngpio; i++) {
-		desc = &gdev->descs[i];
-		if (test_bit(FLAG_REQUESTED, &desc->flags))
-			requested = true;
+		if (gpiochip_is_requested(chip, i))
+			break;
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	if (requested)
+	if (i == gdev->ngpio)
 		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
-- 
2.25.0

