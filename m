Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41252D5BA0
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732921AbgLJNYl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389204AbgLJNY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C293C0611CA
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:38 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c5so1838357wrp.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VpRsQjpStu4l6nV3G4ZMof8VlEvMdxIOr8Ajegvbtvg=;
        b=vDfX7deGunILG+8qKkgrD52Tw4fUaV2pvWi54/HdsZsKzYzZVetz5T5OM3rjg0H8At
         6BWIYRHu3KCBNS4MVVld2FB6n9USH1oGWgsWPaDiJKY1W9eh2Y7vodIN4upv+4a0tuZo
         DoEA7R5C11y/AwX9nXkp+Se2msDKN3jDBbgyarxYhhqNPwzZyA4Fx5Cl7jD+5UekFBGT
         OCDeqfmW46NZOsfPs/6LsdaJPIOf5xe5qSkAkclXK6g9P3dWQ+GsPpYbMZDEqmM0sJh/
         nfxzkV6DsWTWfb+BQdHrYgVJWpQ9JeyEJtj875to0B9P2PJndQdQpWIHLcocRt6zveMy
         PRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VpRsQjpStu4l6nV3G4ZMof8VlEvMdxIOr8Ajegvbtvg=;
        b=fvK1JRZ86gTXsfkXokm64LcVRyMgW3z4Cd0tdy6TsY/7gUzAIxprCKeL/QgjPcN+b6
         hrgbPvlEkV08OmF9WfB6RkJ+QJJxp6TIQI+rilCu8bq2TPIUc4Au41DWgf42FnLojCLM
         nDBNYljvBFiHNwn6cwTC2u8jZtmH1Vnb/ljO/F97TBHhmvN5/SjXACaUIIO1HjFeX0Lo
         kDMZ9TEK6VaAAvs4NQjRMokaY8qm/wCS8dPjj4uMOhFMZwhYBDU6lWRcTER8GDYWGSSi
         nx4pw+foc0tFgWHz7cpUpcUff+7BYbmSaWHwlVg53dNeYyTKkuD5CUS/VSdXX4TG5jtU
         jZOQ==
X-Gm-Message-State: AOAM533wfFOP8A9r+yubfhlCvBzfz0bjp9UEBfon20SxFyvzT6p7ZlYQ
        SAw/mLvu5VIYXLY/0hi4pnReOA==
X-Google-Smtp-Source: ABdhPJzbeKZxev3MLCZTkeVR2iPpbJJ7P2Q5caSMxHfHjQSGnLjKQggw+o/03gx5hIRZyx6He3iozQ==
X-Received: by 2002:a5d:60c1:: with SMTP id x1mr3071839wrt.271.1607606617047;
        Thu, 10 Dec 2020 05:23:37 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:36 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 12/14] core: rework gpiod_chip_find_line()
Date:   Thu, 10 Dec 2020 14:23:13 +0100
Message-Id: <20201210132315.5785-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

GPIO line names are not unique and the library has been incorrectly
making such assumption in v1.x series. We've already dropped interfaces
that would be too complicated to maintain when taking this into account.

Let's now rework the remaming API. This introduces a new function to the
C API: gpiod_chip_find_line_unique() which assumes that the line name is
unique and signals an error if it's not. The previous
gpiod_chip_find_line() function now returns a bulk object containing all
matching lines.

Python and C++ bindings are updated: their find_line() functions return
bulk objects (or an ::std::vector> too now and they take an additional
argument specifying whether we're looking for a unique line or not.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp                  |  18 ++-
 bindings/cxx/examples/gpiofindcxx.cpp  |   6 +-
 bindings/cxx/gpiod.hpp                 |  10 +-
 bindings/cxx/tests/tests-chip.cpp      |   4 +-
 bindings/python/gpiodmodule.c          | 150 ++++++++++++++-----------
 bindings/python/tests/gpiod_py_test.py |   9 +-
 include/gpiod.h                        |  28 +++--
 lib/helpers.c                          |  57 +++++++++-
 tests/tests-chip.c                     |   9 +-
 tools/gpiofind.c                       |   2 +-
 10 files changed, 193 insertions(+), 100 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index ff35e53..82ba559 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -122,16 +122,22 @@ line chip::get_line(unsigned int offset) const
 	return line(line_handle, *this);
 }
 
-line chip::find_line(const ::std::string& name) const
+::std::vector<line> chip::find_line(const ::std::string& name, bool unique) const
 {
 	this->throw_if_noref();
 
-	::gpiod_line* handle = ::gpiod_chip_find_line(this->_m_chip.get(), name.c_str());
-	if (!handle && errno != ENOENT)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error looking up GPIO line by name");
+	::std::vector<line> lines;
+
+	for (auto& line: ::gpiod::line_iter(*this)) {
+		if (line.name() == name)
+			lines.push_back(line);
+	}
 
-	return handle ? line(handle, *this) : line();
+	if (unique && lines.size() > 1)
+		throw ::std::system_error(ERANGE, ::std::system_category(),
+					  "multiple lines with the same name found");
+
+	return lines;
 }
 
 line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index e9ab64a..c817378 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -20,9 +20,9 @@ int main(int argc, char **argv)
 	}
 
 	for (auto& chip: ::gpiod::make_chip_iter()) {
-		auto line = chip.find_line(argv[1]);
-		if (line) {
-			::std::cout << line.name() << " " << line.offset() << ::std::endl;
+		auto lines = chip.find_line(argv[1], true);
+		if (!lines.empty()) {
+			::std::cout << lines.front().name() << " " << lines.front().offset() << ::std::endl;
 			return EXIT_SUCCESS;
 		}
 	}
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index a16a27c..9d081fe 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -127,11 +127,15 @@ public:
 	GPIOD_API line get_line(unsigned int offset) const;
 
 	/**
-	 * @brief Get the line exposed by this chip by name.
+	 * @brief Find all GPIO lines by name among lines exposed by this GPIO
+	 *        chip.
 	 * @param name Line name.
-	 * @return Line object.
+	 * @param unique If set to true: throw an error if multiple lines match
+	 *               the name.
+	 * @return Vector of all matching lines.
 	 */
-	GPIOD_API line find_line(const ::std::string& name) const;
+	GPIOD_API ::std::vector<line> find_line(const ::std::string& name,
+						bool unique = false) const;
 
 	/**
 	 * @brief Get a set of lines exposed by this chip at given offsets.
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 90ebc1b..c45f2df 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -168,7 +168,7 @@ TEST_CASE("Lines can be retrieved from chip objects", "[chip]")
 
 	SECTION("find single line by name")
 	{
-		auto line = chip.find_line("gpio-mockup-B-3");
+		auto line = chip.find_line("gpio-mockup-B-3", true).front();
 		REQUIRE(line.offset() == 3);
 	}
 
@@ -223,6 +223,6 @@ TEST_CASE("Errors occurring when retrieving lines are correctly reported", "[chi
 
 	SECTION("line not found by name")
 	{
-		REQUIRE_FALSE(chip.find_line("nonexistent-line"));
+		REQUIRE(chip.find_line("nonexistent-line").empty());
 	}
 }
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 4948d5d..d183e6f 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -2148,61 +2148,115 @@ gpiod_Chip_get_line(gpiod_ChipObject *self, PyObject *args)
 	return gpiod_MakeLineObject(self, line);
 }
 
+static gpiod_LineBulkObject *gpiod_ListToLineBulk(PyObject *lines)
+{
+	gpiod_LineBulkObject *bulk;
+	PyObject *arg;
+
+	arg = PyTuple_Pack(1, lines);
+	if (!arg)
+		return NULL;
+
+	bulk = (gpiod_LineBulkObject *)PyObject_CallObject(
+					(PyObject *)&gpiod_LineBulkType,
+					arg);
+	Py_DECREF(arg);
+
+	return bulk;
+}
+
+static gpiod_LineBulkObject *
+gpiod_LineBulkObjectFromBulk(gpiod_ChipObject *chip, struct gpiod_line_bulk *bulk)
+{
+	gpiod_LineBulkObject *bulk_obj;
+	gpiod_LineObject *line_obj;
+	struct gpiod_line *line;
+	unsigned int idx;
+	PyObject *list;
+	int rv;
+
+	list = PyList_New(gpiod_line_bulk_num_lines(bulk));
+	if (!list)
+		return NULL;
+
+	for (idx = 0; idx < gpiod_line_bulk_num_lines(bulk); idx++) {
+		line = gpiod_line_bulk_get_line(bulk, idx);
+		line_obj = gpiod_MakeLineObject(chip, line);
+		if (!line_obj) {
+			Py_DECREF(list);
+			return NULL;
+		}
+
+		rv = PyList_SetItem(list, idx, (PyObject *)line_obj);
+		if (rv < 0) {
+			Py_DECREF(line_obj);
+			Py_DECREF(list);
+			return NULL;
+		}
+	}
+
+	bulk_obj = gpiod_ListToLineBulk(list);
+	Py_DECREF(list);
+	if (!bulk_obj)
+		return NULL;
+
+	return bulk_obj;
+}
+
 PyDoc_STRVAR(gpiod_Chip_find_line_doc,
-"find_line(name) -> gpiod.Line object or None\n"
+"find_line(name) -> gpiod.LineBulk object or None\n"
 "\n"
-"Get the GPIO line by name.\n"
+"Find all GPIO lines by name among lines exposed by this GPIO chip..\n"
 "\n"
 "  name\n"
 "    Line name (string)\n"
+"  unique\n"
+"    Indicates whether an exception should be raised if more than one lines\n"
+"    matches the name\n"
 "\n"
-"Returns a gpiod.Line object or None if line with given name is not\n"
-"associated with this chip.");
+"Returns a gpiod.LineBulk object containing all matching lines or None if\n"
+"line with given name is not associated with this chip.");
 
-static gpiod_LineObject *
-gpiod_Chip_find_line(gpiod_ChipObject *self, PyObject *args)
+static gpiod_LineBulkObject *
+gpiod_Chip_find_line(gpiod_ChipObject *self, PyObject *args, PyObject *kwds)
 {
-	struct gpiod_line *line;
+	static char *kwlist[] = { "unique", NULL };
+
+	gpiod_LineBulkObject *bulk_obj;
+	struct gpiod_line_bulk *bulk;
+	int rv, unique = 0;
 	const char *name;
-	int rv;
 
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	rv = PyArg_ParseTuple(args, "s", &name);
+	rv = PyArg_ParseTupleAndKeywords(args, kwds, "s|p",
+					 kwlist, &name, &unique);
 	if (!rv)
 		return NULL;
 
 	Py_BEGIN_ALLOW_THREADS;
-	line = gpiod_chip_find_line(self->chip, name);
+	bulk = gpiod_chip_find_line(self->chip, name);
 	Py_END_ALLOW_THREADS;
-	if (!line) {
+	if (!bulk) {
 		if (errno == ENOENT) {
 			Py_INCREF(Py_None);
-			return (gpiod_LineObject *)Py_None;
+			return (gpiod_LineBulkObject *)Py_None;
 		}
 
-		return (gpiod_LineObject *)PyErr_SetFromErrno(PyExc_OSError);
+		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
+							PyExc_OSError);
 	}
 
-	return gpiod_MakeLineObject(self, line);
-}
-
-static gpiod_LineBulkObject *gpiod_ListToLineBulk(PyObject *lines)
-{
-	gpiod_LineBulkObject *bulk;
-	PyObject *arg;
-
-	arg = PyTuple_Pack(1, lines);
-	if (!arg)
+	if (unique && gpiod_line_bulk_num_lines(bulk) > 1) {
+		gpiod_line_bulk_free(bulk);
+		PyErr_SetString(PyExc_RuntimeError, "line not unique");
 		return NULL;
+	}
 
-	bulk = (gpiod_LineBulkObject *)PyObject_CallObject(
-					(PyObject *)&gpiod_LineBulkType,
-					arg);
-	Py_DECREF(arg);
-
-	return bulk;
+	bulk_obj = gpiod_LineBulkObjectFromBulk(self, bulk);
+	gpiod_line_bulk_free(bulk);
+	return bulk_obj;
 }
 
 PyDoc_STRVAR(gpiod_Chip_get_lines_doc,
@@ -2293,10 +2347,6 @@ gpiod_Chip_get_all_lines(gpiod_ChipObject *self, PyObject *Py_UNUSED(ignored))
 {
 	gpiod_LineBulkObject *bulk_obj;
 	struct gpiod_line_bulk *bulk;
-	gpiod_LineObject *line_obj;
-	unsigned int idx;
-	PyObject *list;
-	int rv;
 
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
@@ -2306,36 +2356,8 @@ gpiod_Chip_get_all_lines(gpiod_ChipObject *self, PyObject *Py_UNUSED(ignored))
 		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
 							PyExc_OSError);
 
-	list = PyList_New(gpiod_line_bulk_num_lines(bulk));
-	if (!list) {
-		gpiod_line_bulk_free(bulk);
-		return NULL;
-	}
-
-	for (idx = 0; idx < gpiod_line_bulk_num_lines(bulk); idx++) {
-		line_obj = gpiod_MakeLineObject(self, gpiod_line_bulk_get_line(bulk, idx));
-		if (!line_obj) {
-			gpiod_line_bulk_free(bulk);
-			Py_DECREF(list);
-			return NULL;
-		}
-
-		rv = PyList_SetItem(list, idx, (PyObject *)line_obj);
-		if (rv < 0) {
-			gpiod_line_bulk_free(bulk);
-			Py_DECREF(line_obj);
-			Py_DECREF(list);
-			return NULL;
-		}
-	}
-
+	bulk_obj = gpiod_LineBulkObjectFromBulk(self, bulk);
 	gpiod_line_bulk_free(bulk);
-
-	bulk_obj = gpiod_ListToLineBulk(list);
-	Py_DECREF(list);
-	if (!bulk_obj)
-		return NULL;
-
 	return bulk_obj;
 }
 
@@ -2384,8 +2406,8 @@ static PyMethodDef gpiod_Chip_methods[] = {
 	},
 	{
 		.ml_name = "find_line",
-		.ml_meth = (PyCFunction)gpiod_Chip_find_line,
-		.ml_flags = METH_VARARGS,
+		.ml_meth = (PyCFunction)(void (*)(void))gpiod_Chip_find_line,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
 		.ml_doc = gpiod_Chip_find_line_doc,
 	},
 	{
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 6ee72a9..c490933 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -149,8 +149,9 @@ class ChipGetLines(MockupTestCase):
 
     def test_find_single_line_by_name(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
-            line = chip.find_line('gpio-mockup-B-4')
-            self.assertEqual(line.offset(), 4)
+            lines = chip.find_line('gpio-mockup-B-4').to_list()
+            self.assertEqual(len(lines), 1)
+            self.assertEqual(lines[0].offset(), 4)
 
     def test_get_single_line_invalid_offset(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
@@ -161,8 +162,8 @@ class ChipGetLines(MockupTestCase):
 
     def test_find_single_line_nonexistent(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
-            line = chip.find_line('nonexistent-line')
-            self.assertEqual(line, None)
+            lines = chip.find_line('nonexistent-line')
+            self.assertEqual(lines, None)
 
     def test_get_multiple_lines_by_offsets_in_tuple(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
diff --git a/include/gpiod.h b/include/gpiod.h
index 34313ed..fc50fe8 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -170,19 +170,31 @@ struct gpiod_line_bulk *
 gpiod_chip_get_all_lines(struct gpiod_chip *chip) GPIOD_API;
 
 /**
- * @brief Find a GPIO line by name among lines associated with given GPIO chip.
+ * @brief Find all GPIO lines by name among lines exposed by this GPIO chip.
  * @param chip The GPIO chip object.
- * @param name The name of the GPIO line.
+ * @param name GPIO line name to look for.
+ * @return New line bulk object containing all matching lines or NULL on error.
+ *
+ * If no line with given name is associated with this chip, the function sets
+ * errno to ENOENT.
+ */
+struct gpiod_line_bulk *
+gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
+
+/**
+ * @brief Find a unique line by name among lines exposed by this GPIO chip.
+ * @param chip The GPIO chip object.
+ * @param name Name of the GPIO line.
  * @return Pointer to the GPIO line handle or NULL if the line could not be
  *         found or an error occurred.
- * @note In case a line with given name is not associated with given chip, the
- *       function sets errno to ENOENT.
- * @attention GPIO line names are not unique in the linux kernel, neither
- *            globally nor within a single chip. This function finds the first
- *            line with given name.
+ *
+ * If no line with given name is associated with this chip, the function sets
+ * errno to ENOENT. If more than one line with given name is associated with
+ * this chip, the function sets errno to ERANGE.
  */
 struct gpiod_line *
-gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
+gpiod_chip_find_line_unique(struct gpiod_chip *chip,
+			    const char *name) GPIOD_API;
 
 /**
  * @}
diff --git a/lib/helpers.c b/lib/helpers.c
index 509a1c8..ec2575d 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -120,11 +120,48 @@ struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 	return bulk;
 }
 
-struct gpiod_line *
+struct gpiod_line_bulk *
 gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
+	struct gpiod_line_bulk *bulk = NULL;
+	unsigned int offset, num_lines;
 	struct gpiod_line *line;
-	unsigned int offset;
+	const char *tmp;
+
+	num_lines = gpiod_chip_num_lines(chip);
+
+	for (offset = 0; offset < num_lines; offset++) {
+		line = gpiod_chip_get_line(chip, offset);
+		if (!line) {
+			if (bulk)
+				gpiod_line_bulk_free(bulk);
+
+			return NULL;
+		}
+
+		tmp = gpiod_line_name(line);
+		if (tmp && strcmp(tmp, name) == 0) {
+			if (!bulk) {
+				bulk = gpiod_line_bulk_new(num_lines);
+				if (!bulk)
+					return NULL;
+			}
+
+			gpiod_line_bulk_add_line(bulk, line);
+		}
+	}
+
+	if (!bulk)
+		errno = ENOENT;
+
+	return bulk;
+}
+
+struct gpiod_line *
+gpiod_chip_find_line_unique(struct gpiod_chip *chip, const char *name)
+{
+	struct gpiod_line *line, *matching = NULL;
+	unsigned int offset, num_found = 0;
 	const char *tmp;
 
 	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
@@ -133,12 +170,22 @@ gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 			return NULL;
 
 		tmp = gpiod_line_name(line);
-		if (tmp && strcmp(tmp, name) == 0)
-			return line;
+		if (tmp && strcmp(tmp, name) == 0) {
+			matching = line;
+			num_found++;
+		}
 	}
 
-	errno = ENOENT;
+	if (matching) {
+		if (num_found > 1) {
+			errno = ERANGE;
+			return NULL;
+		}
 
+		return matching;
+	}
+
+	errno = ENOENT;
 	return NULL;
 }
 
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 543c103..1c365b9 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -235,7 +235,7 @@ GPIOD_TEST_CASE(get_all_lines, 0, { 4 })
 	g_assert_cmpuint(gpiod_line_offset(line3), ==, 3);
 }
 
-GPIOD_TEST_CASE(find_line_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
+GPIOD_TEST_CASE(find_line_good_unique, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
@@ -244,14 +244,15 @@ GPIOD_TEST_CASE(find_line_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	line = gpiod_chip_find_line(chip, "gpio-mockup-B-4");
+	line = gpiod_chip_find_line_unique(chip, "gpio-mockup-B-4");
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
 	g_assert_cmpuint(gpiod_line_offset(line), ==, 4);
 	g_assert_cmpstr(gpiod_line_name(line), ==, "gpio-mockup-B-4");
 }
 
-GPIOD_TEST_CASE(find_line_not_found, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
+GPIOD_TEST_CASE(find_line_unique_not_found,
+		GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
@@ -260,7 +261,7 @@ GPIOD_TEST_CASE(find_line_not_found, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	line = gpiod_chip_find_line(chip, "nonexistent");
+	line = gpiod_chip_find_line_unique(chip, "nonexistent");
 	g_assert_null(line);
 	g_assert_cmpint(errno, ==, ENOENT);
 }
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 489cf33..ffb8fc0 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -69,7 +69,7 @@ int main(int argc, char **argv)
 		die_perror("unable to access GPIO chips");
 
 	gpiod_foreach_chip(iter, chip) {
-		line = gpiod_chip_find_line(chip, argv[0]);
+		line = gpiod_chip_find_line_unique(chip, argv[0]);
 		if (line) {
 			printf("%s %u\n",
 			       gpiod_chip_name(chip), gpiod_line_offset(line));
-- 
2.29.1

