Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9C13F6323
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhHXQt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:10241 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233489AbhHXQtU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550743"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550743"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036853"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:33 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 10/20] tools: gpio: Add GPIO output generation user application
Date:   Tue, 24 Aug 2021 22:17:51 +0530
Message-Id: <20210824164801.28896-11-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

Add GPIO user application - gpio_event_gen - to generate output using
output methods added to GPIO lib. The output produced is 1 Hz clock
aligned to the system clock using singly scheduled edges.

gpio_event_gen accepts similar arguments to gpio-event-mon.

Example output:
	$ gpio-event-gen -n gpiochip0 -o 0 -c 3
	Generating events on line 0 on gpiochip1
	clock realtime : 1612453529996832765
	GPIO EVENT TRIGGER: 1612453531000000000
	clock realtime 2 2 : 1612453531500000000
	GPIO EVENT TRIGGER: 1612453531500000000
	clock realtime 2 2 : 1612453532000000000
	GPIO EVENT TRIGGER: 1612453532000000000
	clock realtime 2 2 : 1612453532500000000

Produces 3 events of 1 Hz output on line 0 of chip/device 0.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 tools/gpio/.gitignore       |   1 +
 tools/gpio/Build            |   1 +
 tools/gpio/Makefile         |  11 ++-
 tools/gpio/gpio-event-gen.c | 191 ++++++++++++++++++++++++++++++++++++
 4 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 tools/gpio/gpio-event-gen.c

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
index a00d604027a2..d5685cd0eb51 100644
--- a/tools/gpio/.gitignore
+++ b/tools/gpio/.gitignore
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 gpio-event-mon
+gpio-event-gen
 gpio-hammer
 gpio-watch
 lsgpio
diff --git a/tools/gpio/Build b/tools/gpio/Build
index 67c7b7f6a717..dc6a178c195a 100644
--- a/tools/gpio/Build
+++ b/tools/gpio/Build
@@ -2,4 +2,5 @@ gpio-utils-y += gpio-utils.o
 lsgpio-y += lsgpio.o gpio-utils.o
 gpio-hammer-y += gpio-hammer.o gpio-utils.o
 gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
+gpio-event-gen-y += gpio-event-gen.o gpio-utils.o
 gpio-watch-y += gpio-watch.o
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 440434027557..c9efaee76f28 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -18,7 +18,7 @@ MAKEFLAGS += -r
 
 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
-ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-watch
+ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-event-gen gpio-watch
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
 all: $(ALL_PROGRAMS)
@@ -66,6 +66,15 @@ $(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
 $(OUTPUT)gpio-event-mon: $(GPIO_EVENT_MON_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
 
+#
+# gpio-event-gen
+#
+GPIO_EVENT_GEN_IN := $(OUTPUT)gpio-event-gen-in.o
+$(GPIO_EVENT_GEN_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
+	$(Q)$(MAKE) $(build)=gpio-event-gen
+$(OUTPUT)gpio-event-gen: $(GPIO_EVENT_GEN_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
 #
 # gpio-watch
 #
diff --git a/tools/gpio/gpio-event-gen.c b/tools/gpio/gpio-event-gen.c
new file mode 100644
index 000000000000..3d5ef47d79d0
--- /dev/null
+++ b/tools/gpio/gpio-event-gen.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * gpio-event-gen - generate GPIO line events from userspace
+ *
+ * Copyright (C) 2020 Intel Corporation
+ * Author: Christopher S Hall <christopher.s.hall@intel.com>
+ *
+ * Adapted from gpio-event-mon.c
+ * Copyright (C) 2016 Linus Walleij
+ *
+ * Usage:
+ *	gpio-event-gen -n <device-name> -o <offset>
+ */
+
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <linux/gpio.h>
+#include <poll.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+#include <time.h>
+#include <unistd.h>
+
+#define NSEC_PER_SEC (1000000000ULL)
+#define TIMESPEC_TO_U64(x) (((uint64_t)(x).tv_sec) * NSEC_PER_SEC + (x).tv_nsec)
+#define U64_TO_TIMESPEC(x)						\
+	((struct timespec){	.tv_sec = (x) / NSEC_PER_SEC,		\
+				.tv_nsec = (x) % NSEC_PER_SEC})
+
+int sleep_until(uint64_t systime)
+{
+	struct timespec wait_until;
+
+	wait_until = U64_TO_TIMESPEC(systime);
+	return clock_nanosleep(CLOCK_REALTIME, TIMER_ABSTIME, &wait_until, NULL);
+}
+
+int generate_events(const char *device_name,
+		    unsigned int line[],
+		    unsigned int num_lines,
+		    uint32_t flags,
+		    unsigned int loops)
+{
+	struct gpio_v2_line_request req;
+	struct gpio_v2_line_config config;
+	uint64_t trigger_time;
+	struct timespec now;
+	char *chrdev_name;
+	int ret, fd;
+	int i = 0;
+
+	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
+	if (ret < 0)
+		return -ENOMEM;
+
+	fd = open(chrdev_name, 0);
+	if (fd == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to open %s\n", chrdev_name);
+		goto exit_close_error;
+	}
+
+	memset(&config, 0, sizeof(config));
+	config.flags = flags;
+
+	memset(&req, 0, sizeof(req));
+
+	for (i = 0; i < num_lines; i++)
+		req.offsets[i] = line[i];
+	req.num_lines = num_lines;
+
+	req.config = config;
+	strcpy(req.consumer, "gpio-event-gen");
+
+	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue GET EVENT IOCTL (%d)\n", ret);
+		goto exit_close_error;
+	}
+
+	if (req.num_lines == 1) {
+		fprintf(stdout, "Generating events on line %u on %s\n",
+			line[0], device_name);
+	} else {
+		fprintf(stdout, "Generating events on %s for line %u",
+			device_name, line[0]);
+		for (i = 1; i < num_lines; i++)
+			fprintf(stdout, " line %u", line[i]);
+	}
+
+	clock_gettime(CLOCK_REALTIME, &now);
+	trigger_time = TIMESPEC_TO_U64(now);
+	trigger_time -= trigger_time % NSEC_PER_SEC;
+	trigger_time += 2 * NSEC_PER_SEC;
+	i = 0;
+	while (1) {
+		struct gpio_output_event out_event;
+
+		out_event.timestamp = trigger_time;
+		printf("GPIO EVENT TRIGGER: %llu\n", trigger_time);
+		ret = write(req.fd, &out_event, sizeof(out_event));
+		if (ret == -1) {
+			ret = -errno;
+			fprintf(stderr, "Failed to write event spec(%s)\n",
+				strerror(-ret));
+			break;
+		}
+
+		if (ret != sizeof(out_event)) {
+			fprintf(stderr, "Writing event spec failed\n");
+			ret = -EIO;
+			break;
+		}
+
+		sleep_until(trigger_time + NSEC_PER_SEC / 10);
+		trigger_time += NSEC_PER_SEC / 2;
+
+		i++;
+		if (i == loops)
+			break;
+	}
+
+exit_close_error:
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+	free(chrdev_name);
+	return ret;
+}
+
+void print_usage(void)
+{
+	fprintf(stderr, "Usage: gpio-event-gen [options]...;"
+		"Listen to events on GPIO lines, 0->1 1->0;"
+		"  -n <name>  Listen on GPIOs on a named device;"
+		"(must be stated);"
+		"  -o <n>     Offset to monitor;"
+		" [-c <n>]    Do <n> loops;"
+		"(optional, infinite loop if not stated);"
+		"  -?         This helptext;"
+		"Example: gpio-event-gen -n gpiochip0 -o 0"
+	);
+}
+
+int main(int argc, char **argv)
+{
+	uint32_t flags = GPIO_V2_LINE_FLAG_OUTPUT;
+	const char *device_name = NULL;
+	unsigned int lines[GPIO_V2_LINES_MAX];
+	unsigned int loops = 0;
+	int num_lines = 0;
+	int c;
+
+	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
+		switch (c) {
+		case 'c':
+			loops = strtoul(optarg, NULL, 10);
+			break;
+		case 'n':
+			device_name = optarg;
+			break;
+		case 'o':
+			if (num_lines >= GPIO_V2_LINES_MAX) {
+				print_usage();
+				return -1;
+			}
+			lines[num_lines] = strtoul(optarg, NULL, 10);
+			num_lines++;
+			break;
+		case '?':
+			print_usage();
+			return -1;
+		}
+	}
+
+	if (!device_name || num_lines == -1) {
+		print_usage();
+		return -1;
+	}
+
+	return generate_events(device_name, lines, num_lines,
+			       flags, loops);
+}
-- 
2.17.1

