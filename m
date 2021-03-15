Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B8433AE56
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCOJOh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCOJOT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:14:19 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA21EC06175F
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id y16so8280646wrw.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z5Cepyi5kn4wd4FWddheSiToZBY6ONr0o29KGf5Ep/4=;
        b=BGvgsnGwpvbjxocGADih3b7K0Pu2tVOSk5+Qm8zszcBlGL8HFTBnNjlSUamkByqc5I
         YCeJMEhi7aKewLIulWjaI8Sbj8gnXNXJFWamQtPkabx5B+vKq0FvlZD5XB1yzVEqNIQy
         23QrH63PwxcPU/d53Ycpw8vg3aBOAXmdbafT7yEbjv9vCJtXs+ifmX16avVQ9IdUE7/C
         bEPvXYyIywTiOFe+xF4xEPbxxxaRq269k4EIDSo4Tz9ch/Kh+BfJEOVnEzBOAR6L2nEH
         LGWuUJc2fJEp23U6uLnz9D8fGVcMvns7FeviO3dajGTo89FukN8tdsunOzsRKhDTm0Nl
         Ur3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z5Cepyi5kn4wd4FWddheSiToZBY6ONr0o29KGf5Ep/4=;
        b=pKr68QxPxj0YHAofmCbcChNrLjRzY7baTIUor53wC2g6cbxRh89au2Om1h2aBNzGts
         jUJBIkdqTBxbCroBTFjJrScPxNo6vh/v/13HsjtZPqIiHnDANzwyR2ZEwW+z7owGxNNH
         ZSo1uudDpJcRln/qZJpM7u5mG9REP50D6bc1c9PM8QKqO9jWwKKO0t5s1V6fuu5zq+Sv
         etP/9ErYp3DPP4DmrBkDgYuo56ErzJYANEXRvM3VKsBgtxFNvYW5Cl4zRLAQPj2jJo8a
         o5jpjC719sGym4q4dxFQgj3JdsdsGUWQXdBbEFHFwi27vCHDDR0FbY4uYAIdLIFbOnh7
         JV9w==
X-Gm-Message-State: AOAM533jNGD0+WJcPFJVRP2pCMz3IyzmzhjkDtFZJ3fEND/f53O3Q+fI
        DdIrJuDebYn8tVcT5b23dKQRdg==
X-Google-Smtp-Source: ABdhPJyYht9VvXJx50Zeae7t2t/+qCdx86+1Ze5o2LEoQ3T7rqEy+FQpOY2vOkjCch4A89dx3W+WvQ==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr21207312wrp.269.1615799656537;
        Mon, 15 Mar 2021 02:14:16 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:16 -0700 (PDT)
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
Subject: [PATCH v5 06/11] lib: bitmap: order includes alphabetically
Date:   Mon, 15 Mar 2021 10:13:55 +0100
Message-Id: <20210315091400.13772-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For better readability and maintenance: order the includes in bitmap
source files alphabetically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.30.1

