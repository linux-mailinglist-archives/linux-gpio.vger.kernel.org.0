Return-Path: <linux-gpio+bounces-7023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E98D691D
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 20:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE1C284F77
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 18:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F897E0F2;
	Fri, 31 May 2024 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1KAZBpx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1E7D096
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717180953; cv=none; b=jI+iaRXOM8coXaYFzPl0q6ZBnUsokYy5H5h2Ksl9FK1GS+6/8sZQnx3u+jfTstkDbdSSiYATljKFktIaXWeL8oToSSJyCazV+0irFRThfJnIfc6N0nd84WBSpIA9WCh05OcPP0IWmb6DkcUd1nHOf5lSl1FOSmkw3mGy3banin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717180953; c=relaxed/simple;
	bh=fJZtqz3Q9oBuXCq3RCCyOjH9LOEUOL2luVaF+3ckeRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NnXQAXn3n3as7/SIoXV+Fc5S3n1LGp6M10wfV6WTB3JWjnwd8zmOWWfT36dDoNf0bBChc/wv5hbwBqZd12pS62bFUrJbYcIdtCmcTmMtr+dEL4cXADYUUjveyhdVFvhLw4yQgwnK/9MEyjLxriMxzr6znfb+OKRRf4BGbJf4jYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1KAZBpx; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70249c5fb36so774250b3a.2
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717180950; x=1717785750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzWZWwDTyLxEEyBkYRfDzbXN5FBJa6GNibqcqLHXpgM=;
        b=H1KAZBpx3n0CaZbrUGniOTA1Fo9vzXG1T8qbhm8K/p52UzX1++I64efVIpccs7FSGV
         Ohd6o0WWbHcYZZoTQFu8V32vI8av2ylIo5X34hPsxb2KCHx354jTTsEBQ6Epwv5BpvUq
         sGEs4AOqaHh5rIY2B200fx0GELPvKINbktZuJSfJxAHJInmp3+b4HB2vdeKKW2Mz1qel
         v8bpJNbI+o7gVF3aodJ3sWH5y8j344cGeubuC8w4JY+Kx00N9rEj5uN+ueDhxJodAYRN
         Qg1EqCu5m8fmKUN5YNXPE0dp0pXRWFrZi0/fvn3oy4leTgYPhRl6xqGn+jXkpsG4DfW1
         x+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717180950; x=1717785750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzWZWwDTyLxEEyBkYRfDzbXN5FBJa6GNibqcqLHXpgM=;
        b=q1KdyJJBoRiFrwyput474+5pQsi/jSrWBRo1iFnIg4qgso+1sZGvRwf6QxcpcwoZco
         s0fH+/2gKdwF9aeRTqPX1Niaa4dglI7sPL/6sqlRKho4dl4WZx680cvDdQ2PjjZTbTRQ
         pGXN//83JfcNXGyyCe8ejL4jlU5opzbq+35xTrW/1LBV4HfM0rGfwky3JNta8OJsmYli
         DmqGP4AAJSDHTGKK4HPT3UmIZ81IVHUWBrU3NKNgqehnfWib4tsY5a04DqZgdd9nvE65
         s+vCWe525yeAFibXDMhQ+H2H8fbh5twedmBk/48O6iPNv/sJhp5I1T8B1xNBO6VZxc3S
         +uTA==
X-Gm-Message-State: AOJu0Yw0gqVxeVitckD35uV1mkPhe/Im1mFd2qINl15xGt/yLtApV2cp
	kimrBoiH5xfaCUuAHJ0oPUzNC8VwwJTYRqkabl3Hbh15JqbbAU73L9AjZgVsc7o=
X-Google-Smtp-Source: AGHT+IFH27kTVz5maw7iCopCCW7bvhbm/0mCRAPqK8ZerdOajOp3MIcN4RJhdAE0LbRrL8163wClSQ==
X-Received: by 2002:a05:6a20:1582:b0:1b2:512e:7db5 with SMTP id adf61e73a8af0-1b26f17e326mr3407160637.30.1717180949906;
        Fri, 31 May 2024 11:42:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242ae6b8bsm1628561b3a.117.2024.05.31.11.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 11:42:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: cxx: Migrate C++ tests to use Catch2 v3
Date: Fri, 31 May 2024 11:42:23 -0700
Message-ID: <20240531184223.3949069-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Catch2 v3.x has API changes which needs to be addressed
in the tests themselves, hence this changeset is to fix
those.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/tests/Makefile.am              |  2 +-
 bindings/cxx/tests/gpiod-cxx-test-main.cpp  |  3 +--
 bindings/cxx/tests/helpers.hpp              |  8 +++---
 bindings/cxx/tests/tests-chip-info.cpp      | 30 ++++++++++-----------
 bindings/cxx/tests/tests-chip.cpp           | 14 +++++-----
 bindings/cxx/tests/tests-edge-event.cpp     |  2 +-
 bindings/cxx/tests/tests-info-event.cpp     |  2 +-
 bindings/cxx/tests/tests-line-config.cpp    |  2 +-
 bindings/cxx/tests/tests-line-info.cpp      | 22 +++++++--------
 bindings/cxx/tests/tests-line-request.cpp   | 16 +++++------
 bindings/cxx/tests/tests-line-settings.cpp  |  2 +-
 bindings/cxx/tests/tests-line.cpp           |  2 +-
 bindings/cxx/tests/tests-misc.cpp           |  2 +-
 bindings/cxx/tests/tests-request-config.cpp | 10 +++----
 configure.ac                                |  4 +--
 15 files changed, 60 insertions(+), 61 deletions(-)

diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index fbf80a1..d9284da 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -4,7 +4,7 @@
 AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CXXFLAGS += -I$(top_srcdir)/tests/gpiosim/
 AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
-AM_LDFLAGS = -pthread
+AM_LDFLAGS = -pthread $(CATCH2_LIBS)
 LDADD = $(top_builddir)/bindings/cxx/libgpiodcxx.la
 LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
 
diff --git a/bindings/cxx/tests/gpiod-cxx-test-main.cpp b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
index 11bf8e5..ec48286 100644
--- a/bindings/cxx/tests/gpiod-cxx-test-main.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
-#define CATCH_CONFIG_MAIN
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
diff --git a/bindings/cxx/tests/helpers.hpp b/bindings/cxx/tests/helpers.hpp
index 62d9827..62bbdf5 100644
--- a/bindings/cxx/tests/helpers.hpp
+++ b/bindings/cxx/tests/helpers.hpp
@@ -4,13 +4,13 @@
 #ifndef __GPIOD_CXX_TEST_HELPERS_HPP__
 #define __GPIOD_CXX_TEST_HELPERS_HPP__
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <regex>
 #include <string>
 #include <sstream>
 #include <system_error>
 
-class system_error_matcher : public Catch::MatcherBase<::std::system_error>
+class system_error_matcher : public Catch::Matchers::MatcherBase<::std::system_error>
 {
 public:
 	explicit system_error_matcher(int expected_errno);
@@ -21,7 +21,7 @@ private:
 	::std::error_condition _m_cond;
 };
 
-class regex_matcher : public Catch::MatcherBase<::std::string>
+class regex_matcher : public Catch::Matchers::MatcherBase<::std::string>
 {
 public:
 	explicit regex_matcher(const ::std::string& pattern);
@@ -33,7 +33,7 @@ private:
 	::std::string _m_repr;
 };
 
-template<class T> class stringify_matcher : public Catch::MatcherBase<T>
+template<class T> class stringify_matcher : public Catch::Matchers::MatcherBase<T>
 {
 public:
 	explicit stringify_matcher(const ::std::string& expected) : _m_expected(expected)
diff --git a/bindings/cxx/tests/tests-chip-info.cpp b/bindings/cxx/tests/tests-chip-info.cpp
index 717c387..2c54f53 100644
--- a/bindings/cxx/tests/tests-chip-info.cpp
+++ b/bindings/cxx/tests/tests-chip-info.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 #include <sstream>
 
@@ -24,12 +24,12 @@ TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
 
 	SECTION("get chip name")
 	{
-		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals(sim.name()));
 	}
 
 	SECTION("get chip label")
 	{
-		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.label(), Catch::Matchers::Equals("foobar"));
 	}
 
 	SECTION("get num_lines")
@@ -52,12 +52,12 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
 	{
 		auto copy(info);
 
-		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
-		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals(sim.name()));
+		REQUIRE_THAT(copy.label(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(copy.num_lines() == 4);
 
-		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
-		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals(sim.name()));
+		REQUIRE_THAT(info.label(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(info.num_lines() == 4);
 	}
 
@@ -67,12 +67,12 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
 
 		copy = info;
 
-		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
-		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals(sim.name()));
+		REQUIRE_THAT(copy.label(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(copy.num_lines() == 4);
 
-		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
-		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals(sim.name()));
+		REQUIRE_THAT(info.label(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(info.num_lines() == 4);
 	}
 
@@ -80,8 +80,8 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
 	{
 		auto moved(std::move(info));
 
-		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
-		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.name(), Catch::Matchers::Equals(sim.name()));
+		REQUIRE_THAT(moved.label(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(moved.num_lines() == 4);
 	}
 
@@ -91,8 +91,8 @@ TEST_CASE("chip_info can be copied and moved", "[chip-info]")
 
 		moved = ::std::move(info);
 
-		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
-		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.name(), Catch::Matchers::Equals(sim.name()));
+		REQUIRE_THAT(moved.label(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(moved.num_lines() == 4);
 	}
 }
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index c5ec19b..1ab7add 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 #include <sstream>
 #include <system_error>
@@ -48,9 +48,9 @@ TEST_CASE("chip constructor works", "[chip]")
 			.build();
 
 		::gpiod::chip first(sim.dev_path());
-		REQUIRE_THAT(first.get_info().label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(first.get_info().label(), Catch::Matchers::Equals("foobar"));
 		::gpiod::chip second(::std::move(first));
-		REQUIRE_THAT(second.get_info().label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(second.get_info().label(), Catch::Matchers::Equals("foobar"));
 	}
 }
 
@@ -70,9 +70,9 @@ TEST_CASE("chip operators work", "[chip]")
 
 		::gpiod::chip moved_chip(moved_sim.dev_path());
 
-		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("foobar"));
+		REQUIRE_THAT(chip.get_info().label(), Catch::Matchers::Equals("foobar"));
 		chip = ::std::move(moved_chip);
-		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("moved"));
+		REQUIRE_THAT(chip.get_info().label(), Catch::Matchers::Equals("moved"));
 	}
 
 	SECTION("boolean operator")
@@ -94,7 +94,7 @@ TEST_CASE("chip properties can be read", "[chip]")
 
 	SECTION("get device path")
 	{
-		REQUIRE_THAT(chip.path(), Catch::Equals(sim.dev_path()));
+		REQUIRE_THAT(chip.path(), Catch::Matchers::Equals(sim.dev_path()));
 	}
 
 	SECTION("get file descriptor")
@@ -169,7 +169,7 @@ TEST_CASE("stream insertion operator works for chip", "[chip]")
 			    "\", label=\"foobar\", num_lines=4))";
 
 		buf << chip;
-		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
+		REQUIRE_THAT(buf.str(), Catch::Matchers::Equals(expected.str()));
 	}
 
 	SECTION("closed chip")
diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
index 19a6ab3..db387be 100644
--- a/bindings/cxx/tests/tests-edge-event.cpp
+++ b/bindings/cxx/tests/tests-edge-event.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <chrono>
 #include <gpiod.hpp>
 #include <sstream>
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
index 21c0ef0..f7ae309 100644
--- a/bindings/cxx/tests/tests-info-event.cpp
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <chrono>
 #include <filesystem>
 #include <gpiod.hpp>
diff --git a/bindings/cxx/tests/tests-line-config.cpp b/bindings/cxx/tests/tests-line-config.cpp
index 5e439a1..2f510fb 100644
--- a/bindings/cxx/tests/tests-line-config.cpp
+++ b/bindings/cxx/tests/tests-line-config.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 
 #include "gpiosim.hpp"
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
index 21211f2..8589da3 100644
--- a/bindings/cxx/tests/tests-line-info.cpp
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 #include <string>
 
@@ -35,9 +35,9 @@ TEST_CASE("get_line_info() works", "[chip][line-info]")
 		auto info = chip.get_line_info(0);
 
 		REQUIRE(info.offset() == 0);
-		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(info.used());
-		REQUIRE_THAT(info.consumer(), Catch::Equals("hog"));
+		REQUIRE_THAT(info.consumer(), Catch::Matchers::Equals("hog"));
 		REQUIRE(info.direction() == ::gpiod::line::direction::OUTPUT);
 		REQUIRE_FALSE(info.active_low());
 		REQUIRE(info.bias() == ::gpiod::line::bias::UNKNOWN);
@@ -74,9 +74,9 @@ TEST_CASE("line properties can be retrieved", "[line-info]")
 		auto info6 = chip.get_line_info(6);
 
 		REQUIRE(info4.offset() == 4);
-		REQUIRE_THAT(info4.name(), Catch::Equals("baz"));
+		REQUIRE_THAT(info4.name(), Catch::Matchers::Equals("baz"));
 		REQUIRE(info4.used());
-		REQUIRE_THAT(info4.consumer(), Catch::Equals("hog4"));
+		REQUIRE_THAT(info4.consumer(), Catch::Matchers::Equals("hog4"));
 		REQUIRE(info4.direction() == direction::OUTPUT);
 		REQUIRE(info4.edge_detection() == edge::NONE);
 		REQUIRE_FALSE(info4.active_low());
@@ -102,10 +102,10 @@ TEST_CASE("line_info can be copied and moved")
 	{
 		auto copy(info);
 		REQUIRE(copy.offset() == 2);
-		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
 		/* info can still be used */
 		REQUIRE(info.offset() == 2);
-		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals("foobar"));
 	}
 
 	SECTION("assignment operator works")
@@ -113,17 +113,17 @@ TEST_CASE("line_info can be copied and moved")
 		auto copy = chip.get_line_info(0);
 		copy = info;
 		REQUIRE(copy.offset() == 2);
-		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
 		/* info can still be used */
 		REQUIRE(info.offset() == 2);
-		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.name(), Catch::Matchers::Equals("foobar"));
 	}
 
 	SECTION("move constructor works")
 	{
 		auto copy(::std::move(info));
 		REQUIRE(copy.offset() == 2);
-		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
 	}
 
 	SECTION("move assignment operator works")
@@ -131,7 +131,7 @@ TEST_CASE("line_info can be copied and moved")
 		auto copy = chip.get_line_info(0);
 		copy = ::std::move(info);
 		REQUIRE(copy.offset() == 2);
-		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		REQUIRE_THAT(copy.name(), Catch::Matchers::Equals("foobar"));
 	}
 }
 
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
index 9632ae0..af8b979 100644
--- a/bindings/cxx/tests/tests-line-request.cpp
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 #include <sstream>
 #include <stdexcept>
@@ -20,7 +20,7 @@ using pull = ::gpiosim::chip::pull;
 
 namespace {
 
-class value_matcher : public Catch::MatcherBase<value>
+class value_matcher : public Catch::Matchers::MatcherBase<value>
 {
 public:
 	value_matcher(pull pull, bool active_low = false)
@@ -117,7 +117,7 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
 		auto info = chip.get_line_info(2);
 
 		REQUIRE(info.used());
-		REQUIRE_THAT(info.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(info.consumer(), Catch::Matchers::Equals("foobar"));
 	}
 
 	SECTION("empty consumer")
@@ -130,7 +130,7 @@ TEST_CASE("consumer string is set correctly", "[line-request]")
 		auto info = chip.get_line_info(2);
 
 		REQUIRE(info.used());
-		REQUIRE_THAT(info.consumer(), Catch::Equals("?"));
+		REQUIRE_THAT(info.consumer(), Catch::Matchers::Equals("?"));
 	}
 }
 
@@ -380,7 +380,7 @@ TEST_CASE("line_request can be moved", "[line-request]")
 		auto moved(::std::move(request));
 
 		REQUIRE(moved.fd() == fd);
-		REQUIRE_THAT(moved.offsets(), Catch::Equals(offs));
+		REQUIRE_THAT(moved.offsets(), Catch::Matchers::Equals(offs));
 	}
 
 	SECTION("move assignment operator works")
@@ -388,7 +388,7 @@ TEST_CASE("line_request can be moved", "[line-request]")
 		another = ::std::move(request);
 
 		REQUIRE(another.fd() == fd);
-		REQUIRE_THAT(another.offsets(), Catch::Equals(offs));
+		REQUIRE_THAT(another.offsets(), Catch::Matchers::Equals(offs));
 	}
 }
 
@@ -484,7 +484,7 @@ TEST_CASE("line_request stream insertion operator works", "[line-request]")
 	{
 		buf << request;
 
-		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
+		REQUIRE_THAT(buf.str(), Catch::Matchers::Equals(expected.str()));
 	}
 
 	SECTION("request released")
@@ -493,7 +493,7 @@ TEST_CASE("line_request stream insertion operator works", "[line-request]")
 
 		buf << request;
 
-		REQUIRE_THAT(buf.str(), Catch::Equals("gpiod::line_request(released)"));
+		REQUIRE_THAT(buf.str(), Catch::Matchers::Equals("gpiod::line_request(released)"));
 	}
 }
 
diff --git a/bindings/cxx/tests/tests-line-settings.cpp b/bindings/cxx/tests/tests-line-settings.cpp
index dc821bb..2690331 100644
--- a/bindings/cxx/tests/tests-line-settings.cpp
+++ b/bindings/cxx/tests/tests-line-settings.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 
 #include "helpers.hpp"
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 319012a..abd0e08 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <gpiod.hpp>
 
 #include "helpers.hpp"
diff --git a/bindings/cxx/tests/tests-misc.cpp b/bindings/cxx/tests/tests-misc.cpp
index f06dc39..33fc3fa 100644
--- a/bindings/cxx/tests/tests-misc.cpp
+++ b/bindings/cxx/tests/tests-misc.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <filesystem>
 #include <gpiod.hpp>
 #include <string>
diff --git a/bindings/cxx/tests/tests-request-config.cpp b/bindings/cxx/tests/tests-request-config.cpp
index 66eb748..d71e91b 100644
--- a/bindings/cxx/tests/tests-request-config.cpp
+++ b/bindings/cxx/tests/tests-request-config.cpp
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-#include <catch2/catch.hpp>
+#include <catch2/catch_all.hpp>
 #include <cstddef>
 #include <gpiod.hpp>
 #include <string>
@@ -33,7 +33,7 @@ TEST_CASE("request_config can be moved", "[request-config]")
 	SECTION("move constructor works")
 	{
 		auto moved(::std::move(cfg));
-		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.consumer(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(moved.event_buffer_size() == 64);
 	}
 
@@ -43,7 +43,7 @@ TEST_CASE("request_config can be moved", "[request-config]")
 
 		moved = ::std::move(cfg);
 
-		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.consumer(), Catch::Matchers::Equals("foobar"));
 		REQUIRE(moved.event_buffer_size() == 64);
 	}
 }
@@ -55,7 +55,7 @@ TEST_CASE("request_config mutators work", "[request-config]")
 	SECTION("set consumer")
 	{
 		cfg.set_consumer("foobar");
-		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(cfg.consumer(), Catch::Matchers::Equals("foobar"));
 	}
 
 	SECTION("set event_buffer_size")
@@ -77,7 +77,7 @@ TEST_CASE("request_config stream insertion operator works", "[request-config]")
 
 	::std::string expected("gpiod::request_config(consumer='foobar', event_buffer_size=32)");
 
-	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
+	REQUIRE_THAT(buf.str(), Catch::Matchers::Equals(expected));
 }
 
 } /* namespace */
diff --git a/configure.ac b/configure.ac
index a2370c5..216007e 100644
--- a/configure.ac
+++ b/configure.ac
@@ -206,9 +206,9 @@ then
 
 	if test "x$with_tests" = xtrue
 	then
-		PKG_CHECK_MODULES([CATCH2], [catch2],, [
+		PKG_CHECK_MODULES([CATCH2], [catch2-with-main],, [
 			AC_LANG_PUSH([C++])
-			AC_CHECK_HEADERS([catch2/catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch.hpp])])
+			AC_CHECK_HEADERS([catch2/catch_all.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch_all.hpp])])
 			AC_LANG_POP([C++])
 		])
 	fi

