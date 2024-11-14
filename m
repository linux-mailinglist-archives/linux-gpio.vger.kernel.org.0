Return-Path: <linux-gpio+bounces-13022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6CC9C8D46
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 15:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979CC1F243A6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 14:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4A613AD29;
	Thu, 14 Nov 2024 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="CtPMye0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1AD84E18
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731595895; cv=none; b=N9Sqjbj0vhlnxNXCl/SzoB427hN4mW7GTEzcLtYdsUuLET+7kYhzl43iKqk5A168me8z5wEPsLLCKcaCH6HZUxpok+1aY3mD1zpoxWjnBY5UGoRdm2X2gWEbMWz7mlwd6vgR74gmDa+yVRAMJLvPX9uK5I58x+DWRMUY4lGdZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731595895; c=relaxed/simple;
	bh=r3TPDi30k3o1UDzICcKWj0WXToZFNPhUaaGaQgjpzis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eDjWqgXOZ48/1QspvQoOoBLLJPBTKngJHh+/tyhIlEo8iBQOS82Mf0jBBkQVtOSyYfORuD+RGLcYC1axBmg7gpx07mWkikPLm0xP9EcAC6csxTP+a8Bq8kui7YslPPBRhDQ9idG9k3795Sp1qgcqSTOfIIHnwx5UOQQaTcQAuBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=CtPMye0Z; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id AFD8E20ABA;
	Thu, 14 Nov 2024 08:51:23 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731595883; bh=r3TPDi30k3o1UDzICcKWj0WXToZFNPhUaaGaQgjpzis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtPMye0Z7Pcnj1X8Asp/ot1LDJdKbgtK2iYMzjMqUDPMGjsMZkZjH+YxehyAAqpTW
	 K2yeQQsEQEFxpSWTX5Ln5VEuGyVBdKMvL6yKOciM5zwhyb90E5Ogtm+JLyntqoDUk3
	 Lgo++omf1aHhzK33QibZbhkFppujUMrF1C6JXphY=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH v2 18/23] bindings: python: tests: add type stubs for external modules
Date: Thu, 14 Nov 2024 08:51:11 -0600
Message-Id: <20241114145116.2123714-19-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114145116.2123714-1-vfazio@xes-inc.com>
References: <20241114145116.2123714-1-vfazio@xes-inc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add type stubs for the compiled external modules so that types and
methods used from the modules are accurately type checked.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/tests/gpiosim/_ext.pyi  | 21 +++++++++++++++++++++
 bindings/python/tests/procname/_ext.pyi |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 bindings/python/tests/gpiosim/_ext.pyi
 create mode 100644 bindings/python/tests/procname/_ext.pyi

diff --git a/bindings/python/tests/gpiosim/_ext.pyi b/bindings/python/tests/gpiosim/_ext.pyi
new file mode 100644
index 0000000..69d4b63
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
index 0000000..fdcd8ac
--- /dev/null
+++ b/bindings/python/tests/procname/_ext.pyi
@@ -0,0 +1 @@
+def set_process_name(name: str) -> None: ...
-- 
2.34.1


