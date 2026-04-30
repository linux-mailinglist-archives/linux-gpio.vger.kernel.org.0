Return-Path: <linux-gpio+bounces-35913-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF06OMBJ82ngzAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35913-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:23:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA794A2B89
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 14:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 149213022ABB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F8840243D;
	Thu, 30 Apr 2026 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="L85jSuK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA540244A;
	Thu, 30 Apr 2026 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551328; cv=none; b=kbJ2aM/r94xJ81MufNhSooLOA5IvBeJnuYBKy4nYC5+TSat6AqIECobT/JTIpGuVVpTqO+cRALKros5mytRE8sJJwnMsZqO8mHfkvK42bCWsuumI8VJvMDidxT5asLFGWUbq3ARQjkDLz3OiRXRyvbmzujtZ9PRlc7Z9ydWmhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551328; c=relaxed/simple;
	bh=xqjrKxIhoVoSvoD2OCLKb4VkGwETJ3IuLSonDXnBfKA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ej3qk0oZ+W8NdvATI3uu6L2dUQr9lplJgZpfMlcsDa5uG50Xs7YVS+xr+dGYpJ6oY5ZEV273wlAVuU3MZvoeHOHF1V0ZFEnJhASUpfY7zlvVMSmcIru2ccEVLZ8ZlIjMJhO/5LBEMMMfJ8e2Mpk8PeyJg8JJqZpp3xYaD8uBMa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=L85jSuK3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63UCE6Ju81958384, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1777551247;
	bh=xQiUFbL927REFpXPP+Oig6c2w+RJXznB51XY0qpfYXw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=L85jSuK3szOkmUGzom2gD+TEWI2z+7QkCF8/zhW3KnePYXwhc+fgpUys9C7BZQElK
	 vbPpTNMdGdpl9mrdIwmbAu4VHY9TKileC/YyzNVHfhKrKUknQBqd1GIGKeKQFYgODE
	 7S+N9fAyrk7gQfR2CHJo3Jd5/sP5HLpgoQyJjxfVOAY5QbXLZaVPhFBZ0LjHpAuLBx
	 DLKClQzBJqrGTBt+smr4yaiW/PAU7lMoND5VzieBdQTIVrK0F8gS/CIWQTktMPie++
	 sA27Qv03v3ny4/CbubuWeGbocCoMmpqosCdyLHo+B+FDwRQdsvwjNRfFCShQpNAu8M
	 SSalvQzrUUMLw==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 63UCE6Ju81958384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Apr 2026 20:14:07 +0800
Received: from A106071510.realsil.com.cn (172.29.42.211) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 30 Apr 2026 20:14:06 +0800
From: <zain_zhou@realsil.com.cn>
To: <linux-staging@lists.linux.dev>, <linux-i3c@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <alexandre.belloni@bootlin.com>,
        <Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linusw@kernel.org>, <brgl@kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        zain_zhou
	<zain_zhou@realsil.com.cn>
Subject: [PATCH 1/2] dt-bindings: i3c: add binding for Realtek RTS490x I3C HUB
Date: Thu, 30 Apr 2026 20:13:53 +0800
Message-ID: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
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
X-Rspamd-Queue-Id: 1EA794A2B89
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35913-lists,linux-gpio=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[realsil.com.cn:s=dkim];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[realsil.com.cn,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zain_zhou@realsil.com.cn,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[realsil.com.cn:+];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.661];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Spam: Yes

From: zain_zhou <zain_zhou@realsil.com.cn>

Add DT binding schema for Realtek RTS490x series I3C HUB devices.

The binding describes configuration properties for:
  - LDO enable/disable and voltage level per port group
  - Pull-up resistance per port group
  - IO driver strength per port
  - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
    IO mode, SMBus clock frequency and polling interval
  - Hub network always-I3C mode
  - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)

Signed-off-by: zain_zhou <zain_zhou@realsil.com.cn>
---
 .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 410 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 416 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
new file mode 100644
index 000000000000..30295eefee89
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
@@ -0,0 +1,410 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I3C HUB
+
+maintainers:
+  - zain_zhou <zain_zhou@realsil.com.cn>
+
+description: |
+  I3C HUB is smart device which provides multiple functionality:
+  * enabling voltage compatibility across I3C Controller and Target devices,
+  * bus capacitance isolation
+  * address conflict isolation
+  * I3C port expansion
+  * two controllers in a single I3C bus
+  * I3C and SMBus device compatibility
+  * GPIO expansion
+
+  Having such big number of features, there is a need to have some DT knobs to tell the I3C HUB
+  driver which features shall be enabled and how they shall be configured. I3C HUB driver read,
+  validate DT knobs and set corresponding registers with the right way to satisfy user requests from
+  DT.
+
+  All the DT properties for I3C HUB are located under dedicated (for I3C HUB) DT entry. I3C HUB DT
+  entry structure is aligned with regular I3C device DT entry described in i3c.yaml.
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  $nodename:
+    pattern: "^hub@0,0$"
+
+  cp0-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Controller Port 0 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  cp1-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Controller Port 1 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  tp0145-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Target Ports 0/1/4/5 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  tp2367-ldo-en:
+    enum:
+      - disabled
+      - enabled
+    description: |
+      I3C HUB Target Ports 2/3/6/7 LDO disabling/enabling setting. If enabled, voltage produced by
+      on-die LDO will be available externally on dedicated pin. This option could be used to supply
+      external pull-up resistors or for any other purpose which does not cross LDO capabilities.
+
+      This property is optional. If not provided, LDO will be disabled.
+
+  cp0-ldo-volt:
+    enum:
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Controller Port 0 LDO setting to control the Controller Port 1 voltage level. This
+      property is optional.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  cp1-ldo-volt:
+    enum:
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Controller Port 1 LDO setting to control the Controller Port 1 voltage level. This
+      property is optional.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  tp0145-ldo-volt:
+    enum:
+      - disabled
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Target Ports 0/1/4/5 LDO setting to control the Target Ports 0/1/4/5 voltage level.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  tp2367-ldo-volt:
+    enum:
+      - disabled
+      - 1.0V
+      - 1.1V
+      - 1.2V
+      - 1.8V
+    description: |
+      I3C HUB Target Ports 2/3/6/7 LDO setting to control the Target Ports 2/3/6/7 voltage level.
+
+      If not provided, LDO configuration is not modified in I3C HUB.
+
+  tp0145-pullup:
+    enum:
+      - disabled
+      - 250R
+      - 500R
+      - 1k
+      - 2k
+    description: |
+      I3C HUB Target Ports 0/1/4/5 pull-up setting to control the Target Ports 0/1/4/5 pull-up
+      resistance level.
+
+      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
+
+  tp2367-pullup:
+    enum:
+      - disabled
+      - 250R
+      - 500R
+      - 1k
+      - 2k
+    description: |
+      I3C HUB Target Ports 2/3/6/7 pull-up setting to control the Target Ports 2/3/6/7 pull-up
+      resistance level.
+
+      This property is optional. If not provided, pull-up configuration is not modified in I3C HUB.
+
+  cp0-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Controller Port 0 IO strength setting to control the Controller Port 0 output driver
+      strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  cp1-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Controller Port 1 IO strength setting to control the Controller Port 1 output driver
+      strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  tp0145-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Target Ports 0/1/4/5 IO strength setting to control the Target Ports 0/1/4/5 output
+      driver strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  tp2367-io-strength:
+    enum:
+      - 20Ohms
+      - 30Ohms
+      - 40Ohms
+      - 50Ohms
+    description: |
+      I3C HUB Target Ports 2/3/6/7 IO strength setting to control the Target Ports 2/3/6/7 output
+      driver strength.
+
+      This property is optional. If not provided, IO strength configuration is not modified in I3C
+      HUB.
+
+  id:
+    enum:
+      - 0
+      - 1
+      - 3
+    description: |
+      I3C HUB ID based on CSEL pin. There are three possible values:
+      0 - CP0 is selected as primary Controller Port
+      1 - Primary Controller Port is selected by software by writing the REG#56
+      3 - CP1 is selected as primary Controller Port
+
+      I3C HUB driver reads CSEL pin status (REG#121[5:4]) and tries to find DT node with matching
+      value in 'id' property.
+
+      This property is optional. If not provided, DT node can only be used by the I3C HUB driver if
+      there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes with no
+      'id' property - the first one will be chosen by I3C HUB driver. If there is a multiple DT
+      nodes with matching 'id' property - the first one will be chosen by I3C HUB driver.
+
+      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
+      read from I3C HUB.
+
+  id-cp1:
+    enum:
+      - 0
+      - 1
+      - 2
+      - 3
+    description: |
+      I3C HUB ID based on CP1 SDA and SCL pins state probed during power on.
+
+      I3C HUB driver reads CP1 SDA and SCL pin status and tries to find DT node with matching value
+      in 'id-cp1' property.
+
+      This property is optional. If not provided, DT node can only be used by the I3C HUB
+      driver if there is no others with matching 'id' or 'id-cp1'. If there is a multiple DT nodes
+      with no 'id-cp1' property - the first one will be chosen by I3C HUB driver. If there is a
+      multiple DT nodes with matching 'id-cp1' property - the first one will be chosen by I3C HUB
+      driver.
+
+      If both 'id' and 'id-cp1' are available, DT node will chosen only when both values match those
+      read from I3C HUB.
+
+patternProperties:
+  "@[0-9]$":
+    type: object
+    description: |
+      I3C HUB Target Port child, should be named: target-port@<target-port-id>
+
+    properties:
+      mode:
+        enum:
+          - disabled
+          - i3c
+          - smbus
+          - gpio
+        description: |
+          I3C HUB Target Port mode setting to control Target Port functionality.
+
+          This property is optional. If not provided, Target Port mode configuration is not modified
+          in I3C HUB.
+
+      pullup:
+        enum:
+          - disabled
+          - enabled
+        description: |
+          I3C HUB Target Port pull-up setting to disable/enable Target Port pull-up.
+
+          This property is optional. If not provided, Target Port pull-up configuration is not
+          modified in I3C HUB.
+
+      always-enable:
+        type: boolean
+        description: |
+          I3C HUB Target Port settings to control the port enable/disable policy.
+
+          This property is optional. If not provided, Target Port is enabled only on accessing to
+          the devices connected to it and the port is disabled automatically after the accessing
+          is done. If provided, the Target Port is always enabled.
+
+      polling-interval-ms:
+        type: uint32
+        description: |
+          I3C HUB Target Port SMBus polling interval in milliseconds.
+
+          This property is optional. If not provided or set to 0, polling is disabled and the driver
+          uses IBI (In-Band Interrupts). If provided with a positive value, polling is enabled for
+          this Target Port with the given period.Note: this positive value only affects the SMBus
+          target agent polling. The SMBus controller agent polling interval is computed dynamically
+          from clock and data length.
+
+      clock-frequency:
+        type: uint32
+        enum:
+          - 100000
+          - 200000
+          - 400000
+          - 1000000
+        description: |
+          I3C HUB Target Port SMBus clock frequency in Hz.
+
+          This property follows the standard I2C 'clock-frequency' semantics.
+          Applies only when the Target Port mode is set to "smbus".
+          Optional; if not provided, the driver uses 400000 Hz by default.
+
+additionalProperties: true
+
+examples:
+  - |
+    i3c-master@d040000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hub@0,0 {
+        cp0-ldo-en = "disabled";
+        cp1-ldo-en = "enabled";
+        cp0-ldo-volt = "1.0V";
+        cp1-ldo-volt = "1.1V";
+        tp0145-ldo-en = "enabled";
+        tp2367-ldo-en = "disabled";
+        tp0145-ldo-volt = "1.2V";
+        tp2367-ldo-volt = "1.8V";
+        tp0145-pullup = "2k";
+        tp2367-pullup = "500R";
+        tp0145-io-strength = "50Ohms";
+        tp2367-io-strength = "30Ohms";
+        cp0-io-strength = "20Ohms";
+        cp1-io-strength = "40Ohms";
+
+        target-port@0 {
+          mode = "i3c";
+          pullup = "enabled";
+          always_enable;
+        };
+        target-port@1 {
+          mode = "smbus";
+          pullup = "enabled";
+          clock-frequency = <1000000>;
+          polling-interval-ms = <10>;
+          backend@10{
+              compatible = "i2c-slave-mqueue";
+              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+          };
+        };
+        target-port@2 {
+          mode = "gpio";
+          pullup = "disabled";
+        };
+        target-port@3 {
+          mode = "disabled";
+          pullup = "disabled";
+        };
+      };
+    };
+
+  - |
+    i3c-master@d040000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hub@70,3C000000100 {
+        reg = <0x70 0x3C0 0x00000100>;
+        assigned-address = <0x70>;
+        dcr = <0xC2>;
+
+        cp0-ldo-en = "disabled";
+        cp1-ldo-en = "enabled";
+        cp0-ldo-volt = "1.0V";
+        cp1-ldo-volt = "1.1V";
+        tp0145-ldo-en = "enabled";
+        tp2367-ldo-en = "disabled";
+        tp0145-ldo-volt = "1.2V";
+        tp2367-ldo-volt = "1.8V";
+        tp0145-pullup = "2k";
+        tp2367-pullup = "500R";
+        tp0145-io-strength = "50Ohms";
+        tp2367-io-strength = "30Ohms";
+        cp0-io-strength = "20Ohms";
+        cp1-io-strength = "40Ohms";
+
+        target-port@0 {
+          mode = "i3c";
+          pullup = "enabled";
+          always-enable;
+        };
+        target-port@1 {
+          mode = "smbus";
+          pullup = "enabled";
+          backend@12{
+              compatible = "i2c-slave-mqueue";
+              reg = <(0x12 | I2C_OWN_SLAVE_ADDRESS)>;
+          };
+        };
+        target-port@2 {
+          mode = "gpio";
+          pullup = "disabled";
+        };
+        target-port@3 {
+          mode = "disabled";
+          pullup = "disabled";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..71ee5071ac0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12214,6 +12214,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 F:	drivers/i3c/master/renesas-i3c.c
 
+I3C HUB DRIVER FOR REALTEK RTS490X
+M:	zain_zhou <zain_zhou@realsil.com.cn>
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
+F:	drivers/staging/rts490x/
+
 I3C DRIVER FOR SYNOPSYS DESIGNWARE
 S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
-- 
2.34.1


