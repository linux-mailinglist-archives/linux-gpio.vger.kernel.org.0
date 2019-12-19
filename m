Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDE41267C9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 18:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfLSRPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 12:15:53 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52903 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLSRPw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 12:15:52 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so6238610wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5x4fAlkEMznzVftaw8KRmxYt8mx3j16Z+4NeG2Skcw=;
        b=aSHjLTFSDYBJLT4PzQIvewXR3v8S7vek5JhZlt0HKFpRbOHDEsBarazWmtVn+C3t7w
         j5RSN5OUc1YL6zDqp8Wi8RwZOlUo58QUdgt8hK6zTXE7m1Ryt7eiBDsBcG3miIKRAWwQ
         d1YZp4bjzODvS7DQMBs2dkPBs3lSWB57QjvaffXtU2FgfpsiQ25z5n0VjlVTKjck9pRE
         Aj5n8dmIqfBqjlY/e8dRQAjuFK/YXtEZ6UfRPJnpDal+zbe3CWMAk34RmcXMSJ0s2bnP
         zaMH+Mj8RmEksjNfe4hQzlAcR2ByiNfNwLaQ9V91n3scwK73fuNIskiYLlkqTSGnJlYB
         amSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5x4fAlkEMznzVftaw8KRmxYt8mx3j16Z+4NeG2Skcw=;
        b=Gs0SKS0B8lasmRn0Tp/zTVOENp9L+JLahYtuxRJYsWoH5j10T3XwczgOoU0uSXpcVP
         0QGtfMOQC2PAwXHIv16ALeT3peibP5hHLjOanfFmxU9xz9jt986Gsrc1pfyRsfYz8ptO
         QeW1TRJ7jn8OlBn2+PORuVOFE/ga2ZsLNYVG3TnJ4EGCrkY9mhUryZacyA4frCFPZxXq
         ax0sGTrFShzp/AcHWKof5nZ8exv4NHrtKOSAef26E8I5rOr3mMpKYpxKIm3l6MY+jAH0
         DV0sIU0WRBGph5Wi6F4UAk695O302DGlHXC39rQxoqzFebUz1Wvek8Mveamz6zSVsWBN
         24DQ==
X-Gm-Message-State: APjAAAWEebPMWR8McbRusXJoiRCbvbdoETjBPcM7J4zmE96SqQv1Vdqy
        50T5trplNwhZBOOLDUdQ0sM+SA==
X-Google-Smtp-Source: APXvYqyPvNjyc3CJ00iQM5C3A5G3FIWmtY9FTqHMEOxl2cT3ojLyyCEX6D8ecnQZ1EN3hIxoe/PhIg==
X-Received: by 2002:a1c:5a0a:: with SMTP id o10mr10945123wmb.114.1576775749893;
        Thu, 19 Dec 2019 09:15:49 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id q6sm7401428wrx.72.2019.12.19.09.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 09:15:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 13/13] tools: gpio: implement gpio-watch
Date:   Thu, 19 Dec 2019 18:15:28 +0100
Message-Id: <20191219171528.6348-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219171528.6348-1-brgl@bgdev.pl>
References: <20191219171528.6348-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple program that allows to test the new LINECHANGED_FD ioctl().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 tools/gpio/.gitignore   |  1 +
 tools/gpio/Build        |  1 +
 tools/gpio/Makefile     | 11 ++++-
 tools/gpio/gpio-watch.c | 99 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 tools/gpio/gpio-watch.c

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index a94c0e83b209..eab36c6d7751 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,4 +1,5 @@
 gpio-event-mon
 gpio-hammer
+gpio-watch
 lsgpio
 include/linux/gpio.h
diff --git a/tools/gpio/Build b/tools/gpio/Build
index 4141f35837db..67c7b7f6a717 100644
--- a/tools/gpio/Build
+++ b/tools/gpio/Build
@@ -2,3 +2,4 @@ gpio-utils-y += gpio-utils.o
 lsgpio-y += lsgpio.o gpio-utils.o
 gpio-hammer-y += gpio-hammer.o gpio-utils.o
 gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
+gpio-watch-y += gpio-watch.o
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 6080de58861f..842287e42c83 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -18,7 +18,7 @@ MAKEFLAGS += -r
 
 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
-ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon
+ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-watch
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
 all: $(ALL_PROGRAMS)
@@ -66,6 +66,15 @@ $(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
 $(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
 
+#
+# gpio-watch
+#
+GPIO_WATCH_IN := $(OUTPUT)gpio-watch-in.o
+$(GPIO_WATCH_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=gpio-watch
+$(OUTPUT)gpio-watch: $(GPIO_WATCH_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
 clean:
 	rm -f $(ALL_PROGRAMS)
 	rm -f $(OUTPUT)include/linux/gpio.h
diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
new file mode 100644
index 000000000000..5cea24fddfa7
--- /dev/null
+++ b/tools/gpio/gpio-watch.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * gpio-watch - monitor unrequested lines for property changes using the
+ *              character device
+ *
+ * Copyright (C) 2019 BayLibre SAS
+ * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#include <ctype.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/gpio.h>
+#include <poll.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+int main(int argc, char **argv)
+{
+	struct gpioline_info_changed chg;
+	struct gpioline_info req;
+	struct pollfd pfd;
+	int fd, i, j, ret;
+	char *event, *end;
+	ssize_t rd;
+
+	if (argc < 3)
+		goto err_usage;
+
+	fd = open(argv[1], O_RDWR | O_CLOEXEC);
+	if (fd < 0) {
+		perror("unable to open gpiochip");
+		return EXIT_FAILURE;
+	}
+
+	for (i = 0, j = 2; i < argc - 2; i++, j++) {
+		memset(&req, 0, sizeof(req));
+
+		req.line_offset = strtoul(argv[j], &end, 0);
+		if (*end != '\0')
+			goto err_usage;
+
+		ret = ioctl(fd, GPIO_GET_LINEINFO_WATCH_IOCTL, &req);
+		if (ret) {
+			perror("unable to set up line watch");
+			return EXIT_FAILURE;
+		}
+	}
+
+	pfd.fd = fd;
+	pfd.events = POLLIN | POLLPRI;
+
+	for (;;) {
+		ret = poll(&pfd, 1, 5000);
+		if (ret < 0) {
+			perror("error polling the linechanged fd");
+			return EXIT_FAILURE;
+		} else if (ret > 0) {
+			memset(&chg, 0, sizeof(chg));
+			rd = read(pfd.fd, &chg, sizeof(chg));
+			if (rd < 0 || rd != sizeof(chg)) {
+				if (rd != sizeof(chg))
+					errno = EIO;
+
+				perror("error reading line change event");
+				return EXIT_FAILURE;
+			}
+
+			switch (chg.event_type) {
+			case GPIOLINE_CHANGED_REQUESTED:
+				event = "requested";
+				break;
+			case GPIOLINE_CHANGED_RELEASED:
+				event = "released";
+				break;
+			case GPIOLINE_CHANGED_CONFIG:
+				event = "config changed";
+				break;
+			default:
+				fprintf(stderr,
+					"invalid event type received from the kernel\n");
+				return EXIT_FAILURE;
+			}
+
+			printf("line %u: %s at %llu\n",
+			       chg.info.line_offset, event, chg.timestamp);
+		}
+	}
+
+	return 0;
+
+err_usage:
+	printf("%s: <gpiochip> <line0> <line1> ...\n", argv[0]);
+	return EXIT_FAILURE;
+}
-- 
2.23.0

