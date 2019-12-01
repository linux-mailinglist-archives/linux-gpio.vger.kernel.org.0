Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1E010E040
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbfLADZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:14 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37741 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:14 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so730190pjb.4
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=298YcKpw+8cbBw441JRH1ggdrU9vk2Z7bcnU0P38wno=;
        b=MFG8xNJjQPrE1FmhJe6dC6+Qx64uoslNfI8v7xRuRaWKhuzXzHuGH7JdV0n4w1fzvP
         LTG+ifST4pkijldtGhFsldbfx1MT1gHRwEqR1oNH+P4MDbxIWpboVHGJDMTMAYAm7JtF
         K62FfW1kniSwOiHaqNN68HlhBHBoTxfqsSgKQUpylxCzzvTQrYCVrt5WIsPs9ETKsjA0
         Q+wrZuhZQTr5mHJJEg+s3zFfSvzrZvAaz+cHUwjFbrrC9/qlFD7zJBHVsdkZVz1/SgsQ
         H9ZC8dN0r0A+TGCzwpdfcaTNJzCYKERVOO9W6ByQB/HBOWW8VAyoZN6Ko4OlpPgRbCKs
         2psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=298YcKpw+8cbBw441JRH1ggdrU9vk2Z7bcnU0P38wno=;
        b=KbDhUxbHdesgg+CPzEIRIxbBhP6sYAPZLct2bX79F1aPzpSpqH1Xdi6Nefqzn2SEts
         8z3EGf3w9bRnwQGIzEv3pWMVQod8+/O6go5UlsQKSgYLjthwYd50HEk5PLgd/bZK63Um
         /W1yUBRZ39yABhzCT7iJEcUlJAw1hax8vrogZNosL+HiYoYIlRzvdphBRdsUUKA0zbUG
         HYrjnsvFC/2/TWozSnMoVAmxXFkS/DQ9Zg1ImDFTpLFqzHH0oqtJyLAO5n6wzwFsjX3j
         +U4ePrW2Q5NzlvdcryXeThcRsaxtbzdWy+nPcEQDTSEanESZX0vV0QJyeR1q0m9JgwEW
         bjOw==
X-Gm-Message-State: APjAAAUcGC4R4gTXoeoMSM0T0jBbd4S/nZff0qxdXCx3RAYoFbsNhRPU
        C1X5w4HiiILJTr1AmRhS33kuGZEo
X-Google-Smtp-Source: APXvYqxqytTs+7kRGK8ha6+Im12RlToHJqPIXX9HUKM9nNlrK99KG1p52VYmIZfioU+48JGoq6CSOg==
X-Received: by 2002:a17:902:7084:: with SMTP id z4mr17524245plk.247.1575170713460;
        Sat, 30 Nov 2019 19:25:13 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:13 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 11/20] bindings: python: move tuple to int array conversion into helper function
Date:   Sun,  1 Dec 2019 11:23:58 +0800
Message-Id: <20191201032407.23589-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Restructured gpiod_LineBulk_set_values to move the conversion of values
from Python tuple to int array into a helper function as it is useful for
similar functions.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 65 +++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 4723771..d87edb7 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1216,6 +1216,38 @@ static PyObject *gpiod_LineBulk_get_values(gpiod_LineBulkObject *self,
 	return val_list;
 }
 
+static int gpiod_TupleToIntArray(PyObject *src, int *dst, Py_ssize_t n)
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
 PyDoc_STRVAR(gpiod_LineBulk_set_values_doc,
 "set_values(values) -> None\n"
 "\n"
@@ -1231,10 +1263,9 @@ PyDoc_STRVAR(gpiod_LineBulk_set_values_doc,
 static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 					   PyObject *args)
 {
-	int rv, vals[GPIOD_LINE_BULK_MAX_LINES], val;
-	PyObject *val_list, *iter, *next;
+	int rv, vals[GPIOD_LINE_BULK_MAX_LINES];
+	PyObject *val_list;
 	struct gpiod_line_bulk bulk;
-	Py_ssize_t num_vals, i;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
 		return NULL;
@@ -1246,34 +1277,10 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 	if (!rv)
 		return NULL;
 
-	num_vals = PyObject_Size(val_list);
-	if (self->num_lines != num_vals) {
-		PyErr_SetString(PyExc_TypeError,
-				"Number of values must correspond to the number of lines");
-		return NULL;
-	}
-
-	iter = PyObject_GetIter(val_list);
-	if (!iter)
+	rv = gpiod_TupleToIntArray(val_list, vals, self->num_lines);
+	if (rv)
 		return NULL;
 
-	for (i = 0;; i++) {
-		next = PyIter_Next(iter);
-		if (!next) {
-			Py_DECREF(iter);
-			break;
-		}
-
-		val = PyLong_AsLong(next);
-		Py_DECREF(next);
-		if (PyErr_Occurred()) {
-			Py_DECREF(iter);
-			return NULL;
-		}
-
-		vals[i] = (int)val;
-	}
-
 	Py_BEGIN_ALLOW_THREADS;
 	rv = gpiod_line_set_value_bulk(&bulk, vals);
 	Py_END_ALLOW_THREADS;
-- 
2.24.0

