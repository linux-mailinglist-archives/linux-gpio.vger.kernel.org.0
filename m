Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A387D106A7B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 11:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfKVKfS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 05:35:18 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:35487 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbfKVKfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 05:35:18 -0500
Received: by mail-wr1-f49.google.com with SMTP id s5so8014384wrw.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 02:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XcQw2WYKWaq7xHfvNF3b2CqpzkmEYpswzvGPWCteFgA=;
        b=dcuzVmtNfeRNo8ekxgdyJySVEWtDt1QCdHbYLGIGC92wMJ3RElPH9pNAatUKuBrRmW
         If3+/KmKnNM7Y/sUfugHcQPTeYn1sB6kJsOYJ5YmzvIEs7yFrj72pKL1l2s5PlrIJmom
         hnUqxtZOgkNxAU/mZnqkiG1ZNvCo+4BYEhUYNlocgBt96eO93fArbWtySPmvSsNZAZlh
         YTZZSif88dVM3HL9IEhQbg/SCkQ3HIfX0/psXFmJYaCaPwQZMVNpyeV1NmTnwRi6NluR
         Ve0Z4lYZ9mNr14cjbYX4uibWk5W6CdMn6QF7oFL/JMWWRVVOT+YGRHqz312Tblvs0qhp
         TjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XcQw2WYKWaq7xHfvNF3b2CqpzkmEYpswzvGPWCteFgA=;
        b=bo2IX66w4Nj9kKER7P0XEoOfHdjOxWVvsGyD5Pfy8k8CAv6kbaY37n2/ZEXD3QEjTu
         HtuGoFqxkkkQq4nEWr3TvGVuadTWucy2J5CY4gmot28MeAg7Y+lFLOBldnqJQwPmMaRX
         LLV0rcU5x8O7zpCRnyDkhtsjI/RS8Lyj5leXM2Fgqghan85PkYTqYlyJTpZflAK4AS9x
         scXjHyrJmUA1yRJC7Qs736mDVbe5gbWPsyX1KGG+THr0r/663f8ijwOpkDIZVLcyPqT6
         TF3maBgvSwV4wycihGHhTQxvRM7fUxhWCXSNXMKgPDdWpQswzek9AmWYXsm/4J/nSop+
         Hhjw==
X-Gm-Message-State: APjAAAUPW2SBN4Z63GH4+mv4uozAKLcvW3XNGQSdtI+myAK/sFXrW7L+
        zXxIvVyacnOduZMaqmAC/V1+RA==
X-Google-Smtp-Source: APXvYqzb7znBVdGNbBpRYUDrbUJQQdI+v8HFaGA8PA7DLbrFG3i4DjhEu/rkOkjCyhvgQX0ufibTKg==
X-Received: by 2002:adf:f010:: with SMTP id j16mr17317028wro.206.1574418915244;
        Fri, 22 Nov 2019 02:35:15 -0800 (PST)
Received: from localhost.localdomain (lfbn-1-7161-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id b10sm7246071wrw.53.2019.11.22.02.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 02:35:14 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2] core: deprecate gpiod_needs_update()
Date:   Fri, 22 Nov 2019 11:35:12 +0100
Message-Id: <20191122103512.12173-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function and the logic behind have been introduced in an early
version of libgpiod for reasons that have been long forgotten.

When updating the line info after a line request fails, just propagate
the error out of the request function instead of setting the internal
needs_update variable. Drop the entire logic behind gpiod_needs_update(),
make this routine always return false and mark it as deprecated in the
header.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- made the documentation of gpiod_line_update() clearer

 include/gpiod.h    | 39 +++++++++++++++++----------------------
 lib/core.c         | 30 ++++++++++++++----------------
 tests/tests-line.c |  2 --
 3 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 6dfa18a..3fc1c0c 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -725,37 +725,32 @@ bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
 /**
  * @brief Re-read the line info.
  * @param line GPIO line object.
- * @return 0 is the operation succeeds. In case of an error this routine
+ * @return 0 if the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  *
  * The line info is initially retrieved from the kernel by
- * gpiod_chip_get_line(). Users can use this line to manually re-read the line
- * info.
+ * gpiod_chip_get_line() and is later re-read after every successful request.
+ * Users can use this function to manually re-read the line info when needed.
+ *
+ * We currently have no mechanism provided by the kernel for keeping the line
+ * info synchronized and for the sake of speed and simplicity of this low-level
+ * library we don't want to re-read the line info automatically everytime
+ * a property is retrieved. Any daemon using this library must track the state
+ * of lines on its own and call this routine if needed.
+ *
+ * The state of requested lines is kept synchronized (or rather cannot be
+ * changed by external agents while the ownership of the line is taken) so
+ * there's no need to call this function in that case.
  */
 int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
 
 /**
  * @brief Check if the line info needs to be updated.
  * @param line GPIO line object.
- * @return Returns false if the line is up-to-date. True otherwise.
- *
- * The line is updated by calling gpiod_line_update() from within
- * gpiod_chip_get_line() and on every line request/release. However: an error
- * returned from gpiod_line_update() only breaks the execution of the former.
- * The request/release routines only set the internal needs_update flag to true
- * and continue their execution. This routine allows to check if a line info
- * update failed at some point and we should call gpiod_line_update()
- * explicitly.
- *
- * This routine will not indicate any potential changes introduced by external
- * actors (such as a different process requesting the line). We currently have
- * no mechanism provided by the kernel for that and for the sake of speed and
- * simplicity of this low-level library we don't want to re-read the line info
- * automatically everytime a property is retrieved. Any daemon using this
- * library must track the state of lines on its own and call
- * ::gpiod_line_update if needed.
- */
-bool gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API;
+ * @return Deprecated and no longer functional - always returns false.
+ */
+bool
+gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEPRECATED;
 
 /**
  * @}
diff --git a/lib/core.c b/lib/core.c
index d79e52e..a21918c 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -41,7 +41,6 @@ struct gpiod_line {
 	bool open_drain;
 
 	int state;
-	bool needs_update;
 
 	struct gpiod_chip *chip;
 	struct line_fd_handle *fd_handle;
@@ -320,15 +319,6 @@ static int line_get_fd(struct gpiod_line *line)
 	return line->fd_handle->fd;
 }
 
-static void line_maybe_update(struct gpiod_line *line)
-{
-	int rv;
-
-	rv = gpiod_line_update(line);
-	if (rv < 0)
-		line->needs_update = true;
-}
-
 struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
 {
 	return line->chip;
@@ -374,9 +364,9 @@ bool gpiod_line_is_open_source(struct gpiod_line *line)
 	return line->open_source;
 }
 
-bool gpiod_line_needs_update(struct gpiod_line *line)
+bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
 {
-	return line->needs_update;
+	return false;
 }
 
 int gpiod_line_update(struct gpiod_line *line)
@@ -405,8 +395,6 @@ int gpiod_line_update(struct gpiod_line *line)
 	strncpy(line->name, info.name, sizeof(line->name));
 	strncpy(line->consumer, info.consumer, sizeof(line->consumer));
 
-	line->needs_update = false;
-
 	return 0;
 }
 
@@ -537,7 +525,12 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
 		line->state = LINE_REQUESTED_VALUES;
 		line_set_fd(line, line_fd);
-		line_maybe_update(line);
+
+		rv = gpiod_line_update(line);
+		if (rv) {
+			gpiod_line_release_bulk(bulk);
+			return rv;
+		}
 	}
 
 	return 0;
@@ -577,7 +570,12 @@ static int line_request_event_single(struct gpiod_line *line,
 
 	line->state = LINE_REQUESTED_EVENTS;
 	line_set_fd(line, line_fd);
-	line_maybe_update(line);
+
+	rv = gpiod_line_update(line);
+	if (rv) {
+		gpiod_line_release(line);
+		return rv;
+	}
 
 	return 0;
 }
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 8411132..205c622 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -78,7 +78,6 @@ GPIOD_TEST_CASE(consumer, 0, { 8 })
 
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(gpiod_line_needs_update(line));
 	g_assert_cmpstr(gpiod_line_consumer(line), ==, GPIOD_TEST_CONSUMER);
 }
 
@@ -101,7 +100,6 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
 	ret = gpiod_line_request_input(line,
 			"consumer string over 32 characters long");
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_false(gpiod_line_needs_update(line));
 	g_assert_cmpstr(gpiod_line_consumer(line), ==,
 			"consumer string over 32 charact");
 	g_assert_cmpuint(strlen(gpiod_line_consumer(line)), ==, 31);
-- 
2.23.0

