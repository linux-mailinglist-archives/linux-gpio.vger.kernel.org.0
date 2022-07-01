Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A093B563212
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236195AbiGALAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237126AbiGALAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:00:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0157280481
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:00:29 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso3498391wma.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGFRjyiI2rjdSwFVjnHgFB+h+dGxDD2Kue7XHNWDgF0=;
        b=Q8voRC517y8DrZq0VaJe3Mzq95Y1ZWWGUq2H1UNOdWofbQpc8Bi97/QufImafF8OLI
         5qiX9JJbx1O4i8kLtHCC8pbCPF3tL1oYU1Iyt3wOnoqWKU/2RwFJ0wYSOrAx8CI6wvl5
         g28NeQD2S8ghutuzcLIfIWRA0wX0t5+M+eGLYDBtd9OXi0g6KsimgZeVgy85JvBWSijF
         U+uAMNckjxW0hWcJu+oFDASncGbCZCRvBlEE1nS8YCcf1qSSvhzXSRdCy4cVBhcIULxA
         5wt7MsGcUc6qM/7JOQ5M+ffNGhvkhhWfsHv0sYU6tTQwsTF93SjmP00W3woQSeq9GchA
         363w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DGFRjyiI2rjdSwFVjnHgFB+h+dGxDD2Kue7XHNWDgF0=;
        b=MSWMlbJXF3R17drJujT03BmiZW+t9rfKgXb5p4fjfmW8enZfcEaifYSpaQ8zfpngyQ
         UOtnw/IFuSfhfY+iyJzghP3rlGCCOeqjwpqIEhKml0LQe7+a1WV+e+NxZsdoWvJDMyGK
         /zZ4AmVHpByr0f6/EWp0pNcxExvmN+26iHle/ACmQtsEN9Imf476eJbMBhKBbDnyI0j5
         AvmlPM/i92ZBRVF4kXm7Red350jbLPjWe6PPVKcrBUhaaLZ6/e9v95koSbKlI5eJ3SC3
         Jq8DtOx7BsK/x9fnIpPKqYajjaZ8+ozcrYIn76mfNca8ul1fTnVYnDBYW2cTdeoS7Au7
         NfHw==
X-Gm-Message-State: AJIora/9UNj9m2/xz50W/ONB3grslctN/To5lQykjJMXswnzRe+HfXHY
        aDhH+sTmcIuc1euBZR7zqCyoDw==
X-Google-Smtp-Source: AGRyM1uvDb89WvQ7zk8MpFrAtOqyk7mSLWjfxR+70iYdOyzwud5xhVmDyNbP+vRtqAi5Ta4oKwRhhA==
X-Received: by 2002:a05:600c:3ca2:b0:3a0:1825:2e6b with SMTP id bg34-20020a05600c3ca200b003a018252e6bmr17414873wmb.132.1656673227534;
        Fri, 01 Jul 2022 04:00:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:694b:5dfa:a897:b176])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d6b8c000000b0020c5253d8fcsm26091165wrx.72.2022.07.01.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:00:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH] treewide: allow polling functions to block indefinitely
Date:   Fri,  1 Jul 2022 13:00:25 +0200
Message-Id: <20220701110025.58399-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All polling system calls have some way of being instructed to block
indefinitely until some event is registered on the file descriptor.

Make both the gpiod_chip_wait_info_event() and
gpiod_line_request_wait_edge_event() accept negative timeout values in
which case the underlying ppoll() will block indefinitely.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h    | 14 ++++++++++----
 lib/chip.c         |  2 +-
 lib/internal.c     | 10 ++++++----
 lib/internal.h     |  2 +-
 lib/line-request.c |  2 +-
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 5595ff2..d8b5f39 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -135,11 +135,14 @@ int gpiod_chip_get_fd(struct gpiod_chip *chip);
  * @brief Wait for line status change events on any of the watched lines
  *	  on the chip.
  * @param chip GPIO chip object.
- * @param timeout_ns Wait time limit in nanoseconds.
+ * @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function
+ *		     returns immediatelly. If set to a negative number, the
+ *		     function blocks indefinitely until an event becomes
+ *		     available.
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
  *	   pending.
  */
-int gpiod_chip_wait_info_event(struct gpiod_chip *chip, uint64_t timeout_ns);
+int gpiod_chip_wait_info_event(struct gpiod_chip *chip, int64_t timeout_ns);
 
 /**
  * @brief Read a single line status change event from the chip.
@@ -1320,7 +1323,10 @@ int gpiod_line_request_get_fd(struct gpiod_line_request *request);
 /**
  * @brief Wait for edge events on any of the requested lines.
  * @param request GPIO line request.
- * @param timeout_ns Wait time limit in nanoseconds.
+ * @param timeout_ns Wait time limit in nanoseconds. If set to 0, the function
+ *		     returns immediatelly. If set to a negative number, the
+ *		     function blocks indefinitely until an event becomes
+ *		     available.
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
  *	   pending.
  *q
@@ -1328,7 +1334,7 @@ int gpiod_line_request_get_fd(struct gpiod_line_request *request);
  * By default edge detection is disabled.
  */
 int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
-				       uint64_t timeout_ns);
+				       int64_t timeout_ns);
 
 /**
  * @brief Read a number of edge events from a line request.
diff --git a/lib/chip.c b/lib/chip.c
index fc3dda2..038d3dd 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -145,7 +145,7 @@ GPIOD_API int gpiod_chip_get_fd(struct gpiod_chip *chip)
 }
 
 GPIOD_API int gpiod_chip_wait_info_event(struct gpiod_chip *chip,
-					 uint64_t timeout_ns)
+					 int64_t timeout_ns)
 {
 	return gpiod_poll_fd(chip->fd, timeout_ns);
 }
diff --git a/lib/internal.c b/lib/internal.c
index b7da67e..d948814 100644
--- a/lib/internal.c
+++ b/lib/internal.c
@@ -7,7 +7,7 @@
 
 #include "internal.h"
 
-int gpiod_poll_fd(int fd, uint64_t timeout_ns)
+int gpiod_poll_fd(int fd, int64_t timeout_ns)
 {
 	struct timespec ts;
 	struct pollfd pfd;
@@ -17,10 +17,12 @@ int gpiod_poll_fd(int fd, uint64_t timeout_ns)
 	pfd.fd = fd;
 	pfd.events = POLLIN | POLLPRI;
 
-	ts.tv_sec = timeout_ns / 1000000000ULL;
-	ts.tv_nsec = timeout_ns % 1000000000ULL;
+	if (timeout_ns >= 0) {
+		ts.tv_sec = timeout_ns / 1000000000ULL;
+		ts.tv_nsec = timeout_ns % 1000000000ULL;
+	}
 
-	ret = ppoll(&pfd, 1, &ts, NULL);
+	ret = ppoll(&pfd, 1, timeout_ns < 0 ? NULL : &ts, NULL);
 	if (ret < 0)
 		return -1;
 	else if (ret == 0)
diff --git a/lib/internal.h b/lib/internal.h
index c87df91..fab12c3 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -36,7 +36,7 @@ struct gpiod_info_event *
 gpiod_info_event_from_uapi(struct gpio_v2_line_info_changed *uapi_evt);
 struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
 
-int gpiod_poll_fd(int fd, uint64_t timeout);
+int gpiod_poll_fd(int fd, int64_t timeout);
 
 void gpiod_line_mask_zero(uint64_t *mask);
 void gpiod_line_mask_fill(uint64_t *mask);
diff --git a/lib/line-request.c b/lib/line-request.c
index 33f7f67..04bd78d 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -200,7 +200,7 @@ GPIOD_API int gpiod_line_request_get_fd(struct gpiod_line_request *request)
 
 GPIOD_API int
 gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
-				   uint64_t timeout_ns)
+				   int64_t timeout_ns)
 {
 	return gpiod_poll_fd(request->fd, timeout_ns);
 }
-- 
2.34.1

