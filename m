Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A912D5BA4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389204AbgLJNYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389197AbgLJNY0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:26 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB78C061257
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:36 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l9so5439416wrt.13
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KoQikLaDnqXNdr+Hv6sXOpa0WIf3E463cWrb5imytwI=;
        b=TyRIErnegRJFAroWIe/cTUroaqNY2x/eSJuqenzRTb7u230i6UWdLLoc8nHBiYSdzY
         zdRAO5BcGnA+zQEI7R0MSROiyyx4XVSDMK/L2t2SQav/zrDEkx5/vP4QJDuMYXnyBiZu
         HbFPATbYsx16h+dHbycKCqxB/9a9d2SrkY2kp4PDij0b3zFQcFVKwK8lPNH7hZa2ytHJ
         IJSNrnULSvhokwww9ciqmcq+YIwby+7lwjqX5PPEyuQIAVprBTuxZrbNv09Aajrgwhoj
         ga1KuLtOkAZ4A+PUP3cQ3LZ+SOGKbs7857lWo1Ha65etG54RCJpD/YxQlhpwTCa6k+TN
         81uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KoQikLaDnqXNdr+Hv6sXOpa0WIf3E463cWrb5imytwI=;
        b=Lt2tUUf6x90uV2eMBoiNWjcEUQ9b9gr5LzXZgX3/lcjETN6J5LYeXB+tvAysYEXjLP
         ZETiSTxlMTW6/r4/e87PSnnGeNQDZRnIIPCJS4sxH8RrNj28NW+cQ44Nc6FM5BOYCYgl
         nua464l0MAisy+0H54f80lpa3BMvN/dRNt7J1k1SVN7tdkMPUPZoZsJoLVyMFbK479HX
         gSC/vqvl7msy/kjWoh3N4qGHOMkCJajA4wdOgklhnAmUKbdUhUcdHr3dtw8hExG4p/1o
         PKnE7ISSh3SfkuJ+M/QvYYpOsfJjUIIoqtD4qdCLNwjdY8PRs/2w9YBR2GDqviF4rRIU
         xLAQ==
X-Gm-Message-State: AOAM531qmYnsNlyEG9MV/W+e/SJEiNWioTvHkbhB59+9iAzkD+8hU8+7
        s5WoCfrpusw6R96ABsjwNW3wTQ==
X-Google-Smtp-Source: ABdhPJyfK/UM0WbXAASWZ5AP0vjDvbF57dSrKcmQIvWcVlm8mjiDxuknHcT8yll7RzGp4ABbTiYMgw==
X-Received: by 2002:adf:e98b:: with SMTP id h11mr4393809wrm.21.1607606614954;
        Thu, 10 Dec 2020 05:23:34 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 10/14] treewide: kill global line lookup
Date:   Thu, 10 Dec 2020 14:23:11 +0100
Message-Id: <20201210132315.5785-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Global line lookup doesn't really work correctly because GPIO line names
are not unique. We'd have to return a list of matching lines. Also: not
all chips may be accessible by user in which case the chip iterator will
fail. We'll soon be removing chip iterators entirely so for now drop the
global line lookup and let users iterate over chips themselves.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/examples/gpiofindcxx.cpp  | 14 ++---
 bindings/cxx/gpiod.hpp                 |  9 ----
 bindings/cxx/line.cpp                  | 15 ------
 bindings/cxx/tests/tests-line.cpp      | 19 -------
 bindings/python/gpiodmodule.c          | 75 --------------------------
 bindings/python/tests/gpiod_py_test.py | 18 -------
 include/gpiod.h                        | 24 ---------
 lib/helpers.c                          | 29 ----------
 tests/tests-line.c                     | 31 -----------
 tools/gpiofind.c                       | 31 ++++++-----
 10 files changed, 26 insertions(+), 239 deletions(-)

diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index aeba29d..e9ab64a 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -19,11 +19,13 @@ int main(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
-	auto ret = ::gpiod::find_line(argv[1]);
-	if (!ret.first)
-		return EXIT_FAILURE;
-
-	::std::cout << ret.second.name() << " " << ret.first.offset() << ::std::endl;
+	for (auto& chip: ::gpiod::make_chip_iter()) {
+		auto line = chip.find_line(argv[1]);
+		if (line) {
+			::std::cout << line.name() << " " << line.offset() << ::std::endl;
+			return EXIT_SUCCESS;
+		}
+	}
 
-	return EXIT_SUCCESS;
+	return EXIT_FAILURE;
 }
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 0d443b0..b258730 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -548,15 +548,6 @@ private:
 	friend line_iter;
 };
 
-/**
- * @brief Find a GPIO line by name. Search all GPIO chips present on the system.
- * @param name Name of the line.
- * @return Returns a <line, chip> pair where line is the line with given name
- *         and chip is the line's owner. Both objects are empty if the line was
- *         not found.
- */
-GPIOD_API ::std::pair<line, chip> find_line(const ::std::string& name);
-
 /**
  * @brief Describes a single GPIO line event.
  */
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 5589875..54382e2 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -343,19 +343,4 @@ line::chip_guard::chip_guard(const line& line)
 	
 }
 
-::std::pair<line, chip> find_line(const ::std::string& name)
-{
-	::std::pair<line, chip> ret;
-
-	for (auto& it: make_chip_iter()) {
-		ret.first = it.find_line(name);
-		if (ret.first) {
-			ret.second = it;
-			break;
-		}
-	}
-
-	return ret;
-}
-
 } /* namespace gpiod */
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 9841bea..a5499ac 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -18,25 +18,6 @@ const ::std::string consumer = "line-test";
 
 } /* namespace */
 
-TEST_CASE("Global find_line() function works", "[line]")
-{
-	mockup::probe_guard mockup_chips({ 8, 8, 8, 8, 8 }, mockup::FLAG_NAMED_LINES);
-
-	SECTION("line found")
-	{
-		auto ret = ::gpiod::find_line("gpio-mockup-C-5");
-		REQUIRE(ret.first.offset() == 5);
-		REQUIRE(ret.first.name() == "gpio-mockup-C-5");
-		REQUIRE(ret.second.label() == "gpio-mockup-C");
-	}
-
-	SECTION("line not found")
-	{
-		auto ret = ::gpiod::find_line("nonexistent-line");
-		REQUIRE_FALSE(ret.first);
-	}
-}
-
 TEST_CASE("Line information can be correctly retrieved", "[line]")
 {
 	mockup::probe_guard mockup_chips({ 8 }, mockup::FLAG_NAMED_LINES);
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 17a58b1..bcaae92 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -2671,80 +2671,6 @@ static PyTypeObject gpiod_LineIterType = {
 	.tp_iternext = (iternextfunc)gpiod_LineIter_next,
 };
 
-PyDoc_STRVAR(gpiod_Module_find_line_doc,
-"find_line(name) -> gpiod.Line object or None\n"
-"\n"
-"Lookup a GPIO line by name. Search all gpiochips. Returns a gpiod.Line\n"
-"or None if a line with given name doesn't exist in the system.\n"
-"\n"
-"NOTE: the gpiod.Chip object owning the returned line must be closed\n"
-"by the caller.\n"
-"\n"
-"  name\n"
-"    Name of the line to find (string).");
-
-static gpiod_LineObject *gpiod_Module_find_line(PyObject *Py_UNUSED(self),
-						PyObject *args)
-{
-	gpiod_LineObject *line_obj;
-	gpiod_ChipObject *chip_obj;
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-	const char *name;
-	int rv;
-
-	rv = PyArg_ParseTuple(args, "s", &name);
-	if (!rv)
-		return NULL;
-
-	Py_BEGIN_ALLOW_THREADS;
-	line = gpiod_line_find(name);
-	Py_END_ALLOW_THREADS;
-	if (!line) {
-		if (errno == ENOENT) {
-			Py_INCREF(Py_None);
-			return (gpiod_LineObject *)Py_None;
-		}
-
-		return (gpiod_LineObject *)PyErr_SetFromErrno(PyExc_OSError);
-	}
-
-	chip = gpiod_line_get_chip(line);
-
-	chip_obj = PyObject_New(gpiod_ChipObject, &gpiod_ChipType);
-	if (!chip_obj) {
-		gpiod_chip_close(chip);
-		return NULL;
-	}
-
-	chip_obj->chip = chip;
-
-	line_obj = gpiod_MakeLineObject(chip_obj, line);
-	if (!line_obj)
-		return NULL;
-
-	/*
-	 * PyObject_New() set the reference count for the chip object at 1 and
-	 * the call to gpiod_MakeLineObject() increased it to 2. However when
-	 * we return the object to the line object to the python interpreter,
-	 * there'll be only a single reference holder to the chip - the line
-	 * object itself. Decrease the chip reference here manually.
-	 */
-	Py_DECREF(line_obj->owner);
-
-	return line_obj;
-}
-
-static PyMethodDef gpiod_module_methods[] = {
-	{
-		.ml_name = "find_line",
-		.ml_meth = (PyCFunction)gpiod_Module_find_line,
-		.ml_flags = METH_VARARGS,
-		.ml_doc = gpiod_Module_find_line_doc,
-	},
-	{ }
-};
-
 typedef struct {
 	const char *name;
 	PyTypeObject *typeobj;
@@ -2850,7 +2776,6 @@ static PyModuleDef gpiod_Module = {
 	.m_name = "gpiod",
 	.m_doc = gpiod_Module_doc,
 	.m_size = -1,
-	.m_methods = gpiod_module_methods,
 };
 
 typedef struct {
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index e4aaadc..8534ce9 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -234,24 +234,6 @@ class ChipGetLines(MockupTestCase):
 # Line test cases
 #
 
-class LineGlobalFindLine(MockupTestCase):
-
-    chip_sizes = ( 4, 8, 16 )
-    flags = gpiomockup.Mockup.FLAG_NAMED_LINES
-
-    def test_global_find_line_function(self):
-        line = gpiod.find_line('gpio-mockup-B-4')
-        self.assertNotEqual(line, None)
-        try:
-            self.assertEqual(line.owner().label(), 'gpio-mockup-B')
-            self.assertEqual(line.offset(), 4)
-        finally:
-            line.owner().close()
-
-    def test_global_find_line_function_nonexistent(self):
-        line = gpiod.find_line('nonexistent-line')
-        self.assertEqual(line, None)
-
 class LineInfo(MockupTestCase):
 
     chip_sizes = ( 8, )
diff --git a/include/gpiod.h b/include/gpiod.h
index c1113bf..5aeb7cc 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1053,30 +1053,6 @@ int gpiod_line_event_read_fd(int fd, struct gpiod_line_event *event) GPIOD_API;
 int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 				      unsigned int num_events) GPIOD_API;
 
-/**
- * @}
- *
- * @defgroup line_misc Misc line functions
- * @{
- *
- * Functions that didn't fit anywhere else.
- */
-
-/**
- * @brief Find a GPIO line by its name.
- * @param name Name of the GPIO line.
- * @return Returns the GPIO line handle if the line exists in the system or
- *         NULL if it couldn't be located or an error occurred.
- * @attention GPIO lines are not unique in the linux kernel, neither globally
- *            nor within a single chip. This function finds the first line with
- *            given name.
- *
- * If this routine succeeds, the user must manually close the GPIO chip owning
- * this line to avoid memory leaks. If the line could not be found, this
- * functions sets errno to ENOENT.
- */
-struct gpiod_line *gpiod_line_find(const char *name) GPIOD_API;
-
 /**
  * @}
  *
diff --git a/lib/helpers.c b/lib/helpers.c
index 2063c3f..5a73736 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -377,32 +377,3 @@ int gpiod_line_request_bulk_both_edges_events_flags(
 	return line_event_request_type_bulk(bulk, consumer, flags,
 					GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES);
 }
-
-struct gpiod_line *gpiod_line_find(const char *name)
-{
-	struct gpiod_chip_iter *iter;
-	struct gpiod_chip *chip;
-	struct gpiod_line *line;
-
-	iter = gpiod_chip_iter_new();
-	if (!iter)
-		return NULL;
-
-	gpiod_foreach_chip(iter, chip) {
-		line = gpiod_chip_find_line(chip, name);
-		if (line) {
-			gpiod_chip_iter_free_noclose(iter);
-			return line;
-		}
-
-		if (errno != ENOENT)
-			goto out;
-	}
-
-	errno = ENOENT;
-
-out:
-	gpiod_chip_iter_free(iter);
-
-	return NULL;
-}
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 235df0f..aee85fe 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -716,37 +716,6 @@ GPIOD_TEST_CASE(output_value_caching, 0, { 8 })
 	g_assert_cmpint(gpiod_test_chip_get_value(0, 2), ==, 0);
 }
 
-GPIOD_TEST_CASE(find_good, GPIOD_TEST_FLAG_NAMED_LINES, { 16, 16, 32, 16 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-
-	line = gpiod_line_find("gpio-mockup-C-12");
-	g_assert_nonnull(line);
-	gpiod_test_return_if_failed();
-	chip = gpiod_line_get_chip(line);
-	g_assert_cmpint(gpiod_line_offset(line), ==, 12);
-}
-
-GPIOD_TEST_CASE(find_not_found,
-		GPIOD_TEST_FLAG_NAMED_LINES, { 16, 16, 32, 16 })
-{
-	struct gpiod_line *line;
-
-	line = gpiod_line_find("nonexistent");
-	g_assert_null(line);
-	g_assert_cmpint(errno, ==, ENOENT);
-}
-
-GPIOD_TEST_CASE(find_unnamed_lines, 0, { 16, 16, 32, 16 })
-{
-	struct gpiod_line *line;
-
-	line = gpiod_line_find("gpio-mockup-C-12");
-	g_assert_null(line);
-	g_assert_cmpint(errno, ==, ENOENT);
-}
-
 GPIOD_TEST_CASE(direction, 0, { 8 })
 {
 	g_autoptr(gpiod_chip_struct) chip = NULL;
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 2138ebf..489cf33 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -34,9 +34,10 @@ static void print_help(void)
 
 int main(int argc, char **argv)
 {
-	int optc, opti, ret = EXIT_SUCCESS;
+	struct gpiod_chip_iter *iter;
 	struct gpiod_chip *chip;
 	struct gpiod_line *line;
+	int optc, opti;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -63,19 +64,23 @@ int main(int argc, char **argv)
 	if (argc != 1)
 		die("exactly one GPIO line name must be specified");
 
-	line = gpiod_line_find(argv[0]);
-	if (!line) {
-		if (errno == ENOENT)
-			return EXIT_FAILURE;
+	iter = gpiod_chip_iter_new();
+	if (!iter)
+		die_perror("unable to access GPIO chips");
 
-		die_perror("error performing the line lookup");
-	}
-
-	chip = gpiod_line_get_chip(line);
-
-	printf("%s %u\n", gpiod_chip_name(chip), gpiod_line_offset(line));
+	gpiod_foreach_chip(iter, chip) {
+		line = gpiod_chip_find_line(chip, argv[0]);
+		if (line) {
+			printf("%s %u\n",
+			       gpiod_chip_name(chip), gpiod_line_offset(line));
+			gpiod_chip_iter_free(iter);
+			return EXIT_SUCCESS;
+		}
 
-	gpiod_chip_close(chip);
+		if (errno != ENOENT)
+			die_perror("error performing the line lookup");
+	}
 
-	return ret;
+	gpiod_chip_iter_free(iter);
+	return EXIT_FAILURE;
 }
-- 
2.29.1

