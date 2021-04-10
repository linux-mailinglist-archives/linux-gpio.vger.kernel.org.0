Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AD935AE8A
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbhDJOw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234708AbhDJOw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:28 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1C9C06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:14 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b9so8428340wrs.1
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4Lcquf98dVExz2H3KzzF8vSQl1JBIL4fU7X36zzT0o=;
        b=dqvgCUAZxe7vJOIGetRYlN5cPZ+R5/zjMTt9j+2X4/u5hjVi18qjTp1HgtHroo/DMr
         IqhSyh7bwJN7r4knDwAGNftrJM1zagQImA0fEHS1mMF0n9Z3kxrd1tY8feog/JVBVbCU
         rvieSmDUKbzbcxdin3zeJx6hYjlZFBSWuG4tYn13+Sys/GFIBKjlJRM0OppcAucjPm7E
         zOklJVX7tWuDv67BFOfr9YV7ncM/H31MTX/tW3Gmdh9klk4ciR8PyX9ywvvBS7Qd1Gbg
         rwju6FfLtKDmuuwJIzgp1k3PQ//q1IXOGhi1p89WFNrbJC5P+GfjwchsKJehIKKB+2nb
         7myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4Lcquf98dVExz2H3KzzF8vSQl1JBIL4fU7X36zzT0o=;
        b=Z5upKbhqkd79qOttGW4CQbE0RJlWVu5jgxBRfvvkzLH5V24OPqBqzdvfTJGYIgZTMf
         0gLSPc5F2P6pvOB1pld15X98HpKMJlLoVx+NiD6AMkVgMWa1oUvP+9iCJE7lBR8fTAoZ
         m+12jVLyBoxCnR4dbOPFd76o9MceO2M/tFdmMc9ipN92jpMfk4d8frurgJa3pj7hmoxo
         vI2CDB1iUC3oY+69+sjMabmklzqI5QI6/VXtBeeWCeSbWiO3MzapztB6LRFJYlrqItVY
         867a8bp3Rsg9fXsfhZWa6pBZCz+I+QfvzxeCMRWZdNHiVX7ti079n85RetH0BdEQDYJr
         Jb+Q==
X-Gm-Message-State: AOAM533omO05tOjqfpdfRVEY+3lV625+8AnVRPUv97KYyjf/ZU0Ht2NR
        nC+QVZUgrpxfDOpMtxOex9+Fxg==
X-Google-Smtp-Source: ABdhPJwE9NpmaYAYog+JIj4WOHYhHVgWAFffvg5ZpYFOH1CFUJ9VMchj0B3/dy3t7HoQ1U0KJtK6ZQ==
X-Received: by 2002:a05:6000:24e:: with SMTP id m14mr22943159wrz.199.1618066332859;
        Sat, 10 Apr 2021 07:52:12 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 2/6] core: add refcounting helpers
Date:   Sat, 10 Apr 2021 16:51:53 +0200
Message-Id: <20210410145157.30718-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In v2.0 all objects will be opaque and refcounted. Add a set of helper
functions and data structures for refcounting.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 lib/Makefile.am |  2 +-
 lib/core.c      | 52 ++++++++++++++++++++++++++-----------------------
 lib/internal.c  | 22 +++++++++++++++++++++
 lib/internal.h  | 19 ++++++++++++++++++
 4 files changed, 70 insertions(+), 25 deletions(-)
 create mode 100644 lib/internal.c

diff --git a/lib/Makefile.am b/lib/Makefile.am
index 8441584..5c7f353 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c helpers.c internal.h misc.c uapi/gpio.h
+libgpiod_la_SOURCES = core.c helpers.c internal.c internal.h misc.c uapi/gpio.h
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/core.c b/lib/core.c
index 2e7ee4b..0f3937b 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -65,7 +65,7 @@ struct gpiod_line {
 };
 
 struct gpiod_chip {
-	int refcount;
+	struct gpiod_refcount refcount;
 
 	struct gpiod_line **lines;
 	unsigned int num_lines;
@@ -246,6 +246,30 @@ out:
 	return ret;
 }
 
+static void chip_release(struct gpiod_refcount *refcount)
+{
+	struct gpiod_chip *chip;
+	struct gpiod_line *line;
+	unsigned int i;
+
+	chip = gpiod_container_of(refcount, struct gpiod_chip, refcount);
+
+	if (chip->lines) {
+		for (i = 0; i < chip->num_lines; i++) {
+			line = chip->lines[i];
+			if (line) {
+				gpiod_line_release(line);
+				free(line);
+			}
+		}
+
+		free(chip->lines);
+	}
+
+	close(chip->fd);
+	free(chip);
+}
+
 GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 {
 	struct gpiochip_info info;
@@ -276,7 +300,7 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 
 	chip->fd = fd;
 	chip->num_lines = info.lines;
-	chip->refcount = 1;
+	gpiod_refcount_init(&chip->refcount, chip_release);
 
 	/*
 	 * GPIO device must have a name - don't bother checking this field. In
@@ -306,33 +330,13 @@ err_close_fd:
 
 GPIOD_API struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip)
 {
-	chip->refcount++;
+	gpiod_refcount_ref(&chip->refcount);
 	return chip;
 }
 
 GPIOD_API void gpiod_chip_unref(struct gpiod_chip *chip)
 {
-	struct gpiod_line *line;
-	unsigned int i;
-
-	chip->refcount--;
-	if (chip->refcount > 0)
-		return;
-
-	if (chip->lines) {
-		for (i = 0; i < chip->num_lines; i++) {
-			line = chip->lines[i];
-			if (line) {
-				gpiod_line_release(line);
-				free(line);
-			}
-		}
-
-		free(chip->lines);
-	}
-
-	close(chip->fd);
-	free(chip);
+	gpiod_refcount_unref(&chip->refcount);
 }
 
 GPIOD_API const char *gpiod_chip_get_name(struct gpiod_chip *chip)
diff --git a/lib/internal.c b/lib/internal.c
new file mode 100644
index 0000000..52b9461
--- /dev/null
+++ b/lib/internal.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.h"
+
+void gpiod_refcount_init(struct gpiod_refcount *refcount,
+			 gpiod_refcount_release release)
+{
+	refcount->refcnt = 1;
+	refcount->release = release;
+}
+
+void gpiod_refcount_ref(struct gpiod_refcount *refcount)
+{
+	refcount->refcnt++;
+}
+
+void gpiod_refcount_unref(struct gpiod_refcount *refcount)
+{
+	if (--refcount->refcnt == 0)
+		refcount->release(refcount);
+}
diff --git a/lib/internal.h b/lib/internal.h
index 8b3f69a..a652879 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -4,8 +4,27 @@
 #ifndef __LIBGPIOD_GPIOD_INTERNAL_H__
 #define __LIBGPIOD_GPIOD_INTERNAL_H__
 
+#include <stddef.h>
+
 /* For internal library use only. */
 
 #define GPIOD_API __attribute__((visibility("default")))
 
+#define gpiod_container_of(ptr, type, member) ({			\
+	void *__mptr = (void *)(ptr);					\
+	((type *)(__mptr - offsetof(type, member))); })
+
+struct gpiod_refcount;
+typedef void (*gpiod_refcount_release)(struct gpiod_refcount *);
+
+struct gpiod_refcount {
+	unsigned int refcnt;
+	gpiod_refcount_release release;
+};
+
+void gpiod_refcount_init(struct gpiod_refcount *refcount,
+			 gpiod_refcount_release release);
+void gpiod_refcount_ref(struct gpiod_refcount *refcount);
+void gpiod_refcount_unref(struct gpiod_refcount *refcount);
+
 #endif /* __LIBGPIOD_GPIOD_INTERNAL_H__ */
-- 
2.30.1

