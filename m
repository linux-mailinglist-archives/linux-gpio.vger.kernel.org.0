Return-Path: <linux-gpio+bounces-35433-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJAcHIKb6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35433-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9F458110
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CBC3301D075
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90763537E1;
	Thu, 23 Apr 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObUFvxPZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD52EC081
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982910; cv=none; b=B1UkAfH1mzuvUHpCfUAuMA9tQFG0IByui1QAE3kbKfBtFLEaJuCOmanvfQE9MDHLYfIn3X6LRQajsympr8b/tvE8BIogDTWImKwh6+HElvF6Lg5qh4CPrcRquSWts4jCuy4wk+v8ZzroA6+jF4dqEmpHQ7SGohziuFuPdD49FOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982910; c=relaxed/simple;
	bh=mzA/Crk3gOw89p22aFb/cLw1xnD4zTkzltGXRXBSdFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeD5wjnWjq9WZdccPyTLNDIGQmrsotQhCxPf4KNj70zWhTfOIsL/zKzTpCHFxmk0yUCoE7fKwyHOc9/+RQQapuBVuIBUb9kFowuj5BWNxJ9sjk58vdl8uFDNjisaz3Ids4qPAx+wjj4aaeLXp/wQcp2gYdEGD5IsBwL9wVl/C5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObUFvxPZ; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-463a0e14abfso3639061b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982908; x=1777587708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERrsV2F90Eu+FXnm7g27tfvdZlqt7SQ8Z6LaFSOyKbQ=;
        b=ObUFvxPZ2WyoFl/XNUnHULofCanuAlq9HwgWh476vOvc0nySrSFZVHQSI85LgGPnyz
         t9R/7KNy5vKwdo52ndRpAlmfL2KpOr4xNivW7Qm2ZyKdME4XKETKccOjL7ZY2YC0tKTW
         xNpe44Rt7HFCiqTEeoY0/wwit25rNAeuOBKJejqClPlEK50xwLuJ+1c3etf/JQdb6gmX
         1QX19RsEpQW/ADVJ2XwSb+k0muCxhpoA6J3LYjnjMZl7iw3+7HSwVIkF+GFPnMpSSz4A
         snC/zGhXj6QiLENAqjYbM4QSi8sXaydRSAbtcaNUBHS1KvPJ5ILgksaikmalaWCdyO8z
         BHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982908; x=1777587708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERrsV2F90Eu+FXnm7g27tfvdZlqt7SQ8Z6LaFSOyKbQ=;
        b=HmJlkKQmRxGIyqcXkbBGsSh+tD3fBTEa9qhmf/C/IeZAAZH8Ip005ZiEFNaXjSAxWu
         PNCk3NzzYmp4UWnWC/IoKb1ac+fqyI8CLKZHuKh/SpmKM1ISCultnQu+0GeW4DXAp7p2
         WsBAErtmp1s7LGkatPrDATSsIrErlhXBqiXgo8eHj/ibFQ/1IHDGjXXjAPL0ZH/JiV51
         qRF2IAphaIWhbv+41lAOxzvruu6ifIPxBAflA5Mzv6S9vZKOMAxx6EJRuCzsHklSI3mM
         W+SKB8TGtGpxmQzAy2DxHM7Kklytvseo1PpuWbB0JgN3aN8GP+lK6+e+rApqlmZlBAS+
         /r2g==
X-Gm-Message-State: AOJu0YxFAol7HdPBn9Oj637Bsmbs1NZnQPj1joi8vyuWoor2SjXkpOOr
	+gnhAVs1DKXIEjleFSFP96bqn4JTdd0JSSwdpidvLTW2yhWfdkJSeIRQdbielQ==
X-Gm-Gg: AeBDieuv7Nk9RlEsjwBqdH6hgDHVFAvNXGp3BTQVP6AKL3FyDaFmezZC64A5WFP4Kzt
	ilHVH9XNLOKvVhCnrl9C+Ff5+67wB5dv3QX/mGe22dXt00VtY6xGhNl6okV8id38oHaiQSuKleJ
	m/dRmIf8OSRK0+JjF1Tml99APlSe1o4s4TJMYfkmyKI5pQlYy5CEEvwGZnQA8A3GbdrKROhXgWf
	CMlni6ZUhyR32NBexHP2ZFc1d0jOTYmJjIyctMxlJR4KiG+cwvMqJHYrlwGEXKF9LILXQc+Lv9F
	jGy9Auwog8Gv0RPiQe0VinwtyASFGPMQRNZlskpo9+edh2BwxwSWJnDwumje5Q/zsRpLVr7MeiR
	pgrCFKgbSB/Hr6kFBHbMKPkTy5wCD43kaZysqt5e3FYZtkvFUX7+AMe8I3fW0LQH8NyoHS/hAao
	o6EOqrsJ7vUASq7wScGNEKTlkTXiaBosD5JUopH12CroWyqAPlGskWP9rLeOE/hRB+RSon0yqW
X-Received: by 2002:a05:6808:690b:b0:467:880:744a with SMTP id 5614622812f47-4799c9fd09dmr15898633b6e.24.1776982908006;
        Thu, 23 Apr 2026 15:21:48 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:47 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 1/8] bindings: python: avoid PyObject_CallMethod during chip finalize
Date: Thu, 23 Apr 2026 17:21:18 -0500
Message-ID: <20260423222125.29097-2-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35433-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: C4E9F458110
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PyObject_CallMethod function jumps through hoops to find the method
to call and to build a stack (if necessary) to call a given method.

In the case of finalizing the chip object, that overhead can be avoided
by simply sharing a function with `chip_close` to close the underlying
gpiod_chip object.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/chip.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 53c4b80..be20869 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -32,10 +32,19 @@ chip_init(chip_object *self, PyObject *args, PyObject *Py_UNUSED(ignored))
 	return 0;
 }
 
+static void internal_chip_close(chip_object *self)
+{
+	if (self->chip) {
+		Py_BEGIN_ALLOW_THREADS;
+		gpiod_chip_close(self->chip);
+		Py_END_ALLOW_THREADS;
+		self->chip = NULL;
+	}
+}
+
 static void chip_finalize(chip_object *self)
 {
-	if (self->chip)
-		PyObject_CallMethod((PyObject *)self, "close", "");
+	internal_chip_close(self);
 }
 
 static PyObject *chip_path(chip_object *self, void *Py_UNUSED(ignored))
@@ -62,10 +71,7 @@ static PyGetSetDef chip_getset[] = {
 
 static PyObject *chip_close(chip_object *self, PyObject *Py_UNUSED(ignored))
 {
-	Py_BEGIN_ALLOW_THREADS;
-	gpiod_chip_close(self->chip);
-	Py_END_ALLOW_THREADS;
-	self->chip = NULL;
+	internal_chip_close(self);
 
 	Py_RETURN_NONE;
 }
-- 
2.43.0


