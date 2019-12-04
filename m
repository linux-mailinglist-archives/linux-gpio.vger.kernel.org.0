Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBE2112F50
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfLDP7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:49 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39859 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbfLDP7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:49 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so9228274wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3vOhxME4oM+fCXvGw9SeZO8ZtZ/Y7PIxuNLc7TEy6Us=;
        b=BBMUbwY67rlDFQzYeKhhMrURjvq+SV00mi/aBQLu2XUm4f46pIt+flDS2ZdL34ILWA
         DzDRxfz3Yse3rm5oSdZzFW6HbJOmk/562LaDsoSkah9MDpnNm6FirJxpYFPL19eTT5XO
         cYgZWpYU/4cQcK2Vyv9QkBmwzwB3XE6JXTh9hU5vQ2WV1i6ExBsOUVUUh5Z9j+uOHmh4
         f+Kvl8kbcALtFF3IEXsIDRhybsXftUPA+95fNvPhs/VZsBUY9y8HXjmpAUiWUbWxVJT8
         7cMQILfswsNcQuk1QkzOzoHcVacLpetKWDxSOH2geHB+fbAOo159sxgUmbSf1Qjljkq6
         kcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vOhxME4oM+fCXvGw9SeZO8ZtZ/Y7PIxuNLc7TEy6Us=;
        b=LR/u0RO9yyelPpiMYjkFlscdimI32BxBKAeGe/Z/nUBtvY+pjgwPeETArH1FYmPACu
         8fEKreeO0gfjYHGZpB1TNyB4q07c2qEE2dFUMogXp5X/0ehWKPlbSBHZ8m6Nq7oBihEy
         Xu5snCMBz7P6DsYKWzyh9y+p9iPMcCb23eCE1DgqzMwVYOz7lebks1qMKMpoUE7itz7P
         K6PyOqeRvQGcA2NgQrXYdrzRtj388/RukcFyhnefkuzjE7CqRH7eV4iVJQe6yREiR2Sg
         FqRoZ0BmpFTa76KqTQU0MpajjgTW2KnXt8nEP+HalbO8/He6h2KxfFwpfog7eOYr+luB
         hnzA==
X-Gm-Message-State: APjAAAX64He95+X4bJe5Ymlf4Kmdn71ELMAMEygk9Uv4Jd+C2ACqMyz/
        ET0qD4e/vrMjvoDBq9tgDx5GsJds51U=
X-Google-Smtp-Source: APXvYqxDIY/iXDiy3QJ88E3DR3VBqpPxQnwpJM1KGnR56oJlEtM54rx1fvuTnHc5kW24DTAt+3ceSQ==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr4555036wrm.24.1575475186930;
        Wed, 04 Dec 2019 07:59:46 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id s10sm8769070wrw.12.2019.12.04.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 11/11] tools: gpio: implement gpio-watch
Date:   Wed,  4 Dec 2019 16:59:41 +0100
Message-Id: <20191204155941.17814-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155941.17814-1-brgl@bgdev.pl>
References: <20191204155941.17814-1-brgl@bgdev.pl>
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
 tools/gpio/.gitignore   |   1 +
 tools/gpio/Build        |   1 +
 tools/gpio/Makefile     |  11 +++-
 tools/gpio/gpio-watch.c | 112 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 tools/gpio/gpio-watch.c

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index a94c0e83b209..fffd32969d62 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,4 +1,5 @@
 gpio-event-mon
 gpio-hammer
 lsgpio
+gpio-watch
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
index 000000000000..69aee43655ae
--- /dev/null
+++ b/tools/gpio/gpio-watch.c
@@ -0,0 +1,112 @@
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
+static bool isnumber(const char *str)
+{
+	size_t sz = strlen(str);
+	int i;
+
+	for (i = 0; i < sz; i++) {
+		if (!isdigit(str[i]))
+			return false;
+	}
+
+	return true;
+}
+
+int main(int argc, char **argv)
+{
+	struct gpioline_info_changed chg;
+	struct gpioline_info req;
+	struct pollfd pfd;
+	int fd, i, j, ret;
+	char *event;
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
+		if (!isnumber(argv[j]))
+			goto err_usage;
+
+		memset(&req, 0, sizeof(req));
+		req.line_offset = atoi(argv[j]);
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

