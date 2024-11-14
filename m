Return-Path: <linux-gpio+bounces-13028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF0B9C8D4C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8C761F244A9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B9D13C9A3;
	Thu, 14 Nov 2024 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="jHezGXwj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021344C81
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595897; cv=none; b=mT4ddfcmkwX5+1CZIFVgbg6fDKo+CiETtLawX2L9h7HZBHINKc0J8xEXilsG/6Gg2rWi31hps4sykrqd4k1OyyBenjyDrkaEhXzoagtFlF0V6ZY8igxJZppyp/RxaIuHYwV/Prl/wXLAe3V65nbVWAUyLjq3HLDKbOPcSOzTG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595897; c=relaxed/simple;
	bh=KhkKPxF8lak37r03c84CKGcuxD0tq/clEjF9bWFFxL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rsvHkd7vDCbz74bLOJrUH5dSFjjAIOoH3RXKRj0niag+DnCF4zB/s03efaM1BUU8A3x+tlVj2wFiSfy1wbdBVpUlrWiV8ei7kiYLs+6ndXqAOe281N3rhtvdJUmM8XAL+FA8pfolU2UhbOMuV+SjZxisAIWWufWHflirAjLFD54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=jHezGXwj; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id EA81220AAE;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=KhkKPxF8lak37r03c84CKGcuxD0tq/clEjF9bWFFxL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHezGXwjHuN8tBfCe901xxFoBiKwDAtJ8sYVzZSCKxbzANY+mZ4TqNTw6bJOJBeQB
	 jdxMyHpQ8Eh3Nc3rfTqzxc/yyjqhFAqdh79pZuNaRJ8xoyqGSGsa8Z/8Oei3CwS5H+
	 QxmAcceqbOISFFIbsN3b/4h3sYBgB2Da1tj/adiA=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 09/23] bindings: python: fix Chip union-attr type errors
Date: Thu, 14 Nov 2024 08:51:02 -0600
Message-Id: <20241114145116.2123714-10-vfazio@xes-inc.com>
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

Since `Chip._chip` is typed to be `Optional` and because type checkers
may not be able to infer that an object is not `None` from an earlier
call (such as `_check_closed`) it is necessary to inform type checkers
of the state of the object to silence union-attr [0] errors.

Instead of littering the code with "# type: ignore" comments, use casts
to inform type checkers that objects are not `None`.

Using `assert` is another option, however this duplicates the logic in
`_check_closed` so is redundant at best and, at worst, is not a safe
replacement as `assert` can be elided in optimized Python environments
and these checks need to be runtime enforced.

[0]: https://mypy.readthedocs.io/en/stable/error_code_list.html#check-that-attribute-exists-in-each-union-item-union-attr
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 69ea777..482b98b 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -5,7 +5,7 @@ from __future__ import annotations
 
 from collections import Counter
 from errno import ENOENT
-from typing import TYPE_CHECKING, Optional, Union
+from typing import TYPE_CHECKING, Optional, Union, cast
 
 from . import _ext
 from ._internal import poll_fd
@@ -101,7 +101,7 @@ class Chip:
         longer be used after this method is called.
         """
         self._check_closed()
-        self._chip.close()
+        cast(_ext.Chip, self._chip).close()
         self._chip = None
 
     def get_info(self) -> ChipInfo:
@@ -114,7 +114,7 @@ class Chip:
         self._check_closed()
 
         if not self._info:
-            self._info = self._chip.get_info()
+            self._info = cast(_ext.Chip, self._chip).get_info()
 
         return self._info
 
@@ -139,7 +139,7 @@ class Chip:
 
         if not isinstance(id, int):
             try:
-                return self._chip.line_offset_from_id(id)
+                return cast(_ext.Chip, self._chip).line_offset_from_id(id)
             except OSError as ex:
                 if ex.errno == ENOENT:
                     try:
@@ -158,7 +158,9 @@ class Chip:
 
     def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
         self._check_closed()
-        return self._chip.get_line_info(self.line_offset_from_id(line), watch)
+        return cast(_ext.Chip, self._chip).get_line_info(
+            self.line_offset_from_id(line), watch
+        )
 
     def get_line_info(self, line: Union[int, str]) -> LineInfo:
         """
@@ -196,7 +198,9 @@ class Chip:
             Offset or name of the line to stop watching.
         """
         self._check_closed()
-        return self._chip.unwatch_line_info(self.line_offset_from_id(line))
+        return cast(_ext.Chip, self._chip).unwatch_line_info(
+            self.line_offset_from_id(line)
+        )
 
     def wait_info_event(
         self, timeout: Optional[Union[timedelta, float]] = None
@@ -230,7 +234,7 @@ class Chip:
           This function may block if there are no available events in the queue.
         """
         self._check_closed()
-        return self._chip.read_info_event()
+        return cast(_ext.Chip, self._chip).read_info_event()
 
     def request_lines(
         self,
@@ -326,7 +330,9 @@ class Chip:
         if len(global_output_values):
             line_cfg.set_output_values(global_output_values)
 
-        req_internal = self._chip.request_lines(line_cfg, consumer, event_buffer_size)
+        req_internal = cast(_ext.Chip, self._chip).request_lines(
+            line_cfg, consumer, event_buffer_size
+        )
         request = LineRequest(req_internal)
 
         request._chip_name = req_internal.chip_name
@@ -366,7 +372,7 @@ class Chip:
         Filesystem path used to open this chip.
         """
         self._check_closed()
-        return self._chip.path
+        return cast(_ext.Chip, self._chip).path
 
     @property
     def fd(self) -> int:
@@ -374,4 +380,4 @@ class Chip:
         File descriptor associated with this chip.
         """
         self._check_closed()
-        return self._chip.fd
+        return cast(_ext.Chip, self._chip).fd
-- 
2.34.1


