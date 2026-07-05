Return-Path: <linux-gpio+bounces-39479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bN6JMFFbSmrqBgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 15:25:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821670A191
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 15:25:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CMQ4r7Uz;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39479-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39479-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C2C9300E3D8
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 13:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6B437E300;
	Sun,  5 Jul 2026 13:25:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A63D37DEBB
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 13:25:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783257934; cv=none; b=lzX6X+ELiMw2U38sH/xDmTTZ70H4RML2hl+jqNBjp47rr4QzL0xao7mTNk1jHhizB50DxRkWvkIVDiPeNV/757q0kBPdXuVCEE+IMG8UjTCE6CiDjvx4PhR1v6RjvDgebXWZQ2ip2iaegKNsUGQ/r9UxHFxg5FjHUVOVn8/nU0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783257934; c=relaxed/simple;
	bh=2n+9kHjJ+NgQUCaJGlzIGcRg5Y9SXBiYR+V2oD3Q67I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WIlBYUjkcLQ6WR9D+RSAvtiQklUnE9pKVkiMCoNfYHTxTmRLCa8J7BR2NAKN3H8E/bBDf1fCj+/Mptc1YRK7YOFb/ejloA/l84AXvbSYGWrORXAHhsrAi0ABen4Co+01q3X2E0pdu1dHa8e/sOnPYJcSyepJ2MzAQ/El6q43lKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMQ4r7Uz; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so1254888a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783257932; x=1783862732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCUQEdLKr3eavP6cJqECO8YF71F1Siq9zhvu6pN/EkA=;
        b=CMQ4r7UzvpJxkxJ3rwhxsUSIW9NkpRU/7jdXdSZEa66j2VZgvmeO7C12bVF55vmmnb
         S/W40bYyi/p2xRXy5yIju0MeF/zBFH+4UvhwZE7k0CekLwLJa1ahsCimYMJ8AbSEWQ2H
         VthGjw4+Ie+B3yVYRxwzMXPri1ibyORcXx23vmJrd8i/liOZhSs106H0w1+7fVYcIszz
         6RsvYyLXPscf+6zoxSf4g+9s4QBMZn12aEiBharbIhkUPPrjJVlIRJ6YqB/HWm+Ud5Dg
         PbHa4uA5t2ZbHwHBw2pIiLIE0pwDhK9X0ucs8T19c+K0VjZ1vTORkTxL8eQCD/4vMlM+
         a0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783257932; x=1783862732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCUQEdLKr3eavP6cJqECO8YF71F1Siq9zhvu6pN/EkA=;
        b=N16ZB2TcE3E5QZqeJ+tkisJgRIRWki4w5j9C2N+LDRezjqI4kRTG6mQpXwWWQqHErE
         M95FUkVBr/sTYGmOJv2fQNF33Olqzk2GbeBHAYjr64eZHCbYPn5ro5wCzlAGqyKoyD/6
         ce1lpWShdSJOxxpd8oC1Q7OGoZbuLT4RyAfg2+gpScN+ID8wzsbEfUDUdoUpgnmNJN8F
         /w7Bf0qRbVIWNtYAlydU0ueTiGJgPjPs3h7AifEJJMsxh70eHszN9SYfIZe2JN2G5o3j
         Wf6gFKGJpbeLSfdbGykkYXnGbI+7XPYR5E7cE9L1/BTQPtv17LW6rlcO7bfJkej47Bro
         lr/A==
X-Forwarded-Encrypted: i=1; AHgh+Ro2HSo04VFTwiN42y21+CQLpf0b31ZWfV/U3MkyLcvJY6dO/YCr69WxxmFG/9BaAhcMy5wbxEl21Sdp@vger.kernel.org
X-Gm-Message-State: AOJu0YyACPKprsdQLG/YI1/vOvxspNxF7ydsQRgobu2ZBCWfev1wp7VR
	lE2/aoyXIxy7LVfU6xiTG8kxwlfvtY5U76seqeN8w/iIsCZgV2d2D6B1
X-Gm-Gg: AfdE7cmEnr//4mZB1IbBMXAmMCoRnb4OcsXlWV20AiRQLIa5zS//mLJqOGM9RpXuoFH
	peeVXangaovTxguQreSnaKRimm6VoU1JeqNi6k6XsWGMTmP3RE45zMR7gGTvbW3VLXZmU/P5k5D
	zVm1OTM4tSkHD6OwhTu5QL4CJf8UZh2Tb8qUfxTLvsedrow44f2RtLdj/4jhYsbFD7ZYGyowviK
	ygzjP4+j06QLZeewmxIRzD7BBRbxOWZA3jkVmT5PZjOe/oFDeo3EqpkUrLR2tsKF04bTCEzGDot
	2m5Y1GqZCRH/Nw6xGqbA1o/9NkSn2qmtXdAySDAcRTcnP/WNZH60d9CN/Pp0l/q31AbRXKVkByB
	Z1TpDjn9cNN87PpAvKPiIRV83J1Y1F65dztH+9hs7Qqqm72cLRa8DRWLCZ3n74mNIl90J9lzIcy
	H/bnql8Ns4llgHJv7dT06EJWyPL5JPT9ScsMWKkvPIYg==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11898566a91.11.1783257932301;
        Sun, 05 Jul 2026 06:25:32 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.165.177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm18659165eec.17.2026.07.05.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 06:25:31 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
Date: Sun,  5 Jul 2026 18:55:21 +0530
Message-Id: <20260705132521.159522-1-challauday369@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,brighamcampbell.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39479-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:challauday369@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3821670A191

Convert Microchip PIC32 Pin Controller devicetree binding
from legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 .../pinctrl/microchip,pic32-pinctrl.txt       |  60 --------
 .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 141 ++++++++++++++++++
 2 files changed, 141 insertions(+), 60 deletions(-)
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
index 000000000000..87ac5aace5e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
@@ -0,0 +1,141 @@
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
+  '^[a-z0-9]+[_-].*$':
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
+      '^[a-z]+[0-9]+-[a-z]+$':
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
+          function:
+            description: |
+              A string containing the name of the function to mux pin.
+            enum: [ U2TX, U2RX, U4TX, U4RX ]
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
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_uart2>;
+    };
-- 
2.34.1


