Return-Path: <linux-gpio+bounces-10508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AE988A8A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081951F243E1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933B61C232C;
	Fri, 27 Sep 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Psp0+aJI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6271C2319
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463325; cv=none; b=cpI0tnZJ8H0+oqhMxpfYMoKlnOwMqzCDn33rhV+VH+NI6FbZOSmCkd1qNP4JSXvYpF+ldsJbaRQ4i6gJNXlmzQWeD5MB9ldy7/gn05N9UGfKAJI8MIoXJylWU6KkoUtcP0f/EbIcbfwbQfPAnONqB0HvIYkooJdlWfd9bXvfk14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463325; c=relaxed/simple;
	bh=O3ZjR7ttwV5/2sbRx1YUGWJch7qmeaRNCPEKg5o8Rhc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leJegWAwJaCPJgbqToynaZSnj7YPiIP7ieGWTS11xQRXANoKuhtc9Bh5VexpxEjoDNMmVIxQWzSfMmb98GxfJWXCmj1SU2F9kA1CFAOZnI3ezAiTJqqBuQYHpaoKmSBvVtFrU71Vf/WlW+Ym+LKKxf5PsTK8u/8tSG4nrXT+Gxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Psp0+aJI; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 4A38920BC7;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=O3ZjR7ttwV5/2sbRx1YUGWJch7qmeaRNCPEKg5o8Rhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Psp0+aJIFE60MLC7WThoH0QaVgtdIGJ8fQHCJUWsS5Gosi66Rl6ppR7mg+yebcObX
	 Lcx98PcZup0wargLMlSFJ4VolWB1QdjBrbnI/6EtT70dfT0XHZa3eA/APojF2HVM//
	 BTtOCknVeCgrJ3UGo+tmBZl8IP+aLtrutFTsDvNI=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 06/22] bindings: python: annotate internal members of Chip
Date: Fri, 27 Sep 2024 13:53:42 -0500
Message-Id: <20240927-vfazio-mypy-v1-6-91a7c2e20884@xes-inc.com>
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
 bindings/python/gpiod/chip.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 75cc337e74bc965a30962b39a1584b13b4c4b067..4aa5677f94caf8c5d863aa6d75915a5b650de137 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -57,8 +57,8 @@ class Chip:
           path:
             Path to the GPIO character device file.
         """
-        self._chip = _ext.Chip(path)
-        self._info = None
+        self._chip: Union[_ext.Chip, None] = _ext.Chip(path)
+        self._info: Union[ChipInfo, None] = None
 
     def __bool__(self) -> bool:
         """

-- 
2.34.1

