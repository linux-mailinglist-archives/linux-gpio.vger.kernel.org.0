Return-Path: <linux-gpio+bounces-37601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO1HOFlpF2rcEAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 23:59:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E11185EA814
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 23:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D71F6300D779
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 21:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBD03B5F50;
	Wed, 27 May 2026 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0XIXDhp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F03921C6
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 21:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779919189; cv=none; b=aXXFotN7cD2pfNnPIT9Oy7A9Usw2pt01LH2t51maC/E4t98d2hlkOf31+TPeW7B3W503WQI+Gqs3M9j3+FPQFWGn3GU7+XAzyo6ADpmjCFwUt1ILVxEUu3v/qL36Q6ZUllnvnjJ692162Hf25NDaAhtTCvYFdzpAG3QftIiMjCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779919189; c=relaxed/simple;
	bh=Nj/vC/emn8VeiaNtg+0vTG0iJZW8SkhMjz/PS9xuyRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVTj71pW5OBgfZepACQKrP05J6VKYc466I655ORwgBxboW4qHz4ICFFQDJZqc4JAjpexWsN77gHQ3gRLUGqII+LRlHbFI+pW1ep1JtoH5KxPGd0e2cRQqSMNbVPf6MKPWLHSy7sxFjsNiLsUmNUy1cO5+UQbCX6UujyUGTgDbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0XIXDhp; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-47c7b282d73so7699338b6e.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779919186; x=1780523986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWRJr8ntTvDJwml2In/PUkPILoEsfZ90MmoRKoRprtc=;
        b=C0XIXDhp3wOE3HDWLwnHpXVw8A8v+voLEA9nNTJFj5WivtA6dwXp90SgTIjHaPvYwT
         rSO5NLBObyiTTgnkj0zmjp/c3H7l6hPGAYL5cyYV5XNH0UKE52Z6CSLFRIqGM9c4Zrxi
         RVdTcooSm/wpYueP5JdhB/ND3rT0KFuCc5VdbUcYIDHz5QcifGh55MIu3G9iTnCBMz95
         ozA9bw5lFccPcL0NSHxCyhyZD2yrPr9KYG+6JbCo4KbUxLLA4XP83qi2JIwN8RguOmts
         zzhqfXrrNj6ToGL2SG/hUsX+mUXOpsYvO/T5mQ1BUP3degc0d3AJHnehfrPwm+U77k74
         qQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779919186; x=1780523986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWRJr8ntTvDJwml2In/PUkPILoEsfZ90MmoRKoRprtc=;
        b=MVTPjlVvMjPK23Sug2pt82DGkWuhSNxeUMSy6xQh4lh0tqpiap6o8FBoRCgGeys8Zl
         EbUDRZNJqMMEbjOg+1SDLCckjeADmVNhUGw3DMXK6tM7shN6lsfJ2MF4e1Ihpd07yAd3
         LYUSQS3YllOCWUrtqUz2sFAVe7pBLusuuL8DU1e+g+ScuT4soEZofV+/V19js2Kdr8Ym
         MRxWkkVeN4TeI8O/e6QF/VrRDZ5pS+PCgSHY7JLSEirI27bAN9/cz6Y0sd3UFJCZQ1mK
         r1kcvG80zPhJHN7MUMNzcrTLw2Wkrg1mwfwxUC5onQGtvAkHiSHeWRoPKh8G/AXtBKrY
         IIrA==
X-Gm-Message-State: AOJu0YwNkc3462IdM4S0BGR6bOY1BGZkJi+NhnwwkVwoZHnhrIl3vx+u
	+rk5xvEADUgd2oEGV+JfsxpBDAgLKgpJ5go3RRUSIZeo8uRw/2EJzmUpqcp83g==
X-Gm-Gg: Acq92OFHe+QnAKQZi8EL6+jmnZxDmAW6jlT1Lp5w2zBN1otIM8BjopAEeldzG3PID8L
	Hm4QEET7avjmvwPxEqhtIF3ooBrTrnWLzF2h8L0l4D2f2LgtGTOUwwqtueWYnhx/aL9lIOxxkeM
	29x6Zg8x4xiFGUONIXhvcGMN6pY2GgwuLjZUVktGr6rfJwkgH/muocDf1xArwML6gPH35b3KozS
	64Bak114f2dizrbxIBaXwEAkKEhJzmbzvSEezh4UfiPQuv4jgdARP2aT0n1UG2ELrRmQlK2bka5
	YIsbgnrT8fgAHvg3yuE4eVGKZ2uCIG0W12za03cyuSX0wkZBp00tVh0mtPUXshIwn5QjMfH11VA
	CHoZPDd9LacITPjZlqBp7PMbfm6WHuEinw8y4aT/VCPvJJ+KlWtX0+b28q9jXvkQZVdfI/Y+KxP
	hSBMedIw4OCUR3fCd8AopJ0WQ6/d2t34rol1DrEAINQocWSDDoAjCtT77cEcxsBHujLIgay9t24
	R/zQp6Pr3M=
X-Received: by 2002:a05:6808:4fea:b0:484:e5e2:6b99 with SMTP id 5614622812f47-48549ecf994mr15551059b6e.1.1779919186345;
        Wed, 27 May 2026 14:59:46 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6065e7cb6sm12803303a34.16.2026.05.27.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:59:45 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 2/3] bindings: python: support free-threaded CPython
Date: Wed, 27 May 2026 16:59:21 -0500
Message-ID: <20260527215922.18678-3-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527215922.18678-1-vfazio@gmail.com>
References: <20260527215922.18678-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37601-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,py-free-threading.github.io:url]
X-Rspamd-Queue-Id: E11185EA814
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PEP 703 [0] discusses making the GIL optional in certain builds of the
CPython interpreter.

This build option was available experiementally in Python 3.13 but has
since been stabilized in Python 3.14 per PEP 779 [1].

According to the porting guide [2], there is no strict requirement that
C extensions must be thread-safe.

Experiments have shown that no logic changes are required if callers
use sychronization mechanisms provided by the Python standard library.

The documentation has been updated to call this out specifically using
terminology from the porting guide [3].

[0]: https://peps.python.org/pep-0703/
[1]: https://peps.python.org/pep-0779/
[2]: https://py-free-threading.github.io/porting/#define-and-document-thread-safety-guarantees
[3]: https://py-free-threading.github.io/documentation-principles/#free-threading-terminology

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/README.md                | 8 +++++++-
 bindings/python/gpiod/chip.py            | 3 +++
 bindings/python/gpiod/chip_info.py       | 4 +++-
 bindings/python/gpiod/edge_event.py      | 2 ++
 bindings/python/gpiod/ext/module.c       | 5 ++++-
 bindings/python/gpiod/info_event.py      | 2 ++
 bindings/python/gpiod/line_info.py       | 4 +++-
 bindings/python/gpiod/line_request.py    | 3 +++
 bindings/python/gpiod/line_settings.py   | 2 ++
 bindings/python/pyproject.toml           | 2 +-
 bindings/python/tests/gpiosim/ext.c      | 3 +++
 bindings/python/tests/system/ext.c       | 3 +++
 bindings/python/tests/tests_threading.py | 3 +++
 docs/python_api.rst                      | 6 ++++++
 14 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/bindings/python/README.md b/bindings/python/README.md
index 2faa6f4..f3cd77a 100644
--- a/bindings/python/README.md
+++ b/bindings/python/README.md
@@ -5,10 +5,16 @@
 
 These are the official Python bindings for [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/).
 
+Both GIL-enabled and free-threaded CPython are supported.
+
+The Python bindings, much like the C API they wrap, are not thread-safe and do
+require external synchronization by the caller to serialize access to objects
+shared across threads.
+
 The gpiod library has been vendored into this package for your convenience and
 this version of gpiod is independent from your system package.
 
-Binary wheels are not provided. The source package requires python3-dev.
+Binary wheels are provided for some platforms. The source package requires python3-dev.
 
 ## Rationale
 
diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 6b7b32b..2acb872 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -50,6 +50,9 @@ class Chip:
 
         with gpiod.Chip(path="/dev/gpiochip0") as chip:
             do_something(chip)
+
+    Synchronization: objects of this class require external synchronization.
+    Protect calls with a lock when sharing an instance across threads.
     """
 
     def __init__(self, path: str):
diff --git a/bindings/python/gpiod/chip_info.py b/bindings/python/gpiod/chip_info.py
index 737a45e..1a81a9d 100644
--- a/bindings/python/gpiod/chip_info.py
+++ b/bindings/python/gpiod/chip_info.py
@@ -10,7 +10,9 @@ __all__ = ["ChipInfo"]
 @dataclass(frozen=True, repr=False)
 class ChipInfo:
     """
-    Snapshot of a chip's status.
+    Immutable snapshot of a chip's status.
+
+    Synchronization: none required
     """
 
     name: str
diff --git a/bindings/python/gpiod/edge_event.py b/bindings/python/gpiod/edge_event.py
index c888cb2..99bb83d 100644
--- a/bindings/python/gpiod/edge_event.py
+++ b/bindings/python/gpiod/edge_event.py
@@ -13,6 +13,8 @@ __all__ = ["EdgeEvent"]
 class EdgeEvent:
     """
     Immutable object containing data about a single edge event.
+
+    Synchronization: none required
     """
 
     class Type(Enum):
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index e567f07..21ea519 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -188,7 +188,10 @@ static int module_exec(PyObject* module)
 
 static struct PyModuleDef_Slot module_slots[] = {
 	{ Py_mod_exec, module_exec },
-	{ },
+#if PY_VERSION_HEX >= 0x030E0000 && defined(Py_GIL_DISABLED)
+	{Py_mod_gil, Py_MOD_GIL_NOT_USED},
+#endif
+	{0, NULL},
 };
 
 static PyModuleDef module_def = {
diff --git a/bindings/python/gpiod/info_event.py b/bindings/python/gpiod/info_event.py
index cd2785e..e3dd582 100644
--- a/bindings/python/gpiod/info_event.py
+++ b/bindings/python/gpiod/info_event.py
@@ -14,6 +14,8 @@ __all__ = ["InfoEvent"]
 class InfoEvent:
     """
     Immutable object containing data about a single line info event.
+
+    Synchronization: none required
     """
 
     class Type(Enum):
diff --git a/bindings/python/gpiod/line_info.py b/bindings/python/gpiod/line_info.py
index d31565e..b11ed42 100644
--- a/bindings/python/gpiod/line_info.py
+++ b/bindings/python/gpiod/line_info.py
@@ -12,7 +12,9 @@ __all__ = ["LineInfo"]
 @dataclass(frozen=True, init=False, repr=False)
 class LineInfo:
     """
-    Snapshot of a line's status.
+    Immutable snapshot of a line's status.
+
+    Synchronization: none required
     """
 
     offset: int
diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index a271080..dc7cd22 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -26,6 +26,9 @@ __all__ = ["LineRequest"]
 class LineRequest:
     """
     Stores the context of a set of requested GPIO lines.
+
+    Synchronization: objects of this class require external synchronization.
+    Protect calls with a lock when sharing an instance across threads.
     """
 
     def __init__(self, req: _ext.Request):
diff --git a/bindings/python/gpiod/line_settings.py b/bindings/python/gpiod/line_settings.py
index 3752acd..e54bc80 100644
--- a/bindings/python/gpiod/line_settings.py
+++ b/bindings/python/gpiod/line_settings.py
@@ -14,6 +14,8 @@ __all__ = ["LineSettings"]
 class LineSettings:
     """
     Stores a set of line properties.
+
+    Synchronization: none required
     """
 
     direction: Direction = Direction.AS_IS
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 98bb44c..7c4474a 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -27,6 +27,7 @@ classifiers = [
   "Programming Language :: Python :: 3.12",
   "Programming Language :: Python :: 3.13",
   "Programming Language :: Python :: 3.14",
+  "Programming Language :: Python :: Free Threading :: 3 - Stable",
 ]
 
 [project.urls]
@@ -70,5 +71,4 @@ ignore=[
 
 [tool.cibuildwheel]
 build = "cp*"
-skip = "cp31?t-*"  # Do not build free-threaded wheels
 archs = ["x86_64", "aarch64"]
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index c15ebf5..cc7bd37 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -367,6 +367,9 @@ static void free_module_state(void *mod)
 
 static struct PyModuleDef_Slot module_slots[] = {
 	{ Py_mod_exec, module_exec },
+#if PY_VERSION_HEX >= 0x030E0000 && defined(Py_GIL_DISABLED)
+	{Py_mod_gil, Py_MOD_GIL_NOT_USED},
+#endif
 	{ 0, NULL },
 };
 
diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests/system/ext.c
index 8f451fc..8b307f6 100644
--- a/bindings/python/tests/system/ext.c
+++ b/bindings/python/tests/system/ext.c
@@ -68,6 +68,9 @@ static PyMethodDef module_methods[] = {
 };
 
 static struct PyModuleDef_Slot module_slots[] = {
+#if PY_VERSION_HEX >= 0x030E0000 && defined(Py_GIL_DISABLED)
+	{Py_mod_gil, Py_MOD_GIL_NOT_USED},
+#endif
 	{ 0, NULL },
 };
 
diff --git a/bindings/python/tests/tests_threading.py b/bindings/python/tests/tests_threading.py
index a61af5b..6fbf8be 100644
--- a/bindings/python/tests/tests_threading.py
+++ b/bindings/python/tests/tests_threading.py
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2026 Vincent Fazio <vfazio@gmail.com>
+
 import errno
 import fcntl
 import os
diff --git a/docs/python_api.rst b/docs/python_api.rst
index 2c4f59d..57d45ff 100644
--- a/docs/python_api.rst
+++ b/docs/python_api.rst
@@ -17,6 +17,12 @@ easily through Python scripts, enabling tasks such as reading input values,
 setting outputs, monitoring events, and configuring more fine-grained pin
 options.
 
+The Python bindings, much like the C API they wrap, are not thread-safe and do
+require external synchronization by the caller to serialize access to objects
+shared across threads.
+
+The bindings support both GIL-enabled and free-threaded CPython interpreters.
+
 .. note::
    Python bindings require python3 support and libpython development files for
    building from sources.
-- 
2.43.0


