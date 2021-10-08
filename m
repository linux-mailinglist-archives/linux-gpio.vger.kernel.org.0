Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957154265C0
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 10:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhJHIT5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 04:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbhJHITq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 04:19:46 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B7EC06176E
        for <linux-gpio@vger.kernel.org>; Fri,  8 Oct 2021 01:17:50 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k7so26991680wrd.13
        for <linux-gpio@vger.kernel.org>; Fri, 08 Oct 2021 01:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XGPFAB413i4NSgL53tMC4PneOe4C16/1HV5Loq6Wys=;
        b=KN/7LWDaRYRSsJOmXpGlR61T+vUiSUgUV52J1zbB49eVbU21A0nWargFNSciJ9vCOH
         uVR/PeTvJ0uS+FFJARPLH91JUDhUqlDuHUMtc9GKbpn3UwD9SfesZbaP88UorrjJfyxJ
         Nu7kbwdoQ7EbSbZceFBZ32UnMe668+SjpFW7UgHSmdm1oXNWXVWZWzO9GrbLLFmEEahH
         qEwRmnjKm/LXJtDGef6vwOTT5P1z5sWpaArnLZWAHNl8EWOdcSX263AhNi6ryetFwfTu
         B8MSTArntaAZj2vIk6ytWeF+D1fWJXTrPLWanRrkWb8DZzBt8RUaVRVJhBktWhdmNhkI
         Eciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XGPFAB413i4NSgL53tMC4PneOe4C16/1HV5Loq6Wys=;
        b=Mr0cyQ+0hEom+9W5mvX9qvwn83KvFRE5XXWPiRf11Cwjtcd0BWQQ/LTkIxNneatJjy
         x2a90Ogt+YHB2RET3o7bFjei6H7Md1BUGNyIRMcOeUehQfxfBO4nqDZ2a1edUJUvdZJV
         6p+YC9yBh3d3cYjfdBITfDjrfr0O7MzIyLBm0XswznLyY/dGKWvES7re19lMBt6lxRy0
         OvjlJajruJhmqo2NVb44s6OeaYKXdBVm3dHlMeIweAHN5gVKEzp0dsuXszlT8RiVZHPX
         Jc6R1/jhnvt0Bj/YoFHoekVrt/sLealxWD1NsSibn66LQrUtr04+ghV8z5ObqJOviG8E
         cdbQ==
X-Gm-Message-State: AOAM530K+QfXADXJgiBuzjEXW6iB36tQzb6us6JrdiKQBuEob11g3VoN
        Wl1FfHmJR/QmcotYdrIveSzLZg==
X-Google-Smtp-Source: ABdhPJw6Ksw5oVZRq328sfwc1ILw9WVuVxkYEHtEisDv8IU8/GDy3BEBPH1PdtI9N4f8NovuBJ6cBg==
X-Received: by 2002:adf:a319:: with SMTP id c25mr2301868wrb.307.1633681069549;
        Fri, 08 Oct 2021 01:17:49 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm1759530wrn.34.2021.10.08.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 01:17:49 -0700 (PDT)
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
Subject: [PATCH v7 7/8] selftests: gpio: add a helper for reading GPIO line names
Date:   Fri,  8 Oct 2021 10:17:38 +0200
Message-Id: <20211008081739.26807-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211008081739.26807-1-brgl@bgdev.pl>
References: <20211008081739.26807-1-brgl@bgdev.pl>
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

