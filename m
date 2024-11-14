Return-Path: <linux-gpio+bounces-13020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F05099C8D44
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A92381F24259
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E88E6F2F3;
	Thu, 14 Nov 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="bHBvF/5X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0454D9FE
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595895; cv=none; b=dR0lwy3/VVBG4y8fclYyn3Nisu82uiMoxgk8u9fpfbKbu4uPq+RoFMTi3vWAWc34upeTb3321+vlxjHIQ73o+2YGYbc9a8NrcInoy3Y/91l9UtGfi3fEXY5JDCSVZy9kk/dIBCVV56plNnX67euDfCpgTZRr/EJIM4tB2m/75j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595895; c=relaxed/simple;
	bh=xePOxLQmu+k04jd8EiUx7g+K1U4mxeZ1DY2jQpuYac4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hg3kL+POg+aoFTO/hJQ3TA8PyS9elgnOJmq2kx1j5HuqHgoUMbd2Ifp3L70VB00yilq1ThOZ4KqrP/i9oeArRykrHNZysLUw9LfW0CSVpc46mUqnQEdOExc4VcNaVe7gN+JZxWVMO+3YS7jdC8rrX2ItTvc1W2HtJeKtxpZeIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=bHBvF/5X; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 1F1ED20AB2;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=xePOxLQmu+k04jd8EiUx7g+K1U4mxeZ1DY2jQpuYac4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHBvF/5X7wKKUy5ZjsMz4nMYUjQ6bjUB9g0t3BSSg3iFfgxgpSNqtHyRMZBI4I5Eg
	 p8YX1kzBn0Plm/pawjatZ2ssZsMWlATqodKAnVqyZcVqWgR53cWZ2WZzGSowpGgKwz
	 O47qx8NHZcZ5W479k7ZUwHm9zSP8QA1u4XotfAgg=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 11/23] bindings: python: fix LineRequest union-attr type errors
Date: Thu, 14 Nov 2024 08:51:04 -0600
Message-Id: <20241114145116.2123714-12-vfazio@xes-inc.com>
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

Since `LineRequest._req` is typed to be `Optional` and because type
checkers may not be able to infer that an object is not `None` from an
earlier call (such as `_check_released`) it is necessary to inform type
checkers of the state of the object to silence union-attr [0] errors.

Instead of littering the code with "# type: ignore" comments, use casts
to inform type checkers that objects are not `None`.

Using `assert` is another option, however this duplicates the logic in
`_check_released` so is redundant at best and, at worst, is not a safe
replacement as `assert` can be elided in optimized Python environments
and these checks need to be runtime enforced.

[0]: https://mypy.readthedocs.io/en/stable/error_code_list.html#check-that-attribute-exists-in-each-union-item-union-attr
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index f8bbf64..81f2517 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -3,7 +3,7 @@
 
 from __future__ import annotations
 
-from typing import TYPE_CHECKING, Optional, Union
+from typing import TYPE_CHECKING, Optional, Union, cast
 
 from . import _ext
 from ._internal import poll_fd
@@ -78,7 +78,7 @@ class LineRequest:
         not be used after a call to this method.
         """
         self._check_released()
-        self._req.release()
+        cast(_ext.Request, self._req).release()
         self._req = None
 
     def get_value(self, line: Union[int, str]) -> Value:
@@ -128,7 +128,7 @@ class LineRequest:
 
         buf = [None] * len(lines)
 
-        self._req.get_values(offsets, buf)
+        cast(_ext.Request, self._req).get_values(offsets, buf)
         return buf
 
     def set_value(self, line: Union[int, str], value: Value) -> None:
@@ -158,7 +158,7 @@ class LineRequest:
             for line in values
         }
 
-        self._req.set_values(mapped)
+        cast(_ext.Request, self._req).set_values(mapped)
 
     def reconfigure_lines(
         self,
@@ -193,7 +193,7 @@ class LineRequest:
             settings = line_settings.get(offset) or LineSettings()
             line_cfg.add_line_settings([offset], _line_settings_to_ext(settings))
 
-        self._req.reconfigure_lines(line_cfg)
+        cast(_ext.Request, self._req).reconfigure_lines(line_cfg)
 
     def wait_edge_events(
         self, timeout: Optional[Union[timedelta, float]] = None
@@ -227,7 +227,7 @@ class LineRequest:
         """
         self._check_released()
 
-        return self._req.read_edge_events(max_events)
+        return cast(_ext.Request, self._req).read_edge_events(max_events)
 
     def __str__(self) -> str:
         """
@@ -279,4 +279,4 @@ class LineRequest:
         File descriptor associated with this request.
         """
         self._check_released()
-        return self._req.fd
+        return cast(_ext.Request, self._req).fd
-- 
2.34.1


