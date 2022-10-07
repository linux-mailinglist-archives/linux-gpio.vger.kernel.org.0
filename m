Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2AD5F7A0B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 16:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiJGOzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 10:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiJGOzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 10:55:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA78C923D9
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 07:55:31 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bu30so7653619wrb.8
        for <linux-gpio@vger.kernel.org>; Fri, 07 Oct 2022 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9+bmcFR0M/o1Us5OXg3oO8d0KJXF2xDpETDGgj5DVM=;
        b=x+LSTkD5corC65k8WjVZU/c1WkfGBn41p5tCkxHDLMEpMdfL8ohaLzsN6UiOaDeLZc
         mkPLXsh0fG3AUJqgSwgWw/BtABNbpPZeA9V9uGoXtIt4a5hqSHRsKjXGYFrdJDs83U1+
         zYRNkg9dct5XYDBgfCXucOZ9BOPAAgb0Fo2v+Lca0gmBbhsVVrWgMB1XJ+1Tjqh9gl2h
         yfkpt0MrYImY6dhMWP6T/oV2lzKBbvezoRns1ARJtES9CyIF4RodLccQFNndwKXtNrSl
         0XEqEGTIwXLQASIb2d1RH/k32okpMAJUjcug8qPev24C6kbP92WcjESxluDvh+t6YEdG
         PE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9+bmcFR0M/o1Us5OXg3oO8d0KJXF2xDpETDGgj5DVM=;
        b=5OI1JHNWbS15Z8gzuROy26Uqp7/obFqlIRkIbPqFqUomrt/Dp5sk+MkqyPzqw2iN//
         8TFRYnTzodyQSqFyT1oLuD4RCeMNO7yp9hSgOvU1EnW/qHZfhIhpndkm+uSy6lvrX/G4
         s4GumnUljMCjRt706tjXQXSHUoOBIpWriaNQC6NsxIikfXQpHn+ph+OvW52qCMZegLkj
         zGzcsccrm52H9l01GOlNfJpC9eN3BYlfKbe3Tf2buQAfEaN0EIK+z5S/w/6n4EjJgftW
         nbGrjNbHZ5L92r0TXw54IFc8XfTiVJt3/BKffy9q4At/7DOpaQxkyQSc6ABsE9DT6MEF
         YwOw==
X-Gm-Message-State: ACrzQf2vxHgPLo5PJoyF6Q0KNJ7/+pFVl7s38kNd1U7NZ7tqLmoYb9Gz
        W1GB6CtJEmmpckm/LjS4VnIylQ==
X-Google-Smtp-Source: AMsMyM6zYjKCSuKq9Uds0rKgPcGXER+CsBodKtuh6RM0il2ehZYL1ioocjoyRmjpRTlOIsVg+wwY9Q==
X-Received: by 2002:adf:f04b:0:b0:22e:3a85:59bf with SMTP id t11-20020adff04b000000b0022e3a8559bfmr3342226wro.683.1665154529762;
        Fri, 07 Oct 2022 07:55:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5a9e:bab6:45e8:abe8])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d50c8000000b0022e36c1113fsm2294707wrt.13.2022.10.07.07.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:55:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 3/4] bindings: python: add tests
Date:   Fri,  7 Oct 2022 16:55:20 +0200
Message-Id: <20221007145521.329614-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007145521.329614-1-brgl@bgdev.pl>
References: <20221007145521.329614-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a test-suite for python bindings based on the gpio-sim kernel
module.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/tests/Makefile.am            |  17 +
 bindings/python/tests/__init__.py            |  17 +
 bindings/python/tests/__main__.py            |  16 +
 bindings/python/tests/gpiosim/Makefile.am    |   7 +
 bindings/python/tests/gpiosim/__init__.py    |   4 +
 bindings/python/tests/gpiosim/chip.py        |  66 +++
 bindings/python/tests/gpiosim/ext.c          | 345 ++++++++++++++
 bindings/python/tests/helpers.py             |  16 +
 bindings/python/tests/tests_chip.py          | 231 ++++++++++
 bindings/python/tests/tests_chip_info.py     |  52 +++
 bindings/python/tests/tests_edge_event.py    | 219 +++++++++
 bindings/python/tests/tests_info_event.py    | 189 ++++++++
 bindings/python/tests/tests_line_info.py     | 101 +++++
 bindings/python/tests/tests_line_request.py  | 449 +++++++++++++++++++
 bindings/python/tests/tests_line_settings.py |  79 ++++
 bindings/python/tests/tests_module.py        |  59 +++
 16 files changed, 1867 insertions(+)
 create mode 100644 bindings/python/tests/Makefile.am
 create mode 100644 bindings/python/tests/__init__.py
 create mode 100644 bindings/python/tests/__main__.py
 create mode 100644 bindings/python/tests/gpiosim/Makefile.am
 create mode 100644 bindings/python/tests/gpiosim/__init__.py
 create mode 100644 bindings/python/tests/gpiosim/chip.py
 create mode 100644 bindings/python/tests/gpiosim/ext.c
 create mode 100644 bindings/python/tests/helpers.py
 create mode 100644 bindings/python/tests/tests_chip.py
 create mode 100644 bindings/python/tests/tests_chip_info.py
 create mode 100644 bindings/python/tests/tests_edge_event.py
 create mode 100644 bindings/python/tests/tests_info_event.py
 create mode 100644 bindings/python/tests/tests_line_info.py
 create mode 100644 bindings/python/tests/tests_line_request.py
 create mode 100644 bindings/python/tests/tests_line_settings.py
 create mode 100644 bindings/python/tests/tests_module.py

diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
new file mode 100644
index 0000000..7dcdebb
--- /dev/null
+++ b/bindings/python/tests/Makefile.am
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+SUBDIRS = gpiosim
+
+EXTRA_DIST = \
+	helpers.py \
+	__init__.py \
+	__main__.py \
+	tests_chip_info.py \
+	tests_chip.py \
+	tests_edge_event.py \
+	tests_info_event.py \
+	tests_line_info.py \
+	tests_line_request.py \
+	tests_line_settings.py \
+	tests_module.py
diff --git a/bindings/python/tests/__init__.py b/bindings/python/tests/__init__.py
new file mode 100644
index 0000000..2bf14e6
--- /dev/null
+++ b/bindings/python/tests/__init__.py
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import os
+import unittest
+
+from packaging import version
+
+required_kernel_version = "5.19.0"
+current_version = os.uname().release.split("-")[0]
+
+if version.parse(current_version) < version.parse(required_kernel_version):
+    raise NotImplementedError(
+        "linux kernel version must be at least {} - got {}".format(
+            required_kernel_version, current_version
+        )
+    )
diff --git a/bindings/python/tests/__main__.py b/bindings/python/tests/__main__.py
new file mode 100644
index 0000000..b5d7f0a
--- /dev/null
+++ b/bindings/python/tests/__main__.py
@@ -0,0 +1,16 @@
+#!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import unittest
+
+from .tests_chip import *
+from .tests_chip_info import *
+from .tests_edge_event import *
+from .tests_info_event import *
+from .tests_line_info import *
+from .tests_line_settings import *
+from .tests_module import *
+from .tests_line_request import *
+
+unittest.main()
diff --git a/bindings/python/tests/gpiosim/Makefile.am b/bindings/python/tests/gpiosim/Makefile.am
new file mode 100644
index 0000000..7004f3a
--- /dev/null
+++ b/bindings/python/tests/gpiosim/Makefile.am
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+EXTRA_DIST = \
+	chip.py \
+	ext.c \
+	__init__.py
diff --git a/bindings/python/tests/gpiosim/__init__.py b/bindings/python/tests/gpiosim/__init__.py
new file mode 100644
index 0000000..f65e413
--- /dev/null
+++ b/bindings/python/tests/gpiosim/__init__.py
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from .chip import Chip
diff --git a/bindings/python/tests/gpiosim/chip.py b/bindings/python/tests/gpiosim/chip.py
new file mode 100644
index 0000000..65c5af1
--- /dev/null
+++ b/bindings/python/tests/gpiosim/chip.py
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from enum import Enum
+from typing import Optional
+
+
+class Chip:
+    """
+    Represents a simulated GPIO chip.
+    """
+
+    class Pull(Enum):
+        DOWN = _ext.PULL_DOWN
+        UP = _ext.PULL_UP
+
+    class Value(Enum):
+        INACTIVE = _ext.VALUE_INACTIVE
+        ACTIVE = _ext.VALUE_ACTIVE
+
+    class Direction(Enum):
+        INPUT = _ext.DIRECTION_INPUT
+        OUTPUT_HIGH = _ext.DIRECTION_OUTPUT_HIGH
+        OUTPUT_LOW = _ext.DIRECTION_OUTPUT_LOW
+
+    def __init__(
+        self,
+        /,
+        label: Optional[str] = None,
+        num_lines: Optional[int] = None,
+        line_names: Optional[dict[int, str]] = None,
+        hogs: Optional[dict[int, tuple[str, Direction]]] = None,
+    ):
+        self._chip = _ext.Chip()
+
+        if label:
+            self._chip.set_label(label)
+
+        if num_lines:
+            self._chip.set_num_lines(num_lines)
+
+        if line_names:
+            for off, name in line_names.items():
+                self._chip.set_line_name(off, name)
+
+        if hogs:
+            for off, (name, direction) in hogs.items():
+                self._chip.set_hog(off, name, direction.value)
+
+        self._chip.enable()
+
+    def get_value(self, offset: int) -> Value:
+        val = self._chip.get_value(offset)
+        return Chip.Value(val)
+
+    def set_pull(self, offset: int, pull: Pull) -> None:
+        self._chip.set_pull(offset, pull.value)
+
+    @property
+    def dev_path(self) -> str:
+        return self._chip.dev_path
+
+    @property
+    def name(self) -> str:
+        return self._chip.name
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
new file mode 100644
index 0000000..6671352
--- /dev/null
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <gpiosim.h>
+#include <Python.h>
+
+struct module_const {
+	const char *name;
+	long val;
+};
+
+static const struct module_const module_constants[] = {
+	{
+		.name = "PULL_DOWN",
+		.val = GPIOSIM_PULL_DOWN,
+	},
+	{
+		.name = "PULL_UP",
+		.val = GPIOSIM_PULL_UP,
+	},
+	{
+		.name = "VALUE_INACTIVE",
+		.val = GPIOSIM_VALUE_INACTIVE,
+	},
+	{
+		.name = "VALUE_ACTIVE",
+		.val = GPIOSIM_VALUE_ACTIVE,
+	},
+	{
+		.name = "DIRECTION_INPUT",
+		.val = GPIOSIM_HOG_DIR_INPUT,
+	},
+	{
+		.name = "DIRECTION_OUTPUT_HIGH",
+		.val = GPIOSIM_HOG_DIR_OUTPUT_HIGH,
+	},
+	{
+		.name = "DIRECTION_OUTPUT_LOW",
+		.val = GPIOSIM_HOG_DIR_OUTPUT_LOW,
+	},
+	{ }
+};
+
+struct module_state {
+	struct gpiosim_ctx *sim_ctx;
+};
+
+static void free_module_state(void *mod)
+{
+	struct module_state *state = PyModule_GetState((PyObject *)mod);
+
+	if (state->sim_ctx)
+		gpiosim_ctx_unref(state->sim_ctx);
+}
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "gpiosim._ext",
+	.m_size = sizeof(struct module_state),
+	.m_free = free_module_state,
+};
+
+typedef struct {
+	PyObject_HEAD
+	struct gpiosim_dev *dev;
+	struct gpiosim_bank *bank;
+} chip_object;
+
+static int chip_init(chip_object *self,
+		     PyObject *Py_UNUSED(ignored0),
+		     PyObject *Py_UNUSED(ignored1))
+{
+	struct module_state *state;
+	PyObject *mod;
+
+	mod = PyState_FindModule(&module_def);
+	if (!mod)
+		return -1;
+
+	state = PyModule_GetState(mod);
+
+	self->dev = gpiosim_dev_new(state->sim_ctx);
+	if (!self->dev) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return -1;
+	}
+
+	self->bank = gpiosim_bank_new(self->dev);
+	if (!self->bank) {
+		PyErr_SetFromErrno(PyExc_OSError);
+		return -1;
+	}
+
+	return 0;
+}
+
+static void chip_finalize(chip_object *self)
+{
+	if (self->bank)
+		gpiosim_bank_unref(self->bank);
+
+	if (self->dev) {
+		if (gpiosim_dev_is_live(self->dev))
+			gpiosim_dev_disable(self->dev);
+
+		gpiosim_dev_unref(self->dev);
+	}
+}
+
+static void chip_dealloc(PyObject *self)
+{
+	int ret;
+
+	ret = PyObject_CallFinalizerFromDealloc(self);
+	if (ret < 0)
+		return;
+
+	PyObject_Del(self);
+}
+
+static PyObject *chip_dev_path(chip_object *self, void *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiosim_bank_get_dev_path(self->bank));
+}
+
+static PyObject *chip_name(chip_object *self, void *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiosim_bank_get_chip_name(self->bank));
+}
+
+static PyGetSetDef chip_getset[] = {
+	{
+		.name = "dev_path",
+		.get = (getter)chip_dev_path,
+	},
+	{
+		.name = "name",
+		.get = (getter)chip_name,
+	},
+	{ }
+};
+
+static PyObject *chip_set_label(chip_object *self, PyObject *args)
+{
+	const char *label;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "s", &label);
+	if (!ret)
+		return NULL;
+
+	ret = gpiosim_bank_set_label(self->bank, label);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *chip_set_num_lines(chip_object *self, PyObject *args)
+{
+	unsigned int num_lines;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "I", &num_lines);
+	if (!ret)
+		return NULL;
+
+	ret = gpiosim_bank_set_num_lines(self->bank, num_lines);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *chip_set_line_name(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	const char *name;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "Is", &offset, &name);
+	if (!ret)
+		return NULL;
+
+	ret = gpiosim_bank_set_line_name(self->bank, offset, name);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *chip_set_hog(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	const char *name;
+	int ret, dir;
+
+	ret = PyArg_ParseTuple(args, "Isi", &offset, &name, &dir);
+	if (!ret)
+		return NULL;
+
+	ret = gpiosim_bank_hog_line(self->bank, offset, name, dir);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *chip_enable(chip_object *self, PyObject *Py_UNUSED(args))
+{
+	int ret;
+
+	ret = gpiosim_dev_enable(self->dev);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *chip_get_value(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	int ret, val;
+
+	ret = PyArg_ParseTuple(args, "I", &offset);
+	if (!ret)
+		return NULL;
+
+	val = gpiosim_bank_get_value(self->bank, offset);
+	if (val < 0)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	return PyLong_FromLong(val);
+}
+
+static PyObject *chip_set_pull(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	int ret, pull;
+
+	ret = PyArg_ParseTuple(args, "II", &offset, &pull);
+	if (!ret)
+		return NULL;
+
+	ret = gpiosim_bank_set_pull(self->bank, offset, pull);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyMethodDef chip_methods[] = {
+	{
+		.ml_name = "set_label",
+		.ml_meth = (PyCFunction)chip_set_label,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "set_num_lines",
+		.ml_meth = (PyCFunction)chip_set_num_lines,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "set_line_name",
+		.ml_meth = (PyCFunction)chip_set_line_name,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "set_hog",
+		.ml_meth = (PyCFunction)chip_set_hog,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "enable",
+		.ml_meth = (PyCFunction)chip_enable,
+		.ml_flags = METH_NOARGS,
+	},
+	{
+		.ml_name = "get_value",
+		.ml_meth = (PyCFunction)chip_get_value,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "set_pull",
+		.ml_meth = (PyCFunction)chip_set_pull,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+static PyTypeObject chip_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiosim.Chip",
+	.tp_basicsize = sizeof(chip_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)chip_init,
+	.tp_finalize = (destructor)chip_finalize,
+	.tp_dealloc = (destructor)chip_dealloc,
+	.tp_methods = chip_methods,
+	.tp_getset = chip_getset,
+};
+
+PyMODINIT_FUNC PyInit__ext(void)
+{
+	const struct module_const *modconst;
+	struct module_state *state;
+	PyObject *module;
+	int ret;
+
+	module = PyModule_Create(&module_def);
+	if (!module)
+		return NULL;
+
+	ret = PyState_AddModule(module, &module_def);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	state = PyModule_GetState(module);
+
+	state->sim_ctx = gpiosim_ctx_new();
+	if (!state->sim_ctx) {
+		Py_DECREF(module);
+		return PyErr_SetFromErrno(PyExc_OSError);
+	}
+
+	ret = PyModule_AddType(module, &chip_type);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	for (modconst = module_constants; modconst->name; modconst++) {
+		ret = PyModule_AddIntConstant(module,
+					      modconst->name, modconst->val);
+		if (ret) {
+			Py_DECREF(module);
+			return NULL;
+		}
+ 	}
+
+	return module;
+}
diff --git a/bindings/python/tests/helpers.py b/bindings/python/tests/helpers.py
new file mode 100644
index 0000000..f9a15e8
--- /dev/null
+++ b/bindings/python/tests/helpers.py
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import os
+
+
+class LinkGuard:
+    def __init__(self, src, dst):
+        self.src = src
+        self.dst = dst
+
+    def __enter__(self):
+        os.symlink(self.src, self.dst)
+
+    def __exit__(self, type, val, tb):
+        os.unlink(self.dst)
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
new file mode 100644
index 0000000..0d1effe
--- /dev/null
+++ b/bindings/python/tests/tests_chip.py
@@ -0,0 +1,231 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import errno
+import gpiod
+import os
+
+from . import gpiosim
+from .helpers import LinkGuard
+from unittest import TestCase
+
+
+class ChipConstructor(TestCase):
+    def test_open_existing_chip(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path):
+            pass
+
+    def test_open_existing_chip_with_keyword(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(path=sim.dev_path):
+            pass
+
+    def test_open_chip_by_link(self):
+        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        sim = gpiosim.Chip()
+
+        with LinkGuard(sim.dev_path, link):
+            with gpiod.Chip(link):
+                pass
+
+    def test_open_nonexistent_chip(self):
+        with self.assertRaises(OSError) as ex:
+            gpiod.Chip("/dev/nonexistent")
+
+        self.assertEqual(ex.exception.errno, errno.ENOENT)
+
+    def test_open_not_a_character_device(self):
+        with self.assertRaises(OSError) as ex:
+            gpiod.Chip("/tmp")
+
+        self.assertEqual(ex.exception.errno, errno.ENOTTY)
+
+    def test_open_not_a_gpio_device(self):
+        with self.assertRaises(OSError) as ex:
+            gpiod.Chip("/dev/null")
+
+        self.assertEqual(ex.exception.errno, errno.ENODEV)
+
+    def test_missing_path(self):
+        with self.assertRaises(TypeError):
+            gpiod.Chip()
+
+    def test_invalid_type_for_path(self):
+        with self.assertRaises(TypeError):
+            gpiod.Chip(4)
+
+
+class ChipBooleanConversion(TestCase):
+    def test_chip_bool(self):
+        sim = gpiosim.Chip()
+        chip = gpiod.Chip(sim.dev_path)
+        self.assertTrue(chip)
+        chip.close()
+        self.assertFalse(chip)
+
+
+class ChipProperties(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip()
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.sim = None
+
+    def test_get_chip_path(self):
+        self.assertEqual(self.sim.dev_path, self.chip.path)
+
+    def test_get_fd(self):
+        self.assertGreaterEqual(self.chip.fd, 0)
+
+    def test_properties_are_immutable(self):
+        with self.assertRaises(AttributeError):
+            self.chip.path = "foobar"
+
+        with self.assertRaises(AttributeError):
+            self.chip.fd = 4
+
+
+class ChipDevPathFromLink(TestCase):
+    def test_dev_path_open_by_link(self):
+        sim = gpiosim.Chip()
+        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+
+        with LinkGuard(sim.dev_path, link):
+            with gpiod.Chip(link) as chip:
+                self.assertEqual(chip.path, link)
+
+
+class ChipMapLine(TestCase):
+    def test_lookup_by_name_good(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.map_line("baz"), 4)
+
+    def test_lookup_by_name_good_keyword_argument(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.map_line(id="baz"), 4)
+
+    def test_lookup_bad_name(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            with self.assertRaises(FileNotFoundError):
+                chip.map_line("nonexistent")
+
+    def test_lookup_bad_offset(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            with self.assertRaises(ValueError):
+                chip.map_line(4)
+
+    def test_lookup_bad_offset_as_string(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            with self.assertRaises(ValueError):
+                chip.map_line("4")
+
+    def test_duplicate_names(self):
+        sim = gpiosim.Chip(
+            num_lines=8, line_names={1: "foo", 2: "bar", 4: "baz", 5: "bar"}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.map_line("bar"), 2)
+
+    def test_integer_offsets(self):
+        sim = gpiosim.Chip(num_lines=8, line_names={1: "foo", 2: "bar", 6: "baz"})
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.map_line(4), 4)
+            self.assertEqual(chip.map_line(1), 1)
+
+    def test_offsets_as_string(self):
+        sim = gpiosim.Chip(num_lines=8, line_names={1: "foo", 2: "bar", 7: "6"})
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            self.assertEqual(chip.map_line("2"), 2)
+            self.assertEqual(chip.map_line("6"), 7)
+
+
+class ClosedChipCannotBeUsed(TestCase):
+    def test_close_chip_and_try_to_use_it(self):
+        sim = gpiosim.Chip(label="foobar")
+
+        chip = gpiod.Chip(sim.dev_path)
+        chip.close()
+
+        with self.assertRaises(gpiod.ChipClosedError):
+            chip.path
+
+    def test_close_chip_and_try_controlled_execution(self):
+        sim = gpiosim.Chip()
+
+        chip = gpiod.Chip(sim.dev_path)
+        chip.close()
+
+        with self.assertRaises(gpiod.ChipClosedError):
+            with chip:
+                chip.fd
+
+    def test_close_chip_twice(self):
+        sim = gpiosim.Chip(label="foobar")
+        chip = gpiod.Chip(sim.dev_path)
+        chip.close()
+
+        with self.assertRaises(gpiod.ChipClosedError):
+            chip.close()
+
+
+class StringRepresentation(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, label="foobar")
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.sim = None
+
+    def test_repr(self):
+        self.assertEqual(repr(self.chip), 'Chip("{}")'.format(self.sim.dev_path))
+
+    def test_str(self):
+        info = self.chip.get_info()
+        self.assertEqual(
+            str(self.chip),
+            '<Chip path="{}" fd={} info=<ChipInfo name="{}" label="foobar" num_lines=4>>'.format(
+                self.sim.dev_path, self.chip.fd, info.name
+            ),
+        )
+
+
+class StringRepresentationClosed(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, label="foobar")
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.sim = None
+
+    def test_repr_closed(self):
+        self.chip.close()
+        self.assertEqual(repr(self.chip), "<Chip CLOSED>")
+
+    def test_str_closed(self):
+        self.chip.close()
+        self.assertEqual(str(self.chip), "<Chip CLOSED>")
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
new file mode 100644
index 0000000..d392ec3
--- /dev/null
+++ b/bindings/python/tests/tests_chip_info.py
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+
+from . import gpiosim
+from unittest import TestCase
+
+
+class ChipInfoProperties(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(label="foobar", num_lines=16)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.info = self.chip.get_info()
+
+    def tearDown(self):
+        self.info = None
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_chip_info_name(self):
+        self.assertEqual(self.info.name, self.sim.name)
+
+    def test_chip_info_label(self):
+        self.assertEqual(self.info.label, "foobar")
+
+    def test_chip_info_num_lines(self):
+        self.assertEqual(self.info.num_lines, 16)
+
+    def test_chip_info_properties_are_immutable(self):
+        with self.assertRaises(AttributeError):
+            self.info.name = "foobar"
+
+        with self.assertRaises(AttributeError):
+            self.info.num_lines = 4
+
+        with self.assertRaises(AttributeError):
+            self.info.label = "foobar"
+
+
+class ChipInfoStringRepresentation(TestCase):
+    def test_chip_info_str(self):
+        sim = gpiosim.Chip(label="foobar", num_lines=16)
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info = chip.get_info()
+
+            self.assertEqual(
+                str(info),
+                '<ChipInfo name="{}" label="foobar" num_lines=16>'.format(sim.name),
+            )
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
new file mode 100644
index 0000000..8d52fdd
--- /dev/null
+++ b/bindings/python/tests/tests_edge_event.py
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+import time
+
+from . import gpiosim
+from datetime import timedelta
+from functools import partial
+from gpiod.line import Direction, Edge
+from threading import Thread
+from unittest import TestCase
+
+EventType = gpiod.EdgeEvent.Type
+Pull = gpiosim.Chip.Pull
+
+
+class EdgeEventWaitTimeout(TestCase):
+    def test_event_wait_timeout(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.request_lines(
+            sim.dev_path,
+            {0: gpiod.LineSettings(edge_detection=Edge.BOTH)},
+        ) as req:
+            self.assertEqual(req.wait_edge_event(timedelta(microseconds=10000)), False)
+
+    def test_event_wait_timeout_float(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.request_lines(
+            sim.dev_path,
+            {0: gpiod.LineSettings(edge_detection=Edge.BOTH)},
+        ) as req:
+            self.assertEqual(req.wait_edge_event(0.01), False)
+
+
+class EdgeEventInvalidConfig(TestCase):
+    def test_output_mode_and_edge_detection(self):
+        sim = gpiosim.Chip()
+
+        with self.assertRaises(ValueError):
+            gpiod.request_lines(
+                sim.dev_path,
+                {
+                    0: gpiod.LineSettings(
+                        direction=Direction.OUTPUT, edge_detection=Edge.BOTH
+                    )
+                },
+            )
+
+
+class WaitingForEdgeEvents(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.thread = None
+
+    def tearDown(self):
+        if self.thread:
+            self.thread.join()
+            del self.thread
+        self.sim = None
+
+    def trigger_falling_and_rising_edge(self, offset):
+        time.sleep(0.05)
+        self.sim.set_pull(offset, Pull.UP)
+        time.sleep(0.05)
+        self.sim.set_pull(offset, Pull.DOWN)
+
+    def trigger_rising_edge_events_on_two_offsets(self, offset0, offset1):
+        time.sleep(0.05)
+        self.sim.set_pull(offset0, Pull.UP)
+        time.sleep(0.05)
+        self.sim.set_pull(offset1, Pull.UP)
+
+    def test_both_edge_events(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, {2: gpiod.LineSettings(edge_detection=Edge.BOTH)}
+        ) as req:
+            self.thread = Thread(
+                target=partial(self.trigger_falling_and_rising_edge, 2)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
+            events = req.read_edge_event()
+            self.assertEqual(len(events), 1)
+            event = events[0]
+            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 2)
+            ts_rising = event.timestamp_ns
+
+            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
+            events = req.read_edge_event()
+            self.assertEqual(len(events), 1)
+            event = events[0]
+            self.assertEqual(event.event_type, EventType.FALLING_EDGE)
+            self.assertEqual(event.line_offset, 2)
+            ts_falling = event.timestamp_ns
+
+            self.assertGreater(ts_falling, ts_rising)
+
+    def test_rising_edge_event(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.RISING)}
+        ) as req:
+            self.thread = Thread(
+                target=partial(self.trigger_falling_and_rising_edge, 6)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
+            events = req.read_edge_event()
+            self.assertEqual(len(events), 1)
+            event = events[0]
+            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 6)
+
+            self.assertFalse(req.wait_edge_event(timedelta(microseconds=10000)))
+
+    def test_rising_edge_event(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.FALLING)}
+        ) as req:
+            self.thread = Thread(
+                target=partial(self.trigger_falling_and_rising_edge, 6)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
+            events = req.read_edge_event()
+            self.assertEqual(len(events), 1)
+            event = events[0]
+            self.assertEqual(event.event_type, EventType.FALLING_EDGE)
+            self.assertEqual(event.line_offset, 6)
+
+            self.assertFalse(req.wait_edge_event(timedelta(microseconds=10000)))
+
+    def test_sequence_numbers(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, {(2, 4): gpiod.LineSettings(edge_detection=Edge.BOTH)}
+        ) as req:
+            self.thread = Thread(
+                target=partial(self.trigger_rising_edge_events_on_two_offsets, 2, 4)
+            )
+            self.thread.start()
+
+            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
+            events = req.read_edge_event()
+            self.assertEqual(len(events), 1)
+            event = events[0]
+            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 2)
+            self.assertEqual(event.global_seqno, 1)
+            self.assertEqual(event.line_seqno, 1)
+
+            self.assertTrue(req.wait_edge_event(timedelta(seconds=1)))
+            events = req.read_edge_event()
+            self.assertEqual(len(events), 1)
+            event = events[0]
+            self.assertEqual(event.event_type, EventType.RISING_EDGE)
+            self.assertEqual(event.line_offset, 4)
+            self.assertEqual(event.global_seqno, 2)
+            self.assertEqual(event.line_seqno, 1)
+
+
+class ReadingMultipleEdgeEvents(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.request = gpiod.request_lines(
+            self.sim.dev_path, {1: gpiod.LineSettings(edge_detection=Edge.BOTH)}
+        )
+        self.line_seqno = 1
+        self.global_seqno = 1
+        self.sim.set_pull(1, Pull.UP)
+        time.sleep(0.05)
+        self.sim.set_pull(1, Pull.DOWN)
+        time.sleep(0.05)
+        self.sim.set_pull(1, Pull.UP)
+        time.sleep(0.05)
+
+    def tearDown(self):
+        self.request.release()
+        del self.request
+        del self.sim
+
+    def test_read_multiple_events(self):
+        self.assertTrue(self.request.wait_edge_event(timedelta(seconds=1)))
+        events = self.request.read_edge_event()
+        self.assertEqual(len(events), 3)
+
+        for event in events:
+            self.assertEqual(event.line_offset, 1)
+            self.assertEqual(event.line_seqno, self.line_seqno)
+            self.assertEqual(event.global_seqno, self.global_seqno)
+            self.line_seqno += 1
+            self.global_seqno += 1
+
+    # TODO buffer capacity
+    # def test_read_over_buffer_capacity(self):
+    #     buf = gpiod.EdgeEventBuffer(2)
+    #     self.assertTrue(self.request.wait_edge_event(datetime.timedelta(seconds=1)))
+    #     self.assertEqual(self.request.read_edge_event(buf), 2)
+    #     self.assertEqual(len(buf), 2)
+
+
+class EdgeEventStringRepresentation(TestCase):
+    def test_edge_event_str(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.request_lines(
+            path=sim.dev_path, config={0: gpiod.LineSettings(edge_detection=Edge.BOTH)}
+        ) as req:
+            sim.set_pull(0, Pull.UP)
+            event = req.read_edge_event()[0]
+            self.assertRegex(
+                str(event),
+                "<EdgeEvent type=Type\.RISING_EDGE timestamp_ns=[0-9]+ line_offset=0 global_seqno=1 line_seqno=1>",
+            )
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
new file mode 100644
index 0000000..f3926d9
--- /dev/null
+++ b/bindings/python/tests/tests_info_event.py
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import datetime
+import errno
+import gpiod
+import threading
+import time
+import unittest
+
+from . import gpiosim
+from dataclasses import FrozenInstanceError
+from functools import partial
+from gpiod.line import Direction
+from unittest import TestCase
+
+EventType = gpiod.InfoEvent.Type
+
+
+class InfoEventDataclassBehavior(TestCase):
+    def test_info_event_props_are_frozen(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            chip.watch_line_info(0)
+            with chip.request_lines(config={0: None}) as request:
+                self.assertTrue(chip.wait_info_event(datetime.timedelta(seconds=1)))
+                event = chip.read_info_event()
+
+                with self.assertRaises(FrozenInstanceError):
+                    event.event_type = 4
+
+                with self.assertRaises(FrozenInstanceError):
+                    event.timestamp_ns = 4
+
+                with self.assertRaises(FrozenInstanceError):
+                    event.line_info = 4
+
+
+def request_reconfigure_release_line(chip, offset):
+    time.sleep(0.1)
+    with chip.request_lines(config={offset: None}) as request:
+        time.sleep(0.1)
+        request.reconfigure_lines(
+            config={offset: gpiod.LineSettings(direction=Direction.OUTPUT)}
+        )
+        time.sleep(0.1)
+
+
+class WatchingInfoEventWorks(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
+        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.thread = None
+
+    def tearDown(self):
+        if self.thread:
+            self.thread.join()
+            self.thread = None
+
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_watch_line_info_returns_line_info(self):
+        info = self.chip.watch_line_info(7)
+        self.assertEqual(info.offset, 7)
+
+    def test_watch_line_info_keyword_argument(self):
+        info = self.chip.watch_line_info(line=7)
+
+    def test_watch_line_info_offset_out_of_range(self):
+        with self.assertRaises(ValueError):
+            self.chip.watch_line_info(8)
+
+    def test_watch_line_info_no_arguments(self):
+        with self.assertRaises(TypeError):
+            self.chip.watch_line_info()
+
+    def test_watch_line_info_by_line_name(self):
+        self.chip.watch_line_info("foobar")
+
+    def test_watch_line_info_invalid_argument_type(self):
+        with self.assertRaises(TypeError):
+            self.chip.watch_line_info(None)
+
+    def test_wait_for_event_timeout(self):
+        info = self.chip.watch_line_info(7)
+        self.assertFalse(
+            self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
+        )
+
+    def test_request_reconfigure_release_events(self):
+        info = self.chip.watch_line_info(7)
+        self.assertEqual(info.direction, Direction.INPUT)
+
+        self.thread = threading.Thread(
+            target=partial(request_reconfigure_release_line, self.chip, 7)
+        )
+        self.thread.start()
+
+        self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
+        event = self.chip.read_info_event()
+        self.assertEqual(event.event_type, EventType.LINE_REQUESTED)
+        self.assertEqual(event.line_info.offset, 7)
+        self.assertEqual(event.line_info.direction, Direction.INPUT)
+        ts_req = event.timestamp_ns
+
+        # Check that we can use a float directly instead of datetime.timedelta.
+        self.assertTrue(self.chip.wait_info_event(1.0))
+        event = self.chip.read_info_event()
+        self.assertEqual(event.event_type, EventType.LINE_CONFIG_CHANGED)
+        self.assertEqual(event.line_info.offset, 7)
+        self.assertEqual(event.line_info.direction, Direction.OUTPUT)
+        ts_rec = event.timestamp_ns
+
+        self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
+        event = self.chip.read_info_event()
+        self.assertEqual(event.event_type, EventType.LINE_RELEASED)
+        self.assertEqual(event.line_info.offset, 7)
+        self.assertEqual(event.line_info.direction, Direction.OUTPUT)
+        ts_rel = event.timestamp_ns
+
+        # No more events.
+        self.assertFalse(
+            self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
+        )
+
+        # Check timestamps are really monotonic.
+        self.assertGreater(ts_rel, ts_rec)
+        self.assertGreater(ts_rec, ts_req)
+
+
+class UnwatchingLineInfo(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8, line_names={4: "foobar"})
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_unwatch_line_info(self):
+        self.chip.watch_line_info(0)
+        with self.chip.request_lines(config={0: None}) as request:
+            self.assertTrue(self.chip.wait_info_event(datetime.timedelta(seconds=1)))
+            event = self.chip.read_info_event()
+            self.assertEqual(event.event_type, EventType.LINE_REQUESTED)
+            self.chip.unwatch_line_info(0)
+
+        self.assertFalse(
+            self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
+        )
+
+    def test_unwatch_not_watched_line(self):
+        with self.assertRaises(OSError) as ex:
+            self.chip.unwatch_line_info(2)
+
+        self.assertEqual(ex.exception.errno, errno.EBUSY)
+
+    def test_unwatch_line_info_no_argument(self):
+        with self.assertRaises(TypeError):
+            self.chip.unwatch_line_info()
+
+    def test_unwatch_line_info_by_line_name(self):
+        self.chip.watch_line_info(4)
+        with self.chip.request_lines(config={4: None}) as request:
+            self.assertIsNotNone(self.chip.read_info_event())
+            self.chip.unwatch_line_info("foobar")
+
+        self.assertFalse(
+            self.chip.wait_info_event(datetime.timedelta(microseconds=10000))
+        )
+
+
+class InfoEventStringRepresentation(TestCase):
+    def test_info_event_str(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            chip.watch_line_info(0)
+            with chip.request_lines(config={0: None}) as request:
+                self.assertTrue(chip.wait_info_event(datetime.timedelta(seconds=1)))
+                event = chip.read_info_event()
+                self.assertRegex(
+                    str(event),
+                    '<InfoEvent type=Type\.LINE_REQUESTED timestamp_ns=[0-9]+ line_info=<LineInfo offset=0 name="None" used=True consumer="\?" direction=Direction\.INPUT active_low=False bias=Bias\.UNKNOWN drive=Drive\.PUSH_PULL edge_detection=Edge\.NONE event_clock=Clock\.MONOTONIC debounced=False debounce_period=0:00:00>>',
+                )
diff --git a/bindings/python/tests/tests_line_info.py b/bindings/python/tests/tests_line_info.py
new file mode 100644
index 0000000..2779e7a
--- /dev/null
+++ b/bindings/python/tests/tests_line_info.py
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import errno
+import gpiod
+import unittest
+
+from . import gpiosim
+from gpiod.line import Direction, Bias, Drive, Clock
+
+HogDir = gpiosim.Chip.Direction
+
+
+class GetLineInfo(unittest.TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(
+            num_lines=4,
+            line_names={0: "foobar"},
+        )
+
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        self.chip = None
+        self.sim = None
+
+    def test_get_line_info_by_offset(self):
+        self.chip.get_line_info(0)
+
+    def test_get_line_info_by_offset_keyword(self):
+        self.chip.get_line_info(line=0)
+
+    def test_get_line_info_by_name(self):
+        self.chip.get_line_info("foobar")
+
+    def test_get_line_info_by_name_keyword(self):
+        self.chip.get_line_info(line="foobar")
+
+    def test_get_line_info_by_offset_string(self):
+        self.chip.get_line_info("2")
+
+    def test_offset_out_of_range(self):
+        with self.assertRaises(ValueError) as ex:
+            self.chip.get_line_info(4)
+
+    def test_no_offset(self):
+        with self.assertRaises(TypeError):
+            self.chip.get_line_info()
+
+
+class LinePropertiesCanBeRead(unittest.TestCase):
+    def test_basic_properties(self):
+        sim = gpiosim.Chip(
+            num_lines=8,
+            line_names={1: "foo", 2: "bar", 4: "baz", 5: "xyz"},
+            hogs={3: ("hog3", HogDir.OUTPUT_HIGH), 4: ("hog4", HogDir.OUTPUT_LOW)},
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info4 = chip.get_line_info(4)
+            info6 = chip.get_line_info(6)
+
+            self.assertEqual(info4.offset, 4)
+            self.assertEqual(info4.name, "baz")
+            self.assertTrue(info4.used)
+            self.assertEqual(info4.consumer, "hog4")
+            self.assertEqual(info4.direction, Direction.OUTPUT)
+            self.assertFalse(info4.active_low)
+            self.assertEqual(info4.bias, Bias.UNKNOWN)
+            self.assertEqual(info4.drive, Drive.PUSH_PULL)
+            self.assertEqual(info4.event_clock, Clock.MONOTONIC)
+            self.assertFalse(info4.debounced)
+            self.assertEqual(info4.debounce_period.total_seconds(), 0.0)
+
+            self.assertEqual(info6.offset, 6)
+            self.assertEqual(info6.name, None)
+            self.assertFalse(info6.used)
+            self.assertEqual(info6.consumer, None)
+            self.assertEqual(info6.direction, Direction.INPUT)
+            self.assertFalse(info6.active_low)
+            self.assertEqual(info6.bias, Bias.UNKNOWN)
+            self.assertEqual(info6.drive, Drive.PUSH_PULL)
+            self.assertEqual(info6.event_clock, Clock.MONOTONIC)
+            self.assertFalse(info6.debounced)
+            self.assertEqual(info6.debounce_period.total_seconds(), 0.0)
+
+
+class LineInfoStringRepresentation(unittest.TestCase):
+    def test_line_info_str(self):
+        sim = gpiosim.Chip(
+            line_names={0: "foo"}, hogs={0: ("hogger", HogDir.OUTPUT_HIGH)}
+        )
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            info = chip.get_line_info(0)
+
+            self.assertEqual(
+                str(info),
+                '<LineInfo offset=0 name="foo" used=True consumer="hogger" direction=Direction.OUTPUT active_low=False bias=Bias.UNKNOWN drive=Drive.PUSH_PULL edge_detection=Edge.NONE event_clock=Clock.MONOTONIC debounced=False debounce_period=0:00:00>',
+            )
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
new file mode 100644
index 0000000..045ace6
--- /dev/null
+++ b/bindings/python/tests/tests_line_request.py
@@ -0,0 +1,449 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import errno
+import gpiod
+
+from . import gpiosim
+from gpiod.line import Direction, Edge, Value
+from unittest import TestCase
+
+Pull = gpiosim.Chip.Pull
+SimVal = gpiosim.Chip.Value
+
+
+class ChipLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        del self.chip
+        del self.sim
+
+    def test_passing_invalid_types_as_configs(self):
+        with self.assertRaises(AttributeError):
+            self.chip.request_lines("foobar")
+
+        with self.assertRaises(AttributeError):
+            self.chip.request_lines(None, "foobar")
+
+    def test_duplicate_offsets(self):
+        with self.chip.request_lines(config={(2, 5, 1, 7, 5): None}) as req:
+            self.assertEqual(req.offsets, [2, 5, 1, 7])
+
+    def test_offset_out_of_range(self):
+        with self.assertRaises(ValueError):
+            self.chip.request_lines(config={(1, 0, 4, 8): None})
+
+    def test_line_name_not_found(self):
+        with self.assertRaises(FileNotFoundError):
+            self.chip.request_lines(config={"foo": None})
+
+    def test_request_no_arguments(self):
+        with self.assertRaises(TypeError):
+            self.chip.request_lines()
+
+
+class ModuleLineRequestsBehaveCorrectlyWithInvalidArguments(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+
+    def tearDown(self):
+        del self.sim
+
+    def test_passing_invalid_types_as_configs(self):
+        with self.assertRaises(AttributeError):
+            gpiod.request_lines(self.sim.dev_path, "foobar")
+
+        with self.assertRaises(AttributeError):
+            gpiod.request_lines(self.sim.dev_path, None, "foobar")
+
+    def test_duplicate_offsets(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, config={(2, 5, 1, 7, 5): None}
+        ) as req:
+            self.assertEqual(req.offsets, [2, 5, 1, 7])
+
+    def test_offset_out_of_range(self):
+        with self.assertRaises(ValueError):
+            gpiod.request_lines(self.sim.dev_path, config={(1, 0, 4, 8): None})
+
+    def test_line_name_not_found(self):
+        with self.assertRaises(FileNotFoundError):
+            gpiod.request_lines(self.sim.dev_path, config={"foo": None})
+
+    def test_request_no_arguments(self):
+        with self.assertRaises(TypeError):
+            gpiod.request_lines()
+
+
+class ChipLineRequestWorks(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8, line_names={5: "foo", 7: "bar"})
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        del self.chip
+        del self.sim
+
+    def test_request_with_positional_arguments(self):
+        with self.chip.request_lines({(0, 5, 3, 1): None}, "foobar", 32) as req:
+            self.assertEqual(req.offsets, [0, 5, 3, 1])
+            self.assertEqual(self.chip.get_line_info(0).consumer, "foobar")
+
+    def test_request_with_keyword_arguments(self):
+        with self.chip.request_lines(
+            config={(0, 5, 6): None},
+            consumer="foobar",
+            event_buffer_size=16,
+        ) as req:
+            self.assertEqual(req.offsets, [0, 5, 6])
+            self.assertEqual(self.chip.get_line_info(0).consumer, "foobar")
+
+    def test_request_single_offset_as_int(self):
+        with self.chip.request_lines(config={4: None}) as req:
+            self.assertEqual(req.offsets, [4])
+
+    def test_request_single_offset_as_tuple(self):
+        with self.chip.request_lines(config={(4): None}) as req:
+            self.assertEqual(req.offsets, [4])
+
+    def test_request_by_name(self):
+        with self.chip.request_lines(config={(1, 2, "foo", "bar"): None}) as req:
+            self.assertEqual(req.offsets, [1, 2, 5, 7])
+
+    def test_request_single_line_by_name(self):
+        with self.chip.request_lines(config={"foo": None}) as req:
+            self.assertEqual(req.offsets, [5])
+
+
+class ModuleLineRequestWorks(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8, line_names={5: "foo", 7: "bar"})
+
+    def tearDown(self):
+        del self.sim
+
+    def test_request_with_positional_arguments(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, {(0, 5, 3, 1): None}, "foobar", 32
+        ) as req:
+            self.assertEqual(req.offsets, [0, 5, 3, 1])
+            with gpiod.Chip(self.sim.dev_path) as chip:
+                self.assertEqual(chip.get_line_info(5).consumer, "foobar")
+
+    def test_request_with_keyword_arguments(self):
+        with gpiod.request_lines(
+            path=self.sim.dev_path,
+            config={(0, 5, 6): None},
+            consumer="foobar",
+            event_buffer_size=16,
+        ) as req:
+            self.assertEqual(req.offsets, [0, 5, 6])
+            with gpiod.Chip(self.sim.dev_path) as chip:
+                self.assertEqual(chip.get_line_info(5).consumer, "foobar")
+
+    def test_request_single_offset_as_int(self):
+        with gpiod.request_lines(path=self.sim.dev_path, config={4: None}) as req:
+            self.assertEqual(req.offsets, [4])
+
+    def test_request_single_offset_as_tuple(self):
+        with gpiod.request_lines(path=self.sim.dev_path, config={(4): None}) as req:
+            self.assertEqual(req.offsets, [4])
+
+    def test_request_by_name(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, {(1, 2, "foo", "bar"): None}
+        ) as req:
+            self.assertEqual(req.offsets, [1, 2, 5, 7])
+
+
+class LineRequestGettingValues(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.req = gpiod.request_lines(
+            self.sim.dev_path,
+            {(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.INPUT)},
+        )
+
+    def tearDown(self):
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_get_single_value(self):
+        self.sim.set_pull(1, Pull.UP)
+
+        self.assertEqual(self.req.get_values([1]), [Value.ACTIVE])
+
+    def test_get_single_value_helper(self):
+        self.sim.set_pull(1, Pull.UP)
+
+        self.assertEqual(self.req.get_value(1), Value.ACTIVE)
+
+    def test_get_values_for_subset_of_lines(self):
+        self.sim.set_pull(0, Pull.UP)
+        self.sim.set_pull(1, Pull.DOWN)
+        self.sim.set_pull(3, Pull.UP)
+
+        self.assertEqual(
+            self.req.get_values([0, 1, 3]), [Value.ACTIVE, Value.INACTIVE, Value.ACTIVE]
+        )
+
+    def test_get_all_values(self):
+        self.sim.set_pull(0, Pull.DOWN)
+        self.sim.set_pull(1, Pull.UP)
+        self.sim.set_pull(2, Pull.UP)
+        self.sim.set_pull(3, Pull.UP)
+
+        self.assertEqual(
+            self.req.get_values(),
+            [Value.INACTIVE, Value.ACTIVE, Value.ACTIVE, Value.ACTIVE],
+        )
+
+    def test_get_values_invalid_offset(self):
+        with self.assertRaises(ValueError):
+            self.req.get_values([9])
+
+    def test_get_values_invalid_argument_type(self):
+        with self.assertRaises(TypeError):
+            self.req.get_values(True)
+
+
+class LineRequestGettingValuesByName(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz"})
+        self.req = gpiod.request_lines(
+            self.sim.dev_path,
+            {(0, "baz", "bar", "foo"): gpiod.LineSettings(direction=Direction.INPUT)},
+        )
+
+    def tearDown(self):
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_get_values_by_name(self):
+        self.sim.set_pull(1, Pull.UP)
+        self.sim.set_pull(2, Pull.DOWN)
+        self.sim.set_pull(3, Pull.UP)
+
+        self.assertEqual(
+            self.req.get_values(["foo", "bar", 1]),
+            [Value.INACTIVE, Value.ACTIVE, Value.ACTIVE],
+        )
+
+    def test_get_values_by_bad_name(self):
+        with self.assertRaises(ValueError):
+            self.req.get_values(["xyz"])
+
+
+class LineRequestSettingValues(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.req = gpiod.request_lines(
+            self.sim.dev_path,
+            {(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
+        )
+
+    def tearDown(self):
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_set_single_value(self):
+        self.req.set_values({1: Value.ACTIVE})
+        self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
+
+    def test_set_single_value_helper(self):
+        self.req.set_value(1, Value.ACTIVE)
+        self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
+
+    def test_set_values_for_subset_of_lines(self):
+        self.req.set_values({0: Value.ACTIVE, 1: Value.INACTIVE, 3: Value.ACTIVE})
+
+        self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+        self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+
+    def test_set_values_invalid_offset(self):
+        with self.assertRaises(ValueError):
+            self.req.set_values({9: Value.ACTIVE})
+
+
+class LineRequestSettingValuesByName(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz"})
+        self.req = gpiod.request_lines(
+            self.sim.dev_path,
+            {(0, "baz", "bar", "foo"): gpiod.LineSettings(direction=Direction.OUTPUT)},
+        )
+
+    def tearDown(self):
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_set_values_by_name(self):
+        self.req.set_values(
+            {"foo": Value.INACTIVE, "bar": Value.ACTIVE, 1: Value.ACTIVE}
+        )
+
+        self.assertEqual(self.sim.get_value(2), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(1), SimVal.ACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+
+    def test_set_values_by_bad_name(self):
+        with self.assertRaises(ValueError):
+            self.req.set_values({"xyz": Value.ACTIVE})
+
+
+class LineRequestPropertiesWork(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=16, line_names={0: "foo", 2: "bar", 5: "baz"})
+
+    def tearDown(self):
+        del self.sim
+
+    def test_property_fd(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            config={
+                0: gpiod.LineSettings(
+                    direction=Direction.INPUT, edge_detection=Edge.BOTH
+                )
+            },
+        ) as req:
+            self.assertGreaterEqual(req.fd, 0)
+
+    def test_property_num_lines(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, config={(0, 2, 3, 5, 6, 8, 12): None}
+        ) as req:
+            self.assertEqual(req.num_lines, 7)
+
+    def test_property_offsets(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, config={(1, 6, 12, 4): None}
+        ) as req:
+            self.assertEqual(req.offsets, [1, 6, 12, 4])
+
+    def test_property_lines(self):
+        with gpiod.request_lines(
+            self.sim.dev_path, config={("foo", 1, "bar", 4, "baz"): None}
+        ) as req:
+            self.assertEqual(req.lines, ["foo", 1, "bar", 4, "baz"])
+
+
+class LineRequestConsumerString(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4)
+        self.chip = gpiod.Chip(self.sim.dev_path)
+
+    def tearDown(self):
+        self.chip.close()
+        del self.chip
+        del self.sim
+
+    def test_custom_consumer(self):
+        with self.chip.request_lines(
+            consumer="foobar", config={(2, 3): None}
+        ) as request:
+            info = self.chip.get_line_info(2)
+            self.assertEqual(info.consumer, "foobar")
+
+    def test_empty_consumer(self):
+        with self.chip.request_lines(consumer="", config={(2, 3): None}) as request:
+            info = self.chip.get_line_info(2)
+            self.assertEqual(info.consumer, "?")
+
+    def test_default_consumer(self):
+        with self.chip.request_lines(config={(2, 3): None}) as request:
+            info = self.chip.get_line_info(2)
+            self.assertEqual(info.consumer, "?")
+
+
+class ReconfigureRequestedLines(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8, line_names={3: "foo", 4: "bar", 6: "baz"})
+        self.chip = gpiod.Chip(self.sim.dev_path)
+        self.req = self.chip.request_lines(
+            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=Direction.OUTPUT)}
+        )
+
+    def tearDown(self):
+        self.chip.close()
+        del self.chip
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_reconfigure_by_offsets(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {(0, 2, 3, 6): gpiod.LineSettings(direction=Direction.INPUT)}
+        )
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.INPUT)
+
+    def test_reconfigure_by_names(self):
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.OUTPUT)
+        self.req.reconfigure_lines(
+            {(0, 2, "foo", "baz"): gpiod.LineSettings(direction=Direction.INPUT)}
+        )
+        info = self.chip.get_line_info(2)
+        self.assertEqual(info.direction, Direction.INPUT)
+
+
+class ReleasedLineRequestCannotBeUsed(TestCase):
+    def test_using_released_line_request(self):
+        sim = gpiosim.Chip()
+
+        with gpiod.Chip(sim.dev_path) as chip:
+            req = chip.request_lines(config={0: None})
+            req.release()
+
+            with self.assertRaises(gpiod.RequestReleasedError):
+                req.fd
+
+
+class LineRequestSurvivesParentChip(TestCase):
+    def test_line_request_survives_parent_chip(self):
+        sim = gpiosim.Chip()
+
+        chip = gpiod.Chip(sim.dev_path)
+        try:
+            req = chip.request_lines(
+                config={0: gpiod.LineSettings(direction=Direction.INPUT)}
+            )
+        except:
+            chip.close()
+            raise
+
+        chip.close()
+        self.assertEqual(req.get_values([0]), [Value.INACTIVE])
+
+
+class LineRequestStringRepresentation(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=8)
+
+    def tearDown(self):
+        del self.sim
+
+    def test_str(self):
+        with gpiod.request_lines(self.sim.dev_path, config={(2, 6, 4, 1): None}) as req:
+            self.assertEqual(
+                str(req),
+                "<LineRequest num_lines=4 offsets=[2, 6, 4, 1] fd={}>".format(req.fd),
+            )
+
+    def test_str_released(self):
+        req = gpiod.request_lines(self.sim.dev_path, config={(2, 6, 4, 1): None})
+        req.release()
+        self.assertEqual(str(req), "<LineRequest RELEASED>")
diff --git a/bindings/python/tests/tests_line_settings.py b/bindings/python/tests/tests_line_settings.py
new file mode 100644
index 0000000..36dda6d
--- /dev/null
+++ b/bindings/python/tests/tests_line_settings.py
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+
+from . import gpiosim
+from datetime import timedelta
+from gpiod.line import Direction, Edge, Bias, Drive, Value, Clock
+from unittest import TestCase
+
+
+class LineSettingsConstructor(TestCase):
+    def test_default_values(self):
+        settings = gpiod.LineSettings()
+
+        self.assertEqual(settings.direction, Direction.AS_IS)
+        self.assertEqual(settings.edge_detection, Edge.NONE)
+        self.assertEqual(settings.bias, Bias.AS_IS)
+        self.assertEqual(settings.drive, Drive.PUSH_PULL)
+        self.assertFalse(settings.active_low)
+        self.assertEqual(settings.debounce_period.total_seconds(), 0.0)
+        self.assertEqual(settings.event_clock, Clock.MONOTONIC)
+        self.assertEqual(settings.output_value, Value.INACTIVE)
+
+    def test_keyword_arguments(self):
+        settings = gpiod.LineSettings(
+            direction=Direction.INPUT,
+            edge_detection=Edge.BOTH,
+            bias=Bias.PULL_UP,
+            event_clock=Clock.REALTIME,
+        )
+
+        self.assertEqual(settings.direction, Direction.INPUT)
+        self.assertEqual(settings.edge_detection, Edge.BOTH)
+        self.assertEqual(settings.bias, Bias.PULL_UP)
+        self.assertEqual(settings.drive, Drive.PUSH_PULL)
+        self.assertFalse(settings.active_low)
+        self.assertEqual(settings.debounce_period.total_seconds(), 0.0)
+        self.assertEqual(settings.event_clock, Clock.REALTIME)
+        self.assertEqual(settings.output_value, Value.INACTIVE)
+
+
+class LineSettingsAttributes(TestCase):
+    def test_line_settings_attributes_are_mutable(self):
+        settings = gpiod.LineSettings()
+
+        settings.direction = Direction.INPUT
+        settings.edge_detection = Edge.BOTH
+        settings.bias = Bias.DISABLED
+        settings.debounce_period = timedelta(microseconds=3000)
+        settings.event_clock = Clock.HTE
+
+        self.assertEqual(settings.direction, Direction.INPUT)
+        self.assertEqual(settings.edge_detection, Edge.BOTH)
+        self.assertEqual(settings.bias, Bias.DISABLED)
+        self.assertEqual(settings.drive, Drive.PUSH_PULL)
+        self.assertFalse(settings.active_low)
+        self.assertEqual(settings.debounce_period.total_seconds(), 0.003)
+        self.assertEqual(settings.event_clock, Clock.HTE)
+        self.assertEqual(settings.output_value, Value.INACTIVE)
+
+
+class LineSettingsStringRepresentation(TestCase):
+    def setUp(self):
+        self.settings = gpiod.LineSettings(
+            direction=Direction.OUTPUT, drive=Drive.OPEN_SOURCE, active_low=True
+        )
+
+    def test_repr(self):
+        self.assertEqual(
+            repr(self.settings),
+            "LineSettings(direction=Direction.OUTPUT, edge_detection=Edge.NONE bias=Bias.AS_IS drive=Drive.OPEN_SOURCE active_low=True debounce_period=datetime.timedelta(0) event_clock=Clock.MONOTONIC output_value=Value.INACTIVE)",
+        )
+
+    def test_str(self):
+        self.assertEqual(
+            str(self.settings),
+            "<LineSettings direction=Direction.OUTPUT edge_detection=Edge.NONE bias=Bias.AS_IS drive=Drive.OPEN_SOURCE active_low=True debounce_period=0:00:00 event_clock=Clock.MONOTONIC output_value=Value.INACTIVE>",
+        )
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
new file mode 100644
index 0000000..4eeae76
--- /dev/null
+++ b/bindings/python/tests/tests_module.py
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+import gpiod
+import os
+import re
+import unittest
+
+from . import gpiosim
+from .helpers import LinkGuard
+from unittest import TestCase
+
+
+class IsGPIOChip(TestCase):
+    def test_is_gpiochip_bad(self):
+        self.assertFalse(gpiod.is_gpiochip_device("/dev/null"))
+        self.assertFalse(gpiod.is_gpiochip_device("/dev/nonexistent"))
+
+    def test_is_gpiochip_invalid_argument(self):
+        with self.assertRaises(TypeError):
+            gpiod.is_gpiochip_device(4)
+
+    def test_is_gpiochip_superfluous_argument(self):
+        with self.assertRaises(TypeError):
+            gpiod.is_gpiochip_device("/dev/null", 4)
+
+    def test_is_gpiochip_missing_argument(self):
+        with self.assertRaises(TypeError):
+            gpiod.is_gpiochip_device()
+
+    def test_is_gpiochip_good(self):
+        sim = gpiosim.Chip()
+        self.assertTrue(gpiod.is_gpiochip_device(sim.dev_path))
+
+    def test_is_gpiochip_good_keyword_argument(self):
+        sim = gpiosim.Chip()
+        self.assertTrue(gpiod.is_gpiochip_device(path=sim.dev_path))
+
+    def test_is_gpiochip_link_good(self):
+        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        sim = gpiosim.Chip()
+
+        with LinkGuard(sim.dev_path, link):
+            self.assertTrue(gpiod.is_gpiochip_device(link))
+
+    def test_is_gpiochip_link_bad(self):
+        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+
+        with LinkGuard("/dev/null", link):
+            self.assertFalse(gpiod.is_gpiochip_device(link))
+
+
+class VersionString(TestCase):
+    def test_version_string(self):
+        self.assertTrue(
+            re.match(
+                "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$", gpiod.__version__
+            )
+        )
-- 
2.34.1

