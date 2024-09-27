Return-Path: <linux-gpio+bounces-10511-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1A2988A8C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C642528938F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BA91C2420;
	Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="PiOBCKXn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631FD1C231C
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463326; cv=none; b=K+/HVN/4WVUd7meRvffwuEQTGnwcpzMZiuJvFRk/5dHAoP4Lq0/x4njSk/4WX+iBK36w9C6Rw6C5u2sSQiNHcF2+fGmeeTU0GbDuW4Wiy7w5vemyncG6xWJ8W8yeNI4/7Gdg0oiAuxuQiaFa7zCyqH0Vo1o6FGzxthf9oYqU00o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463326; c=relaxed/simple;
	bh=S1Dl+GO+xUhDktgHMVn5tY8vnX3u5nozztWw4LPzdaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aTtbqYK9JNtbcYb58+wRA5EiNjmxTuLroIcifPUTUOE3OFO8TzUpbFUwpx2LSC0EXdnhv9x6e7EfBvun3fKbnd/p1xqMaQI0EN+IlpZbk7T/gtfHsBykUPaeG1Ej+pyztDVzjfHx/GpJGjib0vmQX/NXQBDTbRvBsrcU4J7lVWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=PiOBCKXn; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id A421321031;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=S1Dl+GO+xUhDktgHMVn5tY8vnX3u5nozztWw4LPzdaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PiOBCKXnJnxXfj5P+Pp8Q8fJzcsnEiMIS72kmpYV2XN7ou3FKTpfMWJT5My6aOmZl
	 rHWshd7gyYJqfHBaoqolj5bI37eKFREwwUqTVH8Qr58Eae94whti8Ox8Te5sTKTy47
	 cHFevsl+7ruO2jzNCUEHkWE0S/M0Tcby+AaMMV9U=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 10/22] bindings: python: convert lines to offsets in LineRequest
Date: Fri, 27 Sep 2024 13:53:46 -0500
Message-Id: <20240927-vfazio-mypy-v1-10-91a7c2e20884@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Remove `_check_line_name` in favor of a new function, `_line_to_offset`,
that converts a line reference to an offset.

This new function helps narrow types and simplifies the iteration logic
that is used to build objects to interface with `_ext.Request`.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 6c57f612a4167061945e798e93f069689723b583..a1ca64cfd82c32be5de3fc53f6c981026911bb9c 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -91,14 +91,15 @@ class LineRequest:
         """
         return self.get_values([line])[0]
 
-    def _check_line_name(self, line: Union[int, str]) -> bool:
-        if isinstance(line, str):
-            if line not in self._name_map:
-                raise ValueError("unknown line name: {}".format(line))
-
-            return True
-
-        return False
+    def _line_to_offset(self, line: Union[int, str]) -> int:
+        if isinstance(line, int):
+            return line
+        else:
+            _line: Union[int, None]
+            if (_line := self._name_map.get(line)) is None:
+                raise ValueError(f"unknown line name: {line}")
+            else:
+                return _line
 
     def get_values(
         self, lines: Optional[Iterable[Union[int, str]]] = None
@@ -119,10 +120,7 @@ class LineRequest:
 
         lines = lines or self._lines
 
-        offsets = [
-            self._name_map[line] if self._check_line_name(line) else line
-            for line in lines
-        ]
+        offsets = [self._line_to_offset(line) for line in lines]
 
         buf = [None] * len(lines)
 
@@ -152,10 +150,7 @@ class LineRequest:
         self._check_released()
         self._req = cast(_ext.Request, self._req)
 
-        mapped = {
-            self._name_map[line] if self._check_line_name(line) else line: values[line]
-            for line in values
-        }
+        mapped = {self._line_to_offset(line): value for line, value in values.items()}
 
         self._req.set_values(mapped)
 
@@ -186,7 +181,7 @@ class LineRequest:
                 lines = (lines,)
 
             for line in lines:
-                offset = self._name_map[line] if self._check_line_name(line) else line
+                offset = self._line_to_offset(line)
                 line_settings[offset] = settings
 
         for offset in self.offsets:

-- 
2.34.1

