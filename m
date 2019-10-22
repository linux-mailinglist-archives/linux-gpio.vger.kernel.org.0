Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66E9CE0AAF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732674AbfJVRaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:30:01 -0400
Received: from mga02.intel.com ([134.134.136.20]:34323 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731808AbfJVR31 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="187972685"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 22 Oct 2019 10:29:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D331512C; Tue, 22 Oct 2019 20:29:23 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 01/11] lib/test_bitmap: Force argument of bitmap_parselist_user() to proper address space
Date:   Tue, 22 Oct 2019 20:29:12 +0300
Message-Id: <20191022172922.61232-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sparse complains:

lib/test_bitmap.c:345:58: warning: incorrect type in argument 1 (different address spaces)
lib/test_bitmap.c:345:58:    expected char const [noderef] <asn:1> *ubuf
lib/test_bitmap.c:345:58:    got char const *const in

Force argument of bitmap_parselist_user() to proper address space.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/test_bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index dc167c13eb39..09aa29a6b562 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -330,7 +330,7 @@ static void __init __test_bitmap_parselist(int is_user)
 
 			set_fs(KERNEL_DS);
 			time = ktime_get();
-			err = bitmap_parselist_user(ptest.in, len,
+			err = bitmap_parselist_user((__force const char __user *)ptest.in, len,
 						    bmap, ptest.nbits);
 			time = ktime_get() - time;
 			set_fs(orig_fs);
-- 
2.23.0

