Return-Path: <linux-gpio+bounces-10514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC30988A92
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3481F21FD9
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE1D1C2423;
	Fri, 27 Sep 2024 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="VriC60Zc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635631C231F
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463326; cv=none; b=jD0N3A22xGwiSgGh+2vHPERXCbLm4j6yuTHkmx0BJiHzX4p5sk5dqKQUmZZLVQFOIyJgjMG80wbjOhcq6j7jVFVeBEN46Tu0uvn1a8jfKxM5FaouNaQKtwBofCUob38yNRRt7VBnqkUqQWguMPDdOUbsoLPRY7ylSLYW3g3FqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463326; c=relaxed/simple;
	bh=Y+KPrfKo1o4gx2Bz92oyLWusiIsQp5VKNt2PBjv6AnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ns71wnhcFY4ZkRzgz7ZgpZTZ1BlR6El/L5il8tMbEO4gcOs8mJk7etXaxtvUXcZAR6SSoxiPQ7G+16JqeWfccYFHgVjF5vFP8rggT51swuHXzTBFGih3SOdQBLpy55oAWekkbWtwqkVl04lFPX8Lme6eJui6cQLRyqGFZ/Bqpns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=VriC60Zc; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id E4344211EA;
	Fri, 27 Sep 2024 13:55:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463316; bh=Y+KPrfKo1o4gx2Bz92oyLWusiIsQp5VKNt2PBjv6AnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VriC60ZcHo6l0L4r5nmt4/qldvqzwAdvOPFK86sCBMfsJm1DUNJsm7r5j485p+pWp
	 6e8z7e6Ap8oMAZnBBrO6xEq2Q/HBQNwuT9UjPRH7ZDuCU8BYkoQuoAW/XwQaGgfs3x
	 Ao7U+KzA4EEDqv9Dk3PkVgSgJCjVlOHVsUvdyNv4=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 13/22] bindings: python: selectively use f-strings
Date: Fri, 27 Sep 2024 13:53:49 -0500
Message-Id: <20240927-vfazio-mypy-v1-13-91a7c2e20884@xes-inc.com>
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

Dataclasses are not migrated to f-strings so readability isn't impacted.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py          | 8 +++-----
 bindings/python/gpiod/chip_info.py     | 2 +-
 bindings/python/gpiod/edge_event.py    | 2 +-
 bindings/python/gpiod/info_event.py    | 2 +-
 bindings/python/gpiod/line_info.py     | 2 +-
 bindings/python/gpiod/line_request.py  | 2 +-
 bindings/python/gpiod/line_settings.py | 4 ++--
 7 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 27785d63806619ff70e7c75f7dd102894d3a4ec1..e2a82203501160cf63d86a7c8c3e2d92469e2fb9 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -281,9 +281,7 @@ class Chip:
         ).items():
             if count != 1:
                 raise ValueError(
-                    "line must be configured exactly once - offset {} repeats".format(
-                        offset
-                    )
+                    f"line must be configured exactly once - offset {offset} repeats"
                 )
 
         # If we have global output values - map line names to offsets
@@ -350,7 +348,7 @@ class Chip:
         if not self._chip:
             return "<Chip CLOSED>"
 
-        return 'gpiod.Chip("{}")'.format(self.path)
+        return f'gpiod.Chip("{self.path}")'
 
     def __str__(self) -> str:
         """
@@ -359,7 +357,7 @@ class Chip:
         if not self._chip:
             return "<Chip CLOSED>"
 
-        return '<Chip path="{}" fd={} info={}>'.format(
+        return '<Chip path="{}" fd={} info={}>'.format(  # noqa: UP032
             self.path, self.fd, self.get_info()
         )
 
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index eb585d6d7efa26492163dc0a731ba263d0232099..27c28131ad4f883f3712e4201a0c325274f5fefc 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -18,6 +18,6 @@ class ChipInfo:
     num_lines: int
 
     def __str__(self) -> str:
-        return '<ChipInfo name="{}" label="{}" num_lines={}>'.format(
+        return '<ChipInfo name="{}" label="{}" num_lines={}>'.format(  # noqa: UP032
             self.name, self.label, self.num_lines
         )
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index 0d401d896a79dc5204e7ea86f202e37acbd24758..7f5cd4d345785ceb549e2888629898818a4ab293 100644
--- a/bindings/python/gpiod/edge_event.py
+++ b/bindings/python/gpiod/edge_event.py
@@ -40,7 +40,7 @@ class EdgeEvent:
         object.__setattr__(self, "line_seqno", line_seqno)
 
     def __str__(self) -> str:
-        return "<EdgeEvent type={} timestamp_ns={} line_offset={} global_seqno={} line_seqno={}>".format(
+        return "<EdgeEvent type={} timestamp_ns={} line_offset={} global_seqno={} line_seqno={}>".format(  # noqa: UP032
             self.event_type,
             self.timestamp_ns,
             self.line_offset,
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
index d9e9564e21338cd8d1e28c567fa2ed2ac29ceb00..ed531f2c3ab36e3c146c87bfdbabd3f95ab8b643 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -31,6 +31,6 @@ class InfoEvent:
         object.__setattr__(self, "line_info", line_info)
 
     def __str__(self) -> str:
-        return "<InfoEvent type={} timestamp_ns={} line_info={}>".format(
+        return "<InfoEvent type={} timestamp_ns={} line_info={}>".format(  # noqa: UP032
             self.event_type, self.timestamp_ns, self.line_info
         )
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index 5ea9568fd5c963c77f53c56ef748ac1e80872ed9..1aca142387992d2d836fb2b5672f0b45249691af 100644
--- a/bindings/python/gpiod/line_info.py
+++ b/bindings/python/gpiod/line_info.py
@@ -59,7 +59,7 @@ class LineInfo:
         )
 
     def __str__(self) -> str:
-        return '<LineInfo offset={} name="{}" used={} consumer="{}" direction={} active_low={} bias={} drive={} edge_detection={} event_clock={} debounced={} debounce_period={}>'.format(
+        return '<LineInfo offset={} name="{}" used={} consumer="{}" direction={} active_low={} bias={} drive={} edge_detection={} event_clock={} debounced={} debounce_period={}>'.format(  # noqa: UP032
             self.offset,
             self.name,
             self.used,
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index a9b5105e5cc5bc5f857300ba3e0eb7528ed6ae80..dcb711095a39002be650aaaf6f158807c37f27e1 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -232,7 +232,7 @@ class LineRequest:
         if not self._req:
             return "<LineRequest RELEASED>"
 
-        return '<LineRequest chip="{}" num_lines={} offsets={} fd={}>'.format(
+        return '<LineRequest chip="{}" num_lines={} offsets={} fd={}>'.format(  # noqa: UP032
             self.chip_name, self.num_lines, self.offsets, self.fd
         )
 
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 6c6518dbc958423393790a39d69e94802eda8547..2aca71c9c5cd02d1add663f5d430dcf0153706b9 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -28,7 +28,7 @@ class LineSettings:
     # __repr__ generated by @dataclass uses repr for enum members resulting in
     # an unusable representation as those are of the form: <NAME: $value>
     def __repr__(self) -> str:
-        return "gpiod.LineSettings(direction=gpiod.line.{}, edge_detection=gpiod.line.{}, bias=gpiod.line.{}, drive=gpiod.line.{}, active_low={}, debounce_period={}, event_clock=gpiod.line.{}, output_value=gpiod.line.{})".format(
+        return "gpiod.LineSettings(direction=gpiod.line.{}, edge_detection=gpiod.line.{}, bias=gpiod.line.{}, drive=gpiod.line.{}, active_low={}, debounce_period={}, event_clock=gpiod.line.{}, output_value=gpiod.line.{})".format(  # noqa: UP032
             str(self.direction),
             str(self.edge_detection),
             str(self.bias),
@@ -40,7 +40,7 @@ class LineSettings:
         )
 
     def __str__(self) -> str:
-        return "<LineSettings direction={} edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={}>".format(
+        return "<LineSettings direction={} edge_detection={} bias={} drive={} active_low={} debounce_period={} event_clock={} output_value={}>".format(  # noqa: UP032
             self.direction,
             self.edge_detection,
             self.bias,

-- 
2.34.1

