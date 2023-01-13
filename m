Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2313B66A568
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjAMVwe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjAMVwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:32 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BF389BDF
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:31 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so14832218wma.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB6udgfE8PDU+ZgHX4U7uUPgQ1WYJTiJGyqYxNBagAA=;
        b=0TU1EhhqLNN6zb54L7MnIXu4k7oSXEYzdcK9oUQgOuG3HzY1L9nYAhiAScRVsZC+mI
         wnTuNoZ5eLZ3BHL0hUTRRNmAUmxQZF2+4tn9ocmCaQc6WZokgYmrTK10G04/yGc+Ffwb
         yQRksuN7CcOC7tHvgJEIYDFnOcwxHb2bvBggxgC1uwQJ5VdKCqtRAm5426ZKvaa8FD2h
         FMVShraCRpCX+pGYyF82Er7ACFnGz6tBN/4efjnRJ5j2bibogzT6yHQHHPi9tC5Fgqep
         t25tkErunAMTwZaRqSDVGpux5hXeV+Rp8p/HGHgcBxCexig72XgZJi+ad6+NXEXyvXmt
         a5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB6udgfE8PDU+ZgHX4U7uUPgQ1WYJTiJGyqYxNBagAA=;
        b=t5LV/GQrVZf6uJPaDJ/fzFfkrZoFbUK7LXyPfiV3V9qFqyDveyT3eVE3ncpa8Jt2Tg
         UytNWPyA/CfmrDINAMCFyaVWLdtUvOc0ytmsJNIh45ZpJ/+LJkHeTFaoFstDT+LSkf9o
         Xmx6aY9qmVicfOBPayJpf6f4nZCPW/DF0cDqU7O7ekP/1UO0UT46cS/gL0/TD5IQrGpp
         3SnLkkLhx3mOsWkJN6PwzefGbNWup3bIUjIhAceTWDNXaeTCL2stXKEJ69/zOcuIeaBM
         Bd1VPcP/dBViJdnSSrf+Gz6c4EdDUp4mooxza8u/BfvZ/9D9Q/bo3V3MQp6I03vgIE+n
         TmBQ==
X-Gm-Message-State: AFqh2kpR9f8VExiumBGXIlncrtyvWnjhxLPUNicx5oQ01YSPIia3DQyb
        pDe99cjVlTUI4Z/IsLfoKJ7DETbk0vmVLBll
X-Google-Smtp-Source: AMrXdXvSh3hs2LrHzS09PaAFGI8imKapj9UueL9j4iKd4yfWK8i26gFJK+yHwd0aR5+lxObneSXHUA==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id n18-20020a05600c501200b003d35a4a9103mr58557642wmr.31.1673646749765;
        Fri, 13 Jan 2023 13:52:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 13/16] bindings: python: provide line_config.set_output_values()
Date:   Fri, 13 Jan 2023 22:52:07 +0100
Message-Id: <20230113215210.616812-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new argument to Chip.request_lines() that allows the user to pass
a list of output values for configured lines instead of using several
LineSettings objects between which the only difference is the output
value.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py               |  6 ++
 bindings/python/gpiod/ext/line-config.c     | 64 +++++++++++++++++++++
 bindings/python/tests/tests_line_request.py | 14 +++++
 3 files changed, 84 insertions(+)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index ad2eddd..4f5f9b4 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -6,10 +6,12 @@ from .chip_info import ChipInfo
 from .exception import ChipClosedError
 from .info_event import InfoEvent
 from .internal import poll_fd
+from .line import Value
 from .line_info import LineInfo
 from .line_settings import LineSettings, _line_settings_to_ext
 from .line_request import LineRequest
 from collections import Counter
+from collections.abc import Iterable
 from datetime import timedelta
 from errno import ENOENT
 from select import select
@@ -221,6 +223,7 @@ class Chip:
         config: dict[tuple[Union[int, str]], Optional[LineSettings]],
         consumer: Optional[str] = None,
         event_buffer_size: Optional[int] = None,
+        output_values: Optional[Iterable[Value]] = None,
     ) -> LineRequest:
         """
         Request a set of lines for exclusive usage.
@@ -279,6 +282,9 @@ class Chip:
                 offsets, _line_settings_to_ext(settings or LineSettings())
             )
 
+        if output_values:
+            line_cfg.set_output_values(output_values)
+
         req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
         request = LineRequest(req_internal)
 
diff --git a/bindings/python/gpiod/ext/line-config.c b/bindings/python/gpiod/ext/line-config.c
index 173ca6b..0bba112 100644
--- a/bindings/python/gpiod/ext/line-config.c
+++ b/bindings/python/gpiod/ext/line-config.c
@@ -89,12 +89,76 @@ line_config_add_line_settings(line_config_object *self, PyObject *args)
 	Py_RETURN_NONE;
 }
 
+static PyObject *
+line_config_set_output_values(line_config_object *self, PyObject *args)
+{
+	PyObject *values, *iter, *next, *val_stripped;
+	enum gpiod_line_value *valbuf;
+	Py_ssize_t num_values, pos;
+	int ret;
+
+	values = PyTuple_GetItem(args, 0);
+	if (!values)
+		return NULL;
+
+	num_values = PyObject_Size(values);
+	if (num_values < 0)
+		return NULL;
+
+	valbuf = PyMem_Calloc(num_values, sizeof(*valbuf));
+	if (!valbuf)
+		return PyErr_NoMemory();
+
+	iter = PyObject_GetIter(values);
+	if (!iter) {
+		PyMem_Free(valbuf);
+		return NULL;
+	}
+
+	for (pos = 0;; pos++) {
+		next = PyIter_Next(iter);
+		if (!next) {
+			Py_DECREF(iter);
+			break;
+		}
+
+		val_stripped = PyObject_GetAttrString(next, "value");
+		Py_DECREF(next);
+		if (!val_stripped) {
+			PyMem_Free(valbuf);
+			Py_DECREF(iter);
+			return NULL;
+		}
+
+		valbuf[pos] = PyLong_AsLong(val_stripped);
+		Py_DECREF(val_stripped);
+		if (PyErr_Occurred()) {
+			PyMem_Free(valbuf);
+			Py_DECREF(iter);
+			return NULL;
+		}
+	}
+
+	ret = gpiod_line_config_set_output_values(self->cfg,
+						  valbuf, num_values);
+	PyMem_Free(valbuf);
+	if (ret)
+		return Py_gpiod_SetErrFromErrno();	
+
+	Py_RETURN_NONE;
+}
+
 static PyMethodDef line_config_methods[] = {
 	{
 		.ml_name = "add_line_settings",
 		.ml_meth = (PyCFunction)line_config_add_line_settings,
 		.ml_flags = METH_VARARGS,
 	},
+	{
+		.ml_name = "set_output_values",
+		.ml_meth = (PyCFunction)line_config_set_output_values,
+		.ml_flags = METH_VARARGS,
+	},
 	{ }
 };
 
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index c0ac768..1dc2c71 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -402,6 +402,20 @@ class LineRequestConsumerString(TestCase):
             self.assertEqual(info.consumer, "?")
 
 
+class LineRequestSetOutputValues(TestCase):
+    def test_request_with_globally_set_output_values(self):
+        sim = gpiosim.Chip(num_lines=4)
+        with gpiod.request_lines(
+            sim.dev_path,
+            config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
+            output_values=(Value.ACTIVE, Value.INACTIVE, Value.ACTIVE, Value.INACTIVE),
+        ) as request:
+            self.assertEqual(sim.get_value(0), SimVal.ACTIVE)
+            self.assertEqual(sim.get_value(1), SimVal.INACTIVE)
+            self.assertEqual(sim.get_value(2), SimVal.ACTIVE)
+            self.assertEqual(sim.get_value(3), SimVal.INACTIVE)
+
+
 class ReconfigureRequestedLines(TestCase):
     def setUp(self):
         self.sim = gpiosim.Chip(num_lines=8, line_names={3: "foo", 4: "bar", 6: "baz"})
-- 
2.37.2

