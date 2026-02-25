Return-Path: <linux-gpio+bounces-32181-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCAgMQkvn2lXZQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32181-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:19:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834B19B6CC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 18:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657AC31835F6
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00853E95BC;
	Wed, 25 Feb 2026 17:16:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193A27B353
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039770; cv=none; b=Jbp/Bc4E0Mr5sNjt+qailQw/HFWn1fExT4ECy1DNF7LF4//ZSKWXhuYkino4Kc/5o1DXJgeDTsvW2NvvcrBoXVUdIzcMpR3NI8YjKXTg1ODrAy2s1xZPZMGTQK2OFnHowFRjWkTG2cAR80Ix7RA7YI0vRwAvRUeB2/f77nReTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039770; c=relaxed/simple;
	bh=GmrTOcduYFWztbDipH18KMisBevU22vGehlPtTcg9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PB450wUSSG4kYqwDsD/oiodmaQFmpkuixTMcBcTqF9tyZiHvwshqckZffOR1lJdNhlK1i0zxj1/jSyBZhAFQHfSkdchkFCJUHE1O10ipXE8E/D+Nmew3qDYO10nhtKRQBqu3Bl9d3BSsh+uafXbGegCCTReTdQk9sq9xRwNhiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-0003CC-S2; Wed, 25 Feb 2026 18:15:47 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUD-002b86-2l;
	Wed, 25 Feb 2026 18:15:47 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vvIUF-00000008JEa-0IrA;
	Wed, 25 Feb 2026 18:15:47 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	David Jander <david@protonic.nl>
Subject: [PATCH v1 7/8] dt-bindings: mux: add NXP MC33978/MC34978 AMUX
Date: Wed, 25 Feb 2026 18:15:40 +0100
Message-ID: <20260225171545.1980385-8-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225171545.1980385-1-o.rempel@pengutronix.de>
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32181-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,pengutronix.de:mid,pengutronix.de:email,protonic.nl:email]
X-Rspamd-Queue-Id: 6834B19B6CC
X-Rspamd-Action: no action

Add device tree binding documentation for the Analog Multiplexer (AMUX)
block of the NXP MC33978/MC34978 Multiple Switch Detection Interface
(MSDI).

The AMUX acts as a 24-to-1 router, allowing an external SoC ADC to
sample the analog voltage of any of the 22 mechanical switch inputs, the
internal silicon temperature diode, or the main battery supply (VBATP).

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 11 ++++
 .../bindings/mux/nxp,mc33978-mux.yaml         | 55 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml

diff --git a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
index 58fcfe24d415..f86f72cfe230 100644
--- a/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
+++ b/Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
@@ -64,6 +64,12 @@ properties:
     description: |
       Hardware monitoring child node for fault detection.
 
+  mux-controller:
+    type: object
+    $ref: /schemas/mux/nxp,mc33978-mux.yaml#
+    description: |
+      Analog multiplexer (AMUX) controller child node.
+
 required:
   - compatible
   - reg
@@ -104,5 +110,10 @@ examples:
             hwmon {
                 compatible = "nxp,mc33978-hwmon";
             };
+
+            mux-controller {
+                compatible = "nxp,mc33978-mux";
+                #mux-control-cells = <0>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml b/Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml
new file mode 100644
index 000000000000..ccb8efb91d8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/nxp,mc33978-mux.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/nxp,mc33978-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MC33978/MC34978 Analog Multiplexer
+
+maintainers:
+  - David Jander <david@protonic.nl>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description: |
+  The MC33978 and MC34978 include a 24-to-1 analog multiplexer (AMUX) that
+  routes one of the following signals to an external AMUX pin for measurement
+  by an external ADC:
+
+  - Channels 0-13: SG0-SG13 switch input voltages
+  - Channels 14-21: SP0-SP7 switch input voltages
+  - Channel 22: Internal temperature diode
+  - Channel 23: Battery voltage (VBATP)
+
+  The AMUX requires a settling time of up to 200 us for full-scale voltage
+  steps. Consumers (e.g., io-channel-mux) must configure this delay.
+
+properties:
+  compatible:
+    enum:
+      - nxp,mc33978-mux
+      - nxp,mc34978-mux
+
+  '#mux-control-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#mux-control-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    amux: mux-controller {
+        compatible = "nxp,mc33978-mux";
+        #mux-control-cells = <0>;
+    };
+
+    iio-mux {
+        compatible = "io-channel-mux";
+        io-channels = <&adc 0>;
+        io-channel-names = "parent";
+        mux-controls = <&amux>;
+        settle-time-us = <200>;
+        channels = "sg0", "sg1", "sg2"; /* ... */
+    };
-- 
2.47.3


