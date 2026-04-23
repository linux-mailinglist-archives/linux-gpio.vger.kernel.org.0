Return-Path: <linux-gpio+bounces-35440-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMDGA4yb6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35440-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:22:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B445814B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA7A9301F49F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5885537C916;
	Thu, 23 Apr 2026 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neA4dhi2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3A36165E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982917; cv=none; b=kvmp9NHcvoD8iJgrOvHKuiS0u0Fi4bLCB0XS0aKwoITyvp+uRplZnihWuLo/4VWtGVoUmvsVimSwW/OtcbOhD5lmHe9ruCfr9F3cggTRGVAj847Op4G3nztBdRLYknhg6A+O478bvnNvebVMW/r82+1MEpAHcJ9RDFjXK49tjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982917; c=relaxed/simple;
	bh=nDW3zQJrJEzfq2EQ1zRjT1Yq/XLcigrgez47P0cyZR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZ6PMik28zfxuP8LQgR2FCpZjLvTXy/UY5lgW9AKIVPqzA9MLeT0i6v/Nhtf5D+pKEIml6n66mvaqVuIh4/2fjM617Z+WGh4hxb5Vl7L+dK2EyeWbO3S8TSmWq3MNMak45tEzr48h5gwiHIrnGAgSYRKVMo2xkxQyUsFmp/nYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neA4dhi2; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d4be94eeacso7244902a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982914; x=1777587714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLcmhIcwdWxUpVcuACLh1E0xbICxTuenu22WdCqYPJw=;
        b=neA4dhi2kCtvRAT8J/bwZSgumwS4FP1y28pnuyTptJ20GYss0nGnSAKt67cP2m88d5
         DeVJ42z88foZwDDQzY51zWkOn15lr+FCGdToZwz5eiri3kiwcb75ZhWTUcyjQw6yB+Eb
         JHK6bOrJV1Zu0FOHlD0GfCBujAkYoJi7TX3YvdWwZo1HmM9o2FAvw87q9fwumucZgoAM
         +SeE8NdpZuY2fweu9uSsen5z6tLknOsumwJfcAWl5raTaM1ooyfWHuWieClD7JCL+eFK
         dqV1rOSAxKVhjF9Uy4ogxDLDceSVMtsqaTYfsNkE9Z0OojX9BlCrxdGBzXGusSIhC4Qj
         8m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982914; x=1777587714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLcmhIcwdWxUpVcuACLh1E0xbICxTuenu22WdCqYPJw=;
        b=GXKOeoGG68t0jkLJQRrkGKSjJLqDPv5xmIFq4S3VvwGtHGcqzMgEBFl/ZtFcTL9BQr
         6S1/b8QNShu/aNTfz3Irwa8uvb9OW4CPDKmsNZYE0QBSqoaSJ2pHycn9uMV+m8BDJ04e
         nNWRiGhXi/gCXQWpQ8QZWjLj1nACOR4TEdmQkiwEftdiEZasDnkEjTkGwZyN2TfhJ1BT
         NhXm1xcYYFNleB+HPmXPJsA7OswuBsKfRjdkUe0VxiOEMxnu03fVEIIsVT2ouRlsoGTx
         uvQ2SGdaDvwutkquIdOsacWzbsoS74CPZN3sp22U5nRqZXbz2Wmj8MuMFL1mZPsyDiN8
         6TPQ==
X-Gm-Message-State: AOJu0Yx+L6pQQhyvX9GwFl3jW19u2aXNYvAAcV+PRa4OZFtEWlm7W6jN
	H5nqjoma85OxOw82+vtR73cjy3b3PQr+hn6mQc1GuWrM/YanmRAnOYGoBpRoNQ==
X-Gm-Gg: AeBDietFBZKtXMUR3m5GXztPpqgzddVO09C+UbxRgGZCfSl39Dv9u2psuhDLCGvmmlf
	MNmx7hfBhXAH0AQim9rAoFXxWNEuitrlUVjiiDGoMXRnfgAkpU4dqlX0ym62svde3wNY1fzFMjh
	lK051Ux+yyui45xPSP+UNjFjaZa6hVtZd+Nivm0iPS+QdA4oy02LOB9q9cFApDWpYx2inJ9BRhw
	WsFSrqEsCaQUKUqKGXeDCNQDTQfKdPkyl8ykm8UQofAj5LqTO3HR6YnBOjvfs8pdbMYrAlhW38q
	fZ6ms0TWAfNPtcmC9Q7D4+y+EAS8HotnlD4vkZoXgHtLFSya1426/dlfI9/Anks3hkBHex3xpbd
	CFEbeh3T4QjBMFhXt0ai8RGZmuTPNplD0JPjEuHiCnHv1GsBO1A39TR+MDQMFgJZCIkuCAOl9UD
	d7zlwtGMi/T8si/bAAedGJRaaF/uh6GPSkd4HSJdTm0H9UUwGUeuMydKHWkqv3GDNDEB8LFh2K
X-Received: by 2002:a05:6820:982:b0:694:9070:8227 with SMTP id 006d021491bc7-6949070840dmr9705081eaf.41.1776982914378;
        Thu, 23 Apr 2026 15:21:54 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:53 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 8/8] bindings: python: tests: migrate the gpiosim module to multi-phase init
Date: Thu, 23 Apr 2026 17:21:25 -0500
Message-ID: <20260423222125.29097-9-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35440-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 8C2B445814B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Single-phase initialization has been classified as legacy within CPython
documentation [0] with multi-phase being its successor [1].

As such, switch to the new methodology.

Switching requires converting `gpiosim.Chip` to be a heap-type [2] in
order to access the module's state [3].

[0]: https://docs.python.org/3/c-api/extension-modules.html#legacy-single-phase-initialization
[1]: https://docs.python.org/3/c-api/extension-modules.html#multi-phase-initialization
[2]: https://docs.python.org/3/c-api/typeobj.html#heap-types
[3]: https://docs.python.org/3/howto/isolating-extensions.html#heap-types

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/tests/gpiosim/ext.c | 151 +++++++++++++++++-----------
 1 file changed, 94 insertions(+), 57 deletions(-)

diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index 1ebd5af..9954dd5 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -45,21 +45,6 @@ struct module_state {
 	struct gpiosim_ctx *sim_ctx;
 };
 
-static void free_module_state(void *mod)
-{
-	struct module_state *state = PyModule_GetState((PyObject *)mod);
-
-	if (state->sim_ctx)
-		gpiosim_ctx_unref(state->sim_ctx);
-}
-
-static PyModuleDef module_def = {
-	PyModuleDef_HEAD_INIT,
-	.m_name = "gpiosim._ext",
-	.m_size = sizeof(struct module_state),
-	.m_free = free_module_state,
-};
-
 typedef struct {
 	PyObject_HEAD
 	struct gpiosim_dev *dev;
@@ -71,13 +56,11 @@ static int chip_init(chip_object *self,
 		     PyObject *Py_UNUSED(ignored1))
 {
 	struct module_state *state;
-	PyObject *mod;
 
-	mod = PyState_FindModule(&module_def);
-	if (!mod)
-		return -1;
+	state = PyType_GetModuleState(Py_TYPE(self));
 
-	state = PyModule_GetState(mod);
+	if (!state)
+		return -1;
 
 	self->dev = gpiosim_dev_new(state->sim_ctx);
 	if (!self->dev) {
@@ -111,12 +94,14 @@ static void chip_finalize(chip_object *self)
 static void chip_dealloc(PyObject *self)
 {
 	int ret;
+	PyTypeObject *tp = Py_TYPE(self);
 
 	ret = PyObject_CallFinalizerFromDealloc(self);
 	if (ret < 0)
 		return;
 
 	PyObject_Free(self);
+	Py_DECREF(tp);
 }
 
 static PyObject *chip_dev_path(chip_object *self, void *Py_UNUSED(ignored))
@@ -289,58 +274,110 @@ static PyMethodDef chip_methods[] = {
 	{ }
 };
 
-static PyTypeObject chip_type = {
-	PyVarObject_HEAD_INIT(NULL, 0)
-	.tp_name = "gpiosim.Chip",
-	.tp_basicsize = sizeof(chip_object),
-	.tp_flags = Py_TPFLAGS_DEFAULT,
-	.tp_new = PyType_GenericNew,
-	.tp_init = (initproc)chip_init,
-	.tp_finalize = (destructor)chip_finalize,
-	.tp_dealloc = (destructor)chip_dealloc,
-	.tp_methods = chip_methods,
-	.tp_getset = chip_getset,
+static PyType_Slot chip_type_slots[] = {
+	{Py_tp_new, PyType_GenericNew},
+	{Py_tp_init, (initproc)chip_init},
+	{Py_tp_finalize, (destructor)chip_finalize},
+	{Py_tp_dealloc, (destructor)chip_dealloc},
+	{Py_tp_methods, chip_methods},
+	{Py_tp_getset, chip_getset},
+	{0, 0}
 };
 
-PyMODINIT_FUNC PyInit__ext(void)
+/*
+See xxlimited.c and _bz2module.c for inspiration.
+
+As part of transitioning to multi-phase module initialization, the
+gpiosim.Chip type needs to become heap allocated so that it can access
+module state.
+
+We disallow subclassing by not specifying Py_TPFLAGS_BASETYPE. This
+allows the module to use PyType_GetModuleState() since it may otherwise
+not return the proper module if a subclass is invoking the method.
+
+Note:
+We do not hold PyObject references so no reference cycles should exist. As such,
+we do not set Py_TPFLAGS_HAVE_GC nor define either tp_traverse or tp_clear.
+
+There is still some ongoing debate about this this use case however:
+  https://github.com/python/cpython/issues/116946
+
+Note:
+If we allow subclassing in the future, reconsider use of PyObject_Free vs using
+the function defined in the tp_free slot.
+
+See also:
+  https://github.com/python/cpython/pull/138329#issuecomment-3242079564
+  https://github.com/python/cpython/issues/116946#issuecomment-3242135537
+  https://github.com/python/cpython/pull/139073
+  https://github.com/python/cpython/commit/ec689187957cc80af56b9a63251bbc295bafd781
+*/
+static PyType_Spec chip_type_spec = {
+	.name = "gpiosim.Chip",
+	.basicsize = sizeof(chip_object),
+	.flags = (Py_TPFLAGS_DEFAULT | Py_TPFLAGS_IMMUTABLETYPE),
+	.slots = chip_type_slots,
+};
+
+static int module_exec(PyObject *module)
 {
 	const struct module_const *modconst;
 	struct module_state *state;
-	PyObject *module;
+	PyObject *chip_type_obj;
 	int ret;
 
-	module = PyModule_Create(&module_def);
-	if (!module)
-		return NULL;
-
-	ret = PyState_AddModule(module, &module_def);
-	if (ret) {
-		Py_DECREF(module);
-		return NULL;
-	}
-
 	state = PyModule_GetState(module);
 
 	state->sim_ctx = gpiosim_ctx_new();
 	if (!state->sim_ctx) {
-		Py_DECREF(module);
-		return PyErr_SetFromErrno(PyExc_OSError);
+		PyErr_SetFromErrno(PyExc_OSError);
+		return -1;
 	}
 
-	ret = PyModule_AddType(module, &chip_type);
-	if (ret) {
-		Py_DECREF(module);
-		return NULL;
-	}
+	chip_type_obj = PyType_FromModuleAndSpec(module, &chip_type_spec, NULL);
+
+	if (!chip_type_obj)
+		return -1;
+
+	ret = PyModule_AddType(module, (PyTypeObject*)chip_type_obj);
+	Py_DECREF(chip_type_obj);
+	if (ret < 0)
+		return -1;
 
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
+	}
+
+	return 0;
+}
+
+static void free_module_state(void *mod)
+{
+	struct module_state *state = PyModule_GetState((PyObject *)mod);
+
+	if (state->sim_ctx) {
+		gpiosim_ctx_unref(state->sim_ctx);
+		state->sim_ctx = NULL;
 	}
+}
+
+static struct PyModuleDef_Slot module_slots[] = {
+	{Py_mod_exec, module_exec},
+	{0, NULL},
+};
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "gpiosim._ext",
+	.m_size = sizeof(struct module_state),
+	.m_free = free_module_state,
+	.m_slots = module_slots,
+};
 
-	return module;
+PyMODINIT_FUNC PyInit__ext(void)
+{
+	return PyModuleDef_Init(&module_def);
 }
-- 
2.43.0


