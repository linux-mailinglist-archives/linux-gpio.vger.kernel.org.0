Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C6D13586C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgAILu1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:50:27 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42410 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729272AbgAILu0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 06:50:26 -0500
Received: by mail-wr1-f67.google.com with SMTP id q6so7043311wro.9
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 03:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f+1d4FRlTWDoZyLvhcrUylaJhZuzCdWZutZr0QUDHa4=;
        b=hvOb/G4h+MUW2efFDhfU93ZBRKZySYeLGQPiGx5PfYqNO/cq7g/8dNfTuxFDcOyM/E
         tTr7RoWNeNEWjFgTxs4No/PzNgbw9+nW1wW1yRLFeNpRVQC6h/h7kRY5rLTDkXp5G8U2
         PrQF7Keqy7RCn0/LsQtMLgKmCNQas8DT/+Dbu8EP6fWTWeaWXR5n1LkUF7CmU4FfnAzV
         ZhKpk7yyAGR8Hby5bEHRSZTFZGFcFHJ/M2izAMG7Kd6lIF9G/LvQXMTQp3vqcuyuSauQ
         SVCSYQiXXqAR31TsS2k2H6QH+1EqC0Py0bLPNxGq5yaRIf0bI6/YWjmu0wwKbB9mfyIu
         I1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+1d4FRlTWDoZyLvhcrUylaJhZuzCdWZutZr0QUDHa4=;
        b=SikPOBlz867GekLreDScERqbsqkLKLlLfn9JoabrBmw8bVRSulVqHnswXq+F0YBWGv
         CpAR3/13Zqzrdbe3uRxPP1SFJQUZWG/065uZlKvTAEJO5QPkWAynNd7Z4ShfKXg/N4e0
         oJ5H8ZZCLGNaK1ttmm3l0hFSXlue7mpOB6wfm6hqkfLGD9dSQ2Tv45x8+8hhELpg32xa
         PdkzP/WLoAtFTI/ZuIH92aQWdWW6rmrWxyP4wx1Fe3FzDRadWDOtTYZMibzebyj42IHF
         ipssLyk9gHN/+qfo6sGuYQs3AAR32/ElqXXTArVU2cDYRcG1iWyEIqp2zdE5DT+U9kra
         YVQg==
X-Gm-Message-State: APjAAAVZvSZMgplU51EcHUtOHueAjPm2N+mva5a6Dzq1F/fjqx1oSMSK
        xdEInU7Xj/RWvICXJLZ2S62WC8EdmQ4=
X-Google-Smtp-Source: APXvYqy6+RrRXs2rydzgpYBlRlaMLhIzVNqwK3r2MwYghbynCBI01joCgzLPKyEEc40H5snquoeJVw==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr9941938wrk.53.1578570623717;
        Thu, 09 Jan 2020 03:50:23 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u16sm2574979wmj.41.2020.01.09.03.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:50:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 7/7] tools: gpio: implement gpio-watch
Date:   Thu,  9 Jan 2020 12:50:10 +0100
Message-Id: <20200109115010.27814-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200109115010.27814-1-brgl@bgdev.pl>
References: <20200109115010.27814-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple program that allows to test the new LINECHANGED_FD ioctl().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

