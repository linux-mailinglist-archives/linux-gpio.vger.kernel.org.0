Return-Path: <linux-gpio+bounces-34516-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OAQKfpkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34516-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 039DE373143
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACCA33094595
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477F119067C;
	Wed,  1 Apr 2026 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Coh/XqnE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7347B189F20
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002692; cv=none; b=LeWTi+qCQ4xSkfBBe/ZjIuiw+1zTyp5RUC7MVSjmGzKFnGTacLU8iJpI+k0T7MtcUj9LlQ0XoD2JtERtCO4nweF0MPp8FxhuTcb46H/iRD9yNRxUW7XSvdqrPF3qkkFJphftgY3Fg6MWD8IV+pT0FdSRVWG1w74xIGH9cCJ4F7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002692; c=relaxed/simple;
	bh=cgWlJ6wiZtb67omI7p9trI4XljCKZVMExkArs+uH8zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hj3MjcjTZCiFUarZK0zHI5wl8H+epofWR2Edf2AsCu8lzdCnAwhY8a/DYN2P0FoiNIja10UmRWF0l+MTz+TeY9ajTQAriGNdchsFZQtac3EUTzgVMcwhvpTHxFog7Fb4xwHPMPHm4+T70IijufNmBEt8us1gRdmq1XZFh1l6MqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Coh/XqnE; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d7447778b9so3397455a34.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002689; x=1775607489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmuuLb2CNw0YIHZdV74YrYZjKoouynJKnBrznXbSkn4=;
        b=Coh/XqnEbp5+G0H3RnjYkrE36lakB75o/ZNvNhUYVXI2O4Ddu3J4jSx8sITYjzKLAR
         pdtlmqrYcyPl+UARcA7li+g1qivVIJGanIbYtMI5XKFIIAqFUArpHkx4SdKXpj3Ws+xY
         rKJ37i2KDVAZDZ5SStQnfCOD+MnN/v+YhS5xVU6E+QrWVtZdpJYdLDqDvyNF2qlNqVe3
         dEPEvI99xQxYJ5ro05oXNuk/gEMxaoaUHwEF2Xiy8kbZ3s0Tzx9JES8CQFiCGBZYlbHm
         1Edx4wYF18dPz/tf75SaQ3OsV8HcgCIToQhF7sQDpUlTaDxH8hbSm0Lmsm29t49gJwtj
         yV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002689; x=1775607489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmuuLb2CNw0YIHZdV74YrYZjKoouynJKnBrznXbSkn4=;
        b=aD9jwsHPUu4fOCOlDevob2z2q4pDxMRNDm9AxSvlmlCohJC+se2F+RGbwsL0IXiSgc
         yM9J1oiXj11+1QFMoifg659kQ7ofumLYYmK+W3mRqMkf5nTlLhWWzHbaXB/dymfcuR9O
         Kah8CPkEndepxMxfj0FGok6TYCImg+5zCveFbpsc5pW86Zf6oAlYlgvgH43EeaGa0k65
         OZpeMTs28rRnQ7JJiPSo8CkBUdj2XA9RIKceGOL2PaSdIS3b3Zw+mV/MiG90zk8bCiYG
         xq6HSr6FD3sVFBkcYmQKwRtwmKAXVzvwbsSFVUhejrgt2dNMRbzpIs2Q+/9TeAfu7BOj
         n3AA==
X-Gm-Message-State: AOJu0Yxac8OPHGcN+qxU5AzXYsaejxp5g0b3fQIumpehm+j2XTB2LWVU
	Mggq5NQgT2ydVsaZt9QPKU9KxGq/k75MD6vBYZOFc1m9/bbqG54hodNg+eDN3g==
X-Gm-Gg: ATEYQzwKTH9cM3PHFtDH394xBfpWA4p5hfII/gYOaULQt2Uz+Z00lKchv2qyD3z0FZG
	0uzxgyZc2VGvVTr7kUC61Tqlzoj7+aDQ6TC1ltHlWpjIoFfCxSamE5P8RxLJpVouShIs8RlN6kO
	gEZxqWalJxe3kyWWFu98Ae5L/rXC3yTeEeIAKogCoplAadDZNhuJua9aHC1gQ6MCaoZ1LVWrzUQ
	wmg1oARdLxpX4vma4FeVRJ/fRRhj0MJQM4+Cq4XPhK7Wu6y7CqV0uGNXivaEEmYAzzkYPJLbsxp
	J2v0A1WPg/xN1xozvcowV7hQtb8HrIV8FKm59Abc8HL37dRI1UMdcsqIAqX1Muf/iyu6TveHgkT
	6ft4JGkCBr8n+jtQYUzTGUDP388UeHlfS3japPnmjBypL/2cHayXA1+PSShf17tgliBkv8tk3cN
	NpW1+hideqdZtYDV599HmDepbfXNhq20Xnl/oYPF5h3YZNSILIAepI4e+4aFKIa7pfAqnUgg2j
X-Received: by 2002:a05:6830:6c13:b0:7d7:d1f0:300e with SMTP id 46e09a7af769-7db99412403mr1140082a34.24.1775002689193;
        Tue, 31 Mar 2026 17:18:09 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:08 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 7/9] bindings: python: examples: apply linter recommendations
Date: Tue, 31 Mar 2026 19:14:56 -0500
Message-ID: <20260401001459.19159-7-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34516-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collections.abc:url]
X-Rspamd-Queue-Id: 039DE373143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

* Sort imports
* Use f-strings where possible
* Remove usage of `tuple` for config key values

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/examples/async_watch_line_value.py   |  9 ++++-----
 bindings/python/examples/find_line_by_name.py        |  7 ++++---
 bindings/python/examples/get_chip_info.py            |  2 +-
 bindings/python/examples/get_line_info.py            | 12 +++++-------
 bindings/python/examples/get_line_value.py           |  3 +--
 bindings/python/examples/get_multiple_line_values.py |  7 +++----
 .../python/examples/reconfigure_input_to_output.py   |  5 ++---
 bindings/python/examples/toggle_line_value.py        |  4 ++--
 .../python/examples/toggle_multiple_line_values.py   | 12 ++++--------
 bindings/python/examples/watch_line_rising.py        |  7 +++----
 bindings/python/examples/watch_line_value.py         | 10 +++++-----
 .../python/examples/watch_multiple_line_values.py    | 12 +++++-------
 12 files changed, 39 insertions(+), 51 deletions(-)

diff --git a/bindings/python/examples/async_watch_line_value.py b/bindings/python/examples/async_watch_line_value.py
index 640a4c5..68c8b28 100755
--- a/bindings/python/examples/async_watch_line_value.py
+++ b/bindings/python/examples/async_watch_line_value.py
@@ -4,11 +4,10 @@
 
 """Minimal example of asynchronously watching for edges on a single line."""
 
-import gpiod
 import select
-
 from datetime import timedelta
 
+import gpiod
 from gpiod.edge_event import EdgeEvent
 from gpiod.line import Bias, Edge
 
@@ -48,9 +47,9 @@ def async_watch_line_value(chip_path: str, line_offset: int, done_fd: int) -> No
                 # handle any edge events
                 for event in request.read_edge_events():
                     print(
-                        "offset: {}  type: {:<7}  event #{}".format(
-                            event.line_offset, edge_type_str(event), event.line_seqno
-                        )
+                        f"offset: {event.line_offset}"
+                        f"  type: {edge_type_str(event):<7}"
+                        f"  event #{event.line_seqno}"
                     )
 
 
diff --git a/bindings/python/examples/find_line_by_name.py b/bindings/python/examples/find_line_by_name.py
index 4ed3848..9523c1c 100755
--- a/bindings/python/examples/find_line_by_name.py
+++ b/bindings/python/examples/find_line_by_name.py
@@ -4,10 +4,11 @@
 
 """Minimal example of finding a line with the given name."""
 
-import gpiod
 import os
 from collections.abc import Generator
 
+import gpiod
+
 
 def generate_gpio_chips() -> Generator[str]:
     for entry in os.scandir("/dev/"):
@@ -22,13 +23,13 @@ def find_line_by_name(line_name: str) -> None:
         with gpiod.Chip(path) as chip:
             try:
                 offset = chip.line_offset_from_id(line_name)
-                print("{}: {} {}".format(line_name, chip.get_info().name, offset))
+                print(f"{line_name}: {chip.get_info().name} {offset}")
                 return
             except OSError:
                 # An OSError is raised if the name is not found.
                 continue
 
-    print("line '{}' not found".format(line_name))
+    print(f"line '{line_name}' not found")
 
 
 if __name__ == "__main__":
diff --git a/bindings/python/examples/get_chip_info.py b/bindings/python/examples/get_chip_info.py
index 037e424..addad5c 100755
--- a/bindings/python/examples/get_chip_info.py
+++ b/bindings/python/examples/get_chip_info.py
@@ -10,7 +10,7 @@ import gpiod
 def get_chip_info(chip_path: str) -> None:
     with gpiod.Chip(chip_path) as chip:
         info = chip.get_info()
-        print("{} [{}] ({} lines)".format(info.name, info.label, info.num_lines))
+        print(f"{info.name} [{info.label}] ({info.num_lines} lines)")
 
 
 if __name__ == "__main__":
diff --git a/bindings/python/examples/get_line_info.py b/bindings/python/examples/get_line_info.py
index 8e7283e..4d9ba76 100755
--- a/bindings/python/examples/get_line_info.py
+++ b/bindings/python/examples/get_line_info.py
@@ -12,13 +12,11 @@ def get_line_info(chip_path: str, line_offset: int) -> None:
         info = chip.get_line_info(line_offset)
         is_input = info.direction == gpiod.line.Direction.INPUT
         print(
-            "line {:>3}: {:>12} {:>12} {:>8} {:>10}".format(
-                info.offset,
-                info.name or "unnamed",
-                info.consumer or "unused",
-                "input" if is_input else "output",
-                "active-low" if info.active_low else "active-high",
-            )
+            f"line {info.offset:>3}:"
+            f" {info.name or 'unnamed':>12}"
+            f" {info.consumer or 'unused':>12}"
+            f" {'input' if is_input else 'output':>8}"
+            f" {'active-low' if info.active_low else 'active-high':>10}"
         )
 
 
diff --git a/bindings/python/examples/get_line_value.py b/bindings/python/examples/get_line_value.py
index 5ca952b..3984802 100755
--- a/bindings/python/examples/get_line_value.py
+++ b/bindings/python/examples/get_line_value.py
@@ -5,7 +5,6 @@
 """Minimal example of reading a single line."""
 
 import gpiod
-
 from gpiod.line import Direction
 
 
@@ -16,7 +15,7 @@ def get_line_value(chip_path: str, line_offset: int) -> None:
         config={line_offset: gpiod.LineSettings(direction=Direction.INPUT)},
     ) as request:
         value = request.get_value(line_offset)
-        print("{}={}".format(line_offset, value))
+        print(f"{line_offset}={value}")
 
 
 if __name__ == "__main__":
diff --git a/bindings/python/examples/get_multiple_line_values.py b/bindings/python/examples/get_multiple_line_values.py
index f70369f..66148a3 100755
--- a/bindings/python/examples/get_multiple_line_values.py
+++ b/bindings/python/examples/get_multiple_line_values.py
@@ -7,7 +7,6 @@
 from collections.abc import Iterable
 
 import gpiod
-
 from gpiod.line import Direction
 
 
@@ -15,12 +14,12 @@ def get_multiple_line_values(chip_path: str, line_offsets: Iterable[int]) -> Non
     with gpiod.request_lines(
         chip_path,
         consumer="get-multiple-line-values",
-        config={tuple(line_offsets): gpiod.LineSettings(direction=Direction.INPUT)},
+        config={line_offsets: gpiod.LineSettings(direction=Direction.INPUT)},
     ) as request:
         vals = request.get_values()
 
-        for offset, val in zip(line_offsets, vals):
-            print("{}={} ".format(offset, val), end="")
+        for offset, val in zip(line_offsets, vals, strict=True):
+            print(f"{offset}={val} ", end="")
         print()
 
 
diff --git a/bindings/python/examples/reconfigure_input_to_output.py b/bindings/python/examples/reconfigure_input_to_output.py
index feb5f0b..a2224e8 100755
--- a/bindings/python/examples/reconfigure_input_to_output.py
+++ b/bindings/python/examples/reconfigure_input_to_output.py
@@ -5,7 +5,6 @@
 """Example of a bi-directional line requested as input and then switched to output."""
 
 import gpiod
-
 from gpiod.line import Direction, Value
 
 
@@ -18,7 +17,7 @@ def reconfigure_input_to_output(chip_path: str, line_offset: int) -> None:
     ) as request:
         # read the current line value
         value = request.get_value(line_offset)
-        print("{}={} (input)".format(line_offset, value))
+        print(f"{line_offset}={value} (input)")
         # switch the line to an output and drive it low
         request.reconfigure_lines(
             config={
@@ -29,7 +28,7 @@ def reconfigure_input_to_output(chip_path: str, line_offset: int) -> None:
         )
         # report the current driven value
         value = request.get_value(line_offset)
-        print("{}={} (output)".format(line_offset, value))
+        print(f"{line_offset}={value} (output)")
 
 
 if __name__ == "__main__":
diff --git a/bindings/python/examples/toggle_line_value.py b/bindings/python/examples/toggle_line_value.py
index bc948de..bfd1585 100755
--- a/bindings/python/examples/toggle_line_value.py
+++ b/bindings/python/examples/toggle_line_value.py
@@ -4,9 +4,9 @@
 
 """Minimal example of toggling a single line."""
 
-import gpiod
 import time
 
+import gpiod
 from gpiod.line import Direction, Value
 
 
@@ -30,7 +30,7 @@ def toggle_line_value(chip_path: str, line_offset: int) -> None:
         },
     ) as request:
         while True:
-            print("{}={}".format(line_offset, value_str[value]))
+            print(f"{line_offset}={value_str[value]}")
             time.sleep(1)
             value = toggle_value(value)
             request.set_value(line_offset, value)
diff --git a/bindings/python/examples/toggle_multiple_line_values.py b/bindings/python/examples/toggle_multiple_line_values.py
index 74ff587..8c973f8 100755
--- a/bindings/python/examples/toggle_multiple_line_values.py
+++ b/bindings/python/examples/toggle_multiple_line_values.py
@@ -4,9 +4,9 @@
 
 """Minimal example of toggling multiple lines."""
 
-import gpiod
 import time
 
+import gpiod
 from gpiod.line import Direction, Value
 
 
@@ -24,18 +24,14 @@ def toggle_multiple_line_values(
     request = gpiod.request_lines(
         chip_path,
         consumer="toggle-multiple-line-values",
-        config={
-            tuple(line_values.keys()): gpiod.LineSettings(direction=Direction.OUTPUT)
-        },
+        config={line_values.keys(): gpiod.LineSettings(direction=Direction.OUTPUT)},
         output_values=line_values,
     )
 
     while True:
-        print(
-            " ".join("{}={}".format(l, value_str[v]) for (l, v) in line_values.items())
-        )
+        print(" ".join(f"{l}={value_str[v]}" for (l, v) in line_values.items()))  # noqa: E741
         time.sleep(1)
-        for l, v in line_values.items():
+        for l, v in line_values.items():  # noqa: E741
             line_values[l] = toggle_value(v)
         request.set_values(line_values)
 
diff --git a/bindings/python/examples/watch_line_rising.py b/bindings/python/examples/watch_line_rising.py
index 2f7f25f..59977c4 100755
--- a/bindings/python/examples/watch_line_rising.py
+++ b/bindings/python/examples/watch_line_rising.py
@@ -5,7 +5,6 @@
 """Minimal example of watching for rising edges on a single line."""
 
 import gpiod
-
 from gpiod.line import Edge
 
 
@@ -19,9 +18,9 @@ def watch_line_rising(chip_path: str, line_offset: int) -> None:
             # Blocks until at least one event is available
             for event in request.read_edge_events():
                 print(
-                    "line: {}  type: Rising   event #{}".format(
-                        event.line_offset, event.line_seqno
-                    )
+                    f"line: {event.line_offset}"
+                    "  type: Rising"
+                    f"  event #{event.line_seqno}"
                 )
 
 
diff --git a/bindings/python/examples/watch_line_value.py b/bindings/python/examples/watch_line_value.py
index 9b84d29..3140ea2 100755
--- a/bindings/python/examples/watch_line_value.py
+++ b/bindings/python/examples/watch_line_value.py
@@ -4,9 +4,9 @@
 
 """Minimal example of watching for edges on a single line."""
 
-import gpiod
-
 from datetime import timedelta
+
+import gpiod
 from gpiod.edge_event import EdgeEvent
 from gpiod.line import Bias, Edge
 
@@ -37,9 +37,9 @@ def watch_line_value(chip_path: str, line_offset: int) -> None:
             # Blocks until at least one event is available
             for event in request.read_edge_events():
                 print(
-                    "line: {}  type: {:<7}  event #{}".format(
-                        event.line_offset, edge_type_str(event), event.line_seqno
-                    )
+                    f"line: {event.line_offset}"
+                    f"  type: {edge_type_str(event):<7}"
+                    f"  event #{event.line_seqno}"
                 )
 
 
diff --git a/bindings/python/examples/watch_multiple_line_values.py b/bindings/python/examples/watch_multiple_line_values.py
index d0ee35a..2c308bb 100755
--- a/bindings/python/examples/watch_multiple_line_values.py
+++ b/bindings/python/examples/watch_multiple_line_values.py
@@ -23,17 +23,15 @@ def watch_multiple_line_values(chip_path: str, line_offsets: Iterable[int]) -> N
     with gpiod.request_lines(
         chip_path,
         consumer="watch-multiple-line-values",
-        config={tuple(line_offsets): gpiod.LineSettings(edge_detection=Edge.BOTH)},
+        config={line_offsets: gpiod.LineSettings(edge_detection=Edge.BOTH)},
     ) as request:
         while True:
             for event in request.read_edge_events():
                 print(
-                    "offset: {}  type: {:<7}  event #{}  line event #{}".format(
-                        event.line_offset,
-                        edge_type_str(event),
-                        event.global_seqno,
-                        event.line_seqno,
-                    )
+                    f"offset: {event.line_offset}"
+                    f"  type: {edge_type_str(event):<7}"
+                    f"  event #{event.global_seqno}"
+                    f"  line event #{event.line_seqno}"
                 )
 
 
-- 
2.43.0


