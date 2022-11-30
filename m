Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7474063D5CB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbiK3Mmw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235013AbiK3Mmm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:42 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4811C1A203
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:40 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id bx10so14815076wrb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJMIlBROsaNe4gxNcCnDB6MLPqghliTCjuy3UxJV31w=;
        b=oy/j/l1S/FH/3Glhz9G7UbyWuCKl1tFhXwVHVSX2jmV2qnlnv0NDoiEzmRMRe6hceX
         RXt7fM4kWPb79mqKYfsryB5ec25dkA27NoKLjb5TWgZeVgsKBE0MNa2VBAS18Mu59dcx
         9hYIpKxTnJWqTMeGuvFC2cIgMjUvwYBsQSkN1/twHWQo8r2owVLFqC2MNzAly/o4kdca
         flo5OFTj2QAwaxK59++kjktDrXyhIvy8QFkTPPMyYJYyQ4uNwBi8k3TquY4subVcuS6Y
         kAlNBqrbI7NRKx7HCigAczdgMEVdwutD7442NKHh3MYbBRsx3aaFq1RFykxc35ONzXRc
         +PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJMIlBROsaNe4gxNcCnDB6MLPqghliTCjuy3UxJV31w=;
        b=6YNlION13GTPqhuKAaHKyKYTsrRk1eab805DeEwhmZ3UQr93+gqp8s4AAiPxm/syjy
         pNOQVVC9a1gxcLQ69NMrvThvGu7BQXGedi+Jo6d3W2N4ug+Hkli6wFlFJaGgp1KGjVN+
         4Jn5+WDRsBIn1A6PK2TxV65zXbX7Fd/U7qeu64UcLuOHwoGO8xYFNJLx2hCtUv+YLWu0
         Fi5h+dqmJIEl4tG/WGHdeWrNJ49JK5y7MKk6hs4w+AeAYb2OWku3krS8/5GruIqJTubV
         1dGqVeFJxtJkmY18LtmXJVl5rL/uAJTBDR3sPEc/zjqQ1RH8tmfnGL1POdWO7Ab+28LO
         tvmA==
X-Gm-Message-State: ANoB5plfh6twsjd5KwA3dP6OU5qiSR4EJCFQfNc6OBrUDENwYnJbxiTA
        /dtQNN3DgFrNpPJL+ky0hRPCcQ==
X-Google-Smtp-Source: AA0mqf6K1XTtQS4Q5FkLA5TL1O5IXtYDZ0XemLIsflsAs3V2ibkgnCVLiv6Lw9xDgRVFwqH0/keFNg==
X-Received: by 2002:adf:eecf:0:b0:241:d333:c95d with SMTP id a15-20020adfeecf000000b00241d333c95dmr30224552wrp.301.1669812158622;
        Wed, 30 Nov 2022 04:42:38 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 04/11] treewide: rename EVENT_CLOCK to CLOCK
Date:   Wed, 30 Nov 2022 13:42:24 +0100
Message-Id: <20221130124231.1054001-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While we use it for edge event timestamps exclusively at the moment,
the actual enum names shouldn't limit its application and simply just
refer to existing clock types known by the GPIO uAPI. The relevant
functions are still called set/get_event_clock() as it's in line with
their functionality.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/line-info.cpp                |  6 +++---
 bindings/cxx/line-settings.cpp            | 14 ++++++-------
 bindings/python/gpiod/ext/line-settings.c |  2 +-
 bindings/python/gpiod/ext/module.c        |  6 +++---
 bindings/rust/libgpiod/src/lib.rs         | 22 ++++++++++-----------
 include/gpiod.h                           | 20 +++++++++----------
 lib/line-config.c                         |  4 ++--
 lib/line-info.c                           | 10 +++++-----
 lib/line-settings.c                       | 16 +++++++--------
 tests/tests-line-config.c                 |  2 +-
 tests/tests-line-info.c                   | 12 ++++++------
 tests/tests-line-settings.c               | 24 +++++++++++------------
 tools/gpiomon.c                           | 14 ++++++-------
 tools/tools-common.c                      |  4 ++--
 14 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 944e34d..5eb2a3f 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -37,9 +37,9 @@ const ::std::map<int, line::edge> edge_mapping = {
 };
 
 const ::std::map<int, line::clock> clock_mapping = {
-	{ GPIOD_LINE_EVENT_CLOCK_MONOTONIC,	line::clock::MONOTONIC },
-	{ GPIOD_LINE_EVENT_CLOCK_REALTIME,	line::clock::REALTIME },
-	{ GPIOD_LINE_EVENT_CLOCK_HTE,		line::clock::HTE }
+	{ GPIOD_LINE_CLOCK_MONOTONIC,		line::clock::MONOTONIC },
+	{ GPIOD_LINE_CLOCK_REALTIME,		line::clock::REALTIME },
+	{ GPIOD_LINE_CLOCK_HTE,			line::clock::HTE }
 };
 
 } /* namespace */
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
index 17c5ca2..58860db 100644
--- a/bindings/cxx/line-settings.cpp
+++ b/bindings/cxx/line-settings.cpp
@@ -57,13 +57,13 @@ const ::std::map<line::drive, gpiod_line_drive> drive_mapping = {
 
 const ::std::map<gpiod_line_drive, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
 
-const ::std::map<line::clock, gpiod_line_event_clock> clock_mapping = {
-	{ line::clock::MONOTONIC,	GPIOD_LINE_EVENT_CLOCK_MONOTONIC },
-	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME },
-	{ line::clock::HTE,		GPIOD_LINE_EVENT_CLOCK_HTE }
+const ::std::map<line::clock, gpiod_line_clock> clock_mapping = {
+	{ line::clock::MONOTONIC,	GPIOD_LINE_CLOCK_MONOTONIC },
+	{ line::clock::REALTIME,	GPIOD_LINE_CLOCK_REALTIME },
+	{ line::clock::HTE,		GPIOD_LINE_CLOCK_HTE }
 };
 
-const ::std::map<gpiod_line_event_clock, line::clock>
+const ::std::map<gpiod_line_clock, line::clock>
 reverse_clock_mapping = make_reverse_maping(clock_mapping);
 
 const ::std::map<line::value, gpiod_line_value> value_mapping = {
@@ -257,7 +257,7 @@ GPIOD_CXX_API ::std::chrono::microseconds line_settings::debounce_period() const
 
 GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_clock)
 {
-	set_mapped_value<line::clock, gpiod_line_event_clock,
+	set_mapped_value<line::clock, gpiod_line_clock,
 			 ::gpiod_line_settings_set_event_clock>(this->_m_priv->settings.get(),
 								event_clock, clock_mapping);
 
@@ -266,7 +266,7 @@ GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_cl
 
 GPIOD_CXX_API line::clock line_settings::event_clock() const
 {
-	return get_mapped_value<line::clock, gpiod_line_event_clock,
+	return get_mapped_value<line::clock, gpiod_line_clock,
 				::gpiod_line_settings_get_event_clock>(
 							this->_m_priv->settings.get(),
 							reverse_clock_mapping);
diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
index 8ec1390..2cacbef 100644
--- a/bindings/python/gpiod/ext/line-settings.c
+++ b/bindings/python/gpiod/ext/line-settings.c
@@ -29,7 +29,7 @@ line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
 		NULL
 	};
 
-	enum gpiod_line_event_clock event_clock;
+	enum gpiod_line_clock event_clock;
 	enum gpiod_line_direction direction;
 	enum gpiod_line_value output_value;
 	unsigned long debounce_period;
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 8725ef2..12fb92c 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -80,15 +80,15 @@ static const struct module_const module_constants[] = {
 	},
 	{
 		.name = "CLOCK_MONOTONIC",
-		.val = GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+		.val = GPIOD_LINE_CLOCK_MONOTONIC,
 	},
 	{
 		.name = "CLOCK_REALTIME",
-		.val = GPIOD_LINE_EVENT_CLOCK_REALTIME,
+		.val = GPIOD_LINE_CLOCK_REALTIME,
 	},
 	{
 		.name = "CLOCK_HTE",
-		.val = GPIOD_LINE_EVENT_CLOCK_HTE,
+		.val = GPIOD_LINE_CLOCK_HTE,
 	},
 	{
 		.name = "EDGE_EVENT_TYPE_RISING",
diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index d7a0615..1b2c765 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -45,9 +45,9 @@ use gpiod::{
     gpiod_line_edge_GPIOD_LINE_EDGE_FALLING as GPIOD_LINE_EDGE_FALLING,
     gpiod_line_edge_GPIOD_LINE_EDGE_NONE as GPIOD_LINE_EDGE_NONE,
     gpiod_line_edge_GPIOD_LINE_EDGE_RISING as GPIOD_LINE_EDGE_RISING,
-    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_HTE as GPIOD_LINE_EVENT_CLOCK_HTE,
-    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_MONOTONIC as GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
-    gpiod_line_event_clock_GPIOD_LINE_EVENT_CLOCK_REALTIME as GPIOD_LINE_EVENT_CLOCK_REALTIME,
+    gpiod_line_clock_GPIOD_LINE_CLOCK_HTE as GPIOD_LINE_CLOCK_HTE,
+    gpiod_line_clock_GPIOD_LINE_CLOCK_MONOTONIC as GPIOD_LINE_CLOCK_MONOTONIC,
+    gpiod_line_clock_GPIOD_LINE_CLOCK_REALTIME as GPIOD_LINE_CLOCK_REALTIME,
     gpiod_line_value_GPIOD_LINE_VALUE_ACTIVE as GPIOD_LINE_VALUE_ACTIVE,
     gpiod_line_value_GPIOD_LINE_VALUE_INACTIVE as GPIOD_LINE_VALUE_INACTIVE,
     gpiod_line_value_GPIOD_LINE_VALUE_ERROR as GPIOD_LINE_VALUE_ERROR,
@@ -393,20 +393,20 @@ pub mod line {
     }
 
     impl EventClock {
-        pub(crate) fn new(clock: gpiod::gpiod_line_event_clock) -> Result<Self> {
+        pub(crate) fn new(clock: gpiod::gpiod_line_clock) -> Result<Self> {
             Ok(match clock {
-                GPIOD_LINE_EVENT_CLOCK_MONOTONIC => EventClock::Monotonic,
-                GPIOD_LINE_EVENT_CLOCK_REALTIME => EventClock::Realtime,
-                GPIOD_LINE_EVENT_CLOCK_HTE => EventClock::HTE,
+                GPIOD_LINE_CLOCK_MONOTONIC => EventClock::Monotonic,
+                GPIOD_LINE_CLOCK_REALTIME => EventClock::Realtime,
+                GPIOD_LINE_CLOCK_HTE => EventClock::HTE,
                 _ => return Err(Error::InvalidEnumValue("Eventclock", clock as i32)),
             })
         }
 
-        pub(crate) fn gpiod_clock(&self) -> gpiod::gpiod_line_event_clock {
+        pub(crate) fn gpiod_clock(&self) -> gpiod::gpiod_line_clock {
             match self {
-                EventClock::Monotonic => GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
-                EventClock::Realtime => GPIOD_LINE_EVENT_CLOCK_REALTIME,
-                EventClock::HTE => GPIOD_LINE_EVENT_CLOCK_HTE,
+                EventClock::Monotonic => GPIOD_LINE_CLOCK_MONOTONIC,
+                EventClock::Realtime => GPIOD_LINE_CLOCK_REALTIME,
+                EventClock::HTE => GPIOD_LINE_CLOCK_HTE,
             }
         }
     }
diff --git a/include/gpiod.h b/include/gpiod.h
index fc9d4c0..2ad028d 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -308,14 +308,14 @@ enum gpiod_line_drive {
 };
 
 /**
- * @brief Event clock settings.
+ * @brief Clock settings.
  */
-enum gpiod_line_event_clock {
-	GPIOD_LINE_EVENT_CLOCK_MONOTONIC = 1,
+enum gpiod_line_clock {
+	GPIOD_LINE_CLOCK_MONOTONIC = 1,
 	/**< Line uses the monotonic clock for edge event timestamps. */
-	GPIOD_LINE_EVENT_CLOCK_REALTIME,
+	GPIOD_LINE_CLOCK_REALTIME,
 	/**< Line uses the realtime clock for edge event timestamps. */
-	GPIOD_LINE_EVENT_CLOCK_HTE,
+	GPIOD_LINE_CLOCK_HTE,
 	/**< Line uses the hardware timestamp engine for event timestamps. */
 };
 
@@ -465,10 +465,10 @@ gpiod_line_info_get_debounce_period_us(struct gpiod_line_info *info);
  * @brief Get the event clock setting used for edge event timestamps for the
  *	  line.
  * @param info GPIO line info object.
- * @return Returns ::GPIOD_LINE_EVENT_CLOCK_MONOTONIC or
- *	   ::GPIOD_LINE_EVENT_CLOCK_REALTIME.
+ * @return Returns ::GPIOD_LINE_CLOCK_MONOTONIC, ::GPIOD_LINE_CLOCK_HTE or
+ *	   ::GPIOD_LINE_CLOCK_REALTIME.
  */
-enum gpiod_line_event_clock
+enum gpiod_line_clock
 gpiod_line_info_get_event_clock(struct gpiod_line_info *info);
 
 /**
@@ -684,14 +684,14 @@ gpiod_line_settings_get_debounce_period_us(
  * @return 0 on success, -1 on failure.
  */
 int gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
-				enum gpiod_line_event_clock event_clock);
+				enum gpiod_line_clock event_clock);
 
 /**
  * @brief Get event clock setting.
  * @param settings Line settings object.
  * @return Current event clock setting.
  */
-enum gpiod_line_event_clock
+enum gpiod_line_clock
 gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings);
 
 /**
diff --git a/lib/line-config.c b/lib/line-config.c
index 436f4e8..ce23792 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -343,10 +343,10 @@ static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 		flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
 	switch (gpiod_line_settings_get_event_clock(settings)) {
-	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
+	case GPIOD_LINE_CLOCK_REALTIME:
 		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 		break;
-	case GPIOD_LINE_EVENT_CLOCK_HTE:
+	case GPIOD_LINE_CLOCK_HTE:
 		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE;
 		break;
 	default:
diff --git a/lib/line-info.c b/lib/line-info.c
index 75d886f..6c2c9ce 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -17,7 +17,7 @@ struct gpiod_line_info {
 	enum gpiod_line_bias bias;
 	enum gpiod_line_drive drive;
 	enum gpiod_line_edge edge;
-	enum gpiod_line_event_clock event_clock;
+	enum gpiod_line_clock event_clock;
 	bool debounced;
 	unsigned long debounce_period_us;
 };
@@ -93,7 +93,7 @@ gpiod_line_info_get_edge_detection(struct gpiod_line_info *info)
 	return info->edge;
 }
 
-GPIOD_API enum gpiod_line_event_clock
+GPIOD_API enum gpiod_line_clock
 gpiod_line_info_get_event_clock(struct gpiod_line_info *info)
 {
 	return info->event_clock;
@@ -164,11 +164,11 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 		info->edge = GPIOD_LINE_EDGE_NONE;
 
 	if (uapi_info->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME)
-		info->event_clock = GPIOD_LINE_EVENT_CLOCK_REALTIME;
+		info->event_clock = GPIOD_LINE_CLOCK_REALTIME;
 	else if (uapi_info->flags & GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE)
-		info->event_clock = GPIOD_LINE_EVENT_CLOCK_HTE;
+		info->event_clock = GPIOD_LINE_CLOCK_HTE;
 	else
-		info->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+		info->event_clock = GPIOD_LINE_CLOCK_MONOTONIC;
 
 	/*
 	 * We assume that the kernel returns correct configuration and that no
diff --git a/lib/line-settings.c b/lib/line-settings.c
index dcd0f6b..808819c 100644
--- a/lib/line-settings.c
+++ b/lib/line-settings.c
@@ -14,7 +14,7 @@ struct gpiod_line_settings {
 	enum gpiod_line_drive drive;
 	enum gpiod_line_bias bias;
 	bool active_low;
-	enum gpiod_line_event_clock event_clock;
+	enum gpiod_line_clock event_clock;
 	long debounce_period_us;
 	enum gpiod_line_value output_value;
 };
@@ -45,7 +45,7 @@ GPIOD_API void gpiod_line_settings_reset(struct gpiod_line_settings *settings)
 	settings->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
 	settings->active_low = false;
 	settings->debounce_period_us = 0;
-	settings->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+	settings->event_clock = GPIOD_LINE_CLOCK_MONOTONIC;
 	settings->output_value = GPIOD_LINE_VALUE_INACTIVE;
 }
 
@@ -192,16 +192,16 @@ gpiod_line_settings_get_debounce_period_us(struct gpiod_line_settings *settings)
 
 GPIOD_API int
 gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
-				    enum gpiod_line_event_clock event_clock)
+				    enum gpiod_line_clock event_clock)
 {
 	switch (event_clock) {
-	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
-	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
-	case GPIOD_LINE_EVENT_CLOCK_HTE:
+	case GPIOD_LINE_CLOCK_MONOTONIC:
+	case GPIOD_LINE_CLOCK_REALTIME:
+	case GPIOD_LINE_CLOCK_HTE:
 		settings->event_clock = event_clock;
 		break;
 	default:
-		settings->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+		settings->event_clock = GPIOD_LINE_CLOCK_MONOTONIC;
 		errno = EINVAL;
 		return -1;
 	}
@@ -209,7 +209,7 @@ gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
 	return 0;
 }
 
-GPIOD_API enum gpiod_line_event_clock
+GPIOD_API enum gpiod_line_clock
 gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings)
 {
 	return settings->event_clock;
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index 5dc9022..c615084 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -110,7 +110,7 @@ GPIOD_TEST_CASE(too_many_attrs)
 							 settings);
 
 	gpiod_line_settings_set_event_clock(settings,
-					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+					    GPIOD_LINE_CLOCK_REALTIME);
 	offset = 7;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
index 4751db2..1627764 100644
--- a/tests/tests-line-info.c
+++ b/tests/tests-line-info.c
@@ -88,7 +88,7 @@ GPIOD_TEST_CASE(line_info_basic_properties)
 	g_assert_cmpint(gpiod_line_info_get_drive(info4), ==,
 			GPIOD_LINE_DRIVE_PUSH_PULL);
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info4), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+			GPIOD_LINE_CLOCK_MONOTONIC);
 	g_assert_false(gpiod_line_info_is_debounced(info4));
 	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info4), ==, 0);
 }
@@ -372,13 +372,13 @@ GPIOD_TEST_CASE(event_clock)
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
 	gpiod_line_settings_set_event_clock(settings,
-					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+					    GPIOD_LINE_CLOCK_REALTIME);
 	offset = 1;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
 
 	gpiod_line_settings_set_event_clock(settings,
-					    GPIOD_LINE_EVENT_CLOCK_HTE);
+					    GPIOD_LINE_CLOCK_HTE);
 	offset = 2;
 	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
 							 settings);
@@ -396,9 +396,9 @@ GPIOD_TEST_CASE(event_clock)
 	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
 
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info0), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+			GPIOD_LINE_CLOCK_MONOTONIC);
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info1), ==,
-			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+			GPIOD_LINE_CLOCK_REALTIME);
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info2), ==,
-			GPIOD_LINE_EVENT_CLOCK_HTE);
+			GPIOD_LINE_CLOCK_HTE);
 }
diff --git a/tests/tests-line-settings.c b/tests/tests-line-settings.c
index e6c0277..b86fd26 100644
--- a/tests/tests-line-settings.c
+++ b/tests/tests-line-settings.c
@@ -28,7 +28,7 @@ GPIOD_TEST_CASE(default_config)
 	g_assert_cmpuint(gpiod_line_settings_get_debounce_period_us(settings),
 			 ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+			GPIOD_LINE_CLOCK_MONOTONIC);
 	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
 			GPIOD_LINE_VALUE_INACTIVE);
 }
@@ -207,28 +207,28 @@ GPIOD_TEST_CASE(set_event_clock)
 	settings = gpiod_test_create_line_settings_or_fail();
 
 	ret = gpiod_line_settings_set_event_clock(settings,
-					GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+					GPIOD_LINE_CLOCK_MONOTONIC);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+			GPIOD_LINE_CLOCK_MONOTONIC);
 
 	ret = gpiod_line_settings_set_event_clock(settings,
-					GPIOD_LINE_EVENT_CLOCK_REALTIME);
+					GPIOD_LINE_CLOCK_REALTIME);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
-			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+			GPIOD_LINE_CLOCK_REALTIME);
 
 	ret = gpiod_line_settings_set_event_clock(settings,
-					GPIOD_LINE_EVENT_CLOCK_HTE);
+					GPIOD_LINE_CLOCK_HTE);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
-			GPIOD_LINE_EVENT_CLOCK_HTE);
+			GPIOD_LINE_CLOCK_HTE);
 
 	ret = gpiod_line_settings_set_event_clock(settings, 999);
 	g_assert_cmpint(ret, <, 0);
 	g_assert_cmpint(errno, ==, EINVAL);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+			GPIOD_LINE_CLOCK_MONOTONIC);
 }
 
 GPIOD_TEST_CASE(set_output_value)
@@ -268,7 +268,7 @@ GPIOD_TEST_CASE(copy_line_settings)
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 	gpiod_line_settings_set_debounce_period_us(settings, 2000);
 	gpiod_line_settings_set_event_clock(settings,
-					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+					    GPIOD_LINE_CLOCK_REALTIME);
 
 	copy = gpiod_line_settings_copy(settings);
 	g_assert_nonnull(copy);
@@ -281,7 +281,7 @@ GPIOD_TEST_CASE(copy_line_settings)
 	g_assert_cmpint(gpiod_line_settings_get_debounce_period_us(copy), ==,
 			2000);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(copy), ==,
-			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+			GPIOD_LINE_CLOCK_REALTIME);
 }
 
 GPIOD_TEST_CASE(reset_settings)
@@ -294,7 +294,7 @@ GPIOD_TEST_CASE(reset_settings)
 	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 	gpiod_line_settings_set_debounce_period_us(settings, 2000);
 	gpiod_line_settings_set_event_clock(settings,
-					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+					    GPIOD_LINE_CLOCK_REALTIME);
 
 	gpiod_line_settings_reset(settings);
 
@@ -310,7 +310,7 @@ GPIOD_TEST_CASE(reset_settings)
 	g_assert_cmpuint(gpiod_line_settings_get_debounce_period_us(settings),
 			 ==, 0);
 	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+			GPIOD_LINE_CLOCK_MONOTONIC);
 	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
 			GPIOD_LINE_VALUE_INACTIVE);
 }
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 0bc057a..93ff463 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -28,7 +28,7 @@ struct config {
 	const char *chip_id;
 	const char *consumer;
 	const char *fmt;
-	enum gpiod_line_event_clock event_clock;
+	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
 };
 
@@ -98,13 +98,13 @@ static int parse_edges_or_die(const char *option)
 static int parse_event_clock_or_die(const char *option)
 {
 	if (strcmp(option, "realtime") == 0)
-		return GPIOD_LINE_EVENT_CLOCK_REALTIME;
+		return GPIOD_LINE_CLOCK_REALTIME;
 	if (strcmp(option, "hte") != 0)
-		return GPIOD_LINE_EVENT_CLOCK_HTE;
+		return GPIOD_LINE_CLOCK_HTE;
 	if (strcmp(option, "monotonic") != 0)
 		die("invalid event clock: %s", option);
 
-	return GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+	return GPIOD_LINE_CLOCK_MONOTONIC;
 }
 
 static int parse_config(int argc, char **argv, struct config *cfg)
@@ -206,10 +206,10 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 	/* setup default clock/format combinations, where not overridden */
 	if (cfg->event_clock == 0) {
 		if (cfg->timestamp_fmt)
-			cfg->event_clock = GPIOD_LINE_EVENT_CLOCK_REALTIME;
+			cfg->event_clock = GPIOD_LINE_CLOCK_REALTIME;
 		else
-			cfg->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
-	} else if ((cfg->event_clock == GPIOD_LINE_EVENT_CLOCK_REALTIME) &&
+			cfg->event_clock = GPIOD_LINE_CLOCK_MONOTONIC;
+	} else if ((cfg->event_clock == GPIOD_LINE_CLOCK_REALTIME) &&
 		   (cfg->timestamp_fmt == 0)) {
 		cfg->timestamp_fmt = 1;
 	}
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 4477ac8..44988d4 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -286,10 +286,10 @@ static void print_event_clock(struct gpiod_line_info *info)
 	const char *name;
 
 	switch (gpiod_line_info_get_event_clock(info)) {
-	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
+	case GPIOD_LINE_CLOCK_REALTIME:
 		name = "realtime";
 		break;
-	case GPIOD_LINE_EVENT_CLOCK_HTE:
+	case GPIOD_LINE_CLOCK_HTE:
 		name = "hte";
 		break;
 	default:
-- 
2.37.2

