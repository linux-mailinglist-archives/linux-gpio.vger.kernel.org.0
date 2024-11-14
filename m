Return-Path: <linux-gpio+bounces-13024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F5C9C8D48
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45BA12821F4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA4613C3CD;
	Thu, 14 Nov 2024 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="Of9jKf7a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B1212FF70
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595896; cv=none; b=TjsSyFBhvxaMXTTJfiwjpXRFSmPaoXG7QxlNr+60RBlb4F3mAZNo6hcTgphlqcp/34RoxKhoAWPc3tkYLN6XeqVXBt8ePtDnovdImNxgiZ5KqfOwVq9Ai7Ug9dDnO8pLn3331OK97A+2AUT2T3CPlIkqrSOBnc+NTZLlRcemsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595896; c=relaxed/simple;
	bh=PZ2PXOyR3EdAWFgjqGbH0qHNu/MYDSd0UrdD1rj8pac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CQKG4k6ZZ88Z+ZYAUokdCG+TetqMpiJ0jyDPebXpFqPd65Apyv0B9ew6Kwyk+6HDmmqXPGSomLGXW9jABLhFk9uvL4Am626SUz5hSZKlhBrRL/yB5ACkZ88UXfgEAcPL8D04XbpVMzKW/w0zqvTSi8sZ6EnGIK80KbBk2DTC9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=Of9jKf7a; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 119E520ABF;
	Thu, 14 Nov 2024 08:51:24 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595884; bh=PZ2PXOyR3EdAWFgjqGbH0qHNu/MYDSd0UrdD1rj8pac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Of9jKf7a5AGJrEJwqQCUU6TBa5L/FBdgFgOK+y/Lg8NtVDXrY4QCQH2XAxWHeG03a
	 gQgvnhobTxFL9npAYbPgWNiEoZwHdY0nzs3YslPoIz34mb5nne5xyYb/VnkGA8z1fG
	 EmxgeiiYBfHhwBajrvYQM3RTFdS3sWvBzzXOa2D0=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 22/23] bindings: python: tests: selectively use f-strings
Date: Thu, 14 Nov 2024 08:51:15 -0600
Message-Id: <20241114145116.2123714-23-vfazio@xes-inc.com>
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
 bindings/python/tests/__init__.py           | 4 +---
 bindings/python/tests/tests_chip.py         | 8 ++++----
 bindings/python/tests/tests_chip_info.py    | 2 +-
 bindings/python/tests/tests_line_request.py | 4 +---
 bindings/python/tests/tests_module.py       | 4 ++--
 5 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/bindings/python/tests/__init__.py b/bindings/python/tests/__init__.py
index 2374e81..a0f22ae 100644
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
index 9b31e30..d5a64b3 100644
--- a/bindings/python/tests/tests_chip.py
+++ b/bindings/python/tests/tests_chip.py
@@ -25,7 +25,7 @@ class ChipConstructor(TestCase):
             pass
 
     def test_open_chip_by_link(self) -> None:
-        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        link = f"/tmp/gpiod-py-test-link.{os.getpid()}"
         sim = gpiosim.Chip()
 
         with LinkGuard(sim.dev_path, link):
@@ -94,7 +94,7 @@ class ChipProperties(TestCase):
 class ChipDevPathFromLink(TestCase):
     def test_dev_path_open_by_link(self) -> None:
         sim = gpiosim.Chip()
-        link = "/tmp/gpiod-py-test-link.{}".format(os.getpid())
+        link = f"/tmp/gpiod-py-test-link.{os.getpid()}"
 
         with LinkGuard(sim.dev_path, link):
             with gpiod.Chip(link) as chip:
@@ -203,7 +203,7 @@ class StringRepresentation(TestCase):
         self.sim = None  # type: ignore[assignment]
 
     def test_repr(self) -> None:
-        self.assertEqual(repr(self.chip), 'gpiod.Chip("{}")'.format(self.sim.dev_path))
+        self.assertEqual(repr(self.chip), f'gpiod.Chip("{self.sim.dev_path}")')
 
         cmp = eval(repr(self.chip))
         self.assertEqual(self.chip.path, cmp.path)
@@ -212,7 +212,7 @@ class StringRepresentation(TestCase):
         info = self.chip.get_info()
         self.assertEqual(
             str(self.chip),
-            '<Chip path="{}" fd={} info=<ChipInfo name="{}" label="foobar" num_lines=4>>'.format(
+            '<Chip path="{}" fd={} info=<ChipInfo name="{}" label="foobar" num_lines=4>>'.format(  # noqa: UP032
                 self.sim.dev_path, self.chip.fd, info.name
             ),
         )
diff --git a/bindings/python/tests/tests_chip_info.py b/bindings/python/tests/tests_chip_info.py
index fdceda9..dbb7fd0 100644
--- a/bindings/python/tests/tests_chip_info.py
+++ b/bindings/python/tests/tests_chip_info.py
@@ -49,5 +49,5 @@ class ChipInfoStringRepresentation(TestCase):
 
             self.assertEqual(
                 str(info),
-                '<ChipInfo name="{}" label="foobar" num_lines=16>'.format(sim.name),
+                f'<ChipInfo name="{sim.name}" label="foobar" num_lines=16>',
             )
diff --git a/bindings/python/tests/tests_line_request.py b/bindings/python/tests/tests_line_request.py
index bae8815..afee644 100644
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
index efd49db..7120c63 100644
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


