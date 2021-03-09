Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D487333084
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 22:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhCIVAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 16:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhCIU7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:59:44 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B048C061760
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:59:44 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id u14so18514135wri.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRcQM8tGux3x7pZPyJ5Bh3crA9EoJU0QA79n6uNLXsw=;
        b=JEIr7MzgVjowzE3jZS6cPEuxs1huAVh+37B6Dnn8Qt/EsLhOPNtKPLdo0eT7KxY3N9
         up2fYPcf6Wm10n1iUfSQkRZ5JORwGuN0dz8Mm2zQvtU95L51lnjDfXBYSQlLPXWoBiIb
         /j7rhSmDyPQMv2+X3cJD5cRK/CbCXVOdf9mFNsd69VqDFSmejX46Yc0xpaNNJYSVtOYq
         37XEbKE7tvlvVhQvg5Vb46gdN0Lc+YZ2S6SvY+z97T0RY+2LUfKoUIw2L1Xw3aJsmDS1
         /cPYWpPnFvdmPJ6RRuLxritrcB/WesTCLqgQJARsgD6NKKucjl0oyhoc7DPcQxx0bZV1
         eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRcQM8tGux3x7pZPyJ5Bh3crA9EoJU0QA79n6uNLXsw=;
        b=Go/Mx0QtLUoyIw7o9zcZfqg2SPTS0RCXqM3ve7YLKmTQNGqyOPfFNz9lls5CgFKCnA
         dndjYMQHifZt5NCnnLSpoCvL528kmURcVjDOreoDN2m4xBrsg368QSa8f+XYuLvblJoJ
         le19dpihVj/L1L8kECwuRikI0gyGN3saaL0DoDg9JBr0ZfJ7fzWimvI2XMh3cuWLxWSJ
         QERf8L2eD/wrwBR1usPjSYgmgDFLu0+SwcLqXGkRbJH9aa/NuyTpedAO2nRrlQw+/LzJ
         ZPqmZ6rhwYxqxR9iexrnbnfdpM/np89eOaxJucKzgNHbquiTtBUweGS0ecBwBb5Lwji5
         hQhQ==
X-Gm-Message-State: AOAM5315q/feWepNLG/BlLKR9DCMoX36LygeNfDnhc6kSAPfqMqwnOmF
        z/SsMFzhnIWXn7pfqXhE4+Iqyg==
X-Google-Smtp-Source: ABdhPJyDUIB1ftt6yBR6TdQrSSGxAos9/V5NM3LQJFJN5aA6rDyqHDsHJwyiaP5nTSToc8SIUOfHuA==
X-Received: by 2002:a05:6000:250:: with SMTP id m16mr30912015wrz.325.1615323582914;
        Tue, 09 Mar 2021 12:59:42 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:42 -0800 (PST)
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
Subject: [PATCH v3 10/11] selftests: gpio: add a helper for reading GPIO line names
Date:   Tue,  9 Mar 2021 21:59:20 +0100
Message-Id: <20210309205921.15992-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple program that allows to read GPIO line names from the
character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

