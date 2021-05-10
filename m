Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39ECD3797DE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbhEJTrj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:47:39 -0400
Received: from mga05.intel.com ([192.55.52.43]:9777 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhEJTri (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:47:38 -0400
IronPort-SDR: 4nKvqVZ/8GcL6+V4kDuZjqC1mfsPKp24xwPSK0tlLN/Wx8hkK26c6GEeIljbdKmJtH3yMzSM0d
 y6EbyooIMGLQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284761034"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="284761034"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:46:32 -0700
IronPort-SDR: skx2BXdixhd2BIcN0VDt47fjCUwxy0uOVBKUMtthJMfWfvLwEhsQ4tDuCEvcFEimNNJA3BV3Dm
 SXh/3aGkwKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="621386418"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2021 12:46:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5850DD7; Mon, 10 May 2021 22:46:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Neeli Srinivas <sneeli@xilinx.com>
Subject: [PATCH v2 1/5] bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
Date:   Mon, 10 May 2021 22:46:29 +0300
Message-Id: <20210510194633.11943-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
References: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the bitmap_remap() and bitmap_bitremap() are available
only for CONFIG_NUMA=y case, while some users may benefit out of it
and being independent to NUMA code. Make them available to users
by moving out of ifdeffery and exporting for modules.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Neeli Srinivas <sneeli@xilinx.com>
Acked-by: Yury Norov <yury.norov@gmail.com>
---
 lib/bitmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/bitmap.c b/lib/bitmap.c
index 74ceb02f45e3..7b6b2a67a6a6 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -784,8 +784,6 @@ int bitmap_parse(const char *start, unsigned int buflen,
 }
 EXPORT_SYMBOL(bitmap_parse);
 
-
-#ifdef CONFIG_NUMA
 /**
  * bitmap_pos_to_ord - find ordinal of set bit at given position in bitmap
  *	@buf: pointer to a bitmap
@@ -894,6 +892,7 @@ void bitmap_remap(unsigned long *dst, const unsigned long *src,
 			set_bit(bitmap_ord_to_pos(new, n % w, nbits), dst);
 	}
 }
+EXPORT_SYMBOL(bitmap_remap);
 
 /**
  * bitmap_bitremap - Apply map defined by a pair of bitmaps to a single bit
@@ -931,7 +930,9 @@ int bitmap_bitremap(int oldbit, const unsigned long *old,
 	else
 		return bitmap_ord_to_pos(new, n % w, bits);
 }
+EXPORT_SYMBOL(bitmap_bitremap);
 
+#ifdef CONFIG_NUMA
 /**
  * bitmap_onto - translate one bitmap relative to another
  *	@dst: resulting translated bitmap
-- 
2.30.2

