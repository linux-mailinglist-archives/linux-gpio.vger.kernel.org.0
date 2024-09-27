Return-Path: <linux-gpio+bounces-10523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B2988A9A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9893A289545
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA8C1C231C;
	Fri, 27 Sep 2024 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="x75qjgC2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CE1C2313
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463330; cv=none; b=PqJHsLwC0jmRmPsLSj90mWkSTTJe4olXvP7QKzh2LsE5uiaHJln2XQVC1/8w4bbOViHb3Py1hfItU9o9cb17KOKDUAV4fhNyI8Zsk65caXv4pkFmC95QnF5+6N4qXc76cjHbkV3cusygHKyWgZkeq2BPwgHU0/Y/8q/0j2YWKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463330; c=relaxed/simple;
	bh=oxOs1fs2lsHZRzMb9OuuTwSWPNKL8/6V5L13g5B7FQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7jQolxDJodSf0HuZFDcjN+5Ohqet6QeK5qo3BZtRC+7j0cu1qc92SH7mCAGnNC+FRdtjg1O/FvWbnEjUpV7TJGJEJvZe6YmHktsGLsZ+9GjhIQSNSUx8FCxAktHAk5y/lrESA6DbWibM8A8P+Im/V4pB/yeEUF8qH5CpwBEMPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=x75qjgC2; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id AB64522AE0;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=oxOs1fs2lsHZRzMb9OuuTwSWPNKL8/6V5L13g5B7FQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=x75qjgC2JLut9a7j2zMn/aWU4OWtLXGbGp1VybOhN47/KVQY+VfZonF8feo3qCbLx
	 sDQhXWwDOexg1xrJVlf+uC2S5+fs88ZEhycAozomC/73MNhux9aVjMEKSRbiGEJTry
	 npokXlJqti6hq1iz01qntxEJnhEOwETG+gtqoAtc=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 21/22] bindings: python: tests: use f-strings
Date: Fri, 27 Sep 2024 13:53:57 -0500
Message-Id: <20240927-vfazio-mypy-v1-21-91a7c2e20884@xes-inc.com>
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
 bindings/python/tests/__init__.py           |  4 +---
 bindings/python/tests/tests_chip.py         | 10 ++++------
 bindings/python/tests/tests_chip_info.py    |  2 +-
 bindings/python/tests/tests_line_request.py |  4 +---
 bindings/python/tests/tests_module.py       |  4 ++--
 5 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/bindings/python/tests/__init__.py b/bindings/python/tests/__init__.py
index 2374e8155373efbd94d5c66dcfdffa7cc23be9f6..a0f22ae717271766b4175a775cc6ec19c9b24441 100644
--- a/bindings/python/tests/__init__.py
+++ b/bindings/python/tests/__init__.py
@@ -9,7 +9,5 @@ current_version = LooseVersion(os.uname().release.split("-")[0])
 
 if current_version < required_kernel_version:
     raise NotImplementedError(
-        "linux kernel version must be at least {} - got {}".format(
-            required_kernel_version, current_version
-        )
+        f"linux kernel version must be at least {required_kernel_version} - got {current_version}"
     )
diff --git a/bindings/python/tests/tests_chip.py b/bindings/python/tests/tests_chip.py
index b719f6ba402c962b3ba8029cef61ed28fd1a525a..3ea2be1d272d0ba5fca59c51f08962508505efb9 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -26,7 +26,7 @@ class ChipConstructor(TestCase):
             pass
 
     def test_open_chip_by_link(self) -> None:
-        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        link = f"/tmp/gpiod-py-test-link.{os.getpid()}"
         sim = gpiosim.Chip()
 
         with LinkGuard(sim.dev_path, link):
@@ -96,7 +96,7 @@ class ChipProperties(TestCase):
 class ChipDevPathFromLink(TestCase):
     def test_dev_path_open_by_link(self) -> None:
         sim = gpiosim.Chip()
-        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        link = f"/tmp/gpiod-py-test-link.{os.getpid()}"
 
         with LinkGuard(sim.dev_path, link):
             with gpiod.Chip(link) as chip:
@@ -206,7 +206,7 @@ class StringRepresentation(TestCase):
 
     def test_repr(self) -> None:
         assert self.sim
-        self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
+        self.assertEqual(repr(self.chip), f'gpiod.Chip("{self.sim.dev_path}")')
 
         cmp = eval(repr(self.chip))
         self.assertEqual(self.chip.path, cmp.path)
@@ -216,9 +216,7 @@ class StringRepresentation(TestCase):
         info = self.chip.get_info()
         self.assertEqual(
             str(self.chip),
-            '<Chip path="{}" fd={} info=<ChipInfo name="{}" label="foobar" num_lines=4>>'.format(
-                self.sim.dev_path, self.chip.fd, info.name
-            ),
+            f'<Chip path="{self.sim.dev_path}" fd={self.chip.fd} info=<ChipInfo name="{info.name}" label="foobar" num_lines=4>>',
         )
 
 
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index 463f07ab8edeec7dde8dacc4829b86dd3b1d6ebd..8d0a2f955edeb7fe8a285e9951f6b4d392f4490d 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -56,5 +56,5 @@ class ChipInfoStringRepresentation(TestCase):
 
             self.assertEqual(
                 str(info),
-                '<ChipInfo name="{}" label="foobar" num_lines=16>'.format(sim.name),
+                f'<ChipInfo name="{sim.name}" label="foobar" num_lines=16>',
             )
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index bae8815b98654145c26071c4fc40816469313192..afee644558b5e734b50a6d90dd6a0a867f466eb7 100644
--- a/bindings/python/tests/tests_line_request.py
+++ b/bindings/python/tests/tests_line_request.py
@@ -635,9 +635,7 @@ class LineRequestStringRepresentation(TestCase):
             with chip.request_lines(config={(2, 6, 4, 1): None}) as req:
                 self.assertEqual(
                     str(req),
-                    '<LineRequest chip="{}" num_lines=4 offsets=[2, 6, 4, 1] fd={}>'.format(
-                        self.sim.name, req.fd
-                    ),
+                    f'<LineRequest chip="{self.sim.name}" num_lines=4 offsets=[2, 6, 4, 1] fd={req.fd}>',
                 )
 
     def test_str_released(self) -> None:
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
index efd49db59e6567b9bc5ee0096ccce3281ac466f3..7120c6346ba4666adb250d0880d5777dbb7666ea 100644
--- a/bindings/python/tests/tests_module.py
+++ b/bindings/python/tests/tests_module.py
@@ -36,14 +36,14 @@ class IsGPIOChip(TestCase):
         self.assertTrue(gpiod.is_gpiochip_device(path=sim.dev_path))
 
     def test_is_gpiochip_link_good(self) -> None:
-        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        link = f"/tmp/gpiod-py-test-link.{os.getpid()}"
         sim = gpiosim.Chip()
 
         with LinkGuard(sim.dev_path, link):
             self.assertTrue(gpiod.is_gpiochip_device(link))
 
     def test_is_gpiochip_link_bad(self) -> None:
-        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        link = f"/tmp/gpiod-py-test-link.{os.getpid()}"
 
         with LinkGuard("/dev/null", link):
             self.assertFalse(gpiod.is_gpiochip_device(link))

-- 
2.34.1

