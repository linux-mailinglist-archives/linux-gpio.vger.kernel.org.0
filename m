Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916FE4D93E4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 06:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbiCOFd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 01:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242505AbiCOFd6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 01:33:58 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F272BF9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:32:46 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 15-20020a17090a098f00b001bef0376d5cso1431923pjo.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 22:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=igfc1SMJHpw1q6l2ONoR0vUiKjn+ncWR0wqDqW2ZfQ0=;
        b=YACsgTVVdHBN5cLJwvGcRHnMJHl2k70bkTE51k42qUaABip/62hJoUVBxL5cz5xFXv
         X9+TTDuUnchhGdmY8VuhqbwJwzExYEtZH6+2KBdDsjXhlpU4EdZ0b9XEzAftbNM2TPtU
         23I0a2wE22hZOSvnly62MC2gOXnnZje9tYodPxtG7jfZwcyh+gC0DYNmtWY3JQgk7ey/
         7JaXJy8h4Y1wqv74lh/7JIM5W7MArzwxMnvyI6SGn1QVhd1oW8P61ST4hXEreIoPh2nJ
         xgw2eqgPVWKV7eyHeh3kl40o25b8FtksbJGLOPRB7Q5DxedikV9eM7F1t4xqyDpsk3ga
         FHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=igfc1SMJHpw1q6l2ONoR0vUiKjn+ncWR0wqDqW2ZfQ0=;
        b=e7QOIIAQN0GemtkR0Y8L+MjHdMlTx8kSbGCZGF5WAIWqP7w5Q0DJvi6ErcBZcutR73
         JOY6loX8Enu9GgAD6Ig8MOdbAz0BofmdrjO94mJaSDawwB2t9b+M3xnZF4Xj4WW5FIRO
         mlsxe/bq/YcqUFy15mF+5AE9JvNKRBRD9K0DtH0diuML1pj3weBURXVmuqo7hHS1o31w
         4c3iJWLBIbJr/kznJuw18mCrGZlQYymd48HLnZFxZ4RA8PjIrQGOrK5tXV0EdOBPbHl1
         MCpK4BqASY1IuEkIGeHkmnVaAVtIyq9BWKNOwx9SghdFYEZdX+9bELh+zL1rzkNAq8M7
         Ti5w==
X-Gm-Message-State: AOAM530scy17C/N29pg1MDptgZHn/kAWffrrPo+aqsp5rOAYVjK2kSm/
        UChRfhioQL4jrKGzB9z8nivr46Q+fwbGww==
X-Google-Smtp-Source: ABdhPJw0+6zBE1bM6bx0yxIoefVR1Z5NGF26FWPKUAmnk2/1bBA6xtcoEn924nEIvzajVs4W+XYTxw==
X-Received: by 2002:a17:903:244c:b0:151:b4ad:9632 with SMTP id l12-20020a170903244c00b00151b4ad9632mr26592518pls.30.1647322365969;
        Mon, 14 Mar 2022 22:32:45 -0700 (PDT)
Received: from sol.home.arpa ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b004f7ba8b445asm8840631pfv.65.2022.03.14.22.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 22:32:45 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod v2][PATCH 1/3] core: rename gpiod_chip_info_event_wait and gpiod_chip_info_event_read
Date:   Tue, 15 Mar 2022 13:32:18 +0800
Message-Id: <20220315053220.102934-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315053220.102934-1-warthog618@gmail.com>
References: <20220315053220.102934-1-warthog618@gmail.com>
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

Another couple of functions that don't follow the
gpiod_<object>_<action>_<object> pattern.
So rename gpiod_chip_info_event_wait to gpiod_chip_wait_info_event
and gpiod_chip_info_event_read to gpiod_chip_read_info_event.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h          |  4 ++--
 lib/chip.c               |  4 ++--
 tests/tests-info-event.c | 22 +++++++++++-----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 2365630..956ee12 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -151,7 +151,7 @@ int gpiod_chip_get_fd(struct gpiod_chip *chip);
  * @return 0 if wait timed out, -1 if an error occurred, 1 if an event is
  *	   pending.
  */
-int gpiod_chip_info_event_wait(struct gpiod_chip *chip, uint64_t timeout_ns);
+int gpiod_chip_wait_info_event(struct gpiod_chip *chip, uint64_t timeout_ns);
 
 /**
  * @brief Read a single line status change event from the chip.
@@ -160,7 +160,7 @@ int gpiod_chip_info_event_wait(struct gpiod_chip *chip, uint64_t timeout_ns);
  *	   freed by the caller using ::gpiod_info_event_free.
  * @note If no events are pending, this function will block.
  */
-struct gpiod_info_event *gpiod_chip_info_event_read(struct gpiod_chip *chip);
+struct gpiod_info_event *gpiod_chip_read_info_event(struct gpiod_chip *chip);
 
 /**
  * @brief Map a line's name to its offset within the chip.
diff --git a/lib/chip.c b/lib/chip.c
index b881be1..50d8312 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -164,14 +164,14 @@ GPIOD_API int gpiod_chip_get_fd(struct gpiod_chip *chip)
 	return chip->fd;
 }
 
-GPIOD_API int gpiod_chip_info_event_wait(struct gpiod_chip *chip,
+GPIOD_API int gpiod_chip_wait_info_event(struct gpiod_chip *chip,
 					 uint64_t timeout_ns)
 {
 	return gpiod_poll_fd(chip->fd, timeout_ns);
 }
 
 GPIOD_API struct gpiod_info_event *
-gpiod_chip_info_event_read(struct gpiod_chip *chip)
+gpiod_chip_read_info_event(struct gpiod_chip *chip)
 {
 	return gpiod_info_event_read_fd(chip->fd);
 }
diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
index 32ae690..0640d66 100644
--- a/tests/tests-info-event.c
+++ b/tests/tests-info-event.c
@@ -50,7 +50,7 @@ GPIOD_TEST_CASE(event_timeout)
 	g_assert_nonnull(info);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_chip_info_event_wait(chip, 100000000);
+	ret = gpiod_chip_wait_info_event(chip, 100000000);
 	g_assert_cmpint(ret, ==, 0);
 }
 
@@ -130,11 +130,11 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 			      request_reconfigure_release_line, &ctx);
 	g_thread_ref(thread);
 
-	ret = gpiod_chip_info_event_wait(chip, 1000000000);
+	ret = gpiod_chip_wait_info_event(chip, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	request_event = gpiod_chip_info_event_read(chip);
+	request_event = gpiod_chip_read_info_event(chip);
 	g_assert_nonnull(request_event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -148,11 +148,11 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 	g_assert_cmpint(gpiod_line_info_get_direction(request_info), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
 
-	ret = gpiod_chip_info_event_wait(chip, 1000000000);
+	ret = gpiod_chip_wait_info_event(chip, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	reconfigure_event = gpiod_chip_info_event_read(chip);
+	reconfigure_event = gpiod_chip_read_info_event(chip);
 	g_assert_nonnull(reconfigure_event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -166,11 +166,11 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 	g_assert_cmpint(gpiod_line_info_get_direction(reconfigure_info), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
 
-	ret = gpiod_chip_info_event_wait(chip, 1000000000);
+	ret = gpiod_chip_wait_info_event(chip, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	release_event = gpiod_chip_info_event_read(chip);
+	release_event = gpiod_chip_read_info_event(chip);
 	g_assert_nonnull(release_event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -243,7 +243,7 @@ GPIOD_TEST_CASE(chip_fd_can_be_polled)
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	event = gpiod_chip_info_event_read(chip);
+	event = gpiod_chip_read_info_event(chip);
 	g_assert_nonnull(event);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -283,11 +283,11 @@ GPIOD_TEST_CASE(unwatch_and_check_that_no_events_are_generated)
 
 	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
 
-	ret = gpiod_chip_info_event_wait(chip, 100000000);
+	ret = gpiod_chip_wait_info_event(chip, 100000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_return_if_failed();
 
-	event = gpiod_chip_info_event_read(chip);
+	event = gpiod_chip_read_info_event(chip);
 	g_assert_nonnull(event);
 	gpiod_test_return_if_failed();
 
@@ -298,6 +298,6 @@ GPIOD_TEST_CASE(unwatch_and_check_that_no_events_are_generated)
 	gpiod_line_request_release(request);
 	request = NULL;
 
-	ret = gpiod_chip_info_event_wait(chip, 100000000);
+	ret = gpiod_chip_wait_info_event(chip, 100000000);
 	g_assert_cmpint(ret, ==, 0);
 }
-- 
2.35.1

