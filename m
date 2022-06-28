Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C4E55CE4B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344001AbiF1Imw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344000AbiF1Imv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:42:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8132D1D9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:37 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so6276928wmp.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Svh34SGHXPR8BNcBwcCiVk4UNWii0ln2PiGhUKFiN4=;
        b=Z68s462YYxUnFneXOqcPitQy7I9eNCo8ic21VvOQn+r8g8aUFvw3hLZUYwVUiKrAwc
         SW/eiHlWNySoP2kfTgnGZAufP23wA97nOHNbaHcaN55/h1WaflOQPoMQhgVSlpDrRcoI
         X5Dr7h9e2Dz95xts7PKNXuOhTQejwn80Ux4LD1yvfqIMhD3AhfC44U6DRiUfu2XHANaw
         wxrWGVIM7uFJMosaFYgOOEY/pApNDdMAPQt8bvDb2NfqGT3shZJxRJifwW3CwDCOGvw9
         fjhjsW4Xx3sGe78jOJsDJhbt0MnX8ih911140owlxSLaUe8nxYeL5OS2UX4/gwubx69W
         RCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Svh34SGHXPR8BNcBwcCiVk4UNWii0ln2PiGhUKFiN4=;
        b=svEJvRlcDu48HoWV5EzCRVgfj3e6fUsh5pG5+dHKe7bDq4gDVQF/7Ff0THqKQEwP50
         lV/atzAftLZ2Z+Wbv5HAK+xApDHosgiFPOFYBlFBOMlri9E5xqSYekUPQslK1g4vZNoH
         SsM5eA1redrKeQfdae5YT7rTWM0mLnSfKQDrdA7mMfvSIpPiEUMLmd354hk/1JJho9wd
         4RfQYJwP2Zl+Wix7OkX9zXHLVHjOBS6zIO8qb3teuPzOIDyXM+4uU5AJf9thovsh4C74
         kzY6I5BtbAy92OTRSQAZIpSnklmZrxpBTwZSmHqc0PhlTkEngoesx3DGTYf6VJCBbD8M
         lZIw==
X-Gm-Message-State: AJIora8qLvNLSdqH5SaYcilyHLEM6+82ikUAdgjsttb3SIns6LQDssab
        VxyBVppxB2GjDeaqjAvoq02HbA==
X-Google-Smtp-Source: AGRyM1tWrITeeaKyo5EOuwFfXejyrF58njB9alcUvZ/uzf97gsYQ9uBvJz619qkx5mR9pbMRvrcD8Q==
X-Received: by 2002:a05:600c:3653:b0:3a0:5716:203a with SMTP id y19-20020a05600c365300b003a05716203amr375133wmq.175.1656405755215;
        Tue, 28 Jun 2022 01:42:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:51e:c065:fa3f:a137])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0021badf3cb26sm15596062wrr.63.2022.06.28.01.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:42:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 5/5] bindings: python: add the implementation for v2 API
Date:   Tue, 28 Jun 2022 10:42:26 +0200
Message-Id: <20220628084226.472035-6-brgl@bgdev.pl>
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

This is the implementation of the new python API for libgpiod v2.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/.gitignore          |    1 +
 bindings/python/Makefile.am         |   40 +
 bindings/python/chip-info.c         |  126 +++
 bindings/python/chip.c              |  606 ++++++++++++
 bindings/python/edge-event-buffer.c |  330 +++++++
 bindings/python/edge-event.c        |  191 ++++
 bindings/python/exception.c         |  182 ++++
 bindings/python/info-event.c        |  175 ++++
 bindings/python/line-config.c       | 1373 +++++++++++++++++++++++++++
 bindings/python/line-info.c         |  286 ++++++
 bindings/python/line-request.c      |  803 ++++++++++++++++
 bindings/python/line.c              |  239 +++++
 bindings/python/module.c            |  557 +++++++++++
 bindings/python/module.h            |   58 ++
 bindings/python/request-config.c    |  320 +++++++
 configure.ac                        |    3 +-
 16 files changed, 5289 insertions(+), 1 deletion(-)
 create mode 100644 bindings/python/.gitignore
 create mode 100644 bindings/python/Makefile.am
 create mode 100644 bindings/python/chip-info.c
 create mode 100644 bindings/python/chip.c
 create mode 100644 bindings/python/edge-event-buffer.c
 create mode 100644 bindings/python/edge-event.c
 create mode 100644 bindings/python/exception.c
 create mode 100644 bindings/python/info-event.c
 create mode 100644 bindings/python/line-config.c
 create mode 100644 bindings/python/line-info.c
 create mode 100644 bindings/python/line-request.c
 create mode 100644 bindings/python/line.c
 create mode 100644 bindings/python/module.c
 create mode 100644 bindings/python/module.h
 create mode 100644 bindings/python/request-config.c

diff --git a/bindings/python/.gitignore b/bindings/python/.gitignore
new file mode 100644
index 0000000..bee8a64
--- /dev/null
+++ b/bindings/python/.gitignore
@@ -0,0 +1 @@
+__pycache__
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
new file mode 100644
index 0000000..3f7ee5f
--- /dev/null
+++ b/bindings/python/Makefile.am
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+
+pyexec_LTLIBRARIES = gpiod.la
+
+gpiod_la_SOURCES = \
+	chip.c \
+	chip-info.c \
+	edge-event.c \
+	edge-event-buffer.c \
+	exception.c \
+	info-event.c \
+	line.c \
+	line-config.c \
+	line-info.c \
+	line-request.c \
+	module.c \
+	module.h \
+	request-config.c
+
+gpiod_la_CFLAGS = -I$(top_srcdir)/include/
+gpiod_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
+gpiod_la_CFLAGS += -include $(top_builddir)/config.h
+gpiod_la_LDFLAGS = -module -avoid-version
+gpiod_la_LIBADD = $(top_builddir)/lib/libgpiod.la $(PYTHON_LIBS)
+gpiod_la_LIBADD += $(top_builddir)/bindings/python/enum/libpycenum.la
+
+SUBDIRS = enum .
+
+if WITH_TESTS
+
+SUBDIRS += tests
+
+endif
+
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
diff --git a/bindings/python/chip-info.c b/bindings/python/chip-info.c
new file mode 100644
index 0000000..e48cf74
--- /dev/null
+++ b/bindings/python/chip-info.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_chip_info *info;
+} chip_info_object;
+
+static int chip_info_init(PyObject *Py_UNUSED(self),
+			  PyObject *Py_UNUSED(ignored0),
+			  PyObject *Py_UNUSED(ignored1))
+{
+	PyErr_SetString(PyExc_TypeError,
+			"cannot create 'gpiod.ChipInfo' instances");
+	return -1;
+}
+
+static void chip_info_finalize(chip_info_object *self)
+{
+	if (self->info)
+		gpiod_chip_info_free(self->info);
+}
+
+PyDoc_STRVAR(chip_info_name_doc,
+"Name of the chip as represented in the kernel.");
+
+static PyObject *chip_info_name(chip_info_object *self,
+				void *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiod_chip_info_get_name(self->info));
+}
+
+PyDoc_STRVAR(chip_info_label_doc,
+"Label of the chip as represented in the kernel.");
+
+static PyObject *chip_info_label(chip_info_object *self,
+				 void *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiod_chip_info_get_label(self->info));
+}
+
+PyDoc_STRVAR(chip_info_num_lines_doc,
+"Number of GPIO lines exposed by the chip.");
+
+static PyObject *chip_info_num_lines(chip_info_object *self,
+				     void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLong(
+			gpiod_chip_info_get_num_lines(self->info));
+}
+
+static PyGetSetDef chip_info_getset[] = {
+	{
+		.name = "name",
+		.get = (getter)chip_info_name,
+		.doc = chip_info_name_doc,
+	},
+	{
+		.name = "label",
+		.get = (getter)chip_info_label,
+		.doc = chip_info_label_doc,
+	},
+	{
+		.name = "num_lines",
+		.get = (getter)chip_info_num_lines,
+		.doc = chip_info_num_lines_doc
+	},
+	{ }
+};
+
+static PyObject *chip_info_str(PyObject *self)
+{
+	PyObject *name, *label, *num_lines, *str = NULL;
+
+	name = PyObject_GetAttrString(self, "name");
+	label = PyObject_GetAttrString(self, "label");
+	num_lines = PyObject_GetAttrString(self, "num_lines");
+	if (!name || !label || !num_lines)
+		goto out;
+
+	str = PyUnicode_FromFormat("<gpiod.ChipInfo name=\"%S\" label=\"%S\" num_lines=%S>",
+				   name, label, num_lines);
+
+out:
+	Py_XDECREF(name);
+	Py_XDECREF(label);
+	Py_XDECREF(num_lines);
+	return str;
+}
+
+PyDoc_STRVAR(chip_info_type_doc,
+"Chip info object contains an immutable snapshot of a chip's status.");
+
+static PyTypeObject chip_info_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.ChipInfo",
+	.tp_basicsize = sizeof(chip_info_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = chip_info_type_doc,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)chip_info_init,
+	.tp_finalize = (destructor)chip_info_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = chip_info_getset,
+	.tp_str = (reprfunc)chip_info_str
+};
+
+int Py_gpiod_RegisterChipInfoType(PyObject *module)
+{
+	return PyModule_AddType(module, &chip_info_type);
+}
+
+PyObject *Py_gpiod_MakeChipInfo(struct gpiod_chip_info *info)
+{
+	chip_info_object *info_obj;
+
+	info_obj = PyObject_New(chip_info_object, &chip_info_type);
+	if (!info_obj)
+		return NULL;
+
+	info_obj->info = info;
+
+	return (PyObject *)info_obj;
+}
diff --git a/bindings/python/chip.c b/bindings/python/chip.c
new file mode 100644
index 0000000..a325b1b
--- /dev/null
+++ b/bindings/python/chip.c
@@ -0,0 +1,606 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <stdint.h>
+
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_chip *chip;
+} chip_object;
+
+static int chip_init(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"path",
+		NULL
+	};
+
+	char *path;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "s", kwlist, &path);
+	if (!ret)
+		return -1;
+
+	Py_BEGIN_ALLOW_THREADS;
+	self->chip = gpiod_chip_open(path);
+	Py_END_ALLOW_THREADS;
+	if (!self->chip) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	return 0;
+}
+
+static bool chip_is_closed(chip_object *self)
+{
+	return !self->chip;
+}
+
+static bool chip_check_closed(chip_object *self)
+{
+	if (chip_is_closed(self)) {
+		Py_gpiod_SetChipClosedError();
+		return true;
+	}
+
+	return false;
+}
+
+static void chip_finalize(chip_object *self)
+{
+	if (!chip_is_closed(self))
+		PyObject_CallMethod((PyObject *)self, "close", "");
+}
+
+PyDoc_STRVAR(chip_path_doc,
+"Path to the file passed as argument to the constructor.");
+
+static PyObject *chip_path(chip_object *self, void *Py_UNUSED(ignored))
+{
+	if (chip_check_closed(self))
+		return NULL;
+
+	return PyUnicode_FromString(gpiod_chip_get_path(self->chip));
+}
+
+PyDoc_STRVAR(chip_fd_doc,
+"Number of the file descriptor associated with this chip.");
+
+static PyObject *chip_fd(chip_object *self, void *Py_UNUSED(ignored))
+{
+	if (chip_check_closed(self))
+		return NULL;
+
+	return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
+}
+
+static PyGetSetDef chip_getset[] = {
+	{
+		.name = "path",
+		.get = (getter)chip_path,
+		.doc = chip_path_doc,
+	},
+	{
+		.name = "fd",
+		.get = (getter)chip_fd,
+		.doc = chip_fd_doc
+	},
+	{ }
+};
+
+PyDoc_STRVAR(chip_enter_doc, "Controlled execution enter callback.");
+
+static PyObject *chip_enter(PyObject *self, PyObject *Py_UNUSED(ignored))
+{
+	if (PyObject_Not(self)) {
+		Py_gpiod_SetChipClosedError();
+		return NULL;
+	}
+
+	Py_INCREF(self);
+	return self;
+}
+
+PyDoc_STRVAR(chip_exit_doc, "Controlled execution exit callback.");
+
+static PyObject *chip_exit(PyObject *self, PyObject *Py_UNUSED(ignored))
+{
+	return PyObject_CallMethod(self, "close", "");
+}
+
+PyDoc_STRVAR(chip_close_doc,
+"Close the associated GPIO chip descriptor. The chip object must no longer\n"
+"be used after this method is called.\n");
+
+static PyObject *chip_close(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	if (chip_check_closed(self))
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	gpiod_chip_close(self->chip);
+	Py_END_ALLOW_THREADS;
+	self->chip = NULL;
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(chip_get_info_doc,
+"Get the information about the chip.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.ChipInfo object.");
+
+static PyObject *chip_get_info(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	struct gpiod_chip_info *info;
+	PyObject *info_obj;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	info = gpiod_chip_get_info(self->chip);
+	Py_END_ALLOW_THREADS;
+	if (!info)
+		return Py_gpiod_SetErrFromErrno();
+
+	info_obj = Py_gpiod_MakeChipInfo(info);
+	if (!info_obj) {
+		gpiod_chip_info_free(info);
+		return NULL;
+	}
+
+	return info_obj;
+}
+
+static PyObject *
+do_chip_get_line_info(chip_object *self, PyObject *args,
+		      PyObject *kwargs, bool watch)
+{
+	static char *kwlist[] = {
+		"offset",
+		NULL
+	};
+
+	struct gpiod_line_info *info;
+	unsigned int offset;
+	PyObject *info_obj;
+	int ret;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "I", kwlist, &offset);
+	if (!ret)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	if (watch)
+		info = gpiod_chip_watch_line_info(self->chip, offset);
+	else
+		info = gpiod_chip_get_line_info(self->chip, offset);
+	Py_END_ALLOW_THREADS;
+	if (!info)
+		return Py_gpiod_SetErrFromErrno();
+
+	info_obj = Py_gpiod_MakeLineInfo(info);
+	if (!info_obj)
+		gpiod_line_info_free(info);
+
+	return info_obj;
+}
+
+PyDoc_STRVAR(chip_get_line_info_doc,
+"Get the snapshot of information about the line at given offset.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the GPIO line to get information for.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.LineInfo object.");
+
+static PyObject *
+chip_get_line_info(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	return do_chip_get_line_info(self, args, kwargs, false);
+}
+
+PyDoc_STRVAR(chip_watch_line_info_doc,
+"Get the snapshot of information about the line at given offset and start\n"
+"watching it for future changes.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the GPIO line to get information for.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.LineInfo object.");
+
+static PyObject *
+chip_watch_line_info(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	return do_chip_get_line_info(self, args, kwargs, true);
+}
+
+PyDoc_STRVAR(chip_unwatch_line_info_doc,
+"Stop watching a line for status changes.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the line to stop watching.");
+
+static PyObject *
+chip_unwatch_line_info(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"offset",
+		NULL
+	};
+
+	unsigned int offset;
+	int ret;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "I", kwlist, &offset);
+	if (!ret)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_chip_unwatch_line_info(self->chip, offset);
+	Py_END_ALLOW_THREADS;
+	if (ret)
+		return Py_gpiod_SetErrFromErrno();
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(chip_wait_info_event_doc,
+"Wait for line status change events on any of the watched lines on the chip.\n"
+"\n"
+"Args:\n"
+"  timeout:\n"
+"    Wait time limit stored represented as a datetime.timedelta object.\n"
+"\n"
+"Returns:\n"
+"  True if an info event is ready to be read from the chip, False if the\n"
+"  wait timed out without any events.");
+
+static PyObject *
+chip_wait_info_event(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"timeout",
+		NULL
+	};
+
+	uint64_t timeout_us, timeout_ns;
+	PyObject *timedelta;
+	int ret;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O", kwlist,
+					  &timedelta);
+	if (!ret)
+		return NULL;
+
+	timeout_us = Py_gpiod_TimedeltaToMicroseconds(timedelta);
+	if (PyErr_Occurred())
+		return NULL;
+
+	timeout_ns = timeout_us * 1000;
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_chip_wait_info_event(self->chip, timeout_ns);
+	Py_END_ALLOW_THREADS;
+	if (ret < 0)
+		return Py_gpiod_SetErrFromErrno();
+
+	return PyBool_FromLong(ret);
+}
+
+PyDoc_STRVAR(chip_read_info_event_doc,
+"Read a single line status change event from the chip.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.InfoEvent object.\n"
+"\n"
+"Note:\n"
+"  This function may block if there are no available events in the queue.");
+
+static PyObject *
+chip_read_info_event(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	struct gpiod_info_event *event;
+	PyObject *event_obj;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	event = gpiod_chip_read_info_event(self->chip);
+	Py_END_ALLOW_THREADS;
+	if (!event)
+		return Py_gpiod_SetErrFromErrno();
+
+	event_obj = Py_gpiod_MakeInfoEvent(event);
+	if (!event_obj)
+		gpiod_info_event_free(event);
+
+	return event_obj;
+}
+
+PyDoc_STRVAR(chip_get_line_offset_from_name_doc,
+"Map a line's name to its offset within the chip.\n"
+"\n"
+"Args:\n"
+"  name:\n"
+"    Name of the GPIO line to map.\n"
+"\n"
+"Returns:\n"
+"  Line offset corresponding with the name or None if a line with given name\n"
+"  is not exposed by this chip.");
+
+static PyObject *
+chip_get_line_offset_from_name(chip_object *self,
+			       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"name",
+		NULL
+	};
+
+	const char *name;
+	int ret, offset;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "s", kwlist, &name);
+	if (!ret)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	offset = gpiod_chip_get_line_offset_from_name(self->chip, name);
+	Py_END_ALLOW_THREADS;
+	if (offset < 0) {
+		if (errno == ENOENT)
+			Py_RETURN_NONE;
+
+		return Py_gpiod_SetErrFromErrno();
+	}
+
+	return PyLong_FromUnsignedLong(offset);
+}
+
+PyDoc_STRVAR(chip_request_lines_doc,
+"Request a set of lines for exclusive usage.\n"
+"\n"
+"Args:\n"
+"  req_cfg:\n"
+"    Request config object.\n"
+"  line_cfg:\n"
+"    Line config object.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.LineRequest object.");
+
+static PyObject *
+chip_request_lines(chip_object *self, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"req_cfg",
+		"line_cfg",
+		NULL
+	};
+
+	PyObject *req_cfg_obj, *line_cfg_obj, *req_obj;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_line_request *req;
+	int ret;
+
+	if (chip_check_closed(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "OO", kwlist,
+					  &req_cfg_obj, &line_cfg_obj);
+	if (!ret)
+		return NULL;
+
+	req_cfg = Py_gpiod_RequestConfigGetData(req_cfg_obj);
+	if (!req_cfg)
+		return NULL;
+
+	line_cfg = Py_gpiod_LineConfigGetData(line_cfg_obj);
+	if (!line_cfg)
+		return NULL;
+
+	req = gpiod_chip_request_lines(self->chip, req_cfg, line_cfg);
+	if (!req) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	req_obj = Py_gpiod_MakeLineRequest(req);
+	if (!req_obj) {
+		gpiod_line_request_release(req);
+		return NULL;
+	}
+
+	return req_obj;
+}
+
+static PyMethodDef chip_methods[] = {
+	{
+		.ml_name = "__enter__",
+		.ml_meth = (PyCFunction)chip_enter,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = chip_enter_doc,
+	},
+	{
+		.ml_name = "__exit__",
+		.ml_meth = (PyCFunction)chip_exit,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = chip_exit_doc,
+	},
+	{
+		.ml_name = "close",
+		.ml_meth = (PyCFunction)chip_close,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = chip_close_doc,
+	},
+	{
+		.ml_name = "get_info",
+		.ml_meth = (PyCFunction)chip_get_info,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = chip_get_info_doc,
+	},
+	{
+		.ml_name = "get_line_info",
+		.ml_meth = (PyCFunction)(void(*)(void))chip_get_line_info,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = chip_get_line_info_doc,
+	},
+	{
+		.ml_name = "watch_line_info",
+		.ml_meth = (PyCFunction)(void(*)(void))chip_watch_line_info,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = chip_watch_line_info_doc,
+	},
+	{
+		.ml_name = "unwatch_line_info",
+		.ml_meth = (PyCFunction)(void(*)(void))chip_unwatch_line_info,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = chip_unwatch_line_info_doc,
+	},
+	{
+		.ml_name = "wait_info_event",
+		.ml_meth = (PyCFunction)(void(*)(void))chip_wait_info_event,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = chip_wait_info_event_doc,
+	},
+	{
+		.ml_name = "read_info_event",
+		.ml_meth = (PyCFunction)chip_read_info_event,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = chip_read_info_event_doc,
+	},
+	{
+		.ml_name = "get_line_offset_from_name",
+		.ml_meth = (PyCFunction)(void(*)(void))
+						chip_get_line_offset_from_name,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = chip_get_line_offset_from_name_doc,
+	},
+	{
+		.ml_name = "request_lines",
+		.ml_meth = (PyCFunction)(void(*)(void))chip_request_lines,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = chip_request_lines_doc,
+	},
+	{ }
+};
+
+static PyObject *chip_str_closed(void)
+{
+	return PyUnicode_FromString("<gpiod.Chip CLOSED>");
+}
+
+static PyObject *chip_repr(chip_object *self)
+{
+	if (chip_is_closed(self))
+		return chip_str_closed();
+
+	return PyUnicode_FromFormat("gpiod.Chip(\"%s\")",
+				    gpiod_chip_get_path(self->chip));
+}
+
+static PyObject *chip_str(PyObject *self)
+{
+	PyObject *path, *fd, *info, *str = NULL;
+
+	if (PyObject_Not(self))
+		return chip_str_closed();
+
+	path = PyObject_GetAttrString(self, "path");
+	fd = PyObject_GetAttrString(self, "fd");
+	info = PyObject_CallMethod(self, "get_info", NULL);
+	if (!path || !fd || !info)
+		goto out;
+
+	str = PyUnicode_FromFormat("<gpiod.Chip path=\"%S\" fd=%S info=%S>",
+				   path, fd, info);
+
+out:
+	Py_XDECREF(path);
+	Py_XDECREF(fd);
+	Py_XDECREF(info);
+	return str;
+}
+
+static int chip_bool(chip_object *self)
+{
+	return !chip_is_closed(self);
+}
+
+static PyNumberMethods chip_number_methods = {
+	.nb_bool = (inquiry)chip_bool,
+};
+
+PyDoc_STRVAR(chip_type_doc,
+"Represents a GPIO chip.\n"
+"\n"
+"Chip object manages all resources associated with the GPIO chip\n"
+"it represents.\n"
+"\n"
+"The gpiochip device file is opened during the object's construction.\n"
+"The Chip object's constructor takes the path to the GPIO chip device file\n"
+"as the only argument.\n"
+"\n"
+"Callers must close the chip by calling the close() method when it's no\n"
+"longer used.\n"
+"\n"
+"Example:\n"
+"\n"
+"    chip = gpiod.Chip(\"/dev/gpiochip0\")\n"
+"    do_something(chip)\n"
+"    chip.close()\n"
+"\n"
+"The gpiod.Chip class also supports controlled execution ('with' statement).\n"
+"\n"
+"Example:\n"
+"\n"
+"    with gpiod.Chip(path=\"/dev/gpiochip0\") as chip:\n"
+"        do_something(chip)");
+
+static PyTypeObject chip_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.Chip",
+	.tp_basicsize = sizeof(chip_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = chip_type_doc,
+	.tp_as_number = &chip_number_methods,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)chip_init,
+	.tp_finalize = (destructor)chip_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = chip_getset,
+	.tp_methods = chip_methods,
+	.tp_repr = (reprfunc)chip_repr,
+	.tp_str = (reprfunc)chip_str
+};
+
+int Py_gpiod_RegisterChipType(PyObject *module)
+{
+	return PyModule_AddType(module, &chip_type);
+}
diff --git a/bindings/python/edge-event-buffer.c b/bindings/python/edge-event-buffer.c
new file mode 100644
index 0000000..f92ea08
--- /dev/null
+++ b/bindings/python/edge-event-buffer.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_edge_event_buffer *buf;
+	Py_ssize_t seq;
+} edge_event_buffer_object;
+
+static int edge_event_buffer_init(edge_event_buffer_object *self,
+				  PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"capacity",
+		NULL
+	};
+
+	Py_ssize_t capacity = 64;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|n", kwlist,
+					  &capacity);
+	if (!ret)
+		return -1;
+
+	self->buf = gpiod_edge_event_buffer_new(capacity);
+	if (!self->buf) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	self->seq = -1;
+
+	return 0;
+}
+
+static void edge_event_buffer_finalize(edge_event_buffer_object *self)
+{
+	if (self->buf)
+		gpiod_edge_event_buffer_free(self->buf);
+}
+
+PyDoc_STRVAR(edge_event_buffer_capacity_doc, "Maximum capacity of the buffer.");
+
+static PyObject *edge_event_buffer_capacity(edge_event_buffer_object *self,
+					    void *Py_UNUSED(ignored))
+{
+	return PyLong_FromSize_t(
+			gpiod_edge_event_buffer_get_capacity(self->buf));
+}
+
+PyDoc_STRVAR(edge_event_buffer_num_events_doc,
+"Number of events a buffer has stored.");
+
+static PyObject *edge_event_buffer_num_events(edge_event_buffer_object *self,
+					      void *Py_UNUSED(ignored))
+{
+	return PyLong_FromSize_t(
+			gpiod_edge_event_buffer_get_num_events(self->buf));
+}
+
+static PyGetSetDef edge_event_buffer_getset[] = {
+	{
+		.name = "capacity",
+		.get = (getter)edge_event_buffer_capacity,
+		.doc = edge_event_buffer_capacity_doc,
+	},
+	{
+		.name = "num_events",
+		.get = (getter)edge_event_buffer_num_events,
+		.doc = edge_event_buffer_num_events_doc,
+	},
+	{ }
+};
+
+PyDoc_STRVAR(edge_event_buffer_get_event_doc,
+"Get an event stored in the buffer.\n"
+"\n"
+"Args:\n"
+"  index:\n"
+"    Index of the event in the buffer.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.EdgeEvent object.");
+
+static PyObject *
+do_get_event(struct gpiod_edge_event_buffer *buf, unsigned long index)
+{
+	struct gpiod_edge_event *event, *cpy;
+	PyObject *event_obj;
+
+	event = gpiod_edge_event_buffer_get_event(buf, index);
+	if (!event) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	cpy = gpiod_edge_event_copy(event);
+	if (!cpy) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	event_obj = Py_gpiod_MakeEdgeEvent(cpy);
+	if (!event_obj) {
+		gpiod_edge_event_free(cpy);
+		return NULL;
+	}
+
+	return event_obj;
+}
+
+static PyObject *
+edge_event_buffer_get_event(edge_event_buffer_object *self,
+			    PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"index",
+		NULL
+	};
+
+	unsigned long index;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "k", kwlist, &index);
+	if (!ret)
+		return NULL;
+
+	return do_get_event(self->buf, index);
+}
+
+static PyMethodDef edge_event_buffer_methods[] = {
+	{
+		.ml_name = "get_event",
+		.ml_meth = (PyCFunction)(void(*)(void))
+						edge_event_buffer_get_event,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = edge_event_buffer_get_event_doc,
+	},
+	{ }
+};
+
+static PyObject *edge_event_buffer_repr(PyObject *self)
+{
+	PyObject *capacity, *repr;
+
+	capacity = PyObject_GetAttrString(self, "capacity");
+	if (!capacity)
+		return NULL;
+
+	repr = PyUnicode_FromFormat("gpiod.EdgeEventBuffer(%S)", capacity);
+	Py_DECREF(capacity);
+	return repr;
+}
+
+static PyObject *events_str(edge_event_buffer_object *self)
+{
+	PyObject *iter, *next, *list, *str, *joined;
+	size_t num_events;
+	Py_ssize_t i;
+	int ret;
+
+	num_events = gpiod_edge_event_buffer_get_num_events(self->buf);
+
+	list = PyList_New(num_events);
+	if (!list)
+		return NULL;
+
+	iter = PyObject_GetIter((PyObject *)self);
+	if (!iter) {
+		Py_DECREF(list);
+		return NULL;
+	}
+
+	for (i = 0;; i++) {
+		next = PyIter_Next(iter);
+		if (!next) {
+			Py_DECREF(iter);
+			break;
+		}
+
+		str = PyObject_Str(next);
+		Py_DECREF(next);
+		if (!str) {
+			Py_DECREF(iter);
+			Py_DECREF(list);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(list, i, str);
+		if (ret) {
+			Py_DECREF(str);
+			Py_DECREF(iter);
+			Py_DECREF(list);
+			return NULL;
+		}
+	}
+
+	str = PyUnicode_FromString(", ");
+	if (!str) {
+		Py_DECREF(list);
+		return NULL;
+	}
+
+	joined = PyObject_CallMethod(str, "join", "O", list);
+	Py_DECREF(list);
+	return joined;
+}
+
+static PyObject *edge_event_buffer_str(PyObject *self)
+{
+	PyObject *events, *capacity, *num_events, *str = NULL;
+
+	capacity = PyObject_GetAttrString(self, "capacity");
+	num_events = PyObject_GetAttrString(self, "num_events");
+	events = events_str((edge_event_buffer_object *)self);
+	if (!capacity || !num_events || !events)
+		goto out;
+
+	str = PyUnicode_FromFormat(
+		"<gpiod.EdgeEventBuffer capacity=%S num_events=%S events=[%S]>",
+		capacity, num_events, events);
+
+out:
+	Py_XDECREF(capacity);
+	Py_XDECREF(num_events);
+	Py_XDECREF(events);
+	return str;
+}
+
+static Py_ssize_t edge_event_buffer_length(edge_event_buffer_object *self)
+{
+	return gpiod_edge_event_buffer_get_num_events(self->buf);
+}
+
+static PyObject *edge_event_buffer_item(PyObject *self, Py_ssize_t index)
+{
+	return PyObject_CallMethod(self, "get_event", "n", index);
+}
+
+static PySequenceMethods edge_event_buffer_sequence_methods = {
+	.sq_length = (lenfunc)edge_event_buffer_length,
+	.sq_item = (ssizeargfunc)edge_event_buffer_item,
+};
+
+static PyObject *edge_event_buffer_iternext(edge_event_buffer_object *self)
+{
+	PyObject *event;
+
+	if (self->seq < 0)
+		self->seq = 0;
+
+	if ((size_t)self->seq ==
+			gpiod_edge_event_buffer_get_num_events(self->buf)) {
+		self->seq = -1;
+		return NULL;
+	}
+
+	event = do_get_event(self->buf, self->seq);
+	if (!event)
+		return NULL;
+
+	self->seq++;
+
+	return event;
+}
+
+PyDoc_STRVAR(edge_event_buffer_type_doc,
+"Object into which edge events are read.");
+
+static PyTypeObject edge_event_buffer_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.EdgeEventBuffer",
+	.tp_basicsize = sizeof(edge_event_buffer_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = edge_event_buffer_type_doc,
+	.tp_as_sequence = &edge_event_buffer_sequence_methods,
+	.tp_iter = PyObject_SelfIter,
+	.tp_iternext = (iternextfunc)edge_event_buffer_iternext,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)edge_event_buffer_init,
+	.tp_finalize = (destructor)edge_event_buffer_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = edge_event_buffer_getset,
+	.tp_methods = edge_event_buffer_methods,
+	.tp_repr = (reprfunc)edge_event_buffer_repr,
+	.tp_str = (reprfunc)edge_event_buffer_str
+};
+
+int Py_gpiod_RegisterEdgeEventBufferType(PyObject *module)
+{
+	return PyModule_AddType(module, &edge_event_buffer_type);
+}
+
+PyObject *Py_gpiod_MakeEdgeEventBuffer(struct gpiod_edge_event_buffer *buffer)
+{
+	edge_event_buffer_object *buf_obj;
+
+	buf_obj = PyObject_New(edge_event_buffer_object, &edge_event_buffer_type);
+	if (!buf_obj)
+		return NULL;
+
+	buf_obj->buf = buffer;
+
+	return (PyObject *)buf_obj;
+}
+
+struct gpiod_edge_event_buffer *Py_gpiod_EdgeEventBufferGetData(PyObject *obj)
+{
+	edge_event_buffer_object *bufobj;
+	PyObject *type;
+
+	type = PyObject_Type(obj);
+	if (!type)
+		return NULL;
+
+	if ((PyTypeObject *)type != &edge_event_buffer_type) {
+		PyErr_SetString(PyExc_TypeError,
+				"not a gpiod.EdgeEventBuffer object");
+		Py_DECREF(type);
+		return NULL;
+	}
+	Py_DECREF(type);
+
+	bufobj = (edge_event_buffer_object *)obj;
+
+	return bufobj->buf;
+}
diff --git a/bindings/python/edge-event.c b/bindings/python/edge-event.c
new file mode 100644
index 0000000..7b908e0
--- /dev/null
+++ b/bindings/python/edge-event.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "enum/enum.h"
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_edge_event *event;
+} edge_event_object;
+
+static const PyCEnum_EnumVal event_type_vals[] = {
+	{
+		.name = "RISING_EDGE",
+		.value = GPIOD_EDGE_EVENT_RISING_EDGE,
+	},
+	{
+		.name = "FALLING_EDGE",
+		.value = GPIOD_EDGE_EVENT_FALLING_EDGE,
+	},
+	{ }
+};
+
+static const PyCEnum_EnumDef edge_event_enums[] = {
+	{
+		.name = "Type",
+		.values = event_type_vals,
+	},
+	{ }
+};
+
+static int edge_event_init(PyObject *Py_UNUSED(self),
+			   PyObject *Py_UNUSED(ignored0),
+			   PyObject *Py_UNUSED(ignored1))
+{
+	PyErr_SetString(PyExc_TypeError,
+			"cannot create 'gpiod.EdgeEvent' instances");
+	return -1;
+}
+
+static void edge_event_finalize(edge_event_object *self)
+{
+	if (self->event)
+		gpiod_edge_event_free(self->event);
+}
+
+PyDoc_STRVAR(edge_event_get_type_doc, "Type of the event.");
+
+static PyObject *edge_event_get_type(edge_event_object *self,
+				     void *Py_UNUSED(ignored))
+{
+	int type = gpiod_edge_event_get_event_type(self->event);
+
+	return PyCEnum_MapCToPy((PyObject *)self, "Type", type);
+}
+
+PyDoc_STRVAR(edge_event_timestamp_ns_doc, "Time of the event in nanoseconds.");
+
+static PyObject *edge_event_timestamp_ns(edge_event_object *self,
+					 void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLongLong(
+			gpiod_edge_event_get_timestamp_ns(self->event));
+}
+
+PyDoc_STRVAR(edge_event_line_offset_doc,
+"Offset of the line on which this event was registered.");
+
+static PyObject *edge_event_line_offset(edge_event_object *self,
+					void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLong(
+			gpiod_edge_event_get_line_offset(self->event));
+}
+
+PyDoc_STRVAR(edge_event_global_seqno_doc,
+"Sequence number of the event relative to all lines in the associated line\n"
+"request.");
+
+static PyObject *edge_event_global_seqno(edge_event_object *self,
+					void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLong(
+			gpiod_edge_event_get_global_seqno(self->event));
+}
+
+PyDoc_STRVAR(edge_event_line_seqno_doc,
+"Sequence number of the event relative to this line within the lifetime of\n"
+"the associated line request..");
+
+static PyObject *edge_event_line_seqno(edge_event_object *self,
+					void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLong(
+			gpiod_edge_event_get_line_seqno(self->event));
+}
+
+static PyGetSetDef edge_event_getset[] = {
+	{
+		.name = "type",
+		.get = (getter)edge_event_get_type,
+		.doc = edge_event_get_type_doc,
+	},
+	{
+		.name = "timestamp_ns",
+		.get = (getter)edge_event_timestamp_ns,
+		.doc = edge_event_timestamp_ns_doc,
+	},
+	{
+		.name = "line_offset",
+		.get = (getter)edge_event_line_offset,
+		.doc = edge_event_line_offset_doc,
+	},
+	{
+		.name = "global_seqno",
+		.get = (getter)edge_event_global_seqno,
+		.doc = edge_event_global_seqno_doc,
+	},
+	{
+		.name = "line_seqno",
+		.get = (getter)edge_event_line_seqno,
+		.doc = edge_event_line_seqno_doc,
+	},
+	{ }
+};
+
+static PyObject *edge_event_str(PyObject *self)
+{
+	PyObject *type, *ts, *offset, *gseqno, *lseqno, *str = NULL;
+
+	type = PyObject_GetAttrString(self, "type");
+	ts = PyObject_GetAttrString(self, "timestamp_ns");
+	offset = PyObject_GetAttrString(self, "line_offset");
+	gseqno = PyObject_GetAttrString(self, "global_seqno");
+	lseqno = PyObject_GetAttrString(self, "line_seqno");
+	if (!type || !ts || !offset || !gseqno || !lseqno)
+		goto out;
+
+	str = PyUnicode_FromFormat(
+		"<gpiod.EdgeEvent type=%S timestamp_ns=%S line_offset=%S global_seqno=%S line_seqno=%S>",
+		type, ts, offset, gseqno, lseqno);
+
+out:
+	Py_XDECREF(type);
+	Py_XDECREF(ts);
+	Py_XDECREF(offset);
+	Py_XDECREF(gseqno);
+	Py_XDECREF(lseqno);
+	return str;
+}
+
+PyDoc_STRVAR(edge_event_type_doc,
+"Immutable object containing data about a single line edge event.");
+
+static PyTypeObject edge_event_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.EdgeEvent",
+	.tp_basicsize = sizeof(edge_event_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = edge_event_type_doc,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)edge_event_init,
+	.tp_finalize = (destructor)edge_event_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = edge_event_getset,
+	.tp_str = (reprfunc)edge_event_str
+};
+
+int Py_gpiod_RegisterEdgeEventType(PyObject *module)
+{
+	int ret;
+
+	ret = PyModule_AddType(module, &edge_event_type);
+	if (ret)
+		return ret;
+
+	return PyCEnum_AddEnumsToType(edge_event_enums, &edge_event_type);
+}
+
+PyObject *Py_gpiod_MakeEdgeEvent(struct gpiod_edge_event *event)
+{
+	edge_event_object *event_obj;
+
+	event_obj = PyObject_New(edge_event_object, &edge_event_type);
+	if (!event_obj)
+		return NULL;
+
+	event_obj->event = event;
+
+	return (PyObject *)event_obj;
+}
diff --git a/bindings/python/exception.c b/bindings/python/exception.c
new file mode 100644
index 0000000..401c96d
--- /dev/null
+++ b/bindings/python/exception.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <stdarg.h>
+#include <stdio.h>
+
+#include "module.h"
+
+struct exception_desc {
+	char *name;
+	char *base;
+	char *doc;
+};
+
+static const struct exception_desc exceptions[] = {
+	{
+		.name = "ChipClosedError",
+		.base = "Exception",
+		.doc = "Error raised when an already closed chip is used.",
+	},
+	{
+		.name = "RequestReleasedError",
+		.base = "Exception",
+		.doc = "Error raised when a released request is used.",
+	},
+	{
+		.name = "BadMappingError",
+		.base = "Exception",
+		.doc = "Exception thrown when the core C library returns an invalid value for any of the line properties.",
+	},
+	{ }
+};
+
+PyObject *_Py_gpiod_SetErrFromErrno(const char *filename)
+{
+	PyObject *exc;
+
+	if (errno == ENOMEM)
+		return PyErr_NoMemory();
+
+	switch (errno) {
+	case EINVAL:
+		exc = PyExc_ValueError;
+		break;
+	case EOPNOTSUPP:
+		exc = PyExc_NotImplementedError;
+		break;
+	case EPIPE:
+		exc = PyExc_BrokenPipeError;
+		break;
+	case ECHILD:
+		exc = PyExc_ChildProcessError;
+		break;
+	case EINTR:
+		exc = PyExc_InterruptedError;
+		break;
+	case EEXIST:
+		exc = PyExc_FileExistsError;
+		break;
+	case ENOENT:
+		exc = PyExc_FileNotFoundError;
+		break;
+	case EISDIR:
+		exc = PyExc_IsADirectoryError;
+		break;
+	case ENOTDIR:
+		exc = PyExc_NotADirectoryError;
+		break;
+	case EPERM:
+		exc = PyExc_PermissionError;
+		break;
+	case ETIMEDOUT:
+		exc = PyExc_TimeoutError;
+		break;
+	default:
+		exc = PyExc_OSError;
+		break;
+	}
+
+	return PyErr_SetFromErrnoWithFilename(exc, filename);
+}
+
+static int add_exception_type(PyObject *module, PyObject *globals,
+			      PyObject *locals,
+			      const struct exception_desc *exc)
+{
+	static const char *const fmt =
+		"class %s(%s):\n"
+		"    \"\"\"%s\"\"\"\n"
+		"    pass";
+
+	PyObject *code, *res, *type;
+	char *src;
+	int ret;
+
+	ret = asprintf(&src, fmt, exc->name, exc->base, exc->doc);
+	if (ret < 0) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	code = Py_CompileString(src, __FILE__, Py_single_input);
+	free(src);
+	if (!code)
+		return -1;
+
+	res = PyEval_EvalCode(code, globals, locals);
+	Py_DECREF(code);
+	if (!res)
+		return -1;
+
+	Py_DECREF(res);
+
+	type = PyDict_GetItemString(locals, exc->name);
+	if (!type)
+		return -1;
+
+	return PyModule_AddType(module, (PyTypeObject *)type);
+}
+
+int Py_gpiod_RegisterExceptionTypes(PyObject *module)
+{
+	const struct exception_desc *exc;
+	PyObject *globals, *locals;
+	int ret;
+
+	globals = PyEval_GetGlobals();
+	if (!globals)
+		return -1;
+
+	locals = PyDict_New();
+	if (!locals)
+		return -1;
+
+	for (exc = exceptions; exc->name; exc++) {
+		ret = add_exception_type(module, globals, locals, exc);
+		if (ret) {
+			Py_DECREF(locals);
+			return -1;
+		}
+	}
+
+	Py_DECREF(locals);
+	return 0;
+}
+
+static void set_error(const char *name, const char *fmt, ...)
+{
+	PyObject *mod, *dict, *type;
+	va_list va;
+
+	mod = Py_gpiod_GetModule();
+	if (!mod)
+		return;
+
+	dict = PyModule_GetDict(mod);
+	if (!dict)
+		return;
+
+	type = PyDict_GetItemString(dict, name);
+	if (!type)
+		return;
+
+	va_start(va, fmt);
+	PyErr_FormatV(type, fmt, va);
+	va_end(va);
+}
+
+void Py_gpiod_SetChipClosedError(void)
+{
+	set_error("ChipClosedError", "I/O operation on closed chip");
+}
+
+void Py_gpiod_SetRequestReleasedError(void)
+{
+	set_error("RequestReleasedError", "GPIO lines have been released");
+}
+
+void Py_gpiod_SetBadMappingError(const char *name)
+{
+	set_error("BadMappingError", "Bad mapping for %s", name);
+}
diff --git a/bindings/python/info-event.c b/bindings/python/info-event.c
new file mode 100644
index 0000000..9e9bcb6
--- /dev/null
+++ b/bindings/python/info-event.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "enum/enum.h"
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_info_event *event;
+	PyObject *info;
+} info_event_object;
+
+static const PyCEnum_EnumVal event_type_vals[] = {
+	{
+		.name = "LINE_REQUESTED",
+		.value = GPIOD_INFO_EVENT_LINE_REQUESTED,
+	},
+	{
+		.name = "LINE_RELEASED",
+		.value = GPIOD_INFO_EVENT_LINE_RELEASED,
+	},
+	{
+		.name = "LINE_CONFIG_CHANGED",
+		.value = GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
+	},
+	{ }
+};
+
+static const PyCEnum_EnumDef info_event_enums[] = {
+	{
+		.name = "Type",
+		.values = event_type_vals,
+	},
+	{ }
+};
+
+static int info_event_init(PyObject *Py_UNUSED(self),
+			   PyObject *Py_UNUSED(ignored0),
+			   PyObject *Py_UNUSED(ignored1))
+{
+	PyErr_SetString(PyExc_TypeError,
+			"cannot create 'gpiod.InfoEvent' instances");
+	return -1;
+}
+
+static void info_event_finalize(info_event_object *self)
+{
+	Py_XDECREF(self->info);
+
+	if (self->event)
+		gpiod_info_event_free(self->event);
+}
+
+PyDoc_STRVAR(info_event_get_type_doc, "Type of the event.");
+
+static PyObject *info_event_get_type(info_event_object *self,
+				     void *Py_UNUSED(ignored))
+{
+	int type = gpiod_info_event_get_event_type(self->event);
+
+	return PyCEnum_MapCToPy((PyObject *)self, "Type", type);
+}
+
+PyDoc_STRVAR(info_event_timestamp_ns_doc, "Time of the event in nanoseconds.");
+
+static PyObject *info_event_timestamp_ns(info_event_object *self,
+					 void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLongLong(
+			gpiod_info_event_get_timestamp_ns(self->event));
+}
+
+PyDoc_STRVAR(info_event_line_info_doc, "New line information.");
+
+static PyObject *info_event_line_info(info_event_object *self,
+				      void *Py_UNUSED(ignored))
+{
+	struct gpiod_line_info *info, *cpy;
+
+	if (!self->info) {
+		info = gpiod_info_event_get_line_info(self->event);
+		cpy = gpiod_line_info_copy(info);
+		if (!cpy)
+			return NULL;
+
+		self->info = Py_gpiod_MakeLineInfo(cpy);
+		if (!self->info)
+			return NULL;
+	}
+
+	Py_INCREF(self->info);
+	return self->info;
+}
+
+static PyGetSetDef info_event_getset[] = {
+	{
+		.name = "type",
+		.get = (getter)info_event_get_type,
+		.doc = info_event_get_type_doc,
+	},
+	{
+		.name = "timestamp_ns",
+		.get = (getter)info_event_timestamp_ns,
+		.doc = info_event_timestamp_ns_doc,
+	},
+	{
+		.name = "line_info",
+		.get = (getter)info_event_line_info,
+		.doc = info_event_line_info_doc,
+	},
+	{ }
+};
+
+static PyObject *info_event_str(PyObject *self)
+{
+	PyObject *type, *ts, *info, *str = NULL;
+
+	type = PyObject_GetAttrString(self, "type");
+	ts = PyObject_GetAttrString(self, "timestamp_ns");
+	info = PyObject_GetAttrString(self, "line_info");
+	if (!type || !ts || !info)
+		goto out;
+
+	str = PyUnicode_FromFormat(
+		"<gpiod.InfoEvent type=%S timestamp_ns=%S line_info=%S>",
+		type, ts, info);
+
+out:
+	Py_XDECREF(type);
+	Py_XDECREF(ts);
+	Py_XDECREF(info);
+	return str;
+}
+
+PyDoc_STRVAR(info_event_type_doc,
+"Immutable object containing data about a single line info event.");
+
+static PyTypeObject info_event_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.InfoEvent",
+	.tp_basicsize = sizeof(info_event_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = info_event_type_doc,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)info_event_init,
+	.tp_finalize = (destructor)info_event_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = info_event_getset,
+	.tp_str = (reprfunc)info_event_str
+};
+
+int Py_gpiod_RegisterInfoEventType(PyObject *module)
+{
+	int ret;
+
+	ret = PyModule_AddType(module, &info_event_type);
+	if (ret)
+		return ret;
+
+	return PyCEnum_AddEnumsToType(info_event_enums, &info_event_type);
+}
+
+PyObject *Py_gpiod_MakeInfoEvent(struct gpiod_info_event *event)
+{
+	info_event_object *event_obj;
+
+	event_obj = PyObject_New(info_event_object, &info_event_type);
+	if (!event_obj)
+		return NULL;
+
+	event_obj->event = event;
+	event_obj->info = NULL;
+
+	return (PyObject *)event_obj;
+}
diff --git a/bindings/python/line-config.c b/bindings/python/line-config.c
new file mode 100644
index 0000000..b272579
--- /dev/null
+++ b/bindings/python/line-config.c
@@ -0,0 +1,1373 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <limits.h>
+
+#include "enum/enum.h"
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_line_config *cfg;
+} line_config_object;
+
+struct properties {
+	PyObject *direction;
+	PyObject *edge;
+	PyObject *bias;
+	PyObject *drive;
+	PyObject *active_low;
+	PyObject *debounce_period;
+	PyObject *event_clock;
+	PyObject *output_value;
+	PyObject *output_values;
+};
+
+enum property {
+	PROP_DIRECTION = 1,
+	PROP_EDGE_DETECTION,
+	PROP_BIAS,
+	PROP_DRIVE,
+	PROP_ACTIVE_LOW,
+	PROP_DEBOUNCE_PERIOD,
+	PROP_EVENT_CLOCK,
+	PROP_OUTPUT_VALUE,
+	PROP_OUTPUT_VALUES
+};
+
+static const PyCEnum_EnumVal property_vals[] = {
+	{
+		.name = "DIRECTION",
+		.value = PROP_DIRECTION,
+	},
+	{
+		.name = "EDGE_DETECTION",
+		.value = PROP_EDGE_DETECTION,
+	},
+	{
+		.name = "BIAS",
+		.value = PROP_BIAS,
+	},
+	{
+		.name = "DRIVE",
+		.value = PROP_DRIVE,
+	},
+	{
+		.name = "ACTIVE_LOW",
+		.value = PROP_ACTIVE_LOW,
+	},
+	{
+		.name = "DEBOUNCE_PERIOD",
+		.value = PROP_DEBOUNCE_PERIOD,
+	},
+	{
+		.name = "EVENT_CLOCK",
+		.value = PROP_EVENT_CLOCK,
+	},
+	{
+		.name = "OUTPUT_VALUE",
+		.value = PROP_OUTPUT_VALUE,
+	},
+	{
+		.name = "OUTPUT_VALUES",
+		.value = PROP_OUTPUT_VALUES,
+	},
+	{ }
+};
+
+static const PyCEnum_EnumDef line_config_enums[] = {
+	{
+		.name = "Property",
+		.values = property_vals,
+	},
+	{ }
+};
+
+static int set_default_enum(struct gpiod_line_config *cfg,
+			    void (*set_func)(struct gpiod_line_config *, int),
+			    int prop, PyObject *valobj)
+{
+	int val;
+
+	if (!valobj)
+		return 0;
+
+	val = Py_gpiod_MapLinePropPyToC(prop, valobj);
+	if (val < 0)
+		return -1;
+
+	set_func(cfg, val);
+
+	return 0;
+}
+
+static int set_defaults(struct gpiod_line_config *cfg, struct properties *props)
+{
+	unsigned long debounce_period;
+	bool active_low;
+	int ret;
+
+	ret = set_default_enum(cfg, gpiod_line_config_set_direction_default,
+			       PY_GPIOD_LINE_DIRECTION, props->direction);
+	if (ret)
+		return ret;
+
+	ret = set_default_enum(cfg,
+			       gpiod_line_config_set_edge_detection_default,
+			       PY_GPIOD_LINE_EDGE, props->edge);
+	if (ret)
+		return ret;
+
+	ret = set_default_enum(cfg, gpiod_line_config_set_bias_default,
+			       PY_GPIOD_LINE_BIAS, props->bias);
+	if (ret)
+		return ret;
+
+	ret = set_default_enum(cfg, gpiod_line_config_set_drive_default,
+			       PY_GPIOD_LINE_DRIVE, props->drive);
+	if (ret)
+		return ret;
+
+	if (props->active_low) {
+		if (props->active_low == Py_True) {
+			active_low = true;
+		} else if (props->active_low == Py_False) {
+			active_low = false;
+		} else {
+			PyErr_SetString(PyExc_TypeError,
+					"active_low must be a boolean value");
+			return -1;
+		}
+
+		gpiod_line_config_set_active_low_default(cfg, active_low);
+	}
+
+	if (props->debounce_period) {
+		debounce_period = Py_gpiod_TimedeltaToMicroseconds(
+						props->debounce_period);
+		if (PyErr_Occurred())
+			return -1;
+
+		gpiod_line_config_set_debounce_period_us_default(cfg,
+							debounce_period);
+	}
+
+	ret = set_default_enum(cfg, gpiod_line_config_set_event_clock_default,
+			       PY_GPIOD_LINE_CLOCK, props->event_clock);
+	if (ret)
+		return ret;
+
+	ret = set_default_enum(cfg, gpiod_line_config_set_output_value_default,
+			       PY_GPIOD_LINE_VALUE, props->output_value);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int line_config_init(line_config_object *self,
+			    PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"direction",
+		"edge_detection",
+		"bias",
+		"drive",
+		"active_low",
+		"debounce_period",
+		"event_clock",
+		"output_value",
+		"output_values",
+		NULL
+	};
+
+	struct properties props;
+	PyObject *retobj;
+	int ret;
+
+	self->cfg = gpiod_line_config_new();
+	if (!self->cfg) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	memset(&props, 0, sizeof(props));
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|$OOOOOOOOO", kwlist,
+					  &props.direction,
+					  &props.edge,
+					  &props.bias,
+					  &props.drive,
+					  &props.active_low,
+					  &props.debounce_period,
+					  &props.event_clock,
+					  &props.output_value,
+					  &props.output_values);
+	if (!ret)
+		return -1;
+
+	if (props.output_values) {
+		retobj = PyObject_CallMethod((PyObject *)self,
+					     "set_output_values",
+					     "O", props.output_values);
+		if (!retobj)
+			return -1;
+
+		Py_DECREF(retobj);
+	}
+
+	return set_defaults(self->cfg, &props);
+}
+
+static void line_config_finalize(line_config_object *self)
+{
+	if (self->cfg)
+		gpiod_line_config_free(self->cfg);
+}
+
+PyDoc_STRVAR(line_config_num_overrides_doc,
+"Number of configuration overrides.");
+
+static PyObject *
+line_config_num_overrides(line_config_object *self, void *Py_UNUSED(ignored))
+{
+	return PyLong_FromSize_t(
+			gpiod_line_config_get_num_overrides(self->cfg));
+}
+
+PyDoc_STRVAR(line_config_overrides_doc,
+"Dictionary of property overrides with keys representing the overridden\n"
+"offsets and values representing the properties.");
+
+static PyObject *
+line_config_overrides(line_config_object *self, void *Py_UNUSED(ignored))
+{
+	PyObject *overrides, *key, *val;
+	size_t num_overrides, i;
+	unsigned int *offsets;
+	int *props, ret;
+
+	num_overrides = gpiod_line_config_get_num_overrides(self->cfg);
+
+	offsets = PyMem_Calloc(num_overrides, sizeof(unsigned int));
+	if (!offsets) {
+		PyErr_NoMemory();
+		return NULL;
+	}
+
+	props = PyMem_Calloc(num_overrides, sizeof(int));
+	if (!props) {
+		PyErr_NoMemory();
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	gpiod_line_config_get_overrides(self->cfg, offsets, props);
+
+	overrides = PyDict_New();
+	if (!overrides) {
+		PyMem_Free(offsets);
+		PyMem_Free(props);
+		return NULL;
+	}
+
+	for (i = 0; i < num_overrides; i++) {
+		key = PyLong_FromUnsignedLong(offsets[i]);
+		if (PyErr_Occurred()) {
+			Py_DECREF(overrides);
+			PyMem_Free(offsets);
+			PyMem_Free(props);
+			return NULL;
+		}
+
+		val = PyCEnum_MapCToPy((PyObject *)self, "Property", props[i]);
+		if (!val) {
+			Py_DECREF(key);
+			Py_DECREF(overrides);
+			PyMem_Free(offsets);
+			PyMem_Free(props);
+			return NULL;
+		}
+
+		ret = PyDict_SetItem(overrides, key, val);
+		Py_DECREF(key);
+		Py_DECREF(val);
+		if (ret) {
+			Py_DECREF(overrides);
+			PyMem_Free(offsets);
+			PyMem_Free(props);
+			return NULL;
+		}
+	}
+
+	PyMem_Free(offsets);
+	PyMem_Free(props);
+
+	return overrides;
+}
+
+static PyGetSetDef line_config_getset[] = {
+	{
+		.name = "num_overrides",
+		.get = (getter)line_config_num_overrides,
+		.doc = line_config_num_overrides_doc,
+	},
+	{
+		.name = "overrides",
+		.get = (getter)line_config_overrides,
+		.doc = line_config_overrides_doc,
+	},
+	{ }
+};
+
+PyDoc_STRVAR(line_config_reset_doc, "Reset the line config object.");
+
+static PyObject *
+line_config_reset(line_config_object *self, PyObject *Py_UNUSED(ignored))
+{
+	gpiod_line_config_reset(self->cfg);
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(line_config_set_props_default_doc,
+"Set the defaults for properties.\n"
+"\n"
+"Args:\n"
+"  direction:\n"
+"    Default direction.\n"
+"  edge_detection:\n"
+"    Default edge detection.\n"
+"  bias:\n"
+"    Default bias.\n"
+"  drive:\n"
+"    Default drive.\n"
+"  active_low:\n"
+"    Default active-low setting.\n"
+"  debounce_period:\n"
+"    Default debounce period.\n"
+"  event_clock:\n"
+"    Default event clock.\n"
+"  output_value:\n"
+"    Default output value.");
+
+static PyObject *
+line_config_set_props_default(line_config_object *self,
+			      PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"direction",
+		"edge_detection",
+		"bias",
+		"drive",
+		"active_low",
+		"debounce_period",
+		"event_clock",
+		"output_value",
+		NULL
+	};
+
+	struct properties props;
+	int ret;
+
+	memset(&props, 0, sizeof(props));
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|$OOOOOOOO", kwlist,
+					  &props.direction,
+					  &props.edge,
+					  &props.bias,
+					  &props.drive,
+					  &props.active_low,
+					  &props.debounce_period,
+					  &props.event_clock,
+					  &props.output_value);
+	if (!ret)
+		return NULL;
+
+	ret = set_defaults(self->cfg, &props);
+	if (ret)
+		return NULL;
+
+	Py_RETURN_NONE;
+}
+
+static int set_override_enum(struct gpiod_line_config *cfg,
+			     void (*set_func)(struct gpiod_line_config *,
+					      int, unsigned int),
+			     unsigned int offset, int prop, PyObject *valobj)
+{
+	int val;
+
+	if (!valobj)
+		return 0;
+
+	val = Py_gpiod_MapLinePropPyToC(prop, valobj);
+	if (val < 0)
+		return -1;
+
+	set_func(cfg, val, offset);
+
+	return 0;
+}
+
+PyDoc_STRVAR(line_config_set_props_override_doc,
+"Set property overrides for line.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the line for which to set the overrides.\n"
+"  direction:\n"
+"    Overriding direction.\n"
+"  edge_detection:\n"
+"    Overriding edge detection.\n"
+"  bias:\n"
+"    Overriding bias.\n"
+"  drive:\n"
+"    Overriding drive.\n"
+"  active_low:\n"
+"    Overriding active-low setting.\n"
+"  debounce_period:\n"
+"    Overriding debounce period.\n"
+"  event_clock:\n"
+"    Overriding event clock.\n"
+"  output_value:\n"
+"    Overriding output value.");
+
+static PyObject *
+line_config_set_props_override(line_config_object *self,
+			       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"",
+		"direction",
+		"edge_detection",
+		"bias",
+		"drive",
+		"active_low",
+		"debounce_period",
+		"event_clock",
+		"output_value",
+		NULL
+	};
+
+	struct gpiod_line_config *cfg = self->cfg;
+	unsigned long debounce_period;
+	struct properties props;
+	unsigned int offset;
+	bool active_low;
+	int ret;
+
+	memset(&props, 0, sizeof(props));
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "I|$OOOOOOOO", kwlist,
+					  &offset,
+					  &props.direction,
+					  &props.edge,
+					  &props.bias,
+					  &props.drive,
+					  &props.active_low,
+					  &props.debounce_period,
+					  &props.event_clock,
+					  &props.output_value);
+	if (!ret)
+		return NULL;
+
+	ret = set_override_enum(cfg, gpiod_line_config_set_direction_override,
+				offset, PY_GPIOD_LINE_DIRECTION,
+				props.direction);
+	if (ret)
+		return NULL;
+
+	ret = set_override_enum(cfg,
+				gpiod_line_config_set_edge_detection_override,
+				offset, PY_GPIOD_LINE_EDGE, props.edge);
+	if (ret)
+		return NULL;
+
+	ret = set_override_enum(cfg, gpiod_line_config_set_bias_override,
+				offset, PY_GPIOD_LINE_BIAS, props.bias);
+	if (ret)
+		return NULL;
+
+	ret = set_override_enum(cfg, gpiod_line_config_set_drive_override,
+				offset, PY_GPIOD_LINE_DRIVE, props.drive);
+	if (ret)
+		return NULL;
+
+	if (props.active_low) {
+		if (props.active_low == Py_True) {
+			active_low = true;
+		} else if (props.active_low == Py_False) {
+			active_low = false;
+		} else {
+			PyErr_SetString(PyExc_TypeError,
+					"active_low must be a boolean value");
+			return NULL;
+		}
+
+		gpiod_line_config_set_active_low_override(cfg, active_low,
+							  offset);
+	}
+
+	if (props.debounce_period) {
+		debounce_period = Py_gpiod_TimedeltaToMicroseconds(
+						props.debounce_period);
+		if (PyErr_Occurred())
+			return NULL;
+
+		gpiod_line_config_set_debounce_period_us_override(cfg,
+								debounce_period,
+								offset);
+	}
+
+	ret = set_override_enum(cfg, gpiod_line_config_set_event_clock_override,
+				offset, PY_GPIOD_LINE_CLOCK, props.event_clock);
+	if (ret)
+		return NULL;
+
+	ret = set_override_enum(cfg,
+				gpiod_line_config_set_output_value_override,
+				offset, PY_GPIOD_LINE_VALUE,
+				props.output_value);
+	if (ret)
+		return NULL;
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(line_config_get_props_default_doc,
+"Get default values for a set of line properties.\n"
+"\n"
+"Args:\n"
+"  properties:\n"
+"    List of properties (gpiod.LineConfig.Property) for which to get default\n"
+"    values.\n"
+"\n"
+"Returns:\n"
+"  List of default values for properties specified in the argument list and\n"
+"  in the same order");
+
+static PyObject *
+line_config_get_props_default(line_config_object *self,
+			      PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"properties",
+		NULL
+	};
+
+	PyObject *props, *iter, *values, *next, *item;
+	struct gpiod_line_config *cfg;
+	unsigned long debounce_period;
+	Py_ssize_t num_props, i;
+	int prop, val, ret;
+	bool active_low;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O", kwlist, &props);
+	if (!ret)
+		return NULL;
+
+	num_props = PyList_Size(props);
+	if (num_props < 0)
+		return NULL;
+
+	if (num_props == 1)
+		Py_RETURN_NONE;
+
+	values = PyList_New(num_props);
+	if (!values)
+		return NULL;
+
+	iter = PyObject_GetIter(props);
+	if (!iter) {
+		Py_DECREF(values);
+		return NULL;
+	}
+
+	cfg = self->cfg;
+
+	for (i = 0;; i++) {
+		next = PyIter_Next(iter);
+		if (!next)
+			break;
+
+		prop = PyCEnum_MapPyToC((PyObject *)self, "Property", next);
+		Py_DECREF(next);
+		if (prop < 0) {
+			Py_DECREF(values);
+			return NULL;
+		}
+
+		switch (prop) {
+		case PROP_DIRECTION:
+			val = gpiod_line_config_get_direction_default(cfg);
+			item = Py_gpiod_MapLinePropCToPy(
+					PY_GPIOD_LINE_DIRECTION, val);
+			break;
+		case PROP_EDGE_DETECTION:
+			val = gpiod_line_config_get_edge_detection_default(cfg);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_EDGE,
+							 val);
+			break;
+		case PROP_BIAS:
+			val = gpiod_line_config_get_bias_default(cfg);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_BIAS,
+							 val);
+			break;
+		case PROP_DRIVE:
+			val = gpiod_line_config_get_drive_default(cfg);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_DRIVE,
+							 val);
+			break;
+		case PROP_ACTIVE_LOW:
+			active_low =
+				gpiod_line_config_get_active_low_default(cfg);
+			item = active_low ? Py_True : Py_False;
+			Py_INCREF(item);
+			break;
+		case PROP_DEBOUNCE_PERIOD:
+			debounce_period =
+			gpiod_line_config_get_debounce_period_us_default(cfg);
+			item = Py_gpiod_MicrosecondsToTimedelta(
+							debounce_period);
+			break;
+		case PROP_EVENT_CLOCK:
+			val = gpiod_line_config_get_event_clock_default(cfg);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_CLOCK,
+							 val);
+			break;
+		case PROP_OUTPUT_VALUE:
+			val = gpiod_line_config_get_output_value_default(cfg);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_VALUE,
+							 val);
+			break;
+		default:
+			Py_DECREF(values);
+			PyErr_SetString(PyExc_ValueError,
+					"unsupported property type");
+			return NULL;
+		}
+
+		if (!item) {
+			Py_DECREF(values);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(values, i, item);
+		if (ret < 0) {
+			Py_DECREF(values);
+			return NULL;
+		}
+	}
+
+	if (num_props == 1) {
+		item = PyList_GetItem(values, 0);
+		Py_INCREF(item);
+		Py_DECREF(values);
+		return item;
+	}
+
+	return values;
+}
+
+PyDoc_STRVAR(line_config_get_props_offset_doc,
+"Get the actual values for a set of line properties for a line.\n"
+"\n"
+"Args:\n"
+"  Takes a variable number of property types as defined by the\n"
+"  gpiod.LineConfig.Property enum.\n"
+"\n"
+"  offset\n"
+"    The offset of the line for which to read the properties");
+
+static PyObject *
+line_config_get_props_offset(line_config_object *self, PyObject *args)
+{
+	unsigned long tmp, debounce_period;
+	PyObject *props, *item, *next;
+	struct gpiod_line_config *cfg;
+	Py_ssize_t num_args, i;
+	unsigned int offset;
+	int ret, prop, val;
+	bool active_low;
+
+	num_args = PyTuple_GET_SIZE(args);
+	if (num_args < 0)
+		return NULL;
+
+	if (num_args < 1) {
+		PyErr_SetString(PyExc_TypeError, "line offset must be given");
+		return NULL;
+	}
+
+	item = PyTuple_GetItem(args, 0);
+	if (!item)
+		return NULL;
+
+	tmp = PyLong_AsUnsignedLong(item);
+	if (PyErr_Occurred())
+		return NULL;
+
+	if (tmp > UINT_MAX) {
+		PyErr_SetString(PyExc_ValueError, "max offset value exceeded");
+		return NULL;
+	}
+
+	offset = tmp;
+
+	props = PyList_New(num_args - 1);
+	if (!props)
+		return NULL;
+
+	cfg = self->cfg;
+
+	for (i = 1; i < num_args; i++) {
+		next = PyTuple_GetItem(args, i);
+		if (!next) {
+			Py_DECREF(props);
+			return NULL;
+		}
+
+		prop = PyCEnum_MapPyToC((PyObject *)self, "Property", next);
+		if (prop < 0) {
+			Py_DECREF(props);
+			return NULL;
+		}
+
+		switch (prop) {
+		case PROP_DIRECTION:
+			val = gpiod_line_config_get_direction_offset(cfg,
+								     offset);
+			item = Py_gpiod_MapLinePropCToPy(
+					PY_GPIOD_LINE_DIRECTION, val);
+			break;
+		case PROP_EDGE_DETECTION:
+			val = gpiod_line_config_get_edge_detection_offset(cfg,
+									offset);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_EDGE,
+							 val);
+			break;
+		case PROP_BIAS:
+			val = gpiod_line_config_get_bias_offset(cfg, offset);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_BIAS,
+							 val);
+			break;
+		case PROP_DRIVE:
+			val = gpiod_line_config_get_drive_offset(cfg, offset);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_DRIVE,
+							 val);
+			break;
+		case PROP_ACTIVE_LOW:
+			active_low =
+				gpiod_line_config_get_active_low_offset(cfg,
+									offset);
+			item = active_low ? Py_True : Py_False;
+			Py_INCREF(item);
+			break;
+		case PROP_DEBOUNCE_PERIOD:
+			debounce_period =
+			gpiod_line_config_get_debounce_period_us_offset(cfg,
+									offset);
+			item = Py_gpiod_MicrosecondsToTimedelta(
+							debounce_period);
+			break;
+		case PROP_EVENT_CLOCK:
+			val = gpiod_line_config_get_event_clock_offset(cfg,
+								       offset);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_CLOCK,
+							 val);
+			break;
+		case PROP_OUTPUT_VALUE:
+			val = gpiod_line_config_get_output_value_offset(cfg,
+									offset);
+			item = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_VALUE,
+							 val);
+			break;
+		default:
+			Py_DECREF(props);
+			PyErr_SetString(PyExc_ValueError,
+					"unsupported property type");
+			return NULL;
+		}
+
+		if (!item) {
+			Py_DECREF(props);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(props, i - 1, item);
+		if (ret < 0) {
+			Py_DECREF(props);
+			return NULL;
+		}
+	}
+
+	if (num_args == 2) {
+		item = PyList_GetItem(props, 0);
+		Py_INCREF(item);
+		Py_DECREF(props);
+		return item;
+	}
+
+	return props;
+}
+
+PyDoc_STRVAR(line_config_prop_is_overridden_doc,
+"Check if the property is overridden for a line.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the line for which to check the property.\n"
+"  prop:\n"
+"    Which property to check.\n"
+"\n"
+"Returns:\n"
+"  True if the specified property is overridden for given line, False\n"
+"  otherwise.");
+
+static PyObject *
+line_config_prop_is_overridden(line_config_object *self,
+			       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"offset",
+		"prop",
+		NULL
+	};
+
+	struct gpiod_line_config *cfg = self->cfg;
+	unsigned int offset;
+	PyObject *prop_obj;
+	int ret, prop;
+	bool val;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "IO", kwlist,
+					  &offset, &prop_obj);
+	if (!ret)
+		return NULL;
+
+	prop = PyCEnum_MapPyToC((PyObject *)self, "Property", prop_obj);
+	if (prop < 0)
+		return NULL;
+
+	switch (prop) {
+	case PROP_DIRECTION:
+		val = gpiod_line_config_direction_is_overridden(cfg, offset);
+		break;
+	case PROP_EDGE_DETECTION:
+		val = gpiod_line_config_edge_detection_is_overridden(cfg,
+								     offset);
+		break;
+	case PROP_BIAS:
+		val = gpiod_line_config_bias_is_overridden(cfg, offset);
+		break;
+	case PROP_DRIVE:
+		val = gpiod_line_config_drive_is_overridden(cfg, offset);
+		break;
+	case PROP_ACTIVE_LOW:
+		val = gpiod_line_config_active_low_is_overridden(cfg, offset);
+		break;
+	case PROP_DEBOUNCE_PERIOD:
+		val = gpiod_line_config_debounce_period_us_is_overridden(cfg,
+									offset);
+		break;
+	case PROP_EVENT_CLOCK:
+		val = gpiod_line_config_event_clock_is_overridden(cfg, offset);
+		break;
+	case PROP_OUTPUT_VALUE:
+		val = gpiod_line_config_output_value_is_overridden(cfg, offset);
+		break;
+	default:
+		PyErr_SetString(PyExc_ValueError,
+				"unsupported property type");
+		return NULL;
+	}
+
+	return PyBool_FromLong(val);
+}
+
+PyDoc_STRVAR(line_config_clear_prop_override_doc,
+"Clear an override for a property for given line.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the line for which to clear the override.\n"
+"  prop:\n"
+"    One of gpiod.LineConfig.Propery indicating which property to clear.");
+
+static PyObject *
+line_config_clear_prop_override(line_config_object *self,
+				PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"offset",
+		"prop",
+		NULL
+	};
+
+	struct gpiod_line_config *cfg = self->cfg;
+	unsigned int offset;
+	PyObject *prop_obj;
+	int ret, prop;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "IO", kwlist,
+					  &offset, &prop_obj);
+	if (!ret)
+		return NULL;
+
+	prop = PyCEnum_MapPyToC((PyObject *)self, "Property", prop_obj);
+	if (prop < 0)
+		return NULL;
+
+	switch (prop) {
+	case PROP_DIRECTION:
+		gpiod_line_config_clear_direction_override(cfg, offset);
+		break;
+	case PROP_EDGE_DETECTION:
+		gpiod_line_config_clear_edge_detection_override(cfg, offset);
+		break;
+	case PROP_BIAS:
+		gpiod_line_config_clear_bias_override(cfg, offset);
+		break;
+	case PROP_DRIVE:
+		gpiod_line_config_clear_drive_override(cfg, offset);
+		break;
+	case PROP_ACTIVE_LOW:
+		gpiod_line_config_clear_active_low_override(cfg, offset);
+		break;
+	case PROP_DEBOUNCE_PERIOD:
+		gpiod_line_config_clear_debounce_period_us_override(cfg,
+								    offset);
+		break;
+	case PROP_EVENT_CLOCK:
+		gpiod_line_config_clear_event_clock_override(cfg, offset);
+		break;
+	case PROP_OUTPUT_VALUE:
+		gpiod_line_config_clear_output_value_override(cfg, offset);
+		break;
+	default:
+		PyErr_SetString(PyExc_ValueError,
+				"unsupported property type");
+		return NULL;
+	}
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(line_config_set_output_values_doc,
+"Override the output values for multiple lines.\n"
+"\n"
+"Args:\n"
+"  values:\n"
+"    Dictionary mapping line offsets to their values.");
+
+static PyObject *
+line_config_set_output_values(line_config_object *self,
+			      PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"values",
+		NULL
+	};
+
+	PyObject *dict, *items, *iter, *next, *key, *val;
+	unsigned int offset;
+	unsigned long tmp;
+	int ret, value;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O", kwlist, &dict);
+	if (!ret)
+		return NULL;
+
+	if (!PyDict_Check(dict)) {
+		PyErr_SetString(PyExc_TypeError,
+				"argument must be a dictionary");
+		return NULL;
+	}
+
+	items = PyDict_Items(dict);
+	if (!items)
+		return NULL;
+
+	iter = PyObject_GetIter(items);
+	if (!iter) {
+		Py_DECREF(items);
+		return NULL;
+	}
+
+	for (;;) {
+		next = PyIter_Next(iter);
+		if (!next) {
+			Py_DECREF(iter);
+			break;
+		}
+
+		key = PyTuple_GetItem(next, 0);
+		val = PyTuple_GetItem(next, 1);
+		if (!key || !val) {
+			Py_DECREF(next);
+			Py_DECREF(iter);
+			Py_DECREF(items);
+			return NULL;
+		}
+
+		tmp = PyLong_AsUnsignedLong(key);
+		if (PyErr_Occurred()) {
+			Py_DECREF(next);
+			Py_DECREF(iter);
+			Py_DECREF(items);
+			return NULL;
+		}
+
+		if (tmp > UINT_MAX) {
+			Py_DECREF(next);
+			Py_DECREF(iter);
+			Py_DECREF(items);
+			return NULL;
+		}
+
+		offset = tmp;
+
+		value = Py_gpiod_MapLinePropPyToC(PY_GPIOD_LINE_VALUE, val);
+		if (value < 0) {
+			Py_DECREF(next);
+			Py_DECREF(iter);
+			Py_DECREF(items);
+			return NULL;
+		}
+
+		gpiod_line_config_set_output_value_override(self->cfg,
+							    value, offset);
+		Py_DECREF(next);
+	}
+
+	Py_DECREF(items);
+
+	Py_RETURN_NONE;
+}
+
+static PyMethodDef line_config_methods[] = {
+	{
+		.ml_name = "reset",
+		.ml_meth = (PyCFunction)line_config_reset,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = line_config_reset_doc,
+	},
+	{
+		.ml_name = "set_props_default",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_config_set_props_default,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_config_set_props_default_doc,
+	},
+	{
+		.ml_name = "set_props_override",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_config_set_props_override,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_config_set_props_override_doc,
+	},
+	{
+		.ml_name = "get_props_default",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_config_get_props_default,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_config_get_props_default_doc,
+	},
+	{
+		.ml_name = "get_props_offset",
+		.ml_meth = (PyCFunction)line_config_get_props_offset,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = line_config_get_props_offset_doc,
+	},
+	{
+		.ml_name = "prop_is_overridden",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_config_prop_is_overridden,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_config_prop_is_overridden_doc,
+	},
+	{
+		.ml_name = "clear_prop_override",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_config_clear_prop_override,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_config_clear_prop_override_doc,
+	},
+	{
+		.ml_name = "set_output_values",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_config_set_output_values,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_config_set_output_values_doc,
+	},
+	{ }
+};
+
+static PyObject *str_get_defaults(PyObject *self)
+{
+	static const int enums[] = {
+		PROP_DIRECTION,
+		PROP_EDGE_DETECTION,
+		PROP_BIAS,
+		PROP_DRIVE,
+		PROP_ACTIVE_LOW,
+		PROP_DEBOUNCE_PERIOD,
+		PROP_EVENT_CLOCK,
+		PROP_OUTPUT_VALUE,
+	};
+
+	static const Py_ssize_t num_defaults = 8;
+
+	PyObject *defaults = NULL, *enum_obj, *list, *str = NULL;
+	int i;
+
+	list = PyList_New(num_defaults);
+	if (!list)
+		return NULL;
+
+	for (i = 0; i < 8; i++) {
+		enum_obj = PyCEnum_MapCToPy(self, "Property", enums[i]);
+		if (!enum_obj) {
+			Py_DECREF(list);
+			return NULL;
+		}
+
+		PyList_SET_ITEM(list, i, enum_obj);
+	}
+
+	defaults = PyObject_CallMethod(self, "get_props_default", "O", list);
+	Py_DECREF(list);
+	if (!defaults)
+		return NULL;
+
+	str = PyUnicode_FromFormat(
+		"direction=%S edge_detection=%S bias=%S drive=%S active_low=%S debounce_period=%S event_clock=%S output_value=%S",
+		PyList_GetItem(defaults, 0), PyList_GetItem(defaults, 1),
+		PyList_GetItem(defaults, 2), PyList_GetItem(defaults, 3),
+		PyList_GetItem(defaults, 4), PyList_GetItem(defaults, 5),
+		PyList_GetItem(defaults, 6), PyList_GetItem(defaults, 7));
+	Py_DECREF(defaults);
+	return str;
+}
+
+static int
+str_fill_override_strings(PyObject *self, Py_ssize_t num_overrides,
+			  const int *props, const unsigned int *offsets,
+			  PyObject *list)
+{
+	PyObject *str, *propobj, *val;
+	const char *propname;
+	unsigned int offset;
+	int prop, ret;
+	Py_ssize_t i;
+
+	for (i = 0; i < num_overrides; i++) {
+		prop = props[i];
+		offset = offsets[i];
+
+		switch (prop) {
+		case GPIOD_LINE_CONFIG_PROP_DIRECTION:
+			prop = PROP_DIRECTION;
+			propname = "direction";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_EDGE_DETECTION:
+			prop = PROP_EDGE_DETECTION;
+			propname = "edge_detection";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_BIAS:
+			prop = PROP_BIAS;
+			propname = "bias";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_DRIVE:
+			prop = PROP_DRIVE;
+			propname = "drive";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_ACTIVE_LOW:
+			prop = PROP_ACTIVE_LOW;
+			propname = "active_low";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_DEBOUNCE_PERIOD_US:
+			prop = PROP_DEBOUNCE_PERIOD;
+			propname = "debounce_period";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_EVENT_CLOCK:
+			prop = PROP_EVENT_CLOCK;
+			propname = "event_clock";
+			break;
+		case GPIOD_LINE_CONFIG_PROP_OUTPUT_VALUE:
+			prop = PROP_OUTPUT_VALUE;
+			propname = "output_value";
+			break;
+		default:
+			Py_gpiod_SetBadMappingError("LineConfig property");
+			return -1;
+		}
+
+		propobj = PyCEnum_MapCToPy(self, "Property", prop);
+		if (!propobj)
+			return -1;
+
+		val = PyObject_CallMethod(self, "get_props_offset",
+					  "IO", offset, propobj);
+		Py_DECREF(propobj);
+		if (!val)
+			return -1;
+
+		str = PyUnicode_FromFormat("%u: %s=%S", offset, propname, val);
+		Py_DECREF(val);
+		if (!str)
+			return -1;
+
+		ret = PyList_SetItem(list, i, str);
+		if (ret) {
+			Py_DECREF(str);
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+static PyObject *str_get_override_list(line_config_object *self)
+{
+	Py_ssize_t num_overrides;
+	unsigned int *offsets;
+	PyObject *overrides;
+	int *props, ret;
+
+	num_overrides = gpiod_line_config_get_num_overrides(self->cfg);
+	if (num_overrides == 0)
+		return NULL;
+
+	overrides = PyList_New(num_overrides);
+	if (!overrides)
+		return NULL;
+
+	offsets = PyMem_Calloc(num_overrides, sizeof(unsigned int));
+	if (!offsets) {
+		PyErr_NoMemory();
+		Py_DECREF(overrides);
+		return NULL;
+	}
+
+	props = PyMem_Calloc(num_overrides, sizeof(int));
+	if (!props) {
+		PyErr_NoMemory();
+		Py_DECREF(overrides);
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	gpiod_line_config_get_overrides(self->cfg, offsets, props);
+
+	ret = str_fill_override_strings((PyObject *)self, num_overrides,
+					props, offsets, overrides);
+	PyMem_Free(props);
+	PyMem_Free(offsets);
+	if (ret) {
+		Py_DECREF(overrides);
+		return NULL;
+	}
+
+	return overrides;
+}
+
+static PyObject *str_get_overrides(line_config_object *self)
+{
+	PyObject *overrides, *joined, *str, *final;
+
+	overrides = str_get_override_list(self);
+	if (!overrides)
+		return NULL;
+
+	str = PyUnicode_FromString(", ");
+	if (!str) {
+		Py_DECREF(overrides);
+		return NULL;
+	}
+
+	joined = PyObject_CallMethod(str, "join", "O", overrides);
+	Py_DECREF(overrides);
+	Py_DECREF(str);
+
+	final = PyUnicode_FromFormat("{%S}", joined);
+	Py_DECREF(joined);
+	return final;
+}
+
+static PyObject *line_config_str(PyObject *self)
+{
+	PyObject *defaults, *overrides, *str;
+
+	defaults = str_get_defaults(self);
+	if (!defaults)
+		return NULL;
+
+	overrides = str_get_overrides((line_config_object *)self);
+	if (PyErr_Occurred()) {
+		Py_DECREF(defaults);
+		return NULL;
+	}
+
+	if (overrides)
+		str = PyUnicode_FromFormat("<gpiod.LineConfig %S overrides=%S>",
+					   defaults, overrides);
+	else
+		str = PyUnicode_FromFormat("<gpiod.LineConfig %S>", defaults);
+	Py_DECREF(defaults);
+	Py_XDECREF(overrides);
+	return str;
+}
+
+PyDoc_STRVAR(line_config_type_doc,
+"Contains a set of line config options used in line requests and\n"
+"reconfiguration.");
+
+static PyTypeObject line_config_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.LineConfig",
+	.tp_basicsize = sizeof(line_config_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = line_config_type_doc,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)line_config_init,
+	.tp_finalize = (destructor)line_config_finalize,
+	.tp_getset = line_config_getset,
+	.tp_methods = line_config_methods,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_str = (reprfunc)line_config_str
+};
+
+int Py_gpiod_RegisterLineConfigType(PyObject *module)
+{
+	int ret;
+
+	ret = PyModule_AddType(module, &line_config_type);
+	if (ret)
+		return -1;
+
+	return PyCEnum_AddEnumsToType(line_config_enums, &line_config_type);
+}
+
+struct gpiod_line_config *Py_gpiod_LineConfigGetData(PyObject *obj)
+{
+	line_config_object *linecfg;
+	PyObject *type;
+
+	type = PyObject_Type(obj);
+	if (!type)
+		return NULL;
+
+	if ((PyTypeObject *)type != &line_config_type) {
+		PyErr_SetString(PyExc_TypeError,
+				"not a gpiod.LineConfig object");
+		Py_DECREF(type);
+		return NULL;
+	}
+	Py_DECREF(type);
+
+	linecfg = (line_config_object *)obj;
+
+	return linecfg->cfg;
+}
diff --git a/bindings/python/line-info.c b/bindings/python/line-info.c
new file mode 100644
index 0000000..47ed2da
--- /dev/null
+++ b/bindings/python/line-info.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_line_info *info;
+} line_info_object;
+
+static int line_info_init(PyObject *Py_UNUSED(self),
+			  PyObject *Py_UNUSED(ignored0),
+			  PyObject *Py_UNUSED(ignored1))
+{
+	PyErr_SetString(PyExc_TypeError,
+			"cannot create 'gpiod.LineInfo' instances");
+	return -1;
+}
+
+static void line_info_finalize(line_info_object *self)
+{
+	if (self->info)
+		gpiod_line_info_free(self->info);
+}
+
+PyDoc_STRVAR(line_info_offset_doc,
+"Offset of the line within the parent chip.");
+
+static PyObject *line_info_offset(line_info_object *self,
+				  void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLong(gpiod_line_info_get_offset(self->info));
+}
+
+PyDoc_STRVAR(line_info_name_doc,
+"Name of the line as represented in the kernel.");
+
+static PyObject *line_info_name(line_info_object *self,
+				void *Py_UNUSED(ignored))
+{
+	const char *name = gpiod_line_info_get_name(self->info);
+
+	if (!name)
+		Py_RETURN_NONE;
+
+	return PyUnicode_FromString(name);
+}
+
+PyDoc_STRVAR(line_info_used_doc,
+"True if the line is in use, False otherwise.");
+
+static PyObject *line_info_used(line_info_object *self,
+				void *Py_UNUSED(ignored))
+{
+	return PyBool_FromLong(gpiod_line_info_is_used(self->info));
+}
+
+PyDoc_STRVAR(line_info_consumer_doc,
+"Consumer of the line as represented in the kernel.\n"
+"\n"
+"None if the line is unused");
+
+static PyObject *line_info_consumer(line_info_object *self,
+				    void *Py_UNUSED(ignored))
+{
+	const char *consumer = gpiod_line_info_get_consumer(self->info);
+
+	if (!consumer)
+		Py_RETURN_NONE;
+
+	return PyUnicode_FromString(consumer);
+}
+
+PyDoc_STRVAR(line_info_direction_doc, "Line direction.");
+
+static PyObject *line_info_direction(line_info_object *self,
+				     void *Py_UNUSED(ignored))
+{
+	return Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_DIRECTION,
+				gpiod_line_info_get_direction(self->info));
+}
+
+PyDoc_STRVAR(line_info_active_low_doc,
+"True if the line is active-low, false otherwise.");
+
+static PyObject *line_info_active_low(line_info_object *self,
+				      void *Py_UNUSED(ignored))
+{
+	return PyBool_FromLong(gpiod_line_info_is_active_low(self->info));
+}
+
+PyDoc_STRVAR(line_info_bias_doc, "Line bias.");
+
+static PyObject *line_info_bias(line_info_object *self,
+				void *Py_UNUSED(ignored))
+{
+	return Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_BIAS,
+				gpiod_line_info_get_bias(self->info));
+}
+
+PyDoc_STRVAR(line_info_drive_doc, "Line drive.");
+
+static PyObject *line_info_drive(line_info_object *self,
+				 void *Py_UNUSED(ignored))
+{
+	return Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_DRIVE,
+				gpiod_line_info_get_drive(self->info));
+}
+
+PyDoc_STRVAR(line_info_edge_detection_doc, "Edge event detection.");
+
+static PyObject *line_info_edge_detection(line_info_object *self,
+					  void *Py_UNUSED(ignored))
+{
+	return Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_EDGE,
+			gpiod_line_info_get_edge_detection(self->info));
+}
+
+PyDoc_STRVAR(line_info_event_clock_doc, "Clock used to timestamp edge events.");
+
+static PyObject *line_info_event_clock(line_info_object *self,
+				       void *Py_UNUSED(ignored))
+{
+	return Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_CLOCK,
+			gpiod_line_info_get_event_clock(self->info));
+}
+
+PyDoc_STRVAR(line_info_debounced_doc,
+"True if the line is debounced, false otherwise.");
+
+static PyObject *line_info_debounced(line_info_object *self,
+				     void *Py_UNUSED(ignored))
+{
+	return PyBool_FromLong(gpiod_line_info_is_debounced(self->info));
+}
+
+PyDoc_STRVAR(line_info_debounce_period_doc, "Debounce period.");
+
+static PyObject *line_info_debounce_period(line_info_object *self,
+					   void *Py_UNUSED(ignored))
+{
+	return Py_gpiod_MicrosecondsToTimedelta(
+			gpiod_line_info_get_debounce_period_us(self->info));
+}
+
+static PyGetSetDef line_info_getset[] = {
+	{
+		.name = "offset",
+		.get = (getter)line_info_offset,
+		.doc = line_info_offset_doc,
+	},
+	{
+		.name = "name",
+		.get = (getter)line_info_name,
+		.doc = line_info_name_doc,
+	},
+	{
+		.name = "used",
+		.get = (getter)line_info_used,
+		.doc = line_info_used_doc,
+	},
+	{
+		.name = "consumer",
+		.get = (getter)line_info_consumer,
+		.doc = line_info_consumer_doc,
+	},
+	{
+		.name = "direction",
+		.get = (getter)line_info_direction,
+		.doc = line_info_direction_doc,
+	},
+	{
+		.name = "active_low",
+		.get = (getter)line_info_active_low,
+		.doc = line_info_active_low_doc,
+	},
+	{
+		.name = "bias",
+		.get = (getter)line_info_bias,
+		.doc = line_info_bias_doc,
+	},
+	{
+		.name = "drive",
+		.get = (getter)line_info_drive,
+		.doc = line_info_drive_doc,
+	},
+	{
+		.name = "edge_detection",
+		.get = (getter)line_info_edge_detection,
+		.doc = line_info_edge_detection_doc,
+	},
+	{
+		.name = "event_clock",
+		.get = (getter)line_info_event_clock,
+		.doc = line_info_event_clock_doc,
+	},
+	{
+		.name = "debounced",
+		.get = (getter)line_info_debounced,
+		.doc = line_info_debounced_doc,
+	},
+	{
+		.name = "debounce_period",
+		.get = (getter)line_info_debounce_period,
+		.doc = line_info_debounce_period_doc,
+	},
+	{ }
+};
+
+static PyObject *line_info_str(PyObject *self)
+{
+	PyObject *offset, *name, *used, *consumer, *direction, *active_low,
+		 *bias, *drive, *edge_detection, *event_clock, *debounced,
+		 *debounce_period, *str = NULL;
+
+	offset = PyObject_GetAttrString(self, "offset");
+	name = PyObject_GetAttrString(self, "name");
+	used = PyObject_GetAttrString(self, "used");
+	consumer = PyObject_GetAttrString(self, "consumer");
+	direction = PyObject_GetAttrString(self, "direction");
+	active_low = PyObject_GetAttrString(self, "active_low");
+	bias = PyObject_GetAttrString(self, "bias");
+	drive = PyObject_GetAttrString(self, "drive");
+	edge_detection = PyObject_GetAttrString(self, "edge_detection");
+	event_clock = PyObject_GetAttrString(self, "event_clock");
+	debounced = PyObject_GetAttrString(self, "debounced");
+	debounce_period = PyObject_GetAttrString(self, "debounce_period");
+	if (!offset || !name || !used || !consumer || !direction ||
+	    !active_low || !bias || !drive || !edge_detection || !event_clock ||
+	    !debounced || !debounce_period)
+		goto out;
+
+	str = PyUnicode_FromFormat(
+"<gpiod.LineInfo offset=%S name=\"%S\" used=%S consumer=\"%S\" direction=%S active_low=%S bias=%S drive=%S edge_detection=%S event_clock=%S debounced=%S debounce_period=%S>",
+offset, name, used, consumer, direction, active_low, bias, drive, edge_detection, event_clock, debounced, debounce_period);
+
+out:
+	Py_XDECREF(offset);
+	Py_XDECREF(name);
+	Py_XDECREF(used);
+	Py_XDECREF(consumer);
+	Py_XDECREF(direction);
+	Py_XDECREF(active_low);
+	Py_XDECREF(bias);
+	Py_XDECREF(drive);
+	Py_XDECREF(edge_detection);
+	Py_XDECREF(event_clock);
+	Py_XDECREF(debounced);
+	Py_XDECREF(debounce_period);
+	return str;
+}
+
+PyDoc_STRVAR(line_info_type_doc,
+"Line info object contains an immutable snapshot of a line's status.");
+
+static PyTypeObject line_info_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.LineInfo",
+	.tp_basicsize = sizeof(line_info_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = line_info_type_doc,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)line_info_init,
+	.tp_finalize = (destructor)line_info_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = line_info_getset,
+	.tp_str = (reprfunc)line_info_str
+};
+
+int Py_gpiod_RegisterLineInfoType(PyObject *module)
+{
+	return PyModule_AddType(module, &line_info_type);
+}
+
+PyObject *Py_gpiod_MakeLineInfo(struct gpiod_line_info *info)
+{
+	line_info_object *info_obj;
+
+	info_obj = PyObject_New(line_info_object, &line_info_type);
+	if (!info_obj)
+		return NULL;
+
+	info_obj->info = info;
+
+	return (PyObject *)info_obj;
+}
diff --git a/bindings/python/line-request.c b/bindings/python/line-request.c
new file mode 100644
index 0000000..8a3f661
--- /dev/null
+++ b/bindings/python/line-request.c
@@ -0,0 +1,803 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "module.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_line_request *request;
+} line_request_object;
+
+static int line_request_init(PyObject *Py_UNUSED(self),
+			     PyObject *Py_UNUSED(ignored0),
+			     PyObject *Py_UNUSED(ignored1))
+{
+	PyErr_SetString(PyExc_TypeError,
+			"cannot create 'gpiod.LineRequest' instances");
+	return -1;
+}
+
+static bool line_request_released(line_request_object *self)
+{
+	return !self->request;
+}
+
+static bool line_request_check_released(line_request_object *self)
+{
+	if (line_request_released(self)) {
+		Py_gpiod_SetRequestReleasedError();
+		return true;
+	}
+
+	return false;
+}
+
+static void line_request_finalize(line_request_object *self)
+{
+	if (!line_request_released(self))
+		PyObject_CallMethod((PyObject *)self, "release", "");
+}
+
+PyDoc_STRVAR(line_request_fd_doc,
+"Number of the file descriptor associated with this request.");
+
+static PyObject *
+line_request_fd(line_request_object *self, void *Py_UNUSED(ignored))
+{
+	if (line_request_check_released(self))
+		return NULL;
+
+	return PyLong_FromLong(gpiod_line_request_get_fd(self->request));
+}
+
+PyDoc_STRVAR(line_request_num_lines_doc, "Number of requested lines.");
+
+static PyObject *
+line_request_num_lines(line_request_object *self, void *Py_UNUSED(ignored))
+{
+	if (line_request_check_released(self))
+		return NULL;
+
+	return PyLong_FromSize_t(
+			gpiod_line_request_get_num_lines(self->request));
+}
+
+PyDoc_STRVAR(line_request_offsets_doc, "Offsets of the lines in the request.");
+
+static PyObject *
+line_request_offsets(line_request_object *self, void *Py_UNUSED(ignored))
+{
+	PyObject *offset_list, *offset_obj;
+	size_t num_offsets, i;
+	unsigned int *offsets;
+	int ret;
+
+	if (line_request_check_released(self))
+		return NULL;
+
+	num_offsets = gpiod_line_request_get_num_lines(self->request);
+
+	offsets = PyMem_Calloc(num_offsets, sizeof(unsigned int));
+	if (!offsets) {
+		PyErr_NoMemory();
+		return NULL;
+	}
+
+	gpiod_line_request_get_offsets(self->request, offsets);
+
+	offset_list = PyList_New(num_offsets);
+	if (!offset_list) {
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	for (i = 0; i < num_offsets; i++) {
+		offset_obj = PyLong_FromUnsignedLong(offsets[i]);
+		if (!offset_obj) {
+			Py_DECREF(offset_list);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(offset_list, i, offset_obj);
+		if (ret) {
+			Py_DECREF(offset_obj);
+			Py_DECREF(offset_list);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+	}
+
+	PyMem_Free(offsets);
+
+	return offset_list;
+}
+
+static PyGetSetDef line_request_getset[] = {
+	{
+		.name = "fd",
+		.get = (getter)line_request_fd,
+		.doc = line_request_fd_doc,
+	},
+	{
+		.name = "num_lines",
+		.get = (getter)line_request_num_lines,
+		.doc = line_request_num_lines_doc,
+	},
+	{
+		.name = "offsets",
+		.get = (getter)line_request_offsets,
+		.doc = line_request_offsets_doc,
+	},
+	{ }
+};
+
+PyDoc_STRVAR(line_request_enter_doc,
+"Controlled execution enter callback.");
+
+static PyObject *
+line_request_enter(PyObject *self, PyObject *Py_UNUSED(ignored))
+{
+	if (PyObject_Not(self)) {
+		Py_gpiod_SetRequestReleasedError();
+		return NULL;
+	}
+
+	Py_INCREF(self);
+	return self;
+}
+
+PyDoc_STRVAR(line_request_exit_doc,
+"Controlled execution exit callback.");
+
+static PyObject *line_request_exit(PyObject *self, PyObject *Py_UNUSED(ignored))
+{
+	return PyObject_CallMethod(self, "release", "");
+}
+
+PyDoc_STRVAR(line_request_release_doc,
+"Close the associated request file descriptor. The request object must no\n"
+"longer be used after this method is called.");
+
+static PyObject *
+line_request_release(line_request_object *self, PyObject *Py_UNUSED(ignored))
+{
+	if (line_request_check_released(self))
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	gpiod_line_request_release(self->request);
+	Py_END_ALLOW_THREADS;
+	self->request = NULL;
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(line_request_get_value_doc,
+"Get a single line value.\n"
+"\n"
+"Args:\n"
+"  offset\n"
+"    Offset of the line for which to read the value.");
+
+static PyObject *
+line_request_get_value(line_request_object *self,
+		       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"offset",
+		NULL
+	};
+
+	unsigned int offset;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "I", kwlist, &offset);
+	if (!ret)
+		return NULL;
+
+	return PyObject_CallMethod((PyObject *)self, "get_values", "I", offset);
+}
+
+PyDoc_STRVAR(line_request_get_values_doc,
+"Get the values of one, all or a subset of requested lines\n"
+"\n"
+"Args:\n"
+"  offsets:\n"
+"    List of offsets of the lines for which to read the values. Can also be"
+"    a single int if only the value of one line should be read.\n"
+"\n"
+"Returns:\n"
+"  If a single offset was specified, the method returns an int containing a\n"
+"  single value. If a list of offsets was specified, returns a list of values\n"
+"  with the indexes in the returned list corresponding with ones in the\n"
+"  offset list.");
+
+static PyObject *
+line_request_get_values(line_request_object *self,
+			PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"offsets",
+		NULL,
+	};
+	PyObject *offsets_obj = NULL, *values_obj, *val, *offset;
+	Py_ssize_t num_values, i;
+	unsigned int *offsets;
+	int ret, *values;
+
+	if (line_request_check_released(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|O", kwlist,
+					  &offsets_obj);
+	if (!ret)
+		return NULL;
+
+	if (!offsets_obj) {
+		num_values = gpiod_line_request_get_num_lines(self->request);
+	} else if (PyLong_Check(offsets_obj)) {
+		num_values = 1;
+	} else if (PyList_Check(offsets_obj)) {
+		num_values = PyList_Size(offsets_obj);
+		if (num_values < 0)
+			return NULL;
+	} else {
+		PyErr_SetString(PyExc_TypeError,
+				"offsets must be either a single integer or a list of integers");
+		return NULL;
+	}
+
+	offsets = PyMem_Calloc(num_values, sizeof(unsigned int));
+	if (!offsets)
+		return NULL;
+
+	values = PyMem_Calloc(num_values, sizeof(int));
+	if (!values) {
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	if (!offsets_obj) {
+		gpiod_line_request_get_offsets(self->request, offsets);
+	} else if (num_values == 1) {
+		offsets[0] = Py_gpiod_PyLongAsUnsignedInt(offsets_obj);
+		if (PyErr_Occurred()) {
+			PyMem_Free(values);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+	} else {
+		for (i = 0; i < num_values; i++) {
+			offset = PyList_GetItem(offsets_obj, i);
+			if (!offset) {
+				PyMem_Free(values);
+				PyMem_Free(offsets);
+				return NULL;
+			}
+
+			offsets[i] = Py_gpiod_PyLongAsUnsignedInt(offset);
+			if (PyErr_Occurred()){
+				PyMem_Free(values);
+				PyMem_Free(offsets);
+				return NULL;
+			}
+		}
+	}
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_get_values_subset(self->request, num_values,
+						   offsets, values);
+	Py_END_ALLOW_THREADS;
+	PyMem_Free(offsets);
+	if (ret) {
+		PyMem_Free(values);
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	if (num_values == 1) {
+		values_obj = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_VALUE,
+						       values[0]);
+		if (!values_obj) {
+			PyMem_Free(values);
+			return NULL;
+		}
+	} else {
+		values_obj = PyList_New(num_values);
+		if (!values_obj) {
+			PyMem_Free(values);
+			return NULL;
+		}
+
+		for (i = 0; i < num_values; i++) {
+			val = Py_gpiod_MapLinePropCToPy(PY_GPIOD_LINE_VALUE,
+							values[i]);
+			if (!val) {
+				Py_DECREF(values_obj);
+				PyMem_Free(values);
+				return NULL;
+			}
+
+			ret = PyList_SetItem(values_obj, i, val);
+			if (ret) {
+				Py_DECREF(val);
+				Py_DECREF(values_obj);
+				PyMem_Free(values);
+				return NULL;
+			}
+		}
+	}
+
+	PyMem_Free(values);
+
+	return values_obj;
+}
+
+PyDoc_STRVAR(line_request_set_value_doc,
+"Set value of a single line.\n"
+"\n"
+"Args:\n"
+"  offset:\n"
+"    Offset of the line to set.\n"
+"  value:\n"
+"    New value.");
+
+static PyObject *
+line_request_set_value(line_request_object *self,
+		       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"offset",
+		"value",
+		NULL
+	};
+
+	PyObject *offset, *value, *dict, *result;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "OO", kwlist,
+					  &offset, &value);
+	if (!ret)
+		return NULL;
+
+	dict = PyDict_New();
+	if (!dict)
+		return NULL;
+
+	ret = PyDict_SetItem(dict, offset, value);
+	if (ret)
+		return NULL;
+
+	result = PyObject_CallMethod((PyObject *)self, "set_values", "O", dict);
+	Py_DECREF(dict);
+	return result;
+}
+
+PyDoc_STRVAR(line_request_set_values_doc,
+"Set the values of all or a subset of requested lines\n"
+"\n"
+"Args:\n"
+"  values:\n"
+"    Can be a dictionary mapping a number of specific offsets to values or a\n"
+"    list of values in which case it's used to set all requested lines.");
+
+static PyObject *
+line_request_set_values(line_request_object *self,
+			PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"values",
+		NULL
+	};
+
+	PyObject *valobj, *off, *val, *iter;
+	Py_ssize_t num_values, pos = 0;
+	unsigned int *offsets;
+	int *values;
+	int ret;
+
+	if (line_request_check_released(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O", kwlist, &valobj);
+	if (!ret)
+		return NULL;
+
+	num_values = PyObject_Size(valobj);
+	if (num_values < 0)
+		return NULL;
+
+	values = PyMem_Calloc(num_values, sizeof(int));
+	if (!values) {
+		PyErr_NoMemory();
+		return NULL;
+	}
+
+	if (PyDict_Check(valobj)) {
+		offsets = PyMem_Calloc(num_values, sizeof(unsigned int));
+		if (!offsets) {
+			PyErr_NoMemory();
+			return NULL;
+		}
+
+		while (PyDict_Next(valobj, &pos, &off, &val)) {
+			offsets[pos - 1] = Py_gpiod_PyLongAsUnsignedInt(off);
+			if (PyErr_Occurred()) {
+				PyMem_Free(offsets);
+				PyMem_Free(values);
+				PyErr_NoMemory();
+				return NULL;
+			}
+
+			values[pos - 1] = Py_gpiod_MapLinePropPyToC(
+						PY_GPIOD_LINE_VALUE, val);
+			if (values[pos - 1] < 0) {
+				PyMem_Free(offsets);
+				PyMem_Free(values);
+				PyErr_NoMemory();
+				return NULL;
+			}
+		}
+
+		Py_BEGIN_ALLOW_THREADS;
+		ret = gpiod_line_request_set_values_subset(self->request,
+							   num_values,
+							   offsets, values);
+		Py_END_ALLOW_THREADS;
+		PyMem_Free(offsets);
+	} else if (PyList_Check(valobj)) {
+		if ((size_t)num_values != gpiod_line_request_get_num_lines(
+							self->request)) {
+			PyErr_SetString(PyExc_ValueError,
+					"list of values must be the same size as the number of requested lines");
+			PyMem_Free(values);
+			return NULL;
+		}
+
+		iter = PyObject_GetIter(valobj);
+		if (!iter) {
+			PyMem_Free(values);
+			return NULL;
+		}
+
+		for (pos = 0;; pos++) {
+			val = PyIter_Next(iter);
+			if (!val) {
+				Py_DECREF(iter);
+				break;
+			}
+
+			values[pos] = Py_gpiod_MapLinePropPyToC(
+						PY_GPIOD_LINE_VALUE, val);
+			Py_DECREF(val);
+			if (values[pos] < 0) {
+				PyMem_Free(values);
+				return NULL;
+			}
+		}
+
+		Py_BEGIN_ALLOW_THREADS;
+		ret = gpiod_line_request_set_values(self->request, values);
+		Py_END_ALLOW_THREADS;
+	}
+
+	PyMem_Free(values);
+	if (ret) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(line_request_reconfigure_lines_doc,
+"Update the configuration of lines associated with a line request.\n"
+"\n"
+"Args:\n"
+"  line_cfg:\n"
+"    gpiod.LineConfig containing new configuration.");
+
+static PyObject *
+line_request_reconfigure_lines(line_request_object *self,
+			       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"line_cfg",
+		NULL
+	};
+
+	struct gpiod_line_config *cfg;
+	PyObject *cfgobj;
+	int ret;
+
+	if (line_request_check_released(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O", kwlist, &cfgobj);
+	if (!ret)
+		return NULL;
+
+	cfg = Py_gpiod_LineConfigGetData(cfgobj);
+	if (!cfg)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_reconfigure_lines(self->request, cfg);
+	Py_END_ALLOW_THREADS;
+	if (ret) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(line_request_wait_edge_event_doc,
+"Wait for edge events on any of the requested lines.\n"
+"\n"
+"Args:\n"
+"  timeout:\n"
+"    datetime.timedelta containing the max time to wait for events.\n"
+"\n"
+"Returns:\n"
+"  True if there are events ready to be read, False if the wait timed out.");
+
+static PyObject *
+line_request_wait_edge_event(line_request_object *self,
+			     PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"timeout",
+		NULL
+	};
+
+	int64_t timeout_us = 0, timeout_ns;
+	PyObject *timedelta = NULL;
+	int ret;
+
+	if (line_request_check_released(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|O", kwlist,
+					  &timedelta);
+	if (!ret)
+		return NULL;
+
+	if (timedelta) {
+		timeout_us = Py_gpiod_TimedeltaToMicroseconds(timedelta);
+		if (PyErr_Occurred())
+			return NULL;
+	}
+
+	timeout_ns = timeout_us * 1000;
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_wait_edge_event(self->request, timeout_ns);
+	Py_END_ALLOW_THREADS;
+	if (ret < 0) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	return PyBool_FromLong(ret);
+}
+
+PyDoc_STRVAR(line_request_read_edge_event_doc,
+"Read a number of edge events from a line request.\n"
+"\n"
+"Args:\n"
+"  buffer:\n"
+"    gpiod.EdgeEventBuffer into which events will be read.\n"
+"  max_events:\n"
+"    Maximum number of events to read.\n"
+"\n"
+"Returns:\n"
+"  If an existing gpiod.EdgeEventBuffer object was passed to the method as\n"
+"  the 'buffer' argument, it returns the number of events stored in it. If\n"
+"  no buffer was passed then this method creates one (with the capacity set\n"
+"  to 'max_events' or 64 if not specified), reads the events into it and\n"
+"  returns it.\n"
+"\n"
+"Note:\n"
+"  This method may block if there are no events in the queue.");
+
+static PyObject *
+line_request_read_edge_event(line_request_object *self,
+			     PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"buffer",
+		"max_events",
+		NULL
+	};
+
+	struct gpiod_edge_event_buffer *buffer;
+	PyObject *bufobj = NULL;
+	Py_ssize_t max_events;
+	int ret;
+
+	if (line_request_check_released(self))
+		return NULL;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|On", kwlist,
+					  &bufobj, &max_events);
+	if (!ret)
+		return NULL;
+
+	if (bufobj) {
+		buffer = Py_gpiod_EdgeEventBufferGetData(bufobj);
+		if (!buffer)
+			return NULL;
+
+		if (!max_events)
+			max_events = gpiod_edge_event_buffer_get_capacity(
+									buffer);
+	} else {
+		if (!max_events)
+			max_events = 64;
+
+		buffer = gpiod_edge_event_buffer_new(max_events ?: 64);
+		if (!buffer) {
+			Py_gpiod_SetErrFromErrno();
+			return NULL;
+		}
+	}
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_read_edge_event(self->request,
+						 buffer, max_events);
+	Py_END_ALLOW_THREADS;
+	if (ret < 0) {
+		if (!bufobj)
+			gpiod_edge_event_buffer_free(buffer);
+
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	if (bufobj)
+		return PyLong_FromLong(ret);
+
+	bufobj = Py_gpiod_MakeEdgeEventBuffer(buffer);
+	if (!bufobj)
+		gpiod_edge_event_buffer_free(buffer);
+	return bufobj;
+}
+
+static PyMethodDef line_request_methods[] = {
+	{
+		.ml_name = "__enter__",
+		.ml_meth = (PyCFunction)line_request_enter,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = line_request_enter_doc,
+	},
+	{
+		.ml_name = "__exit__",
+		.ml_meth = (PyCFunction)line_request_exit,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = line_request_exit_doc,
+	},
+	{
+		.ml_name = "release",
+		.ml_meth = (PyCFunction)line_request_release,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = line_request_release_doc,
+	},
+	{
+		.ml_name = "get_value",
+		.ml_meth = (PyCFunction)(void(*)(void))line_request_get_value,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_get_value_doc,
+	},
+	{
+		.ml_name = "get_values",
+		.ml_meth = (PyCFunction)(void(*)(void))line_request_get_values,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_get_values_doc,
+	},
+	{
+		.ml_name = "set_value",
+		.ml_meth = (PyCFunction)(void(*)(void))line_request_set_value,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_set_value_doc,
+	},
+	{
+		.ml_name = "set_values",
+		.ml_meth = (PyCFunction)(void(*)(void))line_request_set_values,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_set_values_doc,
+	},
+	{
+		.ml_name = "reconfigure_lines",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_request_reconfigure_lines,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_reconfigure_lines_doc,
+	},
+	{
+		.ml_name = "wait_edge_event",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				line_request_wait_edge_event,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_wait_edge_event_doc,
+	},
+	{
+		.ml_name = "read_edge_event",
+		.ml_meth = (PyCFunction)(void(*)(void))
+					line_request_read_edge_event,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = line_request_read_edge_event_doc,
+	},
+	{ }
+};
+
+static PyObject *line_request_str(PyObject *self)
+{
+	PyObject *num_lines, *offsets, *fd, *str = NULL;
+
+	if (PyObject_Not(self))
+		return PyUnicode_FromString("<gpiod.LineRequest RELEASED>");
+
+	num_lines = PyObject_GetAttrString(self, "num_lines");
+	offsets = PyObject_GetAttrString(self, "offsets");
+	fd = PyObject_GetAttrString(self, "fd");
+	if (!num_lines || !offsets || !fd)
+		goto out;
+
+	str = PyUnicode_FromFormat(
+			"<gpiod.LineRequest num_lines=%S offsets=%S fd=%S>",
+			num_lines, offsets, fd);
+
+out:
+	Py_XDECREF(num_lines);
+	Py_XDECREF(offsets);
+	Py_XDECREF(fd);
+	return str;
+}
+
+static int line_request_bool(line_request_object *self)
+{
+	return !line_request_released(self);
+}
+
+static PyNumberMethods line_request_number_methods = {
+	.nb_bool = (inquiry)line_request_bool,
+};
+
+PyDoc_STRVAR(line_request_doc,
+"Stores the context of a set of requested GPIO lines.");
+
+static PyTypeObject line_request_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.LineRequest",
+	.tp_basicsize = sizeof(line_request_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = line_request_doc,
+	.tp_as_number = &line_request_number_methods,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)line_request_init,
+	.tp_finalize = (destructor)line_request_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = line_request_getset,
+	.tp_methods = line_request_methods,
+	.tp_str = (reprfunc)line_request_str
+};
+
+int Py_gpiod_RegisterLineRequestType(PyObject *module)
+{
+	return PyModule_AddType(module, &line_request_type);
+}
+
+PyObject *Py_gpiod_MakeLineRequest(struct gpiod_line_request *req)
+{
+	line_request_object *req_obj;
+
+	req_obj = PyObject_New(line_request_object, &line_request_type);
+	if (!req_obj)
+		return NULL;
+
+	req_obj->request = req;
+
+	return (PyObject *)req_obj;
+}
diff --git a/bindings/python/line.c b/bindings/python/line.c
new file mode 100644
index 0000000..7003ab0
--- /dev/null
+++ b/bindings/python/line.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "enum/enum.h"
+#include "module.h"
+
+static const PyCEnum_EnumVal value_enum_vals[] = {
+	{
+		.name = "INACTIVE",
+		.value = GPIOD_LINE_VALUE_INACTIVE
+	},
+	{
+		.name = "ACTIVE",
+		.value = GPIOD_LINE_VALUE_ACTIVE
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal direction_enum_vals[] = {
+	{
+		.name = "AS_IS",
+		.value = GPIOD_LINE_DIRECTION_AS_IS
+	},
+	{
+		.name = "INPUT",
+		.value = GPIOD_LINE_DIRECTION_INPUT
+	},
+	{
+		.name = "OUTPUT",
+		.value = GPIOD_LINE_DIRECTION_OUTPUT
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal bias_enum_vals[] = {
+	{
+		.name = "AS_IS",
+		.value = GPIOD_LINE_BIAS_AS_IS
+	},
+	{
+		.name = "UNKNOWN",
+		.value = GPIOD_LINE_BIAS_UNKNOWN
+	},
+	{
+		.name = "DISABLED",
+		.value = GPIOD_LINE_BIAS_DISABLED
+	},
+	{
+		.name = "PULL_UP",
+		.value = GPIOD_LINE_BIAS_PULL_UP
+	},
+	{
+		.name = "PULL_DOWN",
+		.value = GPIOD_LINE_BIAS_PULL_DOWN
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal drive_enum_vals[] = {
+	{
+		.name = "PUSH_PULL",
+		.value = GPIOD_LINE_DRIVE_PUSH_PULL
+	},
+	{
+		.name = "OPEN_DRAIN",
+		.value = GPIOD_LINE_DRIVE_OPEN_DRAIN
+	},
+	{
+		.name = "OPEN_SOURCE",
+		.value = GPIOD_LINE_DRIVE_OPEN_SOURCE
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal edge_enum_vals[] = {
+	{
+		.name = "NONE",
+		.value = GPIOD_LINE_EDGE_NONE
+	},
+	{
+		.name = "RISING",
+		.value = GPIOD_LINE_EDGE_RISING
+	},
+	{
+		.name = "FALLING",
+		.value = GPIOD_LINE_EDGE_FALLING
+	},
+	{
+		.name = "BOTH",
+		.value = GPIOD_LINE_EDGE_BOTH
+	},
+	{ }
+};
+
+static const PyCEnum_EnumVal event_clock_enum_vals[] = {
+	{
+		.name = "MONOTONIC",
+		.value = GPIOD_LINE_EVENT_CLOCK_MONOTONIC
+	},
+	{
+		.name = "REALTIME",
+		.value = GPIOD_LINE_EVENT_CLOCK_REALTIME
+	},
+	{ }
+};
+
+static const PyCEnum_EnumDef line_enums[] = {
+	{
+		.name = "Value",
+		.values = value_enum_vals
+	},
+	{
+		.name = "Direction",
+		.values = direction_enum_vals
+	},
+	{
+		.name = "Bias",
+		.values = bias_enum_vals
+	},
+	{
+		.name = "Drive",
+		.values = drive_enum_vals
+	},
+	{
+		.name = "Edge",
+		.values = edge_enum_vals
+	},
+	{
+		.name = "Clock",
+		.values = event_clock_enum_vals
+	},
+	{ }
+};
+
+PyDoc_STRVAR(line_type_doc,
+"Container for common definitions related to GPIO lines.\n");
+
+static PyTypeObject line_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.Line",
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = line_type_doc
+};
+
+int Py_gpiod_RegisterLineType(PyObject *module)
+{
+	int ret;
+
+	ret = PyType_Ready(&line_type);
+	if (ret)
+		return -1;
+
+	Py_INCREF(&line_type);
+	ret = PyModule_AddObject(module, "Line", (PyObject *)&line_type);
+	if (ret) {
+		Py_DECREF(&line_type);
+		return -1;
+	}
+
+	ret = PyCEnum_AddEnumsToType(line_enums, &line_type);
+	if (ret) {
+		Py_DECREF(&line_type);
+		return -1;
+	}
+
+	return 0;
+}
+
+static const char *get_enum_name(int prop)
+{
+	switch (prop) {
+	case PY_GPIOD_LINE_VALUE:
+		return "Value";
+	case PY_GPIOD_LINE_DIRECTION:
+		return "Direction";
+	case PY_GPIOD_LINE_EDGE:
+		return "Edge";
+	case PY_GPIOD_LINE_BIAS:
+		return "Bias";
+	case PY_GPIOD_LINE_DRIVE:
+		return "Drive";
+	case PY_GPIOD_LINE_CLOCK:
+		return "Clock";
+	}
+
+	PyErr_SetString(PyExc_ValueError, "unsupported line property");
+	return NULL;
+}
+
+static PyObject *get_line_type(void)
+{
+	PyObject *mod, *dict, *type;
+
+	mod = Py_gpiod_GetModule();
+	if (!mod)
+		return NULL;
+
+	dict = PyModule_GetDict(mod);
+	if (!dict)
+		return NULL;
+
+	type = PyDict_GetItemString(dict, "Line");
+	if (!type)
+		return NULL;
+
+	return type;
+}
+
+PyObject *Py_gpiod_MapLinePropCToPy(int prop, int value)
+{
+	const char *enum_name;
+	PyObject *type;
+
+	enum_name = get_enum_name(prop);
+	if (!enum_name)
+		return NULL;
+
+	type = get_line_type();
+	if (!type)
+		return NULL;
+
+	return PyCEnum_MapCToPy(type, enum_name, value);
+}
+
+int Py_gpiod_MapLinePropPyToC(int prop, PyObject *value)
+{
+	const char *enum_name;
+	PyObject *type;
+
+	enum_name = get_enum_name(prop);
+	if (!enum_name)
+		return -1;
+
+	type = get_line_type();
+	if (!type)
+		return -1;
+
+	return PyCEnum_MapPyToC(type, enum_name, value);
+}
diff --git a/bindings/python/module.c b/bindings/python/module.c
new file mode 100644
index 0000000..67a380e
--- /dev/null
+++ b/bindings/python/module.c
@@ -0,0 +1,557 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <errno.h>
+#include <limits.h>
+
+#include "module.h"
+
+/* Generic dealloc callback for all gpiod objects. */
+void Py_gpiod_dealloc(PyObject *self)
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
+PyDoc_STRVAR(module_is_gpiochip_device_doc,
+"Check if the file pointed to by path is a GPIO chip character device.\n"
+"\n"
+"Args:\n"
+"  path\n"
+"    Path to the file that should be checked.\n"
+"\n"
+"Returns:\n"
+"  Returns true if so, False otherwise.");
+
+static PyObject *
+module_is_gpiochip_device(PyObject *Py_UNUSED(self),
+			  PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"path",
+		NULL
+	};
+
+	const char *path;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "s", kwlist, &path);
+	if (!ret)
+		return NULL;
+
+	return PyBool_FromLong(gpiod_is_gpiochip_device(path));
+}
+
+PyDoc_STRVAR(module_request_lines_doc,
+"Open a GPIO chip indicated by path, request a set of lines for exclusive\n"
+"usage and close the chip. This method allows the caller to directly pass\n"
+"line configuration defaults without creating a new gpiod.LineConfig object.\n"
+"If the caller passes an existing gpiod.LineConfig along with additional\n"
+"defaults, the former take precedence over the defaults already set in said\n"
+"config object.\n"
+"\n"
+"Args:\n"
+"  path:\n"
+"    Path to the GPIO chip character device.\n"
+"  req_cfg:\n"
+"    Request config object.\n"
+"  line_cfg:\n"
+"    Line config object.\n"
+"  lines:\n"
+"    List of lines to request. Each line can be described by a string (in\n"
+"    which case it'll be interpreted as the line's name) or an integer\n"
+"    (representing the line's offset).\n"
+"  direction:\n"
+"    Default direction.\n"
+"  bias:\n"
+"    Default bias.\n"
+"  drive:\n"
+"    Default drive.\n"
+"  active_low:\n"
+"    Default active-low setting.\n"
+"  debounce_period:\n"
+"    Default debounce period.\n"
+"  event_clock:\n"
+"    Default event clock.\n"
+"  output_value:\n"
+"    Default output value.\n"
+"  output_values:\n"
+"    Dictionary containing offset->value mappings.\n"
+"\n"
+"Returns:\n"
+"  New gpiod.LineRequest object.");
+
+static void close_chip(PyObject *chip)
+{
+	PyObject *errtype, *errvalue, *errtraceback;
+
+	PyErr_Fetch(&errtype, &errvalue, &errtraceback);
+	PyObject_CallMethod(chip, "close", NULL);
+	PyErr_Restore(errtype, errvalue, errtraceback);
+	Py_DECREF(chip);
+}
+
+static PyObject *make_chip(PyObject *dict, PyObject *path)
+{
+	PyObject *type, *chip;
+
+	type = PyDict_GetItemString(dict, "Chip");
+	if (!type)
+		return NULL;
+
+	chip = PyObject_CallOneArg(type, path);
+	if (!chip)
+		return NULL;
+
+	return chip;
+}
+
+static PyObject *make_cfg(PyObject *dict, PyObject *cfg, const char *name)
+{
+	PyObject *type;
+
+	if (!cfg) {
+		type = PyDict_GetItemString(dict, name);
+		if (!type)
+			return NULL;
+
+		cfg = PyObject_CallNoArgs(type);
+		if (!cfg)
+			return NULL;
+	} else {
+		Py_INCREF(cfg);
+	}
+
+	return cfg;
+}
+
+static int set_lines(PyObject *req_cfg, PyObject *chip, PyObject *lines)
+{
+	PyObject *offsets, *line, *off;
+	Py_ssize_t len, i;
+	int ret;
+
+	len = PyObject_Size(lines);
+	if (len < 0)
+		return -1;
+
+	offsets = PyList_New(len);
+	if (!offsets)
+		return -1;
+
+	for (i = 0; i < len; i++) {
+		line = PyList_GetItem(lines, i);
+		if (!line) {
+			Py_DECREF(offsets);
+			return -1;
+		}
+
+		if (PyUnicode_Check(line)) {
+			off = PyObject_CallMethod(chip,
+					"get_line_offset_from_name", "O", line);
+			if (!off) {
+				Py_DECREF(offsets);
+				return -1;
+			}
+		} else {
+			off = line;
+			Py_INCREF(off);
+		}
+
+		ret = PyList_SetItem(offsets, i, off);
+		Py_DECREF(off);
+		if (ret) {
+			Py_DECREF(offsets);
+			return -1;
+		}
+	}
+
+	ret = PyObject_SetAttrString(req_cfg, "offsets", offsets);
+	Py_DECREF(offsets);
+	return ret;
+}
+
+static PyObject *
+make_req_cfg(PyObject *dict, PyObject *chip, PyObject *req_cfg, PyObject *lines)
+{
+	int ret;
+
+	req_cfg = make_cfg(dict, req_cfg, "RequestConfig");
+	if (!req_cfg)
+		return NULL;
+
+	if (lines) {
+		ret = set_lines(req_cfg, chip, lines);
+		if (ret) {
+			Py_DECREF(req_cfg);
+			return NULL;
+		}
+	}
+
+	return req_cfg;
+}
+
+static PyObject *
+make_line_cfg_kwargs(PyObject *direction, PyObject *edge_detection,
+		     PyObject *bias, PyObject *drive, PyObject *active_low,
+		     PyObject *debounce_period, PyObject *event_clock,
+		     PyObject *output_value, PyObject *output_values)
+{
+	static const char *const keys[] = {
+		"direction",
+		"edge_detection",
+		"bias",
+		"drive",
+		"active_low",
+		"debounce_period",
+		"event_clock",
+		"output_value",
+		"output_values",
+	};
+
+	PyObject *kwargs, *vals[9];
+	int ret, i;
+
+	vals[0] = direction;
+	vals[1] = edge_detection;
+	vals[2] = bias;
+	vals[3] = drive;
+	vals[4] = active_low;
+	vals[5] = debounce_period;
+	vals[6] = event_clock;
+	vals[7] = output_value;
+	vals[8] = output_values;
+
+	if (memcmp(vals, "\0\0\0\0\0\0\0\0\0", 9) == 0)
+		return NULL;
+
+	kwargs = PyDict_New();
+	if (!kwargs)
+		return NULL;
+
+	for (i = 0; i < 9; i ++) {
+		if (!vals[i])
+			continue;
+
+		ret = PyDict_SetItemString(kwargs, keys[i], vals[i]);
+		if (ret) {
+			Py_DECREF(kwargs);
+			return NULL;
+		}
+	}
+
+	return kwargs;
+}
+
+static PyObject *
+make_line_cfg(PyObject *dict, PyObject *line_cfg, PyObject *line_cfg_kwargs)
+{
+	PyObject *args, *method, *res;
+
+	line_cfg = make_cfg(dict, line_cfg, "LineConfig");
+	if (!line_cfg)
+		return NULL;
+
+	args = PyTuple_New(0);
+	if (!args) {
+		Py_DECREF(line_cfg);
+		return NULL;
+	}
+
+	method = PyObject_GetAttrString(line_cfg, "set_props_default");
+	if (!method) {
+		Py_DECREF(line_cfg);
+		Py_DECREF(args);
+		return NULL;
+	}
+
+	res = PyObject_Call(method, args, line_cfg_kwargs);
+	Py_DECREF(args);
+	Py_DECREF(method);
+	if (!Py_IsNone(res)) {
+		Py_DECREF(res);
+		return NULL;
+	}
+
+	Py_DECREF(res);
+
+	return line_cfg;
+}
+
+static PyObject *
+module_request_lines(PyObject *self, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"path",
+		"req_cfg",
+		"line_cfg",
+		"lines",
+		"direction",
+		"edge_detection",
+		"bias",
+		"drive",
+		"active_low",
+		"debounce_period",
+		"event_clock",
+		"output_value",
+		"output_values",
+		NULL
+	};
+
+	PyObject *path, *req_cfg = NULL, *line_cfg = NULL, *lines = NULL,
+		 *direction = NULL, *edge_detection = NULL, *bias = NULL,
+		 *drive = NULL, *active_low = NULL, *debounce_period = NULL,
+		 *event_clock = NULL, *output_value = NULL,
+		 *output_values = NULL, *dict, *chip, *req, *line_cfg_kwargs;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "O|OO$OOOOOOOOOO",
+					  kwlist, &path, &req_cfg, &line_cfg,
+					  &lines, &direction, &edge_detection,
+					  &bias, &drive, &active_low,
+					  &debounce_period, &event_clock,
+					  &output_value, &output_values);
+	if (!ret)
+		return NULL;
+
+	dict = PyModule_GetDict(self);
+	if (!dict)
+		return NULL;
+
+	chip = make_chip(dict, path);
+	if (!chip)
+		return NULL;
+
+	req_cfg = make_req_cfg(dict, chip, req_cfg, lines);
+	if (!req_cfg) {
+		close_chip(chip);
+		return NULL;
+	}
+
+	line_cfg_kwargs = make_line_cfg_kwargs(direction, edge_detection, bias,
+					       drive, active_low,
+					       debounce_period, event_clock,
+					       output_value, output_values);
+	if (PyErr_Occurred()) {
+		close_chip(chip);
+		Py_DECREF(req_cfg);
+		return NULL;
+	}
+
+	line_cfg = make_line_cfg(dict, line_cfg, line_cfg_kwargs);
+	Py_XDECREF(line_cfg_kwargs);
+	if (!line_cfg) {
+		close_chip(chip);
+		Py_DECREF(req_cfg);
+		return NULL;
+	}
+
+	req = PyObject_CallMethod(chip, "request_lines",
+				  "OO", req_cfg, line_cfg);
+	Py_DECREF(req_cfg);
+	Py_DECREF(line_cfg);
+	close_chip(chip);
+	return req;
+}
+
+static PyMethodDef module_methods[] = {
+	{
+		.ml_name = "is_gpiochip_device",
+		.ml_meth = (PyCFunction)(void(*)(void))
+				module_is_gpiochip_device,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = module_is_gpiochip_device_doc,
+	},
+	{
+		.ml_name = "request_lines",
+		.ml_meth = (PyCFunction)(void(*)(void))module_request_lines,
+		.ml_flags = METH_VARARGS | METH_KEYWORDS,
+		.ml_doc = module_request_lines_doc,
+	},
+	{ }
+};
+
+struct module_state {
+	PyObject *timedelta_type;
+};
+
+static void free_module_state(void *mod)
+{
+	struct module_state *state = PyModule_GetState((PyObject *)mod);
+
+	Py_XDECREF(state->timedelta_type);
+}
+
+PyDoc_STRVAR(module_doc,
+"Python bindings for libgpiod.\n\
+\n\
+This module wraps the native C API of libgpiod in a set of python classes.");
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "gpiod",
+	.m_doc = module_doc,
+	.m_size = sizeof(struct module_state),
+	.m_free = free_module_state,
+	.m_methods = module_methods,
+};
+
+typedef int (*register_func)(PyObject *);
+
+static const register_func register_type_funcs[] = {
+	Py_gpiod_RegisterChipType,
+	Py_gpiod_RegisterChipInfoType,
+	Py_gpiod_RegisterEdgeEventType,
+	Py_gpiod_RegisterEdgeEventBufferType,
+	Py_gpiod_RegisterExceptionTypes,
+	Py_gpiod_RegisterInfoEventType,
+	Py_gpiod_RegisterLineConfigType,
+	Py_gpiod_RegisterLineType,
+	Py_gpiod_RegisterLineInfoType,
+	Py_gpiod_RegisterLineRequestType,
+	Py_gpiod_RegisterRequestConfigType,
+};
+
+static int init_timedelta_type(struct module_state *state)
+{
+	PyObject *datetime;
+
+	datetime = PyImport_ImportModule("datetime");
+	if (!datetime)
+		return -1;
+
+	state->timedelta_type = PyObject_GetAttrString(datetime, "timedelta");
+	Py_DECREF(datetime);
+	if (!state->timedelta_type)
+		return -1;
+
+	return 0;
+}
+
+PyMODINIT_FUNC PyInit_gpiod(void)
+{
+	struct module_state *state;
+	size_t num_funcs, i;
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
+	ret = init_timedelta_type(state);
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	num_funcs = sizeof(register_type_funcs) / sizeof(*register_type_funcs);
+	for (i = 0; i < num_funcs; i++) {
+		ret = register_type_funcs[i](module);
+		if (ret) {
+			Py_DECREF(module);
+			return NULL;
+		}
+	}
+
+	ret = PyModule_AddStringConstant(module, "__version__",
+					 gpiod_version_string());
+	if (ret < 0) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	return module;
+}
+
+PyObject *Py_gpiod_GetModule(void)
+{
+	return PyState_FindModule(&module_def);
+}
+
+PyObject *Py_gpiod_MicrosecondsToTimedelta(unsigned long us)
+{
+	PyObject *module, *timedelta, *args, *kwargs, *val;
+	struct module_state *state;
+	int ret;
+
+	module = PyState_FindModule(&module_def);
+	if (!module)
+		return NULL;
+
+	state = PyModule_GetState(module);
+
+	kwargs = PyDict_New();
+	if (!kwargs)
+		return NULL;
+
+	val = PyLong_FromUnsignedLong(us);
+	if (!val) {
+		Py_DECREF(kwargs);
+		return NULL;
+	}
+
+	ret = PyDict_SetItemString(kwargs, "microseconds", val);
+	Py_DECREF(val);
+	if (ret) {
+		Py_DECREF(kwargs);
+		return NULL;
+	}
+
+	args = PyTuple_New(0);
+	if (!args) {
+		Py_DECREF(kwargs);
+		return NULL;
+	}
+
+	timedelta = PyObject_Call(state->timedelta_type, args, kwargs);
+	Py_DECREF(args);
+	Py_DECREF(kwargs);
+	return timedelta;
+}
+
+unsigned long Py_gpiod_TimedeltaToMicroseconds(PyObject *timedelta)
+{
+	PyObject *total_seconds;
+	double val;
+
+	total_seconds = PyObject_CallMethod(timedelta, "total_seconds", NULL);
+	if (!total_seconds)
+		return 0;
+
+	val = PyFloat_AsDouble(total_seconds);
+	Py_DECREF(total_seconds);
+	if (PyErr_Occurred())
+		return 0;
+
+	return val * 1000000;
+}
+
+unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong)
+{
+	unsigned long tmp;
+
+	tmp = PyLong_AsUnsignedLong(pylong);
+	if (PyErr_Occurred())
+		return 0;
+
+	if (tmp > UINT_MAX) {
+		PyErr_SetString(PyExc_ValueError, "value exceeding UINT_MAX");
+		return 0;
+	}
+
+	return tmp;
+}
diff --git a/bindings/python/module.h b/bindings/python/module.h
new file mode 100644
index 0000000..f2aa12c
--- /dev/null
+++ b/bindings/python/module.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __LIBGPIOD_PYTHON_MODULE_H__
+#define __LIBGPIOD_PYTHON_MODULE_H__
+
+#include <gpiod.h>
+#include <Python.h>
+
+PyObject *Py_gpiod_GetModule(void);
+void Py_gpiod_dealloc(PyObject *self);
+PyObject *Py_gpiod_MicrosecondsToTimedelta(unsigned long us);
+unsigned long Py_gpiod_TimedeltaToMicroseconds(PyObject *timedelta);
+unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
+
+enum {
+	PY_GPIOD_LINE_VALUE = 1,
+	PY_GPIOD_LINE_DIRECTION,
+	PY_GPIOD_LINE_EDGE,
+	PY_GPIOD_LINE_BIAS,
+	PY_GPIOD_LINE_DRIVE,
+	PY_GPIOD_LINE_CLOCK,
+};
+
+PyObject *Py_gpiod_MapLinePropCToPy(int prop, int value);
+int Py_gpiod_MapLinePropPyToC(int prop, PyObject *value);
+
+PyObject *_Py_gpiod_SetErrFromErrno(const char *filename);
+#define Py_gpiod_SetErrFromErrno() _Py_gpiod_SetErrFromErrno(__FILE__)
+
+PyObject *Py_gpiod_MakeChipInfo(struct gpiod_chip_info *info);
+PyObject *Py_gpiod_MakeEdgeEvent(struct gpiod_edge_event *event);
+PyObject *Py_gpiod_MakeEdgeEventBuffer(struct gpiod_edge_event_buffer *buffer);
+PyObject *Py_gpiod_MakeInfoEvent(struct gpiod_info_event *event);
+PyObject *Py_gpiod_MakeLineInfo(struct gpiod_line_info *info);
+PyObject *Py_gpiod_MakeLineRequest(struct gpiod_line_request *req);
+
+int Py_gpiod_RegisterChipType(PyObject *module);
+int Py_gpiod_RegisterChipInfoType(PyObject *module);
+int Py_gpiod_RegisterEdgeEventType(PyObject *module);
+int Py_gpiod_RegisterEdgeEventBufferType(PyObject *module);
+int Py_gpiod_RegisterExceptionTypes(PyObject *module);
+int Py_gpiod_RegisterInfoEventType(PyObject *module);
+int Py_gpiod_RegisterLineConfigType(PyObject *module);
+int Py_gpiod_RegisterLineType(PyObject *module);
+int Py_gpiod_RegisterLineInfoType(PyObject *module);
+int Py_gpiod_RegisterLineRequestType(PyObject *module);
+int Py_gpiod_RegisterRequestConfigType(PyObject *module);
+
+void Py_gpiod_SetChipClosedError(void);
+void Py_gpiod_SetRequestReleasedError(void);
+void Py_gpiod_SetBadMappingError(const char *name);
+
+struct gpiod_edge_event_buffer *Py_gpiod_EdgeEventBufferGetData(PyObject *obj);
+struct gpiod_line_config *Py_gpiod_LineConfigGetData(PyObject *obj);
+struct gpiod_request_config *Py_gpiod_RequestConfigGetData(PyObject *obj);
+
+#endif /* __LIBGPIOD_PYTHON_MODULE_H__ */
diff --git a/bindings/python/request-config.c b/bindings/python/request-config.c
new file mode 100644
index 0000000..3e45847
--- /dev/null
+++ b/bindings/python/request-config.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "module.h"
+#include "enum/enum.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_request_config *cfg;
+} request_config_object;
+
+static int set_offsets(struct gpiod_request_config *cfg, PyObject *offsets_obj)
+{
+	PyObject *iter, *item;
+	unsigned int *offsets;
+	Py_ssize_t len;
+	int i;
+
+	len = PyObject_Size(offsets_obj);
+	if (len < 0)
+		return -1;
+
+	if (len == 0) {
+		gpiod_request_config_set_offsets(cfg, 0, NULL);
+		return 0;
+	}
+
+	offsets = PyMem_Calloc(len, sizeof(unsigned int));
+	if (!offsets) {
+		PyErr_NoMemory();
+		return -1;
+	}
+
+	iter = PyObject_GetIter(offsets_obj);
+	if (!iter) {
+		PyMem_Free(offsets);
+		return -1;
+	}
+
+	for (i = 0;; i++) {
+		item = PyIter_Next(iter);
+		if (!item) {
+			Py_DECREF(iter);
+			break;
+		}
+
+		offsets[i] = PyLong_AsUnsignedLong(item);
+		Py_DECREF(item);
+		if (PyErr_Occurred()) {
+			PyMem_Free(offsets);
+			Py_DECREF(iter);
+			return -1;
+		}
+	}
+
+	gpiod_request_config_set_offsets(cfg, len, offsets);
+	PyMem_Free(offsets);
+
+	return 0;
+}
+
+static int request_config_init(request_config_object *self,
+			       PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = {
+		"consumer",
+		"offsets",
+		"event_buffer_size",
+		NULL
+	};
+
+	PyObject *event_buffer_size = NULL, *offsets = NULL;
+	char *consumer = NULL;
+	size_t evbufsiz;
+	int ret;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "|$sOO", kwlist,
+					  &consumer, &offsets,
+					  &event_buffer_size);
+	if (!ret)
+		return -1;
+
+	self->cfg = gpiod_request_config_new();
+	if (!self->cfg) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	if (consumer)
+		gpiod_request_config_set_consumer(self->cfg, consumer);
+
+	if (offsets) {
+		ret = set_offsets(self->cfg, offsets);
+		if (ret)
+			return -1;
+	}
+
+	if (event_buffer_size) {
+		evbufsiz = PyLong_AsSize_t(event_buffer_size);
+		if (PyErr_Occurred())
+			return -1;
+
+		gpiod_request_config_set_event_buffer_size(self->cfg, evbufsiz);
+	}
+
+	return 0;
+}
+
+static void request_config_finalize(request_config_object *self)
+{
+	if (self->cfg)
+		gpiod_request_config_free(self->cfg);
+}
+
+PyDoc_STRVAR(request_config_prop_consumer_doc,
+"Consumer name for the request.");
+
+static PyObject *request_config_get_consumer(request_config_object *self,
+					     void *Py_UNUSED(ignored))
+{
+	const char *consumer;
+
+	consumer = gpiod_request_config_get_consumer(self->cfg);
+	if (!consumer)
+		Py_RETURN_NONE;
+
+	return PyUnicode_FromString(consumer);
+}
+
+static int request_config_set_consumer(request_config_object *self,
+				       PyObject *val, void *Py_UNUSED(ignored))
+{
+	const char *consumer;
+
+	consumer = PyUnicode_AsUTF8(val);
+	if (!consumer)
+		return -1;
+
+	gpiod_request_config_set_consumer(self->cfg, consumer);
+
+	return 0;
+}
+
+PyDoc_STRVAR(request_config_prop_offsets_doc,
+"Offsets of the lines to be requested.");
+
+static PyObject *request_config_get_offsets(request_config_object *self,
+					    void *Py_UNUSED(ignored))
+{
+	unsigned int *offsets, i;
+	PyObject *list, *item;
+	size_t num_offsets;
+	int ret;
+
+	num_offsets = gpiod_request_config_get_num_offsets(self->cfg);
+	if (num_offsets == 0)
+		Py_RETURN_NONE;
+
+	offsets = PyMem_Calloc(num_offsets, sizeof(unsigned int));
+	if (!offsets) {
+		PyErr_NoMemory();
+		return NULL;
+	}
+
+	gpiod_request_config_get_offsets(self->cfg, offsets);
+
+	list = PyList_New(num_offsets);
+	if (!list) {
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	for (i = 0; i < num_offsets; i++) {
+		item = PyLong_FromUnsignedLong(offsets[i]);
+		if (!item) {
+			Py_DECREF(list);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(list, i, item);
+		if (ret) {
+			Py_DECREF(item);
+			Py_DECREF(list);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+	}
+
+	PyMem_Free(offsets);
+	return list;
+}
+
+static int request_config_set_offsets(request_config_object *self,
+				      PyObject *val, void *Py_UNUSED(ignored))
+{
+	return set_offsets(self->cfg, val);
+}
+
+PyDoc_STRVAR(request_config_prop_event_buffer_size_doc,
+"Size of the kernel event buffer for the request.");
+
+static PyObject *
+request_config_get_event_buffer_size(request_config_object *self,
+				     void *Py_UNUSED(ignored))
+{
+	return PyLong_FromSize_t(
+			gpiod_request_config_get_event_buffer_size(self->cfg));
+}
+
+static int request_config_set_event_buffer_size(request_config_object *self,
+				       PyObject *val, void *Py_UNUSED(ignored))
+{
+	size_t event_buffer_size;
+
+	event_buffer_size = PyLong_AsSize_t(val);
+	if (PyErr_Occurred())
+		return -1;
+
+	gpiod_request_config_set_event_buffer_size(self->cfg,
+						   event_buffer_size);
+
+	return 0;
+}
+
+static PyGetSetDef request_config_getset[] = {
+	{
+		.name = "consumer",
+		.get = (getter)request_config_get_consumer,
+		.set = (setter)request_config_set_consumer,
+		.doc = request_config_prop_consumer_doc,
+	},
+	{
+		.name = "offsets",
+		.get = (getter)request_config_get_offsets,
+		.set = (setter)request_config_set_offsets,
+		.doc = request_config_prop_offsets_doc,
+	},
+	{
+		.name = "event_buffer_size",
+		.get = (getter)request_config_get_event_buffer_size,
+		.set = (setter)request_config_set_event_buffer_size,
+		.doc = request_config_prop_event_buffer_size_doc,
+	},
+	{ }
+};
+
+static PyObject *make_str(PyObject *self, const char *fmt)
+{
+	PyObject *consumer, *offsets, *event_buffer_size, *str = NULL;
+
+	consumer = PyObject_GetAttrString(self, "consumer");
+	offsets = PyObject_GetAttrString(self, "offsets");
+	event_buffer_size = PyObject_GetAttrString(self, "event_buffer_size");
+	if (!consumer || !offsets || !event_buffer_size)
+		goto out;
+
+	str = PyUnicode_FromFormat(fmt, consumer, offsets, event_buffer_size);
+
+out:
+	Py_XDECREF(consumer);
+	Py_XDECREF(offsets);
+	Py_XDECREF(event_buffer_size);
+	return str;
+}
+
+static PyObject *request_config_repr(PyObject *self)
+{
+	return make_str(self, "gpiod.RequestConfig(consumer=\"%S\", offsets=%S, event_buffer_size=%S)");
+}
+
+static PyObject *request_config_str(PyObject *self)
+{
+	return make_str(self, "<gpiod.RequestConfig consumer=\"%S\" offsets=%S event_buffer_size=%S>");
+}
+
+PyDoc_STRVAR(request_config_type_doc,
+"Stores a set of options passed to the kernel when making a line request.");
+
+static PyTypeObject request_config_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod.RequestConfig",
+	.tp_basicsize = sizeof(request_config_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_doc = request_config_type_doc,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)request_config_init,
+	.tp_finalize = (destructor)request_config_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = request_config_getset,
+	.tp_repr = (reprfunc)request_config_repr,
+	.tp_str = (reprfunc)request_config_str
+};
+
+int Py_gpiod_RegisterRequestConfigType(PyObject *module)
+{
+	return PyModule_AddType(module, &request_config_type);
+}
+
+struct gpiod_request_config *Py_gpiod_RequestConfigGetData(PyObject *obj)
+{
+	request_config_object *reqcfg;
+	PyObject *type;
+
+	type = PyObject_Type(obj);
+	if (!type)
+		return NULL;
+
+	if ((PyTypeObject *)type != &request_config_type) {
+		PyErr_SetString(PyExc_TypeError,
+				"not a gpiod.RequestConfig object");
+		Py_DECREF(type);
+		return NULL;
+	}
+	Py_DECREF(type);
+
+	reqcfg = (request_config_object *)obj;
+
+	return reqcfg->cfg;
+}
diff --git a/configure.ac b/configure.ac
index ab03673..7a794e2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -198,7 +198,7 @@ AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
 
 if test "x$with_bindings_python" = xtrue
 then
-	AM_PATH_PYTHON([3.0], [],
+	AM_PATH_PYTHON([3.9], [],
 		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
 	AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
 	if test "x$has_python_config" = xfalse
@@ -243,6 +243,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
 		 bindings/python/Makefile
+		 bindings/python/enum/Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
 		 man/Makefile])
-- 
2.34.1

