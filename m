Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192DF3F6330
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbhHXQuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:50:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:10292 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233118AbhHXQtu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:49:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550777"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550777"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036904"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:41 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 13/20] tools: gpio: Add event count capability to event monitor application
Date:   Tue, 24 Aug 2021 22:17:54 +0530
Message-Id: <20210824164801.28896-14-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add -t command line flag requesting event count to the gpio-event-mon
application. If event count is unsupported an invalid argument error is
returned by GPIOlib and the application exits with an error. The event
count is printed with the event type and timestamp.

Co-developed-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 tools/gpio/gpio-event-mon.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index d8f0bbf78728..4bdd6b3d6ad8 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -33,6 +33,9 @@ int monitor_device(const char *device_name,
 		   int verbosity)
 {
 	struct gpio_v2_line_values values;
+	struct gpio_v2_line_event *event;
+	bool req_event_count;
+	size_t event_size;
 	char *chrdev_name;
 	int cfd, lfd;
 	int ret;
@@ -55,6 +58,10 @@ int monitor_device(const char *device_name,
 		goto exit_device_close;
 	else
 		lfd = ret;
+	req_event_count = config->flags & GPIO_V2_LINE_FLAG_EVENT_COUNT;
+	event_size = sizeof(*event);
+	event_size += req_event_count ? sizeof(event->ext[0]) : 0;
+	event = alloca(event_size);
 
 	/* Read initial states */
 	values.mask = 0;
@@ -111,7 +118,7 @@ int monitor_device(const char *device_name,
 			}
 		}
 
-		if (ret != sizeof(event)) {
+		if (ret != event_size) {
 			fprintf(stderr, "Reading event failed\n");
 			ret = -EIO;
 			break;
@@ -133,6 +140,9 @@ int monitor_device(const char *device_name,
 			fprintf(stdout, "unknown event spec: %x", event.id);
 		}
 		fprintf(stdout, "\n");
+		if (req_event_count)
+			fprintf(stdout, "Event count: %u\n",
+				event.ext[0].event_count);
 
 		i++;
 		if (i == loops)
@@ -163,6 +173,7 @@ void print_usage(void)
 		"  -w         Report the wall-clock time for events\n"
 		"  -b <n>     Debounce the line with period n microseconds\n"
 		"  -v	      Verbosity\n"
+		"  -t         Request event count\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
 		"\n"
@@ -188,7 +199,7 @@ int main(int argc, char **argv)
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:b:dsrfwv?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrfwvt?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -225,6 +236,9 @@ int main(int argc, char **argv)
 		case 'v':
 			++verbosity;
 			break;
+		case 't':
+			config.flags |= GPIO_V2_LINE_FLAG_EVENT_COUNT;
+			break;
 		case '?':
 			print_usage();
 			return -1;
-- 
2.17.1

