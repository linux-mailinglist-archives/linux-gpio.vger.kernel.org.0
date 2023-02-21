Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8702469E186
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Feb 2023 14:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbjBUNlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Feb 2023 08:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbjBUNlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2023 08:41:12 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2F929171
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2023 05:41:07 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j2so4293499wrh.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2023 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QKiU82LEoOf6cGNfmOJC5Tu0PYvmSx/RudSa5fDEbH0=;
        b=hUsEPDGNKIn/AG8RnqhMU5bjemV5PdH6pVeOaN0Pfd/eCSdSJJY06okxPbleZ852Zm
         RLhMKAEJJnkj5hYzL/ozN4jRPvbpa4TS8SxJzdBMiOEuDfFN0TFeMMPTeDrSTJ06kbwF
         vOpZFv0jX+59zAzZxRT20NhqpeH/84EnwBaovO6A7c68JyszIxJpuniqFjXCR5hG+dTF
         X/4qlaTYWMNsRLuaDMAI5BVK0+Im0t6Sp+rE0K0rQyeL33gneywsORAJAXPLr74w2TKT
         GHUHUwIjUSYb0ZCSgnuxVHhBs+cT12q++/35dQhsdDO5cML24cGs2fSjdw6LkyrZz9mH
         1GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKiU82LEoOf6cGNfmOJC5Tu0PYvmSx/RudSa5fDEbH0=;
        b=J2E0efWkY+0+2yUrHEPokaPNlrDpR1xjVRaCi35c08Lwjh9kdG+0H6vvu50jVCDKXr
         CVUnxP7bppL8HvPsS8cpVQ+b1oizK+ut1MFlj4TaXjij6zOqWGsrul2jZlFLDGHkZRNP
         u3XD9WyyDWQatSWcJ1UMjblwIJ6oB7qUpoI4CbqaF35tFAtmWyYFdl7e4ud0ZEJAVdaQ
         ks6ooExdTIgMkZR6VYRALGt4D/mnBZkQJg6zg/yDUS3X6TilJMOi6vpMm7GPVh0oxETG
         OZqOezjasfECRSAgaPbw8KrjYOqQ8mCjWCGNXKuGhz4HKMX4MzNJJIC0H6yTpbVUCY/q
         W1og==
X-Gm-Message-State: AO0yUKUwRXsZtXYl6MwsFkwL6P61VyIk3kCy9wUe+K0xul7Be4B6+317
        cIdsXlOMzHyukm3TA5O94hWkpg==
X-Google-Smtp-Source: AK7set8JxSuTmFSYwHb8WoY3mmX01oI5h0K30e+VP/JMKXLWUgthgHAjYTLZ/D0BmYDbTzgotnqGgw==
X-Received: by 2002:a5d:4b06:0:b0:2c5:8c04:c6b8 with SMTP id v6-20020a5d4b06000000b002c58c04c6b8mr3691432wrq.10.1676986865769;
        Tue, 21 Feb 2023 05:41:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4c24:722f:312a:76c4])
        by smtp.gmail.com with ESMTPSA id i16-20020adfefd0000000b002c552c6c8c2sm2525603wrp.87.2023.02.21.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 05:41:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: cxx: mark public classes as final
Date:   Tue, 21 Feb 2023 14:41:03 +0100
Message-Id: <20230221134103.263443-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

libgpiod C++ types are not meant to be inherited from. They already don't
even provide virtual destructors so mark them explicitly as final. With
that the destructors of throwable types can also be made non-virtual.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiodcxx/chip-info.hpp         |  2 +-
 bindings/cxx/gpiodcxx/chip.hpp              |  2 +-
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp |  2 +-
 bindings/cxx/gpiodcxx/edge-event.hpp        |  2 +-
 bindings/cxx/gpiodcxx/exception.hpp         | 12 ++++++------
 bindings/cxx/gpiodcxx/info-event.hpp        |  2 +-
 bindings/cxx/gpiodcxx/line-config.hpp       |  2 +-
 bindings/cxx/gpiodcxx/line-info.hpp         |  2 +-
 bindings/cxx/gpiodcxx/line-request.hpp      |  2 +-
 bindings/cxx/gpiodcxx/line-settings.hpp     |  2 +-
 bindings/cxx/gpiodcxx/request-builder.hpp   |  2 +-
 bindings/cxx/gpiodcxx/request-config.hpp    |  2 +-
 bindings/cxx/gpiodcxx/timestamp.hpp         |  2 +-
 13 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/bindings/cxx/gpiodcxx/chip-info.hpp b/bindings/cxx/gpiodcxx/chip-info.hpp
index ebaf396..b6bd0f8 100644
--- a/bindings/cxx/gpiodcxx/chip-info.hpp
+++ b/bindings/cxx/gpiodcxx/chip-info.hpp
@@ -27,7 +27,7 @@ class chip;
 /**
  * @brief Represents an immutable snapshot of GPIO chip information.
  */
-class chip_info
+class chip_info final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
index 2eaf155..2553f8c 100644
--- a/bindings/cxx/gpiodcxx/chip.hpp
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -38,7 +38,7 @@ class request_config;
 /**
  * @brief Represents a GPIO chip.
  */
-class chip
+class chip final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
index ff4d238..025517f 100644
--- a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -34,7 +34,7 @@ class line_request;
  * buffer which improves the performance by avoiding needless memory
  * allocations.
  */
-class edge_event_buffer
+class edge_event_buffer final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
index 648165c..4fde561 100644
--- a/bindings/cxx/gpiodcxx/edge-event.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -30,7 +30,7 @@ class edge_event_buffer;
 /**
  * @brief Immutable object containing data about a single edge event.
  */
-class edge_event
+class edge_event final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/exception.hpp b/bindings/cxx/gpiodcxx/exception.hpp
index 98b7bc4..e89b384 100644
--- a/bindings/cxx/gpiodcxx/exception.hpp
+++ b/bindings/cxx/gpiodcxx/exception.hpp
@@ -25,7 +25,7 @@ namespace gpiod {
 /**
  * @brief Exception thrown when an already closed chip is used.
  */
-class GPIOD_CXX_API chip_closed : public ::std::logic_error
+class GPIOD_CXX_API chip_closed final : public ::std::logic_error
 {
 public:
 
@@ -61,13 +61,13 @@ public:
 	 */
 	chip_closed& operator=(chip_closed&& other) noexcept;
 
-	virtual ~chip_closed();
+	~chip_closed();
 };
 
 /**
  * @brief Exception thrown when an already released line request is used.
  */
-class GPIOD_CXX_API request_released : public ::std::logic_error
+class GPIOD_CXX_API request_released final : public ::std::logic_error
 {
 public:
 
@@ -103,14 +103,14 @@ public:
 	 */
 	request_released& operator=(request_released&& other) noexcept;
 
-	virtual ~request_released();
+	~request_released();
 };
 
 /**
  * @brief Exception thrown when the core C library returns an invalid value
  *        for any of the line_info properties.
  */
-class GPIOD_CXX_API bad_mapping : public ::std::runtime_error
+class GPIOD_CXX_API bad_mapping final : public ::std::runtime_error
 {
 public:
 
@@ -146,7 +146,7 @@ public:
 	 */
 	bad_mapping& operator=(bad_mapping&& other) noexcept;
 
-	virtual ~bad_mapping();
+	~bad_mapping();
 };
 
 /**
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
index 6f3c0b9..e99cbc4 100644
--- a/bindings/cxx/gpiodcxx/info-event.hpp
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -31,7 +31,7 @@ class line_info;
 /**
  * @brief Immutable object containing data about a single line info event.
  */
-class info_event
+class info_event final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
index b76fdff..8a3335c 100644
--- a/bindings/cxx/gpiodcxx/line-config.hpp
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -30,7 +30,7 @@ class line_settings;
  * @brief Contains a set of line config options used in line requests and
  *        reconfiguration.
  */
-class line_config
+class line_config final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
index 189d305..26d25a9 100644
--- a/bindings/cxx/gpiodcxx/line-info.hpp
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -31,7 +31,7 @@ class info_event;
  * @brief Contains an immutable snapshot of the line's state at the
  *        time when the object of this class was instantiated.
  */
-class line_info
+class line_info final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index f9f0322..54a4e00 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -34,7 +34,7 @@ class line_config;
 /**
  * @brief Stores the context of a set of requested GPIO lines.
  */
-class line_request
+class line_request final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/line-settings.hpp b/bindings/cxx/gpiodcxx/line-settings.hpp
index c18dc52..b043167 100644
--- a/bindings/cxx/gpiodcxx/line-settings.hpp
+++ b/bindings/cxx/gpiodcxx/line-settings.hpp
@@ -29,7 +29,7 @@ class line_config;
 /**
  * @brief Stores GPIO line settings.
  */
-class line_settings
+class line_settings final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/request-builder.hpp b/bindings/cxx/gpiodcxx/request-builder.hpp
index d3ada53..3216216 100644
--- a/bindings/cxx/gpiodcxx/request-builder.hpp
+++ b/bindings/cxx/gpiodcxx/request-builder.hpp
@@ -30,7 +30,7 @@ class request_config;
 /**
  * @brief Intermediate object storing the configuration for a line request.
  */
-class request_builder
+class request_builder final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
index 70d179e..b099eb1 100644
--- a/bindings/cxx/gpiodcxx/request-config.hpp
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -32,7 +32,7 @@ class chip;
  * @brief Stores a set of options passed to the kernel when making a line
  *        request.
  */
-class request_config
+class request_config final
 {
 public:
 
diff --git a/bindings/cxx/gpiodcxx/timestamp.hpp b/bindings/cxx/gpiodcxx/timestamp.hpp
index 5efeb4c..7143ab3 100644
--- a/bindings/cxx/gpiodcxx/timestamp.hpp
+++ b/bindings/cxx/gpiodcxx/timestamp.hpp
@@ -26,7 +26,7 @@ namespace gpiod {
  * @brief Stores the edge and info event timestamps as returned by the kernel
  *        and allows to convert them to std::chrono::time_point.
  */
-class timestamp
+class timestamp final
 {
 public:
 
-- 
2.37.2

