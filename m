Return-Path: <linux-gpio+bounces-35437-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOMvA4ab6mnF1QIAu9opvQ
	(envelope-from <linux-gpio+bounces-35437-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87845812D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 00:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93138301CCFC
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 22:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B8437C916;
	Thu, 23 Apr 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6Quf3Q6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B912EC081
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776982914; cv=none; b=pO1QAt7o90+oGADsGzwIE+gHoYRQkU8P4go/hAeM3DMWFUbYQgvB/fquwTsCS5ebDBcQNUFUT4+tgjuwaMvJWUrSIM7Vkyb+5MiPKnnM/OGgKnysLJyu27zT+igSI10tgtzJ9gUbz6v66rp8dXdV1yn4ZE2afXdWeuXyyBSqQF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776982914; c=relaxed/simple;
	bh=tpuxXJ4fKIV8MkMtvscHa5DQXdXPFwcCok4985Xen8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAFxW/SmhBEvSU3gQyZXdcAxTb3iZj+dadktQFkUfuUtOujOpmAXSRY0NP5hKq3K+gUAiV6sRZjdV3vD8IPQII8VTTmae8npgTg9WQJz4bvyFdSBtx358CaJ/F8PRFA70djCHWjyDwjsf6vAoWc58URKmYtg90iiH9u5cokZ8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6Quf3Q6; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-42fbf95cca8so2004610fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 15:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776982912; x=1777587712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2nMEq+vh8lDv5J7/vwrmy0PP3tp5v9ohfw+PwdcpIQ=;
        b=f6Quf3Q6Tubc6wwnBKMHnlP+x+LvPaJYIBJvzX+xNWHQHP3PT4PHxQ3gMiPuHHykaT
         z6c80rSNy03OIsrpH4MNqMKBOzPgwJb3+eN485zsmQsug7vnKuVt5b6zx2ZbLnfv2zzR
         XNDQuOYgqMImNfbSviKNsgsbmXFaG6Oncl3/HCLbPPjkP/nLSC5Z5/pOBmXzmjbTyVQP
         L/KB5vJ15sQTsckXIYG2j98hYTTMvpIzjCwl+dIlPdRlTDrIHjeov2wOJCnQLVu2WfaM
         5/3bz1QMl32UH5qsC9I7EWBLUQcbRsrgihJwTaQSrGzqgEnbJxtEI+s+3FQNswMLO/vp
         ejwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776982912; x=1777587712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2nMEq+vh8lDv5J7/vwrmy0PP3tp5v9ohfw+PwdcpIQ=;
        b=FG4SZ3P/pGzLFln2aF30IJJQlLdK3QndoJJyFlP5kUZ6PZlCqV1OJDxwx4SileI1bQ
         wt2lYue7M9/OB3P/PZObUJ2GpELhEgfXASGsiBPTjM/pCRnJfgNZRhjE7JQjslJ0zPJE
         oZE+RHob5CUG6ZwWUuGyiRLkLV9dpyCEn9OM7iZ3eTbB8s5R5yRwKqUNdZ3AnuXkdgjg
         h9iGHjsxoGr+oVBoz88L50bVkWoLn/36JSxakmTUelTxti8fjQ+sxfSBSG3cgcyy/136
         eVfVQGuYKWd4cNZpO+pJ+QuJqToYw+/4SoFwLtutVasnmaFEt+JlZeQQXs/uy4mQrhpj
         uXtw==
X-Gm-Message-State: AOJu0Yxn5h2J76HGTQ5p9LiVGuGEFAKGLJzDGoS520ASQ9NuP8PClTkR
	iRSrtMBCdeTsa7FzFTnUeroUUUPM4NafrecZKbS4JqxOZhClUN+inHjTT8Q5bQ==
X-Gm-Gg: AeBDiesZN/+0/dFTshQkVGmO+sh7X7BBX9ZLcDx/I2H1hN44DPzRU2YDh0T7xvMgjX2
	YZYhf6v8FvNQqOVHHfbJcVdl68rHPwP0YF1qFOY27il/xT7AgW6pbKlcu4nIc/GwSnnO1qkn3YT
	D8ER/tW8LxXQJU/aq6DW3XxVpplh3N/ZkdclC+bg56B1de2CYr9kGeS9URi7EnAy5YREs3s8oMx
	YQhBj7oWkUj3a2q67hjuPyF9qwhWJEFRRGwUdHKLdSmUoWwfHaXhjtbzekDN9TkNbD/v/X2NnxO
	370FStLhy9fGIjzdS/tuX1Dz14NI2MWVtxJwBvnVmztfclcJNsrzAoEKhZ7SmgrAC9w384NIpfR
	XU9Hx5nwEDu1hXUHptC1UnxEtHM3hUJ9+nGIlmaeJGuvw/sBK7ngsIIT3rPFl3YZxpseaGVt7G7
	Y6WoEzhGs7/J8/IPdGWsemGK0Yb2fYBzGt16iDbAXujzQKZwtturr5UfV8itRzGh2JoAj1vC/TX
	CUuAQ1vX6s=
X-Received: by 2002:a05:6870:c1d1:b0:3d9:2fe2:f5c8 with SMTP id 586e51a60fabf-42aded75b22mr18515464fac.32.1776982911841;
        Thu, 23 Apr 2026 15:21:51 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm17784598fac.5.2026.04.23.15.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:21:51 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 5/8] bindings: python: use PyImport_ImportModuleAttrString when available
Date: Thu, 23 Apr 2026 17:21:22 -0500
Message-ID: <20260423222125.29097-6-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35437-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 9F87845812D
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


