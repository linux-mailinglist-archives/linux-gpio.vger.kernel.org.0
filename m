Return-Path: <linux-gpio+bounces-10510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40415988A90
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9163FB207DE
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6375A1C2320;
	Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="QJ/SoXLX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAA1C231B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463325; cv=none; b=Lo15JS05bs+HO4dE+Z+h57/PNWEsMSJ4UAcy8al0Le/PXpyM1IU16atpjerg0otLvV53z4td2WEzkmivoxt+vm8T5+ZAOb4gtX1/AA5G6nm+eDC6OupTvvw1HkYQkCGz4N9hDlz/+sKRHu2PBsXYItfIJoRChSNhxIWI6wjXEIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463325; c=relaxed/simple;
	bh=wVCQiLvLweTMNBYJUP91mB6k7TSSA3XIFrduCrSM7wY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDKUfVwxGzwqlGANltTCFn7p15Ac7FbfqsqXenJ/jIfMOFzgSQFvW4nci7oZg5EsAu00RN7x11nz/Y4rgGAzT8/zczpE9AUBOsj7bucBrsltHMMB6Fes6F1/3mxilNHwQ6+ssJOs0l3uk5QeZE5SES2NsWkXIpjgvGI3dbLvhME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=QJ/SoXLX; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 60E4D20F5E;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=wVCQiLvLweTMNBYJUP91mB6k7TSSA3XIFrduCrSM7wY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QJ/SoXLXwTbJPt5f7ZIlYGI2EdtCL1WHhrLpVqraaxhs0Qv/F9RrwdjGMf3nnw+bj
	 KheYjd0kEHI1jc9eDA4xyhwWenUJNbEncPMXKFPkBmnV0piKHA5FcIeHsEBrqpgqcJ
	 rOevT4hwtwWd2v04aPKRZWYNOnY3Uid71i++IiTI=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 07/22] bindings: python: fix Chip union-attr type errors
Date: Fri, 27 Sep 2024 13:53:43 -0500
Message-Id: <20240927-vfazio-mypy-v1-7-91a7c2e20884@xes-inc.com>
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

Since `Chip._chip` can be `None`, it's necessary to inform type checkers
of the state of the object to silence the union-attr errors.

Type checkers may not be able to infer that an object is not `None` from
an earlier call (such as `_check_closed`).

Instead of littering the code with "# type: ignore" comments, use casts
to inform type checkers that objects are not `None`.

Using `assert` is another option, however this duplicates the logic in
`_check_closed` so is redundant at best and, at worst, is not a safe
replacement as `assert` can be elided in optimized Python environments
and these checks need to be runtime enforced.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 4aa5677f94caf8c5d863aa6d75915a5b650de137..fe7bcfe082d6e9f6220093d3fc45ff232b5d0d17 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -7,7 +7,7 @@ from collections import Counter
 from datetime import timedelta
 from errno import ENOENT
 from types import TracebackType
-from typing import Optional, Union
+from typing import Optional, Union, cast
 
 from . import _ext
 from ._internal import poll_fd
@@ -97,6 +97,7 @@ class Chip:
         longer be used after this method is called.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
         self._chip.close()
         self._chip = None
 
@@ -108,6 +109,7 @@ class Chip:
           New gpiod.ChipInfo object.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
 
         if not self._info:
             self._info = self._chip.get_info()
@@ -132,6 +134,7 @@ class Chip:
           so - returns it.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
 
         if not isinstance(id, int):
             try:
@@ -154,6 +157,7 @@ class Chip:
 
     def _get_line_info(self, line: Union[int, str], watch: bool) -> LineInfo:
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
         return self._chip.get_line_info(self.line_offset_from_id(line), watch)
 
     def get_line_info(self, line: Union[int, str]) -> LineInfo:
@@ -192,6 +196,7 @@ class Chip:
             Offset or name of the line to stop watching.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
         return self._chip.unwatch_line_info(self.line_offset_from_id(line))
 
     def wait_info_event(
@@ -226,6 +231,7 @@ class Chip:
           This function may block if there are no available events in the queue.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
         return self._chip.read_info_event()
 
     def request_lines(
@@ -258,6 +264,7 @@ class Chip:
           New LineRequest object.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
 
         line_cfg = _ext.LineConfig()
 
@@ -362,6 +369,7 @@ class Chip:
         Filesystem path used to open this chip.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
         return self._chip.path
 
     @property
@@ -370,4 +378,5 @@ class Chip:
         File descriptor associated with this chip.
         """
         self._check_closed()
+        self._chip = cast(_ext.Chip, self._chip)
         return self._chip.fd

-- 
2.34.1

