Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD79A463A5D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 16:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239270AbhK3Ppo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 10:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239413AbhK3Po4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 10:44:56 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC74C061759
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:41:37 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id s13so45423065wrb.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 07:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdC8L7KcajeuYgRxRzq/BDd9/Try3NuMaNKMjlQg9Bs=;
        b=Yf4mQKJblrXfM3raJEqcE4hPfyer0wn3iuXn68BPZ15SAnYis+DGRlWy2iLRGY0lwI
         WWvOtt1DyAIjAFWEt3Qi1kpn3LW7yIaoujYS9czLLYqT5G/MRinWBxcq3hauu90xwcIv
         q7/WHviChlHskgD7+oTEJI5W4ocuITqUk8iFjWLviFVaTOAax2Hy96gy2Z58f7DZqElp
         B7VZp58LY5IBXVz9OZPu9XkyGhV9cKs5chlci6nc/XO7jQhkpS95fA8hrMN09x3lX0jR
         DPu+ymrAn09w/brAZJ3BTpIGypvK2ZjhkthtJI48r4GJ9t98MB2TT1KHPdfY5DJPWZHR
         n2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdC8L7KcajeuYgRxRzq/BDd9/Try3NuMaNKMjlQg9Bs=;
        b=YY8R8Scuc6bAxXAYGOmEDm6RD6H4AgEtudXsc3GYaj60ZHG6+72CMk5wJ28x58jg8n
         AVpoOLkDJxSV6MuQWO6lWjKC3HNMB5s4qMbbefHdVga9TjPX90gvXUnauQqA2A9lyG0R
         ojYtjPf9bQ8MzcL8W3wIVpM9RmajMcd3P8HcOblTLSJaDLT2bDeayNDvIDw9WZL8AlXn
         C6nMM/kbm7JQBrMxnR7StHvhWCFdgd8m17kPXGjjgA9f65OCXBdX7H4xPfYGNdTPKU1k
         ZoJPeemWZxtGVampqpicCKQMHOny1yi6Zabdes1Gth75OShDL8yx1O8jMpYXB5P+5TVw
         InyQ==
X-Gm-Message-State: AOAM531bxu3gKgo64qKHfI1n0aj3YCqTF+bS5OYr5JxshymKJw/H53kV
        6db8MHWseccXXn1OAKGJT1Dpb9twNcVsxOD2
X-Google-Smtp-Source: ABdhPJzm8IvnQQYw9VS4Q99U891uia38OB50QT7S89pka8U/LJBr9flPXUv6TQkHNrkv/PsEpDAQng==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr42149708wrf.197.1638286895675;
        Tue, 30 Nov 2021 07:41:35 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id l2sm2962792wmq.42.2021.11.30.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 07:41:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v11 5/6] selftests: gpio: add a helper for reading GPIO line names
Date:   Tue, 30 Nov 2021 16:41:26 +0100
Message-Id: <20211130154127.12272-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211130154127.12272-1-brgl@bgdev.pl>
References: <20211130154127.12272-1-brgl@bgdev.pl>
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

