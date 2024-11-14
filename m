Return-Path: <linux-gpio+bounces-13021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64E9C8D45
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45CCD1F2425D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49FB13AD39;
	Thu, 14 Nov 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="P4C8kTHL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E8126BEE
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595895; cv=none; b=AcoejGOOxM+sNuZwNCVzIZHImKxbk2rZHQ+Ba7UAMm9lsoFzcITtm1aZtprFL/zdwn+JkSfdfwz2FqOlD3yy+/s5zjJJKDVTUr2ze+XKY7gmIZZEMEvv1SxeIwkdSmgLEjlOGLWb0rG2bmQuh7xwJRdI8AFcAGQbUEKqgOVlMQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595895; c=relaxed/simple;
	bh=dtQo05EoHgKE6Aqc8UbCYiRwjNavdVqKKbLEI0f3FoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZIJ33qAx2xlkO8qPDgj8cs2K8F9Brk6MzxYwBkH/msd4xj1D7JW+Zwiy+40Z7K9wTzvqIz35Zkdux6RpP6d2jQThUgzAzWs4IeXdp72Ff636v+L9lBj1cbku4YGKALF0cJkukEdZJ2Z6TUcyv+NDUtO6ea20KnweoRBnV4J2vew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=P4C8kTHL; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 7128E20AB7;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=dtQo05EoHgKE6Aqc8UbCYiRwjNavdVqKKbLEI0f3FoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4C8kTHL5MNBa99dOW9fMv2ZbOWtK39hQD1J6l0GLEbCfzbYwxDaxIRiPgYCjtvVX
	 yamygAx4BzYoLAGWmbSpHb4S0Tv0G8E0er43Aa03GMm9+bD4CgbYs3bOZEAyQr6nLu
	 2e3KvTTaPZb7Et03YYxQI+ESg4JjIFWEVBKesZCI=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 15/23] bindings: python: tests: fix duplicate test name
Date: Thu, 14 Nov 2024 08:51:08 -0600
Message-Id: <20241114145116.2123714-16-vfazio@xes-inc.com>
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

Previously, the `test_rising_edge_event` test was defined twice.

The second instance of the test actually tested the falling edge event
and was shadowing the first test which tested the rising edge event.

Now, the second instance is renamed to `test_falling_edge_event` to
reflect what it is testing and to avoid the naming conflict.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/tests_edge_event.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index 17b2702..68ab17e 100644
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


