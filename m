Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB0E599C98
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Aug 2022 15:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349098AbiHSM6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Aug 2022 08:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349036AbiHSM6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Aug 2022 08:58:02 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64B3102287
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2022 05:57:38 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bs25so5099952wrb.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Aug 2022 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=v7Mw1dUBoXrg5E6rOZlpLJPmFBlri8Ozp2OrT1xMX4E=;
        b=EIkP15ORkOF2LFAerZo2SN6Z5KmViol65pNQRMsS2WrcPtvoG4peT0Mh69+WtJj32c
         zA421d0OVX19HZJ5wgVIdgJQTS96JjIAjGdUK3gEv9+XNyr5RPHbY+w/rJTj6POuyoSs
         auIVzV8KMNVOOj53rE3gbHVvpul6XzTOP7zZcuT2Xb7uaHtwRb4Quxq1/EhYfHjNy6Hg
         Lrls9ELUTmGjWxsT1NtycGLqpeGWi+N0cCKlscsh7fLjsH9eEXzRiBkoJP8BkwMVmUTP
         i6gkPlsQOhGJqCxAjFH6cZYwQMMpqEALI2DfccXytTXXiQebJ8UgKlKZtRO/E6oI2TXf
         C9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=v7Mw1dUBoXrg5E6rOZlpLJPmFBlri8Ozp2OrT1xMX4E=;
        b=M/ATzAj81OCroddva47YMbPyVPVE2Y2Ft4GL/SfJdr1ZKCzTvaPjB2IMd0cHt3qK9B
         C2XgVrV3O/03aUyfdBZrpNZI/nDZSp36DhdQmm1pblj/OKwiIpgZWJfTsqgjj6P3T/Sk
         +tN0ZpNjCubYy7eeCIsXHEI/qPMgMwuUOPBPENVxbzaM1ZFlWP3mUwOJ3Z0vOosZemCD
         DQpcR3HME7lXWGb3aP6EZec+VFW1Irv6iJ54rveek1tRPQrAd+zdBwJZEQ2I7P3T0Y+s
         i20tH2U5A0Vek/lNNgo71ueR+1596NvKipIYMVR3nt5zd2mo1RI8f1xAUSpjtN158xbN
         ZiiQ==
X-Gm-Message-State: ACgBeo38Cj3027Ak5zb0wc3WaevyUxLVVpZU/r3o5OL1Gh4qPd6IBWwl
        xNmwfJ/KUAoupD3vesfyVdj9Lw==
X-Google-Smtp-Source: AA6agR55Dre1ysG9pBoebOxhqZZOQ5+CXSacuNwifzkFHleyxexHihY+AhYpCdPcCzJGxh7mUQ6JXQ==
X-Received: by 2002:a5d:6445:0:b0:225:1a75:7754 with SMTP id d5-20020a5d6445000000b002251a757754mr4155192wrw.239.1660913854623;
        Fri, 19 Aug 2022 05:57:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e24e:29a0:a8c1:942b])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c35c600b003a626055569sm5435981wmq.16.2022.08.19.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:57:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][RFC PATCH] treewide: rework line configuration
Date:   Fri, 19 Aug 2022 14:57:30 +0200
Message-Id: <20220819125730.68906-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
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

This tries to get rid of the concept of defaults and overrides for line
properties from the library (or rather hide them from the users). While
this makes the C API a bit more complex, it allows for a more elegant
high-level interface.

This patch is pretty big but I'll just give an overview here. I don't
expect a detailed review of every line.

Low-level data structure model (as seen in the C API):

We're adding a new structure - line_settings. It's a basic data class
that stores a set of line properties. The line_config object is simplified
and becomes a storage for the mappings between offsets and line_settings.

We no longer require the user to store the offsets array in the
request_config. The offsets to request are simply those for which the
user explicitly added settings to the line_config. Subsequently, the
request_config structure becomes optional for the request.

In C++ bindings this allows us to implement an elegant interface with
rust-like chained mutators. To that end, we're also introducing a new
intermediate class called request_builder that's returned by the chip's
prepare_request() method which exposes routines for storing the line
and request configs for the request we're making. For examples of
usage - see C++ tests and samples.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/Makefile.am                    |    2 +
 bindings/cxx/chip-info.cpp                  |    3 +
 bindings/cxx/chip.cpp                       |   54 +-
 bindings/cxx/edge-event-buffer.cpp          |    2 +
 bindings/cxx/edge-event.cpp                 |    2 +
 bindings/cxx/examples/gpiogetcxx.cpp        |   22 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |   35 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |   27 +-
 bindings/cxx/gpiod.hpp                      |    2 +
 bindings/cxx/gpiodcxx/Makefile.am           |    2 +
 bindings/cxx/gpiodcxx/chip.hpp              |   18 +-
 bindings/cxx/gpiodcxx/line-config.hpp       |  497 +-------
 bindings/cxx/gpiodcxx/line-request.hpp      |   18 +-
 bindings/cxx/gpiodcxx/line-settings.hpp     |  193 +++
 bindings/cxx/gpiodcxx/request-builder.hpp   |   92 ++
 bindings/cxx/gpiodcxx/request-config.hpp    |   69 +-
 bindings/cxx/info-event.cpp                 |    1 +
 bindings/cxx/internal.hpp                   |   32 +-
 bindings/cxx/line-config.cpp                |  661 ++--------
 bindings/cxx/line-info.cpp                  |    3 +-
 bindings/cxx/line-request.cpp               |   22 +-
 bindings/cxx/line-settings.cpp              |  303 +++++
 bindings/cxx/line.cpp                       |    3 +
 bindings/cxx/request-builder.cpp            |   83 ++
 bindings/cxx/request-config.cpp             |   99 +-
 bindings/cxx/tests/Makefile.am              |    5 +-
 bindings/cxx/tests/tests-edge-event.cpp     |  194 +--
 bindings/cxx/tests/tests-info-event.cpp     |   50 +-
 bindings/cxx/tests/tests-line-config.cpp    |  288 +----
 bindings/cxx/tests/tests-line-request.cpp   |  259 ++--
 bindings/cxx/tests/tests-line-settings.cpp  |  143 +++
 bindings/cxx/tests/tests-request-config.cpp |   82 +-
 include/gpiod.h                             |  678 +++-------
 lib/Makefile.am                             |    1 +
 lib/chip.c                                  |    8 +-
 lib/internal.h                              |   11 +-
 lib/line-config.c                           | 1241 ++++---------------
 lib/line-request.c                          |   29 +-
 lib/line-settings.c                         |  237 ++++
 lib/request-config.c                        |   47 +-
 tests/Makefile.am                           |    3 +-
 tests/gpiod-test-helpers.h                  |   24 +
 tests/tests-edge-event.c                    |  168 +--
 tests/tests-info-event.c                    |   50 +-
 tests/tests-line-config.c                   |  547 +++-----
 tests/tests-line-info.c                     |  227 ++--
 tests/tests-line-request.c                  |  357 +++---
 tests/tests-line-settings.c                 |  314 +++++
 tests/tests-request-config.c                |   51 +-
 tools/gpio-tools-test.bats                  |    6 +-
 tools/gpioget.c                             |   27 +-
 tools/gpiomon.c                             |   27 +-
 tools/gpioset.c                             |   37 +-
 tools/tools-common.c                        |   13 +
 tools/tools-common.h                        |    1 +
 55 files changed, 3103 insertions(+), 4267 deletions(-)
 create mode 100644 bindings/cxx/gpiodcxx/line-settings.hpp
 create mode 100644 bindings/cxx/gpiodcxx/request-builder.hpp
 create mode 100644 bindings/cxx/line-settings.cpp
 create mode 100644 bindings/cxx/request-builder.cpp
 create mode 100644 bindings/cxx/tests/tests-line-settings.cpp
 create mode 100644 lib/line-settings.c
 create mode 100644 tests/tests-line-settings.c

diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index 65da13f..f719072 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -15,7 +15,9 @@ libgpiodcxx_la_SOURCES =	\
 	line-config.cpp		\
 	line-info.cpp		\
 	line-request.cpp	\
+	line-settings.cpp	\
 	misc.cpp		\
+	request-builder.cpp	\
 	request-config.cpp
 
 libgpiodcxx_la_CXXFLAGS = -Wall -Wextra -g -std=gnu++17
diff --git a/bindings/cxx/chip-info.cpp b/bindings/cxx/chip-info.cpp
index e3e6f27..c4f0ab5 100644
--- a/bindings/cxx/chip-info.cpp
+++ b/bindings/cxx/chip-info.cpp
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <ostream>
+#include <utility>
+
 #include "internal.hpp"
 
 namespace gpiod {
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 9e17a62..d6a3a43 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -1,15 +1,15 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <ostream>
+#include <utility>
+
 #include "internal.hpp"
 
 namespace gpiod {
 
 namespace {
 
-using chip_deleter = deleter<::gpiod_chip, ::gpiod_chip_close>;
-using chip_ptr = ::std::unique_ptr<::gpiod_chip, chip_deleter>;
-
 chip_ptr open_chip(const ::std::filesystem::path& path)
 {
 	chip_ptr chip(::gpiod_chip_open(path.c_str()));
@@ -21,27 +21,17 @@ chip_ptr open_chip(const ::std::filesystem::path& path)
 
 } /* namespace */
 
-struct chip::impl
+chip::impl::impl(const ::std::filesystem::path& path)
+	: chip(open_chip(path))
 {
-	impl(const ::std::filesystem::path& path)
-		: chip(open_chip(path))
-	{
-
-	}
-
-	impl(const impl& other) = delete;
-	impl(impl&& other) = delete;
-	impl& operator=(const impl& other) = delete;
-	impl& operator=(impl&& other) = delete;
 
-	void throw_if_closed() const
-	{
-		if (!this->chip)
-			throw chip_closed("GPIO chip has been closed");
-	}
+}
 
-	chip_ptr chip;
-};
+void chip::impl::throw_if_closed() const
+{
+	if (!this->chip)
+		throw chip_closed("GPIO chip has been closed");
+}
 
 GPIOD_CXX_API chip::chip(const ::std::filesystem::path& path)
 	: _m_priv(new impl(path))
@@ -49,6 +39,12 @@ GPIOD_CXX_API chip::chip(const ::std::filesystem::path& path)
 
 }
 
+chip::chip(const chip& other)
+	: _m_priv(other._m_priv)
+{
+
+}
+
 GPIOD_CXX_API chip::chip(chip&& other) noexcept
 	: _m_priv(::std::move(other._m_priv))
 {
@@ -187,21 +183,9 @@ GPIOD_CXX_API int chip::get_line_offset_from_name(const ::std::string& name) con
 	return ret;
 }
 
-GPIOD_CXX_API line_request chip::request_lines(const request_config& req_cfg,
-					       const line_config& line_cfg)
+GPIOD_CXX_API request_builder chip::prepare_request()
 {
-	this->_m_priv->throw_if_closed();
-
-	line_request_ptr request(::gpiod_chip_request_lines(this->_m_priv->chip.get(),
-							    req_cfg._m_priv->config.get(),
-							    line_cfg._m_priv->config.get()));
-	if (!request)
-		throw_from_errno("error requesting GPIO lines");
-
-	line_request ret;
-	ret._m_priv.get()->set_request_ptr(request);
-
-	return ret;
+	return request_builder(*this);
 }
 
 GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const chip& chip)
diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
index 0ece132..ff398f1 100644
--- a/bindings/cxx/edge-event-buffer.cpp
+++ b/bindings/cxx/edge-event-buffer.cpp
@@ -2,6 +2,8 @@
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <iterator>
+#include <ostream>
+#include <utility>
 
 #include "internal.hpp"
 
diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
index 275fe3b..5992934 100644
--- a/bindings/cxx/edge-event.cpp
+++ b/bindings/cxx/edge-event.cpp
@@ -2,6 +2,8 @@
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
+#include <ostream>
+#include <utility>
 
 #include "internal.hpp"
 
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
index 0136f5f..6cf042c 100644
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -20,13 +20,21 @@ int main(int argc, char **argv)
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
-	::gpiod::chip chip(argv[1]);
-	auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ ::gpiod::request_config::property::OFFSETS, offsets },
-				{ ::gpiod::request_config::property::CONSUMER, "gpiogetcxx" }
-			}),
-			::gpiod::line_config());
+	auto request = ::gpiod::chip(argv[1])
+		.prepare_request()
+		.set_request_config(
+			::gpiod::request_config()
+				.set_consumer("gpiogetcxx")
+		)
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					offsets,
+					::gpiod::line_settings()
+						.set_direction(::gpiod::line::direction::INPUT)
+				)
+		)
+		.do_request();
 
 	auto vals = request.get_values();
 
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
index a79138e..e50d2f4 100644
--- a/bindings/cxx/examples/gpiomoncxx.cpp
+++ b/bindings/cxx/examples/gpiomoncxx.cpp
@@ -42,27 +42,22 @@ int main(int argc, char **argv)
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
-	::gpiod::chip chip(argv[1]);
-	auto request = chip.request_lines(
-		::gpiod::request_config(
-			{
-				{ ::gpiod::request_config::property::OFFSETS, offsets},
-				{ ::gpiod::request_config::property::CONSUMER, "gpiomoncxx"},
-			}
-		),
-		::gpiod::line_config(
-			{
-				{
-					::gpiod::line_config::property::DIRECTION,
-					::gpiod::line::direction::INPUT
-				},
-				{
-					::gpiod::line_config::property::EDGE_DETECTION,
-					::gpiod::line::edge::BOTH
-				}
-			}
+	auto request = ::gpiod::chip(argv[1])
+		.prepare_request()
+		.set_request_config(
+			::gpiod::request_config()
+				.set_consumer("gpiomoncxx")
 		)
-	);
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					offsets,
+					::gpiod::line_settings()
+						.set_direction(::gpiod::line::direction::INPUT)
+						.set_edge_detection(::gpiod::line::edge::BOTH)
+				)
+		)
+		.do_request();
 
 	::gpiod::edge_event_buffer buffer;
 
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index 838d801..a81a94f 100644
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -36,18 +36,21 @@ int main(int argc, char **argv)
 						       ::gpiod::line::value::INACTIVE);
 	}
 
-	::gpiod::chip chip(argv[1]);
-	auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ ::gpiod::request_config::property::OFFSETS, offsets },
-				{ ::gpiod::request_config::property::CONSUMER, "gpiogetcxx" }
-			}),
-			::gpiod::line_config({
-				{
-					::gpiod::line_config::property::DIRECTION,
-					::gpiod::line::direction::OUTPUT
-				}
-			}));
+	auto request = ::gpiod::chip(argv[1])
+		.prepare_request()
+		.set_request_config(
+			::gpiod::request_config()
+				.set_consumer("gpiosetcxx")
+		)
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					offsets,
+					::gpiod::line_settings()
+						.set_direction(::gpiod::line::direction::OUTPUT)
+				)
+		)
+		.do_request();
 
 	request.set_values(values);
 
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index c5645b2..8981db4 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -40,6 +40,8 @@
 #include "gpiodcxx/line-config.hpp"
 #include "gpiodcxx/line-info.hpp"
 #include "gpiodcxx/line-request.hpp"
+#include "gpiodcxx/line-settings.hpp"
+#include "gpiodcxx/request-builder.hpp"
 #include "gpiodcxx/request-config.hpp"
 #undef __LIBGPIOD_GPIOD_CXX_INSIDE__
 
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
index 71532e6..e3a3b9b 100644
--- a/bindings/cxx/gpiodcxx/Makefile.am
+++ b/bindings/cxx/gpiodcxx/Makefile.am
@@ -13,6 +13,8 @@ otherinclude_HEADERS = \
 	line-config.hpp \
 	line-info.hpp \
 	line-request.hpp \
+	line-settings.hpp \
 	misc.hpp \
+	request-builder.hpp \
 	request-config.hpp \
 	timestamp.hpp
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
index 5bfcc99..8c2f07a 100644
--- a/bindings/cxx/gpiodcxx/chip.hpp
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -27,6 +27,7 @@ class info_event;
 class line_config;
 class line_info;
 class line_request;
+class request_builder;
 class request_config;
 
 /**
@@ -48,8 +49,6 @@ public:
 	 */
 	explicit chip(const ::std::filesystem::path& path);
 
-	chip(const chip& other) = delete;
-
 	/**
 	 * @brief Move constructor.
 	 * @param other Object to move.
@@ -147,19 +146,20 @@ public:
 	int get_line_offset_from_name(const ::std::string& name) const;
 
 	/**
-	 * @brief Request a set of lines for exclusive usage.
-	 * @param req_cfg Request config object.
-	 * @param line_cfg Line config object.
-	 * @return New line_request object.
+	 * @brief Create a request_builder associated with this chip.
+	 * @return New request_builder object.
 	 */
-	line_request request_lines(const request_config& req_cfg,
-				   const line_config& line_cfg);
+	request_builder prepare_request();
 
 private:
 
 	struct impl;
 
-	::std::unique_ptr<impl> _m_priv;
+	::std::shared_ptr<impl> _m_priv;
+
+	chip(const chip& other);
+
+	friend request_builder;
 };
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
index ac47a99..a917913 100644
--- a/bindings/cxx/gpiodcxx/line-config.hpp
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -12,18 +12,14 @@
 #error "Only gpiod.hpp can be included directly."
 #endif
 
-#include <any>
-#include <chrono>
-#include <cstddef>
-#include <iostream>
 #include <map>
 #include <memory>
-#include <utility>
 
 namespace gpiod {
 
 class chip;
 class line_request;
+class line_settings;
 
 /**
  * @ingroup gpiod_cxx
@@ -38,63 +34,8 @@ class line_config
 {
 public:
 
-	/**
-	 * @brief List of available configuration properties. Used in the
-	 *        constructor, :line_config::set_property_default and
-	 *        :line_config::set_property_override.
-	 */
-	enum class property {
-		DIRECTION = 1,
-		/**< Line direction. */
-		EDGE_DETECTION,
-		/**< Edge detection. */
-		BIAS,
-		/**< Bias. */
-		DRIVE,
-		/**< Drive. */
-		ACTIVE_LOW,
-		/**< Active-low setting. */
-		DEBOUNCE_PERIOD,
-		/**< Debounce period. */
-		EVENT_CLOCK,
-		/**< Event clock. */
-		OUTPUT_VALUE,
-		/**< Output value. */
-		OUTPUT_VALUES,
-		/**< Set of offset-to-value mappings. Only used in the constructor. */
-	};
-
-	/**
-	 * @brief List of configuration properties passed to the constructor.
-	 *        The first member is the property indicator, the second is
-	 *        the value stored as `std::any` that is interpreted by the
-	 *        relevant methods depending on the property value.
-	 */
-	using properties = ::std::map<property, ::std::any>;
-
-	/**
-	 * @brief Stored information about a single configuration override. The
-	 *        first member is the overridden line offset, the second is
-	 *        the property being overridden.
-	 */
-	using prop_override = ::std::pair<line::offset, property>;
-
-	/**
-	 * @brief List of line configuration overrides.
-	 */
-	using override_list = ::std::vector<prop_override>;
 
-	/**
-	 * @brief Constructor.
-	 * @param props List of configuration properties. See
-	 *              :set_property_default for details. Additionally the
-	 *              constructor takes another property type as argument:
-	 *              :property::OUTPUT_VALUES which takes
-	 *              :line::value_mappings as property value. This
-	 *              effectively sets the overrides for output values for
-	 *              the mapped offsets.
-	 */
-	explicit line_config(const properties& props = properties());
+	line_config();
 
 	line_config(const line_config& other) = delete;
 
@@ -106,8 +47,6 @@ public:
 
 	~line_config();
 
-	line_config& operator=(const line_config& other) = delete;
-
 	/**
 	 * @brief Move assignment operator.
 	 * @param other Object to move.
@@ -117,434 +56,44 @@ public:
 
 	/**
 	 * @brief Reset the line config object.
+	 * @return Reference to self.
 	 */
-	void reset() noexcept;
-
-	/**
-	 * @brief Set the default value of a single configuration property.
-	 * @param prop Property to set.
-	 * @param val Property value. The type must correspond with the
-	 *            property being set: :line::direction for
-	 *            :property::DIRECTION, :line::edge for :property::EDGE,
-	 *            :line::bias for :property::BIAS, :line::drive for
-	 *            :property::DRIVE, `bool` for :property::ACTIVE_LOW,
-	 *            `std::chrono:microseconds` for
-	 *            :property::DEBOUNCE_PERIOD, :line::clock for
-	 *            :property::EVENT_CLOCK and :line::value
-	 *            for :property::OUTPUT_VALUE.
-	 *
-	 */
-	void set_property_default(property prop, const ::std::any& val);
-
-	/**
-	 * @brief Set the override value of a single configuration property.
-	 * @param prop Property to set.
-	 * @param offset Line offset to override.
-	 * @param val Property value. See :set_property_default for details.
-	 */
-	void set_property_offset(property prop, line::offset offset, const ::std::any& val);
-
-	/**
-	 * @brief Set the default direction setting.
-	 * @param direction New direction.
-	 */
-	void set_direction_default(line::direction direction);
-
-	/**
-	 * @brief Set the direction for a single line at given offset.
-	 * @param direction New direction.
-	 * @param offset Offset of the line for which to set the direction.
-	 */
-	void set_direction_override(line::direction direction, line::offset offset);
-
-	/**
-	 * @brief Get the default direction setting.
-	 * @return Direction setting that would have been used for any offset
-	 * 	   not assigned its own direction value.
-	 */
-	line::direction direction_default() const;
-
-	/**
-	 * @brief Get the direction setting for a given offset.
-	 * @param offset Line offset for which to read the direction setting.
-	 * @return Direction setting that would have been used for given offset
-	 *         if the config object was used in a request at the time of
-	 *         the call.
-	 */
-	line::direction direction_offset(line::offset offset) const;
-
-	/**
-	 * @brief Clear the direction override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_direction_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the direction setting is overridden at given offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if direction is overridden at this offset, false
-	 *         otherwise.
-	 */
-	bool direction_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set the default edge event detection.
-	 * @param edge Type of edge events to detect.
-	 */
-	void set_edge_detection_default(line::edge edge);
-
-	/**
-	 * @brief Set the edge event detection for a single line at given
-	 *        offset.
-	 * @param edge Type of edge events to detect.
-	 * @param offset Offset of the line for which to set the direction.
-	 */
-	void set_edge_detection_override(line::edge edge, line::offset offset);
-
-	/**
-	 * @brief Get the default edge detection setting.
-	 * @return Edge detection setting that would have been used for any
-	 *         offset not assigned its own direction value.
-	 */
-	line::edge edge_detection_default() const;
-
-	/**
-	 * @brief Get the edge event detection setting for a given offset.
-	 * @param offset Line offset for which to read the edge detection
-	 *               setting.
-	 * @return Edge event detection setting that would have been used for
-	 * 	   given offset if the config object was used in a request at
-	 * 	   the time of the call.
-	 */
-	line::edge edge_detection_offset(line::offset offset) const;
-
-	/**
-	 * @brief Clear the edge detection override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_edge_detection_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the edge detection setting is overridden at given
-	 *        offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if edge detection is overridden at this offset, false
-	 *         otherwise.
-	 */
-	bool edge_detection_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set the default bias setting.
-	 * @param bias New bias.
-	 */
-	void set_bias_default(line::bias bias);
-
-	/**
-	 * @brief Set the bias for a single line at given offset.
-	 * @param bias New bias.
-	 * @param offset Offset of the line for which to set the bias.
-	 */
-	void set_bias_override(line::bias bias, line::offset offset);
-
-	/**
-	 * @brief Get the default bias setting.
-	 * @return Bias setting that would have been used for any offset not
-	 *         assigned its own direction value.
-	 */
-	line::bias bias_default() const;
-
-	/**
-	 * @brief Get the bias setting for a given offset.
-	 * @param offset Line offset for which to read the bias setting.
-	 * @return Bias setting that would have been used for given offset if
-	 *         the config object was used in a request at the time of the
-	 *         call.
-	 */
-	line::bias bias_offset(line::offset offset) const;
-
-	/**
-	 * @brief Clear the bias override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_bias_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the bias setting is overridden at given offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if bias is overridden at this offset, false otherwise.
-	 */
-	bool bias_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set the default drive setting.
-	 * @param drive New drive.
-	 */
-	void set_drive_default(line::drive drive);
-
-	/**
-	 * @brief Set the drive for a single line at given offset.
-	 * @param drive New drive.
-	 * @param offset Offset of the line for which to set the drive.
-	 */
-	void set_drive_override(line::drive drive, line::offset offset);
-
-	/**
-	 * @brief Set the drive for a subset of offsets.
-	 * @param drive New drive.
-	 * @param offsets Vector of line offsets for which to set the drive.
-	 */
-	void set_drive(line::drive drive, const line::offsets& offsets);
-
-	/**
-	 * @brief Get the default drive setting.
-	 * @return Drive setting that would have been used for any offset not
-	 *         assigned its own direction value.
-	 */
-	line::drive drive_default() const;
-
-	/**
-	 * @brief Get the drive setting for a given offset.
-	 * @param offset Line offset for which to read the drive setting.
-	 * @return Drive setting that would have been used for given offset if
-	 *         the config object was used in a request at the time of the
-	 *         call.
-	 */
-	line::drive drive_offset(line::offset offset) const;
-
-	/**
-	 * @brief Clear the drive override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_drive_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the drive setting is overridden at given offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if drive is overridden at this offset, false otherwise.
-	 */
-	bool drive_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set lines to active-low by default.
-	 * @param active_low New active-low setting.
-	 */
-	void set_active_low_default(bool active_low) noexcept;
-
-	/**
-	 * @brief Set a single line as active-low.
-	 * @param active_low New active-low setting.
-	 * @param offset Offset of the line for which to set the active setting.
-	 */
-	void set_active_low_override(bool active_low, line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if active-low is the default setting.
-	 * @return Active-low setting that would have been used for any offset
-         *         not assigned its own value.
-	 */
-	bool active_low_default() const noexcept;
-
-	/**
-	 * @brief Check if the line at given offset was configured as
-	 *        active-low.
-	 * @param offset Line offset for which to read the active-low setting.
-	 * @return Active-low setting that would have been used for given
-	 *         offset if the config object was used in a request at the
-	 *         time of the call.
-	 */
-	bool active_low_offset(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Clear the active-low override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_active_low_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the active-low setting is overridden at given offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if active-low is overridden at this offset, false
-	 *         otherwise.
-	 */
-	bool active_low_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set the default debounce period.
-	 * @param period New debounce period. Disables debouncing if 0.
-	 */
-	void set_debounce_period_default(const ::std::chrono::microseconds& period) noexcept;
-
-	/**
-	 * @brief Set the debounce period for a single line at given offset.
-	 * @param period New debounce period. Disables debouncing if 0.
-	 * @param offset Offset of the line for which to set the debounce
-	 *               period.
-	 */
-	void set_debounce_period_override(const ::std::chrono::microseconds& period,
-					     line::offset offset) noexcept;
-
-	/**
-	 * @brief Get the default debounce period.
-	 * @return Debounce period that would have been used for any offset not
-	 *         assigned its own debounce period. 0 if not debouncing is
-	 *         disabled.
-	 */
-	::std::chrono::microseconds debounce_period_default() const noexcept;
-
-	/**
-	 * @brief Get the debounce period for a given offset.
-	 * @param offset Line offset for which to read the debounce period.
-	 * @return Debounce period that would have been used for given offset
-	 *         if the config object was used in a request at the time of
-	 *         the call. 0 if debouncing is disabled.
-	 */
-	::std::chrono::microseconds debounce_period_offset(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Clear the debounce period override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_debounce_period_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the debounce period setting is overridden at given offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if debounce period is overridden at this offset, false
-	 *         otherwise.
-	 */
-	bool debounce_period_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set the default event timestamp clock.
-	 * @param clock New clock to use.
-	 */
-	void set_event_clock_default(line::clock clock);
-
-	/**
-	 * @brief Set the event clock for a single line at given offset.
-	 * @param clock New clock to use.
-	 * @param offset Offset of the line for which to set the event clock
-	 *               type.
-	 */
-	void set_event_clock_override(line::clock clock, line::offset offset);
-
-	/**
-	 * @brief Get the default event clock setting.
-	 * @return Event clock setting that would have been used for any offset
-	 *         not assigned its own direction value.
-	 */
-	line::clock event_clock_default() const;
-
-	/**
-	 * @brief Get the event clock setting for a given offset.
-	 * @param offset Line offset for which to read the event clock setting.
-	 * @return Event clock setting that would have been used for given
-	 *         offset if the config object was used in a request at the
-	 *         time of the call.
-	 */
-	line::clock event_clock_offset(line::offset offset) const;
-
-	/**
-	 * @brief Clear the event clock override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_event_clock_override(line::offset offset) noexcept;
-
-	/**
-	 * @brief Check if the event clock setting is overridden at given
-	 *        offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if event clock is overridden at this offset, false
-	 *         otherwise.
-	 */
-	bool event_clock_is_overridden(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Set the default output value.
-	 * @param value New value.
-	 */
-	void set_output_value_default(line::value value) noexcept;
-
-	/**
-	 * @brief Set the output value for a single offset.
-	 * @param offset Line offset to associate the value with.
-	 * @param value New value.
-	 */
-	void set_output_value_override(line::value value, line::offset offset) noexcept;
-
-	/**
-	 * @brief Set the output values for a set of line offsets.
-	 * @param values Vector of offset->value mappings.
-	 */
-	void set_output_values(const line::value_mappings& values);
-
-	/**
-	 * @brief Set the output values for a set of line offsets.
-	 * @param offsets Vector of line offsets for which to set output values.
-	 * @param values Vector of new line values with indexes of values
-	 *               corresponding to the indexes of offsets.
-	 */
-	void set_output_values(const line::offsets& offsets, const line::values& values);
-
-	/**
-	 * @brief Get the default output value.
-	 * @return Output value that would have been used for any offset not
-	 *         assigned its own output value.
-	 */
-	line::value output_value_default() const noexcept;
-
-	/**
-	 * @brief Get the output value configured for a given line.
-	 * @param offset Line offset for which to read the value.
-	 * @return Output value that would have been used for given offset if
-	 *         the config object was used in a request at the time of the
-	 *         call.
-	 */
-	line::value output_value_offset(line::offset offset) const noexcept;
-
-	/**
-	 * @brief Clear the output value override at given offset.
-	 * @param offset Offset of the line for which to clear the override.
-	 * @note Does nothing if no override is set for this line.
-	 */
-	void clear_output_value_override(line::offset offset) noexcept;
+	line_config& reset() noexcept;
 
 	/**
-	 * @brief Check if the output value setting is overridden at given
-	 *        offset.
-	 * @param offset Offset of the line for which to check the override.
-	 * @return True if output value is overridden at this offset, false
-	 *         otherwise.
+	 * @brief Add line settings for a single offset.
+	 * @param offset Offset for which to add settings.
+	 * @param settings Line settings to add.
+	 * @return Reference to self.
 	 */
-	bool output_value_is_overridden(line::offset offset) const noexcept;
+	line_config& add_line_settings(line::offset offset, const line_settings& settings);
 
 	/**
-	 * @brief Get the number of configuration overrides.
-	 * @return Number of overrides held by this object.
+	 * @brief Add line settings for a set of offsets.
+	 * @param offsets Offsets for which to add settings.
+	 * @param settings Line settings to add.
+	 * @return Reference to self.
 	 */
-	::std::size_t num_overrides() const noexcept;
+	line_config& add_line_settings(const line::offsets& offsets, const line_settings& settings);
 
 	/**
-	 * @brief Get the list of property overrides.
-	 * @return List of configuration property overrides held by this object.
+	 * @brief Get a mapping of offsets to line settings stored by this
+	 *        object.
+	 * @return Map in which keys represent line offsets and values are
+	 *         the settings corresponding with them.
 	 */
-	override_list overrides() const;
+	::std::map<line::offset, line_settings> get_line_settings() const;
 
 private:
 
 	struct impl;
 
-	::std::unique_ptr<impl> _m_priv;
+	::std::shared_ptr<impl> _m_priv;
+
+	line_config& operator=(const line_config& other);
 
-	friend chip;
 	friend line_request;
+	friend request_builder;
 };
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index be0c71f..659251b 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -53,6 +53,7 @@ public:
 	/**
 	 * @brief Move assignment operator.
 	 * @param other Object to move.
+	 * @return Reference to self.
 	 */
 	line_request& operator=(line_request&& other) noexcept;
 
@@ -130,35 +131,40 @@ public:
 	 * @brief Set the value of a single requested line.
 	 * @param offset Offset of the line to set within the chip.
 	 * @param value New line value.
+	 * @return Reference to self.
 	 */
-	void set_value(line::offset offset, line::value value);
+	line_request& set_value(line::offset offset, line::value value);
 
 	/**
 	 * @brief Set the values of a subset of requested lines.
 	 * @param values Vector containing a set of offset->value mappings.
+	 * @return Reference to self.
 	 */
-	void set_values(const line::value_mappings& values);
+	line_request& set_values(const line::value_mappings& values);
 
 	/**
 	 * @brief Set the values of a subset of requested lines.
 	 * @param offsets Vector containing the offsets of lines to set.
 	 * @param values Vector containing new values with indexes
 	 *               corresponding with those in the offsets vector.
+	 * @return Reference to self.
 	 */
-	void set_values(const line::offsets& offsets, const line::values& values);
+	line_request& set_values(const line::offsets& offsets, const line::values& values);
 
 	/**
 	 * @brief Set the values of all requested lines.
 	 * @param values Array of new line values. The size must be equal to
 	 *               the value returned by line_request::num_lines.
+	 * @return Reference to self.
 	 */
-	void set_values(const line::values& values);
+	line_request& set_values(const line::values& values);
 
 	/**
 	 * @brief Apply new config options to requested lines.
 	 * @param config New configuration.
+	 * @return Reference to self.
 	 */
-	void reconfigure_lines(const line_config& config);
+	line_request& reconfigure_lines(const line_config& config);
 
 	/**
 	 * @brief Get the file descriptor number associated with this line
@@ -201,7 +207,7 @@ private:
 
 	::std::unique_ptr<impl> _m_priv;
 
-	friend chip;
+	friend request_builder;
 };
 
 /**
diff --git a/bindings/cxx/gpiodcxx/line-settings.hpp b/bindings/cxx/gpiodcxx/line-settings.hpp
new file mode 100644
index 0000000..c1477b1
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-settings.hpp
@@ -0,0 +1,193 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file request-config.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_SETTINGS_HPP__
+#define __LIBGPIOD_CXX_LINE_SETTINGS_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <memory>
+
+#include "line.hpp"
+
+namespace gpiod {
+
+class line_config;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores GPIO line settings.
+ */
+class line_settings
+{
+public:
+
+	/**
+	 * @brief Initializes the line_settings object with default values.
+	 */
+	line_settings();
+
+	line_settings(const line_settings& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_settings(line_settings&& other) noexcept;
+
+	~line_settings();
+
+	line_settings& operator=(const line_settings& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	line_settings& operator=(line_settings&& other);
+
+	/**
+	 * @brief Reset the line settings to default values.
+	 * @return Reference to self.
+	 */
+	line_settings& reset(void) noexcept;
+
+	/**
+	 * @brief Set direction.
+	 * @param direction New direction.
+	 * @return Reference to self.
+	 */
+	line_settings& set_direction(line::direction direction);
+
+	/**
+	 * @brief Get direction.
+	 * @return Current direction setting.
+	 */
+	line::direction direction() const;
+
+	/**
+	 * @brief Set edge detection.
+	 * @param edge New edge detection setting.
+	 * @return Reference to self.
+	 */
+	line_settings& set_edge_detection(line::edge edge);
+
+	/**
+	 * @brief Get edge detection.
+	 * @return Current edge detection setting.
+	 */
+	line::edge edge_detection() const;
+
+	/**
+	 * @brief Set bias setting.
+	 * @param bias New bias.
+	 * @return Reference to self.
+	 */
+	line_settings& set_bias(line::bias bias);
+
+	/**
+	 * @brief Get bias setting.
+	 * @return Current bias.
+	 */
+	line::bias bias() const;
+
+	/**
+	 * @brief Set drive setting.
+	 * @param drive New drive.
+	 * @return Reference to self.
+	 */
+	line_settings& set_drive(line::drive drive);
+
+	/**
+	 * @brief Get drive setting.
+	 * @return Current drive.
+	 */
+	line::drive drive() const;
+
+	/**
+	 * @brief Set the active-low setting.
+	 * @param active_low New active-low setting.
+	 * @return Reference to self.
+	 */
+	line_settings& set_active_low(bool active_low);
+
+	/**
+	 * @brief Get the active-low setting.
+	 * @return Current active-low setting.
+	 */
+	bool active_low() const noexcept;
+
+	/**
+	 * @brief Set debounce period.
+	 * @param period New debounce period in microseconds.
+	 * @return Reference to self.
+	 */
+	line_settings& set_debounce_period(const ::std::chrono::microseconds& period);
+
+	/**
+	 * @brief Get debounce period.
+	 * @return Current debounce period.
+	 */
+	::std::chrono::microseconds debounce_period() const noexcept;
+
+	/**
+	 * @brief Set the event clock to use for edge event timestamps.
+	 * @param event_clock Clock to use.
+	 * @return Reference to self.
+	 */
+	line_settings& set_event_clock(line::clock event_clock);
+
+	/**
+	 * @brief Get the event clock used for edge event timestamps.
+	 * @return Current event clock type.
+	 */
+	line::clock event_clock() const;
+
+	/**
+	 * @brief Set the output value.
+	 * @param value New output value.
+	 * @return Reference to self.
+	 */
+	line_settings& set_output_value(line::value value);
+
+	/**
+	 * @brief Get the output value.
+	 * @return Current output value.
+	 */
+	line::value output_value() const;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend line_config;
+};
+
+/**
+ * @brief Stream insertion operator for line settings.
+ * @param out Output stream to write to.
+ * @param settings Line settings object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_settings& settings);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_SETTINGS_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-builder.hpp b/bindings/cxx/gpiodcxx/request-builder.hpp
new file mode 100644
index 0000000..fbb7515
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/request-builder.hpp
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file request-builder.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_REQUEST_BUILDER_HPP__
+#define __LIBGPIOD_CXX_REQUEST_BUILDER_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <memory>
+
+namespace gpiod {
+
+class chip;
+class line_config;
+class line_request;
+class request_config;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Intermediate object storing the configuration for a line request.
+ */
+class request_builder
+{
+public:
+
+	request_builder(const request_builder& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to be moved.
+	 */
+	request_builder(request_builder&& other) noexcept;
+
+	~request_builder();
+
+	request_builder& operator=(const request_builder& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to be moved.
+	 * @return Reference to self.
+	 */
+	request_builder& operator=(request_builder&& other) noexcept;
+
+	/**
+	 * @brief Set the request config for the request.
+	 * @param req_cfg Request config to use.
+	 * @return Reference to self.
+	 */
+	request_builder& set_request_config(request_config& req_cfg);
+
+	/**
+	 * @brief Set the line config for the request.
+	 * @param line_cfg Line config to use.
+	 * @return Reference to self.
+	 */
+	request_builder& set_line_config(line_config &line_cfg);
+
+	/**
+	 * @brief Make the line request.
+	 * @return New line_request object.
+	 */
+	line_request do_request();
+
+private:
+
+	struct impl;
+
+	request_builder(chip& chip);
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_REQUEST_BUILDER_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
index b77d7db..70d179e 100644
--- a/bindings/cxx/gpiodcxx/request-config.hpp
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
-/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
  * @file request-config.hpp
@@ -12,10 +12,8 @@
 #error "Only gpiod.hpp can be included directly."
 #endif
 
-#include <any>
 #include <cstddef>
 #include <iostream>
-#include <map>
 #include <memory>
 #include <string>
 
@@ -38,30 +36,10 @@ class request_config
 {
 public:
 
-	/**
-	 * @brief List of available configuration settings. Used in the
-	 *        constructor and :request_config::set_property.
-	 */
-	enum class property {
-		OFFSETS = 1,
-		/**< List of line offsets to request. */
-		CONSUMER,
-		/**< Consumer string. */
-		EVENT_BUFFER_SIZE,
-		/**< Suggested size of the edge event buffer. */
-	};
-
-	/**
-	 * @brief Map of mappings between property types and property values.
-	 */
-	using properties = ::std::map<property, ::std::any>;
-
 	/**
 	 * @brief Constructor.
-	 * @param props List of config properties. See
-	 *              :request_config::set_property.
 	 */
-	explicit request_config(const properties& props = properties());
+	request_config();
 
 	request_config(const request_config& other) = delete;
 
@@ -73,8 +51,6 @@ public:
 
 	~request_config();
 
-	request_config& operator=(const request_config& other) = delete;
-
 	/**
 	 * @brief Move assignment operator.
 	 * @param other Object to move.
@@ -82,34 +58,12 @@ public:
 	 */
 	request_config& operator=(request_config&& other) noexcept;
 
-	/**
-	 * @brief Set the value of a single config property.
-	 * @param prop Property to set.
-	 * @param val Property value. The type must correspond to the property
-	 *            being set: `std::string` or `const char*` for
-	 *            :property::CONSUMER, `:line::offsets` for
-	 *            :property::OFFSETS and `unsigned long` for
-	 *            :property::EVENT_BUFFER_SIZE.
-	 */
-	void set_property(property prop, const ::std::any& val);
-
-	/**
-	 * @brief Set line offsets for this request.
-	 * @param offsets Vector of line offsets to request.
-	 */
-	void set_offsets(const line::offsets& offsets) noexcept;
-
-	/**
-	 * @brief Get the number of offsets configured in this request config.
-	 * @return Number of line offsets in this request config.
-	 */
-	::std::size_t num_offsets() const noexcept;
-
 	/**
 	 * @brief Set the consumer name.
 	 * @param consumer New consumer name.
+	 * @return Reference to self.
 	 */
-	void set_consumer(const ::std::string& consumer) noexcept;
+	request_config& set_consumer(const ::std::string& consumer) noexcept;
 
 	/**
 	 * @brief Get the consumer name.
@@ -117,19 +71,14 @@ public:
 	 */
 	::std::string consumer() const noexcept;
 
-	/**
-	 * @brief Get the hardware offsets of lines in this request config.
-	 * @return List of line offsets.
-	 */
-	line::offsets offsets() const;
-
 	/**
 	 * @brief Set the size of the kernel event buffer.
 	 * @param event_buffer_size New event buffer size.
+	 * @return Reference to self.
 	 * @note The kernel may adjust the value if it's too high. If set to 0,
 	 *       the default value will be used.
 	 */
-	void set_event_buffer_size(::std::size_t event_buffer_size) noexcept;
+	request_config& set_event_buffer_size(::std::size_t event_buffer_size) noexcept;
 
 	/**
 	 * @brief Get the edge event buffer size from this request config.
@@ -141,9 +90,11 @@ private:
 
 	struct impl;
 
-	::std::unique_ptr<impl> _m_priv;
+	::std::shared_ptr<impl> _m_priv;
+
+	request_config& operator=(const request_config& other);
 
-	friend chip;
+	friend request_builder;
 };
 
 /**
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
index 8e99f9c..d9e14a3 100644
--- a/bindings/cxx/info-event.cpp
+++ b/bindings/cxx/info-event.cpp
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
+#include <ostream>
 
 #include "internal.hpp"
 
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index 8b3c2f8..0703474 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -5,8 +5,7 @@
 #define __LIBGPIOD_CXX_INTERNAL_HPP__
 
 #include <gpiod.h>
-#include <iostream>
-#include <iterator>
+#include <map>
 #include <memory>
 #include <string>
 #include <utility>
@@ -25,6 +24,7 @@ map_int_to_enum(int value, const ::std::map<int, enum_type>& mapping)
 	try {
 		return mapping.at(value);
 	} catch (const ::std::out_of_range& err) {
+		/* FIXME Demangle the name. */
 		throw bad_mapping(::std::string("invalid value for ") +
 				  typeid(enum_type).name());
 	}
@@ -40,9 +40,11 @@ template<class T, void F(T*)> struct deleter
 	}
 };
 
+using chip_deleter = deleter<::gpiod_chip, ::gpiod_chip_close>;
 using chip_info_deleter = deleter<::gpiod_chip_info, ::gpiod_chip_info_free>;
 using line_info_deleter = deleter<::gpiod_line_info, ::gpiod_line_info_free>;
 using info_event_deleter = deleter<::gpiod_info_event, ::gpiod_info_event_free>;
+using line_settings_deleter = deleter<::gpiod_line_settings, ::gpiod_line_settings_free>;
 using line_config_deleter = deleter<::gpiod_line_config, ::gpiod_line_config_free>;
 using request_config_deleter = deleter<::gpiod_request_config, ::gpiod_request_config_free>;
 using line_request_deleter = deleter<::gpiod_line_request, ::gpiod_line_request_release>;
@@ -50,9 +52,11 @@ using edge_event_deleter = deleter<::gpiod_edge_event, ::gpiod_edge_event_free>;
 using edge_event_buffer_deleter = deleter<::gpiod_edge_event_buffer,
 					  ::gpiod_edge_event_buffer_free>;
 
+using chip_ptr = ::std::unique_ptr<::gpiod_chip, chip_deleter>;
 using chip_info_ptr = ::std::unique_ptr<::gpiod_chip_info, chip_info_deleter>;
 using line_info_ptr = ::std::unique_ptr<::gpiod_line_info, line_info_deleter>;
 using info_event_ptr = ::std::unique_ptr<::gpiod_info_event, info_event_deleter>;
+using line_settings_ptr = ::std::unique_ptr<::gpiod_line_settings, line_settings_deleter>;
 using line_config_ptr = ::std::unique_ptr<::gpiod_line_config, line_config_deleter>;
 using request_config_ptr = ::std::unique_ptr<::gpiod_request_config, request_config_deleter>;
 using line_request_ptr = ::std::unique_ptr<::gpiod_line_request, line_request_deleter>;
@@ -60,6 +64,19 @@ using edge_event_ptr = ::std::unique_ptr<::gpiod_edge_event, edge_event_deleter>
 using edge_event_buffer_ptr = ::std::unique_ptr<::gpiod_edge_event_buffer,
 						edge_event_buffer_deleter>;
 
+struct chip::impl
+{
+	impl(const ::std::filesystem::path& path);
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	void throw_if_closed() const;
+
+	chip_ptr chip;
+};
+
 struct chip_info::impl
 {
 	impl() = default;
@@ -100,6 +117,17 @@ struct info_event::impl
 	line_info info;
 };
 
+struct line_settings::impl
+{
+	impl();
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	line_settings_ptr settings;
+};
+
 struct line_config::impl
 {
 	impl();
diff --git a/bindings/cxx/line-config.cpp b/bindings/cxx/line-config.cpp
index 442b2b3..f7f1bfa 100644
--- a/bindings/cxx/line-config.cpp
+++ b/bindings/cxx/line-config.cpp
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <cstdlib>
 #include <iterator>
-#include <map>
+#include <ostream>
 #include <sstream>
+#include <utility>
+#include <vector>
 
 #include "internal.hpp"
 
@@ -11,73 +14,6 @@ namespace gpiod {
 
 namespace {
 
-template<class enum_type>
-::std::map<int, enum_type> make_reverse_maping(const ::std::map<enum_type, int>& mapping)
-{
-	::std::map<int, enum_type> ret;
-
-	for (const auto &item: mapping)
-		ret[item.second] = item.first;
-
-	return ret;
-}
-
-const ::std::map<line::direction, int> direction_mapping = {
-	{ line::direction::AS_IS,	GPIOD_LINE_DIRECTION_AS_IS },
-	{ line::direction::INPUT,	GPIOD_LINE_DIRECTION_INPUT },
-	{ line::direction::OUTPUT,	GPIOD_LINE_DIRECTION_OUTPUT }
-};
-
-const ::std::map<int, line::direction> reverse_direction_mapping = make_reverse_maping(direction_mapping);
-
-const ::std::map<line::edge, int> edge_mapping = {
-	{ line::edge::NONE,		GPIOD_LINE_EDGE_NONE },
-	{ line::edge::FALLING,		GPIOD_LINE_EDGE_FALLING },
-	{ line::edge::RISING,		GPIOD_LINE_EDGE_RISING },
-	{ line::edge::BOTH,		GPIOD_LINE_EDGE_BOTH }
-};
-
-const ::std::map<int, line::edge> reverse_edge_mapping = make_reverse_maping(edge_mapping);
-
-const ::std::map<line::bias, int> bias_mapping = {
-	{ line::bias::AS_IS,		GPIOD_LINE_BIAS_AS_IS },
-	{ line::bias::DISABLED,		GPIOD_LINE_BIAS_DISABLED },
-	{ line::bias::PULL_UP,		GPIOD_LINE_BIAS_PULL_UP },
-	{ line::bias::PULL_DOWN,	GPIOD_LINE_BIAS_PULL_DOWN }
-};
-
-const ::std::map<int, line::bias> reverse_bias_mapping = make_reverse_maping(bias_mapping);
-
-const ::std::map<line::drive, int> drive_mapping = {
-	{ line::drive::PUSH_PULL,	GPIOD_LINE_DRIVE_PUSH_PULL },
-	{ line::drive::OPEN_DRAIN,	GPIOD_LINE_DRIVE_OPEN_DRAIN },
-	{ line::drive::OPEN_SOURCE,	GPIOD_LINE_DRIVE_OPEN_SOURCE }
-};
-
-const ::std::map<int, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
-
-const ::std::map<line::clock, int> clock_mapping = {
-	{ line::clock::MONOTONIC,	GPIOD_LINE_EVENT_CLOCK_MONOTONIC },
-	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME },
-};
-
-const ::std::map<int, line::clock> reverse_clock_mapping = make_reverse_maping(clock_mapping);
-
-template<class key_type, class value_type, class exception_type>
-value_type map_setting(const key_type& key, const ::std::map<key_type, value_type>& mapping)
-{
-	value_type ret;
-
-	try {
-		ret = mapping.at(key);
-	} catch (const ::std::out_of_range& err) {
-		throw exception_type(::std::string("invalid value for ") +
-				     typeid(key_type).name());
-	}
-
-	return ret;
-}
-
 ::gpiod_line_config* make_line_config()
 {
 	::gpiod_line_config *config = ::gpiod_line_config_new();
@@ -87,57 +23,12 @@ value_type map_setting(const key_type& key, const ::std::map<key_type, value_typ
 	return config;
 }
 
-template<class enum_type>
-int do_map_value(enum_type value, const ::std::map<enum_type, int>& mapping)
+struct malloc_deleter
 {
-	return map_setting<enum_type, int, ::std::invalid_argument>(value, mapping);
-}
-
-template<class enum_type, void set_func(::gpiod_line_config*, int)>
-void set_mapped_value_default(::gpiod_line_config* config, enum_type value,
-			      const ::std::map<enum_type, int>& mapping)
-{
-	int mapped_val = do_map_value(value, mapping);
-
-	set_func(config, mapped_val);
-}
-
-template<class enum_type, void set_func(::gpiod_line_config*, int, unsigned int)>
-void set_mapped_value_override(::gpiod_line_config* config, enum_type value, line::offset offset,
-			       const ::std::map<enum_type, int>& mapping)
-{
-	int mapped_val = do_map_value(value, mapping);
-
-	set_func(config, mapped_val, offset);
-}
-
-template<class ret_type, int get_func(::gpiod_line_config*)>
-ret_type get_mapped_value_default(::gpiod_line_config* config,
-				  const ::std::map<int, ret_type>& mapping)
-{
-	int mapped_val = get_func(config);
-
-	return map_int_to_enum(mapped_val, mapping);
-}
-
-template<class ret_type, int get_func(::gpiod_line_config*, unsigned int)>
-ret_type get_mapped_value_offset(::gpiod_line_config* config, line::offset offset,
-				 const ::std::map<int, ret_type>& mapping)
-{
-	int mapped_val = get_func(config, offset);
-
-	return map_int_to_enum(mapped_val, mapping);
-}
-
-const ::std::map<int, line_config::property> property_mapping = {
-	{ GPIOD_LINE_CONFIG_PROP_DIRECTION,		line_config::property::DIRECTION },
-	{ GPIOD_LINE_CONFIG_PROP_EDGE_DETECTION,	line_config::property::EDGE_DETECTION },
-	{ GPIOD_LINE_CONFIG_PROP_BIAS,			line_config::property::BIAS },
-	{ GPIOD_LINE_CONFIG_PROP_DRIVE,			line_config::property::DRIVE },
-	{ GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW,		line_config::property::ACTIVE_LOW },
-	{ GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US,	line_config::property::DEBOUNCE_PERIOD },
-	{ GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK,		line_config::property::EVENT_CLOCK },
-	{ GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE,		line_config::property::OUTPUT_VALUE }
+	void operator()(void* ptr)
+	{
+		::free(ptr);
+	}
 };
 
 } /* namespace */
@@ -148,15 +39,10 @@ line_config::impl::impl()
 
 }
 
-GPIOD_CXX_API line_config::line_config(const properties& props)
+GPIOD_CXX_API line_config::line_config()
 	: _m_priv(new impl)
 {
-	for (const auto& prop: props) {
-		if (prop.first == property::OUTPUT_VALUES)
-			this->set_output_values(::std::any_cast<line::value_mappings>(prop.second));
-		else
-			this->set_property_default(prop.first, prop.second);
-	}
+
 }
 
 GPIOD_CXX_API line_config::line_config(line_config&& other) noexcept
@@ -170,9 +56,11 @@ GPIOD_CXX_API line_config::~line_config()
 
 }
 
-GPIOD_CXX_API void line_config::reset() noexcept
+line_config& line_config::operator=(const line_config& other)
 {
-	::gpiod_line_config_reset(this->_m_priv->config.get());
+	this->_m_priv = other._m_priv;
+
+	return *this;
 }
 
 GPIOD_CXX_API line_config& line_config::operator=(line_config&& other) noexcept
@@ -182,502 +70,93 @@ GPIOD_CXX_API line_config& line_config::operator=(line_config&& other) noexcept
 	return *this;
 }
 
-GPIOD_CXX_API void line_config::set_property_default(property prop, const ::std::any& val)
-{
-	switch(prop) {
-	case property::DIRECTION:
-		this->set_direction_default(::std::any_cast<line::direction>(val));
-		break;
-	case property::EDGE_DETECTION:
-		this->set_edge_detection_default(::std::any_cast<line::edge>(val));
-		break;
-	case property::BIAS:
-		this->set_bias_default(::std::any_cast<line::bias>(val));
-		break;
-	case property::DRIVE:
-		this->set_drive_default(::std::any_cast<line::drive>(val));
-		break;
-	case property::ACTIVE_LOW:
-		this->set_active_low_default(::std::any_cast<bool>(val));
-		break;
-	case property::DEBOUNCE_PERIOD:
-		this->set_debounce_period_default(::std::any_cast<::std::chrono::microseconds>(val));
-		break;
-	case property::EVENT_CLOCK:
-		this->set_event_clock_default(::std::any_cast<line::clock>(val));
-		break;
-	case property::OUTPUT_VALUE:
-		this->set_output_value_default(::std::any_cast<line::value>(val));
-		break;
-	default:
-		throw ::std::invalid_argument("invalid property type");
-	}
-}
-
-GPIOD_CXX_API void line_config::set_property_offset(property prop, line::offset offset,
-						    const ::std::any& val)
-{
-	switch(prop) {
-	case property::DIRECTION:
-		this->set_direction_override(::std::any_cast<line::direction>(val), offset);
-		break;
-	case property::EDGE_DETECTION:
-		this->set_edge_detection_override(::std::any_cast<line::edge>(val), offset);
-		break;
-	case property::BIAS:
-		this->set_bias_override(::std::any_cast<line::bias>(val), offset);
-		break;
-	case property::DRIVE:
-		this->set_drive_override(::std::any_cast<line::drive>(val), offset);
-		break;
-	case property::ACTIVE_LOW:
-		this->set_active_low_override(::std::any_cast<bool>(val), offset);
-		break;
-	case property::DEBOUNCE_PERIOD:
-		this->set_debounce_period_override(::std::any_cast<::std::chrono::microseconds>(val),
-						      offset);
-		break;
-	case property::EVENT_CLOCK:
-		this->set_event_clock_override(::std::any_cast<line::clock>(val), offset);
-		break;
-	case property::OUTPUT_VALUE:
-		this->set_output_value_override(::std::any_cast<line::value>(val), offset);
-		break;
-	default:
-		throw ::std::invalid_argument("invalid property type");
-	}
-}
-
-GPIOD_CXX_API void line_config::set_direction_default(line::direction direction)
-{
-	set_mapped_value_default<line::direction,
-				 ::gpiod_line_config_set_direction_default>(this->_m_priv->config.get(),
-									    direction, direction_mapping);
-}
-
-GPIOD_CXX_API void line_config::set_direction_override(line::direction direction, line::offset offset)
-{
-	set_mapped_value_override<line::direction,
-				  ::gpiod_line_config_set_direction_override>(this->_m_priv->config.get(),
-									      direction, offset,
-									      direction_mapping);
-}
-
-GPIOD_CXX_API line::direction line_config::direction_default() const
-{
-	return get_mapped_value_default<line::direction,
-					::gpiod_line_config_get_direction_default>(
-							this->_m_priv->config.get(),
-							reverse_direction_mapping);
-}
-
-GPIOD_CXX_API line::direction line_config::direction_offset(line::offset offset) const
-{
-	return get_mapped_value_offset<line::direction,
-				       ::gpiod_line_config_get_direction_offset>(
-						       this->_m_priv->config.get(),
-						       offset, reverse_direction_mapping);
-}
-
-GPIOD_CXX_API void line_config::clear_direction_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_direction_override(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API bool line_config::direction_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_direction_is_overridden(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API void line_config::set_edge_detection_default(line::edge edge)
-{
-	set_mapped_value_default<line::edge,
-				 ::gpiod_line_config_set_edge_detection_default>(
-						 this->_m_priv->config.get(),
-						 edge, edge_mapping);
-}
-
-GPIOD_CXX_API void line_config::set_edge_detection_override(line::edge edge, line::offset offset)
-{
-	set_mapped_value_override<line::edge,
-				  ::gpiod_line_config_set_edge_detection_override>(
-						this->_m_priv->config.get(),
-						edge, offset, edge_mapping);
-}
-
-GPIOD_CXX_API line::edge line_config::edge_detection_default() const
-{
-	return get_mapped_value_default<line::edge,
-					::gpiod_line_config_get_edge_detection_default>(
-							this->_m_priv->config.get(),
-							reverse_edge_mapping);
-}
-
-GPIOD_CXX_API line::edge line_config::edge_detection_offset(line::offset offset) const
-{
-	return get_mapped_value_offset<line::edge,
-				       ::gpiod_line_config_get_edge_detection_offset>(
-						       this->_m_priv->config.get(),
-						       offset, reverse_edge_mapping);
-}
-
-GPIOD_CXX_API void line_config::clear_edge_detection_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_edge_detection_override(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API bool line_config::edge_detection_is_overridden(line::offset offset) const noexcept
+GPIOD_CXX_API line_config& line_config::reset() noexcept
 {
-	return ::gpiod_line_config_edge_detection_is_overridden(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API void line_config::set_bias_default(line::bias bias)
-{
-	set_mapped_value_default<line::bias,
-				 ::gpiod_line_config_set_bias_default>(this->_m_priv->config.get(),
-								       bias, bias_mapping);
-}
-
-GPIOD_CXX_API void line_config::set_bias_override(line::bias bias, line::offset offset)
-{
-	set_mapped_value_override<line::bias,
-				 ::gpiod_line_config_set_bias_override>(this->_m_priv->config.get(),
-									bias, offset, bias_mapping);
-}
-
-GPIOD_CXX_API line::bias line_config::bias_default() const
-{
-	return get_mapped_value_default<line::bias,
-					::gpiod_line_config_get_bias_default>(this->_m_priv->config.get(),
-									      reverse_bias_mapping);
-}
-
-GPIOD_CXX_API line::bias line_config::bias_offset(line::offset offset) const
-{
-	return get_mapped_value_offset<line::bias,
-				       ::gpiod_line_config_get_bias_offset>(this->_m_priv->config.get(),
-									    offset, reverse_bias_mapping);
-}
-
-GPIOD_CXX_API void line_config::clear_bias_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_bias_override(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API bool line_config::bias_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_bias_is_overridden(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API void line_config::set_drive_default(line::drive drive)
-{
-	set_mapped_value_default<line::drive,
-				 ::gpiod_line_config_set_drive_default>(this->_m_priv->config.get(),
-									drive, drive_mapping);
-}
-
-GPIOD_CXX_API void line_config::set_drive_override(line::drive drive, line::offset offset)
-{
-	set_mapped_value_override<line::drive,
-				  ::gpiod_line_config_set_drive_override>(this->_m_priv->config.get(),
-									  drive, offset, drive_mapping);
-}
-
-GPIOD_CXX_API line::drive line_config::drive_default() const
-{
-	return get_mapped_value_default<line::drive,
-					::gpiod_line_config_get_drive_default>(this->_m_priv->config.get(),
-									       reverse_drive_mapping);
-}
-
-GPIOD_CXX_API line::drive line_config::drive_offset(line::offset offset) const
-{
-	return get_mapped_value_offset<line::drive,
-				       ::gpiod_line_config_get_drive_offset>(this->_m_priv->config.get(),
-									     offset, reverse_drive_mapping);
-}
-
-GPIOD_CXX_API void line_config::clear_drive_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_drive_override(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API bool line_config::drive_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_drive_is_overridden(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API void line_config::set_active_low_default(bool active_low) noexcept
-{
-	::gpiod_line_config_set_active_low_default(this->_m_priv->config.get(), active_low);
-}
-
-GPIOD_CXX_API void line_config::set_active_low_override(bool active_low, line::offset offset) noexcept
-{
-	::gpiod_line_config_set_active_low_override(this->_m_priv->config.get(), active_low, offset);
-}
+	::gpiod_line_config_reset(this->_m_priv->config.get());
 
-GPIOD_CXX_API bool line_config::active_low_default() const noexcept
-{
-	return ::gpiod_line_config_get_active_low_default(this->_m_priv->config.get());
+	return *this;
 }
 
-GPIOD_CXX_API bool line_config::active_low_offset(line::offset offset) const noexcept
+GPIOD_CXX_API line_config& line_config::add_line_settings(line::offset offset,
+							  const line_settings& settings)
 {
-	return ::gpiod_line_config_get_active_low_offset(this->_m_priv->config.get(), offset);
+	return this->add_line_settings(line::offsets({offset}), settings);
 }
 
-GPIOD_CXX_API void line_config::clear_active_low_override(line::offset offset) noexcept
+GPIOD_CXX_API line_config& line_config::add_line_settings(const line::offsets& offsets,
+							  const line_settings& settings)
 {
-	::gpiod_line_config_clear_active_low_override(this->_m_priv->config.get(), offset);
-}
+	::std::vector<unsigned int> raw_offsets(offsets.size());
 
-GPIOD_CXX_API bool line_config::active_low_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_active_low_is_overridden(this->_m_priv->config.get(), offset);
-}
+	for (unsigned int i = 0; i < offsets.size(); i++)
+		raw_offsets[i] = offsets[i];
 
-GPIOD_CXX_API void
-line_config::set_debounce_period_default(const ::std::chrono::microseconds& period) noexcept
-{
-	::gpiod_line_config_set_debounce_period_us_default(this->_m_priv->config.get(), period.count());
-}
+	auto ret = ::gpiod_line_config_add_line_settings(this->_m_priv->config.get(),
+							 raw_offsets.data(), raw_offsets.size(),
+							 settings._m_priv->settings.get());
+	if (ret)
+		throw_from_errno("unable to add line settings");
 
-GPIOD_CXX_API void
-line_config::set_debounce_period_override(const ::std::chrono::microseconds& period,
-					     line::offset offset) noexcept
-{
-	::gpiod_line_config_set_debounce_period_us_override(this->_m_priv->config.get(),
-							    period.count(), offset);
+	return *this;
 }
 
-GPIOD_CXX_API ::std::chrono::microseconds line_config::debounce_period_default() const noexcept
+GPIOD_CXX_API ::std::map<line::offset, line_settings> line_config::get_line_settings() const
 {
-	return ::std::chrono::microseconds(
-			::gpiod_line_config_get_debounce_period_us_default(this->_m_priv->config.get()));
-}
+	::std::map<line::offset, line_settings> settings_map;
+	::std::size_t num_offsets;
+	unsigned int *offsets_ptr;
+	int ret;
 
-GPIOD_CXX_API ::std::chrono::microseconds
-line_config::debounce_period_offset(line::offset offset) const noexcept
-{
-	return ::std::chrono::microseconds(
-			::gpiod_line_config_get_debounce_period_us_offset(this->_m_priv->config.get(),
-									  offset));
-}
+	ret = ::gpiod_line_config_get_offsets(this->_m_priv->config.get(),
+					      &num_offsets, &offsets_ptr);
+	if (ret)
+		throw_from_errno("unable to retrieve line offsets");
 
-GPIOD_CXX_API void line_config::clear_debounce_period_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_debounce_period_us_override(this->_m_priv->config.get(), offset);
-}
+	if (num_offsets == 0)
+		return settings_map;
 
-GPIOD_CXX_API bool line_config::debounce_period_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_debounce_period_us_is_overridden(this->_m_priv->config.get(), offset);
-}
+	::std::unique_ptr<unsigned int, malloc_deleter> offsets(offsets_ptr);
 
-GPIOD_CXX_API void line_config::set_event_clock_default(line::clock clock)
-{
-	set_mapped_value_default<line::clock,
-				 ::gpiod_line_config_set_event_clock_default>(this->_m_priv->config.get(),
-									      clock, clock_mapping);
-}
+	for (size_t i = 0; i < num_offsets; i++) {
+		line_settings settings;
 
-GPIOD_CXX_API void line_config::set_event_clock_override(line::clock clock, line::offset offset)
-{
-	set_mapped_value_override<line::clock,
-				  ::gpiod_line_config_set_event_clock_override>(this->_m_priv->config.get(),
-										clock, offset,
-										clock_mapping);
-}
-
-GPIOD_CXX_API line::clock line_config::event_clock_default() const
-{
-	return get_mapped_value_default<line::clock,
-					::gpiod_line_config_get_event_clock_default>(
+		settings._m_priv->settings.reset(::gpiod_line_config_get_line_settings(
 							this->_m_priv->config.get(),
-							reverse_clock_mapping);
-}
-
-GPIOD_CXX_API line::clock line_config::event_clock_offset(line::offset offset) const
-{
-	return get_mapped_value_offset<line::clock,
-					::gpiod_line_config_get_event_clock_offset>(
-							this->_m_priv->config.get(),
-							offset, reverse_clock_mapping);
-}
-
-GPIOD_CXX_API void line_config::clear_event_clock_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_event_clock_override(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API bool line_config::event_clock_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_event_clock_is_overridden(this->_m_priv->config.get(), offset);
-}
+							offsets.get()[i]));
+		if (!settings._m_priv->settings)
+			throw_from_errno("unable to retrieve line settings");
 
-GPIOD_CXX_API void line_config::set_output_value_default(line::value value) noexcept
-{
-	::gpiod_line_config_set_output_value_default(this->_m_priv->config.get(), static_cast<int>(value));
-}
-
-GPIOD_CXX_API void line_config::set_output_value_override(line::value value, line::offset offset) noexcept
-{
-	::gpiod_line_config_set_output_value_override(this->_m_priv->config.get(),
-						      static_cast<int>(value), offset);
-}
-
-GPIOD_CXX_API void line_config::set_output_values(const line::value_mappings& values)
-{
-	line::offsets offsets;
-	line::values vals;
-
-	if (values.empty())
-		return;
-
-	offsets.reserve(values.size());
-	vals.reserve(values.size());
-
-	for (auto& val: values) {
-		offsets.push_back(val.first);
-		vals.push_back(val.second);
+		settings_map[offsets.get()[i]] = ::std::move(settings);
 	}
 
-	this->set_output_values(offsets, vals);
+	return settings_map;
 }
 
-GPIOD_CXX_API void line_config::set_output_values(const line::offsets& offsets,
-						  const line::values& values)
+GPIOD_CXX_API ::std::ostream&
+operator<<(::std::ostream& out, const line_config& config)
 {
-	if (offsets.size() != values.size())
-		throw ::std::invalid_argument("values must have the same size as the offsets");
-
-	if (offsets.empty())
-		return;
+	auto settings_map = config.get_line_settings();
+	::std::vector<::std::string> vec;
 
-	::std::vector<unsigned int> buf(offsets.size());
+	out << "gpiod::line_config(num_settings=" << settings_map.size();
 
-	for (unsigned int i = 0; i < offsets.size(); i++)
-		buf[i] = offsets[i];
-
-	::gpiod_line_config_set_output_values(this->_m_priv->config.get(),
-					      offsets.size(), buf.data(),
-					      reinterpret_cast<const int*>(values.data()));
-}
-
-GPIOD_CXX_API line::value line_config::output_value_default() const noexcept
-{
-	return static_cast<line::value>(::gpiod_line_config_get_output_value_default(
-								this->_m_priv->config.get()));
-}
-
-GPIOD_CXX_API line::value line_config::output_value_offset(line::offset offset) const noexcept
-{
-	return static_cast<line::value>(
-			::gpiod_line_config_get_output_value_offset(this->_m_priv->config.get(),
-								    offset));
-}
-
-GPIOD_CXX_API void line_config::clear_output_value_override(line::offset offset) noexcept
-{
-	::gpiod_line_config_clear_output_value_override(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API bool line_config::output_value_is_overridden(line::offset offset) const noexcept
-{
-	return ::gpiod_line_config_output_value_is_overridden(this->_m_priv->config.get(), offset);
-}
-
-GPIOD_CXX_API ::std::size_t line_config::num_overrides() const noexcept
-{
-	return ::gpiod_line_config_get_num_overrides(this->_m_priv->config.get());
-}
-
-GPIOD_CXX_API line_config::override_list line_config::overrides() const
-{
-	unsigned int num_overrides = this->num_overrides();
-	override_list ret(num_overrides);
-	::std::vector<unsigned int> offsets(num_overrides);
-	::std::vector<int> props(num_overrides);
-
-	::gpiod_line_config_get_overrides(this->_m_priv->config.get(), offsets.data(), props.data());
-
-	for (unsigned int i = 0; i < num_overrides; i++)
-		ret[i] = { offsets[i], property_mapping.at(props[i]) };
+	if (settings_map.size() == 0) {
+		out << ")";
+		return out;
+	}
 
-	return ret;
-}
+	for (const auto& [offset, settings]: settings_map) {
+		::std::stringstream str;
 
-GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_config& config)
-{
-	out << "gpiod::line_config(defaults=(direction=" << config.direction_default() <<
-	       ", edge_detection=" << config.edge_detection_default() <<
-	       ", bias=" << config.bias_default() <<
-	       ", drive=" << config.drive_default() << ", " <<
-	       (config.active_low_default() ? "active-low" : "active-high") <<
-	       ", debounce_period=" << config.debounce_period_default().count() << "us" <<
-	       ", event_clock=" << config.event_clock_default() <<
-	       ", default_output_value=" << config.output_value_default() <<
-	       "), ";
-
-	if (config.num_overrides()) {
-		::std::vector<::std::string> overrides(config.num_overrides());
-		::std::vector<::std::string>::iterator it = overrides.begin();
-
-		out << "overrides=[";
-
-		for (const auto& override: config.overrides()) {
-			line::offset offset = override.first;
-			line_config::property prop = override.second;
-			::std::stringstream out;
-
-			out << "(offset=" << offset << " -> ";
-
-			switch (prop) {
-			case line_config::property::DIRECTION:
-				out << "direction=" << config.direction_offset(offset);
-				break;
-			case line_config::property::EDGE_DETECTION:
-				out << "edge_detection=" << config.edge_detection_offset(offset);
-				break;
-			case line_config::property::BIAS:
-				out << "bias=" << config.bias_offset(offset);
-				break;
-			case line_config::property::DRIVE:
-				out << "drive=" << config.drive_offset(offset);
-				break;
-			case line_config::property::ACTIVE_LOW:
-				out << (config.active_low_offset(offset) ? "active-low" : "active-high");
-				break;
-			case line_config::property::DEBOUNCE_PERIOD:
-				out << "debounce_period=" <<
-				       config.debounce_period_offset(offset).count() << "us";
-				break;
-			case line_config::property::EVENT_CLOCK:
-				out << "event_clock=" << config.event_clock_offset(offset);
-				break;
-			case line_config::property::OUTPUT_VALUE:
-				out << "output_value=" << config.output_value_offset(offset);
-				break;
-			default:
-				/* OUTPUT_VALUES is ignored. */
-				break;
-			}
-
-			out << ")";
-
-			*it = out.str();
-			it++;
-		}
-
-		::std::copy(overrides.begin(), ::std::prev(overrides.end()),
-			    ::std::ostream_iterator<::std::string>(out, ", "));
-		out << overrides.back();
-
-		out << "]";
+		str << offset << ": " << settings;
+		vec.push_back(str.str());
 	}
 
-	out << ")";
+	out << ", settings=[";
+	::std::copy(vec.begin(), ::std::prev(vec.end()),
+		    ::std::ostream_iterator<::std::string>(out, ", "));
+	out << vec.back();
+	out << "])";
 
 	return out;
 }
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
index 66f3242..2ad0baf 100644
--- a/bindings/cxx/line-info.cpp
+++ b/bindings/cxx/line-info.cpp
@@ -2,7 +2,8 @@
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <map>
-#include <iostream>
+#include <ostream>
+#include <utility>
 
 #include "internal.hpp"
 
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index 58777f3..bde34e8 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <iterator>
+#include <ostream>
 #include <utility>
 
 #include "internal.hpp"
@@ -126,12 +127,13 @@ GPIOD_CXX_API void line_request::get_values(line::values& values)
 	this->get_values(this->offsets(), values);
 }
 
-GPIOD_CXX_API void line_request::line_request::set_value(line::offset offset, line::value value)
+GPIOD_CXX_API line_request&
+line_request::line_request::set_value(line::offset offset, line::value value)
 {
-	this->set_values({ offset }, { value });
+	return this->set_values({ offset }, { value });
 }
 
-GPIOD_CXX_API void
+GPIOD_CXX_API line_request&
 line_request::set_values(const line::value_mappings& values)
 {
 	line::offsets offsets(values.size());
@@ -142,10 +144,10 @@ line_request::set_values(const line::value_mappings& values)
 		vals[i] = values[i].second;
 	}
 
-	this->set_values(offsets, vals);
+	return this->set_values(offsets, vals);
 }
 
-GPIOD_CXX_API void line_request::set_values(const line::offsets& offsets,
+GPIOD_CXX_API line_request& line_request::set_values(const line::offsets& offsets,
 					    const line::values& values)
 {
 	this->_m_priv->throw_if_released();
@@ -160,14 +162,16 @@ GPIOD_CXX_API void line_request::set_values(const line::offsets& offsets,
 							 reinterpret_cast<const int*>(values.data()));
 	if (ret)
 		throw_from_errno("unable to set line values");
+
+	return *this;
 }
 
-GPIOD_CXX_API void line_request::set_values(const line::values& values)
+GPIOD_CXX_API line_request& line_request::set_values(const line::values& values)
 {
-	this->set_values(this->offsets(), values);
+	return this->set_values(this->offsets(), values);
 }
 
-GPIOD_CXX_API void line_request::reconfigure_lines(const line_config& config)
+GPIOD_CXX_API line_request& line_request::reconfigure_lines(const line_config& config)
 {
 	this->_m_priv->throw_if_released();
 
@@ -175,6 +179,8 @@ GPIOD_CXX_API void line_request::reconfigure_lines(const line_config& config)
 							 config._m_priv->config.get());
 	if (ret)
 		throw_from_errno("unable to reconfigure GPIO lines");
+
+	return *this;
 }
 
 GPIOD_CXX_API int line_request::fd() const
diff --git a/bindings/cxx/line-settings.cpp b/bindings/cxx/line-settings.cpp
new file mode 100644
index 0000000..dbbe30e
--- /dev/null
+++ b/bindings/cxx/line-settings.cpp
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <ostream>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+template<class enum_type>
+::std::map<int, enum_type> make_reverse_maping(const ::std::map<enum_type, int>& mapping)
+{
+	::std::map<int, enum_type> ret;
+
+	for (const auto &item: mapping)
+		ret[item.second] = item.first;
+
+	return ret;
+}
+
+const ::std::map<line::direction, int> direction_mapping = {
+	{ line::direction::AS_IS,	GPIOD_LINE_DIRECTION_AS_IS },
+	{ line::direction::INPUT,	GPIOD_LINE_DIRECTION_INPUT },
+	{ line::direction::OUTPUT,	GPIOD_LINE_DIRECTION_OUTPUT }
+};
+
+const ::std::map<int, line::direction> reverse_direction_mapping = make_reverse_maping(direction_mapping);
+
+const ::std::map<line::edge, int> edge_mapping = {
+	{ line::edge::NONE,		GPIOD_LINE_EDGE_NONE },
+	{ line::edge::FALLING,		GPIOD_LINE_EDGE_FALLING },
+	{ line::edge::RISING,		GPIOD_LINE_EDGE_RISING },
+	{ line::edge::BOTH,		GPIOD_LINE_EDGE_BOTH }
+};
+
+const ::std::map<int, line::edge> reverse_edge_mapping = make_reverse_maping(edge_mapping);
+
+const ::std::map<line::bias, int> bias_mapping = {
+	{ line::bias::AS_IS,		GPIOD_LINE_BIAS_AS_IS },
+	{ line::bias::DISABLED,		GPIOD_LINE_BIAS_DISABLED },
+	{ line::bias::PULL_UP,		GPIOD_LINE_BIAS_PULL_UP },
+	{ line::bias::PULL_DOWN,	GPIOD_LINE_BIAS_PULL_DOWN }
+};
+
+const ::std::map<int, line::bias> reverse_bias_mapping = make_reverse_maping(bias_mapping);
+
+const ::std::map<line::drive, int> drive_mapping = {
+	{ line::drive::PUSH_PULL,	GPIOD_LINE_DRIVE_PUSH_PULL },
+	{ line::drive::OPEN_DRAIN,	GPIOD_LINE_DRIVE_OPEN_DRAIN },
+	{ line::drive::OPEN_SOURCE,	GPIOD_LINE_DRIVE_OPEN_SOURCE }
+};
+
+const ::std::map<int, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
+
+const ::std::map<line::clock, int> clock_mapping = {
+	{ line::clock::MONOTONIC,	GPIOD_LINE_EVENT_CLOCK_MONOTONIC },
+	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME }
+};
+
+const ::std::map<int, line::clock> reverse_clock_mapping = make_reverse_maping(clock_mapping);
+
+const ::std::map<line::value, int> value_mapping = {
+	{ line::value::INACTIVE,	GPIOD_LINE_VALUE_INACTIVE },
+	{ line::value::ACTIVE,		GPIOD_LINE_VALUE_ACTIVE }
+};
+
+const ::std::map<int, line::value> reverse_value_mapping = make_reverse_maping(value_mapping);
+
+line_settings_ptr make_line_settings()
+{
+	line_settings_ptr settings(::gpiod_line_settings_new());
+	if (!settings)
+		throw_from_errno("Unable to allocate the line settings object");
+
+	return settings;
+}
+
+template<class key_type, class value_type, class exception_type>
+value_type map_setting(const key_type& key, const ::std::map<key_type, value_type>& mapping)
+{
+	value_type ret;
+
+	try {
+		ret = mapping.at(key);
+	} catch (const ::std::out_of_range& err) {
+		/* FIXME Demangle the name. */
+		throw exception_type(::std::string("invalid value for ") +
+				     typeid(key_type).name());
+	}
+
+	return ret;
+}
+
+template<class enum_type>
+int do_map_value(enum_type value, const ::std::map<enum_type, int>& mapping)
+{
+	return map_setting<enum_type, int, ::std::invalid_argument>(value, mapping);
+}
+
+template<class enum_type, int set_func(::gpiod_line_settings*, int)>
+void set_mapped_value(::gpiod_line_settings* settings, enum_type value,
+		      const ::std::map<enum_type, int>& mapping)
+{
+	auto mapped_val = do_map_value(value, mapping);
+
+	auto ret = set_func(settings, mapped_val);
+	if (ret)
+		throw_from_errno("unable to set property");
+}
+
+template<class ret_type, int get_func(::gpiod_line_settings*)>
+ret_type get_mapped_value(::gpiod_line_settings* settings,
+			  const ::std::map<int, ret_type>& mapping)
+{
+	int mapped_val = get_func(settings);
+
+	return map_int_to_enum(mapped_val, mapping);
+}
+
+} /* namespace */
+
+line_settings::impl::impl()
+	: settings(make_line_settings())
+{
+
+}
+
+GPIOD_CXX_API line_settings::line_settings()
+	: _m_priv(new impl)
+{
+
+}
+
+GPIOD_CXX_API line_settings::line_settings(line_settings&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API line_settings::~line_settings()
+{
+
+}
+
+GPIOD_CXX_API line_settings& line_settings::operator=(line_settings&& other)
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API line_settings& line_settings::reset(void) noexcept
+{
+	::gpiod_line_settings_reset(this->_m_priv->settings.get());
+
+	return *this;
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_direction(line::direction direction)
+{
+	set_mapped_value<line::direction,
+			 ::gpiod_line_settings_set_direction>(this->_m_priv->settings.get(),
+							      direction, direction_mapping);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::direction line_settings::direction() const
+{
+	return get_mapped_value<line::direction,
+				::gpiod_line_settings_get_direction>(
+							this->_m_priv->settings.get(),
+							reverse_direction_mapping);
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_edge_detection(line::edge edge)
+{
+	set_mapped_value<line::edge,
+			 ::gpiod_line_settings_set_edge_detection>(this->_m_priv->settings.get(),
+								   edge, edge_mapping);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::edge line_settings::edge_detection() const
+{
+	return get_mapped_value<line::edge,
+				::gpiod_line_settings_get_edge_detection>(
+							this->_m_priv->settings.get(),
+							reverse_edge_mapping);
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_bias(line::bias bias)
+{
+	set_mapped_value<line::bias,
+			 ::gpiod_line_settings_set_bias>(this->_m_priv->settings.get(),
+							 bias, bias_mapping);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::bias line_settings::bias() const
+{
+	return get_mapped_value<line::bias,
+				::gpiod_line_settings_get_bias>(this->_m_priv->settings.get(),
+								reverse_bias_mapping);
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_drive(line::drive drive)
+{
+	set_mapped_value<line::drive,
+			 ::gpiod_line_settings_set_drive>(this->_m_priv->settings.get(),
+							  drive, drive_mapping);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::drive line_settings::drive() const
+{
+	return get_mapped_value<line::drive,
+				::gpiod_line_settings_get_drive>(this->_m_priv->settings.get(),
+								 reverse_drive_mapping);
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_active_low(bool active_low)
+{
+	::gpiod_line_settings_set_active_low(this->_m_priv->settings.get(), active_low);
+
+	return *this;
+}
+
+GPIOD_CXX_API bool line_settings::active_low() const noexcept
+{
+	return ::gpiod_line_settings_get_active_low(this->_m_priv->settings.get());
+}
+
+GPIOD_CXX_API line_settings&
+line_settings::set_debounce_period(const ::std::chrono::microseconds& period)
+{
+	::gpiod_line_settings_set_debounce_period_us(this->_m_priv->settings.get(), period.count());
+
+	return *this;
+}
+
+GPIOD_CXX_API ::std::chrono::microseconds line_settings::debounce_period() const noexcept
+{
+	return ::std::chrono::microseconds(
+			::gpiod_line_settings_get_debounce_period_us(this->_m_priv->settings.get()));
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_event_clock(line::clock event_clock)
+{
+	set_mapped_value<line::clock,
+			 ::gpiod_line_settings_set_event_clock>(this->_m_priv->settings.get(),
+								event_clock, clock_mapping);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::clock line_settings::event_clock() const
+{
+	return get_mapped_value<line::clock,
+				::gpiod_line_settings_get_event_clock>(
+							this->_m_priv->settings.get(),
+							reverse_clock_mapping);
+}
+
+GPIOD_CXX_API line_settings& line_settings::set_output_value(line::value value)
+{
+	set_mapped_value<line::value,
+			 ::gpiod_line_settings_set_output_value>(this->_m_priv->settings.get(),
+								 value, value_mapping);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::value line_settings::output_value() const
+{
+	return get_mapped_value<line::value,
+				::gpiod_line_settings_get_output_value>(
+							this->_m_priv->settings.get(),
+							reverse_value_mapping);
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_settings& settings)
+{
+	out << "gpiod::line_settings(direction=" << settings.direction() <<
+	       ", edge_detection=" << settings.edge_detection() <<
+	       ", bias=" << settings.bias() <<
+	       ", drive=" << settings.drive() <<
+	       ", " << (settings.active_low() ? "active-low" : "active-high") <<
+	       ", debounce_period=" << settings.debounce_period().count() <<
+	       ", event_clock=" << settings.event_clock() <<
+	       ", output_value=" << settings.output_value() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index fc20c62..a9caedd 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <iterator>
+#include <ostream>
+
 #include "internal.hpp"
 
 namespace gpiod {
diff --git a/bindings/cxx/request-builder.cpp b/bindings/cxx/request-builder.cpp
new file mode 100644
index 0000000..d38ed21
--- /dev/null
+++ b/bindings/cxx/request-builder.cpp
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+struct request_builder::impl
+{
+	impl(chip& parent)
+		: line_cfg(),
+		  req_cfg(),
+		  parent(parent)
+	{
+
+	}
+
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	line_config line_cfg;
+	request_config req_cfg;
+	chip parent;
+};
+
+GPIOD_CXX_API request_builder::request_builder(chip& chip)
+	: _m_priv(new impl(chip))
+{
+
+}
+
+GPIOD_CXX_API request_builder::request_builder(request_builder&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API request_builder::~request_builder()
+{
+
+}
+
+GPIOD_CXX_API request_builder& request_builder::operator=(request_builder&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API request_builder& request_builder::set_request_config(request_config& req_cfg)
+{
+	this->_m_priv->req_cfg = req_cfg;
+
+	return *this;
+}
+
+GPIOD_CXX_API request_builder& request_builder::set_line_config(line_config &line_cfg)
+{
+	this->_m_priv->line_cfg = line_cfg;
+
+	return *this;
+}
+
+GPIOD_CXX_API line_request request_builder::do_request()
+{
+	line_request_ptr request(::gpiod_chip_request_lines(
+					this->_m_priv->parent._m_priv->chip.get(),
+					this->_m_priv->req_cfg._m_priv->config.get(),
+					this->_m_priv->line_cfg._m_priv->config.get()));
+	if (!request)
+		throw_from_errno("error requesting GPIO lines");
+
+	line_request ret;
+	ret._m_priv.get()->set_request_ptr(request);
+
+	return ret;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/request-config.cpp b/bindings/cxx/request-config.cpp
index 9173238..e578b15 100644
--- a/bindings/cxx/request-config.cpp
+++ b/bindings/cxx/request-config.cpp
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
 // SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
 
+#include <ostream>
 #include <utility>
 
 #include "internal.hpp"
@@ -9,11 +10,6 @@ namespace gpiod {
 
 namespace {
 
-GPIOD_CXX_NORETURN void throw_bad_value_type()
-{
-	throw ::std::invalid_argument("bad value type for property");
-}
-
 request_config_ptr make_request_config()
 {
 	request_config_ptr config(::gpiod_request_config_new());
@@ -23,31 +19,6 @@ request_config_ptr make_request_config()
 	return config;
 }
 
-::std::string get_string_from_value(const ::std::any& val)
-{
-	if (val.type() == typeid(::std::string))
-		return ::std::any_cast<::std::string>(val);
-	else if (val.type() == typeid(const char*))
-		return ::std::any_cast<const char*>(val);
-
-	throw_bad_value_type();
-}
-
-unsigned int get_unsigned_int_from_value(const ::std::any& val)
-{
-	if (val.type() == typeid(unsigned int)) {
-		return ::std::any_cast<unsigned int>(val);
-	} else if (val.type() == typeid(int)) {
-		int bufsize = ::std::any_cast<int>(val);
-		if (bufsize < 0)
-			bufsize = 0;
-
-		return static_cast<unsigned int>(bufsize);
-	}
-
-	throw_bad_value_type();
-}
-
 } /* namespace */
 
 request_config::impl::impl()
@@ -56,11 +27,10 @@ request_config::impl::impl()
 
 }
 
-GPIOD_CXX_API request_config::request_config(const properties& props)
+GPIOD_CXX_API request_config::request_config()
 	: _m_priv(new impl)
 {
-	for (const auto& prop: props)
-		this->set_property(prop.first, prop.second);
+
 }
 
 GPIOD_CXX_API request_config::request_config(request_config&& other) noexcept
@@ -74,54 +44,26 @@ GPIOD_CXX_API request_config::~request_config()
 
 }
 
-GPIOD_CXX_API request_config& request_config::operator=(request_config&& other) noexcept
+request_config& request_config::operator=(const request_config& other)
 {
-	this->_m_priv = ::std::move(other._m_priv);
+	this->_m_priv = other._m_priv;
 
 	return *this;
 }
 
-GPIOD_CXX_API void request_config::set_property(property prop, const ::std::any& val)
-{
-	switch (prop) {
-	case property::OFFSETS:
-		try {
-			this->set_offsets(::std::any_cast<line::offsets>(val));
-		} catch (const ::std::bad_any_cast& ex) {
-			throw_bad_value_type();
-		}
-		break;
-	case property::CONSUMER:
-		this->set_consumer(get_string_from_value(val));
-		break;
-	case property::EVENT_BUFFER_SIZE:
-		this->set_event_buffer_size(get_unsigned_int_from_value(val));
-		break;
-	default:
-		throw ::std::invalid_argument("unknown property");
-	}
-}
-
-GPIOD_CXX_API void request_config::set_offsets(const line::offsets& offsets) noexcept
+GPIOD_CXX_API request_config& request_config::operator=(request_config&& other) noexcept
 {
-	::std::vector<unsigned int> buf(offsets.size());
-
-	for (unsigned int i = 0; i < offsets.size(); i++)
-		buf[i] = offsets[i];
-
-	::gpiod_request_config_set_offsets(this->_m_priv->config.get(),
-					   buf.size(), buf.data());
-}
+	this->_m_priv = ::std::move(other._m_priv);
 
-GPIOD_CXX_API ::std::size_t request_config::num_offsets() const noexcept
-{
-	return ::gpiod_request_config_get_num_offsets(this->_m_priv->config.get());
+	return *this;
 }
 
-GPIOD_CXX_API void
+GPIOD_CXX_API request_config&
 request_config::set_consumer(const ::std::string& consumer) noexcept
 {
 	::gpiod_request_config_set_consumer(this->_m_priv->config.get(), consumer.c_str());
+
+	return *this;
 }
 
 GPIOD_CXX_API ::std::string request_config::consumer() const noexcept
@@ -131,24 +73,13 @@ GPIOD_CXX_API ::std::string request_config::consumer() const noexcept
 	return consumer ?: "";
 }
 
-GPIOD_CXX_API line::offsets request_config::offsets() const
-{
-	line::offsets ret(this->num_offsets());
-	::std::vector<unsigned int> buf(this->num_offsets());
-
-	::gpiod_request_config_get_offsets(this->_m_priv->config.get(), buf.data());
-
-	for (unsigned int i = 0; i < this->num_offsets(); i++)
-		ret[i] = buf[i];
-
-	return ret;
-}
-
-GPIOD_CXX_API void
+GPIOD_CXX_API request_config&
 request_config::set_event_buffer_size(::std::size_t event_buffer_size) noexcept
 {
 	::gpiod_request_config_set_event_buffer_size(this->_m_priv->config.get(),
 						     event_buffer_size);
+
+	return *this;
 }
 
 GPIOD_CXX_API ::std::size_t request_config::event_buffer_size() const noexcept
@@ -163,8 +94,6 @@ GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const request_conf
 	consumer = config.consumer().empty() ? "N/A" : ::std::string("'") + config.consumer() + "'";
 
 	out << "gpiod::request_config(consumer=" << consumer <<
-	       ", num_offsets=" << config.num_offsets() <<
-	       ", offsets=(" << config.offsets() << ")" <<
 	       ", event_buffer_size=" << config.event_buffer_size() <<
 	       ")";
 
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index d40c069..4971dd4 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -22,10 +22,11 @@ gpiod_cxx_test_SOURCES =			\
 		tests-chip.cpp			\
 		tests-chip-info.cpp		\
 		tests-edge-event.cpp		\
+		tests-info-event.cpp		\
 		tests-line.cpp			\
 		tests-line-config.cpp		\
 		tests-line-info.cpp		\
 		tests-line-request.cpp		\
-		tests-info-event.cpp		\
+		tests-line-settings.cpp		\
 		tests-misc.cpp			\
-		tests-request-config.cpp
+		tests-request-config.cpp
\ No newline at end of file
diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
index 2cf9252..2f3f65b 100644
--- a/bindings/cxx/tests/tests-edge-event.cpp
+++ b/bindings/cxx/tests/tests-edge-event.cpp
@@ -12,8 +12,6 @@
 #include "helpers.hpp"
 
 using simprop = ::gpiosim::chip::property;
-using reqprop = ::gpiod::request_config::property;
-using lineprop = ::gpiod::line_config::property;
 using direction = ::gpiod::line::direction;
 using edge = ::gpiod::line::edge;
 using offsets = ::gpiod::line::offsets;
@@ -45,14 +43,16 @@ TEST_CASE("edge_event wait timeout", "[edge-event]")
 	::gpiosim::chip sim;
 	::gpiod::chip chip(sim.dev_path());
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 0 })}
-		}),
-		::gpiod::line_config({
-			{ lineprop::EDGE_DETECTION, edge::BOTH }
-		})
-	);
+	auto request = chip.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					0,
+					::gpiod::line_settings()
+						.set_edge_detection(edge::BOTH)
+				)
+		)
+		.do_request();
 
 	REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
 }
@@ -60,18 +60,20 @@ TEST_CASE("edge_event wait timeout", "[edge-event]")
 TEST_CASE("output mode and edge detection don't work together", "[edge-event]")
 {
 	::gpiosim::chip sim;
-	::gpiod::chip chip(sim.dev_path());
 
 	REQUIRE_THROWS_AS(
-		chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 0 })}
-			}),
-			::gpiod::line_config({
-				{ lineprop::DIRECTION, direction::OUTPUT },
-				{ lineprop::EDGE_DETECTION, edge::BOTH }
-			})
-		),
+		::gpiod::chip(sim.dev_path())
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						0,
+						::gpiod::line_settings()
+							.set_direction(direction::OUTPUT)
+							.set_edge_detection(edge::BOTH)
+					)
+			)
+			.do_request(),
 		::std::invalid_argument
 	);
 }
@@ -101,14 +103,17 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 	SECTION("both edge events")
 	{
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 2 })}
-			}),
-			::gpiod::line_config({
-				{ lineprop::EDGE_DETECTION, edge::BOTH }
-			})
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						2,
+						::gpiod::line_settings()
+							.set_edge_detection(edge::BOTH)
+					)
+			)
+			.do_request();
 
 		::std::uint64_t ts_rising, ts_falling;
 
@@ -139,14 +144,17 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 	SECTION("rising edge event")
 	{
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 6 })}
-			}),
-			::gpiod::line_config({
-				{ lineprop::EDGE_DETECTION, edge::RISING }
-			})
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						6,
+						::gpiod::line_settings()
+							.set_edge_detection(edge::RISING)
+					)
+			)
+			.do_request();
 
 		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 6);
 
@@ -164,14 +172,17 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 	SECTION("falling edge event")
 	{
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 7 })}
-			}),
-			::gpiod::line_config({
-				{ lineprop::EDGE_DETECTION, edge::FALLING }
-			})
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						7,
+						::gpiod::line_settings()
+							.set_edge_detection(edge::FALLING)
+					)
+			)
+			.do_request();
 
 		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 7);
 
@@ -189,14 +200,17 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 	SECTION("sequence numbers")
 	{
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 0, 1 })}
-			}),
-			::gpiod::line_config({
-				{ lineprop::EDGE_DETECTION, edge::BOTH }
-			})
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						{ 0, 1 },
+						::gpiod::line_settings()
+							.set_edge_detection(edge::BOTH)
+					)
+			)
+			.do_request();
 
 		::std::thread thread(trigger_rising_edge_events_on_two_offsets, ::std::ref(sim), 0, 1);
 
@@ -227,14 +241,17 @@ TEST_CASE("reading multiple events", "[edge-event]")
 	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
 	::gpiod::chip chip(sim.dev_path());
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 1 })}
-		}),
-		::gpiod::line_config({
-			{ lineprop::EDGE_DETECTION, edge::BOTH }
-		})
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					1,
+					::gpiod::line_settings()
+						.set_edge_detection(edge::BOTH)
+				)
+		)
+		.do_request();
 
 	unsigned long line_seqno = 1, global_seqno = 1;
 
@@ -277,14 +294,17 @@ TEST_CASE("edge_event_buffer can be moved", "[edge-event]")
 	::gpiod::edge_event_buffer buffer(13);
 
 	/* Get some events into the buffer. */
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 1 })}
-		}),
-		::gpiod::line_config({
-			{ lineprop::EDGE_DETECTION, edge::BOTH }
-		})
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					1,
+					::gpiod::line_settings()
+						.set_edge_detection(edge::BOTH)
+				)
+		)
+		.do_request();
 
 	sim.set_pull(1, pull::PULL_UP);
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
@@ -321,14 +341,17 @@ TEST_CASE("edge_event can be copied and moved", "[edge-event]")
 	::gpiod::chip chip(sim.dev_path());
 	::gpiod::edge_event_buffer buffer;
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 0 })}
-		}),
-		::gpiod::line_config({
-			{ lineprop::EDGE_DETECTION, edge::BOTH }
-		})
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					0,
+					::gpiod::line_settings()
+						.set_edge_detection(edge::BOTH)
+				)
+		)
+		.do_request();
 
 	sim.set_pull(0, pull::PULL_UP);
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
@@ -387,14 +410,17 @@ TEST_CASE("stream insertion operators work for edge_event and edge_event_buffer"
 	::gpiod::edge_event_buffer buffer;
 	::std::stringstream sbuf, expected;
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 0 })}
-		}),
-		::gpiod::line_config({
-			{ lineprop::EDGE_DETECTION, edge::BOTH }
-		})
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					0,
+					::gpiod::line_settings()
+						.set_edge_detection(edge::BOTH)
+				)
+		)
+		.do_request();
 
 	sim.set_pull(0, pull::PULL_UP);
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
index b838d5c..5b9a6de 100644
--- a/bindings/cxx/tests/tests-info-event.cpp
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -12,8 +12,6 @@
 #include "helpers.hpp"
 
 using simprop = ::gpiosim::chip::property;
-using reqprop = ::gpiod::request_config::property;
-using lineprop = ::gpiod::line_config::property;
 using direction = ::gpiod::line::direction;
 using event_type = ::gpiod::info_event::event_type;
 
@@ -23,19 +21,23 @@ void request_reconfigure_release_line(::gpiod::chip& chip)
 {
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 7 }) }
-		}),
-		::gpiod::line_config()
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(7, ::gpiod::line_settings())
+		)
+		.do_request();
 
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
 
 	request.reconfigure_lines(
-		::gpiod::line_config({
-			{ lineprop::DIRECTION, direction::OUTPUT }
-		})
+		::gpiod::line_config()
+			.add_line_settings(
+				7,
+				::gpiod::line_settings()
+					.set_direction(direction::OUTPUT)
+			)
 	);
 
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
@@ -109,12 +111,13 @@ TEST_CASE("info_event can be copied and moved", "[info-event]")
 
 	chip.watch_line_info(0);
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 0 }) }
-		}),
-		::gpiod::line_config()
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(0, ::gpiod::line_settings())
+		)
+		.do_request();
 
 	REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
 	auto event = chip.read_info_event();
@@ -176,12 +179,13 @@ TEST_CASE("info_event stream insertion operator works", "[info-event][line-info]
 
 	chip.watch_line_info(0);
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 0 }) }
-		}),
-		::gpiod::line_config()
-	);
+	auto request = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(0, ::gpiod::line_settings())
+		)
+		.do_request();
 
 	auto event = chip.read_info_event();
 
diff --git a/bindings/cxx/tests/tests-line-config.cpp b/bindings/cxx/tests/tests-line-config.cpp
index e1dcd6e..5fa0f94 100644
--- a/bindings/cxx/tests/tests-line-config.cpp
+++ b/bindings/cxx/tests/tests-line-config.cpp
@@ -3,21 +3,13 @@
 
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
-#include <sstream>
 
 #include "helpers.hpp"
 
-using lineprop = ::gpiod::line_config::property;
-using value = ::gpiod::line::value;
+using namespace ::std::chrono_literals;
 using direction = ::gpiod::line::direction;
-using edge = ::gpiod::line::edge;
-using bias = ::gpiod::line::bias;
 using drive = ::gpiod::line::drive;
-using clock_type = ::gpiod::line::clock;
-using mappings = ::gpiod::line::value_mappings;
-using offsets = ::gpiod::line::offsets;
-
-using namespace ::std::chrono_literals;
+using edge = ::gpiod::line::edge;
 
 namespace {
 
@@ -27,244 +19,86 @@ TEST_CASE("line_config constructor works", "[line-config]")
 	{
 		::gpiod::line_config cfg;
 
-		REQUIRE_NOTHROW(cfg.direction_default() == direction::INPUT);
-		REQUIRE(cfg.edge_detection_default() == edge::NONE);
-		REQUIRE(cfg.bias_default() == bias::AS_IS);
-		REQUIRE(cfg.drive_default() == drive::PUSH_PULL);
-		REQUIRE_FALSE(cfg.active_low_default());
-		REQUIRE(cfg.debounce_period_default() == 0us);
-		REQUIRE(cfg.event_clock_default() == clock_type::MONOTONIC);
-		REQUIRE(cfg.output_value_default() == value::INACTIVE);
-		REQUIRE(cfg.num_overrides() == 0);
-		REQUIRE(cfg.overrides().empty());
-	}
-
-	SECTION("default values set from constructor")
-	{
-		/*
-		 * These are wrong and the request would fail but we're just
-		 * testing the object's behavior.
-		 */
-		::gpiod::line_config cfg({
-			{ lineprop::DIRECTION, direction::OUTPUT },
-			{ lineprop::EDGE_DETECTION, edge::FALLING },
-			{ lineprop::BIAS, bias::DISABLED },
-			{ lineprop::DRIVE, drive::OPEN_DRAIN },
-			{ lineprop::ACTIVE_LOW, true },
-			{ lineprop::DEBOUNCE_PERIOD, 3000us },
-			{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
-			{ lineprop::OUTPUT_VALUE, value::ACTIVE }
-		});
-
-		REQUIRE_NOTHROW(cfg.direction_default() == direction::OUTPUT);
-		REQUIRE(cfg.edge_detection_default() == edge::FALLING);
-		REQUIRE(cfg.bias_default() == bias::DISABLED);
-		REQUIRE(cfg.drive_default() == drive::OPEN_DRAIN);
-		REQUIRE(cfg.active_low_default());
-		/* Test implicit conversion between duration types. */
-		REQUIRE(cfg.debounce_period_default() == 3ms);
-		REQUIRE(cfg.event_clock_default() == clock_type::REALTIME);
-		REQUIRE(cfg.output_value_default() == value::ACTIVE);
-		REQUIRE(cfg.num_overrides() == 0);
-		REQUIRE(cfg.overrides().empty());
-	}
-
-	SECTION("output value overrides can be set from constructor")
-	{
-		::gpiod::line_config cfg({
-			{
-				lineprop::OUTPUT_VALUES, mappings({
-					{ 0, value::ACTIVE },
-					{ 3, value::INACTIVE },
-					{ 1, value::ACTIVE }
-				})
-			}
-		});
-
-		REQUIRE(cfg.num_overrides() == 3);
-		auto overrides = cfg.overrides();
-		REQUIRE(overrides[0].first == 0);
-		REQUIRE(overrides[0].second == lineprop::OUTPUT_VALUE);
-		REQUIRE(overrides[1].first == 3);
-		REQUIRE(overrides[1].second == lineprop::OUTPUT_VALUE);
-		REQUIRE(overrides[2].first == 1);
-		REQUIRE(overrides[2].second == lineprop::OUTPUT_VALUE);
+		REQUIRE(cfg.get_line_settings().size() == 0);
 	}
 }
 
-TEST_CASE("line_config overrides work")
+TEST_CASE("adding line_settings to line_config works", "[line-config][line-settings]")
 {
 	::gpiod::line_config cfg;
 
-	SECTION("direction")
-	{
-		cfg.set_direction_default(direction::AS_IS);
-		cfg.set_direction_override(direction::INPUT, 3);
-
-		REQUIRE(cfg.direction_is_overridden(3));
-		REQUIRE(cfg.direction_offset(3) == direction::INPUT);
-		cfg.clear_direction_override(3);
-		REQUIRE_FALSE(cfg.direction_is_overridden(3));
-		REQUIRE(cfg.direction_offset(3) == direction::AS_IS);
-	}
-
-	SECTION("edge detection")
-	{
-		cfg.set_edge_detection_default(edge::NONE);
-		cfg.set_edge_detection_override(edge::BOTH, 0);
-
-		REQUIRE(cfg.edge_detection_is_overridden(0));
-		REQUIRE(cfg.edge_detection_offset(0) == edge::BOTH);
-		cfg.clear_edge_detection_override(0);
-		REQUIRE_FALSE(cfg.edge_detection_is_overridden(0));
-		REQUIRE(cfg.edge_detection_offset(0) == edge::NONE);
-	}
-
-	SECTION("bias")
-	{
-		cfg.set_bias_default(bias::AS_IS);
-		cfg.set_bias_override(bias::PULL_DOWN, 3);
-
-		REQUIRE(cfg.bias_is_overridden(3));
-		REQUIRE(cfg.bias_offset(3) == bias::PULL_DOWN);
-		cfg.clear_bias_override(3);
-		REQUIRE_FALSE(cfg.bias_is_overridden(3));
-		REQUIRE(cfg.bias_offset(3) == bias::AS_IS);
-	}
-
-	SECTION("drive")
-	{
-		cfg.set_drive_default(drive::PUSH_PULL);
-		cfg.set_drive_override(drive::OPEN_DRAIN, 4);
-
-		REQUIRE(cfg.drive_is_overridden(4));
-		REQUIRE(cfg.drive_offset(4) == drive::OPEN_DRAIN);
-		cfg.clear_drive_override(4);
-		REQUIRE_FALSE(cfg.drive_is_overridden(4));
-		REQUIRE(cfg.drive_offset(4) == drive::PUSH_PULL);
-	}
-
-	SECTION("active-low")
-	{
-		cfg.set_active_low_default(false);
-		cfg.set_active_low_override(true, 16);
-
-		REQUIRE(cfg.active_low_is_overridden(16));
-		REQUIRE(cfg.active_low_offset(16));
-		cfg.clear_active_low_override(16);
-		REQUIRE_FALSE(cfg.active_low_is_overridden(16));
-		REQUIRE_FALSE(cfg.active_low_offset(16));
-	}
-
-	SECTION("debounce period")
-	{
-		/*
-		 * Test the chrono literals and implicit duration conversions
-		 * too.
-		 */
+	cfg.add_line_settings(4,
+		::gpiod::line_settings()
+			.set_direction(direction::INPUT)
+			.set_edge_detection(edge::RISING));
+
+	cfg.add_line_settings({7, 2},
+		::gpiod::line_settings()
+			.set_direction(direction::OUTPUT)
+			.set_drive(drive::OPEN_DRAIN));
+
+	auto settings = cfg.get_line_settings();
+
+	REQUIRE(settings.size() == 3);
+	REQUIRE(settings.at(2).direction() == direction::OUTPUT);
+	REQUIRE(settings.at(2).drive() == drive::OPEN_DRAIN);
+	REQUIRE(settings.at(4).direction() == direction::INPUT);
+	REQUIRE(settings.at(4).edge_detection() == edge::RISING);
+	REQUIRE(settings.at(7).direction() == direction::OUTPUT);
+	REQUIRE(settings.at(7).drive() == drive::OPEN_DRAIN);
+}
 
-		cfg.set_debounce_period_default(5000us);
-		cfg.set_debounce_period_override(3ms, 1);
+TEST_CASE("line_config can be reset", "[line-config]")
+{
+	::gpiod::line_config cfg;
 
-		REQUIRE(cfg.debounce_period_is_overridden(1));
-		REQUIRE(cfg.debounce_period_offset(1) == 3ms);
-		cfg.clear_debounce_period_override(1);
-		REQUIRE_FALSE(cfg.debounce_period_is_overridden(1));
-		REQUIRE(cfg.debounce_period_offset(1) == 5ms);
-	}
+	cfg.add_line_settings({3, 4, 7},
+		::gpiod::line_settings()
+			.set_direction(direction::INPUT)
+			.set_edge_detection(edge::BOTH));
 
-	SECTION("event clock")
-	{
-		cfg.set_event_clock_default(clock_type::MONOTONIC);
-		cfg.set_event_clock_override(clock_type::REALTIME, 4);
+	auto settings = cfg.get_line_settings();
 
-		REQUIRE(cfg.event_clock_is_overridden(4));
-		REQUIRE(cfg.event_clock_offset(4) == clock_type::REALTIME);
-		cfg.clear_event_clock_override(4);
-		REQUIRE_FALSE(cfg.event_clock_is_overridden(4));
-		REQUIRE(cfg.event_clock_offset(4) == clock_type::MONOTONIC);
-	}
+	REQUIRE(settings.size() == 3);
+	REQUIRE(settings.at(3).direction() == direction::INPUT);
+	REQUIRE(settings.at(3).edge_detection() == edge::BOTH);
+	REQUIRE(settings.at(4).direction() == direction::INPUT);
+	REQUIRE(settings.at(4).edge_detection() == edge::BOTH);
+	REQUIRE(settings.at(7).direction() == direction::INPUT);
+	REQUIRE(settings.at(7).edge_detection() == edge::BOTH);
 
-	SECTION("output value")
-	{
-		cfg.set_output_value_default(value::INACTIVE);
-		cfg.set_output_value_override(value::ACTIVE, 0);
-		cfg.set_output_values({ 1, 2, 8 }, { value::ACTIVE, value::ACTIVE, value::ACTIVE });
-		cfg.set_output_values({ { 17, value::ACTIVE }, { 21, value::ACTIVE } });
+	cfg.reset();
 
-		for (const auto& off: offsets({ 0, 1, 2, 8, 17, 21 })) {
-			REQUIRE(cfg.output_value_is_overridden(off));
-			REQUIRE(cfg.output_value_offset(off) == value::ACTIVE);
-			cfg.clear_output_value_override(off);
-			REQUIRE_FALSE(cfg.output_value_is_overridden(off));
-			REQUIRE(cfg.output_value_offset(off) == value::INACTIVE);
-		}
-	}
+	REQUIRE(cfg.get_line_settings().size() == 0);
 }
 
-TEST_CASE("line_config can be moved", "[line-config]")
+TEST_CASE("line_config stream insertion operator works", "[line-config]")
 {
-	::gpiod::line_config cfg({
-		{ lineprop::DIRECTION, direction::INPUT },
-		{ lineprop::EDGE_DETECTION, edge::BOTH },
-		{ lineprop::DEBOUNCE_PERIOD, 3000us },
-		{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
-	});
-
-	cfg.set_direction_override(direction::OUTPUT, 2);
-	cfg.set_edge_detection_override(edge::NONE, 2);
+	::gpiod::line_config cfg;
 
-	SECTION("move constructor works")
+	SECTION("empty config")
 	{
-		auto moved(::std::move(cfg));
-
-		REQUIRE(moved.direction_default() == direction::INPUT);
-		REQUIRE(moved.edge_detection_default() == edge::BOTH);
-		REQUIRE(moved.debounce_period_default() == 3000us);
-		REQUIRE(moved.event_clock_default() == clock_type::REALTIME);
-		REQUIRE(moved.direction_offset(2) == direction::OUTPUT);
-		REQUIRE(moved.edge_detection_offset(2) == edge::NONE);
+		REQUIRE_THAT(cfg, stringify_matcher<::gpiod::line_config>(
+					"gpiod::line_config(num_settings=0)"));
 	}
 
-	SECTION("move constructor works")
+	SECTION("config with settings")
 	{
-		::gpiod::line_config moved;
-
-		moved = ::std::move(cfg);
-
-		REQUIRE(moved.direction_default() == direction::INPUT);
-		REQUIRE(moved.edge_detection_default() == edge::BOTH);
-		REQUIRE(moved.debounce_period_default() == 3000us);
-		REQUIRE(moved.event_clock_default() == clock_type::REALTIME);
-		REQUIRE(moved.direction_offset(2) == direction::OUTPUT);
-		REQUIRE(moved.edge_detection_offset(2) == edge::NONE);
+		cfg.add_line_settings({0, 2},
+				::gpiod::line_settings()
+					.set_direction(direction::OUTPUT)
+					.set_drive(drive::OPEN_SOURCE)
+		);
+
+		REQUIRE_THAT(cfg, stringify_matcher<::gpiod::line_config>(
+			"gpiod::line_config(num_settings=2, "
+			"settings=[0: gpiod::line_settings(direction=OUTPUT, edge_detection=NONE, "
+			"bias=AS_IS, drive=OPEN_SOURCE, active-high, debounce_period=0, "
+			"event_clock=MONOTONIC, output_value=INACTIVE), "
+			"2: gpiod::line_settings(direction=OUTPUT, edge_detection=NONE, bias=AS_IS, "
+			"drive=OPEN_SOURCE, active-high, debounce_period=0, event_clock=MONOTONIC, "
+			"output_value=INACTIVE)])"));
 	}
 }
 
-TEST_CASE("line_config stream insertion operator works", "[line-config]")
-{
-	::gpiod::line_config cfg({
-		{ lineprop::DIRECTION, direction::INPUT },
-		{ lineprop::EDGE_DETECTION, edge::BOTH },
-		{ lineprop::DEBOUNCE_PERIOD, 3000us },
-		{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
-	});
-
-	cfg.set_direction_override(direction::OUTPUT, 2);
-	cfg.set_edge_detection_override(edge::NONE, 2);
-
-	::std::stringstream buf;
-
-	buf << cfg;
-
-	::std::string expected(
-		"gpiod::line_config(defaults=(direction=INPUT, edge_detection=BOTH_EDGES, bias="
-		"AS_IS, drive=PUSH_PULL, active-high, debounce_period=3000us, event_clock="
-		"REALTIME, default_output_value=INACTIVE), overrides=[(offset=2 -> direction="
-		"OUTPUT), (offset=2 -> edge_detection=NONE)])"
-	);
-
-	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
-}
-
 } /* namespace */
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
index 59692a7..66b22a4 100644
--- a/bindings/cxx/tests/tests-line-request.cpp
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -11,8 +11,6 @@
 #include "helpers.hpp"
 
 using simprop = ::gpiosim::chip::property;
-using reqprop = ::gpiod::request_config::property;
-using lineprop = ::gpiod::line_config::property;
 using offsets = ::gpiod::line::offsets;
 using values = ::gpiod::line::values;
 using direction = ::gpiod::line::direction;
@@ -60,37 +58,45 @@ private:
 	bool _m_active_low;
 };
 
-TEST_CASE("requesting lines fails with invalid arguments", "[line-request][chip]")
+TEST_CASE("requesting lines behaves correctly with invalid arguments", "[line-request][chip]")
 {
 	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
 	::gpiod::chip chip(sim.dev_path());
 
 	SECTION("no offsets")
 	{
-		REQUIRE_THROWS_AS(chip.request_lines(::gpiod::request_config(),
-						     ::gpiod::line_config()),
-				  ::std::invalid_argument);
+		REQUIRE_THROWS_AS(chip.prepare_request().do_request(), ::std::invalid_argument);
 	}
 
 	SECTION("duplicate offsets")
 	{
-		REQUIRE_THROWS_MATCHES(chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 2, 0, 0, 4 }) }
-			}),
-			::gpiod::line_config()),
-			::std::system_error,
-			 system_error_matcher(EBUSY)
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(::gpiod::line_config()
+				.add_line_settings({ 2, 0, 0, 4 },
+						   ::gpiod::line_settings()
+				)
+			)
+			.do_request();
+
+		auto offsets = request.offsets();
+
+		REQUIRE(offsets.size() == 3);
+		REQUIRE(offsets[0] == 2);
+		REQUIRE(offsets[1] == 0);
+		REQUIRE(offsets[2] == 4);
 	}
 
 	SECTION("offset out of bounds")
 	{
-		REQUIRE_THROWS_AS(chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 2, 0, 8, 4 }) }
-			}),
-			::gpiod::line_config()),
+		REQUIRE_THROWS_AS(chip
+			.prepare_request()
+			.set_line_config(::gpiod::line_config()
+				.add_line_settings({ 2, 0, 8, 4 },
+						   ::gpiod::line_settings()
+				)
+			)
+			.do_request(),
 			::std::invalid_argument
 		);
 	}
@@ -104,13 +110,20 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
 
 	SECTION("set custom consumer")
 	{
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 2 }) },
-				{ reqprop::CONSUMER, "foobar" }
-			}),
-			::gpiod::line_config()
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						offs,
+						::gpiod::line_settings()
+					)
+			)
+			.set_request_config(
+				::gpiod::request_config()
+					.set_consumer("foobar")
+			)
+			.do_request();
 
 		auto info = chip.get_line_info(2);
 
@@ -120,12 +133,16 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
 
 	SECTION("empty consumer")
 	{
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 2 }) },
-			}),
-			::gpiod::line_config()
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						2,
+						::gpiod::line_settings()
+					)
+			)
+			.do_request();
 
 		auto info = chip.get_line_info(2);
 
@@ -150,14 +167,17 @@ TEST_CASE("values can be read", "[line-request]")
 	for (unsigned int i = 0; i < offs.size(); i++)
 		sim.set_pull(offs[i], pulls[i]);
 
-	auto request = ::gpiod::chip(sim.dev_path()).request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offs }
-		}),
-		::gpiod::line_config({
-			{ lineprop::DIRECTION, direction::INPUT }
-		})
-	);
+	auto request = ::gpiod::chip(sim.dev_path())
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					offs,
+					::gpiod::line_settings()
+						.set_direction(direction::INPUT)
+				)
+		)
+		.do_request();
 
 	SECTION("get all values (returning variant)")
 	{
@@ -201,9 +221,11 @@ TEST_CASE("values can be read", "[line-request]")
 	SECTION("get a single value (active-low)")
 	{
 		request.reconfigure_lines(
-			::gpiod::line_config({
-				{ lineprop::ACTIVE_LOW, true }
-			})
+			::gpiod::line_config()
+				.add_line_settings(
+					offs,
+					::gpiod::line_settings()
+						.set_active_low(true))
 		);
 
 		auto val = request.get_value(7);
@@ -238,18 +260,20 @@ TEST_CASE("output values can be set at request time", "[line-request]")
 	::gpiod::chip chip(sim.dev_path());
 	const offsets offs({ 0, 1, 3, 4 });
 
-	::gpiod::request_config req_cfg({
-		{ reqprop::OFFSETS, offs }
-	});
+	::gpiod::line_settings settings;
+	settings
+		.set_direction(direction::OUTPUT)
+		.set_output_value(value::ACTIVE);
 
-	::gpiod::line_config line_cfg({
-		{ lineprop::DIRECTION, direction::OUTPUT },
-		{ lineprop::OUTPUT_VALUE, value::ACTIVE }
-	});
+	::gpiod::line_config line_cfg;
+	line_cfg.add_line_settings(offs, settings);
 
 	SECTION("default output value")
 	{
-		auto request = chip.request_lines(req_cfg, line_cfg);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(line_cfg)
+			.do_request();
 
 		for (const auto& off: offs)
 			REQUIRE(sim.get_value(off) == simval::ACTIVE);
@@ -259,9 +283,13 @@ TEST_CASE("output values can be set at request time", "[line-request]")
 
 	SECTION("overridden output value")
 	{
-		line_cfg.set_output_value_override(value::INACTIVE, 1);
+		settings.set_output_value(value::INACTIVE);
+		line_cfg.add_line_settings(1, settings);
 
-		auto request = chip.request_lines(req_cfg, line_cfg);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(line_cfg)
+			.do_request();;
 
 		REQUIRE(sim.get_value(0) == simval::ACTIVE);
 		REQUIRE(sim.get_value(1) == simval::INACTIVE);
@@ -276,16 +304,17 @@ TEST_CASE("values can be set after requesting lines", "[line-request]")
 	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
 	const offsets offs({ 0, 1, 3, 4 });
 
-	::gpiod::request_config req_cfg({
-		{ reqprop::OFFSETS, offs }
-	});
-
-	::gpiod::line_config line_cfg({
-		{ lineprop::DIRECTION, direction::OUTPUT },
-		{ lineprop::OUTPUT_VALUE, value::INACTIVE }
-	});
-
-	auto request = ::gpiod::chip(sim.dev_path()).request_lines(req_cfg, line_cfg);
+	auto request = ::gpiod::chip(sim.dev_path())
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					offs,
+					::gpiod::line_settings()
+						.set_direction(direction::OUTPUT)
+				)
+		)
+		.do_request();
 
 	SECTION("set single value")
 	{
@@ -343,21 +372,26 @@ TEST_CASE("line_request can be moved", "[line-request]")
 	::gpiod::chip chip(sim.dev_path());
 	const offsets offs({ 3, 1, 0, 2 });
 
-	auto request = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offs }
-		}),
-		::gpiod::line_config()
-	);
+	auto request = chip.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					offs,
+					::gpiod::line_settings()
+				)
+		).do_request();
 
 	auto fd = request.fd();
 
-	auto another = chip.request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 6 }) }
-		}),
-		::gpiod::line_config()
-	);
+	auto another = chip
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					6,
+					::gpiod::line_settings()
+				)
+		).do_request();
 
 	SECTION("move constructor works")
 	{
@@ -380,12 +414,15 @@ TEST_CASE("released request can no longer be used", "[line-request]")
 {
 	::gpiosim::chip sim;
 
-	auto request = ::gpiod::chip(sim.dev_path()).request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 0 }) }
-		}),
-		::gpiod::line_config()
-	);
+	auto request = ::gpiod::chip(sim.dev_path())
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					0,
+					::gpiod::line_settings()
+				)
+		).do_request();
 
 	request.release();
 
@@ -402,14 +439,17 @@ TEST_CASE("line_request survives parent chip", "[line-request][chip]")
 	{
 		::gpiod::chip chip(sim.dev_path());
 
-		auto request = chip.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 0 }) }
-			}),
-			::gpiod::line_config({
-				{ lineprop::DIRECTION, direction::INPUT }
-			})
-		);
+		auto request = chip
+			.prepare_request()
+			.set_line_config(
+				::gpiod::line_config()
+					.add_line_settings(
+						0,
+						::gpiod::line_settings()
+							.set_direction(direction::INPUT)
+					)
+			)
+			.do_request();
 
 		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
 
@@ -422,15 +462,13 @@ TEST_CASE("line_request survives parent chip", "[line-request][chip]")
 	{
 		/* Need to get the request object somehow. */
 		::gpiod::chip dummy(sim.dev_path());
+		::gpiod::line_config cfg;
+		cfg.add_line_settings(0, ::gpiod::line_settings().set_direction(direction::INPUT));
 
-		auto request = dummy.request_lines(
-			::gpiod::request_config({
-				{ reqprop::OFFSETS, offsets({ 0 }) }
-			}),
-			::gpiod::line_config({
-				{ lineprop::DIRECTION, direction::INPUT }
-			})
-		);
+		auto request = dummy
+			.prepare_request()
+			.set_line_config(cfg)
+			.do_request();
 
 		request.release();
 		dummy.close();
@@ -438,14 +476,10 @@ TEST_CASE("line_request survives parent chip", "[line-request][chip]")
 		{
 			::gpiod::chip chip(sim.dev_path());
 
-			request = chip.request_lines(
-				::gpiod::request_config({
-					{ reqprop::OFFSETS, offsets({ 0 }) }
-				}),
-				::gpiod::line_config({
-					{ lineprop::DIRECTION, direction::INPUT }
-				})
-			);
+			request = chip
+				.prepare_request()
+				.set_line_config(cfg)
+				.do_request();
 
 			REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
 		}
@@ -458,12 +492,15 @@ TEST_CASE("line_request stream insertion operator works", "[line-request]")
 {
 	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
 
-	auto request = ::gpiod::chip(sim.dev_path()).request_lines(
-		::gpiod::request_config({
-			{ reqprop::OFFSETS, offsets({ 3, 1, 0, 2 }) }
-		}),
-		::gpiod::line_config()
-	);
+	auto request = ::gpiod::chip(sim.dev_path())
+		.prepare_request()
+		.set_line_config(
+			::gpiod::line_config()
+				.add_line_settings(
+					{ 3, 1, 0, 2},
+					::gpiod::line_settings()
+				)
+		).do_request();
 
 	::std::stringstream buf, expected;
 
diff --git a/bindings/cxx/tests/tests-line-settings.cpp b/bindings/cxx/tests/tests-line-settings.cpp
new file mode 100644
index 0000000..a7801a4
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-settings.cpp
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+
+#include "helpers.hpp"
+
+using value = ::gpiod::line::value;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using bias = ::gpiod::line::bias;
+using drive = ::gpiod::line::drive;
+using clock_type = ::gpiod::line::clock;
+using value = ::gpiod::line::value;
+
+using namespace ::std::chrono_literals;
+
+namespace {
+
+TEST_CASE("line_settings constructor works", "[line-settings]")
+{
+	::gpiod::line_settings settings;
+
+	REQUIRE(settings.direction() == direction::AS_IS);
+	REQUIRE(settings.edge_detection() == edge::NONE);
+	REQUIRE(settings.bias() == bias::AS_IS);
+	REQUIRE(settings.drive() == drive::PUSH_PULL);
+	REQUIRE_FALSE(settings.active_low());
+	REQUIRE(settings.debounce_period() == 0us);
+	REQUIRE(settings.event_clock() == clock_type::MONOTONIC);
+	REQUIRE(settings.output_value() == value::INACTIVE);
+}
+
+TEST_CASE("line_settings mutators work", "[line-settings]")
+{
+	::gpiod::line_settings settings;
+
+	SECTION("direction")
+	{
+		settings.set_direction(direction::INPUT);
+		REQUIRE(settings.direction() == direction::INPUT);
+		settings.set_direction(direction::AS_IS);
+		REQUIRE(settings.direction() == direction::AS_IS);
+		settings.set_direction(direction::OUTPUT);
+		REQUIRE(settings.direction() == direction::OUTPUT);
+		REQUIRE_THROWS_AS(settings.set_direction(static_cast<direction>(999)),
+				  ::std::invalid_argument);
+	}
+
+	SECTION("edge detection")
+	{
+		settings.set_edge_detection(edge::BOTH);
+		REQUIRE(settings.edge_detection() == edge::BOTH);
+		settings.set_edge_detection(edge::NONE);
+		REQUIRE(settings.edge_detection() == edge::NONE);
+		settings.set_edge_detection(edge::FALLING);
+		REQUIRE(settings.edge_detection() == edge::FALLING);
+		settings.set_edge_detection(edge::RISING);
+		REQUIRE(settings.edge_detection() == edge::RISING);
+		REQUIRE_THROWS_AS(settings.set_edge_detection(static_cast<edge>(999)),
+				  ::std::invalid_argument);
+	}
+
+	SECTION("bias")
+	{
+		settings.set_bias(bias::DISABLED);
+		REQUIRE(settings.bias() == bias::DISABLED);
+		settings.set_bias(bias::AS_IS);
+		REQUIRE(settings.bias() == bias::AS_IS);
+		settings.set_bias(bias::PULL_DOWN);
+		REQUIRE(settings.bias() == bias::PULL_DOWN);
+		settings.set_bias(bias::PULL_UP);
+		REQUIRE(settings.bias() == bias::PULL_UP);
+		REQUIRE_THROWS_AS(settings.set_bias(static_cast<bias>(999)), ::std::invalid_argument);
+		REQUIRE_THROWS_AS(settings.set_bias(bias::UNKNOWN), ::std::invalid_argument);
+	}
+
+	SECTION("drive")
+	{
+		settings.set_drive(drive::OPEN_DRAIN);
+		REQUIRE(settings.drive() == drive::OPEN_DRAIN);
+		settings.set_drive(drive::PUSH_PULL);
+		REQUIRE(settings.drive() == drive::PUSH_PULL);
+		settings.set_drive(drive::OPEN_SOURCE);
+		REQUIRE(settings.drive() == drive::OPEN_SOURCE);
+		REQUIRE_THROWS_AS(settings.set_drive(static_cast<drive>(999)), ::std::invalid_argument);
+	}
+
+	SECTION("active-low")
+	{
+		settings.set_active_low(true);
+		REQUIRE(settings.active_low());
+		settings.set_active_low(false);
+		REQUIRE_FALSE(settings.active_low());
+	}
+
+	SECTION("debounce period")
+	{
+		settings.set_debounce_period(2000us);
+		REQUIRE(settings.debounce_period() == 2000us);
+	}
+
+	SECTION("event clock")
+	{
+		settings.set_event_clock(clock_type::REALTIME);
+		REQUIRE(settings.event_clock() == clock_type::REALTIME);
+		settings.set_event_clock(clock_type::MONOTONIC);
+		REQUIRE(settings.event_clock() == clock_type::MONOTONIC);
+		REQUIRE_THROWS_AS(settings.set_event_clock(static_cast<clock_type>(999)),
+				  ::std::invalid_argument);
+	}
+
+	SECTION("output value")
+	{
+		settings.set_output_value(value::ACTIVE);
+		REQUIRE(settings.output_value() == value::ACTIVE);
+		settings.set_output_value(value::INACTIVE);
+		REQUIRE(settings.output_value() == value::INACTIVE);
+		REQUIRE_THROWS_AS(settings.set_output_value(static_cast<value>(999)),
+				  ::std::invalid_argument);
+	}
+}
+
+TEST_CASE("line_settings stream insertion operator works", "[line-settings]")
+{
+	::gpiod::line_settings settings;
+
+	REQUIRE_THAT(settings
+		.set_active_low(true)
+		.set_direction(direction::INPUT)
+		.set_edge_detection(edge::BOTH)
+		.set_bias(bias::PULL_DOWN)
+		.set_event_clock(clock_type::REALTIME),
+		stringify_matcher<::gpiod::line_settings>(
+			"gpiod::line_settings(direction=INPUT, edge_detection=BOTH_EDGES, "
+			"bias=PULL_DOWN, drive=PUSH_PULL, active-low, debounce_period=0, "
+			"event_clock=REALTIME, output_value=INACTIVE)"
+		)
+	);
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-request-config.cpp b/bindings/cxx/tests/tests-request-config.cpp
index ddec724..66eb748 100644
--- a/bindings/cxx/tests/tests-request-config.cpp
+++ b/bindings/cxx/tests/tests-request-config.cpp
@@ -9,7 +9,6 @@
 
 #include "helpers.hpp"
 
-using property = ::gpiod::request_config::property;
 using offsets = ::gpiod::line::offsets;
 
 namespace {
@@ -21,56 +20,20 @@ TEST_CASE("request_config constructor works", "[request-config]")
 		::gpiod::request_config cfg;
 
 		REQUIRE(cfg.consumer().empty());
-		REQUIRE(cfg.offsets().empty());
 		REQUIRE(cfg.event_buffer_size() == 0);
 	}
-
-	SECTION("constructor with default settings")
-	{
-		offsets offsets({ 0, 1, 2, 3 });
-
-		::gpiod::request_config cfg({
-			{ property::CONSUMER, "foobar" },
-			{ property::OFFSETS, offsets},
-			{ property::EVENT_BUFFER_SIZE, 64 }
-		});
-
-		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
-		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
-		REQUIRE(cfg.event_buffer_size() == 64);
-	}
-
-	SECTION("invalid default value types passed to constructor")
-	{
-		REQUIRE_THROWS_AS(::gpiod::request_config({
-			{ property::CONSUMER, 42 }
-		}), ::std::invalid_argument);
-
-		REQUIRE_THROWS_AS(::gpiod::request_config({
-			{ property::OFFSETS, 42 }
-		}), ::std::invalid_argument);
-
-		REQUIRE_THROWS_AS(::gpiod::request_config({
-			{ property::EVENT_BUFFER_SIZE, "foobar" }
-		}), ::std::invalid_argument);
-	}
 }
 
 TEST_CASE("request_config can be moved", "[request-config]")
 {
-	offsets offsets({ 0, 1, 2, 3 });
+	::gpiod::request_config cfg;
 
-	::gpiod::request_config cfg({
-		{ property::CONSUMER, "foobar" },
-		{ property::OFFSETS, offsets },
-		{ property::EVENT_BUFFER_SIZE, 64 }
-	});
+	cfg.set_consumer("foobar").set_event_buffer_size(64);
 
 	SECTION("move constructor works")
 	{
 		auto moved(::std::move(cfg));
 		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
-		REQUIRE_THAT(moved.offsets(), Catch::Equals(offsets));
 		REQUIRE(moved.event_buffer_size() == 64);
 	}
 
@@ -81,7 +44,6 @@ TEST_CASE("request_config can be moved", "[request-config]")
 		moved = ::std::move(cfg);
 
 		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
-		REQUIRE_THAT(moved.offsets(), Catch::Equals(offsets));
 		REQUIRE(moved.event_buffer_size() == 64);
 	}
 }
@@ -96,13 +58,6 @@ TEST_CASE("request_config mutators work", "[request-config]")
 		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
 	}
 
-	SECTION("set offsets")
-	{
-		offsets offsets({ 3, 1, 2, 7, 5 });
-		cfg.set_offsets(offsets);
-		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
-	}
-
 	SECTION("set event_buffer_size")
 	{
 		cfg.set_event_buffer_size(128);
@@ -110,44 +65,17 @@ TEST_CASE("request_config mutators work", "[request-config]")
 	}
 }
 
-TEST_CASE("request_config generic property setting works", "[request-config]")
+TEST_CASE("request_config stream insertion operator works", "[request-config]")
 {
 	::gpiod::request_config cfg;
 
-	SECTION("set consumer")
-	{
-		cfg.set_property(property::CONSUMER, "foobar");
-		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
-	}
-
-	SECTION("set offsets")
-	{
-		offsets offsets({ 3, 1, 2, 7, 5 });
-		cfg.set_property(property::OFFSETS, offsets);
-		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
-	}
-
-	SECTION("set event_buffer_size")
-	{
-		cfg.set_property(property::EVENT_BUFFER_SIZE, 128);
-		REQUIRE(cfg.event_buffer_size() == 128);
-	}
-}
-
-TEST_CASE("request_config stream insertion operator works", "[request-config]")
-{
-	::gpiod::request_config cfg({
-		{ property::CONSUMER, "foobar" },
-		{ property::OFFSETS, offsets({ 0, 1, 2, 3 })},
-		{ property::EVENT_BUFFER_SIZE, 32 }
-	});
+	cfg.set_consumer("foobar").set_event_buffer_size(32);
 
 	::std::stringstream buf;
 
 	buf << cfg;
 
-	::std::string expected("gpiod::request_config(consumer='foobar', num_offsets=4, "
-			       "offsets=(gpiod::offsets(0, 1, 2, 3)), event_buffer_size=32)");
+	::std::string expected("gpiod::request_config(consumer='foobar', event_buffer_size=32)");
 
 	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
 }
diff --git a/include/gpiod.h b/include/gpiod.h
index d8b5f39..b60a177 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -43,6 +43,7 @@ extern "C" {
 struct gpiod_chip;
 struct gpiod_chip_info;
 struct gpiod_line_info;
+struct gpiod_line_settings;
 struct gpiod_line_config;
 struct gpiod_request_config;
 struct gpiod_line_request;
@@ -167,12 +168,10 @@ int gpiod_chip_get_line_offset_from_name(struct gpiod_chip *chip,
 /**
  * @brief Request a set of lines for exclusive usage.
  * @param chip GPIO chip object.
- * @param req_cfg Request config object.
+ * @param req_cfg Request config object. Can be NULL for default settings.
  * @param line_cfg Line config object.
  * @return New line request object or NULL if an error occurred. The request
  *	   must be released by the caller using ::gpiod_line_request_release.
- * @note Line configuration overrides for lines that are not requested are
- *	 silently ignored.
  */
 struct gpiod_line_request *
 gpiod_chip_request_lines(struct gpiod_chip *chip,
@@ -229,7 +228,7 @@ size_t gpiod_chip_info_get_num_lines(struct gpiod_chip_info *info);
 /**
  * @}
  *
- * @defgroup line_settings Line definitions
+ * @defgroup line_defs Line definitions
  * @{
  *
  * These defines are used across the API.
@@ -514,584 +513,258 @@ gpiod_info_event_get_line_info(struct gpiod_info_event *event);
 /**
  * @}
  *
- * @defgroup line_config Line configuration objects
+ * @defgroup line_settings Line settings objects
  * @{
  *
- * Functions for manipulating line configuration objects.
- *
- * The line-config object contains the configuration for lines that can be
- * used in two cases:
- *  - when making a line request
- *  - when reconfiguring a set of already requested lines.
- *
- * A new line-config object is instantiated with a set of sane defaults
- * for all supported configuration settings. Those defaults can be modified by
- * the caller. Default values can be overridden by applying different values
- * for specific lines. When making a request or reconfiguring an existing one,
- * the overridden settings for specific lines take precedance. For lines
- * without an override the requested default settings are used.
- *
- * For every setting there are two mutators (one setting the default and one
- * for the per-line override), two getters (one for reading the global
- * default and one for retrieving the effective value for the line),
- * a function for testing if a setting is overridden for the line
- * and finally a function for clearing the overrides (per line).
- *
- * The mutators don't return errors. If the set of options is too complex to
- * be translated into kernel uAPI structures then an error will be returned at
- * the time of the request or reconfiguration. If an invalid value was passed
- * to any of the mutators then the default value will be silently used instead.
- *
- * Operating on lines in struct line_config has no immediate effect on real
- * GPIOs, it only manipulates the config object in memory.  Those changes are
- * only applied to the hardware at the time of the request or reconfiguration.
+ * Functions for manipulating line settings objects.
  *
- * Overrides for lines that don't end up being requested are silently ignored
- * both in ::gpiod_chip_request_lines as well as in
- * ::gpiod_line_request_reconfigure_lines.
+ * Line settings object contains a set of line properties that can be used
+ * when requesting lines or reconfiguring an existing request.
  *
- * In cases where all requested lines are using the one configuration, the
- * line overrides can be entirely ignored when preparing the configuration.
+ * Mutators in general can only fail if the new property value is invalid. The
+ * return values can be safely ignored - the object remains valid even after
+ * a mutator fails and simply uses the sane default appropriate for given
+ * property.
  */
 
 /**
- * @brief Create a new line config object.
- * @return New line config object or NULL on error.
+ * @brief Create a new line settings object.
+ * @return New line settings object or NULL on error.
  */
-struct gpiod_line_config *gpiod_line_config_new(void);
+struct gpiod_line_settings *gpiod_line_settings_new(void);
 
 /**
- * @brief Free the line config object and release all associated resources.
- * @param config Line config object to free.
+ * @brief Free the line settings object and release all associated resources.
+ * @param settings Line settings object.
  */
-void gpiod_line_config_free(struct gpiod_line_config *config);
+void gpiod_line_settings_free(struct gpiod_line_settings *settings);
 
 /**
- * @brief Reset the line config object.
- * @param config Line config object to free.
- *
- * Resets the entire configuration stored in the object. This is useful if
- * the user wants to reuse the object without reallocating it.
+ * @brief Reset the line settings object to its default values.
+ * @param settings Line settings object.
  */
-void gpiod_line_config_reset(struct gpiod_line_config *config);
+void gpiod_line_settings_reset(struct gpiod_line_settings *settings);
 
 /**
- * @brief Set the default line direction.
- * @param config Line config object.
- * @param direction New direction.
+ * @brief Copy the line settings object.
+ * @param settings Line settings object to copy.
+ * @return New line settings object that must be freed using
+ *         ::gpiod_line_settings_free or NULL on failure.
  */
-void gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
-					     int direction);
+struct gpiod_line_settings *
+gpiod_line_settings_copy(struct gpiod_line_settings *settings);
 
 /**
- * @brief Set the direction override for a line.
- * @param config Line config object.
+ * @brief Set direction.
+ * @param settings Line settings object.
  * @param direction New direction.
- * @param offset The offset of the line for which to set the override.
- */
-void gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
-					      int direction,
-					      unsigned int offset);
-
-/**
- * @brief Clear the direction override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
- */
-void
-gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
-					   unsigned int offset);
-
-/**
- * @brief Check if the direction is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if direction is overridden on the line, false otherwise.
- */
-bool gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
-					       unsigned int offset);
-
-/**
- * @brief Get the default direction setting.
- * @param config Line config object.
- * @return Direction setting used for any non-overridden line.
- */
-int gpiod_line_config_get_direction_default(struct gpiod_line_config *config);
-
-/**
- * @brief Get the direction setting for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the direction.
- * @return Direction setting for the line if the config object were used
- *	   in a request.
- */
-int gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
-					   unsigned int offset);
-
-/**
- * @brief Set the default edge event detection.
- * @param config Line config object.
- * @param edge Type of edge events to detect.
- */
-void
-gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
-					     int edge);
-
-/**
- * @brief Set the edge detection override for a line.
- * @param config Line config object.
- * @param edge Type of edge events to detect.
- * @param offset The offset of the line for which to set the override.
+ * @return 0 on success, -1 on error.
  */
-void
-gpiod_line_config_set_edge_detection_override(struct gpiod_line_config *config,
-					      int edge, unsigned int offset);
+int gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
+				      int direction);
 
 /**
- * @brief Clear the edge detection override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
+ * @brief Get direction.
+ * @param settings Line settings object.
+ * @return Current direction.
  */
-void
-gpiod_line_config_clear_edge_detection_override(
-			struct gpiod_line_config *config, unsigned int offset);
+int gpiod_line_settings_get_direction(struct gpiod_line_settings *settings);
 
 /**
- * @brief Check if the edge detection setting is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if edge detection is overridden for the line, false otherwise.
- */
-bool
-gpiod_line_config_edge_detection_is_overridden(struct gpiod_line_config *config,
-					       unsigned int offset);
-
-/**
- * @brief Get the default edge detection setting.
- * @param config Line config object.
- * @return Edge detection setting used for any non-overridden line.
+ * @brief Set edge detection.
+ * @param settings Line settings object.
+ * @param edge New edge detection setting.
+ * @return 0 on success, -1 on failure.
  */
-int
-gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config);
+int gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
+					   int edge);
 
 /**
- * @brief Get the edge event detection setting for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the edge event detection
- *		 setting.
- * @return Edge event detection setting for the line if the config object
- *	   were used in a request.
+ * @brief Get edge detection.
+ * @param settings Line settings object.
+ * @return Current edge detection setting.
  */
 int
-gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
-					    unsigned int offset);
+gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings);
 
 /**
- * @brief Set the default bias setting.
- * @param config Line config object.
+ * @brief Set bias.
+ * @param settings Line settings object.
  * @param bias New bias.
+ * @return 0 on success, -1 on failure.
  */
-void gpiod_line_config_set_bias_default(struct gpiod_line_config *config,
-					int bias);
-
-/**
- * @brief Set the bias override for a line.
- * @param config Line config object.
- * @param bias New bias setting.
- * @param offset The offset of the line for which to set the override.
- */
-void gpiod_line_config_set_bias_override(struct gpiod_line_config *config,
-					 int bias, unsigned int offset);
-
-/**
- * @brief Clear the bias override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
- */
-void gpiod_line_config_clear_bias_override(struct gpiod_line_config *config,
-					   unsigned int offset);
-
-/**
- * @brief Check if the bias setting is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if bias is overridden for the line, false otherwise.
- */
-bool gpiod_line_config_bias_is_overridden(struct gpiod_line_config *config,
-					  unsigned int offset);
-/**
- * @brief Get the default bias setting.
- * @param config Line config object.
- * @return Bias setting used for any non-overridden line.
- */
-int gpiod_line_config_get_bias_default(struct gpiod_line_config *config);
+int gpiod_line_settings_set_bias(struct gpiod_line_settings *settings,
+				 int bias);
 
 /**
- * @brief Get the bias setting for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the bias setting.
- * @return Bias setting used for the line if the config object were used
- *	   in a request.
+ * @brief Get bias.
+ * @param settings Line settings object.
+ * @return Current bias setting.
  */
-int gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
-				      unsigned int offset);
+int gpiod_line_settings_get_bias(struct gpiod_line_settings *settings);
 
 /**
- * @brief Set the default drive setting.
- * @param config Line config object.
- * @param drive New drive.
- */
-void gpiod_line_config_set_drive_default(struct gpiod_line_config *config,
-					 int drive);
-
-/**
- * @brief Set the drive override for a line.
- * @param config Line config object.
+ * @brief Set drive.
+ * @param settings Line settings object.
  * @param drive New drive setting.
- * @param offset The offset of the line for which to set the override.
- */
-void gpiod_line_config_set_drive_override(struct gpiod_line_config *config,
-					  int drive, unsigned int offset);
-
-/**
- * @brief Clear the drive override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
- */
-void gpiod_line_config_clear_drive_override(struct gpiod_line_config *config,
-					    unsigned int offset);
-
-/**
- * @brief Check if the drive setting is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if drive is overridden for the line, false otherwise.
- */
-bool gpiod_line_config_drive_is_overridden(struct gpiod_line_config *config,
-					   unsigned int offset);
-
-/**
- * @brief Get the default drive setting.
- * @param config Line config object.
- * @return Drive setting for any non-overridden line.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_config_get_drive_default(struct gpiod_line_config *config);
+int gpiod_line_settings_set_drive(struct gpiod_line_settings *settings,
+				  int drive);
 
 /**
- * @brief Get the drive setting for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the drive setting.
- * @return Drive setting for the line if the config object were used in a
- *	   request.
+ * @brief Get drive.
+ * @param settings Line settings object.
+ * @return Current drive setting.
  */
-int gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
-				       unsigned int offset);
+int gpiod_line_settings_get_drive(struct gpiod_line_settings *settings);
 
 /**
- * @brief Set the default active-low setting.
- * @param config Line config object.
+ * @brief Set active-low setting.
+ * @param settings Line settings object.
  * @param active_low New active-low setting.
  */
-void gpiod_line_config_set_active_low_default(struct gpiod_line_config *config,
-					      bool active_low);
-
-/**
- * @brief Override the active-low setting for a line.
- * @param config Line config object.
- * @param active_low New active-low setting.
- * @param offset The offset of the line for which to set the override.
- */
-void gpiod_line_config_set_active_low_override(struct gpiod_line_config *config,
-					       bool active_low,
-					       unsigned int offset);
-
-/**
- * @brief Clear the active-low override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
- */
-void
-gpiod_line_config_clear_active_low_override(struct gpiod_line_config *config,
-					    unsigned int offset);
-
-/**
- * @brief Check if the active-low setting is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if active-low is overridden for the line, false otherwise.
- */
-bool
-gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
-					   unsigned int offset);
-
-/**
- * @brief Check if active-low is the default setting.
- * @param config Line config object.
- * @return Active-low setting for any non-overridden line.
- */
-bool gpiod_line_config_get_active_low_default(struct gpiod_line_config *config);
+void gpiod_line_settings_set_active_low(struct gpiod_line_settings *settings,
+					bool active_low);
 
 /**
- * @brief Check if a line is configured as active-low.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the active-low setting.
- * @return Active-low setting for the line if the config object were used in
- *	   a request.
+ * @brief Get active-low setting.
+ * @param settings Line settings object.
+ * @return True if active-low is enabled, false otherwise.
  */
-bool gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
-					     unsigned int offset);
+bool gpiod_line_settings_get_active_low(struct gpiod_line_settings *settings);
 
 /**
- * @brief Set the default debounce period.
- * @param config Line config object.
- * @param period New debounce period in microseconds. Disables debouncing if 0.
- * @note Debouncing is only useful on input lines with edge detection.
- *	 Its purpose is to filter spurious events due to noise during the
- *	 edge transition.  It has no effect on normal get or set operations.
- */
-void gpiod_line_config_set_debounce_period_us_default(
-		struct gpiod_line_config *config, unsigned long period);
-
-/**
- * @brief Override the debounce period setting for a line.
- * @param config Line config object.
+ * @brief Set debounce period.
+ * @param settings Line settings object.
  * @param period New debounce period in microseconds.
- * @param offset The offset of the line for which to set the override.
  */
 void
-gpiod_line_config_set_debounce_period_us_override(
-					struct gpiod_line_config *config,
-					unsigned long period,
-					unsigned int offset);
+gpiod_line_settings_set_debounce_period_us(struct gpiod_line_settings *settings,
+					   unsigned long period);
 
 /**
- * @brief Clear the debounce period override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
- */
-void gpiod_line_config_clear_debounce_period_us_override(
-					struct gpiod_line_config *config,
-					unsigned int offset);
-
-/**
- * @brief Check if the debounce period setting is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if debounce period is overridden for the line, false
- *	   otherwise.
- */
-bool gpiod_line_config_debounce_period_us_is_overridden(
-					struct gpiod_line_config *config,
-					unsigned int offset);
-
-/**
- * @brief Get the default debounce period.
- * @param config Line config object.
- * @return Debounce period for any non-overridden line.
- *	   Measured in microseconds.
- *	   0 if debouncing is disabled.
- */
-unsigned long gpiod_line_config_get_debounce_period_us_default(
-					struct gpiod_line_config *config);
-
-/**
- * @brief Get the debounce period for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the debounce period.
- * @return Debounce period for the line if the config object were used in a
- *	   request.
- *	   Measured in microseconds.
- *	   0 if debouncing is disabled.
+ * @brief Get debounce period.
+ * @param settings Line settings object.
+ * @return Current debounce period in microseconds.
  */
 unsigned long
-gpiod_line_config_get_debounce_period_us_offset(
-			struct gpiod_line_config *config, unsigned int offset);
-
-/**
- * @brief Set the default event timestamp clock.
- * @param config Line config object.
- * @param clock New clock to use.
- */
-void gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
-					       int clock);
-
-/**
- * @brief Override the event clock setting for a line.
- * @param config Line config object.
- * @param clock New event clock to use.
- * @param offset The offset of the line for which to set the override.
- */
-void
-gpiod_line_config_set_event_clock_override(struct gpiod_line_config *config,
-					   int clock, unsigned int offset);
+gpiod_line_settings_get_debounce_period_us(
+		struct gpiod_line_settings *settings);
 
 /**
- * @brief Clear the event clock override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
+ * @brief Set event clock.
+ * @param settings Line settings object.
+ * @param event_clock New event clock.
+ * @return 0 on success, -1 on failure.
  */
-void
-gpiod_line_config_clear_event_clock_override(struct gpiod_line_config *config,
-					     unsigned int offset);
+int gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
+					int event_clock);
 
 /**
- * @brief Check if the event clock setting is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if event clock period is overridden for the line, false
- *	   otherwise.
+ * @brief Get event clock setting.
+ * @param settings Line settings object.
+ * @return Current event clock setting.
  */
-bool
-gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
-					    unsigned int offset);
+int gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings);
 
 /**
- * @brief Get the default event clock setting.
- * @param config Line config object.
- * @return Event clock setting for any non-overridden line.
+ * @brief Set the output value.
+ * @param settings Line settings object.
+ * @param value New output value.
+ * @return 0 on success, -1 on failure.
  */
-int gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config);
+int gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
+					 int value);
 
 /**
- * @brief Get the event clock setting for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to read the event clock setting.
- * @return Event clock setting for the line if the config object were used in a
- *	   request.
+ * @brief Get the output value.
+ * @param settings Line settings object.
+ * @return Current output value.
  */
-int gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
-					     unsigned int offset);
+int gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings);
 
-/**
- * @brief Set the default output value.
- * @param config Line config object.
- * @param value New value.
+/*
+ * @}
  *
- * The default output value applies to all non-overridden output lines.
- * It does not apply to input lines or overridden lines.
- */
-void
-gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
-					   int value);
-
-/**
- * @brief Override the output value for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to override the output value.
- * @param value Output value to set.
- */
-void
-gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
-					    int value, unsigned int offset);
-
-/**
- * @brief Override the output values for multiple lines.
- * @param config Line config object.
- * @param num_values Number of lines for which to override values.
- * @param offsets Array of offsets identifying the lines for which to override
- *		  values,  containing \p num_values entries.
- * @param values Array of output values corresponding to the lines identified in
- *		 \p offsets, also containing \p num_values entries.
+ * @defgroup line_config Line configuration objects
+ * @{
+ *
+ * Functions for manipulating line configuration objects.
+ *
+ * The line-config object contains the configuration for lines that can be
+ * used in two cases:
+ *  - when making a line request
+ *  - when reconfiguring a set of already requested lines.
+ *
+ * A new line-config object is empty. Using it in a request will lead to an
+ * error. In order to a line-config to become useful, it needs to be assigned
+ * at least one offset-to-settings mapping by calling
+ * ::gpiod_line_config_add_line_settings.
+ *
+ * When calling ::gpiod_chip_request_lines, the library will request all
+ * offsets that were assigned settings in the order that they were assigned.
+ * If any of the offsets was duplicated, the last one will take precedence.
  */
-void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-					 size_t num_values,
-					 const unsigned int *offsets,
-					 const int *values);
 
 /**
- * @brief Clear the output value override for a line.
- * @param config Line config object.
- * @param offset The offset of the line for which to clear the override.
- * @note Does nothing if no override is set for the line.
+ * @brief Create a new line config object.
+ * @return New line config object or NULL on error.
  */
-void
-gpiod_line_config_clear_output_value_override(struct gpiod_line_config *config,
-					      unsigned int offset);
+struct gpiod_line_config *gpiod_line_config_new(void);
 
 /**
- * @brief Check if the output value is overridden for a line.
- * @param config Line config object.
- * @param offset The offset of the line to check for the override.
- * @return True if output value is overridden for the line, false otherwise.
+ * @brief Free the line config object and release all associated resources.
+ * @param config Line config object to free.
  */
-bool
-gpiod_line_config_output_value_is_overridden(struct gpiod_line_config *config,
-					     unsigned int offset);
+void gpiod_line_config_free(struct gpiod_line_config *config);
 
 /**
- * @brief Get the default output value.
- * @param config Line config object.
- * @return Output value for any non-overridden line.
+ * @brief Reset the line config object.
+ * @param config Line config object to free.
+ *
+ * Resets the entire configuration stored in the object. This is useful if
+ * the user wants to reuse the object without reallocating it.
  */
-int
-gpiod_line_config_get_output_value_default(struct gpiod_line_config *config);
+void gpiod_line_config_reset(struct gpiod_line_config *config);
 
 /**
- * @brief Get the configured output value for a line.
+ * @brief Add line settings for a set of offsets.
  * @param config Line config object.
- * @param offset Line offset for which to read the value.
- * @return Output value for the line if the config object were used in a
- *	   request.
- */
-int gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
-					      unsigned int offset);
-
-/**
- * @brief List of properties that can be stored in a line_config object.
- *
- * Used when retrieving the overrides.
+ * @param offsets Array of offsets for which to apply the settings.
+ * @param num_offsets Number of offsets stored in the offsets array.
+ * @param settings Line settings to apply.
+ * @return 0 on success, -1 on failure.
  */
-enum {
-	GPIOD_LINE_CONFIG_PROP_DIRECTION = 1,
-	/**< Line direction. */
-	GPIOD_LINE_CONFIG_PROP_EDGE_DETECTION,
-	/**< Edge detection. */
-	GPIOD_LINE_CONFIG_PROP_BIAS,
-	/**< Bias. */
-	GPIOD_LINE_CONFIG_PROP_DRIVE,
-	/**< Drive. */
-	GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW,
-	/**< Active-low setting. */
-	GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US,
-	/** Debounce period. */
-	GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK,
-	/**< Event clock type. */
-	GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE,
-	/**< Output value. */
-};
+int gpiod_line_config_add_line_settings(struct gpiod_line_config *config,
+					const unsigned int *offsets,
+					size_t num_offsets,
+					struct gpiod_line_settings *settings);
 
 /**
- * @brief Get the total number of overridden settings stored in the line config
- *	  object.
+ * @brief Get line settings for offset.
  * @param config Line config object.
- * @return Number of individual overridden settings.
+ * @param offset Offset for which to get line settings.
+ * @return New line settings object (must be freed by the caller) or NULL on
+ *         error.
  */
-size_t gpiod_line_config_get_num_overrides(struct gpiod_line_config *config);
+struct gpiod_line_settings *
+gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
+				    unsigned int offset);
 
 /**
- * @brief Get the list of overridden offsets and the corresponding types of
- *	  overridden settings.
+ * @brief Get configured offsets.
  * @param config Line config object.
- * @param offsets Array to store the overidden offsets. Must be sized to hold
- *		  the number of unsigned integers returned by
- *		  ::gpiod_line_config_get_num_overrides.
- * @param props Array to store the types of overridden settings. Must be sized
- *		to hold the number of integers returned by
- *		::gpiod_line_config_get_num_overrides.
- *
- * The overridden (offset, prop) pairs are stored in the \p offsets and
- * \p props arrays, with the pairs having the same index.
+ * @param num_offsets Pointer to a variable in which the number of line offsets
+ *                    will be stored.
+ * @param offsets Pointer to a pointer which will be set to point to an array
+ *                containing the configured offsets. The array will be allocated
+ *                using malloc() and must be freed using free().
+ * @return 0 on success, -1 on failure.
  */
-void
-gpiod_line_config_get_overrides(struct gpiod_line_config *config,
-				unsigned int *offsets, int *props);
+int gpiod_line_config_get_offsets(struct gpiod_line_config *config,
+				  size_t *num_offsets,
+				  unsigned int **offsets);
 
 /**
  * @}
@@ -1102,9 +775,9 @@ gpiod_line_config_get_overrides(struct gpiod_line_config *config,
  * Functions for manipulating request configuration objects.
  *
  * Request config objects are used to pass a set of options to the kernel at
- * the time of the line request. Similarly to the line-config - the mutators
- * don't return error values. If the values are invalid, in general they are
- * silently adjusted to acceptable ranges.
+ * the time of the line request. The mutators don't return error values. If the
+ * values are invalid, in general they are silently adjusted to acceptable
+ * ranges.
  */
 
 /**
@@ -1137,35 +810,6 @@ void gpiod_request_config_set_consumer(struct gpiod_request_config *config,
 const char *
 gpiod_request_config_get_consumer(struct gpiod_request_config *config);
 
-/**
- * @brief Set the offsets of the lines to be requested.
- * @param config Request config object.
- * @param num_offsets Number of offsets to set.
- * @param offsets Array of offsets, containing \p num_offsets entries.
- * @note If too many offsets were specified, the offsets above the limit
- *       accepted by the kernel (64 lines) are silently dropped.
- */
-void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				      size_t num_offsets,
-				      const unsigned int *offsets);
-
-/**
- * @brief Get the number of offsets configured in this request config.
- * @param config Request config object.
- * @return Number of line offsets in this request config.
- */
-size_t
-gpiod_request_config_get_num_offsets(struct gpiod_request_config *config);
-
-/**
- * @brief Get the offsets of lines in the request config.
- * @param config Request config object.
- * @param offsets Array to store offsets. Must be sized to hold the number of
- *		  lines returned by ::gpiod_request_config_get_num_offsets.
- */
-void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
-				      unsigned int *offsets);
-
 /**
  * @brief Set the size of the kernel event buffer for the request.
  * @param config Request config object.
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 1bd2b2e..dd90abd 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -11,6 +11,7 @@ libgpiod_la_SOURCES =	chip.c \
 			line-config.c \
 			line-info.c \
 			line-request.c \
+			line-settings.c \
 			misc.c \
 			request-config.c \
 			uapi/gpio.h
diff --git a/lib/chip.c b/lib/chip.c
index 4158533..e0fb309 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -192,12 +192,10 @@ gpiod_chip_request_lines(struct gpiod_chip *chip,
 
 	memset(&uapi_req, 0, sizeof(uapi_req));
 
-	ret = gpiod_request_config_to_uapi(req_cfg, &uapi_req);
-	if (ret)
-		return NULL;
+	if (req_cfg)
+		gpiod_request_config_to_uapi(req_cfg, &uapi_req);
 
-	ret = gpiod_line_config_to_uapi(line_cfg, &uapi_req.config,
-					uapi_req.num_lines, uapi_req.offsets);
+	ret = gpiod_line_config_to_uapi(line_cfg, &uapi_req);
 	if (ret)
 		return NULL;
 
diff --git a/lib/internal.h b/lib/internal.h
index 97731f9..eef70aa 100644
--- a/lib/internal.h
+++ b/lib/internal.h
@@ -13,9 +13,6 @@
 /* For internal library use only. */
 
 #define GPIOD_API	__attribute__((visibility("default")))
-#define GPIOD_PACKED	__attribute__((packed))
-#define GPIOD_UNUSED	__attribute__((unused))
-
 #define GPIOD_BIT(nr)	(1UL << (nr))
 
 bool gpiod_check_gpiochip_device(const char *path, bool set_errno);
@@ -24,12 +21,10 @@ struct gpiod_chip_info *
 gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info);
 struct gpiod_line_info *
 gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info);
-int gpiod_request_config_to_uapi(struct gpiod_request_config *config,
-				 struct gpio_v2_line_request *uapi_req);
+void gpiod_request_config_to_uapi(struct gpiod_request_config *config,
+				  struct gpio_v2_line_request *uapi_req);
 int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
-			      struct gpio_v2_line_config *uapi_cfg,
-			      unsigned int num_lines,
-			      const unsigned int *offsets);
+			      struct gpio_v2_line_request *uapi_cfg);
 struct gpiod_line_request *
 gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req);
 int gpiod_edge_event_buffer_read_fd(int fd, struct gpiod_edge_event_buffer *buffer,
diff --git a/lib/line-config.c b/lib/line-config.c
index 979b4c5..114d40c 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
-// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <errno.h>
 #include <gpiod.h>
@@ -8,78 +8,24 @@
 
 #include "internal.h"
 
-struct base_config {
-	unsigned int direction : 2;
-	unsigned int edge : 3;
-	unsigned int drive : 2;
-	unsigned int bias : 3;
-	bool active_low : 1;
-	unsigned int clock : 2;
-	unsigned long debounce_period_us;
-	unsigned int value : 1;
-} GPIOD_PACKED;
-
-#define OVERRIDE_FLAG_DIRECTION		GPIOD_BIT(0)
-#define OVERRIDE_FLAG_EDGE		GPIOD_BIT(1)
-#define OVERRIDE_FLAG_DRIVE		GPIOD_BIT(2)
-#define OVERRIDE_FLAG_BIAS		GPIOD_BIT(3)
-#define OVERRIDE_FLAG_ACTIVE_LOW	GPIOD_BIT(4)
-#define OVERRIDE_FLAG_CLOCK		GPIOD_BIT(5)
-#define OVERRIDE_FLAG_DEBOUNCE_PERIOD	GPIOD_BIT(6)
-#define OVERRIDE_FLAG_OUTPUT_VALUE	GPIOD_BIT(7)
-
-static const int override_flag_list[] = {
-	OVERRIDE_FLAG_DIRECTION,
-	OVERRIDE_FLAG_EDGE,
-	OVERRIDE_FLAG_BIAS,
-	OVERRIDE_FLAG_DRIVE,
-	OVERRIDE_FLAG_ACTIVE_LOW,
-	OVERRIDE_FLAG_DEBOUNCE_PERIOD,
-	OVERRIDE_FLAG_CLOCK,
-	OVERRIDE_FLAG_OUTPUT_VALUE
-};
+#define LINES_MAX (GPIO_V2_LINES_MAX)
 
-#define NUM_OVERRIDE_FLAGS		8
-#define NUM_OVERRIDES_MAX		(GPIO_V2_LINES_MAX)
+struct settings_node {
+	struct settings_node *next;
+	struct gpiod_line_settings *settings;
+};
 
-/*
- * Config overriding the defaults for a single line offset. Only flagged
- * settings are actually overriden for a line.
- */
-struct override_config {
-	struct base_config base;
+struct per_line_config {
 	unsigned int offset;
-	unsigned int override_flags : 8;
-} GPIOD_PACKED;
+	struct settings_node *node;
+};
 
 struct gpiod_line_config {
-	bool too_complex;
-	struct base_config defaults;
-	struct override_config overrides[NUM_OVERRIDES_MAX];
+	struct per_line_config line_configs[LINES_MAX];
+	size_t num_configs;
+	struct settings_node *sref_list;
 };
 
-static void init_base_config(struct base_config *config)
-{
-	config->direction = GPIOD_LINE_DIRECTION_AS_IS;
-	config->edge = GPIOD_LINE_EDGE_NONE;
-	config->bias = GPIOD_LINE_BIAS_AS_IS;
-	config->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
-	config->active_low = false;
-	config->clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
-	config->debounce_period_us = 0;
-}
-
-static void init_override_config(struct override_config *override)
-{
-	override->override_flags = 0;
-	init_base_config(&override->base);
-}
-
-static bool override_used(struct override_config *override)
-{
-	return !!override->override_flags;
-}
-
 GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 {
 	struct gpiod_line_config *config;
@@ -88,737 +34,258 @@ GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 	if (!config)
 		return NULL;
 
-	gpiod_line_config_reset(config);
+	memset(config, 0, sizeof(*config));
 
 	return config;
 }
 
+static void free_refs(struct gpiod_line_config *config)
+{
+	struct settings_node *node, *tmp;
+
+	for (node = config->sref_list; node;) {
+		tmp = node->next;
+		gpiod_line_settings_free(node->settings);
+		free(node);
+		node = tmp;
+	}
+}
+
 GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
 {
+	free_refs(config);
 	free(config);
 }
 
 GPIOD_API void gpiod_line_config_reset(struct gpiod_line_config *config)
 {
-	size_t i;
-
+	free_refs(config);
 	memset(config, 0, sizeof(*config));
-	init_base_config(&config->defaults);
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++)
-		init_override_config(&config->overrides[i]);
 }
 
-static struct override_config *
-get_override_by_offset(struct gpiod_line_config *config, unsigned int offset)
+static struct per_line_config *
+find_config(struct gpiod_line_config *config, unsigned int offset)
 {
-	struct override_config *override;
+	struct per_line_config *per_line;
 	size_t i;
 
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
+	for (i = 0; i < config->num_configs; i++) {
+		per_line = &config->line_configs[i];
 
-		if (override->offset == offset)
-			return override;
+		if (offset == per_line->offset)
+			return per_line;
 	}
 
-	return NULL;
+	return &config->line_configs[config->num_configs++];
 }
 
-static struct override_config *
-get_free_override(struct gpiod_line_config *config, unsigned int offset)
+GPIOD_API int
+gpiod_line_config_add_line_settings(struct gpiod_line_config *config,
+				    const unsigned int *offsets,
+				    size_t num_offsets,
+				    struct gpiod_line_settings *settings)
 {
-	struct override_config *override;
+	struct per_line_config *per_line;
+	struct settings_node *node;
 	size_t i;
 
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
-
-		if (override->override_flags)
-			continue;
-
-		override->offset = offset;
-		return override;
+	if ((config->num_configs + num_offsets) > LINES_MAX) {
+		errno = E2BIG;
+		return -1;
 	}
 
-	/* No more free overrides. */
-	config->too_complex = true;
-	return NULL;
-}
-
-static struct override_config *
-get_override_config_for_writing(struct gpiod_line_config *config,
-				unsigned int offset)
-{
-	struct override_config *override;
-
-	if (config->too_complex)
-		return NULL;
+	node = malloc(sizeof(*node));
+	if (!node)
+		return -1;
 
-	override = get_override_by_offset(config, offset);
-	if (!override) {
-		override = get_free_override(config, offset);
-		if (!override)
-			return NULL;
+	if (!settings)
+		node->settings = gpiod_line_settings_new();
+	else
+		node->settings = gpiod_line_settings_copy(settings);
+	if (!node->settings) {
+		free(node);
+		return -1;
 	}
 
-	return override;
-}
-
-static struct base_config *
-get_base_config_for_reading(struct gpiod_line_config *config,
-			    unsigned int offset, unsigned int flag)
-{
-	struct override_config *override;
+	node->next = config->sref_list;
+	config->sref_list = node;
 
-	override = get_override_by_offset(config, offset);
-	if (override && (override->override_flags & flag))
-		return &override->base;
+	for (i = 0; i < num_offsets; i++) {
+		per_line = find_config(config, offsets[i]);
 
-	return &config->defaults;
-}
-
-static void clear_override(struct gpiod_line_config *config,
-			   unsigned int offset, int flag)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
-
-	if (override->override_flags & flag) {
-		override->override_flags &= ~flag;
-
-		if (!override->override_flags)
-			init_override_config(override);
+		per_line->offset = offsets[i];
+		per_line->node = node;
 	}
-}
-
-static bool check_override(struct gpiod_line_config *config,
-			   unsigned int offset, int flag)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return false;
 
-	return override->override_flags & flag;
-}
-
-static void set_direction(struct base_config *config, int direction)
-{
-	switch (direction) {
-	case GPIOD_LINE_DIRECTION_INPUT:
-	case GPIOD_LINE_DIRECTION_OUTPUT:
-	case GPIOD_LINE_DIRECTION_AS_IS:
-		config->direction = direction;
-		break;
-	default:
-		config->direction = GPIOD_LINE_DIRECTION_AS_IS;
-		break;
-	}
-}
-
-GPIOD_API void
-gpiod_line_config_set_direction_default(struct gpiod_line_config *config,
-					int direction)
-{
-	set_direction(&config->defaults, direction);
-}
-
-GPIOD_API void
-gpiod_line_config_set_direction_override(struct gpiod_line_config *config,
-				       int direction, unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
-
-	set_direction(&override->base, direction);
-	override->override_flags |= OVERRIDE_FLAG_DIRECTION;
-}
-
-GPIOD_API void
-gpiod_line_config_clear_direction_override(struct gpiod_line_config *config,
-					   unsigned int offset)
-{
-	clear_override(config, offset, OVERRIDE_FLAG_DIRECTION);
-}
-
-GPIOD_API bool
-gpiod_line_config_direction_is_overridden(struct gpiod_line_config *config,
-					 unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_DIRECTION);
-}
-
-GPIOD_API int
-gpiod_line_config_get_direction_default(struct gpiod_line_config *config)
-{
-	return config->defaults.direction;
+	return 0;
 }
 
-GPIOD_API int
-gpiod_line_config_get_direction_offset(struct gpiod_line_config *config,
-				       unsigned int offset)
+GPIOD_API struct gpiod_line_settings *
+gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
+				    unsigned int offset)
 {
-	struct base_config *base;
-
-	base = get_base_config_for_reading(config, offset,
-					   OVERRIDE_FLAG_DIRECTION);
+	struct per_line_config *per_line;
+	size_t i;
 
-	return base->direction;
-}
+	for (i = 0; i < config->num_configs; i++) {
+		per_line = &config->line_configs[i];
 
-static void set_edge_detection(struct base_config *config, int edge)
-{
-	switch (edge) {
-	case GPIOD_LINE_EDGE_NONE:
-	case GPIOD_LINE_EDGE_RISING:
-	case GPIOD_LINE_EDGE_FALLING:
-	case GPIOD_LINE_EDGE_BOTH:
-		config->edge = edge;
-		break;
-	default:
-		config->edge = GPIOD_LINE_EDGE_NONE;
-		break;
+		if (per_line->offset == offset)
+			return gpiod_line_settings_copy(
+					per_line->node->settings);
 	}
-}
-
-GPIOD_API void
-gpiod_line_config_set_edge_detection_default(struct gpiod_line_config *config,
-					     int edge)
-{
-	set_edge_detection(&config->defaults, edge);
-}
-
-GPIOD_API void
-gpiod_line_config_set_edge_detection_override(struct gpiod_line_config *config,
-					      int edge, unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
-
-	set_edge_detection(&override->base, edge);
-	override->override_flags |= OVERRIDE_FLAG_EDGE;
-}
-
-GPIOD_API void
-gpiod_line_config_clear_edge_detection_override(
-			struct gpiod_line_config *config, unsigned int offset)
-{
-	clear_override(config, offset, OVERRIDE_FLAG_EDGE);
-}
 
-GPIOD_API bool
-gpiod_line_config_edge_detection_is_overridden(struct gpiod_line_config *config,
-					      unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_EDGE);
-}
-
-GPIOD_API int
-gpiod_line_config_get_edge_detection_default(struct gpiod_line_config *config)
-{
-	return config->defaults.edge;
+	errno = ENOENT;
+	return NULL;
 }
 
 GPIOD_API int
-gpiod_line_config_get_edge_detection_offset(struct gpiod_line_config *config,
-					    unsigned int offset)
+gpiod_line_config_get_offsets(struct gpiod_line_config *config,
+			      size_t *num_offsets,
+			      unsigned int **offsets)
 {
-	struct base_config *base;
+	unsigned int *offs;
+	size_t i;
 
-	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_EDGE);
+	*num_offsets = config->num_configs;
+	*offsets = NULL;
 
-	return base->edge;
-}
+	if (!config->num_configs)
+		return 0;
 
-static void set_bias(struct base_config *config, int bias)
-{
-	switch (bias) {
-	case GPIOD_LINE_BIAS_AS_IS:
-	case GPIOD_LINE_BIAS_DISABLED:
-	case GPIOD_LINE_BIAS_PULL_UP:
-	case GPIOD_LINE_BIAS_PULL_DOWN:
-		config->bias = bias;
-		break;
-	default:
-		config->bias = GPIOD_LINE_BIAS_AS_IS;
-		break;
-	}
-}
-
-GPIOD_API void
-gpiod_line_config_set_bias_default(struct gpiod_line_config *config, int bias)
-{
-	set_bias(&config->defaults, bias);
-}
+	offs = calloc(config->num_configs, sizeof(unsigned int));
+	if (!offs)
+		return -1;
 
-GPIOD_API void
-gpiod_line_config_set_bias_override(struct gpiod_line_config *config,
-				  int bias, unsigned int offset)
-{
-	struct override_config *override;
+	for (i = 0; i < config->num_configs; i++)
+		offs[i] = config->line_configs[i].offset;
 
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
+	*offsets = offs;
 
-	set_bias(&override->base, bias);
-	override->override_flags |= OVERRIDE_FLAG_BIAS;
+	return 0;
 }
 
-GPIOD_API void
-gpiod_line_config_clear_bias_override(struct gpiod_line_config *config,
-				      unsigned int offset)
+static void set_offsets(struct gpiod_line_config *config,
+			struct gpio_v2_line_request *uapi_cfg)
 {
-	clear_override(config, offset, OVERRIDE_FLAG_BIAS);
-}
+	size_t i;
 
-GPIOD_API bool
-gpiod_line_config_bias_is_overridden(struct gpiod_line_config *config,
-				     unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_BIAS);
-}
+	uapi_cfg->num_lines = config->num_configs;
 
-GPIOD_API int
-gpiod_line_config_get_bias_default(struct gpiod_line_config *config)
-{
-	return config->defaults.bias;
+	for (i = 0; i < config->num_configs; i++)
+		uapi_cfg->offsets[i] = config->line_configs[i].offset;
 }
 
-GPIOD_API int
-gpiod_line_config_get_bias_offset(struct gpiod_line_config *config,
-				  unsigned int offset)
+static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
 {
-	struct base_config *base;
-
-	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_BIAS);
-
-	return base->bias;
-}
+	size_t i;
 
-static void set_drive(struct base_config *config, int drive)
-{
-	switch (drive) {
-	case GPIOD_LINE_DRIVE_PUSH_PULL:
-	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
-	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
-		config->drive = drive;
-		break;
-	default:
-		config->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
-		break;
+	for (i = 0; i < config->num_configs; i++) {
+		if (gpiod_line_settings_get_direction(
+				config->line_configs[i].node->settings) ==
+		    GPIOD_LINE_DIRECTION_OUTPUT)
+			return true;
 	}
-}
-
-GPIOD_API void
-gpiod_line_config_set_drive_default(struct gpiod_line_config *config, int drive)
-{
-	set_drive(&config->defaults, drive);
-}
-
-GPIOD_API void
-gpiod_line_config_set_drive_override(struct gpiod_line_config *config,
-				     int drive, unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
-
-	set_drive(&override->base, drive);
-	override->override_flags |= OVERRIDE_FLAG_DRIVE;
-}
-
-GPIOD_API void
-gpiod_line_config_clear_drive_override(struct gpiod_line_config *config,
-				       unsigned int offset)
-{
-	clear_override(config, offset, OVERRIDE_FLAG_DRIVE);
-}
-
-GPIOD_API bool
-gpiod_line_config_drive_is_overridden(struct gpiod_line_config *config,
-				      unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_DRIVE);
-}
-
-GPIOD_API int
-gpiod_line_config_get_drive_default(struct gpiod_line_config *config)
-{
-	return config->defaults.drive;
-}
-
-GPIOD_API int
-gpiod_line_config_get_drive_offset(struct gpiod_line_config *config,
-				   unsigned int offset)
-{
-	struct base_config *base;
-
-	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_DRIVE);
-
-	return base->drive;
-}
-
-GPIOD_API void
-gpiod_line_config_set_active_low_default(struct gpiod_line_config *config,
-					 bool active_low)
-{
-	config->defaults.active_low = active_low;
-}
-
-GPIOD_API void
-gpiod_line_config_set_active_low_override(struct gpiod_line_config *config,
-					  bool active_low,
-					  unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
-
-	override->base.active_low = active_low;
-	override->override_flags |= OVERRIDE_FLAG_ACTIVE_LOW;
-}
-
-GPIOD_API void
-gpiod_line_config_clear_active_low_override(struct gpiod_line_config *config,
-					    unsigned int offset)
-{
-	clear_override(config, offset, OVERRIDE_FLAG_ACTIVE_LOW);
-}
-
-GPIOD_API bool
-gpiod_line_config_active_low_is_overridden(struct gpiod_line_config *config,
-					   unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_ACTIVE_LOW);
-}
-
-GPIOD_API bool
-gpiod_line_config_get_active_low_default(struct gpiod_line_config *config)
-{
-	return config->defaults.active_low;
-}
-
-GPIOD_API bool
-gpiod_line_config_get_active_low_offset(struct gpiod_line_config *config,
-					unsigned int offset)
-{
-	struct base_config *base;
-
-	base = get_base_config_for_reading(config, offset,
-					   OVERRIDE_FLAG_ACTIVE_LOW);
-
-	return base->active_low;
-}
-
-GPIOD_API void
-gpiod_line_config_set_debounce_period_us_default(
-		struct gpiod_line_config *config, unsigned long period)
-{
-	config->defaults.debounce_period_us = period;
-}
-
-GPIOD_API void
-gpiod_line_config_set_debounce_period_us_override(
-					struct gpiod_line_config *config,
-					unsigned long period,
-					unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
 
-	override->base.debounce_period_us = period;
-	override->override_flags |= OVERRIDE_FLAG_DEBOUNCE_PERIOD;
-}
-
-GPIOD_API void gpiod_line_config_clear_debounce_period_us_override(
-					struct gpiod_line_config *config,
-					unsigned int offset)
-{
-	clear_override(config, offset, OVERRIDE_FLAG_DEBOUNCE_PERIOD);
-}
-
-GPIOD_API bool gpiod_line_config_debounce_period_us_is_overridden(
-					struct gpiod_line_config *config,
-					unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_DEBOUNCE_PERIOD);
+	return false;
 }
 
-GPIOD_API unsigned long
-gpiod_line_config_get_debounce_period_us_default(
-					struct gpiod_line_config *config)
+static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
+				     struct gpiod_line_config *config)
 {
-	return config->defaults.debounce_period_us;
-}
+	struct per_line_config *per_line;
+	int value;
+	size_t i;
 
-GPIOD_API unsigned long
-gpiod_line_config_get_debounce_period_us_offset(
-			struct gpiod_line_config *config, unsigned int offset)
-{
-	struct base_config *base;
+	gpiod_line_mask_zero(mask);
+	gpiod_line_mask_zero(vals);
 
-	base = get_base_config_for_reading(config, offset,
-					   OVERRIDE_FLAG_DEBOUNCE_PERIOD);
+	for (i = 0; i < config->num_configs; i++) {
+		per_line = &config->line_configs[i];
 
-	return base->debounce_period_us;
-}
+		if (gpiod_line_settings_get_direction(
+				per_line->node->settings) !=
+		    GPIOD_LINE_DIRECTION_OUTPUT)
+			continue;
 
-static void set_event_clock(struct base_config *config, int clock)
-{
-	switch (clock) {
-	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
-	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
-		config->clock = clock;
-		break;
-	default:
-		config->clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
-		break;
+		gpiod_line_mask_set_bit(mask, i);
+		value = gpiod_line_settings_get_output_value(
+						per_line->node->settings);
+		gpiod_line_mask_assign_bit(vals, i,
+				value == GPIOD_LINE_VALUE_ACTIVE ? 1 : 0);
 	}
 }
 
-GPIOD_API void
-gpiod_line_config_set_event_clock_default(struct gpiod_line_config *config,
-					  int clock)
-{
-	set_event_clock(&config->defaults, clock);
-}
-
-GPIOD_API void
-gpiod_line_config_set_event_clock_override(struct gpiod_line_config *config,
-					   int clock, unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
-		return;
-
-	set_event_clock(&override->base, clock);
-	override->override_flags |= OVERRIDE_FLAG_CLOCK;
-}
-
-GPIOD_API void
-gpiod_line_config_clear_event_clock_override(struct gpiod_line_config *config,
-					     unsigned int offset)
+static void set_output_values(struct gpiod_line_config *config,
+			      struct gpio_v2_line_request *uapi_cfg,
+			      unsigned int *attr_idx)
 {
-	clear_override(config, offset, OVERRIDE_FLAG_CLOCK);
-}
-
-GPIOD_API bool
-gpiod_line_config_event_clock_is_overridden(struct gpiod_line_config *config,
-					    unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_CLOCK);
-}
-
-GPIOD_API int
-gpiod_line_config_get_event_clock_default(struct gpiod_line_config *config)
-{
-	return config->defaults.clock;
-}
-
-GPIOD_API int
-gpiod_line_config_get_event_clock_offset(struct gpiod_line_config *config,
-					 unsigned int offset)
-{
-	struct base_config *base;
-
-	base = get_base_config_for_reading(config, offset, OVERRIDE_FLAG_CLOCK);
-
-	return base->clock;
-}
-
-GPIOD_API void
-gpiod_line_config_set_output_value_default(struct gpiod_line_config *config,
-					   int value)
-{
-	config->defaults.value = value;
-}
-
-GPIOD_API void
-gpiod_line_config_set_output_value_override(struct gpiod_line_config *config,
-					    int value, unsigned int offset)
-{
-	struct override_config *override;
+	struct gpio_v2_line_config_attribute *attr;
+	uint64_t mask, values;
 
-	override = get_override_config_for_writing(config, offset);
-	if (!override)
+	if (!has_at_least_one_output_direction(config))
 		return;
 
-	override->base.value = !!value;
-	override->override_flags |= OVERRIDE_FLAG_OUTPUT_VALUE;
+	attr = &uapi_cfg->config.attrs[(*attr_idx)++];
+	attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
+	set_kernel_output_values(&mask, &values, config);
+	attr->attr.values = values;
+	attr->mask = mask;
 }
 
-GPIOD_API void
-gpiod_line_config_set_output_values(struct gpiod_line_config *config,
-				    size_t num_values,
-				    const unsigned int *offsets,
-				    const int *values)
+static int set_debounce_periods(struct gpiod_line_config *config,
+				struct gpio_v2_line_config *uapi_cfg,
+				unsigned int *attr_idx)
 {
-	size_t i;
-
-	for (i = 0; i < num_values; i++)
-		gpiod_line_config_set_output_value_override(config,
-							    values[i],
-							    offsets[i]);
-}
-
-GPIOD_API void
-gpiod_line_config_clear_output_value_override(struct gpiod_line_config *config,
-					      unsigned int offset)
-{
-	clear_override(config, offset, OVERRIDE_FLAG_OUTPUT_VALUE);
-}
-
-GPIOD_API bool
-gpiod_line_config_output_value_is_overridden(struct gpiod_line_config *config,
-					     unsigned int offset)
-{
-	return check_override(config, offset, OVERRIDE_FLAG_OUTPUT_VALUE);
-}
-
-GPIOD_API int
-gpiod_line_config_get_output_value_default(struct gpiod_line_config *config)
-{
-	return config->defaults.value;
-}
-
-GPIOD_API int
-gpiod_line_config_get_output_value_offset(struct gpiod_line_config *config,
-					  unsigned int offset)
-{
-	struct override_config *override;
-
-	override = get_override_by_offset(config, offset);
-	if (override && (override->override_flags & OVERRIDE_FLAG_OUTPUT_VALUE))
-		return override->base.value;
-
-	return config->defaults.value;
-}
+	struct gpio_v2_line_config_attribute *attr;
+	unsigned long period_i, period_j;
+	uint64_t done, mask;
+	size_t i, j;
 
-static bool base_config_flags_are_equal(struct base_config *base,
-					struct override_config *override)
-{
-	if (((override->override_flags & OVERRIDE_FLAG_DIRECTION) &&
-	     base->direction != override->base.direction) ||
-	    ((override->override_flags & OVERRIDE_FLAG_EDGE) &&
-	     base->edge != override->base.edge) ||
-	    ((override->override_flags & OVERRIDE_FLAG_DRIVE) &&
-	     base->drive != override->base.drive) ||
-	    ((override->override_flags & OVERRIDE_FLAG_BIAS) &&
-	     base->bias != override->base.bias) ||
-	    ((override->override_flags & OVERRIDE_FLAG_ACTIVE_LOW) &&
-	     base->active_low != override->base.active_low) ||
-	    ((override->override_flags & OVERRIDE_FLAG_CLOCK) &&
-	     base->clock != override->base.clock))
-		return false;
+	gpiod_line_mask_zero(&done);
 
-	return true;
-}
-
-static bool base_debounce_period_is_equal(struct base_config *base,
-					  struct override_config *override)
-{
-	if ((override->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) &&
-	    base->debounce_period_us != override->base.debounce_period_us)
-		return false;
+	for (i = 0; i < config->num_configs; i++) {
+		if (gpiod_line_mask_test_bit(&done, i))
+			continue;
 
-	return true;
-}
+		gpiod_line_mask_set_bit(&done, i);
+		gpiod_line_mask_zero(&mask);
 
-GPIOD_API size_t
-gpiod_line_config_get_num_overrides(struct gpiod_line_config *config)
-{
-	struct override_config *override;
-	size_t i, j, count = 0;
+		period_i = gpiod_line_settings_get_debounce_period_us(
+				config->line_configs[i].node->settings);
+		if (!period_i)
+			continue;
 
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
+		if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
+			errno = E2BIG;
+			return -1;
+		}
 
-		if (override_used(override)) {
-			for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
-				if (override->override_flags &
-				    override_flag_list[j])
-					count++;
+		attr = &uapi_cfg->attrs[(*attr_idx)++];
+		attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		attr->attr.debounce_period_us = period_i;
+		gpiod_line_mask_set_bit(&mask, i);
+
+		for (j = i; j < config->num_configs; j++) {
+			period_j = gpiod_line_settings_get_debounce_period_us(
+					config->line_configs[j].node->settings);
+			if (period_i == period_j) {
+				gpiod_line_mask_set_bit(&mask, j);
+				gpiod_line_mask_set_bit(&done, j);
 			}
 		}
-	}
 
-	return count;
-}
-
-static int override_flag_to_prop(int flag)
-{
-	switch (flag) {
-	case OVERRIDE_FLAG_DIRECTION:
-		return GPIOD_LINE_CONFIG_PROP_DIRECTION;
-	case OVERRIDE_FLAG_EDGE:
-		return GPIOD_LINE_CONFIG_PROP_EDGE_DETECTION;
-	case OVERRIDE_FLAG_BIAS:
-		return GPIOD_LINE_CONFIG_PROP_BIAS;
-	case OVERRIDE_FLAG_DRIVE:
-		return GPIOD_LINE_CONFIG_PROP_DRIVE;
-	case OVERRIDE_FLAG_ACTIVE_LOW:
-		return GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW;
-	case OVERRIDE_FLAG_DEBOUNCE_PERIOD:
-		return GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US;
-	case OVERRIDE_FLAG_CLOCK:
-		return GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK;
-	case OVERRIDE_FLAG_OUTPUT_VALUE:
-		return GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE;
+		attr->mask = mask;
 	}
 
-	/* Can't happen. */
-	return -1;
-}
-
-GPIOD_API void
-gpiod_line_config_get_overrides(struct gpiod_line_config *config,
-				unsigned int *offsets, int *props)
-{
-	struct override_config *override;
-	size_t i, j, count = 0;
-
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
-
-		if (override_used(override)) {
-			for (j = 0; j < NUM_OVERRIDE_FLAGS; j++) {
-				if (override->override_flags &
-				    override_flag_list[j]) {
-					offsets[count] = override->offset;
-					props[count] = override_flag_to_prop(
-							override_flag_list[j]);
-					count++;
-				}
-			}
-		}
-	}
+	return 0;
 }
 
-static uint64_t make_kernel_flags(const struct base_config *config)
+static uint64_t make_kernel_flags(struct gpiod_line_settings *settings)
 {
 	uint64_t flags = 0;
 
-	switch (config->direction) {
+	switch (gpiod_line_settings_get_direction(settings)) {
 	case GPIOD_LINE_DIRECTION_INPUT:
 		flags |= GPIO_V2_LINE_FLAG_INPUT;
 		break;
@@ -827,7 +294,7 @@ static uint64_t make_kernel_flags(const struct base_config *config)
 		break;
 	}
 
-	switch (config->edge) {
+	switch (gpiod_line_settings_get_edge_detection(settings)) {
 	case GPIOD_LINE_EDGE_FALLING:
 		flags |= (GPIO_V2_LINE_FLAG_EDGE_FALLING |
 			   GPIO_V2_LINE_FLAG_INPUT);
@@ -846,7 +313,7 @@ static uint64_t make_kernel_flags(const struct base_config *config)
 		break;
 	}
 
-	switch (config->drive) {
+	switch (gpiod_line_settings_get_drive(settings)) {
 	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
 		flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 		break;
@@ -855,7 +322,7 @@ static uint64_t make_kernel_flags(const struct base_config *config)
 		break;
 	}
 
-	switch (config->bias) {
+	switch (gpiod_line_settings_get_bias(settings)) {
 	case GPIOD_LINE_BIAS_DISABLED:
 		flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
 		break;
@@ -867,10 +334,10 @@ static uint64_t make_kernel_flags(const struct base_config *config)
 		break;
 	}
 
-	if (config->active_low)
+	if (gpiod_line_settings_get_active_low(settings))
 		flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
 
-	switch (config->clock) {
+	switch (gpiod_line_settings_get_event_clock(settings)) {
 	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
 		flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 		break;
@@ -879,341 +346,113 @@ static uint64_t make_kernel_flags(const struct base_config *config)
 	return flags;
 }
 
-static int find_bitmap_index(unsigned int needle, unsigned int num_lines,
-			     const unsigned int *haystack)
+static bool settings_equal(struct gpiod_line_settings *left,
+			 struct gpiod_line_settings *right)
 {
-	size_t i;
-
-	for (i = 0; i < num_lines; i++) {
-		if (needle == haystack[i])
-			return i;
-	}
-
-	return -1;
-}
-
-static void set_kernel_output_values(uint64_t *mask, uint64_t *vals,
-				     struct gpiod_line_config *config,
-				     unsigned int num_lines,
-				     const unsigned int *offsets)
-{
-	struct override_config *override;
-	size_t i;
-	int idx;
-
-	gpiod_line_mask_zero(mask);
-	gpiod_line_mask_zero(vals);
-
-	if (config->defaults.direction == GPIOD_LINE_DIRECTION_OUTPUT) {
-		/*
-		 * Default direction is output - assign the default output
-		 * value to all lines. Overrides that may set some lines to
-		 * input will be handled later and may re-assign the output
-		 * values.
-		 */
-		for (i = 0; i < num_lines; i++) {
-			gpiod_line_mask_set_bit(mask, i);
-			gpiod_line_mask_assign_bit(vals, i,
-						   config->defaults.value);
-		}
-	} else {
-		/*
-		 * Default output value is not output. Iterate over overrides
-		 * and set the default output value for those that override the
-		 * direction to output. Don't touch the ones which override
-		 * the output value.
-		 */
-		for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-			override = &config->overrides[i];
-
-			if (override->base.direction !=
-			    GPIOD_LINE_DIRECTION_OUTPUT ||
-			    !(override->override_flags &
-			      OVERRIDE_FLAG_DIRECTION) ||
-			    (override->override_flags &
-			     OVERRIDE_FLAG_OUTPUT_VALUE))
-				continue;
-
-			idx = find_bitmap_index(override->offset,
-						num_lines, offsets);
-			if (idx < 0)
-				continue;
-
-			gpiod_line_mask_set_bit(mask, idx);
-			gpiod_line_mask_assign_bit(vals, idx,
-						   !!config->defaults.value);
-		}
-	}
-
-	/*
-	 * Finally iterate over the overrides again and set the overridden
-	 * output values.
-	 */
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
-
-		if (!(override->override_flags & OVERRIDE_FLAG_OUTPUT_VALUE))
-			continue;
-
-		if (config->defaults.direction != GPIOD_LINE_DIRECTION_OUTPUT &&
-		    (!(override->override_flags & OVERRIDE_FLAG_DIRECTION) ||
-		     override->base.direction != GPIOD_LINE_DIRECTION_OUTPUT))
-			continue;
-
-		idx = find_bitmap_index(override->offset, num_lines, offsets);
-		if (idx < 0)
-			continue;
-
-		gpiod_line_mask_set_bit(mask, idx);
-		gpiod_line_mask_assign_bit(vals, idx, !!override->base.value);
-	}
-}
-
-static bool override_config_flags_are_equal(struct override_config *a,
-					    struct override_config *b)
-{
-	if (((a->override_flags & ~OVERRIDE_FLAG_DEBOUNCE_PERIOD) ==
-	     (b->override_flags & ~OVERRIDE_FLAG_DEBOUNCE_PERIOD)) &&
-	    base_config_flags_are_equal(&a->base, b))
-		return true;
-
-	return false;
-}
-
-static void set_base_config_flags(struct gpio_v2_line_attribute *attr,
-				  struct override_config *override,
-				  struct gpiod_line_config *config)
-{
-	struct base_config base;
-
-	memcpy(&base, &config->defaults, sizeof(base));
-
-	if (override->override_flags & OVERRIDE_FLAG_DIRECTION)
-		base.direction = override->base.direction;
-	if (override->override_flags & OVERRIDE_FLAG_EDGE)
-		base.edge = override->base.edge;
-	if (override->override_flags & OVERRIDE_FLAG_BIAS)
-		base.bias = override->base.bias;
-	if (override->override_flags & OVERRIDE_FLAG_DRIVE)
-		base.drive = override->base.drive;
-	if (override->override_flags & OVERRIDE_FLAG_ACTIVE_LOW)
-		base.active_low = override->base.active_low;
-	if (override->override_flags & OVERRIDE_FLAG_CLOCK)
-		base.clock = override->base.clock;
-
-	attr->id = GPIO_V2_LINE_ATTR_ID_FLAGS;
-	attr->flags = make_kernel_flags(&base);
-}
-
-static bool override_config_debounce_period_is_equal(struct override_config *a,
-						     struct override_config *b)
-{
-	if (base_debounce_period_is_equal(&a->base, b) &&
-	    ((a->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD) ==
-	     (b->override_flags & OVERRIDE_FLAG_DEBOUNCE_PERIOD)))
-		return true;
-
-	return false;
-}
-
-static void
-set_base_config_debounce_period(struct gpio_v2_line_attribute *attr,
-				struct override_config *override,
-				struct gpiod_line_config *config GPIOD_UNUSED)
-{
-	attr->id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
-	attr->debounce_period_us = override->base.debounce_period_us;
-}
-
-static void set_kernel_attr_mask(uint64_t *out, const uint64_t *in,
-				 unsigned int num_lines,
-				 const unsigned int *offsets,
-				 struct gpiod_line_config *config)
-{
-	struct override_config *override;
-	size_t i, j;
-	int idx;
+	if (gpiod_line_settings_get_direction(left) !=
+	    gpiod_line_settings_get_direction(right))
+		return false;
 
-	gpiod_line_mask_zero(out);
+	if (gpiod_line_settings_get_edge_detection(left) !=
+	    gpiod_line_settings_get_edge_detection(right))
+		return false;
 
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
+	if (gpiod_line_settings_get_bias(left) !=
+	    gpiod_line_settings_get_bias(right))
+		return false;
 
-		if (!override_used(override) ||
-		    !gpiod_line_mask_test_bit(in, i))
-			continue;
+	if (gpiod_line_settings_get_drive(left) !=
+	    gpiod_line_settings_get_drive(right))
+		return false;
 
-		for (j = 0, idx = -1; j < num_lines; j++) {
-			if (offsets[j] == override->offset) {
-				idx = j;
-				break;
-			}
-		}
+	if (gpiod_line_settings_get_active_low(left) !=
+	    gpiod_line_settings_get_active_low(right))
+		return false;
 
-		/*
-		 * Overridden offsets that are not in the list of offsets to
-		 * request (or already requested) are silently ignored.
-		 */
-		if (idx < 0)
-			continue;
+	if (gpiod_line_settings_get_event_clock(left) !=
+	    gpiod_line_settings_get_event_clock(right))
+		return false;
 
-		gpiod_line_mask_set_bit(out, idx);
-	}
+	return true;
 }
 
-static int process_overrides(struct gpiod_line_config *config,
-			     struct gpio_v2_line_config *uapi_cfg,
-			     unsigned int *attr_idx,
-			     unsigned int num_lines,
-			     const unsigned int *offsets,
-			     bool (*defaults_equal_func)(struct base_config *,
-						struct override_config *),
-			     bool (*override_equal_func)(
-						struct override_config *,
-						struct override_config *),
-			     void (*set_func)(struct gpio_v2_line_attribute *,
-					      struct override_config *,
-					      struct gpiod_line_config *))
+static int set_flags(struct gpiod_line_config *config,
+		     struct gpio_v2_line_config *uapi_cfg,
+		     unsigned int *attr_idx)
 {
+	struct gpiod_line_settings *settings_i, *settings_j;
 	struct gpio_v2_line_config_attribute *attr;
-	uint64_t processed = 0, marked = 0, mask;
-	struct override_config *current, *next;
+	bool globals_taken = false;
+	uint64_t done, mask;
 	size_t i, j;
 
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		current = &config->overrides[i];
+	gpiod_line_mask_zero(&done);
 
-		if (!override_used(current) ||
-		    gpiod_line_mask_test_bit(&processed, i))
+	for (i = 0; i < config->num_configs; i++) {
+		if (gpiod_line_mask_test_bit(&done, i))
 			continue;
 
-		if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
-			errno = E2BIG;
-			return -1;
-		}
+		gpiod_line_mask_set_bit(&done, i);
 
-		gpiod_line_mask_set_bit(&processed, i);
+		settings_i = config->line_configs[i].node->settings;
 
-		if (defaults_equal_func(&config->defaults, current))
-			continue;
+		if (!globals_taken) {
+			globals_taken = true;
+			uapi_cfg->flags = make_kernel_flags(settings_i);
 
-		marked = 0;
-		gpiod_line_mask_set_bit(&marked, i);
+			for (j = i; j < config->num_configs; j++) {
+				settings_j =
+					config->line_configs[j].node->settings;
+				if (settings_equal(settings_i, settings_j))
+					gpiod_line_mask_set_bit(&done, j);
+			}
+		} else {
+			gpiod_line_mask_zero(&mask);
+			gpiod_line_mask_set_bit(&mask, i);
 
-		for (j = i + 1; j < NUM_OVERRIDES_MAX; j++) {
-			next = &config->overrides[j];
+			if (*attr_idx == GPIO_V2_LINE_NUM_ATTRS_MAX) {
+				errno = E2BIG;
+				return -1;
+			}
 
-			if (!override_used(next) ||
-			    gpiod_line_mask_test_bit(&processed, j))
-				continue;
+			attr = &uapi_cfg->attrs[(*attr_idx)++];
+			attr->attr.id = GPIO_V2_LINE_ATTR_ID_FLAGS;
+			attr->attr.flags = make_kernel_flags(settings_i);
 
-			if (override_equal_func(current, next)) {
-				gpiod_line_mask_set_bit(&marked, j);
-				gpiod_line_mask_set_bit(&processed, j);
+			for (j = i; j < config->num_configs; j++) {
+				settings_j =
+					config->line_configs[j].node->settings;
+				if (settings_equal(settings_i, settings_j)) {
+					gpiod_line_mask_set_bit(&done, j);
+					gpiod_line_mask_set_bit(&mask, j);
+				}
 			}
-		}
-
-		attr = &uapi_cfg->attrs[(*attr_idx)++];
 
-		set_kernel_attr_mask(&mask, &marked,
-				     num_lines, offsets, config);
-		attr->mask = mask;
-		set_func(&attr->attr, current, config);
+			attr->mask = mask;
+		}
 	}
 
 	return 0;
 }
 
-static bool has_at_least_one_output_direction(struct gpiod_line_config *config)
-{
-	struct override_config *override;
-	size_t i;
-
-	if (config->defaults.direction == GPIOD_LINE_DIRECTION_OUTPUT)
-		return true;
-
-	for (i = 0; i < NUM_OVERRIDES_MAX; i++) {
-		override = &config->overrides[i];
-
-		if (override->base.direction == GPIOD_LINE_DIRECTION_OUTPUT)
-			return true;
-	}
-
-	return false;
-}
-
 int gpiod_line_config_to_uapi(struct gpiod_line_config *config,
-			      struct gpio_v2_line_config *uapi_cfg,
-			      unsigned int num_lines,
-			      const unsigned int *offsets)
+			      struct gpio_v2_line_request *uapi_cfg)
 {
-	struct gpio_v2_line_config_attribute *attr;
 	unsigned int attr_idx = 0;
-	uint64_t mask, values;
 	int ret;
 
-	if (config->too_complex)
-		goto err_2big;
-
-	/*
-	 * First check if we have at least one line configured in output mode.
-	 * If so, let's take one attribute for the default values.
-	 */
-	if (has_at_least_one_output_direction(config)) {
-		attr = &uapi_cfg->attrs[attr_idx++];
-		attr->attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
-
-		set_kernel_output_values(&mask, &values, config,
-					 num_lines, offsets);
-
-		attr->attr.values = values;
-		attr->mask = mask;
-
-	}
-
-	/* If we have a default debounce period - use another attribute. */
-	if (config->defaults.debounce_period_us) {
-		attr = &uapi_cfg->attrs[attr_idx++];
-		attr->attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
-		attr->attr.debounce_period_us =
-				config->defaults.debounce_period_us;
-		gpiod_line_mask_fill(&mask);
-		attr->mask = mask;
-	}
+	set_offsets(config, uapi_cfg);
+	set_output_values(config, uapi_cfg, &attr_idx);
 
-	/*
-	 * The overrides are processed independently for regular flags and the
-	 * debounce period. We iterate over the configured line overrides. We
-	 * first check if the given set of options is equal to the global
-	 * defaults. If not, we mark it and iterate over the remaining
-	 * overrides looking for ones that have the same config as the one
-	 * currently processed. We mark them too and at the end we create a
-	 * single kernel attribute with the translated config and the mask
-	 * corresponding to all marked overrides. Those are now excluded from
-	 * further processing.
-	 */
-
-	ret = process_overrides(config, uapi_cfg, &attr_idx, num_lines, offsets,
-				base_config_flags_are_equal,
-				override_config_flags_are_equal,
-				set_base_config_flags);
+	ret = set_debounce_periods(config, &uapi_cfg->config, &attr_idx);
 	if (ret)
 		return -1;
 
-	ret = process_overrides(config, uapi_cfg, &attr_idx, num_lines, offsets,
-				base_debounce_period_is_equal,
-				override_config_debounce_period_is_equal,
-				set_base_config_debounce_period);
+	ret = set_flags(config, &uapi_cfg->config, &attr_idx);
 	if (ret)
 		return -1;
 
-	uapi_cfg->flags = make_kernel_flags(&config->defaults);
-	uapi_cfg->num_attrs = attr_idx;
+	uapi_cfg->config.num_attrs = attr_idx;
 
 	return 0;
-
-err_2big:
-	config->too_complex = true;
-	errno = E2BIG;
-	return -1;
 }
diff --git a/lib/line-request.c b/lib/line-request.c
index 04bd78d..ee452e7 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -172,21 +172,42 @@ GPIOD_API int gpiod_line_request_set_values(struct gpiod_line_request *request,
 						    request->offsets, values);
 }
 
+static bool offsets_equal(struct gpiod_line_request *request,
+			  struct gpio_v2_line_request *uapi_cfg)
+{
+	size_t i;
+
+	if (request->num_lines != uapi_cfg->num_lines)
+		return false;
+
+	for (i = 0; i < request->num_lines; i++) {
+		if (request->offsets[i] != uapi_cfg->offsets[i])
+			return false;
+	}
+
+	return true;
+}
+
 GPIOD_API int
 gpiod_line_request_reconfigure_lines(struct gpiod_line_request *request,
 				     struct gpiod_line_config *config)
 {
-	struct gpio_v2_line_config uapi_cfg;
+	struct gpio_v2_line_request uapi_cfg;
 	int ret;
 
 	memset(&uapi_cfg, 0, sizeof(uapi_cfg));
 
-	ret = gpiod_line_config_to_uapi(config, &uapi_cfg,
-					request->num_lines, request->offsets);
+	ret = gpiod_line_config_to_uapi(config, &uapi_cfg);
 	if (ret)
 		return ret;
 
-	ret = ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL, &uapi_cfg);
+	if (!offsets_equal(request, &uapi_cfg)) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	ret = ioctl(request->fd, GPIO_V2_LINE_SET_CONFIG_IOCTL,
+		    &uapi_cfg.config);
 	if (ret)
 		return ret;
 
diff --git a/lib/line-settings.c b/lib/line-settings.c
new file mode 100644
index 0000000..7125124
--- /dev/null
+++ b/lib/line-settings.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <gpiod.h>
+#include <string.h>
+#include <stdlib.h>
+
+#include "internal.h"
+
+struct gpiod_line_settings {
+	int direction;
+	int edge_detection;
+	int drive;
+	int bias;
+	bool active_low;
+	int event_clock;
+	long debounce_period_us;
+	int output_value;
+};
+
+GPIOD_API struct gpiod_line_settings *gpiod_line_settings_new(void)
+{
+	struct gpiod_line_settings *settings;
+
+	settings = malloc(sizeof(*settings));
+	if (!settings)
+		return NULL;
+
+	gpiod_line_settings_reset(settings);
+
+	return settings;
+}
+
+GPIOD_API void gpiod_line_settings_free(struct gpiod_line_settings *settings)
+{
+	free(settings);
+}
+
+GPIOD_API void gpiod_line_settings_reset(struct gpiod_line_settings *settings)
+{
+	settings->direction = GPIOD_LINE_DIRECTION_AS_IS;
+	settings->edge_detection = GPIOD_LINE_EDGE_NONE;
+	settings->bias = GPIOD_LINE_BIAS_AS_IS;
+	settings->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
+	settings->active_low = false;
+	settings->debounce_period_us = 0;
+	settings->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+	settings->output_value = GPIOD_LINE_VALUE_INACTIVE;
+}
+
+GPIOD_API struct gpiod_line_settings *
+gpiod_line_settings_copy(struct gpiod_line_settings *settings)
+{
+	struct gpiod_line_settings *copy;
+
+	copy = malloc(sizeof(*copy));
+	if (!copy)
+		return NULL;
+
+	memcpy(copy, settings, sizeof(*copy));
+
+	return copy;
+}
+
+GPIOD_API int
+gpiod_line_settings_set_direction(struct gpiod_line_settings *settings,
+				  int direction)
+{
+	switch (direction) {
+	case GPIOD_LINE_DIRECTION_INPUT:
+	case GPIOD_LINE_DIRECTION_OUTPUT:
+	case GPIOD_LINE_DIRECTION_AS_IS:
+		settings->direction = direction;
+		break;
+	default:
+		settings->direction = GPIOD_LINE_DIRECTION_AS_IS;
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_settings_get_direction(struct gpiod_line_settings *settings)
+{
+	return settings->direction;
+}
+
+GPIOD_API int
+gpiod_line_settings_set_edge_detection(struct gpiod_line_settings *settings,
+				       int edge)
+{
+	switch (edge) {
+	case GPIOD_LINE_EDGE_NONE:
+	case GPIOD_LINE_EDGE_RISING:
+	case GPIOD_LINE_EDGE_FALLING:
+	case GPIOD_LINE_EDGE_BOTH:
+		settings->edge_detection = edge;
+		break;
+	default:
+		settings->edge_detection = GPIOD_LINE_EDGE_NONE;
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_settings_get_edge_detection(struct gpiod_line_settings *settings)
+{
+	return settings->edge_detection;
+}
+
+GPIOD_API int
+gpiod_line_settings_set_bias(struct gpiod_line_settings *settings, int bias)
+{
+	switch (bias) {
+	case GPIOD_LINE_BIAS_AS_IS:
+	case GPIOD_LINE_BIAS_DISABLED:
+	case GPIOD_LINE_BIAS_PULL_UP:
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		settings->bias = bias;
+		break;
+	default:
+		settings->bias = GPIOD_LINE_BIAS_AS_IS;
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int gpiod_line_settings_get_bias(struct gpiod_line_settings *settings)
+{
+	return settings->bias;
+}
+
+GPIOD_API int
+gpiod_line_settings_set_drive(struct gpiod_line_settings *settings, int drive)
+{
+	switch (drive) {
+	case GPIOD_LINE_DRIVE_PUSH_PULL:
+	case GPIOD_LINE_DRIVE_OPEN_DRAIN:
+	case GPIOD_LINE_DRIVE_OPEN_SOURCE:
+		settings->drive = drive;
+		break;
+	default:
+		settings->drive = GPIOD_LINE_DRIVE_PUSH_PULL;
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_settings_get_drive(struct gpiod_line_settings *settings)
+{
+	return settings->drive;
+}
+
+GPIOD_API void
+gpiod_line_settings_set_active_low(struct gpiod_line_settings *settings,
+				   bool active_low)
+{
+	settings->active_low = active_low;
+}
+
+GPIOD_API bool
+gpiod_line_settings_get_active_low(struct gpiod_line_settings *settings)
+{
+	return settings->active_low;
+}
+
+GPIOD_API void
+gpiod_line_settings_set_debounce_period_us(struct gpiod_line_settings *settings,
+					   unsigned long period)
+{
+	settings->debounce_period_us = period;
+}
+
+GPIOD_API unsigned long
+gpiod_line_settings_get_debounce_period_us(struct gpiod_line_settings *settings)
+{
+	return settings->debounce_period_us;
+}
+
+GPIOD_API int
+gpiod_line_settings_set_event_clock(struct gpiod_line_settings *settings,
+				    int event_clock)
+{
+	switch (event_clock) {
+	case GPIOD_LINE_EVENT_CLOCK_MONOTONIC:
+	case GPIOD_LINE_EVENT_CLOCK_REALTIME:
+		settings->event_clock = event_clock;
+		break;
+	default:
+		settings->event_clock = GPIOD_LINE_EVENT_CLOCK_MONOTONIC;
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_settings_get_event_clock(struct gpiod_line_settings *settings)
+{
+	return settings->event_clock;
+}
+
+GPIOD_API int
+gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
+				     int value)
+{
+	switch (value) {
+	case GPIOD_LINE_VALUE_INACTIVE:
+	case GPIOD_LINE_VALUE_ACTIVE:
+		settings->output_value = value;
+		break;
+	default:
+		settings->output_value = GPIOD_LINE_VALUE_INACTIVE;
+		errno = EINVAL;
+		return -1;
+	}
+
+	return 0;
+}
+
+GPIOD_API int
+gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings)
+{
+	return settings->output_value;
+}
diff --git a/lib/request-config.c b/lib/request-config.c
index 3a84106..22106e8 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -10,8 +10,6 @@
 
 struct gpiod_request_config {
 	char consumer[GPIO_MAX_NAME_SIZE];
-	unsigned int offsets[GPIO_V2_LINES_MAX];
-	size_t num_offsets;
 	size_t event_buffer_size;
 };
 
@@ -50,34 +48,6 @@ gpiod_request_config_get_consumer(struct gpiod_request_config *config)
 	return config->consumer[0] == '\0' ? NULL : config->consumer;
 }
 
-GPIOD_API void
-gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-				 size_t num_offsets,
-				 const unsigned int *offsets)
-{
-	size_t i;
-
-	config->num_offsets = num_offsets > GPIO_V2_LINES_MAX ?
-					GPIO_V2_LINES_MAX : num_offsets;
-
-	for (i = 0; i < config->num_offsets; i++)
-		config->offsets[i] = offsets[i];
-}
-
-GPIOD_API size_t
-gpiod_request_config_get_num_offsets(struct gpiod_request_config *config)
-{
-	return config->num_offsets;
-}
-
-GPIOD_API void
-gpiod_request_config_get_offsets(struct gpiod_request_config *config,
-				 unsigned int *offsets)
-{
-	memcpy(offsets, config->offsets,
-	       sizeof(*offsets) * config->num_offsets);
-}
-
 GPIOD_API void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
 					   size_t event_buffer_size)
@@ -91,22 +61,9 @@ gpiod_request_config_get_event_buffer_size(struct gpiod_request_config *config)
 	return config->event_buffer_size;
 }
 
-int gpiod_request_config_to_uapi(struct gpiod_request_config *config,
-				 struct gpio_v2_line_request *uapi_req)
+void gpiod_request_config_to_uapi(struct gpiod_request_config *config,
+				  struct gpio_v2_line_request *uapi_req)
 {
-	size_t i;
-
-	if (config->num_offsets == 0) {
-		errno = EINVAL;
-		return -1;
-	}
-
-	for (i = 0; i < config->num_offsets; i++)
-		uapi_req->offsets[i] = config->offsets[i];
-
-	uapi_req->num_lines = config->num_offsets;
 	strcpy(uapi_req->consumer, config->consumer);
 	uapi_req->event_buffer_size = config->event_buffer_size;
-
-	return 0;
 }
diff --git a/tests/Makefile.am b/tests/Makefile.am
index f37dc03..392f03c 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -29,5 +29,6 @@ gpiod_test_SOURCES =			\
 		tests-line-config.c	\
 		tests-line-info.c	\
 		tests-line-request.c	\
+		tests-line-settings.c	\
 		tests-misc.c		\
-		tests-request-config.c
+		tests-request-config.c
\ No newline at end of file
diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
index ca2c784..c3363bf 100644
--- a/tests/gpiod-test-helpers.h
+++ b/tests/gpiod-test-helpers.h
@@ -30,6 +30,10 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_info_event, gpiod_info_event_free);
 typedef struct gpiod_line_config struct_gpiod_line_config;
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_line_config, gpiod_line_config_free);
 
+typedef struct gpiod_line_settings struct_gpiod_line_settings;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_line_settings,
+			      gpiod_line_settings_free);
+
 typedef struct gpiod_request_config struct_gpiod_request_config;
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_request_config,
 			      gpiod_request_config_free);
@@ -84,6 +88,15 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 		_info; \
 	})
 
+#define gpiod_test_create_line_settings_or_fail() \
+	({ \
+		struct gpiod_line_settings *_settings = \
+				gpiod_line_settings_new(); \
+		g_assert_nonnull(_settings); \
+		gpiod_test_return_if_failed(); \
+		_settings; \
+	})
+
 #define gpiod_test_create_line_config_or_fail() \
 	({ \
 		struct gpiod_line_config *_config = \
@@ -102,6 +115,17 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
 		_buffer; \
 	})
 
+#define gpiod_test_line_config_add_line_settings_or_fail(_line_cfg, _offsets, \
+						_num_offsets, _settings) \
+	do { \
+		gint ret = gpiod_line_config_add_line_settings((_line_cfg), \
+							       (_offsets),  \
+							       (_num_offsets), \
+							       (_settings)); \
+		g_assert_cmpint(ret, ==, 0); \
+		gpiod_test_return_if_failed(); \
+	} while (0)
+
 #define gpiod_test_create_request_config_or_fail() \
 	({ \
 		struct gpiod_request_config *_config = \
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 987155f..66fe075 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -36,20 +36,20 @@ GPIOD_TEST_CASE(edge_event_wait_timeout)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	ret = gpiod_line_request_wait_edge_event(request, 1000000);
 	g_assert_cmpint(ret, ==, 0);
@@ -61,21 +61,22 @@ GPIOD_TEST_CASE(cannot_request_lines_in_output_mode_with_edge_detection)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
 	g_assert_null(request);
 	gpiod_test_expect_errno(EINVAL);
 }
@@ -101,7 +102,7 @@ GPIOD_TEST_CASE(read_both_events)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -111,17 +112,18 @@ GPIOD_TEST_CASE(read_both_events)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	thread = g_thread_new("request-release",
 			      falling_and_rising_edge_events, sim);
@@ -178,7 +180,7 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -187,17 +189,19 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_RISING);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_RISING);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	thread = g_thread_new("edge-generator",
 			      falling_and_rising_edge_events, sim);
@@ -236,7 +240,7 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -245,17 +249,19 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_FALLING);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_FALLING);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	thread = g_thread_new("request-release",
 			      falling_and_rising_edge_events, sim);
@@ -294,7 +300,7 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -305,17 +311,19 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	gint ret, fd;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_RISING);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_RISING);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	thread = g_thread_new("edge-generator",
 			      falling_and_rising_edge_events, sim);
@@ -368,7 +376,7 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -377,17 +385,18 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	thread = g_thread_new("request-release",
 			      falling_and_rising_edge_events, sim);
@@ -447,7 +456,7 @@ GPIOD_TEST_CASE(seqno)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -456,17 +465,18 @@ GPIOD_TEST_CASE(seqno)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	thread = g_thread_new("request-release",
 			      rising_edge_events_on_two_offsets, sim);
@@ -517,7 +527,7 @@ GPIOD_TEST_CASE(event_copy)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -527,17 +537,18 @@ GPIOD_TEST_CASE(event_copy)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
 
@@ -564,7 +575,7 @@ GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
@@ -572,17 +583,18 @@ GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 	buffer = gpiod_test_create_edge_event_buffer_or_fail(64);
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
 	g_usleep(500);
diff --git a/tests/tests-info-event.c b/tests/tests-info-event.c
index 3f18784..a960ba9 100644
--- a/tests/tests-info-event.c
+++ b/tests/tests-info-event.c
@@ -56,8 +56,9 @@ GPIOD_TEST_CASE(event_timeout)
 
 struct request_ctx {
 	struct gpiod_chip *chip;
-	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_config *line_cfg;
+	struct gpiod_line_settings *settings;
+	guint offset;
 };
 
 static gpointer request_reconfigure_release_line(gpointer data)
@@ -68,16 +69,24 @@ static gpointer request_reconfigure_release_line(gpointer data)
 
 	g_usleep(1000);
 
-	request = gpiod_chip_request_lines(ctx->chip,
-					   ctx->req_cfg, ctx->line_cfg);
+	ret = gpiod_line_config_add_line_settings(ctx->line_cfg, &ctx->offset,
+						  1, ctx->settings);
+	g_assert_cmpint(ret, ==, 0);
+	if (g_test_failed())
+		return NULL;
+
+	request = gpiod_chip_request_lines(ctx->chip, NULL, ctx->line_cfg);
 	g_assert_nonnull(request);
 	if (g_test_failed())
 		return NULL;
 
 	g_usleep(1000);
 
-	gpiod_line_config_set_direction_default(ctx->line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_reset(ctx->line_cfg);
+	gpiod_line_settings_set_direction(ctx->settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_config_add_line_settings(ctx->line_cfg, &ctx->offset, 1,
+					    ctx->settings);
 
 	ret = gpiod_line_request_reconfigure_lines(request, ctx->line_cfg);
 	g_assert_cmpint(ret, ==, 0);
@@ -94,16 +103,14 @@ static gpointer request_reconfigure_release_line(gpointer data)
 
 GPIOD_TEST_CASE(request_reconfigure_release_events)
 {
-	static const guint offset = 3;
-
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 	g_autoptr(struct_gpiod_info_event) request_event = NULL;
 	g_autoptr(struct_gpiod_info_event) reconfigure_event = NULL;
 	g_autoptr(struct_gpiod_info_event) release_event = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(GThread) thread = NULL;
 	struct gpiod_line_info *request_info, *reconfigure_info, *release_info;
 	guint64 request_ts, reconfigure_ts, release_ts;
@@ -111,10 +118,8 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
-
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	settings = gpiod_test_create_line_settings_or_fail();
 
 	info = gpiod_chip_watch_line_info(chip, 3);
 	g_assert_nonnull(info);
@@ -123,8 +128,9 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 	g_assert_false(gpiod_line_info_is_used(info));
 
 	ctx.chip = chip;
-	ctx.req_cfg = req_cfg;
 	ctx.line_cfg = line_cfg;
+	ctx.settings = settings;
+	ctx.offset = 3;
 
 	thread = g_thread_new("request-release",
 			      request_reconfigure_release_line, &ctx);
@@ -193,15 +199,13 @@ GPIOD_TEST_CASE(request_reconfigure_release_events)
 }
 
 GPIOD_TEST_CASE(chip_fd_can_be_polled)
-{
-	static const guint offset = 3;
-
+{\
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 	g_autoptr(struct_gpiod_info_event) event = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(GThread) thread = NULL;
 	struct gpiod_line_info *evinfo;
@@ -211,11 +215,9 @@ GPIOD_TEST_CASE(chip_fd_can_be_polled)
 	gint ret, fd;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-
 	info = gpiod_chip_watch_line_info(chip, 3);
 	g_assert_nonnull(info);
 	gpiod_test_return_if_failed();
@@ -223,8 +225,9 @@ GPIOD_TEST_CASE(chip_fd_can_be_polled)
 	g_assert_false(gpiod_line_info_is_used(info));
 
 	ctx.chip = chip;
-	ctx.req_cfg = req_cfg;
 	ctx.line_cfg = line_cfg;
+	ctx.settings = settings;
+	ctx.offset = 3;
 
 	thread = g_thread_new("request-release",
 			      request_reconfigure_release_line, &ctx);
@@ -266,22 +269,21 @@ GPIOD_TEST_CASE(unwatch_and_check_that_no_events_are_generated)
 	g_autoptr(struct_gpiod_chip) chip = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 	g_autoptr(struct_gpiod_info_event) event = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 NULL);
 
 	info = gpiod_chip_watch_line_info(chip, 3);
 	g_assert_nonnull(info);
 	gpiod_test_return_if_failed();
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	ret = gpiod_chip_wait_info_event(chip, 100000000);
 	g_assert_cmpint(ret, >, 0);
diff --git a/tests/tests-line-config.c b/tests/tests-line-config.c
index ec9bd0a..27cc228 100644
--- a/tests/tests-line-config.c
+++ b/tests/tests-line-config.c
@@ -4,7 +4,6 @@
 #include <errno.h>
 #include <glib.h>
 #include <gpiod.h>
-#include <stdint.h>
 
 #include "gpiod-test.h"
 #include "gpiod-test-helpers.h"
@@ -12,446 +11,206 @@
 
 #define GPIOD_TEST_GROUP "line-config"
 
-GPIOD_TEST_CASE(default_config)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
-
-	config = gpiod_test_create_line_config_or_fail();
-
-	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
-			GPIOD_LINE_DIRECTION_AS_IS);
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
-			==, GPIOD_LINE_EDGE_NONE);
-	g_assert_cmpint(gpiod_line_config_get_bias_default(config), ==,
-			GPIOD_LINE_BIAS_AS_IS);
-	g_assert_cmpint(gpiod_line_config_get_drive_default(config), ==,
-			GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_false(gpiod_line_config_get_active_low_default(config));
-	g_assert_cmpuint(
-		gpiod_line_config_get_debounce_period_us_default(config), ==,
-		0);
-	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config), ==,
-			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
-	g_assert_cmpint(gpiod_line_config_get_output_value_default(config), ==,
-			GPIOD_LINE_VALUE_INACTIVE);
-	g_assert_cmpuint(gpiod_line_config_get_num_overrides(config),
-			 ==, 0);
-}
-
-GPIOD_TEST_CASE(defaults_are_used_for_non_overridden_offsets)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
-
-	config = gpiod_test_create_line_config_or_fail();
-
-	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 4), ==,
-			GPIOD_LINE_DIRECTION_AS_IS);
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 4),
-			==, GPIOD_LINE_EDGE_NONE);
-	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 4), ==,
-			GPIOD_LINE_BIAS_AS_IS);
-	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 4), ==,
-			GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_false(gpiod_line_config_get_active_low_offset(config, 4));
-	g_assert_cmpuint(
-		gpiod_line_config_get_debounce_period_us_offset(config, 4), ==,
-		0);
-	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 4),
-			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
-	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 4),
-			==, GPIOD_LINE_VALUE_INACTIVE);
-	g_assert_cmpuint(gpiod_line_config_get_num_overrides(config),
-			 ==, 0);
-}
-
-GPIOD_TEST_CASE(set_and_clear_direction_override)
+GPIOD_TEST_CASE(too_many_lines)
 {
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) config = NULL;
+	guint offsets[65], i;
+	gint ret;
 
+	settings = gpiod_test_create_line_settings_or_fail();
 	config = gpiod_test_create_line_config_or_fail();
 
-	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
-			GPIOD_LINE_DIRECTION_AS_IS);
-	gpiod_line_config_set_direction_override(config,
-						 GPIOD_LINE_DIRECTION_OUTPUT,
-						 3);
-
-	g_assert_cmpint(gpiod_line_config_get_direction_default(config), ==,
-			GPIOD_LINE_DIRECTION_AS_IS);
-	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 3), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_true(gpiod_line_config_direction_is_overridden(config, 3));
-	gpiod_line_config_clear_direction_override(config, 3);
-	g_assert_cmpint(gpiod_line_config_get_direction_offset(config, 3), ==,
-			GPIOD_LINE_DIRECTION_AS_IS);
-	g_assert_false(gpiod_line_config_direction_is_overridden(config, 3));
-}
-
-GPIOD_TEST_CASE(invalid_direction)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
-
-	config = gpiod_test_create_line_config_or_fail();
+	for (i = 0; i < 65; i++)
+		offsets[i] = i;
 
-	gpiod_line_config_set_direction_default(config, INT32_MAX);
-	g_assert_cmpint(gpiod_line_config_get_direction_default(config),
-			==, GPIOD_LINE_DIRECTION_AS_IS);
+	ret = gpiod_line_config_add_line_settings(config, offsets, 65,
+						  settings);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, E2BIG);
 }
 
-GPIOD_TEST_CASE(set_and_clear_edge_detection_override)
+GPIOD_TEST_CASE(get_line_settings)
 {
-	g_autoptr(struct_gpiod_line_config) config = NULL;
+	static const guint offsets[] = { 0, 1, 2, 3 };
 
-	config = gpiod_test_create_line_config_or_fail();
-
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
-			==, GPIOD_LINE_EDGE_NONE);
-	gpiod_line_config_set_edge_detection_override(config,
-						GPIOD_LINE_EDGE_FALLING, 3);
-
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
-			==, GPIOD_LINE_EDGE_NONE);
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 3),
-			==, GPIOD_LINE_EDGE_FALLING);
-	g_assert_true(gpiod_line_config_edge_detection_is_overridden(config,
-								     3));
-	gpiod_line_config_clear_edge_detection_override(config, 3);
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_offset(config, 3),
-			==, GPIOD_LINE_EDGE_NONE);
-	g_assert_false(gpiod_line_config_edge_detection_is_overridden(config,
-								      3));
-}
-
-GPIOD_TEST_CASE(invalid_edge)
-{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_settings) retrieved = NULL;
 	g_autoptr(struct_gpiod_line_config) config = NULL;
 
+	settings = gpiod_test_create_line_settings_or_fail();
 	config = gpiod_test_create_line_config_or_fail();
 
-	gpiod_line_config_set_edge_detection_default(config, INT32_MAX);
-	g_assert_cmpint(gpiod_line_config_get_edge_detection_default(config),
-			==, GPIOD_LINE_EDGE_NONE);
-}
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_DOWN);
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 settings);
 
-GPIOD_TEST_CASE(set_and_clear_bias_override)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
+	retrieved = gpiod_line_config_get_line_settings(config, 2);
+	g_assert_nonnull(retrieved);
+	gpiod_test_return_if_failed();
 
-	config = gpiod_test_create_line_config_or_fail();
-
-	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
-			==, GPIOD_LINE_BIAS_AS_IS);
-	gpiod_line_config_set_bias_override(config, GPIOD_LINE_BIAS_PULL_UP, 0);
-
-	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
-			==, GPIOD_LINE_BIAS_AS_IS);
-	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 0),
-			==, GPIOD_LINE_BIAS_PULL_UP);
-	g_assert_true(gpiod_line_config_bias_is_overridden(config, 0));
-	gpiod_line_config_clear_bias_override(config, 0);
-	g_assert_cmpint(gpiod_line_config_get_bias_offset(config, 0),
-			==, GPIOD_LINE_BIAS_AS_IS);
-	g_assert_false(gpiod_line_config_bias_is_overridden(config, 0));
-}
-
-GPIOD_TEST_CASE(invalid_bias)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
-
-	config = gpiod_test_create_line_config_or_fail();
-
-	gpiod_line_config_set_bias_default(config, INT32_MAX);
-	g_assert_cmpint(gpiod_line_config_get_bias_default(config),
-			==, GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_PULL_DOWN);
 }
 
-GPIOD_TEST_CASE(set_and_clear_drive_override)
+GPIOD_TEST_CASE(too_many_attrs)
 {
-	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	guint offset;
 
-	config = gpiod_test_create_line_config_or_fail();
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
-			==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	gpiod_line_config_set_drive_override(config,
-					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 3);
-
-	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
-			==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 3),
-			==, GPIOD_LINE_DRIVE_OPEN_DRAIN);
-	g_assert_true(gpiod_line_config_drive_is_overridden(config, 3));
-	gpiod_line_config_clear_drive_override(config, 3);
-	g_assert_cmpint(gpiod_line_config_get_drive_offset(config, 3),
-			==, GPIOD_LINE_DRIVE_PUSH_PULL);
-	g_assert_false(gpiod_line_config_drive_is_overridden(config, 3));
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+	offset = 0;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_debounce_period_us(settings, 1000);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	offset = 1;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_DOWN);
+	offset = 3;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_DISABLED);
+	offset = 4;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_active_low(settings, true);
+	offset = 5;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_FALLING);
+	offset = 6;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_event_clock(settings,
+					     GPIOD_LINE_EVENT_CLOCK_REALTIME);
+	offset = 7;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_reset(settings);
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	offset = 8;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_SOURCE);
+	offset = 9;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
+	g_assert_null(request);
+	g_assert_cmpint(errno, ==, E2BIG);
 }
 
-GPIOD_TEST_CASE(invalid_drive)
+GPIOD_TEST_CASE(reset_config)
 {
-	g_autoptr(struct_gpiod_line_config) config = NULL;
-
-	config = gpiod_test_create_line_config_or_fail();
-
-	gpiod_line_config_set_drive_default(config, INT32_MAX);
-	g_assert_cmpint(gpiod_line_config_get_drive_default(config),
-			==, GPIOD_LINE_BIAS_AS_IS);
-}
+	static const guint offsets[] = { 0, 1, 2, 3 };
 
-GPIOD_TEST_CASE(set_and_clear_active_low_override)
-{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_settings) retrieved0 = NULL;
+	g_autoptr(struct_gpiod_line_settings) retrieved1 = NULL;
 	g_autoptr(struct_gpiod_line_config) config = NULL;
 
+	settings = gpiod_test_create_line_settings_or_fail();
 	config = gpiod_test_create_line_config_or_fail();
 
-	g_assert_false(gpiod_line_config_get_active_low_default(config));
-	gpiod_line_config_set_active_low_override(config, true, 3);
-
-	g_assert_false(gpiod_line_config_get_active_low_default(config));
-	g_assert_true(gpiod_line_config_get_active_low_offset(config, 3));
-	g_assert_true(gpiod_line_config_active_low_is_overridden(config, 3));
-	gpiod_line_config_clear_active_low_override(config, 3);
-	g_assert_false(gpiod_line_config_get_active_low_offset(config, 3));
-	g_assert_false(gpiod_line_config_active_low_is_overridden(config, 3));
-}
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_DOWN);
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 4,
+							 settings);
 
-GPIOD_TEST_CASE(set_and_clear_debounce_period_override)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
-
-	config = gpiod_test_create_line_config_or_fail();
+	retrieved0 = gpiod_line_config_get_line_settings(config, 2);
+	g_assert_nonnull(retrieved0);
+	gpiod_test_return_if_failed();
 
-	g_assert_cmpuint(
-		gpiod_line_config_get_debounce_period_us_default(config),
-		==, 0);
-	gpiod_line_config_set_debounce_period_us_override(config, 5000, 3);
-
-	g_assert_cmpuint(
-		gpiod_line_config_get_debounce_period_us_default(config),
-		==, 0);
-	g_assert_cmpuint(
-		gpiod_line_config_get_debounce_period_us_offset(config, 3),
-		==, 5000);
-	g_assert_true(
-		gpiod_line_config_debounce_period_us_is_overridden(config, 3));
-	gpiod_line_config_clear_debounce_period_us_override(config, 3);
-	g_assert_cmpuint(
-		gpiod_line_config_get_debounce_period_us_offset(config, 3),
-		==, 0);
-	g_assert_false(
-		gpiod_line_config_debounce_period_us_is_overridden(config, 3));
-}
-
-GPIOD_TEST_CASE(set_and_clear_event_clock_override)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_PULL_DOWN);
 
-	config = gpiod_test_create_line_config_or_fail();
+	gpiod_line_config_reset(config);
 
-	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config),
-			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
-	gpiod_line_config_set_event_clock_override(config,
-					GPIOD_LINE_EVENT_CLOCK_REALTIME, 3);
-
-	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config),
-			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
-	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 3),
-			==, GPIOD_LINE_EVENT_CLOCK_REALTIME);
-	g_assert_true(gpiod_line_config_event_clock_is_overridden(config, 3));
-	gpiod_line_config_clear_event_clock_override(config, 3);
-	g_assert_cmpint(gpiod_line_config_get_event_clock_offset(config, 3),
-			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
-	g_assert_false(gpiod_line_config_event_clock_is_overridden(config, 3));
+	retrieved1 = gpiod_line_config_get_line_settings(config, 2);
+	g_assert_null(retrieved1);
 }
 
-GPIOD_TEST_CASE(invalid_event_clock)
+GPIOD_TEST_CASE(get_offsets)
 {
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) config = NULL;
+	g_autofree guint *config_offs = NULL;
+	guint offsets[8];
+	size_t num_offsets;
+	gint ret;
 
+	settings = gpiod_test_create_line_settings_or_fail();
 	config = gpiod_test_create_line_config_or_fail();
 
-	gpiod_line_config_set_event_clock_default(config, INT32_MAX);
-	g_assert_cmpint(gpiod_line_config_get_event_clock_default(config),
-			==, GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
-}
-
-GPIOD_TEST_CASE(set_and_clear_output_value_override)
-{
-	g_autoptr(struct_gpiod_line_config) config = NULL;
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_DOWN);
+	offsets[0] = 2;
+	offsets[1] = 4;
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 2,
+							 settings);
 
-	config = gpiod_test_create_line_config_or_fail();
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	offsets[0] = 6;
+	offsets[1] = 7;
+	gpiod_test_line_config_add_line_settings_or_fail(config, offsets, 2,
+							 settings);
 
-	g_assert_cmpint(gpiod_line_config_get_output_value_default(config),
-			==, GPIOD_LINE_VALUE_INACTIVE);
-	gpiod_line_config_set_output_value_override(config,
-						GPIOD_LINE_VALUE_ACTIVE, 3);
-
-	g_assert_cmpint(gpiod_line_config_get_output_value_default(config),
-			==, GPIOD_LINE_VALUE_INACTIVE);
-	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 3),
-			==, GPIOD_LINE_VALUE_ACTIVE);
-	g_assert_true(gpiod_line_config_output_value_is_overridden(config, 3));
-	gpiod_line_config_clear_output_value_override(config, 3);
-	g_assert_cmpint(gpiod_line_config_get_output_value_offset(config, 3),
-			==, 0);
-	g_assert_false(gpiod_line_config_output_value_is_overridden(config, 3));
+	ret = gpiod_line_config_get_offsets(config, &num_offsets, &config_offs);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpuint(num_offsets, ==, 4);
+	g_assert_cmpuint(config_offs[0], ==, 2);
+	g_assert_cmpuint(config_offs[1], ==, 4);
+	g_assert_cmpuint(config_offs[2], ==, 6);
+	g_assert_cmpuint(config_offs[3], ==, 7);
 }
 
-GPIOD_TEST_CASE(set_multiple_output_values)
+GPIOD_TEST_CASE(get_0_offsets)
 {
-	static const guint offsets[] = { 3, 4, 5, 6 };
-	static const gint values[] = { GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE,
-				       GPIOD_LINE_VALUE_ACTIVE,
-				       GPIOD_LINE_VALUE_INACTIVE };
-
 	g_autoptr(struct_gpiod_line_config) config = NULL;
-	guint overridden_offsets[4], i;
-	gint overriden_props[4];
+	g_autofree guint *offsets = NULL;
+	size_t num_offsets;
+	gint ret;
 
 	config = gpiod_test_create_line_config_or_fail();
 
-	gpiod_line_config_set_output_values(config, 4, offsets, values);
-
-	g_assert_cmpint(gpiod_line_config_get_output_value_default(config),
-			==, 0);
-
-	for (i = 0; i < 4; i++)
-		g_assert_cmpint(
-			gpiod_line_config_get_output_value_offset(config,
-								  offsets[i]),
-			==, values[i]);
-
-	g_assert_cmpuint(gpiod_line_config_get_num_overrides(config),
-			==, 4);
-	gpiod_line_config_get_overrides(config,
-					overridden_offsets, overriden_props);
-
-	for (i = 0; i < 4; i++) {
-		g_assert_cmpuint(overridden_offsets[i], ==, offsets[i]);
-		g_assert_cmpint(overriden_props[i], ==,
-				GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE);
-	}
-}
-
-GPIOD_TEST_CASE(config_too_complex)
-{
-	static guint offsets[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 };
-
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_request) request = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	line_cfg = gpiod_test_create_line_config_or_fail();
-	req_cfg = gpiod_test_create_request_config_or_fail();
-
-	/*
-	 * We need to make the line_config structure exceed the kernel's
-	 * maximum of 10 attributes.
-	 */
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 0);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_INPUT, 1);
-	gpiod_line_config_set_edge_detection_override(line_cfg,
-						      GPIOD_LINE_EDGE_BOTH, 2);
-	gpiod_line_config_set_debounce_period_us_override(line_cfg, 1000, 2);
-	gpiod_line_config_set_active_low_override(line_cfg, true, 3);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 4);
-	gpiod_line_config_set_drive_override(line_cfg,
-					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 4);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 8);
-	gpiod_line_config_set_drive_override(line_cfg,
-					     GPIOD_LINE_DRIVE_OPEN_SOURCE, 8);
-	gpiod_line_config_set_direction_override(line_cfg,
-						 GPIOD_LINE_DIRECTION_INPUT, 5);
-	gpiod_line_config_set_bias_override(line_cfg,
-					    GPIOD_LINE_BIAS_PULL_DOWN, 5);
-	gpiod_line_config_set_event_clock_override(line_cfg,
-					GPIOD_LINE_EVENT_CLOCK_REALTIME, 6);
-	gpiod_line_config_set_output_value_override(line_cfg,
-						GPIOD_LINE_VALUE_ACTIVE, 7);
-
-	gpiod_request_config_set_offsets(req_cfg, 12, offsets);
-
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
-	g_assert_null(request);
-	gpiod_test_expect_errno(E2BIG);
-}
-
-/*
- * This triggers the E2BIG error by exhausting the number of overrides in
- * the line_config structure instead of making the kernel representation too
- * complex.
- */
-GPIOD_TEST_CASE(define_too_many_overrides)
-{
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 128, NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_request) request = NULL;
-	guint offsets[65], i;
-
-	for (i = 0; i < 65; i++)
-		offsets[i] = i;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	line_cfg = gpiod_test_create_line_config_or_fail();
-	req_cfg = gpiod_test_create_request_config_or_fail();
-
-	for (i = 0; i < 65; i++)
-		gpiod_line_config_set_direction_override(line_cfg,
-				GPIOD_LINE_DIRECTION_OUTPUT, offsets[i]);
-
-	gpiod_request_config_set_offsets(req_cfg, 64, offsets);
-
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
-	g_assert_null(request);
-	gpiod_test_expect_errno(E2BIG);
-}
-
-GPIOD_TEST_CASE(ignore_overrides_for_offsets_not_in_request_config)
-{
-	static guint offsets[] = { 2, 3, 4, 6, 7 };
-
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_request) request = NULL;
-	g_autoptr(struct_gpiod_line_info) info3 = NULL;
-	g_autoptr(struct_gpiod_line_info) info4 = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	line_cfg = gpiod_test_create_line_config_or_fail();
-	req_cfg = gpiod_test_create_request_config_or_fail();
-
-	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 4);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 5);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info3 = gpiod_test_get_line_info_or_fail(chip, 3);
-	info4 = gpiod_test_get_line_info_or_fail(chip, 4);
-
-	g_assert_cmpint(gpiod_line_info_get_direction(info3), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-	g_assert_cmpint(gpiod_line_info_get_direction(info4), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 0);
-
-	gpiod_test_reconfigure_lines_or_fail(request, line_cfg);
-	/* Nothing to check, value successfully ignored. */
+	ret = gpiod_line_config_get_offsets(config, &num_offsets, &offsets);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpuint(num_offsets, ==, 0);
+	g_assert_null(offsets);
 }
diff --git a/tests/tests-line-info.c b/tests/tests-line-info.c
index 757baf6..ffc4586 100644
--- a/tests/tests-line-info.c
+++ b/tests/tests-line-info.c
@@ -112,61 +112,115 @@ GPIOD_TEST_CASE(copy_line_info)
 			 gpiod_line_info_get_offset(copy));
 }
 
+GPIOD_TEST_CASE(direction_settings)
+{
+	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
+	g_autoptr(struct_gpiod_chip) chip = NULL;
+	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_info) info0 = NULL;
+	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	g_autoptr(struct_gpiod_line_info) info2 = NULL;
+	guint offset;
+
+	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
+	settings = gpiod_test_create_line_settings_or_fail();
+	line_cfg = gpiod_test_create_line_config_or_fail();
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	offset = 0;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	offset = 1;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_AS_IS);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
+	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
+	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
+
+	g_assert_cmpint(gpiod_line_info_get_direction(info0), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(gpiod_line_info_get_direction(info1), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiod_line_info_get_direction(info2), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+}
+
 GPIOD_TEST_CASE(active_high)
 {
 	static const guint offset = 5;
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_active_low_default(line_cfg, true);
+	gpiod_line_settings_set_active_low(settings, true);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset,
+							 1, settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info = gpiod_chip_get_line_info(chip, 5);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+	info = gpiod_test_get_line_info_or_fail(chip, 5);
 
 	g_assert_true(gpiod_line_info_is_active_low(info));
 }
 
 GPIOD_TEST_CASE(edge_detection_settings)
 {
-	static const guint offsets[] = { 0, 1, 2, 3 };
-
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_info) info0 = NULL;
 	g_autoptr(struct_gpiod_line_info) info1 = NULL;
 	g_autoptr(struct_gpiod_line_info) info2 = NULL;
 	g_autoptr(struct_gpiod_line_info) info3 = NULL;
+	guint offset;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
-
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_edge_detection_override(line_cfg,
-						GPIOD_LINE_EDGE_RISING, 1);
-	gpiod_line_config_set_edge_detection_override(line_cfg,
-						GPIOD_LINE_EDGE_FALLING, 2);
-	gpiod_line_config_set_edge_detection_override(line_cfg,
-						GPIOD_LINE_EDGE_BOTH, 3);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info0 = gpiod_chip_get_line_info(chip, 0);
-	info1 = gpiod_chip_get_line_info(chip, 1);
-	info2 = gpiod_chip_get_line_info(chip, 2);
-	info3 = gpiod_chip_get_line_info(chip, 3);
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_NONE);
+	offset = 0;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_RISING);
+	offset = 1;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_edge_detection(settings,
+					       GPIOD_LINE_EDGE_FALLING);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	offset = 3;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
+	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
+	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
+	info3 = gpiod_test_get_line_info_or_fail(chip, 3);
 
 	g_assert_cmpint(gpiod_line_info_get_edge_detection(info0), ==,
 			GPIOD_LINE_EDGE_NONE);
@@ -180,37 +234,43 @@ GPIOD_TEST_CASE(edge_detection_settings)
 
 GPIOD_TEST_CASE(bias_settings)
 {
-	static const guint offsets[] = { 0, 1, 2, 3 };
-
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info0 = NULL;
 	g_autoptr(struct_gpiod_line_info) info1 = NULL;
 	g_autoptr(struct_gpiod_line_info) info2 = NULL;
 	g_autoptr(struct_gpiod_line_info) info3 = NULL;
+	guint offset;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_bias_override(line_cfg,
-					    GPIOD_LINE_BIAS_DISABLED, 1);
-	gpiod_line_config_set_bias_override(line_cfg,
-					    GPIOD_LINE_BIAS_PULL_DOWN, 2);
-	gpiod_line_config_set_bias_override(line_cfg,
-					    GPIOD_LINE_BIAS_PULL_UP, 3);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info0 = gpiod_chip_get_line_info(chip, 0);
-	info1 = gpiod_chip_get_line_info(chip, 1);
-	info2 = gpiod_chip_get_line_info(chip, 2);
-	info3 = gpiod_chip_get_line_info(chip, 3);
+	gpiod_line_settings_set_direction(settings,GPIOD_LINE_DIRECTION_OUTPUT);
+	offset = 0;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_DISABLED);
+	offset = 1;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_DOWN);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
+	offset = 3;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
+	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
+	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
+	info3 = gpiod_test_get_line_info_or_fail(chip, 3);
 
 	g_assert_cmpint(gpiod_line_info_get_bias(info0), ==,
 			GPIOD_LINE_BIAS_UNKNOWN);
@@ -224,33 +284,38 @@ GPIOD_TEST_CASE(bias_settings)
 
 GPIOD_TEST_CASE(drive_settings)
 {
-	static const guint offsets[] = { 0, 1, 2 };
-
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info0 = NULL;
 	g_autoptr(struct_gpiod_line_info) info1 = NULL;
 	g_autoptr(struct_gpiod_line_info) info2 = NULL;
+	guint offset;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
-
-	gpiod_request_config_set_offsets(req_cfg, 3, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_drive_override(line_cfg,
-					     GPIOD_LINE_DRIVE_OPEN_DRAIN, 1);
-	gpiod_line_config_set_drive_override(line_cfg,
-					     GPIOD_LINE_DRIVE_OPEN_SOURCE, 2);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info0 = gpiod_chip_get_line_info(chip, 0);
-	info1 = gpiod_chip_get_line_info(chip, 1);
-	info2 = gpiod_chip_get_line_info(chip, 2);
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	offset = 0;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	offset = 1;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_drive(settings, GPIOD_LINE_DRIVE_OPEN_SOURCE);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
+	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
+	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
 
 	g_assert_cmpint(gpiod_line_info_get_drive(info0), ==,
 			GPIOD_LINE_DRIVE_PUSH_PULL);
@@ -266,22 +331,23 @@ GPIOD_TEST_CASE(debounce_period)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_edge_detection_default(line_cfg,
-						     GPIOD_LINE_EDGE_BOTH);
-	gpiod_line_config_set_debounce_period_us_default(line_cfg, 1000);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_debounce_period_us(settings, 1000);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info = gpiod_chip_get_line_info(chip, 5);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+	info = gpiod_test_get_line_info_or_fail(chip, 5);
 
 	g_assert_cmpuint(gpiod_line_info_get_debounce_period_us(info),
 			 ==, 1000);
@@ -289,27 +355,32 @@ GPIOD_TEST_CASE(debounce_period)
 
 GPIOD_TEST_CASE(event_clock)
 {
-	static const guint offsets[] = { 0, 1 };
-
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info0 = NULL;
 	g_autoptr(struct_gpiod_line_info) info1 = NULL;
+	guint offset;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	offset = 0;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_event_clock(settings,
+					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+	offset = 1;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
-	gpiod_line_config_set_event_clock_override(line_cfg,
-					GPIOD_LINE_EVENT_CLOCK_REALTIME, 1);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info0 = gpiod_chip_get_line_info(chip, 0);
-	info1 = gpiod_chip_get_line_info(chip, 1);
+	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
+	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
 
 	g_assert_cmpint(gpiod_line_info_get_event_clock(info0), ==,
 			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
diff --git a/tests/tests-line-request.c b/tests/tests-line-request.c
index 6949043..a905941 100644
--- a/tests/tests-line-request.c
+++ b/tests/tests-line-request.c
@@ -14,17 +14,14 @@ GPIOD_TEST_CASE(request_fails_with_no_offsets)
 {
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(req_cfg), ==, 0);
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
 	g_assert_null(request);
 	gpiod_test_expect_errno(EINVAL);
 }
@@ -35,19 +32,25 @@ GPIOD_TEST_CASE(request_fails_with_duplicate_offsets)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
+	size_t num_requested_offsets;
+	guint requested_offsets[3];
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
-	g_assert_null(request);
-	gpiod_test_expect_errno(EBUSY);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 4,
+							 NULL);
+
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
+	g_assert_nonnull(request);
+	num_requested_offsets = gpiod_line_request_get_num_lines(request);
+	g_assert_cmpuint(num_requested_offsets, ==, 3);
+	gpiod_line_request_get_offsets(request, requested_offsets);
+	g_assert_cmpuint(requested_offsets[0], ==, 0);
+	g_assert_cmpuint(requested_offsets[1], ==, 2);
+	g_assert_cmpuint(requested_offsets[2], ==, 3);
 }
 
 GPIOD_TEST_CASE(request_fails_with_offset_out_of_bounds)
@@ -56,17 +59,16 @@ GPIOD_TEST_CASE(request_fails_with_offset_out_of_bounds)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
+							 NULL);
 
-	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
 	g_assert_null(request);
 	gpiod_test_expect_errno(EINVAL);
 }
@@ -87,13 +89,16 @@ GPIOD_TEST_CASE(set_consumer)
 	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
 	gpiod_request_config_set_consumer(req_cfg, consumer);
 
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 NULL);
+
 	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
 
 	info = gpiod_test_get_line_info_or_fail(chip, offset);
 
+	g_assert_true(gpiod_line_info_is_used(info));
 	g_assert_cmpstr(gpiod_line_info_get_consumer(info), ==, consumer);
 }
 
@@ -103,18 +108,17 @@ GPIOD_TEST_CASE(empty_consumer)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	g_autoptr(struct_gpiod_line_info) info = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 NULL);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	info = gpiod_test_get_line_info_or_fail(chip, offset);
 
@@ -131,24 +135,25 @@ GPIOD_TEST_CASE(default_output_value)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	guint i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_value_default(line_cfg,
-						   GPIOD_LINE_VALUE_ACTIVE);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 4,
+							 settings);
 
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	for (i = 0; i < 4; i++)
 		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
@@ -158,39 +163,6 @@ GPIOD_TEST_CASE(default_output_value)
 			GPIOD_LINE_VALUE_INACTIVE);
 }
 
-GPIOD_TEST_CASE(default_and_overridden_output_value)
-{
-	static const guint offsets[] = { 0, 1, 2, 3 };
-
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_request) request = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
-	line_cfg = gpiod_test_create_line_config_or_fail();
-
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_value_default(line_cfg, 1);
-	gpiod_line_config_set_output_value_override(line_cfg,
-						GPIOD_LINE_VALUE_INACTIVE, 2);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[0]),
-			==, GPIOD_LINE_VALUE_ACTIVE);
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[1]),
-			==, GPIOD_LINE_VALUE_ACTIVE);
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[2]),
-			==, GPIOD_LINE_VALUE_INACTIVE);
-	g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[3]),
-			==, GPIOD_LINE_VALUE_ACTIVE);
-}
-
 GPIOD_TEST_CASE(read_all_values)
 {
 	static const guint offsets[] = { 0, 2, 4, 5, 7 };
@@ -198,21 +170,21 @@ GPIOD_TEST_CASE(read_all_values)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	gint ret, values[5];
 	guint i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 5,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	for (i = 0; i < 5; i++)
 		g_gpiosim_chip_set_pull(sim, offsets[i],
@@ -233,21 +205,21 @@ GPIOD_TEST_CASE(request_multiple_values_but_read_one)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	gint ret;
 	guint i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 5,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	for (i = 0; i < 5; i++)
 		g_gpiosim_chip_set_pull(sim, offsets[i],
@@ -268,21 +240,22 @@ GPIOD_TEST_CASE(set_all_values)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	gint ret;
 	guint i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 5, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 5,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	ret = gpiod_line_request_set_values(request, values);
 	g_assert_cmpint(ret, ==, 0);
@@ -299,21 +272,22 @@ GPIOD_TEST_CASE(set_line_after_requesting)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_value_default(line_cfg,
-						   GPIOD_LINE_VALUE_INACTIVE);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings,
+					     GPIOD_LINE_VALUE_INACTIVE);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 4,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	gpiod_line_request_set_value(request, 1, GPIOD_LINE_VALUE_ACTIVE);
 
@@ -329,22 +303,23 @@ GPIOD_TEST_CASE(request_survives_parent_chip)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, &offset);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_value_default(line_cfg,
-						   GPIOD_LINE_VALUE_ACTIVE);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings,
+					     GPIOD_LINE_VALUE_ACTIVE);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	g_assert_cmpint(gpiod_line_request_get_value(request, offset), ==,
 			GPIOD_LINE_VALUE_ACTIVE);
@@ -363,64 +338,23 @@ GPIOD_TEST_CASE(request_survives_parent_chip)
 	gpiod_test_return_if_failed();
 }
 
-GPIOD_TEST_CASE(request_with_overridden_direction)
-{
-	static const guint offsets[] = { 0, 1, 2, 3 };
-
-	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
-	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
-	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
-	g_autoptr(struct_gpiod_line_request) request = NULL;
-	g_autoptr(struct_gpiod_line_info) info0 = NULL;
-	g_autoptr(struct_gpiod_line_info) info1 = NULL;
-	g_autoptr(struct_gpiod_line_info) info2 = NULL;
-	g_autoptr(struct_gpiod_line_info) info3 = NULL;
-
-	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
-	line_cfg = gpiod_test_create_line_config_or_fail();
-
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_direction_override(line_cfg,
-						 GPIOD_LINE_DIRECTION_INPUT, 3);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
-	info0 = gpiod_test_get_line_info_or_fail(chip, 0);
-	info1 = gpiod_test_get_line_info_or_fail(chip, 1);
-	info2 = gpiod_test_get_line_info_or_fail(chip, 2);
-	info3 = gpiod_test_get_line_info_or_fail(chip, 3);
-
-	g_assert_cmpint(gpiod_line_info_get_direction(info0), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_info_get_direction(info1), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_info_get_direction(info2), ==,
-			GPIOD_LINE_DIRECTION_OUTPUT);
-	g_assert_cmpint(gpiod_line_info_get_direction(info3), ==,
-			GPIOD_LINE_DIRECTION_INPUT);
-}
-
-GPIOD_TEST_CASE(num_lines)
+GPIOD_TEST_CASE(num_lines_and_offsets)
 {
 	static const guint offsets[] = { 0, 1, 2, 3, 7, 8, 11, 14 };
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 16, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 	guint read_back[8], i;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 8, offsets);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 8,
+							 NULL);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	g_assert_cmpuint(gpiod_line_request_get_num_lines(request), ==, 8);
 	gpiod_test_return_if_failed();
@@ -431,29 +365,31 @@ GPIOD_TEST_CASE(num_lines)
 
 GPIOD_TEST_CASE(active_low_read_value)
 {
-	static const guint offsets[] = { 2, 3 };
-
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
+	guint offset;
 	gint value;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 2, offsets);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_INPUT, 2);
-	gpiod_line_config_set_direction_override(line_cfg,
-					GPIOD_LINE_DIRECTION_OUTPUT, 3);
-	gpiod_line_config_set_active_low_default(line_cfg, true);
-	gpiod_line_config_set_output_value_default(line_cfg,
-						   GPIOD_LINE_VALUE_ACTIVE);
+	gpiod_line_settings_set_active_low(settings, true);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	offset = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+	offset = 3;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_DOWN);
 	value = gpiod_line_request_get_value(request, 2);
@@ -464,49 +400,64 @@ GPIOD_TEST_CASE(active_low_read_value)
 
 GPIOD_TEST_CASE(reconfigure_lines)
 {
-	static const guint offsets[] = { 0, 1, 2, 3 };
+	//static const guint offsets[] = { 0, 1, 2, 3 };
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 4, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
-	gint values[4], ret;
-	guint i;
+	guint offsets[2];
+	gint ret;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 4, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-
-	values[0] = 1;
-	values[1] = 0;
-	values[2] = 1;
-	values[3] = 0;
-	gpiod_line_config_set_output_values(line_cfg, 4, offsets, values);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+	offsets[0] = 0;
+	offsets[1] = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
+							 settings);
+	gpiod_line_settings_set_output_value(settings,
+					     GPIOD_LINE_VALUE_INACTIVE);
+	offsets[0] = 1;
+	offsets[1] = 3;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
+
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==, 1);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==, 0);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==, 1);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==, 0);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	gpiod_line_config_reset(line_cfg);
 
-	for (i = 0; i < 4; i++)
-		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
-				==, values[i]);
-
-	values[0] = 0;
-	values[1] = 1;
-	values[2] = 0;
-	values[3] = 1;
-	gpiod_line_config_set_output_values(line_cfg, 4, offsets, values);
+	gpiod_line_settings_set_output_value(settings,
+					     GPIOD_LINE_VALUE_INACTIVE);
+	offsets[0] = 0;
+	offsets[1] = 2;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
+							 settings);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+	offsets[0] = 1;
+	offsets[1] = 3;
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 2,
+							 settings);
 
 	ret = gpiod_line_request_reconfigure_lines(request, line_cfg);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 
-	for (i = 0; i < 4; i++)
-		g_assert_cmpint(g_gpiosim_chip_get_value(sim, offsets[i]),
-				==, values[i]);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==, 0);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 1), ==, 1);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 2), ==, 0);
+	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==, 1);
 }
 
 GPIOD_TEST_CASE(request_lines_with_unordered_offsets)
@@ -515,32 +466,34 @@ GPIOD_TEST_CASE(request_lines_with_unordered_offsets)
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
-	guint cfg_offsets[4];
+	guint set_offsets[4];
 	gint values[4];
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 6, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_value_default(line_cfg, 1);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, GPIOD_LINE_VALUE_ACTIVE);
+
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, offsets, 6,
+							 settings);
+
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	values[0] = 0;
 	values[1] = 1;
 	values[2] = 0;
 	values[3] = 0;
-	cfg_offsets[0] = 7;
-	cfg_offsets[1] = 1;
-	cfg_offsets[2] = 6;
-	cfg_offsets[3] = 0;
-	gpiod_line_config_set_output_values(line_cfg, 4, cfg_offsets, values);
-
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	set_offsets[0] = 7;
+	set_offsets[1] = 1;
+	set_offsets[2] = 6;
+	set_offsets[3] = 0;
+	gpiod_line_request_set_values_subset(request, 4, set_offsets, values);
 
 	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 0), ==,
 			GPIOD_LINE_VALUE_INACTIVE);
@@ -558,24 +511,24 @@ GPIOD_TEST_CASE(request_lines_with_unordered_offsets)
 
 GPIOD_TEST_CASE(request_with_bias_set_to_pull_up)
 {
-	static const guint offsets[] = { 3 };
+	static const guint offset = 3;
 
 	g_autoptr(GPIOSimChip) sim = g_gpiosim_chip_new("num-lines", 8, NULL);
 	g_autoptr(struct_gpiod_chip) chip = NULL;
-	g_autoptr(struct_gpiod_request_config) req_cfg = NULL;
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
 	g_autoptr(struct_gpiod_line_config) line_cfg = NULL;
 	g_autoptr(struct_gpiod_line_request) request = NULL;
 
 	chip = gpiod_test_open_chip_or_fail(g_gpiosim_chip_get_dev_path(sim));
-	req_cfg = gpiod_test_create_request_config_or_fail();
+	settings = gpiod_test_create_line_settings_or_fail();
 	line_cfg = gpiod_test_create_line_config_or_fail();
 
-	gpiod_request_config_set_offsets(req_cfg, 1, offsets);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_INPUT);
-	gpiod_line_config_set_bias_default(line_cfg, GPIOD_LINE_BIAS_PULL_UP);
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
+	gpiod_test_line_config_add_line_settings_or_fail(line_cfg, &offset, 1,
+							 settings);
 
-	request = gpiod_test_request_lines_or_fail(chip, req_cfg, line_cfg);
+	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
 	g_assert_cmpint(g_gpiosim_chip_get_value(sim, 3), ==,
 			GPIOD_LINE_VALUE_ACTIVE);
diff --git a/tests/tests-line-settings.c b/tests/tests-line-settings.c
new file mode 100644
index 0000000..d074063
--- /dev/null
+++ b/tests/tests-line-settings.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <glib.h>
+#include <gpiod.h>
+
+#include "gpiod-test.h"
+#include "gpiod-test-helpers.h"
+
+#define GPIOD_TEST_GROUP "line-settings"
+
+GPIOD_TEST_CASE(default_config)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiod_line_settings_get_active_low(settings));
+	g_assert_cmpuint(gpiod_line_settings_get_debounce_period_us(settings),
+			==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(set_direction)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	ret = gpiod_line_settings_set_direction(settings,
+						GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+
+	ret = gpiod_line_settings_set_direction(settings,
+						GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+
+	ret = gpiod_line_settings_set_direction(settings,
+						GPIOD_LINE_DIRECTION_OUTPUT);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_OUTPUT);
+
+	ret = gpiod_line_settings_set_direction(settings, 999);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+}
+
+GPIOD_TEST_CASE(set_edge_detection)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	ret = gpiod_line_settings_set_edge_detection(settings,
+						     GPIOD_LINE_EDGE_BOTH);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_BOTH);
+
+	ret = gpiod_line_settings_set_edge_detection(settings,
+						     GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_NONE);
+
+	ret = gpiod_line_settings_set_edge_detection(settings,
+						     GPIOD_LINE_EDGE_FALLING);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_FALLING);
+
+	ret = gpiod_line_settings_set_edge_detection(settings,
+						     GPIOD_LINE_EDGE_RISING);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_RISING);
+
+	ret = gpiod_line_settings_set_edge_detection(settings, 999);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_NONE);
+}
+
+GPIOD_TEST_CASE(set_bias)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	ret = gpiod_line_settings_set_bias(settings,
+					   GPIOD_LINE_BIAS_DISABLED);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_DISABLED);
+
+	ret = gpiod_line_settings_set_bias(settings,
+					   GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+
+	ret = gpiod_line_settings_set_bias(settings,
+					   GPIOD_LINE_BIAS_PULL_DOWN);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_PULL_DOWN);
+
+	ret = gpiod_line_settings_set_bias(settings,
+					   GPIOD_LINE_BIAS_PULL_UP);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_PULL_UP);
+
+	ret = gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_UNKNOWN);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+
+	ret = gpiod_line_settings_set_bias(settings, 999);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+}
+
+GPIOD_TEST_CASE(set_drive)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	ret = gpiod_line_settings_set_drive(settings,
+					    GPIOD_LINE_DRIVE_OPEN_DRAIN);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DRIVE_OPEN_DRAIN);
+
+	ret = gpiod_line_settings_set_drive(settings,
+					    GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+
+	ret = gpiod_line_settings_set_drive(settings,
+					    GPIOD_LINE_DRIVE_OPEN_SOURCE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DRIVE_OPEN_SOURCE);
+
+	ret = gpiod_line_settings_set_drive(settings, 999);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+}
+
+GPIOD_TEST_CASE(set_active_low)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	gpiod_line_settings_set_active_low(settings, true);
+	g_assert_true(gpiod_line_settings_get_active_low(settings));
+
+	gpiod_line_settings_set_active_low(settings, false);
+	g_assert_false(gpiod_line_settings_get_active_low(settings));
+}
+
+GPIOD_TEST_CASE(set_debounce_period)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	gpiod_line_settings_set_debounce_period_us(settings, 4000);
+	g_assert_cmpint(gpiod_line_settings_get_debounce_period_us(settings),
+			==, 4000);
+}
+
+GPIOD_TEST_CASE(set_event_clock)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	ret = gpiod_line_settings_set_event_clock(settings,
+					GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+
+	ret = gpiod_line_settings_set_event_clock(settings,
+					GPIOD_LINE_EVENT_CLOCK_REALTIME);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
+			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+
+	ret = gpiod_line_settings_set_event_clock(settings, 999);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+}
+
+GPIOD_TEST_CASE(set_output_value)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	gint ret;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	ret = gpiod_line_settings_set_output_value(settings,
+						   GPIOD_LINE_VALUE_ACTIVE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
+			GPIOD_LINE_VALUE_ACTIVE);
+
+	ret = gpiod_line_settings_set_output_value(settings,
+						   GPIOD_LINE_VALUE_INACTIVE);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+
+	ret = gpiod_line_settings_set_output_value(settings, 999);
+	g_assert_cmpint(ret, <, 0);
+	g_assert_cmpint(errno, ==, EINVAL);
+	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+}
+
+GPIOD_TEST_CASE(copy_line_settings)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+	g_autoptr(struct_gpiod_line_settings) copy = NULL;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_debounce_period_us(settings, 2000);
+	gpiod_line_settings_set_event_clock(settings,
+					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+
+	copy = gpiod_line_settings_copy(settings);
+	g_assert_nonnull(copy);
+	gpiod_test_return_if_failed();
+	g_assert_false(settings == copy);
+	g_assert_cmpint(gpiod_line_settings_get_direction(copy), ==,
+			GPIOD_LINE_DIRECTION_INPUT);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(copy), ==,
+			GPIOD_LINE_EDGE_BOTH);
+	g_assert_cmpint(gpiod_line_settings_get_debounce_period_us(copy), ==,
+			2000);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(copy), ==,
+			GPIOD_LINE_EVENT_CLOCK_REALTIME);
+}
+
+GPIOD_TEST_CASE(reset_settings)
+{
+	g_autoptr(struct_gpiod_line_settings) settings = NULL;
+
+	settings = gpiod_test_create_line_settings_or_fail();
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	gpiod_line_settings_set_debounce_period_us(settings, 2000);
+	gpiod_line_settings_set_event_clock(settings,
+					    GPIOD_LINE_EVENT_CLOCK_REALTIME);
+
+	gpiod_line_settings_reset(settings);
+
+	g_assert_cmpint(gpiod_line_settings_get_direction(settings), ==,
+			GPIOD_LINE_DIRECTION_AS_IS);
+	g_assert_cmpint(gpiod_line_settings_get_edge_detection(settings), ==,
+			GPIOD_LINE_EDGE_NONE);
+	g_assert_cmpint(gpiod_line_settings_get_bias(settings), ==,
+			GPIOD_LINE_BIAS_AS_IS);
+	g_assert_cmpint(gpiod_line_settings_get_drive(settings), ==,
+			GPIOD_LINE_DRIVE_PUSH_PULL);
+	g_assert_false(gpiod_line_settings_get_active_low(settings));
+	g_assert_cmpuint(gpiod_line_settings_get_debounce_period_us(settings),
+			==, 0);
+	g_assert_cmpint(gpiod_line_settings_get_event_clock(settings), ==,
+			GPIOD_LINE_EVENT_CLOCK_MONOTONIC);
+	g_assert_cmpint(gpiod_line_settings_get_output_value(settings), ==,
+			GPIOD_LINE_VALUE_INACTIVE);
+}
diff --git a/tests/tests-request-config.c b/tests/tests-request-config.c
index becb414..f26c05a 100644
--- a/tests/tests-request-config.c
+++ b/tests/tests-request-config.c
@@ -16,12 +16,11 @@ GPIOD_TEST_CASE(default_config)
 	config = gpiod_test_create_request_config_or_fail();
 
 	g_assert_null(gpiod_request_config_get_consumer(config));
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 0);
 	g_assert_cmpuint(gpiod_request_config_get_event_buffer_size(config),
 			 ==, 0);
 }
 
-GPIOD_TEST_CASE(consumer)
+GPIOD_TEST_CASE(set_consumer)
 {
 	g_autoptr(struct_gpiod_request_config) config = NULL;
 
@@ -32,53 +31,7 @@ GPIOD_TEST_CASE(consumer)
 			==, "foobar");
 }
 
-GPIOD_TEST_CASE(offsets)
-{
-	static const guint offsets[] = { 0, 3, 4, 7 };
-
-	g_autoptr(struct_gpiod_request_config) config = NULL;
-	guint read_back[4], i;
-
-	config = gpiod_test_create_request_config_or_fail();
-
-	gpiod_request_config_set_offsets(config, 4, offsets);
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 4);
-	memset(read_back, 0, sizeof(read_back));
-	gpiod_request_config_get_offsets(config, read_back);
-	for (i = 0; i < 4; i++)
-		g_assert_cmpuint(read_back[i], ==, offsets[i]);
-}
-
-GPIOD_TEST_CASE(max_offsets)
-{
-	static const guint offsets_good[] = {
-		 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
-		16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
-		32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
-		48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63
-	};
-
-	static const guint offsets_bad[] = {
-		 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15,
-		16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
-		32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
-		48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
-		64
-	};
-
-	g_autoptr(struct_gpiod_request_config) config = NULL;
-
-	config = gpiod_test_create_request_config_or_fail();
-
-	gpiod_request_config_set_offsets(config, 64, offsets_good);
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 64);
-
-	gpiod_request_config_set_offsets(config, 65, offsets_bad);
-	/* Should get truncated. */
-	g_assert_cmpuint(gpiod_request_config_get_num_offsets(config), ==, 64);
-}
-
-GPIOD_TEST_CASE(event_buffer_size)
+GPIOD_TEST_CASE(set_event_buffer_size)
 {
 	g_autoptr(struct_gpiod_request_config) config = NULL;
 
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index 69ad786..a259eae 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -449,7 +449,7 @@ teardown() {
 	run_tool gpioget "$(gpiosim_chip_name sim0)" 0 0
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
+	output_regex_match ".*offsets must be unique"
 }
 
 @test "gpioget: invalid bias" {
@@ -737,7 +737,7 @@ teardown() {
 	run_tool gpioset "$(gpiosim_chip_name sim0)" 0=1 0=1
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
+	output_regex_match ".*offsets must be unique"
 }
 
 #
@@ -957,7 +957,7 @@ teardown() {
 	run_tool gpiomon "$(gpiosim_chip_name sim0)" 0 0
 
 	test "$status" -eq "1"
-	output_regex_match ".*unable to request lines"
+	output_regex_match ".*offsets must be unique"
 }
 
 @test "gpiomon: no arguments" {
diff --git a/tools/gpioget.c b/tools/gpioget.c
index ae80271..b68212d 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -43,6 +43,7 @@ int main(int argc, char **argv)
 {
 	int direction = GPIOD_LINE_DIRECTION_INPUT;
 	int optc, opti, bias = 0, ret, *values;
+	struct gpiod_line_settings *settings;
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
@@ -103,28 +104,39 @@ int main(int argc, char **argv)
 			die("invalid GPIO offset: %s", argv[i + 1]);
 	}
 
+	if (has_duplicate_offsets(num_lines, offsets))
+		die("offsets must be unique");
+
 	chip = chip_open_lookup(device);
 	if (!chip)
 		die_perror("unable to open %s", device);
 
-	line_cfg = gpiod_line_config_new();
-	if (!line_cfg)
-		die_perror("unable to allocate the line config structure");
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		die_perror("unable to allocate line settings");
 
-	gpiod_line_config_set_direction_default(line_cfg, direction);
+	gpiod_line_settings_set_direction(settings, direction);
 
 	if (bias)
-		gpiod_line_config_set_bias_default(line_cfg, bias);
+		gpiod_line_settings_set_bias(settings, bias);
 
 	if (active_low)
-		gpiod_line_config_set_active_low_default(line_cfg, true);
+		gpiod_line_settings_set_active_low(settings, active_low);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
 		die_perror("unable to allocate the request config structure");
 
 	gpiod_request_config_set_consumer(req_cfg, "gpioget");
-	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, offsets,
+						  num_lines, settings);
+	if (ret)
+		die_perror("unable to add line settings");
 
 	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
 	if (!request)
@@ -144,6 +156,7 @@ int main(int argc, char **argv)
 	gpiod_line_request_release(request);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
+	gpiod_line_settings_free(settings);
 	gpiod_chip_close(chip);
 	free(offsets);
 	free(values);
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index f6a0dba..dff12ea 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -159,6 +159,7 @@ int main(int argc, char **argv)
 	struct gpiod_edge_event_buffer *event_buffer;
 	int optc, opti, ret, i, edge, bias = 0;
 	uint64_t timeout = 10 * 1000000000LLU;
+	struct gpiod_line_settings *settings;
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
@@ -250,26 +251,37 @@ int main(int argc, char **argv)
 		num_lines++;
 	}
 
+	if (has_duplicate_offsets(num_lines, offsets))
+		die("offsets must be unique");
+
 	chip = chip_open_lookup(argv[0]);
 	if (!chip)
 		die_perror("unable to open %s", argv[0]);
 
-	line_cfg = gpiod_line_config_new();
-	if (!line_cfg)
-		die_perror("unable to allocate the line config structure");
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		die_perror("unable to allocate line settings");
 
 	if (bias)
-		gpiod_line_config_set_bias_default(line_cfg, bias);
+		gpiod_line_settings_set_bias(settings, bias);
 	if (active_low)
-		gpiod_line_config_set_active_low_default(line_cfg, true);
-	gpiod_line_config_set_edge_detection_default(line_cfg, edge);
+		gpiod_line_settings_set_active_low(settings, active_low);
+	gpiod_line_settings_set_edge_detection(settings, edge);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
 		die_perror("unable to allocate the request config structure");
 
 	gpiod_request_config_set_consumer(req_cfg, "gpiomon");
-	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, offsets,
+						  num_lines, settings);
+	if (ret)
+		die_perror("unable to add line settings");
 
 	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
 	if (!request)
@@ -314,6 +326,7 @@ done:
 	gpiod_line_request_release(request);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
+	gpiod_line_settings_free(settings);
 	gpiod_chip_close(chip);
 
 	return EXIT_SUCCESS;
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 576b87d..290d1a3 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -191,6 +191,7 @@ int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
 	int ret, optc, opti, bias = 0, drive = 0, *values;
+	struct gpiod_line_settings *settings;
 	struct gpiod_request_config *req_cfg;
 	struct gpiod_line_request *request;
 	struct gpiod_line_config *line_cfg;
@@ -288,31 +289,44 @@ int main(int argc, char **argv)
 			die("invalid offset: %s", argv[i + 1]);
 	}
 
+	if (has_duplicate_offsets(num_lines, offsets))
+		die("offsets must be unique");
+
 	chip = chip_open_lookup(device);
 	if (!chip)
 		die_perror("unable to open %s", device);
 
-	line_cfg = gpiod_line_config_new();
-	if (!line_cfg)
-		die_perror("unable to allocate the line config structure");
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		die_perror("unable to allocate line settings");
 
 	if (bias)
-		gpiod_line_config_set_bias_default(line_cfg, bias);
+		gpiod_line_settings_set_bias(settings, bias);
 	if (drive)
-		gpiod_line_config_set_drive_default(line_cfg, drive);
+		gpiod_line_settings_set_drive(settings, drive);
 	if (active_low)
-		gpiod_line_config_set_active_low_default(line_cfg, true);
-	gpiod_line_config_set_direction_default(line_cfg,
-						GPIOD_LINE_DIRECTION_OUTPUT);
-	gpiod_line_config_set_output_values(line_cfg, num_lines,
-					    offsets, values);
+		gpiod_line_settings_set_active_low(settings, active_low);
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
 		die_perror("unable to allocate the request config structure");
 
 	gpiod_request_config_set_consumer(req_cfg, "gpioset");
-	gpiod_request_config_set_offsets(req_cfg, num_lines, offsets);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		die_perror("unable to allocate the line config structure");
+
+	for (i = 0; i < num_lines; i++) {
+		gpiod_line_settings_set_output_value(settings, values[i]);
+
+		ret = gpiod_line_config_add_line_settings(line_cfg, &offsets[i],
+							  1, settings);
+		if (ret)
+			die_perror("unable to add line settings");
+	}
 
 	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
 	if (!request)
@@ -324,6 +338,7 @@ int main(int argc, char **argv)
 	gpiod_line_request_release(request);
 	gpiod_request_config_free(req_cfg);
 	gpiod_line_config_free(line_cfg);
+	gpiod_line_settings_free(settings);
 	gpiod_chip_close(chip);
 	free(offsets);
 
diff --git a/tools/tools-common.c b/tools/tools-common.c
index f5fd50c..8957293 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -169,3 +169,16 @@ struct gpiod_chip *chip_open_lookup(const char *device)
 
 	return chip;
 }
+
+bool has_duplicate_offsets(size_t num_offsets, unsigned int *offsets)
+{
+	size_t i, j;
+
+	for (i = 0; i < num_offsets; i++) {
+		for (j = i + 1; j < num_offsets; j++)
+			if (offsets[i] == offsets[j])
+				return true;
+	}
+
+	return false;
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index f059440..cb61d54 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -31,5 +31,6 @@ int make_signalfd(void);
 int chip_dir_filter(const struct dirent *entry);
 struct gpiod_chip *chip_open_by_name(const char *name);
 struct gpiod_chip *chip_open_lookup(const char *device);
+bool has_duplicate_offsets(size_t num_offsets, unsigned int *offsets);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.34.1

