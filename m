Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14CB72F34A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 05:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjFNDzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 23:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbjFNDzE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 23:55:04 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CBEC3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:02 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6b280319df5so4399110a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714902; x=1689306902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxiywbFhFg/nIUZw7n1iTjVzDeq3Cscpl5spqxkKk84=;
        b=huUB6Wp0Kdq3FwDpF39/EfxjQUGxBrDd0EK0rXSSoAM+BbcVjrmNqKokJ1098SPEkR
         0WjvxPRduZ6Ew3WfnWErdiLelOa+U5M/lJ0qV/BMz4CgOD04fkj7x+WNTUAsY8WHYKBW
         UEglZialPcVj0qncfeeqwphf5v0PN0JBENI0IhchaX/T6qx4Z9OiDYUHMoFQFtT82/+F
         pclF6k6r2SjwJ3eGpztFYTF80pWFw7egGMcbMtYgN1ZrvP20CgO4TFCfBjqG5a03vybT
         /8KMIckUNRXHsWvzEymIQUoDNIgs4G3nrln5FER/VUDaqxq4w+ajeq5nKHHazIQDi+TL
         D4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714902; x=1689306902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxiywbFhFg/nIUZw7n1iTjVzDeq3Cscpl5spqxkKk84=;
        b=hO5VdO4DG2JxjUdotTI72Og2NYCKfcH+ODtSjgQOovsW4S+pBbmESZxHTbPHJkHWFK
         6sNn+4X3NPYgg0PnCKKGoZZLYvmqA0GWzxI5EkFKpkuJK0AH/zC1bENcvXUrTI0/D4Bi
         6HddqmO73f3sSCHmVR7pUVSWejbl7JHnPT07iB/6ceyAZxKTehc2z2N3aNwYxFf2kUDT
         OZGDilIEgDDR8QE1pmJ3cuFiGPz+aXYy2ETYphHeEIANtXVpDOK1wUaO/NbIkz6+Gw5+
         Qc1Eh7suHuxLLzIWx/SyAyXEajDc2bcZK+mX7+7MaWu1tCiHDrZn3BJ36EKtlRXtQV1M
         /6wQ==
X-Gm-Message-State: AC+VfDxQT52pWa6s1zSnQspki8ZOx66L3nEXaV8rdg0UCJm2WHUW0VLL
        MNWiPYxO/EdvMGfvLwX+WWG5IDpIngg=
X-Google-Smtp-Source: ACHHUZ6NPF9d11O9/syckxQZufWwHzcAdHfH1SnVcBgwclKTx21okOGqjnZz0SzhviMv51BWH1Cd3Q==
X-Received: by 2002:a05:6359:29f:b0:12b:e795:2650 with SMTP id ek31-20020a056359029f00b0012be7952650mr5326925rwb.28.1686714901739;
        Tue, 13 Jun 2023 20:55:01 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001ae6fe84244sm10967412plh.243.2023.06.13.20.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:55:01 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/4] bindings: cxx: examples: add dedicated examples
Date:   Wed, 14 Jun 2023 11:54:24 +0800
Message-Id: <20230614035426.15097-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614035426.15097-1-warthog618@gmail.com>
References: <20230614035426.15097-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add cxx equivalents of the core examples.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/examples/.gitignore              |  4 +
 bindings/cxx/examples/Makefile.am             | 14 +++-
 .../cxx/examples/async_watch_line_value.cpp   | 78 +++++++++++++++++++
 bindings/cxx/examples/get_line_value.cpp      | 29 +++++++
 bindings/cxx/examples/toggle_line_value.cpp   | 45 +++++++++++
 bindings/cxx/examples/watch_line_value.cpp    | 62 +++++++++++++++
 6 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100644 bindings/cxx/examples/async_watch_line_value.cpp
 create mode 100644 bindings/cxx/examples/get_line_value.cpp
 create mode 100644 bindings/cxx/examples/toggle_line_value.cpp
 create mode 100644 bindings/cxx/examples/watch_line_value.cpp

diff --git a/bindings/cxx/examples/.gitignore b/bindings/cxx/examples/.gitignore
index 2209497..268b3f6 100644
--- a/bindings/cxx/examples/.gitignore
+++ b/bindings/cxx/examples/.gitignore
@@ -8,3 +8,7 @@ gpioinfocxx
 gpiomoncxx
 gpionotifycxx
 gpiosetcxx
+async_watch_line_value
+get_line_value
+toggle_line_value
+watch_line_value
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index 36977ef..0213973 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -12,7 +12,11 @@ noinst_PROGRAMS = \
 	gpioinfocxx \
 	gpiomoncxx \
 	gpionotifycxx \
-	gpiosetcxx
+	gpiosetcxx \
+	async_watch_line_value \
+	get_line_value \
+	toggle_line_value \
+	watch_line_value
 
 gpiodetectcxx_SOURCES = gpiodetectcxx.cpp
 
@@ -27,3 +31,11 @@ gpiomoncxx_SOURCES = gpiomoncxx.cpp
 gpionotifycxx_SOURCES = gpionotifycxx.cpp
 
 gpiosetcxx_SOURCES = gpiosetcxx.cpp
+
+async_watch_line_value_SOURCES = async_watch_line_value.cpp
+
+get_line_value_SOURCES = get_line_value.cpp
+
+toggle_line_value_SOURCES = toggle_line_value.cpp
+
+watch_line_value_SOURCES = watch_line_value.cpp
diff --git a/bindings/cxx/examples/async_watch_line_value.cpp b/bindings/cxx/examples/async_watch_line_value.cpp
new file mode 100644
index 0000000..965e7dd
--- /dev/null
+++ b/bindings/cxx/examples/async_watch_line_value.cpp
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of asynchronously watching for edges on a single line. */
+
+#include <cerrno>
+#include <cstdlib>
+#include <cstring>
+#include <gpiod.hpp>
+#include <iostream>
+#include <poll.h>
+
+const char *edge_event_type_str(const ::gpiod::edge_event &event)
+{
+	switch (event.type()) {
+	case ::gpiod::edge_event::event_type::RISING_EDGE:
+		return "Rising ";
+	case ::gpiod::edge_event::event_type::FALLING_EDGE:
+		return "Falling";
+	default:
+		return "Unknown";
+	}
+}
+
+int main(void)
+{
+	// example configuration - customize to suit your situation
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	// assume a button connecting the pin to ground,
+	// so pull it up and provide some debounce.
+	auto request =
+		::gpiod::chip(chip_path)
+			.prepare_request()
+			.set_consumer("async-watch-line-value")
+			.add_line_settings(
+				line_offset,
+				::gpiod::line_settings()
+					.set_direction(
+						::gpiod::line::direction::INPUT)
+					.set_edge_detection(
+						::gpiod::line::edge::BOTH)
+					.set_bias(::gpiod::line::bias::PULL_UP)
+					.set_debounce_period(
+						std::chrono::milliseconds(10)))
+			.do_request();
+
+	// a larger buffer is an optimisation for reading bursts of events from
+	// the kernel, but that is not necessary in this case, so 1 is fine.
+	::gpiod::edge_event_buffer buffer(1);
+
+	struct pollfd pollfd;
+	pollfd.fd = request.fd();
+	pollfd.events = POLLIN;
+
+	for (;;) {
+		// other fds could be registered with the poll and be handled
+		// separately using the pollfd.revents after poll()
+		int ret = poll(&pollfd, 1, -1);
+		if (ret == -1) {
+			::std::cerr << "error waiting for edge events: "
+				    << strerror(errno) << ::std::endl;
+
+			return EXIT_FAILURE;
+		}
+
+		request.read_edge_events(buffer);
+
+		for (const auto &event : buffer)
+			::std::cout << "offset: " << event.line_offset()
+				    << ", type: " << edge_event_type_str(event)
+				    << ", event #" << event.line_seqno()
+				    << ::std::endl;
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/get_line_value.cpp b/bindings/cxx/examples/get_line_value.cpp
new file mode 100644
index 0000000..3e14b56
--- /dev/null
+++ b/bindings/cxx/examples/get_line_value.cpp
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading a single line. */
+
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iostream>
+
+int main(void)
+{
+	using ::gpiod::line_settings;
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	auto request = ::gpiod::chip(chip_path)
+			       .prepare_request()
+			       .set_consumer("get-line-value")
+			       .add_line_settings(
+				       line_offset,
+				       ::gpiod::line_settings().set_direction(
+					       ::gpiod::line::direction::INPUT))
+			       .do_request();
+
+	::gpiod::line::value value = request.get_value(line_offset);
+	::std::cout << value << ::std::endl;
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/toggle_line_value.cpp b/bindings/cxx/examples/toggle_line_value.cpp
new file mode 100644
index 0000000..2f47553
--- /dev/null
+++ b/bindings/cxx/examples/toggle_line_value.cpp
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of toggling a single line. */
+
+#include <gpiod.hpp>
+#include <chrono>
+#include <thread>
+#include <cstdlib>
+#include <iostream>
+
+using ::gpiod::line::value;
+
+value toggle_value(value v)
+{
+	return (v == value::ACTIVE) ? value::INACTIVE : value::ACTIVE;
+}
+
+int main(void)
+{
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	value v = value::ACTIVE;
+
+	auto request =
+		::gpiod::chip(chip_path)
+			.prepare_request()
+			.set_consumer("toggle-line-value")
+			.add_line_settings(
+				line_offset,
+				::gpiod::line_settings().set_direction(
+					::gpiod::line::direction::OUTPUT))
+			.do_request();
+
+	for (;;) {
+		::std::cout << v << ::std::endl;
+		std::this_thread::sleep_for(std::chrono::seconds(1));
+		v = toggle_value(v);
+		request.set_value(line_offset, v);
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/watch_line_value.cpp b/bindings/cxx/examples/watch_line_value.cpp
new file mode 100644
index 0000000..d3f2390
--- /dev/null
+++ b/bindings/cxx/examples/watch_line_value.cpp
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for edges on a single line. */
+
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iostream>
+
+const char *edge_event_type_str(const ::gpiod::edge_event &event)
+{
+	switch (event.type()) {
+	case ::gpiod::edge_event::event_type::RISING_EDGE:
+		return "Rising ";
+	case ::gpiod::edge_event::event_type::FALLING_EDGE:
+		return "Falling";
+	default:
+		return "Unknown";
+	}
+}
+
+int main(void)
+{
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	// assume a button connecting the pin to ground,
+	// so pull it up and provide some debounce.
+	auto request =
+		::gpiod::chip(chip_path)
+			.prepare_request()
+			.set_consumer("watch-line-value")
+			.add_line_settings(
+				line_offset,
+				::gpiod::line_settings()
+					.set_direction(
+						::gpiod::line::direction::INPUT)
+					.set_edge_detection(
+						::gpiod::line::edge::BOTH)
+					.set_bias(::gpiod::line::bias::PULL_UP)
+					.set_debounce_period(
+						std::chrono::milliseconds(10)))
+			.do_request();
+
+	// a larger buffer is an optimisation for reading bursts of events from
+	// the kernel, but that is not necessary in this case, so 1 is fine.
+	::gpiod::edge_event_buffer buffer(1);
+
+	for (;;) {
+		// blocks until at least one event is available
+		request.read_edge_events(buffer);
+
+		for (const auto &event : buffer)
+			::std::cout << "offset: " << event.line_offset()
+				    << ", type: " << edge_event_type_str(event)
+				    << ", event #" << event.line_seqno()
+				    << ::std::endl;
+	}
+
+	return EXIT_SUCCESS;
+}
-- 
2.40.1

