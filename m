Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B2620F17C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 11:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgF3JWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 05:22:50 -0400
Received: from mga04.intel.com ([192.55.52.120]:62719 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728127AbgF3JWu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jun 2020 05:22:50 -0400
IronPort-SDR: 0qohwuGmbg4aRSeUQMpOX0cU63191Bx/4i1eYKax0GMmcgxPA0VkeB3NFM8dOE84Qs9Yws5ISw
 FQasR2H4UYkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="143663883"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="143663883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 02:22:50 -0700
IronPort-SDR: MYEQG4xZ4nmLQ+MCfKsWKYAHNuPOU2INd5gM6z13bwfpftdGVLbrA7Ew9ODG1NkPhsTZckkYq5
 0VkrTPH6w6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="480868683"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 02:22:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8885815E; Tue, 30 Jun 2020 12:21:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Deduplicate find_first_zero_bit() call
Date:   Tue, 30 Jun 2020 12:21:46 +0300
Message-Id: <20200630092146.36376-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

bitmap_full() is a shortcut to find_first_zero_bit().
Thus, no need to call it twice.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d4c4e4fb05b6..57e116c7bf9b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2594,10 +2594,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 			bitmap_xor(value_bitmap, value_bitmap,
 				   array_info->invert_mask, array_size);
 
-		if (bitmap_full(array_info->get_mask, array_size))
-			return 0;
-
 		i = find_first_zero_bit(array_info->get_mask, array_size);
+		if (i == array_size)
+			return 0;
 	} else {
 		array_info = NULL;
 	}
@@ -2878,10 +2877,9 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		gpio_chip_set_multiple(array_info->chip, array_info->set_mask,
 				       value_bitmap);
 
-		if (bitmap_full(array_info->set_mask, array_size))
-			return 0;
-
 		i = find_first_zero_bit(array_info->set_mask, array_size);
+		if (i == array_size)
+			return 0;
 	} else {
 		array_info = NULL;
 	}
-- 
2.27.0

