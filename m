Return-Path: <linux-gpio+bounces-32378-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL4QO+VdpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32378-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:52:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AC1D5CB1
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FE283033E7D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F393921D7;
	Mon,  2 Mar 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="XiZh7izZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB938F64C;
	Mon,  2 Mar 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445124; cv=none; b=UNeYc/AM3V5JfsT8gwf4gaE+M/catbCeKXSByDCwrN+GvvaO29I7CIQaUaPLgGN+ngPpLN7f6l0Fuano0KY7NPhzmlf9tbQ/BVR1/zkH5Lp4+++8GXvqWyOcMALolnknpQUW4EJLpcOwd86M7yV5ZhLiWweFUl3rRErCTBIMmCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445124; c=relaxed/simple;
	bh=54CKlhaOPNyQV4l1L+/FS8dCZ2hcFRQOOLmoyaR1aos=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=HMNLOF3dYlO0dr3niowiM7GYJflYg6FaOLqbI+Nh3lnuCrGOR0RhdT7QfcOqpXh/RfQX7hs+C14xWSROhrEGyo3/CzuofzfoqgzNJ1jsDLG0R8nIs571glmWfRGTXVXGW7CtJzz3BSfiP+FB4pl87KyK8DjfMPzclKII2Itta/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=XiZh7izZ; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772445111; bh=NuKkS34/BEUrewmcH4JWOJIvDqT8yKVer2O9MIQKHpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XiZh7izZdVacMEAhDxMRYaCkuzOpt3CMBk1v/DnoUMG9dykVR8DS95MrN9yyADJi/
	 drnPKeuf7HU4YiMBuAZW4cuI3bmWRLwia+0ALYeOu7QN3jYftAI1I5uRrQ0/Mex3I1
	 sS9IsWnruIohFguO7v2o+/EV3k+hGbD9jCXwNECk=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id CEF2F43C; Mon, 02 Mar 2026 17:51:47 +0800
X-QQ-mid: xmsmtpt1772445109t9ekbm482
Message-ID: <tencent_0BC92A632DD26F0A684E608D427244637905@qq.com>
X-QQ-XMAILINFO: NbQQcgWGJXDNNA701IJMmyjMcV1emRT5aWfrC+Dn9I7PQ8FohLHp5/S7B2R8VS
	 p9u45b7eEXDo8c6LUwR/IHk+FNDWscHirOU21554xfQ3TrPEoG90eQkpNBof6lfdUa69vBmuvF+y
	 obLgMp1eJSV5ZMuabyZTkATVuHwO9Ml2pHzfex4oZUOnDvMyIHEFkC6z1AQGcZk3wxpLPc7of7/Q
	 p7/++yih/bTk8doKASLBDqauIOU9xaygVFKrYuesJ5ufygDdl2izES+CW69tkWE8mEyqNq32DSeK
	 7r6idMQXwJZEIwRxVYNJFPbsz2vneeCAsdiTWZJ1cF213uMCFyAWJNRNvniDxy3aBO83eNA4dReT
	 2uvE7qLNYWugeCAjlnoBMfdGt4GGAfu/TnGgoE8FAKpvGAlG2Y5lbqVf53mfklfKQDNEpczZOq4V
	 16ofil0s+tBV6FtaEcnh70JPqKXEQCt5dbRxTH1jEGyffj1JNHjxMH1VLTW40H54zD1gObTktiTB
	 bCIU5FB1xggeP3hF5lfw0D6gACqbbgNmZ7OC34d0IobfFE3b1w+XT9TfROSpoTRQbYt8aJn+djay
	 62jDPirb0raARQqX3nxdQb2T9qfjyv3i62SgYuZofwMqAMfI3Vea4g2gvh6OHCT8LF4Sc8L4NUAx
	 LLLvXEVoGGh386KMqE8AgvYxGPExcD8UhM/WdQ5yU2ugXkK65Ra1zsvPupCaiF1plD81Te12fV9T
	 0NHDN6XQThQZEJt+n+Kpsj2se+MaWaUORSBV6PfgW+Bu2JUo2lHDXDRMLzrUYH+j3g5E8s9t2LZ+
	 Y1Fha9nHN7M31kAX0BFMn5GrzrcbVxFLEBKfw2AcUIgy2f92k9c5D8UFkmQvqyXIYmBLqramtII4
	 kjpwglmE06AVqx20F75r59KCDBUuhRU2cwyrtOKc645iAFKnVZ7cpeHolc3lJ+i1YHL179I5uEeD
	 tDQ7HjbtdbLi4H5VdSYMqwDh3zOoUvbkAE04/A88E5WfaWd61acCiw8JI5v5A0SB2yssI03bVzKt
	 hye/QJjcUg9OUC5Ma/GRB3Uuqka6NxXMKu56te77kRVkgcmROc03WYFcIDMhXlLAvmK11nAzqBWz
	 EkAFHbiyFYxU8R6x2CMvvFosm49w==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 1/3] dt-bindings: gpio: add Phytium GPIO controller
Date: Mon,  2 Mar 2026 17:51:45 +0800
X-OQ-MSGID: <20260302095147.2483-2-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302095147.2483-1-1536943441@qq.com>
References: <20260302095147.2483-1-1536943441@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,bgdev.pl,kernel.org,phytium.com.cn,qq.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32378-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email,1.171.78.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytium.com.cn:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:mid,qq.com:dkim,qq.com:email]
X-Rspamd-Queue-Id: A31AC1D5CB1
X-Rspamd-Action: no action

Add the devicetree binding schema for the Phytium platform GPIO
controller.

Register the "phytium" vendor prefix used by the compatible string.

Use ngpios as the preferred child-node property and keep nr-gpios as
deprecated for compatibility with existing firmware descriptions.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 .../bindings/gpio/phytium,gpio.yaml           | 134 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 2 files changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/phytium,gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/phytium,gpio.yaml b/Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
new file mode 100644
index 000000000..1b9200c57
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/phytium,gpio.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/phytium,gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Phytium GPIO controller
+
+description: |
+  Phytium GPIO controllers expose one GPIO/interrupt controller and up to
+  two configurable ports. Child nodes describe per-port configuration.
+
+maintainers:
+  - Chen Baozi <chenbaozi@phytium.com.cn>
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    const: phytium,gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    description: |
+      The interrupts to the parent controller raised when GPIOs generate
+      the interrupts. If the controller provides one combined interrupt
+      for all GPIOs, specify a single interrupt. If the controller provides
+      one interrupt for each GPIO, provide a list of interrupts that
+      correspond to each of the GPIO pins.
+    minItems: 1
+    maxItems: 32
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+patternProperties:
+  "^gpio-port@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: phytium,gpio-port
+
+      reg:
+        maxItems: 1
+
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      ngpios:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: The number of GPIO pins exported by the port.
+        default: 32
+        minimum: 1
+        maximum: 32
+
+      nr-gpios:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: The number of GPIO pins exported by the port.
+        deprecated: true
+        default: 32
+        minimum: 1
+        maximum: 32
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - '#gpio-cells'
+
+    additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio: gpio@28004000 {
+      compatible = "phytium,gpio";
+      reg = <0x28004000 0x1000>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      porta: gpio-port@0 {
+        compatible = "phytium,gpio-port";
+        reg = <0>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <8>;
+      };
+
+      portb: gpio-port@1 {
+        compatible = "phytium,gpio-port";
+        reg = <1>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <8>;
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe..2c3f9777d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1265,6 +1265,8 @@ patternProperties:
     description: PHICOMM Co., Ltd.
   "^phontech,.*":
     description: Phontech
+  "^phytium,.*":
+    description: Phytium Technology Co., Ltd.
   "^phytec,.*":
     description: PHYTEC Messtechnik GmbH
   "^picochip,.*":
-- 
2.34.1


