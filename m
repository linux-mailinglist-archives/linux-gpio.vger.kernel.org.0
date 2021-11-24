Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F35345B960
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 12:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241740AbhKXLqa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 06:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhKXLqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 06:46:16 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9541EC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:43:06 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so5171329wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 03:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2GWUpkiuXSzN66GVjCDh6suML+iAta4LGHtIvVqjGEk=;
        b=T+cTkrxv6yKl5R3DPzBZ5rm1juxysossHr8SGa9Egn+4js1aCjh/mq5jUVmTtYcgOa
         oBnOojqP/FqUb+TjQU0NiNcsgmHXlrwLnMI3fc/niQN58rVllNEQr2MmUbUyrflMpE2t
         4p5iloXEX4Ily3XkMU0H55NejDjRn7+ce7Tx698Y7wJ5+3buzCuOnIvyM9wvvl3jPlJW
         o3rJ/oJ9z2uzxq2DIU6CUH8ZRfpAkKtUy7uI4ve2hRFND5rSkCWudW7KNCGTTMwzguYG
         d1Q0hqCHgd4Ebt2xUBCuDTlFlq81tQ8A+s/uS9LFm8WdcSbs4IozjJAxMxwfY5HoWiIz
         4UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2GWUpkiuXSzN66GVjCDh6suML+iAta4LGHtIvVqjGEk=;
        b=rOFEwikGZ0AQ8VEXLtnUDbXSCzl7gDUUB4sQDj7XOfCGnW2gsYmw+4UQVCRoiQ/QzV
         AxOXJkLk/+L9YOd5vp8xzZN/O5vvH8czRKW+OD2hcjueEA1gPaDbkMdS5/I4lQwMbFt8
         nqKnILAfPP3ohU6XgcbNcXf9VBi2dmY/SZHT+TW4pxAhyP09dgb9SbuvXqQnQVgjboRi
         7t6Q8kWpw16JMjQnLcLUCK22LNFMyarB+dwQSnEZiWfhVMkd/xDashqInLY1iKDL01y5
         kR6nxAcvNkgtWO0vTh06FNk5ynz7QxMhkfzUnG6m45vTMKPMuev4/kcp2GlPaBm5qSUb
         b2Aw==
X-Gm-Message-State: AOAM530lPhErCtsNi7pEBKnP0W1f86f+gvxoTcPzWx/7miT7WiWyEATY
        FanO1b8+ls0G7kKfq00ZYUf+AQ==
X-Google-Smtp-Source: ABdhPJyzuZxOeKbqLPfgN1DtJnd990r+dnzV69Kaaz8MyitgmqoBQ+cgJzwpjO86kM+SAUTfZ+SzOw==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr14900744wmk.34.1637754185100;
        Wed, 24 Nov 2021 03:43:05 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id s63sm5165173wme.22.2021.11.24.03.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:43:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v10 3/5] selftests: gpio: provide a helper for reading chip info
Date:   Wed, 24 Nov 2021 12:42:55 +0100
Message-Id: <20211124114257.19878-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211124114257.19878-1-brgl@bgdev.pl>
References: <20211124114257.19878-1-brgl@bgdev.pl>
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
index 000000000000..8f2d2e23e9f6
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
2.25.1

