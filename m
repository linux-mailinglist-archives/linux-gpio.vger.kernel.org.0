Return-Path: <linux-gpio+bounces-10512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D0988A8F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55CE72893E9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F3F1C2426;
	Fri, 27 Sep 2024 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Y8K95jSd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634B91C231E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463326; cv=none; b=Xo9YPW+o0zHZiE9sLBl5J2KTUXmr4tyLru+PAvG9VdK0U4VH/rsMlrXpqemAQIzl1Uq1wNiflcEjvwGoPb+/u1P0v+wnI8IDcTZpf5/Y3OPVd3FisXmiHA9KPH4ICKR0asuNRQl8XUiCes0E+RptNV56XB87O9opcVStwl9FeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463326; c=relaxed/simple;
	bh=wihAqMUUZ/CeJbMQ0QDbh2z2wlNTRch3hRgdnl9aX9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQoyzyrSFLf2K8sfs0KS0kWUZworV3FLC4qtp9g5Rk+4B6xJ2RV95euaXQtR4xuu3/LfSPDU0vCti11Ct2xj0qixDIhR2mxai6W25e2+LzGexKBmyGmqjAaMVWtfzbfXgd3toEu2lnxvOJXYBlNzFpn+EMPSww84YYz5+SrOJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Y8K95jSd; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 7724520FDD;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=wihAqMUUZ/CeJbMQ0QDbh2z2wlNTRch3hRgdnl9aX9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8K95jSdPr5h2czA3H98dklnXrqWSEKOpfk3PWYIAa5Kp4OP8NcmcuAQ4d2hQCiwl
	 oJNipAK2jZqBH6Hhp9MNIhuJGkzjsxH7950jSyxW0yjYxAAr2S3TGDzHr2jgWT46Zq
	 FxQECDTnFLMVSlkFfTqOB/eyODKSWGwjNKH+DpQg=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 08/22] bindings: python: annotate internal members of LineRequest
Date: Fri, 27 Sep 2024 13:53:44 -0500
Message-Id: <20240927-vfazio-mypy-v1-8-91a7c2e20884@xes-inc.com>
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

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/line_request.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index f94b6b50d72486da1446abcda8282a8dc6d6e620..77d199ac64e9d3cc68d4a8b38dd0f571a24ab231 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -30,7 +30,12 @@ class LineRequest:
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

