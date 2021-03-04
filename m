Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEA232D0D8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 11:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238687AbhCDKcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 05:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238656AbhCDKcI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 05:32:08 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058B6C0613E3
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 02:30:13 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k66so9130327wmf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 02:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzLcn/9JFFu/zAnz2fz4llMxe0ZNESpsBe/AAdOPAB8=;
        b=tuRBMG8HzrbDNFK8qAYS22PR4XQ2So85s7DniK8OWce7W92hEoiJwjeBU2i2PY3X6l
         ouGt9uuEdG/TNzuKbXDdMBzv60SNx9ywfNVhzNiAo7JXpYnaKPPFL11M4k2tl7iFSrte
         ZXlJOQfCvCeEvhP5Xt9/W1FScPmHLQgb+PHAu3Tb8sSdiF8LUGhBpuPjC8OYpwIdJDaT
         9+JTGwgtBqmhkH5eT0PzY0YZ+w2S7TY5fiHBnRcNEr5rmRDDOVv5KNekn9HZ8xJTwDjO
         5WhJoGB6Q6g96ok0hzPlUyDW1B1RJyptPiXTZ84Amg1hKWsWGlLuwuY6lpZNoJTg6gTU
         jMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzLcn/9JFFu/zAnz2fz4llMxe0ZNESpsBe/AAdOPAB8=;
        b=LLRceZx9BwYWfaoPeA+3vniqbCRjEh+1hGGWomgOOFOqNlvG3TVP+I/tZR6ghmmpt4
         Kl7YlGYMS7/f6blWSb301ECxyBh3cMSwgKiAVq7m1+uVh94FYO6aIofpL6tdde6Ki4w1
         j+1o0Wo7tetPrSmR2nb8qd5zz2TAtINS5xF1+GFCUvplLW2oatFfU3IWTotOW0sBkO4A
         KYVSuoNKA9XtI/5LTk7MIKVrAaIigefEKscoVA9FzVCv/5wKGv2PqDqZZ4EcAEpj9Prv
         vUTsudJxxJ4Z1tT6F5P4m/lByvf/IQ2gzeIQ7juH+zlXh7gBxO+5er6Nvig8wM9MJufl
         mAgA==
X-Gm-Message-State: AOAM532mBwHdHJb0ouXyrYorZXjZk7lKSj0deqoIt0CM0vGda7bK/h7B
        +EYalv05AvaDhmKGfkTbDiha8g==
X-Google-Smtp-Source: ABdhPJwOYvL1KO3KRXjN8n30tg8GfdxYxQb08ru+C3Jv/q3rkh1v5cZ0T6iJXrCdfEmnn+bpte48GA==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr3303682wml.31.1614853811561;
        Thu, 04 Mar 2021 02:30:11 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:11 -0800 (PST)
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
Subject: [PATCH v2 06/12] lib: bitmap: order includes alphabetically
Date:   Thu,  4 Mar 2021 11:24:46 +0100
Message-Id: <20210304102452.21726-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For better readability and maintenance: order the includes in bitmap
source files alphabetically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/bitmap.h | 4 ++--
 lib/bitmap.c           | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 6939a8983026..3282db97e06c 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -4,10 +4,10 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/types.h>
 #include <linux/bitops.h>
-#include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
 
 /*
  * bitmaps provide bit arrays that consume one or more unsigned
diff --git a/lib/bitmap.c b/lib/bitmap.c
index 75006c4036e9..78f70d9007ad 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -3,17 +3,18 @@
  * lib/bitmap.c
  * Helper functions for bitmap.h.
  */
-#include <linux/export.h>
-#include <linux/thread_info.h>
-#include <linux/ctype.h>
-#include <linux/errno.h>
+
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/thread_info.h>
 #include <linux/uaccess.h>
 
 #include <asm/page.h>
-- 
2.29.1

