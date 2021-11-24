Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0BA45B965
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 12:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241775AbhKXLqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 06:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241755AbhKXLqT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 06:46:19 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C72AC061759
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:43:07 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l16so3633391wrp.11
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdC8L7KcajeuYgRxRzq/BDd9/Try3NuMaNKMjlQg9Bs=;
        b=JfQHaBeQHSrZ3rQZiqWsi9BL8YK2+nptrMjPCQoT0ouSL81Mp1dyq4OivxwIBmf/05
         3m8nxt7MF1vEs9/Ew9m41Z4QJWjU75i1qWcefzNze5JdYdApVfenwAOIuVg4GLSR1W3D
         blgqLXRG7Wiw5/Q7VMDR7hJfyD+6Wbxr22bQYXzCPDr4nW/YiBMFtw1YeRJyzEq6iPb+
         F1h2nZ7yXL64w4FPboiT3CdlUpvfw2YanraWyvO3NXkZV/dfs4xg5uwQuTHU+UdHqmyi
         ynLhKp6+ZMUrbfVx+qE6fy8MvCm3HC7wi9hnShE+GzM4iNeqSvm87oT/5n/I1B+1HB5P
         MktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdC8L7KcajeuYgRxRzq/BDd9/Try3NuMaNKMjlQg9Bs=;
        b=M4kk9Z3q0gIkqCRtKRh2tnZw3TzJz4M9k3LGR3ED/jUAGo57DErg4of8ZCCEsOKQec
         PcwQOBMyYfe46URl8nWP2aYEaOyRpOY9TwOKVkIdV61dTsPyTgJo8ByHjzhvQ0/HNf+2
         GgbsMzuse/EKvZAZR9fNRN2RSPI58/RSynITjX/Jhyw0MhJ3+CgNlfdfsc2kN30Qb6iJ
         NRcG9WBdWF51zd4F4VjznYSHietX9ufn8DE9MrLhFrhYVTu1mUoGdlbNOXqpzZH0qZ14
         HNsQ2L3H9+ySWiAmnXoDcYfJ9lOI+vFsyeJpwZpQ1ln6s2kAYwZhGVNQO0BGsKS+nqya
         K/Aw==
X-Gm-Message-State: AOAM531vFNNimAitZpBk3YTbmlAFgYpUIezkV+kvDBh12aMw3CtSTN+B
        ISiivSgQTv/Z233CNWW7Q9H8xw==
X-Google-Smtp-Source: ABdhPJxyPOtabszFxtmqMNt8tHaetSgoIQ7WYcSaBCCT9+/X2ptg2utUgV4syQmIjoYP6E73dul3Kw==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr18242939wrz.147.1637754185908;
        Wed, 24 Nov 2021 03:43:05 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id s63sm5165173wme.22.2021.11.24.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:43:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v10 4/5] selftests: gpio: add a helper for reading GPIO line names
Date:   Wed, 24 Nov 2021 12:42:56 +0100
Message-Id: <20211124114257.19878-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211124114257.19878-1-brgl@bgdev.pl>
References: <20211124114257.19878-1-brgl@bgdev.pl>
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
index a40b818c394e..293aa9749408 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,7 +2,7 @@
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
 CFLAGS += -O2 -g -Wall -I../../../../usr/include/
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-line-name.c b/tools/testing/selftests/gpio/gpio-line-name.c
new file mode 100644
index 000000000000..e635cfadbded
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-line-name.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for reading line names.
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
2.25.1

