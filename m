Return-Path: <linux-gpio+bounces-13007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171F9C8D6A
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFCECB2A236
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C9954720;
	Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="mcmzmX8P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD936AF5
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595891; cv=none; b=HbL+wnK1GEiyuzx51bheMy+AHhJT3rUKvtq0X2E38zyISyZCf9PIQz/do/VbUTORW5O9EDN9y25UOWSrsicvLzlPihHB4ivl2ZWi1xwqbpAKts+cfoGqyRz/0HdV3CXe3rXykCxflkbDXZ6K3b2h2I4LUxUy/Axv8AujlYn9Gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595891; c=relaxed/simple;
	bh=wF9pSdtjVo3E9lN0jl/IwguMz4v2m/clhyrfwxzDv3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dc2LVqfoeIJVxFGm06lFqTnaRMULhi11WJI/4Yqg4pGUxp3eowHAnl2dr5uR2dLlHQE8rs8yCgc4g6KtKWBB5dpk+e5nqvPIVgbrznjuD03iQcVQCdfT4XcjGZ18yEDBrxeEblzll9/vmPjjNb+wuI1U5l/Mn5dOB34WqKJuIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=mcmzmX8P; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 83BBF20A91;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=wF9pSdtjVo3E9lN0jl/IwguMz4v2m/clhyrfwxzDv3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcmzmX8P3b/qty4stMoVKsypWG/WlYUjieiiJDdNCykUkwKEFiy40KC21gpfY2N2D
	 T02itKNpSx21apeq9vobFfU3B+IZ+Jswpbp1cUXEbuHmTMh16fZcoJNy1ET0I6dzln
	 PZdTmguiytll6zpeOGm8lFpRgL7rqA+qGePkN+yU=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 04/23] bindings: python: explicitly type gpiod.request_lines
Date: Thu, 14 Nov 2024 08:50:57 -0600
Message-Id: <20241114145116.2123714-5-vfazio@xes-inc.com>
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

Explicitly define the arguments for `gpiod.request_lines` so there is a
clearer linkage with the underlying `Chip.request_lines` interface.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/__init__.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index aaa0474..817c755 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -7,6 +7,9 @@ Python bindings for libgpiod.
 This module wraps the native C API of libgpiod in a set of python classes.
 """
 
+from collections.abc import Iterable
+from typing import Optional, Union
+
 from . import (
     _ext,
     chip,
@@ -82,7 +85,13 @@ def is_gpiochip_device(path: str) -> bool:
     return _ext.is_gpiochip_device(path)
 
 
-def request_lines(path: str, *args, **kwargs) -> LineRequest:
+def request_lines(
+    path: str,
+    config: dict[Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]],
+    consumer: Optional[str] = None,
+    event_buffer_size: Optional[int] = None,
+    output_values: Optional[dict[Union[int, str], line.Value]] = None,
+) -> LineRequest:
     """
     Open a GPIO chip pointed to by 'path', request lines according to the
     configuration arguments, close the chip and return the request object.
@@ -98,4 +107,9 @@ def request_lines(path: str, *args, **kwargs) -> LineRequest:
       Returns a new LineRequest object.
     """
     with Chip(path) as chip:
-        return chip.request_lines(*args, **kwargs)
+        return chip.request_lines(
+            config=config,
+            consumer=consumer,
+            event_buffer_size=event_buffer_size,
+            output_values=output_values,
+        )
-- 
2.34.1


