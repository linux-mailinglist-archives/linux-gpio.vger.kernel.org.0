Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4453B414427
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbhIVItl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 04:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234093AbhIVItb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 04:49:31 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535F5C061760
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:48:01 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w17so4412453wrv.10
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RRLokZD/JzyOrQQERF9ZVv3TJYiF2A/gea/eW+3tWFo=;
        b=aNsO5NvwlXAbSMpyqdmti1a5eJXxXUGAJJ9+f+MxqqT1zBASwIQa74Yw+vAuFpKF8j
         30C9HAtyzP6Z9Mi8VEbflUPWjrmWDV0oClrJ7UuICcr/QJD+/9ziEP3BsO4nDsJiE1nr
         GQMWtef8wEtA6AuZpoeETIQOS8v8ZTdxGlmfp49QR+9edEFvegntL+i72F3hOTS97VvV
         D+6EQLG8QvPkuUrSZeXI1Dy68lcEeM5E5r9qfoSTQsiEorlVkTRgJFk4BmvkA5O4VRzx
         LiQZ+LuJtkK5zE0Fr4+iELstNLsqi+IIQK0ZcbBuPd174++sPn1N3vSPnSOt+oxxIyu+
         frUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RRLokZD/JzyOrQQERF9ZVv3TJYiF2A/gea/eW+3tWFo=;
        b=dMttwTXODDoYr3GoebssDhvmOolG9HSPC1/r/JkxbcKz4EcJ3kv7ZG//zRuna/qof9
         XWWjcTyT+EXK5pgy60aqhV3sUsxQxE2LZl8Rd0HwI1YWSAiEGOWdWouG2JE7Y/qmrmEz
         W0ZUUci9pQ+3+NAmRjc8WZXJ9f8fQCVkDSc87wdXPHzg0LcCPAIWMDY7zuXOrVWf0yDx
         bNYP3k4odUNkNjN4Hi7TPy/XlXpMuwz480U6b3MuScgqkJDEUT2+4U/FkSukVlP5Iec6
         Dm9xo+3nbLorCazpZ3Y3itI4pFQRsoo4kBPHQNL2900IIrl7LNcyf51ijREBRQfDPuE8
         /tLQ==
X-Gm-Message-State: AOAM532ZPpEOOUazboGYrpiN86PpdqOCLOmBFiu3iLHtPc5ENt8Oqpjm
        bhcfKCNverLyg4mAbO6VMVENNQ==
X-Google-Smtp-Source: ABdhPJzeJcd0F+IQTFEFeQXKNx/dDRB7H4o7IJmIyY/BPJY8bfWn8pr1Y7z2gDBz9w4fgyqPFdoUHQ==
X-Received: by 2002:adf:e404:: with SMTP id g4mr40204337wrm.143.1632300479895;
        Wed, 22 Sep 2021 01:47:59 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v10sm1591048wri.29.2021.09.22.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:47:59 -0700 (PDT)
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
Subject: [PATCH v6 6/8] selftests: gpio: provide a helper for reading chip info
Date:   Wed, 22 Sep 2021 10:47:31 +0200
Message-Id: <20210922084733.5547-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
References: <20210922084733.5547-1-brgl@bgdev.pl>
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

