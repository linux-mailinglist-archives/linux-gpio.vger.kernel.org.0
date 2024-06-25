Return-Path: <linux-gpio+bounces-7662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5F915BA7
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 03:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F65E2831FC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 01:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B18815491;
	Tue, 25 Jun 2024 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=melty.land header.i=@melty.land header.b="UHdcAqej"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ilama.link.melty.land (mail.melty.land [45.77.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9214005
	for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2024 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719278741; cv=none; b=CBAuV7Bx+WkTume0T3dP/gA24NxuIbTDGYRGTjyuL5e7068GVmRQTInFCoDRkCjhJ5+Z+uYyA2UbktKETYfFpPsd8oUWaMCS5+jaJLU0HnMOzE8Rv3158iupQMWnCbzYwQ5R8aM9COV5ZiDYk0Xo82Y/olTIirCaaJGO7ea55E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719278741; c=relaxed/simple;
	bh=jhq6Ls/0iKRLw9hQJIqlPNlHoDHe7PQ2P0TWlElzsx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGlnBJnYimJYIl4Wa59MfZ27RPn9dGPCTz3JzqS/cNEgIyQ1JhkUHDiKededPwd0yV3ryfqD48wihHlhrWP+Dk1tUqBUFhwhc3hjrM6uM2F1NyzNCZUN0Y1a+9Hwz/f+PsR1kfi5j91td3YZyUaHQDzp8egvIMtWP7eawmqFGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=melty.land; spf=pass smtp.mailfrom=melty.land; dkim=pass (1024-bit key) header.d=melty.land header.i=@melty.land header.b=UHdcAqej; arc=none smtp.client-ip=45.77.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=melty.land
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melty.land
Received: from localhost.localdomain (unknown [157.119.101.194])
	by ilama.link.melty.land (Postfix) with ESMTPSA id 954DB8BA6EC;
	Tue, 25 Jun 2024 09:15:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=melty.land; s=default;
	t=1719278157; bh=jhq6Ls/0iKRLw9hQJIqlPNlHoDHe7PQ2P0TWlElzsx4=;
	h=From:To:Cc:Subject:Date;
	b=UHdcAqejzCL59bc245DRJynq8d49AUAOjQQI7N7uBuY+qFHHT3xYDGiHDTfDQlceV
	 E/OPo6xhuUVacsZIAc4zmFvb1b4mERup5nNgBGMIIwD4juB8N/CMvzmxhZrlnFobub
	 a6KwlHMwuQe29XeLyzxf/wFu3EEJfd8Q/8XfGj0s=
From: chuang+git@melty.land
To: linux-gpio@vger.kernel.org
Cc: Chuang Zhu <git@chuang.cz>
Subject: [libgpiod][PATCH] bindings: python: fix LineRequest.set_value only works for the last entry
Date: Tue, 25 Jun 2024 09:15:22 +0800
Message-ID: <20240625011522.1470733-1-chuang+git@melty.land>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuang Zhu <git@chuang.cz>

When multiple entries are requested using line names in
Chip.request_lines, only the the last entry is added to
LineRequest._name_map, causing a ValueError when trying to use
LineRequest.set_value on any former entries.

>>> import gpiod
>>> lr = gpiod.Chip('/dev/gpiochip0').request_lines(
...     config={
...         'LINE0': gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT,
...                                     output_value=gpiod.line.Value.INACTIVE),
...         'LINE2': gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, active_low=True,
...                                     output_value=gpiod.line.Value.ACTIVE),
...     }
... )
>>> lr._name_map
{'LINE2': 2}
>>> lr.set_value('LINE0', gpiod.line.Value.ACTIVE)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File ".../gpiod/line_request.py", line 126, in set_value
    self.set_values({line: value})
  File ".../gpiod/line_request.py", line 138, in set_values
    mapped = {
             ^
  File ".../gpiod/line_request.py", line 139, in <dictcomp>
    self._name_map[line] if self._check_line_name(line) else line: values[line]
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File ".../gpiod/line_request.py", line 82, in _check_line_name
    raise ValueError("unknown line name: {}".format(line))
ValueError: unknown line name: LINE0

Signed-off-by: Chuang Zhu <git@chuang.cz>
---
 bindings/python/gpiod/chip.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index b3d8e61..ce77d27 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -279,11 +279,12 @@ class Chip:
         else:
             mapped_output_values = None
 
+        offsets = list()
+        name_map = dict()
+        offset_map = dict()
+        global_output_values = list()
+
         for lines, settings in config.items():
-            offsets = list()
-            name_map = dict()
-            offset_map = dict()
-            global_output_values = list()
 
             if isinstance(lines, int) or isinstance(lines, str):
                 lines = (lines,)
-- 
2.44.0


