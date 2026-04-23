Return-Path: <linux-gpio+bounces-35438-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OAHEYib6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35438-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:22:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B5458134
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2D31301E23B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7660B3537E1;
	Thu, 23 Apr 2026 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMRL3yAv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD536165E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982915; cv=none; b=EOf2RYzRtDAwWNNBFOUlXYNyvH4phuglsHraALpAmW8Qfhzl5OVFOOiCYD8WC9JTTjR4u28ahDZR3iqOOglWhiTvTGVpbJveAQs3xBHuTVDCh72QLnGSlXCR44V0lZwGAVErnj/WatwDDeEJgw86TvAeplRQJSFOfPKCnpLDzDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982915; c=relaxed/simple;
	bh=wqRyhsFL8/PIgzivNJzkf8YlO5l40oaLKAULRs6+7TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+1g+799knXWSDGsTTnxS/mL3SAMEAnP9prssWOFtmkXRr+Tdv1bTtZrFsgvM+j1usF2ND8MCYRiYi69wOkllRjuVb2Cvr5Dm8FHKkPgMu9q47Pp/gMBeT2pCY/qyeaNKr8Ixyvf7IhnF/TWL4c0tYszU3ZJ/BY9W/mXURnNoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMRL3yAv; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40efc77933fso4770818fac.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982913; x=1777587713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvrJ9Pts7vZlG4WnMIz51B8f/2gipKmeAo6LHOfYmKY=;
        b=sMRL3yAvK+BkA3ezuieVyYsB56KJWM9ybJXctPVuUevkB9HcDKZHDLR/nO00mEvhUs
         ZILqO5MEYWohEty8JNYrqKyN4ue/eYAEC29Aq5BghZHmMMHICIPRkn6B8OlEUG6Q0oGa
         vyLW3Wvybt0TO7P5rqAAtGztjVEO15+7ciIwsc1BDA8RIuz8Yj1frmt32QZaONmXTPBD
         GRjFxY1KdJp9jT/46n25ar+g1Vep9jznxH1nofpdr9jNOwzr7pf9XJNrMuWA21D3fnMi
         SK1T/OVlL/w0Nv3Mf0G4/Pa/GYNerU1qRAVwCVyVEyXZBOl/JtATaFYAqtdqNJXLEE5T
         UUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982913; x=1777587713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yvrJ9Pts7vZlG4WnMIz51B8f/2gipKmeAo6LHOfYmKY=;
        b=PFbksfrOv4uT44MIxprkpLri3J1fZWYOVjyuZRmK/V1h+DVSXWdidsg/hCPkk5FcCl
         p+iI69qDb83GxZ3Esm8UfhlhwrghuE36o4cEOHbVJGeMGXkKzYH1Ab9qJRprTnCcesiw
         E1QISNv6mmehZK/q4og6dUc4QMlQwL5GXQpFqtqzEGTrRj90RRefSrQeqSpZBXtw/6Vd
         ltFgSXUVXm78PecrS6s4pq6tMrPsaNVf7exup7b1Hls0Ea3966o6rxwstzJBJgZcBP4/
         Nk7gxDjhnc6+VwFuMy/yphnUDDGtOT+A88jaJgRTJdDPfN1rsmiDn6G10wNoax7YiOKr
         LZHw==
X-Gm-Message-State: AOJu0YyMEJWGmC8qjq+ayi0TYysNeTUZvapwDNCr0AoUh6gCQwF450u0
	t9SN1AlzYVrlM67UA29rCrM9CXBK+SIk4dkigu4VQW791wuIi6pNDdNbfFLw2w==
X-Gm-Gg: AeBDiet3CE1HE/Wp7raxG5EPvcfkaFG9uuAZm6C/bhxkbzT5d5pEO0/iVFdIge5rgV1
	NEXhSJXlNwxZwzW+MM8eBsqqKnq6umdVQNlNqGbZgpAtRj22EL028AuHb2ep14VW+WOtboCG6wS
	xw4NSAFkhd3nioFIh3smQbBZLnb6tM7SNLgsEVS44rS5kjqU82PtgWZs6J3RLuvk0JDXGOSf8ym
	kZK/Cta4wQPUl2MAnYf4aRxe6Dnim3kxI4wTg79NlY+I21waeVpfmMWYWAV7o/jr/ivtLjY8qhi
	H9mfyv6xfUzrEb4gr0hhgwAQFIAkMvwg6H3EaIU1AbwDei/qwOqJNmUEQOnRldOAIOFfAsAPDlx
	TPzHgyDaTHIspvAQRwfStm5I36eGK+T15C1nW5mwtFk+eZ1VnrXccHdUpwudEtKJfG0+xja63UB
	+6IP8vh0LjEETZcxzoEUUf+BG9DbqbhT5PipIcQcGW4l//O4MJvDM4Ckv1RAfciieCGOnztDnTJ
	p0O7cQlFp8=
X-Received: by 2002:a05:6870:b3f0:b0:42c:d98:9540 with SMTP id 586e51a60fabf-42c0d989f78mr10431260fac.0.1776982912658;
        Thu, 23 Apr 2026 15:21:52 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:52 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 6/8] bindings: python: migrate the gpiod._ext module to multi-phase init
Date: Thu, 23 Apr 2026 17:21:23 -0500
Message-ID: <20260423222125.29097-7-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35438-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: D75B5458134
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


