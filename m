Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998C633AE59
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhCOJOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhCOJOQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:14:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F91C06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d15so8264883wrv.5
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YQC6wFy2J65Y28BJx46C1FfvB3e/Gw51qsSfNp1Q/wg=;
        b=wcw9kYdMr+T0L8D6/LdQAe/rEPXOOYGjqmJ98f+kGEBPETCjLe1IbNnev3b1F/EHzH
         Zq1bQSo4LjTTo+uaCxcNrW3RahsF5WXlrKQoxCtpofnsmaLoJsyCBKQ4d30kJeg8NyKK
         EwYQEPHJrz7hdiY28IdYDncLjz6kjHn0mTlaOMQ4TQuqu+B3omHI0OLDiaYxZItWnx5m
         I/J7aoVipbGM74fcD8Xd+faVasZ1418STueGQjUKp8iapvmRCTiLOvtsNChCLnJDCp67
         6H2XMZ1dguUrneAk3rgKCx1w4E9Tbtgc61GUazduB0cGq5ZCz/L1bJIKFBCLDMRyLRcB
         LmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YQC6wFy2J65Y28BJx46C1FfvB3e/Gw51qsSfNp1Q/wg=;
        b=OE6v6CBhpiDDFAKtMwtXFrSRZAk7aLxxLDLaqzTBekWbRKwv24TLsjiNwtJdDRrDo1
         Z+czNFbPffbGIS6is5cpfRWxEvyBdC6ZSrYldB9OXMKIOTIcvKWxtal4+f960jRvhMbk
         WKyRUlOC2pnl3brIJuNIRmF6P73yHNeAIfgetHPxp1pte/plP2UOsHrzSpyqIXbrm+k0
         geQ5ZorhzAi+kHMwvkg5G9kigZnOBV9genYKVjv97YSR8oktkwFL6BjIuR6w8j4qM9wL
         nDKu5+MDLUBAdoU3UDjI5n0ojK8vMHnMbp2nrvVZV2zkGW96JDyixla2QeXudmWfVkgS
         SZVg==
X-Gm-Message-State: AOAM533qKJqUfvq8Kd8oJJxKG7mJXPHDm372Or92GQ5dxpaRhHsLrSGu
        E4pwhRuindOni8HR4ecO4N/LkQ==
X-Google-Smtp-Source: ABdhPJxjtfeSoAhoRyPGHqdaPNn/uGESJ9fZXXF/aKo1GRfDjtLx1rJoppklBnTmHW3qxK3Ul4QnZw==
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr26497640wrx.23.1615799654975;
        Mon, 15 Mar 2021 02:14:14 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 05/11] lib: bitmap: remove the 'extern' keyword from function declarations
Date:   Mon, 15 Mar 2021 10:13:54 +0100
Message-Id: <20210315091400.13772-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The 'extern' keyword doesn't have any benefits in header files. Remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap.h | 115 ++++++++++++++++++++---------------------
 1 file changed, 57 insertions(+), 58 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 70a932470b2d..6939a8983026 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -118,54 +118,53 @@
  * Allocation and deallocation of bitmap.
  * Provided in lib/bitmap.c to avoid circular dependency.
  */
-extern unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
-extern unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
-extern void bitmap_free(const unsigned long *bitmap);
+unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
+unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
+void bitmap_free(const unsigned long *bitmap);
 
 /*
  * lib/bitmap.c provides these functions:
  */
 
-extern int __bitmap_equal(const unsigned long *bitmap1,
-			  const unsigned long *bitmap2, unsigned int nbits);
-extern bool __pure __bitmap_or_equal(const unsigned long *src1,
-				     const unsigned long *src2,
-				     const unsigned long *src3,
-				     unsigned int nbits);
-extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
-			unsigned int nbits);
-extern void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
-				unsigned int shift, unsigned int nbits);
-extern void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
-				unsigned int shift, unsigned int nbits);
-extern void bitmap_cut(unsigned long *dst, const unsigned long *src,
-		       unsigned int first, unsigned int cut,
-		       unsigned int nbits);
-extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
+int __bitmap_equal(const unsigned long *bitmap1,
+		   const unsigned long *bitmap2, unsigned int nbits);
+bool __pure __bitmap_or_equal(const unsigned long *src1,
+			      const unsigned long *src2,
+			      const unsigned long *src3,
+			      unsigned int nbits);
+void __bitmap_complement(unsigned long *dst, const unsigned long *src,
+			 unsigned int nbits);
+void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
+			  unsigned int shift, unsigned int nbits);
+void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
+			 unsigned int shift, unsigned int nbits);
+void bitmap_cut(unsigned long *dst, const unsigned long *src,
+		unsigned int first, unsigned int cut, unsigned int nbits);
+int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
+		 const unsigned long *bitmap2, unsigned int nbits);
+void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
+		 const unsigned long *bitmap2, unsigned int nbits);
+void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
+		  const unsigned long *bitmap2, unsigned int nbits);
+int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
+		    const unsigned long *bitmap2, unsigned int nbits);
+void __bitmap_replace(unsigned long *dst,
+		      const unsigned long *old, const unsigned long *new,
+		      const unsigned long *mask, unsigned int nbits);
+int __bitmap_intersects(const unsigned long *bitmap1,
 			const unsigned long *bitmap2, unsigned int nbits);
-extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, unsigned int nbits);
-extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, unsigned int nbits);
-extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
-			const unsigned long *bitmap2, unsigned int nbits);
-extern void __bitmap_replace(unsigned long *dst,
-			const unsigned long *old, const unsigned long *new,
-			const unsigned long *mask, unsigned int nbits);
-extern int __bitmap_intersects(const unsigned long *bitmap1,
-			const unsigned long *bitmap2, unsigned int nbits);
-extern int __bitmap_subset(const unsigned long *bitmap1,
-			const unsigned long *bitmap2, unsigned int nbits);
-extern int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);
-extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
-extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);
-
-extern unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
-						    unsigned long size,
-						    unsigned long start,
-						    unsigned int nr,
-						    unsigned long align_mask,
-						    unsigned long align_offset);
+int __bitmap_subset(const unsigned long *bitmap1,
+		    const unsigned long *bitmap2, unsigned int nbits);
+int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);
+void __bitmap_set(unsigned long *map, unsigned int start, int len);
+void __bitmap_clear(unsigned long *map, unsigned int start, int len);
+
+unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
+					     unsigned long size,
+					     unsigned long start,
+					     unsigned int nr,
+					     unsigned long align_mask,
+					     unsigned long align_offset);
 
 /**
  * bitmap_find_next_zero_area - find a contiguous aligned zero area
@@ -190,33 +189,33 @@ bitmap_find_next_zero_area(unsigned long *map,
 					      align_mask, 0);
 }
 
-extern int bitmap_parse(const char *buf, unsigned int buflen,
+int bitmap_parse(const char *buf, unsigned int buflen,
 			unsigned long *dst, int nbits);
-extern int bitmap_parse_user(const char __user *ubuf, unsigned int ulen,
+int bitmap_parse_user(const char __user *ubuf, unsigned int ulen,
 			unsigned long *dst, int nbits);
-extern int bitmap_parselist(const char *buf, unsigned long *maskp,
+int bitmap_parselist(const char *buf, unsigned long *maskp,
 			int nmaskbits);
-extern int bitmap_parselist_user(const char __user *ubuf, unsigned int ulen,
+int bitmap_parselist_user(const char __user *ubuf, unsigned int ulen,
 			unsigned long *dst, int nbits);
-extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
+void bitmap_remap(unsigned long *dst, const unsigned long *src,
 		const unsigned long *old, const unsigned long *new, unsigned int nbits);
-extern int bitmap_bitremap(int oldbit,
+int bitmap_bitremap(int oldbit,
 		const unsigned long *old, const unsigned long *new, int bits);
-extern void bitmap_onto(unsigned long *dst, const unsigned long *orig,
+void bitmap_onto(unsigned long *dst, const unsigned long *orig,
 		const unsigned long *relmap, unsigned int bits);
-extern void bitmap_fold(unsigned long *dst, const unsigned long *orig,
+void bitmap_fold(unsigned long *dst, const unsigned long *orig,
 		unsigned int sz, unsigned int nbits);
-extern int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order);
-extern void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order);
-extern int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order);
+int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order);
+void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order);
+int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order);
 
 #ifdef __BIG_ENDIAN
-extern void bitmap_copy_le(unsigned long *dst, const unsigned long *src, unsigned int nbits);
+void bitmap_copy_le(unsigned long *dst, const unsigned long *src, unsigned int nbits);
 #else
 #define bitmap_copy_le bitmap_copy
 #endif
-extern unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
-extern int bitmap_print_to_pagebuf(bool list, char *buf,
+unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
+int bitmap_print_to_pagebuf(bool list, char *buf,
 				   const unsigned long *maskp, int nmaskbits);
 
 #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
@@ -265,9 +264,9 @@ static inline void bitmap_copy_clear_tail(unsigned long *dst,
  * therefore conversion is not needed when copying data from/to arrays of u32.
  */
 #if BITS_PER_LONG == 64
-extern void bitmap_from_arr32(unsigned long *bitmap, const u32 *buf,
+void bitmap_from_arr32(unsigned long *bitmap, const u32 *buf,
 							unsigned int nbits);
-extern void bitmap_to_arr32(u32 *buf, const unsigned long *bitmap,
+void bitmap_to_arr32(u32 *buf, const unsigned long *bitmap,
 							unsigned int nbits);
 #else
 #define bitmap_from_arr32(bitmap, buf, nbits)			\
-- 
2.30.1

