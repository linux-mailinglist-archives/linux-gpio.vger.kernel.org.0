Return-Path: <linux-gpio+bounces-39991-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9rlXILv/VGqrigAAu9opvQ
	(envelope-from <linux-gpio+bounces-39991-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:09:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E474CD55
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:09:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=GABsGShK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39991-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39991-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4225E301067B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 15:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED946377EC3;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37F34029E;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955273; cv=none; b=rxqhSoyNKZ188cO3yGU/TWliYGrZHFCPPiihRWCDch1RWC5mq2pdJJfnOaysI1rmpo4AQe7YPGa3cVZgOFoNYzU3wvoQz4lgcjQgIG3NK25itKIa13rEPYL8BLiQ7yutMk9XjHzV7rz7p/cq3gw6MBPB3Uvm1vGQquy2JU1lAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955273; c=relaxed/simple;
	bh=pWuRmK/lvCohXgAZnOXGTEEgVS8UJF27uDGMTJ9a2Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1K/O7GfDnu0TiEVDRwWGS48g2Oxhr5rpbV5qM/Tr7jd9PwLKpBxHsxXJl164VIHhVKNOD+7oNSWbswdd3CkFMwEIta4J3XYa6CtuTOPHklwHHp4xYFgxg2pSxiWNMu4HU0BoCME9rjCh/mYdDZtcEqDs9OAP2dANOoNhMy3Vd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GABsGShK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C65C2BCB9;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783955273;
	bh=pWuRmK/lvCohXgAZnOXGTEEgVS8UJF27uDGMTJ9a2Nc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GABsGShKY9RyB+crazCaCxFiTyJyvOLdU7zOdxwilN+9SkJEgrEOmxCIO+VoQiL/o
	 mHWOzsdTy6CTdGwAETi3WaMA0mSIidRRj/KC27wsuQo52hxd294S0jZDr7m506XGzs
	 f5/HR8AuIpCDahQ3psd6JhRaNNHZtnLKOHadAj4M9tzYdAolNrzsdW5cqsM0y2Xhvc
	 49BKpWzExT+WwLUVh2SZ0nLeZB6jza3Y2famF52WUHYMkmvaBGMMLv3kHw6GVrN1Ns
	 MK+tb6nHwydY1emRh2SB6PDD+BBuxo2yasmuFu+bOCeD56HeyNFJ2miauJQQXbe32w
	 81qqEaX7NB7wQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C05AC44501;
	Mon, 13 Jul 2026 15:07:53 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Date: Mon, 13 Jul 2026 18:06:21 +0300
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-mt6858-pinctrl-v2-1-1bd072e3206c@jolla.com>
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783955270; l=6302;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=TxSc8fJL7HQZpyDdZ/01rMbgxyEamqNF+r+0Zh0YQ4s=;
 b=Zzq7ZEcY/26R8jSsDZTbjJKeEeDgJLQJSj6ogHIxBeLq25+vbLGu9tcfZEQe1Q+ge6FjZfujh
 zmmV/SpCGJ2B90dThTIZ0bLAs6ajtBlz+0lsBseVINPBeyqdjHNHycP
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39991-lists,linux-gpio=lfdr.de,nikolai.burov.jolla.com];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov@jolla.com,m:nikolai.burov+review@abscue.de,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[nikolai.burov@jolla.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,jolla.com:mid,jolla.com:email,jolla.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 108E474CD55

From: Nikolai Burov <nikolai.burov@jolla.com>

Add new DT bindings for the pin controller found in the MT6858
(MediaTek Dimensity 7100) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
 .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
new file mode 100644
index 000000000000..9b834e87afde
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
+      - description: eint south group IO
+      - description: eint west group IO
+      - description: eint east group IO
+      - description: eint center group IO
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
+      - const: eint0
+      - const: eint1
+      - const: eint2
+      - const: eint3
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
+                    "rt", "rt1", "eint0", "eint1", "eint2", "eint3";
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



