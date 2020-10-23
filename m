Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE411296C1E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 11:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461471AbgJWJ2r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 05:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461352AbgJWJ2q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 05:28:46 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDE9C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 02:28:44 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b8so1048233wrn.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5zQ9+d6j7xcv7J86ew41sx8f9E5W0LA8YL5VomhYD/4=;
        b=bU77uxyg1rbwyJzKLEqubDwGyUFmk2NRpw6MiZ53Amb3/CQZEnHQSdAAHfZJIfWPgb
         J4Lo+PAcXNU+SWVfYZn1+/0mfuUhw72d88pc/11ZGKSah3YgpX2TR6pWwSNEBaCx2/pV
         0nGL7hkRVB+F3XizDfqGAyNN/NcK509vvSYYBlr0JjpoGdiqwUrk1sEOV+T2W1/UEGQA
         rdKcJ5ej2Uidvf3hVJhV99Pz95m2yqe2Hy4dsJG2Jl1GAjQeZ4L7ZEBAFX1LkVrblCR6
         2G8lqmTcxLH6UI7GNUgXUltLMFjfmQNsCq53yuyW/KJaLy7jtotKtUYVWw42vfYOJ/TT
         xGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5zQ9+d6j7xcv7J86ew41sx8f9E5W0LA8YL5VomhYD/4=;
        b=dTnLm5FAGHYOa06BMnzDSLkhGORmItLHN2Boz+ftX+IpJ4/nvrrboUQP2GhqG95Fkw
         /FCiKm4mF43Rve3Sw2VZtbCJ1d6s8Pzhf/9jf0KUVkUnomCiG56AHOWjePEPESiLHjxC
         479BKku/izm864eX8g0JVghrkxedYTh7ZGm3C47byBhf3C/viySXDplZByvBB+7vo2eL
         dt8X48tZ0uH1vYRbADzzORe5Wca5s9z2Rrv1fYGJE2fmrYQesNA7YSujNX8g+JCS7U6/
         kC/VkJM2MKAzDGYYI0FqnRb+DBuTEPN7y3DF2gPLqWPs70bvkZLB3mDatxeSlwOY2pRS
         GvLQ==
X-Gm-Message-State: AOAM531OSQeQfzC6FBNHha3rbMHmtygVR49QBPbxLjfahdxrnC5+OSp6
        1u9oRhdKXA/5wyPjIrdsO3XC9Q==
X-Google-Smtp-Source: ABdhPJxY9elDFD1Q+gJ0UwQaOeLTYr+pmzQzz88/ynOSlmZ93HyNcm678JTq4mGRDZXtAkraKvUWFw==
X-Received: by 2002:adf:8b92:: with SMTP id o18mr1658711wra.54.1603445322549;
        Fri, 23 Oct 2020 02:28:42 -0700 (PDT)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f6sm1981083wru.50.2020.10.23.02.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 02:28:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
Date:   Fri, 23 Oct 2020 11:28:31 +0200
Message-Id: <20201023092831.5842-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Current implementation of struct gpiod_line_bulk uses stack memory
excessively. The structure is big: it's an array 64 pointers + 4 bytes
size. That amounts to 260 bytes on 32-bit and 516 bytes on 64-bit
architectures respectively. It's also used everywhere as all functions
dealing with single lines eventually end up calling bulk counterparts.

The rework addresses it by making the bulk structure opaque and
providing appropriate interfaces for library users while retaining a way
for internal users to allocate single line bulks on the stack.

The macro-based loop has been removed. In its place we provide a function
iterating over all lines held by a bulk and calling the provided callback
function for each line as well as a new line bulk iterator which works
similarily to chip and line iterators.

Since bulk operations can now fail, a bunch of test-cases has been added
to cover the relevant code.

While at it: using the word offset both when referring to line's HW
offset in a chip as well as the offset in a bulk leads to confusion.
This patch renames the bulk offset to index.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp        |  18 ++-
 bindings/cxx/line_bulk.cpp    | 112 +++++++++--------
 bindings/python/gpiodmodule.c | 182 +++++++++++++++++++--------
 include/gpiod.h               | 169 +++++++++++++------------
 lib/core.c                    | 178 +++++++++++++++++++--------
 lib/ctxless.c                 |  53 +++++---
 lib/helpers.c                 |  61 +++++----
 lib/iter.c                    |  33 +++++
 tests/Makefile.am             |   1 +
 tests/gpiod-test.h            |   5 +
 tests/tests-bulk.c            | 158 ++++++++++++++++++++++++
 tests/tests-chip.c            |  59 +++++----
 tests/tests-event.c           |  73 +++++++----
 tests/tests-iter.c            |  26 ++++
 tests/tests-line.c            | 225 +++++++++++++---------------------
 15 files changed, 888 insertions(+), 465 deletions(-)
 create mode 100644 tests/tests-bulk.c

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 8dfc172..83f543f 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -626,18 +626,18 @@ public:
 
 	/**
 	 * @brief Get the line at given offset.
-	 * @param offset Offset of the line to get.
+	 * @param index Offset of the line to get.
 	 * @return Reference to the line object.
 	 */
-	GPIOD_API line& get(unsigned int offset);
+	GPIOD_API line& get(unsigned int index);
 
 	/**
 	 * @brief Get the line at given offset without bounds checking.
-	 * @param offset Offset of the line to get.
+	 * @param index Offset of the line to get.
 	 * @return Reference to the line object.
 	 * @note No bounds checking is performed.
 	 */
-	GPIOD_API line& operator[](unsigned int offset);
+	GPIOD_API line& operator[](unsigned int index);
 
 	/**
 	 * @brief Get the number of lines currently held by this object.
@@ -839,8 +839,16 @@ public:
 
 private:
 
+	struct line_bulk_deleter
+	{
+		void operator()(::gpiod_line_bulk *bulk);
+	};
+
 	void throw_if_empty(void) const;
-	void to_line_bulk(::gpiod_line_bulk* bulk) const;
+
+	using line_bulk_ptr = ::std::unique_ptr<::gpiod_line_bulk, line_bulk_deleter>;
+
+	line_bulk_ptr to_line_bulk(void) const;
 
 	::std::vector<line> _m_bulk;
 };
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index e77baa2..e7bd20e 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -46,6 +46,29 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
 	{ line_request::FLAG_BIAS_PULL_UP,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP, },
 };
 
+struct line_bulk_iter_deleter
+{
+	void operator()(::gpiod_line_bulk_iter *iter)
+	{
+		::gpiod_line_bulk_iter_free(iter);
+	}
+};
+
+using line_bulk_iter_ptr = ::std::unique_ptr<::gpiod_line_bulk_iter,
+					     line_bulk_iter_deleter>;
+
+line_bulk_iter_ptr make_line_bulk_iter(::gpiod_line_bulk *bulk)
+{
+	::gpiod_line_bulk_iter *iter;
+
+	iter = ::gpiod_line_bulk_iter_new(bulk);
+	if (!iter)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "Unable to create new line bulk iterator");
+
+	return line_bulk_iter_ptr(iter);
+}
+
 } /* namespace */
 
 const unsigned int line_bulk::MAX_LINES = GPIOD_LINE_BULK_MAX_LINES;
@@ -73,14 +96,14 @@ void line_bulk::append(const line& new_line)
 	this->_m_bulk.push_back(new_line);
 }
 
-line& line_bulk::get(unsigned int offset)
+line& line_bulk::get(unsigned int index)
 {
-	return this->_m_bulk.at(offset);
+	return this->_m_bulk.at(index);
 }
 
-line& line_bulk::operator[](unsigned int offset)
+line& line_bulk::operator[](unsigned int index)
 {
-	return this->_m_bulk[offset];
+	return this->_m_bulk[index];
 }
 
 unsigned int line_bulk::size(void) const noexcept
@@ -106,11 +129,9 @@ void line_bulk::request(const line_request& config, const ::std::vector<int> def
 		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
 
 	::gpiod_line_request_config conf;
-	::gpiod_line_bulk bulk;
+	auto bulk = this->to_line_bulk();
 	int rv;
 
-	this->to_line_bulk(::std::addressof(bulk));
-
 	conf.consumer = config.consumer.c_str();
 	conf.request_type = reqtype_mapping.at(config.request_type);
 	conf.flags = 0;
@@ -120,7 +141,7 @@ void line_bulk::request(const line_request& config, const ::std::vector<int> def
 			conf.flags |= it.second;
 	}
 
-	rv = ::gpiod_line_request_bulk(::std::addressof(bulk),
+	rv = ::gpiod_line_request_bulk(bulk.get(),
 				       ::std::addressof(conf),
 				       default_vals.empty() ? NULL : default_vals.data());
 	if (rv)
@@ -132,25 +153,22 @@ void line_bulk::release(void) const
 {
 	this->throw_if_empty();
 
-	::gpiod_line_bulk bulk;
-
-	this->to_line_bulk(::std::addressof(bulk));
+	auto bulk = this->to_line_bulk();
 
-	::gpiod_line_release_bulk(::std::addressof(bulk));
+	::gpiod_line_release_bulk(bulk.get());
 }
 
 ::std::vector<int> line_bulk::get_values(void) const
 {
 	this->throw_if_empty();
 
+	auto bulk = this->to_line_bulk();
 	::std::vector<int> values;
-	::gpiod_line_bulk bulk;
 	int rv;
 
-	this->to_line_bulk(::std::addressof(bulk));
 	values.resize(this->_m_bulk.size());
 
-	rv = ::gpiod_line_get_value_bulk(::std::addressof(bulk), values.data());
+	rv = ::gpiod_line_get_value_bulk(bulk.get(), values.data());
 	if (rv)
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "error reading GPIO line values");
@@ -165,12 +183,10 @@ void line_bulk::set_values(const ::std::vector<int>& values) const
 	if (values.size() != this->_m_bulk.size())
 		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
 
-	::gpiod_line_bulk bulk;
+	auto bulk = this->to_line_bulk();
 	int rv;
 
-	this->to_line_bulk(::std::addressof(bulk));
-
-	rv = ::gpiod_line_set_value_bulk(::std::addressof(bulk), values.data());
+	rv = ::gpiod_line_set_value_bulk(bulk.get(), values.data());
 	if (rv)
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "error setting GPIO line values");
@@ -184,7 +200,7 @@ void line_bulk::set_config(int direction, ::std::bitset<32> flags,
 	if (!values.empty() && this->_m_bulk.size() != values.size())
 		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
 
-	::gpiod_line_bulk bulk;
+	auto bulk = this->to_line_bulk();
 	int rv, gflags;
 
 	gflags = 0;
@@ -194,9 +210,7 @@ void line_bulk::set_config(int direction, ::std::bitset<32> flags,
 			gflags |= it.second;
 	}
 
-	this->to_line_bulk(::std::addressof(bulk));
-
-	rv = ::gpiod_line_set_config_bulk(::std::addressof(bulk), direction,
+	rv = ::gpiod_line_set_config_bulk(bulk.get(), direction,
 					  gflags, values.data());
 	if (rv)
 		throw ::std::system_error(errno, ::std::system_category(),
@@ -207,11 +221,9 @@ void line_bulk::set_flags(::std::bitset<32> flags) const
 {
 	this->throw_if_empty();
 
-	::gpiod_line_bulk bulk;
+	auto bulk = this->to_line_bulk();
 	int rv, gflags;
 
-	this->to_line_bulk(::std::addressof(bulk));
-
 	gflags = 0;
 
 	for (auto& it: reqflag_mapping) {
@@ -219,7 +231,7 @@ void line_bulk::set_flags(::std::bitset<32> flags) const
 			gflags |= it.second;
 	}
 
-	rv = ::gpiod_line_set_flags_bulk(::std::addressof(bulk), gflags);
+	rv = ::gpiod_line_set_flags_bulk(bulk.get(), gflags);
 	if (rv)
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "error setting GPIO line flags");
@@ -229,12 +241,10 @@ void line_bulk::set_direction_input() const
 {
 	this->throw_if_empty();
 
-	::gpiod_line_bulk bulk;
+	auto bulk = this->to_line_bulk();
 	int rv;
 
-	this->to_line_bulk(::std::addressof(bulk));
-
-	rv = ::gpiod_line_set_direction_input_bulk(::std::addressof(bulk));
+	rv = ::gpiod_line_set_direction_input_bulk(bulk.get());
 	if (rv)
 		throw ::std::system_error(errno, ::std::system_category(),
 			"error setting GPIO line direction to input");
@@ -247,13 +257,10 @@ void line_bulk::set_direction_output(const ::std::vector<int>& values) const
 	if (values.size() != this->_m_bulk.size())
 		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
 
-	::gpiod_line_bulk bulk;
+	auto bulk = this->to_line_bulk();
 	int rv;
 
-	this->to_line_bulk(::std::addressof(bulk));
-
-	rv = ::gpiod_line_set_direction_output_bulk(::std::addressof(bulk),
-						    values.data());
+	rv = ::gpiod_line_set_direction_output_bulk(bulk.get(), values.data());
 	if (rv)
 		throw ::std::system_error(errno, ::std::system_category(),
 			"error setting GPIO line direction to output");
@@ -263,27 +270,26 @@ line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->throw_if_empty();
 
-	::gpiod_line_bulk bulk, event_bulk;
+	line_bulk_ptr ev_bulk(::gpiod_line_bulk_new(this->size()));
+	auto chip = this->_m_bulk[0].get_chip();
+	auto bulk = this->to_line_bulk();
 	::timespec ts;
 	line_bulk ret;
 	int rv;
 
-	this->to_line_bulk(::std::addressof(bulk));
-
-	::gpiod_line_bulk_init(::std::addressof(event_bulk));
-
 	ts.tv_sec = timeout.count() / 1000000000ULL;
 	ts.tv_nsec = timeout.count() % 1000000000ULL;
 
-	rv = ::gpiod_line_event_wait_bulk(::std::addressof(bulk),
-					  ::std::addressof(ts),
-					  ::std::addressof(event_bulk));
+	rv = ::gpiod_line_event_wait_bulk(bulk.get(), ::std::addressof(ts), ev_bulk.get());
 	if (rv < 0) {
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "error polling for events");
 	} else if (rv > 0) {
-		for (unsigned int i = 0; i < event_bulk.num_lines; i++)
-			ret.append(line(event_bulk.lines[i], this->_m_bulk[i].get_chip()));
+		auto iter = make_line_bulk_iter(ev_bulk.get());
+		::gpiod_line *curr_line;
+
+		gpiod_line_bulk_iter_foreach_line(iter.get(), curr_line)
+			ret.append(line(curr_line, chip));
 	}
 
 	return ret;
@@ -348,11 +354,19 @@ void line_bulk::throw_if_empty(void) const
 		throw ::std::logic_error("line_bulk not holding any GPIO lines");
 }
 
-void line_bulk::to_line_bulk(::gpiod_line_bulk *bulk) const
+line_bulk::line_bulk_ptr line_bulk::to_line_bulk(void) const
 {
-	::gpiod_line_bulk_init(bulk);
+	line_bulk_ptr bulk(::gpiod_line_bulk_new(this->size()));
+
 	for (auto& it: this->_m_bulk)
-		::gpiod_line_bulk_add(bulk, it._m_line);
+		::gpiod_line_bulk_add_line(bulk.get(), it._m_line);
+
+	return bulk;
+}
+
+void line_bulk::line_bulk_deleter::operator()(::gpiod_line_bulk *bulk)
+{
+	::gpiod_line_bulk_free(bulk);
 }
 
 } /* namespace gpiod */
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index e5db26b..6cc78ab 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1245,18 +1245,25 @@ static PyObject *gpiod_LineBulk_to_list(gpiod_LineBulkObject *self,
 	return list;
 }
 
-static void gpiod_LineBulkObjToCLineBulk(gpiod_LineBulkObject *bulk_obj,
-					 struct gpiod_line_bulk *bulk)
+static struct gpiod_line_bulk *
+gpiod_LineBulkObjToCLineBulk(gpiod_LineBulkObject *bulk_obj)
 {
+	struct gpiod_line_bulk *bulk;
 	gpiod_LineObject *line_obj;
 	Py_ssize_t i;
 
-	gpiod_line_bulk_init(bulk);
+	bulk = gpiod_line_bulk_new(bulk_obj->num_lines);
+	if (!bulk) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return NULL;
+	}
 
 	for (i = 0; i < bulk_obj->num_lines; i++) {
 		line_obj = (gpiod_LineObject *)bulk_obj->lines[i];
-		gpiod_line_bulk_add(bulk, line_obj->line);
+		gpiod_line_bulk_add_line(bulk, line_obj->line);
 	}
+
+	return bulk;
 }
 
 static void gpiod_MakeRequestConfig(struct gpiod_line_request_config *conf,
@@ -1330,7 +1337,7 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 	    default_vals[GPIOD_LINE_BULK_MAX_LINES], val;
 	PyObject *def_vals_obj = NULL, *iter, *next;
 	struct gpiod_line_request_config conf;
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	Py_ssize_t num_def_vals;
 	char *consumer = NULL;
 	Py_ssize_t i;
@@ -1344,7 +1351,10 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 	if (!rv)
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
 	gpiod_MakeRequestConfig(&conf, consumer, type, flags);
 
 	if (def_vals_obj) {
@@ -1379,8 +1389,13 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 		}
 	}
 
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_request_bulk(&bulk, &conf, default_vals);
+	rv = gpiod_line_request_bulk(bulk, &conf, default_vals);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1399,18 +1414,21 @@ static PyObject *gpiod_LineBulk_get_values(gpiod_LineBulkObject *self,
 					   PyObject *Py_UNUSED(ignored))
 {
 	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	PyObject *val_list, *val;
 	Py_ssize_t i;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
 
 	memset(vals, 0, sizeof(vals));
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_get_value_bulk(&bulk, vals);
+	rv = gpiod_line_get_value_bulk(bulk, vals);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1489,13 +1507,12 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 					   PyObject *args)
 {
 	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	PyObject *val_list;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
 	memset(vals, 0, sizeof(vals));
 
 	rv = PyArg_ParseTuple(args, "O", &val_list);
@@ -1506,8 +1523,13 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 	if (rv)
 		return NULL;
 
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_set_value_bulk(&bulk, vals);
+	rv = gpiod_line_set_value_bulk(bulk, vals);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1535,16 +1557,14 @@ static PyObject *gpiod_LineBulk_set_config(gpiod_LineBulkObject *self,
 					   PyObject *args)
 {
 	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	struct gpiod_line_bulk *bulk;
 	PyObject *val_list;
-	struct gpiod_line_bulk bulk;
 	const int *valp;
 	int dirn, flags;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
-
 	val_list = NULL;
 	rv = PyArg_ParseTuple(args, "ii|(O)", &dirn, &flags, &val_list);
 	if (!rv)
@@ -1560,8 +1580,12 @@ static PyObject *gpiod_LineBulk_set_config(gpiod_LineBulkObject *self,
 		valp = vals;
 	}
 
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_set_config_bulk(&bulk, dirn, flags, valp);
+	rv = gpiod_line_set_config_bulk(bulk, dirn, flags, valp);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1580,21 +1604,23 @@ PyDoc_STRVAR(gpiod_LineBulk_set_flags_doc,
 static PyObject *gpiod_LineBulk_set_flags(gpiod_LineBulkObject *self,
 					  PyObject *args)
 {
-	int rv;
-	struct gpiod_line_bulk bulk;
-	int flags;
+	struct gpiod_line_bulk *bulk;
+	int rv, flags;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
-
 	rv = PyArg_ParseTuple(args, "i", &flags);
 	if (!rv)
 		return NULL;
 
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_set_flags_bulk(&bulk, flags);
+	rv = gpiod_line_set_flags_bulk(bulk, flags);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1610,16 +1636,19 @@ PyDoc_STRVAR(gpiod_LineBulk_set_direction_input_doc,
 static PyObject *gpiod_LineBulk_set_direction_input(gpiod_LineBulkObject *self,
 						PyObject *Py_UNUSED(ignored))
 {
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	int rv;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
 
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_set_direction_input_bulk(&bulk);
+	rv = gpiod_line_set_direction_input_bulk(bulk);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1644,15 +1673,13 @@ static PyObject *gpiod_LineBulk_set_direction_output(
 				PyObject *args)
 {
 	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	struct gpiod_line_bulk *bulk;
 	PyObject *val_list;
-	struct gpiod_line_bulk bulk;
 	const int *valp;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
-
 	val_list = NULL;
 	rv = PyArg_ParseTuple(args, "|O", &val_list);
 	if (!rv)
@@ -1668,8 +1695,13 @@ static PyObject *gpiod_LineBulk_set_direction_output(
 		valp = vals;
 	}
 
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_set_direction_output_bulk(&bulk, valp);
+	rv = gpiod_line_set_direction_output_bulk(bulk, valp);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
 	if (rv)
 		return PyErr_SetFromErrno(PyExc_OSError);
@@ -1685,13 +1717,17 @@ PyDoc_STRVAR(gpiod_LineBulk_release_doc,
 static PyObject *gpiod_LineBulk_release(gpiod_LineBulkObject *self,
 					PyObject *Py_UNUSED(ignored))
 {
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
-	gpiod_line_release_bulk(&bulk);
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
+	gpiod_line_release_bulk(bulk);
+	gpiod_line_bulk_free(bulk);
 
 	Py_RETURN_NONE;
 }
@@ -1715,9 +1751,10 @@ static PyObject *gpiod_LineBulk_event_wait(gpiod_LineBulkObject *self,
 {
 	static char *kwlist[] = { "sec", "nsec", NULL };
 
-	struct gpiod_line_bulk bulk, ev_bulk;
-	struct gpiod_line *line, **line_ptr;
+	struct gpiod_line_bulk *bulk, *ev_bulk;
+	struct gpiod_line_bulk_iter *iter;
 	gpiod_LineObject *line_obj;
+	struct gpiod_line *line;
 	gpiod_ChipObject *owner;
 	long sec = 0, nsec = 0;
 	struct timespec ts;
@@ -1736,37 +1773,64 @@ static PyObject *gpiod_LineBulk_event_wait(gpiod_LineBulkObject *self,
 	ts.tv_sec = sec;
 	ts.tv_nsec = nsec;
 
-	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+	bulk = gpiod_LineBulkObjToCLineBulk(self);
+	if (!bulk)
+		return NULL;
+
+	ev_bulk = gpiod_line_bulk_new(self->num_lines);
+	if (!ev_bulk) {
+		gpiod_line_bulk_free(bulk);
+		return NULL;
+	}
 
 	Py_BEGIN_ALLOW_THREADS;
-	rv = gpiod_line_event_wait_bulk(&bulk, &ts, &ev_bulk);
+	rv = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
+	gpiod_line_bulk_free(bulk);
 	Py_END_ALLOW_THREADS;
-	if (rv < 0)
+	if (rv < 0) {
+		gpiod_line_bulk_free(ev_bulk);
 		return PyErr_SetFromErrno(PyExc_OSError);
-	else if (rv == 0)
+	} else if (rv == 0) {
+		gpiod_line_bulk_free(ev_bulk);
 		Py_RETURN_NONE;
+	}
 
-	ret = PyList_New(gpiod_line_bulk_num_lines(&ev_bulk));
-	if (!ret)
+	ret = PyList_New(gpiod_line_bulk_num_lines(ev_bulk));
+	if (!ret) {
+		gpiod_line_bulk_free(ev_bulk);
 		return NULL;
+	}
 
 	owner = ((gpiod_LineObject *)(self->lines[0]))->owner;
 
+	iter = gpiod_line_bulk_iter_new(ev_bulk);
+	if (!iter) {
+		gpiod_line_bulk_free(ev_bulk);
+		return PyErr_SetFromErrno(PyExc_OSError);
+	}
+
 	i = 0;
-	gpiod_line_bulk_foreach_line(&ev_bulk, line, line_ptr) {
+	gpiod_line_bulk_iter_foreach_line(iter, line) {
 		line_obj = gpiod_MakeLineObject(owner, line);
 		if (!line_obj) {
+			gpiod_line_bulk_iter_free(iter);
+			gpiod_line_bulk_free(ev_bulk);
 			Py_DECREF(ret);
 			return NULL;
 		}
 
 		rv = PyList_SetItem(ret, i++, (PyObject *)line_obj);
 		if (rv < 0) {
+			gpiod_line_bulk_iter_free(iter);
+			gpiod_line_bulk_free(ev_bulk);
 			Py_DECREF(ret);
 			return NULL;
 		}
 	}
 
+	gpiod_line_bulk_iter_free(iter);
+	gpiod_line_bulk_free(ev_bulk);
+
 	return ret;
 }
 
@@ -2241,41 +2305,59 @@ PyDoc_STRVAR(gpiod_Chip_get_all_lines_doc,
 static gpiod_LineBulkObject *
 gpiod_Chip_get_all_lines(gpiod_ChipObject *self, PyObject *Py_UNUSED(ignored))
 {
+	struct gpiod_line_bulk_iter *iter;
 	gpiod_LineBulkObject *bulk_obj;
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	gpiod_LineObject *line_obj;
 	struct gpiod_line *line;
-	unsigned int offset;
+	unsigned int index = 0;
 	PyObject *list;
 	int rv;
 
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	rv = gpiod_chip_get_all_lines(self->chip, &bulk);
-	if (rv)
+	bulk = gpiod_chip_get_all_lines(self->chip);
+	if (!bulk)
 		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
 							PyExc_OSError);
 
-	list = PyList_New(gpiod_line_bulk_num_lines(&bulk));
-	if (!list)
+	list = PyList_New(gpiod_line_bulk_num_lines(bulk));
+	if (!list) {
+		gpiod_line_bulk_free(bulk);
 		return NULL;
+	}
 
-	gpiod_line_bulk_foreach_line_off(&bulk, line, offset) {
+	iter = gpiod_line_bulk_iter_new(bulk);
+	if (!iter) {
+		gpiod_line_bulk_free(bulk);
+		Py_DECREF(list);
+		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
+							PyExc_OSError);
+	}
+
+	gpiod_line_bulk_iter_foreach_line(iter, line) {
 		line_obj = gpiod_MakeLineObject(self, line);
 		if (!line_obj) {
+			gpiod_line_bulk_iter_free(iter);
+			gpiod_line_bulk_free(bulk);
 			Py_DECREF(list);
 			return NULL;
 		}
 
-		rv = PyList_SetItem(list, offset, (PyObject *)line_obj);
+		rv = PyList_SetItem(list, index++, (PyObject *)line_obj);
 		if (rv < 0) {
+			gpiod_line_bulk_iter_free(iter);
+			gpiod_line_bulk_free(bulk);
 			Py_DECREF(line_obj);
 			Py_DECREF(list);
 			return NULL;
 		}
 	}
 
+	gpiod_line_bulk_iter_free(iter);
+	gpiod_line_bulk_free(bulk);
+
 	bulk_obj = gpiod_ListToLineBulk(list);
 	Py_DECREF(list);
 	if (!bulk_obj)
diff --git a/include/gpiod.h b/include/gpiod.h
index a6e34ae..285196b 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -48,6 +48,7 @@ struct gpiod_line;
 struct gpiod_chip_iter;
 struct gpiod_line_iter;
 struct gpiod_line_bulk;
+struct gpiod_line_bulk_iter;
 
 /**
  * @defgroup common Common helper macros
@@ -645,21 +646,19 @@ gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset) GPIOD_API;
  * @param chip The GPIO chip object.
  * @param offsets Array of offsets of lines to retrieve.
  * @param num_offsets Number of lines to retrieve.
- * @param bulk Line bulk object in which to store the line handles.
- * @return 0 on success, -1 on error.
+ * @return New line bulk object or NULL on error.
  */
-int gpiod_chip_get_lines(struct gpiod_chip *chip,
-			 unsigned int *offsets, unsigned int num_offsets,
-			 struct gpiod_line_bulk *bulk) GPIOD_API;
+struct gpiod_line_bulk *
+gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
+		     unsigned int num_offsets) GPIOD_API;
 
 /**
  * @brief Retrieve all lines exposed by a chip and store them in a bulk object.
  * @param chip The GPIO chip object.
- * @param bulk Line bulk object in which to store the line handles.
- * @return 0 on success, -1 on error.
+ * @return New line bulk object or NULL on error.
  */
-int gpiod_chip_get_all_lines(struct gpiod_chip *chip,
-			     struct gpiod_line_bulk *bulk) GPIOD_API;
+struct gpiod_line_bulk *
+gpiod_chip_get_all_lines(struct gpiod_chip *chip) GPIOD_API;
 
 /**
  * @brief Find a GPIO line by name among lines associated with given GPIO chip.
@@ -681,16 +680,15 @@ gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
  * @param chip The GPIO chip object.
  * @param names Array of pointers to C-strings containing the names of the
  *              lines to lookup. Must end with a NULL-pointer.
- * @param bulk Line bulk object in which the located lines will be stored.
- * @return 0 if all lines were located, -1 on error.
+ * @return New line bulk object or NULL on error.
  * @note If at least one line from the list could not be found among the lines
  *       exposed by this chip, the function sets errno to ENOENT.
  * @attention GPIO line names are not unique in the linux kernel, neither
  *            globally nor within a single chip. This function finds the first
  *            line with given name.
  */
-int gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names,
-			  struct gpiod_line_bulk *bulk) GPIOD_API;
+struct gpiod_line_bulk *
+gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names) GPIOD_API;
 
 /**
  * @}
@@ -708,105 +706,83 @@ int gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names,
  */
 
 /**
- * @brief Maximum number of GPIO lines that can be requested at once.
+ * @brief Maximum number of GPIO lines that can be requested at once or stored
+ *        in a line bulk object at the same time.
  */
 #define GPIOD_LINE_BULK_MAX_LINES	64
 
 /**
- * @brief Helper structure for storing a set of GPIO line objects.
- *
- * This structure is used in all operations involving sets of GPIO lines. If
- * a bulk object is being passed to a function while containing zero lines,
- * the result is undefined.
+ * @brief Allocate and initialize a new line bulk object.
+ * @param max_lines Maximum number of lines this object can hold.
+ * @return New line bulk object or NULL on error.
+ * @note max_lines must not exceed ::GPIOD_LINE_BULK_MAX_LINES.
  */
-struct gpiod_line_bulk {
-	struct gpiod_line *lines[GPIOD_LINE_BULK_MAX_LINES];
-	/**< Buffer for line pointers. */
-	unsigned int num_lines;
-	/**< Number of lines currently held in this structure. */
-};
+struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines) GPIOD_API;
 
 /**
- * @brief Static initializer for GPIO bulk objects.
- *
- * This macro simply sets the internally held number of lines to 0.
- */
-#define GPIOD_LINE_BULK_INITIALIZER	{ { NULL }, 0 }
-
-/**
- * @brief Initialize a GPIO bulk object.
- * @param bulk Line bulk object.
- *
- * This routine simply sets the internally held number of lines to 0.
+ * @brief Release all resources allocated for this bulk object.
+ * @param bulk Bulk object to free.
  */
-static inline void gpiod_line_bulk_init(struct gpiod_line_bulk *bulk)
-{
-	bulk->num_lines = 0;
-}
+void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk) GPIOD_API;
 
 /**
  * @brief Add a single line to a GPIO bulk object.
  * @param bulk Line bulk object.
  * @param line Line to add.
+ * @return 0 on success, -1 on error.
+ * @note The line is added at the next free bulk index.
+ *
+ * The function can fail if this bulk already holds its maximum amount of
+ * lines or if the added line is associated with a different chip than all
+ * the other lines already held by this object.
  */
-static inline void gpiod_line_bulk_add(struct gpiod_line_bulk *bulk,
-				       struct gpiod_line *line)
-{
-	bulk->lines[bulk->num_lines++] = line;
-}
+int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
+			     struct gpiod_line *line) GPIOD_API;
 
 /**
- * @brief Retrieve the line handle from a line bulk object at given offset.
+ * @brief Retrieve the line handle from a line bulk object at given index.
  * @param bulk Line bulk object.
- * @param offset Line offset.
+ * @param index Index of the line to retrieve.
  * @return Line handle at given offset.
  */
-static inline struct gpiod_line *
-gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int offset)
-{
-	return bulk->lines[offset];
-}
+struct gpiod_line *
+gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk,
+			 unsigned int index) GPIOD_API;
 
 /**
  * @brief Retrieve the number of GPIO lines held by this line bulk object.
  * @param bulk Line bulk object.
  * @return Number of lines held by this line bulk.
  */
-static inline unsigned int
-gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
-{
-	return bulk->num_lines;
-}
+unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk) GPIOD_API;
 
 /**
- * @brief Iterate over all line handles held by a line bulk object.
- * @param bulk Line bulk object.
- * @param line GPIO line handle. On each iteration, the subsequent line handle
- *             is assigned to this pointer.
- * @param lineptr Pointer to a GPIO line handle used to store the loop state.
+ * @brief Values returned by the callback passed to
+ *        ::gpiod_line_bulk_foreach_line.
  */
-#define gpiod_line_bulk_foreach_line(bulk, line, lineptr)		\
-	for ((lineptr) = (bulk)->lines, (line) = *(lineptr);		\
-	     (lineptr) <= (bulk)->lines + ((bulk)->num_lines - 1);	\
-	     (lineptr)++, (line) = *(lineptr))
+enum {
+	/**< Continue the loop. */
+	GPIOD_LINE_BULK_CB_NEXT = 0,
+	/**< Stop the loop. */
+	GPIOD_LINE_BULK_CB_STOP,
+};
 
 /**
- * @brief Iterate over all line handles held by a line bulk object (integer
- *        counter variant).
- * @param bulk Line bulk object.
- * @param line GPIO line handle. On each iteration, the subsequent line handle
- *             is assigned to this pointer.
- * @param offset An integer variable used to store the loop state.
+ * @brief Signature of the callback passed to ::gpiod_line_bulk_foreach_line.
  *
- * This is a variant of ::gpiod_line_bulk_foreach_line which uses an integer
- * variable (either signed or unsigned) to store the loop state. This offset
- * variable is guaranteed to correspond to the offset of the current line in
- * the bulk->lines array.
+ * Takes the current line and additional user data as arguments.
+ */
+typedef int (*gpiod_line_bulk_foreach_cb)(struct gpiod_line *, void *);
+
+/**
+ * @brief Iterate over all lines held by this bulk object.
+ * @param bulk Bulk object to iterate over.
+ * @param func Callback to be called for each line.
+ * @param data User data pointer that is passed to the callback.
  */
-#define gpiod_line_bulk_foreach_line_off(bulk, line, offset)		\
-	for ((offset) = 0, (line) = (bulk)->lines[0];			\
-	     (offset) < (bulk)->num_lines;				\
-	     (offset)++, (line) = (bulk)->lines[(offset)])
+void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
+				  gpiod_line_bulk_foreach_cb func,
+				  void *data) GPIOD_API;
 
 /**
  * @}
@@ -1751,6 +1727,39 @@ gpiod_line_iter_next(struct gpiod_line_iter *iter) GPIOD_API;
 	     (line);							\
 	     (line) = gpiod_line_iter_next(iter))
 
+/**
+ * @brief Create a new line bulk iterator.
+ * @param bulk Bulk object to create the iterator for.
+ * @return New line bulk iterator or NULL on failure.
+ */
+struct gpiod_line_bulk_iter *
+gpiod_line_bulk_iter_new(struct gpiod_line_bulk *bulk) GPIOD_API;
+
+/**
+ * @brief Free all resources allocated for a line bulk iterator.
+ * @param iter Line bulk iterator to free.
+ */
+void gpiod_line_bulk_iter_free(struct gpiod_line_bulk_iter *iter) GPIOD_API;
+
+/**
+ * @brief Get the next GPIO line from this line bulk iterator.
+ * @param iter Line bulk iterator to get the next line from.
+ * @return Next line object or NULL if no more lines remain.
+ */
+struct gpiod_line *
+gpiod_line_bulk_iter_next(struct gpiod_line_bulk_iter *iter) GPIOD_API;
+
+/**
+ * @brief Iterate over all GPIO lines from a single line bulk.
+ * @param iter Line bulk iterator to iterate over.
+ * @param line Pointer to a GPIO line handle - on each iteration, the
+ *             next GPIO line will be assigned to this argument.
+ */
+#define gpiod_line_bulk_iter_foreach_line(iter, line)			\
+	for ((line) = gpiod_line_bulk_iter_next(iter);			\
+	     (line);							\
+	     (line) = gpiod_line_bulk_iter_next(iter))
+
 /**
  * @}
  *
diff --git a/lib/core.c b/lib/core.c
index 1abe3a4..dbd032d 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -74,6 +74,106 @@ struct gpiod_chip {
 	char label[32];
 };
 
+/*
+ * The structure is defined in a way that allows internal users to allocate
+ * bulk objects that hold a single line on the stack - that way we can reuse
+ * a lot of code between functions that take single lines and those that take
+ * bulks as arguments while not unnecessarily allocating memory dynamically.
+ */
+struct gpiod_line_bulk {
+	struct gpiod_chip *owner;
+	unsigned int num_lines;
+	unsigned int max_lines;
+	struct gpiod_line *lines[1];
+};
+
+#define BULK_SINGLE_LINE_INIT(line) \
+		{ gpiod_line_get_chip(line), 1, 1, { (line) } }
+
+struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
+{
+	struct gpiod_line_bulk *bulk;
+	size_t size;
+
+	if (max_lines < 1 || max_lines > GPIOD_LINE_BULK_MAX_LINES) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	size = sizeof(struct gpiod_line_bulk) +
+	       (max_lines - 1) * sizeof(struct gpiod_line *);
+
+	bulk = malloc(size);
+	if (!bulk)
+		return NULL;
+
+	memset(bulk, 0, size);
+	bulk->max_lines = max_lines;
+
+	return bulk;
+}
+
+void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
+{
+	free(bulk);
+}
+
+int gpiod_line_bulk_add_line(struct gpiod_line_bulk *bulk,
+			     struct gpiod_line *line)
+{
+	if (bulk->num_lines == bulk->max_lines) {
+		errno = EINVAL;
+		return -1;
+	}
+
+	if (bulk->num_lines == 0) {
+		bulk->owner = gpiod_line_get_chip(line);
+	} else {
+		if (bulk->owner != gpiod_line_get_chip(line)) {
+			errno = EINVAL;
+			return -1;
+		}
+	}
+
+	bulk->lines[bulk->num_lines++] = line;
+
+	return 0;
+}
+
+struct gpiod_line *
+gpiod_line_bulk_get_line(struct gpiod_line_bulk *bulk, unsigned int index)
+{
+	if (index >= bulk->num_lines) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	return bulk->lines[index];
+}
+
+unsigned int gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
+{
+	return bulk->num_lines;
+}
+
+void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
+				  gpiod_line_bulk_foreach_cb func, void *data)
+{
+	unsigned int index;
+	int ret;
+
+	for (index = 0; index < bulk->num_lines; index++) {
+		ret = func(bulk->lines[index], data);
+		if (ret == GPIOD_LINE_BULK_CB_STOP)
+			return;
+	}
+}
+
+#define line_bulk_foreach_line(bulk, line, index)			\
+	for ((index) = 0, (line) = (bulk)->lines[0];			\
+	     (index) < (bulk)->num_lines;				\
+	     (index)++, (line) = (bulk)->lines[(index)])
+
 static bool is_gpiochip_cdev(const char *path)
 {
 	char *name, *realname, *sysfsp, sysfsdev[16], devstr[16];
@@ -480,9 +580,10 @@ static bool line_bulk_same_chip(struct gpiod_line_bulk *bulk)
 
 static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
+	unsigned int idx;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	line_bulk_foreach_line(bulk, line, idx) {
 		if (!gpiod_line_is_requested(line)) {
 			errno = EPERM;
 			return false;
@@ -494,9 +595,10 @@ static bool line_bulk_all_requested(struct gpiod_line_bulk *bulk)
 
 static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
+	unsigned int idx;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	line_bulk_foreach_line(bulk, line, idx) {
 		if (line->state != LINE_REQUESTED_VALUES) {
 			errno = EPERM;
 			return false;
@@ -508,9 +610,10 @@ static bool line_bulk_all_requested_values(struct gpiod_line_bulk *bulk)
 
 static bool line_bulk_all_free(struct gpiod_line_bulk *bulk)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
+	unsigned int idx;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	line_bulk_foreach_line(bulk, line, idx) {
 		if (!gpiod_line_is_free(line)) {
 			errno = EBUSY;
 			return false;
@@ -650,14 +753,14 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	req.num_lines = gpiod_line_bulk_num_lines(bulk);
 	line_request_config_to_gpio_v2_line_config(config, &req.config);
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, i)
+	line_bulk_foreach_line(bulk, line, i)
 		req.offsets[i] = gpiod_line_offset(line);
 
 	if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT &&
 	    vals) {
 		req.config.num_attrs = 1;
 		req.config.attrs[0].attr.id = GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES;
-		gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+		line_bulk_foreach_line(bulk, line, i) {
 			lines_bitmap_assign_bit(
 				&req.config.attrs[0].mask, i, 1);
 			lines_bitmap_assign_bit(
@@ -681,7 +784,7 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 	if (!line_fd)
 		return -1;
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+	line_bulk_foreach_line(bulk, line, i) {
 		line->state = LINE_REQUESTED_VALUES;
 		line->req_flags = config->flags;
 		if (config->request_type == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
@@ -744,7 +847,7 @@ static int line_request_events(struct gpiod_line_bulk *bulk,
 	unsigned int off;
 	int rv, rev;
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, off) {
+	line_bulk_foreach_line(bulk, line, off) {
 		rv = line_request_event_single(line, config);
 		if (rv) {
 			for (rev = off - 1; rev >= 0; rev--) {
@@ -763,10 +866,7 @@ int gpiod_line_request(struct gpiod_line *line,
 		       const struct gpiod_line_request_config *config,
 		       int default_val)
 {
-	struct gpiod_line_bulk bulk;
-
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_request_bulk(&bulk, config, &default_val);
 }
@@ -803,19 +903,17 @@ int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
 
 void gpiod_line_release(struct gpiod_line *line)
 {
-	struct gpiod_line_bulk bulk;
-
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	gpiod_line_release_bulk(&bulk);
 }
 
 void gpiod_line_release_bulk(struct gpiod_line_bulk *bulk)
 {
-	struct gpiod_line *line, **lineptr;
+	struct gpiod_line *line;
+	unsigned int idx;
 
-	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
+	line_bulk_foreach_line(bulk, line, idx) {
 		if (line->state != LINE_FREE) {
 			line_fd_decref(line);
 			line->state = LINE_FREE;
@@ -836,12 +934,9 @@ bool gpiod_line_is_free(struct gpiod_line *line)
 
 int gpiod_line_get_value(struct gpiod_line *line)
 {
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 	int rv, value;
 
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
-
 	rv = gpiod_line_get_value_bulk(&bulk, &value);
 	if (rv < 0)
 		return -1;
@@ -896,10 +991,7 @@ int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
 
 int gpiod_line_set_value(struct gpiod_line *line, int value)
 {
-	struct gpiod_line_bulk bulk;
-
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_set_value_bulk(&bulk, &value);
 }
@@ -928,7 +1020,7 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 	if (rv < 0)
 		return -1;
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, i)
+	line_bulk_foreach_line(bulk, line, i)
 		line->output_value = lines_bitmap_test_bit(lv.bits, i);
 
 	return 0;
@@ -937,10 +1029,7 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk, const int *values)
 int gpiod_line_set_config(struct gpiod_line *line, int direction,
 			  int flags, int value)
 {
-	struct gpiod_line_bulk bulk;
-
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_set_config_bulk(&bulk, direction, flags, &value);
 }
@@ -982,7 +1071,7 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
 	if (rv < 0)
 		return -1;
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, i) {
+	line_bulk_foreach_line(bulk, line, i) {
 		line->req_flags = flags;
 		if (direction == GPIOD_LINE_REQUEST_DIRECTION_OUTPUT)
 			line->output_value = lines_bitmap_test_bit(
@@ -997,10 +1086,7 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
 
 int gpiod_line_set_flags(struct gpiod_line *line, int flags)
 {
-	struct gpiod_line_bulk bulk;
-
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_set_flags_bulk(&bulk, flags);
 }
@@ -1014,7 +1100,7 @@ int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
 
 	line = gpiod_line_bulk_get_line(bulk, 0);
 	if (line->direction == GPIOD_LINE_DIRECTION_OUTPUT) {
-		gpiod_line_bulk_foreach_line_off(bulk, line, i)
+		line_bulk_foreach_line(bulk, line, i)
 			values[i] = line->output_value;
 
 		direction = GPIOD_LINE_REQUEST_DIRECTION_OUTPUT;
@@ -1062,10 +1148,7 @@ int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
 int gpiod_line_event_wait(struct gpiod_line *line,
 			  const struct timespec *timeout)
 {
-	struct gpiod_line_bulk bulk;
-
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
+	struct gpiod_line_bulk bulk = BULK_SINGLE_LINE_INIT(line);
 
 	return gpiod_line_event_wait_bulk(&bulk, timeout, NULL);
 }
@@ -1085,7 +1168,7 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 	memset(fds, 0, sizeof(fds));
 	num_lines = gpiod_line_bulk_num_lines(bulk);
 
-	gpiod_line_bulk_foreach_line_off(bulk, line, off) {
+	line_bulk_foreach_line(bulk, line, off) {
 		fds[off].fd = line_get_fd(line);
 		fds[off].events = POLLIN | POLLPRI;
 	}
@@ -1096,9 +1179,6 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 	else if (rv == 0)
 		return 0;
 
-	if (event_bulk)
-		gpiod_line_bulk_init(event_bulk);
-
 	for (off = 0; off < num_lines; off++) {
 		if (fds[off].revents) {
 			if (fds[off].revents & POLLNVAL) {
@@ -1108,7 +1188,9 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 
 			if (event_bulk) {
 				line = gpiod_line_bulk_get_line(bulk, off);
-				gpiod_line_bulk_add(event_bulk, line);
+				rv = gpiod_line_bulk_add_line(event_bulk, line);
+				if (rv)
+					return -1;
 			}
 
 			if (!--rv)
diff --git a/lib/ctxless.c b/lib/ctxless.c
index 014475c..c403273 100644
--- a/lib/ctxless.c
+++ b/lib/ctxless.c
@@ -80,7 +80,7 @@ int gpiod_ctxless_get_value_multiple_ext(const char *device,
 					 bool active_low,
 					 const char *consumer, int flags)
 {
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
 	unsigned int i;
@@ -95,28 +95,35 @@ int gpiod_ctxless_get_value_multiple_ext(const char *device,
 	if (!chip)
 		return -1;
 
-	gpiod_line_bulk_init(&bulk);
+	bulk = gpiod_line_bulk_new(num_lines);
+	if (!bulk) {
+		gpiod_chip_close(chip);
+		return -1;
+	}
 
 	for (i = 0; i < num_lines; i++) {
 		line = gpiod_chip_get_line(chip, offsets[i]);
 		if (!line) {
+			gpiod_line_bulk_free(bulk);
 			gpiod_chip_close(chip);
 			return -1;
 		}
 
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
 	req_flags = ctxless_flags_to_line_request_flags(active_low, flags);
-	rv = gpiod_line_request_bulk_input_flags(&bulk, consumer, req_flags);
+	rv = gpiod_line_request_bulk_input_flags(bulk, consumer, req_flags);
 	if (rv < 0) {
+		gpiod_line_bulk_free(bulk);
 		gpiod_chip_close(chip);
 		return -1;
 	}
 
 	memset(values, 0, sizeof(*values) * num_lines);
-	rv = gpiod_line_get_value_bulk(&bulk, values);
+	rv = gpiod_line_get_value_bulk(bulk, values);
 
+	gpiod_line_bulk_free(bulk);
 	gpiod_chip_close(chip);
 
 	return rv;
@@ -158,7 +165,7 @@ int gpiod_ctxless_set_value_multiple_ext(
 			bool active_low, const char *consumer,
 			gpiod_ctxless_set_value_cb cb, void *data, int flags)
 {
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
 	unsigned int i;
@@ -173,22 +180,28 @@ int gpiod_ctxless_set_value_multiple_ext(
 	if (!chip)
 		return -1;
 
-	gpiod_line_bulk_init(&bulk);
+	bulk = gpiod_line_bulk_new(num_lines);
+	if (!bulk) {
+		gpiod_chip_close(chip);
+		return -1;
+	}
 
 	for (i = 0; i < num_lines; i++) {
 		line = gpiod_chip_get_line(chip, offsets[i]);
 		if (!line) {
+			gpiod_line_bulk_free(bulk);
 			gpiod_chip_close(chip);
 			return -1;
 		}
 
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
 	req_flags = ctxless_flags_to_line_request_flags(active_low, flags);
-	rv = gpiod_line_request_bulk_output_flags(&bulk, consumer,
+	rv = gpiod_line_request_bulk_output_flags(bulk, consumer,
 						  req_flags, values);
 	if (rv < 0) {
+		gpiod_line_bulk_free(bulk);
 		gpiod_chip_close(chip);
 		return -1;
 	}
@@ -196,6 +209,7 @@ int gpiod_ctxless_set_value_multiple_ext(
 	if (cb)
 		cb(data);
 
+	gpiod_line_bulk_free(bulk);
 	gpiod_chip_close(chip);
 
 	return 0;
@@ -325,7 +339,7 @@ int gpiod_ctxless_event_monitor_multiple_ext(
 	struct gpiod_ctxless_event_poll_fd fds[GPIOD_LINE_BULK_MAX_LINES];
 	struct gpiod_line_request_config conf;
 	struct gpiod_line_event event;
-	struct gpiod_line_bulk bulk;
+	struct gpiod_line_bulk *bulk;
 	int rv, ret, evtype, cnt;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
@@ -343,16 +357,20 @@ int gpiod_ctxless_event_monitor_multiple_ext(
 	if (!chip)
 		return -1;
 
-	gpiod_line_bulk_init(&bulk);
+	bulk = gpiod_line_bulk_new(num_lines);
+	if (!bulk) {
+		gpiod_chip_close(chip);
+		return -1;
+	}
 
 	for (i = 0; i < num_lines; i++) {
 		line = gpiod_chip_get_line(chip, offsets[i]);
 		if (!line) {
-			gpiod_chip_close(chip);
-			return -1;
+			ret = -1;
+			goto out;
 		}
 
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
 	conf.flags = ctxless_flags_to_line_request_flags(active_low, flags);
@@ -370,7 +388,7 @@ int gpiod_ctxless_event_monitor_multiple_ext(
 		goto out;
 	}
 
-	rv = gpiod_line_request_bulk(&bulk, &conf, NULL);
+	rv = gpiod_line_request_bulk(bulk, &conf, NULL);
 	if (rv) {
 		ret = -1;
 		goto out;
@@ -378,7 +396,7 @@ int gpiod_ctxless_event_monitor_multiple_ext(
 
 	memset(fds, 0, sizeof(fds));
 	for (i = 0; i < num_lines; i++) {
-		line = gpiod_line_bulk_get_line(&bulk, i);
+		line = gpiod_line_bulk_get_line(bulk, i);
 		fds[i].fd = gpiod_line_event_get_fd(line);
 	}
 
@@ -409,7 +427,7 @@ int gpiod_ctxless_event_monitor_multiple_ext(
 			if (!fds[i].event)
 				continue;
 
-			line = gpiod_line_bulk_get_line(&bulk, i);
+			line = gpiod_line_bulk_get_line(bulk, i);
 			rv = gpiod_line_event_read(line, &event);
 			if (rv < 0) {
 				ret = rv;
@@ -437,6 +455,7 @@ int gpiod_ctxless_event_monitor_multiple_ext(
 	}
 
 out:
+	gpiod_line_bulk_free(bulk);
 	gpiod_chip_close(chip);
 
 	return ret;
diff --git a/lib/helpers.c b/lib/helpers.c
index 479f370..a343f71 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -97,43 +97,53 @@ struct gpiod_chip *gpiod_chip_open_lookup(const char *descr)
 	return chip;
 }
 
-int gpiod_chip_get_lines(struct gpiod_chip *chip, unsigned int *offsets,
-			 unsigned int num_offsets, struct gpiod_line_bulk *bulk)
+struct gpiod_line_bulk *
+gpiod_chip_get_lines(struct gpiod_chip *chip,
+		     unsigned int *offsets, unsigned int num_offsets)
 {
+	struct gpiod_line_bulk *bulk;
 	struct gpiod_line *line;
 	unsigned int i;
 
-	gpiod_line_bulk_init(bulk);
+	bulk = gpiod_line_bulk_new(num_offsets);
+	if (!bulk)
+		return NULL;
 
 	for (i = 0; i < num_offsets; i++) {
 		line = gpiod_chip_get_line(chip, offsets[i]);
-		if (!line)
-			return -1;
+		if (!line) {
+			gpiod_line_bulk_free(bulk);
+			return NULL;
+		}
 
-		gpiod_line_bulk_add(bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
-	return 0;
+	return bulk;
 }
 
-int gpiod_chip_get_all_lines(struct gpiod_chip *chip,
-			     struct gpiod_line_bulk *bulk)
+struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 {
 	struct gpiod_line_iter *iter;
+	struct gpiod_line_bulk *bulk;
 	struct gpiod_line *line;
 
-	gpiod_line_bulk_init(bulk);
+	bulk = gpiod_line_bulk_new(gpiod_chip_num_lines(chip));
+	if (!bulk)
+		return NULL;
 
 	iter = gpiod_line_iter_new(chip);
-	if (!iter)
-		return -1;
+	if (!iter) {
+		gpiod_line_bulk_free(bulk);
+		return NULL;
+	}
 
 	gpiod_foreach_line(iter, line)
-		gpiod_line_bulk_add(bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 
 	gpiod_line_iter_free(iter);
 
-	return 0;
+	return bulk;
 }
 
 struct gpiod_line *
@@ -161,23 +171,32 @@ gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 	return NULL;
 }
 
-int gpiod_chip_find_lines(struct gpiod_chip *chip,
-			  const char **names, struct gpiod_line_bulk *bulk)
+struct gpiod_line_bulk *
+gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names)
 {
+	struct gpiod_line_bulk *bulk;
 	struct gpiod_line *line;
+	unsigned int num_names;
 	int i;
 
-	gpiod_line_bulk_init(bulk);
+	for (i = 0; names[i]; i++);
+	num_names = i;
+
+	bulk = gpiod_line_bulk_new(num_names);
+	if (!bulk)
+		return NULL;
 
 	for (i = 0; names[i]; i++) {
 		line = gpiod_chip_find_line(chip, names[i]);
-		if (!line)
-			return -1;
+		if (!line) {
+			gpiod_line_bulk_free(bulk);
+			return NULL;
+		}
 
-		gpiod_line_bulk_add(bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
-	return 0;
+	return bulk;
 }
 
 int gpiod_line_request_input(struct gpiod_line *line, const char *consumer)
diff --git a/lib/iter.c b/lib/iter.c
index bfd2852..c9a117c 100644
--- a/lib/iter.c
+++ b/lib/iter.c
@@ -23,6 +23,12 @@ struct gpiod_line_iter {
 	unsigned int offset;
 };
 
+struct gpiod_line_bulk_iter {
+	struct gpiod_line_bulk *bulk;
+	unsigned int num_lines;
+	unsigned int index;
+};
+
 static int dir_filter(const struct dirent *dir)
 {
 	return !strncmp(dir->d_name, "gpiochip", 8);
@@ -169,3 +175,30 @@ struct gpiod_line *gpiod_line_iter_next(struct gpiod_line_iter *iter)
 	return iter->offset < (iter->num_lines)
 					? iter->lines[iter->offset++] : NULL;
 }
+
+struct gpiod_line_bulk_iter *
+gpiod_line_bulk_iter_new(struct gpiod_line_bulk *bulk)
+{
+	struct gpiod_line_bulk_iter *iter;
+
+	iter = malloc(sizeof(*iter));
+	if (!iter)
+		return NULL;
+
+	iter->bulk = bulk;
+	iter->index = 0;
+	iter->num_lines = gpiod_line_bulk_num_lines(bulk);
+
+	return iter;
+}
+
+void gpiod_line_bulk_iter_free(struct gpiod_line_bulk_iter *iter)
+{
+	free(iter);
+}
+
+struct gpiod_line *gpiod_line_bulk_iter_next(struct gpiod_line_bulk_iter *iter)
+{
+	return iter->index < iter->num_lines ?
+		gpiod_line_bulk_get_line(iter->bulk, iter->index++) : NULL;
+}
diff --git a/tests/Makefile.am b/tests/Makefile.am
index f79f8d5..4a3befd 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -22,6 +22,7 @@ bin_PROGRAMS = gpiod-test
 gpiod_test_SOURCES =			\
 		gpiod-test.c		\
 		gpiod-test.h		\
+		tests-bulk.c		\
 		tests-chip.c		\
 		tests-ctxless.c		\
 		tests-event.c		\
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index d4a8c5f..d930c04 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -24,12 +24,17 @@
  * regular 'struct typename' syntax.
  */
 typedef struct gpiod_chip gpiod_chip_struct;
+typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
 typedef struct gpiod_chip_iter gpiod_chip_iter_struct;
 typedef struct gpiod_line_iter gpiod_line_iter_struct;
+typedef struct gpiod_line_bulk_iter gpiod_line_bulk_iter_struct;
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_close);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_iter_struct, gpiod_chip_iter_free);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_iter_struct, gpiod_line_iter_free);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_iter_struct,
+			      gpiod_line_bulk_iter_free);
 
 /* These are private definitions and should not be used directly. */
 typedef void (*_gpiod_test_func)(void);
diff --git a/tests/tests-bulk.c b/tests/tests-bulk.c
new file mode 100644
index 0000000..e2520fc
--- /dev/null
+++ b/tests/tests-bulk.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ * This file is part of libgpiod.
+ *
+ * Copyright (C) 2020 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#include <errno.h>
+
+#include "gpiod-test.h"
+
+#define GPIOD_TEST_GROUP "bulk"
+
+GPIOD_TEST_CASE(alloc_zero_lines, 0, { 1 })
+{
+	struct gpiod_line_bulk *bulk;
+
+	bulk = gpiod_line_bulk_new(0);
+	g_assert_null(bulk);
+	g_assert_cmpint(errno, ==, EINVAL);
+}
+
+GPIOD_TEST_CASE(alloc_too_many_lines, 0, { 1 })
+{
+	struct gpiod_line_bulk *bulk;
+
+	bulk = gpiod_line_bulk_new(GPIOD_LINE_BULK_MAX_LINES + 1);
+	g_assert_null(bulk);
+	g_assert_cmpint(errno, ==, EINVAL);
+}
+
+GPIOD_TEST_CASE(add_too_many_lines, 0, { 8 })
+{
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *lineA, *lineB, *lineC;
+	gint ret;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	bulk = gpiod_line_bulk_new(2);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	lineA = gpiod_chip_get_line(chip, 0);
+	lineB = gpiod_chip_get_line(chip, 1);
+	lineC = gpiod_chip_get_line(chip, 2);
+	g_assert_nonnull(lineA);
+	g_assert_nonnull(lineB);
+	g_assert_nonnull(lineC);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_bulk_add_line(bulk, lineA);
+	g_assert_cmpint(ret, ==, 0);
+	ret = gpiod_line_bulk_add_line(bulk, lineB);
+	g_assert_cmpint(ret, ==, 0);
+	ret = gpiod_line_bulk_add_line(bulk, lineC);
+	g_assert_cmpint(ret, ==, -1);
+	g_assert_cmpint(errno, ==, EINVAL);
+}
+
+GPIOD_TEST_CASE(add_lines_from_different_chips, 0, { 8, 8 })
+{
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
+	g_autoptr(gpiod_chip_struct) chipA = NULL;
+	g_autoptr(gpiod_chip_struct) chipB = NULL;
+	struct gpiod_line *lineA, *lineB;
+	gint ret;
+
+	chipA = gpiod_chip_open(gpiod_test_chip_path(0));
+	chipB = gpiod_chip_open(gpiod_test_chip_path(1));
+	g_assert_nonnull(chipA);
+	g_assert_nonnull(chipB);
+	gpiod_test_return_if_failed();
+
+	bulk = gpiod_line_bulk_new(4);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	lineA = gpiod_chip_get_line(chipA, 0);
+	lineB = gpiod_chip_get_line(chipB, 0);
+	g_assert_nonnull(lineA);
+	g_assert_nonnull(lineB);
+	gpiod_test_return_if_failed();
+
+	ret = gpiod_line_bulk_add_line(bulk, lineA);
+	g_assert_cmpint(ret, ==, 0);
+	ret = gpiod_line_bulk_add_line(bulk, lineB);
+	g_assert_cmpint(ret, ==, -1);
+	g_assert_cmpint(errno, ==, EINVAL);
+}
+
+static const gchar *const bulk_foreach_line_names[] = {
+	"gpio-mockup-A-0",
+	"gpio-mockup-A-1",
+	"gpio-mockup-A-2",
+	"gpio-mockup-A-3"
+};
+
+static int bulk_foreach_callback_all(struct gpiod_line *line, void *data)
+{
+	gint *i = data;
+
+	g_assert_cmpstr(gpiod_line_name(line), ==,
+			bulk_foreach_line_names[(*i)++]);
+
+	return GPIOD_LINE_BULK_CB_NEXT;
+}
+
+static int bulk_foreach_callback_stop(struct gpiod_line *line, void *data)
+{
+	gint *i = data;
+
+	g_assert_cmpstr(gpiod_line_name(line), ==,
+			bulk_foreach_line_names[(*i)++]);
+	if (*i == 2)
+		return GPIOD_LINE_BULK_CB_STOP;
+
+	return GPIOD_LINE_BULK_CB_NEXT;
+}
+
+GPIOD_TEST_CASE(foreach_all_lines, GPIOD_TEST_FLAG_NAMED_LINES, { 4 })
+{
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	gint i = 0;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	bulk = gpiod_chip_get_all_lines(chip);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_foreach_line(bulk, bulk_foreach_callback_all, &i);
+	gpiod_test_return_if_failed();
+}
+
+GPIOD_TEST_CASE(foreach_two_lines, GPIOD_TEST_FLAG_NAMED_LINES, { 8 })
+{
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	gint i = 0;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	bulk = gpiod_chip_get_all_lines(chip);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_foreach_line(bulk, bulk_foreach_callback_stop, &i);
+	g_assert_cmpint(i, ==, 2);
+}
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 6edb61c..289c458 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -187,10 +187,9 @@ GPIOD_TEST_CASE(get_line, 0, { 16 })
 GPIOD_TEST_CASE(get_lines, 0, { 16 })
 {
 	struct gpiod_line *line0, *line1, *line2, *line3;
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk;
 	guint offsets[4];
-	gint ret;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(0));
 	g_assert_nonnull(chip);
@@ -201,15 +200,16 @@ GPIOD_TEST_CASE(get_lines, 0, { 16 })
 	offsets[2] = 4;
 	offsets[3] = 7;
 
-	ret = gpiod_chip_get_lines(chip, offsets, 4, &bulk);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(&bulk), ==, 4);
+	bulk = gpiod_chip_get_lines(chip, offsets, 4);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+	g_assert_cmpuint(gpiod_line_bulk_num_lines(bulk), ==, 4);
 	gpiod_test_return_if_failed();
 
-	line0 = gpiod_line_bulk_get_line(&bulk, 0);
-	line1 = gpiod_line_bulk_get_line(&bulk, 1);
-	line2 = gpiod_line_bulk_get_line(&bulk, 2);
-	line3 = gpiod_line_bulk_get_line(&bulk, 3);
+	line0 = gpiod_line_bulk_get_line(bulk, 0);
+	line1 = gpiod_line_bulk_get_line(bulk, 1);
+	line2 = gpiod_line_bulk_get_line(bulk, 2);
+	line3 = gpiod_line_bulk_get_line(bulk, 3);
 
 	g_assert_cmpuint(gpiod_line_offset(line0), ==, 1);
 	g_assert_cmpuint(gpiod_line_offset(line1), ==, 3);
@@ -220,23 +220,23 @@ GPIOD_TEST_CASE(get_lines, 0, { 16 })
 GPIOD_TEST_CASE(get_all_lines, 0, { 4 })
 {
 	struct gpiod_line *line0, *line1, *line2, *line3;
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk;
-	int ret;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(0));
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_chip_get_all_lines(chip, &bulk);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(&bulk), ==, 4);
+	bulk = gpiod_chip_get_all_lines(chip);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+	g_assert_cmpuint(gpiod_line_bulk_num_lines(bulk), ==, 4);
 	gpiod_test_return_if_failed();
 
-	line0 = gpiod_line_bulk_get_line(&bulk, 0);
-	line1 = gpiod_line_bulk_get_line(&bulk, 1);
-	line2 = gpiod_line_bulk_get_line(&bulk, 2);
-	line3 = gpiod_line_bulk_get_line(&bulk, 3);
+	line0 = gpiod_line_bulk_get_line(bulk, 0);
+	line1 = gpiod_line_bulk_get_line(bulk, 1);
+	line2 = gpiod_line_bulk_get_line(bulk, 2);
+	line3 = gpiod_line_bulk_get_line(bulk, 3);
 
 	g_assert_cmpuint(gpiod_line_offset(line0), ==, 0);
 	g_assert_cmpuint(gpiod_line_offset(line1), ==, 1);
@@ -281,23 +281,23 @@ GPIOD_TEST_CASE(find_lines_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 					"gpio-mockup-B-7",
 					NULL };
 
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line0, *line1, *line2;
-	struct gpiod_line_bulk bulk;
-	gint ret;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(1));
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_chip_find_lines(chip, names, &bulk);
-	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(&bulk), ==, 3);
+	bulk = gpiod_chip_find_lines(chip, names);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+	g_assert_cmpuint(gpiod_line_bulk_num_lines(bulk), ==, 3);
 	gpiod_test_return_if_failed();
 
-	line0 = gpiod_line_bulk_get_line(&bulk, 0);
-	line1 = gpiod_line_bulk_get_line(&bulk, 1);
-	line2 = gpiod_line_bulk_get_line(&bulk, 2);
+	line0 = gpiod_line_bulk_get_line(bulk, 0);
+	line1 = gpiod_line_bulk_get_line(bulk, 1);
+	line2 = gpiod_line_bulk_get_line(bulk, 2);
 
 	g_assert_cmpuint(gpiod_line_offset(line0), ==, 3);
 	g_assert_cmpuint(gpiod_line_offset(line1), ==, 6);
@@ -312,14 +312,13 @@ GPIOD_TEST_CASE(fine_lines_not_found, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 					NULL };
 
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk;
-	gint ret;
+	struct gpiod_line_bulk *bulk;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(1));
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	ret = gpiod_chip_find_lines(chip, names, &bulk);
-	g_assert_cmpint(ret, ==, -1);
+	bulk = gpiod_chip_find_lines(chip, names);
+	g_assert_null(bulk);
 	g_assert_cmpint(errno, ==, ENOENT);
 }
diff --git a/tests/tests-event.c b/tests/tests-event.c
index 9b66f05..15745bf 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -423,8 +423,8 @@ GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
 
 GPIOD_TEST_CASE(get_values, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk;
 	struct gpiod_line *line;
 	gint i, ret, vals[8];
 
@@ -432,22 +432,25 @@ GPIOD_TEST_CASE(get_values, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_init(&bulk);
+	bulk = gpiod_line_bulk_new(8);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
 	for (i = 0; i < 8; i++) {
 		line = gpiod_chip_get_line(chip, i);
 		g_assert_nonnull(line);
 		gpiod_test_return_if_failed();
 
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 		gpiod_test_chip_set_pull(0, i, 1);
 	}
 
-	ret = gpiod_line_request_bulk_rising_edge_events(&bulk,
+	ret = gpiod_line_request_bulk_rising_edge_events(bulk,
 							 GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 
 	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	ret = gpiod_line_get_value_bulk(bulk, vals);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(vals[0], ==, 1);
 	g_assert_cmpint(vals[1], ==, 1);
@@ -464,7 +467,7 @@ GPIOD_TEST_CASE(get_values, 0, { 8 })
 	gpiod_test_chip_set_pull(0, 7, 0);
 
 	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	ret = gpiod_line_get_value_bulk(bulk, vals);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(vals[0], ==, 1);
 	g_assert_cmpint(vals[1], ==, 0);
@@ -478,8 +481,8 @@ GPIOD_TEST_CASE(get_values, 0, { 8 })
 
 GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk;
 	struct gpiod_line *line;
 	gint i, ret, vals[8];
 
@@ -487,22 +490,25 @@ GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_init(&bulk);
+	bulk = gpiod_line_bulk_new(8);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
 	for (i = 0; i < 8; i++) {
 		line = gpiod_chip_get_line(chip, i);
 		g_assert_nonnull(line);
 		gpiod_test_return_if_failed();
 
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 		gpiod_test_chip_set_pull(0, i, 0);
 	}
 
-	ret = gpiod_line_request_bulk_rising_edge_events_flags(&bulk,
+	ret = gpiod_line_request_bulk_rising_edge_events_flags(bulk,
 			GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
 	g_assert_cmpint(ret, ==, 0);
 
 	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	ret = gpiod_line_get_value_bulk(bulk, vals);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(vals[0], ==, 1);
 	g_assert_cmpint(vals[1], ==, 1);
@@ -519,7 +525,7 @@ GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
 	gpiod_test_chip_set_pull(0, 7, 1);
 
 	memset(vals, 0, sizeof(vals));
-	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	ret = gpiod_line_get_value_bulk(bulk, vals);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(vals[0], ==, 1);
 	g_assert_cmpint(vals[1], ==, 0);
@@ -534,8 +540,9 @@ GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
 GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 {
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
+	g_autoptr(gpiod_line_bulk_struct) ev_bulk = NULL;
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk, event_bulk;
 	struct timespec ts = { 1, 0 };
 	struct gpiod_line_event ev;
 	struct gpiod_line *line;
@@ -545,26 +552,31 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_init(&bulk);
+	bulk = gpiod_line_bulk_new(8);
+	ev_bulk = gpiod_line_bulk_new(8);
+	g_assert_nonnull(bulk);
+	g_assert_nonnull(ev_bulk);
+	gpiod_test_return_if_failed();
+
 	for (i = 0; i < 8; i++) {
 		line = gpiod_chip_get_line(chip, i);
 		g_assert_nonnull(line);
 		gpiod_test_return_if_failed();
 
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
-	ret = gpiod_line_request_bulk_rising_edge_events(&bulk,
+	ret = gpiod_line_request_bulk_rising_edge_events(bulk,
 							 GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 
 	ev_thread = gpiod_test_start_event_thread(0, 4, 100);
 
-	ret = gpiod_line_event_wait_bulk(&bulk, &ts, &event_bulk);
+	ret = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
 	g_assert_cmpint(ret, ==, 1);
 
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(&event_bulk), ==, 1);
-	line = gpiod_line_bulk_get_line(&event_bulk, 0);
+	g_assert_cmpuint(gpiod_line_bulk_num_lines(ev_bulk), ==, 1);
+	line = gpiod_line_bulk_get_line(ev_bulk, 0);
 	g_assert_cmpuint(gpiod_line_offset(line), ==, 4);
 
 	ret = gpiod_line_event_read(line, &ev);
@@ -597,8 +609,8 @@ GPIOD_TEST_CASE(get_fd_when_values_requested, 0, { 8 })
 
 GPIOD_TEST_CASE(request_bulk_fail, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
 	struct gpiod_line *line;
 	gint ret, i;
 
@@ -613,14 +625,18 @@ GPIOD_TEST_CASE(request_bulk_fail, 0, { 8 })
 	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, 0);
 
+	bulk = gpiod_line_bulk_new(8);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
 	for (i = 0; i < 8; i++) {
 		line = gpiod_chip_get_line(chip, i);
 		g_assert_nonnull(line);
 		gpiod_test_return_if_failed();
-		gpiod_line_bulk_add(&bulk, line);
+		gpiod_line_bulk_add_line(bulk, line);
 	}
 
-	ret = gpiod_line_request_bulk_both_edges_events(&bulk,
+	ret = gpiod_line_request_bulk_both_edges_events(bulk,
 							GPIOD_TEST_CONSUMER);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EBUSY);
@@ -628,9 +644,9 @@ GPIOD_TEST_CASE(request_bulk_fail, 0, { 8 })
 
 GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) ev_bulk = NULL;
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
-	struct gpiod_line_bulk ev_bulk;
 	struct timespec ts = { 1, 0 };
 	struct gpiod_line *line;
 	gint ret, fd;
@@ -653,13 +669,18 @@ GPIOD_TEST_CASE(invalid_fd, 0, { 8 })
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 
+	bulk = gpiod_line_bulk_new(1);
+	ev_bulk = gpiod_line_bulk_new(1);
+	g_assert_nonnull(bulk);
+	g_assert_nonnull(ev_bulk);
+
 	/*
 	 * The single line variant calls gpiod_line_event_wait_bulk() with the
 	 * event_bulk argument set to NULL, so test this use case explicitly
 	 * as well.
 	 */
-	gpiod_line_bulk_add(&bulk, line);
-	ret = gpiod_line_event_wait_bulk(&bulk, &ts, &ev_bulk);
+	gpiod_line_bulk_add_line(bulk, line);
+	ret = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 }
diff --git a/tests/tests-iter.c b/tests/tests-iter.c
index 8deee8e..18263af 100644
--- a/tests/tests-iter.c
+++ b/tests/tests-iter.c
@@ -121,3 +121,29 @@ GPIOD_TEST_CASE(line_iter, 0, { 8 })
 
 	g_assert_cmpuint(i, ==, 8);
 }
+
+GPIOD_TEST_CASE(line_bulk_iter, 0, { 4 })
+{
+	g_autoptr(gpiod_line_bulk_iter_struct) iter = NULL;
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line *line;
+	gint i = 0;
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	bulk = gpiod_chip_get_all_lines(chip);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	iter = gpiod_line_bulk_iter_new(bulk);
+	g_assert_nonnull(iter);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_iter_foreach_line(iter, line)
+		g_assert_cmpint(i++, ==, gpiod_line_offset(line));
+
+	g_assert_cmpint(i, ==, 4);
+}
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 334046f..4a322b5 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -107,9 +107,10 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
 
 GPIOD_TEST_CASE(request_bulk_output, 0, { 8, 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulkA = NULL;
+	g_autoptr(gpiod_line_bulk_struct) bulkB = NULL;
 	g_autoptr(gpiod_chip_struct) chipA = NULL;
 	g_autoptr(gpiod_chip_struct) chipB = NULL;
-	struct gpiod_line_bulk bulkB = GPIOD_LINE_BULK_INITIALIZER, bulkA;
 	struct gpiod_line *lineA0, *lineA1, *lineA2, *lineA3,
 			  *lineB0, *lineB1, *lineB2, *lineB3;
 	gint valA[4], valB[4], ret;
@@ -139,21 +140,26 @@ GPIOD_TEST_CASE(request_bulk_output, 0, { 8, 8 })
 	g_assert_nonnull(lineB3);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_init(&bulkA);
-	gpiod_line_bulk_add(&bulkA, lineA0);
-	gpiod_line_bulk_add(&bulkA, lineA1);
-	gpiod_line_bulk_add(&bulkA, lineA2);
-	gpiod_line_bulk_add(&bulkA, lineA3);
-	gpiod_line_bulk_add(&bulkB, lineB0);
-	gpiod_line_bulk_add(&bulkB, lineB1);
-	gpiod_line_bulk_add(&bulkB, lineB2);
-	gpiod_line_bulk_add(&bulkB, lineB3);
+	bulkA = gpiod_line_bulk_new(4);
+	bulkB = gpiod_line_bulk_new(4);
+	g_assert_nonnull(bulkA);
+	g_assert_nonnull(bulkB);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulkA, lineA0);
+	gpiod_line_bulk_add_line(bulkA, lineA1);
+	gpiod_line_bulk_add_line(bulkA, lineA2);
+	gpiod_line_bulk_add_line(bulkA, lineA3);
+	gpiod_line_bulk_add_line(bulkB, lineB0);
+	gpiod_line_bulk_add_line(bulkB, lineB1);
+	gpiod_line_bulk_add_line(bulkB, lineB2);
+	gpiod_line_bulk_add_line(bulkB, lineB3);
 
 	valA[0] = 1;
 	valA[1] = 0;
 	valA[2] = 0;
 	valA[3] = 1;
-	ret = gpiod_line_request_bulk_output(&bulkA,
+	ret = gpiod_line_request_bulk_output(bulkA,
 					     GPIOD_TEST_CONSUMER, valA);
 	g_assert_cmpint(ret, ==, 0);
 
@@ -161,7 +167,7 @@ GPIOD_TEST_CASE(request_bulk_output, 0, { 8, 8 })
 	valB[1] = 1;
 	valB[2] = 0;
 	valB[3] = 1;
-	ret = gpiod_line_request_bulk_output(&bulkB,
+	ret = gpiod_line_request_bulk_output(bulkB,
 					     GPIOD_TEST_CONSUMER, valB);
 	g_assert_cmpint(ret, ==, 0);
 
@@ -178,11 +184,11 @@ GPIOD_TEST_CASE(request_bulk_output, 0, { 8, 8 })
 
 GPIOD_TEST_CASE(request_bulk_different_chips, 0, { 8, 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chipA = NULL;
 	g_autoptr(gpiod_chip_struct) chipB = NULL;
 	struct gpiod_line *lineA0, *lineA1, *lineB0, *lineB1;
 	struct gpiod_line_request_config req;
-	struct gpiod_line_bulk bulk;
 	gint ret;
 
 	chipA = gpiod_chip_open(gpiod_test_chip_path(0));
@@ -202,25 +208,28 @@ GPIOD_TEST_CASE(request_bulk_different_chips, 0, { 8, 8 })
 	g_assert_nonnull(lineB1);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, lineA0);
-	gpiod_line_bulk_add(&bulk, lineA1);
-	gpiod_line_bulk_add(&bulk, lineB0);
-	gpiod_line_bulk_add(&bulk, lineB1);
+	bulk = gpiod_line_bulk_new(4);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, lineA0);
+	gpiod_line_bulk_add_line(bulk, lineA1);
+	gpiod_line_bulk_add_line(bulk, lineB0);
+	gpiod_line_bulk_add_line(bulk, lineB1);
 
 	req.consumer = GPIOD_TEST_CONSUMER;
 	req.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
 	req.flags = GPIOD_LINE_ACTIVE_STATE_HIGH;
 
-	ret = gpiod_line_request_bulk(&bulk, &req, NULL);
+	ret = gpiod_line_request_bulk(bulk, &req, NULL);
 	g_assert_cmpint(ret, ==, -1);
 	g_assert_cmpint(errno, ==, EINVAL);
 }
 
 GPIOD_TEST_CASE(request_null_default_vals_for_output, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
 	struct gpiod_line *line0, *line1, *line2;
 	gint ret;
 
@@ -237,11 +246,15 @@ GPIOD_TEST_CASE(request_null_default_vals_for_output, 0, { 8 })
 	g_assert_nonnull(line2);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_add(&bulk, line0);
-	gpiod_line_bulk_add(&bulk, line1);
-	gpiod_line_bulk_add(&bulk, line2);
+	bulk = gpiod_line_bulk_new(3);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, line0);
+	gpiod_line_bulk_add_line(bulk, line1);
+	gpiod_line_bulk_add_line(bulk, line2);
 
-	ret = gpiod_line_request_bulk_output(&bulk, GPIOD_TEST_CONSUMER, NULL);
+	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, NULL);
 	g_assert_cmpint(ret, ==, 0);
 
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
@@ -277,8 +290,8 @@ GPIOD_TEST_CASE(set_value, 0, { 8 })
 
 GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
 	struct gpiod_line *line0, *line1, *line2;
 	int values[3];
 	gint ret;
@@ -296,15 +309,19 @@ GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
 	g_assert_nonnull(line2);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_add(&bulk, line0);
-	gpiod_line_bulk_add(&bulk, line1);
-	gpiod_line_bulk_add(&bulk, line2);
+	bulk = gpiod_line_bulk_new(3);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, line0);
+	gpiod_line_bulk_add_line(bulk, line1);
+	gpiod_line_bulk_add_line(bulk, line2);
 
 	values[0] = 0;
 	values[1] = 1;
 	values[2] = 2;
 
-	ret = gpiod_line_request_bulk_output(&bulk,
+	ret = gpiod_line_request_bulk_output(bulk,
 			GPIOD_TEST_CONSUMER, values);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
@@ -315,13 +332,13 @@ GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
 	values[1] = 1;
 	values[2] = 0;
 
-	ret = gpiod_line_set_value_bulk(&bulk, values);
+	ret = gpiod_line_set_value_bulk(bulk, values);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
-	ret = gpiod_line_set_value_bulk(&bulk, NULL);
+	ret = gpiod_line_set_value_bulk(bulk, NULL);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 0), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
@@ -330,8 +347,8 @@ GPIOD_TEST_CASE(set_value_bulk, 0, { 8 })
 
 GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
 	struct gpiod_line *line0, *line1, *line2;
 	gint ret;
 
@@ -348,11 +365,15 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	g_assert_nonnull(line2);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_add(&bulk, line0);
-	gpiod_line_bulk_add(&bulk, line1);
-	gpiod_line_bulk_add(&bulk, line2);
+	bulk = gpiod_line_bulk_new(3);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, line0);
+	gpiod_line_bulk_add_line(bulk, line1);
+	gpiod_line_bulk_add_line(bulk, line2);
 
-	ret = gpiod_line_request_bulk_output(&bulk, GPIOD_TEST_CONSUMER, 0);
+	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, 0);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_active_state(line0), ==,
 			GPIOD_LINE_ACTIVE_STATE_HIGH);
@@ -364,7 +385,7 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
-	ret = gpiod_line_set_config_bulk(&bulk,
+	ret = gpiod_line_set_config_bulk(bulk,
 			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
 			GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, NULL);
 	g_assert_cmpint(ret, ==, 0);
@@ -378,7 +399,7 @@ GPIOD_TEST_CASE(set_config_bulk_null_values, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
-	ret = gpiod_line_set_config_bulk(&bulk,
+	ret = gpiod_line_set_config_bulk(bulk,
 			GPIOD_LINE_REQUEST_DIRECTION_OUTPUT, 0, NULL);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_active_state(line0), ==,
@@ -527,8 +548,8 @@ GPIOD_TEST_CASE(set_direction, 0, { 8 })
 
 GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
 	struct gpiod_line *line0, *line1, *line2;
 	int values[3];
 	gint ret;
@@ -546,15 +567,19 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 	g_assert_nonnull(line2);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_add(&bulk, line0);
-	gpiod_line_bulk_add(&bulk, line1);
-	gpiod_line_bulk_add(&bulk, line2);
+	bulk = gpiod_line_bulk_new(3);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, line0);
+	gpiod_line_bulk_add_line(bulk, line1);
+	gpiod_line_bulk_add_line(bulk, line2);
 
 	values[0] = 0;
 	values[1] = 1;
 	values[2] = 2;
 
-	ret = gpiod_line_request_bulk_output(&bulk,
+	ret = gpiod_line_request_bulk_output(bulk,
 			GPIOD_TEST_CONSUMER, values);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line0), ==,
@@ -567,7 +592,7 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
-	ret = gpiod_line_set_direction_input_bulk(&bulk);
+	ret = gpiod_line_set_direction_input_bulk(bulk);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line0), ==,
 			GPIOD_LINE_DIRECTION_INPUT);
@@ -580,7 +605,7 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 	values[1] = 1;
 	values[2] = 0;
 
-	ret = gpiod_line_set_direction_output_bulk(&bulk, values);
+	ret = gpiod_line_set_direction_output_bulk(bulk, values);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -592,7 +617,7 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 1), ==, 1);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
-	ret = gpiod_line_set_direction_output_bulk(&bulk, NULL);
+	ret = gpiod_line_set_direction_output_bulk(bulk, NULL);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_line_direction(line0), ==,
 			GPIOD_LINE_DIRECTION_OUTPUT);
@@ -607,9 +632,9 @@ GPIOD_TEST_CASE(set_direction_bulk, 0, { 8 })
 
 GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
-	struct gpiod_line_bulk bulk;
 	gint ret;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(0));
@@ -662,9 +687,12 @@ GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 1);
 
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line);
-	ret = gpiod_line_set_value_bulk(&bulk, NULL);
+	bulk = gpiod_line_bulk_new(1);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, line);
+	ret = gpiod_line_set_value_bulk(bulk, NULL);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 
@@ -673,54 +701,6 @@ GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 }
 
-GPIOD_TEST_CASE(get_value_different_chips, 0, { 8, 8 })
-{
-	g_autoptr(gpiod_chip_struct) chipA = NULL;
-	g_autoptr(gpiod_chip_struct) chipB = NULL;
-	struct gpiod_line *lineA0, *lineA1, *lineB0, *lineB1;
-	struct gpiod_line_bulk bulkA, bulkB, bulk;
-	gint ret, vals[4];
-
-	chipA = gpiod_chip_open(gpiod_test_chip_path(0));
-	chipB = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chipA);
-	g_assert_nonnull(chipB);
-	gpiod_test_return_if_failed();
-
-	lineA0 = gpiod_chip_get_line(chipA, 3);
-	lineA1 = gpiod_chip_get_line(chipA, 4);
-	lineB0 = gpiod_chip_get_line(chipB, 5);
-	lineB1 = gpiod_chip_get_line(chipB, 6);
-
-	g_assert_nonnull(lineA0);
-	g_assert_nonnull(lineA1);
-	g_assert_nonnull(lineB0);
-	g_assert_nonnull(lineB1);
-	gpiod_test_return_if_failed();
-
-	gpiod_line_bulk_init(&bulkA);
-	gpiod_line_bulk_init(&bulkB);
-	gpiod_line_bulk_init(&bulk);
-
-	gpiod_line_bulk_add(&bulkA, lineA0);
-	gpiod_line_bulk_add(&bulkA, lineA1);
-	gpiod_line_bulk_add(&bulkB, lineB0);
-	gpiod_line_bulk_add(&bulkB, lineB1);
-	gpiod_line_bulk_add(&bulk, lineA0);
-	gpiod_line_bulk_add(&bulk, lineA1);
-	gpiod_line_bulk_add(&bulk, lineB0);
-	gpiod_line_bulk_add(&bulk, lineB1);
-
-	ret = gpiod_line_request_bulk_input(&bulkA, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-	ret = gpiod_line_request_bulk_input(&bulkB, GPIOD_TEST_CONSUMER);
-	g_assert_cmpint(ret, ==, 0);
-
-	ret = gpiod_line_get_value_bulk(&bulk, vals);
-	g_assert_cmpint(ret, ==, -1);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
 GPIOD_TEST_CASE(get_line_helper, 0, { 16, 16, 32, 16 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
@@ -1094,8 +1074,8 @@ GPIOD_TEST_CASE(multiple_bias_flags, 0, { 8 })
 /* Verify that the reference counting of the line fd handle works correctly. */
 GPIOD_TEST_CASE(release_one_use_another, 0, { 8 })
 {
+	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk;
 	struct gpiod_line *line0;
 	struct gpiod_line *line1;
 	gint ret, vals[2];
@@ -1110,13 +1090,16 @@ GPIOD_TEST_CASE(release_one_use_another, 0, { 8 })
 	g_assert_nonnull(line1);
 	gpiod_test_return_if_failed();
 
-	gpiod_line_bulk_init(&bulk);
-	gpiod_line_bulk_add(&bulk, line0);
-	gpiod_line_bulk_add(&bulk, line1);
+	bulk = gpiod_line_bulk_new(2);
+	g_assert_nonnull(bulk);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_add_line(bulk, line0);
+	gpiod_line_bulk_add_line(bulk, line1);
 
 	vals[0] = vals[1] = 1;
 
-	ret = gpiod_line_request_bulk_output(&bulk, GPIOD_TEST_CONSUMER, vals);
+	ret = gpiod_line_request_bulk_output(bulk, GPIOD_TEST_CONSUMER, vals);
 	g_assert_cmpint(ret, ==, 0);
 
 	gpiod_line_release(line0);
@@ -1197,39 +1180,3 @@ GPIOD_TEST_CASE(empty_consumer, 0, { 8 })
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpstr(gpiod_line_consumer(line), ==, "?");
 }
-
-GPIOD_TEST_CASE(bulk_foreach, GPIOD_TEST_FLAG_NAMED_LINES, { 8 })
-{
-	static const gchar *const line_names[] = { "gpio-mockup-A-0",
-						   "gpio-mockup-A-1",
-						   "gpio-mockup-A-2",
-						   "gpio-mockup-A-3" };
-
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk bulk = GPIOD_LINE_BULK_INITIALIZER;
-	struct gpiod_line *line, **lineptr;
-	gint i;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	for (i = 0; i < 4; i++) {
-		line = gpiod_chip_get_line(chip, i);
-		g_assert_nonnull(line);
-		gpiod_test_return_if_failed();
-
-		gpiod_line_bulk_add(&bulk, line);
-	}
-
-	i = 0;
-	gpiod_line_bulk_foreach_line(&bulk, line, lineptr)
-		g_assert_cmpstr(gpiod_line_name(line), ==, line_names[i++]);
-
-	i = 0;
-	gpiod_line_bulk_foreach_line(&bulk, line, lineptr) {
-		g_assert_cmpstr(gpiod_line_name(line), ==, line_names[i++]);
-		if (i == 2)
-			break;
-	}
-}
-- 
2.28.0

