Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB8CE0A9D
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387659AbfJVR32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:28 -0400
Received: from mga17.intel.com ([192.55.52.151]:50509 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732554AbfJVR32 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="372605618"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 22 Oct 2019 10:29:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E8BB43BB; Tue, 22 Oct 2019 20:29:23 +0300 (EEST)
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
Subject: [PATCH v2 03/11] lib/test_bitmap: Name EXP_BYTES properly
Date:   Tue, 22 Oct 2019 20:29:14 +0300
Message-Id: <20191022172922.61232-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

EXP_BYTES has been wrongly named. It's a size of the exp array in bits.

While here, go ahead and rename to EXP1_IN_BITS to avoid double renaming
when exp will be renamed to exp1 in the next patch

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/test_bitmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index d2fa94e45a46..38f923411ada 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -374,17 +374,17 @@ static void __init test_bitmap_parselist_user(void)
 	__test_bitmap_parselist(1);
 }
 
-#define EXP_BYTES	(sizeof(exp) * 8)
+#define EXP1_IN_BITS	(sizeof(exp) * 8)
 
 static void __init test_bitmap_arr32(void)
 {
 	unsigned int nbits, next_bit;
-	u32 arr[sizeof(exp) / 4];
-	DECLARE_BITMAP(bmap2, EXP_BYTES);
+	u32 arr[EXP1_IN_BITS / 32];
+	DECLARE_BITMAP(bmap2, EXP1_IN_BITS);
 
 	memset(arr, 0xa5, sizeof(arr));
 
-	for (nbits = 0; nbits < EXP_BYTES; ++nbits) {
+	for (nbits = 0; nbits < EXP1_IN_BITS; ++nbits) {
 		bitmap_to_arr32(arr, exp, nbits);
 		bitmap_from_arr32(bmap2, arr, nbits);
 		expect_eq_bitmap(bmap2, exp, nbits);
@@ -396,7 +396,7 @@ static void __init test_bitmap_arr32(void)
 				" tail is not safely cleared: %d\n",
 				nbits, next_bit);
 
-		if (nbits < EXP_BYTES - 32)
+		if (nbits < EXP1_IN_BITS - 32)
 			expect_eq_uint(arr[DIV_ROUND_UP(nbits, 32)],
 								0xa5a5a5a5);
 	}
-- 
2.23.0

