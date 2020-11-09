Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533E82AC667
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 21:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbgKIUxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 15:53:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:59643 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730267AbgKIUxz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 15:53:55 -0500
IronPort-SDR: KF3TpUCWdr6WlOyhsu5biokIxKOfkUgQe8YSPRNMWEuOGKmzEE1clLhEZ7sxrrIRelHsgyNKJU
 DYD689eBpZ9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170022472"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="170022472"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 12:53:52 -0800
IronPort-SDR: PsLLLMhOVSsiU6HO2yLRApNEn/xYVbzlTQ8+BnLIw0Jv/YtMtmxXyZrEo2xUyAoFheT4zuu/kr
 toADRW2MGt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="355843048"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2020 12:53:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 46F075D4; Mon,  9 Nov 2020 22:53:48 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 10/17] gpiolib: acpi: Use named item for enum gpiod_flags variable
Date:   Mon,  9 Nov 2020 22:53:25 +0200
Message-Id: <20201109205332.19592-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use named item instead of plain integer for enum gpiod_flags
to make it clear that even 0 has its own meaning.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 3a39e8a93226..c127b410a7a2 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1136,7 +1136,7 @@ acpi_gpiochip_parse_own_gpio(struct acpi_gpio_chip *achip,
 	int ret;
 
 	*lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	*dflags = 0;
+	*dflags = GPIOD_ASIS;
 	*name = NULL;
 
 	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios,
-- 
2.28.0

