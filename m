Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F85445A89
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 20:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhKDTZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 15:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhKDTZk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 15:25:40 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F4AC061714
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 12:23:01 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o29so1552247wms.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 12:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSsLPWOs6ZV/V93VqZkCzUpfuaX6P5s9b6MZkdhmFHk=;
        b=XKBDeI+uFbtMgygbvSOzlGX61dOk7U8Q66/OagianWyMOcnDmuD47cSodk33M1F3FA
         7IaAeNbzegXIdRH8tLJCklW4k/U7yFhtX1X0iAenlrBNpg5szQMPJ9UpvgY1AoYL2VCz
         TvmHe7UzDNQdftq5WuAt0TnYlejsaNaYRoHVdOxW3b/Ty4LPp9mnP+9/+CBw/HDh3oDq
         KNbTZ8yiOGqtWMnsHMB3lGnE8XPHG7/tkauj3M4U/cH5KpkKs4RTWTaN9rS0FF28j7N2
         wfFG3FtrqfQ0uEbDfYG5ENaam3jy6DU4y8oQqTJ0xUcQMLTSDTx8mGOU/KD7C6Xt2Rnf
         4c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSsLPWOs6ZV/V93VqZkCzUpfuaX6P5s9b6MZkdhmFHk=;
        b=ZjOyEGlRJLSmXgWBTUnH715ydLr/0KajH6y7TOC7t0RRiu1W5yaT/onwVh6JWv4jV1
         KJprTCKQXLUeRCUcqU0U0hMglT/WI7mVkTZoWCu+tKduJ4aZZmfNELqzO9fM9+ZiQh6L
         JIq4QFdI3m/ZtzNaadQSgjh6uN66Ox1F493my07PNchecQ0r6XVpekGtM62DEOIZ++Co
         LO2Hu78Ix2x/3/+FkQC/8CfAKjNRCCvlQRLf1fwK9jz4W1y9tgBG7rkyN+A24N2O4bqI
         boVmGVnUgOY7P/yrm6pR3fiMG4FinEghbs+16LTojHz2/169c6o9YYaFIaNmeYUZm0Bn
         YUlw==
X-Gm-Message-State: AOAM533nbuooAs8k76144Utv5ggHf9yyAIcllIcTeTGZ6BIwc2DiM2dI
        eUqK03811glZp1aTy84ywid9iQ==
X-Google-Smtp-Source: ABdhPJwlMHwFJChqWZO76PovGWtTqgiIBI3rZjSjnJGm2bR/9WP02wDjjIHDIL+JqfKHIki2x4bkkw==
X-Received: by 2002:a1c:27c1:: with SMTP id n184mr25085160wmn.190.1636053777655;
        Thu, 04 Nov 2021 12:22:57 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f3sm9290784wmb.12.2021.11.04.12.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:22:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v4 2/2] bindings: cxx: implement C++ bindings for libgpiod v2.0
Date:   Thu,  4 Nov 2021 20:22:52 +0100
Message-Id: <20211104192252.21883-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211104192252.21883-1-brgl@bgdev.pl>
References: <20211104192252.21883-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is the bulk of work implementing C++ bindings for the new libgpiod
API. The tests are not converted yet but the examples are fully
functional. More details in the cover letter as this patch will be
squashed with the one for the core C library anyway.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 Doxyfile.in                                 |   4 +-
 bindings/cxx/Makefile.am                    |  18 +-
 bindings/cxx/chip.cpp                       | 214 +++--
 bindings/cxx/edge-event-buffer.cpp          | 118 +++
 bindings/cxx/edge-event.cpp                 | 135 +++
 bindings/cxx/examples/Makefile.am           |  12 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |   9 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  62 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  39 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
 bindings/cxx/exception.cpp                  | 107 +++
 bindings/cxx/gpiod.hpp                      | 946 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  16 +
 bindings/cxx/gpiodcxx/chip.hpp              | 197 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 122 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 135 +++
 bindings/cxx/gpiodcxx/exception.hpp         | 149 +++
 bindings/cxx/gpiodcxx/info-event.hpp        | 115 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 445 +++++++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 169 ++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 214 +++++
 bindings/cxx/gpiodcxx/line.hpp              | 123 +++
 bindings/cxx/gpiodcxx/misc.hpp              |  44 +
 bindings/cxx/gpiodcxx/request-config.hpp    | 128 +++
 bindings/cxx/info-event.cpp                 | 102 +++
 bindings/cxx/internal.cpp                   |  91 ++
 bindings/cxx/internal.hpp                   | 188 +++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 589 ++++++++++++
 bindings/cxx/line-info.cpp                  | 199 ++++
 bindings/cxx/line-request.cpp               | 200 +++++
 bindings/cxx/line.cpp                       | 321 -------
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  20 +
 bindings/cxx/request-config.cpp             | 117 +++
 configure.ac                                |   1 +
 37 files changed, 3976 insertions(+), 1830 deletions(-)
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/exception.cpp
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
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
 create mode 100644 bindings/cxx/info-event.cpp
 create mode 100644 bindings/cxx/internal.cpp
 delete mode 100644 bindings/cxx/iter.cpp
 create mode 100644 bindings/cxx/line-config.cpp
 create mode 100644 bindings/cxx/line-info.cpp
 create mode 100644 bindings/cxx/line-request.cpp
 delete mode 100644 bindings/cxx/line.cpp
 delete mode 100644 bindings/cxx/line_bulk.cpp
 create mode 100644 bindings/cxx/misc.cpp
 create mode 100644 bindings/cxx/request-config.cpp

diff --git a/Doxyfile.in b/Doxyfile.in
index 22d4721..53e8c2b 100644
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
index d9fa577..de324d8 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -2,8 +2,20 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES = chip.cpp internal.h iter.cpp line.cpp line_bulk.cpp
-libgpiodcxx_la_CPPFLAGS = -Wall -Wextra -g -std=gnu++11
+libgpiodcxx_la_SOURCES = \
+	chip.cpp \
+	edge-event-buffer.cpp \
+	edge-event.cpp \
+	exception.cpp \
+	info-event.cpp \
+	internal.cpp \
+	internal.hpp \
+	line-config.cpp \
+	line-info.cpp \
+	line-request.cpp \
+	misc.cpp \
+	request-config.cpp
+libgpiodcxx_la_CPPFLAGS = -Wall -Wextra -g -std=gnu++17
 libgpiodcxx_la_CPPFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
 libgpiodcxx_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
@@ -13,7 +25,7 @@ include_HEADERS = gpiod.hpp
 pkgconfigdir = $(libdir)/pkgconfig
 pkgconfig_DATA = libgpiodcxx.pc
 
-SUBDIRS = .
+SUBDIRS = gpiodcxx .
 
 if WITH_TESTS
 
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index ee6ab6f..1527c60 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -2,10 +2,6 @@
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <functional>
-#include <gpiod.hpp>
-#include <map>
-#include <system_error>
-#include <utility>
 
 #include "internal.hpp"
 
@@ -13,145 +9,225 @@ namespace gpiod {
 
 namespace {
 
-GPIOD_CXX_API void chip_deleter(::gpiod_chip* chip)
+using chip_deleter = deleter<::gpiod_chip, ::gpiod_chip_close>;
+using chip_ptr = ::std::unique_ptr<::gpiod_chip, chip_deleter>;
+using get_info_func = ::std::function<::gpiod_line_info* (::gpiod_chip*, unsigned int)>;
+
+chip_ptr open_chip(const ::std::string& path)
 {
-	::gpiod_chip_unref(chip);
+	chip_ptr chip(::gpiod_chip_open(path.c_str()));
+	if (!chip)
+		throw_from_errno("unable to open the GPIO device " + path);
+
+	return chip;
 }
 
 } /* namespace */
 
-GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
+struct chip::impl
 {
-	return ::gpiod_is_gpiochip_device(path.c_str());
-}
+	impl(const ::std::string& path)
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
+
+	chip_ptr chip;
+};
 
 GPIOD_CXX_API chip::chip(const ::std::string& path)
-	: _m_chip()
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
+
+	return *this;
+}
+
+GPIOD_CXX_API chip::operator bool(void) const noexcept
+{
+	return this->_m_priv.get() != nullptr;
+}
 
-	this->_m_chip.reset(chip, chip_deleter);
+GPIOD_CXX_API void chip::close(void)
+{
+	this->_m_priv->throw_if_closed();
+
+	this->_m_priv->chip.reset();
 }
 
-GPIOD_CXX_API void chip::reset(void) noexcept
+GPIOD_CXX_API const char* chip::name(void) const
 {
-	this->_m_chip.reset();
+	this->_m_priv->throw_if_closed();
+
+	return ::gpiod_chip_get_name(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API ::std::string chip::name(void) const
+GPIOD_CXX_API const char* chip::label(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::std::string(::gpiod_chip_get_name(this->_m_chip.get()));
+	return ::gpiod_chip_get_label(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API ::std::string chip::label(void) const
+GPIOD_CXX_API const char* chip::path(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::std::string(::gpiod_chip_get_label(this->_m_chip.get()));
+	return ::gpiod_chip_get_path(this->_m_priv->chip.get());
 }
 
 GPIOD_CXX_API unsigned int chip::num_lines(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::gpiod_chip_get_num_lines(this->_m_chip.get());
+	return ::gpiod_chip_get_num_lines(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API line chip::get_line(unsigned int offset) const
+GPIOD_CXX_API line_info chip::get_line_info(unsigned int offset) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	if (offset >= this->num_lines())
-		throw ::std::out_of_range("line offset greater than the number of lines");
+	line_info_ptr info(::gpiod_chip_get_line_info(this->_m_priv->chip.get(), offset));
+	if (!info)
+		throw_from_errno("unable to retrieve GPIO line info");
 
-	::gpiod_line* line_handle = ::gpiod_chip_get_line(this->_m_chip.get(), offset);
-	if (!line_handle)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error getting GPIO line from chip");
+	line_info ret;
 
-	return line(line_handle, *this);
+	ret._m_priv->set_info_ptr(info);
+
+	return ret;
 }
 
-GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
+GPIOD_CXX_API line_info chip::watch_line_info(unsigned int offset) const
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
+void chip::unwatch_line_info(unsigned int offset) const
 {
-	line_bulk lines;
+	this->_m_priv->throw_if_closed();
 
-	for (auto& it: offsets)
-		lines.append(this->get_line(it));
+	int ret = ::gpiod_chip_unwatch_line_info(this->_m_priv->chip.get(), offset);
+	if (ret)
+		throw_from_errno("unable to unwatch line status changes");
+}
 
-	return lines;
+int chip::fd(void) const
+{
+	this->_m_priv->throw_if_closed();
+
+	return ::gpiod_chip_get_fd(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API line_bulk chip::get_all_lines(void) const
+GPIOD_CXX_API bool chip::info_event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
-	line_bulk lines;
+	this->_m_priv->throw_if_closed();
 
-	for (unsigned int i = 0; i < this->num_lines(); i++)
-		lines.append(this->get_line(i));
+	int ret = ::gpiod_chip_info_event_wait(this->_m_priv->chip.get(), timeout.count());
+	if (ret < 0)
+		throw_from_errno("error waiting for info events");
 
-	return lines;
+	return ret;
 }
 
-GPIOD_CXX_API bool chip::operator==(const chip& rhs) const noexcept
+GPIOD_CXX_API info_event chip::info_event_read(void) const
 {
-	return this->_m_chip.get() == rhs._m_chip.get();
+	this->_m_priv->throw_if_closed();
+
+	info_event_ptr event(gpiod_chip_info_event_read(this->_m_priv->chip.get()));
+	if (!event)
+		throw_from_errno("error reading the line info event_handle");
+
+	info_event ret;
+	ret._m_priv->event = ::std::move(event);
+
+	return ret;
 }
 
-GPIOD_CXX_API bool chip::operator!=(const chip& rhs) const noexcept
+GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
 {
-	return this->_m_chip.get() != rhs._m_chip.get();
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
 
-GPIOD_CXX_API chip::operator bool(void) const noexcept
+GPIOD_CXX_API line_request chip::request_lines(const request_config& req_cfg,
+					       const line_config& line_cfg)
 {
-	return this->_m_chip.get() != nullptr;
+	this->_m_priv->throw_if_closed();
+
+	line_request_ptr request(::gpiod_chip_request_lines(this->_m_priv->chip.get(),
+							    req_cfg._m_priv->config.get(),
+							    line_cfg._m_priv->config.get()));
+	if (!request)
+		throw_from_errno("error requesting GPIO lines");
+
+	line_request ret;
+	ret._m_priv->request = ::std::move(request);
+
+	return ret;
 }
 
-GPIOD_CXX_API bool chip::operator!(void) const noexcept
+GPIOD_CXX_API const line_config& chip::default_line_config(void)
 {
-	return this->_m_chip.get() == nullptr;
+	static const line_config ret;
+
+	return ret;
 }
 
-GPIOD_CXX_API void chip::throw_if_noref(void) const
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const chip& chip)
 {
-	if (!this->_m_chip.get())
-		throw ::std::logic_error("object not associated with an open GPIO chip");
+	out << "chip(path='" << chip.path() <<
+	       "', name='" << chip.name() <<
+	       "', label='" << chip.label() <<
+	       "', num_lines=" << chip.num_lines() << ")";
+
+	return out;
 }
 
 } /* namespace gpiod */
diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
new file mode 100644
index 0000000..a2da30a
--- /dev/null
+++ b/bindings/cxx/edge-event-buffer.cpp
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
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
+	int ret = ::gpiod_line_request_edge_event_read(request.get(),
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
+GPIOD_CXX_API edge_event_buffer::edge_event_buffer(unsigned int capacity)
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
+GPIOD_CXX_API unsigned int edge_event_buffer::num_events(void) const
+{
+	return ::gpiod_edge_event_buffer_num_events(this->_m_priv->buffer.get());
+}
+
+GPIOD_CXX_API unsigned int edge_event_buffer::capacity(void) const noexcept
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
+	for (edge_event_buffer::const_iterator it = buf.begin(); it != buf.end(); it++) {
+		out << *it;
+
+		if (::std::next(it) != buf.end())
+			out << ", ";
+	}
+
+	out << "])";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
new file mode 100644
index 0000000..a0a9bf1
--- /dev/null
+++ b/bindings/cxx/edge-event.cpp
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
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
+	{ edge_event::event_type::RISING_EDGE,		"RISING EDGE" },
+	{ edge_event::event_type::FALLING_EDGE,		"FALLING EDGE" }
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
+	return event_type_mapping.at(evtype);
+}
+
+GPIOD_CXX_API uint64_t edge_event::timestamp(void) const noexcept
+{
+	return ::gpiod_edge_event_get_timestamp(this->_m_priv->get_event_ptr());
+}
+
+GPIOD_CXX_API unsigned int edge_event::line_offset(void) const noexcept
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
+	       "', timestamp=" << event.timestamp() <<
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
index 872cd96..690a11d 100644
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
@@ -20,9 +19,9 @@ int main(int argc, char **argv)
 		if (::gpiod::is_gpiochip_device(entry.path())) {
 			::gpiod::chip chip(entry.path());
 
-			::std::cout << chip.name() << " ["
-				    << chip.label() << "] ("
-				    << chip.num_lines() << " lines)" << ::std::endl;
+			::std::cout << chip.name() << " [" <<
+				       chip.label() << "] (" <<
+				       chip.num_lines() << " lines)" << ::std::endl;
 		}
 	}
 
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
index 94b3dac..a066c71 100644
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -15,21 +15,15 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::std::vector<unsigned int> offsets;
+	::gpiod::line::offsets offsets;
 
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
+	auto request = chip.request_lines(::gpiod::request_config(offsets, "gpiogetcxx"));
 
-	lines.request({
-		argv[0],
-		::gpiod::line_request::DIRECTION_INPUT,
-		0
-	});
-
-	auto vals = lines.get_values();
+	auto vals = request.get_values();
 
 	for (auto& it: vals)
 		::std::cout << it << ' ';
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
index 2175adc..d7e5843 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -9,42 +9,50 @@
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
+	::std::cout << chip.name() << " - " << chip.num_lines() << " lines:" << ::std::endl;
 
-	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
-		if (::gpiod::is_gpiochip_device(entry.path())) {
-			::gpiod::chip chip(entry.path());
+	for (unsigned int offset = 0; offset < chip.num_lines(); offset++) {
+		auto info = chip.get_line_info(offset);
+
+		::std::cout << "\tline ";
+		::std::cout.width(3);
+		::std::cout << info.offset() << ": ";
+
+		::std::cout.width(12);
+		::std::cout << (info.name() ? info.name() : "unnamed");
+		::std::cout << " ";
 
-			::std::cout << chip.name() << " - " << chip.num_lines() << " lines:" << ::std::endl;
+		::std::cout.width(12);
+		::std::cout << (info.consumer() ? info.consumer() : "unused");
+		::std::cout << " ";
 
-			for (auto& lit: ::gpiod::line_iter(chip)) {
-				::std::cout << "\tline ";
-				::std::cout.width(3);
-				::std::cout << lit.offset() << ": ";
+		::std::cout.width(8);
+		::std::cout << (info.direction() == ::gpiod::line::direction::INPUT ? "input" : "output");
+		::std::cout << " ";
 
-				::std::cout.width(12);
-				::std::cout << (lit.name().empty() ? "unnamed" : lit.name());
-				::std::cout << " ";
+		::std::cout.width(10);
+		::std::cout << (info.active_low() ? "active-low" : "active-high");
 
-				::std::cout.width(12);
-				::std::cout << (lit.consumer().empty() ? "unused" : lit.consumer());
-				::std::cout << " ";
+		::std::cout << ::std::endl;
+	}
+}
 
-				::std::cout.width(8);
-				::std::cout << (lit.direction() == ::gpiod::line::DIRECTION_INPUT ? "input" : "output");
-				::std::cout << " ";
+} /* namespace */
 
-				::std::cout.width(10);
-				::std::cout << (lit.is_active_low() ? "active-low" : "active-high");
+int main(int argc, char **argv)
+{
+	if (argc != 1) {
+		::std::cerr << "usage: " << argv[0] << ::std::endl;
+		return EXIT_FAILURE;
+	}
 
-				::std::cout << ::std::endl;
-			}
-		}
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path()))
+			show_chip(::gpiod::chip(entry.path()));
 	}
 
 	return EXIT_SUCCESS;
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
index 4d6ac6e..fc5fbe5 100644
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
+	::std::cout << event.timestamp() / 1000000000;
 	::std::cout << ".";
-	::std::cout << event.timestamp.count() % 1000000000;
+	::std::cout << event.timestamp() % 1000000000;
 
-	::std::cout << " line: " << event.source.offset();
+	::std::cout << " line: " << event.line_offset();
 
 	::std::cout << ::std::endl;
 }
@@ -39,25 +37,24 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::std::vector<unsigned int> offsets;
+	::gpiod::line::offsets offsets;
 	offsets.reserve(argc);
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
+	auto request = chip.request_lines(::gpiod::request_config(offsets, "gpiomoncxx"),
+					  ::gpiod::line_config(::gpiod::line::direction::INPUT,
+							       ::gpiod::line::edge::BOTH));
 
-	lines.request({
-		argv[0],
-		::gpiod::line_request::EVENT_BOTH_EDGES,
-		0,
-	});
+	::gpiod::edge_event_buffer buffer;
 
 	for (;;) {
-		auto events = lines.event_wait(::std::chrono::seconds(1));
-		if (events) {
-			for (auto& it: events)
-				print_event(it.event_read());
+		if (request.edge_event_wait(::std::chrono::seconds(5))) {
+			request.edge_event_read(buffer);
+
+			for (const auto& event: buffer)
+				print_event(event);
 		}
 	}
 
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index 71b27a9..9c5820a 100644
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
@@ -27,20 +28,18 @@ int main(int argc, char **argv)
 		::std::string value(arg.substr(pos + 1, ::std::string::npos));
 
 		if (offset.empty() || value.empty())
-			throw ::std::invalid_argument("invalid argument: " + ::std::string(argv[i]));
+			throw ::std::invalid_argument("invalid offset=value mapping: " +
+						      ::std::string(argv[i]));
 
 		offsets.push_back(::std::stoul(offset));
 		values.push_back(::std::stoul(value));
 	}
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
+	auto request = chip.request_lines(::gpiod::request_config(offsets, "gpiosetcxx"),
+				::gpiod::line_config(::gpiod::line::direction::OUTPUT));
 
-	lines.request({
-		argv[0],
-		::gpiod::line_request::DIRECTION_OUTPUT,
-		0
-	}, values);
+	request.set_values(values);
 
 	::std::cin.get();
 
diff --git a/bindings/cxx/exception.cpp b/bindings/cxx/exception.cpp
new file mode 100644
index 0000000..7ac65f7
--- /dev/null
+++ b/bindings/cxx/exception.cpp
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+#include "gpiod.hpp"
+
+namespace gpiod {
+
+chip_closed::chip_closed(const ::std::string& what)
+	: ::std::logic_error(what)
+{
+
+}
+
+chip_closed::chip_closed(const chip_closed& other) noexcept
+	: ::std::logic_error(other)
+{
+
+}
+
+chip_closed& chip_closed::operator=(const chip_closed& other) noexcept
+{
+	::std::logic_error::operator=(other);
+
+	return *this;
+}
+
+chip_closed::~chip_closed(void)
+{
+
+}
+
+request_released::request_released(const ::std::string& what)
+	: ::std::logic_error(what)
+{
+
+}
+
+request_released::request_released(const request_released& other) noexcept
+	: ::std::logic_error(other)
+{
+
+}
+
+request_released& request_released::operator=(const request_released& other) noexcept
+{
+	::std::logic_error::operator=(other);
+
+	return *this;
+}
+
+request_released::~request_released(void)
+{
+
+}
+
+invalid_line_info_mapping::invalid_line_info_mapping(const ::std::string& what)
+	: ::std::runtime_error(what)
+{
+
+}
+
+invalid_line_info_mapping::invalid_line_info_mapping(const invalid_line_info_mapping& other) noexcept
+	: ::std::runtime_error(other)
+{
+
+}
+
+invalid_line_info_mapping&
+invalid_line_info_mapping::operator=(const invalid_line_info_mapping& other) noexcept
+{
+	::std::runtime_error::operator=(other);
+
+	return *this;
+}
+
+invalid_line_info_mapping::~invalid_line_info_mapping(void)
+{
+
+}
+
+invalid_line_config_mapping::invalid_line_config_mapping(const ::std::string& what)
+	: ::std::runtime_error(what)
+{
+
+}
+
+invalid_line_config_mapping::invalid_line_config_mapping(
+		const invalid_line_config_mapping& other) noexcept
+	: ::std::runtime_error(other)
+{
+
+}
+
+invalid_line_config_mapping&
+invalid_line_config_mapping::operator=(const invalid_line_config_mapping& other) noexcept
+{
+	::std::runtime_error::operator=(other);
+
+	return *this;
+}
+
+invalid_line_config_mapping::~invalid_line_config_mapping(void)
+{
+
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index e3ce2fc..fc0c2f6 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1,940 +1,30 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
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
-
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
- */
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
-
-/**
- * @brief Support for range-based loops for line iterators.
- * @param iter A line iterator.
- * @return New end iterator.
- */
-line_iter end(const line_iter& iter) noexcept;
-
-/**
- * @brief Allows to iterate over all lines owned by a GPIO chip.
- */
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
-
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
-
-/**
- * @}
- */
-
-} /* namespace gpiod */
+ * C++ bindings for libgpiod.
+ */
+
+#define __LIBGPIOD_GPIOD_CXX_INSIDE__
+#include "gpiodcxx/chip.hpp"
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
 
 #endif /* __LIBGPIOD_GPIOD_CXX_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
new file mode 100644
index 0000000..bde1282
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/Makefile.am
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+otherincludedir = $(includedir)/gpiodcxx
+otherinclude_HEADERS = \
+	chip.hpp \
+	edge-event-buffer.hpp \
+	edge-event.hpp \
+	exception.hpp \
+	info-event.hpp \
+	line.hpp \
+	line-config.hpp \
+	line-info.hpp \
+	line-request.hpp \
+	misc.hpp \
+	request-config.hpp
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
new file mode 100644
index 0000000..2816e87
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -0,0 +1,197 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+#include <iostream>
+#include <memory>
+#include <string>
+
+namespace gpiod {
+
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
+	explicit chip(const ::std::string& path);
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
+	 * @brief Get the name of this GPIO chip.
+	 * @return C string pointer to the chip name.
+	 */
+	const char* name(void) const;
+
+	/**
+	 * @brief Get the label of this GPIO chip.
+	 * @return C string pointer to the chip name.
+	 */
+	const char* label(void) const;
+
+	/**
+	 * @brief Get the filesystem path that was used to open this GPIO chip.
+	 * @return C string pointer to the chip's path.
+	 */
+	const char* path(void) const;
+
+	/**
+	 * @brief Return the number of lines exposed by this chip.
+	 * @return Number of lines.
+	 */
+	unsigned int num_lines(void) const;
+
+	/**
+	 * @brief Retrieve the current snapshot of line information for a
+	 *        single line.
+	 * @param offset Offset of the line to get the info for.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info get_line_info(unsigned int offset) const;
+
+	/**
+	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
+	 *        the line info and starts watching the line for changes.
+	 * @param offset Offset of the line to get the info for.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info watch_line_info(unsigned int offset) const;
+
+	/**
+	 * @brief Stop watching the line at given offset for info events.
+	 * @param offset Offset of the line to get the info for.
+	 */
+	void unwatch_line_info(unsigned int offset) const;
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
+	bool info_event_wait(const ::std::chrono::nanoseconds& timeout) const;
+
+	/**
+	 * @brief Read a single line status change event from this chip.
+	 * @return New info_event object.
+	 */
+	info_event info_event_read(void) const;
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
+				   const line_config& line_cfg = default_line_config());
+
+	/**
+	 * @brief Get the default line config object.
+	 * @return Reference to the default line config object.
+	 *
+	 * The default line configuration is: input, active-high, bias as-is,
+	 * no edge detection, push-pull drive (unused in input mode), no
+	 * debounce, monotonic event clock (unused with no edge detection).
+	 */
+	static const line_config& default_line_config(void);
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
+ * @param chip GPIO chip to print.
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
index 0000000..87da8ac
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+	edge_event_buffer(unsigned int capacity = 64);
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
+	unsigned int num_events(void) const;
+
+	/**
+	 * @brief Maximum capacity of the buffer.
+	 * @return Buffer capacity.
+	 */
+	unsigned int capacity(void) const noexcept;
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
index 0000000..0ea399e
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+	enum class event_type : unsigned int
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
+	uint64_t timestamp(void) const noexcept;
+
+	/**
+	 * @brief Read the offset of the line on which this event was
+	 *        registered.
+	 * @return Line offset.
+	 */
+	unsigned int line_offset(void) const noexcept;
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
+ * @param event Edge event to print.
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
index 0000000..cbfda50
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/exception.hpp
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+class chip_closed : public ::std::logic_error
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
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	chip_closed& operator=(const chip_closed& other) noexcept;
+
+	virtual ~chip_closed(void);
+};
+
+/**
+ * @brief Exception thrown when an already released line request is used.
+ */
+class request_released : public ::std::logic_error
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
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	request_released& operator=(const request_released& other) noexcept;
+
+	virtual ~request_released(void);
+};
+
+/**
+ * @brief Exception thrown when the core C library returns an invalid value
+ *        for any of the line_info properties.
+ */
+class invalid_line_info_mapping : public ::std::runtime_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit invalid_line_info_mapping(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	invalid_line_info_mapping(const invalid_line_info_mapping& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	invalid_line_info_mapping& operator=(const invalid_line_info_mapping& other) noexcept;
+
+	virtual ~invalid_line_info_mapping(void);
+};
+
+/**
+ * @brief Exception thrown when the core C library returns an invalid value
+ *        for any of the line_config properties.
+ */
+class invalid_line_config_mapping : public ::std::runtime_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit invalid_line_config_mapping(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	invalid_line_config_mapping(const invalid_line_config_mapping& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	invalid_line_config_mapping& operator=(const invalid_line_config_mapping& other) noexcept;
+
+	virtual ~invalid_line_config_mapping(void);
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
index 0000000..8efef3b
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+	enum class event_type : unsigned int
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
+	uint64_t timestamp(void) const noexcept;
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
index 0000000..5b64665
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -0,0 +1,445 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+#include <iostream>
+#include <memory>
+#include <utility>
+
+#include "misc.hpp"
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
+	 * @brief Constructor.
+	 * @param direction Global direction setting.
+	 * @param edge Global edge detection.
+	 * @param active_low Global active_low setting.
+	 * @param output_values Default output values.
+	 * @param bias Global bias setting.
+	 * @param drive Global drive setting.
+	 * @param debounce_period Global debounce period in microseconds.
+	 * @param clock Default event clock mode.
+	 */
+	line_config(line::direction direction = line::direction::INPUT,
+		    line::edge edge = line::edge::NONE,
+		    bool active_low = false,
+		    const line::value_mappings& output_values = no_output_values(),
+		    line::bias bias = line::bias::AS_IS,
+		    line::drive drive = line::drive::PUSH_PULL,
+		    unsigned long debounce_period = 0,
+		    line::clock clock = line::clock::MONOTONIC);
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
+	 * @brief Set the default direction setting.
+	 * @param direction New direction.
+	 */
+	void set_direction(line::direction direction);
+
+	/**
+	 * @brief Set the direction for a single line at given offset.
+	 * @param direction New direction.
+	 * @param offset Offset of the line for which to set the direction.
+	 */
+	void set_direction(line::direction direction, unsigned int offset);
+
+	/**
+	 * @brief Set the direction for a subset of offsets.
+	 * @param direction New direction.
+	 * @param offsets Vector of line offsets for which to set the direction.
+	 */
+	void set_direction(line::direction direction, const line::offsets& offsets);
+
+	/**
+	 * @brief Get the default direction setting.
+	 * @return Direction setting that would have been used for any offset
+	 * 	   not assigned its own direction value.
+	 */
+	line::direction direction(void) const;
+
+	/**
+	 * @brief Get the direction setting for a given offset.
+	 * @param offset Line offset for which to read the direction setting.
+	 * @return Direction setting that would have been used for given offset
+	 *         if the config object was used in a request at the time of
+	 *         the call.
+	 */
+	line::direction direction(unsigned int offset) const;
+
+	/**
+	 * @brief Set the default edge event detection.
+	 * @param edge Type of edge events to detect.
+	 */
+	void set_edge_detection(line::edge edge);
+
+	/**
+	 * @brief Set the edge event detection for a single line at given
+	 *        offset.
+	 * @param edge Type of edge events to detect.
+	 * @param offset Offset of the line for which to set the direction.
+	 */
+	void set_edge_detection(line::edge edge, unsigned int offset);
+
+	/**
+	 * @brief Set the edge event detection for a subset of offset.
+	 * @param edge Type of edge events to detect.
+	 * @param offsets Vector of line offsets for which to set the direction.
+	 */
+	void set_edge_detection(line::edge edge, const line::offsets& offsets);
+
+	/**
+	 * @brief Get the default edge detection setting.
+	 * @return Edge detection setting that would have been used for any
+	 *         offset not assigned its own direction value.
+	 */
+	line::edge edge_detection(void) const;
+
+	/**
+	 * @brief Get the edge event detection setting for a given offset.
+	 * @param offset Line offset for which to read the edge detection
+	 *               setting.
+	 * @return Edge event detection setting that would have been used for
+	 * 	   given offset if the config object was used in a request at
+	 * 	   the time of the call.
+	 */
+	line::edge edge_detection(unsigned int offset) const;
+
+	/**
+	 * @brief Set the default bias setting.
+	 * @param bias New bias.
+	 */
+	void set_bias(line::bias bias);
+
+	/**
+	 * @brief Set the bias for a single line at given offset.
+	 * @param bias New bias.
+	 * @param offset Offset of the line for which to set the bias.
+	 */
+	void set_bias(line::bias bias, unsigned int offset);
+
+	/**
+	 * @brief Set the bias for a subset of lines.
+	 * @param bias New bias.
+	 * @param offsets Vector of line offsets for which to set the bias.
+	 */
+	void set_bias(line::bias bias, const line::offsets& offsets);
+
+	/**
+	 * @brief Get the default bias setting.
+	 * @return Bias setting that would have been used for any offset not
+	 *         assigned its own direction value.
+	 */
+	line::bias bias(void) const;
+
+	/**
+	 * @brief Get the bias setting for a given offset.
+	 * @param offset Line offset for which to read the bias setting.
+	 * @return Bias setting that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::bias bias(unsigned int offset) const;
+
+	/**
+	 * @brief Set the default drive setting.
+	 * @param drive New drive.
+	 */
+	void set_drive(line::drive drive);
+
+	/**
+	 * @brief Set the drive for a single line at given offset.
+	 * @param drive New drive.
+	 * @param offset Offset of the line for which to set the drive.
+	 */
+	void set_drive(line::drive drive, unsigned int offset);
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
+	line::drive drive(void) const;
+
+	/**
+	 * @brief Get the drive setting for a given offset.
+	 * @param offset Line offset for which to read the drive setting.
+	 * @return Drive setting that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::drive drive(unsigned int offset) const;
+
+	/**
+	 * @brief Set lines to active-low by default.
+	 */
+	void set_active_low(void) noexcept;
+
+	/**
+	 * @brief Set a single line as active-low.
+	 * @param offset Offset of the line for which to set the active setting.
+	 */
+	void set_active_low(unsigned int offset) noexcept;
+
+	/**
+	 * @brief Set a subset of lines as active-low.
+	 * @param offsets Vector of offsets for which to set the active setting.
+	 */
+	void set_active_low(const line::offsets& offsets) noexcept;
+
+	/**
+	 * @brief Check if active-low is the default setting.
+	 * @return Active-low setting that would have been used for any offset
+         *         not assigned its own value.
+	 */
+	bool active_low(void) const noexcept;
+
+	/**
+	 * @brief Check if the line at given offset was configured as
+	 *        active-low.
+	 * @param offset Line offset for which to read the active-low setting.
+	 * @return Active-low setting that would have been used for given
+	 *         offset if the config object was used in a request at the
+	 *         time of the call.
+	 */
+	bool active_low(unsigned int offset) const noexcept;
+
+	/**
+	 * @brief Set lines to active-high by default.
+	 */
+	void set_active_high(void) noexcept;
+
+	/**
+	 * @brief Set a single line as active-high.
+	 * @param offset Offset of the line for which to set the active setting.
+	 */
+	void set_active_high(unsigned int offset) noexcept;
+
+	/**
+	 * @brief Set a subset of lines as active-high.
+	 * @param offsets Vector of offsets for which to set the active setting.
+	 */
+	void set_active_high(const line::offsets& offsets) noexcept;
+
+	/**
+	 * @brief Set the default debounce period.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 */
+	void set_debounce_period_us(unsigned long period) noexcept;
+
+	/**
+	 * @brief Set the debounce period for a single line at given offset.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 * @param offset Offset of the line for which to set the debounce
+	 *               period.
+	 */
+	void set_debounce_period_us(unsigned long period, unsigned int offset) noexcept;
+
+	/**
+	 * @brief Set the debounce period for a subset of offsets.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 * @param offsets Vector of line offsets for which to set the debounce
+	 *               period.
+	 */
+	void set_debounce_period_us(unsigned long period, const line::offsets& offsets) noexcept;
+
+	/**
+	 * @brief Get the default debounce period.
+	 * @return Debounce period that would have been used for any offset not
+	 *         assigned its own debounce period. 0 if not debouncing is
+	 *         disabled.
+	 */
+	unsigned long debounce_period_us(void) const noexcept;
+
+	/**
+	 * @brief Get the debounce period for a given offset.
+	 * @param offset Line offset for which to read the debounce period.
+	 * @return Debounce period that would have been used for given offset
+	 *         if the config object was used in a request at the time of
+	 *         the call. 0 if debouncing is disabled.
+	 */
+	unsigned long debounce_period_us(unsigned int offset) const noexcept;
+
+	/**
+	 * @brief Set the default event timestamp clock.
+	 * @param clock New clock to use.
+	 */
+	void set_event_clock(line::clock clock);
+
+	/**
+	 * @brief Set the event clock for a single line at given offset.
+	 * @param clock New clock to use.
+	 * @param offset Offset of the line for which to set the event clock
+	 *               type.
+	 */
+	void set_event_clock(line::clock clock, unsigned int offset);
+
+	/**
+	 * @brief Set the event clock for a subset of offsets.
+	 * @param clock New clock to use.
+	 * @param offsets Vector of line offsets for which to set the clock.
+	 */
+	void set_event_clock(line::clock clock, const line::offsets& offsets);
+
+	/**
+	 * @brief Get the default event clock setting.
+	 * @return Event clock setting that would have been used for any offset
+	 *         not assigned its own direction value.
+	 */
+	line::clock event_clock(void) const;
+
+	/**
+	 * @brief Get the event clock setting for a given offset.
+	 * @param offset Line offset for which to read the event clock setting.
+	 * @return Event clock setting that would have been used for given
+	 *         offset if the config object was used in a request at the
+	 *         time of the call.
+	 */
+	line::clock event_clock(unsigned int offset) const;
+
+	/**
+	 * @brief Set the default output value.
+	 * @param value New value.
+	 */
+	void set_output_value(int value) noexcept;
+
+	/**
+	 * @brief Set the output value for a single offset.
+	 * @param offset Line offset to associate the value with.
+	 * @param value New value.
+	 */
+	void set_output_value(unsigned int offset, int value) noexcept;
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
+	int output_value(void) const noexcept;
+
+	/**
+	 * @brief Get the output value configured for a given line.
+	 * @param offset Line offset for which to read the value.
+	 * @return Output value that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	int output_value(unsigned int offset) const noexcept;
+
+	/**
+	 * @brief Get the number of offsets for which this config object
+	 *        contains at least one setting that is different from the
+	 *        defaults.
+	 * @return Number of offsets with at least one overridden setting.
+	 */
+	unsigned int num_overridden_offsets(void) const noexcept;
+
+	/**
+	 * @brief Get the offsets for which this config object contains at
+	 *        least one setting that is different from the defaults.
+	 * @return Vector of line offsets with at least one overridden setting.
+	 */
+	line::offsets overridden_offsets(void) const;
+
+	/**
+	 * @brief Convenience helper value for passing an empty list of
+	 *        offset-to-value mappings to methods of this class.
+	 * @return Empty line->value mapping vector.
+	 */
+	static const line::value_mappings& no_output_values(void);
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
+ * @param config Line config object to print.
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
index 0000000..9eca8bb
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+	unsigned int offset(void) const noexcept;
+
+	/**
+	 * @brief Get the GPIO line name.
+	 * @return Name of the GPIO line as it is represented in the kernel.
+	 *         This routine returns an empty string if the line is unnamed.
+	 */
+	const char* name(void) const noexcept;
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
+	const char* consumer(void) const noexcept;
+
+	/**
+	 * @brief Read the GPIO line direction setting.
+	 * @return Returns DIRECTION_INPUT or DIRECTION_OUTPUT.
+	 */
+	line::direction direction(void) const;
+
+	/**
+	 * @brief Check if the signal of this line is inverted.
+	 * @return True if this line is "active-low", false otherwise.
+	 */
+	bool active_low(void) const noexcept;
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
+	 * @brief Read the current edge detection setting of this line.
+	 * @return Returns EDGE_NONE, EDGE_RISING, EDGE_FALLING or EDGE_BOTH.
+	 */
+	line::edge edge_detection(void) const;
+
+	/**
+	 * @brief Read the current event clock setting used for edge event
+	 *        timestamps.
+	 * @return Returns MONOTONIC or REALTIME.
+	 */
+	line::clock event_clock(void) const;
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
+	unsigned long debounce_period(void) const noexcept;
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
index 0000000..16162ae
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -0,0 +1,214 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+	unsigned int num_lines(void) const;
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
+	int get_value(unsigned int offset);
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
+	void set_value(unsigned int offset, int value);
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
+	bool edge_event_wait(const ::std::chrono::nanoseconds& timeout) const;
+
+	/**
+	 * @brief Read a number of edge events from this request up to the
+	 *        maximum capacity of the buffer.
+	 * @param buffer Edge event buffer to read events into.
+	 * @return Number of events read.
+	 */
+	unsigned int edge_event_read(edge_event_buffer& buffer);
+
+	/**
+	 * @brief Read a number of edge events from this request.
+	 * @param buffer Edge event buffer to read events into.
+	 * @param max_events Maximum number of events to read. Limited by the
+	 *                   capacity of the buffer.
+	 * @return Number of events read.
+	 */
+	unsigned int edge_event_read(edge_event_buffer& buffer, unsigned int max_events);
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
index 0000000..4de4ff0
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
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
+ * @brief Direction settings.
+ */
+enum class direction : unsigned int
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
+ * @brief Internal bias settings.
+ */
+enum class bias : unsigned int
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
+enum class drive : unsigned int
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
+ * @brief Edge detection settings.
+ */
+enum class edge : unsigned int
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
+ * @brief Event clock settings.
+ */
+enum class clock : unsigned int
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
+using offsets = ::std::vector<unsigned int>;
+
+/**
+ * @brief Vector of line values.
+ */
+using values = ::std::vector<int>;
+
+/**
+ * @brief Vector of offset->value mappings. Each mapping is defined as a pair
+ *        of an unsigned and signed integers.
+ */
+using value_mappings = ::std::vector<::std::pair<unsigned int, int>>;
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
index 0000000..315e5b8
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
+bool is_gpiochip_device(const ::std::string& path);
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
index 0000000..6e274c0
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -0,0 +1,128 @@
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
+#include <iostream>
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
+	 * @brief Constructor.
+	 * @param offsets Vector of line offsets to request.
+	 * @param consumer Consumer name.
+	 * @param event_buffer_size Event buffer size.
+	 */
+	request_config(const line::offsets& offsets = line::offsets(),
+		       const ::std::string& consumer = ::std::string(),
+		       unsigned int event_buffer_size = 0);
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
+	 * @brief Set the consumer name.
+	 * @param consumer New consumer name.
+	 */
+	void set_consumer(const ::std::string& consumer) noexcept;
+
+	/**
+	 * @brief Get the consumer name.
+	 * @return Currently configured consumer name. May be NULL.
+	 */
+	const char* consumer(void) const noexcept;
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
+	unsigned int num_offsets(void) const noexcept;
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
+	void set_event_buffer_size(unsigned int event_buffer_size) noexcept;
+
+	/**
+	 * @brief Get the edge event buffer size from this request config.
+	 * @return Current edge event buffer size setting.
+	 */
+	unsigned int event_buffer_size(void) const noexcept;
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
+::std::ostream& operator<<(::std::ostream& out, const request_config& config);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__ */
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
new file mode 100644
index 0000000..51508c6
--- /dev/null
+++ b/bindings/cxx/info-event.cpp
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
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
+	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::event_type::LINE_RELEASED },
+	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::event_type::LINE_CONFIG_CHANGED }
+};
+
+const ::std::map<info_event::event_type, ::std::string> event_type_names = {
+	{ info_event::event_type::LINE_REQUESTED,	"LINE REQUESTED" },
+	{ info_event::event_type::LINE_RELEASED,	"LINE REQUESTED" },
+	{ info_event::event_type::LINE_CONFIG_CHANGED,	"LINE CONFIG_CHANGED" }
+};
+
+} /* namespace */
+
+void info_event::impl::set_info_event_ptr(info_event_ptr& new_event)
+{
+	::gpiod_line_info *info = ::gpiod_info_event_get_line_info(new_event.get());
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
+	return event_type_mapping.at(type);
+}
+
+GPIOD_CXX_API uint64_t info_event::timestamp(void) const noexcept
+{
+	return ::gpiod_info_event_get_timestamp(this->_m_priv->event.get());
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
+	       "', timestamp=" << event.timestamp() <<
+	       ", line_info=" << event.get_line_info() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/internal.cpp b/bindings/cxx/internal.cpp
new file mode 100644
index 0000000..e70a7c9
--- /dev/null
+++ b/bindings/cxx/internal.cpp
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <stdexcept>
+#include <system_error>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<line::direction, ::std::string> direction_names = {
+	{ line::direction::INPUT,	"INPUT" },
+	{ line::direction::OUTPUT,	"OUTPUT" }
+};
+
+const ::std::map<line::bias, ::std::string> bias_names = {
+	{ line::bias::UNKNOWN,		"UNKNOWN" },
+	{ line::bias::DISABLED,		"DISABLED" },
+	{ line::bias::PULL_UP,		"PULL UP" },
+	{ line::bias::PULL_DOWN,	"PULL DOWN" }
+};
+
+const ::std::map<line::drive, ::std::string> drive_names = {
+	{ line::drive::PUSH_PULL,	"PUSH/PULL" },
+	{ line::drive::OPEN_DRAIN,	"OPEN DRAIN" },
+	{ line::drive::OPEN_SOURCE,	"OPEN SOURCE" }
+};
+
+const ::std::map<line::edge, ::std::string> edge_names = {
+	{ line::edge::NONE,		"NONE" },
+	{ line::edge::RISING,		"RISING EDGE" },
+	{ line::edge::FALLING,		"FALLING EDGE" },
+	{ line::edge::BOTH,		"BOTH EDGES" }
+};
+
+const ::std::map<line::clock, ::std::string> clock_names = {
+	{ line::clock::MONOTONIC,	"MONOTONIC" },
+	{ line::clock::REALTIME,	"REALTIME" }
+};
+
+} /* namespace */
+
+namespace line {
+
+const ::std::string& direction_str(line::direction direction)
+{
+	return direction_names.at(direction);
+}
+
+const ::std::string& bias_str(line::bias bias)
+{
+	return bias_names.at(bias);
+}
+
+const ::std::string& drive_str(line::drive drive)
+{
+	return drive_names.at(drive);
+}
+
+const ::std::string& edge_str(line::edge edge)
+{
+	return edge_names.at(edge);
+}
+
+const ::std::string& clock_str(line::clock clock)
+{
+	return clock_names.at(clock);
+}
+
+} /* namespace line */
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
index 9406d30..66aaec7 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -1,9 +1,189 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
 /* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
 
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
+#define GPIOD_CXX_API		__attribute__((visibility("default")))
+#define GPIOD_CXX_UNUSED	__attribute__((unused))
+
+namespace gpiod {
+
+void throw_from_errno(const ::std::string& what);
+
+template<class gpiod_type, void free_func(gpiod_type*)> struct deleter
+{
+	void operator()(gpiod_type* ptr)
+	{
+		free_func(ptr);
+	}
+};
+
+template<typename T>
+::std::ostream& operator<<(::std::ostream& out, const ::std::vector<T>& vec)
+{
+	::std::copy(vec.begin(), vec.end(), ::std::ostream_iterator<T>(out, ","));
+
+	return out;
+}
+
+namespace line {
+
+const ::std::string& direction_str(line::direction direction);
+const ::std::string& bias_str(line::bias bias);
+const ::std::string& drive_str(line::drive drive);
+const ::std::string& edge_str(line::edge edge);
+const ::std::string& clock_str(line::clock clock);
+
+} /* namespace line */
+
+using line_info_deleter = deleter<::gpiod_line_info, ::gpiod_line_info_free>;
+using info_event_deleter = deleter<::gpiod_info_event, ::gpiod_info_event_free>;
+using line_config_deleter = deleter<::gpiod_line_config, ::gpiod_line_config_free>;
+using request_config_deleter = deleter<::gpiod_request_config, ::gpiod_request_config_free>;
+using line_request_deleter = deleter<::gpiod_line_request, ::gpiod_line_request_release>;
+using edge_event_deleter = deleter<::gpiod_edge_event, ::gpiod_edge_event_free>;
+using edge_event_buffer_deleter = deleter<::gpiod_edge_event_buffer,
+					  ::gpiod_edge_event_buffer_free>;
+
+using line_info_ptr = ::std::unique_ptr<::gpiod_line_info, line_info_deleter>;
+using info_event_ptr = ::std::unique_ptr<::gpiod_info_event, info_event_deleter>;
+using line_config_ptr = ::std::unique_ptr<::gpiod_line_config, line_config_deleter>;
+using request_config_ptr = ::std::unique_ptr<::gpiod_request_config, request_config_deleter>;
+using line_request_ptr = ::std::unique_ptr<::gpiod_line_request, line_request_deleter>;
+using edge_event_ptr = ::std::unique_ptr<::gpiod_edge_event, edge_event_deleter>;
+using edge_event_buffer_ptr = ::std::unique_ptr<::gpiod_edge_event_buffer,
+						edge_event_buffer_deleter>;
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
+
+	line_request_ptr request;
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
+	::gpiod_edge_event* get_event_ptr(void) const noexcept;
+	::std::shared_ptr<impl> copy(const ::std::shared_ptr<impl>& self) const;
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
+	::gpiod_edge_event* get_event_ptr(void) const noexcept;
+	::std::shared_ptr<impl> copy(const ::std::shared_ptr<impl>& self) const;
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
index 0000000..4995380
--- /dev/null
+++ b/bindings/cxx/line-config.cpp
@@ -0,0 +1,589 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
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
+const ::std::map<line::direction, ::std::string> direction_names = {
+	{ line::direction::AS_IS,	"AS IS" },
+	{ line::direction::INPUT,	"INPUT" },
+	{ line::direction::OUTPUT,	"OUTPUT" }
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
+const ::std::map<line::edge, ::std::string> edge_names = {
+	{ line::edge::NONE,		"NONE" },
+	{ line::edge::FALLING,		"FALLING EDGE" },
+	{ line::edge::RISING,		"RISING EDGE" },
+	{ line::edge::BOTH,		"BOTH EDGES" }
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
+const ::std::map<line::bias, ::std::string> bias_names = {
+	{ line::bias::AS_IS,		"AS IS" },
+	{ line::bias::DISABLED,		"DISABLED" },
+	{ line::bias::PULL_UP,		"PULL-UP" },
+	{ line::bias::PULL_DOWN,	"PULL-DOWN" }
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
+const ::std::map<line::drive, ::std::string> drive_names = {
+	{ line::drive::PUSH_PULL,	"PUSH-PULL" },
+	{ line::drive::OPEN_DRAIN,	"OPEN DRAIN" },
+	{ line::drive::OPEN_SOURCE,	"OPEN SOURCE" }
+};
+
+const ::std::map<int, line::drive> reverse_drive_mapping = make_reverse_maping(drive_mapping);
+
+const ::std::map<line::clock, int> clock_mapping = {
+	{ line::clock::MONOTONIC,	GPIOD_LINE_EVENT_CLOCK_MONOTONIC },
+	{ line::clock::REALTIME,	GPIOD_LINE_EVENT_CLOCK_REALTIME },
+};
+
+const ::std::map<line::clock, ::std::string> clock_names = {
+	{ line::clock::MONOTONIC,	"MONOTONIC" },
+	{ line::clock::REALTIME,	"REALTIME" }
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
+void set_mapped_value_offset(::gpiod_line_config* config, enum_type value, unsigned int offset,
+			     const ::std::map<enum_type, int>& mapping)
+{
+	int mapped_val = do_map_value(value, mapping);
+
+	set_func(config, mapped_val, offset);
+}
+
+template<class enum_type,
+	 void set_func(::gpiod_line_config*, int, unsigned int, const unsigned int*)>
+void set_mapped_value_subset(::gpiod_line_config* config, enum_type value,
+		      const line::offsets& offsets, const ::std::map<enum_type, int>& mapping)
+{
+	int mapped_val = do_map_value(value, mapping);
+
+	set_func(config, mapped_val, offsets.size(), offsets.data());
+}
+
+template<class ret_type>
+ret_type do_get_mapped_value(int mapped_val, const ::std::map<int, ret_type>& mapping)
+{
+	return map_setting<int, ret_type, invalid_line_config_mapping>(mapped_val, mapping);
+}
+
+template<class ret_type, int get_func(::gpiod_line_config*)>
+ret_type get_mapped_value_default(::gpiod_line_config* config,
+				  const ::std::map<int, ret_type>& mapping)
+{
+	int mapped_val = get_func(config);
+
+	return do_get_mapped_value<ret_type>(mapped_val, mapping);
+}
+
+template<class ret_type, int get_func(::gpiod_line_config*, unsigned int)>
+ret_type get_mapped_value_offset(::gpiod_line_config* config, unsigned int offset,
+				 const ::std::map<int, ret_type>& mapping)
+{
+	int mapped_val = get_func(config, offset);
+
+	return do_get_mapped_value<ret_type>(mapped_val, mapping);
+}
+
+} /* namespace */
+
+line_config::impl::impl(void)
+	: config(make_line_config())
+{
+
+}
+
+GPIOD_CXX_API line_config::line_config(line::direction direction, line::edge edge,
+				       bool active_low, const line::value_mappings& output_values,
+				       line::bias bias, line::drive drive,
+				       unsigned long debounce_period, line::clock clock)
+	: _m_priv(new impl)
+{
+	this->set_direction(direction);
+	this->set_edge_detection(edge);
+	this->set_output_values(output_values);
+	active_low ? this->set_active_low() : this->set_active_high();
+	this->set_bias(bias);
+	this->set_drive(drive);
+	this->set_debounce_period_us(debounce_period);
+	this->set_event_clock(clock);
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
+GPIOD_CXX_API void line_config::set_direction(line::direction direction)
+{
+	set_mapped_value_default<line::direction,
+				 ::gpiod_line_config_set_direction_default>(this->_m_priv->config.get(),
+									    direction, direction_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_direction(line::direction direction, unsigned int offset)
+{
+	set_mapped_value_offset<line::direction,
+				::gpiod_line_config_set_direction_offset>(this->_m_priv->config.get(),
+									  direction, offset,
+									  direction_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_direction(line::direction direction, const line::offsets& offsets)
+{
+	set_mapped_value_subset<line::direction,
+				::gpiod_line_config_set_direction_subset>(this->_m_priv->config.get(),
+									  direction, offsets,
+									  direction_mapping);
+}
+
+GPIOD_CXX_API line::direction line_config::direction(void) const
+{
+	return get_mapped_value_default<line::direction,
+					::gpiod_line_config_get_direction_default>(
+							this->_m_priv->config.get(),
+							reverse_direction_mapping);
+}
+
+GPIOD_CXX_API line::direction line_config::direction(unsigned int offset) const
+{
+	return get_mapped_value_offset<line::direction,
+				       ::gpiod_line_config_get_direction_offset>(
+						       this->_m_priv->config.get(),
+						       offset, reverse_direction_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_edge_detection(line::edge edge)
+{
+	set_mapped_value_default<line::edge,
+				 ::gpiod_line_config_set_edge_detection_default>(
+						 this->_m_priv->config.get(),
+						 edge, edge_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_edge_detection(line::edge edge, unsigned int offset)
+{
+	set_mapped_value_offset<line::edge,
+				::gpiod_line_config_set_edge_detection_offset>(
+						this->_m_priv->config.get(),
+						edge, offset, edge_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_edge_detection(line::edge edge, const line::offsets& offsets)
+{
+	set_mapped_value_subset<line::edge,
+				::gpiod_line_config_set_edge_detection_subset>(
+						this->_m_priv->config.get(),
+						edge, offsets, edge_mapping);
+}
+
+GPIOD_CXX_API line::edge line_config::edge_detection(void) const
+{
+	return get_mapped_value_default<line::edge,
+					::gpiod_line_config_get_edge_detection_default>(
+							this->_m_priv->config.get(),
+							reverse_edge_mapping);
+}
+
+GPIOD_CXX_API line::edge line_config::edge_detection(unsigned int offset) const
+{
+	return get_mapped_value_offset<line::edge,
+				       ::gpiod_line_config_get_edge_detection_offset>(
+						       this->_m_priv->config.get(),
+						       offset, reverse_edge_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_bias(line::bias bias)
+{
+	set_mapped_value_default<line::bias,
+				 ::gpiod_line_config_set_bias_default>(this->_m_priv->config.get(),
+								       bias, bias_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_bias(line::bias bias, unsigned int offset)
+{
+	set_mapped_value_offset<line::bias,
+				::gpiod_line_config_set_bias_offset>(this->_m_priv->config.get(),
+								     bias, offset, bias_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_bias(line::bias bias, const line::offsets& offsets)
+{
+	set_mapped_value_subset<line::bias,
+				::gpiod_line_config_set_bias_subset>(this->_m_priv->config.get(),
+								     bias, offsets, bias_mapping);
+}
+
+GPIOD_CXX_API line::bias line_config::bias(void) const
+{
+	return get_mapped_value_default<line::bias,
+					::gpiod_line_config_get_bias_default>(this->_m_priv->config.get(),
+									      reverse_bias_mapping);
+}
+
+GPIOD_CXX_API line::bias line_config::bias(unsigned int offset) const
+{
+	return get_mapped_value_offset<line::bias,
+				       ::gpiod_line_config_get_bias_offset>(this->_m_priv->config.get(),
+									    offset, reverse_bias_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_drive(line::drive drive)
+{
+	set_mapped_value_default<line::drive,
+				 ::gpiod_line_config_set_drive_default>(this->_m_priv->config.get(),
+									drive, drive_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_drive(line::drive drive, unsigned int offset)
+{
+	set_mapped_value_offset<line::drive,
+				::gpiod_line_config_set_drive_offset>(this->_m_priv->config.get(),
+								      drive, offset, drive_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_drive(line::drive drive, const line::offsets& offsets)
+{
+	set_mapped_value_subset<line::drive,
+				::gpiod_line_config_set_drive_subset>(this->_m_priv->config.get(),
+								      drive, offsets, drive_mapping);
+}
+
+GPIOD_CXX_API line::drive line_config::drive(void) const
+{
+	return get_mapped_value_default<line::drive,
+					::gpiod_line_config_get_drive_default>(this->_m_priv->config.get(),
+									       reverse_drive_mapping);
+}
+
+GPIOD_CXX_API line::drive line_config::drive(unsigned int offset) const
+{
+	return get_mapped_value_offset<line::drive,
+				       ::gpiod_line_config_get_drive_offset>(this->_m_priv->config.get(),
+									     offset, reverse_drive_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_active_low(void) noexcept
+{
+	::gpiod_line_config_set_active_low_default(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API void line_config::set_active_low(unsigned int offset) noexcept
+{
+	::gpiod_line_config_set_active_high_offset(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_active_low(const line::offsets& offsets) noexcept
+{
+	::gpiod_line_config_set_active_low_subset(this->_m_priv->config.get(),
+						  offsets.size(), offsets.data());
+}
+
+GPIOD_CXX_API bool line_config::active_low(void) const noexcept
+{
+	return ::gpiod_line_config_get_active_low_default(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API bool line_config::active_low(unsigned int offset) const noexcept
+{
+	return ::gpiod_line_config_get_active_low_offset(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_active_high(void) noexcept
+{
+	::gpiod_line_config_set_active_high_default(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API void line_config::set_active_high(unsigned int offset) noexcept
+{
+	::gpiod_line_config_set_active_high_offset(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_active_high(const line::offsets& offsets) noexcept
+{
+	::gpiod_line_config_set_active_high_subset(this->_m_priv->config.get(),
+						   offsets.size(), offsets.data());
+}
+
+GPIOD_CXX_API void line_config::set_debounce_period_us(unsigned long period) noexcept
+{
+	::gpiod_line_config_set_debounce_period_us_default(this->_m_priv->config.get(), period);
+}
+
+GPIOD_CXX_API void line_config::set_debounce_period_us(unsigned long period, unsigned int offset) noexcept
+{
+	::gpiod_line_config_set_debounce_period_us_offset(this->_m_priv->config.get(),
+							  period, offset);
+}
+
+GPIOD_CXX_API void line_config::set_debounce_period_us(unsigned long period,
+						       const line::offsets& offsets) noexcept
+{
+	::gpiod_line_config_set_debounce_period_us_subset(this->_m_priv->config.get(), period,
+							  offsets.size(), offsets.data());
+}
+
+GPIOD_CXX_API unsigned long line_config::debounce_period_us(void) const noexcept
+{
+	return ::gpiod_line_config_get_debounce_period_us_default(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API unsigned long line_config::debounce_period_us(unsigned int offset) const noexcept
+{
+	return ::gpiod_line_config_get_debounce_period_us_offset(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API void line_config::set_event_clock(line::clock clock)
+{
+	set_mapped_value_default<line::clock,
+				 ::gpiod_line_config_set_event_clock_default>(this->_m_priv->config.get(),
+									      clock, clock_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_event_clock(line::clock clock, unsigned int offset)
+{
+	set_mapped_value_offset<line::clock,
+				::gpiod_line_config_set_event_clock_offset>(this->_m_priv->config.get(),
+									    clock, offset, clock_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_event_clock(line::clock clock, const line::offsets& offsets)
+{
+	set_mapped_value_subset<line::clock,
+				::gpiod_line_config_set_event_clock_subset>(this->_m_priv->config.get(),
+									    clock, offsets, clock_mapping);
+}
+
+GPIOD_CXX_API line::clock line_config::event_clock(void) const
+{
+	return get_mapped_value_default<line::clock,
+					::gpiod_line_config_get_event_clock_default>(
+							this->_m_priv->config.get(),
+							reverse_clock_mapping);
+}
+
+GPIOD_CXX_API line::clock line_config::event_clock(unsigned int offset) const
+{
+	return get_mapped_value_offset<line::clock,
+					::gpiod_line_config_get_event_clock_offset>(
+							this->_m_priv->config.get(),
+							offset, reverse_clock_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_output_value(int value) noexcept
+{
+	::gpiod_line_config_set_output_value_default(this->_m_priv->config.get(), value);
+}
+
+GPIOD_CXX_API void line_config::set_output_value(unsigned int offset, int value) noexcept
+{
+	::gpiod_line_config_set_output_value_offset(this->_m_priv->config.get(), offset, value);
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
+	::gpiod_line_config_set_output_values(this->_m_priv->config.get(), offsets.size(),
+					      offsets.data(), values.data());
+}
+
+GPIOD_CXX_API int line_config::output_value(void) const noexcept
+{
+	return ::gpiod_line_config_get_output_value_default(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API int line_config::output_value(unsigned int offset) const noexcept
+{
+	return ::gpiod_line_config_get_output_value_offset(this->_m_priv->config.get(), offset);
+}
+
+GPIOD_CXX_API unsigned int line_config::num_overridden_offsets(void) const noexcept
+{
+	return ::gpiod_line_config_get_num_overridden_offsets(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API line::offsets line_config::overridden_offsets(void) const
+{
+	line::offsets ret(this->num_overridden_offsets());
+
+	::gpiod_line_config_get_overridden_offsets(this->_m_priv->config.get(), ret.data());
+
+	return ret;
+}
+
+GPIOD_CXX_API const line::value_mappings& line_config::no_output_values(void)
+{
+	static const line::value_mappings ret;
+
+	return ret;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_config& config)
+{
+	out << "line_config(defaults=(direction=" << direction_names.at(config.direction()) <<
+	       "edge_detection=" << edge_names.at(config.edge_detection()) <<
+	       "bias=" << bias_names.at(config.bias()) <<
+	       "drive=" << drive_names.at(config.drive()) <<
+	       (config.active_low() ? "active-low" : "active-high") <<
+	       "debounce_period=" << config.debounce_period_us() << "us" <<
+	       "event_clock=" << clock_names.at(config.event_clock()) <<
+	       "default_output_value=" << config.output_value() <<
+	       ")";
+
+	if (config.num_overridden_offsets()) {
+		out << "overrides=[";
+
+		for (const auto& offset: config.overridden_offsets()) {
+			out << "(offset=" << offset <<
+			       "direction=" << direction_names.at(config.direction(offset)) <<
+			       "edge_detection=" << edge_names.at(config.edge_detection(offset)) <<
+			       "bias=" << bias_names.at(config.bias(offset)) <<
+			       "drive=" << drive_names.at(config.drive(offset)) <<
+			       (config.active_low(offset) ? "active-low" : "active-high") <<
+			       "debounce_period=" << config.debounce_period_us(offset) <<
+			       "event_clock=" << clock_names.at(config.event_clock(offset)) <<
+			       "output_value=" << config.output_value(offset) <<
+			       ")";
+		}
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
index 0000000..c91c4a5
--- /dev/null
+++ b/bindings/cxx/line-info.cpp
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
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
+template<class enum_type> enum_type
+map_setting(int value, const ::std::map<int, enum_type>& mapping)
+{
+	enum_type ret;
+
+	try {
+		ret = mapping.at(value);
+	} catch (const ::std::out_of_range& err) {
+		throw invalid_line_info_mapping(::std::string("invalid value for ") +
+						typeid(enum_type).name());
+	}
+
+	return ret;
+}
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
+GPIOD_CXX_API unsigned int line_info::offset(void) const noexcept
+{
+	return ::gpiod_line_info_get_offset(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API const char* line_info::name(void) const noexcept
+{
+	return ::gpiod_line_info_get_name(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API bool line_info::used(void) const noexcept
+{
+	return ::gpiod_line_info_is_used(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API const char* line_info::consumer(void) const noexcept
+{
+	return ::gpiod_line_info_get_consumer(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API line::direction line_info::direction(void) const
+{
+	int direction = ::gpiod_line_info_get_direction(this->_m_priv->info.get());
+
+	return map_setting(direction, direction_mapping);
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
+line::clock line_info::event_clock(void) const
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
+GPIOD_CXX_API unsigned long line_info::debounce_period(void) const  noexcept
+{
+	return ::gpiod_line_info_get_debounce_period_us(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_info& info)
+{
+	::std::string name, consumer;
+
+	name = info.name() ? ::std::string("'") + info.name() + "'" : "unnamed";
+	consumer = info.consumer() ? ::std::string("'") + info.name() + "'" : "unused";
+
+	out << "line_info(offset=" << info.offset() <<
+	       ", name=" << name <<
+	       ", used=" << ::std::boolalpha << info.used() <<
+	       ", consumer=" << consumer <<
+	       ", direction=" << line::direction_str(info.direction()) <<
+	       ", active_low=" << ::std::boolalpha << info.active_low() <<
+	       ", bias=" << line::bias_str(info.bias()) <<
+	       ", drive=" << line::drive_str(info.drive()) <<
+	       ", edge_detection=" << line::edge_str(info.edge_detection()) <<
+	       ", event_clock=" << line::clock_str(info.event_clock()) <<
+	       ", debounced=" << ::std::boolalpha << info.debounced();
+
+	if (info.debounced())
+		out << ", debounce_period=" << info.debounce_period();
+
+	out << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
new file mode 100644
index 0000000..098c671
--- /dev/null
+++ b/bindings/cxx/line-request.cpp
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
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
+		throw ::std::logic_error("GPIO lines have been released");
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
+	return !!this->_m_priv;
+}
+
+GPIOD_CXX_API void line_request::release(void)
+{
+	this->_m_priv->throw_if_released();
+
+	this->_m_priv->request.reset();
+}
+
+GPIOD_CXX_API unsigned int line_request::num_lines(void) const
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
+	line::offsets offsets(this->num_lines());
+
+	::gpiod_line_request_get_offsets(this->_m_priv->request.get(), offsets.data());
+
+	return offsets;
+}
+
+GPIOD_CXX_API int line_request::get_value(unsigned int offset)
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
+	if (offsets.size() > values.size())
+		throw ::std::invalid_argument("values must have the same size as the offsets");
+
+	int ret = ::gpiod_line_request_get_values_subset(this->_m_priv->request.get(), offsets.size(),
+						  offsets.data(), values.data());
+	if (ret)
+		throw_from_errno("unable to retrieve line values");
+}
+
+GPIOD_CXX_API void line_request::get_values(line::values& values)
+{
+	this->get_values(this->offsets(), values);
+}
+
+GPIOD_CXX_API void line_request::line_request::set_value(unsigned int offset, int value)
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
+	int ret = ::gpiod_line_request_set_values_subset(this->_m_priv->request.get(),
+						  offsets.size(), offsets.data(), values.data());
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
+GPIOD_CXX_API bool line_request::edge_event_wait(const ::std::chrono::nanoseconds& timeout) const
+{
+	this->_m_priv->throw_if_released();
+
+	int ret = ::gpiod_line_request_edge_event_wait(this->_m_priv->request.get(),
+						       timeout.count());
+	if (ret < 0)
+		throw_from_errno("error waiting for edge events");
+
+	return ret;
+}
+
+GPIOD_CXX_API unsigned int
+line_request::edge_event_read(edge_event_buffer& buffer)
+{
+	return this->edge_event_read(buffer, buffer.capacity());
+}
+
+GPIOD_CXX_API unsigned int
+line_request::edge_event_read(edge_event_buffer& buffer, unsigned int max_events)
+{
+	this->_m_priv->throw_if_released();
+
+	return buffer._m_priv->read_events(this->_m_priv->request, max_events);
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_request& request)
+{
+	out << "line_request(num_lines=" << request.num_lines() <<
+	       ", line_offsets=[" << request.offsets() <<
+	       "], fd=" << request.fd() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
deleted file mode 100644
index cfcf2fb..0000000
--- a/bindings/cxx/line.cpp
+++ /dev/null
@@ -1,321 +0,0 @@
-// SPDX-License-Identifier: LGPL-3.0-or-later
-// SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-#include <gpiod.hpp>
-#include <array>
-#include <map>
-#include <system_error>
-
-#include "internal.hpp"
-
-namespace gpiod {
-
-namespace {
-
-const ::std::map<int, int> drive_mapping = {
-	{ GPIOD_LINE_DRIVE_PUSH_PULL,	line::DRIVE_PUSH_PULL, },
-	{ GPIOD_LINE_DRIVE_OPEN_DRAIN,	line::DRIVE_OPEN_DRAIN, },
-	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,	line::DRIVE_OPEN_SOURCE, },
-};
-
-const ::std::map<int, int> bias_mapping = {
-	{ GPIOD_LINE_BIAS_UNKNOWN,	line::BIAS_UNKNOWN, },
-	{ GPIOD_LINE_BIAS_DISABLED,	line::BIAS_DISABLED, },
-	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
-	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
-};
-
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
-
-	bulk.set_flags(flags);
-}
-
-GPIOD_CXX_API void line::set_direction_input() const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	bulk.set_direction_input();
-}
-
-GPIOD_CXX_API void line::set_direction_output(int value) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	bulk.set_direction_output({ value });
-}
-
-GPIOD_CXX_API bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
-{
-	this->throw_if_null();
-
-	line_bulk bulk({ *this });
-
-	line_bulk event_bulk = bulk.event_wait(timeout);
-
-	return !!event_bulk;
-}
-
-GPIOD_CXX_API line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
-{
-	line_event ret;
-
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
-}
-
-GPIOD_CXX_API line_event line::event_read(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
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
-}
-
-GPIOD_CXX_API ::std::vector<line_event> line::event_read_multiple(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	/* 16 is the maximum number of events stored in the kernel FIFO. */
-	::std::array<::gpiod_line_event, 16> event_buf;
-	::std::vector<line_event> events;
-	int rv;
-
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
-}
-
-GPIOD_CXX_API int line::event_get_fd(void) const
-{
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
-
-GPIOD_CXX_API const chip line::get_chip(void) const
-{
-	return chip(this->_m_owner);
-}
-
-GPIOD_CXX_API void line::reset(void)
-{
-	this->_m_line = nullptr;
-	this->_m_owner.reset();
-}
-
-GPIOD_CXX_API bool line::operator==(const line& rhs) const noexcept
-{
-	return this->_m_line == rhs._m_line;
-}
-
-GPIOD_CXX_API bool line::operator!=(const line& rhs) const noexcept
-{
-	return this->_m_line != rhs._m_line;
-}
-
-GPIOD_CXX_API line::operator bool(void) const noexcept
-{
-	return this->_m_line != nullptr;
-}
-
-GPIOD_CXX_API bool line::operator!(void) const noexcept
-{
-	return this->_m_line == nullptr;
-}
-
-GPIOD_CXX_API void line::throw_if_null(void) const
-{
-	if (!this->_m_line)
-		throw ::std::logic_error("object not holding a GPIO line handle");
-}
-
-GPIOD_CXX_API line::chip_guard::chip_guard(const line& line)
-	: _m_chip(line._m_owner)
-{
-
-}
-
-} /* namespace gpiod */
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
index 0000000..b8fc28e
--- /dev/null
+++ b/bindings/cxx/misc.cpp
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
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
index 0000000..a4fe37b
--- /dev/null
+++ b/bindings/cxx/request-config.cpp
@@ -0,0 +1,117 @@
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
+::gpiod_request_config* make_request_config(void)
+{
+	::gpiod_request_config* config;
+
+	config = ::gpiod_request_config_new();
+	if (!config)
+		throw_from_errno("Unable to allocate the request config object");
+
+	return config;
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
+GPIOD_CXX_API request_config::request_config(const line::offsets& offsets,
+					     const ::std::string& consumer,
+					     unsigned int event_buffer_size)
+	: _m_priv(new impl)
+{
+	this->set_consumer(consumer);
+	this->set_offsets(offsets);
+	this->set_event_buffer_size(event_buffer_size);
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
+GPIOD_CXX_API void
+request_config::set_consumer(const ::std::string& consumer) noexcept
+{
+	::gpiod_request_config_set_consumer(this->_m_priv->config.get(), consumer.c_str());
+}
+
+GPIOD_CXX_API const char* request_config::consumer(void) const noexcept
+{
+	return ::gpiod_request_config_get_consumer(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API void request_config::set_offsets(const line::offsets& offsets) noexcept
+{
+	::gpiod_request_config_set_offsets(this->_m_priv->config.get(),
+					   offsets.size(), offsets.data());
+}
+
+GPIOD_CXX_API unsigned int request_config::num_offsets(void) const noexcept
+{
+	return ::gpiod_request_config_get_num_offsets(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API line::offsets request_config::offsets(void) const
+{
+	line::offsets ret(this->num_offsets());
+
+	::gpiod_request_config_get_offsets(this->_m_priv->config.get(), ret.data());
+
+	return ret;
+}
+
+GPIOD_CXX_API void
+request_config::set_event_buffer_size(unsigned int event_buffer_size) noexcept
+{
+	::gpiod_request_config_set_event_buffer_size(this->_m_priv->config.get(),
+						     event_buffer_size);
+}
+
+GPIOD_CXX_API unsigned int request_config::event_buffer_size(void) const noexcept
+{
+	return ::gpiod_request_config_get_event_buffer_size(this->_m_priv->config.get());
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const request_config& config)
+{
+	::std::string consumer;
+
+	consumer = config.consumer() ? ::std::string("'") + config.consumer() + "'" : "N/A";
+
+	out << "request_config(consumer=" << consumer <<
+	       ", num_offsets=" << config.num_offsets() <<
+	       ", offsets=(" << config.offsets() <<
+	       ", event_buffer_size=" << config.event_buffer_size() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/configure.ac b/configure.ac
index ce6de99..b524880 100644
--- a/configure.ac
+++ b/configure.ac
@@ -227,6 +227,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
+		 bindings/cxx/gpiodcxx/Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
 		 bindings/python/Makefile
-- 
2.30.1

