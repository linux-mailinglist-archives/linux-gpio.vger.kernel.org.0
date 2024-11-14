Return-Path: <linux-gpio+bounces-13019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51309C8D43
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A47281D2D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DF343AD2;
	Thu, 14 Nov 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="EiVt6xR2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C45336E
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595895; cv=none; b=cy69hBvssxOTwQJOQWJQYIFP/wPKbJzvxrvhOEFZkducq55gGJdEWqkOtZ8QAdKjG8K4SKYQUPeTwY8cDYvm6Ze0mtcpQR85XQHvlNsOQoYiHQTmjG147z9tmr+ZXTBFjJXPEU+QvRwfUsbJqtdzFLL0d3JDld/P97SJEvgWfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595895; c=relaxed/simple;
	bh=cVk+e6AsuIimpq84ak7dHq55SU4PGwPcbCxpMGoE7lw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0jGU1lCkacljjVSKSgINO7ZYRWCaIoevDMxQ71/yfnkbzi6pyogN+Qp1OmkP9OJkf7tg3mWLQvpsF3QX+8S9VJqSyx51UxjDhxo2ofLt3bsX5+XdJuhaCJ0hZ+hOWsDug36XkXBtCgSB9USCUsA1iGGdrAYUsh+UJnhKOERzsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=EiVt6xR2; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 5CA8420AB6;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=cVk+e6AsuIimpq84ak7dHq55SU4PGwPcbCxpMGoE7lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EiVt6xR2/i/xJnxLkd7yNCA6aMfr8bxbgei2yBApVR/YIv49M+kzxgmx/YamIoAB4
	 boOsyJJx4/9NpUtYIKxhK2TQaltaB8coE/3/xVZmau5aPg2xOobGqeQUYlNdPNpHPd
	 WoeT+tiPOnEC+7wygB4koGi++nDx8N5F5ce1Toqc=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 14/23] bindings: python: selectively use f-strings
Date: Thu, 14 Nov 2024 08:51:07 -0600
Message-Id: <20241114145116.2123714-15-vfazio@xes-inc.com>
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

Since their inclusion in Python 3.6, f-strings have become the preferred
way to format strings with variable values as they are generally more
readable as the value substitution is in place and doesn't have to be
parsed from the list or arguments to `.format()`.

Where it does not impact readability (when the line is <120 characters),
swap usage of `.format()` to an f-string.

For lines that are not converted, inform the linter to ignore attempts
to upgrade those instances to f-strings [0]

[0]: https://docs.astral.sh/ruff/rules/f-string/
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/gpiod/chip.py          | 10 +++-------
 bindings/python/gpiod/chip_info.py     |  4 +---
 bindings/python/gpiod/edge_event.py    |  2 +-
 bindings/python/gpiod/info_event.py    |  4 +---
 bindings/python/gpiod/line_info.py     |  2 +-
 bindings/python/gpiod/line_request.py  |  4 +---
 bindings/python/gpiod/line_settings.py |  4 ++--
 7 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 482b98b..30201b5 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -282,9 +282,7 @@ class Chip:
         ).items():
             if count != 1:
                 raise ValueError(
-                    "line must be configured exactly once - offset {} repeats".format(
-                        offset
-                    )
+                    f"line must be configured exactly once - offset {offset} repeats"
                 )
 
         # If we have global output values - map line names to offsets
@@ -353,7 +351,7 @@ class Chip:
         if not self._chip:
             return "<Chip CLOSED>"
 
-        return 'gpiod.Chip("{}")'.format(self.path)
+        return f'gpiod.Chip("{self.path}")'
 
     def __str__(self) -> str:
         """
@@ -362,9 +360,7 @@ class Chip:
         if not self._chip:
             return "<Chip CLOSED>"
 
-        return '<Chip path="{}" fd={} info={}>'.format(
-            self.path, self.fd, self.get_info()
-        )
+        return f'<Chip path="{self.path}" fd={self.fd} info={self.get_info()}>'
 
     @property
     def path(self) -> str:
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index eb585d6..3306af2 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -18,6 +18,4 @@ class ChipInfo:
     num_lines: int
 
     def __str__(self) -> str:
-        return '<ChipInfo name="{}" label="{}" num_lines={}>'.format(
-            self.name, self.label, self.num_lines
-        )
+        return f'<ChipInfo name="{self.name}" label="{self.label}" num_lines={self.num_lines}>'
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index 0d401d8..7f5cd4d 100644
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
index d9e9564..4a86697 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -31,6 +31,4 @@ class InfoEvent:
         object.__setattr__(self, "line_info", line_info)
 
     def __str__(self) -> str:
-        return "<InfoEvent type={} timestamp_ns={} line_info={}>".format(
-            self.event_type, self.timestamp_ns, self.line_info
-        )
+        return f"<InfoEvent type={self.event_type} timestamp_ns={self.timestamp_ns} line_info={self.line_info}>"
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index 5ea9568..1aca142 100644
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
index 7327274..9471442 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -231,9 +231,7 @@ class LineRequest:
         if not self._req:
             return "<LineRequest RELEASED>"
 
-        return '<LineRequest chip="{}" num_lines={} offsets={} fd={}>'.format(
-            self.chip_name, self.num_lines, self.offsets, self.fd
-        )
+        return f'<LineRequest chip="{self.chip_name}" num_lines={self.num_lines} offsets={self.offsets} fd={self.fd}>'
 
     @property
     def chip_name(self) -> str:
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 6c6518d..2aca71c 100644
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


