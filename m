Return-Path: <linux-gpio+bounces-37457-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBCqGg5GFGpTLwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37457-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:52:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA085CAB87
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 14:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB8593007498
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 12:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A87382F2D;
	Mon, 25 May 2026 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="pyht0Q78"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A53815FA;
	Mon, 25 May 2026 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713545; cv=none; b=hMAyRtKXLVKbNG+OPjDmwZWE8EtVL5l65jq0SK2lzI5/ACBA14vdYZcPnWNIfTsg12Ua2PccbyQIpdJAOfb4RlMNHXn6xdpSfk05kQgaIhZ0quo0W0xkC9/cwE2X7ZoyIEBiNuVUhkgg7R/cPfrjGgkPBE1/O6Fr0ngv7iBUHjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713545; c=relaxed/simple;
	bh=6ia9If4p5ELlMHzXcCL2ncMHZvn8D2QDM9egXntQjxk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eSQxk7Mqs40kDg475Cf19YTRFvRQBTGFjAQH6zP0rvvWpRODNaU8Ga5wSBEzkPASuZarJgdLheVK7P78mNU+b9pXmR/7kEptlJalgP0/uB0lE6rovvaLrSboEqvX75uiIFjSB1d9v3xHYg9+PiHGWTmfpgZoq4gmcbAvZNAV11o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=pyht0Q78; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PCpesuF1058787, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779713501;
	bh=HhuAfq0KrjWR2hOdUgLXv8apqAQKmXIb959Lev66uvE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=pyht0Q78EiaIC6iJIjqw82xk6qOYzBBQYM1XQgHw4FnU3QBcLkHQGXM4hXj3Rx63s
	 IINYyHVdMcJNimOgpi3to4fXBSum/VRH93zi9EtpnYNYJBF40jPMvbiweQ0rZ4Eo/w
	 QBZfkrbY3wWeiflA+lM0Ers2RKoP7CJVFsykn+1uFZR9WRXd595i3k3lZo3SUbxGFU
	 +KwzzS4eJBY6CjR3+V6cfLALLRribH1ZM1DkZL0QwGV8OCtlZz3fkONBqJ68dLjs1k
	 o1HiD2Q/qcGxZSHcHLNOo7jjVUMXox/lDShLWF/EWPoCqGPRwAEJHAPXfgziUj0dui
	 0ZcCgbLVRM9Ng==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PCpesuF1058787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 20:51:41 +0800
Received: from A106071510.realsil.com.cn (172.29.42.211) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:51:40 +0800
From: <zain_zhou@realsil.com.cn>
To: <linux-staging@lists.linux.dev>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linusw@kernel.org>, <brgl@kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<wei_wang@realsil.com.cn>, Yin Zhou <zain_zhou@realsil.com.cn>
Subject: [PATCH v2 1/2] dt-bindings: i3c: add Realtek RTS490x I3C HUB
Date: Mon, 25 May 2026 20:51:27 +0800
Message-ID: <20260525125128.297-1-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realsil.com.cn,none];
	R_DKIM_ALLOW(-0.20)[realsil.com.cn:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37457-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[realsil.com.cn:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zain_zhou@realsil.com.cn,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.70:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 9BA085CAB87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yin Zhou <zain_zhou@realsil.com.cn>

Add DT binding schema for Realtek RTS490x series I3C HUB devices.

The binding describes configuration properties for:
  - LDO enable/disable and voltage level per port group
  - Pull-up resistance per port group
  - IO driver strength per port
  - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
    IO mode, SMBus clock frequency and polling interval
  - Hub network always-I3C mode
  - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)

Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>

Changes in v2:
- Rework binding per Krzysztof Kozlowski's review:
  add realtek, vendor prefix to all custom properties; use boolean
  for enable flags; use u32 with unit suffixes (-microvolt, -ohms)
  for voltage/resistance; change to unevaluatedProperties: false;
  fix title, maintainer name, description, $nodename pattern
- Consolidate examples; add dt-bindings/i2c/i2c.h include
---
 .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 263 ++++++++++++++++++
 1 file changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
new file mode 100644
index 000000000000..851a433abcd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
@@ -0,0 +1,263 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTS490x I3C HUB
+
+maintainers:
+  - Yin Zhou <zain_zhou@realsil.com.cn>
+
+description:
+  The Realtek RTS490x is an I3C HUB device that provides voltage level
+  translation between I3C controller and target devices, bus capacitance
+  isolation, address conflict isolation, I3C port expansion (up to 8
+  target ports), simultaneous dual-controller port support, and per-port
+  mode selection (I3C, SMBus, GPIO, or disabled).
+
+properties:
+  $nodename:
+    pattern: "^hub@[0-9a-f]+(,[0-9a-f]+)*$"
+
+  compatible:
+    const: realtek,rts490x-i3c-hub
+
+  reg:
+    maxItems: 1
+    description:
+      Encodes the static I2C address, manufacturer ID, and part/instance ID
+      as defined by the I3C specification.
+
+  assigned-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x1
+    maximum: 0xff
+    description:
+      Dynamic I3C address to assign to this device.
+
+  dcr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Device Characteristic Register value of the hub.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  realtek,cp0-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Controller Port 0.
+
+  realtek,cp1-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Controller Port 1.
+
+  realtek,tp0145-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Target Ports 0/1/4/5.
+
+  realtek,tp2367-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Target Ports 2/3/6/7.
+
+  realtek,cp0-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Controller Port 0 on-die LDO, in microvolts.
+
+  realtek,cp1-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Controller Port 1 on-die LDO, in microvolts.
+
+  realtek,tp0145-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Target Ports 0/1/4/5 on-die LDO, in
+      microvolts.
+
+  realtek,tp2367-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Target Ports 2/3/6/7 on-die LDO, in
+      microvolts.
+
+  realtek,tp0145-pullup-ohms:
+    enum: [0, 250, 500, 1000, 2000]
+    description:
+      Pull-up resistance for Target Ports 0/1/4/5, in ohms. 0 disables
+      the pull-up.
+
+  realtek,tp2367-pullup-ohms:
+    enum: [0, 250, 500, 1000, 2000]
+    description:
+      Pull-up resistance for Target Ports 2/3/6/7, in ohms. 0 disables
+      the pull-up.
+
+  realtek,cp0-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Controller Port 0, in ohms.
+
+  realtek,cp1-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Controller Port 1, in ohms.
+
+  realtek,tp0145-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Target Ports 0/1/4/5, in ohms.
+
+  realtek,tp2367-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Target Ports 2/3/6/7, in ohms.
+
+  realtek,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 3]
+    description: |
+      I3C HUB hardware ID based on CSEL pin state. Values:
+        0 - CP0 is selected as primary Controller Port
+        1 - Primary Controller Port selected by software
+        3 - CP1 is selected as primary Controller Port
+
+  realtek,id-cp1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description:
+      I3C HUB hardware ID based on CP1 SDA and SCL pin state probed
+      during power-on.
+
+patternProperties:
+  "^target-port@[0-9]+$":
+    type: object
+    description:
+      I3C HUB target port child node, named target-port@<id>.
+
+    properties:
+      compatible:
+        const: realtek,rts490x-i3c-hub-port
+
+      reg:
+        maxItems: 1
+        description:
+          Target port index (0-based).
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      realtek,mode:
+        enum: [disabled, i3c, smbus, gpio]
+        description:
+          Operating mode of this target port.
+
+      realtek,pullup-enable:
+        type: boolean
+        description:
+          When present, enables the pull-up for this target port.
+
+      realtek,always-enable:
+        type: boolean
+        description:
+          When present, the target port is always enabled. Otherwise
+          the port is enabled on demand and disabled after use.
+
+      realtek,polling-interval-ms:
+        minimum: 0
+        description:
+          SMBus polling interval in milliseconds. If absent or 0,
+          polling is disabled and IBI is used instead.
+
+      clock-frequency:
+        enum: [100000, 200000, 400000, 1000000]
+        description:
+          SMBus clock frequency in Hz. Applies only when mode is smbus.
+          Defaults to 400000 if absent.
+
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/i2c/i2c.h>
+    i3c-master@d040000 {
+      reg = <0xd040000 0x1000>;
+      #address-cells = <3>;
+      #size-cells = <0>;
+
+      hub@70,4ba00000000 {
+        compatible = "realtek,rts490x-i3c-hub";
+        reg = <0x70 0x4ba 0x00000000>;
+        assigned-address = <0x70>;
+        dcr = <0xc2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        realtek,cp0-ldo-enable;
+        realtek,cp1-ldo-enable;
+        realtek,cp0-ldo-microvolt = <1000000>;
+        realtek,cp1-ldo-microvolt = <1100000>;
+        realtek,tp0145-ldo-enable;
+        realtek,tp0145-ldo-microvolt = <1200000>;
+        realtek,tp2367-ldo-microvolt = <1800000>;
+        realtek,tp0145-pullup-ohms = <2000>;
+        realtek,tp2367-pullup-ohms = <500>;
+        realtek,tp0145-io-strength-ohms = <50>;
+        realtek,tp2367-io-strength-ohms = <30>;
+        realtek,cp0-io-strength-ohms = <20>;
+        realtek,cp1-io-strength-ohms = <40>;
+
+        target-port@0 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <0>;
+          realtek,mode = "i3c";
+          realtek,pullup-enable;
+          realtek,always-enable;
+        };
+
+        target-port@1 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <1>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          realtek,mode = "smbus";
+          realtek,pullup-enable;
+          clock-frequency = <1000000>;
+          realtek,polling-interval-ms = <10>;
+
+          i2c@10 {
+            compatible = "i2c-slave-mqueue";
+            reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+          };
+        };
+
+        target-port@2 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <2>;
+          realtek,mode = "gpio";
+        };
+
+        target-port@3 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <3>;
+          realtek,mode = "disabled";
+        };
+      };
+    };
-- 
2.34.1


