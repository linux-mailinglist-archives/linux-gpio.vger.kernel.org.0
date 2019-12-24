Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC5E12A111
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 13:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfLXMHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 07:07:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35460 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbfLXMHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Dec 2019 07:07:33 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so2355679wmb.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Dec 2019 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v5x4fAlkEMznzVftaw8KRmxYt8mx3j16Z+4NeG2Skcw=;
        b=ZuokwcNfGp0L6HcsLXIZMbkQ++Kzf+tjuF1v4g7wjonCJDtJNTCUEAGjDoXA7n3ydI
         P1t59cMYQVCHiMTB3TqZZlvksRCQb6eAvA5c50PNZAQZjuUIS0cJRwosxu2HhKLOUF4K
         RKuYusnIfxjZetVCbEqbf8J41cjfDMVm/wE7cwfvDhvVGebS2CRT25oHIOmIJIVTQHgM
         oH4VJ1yOlTo1lrEmBqbKVmzPxiDv3TUzc5tXA4PYOCZNGepyrkm+qPIxR4mImcAkQNYw
         pcfsUED458KHZ8VNniuYVed04UaiJUcSVrqm56BcWn1YZrH1XaaZXvnppln/kgbvsxfv
         oLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v5x4fAlkEMznzVftaw8KRmxYt8mx3j16Z+4NeG2Skcw=;
        b=kfajzVLxNhlCvEi2/DM0jf2qPdi6C+/5I8Ty0wO4XNpbHq8BR4qV0srP7xFBLD2Ta8
         FEoBMsq1t0K3UqHL+Gie/YvhJaETDe+X8L6MdINWHDghzkgHWgdag0eta9QcWbtjVyWj
         kqqPyNNvLziUObhzfHAO7CjpFNKxG/zMzZlZKxkCrLmAXGoPlxlEJ6YIPpJYRe9Ph03f
         TjP2bnnbNrcjvHLtAETM71MFcD6eF5wRmym+qnEzNAcPpETOwN5ZkOswNToTUuborFPG
         v4XSQre/jh0Kjyc+lonSPmL8Puzm8Rg6xpBbDIPbhqN0E/IRBSlcdiGriK21n+tx99z8
         oAXw==
X-Gm-Message-State: APjAAAWkO+oYLZQnapXB1kTBGvurGGaKJJLX3lSmLE7eDCM14ma7wjA4
        a+/wmBoLyNtca3hrtrIoZBQv0w==
X-Google-Smtp-Source: APXvYqx5lvotqnSeg7fcEraugr0DLO1FTV4rgStWO4Mij0tLPYs4QiRpQ+HLQNMmwMJ343Lvi7re/Q==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr3882799wml.103.1577189250559;
        Tue, 24 Dec 2019 04:07:30 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm23829210wrw.12.2019.12.24.04.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 04:07:30 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 13/13] tools: gpio: implement gpio-watch
Date:   Tue, 24 Dec 2019 13:07:09 +0100
Message-Id: <20191224120709.18247-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191224120709.18247-1-brgl@bgdev.pl>
References: <20191224120709.18247-1-brgl@bgdev.pl>
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

