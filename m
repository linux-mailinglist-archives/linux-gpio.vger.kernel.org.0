Return-Path: <linux-gpio+bounces-10118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 603409792FC
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 20:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B96A1F2175E
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 18:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488C21D12EB;
	Sat, 14 Sep 2024 18:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcM+BI4d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1391522F
	for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726338863; cv=none; b=u03u3h4A77NKAHzyuoiY41NIDynXG4WRWgLjXQTWFV4L2jH02HdGJRa0bnNwa9QykzhCsGUXEpLg6DPpMclA31G4QLieYty3UsSTrgu4xJN7eccihqY+CehGb/y/+0Qf3MVd+BWRW8GQk3xhACoTjB5g+HqC+lrkWKLPN3FahuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726338863; c=relaxed/simple;
	bh=p4xM7k2OA0n2AS6Vc7Mvbnz8lauQFCvsjckzgDcJPyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IKxA7tXDi5jP8TDBz4BSPb4DiMeIh07zJLqOe5bMyOPeTUgq27mDN4KHwLcA16zcK1MDz1dhlmwx0IdRyqVlPUIglxgBBf0vHqFkJ+nCx7Nw3zuP359LcyAwDmqSrxCbqPE8VDZR06XudcfLylinQF5lAZQ6PNLSz1z3RRxQrbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcM+BI4d; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a99fd0535bso161143785a.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Sep 2024 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726338860; x=1726943660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDQ50AmFo/4zXhSuUnZwAo7mhwLIdlR+vRcBTDVMClk=;
        b=AcM+BI4dFhkVDxbfuQq+W2w07IVmjL9WCUYef3Zsegsq6SbHaq1gH9EdCU/DPBjHds
         SKYLqu6Zk7KfBLT/cyU6rOC/sVcPXwusPuiadfmsEFQEA5SN59JfZYFsNLG7nVc6ttKM
         Yz/Y4Me5c/v6JH62wAgMF0W2hb6zIcvouOJnmtcnn8V007okyo1DcKyo41m2sKyF0ZdJ
         TgKKbZ+axYyE++Y8nyQ2Pg+Widd8mXG1Mrvd2XW44pf72p75BXD2EnS9vwoM7HzXyIim
         /n69AiFKWvExlX9W2eBvcLrVwST3M6/pagUaNbf0pMJN/wBF05g3VyUgmOOL24xNKL0M
         qPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726338860; x=1726943660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDQ50AmFo/4zXhSuUnZwAo7mhwLIdlR+vRcBTDVMClk=;
        b=cAMX2yI2frCkVML4n3pHVDE+4HlIaHCmnfhaatz3sQPpL3ptF1FwfEI1rKOtXF8kJ6
         QTMXOQxH600296jE4/eixRO82T1vwIns0tdiqdJ3UBxGnEqCw2nVxdKJEZ8KJvc/ybF3
         1lpcHG6tl4fxLVotcbouZvrxSKIUBpvWKGJkGodSGDd2oRzGVo/SOIdlOCBXGb+VSrtq
         j0rrIUWqYKufuHsJm6mdHcR15TZCqNRDGwnSfRYSBUedVrp8M3DcEUrG+RSSPxc3kcOu
         k1VJza9w0CwgAFh2JEpdtLN5EO/NLzTW51qh1sM+RZzTxPbKB5gc/eV+m2Wf75XKvStn
         RPnQ==
X-Gm-Message-State: AOJu0YyKmqO1NpoX6V+TGVoJ16BSqk5V92a84hFs8amhvT6/GcY4JfES
	OXV5mFQZkjGlAO7kC9SlVLfaVRsf1wFEQvRVv7+eDUsYv/khnCOjg/SyaA==
X-Google-Smtp-Source: AGHT+IHfGkadkq0vmwQGcpId9KNUanQkkHnv73XTglRAiM+1SXYqZsgKQP+FGyrTqqlBy0SuEAtEsw==
X-Received: by 2002:a05:620a:1710:b0:7a9:a7aa:4bb8 with SMTP id af79cd13be357-7ab30dce590mr1153699585a.55.1726338859647;
        Sat, 14 Sep 2024 11:34:19 -0700 (PDT)
Received: from localhost.localdomain (syn-131-093-209-211.res.spectrum.com. [131.93.209.211])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3e9b409csm92742085a.62.2024.09.14.11.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 11:34:19 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: fix Chip.request_lines typing
Date: Sat, 14 Sep 2024 13:33:52 -0500
Message-Id: <20240914183352.16090-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The output_values argument was typed as a dict of tuples, however, the
code expects a dict of int|str.

Closes: https://github.com/brgl/libgpiod/issues/96
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 7692ba4..0a5ac6d 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -226,7 +226,7 @@ class Chip:
         config: dict[tuple[Union[int, str]], Optional[LineSettings]],
         consumer: Optional[str] = None,
         event_buffer_size: Optional[int] = None,
-        output_values: Optional[dict[tuple[Union[int, str]], Value]] = None,
+        output_values: Optional[dict[Union[int, str], Value]] = None,
     ) -> LineRequest:
         """
         Request a set of lines for exclusive usage.
-- 
2.34.1


