Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B492105899
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 18:31:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKURbV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 12:31:21 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41541 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfKURbV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 12:31:21 -0500
Received: by mail-wr1-f66.google.com with SMTP id b18so5430535wrj.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SrOxBVxr4+WiEoXHzV4Iv6AvYqoIPt+7ktYfe7Nig5M=;
        b=jIwW+ndRk5tc+ft82RvoxwCKGBvpuRYhAYr1MiPyjNsv2DqaG4q4EPGp6wCqbovOwW
         HEjcUL2k7lZ0LIIhFhpGeI8qkVhJtmPeqLOwJJzIaHk/zfOx8qRhtoGeMwDte5b8LWfP
         r4MAvga/R3x/QdKWWFlItW6TP2/opIvzz9sx043gA2d7UyVibcuRJrrwqLFX4E/XuCD/
         8GTvvLs+b2qgVZY6VWX7jXHx2redwZetn9jVw2avp3GidRIYkN2G38jTk/rfoCaVEQiy
         G+lv4EsI9WvEO+rMwfU+j5y8D58fOur186vwbOYpXsNhu+rCyFPqq2pC9CleYV/g9+XX
         5e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SrOxBVxr4+WiEoXHzV4Iv6AvYqoIPt+7ktYfe7Nig5M=;
        b=TwrgZiCOBPy/tqIDjRL8AL36MLgO1pp8iec30Bv4ynMKTaSOoWnMaAifySRw0nuPYW
         DCepzguAYJVs9g8x3zk5QPU4rDwLODsX9LWB2bgOLXoPgSqhfV5Rt/nBK2LcEISJ/cGZ
         nLyaeenEs7u6YvBPDF65+LqTkk9b8a6JM20D0Fd4sVVJXIUBI6JWgJGztp7fe1Br9KX2
         /LokHENn1n9DtxbaNdA793XxvRnk1M9Lywz3RW/Qf6+8hLvB1qXk4dhNd3fi84vpti+K
         eXtiuyDISUMTzAntI+TgkKT7le/yS6yFRfVpt4A+SnbX309kmC5UYgaQLkv05QbabvE4
         ZSRA==
X-Gm-Message-State: APjAAAUyimpASujpn++FD2erlqDfLf1miPgc50lUwbO/6p9SpIUnKEEW
        +7h7v+e35M75BrBFZJO/xsDijDBuL/o=
X-Google-Smtp-Source: APXvYqyPHHcsGpk8w7iWaTTKDCn77izMhY3p9LnPiUddz5inBs1bdoZj+klb5aenYpGwa1/jsAdK0A==
X-Received: by 2002:adf:df0b:: with SMTP id y11mr11989523wrl.282.1574357478439;
        Thu, 21 Nov 2019 09:31:18 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id k1sm4223659wrp.29.2019.11.21.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 09:31:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH] core: deprecate gpiod_needs_update()
Date:   Thu, 21 Nov 2019 18:31:15 +0100
Message-Id: <20191121173115.11016-1-brgl@bgdev.pl>
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

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Suggested-by: Kent Gibson <warthog618@gmail.com>
---

Kent,

please take a look at this patch. I thought about it and didn't find any
good reason to keep this function in the API, so I propose to deprecate it
and propagate any errors from gpiod_line_update() when it's called internally
as you suggested.

 include/gpiod.h    | 31 +++++++++++--------------------
 lib/core.c         | 30 ++++++++++++++----------------
 tests/tests-line.c |  2 --
 3 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 6dfa18a..588198f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -729,33 +729,24 @@ bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
  *         returns -1 and sets the last error number.
  *
  * The line info is initially retrieved from the kernel by
- * gpiod_chip_get_line(). Users can use this line to manually re-read the line
- * info.
+ * gpiod_chip_get_line() and after every successful request. Users can use
+ * this line to manually re-read the line info.
+ *
+ * We currently have no mechanism provided by the kernel for that and for the
+ * sake of speed and simplicity of this low-level library we don't want to
+ * re-read the line info automatically everytime a property is retrieved. Any
+ * daemon using this library must track the state of lines on its own and call
+ * ::gpiod_line_update if needed.
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
+ * @return Deprecated and no longer functional - always returns false.
  */
-bool gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API;
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

