Return-Path: <linux-gpio+bounces-35436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMKSAIWb6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D2458120
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F430301D07A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8473537E1;
	Thu, 23 Apr 2026 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUaBoo8N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB92D6407
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982913; cv=none; b=T6LqiW4DUO0RKP0E0Dfw2uzn5fbbmvkAxKXXoIzDD9PXQHbbEy4FwSvueciBOeuugZRheD2C0bIMdyad1yWjk3RO3twue6jTFsHy10tGXFMim47zwjnMuk7yBhDDKBADoZrSB70tIyUhkuxOXcVNnBvFHxd4gyDMVev322KvEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982913; c=relaxed/simple;
	bh=B+h6Z7DC4PubRsgB/GI4oeNGWHyyguTG5D4OqbTTN94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXxZVajKqkEJvMCM+Ieqo7iQ1W1h6v+wKwDs++gtW64fUwaBhPBbfuX9IaUtwjfFdvDMTiE/SYKSsRGGXE9Y8w021bIQpCF1uTSm+FxGKYpZRZsHcVlq4RzFxlA9eNP6j0oUYXS5J2dnVMEGDqoXl7LpXLCOmhtFvX6Sdnq5ob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUaBoo8N; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dcc9b506d9so4034220a34.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982911; x=1777587711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjh9E29+2vOtbDSF8a0lhnexApbQFUzqT/Sl0VtxCB0=;
        b=oUaBoo8NWfP4PauXjbKGQWMWyZMWKeFmPd5kgutcpMz0c//yjzfBvPL3/68fB/QUEZ
         5+/ITRG+uEtg7tcAiWLHdYJO4LtrQExzwkGwnSYQZoqJb6MmG1lDovrIChrfw47jiutA
         CBxtcgmfhMm15gP3MXUwXB/Uy6yUe7zj/T2wRlsMzR66GpXzhBn6NfOa2oHTNV+sdi4f
         AnVA/5yu355D779F25laPCF0ETOoUtL3Vi5zOfgzNegcBrC7AQ8EogrvK733jpwS1cdo
         bPtSDAzG3ZiheM0axudbqAl9y+IKOkqg1EFIuO6npQxIqlRCKtZP4Y5VismmR2zrZ5DC
         JQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982911; x=1777587711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hjh9E29+2vOtbDSF8a0lhnexApbQFUzqT/Sl0VtxCB0=;
        b=LnGQzECZqIJJlxSLAGJoeQv1OCyQCgceDy2kjNbKYGC55EINRSprpI8JyvOivCpw/Q
         JYfgVMdOGn1dNLFPwnQOvvIdjl8vk2XgYmTr3q2BwuHxkwT50+Ro60HHzy9+qH5HOQuC
         YUKkjGXl/47PhsjObSmOTiCDdv40Q8ZLy87gRkjHm0aKWv+ke8lx5XQ2L4o6SKWd4pin
         964BpqI1M9u9ETrrjfB0bv5KrT6miZFDnv1DWs6CZfgUv4DN0JaY8p789EiHY6LJki9D
         j1pjPmGM2fABTBoxrsoCteJUjZFVEjzB0ewFoDO2D56lkdEQ315N5vAZnudL2tTVyc6+
         QkrA==
X-Gm-Message-State: AOJu0Yxl4/gOBonHg8WY43QDK0ciobJjdX6pQlkIjFmWv6x4+ByWAPCn
	YAOtAU3Hl0Rv18/88/8h/1OrPz0WLa/qYeYVgJlNBsbEG8Rx117qK6w20b7jrA==
X-Gm-Gg: AeBDieulouic2NEEfyZoURdM9YbeYg+O/8+nY1k+xf35EyLSHbPzEboS1kWDO4C2OdO
	b2YN5SYskFzNFU/fe7nenff+y9BLXKsQkAT3QU7DksJcK6GckxFLL2OKX2EpSzgHwrAFTQrldKl
	fzNNqGOL82WXo9x3JvsokJobnWxVL5GGPbTh9vpiXIcP6ro10rvpyX8lyRWkNFcyVaCoGaiDJtp
	qeaO5pnTAhHRw87ioKsDpExgG4CVk6Oyrn398v/gxU7bcfgW+mt5ZxUDPjq6LqVGdp93fuRBMt/
	VoHvCjH9mzl1Mvf9K4DJ8ZG6jr38M0NlaGtXNOIYZM3ot3v3lS9dchlkt1Tdg27qgilzFzY9iLu
	NDeAR2J68R4KZ95fH+Wz8/Te444yMC7/R9WTK9R07E7P8X8Xez/XHrRyX9rs3HECCv72UAhTLB/
	y7ft7nvnZ86m03tUm1me2LLcfLUgzOZD0h6iPPyOZTjbmLqlzSMFw7v9MIpFYDR0zIn8Vvp8lr
X-Received: by 2002:a05:6820:1793:b0:694:926b:551 with SMTP id 006d021491bc7-694926b0c46mr9650483eaf.55.1776982910925;
        Thu, 23 Apr 2026 15:21:50 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:50 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 4/8] bindings: python: use suggestions from upgrade_pythoncapi.py
Date: Thu, 23 Apr 2026 17:21:21 -0500
Message-ID: <20260423222125.29097-5-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423222125.29097-1-vfazio@gmail.com>
References: <20260423222125.29097-1-vfazio@gmail.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35436-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5F9D2458120
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The upgrade_pythoncapi.py script performs transforms on C extension
sources to use new syntax [0]. It's generally used with a shim header
for compatibility, but the header is not necessary for these changes.

The suggested changes are:

  * Use the `Py_IsNone` function introduced in CPython 3.10 [1] over
    direct comparison to `Py_None`

  * Use `PyObject_Free` instead of `PyObject_Del` since `PyObject_Del`
    has been aliased to `PyObject_Free` for nearly 24 years [2] and has
    been announced as deprecated [3]

  * Use the `Py_NewRef` function introduced in CPython 3.10 [4] to
    increment and return a new reference.

[0]: https://pythoncapi-compat.readthedocs.io/en/latest/index.html
[1]: https://github.com/python/cpython/commit/09bbebea163fe7303264cf4069c51d4d2f22fde4
[2]: https://github.com/python/cpython/commit/3e7b893899bdaa294a72e894694b099a1d370765
[3]: https://docs.python.org/3/c-api/allocation.html#deprecated-aliases
[4]: https://github.com/python/cpython/commit/53a03aafd5812018a3821a2e83063fd3d6cd2576

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/chip.c    | 11 +++--------
 bindings/python/gpiod/ext/common.c  |  2 +-
 bindings/python/gpiod/ext/request.c |  2 +-
 bindings/python/tests/gpiosim/ext.c |  2 +-
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index be20869..4d96dd8 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -172,12 +172,7 @@ static PyObject *chip_get_line_name(chip_object *self, PyObject *args)
 		return Py_gpiod_SetErrFromErrno();
 
 	name = gpiod_line_info_get_name(info);
-	if (!name) {
-		Py_INCREF(Py_None);
-		line_name = Py_None;
-	} else {
-		line_name = PyUnicode_FromString(name);
-	}
+	line_name = (name) ? PyUnicode_FromString(name) : Py_NewRef(Py_None);
 
 	gpiod_line_info_free(info);
 
@@ -272,7 +267,7 @@ make_request_config(PyObject *consumer_obj, PyObject *event_buffer_size_obj)
 		return NULL;
 	}
 
-	if (consumer_obj != Py_None) {
+	if (!Py_IsNone(consumer_obj)) {
 		consumer = PyUnicode_AsUTF8(consumer_obj);
 		if (!consumer) {
 			gpiod_request_config_free(req_cfg);
@@ -282,7 +277,7 @@ make_request_config(PyObject *consumer_obj, PyObject *event_buffer_size_obj)
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


