Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266833AF5E9
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 21:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFUTUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 15:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhFUTUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 15:20:51 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADA9C061574
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:36 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a11so20898068wrt.13
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PD0lRumsD/Sx1XyQhiZ0SjEaLW3uzkxRSVi7US54i8g=;
        b=oKyIdunZn39NDspQ4FJNoFRzZC0491RrbdZi8pIS6GVcHyrvD61L/rd4M+f5DDS/MM
         HRQkEK0+xF6JzN2i/4AYY1WtgpJJJG0PZ1jNq5Go68M8o2GIAvdQ9VoikrEq7FFhH8qD
         mL7QyJj32WaXgLZJNyfMqBr5cpyLLlJRRL8yK03b2D8qu/ic1j8Spp0TlinVo4yDZfKp
         1Xa+CciYEHPGLb0nF398UN/75ORSMrDXvMlyp3m3ufUFnhuIIxJpRNcr+1BjDiKnBct8
         Ti7a2NUd8LTX28YJ90XladiorXNiSAes1PDvE36yZor2aq7NOvzwGDmU02C9JbSj/SqL
         rJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PD0lRumsD/Sx1XyQhiZ0SjEaLW3uzkxRSVi7US54i8g=;
        b=dMeO0ZAmb/BmI0mk1hCbkwqt0h79yx0efBws0md28z8IzjjE4G0odqLIehlp3vOno0
         FTg9YUDl0673Z8COOvZgfCVwDqzJ4/N44kEqyZ7ifdQHroQ5/0uNdQeVBAuhDffD818H
         NM76A0sxsisKkNO9hK0iD9iVVi05dECuyix3/Z05ahYEe4IByGwTu80uI4KPBFN0JRk+
         Tr8SS+g/16Is7VNRQ6RtG/jBFvXAugNHq5O9ioIGJ9LUtJruaxuWdowQpsxL3yjN4nvd
         o7PtcUkBr2N1H2f2Yzv7EwxJZTPxUnet5QuVvTtxqjYOnN9QVD/POhqNZR1+dPcm1mtd
         B0BA==
X-Gm-Message-State: AOAM532k6FhHW4Hzb14frbMlrcOmYkcKapF4FenTfZGNADNHnYvskBHh
        eCz2ShG9Qo1/WpWEzB4fVB/BJg==
X-Google-Smtp-Source: ABdhPJxy+OSN8Dlu3O/bjNplYwHcKNMf2ezCsn4BA1Ck263GVnGE5Urge+x6dVDa/AsI7+wAubHyUA==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr30686728wrq.30.1624303115320;
        Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-146-78.w2-15.abo.wanadoo.fr. [2.15.229.78])
        by smtp.gmail.com with ESMTPSA id j34sm19438243wms.19.2021.06.21.12.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 2/4] API: drop "peek" functions
Date:   Mon, 21 Jun 2021 21:18:28 +0200
Message-Id: <20210621191830.10628-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210621191830.10628-1-brgl@bgdev.pl>
References: <20210621191830.10628-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When I took the new API for a ride writing the C++ bindings, it turned
out that Kent was right all along and the split into get and peek
functions isn't really useful, while copy functions operating on copied
objects are what we need. This removes the peek functions in favor of
"get" functions everywhere and simply documents the lifetime of each
object returned by said get functions. It also adds copy functions for
objects where it makes sense - line_info and edge_event as they can
be stored in other objects (info_event and edge_event_buffer
respectively) and the user may want to decouple their lifetime from
the parent.

This is done because in real-life situations, the user of the C API
will most likely only access the edge_event to inspect its properties
while it's still stored in the buffer and only on rare occasions will
there be a need for a deep copy.

For C++ bindings this is useful because we want to make it possible
to copy the edge_event object but also not require new allocations
for every received object for better performance.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h  | 51 +++++++++++++++++-------------------------------
 lib/edge-event.c | 34 ++++++++++++--------------------
 lib/info-event.c |  8 +-------
 lib/internal.h   |  1 -
 lib/line-info.c  | 24 +++++++++++------------
 tools/gpiomon.c  |  4 ++--
 6 files changed, 46 insertions(+), 76 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index f3d20d4..3671c2d 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -38,11 +38,6 @@ extern "C" {
  * users pass valid pointers to objects as arguments. An exception to this rule
  * are the functions that free/close/release resources - which work when passed
  * a NULL-pointer as argument. Other exceptions are documented.
- *
- * <p>When a function returns a pointer to an opaque, libgpiod-specific object,
- * the caller is tasked with its lifetime management except where explicitly
- * documented. Returned const char * pointers must not be freed by the caller
- * as they are managed by the containing objects.
  */
 
 struct gpiod_chip;
@@ -249,6 +244,14 @@ enum {
  */
 void gpiod_line_info_free(struct gpiod_line_info *info);
 
+/**
+ * @brief Copy the line info object.
+ * @param info Line info to copy.
+ * @return Copy of the line info or NULL on error. The returned object must
+ *         be freed by the caller using :gpiod_line_info_free.
+ */
+struct gpiod_line_info *gpiod_line_info_copy(struct gpiod_line_info *info);
+
 /**
  * @brief Get the hardware offset of the line.
  * @param info GPIO line info object.
@@ -397,17 +400,6 @@ uint64_t gpiod_info_event_get_timestamp(struct gpiod_info_event *event);
  *         the caller.
  */
 struct gpiod_line_info *
-gpiod_info_event_peek_line_info(struct gpiod_info_event *event);
-
-/**
- * @brief Get a copy of the line-info object associated with this event.
- * @param event Line info event object.
- * @return Returns a copy of the line-info object associated with this event or
- *         NULL on error. The lifetime of the returned object must be managed
- *         by the caller and the line-info object must be freed using
- *         ::gpiod_line_info_free.
- */
-struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event);
 
 /**
@@ -936,11 +928,17 @@ enum {
 /**
  * @brief Free the edge event object.
  * @param event Edge event object to free.
- * @note Must not be used with events stored in the buffer and retrieved using
- *       ::gpiod_edge_event_buffer_peek_event.
  */
 void gpiod_edge_event_free(struct gpiod_edge_event *event);
 
+/**
+ * @brief Copy the edge event object.
+ * @param event Edge event to copy.
+ * @return Copy of the edge event or NULL on error. The returned object must
+ *         be freed by the caller using :gpiod_edge_event_free.
+ */
+struct gpiod_edge_event *gpiod_edge_event_copy(struct gpiod_edge_event *event);
+
 /**
  * @brief Get the event type.
  * @param event GPIO edge event.
@@ -1000,21 +998,8 @@ void gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer);
  * @param buffer Line event buffer.
  * @param index Index of the event in the buffer.
  * @return Pointer to an event stored in the buffer. The lifetime of this
- *         event is tied to the buffer object. Users must not call event
- *         reference counting functions on pointers retrieved using this
- *         function.
- */
-struct gpiod_edge_event *
-gpiod_edge_event_buffer_peek_event(struct gpiod_edge_event_buffer *buffer,
-				   unsigned long index);
-
-/**
- * @brief Get a copy of an edge event.
- * @param buffer Line event buffer.
- * @param index Index of the event in the buffer.
- * @return Returns a copy of the edge event stored in this buffer. The event's
- *         lifetime is managed by the caller. The event must be released using
- *         ::gpiod_edge_event_free.
+ *         event is tied to the buffer object. Users must not free the event
+ *         returned by this function.
  */
 struct gpiod_edge_event *
 gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
diff --git a/lib/edge-event.c b/lib/edge-event.c
index f8aaa33..4aece4b 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -35,6 +35,18 @@ GPIOD_API void gpiod_edge_event_free(struct gpiod_edge_event *event)
 	free(event);
 }
 
+GPIOD_API struct gpiod_edge_event *
+gpiod_edge_event_copy(struct gpiod_edge_event *event)
+{
+	struct gpiod_edge_event *copy;
+
+	copy = malloc(sizeof(*event));
+	if (!copy)
+		return NULL;
+
+	return copy;
+}
+
 GPIOD_API int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
 {
 	return event->event_type;
@@ -108,36 +120,16 @@ gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer)
 	free(buffer);
 }
 
-GPIOD_API struct gpiod_edge_event *
-gpiod_edge_event_buffer_peek_event(struct gpiod_edge_event_buffer *buffer,
-				   unsigned long index)
-{
-	if (index >= buffer->num_events) {
-		errno = EINVAL;
-		return NULL;
-	}
-
-	return &buffer->events[index];
-}
-
 GPIOD_API struct gpiod_edge_event *
 gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,
 				   unsigned long index)
 {
-	struct gpiod_edge_event *event;
-
 	if (index >= buffer->num_events) {
 		errno = EINVAL;
 		return NULL;
 	}
 
-	event = malloc(sizeof(*event));
-	if (!event)
-		return NULL;
-
-	memcpy(event, &buffer->events[index], sizeof(*event));
-
-	return event;
+	return &buffer->events[index];
 }
 
 GPIOD_API unsigned int
diff --git a/lib/info-event.c b/lib/info-event.c
index 3c55d36..db01db1 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -74,16 +74,10 @@ gpiod_info_event_get_timestamp(struct gpiod_info_event *event)
 	return event->timestamp;
 }
 
-GPIOD_API struct gpiod_line_info *
-gpiod_info_event_peek_line_info(struct gpiod_info_event *event)
-{
-	return event->info;
-}
-
 GPIOD_API struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event)
 {
-	return gpiod_line_info_copy(event->info);
+	return event->info;
 }
 
 struct gpiod_info_event *gpiod_info_event_read_fd(int fd)
diff --git a/lib/internal.h b/lib/internal.h
index 225e2b0..27045fb 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -16,7 +16,6 @@
 
 struct gpiod_line_info *
 gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf);
-struct gpiod_line_info *gpiod_line_info_copy(struct gpiod_line_info *info);
 int gpiod_request_config_to_kernel(struct gpiod_request_config *config,
 				   struct gpio_v2_line_request *reqbuf);
 int gpiod_line_config_to_kernel(struct gpiod_line_config *config,
diff --git a/lib/line-info.c b/lib/line-info.c
index a139f62..aed8bee 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -29,6 +29,18 @@ GPIOD_API void gpiod_line_info_free(struct gpiod_line_info *info)
 	free(info);
 }
 
+GPIOD_API struct gpiod_line_info *
+gpiod_line_info_copy(struct gpiod_line_info *info)
+{
+	struct gpiod_line_info *copy;
+
+	copy = malloc(sizeof(*info));
+	if (!copy)
+		return NULL;
+
+	return copy;
+}
+
 GPIOD_API unsigned int gpiod_line_info_get_offset(struct gpiod_line_info *info)
 {
 	return info->offset;
@@ -153,15 +165,3 @@ gpiod_line_info_from_kernel(struct gpio_v2_line_info *infobuf)
 
 	return info;
 }
-
-struct gpiod_line_info *gpiod_line_info_copy(struct gpiod_line_info *info)
-{
-	struct gpiod_line_info *new_info;
-
-	new_info = malloc(sizeof(*new_info));
-	if (!new_info)
-		return NULL;
-
-	memcpy(new_info, info, sizeof(*new_info));
-	return new_info;
-}
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 8f07596..2b5966c 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -291,8 +291,8 @@ int main(int argc, char **argv)
 			die_perror("error reading line events");
 
 		for (i = 0; i < ret; i++) {
-			event = gpiod_edge_event_buffer_peek_event(event_buffer,
-								   i);
+			event = gpiod_edge_event_buffer_get_event(event_buffer,
+								  i);
 			if (!event)
 				die_perror("unable to retrieve the event from the buffer");
 
-- 
2.30.1

