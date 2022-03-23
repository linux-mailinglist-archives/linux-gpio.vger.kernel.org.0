Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34804E542A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 15:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237111AbiCWOYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 10:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbiCWOYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 10:24:19 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DDF7520B
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 07:22:43 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m30so2393302wrb.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/xkw8nVarvA8XFTKmWQWq/N2kGpkJ0DtLWRJxpZL5E=;
        b=vbe8q6DT3FdGVO4lKtwA+jFNkSyX8BAXzWKBgA0x78j+J0StYZElReHa2RIIH7a9F2
         ew7Nv8H6jFLIf6m0g5d4ELY94liGu+/TKJfQAHABXcD0mgHg377Xh3KjInLcbSTuuD2/
         +ajYkO7No+Ydsh+ExC8mfHTphCBwLr3ejvtRm4cy29W/E1epYxnGI76RcOWxWyk9o/+7
         JbmOBCACsk4/9uvEZaHnYaLatC1cKnnLYkqoI8Q5VV7FR58RBCTNmKtAEGuVnw5uvgFU
         IDpUB5p2ojgJ4g0GE2geU4GQAazSGMoq4CEOsQsJfX+6CuARCwcfrq6E29Dqd6EdELpe
         QsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/xkw8nVarvA8XFTKmWQWq/N2kGpkJ0DtLWRJxpZL5E=;
        b=Wg3wSVW2AJanAbUbhVq+28Z6mLTkBSVcHe3m3zlAo4qA0ZQ39duPql3b5vAq4VF5Lz
         6fLb71+yYqEWkRAo9TuoBTPO1Wy8IneYP0qz8vlIXpwPnvPOOLrt7WZLQR4MCGMK5cnr
         3eGzJZW1+h0bqBQpOR0xZxGFqxzdaIHAcDulAEpXqAopjjLZfSmwx65tFcGn3qMc3S2v
         yOlkYP0qhBNLsppIqP7B0j+DdMGa32eZZyja9uzjGxIALJ4zZQnGI0T8nwVcA9QDCpFQ
         bOdkSCCyGjARn+C5hvKk6lFeZrLrUjluMn6cMKpMWkfbFW0GkPAdUc/J1UHdjwfUJjr6
         /7NQ==
X-Gm-Message-State: AOAM531+F/LQyldKbhVoe5JCefmTNTmnY/A7hTHjEsEQeLaTjHhz+JQR
        1aqZNCvN2KRtBvXbpoq5SKqcIA==
X-Google-Smtp-Source: ABdhPJwQQLpNjNkUdMB5kqtEkC1eicLSL/i/BgkZMMVp1C2SWbqz32t8Ssv+2XeOCYvYPbcjVCCLDw==
X-Received: by 2002:adf:e789:0:b0:205:8e6e:caa7 with SMTP id n9-20020adfe789000000b002058e6ecaa7mr44792wrm.576.1648045359925;
        Wed, 23 Mar 2022 07:22:39 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c354800b0038b7d32e706sm65682wmq.7.2022.03.23.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 07:22:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v5] bindings: cxx: implement C++ bindings for libgpiod v2.0
Date:   Wed, 23 Mar 2022 15:22:36 +0100
Message-Id: <20220323142236.670890-1-brgl@bgdev.pl>
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

This rewrites the C++ bindings for libgpiod in order to work with v2.0
version of the C API. The C++ standard use is C++17 which is well
supported in GCC. The documentation covers the entire API so for details
please refer to it, the tests and example programs.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v4 -> v5:

While this is technically the fifth iteration of C++ bindings I'm posting, the
change are so many, it doesn't make sense to list them here - especially since
the C API changed in the meantime too. This time the tests have been rewritten
as well so the bindings can actually be tested using gpio-sim.

 Doxyfile.in                                 |   4 +-
 bindings/cxx/Makefile.am                    |  23 +-
 bindings/cxx/chip-info.cpp                  |  74 ++
 bindings/cxx/chip.cpp                       | 213 +++--
 bindings/cxx/edge-event-buffer.cpp          | 115 +++
 bindings/cxx/edge-event.cpp                 | 135 +++
 bindings/cxx/examples/Makefile.am           |  12 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |  10 +-
 bindings/cxx/examples/gpiofindcxx.cpp       |   2 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  19 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  64 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  53 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  33 +-
 bindings/cxx/exception.cpp                  | 119 +++
 bindings/cxx/gpiod.hpp                      | 944 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  18 +
 bindings/cxx/gpiodcxx/chip-info.hpp         | 105 +++
 bindings/cxx/gpiodcxx/chip.hpp              | 179 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 129 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 137 +++
 bindings/cxx/gpiodcxx/exception.hpp         | 158 ++++
 bindings/cxx/gpiodcxx/info-event.hpp        | 123 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 564 ++++++++++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 176 ++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 221 +++++
 bindings/cxx/gpiodcxx/line.hpp              | 274 ++++++
 bindings/cxx/gpiodcxx/misc.hpp              |  44 +
 bindings/cxx/gpiodcxx/request-config.hpp    | 163 ++++
 bindings/cxx/gpiodcxx/timestamp.hpp         | 122 +++
 bindings/cxx/info-event.cpp                 | 102 +++
 bindings/cxx/internal.cpp                   |  28 +
 bindings/cxx/internal.hpp                   | 208 ++++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 685 ++++++++++++++
 bindings/cxx/line-info.cpp                  | 189 ++++
 bindings/cxx/line-request.cpp               | 224 +++++
 bindings/cxx/line.cpp                       | 331 ++-----
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  20 +
 bindings/cxx/request-config.cpp             | 174 ++++
 bindings/cxx/tests/Makefile.am              |  27 +-
 bindings/cxx/tests/check-kernel.cpp         |  48 +
 bindings/cxx/tests/gpio-mockup.cpp          | 153 ----
 bindings/cxx/tests/gpio-mockup.hpp          |  94 --
 bindings/cxx/tests/gpiod-cxx-test.cpp       |  55 --
 bindings/cxx/tests/gpiosim.cpp              | 264 ++++++
 bindings/cxx/tests/gpiosim.hpp              |  69 ++
 bindings/cxx/tests/helpers.cpp              |  37 +
 bindings/cxx/tests/helpers.hpp              |  36 +
 bindings/cxx/tests/tests-chip-info.cpp      |  91 ++
 bindings/cxx/tests/tests-chip.cpp           | 219 +++--
 bindings/cxx/tests/tests-edge-event.cpp     | 417 +++++++++
 bindings/cxx/tests/tests-event.cpp          | 280 ------
 bindings/cxx/tests/tests-info-event.cpp     | 198 ++++
 bindings/cxx/tests/tests-iter.cpp           |  21 -
 bindings/cxx/tests/tests-line-config.cpp    | 270 ++++++
 bindings/cxx/tests/tests-line-info.cpp      | 140 +++
 bindings/cxx/tests/tests-line-request.cpp   | 494 ++++++++++
 bindings/cxx/tests/tests-line.cpp           | 467 ----------
 bindings/cxx/tests/tests-misc.cpp           |  78 ++
 bindings/cxx/tests/tests-request-config.cpp | 155 ++++
 configure.ac                                |   1 +
 62 files changed, 7270 insertions(+), 2964 deletions(-)
 create mode 100644 bindings/cxx/chip-info.cpp
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/exception.cpp
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 create mode 100644 bindings/cxx/gpiodcxx/chip-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/exception.hpp
 create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line.hpp
 create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
 create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/timestamp.hpp
 create mode 100644 bindings/cxx/info-event.cpp
 create mode 100644 bindings/cxx/internal.cpp
 delete mode 100644 bindings/cxx/iter.cpp
 create mode 100644 bindings/cxx/line-config.cpp
 create mode 100644 bindings/cxx/line-info.cpp
 create mode 100644 bindings/cxx/line-request.cpp
 delete mode 100644 bindings/cxx/line_bulk.cpp
 create mode 100644 bindings/cxx/misc.cpp
 create mode 100644 bindings/cxx/request-config.cpp
 create mode 100644 bindings/cxx/tests/check-kernel.cpp
 delete mode 100644 bindings/cxx/tests/gpio-mockup.cpp
 delete mode 100644 bindings/cxx/tests/gpio-mockup.hpp
 delete mode 100644 bindings/cxx/tests/gpiod-cxx-test.cpp
 create mode 100644 bindings/cxx/tests/gpiosim.cpp
 create mode 100644 bindings/cxx/tests/gpiosim.hpp
 create mode 100644 bindings/cxx/tests/helpers.cpp
 create mode 100644 bindings/cxx/tests/helpers.hpp
 create mode 100644 bindings/cxx/tests/tests-chip-info.cpp
 create mode 100644 bindings/cxx/tests/tests-edge-event.cpp
 delete mode 100644 bindings/cxx/tests/tests-event.cpp
 create mode 100644 bindings/cxx/tests/tests-info-event.cpp
 delete mode 100644 bindings/cxx/tests/tests-iter.cpp
 create mode 100644 bindings/cxx/tests/tests-line-config.cpp
 create mode 100644 bindings/cxx/tests/tests-line-info.cpp
 create mode 100644 bindings/cxx/tests/tests-line-request.cpp
 delete mode 100644 bindings/cxx/tests/tests-line.cpp
 create mode 100644 bindings/cxx/tests/tests-misc.cpp
 create mode 100644 bindings/cxx/tests/tests-request-config.cpp

diff --git a/Doxyfile.in b/Doxyfile.in
index 0ff735d..9c85e21 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -44,7 +44,9 @@ WARNINGS               = YES
 WARN_IF_UNDOCUMENTED   = YES
 WARN_FORMAT            =
 WARN_LOGFILE           =
-INPUT                  = @top_srcdir@/include/gpiod.h @top_srcdir@/bindings/cxx/gpiod.hpp
+INPUT                  = @top_srcdir@/include/gpiod.h \
+                         @top_srcdir@/bindings/cxx/gpiod.hpp \
+                         @top_srcdir@/bindings/cxx/gpiodcxx/
 SOURCE_BROWSER         = YES
 INLINE_SOURCES         = NO
 REFERENCED_BY_RELATION = YES
diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index d9fa577..29d4f2d 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -2,18 +2,35 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES = chip.cpp internal.h iter.cpp line.cpp line_bulk.cpp
-libgpiodcxx_la_CPPFLAGS = -Wall -Wextra -g -std=gnu++11
+libgpiodcxx_la_SOURCES =	\
+	chip.cpp		\
+	chip-info.cpp		\
+	edge-event-buffer.cpp	\
+	edge-event.cpp		\
+	exception.cpp		\
+	info-event.cpp		\
+	internal.cpp		\
+	internal.hpp		\
+	line.cpp		\
+	line-config.cpp		\
+	line-info.cpp		\
+	line-request.cpp	\
+	misc.cpp		\
+	request-config.cpp
+
+libgpiodcxx_la_CPPFLAGS = -Wall -Wextra -g -std=gnu++17
 libgpiodcxx_la_CPPFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
+libgpiodcxx_la_CPPFLAGS += $(PROFILING_CFLAGS)
 libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
 libgpiodcxx_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
+libgpiodcxx_la_LDFLAGS += $(PROFILING_LDFLAGS)
 
 include_HEADERS = gpiod.hpp
 
 pkgconfigdir = $(libdir)/pkgconfig
 pkgconfig_DATA = libgpiodcxx.pc
 
-SUBDIRS = .
+SUBDIRS = gpiodcxx .
 
 if WITH_TESTS
 
diff --git a/bindings/cxx/chip-info.cpp b/bindings/cxx/chip-info.cpp
new file mode 100644
index 0000000..bd66758
--- /dev/null
+++ b/bindings/cxx/chip-info.cpp
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+void chip_info::impl::set_info_ptr(chip_info_ptr& new_info)
+{
+	this->info = ::std::move(new_info);
+}
+
+GPIOD_CXX_API chip_info::chip_info(void)
+	: _m_priv(new impl)
+{
+
+}
+
+GPIOD_CXX_API chip_info::chip_info(const chip_info& other)
+	: _m_priv(other._m_priv)
+{
+
+}
+
+GPIOD_CXX_API chip_info::chip_info(chip_info&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API chip_info::~chip_info(void)
+{
+
+}
+
+GPIOD_CXX_API chip_info& chip_info::operator=(const chip_info& other)
+{
+	this->_m_priv = other._m_priv;
+
+	return *this;
+}
+
+GPIOD_CXX_API chip_info& chip_info::operator=(chip_info&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API ::std::string chip_info::name(void) const noexcept
+{
+	return ::gpiod_chip_info_get_name(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::string chip_info::label(void) const noexcept
+{
+	return ::gpiod_chip_info_get_label(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::size_t chip_info::num_lines(void) const noexcept
+{
+	return ::gpiod_chip_info_get_num_lines(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const chip_info& info)
+{
+	out << "chip_info(name=\"" << info.name() <<
+	       "\", label=\"" << info.label() <<
+	       "\", num_lines=" << info.num_lines() << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index ee6ab6f..b87d750 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -1,11 +1,5 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <functional>
-#include <gpiod.hpp>
-#include <map>
-#include <system_error>
-#include <utility>
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include "internal.hpp"
 
@@ -13,145 +7,212 @@ namespace gpiod {
 
 namespace {
 
-GPIOD_CXX_API void chip_deleter(::gpiod_chip* chip)
+using chip_deleter = deleter<::gpiod_chip, ::gpiod_chip_close>;
+using chip_ptr = ::std::unique_ptr<::gpiod_chip, chip_deleter>;
+
+chip_ptr open_chip(const ::std::filesystem::path& path)
 {
-	::gpiod_chip_unref(chip);
+	chip_ptr chip(::gpiod_chip_open(path.c_str()));
+	if (!chip)
+		throw_from_errno("unable to open the GPIO device " + path.string());
+
+	return chip;
 }
 
 } /* namespace */
 
-GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
+struct chip::impl
 {
-	return ::gpiod_is_gpiochip_device(path.c_str());
-}
+	impl(const ::std::filesystem::path& path)
+		: chip(open_chip(path))
+	{
+
+	}
+
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	void throw_if_closed(void) const
+	{
+		if (!this->chip)
+			throw chip_closed("GPIO chip has been closed");
+	}
 
-GPIOD_CXX_API chip::chip(const ::std::string& path)
-	: _m_chip()
+	chip_ptr chip;
+};
+
+GPIOD_CXX_API chip::chip(const ::std::filesystem::path& path)
+	: _m_priv(new impl(path))
 {
-	this->open(path);
+
 }
 
-GPIOD_CXX_API chip::chip(::gpiod_chip* chip)
-	: _m_chip(chip, chip_deleter)
+GPIOD_CXX_API chip::chip(chip&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
 {
 
 }
 
-GPIOD_CXX_API chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
-	: _m_chip(chip_ptr)
+GPIOD_CXX_API chip::~chip(void)
 {
 
 }
 
-GPIOD_CXX_API void chip::open(const ::std::string& path)
+GPIOD_CXX_API chip& chip::operator=(chip&& other) noexcept
 {
-	::gpiod_chip *chip = ::gpiod_chip_open(path.c_str());
-	if (!chip)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "cannot open GPIO device " + path);
+	this->_m_priv = ::std::move(other._m_priv);
 
-	this->_m_chip.reset(chip, chip_deleter);
+	return *this;
 }
 
-GPIOD_CXX_API void chip::reset(void) noexcept
+GPIOD_CXX_API chip::operator bool(void) const noexcept
 {
-	this->_m_chip.reset();
+	return this->_m_priv->chip.get() != nullptr;
 }
 
-GPIOD_CXX_API ::std::string chip::name(void) const
+GPIOD_CXX_API void chip::close(void)
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::std::string(::gpiod_chip_get_name(this->_m_chip.get()));
+	this->_m_priv->chip.reset();
 }
 
-GPIOD_CXX_API ::std::string chip::label(void) const
+GPIOD_CXX_API ::std::filesystem::path chip::path(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::std::string(::gpiod_chip_get_label(this->_m_chip.get()));
+	return ::gpiod_chip_get_path(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API unsigned int chip::num_lines(void) const
+GPIOD_CXX_API chip_info chip::get_info(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
+
+	chip_info_ptr info(::gpiod_chip_get_info(this->_m_priv->chip.get()));
+	if (!info)
+		throw_from_errno("failed to retrieve GPIO chip info");
 
-	return ::gpiod_chip_get_num_lines(this->_m_chip.get());
+	chip_info ret;
+
+	ret._m_priv->set_info_ptr(info);
+
+	return ret;
 }
 
-GPIOD_CXX_API line chip::get_line(unsigned int offset) const
+GPIOD_CXX_API line_info chip::get_line_info(line::offset offset) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
+
+	line_info_ptr info(::gpiod_chip_get_line_info(this->_m_priv->chip.get(), offset));
+	if (!info)
+		throw_from_errno("unable to retrieve GPIO line info");
 
-	if (offset >= this->num_lines())
-		throw ::std::out_of_range("line offset greater than the number of lines");
+	line_info ret;
 
-	::gpiod_line* line_handle = ::gpiod_chip_get_line(this->_m_chip.get(), offset);
-	if (!line_handle)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error getting GPIO line from chip");
+	ret._m_priv->set_info_ptr(info);
 
-	return line(line_handle, *this);
+	return ret;
 }
 
-GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
+GPIOD_CXX_API line_info chip::watch_line_info(line::offset offset) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	for (unsigned int offset = 0; offset < this->num_lines(); offset++) {
-		auto line = this->get_line(offset);
+	line_info_ptr info(::gpiod_chip_watch_line_info(this->_m_priv->chip.get(), offset));
+	if (!info)
+		throw_from_errno("unable to start watching GPIO line info changes");
 
-		if (line.name() == name)
-			return offset;
-	}
+	line_info ret;
 
-	return -1;
+	ret._m_priv->set_info_ptr(info);
+
+	return ret;
 }
 
-GPIOD_CXX_API line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
+GPIOD_CXX_API void chip::unwatch_line_info(line::offset offset) const
 {
-	line_bulk lines;
-
-	for (auto& it: offsets)
-		lines.append(this->get_line(it));
+	this->_m_priv->throw_if_closed();
 
-	return lines;
+	int ret = ::gpiod_chip_unwatch_line_info(this->_m_priv->chip.get(), offset);
+	if (ret)
+		throw_from_errno("unable to unwatch line status changes");
 }
 
-GPIOD_CXX_API line_bulk chip::get_all_lines(void) const
+GPIOD_CXX_API int chip::fd(void) const
 {
-	line_bulk lines;
-
-	for (unsigned int i = 0; i < this->num_lines(); i++)
-		lines.append(this->get_line(i));
+	this->_m_priv->throw_if_closed();
 
-	return lines;
+	return ::gpiod_chip_get_fd(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API bool chip::operator==(const chip& rhs) const noexcept
+GPIOD_CXX_API bool chip::wait_info_event(const ::std::chrono::nanoseconds& timeout) const
 {
-	return this->_m_chip.get() == rhs._m_chip.get();
+	this->_m_priv->throw_if_closed();
+
+	int ret = ::gpiod_chip_wait_info_event(this->_m_priv->chip.get(), timeout.count());
+	if (ret < 0)
+		throw_from_errno("error waiting for info events");
+
+	return ret;
 }
 
-GPIOD_CXX_API bool chip::operator!=(const chip& rhs) const noexcept
+GPIOD_CXX_API info_event chip::read_info_event(void) const
 {
-	return this->_m_chip.get() != rhs._m_chip.get();
+	this->_m_priv->throw_if_closed();
+
+	info_event_ptr event(gpiod_chip_read_info_event(this->_m_priv->chip.get()));
+	if (!event)
+		throw_from_errno("error reading the line info event_handle");
+
+	info_event ret;
+	ret._m_priv->set_info_event_ptr(event);
+
+	return ret;
 }
 
-GPIOD_CXX_API chip::operator bool(void) const noexcept
+GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
 {
-	return this->_m_chip.get() != nullptr;
+	this->_m_priv->throw_if_closed();
+
+	int ret = ::gpiod_chip_find_line(this->_m_priv->chip.get(), name.c_str());
+	if (ret < 0) {
+		if (errno == ENOENT)
+			return -1;
+
+		throw_from_errno("error looking up line by name");
+	}
+
+	return ret;
 }
 
-GPIOD_CXX_API bool chip::operator!(void) const noexcept
+GPIOD_CXX_API line_request chip::request_lines(const request_config& req_cfg,
+					       const line_config& line_cfg)
 {
-	return this->_m_chip.get() == nullptr;
+	this->_m_priv->throw_if_closed();
+
+	line_request_ptr request(::gpiod_chip_request_lines(this->_m_priv->chip.get(),
+							    req_cfg._m_priv->config.get(),
+							    line_cfg._m_priv->config.get()));
+	if (!request)
+		throw_from_errno("error requesting GPIO lines");
+
+	line_request ret;
+	ret._m_priv.get()->set_request_ptr(request);
+
+	return ret;
 }
 
-GPIOD_CXX_API void chip::throw_if_noref(void) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const chip& chip)
 {
-	if (!this->_m_chip.get())
-		throw ::std::logic_error("object not associated with an open GPIO chip");
+	if (!chip)
+		out << "chip(closed)";
+	else
+		out << "chip(path=" << chip.path() <<
+		       ", info=" << chip.get_info() << ")";
+
+	return out;
 }
 
 } /* namespace gpiod */
diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
new file mode 100644
index 0000000..1a90ce5
--- /dev/null
+++ b/bindings/cxx/edge-event-buffer.cpp
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <iterator>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+::gpiod_edge_event_buffer* make_edge_event_buffer(unsigned int capacity)
+{
+	::gpiod_edge_event_buffer* buffer = ::gpiod_edge_event_buffer_new(capacity);
+	if (!buffer)
+		throw_from_errno("unable to allocate the edge event buffer");
+
+	return buffer;
+}
+
+} /* namespace */
+
+edge_event_buffer::impl::impl(unsigned int capacity)
+	: buffer(make_edge_event_buffer(capacity)),
+	  events()
+{
+	events.reserve(capacity);
+
+	for (unsigned int i = 0; i < capacity; i++) {
+		events.push_back(edge_event());
+		events.back()._m_priv.reset(new edge_event::impl_external);
+	}
+}
+
+int edge_event_buffer::impl::read_events(const line_request_ptr& request, unsigned int max_events)
+{
+	int ret = ::gpiod_line_request_read_edge_event(request.get(),
+						       this->buffer.get(), max_events);
+	if (ret < 0)
+		throw_from_errno("error reading edge events from file descriptor");
+
+	for (int i = 0; i < ret; i++) {
+		::gpiod_edge_event* event = ::gpiod_edge_event_buffer_get_event(this->buffer.get(), i);
+
+		dynamic_cast<edge_event::impl_external&>(*this->events[i]._m_priv).event = event;
+	}
+
+	return ret;
+}
+
+GPIOD_CXX_API edge_event_buffer::edge_event_buffer(::std::size_t capacity)
+	: _m_priv(new impl(capacity))
+{
+
+}
+
+GPIOD_CXX_API edge_event_buffer::edge_event_buffer(edge_event_buffer&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API edge_event_buffer::~edge_event_buffer(void)
+{
+
+}
+
+GPIOD_CXX_API edge_event_buffer& edge_event_buffer::operator=(edge_event_buffer&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API const edge_event& edge_event_buffer::get_event(unsigned int index) const
+{
+	return this->_m_priv->events.at(index);
+}
+
+GPIOD_CXX_API ::std::size_t edge_event_buffer::num_events(void) const
+{
+	return ::gpiod_edge_event_buffer_get_num_events(this->_m_priv->buffer.get());
+}
+
+GPIOD_CXX_API ::std::size_t edge_event_buffer::capacity(void) const noexcept
+{
+	return ::gpiod_edge_event_buffer_get_capacity(this->_m_priv->buffer.get());
+}
+
+GPIOD_CXX_API edge_event_buffer::const_iterator edge_event_buffer::begin(void) const noexcept
+{
+	return this->_m_priv->events.begin();
+}
+
+GPIOD_CXX_API edge_event_buffer::const_iterator edge_event_buffer::end(void) const noexcept
+{
+	return this->_m_priv->events.begin() + this->num_events();
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const edge_event_buffer& buf)
+{
+	out << "edge_event_buffer(num_events=" << buf.num_events() <<
+	       ", capacity=" << buf.capacity() <<
+	       ", events=[";
+
+	::std::copy(buf.begin(), ::std::prev(buf.end()),
+		    ::std::ostream_iterator<edge_event>(out, ", "));
+	out << *(::std::prev(buf.end()));
+
+	out << "])";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
new file mode 100644
index 0000000..282f4bc
--- /dev/null
+++ b/bindings/cxx/edge-event.cpp
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<int, edge_event::event_type> event_type_mapping = {
+	{ GPIOD_EDGE_EVENT_RISING_EDGE,		edge_event::event_type::RISING_EDGE },
+	{ GPIOD_EDGE_EVENT_FALLING_EDGE,	edge_event::event_type::FALLING_EDGE }
+};
+
+const ::std::map<edge_event::event_type, ::std::string> event_type_names = {
+	{ edge_event::event_type::RISING_EDGE,		"RISING_EDGE" },
+	{ edge_event::event_type::FALLING_EDGE,		"FALLING_EDGE" }
+};
+
+} /* namespace */
+
+::gpiod_edge_event* edge_event::impl_managed::get_event_ptr(void) const noexcept
+{
+	return this->event.get();
+}
+
+::std::shared_ptr<edge_event::impl>
+edge_event::impl_managed::copy(const ::std::shared_ptr<impl>& self) const
+{
+	return self;
+}
+
+edge_event::impl_external::impl_external(void)
+	: impl(),
+	  event(nullptr)
+{
+
+}
+
+::gpiod_edge_event* edge_event::impl_external::get_event_ptr(void) const noexcept
+{
+	return this->event;
+}
+
+::std::shared_ptr<edge_event::impl>
+edge_event::impl_external::copy(const ::std::shared_ptr<impl>& self GPIOD_CXX_UNUSED) const
+{
+	::std::shared_ptr<impl> ret(new impl_managed);
+	impl_managed& managed = dynamic_cast<impl_managed&>(*ret);
+
+	managed.event.reset(::gpiod_edge_event_copy(this->event));
+	if (!managed.event)
+		throw_from_errno("unable to copy the edge event object");
+
+	return ret;
+}
+
+edge_event::edge_event(void)
+	: _m_priv()
+{
+
+}
+
+GPIOD_CXX_API edge_event::edge_event(const edge_event& other)
+	: _m_priv(other._m_priv->copy(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API edge_event::edge_event(edge_event&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API edge_event::~edge_event(void)
+{
+
+}
+
+GPIOD_CXX_API edge_event& edge_event::operator=(const edge_event& other)
+{
+	this->_m_priv = other._m_priv->copy(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API edge_event& edge_event::operator=(edge_event&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API edge_event::event_type edge_event::type(void) const
+{
+	int evtype = ::gpiod_edge_event_get_event_type(this->_m_priv->get_event_ptr());
+
+	return map_int_to_enum(evtype, event_type_mapping);
+}
+
+GPIOD_CXX_API timestamp edge_event::timestamp_ns(void) const noexcept
+{
+	return ::gpiod_edge_event_get_timestamp_ns(this->_m_priv->get_event_ptr());
+}
+
+GPIOD_CXX_API line::offset edge_event::line_offset(void) const noexcept
+{
+	return ::gpiod_edge_event_get_line_offset(this->_m_priv->get_event_ptr());
+}
+
+GPIOD_CXX_API unsigned long edge_event::global_seqno(void) const noexcept
+{
+	return ::gpiod_edge_event_get_global_seqno(this->_m_priv->get_event_ptr());
+}
+
+GPIOD_CXX_API unsigned long edge_event::line_seqno(void) const noexcept
+{
+	return ::gpiod_edge_event_get_line_seqno(this->_m_priv->get_event_ptr());
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const edge_event& event)
+{
+	out << "edge_event(type='" << event_type_names.at(event.type()) <<
+	       "', timestamp=" << event.timestamp_ns() <<
+	       ", line_offset=" << event.line_offset() <<
+	       ", global_seqno=" << event.global_seqno() <<
+	       ", line_seqno=" << event.line_seqno() << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index 748b581..7e29616 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -5,12 +5,12 @@ AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++17
 AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/ -lstdc++fs
 
-noinst_PROGRAMS =				\
-		gpiodetectcxx			\
-		gpiofindcxx			\
-		gpiogetcxx			\
-		gpioinfocxx			\
-		gpiomoncxx			\
+noinst_PROGRAMS = \
+		gpiodetectcxx \
+		gpiofindcxx \
+		gpiogetcxx \
+		gpioinfocxx \
+		gpiomoncxx \
 		gpiosetcxx
 
 gpiodetectcxx_SOURCES = gpiodetectcxx.cpp
diff --git a/bindings/cxx/examples/gpiodetectcxx.cpp b/bindings/cxx/examples/gpiodetectcxx.cpp
index 872cd96..7dbb0e0 100644
--- a/bindings/cxx/examples/gpiodetectcxx.cpp
+++ b/bindings/cxx/examples/gpiodetectcxx.cpp
@@ -3,10 +3,9 @@
 
 /* C++ reimplementation of the gpiodetect tool. */
 
-#include <gpiod.hpp>
-
 #include <cstdlib>
 #include <filesystem>
+#include <gpiod.hpp>
 #include <iostream>
 
 int main(int argc, char **argv)
@@ -19,10 +18,11 @@ int main(int argc, char **argv)
 	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
 		if (::gpiod::is_gpiochip_device(entry.path())) {
 			::gpiod::chip chip(entry.path());
+			auto info = chip.get_info();
 
-			::std::cout << chip.name() << " ["
-				    << chip.label() << "] ("
-				    << chip.num_lines() << " lines)" << ::std::endl;
+			::std::cout << info.name() << " [" <<
+				       info.label() << "] (" <<
+				       info.num_lines() << " lines)" << ::std::endl;
 		}
 	}
 
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index ec4d79b..a0f7fbf 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -22,7 +22,7 @@ int main(int argc, char **argv)
 
 			auto offset = chip.find_line(argv[1]);
 			if (offset >= 0) {
-				::std::cout << chip.name() << " " << offset << ::std::endl;
+				::std::cout << chip.get_info().name() << " " << offset << ::std::endl;
 				return EXIT_SUCCESS;
 			}
 		}
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
index 94b3dac..0136f5f 100644
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -15,24 +15,23 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::std::vector<unsigned int> offsets;
+	::gpiod::line::offsets offsets;
 
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
+	auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ ::gpiod::request_config::property::OFFSETS, offsets },
+				{ ::gpiod::request_config::property::CONSUMER, "gpiogetcxx" }
+			}),
+			::gpiod::line_config());
 
-	lines.request({
-		argv[0],
-		::gpiod::line_request::DIRECTION_INPUT,
-		0
-	});
-
-	auto vals = lines.get_values();
+	auto vals = request.get_values();
 
 	for (auto& it: vals)
-		::std::cout << it << ' ';
+		::std::cout << (it == ::gpiod::line::value::ACTIVE ? "1" : "0") << ' ';
 	::std::cout << ::std::endl;
 
 	return EXIT_SUCCESS;
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
index 2175adc..3612092 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -9,42 +9,52 @@
 #include <filesystem>
 #include <iostream>
 
-int main(int argc, char **argv)
+namespace {
+
+void show_chip(const ::gpiod::chip& chip)
 {
-	if (argc != 1) {
-		::std::cerr << "usage: " << argv[0] << ::std::endl;
-		return EXIT_FAILURE;
-	}
+	auto info = chip.get_info();
 
-	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
-		if (::gpiod::is_gpiochip_device(entry.path())) {
-			::gpiod::chip chip(entry.path());
+	::std::cout << info.name() << " - " << info.num_lines() << " lines:" << ::std::endl;
+
+	for (unsigned int offset = 0; offset < info.num_lines(); offset++) {
+		auto info = chip.get_line_info(offset);
 
-			::std::cout << chip.name() << " - " << chip.num_lines() << " lines:" << ::std::endl;
+		::std::cout << "\tline ";
+		::std::cout.width(3);
+		::std::cout << info.offset() << ": ";
 
-			for (auto& lit: ::gpiod::line_iter(chip)) {
-				::std::cout << "\tline ";
-				::std::cout.width(3);
-				::std::cout << lit.offset() << ": ";
+		::std::cout.width(12);
+		::std::cout << (info.name().empty() ? "unnamed" : info.name());
+		::std::cout << " ";
 
-				::std::cout.width(12);
-				::std::cout << (lit.name().empty() ? "unnamed" : lit.name());
-				::std::cout << " ";
+		::std::cout.width(12);
+		::std::cout << (info.consumer().empty() ? "unused" : info.consumer());
+		::std::cout << " ";
 
-				::std::cout.width(12);
-				::std::cout << (lit.consumer().empty() ? "unused" : lit.consumer());
-				::std::cout << " ";
+		::std::cout.width(8);
+		::std::cout << (info.direction() == ::gpiod::line::direction::INPUT ? "input" : "output");
+		::std::cout << " ";
 
-				::std::cout.width(8);
-				::std::cout << (lit.direction() == ::gpiod::line::DIRECTION_INPUT ? "input" : "output");
-				::std::cout << " ";
+		::std::cout.width(10);
+		::std::cout << (info.active_low() ? "active-low" : "active-high");
 
-				::std::cout.width(10);
-				::std::cout << (lit.is_active_low() ? "active-low" : "active-high");
+		::std::cout << ::std::endl;
+	}
+}
 
-				::std::cout << ::std::endl;
-			}
-		}
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
 	}
 
 	return EXIT_SUCCESS;
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
index 4d6ac6e..db053dd 100644
--- a/bindings/cxx/examples/gpiomoncxx.cpp
+++ b/bindings/cxx/examples/gpiomoncxx.cpp
@@ -3,29 +3,27 @@
 
 /* Simplified C++ reimplementation of the gpiomon tool. */
 
-#include <gpiod.hpp>
-
+#include <chrono>
 #include <cstdlib>
+#include <gpiod.hpp>
 #include <iostream>
 
 namespace {
 
-void print_event(const ::gpiod::line_event& event)
+void print_event(const ::gpiod::edge_event& event)
 {
-	if (event.event_type == ::gpiod::line_event::RISING_EDGE)
+	if (event.type() == ::gpiod::edge_event::event_type::RISING_EDGE)
 		::std::cout << " RISING EDGE";
-	else if (event.event_type == ::gpiod::line_event::FALLING_EDGE)
-		::std::cout << "FALLING EDGE";
 	else
-		throw ::std::logic_error("invalid event type");
+		::std::cout << "FALLING EDGE";
 
 	::std::cout << " ";
 
-	::std::cout << ::std::chrono::duration_cast<::std::chrono::seconds>(event.timestamp).count();
+	::std::cout << event.timestamp_ns() / 1000000000;
 	::std::cout << ".";
-	::std::cout << event.timestamp.count() % 1000000000;
+	::std::cout << event.timestamp_ns() % 1000000000;
 
-	::std::cout << " line: " << event.source.offset();
+	::std::cout << " line: " << event.line_offset();
 
 	::std::cout << ::std::endl;
 }
@@ -39,25 +37,36 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::std::vector<unsigned int> offsets;
+	::gpiod::line::offsets offsets;
 	offsets.reserve(argc);
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
-
-	lines.request({
-		argv[0],
-		::gpiod::line_request::EVENT_BOTH_EDGES,
-		0,
-	});
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
 
 	for (;;) {
-		auto events = lines.event_wait(::std::chrono::seconds(1));
-		if (events) {
-			for (auto& it: events)
-				print_event(it.event_read());
+		if (request.wait_edge_event(::std::chrono::seconds(5))) {
+			request.read_edge_event(buffer);
+
+			for (const auto& event: buffer)
+				print_event(event);
 		}
 	}
 
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index 71b27a9..838d801 100644
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -11,12 +11,13 @@
 int main(int argc, char **argv)
 {
 	if (argc < 3) {
-		::std::cerr << "usage: " << argv[0] << " <chip> <line_offset0>=<value0> ..." << ::std::endl;
+		::std::cerr << "usage: " << argv[0] <<
+			       " <chip> <line_offset0>=<value0> ..." << ::std::endl;
 		return EXIT_FAILURE;
 	}
 
-	::std::vector<unsigned int> offsets;
-	::std::vector<int> values;
+	::gpiod::line::offsets offsets;
+	::gpiod::line::values values;
 
 	for (int i = 2; i < argc; i++) {
 		::std::string arg(argv[i]);
@@ -27,20 +28,28 @@ int main(int argc, char **argv)
 		::std::string value(arg.substr(pos + 1, ::std::string::npos));
 
 		if (offset.empty() || value.empty())
-			throw ::std::invalid_argument("invalid argument: " + ::std::string(argv[i]));
+			throw ::std::invalid_argument("invalid offset=value mapping: " +
+						      ::std::string(argv[i]));
 
 		offsets.push_back(::std::stoul(offset));
-		values.push_back(::std::stoul(value));
+		values.push_back(::std::stoul(value) ? ::gpiod::line::value::ACTIVE :
+						       ::gpiod::line::value::INACTIVE);
 	}
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
-
-	lines.request({
-		argv[0],
-		::gpiod::line_request::DIRECTION_OUTPUT,
-		0
-	}, values);
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
 
 	::std::cin.get();
 
diff --git a/bindings/cxx/exception.cpp b/bindings/cxx/exception.cpp
new file mode 100644
index 0000000..6a015a0
--- /dev/null
+++ b/bindings/cxx/exception.cpp
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+GPIOD_CXX_API chip_closed::chip_closed(const ::std::string& what)
+	: ::std::logic_error(what)
+{
+
+}
+
+GPIOD_CXX_API chip_closed::chip_closed(const chip_closed& other) noexcept
+	: ::std::logic_error(other)
+{
+
+}
+
+GPIOD_CXX_API chip_closed::chip_closed(chip_closed&& other) noexcept
+	: ::std::logic_error(other)
+{
+
+}
+
+GPIOD_CXX_API chip_closed& chip_closed::operator=(const chip_closed& other) noexcept
+{
+	::std::logic_error::operator=(other);
+
+	return *this;
+}
+
+GPIOD_CXX_API chip_closed& chip_closed::operator=(chip_closed&& other) noexcept
+{
+	::std::logic_error::operator=(other);
+
+	return *this;
+}
+
+GPIOD_CXX_API chip_closed::~chip_closed(void)
+{
+
+}
+
+GPIOD_CXX_API request_released::request_released(const ::std::string& what)
+	: ::std::logic_error(what)
+{
+
+}
+
+GPIOD_CXX_API request_released::request_released(const request_released& other) noexcept
+	: ::std::logic_error(other)
+{
+
+}
+
+GPIOD_CXX_API request_released::request_released(request_released&& other) noexcept
+	: ::std::logic_error(other)
+{
+
+}
+
+GPIOD_CXX_API request_released& request_released::operator=(const request_released& other) noexcept
+{
+	::std::logic_error::operator=(other);
+
+	return *this;
+}
+
+GPIOD_CXX_API request_released& request_released::operator=(request_released&& other) noexcept
+{
+	::std::logic_error::operator=(other);
+
+	return *this;
+}
+
+GPIOD_CXX_API request_released::~request_released(void)
+{
+
+}
+
+GPIOD_CXX_API bad_mapping::bad_mapping(const ::std::string& what)
+	: ::std::runtime_error(what)
+{
+
+}
+
+GPIOD_CXX_API bad_mapping::bad_mapping(const bad_mapping& other) noexcept
+	: ::std::runtime_error(other)
+{
+
+}
+
+GPIOD_CXX_API bad_mapping::bad_mapping(bad_mapping&& other) noexcept
+	: ::std::runtime_error(other)
+{
+
+}
+
+GPIOD_CXX_API bad_mapping& bad_mapping::operator=(const bad_mapping& other) noexcept
+{
+	::std::runtime_error::operator=(other);
+
+	return *this;
+}
+
+GPIOD_CXX_API bad_mapping& bad_mapping::operator=(bad_mapping&& other) noexcept
+{
+	::std::runtime_error::operator=(other);
+
+	return *this;
+}
+
+GPIOD_CXX_API bad_mapping::~bad_mapping(void)
+{
+
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index e3ce2fc..dc7e938 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1,940 +1,46 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
-/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
-
-#ifndef __LIBGPIOD_GPIOD_CXX_HPP__
-#define __LIBGPIOD_GPIOD_CXX_HPP__
-
-#include <bitset>
-#include <chrono>
-#include <gpiod.h>
-#include <memory>
-#include <string>
-#include <vector>
-
-namespace gpiod {
-
-class line;
-class line_bulk;
-class line_iter;
-class chip_iter;
-struct line_event;
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
 /**
  * @file gpiod.hpp
  */
 
-/**
- * @defgroup gpiod_cxx C++ bindings
- * @{
- */
-
-/**
- * @brief Check if the file pointed to by path is a GPIO chip character device.
- * @param path Path to check.
- * @return True if the file exists and is a GPIO chip character device or a
- *         symbolic link to it.
- */
-bool is_gpiochip_device(const ::std::string& path);
-
-/**
- * @brief Represents a GPIO chip.
- *
- * Internally this class holds a smart pointer to an open GPIO chip descriptor.
- * Multiple objects of this class can reference the same chip. The chip is
- * closed and all resources freed when the last reference is dropped.
- */
-class chip
-{
-public:
-
-	/**
-	 * @brief Default constructor. Creates an empty GPIO chip object.
-	 */
-	chip(void) = default;
-
-	/**
-	 * @brief Constructor. Opens the chip using chip::open.
-	 * @param path Path to the GPIO chip device.
-	 */
-	chip(const ::std::string& path);
-
-	/**
-	 * @brief Copy constructor. References the object held by other.
-	 * @param other Other chip object.
-	 */
-	chip(const chip& other) = default;
-
-	/**
-	 * @brief Move constructor. References the object held by other.
-	 * @param other Other chip object.
-	 */
-	chip(chip&& other) = default;
-
-	/**
-	 * @brief Assignment operator. References the object held by other.
-	 * @param other Other chip object.
-	 * @return Reference to this object.
-	 */
-	chip& operator=(const chip& other) = default;
-
-	/**
-	 * @brief Move assignment operator. References the object held by other.
-	 * @param other Other chip object.
-	 * @return Reference to this object.
-	 */
-	chip& operator=(chip&& other) = default;
-
-	/**
-	 * @brief Destructor. Unreferences the internal chip object.
-	 */
-	~chip(void) = default;
-
-	/**
-	 * @brief Open a GPIO chip.
-	 * @param path Path to the GPIO chip device.
-	 *
-	 * If the object already holds a reference to an open chip, it will be
-	 * closed and the reference reset.
-	 */
-	void open(const ::std::string &path);
-
-	/**
-	 * @brief Reset the internal smart pointer owned by this object.
-	 */
-	void reset(void) noexcept;
-
-	/**
-	 * @brief Return the name of the chip held by this object.
-	 * @return Name of the GPIO chip.
-	 */
-	::std::string name(void) const;
-
-	/**
-	 * @brief Return the label of the chip held by this object.
-	 * @return Label of the GPIO chip.
-	 */
-	::std::string label(void) const;
-
-	/**
-	 * @brief Return the number of lines exposed by this chip.
-	 * @return Number of lines.
-	 */
-	unsigned int num_lines(void) const;
-
-	/**
-	 * @brief Get the line exposed by this chip at given offset.
-	 * @param offset Offset of the line.
-	 * @return Line object.
-	 */
-	line get_line(unsigned int offset) const;
-
-	/**
-	 * @brief Map a GPIO line's name to its offset within the chip.
-	 * @param name Name of the GPIO line to map.
-	 * @return Offset of the line within the chip or -1 if a line with
-	 *         given name is not exposed by the chip.
-	 */
-	int find_line(const ::std::string& name) const;
-
-	/**
-	 * @brief Get a set of lines exposed by this chip at given offsets.
-	 * @param offsets Vector of line offsets.
-	 * @return Set of lines held by a line_bulk object.
-	 */
-	line_bulk get_lines(const ::std::vector<unsigned int>& offsets) const;
-
-	/**
-	 * @brief Get all lines exposed by this chip.
-	 * @return All lines exposed by this chip held by a line_bulk object.
-	 */
-	line_bulk get_all_lines(void) const;
-
-	/**
-	 * @brief Equality operator.
-	 * @param rhs Right-hand side of the equation.
-	 * @return True if rhs references the same chip. False otherwise.
-	 */
-	bool operator==(const chip& rhs) const noexcept;
-
-	/**
-	 * @brief Inequality operator.
-	 * @param rhs Right-hand side of the equation.
-	 * @return False if rhs references the same chip. True otherwise.
-	 */
-	bool operator!=(const chip& rhs) const noexcept;
-
-	/**
-	 * @brief Check if this object holds a reference to a GPIO chip.
-	 * @return True if this object references a GPIO chip, false otherwise.
-	 */
-	explicit operator bool(void) const noexcept;
-
-	/**
-	 * @brief Check if this object doesn't hold a reference to a GPIO chip.
-	 * @return False if this object references a GPIO chip, true otherwise.
-	 */
-	bool operator!(void) const noexcept;
-
-private:
-
-	chip(::gpiod_chip* chip);
-	chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr);
-
-	void throw_if_noref(void) const;
-
-	::std::shared_ptr<::gpiod_chip> _m_chip;
-
-	friend line;
-	friend chip_iter;
-	friend line_iter;
-};
-
-/**
- * @brief Stores the configuration for line requests.
- */
-struct line_request
-{
-	/**
-	 * @brief Request types.
-	 */
-	enum : int {
-		DIRECTION_AS_IS = 1,
-		/**< Request for values, don't change the direction. */
-		DIRECTION_INPUT,
-		/**< Request for reading line values. */
-		DIRECTION_OUTPUT,
-		/**< Request for driving the GPIO lines. */
-		EVENT_FALLING_EDGE,
-		/**< Listen for falling edge events. */
-		EVENT_RISING_EDGE,
-		/**< Listen for rising edge events. */
-		EVENT_BOTH_EDGES,
-		/**< Listen for all types of events. */
-	};
-
-	static const ::std::bitset<32> FLAG_ACTIVE_LOW;
-	/**< Set the active state to 'low' (high is the default). */
-	static const ::std::bitset<32> FLAG_OPEN_SOURCE;
-	/**< The line is an open-source port. */
-	static const ::std::bitset<32> FLAG_OPEN_DRAIN;
-	/**< The line is an open-drain port. */
-	static const ::std::bitset<32> FLAG_BIAS_DISABLED;
-	/**< The line has neither pull-up nor pull-down resistor enabled. */
-	static const ::std::bitset<32> FLAG_BIAS_PULL_DOWN;
-	/**< The line has a configurable pull-down resistor enabled. */
-	static const ::std::bitset<32> FLAG_BIAS_PULL_UP;
-	/**< The line has a configurable pull-up resistor enabled. */
-
-	::std::string consumer;
-	/**< Consumer name to pass to the request. */
-	int request_type;
-	/**< Type of the request. */
-	::std::bitset<32> flags;
-	/**< Additional request flags. */
-};
-
-/**
- * @brief Represents a single GPIO line.
- *
- * Internally this class holds a raw pointer to a GPIO line descriptor and a
- * reference to the parent chip. All line resources are freed when the last
- * reference to the parent chip is dropped.
- */
-class line
-{
-public:
-
-	/**
-	 * @brief Default constructor. Creates an empty line object.
-	 */
-	line(void);
-
-	/**
-	 * @brief Copy constructor.
-	 * @param other Other line object.
-	 */
-	line(const line& other) = default;
-
-	/**
-	 * @brief Move constructor.
-	 * @param other Other line object.
-	 */
-	line(line&& other) = default;
-
-	/**
-	 * @brief Assignment operator.
-	 * @param other Other line object.
-	 * @return Reference to this object.
-	 */
-	line& operator=(const line& other) = default;
-
-	/**
-	 * @brief Move assignment operator.
-	 * @param other Other line object.
-	 * @return Reference to this object.
-	 */
-	line& operator=(line&& other) = default;
-
-	/**
-	 * @brief Destructor.
-	 */
-	~line(void) = default;
-
-	/**
-	 * @brief Get the offset of this line.
-	 * @return Offet of this line.
-	 */
-	unsigned int offset(void) const;
-
-	/**
-	 * @brief Get the name of this line (if any).
-	 * @return Name of this line or an empty string if it is unnamed.
-	 */
-	::std::string name(void) const;
-
-	/**
-	 * @brief Get the consumer of this line (if any).
-	 * @return Name of the consumer of this line or an empty string if it
-	 *         is unused.
-	 */
-	::std::string consumer(void) const;
-
-	/**
-	 * @brief Get current direction of this line.
-	 * @return Current direction setting.
-	 */
-	int direction(void) const;
-
-	/**
-	 * @brief Check if this line's signal is inverted.
-	 * @return True if this line is "active-low", false otherwise.
-	 */
-	bool is_active_low(void) const;
-
-	/**
-	 * @brief Get current bias of this line.
-	 * @return Current bias setting.
-	 */
-	int bias(void) const;
-
-	/**
-	 * @brief Check if this line is used by the kernel or other user space
-	 *        process.
-	 * @return True if this line is in use, false otherwise.
-	 */
-	bool is_used(void) const;
-
-	/**
-	 * @brief Get current drive setting of this line.
-	 * @return Current drive setting.
-	 */
-	int drive(void) const;
-
-	/**
-	 * @brief Request this line.
-	 * @param config Request config (see gpiod::line_request).
-	 * @param default_val Default value - only matters for OUTPUT direction.
-	 */
-	void request(const line_request& config, int default_val = 0) const;
-
-	/**
-	 * @brief Release the line if it was previously requested.
-	 */
-	void release(void) const;
-
-	/**
-	 * @brief Read the line value.
-	 * @return Current value (0 or 1).
-	 */
-	int get_value(void) const;
-
-	/**
-	 * @brief Set the value of this line.
-	 * @param val New value (0 or 1).
-	 */
-	void set_value(int val) const;
-
-	/**
-	 * @brief Set configuration of this line.
-	 * @param direction New direction.
-	 * @param flags Replacement flags.
-	 * @param value New value (0 or 1) - only matters for OUTPUT direction.
-	 */
-	void set_config(int direction, ::std::bitset<32> flags, int value = 0) const;
-
-	/**
-	 * @brief Set configuration flags of this line.
-	 * @param flags Replacement flags.
-	 */
-	void set_flags(::std::bitset<32> flags) const;
-
-	/**
-	 * @brief Change the direction this line to input.
-	 */
-	void set_direction_input() const;
-
-	/**
-	 * @brief Change the direction this lines to output.
-	 * @param value New value (0 or 1).
-	 */
-	void set_direction_output(int value = 0) const;
-
-	/**
-	 * @brief Wait for an event on this line.
-	 * @param timeout Time to wait before returning if no event occurred.
-	 * @return True if an event occurred and can be read, false if the wait
-	 *         timed out.
-	 */
-	bool event_wait(const ::std::chrono::nanoseconds& timeout) const;
-
-	/**
-	 * @brief Read a line event.
-	 * @return Line event object.
-	 */
-	line_event event_read(void) const;
-
-	/**
-	 * @brief Read multiple line events.
-	 * @return Vector of line event objects.
-	 */
-	::std::vector<line_event> event_read_multiple(void) const;
-
-	/**
-	 * @brief Get the event file descriptor associated with this line.
-	 * @return File descriptor number.
-	 */
-	int event_get_fd(void) const;
-
-	/**
-	 * @brief Get the parent chip.
-	 * @return Parent chip of this line.
-	 */
-	const chip get_chip(void) const;
-
-	/**
-	 * @brief Reset the state of this object.
-	 *
-	 * This is useful when the user needs to e.g. keep the line_event object
-	 * but wants to drop the reference to the GPIO chip indirectly held by
-	 * the line being the source of the event.
-	 */
-	void reset(void);
-
-	/**
-	 * @brief Check if two line objects reference the same GPIO line.
-	 * @param rhs Right-hand side of the equation.
-	 * @return True if both objects reference the same line, fale otherwise.
-	 */
-	bool operator==(const line& rhs) const noexcept;
-
-	/**
-	 * @brief Check if two line objects reference different GPIO lines.
-	 * @param rhs Right-hand side of the equation.
-	 * @return False if both objects reference the same line, true otherwise.
-	 */
-	bool operator!=(const line& rhs) const noexcept;
-
-	/**
-	 * @brief Check if this object holds a reference to any GPIO line.
-	 * @return True if this object references a GPIO line, false otherwise.
-	 */
-	explicit operator bool(void) const noexcept;
-
-	/**
-	 * @brief Check if this object doesn't reference any GPIO line.
-	 * @return True if this object doesn't reference any GPIO line, true
-	 *         otherwise.
-	 */
-	bool operator!(void) const noexcept;
-
-	/**
-	 * @brief Possible direction settings.
-	 */
-	enum : int {
-		DIRECTION_INPUT = 1,
-		/**< Line's direction setting is input. */
-		DIRECTION_OUTPUT,
-		/**< Line's direction setting is output. */
-	};
-
-	/**
-	 * @brief Possible drive settings.
-	 */
-	enum : int {
-		DRIVE_PUSH_PULL = 1,
-		/**< Drive setting is unknown. */
-		DRIVE_OPEN_DRAIN,
-		/**< Line output is open-drain. */
-		DRIVE_OPEN_SOURCE,
-		/**< Line output is open-source. */
-	};
-
-	/**
-	 * @brief Possible bias settings.
-	 */
-	enum : int {
-		BIAS_UNKNOWN = 1,
-		/**< Line's bias state is unknown. */
-		BIAS_DISABLED,
-		/**< Line's internal bias is disabled. */
-		BIAS_PULL_UP,
-		/**< Line's internal pull-up bias is enabled. */
-		BIAS_PULL_DOWN,
-		/**< Line's internal pull-down bias is enabled. */
-	};
-
-private:
-
-	line(::gpiod_line* line, const chip& owner);
-
-	void throw_if_null(void) const;
-	line_event make_line_event(const ::gpiod_line_event& event) const noexcept;
-
-	::gpiod_line* _m_line;
-	::std::weak_ptr<::gpiod_chip> _m_owner;
-
-	class chip_guard
-	{
-	public:
-		chip_guard(const line& line);
-		~chip_guard(void) = default;
-
-		chip_guard(const chip_guard& other) = delete;
-		chip_guard(chip_guard&& other) = delete;
-		chip_guard& operator=(const chip_guard&& other) = delete;
-		chip_guard& operator=(chip_guard&& other) = delete;
-
-	private:
-		::std::shared_ptr<::gpiod_chip> _m_chip;
-	};
-
-	friend chip;
-	friend line_bulk;
-	friend line_iter;
-};
-
-/**
- * @brief Describes a single GPIO line event.
- */
-struct line_event
-{
-	/**
-	 * @brief Possible event types.
-	 */
-	enum : int {
-		RISING_EDGE = 1,
-		/**< Rising edge event. */
-		FALLING_EDGE,
-		/**< Falling edge event. */
-	};
-
-	::std::chrono::nanoseconds timestamp;
-	/**< Best estimate of time of event occurrence in nanoseconds. */
-	int event_type;
-	/**< Type of the event that occurred. */
-	line source;
-	/**< Line object referencing the GPIO line on which the event occurred. */
-};
+#ifndef __LIBGPIOD_GPIOD_CXX_HPP__
+#define __LIBGPIOD_GPIOD_CXX_HPP__
 
 /**
- * @brief Represents a set of GPIO lines.
+ * @defgroup gpiod_cxx C++ bindings
  *
- * Internally an object of this class stores an array of line objects
- * owned by a single chip.
+ * C++ bindings for libgpiod.
  */
-class line_bulk
-{
-public:
-
-	/**
-	 * @brief Default constructor. Creates an empty line_bulk object.
-	 */
-	line_bulk(void) = default;
-
-	/**
-	 * @brief Construct a line_bulk from a vector of lines.
-	 * @param lines Vector of gpiod::line objects.
-	 * @note All lines must be owned by the same GPIO chip.
-	 */
-	line_bulk(const ::std::vector<line>& lines);
-
-	/**
-	 * @brief Copy constructor.
-	 * @param other Other line_bulk object.
-	 */
-	line_bulk(const line_bulk& other) = default;
-
-	/**
-	 * @brief Move constructor.
-	 * @param other Other line_bulk object.
-	 */
-	line_bulk(line_bulk&& other) = default;
-
-	/**
-	 * @brief Assignment operator.
-	 * @param other Other line_bulk object.
-	 * @return Reference to this object.
-	 */
-	line_bulk& operator=(const line_bulk& other) = default;
-
-	/**
-	 * @brief Move assignment operator.
-	 * @param other Other line_bulk object.
-	 * @return Reference to this object.
-	 */
-	line_bulk& operator=(line_bulk&& other) = default;
-
-	/**
-	 * @brief Destructor.
-	 */
-	~line_bulk(void) = default;
-
-	/**
-	 * @brief Add a line to this line_bulk object.
-	 * @param new_line Line to add.
-	 * @note The new line must be owned by the same chip as all the other
-	 *       lines already held by this line_bulk object.
-	 */
-	void append(const line& new_line);
-
-	/**
-	 * @brief Get the line at given offset.
-	 * @param index Index of the line to get.
-	 * @return Reference to the line object.
-	 * @note This method will throw if index is equal or greater than the
-	 *       number of lines currently held by this bulk.
-	 */
-	line& get(unsigned int index);
-
-	/**
-	 * @brief Get the line at given offset without bounds checking.
-	 * @param index Offset of the line to get.
-	 * @return Reference to the line object.
-	 * @note No bounds checking is performed.
-	 */
-	line& operator[](unsigned int index);
-
-	/**
-	 * @brief Get the number of lines currently held by this object.
-	 * @return Number of elements in this line_bulk.
-	 */
-	unsigned int size(void) const noexcept;
-
-	/**
-	 * @brief Check if this line_bulk doesn't hold any lines.
-	 * @return True if this object is empty, false otherwise.
-	 */
-	bool empty(void) const noexcept;
-
-	/**
-	 * @brief Remove all lines from this object.
-	 */
-	void clear(void);
-
-	/**
-	 * @brief Request all lines held by this object.
-	 * @param config Request config (see gpiod::line_request).
-	 * @param default_vals Vector of default values. Only relevant for
-	 *                     output direction requests.
-	 */
-	void request(const line_request& config,
-		     const ::std::vector<int> default_vals = ::std::vector<int>()) const;
-
-	/**
-	 * @brief Release all lines held by this object.
-	 */
-	void release(void) const;
-
-	/**
-	 * @brief Read values from all lines held by this object.
-	 * @return Vector containing line values the order of which corresponds
-	 *         with the order of lines in the internal array.
-	 */
-	::std::vector<int> get_values(void) const;
-
-	/**
-	 * @brief Set values of all lines held by this object.
-	 * @param values Vector of values to set. Must be the same size as the
-	 *               number of lines held by this line_bulk.
-	 */
-	void set_values(const ::std::vector<int>& values) const;
-
-	/**
-	 * @brief Set configuration of all lines held by this object.
-	 * @param direction New direction.
-	 * @param flags Replacement flags.
-	 * @param values Vector of values to set. Must be the same size as the
-	 *               number of lines held by this line_bulk.
-	 *               Only relevant for output direction requests.
-	 */
-	void set_config(int direction, ::std::bitset<32> flags,
-			const ::std::vector<int> values = ::std::vector<int>()) const;
-
-	/**
-	 * @brief Set configuration flags of all lines held by this object.
-	 * @param flags Replacement flags.
-	 */
-	void set_flags(::std::bitset<32> flags) const;
-
-	/**
-	 * @brief Change the direction all lines held by this object to input.
-	 */
-	void set_direction_input() const;
-
-	/**
-	 * @brief Change the direction all lines held by this object to output.
-	 * @param values Vector of values to set. Must be the same size as the
-	 *               number of lines held by this line_bulk.
-	 */
-	void set_direction_output(const ::std::vector<int>& values) const;
-
-	/**
-	 * @brief Poll the set of lines for line events.
-	 * @param timeout Number of nanoseconds to wait before returning an
-	 *                empty line_bulk.
-	 * @return Returns a line_bulk object containing lines on which events
-	 *         occurred.
-	 */
-	line_bulk event_wait(const ::std::chrono::nanoseconds& timeout) const;
-
-	/**
-	 * @brief Check if this object holds any lines.
-	 * @return True if this line_bulk holds at least one line, false otherwise.
-	 */
-	explicit operator bool(void) const noexcept;
-
-	/**
-	 * @brief Check if this object doesn't hold any lines.
-	 * @return True if this line_bulk is empty, false otherwise.
-	 */
-	bool operator!(void) const noexcept;
-
-	/**
-	 * @brief Max number of lines that this object can hold.
-	 */
-	static const unsigned int MAX_LINES;
-
-	/**
-	 * @brief Iterator for iterating over lines held by line_bulk.
-	 */
-	class iterator
-	{
-	public:
-
-		/**
-		 * @brief Default constructor. Builds an empty iterator object.
-		 */
-		iterator(void) = default;
-
-		/**
-		 * @brief Copy constructor.
-		 * @param other Other line_bulk iterator.
-		 */
-		iterator(const iterator& other) = default;
-
-		/**
-		 * @brief Move constructor.
-		 * @param other Other line_bulk iterator.
-		 */
-		iterator(iterator&& other) = default;
-
-		/**
-		 * @brief Assignment operator.
-		 * @param other Other line_bulk iterator.
-		 * @return Reference to this iterator.
-		 */
-		iterator& operator=(const iterator& other) = default;
-
-		/**
-		 * @brief Move assignment operator.
-		 * @param other Other line_bulk iterator.
-		 * @return Reference to this iterator.
-		 */
-		iterator& operator=(iterator&& other) = default;
-
-		/**
-		 * @brief Destructor.
-		 */
-		~iterator(void) = default;
-
-		/**
-		 * @brief Advance the iterator by one element.
-		 * @return Reference to this iterator.
-		 */
-		iterator& operator++(void);
-
-		/**
-		 * @brief Dereference current element.
-		 * @return Current GPIO line by reference.
-		 */
-		const line& operator*(void) const;
-
-		/**
-		 * @brief Member access operator.
-		 * @return Current GPIO line by pointer.
-		 */
-		const line* operator->(void) const;
-
-		/**
-		 * @brief Check if this operator points to the same element.
-		 * @param rhs Right-hand side of the equation.
-		 * @return True if this iterator points to the same GPIO line,
-		 *         false otherwise.
-		 */
-		bool operator==(const iterator& rhs) const noexcept;
-
-		/**
-		 * @brief Check if this operator doesn't point to the same element.
-		 * @param rhs Right-hand side of the equation.
-		 * @return True if this iterator doesn't point to the same GPIO
-		 *         line, false otherwise.
-		 */
-		bool operator!=(const iterator& rhs) const noexcept;
-
-	private:
-
-		iterator(const ::std::vector<line>::iterator& it);
-
-		::std::vector<line>::iterator _m_iter;
-
-		friend line_bulk;
-	};
-
-	/**
-	 * @brief Returns an iterator to the first line.
-	 * @return A line_bulk iterator.
-	 */
-	iterator begin(void) noexcept;
-
-	/**
-	 * @brief Returns an iterator to the element following the last line.
-	 * @return A line_bulk iterator.
-	 */
-	iterator end(void) noexcept;
-
-private:
-
-	struct line_bulk_deleter
-	{
-		void operator()(::gpiod_line_bulk *bulk);
-	};
-
-	void throw_if_empty(void) const;
-
-	using line_bulk_ptr = ::std::unique_ptr<::gpiod_line_bulk, line_bulk_deleter>;
-
-	line_bulk_ptr make_line_bulk_ptr(void) const;
-	line_bulk_ptr to_line_bulk(void) const;
-
-	::std::vector<line> _m_bulk;
-};
-
-/**
- * @brief Support for range-based loops for line iterators.
- * @param iter A line iterator.
- * @return Iterator unchanged.
- */
-line_iter begin(line_iter iter) noexcept;
 
 /**
- * @brief Support for range-based loops for line iterators.
- * @param iter A line iterator.
- * @return New end iterator.
+ * @cond
  */
-line_iter end(const line_iter& iter) noexcept;
 
-/**
- * @brief Allows to iterate over all lines owned by a GPIO chip.
+/*
+ * We don't make this symbol private because it needs to be accessible by
+ * the declarations in exception.hpp in order to expose the symbols of classes
+ * inheriting from standard exceptions.
  */
-class line_iter
-{
-public:
-
-	/**
-	 * @brief Default constructor. Creates the end iterator.
-	 */
-	line_iter(void) = default;
-
-	/**
-	 * @brief Constructor. Creates the begin iterator.
-	 * @param owner Chip owning the GPIO lines over which we want to iterate.
-	 */
-	line_iter(const chip& owner);
-
-	/**
-	 * @brief Copy constructor.
-	 * @param other Other line iterator.
-	 */
-	line_iter(const line_iter& other) = default;
-
-	/**
-	 * @brief Move constructor.
-	 * @param other Other line iterator.
-	 */
-	line_iter(line_iter&& other) = default;
+#define GPIOD_CXX_API __attribute__((visibility("default")))
 
-	/**
-	 * @brief Assignment operator.
-	 * @param other Other line iterator.
-	 * @return Reference to this line_iter.
-	 */
-	line_iter& operator=(const line_iter& other) = default;
-
-	/**
-	 * @brief Move assignment operator.
-	 * @param other Other line iterator.
-	 * @return Reference to this line_iter.
-	 */
-	line_iter& operator=(line_iter&& other) = default;
-
-	/**
-	 * @brief Destructor.
-	 */
-	~line_iter(void) = default;
-
-	/**
-	 * @brief Advance the iterator by one element.
-	 * @return Reference to this iterator.
-	 */
-	line_iter& operator++(void);
-
-	/**
-	 * @brief Dereference current element.
-	 * @return Current GPIO line by reference.
-	 */
-	const line& operator*(void) const;
-
-	/**
-	 * @brief Member access operator.
-	 * @return Current GPIO line by pointer.
-	 */
-	const line* operator->(void) const;
-
-	/**
-	 * @brief Check if this operator points to the same element.
-	 * @param rhs Right-hand side of the equation.
-	 * @return True if this iterator points to the same line_iter,
-	 *         false otherwise.
-	 */
-	bool operator==(const line_iter& rhs) const noexcept;
-
-	/**
-	 * @brief Check if this operator doesn't point to the same element.
-	 * @param rhs Right-hand side of the equation.
-	 * @return True if this iterator doesn't point to the same line_iter,
-	 *         false otherwise.
-	 */
-	bool operator!=(const line_iter& rhs) const noexcept;
-
-private:
-
-	line _m_current;
-};
+#define __LIBGPIOD_GPIOD_CXX_INSIDE__
+#include "gpiodcxx/chip.hpp"
+#include "gpiodcxx/chip-info.hpp"
+#include "gpiodcxx/edge-event.hpp"
+#include "gpiodcxx/edge-event-buffer.hpp"
+#include "gpiodcxx/exception.hpp"
+#include "gpiodcxx/info-event.hpp"
+#include "gpiodcxx/line.hpp"
+#include "gpiodcxx/line-config.hpp"
+#include "gpiodcxx/line-info.hpp"
+#include "gpiodcxx/line-request.hpp"
+#include "gpiodcxx/request-config.hpp"
+#undef __LIBGPIOD_GPIOD_CXX_INSIDE__
 
 /**
- * @}
+ * @endcond
  */
 
-} /* namespace gpiod */
-
 #endif /* __LIBGPIOD_GPIOD_CXX_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
new file mode 100644
index 0000000..71532e6
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/Makefile.am
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+otherincludedir = $(includedir)/gpiodcxx
+otherinclude_HEADERS = \
+	chip.hpp \
+	chip-info.hpp \
+	edge-event-buffer.hpp \
+	edge-event.hpp \
+	exception.hpp \
+	info-event.hpp \
+	line.hpp \
+	line-config.hpp \
+	line-info.hpp \
+	line-request.hpp \
+	misc.hpp \
+	request-config.hpp \
+	timestamp.hpp
diff --git a/bindings/cxx/gpiodcxx/chip-info.hpp b/bindings/cxx/gpiodcxx/chip-info.hpp
new file mode 100644
index 0000000..9313e88
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/chip-info.hpp
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file chip-info.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_CHIP_INFO_HPP__
+#define __LIBGPIOD_CXX_CHIP_INFO_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <memory>
+#include <ostream>
+
+namespace gpiod {
+
+class chip;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Represents an immutable snapshot of GPIO chip information.
+ */
+class chip_info
+{
+public:
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	chip_info(const chip_info& other);
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	chip_info(chip_info&& other) noexcept;
+
+	~chip_info(void);
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	chip_info& operator=(const chip_info& other);
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	chip_info& operator=(chip_info&& other) noexcept;
+
+	/**
+	 * @brief Get the name of this GPIO chip.
+	 * @return String containing the chip name.
+	 */
+	::std::string name(void) const noexcept;
+
+	/**
+	 * @brief Get the label of this GPIO chip.
+	 * @return String containing the chip name.
+	 */
+	::std::string label(void) const noexcept;
+
+	/**
+	 * @brief Return the number of lines exposed by this chip.
+	 * @return Number of lines.
+	 */
+	::std::size_t num_lines(void) const noexcept;
+
+private:
+
+	chip_info(void);
+
+	struct impl;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO chip objects.
+ * @param out Output stream to write to.
+ * @param chip GPIO chip to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const chip_info& chip);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_CHIP_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
new file mode 100644
index 0000000..7cc2156
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file chip.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_CHIP_HPP__
+#define __LIBGPIOD_CXX_CHIP_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <cstddef>
+#include <iostream>
+#include <filesystem>
+#include <memory>
+
+#include "line.hpp"
+
+namespace gpiod {
+
+class chip_info;
+class info_event;
+class line_config;
+class line_info;
+class line_request;
+class request_config;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Represents a GPIO chip.
+ */
+class chip
+{
+public:
+
+	/**
+	 * @brief Instantiates a new chip object by opening the device file
+	 *        indicated by the path argument.
+	 * @param path Path to the device file to open.
+	 */
+	explicit chip(const ::std::filesystem::path& path);
+
+	chip(const chip& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	chip(chip&& other) noexcept;
+
+	~chip(void);
+
+	chip& operator=(const chip& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	chip& operator=(chip&& other) noexcept;
+
+	/**
+	 * @brief Check if this object is valid.
+	 * @return True if this object's methods can be used, false otherwise.
+	 *         False usually means the chip was closed. If the user calls
+	 *         any of the methods of this class on an object for which this
+	 *         operator returned false, a logic_error will be thrown.
+	 */
+	explicit operator bool(void) const noexcept;
+
+	/**
+	 * @brief Close the GPIO chip device file and free associated resources.
+	 * @note The chip object can live after calling this method but any of
+	 *       the chip's mutators will throw a logic_error exception.
+	 */
+	void close(void);
+
+	/**
+	 * @brief Get the filesystem path that was used to open this GPIO chip.
+	 * @return Path to the underlying character device file.
+	 */
+	::std::filesystem::path path(void) const;
+
+	/**
+	 * @brief Get information about the chip.
+	 * @return New chip_info object.
+	 */
+	chip_info get_info(void) const;
+
+	/**
+	 * @brief Retrieve the current snapshot of line information for a
+	 *        single line.
+	 * @param offset Offset of the line to get the info for.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info get_line_info(line::offset offset) const;
+
+	/**
+	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
+	 *        the line info and starts watching the line for changes.
+	 * @param offset Offset of the line to get the info for.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info watch_line_info(line::offset offset) const;
+
+	/**
+	 * @brief Stop watching the line at given offset for info events.
+	 * @param offset Offset of the line to get the info for.
+	 */
+	void unwatch_line_info(line::offset offset) const;
+
+	/**
+	 * @brief Get the file descriptor associated with this chip.
+	 * @return File descriptor number.
+	 */
+	int fd(void) const;
+
+	/**
+	 * @brief Wait for line status events on any of the watched lines
+	 *        exposed by this chip.
+	 * @param timeout Wait time limit in nanoseconds.
+	 * @return True if at least one event is ready to be read. False if the
+	 *         wait timed out.
+	 */
+	bool wait_info_event(const ::std::chrono::nanoseconds& timeout) const;
+
+	/**
+	 * @brief Read a single line status change event from this chip.
+	 * @return New info_event object.
+	 */
+	info_event read_info_event(void) const;
+
+	/**
+	 * @brief Map a GPIO line's name to its offset within the chip.
+	 * @param name Name of the GPIO line to map.
+	 * @return Offset of the line within the chip or -1 if the line with
+	 *         given name is not exposed by this chip.
+	 */
+	int find_line(const ::std::string& name) const;
+
+	/**
+	 * @brief Request a set of lines for exclusive usage.
+	 * @param req_cfg Request config object.
+	 * @param line_cfg Line config object.
+	 * @return New line_request object.
+	 */
+	line_request request_lines(const request_config& req_cfg,
+				   const line_config& line_cfg);
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO chip objects.
+ * @param out Output stream to write to.
+ * @param chip GPIO chip to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const chip& chip);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_CHIP_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
new file mode 100644
index 0000000..37ac4f5
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file edge-event-buffer.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__
+#define __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <cstddef>
+#include <iostream>
+#include <memory>
+#include <vector>
+
+namespace gpiod {
+
+class edge_event;
+class line_request;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Object into which edge events are read for better performance.
+ *
+ * The edge_event_buffer allows reading edge_event objects into an existing
+ * buffer which improves the performance by avoiding needless memory
+ * allocations.
+ */
+class edge_event_buffer
+{
+public:
+
+	/**
+	 * @brief Constant iterator for iterating over edge events stored in
+	 *        the buffer.
+	 */
+	using const_iterator = ::std::vector<edge_event>::const_iterator;
+
+	/**
+	 * @brief Constructor. Creates a new edge event buffer with given
+	 *        capacity.
+	 * @param capacity Capacity of the new buffer.
+	 */
+	explicit edge_event_buffer(::std::size_t capacity = 64);
+
+	edge_event_buffer(const edge_event_buffer& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	edge_event_buffer(edge_event_buffer&& other) noexcept;
+
+	~edge_event_buffer(void);
+
+	edge_event_buffer& operator=(const edge_event_buffer& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	edge_event_buffer& operator=(edge_event_buffer&& other) noexcept;
+
+	/**
+	 * @brief Get the constant reference to the edge event at given index.
+	 * @param index Index of the event in the buffer.
+	 * @return Constant reference to the edge event.
+	 */
+	const edge_event& get_event(unsigned int index) const;
+
+	/**
+	 * @brief Get the number of edge events currently stored in the buffer.
+	 * @return Number of edge events in the buffer.
+	 */
+	::std::size_t num_events(void) const;
+
+	/**
+	 * @brief Maximum capacity of the buffer.
+	 * @return Buffer capacity.
+	 */
+	::std::size_t capacity(void) const noexcept;
+
+	/**
+	 * @brief Get a constant iterator to the first edge event currently
+	 *        stored in the buffer.
+	 * @return Constant iterator to the first element.
+	 */
+	const_iterator begin(void) const noexcept;
+
+	/**
+	 * @brief Get a constant iterator to the element after the last edge
+	 *        event in the buffer.
+	 * @return Constant iterator to the element after the last edge event.
+	 */
+	const_iterator end(void) const noexcept;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend line_request;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO edge event buffer objects.
+ * @param out Output stream to write to.
+ * @param buf GPIO edge event buffer object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const edge_event_buffer& buf);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
new file mode 100644
index 0000000..0623880
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file edge-event.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_EDGE_EVENT_HPP__
+#define __LIBGPIOD_CXX_EDGE_EVENT_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <cstdint>
+#include <iostream>
+#include <memory>
+
+#include "timestamp.hpp"
+
+namespace gpiod {
+
+class edge_event_buffer;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Immutable object containing data about a single edge event.
+ */
+class edge_event
+{
+public:
+
+	/**
+	 * @brief Edge event types.
+	 */
+	enum class event_type
+	{
+		RISING_EDGE = 1,
+		/**< This is a rising edge event. */
+		FALLING_EDGE
+		/**< This is falling edge event. */
+	};
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	edge_event(const edge_event& other);
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	edge_event(edge_event&& other) noexcept;
+
+	~edge_event(void);
+
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	edge_event& operator=(const edge_event& other);
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	edge_event& operator=(edge_event&& other) noexcept;
+
+	/**
+	 * @brief Retrieve the event type.
+	 * @return Event type (rising or falling edge).
+	 */
+	event_type type(void) const;
+
+	/**
+	 * @brief Retrieve the event time-stamp.
+	 * @return Time-stamp in nanoseconds as registered by the kernel using
+	 *         the configured edge event clock.
+	 */
+	timestamp timestamp_ns(void) const noexcept;
+
+	/**
+	 * @brief Read the offset of the line on which this event was
+	 *        registered.
+	 * @return Line offset.
+	 */
+	line::offset line_offset(void) const noexcept;
+
+	/**
+	 * @brief Get the global sequence number of this event.
+	 * @return Sequence number of the event relative to all lines in the
+	 *         associated line request.
+	 */
+	unsigned long global_seqno(void) const noexcept;
+
+	/**
+	 * @brief Get the event sequence number specific to the concerned line.
+	 * @return Sequence number of the event relative to this line within
+	 *         the lifetime of the associated line request.
+	 */
+	unsigned long line_seqno(void) const noexcept;
+
+private:
+
+	edge_event(void);
+
+	struct impl;
+	struct impl_managed;
+	struct impl_external;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend edge_event_buffer;
+};
+
+/**
+ * @brief Stream insertion operator for edge events.
+ * @param out Output stream to write to.
+ * @param event Edge event to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const edge_event& event);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EDGE_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/exception.hpp b/bindings/cxx/gpiodcxx/exception.hpp
new file mode 100644
index 0000000..f4d525b
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/exception.hpp
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file exception.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_EXCEPTION_HPP__
+#define __LIBGPIOD_CXX_EXCEPTION_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <stdexcept>
+#include <string>
+
+namespace gpiod {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Exception thrown when an already closed chip is used.
+ */
+class GPIOD_CXX_API chip_closed : public ::std::logic_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit chip_closed(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	chip_closed(const chip_closed& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	chip_closed(chip_closed&& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	chip_closed& operator=(const chip_closed& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	chip_closed& operator=(chip_closed&& other) noexcept;
+
+	virtual ~chip_closed(void);
+};
+
+/**
+ * @brief Exception thrown when an already released line request is used.
+ */
+class GPIOD_CXX_API request_released : public ::std::logic_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit request_released(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	request_released(const request_released& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	request_released(request_released&& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	request_released& operator=(const request_released& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	request_released& operator=(request_released&& other) noexcept;
+
+	virtual ~request_released(void);
+};
+
+/**
+ * @brief Exception thrown when the core C library returns an invalid value
+ *        for any of the line_info properties.
+ */
+class GPIOD_CXX_API bad_mapping : public ::std::runtime_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit bad_mapping(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	bad_mapping(const bad_mapping& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	bad_mapping(bad_mapping&& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	bad_mapping& operator=(const bad_mapping& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	bad_mapping& operator=(bad_mapping&& other) noexcept;
+
+	virtual ~bad_mapping(void);
+};
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EXCEPTION_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
new file mode 100644
index 0000000..107ca57
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file gpiod.h
+ */
+
+#ifndef __LIBGPIOD_CXX_INFO_EVENT_HPP__
+#define __LIBGPIOD_CXX_INFO_EVENT_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <cstdint>
+#include <iostream>
+#include <memory>
+
+#include "timestamp.hpp"
+
+namespace gpiod {
+
+class chip;
+class line_info;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Immutable object containing data about a single line info event.
+ */
+class info_event
+{
+public:
+
+	/**
+	 * @brief Types of info events.
+	 */
+	enum class event_type
+	{
+		LINE_REQUESTED = 1,
+		/**< Line has been requested. */
+		LINE_RELEASED,
+		/**< Previously requested line has been released. */
+		LINE_CONFIG_CHANGED
+		/**< Line configuration has changed. */
+	};
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	info_event(const info_event& other);
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	info_event(info_event&& other) noexcept;
+
+	~info_event(void);
+
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	info_event& operator=(const info_event& other);
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	info_event& operator=(info_event&& other) noexcept;
+
+	/**
+	 * @brief Type of this event.
+	 * @return Event type.
+	 */
+	event_type type(void) const;
+
+	/**
+	 * @brief Timestamp of the event as returned by the kernel.
+	 * @return Timestamp as a 64-bit unsigned integer.
+	 */
+	::std::uint64_t timestamp_ns(void) const noexcept;
+
+	/**
+	 * @brief Get the new line information.
+	 * @return Constant reference to the line info object containing the
+	 *         line data as read at the time of the info event.
+	 */
+	const line_info& get_line_info(void) const noexcept;
+
+private:
+
+	info_event(void);
+
+	struct impl;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for info events.
+ * @param out Output stream to write to.
+ * @param event GPIO line info event to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const info_event& event);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_INFO_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
new file mode 100644
index 0000000..6d808bd
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -0,0 +1,564 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line-config.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_CONFIG_HPP__
+#define __LIBGPIOD_CXX_LINE_CONFIG_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <any>
+#include <chrono>
+#include <cstddef>
+#include <iostream>
+#include <map>
+#include <memory>
+#include <utility>
+
+namespace gpiod {
+
+class chip;
+class line_request;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Contains a set of line config options used in line requests and
+ *        reconfiguration.
+ */
+class line_config
+{
+public:
+
+	/**
+	 * @brief List of available configuration properties. Used in the
+	 *        constructor, :line_config::set_property_default and
+	 *        :line_config::set_property_override.
+	 */
+	enum class property {
+		DIRECTION = 1,
+		/**< Line direction. */
+		EDGE,
+		/**< Edge detection. */
+		BIAS,
+		/**< Bias. */
+		DRIVE,
+		/**< Drive. */
+		ACTIVE_LOW,
+		/**< Active-low setting. */
+		DEBOUNCE_PERIOD,
+		/**< Debounce period. */
+		EVENT_CLOCK,
+		/**< Event clock. */
+		OUTPUT_VALUE,
+		/**< Output value. */
+		OUTPUT_VALUES,
+		/**< Set of offset-to-value mappings. Only used in the constructor. */
+	};
+
+	/**
+	 * @brief List of configuration properties passed to the constructor.
+	 *        The first member is the property indicator, the second is
+	 *        the value stored as `std::any` that is interpreted by the
+	 *        relevant methods depending on the property value.
+	 */
+	using properties = ::std::map<property, ::std::any>;
+
+	/**
+	 * @brief Stored information about a single configuration override. The
+	 *        first member is the overridden line offset, the second is
+	 *        the property being overridden.
+	 */
+	using override = ::std::pair<line::offset, property>;
+
+	/**
+	 * @brief List of line configuration overrides.
+	 */
+	using override_list = ::std::vector<override>;
+
+	/**
+	 * @brief Constructor.
+	 * @param props List of configuration properties. See
+	 *              :set_property_default for details. Additionally the
+	 *              constructor takes another property type as argument:
+	 *              :property::OUTPUT_VALUES which takes
+	 *              :line::value_mappings as property value. This
+	 *              effectively sets the overrides for output values for
+	 *              the mapped offsets.
+	 */
+	explicit line_config(const properties& props = properties());
+
+	line_config(const line_config& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_config(line_config&& other) noexcept;
+
+	~line_config(void);
+
+	line_config& operator=(const line_config& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	line_config& operator=(line_config&& other) noexcept;
+
+	/**
+	 * @brief Reset the line config object.
+	 */
+	void reset(void) noexcept;
+
+	/**
+	 * @brief Set the default value of a single configuration property.
+	 * @param prop Property to set.
+	 * @param val Property value. The type must correspond with the
+	 *            property being set: :line::direction for
+	 *            :property::DIRECTION, :line::edge for :property::EDGE,
+	 *            :line::bias for :property::BIAS, :line::drive for
+	 *            :property::DRIVE, `bool` for :property::ACTIVE_LOW,
+	 *            `std::chrono:microseconds` for
+	 *            :property::DEBOUNCE_PERIOD, :line::clock for
+	 *            :property::EVENT_CLOCK and :line::value
+	 *            for :property::OUTPUT_VALUE.
+	 *
+	 */
+	void set_property_default(property prop, const ::std::any& val);
+
+	/**
+	 * @brief Set the override value of a single configuration property.
+	 * @param prop Property to set.
+	 * @param offset Line offset to override.
+	 * @param val Property value. See :set_property_default for details.
+	 */
+	void set_property_offset(property prop, line::offset offset, const ::std::any& val);
+
+	/**
+	 * @brief Set the default direction setting.
+	 * @param direction New direction.
+	 */
+	void set_direction_default(line::direction direction);
+
+	/**
+	 * @brief Set the direction for a single line at given offset.
+	 * @param direction New direction.
+	 * @param offset Offset of the line for which to set the direction.
+	 */
+	void set_direction_override(line::direction direction, line::offset offset);
+
+	/**
+	 * @brief Get the default direction setting.
+	 * @return Direction setting that would have been used for any offset
+	 * 	   not assigned its own direction value.
+	 */
+	line::direction direction_default(void) const;
+
+	/**
+	 * @brief Get the direction setting for a given offset.
+	 * @param offset Line offset for which to read the direction setting.
+	 * @return Direction setting that would have been used for given offset
+	 *         if the config object was used in a request at the time of
+	 *         the call.
+	 */
+	line::direction direction_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the direction override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_direction_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the direction setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if direction is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool direction_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default edge event detection.
+	 * @param edge Type of edge events to detect.
+	 */
+	void set_edge_detection_default(line::edge edge);
+
+	/**
+	 * @brief Set the edge event detection for a single line at given
+	 *        offset.
+	 * @param edge Type of edge events to detect.
+	 * @param offset Offset of the line for which to set the direction.
+	 */
+	void set_edge_detection_override(line::edge edge, line::offset offset);
+
+	/**
+	 * @brief Get the default edge detection setting.
+	 * @return Edge detection setting that would have been used for any
+	 *         offset not assigned its own direction value.
+	 */
+	line::edge edge_detection_default(void) const;
+
+	/**
+	 * @brief Get the edge event detection setting for a given offset.
+	 * @param offset Line offset for which to read the edge detection
+	 *               setting.
+	 * @return Edge event detection setting that would have been used for
+	 * 	   given offset if the config object was used in a request at
+	 * 	   the time of the call.
+	 */
+	line::edge edge_detection_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the edge detection override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_edge_detection_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the edge detection setting is overridden at given
+	 *        offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if edge detection is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool edge_detection_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default bias setting.
+	 * @param bias New bias.
+	 */
+	void set_bias_default(line::bias bias);
+
+	/**
+	 * @brief Set the bias for a single line at given offset.
+	 * @param bias New bias.
+	 * @param offset Offset of the line for which to set the bias.
+	 */
+	void set_bias_override(line::bias bias, line::offset offset);
+
+	/**
+	 * @brief Get the default bias setting.
+	 * @return Bias setting that would have been used for any offset not
+	 *         assigned its own direction value.
+	 */
+	line::bias bias_default(void) const;
+
+	/**
+	 * @brief Get the bias setting for a given offset.
+	 * @param offset Line offset for which to read the bias setting.
+	 * @return Bias setting that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::bias bias_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the bias override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_bias_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the bias setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if bias is overridden at this offset, false otherwise.
+	 */
+	bool bias_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default drive setting.
+	 * @param drive New drive.
+	 */
+	void set_drive_default(line::drive drive);
+
+	/**
+	 * @brief Set the drive for a single line at given offset.
+	 * @param drive New drive.
+	 * @param offset Offset of the line for which to set the drive.
+	 */
+	void set_drive_override(line::drive drive, line::offset offset);
+
+	/**
+	 * @brief Set the drive for a subset of offsets.
+	 * @param drive New drive.
+	 * @param offsets Vector of line offsets for which to set the drive.
+	 */
+	void set_drive(line::drive drive, const line::offsets& offsets);
+
+	/**
+	 * @brief Get the default drive setting.
+	 * @return Drive setting that would have been used for any offset not
+	 *         assigned its own direction value.
+	 */
+	line::drive drive_default(void) const;
+
+	/**
+	 * @brief Get the drive setting for a given offset.
+	 * @param offset Line offset for which to read the drive setting.
+	 * @return Drive setting that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::drive drive_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the drive override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_drive_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the drive setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if drive is overridden at this offset, false otherwise.
+	 */
+	bool drive_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set lines to active-low by default.
+	 * @param active_low New active-low setting.
+	 */
+	void set_active_low_default(bool active_low) noexcept;
+
+	/**
+	 * @brief Set a single line as active-low.
+	 * @param active_low New active-low setting.
+	 * @param offset Offset of the line for which to set the active setting.
+	 */
+	void set_active_low_override(bool active_low, line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if active-low is the default setting.
+	 * @return Active-low setting that would have been used for any offset
+         *         not assigned its own value.
+	 */
+	bool active_low_default(void) const noexcept;
+
+	/**
+	 * @brief Check if the line at given offset was configured as
+	 *        active-low.
+	 * @param offset Line offset for which to read the active-low setting.
+	 * @return Active-low setting that would have been used for given
+	 *         offset if the config object was used in a request at the
+	 *         time of the call.
+	 */
+	bool active_low_offset(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Clear the active-low override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_active_low_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the active-low setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if active-low is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool active_low_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default debounce period.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 */
+	void set_debounce_period_default(const ::std::chrono::microseconds& period) noexcept;
+
+	/**
+	 * @brief Set the debounce period for a single line at given offset.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 * @param offset Offset of the line for which to set the debounce
+	 *               period.
+	 */
+	void set_debounce_period_override(const ::std::chrono::microseconds& period,
+					     line::offset offset) noexcept;
+
+	/**
+	 * @brief Get the default debounce period.
+	 * @return Debounce period that would have been used for any offset not
+	 *         assigned its own debounce period. 0 if not debouncing is
+	 *         disabled.
+	 */
+	::std::chrono::microseconds debounce_period_default(void) const noexcept;
+
+	/**
+	 * @brief Get the debounce period for a given offset.
+	 * @param offset Line offset for which to read the debounce period.
+	 * @return Debounce period that would have been used for given offset
+	 *         if the config object was used in a request at the time of
+	 *         the call. 0 if debouncing is disabled.
+	 */
+	::std::chrono::microseconds debounce_period_offset(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Clear the debounce period override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_debounce_period_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the debounce period setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if debounce period is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool debounce_period_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default event timestamp clock.
+	 * @param clock New clock to use.
+	 */
+	void set_event_clock_default(line::clock clock);
+
+	/**
+	 * @brief Set the event clock for a single line at given offset.
+	 * @param clock New clock to use.
+	 * @param offset Offset of the line for which to set the event clock
+	 *               type.
+	 */
+	void set_event_clock_override(line::clock clock, line::offset offset);
+
+	/**
+	 * @brief Get the default event clock setting.
+	 * @return Event clock setting that would have been used for any offset
+	 *         not assigned its own direction value.
+	 */
+	line::clock event_clock_default(void) const;
+
+	/**
+	 * @brief Get the event clock setting for a given offset.
+	 * @param offset Line offset for which to read the event clock setting.
+	 * @return Event clock setting that would have been used for given
+	 *         offset if the config object was used in a request at the
+	 *         time of the call.
+	 */
+	line::clock event_clock_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the event clock override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_event_clock_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the event clock setting is overridden at given
+	 *        offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if event clock is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool event_clock_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default output value.
+	 * @param value New value.
+	 */
+	void set_output_value_default(line::value value) noexcept;
+
+	/**
+	 * @brief Set the output value for a single offset.
+	 * @param offset Line offset to associate the value with.
+	 * @param value New value.
+	 */
+	void set_output_value_override(line::value value, line::offset offset) noexcept;
+
+	/**
+	 * @brief Set the output values for a set of line offsets.
+	 * @param values Vector of offset->value mappings.
+	 */
+	void set_output_values(const line::value_mappings& values);
+
+	/**
+	 * @brief Set the output values for a set of line offsets.
+	 * @param offsets Vector of line offsets for which to set output values.
+	 * @param values Vector of new line values with indexes of values
+	 *               corresponding to the indexes of offsets.
+	 */
+	void set_output_values(const line::offsets& offsets, const line::values& values);
+
+	/**
+	 * @brief Get the default output value.
+	 * @return Output value that would have been used for any offset not
+	 *         assigned its own output value.
+	 */
+	line::value output_value_default(void) const noexcept;
+
+	/**
+	 * @brief Get the output value configured for a given line.
+	 * @param offset Line offset for which to read the value.
+	 * @return Output value that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::value output_value_offset(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Clear the output value override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_output_value_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the output value setting is overridden at given
+	 *        offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if output value is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool output_value_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Get the number of configuration overrides.
+	 * @return Number of overrides held by this object.
+	 */
+	::std::size_t num_overrides(void) const noexcept;
+
+	/**
+	 * @brief Get the list of property overrides.
+	 * @return List of configuration property overrides held by this object.
+	 */
+	override_list overrides(void) const;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+	friend line_request;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO line config objects.
+ * @param out Output stream to write to.
+ * @param config Line config object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_config& config);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
new file mode 100644
index 0000000..e9883ab
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line-info.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_INFO_HPP__
+#define __LIBGPIOD_CXX_LINE_INFO_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <iostream>
+#include <memory>
+#include <string>
+
+namespace gpiod {
+
+class chip;
+class info_event;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Contains an immutable snapshot of the line's state at the
+ *        time when the object of this class was instantiated.
+ */
+class line_info
+{
+public:
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	line_info(const line_info& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_info(line_info&& other) noexcept;
+
+	~line_info(void);
+
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	line_info& operator=(const line_info& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	line_info& operator=(line_info&& other) noexcept;
+
+	/**
+	 * @brief Get the hardware offset of the line.
+	 * @return Offset of the line within the parent chip.
+	 */
+	line::offset offset(void) const noexcept;
+
+	/**
+	 * @brief Get the GPIO line name.
+	 * @return Name of the GPIO line as it is represented in the kernel.
+	 *         This routine returns an empty string if the line is unnamed.
+	 */
+	::std::string name(void) const noexcept;
+
+	/**
+	 * @brief Check if the line is currently in use.
+	 * @return True if the line is in use, false otherwise.
+	 *
+	 * The user space can't know exactly why a line is busy. It may have
+	 * been requested by another process or hogged by the kernel. It only
+	 * matters that the line is used and we can't request it.
+	 */
+	bool used(void) const noexcept;
+
+	/**
+	 * @brief Read the GPIO line consumer name.
+	 * @return Name of the GPIO consumer name as it is represented in the
+	 *         kernel. This routine returns an empty string if the line is
+	 *         not used.
+	 */
+	::std::string consumer(void) const noexcept;
+
+	/**
+	 * @brief Read the GPIO line direction setting.
+	 * @return Returns DIRECTION_INPUT or DIRECTION_OUTPUT.
+	 */
+	line::direction direction(void) const;
+
+	/**
+	 * @brief Read the current edge detection setting of this line.
+	 * @return Returns EDGE_NONE, EDGE_RISING, EDGE_FALLING or EDGE_BOTH.
+	 */
+	line::edge edge_detection(void) const;
+
+	/**
+	 * @brief Read the GPIO line bias setting.
+	 * @return Returns BIAS_PULL_UP, BIAS_PULL_DOWN, BIAS_DISABLE or
+	 *         BIAS_UNKNOWN.
+	 */
+	line::bias bias(void) const;
+
+	/**
+	 * @brief Read the GPIO line drive setting.
+	 * @return Returns DRIVE_PUSH_PULL, DRIVE_OPEN_DRAIN or
+	 *         DRIVE_OPEN_SOURCE.
+	 */
+	line::drive drive(void) const;
+
+	/**
+	 * @brief Check if the signal of this line is inverted.
+	 * @return True if this line is "active-low", false otherwise.
+	 */
+	bool active_low(void) const noexcept;
+
+	/**
+	 * @brief Check if this line is debounced (either by hardware or by the
+	 *        kernel software debouncer).
+	 * @return True if the line is debounced, false otherwise.
+	 */
+	bool debounced(void) const noexcept;
+
+	/**
+	 * @brief Read the current debounce period in microseconds.
+	 * @return Current debounce period in microseconds, 0 if the line is
+	 *         not debounced.
+	 */
+	::std::chrono::microseconds debounce_period(void) const noexcept;
+
+	/**
+	 * @brief Read the current event clock setting used for edge event
+	 *        timestamps.
+	 * @return Returns MONOTONIC or REALTIME.
+	 */
+	line::clock event_clock(void) const;
+
+private:
+
+	line_info(void);
+
+	struct impl;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend chip;
+	friend info_event;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO line info objects.
+ * @param out Output stream to write to.
+ * @param info GPIO line info object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_info& info);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
new file mode 100644
index 0000000..28ab6e1
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line-request.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_REQUEST_HPP__
+#define __LIBGPIOD_CXX_LINE_REQUEST_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <cstddef>
+#include <iostream>
+#include <memory>
+
+#include "misc.hpp"
+
+namespace gpiod {
+
+class chip;
+class edge_event;
+class edge_event_buffer;
+class line_config;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores the context of a set of requested GPIO lines.
+ */
+class line_request
+{
+public:
+
+	line_request(const line_request& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_request(line_request&& other) noexcept;
+
+	~line_request(void);
+
+	line_request& operator=(const line_request& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 */
+	line_request& operator=(line_request&& other) noexcept;
+
+	/**
+	 * @brief Check if this object is valid.
+	 * @return True if this object's methods can be used, false otherwise.
+	 *         False usually means the request was released. If the user
+	 *         calls any of the methods of this class on an object for
+	 *         which this operator returned false, a logic_error will be
+	 *         thrown.
+	 */
+	explicit operator bool(void) const noexcept;
+
+	/**
+	 * @brief Release the GPIO chip and free all associated resources.
+	 * @note The object can still be used after this method is called but
+	 *       using any of the mutators will result in throwing
+	 *       a logic_error exception.
+	 */
+	void release(void);
+
+	/**
+	 * @brief Get the number of requested lines.
+	 * @return Number of lines in this request.
+	 */
+	::std::size_t num_lines(void) const;
+
+	/**
+	 * @brief Get the list of offsets of requested lines.
+	 * @return List of hardware offsets of the lines in this request.
+	 */
+	line::offsets offsets(void) const;
+
+	/**
+	 * @brief Get the value of a single requested line.
+	 * @param offset Offset of the line to read within the chip.
+	 * @return Current line value.
+	 */
+	line::value get_value(line::offset offset);
+
+	/**
+	 * @brief Get the values of a subset of requested lines.
+	 * @param offsets Vector of line offsets
+	 * @return Vector of lines values with indexes of values corresponding
+	 *         to those of the offsets.
+	 */
+	line::values get_values(const line::offsets& offsets);
+
+	/**
+	 * @brief Get the values of all requested lines.
+	 * @return List of read values.
+	 */
+	line::values get_values(void);
+
+	/**
+	 * @brief Get the values of a subset of requested lines into a vector
+	 *        supplied by the caller.
+	 * @param offsets Vector of line offsets.
+	 * @param values Vector for storing the values. Its size must be at
+	 *               least that of the offsets vector. The indexes of read
+	 *               values will correspond with those in the offsets
+	 *               vector.
+	 */
+	void get_values(const line::offsets& offsets, line::values& values);
+
+	/**
+	 * @brief Get the values of all requested lines.
+	 * @param values Array in which the values will be stored. Must hold
+	 *               at least the number of elements returned by
+	 *               line_request::num_lines.
+	 */
+	void get_values(line::values& values);
+
+	/**
+	 * @brief Set the value of a single requested line.
+	 * @param offset Offset of the line to set within the chip.
+	 * @param value New line value.
+	 */
+	void set_value(line::offset offset, line::value value);
+
+	/**
+	 * @brief Set the values of a subset of requested lines.
+	 * @param values Vector containing a set of offset->value mappings.
+	 */
+	void set_values(const line::value_mappings& values);
+
+	/**
+	 * @brief Set the values of a subset of requested lines.
+	 * @param offsets Vector containing the offsets of lines to set.
+	 * @param values Vector containing new values with indexes
+	 *               corresponding with those in the offsets vector.
+	 */
+	void set_values(const line::offsets& offsets, const line::values& values);
+
+	/**
+	 * @brief Set the values of all requested lines.
+	 * @param values Array of new line values. The size must be equal to
+	 *               the value returned by line_request::num_lines.
+	 */
+	void set_values(const line::values& values);
+
+	/**
+	 * @brief Apply new config options to requested lines.
+	 * @param config New configuration.
+	 */
+	void reconfigure_lines(const line_config& config);
+
+	/**
+	 * @brief Get the file descriptor number associated with this line
+	 *        request.
+	 * @return File descriptor number.
+	 */
+	int fd(void) const;
+
+	/**
+	 * @brief Wait for edge events on any of the lines requested with edge
+	 *        detection enabled.
+	 * @param timeout Wait time limit in nanoseconds.
+	 * @return True if at least one event is ready to be read. False if the
+	 *         wait timed out.
+	 */
+	bool wait_edge_event(const ::std::chrono::nanoseconds& timeout) const;
+
+	/**
+	 * @brief Read a number of edge events from this request up to the
+	 *        maximum capacity of the buffer.
+	 * @param buffer Edge event buffer to read events into.
+	 * @return Number of events read.
+	 */
+	::std::size_t read_edge_event(edge_event_buffer& buffer);
+
+	/**
+	 * @brief Read a number of edge events from this request.
+	 * @param buffer Edge event buffer to read events into.
+	 * @param max_events Maximum number of events to read. Limited by the
+	 *                   capacity of the buffer.
+	 * @return Number of events read.
+	 */
+	::std::size_t read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events);
+
+private:
+
+	line_request(void);
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for line requests.
+ * @param out Output stream to write to.
+ * @param request Line request object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_request& request);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
new file mode 100644
index 0000000..8e8a984
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -0,0 +1,274 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_HPP__
+#define __LIBGPIOD_CXX_LINE_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <ostream>
+#include <utility>
+#include <vector>
+
+namespace gpiod {
+
+/**
+ * @brief Namespace containing various type definitions for GPIO lines.
+ */
+namespace line {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Wrapper around unsigned int for representing line offsets.
+ */
+class offset
+{
+public:
+	/**
+	 * @brief Constructor with implicit conversion from unsigned int.
+	 * @param off Line offset.
+	 */
+	offset(unsigned int off = 0) : _m_offset(off) {	}
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	offset(const offset& other) = default;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	offset(offset&& other) = default;
+
+	~offset(void) = default;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	offset& operator=(const offset& other) = default;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	offset& operator=(offset&& other) noexcept = default;
+
+	/**
+	 * @brief Conversion operator to `unsigned int`.
+	 */
+	operator unsigned int(void) const noexcept
+	{
+		return this->_m_offset;
+	}
+
+private:
+	unsigned int _m_offset;
+};
+
+/**
+ * @brief Logical line states.
+ */
+enum class value
+{
+	INACTIVE = 0,
+	/**< Line is inactive. */
+	ACTIVE = 1,
+	/**< Line is active. */
+};
+
+/**
+ * @brief Direction settings.
+ */
+enum class direction
+{
+	AS_IS = 1,
+	/**< Request the line(s), but don't change current direction. */
+	INPUT,
+	/**< Direction is input - we're reading the state of a GPIO line. */
+	OUTPUT
+	/**< Direction is output - we're driving the GPIO line. */
+};
+
+/**
+ * @brief Edge detection settings.
+ */
+enum class edge
+{
+	NONE = 1,
+	/**< Line edge detection is disabled. */
+	RISING,
+	/**< Line detects rising edge events. */
+	FALLING,
+	/**< Line detect falling edge events. */
+	BOTH
+	/**< Line detects both rising and falling edge events. */
+};
+
+/**
+ * @brief Internal bias settings.
+ */
+enum class bias
+{
+	AS_IS = 1,
+	/**< Don't change the bias setting when applying line config. */
+	UNKNOWN,
+	/**< The internal bias state is unknown. */
+	DISABLED,
+	/**< The internal bias is disabled. */
+	PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	PULL_DOWN
+	/**< The internal pull-down bias is enabled. */
+};
+
+/**
+ * @brief Drive settings.
+ */
+enum class drive
+{
+	PUSH_PULL = 1,
+	/**< Drive setting is push-pull. */
+	OPEN_DRAIN,
+	/**< Line output is open-drain. */
+	OPEN_SOURCE
+	/**< Line output is open-source. */
+};
+
+/**
+ * @brief Event clock settings.
+ */
+enum class clock
+{
+	MONOTONIC = 1,
+	/**< Line uses the monotonic clock for edge event timestamps. */
+	REALTIME
+	/**< Line uses the realtime clock for edge event timestamps. */
+};
+
+/**
+ * @brief Vector of line offsets.
+ */
+using offsets = ::std::vector<offset>;
+
+/**
+ * @brief Vector of line values.
+ */
+using values = ::std::vector<value>;
+
+/**
+ * @brief Represents a mapping of a line offset to line logical state.
+ */
+using value_mapping = ::std::pair<offset, value>;
+
+/**
+ * @brief Vector of offset->value mappings. Each mapping is defined as a pair
+ *        of an unsigned and signed integers.
+ */
+using value_mappings = ::std::vector<value_mapping>;
+
+/**
+ * @brief Stream insertion operator for logical line values.
+ * @param out Output stream.
+ * @param val Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, value val);
+
+/**
+ * @brief Stream insertion operator for direction values.
+ * @param out Output stream.
+ * @param dir Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, direction dir);
+
+/**
+ * @brief Stream insertion operator for edge detection values.
+ * @param out Output stream.
+ * @param edge Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, edge edge);
+
+/**
+ * @brief Stream insertion operator for bias values.
+ * @param out Output stream.
+ * @param bias Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, bias bias);
+
+/**
+ * @brief Stream insertion operator for drive values.
+ * @param out Output stream.
+ * @param drive Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, drive drive);
+
+/**
+ * @brief Stream insertion operator for event clock values.
+ * @param out Output stream.
+ * @param clock Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, clock clock);
+
+/**
+ * @brief Stream insertion operator for the list of output values.
+ * @param out Output stream.
+ * @param vals Object to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const values& vals);
+
+/**
+ * @brief Stream insertion operator for the list of line offsets.
+ * @param out Output stream.
+ * @param offs Object to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const offsets& offs);
+
+/**
+ * @brief Stream insertion operator for the offset-to-value mapping.
+ * @param out Output stream.
+ * @param mapping Value to insert into the output stream in a human-readable
+ *        form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const value_mapping& mapping);
+
+/**
+ * @brief Stream insertion operator for the list of offset-to-value mappings.
+ * @param out Output stream.
+ * @param mappings Object to insert into the output stream in a human-readable
+ *        form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const value_mappings& mappings);
+
+/**
+ * @}
+ */
+
+} /* namespace line */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/misc.hpp b/bindings/cxx/gpiodcxx/misc.hpp
new file mode 100644
index 0000000..6e0084b
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/misc.hpp
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file misc.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_MISC_HPP__
+#define __LIBGPIOD_CXX_MISC_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <string>
+
+namespace gpiod {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return True if the file exists and is a GPIO chip character device or a
+ *         symbolic link to it.
+ */
+bool is_gpiochip_device(const ::std::filesystem::path& path);
+
+/**
+ * @brief Get the human readable version string for libgpiod API
+ * @return String containing the library version.
+ */
+const ::std::string& version_string(void);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_MISC_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
new file mode 100644
index 0000000..52444c9
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file request-config.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__
+#define __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <any>
+#include <cstddef>
+#include <iostream>
+#include <map>
+#include <memory>
+#include <string>
+
+#include "line.hpp"
+
+namespace gpiod {
+
+class chip;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores a set of options passed to the kernel when making a line
+ *        request.
+ */
+class request_config
+{
+public:
+
+	/**
+	 * @brief List of available configuration settings. Used in the
+	 *        constructor and :request_config::set_property.
+	 */
+	enum class property {
+		OFFSETS = 1,
+		/**< List of line offsets to request. */
+		CONSUMER,
+		/**< Consumer string. */
+		EVENT_BUFFER_SIZE,
+		/**< Suggested size of the edge event buffer. */
+	};
+
+	/**
+	 * @brief Map of mappings between property types and property values.
+	 */
+	using properties = ::std::map<property, ::std::any>;
+
+	/**
+	 * @brief Constructor.
+	 * @param props List of config properties. See
+	 *              :request_config::set_property.
+	 */
+	explicit request_config(const properties& props = properties());
+
+	request_config(const request_config& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	request_config(request_config&& other) noexcept;
+
+	~request_config(void);
+
+	request_config& operator=(const request_config& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	request_config& operator=(request_config&& other) noexcept;
+
+	/**
+	 * @brief Set the value of a single config property.
+	 * @param prop Property to set.
+	 * @param val Property value. The type must correspond to the property
+	 *            being set: `std::string` or `const char*` for
+	 *            :property::CONSUMER, `:line::offsets` for
+	 *            :property::OFFSETS and `unsigned long` for
+	 *            :property::EVENT_BUFFER_SIZE.
+	 */
+	void set_property(property prop, const ::std::any& val);
+
+	/**
+	 * @brief Set line offsets for this request.
+	 * @param offsets Vector of line offsets to request.
+	 */
+	void set_offsets(const line::offsets& offsets) noexcept;
+
+	/**
+	 * @brief Get the number of offsets configured in this request config.
+	 * @return Number of line offsets in this request config.
+	 */
+	::std::size_t num_offsets(void) const noexcept;
+
+	/**
+	 * @brief Set the consumer name.
+	 * @param consumer New consumer name.
+	 */
+	void set_consumer(const ::std::string& consumer) noexcept;
+
+	/**
+	 * @brief Get the consumer name.
+	 * @return Currently configured consumer name. May be an empty string.
+	 */
+	::std::string consumer(void) const noexcept;
+
+	/**
+	 * @brief Get the hardware offsets of lines in this request config.
+	 * @return List of line offsets.
+	 */
+	line::offsets offsets(void) const;
+
+	/**
+	 * @brief Set the size of the kernel event buffer.
+	 * @param event_buffer_size New event buffer size.
+	 * @note The kernel may adjust the value if it's too high. If set to 0,
+	 *       the default value will be used.
+	 */
+	void set_event_buffer_size(::std::size_t event_buffer_size) noexcept;
+
+	/**
+	 * @brief Get the edge event buffer size from this request config.
+	 * @return Current edge event buffer size setting.
+	 */
+	::std::size_t event_buffer_size(void) const noexcept;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for request_config objects.
+ * @param out Output stream to write to.
+ * @param config request_config to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const request_config& config);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/timestamp.hpp b/bindings/cxx/gpiodcxx/timestamp.hpp
new file mode 100644
index 0000000..d707fee
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/timestamp.hpp
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file timestamp.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_TIMESTAMP_HPP__
+#define __LIBGPIOD_CXX_TIMESTAMP_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <cstdint>
+
+namespace gpiod {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores the edge and info event timestamps as returned by the kernel
+ *        and allows to convert them to std::chrono::time_point.
+ */
+class timestamp
+{
+public:
+
+	/**
+	 * @brief Monotonic time_point.
+	 */
+	using time_point_monotonic = ::std::chrono::time_point<::std::chrono::steady_clock>;
+
+	/**
+	 * @brief Real-time time_point.
+	 */
+	using time_point_realtime = ::std::chrono::time_point<::std::chrono::system_clock>;
+
+	/**
+	 * @brief Constructor with implicit  conversion from `uint64_t`.
+	 * @param ns Timestamp in nanoseconds.
+	 */
+	timestamp(::std::uint64_t ns) : _m_ns(ns) { }
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	timestamp(const timestamp& other) noexcept = default;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	timestamp(timestamp&& other) noexcept = default;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	timestamp& operator=(const timestamp& other) noexcept = default;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	timestamp& operator=(timestamp&& other) noexcept = default;
+
+	~timestamp(void) = default;
+
+	/**
+	 * @brief Conversion operator to `std::uint64_t`.
+	 */
+	operator ::std::uint64_t(void) noexcept
+	{
+		return this->ns();
+	}
+
+	/**
+	 * @brief Get the timestamp in nanoseconds.
+	 * @return Timestamp in nanoseconds.
+	 */
+	::std::uint64_t ns(void) const noexcept
+	{
+		return this->_m_ns;
+	}
+
+	/**
+	 * @brief Convert the timestamp to a monotonic time_point.
+	 * @return time_point associated with the steady clock.
+	 */
+	time_point_monotonic to_time_point_monotonic(void) const
+	{
+		return time_point_monotonic(::std::chrono::nanoseconds(this->ns()));
+	}
+
+	/**
+	 * @brief Convert the timestamp to a real-time time_point.
+	 * @return time_point associated with the system clock.
+	 */
+	time_point_realtime to_time_point_realtime(void) const
+	{
+		return time_point_realtime(::std::chrono::nanoseconds(this->ns()));
+	}
+
+private:
+	::std::uint64_t _m_ns;
+};
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_TIMESTAMP_HPP__ */
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
new file mode 100644
index 0000000..6492e42
--- /dev/null
+++ b/bindings/cxx/info-event.cpp
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<int, info_event::event_type> event_type_mapping = {
+	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::event_type::LINE_REQUESTED },
+	{ GPIOD_INFO_EVENT_LINE_RELEASED,	info_event::event_type::LINE_RELEASED },
+	{ GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,	info_event::event_type::LINE_CONFIG_CHANGED }
+};
+
+const ::std::map<info_event::event_type, ::std::string> event_type_names = {
+	{ info_event::event_type::LINE_REQUESTED,	"LINE_REQUESTED" },
+	{ info_event::event_type::LINE_RELEASED,	"LINE_RELEASED" },
+	{ info_event::event_type::LINE_CONFIG_CHANGED,	"LINE_CONFIG_CHANGED" }
+};
+
+} /* namespace */
+
+void info_event::impl::set_info_event_ptr(info_event_ptr& new_event)
+{
+	::gpiod_line_info* info = ::gpiod_info_event_get_line_info(new_event.get());
+
+	line_info_ptr copy(::gpiod_line_info_copy(info));
+	if (!copy)
+		throw_from_errno("unable to copy the line info object");
+
+	this->event = ::std::move(new_event);
+	this->info._m_priv->set_info_ptr(copy);
+}
+
+info_event::info_event(void)
+	: _m_priv(new impl)
+{
+
+}
+
+GPIOD_CXX_API info_event::info_event(const info_event& other)
+	: _m_priv(other._m_priv)
+{
+
+}
+
+GPIOD_CXX_API info_event::info_event(info_event&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API info_event::~info_event(void)
+{
+
+}
+
+GPIOD_CXX_API info_event& info_event::operator=(const info_event& other)
+{
+	this->_m_priv = other._m_priv;
+
+	return *this;
+}
+
+GPIOD_CXX_API info_event& info_event::operator=(info_event&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API info_event::event_type info_event::type(void) const
+{
+	int type = ::gpiod_info_event_get_event_type(this->_m_priv->event.get());
+
+	return map_int_to_enum(type, event_type_mapping);
+}
+
+GPIOD_CXX_API ::std::uint64_t info_event::timestamp_ns(void) const noexcept
+{
+	return ::gpiod_info_event_get_timestamp_ns(this->_m_priv->event.get());
+}
+
+GPIOD_CXX_API const line_info& info_event::get_line_info(void) const noexcept
+{
+	return this->_m_priv->info;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const info_event& event)
+{
+	out << "info_event(event_type='" << event_type_names.at(event.type()) <<
+	       "', timestamp=" << event.timestamp_ns() <<
+	       ", line_info=" << event.get_line_info() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/internal.cpp b/bindings/cxx/internal.cpp
new file mode 100644
index 0000000..9f1f38f
--- /dev/null
+++ b/bindings/cxx/internal.cpp
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <stdexcept>
+#include <system_error>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+void throw_from_errno(const ::std::string& what)
+{
+	switch (errno) {
+	case EINVAL:
+		throw ::std::invalid_argument(what);
+	case E2BIG:
+		throw ::std::length_error(what);
+	case ENOMEM:
+		throw ::std::bad_alloc();
+	case EDOM:
+		throw ::std::domain_error(what);
+	default:
+		throw ::std::system_error(errno, ::std::system_category(), what);
+	}
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index 9406d30..c4b5d34 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -1,9 +1,207 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
-/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
 
-#ifndef __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__
-#define __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__
+#ifndef __LIBGPIOD_CXX_INTERNAL_HPP__
+#define __LIBGPIOD_CXX_INTERNAL_HPP__
 
-#define GPIOD_CXX_API __attribute__((visibility("default")))
+#include <gpiod.h>
+#include <iostream>
+#include <iterator>
+#include <memory>
+#include <string>
+#include <utility>
+#include <vector>
 
-#endif /* __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__ */
+#include "gpiod.hpp"
+
+#define GPIOD_CXX_UNUSED	__attribute__((unused))
+#define GPIOD_CXX_NORETURN	__attribute__((noreturn))
+
+namespace gpiod {
+
+template<class enum_type> enum_type
+map_int_to_enum(int value, const ::std::map<int, enum_type>& mapping)
+{
+	try {
+		return mapping.at(value);
+	} catch (const ::std::out_of_range& err) {
+		throw bad_mapping(::std::string("invalid value for ") +
+				  typeid(enum_type).name());
+	}
+}
+
+void throw_from_errno(const ::std::string& what);
+
+template<class T, void F(T*)> struct deleter
+{
+	void operator()(T* ptr)
+	{
+		F(ptr);
+	}
+};
+
+using chip_info_deleter = deleter<::gpiod_chip_info, ::gpiod_chip_info_free>;
+using line_info_deleter = deleter<::gpiod_line_info, ::gpiod_line_info_free>;
+using info_event_deleter = deleter<::gpiod_info_event, ::gpiod_info_event_free>;
+using line_config_deleter = deleter<::gpiod_line_config, ::gpiod_line_config_free>;
+using request_config_deleter = deleter<::gpiod_request_config, ::gpiod_request_config_free>;
+using line_request_deleter = deleter<::gpiod_line_request, ::gpiod_line_request_release>;
+using edge_event_deleter = deleter<::gpiod_edge_event, ::gpiod_edge_event_free>;
+using edge_event_buffer_deleter = deleter<::gpiod_edge_event_buffer,
+					  ::gpiod_edge_event_buffer_free>;
+
+using chip_info_ptr = ::std::unique_ptr<::gpiod_chip_info, chip_info_deleter>;
+using line_info_ptr = ::std::unique_ptr<::gpiod_line_info, line_info_deleter>;
+using info_event_ptr = ::std::unique_ptr<::gpiod_info_event, info_event_deleter>;
+using line_config_ptr = ::std::unique_ptr<::gpiod_line_config, line_config_deleter>;
+using request_config_ptr = ::std::unique_ptr<::gpiod_request_config, request_config_deleter>;
+using line_request_ptr = ::std::unique_ptr<::gpiod_line_request, line_request_deleter>;
+using edge_event_ptr = ::std::unique_ptr<::gpiod_edge_event, edge_event_deleter>;
+using edge_event_buffer_ptr = ::std::unique_ptr<::gpiod_edge_event_buffer,
+						edge_event_buffer_deleter>;
+
+struct chip_info::impl
+{
+	impl(void) = default;
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	void set_info_ptr(chip_info_ptr& new_info);
+
+	chip_info_ptr info;
+};
+
+struct line_info::impl
+{
+	impl(void) = default;
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	void set_info_ptr(line_info_ptr& new_info);
+
+	line_info_ptr info;
+};
+
+struct info_event::impl
+{
+	impl(void) = default;
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	void set_info_event_ptr(info_event_ptr& new_event);
+
+	info_event_ptr event;
+	line_info info;
+};
+
+struct line_config::impl
+{
+	impl(void);
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	line_config_ptr config;
+};
+
+struct request_config::impl
+{
+	impl(void);
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	request_config_ptr config;
+};
+
+struct line_request::impl
+{
+	impl(void) = default;
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	void throw_if_released(void) const;
+	void set_request_ptr(line_request_ptr& ptr);
+	void fill_offset_buf(const line::offsets& offsets);
+
+	line_request_ptr request;
+
+	/*
+	 * Used when reading/setting the line values in order to avoid
+	 * allocating a new buffer on every call. We're not doing it for
+	 * offsets in the line & request config structures because they don't
+	 * require high performance unlike the set/get value calls.
+	 */
+	::std::vector<unsigned int> offset_buf;
+};
+
+struct edge_event::impl
+{
+	impl(void) = default;
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	virtual ~impl(void) = default;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	virtual ::gpiod_edge_event* get_event_ptr(void) const noexcept = 0;
+	virtual ::std::shared_ptr<impl> copy(const ::std::shared_ptr<impl>& self) const = 0;
+};
+
+struct edge_event::impl_managed : public edge_event::impl
+{
+	impl_managed(void) = default;
+	impl_managed(const impl_managed& other) = delete;
+	impl_managed(impl_managed&& other) = delete;
+	virtual ~impl_managed(void) = default;
+	impl_managed& operator=(const impl_managed& other) = delete;
+	impl_managed& operator=(impl_managed&& other) = delete;
+
+	::gpiod_edge_event* get_event_ptr(void) const noexcept override;
+	::std::shared_ptr<impl> copy(const ::std::shared_ptr<impl>& self) const override;
+
+	edge_event_ptr event;
+};
+
+struct edge_event::impl_external : public edge_event::impl
+{
+	impl_external(void);
+	impl_external(const impl_external& other) = delete;
+	impl_external(impl_external&& other) = delete;
+	virtual ~impl_external(void) = default;
+	impl_external& operator=(const impl_external& other) = delete;
+	impl_external& operator=(impl_external&& other) = delete;
+
+	::gpiod_edge_event* get_event_ptr(void) const noexcept override;
+	::std::shared_ptr<impl> copy(const ::std::shared_ptr<impl>& self) const override;
+
+	::gpiod_edge_event *event;
+};
+
+struct edge_event_buffer::impl
+{
+	impl(unsigned int capacity);
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	int read_events(const line_request_ptr& request, unsigned int max_events);
+
+	edge_event_buffer_ptr buffer;
+	::std::vector<edge_event> events;
+};
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_INTERNAL_HPP__ */
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
deleted file mode 100644
index 09d46f3..0000000
--- a/bindings/cxx/iter.cpp
+++ /dev/null
@@ -1,60 +0,0 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <gpiod.hpp>
-#include <system_error>
-
-#include "internal.hpp"
-
-namespace gpiod {
-
-GPIOD_CXX_API line_iter begin(line_iter iter) noexcept
-{
-	return iter;
-}
-
-GPIOD_CXX_API line_iter end(const line_iter&) noexcept
-{
-	return line_iter();
-}
-
-GPIOD_CXX_API line_iter::line_iter(const chip& owner)
-	: _m_current(owner.get_line(0))
-{
-
-}
-
-GPIOD_CXX_API line_iter& line_iter::operator++(void)
-{
-	unsigned int offset = this->_m_current.offset() + 1;
-	chip owner = this->_m_current.get_chip();
-
-	if (offset == owner.num_lines())
-		this->_m_current = line(); /* Last element */
-	else
-		this->_m_current = owner.get_line(offset);
-
-	return *this;
-}
-
-GPIOD_CXX_API const line& line_iter::operator*(void) const
-{
-	return this->_m_current;
-}
-
-GPIOD_CXX_API const line* line_iter::operator->(void) const
-{
-	return ::std::addressof(this->_m_current);
-}
-
-GPIOD_CXX_API bool line_iter::operator==(const line_iter& rhs) const noexcept
-{
-	return this->_m_current._m_line == rhs._m_current._m_line;
-}
-
-GPIOD_CXX_API bool line_iter::operator!=(const line_iter& rhs) const noexcept
-{
-	return this->_m_current._m_line != rhs._m_current._m_line;
-}
-
-} /* namespace gpiod */
diff --git a/bindings/cxx/line-config.cpp b/bindings/cxx/line-config.cpp
new file mode 100644
index 0000000..7765328
--- /dev/null
+++ b/bindings/cxx/line-config.cpp
@@ -0,0 +1,685 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <iterator>
+#include <map>
+#include <sstream>
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
+	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME },
+};
+
+const ::std::map<int, line::clock> reverse_clock_mapping = make_reverse_maping(clock_mapping);
+
+template<class key_type, class value_type, class exception_type>
+value_type map_setting(const key_type& key, const ::std::map<key_type, value_type>& mapping)
+{
+	value_type ret;
+
+	try {
+		ret = mapping.at(key);
+	} catch (const ::std::out_of_range& err) {
+		throw exception_type(::std::string("invalid value for ") +
+				     typeid(key_type).name());
+	}
+
+	return ret;
+}
+
+::gpiod_line_config* make_line_config(void)
+{
+	::gpiod_line_config *config = ::gpiod_line_config_new();
+	if (!config)
+		throw_from_errno("Unable to allocate the line config object");
+
+	return config;
+}
+
+template<class enum_type>
+int do_map_value(enum_type value, const ::std::map<enum_type, int>& mapping)
+{
+	return map_setting<enum_type, int, ::std::invalid_argument>(value, mapping);
+}
+
+template<class enum_type, void set_func(::gpiod_line_config*, int)>
+void set_mapped_value_default(::gpiod_line_config* config, enum_type value,
+			      const ::std::map<enum_type, int>& mapping)
+{
+	int mapped_val = do_map_value(value, mapping);
+
+	set_func(config, mapped_val);
+}
+
+template<class enum_type, void set_func(::gpiod_line_config*, int, unsigned int)>
+void set_mapped_value_override(::gpiod_line_config* config, enum_type value, line::offset offset,
+			       const ::std::map<enum_type, int>& mapping)
+{
+	int mapped_val = do_map_value(value, mapping);
+
+	set_func(config, mapped_val, offset);
+}
+
+template<class ret_type, int get_func(::gpiod_line_config*)>
+ret_type get_mapped_value_default(::gpiod_line_config* config,
+				  const ::std::map<int, ret_type>& mapping)
+{
+	int mapped_val = get_func(config);
+
+	return map_int_to_enum(mapped_val, mapping);
+}
+
+template<class ret_type, int get_func(::gpiod_line_config*, unsigned int)>
+ret_type get_mapped_value_offset(::gpiod_line_config* config, line::offset offset,
+				 const ::std::map<int, ret_type>& mapping)
+{
+	int mapped_val = get_func(config, offset);
+
+	return map_int_to_enum(mapped_val, mapping);
+}
+
+const ::std::map<int, line_config::property> property_mapping = {
+	{ GPIOD_LINE_CONFIG_PROP_DIRECTION,		line_config::property::DIRECTION },
+	{ GPIOD_LINE_CONFIG_PROP_EDGE,			line_config::property::EDGE },
+	{ GPIOD_LINE_CONFIG_PROP_BIAS,			line_config::property::BIAS },
+	{ GPIOD_LINE_CONFIG_PROP_DRIVE,			line_config::property::DRIVE },
+	{ GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW,		line_config::property::ACTIVE_LOW },
+	{ GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US,	line_config::property::DEBOUNCE_PERIOD },
+	{ GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK,		line_config::property::EVENT_CLOCK },
+	{ GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE,		line_config::property::OUTPUT_VALUE }
+};
+
+} /* namespace */
+
+line_config::impl::impl(void)
+	: config(make_line_config())
+{
+
+}
+
+GPIOD_CXX_API line_config::line_config(const properties& props)
+	: _m_priv(new impl)
+{
+	for (const auto& prop: props) {
+		if (prop.first == property::OUTPUT_VALUES)
+			this->set_output_values(::std::any_cast<line::value_mappings>(prop.second));
+		else
+			this->set_property_default(prop.first, prop.second);
+	}
+}
+
+GPIOD_CXX_API line_config::line_config(line_config&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API line_config::~line_config(void)
+{
+
+}
+
+GPIOD_CXX_API void line_config::reset(void) noexcept
+{
+	::gpiod_line_config_reset(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API line_config& line_config::operator=(line_config&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API void line_config::set_property_default(property prop, const ::std::any& val)
+{
+	switch(prop) {
+	case property::DIRECTION:
+		this->set_direction_default(::std::any_cast<line::direction>(val));
+		break;
+	case property::EDGE:
+		this->set_edge_detection_default(::std::any_cast<line::edge>(val));
+		break;
+	case property::BIAS:
+		this->set_bias_default(::std::any_cast<line::bias>(val));
+		break;
+	case property::DRIVE:
+		this->set_drive_default(::std::any_cast<line::drive>(val));
+		break;
+	case property::ACTIVE_LOW:
+		this->set_active_low_default(::std::any_cast<bool>(val));
+		break;
+	case property::DEBOUNCE_PERIOD:
+		this->set_debounce_period_default(::std::any_cast<::std::chrono::microseconds>(val));
+		break;
+	case property::EVENT_CLOCK:
+		this->set_event_clock_default(::std::any_cast<line::clock>(val));
+		break;
+	case property::OUTPUT_VALUE:
+		this->set_output_value_default(::std::any_cast<line::value>(val));
+		break;
+	default:
+		throw ::std::invalid_argument("invalid property type");
+	}
+}
+
+GPIOD_CXX_API void line_config::set_property_offset(property prop, line::offset offset,
+						    const ::std::any& val)
+{
+	switch(prop) {
+	case property::DIRECTION:
+		this->set_direction_override(::std::any_cast<line::direction>(val), offset);
+		break;
+	case property::EDGE:
+		this->set_edge_detection_override(::std::any_cast<line::edge>(val), offset);
+		break;
+	case property::BIAS:
+		this->set_bias_override(::std::any_cast<line::bias>(val), offset);
+		break;
+	case property::DRIVE:
+		this->set_drive_override(::std::any_cast<line::drive>(val), offset);
+		break;
+	case property::ACTIVE_LOW:
+		this->set_active_low_override(::std::any_cast<bool>(val), offset);
+		break;
+	case property::DEBOUNCE_PERIOD:
+		this->set_debounce_period_override(::std::any_cast<::std::chrono::microseconds>(val),
+						      offset);
+		break;
+	case property::EVENT_CLOCK:
+		this->set_event_clock_override(::std::any_cast<line::clock>(val), offset);
+		break;
+	case property::OUTPUT_VALUE:
+		this->set_output_value_override(::std::any_cast<line::value>(val), offset);
+		break;
+	default:
+		throw ::std::invalid_argument("invalid property type");
+	}
+}
+
+GPIOD_CXX_API void line_config::set_direction_default(line::direction direction)
+{
+	set_mapped_value_default<line::direction,
+				 ::gpiod_line_config_set_direction_default>(this->_m_priv->config.get(),
+									    direction, direction_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_direction_override(line::direction direction, line::offset offset)
+{
+	set_mapped_value_override<line::direction,
+				  ::gpiod_line_config_set_direction_override>(this->_m_priv->config.get(),
+									      direction, offset,
+									      direction_mapping);
+}
+
+GPIOD_CXX_API line::direction line_config::direction_default(void) const
+{
+	return get_mapped_value_default<line::direction,
+					::gpiod_line_config_get_direction_default>(
+							this->_m_priv->config.get(),
+							reverse_direction_mapping);
+}
+
+GPIOD_CXX_API line::direction line_config::direction_offset(line::offset offset) const
+{
+	return get_mapped_value_offset<line::direction,
+				       ::gpiod_line_config_get_direction_offset>(
+						       this->_m_priv->config.get(),
+						       offset, reverse_direction_mapping);
+}
+
+GPIOD_CXX_API void line_config::clear_direction_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_direction_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::direction_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_direction_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_edge_detection_default(line::edge edge)
+{
+	set_mapped_value_default<line::edge,
+				 ::gpiod_line_config_set_edge_detection_default>(
+						 this->_m_priv->config.get(),
+						 edge, edge_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_edge_detection_override(line::edge edge, line::offset offset)
+{
+	set_mapped_value_override<line::edge,
+				  ::gpiod_line_config_set_edge_detection_override>(
+						this->_m_priv->config.get(),
+						edge, offset, edge_mapping);
+}
+
+GPIOD_CXX_API line::edge line_config::edge_detection_default(void) const
+{
+	return get_mapped_value_default<line::edge,
+					::gpiod_line_config_get_edge_detection_default>(
+							this->_m_priv->config.get(),
+							reverse_edge_mapping);
+}
+
+GPIOD_CXX_API line::edge line_config::edge_detection_offset(line::offset offset) const
+{
+	return get_mapped_value_offset<line::edge,
+				       ::gpiod_line_config_get_edge_detection_offset>(
+						       this->_m_priv->config.get(),
+						       offset, reverse_edge_mapping);
+}
+
+GPIOD_CXX_API void line_config::clear_edge_detection_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_edge_detection_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::edge_detection_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_edge_detection_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_bias_default(line::bias bias)
+{
+	set_mapped_value_default<line::bias,
+				 ::gpiod_line_config_set_bias_default>(this->_m_priv->config.get(),
+								       bias, bias_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_bias_override(line::bias bias, line::offset offset)
+{
+	set_mapped_value_override<line::bias,
+				 ::gpiod_line_config_set_bias_override>(this->_m_priv->config.get(),
+									bias, offset, bias_mapping);
+}
+
+GPIOD_CXX_API line::bias line_config::bias_default(void) const
+{
+	return get_mapped_value_default<line::bias,
+					::gpiod_line_config_get_bias_default>(this->_m_priv->config.get(),
+									      reverse_bias_mapping);
+}
+
+GPIOD_CXX_API line::bias line_config::bias_offset(line::offset offset) const
+{
+	return get_mapped_value_offset<line::bias,
+				       ::gpiod_line_config_get_bias_offset>(this->_m_priv->config.get(),
+									    offset, reverse_bias_mapping);
+}
+
+GPIOD_CXX_API void line_config::clear_bias_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_bias_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::bias_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_bias_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_drive_default(line::drive drive)
+{
+	set_mapped_value_default<line::drive,
+				 ::gpiod_line_config_set_drive_default>(this->_m_priv->config.get(),
+									drive, drive_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_drive_override(line::drive drive, line::offset offset)
+{
+	set_mapped_value_override<line::drive,
+				  ::gpiod_line_config_set_drive_override>(this->_m_priv->config.get(),
+									  drive, offset, drive_mapping);
+}
+
+GPIOD_CXX_API line::drive line_config::drive_default(void) const
+{
+	return get_mapped_value_default<line::drive,
+					::gpiod_line_config_get_drive_default>(this->_m_priv->config.get(),
+									       reverse_drive_mapping);
+}
+
+GPIOD_CXX_API line::drive line_config::drive_offset(line::offset offset) const
+{
+	return get_mapped_value_offset<line::drive,
+				       ::gpiod_line_config_get_drive_offset>(this->_m_priv->config.get(),
+									     offset, reverse_drive_mapping);
+}
+
+GPIOD_CXX_API void line_config::clear_drive_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_drive_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::drive_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_drive_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_active_low_default(bool active_low) noexcept
+{
+	::gpiod_line_config_set_active_low_default(this->_m_priv->config.get(), active_low);
+}
+
+GPIOD_CXX_API void line_config::set_active_low_override(bool active_low, line::offset offset) noexcept
+{
+	::gpiod_line_config_set_active_low_override(this->_m_priv->config.get(), active_low, offset);
+}
+
+GPIOD_CXX_API bool line_config::active_low_default(void) const noexcept
+{
+	return ::gpiod_line_config_get_active_low_default(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API bool line_config::active_low_offset(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_get_active_low_offset(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::clear_active_low_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_active_low_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::active_low_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_active_low_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void
+line_config::set_debounce_period_default(const ::std::chrono::microseconds& period) noexcept
+{
+	::gpiod_line_config_set_debounce_period_us_default(this->_m_priv->config.get(), period.count());
+}
+
+GPIOD_CXX_API void
+line_config::set_debounce_period_override(const ::std::chrono::microseconds& period,
+					     line::offset offset) noexcept
+{
+	::gpiod_line_config_set_debounce_period_us_override(this->_m_priv->config.get(),
+							    period.count(), offset);
+}
+
+GPIOD_CXX_API ::std::chrono::microseconds line_config::debounce_period_default(void) const noexcept
+{
+	return ::std::chrono::microseconds(
+			::gpiod_line_config_get_debounce_period_us_default(this->_m_priv->config.get()));
+}
+
+GPIOD_CXX_API ::std::chrono::microseconds
+line_config::debounce_period_offset(line::offset offset) const noexcept
+{
+	return ::std::chrono::microseconds(
+			::gpiod_line_config_get_debounce_period_us_offset(this->_m_priv->config.get(),
+									  offset));
+}
+
+GPIOD_CXX_API void line_config::clear_debounce_period_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_debounce_period_us_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::debounce_period_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_debounce_period_us_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_event_clock_default(line::clock clock)
+{
+	set_mapped_value_default<line::clock,
+				 ::gpiod_line_config_set_event_clock_default>(this->_m_priv->config.get(),
+									      clock, clock_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_event_clock_override(line::clock clock, line::offset offset)
+{
+	set_mapped_value_override<line::clock,
+				  ::gpiod_line_config_set_event_clock_override>(this->_m_priv->config.get(),
+										clock, offset,
+										clock_mapping);
+}
+
+GPIOD_CXX_API line::clock line_config::event_clock_default(void) const
+{
+	return get_mapped_value_default<line::clock,
+					::gpiod_line_config_get_event_clock_default>(
+							this->_m_priv->config.get(),
+							reverse_clock_mapping);
+}
+
+GPIOD_CXX_API line::clock line_config::event_clock_offset(line::offset offset) const
+{
+	return get_mapped_value_offset<line::clock,
+					::gpiod_line_config_get_event_clock_offset>(
+							this->_m_priv->config.get(),
+							offset, reverse_clock_mapping);
+}
+
+GPIOD_CXX_API void line_config::clear_event_clock_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_event_clock_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::event_clock_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_event_clock_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_output_value_default(line::value value) noexcept
+{
+	::gpiod_line_config_set_output_value_default(this->_m_priv->config.get(), static_cast<int>(value));
+}
+
+GPIOD_CXX_API void line_config::set_output_value_override(line::value value, line::offset offset) noexcept
+{
+	::gpiod_line_config_set_output_value_override(this->_m_priv->config.get(),
+						      offset, static_cast<int>(value));
+}
+
+GPIOD_CXX_API void line_config::set_output_values(const line::value_mappings& values)
+{
+	line::offsets offsets;
+	line::values vals;
+
+	if (values.empty())
+		return;
+
+	offsets.reserve(values.size());
+	vals.reserve(values.size());
+
+	for (auto& val: values) {
+		offsets.push_back(val.first);
+		vals.push_back(val.second);
+	}
+
+	this->set_output_values(offsets, vals);
+}
+
+GPIOD_CXX_API void line_config::set_output_values(const line::offsets& offsets,
+						  const line::values& values)
+{
+	if (offsets.size() != values.size())
+		throw ::std::invalid_argument("values must have the same size as the offsets");
+
+	if (offsets.empty())
+		return;
+
+	::std::vector<unsigned int> buf(offsets.size());
+
+	for (unsigned int i = 0; i < offsets.size(); i++)
+		buf[i] = offsets[i];
+
+	::gpiod_line_config_set_output_values(this->_m_priv->config.get(),
+					      offsets.size(), buf.data(),
+					      reinterpret_cast<const int*>(values.data()));
+}
+
+GPIOD_CXX_API line::value line_config::output_value_default(void) const noexcept
+{
+	return static_cast<line::value>(::gpiod_line_config_get_output_value_default(
+								this->_m_priv->config.get()));
+}
+
+GPIOD_CXX_API line::value line_config::output_value_offset(line::offset offset) const noexcept
+{
+	return static_cast<line::value>(
+			::gpiod_line_config_get_output_value_offset(this->_m_priv->config.get(),
+								    offset));
+}
+
+GPIOD_CXX_API void line_config::clear_output_value_override(line::offset offset) noexcept
+{
+	::gpiod_line_config_clear_output_value_override(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API bool line_config::output_value_is_overridden(line::offset offset) const noexcept
+{
+	return ::gpiod_line_config_output_value_is_overridden(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API ::std::size_t line_config::num_overrides(void) const noexcept
+{
+	return ::gpiod_line_config_get_num_overrides(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API line_config::override_list line_config::overrides(void) const
+{
+	unsigned int num_overrides = this->num_overrides();
+	override_list ret(num_overrides);
+	::std::vector<unsigned int> offsets(num_overrides);
+	::std::vector<int> props(num_overrides);
+
+	::gpiod_line_config_get_overrides(this->_m_priv->config.get(), offsets.data(), props.data());
+
+	for (unsigned int i = 0; i < num_overrides; i++)
+		ret[i] = { offsets[i], property_mapping.at(props[i]) };
+
+	return ret;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_config& config)
+{
+	out << "line_config(defaults=(direction=" << config.direction_default() <<
+	       ", edge_detection=" << config.edge_detection_default() <<
+	       ", bias=" << config.bias_default() <<
+	       ", drive=" << config.drive_default() << ", " <<
+	       (config.active_low_default() ? "active-low" : "active-high") <<
+	       ", debounce_period=" << config.debounce_period_default().count() << "us" <<
+	       ", event_clock=" << config.event_clock_default() <<
+	       ", default_output_value=" << config.output_value_default() <<
+	       "), ";
+
+	if (config.num_overrides()) {
+		::std::vector<::std::string> overrides(config.num_overrides());
+		::std::vector<::std::string>::iterator it = overrides.begin();
+
+		out << "overrides=[";
+
+		for (const auto& override: config.overrides()) {
+			line::offset offset = override.first;
+			line_config::property prop = override.second;
+			::std::stringstream out;
+
+			out << "(offset=" << offset << " -> ";
+
+			switch (prop) {
+			case line_config::property::DIRECTION:
+				out << "direction=" << config.direction_offset(offset);
+				break;
+			case line_config::property::EDGE:
+				out << "edge_detection=" << config.edge_detection_offset(offset);
+				break;
+			case line_config::property::BIAS:
+				out << "bias=" << config.bias_offset(offset);
+				break;
+			case line_config::property::DRIVE:
+				out << "drive=" << config.drive_offset(offset);
+				break;
+			case line_config::property::ACTIVE_LOW:
+				out << (config.active_low_offset(offset) ? "active-low" : "active-high");
+				break;
+			case line_config::property::DEBOUNCE_PERIOD:
+				out << "debounce_period=" <<
+				       config.debounce_period_offset(offset).count() << "us";
+				break;
+			case line_config::property::EVENT_CLOCK:
+				out << "event_clock=" << config.event_clock_offset(offset);
+				break;
+			case line_config::property::OUTPUT_VALUE:
+				out << "output_value=" << config.output_value_offset(offset);
+				break;
+			default:
+				/* OUTPUT_VALUES is ignored. */
+				break;
+			}
+
+			out << ")";
+
+			*it = out.str();
+			it++;
+		}
+
+		::std::copy(overrides.begin(), ::std::prev(overrides.end()),
+			    ::std::ostream_iterator<::std::string>(out, ", "));
+		out << overrides.back();
+
+		out << "]";
+	}
+
+	out << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
new file mode 100644
index 0000000..bc7673d
--- /dev/null
+++ b/bindings/cxx/line-info.cpp
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <iostream>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<int, line::direction> direction_mapping = {
+	{ GPIOD_LINE_DIRECTION_INPUT,		line::direction::INPUT },
+	{ GPIOD_LINE_DIRECTION_OUTPUT,		line::direction::OUTPUT }
+};
+
+const ::std::map<int, line::bias> bias_mapping = {
+	{ GPIOD_LINE_BIAS_UNKNOWN,		line::bias::UNKNOWN },
+	{ GPIOD_LINE_BIAS_DISABLED,		line::bias::DISABLED },
+	{ GPIOD_LINE_BIAS_PULL_UP,		line::bias::PULL_UP },
+	{ GPIOD_LINE_BIAS_PULL_DOWN,		line::bias::PULL_DOWN }
+};
+
+const ::std::map<int, line::drive> drive_mapping = {
+	{ GPIOD_LINE_DRIVE_PUSH_PULL,		line::drive::PUSH_PULL },
+	{ GPIOD_LINE_DRIVE_OPEN_DRAIN,		line::drive::OPEN_DRAIN },
+	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,		line::drive::OPEN_SOURCE }
+};
+
+const ::std::map<int, line::edge> edge_mapping = {
+	{ GPIOD_LINE_EDGE_NONE,			line::edge::NONE },
+	{ GPIOD_LINE_EDGE_RISING,		line::edge::RISING },
+	{ GPIOD_LINE_EDGE_FALLING,		line::edge::FALLING },
+	{ GPIOD_LINE_EDGE_BOTH,			line::edge::BOTH }
+};
+
+const ::std::map<int, line::clock> clock_mapping = {
+	{ GPIOD_LINE_EVENT_CLOCK_MONOTONIC,	line::clock::MONOTONIC },
+	{ GPIOD_LINE_EVENT_CLOCK_REALTIME,	line::clock::REALTIME }
+};
+
+} /* namespace */
+
+void line_info::impl::set_info_ptr(line_info_ptr& new_info)
+{
+	this->info = ::std::move(new_info);
+}
+
+line_info::line_info(void)
+	: _m_priv(new impl)
+{
+
+}
+
+GPIOD_CXX_API line_info::line_info(const line_info& other) noexcept
+	: _m_priv(other._m_priv)
+{
+
+}
+
+GPIOD_CXX_API line_info::line_info(line_info&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API line_info::~line_info(void)
+{
+
+}
+
+GPIOD_CXX_API line_info& line_info::operator=(const line_info& other) noexcept
+{
+	this->_m_priv = other._m_priv;
+
+	return *this;
+}
+
+GPIOD_CXX_API line_info& line_info::operator=(line_info&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API line::offset line_info::offset(void) const noexcept
+{
+	return ::gpiod_line_info_get_offset(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::string line_info::name(void) const noexcept
+{
+	const char* name = ::gpiod_line_info_get_name(this->_m_priv->info.get());
+
+	return name ?: "";
+}
+
+GPIOD_CXX_API bool line_info::used(void) const noexcept
+{
+	return ::gpiod_line_info_is_used(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::string line_info::consumer(void) const noexcept
+{
+	const char* consumer = ::gpiod_line_info_get_consumer(this->_m_priv->info.get());
+
+	return consumer ?: "";
+}
+
+GPIOD_CXX_API line::direction line_info::direction(void) const
+{
+	int direction = ::gpiod_line_info_get_direction(this->_m_priv->info.get());
+
+	return map_int_to_enum(direction, direction_mapping);
+}
+
+GPIOD_CXX_API bool line_info::active_low(void) const noexcept
+{
+	return ::gpiod_line_info_is_active_low(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API line::bias line_info::bias(void) const
+{
+	int bias = ::gpiod_line_info_get_bias(this->_m_priv->info.get());
+
+	return bias_mapping.at(bias);
+}
+
+GPIOD_CXX_API line::drive line_info::drive(void) const
+{
+	int drive = ::gpiod_line_info_get_drive(this->_m_priv->info.get());
+
+	return drive_mapping.at(drive);
+}
+
+GPIOD_CXX_API line::edge line_info::edge_detection(void) const
+{
+	int edge = ::gpiod_line_info_get_edge_detection(this->_m_priv->info.get());
+
+	return edge_mapping.at(edge);
+}
+
+GPIOD_CXX_API line::clock line_info::event_clock(void) const
+{
+	int clock = ::gpiod_line_info_get_event_clock(this->_m_priv->info.get());
+
+	return clock_mapping.at(clock);
+}
+
+GPIOD_CXX_API bool line_info::debounced(void) const  noexcept
+{
+	return ::gpiod_line_info_is_debounced(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::chrono::microseconds line_info::debounce_period(void) const  noexcept
+{
+	return ::std::chrono::microseconds(
+			::gpiod_line_info_get_debounce_period_us(this->_m_priv->info.get()));
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_info& info)
+{
+	::std::string name, consumer;
+
+	name = info.name().empty() ? "unnamed" : ::std::string("'") + info.name() + "'";
+	consumer = info.consumer().empty() ? "unused" : ::std::string("'") + info.name() + "'";
+
+	out << "line_info(offset=" << info.offset() <<
+	       ", name=" << name <<
+	       ", used=" << ::std::boolalpha << info.used() <<
+	       ", consumer=" << consumer <<
+	       ", direction=" << info.direction() <<
+	       ", active_low=" << ::std::boolalpha << info.active_low() <<
+	       ", bias=" << info.bias() <<
+	       ", drive=" << info.drive() <<
+	       ", edge_detection=" << info.edge_detection() <<
+	       ", event_clock=" << info.event_clock() <<
+	       ", debounced=" << ::std::boolalpha << info.debounced();
+
+	if (info.debounced())
+		out << ", debounce_period=" << info.debounce_period().count() << "us";
+
+	out << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
new file mode 100644
index 0000000..8574e68
--- /dev/null
+++ b/bindings/cxx/line-request.cpp
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <iterator>
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+void line_request::impl::throw_if_released(void) const
+{
+	if (!this->request)
+		throw request_released("GPIO lines have been released");
+}
+
+void line_request::impl::set_request_ptr(line_request_ptr& ptr)
+{
+	this->request = ::std::move(ptr);
+	this->offset_buf.resize(::gpiod_line_request_get_num_lines(this->request.get()));
+}
+
+void line_request::impl::fill_offset_buf(const line::offsets& offsets)
+{
+	for (unsigned int i = 0; i < offsets.size(); i++)
+		this->offset_buf[i] = offsets[i];
+}
+
+line_request::line_request(void)
+	: _m_priv(new impl)
+{
+
+}
+
+GPIOD_CXX_API line_request::line_request(line_request&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API line_request::~line_request(void)
+{
+
+}
+
+GPIOD_CXX_API line_request& line_request::operator=(line_request&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API line_request::operator bool(void) const noexcept
+{
+	return this->_m_priv->request.get() != nullptr;
+}
+
+GPIOD_CXX_API void line_request::release(void)
+{
+	this->_m_priv->throw_if_released();
+
+	this->_m_priv->request.reset();
+}
+
+GPIOD_CXX_API ::std::size_t line_request::num_lines(void) const
+{
+	this->_m_priv->throw_if_released();
+
+	return ::gpiod_line_request_get_num_lines(this->_m_priv->request.get());
+}
+
+GPIOD_CXX_API line::offsets line_request::offsets(void) const
+{
+	this->_m_priv->throw_if_released();
+
+	::std::vector<unsigned int> buf(this->num_lines());
+	line::offsets offsets(this->num_lines());
+
+	::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
+
+	for (unsigned int i = 0; i < this->num_lines(); i++)
+		offsets[i] = buf[i];
+
+	return offsets;
+}
+
+GPIOD_CXX_API line::value line_request::get_value(line::offset offset)
+{
+	return this->get_values({ offset }).front();
+}
+
+GPIOD_CXX_API line::values
+line_request::get_values(const line::offsets& offsets)
+{
+	line::values vals(offsets.size());
+
+	this->get_values(offsets, vals);
+
+	return vals;
+}
+
+GPIOD_CXX_API line::values line_request::get_values(void)
+{
+	return this->get_values(this->offsets());
+}
+
+GPIOD_CXX_API void line_request::get_values(const line::offsets& offsets, line::values& values)
+{
+	this->_m_priv->throw_if_released();
+
+	if (offsets.size() != values.size())
+		throw ::std::invalid_argument("values must have the same size as the offsets");
+
+	this->_m_priv->fill_offset_buf(offsets);
+
+	int ret = ::gpiod_line_request_get_values_subset(this->_m_priv->request.get(),
+							 offsets.size(), this->_m_priv->offset_buf.data(),
+							 reinterpret_cast<int*>(values.data()));
+	if (ret)
+		throw_from_errno("unable to retrieve line values");
+}
+
+GPIOD_CXX_API void line_request::get_values(line::values& values)
+{
+	this->get_values(this->offsets(), values);
+}
+
+GPIOD_CXX_API void line_request::line_request::set_value(line::offset offset, line::value value)
+{
+	this->set_values({ offset }, { value });
+}
+
+GPIOD_CXX_API void
+line_request::set_values(const line::value_mappings& values)
+{
+	line::offsets offsets(values.size());
+	line::values vals(values.size());
+
+	for (unsigned int i = 0; i < values.size(); i++) {
+		offsets[i] = values[i].first;
+		vals[i] = values[i].second;
+	}
+
+	this->set_values(offsets, vals);
+}
+
+GPIOD_CXX_API void line_request::set_values(const line::offsets& offsets,
+					    const line::values& values)
+{
+	this->_m_priv->throw_if_released();
+
+	if (offsets.size() != values.size())
+		throw ::std::invalid_argument("values must have the same size as the offsets");
+
+	this->_m_priv->fill_offset_buf(offsets);
+
+	int ret = ::gpiod_line_request_set_values_subset(this->_m_priv->request.get(),
+							 offsets.size(), this->_m_priv->offset_buf.data(),
+							 reinterpret_cast<const int*>(values.data()));
+	if (ret)
+		throw_from_errno("unable to set line values");
+}
+
+GPIOD_CXX_API void line_request::set_values(const line::values& values)
+{
+	this->set_values(this->offsets(), values);
+}
+
+GPIOD_CXX_API void line_request::reconfigure_lines(const line_config& config)
+{
+	this->_m_priv->throw_if_released();
+
+	int ret = ::gpiod_line_request_reconfigure_lines(this->_m_priv->request.get(),
+							 config._m_priv->config.get());
+	if (ret)
+		throw_from_errno("unable to reconfigure GPIO lines");
+}
+
+GPIOD_CXX_API int line_request::fd(void) const
+{
+	this->_m_priv->throw_if_released();
+
+	return ::gpiod_line_request_get_fd(this->_m_priv->request.get());
+}
+
+GPIOD_CXX_API bool line_request::wait_edge_event(const ::std::chrono::nanoseconds& timeout) const
+{
+	this->_m_priv->throw_if_released();
+
+	int ret = ::gpiod_line_request_wait_edge_event(this->_m_priv->request.get(),
+						       timeout.count());
+	if (ret < 0)
+		throw_from_errno("error waiting for edge events");
+
+	return ret;
+}
+
+GPIOD_CXX_API ::std::size_t line_request::read_edge_event(edge_event_buffer& buffer)
+{
+	return this->read_edge_event(buffer, buffer.capacity());
+}
+
+GPIOD_CXX_API ::std::size_t
+line_request::read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events)
+{
+	this->_m_priv->throw_if_released();
+
+	return buffer._m_priv->read_events(this->_m_priv->request, max_events);
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_request& request)
+{
+	if (!request)
+		out << "line_request(released)";
+	else
+		out << "line_request(num_lines=" << request.num_lines() <<
+		       ", line_offsets=[" << request.offsets() <<
+		       "], fd=" << request.fd() <<
+		       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index cfcf2fb..bbeb5aa 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -1,321 +1,128 @@
 // SPDX-License-Identifier: LGPL-3.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <gpiod.hpp>
-#include <array>
-#include <map>
-#include <system_error>
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include "internal.hpp"
 
 namespace gpiod {
+namespace line {
 
 namespace {
 
-const ::std::map<int, int> drive_mapping = {
-	{ GPIOD_LINE_DRIVE_PUSH_PULL,	line::DRIVE_PUSH_PULL, },
-	{ GPIOD_LINE_DRIVE_OPEN_DRAIN,	line::DRIVE_OPEN_DRAIN, },
-	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,	line::DRIVE_OPEN_SOURCE, },
+const ::std::map<line::value, ::std::string> value_names = {
+	{ line::value::INACTIVE,	"INACTIVE" },
+	{ line::value::ACTIVE,		"ACTIVE" }
 };
 
-const ::std::map<int, int> bias_mapping = {
-	{ GPIOD_LINE_BIAS_UNKNOWN,	line::BIAS_UNKNOWN, },
-	{ GPIOD_LINE_BIAS_DISABLED,	line::BIAS_DISABLED, },
-	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
-	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
+const ::std::map<line::direction, ::std::string> direction_names = {
+	{ line::direction::AS_IS,	"AS_IS" },
+	{ line::direction::INPUT,	"INPUT" },
+	{ line::direction::OUTPUT,	"OUTPUT" }
 };
 
-} /* namespace */
-
-GPIOD_CXX_API line::line(void)
-	: _m_line(nullptr),
-	  _m_owner()
-{
-
-}
-
-GPIOD_CXX_API line::line(::gpiod_line* line, const chip& owner)
-	: _m_line(line),
-	  _m_owner(owner._m_chip)
-{
-
-}
-
-GPIOD_CXX_API unsigned int line::offset(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return ::gpiod_line_offset(this->_m_line);
-}
-
-GPIOD_CXX_API ::std::string line::name(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	const char* name = ::gpiod_line_name(this->_m_line);
-
-	return name ? ::std::string(name) : ::std::string();
-}
-
-GPIOD_CXX_API ::std::string line::consumer(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	const char* consumer = ::gpiod_line_consumer(this->_m_line);
-
-	return consumer ? ::std::string(consumer) : ::std::string();
-}
-
-GPIOD_CXX_API int line::direction(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	int dir = ::gpiod_line_direction(this->_m_line);
-
-	return dir == GPIOD_LINE_DIRECTION_INPUT ? DIRECTION_INPUT : DIRECTION_OUTPUT;
-}
-
-GPIOD_CXX_API bool line::is_active_low(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return ::gpiod_line_is_active_low(this->_m_line);
-}
-
-GPIOD_CXX_API int line::bias(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return bias_mapping.at(::gpiod_line_bias(this->_m_line));
-}
-
-GPIOD_CXX_API bool line::is_used(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return ::gpiod_line_is_used(this->_m_line);
-}
-
-GPIOD_CXX_API int line::drive(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	return drive_mapping.at(::gpiod_line_drive(this->_m_line));
-}
-
-GPIOD_CXX_API void line::request(const line_request& config, int default_val) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	bulk.request(config, { default_val });
-}
-
-GPIOD_CXX_API void line::release(void) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	bulk.release();
-}
-
-/*
- * REVISIT: Check the performance of get/set_value & event_wait compared to
- * the C API. Creating a line_bulk object involves a memory allocation every
- * time this method if called. If the performance is significantly lower,
- * switch to calling the C functions for setting/getting line values and
- * polling for events on single lines directly.
- */
-
-GPIOD_CXX_API int line::get_value(void) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	return bulk.get_values()[0];
-}
-
-GPIOD_CXX_API void line::set_value(int val) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	bulk.set_values({ val });
-}
-
-GPIOD_CXX_API void line::set_config(int direction, ::std::bitset<32> flags,
-				    int value) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	bulk.set_config(direction, flags, { value });
-}
-
-GPIOD_CXX_API void line::set_flags(::std::bitset<32> flags) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
+const ::std::map<line::bias, ::std::string> bias_names = {
+	{ line::bias::AS_IS,		"AS_IS" },
+	{ line::bias::UNKNOWN,		"UNKNOWN" },
+	{ line::bias::DISABLED,		"DISABLED" },
+	{ line::bias::PULL_UP,		"PULL_UP" },
+	{ line::bias::PULL_DOWN,	"PULL_DOWN" }
+};
 
-	bulk.set_flags(flags);
-}
+const ::std::map<line::drive, ::std::string> drive_names = {
+	{ line::drive::PUSH_PULL,	"PUSH/PULL" },
+	{ line::drive::OPEN_DRAIN,	"OPEN_DRAIN" },
+	{ line::drive::OPEN_SOURCE,	"OPEN_SOURCE" }
+};
 
-GPIOD_CXX_API void line::set_direction_input() const
-{
-	this->throw_if_null();
+const ::std::map<line::edge, ::std::string> edge_names = {
+	{ line::edge::NONE,		"NONE" },
+	{ line::edge::RISING,		"RISING_EDGE" },
+	{ line::edge::FALLING,		"FALLING_EDGE" },
+	{ line::edge::BOTH,		"BOTH_EDGES" }
+};
 
-	line_bulk bulk({ *this });
+const ::std::map<line::clock, ::std::string> clock_names = {
+	{ line::clock::MONOTONIC,	"MONOTONIC" },
+	{ line::clock::REALTIME,	"REALTIME" }
+};
 
-	bulk.set_direction_input();
-}
+} /* namespace */
 
-GPIOD_CXX_API void line::set_direction_output(int value) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::value val)
 {
-	this->throw_if_null();
+	out << value_names.at(val);
 
-	line_bulk bulk({ *this });
-
-	bulk.set_direction_output({ value });
+	return out;
 }
 
-GPIOD_CXX_API bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::direction dir)
 {
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	line_bulk event_bulk = bulk.event_wait(timeout);
+	out << direction_names.at(dir);
 
-	return !!event_bulk;
+	return out;
 }
 
-GPIOD_CXX_API line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::edge edge)
 {
-	line_event ret;
+	out << edge_names.at(edge);
 
-	if (event.event_type == GPIOD_LINE_EVENT_RISING_EDGE)
-		ret.event_type = line_event::RISING_EDGE;
-	else if (event.event_type == GPIOD_LINE_EVENT_FALLING_EDGE)
-		ret.event_type = line_event::FALLING_EDGE;
-
-	ret.timestamp = ::std::chrono::duration_cast<::std::chrono::nanoseconds>(
-				::std::chrono::seconds(event.ts.tv_sec)) +
-				::std::chrono::nanoseconds(event.ts.tv_nsec);
-
-	ret.source = *this;
-
-	return ret;
+	return out;
 }
 
-GPIOD_CXX_API line_event line::event_read(void) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::bias bias)
 {
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
+	out << bias_names.at(bias);
 
-	::gpiod_line_event event_buf;
-	line_event event;
-	int rv;
-
-	rv = ::gpiod_line_event_read(this->_m_line, ::std::addressof(event_buf));
-	if (rv < 0)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error reading line event");
-
-	return this->make_line_event(event_buf);
+	return out;
 }
 
-GPIOD_CXX_API ::std::vector<line_event> line::event_read_multiple(void) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::drive drive)
 {
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	/* 16 is the maximum number of events stored in the kernel FIFO. */
-	::std::array<::gpiod_line_event, 16> event_buf;
-	::std::vector<line_event> events;
-	int rv;
+	out << drive_names.at(drive);
 
-	rv = ::gpiod_line_event_read_multiple(this->_m_line,
-					      event_buf.data(), event_buf.size());
-	if (rv < 0)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error reading multiple line events");
-
-	events.reserve(rv);
-	for (int i = 0; i < rv; i++)
-		events.push_back(this->make_line_event(event_buf[i]));
-
-	return events;
+	return out;
 }
 
-GPIOD_CXX_API int line::event_get_fd(void) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::clock clock)
 {
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	int ret = ::gpiod_line_event_get_fd(this->_m_line);
-
-	if (ret < 0)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to get the line event file descriptor");
-
-	return ret;
-}
+	out << clock_names.at(clock);
 
-GPIOD_CXX_API const chip line::get_chip(void) const
-{
-	return chip(this->_m_owner);
+	return out;
 }
 
-GPIOD_CXX_API void line::reset(void)
+template<typename T>
+::std::ostream& insert_vector(::std::ostream& out,
+			      const ::std::string& name, const ::std::vector<T>& vec)
 {
-	this->_m_line = nullptr;
-	this->_m_owner.reset();
-}
+	out << name << "([";
+	::std::copy(vec.begin(), ::std::prev(vec.end()),
+		    ::std::ostream_iterator<T>(out, ", "));
+	out << vec.back();
+	out << "])";
 
-GPIOD_CXX_API bool line::operator==(const line& rhs) const noexcept
-{
-	return this->_m_line == rhs._m_line;
+	return out;
 }
 
-GPIOD_CXX_API bool line::operator!=(const line& rhs) const noexcept
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const offsets& offs)
 {
-	return this->_m_line != rhs._m_line;
+	return insert_vector(out, "offsets", offs);
 }
 
-GPIOD_CXX_API line::operator bool(void) const noexcept
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line::values& vals)
 {
-	return this->_m_line != nullptr;
+	return insert_vector(out, "values", vals);
 }
 
-GPIOD_CXX_API bool line::operator!(void) const noexcept
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line::value_mapping& mapping)
 {
-	return this->_m_line == nullptr;
-}
+	out << "(" << mapping.first << ", " << mapping.second << ")";
 
-GPIOD_CXX_API void line::throw_if_null(void) const
-{
-	if (!this->_m_line)
-		throw ::std::logic_error("object not holding a GPIO line handle");
+	return out;
 }
 
-GPIOD_CXX_API line::chip_guard::chip_guard(const line& line)
-	: _m_chip(line._m_owner)
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line::value_mappings& mappings)
 {
-
+	return insert_vector(out, "value_mappings", mappings);
 }
 
+} /* namespace line */
 } /* namespace gpiod */
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
deleted file mode 100644
index a9261c0..0000000
--- a/bindings/cxx/line_bulk.cpp
+++ /dev/null
@@ -1,366 +0,0 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <gpiod.hpp>
-#include <map>
-#include <system_error>
-
-#include "internal.hpp"
-
-namespace gpiod {
-
-GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
-GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
-GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
-GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_BIAS_DISABLED(GPIOD_BIT(3));
-GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_BIAS_PULL_DOWN(GPIOD_BIT(4));
-GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_BIAS_PULL_UP(GPIOD_BIT(5));
-
-namespace {
-
-const ::std::map<int, int> reqtype_mapping = {
-	{ line_request::DIRECTION_AS_IS,	GPIOD_LINE_REQUEST_DIRECTION_AS_IS, },
-	{ line_request::DIRECTION_INPUT,	GPIOD_LINE_REQUEST_DIRECTION_INPUT, },
-	{ line_request::DIRECTION_OUTPUT,	GPIOD_LINE_REQUEST_DIRECTION_OUTPUT, },
-	{ line_request::EVENT_FALLING_EDGE,	GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE, },
-	{ line_request::EVENT_RISING_EDGE,	GPIOD_LINE_REQUEST_EVENT_RISING_EDGE, },
-	{ line_request::EVENT_BOTH_EDGES,	GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES, },
-};
-
-struct bitset_cmp
-{
-	bool operator()(const ::std::bitset<32>& lhs, const ::std::bitset<32>& rhs) const
-	{
-		return lhs.to_ulong() < rhs.to_ulong();
-	}
-};
-
-const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
-	{ line_request::FLAG_ACTIVE_LOW,	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, },
-	{ line_request::FLAG_OPEN_DRAIN,	GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN, },
-	{ line_request::FLAG_OPEN_SOURCE,	GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE, },
-	{ line_request::FLAG_BIAS_DISABLED,	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLED, },
-	{ line_request::FLAG_BIAS_PULL_DOWN,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN, },
-	{ line_request::FLAG_BIAS_PULL_UP,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP, },
-};
-
-} /* namespace */
-
-GPIOD_CXX_API const unsigned int line_bulk::MAX_LINES = 64;
-
-GPIOD_CXX_API line_bulk::line_bulk(const ::std::vector<line>& lines)
-	: _m_bulk()
-{
-	this->_m_bulk.reserve(lines.size());
-
-	for (auto& it: lines)
-		this->append(it);
-}
-
-GPIOD_CXX_API void line_bulk::append(const line& new_line)
-{
-	if (!new_line)
-		throw ::std::logic_error("line_bulk cannot hold empty line objects");
-
-	if (this->_m_bulk.size() >= MAX_LINES)
-		throw ::std::logic_error("maximum number of lines reached");
-
-	if (this->_m_bulk.size() >= 1 && this->_m_bulk.begin()->get_chip() != new_line.get_chip())
-		throw ::std::logic_error("line_bulk cannot hold GPIO lines from different chips");
-
-	this->_m_bulk.push_back(new_line);
-}
-
-GPIOD_CXX_API line& line_bulk::get(unsigned int index)
-{
-	return this->_m_bulk.at(index);
-}
-
-GPIOD_CXX_API line& line_bulk::operator[](unsigned int index)
-{
-	return this->_m_bulk[index];
-}
-
-GPIOD_CXX_API unsigned int line_bulk::size(void) const noexcept
-{
-	return this->_m_bulk.size();
-}
-
-GPIOD_CXX_API bool line_bulk::empty(void) const noexcept
-{
-	return this->_m_bulk.empty();
-}
-
-GPIOD_CXX_API void line_bulk::clear(void)
-{
-	this->_m_bulk.clear();
-}
-
-GPIOD_CXX_API void line_bulk::request(const line_request& config, const ::std::vector<int> default_vals) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	if (!default_vals.empty() && this->size() != default_vals.size())
-		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
-
-	::gpiod_line_request_config conf;
-	auto bulk = this->to_line_bulk();
-	int rv;
-
-	conf.consumer = config.consumer.c_str();
-	conf.request_type = reqtype_mapping.at(config.request_type);
-	conf.flags = 0;
-
-	for (auto& it: reqflag_mapping) {
-		if ((it.first & config.flags).to_ulong())
-			conf.flags |= it.second;
-	}
-
-	rv = ::gpiod_line_request_bulk(bulk.get(),
-				       ::std::addressof(conf),
-				       default_vals.empty() ? NULL : default_vals.data());
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error requesting GPIO lines");
-}
-
-GPIOD_CXX_API void line_bulk::release(void) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	auto bulk = this->to_line_bulk();
-
-	::gpiod_line_release_bulk(bulk.get());
-}
-
-GPIOD_CXX_API ::std::vector<int> line_bulk::get_values(void) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	auto bulk = this->to_line_bulk();
-	::std::vector<int> values;
-	int rv;
-
-	values.resize(this->_m_bulk.size());
-
-	rv = ::gpiod_line_get_value_bulk(bulk.get(), values.data());
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error reading GPIO line values");
-
-	return values;
-}
-
-GPIOD_CXX_API void line_bulk::set_values(const ::std::vector<int>& values) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	if (values.size() != this->_m_bulk.size())
-		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
-
-	auto bulk = this->to_line_bulk();
-	int rv;
-
-	rv = ::gpiod_line_set_value_bulk(bulk.get(), values.data());
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error setting GPIO line values");
-}
-
-GPIOD_CXX_API void line_bulk::set_config(int direction, ::std::bitset<32> flags,
-					 const ::std::vector<int> values) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	if (!values.empty() && this->_m_bulk.size() != values.size())
-		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
-
-	auto bulk = this->to_line_bulk();
-	int rv, gflags;
-
-	gflags = 0;
-
-	for (auto& it: reqflag_mapping) {
-		if ((it.first & flags).to_ulong())
-			gflags |= it.second;
-	}
-
-	rv = ::gpiod_line_set_config_bulk(bulk.get(), direction,
-					  gflags, values.data());
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error setting GPIO line config");
-}
-
-GPIOD_CXX_API void line_bulk::set_flags(::std::bitset<32> flags) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	auto bulk = this->to_line_bulk();
-	int rv, gflags;
-
-	gflags = 0;
-
-	for (auto& it: reqflag_mapping) {
-		if ((it.first & flags).to_ulong())
-			gflags |= it.second;
-	}
-
-	rv = ::gpiod_line_set_flags_bulk(bulk.get(), gflags);
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error setting GPIO line flags");
-}
-
-GPIOD_CXX_API void line_bulk::set_direction_input() const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	auto bulk = this->to_line_bulk();
-	int rv;
-
-	rv = ::gpiod_line_set_direction_input_bulk(bulk.get());
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-			"error setting GPIO line direction to input");
-}
-
-GPIOD_CXX_API void line_bulk::set_direction_output(const ::std::vector<int>& values) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	if (values.size() != this->_m_bulk.size())
-		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
-
-	auto bulk = this->to_line_bulk();
-	int rv;
-
-	rv = ::gpiod_line_set_direction_output_bulk(bulk.get(), values.data());
-	if (rv)
-		throw ::std::system_error(errno, ::std::system_category(),
-			"error setting GPIO line direction to output");
-}
-
-GPIOD_CXX_API line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
-{
-	this->throw_if_empty();
-	line::chip_guard lock_chip(this->_m_bulk.front());
-
-	auto ev_bulk = this->make_line_bulk_ptr();
-	auto bulk = this->to_line_bulk();
-	::timespec ts;
-	line_bulk ret;
-	int rv;
-
-	ts.tv_sec = timeout.count() / 1000000000ULL;
-	ts.tv_nsec = timeout.count() % 1000000000ULL;
-
-	rv = ::gpiod_line_event_wait_bulk(bulk.get(), ::std::addressof(ts), ev_bulk.get());
-	if (rv < 0) {
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error polling for events");
-	} else if (rv > 0) {
-		auto chip = this->_m_bulk[0].get_chip();
-		auto num_lines = ::gpiod_line_bulk_num_lines(ev_bulk.get());
-
-		for (unsigned int i = 0; i < num_lines; i++)
-			ret.append(line(::gpiod_line_bulk_get_line(ev_bulk.get(), i), chip));
-	}
-
-	return ret;
-}
-
-GPIOD_CXX_API line_bulk::operator bool(void) const noexcept
-{
-	return !this->_m_bulk.empty();
-}
-
-GPIOD_CXX_API bool line_bulk::operator!(void) const noexcept
-{
-	return this->_m_bulk.empty();
-}
-
-GPIOD_CXX_API line_bulk::iterator::iterator(const ::std::vector<line>::iterator& it)
-	: _m_iter(it)
-{
-
-}
-
-GPIOD_CXX_API line_bulk::iterator& line_bulk::iterator::operator++(void)
-{
-	this->_m_iter++;
-
-	return *this;
-}
-
-GPIOD_CXX_API const line& line_bulk::iterator::operator*(void) const
-{
-	return *this->_m_iter;
-}
-
-GPIOD_CXX_API const line* line_bulk::iterator::operator->(void) const
-{
-	return this->_m_iter.operator->();
-}
-
-GPIOD_CXX_API bool line_bulk::iterator::operator==(const iterator& rhs) const noexcept
-{
-	return this->_m_iter == rhs._m_iter;
-}
-
-GPIOD_CXX_API bool line_bulk::iterator::operator!=(const iterator& rhs) const noexcept
-{
-	return this->_m_iter != rhs._m_iter;
-}
-
-GPIOD_CXX_API line_bulk::iterator line_bulk::begin(void) noexcept
-{
-	return line_bulk::iterator(this->_m_bulk.begin());
-}
-
-GPIOD_CXX_API line_bulk::iterator line_bulk::end(void) noexcept
-{
-	return line_bulk::iterator(this->_m_bulk.end());
-}
-
-GPIOD_CXX_API void line_bulk::throw_if_empty(void) const
-{
-	if (this->_m_bulk.empty())
-		throw ::std::logic_error("line_bulk not holding any GPIO lines");
-}
-
-GPIOD_CXX_API line_bulk::line_bulk_ptr line_bulk::make_line_bulk_ptr(void) const
-{
-	line_bulk_ptr bulk(::gpiod_line_bulk_new(this->size()));
-
-	if (!bulk)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to allocate new bulk object");
-
-	return bulk;
-}
-
-GPIOD_CXX_API line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
-{
-	line_bulk_ptr bulk = this->make_line_bulk_ptr();
-
-	for (auto& it: this->_m_bulk)
-		::gpiod_line_bulk_add_line(bulk.get(), it._m_line);
-
-	return bulk;
-}
-
-GPIOD_CXX_API void line_bulk::line_bulk_deleter::operator()(::gpiod_line_bulk *bulk)
-{
-	::gpiod_line_bulk_free(bulk);
-}
-
-} /* namespace gpiod */
diff --git a/bindings/cxx/misc.cpp b/bindings/cxx/misc.cpp
new file mode 100644
index 0000000..237cd14
--- /dev/null
+++ b/bindings/cxx/misc.cpp
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+GPIOD_CXX_API bool is_gpiochip_device(const ::std::filesystem::path& path)
+{
+	return ::gpiod_is_gpiochip_device(path.c_str());
+}
+
+GPIOD_CXX_API const ::std::string& version_string(void)
+{
+	static const ::std::string version(::gpiod_version_string());
+
+	return version;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/request-config.cpp b/bindings/cxx/request-config.cpp
new file mode 100644
index 0000000..2491cd9
--- /dev/null
+++ b/bindings/cxx/request-config.cpp
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+GPIOD_CXX_NORETURN void throw_bad_value_type(void)
+{
+	throw ::std::invalid_argument("bad value type for property");
+}
+
+request_config_ptr make_request_config(void)
+{
+	request_config_ptr config(::gpiod_request_config_new());
+	if (!config)
+		throw_from_errno("Unable to allocate the request config object");
+
+	return config;
+}
+
+::std::string get_string_from_value(const ::std::any& val)
+{
+	if (val.type() == typeid(::std::string))
+		return ::std::any_cast<::std::string>(val);
+	else if (val.type() == typeid(const char*))
+		return ::std::any_cast<const char*>(val);
+
+	throw_bad_value_type();
+}
+
+unsigned int get_unsigned_int_from_value(const ::std::any& val)
+{
+	if (val.type() == typeid(unsigned int)) {
+		return ::std::any_cast<unsigned int>(val);
+	} else if (val.type() == typeid(int)) {
+		int bufsize = ::std::any_cast<int>(val);
+		if (bufsize < 0)
+			bufsize = 0;
+
+		return static_cast<unsigned int>(bufsize);
+	}
+
+	throw_bad_value_type();
+}
+
+} /* namespace */
+
+request_config::impl::impl(void)
+	: config(make_request_config())
+{
+
+}
+
+GPIOD_CXX_API request_config::request_config(const properties& props)
+	: _m_priv(new impl)
+{
+	for (const auto& prop: props)
+		this->set_property(prop.first, prop.second);
+}
+
+GPIOD_CXX_API request_config::request_config(request_config&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API request_config::~request_config(void)
+{
+
+}
+
+GPIOD_CXX_API request_config& request_config::operator=(request_config&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API void request_config::set_property(property prop, const ::std::any& val)
+{
+	switch (prop) {
+	case property::OFFSETS:
+		try {
+			this->set_offsets(::std::any_cast<line::offsets>(val));
+		} catch (const ::std::bad_any_cast& ex) {
+			throw_bad_value_type();
+		}
+		break;
+	case property::CONSUMER:
+		this->set_consumer(get_string_from_value(val));
+		break;
+	case property::EVENT_BUFFER_SIZE:
+		this->set_event_buffer_size(get_unsigned_int_from_value(val));
+		break;
+	default:
+		throw ::std::invalid_argument("unknown property");
+	}
+}
+
+GPIOD_CXX_API void request_config::set_offsets(const line::offsets& offsets) noexcept
+{
+	::std::vector<unsigned int> buf(offsets.size());
+
+	for (unsigned int i = 0; i < offsets.size(); i++)
+		buf[i] = offsets[i];
+
+	::gpiod_request_config_set_offsets(this->_m_priv->config.get(),
+					   buf.size(), buf.data());
+}
+
+GPIOD_CXX_API ::std::size_t request_config::num_offsets(void) const noexcept
+{
+	return ::gpiod_request_config_get_num_offsets(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API void
+request_config::set_consumer(const ::std::string& consumer) noexcept
+{
+	::gpiod_request_config_set_consumer(this->_m_priv->config.get(), consumer.c_str());
+}
+
+GPIOD_CXX_API ::std::string request_config::consumer(void) const noexcept
+{
+	const char* consumer = ::gpiod_request_config_get_consumer(this->_m_priv->config.get());
+
+	return consumer ?: "";
+}
+
+GPIOD_CXX_API line::offsets request_config::offsets(void) const
+{
+	line::offsets ret(this->num_offsets());
+	::std::vector<unsigned int> buf(this->num_offsets());
+
+	::gpiod_request_config_get_offsets(this->_m_priv->config.get(), buf.data());
+
+	for (unsigned int i = 0; i < this->num_offsets(); i++)
+		ret[i] = buf[i];
+
+	return ret;
+}
+
+GPIOD_CXX_API void
+request_config::set_event_buffer_size(::std::size_t event_buffer_size) noexcept
+{
+	::gpiod_request_config_set_event_buffer_size(this->_m_priv->config.get(),
+						     event_buffer_size);
+}
+
+GPIOD_CXX_API ::std::size_t request_config::event_buffer_size(void) const noexcept
+{
+	return ::gpiod_request_config_get_event_buffer_size(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const request_config& config)
+{
+	::std::string consumer;
+
+	consumer = config.consumer().empty() ? "N/A" : ::std::string("'") + config.consumer() + "'";
+
+	out << "request_config(consumer=" << consumer <<
+	       ", num_offsets=" << config.num_offsets() <<
+	       ", offsets=(" << config.offsets() << ")" <<
+	       ", event_buffer_size=" << config.event_buffer_size() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index cbdecdc..5ca5f6f 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -2,20 +2,29 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
-AM_CPPFLAGS += -I$(top_srcdir)/tests/mockup/
-AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++11 $(CATCH2_CFLAGS)
+AM_CPPFLAGS += -I$(top_srcdir)/tests/gpiosim/
+AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
+AM_CPPFLAGS += $(PROFILING_CFLAGS)
 AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
-AM_LDFLAGS += -lgpiomockup -L$(top_builddir)/tests/mockup/
+AM_LDFLAGS += -lgpiosim -L$(top_builddir)/tests/gpiosim/
+AM_LDFLAGS += $(PROFILING_LDFLAGS)
 AM_LDFLAGS += -pthread
 
 bin_PROGRAMS = gpiod-cxx-test
 
 gpiod_cxx_test_SOURCES =			\
+		check-kernel.cpp		\
 		gpiod-cxx-test-main.cpp		\
-		gpiod-cxx-test.cpp		\
-		gpio-mockup.cpp			\
-		gpio-mockup.hpp			\
+		gpiosim.cpp			\
+		gpiosim.hpp			\
+		helpers.cpp			\
+		helpers.hpp			\
 		tests-chip.cpp			\
-		tests-event.cpp			\
-		tests-iter.cpp			\
-		tests-line.cpp
+		tests-chip-info.cpp		\
+		tests-edge-event.cpp		\
+		tests-line-config.cpp		\
+		tests-line-info.cpp		\
+		tests-line-request.cpp		\
+		tests-info-event.cpp		\
+		tests-misc.cpp			\
+		tests-request-config.cpp
diff --git a/bindings/cxx/tests/check-kernel.cpp b/bindings/cxx/tests/check-kernel.cpp
new file mode 100644
index 0000000..7ba00cc
--- /dev/null
+++ b/bindings/cxx/tests/check-kernel.cpp
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <linux/version.h>
+#include <sys/utsname.h>
+#include <system_error>
+#include <sstream>
+
+namespace {
+
+class kernel_checker
+{
+public:
+	kernel_checker(int major, int minor, int release)
+	{
+		int curr_major, curr_minor, curr_release, curr_ver, req_ver;
+		::std::string major_str, minor_str, release_str;
+		::utsname un;
+		int ret;
+
+		ret = ::uname(::std::addressof(un));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "unable to read the kernel version");
+
+		::std::stringstream ver_stream(::std::string(un.release));
+		::std::getline(ver_stream, major_str, '.');
+		::std::getline(ver_stream, minor_str, '.');
+		::std::getline(ver_stream, release_str, '-');
+
+		curr_major = ::std::stoi(major_str, nullptr, 0);
+		curr_minor = ::std::stoi(minor_str, nullptr, 0);
+		curr_release = ::std::stoi(release_str, nullptr, 0);
+
+		curr_ver = KERNEL_VERSION(curr_major, curr_minor, curr_release);
+		req_ver = KERNEL_VERSION(major, minor, release);
+
+		if (curr_ver < req_ver)
+			throw ::std::runtime_error("kernel release must be at least: " +
+						   ::std::to_string(major) + "." +
+						   ::std::to_string(minor) + "." +
+						   ::std::to_string(release));
+	}
+};
+
+kernel_checker require_kernel(5, 16, 0);
+
+} /* namespace */
diff --git a/bindings/cxx/tests/gpio-mockup.cpp b/bindings/cxx/tests/gpio-mockup.cpp
deleted file mode 100644
index 2e99dd4..0000000
--- a/bindings/cxx/tests/gpio-mockup.cpp
+++ /dev/null
@@ -1,153 +0,0 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <system_error>
-
-#include "gpio-mockup.hpp"
-
-namespace gpiod {
-namespace test {
-
-const ::std::bitset<32> mockup::FLAG_NAMED_LINES("1");
-
-mockup& mockup::instance(void)
-{
-	static mockup mockup;
-
-	return mockup;
-}
-
-mockup::mockup(void) : _m_mockup(::gpio_mockup_new())
-{
-	if (!this->_m_mockup)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to create the gpio-mockup context");
-}
-
-mockup::~mockup(void)
-{
-	::gpio_mockup_unref(this->_m_mockup);
-}
-
-void mockup::probe(const ::std::vector<unsigned int>& chip_sizes,
-		   const ::std::bitset<32>& flags)
-{
-	int ret, probe_flags = 0;
-
-	if (flags.to_ulong() & FLAG_NAMED_LINES.to_ulong())
-		probe_flags |= GPIO_MOCKUP_FLAG_NAMED_LINES;
-
-	ret = ::gpio_mockup_probe(this->_m_mockup, chip_sizes.size(),
-				  chip_sizes.data(), probe_flags);
-	if (ret)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to probe gpio-mockup module");
-}
-
-void mockup::remove(void)
-{
-	int ret = ::gpio_mockup_remove(this->_m_mockup);
-	if (ret)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to remove gpio-mockup module");
-}
-
-::std::string mockup::chip_name(unsigned int idx) const
-{
-	const char *name = ::gpio_mockup_chip_name(this->_m_mockup, idx);
-	if (!name)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to retrieve the chip name");
-
-	return ::std::string(name);
-}
-
-::std::string mockup::chip_path(unsigned int idx) const
-{
-	const char *path = ::gpio_mockup_chip_path(this->_m_mockup, idx);
-	if (!path)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to retrieve the chip path");
-
-	return ::std::string(path);
-}
-
-unsigned int mockup::chip_num(unsigned int idx) const
-{
-	int num = ::gpio_mockup_chip_num(this->_m_mockup, idx);
-	if (num < 0)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to retrieve the chip number");
-
-	return num;
-}
-
-int mockup::chip_get_value(unsigned int chip_idx, unsigned int line_offset)
-{
-	int val = ::gpio_mockup_get_value(this->_m_mockup, chip_idx, line_offset);
-	if (val < 0)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error reading the line value");
-
-	return val;
-}
-
-void mockup::chip_set_pull(unsigned int chip_idx, unsigned int line_offset, int pull)
-{
-	int ret = ::gpio_mockup_set_pull(this->_m_mockup, chip_idx, line_offset, pull);
-	if (ret)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error setting line pull");
-}
-
-mockup::probe_guard::probe_guard(const ::std::vector<unsigned int>& chip_sizes,
-				 const ::std::bitset<32>& flags)
-{
-	mockup::instance().probe(chip_sizes, flags);
-}
-
-mockup::probe_guard::~probe_guard(void)
-{
-	mockup::instance().remove();
-}
-
-mockup::event_thread::event_thread(unsigned int chip_index,
-				   unsigned int line_offset, unsigned int period_ms)
-	: _m_chip_index(chip_index),
-	  _m_line_offset(line_offset),
-	  _m_period_ms(period_ms),
-	  _m_stop(false),
-	  _m_mutex(),
-	  _m_cond(),
-	  _m_thread(&event_thread::event_worker, this)
-{
-
-}
-
-mockup::event_thread::~event_thread(void)
-{
-	::std::unique_lock<::std::mutex> lock(this->_m_mutex);
-	this->_m_stop = true;
-	this->_m_cond.notify_all();
-	lock.unlock();
-	this->_m_thread.join();
-}
-
-void mockup::event_thread::event_worker(void)
-{
-	for (unsigned int i = 0;; i++) {
-		::std::unique_lock<::std::mutex> lock(this->_m_mutex);
-
-		if (this->_m_stop)
-			break;
-
-		::std::cv_status status = this->_m_cond.wait_for(lock,
-						std::chrono::milliseconds(this->_m_period_ms));
-		if (status == ::std::cv_status::timeout)
-			mockup::instance().chip_set_pull(this->_m_chip_index,
-							 this->_m_line_offset, i % 2);
-	}
-}
-
-} /* namespace test */
-} /* namespace gpiod */
diff --git a/bindings/cxx/tests/gpio-mockup.hpp b/bindings/cxx/tests/gpio-mockup.hpp
deleted file mode 100644
index 9ca27bd..0000000
--- a/bindings/cxx/tests/gpio-mockup.hpp
+++ /dev/null
@@ -1,94 +0,0 @@
-/* SPDX-License-Identifier: LGPL-3.0-or-later */
-/* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
-
-#ifndef __GPIOD_CXX_TEST_HPP__
-#define __GPIOD_CXX_TEST_HPP__
-
-#include <bitset>
-#include <condition_variable>
-#include <gpio-mockup.h>
-#include <mutex>
-#include <string>
-#include <vector>
-#include <thread>
-
-namespace gpiod {
-namespace test {
-
-class mockup
-{
-public:
-
-	static mockup& instance(void);
-
-	mockup(const mockup& other) = delete;
-	mockup(mockup&& other) = delete;
-	mockup& operator=(const mockup& other) = delete;
-	mockup& operator=(mockup&& other) = delete;
-
-	void probe(const ::std::vector<unsigned int>& chip_sizes,
-		   const ::std::bitset<32>& flags = 0);
-	void remove(void);
-
-	std::string chip_name(unsigned int idx) const;
-	std::string chip_path(unsigned int idx) const;
-	unsigned int chip_num(unsigned int idx) const;
-
-	int chip_get_value(unsigned int chip_idx, unsigned int line_offset);
-	void chip_set_pull(unsigned int chip_idx, unsigned int line_offset, int pull);
-
-	static const ::std::bitset<32> FLAG_NAMED_LINES;
-
-	class probe_guard
-	{
-	public:
-
-		probe_guard(const ::std::vector<unsigned int>& chip_sizes,
-			    const ::std::bitset<32>& flags = 0);
-		~probe_guard(void);
-
-		probe_guard(const probe_guard& other) = delete;
-		probe_guard(probe_guard&& other) = delete;
-		probe_guard& operator=(const probe_guard& other) = delete;
-		probe_guard& operator=(probe_guard&& other) = delete;
-	};
-
-	class event_thread
-	{
-	public:
-
-		event_thread(unsigned int chip_index, unsigned int line_offset, unsigned int period_ms);
-		~event_thread(void);
-
-		event_thread(const event_thread& other) = delete;
-		event_thread(event_thread&& other) = delete;
-		event_thread& operator=(const event_thread& other) = delete;
-		event_thread& operator=(event_thread&& other) = delete;
-
-	private:
-
-		void event_worker(void);
-
-		unsigned int _m_chip_index;
-		unsigned int _m_line_offset;
-		unsigned int _m_period_ms;
-
-		bool _m_stop;
-
-		::std::mutex _m_mutex;
-		::std::condition_variable _m_cond;
-		::std::thread _m_thread;
-	};
-
-private:
-
-	mockup(void);
-	~mockup(void);
-
-	::gpio_mockup *_m_mockup;
-};
-
-} /* namespace test */
-} /* namespace gpiod */
-
-#endif /* __GPIOD_CXX_TEST_HPP__ */
diff --git a/bindings/cxx/tests/gpiod-cxx-test.cpp b/bindings/cxx/tests/gpiod-cxx-test.cpp
deleted file mode 100644
index 834f372..0000000
--- a/bindings/cxx/tests/gpiod-cxx-test.cpp
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <linux/version.h>
-#include <sys/utsname.h>
-#include <system_error>
-#include <sstream>
-
-namespace {
-
-class kernel_checker
-{
-public:
-
-	kernel_checker(unsigned int major, unsigned int minor, unsigned int release)
-	{
-		unsigned long curr_major, curr_minor, curr_release, curr_ver, req_ver;
-		::std::string major_str, minor_str, release_str;
-		::utsname un;
-		int ret;
-
-		ret = ::uname(::std::addressof(un));
-		if (ret)
-			throw ::std::system_error(errno, ::std::system_category(),
-						  "unable to read the kernel version");
-
-		::std::stringstream ver_stream(::std::string(un.release));
-		::std::getline(ver_stream, major_str, '.');
-		::std::getline(ver_stream, minor_str, '.');
-		::std::getline(ver_stream, release_str, '.');
-
-		curr_major = ::std::stoul(major_str, nullptr, 0);
-		curr_minor = ::std::stoul(minor_str, nullptr, 0);
-		curr_release = ::std::stoul(release_str, nullptr, 0);
-
-		curr_ver = KERNEL_VERSION(curr_major, curr_minor, curr_release);
-		req_ver = KERNEL_VERSION(major, minor, release);
-
-		if (curr_ver < req_ver)
-			throw ::std::system_error(EOPNOTSUPP, ::std::system_category(),
-						  "kernel release must be at least: " +
-						  ::std::to_string(major) + "." +
-						  ::std::to_string(minor) + "." +
-						  ::std::to_string(release));
-	}
-
-	kernel_checker(const kernel_checker& other) = delete;
-	kernel_checker(kernel_checker&& other) = delete;
-	kernel_checker& operator=(const kernel_checker& other) = delete;
-	kernel_checker& operator=(kernel_checker&& other) = delete;
-};
-
-kernel_checker require_kernel(5, 10, 0);
-
-} /* namespace */
diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
new file mode 100644
index 0000000..739e206
--- /dev/null
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -0,0 +1,264 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#include <atomic>
+#include <functional>
+#include <map>
+#include <mutex>
+#include <system_error>
+#include <unistd.h>
+
+#include "gpiosim.h"
+#include "gpiosim.hpp"
+
+#define NORETURN __attribute__((noreturn))
+
+namespace gpiosim {
+
+namespace {
+
+const ::std::map<chip::pull, int> pull_mapping = {
+	{ chip::pull::PULL_UP,		GPIOSIM_PULL_UP },
+	{ chip::pull::PULL_DOWN,	GPIOSIM_PULL_DOWN }
+};
+
+const ::std::map<chip::hog_direction, int> hog_dir_mapping = {
+	{ chip::hog_direction::INPUT,		GPIOSIM_HOG_DIR_INPUT },
+	{ chip::hog_direction::OUTPUT_HIGH,	GPIOSIM_HOG_DIR_OUTPUT_HIGH },
+	{ chip::hog_direction::OUTPUT_LOW,	GPIOSIM_HOG_DIR_OUTPUT_LOW }
+};
+
+const ::std::map<int, chip::value> value_mapping = {
+	{ GPIOSIM_VALUE_INACTIVE,	chip::value::INACTIVE },
+	{ GPIOSIM_VALUE_ACTIVE,		chip::value::ACTIVE }
+};
+
+template<class gpiosim_type, void free_func(gpiosim_type*)> struct deleter
+{
+	void operator()(gpiosim_type* ptr)
+	{
+		free_func(ptr);
+	}
+};
+
+using ctx_deleter = deleter<::gpiosim_ctx, ::gpiosim_ctx_unref>;
+using dev_deleter = deleter<::gpiosim_dev, ::gpiosim_dev_unref>;
+using bank_deleter = deleter<::gpiosim_bank, ::gpiosim_bank_unref>;
+
+using ctx_ptr = ::std::unique_ptr<::gpiosim_ctx, ctx_deleter>;
+using dev_ptr = ::std::unique_ptr<::gpiosim_dev, dev_deleter>;
+using bank_ptr = ::std::unique_ptr<::gpiosim_bank, bank_deleter>;
+
+ctx_ptr sim_ctx;
+::std::once_flag ctx_once;
+const ::pid_t pid = ::getpid();
+::std::atomic_uint chip_count;
+
+void init_ctx(void)
+{
+	sim_ctx.reset(gpiosim_ctx_new());
+	if (!sim_ctx)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to create the GPIO simulator context");
+}
+
+dev_ptr make_sim_dev(void)
+{
+	::std::call_once(ctx_once, init_ctx);
+
+	::std::string name = "gpiod_cxx_test_dev." + ::std::to_string(pid) +
+			     "." + ::std::to_string(chip_count++);
+
+	dev_ptr dev(::gpiosim_dev_new(sim_ctx.get(), name.c_str()));
+	if (!dev)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to create a new GPIO simulator device");
+
+	return dev;
+}
+
+bank_ptr make_sim_bank(const dev_ptr& dev)
+{
+	bank_ptr bank(::gpiosim_bank_new(dev.get(), "bank"));
+	if (!bank)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to create a new GPIO simulator bank");
+
+	return bank;
+}
+
+NORETURN void throw_invalid_type(void)
+{
+	throw ::std::logic_error("invalid type for property");
+}
+
+unsigned any_to_unsigned_int(const ::std::any& val)
+{
+	if (val.type() == typeid(int)) {
+		auto num_lines = ::std::any_cast<int>(val);
+		if (num_lines < 0)
+			throw ::std::invalid_argument("negative value not accepted");
+
+		   return static_cast<unsigned int>(num_lines);
+	} else if (val.type() == typeid(unsigned int)) {
+		return ::std::any_cast<unsigned int>(val);
+	}
+
+	throw_invalid_type();
+}
+
+::std::string any_to_string(const ::std::any& val)
+{
+	if (val.type() == typeid(::std::string))
+		return ::std::any_cast<::std::string>(val);
+	else if (val.type() == typeid(const char*))
+		return ::std::any_cast<const char*>(val);
+
+	throw_invalid_type();
+}
+
+} /* namespace */
+
+struct chip::impl
+{
+	impl(void)
+		: dev(make_sim_dev()),
+		  bank(make_sim_bank(this->dev)),
+		  has_num_lines(false),
+		  has_label(false)
+	{
+
+	}
+
+	impl(const impl& other) = delete;
+	impl(impl&& other) = delete;
+	~impl(void) = default;
+	impl& operator=(const impl& other) = delete;
+	impl& operator=(impl&& other) = delete;
+
+	static const ::std::map<chip::property,
+				::std::function<void (impl&,
+						      const ::std::any&)>> setter_mapping;
+
+	void set_property(chip::property prop, const ::std::any& val)
+	{
+		setter_mapping.at(prop)(*this, val);
+	}
+
+	void set_num_lines(const ::std::any& val)
+	{
+		if (this->has_num_lines)
+			throw ::std::logic_error("number of lines can be set at most once");
+
+		int ret = ::gpiosim_bank_set_num_lines(this->bank.get(), any_to_unsigned_int(val));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set the number of lines");
+
+		this->has_num_lines = true;
+	}
+
+	void set_label(const ::std::any& val)
+	{
+		if (this->has_label)
+			throw ::std::logic_error("label can be set at most once");
+
+		int ret = ::gpiosim_bank_set_label(this->bank.get(),
+						   any_to_string(val).c_str());
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set the chip label");
+
+		this->has_label = true;
+	}
+
+	void set_line_name(const ::std::any& val)
+	{
+		auto name = ::std::any_cast<line_name>(val);
+
+		int ret = ::gpiosim_bank_set_line_name(this->bank.get(),
+						       ::std::get<0>(name),
+						       ::std::get<1>(name).c_str());
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to set simulated line name");
+	}
+
+	void set_line_hog(const ::std::any& val)
+	{
+		auto hog = ::std::any_cast<line_hog>(val);
+
+		int ret = ::gpiosim_bank_hog_line(this->bank.get(),
+						  ::std::get<0>(hog),
+						  ::std::get<1>(hog).c_str(),
+						  hog_dir_mapping.at(::std::get<2>(hog)));
+		if (ret)
+			throw ::std::system_error(errno, ::std::system_category(),
+						  "failed to hog a simulated line");
+	}
+
+	dev_ptr dev;
+	bank_ptr bank;
+	bool has_num_lines;
+	bool has_label;
+};
+
+const ::std::map<chip::property,
+		 ::std::function<void (chip::impl&,
+				       const ::std::any&)>> chip::impl::setter_mapping = {
+	{ chip::property::NUM_LINES,	&chip::impl::set_num_lines },
+	{ chip::property::LABEL,	&chip::impl::set_label },
+	{ chip::property::LINE_NAME,	&chip::impl::set_line_name },
+	{ chip::property::HOG,		&chip::impl::set_line_hog }
+};
+
+chip::chip(const properties& args)
+	: _m_priv(new impl)
+{
+	int ret;
+
+	for (const auto& arg: args)
+		this->_m_priv.get()->set_property(arg.first, arg.second);
+
+	ret = ::gpiosim_dev_enable(this->_m_priv->dev.get());
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to enable the simulated GPIO chip");
+}
+
+chip::~chip(void)
+{
+	this->_m_priv.reset(nullptr);
+	chip_count--;
+}
+
+::std::filesystem::path chip::dev_path(void) const
+{
+	return ::gpiosim_bank_get_dev_path(this->_m_priv->bank.get());
+}
+
+::std::string chip::name(void) const
+{
+	return ::gpiosim_bank_get_chip_name(this->_m_priv->bank.get());
+}
+
+chip::value chip::get_value(unsigned int offset)
+{
+	int val = ::gpiosim_bank_get_value(this->_m_priv->bank.get(), offset);
+	if (val < 0)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to read the simulated GPIO line value");
+
+	return value_mapping.at(val);
+}
+
+void chip::set_pull(unsigned int offset, pull pull)
+{
+	int ret = ::gpiosim_bank_set_pull(this->_m_priv->bank.get(),
+					  offset, pull_mapping.at(pull));
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "failed to set the pull of simulated GPIO line");
+}
+
+} /* namespace gpiosim */
diff --git a/bindings/cxx/tests/gpiosim.hpp b/bindings/cxx/tests/gpiosim.hpp
new file mode 100644
index 0000000..53870c1
--- /dev/null
+++ b/bindings/cxx/tests/gpiosim.hpp
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_CXX_GPIOSIM_HPP__
+#define __GPIOD_CXX_GPIOSIM_HPP__
+
+#include <any>
+#include <filesystem>
+#include <memory>
+#include <tuple>
+#include <utility>
+#include <vector>
+
+namespace gpiosim {
+
+class chip
+{
+public:
+	enum class property {
+		NUM_LINES = 1,
+		LABEL,
+		LINE_NAME,
+		HOG
+	};
+
+	enum class pull {
+		PULL_UP = 1,
+		PULL_DOWN
+	};
+
+	enum class hog_direction {
+		INPUT = 1,
+		OUTPUT_HIGH,
+		OUTPUT_LOW
+	};
+
+	enum class value {
+		INACTIVE = 0,
+		ACTIVE = 1
+	};
+
+	using line_name = ::std::tuple<unsigned int, ::std::string>;
+	using line_hog = ::std::tuple<unsigned int, ::std::string, hog_direction>;
+	using properties = ::std::vector<::std::pair<property, ::std::any>>;
+
+	explicit chip(const properties& args = properties());
+	chip(const chip& other) = delete;
+	chip(chip&& other) = delete;
+	~chip(void);
+
+	chip& operator=(const chip& other) = delete;
+	chip& operator=(chip&& other) = delete;
+
+	::std::filesystem::path dev_path(void) const;
+	::std::string name(void) const;
+
+	value get_value(unsigned int offset);
+	void set_pull(unsigned int offset, pull pull);
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+};
+
+} /* namespace gpiosim */
+
+#endif /* __GPIOD_CXX_GPIOSIM_HPP__ */
diff --git a/bindings/cxx/tests/helpers.cpp b/bindings/cxx/tests/helpers.cpp
new file mode 100644
index 0000000..b82d03b
--- /dev/null
+++ b/bindings/cxx/tests/helpers.cpp
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "helpers.hpp"
+
+system_error_matcher::system_error_matcher(int expected_errno)
+	: _m_cond(::std::system_category().default_error_condition(expected_errno))
+{
+
+}
+
+::std::string system_error_matcher::describe(void) const
+{
+	return "matches: errno " + ::std::to_string(this->_m_cond.value());
+}
+
+bool system_error_matcher::match(const ::std::system_error& error) const
+{
+	return error.code().value() == this->_m_cond.value();
+}
+
+regex_matcher::regex_matcher(const ::std::string& pattern)
+	: _m_pattern(pattern),
+	  _m_repr("matches: regex \"" + pattern + "\"")
+{
+
+}
+
+::std::string regex_matcher::describe(void) const
+{
+	return this->_m_repr;
+}
+
+bool regex_matcher::match(const ::std::string& str) const
+{
+	return ::std::regex_match(str, this->_m_pattern);
+}
diff --git a/bindings/cxx/tests/helpers.hpp b/bindings/cxx/tests/helpers.hpp
new file mode 100644
index 0000000..8a421ad
--- /dev/null
+++ b/bindings/cxx/tests/helpers.hpp
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __GPIOD_CXX_TEST_HELPERS_HPP__
+#define __GPIOD_CXX_TEST_HELPERS_HPP__
+
+#include <catch2/catch.hpp>
+#include <regex>
+#include <string>
+#include <sstream>
+#include <system_error>
+
+class system_error_matcher : public Catch::MatcherBase<::std::system_error>
+{
+public:
+	explicit system_error_matcher(int expected_errno);
+	::std::string describe(void) const override;
+	bool match(const ::std::system_error& error) const override;
+
+private:
+	::std::error_condition _m_cond;
+};
+
+class regex_matcher : public Catch::MatcherBase<::std::string>
+{
+public:
+	explicit regex_matcher(const ::std::string& pattern);
+	::std::string describe(void) const override;
+	bool match(const ::std::string& str) const override;
+
+private:
+	::std::regex _m_pattern;
+	::std::string _m_repr;
+};
+
+#endif /* __GPIOD_CXX_TEST_HELPERS_HPP__ */
diff --git a/bindings/cxx/tests/tests-chip-info.cpp b/bindings/cxx/tests/tests-chip-info.cpp
new file mode 100644
index 0000000..051a6dd
--- /dev/null
+++ b/bindings/cxx/tests/tests-chip-info.cpp
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+
+#include "gpiosim.hpp"
+
+using property = ::gpiosim::chip::property;
+
+namespace {
+
+TEST_CASE("chip_info properties can be read", "[chip-info][chip]")
+{
+	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_info();
+
+	SECTION("get chip name")
+	{
+		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+	}
+
+	SECTION("get chip label")
+	{
+		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+	}
+
+	SECTION("get num_lines")
+	{
+		REQUIRE(info.num_lines() == 8);
+	}
+}
+
+TEST_CASE("chip_info can be copied and moved", "[chip-info]")
+{
+	::gpiosim::chip sim({{ property::NUM_LINES, 4 }, { property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_info();
+
+	SECTION("copy constructor works")
+	{
+		auto copy(info);
+
+		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
+		REQUIRE(copy.num_lines() == 4);
+
+		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE(info.num_lines() == 4);
+	}
+
+	SECTION("assignment operator works")
+	{
+		auto copy = chip.get_info();
+
+		copy = info;
+
+		REQUIRE_THAT(copy.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(copy.label(), Catch::Equals("foobar"));
+		REQUIRE(copy.num_lines() == 4);
+
+		REQUIRE_THAT(info.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(info.label(), Catch::Equals("foobar"));
+		REQUIRE(info.num_lines() == 4);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto moved(std::move(info));
+
+		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
+		REQUIRE(moved.num_lines() == 4);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		auto moved = chip.get_info();
+
+		moved = ::std::move(info);
+
+		REQUIRE_THAT(moved.name(), Catch::Equals(sim.name()));
+		REQUIRE_THAT(moved.label(), Catch::Equals("foobar"));
+		REQUIRE(moved.num_lines() == 4);
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index aea00fa..3e63ec2 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -1,173 +1,172 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 #include <catch2/catch.hpp>
 #include <gpiod.hpp>
+#include <sstream>
+#include <system_error>
+#include <utility>
 
-#include "gpio-mockup.hpp"
+#include "gpiosim.hpp"
+#include "helpers.hpp"
 
-using ::gpiod::test::mockup;
+using property = ::gpiosim::chip::property;
+using line_name = ::gpiosim::chip::line_name;
 
-TEST_CASE("GPIO chip device can be verified with is_gpiochip_device()", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
+namespace {
 
-	SECTION("good chip")
+TEST_CASE("chip constructor works", "[chip]")
+{
+	SECTION("open an existing GPIO chip")
 	{
-		REQUIRE(::gpiod::is_gpiochip_device(mockup::instance().chip_path(0)));
+		::gpiosim::chip sim;
+
+		REQUIRE_NOTHROW(::gpiod::chip(sim.dev_path()));
 	}
 
-	SECTION("not a chip")
+	SECTION("opening a nonexistent file fails with ENOENT")
 	{
-		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/null"));
+		REQUIRE_THROWS_MATCHES(::gpiod::chip("/dev/nonexistent"),
+				       ::std::system_error, system_error_matcher(ENOENT));
 	}
 
-	SECTION("nonexistent file")
+	SECTION("opening a file that is not a device fails with ENOTTY")
 	{
-		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/nonexistent_device"));
+		REQUIRE_THROWS_MATCHES(::gpiod::chip("/tmp"),
+				       ::std::system_error, system_error_matcher(ENOTTY));
 	}
-}
 
-TEST_CASE("GPIO chip device can be opened", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8 });
-
-	SECTION("open from constructor")
+	SECTION("opening a non-GPIO character device fails with ENODEV")
 	{
-		REQUIRE_NOTHROW(::gpiod::chip(mockup::instance().chip_path(1)));
+		REQUIRE_THROWS_MATCHES(::gpiod::chip("/dev/null"),
+				       ::std::system_error, system_error_matcher(ENODEV));
 	}
 
-	SECTION("open from open() method")
+	SECTION("move constructor")
 	{
-		::gpiod::chip chip;
-
-		REQUIRE_FALSE(!!chip);
+		::gpiosim::chip sim({{ property::LABEL, "foobar" }});
 
-		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_path(1)));
+		::gpiod::chip first(sim.dev_path());
+		REQUIRE_THAT(first.get_info().label(), Catch::Equals("foobar"));
+		::gpiod::chip second(::std::move(first));
+		REQUIRE_THAT(second.get_info().label(), Catch::Equals("foobar"));
 	}
 }
 
-TEST_CASE("Uninitialized GPIO chip behaves correctly", "[chip]")
+TEST_CASE("chip operators work", "[chip]")
 {
-	::gpiod::chip chip;
+	::gpiosim::chip sim({{ property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
 
-	SECTION("uninitialized chip is 'false'")
+	SECTION("assignment operator")
 	{
-		REQUIRE_FALSE(!!chip);
+		::gpiosim::chip moved_sim({{ property::LABEL, "moved" }});
+		::gpiod::chip moved_chip(moved_sim.dev_path());
+
+		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("foobar"));
+		chip = ::std::move(moved_chip);
+		REQUIRE_THAT(chip.get_info().label(), Catch::Equals("moved"));
 	}
 
-	SECTION("using uninitialized chip throws logic_error")
+	SECTION("boolean operator")
 	{
-		REQUIRE_THROWS_AS(chip.name(), ::std::logic_error);
+		REQUIRE(chip);
+		chip.close();
+		REQUIRE_FALSE(chip);
 	}
 }
 
-TEST_CASE("Trying to open a nonexistent chip throws system_error", "[chip]")
+TEST_CASE("chip properties can be read", "[chip]")
 {
-	REQUIRE_THROWS_AS(::gpiod::chip("nonexistent-chip"), ::std::system_error);
-}
+	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
+	::gpiod::chip chip(sim.dev_path());
 
-TEST_CASE("Chip object can be reset", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	REQUIRE(chip);
-	chip.reset();
-	REQUIRE_FALSE(!!chip);
-}
-
-TEST_CASE("Chip info can be correctly retrieved", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 16, 8 });
+	SECTION("get device path")
+	{
+		REQUIRE_THAT(chip.path(), Catch::Equals(sim.dev_path()));
+	}
 
-	::gpiod::chip chip(mockup::instance().chip_path(1));
-	REQUIRE(chip.name() == mockup::instance().chip_name(1));
-	REQUIRE(chip.label() == "gpio-mockup-B");
-	REQUIRE(chip.num_lines() == 16);
+	SECTION("get file descriptor")
+	{
+		REQUIRE(chip.fd() >= 0);
+	}
 }
 
-TEST_CASE("Chip object can be copied and compared", "[chip]")
+TEST_CASE("line lookup by name works", "[chip]")
 {
-	mockup::probe_guard mockup_chips({ 8, 8 });
-
-	::gpiod::chip chip1(mockup::instance().chip_path(0));
-	auto chip2 = chip1;
-	REQUIRE(chip1 == chip2);
-	REQUIRE_FALSE(chip1 != chip2);
-	::gpiod::chip chip3(mockup::instance().chip_path(1));
-	REQUIRE(chip1 != chip3);
-	REQUIRE_FALSE(chip2 == chip3);
-}
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(0, "foo") },
+		{ property::LINE_NAME, line_name(2, "bar") },
+		{ property::LINE_NAME, line_name(3, "baz") },
+		{ property::LINE_NAME, line_name(5, "xyz") }
+	});
 
-TEST_CASE("Lines can be retrieved from chip objects", "[chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_path(1));
+	::gpiod::chip chip(sim.dev_path());
 
-	SECTION("get single line by offset")
+	SECTION("lookup successful")
 	{
-		auto line = chip.get_line(3);
-		REQUIRE(line.name() == "gpio-mockup-B-3");
+		REQUIRE(chip.find_line("baz") == 3);
 	}
 
-	SECTION("find single line by name")
+	SECTION("lookup failed")
 	{
-		auto offset = chip.find_line("gpio-mockup-B-3");
-		REQUIRE(offset == 3);
+		REQUIRE(chip.find_line("nonexistent") < 0);
 	}
+}
 
-	SECTION("get multiple lines by offsets")
-	{
-		auto lines = chip.get_lines({ 1, 3, 4, 7});
-		REQUIRE(lines.size() == 4);
-		REQUIRE(lines.get(0).name() == "gpio-mockup-B-1");
-		REQUIRE(lines.get(1).name() == "gpio-mockup-B-3");
-		REQUIRE(lines.get(2).name() == "gpio-mockup-B-4");
-		REQUIRE(lines.get(3).name() == "gpio-mockup-B-7");
-	}
+TEST_CASE("line lookup: behavior for duplicate names", "[chip]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(0, "foo") },
+		{ property::LINE_NAME, line_name(2, "bar") },
+		{ property::LINE_NAME, line_name(3, "baz") },
+		{ property::LINE_NAME, line_name(5, "bar") }
+	});
 
-	SECTION("get multiple lines by offsets in mixed order")
-	{
-		auto lines = chip.get_lines({ 5, 1, 3, 2});
-		REQUIRE(lines.size() == 4);
-		REQUIRE(lines.get(0).name() == "gpio-mockup-B-5");
-		REQUIRE(lines.get(1).name() == "gpio-mockup-B-1");
-		REQUIRE(lines.get(2).name() == "gpio-mockup-B-3");
-		REQUIRE(lines.get(3).name() == "gpio-mockup-B-2");
-	}
+	::gpiod::chip chip(sim.dev_path());
+
+	REQUIRE(chip.find_line("bar") == 2);
 }
 
-TEST_CASE("All lines can be retrieved from a chip at once", "[chip]")
+TEST_CASE("closed chip can no longer be used", "[chip]")
 {
-	mockup::probe_guard mockup_chips({ 4 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-
-	auto lines = chip.get_all_lines();
-	REQUIRE(lines.size() == 4);
-	REQUIRE(lines.get(0).offset() == 0);
-	REQUIRE(lines.get(1).offset() == 1);
-	REQUIRE(lines.get(2).offset() == 2);
-	REQUIRE(lines.get(3).offset() == 3);
+	::gpiosim::chip sim;
+
+	::gpiod::chip chip(sim.dev_path());
+	chip.close();
+	REQUIRE_THROWS_AS(chip.path(), ::gpiod::chip_closed);
 }
 
-TEST_CASE("Errors occurring when retrieving lines are correctly reported", "[chip]")
+TEST_CASE("stream insertion operator works for chip and chip_info", "[chip][chip-info]")
 {
-	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_path(0));
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 4 },
+		{ property::LABEL, "foobar" }
+	});
 
-	SECTION("invalid offset (single line)")
-	{
-		REQUIRE_THROWS_AS(chip.get_line(9), ::std::out_of_range);
-	}
+	::gpiod::chip chip(sim.dev_path());
+	::std::stringstream buf;
 
-	SECTION("invalid offset (multiple lines)")
+	SECTION("open chip")
 	{
-		REQUIRE_THROWS_AS(chip.get_lines({ 1, 19, 4, 7 }), ::std::out_of_range);
+		::std::stringstream expected;
+
+		expected << "chip(path=" << sim.dev_path() <<
+			    ", info=chip_info(name=\"" << sim.name() <<
+			    "\", label=\"foobar\", num_lines=4))";
+
+		buf << chip;
+		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
 	}
 
-	SECTION("line not found by name")
+	SECTION("closed chip")
 	{
-		REQUIRE(chip.find_line("nonexistent-line") == -1);
+		chip.close();
+		buf << chip;
+		REQUIRE_THAT(buf.str(), Catch::Equals("chip(closed)"));
 	}
 }
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
new file mode 100644
index 0000000..88783c6
--- /dev/null
+++ b/bindings/cxx/tests/tests-edge-event.cpp
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <chrono>
+#include <gpiod.hpp>
+#include <sstream>
+#include <thread>
+#include <utility>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using simprop = ::gpiosim::chip::property;
+using reqprop = ::gpiod::request_config::property;
+using lineprop = ::gpiod::line_config::property;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using offsets = ::gpiod::line::offsets;
+using pull = ::gpiosim::chip::pull;
+using event_type = ::gpiod::edge_event::event_type;
+
+namespace {
+
+TEST_CASE("edge_event_buffer capacity settings work", "[edge-event]")
+{
+	SECTION("default capacity")
+	{
+		REQUIRE(::gpiod::edge_event_buffer().capacity() == 64);
+	}
+
+	SECTION("user-defined capacity")
+	{
+		REQUIRE(::gpiod::edge_event_buffer(123).capacity() == 123);
+	}
+
+	SECTION("max capacity")
+	{
+		REQUIRE(::gpiod::edge_event_buffer(16 * 64 * 2).capacity() == 1024);
+	}
+}
+
+TEST_CASE("edge_event wait timeout", "[edge-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+}
+
+TEST_CASE("output mode and edge detection don't work together", "[edge-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+
+	REQUIRE_THROWS_AS(
+		chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::DIRECTION, direction::OUTPUT },
+				{ lineprop::EDGE, edge::BOTH }
+			})
+		),
+		::std::invalid_argument
+	);
+}
+
+void trigger_falling_and_rising_edge(::gpiosim::chip& sim, unsigned int offset)
+{
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(offset, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(offset, pull::PULL_DOWN);
+}
+
+void trigger_rising_edge_events_on_two_offsets(::gpiosim::chip& sim,
+					       unsigned int off0, unsigned int off1)
+{
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(off0, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(off1, pull::PULL_UP);
+}
+
+TEST_CASE("waiting for and reading edge events works", "[edge-event]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer;
+
+	SECTION("both edge events")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::BOTH }
+			})
+		);
+
+		::std::uint64_t ts_rising, ts_falling;
+
+		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 2);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 2);
+		ts_rising = event.timestamp_ns();
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::FALLING_EDGE);
+		REQUIRE(event.line_offset() == 2);
+		ts_falling = event.timestamp_ns();
+
+		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+
+		thread.join();
+
+		REQUIRE(ts_falling > ts_rising);
+	}
+
+	SECTION("rising edge event")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 6 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::RISING }
+			})
+		);
+
+		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 6);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 6);
+
+		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+
+		thread.join();
+	}
+
+	SECTION("falling edge event")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 7 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::FALLING }
+			})
+		);
+
+		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 7);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::FALLING_EDGE);
+		REQUIRE(event.line_offset() == 7);
+
+		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+
+		thread.join();
+	}
+
+	SECTION("sequence numbers")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0, 1 })}
+			}),
+			::gpiod::line_config({
+				{ lineprop::EDGE, edge::BOTH }
+			})
+		);
+
+		::std::thread thread(trigger_rising_edge_events_on_two_offsets, ::std::ref(sim), 0, 1);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		auto event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 0);
+		REQUIRE(event.global_seqno() == 1);
+		REQUIRE(event.line_seqno() == 1);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(buffer.num_events() == 1);
+		event = buffer.get_event(0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 1);
+		REQUIRE(event.global_seqno() == 2);
+		REQUIRE(event.line_seqno() == 1);
+
+		thread.join();
+	}
+}
+
+TEST_CASE("reading multiple events", "[edge-event]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 1 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	unsigned long line_seqno = 1, global_seqno = 1;
+
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	SECTION("read multiple events")
+	{
+		::gpiod::edge_event_buffer buffer;
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer) == 3);
+		REQUIRE(buffer.num_events() == 3);
+
+		for (const auto& event: buffer) {
+			REQUIRE(event.line_offset() == 1);
+			REQUIRE(event.line_seqno() == line_seqno++);
+			REQUIRE(event.global_seqno() == global_seqno++);
+		}
+	}
+
+	SECTION("read over capacity")
+	{
+		::gpiod::edge_event_buffer buffer(2);
+
+		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_event(buffer) == 2);
+		REQUIRE(buffer.num_events() == 2);
+	}
+}
+
+TEST_CASE("edge_event_buffer can be moved", "[edge-event]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 2 }});
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer(13);
+
+	/* Get some events into the buffer. */
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 1 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	sim.set_pull(1, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(500));
+
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 3);
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(buffer));
+		REQUIRE(moved.capacity() == 13);
+		REQUIRE(moved.num_events() == 3);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		::gpiod::edge_event_buffer moved;
+
+		moved = ::std::move(buffer);
+		REQUIRE(moved.capacity() == 13);
+		REQUIRE(moved.num_events() == 3);
+	}
+}
+
+TEST_CASE("edge_event can be copied and moved", "[edge-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer;
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	sim.set_pull(0, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 1);
+	auto event = buffer.get_event(0);
+
+	sim.set_pull(0, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 1);
+	auto copy = buffer.get_event(0);
+
+	SECTION("copy constructor works")
+	{
+		auto copy(event);
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(event));
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+	}
+
+	SECTION("assignment operator works")
+	{
+		copy = event;
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+		REQUIRE(event.line_offset() == 0);
+		REQUIRE(event.type() == event_type::RISING_EDGE);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		copy = ::std::move(event);
+		REQUIRE(copy.line_offset() == 0);
+		REQUIRE(copy.type() == event_type::RISING_EDGE);
+	}
+}
+
+TEST_CASE("stream insertion operators work for edge_event and edge_event_buffer", "[edge-event]")
+{
+	/*
+	 * This tests the stream insertion operators for both edge_event and
+	 * edge_event_buffer classes.
+	 */
+
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::gpiod::edge_event_buffer buffer;
+	::std::stringstream sbuf, expected;
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 })}
+		}),
+		::gpiod::line_config({
+			{ lineprop::EDGE, edge::BOTH }
+		})
+	);
+
+	sim.set_pull(0, pull::PULL_UP);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+	sim.set_pull(0, pull::PULL_DOWN);
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
+
+	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_event(buffer) == 2);
+
+	sbuf << buffer;
+
+	expected << "edge_event_buffer\\(num_events=2, capacity=64, events=\\[edge_event\\" <<
+		    "(type='RISING_EDGE', timestamp=[1-9][0-9]+, line_offset=0, global_seqno=1, " <<
+		    "line_seqno=1\\), edge_event\\(type='FALLING_EDGE', timestamp=[1-9][0-9]+, " <<
+		    "line_offset=0, global_seqno=2, line_seqno=2\\)\\]\\)";
+
+	REQUIRE_THAT(sbuf.str(), regex_matcher(expected.str()));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
deleted file mode 100644
index aeb50dd..0000000
--- a/bindings/cxx/tests/tests-event.cpp
+++ /dev/null
@@ -1,280 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <catch2/catch.hpp>
-#include <gpiod.hpp>
-#include <poll.h>
-#include <thread>
-
-#include "gpio-mockup.hpp"
-
-using ::gpiod::test::mockup;
-
-namespace {
-
-const ::std::string consumer = "event-test";
-
-} /* namespace */
-
-TEST_CASE("Line events can be detected", "[event][line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	mockup::event_thread events(0, 4, 200);
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(4);
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-
-	SECTION("rising edge")
-	{
-		config.request_type = ::gpiod::line_request::EVENT_RISING_EDGE;
-		line.request(config);
-
-		auto got_event = line.event_wait(::std::chrono::seconds(1));
-		REQUIRE(got_event);
-
-		auto event = line.event_read();
-		REQUIRE(event.source == line);
-		REQUIRE(event.event_type == ::gpiod::line_event::RISING_EDGE);
-	}
-
-	SECTION("falling edge")
-	{
-		config.request_type = ::gpiod::line_request::EVENT_FALLING_EDGE;
-
-		line.request(config);
-
-		auto got_event = line.event_wait(::std::chrono::seconds(1));
-		REQUIRE(got_event);
-
-		auto event = line.event_read();
-		REQUIRE(event.source == line);
-		REQUIRE(event.event_type == ::gpiod::line_event::FALLING_EDGE);
-	}
-
-	SECTION("both edges")
-	{
-		config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-
-		line.request(config);
-
-		auto got_event = line.event_wait(::std::chrono::seconds(1));
-		REQUIRE(got_event);
-
-		auto event = line.event_read();
-		REQUIRE(event.source == line);
-		REQUIRE(event.event_type == ::gpiod::line_event::RISING_EDGE);
-
-		got_event = line.event_wait(::std::chrono::seconds(1));
-		REQUIRE(got_event);
-
-		event = line.event_read();
-		REQUIRE(event.source == line);
-		REQUIRE(event.event_type == ::gpiod::line_event::FALLING_EDGE);
-	}
-
-	SECTION("active-low")
-	{
-		config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW;
-
-		line.request(config);
-
-		auto got_event = line.event_wait(::std::chrono::seconds(1));
-		REQUIRE(got_event);
-
-		auto event = line.event_read();
-		REQUIRE(event.source == line);
-		REQUIRE(event.event_type == ::gpiod::line_event::FALLING_EDGE);
-
-		got_event = line.event_wait(::std::chrono::seconds(1));
-		REQUIRE(got_event);
-
-		event = line.event_read();
-		REQUIRE(event.source == line);
-		REQUIRE(event.event_type == ::gpiod::line_event::RISING_EDGE);
-	}
-}
-
-TEST_CASE("Watching line_bulk objects for events works", "[event][bulk]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	mockup::event_thread events(0, 2, 200);
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto lines = chip.get_lines({ 0, 1, 2, 3 });
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-	lines.request(config);
-
-	auto event_lines = lines.event_wait(::std::chrono::seconds(1));
-	REQUIRE(event_lines);
-	REQUIRE(event_lines.size() == 1);
-
-	auto event = event_lines.get(0).event_read();
-	REQUIRE(event.source == event_lines.get(0));
-	REQUIRE(event.event_type == ::gpiod::line_event::RISING_EDGE);
-
-	event_lines = lines.event_wait(::std::chrono::seconds(1));
-	REQUIRE(event_lines);
-	REQUIRE(event_lines.size() == 1);
-
-	event = event_lines.get(0).event_read();
-	REQUIRE(event.source == event_lines.get(0));
-	REQUIRE(event.event_type == ::gpiod::line_event::FALLING_EDGE);
-}
-
-TEST_CASE("It's possible to retrieve the event file descriptor", "[event][line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(4);
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-
-	SECTION("get the fd")
-	{
-		config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-
-		line.request(config);
-		REQUIRE(line.event_get_fd() >= 0);
-	}
-
-	SECTION("error if not requested")
-	{
-		REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error);
-	}
-
-	SECTION("error if requested for values")
-	{
-		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-
-		line.request(config);
-		REQUIRE_THROWS_AS(line.event_get_fd(), ::std::system_error);
-	}
-}
-
-TEST_CASE("Event file descriptors can be used for polling", "[event]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	mockup::event_thread events(0, 3, 200);
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto lines = chip.get_lines({ 0, 1, 2, 3, 4, 5 });
-
-	::gpiod::line_request config;
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-
-	lines.request(config);
-
-	::std::vector<::pollfd> fds(3);
-	fds[0].fd = lines[1].event_get_fd();
-	fds[1].fd = lines[3].event_get_fd();
-	fds[2].fd = lines[5].event_get_fd();
-
-	fds[0].events = fds[1].events = fds[2].events = POLLIN | POLLPRI;
-
-	int ret = ::poll(fds.data(), 3, 1000);
-	REQUIRE(ret == 1);
-
-	for (int i = 0; i < 3; i++) {
-		if (fds[i].revents) {
-			auto event = lines[3].event_read();
-			REQUIRE(event.source == lines[3]);
-			REQUIRE(event.event_type == ::gpiod::line_event::RISING_EDGE);
-		}
-	}
-}
-
-TEST_CASE("It's possible to read a value from a line requested for events", "[event][line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(4);
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-
-	mockup::instance().chip_set_pull(0, 4, 1);
-
-	SECTION("active-high (default)")
-	{
-		line.request(config);
-		REQUIRE(line.get_value() == 1);
-	}
-
-	SECTION("active-low")
-	{
-		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW;
-		line.request(config);
-		REQUIRE(line.get_value() == 0);
-	}
-}
-
-TEST_CASE("It's possible to read values from lines requested for events", "[event][bulk]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto lines = chip.get_lines({ 0, 1, 2, 3, 4 });
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-
-	mockup::instance().chip_set_pull(0, 5, 1);
-
-	SECTION("active-high (default)")
-	{
-		lines.request(config);
-		REQUIRE(lines.get_values() == ::std::vector<int>({ 0, 0, 0, 0, 0 }));
-		mockup::instance().chip_set_pull(0, 1, 1);
-		mockup::instance().chip_set_pull(0, 3, 1);
-		mockup::instance().chip_set_pull(0, 4, 1);
-		REQUIRE(lines.get_values() == ::std::vector<int>({ 0, 1, 0, 1, 1 }));
-	}
-
-	SECTION("active-low")
-	{
-		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW;
-		lines.request(config);
-		REQUIRE(lines.get_values() == ::std::vector<int>({ 1, 1, 1, 1, 1 }));
-		mockup::instance().chip_set_pull(0, 1, 1);
-		mockup::instance().chip_set_pull(0, 3, 1);
-		mockup::instance().chip_set_pull(0, 4, 1);
-		REQUIRE(lines.get_values() == ::std::vector<int>({ 1, 0, 1, 0, 0 }));
-	}
-}
-
-TEST_CASE("It's possible to read more than one line event", "[event][line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(4);
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::EVENT_BOTH_EDGES;
-
-	line.request(config);
-
-	mockup::instance().chip_set_pull(0, 4, 1);
-	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
-	mockup::instance().chip_set_pull(0, 4, 0);
-	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
-	mockup::instance().chip_set_pull(0, 4, 1);
-	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
-
-	auto events = line.event_read_multiple();
-
-	REQUIRE(events.size() == 3);
-	REQUIRE(events.at(0).event_type == ::gpiod::line_event::RISING_EDGE);
-	REQUIRE(events.at(1).event_type == ::gpiod::line_event::FALLING_EDGE);
-	REQUIRE(events.at(2).event_type == ::gpiod::line_event::RISING_EDGE);
-	REQUIRE(events.at(0).source == line);
-	REQUIRE(events.at(1).source == line);
-	REQUIRE(events.at(2).source == line);
-}
diff --git a/bindings/cxx/tests/tests-info-event.cpp b/bindings/cxx/tests/tests-info-event.cpp
new file mode 100644
index 0000000..8c6a05b
--- /dev/null
+++ b/bindings/cxx/tests/tests-info-event.cpp
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <chrono>
+#include <gpiod.hpp>
+#include <sstream>
+#include <thread>
+#include <utility>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using simprop = ::gpiosim::chip::property;
+using reqprop = ::gpiod::request_config::property;
+using lineprop = ::gpiod::line_config::property;
+using direction = ::gpiod::line::direction;
+using event_type = ::gpiod::info_event::event_type;
+
+namespace {
+
+void request_reconfigure_release_line(::gpiod::chip& chip)
+{
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 7 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	request.reconfigure_lines(
+		::gpiod::line_config({
+			{ lineprop::DIRECTION, direction::OUTPUT }
+		})
+	);
+
+	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
+
+	request.release();
+}
+
+TEST_CASE("Lines can be watched", "[info-event][chip]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("watch_line_info() returns line info")
+	{
+		auto info = chip.watch_line_info(7);
+		REQUIRE(info.offset() == 7);
+	}
+
+	SECTION("watch_line_info() fails for offset out of range")
+	{
+		REQUIRE_THROWS_AS(chip.watch_line_info(8), ::std::invalid_argument);
+	}
+
+	SECTION("waiting for event timeout")
+	{
+		chip.watch_line_info(3);
+		REQUIRE_FALSE(chip.wait_info_event(::std::chrono::milliseconds(100)));
+	}
+
+	SECTION("request-reconfigure-release events")
+	{
+		auto info = chip.watch_line_info(7);
+		::std::uint64_t ts_req, ts_rec, ts_rel;
+
+		REQUIRE(info.direction() == direction::INPUT);
+
+		::std::thread thread(request_reconfigure_release_line, ::std::ref(chip));
+
+		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+		auto event = chip.read_info_event();
+		REQUIRE(event.type() == event_type::LINE_REQUESTED);
+		REQUIRE(event.get_line_info().direction() == direction::INPUT);
+		ts_req = event.timestamp_ns();
+
+		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+		event = chip.read_info_event();
+		REQUIRE(event.type() == event_type::LINE_CONFIG_CHANGED);
+		REQUIRE(event.get_line_info().direction() == direction::OUTPUT);
+		ts_rec = event.timestamp_ns();
+
+		REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+		event = chip.read_info_event();
+		REQUIRE(event.type() == event_type::LINE_RELEASED);
+		ts_rel = event.timestamp_ns();
+
+		/* No more events. */
+		REQUIRE_FALSE(chip.wait_info_event(::std::chrono::milliseconds(100)));
+		thread.join();
+
+		/* Check timestamps are really monotonic. */
+		REQUIRE(ts_rel > ts_rec);
+		REQUIRE(ts_rec > ts_req);
+	}
+}
+
+TEST_CASE("info_event can be copied and moved", "[info-event]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::std::stringstream buf, expected;
+
+	chip.watch_line_info(0);
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 0 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+	auto event = chip.read_info_event();
+
+	request.release();
+
+	REQUIRE(chip.wait_info_event(::std::chrono::seconds(1)));
+	auto copy = chip.read_info_event();
+
+	SECTION("copy constructor works")
+	{
+		auto copy(event);
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+
+		REQUIRE(event.type() == event_type::LINE_REQUESTED);
+		REQUIRE(event.get_line_info().offset() == 0);
+	}
+
+	SECTION("assignment operator works")
+	{
+		copy = event;
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+
+		REQUIRE(event.type() == event_type::LINE_REQUESTED);
+		REQUIRE(event.get_line_info().offset() == 0);
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(event));
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		copy = ::std::move(event);
+
+		REQUIRE(copy.type() == event_type::LINE_REQUESTED);
+		REQUIRE(copy.get_line_info().offset() == 0);
+	}
+}
+
+TEST_CASE("info_event stream insertion operator works", "[info-event][line-info]")
+{
+	/*
+	 * This tests the stream insertion operator for both the info_event
+	 * and line_info classes.
+	 */
+
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+	::std::stringstream buf, expected;
+
+	chip.watch_line_info(0);
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, ::gpiod::line::offsets({ 0 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	auto event = chip.read_info_event();
+
+	buf << event;
+
+	expected << "info_event\\(event_type='LINE_REQUESTED', timestamp=[1-9][0-9]+, " <<
+		    "line_info=line_info\\(offset=0, name=unnamed, used=true, consumer='', " <<
+		    "direction=INPUT, active_low=false, bias=UNKNOWN, drive=PUSH/PULL, " <<
+		    "edge_detection=NONE, event_clock=MONOTONIC, debounced=false\\)\\)";
+
+	REQUIRE_THAT(buf.str(), regex_matcher(expected.str()));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
deleted file mode 100644
index 848889b..0000000
--- a/bindings/cxx/tests/tests-iter.cpp
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <catch2/catch.hpp>
-#include <gpiod.hpp>
-
-#include "gpio-mockup.hpp"
-
-using ::gpiod::test::mockup;
-
-TEST_CASE("Line iterator works", "[iter][line]")
-{
-	mockup::probe_guard mockup_chips({ 4 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	unsigned int count = 0;
-
-	for (auto& it: ::gpiod::line_iter(chip))
-		REQUIRE(it.offset() == count++);
-
-	REQUIRE(count == chip.num_lines());
-}
diff --git a/bindings/cxx/tests/tests-line-config.cpp b/bindings/cxx/tests/tests-line-config.cpp
new file mode 100644
index 0000000..f0ed997
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-config.cpp
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+
+#include "helpers.hpp"
+
+using lineprop = ::gpiod::line_config::property;
+using value = ::gpiod::line::value;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using bias = ::gpiod::line::bias;
+using drive = ::gpiod::line::drive;
+using clock_type = ::gpiod::line::clock;
+using mappings = ::gpiod::line::value_mappings;
+using offsets = ::gpiod::line::offsets;
+
+using namespace ::std::chrono_literals;
+
+namespace {
+
+TEST_CASE("line_config constructor works", "[line-config]")
+{
+	SECTION("no arguments - default values")
+	{
+		::gpiod::line_config cfg;
+
+		REQUIRE_NOTHROW(cfg.direction_default() == direction::INPUT);
+		REQUIRE(cfg.edge_detection_default() == edge::NONE);
+		REQUIRE(cfg.bias_default() == bias::AS_IS);
+		REQUIRE(cfg.drive_default() == drive::PUSH_PULL);
+		REQUIRE_FALSE(cfg.active_low_default());
+		REQUIRE(cfg.debounce_period_default() == 0us);
+		REQUIRE(cfg.event_clock_default() == clock_type::MONOTONIC);
+		REQUIRE(cfg.output_value_default() == value::INACTIVE);
+		REQUIRE(cfg.num_overrides() == 0);
+		REQUIRE(cfg.overrides().empty());
+	}
+
+	SECTION("default values set from constructor")
+	{
+		/*
+		 * These are wrong and the request would fail but we're just
+		 * testing the object's behavior.
+		 */
+		::gpiod::line_config cfg({
+			{ lineprop::DIRECTION, direction::OUTPUT },
+			{ lineprop::EDGE, edge::FALLING },
+			{ lineprop::BIAS, bias::DISABLED },
+			{ lineprop::DRIVE, drive::OPEN_DRAIN },
+			{ lineprop::ACTIVE_LOW, true },
+			{ lineprop::DEBOUNCE_PERIOD, 3000us },
+			{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
+			{ lineprop::OUTPUT_VALUE, value::ACTIVE }
+		});
+
+		REQUIRE_NOTHROW(cfg.direction_default() == direction::OUTPUT);
+		REQUIRE(cfg.edge_detection_default() == edge::FALLING);
+		REQUIRE(cfg.bias_default() == bias::DISABLED);
+		REQUIRE(cfg.drive_default() == drive::OPEN_DRAIN);
+		REQUIRE(cfg.active_low_default());
+		/* Test implicit conversion between duration types. */
+		REQUIRE(cfg.debounce_period_default() == 3ms);
+		REQUIRE(cfg.event_clock_default() == clock_type::REALTIME);
+		REQUIRE(cfg.output_value_default() == value::ACTIVE);
+		REQUIRE(cfg.num_overrides() == 0);
+		REQUIRE(cfg.overrides().empty());
+	}
+
+	SECTION("output value overrides can be set from constructor")
+	{
+		::gpiod::line_config cfg({
+			{
+				lineprop::OUTPUT_VALUES, mappings({
+					{ 0, value::ACTIVE },
+					{ 3, value::INACTIVE },
+					{ 1, value::ACTIVE }
+				})
+			}
+		});
+
+		REQUIRE(cfg.num_overrides() == 3);
+		auto overrides = cfg.overrides();
+		REQUIRE(overrides[0].first == 0);
+		REQUIRE(overrides[0].second == lineprop::OUTPUT_VALUE);
+		REQUIRE(overrides[1].first == 3);
+		REQUIRE(overrides[1].second == lineprop::OUTPUT_VALUE);
+		REQUIRE(overrides[2].first == 1);
+		REQUIRE(overrides[2].second == lineprop::OUTPUT_VALUE);
+	}
+}
+
+TEST_CASE("line_config overrides work")
+{
+	::gpiod::line_config cfg;
+
+	SECTION("direction")
+	{
+		cfg.set_direction_default(direction::AS_IS);
+		cfg.set_direction_override(direction::INPUT, 3);
+
+		REQUIRE(cfg.direction_is_overridden(3));
+		REQUIRE(cfg.direction_offset(3) == direction::INPUT);
+		cfg.clear_direction_override(3);
+		REQUIRE_FALSE(cfg.direction_is_overridden(3));
+		REQUIRE(cfg.direction_offset(3) == direction::AS_IS);
+	}
+
+	SECTION("edge detection")
+	{
+		cfg.set_edge_detection_default(edge::NONE);
+		cfg.set_edge_detection_override(edge::BOTH, 0);
+
+		REQUIRE(cfg.edge_detection_is_overridden(0));
+		REQUIRE(cfg.edge_detection_offset(0) == edge::BOTH);
+		cfg.clear_edge_detection_override(0);
+		REQUIRE_FALSE(cfg.edge_detection_is_overridden(0));
+		REQUIRE(cfg.edge_detection_offset(0) == edge::NONE);
+	}
+
+	SECTION("bias")
+	{
+		cfg.set_bias_default(bias::AS_IS);
+		cfg.set_bias_override(bias::PULL_DOWN, 3);
+
+		REQUIRE(cfg.bias_is_overridden(3));
+		REQUIRE(cfg.bias_offset(3) == bias::PULL_DOWN);
+		cfg.clear_bias_override(3);
+		REQUIRE_FALSE(cfg.bias_is_overridden(3));
+		REQUIRE(cfg.bias_offset(3) == bias::AS_IS);
+	}
+
+	SECTION("drive")
+	{
+		cfg.set_drive_default(drive::PUSH_PULL);
+		cfg.set_drive_override(drive::OPEN_DRAIN, 4);
+
+		REQUIRE(cfg.drive_is_overridden(4));
+		REQUIRE(cfg.drive_offset(4) == drive::OPEN_DRAIN);
+		cfg.clear_drive_override(4);
+		REQUIRE_FALSE(cfg.drive_is_overridden(4));
+		REQUIRE(cfg.drive_offset(4) == drive::PUSH_PULL);
+	}
+
+	SECTION("active-low")
+	{
+		cfg.set_active_low_default(false);
+		cfg.set_active_low_override(true, 16);
+
+		REQUIRE(cfg.active_low_is_overridden(16));
+		REQUIRE(cfg.active_low_offset(16));
+		cfg.clear_active_low_override(16);
+		REQUIRE_FALSE(cfg.active_low_is_overridden(16));
+		REQUIRE_FALSE(cfg.active_low_offset(16));
+	}
+
+	SECTION("debounce period")
+	{
+		/*
+		 * Test the chrono literals and implicit duration conversions
+		 * too.
+		 */
+
+		cfg.set_debounce_period_default(5000us);
+		cfg.set_debounce_period_override(3ms, 1);
+
+		REQUIRE(cfg.debounce_period_is_overridden(1));
+		REQUIRE(cfg.debounce_period_offset(1) == 3ms);
+		cfg.clear_debounce_period_override(1);
+		REQUIRE_FALSE(cfg.debounce_period_is_overridden(1));
+		REQUIRE(cfg.debounce_period_offset(1) == 5ms);
+	}
+
+	SECTION("event clock")
+	{
+		cfg.set_event_clock_default(clock_type::MONOTONIC);
+		cfg.set_event_clock_override(clock_type::REALTIME, 4);
+
+		REQUIRE(cfg.event_clock_is_overridden(4));
+		REQUIRE(cfg.event_clock_offset(4) == clock_type::REALTIME);
+		cfg.clear_event_clock_override(4);
+		REQUIRE_FALSE(cfg.event_clock_is_overridden(4));
+		REQUIRE(cfg.event_clock_offset(4) == clock_type::MONOTONIC);
+	}
+
+	SECTION("output value")
+	{
+		cfg.set_output_value_default(value::INACTIVE);
+		cfg.set_output_value_override(value::ACTIVE, 0);
+		cfg.set_output_values({ 1, 2, 8 }, { value::ACTIVE, value::ACTIVE, value::ACTIVE });
+		cfg.set_output_values({ { 17, value::ACTIVE }, { 21, value::ACTIVE } });
+
+		for (const auto& off: offsets({ 0, 1, 2, 8, 17, 21 })) {
+			REQUIRE(cfg.output_value_is_overridden(off));
+			REQUIRE(cfg.output_value_offset(off) == value::ACTIVE);
+			cfg.clear_output_value_override(off);
+			REQUIRE_FALSE(cfg.output_value_is_overridden(off));
+			REQUIRE(cfg.output_value_offset(off) == value::INACTIVE);
+		}
+	}
+}
+
+TEST_CASE("line_config can be moved", "[line-config]")
+{
+	::gpiod::line_config cfg({
+		{ lineprop::DIRECTION, direction::INPUT },
+		{ lineprop::EDGE, edge::BOTH },
+		{ lineprop::DEBOUNCE_PERIOD, 3000us },
+		{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
+	});
+
+	cfg.set_direction_override(direction::OUTPUT, 2);
+	cfg.set_edge_detection_override(edge::NONE, 2);
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(cfg));
+
+		REQUIRE(moved.direction_default() == direction::INPUT);
+		REQUIRE(moved.edge_detection_default() == edge::BOTH);
+		REQUIRE(moved.debounce_period_default() == 3000us);
+		REQUIRE(moved.event_clock_default() == clock_type::REALTIME);
+		REQUIRE(moved.direction_offset(2) == direction::OUTPUT);
+		REQUIRE(moved.edge_detection_offset(2) == edge::NONE);
+	}
+
+	SECTION("move constructor works")
+	{
+		::gpiod::line_config moved;
+
+		moved = ::std::move(cfg);
+
+		REQUIRE(moved.direction_default() == direction::INPUT);
+		REQUIRE(moved.edge_detection_default() == edge::BOTH);
+		REQUIRE(moved.debounce_period_default() == 3000us);
+		REQUIRE(moved.event_clock_default() == clock_type::REALTIME);
+		REQUIRE(moved.direction_offset(2) == direction::OUTPUT);
+		REQUIRE(moved.edge_detection_offset(2) == edge::NONE);
+	}
+}
+
+TEST_CASE("line_config stream insertion operator works", "[line-config]")
+{
+	::gpiod::line_config cfg({
+		{ lineprop::DIRECTION, direction::INPUT },
+		{ lineprop::EDGE, edge::BOTH },
+		{ lineprop::DEBOUNCE_PERIOD, 3000us },
+		{ lineprop::EVENT_CLOCK, clock_type::REALTIME },
+	});
+
+	cfg.set_direction_override(direction::OUTPUT, 2);
+	cfg.set_edge_detection_override(edge::NONE, 2);
+
+	::std::stringstream buf;
+
+	buf << cfg;
+
+	::std::string expected(
+		"line_config(defaults=(direction=INPUT, edge_detection=BOTH_EDGES, bias="
+		"AS_IS, drive=PUSH/PULL, active-high, debounce_period=3000us, event_clock="
+		"REALTIME, default_output_value=INACTIVE), overrides=[(offset=2 -> direction="
+		"OUTPUT), (offset=2 -> edge_detection=NONE)])"
+	);
+
+	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line-info.cpp b/bindings/cxx/tests/tests-line-info.cpp
new file mode 100644
index 0000000..2276c63
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-info.cpp
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <string>
+
+#include "helpers.hpp"
+#include "gpiosim.hpp"
+
+using property = ::gpiosim::chip::property;
+using line_name = ::gpiosim::chip::line_name;
+using line_hog = ::gpiosim::chip::line_hog;
+using hog_dir = ::gpiosim::chip::hog_direction;
+using direction = ::gpiod::line::direction;
+using edge = ::gpiod::line::edge;
+using bias = ::gpiod::line::bias;
+using drive = ::gpiod::line::drive;
+using event_clock = ::gpiod::line::clock;
+
+using namespace ::std::chrono_literals;
+
+namespace {
+
+TEST_CASE("get_line_info() works", "[chip][line-info]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(0, "foobar") },
+		{ property::HOG, line_hog(0, "hog", hog_dir::OUTPUT_HIGH ) }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("line_info can be retrieved from chip")
+	{
+		auto info = chip.get_line_info(0);
+
+		REQUIRE(info.offset() == 0);
+		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+		REQUIRE(info.used());
+		REQUIRE_THAT(info.consumer(), Catch::Equals("hog"));
+		REQUIRE(info.direction() == ::gpiod::line::direction::OUTPUT);
+		REQUIRE_FALSE(info.active_low());
+		REQUIRE(info.bias() == ::gpiod::line::bias::UNKNOWN);
+		REQUIRE(info.drive() == ::gpiod::line::drive::PUSH_PULL);
+		REQUIRE(info.edge_detection() == ::gpiod::line::edge::NONE);
+		REQUIRE(info.event_clock() == ::gpiod::line::clock::MONOTONIC);
+		REQUIRE_FALSE(info.debounced());
+		REQUIRE(info.debounce_period() == 0us);
+	}
+
+	SECTION("offset out of range")
+	{
+		REQUIRE_THROWS_AS(chip.get_line_info(8), ::std::invalid_argument);
+	}
+}
+
+TEST_CASE("line properties can be retrieved", "[line-info]")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 8 },
+		{ property::LINE_NAME, line_name(1, "foo") },
+		{ property::LINE_NAME, line_name(2, "bar") },
+		{ property::LINE_NAME, line_name(4, "baz") },
+		{ property::LINE_NAME, line_name(5, "xyz") },
+		{ property::HOG, line_hog(3, "hog3", hog_dir::OUTPUT_HIGH) },
+		{ property::HOG, line_hog(4, "hog4", hog_dir::OUTPUT_LOW) }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("basic properties")
+	{
+		auto info4 = chip.get_line_info(4);
+		auto info6 = chip.get_line_info(6);
+
+		REQUIRE(info4.offset() == 4);
+		REQUIRE_THAT(info4.name(), Catch::Equals("baz"));
+		REQUIRE(info4.used());
+		REQUIRE_THAT(info4.consumer(), Catch::Equals("hog4"));
+		REQUIRE(info4.direction() == direction::OUTPUT);
+		REQUIRE(info4.edge_detection() == edge::NONE);
+		REQUIRE_FALSE(info4.active_low());
+		REQUIRE(info4.bias() == bias::UNKNOWN);
+		REQUIRE(info4.drive() == drive::PUSH_PULL);
+		REQUIRE(info4.event_clock() == event_clock::MONOTONIC);
+		REQUIRE_FALSE(info4.debounced());
+		REQUIRE(info4.debounce_period() == 0us);
+	}
+}
+
+TEST_CASE("line_info can be copied and moved")
+{
+	::gpiosim::chip sim({
+		{ property::NUM_LINES, 4 },
+		{ property::LINE_NAME, line_name(2, "foobar") }
+	});
+
+	::gpiod::chip chip(sim.dev_path());
+	auto info = chip.get_line_info(2);
+
+	SECTION("copy constructor works")
+	{
+		auto copy(info);
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		/* info can still be used */
+		REQUIRE(info.offset() == 2);
+		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+	}
+
+	SECTION("assignment operator works")
+	{
+		auto copy = chip.get_line_info(0);
+		copy = info;
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+		/* info can still be used */
+		REQUIRE(info.offset() == 2);
+		REQUIRE_THAT(info.name(), Catch::Equals("foobar"));
+	}
+
+	SECTION("move constructor works")
+	{
+		auto copy(::std::move(info));
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+	}
+
+	SECTION("move assignment operator works")
+	{
+		auto copy = chip.get_line_info(0);
+		copy = ::std::move(info);
+		REQUIRE(copy.offset() == 2);
+		REQUIRE_THAT(copy.name(), Catch::Equals("foobar"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
new file mode 100644
index 0000000..4827b0b
--- /dev/null
+++ b/bindings/cxx/tests/tests-line-request.cpp
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <gpiod.hpp>
+#include <sstream>
+#include <stdexcept>
+#include <vector>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using simprop = ::gpiosim::chip::property;
+using reqprop = ::gpiod::request_config::property;
+using lineprop = ::gpiod::line_config::property;
+using offsets = ::gpiod::line::offsets;
+using values = ::gpiod::line::values;
+using direction = ::gpiod::line::direction;
+using value = ::gpiod::line::value;
+using simval = ::gpiosim::chip::value;
+using pull = ::gpiosim::chip::pull;
+
+namespace {
+
+class value_matcher : public Catch::MatcherBase<value>
+{
+public:
+	value_matcher(pull pull, bool active_low = false)
+		: _m_pull(pull),
+		  _m_active_low(active_low)
+	{
+
+	}
+
+	::std::string describe(void) const override
+	{
+		::std::string repr(this->_m_pull == pull::PULL_UP ? "PULL_UP" : "PULL_DOWN");
+		::std::string active_low = this->_m_active_low ? "(active-low) " : "";
+
+		return active_low + "corresponds with " + repr;
+	}
+
+	bool match(const value& val) const override
+	{
+		if (this->_m_active_low) {
+			if ((val == value::ACTIVE && this->_m_pull == pull::PULL_DOWN) ||
+			    (val == value::INACTIVE && this->_m_pull == pull::PULL_UP))
+				return true;
+		} else {
+			if ((val == value::ACTIVE && this->_m_pull == pull::PULL_UP) ||
+			    (val == value::INACTIVE && this->_m_pull == pull::PULL_DOWN))
+				return true;
+		}
+
+		return false;
+	}
+
+private:
+	pull _m_pull;
+	bool _m_active_low;
+};
+
+TEST_CASE("requesting lines fails with invalid arguments", "[line-request][chip]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	SECTION("no offsets")
+	{
+		REQUIRE_THROWS_AS(chip.request_lines(::gpiod::request_config(),
+						     ::gpiod::line_config()),
+				  ::std::invalid_argument);
+	}
+
+	SECTION("duplicate offsets")
+	{
+		REQUIRE_THROWS_MATCHES(chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2, 0, 0, 4 }) }
+			}),
+			::gpiod::line_config()),
+			::std::system_error,
+			 system_error_matcher(EBUSY)
+		);
+	}
+
+	SECTION("offset out of bounds")
+	{
+		REQUIRE_THROWS_AS(chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2, 0, 8, 4 }) }
+			}),
+			::gpiod::line_config()),
+			::std::invalid_argument
+		);
+	}
+}
+
+TEST_CASE("consumer string is set correctly", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
+	::gpiod::chip chip(sim.dev_path());
+	offsets offs({ 3, 0, 2 });
+
+	SECTION("set custom consumer")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2 }) },
+				{ reqprop::CONSUMER, "foobar" }
+			}),
+			::gpiod::line_config()
+		);
+
+		auto info = chip.get_line_info(2);
+
+		REQUIRE(info.used());
+		REQUIRE_THAT(info.consumer(), Catch::Equals("foobar"));
+	}
+
+	SECTION("empty consumer")
+	{
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 2 }) },
+			}),
+			::gpiod::line_config()
+		);
+
+		auto info = chip.get_line_info(2);
+
+		REQUIRE(info.used());
+		REQUIRE_THAT(info.consumer(), Catch::Equals("?"));
+	}
+}
+
+TEST_CASE("values can be read", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	const offsets offs({ 7, 1, 0, 6, 2 });
+
+	const ::std::vector<pull> pulls({
+		pull::PULL_UP,
+		pull::PULL_UP,
+		pull::PULL_DOWN,
+		pull::PULL_UP,
+		pull::PULL_DOWN
+	});
+
+	for (unsigned int i = 0; i < offs.size(); i++)
+		sim.set_pull(offs[i], pulls[i]);
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offs }
+		}),
+		::gpiod::line_config({
+			{ lineprop::DIRECTION, direction::INPUT }
+		})
+	);
+
+	SECTION("get all values (returning variant)")
+	{
+		auto vals = request.get_values();
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[3], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[4], value_matcher(pull::PULL_DOWN));
+	}
+
+	SECTION("get all values (passed buffer variant)")
+	{
+		values vals(5);
+
+		request.get_values(vals);
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[3], value_matcher(pull::PULL_UP));
+		REQUIRE_THAT(vals[4], value_matcher(pull::PULL_DOWN));
+	}
+
+	SECTION("get_values(buffer) throws for invalid buffer size")
+	{
+		values vals(4);
+		REQUIRE_THROWS_AS(request.get_values(vals), ::std::invalid_argument);
+		vals.resize(6);
+		REQUIRE_THROWS_AS(request.get_values(vals), ::std::invalid_argument);
+	}
+
+	SECTION("get a single value")
+	{
+		auto val = request.get_value(7);
+
+		REQUIRE_THAT(val, value_matcher(pull::PULL_UP));
+	}
+
+	SECTION("get a single value (active-low)")
+	{
+		request.reconfigure_lines(
+			::gpiod::line_config({
+				{ lineprop::ACTIVE_LOW, true }
+			})
+		);
+
+		auto val = request.get_value(7);
+
+		REQUIRE_THAT(val, value_matcher(pull::PULL_UP, true));
+	}
+
+	SECTION("get a subset of values (returning variant)")
+	{
+		auto vals = request.get_values(offsets({ 2, 0, 6 }));
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_UP));
+	}
+
+	SECTION("get a subset of values (passed buffer variant)")
+	{
+		values vals(3);
+
+		request.get_values(offsets({ 2, 0, 6 }), vals);
+
+		REQUIRE_THAT(vals[0], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[1], value_matcher(pull::PULL_DOWN));
+		REQUIRE_THAT(vals[2], value_matcher(pull::PULL_UP));
+	}
+}
+
+TEST_CASE("output values can be set at request time", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	const offsets offs({ 0, 1, 3, 4 });
+
+	::gpiod::request_config req_cfg({
+		{ reqprop::OFFSETS, offs }
+	});
+
+	::gpiod::line_config line_cfg({
+		{ lineprop::DIRECTION, direction::OUTPUT },
+		{ lineprop::OUTPUT_VALUE, value::ACTIVE }
+	});
+
+	SECTION("default output value")
+	{
+		auto request = chip.request_lines(req_cfg, line_cfg);
+
+		for (const auto& off: offs)
+			REQUIRE(sim.get_value(off) == simval::ACTIVE);
+
+		REQUIRE(sim.get_value(2) == simval::INACTIVE);
+	}
+
+	SECTION("overridden output value")
+	{
+		line_cfg.set_output_value_override(value::INACTIVE, 1);
+
+		auto request = chip.request_lines(req_cfg, line_cfg);
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(2) == simval::INACTIVE);
+		REQUIRE(sim.get_value(3) == simval::ACTIVE);
+		REQUIRE(sim.get_value(4) == simval::ACTIVE);
+	}
+}
+
+TEST_CASE("values can be set after requesting lines", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	const offsets offs({ 0, 1, 3, 4 });
+
+	::gpiod::request_config req_cfg({
+		{ reqprop::OFFSETS, offs }
+	});
+
+	::gpiod::line_config line_cfg({
+		{ lineprop::DIRECTION, direction::OUTPUT },
+		{ lineprop::OUTPUT_VALUE, value::INACTIVE }
+	});
+
+	auto request = chip.request_lines(req_cfg, line_cfg);
+
+	SECTION("set single value")
+	{
+		request.set_value(1, value::ACTIVE);
+
+		REQUIRE(sim.get_value(0) == simval::INACTIVE);
+		REQUIRE(sim.get_value(1) == simval::ACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+		REQUIRE(sim.get_value(4) == simval::INACTIVE);
+	}
+
+	SECTION("set all values")
+	{
+		request.set_values({
+			value::ACTIVE,
+			value::INACTIVE,
+			value::ACTIVE,
+			value::INACTIVE
+		});
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(3) == simval::ACTIVE);
+		REQUIRE(sim.get_value(4) == simval::INACTIVE);
+	}
+
+	SECTION("set a subset of values")
+	{
+		request.set_values({ 4, 3 }, { value::ACTIVE, value::INACTIVE });
+
+		REQUIRE(sim.get_value(0) == simval::INACTIVE);
+		REQUIRE(sim.get_value(1) == simval::INACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+		REQUIRE(sim.get_value(4) == simval::ACTIVE);
+	}
+
+	SECTION("set a subset of values with mappings")
+	{
+		request.set_values({
+			{ 0, value::ACTIVE },
+			{ 4, value::INACTIVE },
+			{ 1, value::ACTIVE}
+		});
+
+		REQUIRE(sim.get_value(0) == simval::ACTIVE);
+		REQUIRE(sim.get_value(1) == simval::ACTIVE);
+		REQUIRE(sim.get_value(3) == simval::INACTIVE);
+		REQUIRE(sim.get_value(4) == simval::INACTIVE);
+	}
+}
+
+TEST_CASE("line_request can be moved", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 8 }});
+	::gpiod::chip chip(sim.dev_path());
+	const offsets offs({ 3, 1, 0, 2 });
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offs }
+		}),
+		::gpiod::line_config()
+	);
+
+	auto fd = request.fd();
+
+	auto another = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 6 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(request));
+
+		REQUIRE(moved.fd() == fd);
+		REQUIRE_THAT(moved.offsets(), Catch::Equals(offs));
+	}
+
+	SECTION("move assignment operator works")
+	{
+		another = ::std::move(request);
+
+		REQUIRE(another.fd() == fd);
+		REQUIRE_THAT(another.offsets(), Catch::Equals(offs));
+	}
+}
+
+TEST_CASE("released request can no longer be used", "[line-request]")
+{
+	::gpiosim::chip sim;
+	::gpiod::chip chip(sim.dev_path());
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 0 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	request.release();
+
+	REQUIRE_THROWS_AS(request.offsets(), ::gpiod::request_released);
+}
+
+TEST_CASE("line_request survives parent chip", "[line-request][chip]")
+{
+	::gpiosim::chip sim;
+
+	sim.set_pull(0, pull::PULL_UP);
+
+	SECTION("chip is released")
+	{
+		::gpiod::chip chip(sim.dev_path());
+
+		auto request = chip.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0 }) }
+			}),
+			::gpiod::line_config({
+				{ lineprop::DIRECTION, direction::INPUT }
+			})
+		);
+
+		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+
+		chip.close();
+
+		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+	}
+
+	SECTION("chip goes out of scope")
+	{
+		/* Need to get the request object somehow. */
+		::gpiod::chip dummy(sim.dev_path());
+
+		auto request = dummy.request_lines(
+			::gpiod::request_config({
+				{ reqprop::OFFSETS, offsets({ 0 }) }
+			}),
+			::gpiod::line_config({
+				{ lineprop::DIRECTION, direction::INPUT }
+			})
+		);
+
+		request.release();
+		dummy.close();
+
+		{
+			::gpiod::chip chip(sim.dev_path());
+
+			request = chip.request_lines(
+				::gpiod::request_config({
+					{ reqprop::OFFSETS, offsets({ 0 }) }
+				}),
+				::gpiod::line_config({
+					{ lineprop::DIRECTION, direction::INPUT }
+				})
+			);
+
+			REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+		}
+
+		REQUIRE_THAT(request.get_value(0), value_matcher(pull::PULL_UP));
+	}
+}
+
+TEST_CASE("line_request stream insertion operator works", "[line-request]")
+{
+	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
+	::gpiod::chip chip(sim.dev_path());
+
+	auto request = chip.request_lines(
+		::gpiod::request_config({
+			{ reqprop::OFFSETS, offsets({ 3, 1, 0, 2 }) }
+		}),
+		::gpiod::line_config()
+	);
+
+	::std::stringstream buf, expected;
+
+	expected << "line_request(num_lines=4, line_offsets=[offsets([3, 1, 0, 2])], fd=" <<
+		    request.fd() << ")";
+
+	SECTION("active request")
+	{
+		buf << request;
+
+		REQUIRE_THAT(buf.str(), Catch::Equals(expected.str()));
+	}
+
+	SECTION("request released")
+	{
+		request.release();
+
+		buf << request;
+
+		REQUIRE_THAT(buf.str(), Catch::Equals("line_request(released)"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
deleted file mode 100644
index ababf8b..0000000
--- a/bindings/cxx/tests/tests-line.cpp
+++ /dev/null
@@ -1,467 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <catch2/catch.hpp>
-#include <gpiod.hpp>
-
-#include "gpio-mockup.hpp"
-
-using ::gpiod::test::mockup;
-
-namespace {
-
-const ::std::string consumer = "line-test";
-
-} /* namespace */
-
-TEST_CASE("Line information can be correctly retrieved", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(4);
-
-	SECTION("unexported line")
-	{
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.consumer().empty());
-		REQUIRE_FALSE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
-	}
-
-	SECTION("exported line")
-	{
-		::gpiod::line_request config;
-
-		config.consumer = consumer.c_str();
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		line.request(config);
-
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
-	}
-
-	SECTION("exported line with flags")
-	{
-		::gpiod::line_request config;
-
-		config.consumer = consumer.c_str();
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW |
-			       ::gpiod::line_request::FLAG_OPEN_DRAIN;
-		line.request(config);
-
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.is_active_low());
-		REQUIRE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
-	}
-
-	SECTION("exported open source line")
-	{
-		::gpiod::line_request config;
-
-		config.consumer = consumer.c_str();
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_OPEN_SOURCE;
-		line.request(config);
-
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_UNKNOWN);
-	}
-
-	SECTION("exported bias disable line")
-	{
-		::gpiod::line_request config;
-
-		config.consumer = consumer.c_str();
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_BIAS_DISABLED;
-		line.request(config);
-
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_DISABLED);
-	}
-
-	SECTION("exported pull-down line")
-	{
-		::gpiod::line_request config;
-
-		config.consumer = consumer.c_str();
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_BIAS_PULL_DOWN;
-		line.request(config);
-
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());;
-		REQUIRE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_DOWN);
-	}
-
-	SECTION("exported pull-up line")
-	{
-		::gpiod::line_request config;
-
-		config.consumer = consumer.c_str();
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_BIAS_PULL_UP;
-		line.request(config);
-
-		REQUIRE(line.offset() == 4);
-		REQUIRE(line.name() == "gpio-mockup-A-4");
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(line.is_used());
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
-	}
-}
-
-TEST_CASE("Line values can be set and read", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-
-	SECTION("get value (single line)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-		line.request(config);
-		REQUIRE(line.get_value() == 0);
-		mockup::instance().chip_set_pull(0, 3, 1);
-		REQUIRE(line.get_value() == 1);
-	}
-
-	SECTION("set value (single line)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		line.request(config);
-		line.set_value(1);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-		line.set_value(0);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
-	}
-
-	SECTION("set value with default value parameter")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		line.request(config, 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-	}
-
-	SECTION("get multiple values at once")
-	{
-		auto lines = chip.get_lines({ 0, 1, 2, 3, 4 });
-		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-		lines.request(config);
-		REQUIRE(lines.get_values() == ::std::vector<int>({ 0, 0, 0, 0, 0 }));
-		mockup::instance().chip_set_pull(0, 1, 1);
-		mockup::instance().chip_set_pull(0, 3, 1);
-		mockup::instance().chip_set_pull(0, 4, 1);
-		REQUIRE(lines.get_values() == ::std::vector<int>({ 0, 1, 0, 1, 1 }));
-	}
-
-	SECTION("set multiple values at once")
-	{
-		auto lines = chip.get_lines({ 0, 1, 2, 6, 7 });
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		lines.request(config);
-		lines.set_values({ 1, 1, 0, 1, 0 });
-		REQUIRE(mockup::instance().chip_get_value(0, 0) == 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 1) == 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 2) == 0);
-		REQUIRE(mockup::instance().chip_get_value(0, 6) == 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 7) == 0);
-	}
-
-	SECTION("set multiple values with default values parameter")
-	{
-		auto lines = chip.get_lines({ 1, 2, 4, 6, 7 });
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		lines.request(config, { 1, 1, 0, 1, 0 });
-		REQUIRE(mockup::instance().chip_get_value(0, 1) == 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 2) == 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 4) == 0);
-		REQUIRE(mockup::instance().chip_get_value(0, 6) == 1);
-		REQUIRE(mockup::instance().chip_get_value(0, 7) == 0);
-	}
-
-	SECTION("get value (single line, active-low")
-	{
-		auto line = chip.get_line(4);
-		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW;
-		line.request(config);
-		REQUIRE(line.get_value() == 1);
-		mockup::instance().chip_set_pull(0, 4, 1);
-		REQUIRE(line.get_value() == 0);
-	}
-
-	SECTION("set value (single line, active-low)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = ::gpiod::line_request::FLAG_ACTIVE_LOW;
-		line.request(config);
-		line.set_value(1);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
-		line.set_value(0);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-	}
-}
-
-TEST_CASE("Line can be reconfigured", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-
-	SECTION("set config (single line, active-state)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-		config.flags = 0;
-		line.request(config);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
-		REQUIRE_FALSE(line.is_active_low());
-
-		line.set_config(::gpiod::line_request::DIRECTION_OUTPUT,
-			::gpiod::line_request::FLAG_ACTIVE_LOW,1);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.is_active_low());
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
-		line.set_value(0);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-
-		line.set_config(::gpiod::line_request::DIRECTION_OUTPUT, 0);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
-		line.set_value(1);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-	}
-
-	SECTION("set flags (single line, active-state)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = 0;
-		line.request(config,1);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-
-		line.set_flags(::gpiod::line_request::FLAG_ACTIVE_LOW);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.is_active_low());
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 0);
-
-		line.set_flags(0);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE_FALSE(line.is_active_low());
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-	}
-
-	SECTION("set flags (single line, drive)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = 0;
-		line.request(config);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-
-		line.set_flags(::gpiod::line_request::FLAG_OPEN_DRAIN);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
-
-		line.set_flags(::gpiod::line_request::FLAG_OPEN_SOURCE);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
-
-		line.set_flags(0);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-	}
-
-	SECTION("set flags (single line, bias)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = 0;
-		line.request(config);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-
-		line.set_flags(::gpiod::line_request::FLAG_OPEN_DRAIN);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_DRAIN);
-
-		line.set_flags(::gpiod::line_request::FLAG_OPEN_SOURCE);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_OPEN_SOURCE);
-
-		line.set_flags(0);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
-	}
-
-	SECTION("set direction input (single line)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_OUTPUT;
-		config.flags = 0;
-		line.request(config);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		line.set_direction_input();
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
-	}
-
-	SECTION("set direction output (single line)")
-	{
-		auto line = chip.get_line(3);
-		config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-		config.flags = 0;
-		line.request(config);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_INPUT);
-		line.set_direction_output(1);
-		REQUIRE(line.direction() == ::gpiod::line::DIRECTION_OUTPUT);
-		REQUIRE(mockup::instance().chip_get_value(0, 3) == 1);
-	}
-}
-
-TEST_CASE("Exported line can be released", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(4);
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-
-	line.request(config);
-
-	REQUIRE(line.get_value() == 0);
-
-	line.release();
-
-	REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
-}
-
-TEST_CASE("Uninitialized GPIO line behaves correctly", "[line]")
-{
-	::gpiod::line line;
-
-	SECTION("uninitialized line is 'false'")
-	{
-		REQUIRE_FALSE(line);
-	}
-
-	SECTION("using uninitialized line throws logic_error")
-	{
-		REQUIRE_THROWS_AS(line.name(), ::std::logic_error);
-	}
-}
-
-TEST_CASE("Uninitialized GPIO line_bulk behaves correctly", "[line][bulk]")
-{
-	::gpiod::line_bulk bulk;
-
-	SECTION("uninitialized line_bulk is 'false'")
-	{
-		REQUIRE_FALSE(bulk);
-	}
-
-	SECTION("using uninitialized line_bulk throws logic_error")
-	{
-		REQUIRE_THROWS_AS(bulk.get(0), ::std::logic_error);
-	}
-}
-
-TEST_CASE("Cannot request the same line twice", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	::gpiod::line_request config;
-
-	config.consumer = consumer.c_str();
-	config.request_type = ::gpiod::line_request::DIRECTION_INPUT;
-
-	SECTION("two separate calls to request()")
-	{
-		auto line = chip.get_line(3);
-
-		REQUIRE_NOTHROW(line.request(config));
-		REQUIRE_THROWS_AS(line.request(config), ::std::system_error);
-	}
-
-	SECTION("request the same line twice in line_bulk")
-	{
-		/*
-		 * While a line_bulk object can hold two or more line objects
-		 * representing the same line - requesting it will fail.
-		 */
-		auto lines = chip.get_lines({ 2, 3, 4, 4 });
-
-		REQUIRE_THROWS_AS(lines.request(config), ::std::system_error);
-	}
-}
-
-TEST_CASE("Cannot get/set values of unrequested lines", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line = chip.get_line(3);
-
-	SECTION("get value")
-	{
-		REQUIRE_THROWS_AS(line.get_value(), ::std::system_error);
-	}
-
-	SECTION("set value")
-	{
-		REQUIRE_THROWS_AS(line.set_value(1), ::std::system_error);
-	}
-}
-
-TEST_CASE("Line objects can be compared")
-{
-	mockup::probe_guard mockup_chips({ 8 });
-	::gpiod::chip chip(mockup::instance().chip_path(0));
-	auto line1 = chip.get_line(3);
-	auto line2 = chip.get_line(3);
-	auto line3 = chip.get_line(4);
-
-	REQUIRE(line1 == line2);
-	REQUIRE(line2 != line3);
-}
diff --git a/bindings/cxx/tests/tests-misc.cpp b/bindings/cxx/tests/tests-misc.cpp
new file mode 100644
index 0000000..ba4920f
--- /dev/null
+++ b/bindings/cxx/tests/tests-misc.cpp
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <filesystem>
+#include <gpiod.hpp>
+#include <string>
+#include <regex>
+#include <unistd.h>
+
+#include "gpiosim.hpp"
+#include "helpers.hpp"
+
+using property = ::gpiosim::chip::property;
+
+namespace {
+
+class symlink_guard
+{
+public:
+	symlink_guard(const ::std::filesystem::path& target,
+		      const ::std::filesystem::path& link)
+		: _m_link(link)
+	{
+		::std::filesystem::create_symlink(target, this->_m_link);
+	}
+
+	~symlink_guard(void)
+	{
+		::std::filesystem::remove(this->_m_link);
+	}
+
+private:
+	::std::filesystem::path _m_link;
+};
+
+TEST_CASE("is_gpiochip_device() works", "[misc][chip]")
+{
+	SECTION("is_gpiochip_device() returns false for /dev/null")
+	{
+		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/null"));
+	}
+
+	SECTION("is_gpiochip_device() returns false for nonexistent file")
+	{
+		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/nonexistent"));
+	}
+
+	SECTION("is_gpiochip_device() returns true for a GPIO chip")
+	{
+		::gpiosim::chip sim;
+
+		REQUIRE(::gpiod::is_gpiochip_device(sim.dev_path()));
+	}
+
+	SECTION("is_gpiochip_device() can resolve a symlink")
+	{
+		::gpiosim::chip sim;
+		::std::string link("/tmp/gpiod-cxx-tmp-link.");
+
+		link += ::std::to_string(::getpid());
+
+		symlink_guard link_guard(sim.dev_path(), link);
+
+		REQUIRE(::gpiod::is_gpiochip_device(link));
+	}
+}
+
+TEST_CASE("version_string() returns a valid API version", "[misc]")
+{
+	SECTION("check version_string() format")
+	{
+		REQUIRE_THAT(::gpiod::version_string(),
+			     regex_matcher("^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$"));
+	}
+}
+
+} /* namespace */
diff --git a/bindings/cxx/tests/tests-request-config.cpp b/bindings/cxx/tests/tests-request-config.cpp
new file mode 100644
index 0000000..d1005b6
--- /dev/null
+++ b/bindings/cxx/tests/tests-request-config.cpp
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <catch2/catch.hpp>
+#include <cstddef>
+#include <gpiod.hpp>
+#include <string>
+#include <sstream>
+
+#include "helpers.hpp"
+
+using property = ::gpiod::request_config::property;
+using offsets = ::gpiod::line::offsets;
+
+namespace {
+
+TEST_CASE("request_config constructor works", "[request-config]")
+{
+	SECTION("no arguments")
+	{
+		::gpiod::request_config cfg;
+
+		REQUIRE(cfg.consumer().empty());
+		REQUIRE(cfg.offsets().empty());
+		REQUIRE(cfg.event_buffer_size() == 0);
+	}
+
+	SECTION("constructor with default settings")
+	{
+		offsets offsets({ 0, 1, 2, 3 });
+
+		::gpiod::request_config cfg({
+			{ property::CONSUMER, "foobar" },
+			{ property::OFFSETS, offsets},
+			{ property::EVENT_BUFFER_SIZE, 64 }
+		});
+
+		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
+		REQUIRE(cfg.event_buffer_size() == 64);
+	}
+
+	SECTION("invalid default value types passed to constructor")
+	{
+		REQUIRE_THROWS_AS(::gpiod::request_config({
+			{ property::CONSUMER, 42 }
+		}), ::std::invalid_argument);
+
+		REQUIRE_THROWS_AS(::gpiod::request_config({
+			{ property::OFFSETS, 42 }
+		}), ::std::invalid_argument);
+
+		REQUIRE_THROWS_AS(::gpiod::request_config({
+			{ property::EVENT_BUFFER_SIZE, "foobar" }
+		}), ::std::invalid_argument);
+	}
+}
+
+TEST_CASE("request_config can be moved", "[request-config]")
+{
+	offsets offsets({ 0, 1, 2, 3 });
+
+	::gpiod::request_config cfg({
+		{ property::CONSUMER, "foobar" },
+		{ property::OFFSETS, offsets },
+		{ property::EVENT_BUFFER_SIZE, 64 }
+	});
+
+	SECTION("move constructor works")
+	{
+		auto moved(::std::move(cfg));
+		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.offsets(), Catch::Equals(offsets));
+		REQUIRE(moved.event_buffer_size() == 64);
+	}
+
+	SECTION("move assignment operator works")
+	{
+		::gpiod::request_config moved;
+
+		moved = ::std::move(cfg);
+
+		REQUIRE_THAT(moved.consumer(), Catch::Equals("foobar"));
+		REQUIRE_THAT(moved.offsets(), Catch::Equals(offsets));
+		REQUIRE(moved.event_buffer_size() == 64);
+	}
+}
+
+TEST_CASE("request_config mutators work", "[request-config]")
+{
+	::gpiod::request_config cfg;
+
+	SECTION("set consumer")
+	{
+		cfg.set_consumer("foobar");
+		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+	}
+
+	SECTION("set offsets")
+	{
+		offsets offsets({ 3, 1, 2, 7, 5 });
+		cfg.set_offsets(offsets);
+		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
+	}
+
+	SECTION("set event_buffer_size")
+	{
+		cfg.set_event_buffer_size(128);
+		REQUIRE(cfg.event_buffer_size() == 128);
+	}
+}
+
+TEST_CASE("request_config generic property setting works", "[request-config]")
+{
+	::gpiod::request_config cfg;
+
+	SECTION("set consumer")
+	{
+		cfg.set_property(property::CONSUMER, "foobar");
+		REQUIRE_THAT(cfg.consumer(), Catch::Equals("foobar"));
+	}
+
+	SECTION("set offsets")
+	{
+		offsets offsets({ 3, 1, 2, 7, 5 });
+		cfg.set_property(property::OFFSETS, offsets);
+		REQUIRE_THAT(cfg.offsets(), Catch::Equals(offsets));
+	}
+
+	SECTION("set event_buffer_size")
+	{
+		cfg.set_property(property::EVENT_BUFFER_SIZE, 128);
+		REQUIRE(cfg.event_buffer_size() == 128);
+	}
+}
+
+TEST_CASE("request_config stream insertion operator works", "[request-config]")
+{
+	::gpiod::request_config cfg({
+		{ property::CONSUMER, "foobar" },
+		{ property::OFFSETS, offsets({ 0, 1, 2, 3 })},
+		{ property::EVENT_BUFFER_SIZE, 32 }
+	});
+
+	::std::stringstream buf;
+
+	buf << cfg;
+
+	::std::string expected("request_config(consumer='foobar', num_offsets=4, "
+			       "offsets=(offsets([0, 1, 2, 3])), event_buffer_size=32)");
+
+	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
+}
+
+} /* namespace */
diff --git a/configure.ac b/configure.ac
index f8d34ed..ab03673 100644
--- a/configure.ac
+++ b/configure.ac
@@ -239,6 +239,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
+		 bindings/cxx/gpiodcxx/Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
 		 bindings/python/Makefile
-- 
2.30.1

