Return-Path: <linux-gpio+bounces-10509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E1988A8D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45407B20D75
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161981C2338;
	Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="RqANq5nI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC11C2305
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463325; cv=none; b=aEtY9EYeZFA8rF2cxQUx25ZjRf3yj+D1ymp2PXAW/9nrh6afWkkI1ILwNGPGVxToU9+2I3d8uuZuveKwUfg/oODSbcwmkQ6rY60YcYw7QnF06X3xe1eWBZ1iB2HU/xNQTEfYPSyDbYv33gHxiWrqx1PUPMSXaS5jM7+EAT0OlyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463325; c=relaxed/simple;
	bh=6hynLprg5j1gaD7osGTiqiH+jIf3GB18szQx4dh6Brc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5cZ4UYrXjTXk4AQyG2eOi13kMAc6+UKEgqsQOaKxleFv/GKquvAzXXcbl3eAW+pJZl4d/W23Tc3Dee2h2bXPPe6dcP/jA76pkYKKWji0HcyhD8vY5WB0F270HWyoem8vcb0UH2KNlY1bAoOT7TCirTq8+PoqMlYA3ZjYv+jWU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=RqANq5nI; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 05E212177C;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=6hynLprg5j1gaD7osGTiqiH+jIf3GB18szQx4dh6Brc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RqANq5nI3+b5AU1bYWF/1BzISjgG5nDlnFgGcMDHpahta+xnKm0SuEwUIikAm6p6y
	 VtGNiL0C2KKW1WLbfmWw1E1aE9kI58LG7Cl1ouuF0mhaXHdnlKBnch9IirofMWhJf0
	 F8tJyxnh0u26KBMR5yNHaOPq0rG2IMbZrn0QbT2s=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 14/22] bindings: python: tests: fix duplicate test name
Date: Fri, 27 Sep 2024 13:53:50 -0500
Message-Id: <20240927-vfazio-mypy-v1-14-91a7c2e20884@xes-inc.com>
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
 bindings/python/tests/tests_edge_event.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index 17b27026356be60b6e928cff04917f487947824c..68ab17eae7be301cbca8d6d83f90a03df0aeea53 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -118,7 +118,7 @@ class WaitingForEdgeEvents(TestCase):
 
             self.assertFalse(req.wait_edge_events(timedelta(microseconds=10000)))
 
-    def test_rising_edge_event(self):
+    def test_falling_edge_event(self):
         with gpiod.request_lines(
             self.sim.dev_path, {6: gpiod.LineSettings(edge_detection=Edge.FALLING)}
         ) as req:

-- 
2.34.1

