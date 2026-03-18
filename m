Return-Path: <linux-gpio+bounces-33732-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB4LMK6IumnSXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33732-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:12:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658512BA962
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C0A430A516A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DA53CEBA8;
	Wed, 18 Mar 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE6CGxWA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327543BA25E;
	Wed, 18 Mar 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831895; cv=none; b=e9oG5dTZRRdvqVgiERDgsJTKrbkR8zULfHEKQxDNqZTJfOhQFD+IP1oEkz4TLtHCckrwZU7kH3LAl7OebaI69dmSd43KQhX5Tw3zSvpB4KxRKpAq3ybXpS9Wsz0sMPQstGdLSSudZXPQ2qc/Q0co4ur/zSQ8K3d3Myo6FU5/EK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831895; c=relaxed/simple;
	bh=ibJRUfU6Xesj/AT2j6L/6W1DSm2j7eke+aFZWYsow44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCdW296zngtKXwhl3jkoBn1Q/Z2fM7oPDKuOgNtYvJVQatK2Q0X1PwYjfVCZK6E83aVIyv7hTVmeOpUdtAk/JqJLomszuYF3lid49p2BNaOGf/bnE18Vl7N20qQYFUuPh6HLlCIKv74zN2cnW48Q61EqQM28NtIViBa1xtaYfr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE6CGxWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE94EC2BCB2;
	Wed, 18 Mar 2026 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831895;
	bh=ibJRUfU6Xesj/AT2j6L/6W1DSm2j7eke+aFZWYsow44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AE6CGxWAqqRddKzIADfVMNULZCMiiBRbWbH1TRAB72+eDae3Tjshb5lF84r1ve3L8
	 Rceh/CLEvfe+LcHy37DpwZPIMGx0aCtEdhzjC3KO2vU7N7iWvHotD7YCheDfzB6vNY
	 jnoqQS6uwC8tQMoZa5YIwbT//JM1/DUP22W/Fi1mBRu9xjSL+CICLDzmcFkaaGsKNH
	 PsYeDvSAIwBzZpOI3KfKJhPX10nwEUYxe6N6wcXKdM8DjU9gYy32J1RVwEygB9VTXm
	 BswueGYxP6vDfyZqJ2tL6eU8/rQHseKTgw8KJ3Ve+HakH6AkSC1+7ccfjUeZFtrW1Y
	 JWLtHlLIPjmTg==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 3/5] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
Date: Wed, 18 Mar 2026 11:04:34 +0000
Message-ID: <20260318-whisking-steadily-91b2497f6fb9@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5607; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wBo9yWbFkmoIJWrjOw6aKTDA8JEfCYkbuuKymCWysYg=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o7Ynngv2unhERCW4Dexxzm+Odnv6PujL0Ic+wrTl oQaJWl3lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIbIxn+5wYWsZ7yntpjVOd1 f7Nv7Qqz+CNLEo6+Td914Z2Tl5jiPoY/nFs/pRvNPHZBbd6KebsOZC5sy3rcet5ywp9A6YALM8u EmAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33732-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.54:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.200:email,bootlin.com:email]
X-Rspamd-Queue-Id: 658512BA962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

On PolarFire SoC there are more GPIO interrupts than there are interrupt
lines available on the PLIC, and a runtime configurable mux is used to
decide which interrupts are assigned direct connections to the PLIC &
which are relegated to sharing a line.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-irqmux.yaml  | 103 ++++++++++++++++++
 .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
new file mode 100644
index 0000000000000..51164772724f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Polarfire SoC GPIO Interrupt Mux
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  There are 3 GPIO controllers on this SoC, of which:
+  - GPIO controller 0 has 14 GPIOs
+  - GPIO controller 1 has 24 GPIOs
+  - GPIO controller 2 has 32 GPIOs
+
+  All GPIOs are capable of generating interrupts, for a total of 70.
+  There are only 41 IRQs available however, so a configurable mux is used to
+  ensure all GPIOs can be used for interrupt generation.
+  38 of the 41 interrupts are in what the documentation calls "direct mode",
+  as they provide an exclusive connection from a GPIO to the PLIC.
+  Lines 18 to 23 on GPIO controller 1 are always in "direct mode".
+  The 3 remaining interrupts are used to mux the interrupts which do not have
+  a exclusive connection, one for each GPIO controller.
+
+properties:
+  compatible:
+    const: microchip,mpfs-irqmux
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-map-mask:
+    items:
+      - const: 0x7f
+
+  interrupt-map:
+    description: |
+      Specifies the mapping from GPIO interrupt lines to plic interrupts.
+
+      The child interrupt number set in arrays items is computed using the
+      following formula:
+          gpio_bank * 32 + gpio_number
+      with:
+        - gpio_bank: The GPIO bank number
+            - 0 for GPIO0,
+            - 1 for GPIO1,
+            - 2 for GPIO2
+        - gpio_number: Number of the gpio in the bank (0..31)
+    maxItems: 70
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#interrupt-cells"
+  - interrupt-map-mask
+  - interrupt-map
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@54 {
+        compatible = "microchip,mpfs-irqmux";
+        reg = <0x54 0x4>;
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0x7f>;
+        interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+                        <3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+                        <6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+                        <9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+                        <12 &plic 25>, <13 &plic 26>,
+
+                        <32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+                        <35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+                        <38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+                        <41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+                        <44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+                        <47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+                        <50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+                        <53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+                        <64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+                        <67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+                        <70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+                        <73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+                        <76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+                        <79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+                        <82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+                        <85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+                        <88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+                        <91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+                        <94 &plic 53>, <95 &plic 53>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
index 44e4a50c31554..276d48ba15f01 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
@@ -38,6 +38,10 @@ properties:
       of PolarFire clock/reset IDs.
     const: 1
 
+  interrupt-controller@54:
+    type: object
+    $ref: /schemas/soc/microchip/microchip,mpfs-irqmux.yaml
+
   pinctrl@200:
     type: object
     $ref: /schemas/pinctrl/microchip,mpfs-pinctrl-iomux0.yaml
-- 
2.51.0


