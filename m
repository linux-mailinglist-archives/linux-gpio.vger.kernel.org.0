Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BCE43393A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhJSOwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 10:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbhJSOv6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 10:51:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7181C061776
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 07:49:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v127so12137286wme.5
        for <linux-gpio@vger.kernel.org>; Tue, 19 Oct 2021 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RRLokZD/JzyOrQQERF9ZVv3TJYiF2A/gea/eW+3tWFo=;
        b=fb5fr+n1Qs4KOlkmvLebVq2EL1cnIw+NKAzgz1YRUgX05VlF28Yk/o0Aw28FQH8sej
         xU6mh5dz9JMh52mzClUKU25AjeWl02lzW0Y299eWZxdojq3oh7/IxHRg9QradwnTuvnn
         fnwLd+e1Clo4H/WpLaD0F2Bz15Si1wdUvWXvPmY/8kRRo05A9pB7Rdhd7mk8YHk6kDRC
         hkxdCM7emclyysyAsWq6kwApnLzUlelP0T5dEtjz0ZApz1fk/GDYITajJnivzTdehFuG
         eUzYsIGfk3wRL6p30JUNxViKRp0AMNGRcroacfQrMAwuZFeZjpmiKLQeC6xWo3tjNJpO
         /0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RRLokZD/JzyOrQQERF9ZVv3TJYiF2A/gea/eW+3tWFo=;
        b=xWEB78XhOcz2Wdggtnerm2G4VHRrRT4mN7TVy8l82noy3E+dN02TAbQDUssgZTNXps
         69eDt17sm14tOjtyiCq867wAJFBIoJO50/QEsLYCceovoFJyj04xDYlZq2JcHFZYk0wm
         38pINIp71g3q2g0PzWBK3JDHzPFxTa4lTwxu+tGPqGMKidA7twMg7s5qzZFKjaipG/zj
         cqgtJSjsiA/mweZM2orcy7OHBrwrO93ZPN72cXN24dRyampcpikkj2Plssw0H8D+wYH8
         h8cpHQ2D52Aq+AHcSKF6u+YYn+BRp+wt8KTMORWN9zZhQMLH4c28fIh2cNeHw7GxkHdV
         ybCw==
X-Gm-Message-State: AOAM533t0fSEmkB8GmgJ5EWFxpREEhhADPB8Klr7MrgsrwtMoQHtzBFb
        Q2pKld3oSC98qS5cV3opjxVx/A==
X-Google-Smtp-Source: ABdhPJwRGdQs7H0trUYxKLHXBugtRzpikuia7E25CLjO5vt9U8eM6UDBpIttAt2rDPaNItdC1FKjuQ==
X-Received: by 2002:a1c:14b:: with SMTP id 72mr6648188wmb.188.1634654965497;
        Tue, 19 Oct 2021 07:49:25 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm16212752wrd.28.2021.10.19.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:49:25 -0700 (PDT)
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
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v8 6/8] selftests: gpio: provide a helper for reading chip info
Date:   Tue, 19 Oct 2021 16:49:07 +0200
Message-Id: <20211019144909.21959-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211019144909.21959-1-brgl@bgdev.pl>
References: <20211019144909.21959-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a simple program that allows to retrieve chip properties from the
GPIO character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
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

