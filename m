Return-Path: <linux-gpio+bounces-10515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CF988A91
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF3C1C2037E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D764E1C2327;
	Fri, 27 Sep 2024 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="eVtCiTuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CDF1C2312
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463327; cv=none; b=i+ZhktzHsY7hzv9DUby/4OCXyhBvww/hmLXdx8xPemFenJMgBdiDVgbkl8pM7u2Nm9iUF+ei9fu4+0LsbVHhHan0Tzc7RRO0W7T+yo0voHtIw8epNusvQj+8dSk7P9nXhJ1moGNRtl8/l9lm8vt3OVwUmXV5mywpBk4ZaVoTMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463327; c=relaxed/simple;
	bh=Ma+lBtQWbdF5VXPIgTIU9sxtsx8enLsgOO97cDth/Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QHB85bsK47SCoEPGfOPanr/bfo+12eMYnl9lI51SP53N2o0kos1HXnAeRuM65Wq8qn8ZNs8seLJwZ9nmL8HW9w43ynmiXsAWFworV7fxBFRM8/2AKcEjq7SMqKQcR9XQgG5gbWb3SZRX0JSIYXqeutevGNP8uRgkzPPy/ZCst8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=eVtCiTuO; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id CEEF3211E7;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=Ma+lBtQWbdF5VXPIgTIU9sxtsx8enLsgOO97cDth/Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVtCiTuOiFywNdeNdBT//HKxQEnFIRwXyp/99Nr0OdocYNkoAtolFMG9ewrBlDcg/
	 SmsBceolChXJWxRKlWlqCEkvuxhGAXgeOTnNYPCJ5fhYdyU/D4+/iZv4k8QDwNwLgd
	 mFXc660lFaSYoNorzXntQWLsIV9BKOmUzuurme4k=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 12/22] bindings: python: raise exception type, not exception instance
Date: Fri, 27 Sep 2024 13:53:48 -0500
Message-Id: <20240927-vfazio-mypy-v1-12-91a7c2e20884@xes-inc.com>
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

This resolves a strict no-untyped-call mypy warning.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py         | 2 +-
 bindings/python/gpiod/line_request.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index fe7bcfe082d6e9f6220093d3fc45ff232b5d0d17..27785d63806619ff70e7c75f7dd102894d3a4ec1 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -89,7 +89,7 @@ class Chip:
 
     def _check_closed(self) -> None:
         if not self._chip:
-            raise ChipClosedError()
+            raise ChipClosedError
 
     def close(self) -> None:
         """
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 917020b9ec7046dd8e10158f70efb555fc87eade..a9b5105e5cc5bc5f857300ba3e0eb7528ed6ae80 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -66,7 +66,7 @@ class LineRequest:
 
     def _check_released(self) -> None:
         if not self._req:
-            raise RequestReleasedError()
+            raise RequestReleasedError
 
     def release(self) -> None:
         """

-- 
2.34.1

