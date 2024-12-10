Return-Path: <linux-gpio+bounces-13693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 801879EADF3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 11:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C401282C70
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E92194A60;
	Tue, 10 Dec 2024 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oEILC5Gx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E123DE9F
	for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733826390; cv=none; b=pYCSLYQOERj8oIvEZLSzskpB2VKMrTDtZ+FPAvL6GGyhKU2naDudvvNQWMsjXazH1ciKHmLvw0N3VnnAb1Wv6AL/h4+HpW8k00wV3uV5K6A75JCJppVAiy7iTtz9JcLx6FvDCluez89WN6kESH0DkyTnaCKN9gMDvGzlcdwCHb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733826390; c=relaxed/simple;
	bh=SSwbJ0AxYORSTQg1T00cv1dPKxJp8bJbL6S+0UIlXTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZFmXx0mf1IidM/4BnjQCmAq4nwuonyMKmNjgrZa0x9whbA4KLm5Ca3jfL0z7PCWvSij3x7QkLHjQFifzY81R72nWpRl+flR9X+k1OABDJUyr6UN0yDpe08fARTcdXKADLqB/7jyF5h7aOB8ZNNusPINgL2AUuaqo0JGHPsSJB3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oEILC5Gx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso51840495e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2024 02:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733826386; x=1734431186; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nV3CDvGXklY4iT4cHqjdDfwAAuC+22Xnt2fl3fnkZVo=;
        b=oEILC5GxlUn6ry9O3hOMRfYXEHIWgNyikCUuXhD+07U6SwcCt3WhPi/e6VvO/nq2hN
         H1iqDSW+bXv3ExtYk6X+PvCg6ZAysID5iOby1ZNxFwWVwlAnMvy6mzhx2bf/6O/6ipel
         UzaW/aiey/Tdk/DCzR5vhmr5ZoaveEILUT1hEGgH13BVykmXRn2HgojFszDmshHqOUxr
         zN9+9XWsxwwjq8nJkfXmx6kDnnPkD3n+TR5U5gri6RKOnBLSwEM+8Qh6AWm8qMhgMk7B
         MSD1GWwj/6bqNRvnaimSWOYNxRN62V1y348DbenYl2F6K9fh3JsvggZuUifpfQr/Sy5f
         Rv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733826386; x=1734431186;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nV3CDvGXklY4iT4cHqjdDfwAAuC+22Xnt2fl3fnkZVo=;
        b=ojIF2KrDAE6DODv3VkvFMriiyi/CbKN3HwJEjAKnYmy4eBEu6A1taJd3jAMfwym0XD
         QTFCGg3rzSujYK2zo1lr+dAzFiepEgF4Uk6CaoPr8pptGbKZG1jxJiEo8+blkKdK+8sl
         yxIt41cviku+CUSRLHGnNTtGuH1gy2gN0xuvtezqmCbnaQFvhEkp+nIdpE3VybD0Agtt
         xhzQnK738mKkDeYIzyRHnsqIROCzdEqP8nGmOOLvMT96o+j2dlb873dIoZCQTgYWTQLD
         LDuToYEZnyQfvqZnRKfbB8WF5BsGY2bpdnjbB5j+fBlZDctEVpdyLdLl6jRLSghwnJhX
         W04g==
X-Gm-Message-State: AOJu0YyleEPIwh9dqMJihIIPKe/FlTv5cGIcnVuNQ/TfWhUAaMHObWFe
	DjBhZkdlfuKuglesN/ibhuZ7XhwGqQtOba4N7kA9a/rN0zMhJP4VJdFhcBAmaaU=
X-Gm-Gg: ASbGncsKE/z465+lM04tAJBMJkFAAq4hIUVx6ed+dllz9bEv0eE5c8ed5+u0cwEGgHH
	5JRjFaoa6l15wByBWqoaHWsfFDFzwt/1vQH3cEbSo4sI1z2SfkgH7JVvTbaB48wTEYBtwlONzXA
	/EziGMX/LfKZ2cDMwizlE7bg5rK/hQzmz2cGheUE1QNzOYvlHbaCNfYQVtkF8DjYkEXlLOk8Wmy
	PwtojdoCBLxqj7z8TNBBiRhmQl7wmGwgFgk/I4n6ah3a5U=
X-Google-Smtp-Source: AGHT+IH8ZzBZJOW2IvXo9KjTv+gpUa7PvMa+6O7YuQemBDXdxRkf9+VkzASLTCY3KSpHgbYA8egkJw==
X-Received: by 2002:a05:600c:3d8f:b0:434:a19a:5965 with SMTP id 5b1f17b1804b1-434fff306afmr32646835e9.6.1733826385878;
        Tue, 10 Dec 2024 02:26:25 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4c2b:c454:658c:f771])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f5774454sm79436875e9.13.2024.12.10.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:26:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 11:26:20 +0100
Subject: [PATCH libgpiod] bindings: python: provide fileno() for Chip and
 LineRequest
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-python-fileno-v1-1-c811cb70e122@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEsXWGcC/x3MQQqAIBBA0avErBtoLIi6SrQoHWsgVDSikO6et
 HyL/zMkjsIJxipD5EuSeFdAdQV6X9zGKKYYVKM6UtRgeM7dO7RysPNIbAbdr7ajdoHShMhW7v8
 3wSHrFsQbmN/3A46sH25pAAAA
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5209;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EftAkI1i3xSLcaLcQDbBcKu+KQYQ2QpI3HNs90ut5jg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnWBdRvpx1d8WeEofrKXjtXKqLfpZ5WljlKbPrA
 Rk530o2fO2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ1gXUQAKCRARpy6gFHHX
 ckuXEACRDtyeL2UoBdLs+lW+iaG43AZRDQ5Pt958JyoiiLydtIbLWVaAF06+SNxQhRq5rjyFRvh
 9FnckAvLrLz7MFurXZJAY1dkx3eGo7PjH/b4g4cvcl7mAcE1nqtD0OoNUTqRNe4tQDEC3T1nwiK
 rOd52THjuaArR8OfPq9+wZvElbmdJFvhZz/yVZEPN+CdxJXQPDCgHwmQKJQn1emO2GEVyDr/cEC
 VSBNqwh+F3tTf0CesJZg+uvJkpVaNu98HU500q5unBQKJ1CgLregL2gjalgw4dlOf7AJ8kcmo7Z
 0axJYYgYwCS9EvHlgtiGdS3gzRvP0ZCOcxd49b3mG4SFak8LZqT2gqs4XgwvfWPja+CANTh+c1w
 khMcoHM9Qq7uGV27+JnFmoQe4APjbD61rP2n7zeIcJYTp/ZvB0y3oRDN8MChenTFG6QXJB5KYuX
 hMwoiLPJLdb/KziE64UswZH2BoxrnRbLmgZZaSCPdtNPAJoEVn2hRptG2NKOOAU5bAlnsjx21h6
 6jMn79RWhfTjfXak97ZDo+QvlbHSI5bHuU1tAciiyE14hiO+Lq/5wBfe2SrVXZwWuRbg/xJXIHZ
 NlXYPDnytiCkbK/Dd0y1WkPla4cnpo3GwhsqF3K7OI3A+UfKVzQbz8VSfQF2rr8jEscCjG24wGw
 SVPR5P4vD6uxfFQ==
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index d7766ec..bd73802 100644
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
+    def test_select_request_object(self):
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
index e726a54..b3688f1 100644
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
 
+    def test_select_chip_object(self):
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


