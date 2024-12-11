Return-Path: <linux-gpio+bounces-13746-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF639EC72B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 09:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6503F1883BC5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745E01D88D3;
	Wed, 11 Dec 2024 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nWtwHusT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6182451FC
	for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905701; cv=none; b=RtJEBBd/2aaTjL3j/AFTwFl37xdWytP9mEB+suGpb73IfDvjxzXaI2JndAwiVy/OSWQQjVUGEsYVYmivqmRJj+9unW30kh3+uHWhTpex6Dp/l85hPXFi6kRlY+PrMj2AotX3z6iPVJK9XWOaGObERc4S1SuOmJq4WacVEav6hew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905701; c=relaxed/simple;
	bh=5iAy+VE4070iAgCzjMWhmL66tz0N+DmdEFFYoztZtjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cwSWgjE0dwmjsW32J2uLPkMZiw2FgSAn9lX9yI/R73AeZpWONqD1db2eg4uZZbZlTYDuZFbsUKUCkiim8MEiNGPeknGXD87VWvfKrq1od2cowm7WJOH7qjisKBzGElYzUZ1nIDyV7WM2jCwnSL6Blaa+ht65kkaarQ6TrJJa7qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nWtwHusT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so4286028f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2024 00:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733905697; x=1734510497; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RCih8Vp7et6bsCY44uA/KEG378MwWZK2J6a0S/4C0K4=;
        b=nWtwHusTH6sihOmpP2/Mb+m0XyMbEsLmhaOa4LqOf2c+UbMOLUkG+2QUBrLYr6rA99
         Ork9C3VPSTlUhr+Zj18+G+JUVfOAZAonVEbamsLmx6OTLucbIuWc/CtdsA490rRW2hte
         nvz4xvTlmtDyDlP89Mwih9GjDnSeBDVrxZCFIGmz9dSvMMps1TAn/GcrjOwAhENOcBlx
         cnFIFp/Q84gTPplchPXj2jV1T+ldWTSQnqlcsJihaFhA/muo3LyFYeskwZRcifqzI0Z+
         qYPr/XVjH81WXvECUcVhG21Na+3FHhECy6qaUqTJF/bsoy2nENfzpUlv3yS7OVBTs/v7
         gO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905697; x=1734510497;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCih8Vp7et6bsCY44uA/KEG378MwWZK2J6a0S/4C0K4=;
        b=qa4DYAK3OB0pDZmwYKBH9w/+BS7zR7M1Qh+I+NOTv06wMhfPzo01hHFZslZZf+onVn
         K2Tu3MySmX8Yrf6L/zgOnMefyW9Y+B/iH8AvS1nTX88Rb67eqLO7yqoJr8LFJXVuc1ND
         LQeNzyEa3Bd8utf+yuEkVH7movRHBMXM6YmeTipOwzGX7NAgkJiem+fTeS2tTnmu7QrH
         s/qMjfunvhLL0QZ34GVXcm1I+uwLeDVCGqhtvE/VnYeJ2QXOnWrAAg5JMhW7M1FzxwF8
         KpGq5WyvYBSyu6pInduBmVmArPRfiuu+qZNLKFUO6Dd7xmnsBHrYiMH2GTIILVQuv/Vv
         atJQ==
X-Gm-Message-State: AOJu0YwkQEgWSAUG1QByvUF/BIiLikjvfF7uBsOiybs+jxUohdRmgRSp
	v+96hhzScTANF9nY21y2ieuJipBW+fXku7Nv3gaqjyioloDC4ghtrZI0b3l34di1pWBnunwZQRB
	r
X-Gm-Gg: ASbGnctGbM4Rlpt5lNC2oxmVQN0plik37SecsopRQAtHA7GIrX4dA310DcGvmsvB9GL
	aHW7pHrhCRSjwjefwowiqg8b2pcv62Wn/n6qtm6O2T+S29vmC18IgBNYrQDRYPCe1qQtixQuCLi
	TlabkAp88o+OisX+EXqUdJapIT7gC9c7iVQfocG2wjqPOToVYMGuJ0LbbZIN/1w/meNqaopkbGI
	KGjn1+zsYYVS6JMn+dX0OVKjhcju/nEjpyv5XQDKOm/0g4=
X-Google-Smtp-Source: AGHT+IFdThQNTNm1/Xbz7BxxykBOelAkEPkzEXOHQJvpfY5xn538hslD+BM0wxH43flh9pJbaDFSrQ==
X-Received: by 2002:a05:6000:23c2:b0:385:f220:f779 with SMTP id ffacd0b85a97d-3864ced2f06mr896607f8f.49.1733905696817;
        Wed, 11 Dec 2024 00:28:16 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d1b3:c106:bf71:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514eabsm736559f8f.70.2024.12.11.00.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:28:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 09:28:11 +0100
Subject: [PATCH libgpiod v2] bindings: python: provide fileno() for Chip
 and LineRequest
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-python-fileno-v2-1-84c642572485@linaro.org>
X-B4-Tracking: v=1; b=H4sIABpNWWcC/3WNQQqDMBBFryKzbkomFWy76j3EhcZJHJBMSCRUx
 Ls3uO/y8fjvH5ApMWV4NwckKpxZQgVza8AuY/CkeK4MRpsWDWoV922RoByvFEQhzS/bTa7Fxwh
 1ExM5/l69HlaefGSZYahm4bxJ2q+jgpf/0yyoUNknop06TWjMZ+UwJrlL8jCc5/kDkeWElLUAA
 AA=
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5437;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TNEZSI0JY+FkwBU41UHXdo64E6Wjrh2ZHoBL/VpxDx0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnWU0cQGFylPsDv0xl4hr/61qy84IcI5azjKZc9
 OuiT5bQmf+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ1lNHAAKCRARpy6gFHHX
 cnS2EAC0f68pPI9y8intMQsG9ScFK6KzrFXB6PCs+eU9YSSBPgAgiUW4fgV6iJMpua8nkNzUPtK
 ZFG7PWQOLj27geOQEsXF9MxHjMY5NP7cIt8Uyrf6cpi9g36ezDyWP7WbxMbqqY1bixEFoacgd37
 Y1A/YuvvFb6b5/IQs9VcCfXMk34QZS6N4omgFWyoaXlr8x7dQxDaAz3c9WJKGROJrbbHDOA6A6X
 IyQj8rj7MdThQeGpJW+pqSwnP7Gd6VEKH0V9Jgjj3Twuj6KdNN6exvxFr7a35VWBP3gRQCL8hIy
 l/NwXqOh2xO4zKtDD1f28FH+QIeXDJX4YVku9ySQPoRQI2wyrK7EOEXjZy2DKZKvhReduBGFPFr
 Ab7ML0jEvxoHA5107c7W1dR0RtGbdQCXuM2+3udoTf3PkPz7XkIFQWLdbXDTQL075neODGbcWDv
 6+V6TFmL0t8Z+W0AcEEvRmNR51EfkgIb5v8o5ixiqfOcqIeqto0+qffCOu+aeWyyOiQzBAIiY+r
 XY0SHoSRl0kXmLZfR+7nrVCrN7DGycqdVe18/zxJuL9p9kJDgVwekE3YCUCUgqTh/o39ZlLXibT
 4iUS4zG0/MFMbXafXmV81+aBu9G++/6jy7Rgokf9RoajkubkKN5yxrYfm2FqsW3+WnXJ7GtyB1i
 QeOX/4NfJ6GgWwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Certain polling APIs in the standard library - most notably: the
select() function and the poll class - allow to poll any object that
implements the fileno() method returning the underlying file descriptor
number.

Implement fileno() for Chip and LineRequest which allows users to do:

  rd, _, _ = select([chip/request], [], [], 1)

where rd will contain the actual object passed to select which makes for
easier reading of events afterwards.

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Add return value type hints to test functions
- Link to v1: https://lore.kernel.org/r/20241210-python-fileno-v1-1-c811cb70e122@linaro.org
---
 bindings/python/gpiod/chip.py             |  6 +++++
 bindings/python/gpiod/line_request.py     |  6 +++++
 bindings/python/tests/tests_edge_event.py | 37 +++++++++++++++++++++++++++++++
 bindings/python/tests/tests_info_event.py | 18 +++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 30201b5..ddd07b8 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -344,6 +344,12 @@ class Chip:
 
         return request
 
+    def fileno(self) -> int:
+        """
+        Return the underlying file descriptor.
+        """
+        return self.fd
+
     def __repr__(self) -> str:
         """
         Return a string that can be used to re-create this chip object.
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index 9471442..ef53e16 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -224,6 +224,12 @@ class LineRequest:
 
         return cast(_ext.Request, self._req).read_edge_events(max_events)
 
+    def fileno(self) -> int:
+        """
+        Return the underlying file descriptor.
+        """
+        return self.fd
+
     def __str__(self) -> str:
         """
         Return a user-friendly, human-readable description of this request.
diff --git a/bindings/python/tests/tests_edge_event.py b/bindings/python/tests/tests_edge_event.py
index d7766ec..bf1685c 100644
--- a/bindings/python/tests/tests_edge_event.py
+++ b/bindings/python/tests/tests_edge_event.py
@@ -4,6 +4,7 @@
 import time
 from datetime import timedelta
 from functools import partial
+from select import select
 from threading import Thread
 from typing import Optional
 from unittest import TestCase
@@ -201,6 +202,42 @@ class ReadingMultipleEdgeEvents(TestCase):
             self.global_seqno += 1
 
 
+class PollLineRequestObject(TestCase):
+    def setUp(self) -> None:
+        self.sim = gpiosim.Chip(num_lines=8)
+        self.request = gpiod.request_lines(
+            self.sim.dev_path, {2: gpiod.LineSettings(edge_detection=Edge.BOTH)}
+        )
+        self.thread: Optional[Thread] = None
+
+    def tearDown(self) -> None:
+        if self.thread:
+            self.thread.join()
+            del self.thread
+        self.request.release()
+        del self.request
+        del self.sim
+
+    def trigger_rising_edge(self, offset: int) -> None:
+        time.sleep(0.05)
+        self.sim.set_pull(offset, Pull.UP)
+
+    def test_select_request_object(self) -> None:
+        self.thread = Thread(target=partial(self.trigger_rising_edge, 2))
+        self.thread.start()
+
+        rd, wr, ex = select([self.request], [], [], 1)
+        self.assertFalse(wr)
+        self.assertFalse(ex)
+        self.assertEqual(rd[0], self.request)
+
+        events = rd[0].read_edge_events()
+        self.assertEqual(len(events), 1)
+
+        event = events[0]
+        self.assertEqual(event.line_offset, 2)
+
+
 class EdgeEventStringRepresentation(TestCase):
     def test_edge_event_str(self) -> None:
         sim = gpiosim.Chip()
diff --git a/bindings/python/tests/tests_info_event.py b/bindings/python/tests/tests_info_event.py
index e726a54..31dc952 100644
--- a/bindings/python/tests/tests_info_event.py
+++ b/bindings/python/tests/tests_info_event.py
@@ -7,6 +7,7 @@ import threading
 import time
 from dataclasses import FrozenInstanceError
 from functools import partial
+from select import select
 from typing import Optional
 from unittest import TestCase
 
@@ -131,6 +132,23 @@ class WatchingInfoEventWorks(TestCase):
         self.assertGreater(ts_rel, ts_rec)
         self.assertGreater(ts_rec, ts_req)
 
+    def test_select_chip_object(self) -> None:
+        info = self.chip.watch_line_info(7)
+
+        self.thread = threading.Thread(
+            target=partial(request_reconfigure_release_line, self.sim.dev_path, 7)
+        )
+        self.thread.start()
+
+        rd, wr, ex = select([self.chip], [], [], 1)
+        self.assertFalse(wr)
+        self.assertFalse(ex)
+        self.assertEqual(rd[0], self.chip)
+
+        event = rd[0].read_info_event()
+        self.assertEqual(event.event_type, _EventType.LINE_REQUESTED)
+        self.assertEqual(event.line_info.offset, 7)
+
 
 class UnwatchingLineInfo(TestCase):
     def setUp(self) -> None:

---
base-commit: 6d9133a259e64da5e03c7e7784f0f27de7b3e59f
change-id: 20241210-python-fileno-1ed9c7bf413a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


