Return-Path: <linux-gpio+bounces-1546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F697814AA5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 15:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A9ECB22921
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Dec 2023 14:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9B6358A3;
	Fri, 15 Dec 2023 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="f5ka+KE/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CCB53AF
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3A8FD3F2C1
	for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651152;
	bh=DP/Du3U6CUcJgvW/RY0Kd++wZRLCP6RkWeO4awpzGL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=f5ka+KE/KeWhuy3HXkILyrwP8G8uLew5gsHyT5wAyhzj1h4j26G6oAKiswnfiezhL
	 I2ICnJLWO13eYHR9LczDnwLT85Q8orFReaxgYDggcy78pjT+dWSWDeVUKMBbZkH+pX
	 vhdUBVr+utQ+7ebtqDNRhpppJ2HMCv+pTo1bymSd58xq4EJoVGeIKF7aVrL1+vqdlD
	 7Ecc1BIG2m5b2Wzqd0/Pa+OLRZ1R+AdPauy1hdEH/iv4ZhdecDRRS2rx6Jf8W/Rxgy
	 OXRPKB6wKmbfEtkVXX0gHq28InjNNqp0KNI2/5VmxRKWUINPyAtO1kpTmfa9/ienPG
	 S95jclXTbt1PQ==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1d38492da7so45850266b.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Dec 2023 06:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651151; x=1703255951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP/Du3U6CUcJgvW/RY0Kd++wZRLCP6RkWeO4awpzGL4=;
        b=EOSTOvKCGsrDqIWkpn7LHB7K50DV6iK1LV2+EBW+VXirdAiiciV0btIA4c6batQE4Z
         INBjS62jvwH0FpJLfOAOgo95QqXMFSLAkX9peRUCyWW3MXM9U+GOig8BZjTDi/Lk3/MT
         42BmnAahwIDFiPraDtz6CHSBi8te1aEV/IITPut71zyLXjDZnwIiFtWtB7SzHj551j4b
         0QXythpVtaLjBAWQlr0uyYgEk0gw7oPtCMS6J+YoU/UQdEHwwZCksw8EkVtNzguu9bbU
         v1sDaj3mVCNzeOJB3JTay/urPTFRL0GW1OxGJb7wVbvtHYdZJyvgmkZ6tEhV2ndOA6Ni
         TxJA==
X-Gm-Message-State: AOJu0YwHHU6yD/npM18oDsEdvKie/AbryfOkMOmXOEsd/dPY5WoOqOVU
	jgRczRQMwVtD52fW7LjOBYsoYPJOtJzvEjKlijmMnSr7ZdLuct+WA5WlEczk9ecdnyouWDTGggE
	R25pWLOO+pEyEfrn2RXYotc9D6Z7KlmtFzDpd6jQbxpANGo8=
X-Received: by 2002:a17:906:11cb:b0:a1f:69bb:1172 with SMTP id o11-20020a17090611cb00b00a1f69bb1172mr3074863eja.24.1702651151345;
        Fri, 15 Dec 2023 06:39:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTffL/doR/ETAy/wrSMpH3RUmFY43A+OIfIwmHqAuJ/qR9YE82r4WDCo8NkupJsSz0cvddfw==
X-Received: by 2002:a17:906:11cb:b0:a1f:69bb:1172 with SMTP id o11-20020a17090611cb00b00a1f69bb1172mr3074850eja.24.1702651151022;
        Fri, 15 Dec 2023 06:39:11 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:09 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
Date: Fri, 15 Dec 2023 15:38:59 +0100
Message-Id: <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../pinctrl/thead,th1520-pinctrl.yaml         | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
new file mode 100644
index 000000000000..1b1b446cd498
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 SoC pin controller
+
+maintainers:
+  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
+
+description: |
+  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
+
+  The TH1520 has 3 groups of pads each controlled from different memory ranges.
+  Confusingly the memory ranges are named
+    PADCTRL_AOSYS  -> PAD Group 1
+    PADCTRL1_APSYS -> PAD Group 2
+    PADCTRL0_APSYS -> PAD Group 3
+
+  Each pad can be muxed individually to up to 5 different functions. For most
+  pads only a few of those 5 configurations are valid though, and a few pads in
+  group 1 does not support muxing at all.
+
+  Pinconf is fairly regular except for a few pads in group 1 that either can't
+  be configured or has some special functions. The rest have configurable drive
+  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
+  addition to a special strong pull up.
+
+  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
+  are then meant to be used by the audio co-processor. Each such pad can then
+  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
+  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
+  also configured in different registers. All of this is done from a different
+  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-group1-pinctrl
+      - thead,th1520-group2-pinctrl
+      - thead,th1520-group3-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-[0-9]+$':
+    type: object
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+        description:
+          A pinctrl node should contain at least one subnode describing one
+          or more pads and their associated pinmux and pinconf settings.
+
+        properties:
+          pins:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description: List of pads that properties in the node apply to.
+
+          function:
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ "0", "1", "2", "3", "4", "5" ]
+            description: The mux function to select for the given pins.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            maximum: 1
+
+          thead,strong-pull-up:
+            oneOf:
+              - type: boolean
+              - $ref: /schemas/types.yaml#/definitions/uint32
+                enum: [ 0, 2100 ]
+            description: Enable or disable strong 2.1kOhm pull-up.
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    padctrl0_apsys: pinctrl@ec007000 {
+        compatible = "thead,th1520-group3-pinctrl";
+        reg = <0xec007000 0x1000>;
+
+        uart0_pins: uart0-0 {
+            tx-pins {
+                pins = "UART0_TXD";
+                function = "0";
+                bias-disable;
+                drive-strength = <3>;
+                input-disable;
+                input-schmitt-disable;
+                slew-rate = <0>;
+            };
+
+            rx-pins {
+                pins = "UART0_RXD";
+                function = "0";
+                bias-disable;
+                drive-strength = <1>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+            };
+        };
+    };
+
+    padctrl1_apsys: pinctrl@e7f3c000 {
+        compatible = "thead,th1520-group2-pinctrl";
+        reg = <0xe7f3c000 0x1000>;
+
+        i2c5_pins: i2c5-0 {
+            i2c-pins {
+                pins = "QSPI1_CSN0",    /* I2C5_SCL */
+                       "QSPI1_D0_MOSI"; /* I2C5_SDA */
+                function = "2";
+                bias-disable;
+                drive-strength = <7>;
+                input-enable;
+                input-schmitt-enable;
+                slew-rate = <0>;
+                thead,strong-pull-up;
+            };
+        };
+    };
-- 
2.40.1


