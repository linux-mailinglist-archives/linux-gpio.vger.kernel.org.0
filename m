Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7712E0AA9
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388700AbfJVR3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:17268 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388156AbfJVR3a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="201748570"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2019 10:29:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1EDB7425; Tue, 22 Oct 2019 20:29:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yury Norov <ynorov@marvell.com>
Subject: [PATCH v2 07/11] bitmap: Introduce bitmap_replace() helper
Date:   Tue, 22 Oct 2019 20:29:18 +0300
Message-Id: <20191022172922.61232-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In some drivers we want to have a single operation over bitmap which is
an equivalent to:

	*dst = (*old & ~(*mask)) | (*new & *mask)

Introduce bitmap_replace() helper for this.

Cc: Yury Norov <ynorov@marvell.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap.h | 16 ++++++++++++++++
 lib/bitmap.c           | 12 ++++++++++++
 lib/test_bitmap.c      | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 9f046609e809..ff335b22f23c 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -53,6 +53,7 @@
  *  bitmap_find_next_zero_area_off(buf, len, pos, n, mask)  as above
  *  bitmap_shift_right(dst, src, n, nbits)      *dst = *src >> n
  *  bitmap_shift_left(dst, src, n, nbits)       *dst = *src << n
+ *  bitmap_replace(dst, old, new, mask, nbits)  *dst = (*old & ~(*mask)) | (*new & *mask)
  *  bitmap_remap(dst, src, old, new, nbits)     *dst = map(old, new)(src)
  *  bitmap_bitremap(oldbit, old, new, nbits)    newbit = map(old, new)(oldbit)
  *  bitmap_onto(dst, orig, relmap, nbits)       *dst = orig relative to relmap
@@ -140,6 +141,9 @@ extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
 			const unsigned long *bitmap2, unsigned int nbits);
 extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
 			const unsigned long *bitmap2, unsigned int nbits);
+extern void __bitmap_replace(unsigned long *dst,
+			const unsigned long *old, const unsigned long *new,
+			const unsigned long *mask, unsigned int nbits);
 extern int __bitmap_intersects(const unsigned long *bitmap1,
 			const unsigned long *bitmap2, unsigned int nbits);
 extern int __bitmap_subset(const unsigned long *bitmap1,
@@ -434,6 +438,18 @@ static inline void bitmap_shift_left(unsigned long *dst, const unsigned long *sr
 		__bitmap_shift_left(dst, src, shift, nbits);
 }
 
+static inline void bitmap_replace(unsigned long *dst,
+				  const unsigned long *old,
+				  const unsigned long *new,
+				  const unsigned long *mask,
+				  unsigned int nbits)
+{
+	if (small_const_nbits(nbits))
+		*dst = (*old & ~(*mask)) | (*new & *mask);
+	else
+		__bitmap_replace(dst, old, new, mask, nbits);
+}
+
 static inline int bitmap_parse(const char *buf, unsigned int buflen,
 			unsigned long *maskp, int nmaskbits)
 {
diff --git a/lib/bitmap.c b/lib/bitmap.c
index f9e834841e94..4250519d7d1c 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -222,6 +222,18 @@ int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
 }
 EXPORT_SYMBOL(__bitmap_andnot);
 
+void __bitmap_replace(unsigned long *dst,
+		      const unsigned long *old, const unsigned long *new,
+		      const unsigned long *mask, unsigned int nbits)
+{
+	unsigned int k;
+	unsigned int nr = BITS_TO_LONGS(nbits);
+
+	for (k = 0; k < nr; k++)
+		dst[k] = (old[k] & ~mask[k]) | (new[k] & mask[k]);
+}
+EXPORT_SYMBOL(__bitmap_replace);
+
 int __bitmap_intersects(const unsigned long *bitmap1,
 			const unsigned long *bitmap2, unsigned int bits)
 {
diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 4544847cf81e..e14a15ac250b 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -42,6 +42,19 @@ static const unsigned long exp2[] __initconst = {
 	BITMAP_FROM_U64(0xffffffff77777777ULL),
 };
 
+/* Fibonacci sequence */
+static const unsigned long exp2_to_exp3_mask[] __initconst = {
+	BITMAP_FROM_U64(0x008000020020212eULL),
+};
+/* exp3_0_1 = (exp2[0] & ~exp2_to_exp3_mask) | (exp2[1] & exp2_to_exp3_mask) */
+static const unsigned long exp3_0_1[] __initconst = {
+	BITMAP_FROM_U64(0x33b3333311313137ULL),
+};
+/* exp3_1_0 = (exp2[1] & ~exp2_to_exp3_mask) | (exp2[0] & exp2_to_exp3_mask) */
+static const unsigned long exp3_1_0[] __initconst = {
+	BITMAP_FROM_U64(0xff7fffff77575751ULL),
+};
+
 static bool __init
 __check_eq_uint(const char *srcfile, unsigned int line,
 		const unsigned int exp_uint, unsigned int x)
@@ -257,6 +270,30 @@ static void __init test_copy(void)
 	expect_eq_pbl("0-108,128-1023", bmap2, 1024);
 }
 
+#define EXP2_IN_BITS	(sizeof(exp2) * 8)
+
+static void __init test_replace(void)
+{
+	unsigned int nbits = 64;
+	DECLARE_BITMAP(bmap, 1024);
+
+	bitmap_zero(bmap, 1024);
+	bitmap_replace(bmap, &exp2[0], &exp2[1], exp2_to_exp3_mask, nbits);
+	expect_eq_bitmap(bmap, exp3_0_1, nbits);
+
+	bitmap_zero(bmap, 1024);
+	bitmap_replace(bmap, &exp2[1], &exp2[0], exp2_to_exp3_mask, nbits);
+	expect_eq_bitmap(bmap, exp3_1_0, nbits);
+
+	bitmap_fill(bmap, 1024);
+	bitmap_replace(bmap, &exp2[0], &exp2[1], exp2_to_exp3_mask, nbits);
+	expect_eq_bitmap(bmap, exp3_0_1, nbits);
+
+	bitmap_fill(bmap, 1024);
+	bitmap_replace(bmap, &exp2[1], &exp2[0], exp2_to_exp3_mask, nbits);
+	expect_eq_bitmap(bmap, exp3_1_0, nbits);
+}
+
 #define PARSE_TIME 0x1
 
 struct test_bitmap_parselist{
@@ -476,6 +513,7 @@ static void __init selftest(void)
 	test_zero_clear();
 	test_fill_set();
 	test_copy();
+	test_replace();
 	test_bitmap_arr32();
 	test_bitmap_parselist();
 	test_bitmap_parselist_user();
-- 
2.23.0

