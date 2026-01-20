Return-Path: <linux-gpio+bounces-30779-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDb+AM0acGkEVwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30779-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 01:16:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E514E653
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 01:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C80A645496
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589E3425CC3;
	Tue, 20 Jan 2026 11:43:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F671423A85;
	Tue, 20 Jan 2026 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909400; cv=none; b=SReMd/VPILd5f54Js29k4qHTedlCqe0c13eNPVfWxzldQ45JPnSTXygtWQJuPB43ickedWvtgkTrmDeldtVEoVXy/sc3RYhGGSWClAtPyquqT4T9hRR/hpPWm2idXXNRGQMgHLAtQkE/d6wZkBavNQk7RqXrjHAi9UtcgO2QSvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909400; c=relaxed/simple;
	bh=MrVRNKm/mjltzAWngdN4v+Ffyd7xxroQ3hNrDmuuTjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TAUtfwxkKFg3RaL6YpOIpaXTUb+QDVpcM8VCOrTjae3VYhFmfV02pWngRT02Y4IrjJKv1Wz7TUfZvN4qdcRvn+6zLg0TSpIEWleIcsWHlOAmn6mEawIrNLBwiF3cRUzl8ApSZGYQbznyM+dYFk9hPvuKFpaGeYFTfgg17x347Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 20 Jan 2026 19:43:06 +0800
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=5436;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=MrVRNKm/mjltzAWngdN4v+Ffyd7xxroQ3hNrDmuuTjU=;
 b=lFnzFI3T2fdX4n4eQ4/F2ICFdre8wOEtRMhqeD6VfFGt/HNoMFRnIuy/V+ZMLU5zH5KHTK/Yr
 S3jQnwoRCfYBZPKhdfKHaAFShqiq4Vh7mZrFWo02UC2gILYzLORDkpC
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [1.74 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : No valid SPF, No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-30779-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,devicetree.org:url,12c02000:email,aspeedtech.com:email,aspeedtech.com:mid,0.0.1.144:email]
X-Rspamd-Queue-Id: 11E514E653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for the pin controller found in ASPEED AST27xx SoCs.

The AST2700 SoC consists of two interconnected SoC instances, each
with its own pin controller register block managed by a separate
System Control Unit (SCU).

Introduce the "aspeed,ast2700-soc0-pinctrl" compatible string to
describe the SoC0 pin controller, which is not compatible with
existing ASPEED pinctrl bindings.

The SoC1 pin controller follows a regular and predictable register
layout and can be described using an existing generic pinctrl
binding, therefore no dedicated AST2700-specific compatible string
is introduced for it.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  27 +++++
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 +++++++++++++++++++++
 2 files changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index ff6cf8f63cbc..7eda8fddc560 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -164,4 +164,31 @@ examples:
             reg = <0x7c 0x4>, <0x150 0x8>;
         };
     };
+
+  - |
+    syscon@12c02000 {
+        compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";
+        reg = <0x0 0x12c02000 0x0 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x0 0x12c02000 0x1000>;
+
+        pinctrl0: pinctrl@400 {
+            compatible = "aspeed,ast2700-soc0-pinctrl";
+            reg = <0x400 0x600>;
+
+            emmc-state {
+                function = "EMMC";
+                groups = "EMMCG1";
+            };
+
+            emmcclk-driving-state {
+                pins = "AC14";
+                drive-strength = <2>;
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..f52dfe0cb4c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,130 @@
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
+
+patternProperties:
+  '-state$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - VB
+          - TSPRSTN
+          - UFSCLKI
+          - VGADDC
+          - USB3AXHD
+          - USB3AXHPD
+          - USB3AXH
+          - USB3AXHP
+          - USB3AXH2B
+          - USB3AXHP2B
+          - USB3BXHD
+          - USB3BXHPD
+          - USB3BXH
+          - USB3BXHP
+          - USB3BXH2A
+          - USB3BXHP2A
+          - USB2AXHD1
+          - USB2AXHPD1
+          - USB2AXH
+          - USB2AXHP
+          - USB2AXH2B
+          - USB2AXHP2B
+          - USB2AD1
+          - USB2AHPD0
+          - USB2AH
+          - USB2AHP
+          - USB2AD0
+          - USB2BXHD1
+          - USB2BXHPD1
+          - USB2BXH
+          - USB2BXHP
+          - USB2BXH2A
+          - USB2BXHP2A
+          - USB2BD1
+          - USB2BHPD0
+          - USB2BH
+          - USB2BHP
+          - USB2BD0
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGDDR
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGM0
+          - PCIERC0PERST
+          - PCIERC1PERST
+
+      groups:
+        enum:
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - EMMCCDN
+          - VGADDC
+          - VB1
+          - VB0
+          - TSPRSTN
+          - UFSCLKI
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BBP
+          - USB2BAP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+
+    pins:
+      $ref: /schemas/types.yaml#/definitions/string-array
+    drive-strength:
+      minimum: 0
+      maximum: 15
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false

-- 
2.34.1


