Return-Path: <linux-gpio+bounces-37755-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBItBW1fHWo/ZwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37755-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:31:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480961D74A
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 12:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98D313093330
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 10:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8063AD512;
	Mon,  1 Jun 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKtGJYoL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795203AA502;
	Mon,  1 Jun 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307881; cv=none; b=HyQ+gJXJr/u76oLVhCTzBnWI4vPBeY5IJIQ1de2UhXOarvvXHZo3eUCiJdNdviJnNS8KGf6PzLyYWWIDkZUEub8OG8gviv7iFEIc/ItudOHEQl1i9UtKDluGvB+XWBNTzVy0csIryavgeZP4cIdqU9k8ltsgJ6VvdSp2MDGCSx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307881; c=relaxed/simple;
	bh=jFuDhcQjyETk/sxbWvMISVQlGDomjKblYcTiu2iIPek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DBixTSgbEkCyqBxZHBg6t3+OmWAQ1jvf9YfY3BZHYRDkdBuXkyLlalHk5/ZkFl8siy+qQCl+e5WCEo6sNLwrpt5bxlxVruWZazDWhH1odExNxfWr7wbSNHnJuKaihIc7/cjJL2bH34wy4tkaWxKIkH21WFujqYcgh8y+xDhiF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKtGJYoL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE873C2BCC6;
	Mon,  1 Jun 2026 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780307881;
	bh=jFuDhcQjyETk/sxbWvMISVQlGDomjKblYcTiu2iIPek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VKtGJYoL9xHFLsrf/u+H/OpCZ7WOOQXF8KWPIycavZxy3y7EvQ4VSl4fSpiBiQAXI
	 omd50915RgWuAR10+MLPAaogGXnQB5dxfIOUYTqj453a/eCLL6meolsntGo8QhyYsT
	 rVjM1pc3kYa7vt3+TWnzvSE4GEPHbze5ZjVipELGAtMFnb7RWAR7zo6ZGi9FU0XJwT
	 ycR+KN6wpsTs1coLHZyMnKbvDMeDnVazJ+IZ0RpkuQ6AbVVSgnWeSdREfyE+CRiEds
	 Z1kgFSo5xucoHzfhsvpUgKaF2cnrIdmdY/AtwovKEi8YnOUEhjKx9GpqR4CZp5CDmA
	 vCsQTxQmy8cRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42CFCD6E56;
	Mon,  1 Jun 2026 09:58:00 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 01 Jun 2026 17:56:34 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-ultrarisc-pinctrl-v2-1-07ac5130a96d@ultrarisc.com>
References: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
In-Reply-To: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780307879; l=4423;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=QbsxCQTIuyBKTJOUlammUU+55ZwaJc2BlpF5Um24hcM=;
 b=y6iuw9elfpivfVlw3O1dOm1WFyTsHFra73s30p3h5CsTovk3B7bdvhVosE4fbUgLAhd9ssjfe
 nbe0/ytDazJBpvloIeCP1nzofeVUTyCwxJBtv8QXUW3UiQ4PCBEOKFf
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37755-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,ultrarisc.com:replyto,ultrarisc.com:mid,ultrarisc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.169.21.40:email]
X-Rspamd-Queue-Id: 8480961D74A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jia Wang <wangjia@ultrarisc.com>

Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 128 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
new file mode 100644
index 000000000000..5100033c18c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
@@ -0,0 +1,128 @@
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
+              contains:
+                pattern: '^LPC([0-9]|1[0-2])$'
+        then:
+          properties:
+            function:
+              enum:
+                - lpc
+                - espi
+
+    properties:
+      pins:
+        description: List of pins affected by this state node.
+        minItems: 1
+        uniqueItems: true
+        items:
+          type: string
+          oneOf:
+            - pattern: '^PA([0-9]|1[0-5])$'
+            - pattern: '^PB[0-7]$'
+            - pattern: '^PC[0-7]$'
+            - pattern: '^PD[0-7]$'
+            - pattern: '^LPC([0-9]|1[0-2])$'
+
+      function:
+        description: |
+          Mux function to select for the listed pins. Supported functions
+          depend on the selected pins and match the DP1000 hardware mux
+          table.
+        enum:
+          - gpio
+          - i2c0
+          - i2c1
+          - i2c2
+          - i2c3
+          - pwm0
+          - pwm1
+          - pwm2
+          - pwm3
+          - spi0
+          - spi1
+          - uart0
+          - uart1
+          - uart2
+          - uart3
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
+          pins = "PA12", "PA13";
+          function = "i2c0";
+          bias-pull-up;
+          drive-strength = <33>;
+        };
+
+        uart0-pins {
+          pins = "PA8", "PA9";
+          function = "uart0";
+          bias-pull-up;
+          drive-strength = <33>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..6fd7ce6365fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27356,6 +27356,12 @@ S:	Maintained
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



