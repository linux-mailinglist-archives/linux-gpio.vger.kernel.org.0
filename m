Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492E1257247
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgHaDYj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgHaDY2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:24:28 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44C7C061573;
        Sun, 30 Aug 2020 20:24:26 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n3so1626308pjq.1;
        Sun, 30 Aug 2020 20:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NHFesHMh8urOzDGLF3BG3WK3USIsA8bYlNdGJPsk5Ng=;
        b=fNR51BXs2wMFok4ZVdqa0Nb4sUxcciAu7rCZjasq3W0Sefg6Bh8K7c6FdhDbQwV86C
         mNzafYKQ4t2+UqDAt++gPHY+bJpVkff/E/TEwouJIFYxfXqplXxGeis/DfY/e8vIjSVL
         lg5Y5/0YEtxnmGbZRjljI7fK1EPaHwp9+cYQDYDcfp9+jcdy3lGimxrpBVBGsO3GVqul
         +wv599UgeenMXUUOhcDU8fhLLRubvLTt/R4a4Ku9ITyKPshuOgAg1qFwhVWbH6I/4+6i
         qHrJ6yfqS/ZS9Nc/RqTe4Kkfv+Ok5wfcb8MewXNOvY4H0ZAEnXHOvyOWZf/iWNunBjkY
         rAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NHFesHMh8urOzDGLF3BG3WK3USIsA8bYlNdGJPsk5Ng=;
        b=DHhUh08ywwLX0Cy6nQl0dI97DixvwFBP6ggf8eOs1X7V2UYyQRqkbcmCzScSr2PMZJ
         QlZooOMh19DiYH+JkBkLxp8sr8XAE2t/4Drm7MHy8BuJdwpJpJbZQwZGuQ5GiGtld5Ca
         CwZvuYDSPJbOg5/I4TWrmu0uR+Dggs4x14KbFWjBsSOjMZCJ79SkUPiownv5xS14DFfB
         IuCxkOJhLz8zDB3pCozZZ4/nDYfIn7+VXOSfCHFJA6BxW0URWZherdFQHpd4XBzqiSPI
         lUG1LrVbS4SiXv4wvE58KJYR/lbY+2haO+bleq7yU1DkK0n7bj1D8FWoBRoaOM73iIXe
         yblg==
X-Gm-Message-State: AOAM5328+HBsC1tjGT/jWWSsaMEXjXss/JYuEDjc+NcTRc3cdY9i2E/Q
        zRfQx9ZuldxV5K+Qsj8F/JZM3cnmsDc=
X-Google-Smtp-Source: ABdhPJzWdYQndQGh9KO2hI/XkYuNX/AsR7o4mnzAUd5n9xa/mRf5vWE5KO77kfLMJt2S1jUpT51gsA==
X-Received: by 2002:a17:902:8eca:: with SMTP id x10mr7174067plo.129.1598844262972;
        Sun, 30 Aug 2020 20:24:22 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:24:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 18/20] tools: gpio: port gpio-event-mon to v2 uAPI
Date:   Mon, 31 Aug 2020 11:20:04 +0800
Message-Id: <20200831032006.1019978-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-event-mon tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 91 +++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 44 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 1a303a81aeef..d6a831200c18 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -23,17 +23,16 @@
 #include <sys/ioctl.h>
 #include <sys/types.h>
 #include <linux/gpio.h>
+#include "gpio-utils.h"
 
 int monitor_device(const char *device_name,
 		   unsigned int line,
-		   uint32_t handleflags,
-		   uint32_t eventflags,
+		   struct gpio_v2_line_config *config,
 		   unsigned int loops)
 {
-	struct gpioevent_request req;
-	struct gpiohandle_data data;
+	struct gpio_v2_line_values values;
 	char *chrdev_name;
-	int fd;
+	int cfd, lfd;
 	int ret;
 	int i = 0;
 
@@ -41,44 +40,39 @@ int monitor_device(const char *device_name,
 	if (ret < 0)
 		return -ENOMEM;
 
-	fd = open(chrdev_name, 0);
-	if (fd == -1) {
+	cfd = open(chrdev_name, 0);
+	if (cfd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
 		goto exit_free_name;
 	}
 
-	req.lineoffset = line;
-	req.handleflags = handleflags;
-	req.eventflags = eventflags;
-	strcpy(req.consumer_label, "gpio-event-mon");
-
-	ret = ioctl(fd, GPIO_GET_LINEEVENT_IOCTL, &req);
-	if (ret == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to issue GET EVENT "
-			"IOCTL (%d)\n",
-			ret);
-		goto exit_close_error;
-	}
+	ret = gpiotools_request_line(device_name, &line, 1, config,
+				     "gpio-event-mon");
+	if (ret < 0)
+		goto exit_device_close;
+	else
+		lfd = ret;
 
 	/* Read initial states */
-	ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-	if (ret == -1) {
-		ret = -errno;
-		fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
-			"VALUES IOCTL (%d)\n",
+	values.mask = 1;
+	values.bits = 0;
+	ret = gpiotools_get_values(lfd, &values);
+	if (ret < 0) {
+		fprintf(stderr,
+			"Failed to issue GPIO LINE GET VALUES IOCTL (%d)\n",
 			ret);
-		goto exit_close_error;
+		goto exit_line_close;
 	}
 
 	fprintf(stdout, "Monitoring line %d on %s\n", line, device_name);
-	fprintf(stdout, "Initial line value: %d\n", data.values[0]);
+	fprintf(stdout, "Initial line value: %d\n",
+		gpiotools_test_bit(values.bits, 0));
 
 	while (1) {
-		struct gpioevent_data event;
+		struct gpio_v2_line_event event;
 
-		ret = read(req.fd, &event, sizeof(event));
+		ret = read(lfd, &event, sizeof(event));
 		if (ret == -1) {
 			if (errno == -EAGAIN) {
 				fprintf(stderr, "nothing available\n");
@@ -96,12 +90,14 @@ int monitor_device(const char *device_name,
 			ret = -EIO;
 			break;
 		}
-		fprintf(stdout, "GPIO EVENT %llu: ", event.timestamp);
+		fprintf(stdout, "GPIO EVENT at %llu on line %d (%d|%d) ",
+			event.timestamp, event.offset, event.line_seqno,
+			event.seqno);
 		switch (event.id) {
-		case GPIOEVENT_EVENT_RISING_EDGE:
+		case GPIO_V2_LINE_EVENT_RISING_EDGE:
 			fprintf(stdout, "rising edge");
 			break;
-		case GPIOEVENT_EVENT_FALLING_EDGE:
+		case GPIO_V2_LINE_EVENT_FALLING_EDGE:
 			fprintf(stdout, "falling edge");
 			break;
 		default:
@@ -114,8 +110,11 @@ int monitor_device(const char *device_name,
 			break;
 	}
 
-exit_close_error:
-	if (close(fd) == -1)
+exit_line_close:
+	if (close(lfd) == -1)
+		perror("Failed to close line file");
+exit_device_close:
+	if (close(cfd) == -1)
 		perror("Failed to close GPIO character device file");
 exit_free_name:
 	free(chrdev_name);
@@ -140,15 +139,20 @@ void print_usage(void)
 	);
 }
 
+#define EDGE_FLAGS \
+	(GPIO_V2_LINE_FLAG_EDGE_RISING | \
+	 GPIO_V2_LINE_FLAG_EDGE_FALLING)
+
 int main(int argc, char **argv)
 {
 	const char *device_name = NULL;
 	unsigned int line = -1;
 	unsigned int loops = 0;
-	uint32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
-	uint32_t eventflags = 0;
+	struct gpio_v2_line_config config;
 	int c;
 
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIO_V2_LINE_FLAG_INPUT;
 	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
@@ -161,16 +165,16 @@ int main(int argc, char **argv)
 			line = strtoul(optarg, NULL, 10);
 			break;
 		case 'd':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
+			config.flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 			break;
 		case 's':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
+			config.flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
 			break;
 		case 'r':
-			eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
+			config.flags |= GPIO_V2_LINE_FLAG_EDGE_RISING;
 			break;
 		case 'f':
-			eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
+			config.flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 			break;
 		case '?':
 			print_usage();
@@ -182,11 +186,10 @@ int main(int argc, char **argv)
 		print_usage();
 		return -1;
 	}
-	if (!eventflags) {
+	if (!(config.flags & EDGE_FLAGS)) {
 		printf("No flags specified, listening on both rising and "
 		       "falling edges\n");
-		eventflags = GPIOEVENT_REQUEST_BOTH_EDGES;
+		config.flags |= EDGE_FLAGS;
 	}
-	return monitor_device(device_name, line, handleflags,
-			      eventflags, loops);
+	return monitor_device(device_name, line, &config, loops);
 }
-- 
2.28.0

