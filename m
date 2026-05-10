Return-Path: <linux-gpio+bounces-36497-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJECNkfPAGrZMwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36497-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 20:32:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A45505A82
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 20:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE29B3014523
	for <lists+linux-gpio@lfdr.de>; Sun, 10 May 2026 18:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DBE318ED6;
	Sun, 10 May 2026 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBb9AJAx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF2313273;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778437937; cv=none; b=k8mPgILYGRuzsUhQykBHm5DK+3Bu3Grb58CDCOOU3ESI7pTTEM16KNRDhDbEPY4R5/6Iwq8XD+cZRn/xLcifGdDIAkmqA//o2bdzlQskzV4AlsZdUd6lJ9akWYulIB0wuyqvKNrbIzFf0w4utaMPjLEYFV+AbRtEaVX5NL345IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778437937; c=relaxed/simple;
	bh=/PkzzLvSPOXiK3/ODiyuapfBuRKWWlFUuOhJ1kbzYrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCfnKt6AFqZG3YqzYC4+oX6Doje8QaWaRPtW9p29dPj1w0QsfBo5a4QDRy+rb1AGHmbzUmljlnpZangvpvKz6onledF8yGV1sfk1y235iIQyamqZtWtxErQl3HSBtO+cq1P01W4ff9TkWAm8f5QLekjpccpJ73GvrKZ4oSm2w5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBb9AJAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6053BC2BCFC;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778437937;
	bh=/PkzzLvSPOXiK3/ODiyuapfBuRKWWlFUuOhJ1kbzYrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OBb9AJAxd5WN/otx2D1AtDA8nsCJnJpFq72YhMHpaqfStJxDyCMVfVk0GekW+hAD1
	 Rib0of3NTgz0qE2UBaylAKsUUMkukmc/nhjeHaEZODSdS66zU4Qq6pwUD9qNLytSHG
	 rqkE5Sz6/A3l46+oTB57ycaujTTdeVDHZdwQ+Rx1VjbMLplFQHKhv0VAFwUvFL0iRe
	 Wi0lgFPNI6ZLqGJ0zqRtpxKovEygAPK1u+zmz6vOcSHm0dI5DlzdqXBAnXUtiMHEoU
	 eMxYFWgLZO8mv7YVvgRhnV3twr6tcP0bbh8q0UyBmJta8ALC7RR7aa5T2T+IHAqZpZ
	 8SFmCnQK7CO0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F20FCD37B7;
	Sun, 10 May 2026 18:32:17 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 11 May 2026 01:32:10 +0700
Subject: [PATCH v2 2/3] dt-bindings: usb: add Rohm BM92TXX Type-C
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
In-Reply-To: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, CTCaer <ctcaer@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778437929; l=5274;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=ozSJxakD3nLP0mwcFo/HHRulxXgmVTFqvb1G9vOg8aA=;
 b=str+uEhL/W9VY7JlxX7kSsLWdT7JI0aIsKLlqJz09RBsFKPPY4IND5RjuKH50gVlG0A2fQbSL
 K/CwdLQTmreBlHnFg81lWVYhP31zm1Q642MeL7WKw3NExLONdsB66bC
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: 64A45505A82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36497-lists,linux-gpio=lfdr.de,azkali.limited.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.18:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Add the device-tree binding documentation for the Rohm BM92TXX family
of USB Type-C and Power Delivery controllers. The device is controlled
over I2C and signals state changes through a dedicated interrupt line.

Document the rohm,* properties consumed by the driver: the optional
VCONN-enable GPIO, the DisplayPort alternate-mode toggles
(rohm,dp-disable, rohm,dp-alerts-enable, rohm,dp-signal-toggle-on-resume,
rohm,dp-lanes), the suspend/dock tunables (rohm,led-static-on-suspend,
rohm,dock-power-limit-disable) and the four
rohm,pd-{5,9,12,15}v-current-limit-ma per-PDO charging current limits.
A graph port is required to link the controller to a USB role switch
consumer.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 .../devicetree/bindings/usb/rohm,bm92t.yaml        | 128 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
new file mode 100644
index 000000000000..007f70a8f5bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/rohm,bm92t.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rohm BM92TXX USB Type-C and Power Delivery controller
+
+maintainers:
+  - CTCaer <ctcaer@gmail.com>
+  - Alexandre Hamamdjian <azkali.limited@gmail.com>
+
+description:
+  The Rohm BM92TXX is a family of USB Type-C and Power Delivery
+  controllers with an integrated MCU. The host communicates with the
+  device over I2C and is notified of state changes through a dedicated
+  interrupt line.
+
+properties:
+  compatible:
+    const: rohm,bm92t
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vbus-supply:
+    description: VBUS sink regulator.
+
+  vbus-source-supply:
+    description: VBUS source (provider) regulator.
+
+  pd_bat_chg-supply:
+    description: Battery charger regulator gated by Power Delivery state.
+
+  rohm,vconn-en-gpio:
+    maxItems: 1
+    description: GPIO controlling the external VCONN switch.
+
+  rohm,dp-disable:
+    type: boolean
+    description: Disable DisplayPort alternate-mode handling.
+
+  rohm,dp-alerts-enable:
+    type: boolean
+    description: Enable DisplayPort status alerts.
+
+  rohm,dp-signal-toggle-on-resume:
+    type: boolean
+    description:
+      Toggle the DisplayPort signal on resume to work around sinks that
+      do not re-train after system resume.
+
+  rohm,dp-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 4]
+    default: 2
+    description: Number of DisplayPort lanes to negotiate.
+
+  rohm,led-static-on-suspend:
+    type: boolean
+    description:
+      Keep the charge LED in a static state during system suspend
+      instead of letting the controller animate it.
+
+  rohm,dock-power-limit-disable:
+    type: boolean
+    description:
+      Disable the lower power limit applied when a dock is detected.
+
+  rohm,pd-5v-current-limit-ma:
+    description: Charging current limit in mA when 5V PD contract is active.
+
+  rohm,pd-9v-current-limit-ma:
+    description: Charging current limit in mA when 9V PD contract is active.
+
+  rohm,pd-12v-current-limit-ma:
+    description: Charging current limit in mA when 12V PD contract is active.
+
+  rohm,pd-15v-current-limit-ma:
+    description: Charging current limit in mA when 15V PD contract is active.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Output port linking to a USB role switch consumer endpoint.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@18 {
+            compatible = "rohm,bm92t";
+            reg = <0x18>;
+            interrupt-parent = <&gpio>;
+            interrupts = <42 IRQ_TYPE_LEVEL_LOW>;
+
+            vbus-supply = <&vbus_reg>;
+            vbus-source-supply = <&vbus_src_reg>;
+            pd_bat_chg-supply = <&pd_bat_chg_reg>;
+
+            rohm,dp-lanes = <4>;
+            rohm,pd-5v-current-limit-ma = <2000>;
+            rohm,pd-9v-current-limit-ma = <2000>;
+            rohm,pd-12v-current-limit-ma = <1500>;
+            rohm,pd-15v-current-limit-ma = <1200>;
+
+            port {
+                bm92t_ep: endpoint {
+                    remote-endpoint = <&usb_role_sw>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 01e06d87b926..8e8a23cad7c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23311,6 +23311,7 @@ M:	CTCaer <ctcaer@gmail.com>
 M:	Alexandre Hamamdjian <azkali.limited@gmail.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
 F:	drivers/usb/typec/bm92txx.c
 
 ROHM BU270xx LIGHT SENSOR DRIVERs

-- 
2.54.0



