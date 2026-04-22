Return-Path: <linux-gpio+bounces-35326-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJqiLYQi6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35326-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B424A44110A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADA36300A581
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F399F2D3A6A;
	Wed, 22 Apr 2026 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CutMrMtj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2617BED0
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820862; cv=none; b=eUWi/HJlP7lXRG/SfEh6bRA+vowYG9+OtudmjaDg+sZ/qPIC/ctb/BPSkcZBMpCbJQqJ6ZtnvabKSrXWaZDxiiEJxhzhXO+/Rp164yBAlqyI3UYE4ty7QOBZK6Pf+3roYYafaeg9zs3PWHT/K47Gx1L0hlUQBi41EzzIWDgQsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820862; c=relaxed/simple;
	bh=GCZLfyIbNOnARub7Wn69Ix4LTjbebEeMRo8zT5mSax4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gx4YXlcSMknQU1Wuhe4yYelPBZKEqc27qSkD1nMcbcRTlcFwFhA2EeiBVoXSjtOecFsL2q3X7jkWXSRf87Tibp4HvAdLSIS/K/GBZvieAJTW4faj84WS5YeSUT2G5PJt5g4hNe0INxg99cz7YNbevFQxnPnccBInUFtR5kp7VTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CutMrMtj; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbff06e4a6so4789114a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820860; x=1777425660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1XD3hQYkcduGCjjHcdcY7wdg+6wnPJ7zFhFK7fhs7g=;
        b=CutMrMtj+pzJQ3hHGYba68X7LfYa0LHYeeANHqcs3I8QWjh5OLRJCC2Tq9kasyRzMk
         53inMkvg5iP1t6opeOl1NJ3FX+rcSkkz/VRLapbfXZ5tJPZoTReN9Nf0GWygghSqjCAn
         60ggbaDswbJzHzCO3nqUQSD004L1bzWYAvqdwfgjbJe9JLu6IqQ7o5yh5dVKdvNthpTa
         vS6BEOZPApiD1UXS2q6vuSIqZlsJhhAzxvR1t9X8O9DKju2i6TTQj1v61FkhxgdZYC24
         O8xHxFG/KenCNbru0AEbOl9ugeYoysS83qZocoL2Jp9XuvWH8wBD/Qr8QVT4M2FVITA8
         TJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820860; x=1777425660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1XD3hQYkcduGCjjHcdcY7wdg+6wnPJ7zFhFK7fhs7g=;
        b=mZ17GEWgj+knql2rINYQ+y2bvTPrWtqjP+HPU/gVtnpkBumNQtqgGKEi6UbvsCZjcz
         keMEAYOK9JSifAe1fXgCwYYXKeyVDO6eWDHTmlrnu0mvgN7kEnoYBmrJL0ox6hIpKi0I
         Z3DfkYvd4f1p5QIWC3ZqCS61P4VPpoNxYkdRzfqPs3H49ry1qcZYOKGH7MbcT/49mLPY
         JEzu6sHt4kfE4jxaGQqZEv44fW12a+pxudxNw8p1+QM5ltfbvvgFhQBDiJse9TaPhL7s
         Unuqyv3sYw2e8Wf4Fe6UEPCaU3wRtzCHtLoN2HEceJ+cdGE2IMVKRa0rcCkFgCElnb+v
         OWyw==
X-Gm-Message-State: AOJu0YyxoAktLGkEnqKEjX3H7ZEVd+ASK7pvo35FjxJ7vLOjB8mN+iiS
	aEizXDoxYwdraak4+EiiLCbFbZaqRjHtgvlxFjELNdnB/xzmt/SquPKupHFh/g==
X-Gm-Gg: AeBDievSauK8bCXTZJ8k3ewix7DnpMxREC/Z+DEgmB/pnLBXMhl+DnTPBuq4Pzb+OOd
	npDu2/9x823diSXMUk5sdVQTAIFEupf3pQysJ8moJmIF/tXf0BYbcV5c8VfqhEeuKo7Li2WzYcM
	SaouWt+3l5kO6w2noyhEzLH2u8AkDzsVaDIcq5U3J7YLt3RD1Y3Tvs/qBGP+jGiyiPgohI77Bsg
	Bwr6hA5pvjBqSatzoEQd5qJvHNhllH+VqttdRYaV9I/WhO9fPWX0qe9ioGgV6vYx3LZYihuVhGy
	i3lvi6P6fN0wQzDIHNktyVkPevD42E8E7ErEUxL1agAPk9aWHdBCQIXrwkvvNJALJEVrGskd/f9
	BCNJ8Wo1E2znesf6Y+ivIrgsbEGUtcKbmvqIiukODsXHiWPxT/rrXYbPddJxbUDFLHxi/llNn58
	MqXHfRkL0/nDKVrO/HI+pAFLu0E3CQnWF3FXWwz60iZvP6U0FcEPNjZgYxEYkLS6/2XDGT+AQ5
X-Received: by 2002:a05:6820:1610:b0:694:8576:5d7a with SMTP id 006d021491bc7-69485765e63mr6084461eaf.30.1776820860111;
        Tue, 21 Apr 2026 18:21:00 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:20:59 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 5/9] bindings: python: use suggestions from upgrade_pythoncapi.py
Date: Tue, 21 Apr 2026 20:20:37 -0500
Message-ID: <20260422012041.39933-6-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422012041.39933-1-vfazio@gmail.com>
References: <20260422012041.39933-1-vfazio@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35326-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pythoncapi-compat.readthedocs.io:url]
X-Rspamd-Queue-Id: B424A44110A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The upgrade_pythoncapi.py script performs transforms on C extension
sources to use new syntax [0]. It's generally used with a shim header
for compatibility, but the header is not necessary for these changes.

The suggested changes are:

  * Use the `Py_IsNone` function introduced in CPython 3.10 [1] over
    direct comparison to `Py_None`.

  * Use `PyObject_Free` instead of `PyObject_Del` since `PyObject_Del`
    has been aliased to `PyObject_Free` for nearly 24 years [2] and has
    been announced as deprecated [3].

[0]: https://pythoncapi-compat.readthedocs.io/en/latest/index.html
[1]: https://github.com/python/cpython/pull/25227
[2]: https://github.com/python/cpython/commit/3e7b893899bdaa294a72e894694b099a1d370765
[3]: https://docs.python.org/3/c-api/allocation.html#deprecated-aliases

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/chip.c    | 4 ++--
 bindings/python/gpiod/ext/common.c  | 2 +-
 bindings/python/gpiod/ext/request.c | 2 +-
 bindings/python/tests/gpiosim/ext.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 9061d23..498a5ee 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -271,7 +271,7 @@ make_request_config(PyObject *consumer_obj, PyObject *event_buffer_size_obj)
 		return NULL;
 	}
 
-	if (consumer_obj != Py_None) {
+	if (!Py_IsNone(consumer_obj)) {
 		consumer = PyUnicode_AsUTF8(consumer_obj);
 		if (!consumer) {
 			gpiod_request_config_free(req_cfg);
@@ -281,7 +281,7 @@ make_request_config(PyObject *consumer_obj, PyObject *event_buffer_size_obj)
 		gpiod_request_config_set_consumer(req_cfg, consumer);
 	}
 
-	if (event_buffer_size_obj != Py_None) {
+	if (!Py_IsNone(event_buffer_size_obj)) {
 		event_buffer_size = PyLong_AsSize_t(event_buffer_size_obj);
 		if (PyErr_Occurred()) {
 			gpiod_request_config_free(req_cfg);
diff --git a/bindings/python/gpiod/ext/common.c b/bindings/python/gpiod/ext/common.c
index 62201b6..7d2dda7 100644
--- a/bindings/python/gpiod/ext/common.c
+++ b/bindings/python/gpiod/ext/common.c
@@ -12,7 +12,7 @@ void Py_gpiod_dealloc(PyObject *self)
 	if (ret < 0)
 		return;
 
-	PyObject_Del(self);
+	PyObject_Free(self);
 }
 
 PyObject *Py_gpiod_SetErrFromErrno(void)
diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 9940382..46e07ae 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -286,7 +286,7 @@ static PyObject *request_read_edge_events(request_object *self, PyObject *args)
 	if (!ret)
 		return NULL;
 
-	if (max_events_obj != Py_None) {
+	if (!Py_IsNone(max_events_obj)) {
 		max_events = PyLong_AsSize_t(max_events_obj);
 		if (PyErr_Occurred())
 			return NULL;
diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index cb5611a..1ebd5af 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -116,7 +116,7 @@ static void chip_dealloc(PyObject *self)
 	if (ret < 0)
 		return;
 
-	PyObject_Del(self);
+	PyObject_Free(self);
 }
 
 static PyObject *chip_dev_path(chip_object *self, void *Py_UNUSED(ignored))
-- 
2.43.0


