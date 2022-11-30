Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F290063D5CD
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiK3Mmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbiK3Mmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:49 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FB319C12
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:39 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id r133-20020a1c448b000000b003d076ee89d6so273499wma.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkYEHBQpt1i7fAMZ3ERUqlriHgqzZWw9jVWMN7Pb0KE=;
        b=kF5OGSe+t7NSiQHkj9kh94UL6V3+eIBHxllpYHoAAXRwKPXwIUIr7rtZKs16/rb/Cv
         KpjalpTgVBQBlKm9rkTY3N/LVzdjVKls4Veel1HReeLUvSXMfKIMngPa4S9rlp5Biq47
         nBX3IINS13O9O1g1Xj8l8eMWnxpYy75LRT+Rm6KBcjKMZx5V+MDf8nA0141u7FhBdQRE
         F2e0HIByuVIvOnqPshrgNAvxd8tmuM9yqgvpcafhG8xz7+ILwYnDHIK/GUxczeeuoSxX
         D0KENT1BaoPedSb1IZ7POYmhojag/kLrY5OGaHyNuwoA8+u0ydCu10+QJrXPqPt5a3+o
         ruNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkYEHBQpt1i7fAMZ3ERUqlriHgqzZWw9jVWMN7Pb0KE=;
        b=d0gEl3I6VwSPvVZKatSnYF2CnEf7OdRG4MkZ9UEU9rw9dB29maEGtnMfJTYbuGzAY6
         ALsfgrSKdaK3FZqHtvhUnL74MX9BQHBlaAf1Cu9X5I69EiXzKzEahqsa+4totKsojOdg
         KQ4R65KeMt4kZuj2TMJKb+9gENX9AYw7YuwiCHFImR+Pi3XwCnIJbMJKZ8a/mV8NOoEh
         kh6gzGpnvfsR+lsABix1bLnuN+UHniGs58nM6WLwQE4wzhdSLOs9pFFrZzCK8mNroXMa
         OW3afUe3B8HXqCzG+pfqeigow+UqRADadwveilgA29uTg/UOB6mVs7dZOUJqKJF9WWqU
         cdgg==
X-Gm-Message-State: ANoB5pnB92nKLQdISebW1uuoD/VUlZuaeWfwxXUa6ul9yt3LWyblEP0f
        k5+E+y1mWx9msjrk2IQ0V/xBAA==
X-Google-Smtp-Source: AA0mqf6spmGAa8N715xxK5XJTW8NaDRRq1lbHGGbU4exm87zRYY9N6bb8cD38A7PMBGh3z7O3LEcag==
X-Received: by 2002:a05:600c:6888:b0:3d0:57ea:318f with SMTP id fn8-20020a05600c688800b003d057ea318fmr11747004wmb.69.1669812157854;
        Wed, 30 Nov 2022 04:42:37 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:37 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 03/11] treewide: use plural 'events' in read_edge_event() functions
Date:   Wed, 30 Nov 2022 13:42:23 +0100
Message-Id: <20221130124231.1054001-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The read_edge_event() family of functions should actually be called
read_edge_events() as they universally allow to read more than one
event. We're converting wait_edge_event() too for consistency.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/edge-event-buffer.cpp            |  2 +-
 bindings/cxx/examples/gpiomoncxx.cpp          |  2 +-
 bindings/cxx/gpiodcxx/line-request.hpp        |  6 +-
 bindings/cxx/line-request.cpp                 | 10 ++--
 bindings/cxx/tests/tests-edge-event.cpp       | 56 +++++++++----------
 bindings/python/examples/gpiomon.py           |  2 +-
 bindings/python/gpiod/ext/request.c           |  8 +--
 bindings/python/gpiod/line_request.py         |  6 +-
 bindings/python/tests/tests_edge_event.py     | 38 ++++++-------
 .../rust/libgpiod/examples/gpio_events.rs     |  2 +-
 bindings/rust/libgpiod/examples/gpiomon.rs    |  2 +-
 bindings/rust/libgpiod/src/event_buffer.rs    |  2 +-
 bindings/rust/libgpiod/src/line_request.rs    |  4 +-
 bindings/rust/libgpiod/tests/edge_event.rs    | 24 ++++----
 bindings/rust/libgpiod/tests/line_request.rs  |  2 +-
 include/gpiod.h                               | 10 ++--
 lib/line-request.c                            | 10 ++--
 tests/tests-edge-event.c                      | 46 +++++++--------
 tools/gpiomon.c                               |  2 +-
 19 files changed, 117 insertions(+), 117 deletions(-)

diff --git a/bindings/cxx/edge-event-buffer.cpp b/bindings/cxx/edge-event-buffer.cpp
index ff398f1..3c551df 100644
--- a/bindings/cxx/edge-event-buffer.cpp
+++ b/bindings/cxx/edge-event-buffer.cpp
@@ -36,7 +36,7 @@ edge_event_buffer::impl::impl(unsigned int capacity)
 
 int edge_event_buffer::impl::read_events(const line_request_ptr& request, unsigned int max_events)
 {
-	int ret = ::gpiod_line_request_read_edge_event(request.get(),
+	int ret = ::gpiod_line_request_read_edge_events(request.get(),
 						       this->buffer.get(), max_events);
 	if (ret < 0)
 		throw_from_errno("error reading edge events from file descriptor");
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
index c351567..4f765ba 100644
--- a/bindings/cxx/examples/gpiomoncxx.cpp
+++ b/bindings/cxx/examples/gpiomoncxx.cpp
@@ -56,7 +56,7 @@ int main(int argc, char **argv)
 	::gpiod::edge_event_buffer buffer;
 
 	for (;;) {
-		request.read_edge_event(buffer);
+		request.read_edge_events(buffer);
 
 		for (const auto& event: buffer)
 			print_event(event);
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index 659251b..f9f0322 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -180,7 +180,7 @@ public:
 	 * @return True if at least one event is ready to be read. False if the
 	 *         wait timed out.
 	 */
-	bool wait_edge_event(const ::std::chrono::nanoseconds& timeout) const;
+	bool wait_edge_events(const ::std::chrono::nanoseconds& timeout) const;
 
 	/**
 	 * @brief Read a number of edge events from this request up to the
@@ -188,7 +188,7 @@ public:
 	 * @param buffer Edge event buffer to read events into.
 	 * @return Number of events read.
 	 */
-	::std::size_t read_edge_event(edge_event_buffer& buffer);
+	::std::size_t read_edge_events(edge_event_buffer& buffer);
 
 	/**
 	 * @brief Read a number of edge events from this request.
@@ -197,7 +197,7 @@ public:
 	 *                   capacity of the buffer.
 	 * @return Number of events read.
 	 */
-	::std::size_t read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events);
+	::std::size_t read_edge_events(edge_event_buffer& buffer, ::std::size_t max_events);
 
 private:
 
diff --git a/bindings/cxx/line-request.cpp b/bindings/cxx/line-request.cpp
index be0bac5..34c5850 100644
--- a/bindings/cxx/line-request.cpp
+++ b/bindings/cxx/line-request.cpp
@@ -192,11 +192,11 @@ GPIOD_CXX_API int line_request::fd() const
 	return ::gpiod_line_request_get_fd(this->_m_priv->request.get());
 }
 
-GPIOD_CXX_API bool line_request::wait_edge_event(const ::std::chrono::nanoseconds& timeout) const
+GPIOD_CXX_API bool line_request::wait_edge_events(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->_m_priv->throw_if_released();
 
-	int ret = ::gpiod_line_request_wait_edge_event(this->_m_priv->request.get(),
+	int ret = ::gpiod_line_request_wait_edge_events(this->_m_priv->request.get(),
 						       timeout.count());
 	if (ret < 0)
 		throw_from_errno("error waiting for edge events");
@@ -204,13 +204,13 @@ GPIOD_CXX_API bool line_request::wait_edge_event(const ::std::chrono::nanosecond
 	return ret;
 }
 
-GPIOD_CXX_API ::std::size_t line_request::read_edge_event(edge_event_buffer& buffer)
+GPIOD_CXX_API ::std::size_t line_request::read_edge_events(edge_event_buffer& buffer)
 {
-	return this->read_edge_event(buffer, buffer.capacity());
+	return this->read_edge_events(buffer, buffer.capacity());
 }
 
 GPIOD_CXX_API ::std::size_t
-line_request::read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events)
+line_request::read_edge_events(edge_event_buffer& buffer, ::std::size_t max_events)
 {
 	this->_m_priv->throw_if_released();
 
diff --git a/bindings/cxx/tests/tests-edge-event.cpp b/bindings/cxx/tests/tests-edge-event.cpp
index ca42c42..19a6ab3 100644
--- a/bindings/cxx/tests/tests-edge-event.cpp
+++ b/bindings/cxx/tests/tests-edge-event.cpp
@@ -51,7 +51,7 @@ TEST_CASE("edge_event wait timeout", "[edge-event]")
 		)
 		.do_request();
 
-	REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+	REQUIRE_FALSE(request.wait_edge_events(::std::chrono::milliseconds(100)));
 }
 
 TEST_CASE("output mode and edge detection don't work together", "[edge-event]")
@@ -113,23 +113,23 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 2);
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer, 1) == 1);
 		REQUIRE(buffer.num_events() == 1);
 		auto event = buffer.get_event(0);
 		REQUIRE(event.type() == event_type::RISING_EDGE);
 		REQUIRE(event.line_offset() == 2);
 		ts_rising = event.timestamp_ns();
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer, 1) == 1);
 		REQUIRE(buffer.num_events() == 1);
 		event = buffer.get_event(0);
 		REQUIRE(event.type() == event_type::FALLING_EDGE);
 		REQUIRE(event.line_offset() == 2);
 		ts_falling = event.timestamp_ns();
 
-		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+		REQUIRE_FALSE(request.wait_edge_events(::std::chrono::milliseconds(100)));
 
 		thread.join();
 
@@ -149,14 +149,14 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 6);
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer, 1) == 1);
 		REQUIRE(buffer.num_events() == 1);
 		auto event = buffer.get_event(0);
 		REQUIRE(event.type() == event_type::RISING_EDGE);
 		REQUIRE(event.line_offset() == 6);
 
-		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+		REQUIRE_FALSE(request.wait_edge_events(::std::chrono::milliseconds(100)));
 
 		thread.join();
 	}
@@ -174,14 +174,14 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 		::std::thread thread(trigger_falling_and_rising_edge, ::std::ref(sim), 7);
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer, 1) == 1);
 		REQUIRE(buffer.num_events() == 1);
 		auto event = buffer.get_event(0);
 		REQUIRE(event.type() == event_type::FALLING_EDGE);
 		REQUIRE(event.line_offset() == 7);
 
-		REQUIRE_FALSE(request.wait_edge_event(::std::chrono::milliseconds(100)));
+		REQUIRE_FALSE(request.wait_edge_events(::std::chrono::milliseconds(100)));
 
 		thread.join();
 	}
@@ -199,8 +199,8 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 
 		::std::thread thread(trigger_rising_edge_events_on_two_offsets, ::std::ref(sim), 0, 1);
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer, 1) == 1);
 		REQUIRE(buffer.num_events() == 1);
 		auto event = buffer.get_event(0);
 		REQUIRE(event.type() == event_type::RISING_EDGE);
@@ -208,8 +208,8 @@ TEST_CASE("waiting for and reading edge events works", "[edge-event]")
 		REQUIRE(event.global_seqno() == 1);
 		REQUIRE(event.line_seqno() == 1);
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer, 1) == 1);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer, 1) == 1);
 		REQUIRE(buffer.num_events() == 1);
 		event = buffer.get_event(0);
 		REQUIRE(event.type() == event_type::RISING_EDGE);
@@ -251,8 +251,8 @@ TEST_CASE("reading multiple events", "[edge-event]")
 	{
 		::gpiod::edge_event_buffer buffer;
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer) == 3);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer) == 3);
 		REQUIRE(buffer.num_events() == 3);
 
 		for (const auto& event: buffer) {
@@ -266,8 +266,8 @@ TEST_CASE("reading multiple events", "[edge-event]")
 	{
 		::gpiod::edge_event_buffer buffer(2);
 
-		REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-		REQUIRE(request.read_edge_event(buffer) == 2);
+		REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+		REQUIRE(request.read_edge_events(buffer) == 2);
 		REQUIRE(buffer.num_events() == 2);
 	}
 }
@@ -300,8 +300,8 @@ TEST_CASE("edge_event_buffer can be moved", "[edge-event]")
 
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(500));
 
-	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-	REQUIRE(request.read_edge_event(buffer) == 3);
+	REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_events(buffer) == 3);
 
 	SECTION("move constructor works")
 	{
@@ -337,14 +337,14 @@ TEST_CASE("edge_event can be copied and moved", "[edge-event]")
 
 	sim.set_pull(0, pull::PULL_UP);
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
-	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-	REQUIRE(request.read_edge_event(buffer) == 1);
+	REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_events(buffer) == 1);
 	auto event = buffer.get_event(0);
 
 	sim.set_pull(0, pull::PULL_DOWN);
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(10));
-	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-	REQUIRE(request.read_edge_event(buffer) == 1);
+	REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_events(buffer) == 1);
 	auto copy = buffer.get_event(0);
 
 	SECTION("copy constructor works")
@@ -406,8 +406,8 @@ TEST_CASE("stream insertion operators work for edge_event and edge_event_buffer"
 	sim.set_pull(0, pull::PULL_DOWN);
 	::std::this_thread::sleep_for(::std::chrono::milliseconds(30));
 
-	REQUIRE(request.wait_edge_event(::std::chrono::seconds(1)));
-	REQUIRE(request.read_edge_event(buffer) == 2);
+	REQUIRE(request.wait_edge_events(::std::chrono::seconds(1)));
+	REQUIRE(request.read_edge_events(buffer) == 2);
 
 	sbuf << buffer;
 
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
index 58d47a5..702d7c8 100755
--- a/bindings/python/examples/gpiomon.py
+++ b/bindings/python/examples/gpiomon.py
@@ -22,5 +22,5 @@ if __name__ == "__main__":
         config={tuple(lines): gpiod.LineSettings(edge_detection=Edge.BOTH)},
     ) as request:
         while True:
-            for event in request.read_edge_event():
+            for event in request.read_edge_events():
                 print(event)
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 62378f5..d3e1448 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -249,7 +249,7 @@ static PyObject *request_reconfigure_lines(request_object *self, PyObject *args)
 	Py_RETURN_NONE;
 }
 
-static PyObject *request_read_edge_event(request_object *self, PyObject *args)
+static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 {
 	PyObject *max_events_obj, *event_obj, *events, *type;
 	size_t max_events, num_events, i;
@@ -273,7 +273,7 @@ static PyObject *request_read_edge_event(request_object *self, PyObject *args)
 		return NULL;
 
 	Py_BEGIN_ALLOW_THREADS;
-	ret = gpiod_line_request_read_edge_event(self->request,
+	ret = gpiod_line_request_read_edge_events(self->request,
 						 self->buffer, max_events);
 	Py_END_ALLOW_THREADS;
 	if (ret < 0)
@@ -336,8 +336,8 @@ static PyMethodDef request_methods[] = {
 		.ml_flags = METH_VARARGS,
 	},
 	{
-		.ml_name = "read_edge_event",
-		.ml_meth = (PyCFunction)request_read_edge_event,
+		.ml_name = "read_edge_events",
+		.ml_meth = (PyCFunction)request_read_edge_events,
 		.ml_flags = METH_VARARGS,
 	},
 	{ }
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 1796069..a0f97b7 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -169,7 +169,7 @@ class LineRequest:
 
         self._req.reconfigure_lines(line_cfg)
 
-    def wait_edge_event(
+    def wait_edge_events(
         self, timeout: Optional[Union[timedelta, float]] = None
     ) -> bool:
         """
@@ -187,7 +187,7 @@ class LineRequest:
 
         return poll_fd(self.fd, timeout)
 
-    def read_edge_event(self, max_events: Optional[int] = None) -> list[EdgeEvent]:
+    def read_edge_events(self, max_events: Optional[int] = None) -> list[EdgeEvent]:
         """
         Read a number of edge events from a line request.
 
@@ -200,7 +200,7 @@ class LineRequest:
         """
         self._check_released()
 
-        return self._req.read_edge_event(max_events)
+        return self._req.read_edge_events(max_events)
 
     def __str__(self):
         """
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index c443772..430b27d 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -23,7 +23,7 @@ class EdgeEventWaitTimeout(TestCase):
             sim.dev_path,
             {0: gpiod.LineSettings(edge_detection=Edge.BOTH)},
         ) as req:
-            self.assertEqual(req.wait_edge_event(timedelta(microseconds=10000)), False)
+            self.assertEqual(req.wait_edge_events(timedelta(microseconds=10000)), False)
 
     def test_event_wait_timeout_float(self):
         sim = gpiosim.Chip()
@@ -32,7 +32,7 @@ class EdgeEventWaitTimeout(TestCase):
             sim.dev_path,
             {0: gpiod.LineSettings(edge_detection=Edge.BOTH)},
         ) as req:
-            self.assertEqual(req.wait_edge_event(0.01), False)
+            self.assertEqual(req.wait_edge_events(0.01), False)
 
 
 class EdgeEventInvalidConfig(TestCase):
@@ -82,16 +82,16 @@ class WaitingForEdgeEvents(TestCase):
             )
             self.thread.start()
 
-            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
-            events = req.read_edge_event()
+            self.assertTrue(req.wait_edge_events(timedelta(seconds=1)))
+            events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
             self.assertEqual(event.event_type, EventType.RISING_EDGE)
             self.assertEqual(event.line_offset, 2)
             ts_rising = event.timestamp_ns
 
-            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
-            events = req.read_edge_event()
+            self.assertTrue(req.wait_edge_events(timedelta(seconds=1)))
+            events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
             self.assertEqual(event.event_type, EventType.FALLING_EDGE)
@@ -109,14 +109,14 @@ class WaitingForEdgeEvents(TestCase):
             )
             self.thread.start()
 
-            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
-            events = req.read_edge_event()
+            self.assertTrue(req.wait_edge_events(timedelta(seconds=1)))
+            events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
             self.assertEqual(event.event_type, EventType.RISING_EDGE)
             self.assertEqual(event.line_offset, 6)
 
-            self.assertFalse(req.wait_edge_event(timedelta(microseconds=10000)))
+            self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
     def test_rising_edge_event(self):
         with gpiod.request_lines(
@@ -127,14 +127,14 @@ class WaitingForEdgeEvents(TestCase):
             )
             self.thread.start()
 
-            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
-            events = req.read_edge_event()
+            self.assertTrue(req.wait_edge_events(timedelta(seconds=1)))
+            events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
             self.assertEqual(event.event_type, EventType.FALLING_EDGE)
             self.assertEqual(event.line_offset, 6)
 
-            self.assertFalse(req.wait_edge_event(timedelta(microseconds=10000)))
+            self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
     def test_sequence_numbers(self):
         with gpiod.request_lines(
@@ -145,8 +145,8 @@ class WaitingForEdgeEvents(TestCase):
             )
             self.thread.start()
 
-            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
-            events = req.read_edge_event()
+            self.assertTrue(req.wait_edge_events(timedelta(seconds=1)))
+            events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
             self.assertEqual(event.event_type, EventType.RISING_EDGE)
@@ -154,8 +154,8 @@ class WaitingForEdgeEvents(TestCase):
             self.assertEqual(event.global_seqno, 1)
             self.assertEqual(event.line_seqno, 1)
 
-            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
-            events = req.read_edge_event()
+            self.assertTrue(req.wait_edge_events(timedelta(seconds=1)))
+            events = req.read_edge_events()
             self.assertEqual(len(events), 1)
             event = events[0]
             self.assertEqual(event.event_type, EventType.RISING_EDGE)
@@ -185,8 +185,8 @@ class ReadingMultipleEdgeEvents(TestCase):
         del self.sim
 
     def test_read_multiple_events(self):
-        self.assertTrue(self.request.wait_edge_event(timedelta(seconds=1)))
-        events = self.request.read_edge_event()
+        self.assertTrue(self.request.wait_edge_events(timedelta(seconds=1)))
+        events = self.request.read_edge_events()
         self.assertEqual(len(events), 3)
 
         for event in events:
@@ -205,7 +205,7 @@ class EdgeEventStringRepresentation(TestCase):
             path=sim.dev_path, config={0: gpiod.LineSettings(edge_detection=Edge.BOTH)}
         ) as req:
             sim.set_pull(0, Pull.UP)
-            event = req.read_edge_event()[0]
+            event = req.read_edge_events()[0]
             self.assertRegex(
                 str(event),
                 "<EdgeEvent type=Type\.RISING_EDGE timestamp_ns=[0-9]+ line_offset=0 global_seqno=1 line_seqno=1>",
diff --git a/bindings/rust/libgpiod/examples/gpio_events.rs b/bindings/rust/libgpiod/examples/gpio_events.rs
index 9810050..04267d9 100644
--- a/bindings/rust/libgpiod/examples/gpio_events.rs
+++ b/bindings/rust/libgpiod/examples/gpio_events.rs
@@ -45,7 +45,7 @@ fn main() -> Result<()> {
     let request = chip.request_lines(&rconfig, &lconfig)?;
 
     loop {
-        match request.wait_edge_event(None) {
+        match request.wait_edge_events(None) {
             Err(x) => {
                 println!("{:?}", x);
                 return Err(Error::InvalidArguments);
diff --git a/bindings/rust/libgpiod/examples/gpiomon.rs b/bindings/rust/libgpiod/examples/gpiomon.rs
index c38652c..f17a81f 100644
--- a/bindings/rust/libgpiod/examples/gpiomon.rs
+++ b/bindings/rust/libgpiod/examples/gpiomon.rs
@@ -44,7 +44,7 @@ fn main() -> Result<()> {
     let request = chip.request_lines(&rconfig, &lconfig)?;
 
     loop {
-        match request.wait_edge_event(None) {
+        match request.wait_edge_events(None) {
             Err(x) => {
                 println!("{:?}", x);
                 return Err(Error::InvalidArguments);
diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index b56be9a..5a72ddb 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -106,7 +106,7 @@ impl Buffer {
 
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
         let ret = unsafe {
-            gpiod::gpiod_line_request_read_edge_event(
+            gpiod::gpiod_line_request_read_edge_events(
                 request.request,
                 self.buffer,
                 self.events.len().try_into().unwrap(),
diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
index 3215ab8..c16ec9f 100644
--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -178,7 +178,7 @@ impl Request {
     }
 
     /// Wait for edge events on any of the lines associated with the request.
-    pub fn wait_edge_event(&self, timeout: Option<Duration>) -> Result<bool> {
+    pub fn wait_edge_events(&self, timeout: Option<Duration>) -> Result<bool> {
         let timeout = match timeout {
             Some(x) => x.as_nanos() as i64,
             // Block indefinitely
@@ -186,7 +186,7 @@ impl Request {
         };
 
         // SAFETY: `gpiod_line_request` is guaranteed to be valid here.
-        let ret = unsafe { gpiod::gpiod_line_request_wait_edge_event(self.request, timeout) };
+        let ret = unsafe { gpiod::gpiod_line_request_wait_edge_events(self.request, timeout) };
 
         match ret {
             -1 => Err(Error::OperationFailed(
diff --git a/bindings/rust/libgpiod/tests/edge_event.rs b/bindings/rust/libgpiod/tests/edge_event.rs
index 571e574..45c1cfc 100644
--- a/bindings/rust/libgpiod/tests/edge_event.rs
+++ b/bindings/rust/libgpiod/tests/edge_event.rs
@@ -89,7 +89,7 @@ mod edge_event {
             // Rising event
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
@@ -103,7 +103,7 @@ mod edge_event {
             // Falling event
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
@@ -117,7 +117,7 @@ mod edge_event {
             // No events available
             assert!(!config
                 .request()
-                .wait_edge_event(Some(Duration::from_millis(100)))
+                .wait_edge_events(Some(Duration::from_millis(100)))
                 .unwrap());
 
             assert!(ts_falling > ts_rising);
@@ -138,7 +138,7 @@ mod edge_event {
             // Rising event
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
@@ -151,7 +151,7 @@ mod edge_event {
             // No events available
             assert!(!config
                 .request()
-                .wait_edge_event(Some(Duration::from_millis(100)))
+                .wait_edge_events(Some(Duration::from_millis(100)))
                 .unwrap());
         }
 
@@ -170,7 +170,7 @@ mod edge_event {
             // Falling event
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
@@ -183,7 +183,7 @@ mod edge_event {
             // No events available
             assert!(!config
                 .request()
-                .wait_edge_event(Some(Duration::from_millis(100)))
+                .wait_edge_events(Some(Duration::from_millis(100)))
                 .unwrap());
         }
 
@@ -202,7 +202,7 @@ mod edge_event {
             let mut buf = request::Buffer::new(0).unwrap();
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
@@ -217,7 +217,7 @@ mod edge_event {
             // Rising event GPIO 1
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let mut events = config.request().read_edge_events(&mut buf).unwrap();
@@ -232,7 +232,7 @@ mod edge_event {
             // No events available
             assert!(!config
                 .request()
-                .wait_edge_event(Some(Duration::from_millis(100)))
+                .wait_edge_events(Some(Duration::from_millis(100)))
                 .unwrap());
         }
 
@@ -251,7 +251,7 @@ mod edge_event {
             // Read multiple events
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let events = config.request().read_edge_events(&mut buf).unwrap();
@@ -287,7 +287,7 @@ mod edge_event {
             // Read multiple events
             assert!(config
                 .request()
-                .wait_edge_event(Some(Duration::from_secs(1)))
+                .wait_edge_events(Some(Duration::from_secs(1)))
                 .unwrap());
 
             let events = config.request().read_edge_events(&mut buf).unwrap();
diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 286cd6c..c3fc37b 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -231,7 +231,7 @@ mod line_request {
             // No events available
             assert!(!config
                 .request()
-                .wait_edge_event(Some(Duration::from_millis(100)))
+                .wait_edge_events(Some(Duration::from_millis(100)))
                 .unwrap());
         }
     }
diff --git a/include/gpiod.h b/include/gpiod.h
index f4bb5f2..fc9d4c0 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1008,8 +1008,8 @@ int gpiod_line_request_get_fd(struct gpiod_line_request *request);
  * Lines must have edge detection set for edge events to be emitted.
  * By default edge detection is disabled.
  */
-int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
-				       int64_t timeout_ns);
+int gpiod_line_request_wait_edge_events(struct gpiod_line_request *request,
+					int64_t timeout_ns);
 
 /**
  * @brief Read a number of edge events from a line request.
@@ -1022,9 +1022,9 @@ int gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
  * @note Any exising events in the buffer are overwritten.  This is not an
  *       append operation.
  */
-int gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
-				       struct gpiod_edge_event_buffer *buffer,
-				       size_t max_events);
+int gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
+					struct gpiod_edge_event_buffer *buffer,
+					size_t max_events);
 
 /**
  * @}
diff --git a/lib/line-request.c b/lib/line-request.c
index 5936593..58dc3c9 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -223,16 +223,16 @@ GPIOD_API int gpiod_line_request_get_fd(struct gpiod_line_request *request)
 }
 
 GPIOD_API int
-gpiod_line_request_wait_edge_event(struct gpiod_line_request *request,
-				   int64_t timeout_ns)
+gpiod_line_request_wait_edge_events(struct gpiod_line_request *request,
+				    int64_t timeout_ns)
 {
 	return gpiod_poll_fd(request->fd, timeout_ns);
 }
 
 GPIOD_API int
-gpiod_line_request_read_edge_event(struct gpiod_line_request *request,
-				   struct gpiod_edge_event_buffer *buffer,
-				   size_t max_events)
+gpiod_line_request_read_edge_events(struct gpiod_line_request *request,
+				    struct gpiod_edge_event_buffer *buffer,
+				    size_t max_events)
 {
 	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
 }
diff --git a/tests/tests-edge-event.c b/tests/tests-edge-event.c
index 5eb275c..b9e29b2 100644
--- a/tests/tests-edge-event.c
+++ b/tests/tests-edge-event.c
@@ -51,7 +51,7 @@ GPIOD_TEST_CASE(edge_event_wait_timeout)
 
 	request = gpiod_test_request_lines_or_fail(chip, NULL, line_cfg);
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000);
 	g_assert_cmpint(ret, ==, 0);
 }
 
@@ -130,11 +130,11 @@ GPIOD_TEST_CASE(read_both_events)
 
 	/* First event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -150,11 +150,11 @@ GPIOD_TEST_CASE(read_both_events)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -207,11 +207,11 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 
 	/* First event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -226,7 +226,7 @@ GPIOD_TEST_CASE(read_rising_edge_event)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000);
 	g_assert_cmpint(ret, ==, 0); /* Time-out. */
 
 	g_thread_join(thread);
@@ -266,11 +266,11 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 
 	/* First event is the second generated. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -285,7 +285,7 @@ GPIOD_TEST_CASE(read_falling_edge_event)
 
 	/* No more events. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000);
 	g_assert_cmpint(ret, ==, 0); /* Time-out. */
 
 	g_thread_join(thread);
@@ -340,7 +340,7 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -355,7 +355,7 @@ GPIOD_TEST_CASE(read_rising_edge_event_polled)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000);
 	g_assert_cmpint(ret, ==, 0); /* Time-out. */
 
 	g_thread_join(thread);
@@ -399,7 +399,7 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 
 	/* First event. */
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -414,7 +414,7 @@ GPIOD_TEST_CASE(read_both_events_blocking)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -478,11 +478,11 @@ GPIOD_TEST_CASE(seqno)
 
 	/* First event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -497,11 +497,11 @@ GPIOD_TEST_CASE(seqno)
 
 	/* Second event. */
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_join_thread_and_return_if_failed(thread);
 
@@ -545,11 +545,11 @@ GPIOD_TEST_CASE(event_copy)
 
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000000000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000000000);
 	g_assert_cmpint(ret, >, 0);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 1);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 1);
 	g_assert_cmpint(ret, ==, 1);
 	gpiod_test_return_if_failed();
 
@@ -603,11 +603,11 @@ GPIOD_TEST_CASE(reading_more_events_than_the_queue_contains_doesnt_block)
 	g_gpiosim_chip_set_pull(sim, 2, G_GPIOSIM_PULL_UP);
 	g_usleep(500);
 
-	ret = gpiod_line_request_read_edge_event(request, buffer, 12);
+	ret = gpiod_line_request_read_edge_events(request, buffer, 12);
 	g_assert_cmpint(ret, ==, 7);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_line_request_wait_edge_event(request, 1000);
+	ret = gpiod_line_request_wait_edge_events(request, 1000);
 	g_assert_cmpint(ret, ==, 0);
 	gpiod_test_return_if_failed();
 }
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index ba457e4..0bc057a 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -451,7 +451,7 @@ int main(int argc, char **argv)
 			if (pollfds[i].revents == 0)
 				continue;
 
-			ret = gpiod_line_request_read_edge_event(requests[i],
+			ret = gpiod_line_request_read_edge_events(requests[i],
 					 event_buffer, EVENT_BUF_SIZE);
 			if (ret < 0)
 				die_perror("error reading line events");
-- 
2.37.2

