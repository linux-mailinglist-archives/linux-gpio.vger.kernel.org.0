Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADAC39090B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 20:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhEYSgf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 14:36:35 -0400
Received: from mga17.intel.com ([192.55.52.151]:45532 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231565AbhEYSge (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 14:36:34 -0400
IronPort-SDR: uAyytL6uT87SnoTd/1yfkI9pk6pFirOz6p892GVBHR0n0ed2lpzSOXNRx674jnIylzu53kUWSe
 KjI3A+P3cgdA==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182593695"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="182593695"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 11:35:01 -0700
IronPort-SDR: fu1NKNP3vp3R3hg0ZSxFlfzeLTnadcB2gxFBoebJgiHQdZ7cFIBCCZu1Xvd+rZSzkW72sn4pvI
 EHnLGs3lU66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="614633850"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 25 May 2021 11:34:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0228F12A; Tue, 25 May 2021 21:35:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpiolib: Split fastpath array to two
Date:   Tue, 25 May 2021 21:35:17 +0300
Message-Id: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Split fastpath array to two, i.e. for mask and for bits.
At the same time declare them as bitmaps.

This makes code better to read and gives a clue about use of
bitmap API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 97a69362a584..79df075f8b82 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2540,21 +2540,24 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 
 	while (i < array_size) {
 		struct gpio_chip *gc = desc_array[i]->gdev->chip;
-		unsigned long fastpath[2 * BITS_TO_LONGS(FASTPATH_NGPIO)];
+		DECLARE_BITMAP(fastpath_mask, FASTPATH_NGPIO);
+		DECLARE_BITMAP(fastpath_bits, FASTPATH_NGPIO);
 		unsigned long *mask, *bits;
 		int first, j;
 
 		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
-			mask = fastpath;
+			mask = fastpath_mask;
+			bits = fastpath_bits;
 		} else {
 			mask = kmalloc_array(2 * BITS_TO_LONGS(gc->ngpio),
 					   sizeof(*mask),
 					   can_sleep ? GFP_KERNEL : GFP_ATOMIC);
 			if (!mask)
 				return -ENOMEM;
+
+			bits = mask + BITS_TO_LONGS(gc->ngpio);
 		}
 
-		bits = mask + BITS_TO_LONGS(gc->ngpio);
 		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
@@ -2577,7 +2580,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 
 		ret = gpio_chip_get_multiple(gc, mask, bits);
 		if (ret) {
-			if (mask != fastpath)
+			if (mask != fastpath_mask)
 				kfree(mask);
 			return ret;
 		}
@@ -2598,7 +2601,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 						       j);
 		}
 
-		if (mask != fastpath)
+		if (mask != fastpath_mask)
 			kfree(mask);
 	}
 	return 0;
@@ -2823,21 +2826,24 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 
 	while (i < array_size) {
 		struct gpio_chip *gc = desc_array[i]->gdev->chip;
-		unsigned long fastpath[2 * BITS_TO_LONGS(FASTPATH_NGPIO)];
+		DECLARE_BITMAP(fastpath_mask, FASTPATH_NGPIO);
+		DECLARE_BITMAP(fastpath_bits, FASTPATH_NGPIO);
 		unsigned long *mask, *bits;
 		int count = 0;
 
 		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
-			mask = fastpath;
+			mask = fastpath_mask;
+			bits = fastpath_bits;
 		} else {
 			mask = kmalloc_array(2 * BITS_TO_LONGS(gc->ngpio),
 					   sizeof(*mask),
 					   can_sleep ? GFP_KERNEL : GFP_ATOMIC);
 			if (!mask)
 				return -ENOMEM;
+
+			bits = mask + BITS_TO_LONGS(gc->ngpio);
 		}
 
-		bits = mask + BITS_TO_LONGS(gc->ngpio);
 		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
@@ -2882,7 +2888,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		if (count != 0)
 			gpio_chip_set_multiple(gc, mask, bits);
 
-		if (mask != fastpath)
+		if (mask != fastpath_mask)
 			kfree(mask);
 	}
 	return 0;
-- 
2.30.2

