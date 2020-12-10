Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D949F2D5B99
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732914AbgLJNYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733074AbgLJNYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:10 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3217C0617A7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:29 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k14so5480979wrn.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOGlzMPIkgetG0wbLb8mZEk+sOsOaWxp0Id3Kbs2DfE=;
        b=WGk3WGmxwvblt78Pq4sqq8E53mcjG8G3hhBVFLCnL6Nvp6F8TyI37YXRw+wnQktfqD
         A/fp7tnqenyitOi3dQBORGNpNRF+hh8aRuy32nzuHOlADIPDBsbOPiW9GUy+J4IMpYyO
         Wdswcg4jFK/ost7piIHTaAT0nVotlUkOMAbXfIhrZDXSbRN/P07ApNxoXhVKy7qU1h6A
         6Jo4CubmlxVYZAEgxOxIKddhqaUTBS2n71+Bbh1d2FuVwiCS0/Hk9oMNgZ4lgI7bHdur
         z9o1k9pE2CU5daEzBTEJxzoCAJMbCI62EmfQdUzq/6H36yJimLJC196rStTsMlmAq3U4
         04Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOGlzMPIkgetG0wbLb8mZEk+sOsOaWxp0Id3Kbs2DfE=;
        b=XZb+qNyZPpk0gJL1lMgHn4hwqo1/R89qg4VxKMB5ANS+L9SsfOeUY0jBoh0EFe5JPh
         /sAQUPXXU437uKsAv5w+6vHmJuvu25zV7OSKRGGzLz4iQaYjFUMSKh9UHaFcEx7l+9yd
         LKfty1LREIO65y9xU5emzfbNY1vo/iIjWXH4agLyIYHn/+2Wc3HmlD34tKNTc91zjEmk
         70SogOvdrkuuj0OGss/BFZI7NNG39vK9KhQ86Glpjkg2WvLAqe5ypqh4xZanYQcGqW70
         koSU83Vo/1dfS0xghROSFMFXnFfF+QelcDapSGblbd99ASc44diPcR6pb5jhVdURDL4O
         g5BQ==
X-Gm-Message-State: AOAM532fixreXtMGw6xzfp0aca+kajUTFVhwCZU7EY22lUhJUpcXWXHn
        kEO8LcyJOYIeNQX2RGTOpWO5ug==
X-Google-Smtp-Source: ABdhPJwPIon8PttvbrGnrhmcI42QFzkBcETsicq2Uw//Mpqq3olkm7O3n/mv+C3RZEQnpWS52Rex7Q==
X-Received: by 2002:adf:ffc8:: with SMTP id x8mr8182147wrs.158.1607606608667;
        Thu, 10 Dec 2020 05:23:28 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 05/14] core: drop line iterators
Date:   Thu, 10 Dec 2020 14:23:06 +0100
Message-Id: <20201210132315.5785-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hand-crafted iterators don't make much sense in C and impose an
additional layer of memory allocation and resource releasing. Remove
the line iterators from the core C library.

We're leaving the iterators where they make sense: in C++ and Python
bindings but we convert them to using other means of keeping track of
lines.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp        |  1 -
 bindings/cxx/iter.cpp         | 28 +++++---------------
 bindings/python/gpiodmodule.c | 21 +++++----------
 include/gpiod.h               | 36 --------------------------
 lib/helpers.c                 | 32 ++++++++++-------------
 lib/iter.c                    | 48 -----------------------------------
 tests/gpiod-test.h            |  2 --
 tests/tests-iter.c            | 23 -----------------
 tools/gpioinfo.c              | 14 ++++------
 9 files changed, 33 insertions(+), 172 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 8c8e6c9..0f1d9b2 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -1083,7 +1083,6 @@ public:
 
 private:
 
-	::std::shared_ptr<::gpiod_line_iter> _m_iter;
 	line _m_current;
 };
 
diff --git a/bindings/cxx/iter.cpp b/bindings/cxx/iter.cpp
index 7985910..15c3925 100644
--- a/bindings/cxx/iter.cpp
+++ b/bindings/cxx/iter.cpp
@@ -17,23 +17,6 @@ void chip_iter_deleter(::gpiod_chip_iter* iter)
 	::gpiod_chip_iter_free_noclose(iter);
 }
 
-void line_iter_deleter(::gpiod_line_iter* iter)
-{
-	::gpiod_line_iter_free(iter);
-}
-
-::gpiod_line_iter* make_line_iter(::gpiod_chip* chip)
-{
-	::gpiod_line_iter* iter;
-
-	iter = ::gpiod_line_iter_new(chip);
-	if (!iter)
-		throw ::std::system_error(errno, ::std::system_category(),
-					  "error creating GPIO line iterator");
-
-	return iter;
-}
-
 } /* namespace */
 
 chip_iter make_chip_iter(void)
@@ -105,17 +88,20 @@ line_iter end(const line_iter&) noexcept
 }
 
 line_iter::line_iter(const chip& owner)
-	: _m_iter(make_line_iter(owner._m_chip.get()), line_iter_deleter),
-	  _m_current(line(::gpiod_line_iter_next(this->_m_iter.get()), owner))
+	: _m_current(owner.get_line(0))
 {
 
 }
 
 line_iter& line_iter::operator++(void)
 {
-	::gpiod_line* next = ::gpiod_line_iter_next(this->_m_iter.get());
+	unsigned int offset = this->_m_current.offset() + 1;
+	chip owner = this->_m_current.get_chip();
 
-	this->_m_current = next ? line(next, this->_m_current._m_owner) : line();
+	if (offset == owner.num_lines())
+		this->_m_current = line(); /* Last element */
+	else
+		this->_m_current = owner.get_line(offset);
 
 	return *this;
 }
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index b9b5770..11d1407 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -41,7 +41,7 @@ typedef struct {
 
 typedef struct {
 	PyObject_HEAD
-	struct gpiod_line_iter *iter;
+	unsigned int offset;
 	gpiod_ChipObject *owner;
 } gpiod_LineIterObject;
 
@@ -2621,14 +2621,7 @@ static int gpiod_LineIter_init(gpiod_LineIterObject *self,
 	if (gpiod_ChipIsClosed(chip_obj))
 		return -1;
 
-	Py_BEGIN_ALLOW_THREADS;
-	self->iter = gpiod_line_iter_new(chip_obj->chip);
-	Py_END_ALLOW_THREADS;
-	if (!self->iter) {
-		PyErr_SetFromErrno(PyExc_OSError);
-		return -1;
-	}
-
+	self->offset = 0;
 	self->owner = chip_obj;
 	Py_INCREF(chip_obj);
 
@@ -2637,9 +2630,6 @@ static int gpiod_LineIter_init(gpiod_LineIterObject *self,
 
 static void gpiod_LineIter_dealloc(gpiod_LineIterObject *self)
 {
-	if (self->iter)
-		gpiod_line_iter_free(self->iter);
-
 	PyObject_Del(self);
 }
 
@@ -2647,10 +2637,13 @@ static gpiod_LineObject *gpiod_LineIter_next(gpiod_LineIterObject *self)
 {
 	struct gpiod_line *line;
 
-	line = gpiod_line_iter_next(self->iter);
-	if (!line)
+	if (self->offset == gpiod_chip_num_lines(self->owner->chip))
 		return NULL; /* Last element. */
 
+	line = gpiod_chip_get_line(self->owner->chip, self->offset++);
+	if (!line)
+		return (gpiod_LineObject *)PyErr_SetFromErrno(PyExc_OSError);
+
 	return gpiod_MakeLineObject(self->owner, line);
 }
 
diff --git a/include/gpiod.h b/include/gpiod.h
index 9ffb446..b5965ed 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -40,7 +40,6 @@ extern "C" {
 struct gpiod_chip;
 struct gpiod_line;
 struct gpiod_chip_iter;
-struct gpiod_line_iter;
 struct gpiod_line_bulk;
 
 /**
@@ -1202,41 +1201,6 @@ gpiod_chip_iter_next_noclose(struct gpiod_chip_iter *iter) GPIOD_API;
 	     (chip);							\
 	     (chip) = gpiod_chip_iter_next_noclose(iter))
 
-/**
- * @brief Create a new line iterator.
- * @param chip Active gpiochip handle over the lines of which we want
- *             to iterate.
- * @return New line iterator or NULL if an error occurred.
- */
-struct gpiod_line_iter *
-gpiod_line_iter_new(struct gpiod_chip *chip) GPIOD_API;
-
-/**
- * @brief Free all resources associated with a GPIO line iterator.
- * @param iter Line iterator object.
- */
-void gpiod_line_iter_free(struct gpiod_line_iter *iter) GPIOD_API;
-
-/**
- * @brief Get the next GPIO line handle.
- * @param iter The GPIO line iterator object.
- * @return Pointer to the next GPIO line handle or NULL if there are no more
- *         lines left.
- */
-struct gpiod_line *
-gpiod_line_iter_next(struct gpiod_line_iter *iter) GPIOD_API;
-
-/**
- * @brief Iterate over all GPIO lines of a single chip.
- * @param iter An initialized GPIO line iterator.
- * @param line Pointer to a GPIO line handle - on each iteration, the
- *             next GPIO line will be assigned to this argument.
- */
-#define gpiod_foreach_line(iter, line)					\
-	for ((line) = gpiod_line_iter_next(iter);			\
-	     (line);							\
-	     (line) = gpiod_line_iter_next(iter))
-
 /**
  * @}
  *
diff --git a/lib/helpers.c b/lib/helpers.c
index a343f71..3b7428b 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -124,24 +124,23 @@ gpiod_chip_get_lines(struct gpiod_chip *chip,
 
 struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 {
-	struct gpiod_line_iter *iter;
 	struct gpiod_line_bulk *bulk;
 	struct gpiod_line *line;
+	unsigned int offset;
 
 	bulk = gpiod_line_bulk_new(gpiod_chip_num_lines(chip));
 	if (!bulk)
 		return NULL;
 
-	iter = gpiod_line_iter_new(chip);
-	if (!iter) {
-		gpiod_line_bulk_free(bulk);
-		return NULL;
-	}
+	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
+		line = gpiod_chip_get_line(chip, offset);
+		if (!line) {
+			gpiod_line_bulk_free(bulk);
+			return NULL;
+		}
 
-	gpiod_foreach_line(iter, line)
 		gpiod_line_bulk_add_line(bulk, line);
-
-	gpiod_line_iter_free(iter);
+	}
 
 	return bulk;
 }
@@ -149,24 +148,21 @@ struct gpiod_line_bulk *gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 struct gpiod_line *
 gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 {
-	struct gpiod_line_iter *iter;
 	struct gpiod_line *line;
+	unsigned int offset;
 	const char *tmp;
 
-	iter = gpiod_line_iter_new(chip);
-	if (!iter)
-		return NULL;
+	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
+		line = gpiod_chip_get_line(chip, offset);
+		if (!line)
+			return NULL;
 
-	gpiod_foreach_line(iter, line) {
 		tmp = gpiod_line_name(line);
-		if (tmp && strcmp(tmp, name) == 0) {
-			gpiod_line_iter_free(iter);
+		if (tmp && strcmp(tmp, name) == 0)
 			return line;
-		}
 	}
 
 	errno = ENOENT;
-	gpiod_line_iter_free(iter);
 
 	return NULL;
 }
diff --git a/lib/iter.c b/lib/iter.c
index bfd2852..2ff767c 100644
--- a/lib/iter.c
+++ b/lib/iter.c
@@ -17,12 +17,6 @@ struct gpiod_chip_iter {
 	unsigned int offset;
 };
 
-struct gpiod_line_iter {
-	struct gpiod_line **lines;
-	unsigned int num_lines;
-	unsigned int offset;
-};
-
 static int dir_filter(const struct dirent *dir)
 {
 	return !strncmp(dir->d_name, "gpiochip", 8);
@@ -127,45 +121,3 @@ struct gpiod_chip *gpiod_chip_iter_next_noclose(struct gpiod_chip_iter *iter)
 	return iter->offset < (iter->num_chips)
 					? iter->chips[iter->offset++] : NULL;
 }
-
-struct gpiod_line_iter *gpiod_line_iter_new(struct gpiod_chip *chip)
-{
-	struct gpiod_line_iter *iter;
-	unsigned int i;
-
-	iter = malloc(sizeof(*iter));
-	if (!iter)
-		return NULL;
-
-	iter->num_lines = gpiod_chip_num_lines(chip);
-	iter->offset = 0;
-
-	iter->lines = calloc(iter->num_lines, sizeof(*iter->lines));
-	if (!iter->lines) {
-		free(iter);
-		return NULL;
-	}
-
-	for (i = 0; i < iter->num_lines; i++) {
-		iter->lines[i] = gpiod_chip_get_line(chip, i);
-		if (!iter->lines[i]) {
-			free(iter->lines);
-			free(iter);
-			return NULL;
-		}
-	}
-
-	return iter;
-}
-
-void gpiod_line_iter_free(struct gpiod_line_iter *iter)
-{
-	free(iter->lines);
-	free(iter);
-}
-
-struct gpiod_line *gpiod_line_iter_next(struct gpiod_line_iter *iter)
-{
-	return iter->offset < (iter->num_lines)
-					? iter->lines[iter->offset++] : NULL;
-}
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index a43109a..df9f0c7 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -26,12 +26,10 @@
 typedef struct gpiod_chip gpiod_chip_struct;
 typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
 typedef struct gpiod_chip_iter gpiod_chip_iter_struct;
-typedef struct gpiod_line_iter gpiod_line_iter_struct;
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_close);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_iter_struct, gpiod_chip_iter_free);
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_iter_struct, gpiod_line_iter_free);
 
 /* These are private definitions and should not be used directly. */
 typedef void (*_gpiod_test_func)(void);
diff --git a/tests/tests-iter.c b/tests/tests-iter.c
index 8deee8e..163a820 100644
--- a/tests/tests-iter.c
+++ b/tests/tests-iter.c
@@ -98,26 +98,3 @@ GPIOD_TEST_CASE(chip_iter_break, 0, { 8, 8, 8, 8, 8 })
 
 	g_assert_cmpuint(i, ==, 3);
 }
-
-GPIOD_TEST_CASE(line_iter, 0, { 8 })
-{
-	g_autoptr(gpiod_line_iter_struct) iter = NULL;
-	g_autoptr(gpiod_chip_struct) chip = NULL;
-	struct gpiod_line *line;
-	guint i = 0;
-
-	chip = gpiod_chip_open(gpiod_test_chip_path(0));
-	g_assert_nonnull(chip);
-	gpiod_test_return_if_failed();
-
-	iter = gpiod_line_iter_new(chip);
-	g_assert_nonnull(iter);
-	gpiod_test_return_if_failed();
-
-	gpiod_foreach_line(iter, line) {
-		g_assert_cmpuint(i, ==, gpiod_line_offset(line));
-		i++;
-	}
-
-	g_assert_cmpuint(i, ==, 8);
-}
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 67be379..dd4a388 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -116,22 +116,20 @@ static PRINTF(3, 4) void prinfo(bool *of,
 
 static void list_lines(struct gpiod_chip *chip)
 {
-	struct gpiod_line_iter *iter;
 	int direction, active_state;
 	const char *name, *consumer;
 	struct gpiod_line *line;
 	unsigned int i, offset;
 	bool flag_printed, of;
 
-	iter = gpiod_line_iter_new(chip);
-	if (!iter)
-		die_perror("error creating line iterator");
-
 	printf("%s - %u lines:\n",
 	       gpiod_chip_name(chip), gpiod_chip_num_lines(chip));
 
-	gpiod_foreach_line(iter, line) {
-		offset = gpiod_line_offset(line);
+	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
+		line = gpiod_chip_get_line(chip, offset);
+		if (!line)
+			die_perror("unable to retrieve the line object from chip");
+
 		name = gpiod_line_name(line);
 		consumer = gpiod_line_consumer(line);
 		direction = gpiod_line_direction(line);
@@ -178,8 +176,6 @@ static void list_lines(struct gpiod_chip *chip)
 
 		printf("\n");
 	}
-
-	gpiod_line_iter_free(iter);
 }
 
 int main(int argc, char **argv)
-- 
2.29.1

