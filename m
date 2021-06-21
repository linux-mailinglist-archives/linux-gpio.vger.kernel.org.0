Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B323AF5E8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 21:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhFUTUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 15:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFUTUu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 15:20:50 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4DFC06175F
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:36 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so709593wml.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vnXDcb/InbvlkMkDsIMqHDLTc2kzXqa6l+0J9MdQ+k=;
        b=F0AfatU0TEJiTz81zFKMK9gBiSkCLixq3+Nqizb9u74dBfZICYNyTZmseOQQFA4hEV
         hJUGrzhi92FSWVted5r5XOO67jm3sx/DFimMGoWbX9c9F2yoRGNjfdc9EkJNoxEmJer2
         2FZqN6deNrmQ/j02RssuElut75qb1C/rqisn3o2+TMKwCpNmpwXK8Og5UWye2XUqRRU6
         tk3rXa1yWz1urnieNiAAKDIShVmRSMRcfbnSuy9rfYgamXZfiS7gqxuHhkfTGofH4WaO
         Fnr47SmL1W1Z765B2sB8C//5SzD4WZK7ZmiqnPo9QknC5qrhtrGm4Bsuxb7jW7mI2Bkn
         MZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vnXDcb/InbvlkMkDsIMqHDLTc2kzXqa6l+0J9MdQ+k=;
        b=Wlh00Zaz+VSkCY/VfgqT/pqop9AuCD+u/6BFZgfWpbTMJdGmdMNkac7aI30miLvpFf
         5bWABuv95YzwkqlqPrZh6UYPQc1FcbyHLGPrJgN5IfeFIsl/tGJG5ej2lPf5fYH3x5wD
         05dcfSr7CYb2b3VRhDlixOdOwHJUKsiNHTueVQTIsv9kzTJP6dTMa+7TrJ80Z6wZIxcv
         yYC0jHTsku472tZUK2lR9w4qVOtJjuq74hJXfKmeZdfyGrQs30vCOrbyUZyhY7nnt91L
         45QjMOASSeLAcqTA/nNQQHjn8gy/LNTa8eb1x17xJOBGbHXxIWyAXYgeCACsEY/vXnpr
         yqYA==
X-Gm-Message-State: AOAM532klYxrs2S3holy58B20Lum7e6jgtV/0DyMWQ3/BZYx8rwcGs6T
        B4AtxvZVhVqBSRW18yThCTufLQ==
X-Google-Smtp-Source: ABdhPJxByHTCRBBExYhdaMfnb8ZG2sid9ilGh/oNzaPdXlA5vIOkyyPNocj+FWXyQYUDXz3QLxLHZw==
X-Received: by 2002:a7b:c089:: with SMTP id r9mr8386372wmh.167.1624303114677;
        Mon, 21 Jun 2021 12:18:34 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-146-78.w2-15.abo.wanadoo.fr. [2.15.229.78])
        by smtp.gmail.com with ESMTPSA id j34sm19438243wms.19.2021.06.21.12.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 12:18:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 1/4] events: hide the *_read_fd() symbols from the API header
Date:   Mon, 21 Jun 2021 21:18:27 +0200
Message-Id: <20210621191830.10628-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210621191830.10628-1-brgl@bgdev.pl>
References: <20210621191830.10628-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

While exposing file descriptors for polling (for use by event loops) is
a common pattern, allowing to read data directly from file descriptors
isn't really a thing in most linux libraries. Sane event loops allow to
associate data with polled file descriptors so users know which object
to use for receiving data when it's available.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h  | 24 ------------------------
 lib/edge-event.c |  5 ++---
 lib/info-event.c |  2 +-
 lib/internal.h   |  3 +++
 4 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 50987a3..f3d20d4 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -410,14 +410,6 @@ gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
 struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event);
 
-/**
- * @brief Read the line info event from a file descriptor.
- * @param fd File descriptor to read from.
- * @return New info event object or NULL on error. The returned object must be
- *         freed using ::gpiod_info_event_free.
- */
-struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
-
 /**
  * @}
  *
@@ -1036,22 +1028,6 @@ gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
 unsigned int
 gpiod_edge_event_buffer_num_events(struct gpiod_edge_event_buffer *buffer);
 
-/**
- * @brief Read GPIO edge events directly from a file descriptor.
- * @param fd File descriptor.
- * @param buffer Line event buffer.
- * @param max_events Maximum number of events to read.
- * @return On success returns the number of events read from the file
- *         descriptor, on failure return -1.
- *
- * Users who directly poll the file descriptor for incoming events can also
- * directly read the event data from it using this routine. This function
- * translates the kernel representation of the event to the libgpiod format.
- */
-int gpiod_edge_event_buffer_read_fd(int fd,
-				    struct gpiod_edge_event_buffer *buffer,
-				    unsigned int max_events);
-
 /**
  * @}
  *
diff --git a/lib/edge-event.c b/lib/edge-event.c
index 4618116..f8aaa33 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -146,9 +146,8 @@ gpiod_edge_event_buffer_num_events(struct gpiod_edge_event_buffer *buffer)
 	return buffer->num_events;
 }
 
-GPIOD_API int
-gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
-				unsigned int max_events)
+int gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
+				    unsigned int max_events)
 {
 	struct gpio_v2_line_event *curr;
 	struct gpiod_edge_event *event;
diff --git a/lib/info-event.c b/lib/info-event.c
index 587a599..3c55d36 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -86,7 +86,7 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event)
 	return gpiod_line_info_copy(event->info);
 }
 
-GPIOD_API struct gpiod_info_event *gpiod_info_event_read_fd(int fd)
+struct gpiod_info_event *gpiod_info_event_read_fd(int fd)
 {
 	struct gpio_v2_line_info_changed evbuf;
 	ssize_t rd;
diff --git a/lib/internal.h b/lib/internal.h
index 20ef2e4..225e2b0 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -25,8 +25,11 @@ int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
 				const unsigned int *offsets);
 struct gpiod_line_request *
 gpiod_line_request_from_kernel(struct gpio_v2_line_request *reqbuf);
+int gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
+				    unsigned int max_events);
 struct gpiod_info_event *
 gpiod_info_event_from_kernel(struct gpio_v2_line_info_changed *evbuf);
+struct gpiod_info_event *gpiod_info_event_read_fd(int fd);
 
 int gpiod_poll_fd(int fd, uint64_t timeout);
 
-- 
2.30.1

