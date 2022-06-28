Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A00E55C3AE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244025AbiF1Imk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343993AbiF1Imk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:42:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE7B2D1D2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:34 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q9so16576202wrd.8
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKCdSgfjJIqcSgn2zsr32nYiNWARZVKhV09oJ7gcrOI=;
        b=FD6YuZKQwgmevthCLG9naUCiLeE/4E5fMRFpv9yt/L7VD3GUXbn+PvyJvBZ9rUTklL
         JCJE6/jjU+6sKrrpSjYUSi44YVMrW7z+EAFGPaxesV5RPULNxFSlmzfaV4cAyfX8pNHl
         5L1MLQhaQFhhYrAWc/+oP1tDUiQq4RNe6RtHe0h2+mxXHauAZVkmGPae/u4keR44bsD4
         +ZQ9iibBrq1B+Ju05bhJqGguUGsdzw9vYDjEQV6Ju1A1G/Pontg/OQnxKzJps9npWmNQ
         L7iVIrYNdhgxh9TyfzOXtWV+ejzsyhLFFylSGOOw9NaEze+2ocGFP9tT6cdKf6hPysKl
         ZRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKCdSgfjJIqcSgn2zsr32nYiNWARZVKhV09oJ7gcrOI=;
        b=lhIoMFBEcjiDaBxjz423dqk0Qy8nGI79PWSO3hrzvvL4hDHoEZnDbdWBHXrACj8e0d
         PGY8qfBBKFgkmT6KbGsIn2dddMIgz9L8tvKarK9MOEEO3UZPx7P/iDnCZi+4r0LGBMR0
         XhqwocYQja4VVbd5YSOnJYW78X+7rp0q7XVlIB4/0meEOtA8ukltsKym/WspzNwOF8zt
         jehHFRzwmoo1NAB4lwzFZXrEfQnF3jyuXl3jzFybwA5zlp7J2E5CElDlD7BWv2pgXwI7
         Gke/NK+AaMg64ja8CHrp51DOzKlwVHSE7B32rBC/fhaO8o2e0awJiqlV6HhL7s7hx3LE
         uQDA==
X-Gm-Message-State: AJIora/JodJV7o7JMUYqaLsKDvw5GfwgU25yzPV4SN+vzh7AwOC4xDVG
        QpGZWNtHT0yTM73GBZbgfbbBsA==
X-Google-Smtp-Source: AGRyM1u8hMlpbJ8gm7v/DaubY/PdWV8kXPnYBQ8PzoVbKhWzRsh92VX6eYRI2Nu+cog5ONl2NI7V8A==
X-Received: by 2002:adf:dd84:0:b0:21b:88da:c755 with SMTP id x4-20020adfdd84000000b0021b88dac755mr17188831wrl.495.1656405752568;
        Tue, 28 Jun 2022 01:42:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:51e:c065:fa3f:a137])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0021badf3cb26sm15596062wrr.63.2022.06.28.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:42:32 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 2/5] bindings: python: enum: add a piece of common code for using python's enums from C
Date:   Tue, 28 Jun 2022 10:42:23 +0200
Message-Id: <20220628084226.472035-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628084226.472035-1-brgl@bgdev.pl>
References: <20220628084226.472035-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a small library of code that will be used both by the test
module as well as the main gpiod module for creating enum types in C

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/enum/Makefile.am |   9 ++
 bindings/python/enum/enum.c      | 208 +++++++++++++++++++++++++++++++
 bindings/python/enum/enum.h      |  24 ++++
 3 files changed, 241 insertions(+)
 create mode 100644 bindings/python/enum/Makefile.am
 create mode 100644 bindings/python/enum/enum.c
 create mode 100644 bindings/python/enum/enum.h

diff --git a/bindings/python/enum/Makefile.am b/bindings/python/enum/Makefile.am
new file mode 100644
index 0000000..7dd4a12
--- /dev/null
+++ b/bindings/python/enum/Makefile.am
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+noinst_LTLIBRARIES = libpycenum.la
+libpycenum_la_SOURCES = enum.c enum.h
+
+libpycenum_la_CFLAGS = -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
+libpycenum_la_LDFLAGS = -module -avoid-version
+libpycenum_la_LIBADD = $(PYTHON_LIBS)
diff --git a/bindings/python/enum/enum.c b/bindings/python/enum/enum.c
new file mode 100644
index 0000000..22a384a
--- /dev/null
+++ b/bindings/python/enum/enum.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+/* Code allowing to inherit from enum.Enum in a C extension. */
+
+#include "enum.h"
+
+static PyObject *make_enum_args(const PyCEnum_EnumDef *enum_def)
+{
+	PyObject *dict, *args, *key, *val, *name;
+	const PyCEnum_EnumVal *item;
+	int ret;
+
+	dict = PyDict_New();
+	if (!dict)
+		return NULL;
+
+	for (item = enum_def->values; item->name; item++) {
+		key = PyUnicode_FromString(item->name);
+		if (!key) {
+			Py_DECREF(dict);
+			return NULL;
+		}
+
+		val = PyLong_FromLong(item->value);
+		if (!val) {
+			Py_DECREF(key);
+			Py_DECREF(dict);
+			return NULL;
+		}
+
+		ret = PyDict_SetItem(dict, key, val);
+		Py_DECREF(key);
+		Py_DECREF(val);
+		if (ret) {
+			Py_DECREF(dict);
+			return NULL;
+		}
+	}
+
+	name = PyUnicode_FromString(enum_def->name);
+	if (!name) {
+		Py_DECREF(dict);
+		return NULL;
+	}
+
+	args = PyTuple_Pack(2, name, dict);
+	Py_DECREF(name);
+	Py_DECREF(dict);
+	return args;
+}
+
+static PyObject *make_enum_type(const PyCEnum_EnumDef *enum_def)
+{
+	PyObject *new_type, *args, *enum_mod, *enum_type;
+
+	args = make_enum_args(enum_def);
+	if (!args)
+		return NULL;
+
+	enum_mod = PyImport_ImportModule("enum");
+	if (!enum_mod) {
+		Py_DECREF(args);
+		return NULL;
+	}
+
+	enum_type = PyObject_GetAttrString(enum_mod, "Enum");
+	if (!enum_type) {
+		Py_DECREF(enum_mod);
+		Py_DECREF(args);
+		return NULL;
+	}
+
+	new_type = PyObject_Call(enum_type, args, NULL);
+	Py_DECREF(enum_type);
+	Py_DECREF(enum_mod);
+	Py_DECREF(args);
+	return new_type;
+}
+
+int PyCEnum_AddEnumsToType(const PyCEnum_EnumDef *defs, PyTypeObject *type)
+{
+	const PyCEnum_EnumDef *enum_def;
+	PyObject *enum_type;
+	int ret;
+
+	for (enum_def = defs; enum_def->name; enum_def++) {
+		enum_type = make_enum_type(enum_def);
+		if (!enum_type)
+			return -1;
+
+		ret = PyDict_SetItemString(type->tp_dict,
+					   enum_def->name, enum_type);
+		if (ret) {
+			Py_DECREF(enum_type);
+			return -1;
+		}
+	}
+
+	PyType_Modified(type);
+	return 0;
+}
+
+static PyObject *map_c_to_python(PyObject *iter, int value)
+{
+	PyObject *next, *val;
+	long num;
+
+	for (;;) {
+		next = PyIter_Next(iter);
+		if (!next)
+			break;
+
+		val = PyObject_GetAttrString(next, "value");
+		if (!val) {
+			Py_DECREF(next);
+			return NULL;
+		}
+
+		num = PyLong_AsLong(val);
+		Py_DECREF(val);
+
+		if (value == num)
+			return next;
+
+		Py_DECREF(next);
+	}
+
+	PyErr_SetString(PyExc_NotImplementedError,
+			"enum value does not exist");
+	return NULL;
+}
+
+PyObject *PyCEnum_MapCToPy(PyObject *parent, const char *enum_name, int value)
+{
+	PyObject *enum_type, *iter, *ret;
+
+	enum_type = PyObject_GetAttrString(parent, enum_name);
+	if (!enum_type)
+		return NULL;
+
+	iter = PyObject_GetIter(enum_type);
+	if (!iter) {
+		Py_DECREF(enum_type);
+		return NULL;
+	}
+
+	ret = map_c_to_python(iter, value);
+	Py_DECREF(iter);
+	Py_DECREF(enum_type);
+	Py_INCREF(ret);
+	return ret;
+}
+
+static int map_python_to_c(PyObject *iter, int value)
+{
+	PyObject *next, *val;
+	long num;
+
+	for (;;) {
+		next = PyIter_Next(iter);
+		if (!next)
+			break;
+
+		val = PyObject_GetAttrString(next, "value");
+		if (!val) {
+			Py_DECREF(next);
+			return -1;
+		}
+
+		num = PyLong_AsLong(val);
+		Py_DECREF(val);
+
+		if (value == num)
+			return value;
+
+		Py_DECREF(next);
+	}
+
+	PyErr_SetString(PyExc_NotImplementedError,
+			"enum value does not exist");
+	return -1;
+}
+
+int PyCEnum_MapPyToC(PyObject *parent, const char *enum_name, PyObject *value)
+{
+	PyObject *enum_type, *iter, *val;
+	int ret;
+
+	enum_type = PyObject_GetAttrString(parent, enum_name);
+	if (!enum_type)
+		return -1;
+
+	iter = PyObject_GetIter(enum_type);
+	if (!iter) {
+		Py_DECREF(enum_type);
+		return -1;
+	}
+
+	val = PyObject_GetAttrString(value, "value");
+	if (!val)
+		return -1;
+
+	ret = map_python_to_c(iter, PyLong_AsLong(val));
+	Py_DECREF(iter);
+	Py_DECREF(enum_type);
+	return ret;
+}
diff --git a/bindings/python/enum/enum.h b/bindings/python/enum/enum.h
new file mode 100644
index 0000000..28ddcaf
--- /dev/null
+++ b/bindings/python/enum/enum.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __LIBGPIOD_PYTHON_ENUM_H__
+#define __LIBGPIOD_PYTHON_ENUM_H__
+
+#include <Python.h>
+
+typedef struct {
+	const char *name;
+	long value;
+} PyCEnum_EnumVal;
+
+typedef struct {
+	const char *name;
+	const PyCEnum_EnumVal *values;
+} PyCEnum_EnumDef;
+
+int PyCEnum_AddEnumsToType(const PyCEnum_EnumDef *defs, PyTypeObject *type);
+
+PyObject *PyCEnum_MapCToPy(PyObject *parent, const char *enum_name, int value);
+int PyCEnum_MapPyToC(PyObject *parent, const char *enum_name, PyObject *value);
+
+#endif /* __LIBGPIOD_PYTHON_ENUM_H__ */
-- 
2.34.1

