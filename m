Return-Path: <linux-gpio+bounces-32795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDXRNJiDrmlwFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 09:23:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5123577B
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 09:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1220E3016C84
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 08:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8877636BCD7;
	Mon,  9 Mar 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9WOR2OA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73FD36D4EA
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773044618; cv=none; b=f9Syj6W69v/VJG8dPMNRXUSkMrnxP1/+xEA6R1uWLe+k7GacDRVRkMDj8ItEGEwVKo4pTBLHVRclErwHC95ba8vKtOqme4rpRdpB/dnLMrA5j9GXYLjk/7bXq6uEOus7+QgGmbjZtSDeitW0Vtj09B2+c0dnLjBbZI7TTlo5Tvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773044618; c=relaxed/simple;
	bh=97GzRB0jXduRhHegNCSRNpHmwNXg1M8yUOuodzFGCYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jK4mbUce3VTCyMv8iPfwkb4M2NB0CTBrdTt+dizYxRaXjLLfN3W+Mv/e29ZUP0Og1x8S4EjyZm8ijXxt7uz5i/kZmKVLPsMi4zAyQODBADZQ8hlu7OMvSMYACA6Jym0VIQobf091kDhGAVgnAXSegrNdenMBdZwbF6s5ZAbqg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9WOR2OA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82984c077b2so1799157b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773044615; x=1773649415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUXA77gyyGjfEb0uEClVpk8YIE6PesFqfd39D9DI5sw=;
        b=d9WOR2OAxFyIhsvCILgdqRe+/JC8SJkbFTDiCQNrRnWIikE1eHsdkmgQFVzJVKOoy+
         tkRhGCY38yHCdnSHbffFOq5v94+qA70X9+182fYnsHYbPU2W56e9YwJJVV9iNUcIKjiF
         zou4UUdNIXXBpQ1hJPcq2Y7aRirBFhpBMsiEK/sSBWi2rL34P++wpfsNtDbp0kqLeXff
         IN46s8doBc2te1eTA89FmG9B9YsOPMOLGodimyHfMqDsNVmdeydwcw4D487hOCczPz1+
         6aU7O51FrzZa2BbAVjM7IA/vo9/hbuFmSmzPO/Dhfb1hqKgTF6Rw1Z7dJmPCnOiqjLgM
         eNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773044615; x=1773649415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUXA77gyyGjfEb0uEClVpk8YIE6PesFqfd39D9DI5sw=;
        b=oMn7/BPJh9lliVbLwCGLOPhwP5lBPa9zTQ7x7CydTtTCiWiWkll9yPJ+6QUsOjKKDF
         S8X4lCJe3ruPbyxkBYoVLhVss+1GCox0C7MgzcIP/OHpResNIF/zs6QVHmq12hVsehVw
         eyZ++TrThEAxtSIDx7AtHhIVxcdGlu4u21owJQvzcrMz1BnUaKp/E8In8i4dR+WGO9TL
         l2idZdHOFW2k656WuP2/NjbjDrCX2OqOEHWtdhhiSyKuIyqMFx5ZDJOf4h+gHzu+G70t
         EUH+w7fszcwRN5FItLuuBFaLnDj9nymedDxjIwCAP18j7pChCD7//uDsrMKT82olORNQ
         9zIA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Sdm9v40U4l1iDWC8AP6KX/KkaOr09pIhPDiCCXNKT8bc/Az6w/NiFOIPjl98yxGMlHVHx/vamE5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWQHaBDObacAY7c3Mj2Xjf5jM2wcb+Fydkqx6VrpvVwWaXvzD
	BhXn0dP4UZP45LRyDnO9RiyJk/nhbJSAlFy+3iTLaqZOYfDWrXoujg+Y
X-Gm-Gg: ATEYQzxY1mtI0qDOpaT2jATEgsfVe/jbA8LkKyQySP17EoSyCjth3+cUX4Ria8VBDeu
	c934mvfN4atdAjCO0sipzww5zo78BGpLKR/CnrDEOEaYMR1QEEKI3IsCDLlp6a68kIpNdm0cvd+
	hRDA63AKXu+u9qHf5w0wCix7l2Y1aiqd0TzF13r1Y/3D6cKj0Y8UfIT21V6EK3Yfkk5dM1jvh4d
	ZkKGLfm2oikQnHXaASS8J1yh5JupsjG4HIEstrh8M2oNG2AtwImDCcvWWIYeXTpeRK/shQ/WEcm
	KyV+ZNB9oXWncOZ6bAGHyTAz+cFcuxtlwR13LAR254Boc21pszTk7UFp1li/LflAb7Ucm3d4aHL
	hIfJun/B1FGZPO9Ietm5mOdLiWANmkTvhwt9e3EPntX4+pvg76PnweKOoh+TaPzSEjLiMDcJ2n+
	oyGdG2OxPiwXlTf7D5F6vMUSOm
X-Received: by 2002:a05:6a00:66c4:b0:829:a3ed:9749 with SMTP id d2e1a72fcca58-829a3ed9af8mr7947643b3a.57.1773044614992;
        Mon, 09 Mar 2026 01:23:34 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:2ea1:a1a7:f2aa:545b:3c1e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4657445sm9804383b3a.17.2026.03.09.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:23:34 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: linusw@kernel.org
Cc: brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH] dt-bindings: gpio: convert Cavium ThunderX GPIO binding to YAML
Date: Mon,  9 Mar 2026 13:52:52 +0530
Message-ID: <20260309082252.34384-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 73D5123577B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[ishihao999@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-32795-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.6:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Action: no action

Convert Cavium ThunderX GPIO text based device tree
node to YAML schema format, ensuring validation and
consistency across Device Tree.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 .../gpio/cavium-thunder-8890-gpio.yaml        | 52 +++++++++++++++++++
 .../bindings/gpio/gpio-thunderx.txt           | 27 ----------
 2 files changed, 52 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml b/Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml
new file mode 100644
index 000000000000..16d7c347f913
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cavium-thunder-8890-gpio.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cavium-thunder-8890-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium ThunderX GPIO controller
+
+description: |
+  Device Tree binding for the GPIO controller found in
+  Cavium ThunderX and OCTEON-TX SoCs.
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - cavium,thunder-8890-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_6_0: gpio@6,0 {
+      compatible = "cavium,thunder-8890-gpio";
+      reg = <0x3000 0x100>; /*  DEVFN = 0x30 (6:0) */
+      gpio-controller;
+      #gpio-cells = <2>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt b/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
deleted file mode 100644
index 3f883ae29d11..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Cavium ThunderX/OCTEON-TX GPIO controller bindings
-
-Required Properties:
-- reg: The controller bus address.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Must be 2.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is a standard generic flag bitfield as described in gpio.txt.
-
-Optional Properties:
-- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Must be present and have value of 2 if
-                    "interrupt-controller" is present.
-  - First cell is the GPIO pin number relative to the controller.
-  - Second cell is triggering flags as defined in interrupts.txt.
-
-Example:
-
-gpio_6_0: gpio@6,0 {
-	compatible = "cavium,thunder-8890-gpio";
-	reg = <0x3000 0 0 0 0>; /*  DEVFN = 0x30 (6:0) */
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
--
2.53.0

