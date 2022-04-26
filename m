Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49C450FD92
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 14:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346490AbiDZMyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 08:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350246AbiDZMyC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 08:54:02 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18B873043
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k2so4895531wrd.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vERryW+Wp0Oht0NmqJibaVsbMcSCNMYECUnGuJcrBFc=;
        b=17++Uf604yEfLCWiOtdjkf6CnsPTYRbJJ5/BhjUJcBU6/i6IEZqzqdj7zvaIkkxPoe
         OZUpQFQq/Gu2O5k6uIBvi7LbB6SLcnEnxW4m8x8nr3qMcafGfMFDAU7HFrdyELO/e9Uo
         MKaYG6U5rWnjjJ/j7C1cOuaXXy1AlUBNfsOuxaruce+J73Db9Vjdbx6znAALABA2Pc+2
         9zscLjXLFwAwVVCvkn7hcqfb9qaqniArVz5DL4Ig+fd/ukS4dzhFhwDzcJ1EEV6091o2
         C50XSqv6DrQJOu78wvUIOGbpbeVSPdzoJ4IlXP92wfDXvJdvqQpLzlU0zlQZ3Wmd3sOw
         h3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vERryW+Wp0Oht0NmqJibaVsbMcSCNMYECUnGuJcrBFc=;
        b=6NUPW5YmFlYjV7vuqXRmAe8jqy4lssfiROJYEfcjLa43IzLBqTGxkkhgfsIuzetlz9
         yCWuIPTLAxcW/x3xe4lTl0WrR71VUGGTET2C76TyAw6k/zm/j/6tH7Z207fQQBLtxyWS
         IgcYY6pMsMcZxSUc8LYN3rQrsYBt8RZV6CC7jv/URNIjz9HExhdcYQtAr9aQMCZkB0/s
         iizjPAxShNhzCqtS3JrTe4yFg8YGrxmAqT2VI8EmMkNbBLrhLQVIoCS/jbqUh/N3Z1w4
         8/CVEz4ahp+HpBEDmPmX7Z2jM7i+ot2tvkf4rICEeqItPet2/Y1JRTZat/nfbh7XwWhK
         M7QA==
X-Gm-Message-State: AOAM5339yOkexuQQZoBI2icQEBvx6XDI+4yxgA6KRS9XIc7bdHJunLnU
        7qt6n+941f4gDYFmdPrP02eH9A==
X-Google-Smtp-Source: ABdhPJyBYJBy3LCBwlJd2i6UrOIOMa8e0hqokFjpax/C4iQzG/xZh0Vs8CCovaR0PORmL0VoXeNKOw==
X-Received: by 2002:a5d:604a:0:b0:20a:d81c:39cf with SMTP id j10-20020a5d604a000000b0020ad81c39cfmr9933144wrt.358.1650977453248;
        Tue, 26 Apr 2022 05:50:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:faf0:6ae0:9a53:ee37])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c3b9400b00393ea849663sm6128600wms.30.2022.04.26.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:50:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v6 4/5] bindings: cxx: add examples
Date:   Tue, 26 Apr 2022 14:50:22 +0200
Message-Id: <20220426125023.2664623-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426125023.2664623-1-brgl@bgdev.pl>
References: <20220426125023.2664623-1-brgl@bgdev.pl>
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

This adds a couple example tools written using the new bindings.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/examples/.gitignore        |  9 +++
 bindings/cxx/examples/Makefile.am       | 26 +++++++++
 bindings/cxx/examples/gpiodetectcxx.cpp | 30 ++++++++++
 bindings/cxx/examples/gpiofindcxx.cpp   | 32 +++++++++++
 bindings/cxx/examples/gpiogetcxx.cpp    | 38 +++++++++++++
 bindings/cxx/examples/gpioinfocxx.cpp   | 61 ++++++++++++++++++++
 bindings/cxx/examples/gpiomoncxx.cpp    | 74 +++++++++++++++++++++++++
 bindings/cxx/examples/gpiosetcxx.cpp    | 57 +++++++++++++++++++
 8 files changed, 327 insertions(+)
 create mode 100644 bindings/cxx/examples/.gitignore
 create mode 100644 bindings/cxx/examples/Makefile.am
 create mode 100644 bindings/cxx/examples/gpiodetectcxx.cpp
 create mode 100644 bindings/cxx/examples/gpiofindcxx.cpp
 create mode 100644 bindings/cxx/examples/gpiogetcxx.cpp
 create mode 100644 bindings/cxx/examples/gpioinfocxx.cpp
 create mode 100644 bindings/cxx/examples/gpiomoncxx.cpp
 create mode 100644 bindings/cxx/examples/gpiosetcxx.cpp

diff --git a/bindings/cxx/examples/.gitignore b/bindings/cxx/examples/.gitignore
new file mode 100644
index 0000000..54bda46
--- /dev/null
+++ b/bindings/cxx/examples/.gitignore
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+gpiodetectcxx
+gpiofindcxx
+gpiogetcxx
+gpioinfocxx
+gpiomoncxx
+gpiosetcxx
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
new file mode 100644
index 0000000..04cd64a
--- /dev/null
+++ b/bindings/cxx/examples/Makefile.am
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
+AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++17
+AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
+
+noinst_PROGRAMS = \
+		gpiodetectcxx \
+		gpiofindcxx \
+		gpiogetcxx \
+		gpioinfocxx \
+		gpiomoncxx \
+		gpiosetcxx
+
+gpiodetectcxx_SOURCES = gpiodetectcxx.cpp
+
+gpiofindcxx_SOURCES = gpiofindcxx.cpp
+
+gpiogetcxx_SOURCES = gpiogetcxx.cpp
+
+gpioinfocxx_SOURCES = gpioinfocxx.cpp
+
+gpiomoncxx_SOURCES = gpiomoncxx.cpp
+
+gpiosetcxx_SOURCES = gpiosetcxx.cpp
diff --git a/bindings/cxx/examples/gpiodetectcxx.cpp b/bindings/cxx/examples/gpiodetectcxx.cpp
new file mode 100644
index 0000000..7dbb0e0
--- /dev/null
+++ b/bindings/cxx/examples/gpiodetectcxx.cpp
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+/* C++ reimplementation of the gpiodetect tool. */
+
+#include <cstdlib>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <iostream>
+
+int main(int argc, char **argv)
+{
+	if (argc != 1) {
+		::std::cerr << "usage: " << argv[0] << ::std::endl;
+		return EXIT_FAILURE;
+	}
+
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path())) {
+			::gpiod::chip chip(entry.path());
+			auto info = chip.get_info();
+
+			::std::cout << info.name() << " [" <<
+				       info.label() << "] (" <<
+				       info.num_lines() << " lines)" << ::std::endl;
+		}
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
new file mode 100644
index 0000000..cd36be7
--- /dev/null
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+/* C++ reimplementation of the gpiofind tool. */
+
+#include <gpiod.hpp>
+
+#include <cstdlib>
+#include <filesystem>
+#include <iostream>
+
+int main(int argc, char **argv)
+{
+	if (argc != 2) {
+		::std::cerr << "usage: " << argv[0] << " <line name>" << ::std::endl;
+		return EXIT_FAILURE;
+	}
+
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path())) {
+			::gpiod::chip chip(entry.path());
+
+			auto offset = chip.get_line_offset_from_name(argv[1]);
+			if (offset >= 0) {
+				::std::cout << chip.get_info().name() << " " << offset << ::std::endl;
+				return EXIT_SUCCESS;
+			}
+		}
+	}
+
+	return EXIT_FAILURE;
+}
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
new file mode 100644
index 0000000..0136f5f
--- /dev/null
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+/* Simplified C++ reimplementation of the gpioget tool. */
+
+#include <gpiod.hpp>
+
+#include <cstdlib>
+#include <iostream>
+
+int main(int argc, char **argv)
+{
+	if (argc < 3) {
+		::std::cerr << "usage: " << argv[0] << " <chip> <line_offset0> ..." << ::std::endl;
+		return EXIT_FAILURE;
+	}
+
+	::gpiod::line::offsets offsets;
+
+	for (int i = 2; i < argc; i++)
+		offsets.push_back(::std::stoul(argv[i]));
+
+	::gpiod::chip chip(argv[1]);
+	auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ ::gpiod::request_config::property::OFFSETS, offsets },
+				{ ::gpiod::request_config::property::CONSUMER, "gpiogetcxx" }
+			}),
+			::gpiod::line_config());
+
+	auto vals = request.get_values();
+
+	for (auto& it: vals)
+		::std::cout << (it == ::gpiod::line::value::ACTIVE ? "1" : "0") << ' ';
+	::std::cout << ::std::endl;
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
new file mode 100644
index 0000000..3612092
--- /dev/null
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+/* Simplified C++ reimplementation of the gpioinfo tool. */
+
+#include <gpiod.hpp>
+
+#include <cstdlib>
+#include <filesystem>
+#include <iostream>
+
+namespace {
+
+void show_chip(const ::gpiod::chip& chip)
+{
+	auto info = chip.get_info();
+
+	::std::cout << info.name() << " - " << info.num_lines() << " lines:" << ::std::endl;
+
+	for (unsigned int offset = 0; offset < info.num_lines(); offset++) {
+		auto info = chip.get_line_info(offset);
+
+		::std::cout << "\tline ";
+		::std::cout.width(3);
+		::std::cout << info.offset() << ": ";
+
+		::std::cout.width(12);
+		::std::cout << (info.name().empty() ? "unnamed" : info.name());
+		::std::cout << " ";
+
+		::std::cout.width(12);
+		::std::cout << (info.consumer().empty() ? "unused" : info.consumer());
+		::std::cout << " ";
+
+		::std::cout.width(8);
+		::std::cout << (info.direction() == ::gpiod::line::direction::INPUT ? "input" : "output");
+		::std::cout << " ";
+
+		::std::cout.width(10);
+		::std::cout << (info.active_low() ? "active-low" : "active-high");
+
+		::std::cout << ::std::endl;
+	}
+}
+
+} /* namespace */
+
+int main(int argc, char **argv)
+{
+	if (argc != 1) {
+		::std::cerr << "usage: " << argv[0] << ::std::endl;
+		return EXIT_FAILURE;
+	}
+
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path()))
+			show_chip(::gpiod::chip(entry.path()));
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
new file mode 100644
index 0000000..db053dd
--- /dev/null
+++ b/bindings/cxx/examples/gpiomoncxx.cpp
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+/* Simplified C++ reimplementation of the gpiomon tool. */
+
+#include <chrono>
+#include <cstdlib>
+#include <gpiod.hpp>
+#include <iostream>
+
+namespace {
+
+void print_event(const ::gpiod::edge_event& event)
+{
+	if (event.type() == ::gpiod::edge_event::event_type::RISING_EDGE)
+		::std::cout << " RISING EDGE";
+	else
+		::std::cout << "FALLING EDGE";
+
+	::std::cout << " ";
+
+	::std::cout << event.timestamp_ns() / 1000000000;
+	::std::cout << ".";
+	::std::cout << event.timestamp_ns() % 1000000000;
+
+	::std::cout << " line: " << event.line_offset();
+
+	::std::cout << ::std::endl;
+}
+
+} /* namespace */
+
+int main(int argc, char **argv)
+{
+	if (argc < 3) {
+		::std::cout << "usage: " << argv[0] << " <chip> <offset0> ..." << ::std::endl;
+		return EXIT_FAILURE;
+	}
+
+	::gpiod::line::offsets offsets;
+	offsets.reserve(argc);
+	for (int i = 2; i < argc; i++)
+		offsets.push_back(::std::stoul(argv[i]));
+
+	::gpiod::chip chip(argv[1]);
+	auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ ::gpiod::request_config::property::OFFSETS, offsets},
+				{ ::gpiod::request_config::property::CONSUMER, "gpiomoncxx"},
+			}),
+			::gpiod::line_config({
+				{
+					::gpiod::line_config::property::DIRECTION,
+					::gpiod::line::direction::INPUT
+				},
+				{
+					::gpiod::line_config::property::EDGE,
+					::gpiod::line::edge::BOTH
+				}
+			}));
+
+	::gpiod::edge_event_buffer buffer;
+
+	for (;;) {
+		if (request.wait_edge_event(::std::chrono::seconds(5))) {
+			request.read_edge_event(buffer);
+
+			for (const auto& event: buffer)
+				print_event(event);
+		}
+	}
+
+	return EXIT_SUCCESS;
+}
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
new file mode 100644
index 0000000..838d801
--- /dev/null
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+/* Simplified C++ reimplementation of the gpioset tool. */
+
+#include <gpiod.hpp>
+
+#include <cstdlib>
+#include <iostream>
+
+int main(int argc, char **argv)
+{
+	if (argc < 3) {
+		::std::cerr << "usage: " << argv[0] <<
+			       " <chip> <line_offset0>=<value0> ..." << ::std::endl;
+		return EXIT_FAILURE;
+	}
+
+	::gpiod::line::offsets offsets;
+	::gpiod::line::values values;
+
+	for (int i = 2; i < argc; i++) {
+		::std::string arg(argv[i]);
+
+		size_t pos = arg.find('=');
+
+		::std::string offset(arg.substr(0, pos));
+		::std::string value(arg.substr(pos + 1, ::std::string::npos));
+
+		if (offset.empty() || value.empty())
+			throw ::std::invalid_argument("invalid offset=value mapping: " +
+						      ::std::string(argv[i]));
+
+		offsets.push_back(::std::stoul(offset));
+		values.push_back(::std::stoul(value) ? ::gpiod::line::value::ACTIVE :
+						       ::gpiod::line::value::INACTIVE);
+	}
+
+	::gpiod::chip chip(argv[1]);
+	auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ ::gpiod::request_config::property::OFFSETS, offsets },
+				{ ::gpiod::request_config::property::CONSUMER, "gpiogetcxx" }
+			}),
+			::gpiod::line_config({
+				{
+					::gpiod::line_config::property::DIRECTION,
+					::gpiod::line::direction::OUTPUT
+				}
+			}));
+
+	request.set_values(values);
+
+	::std::cin.get();
+
+	return EXIT_SUCCESS;
+}
-- 
2.32.0

