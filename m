Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48E8467857
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 14:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352223AbhLCNd5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 08:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352201AbhLCNdy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 08:33:54 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F59C06175C
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 05:30:29 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id c4so5715418wrd.9
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLE3QPwL4b8b/ee9pGQMjsQcF3NssyLlDXPOSMNwayg=;
        b=inqTLd+UidSJWDiQpapSdiFQCp6X12PxJReDFzdberXJgpVrzCpqsutmvJoqEx4n1H
         1786xp8mvAO7daoh4uhyOunioChOGtNjTd0z/ccdz+YvlCmZ8mYtoaFNpWv2Bjjc2P0F
         ofH9Ho6SlWHAuzYIyh0JlpykA/zngdUgolQrUAyI1Nu3haI/IkOB3kWwbNtpwCRpQWZy
         ncaCW6UviVxnR7p9QPuh9KHVswELItObJvZ8sGZBJwvVfEyNPf8UGbsjN3hFFXvEup35
         /IOVSajPlDbgAZTstHFFE+GtgzWKm1dEH6fFxcy3hKvRDiWdo+UOYM+6n9g3zhK2a83L
         SqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLE3QPwL4b8b/ee9pGQMjsQcF3NssyLlDXPOSMNwayg=;
        b=0OybFLvcjN6AKi9Wp31xn2tZH73F3gnxcIAYldJzfzr/X2gLHrB/GNT7oVlnKu+fBu
         JmXYZVshejZ3FMEodnodi5VFykJyT7Pr7l2WIA89w9qPZfj8BgmL/LEdbI3YoB5SuzDq
         sBLKSZj/VcWwy4fy99CLxsdGOCmQ/i+uXE6FJNB5f5KLU69IFyab2tsBdT/4dX6Hz4Zt
         l13QrkQhYZX+8BlP5omSKQOTG3ujcY8FPFVnVh0PaoPD7DvM0faAk9VL30uA+rr6Wd7r
         4EgRp+6va1RKzYG05jWqvxkIGLACXFIJyGhkONzOEY9MQmA1VNkYanbH2QRLa6WFWs55
         b6kg==
X-Gm-Message-State: AOAM530SnNU2pYiLfAUy1Afj8UDumRLnTlk6ALcJnamGJVTOhhpnklBB
        NyfpY8sNJhJntagsfXepd1pY1g==
X-Google-Smtp-Source: ABdhPJzOJMqea8JZBCGLqnGpTk1MW+6vAFHXG0OCTgyHLFydyuZLvxu7ywVJZbvEbqGnkSoo86bLNA==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr22409779wrv.371.1638538228347;
        Fri, 03 Dec 2021 05:30:28 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j11sm2755910wrt.3.2021.12.03.05.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 05:30:28 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v12 5/7] selftests: gpio: provide a helper for reading chip info
Date:   Fri,  3 Dec 2021 14:30:01 +0100
Message-Id: <20211203133003.31786-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211203133003.31786-1-brgl@bgdev.pl>
References: <20211203133003.31786-1-brgl@bgdev.pl>
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
index d7b312b44a62..a40b818c394e 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,7 +2,7 @@
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info
 CFLAGS += -O2 -g -Wall -I../../../../usr/include/
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-chip-info.c b/tools/testing/selftests/gpio/gpio-chip-info.c
new file mode 100644
index 000000000000..fdc07e742fba
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-chip-info.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for reading chip information.
+ *
+ * Copyright (C) 2021 Bartosz Golaszewski <brgl@bgdev.pl>
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
2.25.1

