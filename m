Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2A94E3F23
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 14:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbiCVNIR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 09:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235396AbiCVNIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 09:08:07 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A32E85BD5
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 06:06:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id q20so10903324wmq.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sx6rXHhLD6aT91c/UQOc0F0E5VUMX/dculyJyV4+QNM=;
        b=PBPJOOWLaAaLM5D4/JtvROp/dtCUyGjXv0y2BH3fNgRhtqnQcUEplHj4N2gMaU3gh5
         9iPRCRQN8ghap5G30E6xrURWBO60xUbdQOgOoswKwfG7aRubX7DepZ5y5gFwA9tTbODS
         Ln4nqwb5L3XbQHEEdnsDJgoBd/k+nhsKBSOsZn9fic8d1g758AspLTffs+xQ+XL2E2bk
         7yZPmRl+w6sNiXmgpbh6lEvDwbubtGOnJ/FtcaJ98kStcGhae3fU8/UH/w9udpHBuTqq
         KJTQD+WGSwCdfXP8C7fUD0qHVW9XOWX2sThPLRjVNkpVaeX447lRLPKrctbgus6FJf13
         qfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sx6rXHhLD6aT91c/UQOc0F0E5VUMX/dculyJyV4+QNM=;
        b=S1lhHNw5Nct1ITON4+oCHb0ED+LGJ9CyOlglcEGAlUHUnUt559geckOIiM4YLyDaI0
         oC4NkX/nbwUEANxMUP5K5DGXOLFQUMogHZ4LIF1fsOCYJsL/CY83AimUJWvkJEPgB3ud
         Fj/Zfw+T8cC44E+d7G+mKaUqO39jOWfaUqJKcEpjCO37n81uuTaoLI2UvhoYmzr4zpbm
         4UV652n8wUBcKz3mG4G5twfuHmxfPfJBWsJu2EdntnPGWuOIp973sQVP7aFesWqEEPT8
         4fiMoMyvvC8FReRnlQsCrHpmWxcFaxay2dXU4BxGo3PY4QZSoN+q70b8210fXVT6wYgY
         VKwg==
X-Gm-Message-State: AOAM5332TbQi7pDxBet1LJ5mxDZBathK40GW6Nne9EvEUPSYdPX4e3uL
        c5FVl7zfeFfkCYSUj6fKrmoYXg==
X-Google-Smtp-Source: ABdhPJzEqBSOp4was9pT6ZTC6joiu6dFvU1peRKKn24QSOuwn8qaLxtfiGKYig8vQNeMpdqvgyi79A==
X-Received: by 2002:a5d:584a:0:b0:203:97f6:5975 with SMTP id i10-20020a5d584a000000b0020397f65975mr22021063wrf.612.1647954397923;
        Tue, 22 Mar 2022 06:06:37 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i206-20020a1c3bd7000000b0038bfc3ab76csm1815069wma.48.2022.03.22.06.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 06:06:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH] API: suffix the time unit to get_timestamp functions
Date:   Tue, 22 Mar 2022 14:06:36 +0100
Message-Id: <20220322130636.318032-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
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

In order to make it clear what unit we're using - add the _ns suffix
to timestamp getters for both the edge and info events.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 include/gpiod.h          | 4 ++--
 lib/edge-event.c         | 2 +-
 lib/info-event.c         | 2 +-
 tests/tests-edge-event.c | 4 ++--
 tests/tests-info-event.c | 6 +++---
 tools/gpiomon.c          | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index eaf6334..c605da8 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -493,7 +493,7 @@ int gpiod_info_event_get_event_type(struct gpiod_info_event *event);
  * @param event Line status watch event.
  * @return Timestamp in nanoseconds, read from the monotonic clock.
  */
-uint64_t gpiod_info_event_get_timestamp(struct gpiod_info_event *event);
+uint64_t gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event);
 
 /**
  * @brief Get the snapshot of line-info associated with the event.
@@ -1401,7 +1401,7 @@ int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event);
  * @note The source clock for the timestamp depends on the event_clock
  *	 setting for the line.
  */
-uint64_t gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event);
+uint64_t gpiod_edge_event_get_timestamp_ns(struct gpiod_edge_event *event);
 
 /**
  * @brief Get the offset of the line which triggered the event.
diff --git a/lib/edge-event.c b/lib/edge-event.c
index 661754e..48a0f95 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -55,7 +55,7 @@ GPIOD_API int gpiod_edge_event_get_event_type(struct gpiod_edge_event *event)
 }
 
 GPIOD_API uint64_t
-gpiod_edge_event_get_timestamp(struct gpiod_edge_event *event)
+gpiod_edge_event_get_timestamp_ns(struct gpiod_edge_event *event)
 {
 	return event->timestamp;
 }
diff --git a/lib/info-event.c b/lib/info-event.c
index 4abed57..73a3d6d 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -67,7 +67,7 @@ GPIOD_API int gpiod_info_event_get_event_type(struct gpiod_info_event *event)
 }
 
 GPIOD_API uint64_t
-gpiod_info_event_get_timestamp(struct gpiod_info_event *event)
+gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event)
 {
 	return event->timestamp;
 }
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 28502a8..306383f 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -145,7 +145,7 @@ GPIOD_TEST_CASE(read_both_events)
 	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
 			==, GPIOD_EDGE_EVENT_RISING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
-	ts_rising = gpiod_edge_event_get_timestamp(event);
+	ts_rising = gpiod_edge_event_get_timestamp_ns(event);
 
 	/* Second event. */
 
@@ -165,7 +165,7 @@ GPIOD_TEST_CASE(read_both_events)
 	g_assert_cmpint(gpiod_edge_event_get_event_type(event),
 			==, GPIOD_EDGE_EVENT_FALLING_EDGE);
 	g_assert_cmpuint(gpiod_edge_event_get_line_offset(event), ==, 2);
-	ts_falling = gpiod_edge_event_get_timestamp(event);
+	ts_falling = gpiod_edge_event_get_timestamp_ns(event);
 
 	g_thread_join(thread);
 
diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
index 0640d66..3f18784 100644
--- a/tests/tests-info-event.c
+++ b/tests/tests-info-event.c
@@ -184,9 +184,9 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 
 	g_thread_join(thread);
 
-	request_ts = gpiod_info_event_get_timestamp(request_event);
-	reconfigure_ts = gpiod_info_event_get_timestamp(reconfigure_event);
-	release_ts = gpiod_info_event_get_timestamp(release_event);
+	request_ts = gpiod_info_event_get_timestamp_ns(request_event);
+	reconfigure_ts = gpiod_info_event_get_timestamp_ns(reconfigure_event);
+	release_ts = gpiod_info_event_get_timestamp_ns(release_event);
 
 	g_assert_cmpuint(request_ts, <, reconfigure_ts);
 	g_assert_cmpuint(reconfigure_ts, <, release_ts);
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 4769e62..f6a0dba 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -299,7 +299,7 @@ int main(int argc, char **argv)
 
 			handle_event(gpiod_edge_event_get_line_offset(event),
 				     gpiod_edge_event_get_event_type(event),
-				     gpiod_edge_event_get_timestamp(event),
+				     gpiod_edge_event_get_timestamp_ns(event),
 				     &ctx);
 
 			events_done++;
-- 
2.30.1

