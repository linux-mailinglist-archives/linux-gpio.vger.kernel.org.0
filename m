Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9716E33271F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhCIN1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhCIN0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:45 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B79C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:45 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l11so12155715wrp.7
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gmsp8IZDH53kiko9aSQ4QmCnUqJM7FgPbxSSXJNQk4s=;
        b=G9CYXz4fiOsmUk423D9in8c2LrqP168RM+D5jDjjiR49E6X8zdF9y6y59EQgXGK8GY
         Zv9PljtqubthW81T0i6SPXonmunV0df3U0bkthmVQAvmIr5VFgr7RmYIAOV+AMlLJW+q
         JF92KckmnOViRur2Ug/LumUfp+NZnFqOH3ThYctkaPWSVkfow0IoXCqMz6w8cB3lDGIR
         XYjBOPJDP0sOuCf1ZXoc4vX5M3IwXOBtaBfLX5DXivRVsyr6VZ2xtKcdwYG0TM1agyOu
         0ReWNNRsUwiY+CGyzRgml+ZQnh1KIh19+yMINkJ41sdjUZK6EyKmbuAtqqCG0P6QwxC6
         35oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gmsp8IZDH53kiko9aSQ4QmCnUqJM7FgPbxSSXJNQk4s=;
        b=gkPuS4V3isiDrcS+CQsjo/IkI2m0/FB4RtyEIhG3brmuVrqcASWgNGHX+0Vnej3TD7
         KfEIE8SeJWYR/P+WVPQoWwm5X+BiwzDfRAdssY8wbvWvNDzJpet9d5oYYOjNHjNhVs41
         PhSuP8u2iyOZHKlAbBqmxAgsyPbK5D9vdfTV3YSHKmu8Ih4Ip+JQxvpkqR6mI8l6T+hH
         YcEVgbmItGZSZ6zhkT3bw4U2+ebwKDW4I5kW0mha4CVPkk9uSPqQiBgJRtM4W8k4Ufl2
         Ql/o6+oD6xlLQXWsLDRCbAci2ttcEcHF6/JdFnjh0LjkGCxX3T2yOnKmu3K00aSMGhYR
         bI9Q==
X-Gm-Message-State: AOAM532ZqhyatfbZmMr8H0aANEVF8V4rW+EfnmdiI3jT1Ij/Sua+EvS3
        zJmhFqYqe7J4nn48nluZ9crC9g==
X-Google-Smtp-Source: ABdhPJzH/RtUGbBqNh5Is1mIzPBF0pb2i+wHmQUmP4AfVm7YIC51mYcMIVHEYVnGPd6idoyuh70XhQ==
X-Received: by 2002:a5d:5104:: with SMTP id s4mr29707026wrt.62.1615296404319;
        Tue, 09 Mar 2021 05:26:44 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 5/6] treewide: kill line updating
Date:   Tue,  9 Mar 2021 14:26:38 +0100
Message-Id: <20210309132639.29069-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
References: <20210309132639.29069-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This removes any trace of line updating from the API (C, C++ and Python).
The line objects will soon disappear entirely so in order to make the
gradual transition to the new data model easier, remove
gpiod_line_update().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp                 |  5 -----
 bindings/cxx/line.cpp                  | 12 ------------
 bindings/cxx/tests/tests-line.cpp      |  5 -----
 bindings/python/gpiodmodule.c          | 23 -----------------------
 bindings/python/tests/gpiod_py_test.py |  5 -----
 include/gpiod.h                        | 22 ----------------------
 lib/core.c                             | 12 +++++++-----
 7 files changed, 7 insertions(+), 77 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 189a133..003acdd 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -412,11 +412,6 @@ public:
 	 */
 	GPIOD_API const chip get_chip(void) const;
 
-	/**
-	 * @brief Re-read the line info from the kernel.
-	 */
-	GPIOD_API void update(void) const;
-
 	/**
 	 * @brief Reset the state of this object.
 	 *
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 058f7ce..bf84867 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -278,18 +278,6 @@ const chip line::get_chip(void) const
 	return chip(this->_m_owner);
 }
 
-void line::update(void) const
-{
-	this->throw_if_null();
-	line::chip_guard lock_chip(*this);
-
-	int ret = ::gpiod_line_update(this->_m_line);
-
-	if (ret < 0)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "unable to update the line info");
-}
-
 void line::reset(void)
 {
 	this->_m_line = nullptr;
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 17fdd89..ababf8b 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -139,11 +139,6 @@ TEST_CASE("Line information can be correctly retrieved", "[line]")
 		REQUIRE(line.drive() == ::gpiod::line::DRIVE_PUSH_PULL);
 		REQUIRE(line.bias() == ::gpiod::line::BIAS_PULL_UP);
 	}
-
-	SECTION("update line info")
-	{
-		REQUIRE_NOTHROW(line.update());
-	}
 }
 
 TEST_CASE("Line values can be set and read", "[line]")
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 12a6867..8bfb4c4 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -721,23 +721,6 @@ static PyObject *gpiod_Line_release(gpiod_LineObject *self,
 	return ret;
 }
 
-PyDoc_STRVAR(gpiod_Line_update_doc,
-"update() -> None\n"
-"\n"
-"Re-read the line information from the kernel.");
-
-static PyObject *gpiod_Line_update(gpiod_LineObject *self,
-				   PyObject *Py_UNUSED(ignored))
-{
-	int ret;
-
-	ret = gpiod_line_update(self->line);
-	if (ret)
-		return PyErr_SetFromErrno(PyExc_OSError);
-
-	Py_RETURN_NONE;
-}
-
 PyDoc_STRVAR(gpiod_Line_event_wait_doc,
 "event_wait([sec[ ,nsec]]) -> boolean\n"
 "\n"
@@ -1008,12 +991,6 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_flags = METH_NOARGS,
 		.ml_doc = gpiod_Line_release_doc,
 	},
-	{
-		.ml_name = "update",
-		.ml_meth = (PyCFunction)gpiod_Line_update,
-		.ml_flags = METH_NOARGS,
-		.ml_doc = gpiod_Line_update_doc,
-	},
 	{
 		.ml_name = "event_wait",
 		.ml_meth = (PyCFunction)(void (*)(void))gpiod_Line_event_wait,
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index d448776..f93c72c 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -315,11 +315,6 @@ class LineInfo(MockupTestCase):
             self.assertEqual(line.drive(), gpiod.Line.DRIVE_PUSH_PULL)
             self.assertEqual(line.bias(), gpiod.Line.BIAS_PULL_UP)
 
-    def test_update_line_info(self):
-        with gpiod.Chip(mockup.chip_path(0)) as chip:
-            line = chip.get_line(3)
-            line.update()
-
 class LineValues(MockupTestCase):
 
     chip_sizes = ( 8, )
diff --git a/include/gpiod.h b/include/gpiod.h
index a5e09e2..0ee9778 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -358,28 +358,6 @@ bool gpiod_line_is_used(struct gpiod_line *line) GPIOD_API;
  */
 int gpiod_line_drive(struct gpiod_line *line) GPIOD_API;
 
-/**
- * @brief Re-read the line info.
- * @param line GPIO line object.
- * @return 0 if the operation succeeds. In case of an error this routine
- *         returns -1 and sets the last error number.
- *
- * The line info is initially retrieved from the kernel by
- * gpiod_chip_get_line() and is later re-read after every successful request.
- * Users can use this function to manually re-read the line info when needed.
- *
- * We currently have no mechanism provided by the kernel for keeping the line
- * info synchronized and for the sake of speed and simplicity of this low-level
- * library we don't want to re-read the line info automatically everytime
- * a property is retrieved. Any daemon using this library must track the state
- * of lines on its own and call this routine if needed.
- *
- * The state of requested lines is kept synchronized (or rather cannot be
- * changed by external agents while the ownership of the line is taken) so
- * there's no need to call this function in that case.
- */
-int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
-
 /**
  * @brief Get the handle to the GPIO chip controlling this line.
  * @param line The GPIO line object.
diff --git a/lib/core.c b/lib/core.c
index 8e3d8a7..8fdc503 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -373,6 +373,8 @@ unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip)
 	return chip->num_lines;
 }
 
+static int line_update(struct gpiod_line *line);
+
 struct gpiod_line *
 gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset)
 {
@@ -406,7 +408,7 @@ gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset)
 		line = chip->lines[offset];
 	}
 
-	rv = gpiod_line_update(line);
+	rv = line_update(line);
 	if (rv < 0)
 		return NULL;
 
@@ -535,7 +537,7 @@ static int line_info_v2_to_info_flags(struct gpio_v2_line_info *info)
 	return iflags;
 }
 
-int gpiod_line_update(struct gpiod_line *line)
+static int line_update(struct gpiod_line *line)
 {
 	struct gpio_v2_line_info info;
 	int rv;
@@ -766,7 +768,7 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
 				req.config.attrs[0].attr.values, i);
 		line_set_fd(line, line_fd);
 
-		rv = gpiod_line_update(line);
+		rv = line_update(line);
 		if (rv) {
 			gpiod_line_release_bulk(bulk);
 			return rv;
@@ -805,7 +807,7 @@ static int line_request_event_single(struct gpiod_line *line,
 	line->req_flags = config->flags;
 	line_set_fd(line, line_fd);
 
-	rv = gpiod_line_update(line);
+	rv = line_update(line);
 	if (rv) {
 		gpiod_line_release(line);
 		return rv;
@@ -1036,7 +1038,7 @@ int gpiod_line_set_config_bulk(struct gpiod_line_bulk *bulk,
 			line->output_value = lines_bitmap_test_bit(
 				hcfg.attrs[0].attr.values, i);
 
-		rv = gpiod_line_update(line);
+		rv = line_update(line);
 		if (rv < 0)
 			return rv;
 	}
-- 
2.30.1

