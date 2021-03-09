Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531D1332722
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhCIN1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhCIN0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:48 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7F6C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:47 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i9so1857876wml.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QuIht14uLLmapAMbskQwEfod4dUk+kZtfqeNlH73Ryw=;
        b=btKML2NrQbD81W3gZOB1OVwk7LpvThDjqqh6J7qrQ0HkmAEFMrOSW6dXt+lhPgtNm0
         hOVUQu6mRdw6Ne4z+eeWWgEPVRGZorpddTWx2ltQ44CssYAk8TaqtbCPP5I4jLMab28o
         olM0Xf5ZLPMcSrcYePfit/gGktSN38JGbrdsyWDGPZ2Qb0QdAMnPINAJXKr57Sagcn7j
         rBdA2MI+X1eeuH7SrJ9ggtssOjY8l3vRsgS6SQwcMQxpBLMum+x1FrsWH2u+/yHziEKU
         WMVmK70a8IP18rXio7u77+iGLFcciuZHlkf+kXGuuIvpwUBvknHOOb8o/JN8pHp5c9TP
         4Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QuIht14uLLmapAMbskQwEfod4dUk+kZtfqeNlH73Ryw=;
        b=YyUSNW20hhgHeCMmE6mhiCV/LWoUaQUjQCGgH2ww0xYS9q/qJs/nwmUHH3KhuLUO1s
         8WM1Xgh43YpEL9M/QO0/iSvba2IbmwDK4C0bX7HELT08NqmdIG1AE8pQ7zjBul0L7dEc
         YNV84uaapt3nNp5tIoiZntRSh00U2NnS4BATB5M9TlWzXo7+IFfBiH+MdZ/cYiDGGyv7
         D9E3JX/zLMEN0xSDD2yJiSLBPhwuOUEH6vqvlI+p565nzCuTPDi3lMUvYkGhrs9Q3yyQ
         d88/mbgjtYoOI/AU5S3Y1mlniCjLzNWzn/UNDtMuP+1YLu0cfsXu50XGXFq4Iwamrr3i
         sNLQ==
X-Gm-Message-State: AOAM530iBHz/xXoIN7EUffMcWo52FM50diUnvyX9R4ahSDmhACzME5Xr
        iVWxDNPgCCUdQSwkHiPfoJrrcQUC7TnHNA==
X-Google-Smtp-Source: ABdhPJzfZbsUy5Sgi7GaXltJTduUVNUeHhCLvlUi+34lrl7NppgIc3Vl0YMUynHlfY8eop0v7Yj9ow==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr4014012wmj.176.1615296405133;
        Tue, 09 Mar 2021 05:26:45 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 6/6] core: hide the GPIOD_API symbol
Date:   Tue,  9 Mar 2021 14:26:39 +0100
Message-Id: <20210309132639.29069-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
References: <20210309132639.29069-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

GPIOD_API is unneccesarily polluting the user-facing headers. There's no
advantage to having it in public files. Let's make them internal to the
library. Upcoming modifications will also make GPIOD_BIT() redundant so
we'll be able to remove all macros unrelated to the main functionality
from gpiod.h.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/Makefile.am   |   2 +-
 bindings/cxx/chip.cpp      |  40 +++----
 bindings/cxx/gpiod.hpp     | 227 ++++++++++++++++++-------------------
 bindings/cxx/internal.hpp  |   9 ++
 bindings/cxx/iter.cpp      |  18 +--
 bindings/cxx/line.cpp      |  66 +++++------
 bindings/cxx/line_bulk.cpp |  78 ++++++-------
 include/gpiod.h            | 158 ++++++++++++--------------
 lib/Makefile.am            |   2 +-
 lib/core.c                 | 135 +++++++++++-----------
 lib/helpers.c              | 100 +++++++++-------
 lib/internal.h             |  11 ++
 lib/misc.c                 |   4 +-
 13 files changed, 441 insertions(+), 409 deletions(-)
 create mode 100644 bindings/cxx/internal.hpp
 create mode 100644 lib/internal.h

diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index 655d1cd..d9fa577 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES = chip.cpp iter.cpp line.cpp line_bulk.cpp
+libgpiodcxx_la_SOURCES = chip.cpp internal.h iter.cpp line.cpp line_bulk.cpp
 libgpiodcxx_la_CPPFLAGS = -Wall -Wextra -g -std=gnu++11
 libgpiodcxx_la_CPPFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 0886717..d5a9837 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -7,41 +7,43 @@
 #include <system_error>
 #include <utility>
 
+#include "internal.hpp"
+
 namespace gpiod {
 
 namespace {
 
-void chip_deleter(::gpiod_chip* chip)
+GPIOD_CXX_API void chip_deleter(::gpiod_chip* chip)
 {
 	::gpiod_chip_unref(chip);
 }
 
 } /* namespace */
 
-bool is_gpiochip_device(const ::std::string& path)
+GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
 {
 	return ::gpiod_is_gpiochip_device(path.c_str());
 }
 
-chip::chip(const ::std::string& path)
+GPIOD_CXX_API chip::chip(const ::std::string& path)
 	: _m_chip()
 {
 	this->open(path);
 }
 
-chip::chip(::gpiod_chip* chip)
+GPIOD_CXX_API chip::chip(::gpiod_chip* chip)
 	: _m_chip(chip, chip_deleter)
 {
 
 }
 
-chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
+GPIOD_CXX_API chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
 	: _m_chip(chip_ptr)
 {
 
 }
 
-void chip::open(const ::std::string& path)
+GPIOD_CXX_API void chip::open(const ::std::string& path)
 {
 	::gpiod_chip *chip = ::gpiod_chip_open(path.c_str());
 	if (!chip)
@@ -51,33 +53,33 @@ void chip::open(const ::std::string& path)
 	this->_m_chip.reset(chip, chip_deleter);
 }
 
-void chip::reset(void) noexcept
+GPIOD_CXX_API void chip::reset(void) noexcept
 {
 	this->_m_chip.reset();
 }
 
-::std::string chip::name(void) const
+GPIOD_CXX_API ::std::string chip::name(void) const
 {
 	this->throw_if_noref();
 
 	return ::std::string(::gpiod_chip_name(this->_m_chip.get()));
 }
 
-::std::string chip::label(void) const
+GPIOD_CXX_API ::std::string chip::label(void) const
 {
 	this->throw_if_noref();
 
 	return ::std::string(::gpiod_chip_label(this->_m_chip.get()));
 }
 
-unsigned int chip::num_lines(void) const
+GPIOD_CXX_API unsigned int chip::num_lines(void) const
 {
 	this->throw_if_noref();
 
 	return ::gpiod_chip_num_lines(this->_m_chip.get());
 }
 
-line chip::get_line(unsigned int offset) const
+GPIOD_CXX_API line chip::get_line(unsigned int offset) const
 {
 	this->throw_if_noref();
 
@@ -92,7 +94,7 @@ line chip::get_line(unsigned int offset) const
 	return line(line_handle, *this);
 }
 
-int chip::find_line(const ::std::string& name) const
+GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
 {
 	this->throw_if_noref();
 
@@ -106,7 +108,7 @@ int chip::find_line(const ::std::string& name) const
 	return -1;
 }
 
-line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
+GPIOD_CXX_API line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
 {
 	line_bulk lines;
 
@@ -116,7 +118,7 @@ line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
 	return lines;
 }
 
-line_bulk chip::get_all_lines(void) const
+GPIOD_CXX_API line_bulk chip::get_all_lines(void) const
 {
 	line_bulk lines;
 
@@ -126,27 +128,27 @@ line_bulk chip::get_all_lines(void) const
 	return lines;
 }
 
-bool chip::operator==(const chip& rhs) const noexcept
+GPIOD_CXX_API bool chip::operator==(const chip& rhs) const noexcept
 {
 	return this->_m_chip.get() == rhs._m_chip.get();
 }
 
-bool chip::operator!=(const chip& rhs) const noexcept
+GPIOD_CXX_API bool chip::operator!=(const chip& rhs) const noexcept
 {
 	return this->_m_chip.get() != rhs._m_chip.get();
 }
 
-chip::operator bool(void) const noexcept
+GPIOD_CXX_API chip::operator bool(void) const noexcept
 {
 	return this->_m_chip.get() != nullptr;
 }
 
-bool chip::operator!(void) const noexcept
+GPIOD_CXX_API bool chip::operator!(void) const noexcept
 {
 	return this->_m_chip.get() == nullptr;
 }
 
-void chip::throw_if_noref(void) const
+GPIOD_CXX_API void chip::throw_if_noref(void) const
 {
 	if (!this->_m_chip.get())
 		throw ::std::logic_error("object not associated with an open GPIO chip");
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 003acdd..e3ce2fc 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -34,7 +34,7 @@ struct line_event;
  * @return True if the file exists and is a GPIO chip character device or a
  *         symbolic link to it.
  */
-bool is_gpiochip_device(const ::std::string& path) GPIOD_API;
+bool is_gpiochip_device(const ::std::string& path);
 
 /**
  * @brief Represents a GPIO chip.
@@ -50,44 +50,44 @@ public:
 	/**
 	 * @brief Default constructor. Creates an empty GPIO chip object.
 	 */
-	GPIOD_API chip(void) = default;
+	chip(void) = default;
 
 	/**
 	 * @brief Constructor. Opens the chip using chip::open.
 	 * @param path Path to the GPIO chip device.
 	 */
-	GPIOD_API chip(const ::std::string& path);
+	chip(const ::std::string& path);
 
 	/**
 	 * @brief Copy constructor. References the object held by other.
 	 * @param other Other chip object.
 	 */
-	GPIOD_API chip(const chip& other) = default;
+	chip(const chip& other) = default;
 
 	/**
 	 * @brief Move constructor. References the object held by other.
 	 * @param other Other chip object.
 	 */
-	GPIOD_API chip(chip&& other) = default;
+	chip(chip&& other) = default;
 
 	/**
 	 * @brief Assignment operator. References the object held by other.
 	 * @param other Other chip object.
 	 * @return Reference to this object.
 	 */
-	GPIOD_API chip& operator=(const chip& other) = default;
+	chip& operator=(const chip& other) = default;
 
 	/**
 	 * @brief Move assignment operator. References the object held by other.
 	 * @param other Other chip object.
 	 * @return Reference to this object.
 	 */
-	GPIOD_API chip& operator=(chip&& other) = default;
+	chip& operator=(chip&& other) = default;
 
 	/**
 	 * @brief Destructor. Unreferences the internal chip object.
 	 */
-	GPIOD_API ~chip(void) = default;
+	~chip(void) = default;
 
 	/**
 	 * @brief Open a GPIO chip.
@@ -96,37 +96,37 @@ public:
 	 * If the object already holds a reference to an open chip, it will be
 	 * closed and the reference reset.
 	 */
-	GPIOD_API void open(const ::std::string &path);
+	void open(const ::std::string &path);
 
 	/**
 	 * @brief Reset the internal smart pointer owned by this object.
 	 */
-	GPIOD_API void reset(void) noexcept;
+	void reset(void) noexcept;
 
 	/**
 	 * @brief Return the name of the chip held by this object.
 	 * @return Name of the GPIO chip.
 	 */
-	GPIOD_API ::std::string name(void) const;
+	::std::string name(void) const;
 
 	/**
 	 * @brief Return the label of the chip held by this object.
 	 * @return Label of the GPIO chip.
 	 */
-	GPIOD_API ::std::string label(void) const;
+	::std::string label(void) const;
 
 	/**
 	 * @brief Return the number of lines exposed by this chip.
 	 * @return Number of lines.
 	 */
-	GPIOD_API unsigned int num_lines(void) const;
+	unsigned int num_lines(void) const;
 
 	/**
 	 * @brief Get the line exposed by this chip at given offset.
 	 * @param offset Offset of the line.
 	 * @return Line object.
 	 */
-	GPIOD_API line get_line(unsigned int offset) const;
+	line get_line(unsigned int offset) const;
 
 	/**
 	 * @brief Map a GPIO line's name to its offset within the chip.
@@ -134,46 +134,46 @@ public:
 	 * @return Offset of the line within the chip or -1 if a line with
 	 *         given name is not exposed by the chip.
 	 */
-	GPIOD_API int find_line(const ::std::string& name) const;
+	int find_line(const ::std::string& name) const;
 
 	/**
 	 * @brief Get a set of lines exposed by this chip at given offsets.
 	 * @param offsets Vector of line offsets.
 	 * @return Set of lines held by a line_bulk object.
 	 */
-	GPIOD_API line_bulk get_lines(const ::std::vector<unsigned int>& offsets) const;
+	line_bulk get_lines(const ::std::vector<unsigned int>& offsets) const;
 
 	/**
 	 * @brief Get all lines exposed by this chip.
 	 * @return All lines exposed by this chip held by a line_bulk object.
 	 */
-	GPIOD_API line_bulk get_all_lines(void) const;
+	line_bulk get_all_lines(void) const;
 
 	/**
 	 * @brief Equality operator.
 	 * @param rhs Right-hand side of the equation.
 	 * @return True if rhs references the same chip. False otherwise.
 	 */
-	GPIOD_API bool operator==(const chip& rhs) const noexcept;
+	bool operator==(const chip& rhs) const noexcept;
 
 	/**
 	 * @brief Inequality operator.
 	 * @param rhs Right-hand side of the equation.
 	 * @return False if rhs references the same chip. True otherwise.
 	 */
-	GPIOD_API bool operator!=(const chip& rhs) const noexcept;
+	bool operator!=(const chip& rhs) const noexcept;
 
 	/**
 	 * @brief Check if this object holds a reference to a GPIO chip.
 	 * @return True if this object references a GPIO chip, false otherwise.
 	 */
-	GPIOD_API explicit operator bool(void) const noexcept;
+	explicit operator bool(void) const noexcept;
 
 	/**
 	 * @brief Check if this object doesn't hold a reference to a GPIO chip.
 	 * @return False if this object references a GPIO chip, true otherwise.
 	 */
-	GPIOD_API bool operator!(void) const noexcept;
+	bool operator!(void) const noexcept;
 
 private:
 
@@ -212,17 +212,17 @@ struct line_request
 		/**< Listen for all types of events. */
 	};
 
-	GPIOD_API static const ::std::bitset<32> FLAG_ACTIVE_LOW;
+	static const ::std::bitset<32> FLAG_ACTIVE_LOW;
 	/**< Set the active state to 'low' (high is the default). */
-	GPIOD_API static const ::std::bitset<32> FLAG_OPEN_SOURCE;
+	static const ::std::bitset<32> FLAG_OPEN_SOURCE;
 	/**< The line is an open-source port. */
-	GPIOD_API static const ::std::bitset<32> FLAG_OPEN_DRAIN;
+	static const ::std::bitset<32> FLAG_OPEN_DRAIN;
 	/**< The line is an open-drain port. */
-	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_DISABLED;
+	static const ::std::bitset<32> FLAG_BIAS_DISABLED;
 	/**< The line has neither pull-up nor pull-down resistor enabled. */
-	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_DOWN;
+	static const ::std::bitset<32> FLAG_BIAS_PULL_DOWN;
 	/**< The line has a configurable pull-down resistor enabled. */
-	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_UP;
+	static const ::std::bitset<32> FLAG_BIAS_PULL_UP;
 	/**< The line has a configurable pull-up resistor enabled. */
 
 	::std::string consumer;
@@ -247,112 +247,112 @@ public:
 	/**
 	 * @brief Default constructor. Creates an empty line object.
 	 */
-	GPIOD_API line(void);
+	line(void);
 
 	/**
 	 * @brief Copy constructor.
 	 * @param other Other line object.
 	 */
-	GPIOD_API line(const line& other) = default;
+	line(const line& other) = default;
 
 	/**
 	 * @brief Move constructor.
 	 * @param other Other line object.
 	 */
-	GPIOD_API line(line&& other) = default;
+	line(line&& other) = default;
 
 	/**
 	 * @brief Assignment operator.
 	 * @param other Other line object.
 	 * @return Reference to this object.
 	 */
-	GPIOD_API line& operator=(const line& other) = default;
+	line& operator=(const line& other) = default;
 
 	/**
 	 * @brief Move assignment operator.
 	 * @param other Other line object.
 	 * @return Reference to this object.
 	 */
-	GPIOD_API line& operator=(line&& other) = default;
+	line& operator=(line&& other) = default;
 
 	/**
 	 * @brief Destructor.
 	 */
-	GPIOD_API ~line(void) = default;
+	~line(void) = default;
 
 	/**
 	 * @brief Get the offset of this line.
 	 * @return Offet of this line.
 	 */
-	GPIOD_API unsigned int offset(void) const;
+	unsigned int offset(void) const;
 
 	/**
 	 * @brief Get the name of this line (if any).
 	 * @return Name of this line or an empty string if it is unnamed.
 	 */
-	GPIOD_API ::std::string name(void) const;
+	::std::string name(void) const;
 
 	/**
 	 * @brief Get the consumer of this line (if any).
 	 * @return Name of the consumer of this line or an empty string if it
 	 *         is unused.
 	 */
-	GPIOD_API ::std::string consumer(void) const;
+	::std::string consumer(void) const;
 
 	/**
 	 * @brief Get current direction of this line.
 	 * @return Current direction setting.
 	 */
-	GPIOD_API int direction(void) const;
+	int direction(void) const;
 
 	/**
 	 * @brief Check if this line's signal is inverted.
 	 * @return True if this line is "active-low", false otherwise.
 	 */
-	GPIOD_API bool is_active_low(void) const;
+	bool is_active_low(void) const;
 
 	/**
 	 * @brief Get current bias of this line.
 	 * @return Current bias setting.
 	 */
-	GPIOD_API int bias(void) const;
+	int bias(void) const;
 
 	/**
 	 * @brief Check if this line is used by the kernel or other user space
 	 *        process.
 	 * @return True if this line is in use, false otherwise.
 	 */
-	GPIOD_API bool is_used(void) const;
+	bool is_used(void) const;
 
 	/**
 	 * @brief Get current drive setting of this line.
 	 * @return Current drive setting.
 	 */
-	GPIOD_API int drive(void) const;
+	int drive(void) const;
 
 	/**
 	 * @brief Request this line.
 	 * @param config Request config (see gpiod::line_request).
 	 * @param default_val Default value - only matters for OUTPUT direction.
 	 */
-	GPIOD_API void request(const line_request& config, int default_val = 0) const;
+	void request(const line_request& config, int default_val = 0) const;
 
 	/**
 	 * @brief Release the line if it was previously requested.
 	 */
-	GPIOD_API void release(void) const;
+	void release(void) const;
 
 	/**
 	 * @brief Read the line value.
 	 * @return Current value (0 or 1).
 	 */
-	GPIOD_API int get_value(void) const;
+	int get_value(void) const;
 
 	/**
 	 * @brief Set the value of this line.
 	 * @param val New value (0 or 1).
 	 */
-	GPIOD_API void set_value(int val) const;
+	void set_value(int val) const;
 
 	/**
 	 * @brief Set configuration of this line.
@@ -360,25 +360,24 @@ public:
 	 * @param flags Replacement flags.
 	 * @param value New value (0 or 1) - only matters for OUTPUT direction.
 	 */
-	GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
-				  int value = 0) const;
+	void set_config(int direction, ::std::bitset<32> flags, int value = 0) const;
 
 	/**
 	 * @brief Set configuration flags of this line.
 	 * @param flags Replacement flags.
 	 */
-	GPIOD_API void set_flags(::std::bitset<32> flags) const;
+	void set_flags(::std::bitset<32> flags) const;
 
 	/**
 	 * @brief Change the direction this line to input.
 	 */
-	GPIOD_API void set_direction_input() const;
+	void set_direction_input() const;
 
 	/**
 	 * @brief Change the direction this lines to output.
 	 * @param value New value (0 or 1).
 	 */
-	GPIOD_API void set_direction_output(int value = 0) const;
+	void set_direction_output(int value = 0) const;
 
 	/**
 	 * @brief Wait for an event on this line.
@@ -386,31 +385,31 @@ public:
 	 * @return True if an event occurred and can be read, false if the wait
 	 *         timed out.
 	 */
-	GPIOD_API bool event_wait(const ::std::chrono::nanoseconds& timeout) const;
+	bool event_wait(const ::std::chrono::nanoseconds& timeout) const;
 
 	/**
 	 * @brief Read a line event.
 	 * @return Line event object.
 	 */
-	GPIOD_API line_event event_read(void) const;
+	line_event event_read(void) const;
 
 	/**
 	 * @brief Read multiple line events.
 	 * @return Vector of line event objects.
 	 */
-	GPIOD_API ::std::vector<line_event> event_read_multiple(void) const;
+	::std::vector<line_event> event_read_multiple(void) const;
 
 	/**
 	 * @brief Get the event file descriptor associated with this line.
 	 * @return File descriptor number.
 	 */
-	GPIOD_API int event_get_fd(void) const;
+	int event_get_fd(void) const;
 
 	/**
 	 * @brief Get the parent chip.
 	 * @return Parent chip of this line.
 	 */
-	GPIOD_API const chip get_chip(void) const;
+	const chip get_chip(void) const;
 
 	/**
 	 * @brief Reset the state of this object.
@@ -419,34 +418,34 @@ public:
 	 * but wants to drop the reference to the GPIO chip indirectly held by
 	 * the line being the source of the event.
 	 */
-	GPIOD_API void reset(void);
+	void reset(void);
 
 	/**
 	 * @brief Check if two line objects reference the same GPIO line.
 	 * @param rhs Right-hand side of the equation.
 	 * @return True if both objects reference the same line, fale otherwise.
 	 */
-	GPIOD_API bool operator==(const line& rhs) const noexcept;
+	bool operator==(const line& rhs) const noexcept;
 
 	/**
 	 * @brief Check if two line objects reference different GPIO lines.
 	 * @param rhs Right-hand side of the equation.
 	 * @return False if both objects reference the same line, true otherwise.
 	 */
-	GPIOD_API bool operator!=(const line& rhs) const noexcept;
+	bool operator!=(const line& rhs) const noexcept;
 
 	/**
 	 * @brief Check if this object holds a reference to any GPIO line.
 	 * @return True if this object references a GPIO line, false otherwise.
 	 */
-	GPIOD_API explicit operator bool(void) const noexcept;
+	explicit operator bool(void) const noexcept;
 
 	/**
 	 * @brief Check if this object doesn't reference any GPIO line.
 	 * @return True if this object doesn't reference any GPIO line, true
 	 *         otherwise.
 	 */
-	GPIOD_API bool operator!(void) const noexcept;
+	bool operator!(void) const noexcept;
 
 	/**
 	 * @brief Possible direction settings.
@@ -550,45 +549,45 @@ public:
 	/**
 	 * @brief Default constructor. Creates an empty line_bulk object.
 	 */
-	GPIOD_API line_bulk(void) = default;
+	line_bulk(void) = default;
 
 	/**
 	 * @brief Construct a line_bulk from a vector of lines.
 	 * @param lines Vector of gpiod::line objects.
 	 * @note All lines must be owned by the same GPIO chip.
 	 */
-	GPIOD_API line_bulk(const ::std::vector<line>& lines);
+	line_bulk(const ::std::vector<line>& lines);
 
 	/**
 	 * @brief Copy constructor.
 	 * @param other Other line_bulk object.
 	 */
-	GPIOD_API line_bulk(const line_bulk& other) = default;
+	line_bulk(const line_bulk& other) = default;
 
 	/**
 	 * @brief Move constructor.
 	 * @param other Other line_bulk object.
 	 */
-	GPIOD_API line_bulk(line_bulk&& other) = default;
+	line_bulk(line_bulk&& other) = default;
 
 	/**
 	 * @brief Assignment operator.
 	 * @param other Other line_bulk object.
 	 * @return Reference to this object.
 	 */
-	GPIOD_API line_bulk& operator=(const line_bulk& other) = default;
+	line_bulk& operator=(const line_bulk& other) = default;
 
 	/**
 	 * @brief Move assignment operator.
 	 * @param other Other line_bulk object.
 	 * @return Reference to this object.
 	 */
-	GPIOD_API line_bulk& operator=(line_bulk&& other) = default;
+	line_bulk& operator=(line_bulk&& other) = default;
 
 	/**
 	 * @brief Destructor.
 	 */
-	GPIOD_API ~line_bulk(void) = default;
+	~line_bulk(void) = default;
 
 	/**
 	 * @brief Add a line to this line_bulk object.
@@ -596,7 +595,7 @@ public:
 	 * @note The new line must be owned by the same chip as all the other
 	 *       lines already held by this line_bulk object.
 	 */
-	GPIOD_API void append(const line& new_line);
+	void append(const line& new_line);
 
 	/**
 	 * @brief Get the line at given offset.
@@ -605,7 +604,7 @@ public:
 	 * @note This method will throw if index is equal or greater than the
 	 *       number of lines currently held by this bulk.
 	 */
-	GPIOD_API line& get(unsigned int index);
+	line& get(unsigned int index);
 
 	/**
 	 * @brief Get the line at given offset without bounds checking.
@@ -613,24 +612,24 @@ public:
 	 * @return Reference to the line object.
 	 * @note No bounds checking is performed.
 	 */
-	GPIOD_API line& operator[](unsigned int index);
+	line& operator[](unsigned int index);
 
 	/**
 	 * @brief Get the number of lines currently held by this object.
 	 * @return Number of elements in this line_bulk.
 	 */
-	GPIOD_API unsigned int size(void) const noexcept;
+	unsigned int size(void) const noexcept;
 
 	/**
 	 * @brief Check if this line_bulk doesn't hold any lines.
 	 * @return True if this object is empty, false otherwise.
 	 */
-	GPIOD_API bool empty(void) const noexcept;
+	bool empty(void) const noexcept;
 
 	/**
 	 * @brief Remove all lines from this object.
 	 */
-	GPIOD_API void clear(void);
+	void clear(void);
 
 	/**
 	 * @brief Request all lines held by this object.
@@ -638,27 +637,27 @@ public:
 	 * @param default_vals Vector of default values. Only relevant for
 	 *                     output direction requests.
 	 */
-	GPIOD_API void request(const line_request& config,
-			       const ::std::vector<int> default_vals = ::std::vector<int>()) const;
+	void request(const line_request& config,
+		     const ::std::vector<int> default_vals = ::std::vector<int>()) const;
 
 	/**
 	 * @brief Release all lines held by this object.
 	 */
-	GPIOD_API void release(void) const;
+	void release(void) const;
 
 	/**
 	 * @brief Read values from all lines held by this object.
 	 * @return Vector containing line values the order of which corresponds
 	 *         with the order of lines in the internal array.
 	 */
-	GPIOD_API ::std::vector<int> get_values(void) const;
+	::std::vector<int> get_values(void) const;
 
 	/**
 	 * @brief Set values of all lines held by this object.
 	 * @param values Vector of values to set. Must be the same size as the
 	 *               number of lines held by this line_bulk.
 	 */
-	GPIOD_API void set_values(const ::std::vector<int>& values) const;
+	void set_values(const ::std::vector<int>& values) const;
 
 	/**
 	 * @brief Set configuration of all lines held by this object.
@@ -668,26 +667,26 @@ public:
 	 *               number of lines held by this line_bulk.
 	 *               Only relevant for output direction requests.
 	 */
-	GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
-				  const ::std::vector<int> values = ::std::vector<int>()) const;
+	void set_config(int direction, ::std::bitset<32> flags,
+			const ::std::vector<int> values = ::std::vector<int>()) const;
 
 	/**
 	 * @brief Set configuration flags of all lines held by this object.
 	 * @param flags Replacement flags.
 	 */
-	GPIOD_API void set_flags(::std::bitset<32> flags) const;
+	void set_flags(::std::bitset<32> flags) const;
 
 	/**
 	 * @brief Change the direction all lines held by this object to input.
 	 */
-	GPIOD_API void set_direction_input() const;
+	void set_direction_input() const;
 
 	/**
 	 * @brief Change the direction all lines held by this object to output.
 	 * @param values Vector of values to set. Must be the same size as the
 	 *               number of lines held by this line_bulk.
 	 */
-	GPIOD_API void set_direction_output(const ::std::vector<int>& values) const;
+	void set_direction_output(const ::std::vector<int>& values) const;
 
 	/**
 	 * @brief Poll the set of lines for line events.
@@ -696,24 +695,24 @@ public:
 	 * @return Returns a line_bulk object containing lines on which events
 	 *         occurred.
 	 */
-	GPIOD_API line_bulk event_wait(const ::std::chrono::nanoseconds& timeout) const;
+	line_bulk event_wait(const ::std::chrono::nanoseconds& timeout) const;
 
 	/**
 	 * @brief Check if this object holds any lines.
 	 * @return True if this line_bulk holds at least one line, false otherwise.
 	 */
-	GPIOD_API explicit operator bool(void) const noexcept;
+	explicit operator bool(void) const noexcept;
 
 	/**
 	 * @brief Check if this object doesn't hold any lines.
 	 * @return True if this line_bulk is empty, false otherwise.
 	 */
-	GPIOD_API bool operator!(void) const noexcept;
+	bool operator!(void) const noexcept;
 
 	/**
 	 * @brief Max number of lines that this object can hold.
 	 */
-	GPIOD_API static const unsigned int MAX_LINES;
+	static const unsigned int MAX_LINES;
 
 	/**
 	 * @brief Iterator for iterating over lines held by line_bulk.
@@ -725,56 +724,56 @@ public:
 		/**
 		 * @brief Default constructor. Builds an empty iterator object.
 		 */
-		GPIOD_API iterator(void) = default;
+		iterator(void) = default;
 
 		/**
 		 * @brief Copy constructor.
 		 * @param other Other line_bulk iterator.
 		 */
-		GPIOD_API iterator(const iterator& other) = default;
+		iterator(const iterator& other) = default;
 
 		/**
 		 * @brief Move constructor.
 		 * @param other Other line_bulk iterator.
 		 */
-		GPIOD_API iterator(iterator&& other) = default;
+		iterator(iterator&& other) = default;
 
 		/**
 		 * @brief Assignment operator.
 		 * @param other Other line_bulk iterator.
 		 * @return Reference to this iterator.
 		 */
-		GPIOD_API iterator& operator=(const iterator& other) = default;
+		iterator& operator=(const iterator& other) = default;
 
 		/**
 		 * @brief Move assignment operator.
 		 * @param other Other line_bulk iterator.
 		 * @return Reference to this iterator.
 		 */
-		GPIOD_API iterator& operator=(iterator&& other) = default;
+		iterator& operator=(iterator&& other) = default;
 
 		/**
 		 * @brief Destructor.
 		 */
-		GPIOD_API ~iterator(void) = default;
+		~iterator(void) = default;
 
 		/**
 		 * @brief Advance the iterator by one element.
 		 * @return Reference to this iterator.
 		 */
-		GPIOD_API iterator& operator++(void);
+		iterator& operator++(void);
 
 		/**
 		 * @brief Dereference current element.
 		 * @return Current GPIO line by reference.
 		 */
-		GPIOD_API const line& operator*(void) const;
+		const line& operator*(void) const;
 
 		/**
 		 * @brief Member access operator.
 		 * @return Current GPIO line by pointer.
 		 */
-		GPIOD_API const line* operator->(void) const;
+		const line* operator->(void) const;
 
 		/**
 		 * @brief Check if this operator points to the same element.
@@ -782,7 +781,7 @@ public:
 		 * @return True if this iterator points to the same GPIO line,
 		 *         false otherwise.
 		 */
-		GPIOD_API bool operator==(const iterator& rhs) const noexcept;
+		bool operator==(const iterator& rhs) const noexcept;
 
 		/**
 		 * @brief Check if this operator doesn't point to the same element.
@@ -790,7 +789,7 @@ public:
 		 * @return True if this iterator doesn't point to the same GPIO
 		 *         line, false otherwise.
 		 */
-		GPIOD_API bool operator!=(const iterator& rhs) const noexcept;
+		bool operator!=(const iterator& rhs) const noexcept;
 
 	private:
 
@@ -805,13 +804,13 @@ public:
 	 * @brief Returns an iterator to the first line.
 	 * @return A line_bulk iterator.
 	 */
-	GPIOD_API iterator begin(void) noexcept;
+	iterator begin(void) noexcept;
 
 	/**
 	 * @brief Returns an iterator to the element following the last line.
 	 * @return A line_bulk iterator.
 	 */
-	GPIOD_API iterator end(void) noexcept;
+	iterator end(void) noexcept;
 
 private:
 
@@ -835,14 +834,14 @@ private:
  * @param iter A line iterator.
  * @return Iterator unchanged.
  */
-GPIOD_API line_iter begin(line_iter iter) noexcept;
+line_iter begin(line_iter iter) noexcept;
 
 /**
  * @brief Support for range-based loops for line iterators.
  * @param iter A line iterator.
  * @return New end iterator.
  */
-GPIOD_API line_iter end(const line_iter& iter) noexcept;
+line_iter end(const line_iter& iter) noexcept;
 
 /**
  * @brief Allows to iterate over all lines owned by a GPIO chip.
@@ -854,62 +853,62 @@ public:
 	/**
 	 * @brief Default constructor. Creates the end iterator.
 	 */
-	GPIOD_API line_iter(void) = default;
+	line_iter(void) = default;
 
 	/**
 	 * @brief Constructor. Creates the begin iterator.
 	 * @param owner Chip owning the GPIO lines over which we want to iterate.
 	 */
-	GPIOD_API line_iter(const chip& owner);
+	line_iter(const chip& owner);
 
 	/**
 	 * @brief Copy constructor.
 	 * @param other Other line iterator.
 	 */
-	GPIOD_API line_iter(const line_iter& other) = default;
+	line_iter(const line_iter& other) = default;
 
 	/**
 	 * @brief Move constructor.
 	 * @param other Other line iterator.
 	 */
-	GPIOD_API line_iter(line_iter&& other) = default;
+	line_iter(line_iter&& other) = default;
 
 	/**
 	 * @brief Assignment operator.
 	 * @param other Other line iterator.
 	 * @return Reference to this line_iter.
 	 */
-	GPIOD_API line_iter& operator=(const line_iter& other) = default;
+	line_iter& operator=(const line_iter& other) = default;
 
 	/**
 	 * @brief Move assignment operator.
 	 * @param other Other line iterator.
 	 * @return Reference to this line_iter.
 	 */
-	GPIOD_API line_iter& operator=(line_iter&& other) = default;
+	line_iter& operator=(line_iter&& other) = default;
 
 	/**
 	 * @brief Destructor.
 	 */
-	GPIOD_API ~line_iter(void) = default;
+	~line_iter(void) = default;
 
 	/**
 	 * @brief Advance the iterator by one element.
 	 * @return Reference to this iterator.
 	 */
-	GPIOD_API line_iter& operator++(void);
+	line_iter& operator++(void);
 
 	/**
 	 * @brief Dereference current element.
 	 * @return Current GPIO line by reference.
 	 */
-	GPIOD_API const line& operator*(void) const;
+	const line& operator*(void) const;
 
 	/**
 	 * @brief Member access operator.
 	 * @return Current GPIO line by pointer.
 	 */
-	GPIOD_API const line* operator->(void) const;
+	const line* operator->(void) const;
 
 	/**
 	 * @brief Check if this operator points to the same element.
@@ -917,7 +916,7 @@ public:
 	 * @return True if this iterator points to the same line_iter,
 	 *         false otherwise.
 	 */
-	GPIOD_API bool operator==(const line_iter& rhs) const noexcept;
+	bool operator==(const line_iter& rhs) const noexcept;
 
 	/**
 	 * @brief Check if this operator doesn't point to the same element.
@@ -925,7 +924,7 @@ public:
 	 * @return True if this iterator doesn't point to the same line_iter,
 	 *         false otherwise.
 	 */
-	GPIOD_API bool operator!=(const line_iter& rhs) const noexcept;
+	bool operator!=(const line_iter& rhs) const noexcept;
 
 private:
 
diff --git a/bindings/cxx/internal.hpp b/bindings/cxx/internal.hpp
new file mode 100644
index 0000000..9406d30
--- /dev/null
+++ b/bindings/cxx/internal.hpp
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
+
+#ifndef __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__
+#define __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__
+
+#define GPIOD_CXX_API __attribute__((visibility("default")))
+
+#endif /* __LIBGPIOD_GPIOD_CXX_INTERNAL_HPP__ */
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
index eba7d30..09d46f3 100644
--- a/bindings/cxx/iter.cpp
+++ b/bindings/cxx/iter.cpp
@@ -4,25 +4,27 @@
 #include <gpiod.hpp>
 #include <system_error>
 
+#include "internal.hpp"
+
 namespace gpiod {
 
-line_iter begin(line_iter iter) noexcept
+GPIOD_CXX_API line_iter begin(line_iter iter) noexcept
 {
 	return iter;
 }
 
-line_iter end(const line_iter&) noexcept
+GPIOD_CXX_API line_iter end(const line_iter&) noexcept
 {
 	return line_iter();
 }
 
-line_iter::line_iter(const chip& owner)
+GPIOD_CXX_API line_iter::line_iter(const chip& owner)
 	: _m_current(owner.get_line(0))
 {
 
 }
 
-line_iter& line_iter::operator++(void)
+GPIOD_CXX_API line_iter& line_iter::operator++(void)
 {
 	unsigned int offset = this->_m_current.offset() + 1;
 	chip owner = this->_m_current.get_chip();
@@ -35,22 +37,22 @@ line_iter& line_iter::operator++(void)
 	return *this;
 }
 
-const line& line_iter::operator*(void) const
+GPIOD_CXX_API const line& line_iter::operator*(void) const
 {
 	return this->_m_current;
 }
 
-const line* line_iter::operator->(void) const
+GPIOD_CXX_API const line* line_iter::operator->(void) const
 {
 	return ::std::addressof(this->_m_current);
 }
 
-bool line_iter::operator==(const line_iter& rhs) const noexcept
+GPIOD_CXX_API bool line_iter::operator==(const line_iter& rhs) const noexcept
 {
 	return this->_m_current._m_line == rhs._m_current._m_line;
 }
 
-bool line_iter::operator!=(const line_iter& rhs) const noexcept
+GPIOD_CXX_API bool line_iter::operator!=(const line_iter& rhs) const noexcept
 {
 	return this->_m_current._m_line != rhs._m_current._m_line;
 }
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index bf84867..cfcf2fb 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -6,6 +6,8 @@
 #include <map>
 #include <system_error>
 
+#include "internal.hpp"
+
 namespace gpiod {
 
 namespace {
@@ -25,21 +27,21 @@ const ::std::map<int, int> bias_mapping = {
 
 } /* namespace */
 
-line::line(void)
+GPIOD_CXX_API line::line(void)
 	: _m_line(nullptr),
 	  _m_owner()
 {
 
 }
 
-line::line(::gpiod_line* line, const chip& owner)
+GPIOD_CXX_API line::line(::gpiod_line* line, const chip& owner)
 	: _m_line(line),
 	  _m_owner(owner._m_chip)
 {
 
 }
 
-unsigned int line::offset(void) const
+GPIOD_CXX_API unsigned int line::offset(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -47,7 +49,7 @@ unsigned int line::offset(void) const
 	return ::gpiod_line_offset(this->_m_line);
 }
 
-::std::string line::name(void) const
+GPIOD_CXX_API ::std::string line::name(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -57,7 +59,7 @@ unsigned int line::offset(void) const
 	return name ? ::std::string(name) : ::std::string();
 }
 
-::std::string line::consumer(void) const
+GPIOD_CXX_API ::std::string line::consumer(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -67,7 +69,7 @@ unsigned int line::offset(void) const
 	return consumer ? ::std::string(consumer) : ::std::string();
 }
 
-int line::direction(void) const
+GPIOD_CXX_API int line::direction(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -77,7 +79,7 @@ int line::direction(void) const
 	return dir == GPIOD_LINE_DIRECTION_INPUT ? DIRECTION_INPUT : DIRECTION_OUTPUT;
 }
 
-bool line::is_active_low(void) const
+GPIOD_CXX_API bool line::is_active_low(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -85,7 +87,7 @@ bool line::is_active_low(void) const
 	return ::gpiod_line_is_active_low(this->_m_line);
 }
 
-int line::bias(void) const
+GPIOD_CXX_API int line::bias(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -93,7 +95,7 @@ int line::bias(void) const
 	return bias_mapping.at(::gpiod_line_bias(this->_m_line));
 }
 
-bool line::is_used(void) const
+GPIOD_CXX_API bool line::is_used(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -101,7 +103,7 @@ bool line::is_used(void) const
 	return ::gpiod_line_is_used(this->_m_line);
 }
 
-int line::drive(void) const
+GPIOD_CXX_API int line::drive(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -109,7 +111,7 @@ int line::drive(void) const
 	return drive_mapping.at(::gpiod_line_drive(this->_m_line));
 }
 
-void line::request(const line_request& config, int default_val) const
+GPIOD_CXX_API void line::request(const line_request& config, int default_val) const
 {
 	this->throw_if_null();
 
@@ -118,7 +120,7 @@ void line::request(const line_request& config, int default_val) const
 	bulk.request(config, { default_val });
 }
 
-void line::release(void) const
+GPIOD_CXX_API void line::release(void) const
 {
 	this->throw_if_null();
 
@@ -135,7 +137,7 @@ void line::release(void) const
  * polling for events on single lines directly.
  */
 
-int line::get_value(void) const
+GPIOD_CXX_API int line::get_value(void) const
 {
 	this->throw_if_null();
 
@@ -144,7 +146,7 @@ int line::get_value(void) const
 	return bulk.get_values()[0];
 }
 
-void line::set_value(int val) const
+GPIOD_CXX_API void line::set_value(int val) const
 {
 	this->throw_if_null();
 
@@ -153,8 +155,8 @@ void line::set_value(int val) const
 	bulk.set_values({ val });
 }
 
-void line::set_config(int direction, ::std::bitset<32> flags,
-			int value) const
+GPIOD_CXX_API void line::set_config(int direction, ::std::bitset<32> flags,
+				    int value) const
 {
 	this->throw_if_null();
 
@@ -163,7 +165,7 @@ void line::set_config(int direction, ::std::bitset<32> flags,
 	bulk.set_config(direction, flags, { value });
 }
 
-void line::set_flags(::std::bitset<32> flags) const
+GPIOD_CXX_API void line::set_flags(::std::bitset<32> flags) const
 {
 	this->throw_if_null();
 
@@ -172,7 +174,7 @@ void line::set_flags(::std::bitset<32> flags) const
 	bulk.set_flags(flags);
 }
 
-void line::set_direction_input() const
+GPIOD_CXX_API void line::set_direction_input() const
 {
 	this->throw_if_null();
 
@@ -181,7 +183,7 @@ void line::set_direction_input() const
 	bulk.set_direction_input();
 }
 
-void line::set_direction_output(int value) const
+GPIOD_CXX_API void line::set_direction_output(int value) const
 {
 	this->throw_if_null();
 
@@ -190,7 +192,7 @@ void line::set_direction_output(int value) const
 	bulk.set_direction_output({ value });
 }
 
-bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
+GPIOD_CXX_API bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->throw_if_null();
 
@@ -201,7 +203,7 @@ bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
 	return !!event_bulk;
 }
 
-line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
+GPIOD_CXX_API line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
 {
 	line_event ret;
 
@@ -219,7 +221,7 @@ line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
 	return ret;
 }
 
-line_event line::event_read(void) const
+GPIOD_CXX_API line_event line::event_read(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -236,7 +238,7 @@ line_event line::event_read(void) const
 	return this->make_line_event(event_buf);
 }
 
-::std::vector<line_event> line::event_read_multiple(void) const
+GPIOD_CXX_API ::std::vector<line_event> line::event_read_multiple(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -259,7 +261,7 @@ line_event line::event_read(void) const
 	return events;
 }
 
-int line::event_get_fd(void) const
+GPIOD_CXX_API int line::event_get_fd(void) const
 {
 	this->throw_if_null();
 	line::chip_guard lock_chip(*this);
@@ -273,44 +275,44 @@ int line::event_get_fd(void) const
 	return ret;
 }
 
-const chip line::get_chip(void) const
+GPIOD_CXX_API const chip line::get_chip(void) const
 {
 	return chip(this->_m_owner);
 }
 
-void line::reset(void)
+GPIOD_CXX_API void line::reset(void)
 {
 	this->_m_line = nullptr;
 	this->_m_owner.reset();
 }
 
-bool line::operator==(const line& rhs) const noexcept
+GPIOD_CXX_API bool line::operator==(const line& rhs) const noexcept
 {
 	return this->_m_line == rhs._m_line;
 }
 
-bool line::operator!=(const line& rhs) const noexcept
+GPIOD_CXX_API bool line::operator!=(const line& rhs) const noexcept
 {
 	return this->_m_line != rhs._m_line;
 }
 
-line::operator bool(void) const noexcept
+GPIOD_CXX_API line::operator bool(void) const noexcept
 {
 	return this->_m_line != nullptr;
 }
 
-bool line::operator!(void) const noexcept
+GPIOD_CXX_API bool line::operator!(void) const noexcept
 {
 	return this->_m_line == nullptr;
 }
 
-void line::throw_if_null(void) const
+GPIOD_CXX_API void line::throw_if_null(void) const
 {
 	if (!this->_m_line)
 		throw ::std::logic_error("object not holding a GPIO line handle");
 }
 
-line::chip_guard::chip_guard(const line& line)
+GPIOD_CXX_API line::chip_guard::chip_guard(const line& line)
 	: _m_chip(line._m_owner)
 {
 
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index d40364d..a9261c0 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -5,14 +5,16 @@
 #include <map>
 #include <system_error>
 
+#include "internal.hpp"
+
 namespace gpiod {
 
-const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
-const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
-const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
-const ::std::bitset<32> line_request::FLAG_BIAS_DISABLED(GPIOD_BIT(3));
-const ::std::bitset<32> line_request::FLAG_BIAS_PULL_DOWN(GPIOD_BIT(4));
-const ::std::bitset<32> line_request::FLAG_BIAS_PULL_UP(GPIOD_BIT(5));
+GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
+GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
+GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
+GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_BIAS_DISABLED(GPIOD_BIT(3));
+GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_BIAS_PULL_DOWN(GPIOD_BIT(4));
+GPIOD_CXX_API const ::std::bitset<32> line_request::FLAG_BIAS_PULL_UP(GPIOD_BIT(5));
 
 namespace {
 
@@ -44,9 +46,9 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
 
 } /* namespace */
 
-const unsigned int line_bulk::MAX_LINES = 64;
+GPIOD_CXX_API const unsigned int line_bulk::MAX_LINES = 64;
 
-line_bulk::line_bulk(const ::std::vector<line>& lines)
+GPIOD_CXX_API line_bulk::line_bulk(const ::std::vector<line>& lines)
 	: _m_bulk()
 {
 	this->_m_bulk.reserve(lines.size());
@@ -55,7 +57,7 @@ line_bulk::line_bulk(const ::std::vector<line>& lines)
 		this->append(it);
 }
 
-void line_bulk::append(const line& new_line)
+GPIOD_CXX_API void line_bulk::append(const line& new_line)
 {
 	if (!new_line)
 		throw ::std::logic_error("line_bulk cannot hold empty line objects");
@@ -69,32 +71,32 @@ void line_bulk::append(const line& new_line)
 	this->_m_bulk.push_back(new_line);
 }
 
-line& line_bulk::get(unsigned int index)
+GPIOD_CXX_API line& line_bulk::get(unsigned int index)
 {
 	return this->_m_bulk.at(index);
 }
 
-line& line_bulk::operator[](unsigned int index)
+GPIOD_CXX_API line& line_bulk::operator[](unsigned int index)
 {
 	return this->_m_bulk[index];
 }
 
-unsigned int line_bulk::size(void) const noexcept
+GPIOD_CXX_API unsigned int line_bulk::size(void) const noexcept
 {
 	return this->_m_bulk.size();
 }
 
-bool line_bulk::empty(void) const noexcept
+GPIOD_CXX_API bool line_bulk::empty(void) const noexcept
 {
 	return this->_m_bulk.empty();
 }
 
-void line_bulk::clear(void)
+GPIOD_CXX_API void line_bulk::clear(void)
 {
 	this->_m_bulk.clear();
 }
 
-void line_bulk::request(const line_request& config, const ::std::vector<int> default_vals) const
+GPIOD_CXX_API void line_bulk::request(const line_request& config, const ::std::vector<int> default_vals) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -123,7 +125,7 @@ void line_bulk::request(const line_request& config, const ::std::vector<int> def
 					  "error requesting GPIO lines");
 }
 
-void line_bulk::release(void) const
+GPIOD_CXX_API void line_bulk::release(void) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -133,7 +135,7 @@ void line_bulk::release(void) const
 	::gpiod_line_release_bulk(bulk.get());
 }
 
-::std::vector<int> line_bulk::get_values(void) const
+GPIOD_CXX_API ::std::vector<int> line_bulk::get_values(void) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -152,7 +154,7 @@ void line_bulk::release(void) const
 	return values;
 }
 
-void line_bulk::set_values(const ::std::vector<int>& values) const
+GPIOD_CXX_API void line_bulk::set_values(const ::std::vector<int>& values) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -169,8 +171,8 @@ void line_bulk::set_values(const ::std::vector<int>& values) const
 					  "error setting GPIO line values");
 }
 
-void line_bulk::set_config(int direction, ::std::bitset<32> flags,
-			   const ::std::vector<int> values) const
+GPIOD_CXX_API void line_bulk::set_config(int direction, ::std::bitset<32> flags,
+					 const ::std::vector<int> values) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -195,7 +197,7 @@ void line_bulk::set_config(int direction, ::std::bitset<32> flags,
 					  "error setting GPIO line config");
 }
 
-void line_bulk::set_flags(::std::bitset<32> flags) const
+GPIOD_CXX_API void line_bulk::set_flags(::std::bitset<32> flags) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -216,7 +218,7 @@ void line_bulk::set_flags(::std::bitset<32> flags) const
 					  "error setting GPIO line flags");
 }
 
-void line_bulk::set_direction_input() const
+GPIOD_CXX_API void line_bulk::set_direction_input() const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -230,7 +232,7 @@ void line_bulk::set_direction_input() const
 			"error setting GPIO line direction to input");
 }
 
-void line_bulk::set_direction_output(const ::std::vector<int>& values) const
+GPIOD_CXX_API void line_bulk::set_direction_output(const ::std::vector<int>& values) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -247,7 +249,7 @@ void line_bulk::set_direction_output(const ::std::vector<int>& values) const
 			"error setting GPIO line direction to output");
 }
 
-line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
+GPIOD_CXX_API line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->throw_if_empty();
 	line::chip_guard lock_chip(this->_m_bulk.front());
@@ -276,66 +278,66 @@ line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 	return ret;
 }
 
-line_bulk::operator bool(void) const noexcept
+GPIOD_CXX_API line_bulk::operator bool(void) const noexcept
 {
 	return !this->_m_bulk.empty();
 }
 
-bool line_bulk::operator!(void) const noexcept
+GPIOD_CXX_API bool line_bulk::operator!(void) const noexcept
 {
 	return this->_m_bulk.empty();
 }
 
-line_bulk::iterator::iterator(const ::std::vector<line>::iterator& it)
+GPIOD_CXX_API line_bulk::iterator::iterator(const ::std::vector<line>::iterator& it)
 	: _m_iter(it)
 {
 
 }
 
-line_bulk::iterator& line_bulk::iterator::operator++(void)
+GPIOD_CXX_API line_bulk::iterator& line_bulk::iterator::operator++(void)
 {
 	this->_m_iter++;
 
 	return *this;
 }
 
-const line& line_bulk::iterator::operator*(void) const
+GPIOD_CXX_API const line& line_bulk::iterator::operator*(void) const
 {
 	return *this->_m_iter;
 }
 
-const line* line_bulk::iterator::operator->(void) const
+GPIOD_CXX_API const line* line_bulk::iterator::operator->(void) const
 {
 	return this->_m_iter.operator->();
 }
 
-bool line_bulk::iterator::operator==(const iterator& rhs) const noexcept
+GPIOD_CXX_API bool line_bulk::iterator::operator==(const iterator& rhs) const noexcept
 {
 	return this->_m_iter == rhs._m_iter;
 }
 
-bool line_bulk::iterator::operator!=(const iterator& rhs) const noexcept
+GPIOD_CXX_API bool line_bulk::iterator::operator!=(const iterator& rhs) const noexcept
 {
 	return this->_m_iter != rhs._m_iter;
 }
 
-line_bulk::iterator line_bulk::begin(void) noexcept
+GPIOD_CXX_API line_bulk::iterator line_bulk::begin(void) noexcept
 {
 	return line_bulk::iterator(this->_m_bulk.begin());
 }
 
-line_bulk::iterator line_bulk::end(void) noexcept
+GPIOD_CXX_API line_bulk::iterator line_bulk::end(void) noexcept
 {
 	return line_bulk::iterator(this->_m_bulk.end());
 }
 
-void line_bulk::throw_if_empty(void) const
+GPIOD_CXX_API void line_bulk::throw_if_empty(void) const
 {
 	if (this->_m_bulk.empty())
 		throw ::std::logic_error("line_bulk not holding any GPIO lines");
 }
 
-line_bulk::line_bulk_ptr line_bulk::make_line_bulk_ptr(void) const
+GPIOD_CXX_API line_bulk::line_bulk_ptr line_bulk::make_line_bulk_ptr(void) const
 {
 	line_bulk_ptr bulk(::gpiod_line_bulk_new(this->size()));
 
@@ -346,7 +348,7 @@ line_bulk::line_bulk_ptr line_bulk::make_line_bulk_ptr(void) const
 	return bulk;
 }
 
-line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
+GPIOD_CXX_API line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
 {
 	line_bulk_ptr bulk = this->make_line_bulk_ptr();
 
@@ -356,7 +358,7 @@ line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
 	return bulk;
 }
 
-void line_bulk::line_bulk_deleter::operator()(::gpiod_line_bulk *bulk)
+GPIOD_CXX_API void line_bulk::line_bulk_deleter::operator()(::gpiod_line_bulk *bulk)
 {
 	::gpiod_line_bulk_free(bulk);
 }
diff --git a/include/gpiod.h b/include/gpiod.h
index 0ee9778..5aea01f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -44,11 +44,6 @@ struct gpiod_line_bulk;
  * Commonly used utility macros.
  */
 
-/**
- * @brief Makes symbol visible.
- */
-#define GPIOD_API		__attribute__((visibility("default")))
-
 /**
  * @brief Shift 1 by given offset.
  * @param nr Bit position.
@@ -71,49 +66,49 @@ struct gpiod_line_bulk;
  * @return True if the file exists and is a GPIO chip character device or a
  *         symbolic link to it.
  */
-bool gpiod_is_gpiochip_device(const char *path) GPIOD_API;
+bool gpiod_is_gpiochip_device(const char *path);
 
 /**
  * @brief Open a gpiochip by path.
  * @param path Path to the gpiochip device file.
  * @return GPIO chip handle or NULL if an error occurred.
  */
-struct gpiod_chip *gpiod_chip_open(const char *path) GPIOD_API;
+struct gpiod_chip *gpiod_chip_open(const char *path);
 
 /**
  * @brief Increase the refcount on this GPIO object.
  * @param chip The GPIO chip object.
  * @return Passed reference to the GPIO chip.
  */
-struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip) GPIOD_API;
+struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip);
 
 /**
  * @brief Decrease the refcount on this GPIO object. If the refcount reaches 0,
  *        close the chip device and free all associated resources.
  * @param chip The GPIO chip object.
  */
-void gpiod_chip_unref(struct gpiod_chip *chip) GPIOD_API;
+void gpiod_chip_unref(struct gpiod_chip *chip);
 
 /**
  * @brief Get the GPIO chip name as represented in the kernel.
  * @param chip The GPIO chip object.
  * @return Pointer to a human-readable string containing the chip name.
  */
-const char *gpiod_chip_name(struct gpiod_chip *chip) GPIOD_API;
+const char *gpiod_chip_name(struct gpiod_chip *chip);
 
 /**
  * @brief Get the GPIO chip label as represented in the kernel.
  * @param chip The GPIO chip object.
  * @return Pointer to a human-readable string containing the chip label.
  */
-const char *gpiod_chip_label(struct gpiod_chip *chip) GPIOD_API;
+const char *gpiod_chip_label(struct gpiod_chip *chip);
 
 /**
  * @brief Get the number of GPIO lines exposed by this chip.
  * @param chip The GPIO chip object.
  * @return Number of GPIO lines.
  */
-unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip) GPIOD_API;
+unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip);
 
 /**
  * @brief Get the handle to the GPIO line at given offset.
@@ -122,7 +117,7 @@ unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip) GPIOD_API;
  * @return Pointer to the GPIO line handle or NULL if an error occured.
  */
 struct gpiod_line *
-gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset) GPIOD_API;
+gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
 
 /**
  * @brief Retrieve a set of lines and store them in a line bulk object.
@@ -133,7 +128,7 @@ gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset) GPIOD_API;
  */
 struct gpiod_line_bulk *
 gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
-		     unsigned int num_offsets) GPIOD_API;
+		     unsigned int num_offsets);
 
 /**
  * @brief Retrieve all lines exposed by a chip and store them in a bulk object.
@@ -141,7 +136,7 @@ gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
  * @return New line bulk object or NULL on error.
  */
 struct gpiod_line_bulk *
-gpiod_chip_get_all_lines(struct gpiod_chip *chip) GPIOD_API;
+gpiod_chip_get_all_lines(struct gpiod_chip *chip);
 
 /**
  * @brief Map a GPIO line's name to its offset within the chip.
@@ -150,7 +145,7 @@ gpiod_chip_get_all_lines(struct gpiod_chip *chip) GPIOD_API;
  * @return Offset of the line within the chip or -1 if a line with given name
  *         is not exposed by the chip.
  */
-int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
+int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name);
 
 /**
  * @}
@@ -172,19 +167,19 @@ int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
  * @param max_lines Maximum number of lines this object can hold.
  * @return New line bulk object or NULL on error.
  */
-struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines) GPIOD_API;
+struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines);
 
 /**
  * @brief Reset a bulk object. Remove all lines and set size to 0.
  * @param bulk Bulk object to reset.
  */
-void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk) GPIOD_API;
+void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk);
 
 /**
  * @brief Release all resources allocated for this bulk object.
  * @param bulk Bulk object to free.
  */
-void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk) GPIOD_API;
+void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk);
 
 /**
  * @brief Add a single line to a GPIO bulk object.
@@ -198,7 +193,7 @@ void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk) GPIOD_API;
  * the other lines already held by this object.
  */
 int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
-			     struct gpiod_line *line) GPIOD_API;
+			     struct gpiod_line *line);
 
 /**
  * @brief Retrieve the line handle from a line bulk object at given index.
@@ -208,15 +203,14 @@ int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
  *         the number of lines this bulk can hold.
  */
 struct gpiod_line *
-gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk,
-			 unsigned int index) GPIOD_API;
+gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index);
 
 /**
  * @brief Retrieve the number of GPIO lines held by this line bulk object.
  * @param bulk Line bulk object.
  * @return Number of lines held by this line bulk.
  */
-unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk) GPIOD_API;
+unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk);
 
 /**
  * @brief Values returned by the callback passed to
@@ -244,7 +238,7 @@ typedef int (*gpiod_line_bulk_foreach_cb)(struct gpiod_line *, void *);
  */
 void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
 				  gpiod_line_bulk_foreach_cb func,
-				  void *data) GPIOD_API;
+				  void *data);
 
 /**
  * @}
@@ -297,7 +291,7 @@ enum {
  * @param line GPIO line object.
  * @return Line offset.
  */
-unsigned int gpiod_line_offset(struct gpiod_line *line) GPIOD_API;
+unsigned int gpiod_line_offset(struct gpiod_line *line);
 
 /**
  * @brief Read the GPIO line name.
@@ -306,7 +300,7 @@ unsigned int gpiod_line_offset(struct gpiod_line *line) GPIOD_API;
  *         routine returns a pointer to a null-terminated string or NULL if
  *         the line is unnamed.
  */
-const char *gpiod_line_name(struct gpiod_line *line) GPIOD_API;
+const char *gpiod_line_name(struct gpiod_line *line);
 
 /**
  * @brief Read the GPIO line consumer name.
@@ -315,21 +309,21 @@ const char *gpiod_line_name(struct gpiod_line *line) GPIOD_API;
  *         kernel. This routine returns a pointer to a null-terminated string
  *         or NULL if the line is not used.
  */
-const char *gpiod_line_consumer(struct gpiod_line *line) GPIOD_API;
+const char *gpiod_line_consumer(struct gpiod_line *line);
 
 /**
  * @brief Read the GPIO line direction setting.
  * @param line GPIO line object.
  * @return Returns GPIOD_LINE_DIRECTION_INPUT or GPIOD_LINE_DIRECTION_OUTPUT.
  */
-int gpiod_line_direction(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_direction(struct gpiod_line *line);
 
 /**
  * @brief Check if the signal of this line is inverted.
  * @param line GPIO line object.
  * @return True if this line is "active-low", false otherwise.
  */
-bool gpiod_line_is_active_low(struct gpiod_line *line) GPIOD_API;
+bool gpiod_line_is_active_low(struct gpiod_line *line);
 
 /**
  * @brief Read the GPIO line bias setting.
@@ -337,7 +331,7 @@ bool gpiod_line_is_active_low(struct gpiod_line *line) GPIOD_API;
  * @return Returns GPIOD_LINE_BIAS_PULL_UP, GPIOD_LINE_BIAS_PULL_DOWN,
  *         GPIOD_LINE_BIAS_DISABLE or GPIOD_LINE_BIAS_UNKNOWN.
  */
-int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_bias(struct gpiod_line *line);
 
 /**
  * @brief Check if the line is currently in use.
@@ -348,7 +342,7 @@ int gpiod_line_bias(struct gpiod_line *line) GPIOD_API;
  * requested by another process or hogged by the kernel. It only matters that
  * the line is used and we can't request it.
  */
-bool gpiod_line_is_used(struct gpiod_line *line) GPIOD_API;
+bool gpiod_line_is_used(struct gpiod_line *line);
 
 /**
  * @brief Read the GPIO line drive setting.
@@ -356,14 +350,14 @@ bool gpiod_line_is_used(struct gpiod_line *line) GPIOD_API;
  * @return Returns GPIOD_LINE_DRIVE_PUSH_PULL, GPIOD_LINE_DRIVE_OPEN_DRAIN or
  *         GPIOD_LINE_DRIVE_OPEN_SOURCE.
  */
-int gpiod_line_drive(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_drive(struct gpiod_line *line);
 
 /**
  * @brief Get the handle to the GPIO chip controlling this line.
  * @param line The GPIO line object.
  * @return Pointer to the GPIO chip handle controlling this line.
  */
-struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line) GPIOD_API;
+struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line);
 
 /**
  * @}
@@ -437,7 +431,7 @@ struct gpiod_line_request_config {
  */
 int gpiod_line_request(struct gpiod_line *line,
 		       const struct gpiod_line_request_config *config,
-		       int default_val) GPIOD_API;
+		       int default_val);
 
 /**
  * @brief Reserve a single line, set the direction to input.
@@ -445,8 +439,7 @@ int gpiod_line_request(struct gpiod_line *line,
  * @param consumer Name of the consumer.
  * @return 0 if the line was properly reserved, -1 on failure.
  */
-int gpiod_line_request_input(struct gpiod_line *line,
-			     const char *consumer) GPIOD_API;
+int gpiod_line_request_input(struct gpiod_line *line, const char *consumer);
 
 /**
  * @brief Reserve a single line, set the direction to output.
@@ -456,7 +449,7 @@ int gpiod_line_request_input(struct gpiod_line *line,
  * @return 0 if the line was properly reserved, -1 on failure.
  */
 int gpiod_line_request_output(struct gpiod_line *line,
-			      const char *consumer, int default_val) GPIOD_API;
+			      const char *consumer, int default_val);
 
 /**
  * @brief Request rising edge event notifications on a single line.
@@ -465,7 +458,7 @@ int gpiod_line_request_output(struct gpiod_line *line,
  * @return 0 if the operation succeeds, -1 on failure.
  */
 int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
-					  const char *consumer) GPIOD_API;
+					  const char *consumer);
 
 /**
  * @brief Request falling edge event notifications on a single line.
@@ -474,7 +467,7 @@ int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
  * @return 0 if the operation succeeds, -1 on failure.
  */
 int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
-					   const char *consumer) GPIOD_API;
+					   const char *consumer);
 
 /**
  * @brief Request all event type notifications on a single line.
@@ -483,7 +476,7 @@ int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
  * @return 0 if the operation succeeds, -1 on failure.
  */
 int gpiod_line_request_both_edges_events(struct gpiod_line *line,
-					 const char *consumer) GPIOD_API;
+					 const char *consumer);
 
 /**
  * @brief Reserve a single line, set the direction to input.
@@ -493,7 +486,7 @@ int gpiod_line_request_both_edges_events(struct gpiod_line *line,
  * @return 0 if the line was properly reserved, -1 on failure.
  */
 int gpiod_line_request_input_flags(struct gpiod_line *line,
-				   const char *consumer, int flags) GPIOD_API;
+				   const char *consumer, int flags);
 
 /**
  * @brief Reserve a single line, set the direction to output.
@@ -505,7 +498,7 @@ int gpiod_line_request_input_flags(struct gpiod_line *line,
  */
 int gpiod_line_request_output_flags(struct gpiod_line *line,
 				    const char *consumer, int flags,
-				    int default_val) GPIOD_API;
+				    int default_val);
 
 /**
  * @brief Request rising edge event notifications on a single line.
@@ -516,7 +509,7 @@ int gpiod_line_request_output_flags(struct gpiod_line *line,
  */
 int gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
 						const char *consumer,
-						int flags) GPIOD_API;
+						int flags);
 
 /**
  * @brief Request falling edge event notifications on a single line.
@@ -527,7 +520,7 @@ int gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
  */
 int gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
 						 const char *consumer,
-						 int flags) GPIOD_API;
+						 int flags);
 
 /**
  * @brief Request all event type notifications on a single line.
@@ -538,7 +531,7 @@ int gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
  */
 int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
 					       const char *consumer,
-					       int flags) GPIOD_API;
+					       int flags);
 
 /**
  * @brief Reserve a set of GPIO lines.
@@ -555,7 +548,7 @@ int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
  */
 int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
 			    const struct gpiod_line_request_config *config,
-			    const int *default_vals) GPIOD_API;
+			    const int *default_vals);
 
 /**
  * @brief Reserve a set of GPIO lines, set the direction to input.
@@ -564,7 +557,7 @@ int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
  * @return 0 if the lines were properly reserved, -1 on failure.
  */
 int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
-				  const char *consumer) GPIOD_API;
+				  const char *consumer);
 
 /**
  * @brief Reserve a set of GPIO lines, set the direction to output.
@@ -575,7 +568,7 @@ int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
  */
 int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
 				   const char *consumer,
-				   const int *default_vals) GPIOD_API;
+				   const int *default_vals);
 
 /**
  * @brief Request rising edge event notifications on a set of lines.
@@ -584,7 +577,7 @@ int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
  * @return 0 if the operation succeeds, -1 on failure.
  */
 int gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
-					       const char *consumer) GPIOD_API;
+					       const char *consumer);
 
 /**
  * @brief Request falling edge event notifications on a set of lines.
@@ -593,7 +586,7 @@ int gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
  * @return 0 if the operation succeeds, -1 on failure.
  */
 int gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
-						const char *consumer) GPIOD_API;
+						const char *consumer);
 
 /**
  * @brief Request all event type notifications on a set of lines.
@@ -602,7 +595,7 @@ int gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
  * @return 0 if the operation succeeds, -1 on failure.
  */
 int gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
-					      const char *consumer) GPIOD_API;
+					      const char *consumer);
 
 /**
  * @brief Reserve a set of GPIO lines, set the direction to input.
@@ -612,8 +605,7 @@ int gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
  * @return 0 if the lines were properly reserved, -1 on failure.
  */
 int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
-					const char *consumer,
-					int flags) GPIOD_API;
+					const char *consumer, int flags);
 
 /**
  * @brief Reserve a set of GPIO lines, set the direction to output.
@@ -625,7 +617,7 @@ int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
  */
 int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
 					 const char *consumer, int flags,
-					 const int *default_vals) GPIOD_API;
+					 const int *default_vals);
 
 /**
  * @brief Request rising edge event notifications on a set of lines.
@@ -636,8 +628,7 @@ int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
  */
 int gpiod_line_request_bulk_rising_edge_events_flags(
 					struct gpiod_line_bulk *bulk,
-					const char *consumer,
-					int flags) GPIOD_API;
+					const char *consumer, int flags);
 
 /**
  * @brief Request falling edge event notifications on a set of lines.
@@ -648,8 +639,7 @@ int gpiod_line_request_bulk_rising_edge_events_flags(
  */
 int gpiod_line_request_bulk_falling_edge_events_flags(
 					struct gpiod_line_bulk *bulk,
-					const char *consumer,
-					int flags) GPIOD_API;
+					const char *consumer, int flags);
 
 /**
  * @brief Request all event type notifications on a set of lines.
@@ -660,14 +650,13 @@ int gpiod_line_request_bulk_falling_edge_events_flags(
  */
 int gpiod_line_request_bulk_both_edges_events_flags(
 					struct gpiod_line_bulk *bulk,
-					const char *consumer,
-					int flags) GPIOD_API;
+					const char *consumer, int flags);
 
 /**
  * @brief Release a previously reserved line.
  * @param line GPIO line object.
  */
-void gpiod_line_release(struct gpiod_line *line) GPIOD_API;
+void gpiod_line_release(struct gpiod_line *line);
 
 /**
  * @brief Release a set of previously reserved lines.
@@ -676,7 +665,7 @@ void gpiod_line_release(struct gpiod_line *line) GPIOD_API;
  * If the lines were not previously requested together, the behavior is
  * undefined.
  */
-void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
+void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk);
 
 /**
  * @}
@@ -694,7 +683,7 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
  * @return 0 or 1 if the operation succeeds. On error this routine returns -1
  *         and sets the last error number.
  */
-int gpiod_line_get_value(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_get_value(struct gpiod_line *line);
 
 /**
  * @brief Read current values of a set of GPIO lines.
@@ -707,8 +696,7 @@ int gpiod_line_get_value(struct gpiod_line *line) GPIOD_API;
  * the same order, the lines are added to line_bulk. If the lines were not
  * previously requested together, the behavior is undefined.
  */
-int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk,
-			      int *values) GPIOD_API;
+int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values);
 
 /**
  * @brief Set the value of a single GPIO line.
@@ -717,7 +705,7 @@ int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk,
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  */
-int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
+int gpiod_line_set_value(struct gpiod_line *line, int value);
 
 /**
  * @brief Set the values of a set of GPIO lines.
@@ -730,8 +718,7 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
  * If the lines were not previously requested together, the behavior is
  * undefined.
  */
-int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
-			      const int *values) GPIOD_API;
+int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values);
 
 /**
  * @}
@@ -757,7 +744,7 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
  *         returns -1 and sets the last error number.
  */
 int gpiod_line_set_config(struct gpiod_line *line, int direction,
-			  int flags, int value) GPIOD_API;
+			  int flags, int value);
 
 /**
  * @brief Update the configuration of a set of GPIO lines.
@@ -778,8 +765,7 @@ int gpiod_line_set_config(struct gpiod_line *line, int direction,
  * undefined.
  */
 int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
-			       int direction, int flags,
-			       const int *values) GPIOD_API;
+			       int direction, int flags, const int *values);
 
 
 /**
@@ -789,7 +775,7 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  */
-int gpiod_line_set_flags(struct gpiod_line *line, int flags) GPIOD_API;
+int gpiod_line_set_flags(struct gpiod_line *line, int flags);
 
 /**
  * @brief Update the configuration flags of a set of GPIO lines.
@@ -801,8 +787,7 @@ int gpiod_line_set_flags(struct gpiod_line *line, int flags) GPIOD_API;
  * If the lines were not previously requested together, the behavior is
  * undefined.
  */
-int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk,
-			      int flags) GPIOD_API;
+int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags);
 
 /**
  * @brief Set the direction of a single GPIO line to input.
@@ -810,7 +795,7 @@ int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk,
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  */
-int gpiod_line_set_direction_input(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_set_direction_input(struct gpiod_line *line);
 
 /**
  * @brief Set the direction of a set of GPIO lines to input.
@@ -822,7 +807,7 @@ int gpiod_line_set_direction_input(struct gpiod_line *line) GPIOD_API;
  * undefined.
  */
 int
-gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
+gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk);
 
 /**
  * @brief Set the direction of a single GPIO line to output.
@@ -831,8 +816,7 @@ gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk) GPIOD_API;
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  */
-int gpiod_line_set_direction_output(struct gpiod_line *line,
-				    int value) GPIOD_API;
+int gpiod_line_set_direction_output(struct gpiod_line *line, int value);
 
 /**
  * @brief Set the direction of a set of GPIO lines to output.
@@ -847,7 +831,7 @@ int gpiod_line_set_direction_output(struct gpiod_line *line,
  * undefined.
  */
 int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
-					 const int *values) GPIOD_API;
+					 const int *values);
 
 /**
  * @}
@@ -891,7 +875,7 @@ struct gpiod_line_event {
  *         occurred.
  */
 int gpiod_line_event_wait(struct gpiod_line *line,
-			  const struct timespec *timeout) GPIOD_API;
+			  const struct timespec *timeout);
 
 /**
  * @brief Wait for events on a set of lines.
@@ -904,7 +888,7 @@ int gpiod_line_event_wait(struct gpiod_line *line,
  */
 int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 			       const struct timespec *timeout,
-			       struct gpiod_line_bulk *event_bulk) GPIOD_API;
+			       struct gpiod_line_bulk *event_bulk);
 
 /**
  * @brief Read next pending event from the GPIO line.
@@ -914,7 +898,7 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
  * @note This function will block if no event was queued for this line.
  */
 int gpiod_line_event_read(struct gpiod_line *line,
-			  struct gpiod_line_event *event) GPIOD_API;
+			  struct gpiod_line_event *event);
 
 /**
  * @brief Read up to a certain number of events from the GPIO line.
@@ -927,7 +911,7 @@ int gpiod_line_event_read(struct gpiod_line *line,
  */
 int gpiod_line_event_read_multiple(struct gpiod_line *line,
 				   struct gpiod_line_event *events,
-				   unsigned int num_events) GPIOD_API;
+				   unsigned int num_events);
 
 /**
  * @brief Get the event file descriptor.
@@ -939,7 +923,7 @@ int gpiod_line_event_read_multiple(struct gpiod_line *line,
  * Users may want to poll the event file descriptor on their own. This routine
  * allows to access it.
  */
-int gpiod_line_event_get_fd(struct gpiod_line *line) GPIOD_API;
+int gpiod_line_event_get_fd(struct gpiod_line *line);
 
 /**
  * @brief Read the last GPIO event directly from a file descriptor.
@@ -951,7 +935,7 @@ int gpiod_line_event_get_fd(struct gpiod_line *line) GPIOD_API;
  * directly read the event data from it using this routine. This function
  * translates the kernel representation of the event to the libgpiod format.
  */
-int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event) GPIOD_API;
+int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event);
 
 /**
  * @brief Read up to a certain number of events directly from a file descriptor.
@@ -963,7 +947,7 @@ int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event) GPIOD_API;
  *         failure -1 is returned.
  */
 int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
-				      unsigned int num_events) GPIOD_API;
+				      unsigned int num_events);
 
 /**
  * @}
@@ -980,7 +964,7 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
  * @brief Get the API version of the library as a human-readable string.
  * @return Human-readable string containing the library version.
  */
-const char *gpiod_version_string(void) GPIOD_API;
+const char *gpiod_version_string(void);
 
 /**
  * @}
diff --git a/lib/Makefile.am b/lib/Makefile.am
index d8b19f0..8441584 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c helpers.c misc.c uapi/gpio.h
+libgpiod_la_SOURCES = core.c helpers.c internal.h misc.c uapi/gpio.h
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/core.c b/lib/core.c
index 8fdc503..c1fb8ec 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -17,6 +17,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "internal.h"
 #include "uapi/gpio.h"
 
 #define LINE_REQUEST_MAX_LINES	64
@@ -90,7 +91,7 @@ struct gpiod_line_bulk {
 #define BULK_SINGLE_LINE_INIT(line) \
 		{ 1, 1, { (line) } }
 
-struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
+GPIOD_API struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
 {
 	struct gpiod_line_bulk *bulk;
 	size_t size;
@@ -113,19 +114,19 @@ struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
 	return bulk;
 }
 
-void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk)
+GPIOD_API void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk)
 {
 	bulk->num_lines = 0;
 	memset(bulk->lines, 0, bulk->max_lines * sizeof(struct line *));
 }
 
-void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
+GPIOD_API void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
 {
 	free(bulk);
 }
 
-int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
-			     struct gpiod_line *line)
+GPIOD_API int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
+				       struct gpiod_line *line)
 {
 	if (bulk->num_lines == bulk->max_lines) {
 		errno = EINVAL;
@@ -144,7 +145,7 @@ int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
 	return 0;
 }
 
-struct gpiod_line *
+GPIOD_API struct gpiod_line *
 gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index)
 {
 	if (index >= bulk->num_lines) {
@@ -155,13 +156,14 @@ gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index)
 	return bulk->lines[index];
 }
 
-unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
+GPIOD_API unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
 {
 	return bulk->num_lines;
 }
 
-void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
-				  gpiod_line_bulk_foreach_cb func, void *data)
+GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
+					    gpiod_line_bulk_foreach_cb func,
+					    void *data)
 {
 	unsigned int index;
 	int ret;
@@ -178,7 +180,7 @@ void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
 	     (index) < (bulk)->num_lines;				\
 	     (index)++, (line) = (bulk)->lines[(index)])
 
-bool gpiod_is_gpiochip_device(const char *path)
+GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 {
 	char *name, *realname, *sysfsp, sysfsdev[16], devstr[16];
 	struct stat statbuf;
@@ -269,7 +271,7 @@ out:
 	return ret;
 }
 
-struct gpiod_chip *gpiod_chip_open(const char *path)
+GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 {
 	struct gpiochip_info info;
 	struct gpiod_chip *chip;
@@ -327,13 +329,13 @@ err_close_fd:
 	return NULL;
 }
 
-struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip)
+GPIOD_API struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip)
 {
 	chip->refcount++;
 	return chip;
 }
 
-void gpiod_chip_unref(struct gpiod_chip *chip)
+GPIOD_API void gpiod_chip_unref(struct gpiod_chip *chip)
 {
 	struct gpiod_line *line;
 	unsigned int i;
@@ -358,24 +360,24 @@ void gpiod_chip_unref(struct gpiod_chip *chip)
 	free(chip);
 }
 
-const char *gpiod_chip_name(struct gpiod_chip *chip)
+GPIOD_API const char *gpiod_chip_name(struct gpiod_chip *chip)
 {
 	return chip->name;
 }
 
-const char *gpiod_chip_label(struct gpiod_chip *chip)
+GPIOD_API const char *gpiod_chip_label(struct gpiod_chip *chip)
 {
 	return chip->label;
 }
 
-unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip)
+GPIOD_API unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip)
 {
 	return chip->num_lines;
 }
 
 static int line_update(struct gpiod_line *line);
 
-struct gpiod_line *
+GPIOD_API struct gpiod_line *
 gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset)
 {
 	struct gpiod_line *line;
@@ -458,37 +460,37 @@ static int line_get_fd(struct gpiod_line *line)
 	return line->fd_handle->fd;
 }
 
-struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
+GPIOD_API struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
 {
 	return line->chip;
 }
 
-unsigned int gpiod_line_offset(struct gpiod_line *line)
+GPIOD_API unsigned int gpiod_line_offset(struct gpiod_line *line)
 {
 	return line->offset;
 }
 
-const char *gpiod_line_name(struct gpiod_line *line)
+GPIOD_API const char *gpiod_line_name(struct gpiod_line *line)
 {
 	return line->name[0] == '\0' ? NULL : line->name;
 }
 
-const char *gpiod_line_consumer(struct gpiod_line *line)
+GPIOD_API const char *gpiod_line_consumer(struct gpiod_line *line)
 {
 	return line->consumer[0] == '\0' ? NULL : line->consumer;
 }
 
-int gpiod_line_direction(struct gpiod_line *line)
+GPIOD_API int gpiod_line_direction(struct gpiod_line *line)
 {
 	return line->direction;
 }
 
-bool gpiod_line_is_active_low(struct gpiod_line *line)
+GPIOD_API bool gpiod_line_is_active_low(struct gpiod_line *line)
 {
 	return line->active_low;
 }
 
-int gpiod_line_bias(struct gpiod_line *line)
+GPIOD_API int gpiod_line_bias(struct gpiod_line *line)
 {
 	if (line->info_flags & GPIOLINE_FLAG_BIAS_DISABLE)
 		return GPIOD_LINE_BIAS_DISABLED;
@@ -500,12 +502,12 @@ int gpiod_line_bias(struct gpiod_line *line)
 	return GPIOD_LINE_BIAS_UNKNOWN;
 }
 
-bool gpiod_line_is_used(struct gpiod_line *line)
+GPIOD_API bool gpiod_line_is_used(struct gpiod_line *line)
 {
 	return line->info_flags & GPIOLINE_FLAG_KERNEL;
 }
 
-int gpiod_line_drive(struct gpiod_line *line)
+GPIOD_API int gpiod_line_drive(struct gpiod_line *line)
 {
 	if (line->info_flags & GPIOLINE_FLAG_OPEN_DRAIN)
 		return GPIOD_LINE_DRIVE_OPEN_DRAIN;
@@ -838,9 +840,9 @@ static int line_request_events(struct gpiod_line_bulk *bulk,
 	return 0;
 }
 
-int gpiod_line_request(struct gpiod_line *line,
-		       const struct gpiod_line_request_config *config,
-		       int default_val)
+GPIOD_API int gpiod_line_request(struct gpiod_line *line,
+				 const struct gpiod_line_request_config *config,
+				 int default_val)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
@@ -861,9 +863,10 @@ static bool line_request_is_events(int request)
 	       request == GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES;
 }
 
-int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
-			    const struct gpiod_line_request_config *config,
-			    const int *vals)
+GPIOD_API int
+gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
+			const struct gpiod_line_request_config *config,
+			const int *vals)
 {
 	if (line_request_is_direction(config->request_type))
 		return line_request_values(bulk, config, vals);
@@ -874,14 +877,14 @@ int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
 	return -1;
 }
 
-void gpiod_line_release(struct gpiod_line *line)
+GPIOD_API void gpiod_line_release(struct gpiod_line *line)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	gpiod_line_release_bulk(&bulk);
 }
 
-void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk)
+GPIOD_API void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk)
 {
 	struct gpiod_line *line;
 	unsigned int idx;
@@ -894,7 +897,7 @@ void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk)
 	}
 }
 
-int gpiod_line_get_value(struct gpiod_line *line)
+GPIOD_API int gpiod_line_get_value(struct gpiod_line *line)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 	int rv, value;
@@ -906,7 +909,8 @@ int gpiod_line_get_value(struct gpiod_line *line)
 	return value;
 }
 
-int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
+GPIOD_API int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk,
+					int *values)
 {
 	struct gpio_v2_line_values lv;
 	struct gpiod_line *line;
@@ -951,14 +955,15 @@ int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
 	return 0;
 }
 
-int gpiod_line_set_value(struct gpiod_line *line, int value)
+GPIOD_API int gpiod_line_set_value(struct gpiod_line *line, int value)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_set_value_bulk(&bulk, &value);
 }
 
-int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
+GPIOD_API int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
+					const int *values)
 {
 	struct gpio_v2_line_values lv;
 	struct gpiod_line *line;
@@ -988,17 +993,17 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 	return 0;
 }
 
-int gpiod_line_set_config(struct gpiod_line *line, int direction,
-			  int flags, int value)
+GPIOD_API int gpiod_line_set_config(struct gpiod_line *line, int direction,
+				    int flags, int value)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_set_config_bulk(&bulk, direction, flags, &value);
 }
 
-int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
-			       int direction, int flags,
-			       const int *values)
+GPIOD_API int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
+					 int direction, int flags,
+					 const int *values)
 {
 	struct gpio_v2_line_config hcfg;
 	struct gpiod_line *line;
@@ -1045,14 +1050,14 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
 	return 0;
 }
 
-int gpiod_line_set_flags(struct gpiod_line *line, int flags)
+GPIOD_API int gpiod_line_set_flags(struct gpiod_line *line, int flags)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_set_flags_bulk(&bulk, flags);
 }
 
-int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
+GPIOD_API int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
 {
 	struct gpiod_line *line;
 	int values[LINE_REQUEST_MAX_LINES];
@@ -1073,13 +1078,13 @@ int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
 					  flags, values);
 }
 
-int gpiod_line_set_direction_input(struct gpiod_line *line)
+GPIOD_API int gpiod_line_set_direction_input(struct gpiod_line *line)
 {
 	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_INPUT,
 				     line->req_flags, 0);
 }
 
-int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk)
+GPIOD_API int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk)
 {
 	struct gpiod_line *line;
 
@@ -1089,14 +1094,15 @@ int gpiod_line_set_direction_input_bulk(struct gpiod_line_bulk *bulk)
 					  line->req_flags, NULL);
 }
 
-int gpiod_line_set_direction_output(struct gpiod_line *line, int value)
+GPIOD_API int gpiod_line_set_direction_output(struct gpiod_line *line,
+					      int value)
 {
 	return gpiod_line_set_config(line, GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
 				     line->req_flags, value);
 }
 
-int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
-					 const int *values)
+GPIOD_API int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
+						   const int *values)
 {
 	struct gpiod_line *line;
 
@@ -1106,17 +1112,17 @@ int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
 					  line->req_flags, values);
 }
 
-int gpiod_line_event_wait(struct gpiod_line *line,
-			  const struct timespec *timeout)
+GPIOD_API int gpiod_line_event_wait(struct gpiod_line *line,
+				    const struct timespec *timeout)
 {
 	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_event_wait_bulk(&bulk, timeout, NULL);
 }
 
-int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
-			       const struct timespec *timeout,
-			       struct gpiod_line_bulk *event_bulk)
+GPIOD_API int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
+					 const struct timespec *timeout,
+					 struct gpiod_line_bulk *event_bulk)
 {
 	struct pollfd fds[LINE_REQUEST_MAX_LINES];
 	unsigned int off, num_lines;
@@ -1162,8 +1168,8 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 	return 1;
 }
 
-int gpiod_line_event_read(struct gpiod_line *line,
-			  struct gpiod_line_event *event)
+GPIOD_API int gpiod_line_event_read(struct gpiod_line *line,
+				    struct gpiod_line_event *event)
 {
 	int ret;
 
@@ -1174,9 +1180,9 @@ int gpiod_line_event_read(struct gpiod_line *line,
 	return 0;
 }
 
-int gpiod_line_event_read_multiple(struct gpiod_line *line,
-				   struct gpiod_line_event *events,
-				   unsigned int num_events)
+GPIOD_API int gpiod_line_event_read_multiple(struct gpiod_line *line,
+					     struct gpiod_line_event *events,
+					     unsigned int num_events)
 {
 	int fd;
 
@@ -1187,7 +1193,7 @@ int gpiod_line_event_read_multiple(struct gpiod_line *line,
 	return gpiod_line_event_read_fd_multiple(fd, events, num_events);
 }
 
-int gpiod_line_event_get_fd(struct gpiod_line *line)
+GPIOD_API int gpiod_line_event_get_fd(struct gpiod_line *line)
 {
 	if (line->state != LINE_REQUESTED_EVENTS) {
 		errno = EPERM;
@@ -1197,7 +1203,7 @@ int gpiod_line_event_get_fd(struct gpiod_line *line)
 	return line_get_fd(line);
 }
 
-int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event)
+GPIOD_API int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event)
 {
 	int ret;
 
@@ -1208,8 +1214,9 @@ int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event)
 	return 0;
 }
 
-int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
-				      unsigned int num_events)
+GPIOD_API int gpiod_line_event_read_fd_multiple(int fd,
+						struct gpiod_line_event *events,
+						unsigned int num_events)
 {
 	/*
 	 * 16 is the maximum number of events the kernel can store in the FIFO
diff --git a/lib/helpers.c b/lib/helpers.c
index 76d8fc2..9c4b28e 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -11,7 +11,9 @@
 #include <stdio.h>
 #include <string.h>
 
-struct gpiod_line_bulk *
+#include "internal.h"
+
+GPIOD_API struct gpiod_line_bulk *
 gpiod_chip_get_lines(struct gpiod_chip *chip,
 		     unsigned int *offsets, unsigned int num_offsets)
 {
@@ -36,7 +38,8 @@ gpiod_chip_get_lines(struct gpiod_chip *chip,
 	return bulk;
 }
 
-struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
+GPIOD_API struct gpiod_line_bulk *
+gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 {
 	struct gpiod_line_bulk *bulk;
 	struct gpiod_line *line;
@@ -59,7 +62,7 @@ struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 	return bulk;
 }
 
-int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
+GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
 	unsigned int offset, num_lines;
 	struct gpiod_line *line;
@@ -81,7 +84,8 @@ int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 	return -1;
 }
 
-int gpiod_line_request_input(struct gpiod_line *line, const char *consumer)
+GPIOD_API int gpiod_line_request_input(struct gpiod_line *line,
+				       const char *consumer)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -91,8 +95,8 @@ int gpiod_line_request_input(struct gpiod_line *line, const char *consumer)
 	return gpiod_line_request(line, &config, 0);
 }
 
-int gpiod_line_request_output(struct gpiod_line *line,
-			      const char *consumer, int default_val)
+GPIOD_API int gpiod_line_request_output(struct gpiod_line *line,
+					const char *consumer, int default_val)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -102,8 +106,8 @@ int gpiod_line_request_output(struct gpiod_line *line,
 	return gpiod_line_request(line, &config, default_val);
 }
 
-int gpiod_line_request_input_flags(struct gpiod_line *line,
-				   const char *consumer, int flags)
+GPIOD_API int gpiod_line_request_input_flags(struct gpiod_line *line,
+					     const char *consumer, int flags)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -114,9 +118,9 @@ int gpiod_line_request_input_flags(struct gpiod_line *line,
 	return gpiod_line_request(line, &config, 0);
 }
 
-int gpiod_line_request_output_flags(struct gpiod_line *line,
-				    const char *consumer, int flags,
-				    int default_val)
+GPIOD_API int gpiod_line_request_output_flags(struct gpiod_line *line,
+					      const char *consumer, int flags,
+					      int default_val)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -139,52 +143,55 @@ static int line_event_request_type(struct gpiod_line *line,
 	return gpiod_line_request(line, &config, 0);
 }
 
-int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
-					  const char *consumer)
+GPIOD_API int gpiod_line_request_rising_edge_events(struct gpiod_line *line,
+						    const char *consumer)
 {
 	return line_event_request_type(line, consumer, 0,
 				       GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
 }
 
-int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
-					   const char *consumer)
+GPIOD_API int gpiod_line_request_falling_edge_events(struct gpiod_line *line,
+						     const char *consumer)
 {
 	return line_event_request_type(line, consumer, 0,
 				       GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
 }
 
-int gpiod_line_request_both_edges_events(struct gpiod_line *line,
-					 const char *consumer)
+GPIOD_API int gpiod_line_request_both_edges_events(struct gpiod_line *line,
+						   const char *consumer)
 {
 	return line_event_request_type(line, consumer, 0,
 				       GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
 }
 
-int gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
-						const char *consumer,
-						int flags)
+GPIOD_API int
+gpiod_line_request_rising_edge_events_flags(struct gpiod_line *line,
+					    const char *consumer,
+					    int flags)
 {
 	return line_event_request_type(line, consumer, flags,
 				       GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
 }
 
-int gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
-						 const char *consumer,
-						 int flags)
+GPIOD_API int
+gpiod_line_request_falling_edge_events_flags(struct gpiod_line *line,
+					     const char *consumer,
+					     int flags)
 {
 	return line_event_request_type(line, consumer, flags,
 				       GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
 }
 
-int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
-					       const char *consumer, int flags)
+GPIOD_API int
+gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
+					   const char *consumer, int flags)
 {
 	return line_event_request_type(line, consumer, flags,
 				       GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
 }
 
-int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
-				  const char *consumer)
+GPIOD_API int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
+					    const char *consumer)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -194,9 +201,9 @@ int gpiod_line_request_bulk_input(struct gpiod_line_bulk *bulk,
 	return gpiod_line_request_bulk(bulk, &config, 0);
 }
 
-int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
-				   const char *consumer,
-				   const int *default_vals)
+GPIOD_API int gpiod_line_request_bulk_output(struct gpiod_line_bulk *bulk,
+					     const char *consumer,
+					     const int *default_vals)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -219,29 +226,33 @@ static int line_event_request_type_bulk(struct gpiod_line_bulk *bulk,
 	return gpiod_line_request_bulk(bulk, &config, 0);
 }
 
-int gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
-					       const char *consumer)
+GPIOD_API int
+gpiod_line_request_bulk_rising_edge_events(struct gpiod_line_bulk *bulk,
+					   const char *consumer)
 {
 	return line_event_request_type_bulk(bulk, consumer, 0,
 					GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
 }
 
-int gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
-						const char *consumer)
+GPIOD_API int
+gpiod_line_request_bulk_falling_edge_events(struct gpiod_line_bulk *bulk,
+					    const char *consumer)
 {
 	return line_event_request_type_bulk(bulk, consumer, 0,
 					GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
 }
 
-int gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
-					      const char *consumer)
+GPIOD_API int
+gpiod_line_request_bulk_both_edges_events(struct gpiod_line_bulk *bulk,
+					  const char *consumer)
 {
 	return line_event_request_type_bulk(bulk, consumer, 0,
 					GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
 }
 
-int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
-					const char *consumer, int flags)
+GPIOD_API int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
+						  const char *consumer,
+						  int flags)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -252,9 +263,10 @@ int gpiod_line_request_bulk_input_flags(struct gpiod_line_bulk *bulk,
 	return gpiod_line_request_bulk(bulk, &config, 0);
 }
 
-int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
-					 const char *consumer, int flags,
-					 const int *default_vals)
+GPIOD_API int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
+						   const char *consumer,
+						   int flags,
+						   const int *default_vals)
 {
 	struct gpiod_line_request_config config = {
 		.consumer = consumer,
@@ -265,7 +277,7 @@ int gpiod_line_request_bulk_output_flags(struct gpiod_line_bulk *bulk,
 	return gpiod_line_request_bulk(bulk, &config, default_vals);
 }
 
-int gpiod_line_request_bulk_rising_edge_events_flags(
+GPIOD_API int gpiod_line_request_bulk_rising_edge_events_flags(
 					struct gpiod_line_bulk *bulk,
 					const char *consumer, int flags)
 {
@@ -273,7 +285,7 @@ int gpiod_line_request_bulk_rising_edge_events_flags(
 					GPIOD_LINE_REQUEST_EVENT_RISING_EDGE);
 }
 
-int gpiod_line_request_bulk_falling_edge_events_flags(
+GPIOD_API int gpiod_line_request_bulk_falling_edge_events_flags(
 					struct gpiod_line_bulk *bulk,
 					const char *consumer, int flags)
 {
@@ -281,7 +293,7 @@ int gpiod_line_request_bulk_falling_edge_events_flags(
 					GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE);
 }
 
-int gpiod_line_request_bulk_both_edges_events_flags(
+GPIOD_API int gpiod_line_request_bulk_both_edges_events_flags(
 					struct gpiod_line_bulk *bulk,
 					const char *consumer, int flags)
 {
diff --git a/lib/internal.h b/lib/internal.h
new file mode 100644
index 0000000..8b3f69a
--- /dev/null
+++ b/lib/internal.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com> */
+
+#ifndef __LIBGPIOD_GPIOD_INTERNAL_H__
+#define __LIBGPIOD_GPIOD_INTERNAL_H__
+
+/* For internal library use only. */
+
+#define GPIOD_API __attribute__((visibility("default")))
+
+#endif /* __LIBGPIOD_GPIOD_INTERNAL_H__ */
diff --git a/lib/misc.c b/lib/misc.c
index 5583eb0..984405b 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -5,7 +5,9 @@
 
 #include <gpiod.h>
 
-const char *gpiod_version_string(void)
+#include "internal.h"
+
+GPIOD_API const char *gpiod_version_string(void)
 {
 	return GPIOD_VERSION_STR;
 }
-- 
2.30.1

