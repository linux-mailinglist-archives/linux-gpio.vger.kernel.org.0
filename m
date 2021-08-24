Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B310E3F633A
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbhHXQuX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:10292 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233110AbhHXQuR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:50:17 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550856"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550856"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684037014"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:49:03 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 20/20] tools: gpio: Add PWM monitor application
Date:   Tue, 24 Aug 2021 22:18:01 +0530
Message-Id: <20210824164801.28896-21-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

The Intel(R) Timed I/O driver produces periodic output using the PMW
interface. The output alignment is set initially with respect to the system
clock using the PWM 'alignment' parameter. There will always be a small
frequency difference between the system clock and the hardware ART clock
used to drive the PWM output especially if the system clock is adjusted by
the PTP/NTP time sync daemon.

A GPIO line is used to 'monitor' the PWM output's drift. Small changes are
made to the output frequency, using a PI controller, to compensate for the
drift. The PWM monitor application (gpio-pwm-mon) implements the PI
controller. The application takes four arguments: GPIO device, PWM device,
output alignment in nanoseconds (ns), and period in ns. The first two
arguments are mandatory, the last two are optional defaulting to a one
second period aligned to 0 ns. Example usage is:

       gpio-pwm-mon -g gpiochip0 -p pwmchip0 -a <alignment> -r <period>
-o <num_of_lines>

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 tools/gpio/Build          |   1 +
 tools/gpio/Makefile       |  12 +-
 tools/gpio/gpio-pwm-mon.c | 431 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 443 insertions(+), 1 deletion(-)
 create mode 100644 tools/gpio/gpio-pwm-mon.c

diff --git a/tools/gpio/Build b/tools/gpio/Build
index dc6a178c195a..1d4fc7bb9d7d 100644
--- a/tools/gpio/Build
+++ b/tools/gpio/Build
@@ -3,4 +3,5 @@ lsgpio-y += lsgpio.o gpio-utils.o
 gpio-hammer-y += gpio-hammer.o gpio-utils.o
 gpio-event-mon-y += gpio-event-mon.o gpio-utils.o
 gpio-event-gen-y += gpio-event-gen.o gpio-utils.o
+gpio-pwm-mon-y += gpio-pwm-mon.o gpio-utils.o
 gpio-watch-y += gpio-watch.o
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index c9efaee76f28..63e158ef8f7f 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -18,7 +18,8 @@ MAKEFLAGS += -r
 
 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
 
-ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-event-gen gpio-watch
+ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-event-gen gpio-pwm-mon \
+	gpio-watch
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
 all: $(ALL_PROGRAMS)
@@ -75,6 +76,15 @@ $(GPIO_EVENT_GEN_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
 $(OUTPUT)gpio-event-gen: $(GPIO_EVENT_GEN_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
 
+#
+# gpio-pwm-mon
+#
+GPIO_EVENT_MON_IN := $(OUTPUT)gpio-pwm-mon-in.o
+$(GPIO_EVENT_MON_IN): prepare FORCE $(OUTPUT)gpio-utils-in.o
+	$(Q)$(MAKE) $(build)=gpio-pwm-mon
+$(OUTPUT)gpio-pwm-mon: $(GPIO_EVENT_MON_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) -lpthread -pthread $< -o $@
+
 #
 # gpio-watch
 #
diff --git a/tools/gpio/gpio-pwm-mon.c b/tools/gpio/gpio-pwm-mon.c
new file mode 100644
index 000000000000..71e02aca8b27
--- /dev/null
+++ b/tools/gpio/gpio-pwm-mon.c
@@ -0,0 +1,431 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * gpio-pwm-mon - Use 'virtual' GPIO input line to monitor PWM output and
+ *	adjust period to align the clock with the system clock
+ *
+ * Copyright (C) 2020 Intel Corporation
+ * Author: christopher.s.hall@intel.com
+ *
+ * Usage:
+ *      gpio-pwm-mon -g gpiochip0 -p pwmchip0
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <linux/gpio.h>
+#include <sys/ioctl.h>
+
+#define PWM_PATH "/sys/class/pwm"
+
+#define NSEC_PER_SEC	(1000000000U)
+#define MAX_PERIOD	(4000000000U /*ns*/)
+#define DEFAULT_PERIOD	(125000000U /*ns*/)
+
+#define PWM_ENABLE	(1)
+#define PWM_DISABLE	(0)
+#define GPIO_MONITOR	(1)
+#define PWM_LINE	(0)
+
+#define KPROP_DEFAULT	(1.0)
+#define KINT_DEFAULT	(0.25)
+
+#define EVENT_SIZE	(sizeof(struct gpio_v2_line_event) + sizeof(struct gpio_v2_line_event_ext))
+
+void print_usage(void)
+{
+	fprintf(stdout, "Usage: gpio-pwm-mon [options]...\n"
+		"Listen to events on virtual GPIO lines, adjust PWM\n"
+		"\t -g <name>\t Listen on the GPIO device (required)\n"
+		"\t -p <name>\t Generate output on the PWM device (required)\n"
+		"\t -a <ns>\t Output alignment (ns) to the second\n"
+		"\t -r <ns>\t Output period (ns) (default: %u, maximum: %u)\n"
+		"\t -?\t\t This helptext\n"
+		"\n"
+		"Example:\n"
+		"gpio-pwm-mon -g gpiochip0 -p pwmchip0\n",
+		DEFAULT_PERIOD, MAX_PERIOD
+		);
+}
+
+int write_unsigned_int_to_file(unsigned int val, char *file)
+{
+	char *buf;
+	int fd;
+	int ret = 0;
+
+	fd = open(file, O_WRONLY);
+	if (fd == -1)
+		return -errno;
+
+	ret = asprintf(&buf, "%u", val);
+	if (ret == -1) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = write(fd, buf, strlen(buf));
+	if (ret == -1)
+		ret = -errno;
+	else if (ret != strlen(buf))
+		ret = -EIO;
+	else
+		ret = 0;
+
+	free(buf);
+out:
+	close(fd);
+
+	return ret;
+}
+
+int start_pwm(const char *pwm_name, unsigned int pwm_number,
+	      unsigned int period, unsigned int alignment)
+{
+	char *pwm_path;
+	int ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/export", PWM_PATH, pwm_name);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(pwm_number, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/period", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(MAX_PERIOD, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/duty_cycle", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(period / 2, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/period", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(period, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/alignment", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(alignment, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/enable", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(PWM_ENABLE, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int set_period_pwm(const char *pwm_name, unsigned int pwm_number,
+		   unsigned int period)
+{
+	char *pwm_path;
+	int ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/period", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(period, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int stop_pwm(const char *pwm_name, unsigned int pwm_number)
+{
+	char *pwm_path;
+	int ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/pwm%u/enable", PWM_PATH, pwm_name,
+		       pwm_number);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(PWM_DISABLE, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	ret = asprintf(&pwm_path, "%s/%s/unexport", PWM_PATH, pwm_name);
+	if (ret == -1)
+		return -errno;
+	ret = write_unsigned_int_to_file(pwm_number, pwm_path);
+	free(pwm_path);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int adjust_pwm_loop(const char *gpio_name, const char *pwm_name,
+		    const char *consumer, unsigned int period,
+		    unsigned int align, double kprop, double kint,
+		    volatile bool *exit, int *lines, int num_lines)
+{
+	unsigned int adjusted_period = period;
+	struct gpio_v2_line_config config;
+	struct gpio_v2_line_event event[EVENT_SIZE];
+	struct gpio_v2_line_request req;
+	uint64_t last_event_timestamp;
+	uint64_t total_event_count;
+	uint64_t last_event_count;
+	uint64_t start_time = 0;
+	char *chrdev_name;
+	size_t event_size;
+	int  i = 0;
+	int ret;
+	int fd;
+
+	ret = asprintf(&chrdev_name, "/dev/%s", gpio_name);
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
+	config.flags = GPIO_V2_LINE_FLAG_INPUT | GPIO_V2_LINE_FLAG_EDGE_FALLING |
+		       GPIO_V2_LINE_FLAG_EDGE_RISING | GPIO_V2_LINE_FLAG_EVENT_COUNT;
+	memset(&req, 0, sizeof(req));
+	for (i = 0; i < num_lines; i++)
+		req.offsets[i] = lines[i];
+	req.num_lines = num_lines;
+	req.config = config;
+	req.config.flags = config.flags;
+	strcpy(req.consumer, consumer);
+
+	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
+	if (ret == -1) {
+		ret = -errno;
+		fprintf(stderr, "Failed to issue GET EVENT IOCTL (%d)\n", ret);
+		goto exit_close_error;
+	}
+
+	while (!*exit) {
+		ret = read(req.fd, event, event_size);
+		if (ret == -1) {
+			if (errno == EAGAIN) {
+				continue;
+			} else {
+				ret = -errno;
+				fprintf(stderr, "Failed to read event (%d)\n",
+					ret);
+				break;
+			}
+		}
+
+		if (ret != event_size) {
+			ret = -EIO;
+			fprintf(stderr, "Reading event failed (%d)\n", ret);
+			break;
+		}
+
+		if (start_time == 0) {
+			uint32_t res;
+			bool round_up;
+
+			start_time = event[0].timestamp_ns;
+			if (event[0].ext[0].event_count > 1) {
+				ret = -EINTR;
+				fprintf(stderr, "Lost start event\n");
+				break;
+			}			start_time -= align;
+			res = start_time % NSEC_PER_SEC;
+			round_up = res > NSEC_PER_SEC / 2;
+			start_time -= res;
+			start_time += round_up ? NSEC_PER_SEC : 0;
+			start_time += align;
+			total_event_count = event[0].ext[0].event_count - 1;
+			last_event_timestamp = start_time;
+			last_event_count = total_event_count;
+		} else {
+			uint64_t duration;
+			int int_error;
+			double prop_error;
+			double adjust;
+
+			total_event_count += event[0].ext[0].event_count;
+			if (total_event_count % 2 == 1)
+				continue;
+			duration = event[0].timestamp_ns - start_time;
+			int_error = duration > total_event_count / 2 * period ?
+				-(duration - total_event_count / 2 * period) :
+				total_event_count / 2 * period - duration;
+			prop_error = event[0].timestamp_ns - last_event_timestamp;
+			prop_error *= -1;
+			prop_error /= (total_event_count - last_event_count) / 2;
+			prop_error += period;
+			adjust = prop_error * kprop + int_error * kint;
+			adjusted_period += adjust;
+			set_period_pwm(pwm_name, PWM_LINE, adjusted_period);
+			last_event_count = total_event_count;
+			last_event_timestamp = event[0].timestamp_ns;
+		}
+		printf("Event %04llu timestamp: %llu\n", last_event_count,
+		       last_event_timestamp);
+	}
+
+exit_close_error:
+	if (close(fd) == -1)
+		perror("Failed to close GPIO character device file");
+	free(chrdev_name);
+	return ret;
+}
+
+struct wait_arg {
+	volatile bool *exit;
+	sigset_t *sigint;
+};
+
+void *wait_for_interrupt(void *arg)
+{
+	volatile bool *exit = ((struct wait_arg *)arg)->exit;
+	sigset_t *sigint = ((struct wait_arg *)arg)->sigint;
+	siginfo_t info;
+	int ret;
+
+	do {
+		ret = sigwaitinfo(sigint, &info);
+	} while (ret == -1 && errno == EINTR);
+
+	if (ret != -1) {
+		printf("Received %s\n", strsignal(info.si_signo));
+		*exit = true;
+	}
+
+	return NULL;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned int period = DEFAULT_PERIOD;
+	const char *gpio_name = NULL;
+	double kprop = KPROP_DEFAULT;
+	const char *pwm_name = NULL;
+	double kint = KINT_DEFAULT;
+	unsigned int alignment = 0;
+	volatile bool exit = false;
+	struct wait_arg wait_arg;
+	pthread_t int_thread;
+	sigset_t sigint;
+	int num_lines = 0;
+	int lines[10];
+	int err;
+	int c;
+
+	while ((c = getopt(argc, argv, "g:p:r:a:t:n:o:?")) != -1) {
+		switch (c) {
+		case 'g':
+			gpio_name = optarg;
+			break;
+		case 'p':
+			pwm_name = optarg;
+			break;
+		case 'r':
+			period = strtoul(optarg, NULL, 10);
+			break;
+		case 'a':
+			alignment = strtoul(optarg, NULL, 10);
+			break;
+		case 't':
+			kprop = strtod(optarg, NULL);
+			break;
+		case 'n':
+			kint = strtod(optarg, NULL);
+			break;
+		case 'o':
+			if (num_lines >= GPIO_V2_LINES_MAX) {
+				print_usage();
+				return -1;
+			}
+			lines[num_lines] = strtoul(optarg, NULL, 10);
+			num_lines++;
+			break;
+
+		case '?':
+			print_usage();
+			return 0;
+		}
+	}
+
+	if (!pwm_name || !gpio_name || period > MAX_PERIOD) {
+		print_usage();
+		return -1;
+	}
+
+	err = start_pwm(pwm_name, PWM_LINE, period, alignment);
+	if (err) {
+		printf("Failed to start PWM: %s (%s)\n", pwm_name, strerror(-err));
+		return -1;
+	}
+
+	sigemptyset(&sigint);
+	sigaddset(&sigint, SIGINT);
+	err = pthread_sigmask(SIG_BLOCK, &sigint, NULL);
+	if (err) {
+		printf("Failed to block interrupt signals: %s\n", strerror(err));
+		goto cleanup_pwm;
+	}
+	wait_arg.sigint = &sigint;
+	wait_arg.exit = &exit;
+	err = pthread_create(&int_thread, NULL, wait_for_interrupt, &wait_arg);
+	if (err) {
+		printf("Failed to listen on user interrupt: %s\n", strerror(err));
+		goto cleanup_pwm;
+	}
+
+	err = adjust_pwm_loop(gpio_name, pwm_name, argv[0], period, alignment,
+			      kprop, kint, &exit, lines, num_lines);
+	if (err) {
+		printf("Failed to monitor PWM: %s\n", strerror(-err));
+		pthread_kill(int_thread, SIGINT);
+	}
+
+	pthread_join(int_thread, NULL);
+
+cleanup_pwm:
+	err = stop_pwm(pwm_name, PWM_LINE);
+	if (err)
+		printf("Failed to stop PWM: %s (%s)\n", pwm_name, strerror(-err));
+
+	return err ? -1 : 0;
+}
-- 
2.17.1

