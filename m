Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43DED50FDA1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 14:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349507AbiDZMyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 08:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244839AbiDZMyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 08:54:07 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D693E78AC
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:56 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so1464432wmn.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xWnk1zhA+vn+nW3w42ayU/OjstYCdCexzNniruQih+g=;
        b=oOAdfuE8A0Yq7rJIXxm3IHE9zsOQ9CbsGon1oGW3FJwviHNeYabj3xTbmiGnmR9pMe
         FmwgvUvMoI2+mJLvyK3oHRK+IVxNJDXnhvow/r5cueQwrqyRinQQH7mRBLzIDn4tKfcQ
         2om4dMUsvPVhE7Di5dzyRc8yc1SgVIxhdixlmSfWHtsG3oMr7Rk0DCbEQfe0BowyE+Md
         5ICL3yNYWkprRUL3Ky6yU2vORYFYLglnhrlJLS9zPcyLrz1MrmhMH0FJLoZhbhuT7Bq1
         KyLZ4SOzQ9RWKK+FHEZrbIaeCuO7pbuITy3gmulkTPHuNpQJ1qqJryC2rGfuyaN0sLhm
         Sffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xWnk1zhA+vn+nW3w42ayU/OjstYCdCexzNniruQih+g=;
        b=4wSn2MM89oHunQyXakjQdzhc7rltstFlsA+kjEVS4Qo/pbOAa5Ck+KlxPt6XcZWHeV
         HZgsalsgPayqhYkwqCbRDRPos+qBwhmshe0EpbQ7AukeUwjwI8vr6NkIgy1YHRSa05ir
         Cz1CsKQtDoSKZIm7PimpwehyfYnkC++73zWSfg/VFWGlCEsWqHuw9ox9PhC8yXeAUG/z
         o9CUL3PUAQ+Hg+8kp68F2quFnE2yBZb+TxhQB6GIVM/9nCJhNgmUSe4NrWSUfMPLOvtO
         MRBLeUYsV1wVFuK4mo5/cqmVXO/Kzscrd8O/iNyidVOu/q+oWfvyFf9PJmVzwLnYQWeZ
         /o/w==
X-Gm-Message-State: AOAM533loC5/0vYm8XkRWUqTLmPeYpN9/5aUzs0rbKmZ00f97P3rnhx5
        ULWwJFPwf8lhL9KK/ZeXK9Ay+A==
X-Google-Smtp-Source: ABdhPJy0Msy6XiUi6y8OoQrClqzhGEzN6492LH+bFstd0k0W3eF2SMF0KSwiut6TH7M/9fcO9KgPNQ==
X-Received: by 2002:a1c:4408:0:b0:38e:aa45:db99 with SMTP id r8-20020a1c4408000000b0038eaa45db99mr20945659wma.176.1650977454596;
        Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:faf0:6ae0:9a53:ee37])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c3b9400b00393ea849663sm6128600wms.30.2022.04.26.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
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
Subject: [libgpiod v2][PATCH v6 5/5] bindings: cxx: add implementation
Date:   Tue, 26 Apr 2022 14:50:23 +0200
Message-Id: <20220426125023.2664623-6-brgl@bgdev.pl>
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

This contains the actual implementation of the v2 C++ bindings.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/Makefile.am           |  45 ++
 bindings/cxx/chip-info.cpp         |  74 ++++
 bindings/cxx/chip.cpp              | 218 +++++++++
 bindings/cxx/edge-event-buffer.cpp | 115 +++++
 bindings/cxx/edge-event.cpp        | 135 ++++++
 bindings/cxx/exception.cpp         | 119 +++++
 bindings/cxx/gpiod.hpp             |  46 ++
 bindings/cxx/info-event.cpp        | 102 +++++
 bindings/cxx/internal.cpp          |  28 ++
 bindings/cxx/internal.hpp          | 207 +++++++++
 bindings/cxx/libgpiodcxx.pc.in     |  14 +
 bindings/cxx/line-config.cpp       | 685 +++++++++++++++++++++++++++++
 bindings/cxx/line-info.cpp         | 189 ++++++++
 bindings/cxx/line-request.cpp      | 225 ++++++++++
 bindings/cxx/line.cpp              | 128 ++++++
 bindings/cxx/misc.cpp              |  20 +
 bindings/cxx/request-config.cpp    | 174 ++++++++
 17 files changed, 2524 insertions(+)
 create mode 100644 bindings/cxx/Makefile.am
 create mode 100644 bindings/cxx/chip-info.cpp
 create mode 100644 bindings/cxx/chip.cpp
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/exception.cpp
 create mode 100644 bindings/cxx/gpiod.hpp
 create mode 100644 bindings/cxx/info-event.cpp
 create mode 100644 bindings/cxx/internal.cpp
 create mode 100644 bindings/cxx/internal.hpp
 create mode 100644 bindings/cxx/libgpiodcxx.pc.in
 create mode 100644 bindings/cxx/line-config.cpp
 create mode 100644 bindings/cxx/line-info.cpp
 create mode 100644 bindings/cxx/line-request.cpp
 create mode 100644 bindings/cxx/line.cpp
 create mode 100644 bindings/cxx/misc.cpp
 create mode 100644 bindings/cxx/request-config.cpp

diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
new file mode 100644
index 0000000..29d4f2d
--- /dev/null
+++ b/bindings/cxx/Makefile.am
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+lib_LTLIBRARIES = libgpiodcxx.la
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
+libgpiodcxx_la_CPPFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
+libgpiodcxx_la_CPPFLAGS += $(PROFILING_CFLAGS)
+libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
+libgpiodcxx_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
+libgpiodcxx_la_LDFLAGS += $(PROFILING_LDFLAGS)
+
+include_HEADERS = gpiod.hpp
+
+pkgconfigdir = $(libdir)/pkgconfig
+pkgconfig_DATA = libgpiodcxx.pc
+
+SUBDIRS = gpiodcxx .
+
+if WITH_TESTS
+
+SUBDIRS += tests
+
+endif
+
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
diff --git a/bindings/cxx/chip-info.cpp b/bindings/cxx/chip-info.cpp
new file mode 100644
index 0000000..b6d5cb7
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
+	out << "gpiod::chip_info(name=\"" << info.name() <<
+	       "\", label=\"" << info.label() <<
+	       "\", num_lines=" << info.num_lines() << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
new file mode 100644
index 0000000..4b5e3d7
--- /dev/null
+++ b/bindings/cxx/chip.cpp
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.hpp"
+
+namespace gpiod {
+
+namespace {
+
+using chip_deleter = deleter<::gpiod_chip, ::gpiod_chip_close>;
+using chip_ptr = ::std::unique_ptr<::gpiod_chip, chip_deleter>;
+
+chip_ptr open_chip(const ::std::filesystem::path& path)
+{
+	chip_ptr chip(::gpiod_chip_open(path.c_str()));
+	if (!chip)
+		throw_from_errno("unable to open the GPIO device " + path.string());
+
+	return chip;
+}
+
+} /* namespace */
+
+struct chip::impl
+{
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
+
+	chip_ptr chip;
+};
+
+GPIOD_CXX_API chip::chip(const ::std::filesystem::path& path)
+	: _m_priv(new impl(path))
+{
+
+}
+
+GPIOD_CXX_API chip::chip(chip&& other) noexcept
+	: _m_priv(::std::move(other._m_priv))
+{
+
+}
+
+GPIOD_CXX_API chip::~chip(void)
+{
+
+}
+
+GPIOD_CXX_API chip& chip::operator=(chip&& other) noexcept
+{
+	this->_m_priv = ::std::move(other._m_priv);
+
+	return *this;
+}
+
+GPIOD_CXX_API chip::operator bool(void) const noexcept
+{
+	return this->_m_priv->chip.get() != nullptr;
+}
+
+GPIOD_CXX_API void chip::close(void)
+{
+	this->_m_priv->throw_if_closed();
+
+	this->_m_priv->chip.reset();
+}
+
+GPIOD_CXX_API ::std::filesystem::path chip::path(void) const
+{
+	this->_m_priv->throw_if_closed();
+
+	return ::gpiod_chip_get_path(this->_m_priv->chip.get());
+}
+
+GPIOD_CXX_API chip_info chip::get_info(void) const
+{
+	this->_m_priv->throw_if_closed();
+
+	chip_info_ptr info(::gpiod_chip_get_info(this->_m_priv->chip.get()));
+	if (!info)
+		throw_from_errno("failed to retrieve GPIO chip info");
+
+	chip_info ret;
+
+	ret._m_priv->set_info_ptr(info);
+
+	return ret;
+}
+
+GPIOD_CXX_API line_info chip::get_line_info(line::offset offset) const
+{
+	this->_m_priv->throw_if_closed();
+
+	line_info_ptr info(::gpiod_chip_get_line_info(this->_m_priv->chip.get(), offset));
+	if (!info)
+		throw_from_errno("unable to retrieve GPIO line info");
+
+	line_info ret;
+
+	ret._m_priv->set_info_ptr(info);
+
+	return ret;
+}
+
+GPIOD_CXX_API line_info chip::watch_line_info(line::offset offset) const
+{
+	this->_m_priv->throw_if_closed();
+
+	line_info_ptr info(::gpiod_chip_watch_line_info(this->_m_priv->chip.get(), offset));
+	if (!info)
+		throw_from_errno("unable to start watching GPIO line info changes");
+
+	line_info ret;
+
+	ret._m_priv->set_info_ptr(info);
+
+	return ret;
+}
+
+GPIOD_CXX_API void chip::unwatch_line_info(line::offset offset) const
+{
+	this->_m_priv->throw_if_closed();
+
+	int ret = ::gpiod_chip_unwatch_line_info(this->_m_priv->chip.get(), offset);
+	if (ret)
+		throw_from_errno("unable to unwatch line status changes");
+}
+
+GPIOD_CXX_API int chip::fd(void) const
+{
+	this->_m_priv->throw_if_closed();
+
+	return ::gpiod_chip_get_fd(this->_m_priv->chip.get());
+}
+
+GPIOD_CXX_API bool chip::wait_info_event(const ::std::chrono::nanoseconds& timeout) const
+{
+	this->_m_priv->throw_if_closed();
+
+	int ret = ::gpiod_chip_wait_info_event(this->_m_priv->chip.get(), timeout.count());
+	if (ret < 0)
+		throw_from_errno("error waiting for info events");
+
+	return ret;
+}
+
+GPIOD_CXX_API info_event chip::read_info_event(void) const
+{
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
+}
+
+GPIOD_CXX_API int chip::get_line_offset_from_name(const ::std::string& name) const
+{
+	this->_m_priv->throw_if_closed();
+
+	int ret = ::gpiod_chip_get_line_offset_from_name(this->_m_priv->chip.get(), name.c_str());
+	if (ret < 0) {
+		if (errno == ENOENT)
+			return -1;
+
+		throw_from_errno("error looking up line by name");
+	}
+
+	return ret;
+}
+
+GPIOD_CXX_API line_request chip::request_lines(const request_config& req_cfg,
+					       const line_config& line_cfg)
+{
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
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const chip& chip)
+{
+	if (!chip)
+		out << "gpiod::chip(closed)";
+	else
+		out << "gpiod::chip(path=" << chip.path() <<
+		       ", info=" << chip.get_info() << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
new file mode 100644
index 0000000..5519c33
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
+	out << "gpiod::edge_event_buffer(num_events=" << buf.num_events() <<
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
index 0000000..5797e88
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
+	out << "gpiod::edge_event(type='" << event_type_names.at(event.type()) <<
+	       "', timestamp=" << event.timestamp_ns() <<
+	       ", line_offset=" << event.line_offset() <<
+	       ", global_seqno=" << event.global_seqno() <<
+	       ", line_seqno=" << event.line_seqno() << ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
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
new file mode 100644
index 0000000..dc7e938
--- /dev/null
+++ b/bindings/cxx/gpiod.hpp
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file gpiod.hpp
+ */
+
+#ifndef __LIBGPIOD_GPIOD_CXX_HPP__
+#define __LIBGPIOD_GPIOD_CXX_HPP__
+
+/**
+ * @defgroup gpiod_cxx C++ bindings
+ *
+ * C++ bindings for libgpiod.
+ */
+
+/**
+ * @cond
+ */
+
+/*
+ * We don't make this symbol private because it needs to be accessible by
+ * the declarations in exception.hpp in order to expose the symbols of classes
+ * inheriting from standard exceptions.
+ */
+#define GPIOD_CXX_API __attribute__((visibility("default")))
+
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
+
+/**
+ * @endcond
+ */
+
+#endif /* __LIBGPIOD_GPIOD_CXX_HPP__ */
diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
new file mode 100644
index 0000000..a98c261
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
+	out << "gpiod::info_event(event_type='" << event_type_names.at(event.type()) <<
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
new file mode 100644
index 0000000..c4b5d34
--- /dev/null
+++ b/bindings/cxx/internal.hpp
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __LIBGPIOD_CXX_INTERNAL_HPP__
+#define __LIBGPIOD_CXX_INTERNAL_HPP__
+
+#include <gpiod.h>
+#include <iostream>
+#include <iterator>
+#include <memory>
+#include <string>
+#include <utility>
+#include <vector>
+
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
diff --git a/bindings/cxx/libgpiodcxx.pc.in b/bindings/cxx/libgpiodcxx.pc.in
new file mode 100644
index 0000000..731227c
--- /dev/null
+++ b/bindings/cxx/libgpiodcxx.pc.in
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+libdir=@libdir@
+includedir=@includedir@
+
+Name: libgpiodcxx
+Description: C++ bindings for libgpiod
+URL: @PACKAGE_URL@
+Version: @PACKAGE_VERSION@
+Libs: -L${libdir} -lgpiodcxx
+Cflags: -I${includedir}
diff --git a/bindings/cxx/line-config.cpp b/bindings/cxx/line-config.cpp
new file mode 100644
index 0000000..d6469cb
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
+	out << "gpiod::line_config(defaults=(direction=" << config.direction_default() <<
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
index 0000000..a5109b2
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
+	out << "gpiod::line_info(offset=" << info.offset() <<
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
index 0000000..e573d23
--- /dev/null
+++ b/bindings/cxx/line-request.cpp
@@ -0,0 +1,225 @@
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
+	auto num_lines = this->num_lines();
+	for (unsigned int i = 0; i < num_lines; i++)
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
+		out << "gpiod::line_request(released)";
+	else
+		out << "gpiod::line_request(num_lines=" << request.num_lines() <<
+		       ", line_offsets=" << request.offsets() <<
+		       ", fd=" << request.fd() <<
+		       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
new file mode 100644
index 0000000..fc20c62
--- /dev/null
+++ b/bindings/cxx/line.cpp
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: LGPL-3.0-or-later
+// SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.hpp"
+
+namespace gpiod {
+namespace line {
+
+namespace {
+
+const ::std::map<line::value, ::std::string> value_names = {
+	{ line::value::INACTIVE,	"INACTIVE" },
+	{ line::value::ACTIVE,		"ACTIVE" }
+};
+
+const ::std::map<line::direction, ::std::string> direction_names = {
+	{ line::direction::AS_IS,	"AS_IS" },
+	{ line::direction::INPUT,	"INPUT" },
+	{ line::direction::OUTPUT,	"OUTPUT" }
+};
+
+const ::std::map<line::bias, ::std::string> bias_names = {
+	{ line::bias::AS_IS,		"AS_IS" },
+	{ line::bias::UNKNOWN,		"UNKNOWN" },
+	{ line::bias::DISABLED,		"DISABLED" },
+	{ line::bias::PULL_UP,		"PULL_UP" },
+	{ line::bias::PULL_DOWN,	"PULL_DOWN" }
+};
+
+const ::std::map<line::drive, ::std::string> drive_names = {
+	{ line::drive::PUSH_PULL,	"PUSH_PULL" },
+	{ line::drive::OPEN_DRAIN,	"OPEN_DRAIN" },
+	{ line::drive::OPEN_SOURCE,	"OPEN_SOURCE" }
+};
+
+const ::std::map<line::edge, ::std::string> edge_names = {
+	{ line::edge::NONE,		"NONE" },
+	{ line::edge::RISING,		"RISING_EDGE" },
+	{ line::edge::FALLING,		"FALLING_EDGE" },
+	{ line::edge::BOTH,		"BOTH_EDGES" }
+};
+
+const ::std::map<line::clock, ::std::string> clock_names = {
+	{ line::clock::MONOTONIC,	"MONOTONIC" },
+	{ line::clock::REALTIME,	"REALTIME" }
+};
+
+} /* namespace */
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::value val)
+{
+	out << value_names.at(val);
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::direction dir)
+{
+	out << direction_names.at(dir);
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::edge edge)
+{
+	out << edge_names.at(edge);
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::bias bias)
+{
+	out << bias_names.at(bias);
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::drive drive)
+{
+	out << drive_names.at(drive);
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, line::clock clock)
+{
+	out << clock_names.at(clock);
+
+	return out;
+}
+
+template<typename T>
+::std::ostream& insert_vector(::std::ostream& out,
+			      const ::std::string& name, const ::std::vector<T>& vec)
+{
+	out << name << "(";
+	::std::copy(vec.begin(), ::std::prev(vec.end()),
+		    ::std::ostream_iterator<T>(out, ", "));
+	out << vec.back();
+	out << ")";
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const offsets& offs)
+{
+	return insert_vector(out, "gpiod::offsets", offs);
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line::values& vals)
+{
+	return insert_vector(out, "gpiod::values", vals);
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line::value_mapping& mapping)
+{
+	out << "gpiod::value_mapping(" << mapping.first << ": " << mapping.second << ")";
+
+	return out;
+}
+
+GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line::value_mappings& mappings)
+{
+	return insert_vector(out, "gpiod::value_mappings", mappings);
+}
+
+} /* namespace line */
+} /* namespace gpiod */
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
index 0000000..9f77533
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
+	out << "gpiod::request_config(consumer=" << consumer <<
+	       ", num_offsets=" << config.num_offsets() <<
+	       ", offsets=(" << config.offsets() << ")" <<
+	       ", event_buffer_size=" << config.event_buffer_size() <<
+	       ")";
+
+	return out;
+}
+
+} /* namespace gpiod */
-- 
2.32.0

