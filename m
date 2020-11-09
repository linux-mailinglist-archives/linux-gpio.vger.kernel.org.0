Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433112AC66C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729872AbgKIUx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:41852 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730267AbgKIUx4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:56 -0500
IronPort-SDR: 9CDB7/mEtINOc0ogRgAKpwyix0Pr9Svu4xw08hBmntEDg0WmlwOu2tb1gMe8MdyRbmWn56DEMh
 SaPHY06aohTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169982899"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="169982899"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:53 -0800
IronPort-SDR: zdxcbJD593UB+B0+1qTc8NZG8VHx8tIIpYw9qVs5gc4rXMkxLAd78D3zE50bFVvazFF8G2JKIt
 2FuyG0e5hj4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="398408064"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 09 Nov 2020 12:53:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1127027E; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 04/17] gpiolib: Add temporary variable to gpiod_set_transitory() for cleaner code
Date:   Mon,  9 Nov 2020 22:53:19 +0200
Message-Id: <20201109205332.19592-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Temporary variable that keeps mode allows to neat the code a bit.
It will also help for the future changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 87bb73991337..134f11a84b91 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2374,6 +2374,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_debounce);
  */
 int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 {
+	enum pin_config_param mode = PIN_CONFIG_PERSIST_STATE;
 	struct gpio_chip *gc;
 	unsigned long packed;
 	int gpio;
@@ -2391,8 +2392,7 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
 	if (!gc->set_config)
 		return 0;
 
-	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
-					  !transitory);
+	packed = pinconf_to_config_packed(mode, !transitory);
 	gpio = gpio_chip_hwgpio(desc);
 	rc = gpio_do_set_config(gc, gpio, packed);
 	if (rc == -ENOTSUPP) {
-- 
2.28.0

