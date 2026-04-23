Return-Path: <linux-gpio+bounces-35434-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE/5D4Ob6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35434-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF392458118
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA4BB301D681
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE3B33C507;
	Thu, 23 Apr 2026 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe13W0hL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB9B2D6407
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982911; cv=none; b=pEsuwmmvmlS+UsU5qP2I3vVsHf++ucAjrq2zAMYRlSqwqF3vB8bdeDYTHHNu1brSWkg/wGSeJ4YrIM1G4Oykxz4NlOfZi06MzvuCuk0uFo9z3Uqfzp8yfm/1Ik53oD3/DSPoAi2zI8mLR8oZGeTcAvdBlKVPRRdIzUhUzyOvevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982911; c=relaxed/simple;
	bh=eqvSFyfwY6bbgfeWS/g/PltErTOLHkYeQS0ydrF0CdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwwqkzE2UVISfLSQZqwnsDd+WvmtDeJmxB4+NYS0yLA13Lkr8DCDp11fIcqARzK+/HdAN31NpVYnHpstbfmMVtPBuEQuH5ytSnAkj75fTp3siwRvvN46gBAhtrHFrH+WMPc19+nZQ1GsiAuBze+mu6JRufovwwG5tt4XpREDE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe13W0hL; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d55b97f358so4600678a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982909; x=1777587709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgUyaG7HDk70n5OPkaHwN9Mf4h1G9e5+i3TRPeCafQ8=;
        b=Oe13W0hL84jYIrLNcKAobXP2xw+A9PWfDi/tq2a3M821ZT0HV+2N+7l45ncOjyOjzS
         tLVV19Upin+5yWU732K0EtWejKXFR7dKFoXr1JBY/bhMdZex8Tcz2537HLMS/49EU5a2
         lsrZ/lv0HPcVtwL3Z1iQK7xlgPi8nePAwpwAVfOuKDalutGx7jX8ZjTCufvM4WJEEHyi
         ztwrxVl3zePpod4hOVVOEqSmW9LafaUoOcdZVUD+ML48B2hW58w6sKF+L6gmQqBaicHy
         erOyOclbXJpdV3+kBR49Er55sOgia+XIPlO6SMNV6lbKtFfqNhmmeWD/InDIkD5Re97K
         tKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982909; x=1777587709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgUyaG7HDk70n5OPkaHwN9Mf4h1G9e5+i3TRPeCafQ8=;
        b=nUYDhxfS8lYV11lalH1nMQzbf2Tmk9fA9xccnYMyBJY2sr9gAuolnfj+N19NbdLRGb
         VDfX1duguwKvQPouDGadvpcMU6MQd2goBpnejEO9bRtfBoq91X9S4ySLBLaZq9RfP/MV
         zUKjuSdeBNJIvSvbCbnTUvDti5MZvbrJqxvN9EIEVbJTf3lluLktMgwuLs49XQoREx/S
         KOn1TyseXGiRX6m8/IY9rCxMAD1iXAq48ZQq7afyCcYsnWYdfe5OZqgfI5YQgk3UCXTB
         iVkl9VUgR8prJ/WlcS30g09aUlZa8MZxiYWTa/KP5lyMvwy9e6Zr7t+yqy8g4O3Vp/hv
         eVMA==
X-Gm-Message-State: AOJu0Yz5JaE0BlnYDmEUfTk0lFMXieWU+iv9mpjZy6CNHLNrT1kAoTwa
	6HyljQ+WfvtVdS8csN/PQDQEm7ZGaheBH6vo2HqV/CH2irAh+VKJ9pMje31bGw==
X-Gm-Gg: AeBDievz25olafu5T8aEMcjRLi4hyX3LTxqcOpjbMcwQCyiIQMUcWFOPqnY2xvXzpvn
	KkIfAv8SssJVCF0iuL3hbd85T5nRzeWxzoRDl2Vl0EE7zNFYmbVgCAgugec0n/qESoShVR3bcEH
	SkyVKK7x2LaZyhbnh38/cDz0VSaDJHh/I2zVUqIClomQynf7BRd2V/v90nzKWBQ09NveEjyXjOw
	6OG2MfCyOtr6iaYKobFuZFwmZ4LVJTvYAiCQ7CRdGuow0l5H9HrQn7IbS3n9ut/7B48EI3HMeix
	jlDioazwFV8A2wpCkxtailpop103C8rm172XvIM2SJrvNMUh6VTd5bLsvSpPvhpTJoKdZVbhrEU
	yefbcc2iN5MZzJgF2yirj5z0aN5Pvx8AmnVo9kmIp8wkhx4yqNTen8XhOT8J+Fvsy5/z0eiyoad
	g+JHaoMImjxQV+6jQTeGGFyS4cJ7Vdnm9moeXkrnGPxRpbrEJBtNxBvkXb5g3fU+bl07liAcnQ
X-Received: by 2002:a05:6820:220d:b0:692:234a:e202 with SMTP id 006d021491bc7-69462f296dfmr16603245eaf.55.1776982908924;
        Thu, 23 Apr 2026 15:21:48 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:48 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 2/8] bindings: python: avoid PyObject_CallMethod during request finalize
Date: Thu, 23 Apr 2026 17:21:19 -0500
Message-ID: <20260423222125.29097-3-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35434-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: DF392458118
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


