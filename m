Return-Path: <linux-gpio+bounces-34385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOT9AFcuymkA6AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:03:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5C356D53
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8C5530059BF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CEB3AC0F5;
	Mon, 30 Mar 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIVthQ1l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FF239E184
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857807; cv=none; b=UNxjtQ8N9aXwhsTSQIRmoOQXIgWOGXZ9eDlioDmlhaKIbqWwrgScZnEjJ/K4KhM8yvCeBRVBcjFtd+QEjvG8juXH3G7evRbwhQg/rc1yoWRTnziujBJLJllNka/NgVfMhRwrITiKCm9MMzo+NJwrA15enZ0u6ZP4V0wWwGwwQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857807; c=relaxed/simple;
	bh=IAOyoOy+EjFLK/X3zhzuRtb8iwoi7ayaBAr+goBfAB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eB6/H0Ht1bXnvJdUgx6U8kZscrxgmYHt1L0uoEy0ARFvu/Kj+LYm9eGfzZ+faHZV4TYE2mCxw3HKgb0sbyOJRy2ThNiY1dhaXkoZT1fZGgNTdcykg2TUGZkXCmBMrFblWDuvJtEiKHIXIt9czi1kVTFyVoieLQRSYm6Whcb9yJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIVthQ1l; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so862228a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774857805; x=1775462605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNbEamoVFrWEy3eDEJ2YhwcNGTuf+SgX6uLT44AchCY=;
        b=iIVthQ1lLCK4iI588FPVWzdsjyGn6EeQqwrpPZAaM60gp8zJFN91h51wiAfTQeq5DO
         cDC9CGgUFBPrceAQtwnJZWBxAg49eQrQ2a5BB3uLHHdbz2CGMrYfjD3mGlUJjwvjbnEL
         nwCHkzyjhe0idwVe82pR/O6cMkii+fVrUxcMlYAsa4tu3xkdelSiFXCF604sc/4r99Kc
         teF0LAIkMMEn3GJPyJkH090K6T+yo/XudNi4jGBXbV7RKimdC/2ARlOyfruhx5p9Dqf0
         BQUgN5f+a/f767XYq8gHossABFOPSLYqHjtPc3BV5BCTcw4Y4Ci9YKtTRAIKCiu8lzrW
         UhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857805; x=1775462605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNbEamoVFrWEy3eDEJ2YhwcNGTuf+SgX6uLT44AchCY=;
        b=sZxCY2s+/uxl32UYeWOLlQpcRLtI+wblY8xCvAjESbrt0jU3+qZ3fg2mX8MvxxaJvC
         wluovB6VLgZTPbWLyH9IrDNpdAyM2K8K8EQ6qlUs5G7nWj4t8RbT7Hu00JOWEl6RMXJn
         8YeXJUMEBCxJVGYk8bIwh0FKaM5jzGCz5HZxzvw+N0vZjUnCrmct9dg+LGhW5Xt+b6Di
         4Xnvvuh4I+LkzHxKqCBEhkRMnlt/39X98XxlCiRePr7lEkK0M6NZudwu3xCCjoGUnJg2
         GbVV3pN4NeIkB4xHV0p2GrKoOyyfD3eVgIi+aCtMvW8BjvinU1f4SPZS6Pi4Xw41NDNw
         juFg==
X-Forwarded-Encrypted: i=1; AJvYcCW6H9a6Yn8kcOikpQJC1yBbnKocO7QSv2stXa1VX7oXLAww3j9kk4AIrTXtiomafiTWMxO/s2/1VGwL@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdcYfRZdJG1/b8Ca61JcZa7hmC1aqFgEdT9xuN72gB7gJ8G1e
	YqEBkE9XuQ4uDSuQB+Jo0e08pddXsOW/Qyek7CBJjuYuGLM9kLdiL+Ib7qaDy+C/
X-Gm-Gg: ATEYQzyVl2NHV7IFU0GIb0zlsPYC2xOChmnwctMhZ9o5H+lqJhs0Gl9OVXvlQ78TY+3
	OipLxEhtBVtNm3GnT36hdoGIXCXpGPOIHQ2OmNh+2vjZdBNJ50NmtYcAiYcZi3JSBX1hTJWX2ak
	ttZ07Jlk/JwKFsJFgwOEnOsus7FpZiH6N5xgoLq6EDU9T0Y7R8OW/MmtFfrzCFRH9bgV8tFojyF
	ofyPufvcXtr0XS724P9/JldMPfuuhh4uyD8ZmwVoBAH2A2emjRoFzA/FW8xrTVRXBWNYQf2S2M7
	VrWku6m9RkSfI1tQNruW0+9sXMc7IdUH3FMnCy5N6vcDRAKrnSyv+0xwazgjVDO2TLKpYk5plI0
	tf61iNJIwVSnZasvaVcKlId5KSh9viV+U3CxG+GMpeQfcbvo8qr96OWItfgYl5KnNkktvV3th1E
	4suRZz0q/bcsOXbTTkvtU=
X-Received: by 2002:a17:90b:3c10:b0:359:8d0d:5905 with SMTP id 98e67ed59e1d1-35c2fff1fa6mr10657290a91.9.1774857805193;
        Mon, 30 Mar 2026 01:03:25 -0700 (PDT)
Received: from fedora ([122.173.26.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950b5583sm6204597a91.14.2026.03.30.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:03:24 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: linusw@kernel.org
Cc: brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rric@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH v2] dt-bindings: gpio: cavium,thunder-8890: Convert to DT schema
Date: Mon, 30 Mar 2026 13:31:08 +0530
Message-ID: <20260330080108.24294-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ishihao999@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34385-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.6:email]
X-Rspamd-Queue-Id: A3D5C356D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert Cavium ThunderX GPIO bindings to DT schema.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---

v2:
 - Rename schema file based on compatible string
 - Wrap commit message body as per kernel patch guidelines
 - Use appropriate maintainer name and email address in DT schema.
 - Change commit subject as per guidelines
 - Fix $id path
 - Rebased on linux-next

 Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
---
 .../gpio/cavium,thunder-8890-gpio.yaml        | 45 +++++++++++++++++++
 .../bindings/gpio/gpio-thunderx.txt           | 27 -----------
 2 files changed, 45 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt

diff --git a/Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml b/Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml
new file mode 100644
index 000000000000..0d42ddaeb23a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cavium,thunder-8890-gpio.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cavium,thunder-8890-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cavium ThunderX/OCTEON-TX GPIO Controller
+
+maintainers:
+  - Robert Richter <rric@kernel.org>
+
+properties:
+  compatible:
+    const: cavium,thunder-8890-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
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


