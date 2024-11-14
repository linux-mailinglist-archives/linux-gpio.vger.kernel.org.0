Return-Path: <linux-gpio+bounces-13013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3919C8D52
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70731B2C1DD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BA181AC8;
	Thu, 14 Nov 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="v0l5+WTa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18EA70826
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595893; cv=none; b=hMrAQaIy3WoMo2QoxB4sjiqo+OsSBCIZ/T3juXqhqGUEzHtqGPOcJLBnut4BvWRiNM2yFv7brEbTD93G350z01ZdT81LMWiDDO+2H0m5DU9dNcFYkJCVG8KVKZajOoS6vpjh/+nX98/xjQoPb8qW6FdAWFh3J8QT+gD1h0/g07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595893; c=relaxed/simple;
	bh=97NmNPQyAOS3Xg3liYt6Z6jEdjuIn3bYI5dqPu8UCuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gACtHSU6Ke61C3ERpxUYdEDtLwj+vEo9l8yoBwoGPwQgzlvdQpMxoDgzLqvioqq4Go+XlYRDUtLL08j8Whdev/lFSGqFXxQjvAedClHe3/vlivQ75+sdPArsuGxyXNaAdM1InuHCFAkReK7bCxfYOQ7nV6HQvXy0AEgPX/Ah7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=v0l5+WTa; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 0AD7C20AB1;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=97NmNPQyAOS3Xg3liYt6Z6jEdjuIn3bYI5dqPu8UCuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v0l5+WTaVeTgCJiak1VdZflfDVzZibQCdkdcntKQRJR8vRs0Aytvc5O7hpv2lNAKm
	 Mb4oHV7KH2aNe3UVgjgPxTWH+BzQ3Wiimwju7hPxLJ5nUFD9Kh6BO490bl72/c7Ulp
	 t/tKFm3iLrgQuJiVexHrSD1vqi4lpoKCEp6UW3mo=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 10/23] bindings: python: add type hints for LineRequest's internal members
Date: Thu, 14 Nov 2024 08:51:03 -0600
Message-Id: <20241114145116.2123714-11-vfazio@xes-inc.com>
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

Add type hints for LineRequest's internal members so type checkers can
ensure the code properly constrains to these types and accounts for
scenarios where the values are `None`.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 0846e6b..f8bbf64 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -34,7 +34,12 @@ class LineRequest:
         LineRequest objects can only be instantiated by a Chip parent. This is
         not part of stable API.
         """
-        self._req = req
+        self._req: Union[_ext.Request, None] = req
+        self._chip_name: str
+        self._offsets: list[int]
+        self._name_map: dict[str, int]
+        self._offset_map: dict[int, str]
+        self._lines: list[Union[int, str]]
 
     def __bool__(self) -> bool:
         """
-- 
2.34.1


