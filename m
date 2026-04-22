Return-Path: <linux-gpio+bounces-35328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EqFFawi6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC4441145
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7DE2303C419
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A422D3A6A;
	Wed, 22 Apr 2026 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VplCcp/r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA417BED0
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820864; cv=none; b=Fco9qUXrPSjhA4c6Pa4yxTeAJ5TVKLU/7fkGGwAHXFLzA1TKgesckWFC4a8y2fgcvFs9rO1A3o4m/oljIoU751vHNwJqeiFsyO+FD4FBGqxHDc8/0RxVxsWRmzwyZfytfeLsqgCpRQXqpSBYjXEpkd+YEqzxH05AsqXFJ6FuEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820864; c=relaxed/simple;
	bh=wqRyhsFL8/PIgzivNJzkf8YlO5l40oaLKAULRs6+7TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=quW6jctxV7kmqtNPq5u5V72//8w3w/E4pS/LD5/EsYRl3bQBWfyv7BxyfbRttLUh86fYhxO29lmRlVTtzuZ2ftqfHWFp2L9NU6YpxnaTjRXtDlx5I4QnqqFdROQFvPZUqEFb534ssjKopnE9n/ihJurP+RqrWOeT7+lNGXNtiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VplCcp/r; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d9bba96f7dso2844208a34.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820862; x=1777425662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvrJ9Pts7vZlG4WnMIz51B8f/2gipKmeAo6LHOfYmKY=;
        b=VplCcp/rq3oP1q67T+MkWbqA6OW0NakE81OkdLNsYwQa3lSCXTbwAiRHhjjXuQWrZm
         3uPpiODnhF7Kx9ZPJcjSZ+IVrMIT6HqdVVjWk29JHDCYxDjn8/iacL2x8ZdoH7FN4tSo
         qTdd4CJhoBLCsOn5sQywuy1dizmY/gmWAD4JMSYZE2p15jFm+uNLJA57b8tXzbxlBcfa
         r9AZWk6mxKJL72k97hmcKAgFH9VvWlap9wrxuTW9w7+wVW31StsFcJAbcTQPvp6ribj4
         iDczEltstpkw3DdFNTJdcNfwP9SrnQyVWNyLfUxJzwI9sO4ah7HRuWGTG5TDBAKdJBZ/
         n6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820862; x=1777425662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvrJ9Pts7vZlG4WnMIz51B8f/2gipKmeAo6LHOfYmKY=;
        b=HZFvjMfLrcD/hz+QPkYfVeq+UUWyL+eyxCL20uGq9+hYnx/xsL0SgLKItJemgYKHE+
         GoD1Vn8gNsLOgGrdwce70Z5KLeXvQPtFf9Dofjl8nRRsNzRu4n5QPSUBddP6XrmSamEm
         7GVn2B6Cb+jcXPBuCfUvszybFZqfMjaFN22DnOMnOJXM3VNGK3H6dtvmeYNcicNHlQGJ
         jYkOIFDQ7VmTD9i4SD+3qLaDFykwA0xfbQjn+kpGHsbo12HB3FjlrtgcqYe+BQP/6iDY
         +WPwLI+myYVM0xqCU75kUp1AGRLHKe1ZzSSsdgYRXlQyg75jhac4LFmjYX6Snpk/rD0H
         vv+Q==
X-Gm-Message-State: AOJu0Yxo2KRAHqeEYxdO+E7CMegHRV/Ot18ewuj5uzxVTd8ztqMYS7oy
	IRTPVK6fl2SmqVJT8sr/vYxtV6q/ut+2D/sTNccyDtmsOMEo5qcsfHWIejsICQ==
X-Gm-Gg: AeBDiethn47BHHDkGp0eJCS9nUhmxw7M2NQ9ajwVXKcXtoitmgjIVMOsycQOCVviJvl
	5xMaBSxukYmPndRGpFZQG922BSuFSmDfIdfYBxW1O8XfBroia+kr+7LZBDy9V7/NOIJvUj79PTv
	Nrze1DMcx7VFBMGBIPxg2h//Ay7iLPGSs/pLykChwCgKUOLx2jfCupFfCp7oRXNzBgOF/G5CkMN
	y6iir+H8lfKbp2cDsT4e6kQA7w4wK+oFTGExODKvRAXwk26wqmfDdHQ24dRJUgrdj6qAhJ7EItN
	anbq9whnykLh/c4w/nB1ZXvslGq3ny45cNVwH7YWu/eakeQhJ59LCHNvpPxxo/jn61ki1Qobi21
	3zPeR0MGZcqgyd9ToS11J+hoXPAieuKBHg/hMMjGfe8jvTTT++ep3AQNS1Z6fceqvx6ngSvfTyL
	lGuGA8V4HcmrP59dPcC6VCR0cCRX5wm9HvNp6/o0m0Ne4Usbn3faTTamjxBWjjIDcjC4wudP4p
X-Received: by 2002:a05:6820:150e:b0:67e:295e:42a7 with SMTP id 006d021491bc7-69462e57d0fmr11601101eaf.16.1776820862071;
        Tue, 21 Apr 2026 18:21:02 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:21:01 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 7/9] bindings: python: migrate the gpiod._ext module to multi-phase init
Date: Tue, 21 Apr 2026 20:20:39 -0500
Message-ID: <20260422012041.39933-8-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35328-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,python.org:url]
X-Rspamd-Queue-Id: C5FC4441145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Single-phase initialization has been classified as legacy within CPython
documentation [0] with multi-phase being its successor [1].

As such, switch to the new methodology.

[0]: https://docs.python.org/3/c-api/extension-modules.html#legacy-single-phase-initialization
[1]: https://docs.python.org/3/c-api/extension-modules.html#multi-phase-initialization

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/ext/module.c | 68 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 25c252a..71fa3c2 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -135,12 +135,6 @@ static PyMethodDef module_methods[] = {
 	{ }
 };
 
-static PyModuleDef module_def = {
-	PyModuleDef_HEAD_INIT,
-	.m_name = "gpiod._ext",
-	.m_methods = module_methods,
-};
-
 extern PyTypeObject chip_type;
 extern PyTypeObject line_config_type;
 extern PyTypeObject line_settings_type;
@@ -154,53 +148,57 @@ static PyTypeObject *types[] = {
 	NULL,
 };
 
-PyMODINIT_FUNC PyInit__ext(void)
+static int module_exec(PyObject* module)
 {
 	const struct module_const *modconst;
-	PyObject *module, *all;
+	PyObject *all;
 	PyTypeObject **type;
 	int ret;
 
-	module = PyModule_Create(&module_def);
-	if (!module)
-		return NULL;
-
 	ret = PyModule_AddStringConstant(module, "api_version",
 					 gpiod_api_version());
-	if (ret) {
-		Py_DECREF(module);
-		return NULL;
-	}
+
+	if (ret < 0)
+		return -1;
 
 	all = PyList_New(0);
-	if (!all) {
-		Py_DECREF(module);
-		return NULL;
-	}
+	if (!all)
+		return -1;
 
 	ret = PyModule_AddObjectRef(module, "__all__", all);
 	Py_DECREF(all);
-	if (ret) {
-		Py_DECREF(module);
-		return NULL;
-	}
+	if (ret)
+		return -1;
 
 	for (type = types; *type; type++) {
 		ret = PyModule_AddType(module, *type);
-		if (ret) {
-			Py_DECREF(module);
-			return NULL;
-		}
+		if (ret < 0)
+			return -1;
 	}
 
 	for (modconst = module_constants; modconst->name; modconst++) {
-		ret = PyModule_AddIntConstant(module,
-					      modconst->name, modconst->val);
-		if (ret) {
-			Py_DECREF(module);
-			return NULL;
-		}
+		ret = PyModule_AddIntConstant(module, modconst->name,
+					      modconst->val);
+		if (ret < 0)
+			return -1;
 	}
 
-	return module;
+	return 0;
+}
+
+static struct PyModuleDef_Slot module_slots[] = {
+	{Py_mod_exec, module_exec},
+	{0, NULL},
+};
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "gpiod._ext",
+	.m_methods = module_methods,
+	.m_slots = module_slots,
+};
+
+PyMODINIT_FUNC PyInit__ext(void)
+{
+	return PyModuleDef_Init(&module_def);
 }
-- 
2.43.0


