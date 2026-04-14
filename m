Return-Path: <linux-gpio+bounces-35137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPbOI9QM3mnRmQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 11:45:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE73F8249
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 11:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BC4030D2450
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 09:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D103CAE66;
	Tue, 14 Apr 2026 09:39:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C86B3CA49D;
	Tue, 14 Apr 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159570; cv=none; b=sLRA38r5t3vDl9qyuNyUvTaEV3C13o+Ae3KRWtoJP0Qeay+D4bBBSda2LoMpYB4B+2xPQT3zbqrp3dtdawtOhxDATyGn6bRqtZTmMxyd0wo0tWF1n9oX9CXIa61+xx0TE1uU0FJ3db8gFAtGtlg4kTF7mYiFrdWWmg8xxQjJJ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159570; c=relaxed/simple;
	bh=1adOzN89BJlq56ikXHBSEpPPcUIuo6AxNQzlti780x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CjtwiCSQtImRnVDhX+PYZnbfWus3o6umUmPzxibHskFTzDeOGfXo9QDqTm8rcFmKGMibAUSnsdqOmJU4fl4Nl72bsOo45rN/4M8j1JtjfFaH3cxi8KoZ1LPMO+X1wpLWMCVS+5B9g4300TMSYEO0iahNB4LAZi53NM6ym+mhOfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 14 Apr
 2026 17:39:15 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 14 Apr 2026 17:39:15 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 14 Apr 2026 17:39:00 +0800
Subject: [PATCH v6 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260414-upstream_pinctrl-v6-2-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
In-Reply-To: <20260414-upstream_pinctrl-v6-0-709f2127da33@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776159555; l=5282;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=1adOzN89BJlq56ikXHBSEpPPcUIuo6AxNQzlti780x8=;
 b=lUxsJPh0Uh7M+PWU69Q6zBK9UxsmwYd4K1lc21YcI0lMbJ4NkQEgtwxkFdHUSNqAGs5WfsgrS
 cSLI5mQe7UKDgA0/J7hhHmfYWatKrdD5vEoGuNo2FRqVHBV0VH/Bgfb
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35137-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[23.230.198.64:email,0.0.0.0:email,0.0.1.144:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1b0:email,1e0:email,aspeedtech.com:email,aspeedtech.com:mid,23.215.132.0:email]
X-Rspamd-Queue-Id: 89AE73F8249
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

AST2700 consists of two interconnected SoC instances, each with its own
System Control Unit (SCU). The SCU0 provides pin control, interrupt
controllers, clocks, resets, and address-space mappings for the
Secondary and Tertiary Service Processors (SSP and TSP).

Describe the SSP/TSP address mappings using the standard
memory-region and memory-region-names properties.

Disallow legacy child nodes that are not present on AST2700, including
p2a-control and smp-memram. The latter is unnecessary as software can
access the scratch registers via the SCU syscon.

Also allow the AST2700 SoC0 pin controller to be described as a child
node of the SCU0, and add an example illustrating the SCU0 layout,
including reserved-memory, interrupt controllers, and pinctrl.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index a87f31fce019..d65897576a40 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -46,6 +46,17 @@ properties:
   '#reset-cells':
     const: 1
 
+  memory-region:
+    items:
+      - description: Region mapped through the first SSP address window.
+      - description: Region mapped through the second SSP address window.
+      - description: Region mapped through the TSP address window.
+  memory-region-names:
+    items:
+      - const: ssp-0
+      - const: ssp-1
+      - const: tsp
+
 patternProperties:
   '^p2a-control@[0-9a-f]+$':
     description: >
@@ -87,6 +98,7 @@ patternProperties:
             - aspeed,ast2400-pinctrl
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
+            - aspeed,ast2700-soc0-pinctrl
 
     required:
       - compatible
@@ -156,6 +168,29 @@ required:
   - '#clock-cells'
   - '#reset-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            anyOf:
+              - const: aspeed,ast2700-scu0
+              - const: aspeed,ast2700-scu1
+    then:
+      patternProperties:
+        '^p2a-control@[0-9a-f]+$': false
+        '^smp-memram@[0-9a-f]+$': false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2700-scu0
+    else:
+      properties:
+        memory-region: false
+        memory-region-names: false
+
 additionalProperties: false
 
 examples:
@@ -180,4 +215,81 @@ examples:
             reg = <0x7c 0x4>, <0x150 0x8>;
         };
     };
+
+  - |
+    / {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            ssp_region_0: memory@400000000 {
+                reg = <0x4 0x00000000 0x0 0x01000000>;
+                no-map;
+            };
+
+            ssp_region_1: memory@401000000 {
+                reg = <0x4 0x01000000 0x0 0x01000000>;
+                no-map;
+            };
+
+            tsp_region: memory@402000000 {
+                reg = <0x4 0x02000000 0x0 0x01000000>;
+                no-map;
+            };
+        };
+
+        bus {
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            syscon@12c02000 {
+                compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";
+                reg = <0 0x12c02000 0 0x1000>;
+                ranges = <0x0 0x0 0x12c02000 0x1000>;
+                #address-cells = <1>;
+                #size-cells = <1>;
+                #clock-cells = <1>;
+                #reset-cells = <1>;
+
+                memory-region = <&ssp_region_0>, <&ssp_region_1>,
+                                <&tsp_region>;
+                memory-region-names = "ssp-0", "ssp-1", "tsp";
+
+                silicon-id@0 {
+                    compatible = "aspeed,ast2700-silicon-id", "aspeed,silicon-id";
+                    reg = <0x0 0x4>;
+                };
+
+                interrupt-controller@1b0 {
+                    compatible = "aspeed,ast2700-scu-ic0";
+                    reg = <0x1b0 0x4>;
+                    #interrupt-cells = <1>;
+                    interrupts-extended = <&intc0 97>;
+                    interrupt-controller;
+                };
+
+                interrupt-controller@1e0 {
+                    compatible = "aspeed,ast2700-scu-ic1";
+                    reg = <0x1e0 0x4>;
+                    #interrupt-cells = <1>;
+                    interrupts-extended = <&intc0 98>;
+                    interrupt-controller;
+                };
+
+                pinctrl@400 {
+                    compatible = "aspeed,ast2700-soc0-pinctrl";
+                    reg = <0x400 0x318>;
+                    emmc-state {
+                        function = "EMMC";
+                        groups = "EMMCG1";
+                    };
+                };
+            };
+        };
+    };
+
 ...

-- 
2.34.1


