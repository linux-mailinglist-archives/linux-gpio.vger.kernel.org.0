Return-Path: <linux-gpio+bounces-7766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE891AB48
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 17:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885A728D02E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3374198E71;
	Thu, 27 Jun 2024 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=melty.land header.i=@melty.land header.b="wjLlEAXg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ilama.link.melty.land (mail.melty.land [45.77.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F019750B
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502278; cv=none; b=p0qR5TQIqkQTkjf8PVaI4/ycX0XIYZ0Mub93BcPWYGg1d2C4pvuMcAXr5SrwY7hk4OLfYUR6x2sqBazLoyrL2j/2e7HidZuG0tPvFN0ZdZodPkqMZAQH/LYHE89HHBRs097jAS3LlcMQ1fqJ0KP04n9JCason9FKr0CkKSlKLwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502278; c=relaxed/simple;
	bh=QsshmHM5WxHxWeGPUiVPLP6OWDvuzPGREjmPggvkXzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2QZ1zrWFcsPnDRHHUyo6bj1qJf4OQ/Ncwqa5h/HkzzQr3T156jvJ6G6Z+0vYZk5/f1EiNqoi5Vl7OngcqjgD3Nltw8J/BOjSVLMH0yTQ9EX6TgR4ry9Iu1khgYs21iiiHMZrW7RjEqe9LqrS5k4a708StdCyxFUNW6G4kH1gi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=melty.land; spf=pass smtp.mailfrom=melty.land; dkim=pass (1024-bit key) header.d=melty.land header.i=@melty.land header.b=wjLlEAXg; arc=none smtp.client-ip=45.77.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=melty.land
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melty.land
Received: from localhost.localdomain (hawthorn.chuang [192.168.174.5])
	by ilama.link.melty.land (Postfix) with ESMTPSA id 6AE768BAECB;
	Thu, 27 Jun 2024 23:31:07 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=melty.land; s=default;
	t=1719502267; bh=QsshmHM5WxHxWeGPUiVPLP6OWDvuzPGREjmPggvkXzw=;
	h=From:To:Cc:Subject:Date;
	b=wjLlEAXgPUubp+JmEspl4S5oT9WKziOaINq51/02BP/j2dTZONkLriZ8crI3dOw0r
	 38vzbMN89OpTgOgVgtmRD7cYstYpbdm2iXRMypYxZ8k2U39zThFJULbLVqQOnQFKRG
	 4nXS+ZOqLozNPNjAIKnP6ESvbIZ6RBb8fZy17ca0=
From: Chuang Zhu <chuang+git@melty.land>
To: linux-gpio@vger.kernel.org
Cc: Chuang Zhu <git@chuang.cz>
Subject: [libgpiod][PATCH v2 1/2] bindings: python: tests: add a test case for line request by name with multiple entries
Date: Thu, 27 Jun 2024 23:31:02 +0800
Message-ID: <20240627153103.594107-1-chuang+git@melty.land>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuang Zhu <git@chuang.cz>

Signed-off-by: Chuang Zhu <git@chuang.cz>
---
 bindings/python/tests/tests_line_request.py | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index f99b93d..c9a5c81 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -310,6 +310,40 @@ class LineRequestComplexConfig(TestCase):
                 self.assertEqual(chip.get_line_info(3).edge_detection, Edge.BOTH)
 
 
+class LineRequestComplexConfigByName(TestCase):
+    def setUp(self):
+        self.sim = gpiosim.Chip(num_lines=4, line_names={2: "foo", 3: "bar", 1: "baz", 0: "xyz"})
+        self.req = gpiod.request_lines(
+            self.sim.dev_path,
+            {
+                ("baz", "bar"): gpiod.LineSettings(direction=Direction.OUTPUT),
+                ("foo", "xyz"): gpiod.LineSettings(direction=Direction.INPUT)
+            },
+        )
+
+    def tearDown(self):
+        self.req.release()
+        del self.req
+        del self.sim
+
+    def test_set_values_by_name(self):
+        self.req.set_values(
+            {"bar": Value.ACTIVE, "baz": Value.INACTIVE}
+        )
+
+        self.assertEqual(self.sim.get_value(1), SimVal.INACTIVE)
+        self.assertEqual(self.sim.get_value(3), SimVal.ACTIVE)
+
+    def test_get_values_by_name(self):
+        self.sim.set_pull(0, Pull.UP)
+        self.sim.set_pull(2, Pull.DOWN)
+
+        self.assertEqual(
+            self.req.get_values(["foo", "xyz"]),
+            [Value.INACTIVE, Value.ACTIVE],
+        )
+
+
 class RepeatingLinesInRequestConfig(TestCase):
     def setUp(self):
         self.sim = gpiosim.Chip(num_lines=4, line_names={0: "foo", 2: "bar"})
-- 
2.44.0


