Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BEB39090E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 20:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhEYSgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 14:36:42 -0400
Received: from mga07.intel.com ([134.134.136.100]:26774 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232433AbhEYSgl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 14:36:41 -0400
IronPort-SDR: s+ffbC42PK8Y4o90ABcYCxcsWhl7DNxofCm/CN7247+j2JhNTrOqRevk8J+sgXVnlNMQ7b3WMk
 yQEon5qwqFcg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="266162664"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="266162664"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 11:35:08 -0700
IronPort-SDR: XcMg12Hvc670rd8dWGhb41jqBHG3pIC5EtOyWbQO/YLOBaAa6LwIUexWJcSZGcLQzJhe8i7Kiw
 UshgQDByWsCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; 
   d="scan'208";a="479439802"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 25 May 2021 11:35:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 145104DB; Tue, 25 May 2021 21:35:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpiolib: Switch to bitmap_alloc()
Date:   Tue, 25 May 2021 21:35:18 +0300
Message-Id: <20210525183518.63149-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
References: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch to bitmap_alloc() to show clearly what we are allocating.
Besides that it returns pointer of bitmap type instead of opaque void *.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 79df075f8b82..068f18624da0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2549,13 +2549,17 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 			mask = fastpath_mask;
 			bits = fastpath_bits;
 		} else {
-			mask = kmalloc_array(2 * BITS_TO_LONGS(gc->ngpio),
-					   sizeof(*mask),
-					   can_sleep ? GFP_KERNEL : GFP_ATOMIC);
+			gfp_t flags = can_sleep ? GFP_KERNEL : GFP_ATOMIC;
+
+			mask = bitmap_alloc(gc->ngpio, flags);
 			if (!mask)
 				return -ENOMEM;
 
-			bits = mask + BITS_TO_LONGS(gc->ngpio);
+			bits = bitmap_alloc(gc->ngpio, flags);
+			if (!bits) {
+				bitmap_free(mask);
+				return -ENOMEM;
+			}
 		}
 
 		bitmap_zero(mask, gc->ngpio);
@@ -2581,7 +2585,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		ret = gpio_chip_get_multiple(gc, mask, bits);
 		if (ret) {
 			if (mask != fastpath_mask)
-				kfree(mask);
+				bitmap_free(mask);
+			if (bits != fastpath_bits)
+				bitmap_free(bits);
 			return ret;
 		}
 
@@ -2602,7 +2608,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		}
 
 		if (mask != fastpath_mask)
-			kfree(mask);
+			bitmap_free(mask);
+		if (bits != fastpath_bits)
+			bitmap_free(bits);
 	}
 	return 0;
 }
@@ -2835,13 +2843,17 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			mask = fastpath_mask;
 			bits = fastpath_bits;
 		} else {
-			mask = kmalloc_array(2 * BITS_TO_LONGS(gc->ngpio),
-					   sizeof(*mask),
-					   can_sleep ? GFP_KERNEL : GFP_ATOMIC);
+			gfp_t flags = can_sleep ? GFP_KERNEL : GFP_ATOMIC;
+
+			mask = bitmap_alloc(gc->ngpio, flags);
 			if (!mask)
 				return -ENOMEM;
 
-			bits = mask + BITS_TO_LONGS(gc->ngpio);
+			bits = bitmap_alloc(gc->ngpio, flags);
+			if (!bits) {
+				bitmap_free(mask);
+				return -ENOMEM;
+			}
 		}
 
 		bitmap_zero(mask, gc->ngpio);
@@ -2889,7 +2901,9 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			gpio_chip_set_multiple(gc, mask, bits);
 
 		if (mask != fastpath_mask)
-			kfree(mask);
+			bitmap_free(mask);
+		if (bits != fastpath_bits)
+			bitmap_free(bits);
 	}
 	return 0;
 }
-- 
2.30.2

