Return-Path: <linux-gpio+bounces-10520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C592A988A97
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 20:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75AF21F2331B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 18:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C511F1C242F;
	Fri, 27 Sep 2024 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="YGddxEZc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ECB1C2336
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463329; cv=none; b=owyNDqUlOehZxNdJ5w4SFqHn6eXfhfeC7VVdRFrG5NCf+sfhL0gFbRl0ydSpH8kmntGIV/TFkYoZmP5e8MkImtXB7tcK4fjwAp28Ve8rWwsf2jsCVF2lNK0jr9qCYACDJfGLlj1vJSmN1wszM6yNRlaSV2D83tTIEPxHTU29I5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463329; c=relaxed/simple;
	bh=PaOOE8aFkB8JqvtvITSVchxffEfHR4MtqGTD3cLAs+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JsCw4suJbzBuI97cYU6WwZoPSwnTn1ifOvSXxVRTIcmwgEH7ahPNjDZE2tpQX4H/5WqWfYTuDJxa+F1yrswxqLLpwiiVMsCmbClcH8nhk6F56Zou8hv40jeeTE5jIDkLpUakDDdjpZBhGOoZ3q1ndeCOPr/A5D9M5KTBlSSfGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=YGddxEZc; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 4A00021859;
	Fri, 27 Sep 2024 13:55:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1727463317; bh=PaOOE8aFkB8JqvtvITSVchxffEfHR4MtqGTD3cLAs+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGddxEZcrwPlGDNPmeCj8Gq8pmT/5hhH1XtfRBaUvro2QPQqluuJMYLSWcD8SFKEL
	 Eu482AtPRw9VYoP54Ow/MEax+mDh7VUDI6BGgb+f2zbpHRRAHMtvFPDnmsUiBXvejt
	 zlTTLauYjFFVXhhLHk+aCVm1zSJvpoZMkd1wnBNc=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH 17/22] bindings: python: tests: add type stubs for external modules
Date: Fri, 27 Sep 2024 13:53:53 -0500
Message-Id: <20240927-vfazio-mypy-v1-17-91a7c2e20884@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/gpiosim/_ext.pyi  | 21 +++++++++++++++++++++
 bindings/python/tests/procname/_ext.pyi |  1 +
 2 files changed, 22 insertions(+)

diff --git a/bindings/python/tests/gpiosim/_ext.pyi b/bindings/python/tests/gpiosim/_ext.pyi
new file mode 100644
index 0000000000000000000000000000000000000000..69d4b63cf54af25f9f029a68d36a9a63789ce132
--- /dev/null
+++ b/bindings/python/tests/gpiosim/_ext.pyi
@@ -0,0 +1,21 @@
+class Chip:
+    def __init__(self) -> None: ...
+    def set_label(self, label: str) -> None: ...
+    def set_num_lines(self, num_lines: int) -> None: ...
+    def set_line_name(self, offset: int, name: str) -> None: ...
+    def set_hog(self, offset: int, name: str, direction: int) -> None: ...
+    def enable(self) -> None: ...
+    def get_value(set, offset: int) -> int: ...
+    def set_pull(set, offset: int, pull: int) -> None: ...
+    @property
+    def dev_path(self) -> str: ...
+    @property
+    def name(self) -> str: ...
+
+PULL_DOWN: int
+PULL_UP: int
+VALUE_INACTIVE: int
+VALUE_ACTIVE: int
+DIRECTION_INPUT: int
+DIRECTION_OUTPUT_HIGH: int
+DIRECTION_OUTPUT_LOW: int
diff --git a/bindings/python/tests/procname/_ext.pyi b/bindings/python/tests/procname/_ext.pyi
new file mode 100644
index 0000000000000000000000000000000000000000..fdcd8ac15f2a0cb9b900ef272b2a10818c8eef4e
--- /dev/null
+++ b/bindings/python/tests/procname/_ext.pyi
@@ -0,0 +1 @@
+def set_process_name(name: str) -> None: ...

-- 
2.34.1

