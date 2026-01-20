Return-Path: <linux-gpio+bounces-30821-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAc3Gg/Kb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30821-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:31:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC64497ED
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67FCC54DFD2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 18:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB80044CF59;
	Tue, 20 Jan 2026 18:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/MWJttb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1D44E02C;
	Tue, 20 Jan 2026 18:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932976; cv=none; b=fc7t5YYU88OeLb+s8hXL0ZCypUwJDnT8rWbanxNjCaGdmAwDc65LFPmSrPuK5UI1U0B4GRN5rn7M2He3zFEdgRD1T/c+9gsek7dtHXBtCHNgWUFoS9K02SpEPtIoYXNf6huiK+TF3C5T2iQeGdcO2UMYYQopL9wYdMxfzne53e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932976; c=relaxed/simple;
	bh=Aw4O/tAH2CFoL17mTtGgcACPbZ5HoHxw5W7CgBBZw4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orvhJKfuL4y1bVzoDBFKFv4qTkYJLEzIpwVPyL9qVM2hH3pa361DacvYLaIqEFAvvcrC6Qo+eyP2xp+yOkAAAq6ZkuGo2CjKJoyxI+Odw5P0XTfhzbqDPZVxOSqyBcR+zZ4Nk23f/OqxDN5Spe0E42i44+vi3Cle/RAJTaV46Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/MWJttb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45169C19422;
	Tue, 20 Jan 2026 18:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932976;
	bh=Aw4O/tAH2CFoL17mTtGgcACPbZ5HoHxw5W7CgBBZw4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c/MWJttbYfAmbqgCLFmTGX0Iey78I51XLUgF27hikzLFvcSvrwc/Ipu//2HAnWNSL
	 BQKKuAHQQHugKm4rfkW7mWp2DFy2HVoHBLQ5GnPMkRM/oewrErJGxKGa7PSR0LXtqW
	 o4tTpbvEy/rrVfrSaOFRhjEaCtMNYmr/p6YGuUcIxet2+ozXcfMt3rkWaYFKpmFhi8
	 5vEiSFv55htLGk8t4mHFiIJ3CKmVsPT8bmoe0biPzSA7+J2jAmSrIfZEG8qjdnlFRG
	 iXH//4RgbZalDWDbXHhGtwIEVffcA645T42v/6tiIPqFuZgYnjQvDGlH2NmD+q8Lh0
	 P+UuxV0KJqCUw==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v4 3/5] dt-bindings: pinctrl: document polarfire soc mssio pin controller
Date: Tue, 20 Jan 2026 18:15:41 +0000
Message-ID: <20260120-crewman-unmapped-27c32b5d3163@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
References: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5136; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4O8W1Kk5A/8Bu7EPK38qeO65/dXnbeqNTeICHehav8g=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJn5x7wyOMpO7F0RaSJW/GnptuUGLXKrEj/W1vgYmpxd3 5S3XD62o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABP58YHhr2jq1nbj99sPpy/5 f8t9zflkUb1ToT6/23NMY8quVP/sW8HIcMFumRurpWBT7QaRC95rikXl5WfqaZixO8i8//XFeg4 fNwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30821-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_PROHIBIT(0.00)[0.0.0.204:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,microchip.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: DFC64497ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

On Polarfire SoC, the Bank 2 and Bank 4 IOs connected to the
Multiprocessor Subsystem (MSS) are controlled by IOMUX_CRs 1 through 6,
which determine what function in routed to them, and
MSSIO_BANK#_IO_CFG_CRs, which determine the configuration of each pin.

Document it, including several custom configuration options that stem
from MSS Configurator options (the MSS Configurator is part of the FPGA
tooling for this device). "ibufmd" unfortunately is not a 1:1 mapping
with an MSS Configurator option, unlike clamp-diode or lockdown, and I
do not know the effect of any bits in the field. I have no been able to
find an explanation for these bits in documentation.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 109 ++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
new file mode 100644
index 000000000000..fe05196160f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,mpfs-pinctrl-mssio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC MSSIO pinctrl
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: microchip,mpfs-pinctrl-mssio
+      - items:
+          - const: microchip,pic64gx-pinctrl-mssio
+          - const: microchip,mpfs-pinctrl-mssio
+
+  reg:
+    maxItems: 1
+
+  pinctrl-use-default: true
+
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        additionalProperties: false
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins. The "reserved" function tristates a pin.
+            enum: [ sd, emmc, qspi, spi, usb, uart, i2c, can, mdio, misc
+                    reserved, gpio, fabric-test, tied-low, tied-high, tristate ]
+
+          bias-bus-hold: true
+          bias-disable: true
+          bias-pull-down: true
+          bias-pull-up: true
+          input-schmitt-enable: true
+          low-power-enable: true
+
+          drive-strength:
+            enum: [ 2, 4, 6, 8, 10, 12, 16, 20 ]
+
+          power-source:
+            description:
+              Which bank voltage to use. This cannot differ for pins in a
+              given bank, the whole bank uses the same voltage.
+            enum: [ 1200000, 1500000, 1800000, 2500000, 3300000 ]
+
+          microchip,clamp-diode:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description:
+              Reflects the "Clamp Diode" setting in the MSS Configurator for
+              this pin. This setting controls whether or not input voltage
+              clamping should be enabled.
+
+          microchip,ibufmd:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              Reflects the "IBUFMD" bits in the MSS Configurator output files
+              for this pin.
+
+        required:
+          - pins
+          - function
+          - power-source
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@204 {
+      compatible = "microchip,mpfs-pinctrl-mssio";
+      reg = <0x204 0x7c>;
+
+      ikrd-spi1-cfg {
+        spi1-pins {
+          pins = <30>, <31>, <32>, <33>;
+          function = "spi";
+          bias-pull-up;
+          drive-strength = <8>;
+          power-source = <3300000>;
+          microchip,ibufmd = <0x1>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 39987f722411..44e4a50c3155 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -42,6 +42,10 @@ properties:
     type: object
     $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
 
+  pinctrl@204:
+    type: object
+    $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
+
 required:
   - compatible
   - reg
-- 
2.51.0


