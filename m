Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19F23CAD9A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 22:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344600AbhGOUNK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 16:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344387AbhGOUNF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 16:13:05 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E924C0613E6
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d12so9300387wre.13
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NirutUfKLotE+7x4bPUEo2jciNsESo3Y9atRufgg2ZY=;
        b=BSxrYcWm0i0corryink8MHI6vmj/ShbWhADnTkbssSw0ysNaur6AJMuh/a/6AG9EtK
         ICzlDBl4VoahAnoSPDdlKc/5if96kW6w6f44d5Z0tAA0GBM+GqXhyZRpLCexs0AjkTnR
         429V42e9BESf/7Pz7w2j1H7ggMk+0K79TvhCDEZ8Ruy6NlJYVOg2sp0vIE4P+pqFb/xq
         DHOsrAR5OnlnJrdA5wokBhCPlIV/W3V48m23ElbGXfJQ9/HyKdGGhq5HsnBLMoQO6e1V
         icEzJs9Sc+l1jkBEjJ82mvoqG7EdV+k1YBYnLN3dg+b4ApUcm9JljV6GVRuOl8OaRkcU
         Ying==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NirutUfKLotE+7x4bPUEo2jciNsESo3Y9atRufgg2ZY=;
        b=d/fOjyv/dOedZmtshX/FTPTTDJOP8pAN6tZ+slbn9K8TedBWLqQ5VXRgFp9WceqNBw
         W76tkvOVvM71bcwKxZUrTaA/qJKj5nVUSGtFXMqV+H19FmEL+BBpK+19TB8lwDyddhPv
         VqsLmHEQwyUgE2jIlANlEYrjLo+PWRaWGvoutmBQL/1sBdJD17mtJyheeBSuoqJzzVHh
         xak0SWB53CDctEvrEwUbO5hhtjk/ytW79Bo8WJy2cLoE9+6qX3vfr8PZVrDzcafArhdx
         BBGC0o6EwzmqY7F2P1/F61PpX1/T/YXs2mIr+uE/x2MOf2qwxi/cUigiWwsOHTTf6X6P
         zMyQ==
X-Gm-Message-State: AOAM531cuO9mFnkUS3tq9bBEj3lvLAlK0lZxy6UurlVz81b/tTm+V08v
        MEVozzoxPPOrLtTzNJGuCItICw==
X-Google-Smtp-Source: ABdhPJz5G94qvmhkBpElAmhfJpcEZTTiEyWC7R5FMeEQx+Lbbi2Q9LMVqNCo9dnSSqwOsWUmSdXxEg==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr7610672wrn.329.1626379805553;
        Thu, 15 Jul 2021 13:10:05 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id m32sm8860986wms.23.2021.07.15.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 13:10:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v2 3/3] bindings: cxx: implement C++ bindings for libgpiod v2.0
Date:   Thu, 15 Jul 2021 22:10:01 +0200
Message-Id: <20210715201001.23726-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210715201001.23726-1-brgl@bgdev.pl>
References: <20210715201001.23726-1-brgl@bgdev.pl>
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
 bindings/cxx/Makefile.am                    |  16 +-
 bindings/cxx/chip.cpp                       | 214 +++--
 bindings/cxx/edge-event-buffer.cpp          | 103 +++
 bindings/cxx/edge-event.cpp                 | 123 +++
 bindings/cxx/examples/Makefile.am           |  12 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |   3 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  63 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  39 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
 bindings/cxx/gpiod.hpp                      | 938 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  14 +
 bindings/cxx/gpiodcxx/chip.hpp              | 180 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 115 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 124 +++
 bindings/cxx/gpiodcxx/info-event.hpp        | 107 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 244 +++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 205 +++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 207 +++++
 bindings/cxx/gpiodcxx/misc.hpp              |  49 +
 bindings/cxx/gpiodcxx/request-config.hpp    |  97 ++
 bindings/cxx/info-event.cpp                 |  89 ++
 bindings/cxx/internal.hpp                   | 168 +++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 226 +++++
 bindings/cxx/line-info.cpp                  | 150 ++++
 bindings/cxx/line-request.cpp               | 194 ++++
 bindings/cxx/line.cpp                       | 321 -------
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  18 +
 bindings/cxx/request-config.cpp             |  80 ++
 configure.ac                                |   1 +
 33 files changed, 2734 insertions(+), 1827 deletions(-)
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
 create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
 create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
 create mode 100644 bindings/cxx/info-event.cpp
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
index d9fa577..4f7eb47 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -2,8 +2,18 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES = chip.cpp internal.h iter.cpp line.cpp line_bulk.cpp
-libgpiodcxx_la_CPPFLAGS = -Wall -Wextra -g -std=gnu++11
+libgpiodcxx_la_SOURCES = \
+	chip.cpp \
+	edge-event-buffer.cpp \
+	edge-event.cpp \
+	info-event.cpp \
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
@@ -13,7 +23,7 @@ include_HEADERS = gpiod.hpp
 pkgconfigdir = $(libdir)/pkgconfig
 pkgconfig_DATA = libgpiodcxx.pc
 
-SUBDIRS = .
+SUBDIRS = gpiodcxx .
 
 if WITH_TESTS
 
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index ee6ab6f..330f331 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -2,156 +2,228 @@
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <functional>
-#include <gpiod.hpp>
-#include <map>
+#include <gpiod.h>
 #include <system_error>
 #include <utility>
 
+#include "gpiod.hpp"
 #include "internal.hpp"
 
 namespace gpiod {
 
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to open the GPIO device " + path);
+
+	return chip;
+}
+
+line_info_ptr do_get_line_info(const chip_ptr& chip, unsigned int offset, bool watch)
+{
+	get_info_func func = watch ? ::gpiod_chip_watch_line_info : ::gpiod_chip_get_line_info;
+
+	line_info_ptr info(func(chip.get(), offset));
+	if (!info)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to retrieve GPIO line info");
+
+	return info;
 }
 
 } /* namespace */
 
-GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
+struct chip::impl
 {
-	return ::gpiod_is_gpiochip_device(path.c_str());
-}
+	impl(const ::std::string& path)
+		: chip(open_chip(path)),
+		  name(::gpiod_chip_get_name(this->chip.get())),
+		  label(::gpiod_chip_get_label(this->chip.get()))
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
+			throw ::std::logic_error("GPIO chip has been closed");
+	}
+
+	chip_ptr chip;
+	::std::string name;
+	::std::string label;
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
 
-	this->_m_chip.reset(chip, chip_deleter);
+	return *this;
 }
 
-GPIOD_CXX_API void chip::reset(void) noexcept
+GPIOD_CXX_API chip::operator bool(void) const noexcept
 {
-	this->_m_chip.reset();
+	return this->_m_priv.get() != nullptr;
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
+GPIOD_CXX_API const ::std::string& chip::name(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::std::string(::gpiod_chip_get_label(this->_m_chip.get()));
+	return this->_m_priv->name;
 }
 
-GPIOD_CXX_API unsigned int chip::num_lines(void) const
+GPIOD_CXX_API const ::std::string& chip::label(void) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	return ::gpiod_chip_get_num_lines(this->_m_chip.get());
+	return this->_m_priv->label;
 }
 
-GPIOD_CXX_API line chip::get_line(unsigned int offset) const
+GPIOD_CXX_API unsigned int chip::num_lines(void) const
 {
-	this->throw_if_noref();
-
-	if (offset >= this->num_lines())
-		throw ::std::out_of_range("line offset greater than the number of lines");
-
-	::gpiod_line* line_handle = ::gpiod_chip_get_line(this->_m_chip.get(), offset);
-	if (!line_handle)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error getting GPIO line from chip");
+	this->_m_priv->throw_if_closed();
 
-	return line(line_handle, *this);
+	return ::gpiod_chip_get_num_lines(this->_m_priv->chip.get());
 }
 
-GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
+GPIOD_CXX_API line_info chip::get_line_info(unsigned int offset, bool watch) const
 {
-	this->throw_if_noref();
+	this->_m_priv->throw_if_closed();
 
-	for (unsigned int offset = 0; offset < this->num_lines(); offset++) {
-		auto line = this->get_line(offset);
+	line_info_ptr info(do_get_line_info(this->_m_priv->chip, offset, watch));
+	line_info ret;
 
-		if (line.name() == name)
-			return offset;
-	}
+	ret._m_priv->set_info_ptr(info);
 
-	return -1;
+	return ret;
 }
 
-GPIOD_CXX_API line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
+GPIOD_CXX_API line_info chip::watch_line_info(unsigned int offset) const
 {
-	line_bulk lines;
+	return this->get_line_info(offset, true);
+}
 
-	for (auto& it: offsets)
-		lines.append(this->get_line(it));
+void chip::unwatch_line_info(unsigned int offset) const
+{
+	this->_m_priv->throw_if_closed();
 
-	return lines;
+	int ret = ::gpiod_chip_unwatch_line_info(this->_m_priv->chip.get(), offset);
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to unwatch line status changes");
 }
 
-GPIOD_CXX_API line_bulk chip::get_all_lines(void) const
+int chip::get_fd(void) const
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
+GPIOD_CXX_API bool chip::info_event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
-	return this->_m_chip.get() == rhs._m_chip.get();
+	this->_m_priv->throw_if_closed();
+
+	int ret = ::gpiod_chip_info_event_wait(this->_m_priv->chip.get(), timeout.count());
+	if (ret < 0)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error waiting for info events");
+
+	return ret;
 }
 
-GPIOD_CXX_API bool chip::operator!=(const chip& rhs) const noexcept
+GPIOD_CXX_API info_event chip::info_event_read(void) const
 {
-	return this->_m_chip.get() != rhs._m_chip.get();
+	this->_m_priv->throw_if_closed();
+
+	info_event_ptr event(gpiod_chip_info_event_read(this->_m_priv->chip.get()));
+	if (!event)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error reading the line info event_handle");
+
+	info_event ret;
+	ret._m_priv->event = ::std::move(event);
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error looking up line by name");
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error requesting GPIO lines");
+
+	line_request ret;
+	ret._m_priv->request = ::std::move(request);
+
+	return ret;
 }
 
-GPIOD_CXX_API void chip::throw_if_noref(void) const
+GPIOD_CXX_API const line_config& chip::default_line_config(void)
 {
-	if (!this->_m_chip.get())
-		throw ::std::logic_error("object not associated with an open GPIO chip");
+	static const line_config ret;
+
+	return ret;
 }
 
 } /* namespace gpiod */
diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
new file mode 100644
index 0000000..dde874a
--- /dev/null
+++ b/bindings/cxx/edge-event-buffer.cpp
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <system_error>
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to allocate the edge event buffer");
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error reading edge events from file descriptor");
+
+	for (int i = 0; i < ret; i++) {
+		::gpiod_edge_event* event = ::gpiod_edge_event_buffer_get_event(this->buffer.get(),
+										i);
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
+} /* namespace gpiod */
diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
new file mode 100644
index 0000000..fd5089a
--- /dev/null
+++ b/bindings/cxx/edge-event.cpp
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <stdexcept>
+#include <system_error>
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<int, int> event_type_mapping = {
+	{ GPIOD_LINE_EVENT_RISING_EDGE,		edge_event::RISING_EDGE },
+	{ GPIOD_LINE_EVENT_FALLING_EDGE,	edge_event::FALLING_EDGE }
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to copy the edge event object");
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
+GPIOD_CXX_API int edge_event::event_type(void) const
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
index 872cd96..15c5e71 100644
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
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
index 94b3dac..e9372c8 100644
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -15,21 +15,15 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::std::vector<unsigned int> offsets;
+	::gpiod::line_offsets offsets;
 
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
index 2175adc..8caf998 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -9,42 +9,51 @@
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
+		::std::cout << (info.name().empty() ? "unnamed" : info.name());
+		::std::cout << " ";
 
-			::std::cout << chip.name() << " - " << chip.num_lines() << " lines:" << ::std::endl;
+		::std::cout.width(12);
+		::std::cout << (info.consumer().empty() ? "unused" : info.consumer());
+		::std::cout << " ";
 
-			for (auto& lit: ::gpiod::line_iter(chip)) {
-				::std::cout << "\tline ";
-				::std::cout.width(3);
-				::std::cout << lit.offset() << ": ";
+		::std::cout.width(8);
+		::std::cout << (info.direction() == ::gpiod::line_info::DIRECTION_INPUT ? "input"
+											: "output");
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
index 4d6ac6e..5e4b77e 100644
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
+	if (event.event_type() == ::gpiod::edge_event::RISING_EDGE)
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
+	::gpiod::line_offsets offsets;
 	offsets.reserve(argc);
 	for (int i = 2; i < argc; i++)
 		offsets.push_back(::std::stoul(argv[i]));
 
 	::gpiod::chip chip(argv[1]);
-	auto lines = chip.get_lines(offsets);
+	auto request = chip.request_lines(::gpiod::request_config(offsets, "gpiomoncxx"),
+					  ::gpiod::line_config(::gpiod::line_config::DIRECTION_INPUT,
+							       ::gpiod::line_config::EDGE_BOTH));
 
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
index 71b27a9..0e31253 100644
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
+	::gpiod::line_offsets offsets;
+	::gpiod::line_values values;
 
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
+				::gpiod::line_config(::gpiod::line_config::DIRECTION_OUTPUT));
 
-	lines.request({
-		argv[0],
-		::gpiod::line_request::DIRECTION_OUTPUT,
-		0
-	}, values);
+	request.set_values(values);
 
 	::std::cin.get();
 
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index e3ce2fc..31880e2 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1,940 +1,26 @@
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
+ * C++ bindings for libgpiod.
  */
 
-} /* namespace gpiod */
+#include "gpiodcxx/chip.hpp"
+#include "gpiodcxx/edge-event.hpp"
+#include "gpiodcxx/edge-event-buffer.hpp"
+#include "gpiodcxx/info-event.hpp"
+#include "gpiodcxx/line-config.hpp"
+#include "gpiodcxx/line-info.hpp"
+#include "gpiodcxx/line-request.hpp"
+#include "gpiodcxx/request-config.hpp"
 
 #endif /* __LIBGPIOD_GPIOD_CXX_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
new file mode 100644
index 0000000..f5ef9ce
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/Makefile.am
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+otherincludedir = $(includedir)/gpiodcxx
+otherinclude_HEADERS = \
+	chip.hpp \
+	edge-event-buffer.hpp \
+	edge-event.hpp \
+	info-event.hpp \
+	line-config.hpp \
+	line-info.hpp \
+	line-request.hpp \
+	misc.hpp \
+	request-config.hpp
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
new file mode 100644
index 0000000..b39a440
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -0,0 +1,180 @@
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
+#include <chrono>
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
+	chip(const ::std::string& path);
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
+	 * @return Reference to the string containing the chip name.
+	 */
+	const ::std::string& name(void) const;
+
+	/**
+	 * @brief Get the label of this GPIO chip.
+	 * @return Reference to the string containing the label of this chip.
+	 */
+	const ::std::string& label(void) const;
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
+	 * @param watch Indicates whether the caller wants to watch for line
+	 *              info changes.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info get_line_info(unsigned int offset, bool watch = false) const;
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
+	int get_fd(void) const;
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
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_CHIP_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
new file mode 100644
index 0000000..dc7a021
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -0,0 +1,115 @@
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
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
new file mode 100644
index 0000000..56c2dad
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -0,0 +1,124 @@
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
+#include <cstdint>
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
+	enum : int {
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
+	/**
+	 * @brief Destructor.
+	 */
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
+	int event_type(void) const;
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
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EDGE_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
new file mode 100644
index 0000000..5404790
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -0,0 +1,107 @@
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
+#include <cstdint>
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
+	enum : int {
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
+	int event_type(void) const;
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
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_INFO_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
new file mode 100644
index 0000000..2157980
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -0,0 +1,244 @@
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
+	 * @brief Direction settings.
+	 */
+	enum : int {
+		DIRECTION_AS_IS = 1,
+		/**< Request the line(s), but don't change current direction. */
+		DIRECTION_INPUT,
+		/**< Request the line(s) for reading the GPIO line state. */
+		DIRECTION_OUTPUT
+		/**< Request the line(s) for setting the GPIO line state. */
+	};
+
+	/**
+	 * @brief Edge event detection settings.
+	 */
+	enum : int {
+		EDGE_NONE = 1,
+		/**< Don't report edge events. */
+		EDGE_FALLING,
+		/**< Only watch falling edge events. */
+		EDGE_RISING,
+		/**< Only watch rising edge events. */
+		EDGE_BOTH
+		/**< Monitor both types of events. */
+	};
+
+	/**
+	 * @brief Internal bias settings for line requests.
+	 */
+	enum : int {
+		BIAS_AS_IS = 1,
+		/**< Don't change the current bias setting. */
+		BIAS_DISABLED,
+		/**< The internal bias should be disabled (the default). */
+		BIAS_PULL_UP,
+		/**< The internal pull-up bias is enabled. */
+		BIAS_PULL_DOWN
+		/**< The internal pull-down bias is enabled. */
+	};
+
+	/**
+	 * @brief Drive settings for line requests.
+	 */
+	enum : int {
+		DRIVE_PUSH_PULL = 1,
+		/**< Drive setting should be set to push-pull (the default). */
+		DRIVE_OPEN_DRAIN,
+		/**< Line output should be set to open-drain. */
+		DRIVE_OPEN_SOURCE
+		/**< Line output should be set to open-source. */
+	};
+
+	/**
+	 * @brief Clock types used for event timestamps.
+	 */
+	enum : int {
+		EVENT_CLOCK_MONOTONIC = 1,
+		/**< Use the monotonic clock. */
+		EVENT_CLOCK_REALTIME
+		/**< Use the realtime clock. */
+	};
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
+	 * @param event_clock Default event clock mode.
+	 */
+	line_config(int direction = DIRECTION_INPUT, int edge = EDGE_NONE, bool active_low = false,
+		    const line_value_mappings& output_values = no_output_values(),
+		    int bias = BIAS_AS_IS, int drive = DRIVE_PUSH_PULL,
+		    unsigned long debounce_period = 0, int event_clock = EVENT_CLOCK_MONOTONIC);
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
+	 * @brief Set the direction, either globally or for a set of offsets.
+	 * @param direction New direction setting.
+	 * @param offsets Vector of line offsets to set the direction for. If
+	 *                empty, the setting will be global.
+	 */
+	void set_direction(int direction, const line_offsets& offsets = line_offsets()) const;
+
+	/**
+	 * @brief Set the edge detection, either globally or for a set of
+	 *        offsets.
+	 * @param edge New edge detection setting.
+	 * @param offsets Vector of line offsets to set the edge detection for.
+	 *                If empty, the setting will be global.
+	 */
+	void set_edge_detection(int edge, const line_offsets& offsets = line_offsets()) const;
+
+	/**
+	 * @brief Set the bias, either globally or for a set of offsets.
+	 * @param bias New bias setting.
+	 * @param offsets Vector of line offsets to set the bias for. If empty,
+	 *                the setting will be global.
+	 */
+	void set_bias(int bias, const line_offsets& offsets = line_offsets()) const;
+
+	/**
+	 * @brief Set the drive, either globally or for a set of offsets.
+	 * @param drive New drive setting.
+	 * @param offsets Vector of line offsets to set the drive for. If empty,
+	 *                the setting will be global.
+	 */
+	void set_drive(int drive, const line_offsets& offsets = line_offsets()) const;
+
+	/**
+	 * @brief Set the active setting to low, either globally or for a set
+	 *        of offsets.
+	 * @param offsets Vector of line offsets to set to active-low. If empty,
+	 *                the setting will be global.
+	 */
+	void set_active_low(const line_offsets& offsets = line_offsets()) const noexcept;
+
+	/**
+	 * @brief Set the active setting to high, either globally or for a set
+	 *        of offsets.
+	 * @param offsets Vector of line offsets to set to active-high. If
+	 *                empty, the setting will be global.
+	 */
+	void set_active_high(const line_offsets& offsets = line_offsets()) const noexcept;
+
+	/**
+	 * @brief Set the debounce period, either globally or for a set of
+	 *        offsets.
+	 * @param period New debounce period setting. 0 to explicitly disable
+	 *               debouncing.
+	 * @param offsets Vector of line offsets to set the debounce period for.
+	 *                If empty, the setting will be global.
+	 */
+	void set_debounce_period(unsigned long period,
+				 const line_offsets& offsets = line_offsets()) const noexcept;
+
+	/**
+	 * @brief Set the type of clock used to timestamp edge events, either
+	 *        globally or for a set of offsets.
+	 * @param clock New event clock setting.
+	 * @param offsets Vector of line offsets to set the debounce period for.
+	 *                If empty, the setting will be global.
+	 */
+	void set_event_clock(int clock, const line_offsets& offsets = line_offsets()) const;
+
+	/**
+	 * @brief Set the output value for a single offset.
+	 * @param offset Line offset to associate the value with.
+	 * @param value New value.
+	 */
+	void set_output_value(unsigned int offset, int value) const;
+
+	/**
+	 * @brief Set the output values for a set of line offsets.
+	 * @param values Vector of offset->value mappings.
+	 */
+	void set_output_values(const line_value_mappings& values) const;
+
+	/**
+	 * @brief Set the output values for a set of line offsets.
+	 * @param offsets Vector of line offsets for which to set output values.
+	 * @param values Vector of new line values with indexes of values
+	 *               corresponding to the indexes of offsets.
+	 */
+	void set_output_values(const line_offsets& offsets, const line_values& values) const;
+
+	/**
+	 * @brief Convenience helper value for passing an empty list of
+	 *        offset-to-value mappings to methods of this class.
+	 * @return Empty line->value mapping vector.
+	 */
+	static const line_value_mappings& no_output_values(void);
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
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
new file mode 100644
index 0000000..a8c3b13
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -0,0 +1,205 @@
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
+	 * @brief Direction settings.
+	 */
+	enum : int {
+		DIRECTION_INPUT = 1,
+		/**< Direction is input - we're reading the state of a GPIO line. */
+		DIRECTION_OUTPUT
+		/**< Direction is output - we're driving the GPIO line. */
+	};
+
+	/**
+	 * @brief Internal bias settings.
+	 */
+	enum : int {
+		BIAS_UNKNOWN = 1,
+		/**< The internal bias state is unknown. */
+		BIAS_DISABLED,
+		/**< The internal bias is disabled. */
+		BIAS_PULL_UP,
+		/**< The internal pull-up bias is enabled. */
+		BIAS_PULL_DOWN
+		/**< The internal pull-down bias is enabled. */
+	};
+
+	/**
+	 * @brief Drive settings.
+	 */
+	enum : int {
+		DRIVE_PUSH_PULL = 1,
+		/**< Drive setting is push-pull. */
+		DRIVE_OPEN_DRAIN,
+		/**< Line output is open-drain. */
+		DRIVE_OPEN_SOURCE,
+		/**< Line output is open-source. */
+	};
+
+	/**
+	 * @brief Edge detection settings.
+	 */
+	enum : int {
+		EDGE_NONE = 1,
+		/**< Line edge detection is disabled. */
+		EDGE_RISING,
+		/**< Line detects rising edge events. */
+		EDGE_FALLING,
+		/**< Line detect falling edge events. */
+		EDGE_BOTH
+		/**< Line detects both rising and falling edge events. */
+	};
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
+	const ::std::string& name(void) const noexcept;
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
+	const ::std::string& consumer(void) const noexcept;
+
+	/**
+	 * @brief Read the GPIO line direction setting.
+	 * @return Returns DIRECTION_INPUT or DIRECTION_OUTPUT.
+	 */
+	int direction(void) const;
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
+	int bias(void) const;
+
+	/**
+	 * @brief Read the GPIO line drive setting.
+	 * @return Returns DRIVE_PUSH_PULL, DRIVE_OPEN_DRAIN or
+	 *         DRIVE_OPEN_SOURCE.
+	 */
+	int drive(void) const;
+
+	/**
+	 * @brief Read the current edge detection setting of this line.
+	 * @return Returns EDGE_NONE, EDGE_RISING, EDGE_FALLING or EDGE_BOTH.
+	 */
+	int edge_detection(void) const;
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
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
new file mode 100644
index 0000000..1615b2b
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -0,0 +1,207 @@
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
+#include <chrono>
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
+	line_offsets offsets(void) const;
+
+	/**
+	 * @brief Get the value of a single requested line.
+	 * @param offset Offset of the line to read within the chip.
+	 * @return Current line value.
+	 */
+	int get_value(unsigned int offset) const;
+
+	/**
+	 * @brief Get the values of a subset of requested lines.
+	 * @param offsets Vector of line offsets
+	 * @return Vector of lines values with indexes of values corresponding
+	 *         to those of the offsets.
+	 */
+	line_values get_values(const line_offsets& offsets) const;
+
+	/**
+	 * @brief Get the values of all requested lines.
+	 * @return List of read values.
+	 */
+	line_values get_values(void) const;
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
+	void get_values(const line_offsets& offsets, line_values& values) const;
+
+	/**
+	 * @brief Get the values of all requested lines.
+	 * @param values Array in which the values will be stored. Must hold
+	 *               at least the number of elements returned by
+	 *               line_request::num_lines.
+	 */
+	void get_values(line_values& values) const;
+
+	/**
+	 * @brief Set the value of a single requested line.
+	 * @param offset Offset of the line to set within the chip.
+	 * @param value New line value.
+	 */
+	void set_value(unsigned int offset, int value) const;
+
+	/**
+	 * @brief Set the values of a subset of requested lines.
+	 * @param values Vector containing a set of offset->value mappings.
+	 */
+	void set_values(const line_value_mappings& values) const;
+
+	/**
+	 * @brief Set the values of a subset of requested lines.
+	 * @param offsets Vector containing the offsets of lines to set.
+	 * @param values Vector containing new values with indexes
+	 *               corresponding with those in the offsets vector.
+	 */
+	void set_values(const line_offsets& offsets, const line_values& values) const;
+
+	/**
+	 * @brief Set the values of all requested lines.
+	 * @param values Array of new line values. The size must be equal to
+	 *               the value returned by line_request::num_lines.
+	 */
+	void set_values(const line_values& values) const;
+
+	/**
+	 * @brief Apply new config options to requested lines.
+	 * @param config New configuration.
+	 */
+	void reconfigure_lines(const line_config& config) const;
+
+	/**
+	 * @brief Get the file descriptor number associated with this line
+	 *        request.
+	 * @return File descriptor number.
+	 */
+	int get_fd(void) const;
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
+	unsigned int edge_event_read(edge_event_buffer& buffer) const;
+
+	/**
+	 * @brief Read a number of edge events from this request.
+	 * @param buffer Edge event buffer to read events into.
+	 * @param max_events Maximum number of events to read. Limited by the
+	 *                   capacity of the buffer.
+	 * @return Number of events read.
+	 */
+	unsigned int edge_event_read(edge_event_buffer& buffer, unsigned int max_events) const;
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
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/misc.hpp b/bindings/cxx/gpiodcxx/misc.hpp
new file mode 100644
index 0000000..16e0258
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/misc.hpp
@@ -0,0 +1,49 @@
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
+#include <string>
+#include <utility>
+#include <vector>
+
+namespace gpiod {
+
+/**
+ * @brief Vector of line offsets.
+ */
+using line_offsets = ::std::vector<unsigned int>;
+
+/**
+ * @brief Vector of line values.
+ */
+using line_values = ::std::vector<int>;
+
+/**
+ * @brief Vector of offset->value mappings. Each mapping is defined as a pair
+ *        of an unsigned and signed integers.
+ */
+using line_value_mappings = ::std::vector<::std::pair<unsigned int, int>>;
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
+::std::string version_string(void);
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_MISC_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
new file mode 100644
index 0000000..dda2747
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -0,0 +1,97 @@
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
+#include <memory>
+#include <string>
+
+#include "misc.hpp"
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
+	request_config(const line_offsets& offsets = line_offsets(),
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
+	void set_consumer(const ::std::string& consumer) const noexcept;
+
+	/**
+	 * @brief Set line offsets for this request.
+	 * @param offsets Vector of line offsets to request.
+	 */
+	void set_offsets(const line_offsets& offsets) const noexcept;
+
+	/**
+	 * @brief Set the size of the kernel event buffer.
+	 * @param event_buffer_size New event buffer size.
+	 * @note The kernel may adjust the value if it's too high. If set to 0,
+	 *       the default value will be used.
+	 */
+	void set_event_buffer_size(unsigned int event_buffer_size) const noexcept;
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
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__ */
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
new file mode 100644
index 0000000..c3214db
--- /dev/null
+++ b/bindings/cxx/info-event.cpp
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <system_error>
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<int, int> event_type_mapping = {
+	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::LINE_REQUESTED },
+	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::LINE_RELEASED },
+	{ GPIOD_INFO_EVENT_LINE_REQUESTED,	info_event::LINE_CONFIG_CHANGED }
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to copy the line info object");
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
+GPIOD_CXX_API int info_event::event_type(void) const
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
+} /* namespace gpiod */
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
index 9406d30..78c9f3a 100644
--- a/bindings/cxx/internal.hpp
+++ b/bindings/cxx/internal.hpp
@@ -1,9 +1,169 @@
 /* SPDX-License-Identifier: LGPL-3.0-or-later */
 /* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
 
-#ifndef __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__
-#define __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__
+#ifndef __LIBGPIOD_CXX_INTERNAL_HPP__
+#define __LIBGPIOD_CXX_INTERNAL_HPP__
 
-#define GPIOD_CXX_API __attribute__((visibility("default")))
+#include <gpiod.h>
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
+template<class gpiod_type, void free_func(gpiod_type*)> struct deleter
+{
+	void operator()(gpiod_type* ptr)
+	{
+		free_func(ptr);
+	}
+};
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
+	::std::string name;
+	::std::string consumer;
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
index 0000000..e20eaba
--- /dev/null
+++ b/bindings/cxx/line-config.cpp
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <system_error>
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+using value_mapping = ::std::map<int, int>;
+
+const value_mapping direction_mapping = {
+	{ line_config::DIRECTION_AS_IS,		GPIOD_LINE_CONFIG_DIRECTION_AS_IS },
+	{ line_config::DIRECTION_INPUT,		GPIOD_LINE_CONFIG_DIRECTION_INPUT },
+	{ line_config::DIRECTION_OUTPUT,	GPIOD_LINE_CONFIG_DIRECTION_OUTPUT }
+};
+
+const value_mapping edge_mapping = {
+	{ line_config::EDGE_NONE,		GPIOD_LINE_CONFIG_EDGE_NONE },
+	{ line_config::EDGE_FALLING,		GPIOD_LINE_CONFIG_EDGE_FALLING },
+	{ line_config::EDGE_RISING,		GPIOD_LINE_CONFIG_EDGE_RISING },
+	{ line_config::EDGE_BOTH,		GPIOD_LINE_CONFIG_EDGE_BOTH }
+};
+
+const value_mapping bias_mapping = {
+	{ line_config::BIAS_AS_IS,		GPIOD_LINE_CONFIG_BIAS_AS_IS },
+	{ line_config::BIAS_DISABLED,		GPIOD_LINE_CONFIG_BIAS_DISABLED },
+	{ line_config::BIAS_PULL_UP,		GPIOD_LINE_CONFIG_BIAS_PULL_UP },
+	{ line_config::BIAS_PULL_DOWN,		GPIOD_LINE_CONFIG_BIAS_PULL_DOWN }
+};
+
+const value_mapping drive_mapping = {
+	{ line_config::DRIVE_PUSH_PULL,		GPIOD_LINE_CONFIG_DRIVE_PUSH_PULL },
+	{ line_config::DRIVE_OPEN_DRAIN,	GPIOD_LINE_CONFIG_DRIVE_OPEN_DRAIN },
+	{ line_config::DRIVE_OPEN_SOURCE,	GPIOD_LINE_CONFIG_DRIVE_OPEN_SOURCE }
+};
+
+const value_mapping clock_mapping = {
+	{ line_config::EVENT_CLOCK_MONOTONIC,	GPIOD_LINE_CONFIG_EVENT_CLOCK_MONOTONIC },
+	{ line_config::EVENT_CLOCK_REALTIME,	GPIOD_LINE_CONFIG_EVENT_CLOCK_REALTIME },
+};
+
+::gpiod_line_config* make_line_config(void)
+{
+	::gpiod_line_config *config = ::gpiod_line_config_new();
+	if (!config)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "Unable to allocate the line config object");
+
+	return config;
+}
+
+template<void global_func(::gpiod_line_config*, int),
+	 void subset_func(::gpiod_line_config*, int, unsigned int, const unsigned int*)>
+void set_mapped_value(::gpiod_line_config* config, int value,
+		      const line_offsets& offsets, const value_mapping& mapping)
+{
+	int mapped_val = mapping.at(value);
+
+	if (offsets.empty())
+		global_func(config, mapped_val);
+	else
+		subset_func(config, mapped_val, offsets.size(), offsets.data());
+}
+
+template<void global_func(::gpiod_line_config*),
+	 void subset_func(::gpiod_line_config*, unsigned int, const unsigned int*)>
+void set_active_value(::gpiod_line_config* config, const line_offsets& offsets)
+{
+	if (offsets.empty())
+		global_func(config);
+	else
+		subset_func(config, offsets.size(), offsets.data());
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
+GPIOD_CXX_API line_config::line_config(int direction, int edge, bool active_low,
+				       const line_value_mappings& output_values, int bias,
+				       int drive, unsigned long debounce_period, int event_clock)
+	: _m_priv(new impl)
+{
+	this->set_direction(direction);
+	this->set_edge_detection(edge);
+	this->set_bias(bias);
+	this->set_drive(drive);
+	active_low ? this->set_active_low() : this->set_active_high();
+	this->set_debounce_period(debounce_period);
+	this->set_event_clock(event_clock);
+	this->set_output_values(output_values);
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
+GPIOD_CXX_API line_config& line_config::operator=(line_config&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API void line_config::set_direction(int direction, const line_offsets& offsets) const
+{
+	set_mapped_value<::gpiod_line_config_set_direction,
+			 ::gpiod_line_config_set_direction_subset>(this->_m_priv->config.get(),
+								   direction, offsets,
+								   direction_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_edge_detection(int edge, const line_offsets& offsets) const
+{
+	set_mapped_value<::gpiod_line_config_set_edge_detection,
+			 ::gpiod_line_config_set_edge_detection_subset>(
+				this->_m_priv->config.get(), edge, offsets, edge_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_bias(int bias, const line_offsets& offsets) const
+{
+	set_mapped_value<::gpiod_line_config_set_bias,
+			 ::gpiod_line_config_set_bias_subset>(this->_m_priv->config.get(),
+							      bias, offsets, bias_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_drive(int drive, const line_offsets& offsets) const
+{
+	set_mapped_value<::gpiod_line_config_set_drive,
+			 ::gpiod_line_config_set_drive_subset>(this->_m_priv->config.get(),
+							       drive, offsets, drive_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_active_low(const line_offsets& offsets) const noexcept
+{
+	set_active_value<::gpiod_line_config_set_active_low,
+			 ::gpiod_line_config_set_active_low_subset>(this->_m_priv->config.get(),
+								    offsets);
+}
+
+GPIOD_CXX_API void line_config::set_active_high(const line_offsets& offsets) const noexcept
+{
+	set_active_value<::gpiod_line_config_set_active_high,
+			 ::gpiod_line_config_set_active_high_subset>(this->_m_priv->config.get(),
+								     offsets);
+}
+
+GPIOD_CXX_API void line_config::set_debounce_period(unsigned long period,
+						    const line_offsets& offsets) const noexcept
+{
+	if (offsets.empty())
+		::gpiod_line_config_set_debounce_period(this->_m_priv->config.get(), period);
+	else
+		::gpiod_line_config_set_debounce_period_subset(this->_m_priv->config.get(), period,
+							       offsets.size(), offsets.data());
+}
+
+GPIOD_CXX_API void line_config::set_event_clock(int clock, const line_offsets& offsets) const
+{
+	set_mapped_value<::gpiod_line_config_set_event_clock,
+			 ::gpiod_line_config_set_event_clock_subset>(this->_m_priv->config.get(),
+								     clock, offsets,
+								     clock_mapping);
+}
+
+GPIOD_CXX_API void line_config::set_output_value(unsigned int offset, int value) const
+{
+	this->set_output_values({{offset, value}});
+}
+
+GPIOD_CXX_API void line_config::set_output_values(const line_value_mappings& values) const
+{
+	line_offsets offsets;
+	line_values vals;
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
+GPIOD_CXX_API void line_config::set_output_values(const line_offsets& offsets,
+						  const line_values& values) const
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
+GPIOD_CXX_API const line_value_mappings& line_config::no_output_values(void)
+{
+	static const line_value_mappings ret;
+
+	return ret;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line-info.cpp b/bindings/cxx/line-info.cpp
new file mode 100644
index 0000000..b78bcef
--- /dev/null
+++ b/bindings/cxx/line-info.cpp
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <map>
+#include <utility>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+const ::std::map<int, int> direction_mapping = {
+	{ GPIOD_LINE_DIRECTION_INPUT,	line_info::DIRECTION_INPUT },
+	{ GPIOD_LINE_DIRECTION_OUTPUT,	line_info::DIRECTION_OUTPUT }
+};
+
+const ::std::map<int, int> bias_mapping = {
+	{ GPIOD_LINE_BIAS_UNKNOWN,	line_info::BIAS_UNKNOWN },
+	{ GPIOD_LINE_BIAS_DISABLED,	line_info::BIAS_DISABLED },
+	{ GPIOD_LINE_BIAS_PULL_UP,	line_info::BIAS_PULL_UP },
+	{ GPIOD_LINE_BIAS_PULL_DOWN,	line_info::BIAS_PULL_DOWN }
+};
+
+const ::std::map<int, int> drive_mapping = {
+	{ GPIOD_LINE_DRIVE_PUSH_PULL,	line_info::DRIVE_PUSH_PULL },
+	{ GPIOD_LINE_DRIVE_OPEN_DRAIN,	line_info::DRIVE_OPEN_DRAIN },
+	{ GPIOD_LINE_DRIVE_OPEN_SOURCE,	line_info::DRIVE_OPEN_SOURCE }
+};
+
+const ::std::map<int, int> edge_mapping = {
+	{ GPIOD_LINE_EDGE_NONE,		line_info::EDGE_NONE },
+	{ GPIOD_LINE_EDGE_RISING,	line_info::EDGE_RISING },
+	{ GPIOD_LINE_EDGE_FALLING,	line_info::EDGE_FALLING },
+	{ GPIOD_LINE_EDGE_BOTH,		line_info::EDGE_BOTH }
+};
+
+} /* namespace */
+
+void line_info::impl::set_info_ptr(line_info_ptr& new_info)
+{
+	const char* name =  ::gpiod_line_info_get_name(new_info.get());
+	const char* consumer = ::gpiod_line_info_get_consumer(new_info.get());
+
+	this->info = ::std::move(new_info);
+	this->name = name ?: ::std::string();
+	this->consumer = consumer ?: ::std::string();
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
+GPIOD_CXX_API const ::std::string& line_info::name(void) const noexcept
+{
+	return this->_m_priv->name;
+}
+
+GPIOD_CXX_API bool line_info::used(void) const noexcept
+{
+	return ::gpiod_line_info_is_used(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API const ::std::string& line_info::consumer(void) const noexcept
+{
+	return this->_m_priv->consumer;
+}
+
+GPIOD_CXX_API int line_info::direction(void) const
+{
+	int direction = ::gpiod_line_info_get_direction(this->_m_priv->info.get());
+
+	return direction_mapping.at(direction);
+}
+
+GPIOD_CXX_API bool line_info::active_low(void) const noexcept
+{
+	return ::gpiod_line_info_is_active_low(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API int line_info::bias(void) const
+{
+	int bias = ::gpiod_line_info_get_bias(this->_m_priv->info.get());
+
+	return bias_mapping.at(bias);
+}
+
+GPIOD_CXX_API int line_info::drive(void) const
+{
+	int drive = ::gpiod_line_info_get_drive(this->_m_priv->info.get());
+
+	return drive_mapping.at(drive);
+}
+
+GPIOD_CXX_API int line_info::edge_detection(void) const
+{
+	int edge = ::gpiod_line_info_get_edge_detection(this->_m_priv->info.get());
+
+	return edge_mapping.at(edge);
+}
+
+GPIOD_CXX_API bool line_info::debounced(void) const  noexcept
+{
+	return ::gpiod_line_info_is_debounced(this->_m_priv->info.get());
+}
+
+GPIOD_CXX_API unsigned long line_info::debounce_period(void) const  noexcept
+{
+	return ::gpiod_line_info_get_debounce_period(this->_m_priv->info.get());
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
new file mode 100644
index 0000000..b5216a3
--- /dev/null
+++ b/bindings/cxx/line-request.cpp
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <system_error>
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
+GPIOD_CXX_API line_offsets line_request::offsets(void) const
+{
+	this->_m_priv->throw_if_released();
+
+	line_offsets offsets(this->num_lines());
+
+	::gpiod_line_request_get_offsets(this->_m_priv->request.get(), offsets.data());
+
+	return offsets;
+}
+
+GPIOD_CXX_API int line_request::get_value(unsigned int offset) const
+{
+	return this->get_values({ offset }).front();
+}
+
+GPIOD_CXX_API line_values
+line_request::get_values(const line_offsets& offsets) const
+{
+	line_values vals(offsets.size());
+
+	this->get_values(offsets, vals);
+
+	return vals;
+}
+
+GPIOD_CXX_API line_values line_request::get_values(void) const
+{
+	return this->get_values(this->offsets());
+}
+
+GPIOD_CXX_API void line_request::get_values(const line_offsets& offsets, line_values& values) const
+{
+	this->_m_priv->throw_if_released();
+
+	if (offsets.size() > values.size())
+		throw ::std::invalid_argument("values must have the same size as the offsets");
+
+	int ret = ::gpiod_line_request_get_values_subset(this->_m_priv->request.get(), offsets.size(),
+						  offsets.data(), values.data());
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to retrieve line values");
+}
+
+GPIOD_CXX_API void line_request::get_values(line_values& values) const
+{
+	this->get_values(this->offsets(), values);
+}
+
+GPIOD_CXX_API void line_request::line_request::set_value(unsigned int offset, int value) const
+{
+	this->set_values({ offset }, { value });
+}
+
+GPIOD_CXX_API void
+line_request::set_values(const line_value_mappings& values) const
+{
+	line_offsets offsets(values.size());
+	line_values vals(values.size());
+
+	for (unsigned int i = 0; i < values.size(); i++) {
+		offsets[i] = values[i].first;
+		vals[i] = values[i].second;
+	}
+
+	this->set_values(offsets, vals);
+}
+
+GPIOD_CXX_API void line_request::set_values(const line_offsets& offsets,
+					    const line_values& values) const
+{
+	this->_m_priv->throw_if_released();
+
+	if (offsets.size() != values.size())
+		throw ::std::invalid_argument("values must have the same size as the offsets");
+
+	int ret = ::gpiod_line_request_set_values_subset(this->_m_priv->request.get(),
+						  offsets.size(), offsets.data(), values.data());
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to set line values");
+}
+
+GPIOD_CXX_API void line_request::set_values(const line_values& values) const
+{
+	this->set_values(this->offsets(), values);
+}
+
+GPIOD_CXX_API void line_request::reconfigure_lines(const line_config& config) const
+{
+	this->_m_priv->throw_if_released();
+
+	int ret = ::gpiod_line_request_reconfigure_lines(this->_m_priv->request.get(),
+							 config._m_priv->config.get());
+	if (ret)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "unable to reconfigure GPIO lines");
+}
+
+GPIOD_CXX_API int line_request::get_fd(void) const
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error waiting for edge events");
+
+	return ret;
+}
+
+GPIOD_CXX_API unsigned int
+line_request::edge_event_read(edge_event_buffer& buffer) const
+{
+	return this->edge_event_read(buffer, buffer.capacity());
+}
+
+GPIOD_CXX_API unsigned int
+line_request::edge_event_read(edge_event_buffer& buffer, unsigned int max_events) const
+{
+	this->_m_priv->throw_if_released();
+
+	return buffer._m_priv->read_events(this->_m_priv->request, max_events);
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
index 0000000..a5639c6
--- /dev/null
+++ b/bindings/cxx/misc.cpp
@@ -0,0 +1,18 @@
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
+GPIOD_CXX_API ::std::string version_string(void)
+{
+	return ::gpiod_version_string();
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/request-config.cpp b/bindings/cxx/request-config.cpp
new file mode 100644
index 0000000..ac5240d
--- /dev/null
+++ b/bindings/cxx/request-config.cpp
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <system_error>
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
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "Unable to allocate the request config object");
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
+GPIOD_CXX_API request_config::request_config(const line_offsets& offsets,
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
+request_config::set_consumer(const ::std::string& consumer) const noexcept
+{
+	::gpiod_request_config_set_consumer(this->_m_priv->config.get(), consumer.c_str());
+}
+
+GPIOD_CXX_API void request_config::set_offsets(const line_offsets& offsets) const noexcept
+{
+	::gpiod_request_config_set_offsets(this->_m_priv->config.get(),
+					   offsets.size(), offsets.data());
+}
+
+GPIOD_CXX_API void
+request_config::set_event_buffer_size(unsigned int event_buffer_size) const noexcept
+{
+	::gpiod_request_config_set_event_buffer_size(this->_m_priv->config.get(),
+						     event_buffer_size);
+}
+
+} /* namespace gpiod */
diff --git a/configure.ac b/configure.ac
index e0a917f..a0fd45a 100644
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

