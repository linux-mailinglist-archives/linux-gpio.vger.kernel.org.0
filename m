Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A86B2D5B9E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389111AbgLJNYk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732921AbgLJNYd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:33 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EF2C0617B0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:31 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a6so4644967wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vr0/xJiQ1Lpaa2VdevHyu3D4CdrfcR8dmeD/7QGxzKc=;
        b=wTmf8F1qG1g/H65It7tiLlZNhrX5eYd8O/Gsp2ifF1X2nGWUyHcanCFcYbBv2eXTb4
         TlIJ4hzci3CHo/eNdTVXowOgHYAybRydW9nUCUp+zVGsxy4DdH8vkamux14UnCaL6Baz
         /JnpGF65QFnmmGnHSkPxWg7wq2nJCTIAB8eSuHvOQXtL3ZoWn2nNhZwPQZh039ulIhon
         Jz+AS7dIAylD9/qCYbZq0CDE0qmJQ2WGqg2PMMT84yovx4LH7HYgenq/DA07XrB4gBUU
         iDbFdGi6ZxfbExMoeTz6HYY1Bg8srsORHWsbx5ANavzOCNf6uprFPq350hXIrdT+culP
         Qk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vr0/xJiQ1Lpaa2VdevHyu3D4CdrfcR8dmeD/7QGxzKc=;
        b=X7rz16YjxFHnCtb+jQfj1U9AiShuv+gPDcxR5nkRPDSM54KHo22G07vMb6JtEv66OC
         UKMKJJ3Kwer5Ul7/ywTfC0yMmp/HylcLpORNUK/7nops5WszSOUeDlys6loZbzkH4Rx1
         enQeuDi8NOH+8qKQT50JG8vkZKBdV6sakgEFLDGHkmTyqtKiVKUbeY4QF0Z84Sq8NH61
         YteiSUodk+NrrF0lSzomxPejYzV6o+Zbbea8YvA/bgEnLWei6n1sDLVA2KhHUNQvCxj1
         wubycN01N9K0v+zJQYBvIVWpvduny14ypJE+k8wKqcnIB9Nh/XX9oqVX3mN7uorAQ3lB
         1U3g==
X-Gm-Message-State: AOAM532cG0Z/epw41T39bnvodHIPjTTy8H9g2dX6dUzL5CHnQnJk6S4x
        XU//RQQJ0lSVJCrNXLxeH/mzHQ==
X-Google-Smtp-Source: ABdhPJwH4kJ0lGLKOJPMnA7nyTaFqtFx8Z+4J+NPXM0GRsbqHpmF9/5+2LFINp9u2w533eQ3cRShuQ==
X-Received: by 2002:a1c:1bc6:: with SMTP id b189mr8015997wmb.71.1607606609797;
        Thu, 10 Dec 2020 05:23:29 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 06/14] treewide: kill opening chips by label
Date:   Thu, 10 Dec 2020 14:23:07 +0100
Message-Id: <20201210132315.5785-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Chip labels are not unique - opening chips by label may lead to errors
or to ignoring chips with duplicate labels. Users can easily implement
chip lookup by label themselves so remove this part from the core library
and all bindings.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp                  |  6 -----
 bindings/cxx/gpiod.hpp                 |  2 --
 bindings/cxx/tests/tests-chip.cpp      | 20 ----------------
 bindings/python/gpiodmodule.c          | 17 ++++---------
 bindings/python/tests/gpiod_py_test.py |  8 -------
 include/gpiod.h                        | 14 ++---------
 lib/helpers.c                          | 33 ++++----------------------
 tests/tests-chip.c                     | 24 -------------------
 8 files changed, 10 insertions(+), 114 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 1fc0723..dffa7a2 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -30,11 +30,6 @@ namespace {
 	return ::gpiod_chip_open_by_name(device.c_str());
 }
 
-::gpiod_chip* open_by_label(const ::std::string& device)
-{
-	return ::gpiod_chip_open_by_label(device.c_str());
-}
-
 ::gpiod_chip* open_by_number(const ::std::string& device)
 {
 	return ::gpiod_chip_open_by_number(::std::stoul(device));
@@ -46,7 +41,6 @@ const ::std::map<int, open_func> open_funcs = {
 	{ chip::OPEN_LOOKUP,	open_lookup,	},
 	{ chip::OPEN_BY_PATH,	open_by_path,	},
 	{ chip::OPEN_BY_NAME,	open_by_name,	},
-	{ chip::OPEN_BY_LABEL,	open_by_label,	},
 	{ chip::OPEN_BY_NUMBER,	open_by_number,	},
 };
 
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 0f1d9b2..0d443b0 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -190,8 +190,6 @@ public:
 		/**< Assume the string is a path to the GPIO chardev. */
 		OPEN_BY_NAME,
 		/**< Assume the string is the name of the chip */
-		OPEN_BY_LABEL,
-		/**< Assume the string is the label of the GPIO chip. */
 		OPEN_BY_NUMBER,
 		/**< Assume the string is the number of the GPIO chip. */
 	};
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index 1c69872..4c9f113 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -28,11 +28,6 @@ TEST_CASE("GPIO chip device can be opened in different modes", "[chip]")
 				::gpiod::chip::OPEN_BY_PATH));
 	}
 
-	SECTION("open by label")
-	{
-		REQUIRE_NOTHROW(::gpiod::chip("gpio-mockup-B", ::gpiod::chip::OPEN_BY_LABEL));
-	}
-
 	SECTION("open by number")
 	{
 		REQUIRE_NOTHROW(::gpiod::chip(::std::to_string(mockup::instance().chip_num(1)),
@@ -54,11 +49,6 @@ TEST_CASE("GPIO chip device can be opened with implicit lookup", "[chip]")
 		REQUIRE_NOTHROW(::gpiod::chip(mockup::instance().chip_path(1)));
 	}
 
-	SECTION("lookup by label")
-	{
-		REQUIRE_NOTHROW(::gpiod::chip("gpio-mockup-B"));
-	}
-
 	SECTION("lookup by number")
 	{
 		REQUIRE_NOTHROW(::gpiod::chip(::std::to_string(mockup::instance().chip_num(1))));
@@ -84,11 +74,6 @@ TEST_CASE("GPIO chip can be opened with the open() method in different modes", "
 					  ::gpiod::chip::OPEN_BY_PATH));
 	}
 
-	SECTION("open by label")
-	{
-		REQUIRE_NOTHROW(chip.open("gpio-mockup-B", ::gpiod::chip::OPEN_BY_LABEL));
-	}
-
 	SECTION("open by number")
 	{
 		REQUIRE_NOTHROW(chip.open(::std::to_string(mockup::instance().chip_num(1)),
@@ -126,11 +111,6 @@ TEST_CASE("GPIO chip can be opened with the open() method with implicit lookup",
 		REQUIRE_NOTHROW(chip.open(mockup::instance().chip_path(1)));
 	}
 
-	SECTION("lookup by label")
-	{
-		REQUIRE_NOTHROW(chip.open("gpio-mockup-B"));
-	}
-
 	SECTION("lookup by number")
 	{
 		REQUIRE_NOTHROW(chip.open(::std::to_string(mockup::instance().chip_num(1))));
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 11d1407..17a58b1 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1961,7 +1961,6 @@ enum {
 	gpiod_OPEN_LOOKUP = 1,
 	gpiod_OPEN_BY_NAME,
 	gpiod_OPEN_BY_PATH,
-	gpiod_OPEN_BY_LABEL,
 	gpiod_OPEN_BY_NUMBER,
 };
 
@@ -1987,9 +1986,6 @@ static int gpiod_Chip_init(gpiod_ChipObject *self,
 	case gpiod_OPEN_BY_PATH:
 		self->chip = gpiod_chip_open(descr);
 		break;
-	case gpiod_OPEN_BY_LABEL:
-		self->chip = gpiod_chip_open_by_label(descr);
-		break;
 	case gpiod_OPEN_BY_NUMBER:
 		self->chip = gpiod_chip_open_by_number(atoi(descr));
 		break;
@@ -2503,10 +2499,10 @@ PyDoc_STRVAR(gpiod_ChipType_doc,
 "The Chip object's constructor takes a description string as argument the\n"
 "meaning of which depends on the second, optional parameter which defines\n"
 "the way the description string should be interpreted. The available\n"
-"options are: OPEN_BY_LABEL, OPEN_BY_NAME, OPEN_BY_NUMBER, OPEN_BY_PATH,\n"
-"and OPEN_LOOKUP. The last option means that libgpiod should open the chip\n"
-"based on the best guess what the path is. This is also the default if the\n"
-"second argument is missing.\n"
+"options are: OPEN_BY_NAME, OPEN_BY_NUMBER, OPEN_BY_PATH and OPEN_LOOKUP.\n"
+"The last option means that libgpiod should open the chip based on the best\n"
+"guess what the path is. This is also the default if the second argument is\n"
+"missing.\n"
 "\n"
 "Callers must close the chip by calling the close() method when it's no\n"
 "longer used.\n"
@@ -2786,11 +2782,6 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 		.name = "OPEN_BY_NAME",
 		.val = gpiod_OPEN_BY_NAME,
 	},
-	{
-		.typeobj = &gpiod_ChipType,
-		.name = "OPEN_BY_LABEL",
-		.val = gpiod_OPEN_BY_LABEL,
-	},
 	{
 		.typeobj = &gpiod_ChipType,
 		.name = "OPEN_BY_NUMBER",
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index cb15fdc..e4aaadc 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -96,10 +96,6 @@ class ChipOpen(MockupTestCase):
                         gpiod.Chip.OPEN_BY_NUMBER) as chip:
             self.assertEqual(chip.name(), mockup.chip_name(1))
 
-    def test_open_chip_by_label(self):
-        with gpiod.Chip('gpio-mockup-B', gpiod.Chip.OPEN_BY_LABEL) as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
     def test_lookup_chip_by_name(self):
         with gpiod.Chip(mockup.chip_name(1)) as chip:
             self.assertEqual(chip.name(), mockup.chip_name(1))
@@ -112,10 +108,6 @@ class ChipOpen(MockupTestCase):
         with gpiod.Chip('{}'.format(mockup.chip_num(1))) as chip:
             self.assertEqual(chip.name(), mockup.chip_name(1))
 
-    def test_lookup_chip_by_label(self):
-        with gpiod.Chip('gpio-mockup-B') as chip:
-            self.assertEqual(chip.name(), mockup.chip_name(1))
-
     def test_nonexistent_chip(self):
         with self.assertRaises(FileNotFoundError):
             chip = gpiod.Chip('nonexistent-chip')
diff --git a/include/gpiod.h b/include/gpiod.h
index b5965ed..b28cc92 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -103,24 +103,14 @@ struct gpiod_chip *gpiod_chip_open_by_name(const char *name) GPIOD_API;
  */
 struct gpiod_chip *gpiod_chip_open_by_number(unsigned int num) GPIOD_API;
 
-/**
- * @brief Open a gpiochip by label.
- * @param label Label of the gpiochip to open.
- * @return GPIO chip handle or NULL if the chip with given label was not found
- *         or an error occured.
- * @note If the chip cannot be found but no other error occurred, errno is set
- *       to ENOENT.
- */
-struct gpiod_chip *gpiod_chip_open_by_label(const char *label) GPIOD_API;
-
 /**
  * @brief Open a gpiochip based on the best guess what the path is.
  * @param descr String describing the gpiochip.
  * @return GPIO chip handle or NULL if an error occurred.
  *
  * This routine tries to figure out whether the user passed it the path to the
- * GPIO chip, its name, label or number as a string. Then it tries to open it
- * using one of the gpiod_chip_open** variants.
+ * GPIO chip, its name or number as a string. Then it tries to open it using
+ * one of the gpiod_chip_open** variants.
  */
 struct gpiod_chip *gpiod_chip_open_lookup(const char *descr) GPIOD_API;
 
diff --git a/lib/helpers.c b/lib/helpers.c
index 3b7428b..3ec6c96 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -56,28 +56,6 @@ struct gpiod_chip *gpiod_chip_open_by_number(unsigned int num)
 	return chip;
 }
 
-struct gpiod_chip *gpiod_chip_open_by_label(const char *label)
-{
-	struct gpiod_chip_iter *iter;
-	struct gpiod_chip *chip;
-
-	iter = gpiod_chip_iter_new();
-	if (!iter)
-		return NULL;
-
-	gpiod_foreach_chip(iter, chip) {
-		if (strcmp(label, gpiod_chip_label(chip)) == 0) {
-			gpiod_chip_iter_free_noclose(iter);
-			return chip;
-		}
-	}
-
-	errno = ENOENT;
-	gpiod_chip_iter_free(iter);
-
-	return NULL;
-}
-
 struct gpiod_chip *gpiod_chip_open_lookup(const char *descr)
 {
 	struct gpiod_chip *chip;
@@ -85,13 +63,10 @@ struct gpiod_chip *gpiod_chip_open_lookup(const char *descr)
 	if (isuint(descr)) {
 		chip = gpiod_chip_open_by_number(strtoul(descr, NULL, 10));
 	} else {
-		chip = gpiod_chip_open_by_label(descr);
-		if (!chip) {
-			if (strncmp(descr, "/dev/", 5))
-				chip = gpiod_chip_open_by_name(descr);
-			else
-				chip = gpiod_chip_open(descr);
-		}
+		if (strncmp(descr, "/dev/", 5))
+			chip = gpiod_chip_open_by_name(descr);
+		else
+			chip = gpiod_chip_open(descr);
 	}
 
 	return chip;
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 2f19c49..0c2948a 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -68,28 +68,8 @@ GPIOD_TEST_CASE(open_by_number_good, 0, { 8 })
 	g_assert_nonnull(chip);
 }
 
-GPIOD_TEST_CASE(open_by_label_good, 0, { 4, 4, 4, 4, 4 })
-{
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-
-	chip = gpiod_chip_open_by_label("gpio-mockup-D");
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-	g_assert_cmpstr(gpiod_chip_name(chip), ==, gpiod_test_chip_name(3));
-}
-
-GPIOD_TEST_CASE(open_by_label_bad, 0, { 4, 4, 4, 4, 4 })
-{
-	struct gpiod_chip *chip;
-
-	chip = gpiod_chip_open_by_label("nonexistent_gpio_chip");
-	g_assert_null(chip);
-	g_assert_cmpint(errno, ==, ENOENT);
-}
-
 GPIOD_TEST_CASE(open_lookup_good, 0, { 8, 8, 8})
 {
-	g_autoptr(gpiod_chip_struct) chip_by_label = NULL;
 	g_autoptr(gpiod_chip_struct) chip_by_name = NULL;
 	g_autoptr(gpiod_chip_struct) chip_by_path = NULL;
 	g_autoptr(gpiod_chip_struct) chip_by_num = NULL;
@@ -99,12 +79,10 @@ GPIOD_TEST_CASE(open_lookup_good, 0, { 8, 8, 8})
 	chip_by_name = gpiod_chip_open_lookup(gpiod_test_chip_name(1));
 	chip_by_path = gpiod_chip_open_lookup(gpiod_test_chip_path(1));
 	chip_by_num = gpiod_chip_open_lookup(chip_num_str);
-	chip_by_label = gpiod_chip_open_lookup("gpio-mockup-B");
 
 	g_assert_nonnull(chip_by_name);
 	g_assert_nonnull(chip_by_path);
 	g_assert_nonnull(chip_by_num);
-	g_assert_nonnull(chip_by_label);
 	gpiod_test_return_if_failed();
 
 	g_assert_cmpstr(gpiod_chip_name(chip_by_name),
@@ -113,8 +91,6 @@ GPIOD_TEST_CASE(open_lookup_good, 0, { 8, 8, 8})
 			==, gpiod_test_chip_name(1));
 	g_assert_cmpstr(gpiod_chip_name(chip_by_num),
 			==, gpiod_test_chip_name(1));
-	g_assert_cmpstr(gpiod_chip_name(chip_by_label),
-			==, gpiod_test_chip_name(1));
 }
 
 GPIOD_TEST_CASE(get_name, 0, { 8, 8, 8})
-- 
2.29.1

