Return-Path: <linux-gpio+bounces-35439-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAgZOomb6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35439-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:22:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC545813D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61337301E97B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359AD37C916;
	Thu, 23 Apr 2026 22:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMtuXWGU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB02EC081
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982916; cv=none; b=vEWw6JS0+3FFHo+b0QshXpiuBUxdoPegINXI5s6qrs599Vm2zUO+wXqnxA4DN4IXVxNG4wePssTdxiphLRdvEss9wkQgJg4x4dJO4lX0peM/RHM7zkvPasIi6Q1qq9mNFwV5s7/FpKs2NFw96l5Hm72epQYHbMI6KjKuC/dMlfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982916; c=relaxed/simple;
	bh=FabEycj9tvaV4lyDSd5rguTIAyQ+tCco890ClR8kXVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwb3OhoJmFw6r7fsQ8Vm33ht2QalB1d5WqjA0kTHnNLPbyBfoOmpw09jeQ6RP4xs+LsNcFgPxdRFkevCBLedwxGdsanwbgqc2jDb/ZY+v0gW1Pzb/qZ9bUT8ApU9VpXsC7VzsisgE917YiCnB7tU6Efq4R5jeM5Ygza3B89sl7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMtuXWGU; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-415e568a7ecso3090103fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982913; x=1777587713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJoY4vcc8yBC6LVSkoR5wl1wWlEyFdnB0jaeRhoN6mg=;
        b=BMtuXWGUnAM6go7Z+sFOoOQ3sQRzLSKksU+QKAetO3sin0JN6y4O+/j5+8l0fxTwoL
         NtdnNe614ob+r32MOVKu7oDy4wT5OJUW6DSoSwRLOReIkrY1+PBNdWIeueQnMPi5qyeT
         pMi+0KuDLAWrx1CjmpJqQINjuyK3gKFtB6Kcs8BRuE5y9gyUWE8UkyFTIrGFpZXhUMiY
         qq+Mu4zhAbAuJbYf67OR3GcUwljzBVmiZfHNZvIdlnaYWA/FCSKPft4686cHOozuLi8V
         O5oU2vxetsBRagD1yiPDa4ASHRKH1Quc570qEstGpt0uaFIB2YPtVK1+NUFNj4c6Zjx2
         HJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982913; x=1777587713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJoY4vcc8yBC6LVSkoR5wl1wWlEyFdnB0jaeRhoN6mg=;
        b=FkHtdE3xW7KGHYl05RTtH7aD0hACX7XgQQ1W1WeWovk6Pz0bN4L19HhE9eHRCov3AN
         raTu+0pyOtxcX5YNgX79b5La+dsbmv42+WAUQ3nniDi0OAcVvLBnhD4MATPxePofKLuN
         epZMeVrbvQyz9FVpTqLSMHgqVHa1bWtPr5F1aLlAAhgnbb3K230Y7HV4+jmhtuQKBm7h
         zpW/eqxx8ty7xtJ6EHP/yVEyr+0A+m7omL3muWmslrfIgcTpa5JDbauR506NhUsybhCa
         CYSauUjiteIAI3yNmcqnxDr5RZwdc/Tp2U4xmjwXhmSiMQyvqdkdHui3ulWNl1Ebxh34
         64Lg==
X-Gm-Message-State: AOJu0YyuTm7I2fMDdoeuD8i551DOPkqg42/70ER0upX8tpZq+SoHe/fU
	EL8ryfkFpTHE2QZvdJOemrYJecgPnY8eHQuDbkpQSb5PS+M/h3Xqnz5PPo94GA==
X-Gm-Gg: AeBDieuoAKovzn6pTL3uRvnZxJOQlKlUKJ1XzPMWLipX6/bY7cFvbbHYIkG3TEV86XC
	loS1cqoaUzX7WWt3SVAqqnO12Nitj2rsCnGTUbGfy5W2H43dnsbjQpihQgmfpGYvulexxjiYNaS
	kAzRKFwVrsBLl0tFJztk0fhvy5V29YdcBWx98J+94/aNWWe3pz10zoCfFBE3OgKvuNfZIiRfq0R
	HotY+MGyRW4vvcQ0s9hg/fqlraOJSFxAiE2kudMaJRr4i3tUxjqpR4hmYtKmzLeA+PIv7Vfgx+G
	nCOoMXys/IuW5BcEIKBQwS+HGO4lR2DFC7cX6xFKbxrau7td864POx1fQVhK+23zqM4tOdAXZ5H
	lU8zexwT/pTaGS60vvwAxTVmdJr5CTzfd0RLFKqa5p6tup6gGk9hvUx437zdt6e4JHniJzAt3JC
	3qoFIL2oxh5+ncyvHU5lSDW4cm3sP0iaTv+it8YpnXKgr7K0Qlud6Ep/w5gdS+3veDMXiSH8nQ
X-Received: by 2002:a05:6870:ac14:b0:417:533b:79ac with SMTP id 586e51a60fabf-42abf2aa0acmr17359332fac.9.1776982913520;
        Thu, 23 Apr 2026 15:21:53 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:53 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 7/8] bindings: python: tests: migrate the system module to multi-phase init
Date: Thu, 23 Apr 2026 17:21:24 -0500
Message-ID: <20260423222125.29097-8-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35439-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 94AC545813D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Single-phase initialization has been classified as legacy within CPython
documentation [0] with multi-phase being its successor [1].

As such, switch to the new methodology.

[0]: https://docs.python.org/3/c-api/extension-modules.html#legacy-single-phase-initialization
[1]: https://docs.python.org/3/c-api/extension-modules.html#multi-phase-initialization

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/tests/system/ext.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests/system/ext.c
index c982fa6..800648e 100644
--- a/bindings/python/tests/system/ext.c
+++ b/bindings/python/tests/system/ext.c
@@ -67,13 +67,18 @@ static PyMethodDef module_methods[] = {
 	{ }
 };
 
+static struct PyModuleDef_Slot module_slots[] = {
+	{0, NULL},
+};
+
 static PyModuleDef module_def = {
 	PyModuleDef_HEAD_INIT,
 	.m_name = "system._ext",
 	.m_methods = module_methods,
+	.m_slots = module_slots,
 };
 
 PyMODINIT_FUNC PyInit__ext(void)
 {
-	return PyModule_Create(&module_def);
+	return PyModuleDef_Init(&module_def);
 }
-- 
2.43.0


