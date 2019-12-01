Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B42310E041
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfLADZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:17 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38436 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:17 -0500
Received: by mail-pg1-f195.google.com with SMTP id t3so16059450pgl.5
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxUx9mHpD7F+NbMmxb1w7fZYqKU2x7Wtar9YTh01i0I=;
        b=Qf2Wj7pRf4Fjdl3J1OLysibzc5I+QljjVGGQULA4jbF1NrzVHu9tbZ/y2h27selfWd
         9Kv2tTyrmVRk7dwmfzgNYGDmQ7eXvIrJl7Sx6eiJk5ttDOzsOwjYP5slCMMiY/L7n9n6
         Jxa3SfnQf02KmhIMRo6Fqs1gPFqJDcNKcQgoVPdDZh8QSl1QDZ7CS7m2m6yu0XM6dQhR
         KSB0FY3pC4ItQVhkNiZqJ69iK64rSVsWKFtRbOsTzlYmHPkv2sj9WZEihCivZ0HrShNL
         pyZC5/H7BgYkTpo2xpOMwMWPLpm+OelidWVBBcJ0P+4JCSCb1/gKI1VmzHyBKX4nBAgm
         fjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxUx9mHpD7F+NbMmxb1w7fZYqKU2x7Wtar9YTh01i0I=;
        b=WCzrYgv1v0ixBGleRo3udQO8SDsQ1Zqq+W69SXvUMM5HpnRw3FhVzMibX84eVF1/IB
         lX8nXMXt5p9YuwC0K+Q0qtfUG7McHjCezDd0JEMnncoS5RiyYPOo9QCPYkpn9f5YXstP
         NIgS/HBzuH0hxNZDxyGEyVh2Yg8E9g68ZPN2b+eksqJqdWU5/h+X+7avcWnmDH1jZsbv
         6iXe3DezZ0NdQQ7+qc3KmCOH16mDb26kR7bX1Q7GhFah5C3Bf4uO3YmLY4XOPg99SKmz
         i0z+Bvns1KcfFHRlSEcrWVSrQcRRNDSGZtxBwHbqNLK7BttXiZ43AmQr+MjbEAVa4CwL
         2vMg==
X-Gm-Message-State: APjAAAVLYYsliSDKCUA7TWk+Oys3k9NBY2rOxW+/uSjgkiAwzBYzPM4Y
        eIjJoqjGZEctr8acV1hNGZRltOgN
X-Google-Smtp-Source: APXvYqy7DpoQh4XDWb4CS8cSsEUS/Sm9LqGZLWB02EgDeMpzn518fp6phCoMwi6Us7cTBpzmodve7w==
X-Received: by 2002:a62:ac10:: with SMTP id v16mr21877901pfe.37.1575170716033;
        Sat, 30 Nov 2019 19:25:16 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:15 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 12/20] bindings: python: add support for SET_CONFIG
Date:   Sun,  1 Dec 2019 11:23:59 +0800
Message-Id: <20191201032407.23589-13-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add methods to support setting line configuration.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 346 ++++++++++++++++++++++++++++++++++
 1 file changed, 346 insertions(+)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index d87edb7..6086715 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -599,6 +599,142 @@ static PyObject *gpiod_Line_set_value(gpiod_LineObject *self, PyObject *args)
 	return ret;
 }
 
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
+	} else {
+		ret = PyObject_CallMethod((PyObject *)bulk_obj,
+				"set_config", "OO", dirn, flags);
+	}
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
+	Py_DECREF(bulk_obj);
+	Py_DECREF(vals);
+
+	return ret;
+}
+
 PyDoc_STRVAR(gpiod_Line_release_doc,
 "release() -> None\n"
 "\n"
@@ -838,6 +974,30 @@ static PyMethodDef gpiod_Line_methods[] = {
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
@@ -1290,6 +1450,168 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 	Py_RETURN_NONE;
 }
 
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
+	if (val_list == NULL) {
+		valp = NULL;
+	} else {
+		memset(vals, 0, sizeof(vals));
+		rv = gpiod_TupleToIntArray(val_list, vals, self->num_lines);
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
+		rv = gpiod_TupleToIntArray(val_list, vals, self->num_lines);
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
@@ -1438,6 +1760,30 @@ static PyMethodDef gpiod_LineBulk_methods[] = {
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

