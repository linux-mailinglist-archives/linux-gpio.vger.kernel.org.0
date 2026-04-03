Return-Path: <linux-gpio+bounces-34651-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIWxJd/gz2kS1gYAu9opvQ
	(envelope-from <linux-gpio+bounces-34651-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 17:46:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BECB395EC9
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 17:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EA32300E2B5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 15:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C353CB2F1;
	Fri,  3 Apr 2026 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4xhQICT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBEA3845B5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231194; cv=none; b=I3lY+dAtehhgyxtlD/irl2zM21ANr3FTbs+qsCh0nb3dj2R0NV0igJPIQY46P9JNDLikpgl6NFt5WPDbb/4cVfMfEskuGZIZsEG44UH3RN/DWoPzOu4St8zSJgxw/xm0iV1qd33L2X3lZIUUCBF4ElwcuhfbRdkBLrGuqZ7KaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231194; c=relaxed/simple;
	bh=gaIIdPfb8s4V/Vs/o3bcL4rBJ1zDnFH73IgOOe/FCSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsyBygSlZe9sw+9Kb3hX6uHezGXVB/C/BhvqNxTnR/MaBuCFnpHOYk5S1uYkrQJFy+SOtZIvHlsAF5BC3M0mT9N7fXnbSpx6vpzbsN3xSsrlqVySnHryCIa0k5HyXcyyBu7vswIT9f4OzvR4g/+kXiDQn4StbUR6oasEiIcsAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4xhQICT; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-47018d34159so151333b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775231192; x=1775835992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0bQewVxRdx4hlaKqZD+ihKZhPW/xd7vF19P3sWaReg=;
        b=f4xhQICTKVq+J9r8cvntGiH0hQF2rz4ODkxCHCl/hj+6oep1soRJFev/7+T07Ke5gx
         TS3YJgcK4kkDb1nVPGDK9BtkkmJzwYQGUoveWYzpKyhCmuLGZo23jDs0bIPgw1Fmf3dG
         ZJ50iM14nAh6HZ5K31oOsOGDM6pVz/UGCRE9BK2wOTORTx5WRLlVoGd9QCWmRIMEh0pS
         UTN8QGeX0Y7DkEXjP/MAh39uCzCIskwU4WfVgh4yqIq5BhyLIMYw5L65JdOnTqQU02f5
         s1FVs+Hgf9U3g+meaaSH7T7H8XoTPRVo3l9V3DCJUpevev8gbMHBJFHIbB5RbIq51ZYx
         sRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775231192; x=1775835992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0bQewVxRdx4hlaKqZD+ihKZhPW/xd7vF19P3sWaReg=;
        b=gCip+21XijEDP3002vqYmT1VygRPmnxKXeGcXOZyRr/hDdkoP/ok272ZmxrRG8VNw9
         d2YDGERw2ZW8ckJTpPkxScg2i0EUSCmQANAPmGhGgiDT+U4+A65osLz+xRf+CGS8NIta
         NsHwhGxmczMpu6Gs3yJF/WkDR0t9yKKl77pNpulq+Qbr9CBX86sBTiuYVMOvswXypN5/
         UJfw/YIkZyJSkyhrrYv+SvQlND0aCTMiwSJ5Ck00EVDvoAfufucH3ZvmBAKTmX7imDTo
         9XSuIlkzcexsLErkfxpdM1mQwzrKois6zQ0ULy3WW+txDWfTX46TERS8JvtICD4tFdbz
         wWcA==
X-Gm-Message-State: AOJu0Yyc3cKggabtRB462tnUG1UkVyqEhhbr4BPVVSPDlPMPKAS2yrly
	24PXbXTKATrKm71Ne8IhsbqaTpODoqEe5LLJfc//VzNBmE8co4w4w/5u9uZ3BA==
X-Gm-Gg: ATEYQzyDLVt2vWP+3uO002kGOF7g7bOJWWpvkkyVBZ8Ha2SPbuMtZ0+kacoPERLuAwP
	tC/BJFyx3QCgmRZs0F9XR8+IGBK/gQF8szfM11GjY++Swf3EFGPXxECkD1+MmWj8iBTCBh0WKUC
	0KbmPgjoj0mhpI8EZZJe0YktrgqZ/f26SYPIp5G6HK6aFtfy+j5RJzBQb0shZH9b5DDuKzTuIW5
	9Yo8hT2sQi/GsN41W+uUUyagL9Lw7fpCLZEjTxi6ALnEsaOk3I+zagi0ZEFpvVH4GjaFH3AZndJ
	lDjUy+n30QS838F9YNqa/Ppwd+NyZhNkWY/SmvSK3rGzd0u4+CI43hBrAjUpv7Pr2HIqu3Ltvq8
	x77fgRa787jbi6X3uXzIPkp4EZuS+Xuk+LGZOSFHtwd4J8w7xqJOuNEBAdNFoD/nuPf8tOTRTiC
	Jbv8cB7mI+CQIuS4okWXZD5F09THUVWfEWIEdvrdALNuWvUm23SEB/G6uRyatg7s/utSd08ZM=
X-Received: by 2002:a05:6808:f8c:b0:467:2be8:6673 with SMTP id 5614622812f47-46ef211528cmr2059327b6e.0.1775231192256;
        Fri, 03 Apr 2026 08:46:32 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb25acbesm6051424fac.11.2026.04.03.08.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:46:31 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2] bindings: python: allow releasing a LineRequest multiple times
Date: Fri,  3 Apr 2026 10:46:29 -0500
Message-ID: <20260403154629.3944942-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34651-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[python.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2BECB395EC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In Python, it is common for objects to allow their `close` method to be
executed multiple times out of convenience. An example of this is the
`IOBase` class [0] which is the base class of most file-like classes.

Update `LineRequest.release` to follow this example as it performs the
same function as `close`.

[0]: https://docs.python.org/release/3.10.0/library/io.html#io.IOBase.close

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/line_request.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 0287791..a271080 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -75,9 +75,9 @@ class LineRequest:
         Release this request and free all associated resources. The object must
         not be used after a call to this method.
         """
-        self._check_released()
-        cast("_ext.Request", self._req).release()
-        self._req = None
+        if self._req is not None:
+            self._req.release()
+            self._req = None
 
     def get_value(self, line: int | str) -> Value:
         """
-- 
2.43.0


