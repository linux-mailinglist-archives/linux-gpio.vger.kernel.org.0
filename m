Return-Path: <linux-gpio+bounces-26935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DBBC9311
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B768F19E82ED
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A2F2E6CD5;
	Thu,  9 Oct 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty6mUU2V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EAD2E62BF
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015142; cv=none; b=MHwfMHEo3BBv5XsTlODp/Zdu7I/VI5uMdg8vs/gVUf4FhX4ZMGYtZMX+gB84tHWor8z5MLWqEzcbmA7qJxy4rqIGyyZX0/iSVKSJx5Ri1+P31KgIKIrqYUMxwRu8+pEVWZuFkMw2/r/Fa4wR2p6tuoapc3N6PybzfyC6qtd4eww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015142; c=relaxed/simple;
	bh=ca7XIHbmd4Q3/1Y0X8Oc446z4wg/RnNWxNC/A0PPoqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMbio9dF9sQG2LagvYZ3LsQmRUTol+3mSaYFxoEW/lt591U/3oA3Hg5ztTb4Tn/yvDmf3hj3ldm80Yf0+U6OO9Mef++S3+1TnGQ7KP7JWwfqOgfhrE8ZKW3ZyHaMTFHSKj8DwAB+MY8w7jl8KNTyLq/z1aPu20lpeQSVYS2v5lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty6mUU2V; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-92c4adc8bfeso92125739f.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015140; x=1760619940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7EKALmjUrzY5HEv6xGnLW05yNQAoJuiLeg0XXfjaiE=;
        b=Ty6mUU2VJ2B4Cz+6ysUiQnZmc6LF6RzYLNsey/NqB4NkLTKSV2GCGsHwPkxcCjJCTy
         FtWKOc2X4s2OQoSRomIfEIDoTc8NhFxWUgXelKrBsTFpb2Qzxhna4uAz0+I5IVqQzuOL
         n05D27lbSjcTf1R7p3gsZ5JyORzU3aHWZ91xDXWuKZN6RJhl1PdvUhG0Waf9jQb8tm7o
         SAbI3fl5sHGIHTHSPSYJOhHmUgPjSg6Ov90XF77s1GgTjFLeOuxnFQaXjXTC3NMKUjX9
         PlzOiZvKaIJ7CtQDGS8Nu4yJcTMtN2BwIHrHBZUHLtncbju2nEVjZw7aopitZ55U+ImE
         bHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015140; x=1760619940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7EKALmjUrzY5HEv6xGnLW05yNQAoJuiLeg0XXfjaiE=;
        b=HUp7P+nwOl/1W0o2b2yM6vXcfNAwjwiKCTb80gbEwfk34TxvyBuaK4+Y/421/gUzvN
         nYcFrRMoI4cxdVoyNWUqO3q8GEi/pns3/+pwGzj/pHbjd+Ek/EvEMANYPOKmNn7lkUYZ
         6SuD1Is3dyR4SQMUqH+DQhaWgtyE+YkRIbswjFhXf019DYFSYoxRAkuJ8u38pROywz8Q
         JmTyQHM3h6ltktZxFUkTIrHIhwsvQfBy7n8ypkGM7qb3gbx5L2NzAVGKJ4JzJMNXDtGe
         lQKHNAP8aEngFrjFSNK5HVMzDREiLQluiedG/h2MDQh18OPUjNmaByi/x4v0Vd58eeDq
         AkTg==
X-Gm-Message-State: AOJu0YwdG2iarhgtz+CZiu/aupq3P3hi49HeBLpdetPDJoTk3gqywnW1
	729sNmLf6cuRffw1Z+145hmKx3cGu5W/RR0t2DOtF33CcZXR+X2k0j4RfszZSRKq
X-Gm-Gg: ASbGnctF9Y+cxddBdt9DFZoQFt94njnfOwNt7HQjgttWuaecV/Frg5F6Wc5hLj12IBp
	U2nKHnjdX1fXrFBcagECS2FkUSQvdXyw/+6/c/siCEyxGOGSZoXTVUf7IGyI+/6ET7XGSu+TuG2
	PU37gRAHsCM5eVYKxRm62I7ZnbCaSNMtEUm3kSs3f3+hn3NxEnkZgNdEK4DWMBhxLevvJ0H9lRy
	pjXuA6hRV2MH/2OlC3qXzDahYMIfjeiXjlHDf9c7+ijzvdUcU4hj2i7WzIagnIvsS5mjEap/5NV
	Evc7IlR+mZxjRnYeGXElkQZxVA48o7LhEiqBYSGCvCnxMeAljzAEAT3Lh1ti84gFLUxTu4Ux8cT
	PBjGU3nRaAYtXCFHX+OlT26ghh0Fj8MLxA2+ZOxW7vfAyxPErJRY=
X-Google-Smtp-Source: AGHT+IHSlELTj5b3VtndMTrL/jHmRUvrGZfU95mqT4/tTvw5GxjPxCwQb3NPPX/oiIP2VTGYoZUc3g==
X-Received: by 2002:a05:6602:3425:b0:936:7fd5:b8be with SMTP id ca18e2360f4ac-93bd1960bdbmr831469439f.13.1760015139633;
        Thu, 09 Oct 2025 06:05:39 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:38 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 2/9] bindings: python: remove unused attribute from LineRequest
Date: Thu,  9 Oct 2025 08:05:08 -0500
Message-ID: <20251009130516.3729433-3-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _offset_map attribute was a map of offset -> line name. Values were
only inserted when a line was requested via name. As this map is never
utilized, remove it.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py         | 1 -
 bindings/python/gpiod/line_request.py | 1 -
 2 files changed, 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 9f38ab7..ba2877d 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -339,7 +339,6 @@ class Chip:
         request._chip_name = req_internal.chip_name
         request._offsets = req_internal.offsets
         request._name_map = name_map
-        request._offset_map = offset_map
 
         request._lines = [
             offset_map[off] if off in offset_map else off for off in request.offsets
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 7956e54..c0798b5 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -36,7 +36,6 @@ class LineRequest:
         self._chip_name: str
         self._offsets: list[int]
         self._name_map: dict[str, int]
-        self._offset_map: dict[int, str]
         self._lines: list[Union[int, str]]
 
     def __bool__(self) -> bool:
-- 
2.43.0


