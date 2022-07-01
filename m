Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E70456321A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbiGALBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbiGALBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:01:01 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3598048E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:01:00 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so1355325wml.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJldAKKHinXa/XRWbYBZ2KokKSoOQLC7ui9hKeuDCm8=;
        b=bdvORm6xs7okZdEYEbyQdn04Uwd0JirGXgHK3B/LOgaO4Ppr7HDsDYCpqKu3kdtrAn
         Y+XBJ1AKl/ZOwpO84cZCJtRVBlPgWdpXlOalPqsNZAXCidN1PRc6nxSQKw+KEySy5BHu
         uCv7U9psOocLM3ZDn726hda6vqRzXvFO6FRzq4x9YcF5UzylccYt1V70iml8zKkGTuSc
         3KZcl8nmPDR1+S0Y32F0sOHKjklhokHtuObx4/KNgEkoa54dPGMFHILplXo2mkCFtDJ+
         N8nP3920SIJXcXbOH8R+1uuLI5tXo8l9l42g3NDuUjM/fhpivmtim9/oX0i6PJQk1opo
         au3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nJldAKKHinXa/XRWbYBZ2KokKSoOQLC7ui9hKeuDCm8=;
        b=3A2DoiRgALv1e7bMEqREq9h4Yf8HLHl7nuiKfckeVRWOwDcLi0+CXzMYunXAPUHSHp
         3oG9UYKkQUWcKehgKIP5pxEEQI7jdjXNGaZ0l7ddEIkBG++WNIMNDnwF4qDpaVAf56Vl
         0DJKCW+OaUdr+nZaBBPSYzYqLhQfEfVZLQKEK6WOlrGpiK086cBi/naR6MvJNKU9neBi
         5t+7fvs5UflIl4iPYr6w4d1Ondts7Ogwgl0fOfGloBt5YhzMKgZcIMlu0IBF+vZ08iwG
         T6hkxCldLUoR9HXv5ejjYXO0IkXroFIj/VfruHhZx43jeVkiSHTXHSF15xnwuM6tDBEN
         P9EA==
X-Gm-Message-State: AJIora+b2ydIwZCvah3lwBKV2P1RsIPojt5QYmKBgu8gHWzNwqUEEmBH
        IPJSK4IB2vNUSNATMLrVt1yzHA==
X-Google-Smtp-Source: AGRyM1u29bJdk2BIpvpggCS7kkkg30osRK6HvhvGTCWMaTKkx51GvEVtwdGwxQMMYbnAL4LexiuCeQ==
X-Received: by 2002:a7b:c8d8:0:b0:3a0:42ca:d03 with SMTP id f24-20020a7bc8d8000000b003a042ca0d03mr17712102wml.167.1656673259018;
        Fri, 01 Jul 2022 04:00:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:694b:5dfa:a897:b176])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d6343000000b0021a36955493sm21392888wrw.74.2022.07.01.04.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:00:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH] misc: make gpiod_is_gpiochip_device() not set errno
Date:   Fri,  1 Jul 2022 13:00:56 +0200
Message-Id: <20220701110056.58502-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function should just report whether the file indicated by path is
a GPIO chip or not. Let's rework it to not set errno. Failure to open a
chip should still report errro numbers like before.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 lib/chip.c         |  2 +-
 lib/internal.c     | 65 +++++++++++++++++++++++++++++++++++++++++++++-
 lib/internal.h     |  2 ++
 lib/misc.c         | 62 ++-----------------------------------------
 tests/tests-misc.c |  2 ++
 5 files changed, 71 insertions(+), 62 deletions(-)

diff --git a/lib/chip.c b/lib/chip.c
index fc3dda2..666a1ac 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -21,7 +21,7 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 	struct gpiod_chip *chip;
 	int fd;
 
-	if (!gpiod_is_gpiochip_device(path))
+	if (!gpiod_check_gpiochip_device(path, true))
 		return NULL;
 
 	fd = open(path, O_RDWR | O_CLOEXEC | O_NONBLOCK);
diff --git a/lib/internal.c b/lib/internal.c
index b7da67e..ba7b90f 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -1,12 +1,75 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <errno.h>
 #include <poll.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+#include <unistd.h>
 
 #include "internal.h"
 
+bool gpiod_check_gpiochip_device(const char *path, bool set_errno)
+{
+	char *realname, *sysfsp, devpath[64];
+	struct stat statbuf;
+	bool ret = false;
+	int rv;
+
+	rv = lstat(path, &statbuf);
+	if (rv)
+		goto out;
+
+	/*
+	 * Is it a symbolic link? We have to resolve it before checking
+	 * the rest.
+	 */
+	realname = S_ISLNK(statbuf.st_mode) ? realpath(path, NULL)
+					    : strdup(path);
+	if (realname == NULL)
+		goto out;
+
+	rv = stat(realname, &statbuf);
+	if (rv)
+		goto out_free_realname;
+
+	/* Is it a character device? */
+	if (!S_ISCHR(statbuf.st_mode)) {
+		errno = ENOTTY;
+		goto out_free_realname;
+	}
+
+	/* Is the device associated with the GPIO subsystem? */
+	snprintf(devpath, sizeof(devpath), "/sys/dev/char/%u:%u/subsystem",
+		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
+
+	sysfsp = realpath(devpath, NULL);
+	if (!sysfsp)
+		goto out_free_realname;
+
+	if (strcmp(sysfsp, "/sys/bus/gpio") != 0) {
+		/* This is a character device but not the one we're after. */
+		errno = ENODEV;
+		goto out_free_sysfsp;
+	}
+
+	ret = true;
+
+out_free_sysfsp:
+	free(sysfsp);
+out_free_realname:
+	free(realname);
+out:
+	if (!set_errno)
+		errno = 0;
+	return ret;
+}
+
 int gpiod_poll_fd(int fd, uint64_t timeout_ns)
 {
 	struct timespec ts;
diff --git a/lib/internal.h b/lib/internal.h
index c87df91..12f184e 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -18,6 +18,8 @@
 
 #define GPIOD_BIT(nr)	(1UL << (nr))
 
+bool gpiod_check_gpiochip_device(const char *path, bool set_errno);
+
 struct gpiod_chip_info *
 gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info);
 struct gpiod_line_info *
diff --git a/lib/misc.c b/lib/misc.c
index 5c326eb..b0899b3 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -1,71 +1,13 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#include <errno.h>
 #include <gpiod.h>
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <sys/stat.h>
-#include <sys/sysmacros.h>
-#include <sys/types.h>
-#include <unistd.h>
 
 #include "internal.h"
 
 GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 {
-	char *realname, *sysfsp, devpath[64];
-	struct stat statbuf;
-	bool ret = false;
-	int rv;
-
-	rv = lstat(path, &statbuf);
-	if (rv)
-		goto out;
-
-	/*
-	 * Is it a symbolic link? We have to resolve it before checking
-	 * the rest.
-	 */
-	realname = S_ISLNK(statbuf.st_mode) ? realpath(path, NULL)
-					    : strdup(path);
-	if (realname == NULL)
-		goto out;
-
-	rv = stat(realname, &statbuf);
-	if (rv)
-		goto out_free_realname;
-
-	/* Is it a character device? */
-	if (!S_ISCHR(statbuf.st_mode)) {
-		errno = ENOTTY;
-		goto out_free_realname;
-	}
-
-	/* Is the device associated with the GPIO subsystem? */
-	snprintf(devpath, sizeof(devpath), "/sys/dev/char/%u:%u/subsystem",
-		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
-
-	sysfsp = realpath(devpath, NULL);
-	if (!sysfsp)
-		goto out_free_realname;
-
-	if (strcmp(sysfsp, "/sys/bus/gpio") != 0) {
-		/* This is a character device but not the one we're after. */
-		errno = ENODEV;
-		goto out_free_sysfsp;
-	}
-
-	ret = true;
-
-out_free_sysfsp:
-	free(sysfsp);
-out_free_realname:
-	free(realname);
-out:
-	return ret;
+	return gpiod_check_gpiochip_device(path, false);
 }
 
 GPIOD_API const char *gpiod_version_string(void)
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index c473aff..d3c9a82 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -15,7 +15,9 @@
 GPIOD_TEST_CASE(is_gpiochip_bad)
 {
 	g_assert_false(gpiod_is_gpiochip_device("/dev/null"));
+	g_assert_cmpint(errno, ==, 0);
 	g_assert_false(gpiod_is_gpiochip_device("/dev/nonexistent"));
+	g_assert_cmpint(errno, ==, 0);
 }
 
 GPIOD_TEST_CASE(is_gpiochip_good)
-- 
2.34.1

