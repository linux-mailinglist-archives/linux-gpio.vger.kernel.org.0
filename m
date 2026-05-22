Return-Path: <linux-gpio+bounces-37381-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJJIAJm3EGqFcwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37381-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:07:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20E5B9E6C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5D88301BA6D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F161235CB6F;
	Fri, 22 May 2026 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg7MgVUE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6052C234A
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480272; cv=none; b=Fz4r1/esNkdb9W5guWQtdEm+CDntsf1WhPLx8Rb5c3veCA+nzNDjIvZT+rIR3+GimH1EAYvwMACnsOTjAgOMoArsXkVrBNScEo166/n0ZhJzVomPs91Pyi8L/he59/RH7fqp8D3K1YOBOdq3FMsHxauCP76QcPpR4IdO1ump63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480272; c=relaxed/simple;
	bh=zjJRRnSnLCRZhUBQJHPGS+gYkDaOA5MaOPaCaYF02fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqK2oadeYAqeeD4le6cb/zaxTbDkZQLfzp7vrSbgRQWOUaVFvBNppDqrdRmXm8cH06dCBdNVEnmES5ew4Hu7jSBUdenLM6g1DISJrkPX1y4CBjb+DGcV6g966jwqdPIp5wwR0YSKTAJT1GK7wq0Ek02pam7JvznPSfB761Bp7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg7MgVUE; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-479d85152c9so2962777b6e.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779480270; x=1780085070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3/f7jjAt9YUgdDn5iRUlNwA0G3pT/8TfZTADNpfjpM=;
        b=eg7MgVUEJuR1Kl1FJ/KYso2NJIGUbs5GMVuOYfnDvZdDD/SoculsjeTzeDU+FkxfVq
         YssPcC88q+kCSBSzXiDlbpP1UeQBsasQ41EhodlwdaOJSFZMtesjohYSkmczY/V3l6IB
         nduTQSmXKRhnAVwXYUb7rOU1UyQmEH1yV6r3vvfGSHelWBo2PloKV0ywz25kqMt/rYul
         iArHtnLhfjRGMLhh++SD56JCcZ+lLGbL4dg5wQ14DDDtkNmvRJfLHs7PuvnbZVdp+YJ9
         bl22ktP72cHFd5iJxbQsNf9WkxDLOd8J6RJucAk+MZulMgk2xcR3S1tEDtJPsNQKZ1G6
         Rg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480270; x=1780085070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3/f7jjAt9YUgdDn5iRUlNwA0G3pT/8TfZTADNpfjpM=;
        b=hjuwdj9RjoiTr90sQElwW5dq7jbxXuN25AuVOvhrp7qsOAZKn6FO2WxfPnOWovqVt4
         eHFctIeKn3S2/2+K5eetCXWCuT7D1qmwrKiEs/jF6F9JB/rgfsV2NqiiZPk+Rv+vxKDm
         HucUytrWcOys/nstmbheCY2X1W7BowCJ9RRQcTC9a4xUWwdj98Pnl5vOJyI4PE+rdyOo
         RBL6ghjh3mKlGIkW+e1q8SQTsIw5mNkorRUY3vhgtKanTNjobZo7LjWxvXMxD+Lxg1hw
         toNqDYDwWem4oSDADtRUsoV+/fyIKJnSj56Ecp8uJG4SJIIAWMTZDJejE6TPU/Di27zZ
         PMWA==
X-Gm-Message-State: AOJu0Yw99cr32tRHNYVKwYo8RO0KiZv0EhgVbvk+g3hAMQ7oIgb4LyKa
	UHvuLcjBynZ+TQXgA0fJoldgb7M2050LnyKOiN3PFnYiLS01zsm8Atfv0Qmwng==
X-Gm-Gg: Acq92OEfAq6Ow4LL4cdkqLuTYfRlItMyf979tuSv67RB+pvmOhHl7UZWZLlos3YicPb
	C4SJr7cOShu5ZKE8rT/HJx86EQ/ncAahZ3ljc4rhnvVgiwT1ZfKPL/51Z67TehzlLFstCaEaL1Z
	m7CWUhlcJv0608AM/+bb2fJIfLe9asr/nEcXbqinQHO9J6t8kvVFl+UAnJT1fhVFzyxBi5F7m9p
	EoRr9Z/VIy4b2E1KFYofaPPXChy06X39Hcptu3FvaufibEA/y+kFmWrEoCn8b0hnZL57Udj1Lqd
	tmPeQF23GRjDL10Kcy7zw3fNKY99E4EOdVkyn48MlJB81+5vSdot7ytC0QJEG03vsw08TXdY7ct
	xyBnaagqVOij6Mgh1AjcUOMlAQKjbEJYjbXQ5C5sRQQUIyI9PXOOJecKc0+p+C9VZ29atZL2zet
	upBUVliWy+PYYCM1HkzAtVac7vzAtl65Uit6yx6FIjqs5f24o0UQJgXXso7mKVMw==
X-Received: by 2002:a05:6808:6f8e:b0:485:4883:ce51 with SMTP id 5614622812f47-4854a278535mr2938564b6e.22.1779480270301;
        Fri, 22 May 2026 13:04:30 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485544e320csm1054591b6e.5.2026.05.22.13.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:04:29 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 2/3] bindings: python: support free-threaded CPython
Date: Fri, 22 May 2026 15:04:17 -0500
Message-ID: <20260522200419.105496-3-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522200419.105496-1-vfazio@gmail.com>
References: <20260522200419.105496-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37381-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,python.org:url]
X-Rspamd-Queue-Id: 5D20E5B9E6C
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
 bindings/python/gpiod/ext/module.c       | 5 ++++-
 bindings/python/pyproject.toml           | 2 +-
 bindings/python/tests/gpiosim/ext.c      | 3 +++
 bindings/python/tests/system/ext.c       | 3 +++
 bindings/python/tests/tests_threading.py | 3 +++
 docs/python_api.rst                      | 6 ++++++
 7 files changed, 27 insertions(+), 3 deletions(-)

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
index e9f551f..faaead0 100644
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


