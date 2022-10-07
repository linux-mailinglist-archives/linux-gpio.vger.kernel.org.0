Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48BC65F7A0A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 16:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbiJGOzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 10:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiJGOzj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 10:55:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE11372FCD
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 07:55:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bv10so4105489wrb.4
        for <linux-gpio@vger.kernel.org>; Fri, 07 Oct 2022 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZHOCh49tSWcbSrqJSmKjjm+v/BrYvy77iFDZU56+Rc=;
        b=klLOf+0DtvVfqnk+kHrpPU/aZf56EDr/Eaw+KUB0aWWhyv2vRiNN9tJ5POW1f8QeNh
         xuMoAcFkEm1EaCbAh64SImXOxBGtablNrp5c5Pu0mrTk5sCmnub0db5kEb7f8I0SIgBc
         CAmAy6vs6CGi6ntGkMD+hA7Z0cbZdakpEJn2hCO2LLDv1rR21XTnRoBaAAc8gfYBqrco
         tmnvo0TwDVgw01fclqMh/0X49CVNVyz+bWDNag0uhNRRVgnL2u7XgSMEt2lstUKV6z8R
         y2NZZR+jrxrEv98n+OPJzNommWzFUL/W93JukXAGcJXF8uGLIDTDYfY2o/N1JM3P7ifQ
         8Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZHOCh49tSWcbSrqJSmKjjm+v/BrYvy77iFDZU56+Rc=;
        b=o6AnL0LSBAXe1/+CQVko7aP9voeIJ/F0PvbiYuKL5s9WywPcGg0upYGV7IEwFezzWa
         JEShmfkF43Bgn+KsVo7r8yv1CwLZYJLLanRQLup7dgmiSAujjMb36ZpcN3ANDiOPjvkq
         fRI/TgURB0Tsxou8dPnuDfyBFvLlWG2XHOLxGZTVbukd+1Dd232+0t+M8wMu9/NAsqV/
         CBLOm/sOz7k7Bossu6xDMn6JbkIJxnWv+DY/hx35Dd+Jrp9WySFZDUJWRXcStwQyQEpe
         WtS4DdJJeZtQOmitBwaW+Sf4KMIudIEw36kHsfqgq1um/5MXld739TeS74J7foiUSvVv
         5zlA==
X-Gm-Message-State: ACrzQf0TrMoQcBajPmdooa0CML+mRygOmCOFQTrf6ohvq9AqrGCLbYsg
        lhPSRf6qcespQo1oc/HusxHGZg==
X-Google-Smtp-Source: AMsMyM624uqYZCsnVgamzKzD3OBypObJh9SLeYahhiWqyCN0RnbqPN9cb/+2nV/XI8LPAzAKPx+eXA==
X-Received: by 2002:a5d:48c4:0:b0:22e:3908:9783 with SMTP id p4-20020a5d48c4000000b0022e39089783mr3364872wrs.284.1665154530762;
        Fri, 07 Oct 2022 07:55:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5a9e:bab6:45e8:abe8])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d50c8000000b0022e36c1113fsm2294707wrt.13.2022.10.07.07.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:55:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 4/4] bindings: python: implement python bindings for libgpiod v2
Date:   Fri,  7 Oct 2022 16:55:21 +0200
Message-Id: <20221007145521.329614-5-brgl@bgdev.pl>
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

This adds python bindings for libgpiod v2. As opposed to v1, they are
mostly written in python with just low-level elements written in C and
interfacing with libgpiod.so.

We've also added setup.py which will allow to use pip for managing the
bindings and split them into a separate meta-openembedded recipe.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 bindings/python/.gitignore                |   8 +
 bindings/python/Makefile.am               |  35 ++
 bindings/python/gpiod/Makefile.am         |  17 +
 bindings/python/gpiod/__init__.py         |  53 +++
 bindings/python/gpiod/chip.py             | 308 +++++++++++++++++
 bindings/python/gpiod/chip_info.py        |  21 ++
 bindings/python/gpiod/edge_event.py       |  46 +++
 bindings/python/gpiod/exception.py        |  20 ++
 bindings/python/gpiod/ext/Makefile.am     |  11 +
 bindings/python/gpiod/ext/chip.c          | 335 ++++++++++++++++++
 bindings/python/gpiod/ext/common.c        |  92 +++++
 bindings/python/gpiod/ext/internal.h      |  20 ++
 bindings/python/gpiod/ext/line-config.c   | 133 +++++++
 bindings/python/gpiod/ext/line-settings.c | 130 +++++++
 bindings/python/gpiod/ext/module.c        | 193 +++++++++++
 bindings/python/gpiod/ext/request.c       | 402 ++++++++++++++++++++++
 bindings/python/gpiod/info_event.py       |  33 ++
 bindings/python/gpiod/internal.py         |  19 +
 bindings/python/gpiod/line.py             |  56 +++
 bindings/python/gpiod/line_info.py        |  73 ++++
 bindings/python/gpiod/line_request.py     | 258 ++++++++++++++
 bindings/python/gpiod/line_settings.py    |  62 ++++
 bindings/python/setup.py                  |  47 +++
 configure.ac                              |   3 +
 24 files changed, 2375 insertions(+)
 create mode 100644 bindings/python/.gitignore
 create mode 100644 bindings/python/Makefile.am
 create mode 100644 bindings/python/gpiod/Makefile.am
 create mode 100644 bindings/python/gpiod/__init__.py
 create mode 100644 bindings/python/gpiod/chip.py
 create mode 100644 bindings/python/gpiod/chip_info.py
 create mode 100644 bindings/python/gpiod/edge_event.py
 create mode 100644 bindings/python/gpiod/exception.py
 create mode 100644 bindings/python/gpiod/ext/Makefile.am
 create mode 100644 bindings/python/gpiod/ext/chip.c
 create mode 100644 bindings/python/gpiod/ext/common.c
 create mode 100644 bindings/python/gpiod/ext/internal.h
 create mode 100644 bindings/python/gpiod/ext/line-config.c
 create mode 100644 bindings/python/gpiod/ext/line-settings.c
 create mode 100644 bindings/python/gpiod/ext/module.c
 create mode 100644 bindings/python/gpiod/ext/request.c
 create mode 100644 bindings/python/gpiod/info_event.py
 create mode 100644 bindings/python/gpiod/internal.py
 create mode 100644 bindings/python/gpiod/line.py
 create mode 100644 bindings/python/gpiod/line_info.py
 create mode 100644 bindings/python/gpiod/line_request.py
 create mode 100644 bindings/python/gpiod/line_settings.py
 create mode 100644 bindings/python/setup.py

diff --git a/bindings/python/.gitignore b/bindings/python/.gitignore
new file mode 100644
index 0000000..b603068
--- /dev/null
+++ b/bindings/python/.gitignore
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+build/
+__pycache__/
+dist/
+gpiod.egg-info/
+*.so
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
new file mode 100644
index 0000000..3212a8f
--- /dev/null
+++ b/bindings/python/Makefile.am
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+EXTRA_DIST = setup.py
+
+if WITH_TESTS
+
+BUILD_TESTS = 1
+
+endif
+
+all-local:
+	GPIOD_VERSION_STRING=$(VERSION_STR) \
+	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
+	$(PYTHON) setup.py build_ext --inplace \
+		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
+		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
+
+install-exec-local:
+	GPIOD_WITH_TESTS= \
+	$(PYTHON) setup.py install --prefix=$(prefix)
+
+SUBDIRS = gpiod
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
diff --git a/bindings/python/gpiod/Makefile.am b/bindings/python/gpiod/Makefile.am
new file mode 100644
index 0000000..b0f4126
--- /dev/null
+++ b/bindings/python/gpiod/Makefile.am
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+SUBDIRS = ext
+
+EXTRA_DIST = \
+	chip_info.py \
+	chip.py \
+	edge_event.py \
+	exception.py \
+	info_event.py \
+	__init__.py \
+	internal.py \
+	line_info.py \
+	line.py \
+	line_request.py \
+	line_settings.py 
diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
new file mode 100644
index 0000000..7854cfd
--- /dev/null
+++ b/bindings/python/gpiod/__init__.py
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+"""
+Python bindings for libgpiod.
+
+This module wraps the native C API of libgpiod in a set of python classes.
+"""
+
+from . import _ext
+from . import line
+from .chip import Chip
+from .chip_info import ChipInfo
+from .edge_event import EdgeEvent
+from .exception import ChipClosedError, RequestReleasedError
+from .info_event import InfoEvent
+from .line_request import LineRequest
+from .line_settings import LineSettings
+
+__version__ = _ext.__version__
+
+
+def is_gpiochip_device(path: str) -> bool:
+    """
+    Check if the file pointed to by path is a GPIO chip character device.
+
+    Args:
+      path
+        Path to the file that should be checked.
+
+    Returns:
+      Returns true if so, False otherwise.
+    """
+    return _ext.is_gpiochip_device(path)
+
+
+def request_lines(path: str, *args, **kwargs) -> LineRequest:
+    """
+    Open a GPIO chip pointed to by 'path', request lines according to the
+    configuration arguments, close the chip and return the request object.
+
+    Args:
+      path
+        Path to the GPIO character device file.
+      *args
+      **kwargs
+        See Chip.request_lines() for configuration arguments.
+
+    Returns:
+      Returns a new LineRequest object.
+    """
+    with Chip(path) as chip:
+        return chip.request_lines(*args, **kwargs)
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
new file mode 100644
index 0000000..7896958
--- /dev/null
+++ b/bindings/python/gpiod/chip.py
@@ -0,0 +1,308 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from .chip_info import ChipInfo
+from .exception import ChipClosedError
+from .info_event import InfoEvent
+from .internal import poll_fd
+from .line_info import LineInfo
+from .line_settings import LineSettings, _line_settings_to_ext_line_settings
+from .line_request import LineRequest
+from datetime import timedelta
+from errno import ENOENT
+from select import select
+from typing import Union, Optional
+
+
+class Chip:
+    """
+    Represents a GPIO chip.
+
+    Chip object manages all resources associated with the GPIO chip it represents.
+
+    The gpiochip device file is opened during the object's construction. The Chip
+    object's constructor takes the path to the GPIO chip device file
+    as the only argument.
+
+    Callers must close the chip by calling the close() method when it's no longer
+    used.
+
+    Example:
+
+        chip = gpiod.Chip(\"/dev/gpiochip0\")
+        do_something(chip)
+        chip.close()
+
+    The gpiod.Chip class also supports controlled execution ('with' statement).
+
+    Example:
+
+        with gpiod.Chip(path="/dev/gpiochip0") as chip:
+            do_something(chip)
+    """
+
+    def __init__(self, path: str):
+        """
+        Open a GPIO device.
+
+        Args:
+          path:
+            Path to the GPIO character device file.
+        """
+        self._chip = _ext.Chip(path)
+
+    def __bool__(self) -> bool:
+        """
+        Boolean conversion for GPIO chips.
+
+        Returns:
+          True if the chip is open and False if it's closed.
+        """
+        return True if self._chip else False
+
+    def __enter__(self):
+        """
+        Controlled execution enter callback.
+        """
+        self._check_closed()
+        return self
+
+    def __exit__(self, exc_type, exc_value, traceback) -> None:
+        """
+        Controlled execution exit callback.
+        """
+        self.close()
+
+    def _check_closed(self) -> None:
+        if not self._chip:
+            raise ChipClosedError()
+
+    def close(self) -> None:
+        """
+        Close the associated GPIO chip descriptor. The chip object must no
+        longer be used after this method is called.
+        """
+        self._check_closed()
+        self._chip.close()
+        self._chip = None
+
+    def get_info(self) -> ChipInfo:
+        """
+        Get the information about the chip.
+
+        Returns:
+          New gpiod.ChipInfo object.
+        """
+        self._check_closed()
+        return self._chip.get_info()
+
+    def map_line(self, id: Union[str, int]) -> int:
+        """
+        Map a line's identifier to its offset within the chip.
+
+        Args:
+          id:
+            Name of the GPIO line, its offset as a string or its offset as an
+            integer.
+
+        Returns:
+          If id is an integer - it's returned as is (unless it's out of range
+          for this chip). If it's a string, the method tries to interpret it as
+          the name of the line first and tries too perform a name lookup within
+          the chip. If it fails, it tries to convert the string to an integer
+          and check if it represents a valid offset within the chip and if
+          so - returns it.
+        """
+        self._check_closed()
+
+        if not isinstance(id, int):
+            try:
+                return self._chip.map_line(id)
+            except OSError as ex:
+                if ex.errno == ENOENT:
+                    try:
+                        offset = int(id)
+                    except ValueError:
+                        raise ex
+                else:
+                    raise ex
+        else:
+            offset = id
+
+        if offset >= self.get_info().num_lines:
+            raise ValueError("line offset of out range")
+
+        return offset
+
+    def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
+        self._check_closed()
+        return self._chip.get_line_info(self.map_line(line), watch)
+
+    def get_line_info(self, line: Union[int, str]) -> LineInfo:
+        """
+        Get the snapshot of information about the line at given offset.
+
+        Args:
+          line:
+            Offset or name of the GPIO line to get information for.
+
+        Returns:
+          New LineInfo object.
+        """
+        return self._get_line_info(line, watch=False)
+
+    def watch_line_info(self, line: Union[int, str]) -> LineInfo:
+        """
+        Get the snapshot of information about the line at given offset and
+        start watching it for future changes.
+
+        Args:
+          line:
+            Offset or name of the GPIO line to get information for.
+
+        Returns:
+          New gpiod.LineInfo object.
+        """
+        return self._get_line_info(line, watch=True)
+
+    def unwatch_line_info(self, line: Union[int, str]) -> None:
+        """
+        Stop watching a line for status changes.
+
+        Args:
+          line:
+            Offset or name of the line to stop watching.
+        """
+        self._check_closed()
+        return self._chip.unwatch_line_info(self.map_line(line))
+
+    def wait_info_event(
+        self, timeout: Optional[Union[timedelta, float]] = None
+    ) -> bool:
+        """
+        Wait for line status change events on any of the watched lines on the
+        chip.
+
+        Args:
+          timeout:
+            Wait time limit represented as either a datetime.timedelta object
+            or the number of seconds stored in a float.
+
+        Returns:
+          True if an info event is ready to be read from the chip, False if the
+          wait timed out without any events.
+        """
+        self._check_closed()
+
+        return poll_fd(self.fd, timeout)
+
+    def read_info_event(self) -> InfoEvent:
+        """
+        Read a single line status change event from the chip.
+
+        Returns:
+          New gpiod.InfoEvent object.
+
+        Note:
+          This function may block if there are no available events in the queue.
+        """
+        self._check_closed()
+        return self._chip.read_info_event()
+
+    def request_lines(
+        self,
+        config: dict[tuple[Union[int, str]], Optional[LineSettings]],
+        consumer: Optional[str] = None,
+        event_buffer_size: Optional[int] = None,
+    ) -> LineRequest:
+        """
+        Request a set of lines for exclusive usage.
+
+        Args:
+          config:
+            Dictionary mapping offsets or names (or tuples thereof) to
+            LineSettings. If None is passed as the value of the mapping,
+            default settings are used.
+          consumer:
+            Consumer string to use for this request.
+          event_buffer_size:
+            Size of the kernel edge event buffer to configure for this request.
+
+        Returns:
+          New LineRequest object.
+        """
+        self._check_closed()
+
+        line_cfg = _ext.LineConfig()
+
+        for lines, settings in config.items():
+            offsets = list()
+            name_map = dict()
+            offset_map = dict()
+
+            if isinstance(lines, int) or isinstance(lines, str):
+                lines = (lines,)
+
+            for line in lines:
+                offset = self.map_line(line)
+                offsets.append(offset)
+                if isinstance(line, str):
+                    name_map[line] = offset
+                    offset_map[offset] = line
+
+            if settings is None:
+                settings = LineSettings()
+
+            line_cfg.add_line_settings(
+                offsets, _line_settings_to_ext_line_settings(settings)
+            )
+
+        req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
+        request = LineRequest(req_internal)
+
+        request._offsets = req_internal.offsets
+        request._name_map = name_map
+        request._offset_map = offset_map
+
+        request._lines = list()
+        for off in request.offsets:
+            request._lines.append(offset_map[off] if off in offset_map else off)
+
+        return request
+
+    def __repr__(self) -> str:
+        """
+        Return a string that can be used to re-create this chip object.
+        """
+        if not self._chip:
+            return "<Chip CLOSED>"
+
+        return 'Chip("{}")'.format(self.path)
+
+    def __str__(self) -> str:
+        """
+        Return a user-friendly, human-readable description of this chip.
+        """
+        if not self._chip:
+            return "<Chip CLOSED>"
+
+        return '<Chip path="{}" fd={} info={}>'.format(
+            self.path, self.fd, self.get_info()
+        )
+
+    @property
+    def path(self) -> str:
+        """
+        Filesystem path used to open this chip.
+        """
+        self._check_closed()
+        return self._chip.path
+
+    @property
+    def fd(self) -> int:
+        """
+        File descriptor associated with this chip.
+        """
+        self._check_closed()
+        return self._chip.fd
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
new file mode 100644
index 0000000..a506b55
--- /dev/null
+++ b/bindings/python/gpiod/chip_info.py
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+
+from dataclasses import dataclass
+
+
+@dataclass(frozen=True, repr=False)
+class ChipInfo:
+    """
+    Snapshot of a chip's status.
+    """
+
+    name: str
+    label: str
+    num_lines: int
+
+    def __str__(self):
+        return '<ChipInfo name="{}" label="{}" num_lines={}>'.format(
+            self.name, self.label, self.num_lines
+        )
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
new file mode 100644
index 0000000..88f8e9b
--- /dev/null
+++ b/bindings/python/gpiod/edge_event.py
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from dataclasses import dataclass
+from enum import Enum
+
+
+@dataclass(frozen=True, init=False, repr=False)
+class EdgeEvent:
+    """
+    Immutable object containing data about a single edge event.
+    """
+
+    class Type(Enum):
+        RISING_EDGE = _ext.EDGE_EVENT_TYPE_RISING
+        FALLING_EDGE = _ext.EDGE_EVENT_TYPE_FALLING
+
+    event_type: Type
+    timestamp_ns: int
+    line_offset: int
+    global_seqno: int
+    line_seqno: int
+
+    def __init__(
+        self,
+        event_type: int,
+        timestamp_ns: int,
+        line_offset: int,
+        global_seqno: int,
+        line_seqno: int,
+    ):
+        object.__setattr__(self, "event_type", EdgeEvent.Type(event_type))
+        object.__setattr__(self, "timestamp_ns", timestamp_ns)
+        object.__setattr__(self, "line_offset", line_offset)
+        object.__setattr__(self, "global_seqno", global_seqno)
+        object.__setattr__(self, "line_seqno", line_seqno)
+
+    def __str__(self):
+        return "<EdgeEvent type={} timestamp_ns={} line_offset={} global_seqno={} line_seqno={}>".format(
+            self.event_type,
+            self.timestamp_ns,
+            self.line_offset,
+            self.global_seqno,
+            self.line_seqno,
+        )
diff --git a/bindings/python/gpiod/exception.py b/bindings/python/gpiod/exception.py
new file mode 100644
index 0000000..07ffaa6
--- /dev/null
+++ b/bindings/python/gpiod/exception.py
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+
+class ChipClosedError(Exception):
+    """
+    Error raised when an already closed chip is used.
+    """
+
+    def __init__(self):
+        super().__init__("I/O operation on closed chip")
+
+
+class RequestReleasedError(Exception):
+    """
+    Error raised when a released request is used.
+    """
+
+    def __init__(self):
+        super().__init__("GPIO lines have been released")
diff --git a/bindings/python/gpiod/ext/Makefile.am b/bindings/python/gpiod/ext/Makefile.am
new file mode 100644
index 0000000..9c81b17
--- /dev/null
+++ b/bindings/python/gpiod/ext/Makefile.am
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+EXTRA_DIST = \
+	chip.c \
+	common.c \
+	internal.h \
+	line-config.c \
+	line-settings.c \
+	module.c \
+	request.c
diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
new file mode 100644
index 0000000..47d5455
--- /dev/null
+++ b/bindings/python/gpiod/ext/chip.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_chip *chip;
+} chip_object;
+
+static int
+chip_init(chip_object *self, PyObject *args, PyObject *Py_UNUSED(ignored))
+{
+	char *path;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "s", &path);
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
+static void chip_finalize(chip_object *self)
+{
+	if (self->chip)
+		PyObject_CallMethod((PyObject *)self, "close", "");
+}
+
+static PyObject *chip_path(chip_object *self, void *Py_UNUSED(ignored))
+{
+	return PyUnicode_FromString(gpiod_chip_get_path(self->chip));
+}
+
+static PyObject *chip_fd(chip_object *self, void *Py_UNUSED(ignored))
+{
+	return PyLong_FromLong(gpiod_chip_get_fd(self->chip));
+}
+
+static PyGetSetDef chip_getset[] = {
+	{
+		.name = "path",
+		.get = (getter)chip_path,
+	},
+	{
+		.name = "fd",
+		.get = (getter)chip_fd,
+	},
+	{ }
+};
+
+static PyObject *chip_close(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	Py_BEGIN_ALLOW_THREADS;
+	gpiod_chip_close(self->chip);
+	Py_END_ALLOW_THREADS;
+	self->chip = NULL;
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *chip_get_info(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	struct gpiod_chip_info *info;
+	PyObject *type, *ret;
+
+	type = Py_gpiod_GetGlobalType("ChipInfo");
+	if (!type)
+		return NULL;
+
+	info = gpiod_chip_get_info(self->chip);
+	if (!info)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	 ret = PyObject_CallFunction(type, "ssI",
+				     gpiod_chip_info_get_name(info),
+				     gpiod_chip_info_get_label(info),
+				     gpiod_chip_info_get_num_lines(info));
+	 gpiod_chip_info_free(info);
+	 return ret;
+}
+
+static PyObject *make_line_info(struct gpiod_line_info *info)
+{
+	PyObject *type;
+
+	type = Py_gpiod_GetGlobalType("LineInfo");
+	if (!type)
+		return NULL;
+
+	return PyObject_CallFunction(type, "IsOsiOiiiiOi",
+				gpiod_line_info_get_offset(info),
+				gpiod_line_info_get_name(info),
+				gpiod_line_info_is_used(info) ?
+							Py_True : Py_False,
+				gpiod_line_info_get_consumer(info),
+				gpiod_line_info_get_direction(info),
+				gpiod_line_info_is_active_low(info) ?
+							Py_True : Py_False,
+				gpiod_line_info_get_bias(info),
+				gpiod_line_info_get_drive(info),
+				gpiod_line_info_get_edge_detection(info),
+				gpiod_line_info_get_event_clock(info),
+				gpiod_line_info_is_debounced(info) ?
+							Py_True : Py_False,
+				gpiod_line_info_get_debounce_period_us(info));
+}
+
+static PyObject *chip_get_line_info(chip_object *self, PyObject *args)
+{
+	struct gpiod_line_info *info;
+	unsigned int offset;
+	PyObject *info_obj;
+	int ret, watch;
+
+	ret = PyArg_ParseTuple(args, "Ip", &offset, &watch);
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
+	info_obj = make_line_info(info);
+	gpiod_line_info_free(info);
+	return info_obj;
+}
+
+static PyObject *
+chip_unwatch_line_info(chip_object *self, PyObject *args)
+{
+	unsigned int offset;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "I", &offset);
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
+static PyObject *
+chip_read_info_event(chip_object *self, PyObject *Py_UNUSED(ignored))
+{
+	PyObject *type, *info_obj, *event_obj;
+	struct gpiod_info_event *event;
+	struct gpiod_line_info *info;
+
+	type = Py_gpiod_GetGlobalType("InfoEvent");
+	if (!type)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	event = gpiod_chip_read_info_event(self->chip);
+	Py_END_ALLOW_THREADS;
+	if (!event)
+		return Py_gpiod_SetErrFromErrno();
+
+	info = gpiod_info_event_get_line_info(event);
+
+	info_obj = make_line_info(info);
+	if (!info_obj) {
+		gpiod_info_event_free(event);
+		return NULL;
+	}
+
+	event_obj = PyObject_CallFunction(type, "iKO",
+				gpiod_info_event_get_event_type(event),
+				gpiod_info_event_get_timestamp_ns(event),
+				info_obj);
+	Py_DECREF(info_obj);
+	gpiod_info_event_free(event);
+	return event_obj;
+}
+
+static PyObject *chip_map_line(chip_object *self, PyObject *args)
+{
+	int ret, offset;
+	char *name;
+
+	ret = PyArg_ParseTuple(args, "s", &name);
+	if (!ret)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	offset = gpiod_chip_get_line_offset_from_name(self->chip, name);
+	Py_END_ALLOW_THREADS;
+	if (offset < 0)
+		return Py_gpiod_SetErrFromErrno();
+
+	return PyLong_FromLong(offset);
+}
+
+static struct gpiod_request_config *
+make_request_config(PyObject *consumer_obj, PyObject *event_buffer_size_obj)
+{
+	struct gpiod_request_config *req_cfg;
+	size_t event_buffer_size;
+	const char *consumer;
+
+	req_cfg = gpiod_request_config_new();
+	if (!req_cfg) {
+		Py_gpiod_SetErrFromErrno();
+		return NULL;
+	}
+
+	if (consumer_obj != Py_None) {
+		consumer = PyUnicode_AsUTF8(consumer_obj);
+		if (!consumer) {
+			gpiod_request_config_free(req_cfg);
+			return NULL;
+		}
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	if (event_buffer_size_obj != Py_None) {
+		event_buffer_size = PyLong_AsSize_t(event_buffer_size_obj);
+		if (PyErr_Occurred()) {
+			gpiod_request_config_free(req_cfg);
+			return NULL;
+		}
+
+		gpiod_request_config_set_event_buffer_size(req_cfg,
+							   event_buffer_size);
+	}
+
+	return req_cfg;
+}
+
+static PyObject *chip_request_lines(chip_object *self, PyObject *args)
+{
+	PyObject *line_config, *consumer, *event_buffer_size, *req_obj;
+	struct gpiod_request_config *req_cfg;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_line_request *request;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "OOO",
+			       &line_config, &consumer, &event_buffer_size);
+	if (!ret)
+		return NULL;
+
+	line_cfg = Py_gpiod_LineConfigGetData(line_config);
+	if (!line_cfg)
+		return NULL;
+
+	req_cfg = make_request_config(consumer, event_buffer_size);
+	if (!req_cfg)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	request = gpiod_chip_request_lines(self->chip, req_cfg, line_cfg);
+	Py_END_ALLOW_THREADS;
+	gpiod_request_config_free(req_cfg);
+	if (!request)
+		return Py_gpiod_SetErrFromErrno();
+
+	req_obj = Py_gpiod_MakeRequestObject(request);
+	if (!req_obj)
+		gpiod_line_request_release(request);
+
+	return req_obj;
+}
+
+static PyMethodDef chip_methods[] = {
+	{
+		.ml_name = "close",
+		.ml_meth = (PyCFunction)chip_close,
+		.ml_flags = METH_NOARGS,
+	},
+	{
+		.ml_name = "get_info",
+		.ml_meth = (PyCFunction)chip_get_info,
+		.ml_flags = METH_NOARGS,
+	},
+	{
+		.ml_name = "get_line_info",
+		.ml_meth = (PyCFunction)chip_get_line_info,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "unwatch_line_info",
+		.ml_meth = (PyCFunction)chip_unwatch_line_info,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "read_info_event",
+		.ml_meth = (PyCFunction)chip_read_info_event,
+		.ml_flags = METH_NOARGS,
+	},
+	{
+		.ml_name = "map_line",
+		.ml_meth = (PyCFunction)chip_map_line,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "request_lines",
+		.ml_meth = (PyCFunction)chip_request_lines,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+PyTypeObject chip_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod._ext.Chip",
+	.tp_basicsize = sizeof(chip_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)chip_init,
+	.tp_finalize = (destructor)chip_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = chip_getset,
+	.tp_methods = chip_methods,
+};
diff --git a/bindings/python/gpiod/ext/common.c b/bindings/python/gpiod/ext/common.c
new file mode 100644
index 0000000..7e53c02
--- /dev/null
+++ b/bindings/python/gpiod/ext/common.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.h"
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
+PyObject *Py_gpiod_GetGlobalType(const char *type_name)
+{
+	PyObject *globals;
+
+	globals = PyEval_GetGlobals();
+	if (!globals)
+		return NULL;
+
+	return PyDict_GetItemString(globals, type_name);
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
diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
new file mode 100644
index 0000000..ed80034
--- /dev/null
+++ b/bindings/python/gpiod/ext/internal.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+#ifndef __LIBGPIOD_PYTHON_MODULE_H__
+#define __LIBGPIOD_PYTHON_MODULE_H__
+
+#include <gpiod.h>
+#include <Python.h>
+
+PyObject *_Py_gpiod_SetErrFromErrno(const char *filename);
+#define Py_gpiod_SetErrFromErrno() _Py_gpiod_SetErrFromErrno(__FILE__)
+
+PyObject *Py_gpiod_GetGlobalType(const char *type_name);
+unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
+void Py_gpiod_dealloc(PyObject *self);
+PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request);
+struct gpiod_line_config *Py_gpiod_LineConfigGetData(PyObject *obj);
+struct gpiod_line_settings *Py_gpiod_LineSettingsGetData(PyObject *obj);
+
+#endif /* __LIBGPIOD_PYTHON_MODULE_H__ */
diff --git a/bindings/python/gpiod/ext/line-config.c b/bindings/python/gpiod/ext/line-config.c
new file mode 100644
index 0000000..173ca6b
--- /dev/null
+++ b/bindings/python/gpiod/ext/line-config.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_line_config *cfg;
+} line_config_object;
+
+static int line_config_init(line_config_object *self,
+		       PyObject *Py_UNUSED(args), PyObject *Py_UNUSED(ignored))
+{
+	self->cfg = gpiod_line_config_new();
+	if (!self->cfg) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	return 0;
+}
+
+static void line_config_finalize(line_config_object *self)
+{
+	if (self->cfg)
+		gpiod_line_config_free(self->cfg);
+}
+
+static unsigned int *make_offsets(PyObject *obj, Py_ssize_t len)
+{
+	unsigned int *offsets;
+	PyObject *offset;
+	Py_ssize_t i;
+
+	offsets = PyMem_Calloc(len, sizeof(unsigned int));
+	if (!offsets)
+		return (unsigned int *)PyErr_NoMemory();
+
+	for (i = 0; i < len; i++) {
+		offset = PyList_GetItem(obj, i);
+		if (!offset) {
+			PyMem_Free(offsets);
+			return NULL;
+		}
+
+		offsets[i] = Py_gpiod_PyLongAsUnsignedInt(offset);
+		if (PyErr_Occurred()) {
+			PyMem_Free(offsets);
+			return NULL;
+		}
+	}
+
+	return offsets;
+}
+
+static PyObject *
+line_config_add_line_settings(line_config_object *self, PyObject *args)
+{
+	PyObject *offsets_obj, *settings_obj;
+	struct gpiod_line_settings *settings;
+	unsigned int *offsets;
+	Py_ssize_t num_offsets;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "OO", &offsets_obj, &settings_obj);
+	if (!ret)
+		return NULL;
+
+	num_offsets = PyObject_Size(offsets_obj);
+	if (num_offsets < 0)
+		return NULL;
+
+	offsets = make_offsets(offsets_obj, num_offsets);
+	if (!offsets)
+		return NULL;
+
+	settings = Py_gpiod_LineSettingsGetData(settings_obj);
+	if (!settings) {
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	ret = gpiod_line_config_add_line_settings(self->cfg, offsets,
+						  num_offsets, settings);
+	PyMem_Free(offsets);
+	if (ret)
+		return Py_gpiod_SetErrFromErrno();
+
+	Py_RETURN_NONE;
+}
+
+static PyMethodDef line_config_methods[] = {
+	{
+		.ml_name = "add_line_settings",
+		.ml_meth = (PyCFunction)line_config_add_line_settings,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+PyTypeObject line_config_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod._ext.LineConfig",
+	.tp_basicsize = sizeof(line_config_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)line_config_init,
+	.tp_finalize = (destructor)line_config_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_methods = line_config_methods,
+};
+
+struct gpiod_line_config *Py_gpiod_LineConfigGetData(PyObject *obj)
+{
+	line_config_object *line_cfg;
+	PyObject *type;
+
+	type = PyObject_Type(obj);
+	if (!type)
+		return NULL;
+
+	if ((PyTypeObject *)type != &line_config_type) {
+		PyErr_SetString(PyExc_TypeError,
+				"not a gpiod._ext.LineConfig object");
+		Py_DECREF(type);
+		return NULL;
+	}
+	Py_DECREF(type);
+
+	line_cfg = (line_config_object *)obj;
+
+	return line_cfg->cfg;
+}
diff --git a/bindings/python/gpiod/ext/line-settings.c b/bindings/python/gpiod/ext/line-settings.c
new file mode 100644
index 0000000..bd2a66a
--- /dev/null
+++ b/bindings/python/gpiod/ext/line-settings.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_line_settings *settings;
+} line_settings_object;
+
+static int set_int_prop(struct gpiod_line_settings *settings, int val,
+			int (*func)(struct gpiod_line_settings *, int))
+{
+	int ret;
+
+	ret = func(settings, val);
+	if (ret) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	return 0;
+}
+
+static int
+line_settings_init(line_settings_object *self, PyObject *args, PyObject *kwargs)
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
+	int direction, edge, bias, drive, active_low, event_clock, output_value,
+	    ret;
+	unsigned long debounce_period;
+
+	ret = PyArg_ParseTupleAndKeywords(args, kwargs, "IIIIpdII", kwlist,
+			&direction, &edge, &bias, &drive, &active_low,
+			&debounce_period, &event_clock, &output_value);
+	if (!ret)
+		return -1;
+
+	self->settings = gpiod_line_settings_new();
+	if (!self->settings) {
+		Py_gpiod_SetErrFromErrno();
+		return -1;
+	}
+
+	ret = set_int_prop(self->settings, direction,
+			   gpiod_line_settings_set_direction);
+	if (ret)
+		return -1;
+
+	ret = set_int_prop(self->settings, edge,
+			   gpiod_line_settings_set_edge_detection);
+	if (ret)
+		return -1;
+
+	ret = set_int_prop(self->settings, bias,
+			   gpiod_line_settings_set_bias);
+	if (ret)
+		return -1;
+
+	ret = set_int_prop(self->settings, drive,
+			   gpiod_line_settings_set_drive);
+	if (ret)
+		return -1;
+
+	gpiod_line_settings_set_active_low(self->settings, active_low);
+	gpiod_line_settings_set_debounce_period_us(self->settings,
+						   debounce_period);
+
+	ret = set_int_prop(self->settings, edge,
+			   gpiod_line_settings_set_edge_detection);
+	if (ret)
+		return -1;
+
+	ret = set_int_prop(self->settings, output_value,
+			   gpiod_line_settings_set_output_value);
+	if (ret)
+		return -1;
+
+	return 0;
+}
+
+static void line_settings_finalize(line_settings_object *self)
+{
+	if (self->settings)
+		gpiod_line_settings_free(self->settings);
+}
+
+PyTypeObject line_settings_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod._ext.LineSettings",
+	.tp_basicsize = sizeof(line_settings_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)line_settings_init,
+	.tp_finalize = (destructor)line_settings_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+};
+
+struct gpiod_line_settings *Py_gpiod_LineSettingsGetData(PyObject *obj)
+{
+	line_settings_object *settings;
+	PyObject *type;
+
+	type = PyObject_Type(obj);
+	if (!type)
+		return NULL;
+
+	if ((PyTypeObject *)type != &line_settings_type) {
+		PyErr_SetString(PyExc_TypeError,
+				"not a gpiod._ext.LineSettings object");
+		Py_DECREF(type);
+		return NULL;
+	}
+	Py_DECREF(type);
+
+	settings = (line_settings_object *)obj;
+
+	return settings->settings;
+}
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
new file mode 100644
index 0000000..8725ef2
--- /dev/null
+++ b/bindings/python/gpiod/ext/module.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <gpiod.h>
+#include <Python.h>
+
+struct module_const {
+	const char *name;
+	long val;
+};
+
+static const struct module_const module_constants[] = {
+	{
+		.name = "VALUE_INACTIVE",
+		.val = GPIOD_LINE_VALUE_INACTIVE,
+	},
+	{
+		.name = "VALUE_ACTIVE",
+		.val = GPIOD_LINE_VALUE_ACTIVE,
+	},
+	{
+		.name = "DIRECTION_AS_IS",
+		.val = GPIOD_LINE_DIRECTION_AS_IS,
+	},
+	{
+		.name = "DIRECTION_INPUT",
+		.val = GPIOD_LINE_DIRECTION_INPUT,
+	},
+	{
+		.name = "DIRECTION_OUTPUT",
+		.val = GPIOD_LINE_DIRECTION_OUTPUT,
+	},
+	{
+		.name = "BIAS_AS_IS",
+		.val = GPIOD_LINE_BIAS_AS_IS,
+	},
+	{
+		.name = "BIAS_UNKNOWN",
+		.val = GPIOD_LINE_BIAS_UNKNOWN,
+	},
+	{
+		.name = "BIAS_DISABLED",
+		.val = GPIOD_LINE_BIAS_DISABLED,
+	},
+	{
+		.name = "BIAS_PULL_UP",
+		.val = GPIOD_LINE_BIAS_PULL_UP,
+	},
+	{
+		.name = "BIAS_PULL_DOWN",
+		.val = GPIOD_LINE_BIAS_PULL_DOWN,
+	},
+	{
+		.name = "DRIVE_PUSH_PULL",
+		.val = GPIOD_LINE_DRIVE_PUSH_PULL,
+	},
+	{
+		.name = "DRIVE_OPEN_DRAIN",
+		.val = GPIOD_LINE_DRIVE_OPEN_DRAIN,
+	},
+	{
+		.name = "DRIVE_OPEN_SOURCE",
+		.val = GPIOD_LINE_DRIVE_OPEN_SOURCE,
+	},
+	{
+		.name = "EDGE_NONE",
+		.val = GPIOD_LINE_EDGE_NONE,
+	},
+	{
+		.name = "EDGE_FALLING",
+		.val = GPIOD_LINE_EDGE_FALLING,
+	},
+	{
+		.name = "EDGE_RISING",
+		.val = GPIOD_LINE_EDGE_RISING,
+	},
+	{
+		.name = "EDGE_BOTH",
+		.val = GPIOD_LINE_EDGE_BOTH,
+	},
+	{
+		.name = "CLOCK_MONOTONIC",
+		.val = GPIOD_LINE_EVENT_CLOCK_MONOTONIC,
+	},
+	{
+		.name = "CLOCK_REALTIME",
+		.val = GPIOD_LINE_EVENT_CLOCK_REALTIME,
+	},
+	{
+		.name = "CLOCK_HTE",
+		.val = GPIOD_LINE_EVENT_CLOCK_HTE,
+	},
+	{
+		.name = "EDGE_EVENT_TYPE_RISING",
+		.val = GPIOD_EDGE_EVENT_RISING_EDGE,
+	},
+	{
+		.name = "EDGE_EVENT_TYPE_FALLING",
+		.val = GPIOD_EDGE_EVENT_FALLING_EDGE,
+	},
+	{
+		.name = "INFO_EVENT_TYPE_LINE_REQUESTED",
+		.val = GPIOD_INFO_EVENT_LINE_REQUESTED,
+	},
+	{
+		.name = "INFO_EVENT_TYPE_LINE_RELEASED",
+		.val = GPIOD_INFO_EVENT_LINE_RELEASED,
+	},
+	{
+		.name = "INFO_EVENT_TYPE_LINE_CONFIG_CHANGED",
+		.val = GPIOD_INFO_EVENT_LINE_CONFIG_CHANGED,
+	},
+	{ }
+};
+
+static PyObject *
+module_is_gpiochip_device(PyObject *Py_UNUSED(self), PyObject *args)
+{
+	const char *path;
+	int ret;
+
+	ret =  PyArg_ParseTuple(args, "s", &path);
+	if (!ret)
+		return NULL;
+
+	return PyBool_FromLong(gpiod_is_gpiochip_device(path));
+}
+
+static PyMethodDef module_methods[] = {
+	{
+		.ml_name = "is_gpiochip_device",
+		.ml_meth = (PyCFunction)module_is_gpiochip_device,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "gpiod._ext",
+	.m_methods = module_methods,
+};
+
+extern PyTypeObject chip_type;
+extern PyTypeObject line_config_type;
+extern PyTypeObject line_settings_type;
+extern PyTypeObject request_type;
+
+static PyTypeObject *types[] = {
+	&chip_type,
+	&line_config_type,
+	&line_settings_type,
+	&request_type,
+	NULL,
+};
+
+PyMODINIT_FUNC PyInit__ext(void)
+{
+	const struct module_const *modconst;
+	PyTypeObject **type;
+	PyObject *module;
+	int ret;
+
+	module = PyModule_Create(&module_def);
+	if (!module)
+		return NULL;
+
+	ret = PyModule_AddStringConstant(module, "__version__",
+					 gpiod_version_string());
+	if (ret) {
+		Py_DECREF(module);
+		return NULL;
+	}
+
+	for (type = types; *type; type++) {
+		ret = PyModule_AddType(module, *type);
+		if (ret) {
+			Py_DECREF(module);
+			return NULL;
+		}
+	}
+
+	for (modconst = module_constants; modconst->name; modconst++) {
+		ret = PyModule_AddIntConstant(module,
+					      modconst->name, modconst->val);
+		if (ret) {
+			Py_DECREF(module);
+			return NULL;
+		}
+	}
+
+	return module;
+}
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
new file mode 100644
index 0000000..36b5b48
--- /dev/null
+++ b/bindings/python/gpiod/ext/request.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include "internal.h"
+
+typedef struct {
+	PyObject_HEAD;
+	struct gpiod_line_request *request;
+	unsigned int *offsets;
+	int *values;
+	size_t num_lines;
+} request_object;
+
+static int request_init(PyObject *Py_UNUSED(ignored0),
+			PyObject *Py_UNUSED(ignored1),
+			PyObject *Py_UNUSED(ignored2))
+{
+	PyErr_SetString(PyExc_NotImplementedError,
+			"_ext.LineRequest cannot be instantiated");
+
+	return -1;
+}
+
+static void request_finalize(request_object *self)
+{
+	if (self->request)
+		PyObject_CallMethod((PyObject *)self, "release", "");
+
+	if (self->offsets)
+		PyMem_Free(self->offsets);
+
+	if (self->values)
+		PyMem_Free(self->values);
+}
+
+static PyObject *
+request_num_lines(request_object *self, void *Py_UNUSED(ignored))
+{
+	return PyLong_FromUnsignedLong(
+			gpiod_line_request_get_num_lines(self->request));
+}
+
+static PyObject *request_offsets(request_object *self, void *Py_UNUSED(ignored))
+{
+	PyObject *lines, *line;
+	unsigned int *offsets;
+	size_t num_lines, i;
+	int ret;
+
+	num_lines = gpiod_line_request_get_num_lines(self->request);
+
+	offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
+	if (!offsets)
+		return PyErr_NoMemory();
+
+	gpiod_line_request_get_offsets(self->request, offsets);
+
+	lines = PyList_New(num_lines);
+	if (!lines) {
+		PyMem_Free(offsets);
+		return NULL;
+	}
+
+	for (i = 0; i < num_lines; i++) {
+		line = PyLong_FromUnsignedLong(offsets[i]);
+		if (!lines) {
+			Py_DECREF(lines);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(lines, i, line);
+		if (ret) {
+			Py_DECREF(line);
+			Py_DECREF(lines);
+			PyMem_Free(offsets);
+			return NULL;
+		}
+	}
+
+	PyMem_Free(offsets);
+	return lines;
+}
+
+static PyObject *request_fd(request_object *self, void *Py_UNUSED(ignored))
+{
+	return PyLong_FromLong(gpiod_line_request_get_fd(self->request));
+}
+
+static PyGetSetDef request_getset[] = {
+	{
+		.name = "num_lines",
+		.get = (getter)request_num_lines,
+	},
+	{
+		.name = "offsets",
+		.get = (getter)request_offsets,
+	},
+	{
+		.name = "fd",
+		.get = (getter)request_fd,
+	},
+	{ }
+};
+
+static PyObject *
+request_release(request_object *self, PyObject *Py_UNUSED(ignored))
+{
+	Py_BEGIN_ALLOW_THREADS;
+	gpiod_line_request_release(self->request);
+	Py_END_ALLOW_THREADS;
+	self->request = NULL;
+
+	Py_RETURN_NONE;
+}
+
+static void clear_buffers(request_object *self)
+{
+	memset(self->offsets, 0, self->num_lines * sizeof(unsigned int));
+	memset(self->values, 0, self->num_lines * sizeof(int));
+}
+
+static PyObject *request_get_values(request_object *self, PyObject *args)
+{
+	PyObject *offsets, *values, *val, *type, *iter, *next;
+	Py_ssize_t num_offsets;
+	unsigned int pos;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "OO", &offsets, &values);
+	if (!ret)
+		return NULL;
+
+	num_offsets = PyObject_Size(offsets);
+	if (num_offsets < 0)
+		return NULL;
+
+	type = Py_gpiod_GetGlobalType("Value");
+	if (!type)
+		return NULL;
+
+	iter = PyObject_GetIter(offsets);
+	if (!iter)
+		return NULL;
+
+	clear_buffers(self);
+
+	for (pos = 0;; pos++) {
+		next = PyIter_Next(iter);
+		if (!next) {
+			Py_DECREF(iter);
+			break;
+		}
+
+		self->offsets[pos] = Py_gpiod_PyLongAsUnsignedInt(next);
+		Py_DECREF(next);
+		if (PyErr_Occurred()) {
+			Py_DECREF(iter);
+			return NULL;
+		}
+	}
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_get_values_subset(self->request,
+						   self->num_lines,
+						   self->offsets,
+						   self->values);
+	Py_END_ALLOW_THREADS;
+	if (ret)
+		return Py_gpiod_SetErrFromErrno();
+
+	for (pos = 0; pos < num_offsets; pos++) {
+		val = PyObject_CallFunction(type, "i", self->values[pos]);
+		if (!val)
+			return NULL;
+
+		ret = PyList_SetItem(values, pos, val);
+		if (ret) {
+			Py_DECREF(val);
+			return NULL;
+		}
+	}
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *request_set_values(request_object *self, PyObject *args)
+{
+	PyObject *values, *key, *val, *val_stripped;
+	Py_ssize_t pos = 0;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "O", &values);
+	if (!ret)
+		return NULL;
+
+	clear_buffers(self);
+
+	while (PyDict_Next(values, &pos, &key, &val)) {
+		self->offsets[pos] = Py_gpiod_PyLongAsUnsignedInt(key);
+		if (PyErr_Occurred())
+			return NULL;
+
+		val_stripped = PyObject_GetAttrString(val, "value");
+		if (!val_stripped)
+			return NULL;
+
+		self->values[pos] = PyLong_AsLong(val_stripped);
+		Py_DECREF(val_stripped);
+		if (PyErr_Occurred())
+			return NULL;
+	}
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_set_values_subset(self->request,
+						   self->num_lines,
+						   self->offsets,
+						   self->values);
+	Py_END_ALLOW_THREADS;
+	if (ret)
+		return Py_gpiod_SetErrFromErrno();
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *request_reconfigure_lines(request_object *self, PyObject *args)
+{
+	struct gpiod_line_config *line_cfg;
+	PyObject *line_cfg_obj;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "O", &line_cfg_obj);
+	if (!ret)
+		return NULL;
+
+	line_cfg = Py_gpiod_LineConfigGetData(line_cfg_obj);
+	if (!line_cfg)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_reconfigure_lines(self->request, line_cfg);
+	Py_END_ALLOW_THREADS;
+	if (ret)
+		return Py_gpiod_SetErrFromErrno();
+
+	Py_RETURN_NONE;
+}
+
+static PyObject *request_read_edge_event(request_object *self, PyObject *args)
+{
+	PyObject *max_events_obj, *event_obj, *events, *type;
+	struct gpiod_edge_event_buffer *buffer;
+	size_t max_events, num_events, i;
+	struct gpiod_edge_event *event;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "O", &max_events_obj);
+	if (!ret)
+		return NULL;
+
+	if (max_events_obj != Py_None) {
+		max_events = PyLong_AsSize_t(max_events_obj);
+		if (PyErr_Occurred())
+			return NULL;
+	} else {
+		max_events = 64;
+	}
+
+	type = Py_gpiod_GetGlobalType("EdgeEvent");
+	if (!type)
+		return NULL;
+
+	buffer = gpiod_edge_event_buffer_new(max_events);
+	if (!buffer)
+		return Py_gpiod_SetErrFromErrno();
+
+	Py_BEGIN_ALLOW_THREADS;
+	ret = gpiod_line_request_read_edge_event(self->request,
+						 buffer, max_events);
+	Py_END_ALLOW_THREADS;
+	if (ret < 0) {
+		gpiod_edge_event_buffer_free(buffer);
+		return NULL;
+	}
+
+	num_events = ret;
+
+	events = PyList_New(num_events);
+	if (!events) {
+		gpiod_edge_event_buffer_free(buffer);
+		return NULL;
+	}
+
+	for (i = 0; i < num_events; i++) {
+		event = gpiod_edge_event_buffer_get_event(buffer, i);
+		if (!event) {
+			gpiod_edge_event_buffer_free(buffer);
+			Py_DECREF(events);
+			return NULL;
+		}
+
+		event_obj = PyObject_CallFunction(type, "iKiii",
+				gpiod_edge_event_get_event_type(event),
+				gpiod_edge_event_get_timestamp_ns(event),
+				gpiod_edge_event_get_line_offset(event),
+				gpiod_edge_event_get_global_seqno(event),
+				gpiod_edge_event_get_line_seqno(event));
+		if (!event_obj) {
+			gpiod_edge_event_buffer_free(buffer);
+			Py_DECREF(events);
+			return NULL;
+		}
+
+		ret = PyList_SetItem(events, i, event_obj);
+		if (ret) {
+			gpiod_edge_event_buffer_free(buffer);
+			Py_DECREF(event_obj);
+			Py_DECREF(events);
+			return NULL;
+		}
+	}
+
+	gpiod_edge_event_buffer_free(buffer);
+
+	return events;
+}
+
+static PyMethodDef request_methods[] = {
+	{
+		.ml_name = "release",
+		.ml_meth = (PyCFunction)request_release,
+		.ml_flags = METH_NOARGS,
+	},
+	{
+		.ml_name = "get_values",
+		.ml_meth = (PyCFunction)request_get_values,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "set_values",
+		.ml_meth = (PyCFunction)request_set_values,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "reconfigure_lines",
+		.ml_meth = (PyCFunction)request_reconfigure_lines,
+		.ml_flags = METH_VARARGS,
+	},
+	{
+		.ml_name = "read_edge_event",
+		.ml_meth = (PyCFunction)request_read_edge_event,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+PyTypeObject request_type = {
+	PyVarObject_HEAD_INIT(NULL, 0)
+	.tp_name = "gpiod._ext.Request",
+	.tp_basicsize = sizeof(request_object),
+	.tp_flags = Py_TPFLAGS_DEFAULT,
+	.tp_new = PyType_GenericNew,
+	.tp_init = (initproc)request_init,
+	.tp_finalize = (destructor)request_finalize,
+	.tp_dealloc = (destructor)Py_gpiod_dealloc,
+	.tp_getset = request_getset,
+	.tp_methods = request_methods,
+};
+
+PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request)
+{
+	request_object *req_obj;
+	unsigned int *offsets;
+	size_t num_lines;
+	int *values;
+
+	num_lines = gpiod_line_request_get_num_lines(request);
+
+	req_obj = PyObject_New(request_object, &request_type);
+	if (!req_obj)
+		return NULL;
+
+	offsets = PyMem_Calloc(num_lines, sizeof(unsigned int));
+	if (!offsets) {
+		Py_DECREF(req_obj);
+		return NULL;
+	}
+
+	values = PyMem_Calloc(num_lines, sizeof(int));
+	if (!values) {
+		PyMem_Free(offsets);
+		Py_DECREF(req_obj);
+		return NULL;
+	}
+
+	req_obj->request = request;
+	req_obj->offsets = offsets;
+	req_obj->values = values;
+	req_obj->num_lines = num_lines;
+
+	return (PyObject *)req_obj;
+}
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
new file mode 100644
index 0000000..78b1459
--- /dev/null
+++ b/bindings/python/gpiod/info_event.py
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from .line_info import LineInfo
+from dataclasses import dataclass
+from enum import Enum
+
+
+@dataclass(frozen=True, init=False, repr=False)
+class InfoEvent:
+    """
+    Immutable object containing data about a single line info event.
+    """
+
+    class Type(Enum):
+        LINE_REQUESTED = _ext.INFO_EVENT_TYPE_LINE_REQUESTED
+        LINE_RELEASED = _ext.INFO_EVENT_TYPE_LINE_RELEASED
+        LINE_CONFIG_CHANGED = _ext.INFO_EVENT_TYPE_LINE_CONFIG_CHANGED
+
+    event_type: Type
+    timestamp_ns: int
+    line_info: LineInfo
+
+    def __init__(self, event_type: int, timestamp_ns: int, line_info: LineInfo):
+        object.__setattr__(self, "event_type", InfoEvent.Type(event_type))
+        object.__setattr__(self, "timestamp_ns", timestamp_ns)
+        object.__setattr__(self, "line_info", line_info)
+
+    def __str__(self):
+        return "<InfoEvent type={} timestamp_ns={} line_info={}>".format(
+            self.event_type, self.timestamp_ns, self.line_info
+        )
diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/internal.py
new file mode 100644
index 0000000..37e8b62
--- /dev/null
+++ b/bindings/python/gpiod/internal.py
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from datetime import timedelta
+from select import select
+from typing import Optional, Union
+
+
+def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
+    if timeout is None:
+        timeout = 0.0
+
+    if isinstance(timeout, timedelta):
+        sec = timeout.total_seconds()
+    else:
+        sec = timeout
+
+    readable, _, _ = select([fd], [], [], sec)
+    return True if fd in readable else False
diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
new file mode 100644
index 0000000..c5d5ddf
--- /dev/null
+++ b/bindings/python/gpiod/line.py
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+
+from . import _ext
+from enum import Enum
+
+
+class Value(Enum):
+    """Logical line states."""
+
+    INACTIVE = _ext.VALUE_INACTIVE
+    ACTIVE = _ext.VALUE_ACTIVE
+
+
+class Direction(Enum):
+    """Direction settings."""
+
+    AS_IS = _ext.DIRECTION_AS_IS
+    INPUT = _ext.DIRECTION_INPUT
+    OUTPUT = _ext.DIRECTION_OUTPUT
+
+
+class Bias(Enum):
+    """Internal bias settings."""
+
+    AS_IS = _ext.BIAS_AS_IS
+    UNKNOWN = _ext.BIAS_UNKNOWN
+    DISABLED = _ext.BIAS_DISABLED
+    PULL_UP = _ext.BIAS_PULL_UP
+    PULL_DOWN = _ext.BIAS_PULL_DOWN
+
+
+class Drive(Enum):
+    """Drive settings."""
+
+    PUSH_PULL = _ext.DRIVE_PUSH_PULL
+    OPEN_DRAIN = _ext.DRIVE_OPEN_DRAIN
+    OPEN_SOURCE = _ext.DRIVE_OPEN_SOURCE
+
+
+class Edge(Enum):
+    """Edge detection settings."""
+
+    NONE = _ext.EDGE_NONE
+    RISING = _ext.EDGE_RISING
+    FALLING = _ext.EDGE_FALLING
+    BOTH = _ext.EDGE_BOTH
+
+
+class Clock(Enum):
+    """Event clock settings."""
+
+    MONOTONIC = _ext.CLOCK_MONOTONIC
+    REALTIME = _ext.CLOCK_REALTIME
+    HTE = _ext.CLOCK_HTE
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
new file mode 100644
index 0000000..9a6c9bf
--- /dev/null
+++ b/bindings/python/gpiod/line_info.py
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from dataclasses import dataclass
+from datetime import timedelta
+from gpiod.line import Direction, Bias, Drive, Edge, Clock
+
+
+@dataclass(frozen=True, init=False, repr=False)
+class LineInfo:
+    """
+    Snapshot of a line's status.
+    """
+
+    offset: int
+    name: str
+    used: bool
+    consumer: str
+    direction: Direction
+    active_low: bool
+    bias: Bias
+    drive: Drive
+    edge_detection: Edge
+    event_clock: Clock
+    debounced: bool
+    debounce_period: timedelta
+
+    def __init__(
+        self,
+        offset: int,
+        name: str,
+        used: bool,
+        consumer: str,
+        direction: int,
+        active_low: bool,
+        bias: int,
+        drive: int,
+        edge_detection: int,
+        event_clock: int,
+        debounced: bool,
+        debounce_period_us: int,
+    ):
+        object.__setattr__(self, "offset", offset)
+        object.__setattr__(self, "name", name)
+        object.__setattr__(self, "used", used)
+        object.__setattr__(self, "consumer", consumer)
+        object.__setattr__(self, "direction", Direction(direction))
+        object.__setattr__(self, "active_low", active_low)
+        object.__setattr__(self, "bias", Bias(bias))
+        object.__setattr__(self, "drive", Drive(drive))
+        object.__setattr__(self, "edge_detection", Edge(edge_detection))
+        object.__setattr__(self, "event_clock", Clock(event_clock))
+        object.__setattr__(self, "debounced", debounced)
+        object.__setattr__(
+            self, "debounce_period", timedelta(microseconds=debounce_period_us)
+        )
+
+    def __str__(self):
+        return '<LineInfo offset={} name="{}" used={} consumer="{}" direction={} active_low={} bias={} drive={} edge_detection={} event_clock={} debounced={} debounce_period={}>'.format(
+            self.offset,
+            self.name,
+            self.used,
+            self.consumer,
+            self.direction,
+            self.active_low,
+            self.bias,
+            self.drive,
+            self.edge_detection,
+            self.event_clock,
+            self.debounced,
+            self.debounce_period,
+        )
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
new file mode 100644
index 0000000..a3ee392
--- /dev/null
+++ b/bindings/python/gpiod/line_request.py
@@ -0,0 +1,258 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from .edge_event import EdgeEvent
+from .exception import RequestReleasedError
+from .internal import poll_fd
+from .line import Value
+from .line_settings import LineSettings, _line_settings_to_ext_line_settings
+from collections.abc import Iterable
+from datetime import timedelta
+from typing import Optional, Union
+
+
+class LineRequest:
+    """
+    Stores the context of a set of requested GPIO lines.
+    """
+
+    def __init__(self, req: _ext.Request):
+        """
+        DON'T USE
+
+        LineRequest objects can only be instantiated by a Chip parent. This is
+        not part of stable API.
+        """
+        self._req = req
+
+    def __bool__(self) -> bool:
+        """
+        Boolean conversion for GPIO line requests.
+
+        Returns:
+          True if the request is live and False if it's been released.
+        """
+        return True if self._req else False
+
+    def __enter__(self):
+        """
+        Controlled execution enter callback.
+        """
+        self._check_released()
+        return self
+
+    def __exit__(self, exc_type, exc_value, traceback):
+        """
+        Controlled execution exit callback.
+        """
+        self.release()
+
+    def _check_released(self) -> None:
+        if not self._req:
+            raise RequestReleasedError()
+
+    def release(self) -> None:
+        """
+        Release this request and free all associated resources. The object must
+        not be used after a call to this method.
+        """
+        self._check_released()
+        self._req.release()
+        self._req = None
+
+    def get_value(self, line: Union[int, str]) -> Value:
+        """
+        Get a single GPIO line value.
+
+        Args:
+          line:
+            Offset or name of the line to get value for.
+
+        Returns:
+          Logical value of the line.
+        """
+        return self.get_values([line])[0]
+
+    def get_values(
+        self, lines: Optional[Iterable[Union[int, str]]] = None
+    ) -> list[Value]:
+        """
+        Get values of a set of GPIO lines.
+
+        Args:
+          lines:
+            List of names or offsets of GPIO lines to get values for. Can be
+            None in which case all requested lines will be read.
+
+        Returns:
+          List of logical line values.
+        """
+        self._check_released()
+
+        if lines is None:
+            lines = self._lines
+
+        offsets = [None] * len(lines)
+
+        for i, line in enumerate(lines):
+            if isinstance(line, str):
+                if line not in self._name_map:
+                    raise ValueError("unknown line name: {}".format(line))
+
+                offsets[i] = self._name_map[line]
+            else:
+                offsets[i] = line
+
+        buf = [None] * len(lines)
+
+        self._req.get_values(offsets, buf)
+        return buf
+
+    def set_value(self, line: Union[int, str], value: Value) -> None:
+        """
+        Set the value of a single GPIO line.
+
+        Args:
+          line:
+            Offset or name of the line to set.
+          value:
+            New value.
+        """
+        self.set_values({line: value})
+
+    def set_values(self, values: dict[Union[int, str], Value]) -> None:
+        """
+        Set the values of a subset of GPIO lines.
+
+        Args:
+          values:
+            Dictionary mapping line offsets or names to desired values.
+        """
+        self._check_released()
+
+        mapped = dict()
+        for i, line in enumerate(values):
+            if isinstance(line, str):
+                if line not in self._name_map:
+                    raise ValueError("unknown line name: {}".format(line))
+
+                mapped[self._name_map[line]] = values[line]
+            else:
+                mapped[line] = values[line]
+
+        self._req.set_values(mapped)
+
+    def reconfigure_lines(
+        self, config: dict[tuple[Union[int, str]], LineSettings]
+    ) -> None:
+        """
+        Reconfigure requested lines.
+
+        Args:
+          config
+            Dictionary mapping offsets or names (or tuples thereof) to
+            LineSettings. If None is passed as the value of the mapping,
+            default settings are used.
+        """
+        self._check_released()
+
+        line_cfg = _ext.LineConfig()
+
+        for lines, settings in config.items():
+            if isinstance(lines, int) or isinstance(lines, str):
+                lines = [lines]
+
+            offsets = [None] * len(lines)
+
+            for i, line in enumerate(lines):
+                if isinstance(line, str):
+                    if line not in self._name_map:
+                        raise ValueError("unknown line name: {}".format(line))
+
+                    offsets[i] = self._name_map[line]
+                else:
+                    offsets[i] = line
+
+            line_cfg.add_line_settings(
+                offsets, _line_settings_to_ext_line_settings(settings)
+            )
+
+        self._req.reconfigure_lines(line_cfg)
+
+    def wait_edge_event(
+        self, timeout: Optional[Union[timedelta, float]] = None
+    ) -> bool:
+        """
+        Wait for edge events on any of the requested lines.
+
+        Args:
+          timeout:
+            Wait time limit expressed as either a datetime.timedelta object
+            or the number of seconds stored in a float.
+
+        Returns:
+          True if events are ready to be read. False on timeout.
+        """
+        self._check_released()
+
+        return poll_fd(self.fd, timeout)
+
+    def read_edge_event(self, max_events: Optional[int] = None) -> list[EdgeEvent]:
+        """
+        Read a number of edge events from a line request.
+
+        Args:
+          max_events:
+            Maximum number of events to read.
+
+        Returns:
+          List of read EdgeEvent objects.
+        """
+        self._check_released()
+
+        return self._req.read_edge_event(max_events)
+
+    def __str__(self):
+        """
+        Return a user-friendly, human-readable description of this request.
+        """
+        if not self._req:
+            return "<LineRequest RELEASED>"
+
+        return "<LineRequest num_lines={} offsets={} fd={}>".format(
+            self.num_lines, self.offsets, self.fd
+        )
+
+    @property
+    def num_lines(self) -> int:
+        """
+        Number of requested lines.
+        """
+        self._check_released()
+        return len(self._offsets)
+
+    @property
+    def offsets(self) -> list[int]:
+        """
+        List of requested offsets. Lines requested by name are mapped to their
+        offsets.
+        """
+        self._check_released()
+        return self._offsets
+
+    @property
+    def lines(self) -> list[Union[int, str]]:
+        """
+        List of requested lines. Lines requested by name are listed as such.
+        """
+        self._check_released()
+        return self._lines
+
+    @property
+    def fd(self) -> int:
+        """
+        File descriptor associated with this request.
+        """
+        self._check_released()
+        return self._req.fd
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
new file mode 100644
index 0000000..1315b0c
--- /dev/null
+++ b/bindings/python/gpiod/line_settings.py
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from . import _ext
+from dataclasses import dataclass
+from datetime import timedelta
+from gpiod.line import Direction, Bias, Drive, Edge, Clock, Value
+
+
+@dataclass(repr=False)
+class LineSettings:
+    """
+    Stores a set of line properties.
+    """
+
+    direction: Direction = Direction.AS_IS
+    edge_detection: Edge = Edge.NONE
+    bias: Bias = Bias.AS_IS
+    drive: Drive = Drive.PUSH_PULL
+    active_low: bool = False
+    debounce_period: timedelta = timedelta()
+    event_clock: Clock = Clock.MONOTONIC
+    output_value: Value = Value.INACTIVE
+
+    # __repr__ generated by @dataclass uses repr for enum members resulting in
+    # an unusable representation as those are of the form: <NAME: $value>
+    def __repr__(self):
+        return "LineSettings(direction={}, edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={})".format(
+            str(self.direction),
+            str(self.edge_detection),
+            str(self.bias),
+            str(self.drive),
+            self.active_low,
+            repr(self.debounce_period),
+            str(self.event_clock),
+            str(self.output_value),
+        )
+
+    def __str__(self):
+        return "<LineSettings direction={} edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={}>".format(
+            self.direction,
+            self.edge_detection,
+            self.bias,
+            self.drive,
+            self.active_low,
+            self.debounce_period,
+            self.event_clock,
+            self.output_value,
+        )
+
+
+def _line_settings_to_ext_line_settings(settings: LineSettings) -> _ext.LineSettings:
+    return _ext.LineSettings(
+        direction=settings.direction.value,
+        edge_detection=settings.edge_detection.value,
+        bias=settings.bias.value,
+        drive=settings.drive.value,
+        active_low=settings.active_low,
+        debounce_period=int(settings.debounce_period.total_seconds() * 1000000),
+        event_clock=settings.event_clock.value,
+        output_value=settings.output_value.value,
+    )
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
new file mode 100644
index 0000000..ec8f99d
--- /dev/null
+++ b/bindings/python/setup.py
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from os import environ
+from setuptools import setup, Extension, find_packages
+
+gpiod_ext = Extension(
+    "gpiod._ext",
+    sources=[
+        "gpiod/ext/chip.c",
+        "gpiod/ext/common.c",
+        "gpiod/ext/line-config.c",
+        "gpiod/ext/line-settings.c",
+        "gpiod/ext/module.c",
+        "gpiod/ext/request.c",
+    ],
+    define_macros=[("_GNU_SOURCE", "1")],
+    libraries=["gpiod"],
+    extra_compile_args=["-Wall", "-Wextra"],
+)
+
+gpiosim_ext = Extension(
+    "tests.gpiosim._ext",
+    sources=["tests/gpiosim/ext.c"],
+    define_macros=[("_GNU_SOURCE", "1")],
+    libraries=["gpiosim"],
+    extra_compile_args=["-Wall", "-Wextra"],
+)
+
+extensions = [gpiod_ext]
+with_tests = bool(environ["GPIOD_WITH_TESTS"])
+if with_tests:
+    extensions.append(gpiosim_ext)
+
+# FIXME Find a better way to get the version
+version = None
+try:
+    version = environ["GPIOD_VERSION_STR"]
+except KeyError:
+    pass
+
+setup(
+    name="gpiod",
+    packages=find_packages(include=["gpiod"]),
+    ext_modules=extensions,
+    version=version,
+)
diff --git a/configure.ac b/configure.ac
index 6ac1d8e..048b2ac 100644
--- a/configure.ac
+++ b/configure.ac
@@ -244,8 +244,11 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
 		 bindings/python/Makefile
+		 bindings/python/gpiod/Makefile
+		 bindings/python/gpiod/ext/Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
+		 bindings/python/tests/gpiosim/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
-- 
2.34.1

