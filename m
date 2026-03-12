Return-Path: <linux-gpio+bounces-33232-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aANyDiJ/smkcNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33232-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:53:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DB26F318
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF62830579D0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCA038AC93;
	Thu, 12 Mar 2026 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlZRIeV4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135AD38AC87
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305612; cv=none; b=fTEMpzUu7jVzsnadxdzmW/kxKL1DLFbTLEsr0awxtT3hRtwzP184YqYbojbSxsefiguerfzveWAjr7ilnCIA7E9egXsGTtq68wYFcggpRsdzD/r54l2Y1jvn6wrFvc3hSjE56raD1QkRf3wyXICMdhlbRChsgOGOwUcokWwwNb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305612; c=relaxed/simple;
	bh=ifTHnKwuEO3kKgeXJR7FZeO8G4oaqv1I62bN3RKV11g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1dki+fsLtDbV0DZFb30sOTz+wfBcIJbf8WuoCwrHY5dr5W99aXRhN15pRRtKzjyYniFWMy4JitxmDc9cZ7IBb9a5KlCDurLXlgS5KdpZf/dYVmhemCrKtfKpV17CjSARUBgrPHyRvkw05fa/IFshScbsjiv2YJVbtlfHxgv8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlZRIeV4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b78b638eso813689f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305609; x=1773910409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN0uhmoJw5mBiCDVED+sYPiiBYFCvTSJOtEF6kukFz4=;
        b=AlZRIeV4arWvZVxczAdqFKAyEN3hCWDNAYazkvaQaFir0AmcdcbDUN4TbCq9m1YBWy
         hbj1Xh5BduguP6omCuqKfwYJc8IScvCkdHcQfcSYft0H+1PBu4AsiKQP1wJsutgiDQiT
         MKKlHTx5KFClVWuBycUu2UQOruFd2G6BOPu/3vGnonDbyUbNpYNiJ1YAewQAuMii7jcg
         NlNRXEmwyUTJK0Fkng6MIwk7aFO7aTLiCjVtSEmZT2/5z60osCyZkF3MfUXU18F49xnl
         pmqAvkWhd8PJoSX8SOuHZWGCJILWY/FCA/3yOZ2Rm99n20HgcbqL19HZY6LUvNqtARMc
         ccvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305609; x=1773910409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kN0uhmoJw5mBiCDVED+sYPiiBYFCvTSJOtEF6kukFz4=;
        b=SDd11Bb9UxWD4wU1qCTNUvsHSm2WiTxw5WRiV4bNLnqzKlNnIEp2N78wuFlakPDa8W
         ePF+IBZfvigdgQTs4t93Pfai4z602sExwIWkOxWfbellIADZRG41OjXfGYHIYnZILmmH
         YqaqHkDdv98QLiURqo1OkmamuzfUWiUSoRvdPEEIK1SjHeqYAW+qrt7KpAZZPyf8nPHO
         +a4rX7ULG+kK2pxAyiPGjevY739sux65abLJU+HAm2qAhRlawAw18e50FGrSFeDmlbtA
         Erz7dkG+DVg/XHvDWKdBue1JoHPmLpxmsTphmPABxtmtDAbLdVyABnjqe1s2GMh/VaE0
         7p2Q==
X-Gm-Message-State: AOJu0Yx8MOnA7epcDJN5P2cOAe8s6rHR3oIrEVxSdo4UhyqIbpyB9qMW
	TH22UQFlN+7YbpLUBz6Xjc4NkQ6V9J23gym/ih6GOUfnYqhFt71pIW11
X-Gm-Gg: ATEYQzxMV7lOX06uH8581w51rdtt7sOT/US3pp2b4TnT6+Yr8ywGn+ZSOJ4LAFIeiW/
	m3cSOfVtkFpz2oJcIL3y1bpHyQHk2sOJIKNNHV+Kvf/5WcWw3LaRVMDUAU60fFc/+5dUWJ3w3HP
	DWJ3aTmhbTVT2qMyWJdRCzajCWAXxbetPom/heG0C3++i35ODYkLbsDdnzLJD3UU7KXV5ebIf4I
	sm0BG1rl0K8YbWuxgM1SjcppX9I8phqq/MGxGCmZklnmZ3iq1bkmM2R0EKhXGwYUV8C0E7mPTyN
	b4QEHfSd5/QefGNtXvb24tHoRSm9bzhzeFGrzexsoUoZ0a/FDxZDnJZL3hJ9f7C+BCUrZdXWO6C
	F1IEjZACnFyOejz+CSrSds9JJeIHTRGLLPR7gg3Nas+2P/t1F8fuo2tX+ZZaemwaNkDBqmQyDRK
	BCNdhp6nrKzVV7
X-Received: by 2002:a05:6000:26ca:b0:439:b486:ba71 with SMTP id ffacd0b85a97d-439f842f50bmr10561972f8f.56.1773305609210;
        Thu, 12 Mar 2026 01:53:29 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm5449162f8f.32.2026.03.12.01.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:53:28 -0700 (PDT)
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
Subject: [PATCH v4 1/5] regulator: dt-bindings: regulator-max77620: convert to DT schema
Date: Thu, 12 Mar 2026 10:52:54 +0200
Message-ID: <20260312085258.11431-2-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33232-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3c:email,devicetree.org:url]
X-Rspamd-Queue-Id: C69DB26F318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert regulator-max77620 devicetree bindings for the MAX77620 PMIC from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 .../regulator/maxim,max77620-regulator.yaml   |  99 ++++++++
 .../bindings/regulator/regulator-max77620.txt | 222 ------------------
 2 files changed, 99 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/regulator-max77620.txt

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
new file mode 100644
index 000000000000..7118c34961ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max77620-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Regulator for MAX77620 Power management IC from Maxim Semiconductor.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  Device has multiple DCDC(sd[0-3]) and LDOs(ldo[0-8]). The input supply
+  of these regulators are defined under parent device node. Details of
+  regulator properties are defined as child node under sub-node "regulators"
+  which is child node of device node.
+
+patternProperties:
+  "^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$":
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Input supply for DCDC or LDO
+
+  "^(sd[0-3]|ldo[0-8])$":
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
+    properties:
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
+      maxim,ramp-rate-setting:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Ramp rate(uV/us) setting to be configured to the device. The platform
+          may have different ramp rate than advertised ramp rate if it has design
+          variation from Maxim's recommended. On this case, platform specific
+          ramp rate is used for ramp time calculation and this property is used
+          for device register configurations. The measured ramp rate of platform
+          is provided by the regulator-ramp-delay.
+
+          Maxim Max77620 supports following ramp delay:
+            SD: 13.75mV/us, 27.5mV/us, 55mV/us
+            LDOs: 5mV/us, 100mV/us
+        enum: [5000, 13750, 27500, 55000, 100000]
+
+additionalProperties: false
+
+# see maxim,max77620.yaml for an example
diff --git a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt b/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
deleted file mode 100644
index bcf788897e44..000000000000
--- a/Documentation/devicetree/bindings/regulator/regulator-max77620.txt
+++ /dev/null
@@ -1,222 +0,0 @@
-Regulator DT binding for MAX77620 Power management IC from Maxim Semiconductor.
-
-Device has multiple DCDC(sd[0-3] and LDOs(ldo[0-8]). The input supply
-of these regulators are defined under parent device node.
-Details of regulator properties are defined as child node under
-sub-node "regulators" which is child node of device node.
-
-Please refer file <Documentation/devicetree/bindings/regulator/regulator.txt>
-for common regulator bindings used by client.
-
-Following are properties of parent node related to regulators.
-
-Optional properties:
--------------------
-The input supply of regulators are the optional properties on the
-parent device node. The input supply of these regulators are provided
-through following properties:
-in-sd0-supply:		Input supply for SD0, INA-SD0 or INB-SD0 pins.
-in-sd1-supply:		Input supply for SD1.
-in-sd2-supply:		Input supply for SD2.
-in-sd3-supply:		Input supply for SD3.
-in-ldo0-1-supply:	Input supply for LDO0 and LDO1.
-in-ldo2-supply:		Input supply for LDO2.
-in-ldo3-5-supply:	Input supply for LDO3 and LDO5
-in-ldo4-6-supply:	Input supply for LDO4 and LDO6.
-in-ldo7-8-supply:	Input supply for LDO7 and LDO8.
-
-Optional sub nodes for regulators under "regulators" subnode:
-------------------------------------------------------------
-The subnodes name is the name of regulator and it must be one of:
-	sd[0-3], ldo[0-8]
-
-Each sub-node should contain the constraints and initialization
-information for that regulator. The definition for each of these
-nodes is defined using the standard binding for regulators found at
-<Documentation/devicetree/bindings/regulator/regulator.txt>.
-
-There are also additional properties for SD/LDOs. These additional properties
-are required to configure FPS configuration parameters for SDs and LDOs.
-Please refer <devicetree/bindings/mfd/max77620.txt> for more detail of Flexible
-Power Sequence (FPS).
-Following are additional properties:
-
-- maxim,active-fps-source:		FPS source for the regulators to get
-					enabled/disabled when system is in
-					active state.  Valid values are:
-					- MAX77620_FPS_SRC_0,
-						FPS source is FPS0.
-					- MAX77620_FPS_SRC_1,
-						FPS source is FPS1
-					- MAX77620_FPS_SRC_2 and
-						FPS source is FPS2
-					- MAX77620_FPS_SRC_NONE.
-						Regulator is not controlled
-						by FPS events and it gets
-						enabled/disabled by register
-						access.
-					Absence of this property will leave
-					the FPS configuration register for that
-					regulator to default configuration.
-
-- maxim,active-fps-power-up-slot:	Sequencing event slot number on which
-					the regulator get enabled when
-					master FPS input event set to HIGH.
-					Valid values are 0 to 7.
-					This is applicable if FPS source is
-					selected as FPS0, FPS1 or FPS2.
-			
-- maxim,active-fps-power-down-slot:	Sequencing event slot number on which
-					the regulator get disabled when master
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
-- maxim,ramp-rate-setting:		integer, ramp rate(uV/us) setting to be
-					configured to the device.
-					The platform may have different ramp
-					rate than advertised ramp rate if it has
-					design variation from Maxim's
-					recommended. On this case, platform
-					specific ramp rate is used for ramp time
-					calculation and this property is used
-					for device register configurations.
-					The measured ramp rate of platform is
-					provided by the regulator-ramp-delay
-					as described in <devicetree/bindings/
-					regulator/regulator.txt>.
-					Maxim Max77620 supports following ramp
-					delay:
-					  SD: 13.75mV/us, 27.5mV/us, 55mV/us
-					  LDOs: 5mV/us, 100mV/us
-
-Note: If the measured ramp delay is same as advertised ramp delay then it is not
-required to provide the ramp delay with property "maxim,ramp-rate-setting". The
-ramp rate can be provided by the regulator-ramp-delay which will be used for
-ramp time calculation for voltage change as well as for device configuration.
-
-Example:
---------
-#include <dt-bindings/mfd/max77620.h>
-...
-max77620@3c {
-	in-ldo0-1-supply = <&max77620_sd2>;
-	in-ldo7-8-supply = <&max77620_sd2>;
-	regulators {
-		sd0 {
-			regulator-name = "vdd-core";
-			regulator-min-microvolt = <600000>;
-			regulator-max-microvolt = <1400000>;
-			regulator-boot-on;
-			regulator-always-on;
-			maxim,active-fps-source = <MAX77620_FPS_SRC_1>;
-		};
-
-		sd1 {
-			regulator-name = "vddio-ddr";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-always-on;
-			regulator-boot-on;
-			maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-		};
-
-		sd2 {
-			regulator-name = "vdd-pre-reg";
-			regulator-min-microvolt = <1350000>;
-			regulator-max-microvolt = <1350000>;
-		};
-
-		sd3 {
-			regulator-name = "vdd-1v8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		ldo0 {
-			regulator-name = "avdd-sys";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		ldo1 {
-			regulator-name = "vdd-pex";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
-		ldo2 {
-			regulator-name = "vddio-sdmmc3";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		ldo3 {
-			regulator-name = "vdd-cam-hv";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-		};
-
-		ldo4 {
-			regulator-name = "vdd-rtc";
-			regulator-min-microvolt = <1250000>;
-			regulator-max-microvolt = <1250000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		ldo5 {
-			regulator-name = "avdd-ts-hv";
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-		};
-
-		ldo6 {
-			regulator-name = "vdd-ts";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		ldo7 {
-			regulator-name = "vdd-gen-pll-edp";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
-
-		ldo8 {
-			regulator-name = "vdd-hdmi-dp";
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1050000>;
-		};
-	};
-};
-- 
2.51.0


