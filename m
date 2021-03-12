Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7C1338978
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 10:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbhCLJ5u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 04:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbhCLJ5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 04:57:32 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B56C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 01:57:32 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v15so4450994wrx.4
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aInBliwrC9dHKGFsbWV5Kx8fY6sxq6tzoBmO7q92930=;
        b=NX4mIX5zT3RkA68dsuxbhUlX6TqJT0IcPt2i9YRr8Lt1dtVRVG/dko+xvyCSdjsf8f
         AqOfNgTqexPpiWLwrnXNaRjyczrfmJTQnCatKBNN6ACialpkdj19sxMc7Pj/+4WHOf4q
         2AcRKKJQ3aO2GbuWLSHXHL9IolUMCZJ8CXz5TfBNuDUEekA9zlxSY3GEIfOH+5A4tR7N
         K72C20Nc/Bm39ToYLT0pm4U49Jf6huN5t7R5+MLt8UQfP1d67unPLgChvIuBin6gSXco
         HBoKEDkAGfiPXpN54MvACZrYr7gyhrc/LqR+yMfCBLEA7p2fveetvWojskb+BdTcfhI8
         jj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aInBliwrC9dHKGFsbWV5Kx8fY6sxq6tzoBmO7q92930=;
        b=Imdqax5yqfZkzh7vH4kgxwgI3B92XOjowcajfd/ONl7PRaEAM6juQ1Nprh0Unjl3PT
         mt56CuUNYErwDdeZFR5HG+KwBuedQrDHGjVv5I7sOYSolQde49GT9HKq2ZeTfN/5y59k
         wCDkceF7oNg47O0mIcvi0ik/K3Nxlf1NOAC73zZn/F1G+1yeujB6K0wDqcCKxk3NYMr+
         yW5euk2chIo2iFMRozhogTrigSGqBUbOzil9D/zJQs2fTW31c5jXFF59nbdH6JFfFtOH
         RGAstiDKL3Kf2FSbNhvurbqntPo54C+Z7oFUk1pJoxcF4AmtWsbqskrf7c9nKZEd6u8W
         OZvg==
X-Gm-Message-State: AOAM531AuFvEDl6pvviBE38KTxCeYJ3vyUCrdyJL6Ma+g7O4bguCgLnP
        QIjGxoyCEHbT5aq5keS26QFMug==
X-Google-Smtp-Source: ABdhPJzW7I/UvgyEU61xuRBHuMNUDFO3dYl4QYi+OMv0hpU/3PX8b1Sd4evM403IjAi1n/RJP6vd/g==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr13732851wrm.308.1615543051281;
        Fri, 12 Mar 2021 01:57:31 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id x13sm7031630wrt.75.2021.03.12.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:57:30 -0800 (PST)
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
Subject: [PATCH v4 09/11] selftests: gpio: provide a helper for reading chip info
Date:   Fri, 12 Mar 2021 10:56:58 +0100
Message-Id: <20210312095700.16277-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312095700.16277-1-brgl@bgdev.pl>
References: <20210312095700.16277-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple program that allows to retrieve chip properties from the
GPIO character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 tools/testing/selftests/gpio/.gitignore       |  1 +
 tools/testing/selftests/gpio/Makefile         |  2 +-
 tools/testing/selftests/gpio/gpio-chip-info.c | 57 +++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-chip-info.c

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index a4969f7ee020..4ea4f58dab1a 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 gpio-mockup-cdev
+gpio-chip-info
diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 39f2bbe8dd3d..84b48547f94c 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,6 +2,6 @@
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-chip-info.c b/tools/testing/selftests/gpio/gpio-chip-info.c
new file mode 100644
index 000000000000..4d26fa7c254a
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-chip-info.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for reading chip information.
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
+	printf("  gpio-chip-info <chip path> [name|label|num-lines]\n");
+}
+
+int main(int argc, char **argv)
+{
+	struct gpiochip_info info;
+	int fd, ret;
+
+	if (argc !=3) {
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
+	ret = ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &info);
+	if (ret) {
+		perror("chip info ioctl failed");
+		return EXIT_FAILURE;
+	}
+
+	if (strcmp(argv[2], "name") == 0) {
+		printf("%s\n", info.name);
+	} else if (strcmp(argv[2], "label") == 0) {
+		printf("%s\n", info.label);
+	} else if (strcmp(argv[2], "num-lines") == 0) {
+		printf("%u\n", info.lines);
+	} else {
+		fprintf(stderr, "unknown command: %s\n", argv[2]);
+		return EXIT_FAILURE;
+	}
+
+	return EXIT_SUCCESS;
+}
-- 
2.30.1

