Return-Path: <linux-gpio+bounces-34515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH41D0VkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:18:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B937310A
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB4E63068316
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667AB19005E;
	Wed,  1 Apr 2026 00:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2mTfZPl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739F54774
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002691; cv=none; b=QQzUidFY+c1Vt/GVvuoTIl0ne7Rcpz0CgCB9F8k7G6VrKelQkTIhAAWdhkuOiwv3tnEa4XwV4oXRolo/5y7RODv0PunhCjUPvtCqazuiz+dq7phvYRPHZpeuOwC88xWPgR4sf6K7U0S7k3/ezv+QvNgCFGoRimMqQYCiFTZBX5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002691; c=relaxed/simple;
	bh=hzZDRtRV/H700buyCd1Wztfj71qlJZdLde2jIe9ZCXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abGhJlTzQXpbsWuYFtF/BRvqn8o6Ho9vlALBlMKqrG50GurexQ4BZ/mo5XEMW5sz67yFKj/IPjxamq3LZRuyKFShhfrkGZaEqYatBnm6Dd0MW2PqvEnWxFbG46JmSkC8hzGsIqP1t3s7pk7xHgyeo9uaxRGoMB/ud9bewYjQdg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2mTfZPl; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d744d9acbeso2612333a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002688; x=1775607488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qS1IR6h1A6KBA8WAe7dnZ6uw7ZjCJhyeETtH4oVvRpI=;
        b=i2mTfZPl/Ga1M944RFkhdSvlpsK5RcoAfsei30/zcLjjqY3LW1JO9DQU+0jr1hKJUA
         ziRwFuehoWCaz5VJJwL3gDIx9l4IyYTf3QF1AgQXyha41dMJiQpUH9rOD1AEW2VBSra0
         dxdtbuMiyscYd/CAtVVRGrHPIHZ9hcngIZwAQLRRIw2AKd8ZjrRgF0ORlCrVaGUGoRdY
         sD4sqAlVx1F8gg6x2JDOlkA2mTmO6y5eWj4j3Nhukw2aKaUtRBcX6U/wHY2x5i1F3oXf
         93xq5Rm3xEP2Cd8ODw+fTo8pUPSLSNWYcHOhpLmlWhe9wbo0ZTjNtw8uTZaFHIf0hHZn
         iLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002688; x=1775607488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qS1IR6h1A6KBA8WAe7dnZ6uw7ZjCJhyeETtH4oVvRpI=;
        b=q0ZLZCuS+9jO4es8WqIo/Vj5czvBtCsv5u1bz5Jr2ls+Q1TesBQNATMpjA6XMO3bh0
         SUdsSkBdYOzuAJ85s35wUBXcBLtPqNmzJC2zxp+4I9Uky7z2VpsxZ6dY2tjUvdwQkj9B
         IzhuRdJSIi4ZV4wF1GZlIgBCavP2JvIJ+eWVPKgCHZPh/B2qVvOYPx+hG2nwEjFJ0x6A
         NGY5q9cntRiGdypMh3Y5gN/+kuDRIStw05zUA82C65tTxeCFEPhEO61uVfVrcPyyYLT6
         bqfkye7+6CcDdVDfcV1Xw8jO/Jn3vQVtw4VFfYTmMpJiXms02W3g8MgGSbBNs5Fae781
         E4Lw==
X-Gm-Message-State: AOJu0YwBIVXPoeSZyG046ddRBwwUJKbVfVTjkW4ZBOeeKpJbkEcbLGVx
	OIGVAwJjWuMYaeWTxsn8HED1vqCUIO2hwQQo4o0+htjA6l0KL/RTL3np5g3JMQ==
X-Gm-Gg: ATEYQzzJSGEJFl2vr+slinCDlMyG5p+F1nfqQ2OetO15ZNdCVcfjNuWlF27EXvnRXs2
	IYNZT/EesLdSi/rg+XTNe3gkT3m25RQXSQH/XuCqPHVdCL0c8a+UeEGPo0vTVlebxujQRyRJJlC
	Nyq1LYLozL2DBGwaOSNEXsiqtD3Yv5QefqCVVrHfQF3eJH34QSCxPDy+0xQiafGgTzD6bdg9WfD
	f1uj3kbszBkcIiCHcZZoJGvbkvqYJfeHBLqF9O442HrO4TjlTUpQpjmzlxKvZrWw/J/eH3HPg2v
	dic6iEzlk+kXNyRUVCyjTtGa7BPSXCrljLsyDotTn5kMcFycbuv5ZWj+9uagCzRxWWhPBL0Fy4Y
	3VL18YL7MupxU72p49tLpVq3dHwQ19Nq320e0rtkIdMDKIO+2XET7nzutGREgouRYEwQqE979ky
	7b6XvFPYIB40xLDwKT0BRw+lExbOshAFkQzP2jpWr9KZVbdFfWSwMszCvRvwPZmTdyck7BTsWQ
X-Received: by 2002:a05:6830:2713:b0:7d7:d100:2613 with SMTP id 46e09a7af769-7db992588eemr1041162a34.1.1775002688240;
        Tue, 31 Mar 2026 17:18:08 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:07 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 6/9] bindings: python: examples: add type annotations
Date: Tue, 31 Mar 2026 19:14:55 -0500
Message-ID: <20260401001459.19159-6-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401001459.19159-1-vfazio@gmail.com>
References: <20260401001459.19159-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34515-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E52B937310A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add type annotations to help with lint checks.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/examples/async_watch_line_value.py      | 8 +++++---
 bindings/python/examples/find_line_by_name.py           | 5 +++--
 bindings/python/examples/get_chip_info.py               | 2 +-
 bindings/python/examples/get_line_info.py               | 2 +-
 bindings/python/examples/get_line_value.py              | 2 +-
 bindings/python/examples/get_multiple_line_values.py    | 4 +++-
 bindings/python/examples/reconfigure_input_to_output.py | 2 +-
 bindings/python/examples/toggle_line_value.py           | 4 ++--
 bindings/python/examples/toggle_multiple_line_values.py | 6 ++++--
 bindings/python/examples/watch_line_info.py             | 4 +++-
 bindings/python/examples/watch_line_rising.py           | 2 +-
 bindings/python/examples/watch_line_value.py            | 5 +++--
 bindings/python/examples/watch_multiple_line_values.py  | 8 +++++---
 13 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/bindings/python/examples/async_watch_line_value.py b/bindings/python/examples/async_watch_line_value.py
index ec42e04..640a4c5 100755
--- a/bindings/python/examples/async_watch_line_value.py
+++ b/bindings/python/examples/async_watch_line_value.py
@@ -8,10 +8,12 @@ import gpiod
 import select
 
 from datetime import timedelta
+
+from gpiod.edge_event import EdgeEvent
 from gpiod.line import Bias, Edge
 
 
-def edge_type_str(event):
+def edge_type_str(event: EdgeEvent) -> str:
     if event.event_type is event.Type.RISING_EDGE:
         return "Rising"
     if event.event_type is event.Type.FALLING_EDGE:
@@ -19,7 +21,7 @@ def edge_type_str(event):
     return "Unknown"
 
 
-def async_watch_line_value(chip_path, line_offset, done_fd):
+def async_watch_line_value(chip_path: str, line_offset: int, done_fd: int) -> None:
     # Assume a button connecting the pin to ground,
     # so pull it up and provide some debounce.
     with gpiod.request_lines(
@@ -59,7 +61,7 @@ if __name__ == "__main__":
     # run the async executor (select.poll) in a thread to demonstrate a graceful exit.
     done_fd = os.eventfd(0)
 
-    def bg_thread():
+    def bg_thread() -> None:
         try:
             async_watch_line_value("/dev/gpiochip0", 5, done_fd)
         except OSError as ex:
diff --git a/bindings/python/examples/find_line_by_name.py b/bindings/python/examples/find_line_by_name.py
index ac798a9..4ed3848 100755
--- a/bindings/python/examples/find_line_by_name.py
+++ b/bindings/python/examples/find_line_by_name.py
@@ -6,15 +6,16 @@
 
 import gpiod
 import os
+from collections.abc import Generator
 
 
-def generate_gpio_chips():
+def generate_gpio_chips() -> Generator[str]:
     for entry in os.scandir("/dev/"):
         if gpiod.is_gpiochip_device(entry.path):
             yield entry.path
 
 
-def find_line_by_name(line_name):
+def find_line_by_name(line_name: str) -> None:
     # Names are not guaranteed unique, so this finds the first line with
     # the given name.
     for path in generate_gpio_chips():
diff --git a/bindings/python/examples/get_chip_info.py b/bindings/python/examples/get_chip_info.py
index 7dc76fb..037e424 100755
--- a/bindings/python/examples/get_chip_info.py
+++ b/bindings/python/examples/get_chip_info.py
@@ -7,7 +7,7 @@
 import gpiod
 
 
-def get_chip_info(chip_path):
+def get_chip_info(chip_path: str) -> None:
     with gpiod.Chip(chip_path) as chip:
         info = chip.get_info()
         print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))
diff --git a/bindings/python/examples/get_line_info.py b/bindings/python/examples/get_line_info.py
index cd4ebcc..8e7283e 100755
--- a/bindings/python/examples/get_line_info.py
+++ b/bindings/python/examples/get_line_info.py
@@ -7,7 +7,7 @@
 import gpiod
 
 
-def get_line_info(chip_path, line_offset):
+def get_line_info(chip_path: str, line_offset: int) -> None:
     with gpiod.Chip(chip_path) as chip:
         info = chip.get_line_info(line_offset)
         is_input = info.direction == gpiod.line.Direction.INPUT
diff --git a/bindings/python/examples/get_line_value.py b/bindings/python/examples/get_line_value.py
index f3ca13b..5ca952b 100755
--- a/bindings/python/examples/get_line_value.py
+++ b/bindings/python/examples/get_line_value.py
@@ -9,7 +9,7 @@ import gpiod
 from gpiod.line import Direction
 
 
-def get_line_value(chip_path, line_offset):
+def get_line_value(chip_path: str, line_offset: int) -> None:
     with gpiod.request_lines(
         chip_path,
         consumer="get-line-value",
diff --git a/bindings/python/examples/get_multiple_line_values.py b/bindings/python/examples/get_multiple_line_values.py
index 46cf0b2..f70369f 100755
--- a/bindings/python/examples/get_multiple_line_values.py
+++ b/bindings/python/examples/get_multiple_line_values.py
@@ -4,12 +4,14 @@
 
 """Minimal example of reading multiple lines."""
 
+from collections.abc import Iterable
+
 import gpiod
 
 from gpiod.line import Direction
 
 
-def get_multiple_line_values(chip_path, line_offsets):
+def get_multiple_line_values(chip_path: str, line_offsets: Iterable[int]) -> None:
     with gpiod.request_lines(
         chip_path,
         consumer="get-multiple-line-values",
diff --git a/bindings/python/examples/reconfigure_input_to_output.py b/bindings/python/examples/reconfigure_input_to_output.py
index 0f2e358..feb5f0b 100755
--- a/bindings/python/examples/reconfigure_input_to_output.py
+++ b/bindings/python/examples/reconfigure_input_to_output.py
@@ -9,7 +9,7 @@ import gpiod
 from gpiod.line import Direction, Value
 
 
-def reconfigure_input_to_output(chip_path, line_offset):
+def reconfigure_input_to_output(chip_path: str, line_offset: int) -> None:
     # request the line initially as an input
     with gpiod.request_lines(
         chip_path,
diff --git a/bindings/python/examples/toggle_line_value.py b/bindings/python/examples/toggle_line_value.py
index e0de8fb..bc948de 100755
--- a/bindings/python/examples/toggle_line_value.py
+++ b/bindings/python/examples/toggle_line_value.py
@@ -10,13 +10,13 @@ import time
 from gpiod.line import Direction, Value
 
 
-def toggle_value(value):
+def toggle_value(value: Value) -> Value:
     if value == Value.INACTIVE:
         return Value.ACTIVE
     return Value.INACTIVE
 
 
-def toggle_line_value(chip_path, line_offset):
+def toggle_line_value(chip_path: str, line_offset: int) -> None:
     value_str = {Value.ACTIVE: "Active", Value.INACTIVE: "Inactive"}
     value = Value.ACTIVE
 
diff --git a/bindings/python/examples/toggle_multiple_line_values.py b/bindings/python/examples/toggle_multiple_line_values.py
index 12b968d..74ff587 100755
--- a/bindings/python/examples/toggle_multiple_line_values.py
+++ b/bindings/python/examples/toggle_multiple_line_values.py
@@ -10,13 +10,15 @@ import time
 from gpiod.line import Direction, Value
 
 
-def toggle_value(value):
+def toggle_value(value: Value) -> Value:
     if value == Value.INACTIVE:
         return Value.ACTIVE
     return Value.INACTIVE
 
 
-def toggle_multiple_line_values(chip_path, line_values):
+def toggle_multiple_line_values(
+    chip_path: str, line_values: dict[int | str, Value]
+) -> None:
     value_str = {Value.ACTIVE: "Active", Value.INACTIVE: "Inactive"}
 
     request = gpiod.request_lines(
diff --git a/bindings/python/examples/watch_line_info.py b/bindings/python/examples/watch_line_info.py
index e49a669..8ae5ac0 100755
--- a/bindings/python/examples/watch_line_info.py
+++ b/bindings/python/examples/watch_line_info.py
@@ -4,10 +4,12 @@
 
 """Minimal example of watching for info changes on particular lines."""
 
+from collections.abc import Iterable
+
 import gpiod
 
 
-def watch_line_info(chip_path, line_offsets):
+def watch_line_info(chip_path: str, line_offsets: Iterable[int]) -> None:
     with gpiod.Chip(chip_path) as chip:
         for offset in line_offsets:
             chip.watch_line_info(offset)
diff --git a/bindings/python/examples/watch_line_rising.py b/bindings/python/examples/watch_line_rising.py
index 7b1c6b0..2f7f25f 100755
--- a/bindings/python/examples/watch_line_rising.py
+++ b/bindings/python/examples/watch_line_rising.py
@@ -9,7 +9,7 @@ import gpiod
 from gpiod.line import Edge
 
 
-def watch_line_rising(chip_path, line_offset):
+def watch_line_rising(chip_path: str, line_offset: int) -> None:
     with gpiod.request_lines(
         chip_path,
         consumer="watch-line-rising",
diff --git a/bindings/python/examples/watch_line_value.py b/bindings/python/examples/watch_line_value.py
index 171a67c..9b84d29 100755
--- a/bindings/python/examples/watch_line_value.py
+++ b/bindings/python/examples/watch_line_value.py
@@ -7,10 +7,11 @@
 import gpiod
 
 from datetime import timedelta
+from gpiod.edge_event import EdgeEvent
 from gpiod.line import Bias, Edge
 
 
-def edge_type_str(event):
+def edge_type_str(event: EdgeEvent) -> str:
     if event.event_type is event.Type.RISING_EDGE:
         return "Rising"
     if event.event_type is event.Type.FALLING_EDGE:
@@ -18,7 +19,7 @@ def edge_type_str(event):
     return "Unknown"
 
 
-def watch_line_value(chip_path, line_offset):
+def watch_line_value(chip_path: str, line_offset: int) -> None:
     # Assume a button connecting the pin to ground,
     # so pull it up and provide some debounce.
     with gpiod.request_lines(
diff --git a/bindings/python/examples/watch_multiple_line_values.py b/bindings/python/examples/watch_multiple_line_values.py
index 5906b7d..d0ee35a 100755
--- a/bindings/python/examples/watch_multiple_line_values.py
+++ b/bindings/python/examples/watch_multiple_line_values.py
@@ -4,12 +4,14 @@
 
 """Minimal example of watching for edges on multiple lines."""
 
-import gpiod
+from collections.abc import Iterable
 
+import gpiod
+from gpiod.edge_event import EdgeEvent
 from gpiod.line import Edge
 
 
-def edge_type_str(event):
+def edge_type_str(event: EdgeEvent) -> str:
     if event.event_type is event.Type.RISING_EDGE:
         return "Rising"
     if event.event_type is event.Type.FALLING_EDGE:
@@ -17,7 +19,7 @@ def edge_type_str(event):
     return "Unknown"
 
 
-def watch_multiple_line_values(chip_path, line_offsets):
+def watch_multiple_line_values(chip_path: str, line_offsets: Iterable[int]) -> None:
     with gpiod.request_lines(
         chip_path,
         consumer="watch-multiple-line-values",
-- 
2.43.0


