Return-Path: <linux-gpio+bounces-11073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F8F99560A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 19:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29530B2181E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 17:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5356E20CCC9;
	Tue,  8 Oct 2024 17:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="YHYefLQ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C391E0E0D
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728409977; cv=none; b=tFJK0Sc+GtxnICDioEWrh2Ep9ATmoztKEorPXchCjTmKo8tyUdTOG/2SBXdFsDXhto+BP1F1rbbnc0QjqO2R+hRvDLc1NzhZr3gRoRlvB3aq1ZZuJE97KY1Jz/cTkMp9LBP46MQr4byaPyYJI9EKL9Da3i9fw1XCHlTBIpMt6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728409977; c=relaxed/simple;
	bh=zF4HSnMmIEnLzrrSWv/KmJFEl1sZ24iZeLwC0x411no=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jY8T/6up8yBlcHjXObLD/SaWzp23YTjTAGcLFT35D6jUYh232j64wOG+QUY6/KH1zn1Io4d7dfbjmS9osenZ2JfaZrbLAczHSHl3DCO4J76Tzw5LTsC71dOkXE/x00mdeQeeiRPPTtwwGwJM+7EKxJeWA4ooZJ42kgbmQKaQFXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=YHYefLQ+; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id B51C4201EE;
	Tue,  8 Oct 2024 12:52:47 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1728409967; bh=zF4HSnMmIEnLzrrSWv/KmJFEl1sZ24iZeLwC0x411no=;
	h=From:To:Cc:Subject:Date:From;
	b=YHYefLQ+tlQUTSXZ7kB6DDYiQcT2vQwbPt0cd4TVo1xWzZtwO/a3MwgZ6Fy5Mz6x1
	 ZojojleUq1OOQ1vmbvVZRCBk6KZl2/PhPQtvC8Rk5gSxy9TuOxc5SSioiQoiJg+WqC
	 cqs1XtWHbbBMSb4VzHWgoOQSZU3P/P3icLOtN7Co=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2] bindings: python: import gpiod attributes in external module
Date: Tue,  8 Oct 2024 12:51:39 -0500
Message-Id: <20241008175139.1198980-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the external module relied on gpiod attributes being present
within `globals()` to construct return values back to the caller.

This assumption required callers of the external module to have imported
the attributes to populate `globals()` for the interface to work.

Having this implicit contract is opaque and prone to causing issues if
imports within gpiod modules ever get reworked.

Now, the external module explicitly imports attributes from gpiod in
order to return values back to the caller.

There should be no concern about circular imports as the external module
should be completely imported by the time callers call into it.

Since Py_gpiod_GetGlobalType is no longer used, it has been replaced
with Py_gpiod_GetModuleAttrString which returns a new PyObject*
reference for the named module and attribute that must be decremented
when no longer in use.

Closes: https://github.com/brgl/libgpiod/issues/101
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
Changes since v1:

* decrement attribute reference on successful returns from 
  request_get_values and request_read_edge_events (Thanks Bartosz)

---
 bindings/python/gpiod/ext/chip.c     | 39 +++++++++++++++++-----------
 bindings/python/gpiod/ext/common.c   | 14 ++++++----
 bindings/python/gpiod/ext/internal.h |  3 ++-
 bindings/python/gpiod/ext/request.c  | 28 +++++++++++++-------
 4 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index e8eaad8..fcfb960 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -75,31 +75,34 @@ static PyObject *chip_get_info(chip_object *self, PyObject *Py_UNUSED(ignored))
 	struct gpiod_chip_info *info;
 	PyObject *type, *ret;
 
-	type = Py_gpiod_GetGlobalType("ChipInfo");
+	type = Py_gpiod_GetModuleAttrString("gpiod.chip_info", "ChipInfo");
 	if (!type)
 		return NULL;
 
 	info = gpiod_chip_get_info(self->chip);
-	if (!info)
+	if (!info) {
+		Py_DECREF(type);
 		return PyErr_SetFromErrno(PyExc_OSError);
+	}
 
-	 ret = PyObject_CallFunction(type, "ssI",
-				     gpiod_chip_info_get_name(info),
-				     gpiod_chip_info_get_label(info),
-				     gpiod_chip_info_get_num_lines(info));
-	 gpiod_chip_info_free(info);
-	 return ret;
+	ret = PyObject_CallFunction(type, "ssI",
+				    gpiod_chip_info_get_name(info),
+				    gpiod_chip_info_get_label(info),
+				    gpiod_chip_info_get_num_lines(info));
+	gpiod_chip_info_free(info);
+	Py_DECREF(type);
+	return ret;
 }
 
 static PyObject *make_line_info(struct gpiod_line_info *info)
 {
-	PyObject *type;
+	PyObject *type, *ret;
 
-	type = Py_gpiod_GetGlobalType("LineInfo");
+	type = Py_gpiod_GetModuleAttrString("gpiod.line_info", "LineInfo");
 	if (!type)
 		return NULL;
 
-	return PyObject_CallFunction(type, "IsOsiOiiiiOk",
+	ret = PyObject_CallFunction(type, "IsOsiOiiiiOk",
 				gpiod_line_info_get_offset(info),
 				gpiod_line_info_get_name(info),
 				gpiod_line_info_is_used(info) ?
@@ -115,6 +118,8 @@ static PyObject *make_line_info(struct gpiod_line_info *info)
 				gpiod_line_info_is_debounced(info) ?
 							Py_True : Py_False,
 				gpiod_line_info_get_debounce_period_us(info));
+	Py_DECREF(type);
+	return ret;
 }
 
 static PyObject *chip_get_line_info(chip_object *self, PyObject *args)
@@ -168,10 +173,6 @@ chip_read_info_event(chip_object *self, PyObject *Py_UNUSED(ignored))
 	struct gpiod_info_event *event;
 	struct gpiod_line_info *info;
 
-	type = Py_gpiod_GetGlobalType("InfoEvent");
-	if (!type)
-		return NULL;
-
 	Py_BEGIN_ALLOW_THREADS;
 	event = gpiod_chip_read_info_event(self->chip);
 	Py_END_ALLOW_THREADS;
@@ -186,12 +187,20 @@ chip_read_info_event(chip_object *self, PyObject *Py_UNUSED(ignored))
 		return NULL;
 	}
 
+	type = Py_gpiod_GetModuleAttrString("gpiod.info_event", "InfoEvent");
+	if (!type) {
+		Py_DECREF(info_obj);
+		gpiod_info_event_free(event);
+		return NULL;
+	}
+
 	event_obj = PyObject_CallFunction(type, "iKO",
 				gpiod_info_event_get_event_type(event),
 				gpiod_info_event_get_timestamp_ns(event),
 				info_obj);
 	Py_DECREF(info_obj);
 	gpiod_info_event_free(event);
+	Py_DECREF(type);
 	return event_obj;
 }
 
diff --git a/bindings/python/gpiod/ext/common.c b/bindings/python/gpiod/ext/common.c
index 07fca8c..62201b6 100644
--- a/bindings/python/gpiod/ext/common.c
+++ b/bindings/python/gpiod/ext/common.c
@@ -64,15 +64,19 @@ PyObject *Py_gpiod_SetErrFromErrno(void)
 	return PyErr_SetFromErrno(exc);
 }
 
-PyObject *Py_gpiod_GetGlobalType(const char *type_name)
+PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
+				       const char *attrname)
 {
-	PyObject *globals;
+	PyObject *module, *attribute;
 
-	globals = PyEval_GetGlobals();
-	if (!globals)
+	module = PyImport_ImportModule(modname);
+	if (!module)
 		return NULL;
 
-	return PyDict_GetItemString(globals, type_name);
+	attribute = PyObject_GetAttrString(module, attrname);
+	Py_DECREF(module);
+
+	return attribute;
 }
 
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong)
diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
index 7d223c0..15aedfb 100644
--- a/bindings/python/gpiod/ext/internal.h
+++ b/bindings/python/gpiod/ext/internal.h
@@ -8,7 +8,8 @@
 #include <Python.h>
 
 PyObject *Py_gpiod_SetErrFromErrno(void);
-PyObject *Py_gpiod_GetGlobalType(const char *type_name);
+PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
+				       const char *attrname);
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
 void Py_gpiod_dealloc(PyObject *self);
 PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request,
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 5db69fe..e1a2a42 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -149,10 +149,6 @@ static PyObject *request_get_values(request_object *self, PyObject *args)
 	if (num_offsets < 0)
 		return NULL;
 
-	type = Py_gpiod_GetGlobalType("Value");
-	if (!type)
-		return NULL;
-
 	iter = PyObject_GetIter(offsets);
 	if (!iter)
 		return NULL;
@@ -183,18 +179,26 @@ static PyObject *request_get_values(request_object *self, PyObject *args)
 	if (ret)
 		return Py_gpiod_SetErrFromErrno();
 
+	type = Py_gpiod_GetModuleAttrString("gpiod.line", "Value");
+	if (!type)
+		return NULL;
+
 	for (pos = 0; pos < num_offsets; pos++) {
 		val = PyObject_CallFunction(type, "i", self->values[pos]);
-		if (!val)
+		if (!val) {
+			Py_DECREF(type);
 			return NULL;
+		}
 
 		ret = PyList_SetItem(values, pos, val);
 		if (ret) {
 			Py_DECREF(val);
+			Py_DECREF(type);
 			return NULL;
 		}
 	}
 
+	Py_DECREF(type);
 	Py_RETURN_NONE;
 }
 
@@ -279,10 +283,6 @@ static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 		max_events = 64;
 	}
 
-	type = Py_gpiod_GetGlobalType("EdgeEvent");
-	if (!type)
-		return NULL;
-
 	Py_BEGIN_ALLOW_THREADS;
 	ret = gpiod_line_request_read_edge_events(self->request,
 						 self->buffer, max_events);
@@ -296,10 +296,17 @@ static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 	if (!events)
 		return NULL;
 
+	type = Py_gpiod_GetModuleAttrString("gpiod.edge_event", "EdgeEvent");
+	if (!type) {
+		Py_DECREF(events);
+		return NULL;
+	}
+
 	for (i = 0; i < num_events; i++) {
 		event = gpiod_edge_event_buffer_get_event(self->buffer, i);
 		if (!event) {
 			Py_DECREF(events);
+			Py_DECREF(type);
 			return NULL;
 		}
 
@@ -311,6 +318,7 @@ static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 				gpiod_edge_event_get_line_seqno(event));
 		if (!event_obj) {
 			Py_DECREF(events);
+			Py_DECREF(type);
 			return NULL;
 		}
 
@@ -318,10 +326,12 @@ static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 		if (ret) {
 			Py_DECREF(event_obj);
 			Py_DECREF(events);
+			Py_DECREF(type);
 			return NULL;
 		}
 	}
 
+	Py_DECREF(type);
 	return events;
 }
 
-- 
2.34.1


