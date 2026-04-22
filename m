Return-Path: <linux-gpio+bounces-35324-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFPuJaQi6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35324-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47935441130
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05686303A5EE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ACC258EF3;
	Wed, 22 Apr 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Laq8SqpB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD217BED0
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820860; cv=none; b=p1BJua1U1kJZ30Q+t4sq0+OWQ2cQdY726IGvHdTaqCWp1cDjpLA8aQZi6PMa43lFrbs5bJvKeRQMn8n7ybzGkkbebLIaR2kzJ8UbWhOUy6QeKDGZ+PRuxIv1J86Zn+l2ABYOmj75WEYknAxiuJowzb7BoOTeu0zFE3zwRWoTkZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820860; c=relaxed/simple;
	bh=eqvSFyfwY6bbgfeWS/g/PltErTOLHkYeQS0ydrF0CdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+r1YKt5Gz5sTNEuHvowhwFIF7jfYiUEDAsk3rT8vN43mYb5C+y2THdLx5d0DEhwN5oKAITK/4s/c+AngGmGQQviKzhPUUVc+KuwRycR+OMObakmSR6lkKe2TnSe+3Nd0XqCowZMUKUOQBPSHN6w/M8J00QoZv9B3KkuyrJfDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Laq8SqpB; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6949831a7bcso737496eaf.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820858; x=1777425658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgUyaG7HDk70n5OPkaHwN9Mf4h1G9e5+i3TRPeCafQ8=;
        b=Laq8SqpBLEXcv2qnLmpUexqadZ6oX8jAWQv/voi88oRiXBpGWcFU0v3ECoEzzn1jAY
         4IFrhArn1mfJZjqOEmIaSXJIk6i51FtPmwRTGL9YZtjor6Tpy/9JttBXVsuhZ7vLUamu
         wlP5f+uc6F2wB3uACvPcXw9bauc11AJ6UkUjTG/KyhEWeZ0hyXOEpXHdZ/znlhsD3fsV
         vg5mEnkjWnx4wInr9jlXPs97N1Xnq/jF/1Mrjj5A5e/LOp2fqXZUs0v0MoPexJN6ZsvE
         k7yhVOhyNIS6N1dn67yJq7dVisj2IzyTk+umc6vTB+90Bx/wKthZwCut3osSENYmelVD
         9n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820858; x=1777425658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgUyaG7HDk70n5OPkaHwN9Mf4h1G9e5+i3TRPeCafQ8=;
        b=Zq7uyKNz+FT0Xcyv5Ch0sIqG6EzM6cZQJn85E/XpeHTo3daEMMi50eDaiYPPVVIhKz
         aeFCHzNZ974oLspJiBTSqQGzcyCf56FeVMA9PQ8hj86YYQPHpv1UvOIMF+QjO+BqELvP
         p0gA7szWxFNMYxg8SnhO6HhvExf57zYk60jvNwLyqUcbZQ2HwBD8dk+WCbuHnyPLu1dx
         DdX7h0v8T1WLOudwkmEyBJzWQHo1fPuktJ5mBHSRFYTCVzjcsIewcN1R/DWNj2yY6QHY
         ostgY9QKyuttihASKDwcAa17hJaZynurQxqb6iaobPuklHTUpKoCei04ZF0JLxAm6GhU
         x8pg==
X-Gm-Message-State: AOJu0Yw2AnbgA3fI9YdtcDSt+6B1lsqXZGYaPgi00wZlG6XLbgs4q3ag
	w83VRdVxOuapqHm6011gEaQeig/RVM1hePk7NdTNmdTvsOT9PmhG2LEjM2nGhA==
X-Gm-Gg: AeBDieuNao6rlX93IvshG+nFANIIE/yQC/KBDMpwPo/f0n1Pla1V3cLPE+FN/zn4Gey
	J4kmpaoMoC6enNT+rhS8sV1DuYFQYHQEgHuchC4ZXMQXBSv3jF7qNnp7Y2bka5qaTxgmndCKJca
	BZZKLls+KES2hiIpeSS4A2maPs6ZAjpaoi+wRTT4mI2peNgoyWIcrkcg5FqEUVLiyHRg7jKc1XC
	yTbkff6DBwDSxZd6zaitK9AjMoCSy1+CWe39uktT8ERWVaaMTO85+3FSrK5fCVkNpIcwluc+M0x
	Qbmp9ZV9uA7RITqehSoubOIy8OPChZoi+D3B1PczavOO2+84JFaPwu5waS7a3jZ9gHs1ihNBWvP
	O99tP/xKkVrmqbjRYRl24+0yopiAsAtJafYzlLuVA6dOnXzdL4en0OmjQhrb6Kx1mx/mh848cv1
	DD5fQKsGn5DPRY7VEhXwcQHLl+nSs2cOmB4tM3FuSlSPXznsefNeTfGroYT4VT2yYqnOt163cD
X-Received: by 2002:a05:6820:3098:b0:694:8e29:a920 with SMTP id 006d021491bc7-6948e29ac68mr4826381eaf.39.1776820858162;
        Tue, 21 Apr 2026 18:20:58 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:20:57 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 3/9] bindings: python: avoid PyObject_CallMethod during request finalize
Date: Tue, 21 Apr 2026 20:20:35 -0500
Message-ID: <20260422012041.39933-4-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35324-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 47935441130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PyObject_CallMethod function jumps through hoops to find the method
to call and to build a stack (if necessary) to call a given method.

In the case of finalizing the request object, that overhead can be
avoided by simply sharing a function with `request_release` to close the
underlying gpiod_line_request object.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/request.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index 9acf828..1e1f65a 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -22,10 +22,19 @@ static int request_init(PyObject *Py_UNUSED(ignored0),
 	return -1;
 }
 
+static void internal_request_release(request_object *self)
+{
+	if (self->request){
+		Py_BEGIN_ALLOW_THREADS;
+		gpiod_line_request_release(self->request);
+		Py_END_ALLOW_THREADS;
+		self->request = NULL;
+	}
+}
+
 static void request_finalize(request_object *self)
 {
-	if (self->request)
-		PyObject_CallMethod((PyObject *)self, "release", "");
+	internal_request_release(self);
 
 	if (self->offsets)
 		PyMem_Free(self->offsets);
@@ -121,10 +130,7 @@ static PyGetSetDef request_getset[] = {
 static PyObject *
 request_release(request_object *self, PyObject *Py_UNUSED(ignored))
 {
-	Py_BEGIN_ALLOW_THREADS;
-	gpiod_line_request_release(self->request);
-	Py_END_ALLOW_THREADS;
-	self->request = NULL;
+	internal_request_release(self);
 
 	Py_RETURN_NONE;
 }
-- 
2.43.0


