Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 594F5358796
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbhDHO4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:56:03 -0400
Received: from mga14.intel.com ([192.55.52.115]:56204 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhDHO4D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 10:56:03 -0400
IronPort-SDR: bqdhx42IfTgNa7h1KoNkdpCxPeSB4hDR/gtp9s3r0vvsKmBYDEXRm7DyOLZlnI9ivB6bSY56e0
 B1nAscgXXxhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193098971"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="193098971"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:55:52 -0700
IronPort-SDR: u3SAzauGM3qMBFzJYep86skF9gApXYXbhGx7vZs839F5et0Sgjej8ukSdJC9sjQYY0cWlpe4qR
 kRpLouaWSlmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="449705839"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2021 07:55:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 03A5B93; Thu,  8 Apr 2021 17:56:04 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: [PATCH v1 1/5] bitmap: Make bitmap_remap() and bitmap_bitremap() available to users
Date:   Thu,  8 Apr 2021 17:55:57 +0300
Message-Id: <20210408145601.68651-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
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

