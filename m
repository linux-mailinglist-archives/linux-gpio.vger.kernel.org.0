Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E262533ECF
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 16:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244695AbiEYOH4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 10:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244720AbiEYOHe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 10:07:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D34EAE262
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 07:07:28 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id s28so30157709wrb.7
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 07:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKCdSgfjJIqcSgn2zsr32nYiNWARZVKhV09oJ7gcrOI=;
        b=u4yvnyEi1O7J3myGRFVPrdlNzswI8rP13AgTaTarqOSoKpoqgB1OHMU+JOX1W0sZFy
         loXFZ2dyRHS+L/ZiuIb5phLUbFIo+28WP1QYCOw8v/Xj0RKE1cmQaQByrwMxIfjLkp09
         v6XxwAmXWnMDn1hKaK/+EojovYIWJjtKgXztOq3rXnXbqrjNBkFiXlDKypkbyVijHkGi
         bXH8pQDqETuPeJ8rV9piqsAmQSyEZecMYF7AWblAoLc6ssUFUskLQYY0mtsiDI2cNN17
         XzJOdatHqfRaQWyruUcHZEh8Lot0HcQF2U4i9smO8vlC0KWfb3RyzqHyhlXAkQlU0Mzq
         u2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKCdSgfjJIqcSgn2zsr32nYiNWARZVKhV09oJ7gcrOI=;
        b=d7OiLvYoE/+CkxxE3KKOaLDLAfLMD/hIcCgvQoZojefT8ogaP25clDI+lwOhboFUtW
         fVp6Fkv7/NIWUOpCMHp7DMiJdTjahuKdPRcDXv3yYUKi43xaMqWqTs2DjPQ6TYRcUh0o
         rB09N0OxEDDzMAc+QgvSnOSj8zyRvp9eQ2h5X0UwVug52l5bDcjC8UXe0FdxOD6LFx6I
         gjbWKCoa/azOPw8wKVqbkAqMM4iu8MvXy/y/kxFCppdLHeZAiuUwYuUWDLncVf+3qsso
         nQ+I3F2nim6L9MSzflYIz5hhDNwYL/cEIo+mw+PoshCTLNZ89kVk9tZZgZ1I7vH8H9TL
         SrfA==
X-Gm-Message-State: AOAM530pM8LjeboC+usGa/7v7Ks+agckgyqJ6dNiSbKCMPpbqqCeFMcT
        YDBiLKwr1amDGmVC9FUveczHDQ==
X-Google-Smtp-Source: ABdhPJy1elt/+639lHleN7VvLzX624YEE73rrd/AvLBH76gQgUYdtK9RZZEU8eFAVoT8Rblld+R1QA==
X-Received: by 2002:a5d:47af:0:b0:20f:eb21:245f with SMTP id 15-20020a5d47af000000b0020feb21245fmr9468883wrb.6.1653487646590;
        Wed, 25 May 2022 07:07:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fb4f:2824:ee44:5505])
        by smtp.gmail.com with ESMTPSA id k42-20020a05600c1caa00b003973435c517sm2859570wms.0.2022.05.25.07.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:07:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 2/5] bindings: python: enum: add a piece of common code for using python's enums from C
Date:   Wed, 25 May 2022 16:07:01 +0200
Message-Id: <20220525140704.94983-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525140704.94983-1-brgl@bgdev.pl>
References: <20220525140704.94983-1-brgl@bgdev.pl>
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

