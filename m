Return-Path: <linux-gpio+bounces-24385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87438B26393
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 12:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E051CA22C1F
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 10:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8C23019CB;
	Thu, 14 Aug 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYYTFTce"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0836A2FCC04;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168734; cv=none; b=BEw4O13D8QmYy63jbdyRa3pKgo6UJ61zTaOg1ND3Rd/J4P3Be56pPNiRz37sWI+zygXWoBGyzoZda4dCvoTr3gPhxVNGD/bDz6XJdLjs1rogk3T1MrYvbiBmQ9YORYWpx5tNDj7e1YwjBiPYBSPU/9iYKg98x6cx3E3HKfsnxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168734; c=relaxed/simple;
	bh=2jFiYxsc1WNyJnCv5lLuEcDugJS6KmrHs3sFZz6rVfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOgh+eI7l0hVRhHCd5JQ2qbBArsiDtK2tzD7GZRepQr7ARd0OWtYSa43hi3C3iLbB//RKxvQCkp4KIL0sFHDQWERrgd+Qi+H/es863tWTNGlZoFlA+8CLte4VxABXMXEoMLG4hI09M0N14Ort9i5ROCNx1lBWjpi9tlammmWDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYYTFTce; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6088C4CEF1;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755168733;
	bh=2jFiYxsc1WNyJnCv5lLuEcDugJS6KmrHs3sFZz6rVfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DYYTFTceJjguCMyW+98E7fR+ugsPYgZyNN55gxpIR8IMn965+MXlfyXG0z966TLkj
	 k2xL2q1nAkIKWEXnZp8Nf4NJ6qOXN3idVjdSZEifVYPFzXui42cYj1qDSv1P9Q6f/M
	 zwI+REKg9AttYpJu/v9+j663Vvsz4S2eKY9f7yJZcnZ62QYwVnOvkSpyADVLus0C+D
	 PZgrdr3KPIm2gt+clOaiNqtiHoIlPpp7WpibKsAOOLWHgGdkCnsZBG7LLqRE7IvFBc
	 hnOKMNcfuCkbSsohnTonqWRyaJ5UgJtPEl2g9POQqBgzEQCy1ry46sW8eVVKgHg1/R
	 DU45GSiGKrBug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E42CA0EDC;
	Thu, 14 Aug 2025 10:52:13 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Thu, 14 Aug 2025 11:52:23 +0100
Subject: [PATCH 1/6] dt-binbings: mfd: Add bindings for the LTC4283 Swap
 Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-ltc4283-support-v1-1-88b2cef773f2@analog.com>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
To: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755168752; l=3762;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=jZczKELD9tr25sgoyyPTOyUqiGRTqVv0NPtNl4m1Aps=;
 b=x3h8XfOKIQ6nRfIb0Dexb7UHnFFxW4fEypnSf0LYhdxBmnaR8xSL/pbeFnelzNOpzH7C3BAX2
 GOt4VD2POJQDt2PWoijtrlPD0qnZ7eMuRYmcXo+PoImyoe4kLVbPXCQ
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The LTC4283 is a negative voltage hot swap controller that drives an
external N-channel MOSFET to allow a board to be safely inserted and
removed from a live backplane.

Main usage is as an Hardware Monitoring device. However, it has up to 8
pins that can be configured and used as GPIOs and hence, the device can
also be a GPIO controller.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../devicetree/bindings/mfd/adi,ltc4283.yaml       | 85 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml b/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c5e8aec887d9cfad9052a7c28783396efd6804a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/adi,ltc4283.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC4283 I2C Negative Voltage Hot Swap Controller
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  The LTC4283 negative voltage hot swap controller drives an external N-channel
+  MOSFET to allow a board to be safely inserted and removed from a live
+  backplane.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4283
+
+  reg:
+    maxItems: 1
+
+  gpio:
+    $ref: /schemas/gpio/adi,ltc4283.yaml
+  hwmon:
+    $ref: /schemas/hwmon/adi,ltc4283.yaml
+
+  adi,gpio-pins:
+    description:
+      The pins to use as GPIOs. The device has 4 ADIO and 4 PGIO
+      pins than can be used as GPIOs. The ADIO pins are numbered from 0 to 3
+      and the PGIO pins are numbered from 4 to 7.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    items:
+      minimum: 0
+      maximum: 7
+
+dependencies:
+  gpio:
+    - adi,gpio-pins
+
+required:
+  - compatible
+  - reg
+  - hwmon
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        swap-controller@15 {
+            compatible = "adi,ltc4283";
+            reg = <0x15>;
+
+            /* pgio1 to pgio4 as gpios */
+            adi,gpio-pins = <0 1 2 3>;
+
+            gpio {
+                compatible = "adi,ltc4283-gpio";
+                gpio-controller;
+                #gpio-cells = <2>;
+            };
+
+            hwmon {
+                compatible = "adi,ltc4283-hwmon";
+
+                adi,rsense-nano-ohms = <500>;
+                adi,current-limit-sense-microvolt = <25000>;
+                adi,current-limit-foldback-factor = <10>;
+                adi,cooling-delay-ms = <8190>;
+                adi,fet-bad-timer-delay-ms = <512>;
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e90710a9b40d7b32c151472a9ac3b02efd95f346..413bb77d5eebe2b51aa9c3af86e7cfd5ab142044 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14500,6 +14500,13 @@ F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
 F:	Documentation/hwmon/ltc4282.rst
 F:	drivers/hwmon/ltc4282.c
 
+lTC4283 HARDWARE MONITOR AND GPIO DRIVER
+M:	Nuno Sá <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-gpio@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mfd/adi,ltc4283.yaml
+
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.50.1



