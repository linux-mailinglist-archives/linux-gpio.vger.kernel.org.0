Return-Path: <linux-gpio+bounces-13012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F7D9C8D3E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE25B1F245F6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68DE70814;
	Thu, 14 Nov 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="f0wNDn+U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5E6F307
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595893; cv=none; b=O45mv4KAU83iAEHldMj6ZgzhhRckHm9NXbesup/n9Qm5WnAOfafLYO95ttUdqr/BRnM00WT3o7b/YsJeCXdpsjZi1snusV1RasMpEMJDmaor02YekG5aZSw4hbrUk7tjCkTc0bz5+0ubORLnpBxakCmp+ughf7g8max4ZSbCxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595893; c=relaxed/simple;
	bh=HS1GUKoL282nBRqSaaDTxIfibMjITKqb/KQdxvjE1Dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j77TgRkzMUpolzqaZ+U4gy6LuKvLnvwDL0QqekMSdfHBmILT7i3HhGODTrN4RifYJ4crLdypTnwnMVLKDZNABhTfrC+1PkXhqw5gp1KeB1ud7sjWwFIDBNAca6pLQX/W/sMMRYOPSwNL473euHzOR0nt9IENWjggCx/hoEshUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=f0wNDn+U; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id C16B220AA5;
	Thu, 14 Nov 2024 08:51:22 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595882; bh=HS1GUKoL282nBRqSaaDTxIfibMjITKqb/KQdxvjE1Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f0wNDn+UYW70bZi2kh3DuGzvEcio37Ac7cJo6S9cMYTrtBjmW3yZM1r5HTQjX9enE
	 lcyqPy9JiRQ+B5hlwKt//4NzfYLZEeUXoFczxACqgc2r79RxWBbSupnFVmCJz5LtX/
	 UsdxY7Fjgv9gBVkNI4omx/eQ73ltoCxuOwqUPa4g=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 07/23] bindings: python: add type hint for the sec variable in poll_fd
Date: Thu, 14 Nov 2024 08:51:00 -0600
Message-Id: <20241114145116.2123714-8-vfazio@xes-inc.com>
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

The sec variable can be either a float or None, so type it accordingly
to avoid complaints from type checkers.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/_internal.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index d1e95e4..c9b5d28 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -9,6 +9,7 @@ __all__ = ["poll_fd"]
 
 
 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
+    sec: Union[float, None]
     if isinstance(timeout, timedelta):
         sec = timeout.total_seconds()
     else:
-- 
2.34.1


