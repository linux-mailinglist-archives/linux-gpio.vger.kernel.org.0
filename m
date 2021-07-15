Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748A73CAD99
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 22:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344060AbhGOUNJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 16:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343503AbhGOUNA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 16:13:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F32C061766
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:05 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a13so9316363wrf.10
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9O5guoqttI58O/2VLr0rXY16we6o4mZCD6vhjnKygc=;
        b=cNPdta4wZJmJbn7RsM49EcWmHhQQJ751G6eK2ITF6jDqTTmJhgPkVSJAYsqMaQxSNM
         wXslnBikxnvgUgX8VsRMIyMoXGoHYXKAnzpWSB/m6otlB0npE1XOPZRwfsX5pv03lFWX
         iUzeS28eiUbBHgThnIEnNCEJUhuDePjcwIUxLv5fsRiELawdhY8sfdo03KUKuzyUeXF+
         kmW46SA7+0ee9/WwIQwR8Gq825nJOMniYausmIlHayuWHpxokLQaSwzr7aAchTtMb0kL
         whGc5VFuqyd+IJj5NUtw4vx2W9bLZFa6WbnF50dfo98VPbc6Lnr/BYYyxct3Np+nkzsU
         0TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9O5guoqttI58O/2VLr0rXY16we6o4mZCD6vhjnKygc=;
        b=E1UT0MvW6X0d7md5FM85YaPVWm5/b2A1WBa5rbTsJKt5Iqy8MVd5mkmG+SpiSFaZBc
         neA/7gbpRd7DZptUVLRH2IsoTr/1HERaaGOS+GnwIsZuM+nrvF4WUKQW6B4flywrxcsa
         E952SyogrjyD59lUWx+JImb28tUNY9Cpz7/2h/ZXAB5iU0htdXTRs5B5saQ6Vopb1Y/x
         3juBOn50H/k/491mhrKGYiiYRZKdnngaN3M5eNJVpkcmLigNDLvfAGnuSU0o7ANNlBvH
         L4UiV5S/7Nn8BQvbWM5BL6J3qzZ8rE05UnBYOO5VBwF9hJGHu48fY5NoeZtckZWgFLwn
         pckQ==
X-Gm-Message-State: AOAM533Fh6UCeL5R2ED59QgW6S9VeYmn/i8x0Emq8/nmdR2Dyx/vTwLj
        oUkjHDxGegoGHRzcslwhNsmCqg==
X-Google-Smtp-Source: ABdhPJwmw2ea3GHvfL22kCP8jYnPjFZdKkuAAVH0RmdnaPhiZYl6806KAUOWSdfIUP88YmQFXwirOw==
X-Received: by 2002:a5d:457b:: with SMTP id a27mr7552384wrc.280.1626379804078;
        Thu, 15 Jul 2021 13:10:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id m32sm8860986wms.23.2021.07.15.13.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 13:10:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v2 1/3] API: add a function for retrieving the capacity of edge event buffers
Date:   Thu, 15 Jul 2021 22:09:59 +0200
Message-Id: <20210715201001.23726-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210715201001.23726-1-brgl@bgdev.pl>
References: <20210715201001.23726-1-brgl@bgdev.pl>
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

