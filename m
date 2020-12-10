Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B3F2D5B98
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732217AbgLJNYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732941AbgLJNYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:24:09 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB5FC0617A6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:28 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a6so4644865wmc.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2020 05:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HrigySWoPLF+8s6ayGXgi4TAQuMuX/SPIQ5//z+/jHs=;
        b=ux55E9ubBwM7xvJdkWZdBDFSkk6QzRlDjqoIxTfNjgvZFMnzKZ+s0dFKmBfqTfzCJi
         MuR7MQNgkQlWA5cO+JtOJP87mMQHWGO/EylTs/skpiuxfPDtByGmbQjbqTdsKG7biW0d
         0baXwisWQb6lryrWsaEHTiHJjckUXKgfnj5qFiN1OIVM6fJKQH/xDuZrlqqG0cWSHM3F
         ldKuUGyFlyPM96PGraQZHnsc7WNzznNOaScaieZu5BXcGC+5h6qfzwkIe3m8YYvmBnZs
         TPc6J1WErV2tDOq5XY+5WaJurq/IEMTNfm01IZimt1ukTQ0RFUjy37My56vz3/d2IBBM
         /cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HrigySWoPLF+8s6ayGXgi4TAQuMuX/SPIQ5//z+/jHs=;
        b=Da/pTnhKbNH9O2xBkC2OM/d4jURjAXc4ifzh6G9y5abk+zkV+obaqr8A9mgvwsTD9+
         woGoAuKpl55J3aGmCNWuKiPjh9Cv+f9jQIxU4BIF+s1fpVNW0Dw7n6Yxu6BltWUFtqPi
         9DXyBmrO4H2n9h7IqxDLER5yLZO8Ub8tGwSPDC1mLQOMSdFSJHSHNfsQ1oNeSOkecp3A
         /vPaH1ihUV4RKtazfS1EDm2ST48MSiT1jjBveRIr9Hu6c1BAWvm3TErLZo8PQEoaXRes
         6FDaP0CGhyXuJIogEnEzLUf/iczLtuu0IvWbR9fs+bTeyZ2IwxvLr7h0naA1DgK4thso
         SVlA==
X-Gm-Message-State: AOAM530yG0/Y9lDKPB6nBNmWot2RFS0sy9Em+n9oXeRQYbRP1IpXR9jF
        DAh5oLAsdJzyvEY6s3aD2moarQ==
X-Google-Smtp-Source: ABdhPJxbpCLv+cugayOMHb91aEODaoloDclzUoLQ0xSCvre5GrTnqfYfXrSm3daI41a+k1UFFSJVqw==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr8000914wmd.20.1607606607419;
        Thu, 10 Dec 2020 05:23:27 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id n14sm9444811wmi.1.2020.12.10.05.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:23:26 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 04/14] bulk: drop the limit on the max number of lines
Date:   Thu, 10 Dec 2020 14:23:05 +0100
Message-Id: <20201210132315.5785-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201210132315.5785-1-brgl@bgdev.pl>
References: <20201210132315.5785-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The limit of 64 lines max per bulk object is wrong. We may want to
retrieve all lines from a chip exporting more than 64. We'll be reducing
the role of bulk objects soon so drop this limit now.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/line_bulk.cpp    |  2 +-
 bindings/python/gpiodmodule.c | 14 ++++++++------
 include/gpiod.h               |  7 -------
 lib/core.c                    |  8 +++++---
 tests/tests-bulk.c            |  9 ---------
 tools/gpiomon.c               |  5 ++++-
 6 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index 1de90eb..6e88d21 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -48,7 +48,7 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
 
 } /* namespace */
 
-const unsigned int line_bulk::MAX_LINES = GPIOD_LINE_BULK_MAX_LINES;
+const unsigned int line_bulk::MAX_LINES = 64;
 
 line_bulk::line_bulk(const ::std::vector<line>& lines)
 	: _m_bulk()
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index b5e69a5..b9b5770 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -8,6 +8,8 @@
 #include <Python.h>
 #include <gpiod.h>
 
+#define LINE_REQUEST_MAX_LINES 64
+
 typedef struct {
 	PyObject_HEAD
 	struct gpiod_chip *chip;
@@ -1138,7 +1140,7 @@ static int gpiod_LineBulk_init(gpiod_LineBulkObject *self,
 				"Argument must be a non-empty sequence");
 		return -1;
 	}
-	if (self->num_lines > GPIOD_LINE_BULK_MAX_LINES) {
+	if (self->num_lines > LINE_REQUEST_MAX_LINES) {
 		PyErr_SetString(PyExc_TypeError,
 				"Too many objects in the sequence");
 		return -1;
@@ -1334,7 +1336,7 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 				  NULL };
 
 	int rv, type = gpiod_LINE_REQ_DIR_AS_IS, flags = 0,
-	    default_vals[GPIOD_LINE_BULK_MAX_LINES], val;
+	    default_vals[LINE_REQUEST_MAX_LINES], val;
 	PyObject *def_vals_obj = NULL, *iter, *next;
 	struct gpiod_line_request_config conf;
 	struct gpiod_line_bulk *bulk;
@@ -1413,7 +1415,7 @@ PyDoc_STRVAR(gpiod_LineBulk_get_values_doc,
 static PyObject *gpiod_LineBulk_get_values(gpiod_LineBulkObject *self,
 					   PyObject *Py_UNUSED(ignored))
 {
-	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	int rv, vals[LINE_REQUEST_MAX_LINES];
 	struct gpiod_line_bulk *bulk;
 	PyObject *val_list, *val;
 	Py_ssize_t i;
@@ -1506,7 +1508,7 @@ PyDoc_STRVAR(gpiod_LineBulk_set_values_doc,
 static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 					   PyObject *args)
 {
-	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	int rv, vals[LINE_REQUEST_MAX_LINES];
 	struct gpiod_line_bulk *bulk;
 	PyObject *val_list;
 
@@ -1556,7 +1558,7 @@ PyDoc_STRVAR(gpiod_LineBulk_set_config_doc,
 static PyObject *gpiod_LineBulk_set_config(gpiod_LineBulkObject *self,
 					   PyObject *args)
 {
-	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	int rv, vals[LINE_REQUEST_MAX_LINES];
 	struct gpiod_line_bulk *bulk;
 	PyObject *val_list;
 	const int *valp;
@@ -1672,7 +1674,7 @@ static PyObject *gpiod_LineBulk_set_direction_output(
 				gpiod_LineBulkObject *self,
 				PyObject *args)
 {
-	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	int rv, vals[LINE_REQUEST_MAX_LINES];
 	struct gpiod_line_bulk *bulk;
 	PyObject *val_list;
 	const int *valp;
diff --git a/include/gpiod.h b/include/gpiod.h
index 742dfc2..9ffb446 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -225,17 +225,10 @@ gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names) GPIOD_API;
  * on multiple lines at once.
  */
 
-/**
- * @brief Maximum number of GPIO lines that can be requested at once or stored
- *        in a line bulk object at the same time.
- */
-#define GPIOD_LINE_BULK_MAX_LINES	64
-
 /**
  * @brief Allocate and initialize a new line bulk object.
  * @param max_lines Maximum number of lines this object can hold.
  * @return New line bulk object or NULL on error.
- * @note max_lines must not exceed ::GPIOD_LINE_BULK_MAX_LINES.
  */
 struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines) GPIOD_API;
 
diff --git a/lib/core.c b/lib/core.c
index efba959..d96e6cf 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -22,6 +22,8 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#define LINE_REQUEST_MAX_LINES	64
+
 enum {
 	LINE_FREE = 0,
 	LINE_REQUESTED_VALUES,
@@ -94,7 +96,7 @@ struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
 	struct gpiod_line_bulk *bulk;
 	size_t size;
 
-	if (max_lines < 1 || max_lines > GPIOD_LINE_BULK_MAX_LINES) {
+	if (max_lines == 0) {
 		errno = EINVAL;
 		return NULL;
 	}
@@ -1066,7 +1068,7 @@ int gpiod_line_set_flags(struct gpiod_line *line, int flags)
 int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
 {
 	struct gpiod_line *line;
-	int values[GPIOD_LINE_BULK_MAX_LINES];
+	int values[LINE_REQUEST_MAX_LINES];
 	unsigned int i;
 	int direction;
 
@@ -1129,7 +1131,7 @@ int gpiod_line_event_wait_bulk(struct gpiod_line_bulk *bulk,
 			       const struct timespec *timeout,
 			       struct gpiod_line_bulk *event_bulk)
 {
-	struct pollfd fds[GPIOD_LINE_BULK_MAX_LINES];
+	struct pollfd fds[LINE_REQUEST_MAX_LINES];
 	unsigned int off, num_lines;
 	struct gpiod_line *line;
 	int rv;
diff --git a/tests/tests-bulk.c b/tests/tests-bulk.c
index e2520fc..22cae84 100644
--- a/tests/tests-bulk.c
+++ b/tests/tests-bulk.c
@@ -20,15 +20,6 @@ GPIOD_TEST_CASE(alloc_zero_lines, 0, { 1 })
 	g_assert_cmpint(errno, ==, EINVAL);
 }
 
-GPIOD_TEST_CASE(alloc_too_many_lines, 0, { 1 })
-{
-	struct gpiod_line_bulk *bulk;
-
-	bulk = gpiod_line_bulk_new(GPIOD_LINE_BULK_MAX_LINES + 1);
-	g_assert_null(bulk);
-	g_assert_cmpint(errno, ==, EINVAL);
-}
-
 GPIOD_TEST_CASE(add_too_many_lines, 0, { 8 })
 {
 	g_autoptr(gpiod_line_bulk_struct) bulk = NULL;
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 44fb431..c271913 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -157,7 +157,7 @@ static void handle_signal(int signum UNUSED)
 
 int main(int argc, char **argv)
 {
-	unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES], num_lines = 0, offset,
+	unsigned int offsets[64], num_lines = 0, offset,
 		     events_wanted = 0, events_done = 0, x;
 	bool watch_rising = false, watch_falling = false;
 	int flags = 0;
@@ -241,6 +241,9 @@ int main(int argc, char **argv)
 	if (argc < 2)
 		die("at least one GPIO line offset must be specified");
 
+	if (argc > 65)
+		die("too many offsets given");
+
 	for (i = 1; i < argc; i++) {
 		offset = strtoul(argv[i], &end, 10);
 		if (*end != '\0' || offset > INT_MAX)
-- 
2.29.1

