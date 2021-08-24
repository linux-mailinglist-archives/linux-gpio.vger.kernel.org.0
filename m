Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A123F631C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhHXQtG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:49:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229896AbhHXQtE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550681"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550681"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036740"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:17 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 05/20] tools: gpio: Add additional polling support to gpio-event-mon
Date:   Tue, 24 Aug 2021 22:17:46 +0530
Message-Id: <20210824164801.28896-6-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

Intel Timed I/O hardware doesn't support reading the current levels,
allow application to continue if this fails.

The Timed I/O hardware aggregates muliple events, but doesn't distinguish
between rising and falling edges *if* both types are selected. Add
output 'verbiage' for unknown event type.

Add verbosity parameter to suppress printing of "nothing available" poll
result. This can be re-enabled at runtime with "-vv" parameter.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 include/uapi/linux/gpio.h   |  1 +
 tools/gpio/gpio-event-mon.c | 42 ++++++++++++++++++++++++++-----------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index eaaea3d8e6b4..ed84805baee8 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -267,6 +267,7 @@ struct gpio_v2_line_info_changed {
 enum gpio_v2_line_event_id {
 	GPIO_V2_LINE_EVENT_RISING_EDGE	= 1,
 	GPIO_V2_LINE_EVENT_FALLING_EDGE	= 2,
+	GPIO_V2_LINE_EVENT_UNKNOWN_EDGE = 3,
 };
 
 /**
diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index a2b233fdb572..d8f0bbf78728 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -29,7 +29,8 @@ int monitor_device(const char *device_name,
 		   unsigned int *lines,
 		   unsigned int num_lines,
 		   struct gpio_v2_line_config *config,
-		   unsigned int loops)
+		   unsigned int loops,
+		   int verbosity)
 {
 	struct gpio_v2_line_values values;
 	char *chrdev_name;
@@ -62,16 +63,23 @@ int monitor_device(const char *device_name,
 		gpiotools_set_bit(&values.mask, i);
 	ret = gpiotools_get_values(lfd, &values);
 	if (ret < 0) {
-		fprintf(stderr,
-			"Failed to issue GPIO LINE GET VALUES IOCTL (%d)\n",
-			ret);
-		goto exit_line_close;
+		if (errno == EIO) {
+			fprintf(stdout,
+				"Failed to get line values. Function unimplemented, continuing\n");
+		} else {
+			ret = -errno;
+			fprintf(stderr,
+				"Failed to issue GPIO LINE GET VALUES IOCTL (%d)\n",
+				ret);
+			goto exit_line_close;
+		}
 	}
 
 	if (num_lines == 1) {
 		fprintf(stdout, "Monitoring line %d on %s\n", lines[0], device_name);
-		fprintf(stdout, "Initial line value: %d\n",
-			gpiotools_test_bit(values.bits, 0));
+		if (ret != -1)
+			fprintf(stdout, "Initial line value: %d\n",
+				gpiotools_test_bit(values.bits, 0));
 	} else {
 		fprintf(stdout, "Monitoring lines %d", lines[0]);
 		for (i = 1; i < num_lines - 1; i++)
@@ -91,8 +99,9 @@ int monitor_device(const char *device_name,
 
 		ret = read(lfd, &event, sizeof(event));
 		if (ret == -1) {
-			if (errno == -EAGAIN) {
-				fprintf(stderr, "nothing available\n");
+			if (errno == EAGAIN) {
+				if (verbosity >= 2)
+					fprintf(stdout, "nothing available\n");
 				continue;
 			} else {
 				ret = -errno;
@@ -117,8 +126,11 @@ int monitor_device(const char *device_name,
 		case GPIO_V2_LINE_EVENT_FALLING_EDGE:
 			fprintf(stdout, "falling edge");
 			break;
+		case GPIO_V2_LINE_EVENT_UNKNOWN_EDGE:
+			fprintf(stdout, "rising/falling edge");
+			break;
 		default:
-			fprintf(stdout, "unknown event");
+			fprintf(stdout, "unknown event spec: %x", event.id);
 		}
 		fprintf(stdout, "\n");
 
@@ -150,6 +162,7 @@ void print_usage(void)
 		"  -f         Listen for falling edges\n"
 		"  -w         Report the wall-clock time for events\n"
 		"  -b <n>     Debounce the line with period n microseconds\n"
+		"  -v	      Verbosity\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
 		"\n"
@@ -169,12 +182,13 @@ int main(int argc, char **argv)
 	unsigned int num_lines = 0;
 	unsigned int loops = 0;
 	struct gpio_v2_line_config config;
+	int verbosity = 0;
 	int c, attr, i;
 	unsigned long debounce_period_us = 0;
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:b:dsrfw?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrfwv?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -208,6 +222,9 @@ int main(int argc, char **argv)
 		case 'w':
 			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 			break;
+		case 'v':
+			++verbosity;
+			break;
 		case '?':
 			print_usage();
 			return -1;
@@ -232,5 +249,6 @@ int main(int argc, char **argv)
 		       "falling edges\n");
 		config.flags |= EDGE_FLAGS;
 	}
-	return monitor_device(device_name, lines, num_lines, &config, loops);
+	return monitor_device(device_name, lines, num_lines, &config, loops,
+			      verbosity);
 }
-- 
2.17.1

