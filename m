Return-Path: <linux-gpio+bounces-35330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPlZJ7Ai6GmjFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6E441153
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0F2B303D2E5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0D02D5937;
	Wed, 22 Apr 2026 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6fnmi97"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A317BED0
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 01:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820866; cv=none; b=f/DRbYC2bRBa+wGzCSAWAQymqGMxbtZD+rvrIbzyHOuYLXcERxzliyxo+r4q/TD4Kav5uUMPSm7l+DOSKlUWnFwRzahDcW4DhmxJuhVuwupcoSXIXj+WKViO7ap+WRCH/9UY2bO+CtVoWXmL+xh5QGG6tEtLRSK2vbF4bqOh5ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820866; c=relaxed/simple;
	bh=nDW3zQJrJEzfq2EQ1zRjT1Yq/XLcigrgez47P0cyZR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZbQe0cz5pMuSU3Gu/8D4tGWkVhwOBUkLSYWfSMz8sfIryIDiFltKx17z4NzpvmkZOe3I+vVSx6aisN6EHiBpuMLjUQ+aAG1sn4asLa1O76ENme4JfwC9RWW/YPYI2tInWJTagglve3qHfEkTEWs/V7XGuuGOc5C30ZxBqzGceaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6fnmi97; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40f0e14b9f9so2860151fac.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 18:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820864; x=1777425664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLcmhIcwdWxUpVcuACLh1E0xbICxTuenu22WdCqYPJw=;
        b=O6fnmi97Gx04eOUibtgJ/Yj8/oYn/9lpcuTOxcQxzxfpaEDEQMo2QPH0pZ9DSpgW6z
         0FCDfDs0DG4TQq0fiye9UdLWg/y3tRwoy20MiS9cbd+0QBxh7OjKbUKStb0ixOYhSlqP
         rROwmnNx16AbtDv1BhGstrwj3vWTchMBBCRRhJ6aVY6h0pLG7E4nz0DuYMHwF20/oCoY
         39VcB0+uWp1PrNeZONv5y6OHLoalhpw62cUiu29/whis6RW4aCKpjxZ2aqDYKOeeV5ns
         y8SK3nBxMl+qVWrJFQmB1pS1qI3PwoqEiJOX+F2OL7RVsVZv9uUESrfNlfTCf+8NUzGQ
         9XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820864; x=1777425664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLcmhIcwdWxUpVcuACLh1E0xbICxTuenu22WdCqYPJw=;
        b=H3viibiQV0keIGeWg8fjaaWFnpNrDJcq5n8EAs5wLyohGK62fhCEVz2bx3LKHreXhO
         VYxNQqTPt8qvbe2f8qRaAmd9w8ZfkuREjBtvpzW9ZlPy0cS44A/YVZCnfJ2l4qSnQtfz
         sRJfSxhzgj2HmRzRaft38m8AOvsxz490sagHLi1gDlCoynYjDPuTzi+VenKlrvQgoogI
         F6nCZdzcS8cSplMmmwD8Zl7kFgLbZJnuqhZ9xB9Mad0MUMeUqdkG3xmosGQVgja0fwXA
         QyaP3fLs075FJo1NmU+yoy9GbIizJpr+k4a8YasbbHDqV+uqshCkSvVPLXbHMSyXyp4z
         bdfQ==
X-Gm-Message-State: AOJu0YxZ0pQydSJX4K/eSBTrr8aRddvjgJHMuBSuVuXQLV8BoimNqwah
	457PanfRrsKgPfvLJ47aeWuFyk5cYdhAPvtu2Tz/2CpzqR7Y27CbJrkB0N89dQ==
X-Gm-Gg: AeBDiestkIRV0fvAvGsdx+L75NVm3x48myaF+4lKlYBaKOlVQZjngoiJz0fLglmZSDI
	DLwEVcZmAUg83kqPQTMUSBjZR41avsOtIOnPkWrtL8vjsw/czESNAa5e79v4rGlwxComttnnCAr
	qIJflCGxCIr4HfxFEfLBPGQJ649RlFfyWUZOuBlylveHfsIFMvmQwi/Na2brOBXWJyMx1mjff9p
	i3MMOP3fk7Nn4MNz4RNnxdRya2aWSyXugN69KoGVsHpYV2mfhAAwKo6YJU2Pt73mUK6L2GVOQcf
	LkWBpa5526bWryVPctkaboVEa4EWO6zwZEiSSXQOnTPPkfSAq2ne9yUaXm8Ozrx0OhHq3dQOujW
	4sq7OXCq5PQwhJH5NIsfIsHUKv/YiQ1CgRsrLNLrce1sc9unkr7FzHX1COsVVXFheLEcs8sN1rI
	I88WnN24gsBEDdnMqtm+AeFecLjNJ6cu8RSKkvaooq6+sNl+LeIwiwCS8MuREOX3SVeUAiDv4b
X-Received: by 2002:a4a:ee87:0:b0:67e:367c:998b with SMTP id 006d021491bc7-69462f2f144mr11010324eaf.59.1776820863717;
        Tue, 21 Apr 2026 18:21:03 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464eeee56sm9876036eaf.8.2026.04.21.18.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:21:03 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 9/9] bindings: python: tests: migrate the gpiosim module to multi-phase init
Date: Tue, 21 Apr 2026 20:20:41 -0500
Message-ID: <20260422012041.39933-10-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35330-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[python.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FC6E441153
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


