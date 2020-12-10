Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F732D5BA1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387422AbgLJNYq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389202AbgLJNY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:26 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49633C0611C5
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:37 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id c5so1838304wrp.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=18GNKU/1Y/+J0wgsbZwIm+cDoXVzxNcPRSVCNSeVXtQ=;
        b=GUregJZf/3Q/aisrxlR2UkMosGEoB2U1L/eOl4IVmxbBZdpfeM312wT2teJYyF8v/F
         VGWuhs5jbYRw+ky3MES10GTn9+amRvNuLYFCi4GqaQ+IzCUzItDj6ta8f071vFMOEKxW
         ekYv3S2XC0vILMK3jyEcd6eRHMWYycVLDp5Chbcp/wb+JUuYvKHep4wyS3/d79O95tpz
         n+WsmeN+rUytzZgcuZbLcDkwLRmFhSeCdepuuF4aD7eV+YXZHIPIDKKlLKDROxuqoruG
         sRVanF71zEsETo9N52CD8hg6FymkNJfeRwYIvnX/3LUePHExS8KQy4at36roczR8sEnx
         FfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18GNKU/1Y/+J0wgsbZwIm+cDoXVzxNcPRSVCNSeVXtQ=;
        b=gHLlMiw/UCYfDzrDeYQaeW2VIfjmh5/suUHcUm/SxGOF2hexYYnkB9FnhZxGkxtUr9
         iduuDiofgF4ieuzW5REPCRgYSgEJKfg4ruS7IHP2d41JTDwk/edogkHHhuT6i3w9aKxP
         b4B1XBDAj6Xx9despUeER5QbiH5fgyHFliaOdfRLyrdgJUVCU/pUo85A6BQdwnL8KpIo
         qA6Sr/K+ftVrKUD7Hp/zeeB7+tPz04a3f8jbmowqk40k03BVXoEWCS/A+XzrEUr6kz6J
         XWIZC1U2DrJsQT9tHBcrL8rhrhJgVLoeVOxj+/hrKVO6eoYk/ev1ak27gtf1awKmrraR
         M/OQ==
X-Gm-Message-State: AOAM531qB00nUNRGLEo2jSddLiJlC/Im4bR9bpskhrLlqAPEqVbg8WBK
        XJvEGnf9jSNiMaAe1OP8pHgZTMcdEyHzQw==
X-Google-Smtp-Source: ABdhPJzkAIou1IG/eP1RSOol0CPV7Ey33KQwhaZ6zAzaIOYLFqWerKZwUHap6gILyvM4Peru/frvBA==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr8226716wrm.90.1607606616040;
        Thu, 10 Dec 2020 05:23:36 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 11/14] treewide: kill find_lines()
Date:   Thu, 10 Dec 2020 14:23:12 +0100
Message-Id: <20201210132315.5785-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

GPIO line names are not unique. Looking up multiple lines by names would
require us to return a list of matching lines for every name. We're
simplifying the library API so drop this interface treewide.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp                  | 18 ------
 bindings/cxx/gpiod.hpp                 |  7 ---
 bindings/cxx/tests/tests-chip.cpp      | 18 ------
 bindings/python/gpiodmodule.c          | 86 --------------------------
 bindings/python/tests/gpiod_py_test.py | 32 ----------
 include/gpiod.h                        | 15 -----
 lib/helpers.c                          | 28 ---------
 tests/tests-chip.c                     | 49 ---------------
 8 files changed, 253 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index dffa7a2..ff35e53 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -154,24 +154,6 @@ line_bulk chip::get_all_lines(void) const
 	return lines;
 }
 
-line_bulk chip::find_lines(const ::std::vector<::std::string>& names) const
-{
-	line_bulk lines;
-	line line;
-
-	for (auto& it: names) {
-		line = this->find_line(it);
-		if (!line) {
-			lines.clear();
-			return lines;
-		}
-
-		lines.append(line);
-	}
-
-	return lines;
-}
-
 bool chip::operator==(const chip& rhs) const noexcept
 {
 	return this->_m_chip.get() == rhs._m_chip.get();
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index b258730..a16a27c 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -146,13 +146,6 @@ public:
 	 */
 	GPIOD_API line_bulk get_all_lines(void) const;
 
-	/**
-	 * @brief Get a set of lines exposed by this chip by their names.
-	 * @param names Vector of line names.
-	 * @return Set of lines held by a line_bulk object.
-	 */
-	GPIOD_API line_bulk find_lines(const ::std::vector<::std::string>& names) const;
-
 	/**
 	 * @brief Equality operator.
 	 * @param rhs Right-hand side of the equation.
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 4c9f113..90ebc1b 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -191,17 +191,6 @@ TEST_CASE("Lines can be retrieved from chip objects", "[chip]")
 		REQUIRE(lines.get(2).name() == "gpio-mockup-B-3");
 		REQUIRE(lines.get(3).name() == "gpio-mockup-B-2");
 	}
-
-	SECTION("find multiple lines by names")
-	{
-		auto lines = chip.find_lines({ "gpio-mockup-B-2",
-					       "gpio-mockup-B-5",
-					       "gpio-mockup-B-6"});
-		REQUIRE(lines.size() == 3);
-		REQUIRE(lines.get(0).offset() == 2);
-		REQUIRE(lines.get(1).offset() == 5);
-		REQUIRE(lines.get(2).offset() == 6);
-	}
 }
 
 TEST_CASE("All lines can be retrieved from a chip at once", "[chip]")
@@ -236,11 +225,4 @@ TEST_CASE("Errors occurring when retrieving lines are correctly reported", "[chi
 	{
 		REQUIRE_FALSE(chip.find_line("nonexistent-line"));
 	}
-
-	SECTION("line not found by name (multiple lines)")
-	{
-		REQUIRE_FALSE(chip.find_lines({ "gpio-mockup-B-2",
-						"nonexistent-line",
-						"gpio-mockup-B-6"}));
-	}
 }
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index bcaae92..4948d5d 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -2339,86 +2339,6 @@ gpiod_Chip_get_all_lines(gpiod_ChipObject *self, PyObject *Py_UNUSED(ignored))
 	return bulk_obj;
 }
 
-PyDoc_STRVAR(gpiod_Chip_find_lines_doc,
-"find_lines(names) -> gpiod.LineBulk object\n"
-"\n"
-"Look up a set of lines by their names.\n"
-"\n"
-"  names\n"
-"    Sequence of line names.\n"
-"\n"
-"Unlike find_line(), this method raises an exception if at least one line\n"
-"from the list doesn't exist.");
-
-static gpiod_LineBulkObject *
-gpiod_Chip_find_lines(gpiod_ChipObject *self, PyObject *args)
-{
-	PyObject *names, *lines, *iter, *next, *arg;
-	gpiod_LineBulkObject *bulk;
-	Py_ssize_t num_names, i;
-	gpiod_LineObject *line;
-	int rv;
-
-	rv = PyArg_ParseTuple(args, "O", &names);
-	if (!rv)
-		return NULL;
-
-	num_names = PyObject_Size(names);
-	if (num_names < 1) {
-		PyErr_SetString(PyExc_TypeError,
-				"Argument must be a non-empty sequence of names");
-		return NULL;
-	}
-
-	lines = PyList_New(num_names);
-	if (!lines)
-		return NULL;
-
-	iter = PyObject_GetIter(names);
-	if (!iter) {
-		Py_DECREF(lines);
-		return NULL;
-	}
-
-	for (i = 0;;) {
-		next = PyIter_Next(iter);
-		if (!next) {
-			Py_DECREF(iter);
-			break;
-		}
-
-		arg = PyTuple_Pack(1, next);
-		if (!arg) {
-			Py_DECREF(iter);
-			Py_DECREF(lines);
-			return NULL;
-		}
-
-		line = gpiod_Chip_find_line(self, arg);
-		Py_DECREF(arg);
-		if (!line || (PyObject *)line == Py_None) {
-			Py_DECREF(iter);
-			Py_DECREF(lines);
-			if ((PyObject *)line == Py_None)
-				PyErr_SetString(PyExc_TypeError,
-						"Unable to find all lines from the list");
-			return NULL;
-		}
-
-		rv = PyList_SetItem(lines, i++, (PyObject *)line);
-		if (rv < 0) {
-			Py_DECREF(line);
-			Py_DECREF(iter);
-			Py_DECREF(lines);
-			return NULL;
-		}
-	}
-
-	bulk = gpiod_ListToLineBulk(lines);
-	Py_DECREF(lines);
-	return bulk;
-}
-
 static PyMethodDef gpiod_Chip_methods[] = {
 	{
 		.ml_name = "close",
@@ -2480,12 +2400,6 @@ static PyMethodDef gpiod_Chip_methods[] = {
 		.ml_flags = METH_NOARGS,
 		.ml_doc = gpiod_Chip_get_all_lines_doc,
 	},
-	{
-		.ml_name = "find_lines",
-		.ml_meth = (PyCFunction)gpiod_Chip_find_lines,
-		.ml_flags = METH_VARARGS,
-		.ml_doc = gpiod_Chip_find_lines_doc,
-	},
 	{ }
 };
 
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index 8534ce9..6ee72a9 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -182,30 +182,6 @@ class ChipGetLines(MockupTestCase):
             self.assertEqual(lines[2].name(), 'gpio-mockup-B-6')
             self.assertEqual(lines[3].name(), 'gpio-mockup-B-7')
 
-    def test_find_multiple_lines_by_names_in_tuple(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
-            lines = chip.find_lines(( 'gpio-mockup-B-0',
-                                      'gpio-mockup-B-3',
-                                      'gpio-mockup-B-4',
-                                      'gpio-mockup-B-6' )).to_list()
-            self.assertEqual(len(lines), 4)
-            self.assertEqual(lines[0].offset(), 0)
-            self.assertEqual(lines[1].offset(), 3)
-            self.assertEqual(lines[2].offset(), 4)
-            self.assertEqual(lines[3].offset(), 6)
-
-    def test_find_multiple_lines_by_names_in_list(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
-            lines = chip.find_lines([ 'gpio-mockup-B-0',
-                                      'gpio-mockup-B-3',
-                                      'gpio-mockup-B-4',
-                                      'gpio-mockup-B-6' ]).to_list()
-            self.assertEqual(len(lines), 4)
-            self.assertEqual(lines[0].offset(), 0)
-            self.assertEqual(lines[1].offset(), 3)
-            self.assertEqual(lines[2].offset(), 4)
-            self.assertEqual(lines[3].offset(), 6)
-
     def test_get_multiple_lines_invalid_offset(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
             with self.assertRaises(OSError) as err_ctx:
@@ -213,14 +189,6 @@ class ChipGetLines(MockupTestCase):
 
             self.assertEqual(err_ctx.exception.errno, errno.EINVAL)
 
-    def test_find_multiple_lines_nonexistent(self):
-        with gpiod.Chip(mockup.chip_name(1)) as chip:
-            with self.assertRaises(TypeError):
-                lines = chip.find_lines(( 'gpio-mockup-B-0',
-                                          'nonexistent-line',
-                                          'gpio-mockup-B-4',
-                                          'gpio-mockup-B-6' )).to_list()
-
     def test_get_all_lines(self):
         with gpiod.Chip(mockup.chip_name(2)) as chip:
             lines = chip.get_all_lines().to_list()
diff --git a/include/gpiod.h b/include/gpiod.h
index 5aeb7cc..34313ed 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -184,21 +184,6 @@ gpiod_chip_get_all_lines(struct gpiod_chip *chip) GPIOD_API;
 struct gpiod_line *
 gpiod_chip_find_line(struct gpiod_chip *chip, const char *name) GPIOD_API;
 
-/**
- * @brief Find a set of GPIO lines by names among lines exposed by this chip.
- * @param chip The GPIO chip object.
- * @param names Array of pointers to C-strings containing the names of the
- *              lines to lookup. Must end with a NULL-pointer.
- * @return New line bulk object or NULL on error.
- * @note If at least one line from the list could not be found among the lines
- *       exposed by this chip, the function sets errno to ENOENT.
- * @attention GPIO line names are not unique in the linux kernel, neither
- *            globally nor within a single chip. This function finds the first
- *            line with given name.
- */
-struct gpiod_line_bulk *
-gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names) GPIOD_API;
-
 /**
  * @}
  *
diff --git a/lib/helpers.c b/lib/helpers.c
index 5a73736..509a1c8 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -142,34 +142,6 @@ gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 	return NULL;
 }
 
-struct gpiod_line_bulk *
-gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names)
-{
-	struct gpiod_line_bulk *bulk;
-	struct gpiod_line *line;
-	unsigned int num_names;
-	int i;
-
-	for (i = 0; names[i]; i++);
-	num_names = i;
-
-	bulk = gpiod_line_bulk_new(num_names);
-	if (!bulk)
-		return NULL;
-
-	for (i = 0; names[i]; i++) {
-		line = gpiod_chip_find_line(chip, names[i]);
-		if (!line) {
-			gpiod_line_bulk_free(bulk);
-			return NULL;
-		}
-
-		gpiod_line_bulk_add_line(bulk, line);
-	}
-
-	return bulk;
-}
-
 int gpiod_line_request_input(struct gpiod_line *line, const char *consumer)
 {
 	struct gpiod_line_request_config config = {
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 0c2948a..543c103 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -264,52 +264,3 @@ GPIOD_TEST_CASE(find_line_not_found, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
 	g_assert_null(line);
 	g_assert_cmpint(errno, ==, ENOENT);
 }
-
-GPIOD_TEST_CASE(find_lines_good, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
-{
-	static const gchar *names[] = { "gpio-mockup-B-3",
-					"gpio-mockup-B-6",
-					"gpio-mockup-B-7",
-					NULL };
-
-	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line0, *line1, *line2;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_chip_find_lines(chip, names);
-	g_assert_nonnull(bulk);
-	gpiod_test_return_if_failed();
-	g_assert_cmpuint(gpiod_line_bulk_num_lines(bulk), ==, 3);
-	gpiod_test_return_if_failed();
-
-	line0 = gpiod_line_bulk_get_line(bulk, 0);
-	line1 = gpiod_line_bulk_get_line(bulk, 1);
-	line2 = gpiod_line_bulk_get_line(bulk, 2);
-
-	g_assert_cmpuint(gpiod_line_offset(line0), ==, 3);
-	g_assert_cmpuint(gpiod_line_offset(line1), ==, 6);
-	g_assert_cmpuint(gpiod_line_offset(line2), ==, 7);
-}
-
-GPIOD_TEST_CASE(fine_lines_not_found, GPIOD_TEST_FLAG_NAMED_LINES, { 8, 8, 8 })
-{
-	static const gchar *names[] = { "gpio-mockup-B-3",
-					"nonexistent",
-					"gpio-mockup-B-7",
-					NULL };
-
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line_bulk *bulk;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(1));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	bulk = gpiod_chip_find_lines(chip, names);
-	g_assert_null(bulk);
-	g_assert_cmpint(errno, ==, ENOENT);
-}
-- 
2.29.1

