Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4251122D4C0
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGYEWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:44 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE29C0619D3;
        Fri, 24 Jul 2020 21:22:44 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id o1so5618374plk.1;
        Fri, 24 Jul 2020 21:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D5dwObkdfQAjj7DsDs+uymwChxAz22Q1echVt2wc+qY=;
        b=JwI82ij8d6GENw5xjZ79A9Tv9X6ixIkEB1SeTsfD9wOi3xIFjOLaeALFX523MEjkvf
         WFQv0g5SgErmd5qVHhxNvSLTBUUpfoXCRxYOuuFbRtHRoKP378zH1+rMj09tNfaVi0QD
         6v0QO9g2xVv4758XVaS713PGByezNkZBdyEPqLNRgJRANkd0Q0kgT8uwuym40ziBfZEd
         7pMtBABzpOkdJ2zcMdse9pioblixMMg7Y7vMAsLcr6rtm6/+wVuZE6tZSXj+8fhSjrJX
         7ECEKZfWyE9vsw9wtultnt/3+DcPUFgBPvXryXt3XsYq2fbgl8GYnYcK8VOTXINZJt7d
         lhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D5dwObkdfQAjj7DsDs+uymwChxAz22Q1echVt2wc+qY=;
        b=GmyWnqiA9KeeRE/iKLwIRdQKvkMtfZkcQwWfD77DyuJu0glMPb4fbX4dyAJ0+4G31W
         arKyj7EaOkpQ3biKtqbOj1S3jkurWtc0KK+DXvYn3rUc6iQr251FM/Fr/lBaAeRvi7se
         syPHNrxvAWzCbzqhc5GuyqpZYgNkqYWB06wFRpSzmpmxomQ8gyNOu7O1wibpNzeJXA+g
         Vu1ap2y163Xcixu415TKqmUpPlHTWT8rTV+2KUerT5Nda110E6hONQ81biFdqmAmUGma
         EGoV88z8WqDoSVBci4KnzsHZqD+TKzpGcr+5tDZwB27jHZ03CFjIL1T4r6wxU7O7cGNL
         xdnw==
X-Gm-Message-State: AOAM533jLv/dOSlzcwG65WxHyBWrA30n7I5Na+wWjo4Gs4AsVhPklABv
        WG3hCIBWojITy8ff1GATbdVehWba
X-Google-Smtp-Source: ABdhPJxEwKrjOgJu8qGaZiKaicW0NuYF+0h95PAKBmCZGW9lYljO6y0M8F+kB6uOznwRQg+ky9Sllg==
X-Received: by 2002:a17:90a:2b0f:: with SMTP id x15mr8395353pjc.230.1595650963097;
        Fri, 24 Jul 2020 21:22:43 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:42 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 16/18] tools: gpio: port gpio-event-mon to v2 uAPI
Date:   Sat, 25 Jul 2020 12:19:53 +0800
Message-Id: <20200725041955.9985-17-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port the gpio-event-mon tool to the latest GPIO uAPI.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 89 +++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 1a303a81aeef..5da980f78881 100644
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
+		   struct gpioline_config *config,
 		   unsigned int loops)
 {
-	struct gpioevent_request req;
-	struct gpiohandle_data data;
+	struct gpioline_values values;
 	char *chrdev_name;
-	int fd;
+	int cfd, lfd;
 	int ret;
 	int i = 0;
 
@@ -41,44 +40,37 @@ int monitor_device(const char *device_name,
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
+		struct gpioline_event event;
 
-		ret = read(req.fd, &event, sizeof(event));
+		ret = read(lfd, &event, sizeof(event));
 		if (ret == -1) {
 			if (errno == -EAGAIN) {
 				fprintf(stderr, "nothing available\n");
@@ -96,12 +88,14 @@ int monitor_device(const char *device_name,
 			ret = -EIO;
 			break;
 		}
-		fprintf(stdout, "GPIO EVENT %llu: ", event.timestamp);
+		fprintf(stdout, "GPIO EVENT at %llu on line %d (%d|%d) ",
+			event.timestamp, event.offset, event.line_seqno,
+			event.seqno);
 		switch (event.id) {
-		case GPIOEVENT_EVENT_RISING_EDGE:
+		case GPIOLINE_EVENT_RISING_EDGE:
 			fprintf(stdout, "rising edge");
 			break;
-		case GPIOEVENT_EVENT_FALLING_EDGE:
+		case GPIOLINE_EVENT_FALLING_EDGE:
 			fprintf(stdout, "falling edge");
 			break;
 		default:
@@ -114,8 +108,11 @@ int monitor_device(const char *device_name,
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
@@ -140,15 +137,20 @@ void print_usage(void)
 	);
 }
 
+#define EDGE_FLAGS \
+	(GPIOLINE_FLAG_V2_EDGE_RISING | \
+	 GPIOLINE_FLAG_V2_EDGE_FALLING)
+
 int main(int argc, char **argv)
 {
 	const char *device_name = NULL;
 	unsigned int line = -1;
 	unsigned int loops = 0;
-	uint32_t handleflags = GPIOHANDLE_REQUEST_INPUT;
-	uint32_t eventflags = 0;
+	struct gpioline_config config;
 	int c;
 
+	memset(&config, 0, sizeof(config));
+	config.flags = GPIOLINE_FLAG_V2_INPUT;
 	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
@@ -161,16 +163,16 @@ int main(int argc, char **argv)
 			line = strtoul(optarg, NULL, 10);
 			break;
 		case 'd':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_DRAIN;
+			config.flags |= GPIOLINE_FLAG_V2_OPEN_DRAIN;
 			break;
 		case 's':
-			handleflags |= GPIOHANDLE_REQUEST_OPEN_SOURCE;
+			config.flags |= GPIOLINE_FLAG_V2_OPEN_SOURCE;
 			break;
 		case 'r':
-			eventflags |= GPIOEVENT_REQUEST_RISING_EDGE;
+			config.flags |= GPIOLINE_FLAG_V2_EDGE_RISING;
 			break;
 		case 'f':
-			eventflags |= GPIOEVENT_REQUEST_FALLING_EDGE;
+			config.flags |= GPIOLINE_FLAG_V2_EDGE_FALLING;
 			break;
 		case '?':
 			print_usage();
@@ -182,11 +184,10 @@ int main(int argc, char **argv)
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
2.27.0

