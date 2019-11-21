Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801971047A3
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfKUAgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:47 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36398 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:46 -0500
Received: by mail-pj1-f67.google.com with SMTP id cq11so618275pjb.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W5LtyT4KdX2MuencblfVi1EJZKnnkO9ezbdxW8d2jPs=;
        b=ELelWmt5zAvWTBydfVF4+R28noXUXJx2Wppbxzgb66Aw9v7q+4ndOuhH+BWfuOaarg
         mpjw+UQLBSGMb3IDLKUQVGL+Ae4UttKQbdqKdZ148yaABxi8vJFcOQij0CMqAe8gsJNO
         USpmSRmNE6hbiSElo8BSHFHG0ZMRmV7E6cEZM0oHibXLl0OXowd2EE//tBA6zmVAnQMB
         YRbNR4vOkETRN7x5IzN1iovGoaRDWaOaqwL7yP1S3ytB6A3VylYbGbLZkrgpgmml9XMO
         Q7xU9qVfa/O9fO6rh4b5xMipnF1UvI6YS9e1adh1U1s/M9IH/psm9r89gPZpG6TCm8kv
         pokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W5LtyT4KdX2MuencblfVi1EJZKnnkO9ezbdxW8d2jPs=;
        b=h78ZotWHb9N8c8KU3Gz10kzedjiR9gEtoeOXmn2JoPsl7dv7GSFI3KYEQedms2hvg8
         6hTX/8ssAXghAz90rkfsQYSd2LvlN0jGrTzQckv4BtelbnLWp83RBAvI0u2UwJ30Whsm
         uaNxDqifymIRdhPVsIXm29USZZDRRlOcPdd8BITNvN0ZliuxFhBgU6+DopgTovJl5Y7B
         LGCqz3stLFb2PWrJ/QwRApHFL4wkxx/u2nXfdG8x63zw4w5Dy2BHHAIx690FA7kDukM6
         pRiNegOoLZPs/7rCVJ+O/EwEoOUrlfwLOfKNi3cx/AsS1TELXVi4hUe2CtYbOVVQ4w34
         Hgnw==
X-Gm-Message-State: APjAAAXKT8a13tmMURpKdL7z71V9tFB/NKPkKLsAXj4Y1h0ar5lSb083
        EMXnHemyaBZAuU5TzMroC8lG1oXJtBM=
X-Google-Smtp-Source: APXvYqyYgrpRKZtFwfDPMV+ojpdN24WP973K6hyMLdQrh9hC/+O/qywC79cvsvSv9vANKZ2aPAtddw==
X-Received: by 2002:a17:90a:8818:: with SMTP id s24mr7779160pjn.31.1574296605729;
        Wed, 20 Nov 2019 16:36:45 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:45 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 11/14] bindings: python: add support for SET_CONFIG
Date:   Thu, 21 Nov 2019 08:35:53 +0800
Message-Id: <20191121003556.9020-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add methods to support setting line configuration.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 381 +++++++++++++++++++++++++++++++++-
 1 file changed, 379 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 4723771..4f5e117 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -585,14 +585,149 @@ static PyObject *gpiod_Line_set_value(gpiod_LineObject *self, PyObject *args)
 	if (!bulk_obj)
 		return NULL;
 
-	vals = Py_BuildValue("((O))", val);
+	vals = Py_BuildValue("(O)", val);
 	if (!vals) {
 		Py_DECREF(bulk_obj);
 		return NULL;
 	}
 
 	ret = PyObject_CallMethod((PyObject *)bulk_obj,
-				  "set_values", "O", vals);
+				  "set_values", "(O)", vals);
+	Py_DECREF(bulk_obj);
+	Py_DECREF(vals);
+
+	return ret;
+}
+
+PyDoc_STRVAR(gpiod_Line_set_config_doc,
+"set_config(direction,flags,value) -> None\n"
+"\n"
+"Set the configuration of this GPIO line.\n"
+"\n"
+"  direction\n"
+"    New direction (integer)\n"
+"  flags\n"
+"    New flags (integer)\n"
+"  value\n"
+"    New value (integer)");
+
+static PyObject *gpiod_Line_set_config(gpiod_LineObject *self, PyObject *args)
+{
+	gpiod_LineBulkObject *bulk_obj;
+	PyObject *dirn, *flags, *val, *vals, *ret;
+	int rv;
+
+	val = NULL;
+	rv = PyArg_ParseTuple(args, "OO|O", &dirn, &flags, &val);
+	if (!rv)
+		return NULL;
+
+	bulk_obj = gpiod_LineToLineBulk(self);
+	if (!bulk_obj)
+		return NULL;
+
+	if (val) {
+		vals = Py_BuildValue("(O)", val);
+		if (!vals) {
+			Py_DECREF(bulk_obj);
+			return NULL;
+		}
+		ret = PyObject_CallMethod((PyObject *)bulk_obj,
+				"set_config", "OO(O)", dirn, flags, vals);
+		Py_DECREF(vals);
+	} else
+		ret = PyObject_CallMethod((PyObject *)bulk_obj,
+				"set_config", "OO", dirn, flags);
+
+	Py_DECREF(bulk_obj);
+
+	return ret;
+}
+
+PyDoc_STRVAR(gpiod_Line_set_flags_doc,
+"set_flags(flags) -> None\n"
+"\n"
+"Set the flags of this GPIO line.\n"
+"\n"
+"  flags\n"
+"    New flags (integer)");
+
+static PyObject *gpiod_Line_set_flags(gpiod_LineObject *self, PyObject *args)
+{
+	gpiod_LineBulkObject *bulk_obj;
+	PyObject *ret;
+
+	bulk_obj = gpiod_LineToLineBulk(self);
+	if (!bulk_obj)
+		return NULL;
+
+	ret = PyObject_CallMethod((PyObject *)bulk_obj,
+				  "set_flags", "O", args);
+	Py_DECREF(bulk_obj);
+
+	return ret;
+}
+
+PyDoc_STRVAR(gpiod_Line_set_direction_input_doc,
+"set_direction_input() -> None\n"
+"\n"
+"Set the direction of this GPIO line to input.\n");
+
+static PyObject *gpiod_Line_set_direction_input(gpiod_LineObject *self,
+						PyObject *Py_UNUSED(ignored))
+{
+	gpiod_LineBulkObject *bulk_obj;
+	PyObject *ret;
+
+	bulk_obj = gpiod_LineToLineBulk(self);
+	if (!bulk_obj)
+		return NULL;
+
+	ret = PyObject_CallMethod((PyObject *)bulk_obj,
+				  "set_direction_input", "");
+	Py_DECREF(bulk_obj);
+
+	return ret;
+}
+
+PyDoc_STRVAR(gpiod_Line_set_direction_output_doc,
+"set_direction_output(value) -> None\n"
+"\n"
+"Set the direction of this GPIO line to output.\n"
+"\n"
+"  value\n"
+"    New value (integer)");
+
+static PyObject *gpiod_Line_set_direction_output(gpiod_LineObject *self,
+						 PyObject *args)
+{
+	gpiod_LineBulkObject *bulk_obj;
+	PyObject *val, *vals, *ret;
+	int rv;
+	const char *fmt;
+
+	val = NULL;
+	rv = PyArg_ParseTuple(args, "|O", &val);
+	if (!rv)
+		return NULL;
+
+	if (val) {
+		fmt = "(O)";
+		vals = Py_BuildValue(fmt, val);
+	} else {
+		vals = Py_BuildValue("()");
+		fmt = "O"; /* pass empty args to bulk */
+	}
+	if (!vals)
+		return NULL;
+
+	bulk_obj = gpiod_LineToLineBulk(self);
+	if (!bulk_obj)
+		return NULL;
+
+	ret = PyObject_CallMethod((PyObject *)bulk_obj,
+				  "set_direction_output", fmt, vals);
+
 	Py_DECREF(bulk_obj);
 	Py_DECREF(vals);
 
@@ -838,6 +973,30 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_flags = METH_VARARGS,
 		.ml_doc = gpiod_Line_set_value_doc,
 	},
+	{
+		.ml_name = "set_config",
+		.ml_meth = (PyCFunction)gpiod_Line_set_config,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_Line_set_config_doc,
+	},
+	{
+		.ml_name = "set_flags",
+		.ml_meth = (PyCFunction)gpiod_Line_set_flags,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_Line_set_flags_doc,
+	},
+	{
+		.ml_name = "set_direction_input",
+		.ml_meth = (PyCFunction)gpiod_Line_set_direction_input,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = gpiod_Line_set_direction_input_doc,
+	},
+	{
+		.ml_name = "set_direction_output",
+		.ml_meth = (PyCFunction)gpiod_Line_set_direction_output,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_Line_set_direction_output_doc,
+	},
 	{
 		.ml_name = "release",
 		.ml_meth = (PyCFunction)gpiod_Line_release,
@@ -1283,6 +1442,200 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 	Py_RETURN_NONE;
 }
 
+static int convert_values(PyObject *src, int *dst, Py_ssize_t n)
+{
+	int val;
+	Py_ssize_t num_vals, i;
+	PyObject *iter, *next;
+
+	num_vals = PyObject_Size(src);
+	if (num_vals != n) {
+		PyErr_SetString(PyExc_TypeError,
+			"Number of values must correspond to the number of lines");
+		return -1;
+	}
+	iter = PyObject_GetIter(src);
+	if (!iter)
+		return -1;
+	for (i = 0;; i++) {
+		next = PyIter_Next(iter);
+		if (!next) {
+			Py_DECREF(iter);
+			break;
+		}
+		val = PyLong_AsLong(next);
+		Py_DECREF(next);
+		if (PyErr_Occurred()) {
+			Py_DECREF(iter);
+			return -1;
+		}
+		dst[i] = (int)val;
+	}
+	return 0;
+}
+
+PyDoc_STRVAR(gpiod_LineBulk_set_config_doc,
+"set_config(direction,flags,values) -> None\n"
+"\n"
+"Set the configuration of all the lines held by this LineBulk object.\n"
+"\n"
+"  direction\n"
+"    New direction (integer)\n"
+"  flags\n"
+"    New flags (integer)\n"
+"  values\n"
+"    List of values (integers) to set when direction is output.\n"
+"\n"
+"The number of values in the list passed as argument must be the same as\n"
+"the number of lines held by this gpiod.LineBulk object. The index of each\n"
+"value corresponds to the index of each line in the object.\n");
+
+static PyObject *gpiod_LineBulk_set_config(gpiod_LineBulkObject *self,
+					   PyObject *args)
+{
+	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	PyObject *val_list;
+	struct gpiod_line_bulk bulk;
+	const int *valp;
+	int dirn, flags;
+
+	if (gpiod_LineBulkOwnerIsClosed(self))
+		return NULL;
+
+	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+
+	val_list = NULL;
+	rv = PyArg_ParseTuple(args, "ii|(O)", &dirn, &flags, &val_list);
+	if (!rv)
+		return NULL;
+
+	if (val_list == NULL)
+		valp = NULL;
+	else {
+		memset(vals, 0, sizeof(vals));
+		rv = convert_values(val_list, vals, self->num_lines);
+		if (rv)
+			return NULL;
+		valp = vals;
+	}
+
+	Py_BEGIN_ALLOW_THREADS;
+	rv = gpiod_line_set_config_bulk(&bulk, dirn, flags, valp);
+	Py_END_ALLOW_THREADS;
+	if (rv)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(gpiod_LineBulk_set_flags_doc,
+"set_flags(flags) -> None\n"
+"\n"
+"Set the flags of all the lines held by this LineBulk object.\n"
+"\n"
+"  flags\n"
+"    New flags (integer)");
+
+static PyObject *gpiod_LineBulk_set_flags(gpiod_LineBulkObject *self,
+					  PyObject *args)
+{
+	int rv;
+	struct gpiod_line_bulk bulk;
+	int flags;
+
+	if (gpiod_LineBulkOwnerIsClosed(self))
+		return NULL;
+
+	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+
+	rv = PyArg_ParseTuple(args, "i", &flags);
+	if (!rv)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	rv = gpiod_line_set_flags_bulk(&bulk, flags);
+	Py_END_ALLOW_THREADS;
+	if (rv)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(gpiod_LineBulk_set_direction_input_doc,
+"set_direction_input() -> None\n"
+"\n"
+"Set the direction of all the lines held by this LineBulk object to input.\n");
+
+static PyObject *gpiod_LineBulk_set_direction_input(gpiod_LineBulkObject *self,
+						PyObject *Py_UNUSED(ignored))
+{
+	struct gpiod_line_bulk bulk;
+	int rv;
+
+	if (gpiod_LineBulkOwnerIsClosed(self))
+		return NULL;
+
+	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+
+	Py_BEGIN_ALLOW_THREADS;
+	rv = gpiod_line_set_direction_input_bulk(&bulk);
+	Py_END_ALLOW_THREADS;
+	if (rv)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+PyDoc_STRVAR(gpiod_LineBulk_set_direction_output_doc,
+"set_direction_output(value) -> None\n"
+"\n"
+"Set the direction of all the lines held by this LineBulk object to output.\n"
+"\n"
+"  values\n"
+"    List of values (integers) to set when direction is output.\n"
+"\n"
+"The number of values in the list passed as argument must be the same as\n"
+"the number of lines held by this gpiod.LineBulk object. The index of each\n"
+"value corresponds to the index of each line in the object.\n");
+
+static PyObject *gpiod_LineBulk_set_direction_output(
+				gpiod_LineBulkObject *self,
+				PyObject *args)
+{
+	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	PyObject *val_list;
+	struct gpiod_line_bulk bulk;
+	const int *valp;
+
+	if (gpiod_LineBulkOwnerIsClosed(self))
+		return NULL;
+
+	gpiod_LineBulkObjToCLineBulk(self, &bulk);
+
+	val_list = NULL;
+	rv = PyArg_ParseTuple(args, "|O", &val_list);
+	if (!rv)
+		return NULL;
+
+	if (val_list == NULL)
+		valp = NULL;
+	else {
+		memset(vals, 0, sizeof(vals));
+		rv = convert_values(val_list, vals, self->num_lines);
+		if (rv)
+			return NULL;
+		valp = vals;
+	}
+
+	Py_BEGIN_ALLOW_THREADS;
+	rv = gpiod_line_set_direction_output_bulk(&bulk, valp);
+	Py_END_ALLOW_THREADS;
+	if (rv)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
 PyDoc_STRVAR(gpiod_LineBulk_release_doc,
 "release() -> None\n"
 "\n"
@@ -1431,6 +1784,30 @@ static PyMethodDef gpiod_LineBulk_methods[] = {
 		.ml_doc = gpiod_LineBulk_set_values_doc,
 		.ml_flags = METH_VARARGS,
 	},
+	{
+		.ml_name = "set_config",
+		.ml_meth = (PyCFunction)gpiod_LineBulk_set_config,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_LineBulk_set_config_doc,
+	},
+	{
+		.ml_name = "set_flags",
+		.ml_meth = (PyCFunction)gpiod_LineBulk_set_flags,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_LineBulk_set_flags_doc,
+	},
+	{
+		.ml_name = "set_direction_input",
+		.ml_meth = (PyCFunction)gpiod_LineBulk_set_direction_input,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = gpiod_LineBulk_set_direction_input_doc,
+	},
+	{
+		.ml_name = "set_direction_output",
+		.ml_meth = (PyCFunction)gpiod_LineBulk_set_direction_output,
+		.ml_flags = METH_VARARGS,
+		.ml_doc = gpiod_LineBulk_set_direction_output_doc,
+	},
 	{
 		.ml_name = "release",
 		.ml_meth = (PyCFunction)gpiod_LineBulk_release,
-- 
2.24.0

