Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DA233271B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCIN0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhCIN0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:43 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7758DC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:43 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id e10so15512774wro.12
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JEE7qYHc4u6/CS6KJ9UlT6fiBdwtYetmHSPTpvx0RNI=;
        b=z2wa/vfnF/yGzD9Bo342WBiGhWzw112Qc4WQsBaPVU9FYtg4YKglUyki9pFrwi0ttb
         8hMpWG+Km8oVUZ1emIcaIbbT8UdrHRfSNudbgQKokEF3A2ohXSNkqaL0Xt2lte7x5PcP
         IFxSvmrElod6c9EM3WQr0sEnhsPj5mBAJg52Z4TBTB/Pgl9cUr954on/IctuPnOfoFt9
         Xvr3zInhv53i3d7GSQ0z9MjBO5VYk6BRY0pj4As9ZVyrvFr3vflbMZD1G1ymTrQtqkrq
         ik+wjOFBFRv+5wnKNUPcVsa8IIm7KEZ6bnBpumK1fpJnFMzQWk6rc1NHfLxeT4fFEv6P
         RSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JEE7qYHc4u6/CS6KJ9UlT6fiBdwtYetmHSPTpvx0RNI=;
        b=r1qr9AbTNugq0t9ANT5vVVg/8dDHZUXZKHCkxQVvymd3nWpRGyub/Weq0OJkWL86Bd
         U5GJIfKpIA3MnmRJOJbccMiJUz9M9d1NUOnV1FeyEinm98yKcgy1FMCx4RalpztLvZsY
         UUnZMNyB6t3Elcr+FPFL7yCcgg1XfyP1GqIwR30X5tzyv2r6W5VHPGrgoJuQwkbSUSZI
         F9vrTk9xx6FHsOIXrzhLz9PARk+vilLtRLxCRwqs7P/wu7zmsYowErJvIwCCdeBU2GkX
         WukesqGP+SatttvpWzkSY7IkUvyqIc6obl1FDfvbOqOAeQJ3w/x5y/NRfAfahkIkTCWV
         WIRw==
X-Gm-Message-State: AOAM532UhLadaAawwnyW+XQlTOj2YFDpXuIoPbIQh6vKN2gTTgfX2IcO
        U0FdH+9emOCyIOVKGRWOsHqldw==
X-Google-Smtp-Source: ABdhPJwGWHervEmgXvH1F0F+IznEXKGIo5VBfvvKF6I4MofC+7dserQnvu5LQIpfae5YBoT03oXqGg==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr28087229wrm.87.1615296402146;
        Tue, 09 Mar 2021 05:26:42 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 1/6] treewide: simplify line lookup
Date:   Tue,  9 Mar 2021 14:26:34 +0100
Message-Id: <20210309132639.29069-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
References: <20210309132639.29069-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're preparing to entirely remove the line objects from the API and
split their functionality between two new objects: line_info and
line_request. The lookup functions must be limited in the process.

This reworks all the find_line methods to: a) always assume that names
looked for are unique within a single chip (because while it's
technically possible for GPIO line names to be non-unique, it doesn't
make sense to look for two lines named the same) and b) return the
hardware offset within the chip instead of the line object.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp                  | 14 +++----
 bindings/cxx/examples/gpiofindcxx.cpp  |  7 ++--
 bindings/cxx/gpiod.hpp                 | 15 +++----
 bindings/cxx/tests/tests-chip.cpp      |  6 +--
 bindings/python/examples/gpiofind.py   |  7 ++--
 bindings/python/gpiodmodule.c          | 51 ++++++++---------------
 bindings/python/tests/gpiod_py_test.py |  9 ++--
 include/gpiod.h                        | 28 +++----------
 lib/helpers.c                          | 57 +++-----------------------
 tests/tests-chip.c                     | 17 +++++---
 tools/gpiofind.c                       |  9 ++--
 11 files changed, 66 insertions(+), 154 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 5b8125b..527fb34 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -92,22 +92,18 @@ line chip::get_line(unsigned int offset) const
 	return line(line_handle, *this);
 }
 
-::std::vector<line> chip::find_line(const ::std::string& name, bool unique) const
+int chip::find_line(const ::std::string& name) const
 {
 	this->throw_if_noref();
 
-	::std::vector<line> lines;
+	for (unsigned int offset = 0; offset < this->num_lines(); offset++) {
+		auto line = this->get_line(offset);
 
-	for (auto& line: ::gpiod::line_iter(*this)) {
 		if (line.name() == name)
-			lines.push_back(line);
+			return offset;
 	}
 
-	if (unique && lines.size() > 1)
-		throw ::std::system_error(ERANGE, ::std::system_category(),
-					  "multiple lines with the same name found");
-
-	return lines;
+	return -1;
 }
 
 line_bulk chip::get_lines(const ::std::vector<unsigned int>& offsets) const
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index 0bccd94..ec4d79b 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -20,10 +20,9 @@ int main(int argc, char **argv)
 		if (::gpiod::is_gpiochip_device(entry.path())) {
 			::gpiod::chip chip(entry.path());
 
-			auto lines = chip.find_line(argv[1], true);
-			if (!lines.empty()) {
-				::std::cout << lines.front().name() << " " <<
-					       lines.front().offset() << ::std::endl;
+			auto offset = chip.find_line(argv[1]);
+			if (offset >= 0) {
+				::std::cout << chip.name() << " " << offset << ::std::endl;
 				return EXIT_SUCCESS;
 			}
 		}
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index d987b3a..3a043a1 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -129,15 +129,12 @@ public:
 	GPIOD_API line get_line(unsigned int offset) const;
 
 	/**
-	 * @brief Find all GPIO lines by name among lines exposed by this GPIO
-	 *        chip.
-	 * @param name Line name.
-	 * @param unique If set to true: throw an error if multiple lines match
-	 *               the name.
-	 * @return Vector of all matching lines.
-	 */
-	GPIOD_API ::std::vector<line> find_line(const ::std::string& name,
-						bool unique = false) const;
+	 * @brief Map a GPIO line's name to its offset within the chip.
+	 * @param name Name of the GPIO line to map.
+	 * @return Offset of the line within the chip or -1 if a line with
+	 *         given name is not exposed by the chip.
+	 */
+	GPIOD_API int find_line(const ::std::string& name) const;
 
 	/**
 	 * @brief Get a set of lines exposed by this chip at given offsets.
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index a84b150..aea00fa 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -113,8 +113,8 @@ TEST_CASE("Lines can be retrieved from chip objects", "[chip]")
 
 	SECTION("find single line by name")
 	{
-		auto line = chip.find_line("gpio-mockup-B-3", true).front();
-		REQUIRE(line.offset() == 3);
+		auto offset = chip.find_line("gpio-mockup-B-3");
+		REQUIRE(offset == 3);
 	}
 
 	SECTION("get multiple lines by offsets")
@@ -168,6 +168,6 @@ TEST_CASE("Errors occurring when retrieving lines are correctly reported", "[chi
 
 	SECTION("line not found by name")
 	{
-		REQUIRE(chip.find_line("nonexistent-line").empty());
+		REQUIRE(chip.find_line("nonexistent-line") == -1);
 	}
 }
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
index 117d583..a9ec734 100755
--- a/bindings/python/examples/gpiofind.py
+++ b/bindings/python/examples/gpiofind.py
@@ -12,10 +12,9 @@ if __name__ == '__main__':
     for entry in os.scandir('/dev/'):
         if gpiod.is_gpiochip_device(entry.path):
             with gpiod.Chip(entry.path) as chip:
-                lines = chip.find_line(sys.argv[1], unique=True)
-                if lines is not None:
-                     line = lines.to_list()[0]
-                     print('{} {}'.format(line.owner().name(), line.offset()))
+                offset = chip.find_line(sys.argv[1], unique=True)
+                if offset is not None:
+                     print('{} {}'.format(line.owner().name(), offset))
                      sys.exit(0)
 
     sys.exit(1)
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index dca6a98..ac0fd83 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -2151,59 +2151,40 @@ gpiod_LineBulkObjectFromBulk(gpiod_ChipObject *chip, struct gpiod_line_bulk *bul
 }
 
 PyDoc_STRVAR(gpiod_Chip_find_line_doc,
-"find_line(name) -> gpiod.LineBulk object or None\n"
+"find_line(name) -> integer or None\n"
 "\n"
-"Find all GPIO lines by name among lines exposed by this GPIO chip..\n"
+"Find the offset of the line with given name among lines exposed by this\n"
+"GPIO chip.\n"
 "\n"
 "  name\n"
 "    Line name (string)\n"
-"  unique\n"
-"    Indicates whether an exception should be raised if more than one lines\n"
-"    matches the name\n"
 "\n"
-"Returns a gpiod.LineBulk object containing all matching lines or None if\n"
-"line with given name is not associated with this chip.");
+"Returns the offset of the line with given name or None if it is not\n"
+"associated with this chip.");
 
-static gpiod_LineBulkObject *
-gpiod_Chip_find_line(gpiod_ChipObject *self, PyObject *args, PyObject *kwds)
+static PyObject *gpiod_Chip_find_line(gpiod_ChipObject *self, PyObject *args)
 {
-	static char *kwlist[] = { "", "unique", NULL };
-
-	gpiod_LineBulkObject *bulk_obj;
-	struct gpiod_line_bulk *bulk;
-	int rv, unique = 0;
 	const char *name;
+	int rv, offset;
 
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	rv = PyArg_ParseTupleAndKeywords(args, kwds, "s|p",
-					 kwlist, &name, &unique);
+	rv = PyArg_ParseTuple(args, "s", &name);
 	if (!rv)
 		return NULL;
 
 	Py_BEGIN_ALLOW_THREADS;
-	bulk = gpiod_chip_find_line(self->chip, name);
+	offset = gpiod_chip_find_line(self->chip, name);
 	Py_END_ALLOW_THREADS;
-	if (!bulk) {
-		if (errno == ENOENT) {
-			Py_INCREF(Py_None);
-			return (gpiod_LineBulkObject *)Py_None;
-		}
-
-		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
-							PyExc_OSError);
-	}
+	if (offset < 0) {
+		if (errno == ENOENT)
+			Py_RETURN_NONE;
 
-	if (unique && gpiod_line_bulk_num_lines(bulk) > 1) {
-		gpiod_line_bulk_free(bulk);
-		PyErr_SetString(PyExc_RuntimeError, "line not unique");
-		return NULL;
+		return PyErr_SetFromErrno(PyExc_OSError);
 	}
 
-	bulk_obj = gpiod_LineBulkObjectFromBulk(self, bulk);
-	gpiod_line_bulk_free(bulk);
-	return bulk_obj;
+	return Py_BuildValue("i", offset);
 }
 
 PyDoc_STRVAR(gpiod_Chip_get_lines_doc,
@@ -2353,8 +2334,8 @@ static PyMethodDef gpiod_Chip_methods[] = {
 	},
 	{
 		.ml_name = "find_line",
-		.ml_meth = (PyCFunction)(void (*)(void))gpiod_Chip_find_line,
-		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_meth = (PyCFunction)gpiod_Chip_find_line,
+		.ml_flags = METH_VARARGS,
 		.ml_doc = gpiod_Chip_find_line_doc,
 	},
 	{
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index f264db3..c8ee85b 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -136,8 +136,9 @@ class ChipGetLines(MockupTestCase):
 
     def test_find_single_line_by_name(self):
         with gpiod.Chip(mockup.chip_path(1)) as chip:
-            lines = chip.find_line('gpio-mockup-B-4', unique=True).to_list()
-            self.assertEqual(lines[0].offset(), 4)
+            offset = chip.find_line('gpio-mockup-B-4')
+            self.assertIsNotNone(offset)
+            self.assertEqual(offset, 4)
 
     def test_get_single_line_invalid_offset(self):
         with gpiod.Chip(mockup.chip_path(1)) as chip:
@@ -148,8 +149,8 @@ class ChipGetLines(MockupTestCase):
 
     def test_find_single_line_nonexistent(self):
         with gpiod.Chip(mockup.chip_path(1)) as chip:
-            lines = chip.find_line('nonexistent-line', unique=True)
-            self.assertEqual(lines, None)
+            offset = chip.find_line('nonexistent-line')
+            self.assertIsNone(offset)
 
     def test_get_multiple_lines_by_offsets_in_tuple(self):
         with gpiod.Chip(mockup.chip_path(1)) as chip:
diff --git a/include/gpiod.h b/include/gpiod.h
index 76aa1dd..6ed9c6c 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -136,31 +136,13 @@ struct gpiod_line_bulk *
 gpiod_chip_get_all_lines(struct gpiod_chip *chip) GPIOD_API;
 
 /**
- * @brief Find all GPIO lines by name among lines exposed by this GPIO chip.
+ * @brief Map a GPIO line's name to its offset within the chip.
  * @param chip The GPIO chip object.
- * @param name GPIO line name to look for.
- * @return New line bulk object containing all matching lines or NULL on error.
- *
- * If no line with given name is associated with this chip, the function sets
- * errno to ENOENT.
- */
-struct gpiod_line_bulk *
-gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
-
-/**
- * @brief Find a unique line by name among lines exposed by this GPIO chip.
- * @param chip The GPIO chip object.
- * @param name Name of the GPIO line.
- * @return Pointer to the GPIO line handle or NULL if the line could not be
- *         found or an error occurred.
- *
- * If no line with given name is associated with this chip, the function sets
- * errno to ENOENT. If more than one line with given name is associated with
- * this chip, the function sets errno to ERANGE.
+ * @param name Name of the GPIO line to map.
+ * @return Offset of the line within the chip or -1 if a line with given name
+ *         is not exposed by the chip.
  */
-struct gpiod_line *
-gpiod_chip_find_line_unique(struct gpiod_chip *chip,
-			    const char *name) GPIOD_API;
+int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
 
 /**
  * @}
diff --git a/lib/helpers.c b/lib/helpers.c
index 0071a2d..76d8fc2 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -59,10 +59,8 @@ struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 	return bulk;
 }
 
-struct gpiod_line_bulk *
-gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
+int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
-	struct gpiod_line_bulk *bulk = NULL;
 	unsigned int offset, num_lines;
 	struct gpiod_line *line;
 	const char *tmp;
@@ -70,62 +68,17 @@ gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 	num_lines = gpiod_chip_num_lines(chip);
 
 	for (offset = 0; offset < num_lines; offset++) {
-		line = gpiod_chip_get_line(chip, offset);
-		if (!line) {
-			if (bulk)
-				gpiod_line_bulk_free(bulk);
-
-			return NULL;
-		}
-
-		tmp = gpiod_line_name(line);
-		if (tmp && strcmp(tmp, name) == 0) {
-			if (!bulk) {
-				bulk = gpiod_line_bulk_new(num_lines);
-				if (!bulk)
-					return NULL;
-			}
-
-			gpiod_line_bulk_add_line(bulk, line);
-		}
-	}
-
-	if (!bulk)
-		errno = ENOENT;
-
-	return bulk;
-}
-
-struct gpiod_line *
-gpiod_chip_find_line_unique(struct gpiod_chip *chip, const char *name)
-{
-	struct gpiod_line *line, *matching = NULL;
-	unsigned int offset, num_found = 0;
-	const char *tmp;
-
-	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
 		line = gpiod_chip_get_line(chip, offset);
 		if (!line)
-			return NULL;
+			return -1;
 
 		tmp = gpiod_line_name(line);
-		if (tmp && strcmp(tmp, name) == 0) {
-			matching = line;
-			num_found++;
-		}
-	}
-
-	if (matching) {
-		if (num_found > 1) {
-			errno = ERANGE;
-			return NULL;
-		}
-
-		return matching;
+		if (tmp && strcmp(tmp, name) == 0)
+			return gpiod_line_offset(line);
 	}
 
 	errno = ENOENT;
-	return NULL;
+	return -1;
 }
 
 int gpiod_line_request_input(struct gpiod_line *line, const char *consumer)
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 928dc49..a87dc9a 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -190,19 +190,24 @@ GPIOD_TEST_CASE(get_all_lines, 0, { 4 })
 	g_assert_cmpuint(gpiod_line_offset(line3), ==, 3);
 }
 
-GPIOD_TEST_CASE(find_line_good_unique, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
+GPIOD_TEST_CASE(find_line_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
 	struct gpiod_line *line;
+	int offset;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(1));
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	line = gpiod_chip_find_line_unique(chip, "gpio-mockup-B-4");
+	offset = gpiod_chip_find_line(chip, "gpio-mockup-B-4");
+	g_assert_cmpint(offset, ==, 4);
+	gpiod_test_return_if_failed();
+
+	line = gpiod_chip_get_line(chip, 4);
 	g_assert_nonnull(line);
 	gpiod_test_return_if_failed();
-	g_assert_cmpuint(gpiod_line_offset(line), ==, 4);
+
 	g_assert_cmpstr(gpiod_line_name(line), ==, "gpio-mockup-B-4");
 }
 
@@ -210,13 +215,13 @@ GPIOD_TEST_CASE(find_line_unique_not_found,
 		GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
+	int offset;
 
 	chip = gpiod_chip_open(gpiod_test_chip_path(1));
 	g_assert_nonnull(chip);
 	gpiod_test_return_if_failed();
 
-	line = gpiod_chip_find_line_unique(chip, "nonexistent");
-	g_assert_null(line);
+	offset = gpiod_chip_find_line(chip, "nonexistent");
+	g_assert_cmpint(offset, ==, -1);
 	g_assert_cmpint(errno, ==, ENOENT);
 }
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 4936c4f..0fc07d9 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -31,9 +31,8 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	int i, num_chips, optc, opti;
+	int i, num_chips, optc, opti, offset;
 	struct gpiod_chip *chip;
-	struct gpiod_line *line;
 	struct dirent **entries;
 
 	for (;;) {
@@ -74,10 +73,10 @@ int main(int argc, char **argv)
 			die_perror("unable to open %s", entries[i]->d_name);
 		}
 
-		line = gpiod_chip_find_line_unique(chip, argv[0]);
-		if (line) {
+		offset = gpiod_chip_find_line(chip, argv[0]);
+		if (offset >= 0) {
 			printf("%s %u\n",
-			       gpiod_chip_name(chip), gpiod_line_offset(line));
+			       gpiod_chip_name(chip), offset);
 			gpiod_chip_close(chip);
 			return EXIT_SUCCESS;
 		}
-- 
2.30.1

