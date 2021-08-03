Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0053DF404
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 19:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238334AbhHCRjQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 13:39:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:34917 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238332AbhHCRjQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Aug 2021 13:39:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="200933717"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="200933717"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 10:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="441268539"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2021 10:38:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 717C3169; Tue,  3 Aug 2021 20:39:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v1 1/1] gpiolib: Deduplicate forward declaration in the consumer.h header
Date:   Tue,  3 Aug 2021 20:39:25 +0300
Message-Id: <20210803173925.57216-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

struct acpi_device is repeated in two branches of ifdeffery.
Move it out and hence deduplicate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/consumer.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 566feb56601f..414b8f98d70f 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -680,10 +680,10 @@ struct acpi_gpio_mapping {
 	unsigned int quirks;
 };
 
-#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_ACPI)
-
 struct acpi_device;
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_ACPI)
+
 int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios);
 void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
@@ -696,8 +696,6 @@ struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label);
 
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
-struct acpi_device;
-
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
-- 
2.30.2

