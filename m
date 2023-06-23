Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3D573AF7F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjFWEjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjFWEjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:39:49 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200B12128
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:48 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-25ecc896007so122570a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495187; x=1690087187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azHESUpHEVERDexMnZPMiho7ZUBqMaLa/ekyNW2kk+Y=;
        b=YSHLVqoKXtvyJLkmXKh2K2fRFSc86jIZkmUgeLAZ6USxauL69FvKEx1SLTf2b+HQOF
         wXD6E9il9npYZS7WIbkiQG0UpD5ZJzvyPHlW7xXzzEivYitzpzYJGYpNoRXnQQjZC9wF
         xDuZVZUOl+RIipErJ0lv31iW1CccZpBOxV+X3BZtWYc1iPUCnI7/cnHJ8I5y8DB3uaJX
         /y4GlXA6ivqu0had+WlJnhg+yLr0ZbrDGXoPSw1+H2VakhOn8j189Fwiu0XCJlaGCpfM
         IQmEerFHT7wCoetYIw6Mj8OWOEcZn7UoKH0C9390FBIzxfd/CcQ4g9V8fypZ9lOJtoz9
         lVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495187; x=1690087187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azHESUpHEVERDexMnZPMiho7ZUBqMaLa/ekyNW2kk+Y=;
        b=bEGnX/g6zGHSa/W5SO1vE2cib3Cmy87PVaV7fWwpDOLfxHUq+sTpLvS3o88iM4rJN4
         eY/6Af8sbEbpt1EX2v/EKZDh7c2ON0VE+044tTcPF3go+0ym3w3G7/M8oTxMqmIFFvhZ
         OTqU6gA51ucrywqOTTuGftCY/yThgol5s5zN12RVVIxEOAW9rcNRf9HQy0S+306G1l40
         XEzQHKCm2fgnXJglXW9/d03ad+4OZmxbYrv00WWfIydl5CtuR/VQ5GWcCELvboqiEeye
         2rz+BBGbEBKd5hAohqS/PZsD1kC47p6q25PtiPerZoXmLlFZCpg2KrJi/cs3FZG1CCDP
         hGag==
X-Gm-Message-State: AC+VfDxExEJCF673hwK8OTB2jjBBAO5rd1l1kB5gPLMMZAhfILi+RCGu
        rlWk0JLh3mHC79EyQVGOMaMequ7lh2Y=
X-Google-Smtp-Source: ACHHUZ5Rh0ZJF2Hnso5gA+lrdbDNtXC1bdVu8XT25+s+jD+NgOm6HWMSuu4Wz+zmlNCpKTzXocqftA==
X-Received: by 2002:a17:90a:f2d2:b0:25e:86ab:f4d7 with SMTP id gt18-20020a17090af2d200b0025e86abf4d7mr18334034pjb.22.1687495187321;
        Thu, 22 Jun 2023 21:39:47 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:39:47 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 3/8] bindings: cxx: examples: consistency cleanup
Date:   Fri, 23 Jun 2023 12:38:56 +0800
Message-ID: <20230623043901.16764-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
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

A collection of minor changes to be more consistent with other examples:
 - capitalize comments
 - add line offset to value outputs
 - drop comma from edge event outputs
 - drop trailing return where example loops indefintely
 - sort includes

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../cxx/examples/async_watch_line_value.cpp   |  8 +++---
 bindings/cxx/examples/get_line_value.cpp      | 28 +++++++++++--------
 bindings/cxx/examples/toggle_line_value.cpp   | 16 +++++------
 bindings/cxx/examples/watch_line_value.cpp    | 12 ++++----
 4 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/bindings/cxx/examples/async_watch_line_value.cpp b/bindings/cxx/examples/async_watch_line_value.cpp
index e1d4a1e..d8317a5 100644
--- a/bindings/cxx/examples/async_watch_line_value.cpp
+++ b/bindings/cxx/examples/async_watch_line_value.cpp
@@ -7,6 +7,7 @@
 #include <cstring>
 #include <filesystem>
 #include <gpiod.hpp>
+#include <iomanip>
 #include <iostream>
 #include <poll.h>
 
@@ -79,10 +80,9 @@ int main(void)
 
 		for (const auto& event : buffer)
 			::std::cout << "offset: " << event.line_offset()
-				    << ", type: " << edge_event_type_str(event)
-				    << ", event #" << event.line_seqno()
+				    << "  type: " << ::std::setw(7)
+				    << ::std::left << edge_event_type_str(event)
+				    << "  event #" << event.line_seqno()
 				    << ::std::endl;
 	}
-
-	return EXIT_SUCCESS;
 }
diff --git a/bindings/cxx/examples/get_line_value.cpp b/bindings/cxx/examples/get_line_value.cpp
index 8f4e739..a14d7e4 100644
--- a/bindings/cxx/examples/get_line_value.cpp
+++ b/bindings/cxx/examples/get_line_value.cpp
@@ -10,7 +10,7 @@
 
 namespace {
 
-/* example configuration - customize to suit your situation */
+/* Example configuration - customize to suit your situation */
 const ::std::filesystem::path chip_path("/dev/gpiochip0");
 const ::gpiod::line::offset line_offset = 5;
 
@@ -18,17 +18,21 @@ const ::gpiod::line::offset line_offset = 5;
 
 int main(void)
 {
-	auto request =
-		::gpiod::chip(chip_path)
-			.prepare_request()
-			.set_consumer("get-line-value")
-			.add_line_settings(
-				line_offset,
-				::gpiod::line_settings().set_direction(
-					::gpiod::line::direction::INPUT))
-			.do_request();
-
-	::std::cout << request.get_value(line_offset) << ::std::endl;
+	auto request = ::gpiod::chip(chip_path)
+			       .prepare_request()
+			       .set_consumer("get-line-value")
+			       .add_line_settings(
+				       line_offset,
+				       ::gpiod::line_settings().set_direction(
+					       ::gpiod::line::direction::INPUT))
+			       .do_request();
+
+	::std::cout << line_offset << "="
+		    << (request.get_value(line_offset) ==
+					::gpiod::line::value::ACTIVE ?
+				"Active" :
+				"Inactive")
+		    << ::std::endl;
 
 	return EXIT_SUCCESS;
 }
diff --git a/bindings/cxx/examples/toggle_line_value.cpp b/bindings/cxx/examples/toggle_line_value.cpp
index a060e8a..a17b43b 100644
--- a/bindings/cxx/examples/toggle_line_value.cpp
+++ b/bindings/cxx/examples/toggle_line_value.cpp
@@ -6,8 +6,8 @@
 #include <cstdlib>
 #include <chrono>
 #include <filesystem>
-#include <iostream>
 #include <gpiod.hpp>
+#include <iostream>
 #include <thread>
 
 namespace {
@@ -19,15 +19,15 @@ const ::gpiod::line::offset line_offset = 5;
 ::gpiod::line::value toggle_value(::gpiod::line::value v)
 {
 	return (v == ::gpiod::line::value::ACTIVE) ?
-			::gpiod::line::value::INACTIVE :
-			::gpiod::line::value::ACTIVE;
+		       ::gpiod::line::value::INACTIVE :
+		       ::gpiod::line::value::ACTIVE;
 }
 
 } /* namespace */
 
 int main(void)
 {
-	::gpiod::line::value val = ::gpiod::line::value::ACTIVE;
+	::gpiod::line::value value = ::gpiod::line::value::ACTIVE;
 
 	auto request =
 		::gpiod::chip(chip_path)
@@ -40,12 +40,10 @@ int main(void)
 			.do_request();
 
 	for (;;) {
-		::std::cout << val << ::std::endl;
+		::std::cout << line_offset << "=" << value << ::std::endl;
 
 		std::this_thread::sleep_for(std::chrono::seconds(1));
-		val = toggle_value(val);
-		request.set_value(line_offset, val);
+		value = toggle_value(value);
+		request.set_value(line_offset, value);
 	}
-
-	return EXIT_SUCCESS;
 }
diff --git a/bindings/cxx/examples/watch_line_value.cpp b/bindings/cxx/examples/watch_line_value.cpp
index 5436884..5055789 100644
--- a/bindings/cxx/examples/watch_line_value.cpp
+++ b/bindings/cxx/examples/watch_line_value.cpp
@@ -6,6 +6,7 @@
 #include <cstdlib>
 #include <filesystem>
 #include <gpiod.hpp>
+#include <iomanip>
 #include <iostream>
 
 namespace {
@@ -18,7 +19,7 @@ const char *edge_event_type_str(const ::gpiod::edge_event &event)
 {
 	switch (event.type()) {
 	case ::gpiod::edge_event::event_type::RISING_EDGE:
-		return "Rising ";
+		return "Rising";
 	case ::gpiod::edge_event::event_type::FALLING_EDGE:
 		return "Falling";
 	default:
@@ -61,11 +62,10 @@ int main(void)
 		request.read_edge_events(buffer);
 
 		for (const auto &event : buffer)
-			::std::cout << "offset: " << event.line_offset()
-				    << ", type: " << edge_event_type_str(event)
-				    << ", event #" << event.line_seqno()
+			::std::cout << "line: " << event.line_offset()
+				    << "  type: " << ::std::setw(7)
+				    << ::std::left << edge_event_type_str(event)
+				    << "  event #" << event.line_seqno()
 				    << ::std::endl;
 	}
-
-	return EXIT_SUCCESS;
 }
-- 
2.41.0

