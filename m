Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4F3AE0A98
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732555AbfJVR32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:28 -0400
Received: from mga17.intel.com ([192.55.52.151]:50509 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730141AbfJVR32 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="281360689"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Oct 2019 10:29:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EE4F83AB; Tue, 22 Oct 2019 20:29:23 +0300 (EEST)
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
Subject: [PATCH v2 04/11] lib/test_bitmap: Rename exp to exp1 to avoid ambiguous name
Date:   Tue, 22 Oct 2019 20:29:15 +0300
Message-Id: <20191022172922.61232-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

One function is using exp as local variable.
Avoid ambiguous naming by rename global one to exp1.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/test_bitmap.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 38f923411ada..6b70166ac960 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -247,7 +247,7 @@ struct test_bitmap_parselist{
 	const int flags;
 };
 
-static const unsigned long exp[] __initconst = {
+static const unsigned long exp1[] __initconst = {
 	BITMAP_FROM_U64(1),
 	BITMAP_FROM_U64(2),
 	BITMAP_FROM_U64(0x0000ffff),
@@ -271,29 +271,29 @@ static const unsigned long exp2[] __initconst = {
 static const struct test_bitmap_parselist parselist_tests[] __initconst = {
 #define step (sizeof(u64) / sizeof(unsigned long))
 
-	{0, "0",			&exp[0], 8, 0},
-	{0, "1",			&exp[1 * step], 8, 0},
-	{0, "0-15",			&exp[2 * step], 32, 0},
-	{0, "16-31",			&exp[3 * step], 32, 0},
-	{0, "0-31:1/2",			&exp[4 * step], 32, 0},
-	{0, "1-31:1/2",			&exp[5 * step], 32, 0},
-	{0, "0-31:1/4",			&exp[6 * step], 32, 0},
-	{0, "1-31:1/4",			&exp[7 * step], 32, 0},
-	{0, "0-31:4/4",			&exp[8 * step], 32, 0},
-	{0, "1-31:4/4",			&exp[9 * step], 32, 0},
-	{0, "0-31:1/4,32-63:2/4",	&exp[10 * step], 64, 0},
-	{0, "0-31:3/4,32-63:4/4",	&exp[11 * step], 64, 0},
-	{0, "  ,,  0-31:3/4  ,, 32-63:4/4  ,,  ",	&exp[11 * step], 64, 0},
+	{0, "0",			&exp1[0], 8, 0},
+	{0, "1",			&exp1[1 * step], 8, 0},
+	{0, "0-15",			&exp1[2 * step], 32, 0},
+	{0, "16-31",			&exp1[3 * step], 32, 0},
+	{0, "0-31:1/2",			&exp1[4 * step], 32, 0},
+	{0, "1-31:1/2",			&exp1[5 * step], 32, 0},
+	{0, "0-31:1/4",			&exp1[6 * step], 32, 0},
+	{0, "1-31:1/4",			&exp1[7 * step], 32, 0},
+	{0, "0-31:4/4",			&exp1[8 * step], 32, 0},
+	{0, "1-31:4/4",			&exp1[9 * step], 32, 0},
+	{0, "0-31:1/4,32-63:2/4",	&exp1[10 * step], 64, 0},
+	{0, "0-31:3/4,32-63:4/4",	&exp1[11 * step], 64, 0},
+	{0, "  ,,  0-31:3/4  ,, 32-63:4/4  ,,  ",	&exp1[11 * step], 64, 0},
 
 	{0, "0-31:1/4,32-63:2/4,64-95:3/4,96-127:4/4",	exp2, 128, 0},
 
 	{0, "0-2047:128/256", NULL, 2048, PARSE_TIME},
 
-	{0, "",				&exp[12 * step], 8, 0},
-	{0, "\n",			&exp[12 * step], 8, 0},
-	{0, ",,  ,,  , ,  ,",		&exp[12 * step], 8, 0},
-	{0, " ,  ,,  , ,   ",		&exp[12 * step], 8, 0},
-	{0, " ,  ,,  , ,   \n",		&exp[12 * step], 8, 0},
+	{0, "",				&exp1[12 * step], 8, 0},
+	{0, "\n",			&exp1[12 * step], 8, 0},
+	{0, ",,  ,,  , ,  ,",		&exp1[12 * step], 8, 0},
+	{0, " ,  ,,  , ,   ",		&exp1[12 * step], 8, 0},
+	{0, " ,  ,,  , ,   \n",		&exp1[12 * step], 8, 0},
 
 	{-EINVAL, "-1",	NULL, 8, 0},
 	{-EINVAL, "-0",	NULL, 8, 0},
@@ -374,7 +374,7 @@ static void __init test_bitmap_parselist_user(void)
 	__test_bitmap_parselist(1);
 }
 
-#define EXP1_IN_BITS	(sizeof(exp) * 8)
+#define EXP1_IN_BITS	(sizeof(exp1) * 8)
 
 static void __init test_bitmap_arr32(void)
 {
@@ -385,9 +385,9 @@ static void __init test_bitmap_arr32(void)
 	memset(arr, 0xa5, sizeof(arr));
 
 	for (nbits = 0; nbits < EXP1_IN_BITS; ++nbits) {
-		bitmap_to_arr32(arr, exp, nbits);
+		bitmap_to_arr32(arr, exp1, nbits);
 		bitmap_from_arr32(bmap2, arr, nbits);
-		expect_eq_bitmap(bmap2, exp, nbits);
+		expect_eq_bitmap(bmap2, exp1, nbits);
 
 		next_bit = find_next_bit(bmap2,
 				round_up(nbits, BITS_PER_LONG), nbits);
-- 
2.23.0

