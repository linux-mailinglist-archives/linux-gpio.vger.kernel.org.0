Return-Path: <linux-gpio+bounces-13017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 873AC9C8D41
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2F6282216
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C6B1339A4;
	Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="HSs26u5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8A179BD
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595894; cv=none; b=G8S7JJ5crPg9Iv0znEZVqaUw6yMKoxi87zL0X7orvHTxqtkdhD6OnoNzHcYYHJZiRvmfhBhOzPMrqkO4EkiAse+UOL+Nl7pUpDADpQ34jYmCRDBmAlRxaRfCL36qV6ALHIJrjFWj//PZjR2D/5mxZx4x+TNYn+WZjA47o8+Oye4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595894; c=relaxed/simple;
	bh=PoaQF24GHlIxevYL09mpbGzqdeEWvku20jXh44DvccE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYb49dhhE115LlafYwadPXeCCnXsb1BOGI560iOzcc7i1IKGXptGM+6xIDGD64KOKcwfUqiV7qMengXneiEGBxmW3+EwmqU+/nofBj55cFme52wXk3l99iOmTP8pzs26SIWO4RQtdvLpOMy50KGaW1U+K2HK4uM+/P8vH5TIhKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=HSs26u5j; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 480E720AB5;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=PoaQF24GHlIxevYL09mpbGzqdeEWvku20jXh44DvccE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSs26u5jNF/wT17KLqUGwrm8JCGR6PP33SAKoeEFdMl+5Cbrfob0RZwBr8ilOpGtD
	 KUA1vnQljdqWdZmB2W0ezrP1QqdJO4o4qTZUlEw86RZkZd7WUGr5Mus4OBsh8q9CVr
	 AM/NtxBxN175HAIje0FLCtSjxGjF0hgBH6bhQOQU=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 13/23] bindings: python: cast return value of LineRequest.get_values
Date: Thu, 14 Nov 2024 08:51:06 -0600
Message-Id: <20241114145116.2123714-14-vfazio@xes-inc.com>
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

The `values` argument of `_ext.Request.get_values` uses a preallocated
`list[None]` as a buffer that is populated with `Value`s by the external
module that are then returned from the function.

Use `cast` to inform the type checker it's a `list[Value]` despite how
it's allocated.

Also, as `lines` is typed as an `Iterable`, there is no guarantee it has
a `__len__` method. Instead, use the size of the `offsets` array to
allocate the buffer.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 3f181c9..7327274 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -8,6 +8,7 @@ from typing import TYPE_CHECKING, Optional, Union, cast
 from . import _ext
 from ._internal import poll_fd
 from .exception import RequestReleasedError
+from .line import Value
 from .line_settings import LineSettings, _line_settings_to_ext
 
 if TYPE_CHECKING:
@@ -16,7 +17,6 @@ if TYPE_CHECKING:
     from types import TracebackType
 
     from .edge_event import EdgeEvent
-    from .line import Value
 
 
 __all__ = ["LineRequest"]
@@ -124,7 +124,7 @@ class LineRequest:
 
         offsets = [self._line_to_offset(line) for line in lines]
 
-        buf = [None] * len(lines)
+        buf = cast(list[Value], [None] * len(offsets))
 
         cast(_ext.Request, self._req).get_values(offsets, buf)
         return buf
-- 
2.34.1


