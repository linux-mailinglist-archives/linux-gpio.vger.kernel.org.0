Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B614B32D0C6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbhCDKcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238561AbhCDKbn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:31:43 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4396C0613E4
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 02:30:13 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b18so20548571wrn.6
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 02:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgmBZ3NhwrAFJO5K/6mUJqd+FqbPtvHWFuPSvB1rVno=;
        b=PkWRHiRLD+YMkJpjEQ+Auf3+aLRwhQw3pzL+dX7Olf+ktGDhvHpbFJzjIWK/lgsb7F
         iCIq5HbuqX7xOk8gIOL4B2oDf/kyb8pGKDNSb22rvwqmnq9uuLje5Hts6OzUKkuQuNFL
         gyPZz7WQL5e/Qg3Ypp/G/J40mGn8azHs8XsFCTBMIUtyPY2/gIplOlFxzyFAUvSfLLa+
         HNn1YxF18H9EOZ0XAVu+A/FJVNZUMqT2RQe/QBp0sht0RT1z4Qz3s1bxE3fuxw93QP3S
         ToR6tfdbQ8k1j5PEGTRYK0puO9BliZ3qGUEg/rjMGxaywcb/mi9xJAmijZk/Itsy4Ki5
         58nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgmBZ3NhwrAFJO5K/6mUJqd+FqbPtvHWFuPSvB1rVno=;
        b=h3tyMoXy1BVyshCHFL1zbVWr4Rp6gZpUFecJFOQqf8yPgfLfNL6son8LT+QgtZ2hAo
         FSwvDif9SlM4OsqnUms8SR+8EW4qThRIx60a9lOnhghwIMbs/uTqPK9uVcliUW9v1fKI
         MyEDC3QXXbzG8LFX93CfXWoz0N2JVymHuqNLUNAg2/pjgqniCi49zdxNaMtG4xTWtk5o
         rX5Wym+DdZlnDqrh/IaPE7mVAlXOvVqs7lUP1M/vns3qfM0Jq84cw/NfkYWPK04PFu09
         l6O3XFmlvcogB8+S5zjwDxkYOeYihAx2SF9YsHm2Q/UX/J6Kp4LTrFyRw/eF8MdJlc/c
         yR6w==
X-Gm-Message-State: AOAM532VYlt8hYpzptBNjUowtMha38xOLE3PrHlXMCxW23E24kJ0/D4b
        t5L8zTiDGC82U1w6YHbQj66N7A==
X-Google-Smtp-Source: ABdhPJz9p7+9VIFUiU1DyC4PUnukE4hXhlfIEHq7OqPG6JVs8r3iYqSvgeNYXWJPTUXk95fiSH71Sw==
X-Received: by 2002:adf:b60e:: with SMTP id f14mr3247833wre.99.1614853812430;
        Thu, 04 Mar 2021 02:30:12 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 07/12] lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
Date:   Thu,  4 Mar 2021 11:24:47 +0100
Message-Id: <20210304102452.21726-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide managed variants of bitmap_alloc() and bitmap_zalloc().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/bitmap.h | 10 ++++++++++
 lib/bitmap.c           | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 3282db97e06c..e41c622db1b8 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -9,6 +9,8 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
+struct device;
+
 /*
  * bitmaps provide bit arrays that consume one or more unsigned
  * longs.  The bitmap interface and available operations are listed
@@ -122,6 +124,14 @@ unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
 unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
 void bitmap_free(const unsigned long *bitmap);
 
+/*
+ * Managed variants of the above.
+ */
+unsigned long *devm_bitmap_alloc(struct device *dev,
+				 unsigned int nbits, gfp_t flags);
+unsigned long *devm_bitmap_zalloc(struct device *dev,
+				  unsigned int nbits, gfp_t flags);
+
 /*
  * lib/bitmap.c provides these functions:
  */
diff --git a/lib/bitmap.c b/lib/bitmap.c
index 78f70d9007ad..b4fd7fd084c6 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/ctype.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
@@ -1263,6 +1264,38 @@ void bitmap_free(const unsigned long *bitmap)
 }
 EXPORT_SYMBOL(bitmap_free);
 
+static void devm_bitmap_free(void *data)
+{
+	unsigned long *bitmap = data;
+
+	bitmap_free(bitmap);
+}
+
+unsigned long *devm_bitmap_alloc(struct device *dev,
+				 unsigned int nbits, gfp_t flags)
+{
+	unsigned long *bitmap;
+	int ret;
+
+	bitmap = bitmap_alloc(nbits, flags);
+	if (!bitmap)
+		return NULL;
+
+	ret = devm_add_action_or_reset(dev, devm_bitmap_free, bitmap);
+	if (ret)
+		return NULL;
+
+	return bitmap;
+}
+EXPORT_SYMBOL(devm_bitmap_alloc);
+
+unsigned long *devm_bitmap_zalloc(struct device *dev,
+				  unsigned int nbits, gfp_t flags)
+{
+	return devm_bitmap_alloc(dev, nbits, flags | __GFP_ZERO);
+}
+EXPORT_SYMBOL(devm_bitmap_zalloc);
+
 #if BITS_PER_LONG == 64
 /**
  * bitmap_from_arr32 - copy the contents of u32 array of bits to bitmap
-- 
2.29.1

