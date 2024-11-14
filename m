Return-Path: <linux-gpio+bounces-13010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC79C8D3C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6B7A1F245C8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A3E7603A;
	Thu, 14 Nov 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="eaHAZiGh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CA2179BD
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595892; cv=none; b=qWNesUyfy7/Fl9hLRvoTUphCjO4uJqOgIIqObdMKLl3DKJ65APRxI+nuT9Peb5/VBD/roG1rblqXQ7qjAzZyeNeAugqX4OHtmFxFViF8d7yyrCn1Y1u2ruErTmvVTUKp2kKNQhaF9vm4m5uDcGKN8y+plWOLYJIzS79TErKrb0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595892; c=relaxed/simple;
	bh=Ld8QqaHjkMywk8ju92DvpgVII2LpMVMsKwNc59ZFEZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=soBecxzf2P+ohuxt1b2wiwAF8rLpMPRVFd6AnvbyYdbsQstxvjBRKbWbUjP4lh8Lfa0XshP2cxGDySw7etrTHhnwWiWMNAHTmXnTv6l+khplgigzINGuC7GVVLo5DOf22Gq/SG4mlFUf/QHJ+Rd2NNv+u2Ya7DS4pjYcNkLw8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=eaHAZiGh; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 6F23A20A48;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=Ld8QqaHjkMywk8ju92DvpgVII2LpMVMsKwNc59ZFEZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaHAZiGhWdr/VsZ6eXJ9K1Q0uSJE1gJUxuPFnY9sqODB//TEnIRmEavaq5m5S2RLS
	 i8eJIhwcPh1102+MUYkYf69XOF4R1DFvl6c+fJ/XXINS2al2Vw0xq+7q1UCUwY2cbc
	 b/BZDems7N9DtqLwKc6iEgx3upxb1tJOLr4vGOf4=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 03/23] bindings: python: loosen type requirements in public API
Date: Thu, 14 Nov 2024 08:50:56 -0600
Message-Id: <20241114145116.2123714-4-vfazio@xes-inc.com>
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

Previously, `Chip.request_lines` and `LineRequest.reconfigure_lines`
were typed to accept a config argument that was either an int, a str,
or a tuple[int | str].

This had two downsides, namely:
* The tuple was typed as having only a single element and not a variable
  number of elements. The examples and test suite relied on a variable
  length tuple.
* The tuple type itself was overly restictive. The function
  implementations had no requirement that the value be a tuple, only
  that it was iterable if it was not a str or an int.

Now, these functions accept an Iterable[int | str] instead of tuples to
offer greater flexibility to callers.

This change does not break compatibility for existing users.

Closes: https://github.com/brgl/libgpiod/issues/102
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py         | 5 ++++-
 bindings/python/gpiod/line_request.py | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 175fcb0..1db199e 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -13,6 +13,7 @@ from .line_request import LineRequest
 from .line_settings import LineSettings, _line_settings_to_ext
 
 if TYPE_CHECKING:
+    from collections.abc import Iterable
     from datetime import timedelta
 
     from .chip_info import ChipInfo
@@ -225,7 +226,9 @@ class Chip:
 
     def request_lines(
         self,
-        config: dict[tuple[Union[int, str]], Optional[LineSettings]],
+        config: dict[
+            Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]
+        ],
         consumer: Optional[str] = None,
         event_buffer_size: Optional[int] = None,
         output_values: Optional[dict[Union[int, str], Value]] = None,
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index a8e4a87..c7b32f3 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -148,7 +148,10 @@ class LineRequest:
         self._req.set_values(mapped)
 
     def reconfigure_lines(
-        self, config: dict[tuple[Union[int, str]], LineSettings]
+        self,
+        config: dict[
+            Union[Iterable[Union[int, str]], int, str], Optional[LineSettings]
+        ],
     ) -> None:
         """
         Reconfigure requested lines.
-- 
2.34.1


