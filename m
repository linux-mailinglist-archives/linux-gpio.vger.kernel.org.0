Return-Path: <linux-gpio+bounces-33233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBwrLR1/smkcNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:53:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB13926F300
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFE39301C8DB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959F438AC84;
	Thu, 12 Mar 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf04EJZ8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9038B131
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305614; cv=none; b=AfF3vXfpq705XL9GirTdZmsMbmBF6L7KHu42yFFb/rWeW+wngFCYmdrUJJyCer0jvMv87ncJYddLUMLvi2x4taascfaeHG5mztVRtWgMvqHUvKVbHH954tbNQp802lUFVcRTv5RhCiSD9fbArEMzZXIg4R0nvyWFIdiYZ5muHQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305614; c=relaxed/simple;
	bh=s0GEQFsgxxC8ocJffvZdAnjvQWjlr3IDR8YgTCMzoPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF4LciE4Kn+Rm0KWBBAy1SWAikz8/om2mloWbtjJVF35gVPpox+S22mMKQnFsks2xP2rH3pn0sWmEeYzOvcBbaZt2zMv1Si6NAE8fSGg3VjdacBtGCzSuv0tPKqiVk6NI25DqDbM7gl+kaICh3uTEo/XbO0/nqAL0/jCI2tVO/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rf04EJZ8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso6033325e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305611; x=1773910411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FhpztJ801SxCSzmXJJlh2KMakvNAjjvoqxh49cLYxE=;
        b=Rf04EJZ83/J9fmiM8yUMl4FrIjrhJDc2IEdgXNBtGxFXwtjWyGsEKMASGSnnQKMigl
         3lyKWSi9X0j4rRWYFGCMZ/vRm+rws+AKIWRBFVAA80psLv/cWpnaU2oriIXnc3k+45++
         Li7mFL/rajQmT2dpRCTUbAIQiiMSUaF1WHihzMFusTH+uIWjJl5YUGfxlxCoqmqvYBeY
         zkESeMIrh/NdLk4/9gdZe6+2lO9u3L9ojmCm4ZXtU3cd1j8WANCS3jrDrsqk1fBxe1PA
         dwNs7X2a587l5InG0APfyQi25uP9rr2zXee2tSuCU99IP8s76GZg9G1ullO0erc6A1ob
         NDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305611; x=1773910411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FhpztJ801SxCSzmXJJlh2KMakvNAjjvoqxh49cLYxE=;
        b=lYS0N4izO0lYWy4/HZfMBXF4/6i6pEgwvx41Ww/KVaKoOLBuusvbi9Z2zW9wpLTOgi
         6hcJgjBLH97lCvE1gg/Proc+kgNlsIPx0UhwrvHwTzN0Rrq7hcpHt8dbyXrugRRewHCH
         exMhWC+GImKJTDvdbg4J06W+QMsfvbcDqwIihSQ3wTNnWYvvIXL34pGbjGadIqzXjxcq
         I9eTCp7SmXw3xCYRrlPvauD0RS6QkL29JREXmHMSi0jnEtm5ntqJM9c4mKXK2nXBZ5yJ
         9GpZEWqcD5P66vW/t2LLd9fRhn053Mkwrt9o6CYnkOKynyfkbaZMroMx8ioFEn7oCz7+
         DIEA==
X-Gm-Message-State: AOJu0Yz8RABF2+/XwhtS+9wij/VfOkblwnlk2Kek+FHBBnjA3myg8b2w
	OB0pzjWQd7186UqhyCcJS9Zks9TySizVCTm1/8FlaKyAtoFJawn79FSk
X-Gm-Gg: ATEYQzx/IryxIG63USkSprnrybtCEra6LMG21MyrzpSCbAUX1nTPp+5H0z9S9lgoxw+
	fFsOBckdrcbDKmgMLYACgvayFkoZxJp6CDtN1l/xzVkheUXszzRdN2VhfIyQ9oBIX0pbXenLepF
	gUvXrAoTuGLwjGPvK92P+h70a8q3PitXe8bXOaVotbQ3U9ABXiib8tQf9KoeLTn98Z3BA0hKlWl
	2ExZ9h0vzAe5aXn+UbZqmxdRd08JbFM9zUl5kbtu702U/9lgYV35INh/Xvyf4EdgAdUWtx7P6Eo
	6KcxG+s624xkE4p1M8gfJ+U8Lb7Hf6l6klPMK7WZORGMaRlNlWhj3GCFgdTTFZ9lnaNYOdJpyex
	ileO/jG1XSa5E/ktv8ovVqHUVIDZX18deNymrNHQTvZf0fqjXe/qoiJJDXJgYpRTfoOB+4kyWvN
	F4D01OVJFImeMdhVhQ6qMTUfI=
X-Received: by 2002:a05:600c:444d:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-4854b0bfc1fmr94691195e9.14.1773305610788;
        Thu, 12 Mar 2026 01:53:30 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm5449162f8f.32.2026.03.12.01.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:53:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: pinctrl: pinctrl-max77620: convert to DT schema
Date: Thu, 12 Mar 2026 10:52:55 +0200
Message-ID: <20260312085258.11431-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312085258.11431-1-clamor95@gmail.com>
References: <20260312085258.11431-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33233-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,3c:email,0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB13926F300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../pinctrl/maxim,max77620-pinctrl.yaml       |  97 +++++++++++++
 .../bindings/pinctrl/pinctrl-max77620.txt     | 127 ------------------
 2 files changed, 97 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
new file mode 100644
index 000000000000..4e5f997317ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/maxim,max77620-pinctrl.yaml
@@ -0,0 +1,97 @@
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


