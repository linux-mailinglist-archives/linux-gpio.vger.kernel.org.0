Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32755675170
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjATJpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjATJpa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:30 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3987AF17
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:28 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id g10so3558091wmo.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR2dqVhDh+olCelVxo17uAA/Tk7kYBlUgOIr5XZX4lY=;
        b=d/comnS2vUtn4st9RD+u3lzpxXk6Ne3Ntz5MyRQQH7g7HaeIJqoPwgo5TCexoUuM4W
         fIHRh4/aDbD60Vs17NVJ//ckoGeQu0A1/91KoalfpwjkQhNSvwlIznooH8rzHzgWnq8j
         uyploFzFsmCHkU+AQGAhji1uWU3xfvdAML+9lOo5Zjw0v5gMLsEhW7qUJ93L8DKJAMFa
         Nd3QlRNBvSqkwJnRVJRU3QUjhu7PzWrD1h8Iv++T2w9x9OGrpVZBNqDFw1WFwgsuTYTD
         0pR5AgP3QKbSaIlzYTS1qBNeyOJcFv7ExRftRKiAJvaknieBEq+boN0W6taoeKI0K6rR
         ZbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MR2dqVhDh+olCelVxo17uAA/Tk7kYBlUgOIr5XZX4lY=;
        b=eVOBB5nsJPL8TbjYCtxcWFxeQ+xdifF21BG40BXUpIUnz+ZL3OkHAWcp4yXRI0dO2w
         ALa678apM2Vwuxffy6s9ngUjkkWO1ZvPkRTZOqE5LT29cKOOsBKlh/92BBZsnyG2qOR1
         Y7z6SdoPGYEubo4hr3muXXZUdmCMTD+Xk8yZEIUXnDgzpXag3R1rasMuqM5t1urSmzk6
         vYd8KuiUNKpvNYH2XfChHTaDE+rLtoRbE6uNx7aBQsti41pksbYyk15ggM9lu0nneS0g
         hhv18M5eLN+AORj+2BNwWRj6lOfNfzr4sbnuJyBNnZq16kgfMReh2mHeUsyW3Qgu0b0/
         hX9A==
X-Gm-Message-State: AFqh2koGt3KgMaVi/EnVMl0A06CevOnkTJTyH+Ttx/d1FbqUTrfA8et+
        3OFDa0GQU4A9fDaaxQHbhe2AFA==
X-Google-Smtp-Source: AMrXdXtzqG3L5LBXmcpFuG+fDJxr4Rgr8gz0+mQTr2CN0Pca9H359K/QFnYPZce1iDwofgpPL1amJw==
X-Received: by 2002:a05:600c:4e08:b0:3db:1a41:663a with SMTP id b8-20020a05600c4e0800b003db1a41663amr7567434wmq.20.1674207927451;
        Fri, 20 Jan 2023 01:45:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 6/8] bindings: python: add the output_values argument to Chip.request_lines()
Date:   Fri, 20 Jan 2023 10:45:13 +0100
Message-Id: <20230120094515.40464-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120094515.40464-1-brgl@bgdev.pl>
References: <20230120094515.40464-1-brgl@bgdev.pl>
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

Add a new optional argument to Chip.request_lines() called output_values.
It accepts a dictionary of mappings between line names or offsets to the
output values the requested lines should be set to at request-time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/chip.py               | 30 ++++++++++
 bindings/python/gpiod/ext/line-config.c     | 64 +++++++++++++++++++++
 bindings/python/tests/tests_line_request.py | 55 ++++++++++++++++++
 3 files changed, 149 insertions(+)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index ad2eddd..97ff340 100644
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
+        output_values: Optional[dict[tuple[Union[int, str]], Value]] = None,
     ) -> LineRequest:
         """
         Request a set of lines for exclusive usage.
@@ -234,6 +237,10 @@ class Chip:
             Consumer string to use for this request.
           event_buffer_size:
             Size of the kernel edge event buffer to configure for this request.
+          output_values:
+            Dictionary mapping offsets or names to line.Value. This can be used
+            to set the desired output values globally while reusing LineSettings
+            for more lines.
 
         Returns:
           New LineRequest object.
@@ -260,10 +267,20 @@ class Chip:
                     )
                 )
 
+        # If we have global output values - map line names to offsets
+        if output_values:
+            mapped_output_values = {
+                self.line_offset_from_id(line): value
+                for line, value in output_values.items()
+            }
+        else:
+            mapped_output_values = None
+
         for lines, settings in config.items():
             offsets = list()
             name_map = dict()
             offset_map = dict()
+            global_output_values = list()
 
             if isinstance(lines, int) or isinstance(lines, str):
                 lines = (lines,)
@@ -271,6 +288,16 @@ class Chip:
             for line in lines:
                 offset = self.line_offset_from_id(line)
                 offsets.append(offset)
+
+                # If there's a global output value for this offset, store it in the
+                # list for later.
+                if mapped_output_values:
+                    global_output_values.append(
+                        mapped_output_values[offset]
+                        if offset in mapped_output_values
+                        else Value.INACTIVE
+                    )
+
                 if isinstance(line, str):
                     name_map[line] = offset
                     offset_map[offset] = line
@@ -279,6 +306,9 @@ class Chip:
                 offsets, _line_settings_to_ext(settings or LineSettings())
             )
 
+        if len(global_output_values):
+            line_cfg.set_output_values(global_output_values)
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
index c0ac768..096ec7c 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -402,6 +402,61 @@ class LineRequestConsumerString(TestCase):
             self.assertEqual(info.consumer, "?")
 
 
+class LineRequestSetOutputValues(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(
+            num_lines=4, line_names={0: "foo", 1: "bar", 2: "baz", 3: "xyz"}
+        )
+
+    def tearDown(self):
+        del self.sim
+
+    def test_request_with_globally_set_output_values(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
+            output_values={
+                0: Value.ACTIVE,
+                1: Value.INACTIVE,
+                2: Value.ACTIVE,
+                3: Value.INACTIVE,
+            },
+        ) as request:
+            self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+            self.assertEqual(self.sim.get_value(2), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(3), SimVal.INACTIVE)
+
+    def test_request_with_globally_set_output_values_with_mapping(self):
+        with gpiod.request_lines(
+            self.sim.dev_path,
+            config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
+            output_values={"baz": Value.ACTIVE, "foo": Value.ACTIVE},
+        ) as request:
+            self.assertEqual(self.sim.get_value(0), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+            self.assertEqual(self.sim.get_value(2), SimVal.ACTIVE)
+            self.assertEqual(self.sim.get_value(3), SimVal.INACTIVE)
+
+    def test_request_with_globally_set_output_values_bad_mapping(self):
+        with self.assertRaises(FileNotFoundError):
+            with gpiod.request_lines(
+                self.sim.dev_path,
+                config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
+                output_values={"foobar": Value.ACTIVE},
+            ) as request:
+                pass
+
+    def test_request_with_globally_set_output_values_bad_offset(self):
+        with self.assertRaises(ValueError):
+            with gpiod.request_lines(
+                self.sim.dev_path,
+                config={(0, 1, 2, 3): gpiod.LineSettings(direction=Direction.OUTPUT)},
+                output_values={5: Value.ACTIVE},
+            ) as request:
+                pass
+
+
 class ReconfigureRequestedLines(TestCase):
     def setUp(self):
         self.sim = gpiosim.Chip(num_lines=8, line_names={3: "foo", 4: "bar", 6: "baz"})
-- 
2.37.2

