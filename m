Return-Path: <linux-gpio+bounces-34700-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULO0Ghtm02nmhwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34700-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 09:51:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E203A217B
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 09:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C32A3300B582
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 07:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6BD37419B;
	Mon,  6 Apr 2026 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/7oukeh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB2E35E923
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461893; cv=none; b=XxEOcX9LxHHzsOuMmCTC9vch2jQPd9Q8uTan+jlENLN9yP0Ko8N3q5LVWHYYrBOpxyj2TOIno+zVB7jTKTUwfj8BZ2hAJPMuErdyn55Blz3tlZjyMbg6MnNFnxBSt4K7RCT7mtQcgKTsUo8q7QoFiU6+thZnqNvC6PlcPJuD0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461893; c=relaxed/simple;
	bh=LbDcwJqJ3hApWhOjg/1ArXaMfQa98m0EF2RkLmBRHCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKmBVBmN1Ot6QCO9pRjhLt+NYfWSZXWhBvFVIvXp2dYWOz6jRWPUmbp3n+xbMmN7Nge74/NRhU8L80O4icH54UA00kDJL6cRSx1NG4JUsthJ2t2LIxiyASxxp9RSglZHLkewKc20KYayTQqRKX4LM3J8tCkE59uU8mRDeV9dI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/7oukeh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso3328681f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461888; x=1776066688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvnYBColS2NJ2nRJ9xcjChL7NS5bCiTG1wTopgEGQoA=;
        b=l/7oukehDTJtGLXljrZiNgSlZyBrjyu75VEhbW1BJcLG1XdFVicsKyQY0HIJFS/yfg
         TZItH8Cwv8XaeaoqtMmgL7f7BR/qFqVSXep0vG1G2Er7eYIdgsTOQqQsLwP02EbwzN30
         ZZX+FatXxmsmTRuOnkv+l0e3D2sCeRDJ7GWTmEM7KPVVE9xUdoKvqMAhm6Hf0Q3z5vig
         EkYMlGyOqZwSFQc7Edt85q1SQRsznjLtZHe2MpXQenfHPOeLjmZCqlPlZN5s4Wznmq0a
         vHLgxD6KxBVWoJDPVsleblN+9hxnrozKMJEi9H2aHgusTDExCFFWU2W/rqtmFbzq9Ivz
         mtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461888; x=1776066688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvnYBColS2NJ2nRJ9xcjChL7NS5bCiTG1wTopgEGQoA=;
        b=a4q79yelRqMiG7YCI1mz4GcH6uDWfIlaRs5gWsh5r4jqBasiGElXWMmiRqETcUiyYM
         1EmsHlZRuKG+EipmdRvnCINWuZYMyPil2R0JNLSmtPy2xNm7vSJDaSk9wPtxTmdSIX+D
         a28912syHCIFgV5j2WLgXO+Ve7ZlS/wO1MIz6ozOFrnRGLuV9XpOmdIlSBm9v8STTemO
         Utd11E5RFN85fWGi+qqWSE8r8NEI63dKqEPsJPgT+xWnaKzt68CpsJCyTX02vjhTQh0S
         Er27yoGW7LLhk37EVe+FuGOdIp4QH1vDn5f1oBXJOOzaJv+EvMDuzO4QWIvsozXrsoFb
         YesA==
X-Gm-Message-State: AOJu0YxPYFEBbMa+FEm+8pj1cw0TyrUkgk45zBn0ugWjP8s+LjLaZ0pp
	BkqA0K3HgfhyqZp4UUHsu4PG9lIfoeZNu/bvVF0mdpL0IqP86OMZ5ARZ
X-Gm-Gg: AeBDietWBeS9QlsNi2iw6gAZJsVa81h65zkyKJsk3oJ+8VQvLg3YxArXSOBN2YQMMKi
	YD/WduQFXysiQJMoBYcEtSqc0jJzT5enwOx2b0GMheJq6tXcBLl1PQTz4mix8t1vicqGPXyy6Ja
	xJAFJShfc7YRg53LpwQO4ZEUNMZyI4X0oPEO5NebesVv69K89dwWIS7LzlEdpfNJdJ5Ma5Mj26Z
	GiWqx75KEySHup3ktOwuNAJgoBKpWZhn4oV3yKGeCXjNNP0ZambYoIuJaUgftkmyPE+wqL0Nfyo
	hJVOmZRkv6zRVDHw67ksl0nX6DJfDbvZ84MqMpmx7PWFoOx88/BWH9vVrvBxL5JKRqPHa2MfTQH
	RmtOZ9m8r4NfSLbAq0lg6UlruNMFk/DpxXxnrFYb3zlMIKaO061pWK/zGP1R2gyJ/xSLO1OIWkf
	WR1Cvyynx3dfON
X-Received: by 2002:a05:600c:a414:b0:488:b2bd:bd5d with SMTP id 5b1f17b1804b1-488b2bdc0c5mr20479025e9.6.1775461887943;
        Mon, 06 Apr 2026 00:51:27 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b739e00bsm20393525e9.10.2026.04.06.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:51:27 -0700 (PDT)
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
Subject: [PATCH v5 1/2] regulator: dt-bindings: regulator-max77620: convert to DT schema
Date: Mon,  6 Apr 2026 10:51:13 +0300
Message-ID: <20260406075114.25672-2-clamor95@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-34700-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52E203A217B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert regulator-max77620 devicetree bindings for the MAX77620 PMIC from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


