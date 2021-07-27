Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5373D7891
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbhG0OeN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhG0OeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:34:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF08DC061760
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 07:34:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q3so15552373wrx.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9O5guoqttI58O/2VLr0rXY16we6o4mZCD6vhjnKygc=;
        b=gUe5y/lNtXk1UMyxC6rpeve8TOO7oa+y+E2BKUswj4TupN4r20eALSnTuI0s3vReYx
         dTm89odNYzLBPi2gFePmPb+y8OO8ZXZ9Q30ahtq1e1ebA7O3wreK6VEWx1pAGZ04BBzZ
         RqIHHd8eqhD7HOEZCGfyUzS6Z5j0qvGL/BjjhnMx4fO4bV8KeyoUI7ppzrv147+GrhLA
         2rY7OjsbqHCJPNcLtV7qj4JwTYxdEQbSHOEI5eBV4p16BTHGHpuiCpYmqyFO+ByEtEWx
         /lUV5q8uRquVwXGTy0E7lamdaVczWdaZfWzvT11cVitqiwCsNp7f0MeZ6mKiC9c6BHov
         WU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9O5guoqttI58O/2VLr0rXY16we6o4mZCD6vhjnKygc=;
        b=L/Takdg09NcNVOkE9lSovorO0r11/Y7YdZ44V+2eq8m6MtJ70g9O949GWkjeCLnIYd
         PF2YpMKAX55OXGtOO6TGpX300K8YwZ+9NPWqtVEGSE1QfDgvTspMWuHDQ5+P5rdv2qal
         7q6EO/I/9MDvGvyHWyQwVb9TZU07V3+6Ur9B26Pa2WYOgKuHh3JEUZkNi2jMFd6VHyas
         eqL5QCxND/+EB53TBdRTHEYslJjeCniYR93sgA/4wXexCRM/Niqwglvd0MGsSSiUqPGa
         Gs0u3WJ2coz/cR2bBchFlYdDEqqBh3xRsjrwDhNtXo82uNiorQFmfuQS1Qo6Wwno7kO/
         Gsjg==
X-Gm-Message-State: AOAM530iIyE9RgdvC+9w3kWDvf2vpo/2rV62UaxmfLUGJT11zsb7OTao
        kREDnSdl0T7H0REzIyoXSSY4iQ==
X-Google-Smtp-Source: ABdhPJwccb+s2CLXbd4k4lMHbuCDc2GxzoU1AJKLR1qYbD5cfmWkbJHQrbIrvvl1LTNeUIa2/7v5nA==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr25403289wrn.161.1627396442355;
        Tue, 27 Jul 2021 07:34:02 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm3782729wrm.86.2021.07.27.07.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 07:34:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v3 1/3] API: add a function for retrieving the capacity of edge event buffers
Date:   Tue, 27 Jul 2021 16:33:58 +0200
Message-Id: <20210727143400.32543-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210727143400.32543-1-brgl@bgdev.pl>
References: <20210727143400.32543-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a getter for the edge-event buffer capacity property. This is useful
if we want to read the maximum number of events that can be stored in
a buffer object without externally storing its capacity.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h  | 9 +++++++++
 lib/edge-event.c | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/include/gpiod.h b/include/gpiod.h
index 66e6c12..8fc20ed 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -989,6 +989,15 @@ unsigned long gpiod_edge_event_get_line_seqno(struct gpiod_edge_event *event);
 struct gpiod_edge_event_buffer *
 gpiod_edge_event_buffer_new(unsigned int capacity);
 
+/**
+ * @brief Get the capacity (the max number of events that can be stored) of
+ *        the event buffer.
+ * @param buffer Edge event buffer.
+ * @return The capacity of the buffer.
+ */
+unsigned int
+gpiod_edge_event_buffer_get_capacity(struct gpiod_edge_event_buffer *buffer);
+
 /**
  * @brief Free the edge event buffer and release all associated resources.
  * @param buffer Edge event buffer to free.
diff --git a/lib/edge-event.c b/lib/edge-event.c
index 4aece4b..ab484ad 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -109,6 +109,12 @@ gpiod_edge_event_buffer_new(unsigned int capacity)
 	return buf;
 }
 
+GPIOD_API unsigned int
+gpiod_edge_event_buffer_get_capacity(struct gpiod_edge_event_buffer *buffer)
+{
+	return buffer->capacity;
+}
+
 GPIOD_API void
 gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer)
 {
-- 
2.30.1

