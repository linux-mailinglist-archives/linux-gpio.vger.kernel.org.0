Return-Path: <linux-gpio+bounces-8471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 576509425ED
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 07:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F40285515
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 05:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA94F1F2;
	Wed, 31 Jul 2024 05:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnaED0ef"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1512747B;
	Wed, 31 Jul 2024 05:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722404700; cv=none; b=fpAOsrX5axdAdgPqZV7JMebbuMlndy0BQWB+6Y0aNfiYLhXJ3f6MPel+aiIpRMRc7jZ535/1WhL4dqYemZfVaKBL5NaQXOytQJ24YilnOIlA2un5tATzhsIeoTZiVblOhHaQHgRtZbIDd1gbqr4K0xrSedfP597N4W05xXBB68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722404700; c=relaxed/simple;
	bh=dvCs+55BZAlqOsYn/39Io4p6jWFtaeqX35sqsxB2pr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UizgRe5pcuJ3jYp+xR9HmFG3/RrlFjZRGXN5Xh1z/g27CR/fQZoTFhz+65zoAFIpgFuDKt/13R5daLOddS3QTNRWlep98L2sxzUBEmMCRFbvu/QBrs85ItjhxbRJi23hBgAT1QCEb/7QSU/cQ1CiJ++l+K5khO1jahO5T19RoBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnaED0ef; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc566ac769so33677295ad.1;
        Tue, 30 Jul 2024 22:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722404698; x=1723009498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BC/1wGF6ESoob1KqZeUdHt7PS9fgESUzLCWFdRi9eQs=;
        b=LnaED0efYD267i0ARHM8fKxPYN2rzFyXGKGQYs9ip7fjI6bdb7ni8kN/XezuDiSQ/t
         txBuOpZQ5u5RvqR1oUVMaVx9fL2ypQuEBYe4WuMk/b8Xk5T6m9k9bm5U+MUejKPKTPm/
         eRtFypJa/2nyavROBqDBrCBq5NraQYbLkga62w/CrAqoD5AAK/Nv2HPZgHUGBZzFoHz1
         oNNTwfWKKjLLb6k2JlpQKKiUoqeHHbxDbXiZ2kOXQqt2YKuS8/w/I00jNPVUTyoYjVld
         eYiTXkKlBVR1tApFg1KkbUfPNStJUtHMmUOhjkuBPuMlehqqwp1CsrjkZxD7p+aByHPW
         9oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722404698; x=1723009498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC/1wGF6ESoob1KqZeUdHt7PS9fgESUzLCWFdRi9eQs=;
        b=Vcbydaw+/kdmTv7Sk7a16cVyUUmo08NREv/kTsUQ+M9wqt72bt8mq76bRvcSyVIRAm
         6sgurkMjxvGVgnrKOC5mVepcj20Vqn5tYo7iatTag69Y1tzFJkJfnxL4m1Ur9lfdW19w
         HVMt1jMXypSzwE+HyyN6Bz088VxOT2S6GsbVminV3ebrd8q5jjps2OX7qxNbUJ3KozBh
         1RNkAVSfUtEuLqyMpUt+RtYRM5tWodvNEhxdpmmbPI4eshBapOky18hbP51srsaA9pwk
         XhZfXpU2V81Y7hVdyrBqrbO6481r2OtlyJOVDLgJo7AAcb2AtjCHe1mt/5eWUfEHKDre
         hfFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY1CKBI9GaatKnqa4Wn4wyiIoE6OHEMWNmc4oZxBYD27HOrFk+wq+UwR+f+YAFuoWtlvDDGX2veDU76fMWVZdZVb4ZwiN74frmg6iBqNiQ2/3d9D7TmQbUIpYAINFgrDRWIhNKVVQ9jf0RvnAJq1oxVNY5C4hvRy3OKi7v6xYLmok6cgI=
X-Gm-Message-State: AOJu0YxaOyWCP29LM0CbPIAUBod0BMOQiP4nShWBzCGEPo1pABvcwJA5
	QeEqmitRlnJD7FjTjsFbEIDZVLD4WTLMRx7EI6u0dJqizvSlZ+S9
X-Google-Smtp-Source: AGHT+IHxQObfjU980Misuy2+P7JlI9fIsZPaHtla2bfIq7tNqqyqhR+dKEHn/hWwBPXv4Sw1+e+gZg==
X-Received: by 2002:a17:902:da91:b0:1fc:560b:1456 with SMTP id d9443c01a7336-1ff047a42d0mr111765665ad.15.1722404697830;
        Tue, 30 Jul 2024 22:44:57 -0700 (PDT)
Received: from localhost.localdomain ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ce4239sm111968755ad.80.2024.07.30.22.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 22:44:57 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: gpio: nxp,lpc3220-gpio: Convert to dtschema
Date: Wed, 31 Jul 2024 11:14:30 +0530
Message-ID: <20240731054442.109732-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the NXP LPC3220 SoC GPIO controller bindings to DT schema format.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

---
Changes in v3:
  - Removed unnecessary #include from example.

Changes in v2:
  - Changed the file name to match the compatible string.
  - Removed optional from the description of '#gpio-cells' as it was wrongly
    present.
---
 .../devicetree/bindings/gpio/gpio_lpc32xx.txt | 43 ----------------
 .../bindings/gpio/nxp,lpc3220-gpio.yaml       | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt b/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
deleted file mode 100644
index 49819367a011..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-NXP LPC32xx SoC GPIO controller
-
-Required properties:
-- compatible: must be "nxp,lpc3220-gpio"
-- reg: Physical base address and length of the controller's registers.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Should be 3:
-   1) bank:
-      0: GPIO P0
-      1: GPIO P1
-      2: GPIO P2
-      3: GPIO P3
-      4: GPI P3
-      5: GPO P3
-   2) pin number
-   3) optional parameters:
-      - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- reg: Index of the GPIO group
-
-Example:
-
-	gpio: gpio@40028000 {
-		compatible = "nxp,lpc3220-gpio";
-		reg = <0x40028000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <3>; /* bank, pin, flags */
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led0 {
-			gpios = <&gpio 5 1 1>; /* GPO_P3 1, active low */
-			linux,default-trigger = "heartbeat";
-			default-state = "off";
-		};
-
-		led1 {
-			gpios = <&gpio 5 14 1>; /* GPO_P3 14, active low */
-			linux,default-trigger = "timer";
-			default-state = "off";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml b/Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml
new file mode 100644
index 000000000000..25b5494393cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,lpc3220-gpio.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,lpc3220-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC3220 SoC GPIO controller
+
+maintainers:
+  - Animesh Agarwal <animeshagarwal28@gmail.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
+    description: |
+      1) bank:
+        0: GPIO P0
+        1: GPIO P1
+        2: GPIO P2
+        3: GPIO P3
+        4: GPI P3
+        5: GPO P3
+      2) pin number
+      3) flags:
+        - bit 0 specifies polarity (0 for normal, 1 for inverted)
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@40028000 {
+        compatible = "nxp,lpc3220-gpio";
+        reg = <0x40028000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <3>; /* bank, pin, flags */
+    };
-- 
2.45.2


