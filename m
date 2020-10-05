Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73B52833B0
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 11:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgJEJ43 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 05:56:29 -0400
Received: from mga18.intel.com ([134.134.136.126]:45504 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgJEJ42 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Oct 2020 05:56:28 -0400
IronPort-SDR: KQFmHhU5RXgTzWM/nOC5j+behuIjjZqWJDc5khlWCzjxITdAwC8neUEPT+D9K5fxB95QLoA1L3
 tq7N56Whh7Ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="151152490"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="151152490"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 02:56:26 -0700
IronPort-SDR: PjSN4Icg4hWUsyqhu/o6ImkIoEEdeiEfN1naXmZlnYWudfwQKDcoJTNdbU46NeX7CvtqktbFC1
 ULxXqFW0Rhnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="296044910"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2020 02:56:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E72A71D7; Mon,  5 Oct 2020 12:56:22 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Update header block in gpiolib-cdev.h
Date:   Mon,  5 Oct 2020 12:56:22 +0300
Message-Id: <20201005095622.73616-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The dev_t is defined in types.h while struct gpio_device forward declaration
is missed. Take into account above and update header block in gpiolib-cdev.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.h b/drivers/gpio/gpiolib-cdev.h
index 973578e7ad10..b42644cbffb8 100644
--- a/drivers/gpio/gpiolib-cdev.h
+++ b/drivers/gpio/gpiolib-cdev.h
@@ -3,7 +3,9 @@
 #ifndef GPIOLIB_CDEV_H
 #define GPIOLIB_CDEV_H
 
-#include <linux/device.h>
+#include <linux/types.h>
+
+struct gpio_device;
 
 int gpiolib_cdev_register(struct gpio_device *gdev, dev_t devt);
 void gpiolib_cdev_unregister(struct gpio_device *gdev);
-- 
2.28.0

