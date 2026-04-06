Return-Path: <linux-gpio+bounces-34699-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB04OhZm02nmhwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34699-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 09:51:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B613A2173
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 09:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EAA630089A5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D749F373C1A;
	Mon,  6 Apr 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6EZuyg2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074C366DC0
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461892; cv=none; b=sbSBNm9skME2OqkOt/qkj6DUr6cHvlua1Ieg7xjkNcqm68gxG/fYxbkG1dci+w/41LkUdOGgtkf89sV8qo5tQWL2tETc9NjN86DY0Ks8A0f+RDffYyoqbVlz692n6YWr6f3gcG3XVXbkxnzXSqBI58mHDXilbTWWu9/s2+NnZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461892; c=relaxed/simple;
	bh=6QiwAReXTpBojlHHp4n5juTw3CiqRhW6QKlsg4KCdoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDBiP+5MhADK98PJ+xpmacQ3bvtwKsrOK67amQQlMTJDl+iCA7zIqLyEwrPCM7ls1Vn8uJdFOdXMTSgZjOyIWvqYKFuAPI7BaarxKuZ5PStZkh42vX43V3MoZCZv/LGca5CH2oOhxXKrZaVnh51h9proWSKDfs4P9O0bsQickko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6EZuyg2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso7284755e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 00:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461889; x=1776066689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1yRoOrwamurkh8iKC4rWIAOsL7TI+/4XONPPGFJ1VM=;
        b=d6EZuyg2H7GTsIHA+AbH5zFB9tZ/peLTW4aUKZXbem23j6Xoa+/k6DUCZfS1APvvHN
         5MODVOZV8Iqz7nsFX9n/XM5xig8uL2gks3eKEd7Qb7VAmD5NtkenlvlOd9UoM3eYeYIH
         xsSjSE2F668w0u0P/K1+1oDzpdLTjRpPr3yPRZhBNevAF213233DfgYUr1Z/r1/W0I62
         jdxHiCOyhSMjRvm1Gt2WmP72Q5Gl8scYngrLbvj7iRNVaHpFHwlKr2sjABA5btMDP136
         31qWlu57Eqm9A5Z8NOD0C79BGRY2ZkLnM4CESHk07HCHWAoGkv+NPln8o19wRsVye5bU
         jgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461889; x=1776066689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1yRoOrwamurkh8iKC4rWIAOsL7TI+/4XONPPGFJ1VM=;
        b=XT9tmxzRLjkj8j76Tjm/g44uUBgc3heOWl8+0I2fKTCDbKJG4cOxwn/l0C35VBJJcG
         1ShCgL2HT3apOOXu+435qYdzTrXKayiwJr78ciXllGfUqZpBdjO7TYWqZTy94dnBwySi
         kbS5jSoWyZsd4H4+2rC9Xc8wxZSd6gLUERuMu6w1aQA/5t1ice+hzkhI0gx9ZzN4DWDc
         Pv+749ftA7IdzxJVIEbGCoh/SekaZL/kk0p/QaNtOwVTiqUe2YaBRrfKSc4PH+mtdbTu
         ntT3MpAz0MUuIYKAvDois+KtqQK0Ec/OxEVIk34WrotOKt7cM6F+aAl3OM24kAUvDZnc
         Ag3w==
X-Gm-Message-State: AOJu0YzoGdMWN+wM3Wz6Qusn8tg7beTLd66+aTErin2WrpUiqtBM3N3n
	vdiHV/VBo7NDWQ9LhnYSKFr3pttRCWCrEy4LDa6jknPXqeydWIdPZmFk
X-Gm-Gg: AeBDievmxN6hq55bHeQAz4zTUl58uaAGvq+9DmukiQoxObR5mUKV7rkEKndi3deL7ud
	7D7zLKhyqcK+PCa1ONzRgPVUXDkJ8bY8WnORN0DpjXjauI51n5Z+5qD+mNIAXtWMLt/qKDwAAqv
	slP1haE3+j877FoPbSDgHlHUN7u151sNfB0G63RXLKzHtY6r/aCKTOtKxbpOc85KJhD7ftOxpWW
	eDMRzWUT5763jWwXo1G1ZwEJ79hFVtEAzQr49H41+DWeVC6ln8eBjnrp25smo/dCuoNQr0pHIzw
	rpCckxWzNgsTJhEuEF2IEhkHOiCQpa79cvFUUDHCB0dNbssL8XAzFLwQ36mRG3ApjN/vNiXIQdv
	I4Cy4VmCPxYGmnANu2isPS6uHIoFXDMgiBKaa39JnZJVuLKkLyWwOi0AkW+wQcaLXxfznYYJ9tV
	dfAoYNLmmomORX
X-Received: by 2002:a05:600c:3048:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-4889bf8821fmr94252615e9.14.1775461889025;
        Mon, 06 Apr 2026 00:51:29 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b739e00bsm20393525e9.10.2026.04.06.00.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:51:28 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to DT schema
Date: Mon,  6 Apr 2026 10:51:14 +0300
Message-ID: <20260406075114.25672-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406075114.25672-1-clamor95@gmail.com>
References: <20260406075114.25672-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34699-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87B613A2173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../pinctrl/maxim,max77620-pinctrl.yaml       |  98 ++++++++++++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
 2 files changed, 98 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
new file mode 100644
index 000000000000..b3ea36474317
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/maxim,max77620-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinmux controller function for Maxim MAX77620 Power management IC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  Device has 8 GPIO pins which can be configured as GPIO as well as the
+  special IO functions.
+
+allOf:
+  - $ref: /schemas/pinctrl/pincfg-node.yaml
+  - $ref: /schemas/pinctrl/pinmux-node.yaml
+
+patternProperties:
+  "^(pin|gpio).":
+    type: object
+    additionalProperties: false
+
+    properties:
+      pins:
+        items:
+          enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7 ]
+
+      function:
+        items:
+          enum: [ gpio, lpm-control-in, fps-out, 32k-out1, sd0-dvs-in, sd1-dvs-in,
+                  reference-out ]
+
+      drive-push-pull: true
+      drive-open-drain: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+      maxim,active-fps-source:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          FPS source for the GPIOs to get enabled/disabled when system is in
+          active state. Valid values are:
+          - MAX77620_FPS_SRC_0: FPS source is FPS0.
+          - MAX77620_FPS_SRC_1: FPS source is FPS1
+          - MAX77620_FPS_SRC_2: FPS source is FPS2
+          - MAX77620_FPS_SRC_NONE: GPIO is not controlled by FPS events and
+                                   it gets enabled/disabled by register access.
+          Absence of this property will leave the FPS configuration register
+          for that GPIO to default configuration.
+
+      maxim,active-fps-power-up-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Sequencing event slot number on which the GPIO get enabled when
+          master FPS input event set to HIGH. This is applicable if FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      maxim,active-fps-power-down-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Sequencing event slot number on which the GPIO get disabled when
+          master FPS input event set to LOW. This is applicable if FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      maxim,suspend-fps-source:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          This is same as property "maxim,active-fps-source" but value get
+          configured when system enters in to suspend state.
+
+      maxim,suspend-fps-power-up-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          This is same as property "maxim,active-fps-power-up-slot" but this
+          value get configured into FPS configuration register when system
+          enters into suspend. This is applicable if suspend state FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+      maxim,suspend-fps-power-down-slot:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          This is same as property "maxim,active-fps-power-down-slot" but this
+          value get configured into FPS configuration register when system
+          enters into suspend. This is applicable if suspend state FPS source
+          is selected as FPS0, FPS1 or FPS2.
+        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+
+    required:
+      - pins
+
+additionalProperties: false
+
+# see maxim,max77620.yaml for an example
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
deleted file mode 100644
index 28fbca180068..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
+++ /dev/null
@@ -1,127 +0,0 @@
-Pincontrol driver for MAX77620 Power management IC from Maxim Semiconductor.
-
-Device has 8 GPIO pins which can be configured as GPIO as well as the
-special IO functions.
-
-Please refer file <devicetree/bindings/pinctrl/pinctrl-bindings.txt>
-for details of the common pinctrl bindings used by client devices,
-including the meaning of the phrase "pin configuration node".
-
-Optional Pinmux properties:
---------------------------
-Following properties are required if default setting of pins are required
-at boot.
-- pinctrl-names: A pinctrl state named per <pinctrl-bindings.txt>.
-- pinctrl[0...n]: Properties to contain the phandle for pinctrl states per
-		<pinctrl-bindings.txt>.
-
-The pin configurations are defined as child of the pinctrl states node. Each
-sub-node have following properties:
-
-Required properties:
-------------------
-- pins: List of pins. Valid values of pins properties are:
-		      gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7.
-
-Optional properties:
--------------------
-Following are optional properties defined as pinmux DT binding document
-<pinctrl-bindings.txt>. Absence of properties will leave the configuration
-on default.
-	function,
-	drive-push-pull,
-	drive-open-drain,
-	bias-pull-up,
-	bias-pull-down.
-
-Valid values for function properties are:
-	gpio, lpm-control-in, fps-out, 32k-out, sd0-dvs-in, sd1-dvs-in,
-	reference-out
-
-There are also customised properties for the GPIO1, GPIO2 and GPIO3. These
-customised properties are required to configure FPS configuration parameters
-of these GPIOs. Please refer <devicetree/bindings/mfd/max77620.txt> for more
-detail of Flexible Power Sequence (FPS).
-
-- maxim,active-fps-source:		FPS source for the GPIOs to get
-					enabled/disabled when system is in
-					active state.  Valid values are:
-					- MAX77620_FPS_SRC_0,
-						FPS source is FPS0.
-					- MAX77620_FPS_SRC_1,
-						FPS source is FPS1
-					- MAX77620_FPS_SRC_2 and
-						FPS source is FPS2
-					- MAX77620_FPS_SRC_NONE.
-						GPIO is not controlled
-						by FPS events and it gets
-						enabled/disabled by register
-						access.
-					Absence of this property will leave
-					the FPS configuration register for that
-					GPIO to default configuration.
-
-- maxim,active-fps-power-up-slot:	Sequencing event slot number on which
-					the GPIO get enabled when
-					master FPS input event set to HIGH.
-					Valid values are 0 to 7.
-					This is applicable if FPS source is
-					selected as FPS0, FPS1 or FPS2.
-
-- maxim,active-fps-power-down-slot:	Sequencing event slot number on which
-					the GPIO get disabled when master
-					FPS input event set to LOW.
-					Valid values are 0 to 7.
-					This is applicable if FPS source is
-					selected as FPS0, FPS1 or FPS2.
-
-- maxim,suspend-fps-source:		This is same as property
-					"maxim,active-fps-source" but value
-					get configured when system enters in
-					to suspend state.
-
-- maxim,suspend-fps-power-up-slot:	This is same as property
-					"maxim,active-fps-power-up-slot" but
-					this value get configured into FPS
-					configuration register when system
-					enters into suspend.
-					This is applicable if suspend state
-					FPS source is selected as FPS0, FPS1 or
-
-- maxim,suspend-fps-power-down-slot:	This is same as property
-					"maxim,active-fps-power-down-slot" but
-					this value get configured into FPS
-					configuration register when system
-					enters into suspend.
-					This is applicable if suspend state
-					FPS source is selected as FPS0, FPS1 or
-					FPS2.
-
-Example:
---------
-#include <dt-bindings/mfd/max77620.h>
-...
-max77620@3c {
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&spmic_default>;
-
-	spmic_default: pinmux@0 {
-		pin_gpio0 {
-			pins = "gpio0";
-			function = "gpio";
-		};
-
-		pin_gpio1 {
-			pins = "gpio1";
-			function = "fps-out";
-			maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-		};
-
-		pin_gpio2 {
-			pins = "gpio2";
-			function = "fps-out";
-			maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
-		};
-	};
-};
-- 
2.51.0


