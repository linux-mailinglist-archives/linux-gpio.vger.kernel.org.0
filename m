Return-Path: <linux-gpio+bounces-38069-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vWUEIHt1JmobWwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38069-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 09:55:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E4653BA7
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 09:55:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="nwqqh/71";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38069-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38069-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B88A9304BBFC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 07:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BBC399369;
	Mon,  8 Jun 2026 07:51:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B97397691;
	Mon,  8 Jun 2026 07:50:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905059; cv=none; b=K5oyP0BqzNDrV6Ou0MU7MsHjgm2mkPjoDjub1DW+I5AmfDfrHT7R2SsbQCp2iEGyx6IBPDy6oNB9nIhfVlmxKYkaurXHTchYsge7+9wA2NwDQUiCOato5KQmlkCNveCfre1tVeSI5gDzA9ENv7mIVF31PesL+rr2oD/R/KdVKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905059; c=relaxed/simple;
	bh=7YMkbONCUYbjB2BAT5s23dOaUBJ/DKYL+alz/WSFqsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoPVQla6mQucW8tVKSrPr9r81X5B3AjuRrkWppkBNaI4ZzCk2m53Uao/Zunb+3PLht6s0Z76l1Uu8Lc4+u9Of9GQbHkZ97EnwdEhmqe48AvR1deW7zKT7o+kTi/C29f7OEOD8CkjD9t46bQDi2u7ezN7V/YU0+bLQyaw1CdCFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwqqh/71; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0DFCC4AF14;
	Mon,  8 Jun 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780905058;
	bh=7YMkbONCUYbjB2BAT5s23dOaUBJ/DKYL+alz/WSFqsA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nwqqh/71TOuYj67kh9TEAVw7gFWc1puWTsy3UtJ/YXCDAUXjOkjpHAZogjPB8L97P
	 FnOFRLxb/UjFoEESmrtb4Q+vxuhoPCtJGfSe0ts0S58G6C78d/cMVo2Hkg4xmXQJrP
	 EAAyd9SK+hzNGX+HGWCg9qhthHURJ9YQbOU7zIAAV4rKQ6SFJM9McV4LMAPkXsi6IO
	 wKEwQ8Q0ANsrY/7JpwSb0ONXi89GtTQ7sLYYGyEEkIllRfQ9aPZwCKGXRG1RzG0fUG
	 8MIM5IqjpWVnJi+e/iGuDgvMJkALyyJ+jPepjF4JQvP0Cf8sda5AtgrD/epl4//DaD
	 gTsoqG4Hd9mew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB82CD8C92;
	Mon,  8 Jun 2026 07:50:58 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 08 Jun 2026 15:50:48 +0800
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-ultrarisc-pinctrl-v3-1-30a09ed74275@ultrarisc.com>
References: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com>
In-Reply-To: <20260608-ultrarisc-pinctrl-v3-0-30a09ed74275@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780905056; l=6164;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=7wc/wuKQeJWHUpB2jV9O8lTrj2MDNsGF0val+jwMTt0=;
 b=kNDXWzK+1UWP/XsomtpYZC9kyWyikrUUfgyzlmkbSPDh4dGmCQrFwAwdu53+gJB2v/z7mLaqz
 7tFL3+gdEBeAm+unh9tj1BLrSuWeQdQME32e0/MYgazCIFu6+1cDWxh
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38069-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D20E4653BA7

From: Jia Wang <wangjia@ultrarisc.com>

Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  63 ++++++++++
 3 files changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
new file mode 100644
index 000000000000..a64fbfc616db
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
@@ -0,0 +1,131 @@
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
+          List of pins affected by this state node, using the numeric pin IDs
+          defined in dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h.
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
+    #include <dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pinctrl@11081000 {
+        compatible = "ultrarisc,dp1000-pinctrl";
+        reg = <0x0 0x11081000 0x0 0x1000>;
+
+        i2c0-pins {
+          pins = <PA12 PA13>;
+          function = "i2c";
+          bias-pull-up;
+          drive-strength = <33>;
+        };
+
+        uart0-pins {
+          pins = <PA8 PA9>;
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
diff --git a/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
new file mode 100644
index 000000000000..f800c9722471
--- /dev/null
+++ b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_H
+#define _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_H
+
+#define PA0		0
+#define PA1		1
+#define PA2		2
+#define PA3		3
+#define PA4		4
+#define PA5		5
+#define PA6		6
+#define PA7		7
+#define PA8		8
+#define PA9		9
+#define PA10		10
+#define PA11		11
+#define PA12		12
+#define PA13		13
+#define PA14		14
+#define PA15		15
+#define PB0		16
+#define PB1		17
+#define PB2		18
+#define PB3		19
+#define PB4		20
+#define PB5		21
+#define PB6		22
+#define PB7		23
+#define PC0		24
+#define PC1		25
+#define PC2		26
+#define PC3		27
+#define PC4		28
+#define PC5		29
+#define PC6		30
+#define PC7		31
+#define PD0		32
+#define PD1		33
+#define PD2		34
+#define PD3		35
+#define PD4		36
+#define PD5		37
+#define PD6		38
+#define PD7		39
+#define LPC0		40
+#define LPC1		41
+#define LPC2		42
+#define LPC3		43
+#define LPC4		44
+#define LPC5		45
+#define LPC6		46
+#define LPC7		47
+#define LPC8		48
+#define LPC9		49
+#define LPC10		50
+#define LPC11		51
+#define LPC12		52
+
+#endif /* _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_H */

-- 
2.34.1



