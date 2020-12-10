Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B862D5BA3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389114AbgLJNYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389204AbgLJNYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:51 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECB2C0611CC
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:40 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l9so5439658wrt.13
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4BSYnwiIQ7CT0Z5pJ2mXNb8eQMvY9YaXHEnPXL6O4cs=;
        b=hdIdg1LvSnn5BlwPRzn2fBgFbP7OFcV4C9u8Z933dnpCtGrBZatlW9Qb/F0ywGMdhl
         Q/NLn5f6MgtH+A31fYmBgM2dpam03vzPd3Bza+IYInO+7a+Br6YLrAxc/yCqfSc/UOBo
         u6i78yrZhNbgIX539HsR+Sl1164P7ysCECcuYIV1Nkk6GIBTjHL3uenYmpDQekBjU0tB
         YBgJ2fAdvDTjCHZBFhu5D9pmEm3qyY0GH/wuscrXlgYC3I/0KfeY7jASN+j2PuUFazgM
         dP1wOT2iIC/Xc7X8sCHREY71DmfLtosFU8LZjQtIKkXv3HGITpcJ8/5eOG+vTnGiJ3gl
         X7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4BSYnwiIQ7CT0Z5pJ2mXNb8eQMvY9YaXHEnPXL6O4cs=;
        b=EAMsngRC/+A3+GCt0mbtcIaU6S8SG56PoifBGP4HrQ1NAIPwE+3WRxYyez1AYVMR3y
         86+AHZf01bT4xV54x00FmE4U3dESHspYNiKVncFkeKvkNYs7p9u9xo/keYhdXqNMTvOl
         WX5q859vSJsUIMiVoiVKysZwZIEyToFf/d8dx1379uXET8oPCYXhyCJc+tn0sp8bpeA7
         4fgsOuoF04fF/uWME98+E5jHvkvXp8WVhFtE7wCP6N+PkafIUwelNWxRu0omarzxZAlx
         1SlZP6CmUrG1wRDzhKMC9w+nuNocC39Us1esyAzDTbzomUMXUNA/5Im1rw3nb8ZsPp0p
         x8pw==
X-Gm-Message-State: AOAM530Z3TB5Q3sAvE1HBCPZsdNx64Itqr/ETeKqJX1nwLD1+XDJ5y89
        grWtrny+JkUr1/WrJMmUgN1yIIJnuRj/iw==
X-Google-Smtp-Source: ABdhPJxVN8otec0I/rysHu5JxkoM1K6TYSymfWBTZEdlNI97CyERU4VYeeQ/prHRJaSappIRzkvOLA==
X-Received: by 2002:adf:fccb:: with SMTP id f11mr1041144wrs.3.1607606619323;
        Thu, 10 Dec 2020 05:23:39 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 14/14] core: kill chip iterators
Date:   Thu, 10 Dec 2020 14:23:15 +0100
Message-Id: <20201210132315.5785-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Chip iterators require the user to have permission to access all GPIO
chips. They also don't take into account symbolic links. In general
they're badly designed so remove them treewide in favor of scanning /dev
manually using the provided gpiod_is_gpiochip_device() helper.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp                   |   5 +
 bindings/cxx/examples/Makefile.am       |   4 +-
 bindings/cxx/examples/gpiodetectcxx.cpp |  13 ++-
 bindings/cxx/examples/gpiofindcxx.cpp   |  16 ++-
 bindings/cxx/examples/gpioinfocxx.cpp   |  43 +++++----
 bindings/cxx/gpiod.hpp                  | 117 ++--------------------
 bindings/cxx/iter.cpp                   |  67 -------------
 bindings/cxx/tests/tests-chip.cpp       |  20 ++++
 bindings/cxx/tests/tests-iter.cpp       |  37 -------
 bindings/python/examples/gpiodetect.py  |  12 ++-
 bindings/python/examples/gpiofind.py    |  15 ++-
 bindings/python/examples/gpioinfo.py    |  33 ++++---
 bindings/python/gpiodmodule.c           | 114 +++++++---------------
 bindings/python/tests/gpiod_py_test.py  |  39 +++-----
 configure.ac                            |   6 ++
 include/gpiod.h                         |  93 +-----------------
 lib/Makefile.am                         |   2 +-
 lib/iter.c                              | 123 ------------------------
 tests/Makefile.am                       |   1 -
 tests/gpiod-test.h                      |   2 -
 tests/tests-iter.c                      | 100 -------------------
 tools/gpiodetect.c                      |  29 ++++--
 tools/gpiofind.c                        |  27 +++---
 tools/gpioinfo.c                        |  27 ++++--
 tools/tools-common.c                    |  15 +++
 tools/tools-common.h                    |   3 +
 26 files changed, 250 insertions(+), 713 deletions(-)
 delete mode 100644 lib/iter.c
 delete mode 100644 tests/tests-iter.c

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 82ba559..107088e 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -51,6 +51,11 @@ void chip_deleter(::gpiod_chip* chip)
 
 } /* namespace */
 
+bool is_gpiochip_device(const ::std::string& path)
+{
+	return ::gpiod_is_gpiochip_device(path.c_str());
+}
+
 chip::chip(const ::std::string& device, int how)
 	: _m_chip()
 {
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index 8d39be2..43e9875 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -7,8 +7,8 @@
 #
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
-AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++11
-AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
+AM_CPPFLAGS += -Wall -Wextra -g -std=gnu++17
+AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/ -lstdc++fs
 
 noinst_PROGRAMS =				\
 		gpiodetectcxx			\
diff --git a/bindings/cxx/examples/gpiodetectcxx.cpp b/bindings/cxx/examples/gpiodetectcxx.cpp
index 6da5573..76d367d 100644
--- a/bindings/cxx/examples/gpiodetectcxx.cpp
+++ b/bindings/cxx/examples/gpiodetectcxx.cpp
@@ -10,6 +10,7 @@
 #include <gpiod.hpp>
 
 #include <cstdlib>
+#include <filesystem>
 #include <iostream>
 
 int main(int argc, char **argv)
@@ -19,10 +20,14 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	for (auto& it: ::gpiod::make_chip_iter()) {
-	        ::std::cout << it.name() << " ["
-			  << it.label() << "] ("
-			  << it.num_lines() << " lines)" << ::std::endl;
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path())) {
+			::gpiod::chip chip(entry.path());
+
+			::std::cout << chip.name() << " ["
+				    << chip.label() << "] ("
+				    << chip.num_lines() << " lines)" << ::std::endl;
+		}
 	}
 
 	return EXIT_SUCCESS;
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index c817378..f8b771c 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -10,6 +10,7 @@
 #include <gpiod.hpp>
 
 #include <cstdlib>
+#include <filesystem>
 #include <iostream>
 
 int main(int argc, char **argv)
@@ -19,11 +20,16 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	for (auto& chip: ::gpiod::make_chip_iter()) {
-		auto lines = chip.find_line(argv[1], true);
-		if (!lines.empty()) {
-			::std::cout << lines.front().name() << " " << lines.front().offset() << ::std::endl;
-			return EXIT_SUCCESS;
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path())) {
+			::gpiod::chip chip(entry.path());
+
+			auto lines = chip.find_line(argv[1], true);
+			if (!lines.empty()) {
+				::std::cout << lines.front().name() << " " <<
+					       lines.front().offset() << ::std::endl;
+				return EXIT_SUCCESS;
+			}
 		}
 	}
 
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
index 02d69b6..2490abd 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -10,6 +10,7 @@
 #include <gpiod.hpp>
 
 #include <cstdlib>
+#include <filesystem>
 #include <iostream>
 
 int main(int argc, char **argv)
@@ -19,31 +20,35 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	for (auto& cit: ::gpiod::make_chip_iter()) {
-		::std::cout << cit.name() << " - " << cit.num_lines() << " lines:" << ::std::endl;
+	for (const auto& entry: ::std::filesystem::directory_iterator("/dev/")) {
+		if (::gpiod::is_gpiochip_device(entry.path())) {
+			::gpiod::chip chip(entry.path());
 
-		for (auto& lit: ::gpiod::line_iter(cit)) {
-			::std::cout << "\tline ";
-			::std::cout.width(3);
-			::std::cout << lit.offset() << ": ";
+			::std::cout << chip.name() << " - " << chip.num_lines() << " lines:" << ::std::endl;
 
-			::std::cout.width(12);
-			::std::cout << (lit.name().empty() ? "unnamed" : lit.name());
-			::std::cout << " ";
+			for (auto& lit: ::gpiod::line_iter(chip)) {
+				::std::cout << "\tline ";
+				::std::cout.width(3);
+				::std::cout << lit.offset() << ": ";
 
-			::std::cout.width(12);
-			::std::cout << (lit.consumer().empty() ? "unused" : lit.consumer());
-			::std::cout << " ";
+				::std::cout.width(12);
+				::std::cout << (lit.name().empty() ? "unnamed" : lit.name());
+				::std::cout << " ";
 
-			::std::cout.width(8);
-			::std::cout << (lit.direction() == ::gpiod::line::DIRECTION_INPUT ? "input" : "output");
-			::std::cout << " ";
+				::std::cout.width(12);
+				::std::cout << (lit.consumer().empty() ? "unused" : lit.consumer());
+				::std::cout << " ";
 
-			::std::cout.width(10);
-			::std::cout << (lit.active_state() == ::gpiod::line::ACTIVE_LOW
-								? "active-low" : "active-high");
+				::std::cout.width(8);
+				::std::cout << (lit.direction() == ::gpiod::line::DIRECTION_INPUT ? "input" : "output");
+				::std::cout << " ";
 
-			::std::cout << ::std::endl;
+				::std::cout.width(10);
+				::std::cout << (lit.active_state() == ::gpiod::line::ACTIVE_LOW
+									? "active-low" : "active-high");
+
+				::std::cout << ::std::endl;
+			}
 		}
 	}
 
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 9d081fe..d81ee30 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -32,6 +32,14 @@ struct line_event;
  * @{
  */
 
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return True if the file exists and is a GPIO chip character device or a
+ *         symbolic link to it.
+ */
+bool is_gpiochip_device(const ::std::string& path) GPIOD_API;
+
 /**
  * @brief Represents a GPIO chip.
  *
@@ -861,115 +869,6 @@ private:
 	::std::vector<line> _m_bulk;
 };
 
-/**
- * @brief Create a new chip_iter.
- * @return New chip iterator object pointing to the first GPIO chip on the system.
- * @note This function is needed as we already use the default constructor of
- *       gpiod::chip_iter as the return value of gpiod::end.
- */
-GPIOD_API chip_iter make_chip_iter(void);
-
-/**
- * @brief Support for range-based loops for chip iterators.
- * @param iter A chip iterator.
- * @return Iterator unchanged.
- */
-GPIOD_API chip_iter begin(chip_iter iter) noexcept;
-
-/**
- * @brief Support for range-based loops for chip iterators.
- * @param iter A chip iterator.
- * @return New end iterator.
- */
-GPIOD_API chip_iter end(const chip_iter& iter) noexcept;
-
-/**
- * @brief Allows to iterate over all GPIO chips present on the system.
- */
-class chip_iter
-{
-public:
-
-	/**
-	 * @brief Default constructor. Creates the end iterator.
-	 */
-	GPIOD_API chip_iter(void) = default;
-
-	/**
-	 * @brief Copy constructor.
-	 * @param other Other chip_iter.
-	 */
-	GPIOD_API chip_iter(const chip_iter& other) = default;
-
-	/**
-	 * @brief Move constructor.
-	 * @param other Other chip_iter.
-	 */
-	GPIOD_API chip_iter(chip_iter&& other) = default;
-
-	/**
-	 * @brief Assignment operator.
-	 * @param other Other chip_iter.
-	 * @return Reference to this iterator.
-	 */
-	GPIOD_API chip_iter& operator=(const chip_iter& other) = default;
-
-	/**
-	 * @brief Move assignment operator.
-	 * @param other Other chip_iter.
-	 * @return Reference to this iterator.
-	 */
-	GPIOD_API chip_iter& operator=(chip_iter&& other) = default;
-
-	/**
-	 * @brief Destructor.
-	 */
-	GPIOD_API ~chip_iter(void) = default;
-
-	/**
-	 * @brief Advance the iterator by one element.
-	 * @return Reference to this iterator.
-	 */
-	GPIOD_API chip_iter& operator++(void);
-
-	/**
-	 * @brief Dereference current element.
-	 * @return Current GPIO chip by reference.
-	 */
-	GPIOD_API const chip& operator*(void) const;
-
-	/**
-	 * @brief Member access operator.
-	 * @return Current GPIO chip by pointer.
-	 */
-	GPIOD_API const chip* operator->(void) const;
-
-	/**
-	 * @brief Check if this operator points to the same element.
-	 * @param rhs Right-hand side of the equation.
-	 * @return True if this iterator points to the same chip_iter,
-	 *         false otherwise.
-	 */
-	GPIOD_API bool operator==(const chip_iter& rhs) const noexcept;
-
-	/**
-	 * @brief Check if this operator doesn't point to the same element.
-	 * @param rhs Right-hand side of the equation.
-	 * @return True if this iterator doesn't point to the same chip_iter,
-	 *         false otherwise.
-	 */
-	GPIOD_API bool operator!=(const chip_iter& rhs) const noexcept;
-
-private:
-
-	chip_iter(::gpiod_chip_iter* iter);
-
-	::std::shared_ptr<::gpiod_chip_iter> _m_iter;
-	chip _m_current;
-
-	friend chip_iter make_chip_iter(void);
-};
-
 /**
  * @brief Support for range-based loops for line iterators.
  * @param iter A line iterator.
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
index 15c3925..846d36b 100644
--- a/bindings/cxx/iter.cpp
+++ b/bindings/cxx/iter.cpp
@@ -10,73 +10,6 @@
 
 namespace gpiod {
 
-namespace {
-
-void chip_iter_deleter(::gpiod_chip_iter* iter)
-{
-	::gpiod_chip_iter_free_noclose(iter);
-}
-
-} /* namespace */
-
-chip_iter make_chip_iter(void)
-{
-	::gpiod_chip_iter* iter = ::gpiod_chip_iter_new();
-	if (!iter)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error creating GPIO chip iterator");
-
-	return chip_iter(iter);
-}
-
-bool chip_iter::operator==(const chip_iter& rhs) const noexcept
-{
-	return this->_m_current == rhs._m_current;
-}
-
-bool chip_iter::operator!=(const chip_iter& rhs) const noexcept
-{
-	return this->_m_current != rhs._m_current;
-}
-
-chip_iter::chip_iter(::gpiod_chip_iter *iter)
-	: _m_iter(iter, chip_iter_deleter)
-{
-	::gpiod_chip* first = ::gpiod_chip_iter_next_noclose(this->_m_iter.get());
-
-	if (first != nullptr)
-		this->_m_current = chip(first);
-}
-
-chip_iter& chip_iter::operator++(void)
-{
-	::gpiod_chip* next = ::gpiod_chip_iter_next_noclose(this->_m_iter.get());
-
-	this->_m_current = next ? chip(next) : chip();
-
-	return *this;
-}
-
-const chip& chip_iter::operator*(void) const
-{
-	return this->_m_current;
-}
-
-const chip* chip_iter::operator->(void) const
-{
-	return ::std::addressof(this->_m_current);
-}
-
-chip_iter begin(chip_iter iter) noexcept
-{
-	return iter;
-}
-
-chip_iter end(const chip_iter&) noexcept
-{
-	return chip_iter();
-}
-
 line_iter begin(line_iter iter) noexcept
 {
 	return iter;
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index c45f2df..2492b42 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -12,6 +12,26 @@
 
 using ::gpiod::test::mockup;
 
+TEST_CASE("GPIO chip device can be verified with is_gpiochip_device()", "[chip]")
+{
+	mockup::probe_guard mockup_chips({ 8 });
+
+	SECTION("good chip")
+	{
+		REQUIRE(::gpiod::is_gpiochip_device(mockup::instance().chip_path(0)));
+	}
+
+	SECTION("not a chip")
+	{
+		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/null"));
+	}
+
+	SECTION("nonexistent file")
+	{
+		REQUIRE_FALSE(::gpiod::is_gpiochip_device("/dev/nonexistent_device"));
+	}
+}
+
 TEST_CASE("GPIO chip device can be opened in different modes", "[chip]")
 {
 	mockup::probe_guard mockup_chips({ 8, 8, 8 });
diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
index 4c07613..708709c 100644
--- a/bindings/cxx/tests/tests-iter.cpp
+++ b/bindings/cxx/tests/tests-iter.cpp
@@ -12,43 +12,6 @@
 
 using ::gpiod::test::mockup;
 
-TEST_CASE("Chip iterator works", "[iter][chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8 });
-	bool gotA = false, gotB = false, gotC = false;
-
-	for (auto& it: ::gpiod::make_chip_iter()) {
-		if (it.label() == "gpio-mockup-A")
-			gotA = true;
-		if (it.label() == "gpio-mockup-B")
-			gotB = true;
-		if (it.label() == "gpio-mockup-C")
-			gotC = true;
-	}
-
-	REQUIRE(gotA);
-	REQUIRE(gotB);
-	REQUIRE(gotC);
-}
-
-TEST_CASE("Chip iterator loop can be broken out of", "[iter][chip]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8, 8, 8, 8 });
-	int count_chips = 0;
-
-	for (auto& it: ::gpiod::make_chip_iter()) {
-		if (it.label() == "gpio-mockup-A" ||
-		    it.label() == "gpio-mockup-B" ||
-		    it.label() == "gpio-mockup-C")
-			count_chips++;
-
-		if (count_chips == 3)
-			break;
-	}
-
-	REQUIRE(count_chips == 3);
-}
-
 TEST_CASE("Line iterator works", "[iter][line]")
 {
 	mockup::probe_guard mockup_chips({ 4 });
diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
index 9318f51..781939b 100755
--- a/bindings/python/examples/gpiodetect.py
+++ b/bindings/python/examples/gpiodetect.py
@@ -10,10 +10,12 @@
 '''Reimplementation of the gpiodetect tool in Python.'''
 
 import gpiod
+import os
 
 if __name__ == '__main__':
-    for chip in gpiod.ChipIter():
-        print('{} [{}] ({} lines)'.format(chip.name(),
-                                          chip.label(),
-                                          chip.num_lines()))
-        chip.close()
+    for entry in os.scandir('/dev/'):
+        if gpiod.is_gpiochip_device(entry.path):
+            with gpiod.Chip(entry.path) as chip:
+                print('{} [{}] ({} lines)'.format(chip.name(),
+                                                  chip.label(),
+                                                  chip.num_lines()))
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
index 8505ba0..2655742 100755
--- a/bindings/python/examples/gpiofind.py
+++ b/bindings/python/examples/gpiofind.py
@@ -10,12 +10,17 @@
 '''Reimplementation of the gpiofind tool in Python.'''
 
 import gpiod
+import os
 import sys
 
 if __name__ == '__main__':
-    line = gpiod.find_line(sys.argv[1])
-    if line is None:
-        sys.exit(1)
+    for entry in os.scandir('/dev/'):
+        if gpiod.is_gpiochip_device(entry.path):
+            with gpiod.Chip(entry.path) as chip:
+                lines = chip.find_line(sys.argv[1], unique=True)
+                if lines is not None:
+                     line = lines.to_list()[0]
+                     print('{} {}'.format(line.owner().name(), line.offset()))
+                     sys.exit(0)
 
-    print('{} {}'.format(line.owner().name(), line.offset()))
-    line.owner().close()
+    sys.exit(1)
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
index de4b6f3..6a47b66 100755
--- a/bindings/python/examples/gpioinfo.py
+++ b/bindings/python/examples/gpioinfo.py
@@ -10,23 +10,24 @@
 '''Simplified reimplementation of the gpioinfo tool in Python.'''
 
 import gpiod
+import os
 
 if __name__ == '__main__':
-    for chip in gpiod.ChipIter():
-        print('{} - {} lines:'.format(chip.name(), chip.num_lines()))
+    for entry in os.scandir('/dev/'):
+        if gpiod.is_gpiochip_device(entry.path):
+            with gpiod.Chip(entry.path) as chip:
+                print('{} - {} lines:'.format(chip.name(), chip.num_lines()))
 
-        for line in gpiod.LineIter(chip):
-            offset = line.offset()
-            name = line.name()
-            consumer = line.consumer()
-            direction = line.direction()
-            active_state = line.active_state()
+                for line in gpiod.LineIter(chip):
+                    offset = line.offset()
+                    name = line.name()
+                    consumer = line.consumer()
+                    direction = line.direction()
+                    active_state = line.active_state()
 
-            print('\tline {:>3}: {:>18} {:>12} {:>8} {:>10}'.format(
-                    offset,
-                    'unnamed' if name is None else name,
-                    'unused' if consumer is None else consumer,
-                    'input' if direction == gpiod.Line.DIRECTION_INPUT else 'output',
-                    'active-low' if active_state == gpiod.Line.ACTIVE_LOW else 'active-high'))
-
-        chip.close()
+                    print('\tline {:>3}: {:>18} {:>12} {:>8} {:>10}'.format(
+                          offset,
+                          'unnamed' if name is None else name,
+                          'unused' if consumer is None else consumer,
+                          'input' if direction == gpiod.Line.DIRECTION_INPUT else 'output',
+                          'active-low' if active_state == gpiod.Line.ACTIVE_LOW else 'active-high'))
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index d183e6f..af37df2 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -34,11 +34,6 @@ typedef struct {
 	Py_ssize_t iter_idx;
 } gpiod_LineBulkObject;
 
-typedef struct {
-	PyObject_HEAD
-	struct gpiod_chip_iter *iter;
-} gpiod_ChipIterObject;
-
 typedef struct {
 	PyObject_HEAD
 	unsigned int offset;
@@ -2220,7 +2215,7 @@ PyDoc_STRVAR(gpiod_Chip_find_line_doc,
 static gpiod_LineBulkObject *
 gpiod_Chip_find_line(gpiod_ChipObject *self, PyObject *args, PyObject *kwds)
 {
-	static char *kwlist[] = { "unique", NULL };
+	static char *kwlist[] = { "", "unique", NULL };
 
 	gpiod_LineBulkObject *bulk_obj;
 	struct gpiod_line_bulk *bulk;
@@ -2469,76 +2464,6 @@ static PyTypeObject gpiod_ChipType = {
 	.tp_methods = gpiod_Chip_methods,
 };
 
-static int gpiod_ChipIter_init(gpiod_ChipIterObject *self,
-			       PyObject *Py_UNUSED(ignored0),
-			       PyObject *Py_UNUSED(ignored1))
-{
-	self->iter = gpiod_chip_iter_new();
-	if (!self->iter) {
-		PyErr_SetFromErrno(PyExc_OSError);
-		return -1;
-	}
-
-	return 0;
-}
-
-static void gpiod_ChipIter_dealloc(gpiod_ChipIterObject *self)
-{
-	if (self->iter)
-		gpiod_chip_iter_free_noclose(self->iter);
-
-	PyObject_Del(self);
-}
-
-static gpiod_ChipObject *gpiod_ChipIter_next(gpiod_ChipIterObject *self)
-{
-	gpiod_ChipObject *chip_obj;
-	struct gpiod_chip *chip;
-
-	Py_BEGIN_ALLOW_THREADS;
-	chip = gpiod_chip_iter_next_noclose(self->iter);
-	Py_END_ALLOW_THREADS;
-	if (!chip)
-		return NULL; /* Last element. */
-
-	chip_obj = PyObject_New(gpiod_ChipObject, &gpiod_ChipType);
-	if (!chip_obj) {
-		gpiod_chip_close(chip);
-		return NULL;
-	}
-
-	chip_obj->chip = chip;
-
-	return chip_obj;
-}
-
-PyDoc_STRVAR(gpiod_ChipIterType_doc,
-"Allows to iterate over all GPIO chips in the system.\n"
-"\n"
-"The ChipIter's constructor takes no arguments.\n"
-"\n"
-"Each iteration yields the next open GPIO chip handle. The caller is\n"
-"responsible for closing each chip\n"
-"\n"
-"Example:\n"
-"\n"
-"    for chip in gpiod.ChipIter():\n"
-"        do_something_with_chip(chip)\n"
-"        chip.close()");
-
-static PyTypeObject gpiod_ChipIterType = {
-	PyVarObject_HEAD_INIT(NULL, 0)
-	.tp_name = "gpiod.ChipIter",
-	.tp_basicsize = sizeof(gpiod_ChipIterObject),
-	.tp_flags = Py_TPFLAGS_DEFAULT,
-	.tp_doc = gpiod_ChipIterType_doc,
-	.tp_new = PyType_GenericNew,
-	.tp_init = (initproc)gpiod_ChipIter_init,
-	.tp_dealloc = (destructor)gpiod_ChipIter_dealloc,
-	.tp_iter = PyObject_SelfIter,
-	.tp_iternext = (iternextfunc)gpiod_ChipIter_next,
-};
-
 static int gpiod_LineIter_init(gpiod_LineIterObject *self,
 			       PyObject *args, PyObject *Py_UNUSED(ignored))
 {
@@ -2618,7 +2543,6 @@ static gpiod_PyType gpiod_PyType_list[] = {
 	{ .name = "LineEvent",	.typeobj = &gpiod_LineEventType,	},
 	{ .name = "LineBulk",	.typeobj = &gpiod_LineBulkType,		},
 	{ .name = "LineIter",	.typeobj = &gpiod_LineIterType,		},
-	{ .name = "ChipIter",	.typeobj = &gpiod_ChipIterType		},
 	{ }
 };
 
@@ -2702,6 +2626,41 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 	{ }
 };
 
+PyDoc_STRVAR(gpiod_Module_is_gpiochip_device_doc,
+"is_gpiochip_device(path) -> boolean\n"
+"\n"
+"Check if the file pointed to by path is a GPIO chip character device.\n"
+"Returns true if so, False otherwise.\n"
+"\n"
+"  path\n"
+"    Path to the file that should be checked.\n");
+
+static PyObject *
+gpiod_Module_is_gpiochip_device(PyObject *Py_UNUSED(self), PyObject *args)
+{
+	const char *path;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "s", &path);
+	if (!ret)
+		return NULL;
+
+	if (gpiod_is_gpiochip_device(path))
+		Py_RETURN_TRUE;
+
+	Py_RETURN_FALSE;
+}
+
+static PyMethodDef gpiod_module_methods[] = {
+	{
+		.ml_name = "is_gpiochip_device",
+		.ml_meth = (PyCFunction)gpiod_Module_is_gpiochip_device,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_Module_is_gpiochip_device_doc,
+	},
+	{ }
+};
+
 PyDoc_STRVAR(gpiod_Module_doc,
 "Python bindings for libgpiod.\n\
 \n\
@@ -2712,6 +2671,7 @@ static PyModuleDef gpiod_Module = {
 	.m_name = "gpiod",
 	.m_doc = gpiod_Module_doc,
 	.m_size = -1,
+	.m_methods = gpiod_module_methods,
 };
 
 typedef struct {
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index c490933..f116657 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -79,6 +79,19 @@ def check_kernel(major, minor, release):
 # Chip test cases
 #
 
+class IsGpioDevice(MockupTestCase):
+
+    chip_sizes = ( 8, )
+
+    def test_is_gpiochip_device_good(self):
+        self.assertTrue(gpiod.is_gpiochip_device(mockup.chip_path(0)))
+
+    def test_is_gpiochip_device_bad(self):
+        self.assertFalse(gpiod.is_gpiochip_device('/dev/null'))
+
+    def test_is_gpiochip_device_nonexistent(self):
+        self.assertFalse(gpiod.is_gpiochip_device('/dev/nonexistent_device'))
+
 class ChipOpen(MockupTestCase):
 
     chip_sizes = ( 8, 8, 8 )
@@ -149,8 +162,7 @@ class ChipGetLines(MockupTestCase):
 
     def test_find_single_line_by_name(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
-            lines = chip.find_line('gpio-mockup-B-4').to_list()
-            self.assertEqual(len(lines), 1)
+            lines = chip.find_line('gpio-mockup-B-4', unique=True).to_list()
             self.assertEqual(lines[0].offset(), 4)
 
     def test_get_single_line_invalid_offset(self):
@@ -162,7 +174,7 @@ class ChipGetLines(MockupTestCase):
 
     def test_find_single_line_nonexistent(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
-            lines = chip.find_line('nonexistent-line')
+            lines = chip.find_line('nonexistent-line', unique=True)
             self.assertEqual(lines, None)
 
     def test_get_multiple_lines_by_offsets_in_tuple(self):
@@ -675,27 +687,6 @@ class LineRequestBehavior(MockupTestCase):
 # Iterator test cases
 #
 
-class ChipIterator(MockupTestCase):
-
-    chip_sizes = ( 4, 8, 16 )
-
-    def test_iterate_over_chips(self):
-        gotA = False
-        gotB = False
-        gotC = False
-
-        for chip in gpiod.ChipIter():
-            if chip.label() == 'gpio-mockup-A':
-                gotA = True
-            elif chip.label() == 'gpio-mockup-B':
-                gotB = True
-            elif chip.label() == 'gpio-mockup-C':
-                gotC = True
-
-        self.assertTrue(gotA)
-        self.assertTrue(gotB)
-        self.assertTrue(gotC)
-
 class LineIterator(MockupTestCase):
 
     chip_sizes = ( 4, )
diff --git a/configure.ac b/configure.ac
index 90a6324..ddb9dc2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -181,6 +181,12 @@ then
 			AC_LANG_POP([C++])
 		])
 	fi
+
+	if test "x$with_examples" = xtrue
+	then
+		# Examples use C++17 features
+		AX_CXX_COMPILE_STDCXX([17], [ext], [mandatory])
+	fi
 fi
 
 AC_ARG_ENABLE([bindings-python],
diff --git a/include/gpiod.h b/include/gpiod.h
index fc50fe8..a7e7348 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -8,6 +8,7 @@
 #ifndef __LIBGPIOD_GPIOD_H__
 #define __LIBGPIOD_GPIOD_H__
 
+#include <dirent.h>
 #include <stdbool.h>
 #include <stdlib.h>
 #include <time.h>
@@ -27,7 +28,7 @@ extern "C" {
  * users of libgpiod.
  *
  * <p>The API is logically split into several parts such as: GPIO chip & line
- * operators, iterators, GPIO events handling etc.
+ * operators, GPIO events handling etc.
  *
  * <p>General note on error handling: all routines exported by libgpiod  set
  * errno to one of the error values defined in errno.h upon failure. The way
@@ -39,7 +40,6 @@ extern "C" {
 
 struct gpiod_chip;
 struct gpiod_line;
-struct gpiod_chip_iter;
 struct gpiod_line_bulk;
 
 /**
@@ -1053,95 +1053,6 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 /**
  * @}
  *
- * @}
- *
- * @defgroup iterators Iterators for GPIO chips and lines
- * @{
- *
- * These functions and data structures allow easy iterating over GPIO
- * chips and lines.
- */
-
-/**
- * @brief Create a new gpiochip iterator.
- * @return Pointer to a new chip iterator object or NULL if an error occurred.
- *
- * Internally this routine scans the /dev/ directory for GPIO chip device
- * files, opens them and stores their the handles until ::gpiod_chip_iter_free
- * or ::gpiod_chip_iter_free_noclose is called.
- */
-struct gpiod_chip_iter *gpiod_chip_iter_new(void) GPIOD_API;
-
-/**
- * @brief Release all resources allocated for the gpiochip iterator and close
- *        the most recently opened gpiochip (if any).
- * @param iter The gpiochip iterator object.
- */
-void gpiod_chip_iter_free(struct gpiod_chip_iter *iter) GPIOD_API;
-
-/**
- * @brief Release all resources allocated for the gpiochip iterator but
- *        don't close the most recently opened gpiochip (if any).
- * @param iter The gpiochip iterator object.
- *
- * Users may want to break the loop when iterating over gpiochips and keep
- * the most recently opened chip active while freeing the iterator data.
- * This routine enables that.
- */
-void gpiod_chip_iter_free_noclose(struct gpiod_chip_iter *iter) GPIOD_API;
-
-/**
- * @brief Get the next gpiochip handle.
- * @param iter The gpiochip iterator object.
- * @return Pointer to the next open gpiochip handle or NULL if no more chips
- *         are present in the system.
- * @note The previous chip handle will be closed using ::gpiod_chip_iter_free.
- */
-struct gpiod_chip *
-gpiod_chip_iter_next(struct gpiod_chip_iter *iter) GPIOD_API;
-
-/**
- * @brief Get the next gpiochip handle without closing the previous one.
- * @param iter The gpiochip iterator object.
- * @return Pointer to the next open gpiochip handle or NULL if no more chips
- *         are present in the system.
- * @note This function works just like ::gpiod_chip_iter_next but doesn't
- *       close the most recently opened chip handle.
- */
-struct gpiod_chip *
-gpiod_chip_iter_next_noclose(struct gpiod_chip_iter *iter) GPIOD_API;
-
-/**
- * @brief Iterate over all GPIO chips present in the system.
- * @param iter An initialized GPIO chip iterator.
- * @param chip Pointer to a GPIO chip handle. On each iteration the newly
- *             opened chip handle is assigned to this argument.
- *
- * The user must not close the GPIO chip manually - instead the previous chip
- * handle is closed automatically on the next iteration. The last chip to be
- * opened is closed internally by ::gpiod_chip_iter_free.
- */
-#define gpiod_foreach_chip(iter, chip)					\
-	for ((chip) = gpiod_chip_iter_next(iter);			\
-	     (chip);							\
-	     (chip) = gpiod_chip_iter_next(iter))
-
-/**
- * @brief Iterate over all chips present in the system without closing them.
- * @param iter An initialized GPIO chip iterator.
- * @param chip Pointer to a GPIO chip handle. On each iteration the newly
- *             opened chip handle is assigned to this argument.
- *
- * The user must close all the GPIO chips manually after use, until then, the
- * chips remain open. Free the iterator by calling
- * ::gpiod_chip_iter_free_noclose to avoid closing the last chip automatically.
- */
-#define gpiod_foreach_chip_noclose(iter, chip)				\
-	for ((chip) = gpiod_chip_iter_next_noclose(iter);		\
-	     (chip);							\
-	     (chip) = gpiod_chip_iter_next_noclose(iter))
-
-/**
  * @}
  *
  * @defgroup misc Stuff that didn't fit anywhere else
diff --git a/lib/Makefile.am b/lib/Makefile.am
index c5277ce..43ebf76 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -7,7 +7,7 @@
 #
 
 lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES = core.c helpers.c iter.c misc.c
+libgpiod_la_SOURCES = core.c helpers.c misc.c
 libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
 libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
diff --git a/lib/iter.c b/lib/iter.c
deleted file mode 100644
index 2ff767c..0000000
--- a/lib/iter.c
+++ /dev/null
@@ -1,123 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- */
-
-/* GPIO chip and line iterators. */
-
-#include <dirent.h>
-#include <gpiod.h>
-#include <string.h>
-
-struct gpiod_chip_iter {
-	struct gpiod_chip **chips;
-	unsigned int num_chips;
-	unsigned int offset;
-};
-
-static int dir_filter(const struct dirent *dir)
-{
-	return !strncmp(dir->d_name, "gpiochip", 8);
-}
-
-static void free_dirs(struct dirent **dirs, unsigned int num_dirs)
-{
-	unsigned int i;
-
-	for (i = 0; i < num_dirs; i++)
-		free(dirs[i]);
-	free(dirs);
-}
-
-struct gpiod_chip_iter *gpiod_chip_iter_new(void)
-{
-	struct gpiod_chip_iter *iter;
-	struct dirent **dirs;
-	int i, num_chips;
-
-	num_chips = scandir("/dev", &dirs, dir_filter, alphasort);
-	if (num_chips < 0)
-		return NULL;
-
-	iter = malloc(sizeof(*iter));
-	if (!iter)
-		goto err_free_dirs;
-
-	iter->num_chips = num_chips;
-	iter->offset = 0;
-
-	if (num_chips == 0) {
-		iter->chips = NULL;
-		return iter;
-	}
-
-	iter->chips = calloc(num_chips, sizeof(*iter->chips));
-	if (!iter->chips)
-		goto err_free_iter;
-
-	for (i = 0; i < num_chips; i++) {
-		iter->chips[i] = gpiod_chip_open_by_name(dirs[i]->d_name);
-		if (!iter->chips[i])
-			goto err_close_chips;
-	}
-
-	free_dirs(dirs, num_chips);
-
-	return iter;
-
-err_close_chips:
-	for (i = 0; i < num_chips; i++) {
-		if (iter->chips[i])
-			gpiod_chip_close(iter->chips[i]);
-	}
-
-	free(iter->chips);
-
-err_free_iter:
-	free(iter);
-
-err_free_dirs:
-	free_dirs(dirs, num_chips);
-
-	return NULL;
-}
-
-void gpiod_chip_iter_free(struct gpiod_chip_iter *iter)
-{
-	if (iter->offset > 0 && iter->offset < iter->num_chips)
-		gpiod_chip_close(iter->chips[iter->offset - 1]);
-	gpiod_chip_iter_free_noclose(iter);
-}
-
-void gpiod_chip_iter_free_noclose(struct gpiod_chip_iter *iter)
-{
-	unsigned int i;
-
-	for (i = iter->offset; i < iter->num_chips; i++) {
-		if (iter->chips[i])
-			gpiod_chip_close(iter->chips[i]);
-	}
-
-	if (iter->chips)
-		free(iter->chips);
-
-	free(iter);
-}
-
-struct gpiod_chip *gpiod_chip_iter_next(struct gpiod_chip_iter *iter)
-{
-	if (iter->offset > 0) {
-		gpiod_chip_close(iter->chips[iter->offset - 1]);
-		iter->chips[iter->offset - 1] = NULL;
-	}
-
-	return gpiod_chip_iter_next_noclose(iter);
-}
-
-struct gpiod_chip *gpiod_chip_iter_next_noclose(struct gpiod_chip_iter *iter)
-{
-	return iter->offset < (iter->num_chips)
-					? iter->chips[iter->offset++] : NULL;
-}
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 2d3b959..91798f7 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -25,6 +25,5 @@ gpiod_test_SOURCES =			\
 		tests-bulk.c		\
 		tests-chip.c		\
 		tests-event.c		\
-		tests-iter.c		\
 		tests-line.c		\
 		tests-misc.c
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index df9f0c7..7ed4d23 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -25,11 +25,9 @@
  */
 typedef struct gpiod_chip gpiod_chip_struct;
 typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
-typedef struct gpiod_chip_iter gpiod_chip_iter_struct;
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_close);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_iter_struct, gpiod_chip_iter_free);
 
 /* These are private definitions and should not be used directly. */
 typedef void (*_gpiod_test_func)(void);
diff --git a/tests/tests-iter.c b/tests/tests-iter.c
deleted file mode 100644
index 163a820..0000000
--- a/tests/tests-iter.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
-/*
- * This file is part of libgpiod.
- *
- * Copyright (C) 2019 Bartosz Golaszewski <bgolaszewski@baylibre.com>
- */
-
-#include <string.h>
-
-#include "gpiod-test.h"
-
-#define GPIOD_TEST_GROUP "iter"
-
-GPIOD_TEST_CASE(chip_iter, 0, { 8, 8, 8 })
-{
-	g_autoptr(gpiod_chip_iter_struct) iter = NULL;
-	struct gpiod_chip *chip;
-	gboolean A, B, C;
-
-	A = B = C = FALSE;
-
-	iter = gpiod_chip_iter_new();
-	g_assert_nonnull(iter);
-	gpiod_test_return_if_failed();
-
-	gpiod_foreach_chip(iter, chip) {
-		if (strcmp(gpiod_chip_label(chip), "gpio-mockup-A") == 0)
-			A = TRUE;
-		else if (strcmp(gpiod_chip_label(chip), "gpio-mockup-B") == 0)
-			B = TRUE;
-		else if (strcmp(gpiod_chip_label(chip), "gpio-mockup-C") == 0)
-			C = TRUE;
-	}
-
-	g_assert_true(A);
-	g_assert_true(B);
-	g_assert_true(C);
-}
-
-GPIOD_TEST_CASE(chip_iter_no_close, 0, { 8, 8, 8 })
-{
-	g_autoptr(gpiod_chip_iter_struct) iter = NULL;
-	g_autoptr(gpiod_chip_struct) chipA = NULL;
-	g_autoptr(gpiod_chip_struct) chipB = NULL;
-	g_autoptr(gpiod_chip_struct) chipC = NULL;
-	struct gpiod_chip *chip;
-
-	iter = gpiod_chip_iter_new();
-	g_assert_nonnull(iter);
-	gpiod_test_return_if_failed();
-
-	gpiod_foreach_chip_noclose(iter, chip) {
-		if (strcmp(gpiod_chip_label(chip), "gpio-mockup-A") == 0)
-			chipA = chip;
-		else if (strcmp(gpiod_chip_label(chip), "gpio-mockup-B") == 0)
-			chipB = chip;
-		else if (strcmp(gpiod_chip_label(chip), "gpio-mockup-C") == 0)
-			chipC = chip;
-		else
-			gpiod_chip_close(chip);
-	}
-
-	g_assert_nonnull(chipA);
-	g_assert_nonnull(chipB);
-	g_assert_nonnull(chipC);
-
-	gpiod_chip_iter_free_noclose(iter);
-	iter = NULL;
-
-	/* See if the chips are still open and usable. */
-	g_assert_cmpstr(gpiod_chip_label(chipA), ==, "gpio-mockup-A");
-	g_assert_cmpstr(gpiod_chip_label(chipB), ==, "gpio-mockup-B");
-	g_assert_cmpstr(gpiod_chip_label(chipC), ==, "gpio-mockup-C");
-}
-
-GPIOD_TEST_CASE(chip_iter_break, 0, { 8, 8, 8, 8, 8 })
-{
-	g_autoptr(gpiod_chip_iter_struct) iter = NULL;
-	struct gpiod_chip *chip;
-	guint i = 0;
-
-	iter = gpiod_chip_iter_new();
-	g_assert_nonnull(iter);
-	gpiod_test_return_if_failed();
-
-	gpiod_foreach_chip(iter, chip) {
-		if ((strcmp(gpiod_chip_label(chip), "gpio-mockup-A") == 0) ||
-		    (strcmp(gpiod_chip_label(chip), "gpio-mockup-B") == 0) ||
-		    (strcmp(gpiod_chip_label(chip), "gpio-mockup-C") == 0))
-			i++;
-
-		if (i == 3)
-			break;
-	}
-
-	gpiod_chip_iter_free(iter);
-	iter = NULL;
-
-	g_assert_cmpuint(i, ==, 3);
-}
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 1c992a4..8e067f7 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
  */
 
+#include <dirent.h>
+#include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
 #include <stdio.h>
@@ -33,9 +35,9 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	struct gpiod_chip_iter *iter;
+	int optc, opti, num_chips, i;
 	struct gpiod_chip *chip;
-	int optc, opti;
+	struct dirent **entries;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -62,18 +64,31 @@ int main(int argc, char **argv)
 	if (argc > 0)
 		die("unrecognized argument: %s", argv[0]);
 
-	iter = gpiod_chip_iter_new();
-	if (!iter)
-		die_perror("unable to access GPIO chips");
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+	if (num_chips < 0)
+		die_perror("unable to scan /dev");
+
+	for (i = 0; i < num_chips; i++) {
+		chip = gpiod_chip_open_by_name(entries[i]->d_name);
+		if (!chip) {
+			if (errno == EACCES)
+				printf("%s Permission denied\n",
+				       entries[i]->d_name);
+			else
+				die_perror("unable to open %s",
+					   entries[i]->d_name);
+		}
 
-	gpiod_foreach_chip(iter, chip) {
 		printf("%s [%s] (%u lines)\n",
 		       gpiod_chip_name(chip),
 		       gpiod_chip_label(chip),
 		       gpiod_chip_num_lines(chip));
+
+		gpiod_chip_close(chip);
+		free(entries[i]);
 	}
 
-	gpiod_chip_iter_free(iter);
+	free(entries);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index ffb8fc0..4acf621 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
  */
 
+#include <dirent.h>
 #include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
@@ -34,10 +35,10 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	struct gpiod_chip_iter *iter;
+	int i, num_chips, optc, opti;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
-	int optc, opti;
+	struct dirent **entries;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -64,23 +65,27 @@ int main(int argc, char **argv)
 	if (argc != 1)
 		die("exactly one GPIO line name must be specified");
 
-	iter = gpiod_chip_iter_new();
-	if (!iter)
-		die_perror("unable to access GPIO chips");
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+	if (num_chips < 0)
+		die_perror("unable to scan /dev");
+
+	for (i = 0; i < num_chips; i++) {
+		chip = gpiod_chip_open_by_name(entries[i]->d_name);
+		if (!chip) {
+			if (errno == EACCES)
+				continue;
+
+			die_perror("unable to open %s", entries[i]->d_name);
+		}
 
-	gpiod_foreach_chip(iter, chip) {
 		line = gpiod_chip_find_line_unique(chip, argv[0]);
 		if (line) {
 			printf("%s %u\n",
 			       gpiod_chip_name(chip), gpiod_line_offset(line));
-			gpiod_chip_iter_free(iter);
+			gpiod_chip_close(chip);
 			return EXIT_SUCCESS;
 		}
-
-		if (errno != ENOENT)
-			die_perror("error performing the line lookup");
 	}
 
-	gpiod_chip_iter_free(iter);
 	return EXIT_FAILURE;
 }
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index dd4a388..e3dbde7 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
  */
 
+#include <dirent.h>
 #include <errno.h>
 #include <getopt.h>
 #include <gpiod.h>
@@ -180,9 +181,9 @@ static void list_lines(struct gpiod_chip *chip)
 
 int main(int argc, char **argv)
 {
-	struct gpiod_chip_iter *chip_iter;
+	int num_chips, i, optc, opti;
 	struct gpiod_chip *chip;
-	int i, optc, opti;
+	struct dirent **entries;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -207,14 +208,26 @@ int main(int argc, char **argv)
 	argv += optind;
 
 	if (argc == 0) {
-		chip_iter = gpiod_chip_iter_new();
-		if (!chip_iter)
-			die_perror("error accessing GPIO chips");
+		num_chips = scandir("/dev/", &entries,
+				    chip_dir_filter, alphasort);
+		if (num_chips < 0)
+			die_perror("unable to scan /dev");
+
+		for (i = 0; i < num_chips; i++) {
+			chip = gpiod_chip_open_by_name(entries[i]->d_name);
+			if (!chip) {
+				if (errno == EACCES)
+					printf("%s Permission denied\n",
+					       entries[i]->d_name);
+				else
+					die_perror("unable to open %s",
+						   entries[i]->d_name);
+			}
 
-		gpiod_foreach_chip(chip_iter, chip)
 			list_lines(chip);
 
-		gpiod_chip_iter_free(chip_iter);
+			gpiod_chip_close(chip);
+		}
 	} else {
 		for (i = 0; i < argc; i++) {
 			chip = gpiod_chip_open_lookup(argv[i]);
diff --git a/tools/tools-common.c b/tools/tools-common.c
index af05102..b64ef93 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -101,3 +101,18 @@ int make_signalfd(void)
 
 	return sigfd;
 }
+
+int chip_dir_filter(const struct dirent *entry)
+{
+	bool is_chip;
+	char *path;
+	int ret;
+
+	ret = asprintf(&path, "/dev/%s", entry->d_name);
+	if (ret < 0)
+		return 0;
+
+	is_chip = gpiod_is_gpiochip_device(path);
+	free(path);
+	return !!is_chip;
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 8ccde62..4148dd8 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -8,6 +8,8 @@
 #ifndef __GPIOD_TOOLS_COMMON_H__
 #define __GPIOD_TOOLS_COMMON_H__
 
+#include <dirent.h>
+
 /*
  * Various helpers for the GPIO tools.
  *
@@ -29,5 +31,6 @@ void print_version(void);
 int bias_flags(const char *option);
 void print_bias_help(void);
 int make_signalfd(void);
+int chip_dir_filter(const struct dirent *entry);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.29.1

