Return-Path: <linux-gpio+bounces-25826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2EB4FBD3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 14:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEF61161D0D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F1C33CE8B;
	Tue,  9 Sep 2025 12:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO/OrE55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2131C592
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422388; cv=none; b=bS0NdKMrAztGGoHVFsM6Q25jLC8Co14j7TKFSZAlmS7t1m3UARqyxUkIna5bY64UgobnXEiFX/fgSDEM03amLbQMeefGz+lA1PKwZGXil5Og0kLIxF7q6gUD1ROiHDWiolj2LGm9VZ/cpQu83QT9px+0s9srktiGEFHXwEOcpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422388; c=relaxed/simple;
	bh=p1D8XuPl/rzRFIryLa7DBlhR05ugoi2mwyTowx6I/Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9kCL3ohk+YlkL+Iytcjh15D0TVwhDHpvhSWo/pGhtsSTce4U8J1IbJTGd6NdJQI+O/aouwerOyakiM/179sJx9XN0Bm1f5yqaRImLta5+QKWcitweN2QJYlVQVB9wvrImHUmQCb9Ma01y4DQfNvCIcQWYgQhRcEJbl0K0Hj5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO/OrE55; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-406630d3b17so22289465ab.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422385; x=1758027185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWBdSytChLrcO+3nxL0KM4BsEIKYy1ztoNR88I6o8lE=;
        b=cO/OrE55qEF8s2I7OYaR9vUot6LD9ejnePz7fNXOu6WqP860PNrPospDr8DTyeNLHM
         EXQUrEOW07t4Ni6aM+IUaF7ODAnppzOUs5otlAz8LzbR6ZASMSgKGI6+L91VCwHm0/jF
         ITCaHFpg+sirmgFuSmvslH87gQe1NbIxt5wI/pqaYWmHWKL3JSqoeWEkAJHrysxNEdKT
         h19Ei05WpYJVAhvG/ewOn79o3KpVheX91SpN0IAgX/h3Zhs2XRBj/VBgZzPBl4yVCW02
         qUtGweQz2hYnv9CvCZj9HvK29jMOIbFsRKUdEIMakdJcBmAzziajnR0x5yC7x9v4RXzQ
         VWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422385; x=1758027185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWBdSytChLrcO+3nxL0KM4BsEIKYy1ztoNR88I6o8lE=;
        b=fKWdbgqA1V1vi0D7U9v/j5PdPcHG7OQn9Yn7Eu3aF8pDwpADR9/EgiM0SAJrx5qTIb
         jY2Ly34zSCGBi07lx8vajyKXEu/nrwKUuCPGlOunuZiXli/fZZTiRkqhJMBc2k54qfj0
         PcHTQ5kGZUZVANzSy+snP0IyivvgRUg1eACnM6jJJbrAIqIURSItVONV6FFHmdQ60X+r
         +jOJ52OEIiRPWQLl36VRUEtlvOfOT63rE7Q/jA7Y1NXbMulEDifFJrE6erBlF5Wnf/n8
         /ovc3nPtJA9L7oHev45kkZMYRijIauY55FpMHL023CG/Lo0+fUThuQ7GhnzB6XV8rV7X
         V3ug==
X-Gm-Message-State: AOJu0YzXbeauaG98Ih40DzP9U+B5YVNdIf2EvqWP5Uv6vTXELebVWpzh
	Do00eHgYAj4B3bfzSgTer6IY6Wb/YDM3Ej+XYON9ZMkfCksCONS28cxDKwpovA==
X-Gm-Gg: ASbGncvJVkdw1YDPSpQyQzozdh/tqg5Ztw0ombHte1hJ9Nc5uXyKlI2TBKmpnp4iy1C
	Kwopsb5cbbV+xXp2/jsUFueIjyD8q2otXiKbNCbEHEK6hOjJk/GPihg+MuCohWcSkkSfAsS/2D6
	ECI2NZ1tR+QIx3S5JBS7h1eBQiV0t92RrL6k2YL+S9h9HvO83y4L5AseZLgI+A79pulN23wDTti
	k02tRyFsTCT3XqTc6CR6dbr6PLTHAlypfOa0+ACxF9zEKIwBvEDnrllZzUPxsGI99H/bYCfeCvX
	F3sXp1gQ1TtrXWyTx375NGjaAKrdGi10B68JAsLhNJfRV4wvEPxpNGYuE5euXJogtNF2wXBRZkL
	4IQUXAE08DeGd1+GbrdqCiuZyiEc9cgxwvHWvbzQMncYen8kLsvuKPkKQMTWHR4Gj0WPd2Q==
X-Google-Smtp-Source: AGHT+IG/BitDO9r4yze8UyiopIpJ+/dyVQVWXj/NaNXTAC++zmVVVHHIi0R8S64Jmt4HBXQwyDNl/A==
X-Received: by 2002:a05:6e02:220e:b0:402:f40d:20f8 with SMTP id e9e14a558f8ab-402f40d24dbmr154715695ab.14.1757422385334;
        Tue, 09 Sep 2025 05:53:05 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5102e01ef56sm6863250173.27.2025.09.09.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:53:04 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2] bindings: python: use quoted types when casting
Date: Tue,  9 Sep 2025 07:53:00 -0500
Message-ID: <20250909125300.3507377-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linter check T006 [0] recommends using quotes around types (making them
strings) when casting values to a type to avoid the overhead of runtime
type evaluation.

This provides a small performance benefit at runtime [1].

  >>> timeit(lambda: cast(gpiod._ext.Request, "a"), number=100000000)
  6.4817840601317585
  >>> timeit(lambda: cast("gpiod._ext.Request", "a"), number=100000000)
  4.369633618975058

This also allows moving some imports behind type checking guards as they
are not required at runtime.

[0]: https://docs.astral.sh/ruff/rules/runtime-cast-value/
[1]: https://github.com/snok/flake8-type-checking/issues/119#issuecomment-2511022212

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py         | 18 +++++++++---------
 bindings/python/gpiod/line_request.py | 16 ++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index e7dd253..169488a 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -101,7 +101,7 @@ class Chip:
         longer be used after this method is called.
         """
         self._check_closed()
-        cast(_ext.Chip, self._chip).close()
+        cast("_ext.Chip", self._chip).close()
         self._chip = None
 
     def get_info(self) -> ChipInfo:
@@ -114,7 +114,7 @@ class Chip:
         self._check_closed()
 
         if not self._info:
-            self._info = cast(_ext.Chip, self._chip).get_info()
+            self._info = cast("_ext.Chip", self._chip).get_info()
 
         return self._info
 
@@ -139,7 +139,7 @@ class Chip:
 
         if not isinstance(id, int):
             try:
-                return cast(_ext.Chip, self._chip).line_offset_from_id(id)
+                return cast("_ext.Chip", self._chip).line_offset_from_id(id)
             except OSError as ex:
                 if ex.errno == ENOENT:
                     try:
@@ -158,7 +158,7 @@ class Chip:
 
     def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
         self._check_closed()
-        return cast(_ext.Chip, self._chip).get_line_info(
+        return cast("_ext.Chip", self._chip).get_line_info(
             self.line_offset_from_id(line), watch
         )
 
@@ -198,7 +198,7 @@ class Chip:
             Offset or name of the line to stop watching.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).unwatch_line_info(
+        return cast("_ext.Chip", self._chip).unwatch_line_info(
             self.line_offset_from_id(line)
         )
 
@@ -234,7 +234,7 @@ class Chip:
           This function may block if there are no available events in the queue.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).read_info_event()
+        return cast("_ext.Chip", self._chip).read_info_event()
 
     def _resolve_config_keys_to_offsets(
         self,
@@ -335,7 +335,7 @@ class Chip:
         if len(global_output_values):
             line_cfg.set_output_values(global_output_values)
 
-        req_internal = cast(_ext.Chip, self._chip).request_lines(
+        req_internal = cast("_ext.Chip", self._chip).request_lines(
             line_cfg, consumer, event_buffer_size
         )
         request = LineRequest(req_internal)
@@ -381,7 +381,7 @@ class Chip:
         Filesystem path used to open this chip.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).path
+        return cast("_ext.Chip", self._chip).path
 
     @property
     def fd(self) -> int:
@@ -389,4 +389,4 @@ class Chip:
         File descriptor associated with this chip.
         """
         self._check_closed()
-        return cast(_ext.Chip, self._chip).fd
+        return cast("_ext.Chip", self._chip).fd
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 0220ba3..69f86f6 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -8,7 +8,6 @@ from typing import TYPE_CHECKING, Optional, Union, cast
 from . import _ext
 from ._internal import poll_fd
 from .exception import RequestReleasedError
-from .line import Value
 from .line_settings import LineSettings, _line_settings_to_ext
 
 if TYPE_CHECKING:
@@ -17,6 +16,7 @@ if TYPE_CHECKING:
     from types import TracebackType
 
     from .edge_event import EdgeEvent
+    from .line import Value
 
 
 __all__ = ["LineRequest"]
@@ -76,7 +76,7 @@ class LineRequest:
         not be used after a call to this method.
         """
         self._check_released()
-        cast(_ext.Request, self._req).release()
+        cast("_ext.Request", self._req).release()
         self._req = None
 
     def get_value(self, line: Union[int, str]) -> Value:
@@ -122,9 +122,9 @@ class LineRequest:
 
         offsets = [self._line_to_offset(line) for line in lines]
 
-        buf = cast(list[Value], [None] * len(offsets))
+        buf = cast("list[Value]", [None] * len(offsets))
 
-        cast(_ext.Request, self._req).get_values(offsets, buf)
+        cast("_ext.Request", self._req).get_values(offsets, buf)
         return buf
 
     def set_value(self, line: Union[int, str], value: Value) -> None:
@@ -151,7 +151,7 @@ class LineRequest:
 
         mapped = {self._line_to_offset(line): value for line, value in values.items()}
 
-        cast(_ext.Request, self._req).set_values(mapped)
+        cast("_ext.Request", self._req).set_values(mapped)
 
     def reconfigure_lines(
         self,
@@ -186,7 +186,7 @@ class LineRequest:
             settings = line_settings.get(offset) or LineSettings()
             line_cfg.add_line_settings([offset], _line_settings_to_ext(settings))
 
-        cast(_ext.Request, self._req).reconfigure_lines(line_cfg)
+        cast("_ext.Request", self._req).reconfigure_lines(line_cfg)
 
     def wait_edge_events(
         self, timeout: Optional[Union[timedelta, float]] = None
@@ -220,7 +220,7 @@ class LineRequest:
         """
         self._check_released()
 
-        return cast(_ext.Request, self._req).read_edge_events(max_events)
+        return cast("_ext.Request", self._req).read_edge_events(max_events)
 
     def fileno(self) -> int:
         """
@@ -276,4 +276,4 @@ class LineRequest:
         File descriptor associated with this request.
         """
         self._check_released()
-        return cast(_ext.Request, self._req).fd
+        return cast("_ext.Request", self._req).fd
-- 
2.43.0


