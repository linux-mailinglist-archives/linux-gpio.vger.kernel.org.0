Return-Path: <linux-gpio+bounces-27724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97412C118F6
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2291D568029
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 21:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A5232B999;
	Mon, 27 Oct 2025 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6S8EENe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9531D378;
	Mon, 27 Oct 2025 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600461; cv=none; b=saTiP56q96V88XwdZuMYfUeU+xKdYbp0oAySGtb2gWDhNRjVU2tPLJJ8+ZZYtDxYrDd/UfNOE4ekCNaP+vYtfYwATUuGnrqlVqEsgTvYxyPX9OQA8AQw6DElSQDh8kPSnIazQSpqJUXEU1kE4cErCjmPDa/sj/Dm4sZ/k31noEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600461; c=relaxed/simple;
	bh=X6pkdu0tJ794P0POvorV12Or0aSlCL4ApK90UQHYZlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1o21DcDSLsvKpBa+o2ZTlstT5uwDgKUSsW8we5wQP24EtoWr0uuSgXlQy0iwPgULMLybiXfxMV31XLKlKdyQ3nuY7PC18w2FtzxiuBRBrpbmeUbq1ny0xIbGSYXBeoqbqNdReVkxlTDOR5Dh1yd+EIt9Ei2H4RhHnpc8uFmPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6S8EENe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F098C4CEF1;
	Mon, 27 Oct 2025 21:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761600460;
	bh=X6pkdu0tJ794P0POvorV12Or0aSlCL4ApK90UQHYZlo=;
	h=From:To:Cc:Subject:Date:From;
	b=E6S8EENeEKg6GAmdQ0ZWzGAfFNvPGJAa+xtvfmIfepALcEwm+MKi4uiQdhGXrgsvT
	 JhLcuz81GgGQYTdqYvmxvdkZiTkP4wr/jIdZbPzZRSGBri4pP7VjRqz/ZbUkM0iCa+
	 otZ+G8ONrFs8HEwyqghqyp1ef24BhXqk7zSc9PlGvEer/KImMB4vIkXoTSbvx58GdL
	 PPWXBT/DAUZi6mPUOBRt1v1M/yLH9GNoLEpOpCpcQev0TWFKRjF9/AubCjxG+4+CDY
	 KAa7KP9+jnAU7iq7EpsVVm/3ySoEySPpW5kFMfS7pDVc5sDkN/2F4DWmh9P23kWewF
	 DxquAntfXDwdA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: Convert sprd,sc9860-pinctrl to DT schema
Date: Mon, 27 Oct 2025 16:26:41 -0500
Message-ID: <20251027212642.1710144-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the sprd,sc9860-pinctrl binding to DT schema format. What's
valid for the the sleep mode child nodes wasn't well defined. The schema
is based on the example (as there's no .dts with pin states) and the
driver's register definitions.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
With this, all the pinctrl bindings used on arm64 are converted!

 .../bindings/pinctrl/sprd,pinctrl.txt         |  83 --------
 .../bindings/pinctrl/sprd,sc9860-pinctrl.txt  |  70 ------
 .../bindings/pinctrl/sprd,sc9860-pinctrl.yaml | 199 ++++++++++++++++++
 3 files changed, 199 insertions(+), 153 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
deleted file mode 100644
index 779b8ef0f6e6..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/sprd,pinctrl.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-* Spreadtrum Pin Controller
-
-The Spreadtrum pin controller are organized in 3 blocks (types).
-
-The first block comprises some global control registers, and each
-register contains several bit fields with one bit or several bits
-to configure for some global common configuration, such as domain
-pad driving level, system control select and so on ("domain pad
-driving level": One pin can output 3.0v or 1.8v, depending on the
-related domain pad driving selection, if the related domain pad
-select 3.0v, then the pin can output 3.0v. "system control" is used
-to choose one function (like: UART0) for which system, since we
-have several systems (AP/CP/CM4) on one SoC.).
-
-There are too much various configuration that we can not list all
-of them, so we can not make every Spreadtrum-special configuration
-as one generic configuration, and maybe it will add more strange
-global configuration in future. Then we add one "sprd,control" to
-set these various global control configuration, and we need use
-magic number for this property.
-
-Moreover we recognise every fields comprising one bit or several
-bits in one global control register as one pin, thus we should
-record every pin's bit offset, bit width and register offset to
-configure this field (pin).
-
-The second block comprises some common registers which have unified
-register definition, and each register described one pin is used
-to configure the pin sleep mode, function select and sleep related
-configuration.
-
-Now we have 4 systems for sleep mode on SC9860 SoC: AP system,
-PUBCP system, TGLDSP system and AGDSP system. And the pin sleep
-related configuration are:
-- input-enable
-- input-disable
-- output-high
-- output-low
-- bias-pull-up
-- bias-pull-down
-
-In some situation we need set the pin sleep mode and pin sleep related
-configuration, to set the pin sleep related configuration automatically
-by hardware when the system specified by sleep mode goes into deep
-sleep mode. For example, if we set the pin sleep mode as PUBCP_SLEEP
-and set the pin sleep related configuration as "input-enable", which
-means when PUBCP system goes into deep sleep mode, this pin will be set
-input enable automatically.
-
-Moreover we can not use the "sleep" state, since some systems (like:
-PUBCP system) do not run linux kernel OS (only AP system run linux
-kernel on SC9860 platform), then we can not select "sleep" state
-when the PUBCP system goes into deep sleep mode. Thus we introduce
-"sprd,sleep-mode" property to set pin sleep mode.
-
-The last block comprises some misc registers which also have unified
-register definition, and each register described one pin is used to
-configure drive strength, pull up/down and so on. Especially for pull
-up, we have two kind pull up resistor: 20K and 4.7K.
-
-Required properties for Spreadtrum pin controller:
-- compatible: "sprd,<soc>-pinctrl"
-  Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported SoCs.
-- reg: The register address of pin controller device.
-- pins : An array of pin names.
-
-Optional properties:
-- function: Specified the function name.
-- drive-strength: Drive strength in mA.
-- input-schmitt-disable: Enable schmitt-trigger mode.
-- input-schmitt-enable: Disable schmitt-trigger mode.
-- bias-disable: Disable pin bias.
-- bias-pull-down: Pull down on pin.
-- bias-pull-up: Pull up on pin.
-- input-enable: Enable pin input.
-- input-disable: Enable pin output.
-- output-high: Set the pin as an output level high.
-- output-low: Set the pin as an output level low.
-- sleep-hardware-state: Indicate these configs in this state are sleep related.
-- sprd,control: Control values referring to databook for global control pins.
-- sprd,sleep-mode: Sleep mode selection.
-
-Please refer to each sprd,<soc>-pinctrl.txt binding doc for supported values.
diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
deleted file mode 100644
index 5a628333d52f..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-* Spreadtrum SC9860 Pin Controller
-
-Please refer to sprd,pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: Must be "sprd,sc9860-pinctrl".
-- reg: The register address of pin controller device.
-- pins : An array of strings, each string containing the name of a pin.
-
-Optional properties:
-- function: A string containing the name of the function, values must be
-  one of: "func1", "func2", "func3" and "func4".
-- drive-strength: Drive strength in mA. Supported values: 2, 4, 6, 8, 10,
-  12, 14, 16, 20, 21, 24, 25, 27, 29, 31 and 33.
-- input-schmitt-disable: Enable schmitt-trigger mode.
-- input-schmitt-enable: Disable schmitt-trigger mode.
-- bias-disable: Disable pin bias.
-- bias-pull-down: Pull down on pin.
-- bias-pull-up: Pull up on pin. Supported values: 20000 for pull-up resistor
-  is 20K and 4700 for pull-up resistor is 4.7K.
-- input-enable: Enable pin input.
-- input-disable: Enable pin output.
-- output-high: Set the pin as an output level high.
-- output-low: Set the pin as an output level low.
-- sleep-hardware-state: Indicate these configs in this state are sleep related.
-- sprd,control: Control values referring to databook for global control pins.
-- sprd,sleep-mode: Choose the pin sleep mode, and supported values are:
-  AP_SLEEP, PUBCP_SLEEP, TGLDSP_SLEEP and AGDSP_SLEEP.
-
-Pin sleep mode definition:
-enum pin_sleep_mode {
-	AP_SLEEP = BIT(0),
-	PUBCP_SLEEP = BIT(1),
-	TGLDSP_SLEEP = BIT(2),
-	AGDSP_SLEEP = BIT(3),
-};
-
-Example:
-pin_controller: pinctrl@402a0000 {
-	compatible = "sprd,sc9860-pinctrl";
-	reg = <0x402a0000 0x10000>;
-
-	grp1: sd0 {
-		pins = "SC9860_VIO_SD2_IRTE", "SC9860_VIO_SD0_IRTE";
-		sprd,control = <0x1>;
-	};
-
-	grp2: rfctl_33 {
-		pins = "SC9860_RFCTL33";
-		function = "func2";
-		sprd,sleep-mode = <AP_SLEEP | PUBCP_SLEEP>;
-		grp2_sleep_mode: rfctl_33_sleep {
-			pins = "SC9860_RFCTL33";
-			sleep-hardware-state;
-			output-low;
-		}
-	};
-
-	grp3: rfctl_misc_20 {
-		pins = "SC9860_RFCTL20_MISC";
-		drive-strength = <10>;
-		bias-pull-up = <4700>;
-		grp3_sleep_mode: rfctl_misc_sleep {
-			pins = "SC9860_RFCTL20_MISC";
-			sleep-hardware-state;
-			bias-pull-up;
-		}
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.yaml
new file mode 100644
index 000000000000..59d23eb8aa97
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sprd,sc9860-pinctrl.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/sprd,sc9860-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spreadtrum SC9860 Pin Controller
+
+maintainers:
+  - Baolin Wang <baolin.wang@linux.alibaba.com>
+
+description: >
+  The Spreadtrum pin controller are organized in 3 blocks (types).
+
+  The first block comprises some global control registers, and each
+  register contains several bit fields with one bit or several bits
+  to configure for some global common configuration, such as domain
+  pad driving level, system control select and so on ("domain pad
+  driving level": One pin can output 3.0v or 1.8v, depending on the
+  related domain pad driving selection, if the related domain pad
+  select 3.0v, then the pin can output 3.0v. "system control" is used
+  to choose one function (like: UART0) for which system, since we
+  have several systems (AP/CP/CM4) on one SoC.).
+
+  There are too much various configuration that we can not list all
+  of them, so we can not make every Spreadtrum-special configuration
+  as one generic configuration, and maybe it will add more strange
+  global configuration in future. Then we add one "sprd,control" to
+  set these various global control configuration, and we need use
+  magic number for this property.
+
+  Moreover we recognize every fields comprising one bit or several
+  bits in one global control register as one pin, thus we should
+  record every pin's bit offset, bit width and register offset to
+  configure this field (pin).
+
+  The second block comprises some common registers which have unified
+  register definition, and each register described one pin is used
+  to configure the pin sleep mode, function select and sleep related
+  configuration.
+
+  Now we have 4 systems for sleep mode on SC9860 SoC: AP system,
+  PUBCP system, TGLDSP system and AGDSP system. And the pin sleep
+  related configuration are:
+    - input-enable
+    - input-disable
+    - output-high
+    - output-low
+    - bias-pull-up
+    - bias-pull-down
+
+  In some situation we need set the pin sleep mode and pin sleep related
+  configuration, to set the pin sleep related configuration automatically
+  by hardware when the system specified by sleep mode goes into deep
+  sleep mode. For example, if we set the pin sleep mode as PUBCP_SLEEP
+  and set the pin sleep related configuration as "input-enable", which
+  means when PUBCP system goes into deep sleep mode, this pin will be set
+  input enable automatically.
+
+  Moreover we can not use the "sleep" state, since some systems (like:
+  PUBCP system) do not run linux kernel OS (only AP system run linux
+  kernel on SC9860 platform), then we can not select "sleep" state
+  when the PUBCP system goes into deep sleep mode. Thus we introduce
+  "sprd,sleep-mode" property to set pin sleep mode.
+
+  The last block comprises some misc registers which also have unified
+  register definition, and each register described one pin is used to
+  configure drive strength, pull up/down and so on. Especially for pull
+  up, we have two kind pull up resistor: 20K and 4.7K.
+
+properties:
+  compatible:
+    const: sprd,sc9860-pinctrl
+
+  reg:
+    maxItems: 1
+
+additionalProperties:
+  $ref: '#/$defs/pin-node'
+  unevaluatedProperties: false
+
+  properties:
+    function:
+      description: Function to assign to the pins.
+      enum:
+        - func1
+        - func2
+        - func3
+        - func4
+
+    drive-strength:
+      description: Drive strength in mA.
+      $ref: /schemas/types.yaml#/definitions/uint32
+      enum: [2, 4, 6, 8, 10, 12, 14, 16, 20, 21, 24, 25, 27, 29, 31, 33]
+
+    input-schmitt-disable: true
+
+    input-schmitt-enable: true
+
+    bias-pull-up:
+      enum: [20000, 4700]
+
+    sprd,sleep-mode:
+      description: Pin sleep mode selection.
+      $ref: /schemas/types.yaml#/definitions/uint32
+      maximum: 0x1f
+
+    sprd,control:
+      description: Control values referring to databook for global control pins.
+      $ref: /schemas/types.yaml#/definitions/uint32
+
+  patternProperties:
+    'sleep$':
+      $ref: '#/$defs/pin-node'
+      unevaluatedProperties: false
+
+      properties:
+        bias-pull-up:
+          type: boolean
+
+        sleep-hardware-state:
+          description: Indicate these configs in sleep related state.
+          type: boolean
+
+$defs:
+  pin-node:
+    type: object
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    properties:
+      pins:
+        description: Names of pins to configure.
+        $ref: /schemas/types.yaml#/definitions/string-array
+
+      bias-disable:
+        description: Disable pin bias.
+        type: boolean
+
+      bias-pull-down:
+        description: Pull down on pin.
+        type: boolean
+
+      bias-pull-up: true
+
+      input-enable:
+        description: Enable pin input.
+        type: boolean
+
+      input-disable:
+        description: Enable pin output.
+        type: boolean
+
+      output-high:
+        description: Set the pin as an output level high.
+        type: boolean
+
+      output-low:
+        description: Set the pin as an output level low.
+        type: boolean
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pin_controller: pinctrl@402a0000 {
+        compatible = "sprd,sc9860-pinctrl";
+        reg = <0x402a0000 0x10000>;
+
+        grp1: sd0 {
+            pins = "SC9860_VIO_SD2_IRTE", "SC9860_VIO_SD0_IRTE";
+            sprd,control = <0x1>;
+        };
+
+        grp2: rfctl_33 {
+            pins = "SC9860_RFCTL33";
+            function = "func2";
+            sprd,sleep-mode = <3>;
+            grp2_sleep_mode: rfctl_33_sleep {
+                pins = "SC9860_RFCTL33";
+                sleep-hardware-state;
+                output-low;
+            };
+        };
+
+        grp3: rfctl_misc_20 {
+            pins = "SC9860_RFCTL20_MISC";
+            drive-strength = <10>;
+            bias-pull-up = <4700>;
+            grp3_sleep_mode: rfctl_misc_sleep {
+                pins = "SC9860_RFCTL20_MISC";
+                sleep-hardware-state;
+                bias-pull-up;
+            };
+        };
+    };
-- 
2.51.0


