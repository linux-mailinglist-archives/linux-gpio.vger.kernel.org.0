Return-Path: <linux-gpio+bounces-31650-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF12EmHejmluFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31650-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:18:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8468133E92
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD9230B85C5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1C531DD86;
	Fri, 13 Feb 2026 08:18:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD8E31960D;
	Fri, 13 Feb 2026 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970687; cv=none; b=Gmsiu4vKwoJbwuKThqxHCIw9QE0CVi3dH62kATwklCV7UOwQN4X0ueB/ldGTuKRO7xo3iHEi3997bqJrHAVaS3OaYM8x7qKh2rrBRYCFd5spPeEkEnHXL/rT6t2YIkTmD35Bz1St0BzmkeLHeWwlIXkqqjX9jLvoYbXK82BGkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970687; c=relaxed/simple;
	bh=btGp9Y9DY2YDzIKxQ4nzYfeU8KTNhNWyQaI1KcxpA8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZOaIv+HdItFHXXtA5Cs5vT3g+IpNA8zfSm/gY0Ot2dGAYjlSygqYk4f2TzftqG7ZKHK1ZC91aaf+4K3ajtDGRpzQszt3Mv6g5CeTilycRaTl1nKmRodRjHiJjT4ViJYbJvXmv7hvmuzwWS9M4JDoGkRe+f8qjvH1c31NmhlDQno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Feb
 2026 16:17:55 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Feb 2026 16:17:55 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 13 Feb 2026 16:17:42 +0800
Subject: [PATCH RFC 1/2] dt-bindings: pinctrl: Add pinctrl-packed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260213-pinctrl-single-bit-v1-1-c60f2fb80efb@aspeedtech.com>
References: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
In-Reply-To: <20260213-pinctrl-single-bit-v1-0-c60f2fb80efb@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770970675; l=6251;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=btGp9Y9DY2YDzIKxQ4nzYfeU8KTNhNWyQaI1KcxpA8s=;
 b=s7ZgCtBuEJiKRU4PE4pTcsjmidOPe6Pr3I1F2LQbrMy2qT2AWW6Qip1McM+yHx0XX+Y2n7bVc
 zLiNwujNN/bAUthtPElUQpJiisIpUfI06GadbLUWPhHZhIFmTf8Wot1
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31650-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: B8468133E92
X-Rspamd-Action: no action

Add a Devicetree binding for a generic pin controller where pinmux and/or
pin configuration are represented as fixed-width fields packed
sequentially within shared registers.

The binding targets controllers that are typically exposed as subnodes of
a syscon node and accessed via regmap-mmio through the parent.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/pinctrl/pinctrl-packed.yaml           | 166 +++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
new file mode 100644
index 000000000000..dd01ba2fed71
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-packed.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-packed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Pin Controller with Packed-Field Registers
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  This binding describes pin controller hardware where pinmux and/or
+  pin configuration fields are represented as fixed-width fields packed
+  sequentially within shared registers.
+
+  Such controllers are commonly embedded within a larger system control
+  unit (SCU) register block and may be exposed as subnodes of a syscon
+  device.
+
+  Conceptually, this model is related to the pinctrl-single binding,
+  but instead of describing individual register offsets via
+  <offset, value, mask> tuples, the hardware provides fixed-width,
+  per-pin fields packed linearly within shared registers.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - pinctrl-packed
+          - pinconf-packed
+
+  reg:
+    maxItems: 1
+
+  '#pinctrl-cells':
+    description:
+      The pinctrl provider uses standard state nodes referenced by pinctrl-N
+      properties; consumers do not pass per-pin arguments via phandle.
+    const: 1
+
+  pinctrl-packed,function-mask:
+    description: Mask of the allowed register bits for a single pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pinctrl-packed,gpio-range:
+    description: Optional list of pin base, nr pins & gpio function.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle of a gpio-range node
+        - description: pin base
+        - description: number of pins
+        - description: gpio function
+
+patternProperties:
+  '-pins(-[0-9]+)?$|-pin$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      pinctrl-packed,pins:
+        description: Array of pin index and function selector pairs.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
+      pinctrl-packed,bias-pullup:
+        description: Optional bias pull-up configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 4
+        items:
+          - description: Input value.
+          - description: Enabled pull-up bits.
+          - description: Disabled pull-up bits.
+          - description: Pull-up mask.
+        additionalItems: false
+
+      pinctrl-packed,bias-pulldown:
+        description: Optional bias pull-down configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 4
+        items:
+          - description: Input value.
+          - description: Enabled pull-down bits.
+          - description: Disabled pull-down bits.
+          - description: Pull-down mask.
+        additionalItems: false
+
+      pinctrl-packed,drive-strength:
+        description: Optional drive strength configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Drive strength value.
+          - description: Drive strength mask.
+        additionalItems: false
+
+      pinctrl-packed,input-schmitt:
+        description: Optional input Schmitt trigger configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Schmitt trigger value.
+          - description: Schmitt trigger mask.
+        additionalItems: false
+
+      pinctrl-packed,input-schmitt-enable:
+        description: Optional input Schmitt enable configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 4
+        items:
+          - description: Input value.
+          - description: Enable bits.
+          - description: Disable bits.
+          - description: Schmitt mask.
+        additionalItems: false
+
+      pinctrl-packed,low-power-mode:
+        description: Optional low power mode configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Low power value.
+          - description: Low power mask.
+        additionalItems: false
+
+      pinctrl-packed,slew-rate:
+        description: Optional slew rate configuration.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        maxItems: 2
+        items:
+          - description: Slew rate value.
+          - description: Slew rate mask.
+        additionalItems: false
+
+required:
+  - compatible
+  - reg
+  - "#pinctrl-cells"
+  - pinctrl-packed,function-mask
+
+additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "syscon", "simple-mfd";
+        reg = <0x0 0x1000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pinctrl@400 {
+            compatible = "pinctrl-packed";
+            reg = <0x400 0x80>;
+            #pinctrl-cells = <1>;
+            pinctrl-packed,function-mask = <0xf>;
+
+            uart0-pins {
+                /* <pin_index function_select> pairs */
+                pinctrl-packed,pins = <0 2>, <1 2>;
+            };
+        };
+    };

-- 
2.34.1


