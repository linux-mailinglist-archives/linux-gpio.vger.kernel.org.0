Return-Path: <linux-gpio+bounces-35327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MxxJaoi6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878A44113E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A456303B7DB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD95B2D5436;
	Wed, 22 Apr 2026 01:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhfAU4+Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA3200C2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820863; cv=none; b=LbCkwLnjtfXMlqwdMzK7bYHrpDo/LWMSSwG7OLDR3KfkDcA8nan/j6Ie5m/ub0Kv074hXsW43MPRL6bBMFaDzI+5Yg/MsiIceIglDasRayqJkfQxR94CNF6z4znOqWAohTlWKY2ml/ZpCHv8RHqg7ULZRswoaca2KoEbzNBgoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820863; c=relaxed/simple;
	bh=tpuxXJ4fKIV8MkMtvscHa5DQXdXPFwcCok4985Xen8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJzeGhBE8gjutvj9DL/Z4A674nD4WlFwMZBGts/EIWg9CNGdDpS6FvFo09fSNjiWJvIHn1GXn/WZMMhJ4I39zXlVnpMigQ9UCYxifjpgMVI1CvoqTBGDoeLH5AqbtPaSDSKWzpyEYJyrZl9cJHTme0R37/uZBkVGdYZOo2zDQwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhfAU4+Z; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-42fbf95cca8so317019fac.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820861; x=1777425661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2nMEq+vh8lDv5J7/vwrmy0PP3tp5v9ohfw+PwdcpIQ=;
        b=fhfAU4+ZDgyp6Go3Ta/d+8X7W8eeqsS1zbLQHYvSfaRO4s6MfUHX3YMGnjXb8UW05o
         2oFskavHET5rzQ5vJI90lwupJfh3vLOMc0goomMqTZIxIZFVdOSuGMJaePMuhylNWyb0
         BtZu2baGQRRUmkG4HtOABRUm7xJiuein9QpKT8L34i6FuVF0aHZ4+wFJKH989ctAzA8f
         PYkjvNhYfhbfAhEZPM3g+wH1WILxbL6JD/WgttXK58RXE2F2uywOwcmANhYXu+HEh2ta
         7A+Yi3RiBpjJMK3ST0spreB702EGnuhnGfIq/2wJ146Sc06fXEcjIz/SUANHS5IYO6W/
         738A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820861; x=1777425661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2nMEq+vh8lDv5J7/vwrmy0PP3tp5v9ohfw+PwdcpIQ=;
        b=TdHBQdBQsrKQI8jsb8Pe7ubmFjGamB3bitLNCcXXEjUmO+/Zol8vcgKJrz46W8DPw/
         CEXbfs0CyulaidP2RSI5B8K7etkpyxwSSwfbSm6eJnLrqHaVR0hluzQb5lkwtptOr5PF
         oK2E4SLnqV4xZ8wbAPSwLh92R2xzUZXDiDHdS8jHnc/18PRKVUtxfvc8NbSnf3RNrN7j
         98Ns+aNu6m53kua590fYN6N6hctQ2ySNYS59iOZRSbEdSGOy/1MZo5LtQn0HRWBmP5t0
         XxLbANZQYuZgWXH48gsBNu/S0N73O20aFdF+EsSxPTLs+0jzc1nOCNJqa4U48oGkKjWz
         UYQw==
X-Gm-Message-State: AOJu0YzFv6RF9/Ps4itajo1LO0BE7IfnJY1mRIzOYZvhI3RHThGW+KmH
	ECMpZ62T4q0toMWUOn4QUJPGZmc0Bz6mogQ3Yg9A1TWUjUzliFU/BQKP6R0DiA==
X-Gm-Gg: AeBDieubNzPklF8LrdlbC009dQfclZ0IRdXaH/EPY53RWZiVpLOMMPOUd9Wrx0j7Qb3
	IDJi9i1SmDk2Rxgi8LrXOBBDcW4ky9hRR7kAZ69zsicaFVo+n+u2VoTFTj6FrAZkEKDf0HEQIjS
	x5hkdl+yr1Nn6dRnXChvJZfpwrCkVc0g78fi1u7yOb3FikMIAN3A6iKhz7JmcVoiSdEmqmaInS2
	iT/NQ8J2GJmInNfwDpZQGHqE+uybzyo8WxQqOwCnd9mgkkvAhkTR0d4Iti9YZ8OLGjxefMF7Lc/
	hiiBiTkEEGCbV8Wf9/UU148EHNAKJE653DCXtuVxMa+L3oWrqXk7fMFaD17mr5BSBObi1B5WDEe
	y/TuekACkWXrpQEdVmMaHKnpWfhUTJ/DZIH7w93IcdPvw24KfmPtM1ORJ01+NInngWZfroc8jsy
	d2ieQeqB6F+0OrHT9dNxi9ECraVdwjyOrkNOlhGINmWV5CXnJYZn8eGdZN7fRkB555c+j0T83d
X-Received: by 2002:a05:6820:f024:b0:694:9d60:99ab with SMTP id 006d021491bc7-6949d60a6d0mr2308570eaf.6.1776820861200;
        Tue, 21 Apr 2026 18:21:01 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:21:00 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 6/9] bindings: python: use PyImport_ImportModuleAttrString when available
Date: Tue, 21 Apr 2026 20:20:38 -0500
Message-ID: <20260422012041.39933-7-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35327-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3878A44113E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 035ad74fdd introduced Py_gpiod_GetModuleAttrString as a way to
get a module's attribute and was inspired by CPython's internal function
_PyImport_GetModuleAttrString.

CPython 3.14 added PyImport_ImportModuleAttrString to the public API [0]
which allows us to use the standard function when available.

[0]: https://github.com/python/cpython/pull/128912

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/common.c   |  3 +++
 bindings/python/gpiod/ext/internal.h | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/ext/common.c b/bindings/python/gpiod/ext/common.c
index 7d2dda7..fc28e96 100644
--- a/bindings/python/gpiod/ext/common.c
+++ b/bindings/python/gpiod/ext/common.c
@@ -64,6 +64,8 @@ PyObject *Py_gpiod_SetErrFromErrno(void)
 	return PyErr_SetFromErrno(exc);
 }
 
+/* TODO: remove when 3.14 is the minimum version */
+#if PY_VERSION_HEX < 0x030E0000
 PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
 				       const char *attrname)
 {
@@ -78,6 +80,7 @@ PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
 
 	return attribute;
 }
+#endif
 
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong)
 {
diff --git a/bindings/python/gpiod/ext/internal.h b/bindings/python/gpiod/ext/internal.h
index 15aedfb..2996884 100644
--- a/bindings/python/gpiod/ext/internal.h
+++ b/bindings/python/gpiod/ext/internal.h
@@ -8,8 +8,6 @@
 #include <Python.h>
 
 PyObject *Py_gpiod_SetErrFromErrno(void);
-PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
-				       const char *attrname);
 unsigned int Py_gpiod_PyLongAsUnsignedInt(PyObject *pylong);
 void Py_gpiod_dealloc(PyObject *self);
 PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request,
@@ -17,4 +15,12 @@ PyObject *Py_gpiod_MakeRequestObject(struct gpiod_line_request *request,
 struct gpiod_line_config *Py_gpiod_LineConfigGetData(PyObject *obj);
 struct gpiod_line_settings *Py_gpiod_LineSettingsGetData(PyObject *obj);
 
+#if PY_VERSION_HEX >= 0x030E0000
+/* Alias to standard function available in 3.14 */
+#define Py_gpiod_GetModuleAttrString PyImport_ImportModuleAttrString
+#else
+PyObject *Py_gpiod_GetModuleAttrString(const char *modname,
+				       const char *attrname);
+#endif /* PY_VERSION_HEX >= 0x030E0000 */
+
 #endif /* __LIBGPIOD_PYTHON_MODULE_H__ */
-- 
2.43.0


