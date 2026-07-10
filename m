Return-Path: <linux-gpio+bounces-39834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gv3wOX8JUWpg+QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:02:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD3773C069
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 17:02:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=YOiMqXon;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39834-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39834-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACC6530215B9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A986C2D0C9D;
	Fri, 10 Jul 2026 15:01:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CEE2C0260;
	Fri, 10 Jul 2026 15:01:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695715; cv=none; b=WIGcPLBRqcPxJHhSvqsAIQ2naUXdbTCfoeouGGTP+0bfFPyxPE5rNCo+OB7svF+zR2NJor2IjlPrdNm+4a2ot3+nj7kPIrL1FX5UTt8Cp7Z5ZcuTFJSttMQFBymDfbdY9bzm9fBXSqJ3kNbbQCuv9QGT/Gr/mDkfqyphB94JMMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695715; c=relaxed/simple;
	bh=fEgklhfhmHG7bwMmCsB0xVCcnH1pZ9hR34yuztE2xUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/7yAOD4JLMUpBx8cpej12XQIA1MikCnO2K26FeMkfCEbc4v8PbOLdARmBgXt92aaCjifq/Y/z1GDFKBntvsAZvabzhuw8RdI2aWKmPTs+92QyCGj4OT5ioyA1+qiJHPqSUQvLDcNYEbbkLXhCIOEJohmfyGnhKhfbY6dUziBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOiMqXon; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D573C2BCB8;
	Fri, 10 Jul 2026 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783695715;
	bh=fEgklhfhmHG7bwMmCsB0xVCcnH1pZ9hR34yuztE2xUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YOiMqXonQx7l0LYs+m1a4I5YTkgs7JGLb8Aiy/FEHWfHq+nDMK6WFmK0DN052AEfY
	 KcKvS6WjzC8jGDmAeXpOd1+LZ1EGwZCknh7gblLvtsq/Tq/ZebH/WLixiu7HAQR1aH
	 ZjDB10moWoXJp8eCS4HEE4NIvhxi5sMoZzdA2G9cKIBrm+PA+OOUbOVYMdnkMy+OVW
	 krejke8TlNY/vrdJ2GuPN1uHk4Anssa6aHBevF/QvIXoelshsK4+sVshHYfwatjEzW
	 fWiDJXr1SwrZzu+ZHT/vZHp0t+rL+U1woOXBCw8z7dtPrUt6esTQ16iGWEZjKYBB0f
	 mkLrNYoPQL7Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C1FC44506;
	Fri, 10 Jul 2026 15:01:54 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Date: Fri, 10 Jul 2026 18:00:23 +0300
Subject: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
In-Reply-To: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783695712; l=6222;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=U7dRrQcnHMvcUYGQp4E4aCTMv/3kcFO5A3mfR3b5VKA=;
 b=HnotYZqqNjHTI6n5qlMRKSVHw1W9kEEfyE9QXNGgwP1ATHxQ6tj83dkPGYQtzxEk8kGcJLy37
 lvuLV55ZwQJBz82+nH896hN2cMrwqh2so7FTxOJpob0uCdU4c7g1YO/
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
Reply-To: nikolai.burov@jolla.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39834-lists,linux-gpio=lfdr.de,nikolai.burov.jolla.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov@jolla.com,m:nikolai.burov+review@abscue.de,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nikolai.burov@jolla.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jolla.com:replyto,jolla.com:mid,jolla.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBD3773C069

From: Nikolai Burov <nikolai.burov@jolla.com>

Add new DT bindings for the pin controller found in the MT6858
(MediaTek Dimensity 7100) SoC.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
new file mode 100644
index 000000000000..263830a6e9db
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6858-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6858 Pin Controller
+
+maintainers:
+  - Nikolai Burov <nikolai.burov@jolla.com>
+
+description:
+  The MediaTek's MT6858 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6858-pinctrl
+
+  reg:
+    items:
+      - description: gpio base
+      - description: lm group IO
+      - description: rb group IO
+      - description: bm2 group IO
+      - description: bm group IO
+      - description: bm1 group IO
+      - description: lt group IO
+      - description: lt1 group IO
+      - description: rt group IO
+      - description: rt1 group IO
+      - description: eint-s group IO
+      - description: eint-w group IO
+      - description: eint-e group IO
+      - description: eint-c group IO
+
+  reg-names:
+    items:
+      - const: base
+      - const: lm
+      - const: rb
+      - const: bm2
+      - const: bm
+      - const: bm1
+      - const: lt
+      - const: lt1
+      - const: rt
+      - const: rt1
+      - const: eint-s
+      - const: eint-w
+      - const: eint-e
+      - const: eint-c
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        additionalProperties: false
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h
+              for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
+                  in dt-bindings/pinctrl/mt65xx.h.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #define PINMUX_GPIO149__FUNC_SCL5 (MTK_PIN_NO(149) | 1)
+    #define PINMUX_GPIO150__FUNC_SDA5 (MTK_PIN_NO(150) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6858-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11b20000 0x1000>,
+              <0x11c10000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11e20000 0x1000>,
+              <0x11e30000 0x1000>,
+              <0x11ed0000 0x1000>,
+              <0x11ee0000 0x1000>,
+              <0x11b00000 0x1000>,
+              <0x11e60000 0x1000>,
+              <0x11e80000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1",
+                    "rt", "rt1", "eint-s", "eint-w", "eint-e", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 197>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        i2c5-pins {
+            pins {
+                pinmux = <PINMUX_GPIO149__FUNC_SCL5>,
+                         <PINMUX_GPIO150__FUNC_SDA5>;
+                bias-disable;
+            };
+        };
+    };

-- 
2.54.0



