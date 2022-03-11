Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2F54D5C99
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 08:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242699AbiCKHmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 02:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347255AbiCKHmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 02:42:22 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B121B84C1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:41:17 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id q11so7017545pln.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ab6ob9YY3/hhVgr0BnEy3O0n5wjzKO66T/PcTC5vvo0=;
        b=cofyGfMZWQzJyITF0aq2JktoHVOFtTvB9XEdV3S7nc3FROflFqpJo+edjO/izcM+S1
         VVJJ9rYCEL6DeiXxSLjZ5qcrG1ZCdXbfpYdT9kSGbgsbQwP76bdfJlcoAisH//IKYmdp
         F8B9mf7toYX38QdcyEc25wTqk8+K16irHnwj9p57aveqb3YSK058bN6JFFZg4TFUoxrE
         POigcxJlAfjnbFARC+qS4S9S8616WTk3fPClOzDOclT/LG3Ya7wKb3/CoyffbgF1PEju
         gXvckX75oA7VleyJezTi6Ipx988Xu0JlRKnr6P2Ek/tx7Xn/tPSiGff1OFczeXiXGRMY
         xQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ab6ob9YY3/hhVgr0BnEy3O0n5wjzKO66T/PcTC5vvo0=;
        b=AmUS+GNAYn/3espfVdOd/fpRPhcT11nHP2Sw3GRytuLDo2VHAmibG/LnFCvNUbVfQu
         ZfpUG/6tfFGcNsYZWnAPdu4qmuiDHr50r1XBNJnnN/aQxQeeoFqN/Y2LC/BBv2S88Etx
         3niEQF+d1AC/moJY3fVyDhNazV5gnl249Nf8SgcCkQ2mxUqfg+L8BCCSQOEWLjwPPVQF
         AooyL0HJdv/IYnqzR5NpiFQnb4w3MB8xXS2ErJ5NKt9Badti/khvXDrrKSp4/ZOAboOv
         KWIZx/VYi961/jJZfe0SG1tJWkAZ7+9ZOEEOB8F55gDZp8kmfsxzseHtYaUMJEzGV/f6
         CIKQ==
X-Gm-Message-State: AOAM53263lTJI3M6QRU3n/qCUp/XWsp1bwm9ueXsUFe47xtUh2ZeXPff
        T82wz/3iXteiO5ocgL9/SHr1F2HNnIhZCA==
X-Google-Smtp-Source: ABdhPJybVJbdwQxRjBYYeO8zMSJWsxFp2713niG0OgRfcAdLzu80GIX0LR3Ns1t1aapLUIGsUYgkkQ==
X-Received: by 2002:a17:902:d484:b0:153:425:3f6b with SMTP id c4-20020a170902d48400b0015304253f6bmr9148144plg.168.1646984476559;
        Thu, 10 Mar 2022 23:41:16 -0800 (PST)
Received: from sol.home.arpa (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm11973981pjc.56.2022.03.10.23.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 23:41:16 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 5/6] line-request: rename wait and read functions
Date:   Fri, 11 Mar 2022 15:39:25 +0800
Message-Id: <20220311073926.78636-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311073926.78636-1-warthog618@gmail.com>
References: <20220311073926.78636-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Most libgpiod function names follow the gpiod_<object>_<action>_<object>
convention.  gpiod_line_request_edge_event_wait() and
gpiod_line_request_edge_event_read() don't, so rename them
gpiod_line_request_wait_edge_event() and
gpiod_line_request_read_edge_event(), respectively.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h          |  4 ++--
 lib/line-request.c       |  4 ++--
 tests/tests-edge-event.c | 38 +++++++++++++++++++-------------------
 tools/gpiomon.c          |  4 ++--
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 3f4bedd..90535fa 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1258,7 +1258,7 @@ int gpiod_line_request_get_fd(struct gpiod_line_request *request);
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
  *         pending.
  */
-int gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
+int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
 				       uint64_t timeout_ns);
 
 /**
@@ -1270,7 +1270,7 @@ int gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
  *         descriptor, on failure return -1.
  * @note This function will block if no event was queued for this line.
  */
-int gpiod_line_request_edge_event_read(struct gpiod_line_request *request,
+int gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
 				       struct gpiod_edge_event_buffer *buffer,
 				       size_t max_events);
 
diff --git a/lib/line-request.c b/lib/line-request.c
index 2c73dba..33dd6b0 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -201,14 +201,14 @@ GPIOD_API int gpiod_line_request_get_fd(struct gpiod_line_request *request)
 }
 
 GPIOD_API int
-gpiod_line_request_edge_event_wait(struct gpiod_line_request *request,
+gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
 				   uint64_t timeout_ns)
 {
 	return gpiod_poll_fd(request->fd, timeout_ns);
 }
 
 GPIOD_API int
-gpiod_line_request_edge_event_read(struct gpiod_line_request *request,
+gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
 				   struct gpiod_edge_event_buffer *buffer,
 				   size_t max_events)
 {
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 399a4b1..28502a8 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -51,7 +51,7 @@ GPIOD_TEST_CASE(edge_event_wait_timeout)
 
 	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000);
 	g_assert_cmpint(ret, ==, 0);
 }
 
@@ -129,11 +129,11 @@ GPIOD_TEST_CASE(read_both_events)
 
 	/* First event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -149,11 +149,11 @@ GPIOD_TEST_CASE(read_both_events)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -205,11 +205,11 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 
 	/* First event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -224,7 +224,7 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000);
 	g_assert_cmpint(ret, ==, 0); /* Time-out. */
 
 	g_thread_join(thread);
@@ -263,11 +263,11 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 
 	/* First event is the second generated. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -282,7 +282,7 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 
 	/* No more events. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000);
 	g_assert_cmpint(ret, ==, 0); /* Time-out. */
 
 	g_thread_join(thread);
@@ -336,7 +336,7 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -351,7 +351,7 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000);
 	g_assert_cmpint(ret, ==, 0); /* Time-out. */
 
 	g_thread_join(thread);
@@ -405,11 +405,11 @@ GPIOD_TEST_CASE(seqno)
 
 	/* First event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -424,11 +424,11 @@ GPIOD_TEST_CASE(seqno)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -472,11 +472,11 @@ GPIOD_TEST_CASE(event_copy)
 
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
 
-	ret = gpiod_line_request_edge_event_wait(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_line_request_edge_event_read(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_return_if_failed();
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 2ead5c6..4769e62 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -280,13 +280,13 @@ int main(int argc, char **argv)
 		die_perror("unable to allocate the line event buffer");
 
 	for (;;) {
-		ret = gpiod_line_request_edge_event_wait(request, timeout);
+		ret = gpiod_line_request_wait_edge_event(request, timeout);
 		if (ret < 0)
 			die_perror("error waiting for events");
 		if (ret == 0)
 			continue;
 
-		ret = gpiod_line_request_edge_event_read(request, event_buffer,
+		ret = gpiod_line_request_read_edge_event(request, event_buffer,
 							 EVENT_BUF_SIZE);
 		if (ret < 0)
 			die_perror("error reading line events");
-- 
2.35.1

