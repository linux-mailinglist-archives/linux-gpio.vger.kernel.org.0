Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FA0411656
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240147AbhITOIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239990AbhITOH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:07:57 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8504DC0613E0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:06:25 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t8so23067171wri.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XGPFAB413i4NSgL53tMC4PneOe4C16/1HV5Loq6Wys=;
        b=sn63zWiqSF+N6QwonxTljIMsMcdLN8iXcZKFzHEB3PregYHpxTZSbHtHJ2UgE2l+W9
         Bv6SgG6GI0EZlPPT+De8Sd1kCJPly8/MZ2IpX9pVPIaz600NDZfIrGz3YwnqeTBmOLlR
         W9oDWS8wNXda4zqPUC3/XdA5ypHq9bujM2HHxdtOt4B7R/a9HdCgOJH6Talk2mDZej0a
         IbxxNzwmvFqyqQe9HOtpL5BXsZh2zSZ2CvWtdX22t/iEaBysGurZ11bs1+YBZ/PJebsr
         QQ0uQowVvMY3FRurVWiO/ZafjOhM4IARXsXAOGD3kpchK4UY+r44HDz1Xl3hblMAmFN0
         kzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XGPFAB413i4NSgL53tMC4PneOe4C16/1HV5Loq6Wys=;
        b=yq2vJSp1UX+c2ju5n1yDLA5pPVggCbR7qH+9SHxrNRYUH1buBLm/o6eGtxnNxaFaSS
         Y3Bqm5aqPIynCCvgx1gJtDkqjVpsFtJiVKxntG1fLRyqRY8LtLBg3a8b7i0lb9WJB0p4
         grpUuAJNnNdKnsmcAqO/tZZ8nULx9hI4qcXKCXgBo70y2J7ktg5nre/0lc9S+bCCYZhN
         seAxpDL3mlb3PaCAWPkbzshew5VLeeuvANDostllmJaodv2fplw1yhiG2gEBaevKxCBt
         rlJ4vXpySTSFrEBRvUgA3SSLnGX+8/8m8qSmqWpwDC1Db8EKvbN43b9N175d831Ayg35
         rxxg==
X-Gm-Message-State: AOAM5334jNb98wA/LGoZANv0glNCewZ6/4Ad9J5JpQb6pinA8tLomn9c
        N39/s8ZOMsBSGgPaMr+dlCobKA==
X-Google-Smtp-Source: ABdhPJwzTMIFrIJTRcaHMgg3eXpjrj8TrNLM5oCkH1NXVGt/0Sj81kED43FrUg8te9MKLVrZDn9lzA==
X-Received: by 2002:adf:80e2:: with SMTP id 89mr28509694wrl.43.1632146783936;
        Mon, 20 Sep 2021 07:06:23 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id h18sm15801461wrb.33.2021.09.20.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:06:23 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 7/8] selftests: gpio: add a helper for reading GPIO line names
Date:   Mon, 20 Sep 2021 16:05:08 +0200
Message-Id: <20210920140509.5177-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210920140509.5177-1-brgl@bgdev.pl>
References: <20210920140509.5177-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a simple program that allows to read GPIO line names from the
character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tools/testing/selftests/gpio/.gitignore       |  1 +
 tools/testing/selftests/gpio/Makefile         |  2 +-
 tools/testing/selftests/gpio/gpio-line-name.c | 55 +++++++++++++++++++
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index 4ea4f58dab1a..ededb077a3a6 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 gpio-mockup-cdev
 gpio-chip-info
+gpio-line-name
diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 84b48547f94c..d7d8f1985d99 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,6 +2,6 @@
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-line-name.c b/tools/testing/selftests/gpio/gpio-line-name.c
new file mode 100644
index 000000000000..a52e75bc37ba
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-line-name.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for reading line names.
+ *
+ * Copyright (C) 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#include <fcntl.h>
+#include <linux/gpio.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+
+static void print_usage(void)
+{
+	printf("usage:\n");
+	printf("  gpio-line-name <chip path> <line offset>\n");
+}
+
+int main(int argc, char **argv)
+{
+	struct gpio_v2_line_info info;
+	int fd, ret;
+	char *endp;
+
+	if (argc != 3) {
+		print_usage();
+		return EXIT_FAILURE;
+	}
+
+	fd = open(argv[1], O_RDWR);
+	if (fd < 0) {
+		perror("unable to open the GPIO chip");
+		return EXIT_FAILURE;
+	}
+
+	memset(&info, 0, sizeof(info));
+	info.offset = strtoul(argv[2], &endp, 10);
+	if (*endp != '\0') {
+		print_usage();
+		return EXIT_FAILURE;
+	}
+
+	ret = ioctl(fd, GPIO_V2_GET_LINEINFO_IOCTL, &info);
+	if (ret) {
+		perror("line info ioctl failed");
+		return EXIT_FAILURE;
+	}
+
+	printf("%s\n", info.name);
+
+	return EXIT_SUCCESS;
+}
-- 
2.30.1

