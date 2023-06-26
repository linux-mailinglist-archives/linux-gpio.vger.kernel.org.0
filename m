Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 536BE73DC7E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 12:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjFZKwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 06:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjFZKv6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 06:51:58 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1BAD3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 03:51:48 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa9850bfebso5621365e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687776707; x=1690368707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPTIIF/hwEMUUMUeXHyd9tiQHSmtCBdvtrIZzvn0+X8=;
        b=0uijI9LAqtx+ijFwrhOc4S+NYzZwmPki4bBInpjqFF8uM1YcXrbgy3DkrKX4RxFtdg
         1+2ixSXdnEZbWXITmEHA5nIN+SZmWrtEi+h5ZKVJCVnopKa9coW25Rd5Calks+j6KjVl
         qTnqKuqiSwGIAfXeWcnx4Lj0n4Twl3hCghm3rrmtyN/pabAnk80tl6h9XyT6WY4OJit7
         +hjBlwpwGCKD5jR3LDlPdYuRz1axLhbytSHhngXumWqGN4M3pFFKdn2XYf1c1KfX5fph
         +RLgWSQxcTDOIsTamqcEB4CO6VU0E+/FUZwcL4JpfJ85mnU9tl1CovlSMuLSM1gF9jpo
         2EbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687776707; x=1690368707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPTIIF/hwEMUUMUeXHyd9tiQHSmtCBdvtrIZzvn0+X8=;
        b=MkP+N1o5F2dC9giRnwPmstMWm5NtVyNcrkYSSTTmo89c91UUhm602u1C9kJdPI/8A4
         FfEefkdKKFU1+GoZ4104anCCcX9ja1DeWjRNwB1FUqv85o7PAM5MIoAomoqhp4EvHcVt
         4gatAxUBNmiu3320EiKur770WH+iholR9oJzsDM90KPiYxWNYAg2Vo2DxVuhnD/lZkjA
         gpNo2wQwvrVK5UlMA+uP3xO+24HogDncKe/uS1D3to9FZ0K/S1LGtIGc5OmrqQ3vvTxC
         f7GJKAMT/Ou/+HyufCnWjDnKK8HGjz0dSaZkwbEWPB90JnFqj1ZTSYoHOJKAP7sJ/3oH
         OCnQ==
X-Gm-Message-State: AC+VfDzi/6CQdgOxemgp1zj/p1DcS7syyQ587ZjjAxa4F/sVP8yZwf64
        gQ4e9oWJqTE0qGldSxUpR5G0+A==
X-Google-Smtp-Source: ACHHUZ6AvcD4sFRxDaHzcR8yBjJ+tscfRD8sZN0GeXH6xAXR8GiO4Cqo3oUHUz9XxLg3IHoiVIMlcw==
X-Received: by 2002:a05:600c:2204:b0:3fa:8db4:91ec with SMTP id z4-20020a05600c220400b003fa8db491ecmr2231911wml.10.1687776706810;
        Mon, 26 Jun 2023 03:51:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:35b3:b235:7c12:5f36])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0030fb828511csm6948824wrz.100.2023.06.26.03.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 03:51:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] bindings: cxx: examples: consistently use () for functions taking no args
Date:   Mon, 26 Jun 2023 12:51:43 +0200
Message-Id: <20230626105144.242168-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

While () and (void) are synonymous in C++, we use () everywhere else so
stick to that pattern in examples.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/examples/async_watch_line_value.cpp      | 2 +-
 bindings/cxx/examples/find_line_by_name.cpp           | 2 +-
 bindings/cxx/examples/get_chip_info.cpp               | 2 +-
 bindings/cxx/examples/get_line_info.cpp               | 2 +-
 bindings/cxx/examples/get_line_value.cpp              | 2 +-
 bindings/cxx/examples/get_multiple_line_values.cpp    | 2 +-
 bindings/cxx/examples/reconfigure_input_to_output.cpp | 2 +-
 bindings/cxx/examples/toggle_line_value.cpp           | 2 +-
 bindings/cxx/examples/toggle_multiple_line_values.cpp | 2 +-
 bindings/cxx/examples/watch_line_info.cpp             | 2 +-
 bindings/cxx/examples/watch_line_rising.cpp           | 2 +-
 bindings/cxx/examples/watch_line_value.cpp            | 2 +-
 bindings/cxx/examples/watch_multiple_line_values.cpp  | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/bindings/cxx/examples/async_watch_line_value.cpp b/bindings/cxx/examples/async_watch_line_value.cpp
index d8317a5..9ea9763 100644
--- a/bindings/cxx/examples/async_watch_line_value.cpp
+++ b/bindings/cxx/examples/async_watch_line_value.cpp
@@ -31,7 +31,7 @@ const char* edge_event_type_str(const ::gpiod::edge_event &event)
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	/*
 	 * Assume a button connecting the pin to ground, so pull it up and
diff --git a/bindings/cxx/examples/find_line_by_name.cpp b/bindings/cxx/examples/find_line_by_name.cpp
index 983251a..7b56e69 100644
--- a/bindings/cxx/examples/find_line_by_name.cpp
+++ b/bindings/cxx/examples/find_line_by_name.cpp
@@ -15,7 +15,7 @@ const ::std::string line_name = "GPIO19";
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	/*
 	 * Names are not guaranteed unique, so this finds the first line with
diff --git a/bindings/cxx/examples/get_chip_info.cpp b/bindings/cxx/examples/get_chip_info.cpp
index 073a6c3..2bf26f0 100644
--- a/bindings/cxx/examples/get_chip_info.cpp
+++ b/bindings/cxx/examples/get_chip_info.cpp
@@ -15,7 +15,7 @@ const ::std::filesystem::path chip_path("/dev/gpiochip0");
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	::gpiod::chip chip(chip_path);
 	auto info = chip.get_info();
diff --git a/bindings/cxx/examples/get_line_info.cpp b/bindings/cxx/examples/get_line_info.cpp
index f2f071e..7d517af 100644
--- a/bindings/cxx/examples/get_line_info.cpp
+++ b/bindings/cxx/examples/get_line_info.cpp
@@ -17,7 +17,7 @@ const ::gpiod::line::offset line_offset = 3;
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	auto chip = ::gpiod::chip(chip_path);
 	auto info = chip.get_line_info(line_offset);
diff --git a/bindings/cxx/examples/get_line_value.cpp b/bindings/cxx/examples/get_line_value.cpp
index a14d7e4..fe4f52e 100644
--- a/bindings/cxx/examples/get_line_value.cpp
+++ b/bindings/cxx/examples/get_line_value.cpp
@@ -16,7 +16,7 @@ const ::gpiod::line::offset line_offset = 5;
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	auto request = ::gpiod::chip(chip_path)
 			       .prepare_request()
diff --git a/bindings/cxx/examples/get_multiple_line_values.cpp b/bindings/cxx/examples/get_multiple_line_values.cpp
index d1f22e7..cbd5395 100644
--- a/bindings/cxx/examples/get_multiple_line_values.cpp
+++ b/bindings/cxx/examples/get_multiple_line_values.cpp
@@ -15,7 +15,7 @@ const ::gpiod::line::offsets line_offsets = { 5, 3, 7 };
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	auto request = ::gpiod::chip(chip_path)
 			       .prepare_request()
diff --git a/bindings/cxx/examples/reconfigure_input_to_output.cpp b/bindings/cxx/examples/reconfigure_input_to_output.cpp
index 896c812..d55eaf5 100644
--- a/bindings/cxx/examples/reconfigure_input_to_output.cpp
+++ b/bindings/cxx/examples/reconfigure_input_to_output.cpp
@@ -19,7 +19,7 @@ const ::gpiod::line::offset line_offset = 5;
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	/* request the line initially as an input */
 	auto request = ::gpiod::chip(chip_path)
diff --git a/bindings/cxx/examples/toggle_line_value.cpp b/bindings/cxx/examples/toggle_line_value.cpp
index a17b43b..3dbdb71 100644
--- a/bindings/cxx/examples/toggle_line_value.cpp
+++ b/bindings/cxx/examples/toggle_line_value.cpp
@@ -25,7 +25,7 @@ const ::gpiod::line::offset line_offset = 5;
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	::gpiod::line::value value = ::gpiod::line::value::ACTIVE;
 
diff --git a/bindings/cxx/examples/toggle_multiple_line_values.cpp b/bindings/cxx/examples/toggle_multiple_line_values.cpp
index a5b84bf..df55313 100644
--- a/bindings/cxx/examples/toggle_multiple_line_values.cpp
+++ b/bindings/cxx/examples/toggle_multiple_line_values.cpp
@@ -37,7 +37,7 @@ void print_values(::gpiod::line::offsets const &offsets,
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	::gpiod::line::values values = { ::gpiod::line::value::ACTIVE,
 					 ::gpiod::line::value::ACTIVE,
diff --git a/bindings/cxx/examples/watch_line_info.cpp b/bindings/cxx/examples/watch_line_info.cpp
index 414fb06..6d55500 100644
--- a/bindings/cxx/examples/watch_line_info.cpp
+++ b/bindings/cxx/examples/watch_line_info.cpp
@@ -30,7 +30,7 @@ const char *event_type(const ::gpiod::info_event &event)
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	::gpiod::chip chip(chip_path);
 
diff --git a/bindings/cxx/examples/watch_line_rising.cpp b/bindings/cxx/examples/watch_line_rising.cpp
index aa3be9c..33e4f01 100644
--- a/bindings/cxx/examples/watch_line_rising.cpp
+++ b/bindings/cxx/examples/watch_line_rising.cpp
@@ -29,7 +29,7 @@ const char *edge_event_type_str(const ::gpiod::edge_event &event)
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	auto request =
 		::gpiod::chip(chip_path)
diff --git a/bindings/cxx/examples/watch_line_value.cpp b/bindings/cxx/examples/watch_line_value.cpp
index 5055789..ebc7fe7 100644
--- a/bindings/cxx/examples/watch_line_value.cpp
+++ b/bindings/cxx/examples/watch_line_value.cpp
@@ -29,7 +29,7 @@ const char *edge_event_type_str(const ::gpiod::edge_event &event)
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	/*
 	 * Assume a button connecting the pin to ground, so pull it up and
diff --git a/bindings/cxx/examples/watch_multiple_line_values.cpp b/bindings/cxx/examples/watch_multiple_line_values.cpp
index 42b7213..fb71fb2 100644
--- a/bindings/cxx/examples/watch_multiple_line_values.cpp
+++ b/bindings/cxx/examples/watch_multiple_line_values.cpp
@@ -28,7 +28,7 @@ const char *edge_event_type_str(const ::gpiod::edge_event &event)
 
 } /* namespace */
 
-int main(void)
+int main()
 {
 	auto request =
 		::gpiod::chip(chip_path)
-- 
2.39.2

