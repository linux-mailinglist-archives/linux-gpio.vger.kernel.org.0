Return-Path: <linux-gpio+bounces-35684-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG/3KrCJ8GloUgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35684-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:19:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3048279F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 12:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F41923046E32
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FC03E276A;
	Tue, 28 Apr 2026 10:00:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA733E0C60;
	Tue, 28 Apr 2026 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370405; cv=none; b=PFfQmlCbtl3YJL7D3ca1z52j7387otPO6nY6kDiYeyKDWp/UlDOLEtemKEQvvDfKkzvN88IG6lNF9hTNpp6qYlPHlDZiASkJTEybEWZX7Pw2GXfQmjV2eawzOEMaqVkEkvYmzWKQhqP+kHwpHRxIaQCxwkvMO+VFPTL/NvbZjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370405; c=relaxed/simple;
	bh=nrVpImuF5VsXwpc/t17ssjmB+g611dGvOatKoycv6KU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oyiGvfi4tgVkfUzM/Cz6vKGCSMA+ea1n06TUUHrUk1x37aehQSbB4P7y9NvzRrKsek08zrHvp2QiVBkrbyShfbl2lIvc8sxCShXGuWYnGwC4RWYv3OusAs/Z8CXqG9PcvYvFBkvlYcmEtJxPL4F9SVpdaRXnlCkJOQF43FMItY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 28 Apr
 2026 17:54:41 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 28 Apr 2026 17:54:41 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 28 Apr 2026 17:49:45 +0800
Subject: [PATCH v8 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260428-upstream_pinctrl-v8-1-eb8ef9ab0498@aspeedtech.com>
References: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
In-Reply-To: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-clk@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777370081; l=5360;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=nrVpImuF5VsXwpc/t17ssjmB+g611dGvOatKoycv6KU=;
 b=8bkOVn/Gk0dDpToBliPJp1TLizr+fFCgoWXTYNac6xImgyzFMrY7VbxMuNjHdn/fGk8CYOFW/
 j715ODzDE6aCVa0enT/RgX1qRvYaPEMngeeXbxYl1A7rMXmylfuELoC
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Queue-Id: B0A3048279F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-35684-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_SPAM(0.00)[0.733];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.1.144:email,aspeedtech.com:mid,aspeedtech.com:email]

Add a device tree binding for the pin controller found in the
ASPEED AST2700 SoC0.

The controller manages various peripheral functions such as eMMC, USB,
VGA DDC, JTAG, and PCIe root complex signals.

Describe the AST2700 SoC0 pin controller using standard pin multiplexing
and configuration properties.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..ef500209d81e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC0 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC0.
+
+  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
+  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc0-pinctrl
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-state$':
+    description: |
+      Pin control state.
+
+      If `function` is present, the node describes a pinmux state and must
+      specify `groups`.
+
+      For pin configuration, exactly one of `groups` or `pins` must be
+      specified in each state node. Group-level configuration applies to all
+      pins in the group. Pin-level configuration may be supplied in a
+      separate state node for individual pins; when both group-level and
+      pin-level configuration apply to the same pin, the pin-level
+      configuration takes precedence.
+
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+      - if:
+          required:
+            - function
+        then:
+          required:
+            - groups
+      - oneOf:
+          - required:
+              - groups
+          - required:
+              - pins
+
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - JTAGDDR
+          - JTAGM0
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2AD0
+          - USB2AD1
+          - USB2AH
+          - USB2AHP
+          - USB2AHPD0
+          - USB2AXH
+          - USB2AXH2B
+          - USB2AXHD1
+          - USB2AXHP
+          - USB2AXHP2B
+          - USB2AXHPD1
+          - USB2BD0
+          - USB2BD1
+          - USB2BH
+          - USB2BHP
+          - USB2BHPD0
+          - USB2BXH
+          - USB2BXH2A
+          - USB2BXHD1
+          - USB2BXHP
+          - USB2BXHP2A
+          - USB2BXHPD1
+          - USB3AXH
+          - USB3AXH2B
+          - USB3AXHD
+          - USB3AXHP
+          - USB3AXHP2B
+          - USB3AXHPD
+          - USB3BXH
+          - USB3BXH2A
+          - USB3BXHD
+          - USB3BXHP
+          - USB3BXHP2A
+          - USB3BXHPD
+          - VB
+          - VGADDC
+
+      groups:
+        enum:
+          - EMMCCDN
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+          - TSPRSTN
+          - UFSCLKI
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BAP
+          - USB2BBP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - VB0
+          - VB1
+          - VGADDC
+
+      pins:
+        enum:
+          - AB13
+          - AB14
+          - AC13
+          - AC14
+          - AD13
+          - AD14
+          - AE13
+          - AE14
+          - AE15
+          - AF13
+          - AF14
+          - AF15
+
+      drive-strength:
+        enum: [3, 6, 8, 11, 16, 18, 20, 23, 30, 32, 33, 35, 37, 38, 39, 41]
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@400 {
+        compatible = "aspeed,ast2700-soc0-pinctrl";
+        reg = <0x400 0x318>;
+        emmc-state {
+            function = "EMMC";
+            groups = "EMMCG1";
+        };
+    };

-- 
2.34.1


