Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4EA290136
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 11:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405599AbgJPJJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 05:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394659AbgJPJJx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 05:09:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75122C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 02:09:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so1835173wru.12
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2020 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1m0plo1fK1W0V7WTbRJJjix3jro0QT0SC62zhQtsUs=;
        b=N8WlpKTo3EdJj6MJZYvbQ5zuei2AvTtikPp2JeePEOfCWNc6fObgPuw8XyQ8SsCiMM
         s73bgHjqR1BTADhjguj7aeUaSmLJHcOT03kSRy55aXd3KK17/TzMRyt/2i5kcu/cUS1L
         KTrMT6Gsi1hkv6GNNiQdK5hy/iza3MzRtUN+gNB85PUm1M5wTEb1TsiSwqsKv5LPYOqv
         I0Qj5vMg06B70hqWuuOaM7NQMpDl6XYEwWAWxuqnlXfoiEWUA0CNU7WoeZli6I6PZOnu
         wjh4Lf+bWza1gTSkCMpb2X5t/QPR5JYCMihqSXMP3nHgCjhyQL4bsTkXss09DZA/0VzC
         lswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G1m0plo1fK1W0V7WTbRJJjix3jro0QT0SC62zhQtsUs=;
        b=BqpU2lFBFXbo7pxe03NoLM+mT3+A9zJmCMiYE4mIMjsqxWCqoRW4DA1JTLTpILG26g
         7G1nUsbUiWn/At4g15I4mNkZlbSLmPx+QAKkoJhEsObN6X9U55Jr231tr3yVBZcqEzSn
         gHXu1wQq1eQBQ6K/KlfEqnyTzPYv9Z18gKjTQ1OkYhbNQr8J2UxrQH1N+1j17EAhCD7q
         gQgesa+8yMPW+0O1vQ0qW6kF/xwrB58YNvr3LN3sLYV/p6cwPnHSsb8LTk+Hh3HCIYUU
         ZFl4lfIi1Ah8IMhg3VVvhw7bMjTvNSeb5JyTdSalPnoUNOdGjgvwAY18XpgXnhnK09rV
         CS5w==
X-Gm-Message-State: AOAM531cqmAC0alWM1VHLSv6aopn4Agtkjlx8N9TXdqmF2MWYIc3m+2M
        xlH95YP7a1eVkJacolMctL+NLg==
X-Google-Smtp-Source: ABdhPJxNL0HmrZEF64QBIVal5bHA0uVkHG4CJJw2wQ9AGYci7cB2/8DMZKyZaTpTC03b00pgNzaRQQ==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr2717847wru.173.1602839391080;
        Fri, 16 Oct 2020 02:09:51 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id n3sm1999931wmn.28.2020.10.16.02.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:09:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][RFC PATCH] bindings: cxx: demote the line's parent chip reference to a weak_ptr
Date:   Fri, 16 Oct 2020 11:09:49 +0200
Message-Id: <20201016090949.24456-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently the line object has the power to control the parent chip's
lifetime because it stores a hard reference (in the form of a shared
pointer) to the underlying struct gpiod_chip. This is wrong from the
relationship point-of-view - the chip should control the exposed lines,
not the other way around.

Demote the parent reference to a weak_ptr. Introduce a sub-class that
allows line and line_bulk objects to lock the chip by temporarily
converting this weak_ptr to a full shared_ptr - this way we don't risk
dropping the last reference to the parent chip when the line is calling
the underlying library functions. Chip deleted during that time will
expire right after the concerned line method returns.

This requires an API change - the global find_line() function now
returns a <line, chip> pair so that the caller gets the chance to grab
the chip's reference.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Hi Helmut!

Please take a look at the following proposition of modifying the
relationship between chips and lines in C++ bindings. This is a follow-up
to our discussion under your suggestion for using time_point for
timestamps.

Bartosz

 bindings/cxx/chip.cpp                 |  6 ++++
 bindings/cxx/examples/gpiofindcxx.cpp |  6 ++--
 bindings/cxx/gpiod.hpp                | 31 +++++++++++++++++----
 bindings/cxx/iter.cpp                 |  2 +-
 bindings/cxx/line.cpp                 | 40 +++++++++++++++++++++------
 bindings/cxx/line_bulk.cpp            |  9 ++++++
 bindings/cxx/tests/tests-line.cpp     | 12 ++++----
 7 files changed, 81 insertions(+), 25 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 54c85da..1fc0723 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -69,6 +69,12 @@ chip::chip(::gpiod_chip* chip)
 
 }
 
+chip::chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr)
+	: _m_chip(chip_ptr)
+{
+
+}
+
 void chip::open(const ::std::string& device, int how)
 {
 	auto func = open_funcs.at(how);
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index 08fb62c..aeba29d 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -19,11 +19,11 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	::gpiod::line line = ::gpiod::find_line(argv[1]);
-	if (!line)
+	auto ret = ::gpiod::find_line(argv[1]);
+	if (!ret.first)
 		return EXIT_FAILURE;
 
-	::std::cout << line.get_chip().name() << " " << line.offset() << ::std::endl;
+	::std::cout << ret.second.name() << " " << ret.first.offset() << ::std::endl;
 
 	return EXIT_SUCCESS;
 }
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 8dfc172..50cdf7f 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -199,11 +199,13 @@ public:
 private:
 
 	chip(::gpiod_chip* chip);
+	chip(const ::std::weak_ptr<::gpiod_chip>& chip_ptr);
 
 	void throw_if_noref(void) const;
 
 	::std::shared_ptr<::gpiod_chip> _m_chip;
 
+	friend line;
 	friend chip_iter;
 	friend line_iter;
 };
@@ -438,10 +440,10 @@ public:
 	GPIOD_API int event_get_fd(void) const;
 
 	/**
-	 * @brief Get the reference to the parent chip.
-	 * @return Reference to the parent chip object.
+	 * @brief Get the parent chip.
+	 * @return Parent chip of this line.
 	 */
-	GPIOD_API const chip& get_chip(void) const;
+	GPIOD_API const chip get_chip(void) const;
 
 	/**
 	 * @brief Re-read the line info from the kernel.
@@ -526,7 +528,22 @@ private:
 	line_event make_line_event(const ::gpiod_line_event& event) const noexcept;
 
 	::gpiod_line* _m_line;
-	chip _m_chip;
+	::std::weak_ptr<::gpiod_chip> _m_owner;
+
+	class chip_locker
+	{
+	public:
+		chip_locker(const line& line);
+		~chip_locker(void) = default;
+
+		chip_locker(const chip_locker& other) = delete;
+		chip_locker(chip_locker&& other) = delete;
+		chip_locker& operator=(const chip_locker&& other) = delete;
+		chip_locker& operator=(chip_locker&& other) = delete;
+
+	private:
+		::std::shared_ptr<::gpiod_chip> _m_chip;
+	};
 
 	friend chip;
 	friend line_bulk;
@@ -536,9 +553,11 @@ private:
 /**
  * @brief Find a GPIO line by name. Search all GPIO chips present on the system.
  * @param name Name of the line.
- * @return Returns a line object - empty if the line was not found.
+ * @return Returns a <line, chip> pair where line is the line with given name
+ *         and chip is the line's owner. Both objects are empty if the line was
+ *         not found.
  */
-GPIOD_API line find_line(const ::std::string& name);
+GPIOD_API ::std::pair<line, chip> find_line(const ::std::string& name);
 
 /**
  * @brief Describes a single GPIO line event.
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
index b1acc8c..7985910 100644
--- a/bindings/cxx/iter.cpp
+++ b/bindings/cxx/iter.cpp
@@ -115,7 +115,7 @@ line_iter& line_iter::operator++(void)
 {
 	::gpiod_line* next = ::gpiod_line_iter_next(this->_m_iter.get());
 
-	this->_m_current = next ? line(next, this->_m_current._m_chip) : line();
+	this->_m_current = next ? line(next, this->_m_current._m_owner) : line();
 
 	return *this;
 }
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 52084bf..1ee4459 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -24,14 +24,14 @@ const ::std::map<int, int> bias_mapping = {
 
 line::line(void)
 	: _m_line(nullptr),
-	  _m_chip()
+	  _m_owner()
 {
 
 }
 
 line::line(::gpiod_line* line, const chip& owner)
 	: _m_line(line),
-	  _m_chip(owner)
+	  _m_owner(owner._m_chip)
 {
 
 }
@@ -39,6 +39,7 @@ line::line(::gpiod_line* line, const chip& owner)
 unsigned int line::offset(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	return ::gpiod_line_offset(this->_m_line);
 }
@@ -46,6 +47,7 @@ unsigned int line::offset(void) const
 ::std::string line::name(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	const char* name = ::gpiod_line_name(this->_m_line);
 
@@ -55,6 +57,7 @@ unsigned int line::offset(void) const
 ::std::string line::consumer(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	const char* consumer = ::gpiod_line_consumer(this->_m_line);
 
@@ -64,6 +67,7 @@ unsigned int line::offset(void) const
 int line::direction(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	int dir = ::gpiod_line_direction(this->_m_line);
 
@@ -73,6 +77,7 @@ int line::direction(void) const
 int line::active_state(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	int active = ::gpiod_line_active_state(this->_m_line);
 
@@ -82,6 +87,7 @@ int line::active_state(void) const
 int line::bias(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	return bias_mapping.at(::gpiod_line_bias(this->_m_line));
 }
@@ -89,6 +95,7 @@ int line::bias(void) const
 bool line::is_used(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	return ::gpiod_line_is_used(this->_m_line);
 }
@@ -96,6 +103,7 @@ bool line::is_used(void) const
 bool line::is_open_drain(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	return ::gpiod_line_is_open_drain(this->_m_line);
 }
@@ -103,6 +111,7 @@ bool line::is_open_drain(void) const
 bool line::is_open_source(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	return ::gpiod_line_is_open_source(this->_m_line);
 }
@@ -128,6 +137,7 @@ void line::release(void) const
 bool line::is_requested(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	return ::gpiod_line_is_requested(this->_m_line);
 }
@@ -227,6 +237,7 @@ line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
 line_event line::event_read(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	::gpiod_line_event event_buf;
 	line_event event;
@@ -243,6 +254,7 @@ line_event line::event_read(void) const
 ::std::vector<line_event> line::event_read_multiple(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	/* 16 is the maximum number of events stored in the kernel FIFO. */
 	::std::array<::gpiod_line_event, 16> event_buf;
@@ -265,6 +277,7 @@ line_event line::event_read(void) const
 int line::event_get_fd(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	int ret = ::gpiod_line_event_get_fd(this->_m_line);
 
@@ -275,14 +288,15 @@ int line::event_get_fd(void) const
 	return ret;
 }
 
-const chip& line::get_chip(void) const
+const chip line::get_chip(void) const
 {
-	return this->_m_chip;
+	return chip(this->_m_owner);
 }
 
 void line::update(void) const
 {
 	this->throw_if_null();
+	line::chip_locker lock_chip(*this);
 
 	int ret = ::gpiod_line_update(this->_m_line);
 
@@ -294,7 +308,7 @@ void line::update(void) const
 void line::reset(void)
 {
 	this->_m_line = nullptr;
-	this->_m_chip.reset();
+	this->_m_owner.reset();
 }
 
 bool line::operator==(const line& rhs) const noexcept
@@ -323,14 +337,22 @@ void line::throw_if_null(void) const
 		throw ::std::logic_error("object not holding a GPIO line handle");
 }
 
-line find_line(const ::std::string& name)
+line::chip_locker::chip_locker(const line& line)
+	: _m_chip(line._m_owner)
 {
-	line ret;
+	
+}
+
+::std::pair<line, chip> find_line(const ::std::string& name)
+{
+	::std::pair<line, chip> ret;
 
 	for (auto& it: make_chip_iter()) {
-		ret = it.find_line(name);
-		if (ret)
+		ret.first = it.find_line(name);
+		if (ret.first) {
+			ret.second = it;
 			break;
+		}
 	}
 
 	return ret;
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index e77baa2..78615a1 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -101,6 +101,7 @@ void line_bulk::clear(void)
 void line_bulk::request(const line_request& config, const ::std::vector<int> default_vals) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	if (!default_vals.empty() && this->size() != default_vals.size())
 		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
@@ -131,6 +132,7 @@ void line_bulk::request(const line_request& config, const ::std::vector<int> def
 void line_bulk::release(void) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	::gpiod_line_bulk bulk;
 
@@ -142,6 +144,7 @@ void line_bulk::release(void) const
 ::std::vector<int> line_bulk::get_values(void) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	::std::vector<int> values;
 	::gpiod_line_bulk bulk;
@@ -161,6 +164,7 @@ void line_bulk::release(void) const
 void line_bulk::set_values(const ::std::vector<int>& values) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	if (values.size() != this->_m_bulk.size())
 		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
@@ -180,6 +184,7 @@ void line_bulk::set_config(int direction, ::std::bitset<32> flags,
 			   const ::std::vector<int> values) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	if (!values.empty() && this->_m_bulk.size() != values.size())
 		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
@@ -206,6 +211,7 @@ void line_bulk::set_config(int direction, ::std::bitset<32> flags,
 void line_bulk::set_flags(::std::bitset<32> flags) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	::gpiod_line_bulk bulk;
 	int rv, gflags;
@@ -228,6 +234,7 @@ void line_bulk::set_flags(::std::bitset<32> flags) const
 void line_bulk::set_direction_input() const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	::gpiod_line_bulk bulk;
 	int rv;
@@ -243,6 +250,7 @@ void line_bulk::set_direction_input() const
 void line_bulk::set_direction_output(const ::std::vector<int>& values) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	if (values.size() != this->_m_bulk.size())
 		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
@@ -262,6 +270,7 @@ void line_bulk::set_direction_output(const ::std::vector<int>& values) const
 line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->throw_if_empty();
+	line::chip_locker lock_chip(this->_m_bulk.front());
 
 	::gpiod_line_bulk bulk, event_bulk;
 	::timespec ts;
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index e2e4cbc..9841bea 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -24,16 +24,16 @@ TEST_CASE("Global find_line() function works", "[line]")
 
 	SECTION("line found")
 	{
-		auto line = ::gpiod::find_line("gpio-mockup-C-5");
-		REQUIRE(line.offset() == 5);
-		REQUIRE(line.name() == "gpio-mockup-C-5");
-		REQUIRE(line.get_chip().label() == "gpio-mockup-C");
+		auto ret = ::gpiod::find_line("gpio-mockup-C-5");
+		REQUIRE(ret.first.offset() == 5);
+		REQUIRE(ret.first.name() == "gpio-mockup-C-5");
+		REQUIRE(ret.second.label() == "gpio-mockup-C");
 	}
 
 	SECTION("line not found")
 	{
-		auto line = ::gpiod::find_line("nonexistent-line");
-		REQUIRE_FALSE(line);
+		auto ret = ::gpiod::find_line("nonexistent-line");
+		REQUIRE_FALSE(ret.first);
 	}
 }
 
-- 
2.28.0

