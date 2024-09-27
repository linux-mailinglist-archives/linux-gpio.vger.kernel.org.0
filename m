Return-Path: <linux-gpio+bounces-10525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CCC988AAB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 21:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42D11C20C40
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 19:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0F51C2301;
	Fri, 27 Sep 2024 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="GKTkEcjs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E221C1ABA
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463907; cv=none; b=XZSIg/lOWNYncZP5p1tHjRr98K8psDKIyl98rHals8PQTdRaarCrsWG3zBXTnpKj7V630UoUSLCXSYYpePo7waXSEw8Ybn8/L/pe8/vxx8niXatA7RIpWC823u67VXA78NuuQORteySMnfRU5jVHIOwU4HVBcpipO6SFgKQWwqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463907; c=relaxed/simple;
	bh=j74j9fJrPEYL4fKjX1ARIy/B7xrnJMwWcBrYiJklcwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mJUAb5K6IgpkUe1PzXTmpneVWPXh5h4aRR/5GdDUFt13huojQJfJ4Hb7nj1HiNz5vIIbNCazEwa0XvZU6Q8883Q6X2lq9OUHLcl7BgeEEydiI+GkdTVXYbbUrl6iBsQV5DWDPZcDADp6MZwxSXG96iBlY0iKUEuu30cVteBmg5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=GKTkEcjs; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 03744206B2;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=j74j9fJrPEYL4fKjX1ARIy/B7xrnJMwWcBrYiJklcwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GKTkEcjsaNoHpcmawNoxO37Va0jTwiWBnuGTKqNuurYeqQxF/61Lfa4N0cmj4pYaW
	 x59+4sOqxjeJX+vv6rJm/kp8UwJ1389+S4IK8siDliSwo3d8X66m+ljOXyNXLLR5Lf
	 Ub0uqvM1W4ECITzBZCsF1I0T7j1mLRK/ZgomC/Rk=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 03/22] bindings: python: fix annotation of variable length tuples
Date: Fri, 27 Sep 2024 13:53:39 -0500
Message-Id: <20240927-vfazio-mypy-v1-3-91a7c2e20884@xes-inc.com>
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

Both `Chip.request_lines` and `LineRequest.reconfigure_lines` accept a
config argument that is allowed to be either a variable length tuple
of int | str, a str, or an int.

Python documentation [0] points out that variable length tuples need a
trailing ellipsis in their annotation.

[0]: https://docs.python.org/3/library/typing.html#annotating-tuples
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py         | 4 +++-
 bindings/python/gpiod/line_request.py | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 1a1bba4d6dd9e840a60394f1b74903f6ad15a0f4..93556b6ea6aa35b9ad6dc0cb840c33cb95170048 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -222,7 +222,9 @@ class Chip:
 
     def request_lines(
         self,
-        config: dict[tuple[Union[int, str]], Optional[LineSettings]],
+        config: dict[
+            Union[tuple[Union[int, str], ...], int, str], Optional[LineSettings]
+        ],
         consumer: Optional[str] = None,
         event_buffer_size: Optional[int] = None,
         output_values: Optional[dict[Union[int, str], Value]] = None,
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 154174872e488fa478b27f5e83d65e6040aca367..f4e3f06d984d751d842b3c0e77a8db2e0e9a7a60 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -144,7 +144,10 @@ class LineRequest:
         self._req.set_values(mapped)
 
     def reconfigure_lines(
-        self, config: dict[tuple[Union[int, str]], LineSettings]
+        self,
+        config: dict[
+            Union[tuple[Union[int, str], ...], int, str], Optional[LineSettings]
+        ],
     ) -> None:
         """
         Reconfigure requested lines.

-- 
2.34.1

