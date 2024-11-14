Return-Path: <linux-gpio+bounces-13016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1BA9C8D42
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B54282567
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D433E136327;
	Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="dKuDWkVE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE643AD2
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595894; cv=none; b=sX8uq38e5f/SCyloQGOJg/RUwmIuGMthacHx1EZZxuJPMOze4hjP1f4d9lUtZUGjCTFiXIfASfFWUjaNojM5yf7BSWOQwBbGrEpz1/+QiiaveEip7CJK4FwW5i+HMRAE7LBp3zy6SjC9suypbB9hpWIrtPspD7TH04PBhA5keAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595894; c=relaxed/simple;
	bh=ZAPje8Lv+/hR8Gn0fHhrkcvWtUex3wV0GRH+5dkkX1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LEXuRWGQj5FzuiKsZcnDZkN7sjtqOG/1UTalCP/JXIwK2svPjGZdG8FAuwYWohZ1HGTjHapPv6kAyKobIRN4EfjIMJeGl6Gkhas1dZ4odK2gstVMZebCboJw3fFELeb1QcFWEL8u89JXHJitI6TxMLpRIDQqRg9E3/NBntZGLYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=dKuDWkVE; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 3389520AB4;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=ZAPje8Lv+/hR8Gn0fHhrkcvWtUex3wV0GRH+5dkkX1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKuDWkVEJdN/+J4NX0l86qMtkvgrUoc7Yv/So9HLzGy6oMLZELjNilT0oCx/qI+0m
	 XpvqYLNWY3nvPouejsDhL5caw4HsieqO3GZ+HRDM8lnviwYyoiuYmGU5keb7RMBtuX
	 4R0Dp3xOUoiqCoGh2V2T3pWNuEDi5iAStbA9C/NI=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 12/23] bindings: python: convert lines to offsets in LineRequest
Date: Thu, 14 Nov 2024 08:51:05 -0600
Message-Id: <20241114145116.2123714-13-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove `_check_line_name` in favor of a new function, `_line_to_offset`,
that converts a line reference to an offset.

This new function helps narrow types and simplifies the iteration logic
that is used to build objects to interface with `_ext.Request`.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 29 +++++++++++----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 81f2517..3f181c9 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -94,14 +94,15 @@ class LineRequest:
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
@@ -121,10 +122,7 @@ class LineRequest:
 
         lines = lines or self._lines
 
-        offsets = [
-            self._name_map[line] if self._check_line_name(line) else line
-            for line in lines
-        ]
+        offsets = [self._line_to_offset(line) for line in lines]
 
         buf = [None] * len(lines)
 
@@ -153,10 +151,7 @@ class LineRequest:
         """
         self._check_released()
 
-        mapped = {
-            self._name_map[line] if self._check_line_name(line) else line: values[line]
-            for line in values
-        }
+        mapped = {self._line_to_offset(line): value for line, value in values.items()}
 
         cast(_ext.Request, self._req).set_values(mapped)
 
@@ -186,7 +181,7 @@ class LineRequest:
                 lines = [lines]
 
             for line in lines:
-                offset = self._name_map[line] if self._check_line_name(line) else line
+                offset = self._line_to_offset(line)
                 line_settings[offset] = settings
 
         for offset in self.offsets:
-- 
2.34.1


