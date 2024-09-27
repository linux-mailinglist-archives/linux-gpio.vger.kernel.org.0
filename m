Return-Path: <linux-gpio+bounces-10513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557A988A8E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20A281F222BA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048B31C2329;
	Fri, 27 Sep 2024 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="UVH03CDM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BF1C231D
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463326; cv=none; b=f08lXMCn+MqNptQz79TuIwKPvIYRkgGW/2mpp5jrSrnqJoEzG3nZOud1tDhE+q9EEUDEouhr25NwbomeW9a9L9v+AI+4/LYfyTqXg8xvqmFim4XwSqoPps+fdxbGDSgtCzOBoXpIhR3XGCO6oFMbq7Rd6UpSqDcF1hBt7XhFIxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463326; c=relaxed/simple;
	bh=J3W1hAtg9Dc7a/iGdygy+aiySByFUWr4AHS855iWF6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzsE1n2cO42eqJEvZKmL2U7j1vFe5Urpy8IH4R8SismbYc0ikj7BnqvjmjPJamilJraxT84AgbJWbhGmgcw9eEvqxKS1/vGRVmGTRwEmgLHKkW+0qtN4kmunlbcotcN1uANyVV2q4RkiDM/lj78WDcwZlkTAsETrsoDG/KWVya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=UVH03CDM; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 8DA5A20F65;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=J3W1hAtg9Dc7a/iGdygy+aiySByFUWr4AHS855iWF6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVH03CDMMNDVUMUn0r79AWsAMx69TauQJPpFugGowENLJX9L62TovrOrxpkgj1K+F
	 jPg8/EMl2dDJZaym8hOEFbOHdoOrYveBcQIhfIUDtP9hzXlQTrjJXIyf1OrqBIZ7wy
	 lSMm76cdboIKtBqj2ZjgS+TdLaC5rKiNx0JIqNA8=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 09/22] bindings: python: fix LineRequest union-attr type errors
Date: Fri, 27 Sep 2024 13:53:45 -0500
Message-Id: <20240927-vfazio-mypy-v1-9-91a7c2e20884@xes-inc.com>
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

Since `LineRequest._req` can be `None`, it's necessary to inform type
checkers of the state of the object to silence the union-attr errors.

Type checkers may not be able to infer that an object is not `None` from
an earlier call (such as `_check_released`).

Instead of littering the code with "# type: ignore" comments, use casts
to inform type checkers that objects are not `None`.

Using `assert` is another option, however this duplicates the logic in
`_check_released` so is redundant at best and, at worst, is not a safe
replacement as `assert` can be elided in optimized Python environments
and these checks need to be runtime enforced.

Also, convert singular ints or strs to a tuple instead of a list to keep
with the inferred variable type of `lines`.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 77d199ac64e9d3cc68d4a8b38dd0f571a24ab231..6c57f612a4167061945e798e93f069689723b583 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -6,7 +6,7 @@ from __future__ import annotations
 from collections.abc import Iterable
 from datetime import timedelta
 from types import TracebackType
-from typing import Optional, Union
+from typing import Optional, Union, cast
 
 from . import _ext
 from ._internal import poll_fd
@@ -74,6 +74,7 @@ class LineRequest:
         not be used after a call to this method.
         """
         self._check_released()
+        self._req = cast(_ext.Request, self._req)
         self._req.release()
         self._req = None
 
@@ -114,6 +115,7 @@ class LineRequest:
           List of logical line values.
         """
         self._check_released()
+        self._req = cast(_ext.Request, self._req)
 
         lines = lines or self._lines
 
@@ -148,6 +150,7 @@ class LineRequest:
             Dictionary mapping line offsets or names to desired values.
         """
         self._check_released()
+        self._req = cast(_ext.Request, self._req)
 
         mapped = {
             self._name_map[line] if self._check_line_name(line) else line: values[line]
@@ -173,13 +176,14 @@ class LineRequest:
             Any settings for non-requested lines are ignored.
         """
         self._check_released()
+        self._req = cast(_ext.Request, self._req)
 
         line_cfg = _ext.LineConfig()
         line_settings = {}
 
         for lines, settings in config.items():
             if isinstance(lines, int) or isinstance(lines, str):
-                lines = [lines]
+                lines = (lines,)
 
             for line in lines:
                 offset = self._name_map[line] if self._check_line_name(line) else line
@@ -222,6 +226,7 @@ class LineRequest:
           List of read EdgeEvent objects.
         """
         self._check_released()
+        self._req = cast(_ext.Request, self._req)
 
         return self._req.read_edge_events(max_events)
 
@@ -275,4 +280,5 @@ class LineRequest:
         File descriptor associated with this request.
         """
         self._check_released()
+        self._req = cast(_ext.Request, self._req)
         return self._req.fd

-- 
2.34.1

