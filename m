Return-Path: <linux-gpio+bounces-39592-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1R4SEL0QTWoIugEAu9opvQ
	(envelope-from <linux-gpio+bounces-39592-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 16:44:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E671CC83
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 16:44:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="bkaD9/qC";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39592-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39592-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9529B301B595
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 14:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404AF42F6E3;
	Tue,  7 Jul 2026 14:42:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B642CB12
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 14:42:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435366; cv=none; b=jHNzb5OsJCr8JH+gN4d6mP41kFHXnNGkfh8wHzMLXa0javfeBEpzU1KMYqdUO8gXBEDT71qjF1aTQH/S4aIVLWAX7hmRSBjHWgyG5UZPL4T9ZRkgqbSuVBw3g7gGtRORM0vVodh4cuAM0XIl0fpuGPnKQ8w7zvrq8cv8c7aKBsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435366; c=relaxed/simple;
	bh=KAnqFS+pXd5ZmI8H/+IzEqlkA+a45bynbVVJ8pNh+kY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hPGIeW502VkNDRp8qzTlk50CcvzZZpH0eta5Rscgq8I1mPza6pVgbb25eemXEVSCDiBpsS+ZkN7zElW61wQIXhqUcJzBzamahr43PxLlt9UcCrZTEGS4kfFe1IogwIPvLOr5Q9z3nTFWpe3mnaVJc2wCYuYfx9/ICORHdY5KpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkaD9/qC; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so3480405a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435365; x=1784040165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15Jfi3usaM1xvnYfzLTdvw/7lRtvBMgyiSIFjJe9RNk=;
        b=bkaD9/qCY+Q1Tts0AnZM1QzP26q+D9l9HuCio2UEzEtgB0iR6/QgTXrFfpKL8OJGDh
         wX2eU0MK/LYCLnMKHwYRUAPGzroKaVjWsVFByfu+2syhUA8VUb3NwrJAoqsE2LFUajTN
         Y+IETyEySxcWGHVBYwdCCk+K6DoymonVrdjKZn5i5rZ2mKrNpgjDJPAb9JxR7T3m6KV2
         jxLYxr2QqX0hN1+/d2L4msi3QeNssRdrGOqdY+O+P/DEz6nE4XiUjW0DC8R9a60ZWpR1
         3pyEzwateWNBzXZujR3TaR+9x3LuHJ0S6k6OtMWm1pl7rTRm6cJ51cisw/CXqyCAyh/b
         8xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435365; x=1784040165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15Jfi3usaM1xvnYfzLTdvw/7lRtvBMgyiSIFjJe9RNk=;
        b=ZjRJCzkDs6yXjBwhIpBSZH5jGL7QgJiM6G4xqw2/2PevsfSc7fMB8Wl5V1UFN3Bljv
         yrcPED1IIe6sgOSpsDX10azOu6ksvaBzXKQAea9EksDxF+xbWHc+n2ugQ3THEiwN7uuw
         xeTg6ok3oEAQGJa7O1Re27yM4B+Q/0lfh36WEW/T2LCihle9QM2cG4iAYTkOJ2LUA+db
         it/kdUp+fxKV6jUvhgv4KAd7IgMOn44UyEVLi8f/pGtj7icTrfdAiDE9U6PWgJPLo+a4
         xfiN2Chu2P+lZVoGBQT+2fbsA0Htr+E7+u9EuRWqftZo1UoK4w9bFLDUflz1h+cmld5H
         fdsg==
X-Forwarded-Encrypted: i=1; AHgh+Roi4jBQgHCt50TlUAygIOObS24ZXvQ1nmDsfqSRP9GMQLdmo2886MNp7rN1EmUNellRa6PK7vGIWRxY@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAY45Y6jZ12bbzix/PUwiKdWYDJbkhHcMydAvd+gU9p0YECDE
	TgspBE9z1Gvi7ZlaSgMK9gzzBuq8gtkaiR2DcDOl3SQzrgAP4fEh7t/v
X-Gm-Gg: AfdE7cnG20a5NhPWReDmCC2vQcRvOg/kPND5VvuQUiRclMcpDhoiKSdqbNhN5mgNtkz
	/h9JQvzvazTg81k0iOfKoTaVOowuRUMt5TSlbTrVKqQrpoJLcv8Q/xQUk1cfc/4K/3qLWBcRq25
	Jaksffpb+QCj2cmw7abkZfzV5xS67FvFfAmVSn9OAr/viYxQeUMXEvXcyso7zkpcwSMKmzeAbqZ
	L/AG0ciyk1RroBkKr/5z/1rVwaQXQuScLDYcHtTSFfF/CQ0upw9OfL7mI2vr0Vz3HOwBcvouTDt
	y3+5nrN2T7k3fhycpDS99zAFxaI5dKi9FQnJJHUNxTsN7yASxajKcIR1xybvi7BGaHQLntkacI+
	Q+afXaU8++INzxMbTxEfzgAZ4LyZJ4/i40FV/xnJKlnc9qpjRJJX7RB/IhDwdIhV/Nv/7uzZvku
	0lG6PXOLrn1jHWPOxqnxpoait9yaVnPQ==
X-Received: by 2002:a17:90b:2652:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38755573a58mr5320106a91.7.1783435364699;
        Tue, 07 Jul 2026 07:42:44 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.165.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fcd99sm1264152a91.2.2026.07.07.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:42:44 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Tue,  7 Jul 2026 20:12:23 +0530
Message-Id: <20260707144223.120417-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39592-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C75E671CC83

Convert Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:

Changes since v1:
- Add interrupts and clocks to uart2 example to satisfy uart schema validation
- Corect regex patterns to accept standard DT node naming conventions
- Add function property to top-level pin configuration nodes
- Remove restrictive enum from function property to support all mux functions

Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challauday369@gmail.com/
---
 .../pinctrl/microchip,pic32-pinctrl.txt       |  60 --------
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 145 ++++++++++++++++++
 2 files changed, 145 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
deleted file mode 100644
index 51efd2085113..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-* Microchip PIC32 Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-PIC32 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "microchip,pic32mada-pinctrl"
- - reg: Address range of the pinctrl registers.
- - clocks: Clock specifier (see clock bindings for details)
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
- - bias-pull-down: Enable weak pull-down.
- - input-enable: Set the pin as an input.
- - output-low: Set the pin as an output level low.
- - output-high: Set the pin as an output level high.
- - microchip,digital: Enable digital I/O.
- - microchip,analog: Enable analog I/O.
-
-Example:
-
-pic32_pinctrl: pinctrl@1f801400{
-	#address-cells = <1>;
-	#size-cells = <1>;
-	compatible = "microchip,pic32mzda-pinctrl";
-	reg = <0x1f801400 0x400>;
-	clocks = <&rootclk PB1CLK>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2-tx {
-			pins = "G9";
-			function = "U2TX";
-			microchip,digital;
-			output-low;
-		};
-		uart2-rx {
-			pins = "B0";
-			function = "U2RX";
-			microchip,digital;
-			input-enable;
-		};
-	};
-};
-
-uart2: serial@1f822200 {
-	compatible = "microchip,pic32mzda-uart";
-	reg = <0x1f822200 0x50>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
new file mode 100644
index 000000000000..8fdbb3ab88f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,pic32mzda-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32 Pin Controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  PIC32 pin configuration node is a node of a group of pins which can be used
+  for a specific device or function. This node represents configurations of
+  pins, optional function, and optional mux related configuration.
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^[a-z0-9]+[_-][a-z0-9_-]*$':
+    type: object
+    description: |
+      Pin configuration node with pin muxing and configuration properties.
+      Can be either a direct pin configuration node or a container node
+      with child pin configuration nodes.
+
+    properties:
+      pins:
+        description: |
+          List of pins to which the configuration applies.
+        items:
+          type: string
+        minItems: 1
+
+      function: true
+
+      bias-pull-up: true
+      bias-pull-down: true
+      input-enable: true
+      output-low: true
+      output-high: true
+
+      microchip,digital:
+        description: Enable digital I/O.
+        type: boolean
+
+      microchip,analog:
+        description: Enable analog I/O.
+        type: boolean
+
+    patternProperties:
+      '^(?!bias-|input-|output-)[a-z0-9]+[_-][a-z0-9_-]*$':
+        type: object
+        description: |
+          Child pin configuration node.
+
+        properties:
+          pins:
+            items:
+              type: string
+            minItems: 1
+
+          function: true
+
+          bias-pull-up: true
+          bias-pull-down: true
+          input-enable: true
+          output-low: true
+          output-high: true
+
+          microchip,digital:
+            description: Enable digital I/O.
+            type: boolean
+
+          microchip,analog:
+            description: Enable analog I/O.
+            type: boolean
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pic32_pinctrl: pinctrl@1f801400 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "microchip,pic32mzda-pinctrl";
+        reg = <0x1f801400 0x400>;
+        clocks = <&rootclk PB1CLK>;
+
+        pinctrl_uart2: pinctrl_uart2 {
+            uart2-tx {
+                pins = "G9";
+                function = "U2TX";
+                microchip,digital;
+                output-low;
+            };
+
+            uart2-rx {
+                pins = "B0";
+                function = "U2RX";
+                microchip,digital;
+                input-enable;
+            };
+        };
+    };
+
+    uart2: serial@1f822200 {
+        compatible = "microchip,pic32mzda-uart";
+        reg = <0x1f822200 0x50>;
+        interrupts = <112 IRQ_TYPE_LEVEL_HIGH>,
+                     <113 IRQ_TYPE_LEVEL_HIGH>,
+                     <114 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rootclk PB2CLK>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart2>;
+    };
-- 
2.34.1


