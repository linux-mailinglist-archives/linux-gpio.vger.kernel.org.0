Return-Path: <linux-gpio+bounces-10516-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF895988A93
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0C311C2305C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA071C2312;
	Fri, 27 Sep 2024 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="mYfr9I9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C531C2310
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463327; cv=none; b=RUcfO3D982BfaZ5CokY3lhuSuDWLcUZo/1luHvreiEYPhSIql4JJMiW5nU8g3YXGOk8pY6wdvwY3DQPtiG2gI9MOPw3k2/pyF9IIbNVeUYnNIMe0uokihUxE7JbH+MhH+xOOCihLMYkh+3LGWis2r/FWaNOsd0keT0HZeazgUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463327; c=relaxed/simple;
	bh=veS+vSx+9jxGxIbmA2rImTAhiE2YTCqZ7MstOFZfE1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIamO2JNx9soPhd4sqxVXahhcLunjoLjvC+ZCGN+n8TLZIkyX2LYU6V2ti9MDERyL2teGhGLWs5OvXWktiX5flSrlYu4BZllyAT95Ax1VcyI6flX3rx3fw8uEgw7HjyCj3+yxH3s9utB7xdyx96PX8Sp29S9nr/1z1aztofIs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=mYfr9I9u; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id B94B520FDF;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=veS+vSx+9jxGxIbmA2rImTAhiE2YTCqZ7MstOFZfE1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYfr9I9uVeYERaqjhh1L9XHGeazPWmr8AokTSIfal8uiaQ0szSTmz5La0K7HIdIz1
	 gJI/Jo0svoWtgPRZHh+u4USNWCEvuc2j1JDmGGIcID5RZt9GMzUczaPVhSD4Tfcucc
	 FjMgOxIlyRPoiwP+P7/UfrgHzfh5HV+0DwOAQhAs=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 11/22] bindings: python: cast return value of LineRequest.get_values
Date: Fri, 27 Sep 2024 13:53:47 -0500
Message-Id: <20240927-vfazio-mypy-v1-11-91a7c2e20884@xes-inc.com>
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
 bindings/python/gpiod/line_request.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index a1ca64cfd82c32be5de3fc53f6c981026911bb9c..917020b9ec7046dd8e10158f70efb555fc87eade 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -122,7 +122,7 @@ class LineRequest:
 
         offsets = [self._line_to_offset(line) for line in lines]
 
-        buf = [None] * len(lines)
+        buf = cast(list[Value], [None] * len(offsets))
 
         self._req.get_values(offsets, buf)
         return buf

-- 
2.34.1

