Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 191AB10900F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfKYOdJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:09 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44126 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:09 -0500
Received: by mail-pl1-f194.google.com with SMTP id az9so6576016plb.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W5LtyT4KdX2MuencblfVi1EJZKnnkO9ezbdxW8d2jPs=;
        b=NMf405q8uPRln8/7QKh3wsOw8nQTOcm+UCp8VfphBQu7/kEvmHDe/XrUuj16quvXvl
         OFBqzvTuWqEpzveIE4K82q/lN3HqhEKTyqu2G6KZEQrzMcOP1+6yiQO9JW3cu3+ve7AT
         oKnXATBamwffWkgCCkynlchPrJJ8Pma6T/rXHSZepoJKo9RbdoSnw6UVLaAV6hSUbld+
         BKoqox8FvzRgk07WGYycnbO9yQpkztC7Ssnao+BsR5BimffBCpqQqKvj38aembkaRV9h
         PK9sWHDZGpW6KyCfCia2VvQ25WkbmsnktQfjHzIGGyCGVT1d0UdbDOxMrob4L0pWFZGF
         5wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W5LtyT4KdX2MuencblfVi1EJZKnnkO9ezbdxW8d2jPs=;
        b=VoAnxcG3jcM+9oM6JLqMqD7/VPmNZ8AjKyQpiArzUIz5why1HSTjniZPQ7rpBeGPof
         VL3RmzzTPfbhLFgqScLA+OpvM/LR93LpdkhmEtIkz3+hqG+NR2j1Zk0Eds5GooucJMpn
         0Ooy0fhevHs1X9GfcVfCWkOeyZznvoXb3fdtTtluDxyC55M+jxxqo4KGyDrpLm1bpDCU
         hq02XzFBo6zYjhMBq17U40egmp7taSMbgipzQ3fVCzpVRqTRSk0gP4YqK92T6h9Gkc80
         Vi1TXbuBiRpJ6v5yNZ1vwDrkgwv/Izf/sc9cZeKtF3i/WzTzNu+etEuBidmMeBf6HpXv
         3m2A==
X-Gm-Message-State: APjAAAW+V+KOK0wzMyYrlJRSsYe0MUEYGT7qSb8JDdCv4mSOKoCIDkY4
        9IoTgFznfyTZOhkjYZrdbBpwt/DMY486cw==
X-Google-Smtp-Source: APXvYqyMuie138xfCJ5SKUxAZ9tEX61eaWEMQryRmq2m0kXTEV2QcwgLE2E2N2GTtV4UVDm/49xjgQ==
X-Received: by 2002:a17:902:8d98:: with SMTP id v24mr27768935plo.159.1574692386070;
        Mon, 25 Nov 2019 06:33:06 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:33:05 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 11/14] bindings: python: add support for SET_CONFIG
Date:   Mon, 25 Nov 2019 22:31:54 +0800
Message-Id: <20191125143157.26154-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
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

