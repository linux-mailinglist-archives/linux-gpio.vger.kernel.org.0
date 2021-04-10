Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1B335AE89
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 16:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234823AbhDJOw1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Apr 2021 10:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbhDJOw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Apr 2021 10:52:27 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0EEC06138A
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:12 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a4so8424163wrr.2
        for <linux-gpio@vger.kernel.org>; Sat, 10 Apr 2021 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MZs3J/WcRafThUPdEYQTBq1qLGFGoq4SDnhhmkyfytY=;
        b=Z8N9/vZj9MlXk5JzgrLbaKg3KjTNqpWNw5miBMwoA2L5Hh/MbWN957RrwbEasJnPwh
         9j9AcKLCm3jenGGNh1WxCGiCqtIuGMLxBZCYMoNHEKqBoIaCzI3w85L0PhRAgxK5Gf/G
         2GMai53NCHzTpPWkFsZEEbcSZKcKflbvkfY6ZiR/9R6AOoKSh5ehH7RcUodgRxhxP0Cn
         HJGGJFqnyhJRpb5u/vE3AMb/yEQnPDjc0tq6ccmNHaSr8QNgVmY5KAmxgPZTShLljfid
         wE/NRAisFqio6KyFNJN5Xlm9k50EXEyJoMgiM2yYDk+RbGHPlrRHPtS0kS00S5aLXw1x
         jCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MZs3J/WcRafThUPdEYQTBq1qLGFGoq4SDnhhmkyfytY=;
        b=mPY4+niqaM4TDGKVwQM8wdORprnCg+by98yX+3AgOmhxdAVBHfmowTKpseI7B4ri34
         UnzpKNqWjTcLAzj4h/c60+Mq8GJ3pQ3YVKWTF+ZCigmL1R3bR5xlkweAq4w1j90YWmVf
         /gKyKMHCjxiNHUhR1ipr1FkATxeh22iD0rfvqh3sPhbaZbDLgx8djo1omNc6PBC/DFok
         dVHIEm1NiWAPjWZNTxV2E39gj8skksCZ1dhjVnfC6wQtCHu5A8R0Asw3RI25yUCr2pRZ
         tthmqWxAeTKkkxNOjakN/+4cCNsLM4UdCe1Hqt3wPW8X+VdDvvODd/8v6B2DpdUJ0tgl
         pd3w==
X-Gm-Message-State: AOAM5332x/3iw7wtLxQopU1grfmmlaXQBZxq+SoetEH48cY/kD2Suu4k
        fB5e3cVsg+eIhPxcYJbRgq6xj6KHUe8RoQ==
X-Google-Smtp-Source: ABdhPJxgJJX1RFLUALD0wQRk9UhvKvCKo0eeHcqv9zSqqkuIqBbtQ5hdTVLgzv0+cfUAo59w6IamzQ==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr6036011wrr.319.1618066331345;
        Sat, 10 Apr 2021 07:52:11 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a15sm9167083wrr.53.2021.04.10.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:52:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][RFC 1/6] treewide: rename chip property accessors
Date:   Sat, 10 Apr 2021 16:51:52 +0200
Message-Id: <20210410145157.30718-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210410145157.30718-1-brgl@bgdev.pl>
References: <20210410145157.30718-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In v2 API all getters will be called using the following pattern:

    gpiod_<object>_get_<what>

Apply this to already existing getters for gpiod_chip.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/cxx/chip.cpp         |  6 +++---
 bindings/python/gpiodmodule.c | 14 +++++++-------
 include/gpiod.h               |  6 +++---
 lib/core.c                    |  6 +++---
 lib/helpers.c                 |  6 +++---
 tests/tests-chip.c            | 25 ++++++++++++++-----------
 tools/gpiodetect.c            |  6 +++---
 tools/gpiofind.c              |  2 +-
 tools/gpioinfo.c              |  4 ++--
 9 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index d5a9837..ee6ab6f 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -62,21 +62,21 @@ GPIOD_CXX_API ::std::string chip::name(void) const
 {
 	this->throw_if_noref();
 
-	return ::std::string(::gpiod_chip_name(this->_m_chip.get()));
+	return ::std::string(::gpiod_chip_get_name(this->_m_chip.get()));
 }
 
 GPIOD_CXX_API ::std::string chip::label(void) const
 {
 	this->throw_if_noref();
 
-	return ::std::string(::gpiod_chip_label(this->_m_chip.get()));
+	return ::std::string(::gpiod_chip_get_label(this->_m_chip.get()));
 }
 
 GPIOD_CXX_API unsigned int chip::num_lines(void) const
 {
 	this->throw_if_noref();
 
-	return ::gpiod_chip_num_lines(this->_m_chip.get());
+	return ::gpiod_chip_get_num_lines(this->_m_chip.get());
 }
 
 GPIOD_CXX_API line chip::get_line(unsigned int offset) const
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 8bfb4c4..ed039e4 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1918,9 +1918,9 @@ static PyObject *gpiod_Chip_repr(gpiod_ChipObject *self)
 		return NULL;
 
 	return PyUnicode_FromFormat("'%s /%s/ %u lines'",
-				    gpiod_chip_name(self->chip),
-				    gpiod_chip_label(self->chip),
-				    gpiod_chip_num_lines(self->chip));
+				    gpiod_chip_get_name(self->chip),
+				    gpiod_chip_get_label(self->chip),
+				    gpiod_chip_get_num_lines(self->chip));
 }
 
 PyDoc_STRVAR(gpiod_Chip_close_doc,
@@ -1971,7 +1971,7 @@ static PyObject *gpiod_Chip_name(gpiod_ChipObject *self,
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	return PyUnicode_FromFormat("%s", gpiod_chip_name(self->chip));
+	return PyUnicode_FromFormat("%s", gpiod_chip_get_name(self->chip));
 }
 
 PyDoc_STRVAR(gpiod_Chip_label_doc,
@@ -1985,7 +1985,7 @@ static PyObject *gpiod_Chip_label(gpiod_ChipObject *self,
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	return PyUnicode_FromFormat("%s", gpiod_chip_label(self->chip));
+	return PyUnicode_FromFormat("%s", gpiod_chip_get_label(self->chip));
 }
 
 PyDoc_STRVAR(gpiod_Chip_num_lines_doc,
@@ -1999,7 +1999,7 @@ static PyObject *gpiod_Chip_num_lines(gpiod_ChipObject *self,
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	return Py_BuildValue("I", gpiod_chip_num_lines(self->chip));
+	return Py_BuildValue("I", gpiod_chip_get_num_lines(self->chip));
 }
 
 static gpiod_LineObject *
@@ -2381,7 +2381,7 @@ static gpiod_LineObject *gpiod_LineIter_next(gpiod_LineIterObject *self)
 {
 	struct gpiod_line *line;
 
-	if (self->offset == gpiod_chip_num_lines(self->owner->chip))
+	if (self->offset == gpiod_chip_get_num_lines(self->owner->chip))
 		return NULL; /* Last element. */
 
 	line = gpiod_chip_get_line(self->owner->chip, self->offset++);
diff --git a/include/gpiod.h b/include/gpiod.h
index 5aea01f..a4ce01f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -94,21 +94,21 @@ void gpiod_chip_unref(struct gpiod_chip *chip);
  * @param chip The GPIO chip object.
  * @return Pointer to a human-readable string containing the chip name.
  */
-const char *gpiod_chip_name(struct gpiod_chip *chip);
+const char *gpiod_chip_get_name(struct gpiod_chip *chip);
 
 /**
  * @brief Get the GPIO chip label as represented in the kernel.
  * @param chip The GPIO chip object.
  * @return Pointer to a human-readable string containing the chip label.
  */
-const char *gpiod_chip_label(struct gpiod_chip *chip);
+const char *gpiod_chip_get_label(struct gpiod_chip *chip);
 
 /**
  * @brief Get the number of GPIO lines exposed by this chip.
  * @param chip The GPIO chip object.
  * @return Number of GPIO lines.
  */
-unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip);
+unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
 
 /**
  * @brief Get the handle to the GPIO line at given offset.
diff --git a/lib/core.c b/lib/core.c
index 32c4238..2e7ee4b 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -335,17 +335,17 @@ GPIOD_API void gpiod_chip_unref(struct gpiod_chip *chip)
 	free(chip);
 }
 
-GPIOD_API const char *gpiod_chip_name(struct gpiod_chip *chip)
+GPIOD_API const char *gpiod_chip_get_name(struct gpiod_chip *chip)
 {
 	return chip->name;
 }
 
-GPIOD_API const char *gpiod_chip_label(struct gpiod_chip *chip)
+GPIOD_API const char *gpiod_chip_get_label(struct gpiod_chip *chip)
 {
 	return chip->label;
 }
 
-GPIOD_API unsigned int gpiod_chip_num_lines(struct gpiod_chip *chip)
+GPIOD_API unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip)
 {
 	return chip->num_lines;
 }
diff --git a/lib/helpers.c b/lib/helpers.c
index 9c4b28e..fb53518 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -45,11 +45,11 @@ gpiod_chip_get_all_lines(struct gpiod_chip *chip)
 	struct gpiod_line *line;
 	unsigned int offset;
 
-	bulk = gpiod_line_bulk_new(gpiod_chip_num_lines(chip));
+	bulk = gpiod_line_bulk_new(gpiod_chip_get_num_lines(chip));
 	if (!bulk)
 		return NULL;
 
-	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
+	for (offset = 0; offset < gpiod_chip_get_num_lines(chip); offset++) {
 		line = gpiod_chip_get_line(chip, offset);
 		if (!line) {
 			gpiod_line_bulk_free(bulk);
@@ -68,7 +68,7 @@ GPIOD_API int gpiod_chip_find_line(struct gpiod_chip *chip, const char *name)
 	struct gpiod_line *line;
 	const char *tmp;
 
-	num_lines = gpiod_chip_num_lines(chip);
+	num_lines = gpiod_chip_get_num_lines(chip);
 
 	for (offset = 0; offset < num_lines; offset++) {
 		line = gpiod_chip_get_line(chip, offset);
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index a87dc9a..46fb8d2 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -63,9 +63,12 @@ GPIOD_TEST_CASE(get_name, 0, { 8, 8, 8})
 	g_assert_nonnull(chip2);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpstr(gpiod_chip_name(chip0), ==, gpiod_test_chip_name(0));
-	g_assert_cmpstr(gpiod_chip_name(chip1), ==, gpiod_test_chip_name(1));
-	g_assert_cmpstr(gpiod_chip_name(chip2), ==, gpiod_test_chip_name(2));
+	g_assert_cmpstr(gpiod_chip_get_name(chip0), ==,
+			gpiod_test_chip_name(0));
+	g_assert_cmpstr(gpiod_chip_get_name(chip1), ==,
+			gpiod_test_chip_name(1));
+	g_assert_cmpstr(gpiod_chip_get_name(chip2), ==,
+			gpiod_test_chip_name(2));
 }
 
 GPIOD_TEST_CASE(get_label, 0, { 8, 8, 8})
@@ -83,9 +86,9 @@ GPIOD_TEST_CASE(get_label, 0, { 8, 8, 8})
 	g_assert_nonnull(chip2);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpstr(gpiod_chip_label(chip0), ==, "gpio-mockup-A");
-	g_assert_cmpstr(gpiod_chip_label(chip1), ==, "gpio-mockup-B");
-	g_assert_cmpstr(gpiod_chip_label(chip2), ==, "gpio-mockup-C");
+	g_assert_cmpstr(gpiod_chip_get_label(chip0), ==, "gpio-mockup-A");
+	g_assert_cmpstr(gpiod_chip_get_label(chip1), ==, "gpio-mockup-B");
+	g_assert_cmpstr(gpiod_chip_get_label(chip2), ==, "gpio-mockup-C");
 }
 
 GPIOD_TEST_CASE(num_lines, 0, { 1, 4, 8, 16, 32 })
@@ -109,11 +112,11 @@ GPIOD_TEST_CASE(num_lines, 0, { 1, 4, 8, 16, 32 })
 	g_assert_nonnull(chip4);
 	gpiod_test_return_if_failed();
 
-	g_assert_cmpuint(gpiod_chip_num_lines(chip0), ==, 1);
-	g_assert_cmpuint(gpiod_chip_num_lines(chip1), ==, 4);
-	g_assert_cmpuint(gpiod_chip_num_lines(chip2), ==, 8);
-	g_assert_cmpuint(gpiod_chip_num_lines(chip3), ==, 16);
-	g_assert_cmpuint(gpiod_chip_num_lines(chip4), ==, 32);
+	g_assert_cmpuint(gpiod_chip_get_num_lines(chip0), ==, 1);
+	g_assert_cmpuint(gpiod_chip_get_num_lines(chip1), ==, 4);
+	g_assert_cmpuint(gpiod_chip_get_num_lines(chip2), ==, 8);
+	g_assert_cmpuint(gpiod_chip_get_num_lines(chip3), ==, 16);
+	g_assert_cmpuint(gpiod_chip_get_num_lines(chip4), ==, 32);
 }
 
 GPIOD_TEST_CASE(get_line, 0, { 16 })
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 9f4c28c..10706e2 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -76,9 +76,9 @@ int main(int argc, char **argv)
 		}
 
 		printf("%s [%s] (%u lines)\n",
-		       gpiod_chip_name(chip),
-		       gpiod_chip_label(chip),
-		       gpiod_chip_num_lines(chip));
+		       gpiod_chip_get_name(chip),
+		       gpiod_chip_get_label(chip),
+		       gpiod_chip_get_num_lines(chip));
 
 		gpiod_chip_unref(chip);
 		free(entries[i]);
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 83af76b..32b7852 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -76,7 +76,7 @@ int main(int argc, char **argv)
 		offset = gpiod_chip_find_line(chip, argv[0]);
 		if (offset >= 0) {
 			printf("%s %u\n",
-			       gpiod_chip_name(chip), offset);
+			       gpiod_chip_get_name(chip), offset);
 			gpiod_chip_unref(chip);
 			return EXIT_SUCCESS;
 		}
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index eba8c72..3d89111 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -130,9 +130,9 @@ static void list_lines(struct gpiod_chip *chip)
 	int direction;
 
 	printf("%s - %u lines:\n",
-	       gpiod_chip_name(chip), gpiod_chip_num_lines(chip));
+	       gpiod_chip_get_name(chip), gpiod_chip_get_num_lines(chip));
 
-	for (offset = 0; offset < gpiod_chip_num_lines(chip); offset++) {
+	for (offset = 0; offset < gpiod_chip_get_num_lines(chip); offset++) {
 		line = gpiod_chip_get_line(chip, offset);
 		if (!line)
 			die_perror("unable to retrieve the line object from chip");
-- 
2.30.1

