Return-Path: <linux-gpio+bounces-35329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLqNH60i6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C744114C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2D52303CA71
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61DB2D5436;
	Wed, 22 Apr 2026 01:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aE3MPSfm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C0200C2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820865; cv=none; b=RkyqMDFi+3TF3ykpmF/CXhjDBCyp7HpcTodFwxpaP04vhOOJe+1+J/bqq+rbHcALM5emntEqLSVFHwAUSW7hxeKegWlyE04E0TlZTSLJvRm8lXe6fazklB96xS0iwGPkwbLKeOut157l9aCP+xpXMaOvdNmj4HGRT1QctNYeAHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820865; c=relaxed/simple;
	bh=FabEycj9tvaV4lyDSd5rguTIAyQ+tCco890ClR8kXVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwvjW4bYzTiXb/CItSuSnxpIbjry8mRr1uoH/PwdEEKcBATj5+9em82Ju4qsG1WWT85t2DzqI7j2ctnB6hVzAjm9stQHXs4UwCBjMgYAe3hjeEXpa2bsOlcLygIWVQ0KrulSCtC6W0+GPYg1UBoR8TsZarYTSi9TzSMqjSKFj1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aE3MPSfm; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dbd801138eso2765271a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820863; x=1777425663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJoY4vcc8yBC6LVSkoR5wl1wWlEyFdnB0jaeRhoN6mg=;
        b=aE3MPSfmm7UeBKx5hyiPTYwPmcZXQKvkQCtcLr8aW3nAATqhwZW93Xa1P4DF/EbAGh
         BmcpYe463Yid7SDAsW9ccpb6l2jH8SZWiByn+XoDM8YahIqzfrXxTPbxziLh9cT4VRcZ
         eMQiwTZfrD8N78DJa+2JNhkh/3D7SOJJKlcBkoaapLYsSNNsN5Fze2OF8usQYDRFhAU7
         SHQyERdVkzYl7qcE/+0vdQlFdSnvIG4UJuGL4zB5ItqmmXeOfJJD1pwHd3YHDOgR4viQ
         PUeKVaYhraU3Yzhcm9Igv+twuieVFfnvWWvvBjNv/SNJa2uvTmqh96Q7aEHdjzBPrFs7
         22QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820863; x=1777425663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJoY4vcc8yBC6LVSkoR5wl1wWlEyFdnB0jaeRhoN6mg=;
        b=BbjxL/G+LJTF7UPIf//aBDaLozw08TO+yndV0QMex/XJw3HOWb95cHzEOjM5hUS/Xe
         LlnYbWC9w+GkiC0JMTKv8hwAL4TZLYR65tHlLHXQpfLScXxY6zZqazfs+uzYjgEMxYFC
         sx+bVsVdIDV67UATEUmE3QJfMpHzfdlwwWLh6/5o2dMGNvI0uzd0DIzxzUJdQM0Jh9z9
         j/P2TY+l3X0aHaj0Mkn3LDnLFb6tQawy+WZyOBpvtwaIkgyXe5phOkCWo0zWyFYpWGcw
         lYcYvGZd7+/wOVSyq/VCzzwqjJ7Z/xlHov3/9h4+DlsvW4MwN+kx9g25qfFOKGUvAf3e
         2e+w==
X-Gm-Message-State: AOJu0YytPF4CApzwZu1bGn/v9DxnsEra9u4Sc7PDgflLc/oaTM83xHkr
	1KuRbv5W13sd5zwPyHs++vMYpAlzabx6p0o4/W0i1mJIKFGgJGUEqD6DMc/Mqw==
X-Gm-Gg: AeBDies7pOPNAf72JstazE98ehvjhJbF7Usw9T+/le7t0aNVsVTM712DYlpCzVc6meY
	6VNMd9YF2wH8Q0lOeneXMQLdzL0yoLAiMHUKJ/pUdIRu4wawVtA5Dxljeaj+ubhH15S/ZRyhcSG
	JU6ssF/r65DUeKtgrWqMWJqyJ7acc6sknuSRw9Q38Jo2bqhKrUyNm3Q362ugqfTCBywmQ+PTt7n
	bwIxyuNH4LSrNSvpjo9HEXDYMZ6ihyHwyGSPVYv1MUPbEFtJljME9hOUIa8NbqtMessOoWW0GKd
	G9fD/Si6LKN4c1SznlhyRU69ICNQDXpfPfjmzTT9bUNnz62MVdM2EYuToRMGCwpAvEXPPQuN+Rb
	4vgZqE49aOVkCBJ5T5pOD1E2m/BvN93b1jz9Ht6suc7RGlB0AK11aJsq7r1nvrzqU5F7HilfJX3
	bTxGRubXCYz4oLZj4lt8Lq4C5Lb0PORfLKjq8pDJWSv779pDE2eaeL6W3lGto5k7188wCwgOQ3
X-Received: by 2002:a05:6820:f011:b0:694:928b:c922 with SMTP id 006d021491bc7-694928bcf00mr3692011eaf.17.1776820862883;
        Tue, 21 Apr 2026 18:21:02 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:21:02 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 8/9] bindings: python: tests: migrate the system module to multi-phase init
Date: Tue, 21 Apr 2026 20:20:40 -0500
Message-ID: <20260422012041.39933-9-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35329-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[python.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C6C744114C
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


