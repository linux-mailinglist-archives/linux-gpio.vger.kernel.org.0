Return-Path: <linux-gpio+bounces-38212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vSu1CmX2KGr/OAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:30:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE9665F33
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=pxDqEWfn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38212-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38212-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9863077703
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 05:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2D3372073;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62066238150;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781069398; cv=none; b=Io0Vgci5zLPeSyU2NpaUqant9SNO7dE79zHNh3o7FnCxlwl577BXkf6SQBdxamMSwmNX1BEvHrpMcEv7dmyrm5SyJEaHs2zxuhDGaRyFeI7jysjbTk7VRCtwELkNWsk2tHl8yrWM/i2thVqFNrXMAbZyifRpJvTtOQ2ig56shxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781069398; c=relaxed/simple;
	bh=cVlyyItktmstkhMJWuMMQegzdtakcdfVsuHnRn693lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xvky1t1mAWtQP0VeeoLN6z5AcPlwbrrWa9fTob1wWDe7W7ezeQw30K6xHXC2KTu5bC9OP5wFweI0ksqJFrMF1FH33ULqAtNl1GnAFt+eXVLifnmgijjKZqSPz+zcvSZCe5eBcHM6rFS45alqylX6mykWk5g2tfgLrR5GRiO+1ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxDqEWfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14084C2BCB9;
	Wed, 10 Jun 2026 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781069398;
	bh=cVlyyItktmstkhMJWuMMQegzdtakcdfVsuHnRn693lA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pxDqEWfnEW8mJs5GRwjVSV6hCtpf+2dkk0D779F0DS8hPllRWdNQV1Srs6oUJ4uct
	 ClZoq9HDwwHBsi4kuDtGfBy7ksuYzCJiyHtOAl3t0O/KOk2ZGsDc0j4Chcwgq5lkm9
	 33BIufitU1OuF7Fxg0MJxSrORiHLA/fACRJU3gWHarRCJjI8OcnUmRj7mVMqqD3l9A
	 KnsCqK07zbrgsUtDPdiH4REhcawJc+f6dS0ctHG1mS8wWT+k3ItJy6FYPT2zr5p1UK
	 nwQp5qsRHBaIZp33O9utahs9Bok0jlH20pFsMMEmhZ4QpnJk0x4pLo3hdV0A6O4ena
	 oWb+8OjWStvUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAE2CD98C5;
	Wed, 10 Jun 2026 05:29:57 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Wed, 10 Jun 2026 13:29:55 +0800
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260610-ultrarisc-pinctrl-v4-1-b7e9b2a8ed84@ultrarisc.com>
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781069395; l=4553;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=HDhBrs4WQFdifP+U6mC2pKW12Nvlscm7MFaLWDp8vUI=;
 b=6MhhPtIU8EPspqTjVIy5+cc3s5GzUmDoxiSOq2Xhq4WEL+4NWF9dTgnu6yEf4oO8YQl1FfJ6d
 WhjotP0i7zxAsd+BwQdWKSoa/auZL6G6Pr+OZkly2iWRkBxs/Na+poN
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38212-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,ultrarisc.com:replyto,ultrarisc.com:email,ultrarisc.com:mid,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76BE9665F33

From: Jia Wang <wangjia@ultrarisc.com>

Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 130 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
new file mode 100644
index 000000000000..c2332e6e60c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC DP1000 Pin Controller
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description: |
+  UltraRISC RISC-V SoC DP1000 pin controller.
+  The controller manages ports A, B, C, D and LPC. Ports A-D default to
+  GPIO and provide additional SPI, UART, I2C, and PWM mux functions.
+  LPC pins default to the LPC interface and can be muxed to eSPI.
+  All pins also support pin configuration, including drive strength,
+  pull-up, and pull-down settings.
+
+properties:
+  compatible:
+    const: ultrarisc,dp1000-pinctrl
+
+  reg:
+    items:
+      - description: pin controller registers
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  '.*-pins$':
+    type: object
+    unevaluatedProperties: false
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+      - if:
+          properties:
+            pins:
+              items:
+                minimum: 40
+                maximum: 52
+        then:
+          properties:
+            function:
+              enum:
+                - lpc
+                - espi
+        else:
+          properties:
+            pins:
+              items:
+                maximum: 39
+            function:
+              enum:
+                - gpio
+                - i2c
+                - pwm
+                - spi
+                - uart
+
+    properties:
+      pins:
+        description: |
+          List of pins affected by this state node, using numeric pin IDs.
+          Pins 0-39 correspond to ports A-D, and pins 40-52 correspond
+          to LPC0-LPC12.
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        uniqueItems: true
+        items:
+          minimum: 0
+          maximum: 52
+
+      function:
+        description: |
+          Mux function to select for the listed pins. Supported functions
+          depend on the selected pins and match the DP1000 hardware mux
+          table.
+        enum:
+          - gpio
+          - i2c
+          - pwm
+          - spi
+          - uart
+          - lpc
+          - espi
+
+      bias-disable: true
+      bias-high-impedance: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+      drive-strength:
+        description: Output drive strength in mA.
+        enum: [20, 27, 33, 40]
+
+    required:
+      - pins
+      - function
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pinctrl@11081000 {
+        compatible = "ultrarisc,dp1000-pinctrl";
+        reg = <0x0 0x11081000 0x0 0x1000>;
+
+        i2c0-pins {
+          pins = <12 13>;
+          function = "i2c";
+          bias-pull-up;
+          drive-strength = <33>;
+        };
+
+        uart0-pins {
+          pins = <8 9>;
+          function = "uart";
+          bias-pull-up;
+          drive-strength = <33>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e035a3be797c..1ef874d342a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27357,6 +27357,12 @@ S:	Maintained
 F:	drivers/usb/common/ulpi.c
 F:	include/linux/ulpi/
 
+ULTRARISC DP1000 PINCTRL DRIVER
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
+
 ULTRATRONIK BOARD SUPPORT
 M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>

-- 
2.34.1



