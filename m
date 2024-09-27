Return-Path: <linux-gpio+bounces-10528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF6E988AAD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 21:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B5921C20E7D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 19:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054DC1C2320;
	Fri, 27 Sep 2024 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="qrP7WfZc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9B1C1ABE
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463907; cv=none; b=Gxl2vb4ZB76cia721kupJYgQV82WEUMCZpoUTTpba54njcv9libFmMOvZzIUHwuBTLusUpZ0ctM6efK0Iy3Qq1ukfwotMXRrruXicmq5K3xYjSzuWcZH1Qva6S1a2icL0okm7rcNKkiJyOGOUhc4RogiXpYfu2/zdKU251VwUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463907; c=relaxed/simple;
	bh=FfZnDXVBsvrJ6TH9MDumMusb+f/puIGNBfj/R8tk5YA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIYBLLXF/aKrnFquxhsTn56YB/YKJi+FAz8z0SG/c1luOp7PBWJTK6dxDVwa0E4tC1X1I5wPOHbmF39sTGW7CsGLGPyruRwXdYr4+VIJX38H5dOp53Fd9wEOu8ZsOowCLNe/L0GHVukvtdosEyVqYkCndkpxYD7TbrgXcmb7NbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=qrP7WfZc; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id E0999205B1;
	Fri, 27 Sep 2024 13:55:15 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463315; bh=FfZnDXVBsvrJ6TH9MDumMusb+f/puIGNBfj/R8tk5YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrP7WfZcmSqEfX6QhDtVqY4/nRrQhqIaUsAOb5SPJKKUxe4StXBdEL2V2dkPUH4g5
	 24ex7NeyN8/Hn9c8vDiFsJRRNk/miv2xeNaoV0GpoaTddW2Z0CJzyu/nMj/O2ZsLyl
	 qN5voZMHpwChm/Z4+kVDde77kLdEgK2zlc0qUmc0=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 02/22] bindings: python: make internal a private submodule
Date: Fri, 27 Sep 2024 13:53:38 -0500
Message-Id: <20240927-vfazio-mypy-v1-2-91a7c2e20884@xes-inc.com>
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

The internal submodule shouldn't be exposed as part of the public
interface, so mark it private following PEP 8 convention [0].

Also, add a type annotation to `sec` for its possible types.

[0]: https://peps.python.org/pep-0008/#public-and-internal-interfaces
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/{internal.py => _internal.py} | 1 +
 bindings/python/gpiod/chip.py                       | 2 +-
 bindings/python/gpiod/line_request.py               | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/internal.py b/bindings/python/gpiod/_internal.py
similarity index 94%
rename from bindings/python/gpiod/internal.py
rename to bindings/python/gpiod/_internal.py
index d1e95e4ade3146f596643d52207b367e332e6f7e..c9b5d2850389d5314a12bf6d151774a96469a085 100644
--- a/bindings/python/gpiod/internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -9,6 +9,7 @@ __all__ = ["poll_fd"]
 
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
+    sec: Union[float, None]
     if isinstance(timeout, timedelta):
         sec = timeout.total_seconds()
     else:
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 257a31eba8d19634fd14e3b1d33a1345a0363946..1a1bba4d6dd9e840a60394f1b74903f6ad15a0f4 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -7,10 +7,10 @@ from errno import ENOENT
 from typing import Optional, Union
 
 from . import _ext
+from ._internal import poll_fd
 from .chip_info import ChipInfo
 from .exception import ChipClosedError
 from .info_event import InfoEvent
-from .internal import poll_fd
 from .line import Value
 from .line_info import LineInfo
 from .line_request import LineRequest
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index e48830450dcb5b7fa6c7983a0fe074cd9bd32ab7..154174872e488fa478b27f5e83d65e6040aca367 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -6,9 +6,9 @@ from datetime import timedelta
 from typing import Optional, Union
 
 from . import _ext
+from ._internal import poll_fd
 from .edge_event import EdgeEvent
 from .exception import RequestReleasedError
-from .internal import poll_fd
 from .line import Value
 from .line_settings import LineSettings, _line_settings_to_ext
 

-- 
2.34.1

